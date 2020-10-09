Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080DA2883D3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C6C6EC4A;
	Fri,  9 Oct 2020 07:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9166C6EC4A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:44:01 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id i2so6514101pgh.7
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Gn9XAQLjMnlao8q3T0mSUTEj1Kxds0Di6aiSBC0kfuA=;
 b=toHZ8gz9k4laJxLKF6yRSx7rXJ4DMDFKKpOxPx1dSrkTrxr5ySBIt+E+jphjx2g0/R
 z/KApRw0shyKjG35OGxXdhKX42kOV8k7VLukCL9CQRqwoy6hxrj6N4MqqGdXX+9zWosf
 3FOLcioRTpsmtvNIVJMwbS8G6ihay5O5xExhuabYKIeh0Mykqgub/V5Wd7PYuwyhFMgw
 oxBcvYwYHKRIl3ztqVIRgxtbexFROQ2FX3540ISU0QpMO6yX8u5834PL/vALP2Qvf8sN
 cmw2xWXxi8/3MtNwu+hyosM/MmMUyzHzhUINdiTq2Rdfgv53gaA3KvUnVfS0TMk6gXCz
 3stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Gn9XAQLjMnlao8q3T0mSUTEj1Kxds0Di6aiSBC0kfuA=;
 b=MwlWhJQOY77Sz9BwabBPyIEzb2c1L8vnzzK4YtkkaGax8GsujDQ0CjbNgHDozfiwV8
 3Jo0fOS/nBcbBtN17J8Z5TpLM/zhDnWvnlkZge56i4uMmY/bxnO1DsEXQy40ukxG8Jtw
 KWpzrW9hs5EwroDIcpnLoYDENK7upamKG1vViBIIOjPCKuI9lfp6r2pV0heYRwZK4w5+
 nDOCcPh3br0vY3OX6bnUWE5YFdW9x8Q060fneyug5JPpW0S62OPS2iJVyUKD35dWBSe2
 WlIUYY6NHwJ1Sf9XormceaIjZ6eiq0LbGh2rIwvElMP+fGioieeTKtyA1OXUfTvfYnnM
 LYnw==
X-Gm-Message-State: AOAM531zx5kD8nu3tTfvChBkOtp7rosVyy8LYS6YEL5Xto7SYmpRJ/ca
 g2ffBAa7B6aEawMFPzokOHDAus/R2+jELQ==
X-Google-Smtp-Source: ABdhPJyLdEQ6sm6aQ0mxlTNuFop4MD6pGchp0Zh3EgIUrzcxe+Bh1xHttoeFKJngWGg+8k4YuVmFLA==
X-Received: by 2002:a63:591e:: with SMTP id n30mr2517439pgb.340.1602229440709; 
 Fri, 09 Oct 2020 00:44:00 -0700 (PDT)
Received: from [192.168.86.30] ([49.207.136.194])
 by smtp.gmail.com with ESMTPSA id r206sm9812947pfr.91.2020.10.09.00.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 00:44:00 -0700 (PDT)
To: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
From: Sandeep Raghuraman <sandy.8925@gmail.com>
Subject: [PATCH v2 1/3] drm/radeon: Add new callback that exposes vddc
Message-ID: <9faa1070-d46e-5340-f6a2-5826614f306b@gmail.com>
Date: Fri, 9 Oct 2020 13:13:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a callback for reporting vddc, to the dpm field of the radeon_asic structure.

Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>

---
 drivers/gpu/drm/radeon/radeon.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/radeon.h
index cc4f58d16589..85a1cafdf303 100644
--- a/drivers/gpu/drm/radeon/radeon.h
+++ b/drivers/gpu/drm/radeon/radeon.h
@@ -1992,6 +1992,7 @@ struct radeon_asic {
 		int (*get_fan_speed_percent)(struct radeon_device *rdev, u32 *speed);
 		u32 (*get_current_sclk)(struct radeon_device *rdev);
 		u32 (*get_current_mclk)(struct radeon_device *rdev);
+		u16 (*get_current_vddc)(struct radeon_device *rdev);
 	} dpm;
 	/* pageflipping */
 	struct {
--
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
