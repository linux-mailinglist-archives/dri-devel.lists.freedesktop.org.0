Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 730951DF195
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 00:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA9CE6E131;
	Fri, 22 May 2020 22:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CAC6E03A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 22:03:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1590185007; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=sPrW0uvNk4DDK2vxmKxD2uDng1FDnCD3zI4QzTTTBjc=;
 b=H1b1WGLO4lSlAQsKiD3olMsdYHMDk0QvJpQBJDcmPcqACnTlTIQsEQpoAS7D4SyqhBF0z8BD
 QLdFgu9Koa0hix87JfOOlClnRfr4to6fNlilqYCZYViMO80ZpheBbBAROA3bWYTeL4WSPgIF
 A/7gSuLkudaQT/7tPV4G9erBhdw=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ec84c2e8cd231c403caf410 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 May 2020 22:03:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E1777C433AF; Fri, 22 May 2020 22:03:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E4CC9C433C6;
 Fri, 22 May 2020 22:03:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E4CC9C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 0/3] drm/msm: Cleanups ahead of per-instance pagetables
Date: Fri, 22 May 2020 16:03:13 -0600
Message-Id: <20200522220316.23772-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Akhil P Oommen <akhilpo@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Marek <jonathan@marek.ca>,
 Konrad Dybcio <konradybcio@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Brian Masney <masneyb@onstation.org>, Wambui Karuga <wambui.karugax@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Thomas Gleixner <tglx@linutronix.de>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, tongtiangen <tongtiangen@huawei.com>,
 Drew Davenport <ddavenport@chromium.org>, Enrico Weigelt <info@metux.net>,
 Georgi Djakov <georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are three cleanup and reorganization patches that were originally
part of one of my many per-instance pagetable stacks [1] [2] but make life
better in general and can stand on their own. Send them now to get them
out of my other stack and make that processs ever so easier.

[1] https://patchwork.kernel.org/patch/11355255/
[2] https://patchwork.kernel.org/patch/11355259/

Jordan Crouse (3):
  drm/msm: Attach the IOMMU device during initialization
  drm/msm: Refactor address space initialization
  drm/msm: Update the MMU helper function APIs

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c    | 16 ++++++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 23 ++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  8 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 18 +++------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 18 ++++-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c |  4 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 18 ++++-----
 drivers/gpu/drm/msm/msm_drv.h            |  8 +---
 drivers/gpu/drm/msm/msm_gem_vma.c        | 36 +++--------------
 drivers/gpu/drm/msm/msm_gpu.c            | 49 +-----------------------
 drivers/gpu/drm/msm/msm_gpu.h            |  4 +-
 drivers/gpu/drm/msm/msm_gpummu.c         | 10 +----
 drivers/gpu/drm/msm/msm_iommu.c          | 15 ++++++--
 drivers/gpu/drm/msm/msm_mmu.h            |  5 +--
 18 files changed, 95 insertions(+), 141 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
