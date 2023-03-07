Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578A06AE260
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2233E10E4A1;
	Tue,  7 Mar 2023 14:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC3410E4BB
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:28:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 10542426FB;
 Tue,  7 Mar 2023 14:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199298;
 bh=MCSNjz0XdUk8QMw6DI+sZ1Eor9e+x9M609zyvRsQaWY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=UbEW7nheyb0tOOAygWaSPCZ+F55R6/L037rcLQv+Flnc4JXqhYMzSr0ujBWUAvUtY
 /Yc3Zf8Wp+e5wAkA0caTWNAvHNUYTAHI7RPinFoVJDVSncnHyhMu80eFQcet54/Qup
 6KxeRC+wlz8S1quYAcncu1i8tEl6ddeRK6zpRS9ELDktUWB763a/cIoAqoqBLKd0ZY
 CC54HSd0IMFq7UN3me2x2MhagmLdM4mOFAEQlgdJzf10bDCALIdJEBtAh6wES8KDxP
 dHJOPH2J/BuKksEJPo8MtoA1aKpeNKOLxpwJGKMShbj5usWTz5hi7SwD2pYAw6OwfN
 n1AwDNbf6T3NA==
From: Asahi Lina <lina@asahilina.net>
Date: Tue, 07 Mar 2023 23:25:38 +0900
Subject: [PATCH RFC 13/18] drm/gem: Add a flag to control whether objects
 can be exported
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-rust-drm-v1-13-917ff5bc80a8@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
In-Reply-To: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199191; l=1912;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=MCSNjz0XdUk8QMw6DI+sZ1Eor9e+x9M609zyvRsQaWY=;
 b=xT82aRgu2Cl7t2vQWiQlj1BNR6l2Ur2R/6RgHsZ1B0Ituy+ZDVtv/o0c0RjUcXwEGpBtoJKVX
 +XfQ4py0kEHAfwGzh14DmvngfQjE0HhULuaio4lqxNvMzYCWNi4IIAA
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-sgx@vger.kernel.org,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers may want to support driver-private objects, which cannot be
shared. This allows them to share a single lock and enables other
optimizations.

Add an `exportable` field to drm_gem_object, which blocks PRIME export
if set to false. It is initialized to true in
drm_gem_private_object_init.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/drm_gem.c   | 1 +
 drivers/gpu/drm/drm_prime.c | 5 +++++
 include/drm/drm_gem.h       | 8 ++++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7a3cb08dc942..152ad9295a8d 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -166,6 +166,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
 
 	drm_vma_node_reset(&obj->vma_node);
 	INIT_LIST_HEAD(&obj->lru_node);
+	obj->exportable = true;
 }
 EXPORT_SYMBOL(drm_gem_private_object_init);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index f924b8b4ab6b..9d2dd982580e 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -391,6 +391,11 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
 		return dmabuf;
 	}
 
+	if (!obj->exportable) {
+		dmabuf = ERR_PTR(-EINVAL);
+		return dmabuf;
+	}
+
 	if (obj->funcs && obj->funcs->export)
 		dmabuf = obj->funcs->export(obj, flags);
 	else
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 772a4adf5287..852dec3cf763 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -361,6 +361,14 @@ struct drm_gem_object {
 	 * The current LRU list that the GEM object is on.
 	 */
 	struct drm_gem_lru *lru;
+
+	/**
+	 * @exportable:
+	 *
+	 * Whether this GEM object can be exported via the drm_gem_object_funcs->export
+	 * callback. Defaults to true.
+	 */
+	bool exportable;
 };
 
 /**

-- 
2.35.1

