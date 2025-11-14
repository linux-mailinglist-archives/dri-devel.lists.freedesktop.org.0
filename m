Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF90C5D79A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 15:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9FB10EA7D;
	Fri, 14 Nov 2025 14:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KEXD/xPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CE810EA82
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 14:08:24 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4777a9aeedaso18383265e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 06:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763129303; x=1763734103; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dQGE869XwPrbfITm6+rRKPmdofC9CNjKr/RFgLwNDE8=;
 b=KEXD/xPTGdwnxRGVxjU2BJ3DLmdzG+0vJsiTfbBGJkFaGZK2cDBsJ6TwadbrXjPe70
 T7ycdtgcWO4P6aG9aGDveOtIaFx2Rl9A9ptb/shomuNKyAriKhYWU+rBSKMqO8FMe+f4
 tJ4xZ9cfjwJcjs4u97t1oe4XKBavG0758dPgR0x1J9xZ+cHXZtsit2bxZVIRDCXL1qlO
 Y036707i19C4bQyPkdPq8bhX3L+mLj0TTqT7hkOoccPM4se684xfMjEruml0QWLLHOBB
 2eMkiI9Rz5LLmXfXv7mreLpR9MrFL3z5UvIM/w4noo9olUfGJlugYDFEyZivqx/ws4/8
 1zwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763129303; x=1763734103;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dQGE869XwPrbfITm6+rRKPmdofC9CNjKr/RFgLwNDE8=;
 b=ZYm78PmRrj0K1Veofph+1bmT1TDLNdiW1zoyGd4WqCVnfErglfkBPB/eFxu+68nNW9
 t8wrLx0hxz8mBhhfrnWevFa24+KScqhoW3QyioOIXKVyTHrr7pJWm2X93Y1cBDi/ssWs
 Svp5D0YWPYB4jv90wiWJ0lR5yYZq/TzziIwzK5B8xsMezoL0tWbE0lwz2lX8zT43CHhN
 ldt5b5ddD+DhkamGPSOTHBHSSQIuDPIMa70Cj90Nhqcr+gx4n7k/lpbYioc9g+EBMvMl
 w+I39OUeGkQMvRWuz9nl90EcOpJmL7b+DRKgIYwBnePBtOZ4jtxFdG1VV0RPlZL7JObx
 hXEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrBMvR3U0r9D0S+z3DB946KppKOgMDTpAJoMiCPHsNjYryQSCR/DfAh+972IWraL6gw437X4qpaME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3w2CjR5PsnRlNTJT7nwONIro2IHXlK67+uTzCXyi20+pkveGR
 C6lDsD5IeJi5RTaqyypp1vzlmtNsHpfgrzJSHrHbffpdB2FqlZrbXbeeXq143Y1dwtA=
X-Gm-Gg: ASbGncuO2lXE3kKi77OGoktCg9mTNGctmpjt+Ja82LeRlOoeKc13wSbJBq1atxD9dyH
 IcFZKXEFzydK47hpAzNJ26gGnQh3n3hTE9hti2MkV9H5hlIALwmJ+dvxeh5e2b3k1zqWj2I0zqM
 HUvaAjM5vZL70bLyt+F0lfyK5vRwKANBvia9d9aK6A9Xe0P53WF2iaFGRNfX+ZOc7htxEERAWs/
 5L0I8Hcz8FghBLdy595h1iss5Kul8Xdw3fRvf7r256v8P27Pxm7BzTf2t3rgU4KJiXWNMyuwezw
 Q6addQrtG+hpQex4P7ufPVxi8pnmucV6e66x7tNsFSOKs09z73oOVPd1PLYQsqF5usyzk3bBfOi
 hYXbJRldn1F8TaM+STbMhQmTj/YdgseXs8CLUXnW99WGz8o65IDQpoJB5WVQ5N9aZp8vKyEIdoZ
 wuRuHo7F+gmUY=
X-Google-Smtp-Source: AGHT+IF17u7HkLMPS3PoRbYBxknl4lLOEHOvboqCZDbnnPQYWAGc4y9w1WxcVZBp7j1vLPMi9XtL3A==
X-Received: by 2002:a05:600c:138d:b0:475:d8b3:a9d5 with SMTP id
 5b1f17b1804b1-4778fe5de6fmr31074715e9.10.1763129301957; 
 Fri, 14 Nov 2025 06:08:21 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e45677sm156109035e9.8.2025.11.14.06.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Nov 2025 06:08:20 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 10ECF5F820;
 Fri, 14 Nov 2025 14:08:20 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Simon Richter <Simon.Richter@hogyros.de>,  Lucas De Marchi
 <lucas.demarchi@intel.com>,  Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org,  Bjorn Helgaas <bhelgaas@google.com>,
 David Airlie <airlied@gmail.com>,  dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,  intel-xe@lists.freedesktop.org,  Jani
 Nikula <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  linux-pci@vger.kernel.org,  Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  Simona Vetter <simona@ffwll.ch>,  Tvrtko
 Ursulin <tursulin@ursulin.net>,  Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>
Subject: Re: [PATCH v2 00/11] PCI: BAR resizing fix/rework
In-Reply-To: <7321c165-e38b-6016-54b0-48fcdfdaa199@linux.intel.com> ("Ilpo
 =?utf-8?Q?J=C3=A4rvinen=22's?= message of "Fri, 14 Nov 2025 14:48:46 +0200
 (EET)")
References: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
 <87jyzsq0nr.fsf@draig.linaro.org>
 <7321c165-e38b-6016-54b0-48fcdfdaa199@linux.intel.com>
User-Agent: mu4e 1.12.14-dev2; emacs 30.1
Date: Fri, 14 Nov 2025 14:08:19 +0000
Message-ID: <878qg8puzw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:

> On Fri, 14 Nov 2025, Alex Benn=C3=A9e wrote:
>
>> Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com> writes:
>>=20
>> > Hi all,
>> >
>> > Thanks to issue reports from Simon Richter and Alex Benn=C3=A9e, I
>> > discovered BAR resize rollback can corrupt the resource tree. As fixing
>> > corruption requires avoiding overlapping resource assignments, the
>> > correct fix can unfortunately results in worse user experience, what
>> > appeared to be "working" previously might no longer do so. Thus, I had
>> > to do a larger rework to pci_resize_resource() in order to properly
>> > restore resource states as it was prior to BAR resize.
>> <snip>
>> >
>> > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
>>=20
>> Ahh I have applied to 6.18-rc5 with minor conflicts and can verify that
>> on my AVA the AMD GPU shows up again and I can run inference jobs
>> against it. So for that case:
>>=20
>> Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> Thanks for testing! (And saving me the effort of backporting to 6.17 :-))
>
> I'd be interested to see the dmesg with this series applied just to check=
=20
> there isn't anything else I should still look at (even if it now appears=
=20
> to work).

Sure:

   [    0.000000] Booting Linux on physical CPU 0x0000100000 [0x413fd0c1]
   [    0.000000] Linux version 6.18.0-rc5-ajb-debian-bisect-00022-g832f811=
c236d (alex@gwenyn) (gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils fo=
r Debian) 2.44) #69 SMP Fri Nov 14 10:30:38 GMT 2025
   [    0.000000] KASLR enabled
   [    0.000000] efi: EFI v2.7 by EDK II
   [    0.000000] efi: TPMFinalLog=3D0xfffc0000 ACPI 2.0=3D0xfffe0018 SMBIO=
S 3.0=3D0xf9f60000 MEMATTR=3D0xf8a00018 ESRT=3D0xf91fbe18 MOKvar=3D0xf89700=
00 TPMEventLog=3D0xf88d0018 INITRD=3D0xf8a02918 RNG=3D0xfffef898 MEMRESERVE=
=3D0xf8a02098=20
   [    0.000000] random: crng init done
   [    0.000000] esrt: Reserving ESRT space from 0x00000000f91fbe18 to 0x0=
0000000f91fbe50.
   [    0.000000] ACPI: Early table checksum verification disabled
   [    0.000000] ACPI: RSDP 0x00000000FFFE0018 000024 (v02 Ampere)
   [    0.000000] ACPI: XSDT 0x00000000FFFEFE98 0000B4 (v01 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: FACP 0x00000000FFFEFB98 000114 (v06 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: DSDT 0x00000000F9EF0018 02C1BB (v02 Ampere Jade    =
 00000001 INTL 20201217)
   [    0.000000] ACPI: BERT 0x00000000FFFEFF98 000030 (v01 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: DBG2 0x00000000FFFEFA98 00005C (v00 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: GTDT 0x00000000FFFEE998 000110 (v03 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: SPCR 0x00000000FFFEFE18 000050 (v02 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: EINJ 0x00000000FFFEF598 000150 (v01 Ampere Altra   =
 00000001 INTL 20201217)
   [    0.000000] ACPI: HEST 0x00000000FFFEEB18 0001F4 (v01 Ampere Altra   =
 00000001 INTL 20201217)
   [    0.000000] ACPI: SDEI 0x00000000FFFEF998 000024 (v01 Ampere Altra   =
 00000001 INTL 20201217)
   [    0.000000] ACPI: SSDT 0x00000000FFFEFA18 00002D (v02 Ampere Altra   =
 00000001 INTL 20201217)
   [    0.000000] ACPI: TPM2 0x00000000FFFEFD18 00004C (v04 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: APIC 0x00000000FFFE7518 000AF4 (v05 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: PPTT 0x00000000FFFEEF18 000554 (v02 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: SLIT 0x00000000FFFEFD98 00002D (v01 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: SRAT 0x00000000FFFECE18 000370 (v03 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: PCCT 0x00000000FFFEE318 000576 (v02 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: IORT 0x00000000FFFED218 000498 (v00 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: MCFG 0x00000000FFFEF718 00008C (v01 Ampere Altra   =
 00000001 AMP. 01000013)
   [    0.000000] ACPI: BDAT 0x00000000FFFEF818 000030 (v01 Ampere Altra   =
 00000002 AMP. 01000013)
   [    0.000000] ACPI: SPCR: console: pl011,mmio32,0x100002600000,115200
   [    0.000000] ACPI: Use ACPI SPCR as default console: No
   [    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x88300000-0x883fffff]
   [    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x90000000-0xffffffff]
   [    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x80000000000-0x8007fffffff]
   [    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x80100000000-0x807ffffffff]
   [    0.000000] NUMA: Node 0 [mem 0x88300000-0x883fffff] + [mem 0x9000000=
0-0xffffffff] -> [mem 0x88300000-0xffffffff]
   [    0.000000] NUMA: Node 0 [mem 0x88300000-0xffffffff] + [mem 0x8000000=
0000-0x8007fffffff] -> [mem 0x88300000-0x8007fffffff]
   [    0.000000] NUMA: Node 0 [mem 0x88300000-0x8007fffffff] + [mem 0x8010=
0000000-0x807ffffffff] -> [mem 0x88300000-0x807ffffffff]
   [    0.000000] NODE_DATA(0) allocated [mem 0x807fc067200-0x807fc069fff]
   [    0.000000] Zone ranges:
   [    0.000000]   DMA      [mem 0x0000000088300000-0x00000000ffffffff]
   [    0.000000]   DMA32    empty
   [    0.000000]   Normal   [mem 0x0000000100000000-0x00000807ffffffff]
   [    0.000000] Movable zone start for each node
   [    0.000000] Early memory node ranges
   [    0.000000]   node   0: [mem 0x0000000088300000-0x00000000883fffff]
   [    0.000000]   node   0: [mem 0x0000000090000000-0x0000000091ffffff]
   [    0.000000]   node   0: [mem 0x0000000092000000-0x00000000927bffff]
   [    0.000000]   node   0: [mem 0x00000000927c0000-0x00000000f896ffff]
   [    0.000000]   node   0: [mem 0x00000000f8970000-0x00000000f898ffff]
   [    0.000000]   node   0: [mem 0x00000000f8990000-0x00000000f899ffff]
   [    0.000000]   node   0: [mem 0x00000000f89a0000-0x00000000f89fffff]
   [    0.000000]   node   0: [mem 0x00000000f8a00000-0x00000000f9196fff]
   [    0.000000]   node   0: [mem 0x00000000f9197000-0x00000000f91ecfff]
   [    0.000000]   node   0: [mem 0x00000000f91ed000-0x00000000f94cffff]
   [    0.000000]   node   0: [mem 0x00000000f94d0000-0x00000000f950ffff]
   [    0.000000]   node   0: [mem 0x00000000f9510000-0x00000000f98bffff]
   [    0.000000]   node   0: [mem 0x00000000f98c0000-0x00000000f98fffff]
   [    0.000000]   node   0: [mem 0x00000000f9900000-0x00000000f999ffff]
   [    0.000000]   node   0: [mem 0x00000000f99a0000-0x00000000f99dffff]
   [    0.000000]   node   0: [mem 0x00000000f99e0000-0x00000000f9f4ffff]
   [    0.000000]   node   0: [mem 0x00000000f9f50000-0x00000000f9f6ffff]
   [    0.000000]   node   0: [mem 0x00000000f9f70000-0x00000000fa0affff]
   [    0.000000]   node   0: [mem 0x00000000fa0b0000-0x00000000fa0effff]
   [    0.000000]   node   0: [mem 0x00000000fa0f0000-0x00000000fa1cffff]
   [    0.000000]   node   0: [mem 0x00000000fa1d0000-0x00000000fa26ffff]
   [    0.000000]   node   0: [mem 0x00000000fa270000-0x00000000fa33ffff]
   [    0.000000]   node   0: [mem 0x00000000fa340000-0x00000000fa4affff]
   [    0.000000]   node   0: [mem 0x00000000fa4b0000-0x00000000fa4bffff]
   [    0.000000]   node   0: [mem 0x00000000fa4c0000-0x00000000fa57ffff]
   [    0.000000]   node   0: [mem 0x00000000fa580000-0x00000000fa72ffff]
   [    0.000000]   node   0: [mem 0x00000000fa730000-0x00000000fa7cffff]
   [    0.000000]   node   0: [mem 0x00000000fa7d0000-0x00000000faa4ffff]
   [    0.000000]   node   0: [mem 0x00000000faa50000-0x00000000faaeffff]
   [    0.000000]   node   0: [mem 0x00000000faaf0000-0x00000000fab7ffff]
   [    0.000000]   node   0: [mem 0x00000000fab80000-0x00000000fac1ffff]
   [    0.000000]   node   0: [mem 0x00000000fac20000-0x00000000facaffff]
   [    0.000000]   node   0: [mem 0x00000000facb0000-0x00000000fad4ffff]
   [    0.000000]   node   0: [mem 0x00000000fad50000-0x00000000fae1ffff]
   [    0.000000]   node   0: [mem 0x00000000fae20000-0x00000000faebffff]
   [    0.000000]   node   0: [mem 0x00000000faec0000-0x00000000faf4ffff]
   [    0.000000]   node   0: [mem 0x00000000faf50000-0x00000000fafeffff]
   [    0.000000]   node   0: [mem 0x00000000faff0000-0x00000000ffefffff]
   [    0.000000]   node   0: [mem 0x00000000fff00000-0x00000000fff4ffff]
   [    0.000000]   node   0: [mem 0x00000000fff50000-0x00000000fffaffff]
   [    0.000000]   node   0: [mem 0x00000000fffb0000-0x00000000fffdffff]
   [    0.000000]   node   0: [mem 0x00000000fffe0000-0x00000000ffffffff]
   [    0.000000]   node   0: [mem 0x0000080000000000-0x000008007fffffff]
   [    0.000000]   node   0: [mem 0x0000080100000000-0x00000807ffffffff]
   [    0.000000] Initmem setup node 0 [mem 0x0000000088300000-0x00000807ff=
ffffff]
   [    0.000000] On node 0, zone DMA: 768 pages in unavailable ranges
   [    0.000000] On node 0, zone DMA: 31744 pages in unavailable ranges
   [    0.000000] cma: Reserved 64 MiB at 0x00000000fbe00000
   [    0.000000] psci: probing for conduit method from ACPI.
   [    0.000000] psci: PSCIv1.1 detected in firmware.
   [    0.000000] psci: Using standard PSCI v0.2 function IDs
   [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
   [    0.000000] psci: SMC Calling Convention v1.2
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x80000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x80100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x90000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x90100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0xe0000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0xe0100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0xf0000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0xf0100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x100000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x100100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x110000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x110100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x160000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x160100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x170000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x170100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x180000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x180100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x190000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x190100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x1e0000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x1e0100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x1f0000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x1f0100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x200000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x200100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x210000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x210100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x260000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x260100 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x270000 -> Node 0
   [    0.000000] ACPI: NUMA: SRAT: PXM 0 -> MPIDR 0x270100 -> Node 0
   [    0.000000] percpu: Embedded 34 pages/cpu s101656 r8192 d29416 u139264
   [    0.000000] pcpu-alloc: s101656 r8192 d29416 u139264 alloc=3D34*4096
   [    0.000000] pcpu-alloc: [0] 00 [0] 01 [0] 02 [0] 03 [0] 04 [0] 05 [0]=
 06 [0] 07=20
   [    0.000000] pcpu-alloc: [0] 08 [0] 09 [0] 10 [0] 11 [0] 12 [0] 13 [0]=
 14 [0] 15=20
   [    0.000000] pcpu-alloc: [0] 16 [0] 17 [0] 18 [0] 19 [0] 20 [0] 21 [0]=
 22 [0] 23=20
   [    0.000000] pcpu-alloc: [0] 24 [0] 25 [0] 26 [0] 27 [0] 28 [0] 29 [0]=
 30 [0] 31=20
   [    0.000000] Detected PIPT I-cache on CPU0
   [    0.000000] CPU features: detected: GICv3 CPU interface
   [    0.000000] CPU features: detected: Virtualization Host Extensions
   [    0.000000] CPU features: detected: Spectre-v4
   [    0.000000] CPU features: detected: Spectre-BHB
   [    0.000000] CPU features: kernel page table isolation forced ON by KA=
SLR
   [    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
   [    0.000000] CPU features: detected: ARM erratum 1418040
   [    0.000000] CPU features: detected: SSBS not fully self-synchronizing
   [    0.000000] alternatives: applying boot alternatives
   [    0.000000] Kernel command line: BOOT_IMAGE=3D/boot/vmlinux-6.18.0-rc=
5-ajb-debian-bisect-00022-g832f811c236d root=3DUUID=3D06e49159-b374-445c-bf=
5f-2bf93e3f4d6b ro pcie_aspm=3Doff amdgpu.aspm=3D0 amdgpu.runpm=3D0 amdgpu.=
gpu_recovery=3D1 acpi=3Don
   [    0.000000] PCIe ASPM is disabled
   [    0.000000] printk: log_buf_len individual max cpu contribution: 4096=
 bytes
   [    0.000000] printk: log_buf_len total cpu_extra contributions: 126976=
 bytes
   [    0.000000] printk: log_buf_len min size: 131072 bytes
   [    0.000000] printk: log buffer data + meta data: 262144 + 917504 =3D =
1179648 bytes
   [    0.000000] printk: early log buf free: 120448(91%)
   [    0.000000] Dentry cache hash table entries: 4194304 (order: 13, 3355=
4432 bytes, linear)
   [    0.000000] Inode-cache hash table entries: 2097152 (order: 12, 16777=
216 bytes, linear)
   [    0.000000] software IO TLB: area num 32.
   [    0.000000] software IO TLB: mapped [mem 0x00000000f48d0000-0x0000000=
0f88d0000] (64MB)
   [    0.000000] Fallback order for Node 0: 0=20
   [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 83=
23328
   [    0.000000] Policy zone: Normal
   [    0.000000] mem auto-init: stack:all(zero), heap alloc:on, heap free:=
off
   [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D3=
2, Nodes=3D1
   [    0.000000] ftrace: allocating 53421 entries in 210 pages
   [    0.000000] ftrace: allocated 210 pages with 4 groups
   [    0.000000] rcu: Hierarchical RCU implementation.
   [    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D256 to nr_cpu_i=
ds=3D32.
   [    0.000000] 	Rude variant of Tasks RCU enabled.
   [    0.000000] 	Tracing variant of Tasks RCU enabled.
   [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay i=
s 25 jiffies.
   [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_=
ids=3D32
   [    0.000000] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_=
cb_adjust=3D1 rcu_task_cpu_ids=3D32.
   [    0.000000] RCU Tasks Trace: Setting shift to 5 and lim to 1 rcu_task=
_cb_adjust=3D1 rcu_task_cpu_ids=3D32.
   [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
   [    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
   [    0.000000] GICv3: 672 SPIs implemented
   [    0.000000] GICv3: 0 Extended SPIs implemented
   [    0.000000] Root IRQ handler: gic_handle_irq
   [    0.000000] GICv3: GICv3 features: 16 PPIs
   [    0.000000] GICv3: GICD_CTLR.DS=3D0, SCR_EL3.FIQ=3D1
   [    0.000000] GICv3: CPU0: found redistributor 100000 region 0:0x000010=
0100540000
   [    0.000000] SRAT: PXM 0 -> ITS 0 -> Node 0
   [    0.000000] SRAT: PXM 0 -> ITS 1 -> Node 0
   [    0.000000] SRAT: PXM 0 -> ITS 2 -> Node 0
   [    0.000000] SRAT: PXM 0 -> ITS 3 -> Node 0
   [    0.000000] SRAT: PXM 0 -> ITS 4 -> Node 0
   [    0.000000] SRAT: PXM 0 -> ITS 5 -> Node 0
   [    0.000000] SRAT: PXM 0 -> ITS 6 -> Node 0
   [    0.000000] SRAT: PXM 0 -> ITS 7 -> Node 0
   [    0.000000] ITS [mem 0x100100040000-0x10010005ffff]
   [    0.000000] ITS@0x0000100100040000: allocated 8192 Devices @800002e00=
00 (indirect, esz 8, psz 64K, shr 1)
   [    0.000000] ITS@0x0000100100040000: allocated 32768 Interrupt Collect=
ions @800002f0000 (flat, esz 2, psz 64K, shr 1)
   [    0.000000] ITS [mem 0x100100060000-0x10010007ffff]
   [    0.000000] ITS@0x0000100100060000: allocated 8192 Devices @800003100=
00 (indirect, esz 8, psz 64K, shr 1)
   [    0.000000] ITS@0x0000100100060000: allocated 32768 Interrupt Collect=
ions @80000320000 (flat, esz 2, psz 64K, shr 1)
   [    0.000000] ITS [mem 0x100100080000-0x10010009ffff]
   [    0.000000] ITS@0x0000100100080000: allocated 8192 Devices @800003500=
00 (indirect, esz 8, psz 64K, shr 1)
   [    0.000000] ITS@0x0000100100080000: allocated 32768 Interrupt Collect=
ions @80000360000 (flat, esz 2, psz 64K, shr 1)
   [    0.000000] ITS [mem 0x1001000a0000-0x1001000bffff]
   [    0.000000] ITS@0x00001001000a0000: allocated 8192 Devices @800003800=
00 (indirect, esz 8, psz 64K, shr 1)
   [    0.000000] ITS@0x00001001000a0000: allocated 32768 Interrupt Collect=
ions @80000390000 (flat, esz 2, psz 64K, shr 1)
   [    0.000000] ITS [mem 0x1001000c0000-0x1001000dffff]
   [    0.000000] ITS@0x00001001000c0000: allocated 8192 Devices @800003b00=
00 (indirect, esz 8, psz 64K, shr 1)
   [    0.000000] ITS@0x00001001000c0000: allocated 32768 Interrupt Collect=
ions @800003c0000 (flat, esz 2, psz 64K, shr 1)
   [    0.000000] ITS [mem 0x1001000e0000-0x1001000fffff]
   [    0.000000] ITS@0x00001001000e0000: allocated 8192 Devices @800003e00=
00 (indirect, esz 8, psz 64K, shr 1)
   [    0.000000] ITS@0x00001001000e0000: allocated 32768 Interrupt Collect=
ions @800003f0000 (flat, esz 2, psz 64K, shr 1)
   [    0.000000] ITS [mem 0x100100100000-0x10010011ffff]
   [    0.000000] ITS@0x0000100100100000: allocated 8192 Devices @800008100=
00 (indirect, esz 8, psz 64K, shr 1)
   [    0.000000] ITS@0x0000100100100000: allocated 32768 Interrupt Collect=
ions @80000820000 (flat, esz 2, psz 64K, shr 1)
   [    0.000000] ITS [mem 0x100100120000-0x10010013ffff]
   [    0.000000] ITS@0x0000100100120000: allocated 8192 Devices @800008400=
00 (indirect, esz 8, psz 64K, shr 1)
   [    0.000000] ITS@0x0000100100120000: allocated 32768 Interrupt Collect=
ions @80000850000 (flat, esz 2, psz 64K, shr 1)
   [    0.000000] GICv3: using LPI property table @0x0000080000860000
   [    0.000000] GICv3: CPU0: using allocated LPI pending table @0x0000080=
000870000
   [    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on conten=
tion.
   [    0.000000] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.000000] arch_timer: cp15 timer running at 25.00MHz (phys).
   [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max=
_cycles: 0x5c40939b5, max_idle_ns: 440795202646 ns
   [    0.000000] sched_clock: 56 bits at 25MHz, resolution 40ns, wraps eve=
ry 4398046511100ns
   [    0.000159] Console: colour dummy device 80x25
   [    0.000209] ACPI: Core revision 20250807
   [    0.000483] Calibrating delay loop (skipped), value calculated using =
timer frequency.. 50.00 BogoMIPS (lpj=3D100000)
   [    0.000486] pid_max: default: 32768 minimum: 301
   [    0.000555] LSM: initializing lsm=3Dlockdown,capability,landlock,yama=
,apparmor,tomoyo,bpf,ima,evm
   [    0.000671] landlock: Up and running.
   [    0.000673] Yama: becoming mindful.
   [    0.000868] AppArmor: AppArmor initialized
   [    0.000954] TOMOYO Linux initialized
   [    0.001519] LSM support for eBPF active
   [    0.001677] Mount-cache hash table entries: 65536 (order: 7, 524288 b=
ytes, linear)
   [    0.001698] Mountpoint-cache hash table entries: 65536 (order: 7, 524=
288 bytes, linear)
   [    0.002435] rcu: Hierarchical SRCU implementation.
   [    0.002437] rcu: 	Max phase no-delay instances is 1000.
   [    0.002493] Timer migration: 2 hierarchy levels; 8 children per group=
; 2 crossnode level
   [    0.002798] fsl-mc MSI: ITS@0x100100040000 domain created
   [    0.002801] fsl-mc MSI: ITS@0x100100060000 domain created
   [    0.002803] fsl-mc MSI: ITS@0x100100080000 domain created
   [    0.002805] fsl-mc MSI: ITS@0x1001000a0000 domain created
   [    0.002807] fsl-mc MSI: ITS@0x1001000c0000 domain created
   [    0.002809] fsl-mc MSI: ITS@0x1001000e0000 domain created
   [    0.002810] fsl-mc MSI: ITS@0x100100100000 domain created
   [    0.002814] fsl-mc MSI: ITS@0x100100120000 domain created
   [    0.002827] Remapping and enabling EFI services.
   [    0.003337] smp: Bringing up secondary CPUs ...
   [    0.003599] Detected PIPT I-cache on CPU1
   [    0.003635] GICv3: CPU1: found redistributor 100100 region 0:0x000010=
0100560000
   [    0.003644] GICv3: CPU1: using allocated LPI pending table @0x0000080=
000880000
   [    0.003692] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.003701] CPU1: Booted secondary processor 0x0000100100 [0x413fd0c1]
   [    0.004054] Detected PIPT I-cache on CPU2
   [    0.004098] GICv3: CPU2: found redistributor 160000 region 0:0x000010=
01006c0000
   [    0.004108] GICv3: CPU2: using allocated LPI pending table @0x0000080=
000890000
   [    0.004162] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.004178] CPU2: Booted secondary processor 0x0000160000 [0x413fd0c1]
   [    0.004587] Detected PIPT I-cache on CPU3
   [    0.004622] GICv3: CPU3: found redistributor 160100 region 0:0x000010=
01006e0000
   [    0.004632] GICv3: CPU3: using allocated LPI pending table @0x0000080=
0008a0000
   [    0.004683] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.004693] CPU3: Booted secondary processor 0x0000160100 [0x413fd0c1]
   [    0.005039] Detected PIPT I-cache on CPU4
   [    0.005076] GICv3: CPU4: found redistributor 180000 region 0:0x000010=
0100740000
   [    0.005085] GICv3: CPU4: using allocated LPI pending table @0x0000080=
0008b0000
   [    0.005137] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.005151] CPU4: Booted secondary processor 0x0000180000 [0x413fd0c1]
   [    0.005586] Detected PIPT I-cache on CPU5
   [    0.005622] GICv3: CPU5: found redistributor 180100 region 0:0x000010=
0100760000
   [    0.005631] GICv3: CPU5: using allocated LPI pending table @0x0000080=
0008c0000
   [    0.005682] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.005693] CPU5: Booted secondary processor 0x0000180100 [0x413fd0c1]
   [    0.006044] Detected PIPT I-cache on CPU6
   [    0.006084] GICv3: CPU6: found redistributor 1e0000 region 0:0x000010=
01008c0000
   [    0.006094] GICv3: CPU6: using allocated LPI pending table @0x0000080=
0008d0000
   [    0.006147] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.006161] CPU6: Booted secondary processor 0x00001e0000 [0x413fd0c1]
   [    0.006588] Detected PIPT I-cache on CPU7
   [    0.006628] GICv3: CPU7: found redistributor 1e0100 region 0:0x000010=
01008e0000
   [    0.006637] GICv3: CPU7: using allocated LPI pending table @0x0000080=
0008e0000
   [    0.006688] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.006701] CPU7: Booted secondary processor 0x00001e0100 [0x413fd0c1]
   [    0.007045] Detected PIPT I-cache on CPU8
   [    0.007080] GICv3: CPU8: found redistributor 80000 region 0:0x0000100=
100340000
   [    0.007089] GICv3: CPU8: using allocated LPI pending table @0x0000080=
0008f0000
   [    0.007142] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.007157] CPU8: Booted secondary processor 0x0000080000 [0x413fd0c1]
   [    0.007586] Detected PIPT I-cache on CPU9
   [    0.007619] GICv3: CPU9: found redistributor 80100 region 0:0x0000100=
100360000
   [    0.007628] GICv3: CPU9: using allocated LPI pending table @0x0000080=
000900000
   [    0.007678] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.007688] CPU9: Booted secondary processor 0x0000080100 [0x413fd0c1]
   [    0.008041] Detected PIPT I-cache on CPU10
   [    0.008078] GICv3: CPU10: found redistributor e0000 region 0:0x000010=
01004c0000
   [    0.008088] GICv3: CPU10: using allocated LPI pending table @0x000008=
0000910000
   [    0.008142] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.008157] CPU10: Booted secondary processor 0x00000e0000 [0x413fd0c=
1]
   [    0.008664] Detected PIPT I-cache on CPU11
   [    0.008699] GICv3: CPU11: found redistributor e0100 region 0:0x000010=
01004e0000
   [    0.008709] GICv3: CPU11: using allocated LPI pending table @0x000008=
0000920000
   [    0.008761] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.008774] CPU11: Booted secondary processor 0x00000e0100 [0x413fd0c=
1]
   [    0.009281] Detected PIPT I-cache on CPU12
   [    0.009328] GICv3: CPU12: found redistributor 200000 region 0:0x00001=
00100940000
   [    0.009337] GICv3: CPU12: using allocated LPI pending table @0x000008=
0000930000
   [    0.009389] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.009403] CPU12: Booted secondary processor 0x0000200000 [0x413fd0c=
1]
   [    0.009873] Detected PIPT I-cache on CPU13
   [    0.009916] GICv3: CPU13: found redistributor 200100 region 0:0x00001=
00100960000
   [    0.009925] GICv3: CPU13: using allocated LPI pending table @0x000008=
0000940000
   [    0.009975] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.009989] CPU13: Booted secondary processor 0x0000200100 [0x413fd0c=
1]
   [    0.010475] Detected PIPT I-cache on CPU14
   [    0.010524] GICv3: CPU14: found redistributor 260000 region 0:0x00001=
00100ac0000
   [    0.010533] GICv3: CPU14: using allocated LPI pending table @0x000008=
0000950000
   [    0.010585] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.010599] CPU14: Booted secondary processor 0x0000260000 [0x413fd0c=
1]
   [    0.011072] Detected PIPT I-cache on CPU15
   [    0.011118] GICv3: CPU15: found redistributor 260100 region 0:0x00001=
00100ae0000
   [    0.011127] GICv3: CPU15: using allocated LPI pending table @0x000008=
0000960000
   [    0.011178] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.011191] CPU15: Booted secondary processor 0x0000260100 [0x413fd0c=
1]
   [    0.011675] Detected PIPT I-cache on CPU16
   [    0.011717] GICv3: CPU16: found redistributor 110000 region 0:0x00001=
00100580000
   [    0.011726] GICv3: CPU16: using allocated LPI pending table @0x000008=
0000970000
   [    0.011779] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.011793] CPU16: Booted secondary processor 0x0000110000 [0x413fd0c=
1]
   [    0.012272] Detected PIPT I-cache on CPU17
   [    0.012310] GICv3: CPU17: found redistributor 110100 region 0:0x00001=
001005a0000
   [    0.012320] GICv3: CPU17: using allocated LPI pending table @0x000008=
0000980000
   [    0.012370] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.012383] CPU17: Booted secondary processor 0x0000110100 [0x413fd0c=
1]
   [    0.012783] Detected PIPT I-cache on CPU18
   [    0.012827] GICv3: CPU18: found redistributor 170000 region 0:0x00001=
00100700000
   [    0.012837] GICv3: CPU18: using allocated LPI pending table @0x000008=
0000990000
   [    0.012890] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.012900] CPU18: Booted secondary processor 0x0000170000 [0x413fd0c=
1]
   [    0.013267] Detected PIPT I-cache on CPU19
   [    0.013309] GICv3: CPU19: found redistributor 170100 region 0:0x00001=
00100720000
   [    0.013319] GICv3: CPU19: using allocated LPI pending table @0x000008=
00009a0000
   [    0.013371] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.013384] CPU19: Booted secondary processor 0x0000170100 [0x413fd0c=
1]
   [    0.013883] Detected PIPT I-cache on CPU20
   [    0.013929] GICv3: CPU20: found redistributor 190000 region 0:0x00001=
00100780000
   [    0.013939] GICv3: CPU20: using allocated LPI pending table @0x000008=
00009b0000
   [    0.013991] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.014005] CPU20: Booted secondary processor 0x0000190000 [0x413fd0c=
1]
   [    0.014474] Detected PIPT I-cache on CPU21
   [    0.014517] GICv3: CPU21: found redistributor 190100 region 0:0x00001=
001007a0000
   [    0.014527] GICv3: CPU21: using allocated LPI pending table @0x000008=
00009c0000
   [    0.014577] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.014590] CPU21: Booted secondary processor 0x0000190100 [0x413fd0c=
1]
   [    0.015083] Detected PIPT I-cache on CPU22
   [    0.015132] GICv3: CPU22: found redistributor 1f0000 region 0:0x00001=
00100900000
   [    0.015142] GICv3: CPU22: using allocated LPI pending table @0x000008=
00009d0000
   [    0.015195] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.015209] CPU22: Booted secondary processor 0x00001f0000 [0x413fd0c=
1]
   [    0.015664] Detected PIPT I-cache on CPU23
   [    0.015709] GICv3: CPU23: found redistributor 1f0100 region 0:0x00001=
00100920000
   [    0.015719] GICv3: CPU23: using allocated LPI pending table @0x000008=
00009e0000
   [    0.015770] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.015783] CPU23: Booted secondary processor 0x00001f0100 [0x413fd0c=
1]
   [    0.016285] Detected PIPT I-cache on CPU24
   [    0.016328] GICv3: CPU24: found redistributor 90000 region 0:0x000010=
