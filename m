Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6B22B3B0E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 02:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2864F89DC7;
	Mon, 16 Nov 2020 01:07:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C266E925
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 15:21:03 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id v143so12478687qkb.2
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 07:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mvYHfNLs//x0UCoGzcml3CX/lFayNp6bncJ+PAIIQPg=;
 b=boEvE1jJkCl5kJSpNhQF7m+CWiLQrRnX4NgMtu+8CGdOfGnxn8Z0uaApWYc6uNYioP
 zlrG6UqUkEuW6eFK1RNAC3KMpZdDwYuCxnUz+tX10junMhLMWHuEPBZwvbKd3qEOAfDL
 Lp+EwFz9g5852MJSCOYd5xNh3eb0Gj+X/lo8govtalB2Z7KGNqGeSh0NVlwt93str0iM
 X7NrX7VK8O4HdqKdrU/Ie/gEkzzq7ogWYGTGA9Nk2iNgeFaKI0eQuKp2NJHHkB2DMwjM
 /FVfVPjuD3BQI5i+zz2ToqxgdC/tNc/AFBHseUfPVnsDyQIGJUKr/jLuT3OECxPQbXNh
 spJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mvYHfNLs//x0UCoGzcml3CX/lFayNp6bncJ+PAIIQPg=;
 b=L9A4esbMiZaHmb9JFgV8VQwwk9JbrZA4Hor/dmpPmQk6mn0+rTVOR74bt/mAJAFU3k
 TPyg+IMV9DynYpIb8cniWtEAsaOPilBsi1ETxZuaONJRmx+oH2B5eI+fC4OlZo+iTPyu
 YfvaGdKjYJKEkkNvvuFaajKo0loZvm9R6pNgHkX78B0I/VTjlF7wG01UdlMZsuTHvxOs
 0udHmgzXc+BcEhTI+WFrya4eRvOfxJXRNWaU6MAfefveS8tsGJJwdGPdyZ45/xUO1ikH
 ed1o1t7HcdNPgKEjDbiMSXbJt96tmh+nVLQ2aZf0VEf3Eyoxg0WX3PwkPY/Yq9vyvhLy
 SxnA==
X-Gm-Message-State: AOAM5316Rn89bTOBNRocZr2SkELIB0406ws/11aXwsHC80lHUwxrqq/J
 QH2Qa6VsDx7/viAtjuL+HcT5kw==
X-Google-Smtp-Source: ABdhPJzYGqTlUKPKSmkhBmM3csDOKzxzLYFelg6G+ya85IQqawa27V6Kv716IjBszDX0515vEabeeg==
X-Received: by 2002:a05:620a:2455:: with SMTP id
 h21mr6867791qkn.123.1605367262284; 
 Sat, 14 Nov 2020 07:21:02 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id h125sm8888368qkc.36.2020.11.14.07.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Nov 2020 07:21:01 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org,
	hch@lst.de
Subject: [RESEND PATCH v2 0/5] drm/msm: support for host-cached BOs
Date: Sat, 14 Nov 2020 10:17:08 -0500
Message-Id: <20201114151717.5369-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 16 Nov 2020 01:07:21 +0000
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2:
 - added patches 2/3 to enable using dma_ops_bypass
 - changed DRM_MSM_GEM_SYNC_CACHE patch to use dma_sync_sg_for_device()
   and dma_sync_sg_for_cpu(), and renamed sync flags.

Not sure I did the right thing with for the dma_ops_bypass part,
this is what I came up with reading the emails.

Jonathan Marek (5):
  drm/msm: add MSM_BO_CACHED_COHERENT
  dma-direct: add dma_direct_bypass() to force direct ops
  drm/msm: call dma_direct_bypass()
  drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent cache maintenance
  drm/msm: bump up the uapi version

 drivers/gpu/drm/msm/Kconfig                |  1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
 drivers/gpu/drm/msm/msm_drv.c              | 32 +++++++++++++++++++---
 drivers/gpu/drm/msm/msm_drv.h              |  3 ++
 drivers/gpu/drm/msm/msm_gem.c              | 31 +++++++++++++++++++++
 include/linux/dma-direct.h                 |  9 ++++++
 include/uapi/drm/msm_drm.h                 | 25 +++++++++++++++--
 kernel/dma/direct.c                        | 23 ++++++++++++++++
 8 files changed, 118 insertions(+), 7 deletions(-)

-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
