Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEAE23A0C7
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471F9890D2;
	Mon,  3 Aug 2020 08:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573136EB79;
 Sat,  1 Aug 2020 12:24:37 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id l23so10420144edv.11;
 Sat, 01 Aug 2020 05:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mTab8JNvsgo4CL+J2E65GCxL4zVDcvJICP1+e2MGiww=;
 b=MxXS7aXGg49OI8aq1o2JxQSacx3GEkx7XRc4h3ldURK6zBJgpz5BCs4TCQi9vzW8bw
 6N5rmJ/Bc2EsNZmNEy95m4VrSdD6S36XHIE0bXDvbmHdvv8Ihd/DN3YqOot8+XNsBn4K
 uH6Ip0XLj/CLkS7OQbIMeU5cG1JmDbAF6R4dkjrmVllWjiJc6lq/K7WJN3y20CFnB+Zq
 Veh4WXw6cFj5wfDJzSErjSaJ/GQ1p/YmseYNttpG96RLDnixkmg9o75N4xiBxD0qqPsJ
 1iL8Qj7buxqLPP29VEWOUOsDSz4OPW5lGkFWyKdBy9bfKl3Yd4OWQ3uoiFlz2n2kpCGD
 NGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mTab8JNvsgo4CL+J2E65GCxL4zVDcvJICP1+e2MGiww=;
 b=fGFpXHb5yFqLC9rsaj6KGPNxRHw/BD55LHEjfJf57GrWsRG1DPtB3y0d40tmT4UwOB
 UejZRlmSWtUOz8SGwLV3zmnMSK6NbJhJ5ruB0TrN/HL2w3Ty4jgIv6mP+4bsAxExX5Cb
 7/1yt4FFCcLy9MT9tQQy+JaBXRUCH+McTkhae36sZels85MO2zddWBDBHOVL9xNj13AT
 YaJznRNkazVCfP8OkbT8BJZuhAqg07e+wCFbKMyY/FNStM/z98W4EAorsKsNmCqhJcek
 fG74F/6DX/VOffcYWup2lCTRYzc4T4KAqz15a1qClmwazEqs+ZJ+8f6BVkN3RQKHyxfX
 Mo8A==
X-Gm-Message-State: AOAM533H50KeZ6VWpTStO9VPEhEYBHt1eNPvf3ThRtATFQFx32gDTatI
 RPXHjMBcXR2ISxVT3sUDGYM=
X-Google-Smtp-Source: ABdhPJyNuqCc/8r6/A/7Q7T/LnVDBWUQ9SzPEt/TNIqjoVA3EMIMDnSI53A+QOmplMa8tW5cITLjzA==
X-Received: by 2002:aa7:d5d0:: with SMTP id d16mr7805559eds.212.1596284675988; 
 Sat, 01 Aug 2020 05:24:35 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:35 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [RFC PATCH 09/17] drm/i915/vga: Drop uses of pci_read_config_*()
 return value
Date: Sat,  1 Aug 2020 13:24:38 +0200
Message-Id: <20200801112446.149549-10-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 intel-gfx@lists.freedesktop.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org, bjorn@helgaas.com,
 linux-kernel-mentees@lists.linuxfoundation.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The return value of pci_read_config_*() may not indicate a device error.
However, the value read by these functions is more likely to indicate
this kind of error. This presents two overlapping ways of reporting
errors and complicates error checking.

It is possible to move to one single way of checking for error if the
dependency on the return value of these functions is removed, then it
can later be made to return void.

Remove all uses of the return value of pci_read_config_*().
Check the actual value read for ~0. In this case, ~0 is an invalid
value thus it indicates some kind of error.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_vga.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vga.c b/drivers/gpu/drm/i915/display/intel_vga.c
index be333699c515..6f9406699c9d 100644
--- a/drivers/gpu/drm/i915/display/intel_vga.c
+++ b/drivers/gpu/drm/i915/display/intel_vga.c
@@ -99,7 +99,8 @@ intel_vga_set_state(struct drm_i915_private *i915, bool enable_decode)
 	unsigned int reg = INTEL_GEN(i915) >= 6 ? SNB_GMCH_CTRL : INTEL_GMCH_CTRL;
 	u16 gmch_ctrl;
 
-	if (pci_read_config_word(i915->bridge_dev, reg, &gmch_ctrl)) {
+	pci_read_config_word(i915->bridge_dev, reg, &gmch_ctrl);
+	if (gmch_ctrl == (u16)~0) {
 		drm_err(&i915->drm, "failed to read control word\n");
 		return -EIO;
 	}
-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
