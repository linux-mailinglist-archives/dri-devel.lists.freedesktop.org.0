Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOCPGyfliWnpDgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 14:46:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D65B10FDCB
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 14:46:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0B310E3F9;
	Mon,  9 Feb 2026 13:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SpXmSmvp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0116A10E134
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Feb 2026 08:45:46 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-82418b0178cso2286679b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 00:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770626746; x=1771231546; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DmVyyltTZXCiISWlqL6e2pkka9bcBWHjYQjn85OjRHg=;
 b=SpXmSmvpX8VzP4F9ZKxhfmwcf9yc6sqcpG51DWLma6HrR7U5vCSVMCZovq1jhNtMFB
 r19cY7G6unXFcKnhFLCVkbqvVwJNoJD3oqmk0foX3Pu0hMAssX8oM1cHOeqVeRy/OF3L
 H6NgHBNNFMUtRjKQW+ziIC3+9z2Pvj0A4cI7OutwFU3v3nSC3UZEnF2mfR4Fy89q9fmf
 3UhrOLPwIojtARuTtYZ7dp5UoSOmACu7YQd6QlHgH3Co6H+0HM5UayhkG1QfVjPaiVcN
 TqH69NrSk69wy2H8ahE+rymR5m7lL4rOjFdXxEUN30sy7ypU1SqjxC/dy+SNdcBMem4I
 mJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770626746; x=1771231546;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DmVyyltTZXCiISWlqL6e2pkka9bcBWHjYQjn85OjRHg=;
 b=nImNj1qigNu0OCnSqQ+hmxl+0wO7XXWcZvGdt5Buc83Mu3nbkWFgygGv8UntcncpFu
 ZIzSBaVWjYbBEBFQAnojqLiRcRfT5lSmNPgA1jZEPB+6cFtSzDnqz/pITd3DLO1N+6/e
 zlrJ2WuzZ5NRofgFGspnjhHseJOqH88OX0aKGMSpyvePA/MNkzhkUVmMXW/7ciEYU+Cs
 /jX5TO4LsDI1beYbYakIuS9X0RNYTGb9YzKXBva19cCUNtlqYLxEXS2L8g5AebdhB7M2
 Q/4wO2qTo5fVCZ8fBpKhYjgzrx6GqFy2a/WnUFhqlY7+/bKyrZV63gpdoKeyyhismJXL
 uMtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeHCrneheuLNtN6WK+B2EK04aFSt2JNb1b+KNLdWa6ZitbLVkyb+e0x0dkkNxYsdm7tkIy1Gq3mcg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywgri3cBHiOgP6FYGscJejOc9VkWCe7AWBWCIxmsCojGMbL8SHg
 xlAsy3ZAfHkDUk0DwI5FFXl2I+MGB3RTY2EO4WS3FOMv1JbezEhNF19t
X-Gm-Gg: AZuq6aLHTffLp0clYPBKYD32MZPLUxJztvCiCpKWfT/FYag/oalN35K5m821dOkIxjN
 mCiGDGTl7ZQR7gSHwTtWQBFq2YyZk1IoIO0ks3ocveQBIPF0AlgA39gF74NLZSNMkmqNb2S7YZD
 nNgnYxIHy7gThtQNSaUW7yJriLElJsWj2VxVlcZK29/5XVgtDztTrb4Jbva5bYsEWiJpqxsVqqV
 D3FeBtSL9LB/w3KKeoqY0SIK986KlyEcpvQQAn30xUdv1x9yJOL2G/wzjfgDcu1pRfeC0awBAHv
 6UFOTEWteJr1+XXD275V2/ONp+Sc02f0GrPA2YSynUnKZuJzUwQ5EGkCSTnWLVrYMrrp6nSDlZU
 bqrchcYvwuWoj3aBg1IxU+JpklCKsYfvhSElyCZjkNyDRzGj7eIAlVNU3CHF0AuPFoLn6ltINrQ
 rrOPLsKbE4KCzseT8silJuNrVTcXygLdKamsk10gZtjiXJhkLkep2H7/00/R6I3p/y
