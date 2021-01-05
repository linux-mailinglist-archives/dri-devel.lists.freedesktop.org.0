Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E532EA8BF
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 11:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BE66E0E5;
	Tue,  5 Jan 2021 10:31:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4526E0DA
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 10:31:44 +0000 (UTC)
Received: from zn.tnic (p200300ec2f103700ba0c0ccd6fae6c32.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f10:3700:ba0c:ccd:6fae:6c32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id ED6731EC0324;
 Tue,  5 Jan 2021 11:31:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1609842700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=sTM0a3gEBd9UBpN3NNLvOkGXM0hcfH+4usRLsLqyqyM=;
 b=MRHLRj5lNSQg/AdRDJNEQcbBTvBlOKms0rqAuuP8RHRxeuWkXFfjjfQ+ykXen4SsuKEa0W
 r2NL6r3fNrJN+UhinUpgKuYYlRPhMEKpDygWlIO2EAKtrb6en/fS6odZ4BBgyyN7ksB0PZ
 Hx0JHx9IGu2fbnZxGtOvZUBhMQIeDqs=
Date: Tue, 5 Jan 2021 11:31:38 +0100
From: Borislav Petkov <bp@alien8.de>
To: Huang Rui <ray.huang@amd.com>
Subject: Re: 5.11-rc1 TTM list corruption
Message-ID: <20210105103138.GB28649@zn.tnic>
References: <20201231104020.GA4504@zn.tnic>
 <e3bfa0a4-5d0a-bd68-6cc8-73db1d29f22c@amd.com>
 <20210104105802.GD32151@zn.tnic> <20210105041213.GA544780@hr-amd>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210105041213.GA544780@hr-amd>
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
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 05, 2021 at 12:12:13PM +0800, Huang Rui wrote:
> I am reproducing this issue as well, are you using a Raven board?

I have no clue what Raven is. The workstation I triggered it once on, has:

[    7.563968] [drm] radeon kernel modesetting enabled.
[    7.581417] [drm] initializing kernel modesetting (CAICOS 0x1002:0x6779 0x174B:0xE164 0x00).
[    7.609217] [drm] Detected VRAM RAM=2048M, BAR=256M
[    7.614031] [drm] RAM width 64bits DDR
[    7.639665] [drm] radeon: 2048M of VRAM memory ready
[    7.644557] [drm] radeon: 1024M of GTT memory ready.
[    7.649451] [drm] Loading CAICOS Microcode
[    7.653548] [drm] Internal thermal controller without fan control
[    7.661221] [drm] radeon: dpm initialized
[    7.665227] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    7.671821] [drm] enabling PCIE gen 2 link speeds, disable with radeon.pcie_gen2=0
[    7.703858] [drm] PCIE GART of 1024M enabled (table at 0x0000000000162000).
[    7.749689] [drm] radeon: irq initialized.
[    7.769826] [drm] ring test on 0 succeeded in 1 usecs
[    7.774797] [drm] ring test on 3 succeeded in 3 usecs
[    7.955500] [drm] ring test on 5 succeeded in 1 usecs
[    7.960468] [drm] UVD initialized successfully.
[    7.965047] [drm] ib test on ring 0 succeeded in 0 usecs
[    7.970316] [drm] ib test on ring 3 succeeded in 0 usecs
[    8.626877] [drm] ib test on ring 5 succeeded
[    8.631376] [drm] Radeon Display Connectors
[    8.635496] [drm] Connector 0:
[    8.638503] [drm]   HDMI-A-1
[    8.641339] [drm]   HPD2
[    8.643835] [drm]   DDC: 0x6440 0x6440 0x6444 0x6444 0x6448 0x6448 0x644c 0x644c
[    8.651102] [drm]   Encoders:
[    8.654022] [drm]     DFP1: INTERNAL_UNIPHY1
[    8.658224] [drm] Connector 1:
[    8.661232] [drm]   DVI-D-1
[    8.663982] [drm]   HPD4
[    8.666479] [drm]   DDC: 0x6460 0x6460 0x6464 0x6464 0x6468 0x6468 0x646c 0x646c
[    8.673745] [drm]   Encoders:
[    8.676665] [drm]     DFP2: INTERNAL_UNIPHY
[    8.680782] [drm] Connector 2:
[    8.683789] [drm]   VGA-1
[    8.686369] [drm]   DDC: 0x6430 0x6430 0x6434 0x6434 0x6438 0x6438 0x643c 0x643c
[    8.693636] [drm]   Encoders:
[    8.696555] [drm]     CRT1: INTERNAL_KLDSCP_DAC1
[    8.788923] [drm] fb mappable at 0xE0363000
[    8.793036] [drm] vram apper at 0xE0000000
[    8.797064] [drm] size 9216000
[    8.800071] [drm] fb depth is 24
[    8.803249] [drm]    pitch is 7680
[    8.807106] fbcon: radeondrmfb (fb0) is primary device
[    8.918927] radeon 0000:1d:00.0: [drm] fb0: radeondrmfb frame buffer device
[    8.938461] [drm] Initialized radeon 2.50.0 20080528 for 0000:1d:00.0 on minor 0

HTH.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
