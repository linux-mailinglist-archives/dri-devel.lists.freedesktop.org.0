Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319FF63ECF1
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9E810E59C;
	Thu,  1 Dec 2022 09:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B5F10E59C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669888303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kW01BNtn+nbbqTH4PbpdzFlAvXWuhEEgG3klLvL8v7I=;
 b=OZO0vZN34nVk0078Jj0yjMIrMhdww8DRicxYLI5Ss7M2394z9VAMU/AP8HQ/1qXFqtHw/f
 t9JJUorSv/mflHcDwES6EW7yUYee6kXlxIj4Ef9RdTAlmPsKcdGHEm59uqSpcbMLCWxUfc
 IWrbpp4j+Bm8LrlYyU4smWXwgStr/LY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-317-edBcH4GHNOmOs5hmnu6z6A-1; Thu, 01 Dec 2022 04:51:41 -0500
X-MC-Unique: edBcH4GHNOmOs5hmnu6z6A-1
Received: by mail-wr1-f71.google.com with SMTP id
 g14-20020adfa48e000000b00241f94bcd54so246811wrb.23
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Dec 2022 01:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kW01BNtn+nbbqTH4PbpdzFlAvXWuhEEgG3klLvL8v7I=;
 b=75rJHzUsP8foyisSMD0Kwcx9roy2VlEPzPF3C8W8eh79DnH/41/q1hdogGQXuRWYcS
 6qlsHs0SYd1dL3CzPXrMooNUDOAUVuwEHhUJcNMZmNOa0tiquMkT4iwmmvp1V6EAASXW
 srMisgsa4riynZAnJU8QAvNoBQiTA2Q8uytQvsKBmUdPxgaFf1nrW35E0tsTs+wBD54C
 OP8bJXt5fNNXwRF11yai3wUBUcdELiaf9jisJlA20PwSVwcGtBMH9oIGHMmNQvfYgJdI
 GUbQkRSpCQEPVyzZPFQiBXcJqUqudtN0z/6ePpwTgadp2zH5UCB0bIwCyHic0cRppvUR
 0F1Q==
X-Gm-Message-State: ANoB5pmfeyHI7oOtrzD3NvANRjINRwBg4hWEyBsfbN5NNG1bCCn8YGi5
 K1N4BDeUDpXtdRiGAM/OnukAw2v4nFTMAIyiHE7TwKRgdo5MWogNtUQx6pqB72oUd/R1SRN+b7z
 XUPKw4rn5UQu/xt7gdWJ4rOrPhGYv
X-Received: by 2002:a5d:44c8:0:b0:242:2a46:6ff9 with SMTP id
 z8-20020a5d44c8000000b002422a466ff9mr4865681wrr.371.1669888300849; 
 Thu, 01 Dec 2022 01:51:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5J8JNd3+3oBXPPocI6iXuNVppyzQr4TXFZEThpwUc/WmzQogr3mSjBmHSNJevgQ3a0hNZBJg==
X-Received: by 2002:a5d:44c8:0:b0:242:2a46:6ff9 with SMTP id
 z8-20020a5d44c8000000b002422a466ff9mr4865665wrr.371.1669888300628; 
 Thu, 01 Dec 2022 01:51:40 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e4-20020adff344000000b00236488f62d6sm4119275wrp.79.2022.12.01.01.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Dec 2022 01:51:39 -0800 (PST)
Message-ID: <30fca604-fede-90db-ddcb-40359716ac8a@redhat.com>
Date: Thu, 1 Dec 2022 10:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/3] drm/modes: Use strscpy() to copy command-line mode
 name
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221128081938.742410-1-maxime@cerno.tech>
 <20221128081938.742410-2-maxime@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221128081938.742410-2-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org,
 coverity-bot <keescook+coverity-bot@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/28/22 09:19, Maxime Ripard wrote:
> The mode name in struct drm_cmdline_mode can hold 32 characters at most,
> which can easily get overrun. Switch to strscpy() to prevent such a
> thing.
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1527354 ("Security best practices violations")
> Fixes: a7ab155397dd ("drm/modes: Switch to named mode descriptors")
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