0100380000
   [    0.016338] GICv3: CPU24: using allocated LPI pending table @0x000008=
00009f0000
   [    0.016392] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.016406] CPU24: Booted secondary processor 0x0000090000 [0x413fd0c=
1]
   [    0.016869] Detected PIPT I-cache on CPU25
   [    0.016907] GICv3: CPU25: found redistributor 90100 region 0:0x000010=
01003a0000
   [    0.016917] GICv3: CPU25: using allocated LPI pending table @0x000008=
0000a00000
   [    0.016968] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.016982] CPU25: Booted secondary processor 0x0000090100 [0x413fd0c=
1]
   [    0.017474] Detected PIPT I-cache on CPU26
   [    0.017520] GICv3: CPU26: found redistributor f0000 region 0:0x000010=
0100500000
   [    0.017530] GICv3: CPU26: using allocated LPI pending table @0x000008=
0000a10000
   [    0.017584] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.017599] CPU26: Booted secondary processor 0x00000f0000 [0x413fd0c=
1]
   [    0.018068] Detected PIPT I-cache on CPU27
   [    0.018109] GICv3: CPU27: found redistributor f0100 region 0:0x000010=
0100520000
   [    0.018120] GICv3: CPU27: using allocated LPI pending table @0x000008=
0000a20000
   [    0.018172] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.018185] CPU27: Booted secondary processor 0x00000f0100 [0x413fd0c=
1]
   [    0.018670] Detected PIPT I-cache on CPU28
   [    0.018724] GICv3: CPU28: found redistributor 210000 region 0:0x00001=
00100980000
   [    0.018734] GICv3: CPU28: using allocated LPI pending table @0x000008=
0000a30000
   [    0.018786] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.018800] CPU28: Booted secondary processor 0x0000210000 [0x413fd0c=
1]
   [    0.019277] Detected PIPT I-cache on CPU29
   [    0.019326] GICv3: CPU29: found redistributor 210100 region 0:0x00001=
001009a0000
   [    0.019336] GICv3: CPU29: using allocated LPI pending table @0x000008=
0000a40000
   [    0.019386] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.019398] CPU29: Booted secondary processor 0x0000210100 [0x413fd0c=
1]
   [    0.019873] Detected PIPT I-cache on CPU30
   [    0.019930] GICv3: CPU30: found redistributor 270000 region 0:0x00001=
00100b00000
   [    0.019940] GICv3: CPU30: using allocated LPI pending table @0x000008=
0000a50000
   [    0.019993] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.020008] CPU30: Booted secondary processor 0x0000270000 [0x413fd0c=
1]
   [    0.020473] Detected PIPT I-cache on CPU31
   [    0.020526] GICv3: CPU31: found redistributor 270100 region 0:0x00001=
00100b20000
   [    0.020536] GICv3: CPU31: using allocated LPI pending table @0x000008=
0000a60000
   [    0.020586] arch_timer: Enabling local workaround for ARM erratum 141=
8040
   [    0.020599] CPU31: Booted secondary processor 0x0000270100 [0x413fd0c=
1]
   [    0.020730] smp: Brought up 1 node, 32 CPUs
   [    0.020733] SMP: Total of 32 processors activated.
   [    0.020734] CPU: All CPU(s) started at EL2
   [    0.020736] CPU features: detected: 32-bit EL0 Support
   [    0.020738] CPU features: detected: Data cache clean to the PoU not r=
equired for I/D coherence
   [    0.020739] CPU features: detected: Common not Private translations
   [    0.020740] CPU features: detected: CRC32 instructions
   [    0.020742] CPU features: detected: Data cache clean to Point of Pers=
istence
   [    0.020743] CPU features: detected: Enhanced Virtualization Traps
   [    0.020745] CPU features: detected: RCpc load-acquire (LDAPR)
   [    0.020746] CPU features: detected: LSE atomic instructions
   [    0.020747] CPU features: detected: Privileged Access Never
   [    0.020749] CPU features: detected: PMUv3
   [    0.020749] CPU features: detected: RAS Extension Support
   [    0.020752] CPU features: detected: Speculative Store Bypassing Safe =
(SSBS)
   [    0.020927] alternatives: applying system-wide alternatives
   [    0.023145] CPU features: detected: Hardware dirty bit management on =
CPU0-31
   [    0.064386] node 0 deferred pages initialised in 40ms
   [    0.064425] Memory: 32433968K/33293312K available (16960K kernel code=
, 3238K rwdata, 6152K rodata, 3008K init, 661K bss, 775224K reserved, 65536=
K cma-reserved)
   [    0.064684] devtmpfs: initialized
   [    0.068718] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffff=
ffff, max_idle_ns: 7645041785100000 ns
   [    0.068739] posixtimers hash table entries: 16384 (order: 6, 262144 b=
ytes, linear)
   [    0.068820] futex hash table entries: 8192 (524288 bytes on 1 NUMA no=
des, total 512 KiB, linear).
   [    0.069074] 2G module region forced by RANDOMIZE_MODULE_REGION_FULL
   [    0.069076] 0 pages in range for non-PLT usage
   [    0.069077] 516720 pages in range for PLT usage
   [    0.069165] pinctrl core: initialized pinctrl subsystem
   [    0.069405] SMBIOS 3.3.0 present.
   [    0.069412] DMI: ADLINK AVA Developer Platform/AVA Developer Platform=
, BIOS TianoCore 2.04.100.07 (SYS: 2.06.20220308) 09/08/2022
   [    0.069454] DMI: Memory slots populated: 2/6
   [    0.071110] NET: Registered PF_NETLINK/PF_ROUTE protocol family
   [    0.071780] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic all=
ocations
   [    0.072112] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for at=
omic allocations
   [    0.072429] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for =
atomic allocations
   [    0.072442] audit: initializing netlink subsys (disabled)
   [    0.072507] audit: type=3D2000 audit(0.072:1): state=3Dinitialized au=
dit_enabled=3D0 res=3D1
   [    0.072670] thermal_sys: Registered thermal governor 'fair_share'
   [    0.072672] thermal_sys: Registered thermal governor 'bang_bang'
   [    0.072673] thermal_sys: Registered thermal governor 'step_wise'
   [    0.072674] thermal_sys: Registered thermal governor 'user_space'
   [    0.072675] thermal_sys: Registered thermal governor 'power_allocator'
   [    0.072690] cpuidle: using governor ladder
   [    0.072698] cpuidle: using governor menu
   [    0.072925] Detected 15 PCC Subspaces
   [    0.072927] Registering PCC driver as Mailbox controller
   [    0.072995] hw-breakpoint: found 6 breakpoint and 4 watchpoint regist=
ers.
   [    0.073296] ASID allocator initialised with 32768 entries
   [    0.073364] ACPI FADT declares the system doesn't support PCIe ASPM, =
so disable it
   [    0.073366] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
   [    0.073441] Serial: AMBA PL011 UART driver
   [    0.075664] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 p=
ages
   [    0.075667] HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
   [    0.075669] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 p=
ages
   [    0.075670] HugeTLB: 0 KiB vmemmap can be freed for a 32.0 MiB page
   [    0.075671] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 p=
ages
   [    0.075672] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
   [    0.075673] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 p=
ages
   [    0.075675] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
   [    0.076545] ACPI: Added _OSI(Module Device)
   [    0.076547] ACPI: Added _OSI(Processor Device)
   [    0.076549] ACPI: Added _OSI(Processor Aggregator Device)
   [    0.093481] ACPI: 2 ACPI AML tables successfully acquired and loaded
   [    0.095865] ACPI: Interpreter enabled
   [    0.095867] ACPI: Using GIC for interrupt routing
   [    0.095883] ACPI: MCFG table detected, 6 entries
   [    0.096028] HEST: Table parsing has been initialized.
   [    0.096055] sdei: SDEIv1.0 (0x0) detected in firmware.
   [    0.096681] {1}[Hardware Error]: Hardware error from APEI Generic Har=
dware Error Source: 0
   [    0.096683] {1}[Hardware Error]: event severity: recoverable
   [    0.096685] {1}[Hardware Error]:  Error 0, type: recoverable
   [    0.096687] {1}[Hardware Error]:   section type: unknown, e8ed898d-df=
16-43cc-8ecc-54f060ef157f
   [    0.096689] {1}[Hardware Error]:   section length: 0x30
   [    0.096692] {1}[Hardware Error]:   00000000: 00000005 ec30000e 000401=
10 80001001  ......0.........
   [    0.096694] {1}[Hardware Error]:   00000010: 00000300 00000000 000000=
00 00000000  ................
   [    0.096696] {1}[Hardware Error]:   00000020: 00000000 00000000 000000=
00 00000000  ................
   [    0.096775] GHES: APEI firmware first mode is enabled by APEI bit.
   [    0.096781] ACPI: IORT: SMMU-v3[33ffe0000000] Mapped to Proximity dom=
ain 0
   [    0.096814] ACPI: IORT: SMMU-v3[37ffe0000000] Mapped to Proximity dom=
ain 0
   [    0.096833] ACPI: IORT: SMMU-v3[3fffe0000000] Mapped to Proximity dom=
ain 0
   [    0.096850] ACPI: IORT: SMMU-v3[23ffe0000000] Mapped to Proximity dom=
ain 0
   [    0.096868] ACPI: IORT: SMMU-v3[2bffe0000000] Mapped to Proximity dom=
ain 0
   [    0.096885] ACPI: IORT: SMMU-v3[2fffe0000000] Mapped to Proximity dom=
ain 0
   [    0.117299] ACPI: CPU8 has been hot-added
   [    0.117331] ACPI: CPU9 has been hot-added
   [    0.117357] ACPI: CPU24 has been hot-added
   [    0.117382] ACPI: CPU25 has been hot-added
   [    0.117440] ACPI: CPU10 has been hot-added
   [    0.117471] ACPI: CPU11 has been hot-added
   [    0.117499] ACPI: CPU26 has been hot-added
   [    0.117525] ACPI: CPU27 has been hot-added
   [    0.117550] ACPI: CPU0 has been hot-added
   [    0.117574] ACPI: CPU1 has been hot-added
   [    0.117597] ACPI: CPU16 has been hot-added
   [    0.117628] ACPI: CPU17 has been hot-added
   [    0.117686] ACPI: CPU2 has been hot-added
   [    0.117713] ACPI: CPU3 has been hot-added
   [    0.117736] ACPI: CPU18 has been hot-added
   [    0.117761] ACPI: CPU19 has been hot-added
   [    0.117785] ACPI: CPU4 has been hot-added
   [    0.117811] ACPI: CPU5 has been hot-added
   [    0.117834] ACPI: CPU20 has been hot-added
   [    0.117859] ACPI: CPU21 has been hot-added
   [    0.117917] ACPI: CPU6 has been hot-added
   [    0.117942] ACPI: CPU7 has been hot-added
   [    0.117965] ACPI: CPU22 has been hot-added
   [    0.117990] ACPI: CPU23 has been hot-added
   [    0.118014] ACPI: CPU12 has been hot-added
   [    0.118037] ACPI: CPU13 has been hot-added
   [    0.118065] ACPI: CPU28 has been hot-added
   [    0.118092] ACPI: CPU29 has been hot-added
   [    0.118151] ACPI: CPU14 has been hot-added
   [    0.118178] ACPI: CPU15 has been hot-added
   [    0.118203] ACPI: CPU30 has been hot-added
   [    0.118228] ACPI: CPU31 has been hot-added
   [    0.120781] ARMH0011:00: ttyAMA0 at MMIO 0x100002600000 (irq =3D 52, =
base_baud =3D 0) is a SBSA
   [    0.120840] printk: console [ttyAMA0] enabled
   [    0.128848] ARMH0011:01: ttyAMA1 at MMIO 0x100002620000 (irq =3D 53, =
base_baud =3D 0) is a SBSA
   [    0.130471] ACPI: PCI Root Bridge [PCI0] (domain 000c [bus 00-ff])
   [    0.130482] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig Segmen=
ts MSI HPX-Type3]
   [    0.130485] acpi PNP0A08:00: _OSC: not requesting OS control; OS requ=
ires [ExtendedConfig ASPM ClockPM MSI]
   [    0.130543] acpi PNP0A08:00: FADT indicates ASPM is unsupported, usin=
g BIOS configuration
   [    0.130548] acpi PNP0A08:00: MCFG quirk: ECAM at [mem 0x33fff0000000-=
0x33ffffffffff] for [bus 00-ff] with 0xffffa00133583ec8
   [    0.131613] acpi PNP0A08:00: ECAM area [mem 0x33fff0000000-0x33ffffff=
ffff] reserved by PNP0C02:00
   [    0.131627] acpi PNP0A08:00: ECAM at [mem 0x33fff0000000-0x33ffffffff=
ff] for [bus 00-ff]
   [    0.131713] PCI host bridge to bus 000c:00
   [    0.131735] pci_bus 000c:00: root bus resource [mem 0x40000000-0x4fff=
ffff window]
   [    0.131738] pci_bus 000c:00: root bus resource [mem 0x300000000000-0x=
33ffdfffffff window]
   [    0.131740] pci_bus 000c:00: root bus resource [bus 00-ff]
   [    0.131743] pci_bus 000c:00: scanning bus
   [    0.131752] Write combining PCI maps disabled due to hardware erratum
   [    0.131754] pci 000c:00:00.0: [1def:e100] type 00 class 0x060000 conv=
entional PCI endpoint
   [    0.131856] pci 000c:00:01.0: [1def:e101] type 01 class 0x060400 PCIe=
 Root Port
   [    0.131868] pci 000c:00:01.0: PCI bridge to [bus 01]
   [    0.131910] pci 000c:00:01.0: supports D1 D2
   [    0.131912] pci 000c:00:01.0: PME# supported from D0 D1 D3hot
   [    0.131915] pci 000c:00:01.0: PME# disabled
   [    0.132009] pci_bus 000c:00: fixups for bus
   [    0.132011] pci 000c:00:01.0: scanning [bus 01-01] behind bridge, pas=
s 0
   [    0.132032] pci_bus 000c:01: scanning bus
   [    0.134082] pci_bus 000c:01: fixups for bus
   [    0.134083] pci_bus 000c:01: bus scan returning with max=3D01
   [    0.134099] pci 000c:00:01.0: scanning [bus 01-01] behind bridge, pas=
s 1
   [    0.134103] pci_bus 000c:00: bus scan returning with max=3D01
   [    0.134104] pci_bus 000c:00: on NUMA node 0
   [    0.134108] pci 000c:00:01.0: bridge window [io  0x1000-0x0fff] to [b=
us 01] add_size 1000
   [    0.134112] pci 000c:00:01.0: bridge window [mem 0x00100000-0x000ffff=
f 64bit pref] to [bus 01] add_size 200000 add_align 100000
   [    0.134116] pci 000c:00:01.0: bridge window [mem 0x00100000-0x000ffff=
f] to [bus 01] add_size 200000 add_align 100000
   [    0.134121] pci 000c:00:01.0: bridge window [mem 0x40000000-0x401ffff=
f]: assigned
   [    0.134124] pci 000c:00:01.0: bridge window [mem 0x300000000000-0x300=
0001fffff 64bit pref]: assigned
   [    0.134126] pci 000c:00:01.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.134129] pci 000c:00:01.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.134132] pci 000c:00:01.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.134133] pci 000c:00:01.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.134135] pci 000c:00:01.0: bridge window [io  size 0x1000]: ignori=
