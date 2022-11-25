Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548B763884D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:11:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344AF10E729;
	Fri, 25 Nov 2022 11:11:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2793410E729
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669374684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bXK7NEAftcHsfPhR8xLmiSPyb+Ng0LBgXVA+cCW5sV8=;
 b=elGz/XR+clak2f43PZlubXrFplPW7ONrwBFicP6O3wIa1QPJLOtrjFz1ewe7vvjgRCVLNO
 dI1UPHmVJ3vzydBGaGQDljhjH9hDVJIJX4JJEQB8sn/K2Sn5Ld5fzOWKbM/urG8lGDnVcl
 PvPI332VaBSR11W3mhFQ7ntmB9fb93I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-664-WtYPGBW8PdWFwfE1wBGZ8g-1; Fri, 25 Nov 2022 06:11:23 -0500
X-MC-Unique: WtYPGBW8PdWFwfE1wBGZ8g-1
Received: by mail-wr1-f69.google.com with SMTP id
 o10-20020adfa10a000000b00241f603af8dso788709wro.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:11:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bXK7NEAftcHsfPhR8xLmiSPyb+Ng0LBgXVA+cCW5sV8=;
 b=d4ElW0WUDo9ybbhfRQEt8vRqqFg7r7Bv8a4vrYJZxUFCecroWf6zsk1PN3HAisW+MO
 mbDPIPQ/rf5mePZZY2D222AvmjMRbKDdffQwaR5K6gBLXwsSj30ZA7tyYRof1X9m2lS4
 ckvHmhGY4tfQw5Ad4lZZ6z67WoHi+jj9MHAOPhUE8/KWozk3aRWHxdaX1e0KZVfEUTEL
 bZLRkYr4TP/gweOwRSyd0NzgkbsaYmyqUVPiwe8ew8K4bm7oiX47ZamcTdz+sjfJwGBu
 NyYk2eEYRAoSOHB+Ho/m9uGXzl/KzeTV7JR9gr6+G8sT87UTtVZfLho0snha0ns3MiAt
 pGmA==
X-Gm-Message-State: ANoB5plOHAJKxg3tq2JfUTqICO+2NSE4ExEeuBLaxyVRXfuwD7T8E7vF
 ev8HTYDQ42cHPTAGmQZdpD28WDM9g+kJxNfCCTAWsU3BxWPdFgOQk+aYJD4S3D0IwInGwtsbtlL
 rzgfcQItmLyQ+R9z+EBXwgMPA8wHj
X-Received: by 2002:adf:bc12:0:b0:241:bc6a:ceb with SMTP id
 s18-20020adfbc12000000b00241bc6a0cebmr22077598wrg.514.1669374681932; 
 Fri, 25 Nov 2022 03:11:21 -0800 (PST)
X-Google-Smtp-Source: AA0mqf50vACH/nxqsgQ+LdWr/oW1K7P9EvuBwdf6WTZcR7NJizA5OCGwk+5+gUp1U3sa0s25anlUtg==
X-Received: by 2002:adf:bc12:0:b0:241:bc6a:ceb with SMTP id
 s18-20020adfbc12000000b00241bc6a0cebmr22077572wrg.514.1669374681761; 
 Fri, 25 Nov 2022 03:11:21 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v15-20020a05600c444f00b003a1980d55c4sm9529366wmn.47.2022.11.25.03.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 03:11:21 -0800 (PST)
Message-ID: <df32e940-7517-e98d-a48c-1942bfa89289@redhat.com>
Date: Fri, 25 Nov 2022 12:11:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 15/24] drm/vc4: Add TXP encoder type
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-15-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-15-051a0bb60a16@cerno.tech>
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

On 11/23/22 16:25, Maxime Ripard wrote:
> The TXP is integrated as a separate CRTC/Encoder/Connector combo, but
> for some reason doesn't rely on the vc4_encoder type and it's associated
> type.
> 
> Let's create a type to make it consistent with the other encoders.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

