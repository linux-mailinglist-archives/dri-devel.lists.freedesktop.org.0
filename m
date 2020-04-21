Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9AA1B3849
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 08:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1EC6E9D6;
	Wed, 22 Apr 2020 06:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2D86E303
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 16:45:51 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id a7so1583641pju.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 09:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dkKRjvPolkdN+Xm1/24QKsRrOCdugSbTYL+Ykb1FDCo=;
 b=B2N/BJbg+oipDuuEOBfnU5D/XYc6sWk8sb9VJi8vR8iB5YmcJCPG7/gBesD+9EvChX
 P7kzpgmrXvDzCIiBUOtt/k264UAk9f+yMho3icl19QaFfrRS/qmY+y+L3gTyzpsNP/RR
 t/ieyjgMNqu++s8hbJXwi3osDm/xt3XFPk1U27V/akXBXLcc7u3aoomrlyXmWeqExnrb
 ZiSPfgmqaz0OA/WW2BPxF2YT1DliXTIBK4Q2Z0FAgNjCAXWhdg/Bq8zYYyxMUVtCCtRT
 9ZMFdM/6CLY2mhhBjG+2Gmd44bn4QHLlbe3+U061qZ66C3YjX9/MS2k+xSIdkSOx3DKf
 UOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dkKRjvPolkdN+Xm1/24QKsRrOCdugSbTYL+Ykb1FDCo=;
 b=DZNIKV/fuqli+AqHuAcTgyih7w8rcwGeRxAlwEQc5x395O2GdqvpNdt11lVspKXA3+
 OzpayyHob7AIgrajjLc58VLzy0OfrDm3mgJk3VrNTVD/SBzTroCfBssNCPhJAOlBY6dz
 dGgOslQJ2LpMlUDxTnyBNzBDGlxVt25bX4K0jaceDuVAZhCYd9zB0eIeaNHnOI+kPqqM
 cx6QcYWvDfdCxpyy+xLJSl2eTXArp9LVAZkp57sAIjanOFpSc2QX2uAxSi5/NItd8MW+
 Uca1PsYaMuuPoDFdk4yUTPGptKJC6EW6FI9at/J7HquhZEdNbRReT8tjlLDlTmpRxpqa
 dCEQ==
X-Gm-Message-State: AGi0Pub5qWFU4e2YVXzxpEd/ub0O90NKAerbQm81DZ/S33beFVJW9pIa
 wV4BZNhFFLPEVcdHiRdodF0=
X-Google-Smtp-Source: APiQypLB13ofxCwS/78iQuE5OdOvYv3QrdBMPpIfjfv/UbebnxbXovFAxGys+oSvkwRrMX/HbCmQEQ==
X-Received: by 2002:a17:90b:297:: with SMTP id
 az23mr6439510pjb.85.1587487551539; 
 Tue, 21 Apr 2020 09:45:51 -0700 (PDT)
Received: from localhost ([89.208.244.140])
 by smtp.gmail.com with ESMTPSA id p2sm1948574pgh.25.2020.04.21.09.45.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Apr 2020 09:45:51 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v1] drm/bochs: fix an issue of ioremap() leak
Date: Wed, 22 Apr 2020 00:45:43 +0800
Message-Id: <20200421164543.16605-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Apr 2020 06:54:41 +0000
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
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It forgot to call bochs_hw_fini() to release related resources when
bochs_pci_probe() fail. eg: io virtual address get by ioremap().

Fixes: 81da8c3b8d3df6 ("drm/bochs: add drm_driver.release callback.")
CC: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/gpu/drm/bochs/bochs_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bochs/bochs_drv.c b/drivers/gpu/drm/bochs/bochs_drv.c
index addb0568c1af..210a60135c8a 100644
--- a/drivers/gpu/drm/bochs/bochs_drv.c
+++ b/drivers/gpu/drm/bochs/bochs_drv.c
@@ -138,6 +138,7 @@ static int bochs_pci_probe(struct pci_dev *pdev,
 	return ret;
 
 err_unload:
+	bochs_hw_fini(dev);
 	bochs_unload(dev);
 err_free_dev:
 	drm_dev_put(dev);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
