Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090E4906921
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 11:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF6210E9E9;
	Thu, 13 Jun 2024 09:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SsApj3q1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2694A10E9E9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 09:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718271659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oEj+uvSIhUT8SfPd2YXpP7/2kVIVeHtDz27UcDHtNpg=;
 b=SsApj3q1l+XkX+qCRlVWZwhdAnsBQiFklP0RwntLpW4HcQtN5NI/e09y8MfS1PE1ZV0Iy3
 u7yFKbyp0zlUxdXD06y9CPy0S//oRd5Bac1Tnf5Ei0GLgozwe2E08rFrwNvB8fCnaTLveF
 ibBv0/+98+BI+w91dUMZJ00gnqrKQc4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-WsxsteoZOumVxivzsfb43Q-1; Thu, 13 Jun 2024 05:40:54 -0400
X-MC-Unique: WsxsteoZOumVxivzsfb43Q-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-52bc1acf1bdso645586e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 02:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718271652; x=1718876452;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oEj+uvSIhUT8SfPd2YXpP7/2kVIVeHtDz27UcDHtNpg=;
 b=eHcVpqpDFduISWJLq624VGYCABFs6A2FI4yfydLGqqDnWUbuUKoQqTfQtzP2mnotHK
 d+aanfQNk522MDEhrW0wb7GbWbsgplmSCmLaV/mMi4PB+GYKSoEGF+hxrD8DKVCG9GSy
 VpDLrXkgF/wQBCIHw6HJ07TThPmF28T0JfYg+2DPp8O1j0DGti7SWAEFGxtm83wsR39D
 CDiz0NkLI/RI0ssUxBiJRGCQAygMPmfuScii2TWkpAdabfA2Sy5YUvHFzRKVDitmiZtD
 H3qPg/PvB3yap7u8+4hxD8+fznwdcPB0UIlXJTQyuwehnSCnvkvqu62H3FHd1Dr5Zc3G
 1n4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV17inrt/egYD4GoPtnuKRPo050YNExrULKPUsPWPRjuqWBmJmu5uMFDDH8c8OzzPirra+QNIpgefetImNR7mqGmKdn1mg0i6wZ6c1OpVg
X-Gm-Message-State: AOJu0YzUmhfGYQNzN2IMHbz/fcpRGjplZdCf1QSpWGjp4bPY9uBy6ETg
 zlh94KhwJvpxX5AXLVDfadmT9m6gmHza/iLxe1IhIjm60TnSUNaPZoWjd9+Sz/zA76SsMB02K6Z
 O8PtBdVCEgwdPtS5sNVvPt7QqTxkR6txd8KZQpGaOr+cNCSS+W6EJLzZlJMBidHJsfg==
X-Received: by 2002:a19:f70a:0:b0:52c:9877:c55a with SMTP id
 2adb3069b0e04-52c9a405889mr2286582e87.67.1718271652194; 
 Thu, 13 Jun 2024 02:40:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBNGP7iKfsAHm55vmVrBNGnMEfeibtOBQIkxEvrLJ1Nz6ilL4x+HTLkhZyBmXbxF6LpZ7juA==
X-Received: by 2002:a19:f70a:0:b0:52c:9877:c55a with SMTP id
 2adb3069b0e04-52c9a405889mr2286571e87.67.1718271651756; 
 Thu, 13 Jun 2024 02:40:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075c6fa4esm1034757f8f.67.2024.06.13.02.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 02:40:51 -0700 (PDT)
Message-ID: <cff14393-d702-4fcd-8a13-034692dc931e@redhat.com>
Date: Thu, 13 Jun 2024 11:40:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/panic: Fixes and graphical logo
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718199918.git.geert+renesas@glider.be>
 <386a229b-6904-465d-b772-921f99815e8c@redhat.com>
 <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CAMuHMdWy15T1JPH6w=xLyx_-zpHJA_VUe_Mu+h5zNPXEZw8+RQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 13/06/2024 11:32, Geert Uytterhoeven wrote:
> Hi Jocelyn,
> 
> On Thu, Jun 13, 2024 at 10:38 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> On 12/06/2024 15:54, Geert Uytterhoeven wrote:
>>> If drm/panic is enabled, a user-friendly message is shown on screen when
>>> a kernel panic occurs, together with an ASCII art penguin logo.
>>> Of course we can do better ;-)
>>> Hence this patch series extends drm/panic to draw the monochrome
>>> graphical boot logo, when available, preceded by the customary fix.
>>
>> Thanks for your patch.
>>
>> I've tested it, and it works great.
> 
> Thank you!
> 
>> You need to rebase your series on top of drm-misc-next, because it
>> conflicts with a series I pushed last week:
>> https://patchwork.freedesktop.org/series/134286/
> 
> I had seen that you said you had pushed this to drm-misc-next[1]
> before I posted my series, but couldn't find the actual commits in
> drm-misc/for-linux-next, which is still at commit dfc1209ed5a3861c
> ("arm/komeda: Remove all CONFIG_DEBUG_FS conditional compilations",
> so I assumed you just forgot to push?
> However, the latest pull request[2] does include them, while linux-next
> does not.
> 
> Has the drm-misc git repo moved?

It moved to gitlab recently, the new url is
git@gitlab.freedesktop.org:drm/misc/kernel.git

and the drm_panic kmsg screen commit is there:

https://gitlab.freedesktop.org/drm/misc/kernel/-/commits/drm-misc-next?ref_type=heads


> 
> Thanks!
> 
> [1] https://lore.kernel.org/all/3649ff15-df2b-49ba-920f-c418355d79b5@redhat.com/
> [2] "[PULL] drm-misc-next"
>      https://lore.kernel.org/all/20240613-cicada-of-infinite-unity-0955ca@houat/
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

