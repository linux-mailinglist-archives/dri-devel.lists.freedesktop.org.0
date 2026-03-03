Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHgTLv2hpmmvSAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:55:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AE41EB4E4
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 09:55:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A981510E708;
	Tue,  3 Mar 2026 08:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X3DU2OpF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F82010E659
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2026 08:15:53 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-3599126be32so963299a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2026 00:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772525753; x=1773130553; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TOoaOEZuNJH/wFIt6h7FeWwE1+oo5QuN+aJxkWYzY4s=;
 b=X3DU2OpFapwJPi7qj09kfYb8lpbfLmw5VmzeArXok/dFPG0VdQn/e0VLxFxHeckGYB
 eVmvNKwvVZqooCpLp0ZKTsOwfah8PDHWMhKmbnxEQE9fwRBxMIBLuCRSpXkHpSir4mT0
 GDBZr/IfDwtWMQMSVwR+N5+0TnCdHGqQtnygrxrmN4WeTB1ydPbXLR4RBPhpW5hBERC/
 GeY7RpxAklFYsTFMeo25/E4mAGjPq9Q2HRPG8nEzFqf+ffenlXZZe3sjwZULGp9Xr923
 xS3UGPfUMlYP/o9A5L+8lbD1RSMKPp2VPN9crMzDGVT8xFKYEo1FKfQbZIxeUC6PD55S
 GUIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772525753; x=1773130553;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TOoaOEZuNJH/wFIt6h7FeWwE1+oo5QuN+aJxkWYzY4s=;
 b=AU8XCwyXaSanY9kg9VJnP1BYL6P01AnyU0lJOixReYywjhPXReun/Guj376TMn6ZOa
 hJqhHC0URuhbCTu3zmVuN5RL5zWiZ8Y88s+H+25Ehf/nxisXATrrZs73oI6k+eN30RYh
 U9gWqLwvyd7Cl10hEUuAbB457ys2f1R28zQirecRaRruxxA+ms8MV0LM4LxCIhtT7s/E
 NkfdrGt7SpHehwsqkDP8Z4pJkLKA7viZu0juRW6O8rRIw/t98o9u4Kt7Ui9YG8g0mbj1
 rRPYYVUZNcCbWkIha5hHBV616edHAw3PjJ/eVrE4hJkkrz+7L8RX/I5W+dA1IQogX2Jg
 K7lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv8LjIpS1aMGPe83Xy9E3H8Wo7FHQF30lUgPSec71dZayP2V0YAT2E5metP+z+kUINKWAwiCu/PXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzf4LWDjWUqDk20BwlUNH4uAEGr6tY/oFGQtc1BTyhfwf1kNa2+
 IZizrES7J65LKYUr4lnViTv9bcgrgY2V2Pv/A09LjpNgMvBz6CTlP6CNcnhDiQ==
X-Gm-Gg: ATEYQzx96ch+cLloFwUGdmk5NULwN6JijGKDJqcQngTRuwEnNiHk53aDTrJSYlK8W2Y
 7U7JkrSm3SzZUUGnNLM9BvuwXsm67r+vO9d1FbN47+G+YiBUyKqBqgnd5lmwmNZE+sqCWARNJXH
 x7cRVFKwrnvqueYgTLcH4WN6oMxRySfKbi0wrePVe+vRKvEdHgmErsxqRlD9yg6cJC27/pqq0Iw
 XY5ZlupDt3waqaQ93lrN7WsJ+jh84KOUn6VVYyNpOS/gXBanOmE4+GjGQbw2iTUER+7kt+X3ge4
 CgQjnBZPH1c3FLa+iNwJBgpTDuDvpaSi9AIZOarymitAXOFgK5Cg67dVGMM1swUS6bhoILsI49a
 SB71eynObqgNlrPKYXSp82rJuoaDds3ZYbL+MNP/rLH1wIzQYDxcnKCnVO9RKxHlhYK7/peD8s7
 Dq4KQtnH6Bpzfm7DwO2YFTk4Iv/7Dw6lG5IVMO4Y/0g+h9X8+iJYx2D3ZiBoJDD5sj6Ln62Fy5s
 8Bx
X-Received: by 2002:a17:90b:4b50:b0:354:a662:47ff with SMTP id
 98e67ed59e1d1-35965d188d6mr12983648a91.35.1772525752831; 
 Tue, 03 Mar 2026 00:15:52 -0800 (PST)
