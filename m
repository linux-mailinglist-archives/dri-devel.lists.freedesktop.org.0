Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 158B5618785
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 19:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFEE10E7A4;
	Thu,  3 Nov 2022 18:31:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4016910E7A4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 18:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667500269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=96DwOq7bRZmj3BKNU2gLHyg7G0DUiTS1PVMxGzvJh30=;
 b=HtaaUpn5EIAiH/KzQwpu/weLpQbTY6I4qTiVVGYHve/Wpy7GqLVFgnu6FrdbdexQLIKt6g
 0jRzezpYw/hJJOuONWHDlJxsrSa7tKPr0Cd/b4H3sEYhXcGzPHTsLZxaBNth1LobJIWeJ8
 lR3FLgN4DJ/MVDY5LZm9aJgXru0v/1M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-17-5IfKsZOSOrempac7KUl1_g-1; Thu, 03 Nov 2022 14:31:07 -0400
X-MC-Unique: 5IfKsZOSOrempac7KUl1_g-1
Received: by mail-wm1-f70.google.com with SMTP id
 189-20020a1c02c6000000b003cf8e70c1ecso220999wmc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 11:31:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=96DwOq7bRZmj3BKNU2gLHyg7G0DUiTS1PVMxGzvJh30=;
 b=bglmNVnnRhqvDVrTHFd/WTeDdFb/N3gYF2yojaz99X1ffxdsMlxCjU8/AVPXi32PYc
 HKpaUfQ5/PQb38OW2yaHJs1c7h6EKXd4GLsIO7/oucXEDUU57bd9YjPlo36u8DK9hh2b
 qAiAJ6gyUVeD/XLrS5rWpnntamw4DzlN67iOBENTnQOaOyZ3qwvjTFQ9ZU4D2uNOTH2w
 X+m/zIs5M88w304PzztodMNd1lLeupmPKeZx9ESXTCB7kElTezZcQhPvBK5Ij91+mva/
 YFwHR2OT8t5lg9AOowLkgWFSB8OrYnuMc88baa/I385F0mL4Bk0l6cVgdnVddvrabSxT
 dNwA==
X-Gm-Message-State: ACrzQf3I0IUVbDZ4118td6rkGajFMzdILJZ3HM0fprsX7qbQ99NrZEK4
 v1kDhsb1T3sQ6Aeu55mLtBmbsVR5qx3izCnO8+zUFipxQzR0KNDdA4JJL/U1Ft6gi8K8CrBOrtF
 iBWkx+rzZqyMRhthvTL+JtyTZpSN7
X-Received: by 2002:a05:600c:314f:b0:3c6:f3fa:cfec with SMTP id
 h15-20020a05600c314f00b003c6f3facfecmr30397336wmo.68.1667500266792; 
 Thu, 03 Nov 2022 11:31:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM743biIUOhZ1cFkZY+y9Lx/XeNUQXdC75sHCosLEhgjYu6ofOamZkBxiiogbiBHGP4vmIMSiA==
X-Received: by 2002:a05:600c:314f:b0:3c6:f3fa:cfec with SMTP id
 h15-20020a05600c314f00b003c6f3facfecmr30397319wmo.68.1667500266585; 
 Thu, 03 Nov 2022 11:31:06 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d4-20020adff2c4000000b002366b17ca8bsm1665923wrp.108.2022.11.03.11.31.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 11:31:06 -0700 (PDT)
Message-ID: <c8c7baad-e8ce-7683-933a-1d5f98f9c843@redhat.com>
Date: Thu, 3 Nov 2022 19:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] drm: rcar_du: DRM_RCAR_DU optionally depends on
 RCAR_MIPI_DSI
To: Randy Dunlap <rdunlap@infradead.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org
References: <20221018181828.19528-1-rdunlap@infradead.org>
 <a68a24a0-eda3-8711-21c1-334289eca0d3@infradead.org>
 <166747314442.3962897.9754510086268412956@Monstersaurus>
 <c9064cc6-2a9d-1094-53fb-cf56f9cbf191@redhat.com>
 <f5a46aef-780e-6fec-85b4-82549fb7a7a1@infradead.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <f5a46aef-780e-6fec-85b4-82549fb7a7a1@infradead.org>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/3/22 17:26, Randy Dunlap wrote:

[...]

>>
>> Randy, I think that it's more idiomatic though to it express as following:
>>
>> depends on DRM_RCAR_MIPI_DSI || !DRM_RCAR_MIPI_DSI
> 
> I count just over 200 of each idiom (but my grep strings could be
> too crude). I guess that you want a v2 with that change?
> 

I believe Kieran was happy with either so no objections from
me. I don't have a strong opinion, I just thought the latter
was more idiomatic but you said that both are used alike.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

