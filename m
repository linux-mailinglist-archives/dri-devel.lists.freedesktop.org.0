Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE6F58AA3C
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 13:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 236D8B5149;
	Fri,  5 Aug 2022 11:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1209 seconds by postgrey-1.36 at gabe;
 Fri, 05 Aug 2022 11:33:48 UTC
Received: from tartarus.angband.pl (tartarus.angband.pl [51.83.246.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB45B4CAF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 11:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=angband.pl; 
 s=tartarus;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uOs/wh40/Q7gzN7z904/X5Gel6unlqxqDhMhBCgslgY=; b=XIH/GfioooVBV2WgCkvSRBc4Al
 +zgvZiEGd3lpfH/2YYtDcR8+C3I7TaqQ+2MHBRy/M7a7JmGkBBWIp/T0kBXrGWDXN2mo2hNOSWJP8
 mw4J+iy1hDkg4Hm5c8yWjo8RT1UuLPRW0YaRAhgbWCcjg8/Ildpcv1RMOIE+eP8BKUPU=;
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.94.2)
 (envelope-from <kilobyte@angband.pl>)
 id 1oJvGV-007b55-KM; Fri, 05 Aug 2022 13:13:15 +0200
Date: Fri, 5 Aug 2022 13:13:15 +0200
From: Adam Borowski <kilobyte@angband.pl>
To: Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] tty: vt: selection: Add check for valid tiocl_selection
 values
Message-ID: <Yuz7S18rHNbHCHly@angband.pl>
References: <000000000000bbdd0405d120c155@google.com>
 <20220729065139.6529-1-khalid.masum.92@gmail.com>
 <eb4a26aa-da30-ceee-7d27-c1e902dd4218@gmx.de>
 <YuV9PybMPgc83Jis@p100>
 <1eb62346-304b-54d5-8a62-8a35888d51bd@kernel.org>
 <35e860bb-c76c-ca5f-3f48-2bf6cb798689@gmx.de>
 <0fbc2150-b4aa-f2cb-5084-3a9f69b3455d@gmx.de>
 <2d4e82f9-e370-bb01-8656-fe0376c22a77@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d4e82f9-e370-bb01-8656-fe0376c22a77@kernel.org>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
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
Cc: linux-fbdev@vger.kernel.org, Khalid Masum <khalid.masum.92@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot <syzbot+14b0e8f3fd1612e35350@syzkaller.appspotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 04, 2022 at 11:22:26AM +0200, Jiri Slaby wrote:
> On 04. 08. 22, 10:44, Helge Deller wrote:
> > On 8/4/22 09:15, Helge Deller wrote:
> > > On 8/4/22 07:47, Jiri Slaby wrote:
> > > > On 30. 07. 22, 20:49, Helge Deller wrote:
> > > > > The line and column numbers for the selection need to start at 1.
> > > > > Add the checks to prevent invalid input.

> > > > > --- a/drivers/tty/vt/selection.c
> > > > > +++ b/drivers/tty/vt/selection.c
> > > > > @@ -326,6 +326,9 @@ static int vc_selection(struct vc_data *vc, struct tiocl_selection *v,
> > > > > +    if (!v->xs || !v->ys || !v->xe || !v->ye)
> > > > > +        return -EINVAL;
> > > > 
> > > > Hmm, I'm not sure about this. It potentially breaks userspace (by
> > > > returning EINVAL now).

> We can still do a trial and revert it if something breaks... It's just that
> _noone_ knows with all this undocumented stuff ;).
> 
> But in fact, 0 currently means full row/column. Isn't it on purpose?
> 
> Today, we are out of luck, codesearch.debian.net gives no clue about users:
> https://codesearch.debian.net/search?q=%5CbTIOCL_SETSEL%5Cb&literal=0

That's because the macro is undocumented.

"man ioctl_console" says:
       TIOCLINUX, subcode=2
              Set selection.  argp points to a [...]

thus everyone writes it as a number.

You'd need to grep for TIOCLINUX; there's not that many references to
check...


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀
⣾⠁⢠⠒⠀⣿⡁ Say what you want about Adolf, at least he was the man who
⢿⡄⠘⠷⠚⠋⠀ killed Hitler.  Your turn, Vlad!
⠈⠳⣄⠀⠀⠀⠀
