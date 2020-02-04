Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F78151BC0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2020 14:59:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E43F6EF2E;
	Tue,  4 Feb 2020 13:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A846EF2E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2020 13:59:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t3so3229156wru.7
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Feb 2020 05:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BJj/VJzeTYCXSmbhUcjQDbcAuItdLVs6ubNcfzq/Xfw=;
 b=ho73SiSWqAGR5b42HTxbrWkw+KNYROYE5BR+cGPURQdnO5GUWI/Nbz1+CoIz8bRg/X
 3ex9i4ucKSbRcTPXxo4LoMUtHxFNuV2LjFwCsugEB6Wt7WXTLM+QBhBW4RgEXAcROISw
 BARrdYGLFuyRx6ZFqspk6NZQHHeuOl75ND9p036H1mOfLARx13wMdxkikjOp6o0m2w2E
 vxQEdzvvpcRgwAnD+JBxxGdWiZSoIelB/SyV2FIrZNou2g/cgGKxOSMI9AcDNaFHphy0
 OejiWwPaZ6dp8PsZiEraiRUEgkAjUrgAyoXNvz0RNzl2kQ1OMxCQg+x6LZb9VB+PRCbg
 k/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BJj/VJzeTYCXSmbhUcjQDbcAuItdLVs6ubNcfzq/Xfw=;
 b=FOnq8f52/SI80yjgOr78MKf2QbQbyTMi5q00mIQUev+2broVbCAxh8CZgazpuLBEcC
 ed1Yr5nbMc7011u8TdlRKcFPeo1Zt+ISSBIkLChJ+64H38Db3sWUMyN3n2xFjh4iuy6P
 6SBBnb1ugbRQVsAEIlRQzpp2GnmxAyWoAJi3bpJ65e+Jsw7lYKdqUJ2coSGb2T9FltDq
 JM0gSjfyHrqCAtWRpDTb+L5fHuvZH7SiUXpHox7Vbv13hwpdNCk8VFBJs4GPFdbwVuwh
 dghgag5Xx539OuiMDBal7PhOrvU9V02xhpDlsqfw7ku7lP/wp2IXUxW0aHpNW76DEPZV
 C71A==
X-Gm-Message-State: APjAAAV+lnIh+5siZ9SrZm49PgkCKscFkLi79VctjO3KmbdcCYIrKUC0
 wFewx9bySQVvc+z+xoN3GuE=
X-Google-Smtp-Source: APXvYqzy+rENoYJQihD6yECTOV396s8QgCpxK3W0m++0TwQ89CiWrFv+2JOIg59kNH8io1Rz9PI24Q==
X-Received: by 2002:a5d:42c6:: with SMTP id t6mr22212782wrr.151.1580824778576; 
 Tue, 04 Feb 2020 05:59:38 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
 by smtp.gmail.com with ESMTPSA id x10sm29607471wrv.60.2020.02.04.05.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 05:59:37 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 3/3] gpu: host1x: Set DMA direction only for DMA-mapped buffer
 objects
Date: Tue,  4 Feb 2020 14:59:26 +0100
Message-Id: <20200204135926.1156340-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200204135926.1156340-1-thierry.reding@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The DMA direction is only used by the DMA API, so there is no use in
setting it when a buffer object isn't mapped with the DMA API.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/host1x/job.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/job.c b/drivers/gpu/host1x/job.c
index 8198a4d42c77..a10643aa89aa 100644
--- a/drivers/gpu/host1x/job.c
+++ b/drivers/gpu/host1x/job.c
@@ -248,6 +248,7 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 				goto unpin;
 			}
 
+			job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
 			job->unpins[job->num_unpins].dev = host->dev;
 			phys_addr = sg_dma_address(sgt->sgl);
 		}
@@ -255,7 +256,6 @@ static unsigned int pin_job(struct host1x *host, struct host1x_job *job)
 		job->addr_phys[job->num_unpins] = phys_addr;
 		job->gather_addr_phys[i] = phys_addr;
 
-		job->unpins[job->num_unpins].dir = DMA_TO_DEVICE;
 		job->unpins[job->num_unpins].bo = g->bo;
 		job->unpins[job->num_unpins].sgt = sgt;
 		job->num_unpins++;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
