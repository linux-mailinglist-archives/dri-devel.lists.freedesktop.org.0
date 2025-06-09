Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E15AD166C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jun 2025 03:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CF810F4CB;
	Mon,  9 Jun 2025 00:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k2kDOmY9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1252310EEF6;
 Mon,  9 Jun 2025 00:59:41 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2320d06b728so32221335ad.1; 
 Sun, 08 Jun 2025 17:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749430780; x=1750035580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=1UZ3G3hP2PMByn8gAasj2ugyuBhdWDYhYy8rSg1DMCk=;
 b=k2kDOmY9mDm/FBmd5ns82vPeshsoljxGmsl7UuTG8bXpsnExLBFDZsrLerXBS2ZRQK
 x3kGx7xypGjKduTqzEulHssGSPLWLrx9nd2qI8w/e23L2SEDIBasqXShrd6K3X8wRHgv
 XhBub8Oh58CYZUq+Dq5azJ7AI1vWp7zRNUeizrNyO/5moNPQwc42xbqywIpTDkc3KV05
 mZLdbUTdYnjhb2WqTuz2Gj+CCrogWU5x9X405IgghRIeeWlgJAfjxJttbldIXcw0VNTN
 +N07vRS7HgSkAgrzWn7huDWtkCGys4oeURmQtonMLqijwT+EeKrPLySR/b/k10JFGobK
 rNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749430780; x=1750035580;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1UZ3G3hP2PMByn8gAasj2ugyuBhdWDYhYy8rSg1DMCk=;
 b=WiwOB691xbm0NDNAvyuzLEl8VGLbt9+9TxMsJGxGg6dFjQNXZp7aF4jApTRhpSnSMg
 EU9YzOlqmunfcYOqp5S/kkFaIqiLoXDB1GaU3Xd4dJjAe8v3a11BPhsgPykSqiuzrF1S
 oTzzsOAMLEDT4MMN1Dc2VW7qQoDjoau01LPFxRSrMeHWcodD9FK90TiW4LoVCYHeWG71
 z9PhSIqbAxxTDY2qrz9AvAcGw++xdbhvahPKhgjRGdBlUA3MuMMQMamfqSJo/jYPKnT8
 +GIQrTeyjEaDOm89YVT0iQx0W/xcPkRb/pNaU7rfRuNUOrxUdREk+dBDLgSHW93KSgFy
 VhAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3ENjBbLd9ThRVk5bP8Eea0B7Tu25FweMuRwyQ19cEd0TNR9IBap1Q5HNL3Ah1Lkujki7HB9TLELwy@lists.freedesktop.org,
 AJvYcCU5izimjzogkMcN/a9J2QxndEAfTvnkX1772mmWJXFUqM4yjZwoJ22p+SNrDR2bim9qvK4eyFKqz0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5HXUs13LAC5zEs2nUXVaVy4MlBITcrO/HeEp0XzB/EZRSNWy2
 aypN0uEp50bGBTf3SEQth3uryR6E7wlAnA31Hx5tWJMui16+UloEPTzN
X-Gm-Gg: ASbGncuroSgw+nqvmtV7zz+KG4Ug8OB3fYWvXNrHo2sOq+sDRizjCwd7Y3upIgNVno1
 4GtXDlOBRHy1+S/EJr68gLxJNblUmMfy8juklb2DNZqT8bnRkn8EM0Rl8vGG50DJUd85yutQAIV
 sVb2EVnlIFAJ6a6H3+cKUcp61gL3c/Sphjex4pKqihzNWwTMlqZKYNUIWZRHtpmENfo0poALrek
 chJcREmCjrnp6RoPO6iakoAjA9Cucy/sJ/fnHsgdzdAtaTn9u0cG1088zdZ29ffIN097rx2hj5x
 u7hpcOg0Tklvzj3hxplIqQR1Q52Ux4N/3SbjegSDVKZ5T33/p8w/HG2vU0cQalWbC67UOIgzLdX
 43wU05FsGSNTVDgdkFcE7tn0tTVVvxMJbQw16bfwikSD69w==
