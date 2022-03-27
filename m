Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C544E8AED
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 00:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD34F10E9E4;
	Sun, 27 Mar 2022 22:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2104 seconds by postgrey-1.36 at gabe;
 Sun, 27 Mar 2022 22:48:34 UTC
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC5010E9E4
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 22:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pV29UjFYmfGiilWwyQNlVjFasUPj3jYxTXkmhIEc+XM=; b=BHU0kAa6aPENeSDuCOZPHe56vV
 qpF2gdxkZMMrvTtlKbEeVlVbwiTgG6JyTb8gftMEhKrtLpNWaa+2q0BPH+65voWXa1q7NN74q6Xdk
 th1/kUkA2/12kAlPqkbJPBL3Si86W2SSXNOyEEuh7Fp3oFnLn4XHtogu9xe0fsk6lC6HHPI+/SoWe
 /NHJMOZOmG8fXRXW03DiEq5WOfqfZ0XQGrYz4QtaSqmmpE711w5bK9DZIDbCGu/oQ2Sk/YnoRC/E/
 XNqvj0NZF2EzGzZSoW1oBeq1O9wY8LiKpiKXFVd2l2KSn+jaQ13cZcuNRw8ppEu2TFNTZf8SvCShR
 WPYY8utA==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1nYb8V-00024d-Uh; Mon, 28 Mar 2022 01:13:23 +0300
MIME-Version: 1.0
Date: Mon, 28 Mar 2022 01:13:21 +0300
From: Jyri Sarha <jyri.sarha@iki.fi>
To: Xiaomeng Tong <xiam0nd.tong@gmail.com>
Subject: Re: [PATCH] tilcdc: tilcdc_external: fix an incorrect NULL check on
 list iterator
In-Reply-To: <20220327061516.5076-1-xiam0nd.tong@gmail.com>
References: <20220327061516.5076-1-xiam0nd.tong@gmail.com>
Message-ID: <eadea5bbb40c168ee1bbf955c10979cb@iki.fi>
X-Sender: jyri.sarha@iki.fi
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: tomba@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-03-27 9:15, Xiaomeng Tong wrote:
> The bug is here:
> 	if (!encoder) {
> 
> The list iterator value 'encoder' will *always* be set and non-NULL
> by list_for_each_entry(), so it is incorrect to assume that the
> iterator value will be NULL if the list is empty or no element
> is found.
> 
> To fix the bug, use a new variable 'iter' as the list iterator,
> while use the original variable 'encoder' as a dedicated pointer
> to point to the found element.
> 
> Cc: stable@vger.kernel.org
> Fixes: ec9eab097a500 ("drm/tilcdc: Add drm bridge support for
> attaching drm bridge drivers")
> Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>

Thanks for the patch. Good catch.

Reviewed-by: Jyri Sarha <jyri.sarha@iki.fi>
Tested-by: Jyri Sarha <jyri.sarha@iki.fi>

I'll apply this to drm-misc-next in couple of days.

Best regards,
Jyri

> ---
>  drivers/gpu/drm/tilcdc/tilcdc_external.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c
> b/drivers/gpu/drm/tilcdc/tilcdc_external.c
> index 7594cf6e186e..3b86d002ef62 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
> @@ -60,11 +60,13 @@ struct drm_connector
> *tilcdc_encoder_find_connector(struct drm_device *ddev,
>  int tilcdc_add_component_encoder(struct drm_device *ddev)
>  {
>  	struct tilcdc_drm_private *priv = ddev->dev_private;
> -	struct drm_encoder *encoder;
> +	struct drm_encoder *encoder = NULL, *iter;
> 
> -	list_for_each_entry(encoder, &ddev->mode_config.encoder_list, head)
> -		if (encoder->possible_crtcs & (1 << priv->crtc->index))
> +	list_for_each_entry(iter, &ddev->mode_config.encoder_list, head)
> +		if (iter->possible_crtcs & (1 << priv->crtc->index)) {
> +			encoder = iter;
>  			break;
> +		}
> 
>  	if (!encoder) {
>  		dev_err(ddev->dev, "%s: No suitable encoder found\n", __func__);
