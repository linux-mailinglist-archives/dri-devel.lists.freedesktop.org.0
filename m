Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5FA3EEE3E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 16:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB416E1A5;
	Tue, 17 Aug 2021 14:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991CD6E1A5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 14:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BmnFzovQ9Haolq57Ptw31553/tzU0GgOckIaL9j5SsE=; b=NGdaUQEKqB8/YSTc1sCtIH5Hw1
 bbzNh7mYB7smfydmila8CwiQ6Es1BCvl6IUepRroJBnk6QvW2EFWLNfk7eSH60t8UswcKDIg7KJft
 5cnKYcbvd883DeKMMdI4SZItWL+CvKSUIcI8zo/q7iQ9HXcyzsrMP44czX0zGYQuxXlLpMmqdbAMW
 ohzWXociJRQcojGKIDTHF1GCULQ5jTaM7stcLgq9WlOEtjnN8NvtQaz9Mdrj5Z8HH1sRlEM582aI6
 dIm5lF26ihzU10rPhEEYlvc5kbNFaPvNJcEPE/tZbVIIj4qkY3s0+vnDH8cJDFyGuzp3nlSy+72Vl
 WEpmrJ0A==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:49657
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mFzpR-0002G6-A8; Tue, 17 Aug 2021 16:12:33 +0200
Subject: Re: [PATCH 7/7] drm/gud: Add module parameter to control emulation:
 xrgb8888
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, peter@stuge.se,
 linus.walleij@linaro.org, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20210817122917.49929-1-noralf@tronnes.org>
 <20210817122917.49929-8-noralf@tronnes.org>
 <YRu+bNmOrExbWEBT@phenom.ffwll.local>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f5d0ac5b-cb3f-9112-d57b-e06319c2f41b@tronnes.org>
Date: Tue, 17 Aug 2021 16:12:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRu+bNmOrExbWEBT@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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



Den 17.08.2021 15.49, skrev Daniel Vetter:
> On Tue, Aug 17, 2021 at 02:29:17PM +0200, Noralf Trønnes wrote:
>> For devices that don't support XRGB8888 give the user the ability to
>> choose what's most important: Color depth or frames per second.
>>
>> Add an 'xrgb8888' module parameter to override the emulation format.
>>
>> Assume the user wants full control if xrgb8888 is set and don't set
>> DRM_CAP_DUMB_PREFERRED_DEPTH if RGB565 is supported (AFAIK only X.org
>> supports this).
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>> ---
>>  drivers/gpu/drm/gud/gud_drv.c | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_drv.c
>> index 3f9d4b9a1e3d..60d27ee5ddbd 100644
>> --- a/drivers/gpu/drm/gud/gud_drv.c
>> +++ b/drivers/gpu/drm/gud/gud_drv.c
>> @@ -30,6 +30,10 @@
>>  
>>  #include "gud_internal.h"
>>  
>> +static int gud_xrgb8888;
>> +module_param_named(xrgb8888, gud_xrgb8888, int, 0644);
>> +MODULE_PARM_DESC(xrgb8888, "XRGB8888 emulation format: GUD_PIXEL_FORMAT_* value, 0=auto, -1=disable [default=auto]");
>> +
>>  /* Only used internally */
>>  static const struct drm_format_info gud_drm_format_r1 = {
>>  	.format = GUD_DRM_FORMAT_R1,
>> @@ -530,12 +534,12 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>  		case DRM_FORMAT_RGB332:
>>  			fallthrough;
>>  		case DRM_FORMAT_RGB888:
>> -			if (!xrgb8888_emulation_format)
>> +			if (!gud_xrgb8888 && !xrgb8888_emulation_format)
>>  				xrgb8888_emulation_format = info;
> 
> Shouldn't the emulation format be per drm_device instance?

Ideally yes, this happens during probe so I can only use a module
parameter and I don't know how to differenciate the devices since the
DRM minor is unknown at this point and implementing filtering on the
various USB properties (VID:PID, serial number,..) will involve a lot of
code. So I've kept it simple. It can be expanded on later should someone
come up with a clever idea.

Noralf.

> -Daniel
> 
>>  			break;
>>  		case DRM_FORMAT_RGB565:
>>  			rgb565_supported = true;
>> -			if (!xrgb8888_emulation_format)
>> +			if (!gud_xrgb8888 && !xrgb8888_emulation_format)
>>  				xrgb8888_emulation_format = info;
>>  			break;
>>  		case DRM_FORMAT_XRGB8888:
>> @@ -543,6 +547,9 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>  			break;
>>  		}
>>  
>> +		if (gud_xrgb8888 == formats_dev[i])
>> +			xrgb8888_emulation_format = info;
>> +
>>  		fmt_buf_size = drm_format_info_min_pitch(info, 0, drm->mode_config.max_width) *
>>  			       drm->mode_config.max_height;
>>  		max_buffer_size = max(max_buffer_size, fmt_buf_size);
>> @@ -559,7 +566,7 @@ static int gud_probe(struct usb_interface *intf, const struct usb_device_id *id)
>>  	}
>>  
>>  	/* Prefer speed over color depth */
>> -	if (rgb565_supported)
>> +	if (!gud_xrgb8888 && rgb565_supported)
>>  		drm->mode_config.preferred_depth = 16;
>>  
>>  	if (!xrgb8888_supported && xrgb8888_emulation_format) {
>> -- 
>> 2.32.0
>>
> 
