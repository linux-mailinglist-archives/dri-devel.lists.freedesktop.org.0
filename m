Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1451A12E4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 19:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684FC6E13C;
	Tue,  7 Apr 2020 17:45:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706796E8BC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 17:45:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586281550; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nU06ifh6Brj3cGeXKmUySLRqf3d0w2DAOk1XWd7luPw=;
 b=ZhYs3A+9kMVQPriG1HS/7Z9s4IBdsKIEMeOObsnBxpON2UOL47pLTxF05pxe5bOmtDZRYU7O
 NivWxlivbdTJtZs51e1/0jv9QdvIyjjQuURceaK9cUBiahHAteFy3angiyXrVtAITDCxVtAf
 MK4S8/cFtLj4eTd9DKWhaDxlCzI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8cbc4b.7f8cbb37b2d0-smtp-out-n04;
 Tue, 07 Apr 2020 17:45:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5747AC433D2; Tue,  7 Apr 2020 17:45:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED autolearn=ham
 autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B201CC433F2;
 Tue,  7 Apr 2020 17:45:45 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 07 Apr 2020 10:45:45 -0700
From: abhinavk@codeaurora.org
To: Roy Spliet <nouveau@spliet.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/mdp5: Fix mdp5_init error path for
 failed mdp5_kms allocation
In-Reply-To: <20200407170737.66651-1-nouveau@spliet.org>
References: <20200407170737.66651-1-nouveau@spliet.org>
Message-ID: <2a5886971b510576343c7f4d9fb5cfe6@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: robdclark@chromium.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-04-07 10:07, Roy Spliet wrote:
> When allocation for mdp5_kms fails, calling mdp5_destroy() leads to 
> undefined
> behaviour, likely a nullptr exception or use-after-free troubles.
> 
> Signed-off-by: Roy Spliet <nouveau@spliet.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 6650f478b226..02c2c7d48bae 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -943,7 +943,8 @@ static int mdp5_init(struct platform_device *pdev,
> struct drm_device *dev)
> 
>  	return 0;
>  fail:
> -	mdp5_destroy(pdev);
> +	if (mdp5_kms)
> +		mdp5_destroy(pdev);
>  	return ret;
>  }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