Received: from [192.168.0.101] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3599c408296sm1377885a91.5.2026.03.03.00.15.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 00:15:52 -0800 (PST)
Message-ID: <b69d5393-f122-44e9-96d9-342f458c3487@gmail.com>
Date: Tue, 3 Mar 2026 16:15:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/nuvoton: add MA35D1 display controller driver
To: Icenowy Zheng <uwu@icenowy.me>, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-4-a0987203069@gmail.com>
 <8806eaf82fbef4cd51bb4e4bb44d60894b3504b4.camel@icenowy.me>
 <f556ef68-dac3-4652-ac21-ea4bbb4e912c@gmail.com>
 <9cccf8cd84b394f66b85e2af3bef0a3ecd154747.camel@icenowy.me>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <9cccf8cd84b394f66b85e2af3bef0a3ecd154747.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 03 Mar 2026 08:53:16 +0000
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
X-Rspamd-Queue-Id: 37AE41EB4E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:uwu@icenowy.me,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[icenowy.me,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action


On 2/10/2026 8:02 PM, Icenowy Zheng wrote:
> 在 2026-02-09星期一的 16:45 +0800，Joey Lu写道：
>> On 2/6/2026 11:09 PM, Icenowy Zheng wrote:
>>> 在 2026-01-29星期四的 12:05 +0800，Joey Lu写道：
>>>> ========== 8< ============
>>>> +#endif
>>>> diff --git a/drivers/gpu/drm/nuvoton/ma35_regs.h
>>>> b/drivers/gpu/drm/nuvoton/ma35_regs.h
>>>> new file mode 100644
>>>> index 000000000000..0f4a7a13e7d8
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/nuvoton/ma35_regs.h
>>>> @@ -0,0 +1,88 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0+ */
>>>> +/*
>>>> + * Nuvoton DRM driver
>>>> + *
>>>> + * Copyright (C) 2026 Nuvoton Technology Corp.
>>>> + *
>>>> + * Author: Joey Lu <a0987203069@gmail.com>
>>>> + */
>>>> +
>>>> +#ifndef _MA35_REGS_H_
>>>> +#define _MA35_REGS_H_
>>>> +
>>>> +#define MA35_FRAMEBUFFER_CONFIG                   0x1518
>>> Please check my Verisilicon DC8200 driver, which is already part of
>>> drm-misc-next now.
>>>
>>> The display controller here seems to be a earlier one from
>>> Verisilicon.it looks like a DC8000, or maybe a more earlier one?
>> The DCU is a Vivante DCUltra IP rather than a DC8000 series.
>>
>> It's an earlier generation display controller and was customized for
>> Nuvoton, so it doesn't have a public model ID.
>>
>> Because of that lineage, parts of the register layout and
>> functionality
>> remain similar to older DC IPs.
> The kernel seems to dislike different drivers for similar IPs.
>
>> Please refer to MA35D1 datasheet for more details.
> I checked it, and the register definitions looks compatible with DC8000
> registers at [1]. However no identification information is shown in the
> manual.
>
> I may get a MA35D1 board after the Lunar New Year (although it looks a
> little expensive), is it easy to bring up mainline kernal on arbitary
> MA35D1 boards?
>
> [1]
> https://github.com/milkv-megrez/rockos-u-boot/blob/c9221cf2fa77d39c0b241ab4b030c708e7ebe279/drivers/video/eswin/eswin_dc_reg.h
Our team is actively working on upstreaming support for MA35D1. It is 
possible to bring up the mainline kernel on arbitrary MA35D1 boards, but 
for the best experience I strongly recommend using our Buildroot[1] or 
Yocto[2] tooling available on the official GitHub. These provide 
board-specific configurations and greatly simplify the process.

If you decide to get an MA35D1 board yourself, our Buildroot/Yocto setup 
will help you get started quickly and ensure you have the right patches 
and configurations in place.

Currently, the mainline kernel version is 6.6, which is sufficient for 
checking registers and basic functionality. For more complete feature 
support, our Buildroot/Yocto tooling remains the recommended path.

[1] https://github.com/OpenNuvoton/buildroot_2024

[2] https://github.com/OpenNuvoton/MA35D1_yocto-v5.0

Best regards,

Joey

