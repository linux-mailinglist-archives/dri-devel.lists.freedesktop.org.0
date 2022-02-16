Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF7B4B8B2B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 15:13:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37D310F13F;
	Wed, 16 Feb 2022 14:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id DAFA310F13F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 14:13:09 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:41724.2129254537
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 2B970100238;
 Wed, 16 Feb 2022 22:13:07 +0800 (CST)
Received: from  ([172.27.8.53])
 by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id
 b3dbb3be09af45109d798cf10be5fd16 for daniel@fooishbar.org; 
 Wed, 16 Feb 2022 22:13:09 CST
X-Transaction-ID: b3dbb3be09af45109d798cf10be5fd16
X-Real-From: 15330273260@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
Message-ID: <adec818a-5c66-3b4a-6f27-bcb29b6c67d1@189.cn>
Date: Wed, 16 Feb 2022 22:13:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <20220203085851.yqstkfgt4dz7rcnw@houat>
 <f5381561-25da-61e3-5025-fa6dd61dd730@189.cn>
 <20220209084331.fpq5ng3yuqxmby4q@houat>
 <def50622-fe08-01f7-83bd-e6e0bc39fe1b@189.cn>
 <CAPj87rOgk8A8s6MTqxcTO5EkS=ABpHQV3sHsAp7Yn2t3-N_SoQ@mail.gmail.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <CAPj87rOgk8A8s6MTqxcTO5EkS=ABpHQV3sHsAp7Yn2t3-N_SoQ@mail.gmail.com>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, Roland Scheidegger <sroland@vmware.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Krzysztof Kozlowski <krzk@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/2/16 21:46, Daniel Stone wrote:
> On Wed, 9 Feb 2022 at 15:41, Sui Jingfeng <15330273260@189.cn> wrote:
>> On 2022/2/9 16:43, Maxime Ripard wrote:
>>> More fundamentally (and this extends to the CMA, caching and VRAM stuff
>>> you explained above), why can't the driver pick the right decision all
>>> the time and why would that be under the user control?
>> The right decision for ls7a1000 is to use VRAM based helper, But sometimes
>> we need CMA helper based solution. Because: The PRIME support is lost, use
>> lsdc with etnaviv is not possible any more.
>>
>>    Buffer sharing with etnaviv is no longer possible, loongson display controllers
>>    are simple which require scanout buffers to be physically contiguous.
> Other systems have this limitation, and Mesa's 'kmsro' concept makes
> this work transparently, as long as your driver can export dmabufs
> when running in 'VRAM' mode.
>
> Cheers,
> Daniel

When using vram helper based driver, the framebuffer  is locate at video 
ram. the backing memory fb is manage by TTM.

while bo of etnaviv is locate at system ram. Currently i can't figure 
out how does the buffer going to be shared.