ng failure in optional allocation
   [    0.134138] pci 000c:00:01.0: PCI bridge to [bus 01]
   [    0.134140] pci 000c:00:01.0:   bridge window [mem 0x40000000-0x401ff=
fff]
   [    0.134143] pci 000c:00:01.0:   bridge window [mem 0x300000000000-0x3=
000001fffff 64bit pref]
   [    0.134146] pci_bus 000c:00: Some PCI device resources are unassigned=
, try booting with pci=3Drealloc
   [    0.134147] pci_bus 000c:00: resource 4 [mem 0x40000000-0x4fffffff wi=
ndow]
   [    0.134149] pci_bus 000c:00: resource 5 [mem 0x300000000000-0x33ffdff=
fffff window]
   [    0.134151] pci_bus 000c:01: resource 0 [io  size 0x1000]
   [    0.134153] pci_bus 000c:01: resource 1 [mem 0x40000000-0x401fffff]
   [    0.134155] pci_bus 000c:01: resource 2 [mem 0x300000000000-0x3000001=
fffff 64bit pref]
   [    0.134202] ACPI: PCI Root Bridge [PCI1] (domain 000d [bus 00-ff])
   [    0.134209] acpi PNP0A08:01: _OSC: OS supports [ExtendedConfig Segmen=
ts MSI HPX-Type3]
   [    0.134212] acpi PNP0A08:01: _OSC: not requesting OS control; OS requ=
ires [ExtendedConfig ASPM ClockPM MSI]
   [    0.134269] acpi PNP0A08:01: FADT indicates ASPM is unsupported, usin=
g BIOS configuration
   [    0.134272] acpi PNP0A08:01: MCFG quirk: ECAM at [mem 0x37fff0000000-=
0x37ffffffffff] for [bus 00-ff] with 0xffffa00133583ec8
   [    0.135327] acpi PNP0A08:01: ECAM area [mem 0x37fff0000000-0x37ffffff=
ffff] reserved by PNP0C02:00
   [    0.135340] acpi PNP0A08:01: ECAM at [mem 0x37fff0000000-0x37ffffffff=
ff] for [bus 00-ff]
   [    0.135417] PCI host bridge to bus 000d:00
   [    0.135438] pci_bus 000d:00: root bus resource [mem 0x50000000-0x5fff=
ffff window]
   [    0.135440] pci_bus 000d:00: root bus resource [mem 0x340000000000-0x=
37ffdfffffff window]
   [    0.135442] pci_bus 000d:00: root bus resource [bus 00-ff]
   [    0.135444] pci_bus 000d:00: scanning bus
   [    0.135450] pci 000d:00:00.0: [1def:e100] type 00 class 0x060000 conv=
entional PCI endpoint
   [    0.135529] pci 000d:00:01.0: [1def:e101] type 01 class 0x060400 PCIe=
 Root Port
   [    0.135537] pci 000d:00:01.0: PCI bridge to [bus 01-03]
   [    0.135539] pci 000d:00:01.0:   bridge window [io  0xe000-0xefff]
   [    0.135541] pci 000d:00:01.0:   bridge window [mem 0x50000000-0x502ff=
fff]
   [    0.135545] pci 000d:00:01.0:   bridge window [mem 0x340000000000-0x3=
400101fffff 64bit pref]
   [    0.135568] pci 000d:00:01.0: supports D1 D2
   [    0.135569] pci 000d:00:01.0: PME# supported from D0 D1 D3hot
   [    0.135572] pci 000d:00:01.0: PME# disabled
   [    0.135646] pci_bus 000d:00: fixups for bus
   [    0.135648] pci 000d:00:01.0: scanning [bus 01-03] behind bridge, pas=
s 0
   [    0.135665] pci_bus 000d:01: scanning bus
   [    0.135687] pci 000d:01:00.0: [1002:1478] type 01 class 0x060400 PCIe=
 Switch Upstream Port
   [    0.135710] pci 000d:01:00.0: BAR 0 [mem 0x50200000-0x50203fff]
   [    0.135715] pci 000d:01:00.0: PCI bridge to [bus 02-03]
   [    0.135721] pci 000d:01:00.0:   bridge window [io  0x5fffe000-0x5fffe=
fff]
   [    0.135724] pci 000d:01:00.0:   bridge window [mem 0x50000000-0x501ff=
fff]
   [    0.135734] pci 000d:01:00.0:   bridge window [mem 0x340000000000-0x3=
400101fffff 64bit pref]
   [    0.135821] pci 000d:01:00.0: PME# supported from D0 D3hot D3cold
   [    0.135825] pci 000d:01:00.0: PME# disabled
   [    0.135905] pci 000d:01:00.0: 63.008 Gb/s available PCIe bandwidth, l=
imited by 8.0 GT/s PCIe x8 link at 000d:00:01.0 (capable of 126.024 Gb/s wi=
th 16.0 GT/s PCIe x8 link)
   [    0.135967] pci_bus 000d:01: fixups for bus
   [    0.135969] pci 000d:01:00.0: scanning [bus 02-03] behind bridge, pas=
s 0
   [    0.136005] pci_bus 000d:02: scanning bus
   [    0.136022] pci 000d:02:00.0: [1002:1479] type 01 class 0x060400 PCIe=
 Switch Downstream Port
   [    0.136047] pci 000d:02:00.0: PCI bridge to [bus 03]
   [    0.136053] pci 000d:02:00.0:   bridge window [io  0x5fffe000-0x5fffe=
fff]
   [    0.136057] pci 000d:02:00.0:   bridge window [mem 0x50000000-0x501ff=
fff]
   [    0.136067] pci 000d:02:00.0:   bridge window [mem 0x340000000000-0x3=
400101fffff 64bit pref]
   [    0.136158] pci 000d:02:00.0: PME# supported from D0 D3hot D3cold
   [    0.136161] pci 000d:02:00.0: PME# disabled
   [    0.136323] pci_bus 000d:02: fixups for bus
   [    0.136325] pci 000d:02:00.0: scanning [bus 03-03] behind bridge, pas=
s 0
   [    0.136361] pci_bus 000d:03: scanning bus
   [    0.136378] pci 000d:03:00.0: [1002:7480] type 00 class 0x030000 PCIe=
 Legacy Endpoint
   [    0.136415] pci 000d:03:00.0: BAR 0 [mem 0x340000000000-0x34000ffffff=
f 64bit pref]
   [    0.136419] pci 000d:03:00.0: BAR 2 [mem 0x340010000000-0x3400101ffff=
f 64bit pref]
   [    0.136422] pci 000d:03:00.0: BAR 4 [io  0x5fffe000-0x5fffe0ff]
   [    0.136425] pci 000d:03:00.0: BAR 5 [mem 0x50000000-0x500fffff]
   [    0.136428] pci 000d:03:00.0: ROM [mem 0xfffe0000-0xffffffff pref]
   [    0.136528] pci 000d:03:00.0: PME# supported from D1 D2 D3hot D3cold
   [    0.136531] pci 000d:03:00.0: PME# disabled
   [    0.136621] pci 000d:03:00.0: 63.008 Gb/s available PCIe bandwidth, l=
imited by 8.0 GT/s PCIe x8 link at 000d:00:01.0 (capable of 126.024 Gb/s wi=
th 16.0 GT/s PCIe x8 link)
   [    0.136725] pci 000d:03:00.1: [1002:ab30] type 00 class 0x040300 PCIe=
 Legacy Endpoint
   [    0.136761] pci 000d:03:00.1: BAR 0 [mem 0x50100000-0x50103fff]
   [    0.136829] pci 000d:03:00.1: PME# supported from D1 D2 D3hot D3cold
   [    0.136832] pci 000d:03:00.1: PME# disabled
   [    0.136935] pci_bus 000d:03: fixups for bus
   [    0.136936] pci_bus 000d:03: bus scan returning with max=3D03
   [    0.136941] pci 000d:02:00.0: scanning [bus 03-03] behind bridge, pas=
s 1
   [    0.136946] pci_bus 000d:02: bus scan returning with max=3D03
   [    0.136951] pci 000d:01:00.0: scanning [bus 02-03] behind bridge, pas=
s 1
   [    0.136956] pci_bus 000d:01: bus scan returning with max=3D03
   [    0.136959] pci 000d:00:01.0: scanning [bus 01-03] behind bridge, pas=
s 1
   [    0.136961] pci_bus 000d:00: bus scan returning with max=3D03
   [    0.136963] pci_bus 000d:00: on NUMA node 0
   [    0.136966] pci 000d:02:00.0: bridge window [mem 0x08000000-0x181ffff=
f 64bit pref] to [bus 03] requires relaxed alignment rules
   [    0.136970] pci 000d:02:00.0: bridge window [mem 0x00100000-0x002ffff=
f] to [bus 03] requires relaxed alignment rules
   [    0.136972] pci 000d:02:00.0: bridge window [mem 0x00100000-0x002ffff=
f] to [bus 03] requires relaxed alignment rules
   [    0.136979] pci 000d:00:01.0: bridge window [mem 0x340000000000-0x340=
017ffffff 64bit pref]: assigned
   [    0.136982] pci 000d:00:01.0: bridge window [mem 0x50000000-0x502ffff=
f]: assigned
   [    0.136984] pci 000d:00:01.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.136986] pci 000d:00:01.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.136988] pci 000d:00:01.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.136989] pci 000d:00:01.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.136993] pci 000d:01:00.0: bridge window [mem 0x340000000000-0x340=
017ffffff 64bit pref]: assigned
   [    0.136995] pci 000d:01:00.0: bridge window [mem 0x50000000-0x501ffff=
f]: assigned
   [    0.136996] pci 000d:01:00.0: BAR 0 [mem 0x50200000-0x50203fff]: assi=
gned
   [    0.137001] pci 000d:01:00.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.137002] pci 000d:01:00.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.137004] pci 000d:01:00.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.137006] pci 000d:01:00.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.137008] pci 000d:02:00.0: bridge window [mem 0x340000000000-0x340=
0101fffff 64bit pref]: assigned
   [    0.137010] pci 000d:02:00.0: bridge window [mem 0x50000000-0x501ffff=
f]: assigned
   [    0.137012] pci 000d:02:00.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.137014] pci 000d:02:00.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.137016] pci 000d:02:00.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.137017] pci 000d:02:00.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.137021] pci 000d:03:00.0: BAR 0 [mem 0x340000000000-0x34000ffffff=
f 64bit pref]: assigned
   [    0.137029] pci 000d:03:00.0: BAR 2 [mem 0x340010000000-0x3400101ffff=
f 64bit pref]: assigned
   [    0.137038] pci 000d:03:00.0: BAR 5 [mem 0x50000000-0x500fffff]: assi=
gned
   [    0.137042] pci 000d:03:00.0: ROM [mem 0x50100000-0x5011ffff pref]: a=
ssigned
   [    0.137044] pci 000d:03:00.1: BAR 0 [mem 0x50120000-0x50123fff]: assi=
gned
   [    0.137048] pci 000d:03:00.0: BAR 4 [io  size 0x0100]: can't assign; =
no space
   [    0.137049] pci 000d:03:00.0: BAR 4 [io  size 0x0100]: failed to assi=
gn
   [    0.137052] pci 000d:03:00.0: BAR 4 [io  size 0x0100]: can't assign; =
no space
   [    0.137053] pci 000d:03:00.0: BAR 4 [io  size 0x0100]: failed to assi=
gn
   [    0.137055] pci 000d:02:00.0: PCI bridge to [bus 03]
   [    0.137059] pci 000d:02:00.0:   bridge window [mem 0x50000000-0x501ff=
fff]
   [    0.137062] pci 000d:02:00.0:   bridge window [mem 0x340000000000-0x3=
400101fffff 64bit pref]
   [    0.137067] pci 000d:01:00.0: PCI bridge to [bus 02-03]
   [    0.137070] pci 000d:01:00.0:   bridge window [mem 0x50000000-0x501ff=
fff]
   [    0.137073] pci 000d:01:00.0:   bridge window [mem 0x340000000000-0x3=
40017ffffff 64bit pref]
   [    0.137078] pci 000d:00:01.0: PCI bridge to [bus 01-03]
   [    0.137080] pci 000d:00:01.0:   bridge window [mem 0x50000000-0x502ff=
fff]
   [    0.137082] pci 000d:00:01.0:   bridge window [mem 0x340000000000-0x3=
40017ffffff 64bit pref]
   [    0.137085] pci_bus 000d:00: Some PCI device resources are unassigned=
, try booting with pci=3Drealloc
   [    0.137087] pci_bus 000d:00: resource 4 [mem 0x50000000-0x5fffffff wi=
ndow]
   [    0.137089] pci_bus 000d:00: resource 5 [mem 0x340000000000-0x37ffdff=
fffff window]
   [    0.137091] pci_bus 000d:01: resource 0 [io  size 0x1000]
   [    0.137092] pci_bus 000d:01: resource 1 [mem 0x50000000-0x502fffff]
   [    0.137094] pci_bus 000d:01: resource 2 [mem 0x340000000000-0x340017f=
fffff 64bit pref]
   [    0.137096] pci_bus 000d:02: resource 0 [io  size 0x1000]
   [    0.137097] pci_bus 000d:02: resource 1 [mem 0x50000000-0x501fffff]
   [    0.137099] pci_bus 000d:02: resource 2 [mem 0x340000000000-0x340017f=
fffff 64bit pref]
   [    0.137100] pci_bus 000d:03: resource 0 [io  size 0x1000]
   [    0.137102] pci_bus 000d:03: resource 1 [mem 0x50000000-0x501fffff]
   [    0.137104] pci_bus 000d:03: resource 2 [mem 0x340000000000-0x3400101=
fffff 64bit pref]
   [    0.137168] ACPI: PCI Root Bridge [PCI3] (domain 0000 [bus 00-ff])
   [    0.137176] acpi PNP0A08:03: _OSC: OS supports [ExtendedConfig Segmen=
ts MSI HPX-Type3]
   [    0.137178] acpi PNP0A08:03: _OSC: not requesting OS control; OS requ=
ires [ExtendedConfig ASPM ClockPM MSI]
   [    0.137238] acpi PNP0A08:03: FADT indicates ASPM is unsupported, usin=
g BIOS configuration
   [    0.137241] acpi PNP0A08:03: MCFG quirk: ECAM at [mem 0x3ffff0000000-=
0x3fffffffffff] for [bus 00-ff] with 0xffffa00133583ec8
   [    0.138281] acpi PNP0A08:03: ECAM area [mem 0x3ffff0000000-0x3fffffff=
ffff] reserved by PNP0C02:00
   [    0.138295] acpi PNP0A08:03: ECAM at [mem 0x3ffff0000000-0x3fffffffff=
ff] for [bus 00-ff]
   [    0.138372] PCI host bridge to bus 0000:00
   [    0.138394] pci_bus 0000:00: root bus resource [mem 0x70000000-0x7fff=
ffff window]
   [    0.138396] pci_bus 0000:00: root bus resource [mem 0x3c0000000000-0x=
3fffdfffffff window]
   [    0.138398] pci_bus 0000:00: root bus resource [bus 00-ff]
   [    0.138400] pci_bus 0000:00: scanning bus
   [    0.138405] pci 0000:00:00.0: [1def:e100] type 00 class 0x060000 conv=
entional PCI endpoint
   [    0.138484] pci 0000:00:01.0: [1def:e101] type 01 class 0x060400 PCIe=
 Root Port
   [    0.138495] pci 0000:00:01.0: PCI bridge to [bus 01]
   [    0.138537] pci 0000:00:01.0: supports D1 D2
   [    0.138538] pci 0000:00:01.0: PME# supported from D0 D1 D3hot
   [    0.138541] pci 0000:00:01.0: PME# disabled
   [    0.138631] pci_bus 0000:00: fixups for bus
   [    0.138633] pci 0000:00:01.0: scanning [bus 01-01] behind bridge, pas=
s 0
   [    0.138654] pci_bus 0000:01: scanning bus
   [    0.140708] pci_bus 0000:01: fixups for bus
   [    0.140710] pci_bus 0000:01: bus scan returning with max=3D01
   [    0.140721] pci 0000:00:01.0: scanning [bus 01-01] behind bridge, pas=
s 1
   [    0.140724] pci_bus 0000:00: bus scan returning with max=3D01
   [    0.140725] pci_bus 0000:00: on NUMA node 0
   [    0.140728] pci 0000:00:01.0: bridge window [io  0x1000-0x0fff] to [b=
us 01] add_size 1000
   [    0.140731] pci 0000:00:01.0: bridge window [mem 0x00100000-0x000ffff=
f 64bit pref] to [bus 01] add_size 200000 add_align 100000
   [    0.140734] pci 0000:00:01.0: bridge window [mem 0x00100000-0x000ffff=
f] to [bus 01] add_size 200000 add_align 100000
   [    0.140739] pci 0000:00:01.0: bridge window [mem 0x70000000-0x701ffff=
f]: assigned
   [    0.140741] pci 0000:00:01.0: bridge window [mem 0x3c0000000000-0x3c0=
0001fffff 64bit pref]: assigned
   [    0.140743] pci 0000:00:01.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.140745] pci 0000:00:01.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.140747] pci 0000:00:01.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.140749] pci 0000:00:01.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.140750] pci 0000:00:01.0: bridge window [io  size 0x1000]: ignori=
ng failure in optional allocation
   [    0.140753] pci 0000:00:01.0: PCI bridge to [bus 01]
   [    0.140755] pci 0000:00:01.0:   bridge window [mem 0x70000000-0x701ff=
fff]
   [    0.140758] pci 0000:00:01.0:   bridge window [mem 0x3c0000000000-0x3=
c00001fffff 64bit pref]
   [    0.140761] pci_bus 0000:00: Some PCI device resources are unassigned=
, try booting with pci=3Drealloc
   [    0.140762] pci_bus 0000:00: resource 4 [mem 0x70000000-0x7fffffff wi=
ndow]
   [    0.140764] pci_bus 0000:00: resource 5 [mem 0x3c0000000000-0x3fffdff=
fffff window]
   [    0.140766] pci_bus 0000:01: resource 0 [io  size 0x1000]
   [    0.140768] pci_bus 0000:01: resource 1 [mem 0x70000000-0x701fffff]
   [    0.140769] pci_bus 0000:01: resource 2 [mem 0x3c0000000000-0x3c00001=
fffff 64bit pref]
   [    0.140815] ACPI: PCI Root Bridge [PCI4] (domain 0002 [bus 00-ff])
   [    0.140822] acpi PNP0A08:04: _OSC: OS supports [ExtendedConfig Segmen=
ts MSI HPX-Type3]
   [    0.140824] acpi PNP0A08:04: _OSC: not requesting OS control; OS requ=
ires [ExtendedConfig ASPM ClockPM MSI]
   [    0.140880] acpi PNP0A08:04: FADT indicates ASPM is unsupported, usin=
g BIOS configuration
   [    0.140883] acpi PNP0A08:04: MCFG quirk: ECAM at [mem 0x23fff0000000-=
0x23ffffffffff] for [bus 00-ff] with 0xffffa00133583ec8
   [    0.141920] acpi PNP0A08:04: ECAM area [mem 0x23fff0000000-0x23ffffff=
ffff] reserved by PNP0C02:00
   [    0.141932] acpi PNP0A08:04: ECAM at [mem 0x23fff0000000-0x23ffffffff=
ff] for [bus 00-ff]
   [    0.142037] PCI host bridge to bus 0002:00
   [    0.142058] pci_bus 0002:00: root bus resource [mem 0x08000000-0x0fff=
ffff window]
   [    0.142060] pci_bus 0002:00: root bus resource [mem 0x200000000000-0x=
23ffdfffffff window]
   [    0.142062] pci_bus 0002:00: root bus resource [bus 00-ff]
   [    0.142065] pci_bus 0002:00: scanning bus
   [    0.142070] pci 0002:00:00.0: [1def:e110] type 00 class 0x060000 conv=
entional PCI endpoint
   [    0.142149] pci 0002:00:01.0: [1def:e111] type 01 class 0x060400 PCIe=
 Root Port
   [    0.142160] pci 0002:00:01.0: PCI bridge to [bus 01]
   [    0.142200] pci 0002:00:01.0: supports D1 D2
   [    0.142201] pci 0002:00:01.0: PME# supported from D0 D1 D3hot
   [    0.142204] pci 0002:00:01.0: PME# disabled
   [    0.142311] pci 0002:00:05.0: [1def:e115] type 01 class 0x060400 PCIe=
 Root Port
   [    0.142323] pci 0002:00:05.0: PCI bridge to [bus 02]
   [    0.142362] pci 0002:00:05.0: supports D1 D2
   [    0.142363] pci 0002:00:05.0: PME# supported from D0 D1 D3hot
   [    0.142365] pci 0002:00:05.0: PME# disabled
   [    0.142470] pci_bus 0002:00: fixups for bus
   [    0.142472] pci 0002:00:01.0: scanning [bus 01-01] behind bridge, pas=
s 0
   [    0.142503] pci_bus 0002:01: dev 00, created physical slot 1
   [    0.142511] acpiphp_glue: found ACPI PCI Hotplug slot 1 at PCI 0002:0=
1:00
   [    0.142518] acpiphp: Slot [1] registered
   [    0.144568] pci_bus 0002:01: scanning bus
   [    0.146637] pci_bus 0002:01: fixups for bus
   [    0.146638] pci_bus 0002:01: bus scan returning with max=3D01
   [    0.146651] pci 0002:00:05.0: scanning [bus 02-02] behind bridge, pas=
s 0
   [    0.146679] pci_bus 0002:02: dev 00, created physical slot 3
   [    0.146686] acpiphp_glue: found ACPI PCI Hotplug slot 3 at PCI 0002:0=
2:00
   [    0.146691] acpiphp: Slot [3] registered
   [    0.148741] pci_bus 0002:02: scanning bus
   [    0.150808] pci_bus 0002:02: fixups for bus
   [    0.150809] pci_bus 0002:02: bus scan returning with max=3D02
   [    0.150823] pci 0002:00:01.0: scanning [bus 01-01] behind bridge, pas=
s 1
   [    0.150826] pci 0002:00:05.0: scanning [bus 02-02] behind bridge, pas=
s 1
   [    0.150830] pci_bus 0002:00: bus scan returning with max=3D02
   [    0.150831] pci_bus 0002:00: on NUMA node 0
   [    0.150833] pci 0002:00:01.0: bridge window [io  0x1000-0x0fff] to [b=
us 01] add_size 1000
   [    0.150836] pci 0002:00:01.0: bridge window [mem 0x00100000-0x000ffff=
f 64bit pref] to [bus 01] add_size 200000 add_align 100000
   [    0.150839] pci 0002:00:01.0: bridge window [mem 0x00100000-0x000ffff=
f] to [bus 01] add_size 200000 add_align 100000
   [    0.150842] pci 0002:00:05.0: bridge window [io  0x1000-0x0fff] to [b=
us 02] add_size 1000
   [    0.150844] pci 0002:00:05.0: bridge window [mem 0x00100000-0x000ffff=
f 64bit pref] to [bus 02] add_size 200000 add_align 100000
   [    0.150846] pci 0002:00:05.0: bridge window [mem 0x00100000-0x000ffff=
f] to [bus 02] add_size 200000 add_align 100000
   [    0.150853] pci 0002:00:01.0: bridge window [mem 0x08000000-0x081ffff=
f]: assigned
   [    0.150856] pci 0002:00:01.0: bridge window [mem 0x200000000000-0x200=
0001fffff 64bit pref]: assigned
   [    0.150858] pci 0002:00:05.0: bridge window [mem 0x08200000-0x083ffff=
f]: assigned
   [    0.150860] pci 0002:00:05.0: bridge window [mem 0x200000200000-0x200=
0003fffff 64bit pref]: assigned
   [    0.150862] pci 0002:00:01.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.150863] pci 0002:00:01.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.150865] pci 0002:00:05.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.150867] pci 0002:00:05.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.150870] pci 0002:00:05.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.150871] pci 0002:00:05.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.150873] pci 0002:00:05.0: bridge window [io  size 0x1000]: ignori=
ng failure in optional allocation
   [    0.150875] pci 0002:00:01.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.150876] pci 0002:00:01.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.150878] pci 0002:00:01.0: bridge window [io  size 0x1000]: ignori=
ng failure in optional allocation
   [    0.150880] pci 0002:00:01.0: PCI bridge to [bus 01]
   [    0.150883] pci 0002:00:01.0:   bridge window [mem 0x08000000-0x081ff=
fff]
   [    0.150885] pci 0002:00:01.0:   bridge window [mem 0x200000000000-0x2=
000001fffff 64bit pref]
   [    0.150889] pci 0002:00:05.0: PCI bridge to [bus 02]
   [    0.150891] pci 0002:00:05.0:   bridge window [mem 0x08200000-0x083ff=
fff]
   [    0.150893] pci 0002:00:05.0:   bridge window [mem 0x200000200000-0x2=
000003fffff 64bit pref]
   [    0.150896] pci_bus 0002:00: Some PCI device resources are unassigned=
, try booting with pci=3Drealloc
   [    0.150898] pci_bus 0002:00: resource 4 [mem 0x08000000-0x0fffffff wi=
ndow]
   [    0.150900] pci_bus 0002:00: resource 5 [mem 0x200000000000-0x23ffdff=
fffff window]
   [    0.150902] pci_bus 0002:01: resource 0 [io  size 0x1000]
   [    0.150903] pci_bus 0002:01: resource 1 [mem 0x08000000-0x081fffff]
   [    0.150905] pci_bus 0002:01: resource 2 [mem 0x200000000000-0x2000001=
fffff 64bit pref]
   [    0.150907] pci_bus 0002:02: resource 0 [io  size 0x1000]
   [    0.150908] pci_bus 0002:02: resource 1 [mem 0x08200000-0x083fffff]
   [    0.150910] pci_bus 0002:02: resource 2 [mem 0x200000200000-0x2000003=
fffff 64bit pref]
   [    0.151044] ACPI: PCI Root Bridge [PCI6] (domain 0004 [bus 00-ff])
   [    0.151052] acpi PNP0A08:06: _OSC: OS supports [ExtendedConfig Segmen=
ts MSI HPX-Type3]
   [    0.151054] acpi PNP0A08:06: _OSC: not requesting OS control; OS requ=
