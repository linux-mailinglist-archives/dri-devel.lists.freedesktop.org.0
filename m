Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8859A4D2F54
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 13:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E7A10E9B2;
	Wed,  9 Mar 2022 12:46:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F182510E9B0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 12:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646830016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oIOQIxDPG94ZGWbVYq8GHTXPCYDThRtLt2a1oXRhNkM=;
 b=ieoN68awhyKQDaxggd33Dk89WeYv366Hsx+i9VK3HBUGwWQV5xMG/mvg9VVFFCGgI6SED0
 PN+soA7eIVmLzKgN/2DigwtFaxwGUnLRoTefOBm2YWVH9MRF+LPp2e3Cowsy9/AwHTfJMv
 0Q/zhYHSEHN24EdSpxPeHzk4hg09gWI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-UYdS2cAjNTGItbpPqWzq8g-1; Wed, 09 Mar 2022 07:46:55 -0500
X-MC-Unique: UYdS2cAjNTGItbpPqWzq8g-1
Received: by mail-wr1-f70.google.com with SMTP id
 z16-20020adff1d0000000b001ef7dc78b23so724516wro.12
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Mar 2022 04:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oIOQIxDPG94ZGWbVYq8GHTXPCYDThRtLt2a1oXRhNkM=;
 b=VDj5ZF2sEiFU9S+sbRZzOOO5iBhWQE8swFMAe0Og9xZSR7PI8TEvEeChe16LY1qH55
 K0z1aBRqavjomjhyDbJ+2zCrwatRvFkImkAlLKuffragM1tfn2XbosqHxgt38ZI6BKI4
 KRWGO9QxJ2nkmQ3FTDdgFIrhl7dFU25qTt01E8EcW1NGbSQkxLmwP/b3ReoQ0OkyOpPZ
 SHDVm9HAagih3m5J4pxJ2U5gKZLEXJUsKPEaD2Pi++R18UtXHe+8Ygg1M9FBnmtCg+t8
 bfmN1NI8kbHlfQBBjx3195VzMqDpXJhF4qmg76uRfU10zdXbCFFdzLqWw6id9DyYvEVE
 8PPg==
X-Gm-Message-State: AOAM532c7amoa4p6GCtZElHjKF3wW9NiMGdQ8MjFfN5l7Ku3dyPfpOmH
 JTrD4a9RjVPAPc2Oul4avR8coFqvBIEVIGglL4mbdV4TZBaEiGJ8nIuTZc1KbPcZx8UD+SQWBT2
 f6hhlwh5Nbt+GHp3JaXy2xnYfPQ8u
X-Received: by 2002:a5d:5986:0:b0:1f1:f971:f02 with SMTP id
 n6-20020a5d5986000000b001f1f9710f02mr10080743wri.578.1646830013675; 
 Wed, 09 Mar 2022 04:46:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYK8FPaxzfg7PUDh96l/6CFuHhsdjJQ1VHODD7GNxUOFUkDD6tWylERnxyi/EG6sZs8v7gEQ==
X-Received: by 2002:a5d:5986:0:b0:1f1:f971:f02 with SMTP id
 n6-20020a5d5986000000b001f1f9710f02mr10080724wri.578.1646830013470; 
 Wed, 09 Mar 2022 04:46:53 -0800 (PST)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a5d5647000000b0020372c969d9sm1673557wrw.29.2022.03.09.04.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Mar 2022 04:46:53 -0800 (PST)
Message-ID: <f6186885-5bcf-01a8-56f5-b87ad0b53e3e@redhat.com>
Date: Wed, 9 Mar 2022 13:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add drm_format_info_bpp() helper
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Helge Deller <deller@gmx.de>
References: <cover.1646683502.git.geert@linux-m68k.org>
 <eab1fe866c0ffd4ac097e66ff48725dd39893105.1646683502.git.geert@linux-m68k.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <eab1fe866c0ffd4ac097e66ff48725dd39893105.1646683502.git.geert@linux-m68k.org>
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

Hello Geert,

On 3/7/22 21:52, Geert Uytterhoeven wrote:
> Add a helper to retrieve the actual number of bits per pixel for a
> plane, taking into account the number of characters and pixels per
> block for tiled formats.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Patch looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

