Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49AC41F53E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 20:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A43D6EEB0;
	Fri,  1 Oct 2021 18:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB0F6EEB0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 18:58:20 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633114701; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=6RGUn/Do/9b9P1kKWBNE3zK8dc0DYDJBT/WmkBcUBX4=;
 b=ofXb6xq900QhTO7ADxsNYrZOj0KfiZowYhSfAh7PWaz/ZYsxzQtFUCW9FZJFwW8gZwk983LM
 0dyffhDDR8hnBa6P1aKJatm+weW9Y+lIvpWMK3cbWAIZTsgbZeUOM1zdMK1U2QXmTPilHq/y
 Inhm09iql10/Wz000H4uuxz07LA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61575a49fc6e34f8cdecf5d9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 18:58:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1FC68C43460; Fri,  1 Oct 2021 18:58:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: jesszhan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 69CB5C4338F;
 Fri,  1 Oct 2021 18:58:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 01 Oct 2021 11:58:15 -0700
From: jesszhan@codeaurora.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: seanpaul@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/msm: dsi: Handle dual-channel for 6G as well
In-Reply-To: <20211001123115.GE2283@kili>
References: <20211001123115.GE2283@kili>
Message-ID: <baf1fcba58b05c90a0c7e2200a22ead1@codeaurora.org>
X-Sender: jesszhan@codeaurora.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Dan,

Thanks for the report, will take care of it.

On 2021-10-01 05:31, Dan Carpenter wrote:
> Hello Sean Paul,
> 
> The patch a6bcddbc2ee1: "drm/msm: dsi: Handle dual-channel for 6G as
> well" from Jul 25, 2018, leads to the following
> Smatch static checker warning:
> 
> 	drivers/gpu/drm/msm/dsi/dsi_host.c:729 dsi_calc_clk_rate_6g()
> 	warn: wrong type for 'msm_host->esc_clk_rate' (should be 'ulong')
> 
> drivers/gpu/drm/msm/dsi/dsi_host.c
>     721 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool
> is_bonded_dsi)
>     722 {
>     723         if (!msm_host->mode) {
>     724                 pr_err("%s: mode not set\n", __func__);
>     725                 return -EINVAL;
>     726         }
>     727
>     728         dsi_calc_pclk(msm_host, is_bonded_dsi);
> --> 729         msm_host->esc_clk_rate = 
> clk_get_rate(msm_host->esc_clk);
>                 ^^^^^^^^^^^^^^^^^^^^^^
> I don't know why Smatch is suddenly warning about ancient msm code, but
> clock rates should be unsigned long.  (I don't remember why).
> 
>     730         return 0;
>     731 }
> 
> regards,
> dan carpenter

Thanks,
Jessica Zhang
