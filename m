Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D873470D6DF
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8880510E3E9;
	Tue, 23 May 2023 08:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18FF10E107
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 09:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1684747740; bh=KkXKslg/Zzd8BjgEV84faQOq6rSzW9m7ilvwkM/8wAQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ff57pBylcjRybXsT25eqJQR1UkB793MTrDEW/8ll1l64wanfRd059GTGtrsoPNCP5
 iUuhApO8ybo8bxiBeIBPQ9wwRkxnjJvz7E4MEha7K8gyU07YpBCfD8wIzbblmgWI5+
 /zvTIsbcdlupFPLuw14EL1Nmn4XLhRLB7wsggp24=
Received: from [100.100.57.122] (unknown [58.34.185.106])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 723C0600A6;
 Mon, 22 May 2023 17:28:59 +0800 (CST)
Message-ID: <ed795dc0-823a-f3d8-9e70-1cf33c0de7f0@xen0n.name>
Date: Mon, 22 May 2023 17:28:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v14 1/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20230520105718.325819-1-15330273260@189.cn>
 <20230520105718.325819-2-15330273260@189.cn>
 <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
 <e7f911cc-6588-bc0f-8e1e-759260f5187a@189.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <e7f911cc-6588-bc0f-8e1e-759260f5187a@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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
Cc: loongson-kernel@lists.loongnix.cn,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linaro-mm-sig@lists.linaro.org, Liu Peibao <liupeibao@loongson.cn>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/5/22 17:25, Sui Jingfeng wrote:
> Hi,
> 
> On 2023/5/21 20:21, WANG Xuerui wrote:
>>> + * LS3A4000/LS3A5000/LS3A6000 CPU, they are equipped with on-board 
>>> video RAM
>>> + * typically. While LS2K0500/LS2K1000/LS2K2000 are low cost SoCs 
>>> which share
>>> + * the system RAM as video RAM, they don't has a dediacated VRAM.
>>
>> CPU models are not typically prefixed with "LS", so "Loongson 
>> 3A4000/3A5000/3A6000".
>>
> Here is because when you do programming, variable name should prefix 
> with letters.

Commit messages, comments, and log messages etc. are natural language, 
so it's better to treat them differently. No problem to keep code as-is IMO.

>> Also the description about the Loongson 2K series is a bit irrelevant 
>> (we're focusing on VRAM here) so you could simplify the sentence a bit. 
> 
> We could reserve part of system RAM as VRAM for Loongson 2K series SoC.
> 
> Either reserved with 'of reserve memory' or  reserved by the firmware.
> 

What's an "of reserve memory"? Is it "DeviceTree-reserved"?

> The reserve ram will not accessible by kernel itself it this case, and 
> can still be managed by ttm.

Of course. Feel free to tweak.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

