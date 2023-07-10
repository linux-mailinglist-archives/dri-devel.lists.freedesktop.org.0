Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E17BF74D561
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 14:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F8410E159;
	Mon, 10 Jul 2023 12:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227C710E159
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 12:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688992089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qvML2ZTbSvNa76WH3v+ED/1x/GpVFa6SlPl50qQBVD4=;
 b=PfBQ7CcSmcCpU5K9qXNK5cSmBrpyO/wMKBVaK8KvmjKkr7+YVx314RGGspNpuMZ1vDXjHU
 SMxcdbYA8yfwRsSJAJFJEjONo93x4tyA3nyBljBnyHlf6OIqn8BhNsXBJVpxpHgizee0cQ
 uSV2VGa9Vf+5ICg34I0nnpoxHbQ50SE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-MtxM2pWlNzyrQ0wAT0F4lA-1; Mon, 10 Jul 2023 08:24:28 -0400
X-MC-Unique: MtxM2pWlNzyrQ0wAT0F4lA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31273e0507dso2814740f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 05:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688991867; x=1691583867;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qvML2ZTbSvNa76WH3v+ED/1x/GpVFa6SlPl50qQBVD4=;
 b=jkTmf2o7jW2l+nQZmTFUleKV03epGLqZ9VTFkaTzUaGvY/+A9O7gc3fGu/9f3SyUhX
 xPZSu/j42Gxu4oyvg0EgC7CFEizdjij9+bSTRCYr9NCkCBXVGEelPodu1fqXgbax0rbx
 hTqKO+S2yIAtDLbp7yUxnz9f7ulXoAjvWJ3vCkaIpGBibT8cIR+EjV1WtNQj5EOA4YPU
 OBfazNjVGaoGc28/riqTTr6o7WjinS6j/Xj7YgdAG+7EljsHhbS40ZIq7OYHe7P32HTU
 nYlmPo8Y5cSlDXU1bmyesR4OezyW+lnQakpZPqrau7TPyz9S6K3r3NsLN/t5oxRcE1z9
 e81w==
X-Gm-Message-State: ABy/qLbvQud/x+F8EDM1r/2AbDxHPCZvQbSOUQQtoiS1qZlCjaDr8RMM
 mltu+FWd3mz1te33hF+qUpSvudXJh+6Z7i6pteGuVEyBUtGPrWDYSlAC5COTBhxLoUSrDtLAUZY
 JBttPNTx0Tb9Fcdlw/O1QgiEWZpef
X-Received: by 2002:a5d:6992:0:b0:313:f4e2:901d with SMTP id
 g18-20020a5d6992000000b00313f4e2901dmr11318653wru.22.1688991867030; 
 Mon, 10 Jul 2023 05:24:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGCfHIfxXiWxsjzpJqDBImSNlKwiDDmZPDNf+ZmkYEr3xDoS7La+lATpQqDI1yIxm7fr9+CSg==
X-Received: by 2002:a5d:6992:0:b0:313:f4e2:901d with SMTP id
 g18-20020a5d6992000000b00313f4e2901dmr11318632wru.22.1688991866762; 
 Mon, 10 Jul 2023 05:24:26 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f17-20020adfe911000000b0031416362e23sm11618363wrm.3.2023.07.10.05.24.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jul 2023 05:24:26 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 neil.armstrong@linaro.org, Aradhya Bhatia <a-bhatia1@ti.com>, Jyri Sarha
 <jyri.sarha@iki.fi>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Swapnil Jakhade <sjakhade@cadence.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Francesco Dolcini
 <francesco@dolcini.it>
Subject: Re: [PATCH v7 0/8] drm/tidss: Use new connector model for tidss
In-Reply-To: <be2c4c02-43bc-5b16-2162-b8ace8d34996@ideasonboard.com>
References: <20230606082142.23760-1-a-bhatia1@ti.com>
 <1f284e9d-5a1e-9fca-ceb0-478a413ae4ef@linaro.org>
 <1b31f36c-b1ba-43b5-9285-0f50384a78cf@ti.com>
 <42151d11-12d9-c165-0d4b-a0af80b683c3@linaro.org>
 <be2c4c02-43bc-5b16-2162-b8ace8d34996@ideasonboard.com>
Date: Mon, 10 Jul 2023 14:24:25 +0200
Message-ID: <87bkgkhs3q.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
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
Cc: Nishanth Menon <nm@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> writes:

Hello Tomi and Neil,

> On 06/06/2023 12:48, neil.armstrong@linaro.org wrote:
>> On 06/06/2023 11:46, Aradhya Bhatia wrote:
>>> Hi Neil,
>>>
>>> Thank you for reviewing the previous patches!
>>>
>>> On 06-Jun-23 14:37, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 06/06/2023 10:21, Aradhya Bhatia wrote:
>>>>> Hi all,
>>>>>
>>>>> I have picked up this long standing series from Nikhil Devshatwar[1].
>>>>>
>>>>> This series moves the tidss to using new connectoe model, where the SoC
>>>>> driver (tidss) creates the connector and all the bridges are attached
>>>>> with the flag DRM_BRIDGE_ATTACH_NO_CONNECTOR. It also now creates 
>>>>> bridge
>>>>> to support format negotiation and and 'simple' encoder to expose it to
>>>>> the userspace.
>>>>>
>>>>> Since the bridges do not create the connector, the bus_format and
>>>>> bus_flag is set via atomic hooks.
>>>>>
>>>>> Support format negotiations in the tfp410, sii902x and mhdp-8546 bridge
>>>>> drivers as a first step before moving the connector model.
>>>>>
>>>>> These patches were tested on AM625-SK EVM, AM625 SoC based BeaglePlay,
>>>>> and J721E-SK. Display support for AM625 SoC has not been added upstream
>>>>> and is a WIP. To test this series on AM625 based platforms, basic
>>>>> display support patches, (for driver + devicetree), can be found in
>>>>> the "next_AttachNoConn-v2" branch on my github fork[2].
>>>>
>>>> I can apply all bridge patches right now so only the tidss change 
>>>> remain,
>>>> is that ok for you ?
>>>>
>>>
>>> While the bridge patches and the tidss patch can be separately built
>>> without any issue, the tidss functionality will break if only the bridge
>>> patches get picked up, and not the tidss.
>>>
>>> Would it be possible for you to pick all the patches together once Tomi
>>> acks the tidss patch?
>> 
>> Sure
>
> I think this looks fine. For the series:
>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>

It seems this series fell through the cracks? Since you both already
reviewed the patches, I've just pushed all the set to drm-misc-next.

Thanks all!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

