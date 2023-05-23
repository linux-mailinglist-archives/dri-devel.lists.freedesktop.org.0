Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD03A70D9A2
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 11:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E81510E41C;
	Tue, 23 May 2023 09:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id D5E6510E420
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 09:55:45 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:57524.1031125115
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.31])
 by 189.cn (HERMES) with SMTP id 3F859100213;
 Tue, 23 May 2023 17:55:40 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xp9j7 with ESMTP id
 277733f944394f969e1abbb9ceeb69a8 for david.laight@aculab.com; 
 Tue, 23 May 2023 17:55:42 CST
X-Transaction-ID: 277733f944394f969e1abbb9ceeb69a8
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <ed008264-e72e-7548-d93e-f7f4130ef2c2@189.cn>
Date: Tue, 23 May 2023 17:55:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/drm_vblank.c: avoid unsigned int to signed int cast
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>
References: <20230516173026.2990705-1-15330273260@189.cn>
 <f6bd362145124f34a1af800dd330f8e9@AcuMS.aculab.com>
 <b23c41b1-e177-c81d-5327-fce5511cb97d@189.cn> <871qj8ob7z.fsf@intel.com>
 <4c9c0897-5e3a-1469-3d87-ff7723ac160c@189.cn>
 <e5effc4568034489acf2f4d4dad6eba9@AcuMS.aculab.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <e5effc4568034489acf2f4d4dad6eba9@AcuMS.aculab.com>
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

On 2023/5/23 16:50, David Laight wrote:
> From: 15330273260@189.cn <15330273260@189.cn>
>> Sent: 23 May 2023 05:27
>>
>> On 2023/5/22 19:29, Jani Nikula wrote:
>>> In general, do not use unsigned types in arithmethic to avoid negative
>>> values, because most people will be tripped over by integer promotion
>>> rules, and you'll get negative values anyway.
>>
>> Here I'm not sure about this,
>>
>> but there are plenty unsigned types arithmetic in the kernel.
> The real problem is (attempted) arithmetic on types smaller than int.
> Regardless of whether they are signed or unsigned.

It is about sign extend.

Yes, you may be right. I might create a wrong patch.

But this will not happen in practice, because in general case:

mode->crtc_htotal < 0x8fff;

mode->crtc_vtotal < 0x8fff;

u16 gets promoted to 'signed int' not 'unsigned int'.

Sorry  :/

> 	David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
