Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF5638844
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31A110E72B;
	Fri, 25 Nov 2022 11:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C862F10E728
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 11:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669374431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sFEngP0X3fPVq5kw5eVn67kkqccTP4KFzznQM/5adG0=;
 b=fmvGMa0d3gTBzlMFP2M2wpSA1RVy4KQ/rfyOFxUao7neKl4EDor3hwfeqS3U8+sS9AtX2K
 qsJ30a9CjckwVgx2tMu8en0I1tT4wFB8Mu7R3uhCkXUJO+O/Fi+/5jd0hDSvSaVOYo9IiZ
 Xykfnj26gdmsv8+x60uX3Lw+faEjiYY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-e8vfRwUCMf6t6cwxoaw1GA-1; Fri, 25 Nov 2022 06:07:10 -0500
X-MC-Unique: e8vfRwUCMf6t6cwxoaw1GA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l32-20020a05600c1d2000b003cfefa531c9so3942844wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:07:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sFEngP0X3fPVq5kw5eVn67kkqccTP4KFzznQM/5adG0=;
 b=OeLHbYdZRFVkJi5NgM47pgfK0HIt92cCzTAHGobdGuSHKJNxRe6+c8kHa6mFHhCh5J
 f88xUc5+XOhBWdvRTTR3EPjl2wICPZ1aLBeEscV01kTeWs+/xdN+Jl+friXLHBxQ6dKv
 2R7D/+eBqxYPLN7A8Jzo1vMXJeTwlyDPAhR7XLrziMEDa7KZfZ5NDLWROh+emwWw0Se/
 GwLaQPgIgMPogsprffORAqFI53ENd0wUqjzVjhZCmIsXt9NkU/CGIYr0RL2p5kfRa5Eh
 DCdZS+NakBvOjeBpilzNxaBptHpEsBDKg0ydAgRdsbCIPg+t+bSKsVlY1XdXygIhFMpb
 dsYQ==
X-Gm-Message-State: ANoB5pm7YLrMB4X3ZYum5EU3QO+1x7Io3d+TCXhaKvOLUEATWYfk9qAC
 5OVjb5b1C2dgTnTyCgI3nIsatBI3e3o301Kph/5C6IPOmK+k5QxieO5T3bv4iHnD9emCrz7Gz6I
 Q69kRhOS7pY2uSMkkBZnqSlQg1JqZ
X-Received: by 2002:a05:600c:4e4c:b0:3cf:87c6:890b with SMTP id
 e12-20020a05600c4e4c00b003cf87c6890bmr27851411wmq.194.1669374429209; 
 Fri, 25 Nov 2022 03:07:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ekFpSGBe1M+kDVda3TnzsIFkEcOgKcp7ocT5w3PpSZSU0krdQ+qq0patBmQZVNGkBmTCp8w==
X-Received: by 2002:a05:600c:4e4c:b0:3cf:87c6:890b with SMTP id
 e12-20020a05600c4e4c00b003cf87c6890bmr27851391wmq.194.1669374428951; 
 Fri, 25 Nov 2022 03:07:08 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 co29-20020a0560000a1d00b00236e834f050sm3703836wrb.35.2022.11.25.03.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 03:07:08 -0800 (PST)
Message-ID: <90c712ff-c5bb-ab44-fb1e-fcf7b055e908@redhat.com>
Date: Fri, 25 Nov 2022 12:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 14/24] drm/vc4: txp: Reorder the variable assignments
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-14-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-14-051a0bb60a16@cerno.tech>
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
> The current order of variable assignments is unneccessarily complex,
> let's make it simpler.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
Much easier to follow indeed.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

