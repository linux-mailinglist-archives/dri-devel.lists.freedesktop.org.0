Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E447764C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 16:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC34610E652;
	Thu, 16 Dec 2021 15:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14A6F10E652
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m8Imnupy9DCgTMxOF7vL/jVXbid1w7fM/mxpS0AUg+s=; b=JzxgUh5fve8WsO+XfVTOzA1r7T
 ggInYoWAeCNA68UhSJZaOMYUyspdF4m50HaAvqv8dwzuXrWCTN4KIAclk0hrtY1ZKjUQnlnI268Pc
 LRt6dWotCWyQvmmOuy6uwdQQ2XzsStDkC0EhUqZEQXU0fiMvX78omXqNDoKsUS0zyJutYGvnQYICw
 KCLxj9huFbPgicl1ZvWGd5USYYn1iVr8SyRoroaqrI+DUgb45I0IRu2WgL1ehYxK8ZOr5FeXU+XOY
 rg0iEyDSDpW0WVTSnt5PBaikontnB4cZ2P+xqwZnZgfcAOZNYSon34iDwKgGj6cGGxEndIjepWdUZ
 pD12uv4g==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:55318
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mxsz1-00026Q-H7; Thu, 16 Dec 2021 16:47:51 +0100
Message-ID: <4059e488-38fe-2b79-191c-6e921f262c9f@tronnes.org>
Date: Thu, 16 Dec 2021 16:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 11/60] drm/gud: Add support for the nomodeset kernel
 parameter
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-12-javierm@redhat.com>
 <5b1d9578-1f74-a808-c4d4-6e8c38dd57fc@tronnes.org>
 <041430de-c0a0-d0eb-81d5-eeee3204ce23@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <041430de-c0a0-d0eb-81d5-eeee3204ce23@suse.de>
Content-Type: text/plain; charset=UTF-8
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



Den 16.12.2021 09.20, skrev Thomas Zimmermann:
> Hi
> 
> Am 15.12.21 um 22:37 schrieb Noralf Trønnes:
>>
>>
>> Den 15.12.2021 01.59, skrev Javier Martinez Canillas:
>>> According to disable Documentation/admin-guide/kernel-parameters.txt,
>>> this
>>> parameter can be used to disable kernel modesetting.
>>>
>>> DRM drivers will not perform display-mode changes or accelerated
>>> rendering
>>> and only the systewm system framebuffer will be available if it was
>>> set-up.
>>>
>>> But only a few DRM drivers currently check for nomodeset, make this
>>> driver
>>> to also support the command line parameter.
>>>
>>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>>> ---
>>>
>>
>> I don't understand why this is applicable to USB drivers, there's no way
>> the firmware can setup a framebuffer and continue pushing pixels over
>> USB when Linux has been given control over the USB bus?
>>
>> The same argument goes for the SPI drivers in drm/tiny/ as well.
> 
> The intended semantics of the option is to disable every display output
> except for the buffer provided by the firmware.
> 

If that's the case this patch is:

Acked-by: Noralf Trønnes <noralf@tronnes.org>

> With USB it still would still disable the driver. That's useful if only
> for debugging. There are also systems with hard-wired USB displays where
> one cannot just unplug the adapter.
> 
> Admittedly, USB graphics is a bit of an odd use case, but neither is it
> too far fetched IMHO.
> 
> Best regards
> Thomas
> 
>>
>> Noralf.
>>
>>>   drivers/gpu/drm/gud/gud_drv.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/gud/gud_drv.c
>>> b/drivers/gpu/drm/gud/gud_drv.c
>>> index 3f9d4b9a1e3d..4d253d249512 100644
>>> --- a/drivers/gpu/drm/gud/gud_drv.c
>>> +++ b/drivers/gpu/drm/gud/gud_drv.c
>>> @@ -446,6 +446,9 @@ static int gud_probe(struct usb_interface *intf,
>>> const struct usb_device_id *id)
>>>       u32 *formats;
>>>       int ret, i;
>>>   +    if (drm_firmware_drivers_only())
>>> +        return -ENODEV;
>>> +
>>>       ret = usb_find_bulk_out_endpoint(intf->cur_altsetting, &bulk_out);
>>>       if (ret)
>>>           return ret;
>>>
> 
