Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC1619C7C1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 19:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90826E12A;
	Thu,  2 Apr 2020 17:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E68A6E12A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 17:17:45 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jK3TK-00033z-JL; Thu, 02 Apr 2020 19:17:42 +0200
Message-ID: <bed38c9d9d5ba71d26fce8a17cfbbe9c0e807300.camel@pengutronix.de>
Subject: Re: [PATCH v4.19.y, v4.14.y, v4.9.y] drm/etnaviv: Backport fix for
 mmu flushing
From: Lucas Stach <l.stach@pengutronix.de>
To: bob.beckett@collabora.com, Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie
 <airlied@linux.ie>
Date: Thu, 02 Apr 2020 19:17:40 +0200
In-Reply-To: <20200402170758.8315-1-bob.beckett@collabora.com>
References: <20200402170758.8315-1-bob.beckett@collabora.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, den 02.04.2020, 18:07 +0100 schrieb Robert Beckett:
> commit 4900dda90af2cb13bc1d4c12ce94b98acc8fe64e upstream
> 
> Due to async need_flush updating via other buffer mapping, checking
> gpu->need_flush in 3 places within etnaviv_buffer_queue can cause GPU
> hangs.
> 
> This occurs due to need_flush being false for the first 2 checks in that
> function, so that the extra dword does not get accounted for, but by the
> time we come to check for the third time, gpu->mmu->need_flish is true,
> which outputs the flush instruction. This causes the prefetch during the
> final link to be off by 1. This causes GPU hangs.

Yep, there should have been a READ_ONCE on this state. :/

> It causes the ring to contain patterns like this:
> 
> 0x40000005, /* LINK (8) PREFETCH=0x5,OP=LINK */                                                      
> 0x70040010, /*   ADDRESS *0x70040010 */                                                              
> 0x40000002, /* LINK (8) PREFETCH=0x2,OP=LINK */                                                      
> 0x70040000, /*   ADDRESS *0x70040000 */                                                              
> 0x08010e04, /* LOAD_STATE (1) Base: 0x03810 Size: 1 Fixp: 0 */                                       
> 0x0000001f, /*   GL.FLUSH_MMU := FLUSH_FEMMU=1,FLUSH_UNK1=1,FLUSH_UNK2=1,FLUSH_PEMMU=1,FLUSH_UNK4=1 */
> 0x08010e03, /* LOAD_STATE (1) Base: 0x0380C Size: 1 Fixp: 0 */                                       
> 0x00000000, /*   GL.FLUSH_CACHE := DEPTH=0,COLOR=0,TEXTURE=0,PE2D=0,TEXTUREVS=0,SHADER_L1=0,SHADER_L2=0,UNK10=0,UNK11=0,DESCRIPTOR_UNK12=0,DESCRIPTOR_UNK13=0 */
> 0x08010e02, /* LOAD_STATE (1) Base: 0x03808 Size: 1 Fixp: 0 */                                       
> 0x00000701, /*   GL.SEMAPHORE_TOKEN := FROM=FE,TO=PE,UNK28=0x0 */                                    
> 0x48000000, /* STALL (9) OP=STALL */                                                                 
> 0x00000701, /*   TOKEN FROM=FE,TO=PE,UNK28=0x0 */                                                    
> 0x08010e00, /* LOAD_STATE (1) Base: 0x03800 Size: 1 Fixp: 0 */                                       
> 0x00000000, /*   GL.PIPE_SELECT := PIPE=PIPE_3D */                                                   
> 0x40000035, /* LINK (8) PREFETCH=0x35,OP=LINK */                                                     
> 0x70041000, /*   ADDRESS *0x70041000 */
> 
> Here we see a link with prefetch of 5 dwords starting with the 3rd
> instruction. It only loads the 5 dwords up and including the final
> LOAD_STATE. It needs to include the final LINK instruction.
> 
> This was seen on imx6q, and the fix is confirmed to stop the GPU hangs.
> 
> The commit referenced inadvertently fixed this issue by checking
> gpu->mmu->need_flush once at the start of the function.
> Given that this commit is independant, and useful for all version, it
> seems sensible to backport it to the stable branches.

I agree. Without shared MMUs this doesn't really need to be sequence,
but better just to backport this change, which has seen quite some
testing, than creating yet another, slightly different, version of this
function in the stable branches.

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
