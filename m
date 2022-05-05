Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A267251BA77
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 10:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A4010E1A3;
	Thu,  5 May 2022 08:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.129.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8F110E1A3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 08:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651739401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYz81dg5bl4ZI+KnAy5BTdapmYRz85hkJ+vnJKUIBv8=;
 b=AK+9WStN48Rea/AQraXYJZbK4ERR8A2v26OqNt/z3g5tSlYqI8bpJb0F4Z7XT7ZJjC3lGD
 vwPzNWzni0v+UEQHfKCs3JRterQy/5OtgDVAWRJAjGv2PVJKNS8SSfuaGoGSQuQocAStVl
 QMgQzFBtpO67Q/DvQ5NG8VcUlhUPNCE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-uZsvVlI4NHCCBlY1m0cbdA-1; Thu, 05 May 2022 04:28:39 -0400
X-MC-Unique: uZsvVlI4NHCCBlY1m0cbdA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i131-20020a1c3b89000000b00393fbb0718bso4207660wma.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 01:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fYz81dg5bl4ZI+KnAy5BTdapmYRz85hkJ+vnJKUIBv8=;
 b=bLSwWHgZqtJiBbZU4CzImfbsmpymByg/ZIwf0ZnT3Vpf+BYF21FbXRSiU5N6l4Zdk/
 ELCJDRleURouEfUjtnlDvN6rtCesY9l7uMIV+D9eeqe5anVZyaFqVaiyT5lCLFkuRF0o
 jU0i7+VY95txH7oWB5Jq/xg2HIlkTqN0QG9obIDrW/FddbiZnVpIsCzSDGciyR5Xm11h
 3H3BysSQ8lLA13sWNYmQXq5yB2AA6xyf+6Hw9pc8spMixi1G9u2LZsXPIyN/ZwOoG1qo
 pcPaetLdwb+F8hjiXByPFl7vHUU88zVZ1vPnX168BAi0w910KKsU2L/nLkqF4vdGmMy2
 8E3g==
X-Gm-Message-State: AOAM53255ikHcp9ceYJNNeMz69YMWM3cuWKbqww5HDQwyLoKB42je6Uu
 UeAnJ1z9uaFknqfP4K0CVT1EI71128NhShaLmGzhbinfnRqGu59f3eyrhA23K5Mrd/4wqZPPFCH
 PkX9wgrUqNW8ytYAnnZhClld0OrEC
X-Received: by 2002:a1c:29c3:0:b0:350:9797:b38f with SMTP id
 p186-20020a1c29c3000000b003509797b38fmr3533238wmp.22.1651739318024; 
 Thu, 05 May 2022 01:28:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh1HtWVDlzxjatPu/Dr4igigwNhESv1m4aEdiiTXztX7nlntl2xMWkAVAnsZwrAbZbONwhTw==
X-Received: by 2002:a1c:29c3:0:b0:350:9797:b38f with SMTP id
 p186-20020a1c29c3000000b003509797b38fmr3533215wmp.22.1651739317617; 
 Thu, 05 May 2022 01:28:37 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 x12-20020a05600c21cc00b003942a244f42sm5800022wmj.27.2022.05.05.01.28.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 01:28:37 -0700 (PDT)
Message-ID: <237c7fa0-744d-97c2-2bba-3f714d6c2e9d@redhat.com>
Date: Thu, 5 May 2022 10:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 2/3] fbdev/simplefb: Cleanup fb_info in .fb_destroy rather
 than .remove
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215722.56970-1-javierm@redhat.com>
 <974f4d00-89bc-a2da-6d65-ca4207300794@suse.de>
 <d9a5cb30-2d9b-50b5-d287-0ead0fe252f3@redhat.com>
 <78167587-fd2e-354c-485b-db4ee9251178@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <78167587-fd2e-354c-485b-db4ee9251178@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/5/22 10:05, Thomas Zimmermann wrote:

[snip]

>>
>> In other words, in most cases (i.e: only fbcon bound to the fbdev)
>> the driver's removal/ device unbind and the memory release will be
>> at the same time.
>>
> 
> We're one the same page here, but it's still sort of a mystery to me why 
> this works in practice.
> 
> I'm specifically talking about pci_request_regions() in vmwgfx [1]. IIRC 
> this would fail if simplefb still owns the framebuffer region. Lots of 
> systems run Plymouth during boot and this should result in failures 
> occasionally. Still, we never heard about anything.
>

Yes, I think is because Plymouth IIUC waits for a /dev/dri/card? to be
present and only uses a /dev/fb? as a fallback if a timeout expires.

At least in Fedora (even before the efifb -> simpledrm change) it will
use KMS/DRM since the DRM kernel module for the graphics device in the
machine would be in the intird.

So efifb was only used for fbcon and plymouth would only use DRM/KMS
and not its fbdev backend.

This seems to be sort of a corner case when you have {efi,simple}fb
in the early boot but the real DRM module only in the rootfs after the
initrd has done a pivot_root(2).
 
> Of course, it's always been broken (even long before real fbdev 
> hotunplugging). Switching to simpledrm resolves the problem.
>

Indeed. My opinion after dealing with these fbdev problems is that we
shouldn't try to fix all possible corner cases and just try to get rid
of fbdev as soon as possible.
 -- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

