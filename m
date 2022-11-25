Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFDD638863
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C11810E72A;
	Fri, 25 Nov 2022 11:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE9810E72A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669374821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFx/VXqLp/Ia7vJAw9Cj+XP8sI/+0/nuoQb7QGji8jU=;
 b=ShdxCAOqrb0btQ/Fb1bDGRHk+CkzcdIbOGlX9TxH4wGrKKhRTUaRUKZFaQaeTwIR5tzQz4
 dO4BImZk1L35DaKcfd1IpFSgZfnDuIG64JCp7HiOfztF3LGHNnQSDdtgpcbpDbDMMIh4V+
 8C1DbQvqJMBjR27FX+m83X9b8W6YE34=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-487-HNRMQjjMOWOAXE_2OCBpSw-1; Fri, 25 Nov 2022 06:13:40 -0500
X-MC-Unique: HNRMQjjMOWOAXE_2OCBpSw-1
Received: by mail-wr1-f72.google.com with SMTP id
 h2-20020adfa4c2000000b00241cf936619so775847wrb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:13:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qFx/VXqLp/Ia7vJAw9Cj+XP8sI/+0/nuoQb7QGji8jU=;
 b=ion1dFIMoNa+Bommx1eOfsumgc8iyefZxt7MLCCfh6fFGe+6aA0YB5J+qz9t3jBm81
 m0IUMHh7UmmJHZHxxIjbb73b8ocu9PJ4lb82xxdqZKlH4TlGpARmz2vbfAONIucVqlO2
 LLQNLRVpT8iPci81d5EXWRXBSvg3yu3dPMXmzQ0GUTvpEW3HSKYRDHfcl8jdHJ838WUk
 oxkW3aUzF3CVLdstDRkIy2i2QYRZSjuTfbYokfAV3pncTU7QpvfoiHdC+1XEPG7aRzTz
 /z2rJ3s8kLrt+vqrc+rEhFlG+i3lc9yiuGODbum0UiG6x+4vBg+qzZ9LtnuiTHVhr0BT
 mMpA==
X-Gm-Message-State: ANoB5pkZgwEgMkOu3KnbojJCNWWUakjy5Drtrwov9gOdZca7ALiGIU2C
 Y2Tgl/YStdqGLsIJNgb3EBcs6+3lMYwRZbwktLztDkxqOULok+WQ+qu9waNp1YY/vMZFi69sW3Y
 GVp6Lnfw8Gtw8bv+ujbLEY8Mhd5Au
X-Received: by 2002:a05:600c:4113:b0:3cf:a3e0:73e4 with SMTP id
 j19-20020a05600c411300b003cfa3e073e4mr14008544wmi.21.1669374819684; 
 Fri, 25 Nov 2022 03:13:39 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4QbRaGQmx0lzXwDi9UpdtUdoe4KD8bKMgqn+J5cd47t76yI/i28tjLFg1hYaguZbzcAUiqhw==
X-Received: by 2002:a05:600c:4113:b0:3cf:a3e0:73e4 with SMTP id
 j19-20020a05600c411300b003cfa3e073e4mr14008533wmi.21.1669374819497; 
 Fri, 25 Nov 2022 03:13:39 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 e3-20020a5d65c3000000b002383edcde09sm3440822wrw.59.2022.11.25.03.13.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 03:13:39 -0800 (PST)
Message-ID: <2405809e-8183-e353-1259-94e16ebe8204@redhat.com>
Date: Fri, 25 Nov 2022 12:13:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 17/24] drm/vc4: crtc: Pass the device and data in
 vc4_crtc_init
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-17-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-17-051a0bb60a16@cerno.tech>
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
> Both users of vc4_crtc_init need the same extra initialization to set
> the pointer to the platform_device and the CRTC data. Since it's
> mandatory, let's make them both arguments of vc4_crtc_init().
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

