Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 578117DB51C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 09:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D251810E23C;
	Mon, 30 Oct 2023 08:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9F210E23E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vxabZ6HbuSoBariuz4nmdNm5L7vRrUVpBg8Q/aMCne4=; b=UZBcKQxFukIm/fOXScknmshInN
 1vbw63j9G+9Ncgvx2syZhEJ/iYCopHGUJRxXwkMeHuzBAqlkOhjpYZ3YBDeDBpdnMt4xvArCz8R0j
 4lz1BLOWQFLARMVJ8XXefbBajnFG/om1eVmVpo+1ra0e6vgp+t7sCu8z2qFEVj3kaEkh1lqI0Ctou
 bJ/tz5w+n/5h1ugyGxOMSDjuGF/Gmp1hq2Ogo1GdELA+PA891DfjLVj1S//a/IdS474hp3ioT6tZZ
 gIJ8anufQZ3qMDcPEPeZ0p7LWdf7nDbAvUJRWvayKgQe2+tPEriGYMUIdqD+Ei8TNmcJCZCDEqr/6
 bfJNCSYg==;
Received: from 229.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.229]
 helo=vega..) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qxNeB-00Ep4m-HS; Mon, 30 Oct 2023 09:29:19 +0100
From: Iago Toral Quiroga <itoral@igalia.com>
To: Maira Canal <mcanal@igalia.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/4] drm/v3d: update UAPI to match user-space for V3D 7.x
Date: Mon, 30 Oct 2023 09:28:55 +0100
Message-Id: <20231030082858.30321-2-itoral@igalia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231030082858.30321-1-itoral@igalia.com>
References: <20231030082858.30321-1-itoral@igalia.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Melissa Wen <mwen@igalia.com>, Rob Herring <robh+dt@kernel.org>,
 Iago Toral Quiroga <itoral@igalia.com>, Stefan Wahren <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V3D 7.x takes a new parameter to configure TFU jobs that needs
to be provided by user space.

v2: added s-o-b, fixed typo in commit message (Maíra Canal)

Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
---
 include/uapi/drm/v3d_drm.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index 3dfc0af8756a..1a7d7a689de3 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -319,6 +319,11 @@ struct drm_v3d_submit_tfu {
 
 	/* Pointer to an array of ioctl extensions*/
 	__u64 extensions;
+
+	struct {
+		__u32 ioc;
+		__u32 pad;
+	} v71;
 };
 
 /* Submits a compute shader for dispatch.  This job will block on any
-- 
2.39.2

