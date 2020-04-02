Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C78BD19C7A4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 19:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64E36E12E;
	Thu,  2 Apr 2020 17:08:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA336EA85
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 17:08:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 5C6E3297E43
From: Robert Beckett <bob.beckett@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH v4.19.y, v4.14.y,
 v4.9.y] drm/etnaviv: Backport fix for mmu flushing
Date: Thu,  2 Apr 2020 18:07:55 +0100
Message-Id: <20200402170758.8315-1-bob.beckett@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Reply-To: bob.beckett@collabora.com
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit 4900dda90af2cb13bc1d4c12ce94b98acc8fe64e upstream

Due to async need_flush updating via other buffer mapping, checking
gpu->need_flush in 3 places within etnaviv_buffer_queue can cause GPU
hangs.

This occurs due to need_flush being false for the first 2 checks in that
function, so that the extra dword does not get accounted for, but by the
time we come to check for the third time, gpu->mmu->need_flish is true,
which outputs the flush instruction. This causes the prefetch during the
final link to be off by 1. This causes GPU hangs.

It causes the ring to contain patterns like this:

0x40000005, /* LINK (8) PREFETCH=0x5,OP=LINK */                                                      
0x70040010, /*   ADDRESS *0x70040010 */                                                              
0x40000002, /* LINK (8) PREFETCH=0x2,OP=LINK */                                                      
0x70040000, /*   ADDRESS *0x70040000 */                                                              
0x08010e04, /* LOAD_STATE (1) Base: 0x03810 Size: 1 Fixp: 0 */                                       
0x0000001f, /*   GL.FLUSH_MMU := FLUSH_FEMMU=1,FLUSH_UNK1=1,FLUSH_UNK2=1,FLUSH_PEMMU=1,FLUSH_UNK4=1 */
0x08010e03, /* LOAD_STATE (1) Base: 0x0380C Size: 1 Fixp: 0 */                                       
0x00000000, /*   GL.FLUSH_CACHE := DEPTH=0,COLOR=0,TEXTURE=0,PE2D=0,TEXTUREVS=0,SHADER_L1=0,SHADER_L2=0,UNK10=0,UNK11=0,DESCRIPTOR_UNK12=0,DESCRIPTOR_UNK13=0 */
0x08010e02, /* LOAD_STATE (1) Base: 0x03808 Size: 1 Fixp: 0 */                                       
0x00000701, /*   GL.SEMAPHORE_TOKEN := FROM=FE,TO=PE,UNK28=0x0 */                                    
0x48000000, /* STALL (9) OP=STALL */                                                                 
0x00000701, /*   TOKEN FROM=FE,TO=PE,UNK28=0x0 */                                                    
0x08010e00, /* LOAD_STATE (1) Base: 0x03800 Size: 1 Fixp: 0 */                                       
0x00000000, /*   GL.PIPE_SELECT := PIPE=PIPE_3D */                                                   
0x40000035, /* LINK (8) PREFETCH=0x35,OP=LINK */                                                     
0x70041000, /*   ADDRESS *0x70041000 */

Here we see a link with prefetch of 5 dwords starting with the 3rd
instruction. It only loads the 5 dwords up and including the final
LOAD_STATE. It needs to include the final LINK instruction.

This was seen on imx6q, and the fix is confirmed to stop the GPU hangs.

The commit referenced inadvertently fixed this issue by checking
gpu->mmu->need_flush once at the start of the function.
Given that this commit is independant, and useful for all version, it
seems sensible to backport it to the stable branches.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
