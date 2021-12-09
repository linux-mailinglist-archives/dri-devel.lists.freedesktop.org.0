Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C73646EFCD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2234710ED1A;
	Thu,  9 Dec 2021 16:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3AD410E117
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 15:43:53 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m27so12695858lfj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 07:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zmr1TAXCDUHBoO/fN5HJJIcyfXLJJrTVzqtdSWu9w4U=;
 b=B3MQZDVoWi0elr+edK/mkohSqqJzZ1Pnmhw4lsMb9ovurYaUTqx8nnfcZd4mh9+rlu
 aHDUkX58r7ERf06e9wEb+CVvebxoRH0NjmjSBcrHLfuIGkBqeJBBQ79XWDzpKNbz5Ca0
 0VZcjJdx0sCdvTa4AqLMlcYcV0tWteo7iY0j+YI/ZlCDxeEfOfpik9uqCxFm/9T9Uu4U
 ZYK26YXATPMkB1UeQU9p58w+6xisRm/BzZtQlnUWTkr3LZcX5KU8tPU2o3CsAdtxYgw7
 C2NjNO9PxNEPZtQMWzT28aqIahT3gRkt7bjH926DJGi7Km5kavfIWIoT1Wyt83Iqgblu
 5fOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zmr1TAXCDUHBoO/fN5HJJIcyfXLJJrTVzqtdSWu9w4U=;
 b=fATsHN6cDNTzYTkE5vmpj/XYFfDrOFECBZ/ffmrgLiNVhLlI2HH1zhGv1eOXV+O/Fr
 uLcAyxjkqW0fFhYWCIS5mKkkQ/RW+yn2W6kVHl7k9i4Zvh+6PwwtXpo2VJovJu8zOuHD
 PHa/y6K6A9SecSprwaNlDEMEnuG3UZPVZjWjm3K56COw9df1Sq6FEGSQ33KiBEPFfldm
 LpByLqNHmdM/c1p336juHWowz+VL2RFUdQ38AFuZKnFSiIweBUQvVLOVrDdk9vRUh33E
 L4Xv0/es3Zg6log3XXHREMhWJ1TNi3qX85NgAKNPCTiVUI/sV345CF23RlMgiQDglLah
 tm0w==
X-Gm-Message-State: AOAM532SEf7APGrad+Z/icHgrR3F2K5Dho2yH8O2ecEpshekE83LGSCY
 Al6UKMPTK+juJYiDvhiC/bA=
X-Google-Smtp-Source: ABdhPJxX4GW3ep3V/uqAp1KIFYrKxz5iouYUzd+/NXOgsELglbKLG+ys0UQMXhdYNvG9QblVCcPgSA==
X-Received: by 2002:ac2:46c2:: with SMTP id p2mr1430988lfo.87.1639064632209;
 Thu, 09 Dec 2021 07:43:52 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.googlemail.com with ESMTPSA id m18sm22333lfu.71.2021.12.09.07.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 07:43:51 -0800 (PST)
Subject: Re: [PATCH 2/2] i2c: tegra: Add SMBus block read and SMBus alert
 functions
To: Akhil R <akhilrajeev@nvidia.com>, andy.shevchenko@gmail.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 jonathanh@nvidia.com, ldewangan@nvidia.com, linaro-mm-sig@lists.linaro.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 p.zabel@pengutronix.de, sumit.semwal@linaro.org, thierry.reding@gmail.com,
 robh+dt@kernel.org, devicetree@vger.kernel.org
References: <1639062321-18840-1-git-send-email-akhilrajeev@nvidia.com>
 <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9443afa6-b668-ae31-2413-05aa95a9567d@gmail.com>
Date: Thu, 9 Dec 2021 18:43:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1639062321-18840-3-git-send-email-akhilrajeev@nvidia.com>
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

09.12.2021 18:05, Akhil R пишет:
> +static int tegra_i2c_setup_smbalert(struct tegra_i2c_dev *i2c_dev)
> +{
> +	struct tegra_i2c_smbalert *smbalert = &i2c_dev->smbalert;
> +	struct gpio_desc *alert_gpiod;
> +	struct i2c_client *ara;
> +
> +	alert_gpiod = devm_gpiod_get(i2c_dev->dev, "smbalert", GPIOD_IN);
> +	if (IS_ERR(alert_gpiod))
> +		return PTR_ERR(alert_gpiod);
> +
> +	smbalert->alert_data.irq = gpiod_to_irq(alert_gpiod);
> +	if (smbalert->alert_data.irq <= 0)
> +		return smbalert->alert_data.irq;

Why GPIO is needed at all if what's actually needed is the interrupt?
