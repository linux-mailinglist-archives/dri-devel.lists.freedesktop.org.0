Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4CC23C6B0
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0998F6E4FE;
	Wed,  5 Aug 2020 07:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6065A6E1A7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 11:15:54 +0000 (UTC)
Received: from fsav104.sakura.ne.jp (fsav104.sakura.ne.jp [27.133.134.231])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 074BFkur012924;
 Tue, 4 Aug 2020 20:15:46 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav104.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav104.sakura.ne.jp);
 Tue, 04 Aug 2020 20:15:46 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav104.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 074BFkWK012916
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 4 Aug 2020 20:15:46 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH] vt: defer kfree() of vc_screenbuf in vc_do_resize()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <1596034621-4714-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
Message-ID: <0c9d8003-ba3f-8f2d-7c5a-56c5ca7db750@i-love.sakura.ne.jp>
Date: Tue, 4 Aug 2020 20:15:43 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1596034621-4714-1-git-send-email-penguin-kernel@I-love.SAKURA.ne.jp>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: syzbot <syzbot+9116ecc1978ca3a12f43@syzkaller.appspotmail.com>,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do you think this approach is acceptable? Or, do we need to modify set_origin() ?

On 2020/07/29 23:57, Tetsuo Handa wrote:
> syzbot is reporting UAF bug in set_origin() from vc_do_resize() [1], for
> vc_do_resize() calls kfree(vc->vc_screenbuf) before calling set_origin().
> 
> Unfortunately, in set_origin(), vc->vc_sw->con_set_origin() might access
> vc->vc_pos when scroll is involved in order to manipulate cursor, but
> vc->vc_pos refers already released vc->vc_screenbuf until vc->vc_pos gets
> updated based on the result of vc->vc_sw->con_set_origin().
> 
> Preserving old buffer and tolerating outdated vc members until set_origin()
> completes would be easier than preventing vc->vc_sw->con_set_origin() from
> accessing outdated vc members.
> 
> [1] https://syzkaller.appspot.com/bug?id=6649da2081e2ebdc65c0642c214b27fe91099db3
> 
> Reported-by: syzbot <syzbot+9116ecc1978ca3a12f43@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> ---
>  drivers/tty/vt/vt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index 42d8c67..c9ee8e9 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -1196,7 +1196,7 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
>  	unsigned int old_rows, old_row_size, first_copied_row;
>  	unsigned int new_cols, new_rows, new_row_size, new_screen_size;
>  	unsigned int user;
> -	unsigned short *newscreen;
> +	unsigned short *oldscreen, *newscreen;
>  	struct uni_screen *new_uniscr = NULL;
>  
>  	WARN_CONSOLE_UNLOCKED();
> @@ -1294,10 +1294,11 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
>  	if (new_scr_end > new_origin)
>  		scr_memsetw((void *)new_origin, vc->vc_video_erase_char,
>  			    new_scr_end - new_origin);
> -	kfree(vc->vc_screenbuf);
> +	oldscreen = vc->vc_screenbuf;
>  	vc->vc_screenbuf = newscreen;
>  	vc->vc_screenbuf_size = new_screen_size;
>  	set_origin(vc);
> +	kfree(oldscreen);
>  
>  	/* do part of a reset_terminal() */
>  	vc->vc_top = 0;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
