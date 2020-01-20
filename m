Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DCE14309A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 18:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34FDA6EA27;
	Mon, 20 Jan 2020 17:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CCDC6EA1C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 17:06:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: ezequiel) with ESMTPSA id 588B62912EE
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/5] component: Add an API to cleanup before unbind
Date: Mon, 20 Jan 2020 14:05:58 -0300
Message-Id: <20200120170602.3832-2-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200120170602.3832-1-ezequiel@collabora.com>
References: <20200120170602.3832-1-ezequiel@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 20 Jan 2020 17:09:27 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some users of the component API have a special model
for the allocation and release of its resources:
resources are allocated by an API but then
released by other means.

This contrasts with the current component API
assumption: .unbind must undo everything that .bind did.

An example of this is the DRM framework, which expects
registered objects (connectors, planes, CRTCs, etc)
to be released by respective drm_xxx_funcs.destroy hooks.

The drm_xxx_funcs.destroy call is done either directly
by drm_mode_config_cleanup() or in a refcounted fashion,
depending on the type of object.

For example, a DRM CRTC object is registered by
drm_crtc_init_with_planes(), and then released by drm_crtc_cleanup(),
which is normally called from the drm_crtc_funcs.destroy hook.

Now, in this model, drm_mode_config_cleanup() should
always be called before component_unbind() to avoid
use-after-free situations (because each component
has a devres group).

However, component_bind_all() calls component_unbind
on binded components, if any component in the chain
fails to bind.

In order to allow this special case, and following Alan Kay:

  "simple things should be simple, complex things should be possible"

introduce an extension to component_bind_all, which takes an extra
cleanup callback, to be called when binding fails to perform
extra cleanup steps.

This new API allows the following simple pattern:

void unbind_cleanup(...)
{
        drm_mode_config_cleanup(drm_dev);
}

int foo_bind()
{
	component_bind_all_or_cleanup(dev, drm_dev, unbind_cleanup);
}

void foo_unbind()
{
        drm_mode_config_cleanup(drm_dev);
        component_unbind_all(dev, drm_dev);
}

Each DRM component then uses the respective .destroy
hooks to destroy DRM resources, and the .unbind
hooks to release non-DRM resources.

Arguably, this could be viewed as Very Ugly. However, it handles
this complex case, making it possible to fix the current
unbind crashes that some DRM drivers suffer from,
in a non-invasive way, keeping the DRM resource handling model.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/base/component.c  |  9 +++++++--
 include/linux/component.h | 10 +++++++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 532a3a5d8f63..371cff9208cf 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -622,12 +622,14 @@ static int component_bind(struct component *component, struct master *master,
  * component_bind_all - bind all components of an aggregate driver
  * @master_dev: device with the aggregate driver
  * @data: opaque pointer, passed to all components
+ * @cleanup: optional cleanup callback.
  *
  * Binds all components of the aggregate @dev by passing @data to their
  * &component_ops.bind functions. Should be called from
  * &component_master_ops.bind.
  */
-int component_bind_all(struct device *master_dev, void *data)
+int component_bind_all_or_cleanup(struct device *master_dev,
+				  void *data, void (*cleanup)(void *data))
 {
 	struct master *master;
 	struct component *c;
@@ -650,6 +652,9 @@ int component_bind_all(struct device *master_dev, void *data)
 		}
 
 	if (ret != 0) {
+		if (cleanup)
+			cleanup(data);
+
 		for (; i > 0; i--)
 			if (!master->match->compare[i - 1].duplicate) {
 				c = master->match->compare[i - 1].component;
@@ -659,7 +664,7 @@ int component_bind_all(struct device *master_dev, void *data)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(component_bind_all);
+EXPORT_SYMBOL_GPL(component_bind_all_or_cleanup);
 
 static int __component_add(struct device *dev, const struct component_ops *ops,
 	int subcomponent)
diff --git a/include/linux/component.h b/include/linux/component.h
index 16de18f473d7..1a5c7b772de3 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -38,7 +38,15 @@ int component_add_typed(struct device *dev, const struct component_ops *ops,
 	int subcomponent);
 void component_del(struct device *, const struct component_ops *);
 
-int component_bind_all(struct device *master, void *master_data);
+int component_bind_all_or_cleanup(struct device *master,
+				  void *master_data,
+				  void (*cleanup)(void *data));
+
+static inline int component_bind_all(struct device *master, void *master_data)
+{
+	return component_bind_all_or_cleanup(master, master_data, NULL);
+}
+
 void component_unbind_all(struct device *master, void *master_data);
 
 struct master;
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
