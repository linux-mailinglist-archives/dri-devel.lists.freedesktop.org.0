Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D81F190B33
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 11:37:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A797889938;
	Tue, 24 Mar 2020 10:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE0789938
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 10:37:19 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 0A6A25C0851;
 Tue, 24 Mar 2020 11:37:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585046238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nj8lxManxiulzBj3GsPAwqU+5MeTyiPDCjErsPFo3EU=;
 b=OTW1OoDDxup87jqus606zRJfVE7IQthyD/HA1RyOm92ON4QqkB9aGA3tmjfMqscmGSUprd
 vQhPltJQNk41i/eWEE2LM2zpwJrjXbpF/YLS/3m0TDAMsUJRhdyGw0E24aXCJt95El8TN8
 j2mTX4X91YrseZkZlQjRZ17v272wWeE=
MIME-Version: 1.0
Date: Tue, 24 Mar 2020 11:37:17 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 14/21] drm: mxsfb: Enable vblank handling
In-Reply-To: <c6a1ff930152e17b61ec9e032fa7e4cb@agner.ch>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-15-laurent.pinchart@ideasonboard.com>
 <c6a1ff930152e17b61ec9e032fa7e4cb@agner.ch>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <513a90d4310053fc0892ad9e45fd1a3b@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-24 00:08, Stefan Agner wrote:
> On 2020-03-09 20:52, Laurent Pinchart wrote:
>> Enable vblank handling when the CRTC is turned on and disable it when it
>> is turned off. This requires moving vblank init after the KMS pipeline
>> initialisation, otherwise drm_vblank_init() gets called with 0 CRTCs.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> With this patch applied I start to get system resets on my Colibri iMX7
> test device during system boot shortly after initializing mxsfb. It
> happens not on every boot, but rather often, I would say every second or
> third. From what I can tell the interrupt handling should be safe, but
> it seems that every now and then something races. Any idea what that
> could be?

Disregard this: It seems that my power supply was a bit too weak which
lead to the system reset every now and then. With enough juice, I run
now quite some boots with the complete patchset applied without seeing
any issues.

Sorry about that.

--
Stefan

> 
> --
> Stefan
> 
>> ---
>>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 15 +++++++++------
>>  drivers/gpu/drm/mxsfb/mxsfb_kms.c |  6 +++++-
>>  2 files changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> index e324bd2a63a5..72b4f6a947a4 100644
>> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
>> @@ -160,12 +160,6 @@ static int mxsfb_load(struct drm_device *drm,
>> unsigned long flags)
>>
>>  	pm_runtime_enable(drm->dev);
>>
>> -	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
>> -	if (ret < 0) {
>> -		dev_err(drm->dev, "Failed to initialise vblank\n");
>> -		goto err_vblank;
>> -	}
>> -
>>  	/* Modeset init */
>>  	drm_mode_config_init(drm);
>>
>> @@ -175,6 +169,15 @@ static int mxsfb_load(struct drm_device *drm,
>> unsigned long flags)
>>  		goto err_vblank;
>>  	}
>>
>> +	ret = drm_vblank_init(drm, drm->mode_config.num_crtc);
>> +	if (ret < 0) {
>> +		dev_err(drm->dev, "Failed to initialise vblank\n");
>> +		goto err_vblank;
>> +	}
>> +
>> +	/* Start with vertical blanking interrupt reporting disabled. */
>> +	drm_crtc_vblank_off(&mxsfb->crtc);
>> +
>>  	ret = mxsfb_attach_bridge(mxsfb);
>>  	if (ret) {
>>  		dev_err(drm->dev, "Cannot connect bridge: %d\n", ret);
>> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> index ac2696c8483d..640305fb1068 100644
>> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
>> @@ -322,8 +322,10 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
>>  	dma_addr_t paddr;
>>
>>  	pm_runtime_get_sync(drm->dev);
>> -
>>  	mxsfb_enable_axi_clk(mxsfb);
>> +
>> +	drm_crtc_vblank_on(crtc);
>> +
>>  	mxsfb_crtc_mode_set_nofb(mxsfb);
>>
>>  	/* Write cur_buf as well to avoid an initial corrupt frame */
>> @@ -353,6 +355,8 @@ static void mxsfb_crtc_atomic_disable(struct drm_crtc *crtc,
>>  	}
>>  	spin_unlock_irq(&drm->event_lock);
>>
>> +	drm_crtc_vblank_off(crtc);
>> +
>>  	mxsfb_disable_axi_clk(mxsfb);
>>  	pm_runtime_put_sync(drm->dev);
>>  }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