ires [ExtendedConfig ASPM ClockPM MSI]
   [    0.151108] acpi PNP0A08:06: FADT indicates ASPM is unsupported, usin=
g BIOS configuration
   [    0.151111] acpi PNP0A08:06: MCFG quirk: ECAM at [mem 0x2bfff0000000-=
0x2bffffffffff] for [bus 00-ff] with 0xffffa00133583ec8
   [    0.152152] acpi PNP0A08:06: ECAM area [mem 0x2bfff0000000-0x2bffffff=
ffff] reserved by PNP0C02:00
   [    0.152165] acpi PNP0A08:06: ECAM at [mem 0x2bfff0000000-0x2bffffffff=
ff] for [bus 00-ff]
   [    0.152240] PCI host bridge to bus 0004:00
   [    0.152261] pci_bus 0004:00: root bus resource [mem 0x20000000-0x2fff=
ffff window]
   [    0.152263] pci_bus 0004:00: root bus resource [mem 0x280000000000-0x=
2bffdfffffff window]
   [    0.152265] pci_bus 0004:00: root bus resource [bus 00-ff]
   [    0.152267] pci_bus 0004:00: scanning bus
   [    0.152272] pci 0004:00:00.0: [1def:e110] type 00 class 0x060000 conv=
entional PCI endpoint
   [    0.152348] pci 0004:00:01.0: [1def:e111] type 01 class 0x060400 PCIe=
 Root Port
   [    0.152357] pci 0004:00:01.0: PCI bridge to [bus 01-02]
   [    0.152359] pci 0004:00:01.0:   bridge window [io  0xf000-0xffff]
   [    0.152361] pci 0004:00:01.0:   bridge window [mem 0x20000000-0x210ff=
fff]
   [    0.152390] pci 0004:00:01.0: supports D1 D2
   [    0.152391] pci 0004:00:01.0: PME# supported from D0 D1 D3hot
   [    0.152393] pci 0004:00:01.0: PME# disabled
   [    0.152465] pci 0004:00:03.0: [1def:e113] type 01 class 0x060400 PCIe=
 Root Port
   [    0.152474] pci 0004:00:03.0: PCI bridge to [bus 03]
   [    0.152477] pci 0004:00:03.0:   bridge window [mem 0x21200000-0x212ff=
fff]
   [    0.152505] pci 0004:00:03.0: supports D1 D2
   [    0.152506] pci 0004:00:03.0: PME# supported from D0 D1 D3hot
   [    0.152508] pci 0004:00:03.0: PME# disabled
   [    0.152580] pci 0004:00:05.0: [1def:e115] type 01 class 0x060400 PCIe=
 Root Port
   [    0.152591] pci 0004:00:05.0: PCI bridge to [bus 04]
   [    0.152594] pci 0004:00:05.0:   bridge window [io  0xe000-0xefff]
   [    0.152596] pci 0004:00:05.0:   bridge window [mem 0x21100000-0x211ff=
fff]
   [    0.152632] pci 0004:00:05.0: supports D1 D2
   [    0.152633] pci 0004:00:05.0: PME# supported from D0 D1 D3hot
   [    0.152636] pci 0004:00:05.0: PME# disabled
   [    0.152716] pci 0004:00:07.0: [1def:e117] type 01 class 0x060400 PCIe=
 Root Port
   [    0.152727] pci 0004:00:07.0: PCI bridge to [bus 05]
   [    0.152765] pci 0004:00:07.0: supports D1 D2
   [    0.152766] pci 0004:00:07.0: PME# supported from D0 D1 D3hot
   [    0.152768] pci 0004:00:07.0: PME# disabled
   [    0.152848] pci_bus 0004:00: fixups for bus
   [    0.152849] pci 0004:00:01.0: scanning [bus 01-02] behind bridge, pas=
s 0
   [    0.152867] pci_bus 0004:01: scanning bus
   [    0.152888] pci 0004:01:00.0: [1a03:1150] type 01 class 0x060400 PCIe=
 to PCI/PCI-X bridge
   [    0.152917] pci 0004:01:00.0: PCI bridge to [bus 02]
   [    0.152924] pci 0004:01:00.0:   bridge window [io  0x2ffff000-0x2ffff=
fff]
   [    0.152928] pci 0004:01:00.0:   bridge window [mem 0x20000000-0x210ff=
fff]
   [    0.152952] pci 0004:01:00.0: enabling Extended Tags
   [    0.153014] pci 0004:01:00.0: supports D1 D2
   [    0.153015] pci 0004:01:00.0: PME# supported from D0 D1 D2 D3hot D3co=
ld
   [    0.153019] pci 0004:01:00.0: PME# disabled
   [    0.153111] pci_bus 0004:01: fixups for bus
   [    0.153113] pci 0004:01:00.0: scanning [bus 02-02] behind bridge, pas=
s 0
   [    0.153148] pci_bus 0004:02: extended config space not accessible
   [    0.153160] pci_bus 0004:02: scanning bus
   [    0.153172] pci 0004:02:00.0: [1a03:2000] type 00 class 0x030000 conv=
entional PCI endpoint
   [    0.153227] pci 0004:02:00.0: BAR 0 [mem 0x20000000-0x20ffffff]
   [    0.153230] pci 0004:02:00.0: BAR 1 [mem 0x21000000-0x2101ffff]
   [    0.153234] pci 0004:02:00.0: BAR 2 [io  0x2ffff000-0x2ffff07f]
   [    0.153282] pci 0004:02:00.0: supports D1 D2
   [    0.153283] pci 0004:02:00.0: PME# supported from D0 D1 D2 D3hot D3co=
ld
   [    0.153288] pci 0004:02:00.0: PME# disabled
   [    0.153389] pci_bus 0004:02: fixups for bus
   [    0.153390] pci_bus 0004:02: bus scan returning with max=3D02
   [    0.153395] pci 0004:01:00.0: scanning [bus 02-02] behind bridge, pas=
s 1
   [    0.153402] pci_bus 0004:01: bus scan returning with max=3D02
   [    0.153404] pci 0004:00:03.0: scanning [bus 03-03] behind bridge, pas=
s 0
   [    0.153423] pci_bus 0004:03: scanning bus
   [    0.153447] pci 0004:03:00.0: [1912:0014] type 00 class 0x0c0330 PCIe=
 Endpoint
   [    0.153495] pci 0004:03:00.0: BAR 0 [mem 0x21200000-0x21201fff 64bit]
   [    0.153572] pci 0004:03:00.0: PME# supported from D0 D3hot D3cold
   [    0.153576] pci 0004:03:00.0: PME# disabled
   [    0.153670] pci_bus 0004:03: fixups for bus
   [    0.153672] pci_bus 0004:03: bus scan returning with max=3D03
   [    0.153674] pci 0004:00:05.0: scanning [bus 04-04] behind bridge, pas=
s 0
   [    0.153693] pci_bus 0004:04: scanning bus
   [    0.153740] pci 0004:04:00.0: working around ROM BAR overlap defect
   [    0.153742] pci 0004:04:00.0: [8086:1533] type 00 class 0x020000 PCIe=
 Endpoint
   [    0.153826] pci 0004:04:00.0: BAR 0 [mem 0x21100000-0x2117ffff]
   [    0.153833] pci 0004:04:00.0: BAR 2 [io  0x2fffe000-0x2fffe01f]
   [    0.153837] pci 0004:04:00.0: BAR 3 [mem 0x21180000-0x21183fff]
   [    0.153977] pci 0004:04:00.0: PME# supported from D0 D3hot D3cold
   [    0.153983] pci 0004:04:00.0: PME# disabled
   [    0.154145] pci_bus 0004:04: fixups for bus
   [    0.154146] pci_bus 0004:04: bus scan returning with max=3D04
   [    0.154149] pci 0004:00:07.0: scanning [bus 05-05] behind bridge, pas=
s 0
   [    0.154173] pci_bus 0004:05: scanning bus
   [    0.156227] pci_bus 0004:05: fixups for bus
   [    0.156228] pci_bus 0004:05: bus scan returning with max=3D05
   [    0.156240] pci 0004:00:01.0: scanning [bus 01-02] behind bridge, pas=
s 1
   [    0.156243] pci 0004:00:03.0: scanning [bus 03-03] behind bridge, pas=
s 1
   [    0.156246] pci 0004:00:05.0: scanning [bus 04-04] behind bridge, pas=
s 1
   [    0.156250] pci 0004:00:07.0: scanning [bus 05-05] behind bridge, pas=
s 1
   [    0.156253] pci_bus 0004:00: bus scan returning with max=3D05
   [    0.156254] pci_bus 0004:00: on NUMA node 0
   [    0.156259] pci 0004:00:01.0: bridge window [mem 0x00100000-0x000ffff=
f 64bit pref] to [bus 01-02] add_size 200000 add_align 100000
   [    0.156262] pci 0004:00:03.0: bridge window [io  0x1000-0x0fff] to [b=
us 03] add_size 1000
   [    0.156265] pci 0004:00:03.0: bridge window [mem 0x00100000-0x000ffff=
f 64bit pref] to [bus 03] add_size 200000 add_align 100000
   [    0.156268] pci 0004:00:03.0: bridge window [mem 0x00100000-0x001ffff=
f] to [bus 03] add_size 100000 add_align 100000
   [    0.156271] pci 0004:00:05.0: bridge window [io  0x1000-0x1fff] to [b=
us 04] add_size 1000
   [    0.156273] pci 0004:00:05.0: bridge window [mem 0x00100000-0x000ffff=
f 64bit pref] to [bus 04] add_size 200000 add_align 100000
   [    0.156276] pci 0004:00:05.0: bridge window [mem 0x00100000-0x001ffff=
f] to [bus 04] add_size 100000 add_align 100000
   [    0.156278] pci 0004:00:07.0: bridge window [io  0x1000-0x0fff] to [b=
us 05] add_size 1000
   [    0.156280] pci 0004:00:07.0: bridge window [mem 0x00100000-0x000ffff=
f 64bit pref] to [bus 05] add_size 200000 add_align 100000
   [    0.156283] pci 0004:00:07.0: bridge window [mem 0x00100000-0x000ffff=
f] to [bus 05] add_size 200000 add_align 100000
   [    0.156290] pci 0004:00:01.0: bridge window [mem 0x20000000-0x217ffff=
f]: assigned
   [    0.156292] pci 0004:00:01.0: bridge window [mem 0x280000000000-0x280=
0001fffff 64bit pref]: assigned
   [    0.156294] pci 0004:00:03.0: bridge window [mem 0x21800000-0x219ffff=
f]: assigned
   [    0.156296] pci 0004:00:03.0: bridge window [mem 0x280000200000-0x280=
0003fffff 64bit pref]: assigned
   [    0.156299] pci 0004:00:05.0: bridge window [mem 0x21a00000-0x21bffff=
f]: assigned
   [    0.156301] pci 0004:00:05.0: bridge window [mem 0x280000400000-0x280=
0005fffff 64bit pref]: assigned
   [    0.156303] pci 0004:00:07.0: bridge window [mem 0x21c00000-0x21dffff=
f]: assigned
   [    0.156305] pci 0004:00:07.0: bridge window [mem 0x280000600000-0x280=
0007fffff 64bit pref]: assigned
   [    0.156307] pci 0004:00:01.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.156309] pci 0004:00:01.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.156310] pci 0004:00:03.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.156312] pci 0004:00:03.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.156314] pci 0004:00:05.0: bridge window [io  size 0x2000]: can't =
assign; no space
   [    0.156315] pci 0004:00:05.0: bridge window [io  size 0x2000]: failed=
 to assign
   [    0.156317] pci 0004:00:07.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.156318] pci 0004:00:07.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.156324] pci 0004:00:01.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.156326] pci 0004:00:01.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.156327] pci 0004:00:05.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.156329] pci 0004:00:05.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.156331] pci 0004:00:07.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.156332] pci 0004:00:07.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.156334] pci 0004:00:07.0: bridge window [io  size 0x1000]: ignori=
ng failure in optional allocation
   [    0.156336] pci 0004:00:03.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.156337] pci 0004:00:03.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.156339] pci 0004:00:03.0: bridge window [io  size 0x1000]: ignori=
ng failure in optional allocation
   [    0.156342] pci 0004:01:00.0: bridge window [mem 0x20000000-0x217ffff=
f]: assigned
   [    0.156344] pci 0004:01:00.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.156345] pci 0004:01:00.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.156347] pci 0004:01:00.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.156348] pci 0004:01:00.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.156351] pci 0004:02:00.0: BAR 0 [mem 0x20000000-0x20ffffff]: assi=
gned
   [    0.156356] pci 0004:02:00.0: BAR 1 [mem 0x21000000-0x2101ffff]: assi=
gned
   [    0.156360] pci 0004:02:00.0: BAR 2 [io  size 0x0080]: can't assign; =
no space
   [    0.156362] pci 0004:02:00.0: BAR 2 [io  size 0x0080]: failed to assi=
gn
   [    0.156364] pci 0004:02:00.0: BAR 2 [io  size 0x0080]: can't assign; =
no space
   [    0.156365] pci 0004:02:00.0: BAR 2 [io  size 0x0080]: failed to assi=
gn
   [    0.156367] pci 0004:01:00.0: PCI bridge to [bus 02]
   [    0.156371] pci 0004:01:00.0:   bridge window [mem 0x20000000-0x217ff=
fff]
   [    0.156378] pci 0004:00:01.0: PCI bridge to [bus 01-02]
   [    0.156381] pci 0004:00:01.0:   bridge window [mem 0x20000000-0x217ff=
fff]
   [    0.156383] pci 0004:00:01.0:   bridge window [mem 0x280000000000-0x2=
800001fffff 64bit pref]
   [    0.156386] pci 0004:03:00.0: BAR 0 [mem 0x21800000-0x21801fff 64bit]=
: assigned
   [    0.156396] pci 0004:00:03.0: PCI bridge to [bus 03]
   [    0.156399] pci 0004:00:03.0:   bridge window [mem 0x21800000-0x219ff=
fff]
   [    0.156401] pci 0004:00:03.0:   bridge window [mem 0x280000200000-0x2=
800003fffff 64bit pref]
   [    0.156404] pci 0004:04:00.0: BAR 0 [mem 0x21a00000-0x21a7ffff]: assi=
gned
   [    0.156410] pci 0004:04:00.0: BAR 3 [mem 0x21a80000-0x21a83fff]: assi=
gned
   [    0.156417] pci 0004:04:00.0: BAR 2 [io  size 0x0020]: can't assign; =
no space
   [    0.156418] pci 0004:04:00.0: BAR 2 [io  size 0x0020]: failed to assi=
gn
   [    0.156420] pci 0004:04:00.0: BAR 2 [io  size 0x0020]: can't assign; =
no space
   [    0.156422] pci 0004:04:00.0: BAR 2 [io  size 0x0020]: failed to assi=
gn
   [    0.156423] pci 0004:00:05.0: PCI bridge to [bus 04]
   [    0.156426] pci 0004:00:05.0:   bridge window [mem 0x21a00000-0x21bff=
fff]
   [    0.156428] pci 0004:00:05.0:   bridge window [mem 0x280000400000-0x2=
800005fffff 64bit pref]
   [    0.156431] pci 0004:00:07.0: PCI bridge to [bus 05]
   [    0.156433] pci 0004:00:07.0:   bridge window [mem 0x21c00000-0x21dff=
fff]
   [    0.156435] pci 0004:00:07.0:   bridge window [mem 0x280000600000-0x2=
800007fffff 64bit pref]
   [    0.156438] pci_bus 0004:00: Some PCI device resources are unassigned=
, try booting with pci=3Drealloc
   [    0.156440] pci_bus 0004:00: resource 4 [mem 0x20000000-0x2fffffff wi=
ndow]
   [    0.156442] pci_bus 0004:00: resource 5 [mem 0x280000000000-0x2bffdff=
fffff window]
   [    0.156444] pci_bus 0004:01: resource 0 [io  size 0x1000]
   [    0.156445] pci_bus 0004:01: resource 1 [mem 0x20000000-0x217fffff]
   [    0.156447] pci_bus 0004:01: resource 2 [mem 0x280000000000-0x2800001=
fffff 64bit pref]
   [    0.156449] pci_bus 0004:02: resource 0 [io  size 0x1000]
   [    0.156450] pci_bus 0004:02: resource 1 [mem 0x20000000-0x217fffff]
   [    0.156452] pci_bus 0004:03: resource 0 [io  size 0x1000]
   [    0.156453] pci_bus 0004:03: resource 1 [mem 0x21800000-0x219fffff]
   [    0.156455] pci_bus 0004:03: resource 2 [mem 0x280000200000-0x2800003=
fffff 64bit pref]
   [    0.156457] pci_bus 0004:04: resource 0 [io  size 0x1000]
   [    0.156458] pci_bus 0004:04: resource 1 [mem 0x21a00000-0x21bfffff]
   [    0.156460] pci_bus 0004:04: resource 2 [mem 0x280000400000-0x2800005=
fffff 64bit pref]
   [    0.156462] pci_bus 0004:05: resource 0 [io  size 0x1000]
   [    0.156463] pci_bus 0004:05: resource 1 [mem 0x21c00000-0x21dfffff]
   [    0.156465] pci_bus 0004:05: resource 2 [mem 0x280000600000-0x2800007=
fffff 64bit pref]
   [    0.156531] ACPI: PCI Root Bridge [PCI7] (domain 0005 [bus 00-ff])
   [    0.156539] acpi PNP0A08:07: _OSC: OS supports [ExtendedConfig Segmen=
ts MSI HPX-Type3]
   [    0.156542] acpi PNP0A08:07: _OSC: not requesting OS control; OS requ=
ires [ExtendedConfig ASPM ClockPM MSI]
   [    0.156599] acpi PNP0A08:07: FADT indicates ASPM is unsupported, usin=
g BIOS configuration
   [    0.156602] acpi PNP0A08:07: MCFG quirk: ECAM at [mem 0x2ffff0000000-=
0x2fffffffffff] for [bus 00-ff] with 0xffffa00133583ec8
   [    0.157651] acpi PNP0A08:07: ECAM area [mem 0x2ffff0000000-0x2fffffff=
ffff] reserved by PNP0C02:00
   [    0.157663] acpi PNP0A08:07: ECAM at [mem 0x2ffff0000000-0x2fffffffff=
ff] for [bus 00-ff]
   [    0.157741] PCI host bridge to bus 0005:00
   [    0.157761] pci_bus 0005:00: root bus resource [mem 0x30000000-0x3fff=
ffff window]
   [    0.157764] pci_bus 0005:00: root bus resource [mem 0x2c0000000000-0x=
2fffdfffffff window]
   [    0.157766] pci_bus 0005:00: root bus resource [bus 00-ff]
   [    0.157768] pci_bus 0005:00: scanning bus
   [    0.157773] pci 0005:00:00.0: [1def:e110] type 00 class 0x060000 conv=
entional PCI endpoint
   [    0.157852] pci 0005:00:01.0: [1def:e111] type 01 class 0x060400 PCIe=
 Root Port
   [    0.157862] pci 0005:00:01.0: PCI bridge to [bus 01]
   [    0.157900] pci 0005:00:01.0: supports D1 D2
   [    0.157902] pci 0005:00:01.0: PME# supported from D0 D1 D3hot
   [    0.157905] pci 0005:00:01.0: PME# disabled
   [    0.157990] pci 0005:00:03.0: [1def:e113] type 01 class 0x060400 PCIe=
 Root Port
   [    0.158001] pci 0005:00:03.0: PCI bridge to [bus 02]
   [    0.158039] pci 0005:00:03.0: supports D1 D2
   [    0.158040] pci 0005:00:03.0: PME# supported from D0 D1 D3hot
   [    0.158042] pci 0005:00:03.0: PME# disabled
   [    0.158119] pci 0005:00:05.0: [1def:e115] type 01 class 0x060400 PCIe=
 Root Port
   [    0.158127] pci 0005:00:05.0: PCI bridge to [bus 03]
   [    0.158129] pci 0005:00:05.0:   bridge window [mem 0x30100000-0x301ff=
fff]
   [    0.158154] pci 0005:00:05.0: supports D1 D2
   [    0.158155] pci 0005:00:05.0: PME# supported from D0 D1 D3hot
   [    0.158157] pci 0005:00:05.0: PME# disabled
   [    0.158224] pci 0005:00:07.0: [1def:e117] type 01 class 0x060400 PCIe=
 Root Port
   [    0.158232] pci 0005:00:07.0: PCI bridge to [bus 04]
   [    0.158234] pci 0005:00:07.0:   bridge window [mem 0x30000000-0x300ff=
fff]
   [    0.158258] pci 0005:00:07.0: supports D1 D2
   [    0.158260] pci 0005:00:07.0: PME# supported from D0 D1 D3hot
   [    0.158262] pci 0005:00:07.0: PME# disabled
   [    0.158326] pci_bus 0005:00: fixups for bus
   [    0.158328] pci 0005:00:01.0: scanning [bus 01-01] behind bridge, pas=
s 0
   [    0.158349] pci_bus 0005:01: scanning bus
   [    0.160403] pci_bus 0005:01: fixups for bus
   [    0.160405] pci_bus 0005:01: bus scan returning with max=3D01
   [    0.160417] pci 0005:00:03.0: scanning [bus 02-02] behind bridge, pas=
s 0
   [    0.160436] pci_bus 0005:02: scanning bus
   [    0.162486] pci_bus 0005:02: fixups for bus
   [    0.162487] pci_bus 0005:02: bus scan returning with max=3D02
   [    0.162503] pci 0005:00:05.0: scanning [bus 03-03] behind bridge, pas=
s 0
   [    0.162521] pci_bus 0005:03: scanning bus
   [    0.162540] pci 0005:03:00.0: [126f:2263] type 00 class 0x010802 PCIe=
 Endpoint
   [    0.162582] pci 0005:03:00.0: BAR 0 [mem 0x30100000-0x30103fff 64bit]
   [    0.162760] pci_bus 0005:03: fixups for bus
   [    0.162761] pci_bus 0005:03: bus scan returning with max=3D03
   [    0.162763] pci 0005:00:07.0: scanning [bus 04-04] behind bridge, pas=
s 0
   [    0.162780] pci_bus 0005:04: scanning bus
   [    0.162795] pci 0005:04:00.0: [15b7:5017] type 00 class 0x010802 PCIe=
 Endpoint
   [    0.162826] pci 0005:04:00.0: BAR 0 [mem 0x30000000-0x30003fff 64bit]
   [    0.162950] pci 0005:04:00.0: 31.504 Gb/s available PCIe bandwidth, l=
imited by 8.0 GT/s PCIe x4 link at 0005:00:07.0 (capable of 63.012 Gb/s wit=
h 16.0 GT/s PCIe x4 link)
   [    0.163001] pci_bus 0005:04: fixups for bus
   [    0.163002] pci_bus 0005:04: bus scan returning with max=3D04
   [    0.163005] pci 0005:00:01.0: scanning [bus 01-01] behind bridge, pas=
s 1
   [    0.163008] pci 0005:00:03.0: scanning [bus 02-02] behind bridge, pas=
s 1
   [    0.163011] pci 0005:00:05.0: scanning [bus 03-03] behind bridge, pas=
s 1
   [    0.163014] pci 0005:00:07.0: scanning [bus 04-04] behind bridge, pas=
s 1
   [    0.163016] pci_bus 0005:00: bus scan returning with max=3D04
   [    0.163018] pci_bus 0005:00: on NUMA node 0
   [    0.163020] pci 0005:00:01.0: bridge window [io  0x1000-0x0fff] to [b=
us 01] add_size 1000
   [    0.163023] pci 0005:00:01.0: bridge window [mem 0x00100000-0x000ffff=
f 64bit pref] to [bus 01] add_size 200000 add_align 100000
   [    0.163026] pci 0005:00:01.0: bridge window [mem 0x00100000-0x000ffff=
f] to [bus 01] add_size 200000 add_align 100000
   [    0.163029] pci 0005:00:03.0: bridge window [io  0x1000-0x0fff] to [b=
us 02] add_size 1000
   [    0.163031] pci 0005:00:03.0: bridge window [mem 0x00100000-0x000ffff=
f 64bit pref] to [bus 02] add_size 200000 add_align 100000
   [    0.163034] pci 0005:00:03.0: bridge window [mem 0x00100000-0x000ffff=
f] to [bus 02] add_size 200000 add_align 100000
   [    0.163036] pci 0005:00:05.0: bridge window [io  0x1000-0x0fff] to [b=
us 03] add_size 1000
   [    0.163038] pci 0005:00:05.0: bridge window [mem 0x00100000-0x000ffff=
f 64bit pref] to [bus 03] add_size 200000 add_align 100000
   [    0.163041] pci 0005:00:05.0: bridge window [mem 0x00100000-0x001ffff=
f] to [bus 03] add_size 100000 add_align 100000
   [    0.163043] pci 0005:00:07.0: bridge window [io  0x1000-0x0fff] to [b=
us 04] add_size 1000
   [    0.163046] pci 0005:00:07.0: bridge window [mem 0x00100000-0x000ffff=
f 64bit pref] to [bus 04] add_size 200000 add_align 100000
   [    0.163048] pci 0005:00:07.0: bridge window [mem 0x00100000-0x001ffff=
f] to [bus 04] add_size 100000 add_align 100000
   [    0.163055] pci 0005:00:01.0: bridge window [mem 0x30000000-0x301ffff=
f]: assigned
   [    0.163058] pci 0005:00:01.0: bridge window [mem 0x2c0000000000-0x2c0=
0001fffff 64bit pref]: assigned
   [    0.163060] pci 0005:00:03.0: bridge window [mem 0x30200000-0x303ffff=
f]: assigned
   [    0.163062] pci 0005:00:03.0: bridge window [mem 0x2c0000200000-0x2c0=
0003fffff 64bit pref]: assigned
   [    0.163064] pci 0005:00:05.0: bridge window [mem 0x30400000-0x305ffff=
f]: assigned
   [    0.163066] pci 0005:00:05.0: bridge window [mem 0x2c0000400000-0x2c0=
0005fffff 64bit pref]: assigned
   [    0.163069] pci 0005:00:07.0: bridge window [mem 0x30600000-0x307ffff=
f]: assigned
   [    0.163071] pci 0005:00:07.0: bridge window [mem 0x2c0000600000-0x2c0=
0007fffff 64bit pref]: assigned
   [    0.163072] pci 0005:00:01.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.163074] pci 0005:00:01.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.163076] pci 0005:00:03.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.163078] pci 0005:00:03.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.163079] pci 0005:00:05.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.163081] pci 0005:00:05.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.163083] pci 0005:00:07.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.163084] pci 0005:00:07.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.163089] pci 0005:00:07.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.163090] pci 0005:00:07.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.163092] pci 0005:00:07.0: bridge window [io  size 0x1000]: ignori=
