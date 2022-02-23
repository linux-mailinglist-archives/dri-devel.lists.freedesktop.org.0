Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810244C1138
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 12:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063F110E882;
	Wed, 23 Feb 2022 11:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812CA10E880
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 11:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645615521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+QcuT0UppOn6GKRBWknD8eYzy3WTZ7uGZvfSR5huaVc=;
 b=Rde0X2PWMFsF0TnBCTgJwW+EvgCIwWMnYHVtX3VEwWd6bcW6ZtFZo+u3sf9nGEj9X2jb0b
 l6ZgmkL19O29UhhYSTlT9A163N1Nl/jUtxJOA52s3n68MDCXZ9gUvgA+SngNzRk58rPQnN
 TMC2llouP4R0UMnUPCmgDRzjSiyqycg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-IFWzkMPcPRSr5mcWpeLdPA-1; Wed, 23 Feb 2022 06:25:20 -0500
X-MC-Unique: IFWzkMPcPRSr5mcWpeLdPA-1
Received: by mail-ej1-f69.google.com with SMTP id
 13-20020a170906328d00b006982d0888a4so6921867ejw.9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 03:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+QcuT0UppOn6GKRBWknD8eYzy3WTZ7uGZvfSR5huaVc=;
 b=Bsx9ZhL/lQZ61fsIDgfUy1Y2M2rBZ82oTJb5otFB3cQdM/ATwKK44e807res1VX6TS
 HviJKpTH+mayh+oZGDxFrM0ngGNgTgOOw/Ej0gb9hN7XDhx2G+QGlg8WOP6AoUv7XY+Z
 GKmzTo+R5/iW6FoFRbTHXY9rEWQft3Ys3B+qww0xxv8jiAaRBYKpYOsjY0TByKl5gFq0
 EPyAIj3vJ599LoOUvzPMRtUjzNIhnDMvjGZn/NdDJDcSvRiZ43qngql8009RKTNulwez
 anhgcp32qTtwabNEGHQ/JkVBMP1vGygZJVrbg2S8obkRoqnGoTM/29MxeY6vLs15Y1B3
 wzJw==
X-Gm-Message-State: AOAM531SgvRcef0YjdjCXEAOFoI8i9m//TjbzunYmFmG52FvIxXea8sy
 DUA6pF86xTli5mDAKp2lFHyaoBEQWGOeT35Lg9gQK430DNetncZbTjfYlonZG3TDW7NR/JVlWsr
 mwPE86xTGbpZZ4PqxNUr8p4YrlQZ9
X-Received: by 2002:a17:907:7711:b0:6ce:e03c:e1e2 with SMTP id
 kw17-20020a170907771100b006cee03ce1e2mr22853556ejc.769.1645615519026; 
 Wed, 23 Feb 2022 03:25:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxp3AkWRB7G2tT29HIAo1E8ok6y0HpponoCO053pSavzIaq8781LJXiiepaH4MC4iy59YJElg==
X-Received: by 2002:a17:907:7711:b0:6ce:e03c:e1e2 with SMTP id
 kw17-20020a170907771100b006cee03ce1e2mr22853545ejc.769.1645615518783; 
 Wed, 23 Feb 2022 03:25:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id k9sm287562eje.202.2022.02.23.03.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 03:25:18 -0800 (PST)
Message-ID: <e84ea711-69ce-62ac-cb2e-2d87d75355fa@redhat.com>
Date: Wed, 23 Feb 2022 12:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] drm/simpledrm: Add "panel orientation" property on
 non-upright mounted LCD panels
To: Thomas Zimmermann <tzimmermann@suse.de>
References: <20220221220045.11958-1-hdegoede@redhat.com>
 <99294308-3d33-f24c-1292-20a88980e973@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <99294308-3d33-f24c-1292-20a88980e973@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2/22/22 20:14, Thomas Zimmermann wrote:
> Hi
> 
> Am 21.02.22 um 23:00 schrieb Hans de Goede:
>> Some devices use e.g. a portrait panel in a standard laptop casing made
>> for landscape panels. efifb calls drm_get_panel_orientation_quirk() and
>> sets fb_info.fbcon_rotate_hint to make fbcon rotate the console so that
>> it shows up-right instead of on its side.
>>
>> When switching to simpledrm to fbcon renders on its side. Call the
> 
> Maybe '... fbcon renders sidewards.'

that does not sound entirely right to me, so I've gone with:

"When switching to simpledrm the fbcon renders on its side."

as suggested by Javier (so s/to/the/ ).

> 
>> drm_connector_set_panel_orientation_with_quirk() helper to add
>> a "panel orientation" property on devices listed in the quirk table,
>> to make the fbcon (and aware userspace apps) rotate the image to
>> display properly.
>>
>> Cc: Javier Martinez Canillas <javierm@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thank you both for the review/ack. I'm currently doing a
test-build of drm-misc-next with the patch with amended
commit msg applied. Once that is done I'll push this out
to drm-misc-next.

Regards,

Hans



>> ---
>>   drivers/gpu/drm/tiny/simpledrm.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
>> index 04146da2d1d8..11576e0297e4 100644
>> --- a/drivers/gpu/drm/tiny/simpledrm.c
>> +++ b/drivers/gpu/drm/tiny/simpledrm.c
>> @@ -798,6 +798,9 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
>>       if (ret)
>>           return ret;
>>       drm_connector_helper_add(connector, &simpledrm_connector_helper_funcs);
>> +    drm_connector_set_panel_orientation_with_quirk(connector,
>> +                               DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
>> +                               mode->hdisplay, mode->vdisplay);
>>         formats = simpledrm_device_formats(sdev, &nformats);
>>   
> 

