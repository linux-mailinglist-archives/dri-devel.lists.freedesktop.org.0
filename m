Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 765656387F9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 11:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3022810E720;
	Fri, 25 Nov 2022 10:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8163810E720
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 10:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669373647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9tvd04/iu26771wlB7WciR/DkQpotQap05SOjl7Y+To=;
 b=IFO8O5CCbjGtmhQgqNuDDRkyEspYsmnx8s5Gmb51qDl3pWMB9sXL7HVH3/zISByJXCkQ7I
 VV4NAtp9Kl9LBBJ5eUseklz1viXCoob8rU7b4WgBD0uMAj6os50VUflohTaelRBmmLKPfM
 WGXaRm1I6yMKSmmD9YpiXxfK7Q3GgEY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-9S7SqgFDMCSkbZPp6ibJIA-1; Fri, 25 Nov 2022 05:54:06 -0500
X-MC-Unique: 9S7SqgFDMCSkbZPp6ibJIA-1
Received: by mail-wm1-f71.google.com with SMTP id
 h9-20020a1c2109000000b003cfd37aec58so2273584wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 02:54:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9tvd04/iu26771wlB7WciR/DkQpotQap05SOjl7Y+To=;
 b=AosOgVFSljX6LdjLGpp3ElSFZo+BBlfLuA/dnTm2JrpeujdtEet4Xn8XW+aX3TlSxj
 Cax91JKS1a1WjgnwLjufP0hXjuAZJNiGTSp9Em4R9zYXclB0KuGF1qPQi71VRphGbdps
 yG7H9o1x1VJVsj+O7C7LxBv18JpRILjFP4yYHIXlwU6SQpoRws/khEET3MnArWyGBxuN
 45L1eTAGrOxoTVrQajc7mS1j1tiCT1S3kyaRCXAYhdWQ93eAL3Oy/p/04LCLdpsAa4HB
 53j7P3K8MhECBoME3q+ee846731rFkMkOTL8+yp25p1z1mP8vrlE+kzyFfMc8BvL1bah
 JOBg==
X-Gm-Message-State: ANoB5pkILO0mCxtcLsa0EolW5OxypN5UpLYg90wJTiTGpFdgwof4D98q
 J7DCdt4PvfhZG3/ZsdeTCjqIAUoFTla5UikfUfRKwTGn+tX7l4FhY/SbxA/VhwtzvX2yWGtUzaw
 a1uEXwEeVsbvfZJNX/omkqdP+IgH3
X-Received: by 2002:adf:e94c:0:b0:236:6d79:b312 with SMTP id
 m12-20020adfe94c000000b002366d79b312mr22866562wrn.699.1669373645075; 
 Fri, 25 Nov 2022 02:54:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4MhXPJaPoTEfI4yng3ZY2kweBGK0CbbycrpZOheo/dL+NoYUdJpT+aQbCzIEhJ5+Sz9WdagQ==
X-Received: by 2002:adf:e94c:0:b0:236:6d79:b312 with SMTP id
 m12-20020adfe94c000000b002366d79b312mr22866536wrn.699.1669373644817; 
 Fri, 25 Nov 2022 02:54:04 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l11-20020a1c790b000000b003b4a699ce8esm8527114wme.6.2022.11.25.02.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 02:54:04 -0800 (PST)
Message-ID: <1b0c23f4-eb5c-38d2-b1ff-541140ac32a0@redhat.com>
Date: Fri, 25 Nov 2022 11:54:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 09/24] drm/atomic: Constify the old/new state accessors
To: Maxime Ripard <maxime@cerno.tech>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20221123-rpi-kunit-tests-v1-0-051a0bb60a16@cerno.tech>
 <20221123-rpi-kunit-tests-v1-9-051a0bb60a16@cerno.tech>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221123-rpi-kunit-tests-v1-9-051a0bb60a16@cerno.tech>
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
> The drm_atomic_get_(old|new)_*_state don't modify the passed
> drm_atomic_state, so we can make it const.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