ng failure in optional allocation
   [    0.163093] pci 0005:00:05.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.163095] pci 0005:00:05.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.163096] pci 0005:00:05.0: bridge window [io  size 0x1000]: ignori=
ng failure in optional allocation
   [    0.163098] pci 0005:00:03.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.163100] pci 0005:00:03.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.163101] pci 0005:00:03.0: bridge window [io  size 0x1000]: ignori=
ng failure in optional allocation
   [    0.163103] pci 0005:00:01.0: bridge window [io  size 0x1000]: can't =
assign; no space
   [    0.163105] pci 0005:00:01.0: bridge window [io  size 0x1000]: failed=
 to assign
   [    0.163106] pci 0005:00:01.0: bridge window [io  size 0x1000]: ignori=
ng failure in optional allocation
   [    0.163109] pci 0005:00:01.0: PCI bridge to [bus 01]
   [    0.163111] pci 0005:00:01.0:   bridge window [mem 0x30000000-0x301ff=
fff]
   [    0.163113] pci 0005:00:01.0:   bridge window [mem 0x2c0000000000-0x2=
c00001fffff 64bit pref]
   [    0.163117] pci 0005:00:03.0: PCI bridge to [bus 02]
   [    0.163119] pci 0005:00:03.0:   bridge window [mem 0x30200000-0x303ff=
fff]
   [    0.163121] pci 0005:00:03.0:   bridge window [mem 0x2c0000200000-0x2=
c00003fffff 64bit pref]
   [    0.163125] pci 0005:03:00.0: BAR 0 [mem 0x30400000-0x30403fff 64bit]=
: assigned
   [    0.163133] pci 0005:00:05.0: PCI bridge to [bus 03]
   [    0.163135] pci 0005:00:05.0:   bridge window [mem 0x30400000-0x305ff=
fff]
   [    0.163137] pci 0005:00:05.0:   bridge window [mem 0x2c0000400000-0x2=
c00005fffff 64bit pref]
   [    0.163140] pci 0005:04:00.0: BAR 0 [mem 0x30600000-0x30603fff 64bit]=
: assigned
   [    0.163147] pci 0005:00:07.0: PCI bridge to [bus 04]
   [    0.163149] pci 0005:00:07.0:   bridge window [mem 0x30600000-0x307ff=
fff]
   [    0.163151] pci 0005:00:07.0:   bridge window [mem 0x2c0000600000-0x2=
c00007fffff 64bit pref]
   [    0.163153] pci_bus 0005:00: Some PCI device resources are unassigned=
, try booting with pci=3Drealloc
   [    0.163155] pci_bus 0005:00: resource 4 [mem 0x30000000-0x3fffffff wi=
ndow]
   [    0.163157] pci_bus 0005:00: resource 5 [mem 0x2c0000000000-0x2fffdff=
fffff window]
   [    0.163158] pci_bus 0005:01: resource 0 [io  size 0x1000]
   [    0.163160] pci_bus 0005:01: resource 1 [mem 0x30000000-0x301fffff]
   [    0.163161] pci_bus 0005:01: resource 2 [mem 0x2c0000000000-0x2c00001=
fffff 64bit pref]
   [    0.163163] pci_bus 0005:02: resource 0 [io  size 0x1000]
   [    0.163165] pci_bus 0005:02: resource 1 [mem 0x30200000-0x303fffff]
   [    0.163167] pci_bus 0005:02: resource 2 [mem 0x2c0000200000-0x2c00003=
fffff 64bit pref]
   [    0.163168] pci_bus 0005:03: resource 0 [io  size 0x1000]
   [    0.163170] pci_bus 0005:03: resource 1 [mem 0x30400000-0x305fffff]
   [    0.163171] pci_bus 0005:03: resource 2 [mem 0x2c0000400000-0x2c00005=
fffff 64bit pref]
   [    0.163173] pci_bus 0005:04: resource 0 [io  size 0x1000]
   [    0.163175] pci_bus 0005:04: resource 1 [mem 0x30600000-0x307fffff]
   [    0.163177] pci_bus 0005:04: resource 2 [mem 0x2c0000600000-0x2c00007=
fffff 64bit pref]
   [    0.163520] iommu: Default domain type: Translated
   [    0.163522] iommu: DMA domain TLB invalidation policy: strict mode
   [    0.180986] pps_core: LinuxPPS API ver. 1 registered
   [    0.180988] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodol=
fo Giometti <giometti@linux.it>
   [    0.180991] PTP clock support registered
   [    0.181003] EDAC MC: Ver: 3.0.0
   [    0.181155] scmi_core: SCMI protocol bus registered
   [    0.181241] efivars: Registered efivars operations
   [    0.181716] NetLabel: Initializing
   [    0.181718] NetLabel:  domain hash size =3D 128
   [    0.181719] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
   [    0.181738] NetLabel:  unlabeled traffic allowed by default
   [    0.181783] pci 000d:03:00.0: vgaarb: setting as boot VGA device
   [    0.181786] pci 000d:03:00.0: vgaarb: bridge control possible
   [    0.181788] pci 000d:03:00.0: vgaarb: VGA device added: decodes=3Dio+=
mem,owns=3Dnone,locks=3Dnone
   [    0.181799] pci 0004:02:00.0: vgaarb: setting as boot VGA device (ove=
rriding previous)
   [    0.181800] pci 0004:02:00.0: vgaarb: bridge control possible
   [    0.181801] pci 0004:02:00.0: vgaarb: VGA device added: decodes=3Dio+=
mem,owns=3Dnone,locks=3Dnone
   [    0.181805] vgaarb: loaded
   [    0.186469] clocksource: Switched to clocksource arch_sys_counter
   [    0.186652] VFS: Disk quotas dquot_6.6.0
   [    0.186664] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 b=
ytes)
   [    0.198848] AppArmor: AppArmor Filesystem Enabled
   [    0.198898] pnp: PnP ACPI init
   [    0.199927] system 00:00: [mem 0x3bfff0000000-0x3bffffffffff window] =
has been reserved
   [    0.199933] system 00:00: [mem 0x3ffff0000000-0x3fffffffffff window] =
could not be reserved
   [    0.199935] system 00:00: [mem 0x23fff0000000-0x23ffffffffff window] =
could not be reserved
   [    0.199938] system 00:00: [mem 0x27fff0000000-0x27ffffffffff window] =
has been reserved
   [    0.199940] system 00:00: [mem 0x2bfff0000000-0x2bffffffffff window] =
could not be reserved
   [    0.199942] system 00:00: [mem 0x2ffff0000000-0x2fffffffffff window] =
could not be reserved
   [    0.199945] system 00:00: [mem 0x7bfff0000000-0x7bffffffffff window] =
has been reserved
   [    0.199948] system 00:00: [mem 0x7ffff0000000-0x7fffffffffff window] =
has been reserved
   [    0.199950] system 00:00: [mem 0x63fff0000000-0x63ffffffffff window] =
has been reserved
   [    0.199953] system 00:00: [mem 0x67fff0000000-0x67ffffffffff window] =
has been reserved
   [    0.199955] system 00:00: [mem 0x6bfff0000000-0x6bffffffffff window] =
has been reserved
   [    0.199958] system 00:00: [mem 0x6ffff0000000-0x6fffffffffff window] =
has been reserved
   [    0.199960] system 00:00: [mem 0x33fff0000000-0x33ffffffffff window] =
could not be reserved
   [    0.199963] system 00:00: [mem 0x37fff0000000-0x37ffffffffff window] =
could not be reserved
   [    0.199972] pnp: PnP ACPI: found 1 devices
   [    0.201939] NET: Registered PF_INET protocol family
   [    0.202063] IP idents hash table entries: 262144 (order: 9, 2097152 b=
ytes, linear)
   [    0.206468] tcp_listen_portaddr_hash hash table entries: 16384 (order=
: 6, 262144 bytes, linear)
   [    0.206595] Table-perturb hash table entries: 65536 (order: 6, 262144=
 bytes, linear)
   [    0.206681] TCP established hash table entries: 262144 (order: 9, 209=
7152 bytes, linear)
   [    0.207686] TCP bind hash table entries: 65536 (order: 9, 2097152 byt=
es, linear)
   [    0.208581] TCP: Hash tables configured (established 262144 bind 6553=
6)
   [    0.208734] MPTCP token hash table entries: 32768 (order: 7, 786432 b=
ytes, linear)
   [    0.208874] UDP hash table entries: 16384 (order: 8, 1048576 bytes, l=
inear)
   [    0.209467] UDP-Lite hash table entries: 16384 (order: 8, 1048576 byt=
es, linear)
   [    0.210082] NET: Registered PF_UNIX/PF_LOCAL protocol family
   [    0.210094] NET: Registered PF_XDP protocol family
   [    0.210145] pci 000d:03:00.1: D0 power state depends on 000d:03:00.0
   [    0.210176] pci 0004:03:00.0: enabling device (0000 -> 0002)
   [    0.210219] PCI: CLS 128 bytes, default 64
   [    0.210401] Trying to unpack rootfs image as initramfs...
   [    0.215068] pci 000d:03:00.1: save config 0x00: 0xab301002
   [    0.215073] pci 000d:03:00.1: save config 0x04: 0x00100000
   [    0.215076] pci 000d:03:00.1: save config 0x08: 0x04030000
   [    0.215079] pci 000d:03:00.1: save config 0x0c: 0x00800000
   [    0.215082] pci 000d:03:00.1: save config 0x10: 0x50120000
   [    0.215084] pci 000d:03:00.1: save config 0x14: 0x00000000
   [    0.215087] pci 000d:03:00.1: save config 0x18: 0x00000000
   [    0.215089] pci 000d:03:00.1: save config 0x1c: 0x00000000
   [    0.215092] pci 000d:03:00.1: save config 0x20: 0x00000000
   [    0.215095] pci 000d:03:00.1: save config 0x24: 0x00000000
   [    0.215097] pci 000d:03:00.1: save config 0x28: 0x00000000
   [    0.215099] pci 000d:03:00.1: save config 0x2c: 0xab301002
   [    0.215102] pci 000d:03:00.1: save config 0x30: 0x00000000
   [    0.215104] pci 000d:03:00.1: save config 0x34: 0x00000048
   [    0.215106] pci 000d:03:00.1: save config 0x38: 0x00000000
   [    0.215109] pci 000d:03:00.1: save config 0x3c: 0x000002ff
   [    0.218807] kvm [1]: nv: 568 coarse grained trap handlers
   [    0.218940] kvm [1]: IPA Size Limit: 48 bits
   [    0.226269] kvm [1]: GICv3: no GICV resource entry
   [    0.226273] kvm [1]: disabling GICv2 emulation
   [    0.234779] kvm [1]: GIC system register CPU interface enabled
   [    0.234799] kvm [1]: vgic interrupt IRQ9
   [    0.251803] kvm [1]: VHE mode initialized successfully
   [    0.261285] Initialise system trusted keyrings
   [    0.261298] Key type blacklist registered
   [    0.261351] workingset: timestamp_bits=3D42 max_order=3D23 bucket_ord=
er=3D0
   [    0.261676] fuse: init (API version 7.45)
   [    0.277356] integrity: Platform Keyring initialized
   [    0.277365] integrity: Machine keyring initialized
   [    0.296656] Key type asymmetric registered
   [    0.296658] Asymmetric key parser 'x509' registered
   [    0.296686] Block layer SCSI generic (bsg) driver version 0.4 loaded =
(major 245)
   [    0.296756] io scheduler mq-deadline registered
   [    0.311450] ledtrig-cpu: registered to indicate activity on CPUs
   [    0.311477] pciehp: pcie_port_service_register =3D 0
   [    0.312222] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/P=
NP0C0C:00/input/input0
   [    0.312249] ACPI: button: Power Button [PWRB]
   [    0.336895] ACPI GTDT: found 1 SBSA generic Watchdog(s).
   [    0.336899] ACPI GTDT: found 1 Generic MMIO timer(s).
   [    0.338071] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
   [    0.338675] Serial: AMBA driver
   [    0.338727] msm_serial: driver initialized
   [    0.338741] SuperH (H)SCI(F) driver initialized
   [    0.412916] Freeing initrd memory: 17900K
   [    0.416796] arm-smmu-v3 arm-smmu-v3.0.auto: option mask 0x0
   [    0.416815] arm-smmu-v3 arm-smmu-v3.0.auto: ias 48-bit, oas 48-bit (f=
eatures 0x001c1fff)
   [    0.455909] arm-smmu-v3 arm-smmu-v3.0.auto: allocated 65536 entries f=
or cmdq
   [    0.460072] arm-smmu-v3 arm-smmu-v3.0.auto: allocated 32768 entries f=
or evtq
   [    0.463701] arm-smmu-v3 arm-smmu-v3.0.auto: allocated 65536 entries f=
or priq
   [    0.476185] pci 000c:00:00.0: Adding to iommu group 0
   [    0.476220] pci 000c:00:01.0: Adding to iommu group 1
   [    0.476527] arm-smmu-v3 arm-smmu-v3.1.auto: option mask 0x0
   [    0.476542] arm-smmu-v3 arm-smmu-v3.1.auto: ias 48-bit, oas 48-bit (f=
eatures 0x001c1fff)
   [    0.482562] arm-smmu-v3 arm-smmu-v3.1.auto: allocated 65536 entries f=
or cmdq
   [    0.488686] arm-smmu-v3 arm-smmu-v3.1.auto: allocated 32768 entries f=
or evtq
   [    0.494987] arm-smmu-v3 arm-smmu-v3.1.auto: allocated 65536 entries f=
or priq
   [    0.507391] pci 000d:00:00.0: Adding to iommu group 2
   [    0.507409] pci 000d:00:01.0: Adding to iommu group 3
   [    0.513672] pci 000d:01:00.0: Adding to iommu group 4
   [    0.519923] pci 000d:02:00.0: Adding to iommu group 5
   [    0.526205] pci 000d:03:00.0: Adding to iommu group 6
   [    0.526243] pci 000d:03:00.1: Adding to iommu group 7
   [    0.532682] arm-smmu-v3 arm-smmu-v3.2.auto: option mask 0x0
   [    0.532700] arm-smmu-v3 arm-smmu-v3.2.auto: ias 48-bit, oas 48-bit (f=
eatures 0x001c1fff)
   [    0.538846] arm-smmu-v3 arm-smmu-v3.2.auto: allocated 65536 entries f=
or cmdq
   [    0.545008] arm-smmu-v3 arm-smmu-v3.2.auto: allocated 32768 entries f=
or evtq
   [    0.551318] arm-smmu-v3 arm-smmu-v3.2.auto: allocated 65536 entries f=
or priq
   [    0.563745] pci 0000:00:00.0: Adding to iommu group 8
   [    0.563777] pci 0000:00:01.0: Adding to iommu group 9
   [    0.564079] arm-smmu-v3 arm-smmu-v3.3.auto: option mask 0x0
   [    0.564094] arm-smmu-v3 arm-smmu-v3.3.auto: ias 48-bit, oas 48-bit (f=
eatures 0x001c1fff)
   [    0.570064] arm-smmu-v3 arm-smmu-v3.3.auto: allocated 65536 entries f=
or cmdq
   [    0.576428] arm-smmu-v3 arm-smmu-v3.3.auto: allocated 32768 entries f=
or evtq
   [    0.582567] arm-smmu-v3 arm-smmu-v3.3.auto: allocated 65536 entries f=
or priq
   [    0.595046] pci 0002:00:00.0: Adding to iommu group 10
   [    0.595080] pci 0002:00:01.0: Adding to iommu group 11
   [    0.595111] pci 0002:00:05.0: Adding to iommu group 12
   [    0.595445] arm-smmu-v3 arm-smmu-v3.4.auto: option mask 0x0
   [    0.595461] arm-smmu-v3 arm-smmu-v3.4.auto: ias 48-bit, oas 48-bit (f=
eatures 0x001c1fff)
   [    0.601365] arm-smmu-v3 arm-smmu-v3.4.auto: allocated 65536 entries f=
or cmdq
   [    0.607649] arm-smmu-v3 arm-smmu-v3.4.auto: allocated 32768 entries f=
or evtq
   [    0.613864] arm-smmu-v3 arm-smmu-v3.4.auto: allocated 65536 entries f=
or priq
   [    0.626333] pci 0004:00:00.0: Adding to iommu group 13
   [    0.626369] pci 0004:00:01.0: Adding to iommu group 14
   [    0.626401] pci 0004:00:03.0: Adding to iommu group 15
   [    0.626431] pci 0004:00:05.0: Adding to iommu group 16
   [    0.626469] pci 0004:00:07.0: Adding to iommu group 17
   [    0.632597] pci 0004:01:00.0: Adding to iommu group 18
   [    0.638822] pci 0004:02:00.0: Adding to iommu group 18
   [    0.645100] pci 0004:03:00.0: Adding to iommu group 19
   [    0.651354] pci 0004:04:00.0: Adding to iommu group 20
   [    0.652167] arm-smmu-v3 arm-smmu-v3.5.auto: option mask 0x0
   [    0.652183] arm-smmu-v3 arm-smmu-v3.5.auto: ias 48-bit, oas 48-bit (f=
eatures 0x001c1fff)
   [    0.657792] arm-smmu-v3 arm-smmu-v3.5.auto: allocated 65536 entries f=
or cmdq
   [    0.663898] arm-smmu-v3 arm-smmu-v3.5.auto: allocated 32768 entries f=
or evtq
   [    0.670318] arm-smmu-v3 arm-smmu-v3.5.auto: allocated 65536 entries f=
or priq
   [    0.682688] pci 0005:00:00.0: Adding to iommu group 21
   [    0.682722] pci 0005:00:01.0: Adding to iommu group 22
   [    0.682752] pci 0005:00:03.0: Adding to iommu group 23
   [    0.682784] pci 0005:00:05.0: Adding to iommu group 24
   [    0.682814] pci 0005:00:07.0: Adding to iommu group 25
   [    0.688913] pci 0005:03:00.0: Adding to iommu group 26
   [    0.695166] pci 0005:04:00.0: Adding to iommu group 27
   [    0.702169] nvme 0005:03:00.0: vgaarb: pci_notify
   [    0.702176] nvme 0005:03:00.0: runtime IRQ mapping not provided by ar=
ch
   [    0.702272] nvme 0005:04:00.0: vgaarb: pci_notify
   [    0.702278] nvme 0005:04:00.0: runtime IRQ mapping not provided by ar=
ch
   [    0.702309] mousedev: PS/2 mouse device common for all mice
   [    0.702360] nvme nvme0: pci function 0005:03:00.0
   [    0.702475] nvme 0005:03:00.0: save config 0x00: 0x2263126f
   [    0.702479] nvme 0005:03:00.0: save config 0x04: 0x00100406
   [    0.702482] nvme 0005:03:00.0: save config 0x08: 0x01080203
   [    0.702485] nvme 0005:03:00.0: save config 0x0c: 0x00000000
   [    0.702488] nvme 0005:03:00.0: save config 0x10: 0x30400004
   [    0.702491] nvme 0005:03:00.0: save config 0x14: 0x00000000
   [    0.702493] nvme 0005:03:00.0: save config 0x18: 0x00000000
   [    0.702496] nvme 0005:03:00.0: save config 0x1c: 0x00000000
   [    0.702498] nvme 0005:03:00.0: save config 0x20: 0x00000000
   [    0.702500] nvme 0005:03:00.0: save config 0x24: 0x00000000
   [    0.702503] nvme 0005:03:00.0: save config 0x28: 0x00000000
   [    0.702506] nvme 0005:03:00.0: save config 0x2c: 0x2263126f
   [    0.702508] nvme 0005:03:00.0: save config 0x30: 0x00000000
   [    0.702511] nvme 0005:03:00.0: save config 0x34: 0x00000040
   [    0.702513] nvme 0005:03:00.0: save config 0x38: 0x00000000
   [    0.702516] nvme 0005:03:00.0: save config 0x3c: 0x000001ff
   [    0.702938] nvme nvme1: pci function 0005:04:00.0
   [    0.703007] nvme 0005:04:00.0: save config 0x00: 0x501715b7
   [    0.703010] nvme 0005:04:00.0: save config 0x04: 0x00100407
   [    0.703012] nvme 0005:04:00.0: save config 0x08: 0x01080201
   [    0.703014] nvme 0005:04:00.0: save config 0x0c: 0x00000000
   [    0.703016] nvme 0005:04:00.0: save config 0x10: 0x30600004
   [    0.703019] nvme 0005:04:00.0: save config 0x14: 0x00000000
   [    0.703021] nvme 0005:04:00.0: save config 0x18: 0x00000000
   [    0.703023] nvme 0005:04:00.0: save config 0x1c: 0x00000000
   [    0.703025] nvme 0005:04:00.0: save config 0x20: 0x00000000
   [    0.703028] nvme 0005:04:00.0: save config 0x24: 0x00000000
   [    0.703030] nvme 0005:04:00.0: save config 0x28: 0x00000000
   [    0.703032] nvme 0005:04:00.0: save config 0x2c: 0x501715b7
   [    0.703034] nvme 0005:04:00.0: save config 0x30: 0x00000000
   [    0.703036] nvme 0005:04:00.0: save config 0x34: 0x00000080
   [    0.703038] nvme 0005:04:00.0: save config 0x38: 0x00000000
   [    0.703040] nvme 0005:04:00.0: save config 0x3c: 0x000001ff
   [    0.703442] rtc-efi rtc-efi.0: registered as rtc0
   [    0.703787] rtc-efi rtc-efi.0: setting system clock to 2025-11-14T10:=
49:42 UTC (1763117382)
   [    0.704377] efifb: probing for efifb
   [    0.704389] efifb: framebuffer at 0x20000000, using 3072k, total 3072k
   [    0.704391] efifb: mode is 1024x768x32, linelength=3D4096, pages=3D1
   [    0.704393] efifb: scrolling: redraw
   [    0.704393] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
   [    0.706691] nvme nvme0: missing or invalid SUBNQN field.
   [    0.714105] Console: switching to colour frame buffer device 128x48
   [    0.723723] fb0: EFI VGA frame buffer device
   [    0.723919] SMCCC: SOC_ID: ID =3D jep106:0a16:0001 Revision =3D 0x000=
000a1
   [    0.723993] clocksource: arch_mmio_counter: mask: 0xffffffffffffff ma=
x_cycles: 0x5c40939b5, max_idle_ns: 440795202646 ns
   [    0.723997] gtdt-arm-mmio-timer gtdt-arm-mmio-timer.0: mmio timer run=
ning at 25.00MHz (phys)
   [    0.732899] hw perfevents: enabled with armv8_pmuv3_0 PMU driver, 7 (=
0,8000003f) counters available
   [    0.733324] NET: Registered PF_INET6 protocol family
   [    0.733787] Segment Routing with IPv6
   [    0.733797] In-situ OAM (IOAM) with IPv6
   [    0.733818] mip6: Mobile IPv6
   [    0.733821] NET: Registered PF_PACKET protocol family
   [    0.733867] mpls_gso: MPLS GSO support
   [    0.735967] registered taskstats version 1
   [    0.736252] Loading compiled-in X.509 certificates
   [    0.737305] Loaded X.509 cert 'Build time autogenerated kernel key: 7=
1bf1bbf0712f0773aab894a046f44b4dac16a47'
   [    0.739085] nvme nvme0: 15/0/0 default/read/poll queues
   [    0.740131] nvme nvme1: allocated 128 MiB host memory buffer (1 segme=
nt).
   [    0.743250] nvme nvme0: Ignoring bogus Namespace Identifiers
   [    0.744513] nvme nvme1: 32/0/0 default/read/poll queues
   [    0.745982] Demotion targets for Node 0: null
   [    0.747391]  nvme0n1: p1
   [    0.747451] Key type .fscrypt registered
   [    0.747454] Key type fscrypt-provisioning registered
   [    0.747555] nvme 0005:03:00.0: vgaarb: pci_notify
   [    0.750401]  nvme1n1: p1 p2 p3
   [    0.750600] nvme 0005:04:00.0: vgaarb: pci_notify
   [    0.772251] Key type encrypted registered
   [    0.772254] AppArmor: AppArmor sha256 policy hashing enabled
   [    0.772434] ima: secureboot mode disabled
   [    0.772442] ima: Allocated hash algorithm: sha256
   [    0.973424] ima: No architecture policies found
   [    0.973462] evm: Initialising EVM extended attributes:
   [    0.973463] evm: security.selinux
   [    0.973464] evm: security.SMACK64 (disabled)
   [    0.973465] evm: security.SMACK64EXEC (disabled)
   [    0.973467] evm: security.SMACK64TRANSMUTE (disabled)
   [    0.973468] evm: security.SMACK64MMAP (disabled)
   [    0.973469] evm: security.apparmor
   [    0.973469] evm: security.ima
   [    0.973470] evm: security.capability
   [    0.973471] evm: HMAC attrs: 0x1
   [    0.973674] pcieport 000c:00:01.0: vgaarb: pci_notify
   [    0.973681] pcieport 000c:00:01.0: runtime IRQ mapping not provided b=
