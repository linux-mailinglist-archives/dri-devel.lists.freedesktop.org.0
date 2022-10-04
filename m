Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DBF5F4C4F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 00:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068F710E146;
	Tue,  4 Oct 2022 22:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD27410E146
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Oct 2022 22:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664924363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxsHGOwWFgsgEwiulhhhbB3ByGLDt5P6KbUmTZAsR4E=;
 b=eespwzCkV1rLc8BVo+oif7C3oIwXzobPPmvez/FxlLa1VuAaJ/i+wywio2j/8c0+Z8CZDt
 AtI51kzRaX4IDdhIJ3oWWrCXdXhSQSpxgv12+vI0BGwxO28YFcKMRfr87+V0FVmGFV9uwk
 /vPoxfaecug2PkVwCZJYBksfxV1Twi4=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-Mf7NOEbDMU22iqrJU9Weog-1; Tue, 04 Oct 2022 18:59:20 -0400
X-MC-Unique: Mf7NOEbDMU22iqrJU9Weog-1
Received: by mail-io1-f71.google.com with SMTP id
 f25-20020a5d8799000000b006a44e33ddb6so9923546ion.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Oct 2022 15:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=SxsHGOwWFgsgEwiulhhhbB3ByGLDt5P6KbUmTZAsR4E=;
 b=P98rDhI62qEvp9jxE1tUnBGhBhAV/dgds1Fpbn3OejtwWn5Ok+kUoPHdFnLe5WWQve
 ZJV/f/6zuxawrDUdwjO1GGdqZQV3gkuzJBjTQl2NSuNi2e357BS9FW0/jXv9OsnSn8XC
 JOXScyfSRb9Jp/i00DUwhXW+ucZ1uuS4fCnDKOWBO9hWTGNjNbxoVBq5qC/jQHfMDyXt
 wi2xiSnvWEDsIbO3az8g6rh8wr4dVCHSn0/6jvFO+jmn+v9Gkr8b/ofVuizgRNtZUceV
 0QLNMQbg2bnAwvY7uk+e7Stf0PMqUSiUBDUdjgMaiqwxP/Dj8C5UnYXxwMCWKL0882wt
 QKlQ==
X-Gm-Message-State: ACrzQf3S/thVOoDl6Y19M1f9pNgVUDHGHPPI5t7LpuHfMrPx8g0XufsV
 ZCpNK9T7VaKJqDsYneDb8wGuwyaDwF3uqQ09B3qrracIVWrdQDnZuKwtjmzH3gnUtFc+GLhdqLC
 sdIJHjfQUVnofDoqXlnETIeJu7/Bf
X-Received: by 2002:a05:6602:1609:b0:6a1:899e:bf36 with SMTP id
 x9-20020a056602160900b006a1899ebf36mr11692577iow.121.1664924359208; 
 Tue, 04 Oct 2022 15:59:19 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5OzCZpFCwc7XvZEthAd+76IU03cxcHI6YKa8ZkbhJ2M3Jodz1djE+c0xiMlH3o8yeYd1ORgg==
X-Received: by 2002:a05:6602:1609:b0:6a1:899e:bf36 with SMTP id
 x9-20020a056602160900b006a1899ebf36mr11692571iow.121.1664924359050; 
 Tue, 04 Oct 2022 15:59:19 -0700 (PDT)
Received: from [10.56.18.1] ([140.209.96.0]) by smtp.gmail.com with ESMTPSA id
 y12-20020a056638228c00b003620e89b4c2sm1835176jas.11.2022.10.04.15.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 15:59:18 -0700 (PDT)
Message-ID: <994ea685-be4f-ae0a-a8c6-3c664d9eff54@redhat.com>
Date: Wed, 5 Oct 2022 00:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 15/16] drm/udl: Add register constants for framebuffer
 scanout addresses
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-16-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220919130408.21486-16-tzimmermann@suse.de>
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

On 9/19/22 15:04, Thomas Zimmermann wrote:
> Add register constants for the framebuffer scanout addresses and
> update the related helper functions. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

[...]

> +	u8 reg20 = (base & 0xff0000) >> 16;
> +	u8 reg21 = (base & 0x00ff00) >> 8;
> +	u8 reg22 = (base & 0x0000ff);
> +

Maybe would be cleaner to use the FIELD_PREP() and GENMASK() macros instead ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

