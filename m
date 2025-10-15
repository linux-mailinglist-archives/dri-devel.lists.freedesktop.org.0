Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC726BE03C9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 20:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7311210E8B9;
	Wed, 15 Oct 2025 18:46:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ko7BmCIs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8A610E787
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:37:20 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-7810289cd4bso6170892b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760528240; x=1761133040; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x9r7lDMOBshgk2OBbZUZFD3lZ/ikkhF8KUnZZ8JlQI0=;
 b=Ko7BmCIsV33RdIh21Y3dvNIzqORho8GLu4edNFbo1SzQYalxbFEB82g7/hsINfT2GE
 TigcbgLqnGvjKk7g6g3tPIpGDLozO6uVuchnMdIQU5t3MK5NtgscE9H0hGL9j2a1GXw1
 VIRvwX63T5mqx9YuBLWt8nA7Ye228J+uGdCCeaYySxn6PhvhFjNHWw53PGcT55S2Pw4n
 dBjpwR0uCgfD72+Zql/pQ3kD2s5luU6blVACGKFhquSyEGA6dL8u5qRCIkcsl8INw7In
 W/TBGlBDn7c4weXX7g73TPjReRChtCKogwMZ6EEzhaKSwPQJNIZD5C9dtPTMfUP+Fw95
 ws5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760528240; x=1761133040;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x9r7lDMOBshgk2OBbZUZFD3lZ/ikkhF8KUnZZ8JlQI0=;
 b=ZpkSD31KiCddiAGJz9ud0jI/TxTy1HlLkbvKHDcXPTFMD1Wnu6YSi5ROLamhY8seKW
 apfZbMsRFB96UWoQqcI1Yx3EliNcDp7VHF4Spbf2KMdtsBiLCH/df0CPZVMrWgRo4qQP
 h6/NW/RRYkBMsIyA8v+ctbhIdwo874Ub1R7f9SKkCRGf7ftWkht2adKcVo72csWefnPs
 nf9AYysHZ3XRJl/SLrJgQsIRonm7Dm0WGZiyL/oLzv7YLbr4k9gjlWNZ6132RwW1QsG4
 lkxPT4raFxvP1VuHLtf3NlfScv4PoO4uEh8RClNo46KR+GVZXb3gqfo62AFWrDHceISC
 VnuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUy65hD9gMGGTVvBOrj2ImaFSwQoMtuPd0C2newl3L2pv4kGhE/kljBSovaSAWenDd6TfQI6BkPE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwEssCKemaUq79SjAWNFTcVth9IArr3L2lpzUs2r4Xed3lWW72
 CITM3PNe8GI8eUWvJn5wuZRJg1gCB0SgxNjUEfbtWGWSDrs+2pP/WQhD
X-Gm-Gg: ASbGncuijVF2t9EXENteRJn0pOspANCy/IVJGPDYRyFYnqTmJP491ip4/AGCRy5h7ME
 LZleFWQ9Ud4oH+t0XbwgRgmrWbZuXy8c8rbPQiLXGFywCjXA131EMUHzpGQSDQGYxMvkd2uDiLy
 uuLQusFHFgiEmcvlV/GXwjVpq4eEVCBfJmP9ydHWVgmbvSGHVk69vHy+tQG6UimzYiSC159CrLP
 oUXjDfn9zI8l0r9F/V1nBqXy+7VbWvyS7ushUNMIOiUDZMrC15Xxu/05oLoqFsFRB9BtYlbWp82
 IJrQzEIwx6m/7Uk21COvLiKjIuiIWT8cgcR9cSTA7+HcRN2dZzchs/9bASoPlI9d10PHBjrIN0z
 moyfbw2OPVtFrBYsM4xAJtxISw2gmuD8A+28oC5z320CIhIrnvVqb+JOBAA==
X-Google-Smtp-Source: AGHT+IF/kMdSW2mdiOvPmOOpT6ZAXFjqWzHKAwJiaUVYsXOzqJQMewVct8CF0Jj3G4kE299bLT4akg==
X-Received: by 2002:a05:6a00:a0a:b0:781:1920:d12d with SMTP id
 d2e1a72fcca58-793858fb6dfmr34996835b3a.12.1760528240330; 
 Wed, 15 Oct 2025 04:37:20 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992d0e3f89sm18115540b3a.66.2025.10.15.04.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 04:37:20 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: bbrezillon@kernel.org, himal.prasad.ghimiray@intel.com, dakr@kernel.org,
 matt.coster@imgtec.com, robin.clark@oss.qualcomm.com,
 matthew.brost@intel.com, aliceryhl@google.com,
 thomas.hellstrom@linux.intel.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, skhan@linuxfoundation.org, khalid@kernel.org,
 david.hunter.linux@gmail.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Ankan Biswas <spyjetfayed@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v2] drm/gpuvm: Fix kernel-doc warning for drm_gpuvm_map_req.map
Date: Wed, 15 Oct 2025 17:01:23 +0530
Message-ID: <20251015113656.21447-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 Oct 2025 18:46:05 +0000
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

The kernel-doc for struct drm_gpuvm_map_req.map was added as '@op_map'
instead of '@map', leading to this warning during htmldocs build:

WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not described in 'drm_gpuvm_map_req'

Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
Changes in v2:
- typos fixed 'map_ops' -> '@op_map', 'map' -> '@map'

 include/drm/drm_gpuvm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 8890ded1d907..476990e761f8 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1078,7 +1078,7 @@ struct drm_gpuva_ops {
  */
 struct drm_gpuvm_map_req {
 	/**
-	 * @op_map: struct drm_gpuva_op_map
+	 * @map: struct drm_gpuva_op_map
 	 */
 	struct drm_gpuva_op_map map;
 };
-- 
2.51.0

