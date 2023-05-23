Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA4C70D6CE
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD42A10E3D8;
	Tue, 23 May 2023 08:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 714E910E3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 08:12:19 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:50830.1110848198
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 2E6421002CE;
 Tue, 23 May 2023 16:12:14 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xwndj with ESMTP id
 44015d2c06d047de9aca08dcafbd25d6 for 15330273260@189.cn; 
 Tue, 23 May 2023 16:12:16 CST
X-Transaction-ID: 44015d2c06d047de9aca08dcafbd25d6
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <5d7f9d1a-10c5-5b55-c7d8-24183f5a09ee@189.cn>
Date: Tue, 23 May 2023 16:12:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 David Laight <David.Laight@ACULAB.COM>, Li Yi <liyi@loongson.cn>
References: <20230516173026.2990705-1-15330273260@189.cn>
 <f6bd362145124f34a1af800dd330f8e9@AcuMS.aculab.com>
 <b23c41b1-e177-c81d-5327-fce5511cb97d@189.cn> <871qj8ob7z.fsf@intel.com>
 <4c9c0897-5e3a-1469-3d87-ff7723ac160c@189.cn>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <4c9c0897-5e3a-1469-3d87-ff7723ac160c@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: "loongson-kernel@lists.loongnix.cn" <loongson-kernel@lists.loongnix.cn>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/5/23 12:26, Sui Jingfeng wrote:
> Hi,
>
> On 2023/5/22 19:29, Jani Nikula wrote:
>> In general, do not use unsigned types in arithmethic to avoid negative
>> values, because most people will be tripped over by integer promotion
>> rules, and you'll get negative values anyway.
>
>
> Here I'm sure about this,
>
Here, I'm NOT sure about this


> but there are plenty unsigned types arithmetic in the kernel.
>
> take kmalloc_array() function as an example in 
> /tools/virto/linux/kernel.h
>
>
> static inline void *kmalloc_array(unsigned n, size_t s, gfp_t gfp)
> {
>     return kmalloc(n * s, gfp);
> }
>
>
> NOTE that *size_t* is an unsigned integral data type.
