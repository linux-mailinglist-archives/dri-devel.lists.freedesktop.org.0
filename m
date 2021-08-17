Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A83F3EE41A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 04:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FF96E0EA;
	Tue, 17 Aug 2021 02:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D6D6E0DF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 02:02:15 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id w20so38296542lfu.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Aug 2021 19:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=epNIxrUppPqeTZ7mqYHZ01PA0yMU2Orit2VrfzLmV54=;
 b=do/TU6chvs8vMTkbDooRR2le11a6dh31qQVCxAc7wOduy19pmJbPiDhCLSTW07+CiQ
 lX1UHH+momYHwEekQWF3+aDYU1DQ0RDhN/1yb57l3/MoXLQ4etTEOP8O8ae2lW4AL+Za
 /Ig741ScZy8GeVujaRJFJl1byQr4c0qhzuTIcVYJXj3ZIUlMMV33AdJGfFaVp/35T9Z3
 tLafaUFFsxgE8Ulj2u3UGa1E0VsRWGioUkpZb2KmZTpyjp593sml9+CxDqgkcDkHz7PF
 kqXCCJ2qSOebx4BN7sn/BIN967CvGzUVYuiVUzk063GET/0akxTM9iiSpfRNlLzKhfcU
 OYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=epNIxrUppPqeTZ7mqYHZ01PA0yMU2Orit2VrfzLmV54=;
 b=EFGRiaRZlG91k/Zyz0ImIlZqLWiKSYWmsRvHCme4zFjMt2nCBbPVsmd3OCWDiXVptB
 56Hjj5mZBXAswNMK4o0kQDU5Czeqv254XuQ6HzS7UA7lsxXB+Q1DQb785foP+lBo4Xd2
 vJZclQMFVW7ijDXJ25n/Vy/5uYv4z14da70bU0EjQ/JRpx1PuLmLoGr77MklhO5KFA8L
 GO3HlSS75aLw3o3u7g+7Mu6jQyE4HyHIeWltlQxjWhfmMni37OjukLFcAaaTAjLuGG7f
 ZX7pJi6bFNlrAdsTJ/yL2e9GjMcCnSjdthCJ57xnddkxzHIYvq/HIkeDRzSWDeHnJeTP
 V91w==
X-Gm-Message-State: AOAM531ZxBfSiMIHCx2TD6jBw6f6KuAega5hOdiBD7JH8Sk7hQ1xDI32
 8B3NFoKWcH84nbdQV+5tmE8=
X-Google-Smtp-Source: ABdhPJwkJ2gDPVNWO4IqYvAkxmWMhu2XsrbQEMpDkRgki8Oh4US6ZUSIQkq7gq/j1HoSU2SPC5P74Q==
X-Received: by 2002:a19:760b:: with SMTP id c11mr577972lff.224.1629165733949; 
 Mon, 16 Aug 2021 19:02:13 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.gmail.com with ESMTPSA id i24sm51729lfc.293.2021.08.16.19.02.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 19:02:13 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/3] drm/tegra: uapi: Fix wrong mapping end address in case
 of disabled IOMMU
Date: Tue, 17 Aug 2021 05:01:52 +0300
Message-Id: <20210817020153.25378-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817020153.25378-1-digetx@gmail.com>
References: <20210817020153.25378-1-digetx@gmail.com>
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

All jobs are failing on Tegra20 because it doesn't use IOMMU and mapping
function uses size of mapping that is zero instead of BO size, fix it.

Fixes: d7c591bc1a3f ("drm/tegra: Implement new UAPI")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/uapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index dc16a24f4dbe..690a339c52ec 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -222,7 +222,7 @@ int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data, struct drm_f
 		mapping->iova = sg_dma_address(mapping->sgt->sgl);
 	}
 
-	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->size;
+	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->gem.size;
 
 	err = xa_alloc(&context->mappings, &args->mapping, mapping, XA_LIMIT(1, U32_MAX),
 		       GFP_KERNEL);
-- 
2.32.0

