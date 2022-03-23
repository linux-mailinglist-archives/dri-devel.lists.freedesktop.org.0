Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076404E4F73
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 10:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D19E10E13F;
	Wed, 23 Mar 2022 09:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id A871C10E13F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 09:32:03 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:35378.1509098416
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 3405D100225;
 Wed, 23 Mar 2022 17:31:58 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 61937688d8bb45d78e3cf3b4744afb5f for robh@kernel.org; 
 Wed, 23 Mar 2022 17:32:02 CST
X-Transaction-ID: 61937688d8bb45d78e3cf3b4744afb5f
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <f0db9bc0-ae9b-e86e-cc14-376dc40b86f4@189.cn>
Date: Wed, 23 Mar 2022 17:31:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 7/7] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220321162916.1116541-1-15330273260@189.cn>
 <20220321162916.1116541-8-15330273260@189.cn>
 <Yjo2R5LQrRICr7dC@robh.at.kernel.org>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <Yjo2R5LQrRICr7dC@robh.at.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Thomas Zimmermann <tzimmermann@suse.de>,
 Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/3/23 04:49, Rob Herring wrote:
>> +
>> +	if (state) {
>> +		val = readb(li2c->dir_reg);
>> +		val |= mask;
>> +		writeb(val, li2c->dir_reg);
>> +	} else {
>> +		val = readb(li2c->dir_reg);
>> +		val &= ~mask;
>> +		writeb(val, li2c->dir_reg);
>> +
>> +		val = readb(li2c->dat_reg);
>> +		if (state)
> This condition is never true. We're in the 'else' because !state.
>
>> +			val |= mask;
>> +		else
>> +			val &= ~mask;
>> +		writeb(val, li2c->dat_reg);
> Shouldn't you set the data register low first and then change the
> direction? Otherwise, you may be driving high for a moment. However, if
> high is always done by setting the direction as input, why write the
> data register each time? I'm assuming whatever is written to the dat_reg
> is maintained regardless of pin state.

To be honest, i have rewrite GPIO emulated i2c several times.
Either give data first, then give the direction
or give the direction first, then the data
will be OK in practice.

In the theory, the GPIO data should be given before the GPIO direction,
I was told doing that way when learning Single-Chip Microcomputer (AT89S52).

But the high "MUST" be done by setting the direction as input.
It is "MUST" not "CAN" because writing code as the following
way works in practice.

         if (state) {
                 val = readb(li2c->dir_reg);
                 val |= mask;
                 writeb(val, li2c->dir_reg);
         } else {
                // ...
         }

If the adjust the above code by first set the detection as output,
then set the GPIO data register with high voltage level("1"). as
the following demonstrate code,

         if (state) {
		/* First set this pin as output */
		val = readb(li2c->dir_reg);
		val |= mask;
		writeb(val, li2c->dir_reg);

		/* Then, set the state to high */
		val = readb(li2c->dat_reg);
		val |= mask;
		writeb(val, li2c->dat_reg);
         } else {
                // ...
         }

Then i2c6 will NOT work as exacted, i2c7 will work, so strangely.
It may because the GPIO is open drained, not Push-pull output.
Output high is achieved by externalpull up resistance on the PCB.

