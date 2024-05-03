Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254E48BB710
	for <lists+dri-devel@lfdr.de>; Sat,  4 May 2024 00:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CBF10E77E;
	Fri,  3 May 2024 22:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="RbpRwYBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0317A10E77E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 22:29:26 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6edc61d0ff6so193552b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1714775366; x=1715380166;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=u9HvXbVpBkm4gjqLbVND7yYKtWaA3VPHKuE6ulwm3z0=;
 b=RbpRwYBl0S24gNWQ1CFPp0Zm+5f4T1Dty2mDhp+yhrwMkswf0B4DLIPo9qCn+R1DAS
 SvI/7f1rzHyja25uGUOw2K/bEh7va7ewnjSGsx7kxEKwfQJ0dPywpvZXqE9L1kw3OggR
 TrWYJCwUG0UVLnGxaughmeAlC3949GaQtnChQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714775366; x=1715380166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u9HvXbVpBkm4gjqLbVND7yYKtWaA3VPHKuE6ulwm3z0=;
 b=XRu96DaLDjlKdp3fLJjplVxUPVagTwjVnNUcxwXum9HICAkIq0mfnMmgz92payvRCZ
 nSfwagVIBrnOLoyHXi/vK8pjMJyelDQNLWE9wPpceUhimMRTkYoFTB7GZI8G6pWGjIcq
 EBfoeD7ITMuK3Hqj5ue0OoOimCxVpz+xjS40/mJgZs7GKE+4inDGbzSKkasPXAnHCUlY
 SvZZBAOKo24SLWqEq00AQUQ8srO+5ihazNqu4K1h36numZG/nNuZzy2w8RNF/sKzXELy
 x/DDEAGs288m9/fMSkPd7OTKA6VT6RYn3J4Ht+yaUeTwpyxH5Xaj0gc5/IYJirIwYSH6
 H30g==
X-Gm-Message-State: AOJu0Yx8hzVohRq4hf6DrLBTzDZ1R/fgq7BzL6WBfrzCdh5kn+n3u0HC
 1/gCLQGAiS8ETS4ldqKACpSNjVYj078clEq9eiRRAFXilEpZVtu9Ford979bP9ZTVZLKaMClCjS
 U3J2QhpFIVks6tGCXM5xg6THfEUQF3GUvty4MdpqeHxQ/Yz4bqWfSTWDw8giwuqxNTGqVBbiJp/
 eYIQYmAa2Czs3V0CkXTqqYqp9LVwtPFMpIItwUlROpO1jHgygAOA==
X-Google-Smtp-Source: AGHT+IFxzEMZCmmX+MCZPUK/8ssVRRWNFH2ccAipYW7q4/7t+a5D7Ex8pNbJvmvGHESdlssDN2AvOA==
X-Received: by 2002:a05:6a00:2185:b0:6f4:1695:beae with SMTP id
 h5-20020a056a00218500b006f41695beaemr4560373pfi.29.1714775365873; 
 Fri, 03 May 2024 15:29:25 -0700 (PDT)
Received: from localhost (99-151-34-247.lightspeed.austtx.sbcglobal.net.
 [99.151.34.247]) by smtp.gmail.com with ESMTPSA id
 x2-20020aa79a42000000b006f43c013f66sm3579589pfj.173.2024.05.03.15.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 15:29:25 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH] drm/vmwgfx: Re-introduce drm_crtc_helper_funcs::prepare
Date: Fri,  3 May 2024 17:29:16 -0500
Message-Id: <20240503222916.26552-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function was removed in the referenced fixes commit and caused a
regression. This is because the presence of this function, even though it
is a noop, changes the behaviour of disable_outputs in
drm_atomic_helper.c:1211.

Fixes: 7b0062036c3b ("drm/vmwgfx: Implement virtual crc generation")
Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 2041c4d48daa..37223f95cbec 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -409,6 +409,10 @@ static void vmw_stdu_crtc_mode_set_nofb(struct drm_crtc *crtc)
 			  crtc->x, crtc->y);
 }
 
+static void vmw_stdu_crtc_helper_prepare(struct drm_crtc *crtc)
+{
+}
+
 static void vmw_stdu_crtc_atomic_disable(struct drm_crtc *crtc,
 					 struct drm_atomic_state *state)
 {
@@ -1463,6 +1467,7 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helper_funcs = {
 };
 
 static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {
+	.prepare = vmw_stdu_crtc_helper_prepare,
 	.mode_set_nofb = vmw_stdu_crtc_mode_set_nofb,
 	.atomic_check = vmw_du_crtc_atomic_check,
 	.atomic_begin = vmw_du_crtc_atomic_begin,
-- 
2.34.1

