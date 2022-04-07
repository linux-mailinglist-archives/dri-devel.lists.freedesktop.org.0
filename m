Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BAD4F8099
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 15:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6307F10EB2D;
	Thu,  7 Apr 2022 13:32:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF96B10EB2D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 13:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649338323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uPtIuQonBGwymnNwuL2Ges4RPYjT2KSIo8bqHMyXzDQ=;
 b=b0LvCAWTjEoZ/FBjSWOm/6/flesCw/JYWo/MDSvJoOhqcQPjfnA4xK+JvUtDc4xB3kPVDz
 nTzicusaILlJYOYjd6mCrfLfwxl2VO8LBO+uRxtcFzlGM7VejPnwzkrInPUmJSxStOvKBi
 GNzmg4bylaecQHzPR+csITcQK2oRCZY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-ZkYNzWMbP3GvT0JWg5_iKg-1; Thu, 07 Apr 2022 09:32:02 -0400
X-MC-Unique: ZkYNzWMbP3GvT0JWg5_iKg-1
Received: by mail-wr1-f71.google.com with SMTP id
 v30-20020adfa1de000000b002060d11eb63so1284359wrv.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 06:32:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uPtIuQonBGwymnNwuL2Ges4RPYjT2KSIo8bqHMyXzDQ=;
 b=MRd40W0io3keS1guDEce6aEVWYpBb2Kk5ynBQnw5DuP/AAqQXkxQYaqZc0gjoVHELJ
 1IB0InlMQEG/hXp7YcHV0z14Rkl1luy43t5dHsQffOZHjjHMUyI4EOQee2CcFzPbitds
 j20hT2dZLkPBUtDeiuxNQvgR4bW2TFV6/XyVVgUD68I/Ok5PnSlwxY/efWDIrbjle9jZ
 RlBipCKl7FN40OK3YHhjV8PboQAMdQIsKZijzoCCeW1op7bMGDgNbwSljKWT+qUKywjE
 lyVkkFDLNFzPdJ+lzgtOQ7+cFKl9DTL0p7gQ46/ENYJEj3Vnx4NekcTnlONVv+UNtPsR
 FOtg==
X-Gm-Message-State: AOAM533qjw7ucLYjXichOJeprGvggoKkbzNd3BcC5iRuBuru2dU82Rws
 9bSu4obPwfmE3RAPH19JxwkijI8bSDmVXOMHeSj0N5yVJww2YMYDqAMZkdYrxYVRnpNT4B5Vpe1
 WRY9IIq57zoHbnB5QJu0i4c7bWpTN
X-Received: by 2002:adf:fc0a:0:b0:203:ee19:b4a5 with SMTP id
 i10-20020adffc0a000000b00203ee19b4a5mr11050324wrr.245.1649338321460; 
 Thu, 07 Apr 2022 06:32:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIiQ+5xue+z1JVVIJQbIbMurwPI2LslRTj03Pq11FoaMHInXgHKbMu3ttUyBaxmGnDE0T1Kw==
X-Received: by 2002:adf:fc0a:0:b0:203:ee19:b4a5 with SMTP id
 i10-20020adffc0a000000b00203ee19b4a5mr11050303wrr.245.1649338321273; 
 Thu, 07 Apr 2022 06:32:01 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a5d6d0e000000b002078ea4f6bdsm442054wrq.75.2022.04.07.06.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 06:32:00 -0700 (PDT)
Message-ID: <fe352f3f-5a86-8080-fa87-6298d9289b6e@redhat.com>
Date: Thu, 7 Apr 2022 15:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 0/4] drm/ssd130x: Add support for SINO WEALTH SH1106
To: Chen-Yu Tsai <wens@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220406172956.3953-1-wens@kernel.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220406172956.3953-1-wens@kernel.org>
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/6/22 19:29, Chen-Yu Tsai wrote:

Pushed this series to drm-misc (drm-misc-next), thanks again for your patches!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

