Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF8A696B9B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:32:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D91610E944;
	Tue, 14 Feb 2023 17:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B9710E943
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 17:32:10 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id eq11so18484189edb.6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 09:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OY08lSRJ0khJ3YSfU40JW9rAgs8VWCIlhnOm90/cUOg=;
 b=frfKn93kiQebkp11O4duo98V/VYbcCaSsG8zEDPRN7bXFw6RY8w5rF0knMGnhEFM5l
 /02KkVtTMObUBFykV6Q5lsPHyvYFJ18icSwP8QxYbEKJm0GziPhXz0K7e79e5kaYvj//
 MS6T5e9SIcAfpUlqhOEg1ndoWsCUUKWFg445luwHBacOWbuGwDsfbwR1KP3wMID1li1E
 5i+1tgcFdWF5aZQM85pLheVzpKKlkMtlWj55tgeH5yuU36lfSWefZCJ0q2Rw0Cy8pCFy
 6WOeJw7XAPSGjYLTQoBwmt5Yh46Y768uSz7iPY/rtkgyFu49b7B8JZJkKUPmyLkSwTAI
 WsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OY08lSRJ0khJ3YSfU40JW9rAgs8VWCIlhnOm90/cUOg=;
 b=wUVmLks6x1jpBYx5nnKTv1kO4Tod2CGsJmxAzObJJOQcXsAX9pyytBk5SGfagW6Foj
 G9O9aLkQXGnNJ3en9lBPl9MQcgqUzwmnr0BsRSqoSl8K9FSfMmZSXcEKM4uHi3KdgUE8
 15kTR2uWj9nflN3/w7VAMig34UjjGIRGQzvoA+xmMisKf2FqGKMYdDskYVHC9SUAmBVh
 G15uVkUJkYGONWC64ThfCGrzxto3YK3oiFvd04sDDUOK3RxNR70wywQiJ7/oZ8gGBbC+
 00+RdfsNThIdZTjOdXdbNZktwMW0CclaWmFEjonR+g78MsmdX16EINJjuKmsT2H+fuXS
 gBqQ==
X-Gm-Message-State: AO0yUKUmj8gPMkhmcmXgyY2Tn7ciDghMj0uprGWT9Ka5mV+iBsezc9B1
 RAwdOnsF5jsUqrTo4UJnikmloA==
X-Google-Smtp-Source: AK7set+p3q4YKuAdCoI2TlDfL0AaC/b3D1U8fkZW8bGwqj3d2sCOyEM/PtwXUq2iGExPskN1ATR+EQ==
X-Received: by 2002:a50:931e:0:b0:4a2:2e8a:14cc with SMTP id
 m30-20020a50931e000000b004a22e8a14ccmr4271090eda.1.1676395928744; 
 Tue, 14 Feb 2023 09:32:08 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:32:08 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Subject: [PATCH v2 05/14] drm/msm/adreno: Disable has_cached_coherent for
 A610/A619_holi
Date: Tue, 14 Feb 2023 18:31:36 +0100
Message-Id: <20230214173145.2482651-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
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
Cc: Nathan Chancellor <nathan@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These SKUs don't support the feature. Disable it to make the GPU stop
crashing after almost each and every submission - the received data on
the GPU end was simply incomplete in garbled, resulting in almost nothing
being executed properly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 36f062c7582f..82757f005a1a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -540,7 +540,13 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		config.rev.minor, config.rev.patchid);
 
 	priv->is_a2xx = config.rev.core == 2;
-	priv->has_cached_coherent = config.rev.core >= 6;
+
+	if (config.rev.core >= 6) {
+		/* Exclude A610 and A619_holi */
+		if (!(adreno_cmp_rev(ADRENO_REV(6, 1, 0, ANY_ID), config.rev) ||
+		      adreno_cmp_rev(ADRENO_REV(6, 1, 9, 1), config.rev)))
+			priv->has_cached_coherent = true;
+	}
 
 	gpu = info->init(drm);
 	if (IS_ERR(gpu)) {
-- 
2.39.1

