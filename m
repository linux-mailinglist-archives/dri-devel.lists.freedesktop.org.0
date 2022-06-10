Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD7A546656
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 14:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3772C10EF0E;
	Fri, 10 Jun 2022 12:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D3C10EF86
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 12:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654863230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VjtHIlT7gJ/0dA78qBBDZKArnIxKj9no14NIn18ZcW4=;
 b=BICFvfUrRdhC8siW/Pbcee3YO6/DL2iSBScd4pX09P4cCrFQyhBX1QmtHIKLJF/CbF/HtK
 XRhZ7MVHe2xtyq7kP6+QaeQ/F1VnQ3Ux9KAZWoSyql6+S4nMMN36n0t8h89GHcT84rHSdY
 8gE3rWOs7/HAjJj7Q9TaXqtUsPqR1Pw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-ojHodWXuOJus9XuH7R_r9w-1; Fri, 10 Jun 2022 08:13:36 -0400
X-MC-Unique: ojHodWXuOJus9XuH7R_r9w-1
Received: by mail-wr1-f70.google.com with SMTP id
 e15-20020adfa44f000000b00219ebf65301so197003wra.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 05:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VjtHIlT7gJ/0dA78qBBDZKArnIxKj9no14NIn18ZcW4=;
 b=PgCobmLqd7jl73NpSdw6A5sAaSkKXZAnIPO52y2rf1F1v9l3PMMi+Cz39xKBfWzZQH
 lSxNe4HUM0wFFdBcylmkMnH6smwY3tnRIpo/BWdb5PXjFGxrZH2HQ355llyMLCT3r+ng
 mjyVjdpZByABy4bXJ9qpr2GQt0RrGbAyjoyXzV//U6pSazljFz3jWEMrUAd6vATQWzMA
 cUU4bViRqlnX7k1wVUvr6lLWVCUc6+97qTQvgcPBFXnS+fWiEf1CCbkucsqZLmKnUy/V
 XIGOEofkTTndL1u2RndcsP5BnQPuh7x71ojCBkPkh4Ia/7yzZRpLnovJy5GfTtqSgum7
 1t8w==
X-Gm-Message-State: AOAM532k5EGSKKLsGQ3bIbHlBxVhwYcApA3Ea9uK2m+KJqGRAqLS83Ku
 HLzFBaUoJZfwU2KmPh0EAHCS5Ncd8C7GiBLSc2K1Hpn/Tqb0PnACGItqxYTQUYc2K1ytFlIpZwY
 e9RO0loZrIzdS3gZAv+U7ABXspxyM
X-Received: by 2002:a05:6000:188a:b0:218:e9a8:1321 with SMTP id
 a10-20020a056000188a00b00218e9a81321mr12551076wri.504.1654863215417; 
 Fri, 10 Jun 2022 05:13:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzO4paPz71oXlv08G+Vwdn5pwyUT+0j495DIKuEibJrRPSzv/rKYLB8HphMWOz65ZaCXFVng==
X-Received: by 2002:a05:6000:188a:b0:218:e9a8:1321 with SMTP id
 a10-20020a056000188a00b00218e9a81321mr12551055wri.504.1654863215164; 
 Fri, 10 Jun 2022 05:13:35 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 n11-20020a5d4c4b000000b00219b391c2d2sm6211650wrt.36.2022.06.10.05.13.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 05:13:34 -0700 (PDT)
Message-ID: <0ac368d9-efe6-ab98-a695-292bca8febf8@redhat.com>
Date: Fri, 10 Jun 2022 14:13:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 0/6] Raspberry PI 4 V3D enablement
To: Melissa Wen <mwen@igalia.com>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
 <cadecbfd-e174-eadb-276c-577bb2bf70f2@gmail.com>
 <9aaaaa29-11c0-d494-11dd-0bbf5d384364@redhat.com>
 <20220608155130.w4piz2g3obp7qnx7@mail.igalia.com>
 <40f27e32-720a-2f51-2164-5e152f53443a@redhat.com>
 <20220610110556.63mddbye7vxq6mzb@mail.igalia.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220610110556.63mddbye7vxq6mzb@mail.igalia.com>
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Emma Anholt <emma@anholt.net>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, Peter Robinson <pbrobinson@gmail.com>,
 maxime@cerno.tech, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Melissa,

On 6/10/22 13:05, Melissa Wen wrote:
> On 06/08, Javier Martinez Canillas wrote:

[snip]

> 
> Hi Javier,
> 
> Thanks for waiting a little.
> 
> Stefan guided me to the missing part and I'm okay on this serie.
>

No worries and thanks for the testing.
 
> If there's any r-b missing for drm/v3d, you can add mine:
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> 
> But if you prefer that I applied them, just let me know.
> 

If you can apply them that's even better since you are more involved
with this driver. I was just trying to be helpful and that's why I
volunteered to push, to prevent this effort to get stalled :)

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