y arch
   [    0.973825] pcieport 000c:00:01.0: bwctrl: enabled with IRQ 130
   [    0.973841] pcieport 000c:00:01.0: save config 0x00: 0xe1011def
   [    0.973844] pcieport 000c:00:01.0: save config 0x04: 0x00100007
   [    0.973846] pcieport 000c:00:01.0: save config 0x08: 0x06040004
   [    0.973848] pcieport 000c:00:01.0: save config 0x0c: 0x00010000
   [    0.973850] pcieport 000c:00:01.0: save config 0x10: 0x00000000
   [    0.973852] pcieport 000c:00:01.0: save config 0x14: 0x00000000
   [    0.973853] pcieport 000c:00:01.0: save config 0x18: 0x00010100
   [    0.973855] pcieport 000c:00:01.0: save config 0x1c: 0x000000f0
   [    0.973857] pcieport 000c:00:01.0: save config 0x20: 0x40104000
   [    0.973859] pcieport 000c:00:01.0: save config 0x24: 0x00110001
   [    0.973861] pcieport 000c:00:01.0: save config 0x28: 0x00003000
   [    0.973863] pcieport 000c:00:01.0: save config 0x2c: 0x00003000
   [    0.973865] pcieport 000c:00:01.0: save config 0x30: 0x00000000
   [    0.973866] pcieport 000c:00:01.0: save config 0x34: 0x00000040
   [    0.973868] pcieport 000c:00:01.0: save config 0x38: 0x00000000
   [    0.973870] pcieport 000c:00:01.0: save config 0x3c: 0x000201ff
   [    0.973900] pcieport 000c:00:01.0: vgaarb: pci_notify
   [    0.973921] pcieport 000d:00:01.0: vgaarb: pci_notify
   [    0.973926] pcieport 000d:00:01.0: runtime IRQ mapping not provided b=
y arch
   [    0.974007] pcieport 000d:00:01.0: bwctrl: enabled with IRQ 131
   [    0.974016] pcieport 000d:00:01.0: save config 0x00: 0xe1011def
   [    0.974018] pcieport 000d:00:01.0: save config 0x04: 0x00100007
   [    0.974020] pcieport 000d:00:01.0: save config 0x08: 0x06040004
   [    0.974022] pcieport 000d:00:01.0: save config 0x0c: 0x00010000
   [    0.974023] pcieport 000d:00:01.0: save config 0x10: 0x00000000
   [    0.974025] pcieport 000d:00:01.0: save config 0x14: 0x00000000
   [    0.974026] pcieport 000d:00:01.0: save config 0x18: 0x00030100
   [    0.974028] pcieport 000d:00:01.0: save config 0x1c: 0x000000f0
   [    0.974030] pcieport 000d:00:01.0: save config 0x20: 0x50205000
   [    0.974031] pcieport 000d:00:01.0: save config 0x24: 0x17f10001
   [    0.974033] pcieport 000d:00:01.0: save config 0x28: 0x00003400
   [    0.974034] pcieport 000d:00:01.0: save config 0x2c: 0x00003400
   [    0.974036] pcieport 000d:00:01.0: save config 0x30: 0x00000000
   [    0.974038] pcieport 000d:00:01.0: save config 0x34: 0x00000040
   [    0.974039] pcieport 000d:00:01.0: save config 0x38: 0x00000000
   [    0.974041] pcieport 000d:00:01.0: save config 0x3c: 0x000201ff
   [    0.974062] pcieport 000d:00:01.0: vgaarb: pci_notify
   [    0.974074] pcieport 000d:01:00.0: vgaarb: pci_notify
   [    0.974078] pcieport 000d:01:00.0: runtime IRQ mapping not provided b=
y arch
   [    0.974115] pcieport 000d:01:00.0: save config 0x00: 0x14781002
   [    0.974118] pcieport 000d:01:00.0: save config 0x04: 0x00100007
   [    0.974121] pcieport 000d:01:00.0: save config 0x08: 0x06040012
   [    0.974123] pcieport 000d:01:00.0: save config 0x0c: 0x00010000
   [    0.974126] pcieport 000d:01:00.0: save config 0x10: 0x50200000
   [    0.974128] pcieport 000d:01:00.0: save config 0x14: 0x00000000
   [    0.974131] pcieport 000d:01:00.0: save config 0x18: 0x00030201
   [    0.974133] pcieport 000d:01:00.0: save config 0x1c: 0x000001f1
   [    0.974135] pcieport 000d:01:00.0: save config 0x20: 0x50105000
   [    0.974138] pcieport 000d:01:00.0: save config 0x24: 0x17f10001
   [    0.974140] pcieport 000d:01:00.0: save config 0x28: 0x00003400
   [    0.974142] pcieport 000d:01:00.0: save config 0x2c: 0x00003400
   [    0.974145] pcieport 000d:01:00.0: save config 0x30: 0x00000000
   [    0.974147] pcieport 000d:01:00.0: save config 0x34: 0x00000048
   [    0.974149] pcieport 000d:01:00.0: save config 0x38: 0x00000000
   [    0.974152] pcieport 000d:01:00.0: save config 0x3c: 0x000201ff
   [    0.974198] pcieport 000d:01:00.0: vgaarb: pci_notify
   [    0.974208] pcieport 000d:02:00.0: vgaarb: pci_notify
   [    0.974212] pcieport 000d:02:00.0: runtime IRQ mapping not provided b=
y arch
   [    0.974354] pcieport 000d:02:00.0: bwctrl: enabled with IRQ 132
   [    0.974364] pcieport 000d:02:00.0: save config 0x00: 0x14791002
   [    0.974366] pcieport 000d:02:00.0: save config 0x04: 0x00100407
   [    0.974369] pcieport 000d:02:00.0: save config 0x08: 0x06040012
   [    0.974371] pcieport 000d:02:00.0: save config 0x0c: 0x00010000
   [    0.974373] pcieport 000d:02:00.0: save config 0x10: 0x00000000
   [    0.974376] pcieport 000d:02:00.0: save config 0x14: 0x00000000
   [    0.974378] pcieport 000d:02:00.0: save config 0x18: 0x00030302
   [    0.974381] pcieport 000d:02:00.0: save config 0x1c: 0x000001f1
   [    0.974383] pcieport 000d:02:00.0: save config 0x20: 0x50105000
   [    0.974386] pcieport 000d:02:00.0: save config 0x24: 0x10110001
   [    0.974388] pcieport 000d:02:00.0: save config 0x28: 0x00003400
   [    0.974390] pcieport 000d:02:00.0: save config 0x2c: 0x00003400
   [    0.974393] pcieport 000d:02:00.0: save config 0x30: 0x00000000
   [    0.974395] pcieport 000d:02:00.0: save config 0x34: 0x00000050
   [    0.974397] pcieport 000d:02:00.0: save config 0x38: 0x00000000
   [    0.974400] pcieport 000d:02:00.0: save config 0x3c: 0x000201ff
   [    0.974448] pcieport 000d:02:00.0: vgaarb: pci_notify
   [    0.974466] pcieport 0000:00:01.0: vgaarb: pci_notify
   [    0.974471] pcieport 0000:00:01.0: runtime IRQ mapping not provided b=
y arch
   [    0.974555] pcieport 0000:00:01.0: bwctrl: enabled with IRQ 133
   [    0.974564] pcieport 0000:00:01.0: save config 0x00: 0xe1011def
   [    0.974565] pcieport 0000:00:01.0: save config 0x04: 0x00100007
   [    0.974567] pcieport 0000:00:01.0: save config 0x08: 0x06040004
   [    0.974569] pcieport 0000:00:01.0: save config 0x0c: 0x00010000
   [    0.974571] pcieport 0000:00:01.0: save config 0x10: 0x00000000
   [    0.974573] pcieport 0000:00:01.0: save config 0x14: 0x00000000
   [    0.974574] pcieport 0000:00:01.0: save config 0x18: 0x00010100
   [    0.974576] pcieport 0000:00:01.0: save config 0x1c: 0x000000f0
   [    0.974578] pcieport 0000:00:01.0: save config 0x20: 0x70107000
   [    0.974579] pcieport 0000:00:01.0: save config 0x24: 0x00110001
   [    0.974581] pcieport 0000:00:01.0: save config 0x28: 0x00003c00
   [    0.974583] pcieport 0000:00:01.0: save config 0x2c: 0x00003c00
   [    0.974585] pcieport 0000:00:01.0: save config 0x30: 0x00000000
   [    0.974586] pcieport 0000:00:01.0: save config 0x34: 0x00000040
   [    0.974588] pcieport 0000:00:01.0: save config 0x38: 0x00000000
   [    0.974590] pcieport 0000:00:01.0: save config 0x3c: 0x000201ff
   [    0.974621] pcieport 0000:00:01.0: vgaarb: pci_notify
   [    0.974635] pcieport 0002:00:01.0: vgaarb: pci_notify
   [    0.974640] pcieport 0002:00:01.0: runtime IRQ mapping not provided b=
y arch
   [    0.974737] pcieport 0002:00:01.0: bwctrl: enabled with IRQ 134
   [    0.974746] pcieport 0002:00:01.0: save config 0x00: 0xe1111def
   [    0.974747] pcieport 0002:00:01.0: save config 0x04: 0x00100007
   [    0.974749] pcieport 0002:00:01.0: save config 0x08: 0x06040004
   [    0.974751] pcieport 0002:00:01.0: save config 0x0c: 0x00010000
   [    0.974753] pcieport 0002:00:01.0: save config 0x10: 0x00000000
   [    0.974755] pcieport 0002:00:01.0: save config 0x14: 0x00000000
   [    0.974756] pcieport 0002:00:01.0: save config 0x18: 0x00010100
   [    0.974758] pcieport 0002:00:01.0: save config 0x1c: 0x000000f0
   [    0.974760] pcieport 0002:00:01.0: save config 0x20: 0x08100800
   [    0.974761] pcieport 0002:00:01.0: save config 0x24: 0x00110001
   [    0.974763] pcieport 0002:00:01.0: save config 0x28: 0x00002000
   [    0.974765] pcieport 0002:00:01.0: save config 0x2c: 0x00002000
   [    0.974766] pcieport 0002:00:01.0: save config 0x30: 0x00000000
   [    0.974768] pcieport 0002:00:01.0: save config 0x34: 0x00000040
   [    0.974770] pcieport 0002:00:01.0: save config 0x38: 0x00000000
   [    0.974772] pcieport 0002:00:01.0: save config 0x3c: 0x000201ff
   [    0.974804] pcieport 0002:00:01.0: vgaarb: pci_notify
   [    0.974816] pcieport 0002:00:05.0: vgaarb: pci_notify
   [    0.974820] pcieport 0002:00:05.0: runtime IRQ mapping not provided b=
y arch
   [    0.974877] pcieport 0002:00:05.0: bwctrl: enabled with IRQ 134
   [    0.974885] pcieport 0002:00:05.0: save config 0x00: 0xe1151def
   [    0.974887] pcieport 0002:00:05.0: save config 0x04: 0x00100007
   [    0.974889] pcieport 0002:00:05.0: save config 0x08: 0x06040004
   [    0.974891] pcieport 0002:00:05.0: save config 0x0c: 0x00010000
   [    0.974892] pcieport 0002:00:05.0: save config 0x10: 0x00000000
   [    0.974894] pcieport 0002:00:05.0: save config 0x14: 0x00000000
   [    0.974896] pcieport 0002:00:05.0: save config 0x18: 0x00020200
   [    0.974898] pcieport 0002:00:05.0: save config 0x1c: 0x000000f0
   [    0.974900] pcieport 0002:00:05.0: save config 0x20: 0x08300820
   [    0.974902] pcieport 0002:00:05.0: save config 0x24: 0x00310021
   [    0.974904] pcieport 0002:00:05.0: save config 0x28: 0x00002000
   [    0.974906] pcieport 0002:00:05.0: save config 0x2c: 0x00002000
   [    0.974908] pcieport 0002:00:05.0: save config 0x30: 0x00000000
   [    0.974909] pcieport 0002:00:05.0: save config 0x34: 0x00000040
   [    0.974911] pcieport 0002:00:05.0: save config 0x38: 0x00000000
   [    0.974913] pcieport 0002:00:05.0: save config 0x3c: 0x000201ff
   [    0.974942] pcieport 0002:00:05.0: vgaarb: pci_notify
   [    0.974960] pcieport 0004:00:01.0: vgaarb: pci_notify
   [    0.974965] pcieport 0004:00:01.0: runtime IRQ mapping not provided b=
y arch
   [    0.975064] pcieport 0004:00:01.0: bwctrl: enabled with IRQ 135
   [    0.975072] pcieport 0004:00:01.0: save config 0x00: 0xe1111def
   [    0.975074] pcieport 0004:00:01.0: save config 0x04: 0x00100007
   [    0.975076] pcieport 0004:00:01.0: save config 0x08: 0x06040004
   [    0.975077] pcieport 0004:00:01.0: save config 0x0c: 0x00010000
   [    0.975079] pcieport 0004:00:01.0: save config 0x10: 0x00000000
   [    0.975081] pcieport 0004:00:01.0: save config 0x14: 0x00000000
   [    0.975082] pcieport 0004:00:01.0: save config 0x18: 0x00020100
   [    0.975084] pcieport 0004:00:01.0: save config 0x1c: 0x000000f0
   [    0.975085] pcieport 0004:00:01.0: save config 0x20: 0x21702000
   [    0.975087] pcieport 0004:00:01.0: save config 0x24: 0x00110001
   [    0.975089] pcieport 0004:00:01.0: save config 0x28: 0x00002800
   [    0.975090] pcieport 0004:00:01.0: save config 0x2c: 0x00002800
   [    0.975092] pcieport 0004:00:01.0: save config 0x30: 0x00000000
   [    0.975094] pcieport 0004:00:01.0: save config 0x34: 0x00000040
   [    0.975095] pcieport 0004:00:01.0: save config 0x38: 0x00000000
   [    0.975097] pcieport 0004:00:01.0: save config 0x3c: 0x000201ff
   [    0.975119] pcieport 0004:00:01.0: vgaarb: pci_notify
   [    0.975131] pcieport 0004:00:03.0: vgaarb: pci_notify
   [    0.975135] pcieport 0004:00:03.0: runtime IRQ mapping not provided b=
y arch
   [    0.975190] pcieport 0004:00:03.0: bwctrl: enabled with IRQ 135
   [    0.975198] pcieport 0004:00:03.0: save config 0x00: 0xe1131def
   [    0.975199] pcieport 0004:00:03.0: save config 0x04: 0x00100007
   [    0.975201] pcieport 0004:00:03.0: save config 0x08: 0x06040004
   [    0.975203] pcieport 0004:00:03.0: save config 0x0c: 0x00010000
   [    0.975204] pcieport 0004:00:03.0: save config 0x10: 0x00000000
   [    0.975206] pcieport 0004:00:03.0: save config 0x14: 0x00000000
   [    0.975208] pcieport 0004:00:03.0: save config 0x18: 0x00030300
   [    0.975209] pcieport 0004:00:03.0: save config 0x1c: 0x000000f0
   [    0.975211] pcieport 0004:00:03.0: save config 0x20: 0x21902180
   [    0.975213] pcieport 0004:00:03.0: save config 0x24: 0x00310021
   [    0.975215] pcieport 0004:00:03.0: save config 0x28: 0x00002800
   [    0.975216] pcieport 0004:00:03.0: save config 0x2c: 0x00002800
   [    0.975218] pcieport 0004:00:03.0: save config 0x30: 0x00000000
   [    0.975219] pcieport 0004:00:03.0: save config 0x34: 0x00000040
   [    0.975221] pcieport 0004:00:03.0: save config 0x38: 0x00000000
   [    0.975223] pcieport 0004:00:03.0: save config 0x3c: 0x000201ff
   [    0.975244] pcieport 0004:00:03.0: vgaarb: pci_notify
   [    0.975255] pcieport 0004:00:05.0: vgaarb: pci_notify
   [    0.975259] pcieport 0004:00:05.0: runtime IRQ mapping not provided b=
y arch
   [    0.975315] pcieport 0004:00:05.0: bwctrl: enabled with IRQ 135
   [    0.975323] pcieport 0004:00:05.0: save config 0x00: 0xe1151def
   [    0.975325] pcieport 0004:00:05.0: save config 0x04: 0x00100007
   [    0.975327] pcieport 0004:00:05.0: save config 0x08: 0x06040004
   [    0.975329] pcieport 0004:00:05.0: save config 0x0c: 0x00010000
   [    0.975331] pcieport 0004:00:05.0: save config 0x10: 0x00000000
   [    0.975332] pcieport 0004:00:05.0: save config 0x14: 0x00000000
   [    0.975334] pcieport 0004:00:05.0: save config 0x18: 0x00040400
   [    0.975336] pcieport 0004:00:05.0: save config 0x1c: 0x000000f0
   [    0.975337] pcieport 0004:00:05.0: save config 0x20: 0x21b021a0
   [    0.975339] pcieport 0004:00:05.0: save config 0x24: 0x00510041
   [    0.975341] pcieport 0004:00:05.0: save config 0x28: 0x00002800
   [    0.975343] pcieport 0004:00:05.0: save config 0x2c: 0x00002800
   [    0.975344] pcieport 0004:00:05.0: save config 0x30: 0x00000000
   [    0.975346] pcieport 0004:00:05.0: save config 0x34: 0x00000040
   [    0.975348] pcieport 0004:00:05.0: save config 0x38: 0x00000000
   [    0.975350] pcieport 0004:00:05.0: save config 0x3c: 0x000201ff
   [    0.975374] pcieport 0004:00:05.0: vgaarb: pci_notify
   [    0.975385] pcieport 0004:00:07.0: vgaarb: pci_notify
   [    0.975389] pcieport 0004:00:07.0: runtime IRQ mapping not provided b=
y arch
   [    0.975446] pcieport 0004:00:07.0: bwctrl: enabled with IRQ 135
   [    0.975454] pcieport 0004:00:07.0: save config 0x00: 0xe1171def
   [    0.975456] pcieport 0004:00:07.0: save config 0x04: 0x00100007
   [    0.975458] pcieport 0004:00:07.0: save config 0x08: 0x06040004
   [    0.975459] pcieport 0004:00:07.0: save config 0x0c: 0x00010000
   [    0.975461] pcieport 0004:00:07.0: save config 0x10: 0x00000000
   [    0.975463] pcieport 0004:00:07.0: save config 0x14: 0x00000000
   [    0.975465] pcieport 0004:00:07.0: save config 0x18: 0x00050500
   [    0.975466] pcieport 0004:00:07.0: save config 0x1c: 0x000000f0
   [    0.975468] pcieport 0004:00:07.0: save config 0x20: 0x21d021c0
   [    0.975470] pcieport 0004:00:07.0: save config 0x24: 0x00710061
   [    0.975472] pcieport 0004:00:07.0: save config 0x28: 0x00002800
   [    0.975473] pcieport 0004:00:07.0: save config 0x2c: 0x00002800
   [    0.975475] pcieport 0004:00:07.0: save config 0x30: 0x00000000
   [    0.975477] pcieport 0004:00:07.0: save config 0x34: 0x00000040
   [    0.975479] pcieport 0004:00:07.0: save config 0x38: 0x00000000
   [    0.975481] pcieport 0004:00:07.0: save config 0x3c: 0x000201ff
   [    0.975506] pcieport 0004:00:07.0: vgaarb: pci_notify
   [    0.975517] pcieport 0004:01:00.0: vgaarb: pci_notify
   [    0.975521] pcieport 0004:01:00.0: runtime IRQ mapping not provided b=
y arch
   [    0.975557] pcieport 0004:01:00.0: vgaarb: pci_notify
   [    0.975563] shpchp 0004:01:00.0: vgaarb: pci_notify
   [    0.975567] shpchp 0004:01:00.0: runtime IRQ mapping not provided by =
arch
   [    0.975585] shpchp 0004:01:00.0: vgaarb: pci_notify
   [    0.975598] pcieport 0005:00:01.0: vgaarb: pci_notify
   [    0.975602] pcieport 0005:00:01.0: runtime IRQ mapping not provided b=
y arch
   [    0.975687] pcieport 0005:00:01.0: bwctrl: enabled with IRQ 79
   [    0.975695] pcieport 0005:00:01.0: save config 0x00: 0xe1111def
   [    0.975697] pcieport 0005:00:01.0: save config 0x04: 0x00100007
   [    0.975699] pcieport 0005:00:01.0: save config 0x08: 0x06040004
   [    0.975701] pcieport 0005:00:01.0: save config 0x0c: 0x00010000
   [    0.975703] pcieport 0005:00:01.0: save config 0x10: 0x00000000
   [    0.975705] pcieport 0005:00:01.0: save config 0x14: 0x00000000
   [    0.975707] pcieport 0005:00:01.0: save config 0x18: 0x00010100
   [    0.975709] pcieport 0005:00:01.0: save config 0x1c: 0x000000f0
   [    0.975710] pcieport 0005:00:01.0: save config 0x20: 0x30103000
   [    0.975712] pcieport 0005:00:01.0: save config 0x24: 0x00110001
   [    0.975714] pcieport 0005:00:01.0: save config 0x28: 0x00002c00
   [    0.975716] pcieport 0005:00:01.0: save config 0x2c: 0x00002c00
   [    0.975717] pcieport 0005:00:01.0: save config 0x30: 0x00000000
   [    0.975719] pcieport 0005:00:01.0: save config 0x34: 0x00000040
   [    0.975721] pcieport 0005:00:01.0: save config 0x38: 0x00000000
   [    0.975723] pcieport 0005:00:01.0: save config 0x3c: 0x000201ff
   [    0.975748] pcieport 0005:00:01.0: vgaarb: pci_notify
   [    0.975759] pcieport 0005:00:03.0: vgaarb: pci_notify
   [    0.975763] pcieport 0005:00:03.0: runtime IRQ mapping not provided b=
y arch
   [    0.975821] pcieport 0005:00:03.0: bwctrl: enabled with IRQ 79
   [    0.975829] pcieport 0005:00:03.0: save config 0x00: 0xe1131def
   [    0.975831] pcieport 0005:00:03.0: save config 0x04: 0x00100007
   [    0.975833] pcieport 0005:00:03.0: save config 0x08: 0x06040004
   [    0.975835] pcieport 0005:00:03.0: save config 0x0c: 0x00010000
   [    0.975836] pcieport 0005:00:03.0: save config 0x10: 0x00000000
   [    0.975839] pcieport 0005:00:03.0: save config 0x14: 0x00000000
   [    0.975840] pcieport 0005:00:03.0: save config 0x18: 0x00020200
   [    0.975842] pcieport 0005:00:03.0: save config 0x1c: 0x000000f0
   [    0.975844] pcieport 0005:00:03.0: save config 0x20: 0x30303020
   [    0.975846] pcieport 0005:00:03.0: save config 0x24: 0x00310021
   [    0.975848] pcieport 0005:00:03.0: save config 0x28: 0x00002c00
   [    0.975850] pcieport 0005:00:03.0: save config 0x2c: 0x00002c00
   [    0.975852] pcieport 0005:00:03.0: save config 0x30: 0x00000000
   [    0.975854] pcieport 0005:00:03.0: save config 0x34: 0x00000040
   [    0.975855] pcieport 0005:00:03.0: save config 0x38: 0x00000000
   [    0.975857] pcieport 0005:00:03.0: save config 0x3c: 0x000201ff
   [    0.975882] pcieport 0005:00:03.0: vgaarb: pci_notify
   [    0.975896] pcieport 0005:00:05.0: vgaarb: pci_notify
   [    0.975901] pcieport 0005:00:05.0: runtime IRQ mapping not provided b=
y arch
   [    0.975953] pcieport 0005:00:05.0: bwctrl: enabled with IRQ 79
   [    0.975960] pcieport 0005:00:05.0: save config 0x00: 0xe1151def
   [    0.975962] pcieport 0005:00:05.0: save config 0x04: 0x00100007
   [    0.975964] pcieport 0005:00:05.0: save config 0x08: 0x06040004
   [    0.975965] pcieport 0005:00:05.0: save config 0x0c: 0x00010000
   [    0.975967] pcieport 0005:00:05.0: save config 0x10: 0x00000000
   [    0.975969] pcieport 0005:00:05.0: save config 0x14: 0x00000000
   [    0.975971] pcieport 0005:00:05.0: save config 0x18: 0x00030300
   [    0.975972] pcieport 0005:00:05.0: save config 0x1c: 0x000000f0
   [    0.975974] pcieport 0005:00:05.0: save config 0x20: 0x30503040
   [    0.975976] pcieport 0005:00:05.0: save config 0x24: 0x00510041
   [    0.975977] pcieport 0005:00:05.0: save config 0x28: 0x00002c00
   [    0.975979] pcieport 0005:00:05.0: save config 0x2c: 0x00002c00
   [    0.975981] pcieport 0005:00:05.0: save config 0x30: 0x00000000
   [    0.975982] pcieport 0005:00:05.0: save config 0x34: 0x00000040
   [    0.975984] pcieport 0005:00:05.0: save config 0x38: 0x00000000
   [    0.975986] pcieport 0005:00:05.0: save config 0x3c: 0x000201ff
   [    0.976005] pcieport 0005:00:05.0: vgaarb: pci_notify
   [    0.976020] pcieport 0005:00:07.0: vgaarb: pci_notify
   [    0.976024] pcieport 0005:00:07.0: runtime IRQ mapping not provided b=
