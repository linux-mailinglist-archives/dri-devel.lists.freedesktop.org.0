Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C52956AC2
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 14:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCFE810E256;
	Mon, 19 Aug 2024 12:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RdRynTBY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3683610E233
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 09:20:43 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-2d3da6d3f22so2553941a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724059243; x=1724664043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nbobm+SvJn90B7VhyfLGtuxVw/Xxjzt17uREQeGl98o=;
 b=RdRynTBYIFrVpki3HIh7/ix33UUwcID+3cQ+00wvY6mUFnnR2WThbrQsc3GfApv+Gs
 PzRRJQtnE3AbevFIjqPyqer4KBjOzg4l7LA6Y7RPKni8+2tbTdutwLAf1ZV8pAGYPVDL
 QFsZya6d8gXhJVUbiUNsq7CeHVeCOVDw4cT9oMjusHcxX7gU70BrrhLEvldb+cC62SzG
 Jh4EJjMP0TdHL8nr9dPxBJYr9SS0sesxBxO5vd0sr6g6SwzDuICarjocAbpbjefvhCIK
 XA2OzLFVUk3Rp4y6S7KcMrhU5ywAu314NLo1xO1XG1fElDGpymmtQ3KVxk8NrHefivo2
 S2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724059243; x=1724664043;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Nbobm+SvJn90B7VhyfLGtuxVw/Xxjzt17uREQeGl98o=;
 b=MGKcZsuhQCwdExAVGnJioGpNgrxVqh8JJXOtV/6z+rfxykn8FUIKMPd3tJPFgKKjjj
 1hNLSgOAI+FPyxPxgguEKLZR8js5dWrpw5My6on4Cg9LtKo05iHJbjAQNdT/Oc2Ln1qO
 ftEzDwobwurj4rKAq+XcHkm3uT3pjzGv+hr/j0reStDZV3Q+UwCbRvaCwKuu8eqg7Ujp
 1gM5HZNjS4/pNXEhB4vnMREicBKNoErDn1sNynEHHen0R0/3j6JFBuZd4V4tnzkY3G+G
 W9adyBJc7+91rmkyHv7Noma9dMTCMnvmj3uvVgUBnlt2f4D+CmOuZ6eqAjV23qGT5dvD
 Zt1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1Rps5INeyxSIFaER2e7ngWafkBcfP69wXOfKB0QJxBi6zBugksHbb50PWoEVVswO5p9zcgyaOuXg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxre7k38jIppTRBor56/Gr3ubCe9YvGsnXO8vEewWHBV9GzWHis
 8wOPoH9+f5TJUtrVMCzC/U86+zjFzpT3/oH+7lznRP8nClHlMOol
X-Google-Smtp-Source: AGHT+IHDa/2IA2Yd+H2It0zLuwLh7wv+zRrgCvpU/eheNHrt2fXxv3jnNWn//LpF09xkmOdVGCrL0w==
X-Received: by 2002:a17:90a:fa06:b0:2d3:da99:b41b with SMTP id
 98e67ed59e1d1-2d3dffc6078mr10004128a91.17.1724059242482; 
 Mon, 19 Aug 2024 02:20:42 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d3e3d97f2asm6750538a91.53.2024.08.19.02.20.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 02:20:42 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v2 0/2] Add support for nuvoton ma35 nand controller
Date: Mon, 19 Aug 2024 09:20:35 +0000
Message-Id: <20240819092037.110260-1-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 19 Aug 2024 12:25:04 +0000
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

This patch series adds the mtd nand driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35 mtd nand driver.

v2:
  - Update nuvoton,ma35d1-nand.yaml
    - Adjust the order and remove any unnecessary items.
    - Add 'nand-ecc-step-size' and 'nand-ecc-strength' to the required list.
  - Update ma35d1 mtd nand driver
    - Fix coding style.
    - Use 'devm_clk_get' instead of 'of_clk_get'.
    - Use 'dev_err_probe' instead of 'dev_err'.
    - Remove 'pr_info' and 'of_match_ptr'.
    - Remove 'module_init' and 'module_exit'.


Hui-Ping Chen (2):
  dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
  mtd: rawnand: nuvoton: add new driver for the Nuvoton MA35 SoC

 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     |   93 ++
 drivers/mtd/nand/raw/Kconfig                  |    8 +
 drivers/mtd/nand/raw/Makefile                 |    1 +
 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c    | 1070 +++++++++++++++++
 4 files changed, 1172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
 create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c

-- 
2.25.1

