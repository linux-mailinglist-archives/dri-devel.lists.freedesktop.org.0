Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49AD81651A7
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 22:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6846ECB9;
	Wed, 19 Feb 2020 21:33:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D0A6E87B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 21:33:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582147994; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=0JN/ehYDL0O2oEeVVUyuLdKga5FoJgnDhpfMUdo+78Q=;
 b=atYZpJm3UatKHVVZSmtkuxTWhFRpi4FCYNi/m2F4uq47+7Z69qtRRXQil/r5/MZczbyjg+1c
 o0pCHWWGQSaSdRthE91uDg9iSqWxL+uXTfNIhjHYbw5nJzjYrkYhCSl2s0XVP7irppLNy1bp
 Jtb7FJH/4gFByeZz6sVQ3qnRL4E=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4da990.7fabc2c17c00-smtp-out-n01;
 Wed, 19 Feb 2020 21:33:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0C83BC447A2; Wed, 19 Feb 2020 21:33:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EC98DC43383;
 Wed, 19 Feb 2020 21:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC98DC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
From: Jordan Crouse <jcrouse@codeaurora.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 0/4] msm/gpu/a6xx: use the DMA-API for GMU memory
 allocations
Date: Wed, 19 Feb 2020 14:32:54 -0700
Message-Id: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
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

The only wrinkle is that the memory allocations need to be in a very specific
location in the GMU virtual address space so in order to get the iova allocator
to do the right thing we need to specify the dma-ranges property in the device
tree for the GMU node. Since we've not yet converted the GMU bindings over to
YAML two patches quickly turn into four but at the end of it we have at least
one bindings file converted to YAML and 99 less lines of code to worry about.

Jordan Crouse (4):
  dt-bindings: display: msm: Convert GMU bindings to YAML
  dt-bindings: display: msm: Add required dma-range property
  arm64: dts: sdm845: Set the virtual address range for GMU allocations
  drm/msm/a6xx: Use the DMA API for GMU memory objects

 .../devicetree/bindings/display/msm/gmu.txt        | 116 -----------------
 .../devicetree/bindings/display/msm/gmu.yaml       | 140 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   2 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 107 +---------------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   5 +-
 5 files changed, 149 insertions(+), 221 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/gmu.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/gmu.yaml

-- 
2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