y arch
   [    0.976076] pcieport 0005:00:07.0: bwctrl: enabled with IRQ 79
   [    0.976084] pcieport 0005:00:07.0: save config 0x00: 0xe1171def
   [    0.976086] pcieport 0005:00:07.0: save config 0x04: 0x00100007
   [    0.976088] pcieport 0005:00:07.0: save config 0x08: 0x06040004
   [    0.976090] pcieport 0005:00:07.0: save config 0x0c: 0x00010000
   [    0.976092] pcieport 0005:00:07.0: save config 0x10: 0x00000000
   [    0.976094] pcieport 0005:00:07.0: save config 0x14: 0x00000000
   [    0.976096] pcieport 0005:00:07.0: save config 0x18: 0x00040400
   [    0.976097] pcieport 0005:00:07.0: save config 0x1c: 0x000000f0
   [    0.976099] pcieport 0005:00:07.0: save config 0x20: 0x30703060
   [    0.976101] pcieport 0005:00:07.0: save config 0x24: 0x00710061
   [    0.976102] pcieport 0005:00:07.0: save config 0x28: 0x00002c00
   [    0.976104] pcieport 0005:00:07.0: save config 0x2c: 0x00002c00
   [    0.976105] pcieport 0005:00:07.0: save config 0x30: 0x00000000
   [    0.976107] pcieport 0005:00:07.0: save config 0x34: 0x00000040
   [    0.976109] pcieport 0005:00:07.0: save config 0x38: 0x00000000
   [    0.976111] pcieport 0005:00:07.0: save config 0x3c: 0x000201ff
   [    0.976130] pcieport 0005:00:07.0: vgaarb: pci_notify
   [    0.976241] clk: Disabling unused clocks
   [    0.976246] PM: genpd: Disabling unused power domains
   [    1.014086] Freeing unused kernel memory: 3008K
   [    1.146619] Checked W+X mappings: passed, no W+X pages found
   [    1.146632] Run /init as init process
   [    1.146635]   with arguments:
   [    1.146638]     /init
   [    1.146641]   with environment:
   [    1.146643]     HOME=3D/
   [    1.146645]     TERM=3Dlinux
   [    1.585453] ACPI: bus type USB registered
   [    1.585506] usbcore: registered new interface driver usbfs
   [    1.585518] usbcore: registered new interface driver hub
   [    1.585543] usbcore: registered new device driver usb
   [    1.662165] xhci_hcd 0004:03:00.0: vgaarb: pci_notify
   [    1.662173] xhci_hcd 0004:03:00.0: runtime IRQ mapping not provided b=
y arch
   [    1.662262] xhci_hcd 0004:03:00.0: vgaarb: pci_notify
   [    1.694997] xhci-pci-renesas 0004:03:00.0: vgaarb: pci_notify
   [    1.695003] xhci-pci-renesas 0004:03:00.0: runtime IRQ mapping not pr=
ovided by arch
   [    1.695045] xhci-pci-renesas 0004:03:00.0: enabling bus mastering
   [    1.695052] xhci-pci-renesas 0004:03:00.0: xHCI Host Controller
   [    1.695063] xhci-pci-renesas 0004:03:00.0: new USB bus registered, as=
signed bus number 1
   [    1.695085] xhci-pci-renesas 0004:03:00.0: Zeroing 64bit base registe=
rs, expecting fault
   [    1.882955] xhci-pci-renesas 0004:03:00.0: hcc params 0x014051cf hci =
version 0x100 quirks 0x0000000100000010
   [    1.882964] xhci-pci-renesas 0004:03:00.0: enabling Mem-Wr-Inval
   [    1.883342] xhci-pci-renesas 0004:03:00.0: xHCI Host Controller
   [    1.883346] xhci-pci-renesas 0004:03:00.0: new USB bus registered, as=
signed bus number 2
   [    1.883349] xhci-pci-renesas 0004:03:00.0: Host supports USB 3.0 Supe=
rSpeed
   [    1.886491] usb usb1: New USB device found, idVendor=3D1d6b, idProduc=
t=3D0002, bcdDevice=3D 6.18
   [    1.886494] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, S=
erialNumber=3D1
   [    1.886496] usb usb1: Product: xHCI Host Controller
   [    1.886498] usb usb1: Manufacturer: Linux 6.18.0-rc5-ajb-debian-bisec=
t-00022-g832f811c236d xhci-hcd
   [    1.886500] usb usb1: SerialNumber: 0004:03:00.0
   [    1.886691] hub 1-0:1.0: USB hub found
   [    1.886704] hub 1-0:1.0: 4 ports detected
   [    1.886886] usb usb2: We don't know the algorithms for LPM for this h=
ost, disabling LPM.
   [    1.886912] usb usb2: New USB device found, idVendor=3D1d6b, idProduc=
t=3D0003, bcdDevice=3D 6.18
   [    1.886914] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, S=
erialNumber=3D1
   [    1.886916] usb usb2: Product: xHCI Host Controller
   [    1.886918] usb usb2: Manufacturer: Linux 6.18.0-rc5-ajb-debian-bisec=
t-00022-g832f811c236d xhci-hcd
   [    1.886919] usb usb2: SerialNumber: 0004:03:00.0
   [    1.887040] hub 2-0:1.0: USB hub found
   [    1.887053] hub 2-0:1.0: 4 ports detected
   [    1.887231] xhci-pci-renesas 0004:03:00.0: vgaarb: pci_notify
   [    2.148301] usb 1-4: new high-speed USB device number 2 using xhci-pc=
i-renesas
   [    2.307092] usb 1-4: New USB device found, idVendor=3D0424, idProduct=
=3D4206, bcdDevice=3D 6.25
   [    2.307097] usb 1-4: New USB device strings: Mfr=3D1, Product=3D2, Se=
rialNumber=3D0
   [    2.307099] usb 1-4: Product: USB4206 Smart Hub
   [    2.307100] usb 1-4: Manufacturer: Microchip
   [    2.310384] hub 1-4:1.0: USB hub found
   [    2.310717] hub 1-4:1.0: 5 ports detected
   [    2.328882] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disable=
d. Duplicate IMA measurements will not be recorded in the IMA log.
   [    2.328930] device-mapper: uevent: version 1.0.3
   [    2.329037] device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialis=
ed: dm-devel@lists.linux.dev
   [    2.427253] usb 2-4: new SuperSpeed USB device number 2 using xhci-pc=
i-renesas
   [    2.450091] usb 2-4: New USB device found, idVendor=3D0424, idProduct=
=3D7206, bcdDevice=3D 6.25
   [    2.450094] usb 2-4: New USB device strings: Mfr=3D1, Product=3D2, Se=
rialNumber=3D0
   [    2.450096] usb 2-4: Product: USB7206 Smart Hub
   [    2.450097] usb 2-4: Manufacturer: Microchip
   [    2.453630] hub 2-4:1.0: USB hub found
   [    2.453968] hub 2-4:1.0: 3 ports detected
   [    2.622489] usb 1-4.4: new high-speed USB device number 3 using xhci-=
pci-renesas
   [    2.725089] usb 1-4.4: New USB device found, idVendor=3D046b, idProdu=
ct=3Dff01, bcdDevice=3D 1.00
   [    2.725092] usb 1-4.4: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D3
   [    2.725094] usb 1-4.4: Product: Virtual Hub
   [    2.725096] usb 1-4.4: Manufacturer: American Megatrends Inc.
   [    2.725097] usb 1-4.4: SerialNumber: serial
   [    2.729980] hub 1-4.4:1.0: USB hub found
   [    2.730337] hub 1-4.4:1.0: 5 ports detected
   [    2.824106] usb 1-4.5: new high-speed USB device number 4 using xhci-=
pci-renesas
   [    2.921842] usb 1-4.5: New USB device found, idVendor=3D0424, idProdu=
ct=3D724a, bcdDevice=3D 6.25
   [    2.921847] usb 1-4.5: New USB device strings: Mfr=3D1, Product=3D2, =
SerialNumber=3D0
   [    2.921849] usb 1-4.5: Product: USB2 Controller Hub
   [    2.921851] usb 1-4.5: Manufacturer: Microchip Tech
   [    3.034468] usb 1-4.4.3: new low-speed USB device number 5 using xhci=
-pci-renesas
   [    3.043407] raid6: neonx8   gen()  9280 MB/s
   [    3.115170] raid6: neonx4   gen()  9199 MB/s
   [    3.161470] usb 1-4.4.3: New USB device found, idVendor=3D046b, idPro=
duct=3Dff10, bcdDevice=3D 1.00
   [    3.161476] usb 1-4.4.3: New USB device strings: Mfr=3D1, Product=3D2=
, SerialNumber=3D0
   [    3.161480] usb 1-4.4.3: Product: Virtual Keyboard and Mouse
   [    3.161483] usb 1-4.4.3: Manufacturer: American Megatrends Inc.
   [    3.188411] raid6: neonx2   gen()  7532 MB/s
   [    3.205784] hid: raw HID events driver (C) Jiri Kosina
   [    3.240997] usbcore: registered new interface driver usbhid
   [    3.241003] usbhid: USB HID core driver
   [    3.257353] raid6: neonx1   gen()  6031 MB/s
   [    3.262038] input: American Megatrends Inc. Virtual Keyboard and Mous=
e as /devices/pci0004:00/0004:00:03.0/0004:03:00.0/usb1/1-4/1-4.4/1-4.4.3/1=
-4.4.3:1.0/0003:046B:FF10.0001/input/input1
   [    3.322977] raid6: int64x8  gen()  3779 MB/s
   [    3.395504] raid6: int64x4  gen()  4196 MB/s
   [    3.473180] raid6: int64x2  gen()  3822 MB/s
   [    3.550667] raid6: int64x1  gen()  3010 MB/s
   [    3.550668] raid6: using algorithm neonx8 gen() 9280 MB/s
   [    3.625632] raid6: .... xor() 7035 MB/s, rmw enabled
   [    3.625634] raid6: using neon recovery algorithm
   [    3.673910] async_tx: api initialized (async)
   [    3.745617] xor: measuring software checksum speed
   [    3.745886]    8regs           : 12276 MB/sec
   [    3.746155]    32regs          : 12302 MB/sec
   [    3.746361]    arm64_neon      : 15998 MB/sec
   [    3.746362] xor: using function: arm64_neon (15998 MB/sec)
   [    4.430651] hid-generic 0003:046B:FF10.0001: input,hidraw0: USB HID v=
1.10 Keyboard [American Megatrends Inc. Virtual Keyboard and Mouse] on usb-=
0004:03:00.0-4.4.3/input0
   [    4.430822] input: American Megatrends Inc. Virtual Keyboard and Mous=
e as /devices/pci0004:00/0004:00:03.0/0004:03:00.0/usb1/1-4/1-4.4/1-4.4.3/1=
-4.4.3:1.1/0003:046B:FF10.0002/input/input2
   [    4.430956] hid-generic 0003:046B:FF10.0002: input,hidraw1: USB HID v=
1.10 Mouse [American Megatrends Inc. Virtual Keyboard and Mouse] on usb-000=
4:03:00.0-4.4.3/input1
   [    4.471961] PM: Image not found (code -22)
   [    4.703337] EXT4-fs (nvme1n1p2): mounted filesystem 06e49159-b374-445=
c-bf5f-2bf93e3f4d6b ro with ordered data mode. Quota mode: none.
   [    4.888790] Not activating Mandatory Access Control as /sbin/tomoyo-i=
nit does not exist.
   [    5.313477] systemd[1]: systemd 257.8-1~deb13u2 running in system mod=
e (+PAM +AUDIT +SELINUX +APPARMOR +IMA +IPE +SMACK +SECCOMP +GCRYPT -GNUTLS=
 +OPENSSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRY=
PTSETUP +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCOD=
E +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF -XKBCOMMON -UTMP +S=
YSVINIT +LIBARCHIVE)
   [    5.313492] systemd[1]: Detected architecture arm64.
   [    5.471703] systemd[1]: Hostname set to <gwenyn>.
   [    5.801354] systemd[1]: bpf-restrict-fs: Failed to load BPF object: N=
o such process
   [    6.061604] systemd[1]: Queued start job for default target graphical=
.target.
   [    6.417564] systemd[1]: Created slice machine.slice - Virtual Machine=
 and Container Slice.
   [    6.535937] systemd[1]: Created slice system-getty.slice - Slice /sys=
tem/getty.
   [    6.635414] systemd[1]: Created slice system-modprobe.slice - Slice /=
system/modprobe.
   [    6.735359] systemd[1]: Created slice system-serial\x2dgetty.slice - =
Slice /system/serial-getty.
   [    6.789428] systemd[1]: Created slice system-systemd\x2dfsck.slice - =
Slice /system/systemd-fsck.
   [    6.881742] systemd[1]: Created slice system-xfs_scrub.slice - xfs_sc=
rub background service slice.
   [    6.926993] systemd[1]: Created slice user.slice - User and Session S=
lice.
   [    6.990791] systemd[1]: Started systemd-ask-password-console.path - D=
ispatch Password Requests to Console Directory Watch.
   [    7.098608] systemd[1]: Started systemd-ask-password-wall.path - Forw=
ard Password Requests to Wall Directory Watch.
   [    7.202838] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.auto=
mount - Arbitrary Executable File Formats File System Automount Point.
   [    7.290697] systemd[1]: Expecting device dev-disk-by\x2duuid-F1B7\x2d=
8A61.device - /dev/disk/by-uuid/F1B7-8A61...
   [    7.331651] systemd[1]: Expecting device dev-disk-by\x2duuid-d49a53a7=
\x2df7ad\x2d4ff0\x2d9eb2\x2d47bafb5069f5.device - /dev/disk/by-uuid/d49a53a=
7-f7ad-4ff0-9eb2-47bafb5069f5...
   [    7.429222] systemd[1]: Expecting device dev-ttyAMA0.device - /dev/tt=
yAMA0...
   [    7.523673] systemd[1]: Reached target cryptsetup.target - Local Encr=
ypted Volumes.
   [    7.625015] systemd[1]: Reached target integritysetup.target - Local =
Integrity Protected Volumes.
   [    7.725555] systemd[1]: Reached target nss-user-lookup.target - User =
and Group Name Lookups.
   [    7.810667] systemd[1]: Reached target paths.target - Path Units.
   [    7.905056] systemd[1]: Reached target slices.target - Slice Units.
   [    7.979558] systemd[1]: Reached target veritysetup.target - Local Ver=
ity Protected Volumes.
   [    8.062865] systemd[1]: Reached target virt-guest-shutdown.target - l=
ibvirt guests shutdown target.
   [    8.168406] systemd[1]: Listening on dm-event.socket - Device-mapper =
event daemon FIFOs.
   [    8.267960] systemd[1]: Listening on lvm2-lvmpolld.socket - LVM2 poll=
 daemon socket.
   [    8.491363] systemd[1]: Listening on rpcbind.socket - RPCbind Server =
Activation Socket.
   [    8.580515] systemd[1]: Listening on systemd-creds.socket - Credentia=
l Encryption/Decryption.
   [    8.672101] systemd[1]: Listening on systemd-initctl.socket - initctl=
 Compatibility Named Pipe.
   [    8.782733] systemd[1]: Listening on systemd-journald-dev-log.socket =
- Journal Socket (/dev/log).
   [    8.852759] systemd[1]: Listening on systemd-journald.socket - Journa=
l Sockets.
   [    8.907973] systemd[1]: systemd-pcrextend.socket - TPM PCR Measuremen=
ts was skipped because of an unmet condition check (ConditionSecurity=3Dmea=
sured-uki).
   [    8.908023] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy =
was skipped because of an unmet condition check (ConditionSecurity=3Dmeasur=
ed-uki).
   [    8.908174] systemd[1]: Listening on systemd-udevd-control.socket - u=
dev Control Socket.
   [    8.985300] systemd[1]: Listening on systemd-udevd-kernel.socket - ud=
ev Kernel Socket.
   [    9.010761] systemd[1]: Mounting dev-hugepages.mount - Huge Pages Fil=
e System...
   [    9.019474] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Que=
ue File System...
   [    9.038870] systemd[1]: run-lock.mount: Directory /run/lock to mount =
over is not empty, mounting anyway.
   [    9.064391] systemd[1]: Mounting run-lock.mount - Legacy Locks Direct=
ory /run/lock...
   [    9.088238] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debu=
g File System...
   [    9.112077] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Tr=
ace File System...
   [    9.134838] systemd[1]: auth-rpcgss-module.service - Kernel Module su=
pporting RPCSEC_GSS was skipped because of an unmet condition check (Condit=
ionPathExists=3D/etc/krb5.keytab).
   [    9.136525] systemd[1]: Starting keyboard-setup.service - Set the con=
sole keyboard layout...
   [    9.160591] systemd[1]: Starting kmod-static-nodes.service - Create L=
ist of Static Device Nodes...
   [    9.203188] systemd[1]: Starting lvm2-monitor.service - Monitoring of=
 LVM2 mirrors, snapshots etc. using dmeventd or progress polling...
   [    9.216882] systemd[1]: Starting modprobe@configfs.service - Load Ker=
nel Module configfs...
   [    9.235960] systemd[1]: Starting modprobe@drm.service - Load Kernel M=
odule drm...
   [    9.255975] systemd[1]: Starting modprobe@efi_pstore.service - Load K=
ernel Module efi_pstore...
   [    9.281858] systemd[1]: Starting modprobe@fuse.service - Load Kernel =
Module fuse...
   [    9.296924] ACPI: bus type drm_connector registered
   [    9.310956] systemd[1]: systemd-fsck-root.service - File System Check=
 on Root Device was skipped because of an unmet condition check (ConditionP=
athExists=3D!/run/initramfs/fsck-root).
   [    9.311039] systemd[1]: systemd-hibernate-clear.service - Clear Stale=
 Hibernate Storage Info was skipped because of an unmet condition check (Co=
nditionPathExists=3D/sys/firmware/efi/efivars/HibernateLocation-8cf2644b-4b=
0b-428f-9387-6d876050dc67).
   [    9.354705] pstore: Using crash dump compression: deflate
   [    9.362154] systemd[1]: Starting systemd-journald.service - Journal S=
ervice...
   [    9.364031] pstore: Registered efi_pstore as persistent store backend
   [    9.384412] systemd[1]: Starting systemd-modules-load.service - Load =
Kernel Modules...
   [    9.406735] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine =
ID Measurement was skipped because of an unmet condition check (ConditionSe=
curity=3Dmeasured-uki).
   [    9.408509] systemd[1]: Starting systemd-remount-fs.service - Remount=
 Root and Kernel File Systems...
   [    9.459660] systemd[1]: systemd-tpm2-setup-early.service - Early TPM =
SRK Setup was skipped because of an unmet condition check (ConditionSecurit=
y=3Dmeasured-uki).
   [    9.460233] systemd-journald[656]: Collecting audit messages is disab=
led.
   [    9.461098] systemd[1]: Starting systemd-udev-load-credentials.servic=
e - Load udev Rules from Credentials...
   [    9.499312] EXT4-fs (nvme1n1p2): re-mounted 06e49159-b374-445c-bf5f-2=
bf93e3f4d6b r/w.
   [    9.516035] systemd[1]: Starting systemd-udev-trigger.service - Coldp=
lug All udev Devices...
   [    9.537948] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File=
 System.
   [    9.558771] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queu=
e File System.
   [    9.578738] systemd[1]: Mounted run-lock.mount - Legacy Locks Directo=
ry /run/lock.
   [    9.598745] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug=
 File System.
   [    9.618732] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Tra=
ce File System.
   [    9.638972] systemd[1]: Finished keyboard-setup.service - Set the con=
sole keyboard layout.
   [    9.659181] systemd[1]: Finished kmod-static-nodes.service - Create L=
ist of Static Device Nodes.
   [    9.682841] systemd[1]: Started systemd-journald.service - Journal Se=
rvice.
   [    9.962435] systemd-journald[656]: Received client request to flush r=
untime journal.
   [   10.990794] CPPC Cpufreq:FIE not enabled on systems with registers in=
 PCC
   [   11.111898] xgene-slimpro-hwmon APMC0D29:00: APM X-Gene SoC HW monito=
r driver registered
   [   11.129739] Adding 1000444k swap on /dev/nvme1n1p3.  Priority:-2 exte=
nts:1 across:1000444k SS
   [   11.309649] igb: Intel(R) Gigabit Ethernet Network Driver
   [   11.309658] igb: Copyright (c) 2007-2014 Intel Corporation.
   [   11.309702] igb 0004:04:00.0: vgaarb: pci_notify
   [   11.348033] IPMI message handler: version 39.2
   [   11.348047] arm_spe_pmu arm,spe-v1: profiling buffer inaccessible. Tr=
y passing "kpti=3Doff" on the kernel command line
   [   11.348053] arm_spe_pmu arm,spe-v1: probe with driver arm_spe_pmu fai=
led with error -1
   [   11.354907] igb 0004:04:00.0: runtime IRQ mapping not provided by arch
   [   11.355086] igb 0004:04:00.0: save config 0x00: 0x15338086
   [   11.355095] igb 0004:04:00.0: save config 0x04: 0x00100007
   [   11.355101] igb 0004:04:00.0: save config 0x08: 0x02000003
   [   11.355105] igb 0004:04:00.0: save config 0x0c: 0x00000020
   [   11.355110] igb 0004:04:00.0: save config 0x10: 0x21a00000
   [   11.355114] igb 0004:04:00.0: save config 0x14: 0x00000000
   [   11.355119] igb 0004:04:00.0: save config 0x18: 0x2fffe001
   [   11.355123] igb 0004:04:00.0: save config 0x1c: 0x21a80000
   [   11.355127] igb 0004:04:00.0: save config 0x20: 0x00000000
   [   11.355132] igb 0004:04:00.0: save config 0x24: 0x00000000
   [   11.355149] igb 0004:04:00.0: save config 0x28: 0x00000000
   [   11.355153] igb 0004:04:00.0: save config 0x2c: 0x0000ffff
   [   11.355157] igb 0004:04:00.0: save config 0x30: 0x00000000
   [   11.355161] igb 0004:04:00.0: save config 0x34: 0x00000040
   [   11.355166] igb 0004:04:00.0: save config 0x38: 0x00000000
   [   11.355170] igb 0004:04:00.0: save config 0x3c: 0x000001ff
   [   11.396499] ipmi device interface
   [   11.396513] sbsa-gwdt sbsa-gwdt.0: Initialized with 10s timeout @ 250=
00000 Hz, action=3D0.
   [   11.478960] ipmi_ssif: IPMI SSIF Interface driver
   [   11.640298] igb 0004:04:00.0: added PHC on eth0
   [   11.640331] igb 0004:04:00.0: Intel(R) Gigabit Ethernet Network Conne=
ction
   [   11.640334] igb 0004:04:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 00:30:64:=
3d:12:d2
   [   11.640396] igb 0004:04:00.0: eth0: PBA No: 000300-000
   [   11.640398] igb 0004:04:00.0: Using MSI-X interrupts. 4 rx queue(s), =
4 tx queue(s)
   [   11.640837] igb 0004:04:00.0: vgaarb: pci_notify
   [   11.666558] igb 0004:04:00.0 enP4p4s0: renamed from eth0
   [   11.753993] mc: Linux media interface: v0.10
   [   11.911743] snd_hda_intel 000d:03:00.1: vgaarb: pci_notify
   [   11.911757] snd_hda_intel 000d:03:00.1: runtime IRQ mapping not provi=
ded by arch
   [   11.911922] snd_hda_intel 000d:03:00.1: enabling device (0000 -> 0002)
   [   11.911939] snd_hda_intel 000d:03:00.1: Force to snoop mode by module=
 option
   [   11.911960] snd_hda_intel 000d:03:00.1: enabling bus mastering
   [   11.911965] snd_hda_intel 000d:03:00.1: vgaarb: pci_notify
   [   11.917137] audit: type=3D1400 audit(1763117393.708:2): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"busybox" p=
id=3D949 comm=3D"apparmor_parser"
   [   11.917194] audit: type=3D1400 audit(1763117393.708:3): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"ch-run" pi=
d=3D952 comm=3D"apparmor_parser"
   [   11.917286] audit: type=3D1400 audit(1763117393.708:4): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"crun" pid=
=3D956 comm=3D"apparmor_parser"
   [   11.917310] audit: type=3D1400 audit(1763117393.708:5): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"chromium" =
pid=3D954 comm=3D"apparmor_parser"
   [   11.917365] audit: type=3D1400 audit(1763117393.708:6): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"firefox" p=
id=3D962 comm=3D"apparmor_parser"
   [   11.917413] audit: type=3D1400 audit(1763117393.708:7): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"foliate" p=
id=3D964 comm=3D"apparmor_parser"
   [   11.917471] audit: type=3D1400 audit(1763117393.708:8): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D4D6F6E676F4=
44220436F6D70617373 pid=3D943 comm=3D"apparmor_parser"
   [   11.917541] audit: type=3D1400 audit(1763117393.708:9): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"balena-etc=
her" pid=3D946 comm=3D"apparmor_parser"
   [   11.917613] audit: type=3D1400 audit(1763117393.708:10): apparmor=3D"=
STATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"geary" pi=
d=3D965 comm=3D"apparmor_parser"
   [   11.917829] audit: type=3D1400 audit(1763117393.708:11): apparmor=3D"=
STATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"ipa_verif=
y" pid=3D969 comm=3D"apparmor_parser"
   [   12.008554] usbcore: registered new interface driver snd-usb-audio
   [   12.112835] input: HDA ATI HDMI HDMI/DP,pcm=3D3 as /devices/pci000d:0=
