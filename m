Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE1E6D8510
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 19:42:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D22710E187;
	Wed,  5 Apr 2023 17:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBB210E187
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 17:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680716532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HSV3YTXbj1kQ1WTEraMjIVyOceHF7801vOIZC9Ms7ec=;
 b=NPhKhZYzTqWKx+r0sW+5mJrwRmawZ7PssW/Bl7LQk2teoQ1iBIG56x3O8tCJqOPkjFkVjE
 IOdb9dNfBbTogvQeDgbx6ZuA8DH8b0gmRyH4R4gIZR7uDHv46qG7bYiNSqFWAXQop+q6bg
 ouGffvEZtqJ0JeRrqi9v6DLGXIomOfg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-EUKaac75MySLTRPsJaU73g-1; Wed, 05 Apr 2023 13:42:11 -0400
X-MC-Unique: EUKaac75MySLTRPsJaU73g-1
Received: by mail-wm1-f70.google.com with SMTP id
 n11-20020a05600c3b8b00b003f04739b77aso7477667wms.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 10:42:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680716530;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HSV3YTXbj1kQ1WTEraMjIVyOceHF7801vOIZC9Ms7ec=;
 b=ZB/vNdz0Jhuc8HTv37R/wYrbZE9D0Q2ltjB3g6oWbVIqs8RrxVPNL2+Ev/TQ4zVvFQ
 MgMDZNzKIJpcM1ezd5Y1Ck7HdPCJL+jlApRoApyGcJOwFBVWPOBGVksqt/ybAibxOW11
 UjfcqcuTRoa7fVS58byjtIJhTr0djzafITK9r42U678QDtBo8KdSQ5+w6stP/pEBTC+V
 mYl2YHl9aPtwxRb20tgqxBDcbshm/UEK76xOrtt1sNWfqVPejI0BqwF8uacxjaMlme7g
 o7QNG4jCSBQFHnQYb7fNFWMnuJTDSW2LkGer9gVvYWn9XeUB6CEzYE989sF797ktjxBV
 gBCA==
X-Gm-Message-State: AAQBX9eH0O6h3rv8fZWhxrPVZ7ih/aEwmS3X+Ri/XZXkqXu/j/uuLscu
 c88sKdcBVPpcHuMvz3RL0jOJ4Hl/IRGFseJBWfIXSXCAZLMhJ/kLKhUfrNDnTFoZcVoe/7zbmdV
 3zo90AhPuR9nAuJYMprcBWn2WDiUT
X-Received: by 2002:a05:600c:224c:b0:3ed:c468:ab11 with SMTP id
 a12-20020a05600c224c00b003edc468ab11mr5174075wmm.28.1680716530513; 
 Wed, 05 Apr 2023 10:42:10 -0700 (PDT)
X-Google-Smtp-Source: AKy350bRY2ciRgV1xki7pmfGprkVr4yH43R+HTRZk6XU+/c2VyLz1YuymWLlZtH6iXtZ2qB0G2ai4A==
X-Received: by 2002:a05:600c:224c:b0:3ed:c468:ab11 with SMTP id
 a12-20020a05600c224c00b003edc468ab11mr5174063wmm.28.1680716530221; 
 Wed, 05 Apr 2023 10:42:10 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m19-20020a7bcb93000000b003dc522dd25esm2840683wmi.30.2023.04.05.10.42.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 10:42:09 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/fb-helper: fix input validation gaps in check_var
In-Reply-To: <ZC2t1I1SQrQh/fy1@phenom.ffwll.local>
References: <20230404194038.472803-1-daniel.vetter@ffwll.ch>
 <20230404194038.472803-3-daniel.vetter@ffwll.ch>
 <87a5zmd2jn.fsf@minerva.mail-host-address-is-not-set>
 <ZC12aR9ddp3j/3dL@phenom.ffwll.local>
 <87ilea9twa.fsf@minerva.mail-host-address-is-not-set>
 <ZC2t1I1SQrQh/fy1@phenom.ffwll.local>
Date: Wed, 05 Apr 2023 19:42:08 +0200
Message-ID: <878rf69qfj.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel Vetter <daniel@ffwll.ch> writes:

> On Wed, Apr 05, 2023 at 06:27:17PM +0200, Javier Martinez Canillas wrote:
>> Daniel Vetter <daniel@ffwll.ch> writes:

[...]

>> >
>> > The __fill_var is after this. I'm honestly not sure what the exact
>> 
>> Ah, your patch adds it after that indeed. Please ignore my comment then.
>
> So rb: you?
>

Yes, I already provided it in my previous email and has been picked by
patchwork. I could do again but probably will confuse dim when applying.

The only patch from your series that is missing an {r,a}b is #1 right now:

https://patchwork.kernel.org/project/dri-devel/list/?series=736966&archived=both

[...]

>> > What I'm wondering now is whether too small x/yres won't lead to problems
>> > of some sorts ... For multi-screen we set the virtual size to be big
>> > enough for all crtc, and then just set x/yres to be the smallest output.
>> > That way fbcon knows to only draw as much as is visible on all screens.
>> > But if you then pan that too much, the bigger screens might not have a big
>> > enough buffer anymore and things fail (but shouldn't).
>> >
>> > Not sure how to fix that tbh.
>> 
>> Would this be a problem in practice?
>
> I'm frankly not sure. You'd get a black screen for fbcon/fbdev across all
> outputs, but only if you have userspace doing this intentionally.
>
> In a way it's just another artifact of the drm fbdev emulation not using
> ATOMIC_TEST_ONLY in the various places where it should, and so doesn't
> really know whether a configuration change will work out.
>
> We already have this in obscure mulit-monitor cases where adding another
> screen kills fbcon, because the display hw is running out of fifo or
> clocks or whatever, and because the drm fbdev code doesn't check but just
> blindly commits the entire thing as an atomic commit, the overall commit
> fails.
>
> This worked "better" with legacy kms because there we commit per-crtc, so
> if any specific crtc runs into a limit check, only that one fails to light
> up.
>
> Imo given that no one cared enough yet to write up atomic TEST_ONLY
> support for fbdev emulation I think we can continue to just ignore this
> problem.
>

Agreed. If that ends being a problem for people in practice then I guess
someone can type atomic TEST_ONLY support for the fbdev emulation layer.

> What should not happen is that fbcon code blows up drawing out of bounds
> or something like that, resulting in a kernel crash. So from that pov I
> think it's "safe" :-)

Great. Thanks a lot for your explanations.

> -Daniel

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

