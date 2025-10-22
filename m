Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C90BFB23B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 11:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D58910E71D;
	Wed, 22 Oct 2025 09:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vfzibwym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A269910E71E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 09:22:29 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso458721f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 02:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761124948; x=1761729748; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z7+WPa6fzkzIkb/WM7fYUJAZP3WTURYIOOoTI2A/B20=;
 b=VfzibwymMzTkicDamVAQgY+2nDrm/m4rMC3oqahpD/QmEQ37a6MwpyiUbgVfm3YDmU
 jyZa/yu9WAvN44VvukRg6uhGqpqRagWLYR7LHfLK3J+Wnr9/ZESFKsaRS3hjAWE78FYa
 y3nsQRwy1EGzaQLv2gciMl/vNGswlj11EaiRVz+jwAF7ps2tBLApluyTi0WC8SCw5wVW
 /ipdlyOBwvzic//r7979cKUoBIp/wMN8heAG+zKzRa19VNuPz35mBQuMc90z8pdKsIE0
 Jffkvr/mSi4cjl9lZgEGkxgrDhlk0A+7HG8jPUPi5BI5+9wK4gUj1pVbBm6wmDBn1E/h
 nn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761124948; x=1761729748;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z7+WPa6fzkzIkb/WM7fYUJAZP3WTURYIOOoTI2A/B20=;
 b=VCH/Eb15LgeYSmWnTGUGJtc3+U89pOwIHUO5orrHLq6vBQ7dQY1kiYDqAjtKy3zNCV
 6l0uo/2az5te2QpoyPuRB/maCpHtdIVMIsCL75bUoQpTXQHqYm5K1We1j0CMuXphqbnX
 RdJL8Ry+3uL/f0XOZxZINJDNIrF0zoIZRhHiDJeFT63th1CdU0xHGVbF/gYTTiWwrGW4
 M1BPZ+ghIyt7BqF4qBHPvZuAjsmg24aTFbsy6Gk9ZhMIMd1Jx4yj+fOzHDl+7PJYlH1w
 PBDZfEhRbpnyUxRZAKzbmFqUycxS+VJM4z4RddMt8oRR3TXB9744+dI0Gl8nI59b82dX
 RvVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7fsnU1Yn4GY1MM/w2A8vh4BBSx5pP5ROlnNW/jtm8FyW6yOlLR1Bl/bAhB8uKsgPttSs9PHNssqE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFxOg4ukinrG89uKtT/DDEazHSUyMXhoaElvwQZ9HMEM9Bfs6X
 AWwea2zdbdIySZvf9nhrmHH8wjQD/y6Sop9Z05k2XPeA9f4VVq0fw64Tj8RAnBvd6G32bZb+TCh
 VA9tv
X-Gm-Gg: ASbGncuw1rZI2tkET303UFqhRavcTyhOrWuqiL0OTaJE9NYPuSKz86GqS62n+bZDHat
 E6gnhXhqeoREEOqjNjoxMoD5SdJsDqvBiqnlD/KQJkaMSWHq0kTs3BaWFelPGOmPLt3a76Rey8O
 ENsI9/j+9W5lcI5sDPgoFqk5jOM/zthPZk9FAwUKX6sewSJvXcbe7AVGFXx/mKcb6efaxrr3deF
 Ew5dRCQN/uAN4res3AYZxQN4V56k6JaWxUDSvZTAuA+99APa+GHkTxDKtl6btN+B0YqfWCdz9pD
 xQ5uSugdbKfp5FXDSfOCKSxtsd2INArt/5RQR8Z8QLsQ772IR6EcQRFVg2BKJ2Q5/nyHGJ2BnEV
 tidx4kD1YzHDEcyRq4CwADid/PCGgn79g7Aywx9+AFfo3EtdRkfrwEzyE3aBHXyf3bnYFfGMeQa
 TsZ58AAw==
X-Google-Smtp-Source: AGHT+IE/+JkAy3x0Euv5ZMU/5Z9wLNiLKtrBsG+0gIPOWd+6NlnmnvFC9TXedSVDhLlMgRN2O9Lcjg==
X-Received: by 2002:a05:6000:2585:b0:426:fc52:cca6 with SMTP id
 ffacd0b85a97d-428532557femr2044051f8f.7.1761124948043; 
 Wed, 22 Oct 2025 02:22:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-427f009a7dasm26554232f8f.25.2025.10.22.02.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 02:22:27 -0700 (PDT)
Date: Wed, 22 Oct 2025 12:22:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ellen Pan <yunru.pan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 "SHANMUGAM, SRINIVASAN" <SRINIVASAN.SHANMUGAM@amd.com>
Subject: [bug report] drm/amdgpu: Introduce SRIOV critical regions v2 during
 VF init
Message-ID: <aPiiUG_y0k1iLFJd@stanley.mountain>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Ellen Pan,

Commit 07009df6494d ("drm/amdgpu: Introduce SRIOV critical regions v2
during VF init") from Oct 7, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c:950 amdgpu_virt_init_critical_region()
	warn: unsigned 'init_hdr_offset' is never less than zero.

drivers/gpu/drm/amd/amdgpu/amdgpu_virt.c
    937 int amdgpu_virt_init_critical_region(struct amdgpu_device *adev)
    938 {
    939         struct amd_sriov_msg_init_data_header *init_data_hdr = NULL;
    940         uint32_t init_hdr_offset = adev->virt.init_data_header.offset;
    941         uint32_t init_hdr_size = adev->virt.init_data_header.size_kb << 10;
    942         uint64_t vram_size;
    943         int r = 0;
    944         uint8_t checksum = 0;
    945 
    946         /* Skip below init if critical region version != v2 */
    947         if (adev->virt.req_init_data_ver != GPU_CRIT_REGION_V2)
    948                 return 0;
    949 
--> 950         if (init_hdr_offset < 0) {
                    ^^^^^^^^^^^^^^^
unsigned so it can't be less than zero.

    951                 dev_err(adev->dev, "Invalid init header offset\n");
    952                 return -EINVAL;
    953         }
    954 
    955         vram_size = RREG32(mmRCC_CONFIG_MEMSIZE);
    956         if (!vram_size || vram_size == U32_MAX)
    957                 return -EINVAL;
    958         vram_size <<= 20;
    959 
    960         if ((init_hdr_offset + init_hdr_size) > vram_size) {
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Would we be concerned about integer overflows here?  Should it be:

	if (size_add(init_hdr_offset, init_hdr_size) > vram_size) {

    961                 dev_err(adev->dev, "init_data_header exceeds VRAM size, exiting\n");
    962                 return -EINVAL;
    963         }
    964 

regards,
dan carpenter
