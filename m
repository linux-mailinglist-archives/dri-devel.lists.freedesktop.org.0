Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F2E770279
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 16:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FFB10E70E;
	Fri,  4 Aug 2023 14:02:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D63FF10E70E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691157753;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=808Pd+nQU4BkLxg8bbOo/RqERzTi+N/8pkzZaM8IuxA=;
 b=SIOI+Z3GNDA7USJbMCOm/q3jaqBcHiClPwgL6Rsf+RFDJokfB15xpVl2/9QxZWmgVFek9D
 nSpCCe5I0ZGiJvvT28Ic9ResC7MvCklfbXpz6VbVCNWAG40DV0WDsL+WqOezG+esThVaWD
 zk8gZg3o7ScYyXHd1WevHomC1RXcZzM=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-RiNZ6LU0NX-e9DWReWUpiQ-1; Fri, 04 Aug 2023 10:02:31 -0400
X-MC-Unique: RiNZ6LU0NX-e9DWReWUpiQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3a44a32d3b5so2843485b6e.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 07:02:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691157751; x=1691762551;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=808Pd+nQU4BkLxg8bbOo/RqERzTi+N/8pkzZaM8IuxA=;
 b=Q0BT907iAamnm1K9MxK1S6qCCARKkO3nW28IW5f2QWO6oq+HXY4FGld4SnVK6N33Ya
 XEDPeroTk+Mgg69xGcIyREC2H2pY25eyOqeyjyDNXf6c8s3EYzI/pIhb/g20a33QI7jS
 AfIKfpnMsjlKCjvPgb6v+LNW1Tl3VyNAqTLnjA2qywfilE+S1wxcjihsGbgFKjapYQuA
 reuQmJj08IZLdCCrQE23UvlbbBu8kt33LL97WsDCI9qsPJ57F/L8+r4eSpN+QcXDyzLT
 af+/5hUzo2uLmyBCjUYYL5k8to4+5y/LuSLzZ3fbbLa44+OS9zbUgBAa40hO8oorYLtl
 ri5Q==
X-Gm-Message-State: AOJu0Yy0ZobG03Z2cu1HLTWbNgG+CpqR2WF4ifEO2+LW8GqXz0M/1pNC
 B8Ujc29Q+9xOog3M92ZaDoOTKaYgUVZQ2PZlSWEudFUKa+I5sh7qPv3nOva4eW7qFN086LnHlQ+
 a9dDdZ0UyiY2TgM2Brc7STWNmnQL1
X-Received: by 2002:a05:6808:1446:b0:3a3:e638:78d2 with SMTP id
 x6-20020a056808144600b003a3e63878d2mr2209988oiv.12.1691157750889; 
 Fri, 04 Aug 2023 07:02:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgyv5Dk1Uh5fEOhYZouKg0eqJVUmldKb5Lo6fBnh9uURKlLXWP87ffEY+fXtJsEJbTQPGc/w==
X-Received: by 2002:a05:6808:1446:b0:3a3:e638:78d2 with SMTP id
 x6-20020a056808144600b003a3e63878d2mr2209953oiv.12.1691157750560; 
 Fri, 04 Aug 2023 07:02:30 -0700 (PDT)
Received: from localhost ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 bq7-20020a05680823c700b003a3bf96e055sm1005466oib.8.2023.08.04.07.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 07:02:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@redhat.com>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
In-Reply-To: <871qgtv18e.fsf@minerva.mail-host-address-is-not-set>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <7f6fd614-5910-6c94-2c55-110223b61b5f@redhat.com>
 <8f0ee2da-0a06-a78d-ab74-c552da822b97@suse.de>
 <hnyzo4cldffz6rzntmuvblissfrw7ig6qidnc2f3iortcdagid@fi5bn44asg2v>
 <897822f7-90a8-edd0-9c84-fb5a1f5ce5eb@suse.de>
 <871qgtv18e.fsf@minerva.mail-host-address-is-not-set>
Date: Fri, 04 Aug 2023 16:02:27 +0200
Message-ID: <87v8dugb2k.fsf@minerva.mail-host-address-is-not-set>
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

Javier Martinez Canillas <javierm@redhat.com> writes:

> Thomas Zimmermann <tzimmermann@suse.de> writes:
>

[...]

>> The reasoning is that userspace should always be in control of the 
>> format (sans that one exception). If userspace wants packed 24-bits it 
>> can support RGB888 explicitly.  For the color-format transformation, 
>> it's better to do that in userspace with SSE-like instructions than in 
>> the kernel.
>>
>> I wasn't super-happy with this, but I think it's a clear statement with 
>> simple rules to follow. I'd prefer that over relaxed rules where each 
>> driver does its own thing.
>>
>
> I wasn't super happy either, but if I remember correctly we were the only
> two that had this point of view and everyone else there thought that the
> drivers shouldn't expose a format that don't support (other than XR24) ?.
>

I think that this unwritten rule must be documented somewhere so that we
could know what the rule really is instead of people making assumptions.

Because my understanding from the discussion was that user-space has no
way to know if a format is "native" or "fake" and it shouldn't pay for the
performance penalty of doing these format conversions in the drivers.

But the irony here is that enforcing such a rule in this particular case
would prevent to have a performance gain. So it seems to me as if it's the
opposite to what such a rule wanted to achieve.

My proposal is to write a doc patch explicitly stating that drivers must
only expose a "virtual" XRGB8888 format for compatibility and that it is
allowed to drop the alpha channel in the driver if that would improve the
performance for a particular device (e.g: slow DMA as is the case here).

That way, the spirit of the rule would be to make the driver/device as
performant as possible. What do you think ? Does this make sense to you ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

