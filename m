Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3DCA10885
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 15:06:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F90710E34B;
	Tue, 14 Jan 2025 14:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="o1bBSEUj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE0D10E339
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 14:06:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0814BC0002;
 Tue, 14 Jan 2025 14:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736863562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwyMvb7WmuoyUdDRn3y5BTnUCKpfTEDcuYqfAhtkcsU=;
 b=o1bBSEUjKLNxd1rVcbYexTRY7zUiFlxrrNLv5UsvKgPfh0bYCvoD005lZsV1tp630DdDL3
 zy92/dt1sj4+SYQ02GSwF5wVsGd+VW1ABkNRc9iFG2VxEOhvZTSpRIyTEUfmk1ZUZLvGbl
 DLCJt0TcJoxAv/JAedzi8nVKPFm2INWWfVcMu++D83I74Opqb/d1yAJRnI/CyYORIch1EP
 xbnGNTdgkh7gsjuB2GPgTOKQy2XggALV1A1OOywLWnw/fkbKkNhE7/W4HoRS7D7jjGT6Dv
 37RvOn+KYp+Bx25iH9NGrvzRS+WWmM6yMnNFEzw+FgsKPry43yKRsnXZZ8s7rQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 14 Jan 2025 15:05:45 +0100
Subject: [PATCH v8 3/8] drm/managed: Add DRM-managed
 alloc_ordered_workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-google-vkms-managed-v8-3-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
In-Reply-To: <20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2036;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Kt1qbWns/FoZtH6BOWeZX7TbcSATvPd2mBrp/gGH/rU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhm9EsXLjJCtaD35sZUOEmmhEt2Oz5eGPvFAGb
 RrBJLbQyc6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4ZvRAAKCRAgrS7GWxAs
 4itaD/9seH4WOXtXF8SaGpYWHBQLR02ReKaRZSgijav5IZpsZLYmTf5RRUVGdzE1HCovxxl50dX
 vk0Z3sqS6iAalSD6SqxVJLU7/rs124ymIwhpaxkwZ0V7H8cqE/h7HMXBUy6oqBJLt0J+26eGJeJ
 7RlThR3uKJ78wEEe7Xxf4iaFmeqc+WtS9kOfvXvGXC02AvgnM3j13HpOGrloIiKOkQwOLGeP1VM
 Am5+7fE9SrTXKma37RDVPueMIYOKMmoCHY/vSkpW+CzDj/T4S+WoWe2Ejk6fuFsXhDc5W2GIa5z
 RlHT7NTRnN2YcBfgbQLUUP0+bALX+TyY9AGhRQFmf9UhW2jAuamsM/wcoQ/ALM62u0Xj7ZkSw1z
 2XZmauHTXvxmeb/LkHjg1qoT0TfkeUy3V5rvtXzc62pNMf9N46EdwYKIYUvJC5ZEtNnGWgDdUVO
 EK82Y65zEz9YVz+XqX/tvMnEHuRUq1jjXvyZwpcmu1uRgSpsTeREd5smSLhJ3JLSx+dHYLYRxYD
 DlilzdDh2sv+eoSGxBzFwAwl95vLQch58LZoBv3iqkm/u9xJf1q5IeW+iPLk1Ugyqk62tclx85Z
 TMt95N8qQBkFYav1O5vGE+gg4rZo7g2cnDKdNaBgO/JzEDn4ekvHg6/a4Uy+0uPwky6Vc37CW29
 AZDrmidjPG64Kbw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add drmm_alloc_ordered_workqueue(), a helper that provides managed ordered
workqueue cleanup. The workqueue will be destroyed with the final
reference of the DRM device.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

---

Hi Thomas,

I noted that you wanted to mark this as Reviewed, but as this was not
the complete patch, I prefered to have a confirmation before merging the
patch.

Thanks for your time,
Louis Chauvet
---
 drivers/gpu/drm/drm_managed.c |  8 ++++++++
 include/drm/drm_managed.h     | 12 ++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 79ce86a5bd67a7201f5d60550a12364f2628e0ec..1589c28410f23b5a1e93dd1638420b3ae5c4b854 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -310,3 +310,11 @@ void __drmm_mutex_release(struct drm_device *dev, void *res)
 	mutex_destroy(lock);
 }
 EXPORT_SYMBOL(__drmm_mutex_release);
+
+void __drmm_destroy_workqueue(struct drm_device *device, void *res)
+{
+	struct workqueue_struct *wq = res;
+
+	destroy_workqueue(wq);
+}
+EXPORT_SYMBOL(__drmm_destroy_workqueue);
diff --git a/include/drm/drm_managed.h b/include/drm/drm_managed.h
index f547b09ca0239dd7c4fb734038bae4438321395c..96d9b0e811675fe66d5d48f02b17bc7de2ac437e 100644
--- a/include/drm/drm_managed.h
+++ b/include/drm/drm_managed.h
@@ -127,4 +127,16 @@ void __drmm_mutex_release(struct drm_device *dev, void *res);
 	drmm_add_action_or_reset(dev, __drmm_mutex_release, lock);	     \
 })									     \
 
+void __drmm_destroy_workqueue(struct drm_device *device, void *wq);
+
+#define drmm_alloc_ordered_workqueue(dev, fmt, flags, args...)					\
+	({											\
+		struct workqueue_struct *wq = alloc_ordered_workqueue(fmt, flags, ##args);	\
+		wq ? ({										\
+			int ret = drmm_add_action_or_reset(dev, __drmm_destroy_workqueue, wq);	\
+			ret ? ERR_PTR(ret) : wq;						\
+		}) :										\
+			wq;									\
+	})
+
 #endif

-- 
2.47.1

