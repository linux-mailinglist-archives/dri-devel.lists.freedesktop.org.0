Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43C174B9AB
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jul 2023 00:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D426E10E613;
	Fri,  7 Jul 2023 22:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D993E10E60F;
 Fri,  7 Jul 2023 22:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ILhK3ntOSguFvvoL3dtIQ/0orxl4TRRaxUfEny2T4hQ=; b=luAS5a/ov3Z7w1pwXMMISdcq0X
 CmkBLudpjLqOfv+LJLAAHgZSMAOwntplymB5St0mZV6gheeahYHsf0oKk1dEbckva2adI1sAtldg0
 zSAfkyB5qESAnGy93JB4hhHc7vEiAIq1eGRa5uuHhV8Ye1zRG/hGSONknqFrN7KJDUsh41ixqVhCn
 7pEMfWtuB6/0Rb4vY44mVDt1yIc9YleiwG15e+Ed80YgxVvmPu+KiZZx1W017yqrMNixeQtYjnRJr
 5oOG8jA6fnQ2CMTbxf5k92qZOx0ViYm1r5jHbNCXCuZSKJ8sQ4SM5777oDp3S9kiK0I4V0eDj8DvU
 bbpZeGCQ==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qHu8z-00AP6e-SZ; Sat, 08 Jul 2023 00:41:42 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org
Subject: [PATCH v5 6/6] drm/doc: Define KMS atomic state set
Date: Fri,  7 Jul 2023 19:40:59 -0300
Message-ID: <20230707224059.305474-7-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707224059.305474-1-andrealmeid@igalia.com>
References: <20230707224059.305474-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Randy Dunlap <rdunlap@infradead.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 hwentlan@amd.com, kernel-dev@igalia.com, alexander.deucher@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pekka Paalanen <pekka.paalanen@collabora.com>

Specify how the atomic state is maintained between userspace and
kernel, plus the special case for async flips.

Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v4: total rework by Pekka
---
 Documentation/gpu/drm-uapi.rst | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 65fb3036a580..6a1662c08901 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -486,3 +486,44 @@ and the CRTC index is its position in this array.
 
 .. kernel-doc:: include/uapi/drm/drm_mode.h
    :internal:
+
+KMS atomic state
+================
+
+An atomic commit can change multiple KMS properties in an atomic fashion,
+without ever applying intermediate or partial state changes.  Either the whole
+commit succeeds or fails, and it will never be applied partially. This is the
+fundamental improvement of the atomic API over the older non-atomic API which is
+referred to as the "legacy API".  Applying intermediate state could unexpectedly
+fail, cause visible glitches, or delay reaching the final state.
+
+An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, which means the
+complete state change is validated but not applied.  Userspace should use this
+flag to validate any state change before asking to apply it. If validation fails
+for any reason, userspace should attempt to fall back to another, perhaps
+simpler, final state.  This allows userspace to probe for various configurations
+without causing visible glitches on screen and without the need to undo a
+probing change.
+
+The changes recorded in an atomic commit apply on top the current KMS state in
+the kernel. Hence, the complete new KMS state is the complete old KMS state with
+the committed property settings done on top. The kernel will automatically avoid
+no-operation changes, so it is safe and even expected for userspace to send
+redundant property settings.  No-operation changes do not count towards actually
+needed changes, e.g.  setting MODE_ID to a different blob with identical
+contents as the current KMS state shall not be a modeset on its own.
+
+A "modeset" is a change in KMS state that might enable, disable, or temporarily
+disrupt the emitted video signal, possibly causing visible glitches on screen. A
+modeset may also take considerably more time to complete than other kinds of
+changes, and the video sink might also need time to adapt to the new signal
+properties. Therefore a modeset must be explicitly allowed with the flag
+DRM_MODE_ATOMIC_ALLOW_MODESET.  This in combination with
+DRM_MODE_ATOMIC_TEST_ONLY allows userspace to determine if a state change is
+likely to cause visible disruption on screen and avoid such changes when end
+users do not expect them.
+
+An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed to
+effectively change only the FB_ID property on any planes. No-operation changes
+are ignored as always. Changing any other property will cause the commit to be
+rejected.
-- 
2.41.0

