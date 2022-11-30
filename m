Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D65563D1D3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 10:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5563410E43E;
	Wed, 30 Nov 2022 09:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA1410E43E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 09:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669800475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zpmq/XpiWXbMOZEg66Zy7jVIb78OWdpjdWyyx9Qsyt0=;
 b=S1Sy+9MKwHcwh9qKLtrNYhKTL1HzwMYSvKWMpmaVrn6YGyGLkqoJwQvwOkznqvZRup3ywM
 BzFBUcEl7WNIYzGn613YVc23MFB7epdj22ibaQ5aOoCkLQrHSrQsCjEHteyeo96RZZbT/I
 5zA1HL+f5h+mO5lri2CQ21eSTokmXC8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-8-eK8UReP32xpNipAIyLwQ-1; Wed, 30 Nov 2022 04:27:54 -0500
X-MC-Unique: 8-eK8UReP32xpNipAIyLwQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 s1-20020adfa281000000b00241f7467851so3394868wra.17
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 01:27:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zpmq/XpiWXbMOZEg66Zy7jVIb78OWdpjdWyyx9Qsyt0=;
 b=nvQZsoyB+hgypKaeDAmCT+nSYSZ6d0rMjS+u4LTjxhkguMxp46/pBN4cpn2O2WLAxR
 gHQTW5zD2CNBNO6vMh8f+vcThrH6lMNQJxqtEeDVNUvAzDhkUGFUKOloCAulnVbuioTN
 swBQFRCWGg6+82EkPwlplUwXsP4vVAqBCiegTjw7X/h2YQuxbBH3dLeCxFZ7raqgScZ7
 wHHU0UNyxExX2O7FrkcGoSYIxhkrjVd+8bbW0ywiIBa4gsTAwUxLhtATfkYuxdNOeW5J
 DTpub/ckwCwuVw2z8kD/WXCg/J694SAwL3Tab6Oa3hOgf5Bso9JEyZR0vR0DyMpg5bFn
 o+kw==
X-Gm-Message-State: ANoB5plYXfVQIFlKTWKMKQOV1JKiiA9ERUauTro8TLcOWrLT+e7UIbea
 NqM81M/y6GnJbQth8fPlYxG0dVtxhivEjekiqejgWu2bBOjaCESGzEsZ55ltyrKyM+N6361uyDK
 sefZ5a+XQxZ/ztjhJJ6++UhxheNS9
X-Received: by 2002:a05:600c:3548:b0:3d0:4776:7b73 with SMTP id
 i8-20020a05600c354800b003d047767b73mr18743923wmq.40.1669800473518; 
 Wed, 30 Nov 2022 01:27:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5lMQdNez6CG3ydcQTzf9gZFREx6F1ll3xRE649QPAQacBdUj+444faNh8sCrwOukxHZKgLEw==
X-Received: by 2002:a05:600c:3548:b0:3d0:4776:7b73 with SMTP id
 i8-20020a05600c354800b003d047767b73mr18743910wmq.40.1669800473261; 
 Wed, 30 Nov 2022 01:27:53 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n187-20020a1ca4c4000000b003d005aab31asm1684955wme.40.2022.11.30.01.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 01:27:52 -0800 (PST)
Message-ID: <d2e3752d-ce25-2f79-7022-fc1f4cfacc07@redhat.com>
Date: Wed, 30 Nov 2022 10:27:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 09/17] drm/tests: helpers: Allow to pass a custom
 drm_driver
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
 <20221123-rpi-kunit-tests-v2-9-efe5ed518b63@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v2-9-efe5ed518b63@cerno.tech>
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

