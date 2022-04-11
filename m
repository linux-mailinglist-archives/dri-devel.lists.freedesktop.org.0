Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC274FBE73
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DAF10E0D8;
	Mon, 11 Apr 2022 14:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1388510E0D8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 14:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649686427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SNHqyoujE1GhBLe1zLEQWUOV0WCvLfbwgxIMJwWNvQ=;
 b=Re5GaDHg8oFq2ZymTB8BH16A1PTmXS6HSyKdHWQPfbLo9+kQroOfbHkMERaZeLGUapNQay
 37f0BOEG/pIhJyu8fbz7pPkna+TcYoKfTJsHSalvqWLVz640nomEsOoVUBDQkW+vJ4i/FU
 OIni3iaMRQXvy22B0E3P0aeq/RopGtM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-c_SCMXxJOdaJYi3fZjQy4Q-1; Mon, 11 Apr 2022 10:13:38 -0400
X-MC-Unique: c_SCMXxJOdaJYi3fZjQy4Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 z16-20020adff1d0000000b001ef7dc78b23so3432329wro.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 07:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0SNHqyoujE1GhBLe1zLEQWUOV0WCvLfbwgxIMJwWNvQ=;
 b=OM8fa3ZyUBS8k0Xp29K+KN1d9BQr9iAnW9mz/4PJqWxiXxqhqqolFHLC7JiU21P9Th
 af517o2G2esURlZltgjr5WksyE/k69xhinUxg9vk7Pft77IWUROOVg0ZCDC0LkGJGIPE
 1H7S2KnOkkrDc+bOSdOC40KjCXyXtAWzhw2aHAR2h9lIY6z7TIvSwJuL0duM/TbX09Qa
 KxdCu16Mr679io9w8OwGIvnZYT3wPpIPeUwxBFdZXduJGxXSEvBuXgqBO/7P8a+kjrBh
 Zhqwuiy6Gxcyq4dhGV4EyK2/7NBKfpx2OtACkTlQAOg6Ayk/c0QnZPifwGVRti43We/j
 nvCQ==
X-Gm-Message-State: AOAM5328+2HCmeAMyAsWIYcXN5fg2FkgOWQRiiuAfp0a9VPrLLAOY8AW
 bt81mfjywKt+LRPd/KoKwcd6vfcwexqwWwaWiNIM1TtyqnQEJWmA8PU9ELzTww+z+23eVa7G3s7
 YoMuCCQTKwRJNU6SRjhuiEd85TGVa
X-Received: by 2002:a1c:721a:0:b0:38e:c24d:7b8d with SMTP id
 n26-20020a1c721a000000b0038ec24d7b8dmr1682792wmc.83.1649686416937; 
 Mon, 11 Apr 2022 07:13:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypN8mGgqi50Hob/p+VhbodRxqFTy9Fb8P7XpksOj9p2Bu5RgSHmeLyVffabHvq+u9lP8hzqA==
X-Received: by 2002:a1c:721a:0:b0:38e:c24d:7b8d with SMTP id
 n26-20020a1c721a000000b0038ec24d7b8dmr1682771wmc.83.1649686416724; 
 Mon, 11 Apr 2022 07:13:36 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 q17-20020adff951000000b00205c1b97ac4sm26117938wrr.20.2022.04.11.07.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 07:13:36 -0700 (PDT)
Message-ID: <5c00d6cf-ab0c-850b-821c-36413d894773@redhat.com>
Date: Mon, 11 Apr 2022 16:13:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/4] dt-bindings: display: ssd1307fb: Add entry for
 SINO WEALTH SH1106
To: Geert Uytterhoeven <geert@linux-m68k.org>, Chen-Yu Tsai <wens@kernel.org>
References: <20220406172956.3953-1-wens@kernel.org>
 <20220406172956.3953-3-wens@kernel.org>
 <CAMuHMdUMc35MrWwbDXvsRNx9qSRf1bACNrhsGpeFcLCETsL4dw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdUMc35MrWwbDXvsRNx9qSRf1bACNrhsGpeFcLCETsL4dw@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 4/11/22 15:35, Geert Uytterhoeven wrote:
> Hi Chen-Yu,

[snip]

>> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
>> @@ -13,6 +13,7 @@ maintainers:
>>  properties:
>>    compatible:
>>      enum:
>> +      - sinowealth,sh1106-i2c
> 
> Please don't introduce new compatible values including the bus type.
> There is no need for that, and this will only lead to more deprecated
> compatible values soon...
> 
> Oops, this is already commit 97a40c23cda5d64a ("dt-bindings:
> display: ssd1307fb: Add entry for SINO WEALTH SH1106") in
> drm-misc/for-linux-next...
> 

Yeah, too late :/ I didn't think it would be controversial at the time.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

