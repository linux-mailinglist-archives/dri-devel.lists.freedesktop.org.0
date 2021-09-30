Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DFA41D0AD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 02:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275206EB0E;
	Thu, 30 Sep 2021 00:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6906EB0E
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 00:40:03 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b20so18179406lfv.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 17:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xEzZC82rqk2En9Ed7KsQn1FTg8FAxs/dG3UWgw54VAY=;
 b=O8dP8YX3oMg9WnbDyZu1hmO2h68+60K+lapykwVro5Dm9ppn/F9/NcbISMG5UgjbC1
 Gl65W0faHrgnuG4Ivm1ZPA//iIglFIfYes3pHap406XwsMqh6ze54KPK6G1G3O5UlV3H
 OpAwEnFC47Abzp/TQ4SNOauFELwfHEFZLL20Xt+YDmW+i0BdpaHAE8kOe1R0ZwvSJ88R
 vse5HwrZKesjEBIM+g1FgoFyiPN/TBhtT+YBZZx+rRc0POYrOrKJZ64TomxVC2KqUNKa
 /E+/csDF4DZh2HAhhjUkvllNeyvgxTMBlt9VzUAWKm/iPV4qw7A2k9Nqntk6VvZaM2tE
 WgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xEzZC82rqk2En9Ed7KsQn1FTg8FAxs/dG3UWgw54VAY=;
 b=XUN97InZGz0MkZrqsag2ZLyVBX56vuw8t+xONxD3G71UHEvHy9mmiJE6GAMIIDzLFj
 BVtMDdv46J6V4emLnmoI46kycrJcmqrK9CVmc8n+94kdrts6+LvHm+r9lsfiiSlXyjVB
 cce3zpK5o4ZSBuoOcB/+PO7QWEd6myZlZnleeZyF2pZEfWK8+pWwoBi6XnkSRcfPqX26
 ONAHpocrxmojW1BBGey9bmSO/vrvH3GbVH+6Ddw3cpyM7stArwda3Aqsvux//0Ori4FK
 DuuD7GQeASJV1/n8xSt5iyWxgafsNgFIKVuevs+nFACt6TcVKaTP3jM5SIhNjaET428E
 y42Q==
X-Gm-Message-State: AOAM5318vqvVtdjPnxiV54QzAD88ltiLK34MGLIlWlCMzp7zfKHJh7RX
 l7aYcBZZgFe/+3DgrT7maso=
X-Google-Smtp-Source: ABdhPJwR5F7TvblD+2tTvq+HxgGw1yddafN9WyTWe+FiqhsLFgixz8gInIIfk3R5GKlFeUDsI4kXHw==
X-Received: by 2002:a05:651c:150a:: with SMTP id
 e10mr2955411ljf.287.1632962401591; 
 Wed, 29 Sep 2021 17:40:01 -0700 (PDT)
Received: from [192.168.2.145] (46-138-80-108.dynamic.spd-mgts.ru.
 [46.138.80.108])
 by smtp.googlemail.com with ESMTPSA id l23sm163024ljg.99.2021.09.29.17.40.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 17:40:01 -0700 (PDT)
Subject: Re: [PATCH v13 16/35] usb: chipidea: tegra: Add runtime PM and OPP
 support
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Peter Chen <peter.chen@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
References: <20210926224058.1252-1-digetx@gmail.com>
 <20210926224058.1252-17-digetx@gmail.com>
Message-ID: <e8f778b0-816f-3273-2c46-5d2460545610@gmail.com>
Date: Thu, 30 Sep 2021 03:40:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210926224058.1252-17-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

27.09.2021 01:40, Dmitry Osipenko пишет:
> The Tegra USB controller belongs to the core power domain and we're going
> to enable GENPD support for the core domain. Now USB controller must be
> resumed using runtime PM API in order to initialize the USB power state.
> We already support runtime PM for the CI device, but CI's PM is separated
> from the RPM managed by tegra-usb driver. Add runtime PM and OPP support
> to the driver.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/usb/chipidea/ci_hdrc_tegra.c | 53 ++++++++++++++++++++++++----
>  1 file changed, 46 insertions(+), 7 deletions(-)

Peter Chen, could you please ack this patch? Thanks in advance!
