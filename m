Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1EF227A60
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0896589A1F;
	Tue, 21 Jul 2020 08:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250D48973E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 13:02:15 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595250140; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+8B2VUGhaduI3uJTC0qKLOS8vpqrG5yTlP23NYTVMv4=;
 b=iZTcDh4wMFowoTOBD72gf9oPvnBo+AuFS4Vkx1CiakBL8O5A/pOs8qnvORk2J2gDpYZnIqPq
 gJmd6LbuYwl80FwYnzwBYeUTvey5W3mWn3uShTInxnZQrhejb8atdYsYwiwN2n9nyeQlBn9w
 x1qVlxV91RApyhh93IUUJtn4FvE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5f1594d08e9b2c49c63cb737 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 12:57:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 8EE12C43395; Mon, 20 Jul 2020 12:57:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 01AF3C433C6;
 Mon, 20 Jul 2020 12:57:50 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 20 Jul 2020 18:27:50 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dpu: dev_pm_opp_put_clkname() only when an
 opp_table exists
In-Reply-To: <1595247476-12968-1-git-send-email-rnayak@codeaurora.org>
References: <1595247476-12968-1-git-send-email-rnayak@codeaurora.org>
Message-ID: <d21e2fba7f1cb9bd61d6d3a6cc4feb8c@codeaurora.org>
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

On 2020-07-20 17:47, Rajendra Nayak wrote:
> Its possible that dpu_bind() fails early enough before
> dev_pm_opp_set_clkname() is called. In such cases, unconditionally
> calling dev_pm_opp_put_clkname() in dpu_unbind() can result in
> a crash. Put an additional check so that dev_pm_opp_put_clkname()
> is called only when an opp_table exists.
> 
> Fixes: aa3950767d05 ("drm/msm/dpu: Use OPP API to set clk/perf state")
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index f2bbce4..843a1c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1079,7 +1079,8 @@ static void dpu_unbind(struct device *dev,
> struct device *master, void *data)
> 
>  	if (dpu_kms->has_opp_table)
>  		dev_pm_opp_of_remove_table(dev);
> -	dev_pm_opp_put_clkname(dpu_kms->opp_table);
> +	if (dpu_kms->opp_table)
> +		dev_pm_opp_put_clkname(dpu_kms->opp_table);
>  }
> 
>  static const struct component_ops dpu_ops = {

Tested-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
