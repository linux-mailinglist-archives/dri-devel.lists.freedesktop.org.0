Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7900196850
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 19:13:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A006E141;
	Sat, 28 Mar 2020 18:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316ED6E141
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 18:13:05 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CF34D80609;
 Sat, 28 Mar 2020 19:13:00 +0100 (CET)
Date: Sat, 28 Mar 2020 19:12:59 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Qiujun Huang <hqjagain@gmail.com>
Subject: Re: [PATCH] fbcon: fix null-ptr-deref in fbcon_switch
Message-ID: <20200328181259.GA24335@ravnborg.org>
References: <20200328151511.22932-1-hqjagain@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328151511.22932-1-hqjagain@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=hSkVLCK3AAAA:8
 a=pGLkceISAAAA:8 a=UqxoRI4XFovwuTuz1dAA:9 a=CjuIK1q_8ugA:10
 a=cQPPKAXgyycSBL8etih5:22
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
Cc: daniel.thompson@linaro.org, b.zolnierkie@samsung.com,
 daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ghalat@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Qiujun

Thanks for looking into the sysbot bugs.

On Sat, Mar 28, 2020 at 11:15:10PM +0800, Qiujun Huang wrote:
> Add check for vc_cons[logo_shown].d, as it can be released by
> vt_ioctl(VT_DISALLOCATE).
> 
> Reported-by: syzbot+732528bae351682f1f27@syzkaller.appspotmail.com
> Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> ---
>  drivers/video/fbdev/core/fbcon.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index bb6ae995c2e5..7ee0f7b55829 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2254,7 +2254,7 @@ static int fbcon_switch(struct vc_data *vc)
>  		fbcon_update_softback(vc);
>  	}
>  
> -	if (logo_shown >= 0) {
> +	if (logo_shown >= 0 && vc_cons_allocated(logo_shown)) {
>  		struct vc_data *conp2 = vc_cons[logo_shown].d;
>  
>  		if (conp2->vc_top == logo_lines
> @@ -2852,7 +2852,7 @@ static void fbcon_scrolldelta(struct vc_data *vc, int lines)
>  			return;
>  		if (vc->vc_mode != KD_TEXT || !lines)
>  			return;
> -		if (logo_shown >= 0) {
> +		if (logo_shown >= 0 && vc_cons_allocated(logo_shown)) {
>  			struct vc_data *conp2 = vc_cons[logo_shown].d;
>  
>  			if (conp2->vc_top == logo_lines

I am not familiar with this code.

But it looks like you try to avoid the sympton
which is that logo_shown has a wrong value after a
vc is deallocated, and do not fix the root cause.

We have:

vt_ioctl(VT_DISALLOCATE)
 |
 +- vc_deallocate()
     |
     +- visual_deinit()
         |
	 +- vc->vc_sw->con_deinit(vc)
	     |
	     +- fbcon_deinit()

Would it be better to update logo_shown
in fbcon_deinit()?
Then we will not try to do anything with
the logo in fbcon_switch().

fbcon_deinit() is called with console locked
so there should not be any races.

I did not stare long enough on the code to come up with a patch,
but this may be a better way to fix it.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
