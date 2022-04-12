Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 537904FE0C7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 14:49:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AF910E73C;
	Tue, 12 Apr 2022 12:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 835E910E945
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 12:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649767773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6aZBKTB5BdnestxMdj/07bW+IS1GqohyMIbIwvT48vw=;
 b=WHuZBdrokSJ+Qlz0hzQYsEXGsa7kr2s522yjSMAuwa9qjSOk7wECwxISIreNbPMPfEt8A+
 /wKABg1B8EstxjGv6qWE2QyiprTU5DfC99i9N+k9IdZ7eRdgFzXLDa4KYNYJmfuAARZktJ
 kbXQ1RP5vRpQEa6KlTItzOuLtt9CI7I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-hzklTC9XMXiRVDCEfxVbuQ-1; Tue, 12 Apr 2022 08:49:32 -0400
X-MC-Unique: hzklTC9XMXiRVDCEfxVbuQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 f2-20020a056000036200b00207a14a1f96so1499930wrf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 05:49:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6aZBKTB5BdnestxMdj/07bW+IS1GqohyMIbIwvT48vw=;
 b=BBBDNb195l32VLYY09QoL2Q62d9YwmUUABCV+fccz08Ega1wSO4tLzvuG9UQLa3sJd
 q0m7pOV9EAGvZRo5JMHGJP6UzHugzNSyH05udIDFp++EZL+0sMzAQjvjMNqoUPK0Tp97
 Wir/GGSPhdJREL363s0jnK/y/ySicLmhk1MxHwBQN2rlHrouoiHkVT/GZwwoFNUkihnO
 ooijUrYfDiL0kNe/Sick88cStpq0TDRLTIEq1qT3FYmr31i25tv7ALJ3Am53XG1evvqR
 rw5/1H8l9ZValqHWbxXcXdDfeRf/1cCA9knjjBcN7mW5FiVJsOfRrOLKLFz8bOjyc9Fr
 K/cQ==
X-Gm-Message-State: AOAM532D6TLBMLVFxmfCkMLu8T/9EvDtsDrO2RImBVZyxqcAJVX3t3jr
 vAcN1czYeHVu731keYb04Vu8xu39YcpVX3/20jfHrdXrKIBkAqXQscpZH6GkR+SnJyCkVoYLAVp
 kO6bjcWmUGdveuYQdsCMsmygM4xr5
X-Received: by 2002:a1c:35c2:0:b0:38e:c75d:90a3 with SMTP id
 c185-20020a1c35c2000000b0038ec75d90a3mr3401930wma.98.1649767771389; 
 Tue, 12 Apr 2022 05:49:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygjYoMGC2lgYeBF5Ke4bl1SzKCjpQSFH5jCLjSKYAGIYkoI4H+oTt5pffQRoaBBQWPPpiY7w==
X-Received: by 2002:a1c:35c2:0:b0:38e:c75d:90a3 with SMTP id
 c185-20020a1c35c2000000b0038ec75d90a3mr3401912wma.98.1649767771190; 
 Tue, 12 Apr 2022 05:49:31 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 2-20020a056000154200b00203ee1fd1desm31172443wry.64.2022.04.12.05.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 05:49:30 -0700 (PDT)
Message-ID: <60bfa30c-35d7-7853-5741-b7a1ec9e0441@redhat.com>
Date: Tue, 12 Apr 2022 14:49:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/5] dt-bindings: display: ssd1307fb: Deprecate "-i2c"
 compatible strings
To: wens@kernel.org
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-2-javierm@redhat.com>
 <CAGb2v65CBZp3DZFGX0GMTaQQPYMKJTJMNoU2V5u7MxsLN7ONKQ@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAGb2v65CBZp3DZFGX0GMTaQQPYMKJTJMNoU2V5u7MxsLN7ONKQ@mail.gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Chen-Yu,

On 4/12/22 14:07, Chen-Yu Tsai wrote:
> On Tue, Apr 12, 2022 at 5:12 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:

[snip]

> 
> I think you can just drop this one, since it was just merged and isn't
> part of any release yet. It's not even in -rc.
>

I believe you are correct and we could just drop that one.
 
> ChenYu
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

