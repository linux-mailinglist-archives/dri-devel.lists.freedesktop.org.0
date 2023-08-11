Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DD5779761
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 20:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0080410E6FF;
	Fri, 11 Aug 2023 18:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F85710E6F0;
 Fri, 11 Aug 2023 18:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rpc/DUjgplEAz24IA0Nc53yNh/mqO8R39tjBJ2uiGRg=; b=B7KpOWP1f3ggX3pO/4mshWOYgd
 HBEL/3KxX/u63kEe81UVBGhS/FchIuyat7Pwv5s6srtdTgIjWAwRLenKINChd8PE7LMT66fHv53ov
 zcCFtqTr+4eYd3S5U/6wF5bjBssRB7mU5044QY51sq1+t9Jf52aJ09QkbDV0C2M195Njw3wHhEfCx
 ADSQC/FfRemwuYHs2Tg5pPTaWpk8kAHc3m2SX6P4LpuUamh7ThTo+63AGkTH0kcp+iwrtZ73zQy39
 lgD+bBrBHTS4aerUDGUJZS0YNkDBCHcsm1UQnLVxrmnM2AY18LN1NHYoy6PIXrbVHxmUqJyNN5C3L
 +CuiPoQQ==;
Received: from [191.193.179.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qUXI4-00HGeL-GV; Fri, 11 Aug 2023 20:55:16 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6] drm/doc: Document DRM device reset expectations
Date: Fri, 11 Aug 2023 15:55:08 -0300
Message-ID: <20230811185508.252194-1-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
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
Cc: pierre-eric.pelloux-prayer@amd.com, Randy Dunlap <rdunlap@infradead.org>,
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

Changes:
 - Due to substantial changes in the content, dropped Pekka's Acked-by
 - Grammar fixes (Randy)
 - Add paragraph about disabling device resets
 - Add note about integrating reset tracking in drm/sched
 - Add note that KMD should return failure for contexts affected by
   resets and UMD should check for this
 - Add note about lack of consensus around what to do about non-robust
   apps

v5: https://lore.kernel.org/dri-devel/20230627132323.115440-1-andrealmeid@igalia.com/
---
 Documentation/gpu/drm-uapi.rst | 77 ++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 65fb3036a580..6bfaf7d4c074 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -285,6 +285,83 @@ for GPU1 and GPU2 from different vendors, and a third handler for
 mmapped regular files. Threads cause additional pain with signal
 handling as well.
 
+Device reset
+============
+
+The GPU stack is really complex and is prone to errors, from hardware bugs,
+faulty applications and everything in between the many layers. Some errors
+require resetting the device in order to make the device usable again. This
+section describes the expectations for DRM and usermode drivers when a
+device resets and how to propagate the reset status.
+
+Device resets can not be disabled without tainting the kernel, which can lead to
+hanging the entire kernel through shrinkers/mmu_notifiers. Userspace role in
+device resets is to propagate the message to the application and apply any
+special policy for blocking guilty applications, if any. Corollary is that
+debugging a hung GPU context require hardware support to be able to preempt such
+a GPU context while it's stopped.
+
+Kernel Mode Driver
+------------------
+
+The KMD is responsible for checking if the device needs a reset, and to perform
+it as needed. Usually a hang is detected when a job gets stuck executing. KMD
+should keep track of resets, because userspace can query any time about the
+reset status for a specific context. This is needed to propagate to the rest of
+the stack that a reset has happened. Currently, this is implemented by each
+driver separately, with no common DRM interface. Ideally this should be properly
+integrated at DRM scheduler to provide a common ground for all drivers. After a
+reset, KMD should reject new command submissions for affected contexts.
+
+User Mode Driver
+----------------
+
+After command submission, UMD should check if the submission was accepted or
+rejected. After a reset, KMD should reject submissions, and UMD can issue an
+ioclt to the KMD to check the reset status, and this can be checked more often
+if the UMD requires it. After detecting a reset, UMD will then proceed to report
+it to the application using the appropriate API error code, as explained in the
+section below about robustness.
+
+Robustness
+----------
+
+The only way to try to keep an application working after a reset is if it
+complies with the robustness aspects of the graphical API that it is using.
+
+Graphical APIs provide ways to applications to deal with device resets. However,
+there is no guarantee that the app will use such features correctly, and a
+userspace that doesn't support robust interfaces (like an non-robust
+OpenGL context or API without any robustness support like libva) leave the
+robustness handling entirely to the userspace driver. There is no strong
+community consensus on what the userspace driver should do in that case,
+since all reasonable approaches have some clear downsides.
+
+OpenGL
+~~~~~~
+
+Apps using OpenGL should use the available robust interfaces, like the
+extension ``GL_ARB_robustness`` (or ``GL_EXT_robustness`` for OpenGL ES). This
+interface tells if a reset has happened, and if so, all the context state is
+considered lost and the app proceeds by creating new ones. There's no consensus
+on what to do to if robustness is not in use.
+
+Vulkan
+~~~~~~
+
+Apps using Vulkan should check for ``VK_ERROR_DEVICE_LOST`` for submissions.
+This error code means, among other things, that a device reset has happened and
+it needs to recreate the contexts to keep going.
+
+Reporting causes of resets
+--------------------------
+
+Apart from propagating the reset through the stack so apps can recover, it's
+really useful for driver developers to learn more about what caused the reset in
+the first place. DRM devices should make use of devcoredump to store relevant
+information about the reset, so this information can be added to user bug
+reports.
+
 .. _drm_driver_ioctl:
 
 IOCTL Support on Device Nodes
-- 
2.41.0

