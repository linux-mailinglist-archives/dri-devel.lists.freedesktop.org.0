Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA005EF660
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 15:23:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF70E10EA60;
	Thu, 29 Sep 2022 13:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC2010EA6C
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 13:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664457813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oG/yZJxiQer6lEcGvbF50JzMIcd4QWOG+Bq41x4RRP8=;
 b=aJ+JMjipyCrNFv+OL9hfNeS+mWMj1UkCxTYFRbFveaRIObDGqmmjZN/lglJL/NKH69xCrd
 rXQ4NZ0kTsNGsNRQBakMj8CKdMzqRqteZSaTGMgByadPFrW7IFDGY1XlTNpHI9OW8GW7a/
 wrQxngZfnjPdCd5397B8MOwYzly/dTw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-263-vOAd_9awMB22eDDLB_XYwQ-1; Thu, 29 Sep 2022 09:23:32 -0400
X-MC-Unique: vOAd_9awMB22eDDLB_XYwQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r23-20020adfb1d7000000b002286358a916so530404wra.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=oG/yZJxiQer6lEcGvbF50JzMIcd4QWOG+Bq41x4RRP8=;
 b=2ysEvXRdvvs3+29EDzOvF3cSFInOG2zZ6Xyh0Ht7tD/QOptwLKLfQ5y9MnmAvWC/mU
 jvsJrIQPot3I+SBot4ZbeNCxK5gi7Foz/y0Iy0mRCizM75DwKSP5UIXZfHkPAxYDhk7E
 uhL5gaYV2jFgCm5vMTqOArfaPcAF1e/v49BHb3NRNtL/848zi533Evl7bC5fg2gvF0n/
 jnmEWWDizhF8LfqN805y2IZyCnLRF4LO9s4n3zTSp012iIAb4JRcQNPhJM4w1UuywH8T
 IgBnFVpHmw8DNJD6wdY/iEglu5CC7YZdB4FKnhfnSD8rJvoeaTINmvg5uZIryN79/UXi
 xDNg==
X-Gm-Message-State: ACrzQf0mzwZ+3rSNBpbNgwSoMmsQQslT8ThYNmcfi/Ce6c4z1djlb/Dh
 AG7UB41wln+H2o/2mkvpg0RNt44Yo0YkqLfSlX9WJWPzld1C26GsGzW5V0tHRTIDuLoNqBLuUoU
 DQzM4K5hipbYZBRFT/hkgdW+8qqW5
X-Received: by 2002:a05:600c:2241:b0:3b4:88aa:dcba with SMTP id
 a1-20020a05600c224100b003b488aadcbamr2372924wmm.203.1664457810926; 
 Thu, 29 Sep 2022 06:23:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6zT8rTh7Ln6nBwE0Ij220TM1S5fwk1RgEkcl1aNUY40pgAlT2Eq/Ouac+UATRYNhRIrr5Prw==
X-Received: by 2002:a05:600c:2241:b0:3b4:88aa:dcba with SMTP id
 a1-20020a05600c224100b003b488aadcbamr2372905wmm.203.1664457810687; 
 Thu, 29 Sep 2022 06:23:30 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l17-20020a05600c4f1100b003b4ff30e566sm3114365wmq.3.2022.09.29.06.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 06:23:30 -0700 (PDT)
Message-ID: <7bc2bcad-46c8-14bd-b0fb-7bdf13ed04e5@redhat.com>
Date: Thu, 29 Sep 2022 15:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 03/16] drm/udl: Use USB timeout constant when reading EDID
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-4-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/19/22 15:03, Thomas Zimmermann wrote:
> Set the USB control-message timeout to the USB default of 5 seconds.
> Done for consistency with other uses of usb_control_msg() in udl and
> other drivers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/udl/udl_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/udl_connector.c
> index e9539829032c..cb3d6820eaf9 100644
> --- a/drivers/gpu/drm/udl/udl_connector.c
> +++ b/drivers/gpu/drm/udl/udl_connector.c
> @@ -31,7 +31,7 @@ static int udl_get_edid_block(void *data, u8 *buf, unsigned int block,
>  		int bval = (i + block * EDID_LENGTH) << 8;
>  		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
>  				      0x02, (0x80 | (0x02 << 5)), bval,
> -				      0xA1, read_buff, 2, 1000);
> +				      0xA1, read_buff, 2, USB_CTRL_GET_TIMEOUT);

Agreed, much better than an arbitrary 1 sec.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

