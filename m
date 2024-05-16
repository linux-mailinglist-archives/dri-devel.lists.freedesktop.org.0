Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE58C74AF
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 12:36:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F64210E07D;
	Thu, 16 May 2024 10:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="HvU2jS/S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A61310E07D
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:36:17 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4200eae18e0so5910615e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 03:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715855776; x=1716460576; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNW+wKHpgMV8X/ihmcuZ5qT/jaHfEOeaFEUa1oelsvk=;
 b=HvU2jS/S/O43aAPHW8OlSq9oVs1UeXdgn+czuOXwx7yNzejikuwrh8kr4Oo+kAK7XF
 Lx4bkz2FhlEBj/DTs0tZ5zmuZc2P959PuwBikvKO7dQoojWtGA7alxHxyIogzz1/PjBs
 QJaqgMMq0jgt9DzM1p7UxRE1TL2WF//Hx4VmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715855776; x=1716460576;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KNW+wKHpgMV8X/ihmcuZ5qT/jaHfEOeaFEUa1oelsvk=;
 b=cb8Z56SZ5lPfP8QbZJp6BIkWCOLNgBvoVZDbDEkPsPBerdJIFusx0WOwnkG89FIsPd
 W3K0EcZ/V71wy6n9OAmmZ5b4hMMhowbWV9pQpARthh33yxMiWaPsnUaMfWos9yaE4ARN
 uM+cSUcZJ9Xt0O3vK5pDPkYKAhDy9tC5rBkq2X5lecSZJeApgo/9KcQo3O+m2P0jzuoM
 KCH1MlfRE+5imV63q1766+LSX4CgrXNsjbdJyvvZFQ5RRbkw3lIcw8V+dDCHxjfnIpWv
 2w35biDEFQIILC6Pgx1tIyfmjKWKSnte839da79rdlmdAn3IV1hQg8jzmyvPa4vCtzcK
 /4UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYs5SwddBCWb64C1BqmTGZrSgGApT4pwWNQOLn/7qd0rIL+Np1QI6qH2AqbfsHjSs8dM+Ol6e07ehbiCSF2fdofz+cUgSn4Vp1mXtsak1F
X-Gm-Message-State: AOJu0YzUE79ymIkQbEYG8EOkDSCE6yOyLlNnToD/WcgZvI4cSYEHqknk
 zHNrSfR/prIbsvH5f7iLt/ekoIFKqcJXxpLvV3gAZGCb5PC85R0uxCQ+IGavrcs=
X-Google-Smtp-Source: AGHT+IGw07OQUKudQNHAhX29hyqLwpzmdun+pk89MoM7l66+706OsCg0tsc5/exN3IgGM7lhlh7DEA==
X-Received: by 2002:a05:600c:1d0a:b0:41b:e58c:e007 with SMTP id
 5b1f17b1804b1-41fead7a643mr134391455e9.4.1715855774892; 
 Thu, 16 May 2024 03:36:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42011d91edfsm173041935e9.44.2024.05.16.03.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 03:36:14 -0700 (PDT)
Date: Thu, 16 May 2024 12:36:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Chris Clayton <chris2553@googlemail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: /sys/kernel/debug/vgaswitcheroo directory missing
Message-ID: <ZkXhnLbfS56Ucz2_@phenom.ffwll.local>
Mail-Followup-To: Chris Clayton <chris2553@googlemail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
References: <199a1636-2cd1-4d66-b2b2-1b64c5af4f2d@googlemail.com>
 <ZjugHVX1WIgjbAH1@phenom.ffwll.local>
 <b77cb343-1ea8-4cfd-ac77-b7e8d1c5e078@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b77cb343-1ea8-4cfd-ac77-b7e8d1c5e078@googlemail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Wed, May 08, 2024 at 08:38:00PM +0100, Chris Clayton wrote:
> 
> 
> On 08/05/2024 16:54, Daniel Vetter wrote:
> > On Wed, May 08, 2024 at 09:02:02AM +0100, Chris Clayton wrote:
> >> Hi,
> >>
> >> I'm running the latest development kernel - 6.9.0-rc7+ (HEAD is dccb07f2914cdab2ac3a5b6c98406f765acab803.)
> >>
> >> As I say in $SUBJECT, the directory /sys/kernel/debug/vgaswitcheroo is missing in this release. Perhaps more importantly
> >> unless it is configured to simply blank the screen, when xscreensaver kicks in an error message flashes rapidly on and
> >> off complaining that no GL graphics are available. Moreover, if I start scribus from qterminal, I see the message
> >> "Inconsistent value (1) for DRI_PRIME. Should be < 1 (GPU devices count). Using: 0".
> >>
> >> This same userspace works fine with kernels 6.6.30 and 6.8.9
> >>
> >> lsmod shows that the nouveau module is loaded and lsof shows that libdrm_nouveau is loaded for Xorg and a few desktop
> >> applications. However, inspecting the nouveau-related output from dmesg reveals:
> >>
> >> [Wed May  8 08:20:07 2024] nouveau: detected PR support, will not use DSM
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: NVIDIA TU117 (167000a1)
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: bios: version 90.17.42.00.36
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: pmu: firmware unavailable
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: fb: 4096 MiB GDDR6
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: sec2(acr): mbox 00000007 00000000
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: sec2(acr):AHESASC: boot failed: -5
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: acr: init failed, -5
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: init failed with -5
> >> [Wed May  8 08:20:07 2024] nouveau: DRM-master:00000000:00000080: init failed with -5
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: DRM-master: Device allocation failed: -5
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: probe with driver nouveau failed with error -5
> >>
> >> With kernel 6.8.9 the equivalent output is :
> >>
> >> Wed May  8 08:51:07 2024] nouveau: detected PR support, will not use DSM
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: NVIDIA TU117 (167000a1)
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: bios: version 90.17.42.00.36
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: pmu: firmware unavailable
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: fb: 4096 MiB GDDR6
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
> >> [Wed May  8 08:51:07 2024] [drm] Initialized nouveau 1.4.0 20120801 for 0000:01:00.0 on minor 1
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: [drm] No compatible format found
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
> >> [Wed May  8 08:51:07 2024] nouveau 0000:01:00.0: DRM: Disabling PCI power management to avoid bug
> >>
> >> I've attached the complete dmesg output from 6.9.8-rc7+.
> > 
> > I'm assuming that the working kernel's dmesg shows that the proprietary
> > nvidia driver is loaded, which provides all the services and gl. And now
> > that somehow the nouveau driver loads (but doesn't work correctly for some
> > reason, maybe because the userspace is missing) stuff is on fire.
> > 
> > If this assumption is correct you need to reinstall your nvidia driver
> > stack and bother nvidia with any issues, not upstream.
> > -Sima
> > 
> 
> Oh, I'm terribly sorry to have bothered you! What and attitude to take to someone who is reporting  a problem in an
> effort to help.
> 
> Your assumption is wrong. I've been using linux long enough to know not to report a problem if you've got a proprietary
> driver installed. But never mind, I've blacklisted the nouveau driver. I'll try it again somwetime when I can be
> bothered because clearly I'm just a nuisance to you.

Eh not a nuisance, I just somehow rather completely misread which way
round the regression goes.

Plus a long w/e and having caught a cold means I didn't get around to
reading this thread again, but looks like it's all resolved already.
-Sima

