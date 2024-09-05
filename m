Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A736396DC6F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2024 16:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8636910E8E2;
	Thu,  5 Sep 2024 14:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KSCl6MUs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8009F10E8DE;
 Thu,  5 Sep 2024 14:51:33 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5c3c30e6649so1091053a12.2; 
 Thu, 05 Sep 2024 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725547892; x=1726152692; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qPOo8Pfi1VNASnBtqV5YKHTic1uBqsRSoxIsZX1zO3I=;
 b=KSCl6MUsTDcN077HFml7otSVGkzpBZdvDqSQCfQgy1z7Lqy0Z2wc6Mp+nLUYJ2Lqd8
 FJwnVN1bwn0urDqXA1OXplcJuv0Obm+p/70Y1XPvZ0cJxcJ+wbh3H6Drx+4PmLmYNqsg
 g7hwDNAMCp+YFvZF2WsYshvl/Xd5vcX7kMkY+ABW7Ymlr/42K63WfPTSl6H0wRWfzhuY
 hBRtgEGtNcXxbRM9Og4QT6dITicGr/zMWVs7DfKsa67+czUrM5ZexfwAtid8jNQP2+Fb
 J5gCco7oD6jv9/zY6YSOu7ooUpr6fwJr9Rqocg8KC7X5KCBJ3Q7ME4047RuoZLsbRv8S
 p8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725547892; x=1726152692;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qPOo8Pfi1VNASnBtqV5YKHTic1uBqsRSoxIsZX1zO3I=;
 b=O9H1N+MmDkCAl0xyT/L+WrBhH6z6anVoRENODENr+oZLKYGdKSMYEgJOE7fy+rEQaH
 CIRSMA91gt7xPcwn5IXgxZccx/MRIdl6VlOVVkX3hXQYkmRG3KkvRL/T622RBxIBi6ie
 iHHVVr/cRzq1mxnbXUDRbudWva9Oz7g2ABPpPVnpwhQgvsPPp9QZKLdAAURgmmcGd3xQ
 98EbYVrqfhH4GG3n85xy/xxCGqlFWVVP9Nbi8e3UlCzyR3KtAezvHd5xaaJV7pRHyma5
 4Av1oygsegm92rGyz8ypB3kPTvdKpVbGD938b829ss9xOVxIp5Km5gA6biU8znBJLESU
 nvPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRYUJMZ21UUGnwUN0ziRUt7RM3t0TS26HnmG43BSkaWsr9c/oueMIefp0uYFNK3fCp0VUNuzHMpd8=@lists.freedesktop.org,
 AJvYcCXERAz1eHJFBDRpJUoLhaOPmIXG2nkaKxHpHnmmWT2WvOdi3FBxOIy9EDEqyxiNfSA0hLe6eA//vNlX@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywgl9hpKv0uKQ4yYCaTrtwY+kDD2iUPfkwZaq93GxwiYxyAghYM
 e3YAgsRo+M96IkhH2ACEimOK3o2Y4jPc+t1SkQRZoNN/f7Siqq56
X-Google-Smtp-Source: AGHT+IEnyqHx0DHoDglc2jLC/PA9Nj+uA16QJYJDKXjsKOGJaGOHnPxH2U/yAKpfbREDBM1ujNjG+g==
X-Received: by 2002:a05:6402:430a:b0:5c2:632e:9910 with SMTP id
 4fb4d7f45d1cf-5c2632e9913mr8692658a12.1.1725547890783; 
 Thu, 05 Sep 2024 07:51:30 -0700 (PDT)
Received: from [192.168.1.17] (host-87-16-167-153.retail.telecomitalia.it.
 [87.16.167.153]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc52b376sm1320732a12.7.2024.09.05.07.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 07:51:30 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 05 Sep 2024 16:51:21 +0200
Subject: [PATCH v3 03/10] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-preemption-a750-t-v3-3-fd947699f7bc@gmail.com>
References: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
In-Reply-To: <20240905-preemption-a750-t-v3-0-fd947699f7bc@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725547882; l=1210;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=oUM/CI16gozvDWhTcSfQS9qAoH2wC/uZWKXcoKsNOYo=;
 b=X8eiYRE2gVkakgwp1dJ5qHgU5fJl/hFC67Ik7NqxxS3XRnT2QeZXDEAFmbq5M2xx/eSfNldAx
 SlYmdJZIP5BBt512gBZ9594E0thEcU9E3r7kQli8Oe+z28otUr7I3Av
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.

Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2dfe6913ab4f..fd31d1d7a11e 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1337,7 +1337,12 @@ to upconvert to 32b float internally?
 		<reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
 	</array>
 
-	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL"/>
+	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL">
+		<bitfield name="STOP" pos="0" type="boolean"/>
+		<bitfield name="LEVEL" low="6" high="7"/>
+		<bitfield name="USES_GMEM" pos="8" type="boolean"/>
+		<bitfield name="SKIP_SAVE_RESTORE" pos="9" type="boolean"/>
+	</reg32>
 	<reg64 offset="0x08A1" name="CP_CONTEXT_SWITCH_SMMU_INFO"/>
 	<reg64 offset="0x08A3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR"/>
 	<reg64 offset="0x08A5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR"/>

-- 
2.46.0

