Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F18694679
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 14:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A44010E02E;
	Mon, 13 Feb 2023 13:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7245610E5AF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 13:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676293495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nwrV3ycx4iFO2320A5Qv6QZGdJkUA6v5aGk1TzzMXqA=;
 b=VVZSdFLI6k9MLiISjkI/j8cHl/I94JgFd4jxfTj3kFQPZK5RWhXBWGpG6+EulM2pHv+uvz
 /HVpk//4JUrShmi0yCJydub0lvdN4ZOPw4siA7ZXZigHCwb9Zgx2aJAD+JoSS0/qocaVLp
 9xdnvOQexZ2hzbdgu0sd0rN2X9nrAB8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-119-vunoNSPiNROiJiLSYSwCSA-1; Mon, 13 Feb 2023 08:04:52 -0500
X-MC-Unique: vunoNSPiNROiJiLSYSwCSA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k17-20020adfe8d1000000b002c55ef1ec94so360995wrn.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 05:04:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nwrV3ycx4iFO2320A5Qv6QZGdJkUA6v5aGk1TzzMXqA=;
 b=LBN/4Ne4/OEWPEj5qo55hbNJXiqrxOUCO6FNP3+u2mo0Oeau6YZmhfzUrsFdpCCErD
 0FlQDwNxAT3A9q2LJKafVl/TFbpmwcAePvvTdxFkvTcMmRdpWd3t6lr4lelqSAwAEQhy
 9+R5hXdSMehknPf6ABm803TYp+mAjtpehoruorXJ5PcLscbzeDaqDJcXmU6q7W6+4Nhb
 ke9f6LTka2N2OfUHxc8wxX0ZflrficAGJGRcUL4e745qmxBl01hFhP+qTayfW0nm4NWx
 KFe3Mzvkqgy00W3OeRMhFsB6sXUY9KZY4P3Ve6T01c851H4AUo7V9ENYMYMdBsgt7fPG
 LwKQ==
X-Gm-Message-State: AO0yUKUn8bRoPdxsZ+ZfjXqUcFOSv4/gM2muwbunBYu7U1DvbU8Men8N
 Mxv/BsmWtae4OEsmoB4u/TFQvITRaMP3RspDuZMpSxvSsgC8q6yKQ9cU2CsZQxYGqvNUqPr5qVO
 LubV+01L/SRgnR6nztMdOaFTTyzWt
X-Received: by 2002:adf:db88:0:b0:2c3:d83a:113a with SMTP id
 u8-20020adfdb88000000b002c3d83a113amr20956966wri.4.1676293491438; 
 Mon, 13 Feb 2023 05:04:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+2fYVfJ8xcbOh8Q019xoi0eGuMc4hfGo5jogmj3eAYReeBtklOcxey30kucV/8Pt9pouK1zg==
X-Received: by 2002:adf:db88:0:b0:2c3:d83a:113a with SMTP id
 u8-20020adfdb88000000b002c3d83a113amr20956954wri.4.1676293491245; 
 Mon, 13 Feb 2023 05:04:51 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w1-20020a5d4b41000000b002c54c0a5aa9sm7768432wrs.74.2023.02.13.05.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:04:50 -0800 (PST)
Message-ID: <7ffc4967-11b2-e74d-2239-8f5ff19dcb28@redhat.com>
Date: Mon, 13 Feb 2023 14:04:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 3/4] Revert "drm/vc4: hdmi: Fix HSM clock too low on Pi4"
To: Maxime Ripard <maxime@cerno.tech>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230126-rpi-display-fw-clk-cleanup-v1-0-d646ff6fb842@cerno.tech>
 <20230126-rpi-display-fw-clk-cleanup-v1-3-d646ff6fb842@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20230126-rpi-display-fw-clk-cleanup-v1-3-d646ff6fb842@cerno.tech>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/23 18:05, Maxime Ripard wrote:
> This reverts commit 3bc6a37f59f21a8bfaf74d0975b2eb0b2d52a065.
> 
> Commit 3bc6a37f59f2 ("drm/vc4: hdmi: Fix HSM clock too low on Pi4") was
> introduced to work around an issue partly due to the clk-bcm2835 driver
> on the RaspberryPi0-3.
> 
> Since we're not using that driver for our HDMI clocks, we can now revert
> that inelegant solution.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

