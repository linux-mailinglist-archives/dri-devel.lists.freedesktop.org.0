Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D20F2199BEF
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 18:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE8E6E85A;
	Tue, 31 Mar 2020 16:44:07 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CBB6E340
 for <dri-devel@freedesktop.org>; Tue, 31 Mar 2020 16:44:05 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1585673045; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=uOkXbeZcr2DV9rCBPPxEDbCuvkJ222eXEUFzpRLZi3A=;
 b=N9W03z24MrnmtphnsRP4PE3HCs4bPnHBXW7Wjw4awbDpAseW1EmY5Pff7JsTmljSrtGw/NUg
 +5DBk2l+Rb2qYw3o0FNvJc0bgClLrvGe9WpfvgQssazp/FHHz2g/u4M9cYoxcKjgDEe/sRiu
 /lDCwWbSVPXXL22eznAg3QPL4eI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e837353.7f4ab7319e68-smtp-out-n04;
 Tue, 31 Mar 2020 16:44:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EF2E9C433BA; Tue, 31 Mar 2020 16:44:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B0708C433F2;
 Tue, 31 Mar 2020 16:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0708C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 31 Mar 2020 10:43:59 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Subject: Re: [PATCH 4/5] drm: msm: a6xx: Fix off by one error when setting
 GPU freq
Message-ID: <20200331164359.GA11573@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sharat Masetty <smasetty@codeaurora.org>,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, mka@chromium.org,
 sibis@codeaurora.org, saravanak@google.com, viresh.kumar@linaro.org
References: <1585641353-23229-1-git-send-email-smasetty@codeaurora.org>
 <1585641353-23229-5-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1585641353-23229-5-git-send-email-smasetty@codeaurora.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: devicetree@vger.kernel.org, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, mka@chromium.org,
 dri-devel@freedesktop.org, viresh.kumar@linaro.org,
 freedreno@lists.freedesktop.org, sibis@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 01:25:52PM +0530, Sharat Masetty wrote:
> This patch fixes an error in the for loop, thereby allowing search on
> the full list of possible GPU power levels.
> 
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>

Oh fun. This qualifies for drm-fixes. Can you pull this out of the stack and CC
stable?

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 489d9b6..81b8559 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -176,7 +176,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
>  	if (freq == gmu->freq)
>  		return;
> 
> -	for (perf_index = 0; perf_index < gmu->nr_gpu_freqs - 1; perf_index++)
> +	for (perf_index = 0; perf_index < gmu->nr_gpu_freqs; perf_index++)
>  		if (freq == gmu->gpu_freqs[perf_index])
>  			break;
> 
> --
> 2.7.4
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
