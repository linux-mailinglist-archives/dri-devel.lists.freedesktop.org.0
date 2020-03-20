Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD21E18C5DE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 04:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572A26E0FF;
	Fri, 20 Mar 2020 03:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410996EA2F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 03:36:36 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584675400; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=znBJGhFi3/HMKJ6NsPkvkKTgdVlBcafwD2Un8aWndTg=;
 b=wX3eXeSNJhOjckI1aDEC1L4UdwskQps2pTteMaJeegi/tp2UAxnW3eJTO4aPtCwTyI/5LPH8
 QjO7ScoayTyKkNUYIjPFkweddd0sbzGxVTDoLNwe/jnB/W9hjaF/Oqb1qK/z5ptE+FnaZ9Eq
 HlV8FKMd/9VWys2sR+0Et1ZZ/pI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e743a3c.7f5cc37128b8-smtp-out-n01;
 Fri, 20 Mar 2020 03:36:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B95DFC44793; Fri, 20 Mar 2020 03:36:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1DC4CC433D2;
 Fri, 20 Mar 2020 03:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1DC4CC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v6 0/2] msm/gpu/a6xx: use the DMA-API for GMU memory
 allocations
Date: Thu, 19 Mar 2020 21:36:09 -0600
Message-Id: <20200320033611.7623-1-jcrouse@codeaurora.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, smasetty@codeaurora.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Christoph Hellwig <hch@infradead.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 Brian Masney <masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


When CONFIG_INIT_ON_ALLOC_DEFAULT_ON the GMU memory allocator runs afoul of
cache coherency issues because it is mapped as write-combine without clearing
the cache after it was zeroed.

Rather than duplicate the hacky workaround we use in the GEM allocator for the
same reason it turns out that we don't need to have a bespoke memory allocator
for the GMU anyway. It uses a flat, global address space and there are only
two relatively minor allocations anyway. In short this is essentially what the
DMA API was created for so replace a bunch of memory management code with two
calls to allocate and free DMA memory and we're fine.

In a previous version of this series I added the dma-ranges property to the
device tree file for the GMU and updated the bindings to YAML. Rob correctly
pointed out that we didn't need dma-ranges any more but I'm still pushing the
YAML conversion because it is good and we'll eventually need it anyway so why
not.

v6: Check return value of dma_set_mask_and_coherent per Christoph Hellwig

v5: Refresh on Brian Masney's patch that removes sram from gmu.txt [1]

v4: Use dma_alloc_wc() wrappers per Michael Ruhl.

v3: Fix YAML description per RobH and remove dma-ranges and replace it with the
correct DMA mask in the GMU device. Convert the iova type to a dma_attr_t to
make it 32 bit friendly.

v2: Fix the example bindings for dma-ranges - the third item is the size
Pass false to of_dma_configure so that it fails probe if the DMA region is not
set up.

[1] https://patchwork.freedesktop.org/patch/356869/?series=74446&rev=1

Jordan Crouse (2):
  dt-bindings: display: msm: Convert GMU bindings to YAML
  drm/msm/a6xx: Use the DMA API for GMU memory objects

 .../devicetree/bindings/display/msm/gmu.txt   |  65 ---------
 .../devicetree/bindings/display/msm/gmu.yaml  | 123 ++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         | 115 ++--------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |   6 +-
 4 files changed, 137 insertions(+), 172 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.yaml

-- 
2.17.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
