Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FCA1FC9C1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 11:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9307D6E83E;
	Wed, 17 Jun 2020 09:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069E06E83E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 09:23:14 +0000 (UTC)
IronPort-SDR: cDoE4Z0Iywvqrqr6uAOUOLfJQgTFCiLJynYL8DJ+ueAZmKxoMv7DQS2Wkn1A5EEZf7SvvD/0dd
 ICmMaERq8vKg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 02:23:14 -0700
IronPort-SDR: W+NQHOGwmTKJIPMQhRndq1SXSZQFOPz65BYN99RuEmZnDjyqDLJdPIYnhURmgrE2ElIhhwOnw+
 +8AWELKAHmfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,522,1583222400"; d="scan'208";a="262500024"
Received: from shao2-debian.sh.intel.com (HELO localhost) ([10.239.13.3])
 by orsmga007.jf.intel.com with ESMTP; 17 Jun 2020 02:23:11 -0700
Date: Wed, 17 Jun 2020 17:22:52 +0800
From: Rong Chen <rong.a.chen@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/mgag200: Don't set <rammapen> in MISC
Message-ID: <20200617092252.GA5279@shao2-debian>
References: <20200616142630.20129-1-tzimmermann@suse.de>
 <CACvgo52NY98wQ4Pm3LozSmdewQf_ftX4cYZbx=t6=s9CNE27kA@mail.gmail.com>
 <ea09692a-5a8f-d315-3bce-d416e8a01c7a@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea09692a-5a8f-d315-3bce-d416e8a01c7a@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 17, 2020 at 08:28:02AM +0200, Thomas Zimmermann wrote:
> Hi Emil
> 
> Am 16.06.20 um 17:14 schrieb Emil Velikov:
> > Hi Thomas,
> > 
> > On Tue, 16 Jun 2020 at 15:26, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >>
> >> The original modesetting code set MISC to 0x2d, which is <hpgoddev>,
> >> <clksel> and <ioaddsel>
> >>
> >> With the conversion to atomic modesetting, <rammapen> accidentally
> >> got enabled as well. Revert this change and initialize MISC with a
> >> constant value of <hgoddev> and <ioaddsel>. The <clksel> bits are set
> >> in mga_crtc_set_plls(), sync flags are set in mgag200_set_mode_regs().
> >>
> > 
> > Let's keep the remove (restoring original functionality) and rename
> > (cosmetics) separate patches. The read has also disappeared, which
> > should be safe although might be better on it's own.
> 
> I'm waiting for Rong Chen's performance results on this patch. Moving
> the rename into a separate patch makes sense, but removing the read is
> part of restoring the original behavior. I think it should be in this
> patch. Maybe I can write a better commit message to highlight the change.
> 

Hi Thomas,

I tested the patch based on previous patch series, it seems doesn't take
effect, and commit 39fb72816c4ee brings a larger regression when
comparing to commit caac4dda44f37:

4606edf870927 drm/mgag200: Don't set <rammapen> in MISC                                              3 3 3
39fb72816c4ee drm/mgag200: Replace VRAM helpers with SHMEM helpers                                   3 22
caac4dda44f37 drm/mgag200: Convert to simple KMS helper                                              238 233 240 234 239
4b11c90431108 drm/mgag200: Use simple-display data structures                                        35 34 34 34
db22c903c9322 drm/mgag200: Remove out-commented suspend/resume helpers                               34 34
87d4880d2aeb5 drm/mgag200: Move register initialization into separate function                       35
0c51726f95396 drm/mgag200: Move hiprilvl setting into separate functions                             35
8078e8b182e73 drm/mgag200: Set primary plane's format in separate helper function                    35
19f7b409d95b7 drm/mgag200: Set pitch in a separate helper function                                   35 34
9b9a363828c60 drm/mgag200: Update mode registers after plane registers                               34
e44e907dd8f93 drm/mgag200: Split MISC register update into PLL selection, SYNC and I/O               34 34 34 34
bef2303526adb drm/mgag200: Move mode-setting code into separate helper function                      97 97
5cd8460e81e8f drm/mgag200: Clean up mga_crtc_do_set_base()                                           96
0671ca8c559ba drm/mgag200: Clean up mga_set_start_address()
e82c8969a2474 drm/mgag200: Remove HW cursor                                                          96

Best Regards,
Rong Chen
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
