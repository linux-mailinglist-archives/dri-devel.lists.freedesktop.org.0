Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33AA7DE536
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 18:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0907810E032;
	Wed,  1 Nov 2023 17:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113D410E032
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 17:20:24 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-540c54944c4so72696a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 10:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698859222; x=1699464022; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OGYRtD14AMjlSx5ypiRtfDyWzdVtTMVzKNvsWe94RrQ=;
 b=TPXZZVCpx5GhOaYinedr8sWgK0ilbabELkC3ebrPLc1yF6JDFWCgfAtgNnoRw3Cjzj
 G68VoRdsUbmghPJq0a9/Fl2Lrm/N07JnxsHADAFjH+L7rjlwbeEszpO+HGH24FHkwgMt
 YTtHDr5JdJWmy7kSjd9HvVj9xI8AClLFPUhvfiXgDQCw7SNt3iyiNJwrwRo93W/Rqc1R
 ekPf6hALVxdu1pqeZl9LvfMpVuZvWeqlvsw5KWZuTiTWc/Qh8LbtT1cA3LcyiaKL3QWf
 p7lDx6+reZyMu0uV5LbR7NeqDz9GyibiOgn8TuQHIGDo7zni9z1fFreT/LZHT75Cj1zY
 YkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698859222; x=1699464022;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OGYRtD14AMjlSx5ypiRtfDyWzdVtTMVzKNvsWe94RrQ=;
 b=GWtGO46hwrm0jwnaU+iaOkMxi39w/A+HuDef1A+aLB8iiadxrK7ddT7QeucYXvdNAv
 xOleIZRpPuBhWSIRxFXsSmNdcxuK3BbjkjGg+pO9bM/9JXIcngajKaZyA4UIujjcCzFV
 hTFoWIGMLntYdc+dOie/zZNq+u0hnp2cPXFJPcLWCGD6Ovj6w6q8ZP8cA4By2PW0xScJ
 pb7PWm17AzKcb21I2hn3Rj2lBePYVzqFopcfPhbCRwOfaPAAv0yp2U8hNpfDnqIcqCXf
 CWyxH1AA9EaqmOSMqeoa5YCZpYyWFknK/iHZxFWQyqVjQTSLWDAWRvFLWXTPvcdZ5Vyt
 A1og==
X-Gm-Message-State: AOJu0YwIPCabpUBQ+grMTrCXVAKv2r88+FEJfdeQMKLv79Ol/cUzAgjC
 MShW7Y9VVHDM9Vhobz1iapo=
X-Google-Smtp-Source: AGHT+IHFwXKaaYWeVmJCz3wFQN72tp9xV/NmWeUU7CNkjV41PW5YpSY0drztYQcuhUhlcfRBUEtxig==
X-Received: by 2002:a50:cc48:0:b0:540:2a8f:806f with SMTP id
 n8-20020a50cc48000000b005402a8f806fmr2824158edi.3.1698859222149; 
 Wed, 01 Nov 2023 10:20:22 -0700 (PDT)
Received: from localhost
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a170906c31400b00993cc1242d4sm157958ejz.151.2023.11.01.10.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 10:20:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v2 0/2] fbdev/simplefb: Add missing simple-framebuffer features
Date: Wed,  1 Nov 2023 18:20:15 +0100
Message-ID: <20231101172017.3872242-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: linux-tegra@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Hi,

This contains two patches that bring simplefb up to feature parity with
simpledrm. The patches add support for the "memory-region" property that
provides an alternative to the "reg" property to describe the memory
used for the framebuffer and allow attaching the simple-framebuffer
device to one or more generic power domains to make sure they aren't
turned off during the boot process and take down the display
configuration.

Changes in v2:
- remove unnecessary call to simplefb_detach_genpds() since that's
  already done automatically by devres
- fix crash if power-domains property is missing in DT

Thanks,
Thierry

Thierry Reding (2):
  fbdev/simplefb: Support memory-region property
  fbdev/simplefb: Add support for generic power-domains

 drivers/video/fbdev/simplefb.c | 128 +++++++++++++++++++++++++++++++--
 1 file changed, 123 insertions(+), 5 deletions(-)

-- 
2.42.0

