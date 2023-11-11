Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC547E8A3B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Nov 2023 11:42:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDDA10E260;
	Sat, 11 Nov 2023 10:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B33C10E260
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 10:42:37 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so457251366b.3
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Nov 2023 02:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699699356; x=1700304156;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ge0gNi9DVXfC2vKDgGEclw0Ori58fekABd1HKK5RJHA=;
 b=dvd+2KwFw3/gxC4QHZxSKRMVLbgqLHA6QxB6YfukAqiy58NtlSu/pJGQjGfop0DKMM
 0TOkVCVZdwzV7VZ8EsCa34J1JHPQiPdwaYjMOb613yXI1Lxz2/rFMirXyZMVI6qHiypc
 cr2zBMphdVV0V3ZuoIbdHNKEgKuWAYVvgldIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699699356; x=1700304156;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ge0gNi9DVXfC2vKDgGEclw0Ori58fekABd1HKK5RJHA=;
 b=NV4dvigp8Kt4cWWO2kLTDqMwact5Mx4pxMKzTPRY4PoYKRgk7ZiNZ1Hw8USXaTHJMa
 fCBoD9XyzHLQ86+5Kjb5n1I/Sj/QxZhofSlR2H0w1W6QiHeqFDizYrbBtJfTLC0kah6u
 rhFf/WiHwSpuSX0hrd/EZ9dLc1jjQyar/eCUhJmvB/2HUJeb5ByKhsJ+tG6QQ10jUjgh
 jwgyjwHL4zEpcKKp2IlZqa1GfrJFTL60ori9uzPs4j5wqPWV1I+qhPMkg0+s20csvkx0
 djb1Q4Z3qngDugLzLu9GZ5kn+IHq8+BvbokAnw5RxHm8H9iC4GgDXmVh2v/007qHaZYv
 MIqQ==
X-Gm-Message-State: AOJu0Yys+ztmQLc98Z8QOgtCZP8jBSX1KQt+3aJX9JJpzYw6cN1ObuPf
 cscoVH/CqwHgIt7shJmoKkgY6h+GkXnF88ZP+NI6Pw==
X-Google-Smtp-Source: AGHT+IHi7umdHJSN/J3vKG6LIaXqc2IzKyZTj5K72HPZNOWFZKca+Sq8nOJ2Izx28leKgWLIeRgloQ==
X-Received: by 2002:a17:906:4c84:b0:9cb:5a8a:b19d with SMTP id
 q4-20020a1709064c8400b009cb5a8ab19dmr929295eju.5.1699699355850; 
 Sat, 11 Nov 2023 02:42:35 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 ga33-20020a1709070c2100b0099e12a49c8fsm872183ejc.173.2023.11.11.02.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:42:35 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] Fix left margin setup and code cleanup
Date: Sat, 11 Nov 2023 11:41:49 +0100
Message-ID: <20231111104225.136512-1-dario.binacchi@amarulasolutions.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-amarula@amarulasolutions.com,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Martin Kaiser <martin@kaiser.cx>, Shawn Guo <shawnguo@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series was created with the intention of fixing the left margin
setting. At the same time, I made some changes with the aim of making
the code more readable, as well as removing the errors/warnings
reported by checkpatch.


Dario Binacchi (10):
  fbdev: imxfb: fix left margin setting
  fbdev: imxfb: move PCR bitfields near their offset
  fbdev: imxfb: use BIT, FIELD_{GET,PREP} and GENMASK macros
  fbdev: imxfb: replace some magic numbers with constants
  fbdev: imxfb: add missing SPDX tag
  fbdev: imxfb: drop ftrace-like logging
  fbdev: imxfb: add missing spaces after ','
  fbdev: imxfb: Fix style warnings relating to printk()
  fbdev: imxfb: use __func__ for function name
  fbdev: imxfb: add '*/' on a separate line in block comment

 drivers/video/fbdev/imxfb.c | 179 ++++++++++++++++++++----------------
 1 file changed, 102 insertions(+), 77 deletions(-)

-- 
2.42.0

