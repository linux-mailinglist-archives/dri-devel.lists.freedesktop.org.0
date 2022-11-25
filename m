Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2B638853
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 12:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFED10E728;
	Fri, 25 Nov 2022 11:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F371B10E728
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669374735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lxU1Rbb/abSsZvZ6c7uR6nOCdyrA7Yjf5rgzN1ey7M=;
 b=ijxtUbL6SDbB46FujgONIpEsOCEOLIfGX7UCpbunhNH9NGekvfu+8jCKbGEhbZ2M1V5gxj
 1sEkqSMahQmInifaAYhuVF0Cj6+abB7OkvmB7mV6jbwmDV4m0V5LkxxhDTZBaWJZrbxDUE
 MR+wFyMpLFJVFZMLQa+bsfPzqDsDwjU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-TKsgliYkPbanBh0_XuiapA-1; Fri, 25 Nov 2022 06:12:12 -0500
X-MC-Unique: TKsgliYkPbanBh0_XuiapA-1
Received: by mail-wm1-f69.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so4043508wme.7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 03:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2lxU1Rbb/abSsZvZ6c7uR6nOCdyrA7Yjf5rgzN1ey7M=;
 b=fDMDkBEZ6pVYHTy37kkIia5FEvUiOKWrd70ozPabPlzNNy/IhlQerpHwHHkBLDRVMD
 I66EKL/TdQZGPDmyQGA9hpbQQRZ7cDK0SOen/di6P4GXcamUvydaFOepDHeFrpz9s8yT
 qZW3bKmCDcXuQwdK8sBpcA5evSm/TLxfoQpI3c/h3wNned0jw5Chk2Vh7PlLFyxWjV5/
 qHsnfJpOQHYfmogNiWM0iz2fJ1iSFsl1KcxKMGccqF1mPlmWRlNJOAnPdShiC9SPJzo6
 SQLd3m2nZkTQJYjQi7NftsVWpSsfbFyAc/IxFLdjsUJBiTdEOFgzF79zVMVdPj3Mpk/R
 NpEw==
X-Gm-Message-State: ANoB5pk042+8OrUOmjCuXTRiA0dAmDVpMm1deIuiinZm72Jz5lhSiCdU
 JJVHKWazwbi0q1yMztu3i5xqpOxhXmZMeIslLQTA/GxsOqMA7geg42sraSvv737Z4Dm9EEOGVF/
 rX28WUGLU5y/gzQS5wwLQktDK+RtK
X-Received: by 2002:a05:6000:1c0e:b0:241:e4d1:d192 with SMTP id
 ba14-20020a0560001c0e00b00241e4d1d192mr10209313wrb.534.1669374731091; 
 Fri, 25 Nov 2022 03:12:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7p1vj0N8iVuX9+tqZWhKZmYo4t7Jz83x2SXNSaxC/wK47BdRJZAm4d8wEODTWCBcg4oGQSAA==
X-Received: by 2002:a05:6000:1c0e:b0:241:e4d1:d192 with SMTP id
 ba14-20020a0560001c0e00b00241e4d1d192mr10209298wrb.534.1669374730903; 
 Fri, 25 Nov 2022 03:12:10 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 hg27-20020a05600c539b00b003a3170a7af9sm5141530wmb.4.2022.11.25.03.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 03:12:10 -0800 (PST)
Message-ID: <c7995e42-7802-a432-7ff5-412b4f3d0cc3@redhat.com>
Date: Fri, 25 Nov 2022 12:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 16/24] drm/vc4: txp: Initialise the CRTC before the
 encoder and connector
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-16-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-16-051a0bb60a16@cerno.tech>
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
> It makes more sense to register the CRTC before the encoder and
> connectors, so let's move our call around.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

