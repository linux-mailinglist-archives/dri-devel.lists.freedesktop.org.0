Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C81A744611
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 04:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D483B10E52E;
	Sat,  1 Jul 2023 02:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80DF10E530;
 Sat,  1 Jul 2023 02:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FpvV1NRn92NjSFc/aa9HU0kB1fj/LcwCHP8r7t79LKQ=; b=IQwSBaK4dtvffDRp6/HaKl/E7a
 HJgIluzVyRfp+1nipl9ZO4ikcNp8vPJyIiK/sZ+AWWQz+fEHLF82HpYZdnE/xq61NQ0xOcAkPXuhj
 pNuMDYbZBfQX4QF3DdXJRehvlT1FOK1ExMYnBSGJvkYGAeE+wqpoqi7VxqUovfVXj7uiUZRvZ7oj+
 HIgVNImcyhMGUOTsesmF9Nc19mBFj+GqABzhb0pwSEHz3Udeit2RPm1/3ygDq4s42EMG4D4FvKMjA
 KYl6+k6jm1dmt0Z+IHtvyZSQP2YpdRPA/xy2zERwziURYskIVdOjutkBqjj87mWiK5IG4ArTQ9aVz
 oswa/ALg==;
Received: from [187.74.70.209] (helo=steammachine.lan)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qFQ3g-006abr-5T; Sat, 01 Jul 2023 04:09:56 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org
Subject: [PATCH v4 6/6] drm/doc: Define KMS atomic state set
Date: Fri, 30 Jun 2023 23:09:17 -0300
Message-ID: <20230701020917.143394-7-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230701020917.143394-1-andrealmeid@igalia.com>
References: <20230701020917.143394-1-andrealmeid@igalia.com>
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
 Italo Nicola <italonicola@collabora.com>, Randy Dunlap <rdunlap@infradead.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, hwentlan@amd.com, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Specify how the atomic state is maintained between userspace and
kernel, plus the special case for async flips.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
v4: new patch
---
 Documentation/gpu/drm-uapi.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 65fb3036a580..5464376051cc 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -486,3 +486,22 @@ and the CRTC index is its position in this array.
 
 .. kernel-doc:: include/uapi/drm/drm_mode.h
    :internal:
+
+KMS atomic state
+================
+
+If a userspace using the DRM atomic API would like to change the modeset, it
+needs to do in an atomic way, changing all desired properties in a single
+commit. Following commits may contain the same properties again, as if they were
+new. The kernel can then judge if those properties requires modesetting and real
+changes, or it's just the same state as before. In summary, userspace commits do
+not need to set the minimal state as possible and can commit redundant
+information, and the kernel will ignore it.
+
+An observation must be made for atomic operations with DRM_MODE_PAGE_FLIP_ASYNC.
+In such scenarios properties values can be sent, but the if they change
+something, the kernel will reject the flip. This is done because property
+changes can lead to modesetting, that would defeat the goal of flipping as fast
+as possible. The only exceptions are the framebuffer ID to be flipped to and
+mode IDs changes, which could be referring to an identical mode, thus not
+requiring modeset.
-- 
2.41.0

