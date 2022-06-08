Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC6354302A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB0210E8F8;
	Wed,  8 Jun 2022 12:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DABA10E8F8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654690999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WysPZlcw09T7q+C1fUqR9rq1Bzu/+VYftlOBGYd++mc=;
 b=cGae2+wANtVL7pIELQJjbIEioJ8aUZz+pY4S4rpKOONeAR+/H78gBhptKf+iziMVzha3kc
 gnxBxhvBrE3zInreOY3eKDTpRXZ7pqhPt8pNU47JLRqwG6vp7Sbsu59Em9or96yyQmktP1
 +Snl4dus5i26Pe1FBLGx7M86nyBZ/3w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-di-g4QigOyafGdxofKHDMw-1; Wed, 08 Jun 2022 08:23:18 -0400
X-MC-Unique: di-g4QigOyafGdxofKHDMw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h2-20020adfe982000000b002102da95c71so4750412wrm.23
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WysPZlcw09T7q+C1fUqR9rq1Bzu/+VYftlOBGYd++mc=;
 b=m6dyIkpoHm8dYjfppRcZW7at0x2cFdQ6TaibN53rrYQYc2mMDUdeZ31adnvKTzLpGU
 ArQoeHrMpFTkTnxULDDjXTcSvxLXsHgKDz0IU9Nv5My40rE5eT2JQ2NVRU9T0H4F1Bg8
 XwjLOzzOcOzPei/b6WIE7v3ZrCMHYba4uSd1wND40SJwXfRft3HVM5wyN9DSszypfdeF
 CxDaIZrvQ+pZ2z2qZTlKjzp7hsIOfwTqAkM/YheGmWdz8zP8iAcjOoSY+7t4JxFlq39k
 vZbhz0Z2SHYgiuTCw8e6A30krB5pzy8apwPgjMQS/6BZhQI2xzkAXFPczIsKNo80JOW5
 cxbQ==
X-Gm-Message-State: AOAM533XC5V+PmjSbmzwXMECh9/3Ixw+/RN9iCBkPIwRXoT8qpiAX5vh
 BBhLDNPl+pXy72U3Jh1MtHwq6Sp/hHZIVhmwL/zVsj9N+hXQfAEZe5qLY3V4J/Whz7ZtpbTcPlX
 hl9HhO5K2i5TMtiSODWFZmMmVxCW3
X-Received: by 2002:adf:f38f:0:b0:210:30cf:6e4a with SMTP id
 m15-20020adff38f000000b0021030cf6e4amr34276132wro.676.1654690996873; 
 Wed, 08 Jun 2022 05:23:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnn0twO0DVIW7IZ6/4N32WijMPurWbHo+V8aC9+pPIdJveu5UOwQ9M/8i7btwDkro790RfwA==
X-Received: by 2002:adf:f38f:0:b0:210:30cf:6e4a with SMTP id
 m15-20020adff38f000000b0021030cf6e4amr34276097wro.676.1654690996523; 
 Wed, 08 Jun 2022 05:23:16 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o10-20020adfeaca000000b0020c5253d8c2sm20778215wrn.14.2022.06.08.05.23.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 05:23:16 -0700 (PDT)
Message-ID: <9aaaaa29-11c0-d494-11dd-0bbf5d384364@redhat.com>
Date: Wed, 8 Jun 2022 14:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 0/6] Raspberry PI 4 V3D enablement
To: Florian Fainelli <f.fainelli@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 bcm-kernel-feedback-list@broadcom.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
 <cadecbfd-e174-eadb-276c-577bb2bf70f2@gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <cadecbfd-e174-eadb-276c-577bb2bf70f2@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Florian,

On 6/8/22 11:26, Florian Fainelli wrote:
> 
> 
> On 6/3/2022 11:26 AM, Peter Robinson wrote:
>> This is a follow up from my v4 patchset. The power management pieces have
>> been split out to a separate independent set of patches by Stefan [1]. This
>> version 5 of the DRM patches are independent and given the V3D driver has
>> been upstream for some time the two patches to enable it in defconfigs can
>> be taken at anytime independent of the enablement for the Raspberry Pi 4.
>>
>> I've tested this using mesa 22.0.x and Wayland/Gnome on Fedora 36, it's
>> more or less stable with basic testing.
>>
>> Changes since v5:
>> - Update the DT compatible to match the others that were updated
>> - Adjust the Kconfig help text
>> - Add review tags
>>
>> Changes since v4:
>> - Fixes for device tree and bindings
>> - Split out the power management changes into an independent set
>> - Rebase to 5.18
>> - Individual changes in patches
>>
>> [1] https://www.spinics.net/lists/arm-kernel/msg980342.html
> 
> I can take the last 3 patches through the Broadcom ARM SoC pull request, 
> but the first three should probably go via the DRM tree unless you want 
> me to merge them all?

I can merge the first 3 patches through the drm-misc tree. Can I get
an ack from you for those ?

The changes are independent so there's no need for an immutable branch
or any kind of cross tree coordination.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

