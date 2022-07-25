Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 660DB580116
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 17:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EF8BEE48;
	Mon, 25 Jul 2022 15:01:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E6BBEE48
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658761311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YMJ3dMyeClA7T1IRb5CW0ZjxCjegVkQvHSqSlepN3vU=;
 b=PIwJktPK8I2bfJU2zdtTUE+iFGoBrCoqHjVof7b5WLQS2o88sDcTbYm6oC8bNtJ0jkoedC
 EdxhPquA4BYCxWRKryups8gwDrWXbGIceNJX0rQaSl15lfGkd2HFAxhbO2IP+4QOrOnI2A
 gvzOSGtD3hh1iOFscQ+KjmszFTbdfqM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-1S0yJHQKOaCtzT787xe3vA-1; Mon, 25 Jul 2022 11:01:46 -0400
X-MC-Unique: 1S0yJHQKOaCtzT787xe3vA-1
Received: by mail-wm1-f70.google.com with SMTP id
 v132-20020a1cac8a000000b003a34081050bso5358592wme.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 08:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YMJ3dMyeClA7T1IRb5CW0ZjxCjegVkQvHSqSlepN3vU=;
 b=vA1gMUD+LIV9gcuUV0doInGvdZp2a1UD9foKxtSwk2xGHMlZKLP+T4E8OUTIJbUqO2
 CfCxmCTg2SrJkzFsZmhv6k1cwhHR/bEfvwSv0l+YNCfMXnS8JppLWxoUFfC2ETwLm4Gx
 MoUK+ABWbnd9MJGqZhss6wLP6PoTXlGyaQDhwoPL0BhHkRR7VhJbTLvyDG4faVD5nrnW
 VJPS2mn0EuHqD+IYsTMG/djaeYVZzTzIEkCc0kRTTbsMEinyeuCqx9au5G5IvOqvKVI6
 S1KUTTTHdgIFHsKoOPgxl4qdGQl+XbkzMrCdeX4Ef0w32fOHqlJqQooPkna/ggR9yj5w
 BFzA==
X-Gm-Message-State: AJIora8M6WdCBo0rVXgQtSX2xivsKnUhGGE/xv0PbvlF4tXu+CjLTyv3
 OmTPM2pXer1rmIfguluWBaTiGGSLSjqrCXib5suGxbyOvXelvmLUU1021bNRvjG3J3N+lDv7Dri
 Tla99jTafSYDVHG+BhzuIH+9EiUNw
X-Received: by 2002:a5d:5985:0:b0:21d:b6aa:23f5 with SMTP id
 n5-20020a5d5985000000b0021db6aa23f5mr8277803wri.18.1658761305125; 
 Mon, 25 Jul 2022 08:01:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tFnKmBtGWNNcqpR9Ctds3NAzTME43FarpXlgIYicodYE1RPI8Rj39v9krNqGxZ31mHPqpG6A==
X-Received: by 2002:a5d:5985:0:b0:21d:b6aa:23f5 with SMTP id
 n5-20020a5d5985000000b0021db6aa23f5mr8277777wri.18.1658761304776; 
 Mon, 25 Jul 2022 08:01:44 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w1-20020a5d5441000000b0021e493ff810sm12510792wrv.49.2022.07.25.08.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 08:01:44 -0700 (PDT)
Message-ID: <be24a47c-c41a-411a-da63-c699b53cb459@redhat.com>
Date: Mon, 25 Jul 2022 17:01:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/10] drm/simpledrm: Inline device-init helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220720142732.32041-3-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 7/20/22 16:27, Thomas Zimmermann wrote:
> Inline the helpers for initializing the hardware FB, the memory
> management and the modesetting into the device-creation function.
> No functional changes.
>

Could you please elaborate in the commit message why this change is
desirable?  Without this additional context, this feels like going
backwards, since you are dropping few helpers that have quite self
contained code and making simpledrm_device_create() much larger.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

