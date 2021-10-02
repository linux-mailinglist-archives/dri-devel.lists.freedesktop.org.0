Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 020ED41F8FA
	for <lists+dri-devel@lfdr.de>; Sat,  2 Oct 2021 03:09:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0121F6E819;
	Sat,  2 Oct 2021 01:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74B06E821
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 01:09:11 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id g41so44839676lfv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 18:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QJi5dnZCRKyuIr330IEjUyQqWCQ+hUanK7f88GGsu9Y=;
 b=nFHh7xfeu3FDgfUVmmY7kwwhhlAStH/ZjAG7GcUikKfIqKSAUt8ypN75c+TWlVlGx7
 9hvUnWWt4W4QtbuOZpa4cav8jbDq8bMTzwJg3fjNlZC0LJPShuHZfVdR8O9Lw+OoJwpg
 IDbDajtOhCaK1OJRoscZkI15jZcmKN4dJZM8gD+4JPDLjVrJMxZO5NEf8SYyBk7c2yq3
 R4ZCVuHd1KMJilEloga5g/IzGElbkf3QCSWo0SLNqdoK/mzVYQXKN2VoMB7Pt+XZ/asi
 f9Kcv1TmPCxa2ENHfVxpaju+164xC38UZjrUFDSPvq0DluzEM0x4aBpUE5eA/Ki8swEL
 pLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QJi5dnZCRKyuIr330IEjUyQqWCQ+hUanK7f88GGsu9Y=;
 b=gwsHHZBEibOP+ewSoJN7cX25YN548nLvblRGDuhfKVlExPi6D9VRgxU+/2aQZCCSJj
 RGO416BHg/p7gmB2ptC+zfP1TI2yADo3mofaHo6Hz158wGgo/AZ7+bzNQ03AzKRcaq4s
 x3nFarBdpgXuzSfVzBdqEtyxM6J2kr9KebgReZbSvReISXMwUq4kYrhrEedqDBwclkGR
 lD4lM27jN4nTPgKzH+pp3IW7zz9/L0s5lt8J1n31HLStpz6+iWpn93mzjTr3NE/9dPdy
 jitbFEIX7dG+Qvlw/rsptRif6xcP2zh/fOqZ9liDFtk9BLfby7wbQc1LTNFd/XP/sHEx
 BBJw==
X-Gm-Message-State: AOAM533XtHU/V1aWfHxE1n5BfS5Zelc6EYaJtd3u4GjjDPp4j2+Dhufr
 fksjXnEOjhsBV8U0cCV7JuILJQ==
X-Google-Smtp-Source: ABdhPJwxzP+S3xwprLe/RPXXMzTtfSmSOF8004b+WHO3RmXKN3BGThk4h2PUn2QcZOVxPlyH+VLdBg==
X-Received: by 2002:a05:6512:31c6:: with SMTP id
 j6mr1183238lfe.436.1633136950279; 
 Fri, 01 Oct 2021 18:09:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t10sm280248lfq.251.2021.10.01.18.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 18:09:09 -0700 (PDT)
Subject: Re: [PATCH 1/3] mfd: qcom-pm8xxx: switch away from using chained IRQ
 handlers
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20211002010814.647394-1-dmitry.baryshkov@linaro.org>
Message-ID: <1e5700d7-ff19-b714-3192-9f9794056a54@linaro.org>
Date: Sat, 2 Oct 2021 04:09:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211002010814.647394-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 02/10/2021 04:08, Dmitry Baryshkov wrote:
> PM8xxx PMIC family uses GPIO as parent IRQ. Using it together with the
> irq_set_chained_handler_and_data() results in warnings from the GPIOLIB
> as in this path the IRQ resources are not allocated (and thus the
> corresponding GPIO is not marked as used for the IRQ. Use request_irq so
> that the IRQ resources are proprely setup.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Please ignore this duplicate, it was sent by mistake.


-- 
With best wishes
Dmitry
