Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96ED227A5F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24B589913;
	Tue, 21 Jul 2020 08:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D052389B61
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 14:08:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595254111; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=u84s0Oh8TMQ1rIjjsEb2S8vXqRDL0j7r71i7Aou5Cjw=;
 b=qlG35WcQ9AMEU0B4eoofBgr/yn6DeLUzE/5M9Z9HPPSM/RxtqAvwHfzmf3hhJgVLoHgDezOT
 wICOedS3Js4SunJ0SwZaj8Mur/Wgj55Tdn+N9bGzA+tm4Idkz36vtXot+0JOD+gbhJ62adO1
 E4Brsg3OEAjjNjvZOZVnQ81pjEA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f15a55b65270fa595e661f3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 14:08:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 29E8EC433C6; Mon, 20 Jul 2020 14:08:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C4C77C433C9;
 Mon, 20 Jul 2020 14:08:25 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 20 Jul 2020 19:38:25 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH] drm/msm: dsi: dev_pm_opp_put_clkname() only when an
 opp_table exists
In-Reply-To: <1595246509-6584-1-git-send-email-rnayak@codeaurora.org>
References: <1595246509-6584-1-git-send-email-rnayak@codeaurora.org>
Message-ID: <9a03714af98ea8fefa491d049f142789@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run,
 linux-arm-msm-owner@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-20 17:31, Rajendra Nayak wrote:
> Its possible for msm_dsi_host_init() to fail early, before
> dev_pm_opp_set_clkname() is called. In such cases, unconditionally
> calling dev_pm_opp_put_clkname() in msm_dsi_host_destroy() results
> in a crash. Put an additional check so that dev_pm_opp_put_clkname()
> is called only when an opp_table exists.
> 
> Fixes: f99131fa7a23 ("drm/msm: dsi: Use OPP API to set clk/perf state")
> Reported-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 0a14c4a..4f580f7 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1936,7 +1936,8 @@ void msm_dsi_host_destroy(struct mipi_dsi_host 
> *host)
> 
>  	if (msm_host->has_opp_table)
>  		dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
> -	dev_pm_opp_put_clkname(msm_host->opp_table);
> +	if (msm_host->opp_table)
> +		dev_pm_opp_put_clkname(msm_host->opp_table);
>  	pm_runtime_disable(&msm_host->pdev->dev);
>  }

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
