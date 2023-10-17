Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6817CBF4E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 11:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5E910E2A6;
	Tue, 17 Oct 2023 09:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C2A10E29A;
 Tue, 17 Oct 2023 09:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bv4UhAyma+StQ1C/srhttolaGUlSYmJrKK1FzAxXGo0=; b=bGnrI2i74XpILAOrXy08pbTd/v
 81bMUL3IdoVDj6Bn0dsuwq+GforHlb+xY+LF8RrY2foCmwoMgFc+t7Oyp6z6N4sl6/nJ1aCYM1nqN
 2ThxwX1I3zFVoBjU0mVJmu5Uljc14aHgdAWSITF+8T+9JvaNaEzdFL57sJJvSRU8RaFU+FIJwb5ZA
 DQ6S3DVsYafkafX3WrYvKpbdWdIVnptDnsugR+LKHn8lFfyEWTQYLT9LyKnO3aqdjEH/DXciYBOU9
 Fgsg6X8+nHnDw+QuEMeYxc9Uxi8/7FRH2U2876fRjVxjZNXDlEw67P3Y+ZPuWhNbAu/fWs+sr/Ppe
 Qt8syUsw==;
Received: from 167.red-81-39-185.dynamicip.rima-tde.net ([81.39.185.167]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qsgNe-001ODF-Lc; Tue, 17 Oct 2023 11:28:50 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/6] drm/doc: Define KMS atomic state set
Date: Tue, 17 Oct 2023 11:28:36 +0200
Message-ID: <20231017092837.32428-6-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017092837.32428-1-andrealmeid@igalia.com>
References: <20231017092837.32428-1-andrealmeid@igalia.com>
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
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>, hwentlan@amd.com,
 christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pekka Paalanen <pekka.paalanen@collabora.com>

Specify how the atomic state is maintained between userspace and
kernel, plus the special case for async flips.

Signed-off-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v7:
- add a note that drivers can make exceptions for ad-hoc prop changes
- add a note about flipping the same FB_ID as a no-op
---
 Documentation/gpu/drm-uapi.rst | 47 ++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 632989df3727..34bd02270ee7 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -570,3 +570,50 @@ dma-buf interoperability
 
 Please see Documentation/userspace-api/dma-buf-alloc-exchange.rst for
 information on how dma-buf is integrated and exposed within DRM.
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
+the committed property settings done on top. The kernel will try to avoid
+no-operation changes, so it is safe for userspace to send redundant property
+settings.  However, not every situation allows for no-op changes, due to the
+need to acquire locks for some attributes. Userspace needs to be aware that some
+redundant information might result in oversynchronization issues.  No-operation
+changes do not count towards actually needed changes, e.g.  setting MODE_ID to a
+different blob with identical contents as the current KMS state shall not be a
+modeset on its own. As a special exception for VRR needs, explicitly setting
+FB_ID to its current value is not a no-op.
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
+rejected. Each driver may relax this restriction if they have guarantees that
+such property change doesn't cause modesets. Userspace can use TEST_ONLY commits
+to query the driver about this.
-- 
2.42.0

