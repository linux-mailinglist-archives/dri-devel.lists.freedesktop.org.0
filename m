Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CD0379FBB
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 08:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB5D86E9BE;
	Tue, 11 May 2021 06:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1918 seconds by postgrey-1.36 at gabe;
 Mon, 10 May 2021 22:33:46 UTC
Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CE46E944;
 Mon, 10 May 2021 22:33:46 +0000 (UTC)
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.94.2)
 (envelope-from <kilobyte@angband.pl>)
 id 1lgDtp-00EKjz-Lm; Mon, 10 May 2021 23:57:13 +0200
Date: Mon, 10 May 2021 23:57:13 +0200
From: Adam Borowski <kilobyte@angband.pl>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <YJmsOYzPIsQ04Zxb@angband.pl>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-Mailman-Approved-At: Tue, 11 May 2021 06:36:25 +0000
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, keyrings@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-sgx@vger.kernel.org, coresight@lists.linaro.org, rcu@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-integrity@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 12:26:12PM +0200, Mauro Carvalho Chehab wrote:
> There are several UTF-8 characters at the Kernel's documentation.
[...]
> Other UTF-8 characters were added along the time, but they're easily
> replaceable by ASCII chars.
> 
> As Linux developers are all around the globe, and not everybody has UTF-8
> as their default charset

I'm not aware of a distribution that still allows selecting a non-UTF-8
charset in a normal flow in their installer.  And if they haven't purged
support for ancient encodings, that support is thoroughly bitrotten.
Thus, I disagree that this is a legitimate concern.

What _could_ be a legitimate reason is that someone is on a _terminal_
that can't display a wide enough set of glyphs.  Such terminals are:
 • Linux console (because of vgacon limitations; patchsets to improve
   other cons haven't been mainlined)
 • some Windows terminals (putty, old Windows console) that can't borrow
   glyphs from other fonts like fontconfig can

For the former, it's whatever your distribution ships in
/usr/share/consolefonts/ or an equivalent, which is based on historic
ISO-8859 and VT100 traditions.

For the latter, the near-guaranteed character set is WGL4.


Thus, at least two of your choices seem to disagree with the above:
[dropped]
> 	0xd7   => 'x',		# MULTIPLICATION SIGN
[retained]
> 	- U+2b0d ('⬍'): UP DOWN BLACK ARROW

× is present in ISO-8859, V100, WGL4; I've found no font in
/usr/share/consolefonts/ on my Debian unstable box that lacks this
character.

⬍ is not found in any of the above.  You might want to at least
convert it to ↕ which is at least present in WGL4, and thus likely
to be supported in fonts heeding Windows/Mac/OpenType recommendations.
That still won't make it work on VT.


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀ .--[ Makefile ]
⣾⠁⢠⠒⠀⣿⡁ # beware of races
⢿⡄⠘⠷⠚⠋⠀ all: pillage burn
⠈⠳⣄⠀⠀⠀⠀ `----
