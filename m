Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E97826A00F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 09:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78AA889FD7;
	Tue, 15 Sep 2020 07:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5330189FD7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 07:46:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 60D98275;
 Tue, 15 Sep 2020 09:46:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1600155964;
 bh=bYDqPnqpooXsEDeam8BGmUOFbripSj3QGugEdUyT1v0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ocvLL2mAIq0ccmCpVEBFpyiNTVNZJ/OmcHr8HPJWMnPQXRECP82q9n4AH724Hy867
 gbqnFKSbRkseQqt82FCJkX8HC0FI46q9/wdmSbFH7L9OY5PogWSP3dxPVuINRVbE8m
 cB699Cv6sTCrjbl7wLYuji/nzlJo9qy6BeL5O+Ls=
Date: Tue, 15 Sep 2020 10:45:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jason Yan <yanaijie@huawei.com>
Subject: Re: [PATCH v2] drm/panel: samsung: make vint_table static
Message-ID: <20200915074536.GB13260@pendragon.ideasonboard.com>
References: <20200915035632.2227052-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915035632.2227052-1-yanaijie@huawei.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Hulk Robot <hulkci@huawei.com>, thierry.reding@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

Thank you for the patch.

On Tue, Sep 15, 2020 at 11:56:32AM +0800, Jason Yan wrote:
> This eliminates the following sparse warning:
> 
> drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c:217:15: warning: symbol
> 'vint_table' was not declared. Should it be static?

The commit message should mention that it also make the table const. I'd
write "drm/panel: samsung: Make vint_table static const" in the subject
line, and add here

"While at it, make the table const as it is never modified."

With those changes,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> index 1d1c79a18613..0ab1b7ec84cd 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c
> @@ -214,7 +214,7 @@ static const u8 gamma_tbl[S6E3HA2_NUM_GAMMA_STEPS][S6E3HA2_GAMMA_CMD_CNT] = {
>  	  0x00, 0x00 }
>  };
>  
> -unsigned char vint_table[S6E3HA2_VINT_STATUS_MAX] = {
> +static const unsigned char vint_table[S6E3HA2_VINT_STATUS_MAX] = {
>  	0x18, 0x19, 0x1a, 0x1b, 0x1c,
>  	0x1d, 0x1e, 0x1f, 0x20, 0x21
>  };

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
