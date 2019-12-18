Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B12F124311
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 10:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A386E28B;
	Wed, 18 Dec 2019 09:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7AB6E296
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 09:27:02 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E15402003C;
 Wed, 18 Dec 2019 10:26:58 +0100 (CET)
Date: Wed, 18 Dec 2019 10:26:57 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: powernv build issue
Message-ID: <20191218092657.GA11943@ravnborg.org>
References: <20191210194758.24087-1-sam@ravnborg.org>
 <14d73a3d-d670-6338-b0e2-5054d1bf388d@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14d73a3d-d670-6338-b0e2-5054d1bf388d@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=7aj0TGIGEi1D0orOOQgA:9 a=CjuIK1q_8ugA:10
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David.

On Mon, Dec 16, 2019 at 07:03:17PM +0100, David Hildenbrand wrote:
> Hi,
> 
> the patch "drm/drm_panel: fix EXPORT of drm_panel_of_backlight" in
> linux-next breaks the powernv build:
> 
> desktop: ~/git/linux-ppc memtrace $ ./compile.sh
>   CALL    scripts/atomic/check-atomics.sh
>   CALL    scripts/checksyscalls.sh
>   CHK     include/generated/compile.h
>   GEN     .version
>   CHK     include/generated/compile.h
>   UPD     include/generated/compile.h
>   CC      init/version.o
>   AR      init/built-in.a
>   LD      vmlinux.o
>   MODPOST vmlinux.o
> WARNING: vmlinux.o(.text+0x2fc8): Section mismatch in reference from the
> variable start_here_common to the function .init.text:start_kernel()
> The function start_here_common() references
> the function __init start_kernel().
> This is often because start_here_common lacks a __init
> annotation or the annotation of start_kernel is wrong.
> 
>   MODINFO modules.builtin.modinfo
>   LD      .tmp_vmlinux1
> ppc64-linux-gnu-ld: drivers/gpu/drm/drm_panel.o: in function
> `drm_panel_of_backlight':
> (.text+0x434): undefined reference to `devm_of_find_backlight'
> make: *** [Makefile:1079: vmlinux] Fehler 1
> 
> Reverting it makes it compile again. (not exploring the root issue, I
> just need a powernv built and reverting that commit did the trick )
Thanks for the report.

Andy already provided a fix that is now applied to drm-misc-next - and
should show up in -next within a day.
Sorry for the troubles!

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
