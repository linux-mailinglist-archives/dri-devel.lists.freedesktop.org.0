Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2073D4D301E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 14:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9D810EAA1;
	Wed,  9 Mar 2022 13:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA2010EA4D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 13:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646833285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssBZVyi4+h9kP2qv31uprsTOl0+0RRXY3OyMT9dWw3w=;
 b=Z5a4hrKsr2dPkMlgsGPgW1Kw8YljupKRlvlI0UeN3SHhGpstpwX624wjmLp06O+lXLKBk3
 Yab8j1fRVqbFWEM9Lx5shCgaSnavfz80rMFOwzpgsKh4+gJBl18B4dzDyNFCDSLM5H7G+e
 O4EHiTKYzn62g9LiNa+gjNNAgNi3hJg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-OEZeI02BPPKbotN_27usmw-1; Wed, 09 Mar 2022 08:41:24 -0500
X-MC-Unique: OEZeI02BPPKbotN_27usmw-1
Received: by mail-wr1-f71.google.com with SMTP id
 a11-20020adffb8b000000b001efe754a488so772604wrr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 05:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ssBZVyi4+h9kP2qv31uprsTOl0+0RRXY3OyMT9dWw3w=;
 b=tCh7vJgFbI6WZQ2I1TFK+Xo/XO+ZVyXBnEzaB/XwVD3gL5GOJKhEKSeMv2EdqFGiDb
 udApXiwJf3GZ/U2srt8lUu1aTnYMElXfTi2jQBZ+8M3+Ir4vk772WA2emCg68M3ayjkV
 kZIpYDVup4IcRAc6c8l0xtvj9mT9Bqm+LLpcgsMVvYDsYEisfGkOYHv4UPq99uAvniPt
 0b1+ikqjHXozUsWfj91KRQmQjaqxWpYEDtVSEv3kgXYwsu73yeigrsS3EgWp1BB8eZx4
 DsdTYUGiBMKXZqXYnfjr8q6XpwOIjyPp9ZCgrDKHS6d7OWCHbJnRdYllDgXa245UDPyM
 cvGw==
X-Gm-Message-State: AOAM531Gc/2MbGzm3olXv/vxAJPLC+wNPIL+k6aT7BXjbNuvMtdEMQ3V
 W6gSkdW8tdC7nwUfmTvY6w3yV2o0LNtqOaI+06mX7vypDg6B4DLvf+1j9Y3VwcRv3m4FOBZD2DZ
 8bqSMZ33PF59fxxQkYhbLvKjx6Chg
X-Received: by 2002:a5d:538b:0:b0:1f1:e60b:20c2 with SMTP id
 d11-20020a5d538b000000b001f1e60b20c2mr13695564wrv.294.1646833283583; 
 Wed, 09 Mar 2022 05:41:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyES6IHb68vtll06LYWTE9X9Tv+reEFiMr6+v6lhyVKOWCvdsUheCN8hBAtdi7CCeUXh3nUHQ==
X-Received: by 2002:a5d:538b:0:b0:1f1:e60b:20c2 with SMTP id
 d11-20020a5d538b000000b001f1e60b20c2mr13695542wrv.294.1646833283309; 
 Wed, 09 Mar 2022 05:41:23 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 bl20-20020adfe254000000b001f1fa450a3asm2676460wrb.72.2022.03.09.05.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 05:41:22 -0800 (PST)
Message-ID: <09acb08a-7b96-69d0-2fb9-80381e234877@redhat.com>
Date: Wed, 9 Mar 2022 14:41:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 RFC 10/10] drm/fourcc: Add DRM_FORMAT_D[1248]
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <e05254ba67598b3973010a7b6f31dd6b20a66844.1646683502.git.geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <e05254ba67598b3973010a7b6f31dd6b20a66844.1646683502.git.geert@linux-m68k.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> As Rn is light-on-dark, and Cn can be any colors, there are currently
> no fourcc codes to describe dark-on-light displays.
> 
> Introduce fourcc codes for a single-channel dark-on-light frame buffer
> format with two, four, sixteen, or 256 darkness levels.
> 
> As the number of bits per pixel may be less than eight, some of these
> formats rely on proper block handling for the calculation of bits per
> pixel and pitch.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

