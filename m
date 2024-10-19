Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181C59A4EEB
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 16:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AAD10E38C;
	Sat, 19 Oct 2024 14:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WMbe2qKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9241810E326
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 14:57:19 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2fb50e84ec7so24866271fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2024 07:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729349838; x=1729954638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tGEqRhJUmb4osaTCwQDMCDlViFMb/3sNR+ti6VhsDbc=;
 b=WMbe2qKrJ3dWSCE4QnzvnKO7TRCShRgT25VFMwpL9/QCvScZaFK2dJh61mZEEHl2T6
 zxieJfmaRH4vf192y8nA+Sb7kKRNY4GCkwb2lwxZJfJaWo68J1NbN5Lq5mbv/iM2wK8L
 sCDgm42kZSE0MaeW4rmuqRQAWOHzla9w1nue4lDBifvKJbCTMk5f0y8HNOY/D3l9OYmr
 OdkC9SiGr0nOUBLv7qrRIhIdDPs26o4xLEWUBszq1mq08+yRGHkkTD/Adm4TMlncBobF
 i9DFvcPY5tZP9ChXQlqPNhJjVK3pWiA6CObcWvfIgMRJ9BfcgZqmdKxZYpz/eC4bkTYa
 2FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729349838; x=1729954638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tGEqRhJUmb4osaTCwQDMCDlViFMb/3sNR+ti6VhsDbc=;
 b=HR6AqaYnx0kWOqHLZgbPLoW1R+vUS30pE8lP1vc/NPrjc65py8fcbEDUaYxj1u4Y93
 JoSSAB3Jzt7eV5vAgTBYEDqoz0Bkx8c6O1M1pniGV54qgIH4romBc1OtstORFQadmBtt
 6h5qrJOTwpP0m3Zh0wkQqdgh3ioYpqtCfVqk8yhAh81jrxou+W+glhiAsni99obvGns/
 g0ibG7MVpP4pjj4vzR/4/ZeC6DabbdJJY4j56VHZ+nE2s67ZrIqfzkfB0WW7+Xx21F0/
 zwnYHVHFG0WojjYCmWrfkUTdQRqf3ucKoPqDtlOK9L+u3jLl/9CfxDFtZZncX7cCddZ8
 tZSw==
X-Gm-Message-State: AOJu0YzaCwnZuCWUqqcV4cFPG9lBLFd1C21pA3RZnPfJk1zQed56K722
 5eohTHC3UYPyAW03bZ7WFet1EQtFdgDjxuOHD1qPSr/z1gJ14JBEFzcMfGj2Wuk=
X-Google-Smtp-Source: AGHT+IFvSKPhzsDNaKPyeWXPDE+0C/KzNCTy5GJ2Heds43Isr1H269ujLKKeg+t7AlBJAH2ez0R7HQ==
X-Received: by 2002:a05:6512:3a82:b0:539:ed5e:e226 with SMTP id
 2adb3069b0e04-53a1522a891mr3518017e87.26.1729349837675; 
 Sat, 19 Oct 2024 07:57:17 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00::b8c]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a15214f1dsm551788e87.288.2024.10.19.07.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2024 07:57:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: stefan@agner.ch, alison.wang@nxp.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Chen Ni <nichen@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/fsl-dcu: Remove redundant dev_err()
Date: Sat, 19 Oct 2024 17:57:09 +0300
Message-ID: <172934981950.2755496.11253073268427198025.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240918074841.2221210-1-nichen@iscas.ac.cn>
References: <20240918074841.2221210-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Wed, 18 Sep 2024 15:48:41 +0800, Chen Ni wrote:
> There is no need to call the dev_err() function directly to print a
> custom message when handling an error from platform_get_irq() function
> as it is going to display an appropriate error message in case of a
> failure.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/fsl-dcu: Remove redundant dev_err()
      commit: 4b173d34e35726d7727d3e5edc43bcab12654ab0

Best regards,
-- 
With best wishes
Dmitry

