Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0014757EA5E
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 01:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8718EA53;
	Fri, 22 Jul 2022 23:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AD28A681
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 23:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658533267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=97bI5QgLIfV0Wdh5TUgNrSdu9yYHB/M82pkoGIrwijE=;
 b=ZS96DmFbdCLoBgifQrtmUoLuIi2asTutnqk+8aiT7QGa9n/yvxpzAm+yh5uFOtbvMG6z7y
 Pfi78HF40MYT7W4ygkPdXg3ArNxLHJzB9UuHj24+SGjAdRvVYn1hdvwE2dzD7U6qJWZTlg
 yJduQGSaP/4YzrCYmM8ALz008UBmH7o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-DOl6KKcjP8mq90gENEDuJQ-1; Fri, 22 Jul 2022 19:41:04 -0400
X-MC-Unique: DOl6KKcjP8mq90gENEDuJQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 i133-20020a1c3b8b000000b003a2fe4c345cso1502504wma.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 16:41:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=97bI5QgLIfV0Wdh5TUgNrSdu9yYHB/M82pkoGIrwijE=;
 b=WbuNqED0uhti3FQrhzeAkJBPtMRoiuFzmn5kVgDRHFOK4dzI01sYPase0iIJfww/9k
 TVKFS2kSS7Plj1LEmloCLMp3MD+HVrTQLH8QbUQhMyADv36gTh6TWfZ5LpZjHuEdvdID
 CJcp31sR2VHcySwTMmRZGCmeoQFv5EdSOyuQ/0WOcK6QF+ZGnlAkxmTA7Kzsg6SzR4dp
 wgCVY9CcpYk6ueoviSP+vAql3ZsYE1WDE7BzboegXrHOKarlT2OI9qt1Qkc5kXO+CQVj
 2oPA4Tyq842hBHRMe2fyLsiNCg1XVZDKHalm7SBmI956u06hzWROszEvg47sXlVQTWjI
 BNFw==
X-Gm-Message-State: AJIora8pU+AczPH6m08PngRPjLTj+BgFvmT79JOBsJTvU9UrWX9UIXsn
 yzrmsswpKiSaWkL4+iQdpAnBOevkjJ33wQbW17YV8xubg8l6khLBKaltWZb2K6FBKcbZ6Mj+Uwj
 jrspC6EReWR5RhI+Oa9FfEBiuyU5q
X-Received: by 2002:a05:600c:1914:b0:3a3:4476:36f1 with SMTP id
 j20-20020a05600c191400b003a3447636f1mr2498471wmq.205.1658533263239; 
 Fri, 22 Jul 2022 16:41:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vZl5vBvV9oaQlXAWarpxnm0CK2ceKfdcr+DpcSHyKu4xh9ne3vQ7GxzdPJaOTMkBhI81Ta7g==
X-Received: by 2002:a05:600c:1914:b0:3a3:4476:36f1 with SMTP id
 j20-20020a05600c191400b003a3447636f1mr2498461wmq.205.1658533262948; 
 Fri, 22 Jul 2022 16:41:02 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r67-20020a1c2b46000000b003a308e9a192sm10205489wmr.30.2022.07.22.16.41.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jul 2022 16:41:02 -0700 (PDT)
Message-ID: <6f5f6fbb-5a6c-3bc3-20f7-1a97854434b0@redhat.com>
Date: Sat, 23 Jul 2022 01:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Use dev_err_probe() to avoid
 polluting the log
To: Doug Anderson <dianders@chromium.org>
References: <20220722074755.660258-1-javierm@redhat.com>
 <CAD=FV=WR3UP4XMch5z8Hz8GzWRg5cCsK6FVwgoo=HHDnpTwz+g@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAD=FV=WR3UP4XMch5z8Hz8GzWRg5cCsK6FVwgoo=HHDnpTwz+g@mail.gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Erico Nunes <ernunes@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Enric Balletbo i Serra <eballetbo@redhat.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/22/22 15:35, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jul 22, 2022 at 12:48 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> If devm_drm_of_get_bridge() can't find the connected bridge, it returns an
>> ERR_PTR(-EPROBE_DEFER) to indicate that the probe should be deferred.
>>
>> But this path also prints an error message, which pollutes the kernel log
>> since is printed on every probe deferral, i.e:
>>
>>   $ dmesg | grep "failed to create panel bridge" | wc -l
>>   38
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> If someone else doesn't beat me to it, I'll apply next week sometime.
> 

I've pushed this to drm-misc (drm-misc-next). Thanks all!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

