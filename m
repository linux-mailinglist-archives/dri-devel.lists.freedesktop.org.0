Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A1353D898
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jun 2022 23:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092C911B55B;
	Sat,  4 Jun 2022 21:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F6C11B559
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jun 2022 21:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654377590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=biGb1LIeV3oDXMzLTt8yH29/Uud1ibwNh8spx4nPUag=;
 b=GKr7l/2Ku5bW8VbpgjMzXwRo/Npo61iFL7Y20ifbJcPMxJI1fqdc5EmQo6jllDEjVdvNP5
 O/UTepZrEaYkFWCptrzCnK8SFDevuk5W9CeKLwj3yH8USmIhIK7pZaS7XO27Q1nCEO4zvV
 qG3iW/OC8NmNRE0pEZoZwTD2OzBPHVc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-RID8D-BvMg6AMr_Dh87rdw-1; Sat, 04 Jun 2022 17:19:48 -0400
X-MC-Unique: RID8D-BvMg6AMr_Dh87rdw-1
Received: by mail-ed1-f70.google.com with SMTP id
 o17-20020a50fd91000000b0042dbded81deso7726447edt.0
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jun 2022 14:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=biGb1LIeV3oDXMzLTt8yH29/Uud1ibwNh8spx4nPUag=;
 b=UHDO4FJ15grQ9Bzn5OGhEwoBeawP1OXrz/OscPT67u3vp+MId14eGVGLL5UKNNV8XW
 vY6uNxU6yeJ3nBLgovyPXhL0JkE3iRu39jzYWtAewLULVpEjiSWe4u4tzILbxLr4kmIJ
 zFAzzii2iMnBLUyGc6G+1DoXNixU9U3zYjxVQV4cjSwkqUwa+zHCjl0syx+iz4ZZ/xeG
 OJW9F82HUGn88eA+DSpLlQbcYNhOXcGtWknNBol3qvLnd+hC3K2f3V8Bt6q77ryL8xm1
 dqOupB3BtYlpLZtWnwjxJo3jUSjlV/YrdX3nhDS1eL/UGRqL6zPbIOOWFPBOepB2NhFi
 7iPg==
X-Gm-Message-State: AOAM530EoYE2Hc80QmhJtq6eNnbyABvwKeir8Pi+bDRFlBhzmsfm80ER
 03KAkSmdp6qtC8qYbURJTXhm2g8uwzwD74Gda+ZXDVjnjJ2ikzuHVEUok6Dn3IfYzbvNgPmuG9c
 WaegUHUvTvZ7UVkLLg/WKnY6KMa/Z
X-Received: by 2002:a17:907:9721:b0:70c:65e7:2aa5 with SMTP id
 jg33-20020a170907972100b0070c65e72aa5mr11350984ejc.132.1654377587186; 
 Sat, 04 Jun 2022 14:19:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaLjhGsZ1R3gGgw586LIcKRkJePrSFDMmCYX9YkAgAyoFRBNQI17p9kHYaGxjblXqHIJFpCw==
X-Received: by 2002:a17:907:9721:b0:70c:65e7:2aa5 with SMTP id
 jg33-20020a170907972100b0070c65e72aa5mr11350972ejc.132.1654377586966; 
 Sat, 04 Jun 2022 14:19:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 gk2-20020a17090790c200b006febce7081esm4435400ejb.177.2022.06.04.14.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jun 2022 14:19:46 -0700 (PDT)
