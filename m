Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDEBAFE496
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 11:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6307510E787;
	Wed,  9 Jul 2025 09:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UpUeRTBX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD06310E77C
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 09:54:06 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-ae0c4945c76so828600666b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jul 2025 02:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752054845; x=1752659645; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E0kHpP5i2ngSA3Sw3J1NI+quQCnNlgoAbETX3ByAGJI=;
 b=UpUeRTBXawuj2yZn0NGKnjLj7Ao7/cwsLt8U9hrYeMa14w7eCSXMudnHr0N2lubeU4
 jJaCLILOQui2UVaYQwYchTN6fpQYmFXfTrqMYfT5d5touBQg5LfMstmt8TxuGGCVU1fu
 +L98DlHyeZzbMXkRI4y8bgf7QaToZPpk4jd0V6i97OzlHpzPA38ZZbGIEDqJ1qsTxXr8
 T4Te/r/EnLOtdK6rylOoumdk08IPRnPmbz7EH9l/POMAYf9U8S2gWqYWjQbFX5egZvg2
 EZr4XeSqowoa8wxeJJLnh3Yy8GxXZdMedlwrJSnvTQYYbHVCVHoksVI5pJxSRn8Ak8VF
 2PeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752054845; x=1752659645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E0kHpP5i2ngSA3Sw3J1NI+quQCnNlgoAbETX3ByAGJI=;
 b=Znoof1R8pdGDwN9Vsk9e7JreQhf/6kcGHw982uWCDVHligbMejyk/aL8qWJ8QPSr65
 DdK/KE5C2D1ZY9hRXIb7EZkAsK1HcGOBqNDvjEuDlmG0dYTsr4JLmTZHxge4GpibwA1s
 FEt5Y95jUxVxABnU6+EFkkweJ76ZtkFxKuiDScxR+ta8M5o92w/9UUsqcpG0k5Os/pgC
 CPMdBDTFJKzCrZjrjhQ0623R+w11EozhBSXE8DuPlufQZdZj5OkN7sJz8jc5fwN7EVrL
 BxG08W/VVYuBVoDVQo1N6EpHyJnSEO+UwqwMCSYEjL/y1euixh3/q68Uw40fQEzbiP2h
 PrBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0rKfr0eoteH23CFP94N/a9AZYDk3i+HHpP+nq5Js483XzbvyXVfqN5AucGaN3EGqEK8ydKy+dNOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKgEf3laOrflAO8Us8dlaVQtp7IDUv8NPwZwcKL+fcHtZZWXyK
 MSosbOtzcBq7wcFmwALcZsxELztMiLX8Hif1yr/mdBWG9c6H+Hq/lDFD
X-Gm-Gg: ASbGncvcrzCGjfUiPAmonSwxr2bQlH4y3chyPaeF1k6JMROM/jhKneIJi6aBB9Hdc7m
 FwqIW7AGpqe/4xOzjefEJhWMeg1X0ZgK9BIjX+im2c29n0y33NKlD5hIEN7wTj23sfghZTYcHn0
 zqPJh22y7OtU8AbUvZkpEujZIGepS2IWaKOVuMe8bnwcG0voN6TAyE7XflTCCCCA7IArjKdpNjB
 xVWNDofvOzg0GzboIsyssWC7J5Min9BTSEqoKRjKi5ZTEuxxX0A9sRjOudAE7l2Jx2CKhxrvIpQ
 1H568R4tb1O4sNl956UTMewPUtZ8gfCLKx/yqY6eGrJEFYJILskC4QccbXY43GnDfWPeQAu0Pgz
 0U+VTvaZ3XK+tcuGPzWilfN5LKjrflUgUp1BEwcdcSiMLVDjTvnnknBmLXpCQAqXHsQ842tGPks
 qAcUucaTE7h1DS
X-Google-Smtp-Source: AGHT+IGjd7FZzn2E4+1+r3KAfN0fmCjMp6g2KB2CfdNSgBMVIEYmZJPa8CZAYUipGL+5OBEmOiH7Mg==
X-Received: by 2002:a17:907:84a:b0:ae3:24c:6a21 with SMTP id
 a640c23a62f3a-ae6cf6035b4mr181071566b.26.1752054844679; 
 Wed, 09 Jul 2025 02:54:04 -0700 (PDT)
Received: from kubuntu-e14.homenet.telecomitalia.it
 (host-87-21-242-88.retail.telecomitalia.it. [87.21.242.88])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6949cb2sm1074172266b.67.2025.07.09.02.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 02:54:04 -0700 (PDT)
From: Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
To: tzimmermann@suse.de,
	deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Giovanni Di Santi <giovanni.disanti.lkl@gmail.com>
Subject: [PATCH v3 0/3] fbdev: kyro: Convert to managed device resources
Date: Wed,  9 Jul 2025 11:53:51 +0200
Message-ID: <20250709095354.931589-1-giovanni.disanti.lkl@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series aims to address the TODO item "Request memory regions in all
fbdev drivers" from Documentation/gpu/todo.rst.
Additionally, it also converts the kyro framebuffer driver to use managed device
functions.

In summary, it converts the driver to use:
1. Managed PCI device enable and region request functions
2. Managed ioremap for MMIO registers  
3. Managed ioremap_wc for screen memory

This simplifies error handling and removes the need for manual cleanup
in the remove function.

Changes in v3:
- Split into a patch series as suggested by Thomas Zimmermann [1]
- Convert ioremap calls to devm_ variants

Changes in v2:
- Use pcim_enable_device() instead of pci_enable_device()
- Use pcim_request_all_regions() instead of pci_request_regions()
- Removed manual cleanup code as it's now automatic

[1] https://lore.kernel.org/lkml/fd6403d7-93f4-4fa4-ad0d-3ab91cba8183@suse.de/

Giovanni Di Santi (3):
  fbdev: kyro: Add missing PCI memory region request
  fbdev: kyro: Use devm_ioremap() for mmio registers
  fbdev: kyro: Use devm_ioremap_wc() for screen mem

 drivers/video/fbdev/kyro/fbdev.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

-- 
2.43.0

