Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772658B1835
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 02:57:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C7710E99B;
	Thu, 25 Apr 2024 00:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=classfun.cn header.i=@classfun.cn header.b="ZQHPPUN9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from classfun.cn (unknown [129.204.178.38])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8867410E99B
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 00:57:49 +0000 (UTC)
Received: from [192.168.0.160] (unknown [220.162.71.180])
 (Authenticated sender: bigfoot)
 by classfun.cn (Postfix) with ESMTPSA id 98B5D7870F;
 Thu, 25 Apr 2024 08:57:41 +0800 (CST)
DKIM-Filter: OpenDKIM Filter v2.11.0 classfun.cn 98B5D7870F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=classfun.cn;
 s=default; t=1714006667;
 bh=hs/RZj5lsMbnG9+JZAQhqO/qGFihPkInPVFOlxvoHxQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZQHPPUN9ksQCpiKXMkNkPEBhLgiJp84hXip1H8YS4+GRIvikmPULvbqe92LpStBlk
 LgcZepbk2WDIuzfVanjEuSsFAmRnriCydDCxazv/skIjRgp85iKYb35xkn4vyGykGD
 lL/cMUezXevZs7YXjmQXzoJb/epMKGR79gabHK9Q=
Message-ID: <361fc6a0-f0d0-49b2-b885-3b197294ec9f@classfun.cn>
Date: Thu, 25 Apr 2024 08:57:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] pwm: Add SI-EN SN3112 PWM support
To: Konrad Dybcio <konrad.dybcio@linaro.org>, wuxilin123@gmail.com,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Tengfei Fan <quic_tengfan@quicinc.com>,
 Molly Sophia <mollysophia379@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com>
 <20240424-ayn-odin2-initial-v1-2-e0aa05c991fd@gmail.com>
 <af62742c-8d6d-4fa9-b2e4-f83253e6e388@linaro.org>
Content-Language: en-US
From: Junhao Xie <bigfoot@classfun.cn>
In-Reply-To: <af62742c-8d6d-4fa9-b2e4-f83253e6e388@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024/4/25 03:37, Konrad Dybcio wrote:
> On 4/24/24 17:29, Xilin Wu via B4 Relay wrote:
>> From: Junhao Xie <bigfoot@classfun.cn>
>>
>> Add a new driver for the SI-EN SN3112 12-channel 8-bit PWM LED controller.
>>
>> Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
>> ---
>[...]
>> +    return sn3112_write_reg(priv, SN3112_REG_PWM_EN + reg,
>> +                priv->pwm_en_reg[reg]);
> 
> This looks like a weird reimplementation of regmap_update_bits
> 

We cannot use regmap_update_bits because this chip does not support read command.
It will discard all read command.

>> +}
>> +
[...]
> 
> devm_pwmchip_add?
> 
> Konrad

Thank you for your reply, I will fix them.
