Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E7D4E4E88
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 09:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308C210E4A9;
	Wed, 23 Mar 2022 08:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 46C1310E4A9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 08:49:31 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:41174.1449576847
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id D4AA810023D;
 Wed, 23 Mar 2022 16:49:18 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 f13d8488257c43b0a5381e0c8ff61c77 for robh@kernel.org; 
 Wed, 23 Mar 2022 16:49:29 CST
X-Transaction-ID: f13d8488257c43b0a5381e0c8ff61c77
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <23c0f1ec-bc7b-df38-62e9-0c9f2f21f6d3@189.cn>
Date: Wed, 23 Mar 2022 16:49:15 +0800
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
>> +/*
>> + * ls7a_gpio_i2c_set - set the state of a gpio pin indicated by mask
>> + * @mask: gpio pin mask
>> + */
>> +static void ls7a_gpio_i2c_set(struct lsdc_i2c * const li2c, int mask, int state)
>> +{
>> +	unsigned long flags;
>> +	u8 val;
>> +
>> +	spin_lock_irqsave(&li2c->reglock, flags);
> What are you protecting? Doesn't the caller serialize calls to these
> functions?
>
This driver is ported from my work from my downstream work.

Maxime also ask this question before, but i did not answer.
He is right, protect single register access is not necessary.
uncached access have done the job itself.
so i remove it in V11 of my patch set.

There are two way GPIO emulated i2c, I want the code between
spin_lock_irqsave(&li2c->reglock, flags) and spin_unlock_irqrestore(&li2c->reglock, flags);
finished in a atomic way, without any disruption.

The two i2c should not have any influence each other.
I write it by gut feeling, and luckily it works very well in practice.

