Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAF76D5E87
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 13:04:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C0A10E168;
	Tue,  4 Apr 2023 11:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CF310E168
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680606246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=13WWdn1CKTzFzc+LsesKqq+DZLEoqqRMtewjbJUhOYg=;
 b=Q14viZOKrKJ71tqJ75Q2kxwwjvv7+swlt1QcYF/VcpQ3aSSD8DgjrabP0g8mvy68lT4DKj
 cQsfQGL1DyRH1gtNSnJlnzGKAwU844pztZjf0V1aVTyXrQzzG+7Ns81b2wlXwrjki3jmG8
 CMVJits6Pp+Q8UcsHOjx51michlLAo4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-6_CxFVREMii1si3Tsolhfw-1; Tue, 04 Apr 2023 07:03:02 -0400
X-MC-Unique: 6_CxFVREMii1si3Tsolhfw-1
Received: by mail-wm1-f70.google.com with SMTP id
 iv18-20020a05600c549200b003ee21220fccso15921602wmb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 04:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680606182;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=13WWdn1CKTzFzc+LsesKqq+DZLEoqqRMtewjbJUhOYg=;
 b=FWhJY9WQlfL1RErsDnh0J3FgMIuTU5nqJbF0otBP8GBXCWuIHZ01uzSr+I2FJvYaxz
 MuvHZrtNo1gQNooJI/D9OPvpNLY35mEO7H+srUWIjKNQHP6Oq5N+IrPArzqxXFEWpIyz
 o6uqYjCFN3uNmazSNP4q2zDKFHkBhKoY78igWVUwM8jM9Ve4V/OZpkKbQ0AvOhlO/qpQ
 cxRIM47ZNT/6Hh6WTWBng5I4ncA+e7RZ/gkigNHDQOf8CJyHAIbJxUxIYnk0OU+7dWjq
 871O3QnrQmfTSF5N2oI0dnGjtkX9qmueoGzb4fx7G+zIWOqlGr34DaMTMVSvg/sghQXH
 wV5g==
X-Gm-Message-State: AAQBX9cJ51RLwDGenSAPl3r7vaHv3y/53gtBMTU1AiQA4wEAgXxTZIDJ
 tzy467A2A9zoWgUuU/F+hD2apURCEGa+op901WsVyWUEQQekzTxHvlxn5pYirD5Gt4+U81QQgIW
 uNfxLVIL31KPqKQJMrbU53LlYxpeX
X-Received: by 2002:a05:600c:450b:b0:3ee:9652:932 with SMTP id
 t11-20020a05600c450b00b003ee96520932mr15688906wmo.12.1680606181922; 
 Tue, 04 Apr 2023 04:03:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350bZe97z66nGDbGC4iLvwGvTU+YVGSsMC3kGyTmdIJ9mqYGQOg24liH7lcGvttolkuPS/0R1tw==
X-Received: by 2002:a05:600c:450b:b0:3ee:9652:932 with SMTP id
 t11-20020a05600c450b00b003ee96520932mr15688890wmo.12.1680606181666; 
 Tue, 04 Apr 2023 04:03:01 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c3-20020a05600c0ac300b003edf2dc7ca3sm14882758wmr.34.2023.04.04.04.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 04:03:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Sui Jingfeng
 <suijingfeng@loongson.cn>, Maxime Ripard <mripard@kernel.org>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Li Yi
 <liyi@loongson.cn>, Christian Koenig <christian.koenig@amd.com>, Helge
 Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] video/aperture: fix typos
In-Reply-To: <87355fex1f.fsf@minerva.mail-host-address-is-not-set>
References: <20230404040101.2165600-1-suijingfeng@loongson.cn>
 <0ad03743-0224-b154-a149-e3e4d54b252d@suse.de>
 <87355fex1f.fsf@minerva.mail-host-address-is-not-set>
Date: Tue, 04 Apr 2023 13:03:00 +0200
Message-ID: <87zg7ndi57.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Javier Martinez Canillas <javierm@redhat.com> writes:

[...]

>>>   	/*
>>>   	 * Remove the device from the device hierarchy. This is the right thing
>>> -	 * to do for firmware-based DRM drivers, such as EFI, VESA or VGA. After
>>> +	 * to do for firmware-based fb drivers, such as EFI, VESA or VGA. After
>>
>> That sentences is not well phrased. Maybe say 'This is required for 
>> firmware-provided graphics, such as EFI, VESA or VGA.'
>>
>
> Graphic drivers or display drivers would indeed be more accurate here. But
> I think that "fb drivers" is still well pharsed since the are other places
> where either fbdev or DRM drivers for firmware-provided framebuffers are
> named like that.
>

Sui,

Maybe you could post a follow-up patch to improve the comment as suggested
by Thomas?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

