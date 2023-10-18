Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E237CD9C4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 12:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CA410E0C5;
	Wed, 18 Oct 2023 10:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 392 seconds by postgrey-1.36 at gabe;
 Wed, 18 Oct 2023 10:55:37 UTC
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CCD10E088
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 10:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1697626140;
 bh=3xWcji3oXjlN4cFukeLMtXQkcjmbOBmNuowH8WPgpqg=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dSMsP/ETZci4Y90jENdqAUbUV4tg7l7t750Pe69hZMYUPqmlGGYZkb6yRIl8yDLFf
 /omnvBNpejjy8tnAf/mOpBbMrR0m2tpZeWAfIeIIRQdypgILcreVGx4IvLCdwQvtHi
 ZLDfUBUHEZFWV0Sla+UsS3dgFaDp0Zi9UHQoIcVWG8W1mpO4ksfZXApbK6uUIpJJCt
 ji5wtK6EjMbdd8GGudB8lG6dgOxPSl5YTC/nwHljwzatAAGxmIg931O54qvU7biaSQ
 2NZO2VolvUQmPCrtOlhRbYg15rfUsekBU39vQAMSXRUJLifgfmaFy0H70KXYAwXBsZ
 EZVZNNGZ9KphA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S9SJT6JZtz4xPX;
 Wed, 18 Oct 2023 21:48:57 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Thomas Zimmermann <tzimmermann@suse.de>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, arnd@arndb.de, deller@gmx.de,
 javierm@redhat.com
Subject: Re: [PATCH v5 0/5] ppc, fbdev: Clean up fbdev mmap helper
In-Reply-To: <de09143e-ab7f-4ccc-8a5a-50e0f48c1b40@suse.de>
References: <20230922080636.26762-1-tzimmermann@suse.de>
 <de09143e-ab7f-4ccc-8a5a-50e0f48c1b40@suse.de>
Date: Wed, 18 Oct 2023 21:48:54 +1100
Message-ID: <87a5sg6wa1.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:
> FYI, I intent to merge patches 1 and 2 of this patchset into 
> drm-misc-next. The updates for PowerPC can be merged through PPC trees 
> later. Let me know if this does not work for you.

Hi Thomas,

Sorry for the late reply, I was on leave.

Yeah that's fine.

cheers

> Am 22.09.23 um 10:04 schrieb Thomas Zimmermann:
>> Clean up and rename fb_pgprotect() to work without struct file. Then
>> refactor the implementation for PowerPC. This change has been discussed
>> at [1] in the context of refactoring fbdev's mmap code.
>> 
>> The first two patches update fbdev and replace fbdev's fb_pgprotect()
>> with pgprot_framebuffer() on all architectures. The new helper's stream-
>> lined interface enables more refactoring within fbdev's mmap
>> implementation.
>> 
>> Patches 3 to 5 adapt PowerPC's internal interfaces to provide
>> phys_mem_access_prot() that works without struct file. Neither the
>> architecture code or fbdev helpers need the parameter.
>> 
>> v5:
>> 	* improve commit descriptions (Javier)
>> 	* add missing tags (Geert)
>> v4:
>> 	* fix commit message (Christophe)
>> v3:
>> 	* rename fb_pgrotect() to pgprot_framebuffer() (Arnd)
>> v2:
>> 	* reorder patches to simplify merging (Michael)
>> 
>> [1] https://lore.kernel.org/linuxppc-dev/5501ba80-bdb0-6344-16b0-0466a950f82c@suse.com/
>> 
>> Thomas Zimmermann (5):
>>    fbdev: Avoid file argument in fb_pgprotect()
>>    fbdev: Replace fb_pgprotect() with pgprot_framebuffer()
>>    arch/powerpc: Remove trailing whitespaces
>>    arch/powerpc: Remove file parameter from phys_mem_access_prot code
>>    arch/powerpc: Call internal __phys_mem_access_prot() in fbdev code
>> 
>>   arch/ia64/include/asm/fb.h                | 15 +++++++--------
>>   arch/m68k/include/asm/fb.h                | 19 ++++++++++---------
>>   arch/mips/include/asm/fb.h                | 11 +++++------
>>   arch/powerpc/include/asm/book3s/pgtable.h | 10 ++++++++--
>>   arch/powerpc/include/asm/fb.h             | 13 +++++--------
>>   arch/powerpc/include/asm/machdep.h        | 13 ++++++-------
>>   arch/powerpc/include/asm/nohash/pgtable.h | 10 ++++++++--
>>   arch/powerpc/include/asm/pci.h            |  4 +---
>>   arch/powerpc/kernel/pci-common.c          |  3 +--
>>   arch/powerpc/mm/mem.c                     |  8 ++++----
>>   arch/sparc/include/asm/fb.h               | 15 +++++++++------
>>   arch/x86/include/asm/fb.h                 | 10 ++++++----
>>   arch/x86/video/fbdev.c                    | 15 ++++++++-------
>>   drivers/video/fbdev/core/fb_chrdev.c      |  3 ++-
>>   include/asm-generic/fb.h                  | 12 ++++++------
>>   15 files changed, 86 insertions(+), 75 deletions(-)
>> 
>> 
>> base-commit: f8d21cb17a99b75862196036bb4bb93ee9637b74
>
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
