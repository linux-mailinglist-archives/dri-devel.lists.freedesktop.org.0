Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2B516598F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:46:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12DF6ED00;
	Thu, 20 Feb 2020 08:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F856EC68
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:10:01 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id e18so1309460ljn.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VHRaRIY6VC0lr/bsxS9DFYm2vnnWlx5lRwPcPyEFXY8=;
 b=gPoKimKTfqXeaHb/8TGnGKiKadlA4zsOW1otR4I/sil7LU1xLql4X/Z5B+MFOfsTop
 w/ibtafB1NiWhq7Xv+8ILNm+hTBM7E5IUfN32t5XlIVVJZnNzZudtvHPYZsBq5discGm
 LiJIoaqOEoHn0bJVztnhrUFEPj05q727TXZxPFRHiCZOVpOeq27877/zTFYAKzu2BpGd
 DsfcQMHPnzI39piTrkm80ut5XZ+iY96UV+eMlAofUXDvtjNFZHAEg9M8pXTNOvGpkBNv
 pDB11JGdX4pDVm+AyNGSP4d3Q8pDUUU40G41Spc9gd35dTl7Mgia6V15oP6akiDPas1S
 8cMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VHRaRIY6VC0lr/bsxS9DFYm2vnnWlx5lRwPcPyEFXY8=;
 b=NTpMx5b087x/KHki+kxSW1qmUPfRo4D/xy+Ljf/SlCPQ1/CNuv+6crpFHfSxZkFjQk
 iNzPEfYHc55FwAKwnKZ3TQqQQ0l/YvGsZX6MqCEbGexWXlDEjkMqAnolxfH6O9DUFTrJ
 wa5uIe9sH4vJ7sQfawFk7bB7qHbzEa552y0yyGr9dkOrVnMvCUeG/2h7VaGb3aB6pqLw
 XJzPagdaEfn+lKvV2bj2R19H3ScvnZUs5eg/6yx7G0CHS7xQPwSUZ560pAJlBglqji50
 RHKAom1zQkwI6j7T3Vpivsks0mkfRDDJTWtO9Czk5MEqaKag+X76HE1aP8YrNIVmmVqw
 DPsQ==
X-Gm-Message-State: APjAAAVOt4frrZQZoLAfAtBgJ0xNmneN/tIZhfqVJJ1BJZMaYFBlT66P
 guqe0N5U0G1jlX2wg9v4q64=
X-Google-Smtp-Source: APXvYqxvm4JywuwtvNksBuTIyRXNkm+Tp130I25jlGLt/f+T62qAbvOhoYaS6P/K1V7awdKdjw1/Hg==
X-Received: by 2002:a2e:3608:: with SMTP id d8mr16524098lja.152.1582135800094; 
 Wed, 19 Feb 2020 10:10:00 -0800 (PST)
Received: from localhost.localdomain ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id 14sm183942lfz.47.2020.02.19.10.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 10:09:59 -0800 (PST)
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] drm/sun4i: tcon: Separate quirks for tcon0 and tcon1 on
 A20
Date: Wed, 19 Feb 2020 20:08:55 +0200
Message-Id: <20200219180858.4806-3-andrey.lebedev@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200219180858.4806-1-andrey.lebedev@gmail.com>
References: <20200210195633.GA21832@kedthinkpad>
 <20200219180858.4806-1-andrey.lebedev@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:45:37 +0000
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
Cc: Andrey Lebedev <andrey@lebedev.lt>, linux-sunxi@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrey Lebedev <andrey@lebedev.lt>

Timing controllers on A20 are not equivalent: tcon0 on A20 supports
LVDS output and tcon1 does not. Separate the capabilities by
introducing independent set of quirks for each of the tcons.

Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
---
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index cc6b05ca2c69..b7234eef3c7b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -1508,6 +1508,8 @@ const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun5i-a13-tcon", .data = &sun5i_a13_quirks },
 	{ .compatible = "allwinner,sun6i-a31-tcon", .data = &sun6i_a31_quirks },
 	{ .compatible = "allwinner,sun6i-a31s-tcon", .data = &sun6i_a31s_quirks },
+	{ .compatible = "allwinner,sun7i-a20-tcon0", .data = &sun7i_a20_quirks },
+	{ .compatible = "allwinner,sun7i-a20-tcon1", .data = &sun7i_a20_quirks },
 	{ .compatible = "allwinner,sun7i-a20-tcon", .data = &sun7i_a20_quirks },
 	{ .compatible = "allwinner,sun8i-a23-tcon", .data = &sun8i_a33_quirks },
 	{ .compatible = "allwinner,sun8i-a33-tcon", .data = &sun8i_a33_quirks },
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
