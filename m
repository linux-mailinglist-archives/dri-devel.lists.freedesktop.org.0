Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635484F1965
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 18:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430B810E919;
	Mon,  4 Apr 2022 16:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3684710E919
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 16:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649090516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3+kz6I7pZcPAimiB8rQ2Jr3SdDzFgYoJ+V2mHrMniJg=;
 b=cUbIbb3wh7PUXx0ZIVbt4/DFyDwj7GUi2wtHemutmQOA28bdQB/hIdbuzga8gPb3zbBkCi
 HZd69l9tT2i4gWiaSNV9wl+u5low98XydD2emUhC5DY7F09xc/t8DYqklsC5vooJNFFUBl
 MY0IrTXVkiITLacMzbKNFIGPnQ6eSjc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-cmQComNDPAiiHBiPzbFhAA-1; Mon, 04 Apr 2022 12:41:55 -0400
X-MC-Unique: cmQComNDPAiiHBiPzbFhAA-1
Received: by mail-wm1-f69.google.com with SMTP id
 f19-20020a7bcd13000000b0038c01defd5aso5195970wmj.7
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 09:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3+kz6I7pZcPAimiB8rQ2Jr3SdDzFgYoJ+V2mHrMniJg=;
 b=szc/EYjpUdaYTk3K7omsxAoMCt+MwCL45iviPEtF5hcPa6WdpfQKnR0/GZOhklR6Wr
 uhbx+eyqB/PqjlovfJypzGafbVCb8p8+qyoQlxGYFKGzosK+VpnGxAF4dKrKlajreblA
 pR2nODW82s/QvG1wJHa/xs+A4OP5kbHYGD2ArNQ1GKsCWMqQSUEvzIzheANN4Xf7gKIb
 twV46x0VrMjyqT92pKxrBS9OJZnPzRu5R5x3z6wKVHWqaA2sDKq1oxWs/V96kBVH+SA2
 dpyx4NH6S9E4PXs3JVVzGnRnc8ZE5nFBeP6UcUoXZuMccCpd/vPMDaBqZ/nq3rq0ZbGD
 RDjg==
X-Gm-Message-State: AOAM533zqJqqKAsYUdRYX618EHExPEEDWCb2jq440/BEuA1CfPvo2rq6
 8mN49AmnNQ3OztZe6pwINzUcNs2YFlEtOChaaDJnl/7dhl7hp/IjoJcGyaTvtIHE3BqjjF53XZL
 PLrqLBlOeR+VYMOB1cXAQIX21FrL2
X-Received: by 2002:a05:6000:1862:b0:204:e417:9cf8 with SMTP id
 d2-20020a056000186200b00204e4179cf8mr440304wri.593.1649090513078; 
 Mon, 04 Apr 2022 09:41:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzXgci/ibeaKSvR6+nnoR/49t/2UDaGcl0TznmfMjMts0usoK/oXTo+u2Q1uulF0rg7yFs3hA==
X-Received: by 2002:a05:6000:1862:b0:204:e417:9cf8 with SMTP id
 d2-20020a056000186200b00204e4179cf8mr440289wri.593.1649090512856; 
 Mon, 04 Apr 2022 09:41:52 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a05600c4e4d00b0038e44e316c1sm32402wmq.6.2022.04.04.09.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 09:41:52 -0700 (PDT)
Message-ID: <4e53008a-c758-90dd-251e-f1668c52b10b@redhat.com>
Date: Mon, 4 Apr 2022 18:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 4/4] drm: ssd130x: Add support for SINO WEALTH SH1106
To: wens@kernel.org, Javier Martinez Canillas <javier@dowhile0.org>
References: <20220330190846.13997-1-wens@kernel.org>
 <20220330190846.13997-5-wens@kernel.org>
 <CABxcv=nLQdz9bVrfqw1MaKREh0uRBvc4wX14AORETaDJAin-Fw@mail.gmail.com>
 <CAGb2v66P+5Tj7BgUJCayWjB6UZhQ5wSFdX=RcwRqX4bYw3UOBg@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAGb2v66P+5Tj7BgUJCayWjB6UZhQ5wSFdX=RcwRqX4bYw3UOBg@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/4/22 18:35, Chen-Yu Tsai wrote:
> On Fri, Apr 1, 2022 at 6:10 PM Javier Martinez Canillas
> <javier@dowhile0.org> wrote:

[snip]

>>
>> I wonder if we should also list SH1106 in the
>> drivers/gpu/drm/solomon/Kconfig file so people can find it ?
> 
> I can add it to the help text if that helps?
>

No strong opinion really, it was an honest question.
 
> Recently someone mentioned that users are more likely to find drivers
> via compatible strings though. And I believe there's also a tool in-tree
> that finds all drivers given a device tree.
> 

Yeah I guess so. Looking at existing DTS and drivers' device tables is
certainly what I personally do when searching it a device is supported.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

