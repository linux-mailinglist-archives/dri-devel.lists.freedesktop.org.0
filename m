Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B33638820
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8F610E725;
	Fri, 25 Nov 2022 11:01:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C2F10E725
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 11:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669374113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TfA9A7l0JYE/L8ETH4uO/o+2VqeJpw2uLOXbWd1Oacg=;
 b=CvYH19UJaMPJqGoLIoAUHp0HMz57MuFdBt2ncJWc0neAYZbYbpMR013kfVpqFyqkKxgcd0
 qRIQ1MRj7ZW6WRoNKNIKwyuzX6zrg8UxAXiks7O83j2RosYenoDxZtSKgAX3LRr4sISw05
 pVv1/fhOqb66S5ZWoAqXrgDqYyghU4Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-335-dUzpEYZFO1ySl6TnkTAHsg-1; Fri, 25 Nov 2022 06:01:52 -0500
X-MC-Unique: dUzpEYZFO1ySl6TnkTAHsg-1
Received: by mail-wr1-f70.google.com with SMTP id
 h2-20020adfa4c2000000b00241cf936619so768476wrb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:01:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TfA9A7l0JYE/L8ETH4uO/o+2VqeJpw2uLOXbWd1Oacg=;
 b=yM7/1AS3Glsg1XfP2XiH3ZKFwAV6RnWGvBuWb3zEUeJ6VWXXTeJwCRGaW4SrTLBboN
 6JILlOVLhI9CIZ7Rapd6S7gsXDjuB4SLmnExNba97UJoCMSH4Ul1XePVXeBPuJpy+59K
 bTJ/riVkMUhK9Z4QEIyrO3LbH6PbWeWV6S7wzq8AJ6/YBtMYe0Bpi2DKUzDwGcDOV/IF
 gZkTSQX/bLxchnahHFaSVJKj3nGcZMhASm1vPIRUF109pF82VGa2pKymjWMCEZkuEzLJ
 BntEN+V0JAGPFoYXyY15YHecKSMcaG8oIIAeIAiyTRfBdiyd/uIwIH4WOhXySeAjYqZz
 XxqA==
X-Gm-Message-State: ANoB5pmcDu2LUAlvaw60+6Wu/ctXtOdVyPm51NudyBAJXFWGyOaidXD2
 D64oOheu/4FTH7BvxEdWNTbpSxdHim35/S0C76oBFCEd1mMo1nRL3ZwmN63N7eIACDevYJI1Oy2
 rt8MZU46SOJiZgRmC5sasffZy8XUl
X-Received: by 2002:a7b:c456:0:b0:3a5:f600:502e with SMTP id
 l22-20020a7bc456000000b003a5f600502emr18311883wmi.39.1669374111319; 
 Fri, 25 Nov 2022 03:01:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf54zF2uRxU4RbTU39UVEvJ1RZet14YgzdlvBFjd7gpCV0KEEizmQ7IkJumuXXzHwnc2Bml0/Q==
X-Received: by 2002:a7b:c456:0:b0:3a5:f600:502e with SMTP id
 l22-20020a7bc456000000b003a5f600502emr18311846wmi.39.1669374111092; 
 Fri, 25 Nov 2022 03:01:51 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r11-20020a05600c35cb00b003a84375d0d1sm9723651wmq.44.2022.11.25.03.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 03:01:50 -0800 (PST)
Message-ID: <8df31d1d-1ed9-eb6e-80bd-1f82adfb0185@redhat.com>
Date: Fri, 25 Nov 2022 12:01:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 11/24] drm/vc4: Constify container_of wrappers
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-11-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-11-051a0bb60a16@cerno.tech>
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
> None of our wrappers around container_of to access our objects from the
> DRM object pointer actually modify the latter.
> 
> Let's make them const.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