X-Received: by 2002:a05:6a00:1949:b0:822:6830:5900 with SMTP id
 d2e1a72fcca58-82441609809mr8859019b3a.6.1770626746380; 
 Mon, 09 Feb 2026 00:45:46 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82441695f7dsm10130745b3a.23.2026.02.09.00.45.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 00:45:45 -0800 (PST)
Message-ID: <f556ef68-dac3-4652-ac21-ea4bbb4e912c@gmail.com>
Date: Mon, 9 Feb 2026 16:45:40 +0800
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
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <8806eaf82fbef4cd51bb4e4bb44d60894b3504b4.camel@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Feb 2026 13:46:07 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:uwu@icenowy.me,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[icenowy.me,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8D65B10FDCB
X-Rspamd-Action: no action


On 2/6/2026 11:09 PM, Icenowy Zheng wrote:
> 在 2026-01-29星期四的 12:05 +0800，Joey Lu写道：
>> ========== 8< ============
>> +#endif
>> diff --git a/drivers/gpu/drm/nuvoton/ma35_regs.h
>> b/drivers/gpu/drm/nuvoton/ma35_regs.h
>> new file mode 100644
>> index 000000000000..0f4a7a13e7d8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/nuvoton/ma35_regs.h
>> @@ -0,0 +1,88 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Nuvoton DRM driver
>> + *
>> + * Copyright (C) 2026 Nuvoton Technology Corp.
>> + *
>> + * Author: Joey Lu <a0987203069@gmail.com>
>> + */
>> +
>> +#ifndef _MA35_REGS_H_
>> +#define _MA35_REGS_H_
>> +
>> +#define MA35_FRAMEBUFFER_CONFIG                   0x1518
> Please check my Verisilicon DC8200 driver, which is already part of
> drm-misc-next now.
>
> The display controller here seems to be a earlier one from
> Verisilicon.it looks like a DC8000, or maybe a more earlier one?

The DCU is a Vivante DCUltra IP rather than a DC8000 series.

It's an earlier generation display controller and was customized for 
Nuvoton, so it doesn't have a public model ID.

Because of that lineage, parts of the register layout and functionality 
remain similar to older DC IPs.

Please refer to MA35D1 datasheet for more details.

>> +#define MA35_FRAMEBUFFER_ADDRESS                  0x1400
>> +#define MA35_FRAMEBUFFER_STRIDE                   0x1408
>> +#define MA35_HDISPLAY                             0x1430
>> +#define MA35_HSYNC                                0x1438
>> +#define MA35_VDISPLAY                             0x1440
>> +#define MA35_VSYNC                                0x1448
>> +#define MA35_PANEL_CONFIG                         0x1418
>> +#define MA35_DPI_CONFIG                           0x14B8
>> +#define MA35_CURSOR_ADDRESS                       0x146C
>> +#define MA35_CURSOR_CONFIG                        0x1468
>> +#define MA35_CURSOR_LOCATION                      0x1470
>> +#define MA35_CURSOR_BACKGROUND                    0x1474
>> +#define MA35_CURSOR_FOREGROUND                    0x1478
>> +#define MA35_FRAMEBUFFER_UPLANAR_ADDRESS          0x1530
>> +#define MA35_FRAMEBUFFER_VPLANAR_ADDRESS          0x1538
>> +#define MA35_FRAMEBUFFER_USTRIDE                  0x1800
>> +#define MA35_FRAMEBUFFER_VSTRIDE                  0x1808
>> +#define MA35_INDEXCOLOR_TABLEINDEX                0x1818
>> +#define MA35_INDEXCOLOR_TABLEDATA                 0x1820
>> +#define MA35_FRAMEBUFFER_SIZE                     0x1810
>> +#define MA35_FRAMEBUFFER_SCALEFACTORX             0x1828
>> +#define MA35_FRAMEBUFFER_SCALEFACTORY             0x1830
>> +#define MA35_FRAMEBUFFER_SCALEFCONFIG             0x1520
>> +#define MA35_HORIFILTER_KERNELINDEX               0x1838
>> +#define MA35_HORIFILTER_KERNEL                    0x1A00
>> +#define MA35_VERTIFILTER_KERNELINDEX              0x1A08
>> +#define MA35_VERTIFILTER_KERNEL                   0x1A10
>> +#define MA35_FRAMEBUFFER_INITIALOFFSET            0x1A20
>> +#define MA35_FRAMEBUFFER_COLORKEY                 0x1508
>> +#define MA35_FRAMEBUFFER_COLORHIGHKEY             0x1510
>> +#define MA35_FRAMEBUFFER_BGCOLOR                  0x1528
>> +#define MA35_FRAMEBUFFER_CLEARVALUE               0x1A18
>> +#define MA35_DISPLAY_INTRENABLE                   0x1480
>> +#define MA35_INT_STATE                            0x147C
>> +#define MA35_PANEL_DEST_ADDRESS                   0x14F0
>> +#define MA35_MEM_DEST_ADDRESS                     0x14E8
>> +#define MA35_DEST_CONFIG                          0x14F8
>> +#define MA35_DEST_STRIDE                          0x1500
>> +#define MA35_DBI_CONFIG                           0x1488
>> +#define MA35_AQHICLOCKCONTROL                     0x0000
>> +#define MA35_OVERLAY_CONFIG                       0x1540
>> +#define MA35_OVERLAY_STRIDE                       0x1600
>> +#define MA35_OVERLAY_USTRIDE                      0x18C0
>> +#define MA35_OVERLAY_VSTRIDE                      0x1900
>> +#define MA35_OVERLAY_TL                           0x1640
>> +#define MA35_OVERLAY_BR                           0x1680
>> +#define MA35_OVERLAY_ALPHA_BLEND_CONFIG           0x1580
>> +#define MA35_OVERLAY_SRC_GLOBAL_COLOR             0x16C0
>> +#define MA35_OVERLAY_DST_GLOBAL_COLOR             0x1700
>> +#define MA35_OVERLAY_CLEAR_VALUE                  0x1940
>> +#define MA35_OVERLAY_SIZE                         0x17C0
>> +#define MA35_OVERLAY_COLOR_KEY                    0x1740
>> +#define MA35_OVERLAY_COLOR_KEY_HIGH               0x1780
>> +#define MA35_OVERLAY_ADDRESS                      0x15C0
>> +#define MA35_OVERLAY_UPLANAR_ADDRESS              0x1840
>> +#define MA35_OVERLAY_VPLANAR_ADDRESS              0x1880
>> +#define MA35_OVERLAY_SCALE_CONFIG                 0x1C00
>> +#define MA35_OVERLAY_SCALE_FACTOR_X               0x1A40
>> +#define MA35_OVERLAY_SCALE_FACTOR_Y               0x1A80
>> +#define MA35_OVERLAY_HORI_FILTER_KERNEL_INDEX     0x1AC0
>> +#define MA35_OVERLAY_HORI_FILTER_KERNEL           0x1B00
>> +#define MA35_OVERLAY_VERTI_FILTER_KERNEL_INDEX    0x1B40
>> +#define MA35_OVERLAY_VERTI_FILTER_KERNEL          0x1B80
>> +#define MA35_OVERLAY_INITIAL_OFFSET               0x1BC0
>> +#define MA35_GAMMA_EX_INDEX                       0x1CF0
>> +#define MA35_GAMMA_EX_DATA                        0x1CF8
>> +#define MA35_GAMMA_EX_ONE_DATA                    0x1D80
>> +#define MA35_GAMMA_INDEX                          0x1458
>> +#define MA35_GAMMA_DATA                           0x1460
>> +#define MA35_DISPLAY_DITHER_TABLE_LOW             0x1420
>> +#define MA35_DISPLAY_DITHER_TABLE_HIGH            0x1428
>> +#define MA35_DISPLAY_DITHER_CONFIG                0x1410
>> +#define MA35_DISPLAY_CURRENT_LOCATION             0x1450
>> +
>> +#endif
