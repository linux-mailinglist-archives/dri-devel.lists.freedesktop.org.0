Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE28C78EA
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 17:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E534610ED60;
	Thu, 16 May 2024 15:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="PrXNqlNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7CF10ED60
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 15:05:26 +0000 (UTC)
X-Envelope-To: markus.elfring@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1715871923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k1iwDmNYqVn248UOEBvI8HJ/0owB/GDjNqpgGn9M7lk=;
 b=PrXNqlNHE/uLlkTiBgXkBMSG+MjdD/5tNblwdqoUeBDzPesQHONfA/+xUGEo9XA5o49n5P
 6PyproianL5t9MIP4maWQN4JO7XNWJVlcVWtgbSZVRcz5aZwHaQbhnMnyUFX9cBr1YWgH1
 tyLNhhmtlhr9ceEGWxA21csFAyfpi/k=
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: kernel-janitors@vger.kernel.org
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: suijingfeng@loongson.cn
Message-ID: <42dae3a1-9817-464b-b581-529f4485be6f@linux.dev>
Date: Thu, 16 May 2024 23:05:16 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] drm/loongson: Refactor lsdc device initialize and the
 output port
To: Markus Elfring <Markus.Elfring@web.de>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>
References: <20240513001243.1739336-4-sui.jingfeng@linux.dev>
 <dc34d171-dc47-4817-a6f0-9f23a3afb8e7@web.de>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <dc34d171-dc47-4817-a6f0-9f23a3afb8e7@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 5/16/24 14:26, Markus Elfring wrote:
> …
>> fullfill the implement under the new framework.
> 
> fulfil the implementation?
> 
> Please improve your change descriptions another bit.

OK, despite has a few typos. but the quality of the patch itself
can be guaranteed. The first version is mainly for preview purpose.
I'll fix the problem you mentioned at the next version, thanks for
reviewing.

I have tested this series before posting on ls3a6000+ls7a2000 PC:

$ dmesg | grep loongson:

[    4.125926] loongson 0000:00:06.1: Found LS7A2000 bridge chipset, 
revision: 2
[    4.133035] loongson 0000:00:06.1: [drm] dc: 400MHz, gmc: 1200MHz, 
gpu: 480MHz
[    4.140215] loongson 0000:00:06.1: [drm] Dedicated vram start: 
0xe0030000000, size: 256MiB
[    4.148538] loongson 0000:00:06.1: [drm] VRAM: 16384 pages ready
[    4.154506] loongson 0000:00:06.1: [drm] GTT: 32768 pages ready
[    4.160410] loongson 0000:00:06.1: [drm] lsdc-i2c0(sda pin mask=1, 
scl pin mask=2) created
[    4.168638] loongson 0000:00:06.1: [drm] lsdc-i2c1(sda pin mask=4, 
scl pin mask=8) created
[    4.176938] loongson 0000:00:06.1: [drm] registered irq: 54
[    4.189404] loongson 0000:00:06.1: [drm] Output port-0 bound, type: 
HDMI-or-VGA-0
[    4.196839] loongson 0000:00:06.1: bound lsdc-output-port.0 (ops 
lsdc_output_port_component_ops)
[    4.211629] loongson 0000:00:06.1: [drm] Output port-1 bound, type: 
HDMI-1
[    4.218459] loongson 0000:00:06.1: bound lsdc-output-port.1 (ops 
lsdc_output_port_component_ops)
[    4.227203] loongson 0000:00:06.1: [drm] Total 2 outputs
[    4.272617] [drm] Initialized loongson 1.0.0 for 0000:00:06.1 on minor 0
[    4.341588] loongson 0000:00:06.1: [drm] fb0: loongsondrmfb frame 
buffer device
[    4.348867] loongson 0000:00:06.1: loongson add component: 0



> Regards,
> Markus

-- 
Best regards
Sui