Message-ID: <18519d7e-6594-3b05-dfa5-9fcd580c8fea@redhat.com>
Date: Sat, 4 Jun 2022 23:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/6] drm: Add mouse cursor hotspot support to atomic KMS
To: Simon Ser <contact@emersion.fr>, Zack Rusin <zackr@vmware.com>
References: <20220602154243.1015688-1-zack@kde.org>
 <wRnf-Lm5zz6v1e-NlnFPteyARuLl-R98mOZZVjePHD5ue7QQNR_TSU7RwYBssgUa7xM5hf7Fe59-gMEj81ESrHY3mu_H7yE0dtGhFHFPTnc=@emersion.fr>
 <0F911D96-1C9B-4EF1-84D7-F5335B3FFEB7@vmware.com>
 <5Et1VowGX_0a0i5weC4YVMX7bhGDU45hQyiv4CjqyxQStY1CSUJs-xamBowRO8go8yCk1l_jgKmM_OrMB0Fdx166545AX5nL09NGsEYaBs0=@emersion.fr>
 <06E05345-758E-456A-803D-B50978A935CA@vmware.com>
 <wgIEdQpY_K8Qlq_xWBLy4DHOGwKi0P2c8a5dnTXM4dKOsA2hydYyT9DC6T1ldVZmi_mduaTPi4fnidg1msOofUUKkbnal0-Vv3VuTnfZh0s=@emersion.fr>
 <E53D9148-350D-4430-B4EF-689BBC1A9506@vmware.com>
 <GWQv37zd56Jok0LiKDGflZUSaHMYyk9Uad7M6-6-gqjeUGoT5dJOfsB9XDS4UuVEcZSI34GOTFa4XA0Cf2A1sGNhvbIsE16V7CyhxFne0d4=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <GWQv37zd56Jok0LiKDGflZUSaHMYyk9Uad7M6-6-gqjeUGoT5dJOfsB9XDS4UuVEcZSI34GOTFa4XA0Cf2A1sGNhvbIsE16V7CyhxFne0d4=@emersion.fr>
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>, Pekka Paalanen <ppaalanen@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/3/22 17:22, Simon Ser wrote:
> On Friday, June 3rd, 2022 at 17:17, Zack Rusin <zackr@vmware.com> wrote:
> 
>>
>>> On Jun 3, 2022, at 10:56 AM, Simon Ser <contact@emersion.fr> wrote:
>>> ⚠ External Email
>>>
>>> On Friday, June 3rd, 2022 at 16:38, Zack Rusin <zackr@vmware.com> wrote:
>>>
>>>>> On Jun 3, 2022, at 10:32 AM, Simon Ser <contact@emersion.fr> wrote:
>>>>>
>>>>> ⚠ External Email
>>>>>
>>>>> On Friday, June 3rd, 2022 at 16:27, Zack Rusin <zackr@vmware.com> wrote:
>>>>>
>>>>>>> In particular: since the driver will ignore the KMS cursor plane
>>>>>>> position set by user-space, I don't think it's okay to just expose
>>>>>>> without opt-in from user-space (e.g. with a DRM_CLIENT_CAP).
>>>>>>>
>>>>>>> cc wayland-devel and Pekka for user-space feedback.
>>>>>>
>>>>>> I think Thomas expressed our concerns and reasons why those wouldn’t
>>>>>> work for us back then. Is there something else you’d like to add?
>>>>>
>>>>> I disagreed, and I don't understand Thomas' reasoning.
>>>>>
>>>>> KMS clients will need an update to work correctly. Adding a new prop
>>>>> without a cap leaves existing KMS clients broken. Adding a cap allows
>>>>> both existing KMS clients and updated KMS clients to work correctly.
>>>>
>>>> I’m not sure what you mean here. They are broken right now. That’s what we’re
>>>> fixing. That’s the reason why the virtualized drivers are on deny-lists for
>>>> all atomic kms. So nothing needs to be updated. If you have a kms client that
>>>> was using virtualized drivers with atomic kms then mouse clicks never worked
>>>> correctly.
>>>>
>>>> So, yes, clients need to set cursor hotspot if they want mouse to work
>>>> correctly with virtualized drivers.
>>>
>>> My proposal was:
>>>
>>> - Introduce DRM_CLIENT_CAP_CURSOR_PLANE_NO_POSITION (or a better name). Only
>>> user-space which supports the hotspot props will enable it.
>>> - By default, don't expose a cursor plane, because current user-space doesn't
>>> support it (Weston might put a window in the cursor plane, and nobody can
>>> report hotspot).
>>> - If the KMS client enables the cap, advertise the cursor
>>> plane, and make it so the plane doesn't have the CRTC_X/CRTC_Y properties
>>> since the driver will pick the position.
>>>
>>> That way both old and new user-space are fixed.
>>
>> I don’t think I see how that fixes anything. In particular I don’t see a way
>> of fixing the old user space at all. We require hotspot info, old user space
>> doesn’t set it because there’s no way of setting it on atomic kms.
> 
> Old atomic user-space is fixed by removing the cursor plane. Then old
> atomic user-space will fallback to drawing the cursor itself, e.g. via
> OpenGL.

That is just a terrible idea, the current situation is that userspace has a
hardcoded list of drivers which need hotspots, so it uses the old non-atomic
APIs on that "hw" since the atomic APIs don't support hotspots.

The downsides I see to your proposal are:

1. Falling back to sw cursor rendering instead of using the old APIs would
be a pretty significant regression in user experience. I know that in theory
sw rendering can be made to not flicker, but in practice it tends to be a
flickery mess.

2. It does not help anything since userspace is still hardcoded to use
the old, hotspot aware non-atomic API anyways. So it would only make things
worse since hiding the cursorplane for userspace which does not set the CAP
would mean the the old non-atomic API also stops working. Or this would add
extra complications in the kernel to still keep the old APIs working.

I do think that a CAP might be a good idea, but the disabling of the
cursor plane based on the CAP does not sound like a good idea to me.

Regards,

Hans

