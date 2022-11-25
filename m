Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ADA6388C2
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:30:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A928110E738;
	Fri, 25 Nov 2022 11:30:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0919710E738
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 11:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669375834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0NAIt6DmSH0rxYc10/Lncuu2fhazNaRFZIsHf4ynJeo=;
 b=LosUu0sQXoMCT7DerQKRcE5GfxcBo50McXrKnJGFGo6NkoyPF6Ijtpd1cB7B1bnWFaHlgL
 +PeYg07TPBakCKgbb2+y2lW0OvdONnTjCQYnqLZderviAV19Z84g5Ndmmq5qIrHcmVICSa
 4HLz9cwhmfoGQDlvgS+CEAA6jWEbtnw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-FnQ6e6HHP9K0Mb7KxVC2dg-1; Fri, 25 Nov 2022 06:30:33 -0500
X-MC-Unique: FnQ6e6HHP9K0Mb7KxVC2dg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j2-20020a05600c1c0200b003cf7397fc9bso2307406wms.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0NAIt6DmSH0rxYc10/Lncuu2fhazNaRFZIsHf4ynJeo=;
 b=l80rbhC9hlJjIZw8jQ73Z7lCtbSjqsNPYEepIk5qWB1D1EMcR2lsAACjGSPagzU37U
 /v/MKmH2QMSVYoY4y0LFDIEUkwF5SFDJVD26LpN73lNZUTqYi70+zI87enUNp4rRCPbk
 GnfeuV0yxyA2TgFMO8KU0hQYXOzE2liFRB8sarwFfSwq7ggkJAHxrz01PFfjcxRLpGFW
 o4dilauqOFBw0Ck0uV6d1Qj2uPDLz0P/ZhWMw9FmAC5Q45JWS7dj5rB6LyMwGApR5hZD
 5uWhgfhaNB5n7BjSndaJOjzCDJVngtqclTJnENCqV42kfuRA0W3+ZDAWc/QKnMeF2nAe
 SPMw==
X-Gm-Message-State: ANoB5pnkP4wQnf1cpmOz136zihM6Y7BWshrtit/TZJUY3RZdq7v35sLI
 23n9BwpuJhhBkOAlTG4TITAIrd373pyZfCwGjbS6wBWcLu5wT5chUGOnmAagIyC0/29vVLc7rJY
 7S2jNjZpwQviXJNx44nqj0c+Toun1
X-Received: by 2002:adf:f782:0:b0:236:73fa:c56e with SMTP id
 q2-20020adff782000000b0023673fac56emr16927458wrp.432.1669375831768; 
 Fri, 25 Nov 2022 03:30:31 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5BqcPogGv74wKCFoPNLhym/zSZ5Ydptut3F8lISznnnvwUd9+tWysN/KklB3LvI2knnu0JgQ==
X-Received: by 2002:adf:f782:0:b0:236:73fa:c56e with SMTP id
 q2-20020adff782000000b0023673fac56emr16927439wrp.432.1669375831561; 
 Fri, 25 Nov 2022 03:30:31 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c0a0400b003c70191f267sm9996825wmp.39.2022.11.25.03.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 03:30:30 -0800 (PST)
Message-ID: <323c8e02-4085-c46f-61cc-b9edbd902544@redhat.com>
Date: Fri, 25 Nov 2022 12:30:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 19/24] drm/vc4: crtc: Make encoder lookup helper public
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-19-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-19-051a0bb60a16@cerno.tech>
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
Cc: David Gow <davidgow@google.com>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/23/22 16:26, Maxime Ripard wrote:
> We'll need a function that looks up an encoder by its vc4_encoder_type.
> Such a function is already present in the CRTC code, so let's make it
> public so that we can reuse it in the unit tests.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