0/000d:00:01.0/000d:01:00.0/000d:02:00.0/000d:03:00.1/sound/card0/input3
   [   12.112966] input: HDA ATI HDMI HDMI/DP,pcm=3D7 as /devices/pci000d:0=
0/000d:00:01.0/000d:01:00.0/000d:02:00.0/000d:03:00.1/sound/card0/input4
   [   12.113057] input: HDA ATI HDMI HDMI/DP,pcm=3D8 as /devices/pci000d:0=
0/000d:00:01.0/000d:01:00.0/000d:02:00.0/000d:03:00.1/sound/card0/input5
   [   12.113119] input: HDA ATI HDMI HDMI/DP,pcm=3D9 as /devices/pci000d:0=
0/000d:00:01.0/000d:01:00.0/000d:02:00.0/000d:03:00.1/sound/card0/input6
   [   12.325407] RPC: Registered named UNIX socket transport module.
   [   12.325418] RPC: Registered udp transport module.
   [   12.325419] RPC: Registered tcp transport module.
   [   12.325421] RPC: Registered tcp-with-tls transport module.
   [   12.325422] RPC: Registered tcp NFSv4.1 backchannel transport module.
   [   12.601396] Setting dangerous option gpu_recovery - tainting kernel
   [   12.602093] [drm] amdgpu kernel modesetting enabled.
   [   12.602325] amdgpu 000d:03:00.0: vgaarb: pci_notify
   [   12.602332] amdgpu 000d:03:00.0: runtime IRQ mapping not provided by =
arch
   [   12.602532] amdgpu 000d:03:00.0: enabling device (0000 -> 0002)
   [   12.602546] amdgpu 000d:03:00.0: amdgpu: initializing kernel modesett=
ing (IP DISCOVERY 0x1002:0x7480 0x1DA2:0xE448 0xCF).
   [   12.602573] amdgpu 000d:03:00.0: amdgpu: register mmio base: 0x500000=
00
   [   12.602577] amdgpu 000d:03:00.0: amdgpu: register mmio size: 1048576
   [   12.607117] amdgpu 000d:03:00.0: amdgpu: detected ip block number 0 <=
common_v1_0_0> (soc21_common)
   [   12.607121] amdgpu 000d:03:00.0: amdgpu: detected ip block number 1 <=
gmc_v11_0_0> (gmc_v11_0)
   [   12.607124] amdgpu 000d:03:00.0: amdgpu: detected ip block number 2 <=
ih_v6_0_0> (ih_v6_0)
   [   12.607127] amdgpu 000d:03:00.0: amdgpu: detected ip block number 3 <=
psp_v13_0_0> (psp)
   [   12.607130] amdgpu 000d:03:00.0: amdgpu: detected ip block number 4 <=
smu_v13_0_0> (smu)
   [   12.607132] amdgpu 000d:03:00.0: amdgpu: detected ip block number 5 <=
dce_v1_0_0> (dm)
   [   12.607134] amdgpu 000d:03:00.0: amdgpu: detected ip block number 6 <=
gfx_v11_0_0> (gfx_v11_0)
   [   12.607137] amdgpu 000d:03:00.0: amdgpu: detected ip block number 7 <=
sdma_v6_0_0> (sdma_v6_0)
   [   12.607139] amdgpu 000d:03:00.0: amdgpu: detected ip block number 8 <=
vcn_v4_0_0> (vcn_v4_0)
   [   12.607141] amdgpu 000d:03:00.0: amdgpu: detected ip block number 9 <=
jpeg_v4_0_0> (jpeg_v4_0)
   [   12.607144] amdgpu 000d:03:00.0: amdgpu: detected ip block number 10 =
<mes_v11_0_0> (mes_v11_0)
   [   12.620393] amdgpu 000d:03:00.0: amdgpu: Fetched VBIOS from ROM BAR
   [   12.620397] amdgpu: ATOM BIOS: 113-4481LHS-UC1
   [   12.625123] amdgpu 000d:03:00.0: amdgpu: CP RS64 enable
   [   12.631410] amdgpu 000d:03:00.0: amdgpu: Trusted Memory Zone (TMZ) fe=
ature not supported
   [   12.631423] amdgpu 000d:03:00.0: amdgpu: PCIE atomic ops is not suppo=
rted
   [   12.631428] amdgpu 000d:03:00.0: amdgpu: GPU posting now...
   [   12.631472] amdgpu 000d:03:00.0: amdgpu: vm size is 262144 GB, 4 leve=
ls, block size is 9-bit, fragment size is 9-bit
   [   12.631504] amdgpu 000d:03:00.0: BAR 0 [mem 0x340000000000-0x34000fff=
ffff 64bit pref]: releasing
   [   12.631508] amdgpu 000d:03:00.0: BAR 2 [mem 0x340010000000-0x3400101f=
ffff 64bit pref]: releasing
   [   12.631511] pcieport 000d:02:00.0: bridge window [mem 0x340000000000-=
0x3400101fffff 64bit pref]: releasing
   [   12.631515] pcieport 000d:01:00.0: bridge window [mem 0x340000000000-=
0x340017ffffff 64bit pref]: releasing
   [   12.631517] pcieport 000d:00:01.0: bridge window [mem 0x340000000000-=
0x340017ffffff 64bit pref]: releasing
   [   12.631527] pcieport 000d:00:01.0: bridge window [mem 0x340000000000-=
0x3402ffffffff 64bit pref]: assigned
   [   12.631530] pcieport 000d:00:01.0: bridge window [io  size 0x1000]: c=
an't assign; no space
   [   12.631532] pcieport 000d:00:01.0: bridge window [io  size 0x1000]: f=
ailed to assign
   [   12.631534] pcieport 000d:00:01.0: bridge window [io  size 0x1000]: c=
an't assign; no space
   [   12.631536] pcieport 000d:00:01.0: bridge window [io  size 0x1000]: f=
ailed to assign
   [   12.631538] pcieport 000d:01:00.0: bridge window [mem 0x340000000000-=
0x3402ffffffff 64bit pref]: assigned
   [   12.631541] pcieport 000d:01:00.0: bridge window [io  size 0x1000]: c=
an't assign; no space
   [   12.631542] pcieport 000d:01:00.0: bridge window [io  size 0x1000]: f=
ailed to assign
   [   12.631545] pcieport 000d:01:00.0: bridge window [io  size 0x1000]: c=
an't assign; no space
   [   12.631546] pcieport 000d:01:00.0: bridge window [io  size 0x1000]: f=
ailed to assign
   [   12.631549] pcieport 000d:02:00.0: bridge window [mem 0x340000000000-=
0x3402ffffffff 64bit pref]: assigned
   [   12.631551] pcieport 000d:02:00.0: bridge window [io  size 0x1000]: c=
an't assign; no space
   [   12.631552] pcieport 000d:02:00.0: bridge window [io  size 0x1000]: f=
ailed to assign
   [   12.631554] pcieport 000d:02:00.0: bridge window [io  size 0x1000]: c=
an't assign; no space
   [   12.631556] pcieport 000d:02:00.0: bridge window [io  size 0x1000]: f=
ailed to assign
   [   12.631558] amdgpu 000d:03:00.0: BAR 0 [mem 0x340000000000-0x3401ffff=
ffff 64bit pref]: assigned
   [   12.631567] amdgpu 000d:03:00.0: BAR 2 [mem 0x340200000000-0x3402001f=
ffff 64bit pref]: assigned
   [   12.631576] pcieport 000d:00:01.0: PCI bridge to [bus 01-03]
   [   12.631578] pcieport 000d:00:01.0:   bridge window [mem 0x50000000-0x=
502fffff]
   [   12.631581] pcieport 000d:00:01.0:   bridge window [mem 0x34000000000=
0-0x3402ffffffff 64bit pref]
   [   12.631584] pcieport 000d:01:00.0: PCI bridge to [bus 02-03]
   [   12.631588] pcieport 000d:01:00.0:   bridge window [mem 0x50000000-0x=
501fffff]
   [   12.631591] pcieport 000d:01:00.0:   bridge window [mem 0x34000000000=
0-0x3402ffffffff 64bit pref]
   [   12.631595] pcieport 000d:02:00.0: PCI bridge to [bus 03]
   [   12.631599] pcieport 000d:02:00.0:   bridge window [mem 0x50000000-0x=
501fffff]
   [   12.631602] pcieport 000d:02:00.0:   bridge window [mem 0x34000000000=
0-0x3402ffffffff 64bit pref]
   [   12.631610] amdgpu 000d:03:00.0: amdgpu: VRAM: 8176M 0x00000080000000=
00 - 0x00000081FEFFFFFF (8176M used)
   [   12.631613] amdgpu 000d:03:00.0: amdgpu: GART: 512M 0x00007FFF0000000=
0 - 0x00007FFF1FFFFFFF
   [   12.631620] [drm] Detected VRAM RAM=3D8176M, BAR=3D8192M
   [   12.631621] [drm] RAM width 128bits GDDR6
   [   12.631809] amdgpu 000d:03:00.0: amdgpu: amdgpu: 8176M of VRAM memory=
 ready
   [   12.631812] amdgpu 000d:03:00.0: amdgpu: amdgpu: 15888M of GTT memory=
 ready.
   [   12.631845] [drm] GART: num cpu pages 131072, num gpu pages 131072
   [   12.631937] [drm] PCIE GART of 512M enabled (table at 0x00000081FEB00=
000).
   [   12.787500] amdgpu 000d:03:00.0: amdgpu: [drm] Loading DMUB firmware =
via PSP: version=3D0x07002D00
   [   13.029667] amdgpu 000d:03:00.0: amdgpu: [VCN instance 0] Found VCN f=
irmware Version ENC: 1.23 DEC: 9 VEP: 0 Revision: 16
   [   13.223188] amdgpu 000d:03:00.0: enabling bus mastering
   [   13.280160] amdgpu 000d:03:00.0: amdgpu: reserve 0x1300000 from 0x81f=
c000000 for PSP TMR
   [   13.374163] amdgpu 000d:03:00.0: amdgpu: RAS: optional ras ta ucode i=
s not available
   [   13.381741] amdgpu 000d:03:00.0: amdgpu: RAP: optional rap ta ucode i=
s not available
   [   13.381744] amdgpu 000d:03:00.0: amdgpu: SECUREDISPLAY: optional secu=
redisplay ta ucode is not available
   [   13.381807] amdgpu 000d:03:00.0: amdgpu: smu driver if version =3D 0x=
00000035, smu fw if version =3D 0x00000040, smu fw program =3D 0, smu fw ve=
rsion =3D 0x00525c00 (82.92.0)
   [   13.381813] amdgpu 000d:03:00.0: amdgpu: SMU driver if version not ma=
tched
   [   13.425788] amdgpu 000d:03:00.0: amdgpu: SMU is initialized successfu=
lly!
   [   13.426274] amdgpu 000d:03:00.0: amdgpu: [drm] Display Core v3.2.351 =
initialized on DCN 3.2.1
   [   13.426279] amdgpu 000d:03:00.0: amdgpu: [drm] DP-HDMI FRL PCON suppo=
rted
   [   13.428286] amdgpu 000d:03:00.0: amdgpu: [drm] DMUB hardware initiali=
zed: version=3D0x07002D00
   [   13.433518] snd_hda_intel 000d:03:00.1: save config 0x00: 0xab301002
   [   13.433522] snd_hda_intel 000d:03:00.1: save config 0x04: 0x00100406
   [   13.433525] snd_hda_intel 000d:03:00.1: save config 0x08: 0x04030000
   [   13.433528] snd_hda_intel 000d:03:00.1: save config 0x0c: 0x00800000
   [   13.433530] snd_hda_intel 000d:03:00.1: save config 0x10: 0x50120000
   [   13.433532] snd_hda_intel 000d:03:00.1: save config 0x14: 0x00000000
   [   13.433535] snd_hda_intel 000d:03:00.1: save config 0x18: 0x00000000
   [   13.433538] snd_hda_intel 000d:03:00.1: save config 0x1c: 0x00000000
   [   13.433540] snd_hda_intel 000d:03:00.1: save config 0x20: 0x00000000
   [   13.433543] snd_hda_intel 000d:03:00.1: save config 0x24: 0x00000000
   [   13.433545] snd_hda_intel 000d:03:00.1: save config 0x28: 0x00000000
   [   13.433547] snd_hda_intel 000d:03:00.1: save config 0x2c: 0xab301002
   [   13.433550] snd_hda_intel 000d:03:00.1: save config 0x30: 0x00000000
   [   13.433552] snd_hda_intel 000d:03:00.1: save config 0x34: 0x00000048
   [   13.433555] snd_hda_intel 000d:03:00.1: save config 0x38: 0x00000000
   [   13.433557] snd_hda_intel 000d:03:00.1: save config 0x3c: 0x000002ff
   [   13.433588] snd_hda_intel 000d:03:00.1: PME# enabled
   [   13.434074] snd_hda_intel 000d:03:00.1: bound 000d:03:00.0 (ops amdgp=
u_dm_audio_component_bind_ops [amdgpu])
   [   13.435076] amdgpu 000d:03:00.0: amdgpu: [drm] PSR support 0, DC PSR =
ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
   [   13.435134] amdgpu 000d:03:00.0: amdgpu: [drm] PSR support 0, DC PSR =
ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
   [   13.435188] amdgpu 000d:03:00.0: amdgpu: [drm] PSR support 0, DC PSR =
ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
   [   13.435247] amdgpu 000d:03:00.0: amdgpu: [drm] PSR support 0, DC PSR =
ver -1, sink PSR ver 0 DPCD caps 0x0 su_y_granularity 0
   [   13.436407] amdgpu 000d:03:00.0: amdgpu: MES FW version must be >=3D =
0x7f to enable LR compute workaround.
   [   13.441607] amdgpu 000d:03:00.0: amdgpu: SE 2, SH per SE 2, CU per SH=
 8, active_cu_number 32
   [   13.441612] amdgpu 000d:03:00.0: amdgpu: ring gfx_0.0.0 uses VM inv e=
ng 0 on hub 0
   [   13.441615] amdgpu 000d:03:00.0: amdgpu: ring comp_1.0.0 uses VM inv =
eng 1 on hub 0
   [   13.441617] amdgpu 000d:03:00.0: amdgpu: ring comp_1.1.0 uses VM inv =
eng 4 on hub 0
   [   13.441618] amdgpu 000d:03:00.0: amdgpu: ring comp_1.2.0 uses VM inv =
eng 6 on hub 0
   [   13.441620] amdgpu 000d:03:00.0: amdgpu: ring comp_1.3.0 uses VM inv =
eng 7 on hub 0
   [   13.441621] amdgpu 000d:03:00.0: amdgpu: ring comp_1.0.1 uses VM inv =
eng 8 on hub 0
   [   13.441623] amdgpu 000d:03:00.0: amdgpu: ring comp_1.1.1 uses VM inv =
eng 9 on hub 0
   [   13.441624] amdgpu 000d:03:00.0: amdgpu: ring comp_1.2.1 uses VM inv =
eng 10 on hub 0
   [   13.441626] amdgpu 000d:03:00.0: amdgpu: ring comp_1.3.1 uses VM inv =
eng 11 on hub 0
   [   13.441627] amdgpu 000d:03:00.0: amdgpu: ring sdma0 uses VM inv eng 1=
2 on hub 0
   [   13.441629] amdgpu 000d:03:00.0: amdgpu: ring sdma1 uses VM inv eng 1=
3 on hub 0
   [   13.441630] amdgpu 000d:03:00.0: amdgpu: ring vcn_unified_0 uses VM i=
nv eng 0 on hub 8
   [   13.441632] amdgpu 000d:03:00.0: amdgpu: ring jpeg_dec uses VM inv en=
g 1 on hub 8
   [   13.441633] amdgpu 000d:03:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM i=
nv eng 14 on hub 0
   [   13.442391] amdgpu 000d:03:00.0: save config 0x00: 0x74801002
   [   13.442395] amdgpu 000d:03:00.0: save config 0x04: 0x00100406
   [   13.442397] amdgpu 000d:03:00.0: save config 0x08: 0x030000cf
   [   13.442400] amdgpu 000d:03:00.0: save config 0x0c: 0x00800000
   [   13.442403] amdgpu 000d:03:00.0: save config 0x10: 0x0000000c
   [   13.442406] amdgpu 000d:03:00.0: save config 0x14: 0x00003400
   [   13.442408] amdgpu 000d:03:00.0: save config 0x18: 0x0000000c
   [   13.442411] amdgpu 000d:03:00.0: save config 0x1c: 0x00003402
   [   13.442413] amdgpu 000d:03:00.0: save config 0x20: 0x5fffe001
   [   13.442415] amdgpu 000d:03:00.0: save config 0x24: 0x50000000
   [   13.442418] amdgpu 000d:03:00.0: save config 0x28: 0x00000000
   [   13.442420] amdgpu 000d:03:00.0: save config 0x2c: 0xe4481da2
   [   13.442423] amdgpu 000d:03:00.0: save config 0x30: 0x50100000
   [   13.442425] amdgpu 000d:03:00.0: save config 0x34: 0x00000048
   [   13.442428] amdgpu 000d:03:00.0: save config 0x38: 0x00000000
   [   13.442430] amdgpu 000d:03:00.0: save config 0x3c: 0x000001ff
   [   13.442488] pcieport 000d:02:00.0: save config 0x00: 0x14791002
   [   13.442490] pcieport 000d:02:00.0: save config 0x04: 0x00100407
   [   13.442493] pcieport 000d:02:00.0: save config 0x08: 0x06040012
   [   13.442495] pcieport 000d:02:00.0: save config 0x0c: 0x00010000
   [   13.442498] pcieport 000d:02:00.0: save config 0x10: 0x00000000
   [   13.442500] pcieport 000d:02:00.0: save config 0x14: 0x00000000
   [   13.442503] pcieport 000d:02:00.0: save config 0x18: 0x00030302
   [   13.442506] pcieport 000d:02:00.0: save config 0x1c: 0x000001f1
   [   13.442508] pcieport 000d:02:00.0: save config 0x20: 0x50105000
   [   13.442510] pcieport 000d:02:00.0: save config 0x24: 0xfff10001
   [   13.442513] pcieport 000d:02:00.0: save config 0x28: 0x00003400
   [   13.442515] pcieport 000d:02:00.0: save config 0x2c: 0x00003402
   [   13.442518] pcieport 000d:02:00.0: save config 0x30: 0x00000000
   [   13.442520] pcieport 000d:02:00.0: save config 0x34: 0x00000050
   [   13.442522] pcieport 000d:02:00.0: save config 0x38: 0x00000000
   [   13.442525] pcieport 000d:02:00.0: save config 0x3c: 0x000201ff
   [   13.442567] pcieport 000d:01:00.0: save config 0x00: 0x14781002
   [   13.442569] pcieport 000d:01:00.0: save config 0x04: 0x00100007
   [   13.442571] pcieport 000d:01:00.0: save config 0x08: 0x06040012
   [   13.442574] pcieport 000d:01:00.0: save config 0x0c: 0x00010000
   [   13.442576] pcieport 000d:01:00.0: save config 0x10: 0x50200000
   [   13.442578] pcieport 000d:01:00.0: save config 0x14: 0x00000000
   [   13.442581] pcieport 000d:01:00.0: save config 0x18: 0x00030201
   [   13.442583] pcieport 000d:01:00.0: save config 0x1c: 0x000001f1
   [   13.442586] pcieport 000d:01:00.0: save config 0x20: 0x50105000
   [   13.442588] pcieport 000d:01:00.0: save config 0x24: 0xfff10001
   [   13.442590] pcieport 000d:01:00.0: save config 0x28: 0x00003400
   [   13.442593] pcieport 000d:01:00.0: save config 0x2c: 0x00003402
   [   13.442595] pcieport 000d:01:00.0: save config 0x30: 0x00000000
   [   13.442597] pcieport 000d:01:00.0: save config 0x34: 0x00000048
   [   13.442600] pcieport 000d:01:00.0: save config 0x38: 0x00000000
   [   13.442602] pcieport 000d:01:00.0: save config 0x3c: 0x000201ff
   [   13.442700] amdgpu 000d:03:00.0: restore config 0x1c: 0x00000000 -> 0=
x00003402
   [   13.442706] amdgpu 000d:03:00.0: restore config 0x14: 0x00000000 -> 0=
x00003400
   [   13.442901] amdgpu 000d:03:00.0: amdgpu: runtime pm is manually disab=
led
   [   13.442902] amdgpu 000d:03:00.0: amdgpu: Runtime PM not available
   [   13.443518] [drm] Initialized amdgpu 3.64.0 for 000d:03:00.0 on minor=
 0
   [   13.501418] amdgpu 000d:03:00.0: [drm] Cannot find any crtc or sizes
   [   13.501452] [drm] pre_validate_dsc:1667 MST_DSC dsc precompute is not=
 needed
   [   13.501744] amdgpu 000d:03:00.0: vgaarb: pci_notify
   [   14.994008] nvme nvme0: using unchecked data buffer
   [   15.001506] block nvme1n1: No UUID available providing old NGUID
   [   15.235662] NET: Registered PF_QIPCRTR protocol family
   [   18.071051] igb 0004:04:00.0 enP4p4s0: igb: enP4p4s0 NIC Link is Up 1=
000 Mbps Full Duplex, Flow Control: RX/TX
   [   23.180238] bridge: filtering via arp/ip/ip6tables is no longer avail=
able by default. Update your scripts to load br_netfilter if you need this.
   [   34.781829] snd_hda_intel 000d:03:00.1: PME# disabled
   [   36.022626] snd_hda_intel 000d:03:00.1: save config 0x00: 0xab301002
   [   36.022643] snd_hda_intel 000d:03:00.1: save config 0x04: 0x00100406
   [   36.022649] snd_hda_intel 000d:03:00.1: save config 0x08: 0x04030000
   [   36.022654] snd_hda_intel 000d:03:00.1: save config 0x0c: 0x00800000
   [   36.022658] snd_hda_intel 000d:03:00.1: save config 0x10: 0x50120000
   [   36.022665] snd_hda_intel 000d:03:00.1: save config 0x14: 0x00000000
   [   36.022670] snd_hda_intel 000d:03:00.1: save config 0x18: 0x00000000
   [   36.022674] snd_hda_intel 000d:03:00.1: save config 0x1c: 0x00000000
   [   36.022678] snd_hda_intel 000d:03:00.1: save config 0x20: 0x00000000
   [   36.022684] snd_hda_intel 000d:03:00.1: save config 0x24: 0x00000000
   [   36.022689] snd_hda_intel 000d:03:00.1: save config 0x28: 0x00000000
   [   36.022692] snd_hda_intel 000d:03:00.1: save config 0x2c: 0xab301002
   [   36.022698] snd_hda_intel 000d:03:00.1: save config 0x30: 0x00000000
   [   36.022703] snd_hda_intel 000d:03:00.1: save config 0x34: 0x00000048
   [   36.022708] snd_hda_intel 000d:03:00.1: save config 0x38: 0x00000000
   [   36.022714] snd_hda_intel 000d:03:00.1: save config 0x3c: 0x000002ff
   [   36.022748] snd_hda_intel 000d:03:00.1: PME# enabled
   [   36.676092] rfkill: input handler disabled
   [   82.640464] snd_hda_intel 000d:03:00.1: PME# disabled
   [   83.920738] snd_hda_intel 000d:03:00.1: save config 0x00: 0xab301002
   [   83.920759] snd_hda_intel 000d:03:00.1: save config 0x04: 0x00100406
   [   83.920769] snd_hda_intel 000d:03:00.1: save config 0x08: 0x04030000
   [   83.920774] snd_hda_intel 000d:03:00.1: save config 0x0c: 0x00800000
   [   83.920780] snd_hda_intel 000d:03:00.1: save config 0x10: 0x50120000
   [   83.920785] snd_hda_intel 000d:03:00.1: save config 0x14: 0x00000000
   [   83.920790] snd_hda_intel 000d:03:00.1: save config 0x18: 0x00000000
   [   83.920794] snd_hda_intel 000d:03:00.1: save config 0x1c: 0x00000000
   [   83.920800] snd_hda_intel 000d:03:00.1: save config 0x20: 0x00000000
   [   83.920806] snd_hda_intel 000d:03:00.1: save config 0x24: 0x00000000
   [   83.920810] snd_hda_intel 000d:03:00.1: save config 0x28: 0x00000000
   [   83.920815] snd_hda_intel 000d:03:00.1: save config 0x2c: 0xab301002
   [   83.920820] snd_hda_intel 000d:03:00.1: save config 0x30: 0x00000000
   [   83.920824] snd_hda_intel 000d:03:00.1: save config 0x34: 0x00000048
   [   83.920828] snd_hda_intel 000d:03:00.1: save config 0x38: 0x00000000
   [   83.920832] snd_hda_intel 000d:03:00.1: save config 0x3c: 0x000002ff
   [   83.920868] snd_hda_intel 000d:03:00.1: PME# enabled
   [   96.778026] evm: overlay not supported
   [   98.707448] tun: Universal TUN/TAP device driver, 1.6
   [  897.673379] SCSI subsystem initialized

>
> You seemed to have only a few io resource assignment failures to occur=20
> during BAR resize which might be the reason the kernel thought rollback=20
> is necessary (so AFAICT, the rollback likely was entirely unnecessary as=
=20
> the mem resources did assign successfully).
>
> I made the resize to ignore unrelated (reoccuring) io resource failures i=
n=20
> the commit 31af09b3eaf3 ("PCI: Fix failure detection during resource=20
> resize"), but that might not have been backported to 6.15 you took the lo=
g=20
> from (in the initial report). So kernel might not even do rollback at all=
=20
> with 6.18-rc5.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
