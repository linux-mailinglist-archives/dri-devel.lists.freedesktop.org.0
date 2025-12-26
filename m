Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B8ECDF120
	for <lists+dri-devel@lfdr.de>; Fri, 26 Dec 2025 23:08:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1514A11340E;
	Fri, 26 Dec 2025 22:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1545212B818
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Dec 2025 12:21:14 +0000 (UTC)
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
 by vmicros1.altlinux.org (Postfix) with ESMTP id E0FF172C8CC;
 Fri, 26 Dec 2025 15:21:12 +0300 (MSK)
Received: from pony.office.basealt.ru (unknown [193.43.10.9])
 by imap.altlinux.org (Postfix) with ESMTPSA id CC2F636D00D1;
 Fri, 26 Dec 2025 15:21:12 +0300 (MSK)
Received: by pony.office.basealt.ru (Postfix, from userid 500)
 id A1B95360D63C; Fri, 26 Dec 2025 15:21:12 +0300 (MSK)
Date: Fri, 26 Dec 2025 15:21:12 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: Junjie Cao <junjie.cao@intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peilin Ye <yepeilin.cs@gmail.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Shigeru Yoshida <syoshida@redhat.com>, 
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zsolt Kajtar <soci@c64.rulez.org>, 
 Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [PATCH v2] fbdev: bitblit: bound-check glyph index in bit_putcs*
Message-ID: <aU58SeZZPxScVPad@altlinux.org>
References: <20251020134701.84082-1-junjie.cao@intel.com>
 <aU23brU4lZqIkw4Z@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aU23brU4lZqIkw4Z@altlinux.org>
X-Mailman-Approved-At: Fri, 26 Dec 2025 22:08:31 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear linux-fbdev, stable,

On Fri, Dec 26, 2025 at 01:29:13AM +0300, Vitaly Chikunov wrote:
> 
> On Mon, Oct 20, 2025 at 09:47:01PM +0800, Junjie Cao wrote:
> > bit_putcs_aligned()/unaligned() derived the glyph pointer from the
> > character value masked by 0xff/0x1ff, which may exceed the actual font's
> > glyph count and read past the end of the built-in font array.
> > Clamp the index to the actual glyph count before computing the address.
> > 
> > This fixes a global out-of-bounds read reported by syzbot.
> > 
> > Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
> > Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
> > Signed-off-by: Junjie Cao <junjie.cao@intel.com>
> 
> This commit is applied to v5.10.247 and causes a regression: when
> switching VT with ctrl-alt-f2 the screen is blank or completely filled
> with angle characters, then new text is not appearing (or not visible).
> 
> This commit is found with git bisect from v5.10.246 to v5.10.247:
> 
>   0998a6cb232674408a03e8561dc15aa266b2f53b is the first bad commit
>   commit 0998a6cb232674408a03e8561dc15aa266b2f53b
>   Author:     Junjie Cao <junjie.cao@intel.com>
>   AuthorDate: 2025-10-20 21:47:01 +0800
>   Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>   CommitDate: 2025-12-07 06:08:07 +0900
> 
>       fbdev: bitblit: bound-check glyph index in bit_putcs*
> 
>       commit 18c4ef4e765a798b47980555ed665d78b71aeadf upstream.
> 
>       bit_putcs_aligned()/unaligned() derived the glyph pointer from the
>       character value masked by 0xff/0x1ff, which may exceed the actual font's
>       glyph count and read past the end of the built-in font array.
>       Clamp the index to the actual glyph count before computing the address.
> 
>       This fixes a global out-of-bounds read reported by syzbot.
> 
>       Reported-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>       Closes: https://syzkaller.appspot.com/bug?extid=793cf822d213be1a74f2
>       Tested-by: syzbot+793cf822d213be1a74f2@syzkaller.appspotmail.com
>       Signed-off-by: Junjie Cao <junjie.cao@intel.com>
>       Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>       Signed-off-by: Helge Deller <deller@gmx.de>
>       Cc: stable@vger.kernel.org
>       Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
>    drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
>    1 file changed, 12 insertions(+), 4 deletions(-)
> 
> The minimal reproducer in cli, after kernel is booted:
> 
>   date >/dev/tty2; chvt 2
> 
> and the date does not appear.
> 
> Thanks,
> 
> #regzbot introduced: 0998a6cb232674408a03e8561dc15aa266b2f53b
> 
> > ---
> > v1: https://lore.kernel.org/linux-fbdev/5d237d1a-a528-4205-a4d8-71709134f1e1@suse.de/
> > v1 -> v2:
> >  - Fix indentation and add blank line after declarations with the .pl helper
> >  - No functional changes
> > 
> >  drivers/video/fbdev/core/bitblit.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
> > index 9d2e59796c3e..085ffb44c51a 100644
> > --- a/drivers/video/fbdev/core/bitblit.c
> > +++ b/drivers/video/fbdev/core/bitblit.c
> > @@ -79,12 +79,16 @@ static inline void bit_putcs_aligned(struct vc_data *vc, struct fb_info *info,
> >  				     struct fb_image *image, u8 *buf, u8 *dst)
> >  {
> >  	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
> > +	unsigned int charcnt = vc->vc_font.charcount;

Perhaps, vc->vc_font.charcount (which is relied upon in the following
comparison) is not always set correctly in v5.10.247. At least two
commits that set vc_font.charcount are missing from v5.10.247:

  a1ac250a82a5 ("fbcon: Avoid using FNTCHARCNT() and hard-coded built-in font charcount")
  a5a923038d70 ("fbdev: fbcon: Properly revert changes when vc_resize() failed")

Thanks,


> >  	u32 idx = vc->vc_font.width >> 3;
> >  	u8 *src;
> >  
> >  	while (cnt--) {
> > -		src = vc->vc_font.data + (scr_readw(s++)&
> > -					  charmask)*cellsize;
> > +		u16 ch = scr_readw(s++) & charmask;
> > +
> > +		if (ch >= charcnt)
> > +			ch = 0;
> > +		src = vc->vc_font.data + (unsigned int)ch * cellsize;
> >  
> >  		if (attr) {
> >  			update_attr(buf, src, attr, vc);
> > @@ -112,14 +116,18 @@ static inline void bit_putcs_unaligned(struct vc_data *vc,
> >  				       u8 *dst)
> >  {
> >  	u16 charmask = vc->vc_hi_font_mask ? 0x1ff : 0xff;
> > +	unsigned int charcnt = vc->vc_font.charcount;
> >  	u32 shift_low = 0, mod = vc->vc_font.width % 8;
> >  	u32 shift_high = 8;
> >  	u32 idx = vc->vc_font.width >> 3;
> >  	u8 *src;
> >  
> >  	while (cnt--) {
> > -		src = vc->vc_font.data + (scr_readw(s++)&
> > -					  charmask)*cellsize;
> > +		u16 ch = scr_readw(s++) & charmask;
> > +
> > +		if (ch >= charcnt)
> > +			ch = 0;
> > +		src = vc->vc_font.data + (unsigned int)ch * cellsize;
> >  
> >  		if (attr) {
> >  			update_attr(buf, src, attr, vc);
> > -- 
> > 2.48.1
> > 
