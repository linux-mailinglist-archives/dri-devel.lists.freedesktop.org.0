Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4271D78E8
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 14:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0236E1E9;
	Mon, 18 May 2020 12:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8B46E1E9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 12:47:11 +0000 (UTC)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 04ICktr9019310
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 18 May 2020 07:46:58 -0500
Message-ID: <9ea9bd468fbce85b666991cde4196b88c7929e1d.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 2/2] powerpc/configs: replace deprecated riva/nvidia
 with nouveau
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Emil Velikov <emil.l.velikov@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>
Date: Mon, 18 May 2020 22:46:54 +1000
In-Reply-To: <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com>
References: <20200517220524.4036334-1-emil.l.velikov@gmail.com>
 <20200517220524.4036334-2-emil.l.velikov@gmail.com>
 <87d071aedu.fsf@mpe.ellerman.id.au>
 <CACvgo53uWVmhwon4+Fn5=_4HPXSciqNrf1MSJjt1kA3G2wyECw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: linux-fbdev <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-05-18 at 12:19 +0100, Emil Velikov wrote:
> 
>  - attempted out-of-bound attempts to read the vbios

So on these things, the actual ROM doesn't contain what you want, but
the device-tree has a property "NVDA,BMP" that contains some kind of
mini-BIOS (around 2.4KB) which should contain the necessary tables the
driver is looking for.

I think nouveau has code to find these in nvkm/subdev/bios/shadowof.c,
so at least that should have been working, but maybe some
debugging/instrumentation would be useful there.

> Genuine concern or noise? Likely using the bios from open firmware,
> check any of the other options - see NvBios in [1]
>  - cannot figure out the timer input frequency
> No idea
>  - the TV1 EDID is empty
> Is there an actual TV connected to the device, check with another cable

Probaby not.

> Regardless of the patches, reporting [2] the above would be a nice move.
> 
> Thanks
> Emil
> [1] https://nouveau.freedesktop.org/wiki/KernelModuleParameters/
> [2] https://gitlab.freedesktop.org/xorg/driver/xf86-video-nouveau/-/issues

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
