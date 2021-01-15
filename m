Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0002F7C96
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 14:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D906E40D;
	Fri, 15 Jan 2021 13:27:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BB16E40D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 13:27:52 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89D6D527;
 Fri, 15 Jan 2021 14:27:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610717270;
 bh=1e+Cq1tmwETjYMmNBUSatTqVYwWvGeI0xiVYiJsCsDI=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=sqv0D1jsL8LKyJ4mkZVaBSp3v+v0Mmxpf2VDkLzplqCDpBrbwWhvHHSF3C3PoslZj
 aVEuGaueqNjb9GDGEBTQyo+INSGMzuN7pjZLNCZWXNpqSRg1ehI+lpWypfVDsppxpt
 fSVS+ePaThzM5WOcLhHOU9LRcv0N+k3h+pDexeso=
Subject: Re: [PATCH] drm: rcar-du: Use drmm_encoder_alloc() to manage encoder
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com>
 <X/94HaYff+rNR2YD@pendragon.ideasonboard.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <62ed8b3b-1bf8-31a7-da9e-012788afbf87@ideasonboard.com>
Date: Fri, 15 Jan 2021 13:27:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/94HaYff+rNR2YD@pendragon.ideasonboard.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: David Airlie <airlied@linux.ie>, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 13/01/2021 22:45, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Wed, Jan 13, 2021 at 05:02:53PM +0000, Kieran Bingham wrote:
>> The encoder allocation was converted to a DRM managed resource at the
>> same time as the addition of a new helper drmm_encoder_alloc() which
>> simplifies the same process.
>>
>> Convert the custom drm managed resource allocation of the encoder
>> with the helper to simplify the implementation, and prevent hitting a
>> WARN_ON() due to the handling the drm_encoder_init() call directly
>> without registering a .destroy() function op.
>>
>> Fixes: f5f16725edbc ("drm: rcar-du: Use DRM-managed allocation for encoders")
> 
> We could equally point to the patch that has added drmm_encoder_alloc(),
> but I'm fine taking the blame :-)

Perhaps, we could point there indeed, I'm surprised that patch/series
didn't seem to add any users of drmm_encoder_alloc() as far as I can see.

I don't think this is a "blame" though. Just a reference to the most
relevant change.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 

Thanks.

Kieran


>> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 31 +++++------------------
>>  1 file changed, 6 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
>> index ba8c6038cd63..ca3761772211 100644
>> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
>> @@ -48,21 +48,12 @@ static unsigned int rcar_du_encoder_count_ports(struct device_node *node)
>>  static const struct drm_encoder_funcs rcar_du_encoder_funcs = {
>>  };
>>  
>> -static void rcar_du_encoder_release(struct drm_device *dev, void *res)
>> -{
>> -	struct rcar_du_encoder *renc = res;
>> -
>> -	drm_encoder_cleanup(&renc->base);
>> -	kfree(renc);
>> -}
>> -
>>  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>>  			 enum rcar_du_output output,
>>  			 struct device_node *enc_node)
>>  {
>>  	struct rcar_du_encoder *renc;
>>  	struct drm_bridge *bridge;
>> -	int ret;
>>  
>>  	/*
>>  	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
>> @@ -101,26 +92,16 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>>  			return -ENOLINK;
>>  	}
>>  
>> -	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
>> -	if (renc == NULL)
>> -		return -ENOMEM;
>> -
>> -	renc->output = output;
>> -
>>  	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
>>  		enc_node, output);
>>  
>> -	ret = drm_encoder_init(&rcdu->ddev, &renc->base, &rcar_du_encoder_funcs,
>> -			       DRM_MODE_ENCODER_NONE, NULL);
>> -	if (ret < 0) {
>> -		kfree(renc);
>> -		return ret;
>> -	}
>> +	renc = drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, base,
>> +				  &rcar_du_encoder_funcs, DRM_MODE_ENCODER_NONE,
>> +				  NULL);
>> +	if (!renc)
>> +		return -ENOMEM;
>>  
>> -	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_encoder_release,
>> -				       renc);
>> -	if (ret)
>> -		return ret;
>> +	renc->output = output;
>>  
>>  	/*
>>  	 * Attach the bridge to the encoder. The bridge will create the
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