X-Google-Smtp-Source: AGHT+IFx7Bw//bf81ZFuNLNFxpt0Z3XFm1C4VkqMkhOt4fhQ54pvjlNDTtmhS80ppAjEon3na2MsaA==
X-Received: by 2002:a17:902:e84b:b0:234:cf24:3be8 with SMTP id
 d9443c01a7336-23601d172bbmr161947955ad.28.1749430780376; 
 Sun, 08 Jun 2025 17:59:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5?
 ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603096983sm44234525ad.85.2025.06.08.17.59.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jun 2025 17:59:39 -0700 (PDT)
Message-ID: <2f3d3ff9-e483-42cc-aaed-f376d46a6701@roeck-us.net>
Date: Sun, 8 Jun 2025 17:59:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 "Usyskin, Alexander" <alexander.usyskin@intel.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 "Poosa, Karthik" <karthik.poosa@intel.com>,
 "Abliyev, Reuven" <reuven.abliyev@intel.com>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250302140921.504304-1-alexander.usyskin@intel.com>
 <20250302140921.504304-2-alexander.usyskin@intel.com>
 <9dfb2954-fc3e-464c-a4fd-8c1a4dffa327@roeck-us.net>
 <CY5PR11MB63666AE267B9F1609213D93CED68A@CY5PR11MB6366.namprd11.prod.outlook.com>
 <87bjqyja7o.fsf@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <87bjqyja7o.fsf@bootlin.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/8/25 12:37, Miquel Raynal wrote:
> Hi Guenter,
> 
> On 08/06/2025 at 07:00:10 GMT, "Usyskin, Alexander" <alexander.usyskin@intel.com> wrote:
> 
>>> Subject: Re: [PATCH v6 01/11] mtd: core: always create master device
>>>
>>> Hi,
>>>
>>> On Sun, Mar 02, 2025 at 04:09:11PM +0200, Alexander Usyskin wrote:
>>>> Create master device without partition when
>>>> CONFIG_MTD_PARTITIONED_MASTER flag is unset.
>>>>
>>>> This streamlines device tree and allows to anchor
>>>> runtime power management on master device in all cases.
>>>>
>>>> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
>>>
>>> Several of my qemu boot tests fail to boot from mtd devices with this patch
>>> in the mainline kernel. Reverting it fixes the problem. As far as I can
>>> see this affects configurations with CONFIG_MTD_PARTITIONED_MASTER=y
>>> when
>>> trying to boot from an mtd partition other than mtdblock0, with the
>>> mtd partition data in devicetree (.../aspeed/openbmc-flash-layout.dtsi).
>>> Is there a guidance describing the changed behavior, by any chance,
>>> and how the boot command line now needs to look like when using one of
>>> the flash partitions as root file system ?
>>>
>>> Thanks,
>>> Guenter
>>
>> I've tried to make is as transparent as possible for the existing users.
>> Only change is that now every partition has master that is not partitioned.
>> Is the CONFIG_MTD_PARTITIONED_MASTER=n fixed the problem for you?
> 
> No change is expected, can you please describe the devices that you
> observe with and without the patch? Maybe there is something wrong in
> the core logic.
> 

I am trying to boot supermicro-x11spi-bmc in qemu from flash partition 6.
The qemu command line is something like

     qemu-system-arm -M supermicro-x11spi-bmc,fmc-model=n25q256a13,spi-model=n25q256a13 \
	-kernel arch/arm/boot/zImage -no-reboot -snapshot \
	-audio none \
	-drive file=/tmp/flash,format=raw,if=mtd,index=1 \
	-nic user \
	--append "root=/dev/mtdblock6 rootwait console=ttyS4,115200 earlycon=uart8250,mmio32,0x1e784000,115200n8" \
	-dtb arch/arm/boot/dts/aspeed/aspeed-bmc-supermicro-x11spi.dtb \
	-nographic -monitor null -serial stdio

This is with aspeed_g5_defconfig. Note that the flash models need to be specified.
The default flashes are no longer recognized when booting from qemu since commit
947c86e481a0 ("mtd: spi-nor: macronix: Drop the redundant flash info fields").

The above only works with this patch reverted (or with v6.15 and older, of course).

Guenter

