Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DC16A4C6C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 21:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2779F10E429;
	Mon, 27 Feb 2023 20:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 086CD10E418;
 Mon, 27 Feb 2023 20:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PCbb2BiC5iSOL8kwHoBIumUlWcLk+H657ge7raRiJao=; b=kTSICWqflGTdsSt539NcYACUrW
 vjripr70AuX6Pr9oATfuY/txFwIPQELz0KLA1yEOEpkryga+NjalEfXWx4FZU75N6YQJH+7PCTuXR
 xuoUhUqFb+KjkKO5AFKphB/icMd+IEWlP7hxVWJtDFtdRXaEW8VzbqAg0Z9jXCiVgw7jkTwheWMla
 6VOG2/7S9Q8ckGbsY4OTJSoW0L38Cq3gVuWYyQ551pvqBJhpQG0eNj4CFa3h+mEcbn5uPegg6K5ag
 E39dm7+WDMwAeX15uBd2cICUmmELP7JxGgxbR7lJdMUg6G7FwbBni97gkmTDMA3muUZrxiMvAyXnM
 p5bz8HxA==;
Received: from [181.199.58.72] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pWkI6-00H62x-3e; Mon, 27 Feb 2023 21:40:10 +0100
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] drm/doc: Document DRM device reset expectations
Date: Mon, 27 Feb 2023 15:40:00 -0500
Message-Id: <20230227204000.56787-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227204000.56787-1-andrealmeid@igalia.com>
References: <20230227204000.56787-1-andrealmeid@igalia.com>
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
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <maraeo@gmail.com>,
 amaranath.somalapuram@amd.com, Pekka Paalanen <ppaalanen@gmail.com>,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 contactshashanksharma@gmail.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a section that specifies how to deal with DRM device resets for
kernel and userspace drivers.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 Documentation/gpu/drm-uapi.rst | 51 ++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 65fb3036a580..3d6c3ed392ea 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -285,6 +285,57 @@ for GPU1 and GPU2 from different vendors, and a third handler for
 mmapped regular files. Threads cause additional pain with signal
 handling as well.
 
+Device reset
+============
+
+The GPU stack is really complex and is prone to errors, from hardware bugs,
+faulty applications and everything in the many layers in between. To recover
+from this kind of state, sometimes is needed to reset the GPU. Unproper handling
+of GPU resets can lead to an unstable userspace. This section describes what's
+the expected behaviour from DRM drivers to do in those situations, from usermode
+drivers and compositors as well. The end goal is to have a seamless experience
+as possible, either the stack being able to recover itself or resetting to a new
+stable state.
+
+Robustness
+----------
+
+First of all, application robust APIs, when available, should be used. This
+allows the application to correctly recover and continue to run after a reset.
+Apps that doesn't use this should be promptly killed when the kernel driver
+detects that it's in broken state. Specifically guidelines for some APIs:
+
+- OpenGL: KMD signals the abortion of submitted commands and the UMD should then
+  react accordingly and abort the application.
+
+- Vulkan: Assumes that every app is able to deal with ``VK_ERROR_DEVICE_LOST``.
+  If it doesn't do it right, it's considered a broken application and UMD will
+  deal with it, aborting it.
+
+Kernel mode driver
+------------------
+
+The KMD must be able to detect that something is wrong with the application
+and that a reset is needed to take place to recover the device (e.g. an endless
+wait). It needs to properly track the context that is broken and mark it as
+dead, so any other syscalls to that context should be further rejected. The
+other contexts should be preserved when possible, avoid crashing the rest of
+userspace. KMD can ban a file descriptor that keeps causing resets, as it's
+likely in a broken loop.
+
+User mode driver
+----------------
+
+During a reset, UMD should be aware that rejected syscalls indicates that the
+context is broken and for robust apps the recovery should happen for the
+context. Non-robust apps must be terminated.
+
+Compositors
+-----------
+
+Compositors should be robust as well to properly deal with its errors.
+
+
 .. _drm_driver_ioctl:
 
 IOCTL Support on Device Nodes
-- 
2.39.2

