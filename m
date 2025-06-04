Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F62ACDCC4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 13:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BA710E728;
	Wed,  4 Jun 2025 11:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Cn41GxCh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C46BD10E67B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749037076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8yGTTsgiDWY8J2g+V2j1fiTS+GMay2l9LmYid1VFYpE=;
 b=Cn41GxChIw7KHk+fedDSEY3pX7knkRH1PK4ffXvLYZXl4m9NewrIID2Fn1eGpQ//tynI+c
 1WMseoOcUqghSJbz9sqmGduNjZBwt6mSxAE8fgstuS0Uze9/mSV6ygSBXHwHuZcZw70KLy
 p0aCTARUChluJTTfFiWBZQHXERMib+4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-Oid339CnOWmmV6yaw5VL7w-1; Wed, 04 Jun 2025 07:37:52 -0400
X-MC-Unique: Oid339CnOWmmV6yaw5VL7w-1
X-Mimecast-MFC-AGG-ID: Oid339CnOWmmV6yaw5VL7w_1749037071
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4e6d426b1so426433f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 04:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749037071; x=1749641871;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8yGTTsgiDWY8J2g+V2j1fiTS+GMay2l9LmYid1VFYpE=;
 b=PPDSgra8mWeiskCdu9R/YQCXcrSkw4VBaBGXuv9sbCJK1glbchlw+NyjKBsjLRDCUW
 0ltvRX4NuMDsAJ4ivc92memPWC03MWos/3biTAv0pvTZpncW8+i1ZySKqxFiH/ZHBDXU
 Aw0jzvkS3P79xMmZ1w0Ur6I14ElOe1nb+bjjtUTCHjhOGbQwoR+bBdrOpvJMjOpn/mM7
 a8vwRCe+qgP/KZT4bAlRrzn8dlNNfq86vESGZU8scIZntUh/++az5IarOktOeN3bdKFi
 mXAGJmCmmKGmUfdDndm66SeaT4bGkqCRielnSCMj82FYhHuhQQFLM8bz1v0Qu8KXwMhJ
 Ei6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDpTemRprL5NTAH/xEtduUdDG74qN6aLoEQo3t6z5x+6e2g4oDfVgdgAhhFneO56R6OsFfZTtAbIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9eBaIwoAmO6CiDevS22VgpVSOO4WeN1iIqZGkXDL834d3RSgY
 QHjI+UAP32GgiUa2CH1stkfRyIcg82jorfDyrIFifKeZMyF4d3yESMTLKu1rdlpb8RaxHIXeN/o
 rhsKd+YFVi7xEI8Mputa11JxeAVbCdPoTT5kmUmHfVTOAvyTq532V5FSEyx1qe7XyQdQTPg==
X-Gm-Gg: ASbGncvqQrzDK+RpFmax+s3WxgTzCPuGXvwcICEkN/ASq3lrTWGAYnWMOi/7j5aMkEK
 faYg+1N7JTV1OUg5IdauCCVxkLWKIA2LZIeBjXrTu0oMTkYO8zPRRQQWRfZw/9ehD7gLiSGpsuB
 PWpUU2vqWKFHVsEeo83dP9vklW9wrthkJyN9vQZmPu3vQcvZuo6Vi60vosqbZwdZQGGJ8gBYjgk
 HjV1O4XMjs8X0ylPq1Z/jDpKi3FgbluuezNKHakAkr+sZaE+wKrvyAAXsUCwQ+K6GUoqMdT85tq
 y60KLMWwfkyofxUPhAPDU6a6BfIFdVVPoiWN1khHUSiADeALlBlI4DbXhbOegcfa4ThDzGFGHmK
 UfDy+
X-Received: by 2002:a05:6000:2204:b0:3a4:e624:4ec9 with SMTP id
 ffacd0b85a97d-3a51d507a12mr2123880f8f.3.1749037071498; 
 Wed, 04 Jun 2025 04:37:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv9JPJbgrjB229TymXofASXM6iZs/ATYKLOE2MEqqHr8KFbOvdQ2US8CPOluWqVOJ3OvEbgQ==
X-Received: by 2002:a05:6000:2204:b0:3a4:e624:4ec9 with SMTP id
 ffacd0b85a97d-3a51d507a12mr2123854f8f.3.1749037071124; 
 Wed, 04 Jun 2025 04:37:51 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f009748fsm21172908f8f.80.2025.06.04.04.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 04:37:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 sebastian.reichel@collabora.com, heiko@sntech.de, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, quic_jesszhan@quicinc.com, neil.armstrong@linaro.org,
 megi@xff.cz, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: Add DSI panel support for
 gameforce-ace
In-Reply-To: <20250603193930.323607-5-macroalpha82@gmail.com>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
 <20250603193930.323607-5-macroalpha82@gmail.com>
Date: Wed, 04 Jun 2025 13:37:49 +0200
Message-ID: <875xhbagaa.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZZqY-_E7VWrqXcKeJ_Wj4GNfc7gHHfXje07IjcUqyAs_1749037071
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Chris Morgan <macroalpha82@gmail.com> writes:

> From: Chris Morgan <macromorgan@hotmail.com>
>
> Enable the DSI controller, DSI DCPHY, and Huiling hl055fhav028c
> 1080x1920 panel for the Gameforce Ace.
>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

