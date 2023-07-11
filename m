Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC9474E8DC
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 10:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29A310E0F2;
	Tue, 11 Jul 2023 08:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A62410E0F2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 08:20:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fbea147034so54558855e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 01:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689063645; x=1691655645;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W8lWjawHlVclNDSWEGq29N0b967SueKiHPqM+v2TDzE=;
 b=R1G4aF4EVATbvhCL1DAa5FefRu2NkRIzdMHhs4yTRuatv9exyCmRluZgmuU719dwdG
 ICuOulPDorELuHUtnF1o8xPcKJ8yNsL/D1Kjas181S3VoFyn3Mstdf8dEdanuZIxdVHl
 Dp1hmNOVIskQOayCud5uFBNXJHvfFyj9BLija0AjxjINIKa8KP9MIEBNEhqe1oRraaL3
 RsiOWZZoX53yk2Deu1eWgFpFTjPCJbtSO5KbmGsvN5eouOzGX2XO9nfSDwOCgC2Fn5Qs
 kVaT112Emddn070lXfqdINzaipMC28ujLMkw7ebF8euN/f0Qbt76PJ1I59KkMZ3Zsa4V
 LZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689063645; x=1691655645;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W8lWjawHlVclNDSWEGq29N0b967SueKiHPqM+v2TDzE=;
 b=Un1yAQy/7EeBO3xbbsmrcqT5JNeCAABvj9uwve9Q8QhZax6DyC/O5DmTs0q3x/ik1o
 KDI9EeHtmxLogfqCalm1dWag3SxEiasQdmgHmFbCr/mkf0KknYpnJh4WgIBJQhWED7hP
 /ZaBwqvEwgoLuI//WndeYR/bk46uy64tBaq477b+PFxP+Wi/xGGZQ6r24aDfvOBYFRsN
 d33ycJizL/TUygMbRYCX9gCPj8DjSRMgwwV+vgZBmh7f7x5zCx0gZu/rR22EG+V3A7uW
 xjK4kWAdWUdX8r1Gdy6XiC9SiGr3yG8z+S9wmaI/q2AJC1ljZ4laq78biNJ5J8KgGVSc
 la0A==
X-Gm-Message-State: ABy/qLYnbSpXgI7/j6qtpZQSN7Dsp06JIDsB4AUSRl6zyHZ8nwL7JY8U
 qwkhP96gtQ3US6FJDAvp1oAfGiDfCedSR0QqCTQ=
X-Google-Smtp-Source: APBJJlFxViETfwk0NPeCw6JJuzwbQOxNl4JhFOTf4b7WQw+EqA00xL4rHa31voGAKtfFRwsyqvOTVw==
X-Received: by 2002:a05:600c:2209:b0:3fc:b86:d3fa with SMTP id
 z9-20020a05600c220900b003fc0b86d3famr7198858wml.1.1689063645070; 
 Tue, 11 Jul 2023 01:20:45 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 n12-20020adff08c000000b0030ada01ca78sm1585438wro.10.2023.07.11.01.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 01:20:42 -0700 (PDT)
Date: Tue, 11 Jul 2023 11:20:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 0/5 v4] accel/qaic: Improve bounds checking in encode/decode
Message-ID: <6e935c70-5bd2-4808-bdd9-d664f892b0b5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixed in v4: Send the correct [PATCH 1/5] patch.

Fixed in v3: Redo messed up threading

Fixed two things in v2:  Include the <linux/overflow.h> file.  Change
the >= in encode and decode to >.

regards,
dan carpenter
