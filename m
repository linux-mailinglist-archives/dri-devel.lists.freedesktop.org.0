Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C62C63D2F7
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 11:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133C710E0E7;
	Wed, 30 Nov 2022 10:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BD510E0E7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 10:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669803349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CxbB2FEXTvRF2CzuUkTWE4rFXxyela8ryo1CFsrhtF4=;
 b=Ilu7a2SO+i0LeScqUcu5bN0e6oxFILp0xY6uymxsTrxrpiTnJ3CHSsWePUwMJcX+APlU/V
 sEeNAV0H0ndS8XoOle4arHS3ICzg8w7QhZKQa+6aIn9aiBY+DTLTdYWljaMRTWfo3ansnz
 ZwX0zckvG+Z9J8+gMKzZl0k85YSEq08=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-EUivZbl-Nt-cIsP-Z9YiAw-1; Wed, 30 Nov 2022 05:15:48 -0500
X-MC-Unique: EUivZbl-Nt-cIsP-Z9YiAw-1
Received: by mail-wm1-f70.google.com with SMTP id
 z18-20020a05600c221200b003cf7fcc286aso471004wml.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 02:15:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CxbB2FEXTvRF2CzuUkTWE4rFXxyela8ryo1CFsrhtF4=;
 b=awqYiUd87w2lJ/Gq46wiqAWkXE8jGo8xChEsMLeRYb/J/EuuPbthNAgy2nSVcqgo6Q
 zrvWtOxp5ynm2026U8NqyKbKCSWL8zWfQCWCMrMgjq2GENXyeOP8bZILy7NGPvW2nykp
 SkQL1gAwtdlyMzV3oIYuzih2k1J2vPiirkIRB9eC/gBqep+zFrw8NcZY5gOhdpmGpeZX
 a8ppWQJyZGIFmjcYP8Z/aVvt4DydfOG2rsCPfpXfISFnsN/lhceRnDuE6CgCTMn7kOgp
 aOL/t7DRx1IeaUONEMrgN7Tacp/13UKXJybahnJHVpiSPDdq91utFUx2EdP+0zyJW5L6
 54Qg==
X-Gm-Message-State: ANoB5pklHRQ6Rjbd8nBIv5pK2asD9cq0BbePJtsORm+Q3WyRQPoxNGg9
 GupUE8nxs+4A3VRXBVedv6K4FEX7yrN3aI0VXjUQj151TDnzlXenDB8lywmI24PKF1NzlnNh5QJ
 OvI1OpEJjIcSY/0tymFSH+OMNrWGL
X-Received: by 2002:a05:6000:71e:b0:241:df3f:f5d6 with SMTP id
 bs30-20020a056000071e00b00241df3ff5d6mr25887786wrb.288.1669803347043; 
 Wed, 30 Nov 2022 02:15:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf489Ao4FvIZrt2NmdFFZZC3lnncO3vTH3xWCwvBSPnOhZqxpghPRCNXtDB4BiPRHtQZXu9P+w==
X-Received: by 2002:a05:6000:71e:b0:241:df3f:f5d6 with SMTP id
 bs30-20020a056000071e00b00241df3ff5d6mr25887772wrb.288.1669803346802; 
 Wed, 30 Nov 2022 02:15:46 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l11-20020a1ced0b000000b003b3307fb98fsm1397702wmh.24.2022.11.30.02.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:15:46 -0800 (PST)
Message-ID: <6222f13a-a03f-cf20-343a-e885f80cc4ed@redhat.com>
Date: Wed, 30 Nov 2022 11:15:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 17/17] drm/vc4: tests: Add unit test suite for the PV
 muxing
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
 <20221123-rpi-kunit-tests-v2-17-efe5ed518b63@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v2-17-efe5ed518b63@cerno.tech>
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
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/28/22 15:53, Maxime Ripard wrote:
> The HVS to PixelValve muxing code is fairly error prone and has a bunch
> of arbitrary constraints due to the hardware setup.
> 
> Let's create a test suite that makes sure that the possible combinations
> work and the invalid ones don't.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Thanks for this patch. It shows how powerful KUnit can be for testing drivers. 

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

