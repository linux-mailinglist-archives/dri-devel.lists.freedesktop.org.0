Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B878D17E347
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 16:17:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581BE6E180;
	Mon,  9 Mar 2020 15:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7ED6E180
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 15:17:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1583767073; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=YVYbQhWH93yMJttmVAt9QPfzMj6O51Wc3s1MVkrJ7yE=;
 b=nbQCtsi5fJX6UJuVCcTudsrEbQqkn9ElJ+5ttf5n0CCvmOuhFycdgJYQOEsbdqj2TesMUxJs
 phBTFmCg5aoGo1I0dTaOcmoWJJPujwdKxIJfmuHcDgM1T9CB41VxsrZlXbS80QWMEh0rmAgh
 Ve2XbVoQ7g7P/4oEqvLwSvQAIto=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e665e20.7f2937357c70-smtp-out-n03;
 Mon, 09 Mar 2020 15:17:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 832B2C44798; Mon,  9 Mar 2020 15:17:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B462C433D2;
 Mon,  9 Mar 2020 15:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B462C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 0/2] msm/gpu/a6xx: use the DMA-API for GMU memory
 allocations
Date: Mon,  9 Mar 2020 09:17:44 -0600
Message-Id: <1583767066-1555-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
 linux-kernel@vger.kernel.org, smasetty@codeaurora.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
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
two relatively minor allocations anyway. In short, this is essentially what the
DMA API was created for so replace a bunch of memory management code with two
calls to allocate and free DMA memory and we're fine.

In a previous version of this series I added the dma-ranges property to the
device tree file for the GMU and updated the bindings to YAML. Rob correctly
pointed out that we didn't need dma-ranges any more but I'm still pushing the
YAML conversion because it is good and we'll eventually need it anyway so why
not.

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

 .../devicetree/bindings/display/msm/gmu.txt        |  65 -----------
 .../devicetree/bindings/display/msm/gmu.yaml       | 123 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 113 ++-----------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   6 +-
 4 files changed, 135 insertions(+), 172 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.yaml

-- 
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
