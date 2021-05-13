Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A266D37F073
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 02:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDC26E5AB;
	Thu, 13 May 2021 00:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::4])
 by gabe.freedesktop.org (Postfix) with ESMTP id 494BD6E5AB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 00:37:15 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 7E0FB92009D; Thu, 13 May 2021 02:37:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 79B8D92009B;
 Thu, 13 May 2021 02:37:13 +0200 (CEST)
Date: Thu, 13 May 2021 02:37:13 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 0/3] VT_RESIZEX fixes
Message-ID: <alpine.DEB.2.21.2105090548170.2587@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-fbdev@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Hostettler <textshell@uchuujin.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

 I got to the bottom of the issue with VT_RESIZEX recently discussed and 
came up with this small patch series, fixing an additional issue that I 
originally thought might be broken VGA hardware emulation with my laptop, 
which however turned out to be intertwined with the original problem and 
also a regression introduced somewhat later.  This had to become 1/3 then 
and to make backporting feasible I had to put a revert of the offending 
change from last Sep next, followed by a proper fix for the framebuffer 
issue the Sep change tried to address.

 See individual change descriptions for details.

 These have been verified with true VGA hardware (a Trident TVGA8900 ISA 
video adapter) using various combinations of `svgatextmode' and `setfont' 
command invocations to change both the VT size and the font size, and also 
switching between the text console and X11, both by starting/stopping the 
X server and by switching between VTs.  All this to ensure bringing the 
behaviour of VGA text console back to correct operation as it used to be 
with Linux 2.6.18.

 A minor glitch observed was that when I called `svgatextmode' while 
running X11 the screen became garbled and upon a subsequent VT switch to a 
text console the machine locked up hard right away.  This might require 
further attention, but is not itself a problem with this patch series or a 
regression.

 Please apply then.

  Maciej
