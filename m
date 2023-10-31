Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0967DCBCC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 12:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B1810E476;
	Tue, 31 Oct 2023 11:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1464510E476
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 11:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698751634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gFENUoE4QZmy/1C9/9VR1y/yhegXs4pxY1CyQb2hNdA=;
 b=e75EkMQuoCN3RpmJspM1kuzmtSX6fzujMHMVS7R5Izm9JjrTYG9KDDj5DTI1b/y/AgaCbe
 CdoAV7oYTL+gwnLQN3R8iTyXYNEFvPzdrAyU3kFlNigXLPfSEyDn8m/HHLSDusfx8pHhIw
 l4mEEUnSuLPUMjhYFwOlHButS08hr5U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-K9CgF_j5N5iU6HxJpeL13A-1; Tue, 31 Oct 2023 07:27:08 -0400
X-MC-Unique: K9CgF_j5N5iU6HxJpeL13A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-407d3e55927so38193185e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Oct 2023 04:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698751627; x=1699356427;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gFENUoE4QZmy/1C9/9VR1y/yhegXs4pxY1CyQb2hNdA=;
 b=R6I5wYYQ5PMmq8Sdew7t1hVHrwyGXrzk/MFRwiPb+pyopZ6hyzKJs5GDd3fL1vg262
 Ne2sznFYrNYKIhCNBfn+YiHVd5f++BHSzjmoi/UXzitLRSqPj1KJcbxZQhyr4y+ezeUy
 jvhOJYOVZz24dRk0LgEwe6H1CkXyf4ObEiIYuTITq1nssNPDgD+gL3XRO4j8xdYiSQws
 5XN475NawNQSkU9K/79zL7ShWlMQ7MRQYRaAvju7Nr1n2qNEapJ78lT/9g2XY8y57nd+
 9aRoE0LHhbDq6DzKrWyDnTRjYI/IIstOU68GG68T9YEpFkyVaQArphDC2pGDCbVyJK7J
 H3eg==
X-Gm-Message-State: AOJu0YxemdcVG24G4cSRn+KDNjaPqayFCmvCjfeytKv91i80WdbouUj0
 IWAgX8B09ninQWjStPWiLMo5Rj6TpKmclwcAp8Hm5xC4tVxxqNDynf1qzZZiWUzFe8486AmESPn
 4RqXSfEvgEoLlC0gxWASj27iNvWdw
X-Received: by 2002:a05:600c:3b0f:b0:405:95ae:4a94 with SMTP id
 m15-20020a05600c3b0f00b0040595ae4a94mr10138786wms.5.1698751627007; 
 Tue, 31 Oct 2023 04:27:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyn3f7N3+9Jfr+BsYwz1GP3j0/tAScocUYQVNydkFrJWH3GUUHSv9UN3qAzfB0OVYQRDNO2Q==
X-Received: by 2002:a05:600c:3b0f:b0:405:95ae:4a94 with SMTP id
 m15-20020a05600c3b0f00b0040595ae4a94mr10138774wms.5.1698751626720; 
 Tue, 31 Oct 2023 04:27:06 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p6-20020adf9d86000000b0032d829e10c0sm1301848wre.28.2023.10.31.04.27.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Oct 2023 04:27:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/ssd130x: Fix possible uninitialized usage of
 crtc_state variable
In-Reply-To: <CAMuHMdXdYm6Opyhgte7CaScs_jdPNUqrQTbPCMSQXqkKpKTd8w@mail.gmail.com>
References: <20231020225338.1686974-1-javierm@redhat.com>
 <b048247c-75e9-488e-a4f3-b227a38bca5e@redhat.com>
 <87v8aso1ha.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdVLf=H7QWaUXrN17ABw9eE1MjBdzFEM0AhMNj8_ULSz+Q@mail.gmail.com>
 <87lebjksoj.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdXdYm6Opyhgte7CaScs_jdPNUqrQTbPCMSQXqkKpKTd8w@mail.gmail.com>
Date: Tue, 31 Oct 2023 12:27:05 +0100
Message-ID: <87il6nkp6e.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dan Carpenter <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Javier,

[...]

>> >> Pushed to drm-misc (drm-misc-next). Thanks!
>> >
>> > Looks like you introduced an unintended
>> >
>> >     (cherry picked from commit 9e4db199e66d427c50458f4d72734cc4f0b92948)
>> >
>> > ?
>> >
>>
>> No, that's intended. It's added by the `dim cherry-pick` command, since I
>> had to cherry-pick to drm-misc-next-fixes the commit that was already in
>> the drm-misc-next branch.
>>
>> You will find that message in many drm commits, i.e:
>>
>> $ git log --oneline --grep="(cherry picked from commit" drivers/gpu/drm/ | wc -l
>> 1708
>
> Ah, so that's why it's (way too) common to have merge conflicts between
> the fixes and non-fixes drm branches :-(
>

I guess so. In this particular case it was my fault because I pushed to
drm-misc-next with the expectation that there would be a last PR before
the drm-next tree was sent to Torvalds but I missed for a few hours...

So then I had the option for the fixes to miss 6.7 and wait to land in
6.8, or cherry-pick them to the drm-misc-next-fixes branch and pollute
the git history log :(

> Gr{oetje,eeting}s,
>
>                         Geert
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

