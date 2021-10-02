Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F259B41FD67
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 19:27:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A193C6F4FF;
	Sat,  2 Oct 2021 17:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662D16F4FF
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 17:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633195642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BIWiLnmXgJJeN1O27grrk8mchXbk8LbkQhrnZAMTc0o=;
 b=M2FmEPjZVNoYbPHDxPGfCB1P0ka1fUPlTDXWpx7b6vAM/s2XrIgUJ/Susdea09riNAtHLG
 toojSGyksKTLZQ6oyGjWHs6TOaXAry6U8XcCTThEDSKkh7XXZRcBLunEEi/FQ2DYNRX6Up
 95Y6rr0K7jvwkwb5KXbj3JW3vUt450A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-MZgA0Sk1P8u_pbJWnCY-QQ-1; Sat, 02 Oct 2021 13:27:20 -0400
X-MC-Unique: MZgA0Sk1P8u_pbJWnCY-QQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 y15-20020a50ce0f000000b003dab997cf7dso9667104edi.9
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 10:27:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BIWiLnmXgJJeN1O27grrk8mchXbk8LbkQhrnZAMTc0o=;
 b=nvAd2ZURaobUNpILMTnu0d7ewQY9G10sjppWxeOt9TDi32WXi2rkSals8ek8fO9gPL
 sxGsAlGoiUBe6rc22aYbwAXnlWQ0Iv752w4P4FQibLBfh+wfJi8lvt2UrJ0ua1qV6zdQ
 v8omUEB56Kg2yPjpc0jZ+kyLk4zgqDPP848Aa25zXOIkHu8e2+ft9xXBM3hwp9xGOsvY
 +xl6yxobGn9OfiDCNs1W5790DjT3ZkBwnU5BZDDduH31QP3D44ACovur46wsKdr7Y/fJ
 L0idLjks2LEEG1ooSl/5dQ6ItaQPfN97ZLpQNEehLpOdGjg/iQ+izal2y54gHApIA31A
 9b3Q==
X-Gm-Message-State: AOAM530pz1dpRpg0xiIMiP1Mjkm31lVknwgLmVzSK8LAxVuKKHPW9nHi
 n/vzTJFQty+w4FeMc82oBz30YaDFA2P3G02vVHuW6oMAp/1D7jqKlX3iXg3aWSJDnSmE+IAz0Cl
 ntLpfAKyV9YhkXnIf3GOyih9GK1PLtW+FGwkHFQI2ZXYtAoBwYjne8q6apcrbQJHiXRccYD2JcZ
 iwW8BT
X-Received: by 2002:a17:906:198a:: with SMTP id
 g10mr5664219ejd.95.1633195639209; 
 Sat, 02 Oct 2021 10:27:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7WrXxtDmoyi0hUPZbEf9daIXU37YsLyHWuAGEI+JqQSzu9m9HR2NqnYZdByUG8OrOM7Oz+w==
X-Received: by 2002:a17:906:198a:: with SMTP id
 g10mr5664103ejd.95.1633195637986; 
 Sat, 02 Oct 2021 10:27:17 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id l16sm4817732eds.46.2021.10.02.10.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 10:27:17 -0700 (PDT)
Subject: Re: Handling DRM master transitions cooperatively
To: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <ppaalanen@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dennis Filder <d.filder@web.de>, dri-devel <dri-devel@lists.freedesktop.org>
References: <YTJypepF1Hpc2YYT@reader> <20210907130746.7b667dac@eldfell>
 <ccdba09b-011d-093e-17d0-578ca8a3ec44@redhat.com>
 <20210908103603.44a533bb@eldfell>
 <CAKMK7uGeuaZDYkr=mFiA4Okhod6KqKRnv_RfF-NJG=2KzG-=WQ@mail.gmail.com>
 <20210909103703.09a573e4@eldfell> <YUCncex3woPlAhI6@phenom.ffwll.local>
 <20210922115657.17006ed1@eldfell>
 <3195aecb-833f-9f8f-efad-51d80da6f4dc@redhat.com>
 <QM4QO9NZvRU73KFxXZiKRQurIj8NbJiS8G8emzrZ6Rq7lz4FsADE3e1-6nGvjTjBeJKgJQ5cDnwckdS6VwsOrbtaY2FUv9GvhDK261Jibfg=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <87df02c0-c60f-3c12-4205-4a44b35e8750@redhat.com>
Date: Sat, 2 Oct 2021 19:27:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <QM4QO9NZvRU73KFxXZiKRQurIj8NbJiS8G8emzrZ6Rq7lz4FsADE3e1-6nGvjTjBeJKgJQ5cDnwckdS6VwsOrbtaY2FUv9GvhDK261Jibfg=@emersion.fr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10/1/21 6:33 PM, Simon Ser wrote:
> On Wednesday, September 22nd, 2021 at 11:21, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> I would be happy to work on the plymouth side of this, so that we
>> have at least one consumer of such a flag lined up for merging.
> 
> Do you have plans to work on the kernel side part of this?

No I don't have any plans to work on the kernel side of this.

> If so, feel free to
> CC me for a review. If not, let me know if you'd like to switch roles, I could
> work on a patch.

I would be happy to review any kernel patches for this
(together with adding support to plymouth for this).

Regards,

Hans

