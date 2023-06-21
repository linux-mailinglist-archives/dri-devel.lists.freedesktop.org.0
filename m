Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283A737873
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 02:58:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907D010E38E;
	Wed, 21 Jun 2023 00:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF9410E38A;
 Wed, 21 Jun 2023 00:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/U+iXS7cPu32eSBwTnxjvnLVI4LNUEgzC2fiTpf+640=; b=ViYBsyZduSvJIePE3SHI9Xcseq
 ZUGzW4FIeLj6u40vb7Mut5GmR+n+ppjsfMBRmCJauD8lwHce6uWkVLA4p0l7j9xhwZT0ECXhrIWT7
 UPL10h29Wx2SGRQe44eJHve6Y9Ho1ZOcuZZJnYXeqoPcPejsj46pXh7CcLPHEoOKfHKRqUei5OfTp
 heAeYym/HcDNnNGapEkznLmRZ1gA3kvbLGamL9Gyh9JcOUQJswEbq6KL9O8EHF50qBeb8hgNMazRh
 LoyI85oR2Mu0idXEWvjbf/BHvEsbLvzG3ixyv1NVSv4hzYhVGmg0cp1s1SvlgF4A2QA076u0ty0Ef
 tlxTUvyQ==;
Received: from [179.113.218.86] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qBmB4-0011pg-5q; Wed, 21 Jun 2023 02:58:30 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH v3 1/4] drm/doc: Document DRM device reset expectations
Date: Tue, 20 Jun 2023 21:57:16 -0300
Message-ID: <20230621005719.836857-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230621005719.836857-1-andrealmeid@igalia.com>
References: <20230621005719.836857-1-andrealmeid@igalia.com>
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
 =?UTF-8?q?=27Marek=20Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Create a section that specifies how to deal with DRM device resets for
kernel and userspace drivers.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 Documentation/gpu/drm-uapi.rst | 65 ++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 65fb3036a580..da4f8a694d8d 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -285,6 +285,71 @@ for GPU1 and GPU2 from different vendors, and a third handler for
 mmapped regular files. Threads cause additional pain with signal
 handling as well.
 
+Device reset
+============
+
+The GPU stack is really complex and is prone to errors, from hardware bugs,
+faulty applications and everything in between the many layers. To recover
+from this kind of state, sometimes is needed to reset the device. This section
+describes what's the expectations for DRM and usermode drivers when a device
+resets and how to propagate the reset status.
+
+Kernel Mode Driver
+------------------
+
+The KMD is responsible for checking if the device needs a reset, and to perform
+it as needed. Usually a hung is detected when a job gets stuck executing. KMD
+then update it's internal reset tracking to be ready when userspace asks the
+kernel about reset information. Drivers should implement the DRM_IOCTL_GET_RESET
+for that.
+
+User Mode Driver
+----------------
+
+The UMD should check before submitting new commands to the KMD if the device has
+been reset, and this can be checked more often if it requires to. The
+DRM_IOCTL_GET_RESET is the default interface for those kind of checks. After
+detecting a reset, UMD will then proceed to report it to the application using
+the appropriated API error code, as explained in the bellow section about
+robustness.
+
+Robustness
+----------
+
+The only way to try to keep an application working after a reset is if it
+complies with the robustness aspects of the graphical API that is using.
+
+Graphical APIs provide ways to application to deal with device resets. However,
+there's no guarantee that the app will be correctly using such features, and UMD
+can implement policies to close the app if it's a repeating offender, likely in
+a broken loop. This is done to ensure that it doesn't keeps blocking the user
+interface to be correctly displayed.
+
+OpenGL
+~~~~~~
+
+Apps using OpenGL can rely on ``GL_ARB_robustness`` to be robust. This extension
+tells if a reset has happened, and if so, all the context state is considered
+lost and the app proceeds by creating new ones. If robustness isn't in use, UMD
+will terminate the app when a reset is detected, giving that the contexts are
+lost and the app won't be able to figure this out and recreate the contexts.
+
+Vulkan
+~~~~~~
+
+Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submissions.
+This error code means, among other things, that a device reset has happened and
+it needs to recreate the contexts to keep going.
+
+Reporting resets causes
+-----------------------
+
+Apart from propagating the reset through the stack so apps can recover, it's
+really useful for driver developers to learn more about what caused the reset in
+first place. DRM devices should make use of devcoredump to store relevant
+information about the reset, so this information can be added to user bug
+reports.
+
 .. _drm_driver_ioctl:
 
 IOCTL Support on Device Nodes
-- 
2.41.0

