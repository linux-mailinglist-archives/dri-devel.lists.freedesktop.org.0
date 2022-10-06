Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7812C5F6F1F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 22:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1303A10E89C;
	Thu,  6 Oct 2022 20:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EA010E89C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 20:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665088096;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G9wp/f1ftxbFIkPyBbIeH9ntRSei8bYZVJ/AqmeeURA=;
 b=ShEaye6J6HZ4fIbB/5XRR1F0L6aFNVDjjxFqkjn3UGGBidZo3snnqPN/MQ6P7Uymw28iDM
 0x/w2jX604rAMpVCDn6xJxCD2SU+xOQmYh9OezHJiLhqBuioHewS55a9BpyWDf3lvC0sV+
 Tu2BLPhqqiBPqHRGyexIEmlAz0xlWWY=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-p7kE7S8MNiKfvboATZXBEQ-1; Thu, 06 Oct 2022 16:28:15 -0400
X-MC-Unique: p7kE7S8MNiKfvboATZXBEQ-1
Received: by mail-il1-f197.google.com with SMTP id
 k3-20020a056e02156300b002f5623faa62so2419240ilu.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 13:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G9wp/f1ftxbFIkPyBbIeH9ntRSei8bYZVJ/AqmeeURA=;
 b=dPvu+xDWsPp4Tw48Xu5EqCiouOKzMP2EHfB62lMZsOzPLjZZClowyT9O276TMZa+om
 0cZjs2/MafBI/TrytRt0a5InERjiLeHZbRvQW0EyHvP9hTarLz7yBZ0pnf/A5RBsch+w
 CqS2FmJA5BNpsC6s7U/ylRN8f/sLt36r2l0mJqBQmL+KJhiYr5E7tSt5EsO/Ygk0M/PW
 ynVvmIu97MP3xeA3NNxASR0+tFBPvq2K1S6UTs5vpjCcur3HDUkNk0Jb8DIYwCpJOUbt
 wksgpoeaigc5n76Vgn4ueFDgctta3VD5BImIObUg69IlhNe/e1y6u/1mS5rnMYDKDPW0
 +pJw==
X-Gm-Message-State: ACrzQf3HqZTZuStvl4z/OJOfxx1I24qmCX0S/DDrq55/17H4JOoX5bFH
 ogVr/SWH5m6b8L1lQPSq5H+hTh+JJwHvL5jXhnA+GUATVXW73xn6tvkVKpE5BGZBrEeQrEYqOSo
 F39EiCZ55si+4oAkqU36edsdDiyGS
X-Received: by 2002:a05:6e02:18cc:b0:2f1:fcbb:e6e0 with SMTP id
 s12-20020a056e0218cc00b002f1fcbbe6e0mr700393ilu.139.1665088094364; 
 Thu, 06 Oct 2022 13:28:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6yazbw8iFftYs/fecVivNndbTZJ1+EOTN1Dhdb5hAT2EYw43UNJSg5up5UkpVdfN+EpR+sIA==
X-Received: by 2002:a05:6e02:18cc:b0:2f1:fcbb:e6e0 with SMTP id
 s12-20020a056e0218cc00b002f1fcbbe6e0mr700382ilu.139.1665088094087; 
 Thu, 06 Oct 2022 13:28:14 -0700 (PDT)
Received: from [10.157.9.147] ([97.64.79.183])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a92cf01000000b002eb1137a774sm171313ilo.59.2022.10.06.13.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Oct 2022 13:28:13 -0700 (PDT)
Message-ID: <7bea011f-f1d0-4375-ee1c-f97e12cd3f0a@redhat.com>
Date: Thu, 6 Oct 2022 22:28:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 2/2] drm/atomic-helper: Replace
 drm_atomic_helper_check_crtc_state()
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 daniel@ffwll.ch, airlied@gmail.com, ville.syrjala@linux.intel.com,
 daniel@fooishbar.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221005114002.3715-1-tzimmermann@suse.de>
 <20221005114002.3715-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221005114002.3715-3-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/5/22 13:40, Thomas Zimmermann wrote:
> Rename the atomic helper function drm_atomic_helper_check_crtc_state()
> to drm_atomic_helper_check_crtc_primary_plane() and only check for an
> attached primary plane. Adapt callers.
> 
> Instead of having one big function to check for various CRTC state
> conditions, we rather want smaller functions that drivers can pick
> individually.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

> +	drm_for_each_plane_mask(plane, dev, crtc_state->plane_mask) {
> +		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
> +			return 0;
>  	}

I believe the code convention is to drop the curly braces when you
have a single statement inside the a loop ?

Feel free to ignore it though. I particularly don't agree with that
convention anyways, because I think that makes the code more error
prone. But still thought that was worth to point that out.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

