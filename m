Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5186387CF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863E010E713;
	Fri, 25 Nov 2022 10:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505CA10E71F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669373320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S8+u64ScLLmuZTRFUyAfXczflJucAb1iFk9pCBWNFeo=;
 b=NkrjqC3u+LyOQ7MFjuRlfqWww28eB7NlL1mViyDuNv7V6g87gL0kJNT3tAHwcp4F5COLX/
 QXIKsfg7Pswy4kFq77MVGOgkkGvD4naSTCqfX0nOuZlFQks7XLYjwDsHeElI8tjrH8voVS
 Gw6EQfPNwhb/kXk3+6Buy5oy0GZ42xo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-594-e3GUSx5rMCi9_nULUyKn0w-1; Fri, 25 Nov 2022 05:48:36 -0500
X-MC-Unique: e3GUSx5rMCi9_nULUyKn0w-1
Received: by mail-wm1-f71.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so4015556wme.7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 02:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=S8+u64ScLLmuZTRFUyAfXczflJucAb1iFk9pCBWNFeo=;
 b=tJyRGhQdAHfgAkIbQZUJ0CJt6RrMf00wsTpLJgBleFnTP+DHg78UDtR91AUf+5s6V2
 lTx0fioYM0m7H4gS12rd1WZ/KPMD7WrboyRYwIAokvSt/paS/qmgK9oRWjp7ucZiMCEF
 7a0EKAeo84hmFRsFMpp94ze1/rYDarWKAbzLeFwv/0DfEX0vzAwK36RlU7nK1fOFMttc
 +wM39Snvv7BdeD+x6jdLrB3nDydywkxpxi5UNdijHtmdAp/DsJsSu1xhhSn4AhEbnDkh
 BSjJbWIHks6kn9cONg6KnMcHlaUyeIdnhjBT8JRPK+Mck2h6zw+fvUwsLfAfc+OM+Zga
 ovdw==
X-Gm-Message-State: ANoB5pkn9ZtMxzdAOxofvDZ/DYSDvjVg+OgRPuwCt0J01avwuLv5aP1q
 o8OpjJm9bN7EE8OTaE2lMt7Zl6p/dt9WVkPfHAP1lcY7aApuvTrnYg3ew0A9ewafiNH1WI71bKI
 IWvMkgB9v3WE/thv95TsbJr8A7xst
X-Received: by 2002:a5d:4ec1:0:b0:241:f72c:1ca1 with SMTP id
 s1-20020a5d4ec1000000b00241f72c1ca1mr6336179wrv.395.1669373315769; 
 Fri, 25 Nov 2022 02:48:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf68mWbhAYVWJ14W9k0aC8vAp+Trr4GSf385HbqRyPEST2QyT8ndyWd8MhWpBxlgO+Y4G88ZeQ==
X-Received: by 2002:a5d:4ec1:0:b0:241:f72c:1ca1 with SMTP id
 s1-20020a5d4ec1000000b00241f72c1ca1mr6336150wrv.395.1669373315494; 
 Fri, 25 Nov 2022 02:48:35 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n11-20020adfe78b000000b0023677fd2657sm3555977wrm.52.2022.11.25.02.48.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 02:48:34 -0800 (PST)
Message-ID: <09086f46-8b21-9d72-d230-f59df7f2c51d@redhat.com>
Date: Fri, 25 Nov 2022 11:48:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 07/24] drm/tests: helpers: Allow to pass a custom
 drm_driver
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-7-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-7-051a0bb60a16@cerno.tech>
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
> Some tests will need to provide their own drm_driver instead of relying
> on the dumb one in the helpers, so let's create a helper that allows to
> do so.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

