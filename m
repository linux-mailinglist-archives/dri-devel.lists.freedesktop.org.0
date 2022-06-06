Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9553253E51F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 16:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C00910E590;
	Mon,  6 Jun 2022 14:44:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CF610E586
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 14:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V6sFIaEvt0irS8gFD+GfLBK0UsH28DnBZODJnvNGXs4=;
 b=TXcedSKvTHg4l+BPOCYvWqa5/8tW1k8d52JxDwA4bVVKkFoaLMlJ609KMlwKslIUcpOx6Q
 9rHnWgjYc4V9jORH6C9Ck3l/0ODgzJsXV4ZOr1LurY1dIlmHoM5WaVotwY5B47JlmOzGte
 sIdsm+wBMzbvzM6VGkouEOVO+6IgKPY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-299-GmpTFfmhNIiyeJE4C3US0Q-1; Mon, 06 Jun 2022 10:44:55 -0400
X-MC-Unique: GmpTFfmhNIiyeJE4C3US0Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 r13-20020adff10d000000b002160e9d64f8so1417893wro.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 07:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V6sFIaEvt0irS8gFD+GfLBK0UsH28DnBZODJnvNGXs4=;
 b=vYdjaXB9WLZ10LjiyZaEy/Wdn6ZgEXCob9ZqO6AnSiMxmGj2fjRIvMl9RnkJOuO0CG
 0HqE17NUkiz9YP504wdBvLD5WrMFWAMldE1WL/ank2e3q16eQVTRq9XCFoAbKLfBa9FJ
 8tVH5nIVFgbNhFC9DR+TKsluMpYgJwdt74gNB3fKzIlAamExmFRxNEpWunAxUMTlGCDl
 h0TC32KCK0cdtxg4l2gIlpbombcaL3FQBT312OYvv97vdCsGuwgB+IRyqBBWA5oVIylt
 dA3lRfSFuzUcOCFMaQEejKvJpYVC4hEwejLNgbuUKhni35OmQ+KFe6s7v0tw/XCg4CTY
 Nr9w==
X-Gm-Message-State: AOAM530/NkAwZIHlAKtiNvO9vmWVRrGw9dCWaqnh7KPLdfve20B25xPf
 ukLkUdtkaux4LML7Bn3wLQRrdBZXNfTRObQTTP9RlIz0GavChhCRsTp4WNETne1H29qY2Ew67L5
 GtPNIzeHAGF9et7YTzvvrpPhMjZv7
X-Received: by 2002:a5d:4351:0:b0:20c:f52c:f869 with SMTP id
 u17-20020a5d4351000000b0020cf52cf869mr22888080wrr.516.1654526693930; 
 Mon, 06 Jun 2022 07:44:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2lRqC2aACsYfImtX5vBgn7AmRKggfP50Pqugjye5W0SwKWMoJY2Blxl6ylBEtSRbX6NiwZQ==
X-Received: by 2002:a5d:4351:0:b0:20c:f52c:f869 with SMTP id
 u17-20020a5d4351000000b0020cf52cf869mr22888061wrr.516.1654526693709; 
 Mon, 06 Jun 2022 07:44:53 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l65-20020a1c2544000000b00397393419e3sm20794650wml.28.2022.06.06.07.44.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 07:44:53 -0700 (PDT)
Message-ID: <0e638b6e-cfcf-638d-1892-5c11d92a8e90@redhat.com>
Date: Mon, 6 Jun 2022 16:44:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/1] drm/format-helper: Add KUnit tests for
 drm_fb_xrgb8888_to_rgb332()
To: Daniel Latypov <dlatypov@google.com>
References: <20220606095516.938934-1-jose.exposito89@gmail.com>
 <20220606095516.938934-2-jose.exposito89@gmail.com>
 <20220606134242.h6kuqn4zbpmc2rql@houat>
 <576ed6ef-b961-9214-2c9b-56cb5b493b4e@redhat.com>
 <20220606135219.nwhp4fdawg2qjeam@houat>
 <78c1eb65-ea78-8744-5382-ea86a56a66f4@redhat.com>
 <CAGS_qxrPKJrXufMKOCO3eCEpq-Udq6uy32x6aneSPRnm=1O4HQ@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAGS_qxrPKJrXufMKOCO3eCEpq-Udq6uy32x6aneSPRnm=1O4HQ@mail.gmail.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 davidgow@google.com,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 6/6/22 16:19, Daniel Latypov wrote:

[snip]

>> That's what I asked in the previous RFC too. Daniel mentioned that it shouldn't
>> go there because is platform specific (AFAIU, one might want to test it on x86,
> 
> Slight correction, it was David who explicitly suggested it shouldn't
> go in there.
> https://lists.freedesktop.org/archives/dri-devel/2022-June/357611.html
>

Ups, sorry for getting that wrong. I should had looked at the thread
again before writing my answer.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

