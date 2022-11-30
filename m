Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26FA63D2D5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 11:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6195589117;
	Wed, 30 Nov 2022 10:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB1289117
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669803003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NoPdGdP1XN2IHlWy3xzG7ljlYAvy6qLxs9MsnW+HAEQ=;
 b=ZlZdyiD78BGnR/7hjwAEKvQuX3EWxeCxZAEK1un/gXLY11oC2oLzTipH7O2gQvjAkNXSfl
 VWCLswQXrsJ0DeE4uElLYmxNPYlFjF7gMIja7EsP/eBVb8zgPxM2525nGISImPvjh3nbLQ
 xTmuQ3MdMBKlw/dgan7AxN2Yc7Qd600=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-563-lCP0ejvnN5mUkp_oiBAZrg-1; Wed, 30 Nov 2022 05:10:02 -0500
X-MC-Unique: lCP0ejvnN5mUkp_oiBAZrg-1
Received: by mail-wm1-f71.google.com with SMTP id
 c1-20020a7bc001000000b003cfe40fca79so459566wmb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 02:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NoPdGdP1XN2IHlWy3xzG7ljlYAvy6qLxs9MsnW+HAEQ=;
 b=OYkDdFIjx0XHHUczlGBETV54lJdOoLbr7PUddIAJcA4vFRNswYDxd7SMsVwQyOGNEy
 vqBvtWcmyBBOE/nDMcCBog94QgcZ5oZezUWWwcbd8UU1uEnndfODrLcKyLrLikuELMqR
 ZUZ3LZ5AkTsRxCofflU/ozVDZ0jYTvqcT2uwpYAf7zAKKA4Zm+qmGejuZEtd/WP89/7d
 lNloCEhn0xI1zM1sD7bsBd0ArPM+UIA18UQ3BNO0P5V2ILczDm11o5fsWPgCZCJJzOMa
 KNWpPhXlSK4Ii+8GAMQfoR/GAKEMsWdZ1OKvgrD8AIrNqr1xcozTokShyWkWhJijr6/7
 Z28g==
X-Gm-Message-State: ANoB5pkpXjnh8LgB5ero8JkkFVlkuM1OvSHqyYRu58qPPCBHmQIjqIrk
 dXMpdD8Wo7/M1gWm3WWmztbjNyoWv4HHstw1oy8dNyn4PrwPf0Ld/D15afYTxR6arfa5WaxJKnc
 3UY7E+X5E5eWEh1h9PScVbwezDFVk
X-Received: by 2002:a5d:504d:0:b0:242:246c:2f89 with SMTP id
 h13-20020a5d504d000000b00242246c2f89mr3758393wrt.108.1669803000956; 
 Wed, 30 Nov 2022 02:10:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5FkWQT/k1GHgrsZnt54cNcc31t/15SG2tVARml33QGcmHm1VSq1hvfrPDi51V6Qbq5abMc4Q==
X-Received: by 2002:a5d:504d:0:b0:242:246c:2f89 with SMTP id
 h13-20020a5d504d000000b00242246c2f89mr3758377wrt.108.1669803000781; 
 Wed, 30 Nov 2022 02:10:00 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b18-20020a5d5512000000b0023c8026841csm514653wrv.23.2022.11.30.02.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:10:00 -0800 (PST)
Message-ID: <31351d94-91ba-b0fe-cb20-3dcc8254fb66@redhat.com>
Date: Wed, 30 Nov 2022 11:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 16/17] drm/vc4: tests: Fail the current test if we
 access a register
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v2-0-efe5ed518b63@cerno.tech>
 <20221123-rpi-kunit-tests-v2-16-efe5ed518b63@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v2-16-efe5ed518b63@cerno.tech>
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
> Accessing a register when running under kunit is a bad idea since our
> device is completely mocked.
> 
> Fail the current test if we ever access any of our hardware registers.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

[...]

> -#define CRTC_WRITE(offset, val) writel(val, vc4_crtc->regs + (offset))
> -#define CRTC_READ(offset) readl(vc4_crtc->regs + (offset))
> +#define CRTC_WRITE(offset, val)								\
> +	do {										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		writel(val, vc4_crtc->regs + (offset));					\
> +	} while (0)
> +
> +#define CRTC_READ(offset)								\
> +	({										\
> +		kunit_fail_current_test("Accessing a register in a unit test!\n");	\
> +		readl(vc4_crtc->regs + (offset));					\
> +	})
> 

Should this be made conditional on whether DRM_VC4_KUNIT_TEST is enabled ? 

That is, just define the simpler macros when is disabled? The kunit_fail_current_test()
is just a no-op if CONFIG_KUNIT isn't enabled, but I think my question still stands.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

