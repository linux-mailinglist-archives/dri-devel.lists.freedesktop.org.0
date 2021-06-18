Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 520AE3AD87A
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 09:44:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9727F89D5E;
	Sat, 19 Jun 2021 07:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A096EA90;
 Fri, 18 Jun 2021 19:57:38 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id df15so3292934qvb.10;
 Fri, 18 Jun 2021 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C7EJEdD4t44D/JXomia6XzLDMkDQTa0QGymZbz46VVU=;
 b=iRFBGqOhtmYr2gGcozlyLfVZbxJpNLg5N2U+3Xj6O7liQWVYnfyPCGR/nNGUTy9/th
 K5jOnP/qtO9QsIC0PhmucEFXrUySBo+TR4ppLIZZJinOLF7Yg6L0lruM/pFEVp4y1aA2
 7igA+rJu4KkQlSy8f/P3D/8SYxloP4DPHpLwHSoZ4auiz+++P7EiWr691hfhg9J7DW/t
 TTJ8t+iKxfrFO4uCUMPcpFEWTASYzgSN8XHif1TZ8mpnTM5TRqzwsqMwQGLrC2FZue98
 I07gpIevRgvarpGUKQD/llNN8eHi0BZpYs3yWR+foLat2bq2TYmcfSbWscjPqQZx7F+C
 5dGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C7EJEdD4t44D/JXomia6XzLDMkDQTa0QGymZbz46VVU=;
 b=XQj/6etpw7lNN5ON4jP9LZDx8Y2aVpIkpn64XGwj8veuV6WwYCoN4TWWqTnTJigv+l
 xf+FRw4uVwlNVLcKYyd5u2TlCuc36iRh91BS76Xsd+aMQa6O5bEVfjpDME4m0tg+Wt5u
 9TKcP6wy2B9bnQNObDrQquKqoUDRnoYCCjX3yrDs6f4loK/K7E6pYuGGU1aYVbQAkRtY
 9ljUdb43yIuVDUoPxGaXcHMo9hHeVWGZxXvXWHyZ4hsL7PlWNIim1MVFRKk3F4aS4e4m
 N4+yg3TdV4SRcnUL8dsuso3z/8jrCoP/58CqMQNZSLd4BQo/AtLB/geGjtTSygyBkirX
 7qpQ==
X-Gm-Message-State: AOAM531+mV/plc0oKkUQiZ0wTFTW3yT3ezIWLDzqMe8jkIoShCDVS8hn
 akCltkVuVJn4gB0DhjhmMkY=
X-Google-Smtp-Source: ABdhPJyIUyQDxz2UY0b7qp2wXD/+ssfkJ79/j/7N/t8FSsiZad6mriv6DGGePeCP5WLb8DKxfk+8aA==
X-Received: by 2002:ad4:5042:: with SMTP id m2mr7417541qvq.29.1624046257839;
 Fri, 18 Jun 2021 12:57:37 -0700 (PDT)
Received: from localhost ([207.98.216.60])
 by smtp.gmail.com with ESMTPSA id z6sm4628404qke.24.2021.06.18.12.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 12:57:37 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Marc Zyngier <maz@kernel.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Alexey Klimov <aklimov@redhat.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-hwmon@vger.kernel.org
Subject: [PATCH 0/3] for_each_*_bit: move to find.h and reconsider
Date: Fri, 18 Jun 2021 12:57:32 -0700
Message-Id: <20210618195735.55933-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 19 Jun 2021 07:44:34 +0000
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
Cc: Yury Norov <yury.norov@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

for_each_bit() macro family uses find_bit() functions, so it's better
to have for_each_bit() and find_bit() functions in the same header. 

This series puts for_each_bit() to a proper place and optimizes its
usage over the kernel.

The series is based on this:
https://lore.kernel.org/linux-arch/20210612123639.329047-1-yury.norov@gmail.com/

The full series can be found here:
https://github.com/norov/linux/commits/bm-final

Yury Norov (3):
  include/linux: move for_each_bit() macros from bitops.h to find.h
  find: micro-optimize for_each_{set,clear}_bit()
  Replace for_each_*_bit_from() with for_each_*_bit() where appropriate

 arch/x86/kernel/apic/vector.c         |  4 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c |  4 ++--
 drivers/hwmon/ltc2992.c               |  3 +--
 include/linux/bitops.h                | 34 ---------------------------
 include/linux/find.h                  | 34 +++++++++++++++++++++++++++
 5 files changed, 39 insertions(+), 40 deletions(-)

-- 
2.30.2

