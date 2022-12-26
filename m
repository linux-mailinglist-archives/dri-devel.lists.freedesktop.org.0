Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 902FF65640E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 17:43:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D403910E125;
	Mon, 26 Dec 2022 16:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA5110E125
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 16:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672073006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b3pL3cTQ8P+EkZ+tkmmVBasG/BMVwRJB5+rbf28XYV8=;
 b=AUYyDWQ3EJ5h4GzuQwq2YCk7UACUwtODoFVCa/47e+KvB7PLr9lKn3Mw4RbGqNl7iy9wWq
 FX51Dz3SP/YzF4Rl1CwiqD7xP4oYh+zgokhfl2u321VJPiV26k+GrClJG7UOd84mIuMi6c
 GHXLPxnJrkB5+woTqxwtZgnGeXgkfYs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-r4IJK631Msiznyyp3hQp_g-1; Mon, 26 Dec 2022 11:43:25 -0500
X-MC-Unique: r4IJK631Msiznyyp3hQp_g-1
Received: by mail-wm1-f69.google.com with SMTP id
 fl12-20020a05600c0b8c00b003d96f0a7f36so4360406wmb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 08:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b3pL3cTQ8P+EkZ+tkmmVBasG/BMVwRJB5+rbf28XYV8=;
 b=7rm0Zc7qVBzgh6+fpWOdRP8USDtFzKGZYJhBxvT+xCYZn485VshY9ClHcEYm3SgcU0
 p1fXlcd+Bc19nVmTGAzEHB8o1PaxGkbgLdvPRhHeHlLWswTEWywIOcXqU8N4Kc8rnIh8
 NKxq8wACbXVstxW3JQOculJUxDfcg6ofkTob4sxoRDLXQPND0+5eP24VJFiCll9bLhTE
 sx+s6g45VWcu22fypzK8ImuHJktCE2pgxwtXq9kTXKDTqIqz6VQFoh6zhwSbx6lAwrBD
 ApK5A461SEfHQPEnmMc3urSsdy6L7GJZyX15F7lSvrlHBJrI9oNvavVW4UdaMhSQxx+2
 0+ZA==
X-Gm-Message-State: AFqh2kpBS2pJyyjSRtr0iyzlBNHUmh4yCS35y4FAA29IP/3cKTcrgM5M
 AE6YmdCr5VAayZ5GAB6dBiSZ80y4xBq984aQVPi/iv+/6feFkR31jAvVvtgkXNT2gnoSbcu5h/E
 45Y1lM+s//DDzPx4ChjbKOyHipBc8
X-Received: by 2002:a05:600c:3c9f:b0:3d9:6b72:39da with SMTP id
 bg31-20020a05600c3c9f00b003d96b7239damr9865085wmb.11.1672073004304; 
 Mon, 26 Dec 2022 08:43:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt2Ug7UkoT1ikyApNLj7BW9efQKzPgYIf1x/YHJ+c9vwXHxnbqwQplE0ribCCFroDYEk13iyw==
X-Received: by 2002:a05:600c:3c9f:b0:3d9:6b72:39da with SMTP id
 bg31-20020a05600c3c9f00b003d96b7239damr9865071wmb.11.1672073004147; 
 Mon, 26 Dec 2022 08:43:24 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 6-20020a05600c024600b003cfd0bd8c0asm13989526wmj.30.2022.12.26.08.43.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Dec 2022 08:43:23 -0800 (PST)
Message-ID: <3a7c442b-dcdb-0f3c-6a46-ebb921aea074@redhat.com>
Date: Mon, 26 Dec 2022 17:43:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/4] drm: panel: Add Himax HX8394 panel controller
 driver
To: Sam Ravnborg <sam@ravnborg.org>
References: <20221226134909.2822179-1-javierm@redhat.com>
 <20221226134909.2822179-2-javierm@redhat.com> <Y6m4LONOyoPo/+Cv@ravnborg.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <Y6m4LONOyoPo/+Cv@ravnborg.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Robert Mader <robert.mader@posteo.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Fitzhenry <tom@tom-fitzhenry.me.uk>,
 Martijn Braam <martijn@brixit.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 =?UTF-8?Q?Kamil_Trzci=c5=84ski?= <ayufan@ayufan.eu>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

On 12/26/22 16:05, Sam Ravnborg wrote:
> Hi Javier.
> 
> On Mon, Dec 26, 2022 at 02:49:05PM +0100, Javier Martinez Canillas wrote:
>> From: Kamil Trzciński <ayufan@ayufan.eu>
>>
>> The driver is for panels based on the Himax HX8394 controller, such as the
>> HannStar HSD060BHW4 720x1440 TFT LCD panel that uses a MIPI-DSI interface.
>>
>> Signed-off-by: Kamil Trzciński <ayufan@ayufan.eu>
>> Co-developed-by: Ondrej Jirman <megi@xff.cz>
>> Signed-off-by: Ondrej Jirman <megi@xff.cz>
>> Co-developed-by: Javier Martinez Canillas <javierm@redhat.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>

Thanks!
 
> Strictly speaking the binding should be applied before the driver.
>

Indeed. I'll change the order of the patches in the next iteration.

Funny that I added to Documentation/devicetree/bindings/submitting-patches.rst
that info in commit ef0b97e3daea ("Documentation: dt-bindings: Explain order
in patch series"), but didn't follow my own advice :)

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

