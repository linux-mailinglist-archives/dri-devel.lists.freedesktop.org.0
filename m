Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F54312D78F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 10:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B456E1E8;
	Tue, 31 Dec 2019 09:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D262E6E072;
 Mon, 30 Dec 2019 19:41:10 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so33617845wrh.5;
 Mon, 30 Dec 2019 11:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dXg8oFzBEXS5AG929jnjM1jsF6o4ohe+Wl9/z4Sa0Kk=;
 b=N3Il+Igx/93EmUIkp4Qn7D4C0qYnr0Zm38eM/RyUnHj3fIu88+MfVRzvu05TtNB1RI
 owSAEZX27S/3Sj7lup7vXTu9Dz6tr899n2q4V0yVA1XcFvP6PR8doKKHN8OMVPnd0A/9
 yqiZg1nBjCA7I1vsVt/EINDdHNUXMdQz03cxDmS7nfsJc2I58cMJM38EminOTwOvxV9T
 kM0yNNarkUhD1T6B0xCVk4Uq6VOVjH30XqIiSw8Ddxhillis6CRNlYSemQ3F8/nr5nKK
 TMn8U9HLeSXsHPc0N73KXCm+ao9zPZrRviqRUQPXO11ky4G6LnJEyKH7SBP4JDipEcDX
 LG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dXg8oFzBEXS5AG929jnjM1jsF6o4ohe+Wl9/z4Sa0Kk=;
 b=hLhb4kikeG1Ddt5x9YuhVDc5kPrd8CHE5xW+r+oZfoKUD8IFJhXuQr+Toi0QPMvjqB
 mnro+UjQiLInVPuAQjTJml3hZXY0E9lsvyda+xT7LeLKSyHXFuKFWbVseP2yLcmGJA2F
 eeCTIZMq4Gi93XJ1x5Y8XkjA5fk7KXOH128iFeMePgdToyGaxiNLRSGYhGiOEKyZuxwD
 mbaWTtGme4bQJaOw33bRIzVAK4HXDzomhd0vr1N0LVwijBhve90Lfh3trZVbvwEr6Xa0
 bOFZ/h8ogITENTPYC+HL/e1IisihQpq4C8plFjSUTwdSoEN5opQkI3+wTOKx3qmLcRjF
 sTaQ==
X-Gm-Message-State: APjAAAVHDPElIL+7i9e3c7GiBC3krFJ1I3GAqggRn1yiV9KZRgU8bNfo
 Ja+UgF8ClfsgMvnVFkXjpcw=
X-Google-Smtp-Source: APXvYqyvzye3Ooh54UXS218+xZWxHTIG40U09D7tH9MsS86sPq32CvZylveADRnLKxa3J7IKokgM2Q==
X-Received: by 2002:a5d:4d06:: with SMTP id z6mr67047992wrt.339.1577734868421; 
 Mon, 30 Dec 2019 11:41:08 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id p17sm47239785wrx.20.2019.12.30.11.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2019 11:41:07 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/msm: use BUG_ON macro for debugging.
Date: Mon, 30 Dec 2019 22:41:02 +0300
Message-Id: <20191230194102.2843-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 31 Dec 2019 09:37:01 +0000
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As the if statement only checks for the value of the offset_name
variable, it can be replaced by the more conscise BUG_ON macro for error
reporting.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c7441fb8313e..0fe7907f5a7d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -315,10 +315,7 @@ OUT_PKT7(struct msm_ringbuffer *ring, uint8_t opcode, uint16_t cnt)
 static inline bool adreno_reg_check(struct adreno_gpu *gpu,
 		enum adreno_regs offset_name)
 {
-	if (offset_name >= REG_ADRENO_REGISTER_MAX ||
-			!gpu->reg_offsets[offset_name]) {
-		BUG();
-	}
+	BUG_ON(offset_name >= REG_ADRENO_REGISTER_MAX || !gpu->reg_offsets[offset_name]);
 
 	/*
 	 * REG_SKIP is a special value that tell us that the register in
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