> 
> 
> >>
> >> Please cc me on any reply as I'm not subscribed.
> >>
> >> Chris
> >>
> > 
> >> [Wed May  8 08:20:04 2024] Linux version 6.9.0-rc7+ (chris@laptop) (gcc14 (GCC) 14.0.1 20240503 (prerelease), GNU ld (GNU Binutils) 2.42) #283 SMP PREEMPT_DYNAMIC Tue May  7 06:58:55 BST 2024
> >> [Wed May  8 08:20:04 2024] Command line: BOOT_IMAGE=/boot/vmlinuz-6.9.0-rc7+ ro root=PARTUUID=f927883a-e95c-4cdd-b64e-a0a778216b9f resume=PARTUUID=70ccedc5-d788-42bc-9f13-81e2beb61338 rootfstype=ext4 net.ifnames=0 video=1920x1080@60
> >> [Wed May  8 08:20:04 2024] BIOS-provided physical RAM map:
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x000000000009f000-0x00000000000fffff] reserved
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x0000000000100000-0x000000007e1d8fff] usable
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x000000007e1d9000-0x000000007ead8fff] reserved
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x000000007ead9000-0x000000008cceefff] usable
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x000000008ccef000-0x000000008eedefff] reserved
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x000000008eedf000-0x000000008fbcefff] ACPI NVS
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x000000008fbcf000-0x000000008fc4efff] ACPI data
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x000000008fc4f000-0x000000008fc4ffff] usable
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x000000008fc50000-0x000000009d7fffff] reserved
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] reserved
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x00000000fed84000-0x00000000fed84fff] reserved
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x00000000ff400000-0x00000000ffffffff] reserved
> >> [Wed May  8 08:20:04 2024] BIOS-e820: [mem 0x0000000100000000-0x00000008607fffff] usable
> >> [Wed May  8 08:20:04 2024] NX (Execute Disable) protection: active
> >> [Wed May  8 08:20:04 2024] APIC: Static calls initialized
> >> [Wed May  8 08:20:04 2024] e820: update [mem 0x79527018-0x79536057] usable ==> usable
> >> [Wed May  8 08:20:04 2024] extended physical RAM map:
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x0000000000000000-0x000000000009efff] usable
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x000000000009f000-0x00000000000fffff] reserved
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x0000000000100000-0x0000000079527017] usable
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x0000000079527018-0x0000000079536057] usable
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x0000000079536058-0x000000007e1d8fff] usable
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x000000007e1d9000-0x000000007ead8fff] reserved
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x000000007ead9000-0x000000008cceefff] usable
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x000000008ccef000-0x000000008eedefff] reserved
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x000000008eedf000-0x000000008fbcefff] ACPI NVS
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x000000008fbcf000-0x000000008fc4efff] ACPI data
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x000000008fc4f000-0x000000008fc4ffff] usable
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x000000008fc50000-0x000000009d7fffff] reserved
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x00000000e0000000-0x00000000efffffff] reserved
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x00000000fe000000-0x00000000fe010fff] reserved
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x00000000fed10000-0x00000000fed19fff] reserved
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x00000000fed84000-0x00000000fed84fff] reserved
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x00000000ff400000-0x00000000ffffffff] reserved
> >> [Wed May  8 08:20:04 2024] reserve setup_data: [mem 0x0000000100000000-0x00000008607fffff] usable
> >> [Wed May  8 08:20:04 2024] efi: EFI v2.7 by INSYDE Corp.
> >> [Wed May  8 08:20:04 2024] efi: ACPI=0x8fc4e000 ACPI 2.0=0x8fc4e014 TPMFinalLog=0x8fbc5000 SMBIOS=0x8d1e4000 SMBIOS 3.0=0x8d1e2000 ESRT=0x8d1e5998 MEMATTR=0x79e9b018 INITRD=0x79e94b18 RNG=0x8fbf6018 TPMEventLog=0x79e34018 
> >> [Wed May  8 08:20:04 2024] random: crng init done
> >> [Wed May  8 08:20:04 2024] efi: Remove mem69: MMIO range=[0xe0000000-0xefffffff] (256MB) from e820 map
> >> [Wed May  8 08:20:04 2024] e820: remove [mem 0xe0000000-0xefffffff] reserved
> >> [Wed May  8 08:20:04 2024] efi: Not removing mem70: MMIO range=[0xfe000000-0xfe010fff] (68KB) from e820 map
> >> [Wed May  8 08:20:04 2024] efi: Not removing mem71: MMIO range=[0xfed10000-0xfed19fff] (40KB) from e820 map
> >> [Wed May  8 08:20:04 2024] efi: Not removing mem72: MMIO range=[0xfed84000-0xfed84fff] (4KB) from e820 map
> >> [Wed May  8 08:20:04 2024] efi: Not removing mem73: MMIO range=[0xfee00000-0xfee00fff] (4KB) from e820 map
> >> [Wed May  8 08:20:04 2024] efi: Remove mem74: MMIO range=[0xff400000-0xffffffff] (12MB) from e820 map
> >> [Wed May  8 08:20:04 2024] e820: remove [mem 0xff400000-0xffffffff] reserved
> >> [Wed May  8 08:20:04 2024] SMBIOS 3.2.0 present.
> >> [Wed May  8 08:20:04 2024] DMI: Notebook                         NP50DE_DB                       /NP50DE_DB                       , BIOS 1.07.04 02/17/2020
> >> [Wed May  8 08:20:04 2024] tsc: Detected 2600.000 MHz processor
> >> [Wed May  8 08:20:04 2024] tsc: Detected 2599.992 MHz TSC
> >> [Wed May  8 08:20:04 2024] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
> >> [Wed May  8 08:20:04 2024] e820: remove [mem 0x000a0000-0x000fffff] usable
> >> [Wed May  8 08:20:04 2024] last_pfn = 0x860800 max_arch_pfn = 0x400000000
> >> [Wed May  8 08:20:04 2024] MTRR map: 5 entries (3 fixed + 2 variable; max 23), built from 10 variable MTRRs
> >> [Wed May  8 08:20:04 2024] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
> >> [Wed May  8 08:20:04 2024] last_pfn = 0x8fc50 max_arch_pfn = 0x400000000
> >> [Wed May  8 08:20:04 2024] esrt: Reserving ESRT space from 0x000000008d1e5998 to 0x000000008d1e5a48.
> >> [Wed May  8 08:20:04 2024] Using GB pages for direct mapping
> >> [Wed May  8 08:20:04 2024] Secure boot disabled
> >> [Wed May  8 08:20:04 2024] RAMDISK: [mem 0x79e41000-0x79e58fff]
> >> [Wed May  8 08:20:04 2024] ACPI: Early table checksum verification disabled
> >> [Wed May  8 08:20:04 2024] ACPI: RSDP 0x000000008FC4E014 000024 (v02 INSYDE)
> >> [Wed May  8 08:20:04 2024] ACPI: XSDT 0x000000008FBF9188 0000DC (v01 INSYDE CML      00000002      01000013)
> >> [Wed May  8 08:20:04 2024] ACPI: FACP 0x000000008FC37000 00010C (v05 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: DSDT 0x000000008FC00000 03337F (v02 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: FACS 0x000000008FB47000 000040
> >> [Wed May  8 08:20:04 2024] ACPI: UEFI 0x000000008FBCE000 000236 (v01 INSYDE CML      00000001 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0x000000008FC4A000 002087 (v02 CpuRef CpuSsdt  00003000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0x000000008FC46000 003158 (v02 SaSsdt SaSsdt   00003000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0x000000008FC44000 001848 (v02 PegSsd PegSsdt  00001000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0x000000008FC43000 000790 (v02 INSYDE Tpm2Tabl 00001000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: TPM2 0x000000008FC42000 000034 (v04 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: LPIT 0x000000008FC40000 000094 (v01 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: WSMT 0x000000008FC3F000 000028 (v01 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0x000000008FC3D000 001616 (v02 INSYDE PtidDevc 00001000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: DBGP 0x000000008FC3C000 000034 (v01 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: DBG2 0x000000008FC3B000 00005C (v00 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0x000000008FC3A000 000502 (v02 Intel  PerfTune 00001000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: NHLT 0x000000008FC38000 001821 (v00 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: HPET 0x000000008FC36000 000038 (v01 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: APIC 0x000000008FC35000 000164 (v03 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: MCFG 0x000000008FC34000 00003C (v01 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0x000000008FBFF000 000E58 (v02 INSYDE ClevoRTD 00001000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0x000000008FBFA000 0039F7 (v01 Insyde NvdTable 00001000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0x000000008FC4D000 000164 (v01 INSYDE PcdTabl  00001000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: DMAR 0x000000008FBFE000 0000A8 (v01 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: FPDT 0x000000008FBF8000 000044 (v01 INSYDE CML      00000002 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: BGRT 0x000000008FBF7000 000038 (v01 INSYDE CML      00000001 ACPI 00040000)
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving FACP table memory at [mem 0x8fc37000-0x8fc3710b]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving DSDT table memory at [mem 0x8fc00000-0x8fc3337e]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving FACS table memory at [mem 0x8fb47000-0x8fb4703f]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving UEFI table memory at [mem 0x8fbce000-0x8fbce235]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving SSDT table memory at [mem 0x8fc4a000-0x8fc4c086]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving SSDT table memory at [mem 0x8fc46000-0x8fc49157]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving SSDT table memory at [mem 0x8fc44000-0x8fc45847]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving SSDT table memory at [mem 0x8fc43000-0x8fc4378f]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving TPM2 table memory at [mem 0x8fc42000-0x8fc42033]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving LPIT table memory at [mem 0x8fc40000-0x8fc40093]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving WSMT table memory at [mem 0x8fc3f000-0x8fc3f027]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving SSDT table memory at [mem 0x8fc3d000-0x8fc3e615]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving DBGP table memory at [mem 0x8fc3c000-0x8fc3c033]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving DBG2 table memory at [mem 0x8fc3b000-0x8fc3b05b]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving SSDT table memory at [mem 0x8fc3a000-0x8fc3a501]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving NHLT table memory at [mem 0x8fc38000-0x8fc39820]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving HPET table memory at [mem 0x8fc36000-0x8fc36037]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving APIC table memory at [mem 0x8fc35000-0x8fc35163]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving MCFG table memory at [mem 0x8fc34000-0x8fc3403b]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving SSDT table memory at [mem 0x8fbff000-0x8fbffe57]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving SSDT table memory at [mem 0x8fbfa000-0x8fbfd9f6]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving SSDT table memory at [mem 0x8fc4d000-0x8fc4d163]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving DMAR table memory at [mem 0x8fbfe000-0x8fbfe0a7]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving FPDT table memory at [mem 0x8fbf8000-0x8fbf8043]
> >> [Wed May  8 08:20:04 2024] ACPI: Reserving BGRT table memory at [mem 0x8fbf7000-0x8fbf7037]
> >> [Wed May  8 08:20:04 2024] Zone ranges:
> >> [Wed May  8 08:20:04 2024]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> >> [Wed May  8 08:20:04 2024]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> >> [Wed May  8 08:20:04 2024]   Normal   [mem 0x0000000100000000-0x00000008607fffff]
> >> [Wed May  8 08:20:04 2024] Movable zone start for each node
> >> [Wed May  8 08:20:04 2024] Early memory node ranges
> >> [Wed May  8 08:20:04 2024]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> >> [Wed May  8 08:20:04 2024]   node   0: [mem 0x0000000000100000-0x000000007e1d8fff]
> >> [Wed May  8 08:20:04 2024]   node   0: [mem 0x000000007ead9000-0x000000008cceefff]
> >> [Wed May  8 08:20:04 2024]   node   0: [mem 0x000000008fc4f000-0x000000008fc4ffff]
> >> [Wed May  8 08:20:04 2024]   node   0: [mem 0x0000000100000000-0x00000008607fffff]
> >> [Wed May  8 08:20:04 2024] Initmem setup node 0 [mem 0x0000000000001000-0x00000008607fffff]
> >> [Wed May  8 08:20:04 2024] On node 0, zone DMA: 1 pages in unavailable ranges
> >> [Wed May  8 08:20:04 2024] On node 0, zone DMA: 97 pages in unavailable ranges
> >> [Wed May  8 08:20:04 2024] On node 0, zone DMA32: 2304 pages in unavailable ranges
> >> [Wed May  8 08:20:04 2024] On node 0, zone DMA32: 12128 pages in unavailable ranges
> >> [Wed May  8 08:20:04 2024] On node 0, zone Normal: 944 pages in unavailable ranges
> >> [Wed May  8 08:20:04 2024] On node 0, zone Normal: 30720 pages in unavailable ranges
> >> [Wed May  8 08:20:04 2024] Reserving Intel graphics memory at [mem 0x99800000-0x9d7fffff]
> >> [Wed May  8 08:20:04 2024] ACPI: PM-Timer IO Port: 0x1808
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x11] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x12] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x13] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] ACPI: LAPIC_NMI (acpi_id[0x14] high edge lint[0x1])
> >> [Wed May  8 08:20:04 2024] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
> >> [Wed May  8 08:20:04 2024] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> >> [Wed May  8 08:20:04 2024] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> >> [Wed May  8 08:20:04 2024] ACPI: Using ACPI (MADT) for SMP configuration information
> >> [Wed May  8 08:20:04 2024] ACPI: HPET id: 0x8086a201 base: 0xfed00000
> >> [Wed May  8 08:20:04 2024] TSC deadline timer available
> >> [Wed May  8 08:20:04 2024] CPU topo: Max. logical packages:   1
> >> [Wed May  8 08:20:04 2024] CPU topo: Max. logical dies:       1
> >> [Wed May  8 08:20:04 2024] CPU topo: Max. dies per package:   1
> >> [Wed May  8 08:20:04 2024] CPU topo: Max. threads per core:   2
> >> [Wed May  8 08:20:04 2024] CPU topo: Num. cores per package:     6
> >> [Wed May  8 08:20:04 2024] CPU topo: Num. threads per package:  12
> >> [Wed May  8 08:20:04 2024] CPU topo: Allowing 12 present CPUs plus 0 hotplug CPUs
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0x79527000-0x79527fff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0x79536000-0x79536fff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0x7e1d9000-0x7ead8fff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0x8ccef000-0x8eedefff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0x8eedf000-0x8fbcefff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0x8fbcf000-0x8fc4efff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0x8fc50000-0x9d7fffff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0x9d800000-0xfdffffff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0xfe000000-0xfe010fff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0xfe011000-0xfed0ffff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0xfed10000-0xfed19fff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0xfed1a000-0xfed83fff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0xfed84000-0xfed84fff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0xfed85000-0xfedfffff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
> >> [Wed May  8 08:20:04 2024] PM: hibernation: Registered nosave memory: [mem 0xfee01000-0xffffffff]
> >> [Wed May  8 08:20:04 2024] [mem 0x9d800000-0xfdffffff] available for PCI devices
> >> [Wed May  8 08:20:04 2024] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
> >> [Wed May  8 08:20:04 2024] setup_percpu: NR_CPUS:12 nr_cpumask_bits:12 nr_cpu_ids:12 nr_node_ids:1
> >> [Wed May  8 08:20:04 2024] percpu: Embedded 47 pages/cpu s151592 r8192 d32728 u262144
> >> [Wed May  8 08:20:04 2024] pcpu-alloc: s151592 r8192 d32728 u262144 alloc=1*2097152
> >> [Wed May  8 08:20:04 2024] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 -- -- -- -- 
> >> [Wed May  8 08:20:04 2024] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-6.9.0-rc7+ ro root=PARTUUID=f927883a-e95c-4cdd-b64e-a0a778216b9f resume=PARTUUID=70ccedc5-d788-42bc-9f13-81e2beb61338 rootfstype=ext4 net.ifnames=0 video=1920x1080@60
> >> [Wed May  8 08:20:04 2024] Unknown kernel command line parameters "BOOT_IMAGE=/boot/vmlinuz-6.9.0-rc7+", will be passed to user space.
> >> [Wed May  8 08:20:04 2024] Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
> >> [Wed May  8 08:20:04 2024] Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
> >> [Wed May  8 08:20:04 2024] Built 1 zonelists, mobility grouping on.  Total pages: 8179648
> >> [Wed May  8 08:20:04 2024] mem auto-init: stack:off, heap alloc:off, heap free:off
> >> [Wed May  8 08:20:04 2024] software IO TLB: area num 16.
> >> [Wed May  8 08:20:04 2024] Memory: 32510784K/33238584K available (14336K kernel code, 1182K rwdata, 4456K rodata, 2060K init, 844K bss, 727540K reserved, 0K cma-reserved)
> >> [Wed May  8 08:20:04 2024] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=12, Nodes=1
> >> [Wed May  8 08:20:04 2024] Dynamic Preempt: full
> >> [Wed May  8 08:20:04 2024] rcu: Preemptible hierarchical RCU implementation.
> >> [Wed May  8 08:20:04 2024] rcu: 	RCU event tracing is enabled.
> >> [Wed May  8 08:20:04 2024] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> >> [Wed May  8 08:20:04 2024] NR_IRQS: 4352, nr_irqs: 2152, preallocated irqs: 16
> >> [Wed May  8 08:20:04 2024] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> >> [Wed May  8 08:20:04 2024] Console: colour dummy device 80x25
> >> [Wed May  8 08:20:04 2024] printk: legacy console [tty0] enabled
> >> [Wed May  8 08:20:04 2024] ACPI: Core revision 20230628
> >> [Wed May  8 08:20:04 2024] hpet: HPET dysfunctional in PC10. Force disabled.
> >> [Wed May  8 08:20:04 2024] APIC: Switch to symmetric I/O mode setup
> >> [Wed May  8 08:20:04 2024] APIC: Switched APIC routing to: physical flat
> >> [Wed May  8 08:20:04 2024] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x257a34a6eea, max_idle_ns: 440795264358 ns
> >> [Wed May  8 08:20:04 2024] Calibrating delay loop (skipped), value calculated using timer frequency.. 5199.98 BogoMIPS (lpj=10399968)
> >> [Wed May  8 08:20:04 2024] CPU0: Thermal monitoring enabled (TM1)
> >> [Wed May  8 08:20:04 2024] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
> >> [Wed May  8 08:20:04 2024] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
> >> [Wed May  8 08:20:04 2024] process: using mwait in idle threads
> >> [Wed May  8 08:20:04 2024] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
> >> [Wed May  8 08:20:04 2024] Spectre V2 : Spectre BHI mitigation: SW BHB clearing on vm exit
> >> [Wed May  8 08:20:04 2024] Spectre V2 : Spectre BHI mitigation: SW BHB clearing on syscall
> >> [Wed May  8 08:20:04 2024] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
> >> [Wed May  8 08:20:04 2024] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
> >> [Wed May  8 08:20:04 2024] Spectre V2 : Spectre v2 / PBRSB-eIBRS: Retire a single CALL on VMEXIT
> >> [Wed May  8 08:20:04 2024] RETBleed: Mitigation: Enhanced IBRS
> >> [Wed May  8 08:20:04 2024] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
> >> [Wed May  8 08:20:04 2024] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
> >> [Wed May  8 08:20:04 2024] MMIO Stale Data: Mitigation: Clear CPU buffers
> >> [Wed May  8 08:20:04 2024] SRBDS: Mitigation: Microcode
> >> [Wed May  8 08:20:04 2024] GDS: Mitigation: Microcode
> >> [Wed May  8 08:20:04 2024] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> >> [Wed May  8 08:20:04 2024] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> >> [Wed May  8 08:20:04 2024] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> >> [Wed May  8 08:20:04 2024] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
> >> [Wed May  8 08:20:04 2024] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
> >> [Wed May  8 08:20:04 2024] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
> >> [Wed May  8 08:20:04 2024] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> >> [Wed May  8 08:20:04 2024] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
> >> [Wed May  8 08:20:04 2024] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
> >> [Wed May  8 08:20:04 2024] x86/fpu: xstate_offset[9]:  960, xstate_sizes[9]:    8
> >> [Wed May  8 08:20:04 2024] x86/fpu: Enabled xstate features 0x21f, context size is 968 bytes, using 'compacted' format.
> >> [Wed May  8 08:20:04 2024] Freeing SMP alternatives memory: 36K
> >> [Wed May  8 08:20:04 2024] pid_max: default: 32768 minimum: 301
> >> [Wed May  8 08:20:04 2024] Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
> >> [Wed May  8 08:20:04 2024] Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
> >> [Wed May  8 08:20:04 2024] smpboot: CPU0: Intel(R) Core(TM) i7-10750H CPU @ 2.60GHz (family: 0x6, model: 0xa5, stepping: 0x2)
> >> [Wed May  8 08:20:04 2024] Performance Events: PEBS fmt3+, Skylake events, 32-deep LBR, full-width counters, Intel PMU driver.
> >> [Wed May  8 08:20:04 2024] ... version:                4
> >> [Wed May  8 08:20:04 2024] ... bit width:              48
> >> [Wed May  8 08:20:04 2024] ... generic registers:      4
> >> [Wed May  8 08:20:04 2024] ... value mask:             0000ffffffffffff
> >> [Wed May  8 08:20:04 2024] ... max period:             00007fffffffffff
> >> [Wed May  8 08:20:04 2024] ... fixed-purpose events:   3
> >> [Wed May  8 08:20:04 2024] ... event mask:             000000070000000f
> >> [Wed May  8 08:20:04 2024] signal: max sigframe size: 3632
> >> [Wed May  8 08:20:04 2024] Estimated ratio of average max frequency by base frequency (times 1024): 1811
> >> [Wed May  8 08:20:04 2024] rcu: Hierarchical SRCU implementation.
> >> [Wed May  8 08:20:04 2024] rcu: 	Max phase no-delay instances is 1000.
> >> [Wed May  8 08:20:04 2024] smp: Bringing up secondary CPUs ...
> >> [Wed May  8 08:20:04 2024] smpboot: x86: Booting SMP configuration:
> >> [Wed May  8 08:20:04 2024] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  #9 #10 #11
> >> [Wed May  8 08:20:04 2024] MMIO Stale Data CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/processor_mmio_stale_data.html for more details.
> >> [Wed May  8 08:20:04 2024] smp: Brought up 1 node, 12 CPUs
> >> [Wed May  8 08:20:04 2024] smpboot: Total of 12 processors activated (62399.80 BogoMIPS)
> >> [Wed May  8 08:20:04 2024] devtmpfs: initialized
> >> [Wed May  8 08:20:04 2024] ACPI: PM: Registering ACPI NVS region [mem 0x8eedf000-0x8fbcefff] (13565952 bytes)
> >> [Wed May  8 08:20:04 2024] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> >> [Wed May  8 08:20:04 2024] futex hash table entries: 4096 (order: 6, 262144 bytes, linear)
> >> [Wed May  8 08:20:04 2024] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> >> [Wed May  8 08:20:04 2024] thermal_sys: Registered thermal governor 'step_wise'
> >> [Wed May  8 08:20:04 2024] thermal_sys: Registered thermal governor 'user_space'
> >> [Wed May  8 08:20:04 2024] cpuidle: using governor ladder
> >> [Wed May  8 08:20:04 2024] cpuidle: using governor menu
> >> [Wed May  8 08:20:04 2024] PCI: Using configuration type 1 for base access
> >> [Wed May  8 08:20:04 2024] cryptd: max_cpu_qlen set to 1000
> >> [Wed May  8 08:20:04 2024] ACPI: Added _OSI(Module Device)
> >> [Wed May  8 08:20:04 2024] ACPI: Added _OSI(Processor Device)
> >> [Wed May  8 08:20:04 2024] ACPI: Added _OSI(3.0 _SCP Extensions)
> >> [Wed May  8 08:20:04 2024] ACPI: Added _OSI(Processor Aggregator Device)
> >> [Wed May  8 08:20:04 2024] ACPI BIOS Error (bug): Could not resolve symbol [\_SB.PCI0.XDCI], AE_NOT_FOUND (20230628/dswload2-162)
> >> [Wed May  8 08:20:04 2024] ACPI Error: AE_NOT_FOUND, During name lookup/catalog (20230628/psobject-220)
> >> [Wed May  8 08:20:04 2024] ACPI: Skipping parse of AML opcode: OpcodeName unavailable (0x0010)
> >> [Wed May  8 08:20:04 2024] ACPI: 10 ACPI AML tables successfully acquired and loaded
> >> [Wed May  8 08:20:04 2024] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
> >> [Wed May  8 08:20:04 2024] ACPI: Dynamic OEM Table Load:
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0xFFFF9DD2C08D0C00 000400 (v02 PmRef  Cpu0Cst  00003001 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: Dynamic OEM Table Load:
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0xFFFF9DD2C08CA800 000581 (v02 PmRef  Cpu0Ist  00003000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: Dynamic OEM Table Load:
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0xFFFF9DD2C0C86400 0000FC (v02 PmRef  Cpu0Psd  00003000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: Dynamic OEM Table Load:
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0xFFFF9DD2C0CC4800 000137 (v02 PmRef  Cpu0Hwp  00003000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: Dynamic OEM Table Load:
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0xFFFF9DD2C08D9000 000BEA (v02 PmRef  HwpLvt   00003000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: Dynamic OEM Table Load:
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0xFFFF9DD2C08CC000 000778 (v02 PmRef  ApIst    00003000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: Dynamic OEM Table Load:
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0xFFFF9DD2C08D1000 0003D7 (v02 PmRef  ApHwp    00003000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: Dynamic OEM Table Load:
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0xFFFF9DD2C08DA000 000D22 (v02 PmRef  ApPsd    00003000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: Dynamic OEM Table Load:
> >> [Wed May  8 08:20:04 2024] ACPI: SSDT 0xFFFF9DD2C08D1400 0003CA (v02 PmRef  ApCst    00003000 INTL 20160422)
> >> [Wed May  8 08:20:04 2024] ACPI: _OSC evaluated successfully for all CPUs
> >> [Wed May  8 08:20:04 2024] ACPI: EC: EC started
> >> [Wed May  8 08:20:04 2024] ACPI: EC: interrupt blocked
> >> [Wed May  8 08:20:04 2024] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
> >> [Wed May  8 08:20:04 2024] ACPI: \_SB_.PCI0.LPCB.EC__: Boot DSDT EC used to handle transactions
> >> [Wed May  8 08:20:04 2024] ACPI: Interpreter enabled
> >> [Wed May  8 08:20:04 2024] ACPI: PM: (supports S0 S3 S4 S5)
> >> [Wed May  8 08:20:04 2024] ACPI: Using IOAPIC for interrupt routing
> >> [Wed May  8 08:20:04 2024] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
> >> [Wed May  8 08:20:04 2024] PCI: Using E820 reservations for host bridge windows
> >> [Wed May  8 08:20:04 2024] ACPI: Enabled 7 GPEs in block 00 to 7F
> >> [Wed May  8 08:20:04 2024] ACPI: \_SB_.PCI0.PEG0.PG00: New power resource
> >> [Wed May  8 08:20:04 2024] ACPI: \_SB_.PCI0.XHC_.RHUB.HS14.BTPR: New power resource
> >> [Wed May  8 08:20:04 2024] ACPI: \_SB_.PCI0.SAT0.VOL0.V0PR: New power resource
> >> [Wed May  8 08:20:04 2024] ACPI: \_SB_.PCI0.SAT0.VOL1.V1PR: New power resource
> >> [Wed May  8 08:20:04 2024] ACPI: \_SB_.PCI0.SAT0.VOL2.V2PR: New power resource
> >> [Wed May  8 08:20:04 2024] ACPI: \_SB_.PCI0.CNVW.WRST: New power resource
> >> [Wed May  8 08:20:04 2024] ACPI: \PIN_: New power resource
> >> [Wed May  8 08:20:04 2024] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
> >> [Wed May  8 08:20:04 2024] acpi PNP0A08:00: _OSC: OS supports [ASPM ClockPM Segments MSI HPX-Type3]
> >> [Wed May  8 08:20:04 2024] acpi PNP0A08:00: _OSC: not requesting OS control; OS requires [ExtendedConfig ASPM ClockPM MSI]
> >> [Wed May  8 08:20:04 2024] PCI host bridge to bus 0000:00
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:00: root bus resource [mem 0x9d800000-0xdfffffff window]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:00: root bus resource [mem 0xfc800000-0xfe7fffff window]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:00: root bus resource [bus 00-fe]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:00.0: [8086:9b54] type 00 class 0x060000 conventional PCI endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:01.0: [8086:1901] type 01 class 0x060400 PCIe Root Port
> >> [Wed May  8 08:20:04 2024] pci 0000:00:01.0: PCI bridge to [bus 01-05]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:01.0:   bridge window [io  0x4000-0x4fff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:01.0:   bridge window [mem 0xc3000000-0xc4ffffff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:01.0:   bridge window [mem 0xb0000000-0xc1ffffff 64bit pref]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
> >> [Wed May  8 08:20:04 2024] pci 0000:00:02.0: [8086:9bc4] type 00 class 0x030000 PCIe Root Complex Integrated Endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:02.0: BAR 0 [mem 0xc2000000-0xc2ffffff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:02.0: BAR 2 [mem 0xa0000000-0xafffffff 64bit pref]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:02.0: BAR 4 [io  0x5000-0x503f]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:12.0: [8086:06f9] type 00 class 0x118000 conventional PCI endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:12.0: BAR 0 [mem 0xc539c000-0xc539cfff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:14.0: [8086:06ed] type 00 class 0x0c0330 conventional PCI endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:14.0: BAR 0 [mem 0xc5380000-0xc538ffff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:14.0: PME# supported from D3hot D3cold
> >> [Wed May  8 08:20:04 2024] pci 0000:00:14.2: [8086:06ef] type 00 class 0x050000 conventional PCI endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:14.2: BAR 0 [mem 0xc5398000-0xc5399fff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:14.2: BAR 2 [mem 0xc539d000-0xc539dfff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:14.3: [8086:06f0] type 00 class 0x028000 PCIe Root Complex Integrated Endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:14.3: BAR 0 [mem 0xc5390000-0xc5393fff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
> >> [Wed May  8 08:20:04 2024] pci 0000:00:15.0: [8086:06e8] type 00 class 0x0c8000 conventional PCI endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:15.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:15.1: [8086:06e9] type 00 class 0x0c8000 conventional PCI endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:15.1: BAR 0 [mem 0x00000000-0x00000fff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:16.0: [8086:06e0] type 00 class 0x078000 conventional PCI endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:16.0: BAR 0 [mem 0xc53a0000-0xc53a0fff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:16.0: PME# supported from D3hot
> >> [Wed May  8 08:20:04 2024] pci 0000:00:17.0: [8086:06d3] type 00 class 0x010601 conventional PCI endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:17.0: BAR 0 [mem 0xc539a000-0xc539bfff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:17.0: BAR 1 [mem 0xc53a4000-0xc53a40ff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:17.0: BAR 2 [io  0x5080-0x5087]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:17.0: BAR 3 [io  0x5088-0x508b]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:17.0: BAR 4 [io  0x5060-0x507f]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:17.0: BAR 5 [mem 0xc53a3000-0xc53a37ff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:17.0: PME# supported from D3hot
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.0: [8086:06b0] type 01 class 0x060400 PCIe Root Port
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.0: PCI bridge to [bus 06]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.0:   bridge window [mem 0xc5200000-0xc52fffff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.5: [8086:06b5] type 01 class 0x060400 PCIe Root Port
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.5: PCI bridge to [bus 07]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.5: PME# supported from D0 D3hot D3cold
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.6: [8086:06b6] type 01 class 0x060400 PCIe Root Port
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.6: PCI bridge to [bus 08]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.6:   bridge window [io  0x3000-0x3fff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.6:   bridge window [mem 0xc5100000-0xc51fffff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.6: PME# supported from D0 D3hot D3cold
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1f.0: [8086:068d] type 00 class 0x060100 conventional PCI endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1f.3: [8086:06c8] type 00 class 0x040300 conventional PCI endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1f.3: BAR 0 [mem 0xc5394000-0xc5397fff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1f.3: BAR 4 [mem 0xc5000000-0xc50fffff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1f.3: PME# supported from D3hot D3cold
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1f.4: [8086:06a3] type 00 class 0x0c0500 conventional PCI endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1f.4: BAR 0 [mem 0xc53a1000-0xc53a10ff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1f.5: [8086:06a4] type 00 class 0x0c8000 conventional PCI endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
> >> [Wed May  8 08:20:04 2024] pci 0000:01:00.0: [10de:1f95] type 00 class 0x030000 PCIe Legacy Endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:01:00.0: BAR 0 [mem 0xc4000000-0xc4ffffff]
> >> [Wed May  8 08:20:04 2024] pci 0000:01:00.0: BAR 1 [mem 0xb0000000-0xbfffffff 64bit pref]
> >> [Wed May  8 08:20:04 2024] pci 0000:01:00.0: BAR 3 [mem 0xc0000000-0xc1ffffff 64bit pref]
> >> [Wed May  8 08:20:04 2024] pci 0000:01:00.0: BAR 5 [io  0x4000-0x407f]
> >> [Wed May  8 08:20:04 2024] pci 0000:01:00.0: ROM [mem 0xfff80000-0xffffffff pref]
> >> [Wed May  8 08:20:04 2024] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
> >> [Wed May  8 08:20:04 2024] pci 0000:01:00.0: 63.008 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x8 link at 0000:00:01.0 (capable of 126.016 Gb/s with 8.0 GT/s PCIe x16 link)
> >> [Wed May  8 08:20:04 2024] pci 0000:00:01.0: PCI bridge to [bus 01-05]
> >> [Wed May  8 08:20:04 2024] pci 0000:06:00.0: [15b7:5009] type 00 class 0x010802 PCIe Endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:06:00.0: BAR 0 [mem 0xc5200000-0xc5203fff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:06:00.0: BAR 4 [mem 0xc5204000-0xc52040ff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.0: PCI bridge to [bus 06]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.5: PCI bridge to [bus 07]
> >> [Wed May  8 08:20:04 2024] pci 0000:08:00.0: [10ec:5287] type 00 class 0xff0000 PCIe Endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:08:00.0: BAR 0 [mem 0xc5105000-0xc5105fff]
> >> [Wed May  8 08:20:04 2024] pci 0000:08:00.0: ROM [mem 0x00000000-0x0000ffff pref]
> >> [Wed May  8 08:20:04 2024] pci 0000:08:00.0: supports D1 D2
> >> [Wed May  8 08:20:04 2024] pci 0000:08:00.0: PME# supported from D1 D2 D3hot D3cold
> >> [Wed May  8 08:20:04 2024] pci 0000:08:00.1: [10ec:8168] type 00 class 0x020000 PCIe Endpoint
> >> [Wed May  8 08:20:04 2024] pci 0000:08:00.1: BAR 0 [io  0x3000-0x30ff]
> >> [Wed May  8 08:20:04 2024] pci 0000:08:00.1: BAR 2 [mem 0xc5104000-0xc5104fff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:08:00.1: BAR 4 [mem 0xc5100000-0xc5103fff 64bit]
> >> [Wed May  8 08:20:04 2024] pci 0000:08:00.1: supports D1 D2
> >> [Wed May  8 08:20:04 2024] pci 0000:08:00.1: PME# supported from D0 D1 D2 D3hot D3cold
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.6: PCI bridge to [bus 08]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:00: on NUMA node 0
> >> [Wed May  8 08:20:04 2024] ACPI: EC: interrupt unblocked
> >> [Wed May  8 08:20:04 2024] ACPI: EC: event unblocked
> >> [Wed May  8 08:20:04 2024] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
> >> [Wed May  8 08:20:04 2024] ACPI: EC: GPE=0x3
> >> [Wed May  8 08:20:04 2024] ACPI: \_SB_.PCI0.LPCB.EC__: Boot DSDT EC initialization complete
> >> [Wed May  8 08:20:04 2024] ACPI: \_SB_.PCI0.LPCB.EC__: EC: Used to handle transactions and events
> >> [Wed May  8 08:20:04 2024] iommu: Default domain type: Translated
> >> [Wed May  8 08:20:04 2024] iommu: DMA domain TLB invalidation policy: lazy mode
> >> [Wed May  8 08:20:04 2024] SCSI subsystem initialized
> >> [Wed May  8 08:20:04 2024] libata version 3.00 loaded.
> >> [Wed May  8 08:20:04 2024] ACPI: bus type USB registered
> >> [Wed May  8 08:20:04 2024] usbcore: registered new interface driver usbfs
> >> [Wed May  8 08:20:04 2024] usbcore: registered new interface driver hub
> >> [Wed May  8 08:20:04 2024] usbcore: registered new device driver usb
> >> [Wed May  8 08:20:04 2024] mc: Linux media interface: v0.10
> >> [Wed May  8 08:20:04 2024] videodev: Linux video capture interface: v2.00
> >> [Wed May  8 08:20:04 2024] efivars: Registered efivars operations
> >> [Wed May  8 08:20:04 2024] Advanced Linux Sound Architecture Driver Initialized.
> >> [Wed May  8 08:20:04 2024] Bluetooth: Core ver 2.22
> >> [Wed May  8 08:20:04 2024] NET: Registered PF_BLUETOOTH protocol family
> >> [Wed May  8 08:20:04 2024] Bluetooth: HCI device and connection manager initialized
> >> [Wed May  8 08:20:04 2024] Bluetooth: HCI socket layer initialized
> >> [Wed May  8 08:20:04 2024] Bluetooth: L2CAP socket layer initialized
> >> [Wed May  8 08:20:04 2024] Bluetooth: SCO socket layer initialized
> >> [Wed May  8 08:20:04 2024] PCI: Using ACPI for IRQ routing
> >> [Wed May  8 08:20:04 2024] PCI: pci_cache_line_size set to 64 bytes
> >> [Wed May  8 08:20:04 2024] e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
> >> [Wed May  8 08:20:04 2024] e820: reserve RAM buffer [mem 0x79527018-0x7bffffff]
> >> [Wed May  8 08:20:04 2024] e820: reserve RAM buffer [mem 0x7e1d9000-0x7fffffff]
> >> [Wed May  8 08:20:04 2024] e820: reserve RAM buffer [mem 0x8ccef000-0x8fffffff]
> >> [Wed May  8 08:20:04 2024] e820: reserve RAM buffer [mem 0x8fc50000-0x8fffffff]
> >> [Wed May  8 08:20:04 2024] e820: reserve RAM buffer [mem 0x860800000-0x863ffffff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:02.0: vgaarb: setting as boot VGA device
> >> [Wed May  8 08:20:04 2024] pci 0000:00:02.0: vgaarb: bridge control possible
> >> [Wed May  8 08:20:04 2024] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> >> [Wed May  8 08:20:04 2024] pci 0000:01:00.0: vgaarb: bridge control possible
> >> [Wed May  8 08:20:04 2024] pci 0000:01:00.0: vgaarb: VGA device added: decodes=io+mem,owns=none,locks=none
> >> [Wed May  8 08:20:04 2024] vgaarb: loaded
> >> [Wed May  8 08:20:04 2024] wmi_bus wmi_bus-PNP0C14:01: [Firmware Info]: 00000000-0000-0000-0000-000000000000 has zero instances
> >> [Wed May  8 08:20:04 2024] wmi_bus wmi_bus-PNP0C14:01: [Firmware Info]: 00000000-0000-0000-0000-000000000000 has zero instances
> >> [Wed May  8 08:20:04 2024] wmi_bus wmi_bus-PNP0C14:01: [Firmware Info]: 00000000-0000-0000-0000-000000000000 has zero instances
> >> [Wed May  8 08:20:04 2024] wmi_bus wmi_bus-PNP0C14:01: [Firmware Info]: 00000000-0000-0000-0000-000000000000 has zero instances
> >> [Wed May  8 08:20:04 2024] clocksource: Switched to clocksource tsc-early
> >> [Wed May  8 08:20:04 2024] pnp: PnP ACPI init
> >> [Wed May  8 08:20:04 2024] system 00:00: [mem 0x40000000-0x403fffff] could not be reserved
> >> [Wed May  8 08:20:04 2024] system 00:01: [io  0x1800-0x18fe] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:01: [mem 0xfd000000-0xfd69ffff] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:01: [mem 0xfd6c0000-0xfd6cffff] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:01: [mem 0xfd6f0000-0xfdffffff] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:01: [mem 0xfe000000-0xfe01ffff] could not be reserved
> >> [Wed May  8 08:20:04 2024] system 00:01: [mem 0xfe200000-0xfe7fffff] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:01: [mem 0xff000000-0xffffffff] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:02: [io  0x2000-0x20fe] has been reserved
> >> [Wed May  8 08:20:04 2024] pnp 00:03: disabling [io  0x3322-0x3323] because it overlaps 0000:00:1d.6 BAR 7 [io  0x3000-0x3fff]
> >> [Wed May  8 08:20:04 2024] system 00:03: [io  0x0680-0x069f] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:03: [io  0x164e-0x164f] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:05: [io  0x1854-0x1857] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:08: [mem 0xfed10000-0xfed17fff] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:08: [mem 0xfed18000-0xfed18fff] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:08: [mem 0xfed19000-0xfed19fff] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:08: [mem 0xe0000000-0xefffffff] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:08: [mem 0xfed20000-0xfed3ffff] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:08: [mem 0xfed90000-0xfed93fff] has been reserved
> >> [Wed May  8 08:20:04 2024] system 00:08: [mem 0xfed45000-0xfed8ffff] could not be reserved
> >> [Wed May  8 08:20:04 2024] system 00:08: [mem 0xfee00000-0xfeefffff] could not be reserved
> >> [Wed May  8 08:20:04 2024] system 00:09: [mem 0xfe038000-0xfe038fff] has been reserved
> >> [Wed May  8 08:20:04 2024] pnp: PnP ACPI: found 10 devices
> >> [Wed May  8 08:20:04 2024] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
> >> [Wed May  8 08:20:04 2024] NET: Registered PF_INET protocol family
> >> [Wed May  8 08:20:04 2024] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> >> [Wed May  8 08:20:04 2024] tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
> >> [Wed May  8 08:20:04 2024] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> >> [Wed May  8 08:20:04 2024] TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> >> [Wed May  8 08:20:04 2024] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
> >> [Wed May  8 08:20:04 2024] TCP: Hash tables configured (established 262144 bind 65536)
> >> [Wed May  8 08:20:04 2024] UDP hash table entries: 16384 (order: 7, 524288 bytes, linear)
> >> [Wed May  8 08:20:04 2024] UDP-Lite hash table entries: 16384 (order: 7, 524288 bytes, linear)
> >> [Wed May  8 08:20:04 2024] NET: Registered PF_UNIX/PF_LOCAL protocol family
> >> [Wed May  8 08:20:04 2024] pci 0000:01:00.0: ROM [mem 0xfff80000-0xffffffff pref]: can't claim; no compatible bridge window
> >> [Wed May  8 08:20:04 2024] resource: avoiding allocation from e820 entry [mem 0x0009f000-0x000fffff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:15.0: BAR 0 [mem 0x9d800000-0x9d800fff 64bit]: assigned
> >> [Wed May  8 08:20:04 2024] resource: avoiding allocation from e820 entry [mem 0x0009f000-0x000fffff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:15.1: BAR 0 [mem 0x9d801000-0x9d801fff 64bit]: assigned
> >> [Wed May  8 08:20:04 2024] pci 0000:01:00.0: ROM [mem 0xc3000000-0xc307ffff pref]: assigned
> >> [Wed May  8 08:20:04 2024] pci 0000:00:01.0: PCI bridge to [bus 01-05]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:01.0:   bridge window [io  0x4000-0x4fff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:01.0:   bridge window [mem 0xc3000000-0xc4ffffff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:01.0:   bridge window [mem 0xb0000000-0xc1ffffff 64bit pref]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.0: PCI bridge to [bus 06]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.0:   bridge window [mem 0xc5200000-0xc52fffff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.5: PCI bridge to [bus 07]
> >> [Wed May  8 08:20:04 2024] pci 0000:08:00.0: ROM [mem 0xc5110000-0xc511ffff pref]: assigned
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.6: PCI bridge to [bus 08]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.6:   bridge window [io  0x3000-0x3fff]
> >> [Wed May  8 08:20:04 2024] pci 0000:00:1d.6:   bridge window [mem 0xc5100000-0xc51fffff]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:00: resource 7 [mem 0x9d800000-0xdfffffff window]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:00: resource 8 [mem 0xfc800000-0xfe7fffff window]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:01: resource 0 [io  0x4000-0x4fff]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:01: resource 1 [mem 0xc3000000-0xc4ffffff]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:01: resource 2 [mem 0xb0000000-0xc1ffffff 64bit pref]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:06: resource 1 [mem 0xc5200000-0xc52fffff]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:08: resource 0 [io  0x3000-0x3fff]
> >> [Wed May  8 08:20:04 2024] pci_bus 0000:08: resource 1 [mem 0xc5100000-0xc51fffff]
> >> [Wed May  8 08:20:04 2024] PCI: CLS 64 bytes, default 64
> >> [Wed May  8 08:20:04 2024] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> >> [Wed May  8 08:20:04 2024] software IO TLB: mapped [mem 0x0000000087d15000-0x000000008bd15000] (64MB)
> >> [Wed May  8 08:20:04 2024] Unpacking initramfs...
> >> [Wed May  8 08:20:04 2024] Freeing initrd memory: 96K
> >> [Wed May  8 08:20:04 2024] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 655360 ms ovfl timer
> >> [Wed May  8 08:20:04 2024] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
> >> [Wed May  8 08:20:04 2024] RAPL PMU: hw unit of domain package 2^-14 Joules
> >> [Wed May  8 08:20:04 2024] RAPL PMU: hw unit of domain dram 2^-14 Joules
> >> [Wed May  8 08:20:04 2024] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
> >> [Wed May  8 08:20:04 2024] RAPL PMU: hw unit of domain psys 2^-14 Joules
> >> [Wed May  8 08:20:04 2024] Initialise system trusted keyrings
> >> [Wed May  8 08:20:04 2024] workingset: timestamp_bits=62 max_order=23 bucket_order=0
> >> [Wed May  8 08:20:04 2024] Key type cifs.spnego registered
> >> [Wed May  8 08:20:04 2024] Key type cifs.idmap registered
> >> [Wed May  8 08:20:04 2024] fuse: init (API version 7.40)
> >> [Wed May  8 08:20:05 2024] NET: Registered PF_ALG protocol family
> >> [Wed May  8 08:20:05 2024] Key type asymmetric registered
> >> [Wed May  8 08:20:05 2024] Asymmetric key parser 'x509' registered
> >> [Wed May  8 08:20:05 2024] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
> >> [Wed May  8 08:20:05 2024] io scheduler mq-deadline registered
> >> [Wed May  8 08:20:05 2024] Monitor-Mwait will be used to enter C-1 state
> >> [Wed May  8 08:20:05 2024] Monitor-Mwait will be used to enter C-2 state
> >> [Wed May  8 08:20:05 2024] Monitor-Mwait will be used to enter C-3 state
> >> [Wed May  8 08:20:05 2024] ACPI: \_SB_.PR00: Found 3 idle states
> >> [Wed May  8 08:20:05 2024] ACPI: AC: AC Adapter [AC] (on-line)
> >> [Wed May  8 08:20:05 2024] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0
> >> [Wed May  8 08:20:05 2024] ACPI: button: Power Button [PWRB]
> >> [Wed May  8 08:20:05 2024] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input1
> >> [Wed May  8 08:20:05 2024] ACPI: button: Sleep Button [SLPB]
> >> [Wed May  8 08:20:05 2024] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input2
> >> [Wed May  8 08:20:05 2024] ACPI: button: Lid Switch [LID0]
> >> [Wed May  8 08:20:05 2024] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input3
> >> [Wed May  8 08:20:05 2024] ACPI: button: Power Button [PWRF]
> >> [Wed May  8 08:20:05 2024] ACPI: \_TZ_.TZ0_: _AL0 evaluation failure
> >> [Wed May  8 08:20:05 2024] thermal LNXTHERM:00: registered as thermal_zone0
> >> [Wed May  8 08:20:05 2024] ACPI: thermal: Thermal Zone [TZ0] (58 C)
> >> [Wed May  8 08:20:05 2024] ACPI: battery: Slot [BAT0] (battery present)
> >> [Wed May  8 08:20:05 2024] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> >> [Wed May  8 08:20:05 2024] Linux agpgart interface v0.103
> >> [Wed May  8 08:20:05 2024] ACPI: bus type drm_connector registered
> >> [Wed May  8 08:20:05 2024] i915 0000:00:02.0: vgaarb: deactivate vga console
> >> [Wed May  8 08:20:05 2024] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=io+mem
> >> [Wed May  8 08:20:05 2024] i915 0000:00:02.0: Direct firmware load for i915/kbl_dmc_ver1_04.bin failed with error -2
> >> [Wed May  8 08:20:05 2024] i915 0000:00:02.0: [drm] Failed to load DMC firmware i915/kbl_dmc_ver1_04.bin. Disabling runtime power management.
> >> [Wed May  8 08:20:05 2024] i915 0000:00:02.0: [drm] DMC firmware homepage: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/i915
> >> [Wed May  8 08:20:05 2024] [drm] Initialized i915 1.6.0 20230929 for 0000:00:02.0 on minor 0
> >> [Wed May  8 08:20:05 2024] ACPI: video: Video Device [PEGP] (multi-head: no  rom: yes  post: no)
> >> [Wed May  8 08:20:05 2024] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:00/LNXVIDEO:00/input/input4
> >> [Wed May  8 08:20:05 2024] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
> >> [Wed May  8 08:20:05 2024] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:01/input/input5
> >> [Wed May  8 08:20:05 2024] rtsx_pci 0000:08:00.0: enabling device (0000 -> 0002)
> >> [Wed May  8 08:20:05 2024] fbcon: i915drmfb (fb0) is primary device
> >> [Wed May  8 08:20:05 2024] ahci 0000:00:17.0: version 3.0
> >> [Wed May  8 08:20:05 2024] nvme 0000:06:00.0: platform quirk: setting simple suspend
> >> [Wed May  8 08:20:05 2024] nvme nvme0: pci function 0000:06:00.0
> >> [Wed May  8 08:20:05 2024] nvme nvme0: allocated 32 MiB host memory buffer.
> >> [Wed May  8 08:20:05 2024] nvme nvme0: 12/0/0 default/read/poll queues
> >> [Wed May  8 08:20:05 2024] ahci 0000:00:17.0: AHCI vers 0001.0301, 32 command slots, 6 Gbps, SATA mode
> >> [Wed May  8 08:20:05 2024] ahci 0000:00:17.0: 1/1 ports implemented (port mask 0x10)
> >> [Wed May  8 08:20:05 2024] ahci 0000:00:17.0: flags: 64bit ncq sntf pm clo only pio slum part ems deso sadm sds apst 
> >> [Wed May  8 08:20:05 2024] scsi host0: ahci
> >> [Wed May  8 08:20:05 2024] scsi host1: ahci
> >> [Wed May  8 08:20:05 2024] scsi host2: ahci
> >> [Wed May  8 08:20:05 2024] scsi host3: ahci
> >> [Wed May  8 08:20:05 2024]  nvme0n1: p1 p2 p3 p4 p5 p6 p7 p8
> >> [Wed May  8 08:20:05 2024] scsi host4: ahci
> >> [Wed May  8 08:20:05 2024] ata1: DUMMY
> >> [Wed May  8 08:20:05 2024] ata2: DUMMY
> >> [Wed May  8 08:20:05 2024] ata3: DUMMY
> >> [Wed May  8 08:20:05 2024] ata4: DUMMY
> >> [Wed May  8 08:20:05 2024] ata5: SATA max UDMA/133 abar m2048@0xc53a3000 port 0xc53a3300 irq 126 lpm-pol 0
> >> [Wed May  8 08:20:05 2024] xhci_hcd 0000:00:14.0: xHCI Host Controller
> >> [Wed May  8 08:20:05 2024] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
> >> [Wed May  8 08:20:05 2024] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x110 quirks 0x0000000000009810
> >> [Wed May  8 08:20:05 2024] xhci_hcd 0000:00:14.0: xHCI Host Controller
> >> [Wed May  8 08:20:05 2024] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 2
> >> [Wed May  8 08:20:05 2024] xhci_hcd 0000:00:14.0: Host supports USB 3.1 Enhanced SuperSpeed
> >> [Wed May  8 08:20:05 2024] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.09
> >> [Wed May  8 08:20:05 2024] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> >> [Wed May  8 08:20:05 2024] usb usb1: Product: xHCI Host Controller
> >> [Wed May  8 08:20:05 2024] usb usb1: Manufacturer: Linux 6.9.0-rc7+ xhci-hcd
> >> [Wed May  8 08:20:05 2024] usb usb1: SerialNumber: 0000:00:14.0
> >> [Wed May  8 08:20:05 2024] hub 1-0:1.0: USB hub found
> >> [Wed May  8 08:20:05 2024] hub 1-0:1.0: 16 ports detected
> >> [Wed May  8 08:20:05 2024] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.09
> >> [Wed May  8 08:20:05 2024] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> >> [Wed May  8 08:20:05 2024] usb usb2: Product: xHCI Host Controller
> >> [Wed May  8 08:20:05 2024] usb usb2: Manufacturer: Linux 6.9.0-rc7+ xhci-hcd
> >> [Wed May  8 08:20:05 2024] usb usb2: SerialNumber: 0000:00:14.0
> >> [Wed May  8 08:20:05 2024] hub 2-0:1.0: USB hub found
> >> [Wed May  8 08:20:05 2024] hub 2-0:1.0: 8 ports detected
> >> [Wed May  8 08:20:05 2024] usb: port power management may be unreliable
> >> [Wed May  8 08:20:05 2024] usbcore: registered new interface driver usb-storage
> >> [Wed May  8 08:20:05 2024] usbcore: registered new interface driver ums-realtek
> >> [Wed May  8 08:20:05 2024] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f03:PS2M] at 0x60,0x64 irq 1,12
> >> [Wed May  8 08:20:06 2024] tsc: Refined TSC clocksource calibration: 2592.000 MHz
> >> [Wed May  8 08:20:06 2024] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x255cb6cc5db, max_idle_ns: 440795203504 ns
> >> [Wed May  8 08:20:06 2024] clocksource: Switched to clocksource tsc
> >> [Wed May  8 08:20:06 2024] ata5: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
> >> [Wed May  8 08:20:06 2024] i8042: Detected active multiplexing controller, rev 1.1
> >> [Wed May  8 08:20:06 2024] serio: i8042 KBD port at 0x60,0x64 irq 1
> >> [Wed May  8 08:20:06 2024] serio: i8042 AUX0 port at 0x60,0x64 irq 12
> >> [Wed May  8 08:20:06 2024] serio: i8042 AUX1 port at 0x60,0x64 irq 12
> >> [Wed May  8 08:20:06 2024] serio: i8042 AUX2 port at 0x60,0x64 irq 12
> >> [Wed May  8 08:20:06 2024] serio: i8042 AUX3 port at 0x60,0x64 irq 12
> >> [Wed May  8 08:20:06 2024] mousedev: PS/2 mouse device common for all mice
> >> [Wed May  8 08:20:06 2024] rtc_cmos 00:04: RTC can wake from S4
> >> [Wed May  8 08:20:06 2024] rtc_cmos 00:04: registered as rtc0
> >> [Wed May  8 08:20:06 2024] rtc_cmos 00:04: setting system clock to 2024-05-08T07:20:06 UTC (1715152806)
> >> [Wed May  8 08:20:06 2024] rtc_cmos 00:04: alarms up to one month, y3k, 242 bytes nvram
> >> [Wed May  8 08:20:06 2024] i2c_dev: i2c /dev entries driver
> >> [Wed May  8 08:20:06 2024] intel_pstate: Intel P-state driver initializing
> >> [Wed May  8 08:20:06 2024] intel_pstate: HWP enabled
> >> [Wed May  8 08:20:06 2024] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input6
> >> [Wed May  8 08:20:06 2024] NET: Registered PF_PACKET protocol family
> >> [Wed May  8 08:20:06 2024] NET: Registered PF_KEY protocol family
> >> [Wed May  8 08:20:06 2024] Key type dns_resolver registered
> >> [Wed May  8 08:20:06 2024] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
> >> [Wed May  8 08:20:06 2024] microcode: Current revision: 0x000000fa
> >> [Wed May  8 08:20:06 2024] microcode: Updated early from: 0x000000c8
> >> [Wed May  8 08:20:06 2024] IPI shorthand broadcast: enabled
> >> [Wed May  8 08:20:06 2024] AVX2 version of gcm_enc/dec engaged.
> >> [Wed May  8 08:20:06 2024] AES CTR mode by8 optimization enabled
> >> [Wed May  8 08:20:06 2024] sched_clock: Marking stable (1377238124, 5708302)->(1414719497, -31773071)
> >> [Wed May  8 08:20:06 2024] Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
> >> [Wed May  8 08:20:06 2024] registered taskstats version 1
> >> [Wed May  8 08:20:06 2024] Loading compiled-in X.509 certificates
> >> [Wed May  8 08:20:06 2024] ata5.00: ATA-10: ST2000LM015-2E8174, 0001, max UDMA/133
> >> [Wed May  8 08:20:06 2024] ata5.00: 3907029168 sectors, multi 16: LBA48 NCQ (depth 32), AA
> >> [Wed May  8 08:20:06 2024] ata5.00: configured for UDMA/133
> >> [Wed May  8 08:20:06 2024] usb 1-1: new full-speed USB device number 2 using xhci_hcd
> >> [Wed May  8 08:20:06 2024] usb 1-1: New USB device found, idVendor=25a7, idProduct=fa61, bcdDevice= 6.88
> >> [Wed May  8 08:20:06 2024] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> >> [Wed May  8 08:20:06 2024] usb 1-1: Product: 2.4G Receiver
> >> [Wed May  8 08:20:06 2024] usb 1-1: Manufacturer: Compx
> >> [Wed May  8 08:20:06 2024] mmc0: cannot verify signal voltage switch
> >> [Wed May  8 08:20:06 2024] usb 1-8: new high-speed USB device number 3 using xhci_hcd
> >> [Wed May  8 08:20:06 2024] mmc0: new ultra high speed SDR104 SDHC card at address aaaa
> >> [Wed May  8 08:20:06 2024] mmcblk0: mmc0:aaaa SC32G 29.7 GiB
> >> [Wed May  8 08:20:06 2024]  mmcblk0: p1
> >> [Wed May  8 08:20:06 2024] usb 1-8: New USB device found, idVendor=04f2, idProduct=b685, bcdDevice=54.04
> >> [Wed May  8 08:20:06 2024] usb 1-8: New USB device strings: Mfr=2, Product=1, SerialNumber=0
> >> [Wed May  8 08:20:06 2024] usb 1-8: Product: Chicony USB2.0 Camera
> >> [Wed May  8 08:20:06 2024] usb 1-8: Manufacturer: Sonix Technology Co., Ltd.
> >> [Wed May  8 08:20:06 2024] usb 1-14: new full-speed USB device number 4 using xhci_hcd
> >> [Wed May  8 08:20:07 2024] usb 1-14: New USB device found, idVendor=8087, idProduct=0026, bcdDevice= 0.02
> >> [Wed May  8 08:20:07 2024] usb 1-14: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> >> [Wed May  8 08:20:07 2024] Console: switching to colour frame buffer device 240x67
> >> [Wed May  8 08:20:07 2024] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
> >> [Wed May  8 08:20:07 2024] scsi 4:0:0:0: Direct-Access     ATA      ST2000LM015-2E81 0001 PQ: 0 ANSI: 5
> >> [Wed May  8 08:20:07 2024] sd 4:0:0:0: Attached scsi generic sg0 type 0
> >> [Wed May  8 08:20:07 2024] sd 4:0:0:0: [sda] 3907029168 512-byte logical blocks: (2.00 TB/1.82 TiB)
> >> [Wed May  8 08:20:07 2024] sd 4:0:0:0: [sda] 4096-byte physical blocks
> >> [Wed May  8 08:20:07 2024] sd 4:0:0:0: [sda] Write Protect is off
> >> [Wed May  8 08:20:07 2024] sd 4:0:0:0: [sda] Mode Sense: 00 3a 00 00
> >> [Wed May  8 08:20:07 2024] sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> >> [Wed May  8 08:20:07 2024] sd 4:0:0:0: [sda] Preferred minimum I/O size 4096 bytes
> >> [Wed May  8 08:20:07 2024]  sda: sda1 sda2 sda3 sda4 sda5 sda6 sda7 sda8 sda9
> >> [Wed May  8 08:20:07 2024] sd 4:0:0:0: [sda] Attached SCSI disk
> >> [Wed May  8 08:20:07 2024] PM: Image not found (code -22)
> >> [Wed May  8 08:20:07 2024] clk: Disabling unused clocks
> >> [Wed May  8 08:20:07 2024] ALSA device list:
> >> [Wed May  8 08:20:07 2024]   No soundcards found.
> >> [Wed May  8 08:20:07 2024] EXT4-fs (nvme0n1p4): mounted filesystem b767471d-f668-40d4-a6e0-1b2a0a1725f0 ro with ordered data mode. Quota mode: disabled.
> >> [Wed May  8 08:20:07 2024] VFS: Mounted root (ext4 filesystem) readonly on device 259:4.
> >> [Wed May  8 08:20:07 2024] devtmpfs: mounted
> >> [Wed May  8 08:20:07 2024] Freeing unused kernel image (initmem) memory: 2060K
> >> [Wed May  8 08:20:07 2024] Write protecting the kernel read-only data: 20480k
> >> [Wed May  8 08:20:07 2024] Freeing unused kernel image (rodata/data gap) memory: 1688K
> >> [Wed May  8 08:20:07 2024] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> >> [Wed May  8 08:20:07 2024] Run /sbin/init as init process
> >> [Wed May  8 08:20:07 2024]   with arguments:
> >> [Wed May  8 08:20:07 2024]     /sbin/init
> >> [Wed May  8 08:20:07 2024]   with environment:
> >> [Wed May  8 08:20:07 2024]     HOME=/
> >> [Wed May  8 08:20:07 2024]     TERM=linux
> >> [Wed May  8 08:20:07 2024]     BOOT_IMAGE=/boot/vmlinuz-6.9.0-rc7+
> >> [Wed May  8 08:20:07 2024] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> >> [Wed May  8 08:20:07 2024] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
> >> [Wed May  8 08:20:07 2024] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
> >> [Wed May  8 08:20:07 2024] i2c i2c-6: Successfully instantiated SPD at 0x50
> >> [Wed May  8 08:20:07 2024] intel-lpss 0000:00:15.0: enabling device (0004 -> 0006)
> >> [Wed May  8 08:20:07 2024] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
> >> [Wed May  8 08:20:07 2024] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops 0xffffffff884a4120)
> >> [Wed May  8 08:20:07 2024] usbcore: registered new interface driver btusb
> >> [Wed May  8 08:20:07 2024] intel-lpss 0000:00:15.1: enabling device (0004 -> 0006)
> >> [Wed May  8 08:20:07 2024] MXM: GUID detected in BIOS
> >> [Wed May  8 08:20:07 2024] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI requires [Package] (20230628/nsarguments-61)
> >> [Wed May  8 08:20:07 2024] pci 0000:01:00.0: optimus capabilities: enabled, status dynamic power, hda bios codec supported
> >> [Wed May  8 08:20:07 2024] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.PEGP handle
> >> [Wed May  8 08:20:07 2024] nouveau: detected PR support, will not use DSM
> >> [Wed May  8 08:20:07 2024] input: Compx 2.4G Receiver as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:25A7:FA61.0001/input/input11
> >> [Wed May  8 08:20:07 2024] r8169 0000:08:00.1 eth0: RTL8411b, 80:fa:5b:84:b0:5f, XID 5c8, IRQ 143
> >> [Wed May  8 08:20:07 2024] r8169 0000:08:00.1 eth0: jumbo features [frames: 9194 bytes, tx checksumming: ko]
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: enabling device (0006 -> 0007)
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: NVIDIA TU117 (167000a1)
> >> [Wed May  8 08:20:07 2024] Bluetooth: hci0: Found device firmware: intel/ibt-19-0-4.sfi
> >> [Wed May  8 08:20:07 2024] Bluetooth: hci0: Boot Address: 0x24800
> >> [Wed May  8 08:20:07 2024] usb 1-8: Found UVC 1.00 device Chicony USB2.0 Camera (04f2:b685)
> >> [Wed May  8 08:20:07 2024] Bluetooth: hci0: Firmware Version: 249-27.23
> >> [Wed May  8 08:20:07 2024] Bluetooth: hci0: Firmware already loaded
> >> [Wed May  8 08:20:07 2024] Bluetooth: hci0: HCI LE Coded PHY feature bit is set, but its usage is not supported.
> >> [Wed May  8 08:20:07 2024] usbcore: registered new interface driver uvcvideo
> >> [Wed May  8 08:20:07 2024] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC293: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> >> [Wed May  8 08:20:07 2024] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> >> [Wed May  8 08:20:07 2024] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 (0x15/0x0/0x0/0x0/0x0)
> >> [Wed May  8 08:20:07 2024] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=0x0
> >> [Wed May  8 08:20:07 2024] snd_hda_codec_realtek hdaudioC0D0:    inputs:
> >> [Wed May  8 08:20:07 2024] snd_hda_codec_realtek hdaudioC0D0:      Front Mic=0x18
> >> [Wed May  8 08:20:07 2024] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=0x1a
> >> [Wed May  8 08:20:07 2024] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=0x12
> >> [Wed May  8 08:20:07 2024] hid-generic 0003:25A7:FA61.0001: input: USB HID v1.10 Keyboard [Compx 2.4G Receiver] on usb-0000:00:14.0-1/input0
> >> [Wed May  8 08:20:07 2024] input: Compx 2.4G Receiver Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:25A7:FA61.0002/input/input12
> >> [Wed May  8 08:20:07 2024] input: Compx 2.4G Receiver as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:25A7:FA61.0002/input/input13
> >> [Wed May  8 08:20:07 2024] input: Compx 2.4G Receiver Consumer Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:25A7:FA61.0002/input/input14
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: bios: version 90.17.42.00.36
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: pmu: firmware unavailable
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: fb: 4096 MiB GDDR6
> >> [Wed May  8 08:20:07 2024] input: HDA Intel PCH Front Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input17
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: sec2(acr): mbox 00000007 00000000
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: sec2(acr):AHESASC: boot failed: -5
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: acr: init failed, -5
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: init failed with -5
> >> [Wed May  8 08:20:07 2024] nouveau: DRM-master:00000000:00000080: init failed with -5
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: DRM-master: Device allocation failed: -5
> >> [Wed May  8 08:20:07 2024] nouveau 0000:01:00.0: probe with driver nouveau failed with error -5
> >> [Wed May  8 08:20:07 2024] input: Compx 2.4G Receiver System Control as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:25A7:FA61.0002/input/input15
> >> [Wed May  8 08:20:07 2024] input: HDA Intel PCH Front Headphone as /devices/pci0000:00/0000:00:1f.3/sound/card0/input18
> >> [Wed May  8 08:20:07 2024] hid-generic 0003:25A7:FA61.0002: input,hiddev96: USB HID v1.10 Mouse [Compx 2.4G Receiver] on usb-0000:00:14.0-1/input1
> >> [Wed May  8 08:20:07 2024] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input19
> >> [Wed May  8 08:20:07 2024] usbcore: registered new interface driver usbhid
> >> [Wed May  8 08:20:07 2024] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input20
> >> [Wed May  8 08:20:07 2024] usbhid: USB HID core driver
> >> [Wed May  8 08:20:07 2024] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input21
> >> [Wed May  8 08:20:09 2024] Adding 65535996k swap on /dev/sda5.  Priority:1 extents:1 across:65535996k 
> >> [Wed May  8 08:20:09 2024] EXT4-fs (nvme0n1p4): re-mounted b767471d-f668-40d4-a6e0-1b2a0a1725f0 ro. Quota mode: disabled.
> >> [Wed May  8 08:20:09 2024] EXT4-fs (nvme0n1p4): re-mounted b767471d-f668-40d4-a6e0-1b2a0a1725f0 r/w. Quota mode: disabled.
> >> [Wed May  8 08:20:10 2024] EXT4-fs (sda2): mounted filesystem 2c2b28d1-e737-40ab-9bd6-d0e29f0e6c1d r/w with ordered data mode. Quota mode: disabled.
> >> [Wed May  8 08:20:10 2024] ntfs3: Max link count 4000
> >> [Wed May  8 08:20:10 2024] EXT4-fs (sda6): mounted filesystem 0cc4bd15-983d-4064-8479-ffd5757fbb12 r/w with ordered data mode. Quota mode: disabled.
> >> [Wed May  8 08:20:10 2024] EXT4-fs (sda8): mounted filesystem cc547c90-65be-4279-a6bc-cd33137355ca r/w with ordered data mode. Quota mode: disabled.
> >> [Wed May  8 08:20:10 2024] EXT4-fs (sda9): mounted filesystem c277df28-daed-4d3a-9c12-9009d53ad75e r/w with ordered data mode. Quota mode: disabled.
> >> [Wed May  8 08:20:12 2024] Generic FE-GE Realtek PHY r8169-0-801:00: attached PHY driver (mii_bus:phy_addr=r8169-0-801:00, irq=MAC)
> >> [Wed May  8 08:20:12 2024] r8169 0000:08:00.1 eth0: No native access to PCI extended config space, falling back to CSI
> >> [Wed May  8 08:20:12 2024] r8169 0000:08:00.1 eth0: Link is Down
> >> [Wed May  8 08:20:13 2024] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> >> [Wed May  8 08:20:13 2024] Bluetooth: BNEP filters: protocol multicast
> >> [Wed May  8 08:20:13 2024] Bluetooth: BNEP socket layer initialized
> >> [Wed May  8 08:20:13 2024] Bluetooth: MGMT ver 1.22
> >> [Wed May  8 08:20:15 2024] r8169 0000:08:00.1 eth0: Link is Up - 1Gbps/Full - flow control rx/tx
> >> [Wed May  8 08:20:15 2024] CIFS: enabling forceuid mount option implicitly because uid= option is specified
> >> [Wed May  8 08:20:15 2024] CIFS: enabling forcegid mount option implicitly because gid= option is specified
> >> [Wed May  8 08:20:15 2024] CIFS: Attempting to mount //nas/Share
> >> [Wed May  8 08:20:19 2024] CIFS: enabling forceuid mount option implicitly because uid= option is specified
> >> [Wed May  8 08:20:19 2024] CIFS: enabling forcegid mount option implicitly because gid= option is specified
> >> [Wed May  8 08:20:19 2024] CIFS: Attempting to mount //nas/Media
> >> [Wed May  8 08:20:28 2024] lxqt-config-mon[1341]: segfault at 10 ip 00007f3b38649c44 sp 00007ffc616e5150 error 4 in libKF6Screen.so.6.0.4[7f3b3863c000+5b000] likely on CPU 0 (core 0, socket 0)
> >> [Wed May  8 08:20:28 2024] Code: 88 45 f4 48 8b 45 f8 48 8b 40 10 0f b6 55 f4 88 50 35 90 5d c3 90 55 48 89 e5 48 83 ec 10 48 89 7d f8 48 89 75 f0 48 8b 45 f0 <48> 8b 40 10 48 8d 50 28 48 8b 45 f8 48 89 d6 48 89 c7 e8 23 46 00
> >> [Wed May  8 08:20:29 2024] Bluetooth: RFCOMM TTY layer initialized
> >> [Wed May  8 08:20:29 2024] Bluetooth: RFCOMM socket layer initialized
> >> [Wed May  8 08:20:29 2024] Bluetooth: RFCOMM ver 1.11
> >> [Wed May  8 08:20:35 2024] EXT4-fs (mmcblk0p1): mounted filesystem e116f17a-9c0e-4aae-8716-3424adaf906a r/w with ordered data mode. Quota mode: disabled.
> > 
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
