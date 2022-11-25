Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A62C638581
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 09:50:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7578D10E05C;
	Fri, 25 Nov 2022 08:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595ED10E05C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 08:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669366235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZCa5X8lXlExaGphI0WGFeQw46HpXtfvTpixratHZyiE=;
 b=B3Lh+NtPg/yvsm5mOnBrZzbuAWTquVHGKL5wg1PJiufqANb6kdhDa3iYRZsycsoqXK4+Ik
 KkIM4uiGN3A4er9AiBRxiPlYtLr9PUMx/pEr3obNfGapjRFUAtMy+RlNBkYs7ld24FzeiX
 HyNvdApubs6CW4gmG6Ivfm494iQOSus=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-e16dgo2GOCOUPzaJXdJwzA-1; Fri, 25 Nov 2022 03:50:34 -0500
X-MC-Unique: e16dgo2GOCOUPzaJXdJwzA-1
Received: by mail-wm1-f69.google.com with SMTP id
 c187-20020a1c35c4000000b003cfee3c91cdso2119139wma.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 00:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZCa5X8lXlExaGphI0WGFeQw46HpXtfvTpixratHZyiE=;
 b=R7I+//A90t1QDy2tHGjZO+1H6mWyK2vVXXYDiOXYFyvBw/y5MnbdntA0aicfRCezFW
 zmIvpc4BQMcwUTogFokWE892lV7FB/2NX8RrXz1piFt0SeEVJD3askB9w7B/otjTBEAZ
 b7Uo6sf71GY5ZtJT2dcAela9ZVN/RdH1p7iku6mW3Q7sXLfj2LjmYa1lPrh1M+gPltmz
 N1Ml9yMMba8mrIHO+dtEzPghTOt4NaDQ1L/ykc7meMuESRIz7oYdbtiqdRiClyoshBfy
 R1ahnqm5oAjT45O+ZSS6pJG03lsck9bSgG72UXp0m+uU58LndoSw5R9QGY4I3lKIcHsE
 MQww==
X-Gm-Message-State: ANoB5plKXlVP9HYlf/qZtCFqwEz95wGXGhqBawqmmuS3TbM9vV7LcaIm
 ekrIql0+lU95IlYgEgeUK48uSpqMFmZ94Z1uHvCdL6y54cLsuT5dZMVtqctJTyPRNOXg28+aL4b
 9T884iH9NzHxcQqK69ELNW0U01ErC
X-Received: by 2002:a5d:5305:0:b0:242:25e:e731 with SMTP id
 e5-20020a5d5305000000b00242025ee731mr2642364wrv.48.1669366233208; 
 Fri, 25 Nov 2022 00:50:33 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6mov6a1ABQsKCpweMfuKZj8FtStMvwn4E4x4v/bkoJJVxviE1bsUHgijhFDEI16xW3gYv3qw==
X-Received: by 2002:a5d:5305:0:b0:242:25e:e731 with SMTP id
 e5-20020a5d5305000000b00242025ee731mr2642344wrv.48.1669366232940; 
 Fri, 25 Nov 2022 00:50:32 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 p11-20020a05600c468b00b003cfd10a33afsm8890236wmo.11.2022.11.25.00.50.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 00:50:32 -0800 (PST)
Message-ID: <2517016e-1b31-b821-df0c-8c0498f11719@redhat.com>
Date: Fri, 25 Nov 2022 09:50:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 01/24] drm/tests: helpers: Rename the device init helper
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-1-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-1-051a0bb60a16@cerno.tech>
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
> The name doesn't really fit the conventions for the other helpers in
> DRM/KMS, so let's rename it to make it obvious that we allocate a new
> DRM device.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

