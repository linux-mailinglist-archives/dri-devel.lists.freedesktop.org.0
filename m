Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AE876570E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 17:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF81E10E111;
	Thu, 27 Jul 2023 15:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D417A892E4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690470662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zRpHnuh/m9Z5WcIdLWxD2J/N57Pr9bP1dktpTleIGVk=;
 b=RKrQwQnG3CutXwaNUi84z6wzWB4c34BcSQ1EMtCEzojxz9VoCkFj1i8ju7r8k7tUugLEee
 qQW3mSyRRtLEfW9xnuybM8WtJOh4/VBriog5nfR92n25IAzgmIsg8h7sPMFGWGOXQOubTR
 q0Rqv8JJtA/foMmmlvBAFgSYaaFx60c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-kY6w-2XZM3GhcjwESnRLPA-1; Thu, 27 Jul 2023 11:11:00 -0400
X-MC-Unique: kY6w-2XZM3GhcjwESnRLPA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-314256aedcbso572783f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:11:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690470659; x=1691075459;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zRpHnuh/m9Z5WcIdLWxD2J/N57Pr9bP1dktpTleIGVk=;
 b=cX3f3DPFc86eROv5zEYmSlELi3rz5mU6RFlD+rTiDklCbAF1vNRhhjhyv/vmgEurmy
 KkzrLhD22XnyB9F50acMfw6al1Qvs+CcLvF7PLj5bThGeXz3Vh9KYcbXx5NJ5ej3pLyL
 4OaqDexfiN5nGLMvUIhSP/laeUcbYqJ4pePNzIs+o/dSX4xCbnA31uhGl5RlWATqlKZ/
 lDOiX8t1G2BxS8Q/fN2H29YPelSsa57R+CTFzuWeQOYmX/ojHCIvAqE/oz7ZB0nO72T2
 5HkJPVU2LTGRWh3r32QFIGwzny/xxIAZkosPn1y8Q3QvdwEnUcdzgYlczDCfhvUWefOE
 Pp0A==
X-Gm-Message-State: ABy/qLYdERaYEA2GZU239KvY6MWz+QxJBrJ/ACsg+oNwY5Wtn3cxiQuU
 2MBDIwfiSXi3oPoGYaU4OpCVbmC7NxTRt+rJ2xv0sJ2eWBKIdA4cOKjUsAnPslDSaS0FNt3Jbgx
 rRT93x07V/hH1Y/YbX6kPjnM53fhJ
X-Received: by 2002:a5d:4806:0:b0:30a:f030:8637 with SMTP id
 l6-20020a5d4806000000b0030af0308637mr2013462wrq.22.1690470659232; 
 Thu, 27 Jul 2023 08:10:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEauWukhPpyVh/qP3GfLHe9QmCEWuZyjdz3Es5p8gp/pwHFZ4zPP1Xzr5SALUa5q6UOzl7/Ow==
X-Received: by 2002:a5d:4806:0:b0:30a:f030:8637 with SMTP id
 l6-20020a5d4806000000b0030af0308637mr2013443wrq.22.1690470658828; 
 Thu, 27 Jul 2023 08:10:58 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u5-20020a5d6ac5000000b0031759e6b43fsm2318286wrw.39.2023.07.27.08.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 08:10:58 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@redhat.com>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
In-Reply-To: <897822f7-90a8-edd0-9c84-fb5a1f5ce5eb@suse.de>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <7f6fd614-5910-6c94-2c55-110223b61b5f@redhat.com>
 <8f0ee2da-0a06-a78d-ab74-c552da822b97@suse.de>
 <hnyzo4cldffz6rzntmuvblissfrw7ig6qidnc2f3iortcdagid@fi5bn44asg2v>
 <897822f7-90a8-edd0-9c84-fb5a1f5ce5eb@suse.de>
Date: Thu, 27 Jul 2023 17:10:57 +0200
Message-ID: <871qgtv18e.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Roger Sewell <roger.sewell@cantab.net>, airlied@redhat.com,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi Maxime
>
> Am 27.07.23 um 16:33 schrieb Maxime Ripard:
>> Hi Thomas,
>> 
>> On Wed, Jul 26, 2023 at 05:36:15PM +0200, Thomas Zimmermann wrote:
>>>> I've already sent a patch to use internally 24bit colors, when userspace
>>>> can use 32bit that would solve this issue as well. In the end, on the
>>>> VGA link, 24 or 32 bit colors are the same. That would allow modern
>>>> userspace to work on par with Xorg. So maybe we can reconsider it ?
>>>
>>> No way. We've had IRC flamewars over this topic already. People didn't get
>>> work done that day; others ragequit-ed in frustration. Ask Javier, he'll
>>> remember. :)
>>>
>>> The consent in DRM-land is: we're not going to mess with color formats
>>> behind the back of userspace. The only exception is the emulation of
>>> XRGB8888 iff the hardware does not support that. And only because it's the
>>> fallback format that is universally supported.
>> 
>> I'm aware that I might be reviving old heated debates here, but I'm not
>> sure what is the problem here.
>> 
>> I guess part of the problem is that due to the memcpy call, we would
>> have it in software.
>> 
>> But it's not clear to me how we're messing with color formats there: the
>> memcpy would drop the alpha part that was doing to be dropped by the
>> hardware anyway (and likely would have done so transparently if it
>> wasn't for the memcpy).
>> 
>> It doesn't affect the userspace at all, it doesn't change the way we
>> interpret the format either, it just ignores a part of the format that
>> is supposed to be ignored anyway. And doing so frees up a bunch of
>> resources?
>> 
>> So, AFAIU, it doesn't have any side effect except for the fact that it
>> consumes less memory bandwidth and allows for more pixels to go through.
>> That's not really "messing with the formats" in my book.

I agree with you Maxime and I believe Thomas also does, but the concensus
when that topic was (heatedly) dicusssed was that drivers should not fake
a pixel format. Even if is only about dropping the alpha channel, like in
the patch that Jocelyn mentioned.

>
> Technically not, but it's still a difference. Even in such cases without 
> side effects, it was dismissed when discussed in the context of simpledrm.
>

Indeed. I remember that discussion.

> The reasoning is that userspace should always be in control of the 
> format (sans that one exception). If userspace wants packed 24-bits it 
> can support RGB888 explicitly.  For the color-format transformation, 
> it's better to do that in userspace with SSE-like instructions than in 
> the kernel.
>
> I wasn't super-happy with this, but I think it's a clear statement with 
> simple rules to follow. I'd prefer that over relaxed rules where each 
> driver does its own thing.
>

I wasn't super happy either, but if I remember correctly we were the only
two that had this point of view and everyone else there thought that the
drivers shouldn't expose a format that don't support (other than XR24) ?.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

