Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCA6B43DAF
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 15:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7402B10E00D;
	Thu,  4 Sep 2025 13:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="Z8oGhy3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3678410E00D
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 13:49:42 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHgnt1KWHz9srp;
 Thu,  4 Sep 2025 15:49:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1756993778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Eyv4JfVwk6E7rSyv4qxxGsrvnR26XQTwFmzC798VcA=;
 b=Z8oGhy3BizEHytmaH8F6sq9GpUXO8WVDZYaX3DqqpQ5FOZLnpCLgY5+KwRcHe/2Bymwo53
 pWeX0VVqcbLJTlM/79SHzKAKZTPcxMe+OFOu+vlajVrtgz2pcbha11l+uViNnaak+dE5tC
 kdIvb4wYEbp0Cr8BIdD6BsZyQeTGT3pMmZUS19RKcBlSNN8ty8CCZXCjYiMVOANSdqXdSx
 1iKFM0oZB10Ks2J6ktdRWIVDBHng1p6JLsrJN+onB7MYAv6LiRMZ3P7h6ImasnOfyQH5cX
 ZaWy/mNKr9TO6yOdfJUnjtbuk5NeSbBsHtIrAqNZJm7WotSMIBOIZtAEdl4WWw==
Message-ID: <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
Date: Thu, 4 Sep 2025 15:49:31 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sebastian Reichel <sre@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Steven Price <steven.price@arm.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev
References: <20250321200625.132494-1-marex@denx.de>
 <20250321200625.132494-5-marex@denx.de>
 <20250324094333.7afb17a1@collabora.com>
 <c1de2afb-3559-4fbb-b13b-2373175b420b@denx.de>
 <20250325084349.344a0f11@collabora.com>
 <7aadf355-edf0-46fc-b969-65c3789375ca@denx.de>
 <20250325153507.61d82e39@collabora.com>
 <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
 <20250325155231.0d1b1000@collabora.com>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250904082224.113d0cd1@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 74f787c64e361a067a0
X-MBO-RS-META: 4dihidnqffe48jkhfqpgw3ysi95xrxr6
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

On 9/4/25 8:22 AM, Boris Brezillon wrote:
> Hello Marek,

Hello Boris,

>> Can you please test the following patch (also attached) on one of your
>> devices, and tell me what the status is at the end . The diff sets the
>> GLB_HALT bit and then clears it again, which I suspect should first halt
>> the GPU and (this is what I am unsure about) then again un-halt/resume
>> the GPU ?
> 
> It doesn't work like that. What you're describing is like executing
> "shutdown" on your terminal and then typing "boot" on the keyboard
> after your computer has been shut down.

That is what I thought , yes .

I think what I am looking for is the "power key" .

[...]

>> That means, the GPU remains halted at the end, even if the "GLB_HALT"
>> bit is cleared before the last print. The clearing of GLB_HALT is also
>> what panthor_fw_post_reset() does.
> 
> After the halt has been processed by the FW, the memory region where
> you check the halt status again is inert, since the micro-controller
> (MCU) supposed to update those bits is off at this point. The FW
> interface is really just a shared memory region between the CPU and
> MCU, nothing more.

Right.

>> I suspect the extra soft reset I did before "un-halted" the GPU and
>> allowed it to proceed.
> 
> Hm, not quite. I mean, you still need to explicitly boot the MCU after
> a reset, which is what the write to MCU_CONTROL [1] does. What the
> soft-reset does though, is reset all GPU blocks, including the MCU.
> This means the MCU starts from a fresh state when you reach [1].

I have a feeling the write to MCU_CONTROL does nothing in my case.

Is there some way to probe the MCU state before/after setting GLB_HALT, 
and also before/after the MCU_CONTROL write, using 
gpu_read()/gpu_write() register operations, to find out what is going on 
with the MCU at each point ?
