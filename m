Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682DF3C206E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 10:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A656E9D4;
	Fri,  9 Jul 2021 08:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC90C6E9D4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 08:04:59 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a13so10914941wrf.10
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 01:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=tetdKfZF5XRuC6ZbwhnzIsHPPvdr4CkwxV8n+sADcA0=;
 b=HL+k20xIFB2FGDn3DXNcXfPoqHxiDuvKAka72O02tISHQc3ZuD2J8TfI+Llag9MRXS
 9uAWd/UoXF1JKOj5nlTvkD8xVFKcHCHNdF0rz5mM3gFX/I3MTEPTSWMUC8pqrp+a/goY
 lPcHf352zvQ97R4YW6MNJxaG1fULnhQjoi51I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=tetdKfZF5XRuC6ZbwhnzIsHPPvdr4CkwxV8n+sADcA0=;
 b=Xw7ZTVBaLAlLvSVU5FqL82W7FWhgkaTiE77Va+5S0fAqTSfJjSj6FkNTXAeYGMxxON
 9YXLzd5RgrT8CIP7ml1j0x/8GLd3URQMzMP90Aj+dwdpJEWDigtCW6Q9t2SgYZEa3vYc
 H6j6MXGvPOaGeTIXId1uMYgDfufnntgpDXOhfGmaQLgJdJMtz2VKanz2k7pPO3IEaQfQ
 zyX3vzUMF3518+Wr8utXEndCTFDXfoeeOQILYls+AGERFXzOgh4GZAI/BgyTeYzcmaTA
 1dILrtRdPFC/EhjGmnXqO6LrdMZqD0PzkT0zJzCKTnHMU/WDaLCwALmZzksQG/IBfzns
 rGXA==
X-Gm-Message-State: AOAM531cfm7P0SImdBECmwsDds0ZOcJ+ObeDjg/lwqi8Xk5Ste2YWPfc
 b9Nh58pj86r30+svCeFtBvw/4w==
X-Google-Smtp-Source: ABdhPJxotkjLzHhnIZMq2hLTx/Te8t71XUY0LmmeGL/wqFNI6s4vmsuIJPc233G5wuFPXHl69TV2zQ==
X-Received: by 2002:adf:9084:: with SMTP id i4mr39879233wri.23.1625817898165; 
 Fri, 09 Jul 2021 01:04:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v1sm4802775wre.20.2021.07.09.01.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 01:04:57 -0700 (PDT)
Date: Fri, 9 Jul 2021 10:04:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH] fbcon: garbage collect fbdev scrolling acceleration
Message-ID: <YOgDJ3rgjFDn7ic+@phenom.ffwll.local>
Mail-Followup-To: Hamza Mahfooz <someguy@effective-light.com>,
 linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 Jing Xiangfeng <jingxiangfeng@huawei.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20210709010055.86663-1-someguy@effective-light.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709010055.86663-1-someguy@effective-light.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jing Xiangfeng <jingxiangfeng@huawei.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>, Peilin Ye <yepeilin.cs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 08, 2021 at 09:00:38PM -0400, Hamza Mahfooz wrote:
> As per commit 39aead8373b3 ("fbcon: Disable accelerated scrolling"), we can

That commit is only in 5.11, so not yet even in an LTS. We should wait at
least that long. Also there's some objections from Geert.
-Daniel
> now remove all of the code that was made redundant by disabling scrolling
> acceleration.
> 
> Signed-off-by: Hamza Mahfooz <someguy@effective-light.com>
> ---
>  drivers/video/fbdev/core/bitblit.c      |  16 -
>  drivers/video/fbdev/core/fbcon.c        | 520 +-----------------------
>  drivers/video/fbdev/core/fbcon.h        |  59 ---
>  drivers/video/fbdev/core/fbcon_ccw.c    |  27 +-
>  drivers/video/fbdev/core/fbcon_cw.c     |  27 +-
>  drivers/video/fbdev/core/fbcon_rotate.h |   9 -
>  drivers/video/fbdev/core/fbcon_ud.c     |  36 +-
>  drivers/video/fbdev/core/tileblit.c     |  16 -
>  8 files changed, 38 insertions(+), 672 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
> index f98e8f298bc1..01fae2c96965 100644
> --- a/drivers/video/fbdev/core/bitblit.c
> +++ b/drivers/video/fbdev/core/bitblit.c
> @@ -43,21 +43,6 @@ static void update_attr(u8 *dst, u8 *src, int attribute,
>  	}
>  }
>  
> -static void bit_bmove(struct vc_data *vc, struct fb_info *info, int sy,
> -		      int sx, int dy, int dx, int height, int width)
> -{
> -	struct fb_copyarea area;
> -
> -	area.sx = sx * vc->vc_font.width;
> -	area.sy = sy * vc->vc_font.height;
> -	area.dx = dx * vc->vc_font.width;
> -	area.dy = dy * vc->vc_font.height;
> -	area.height = height * vc->vc_font.height;
> -	area.width = width * vc->vc_font.width;
> -
> -	info->fbops->fb_copyarea(info, &area);
> -}
> -
>  static void bit_clear(struct vc_data *vc, struct fb_info *info, int sy,
>  		      int sx, int height, int width)
>  {
> @@ -393,7 +378,6 @@ static int bit_update_start(struct fb_info *info)
>  
>  void fbcon_set_bitops(struct fbcon_ops *ops)
>  {
> -	ops->bmove = bit_bmove;
>  	ops->clear = bit_clear;
>  	ops->putcs = bit_putcs;
>  	ops->clear_margins = bit_clear_margins;
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 22bb3892f6bd..a2facd53e5a5 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -173,8 +173,6 @@ static void fbcon_putcs(struct vc_data *vc, const unsigned short *s,
>  			int count, int ypos, int xpos);
>  static void fbcon_clear_margins(struct vc_data *vc, int bottom_only);
>  static void fbcon_cursor(struct vc_data *vc, int mode);
> -static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
> -			int height, int width);
>  static int fbcon_switch(struct vc_data *vc);
>  static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch);
>  static void fbcon_set_palette(struct vc_data *vc, const unsigned char *table);
> @@ -182,16 +180,8 @@ static void fbcon_set_palette(struct vc_data *vc, const unsigned char *table);
>  /*
>   *  Internal routines
>   */
> -static __inline__ void ywrap_up(struct vc_data *vc, int count);
> -static __inline__ void ywrap_down(struct vc_data *vc, int count);
> -static __inline__ void ypan_up(struct vc_data *vc, int count);
> -static __inline__ void ypan_down(struct vc_data *vc, int count);
> -static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy, int sx,
> -			    int dy, int dx, int height, int width, u_int y_break);
>  static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
>  			   int unit);
> -static void fbcon_redraw_move(struct vc_data *vc, struct fbcon_display *p,
> -			      int line, int count, int dy);
>  static void fbcon_modechanged(struct fb_info *info);
>  static void fbcon_set_all_vcs(struct fb_info *info);
>  static void fbcon_start(void);
> @@ -1135,14 +1125,6 @@ static void fbcon_init(struct vc_data *vc, int init)
>  
>  	ops->graphics = 0;
>  
> -	/*
> -	 * No more hw acceleration for fbcon.
> -	 *
> -	 * FIXME: Garbage collect all the now dead code after sufficient time
> -	 * has passed.
> -	 */
> -	p->scrollmode = SCROLL_REDRAW;
> -
>  	/*
>  	 *  ++guenther: console.c:vc_allocate() relies on initializing
>  	 *  vc_{cols,rows}, but we must not set those if we are only
> @@ -1229,7 +1211,7 @@ static void fbcon_deinit(struct vc_data *vc)
>   *  This system is now divided into two levels because of complications
>   *  caused by hardware scrolling. Top level functions:
>   *
> - *	fbcon_bmove(), fbcon_clear(), fbcon_putc(), fbcon_clear_margins()
> + *	fbcon_clear(), fbcon_putc(), fbcon_clear_margins()
>   *
>   *  handles y values in range [0, scr_height-1] that correspond to real
>   *  screen positions. y_wrap shift means that first line of bitmap may be
> @@ -1409,224 +1391,6 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
>  	}
>  }
>  
> -static __inline__ void ywrap_up(struct vc_data *vc, int count)
> -{
> -	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
> -	struct fbcon_ops *ops = info->fbcon_par;
> -	struct fbcon_display *p = &fb_display[vc->vc_num];
> -	
> -	p->yscroll += count;
> -	if (p->yscroll >= p->vrows)	/* Deal with wrap */
> -		p->yscroll -= p->vrows;
> -	ops->var.xoffset = 0;
> -	ops->var.yoffset = p->yscroll * vc->vc_font.height;
> -	ops->var.vmode |= FB_VMODE_YWRAP;
> -	ops->update_start(info);
> -	scrollback_max += count;
> -	if (scrollback_max > scrollback_phys_max)
> -		scrollback_max = scrollback_phys_max;
> -	scrollback_current = 0;
> -}
> -
> -static __inline__ void ywrap_down(struct vc_data *vc, int count)
> -{
> -	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
> -	struct fbcon_ops *ops = info->fbcon_par;
> -	struct fbcon_display *p = &fb_display[vc->vc_num];
> -	
> -	p->yscroll -= count;
> -	if (p->yscroll < 0)	/* Deal with wrap */
> -		p->yscroll += p->vrows;
> -	ops->var.xoffset = 0;
> -	ops->var.yoffset = p->yscroll * vc->vc_font.height;
> -	ops->var.vmode |= FB_VMODE_YWRAP;
> -	ops->update_start(info);
> -	scrollback_max -= count;
> -	if (scrollback_max < 0)
> -		scrollback_max = 0;
> -	scrollback_current = 0;
> -}
> -
> -static __inline__ void ypan_up(struct vc_data *vc, int count)
> -{
> -	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
> -	struct fbcon_display *p = &fb_display[vc->vc_num];
> -	struct fbcon_ops *ops = info->fbcon_par;
> -
> -	p->yscroll += count;
> -	if (p->yscroll > p->vrows - vc->vc_rows) {
> -		ops->bmove(vc, info, p->vrows - vc->vc_rows,
> -			    0, 0, 0, vc->vc_rows, vc->vc_cols);
> -		p->yscroll -= p->vrows - vc->vc_rows;
> -	}
> -
> -	ops->var.xoffset = 0;
> -	ops->var.yoffset = p->yscroll * vc->vc_font.height;
> -	ops->var.vmode &= ~FB_VMODE_YWRAP;
> -	ops->update_start(info);
> -	fbcon_clear_margins(vc, 1);
> -	scrollback_max += count;
> -	if (scrollback_max > scrollback_phys_max)
> -		scrollback_max = scrollback_phys_max;
> -	scrollback_current = 0;
> -}
> -
> -static __inline__ void ypan_up_redraw(struct vc_data *vc, int t, int count)
> -{
> -	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
> -	struct fbcon_ops *ops = info->fbcon_par;
> -	struct fbcon_display *p = &fb_display[vc->vc_num];
> -
> -	p->yscroll += count;
> -
> -	if (p->yscroll > p->vrows - vc->vc_rows) {
> -		p->yscroll -= p->vrows - vc->vc_rows;
> -		fbcon_redraw_move(vc, p, t + count, vc->vc_rows - count, t);
> -	}
> -
> -	ops->var.xoffset = 0;
> -	ops->var.yoffset = p->yscroll * vc->vc_font.height;
> -	ops->var.vmode &= ~FB_VMODE_YWRAP;
> -	ops->update_start(info);
> -	fbcon_clear_margins(vc, 1);
> -	scrollback_max += count;
> -	if (scrollback_max > scrollback_phys_max)
> -		scrollback_max = scrollback_phys_max;
> -	scrollback_current = 0;
> -}
> -
> -static __inline__ void ypan_down(struct vc_data *vc, int count)
> -{
> -	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
> -	struct fbcon_display *p = &fb_display[vc->vc_num];
> -	struct fbcon_ops *ops = info->fbcon_par;
> -	
> -	p->yscroll -= count;
> -	if (p->yscroll < 0) {
> -		ops->bmove(vc, info, 0, 0, p->vrows - vc->vc_rows,
> -			    0, vc->vc_rows, vc->vc_cols);
> -		p->yscroll += p->vrows - vc->vc_rows;
> -	}
> -
> -	ops->var.xoffset = 0;
> -	ops->var.yoffset = p->yscroll * vc->vc_font.height;
> -	ops->var.vmode &= ~FB_VMODE_YWRAP;
> -	ops->update_start(info);
> -	fbcon_clear_margins(vc, 1);
> -	scrollback_max -= count;
> -	if (scrollback_max < 0)
> -		scrollback_max = 0;
> -	scrollback_current = 0;
> -}
> -
> -static __inline__ void ypan_down_redraw(struct vc_data *vc, int t, int count)
> -{
> -	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
> -	struct fbcon_ops *ops = info->fbcon_par;
> -	struct fbcon_display *p = &fb_display[vc->vc_num];
> -
> -	p->yscroll -= count;
> -
> -	if (p->yscroll < 0) {
> -		p->yscroll += p->vrows - vc->vc_rows;
> -		fbcon_redraw_move(vc, p, t, vc->vc_rows - count, t + count);
> -	}
> -
> -	ops->var.xoffset = 0;
> -	ops->var.yoffset = p->yscroll * vc->vc_font.height;
> -	ops->var.vmode &= ~FB_VMODE_YWRAP;
> -	ops->update_start(info);
> -	fbcon_clear_margins(vc, 1);
> -	scrollback_max -= count;
> -	if (scrollback_max < 0)
> -		scrollback_max = 0;
> -	scrollback_current = 0;
> -}
> -
> -static void fbcon_redraw_move(struct vc_data *vc, struct fbcon_display *p,
> -			      int line, int count, int dy)
> -{
> -	unsigned short *s = (unsigned short *)
> -		(vc->vc_origin + vc->vc_size_row * line);
> -
> -	while (count--) {
> -		unsigned short *start = s;
> -		unsigned short *le = advance_row(s, 1);
> -		unsigned short c;
> -		int x = 0;
> -		unsigned short attr = 1;
> -
> -		do {
> -			c = scr_readw(s);
> -			if (attr != (c & 0xff00)) {
> -				attr = c & 0xff00;
> -				if (s > start) {
> -					fbcon_putcs(vc, start, s - start,
> -						    dy, x);
> -					x += s - start;
> -					start = s;
> -				}
> -			}
> -			console_conditional_schedule();
> -			s++;
> -		} while (s < le);
> -		if (s > start)
> -			fbcon_putcs(vc, start, s - start, dy, x);
> -		console_conditional_schedule();
> -		dy++;
> -	}
> -}
> -
> -static void fbcon_redraw_blit(struct vc_data *vc, struct fb_info *info,
> -			struct fbcon_display *p, int line, int count, int ycount)
> -{
> -	int offset = ycount * vc->vc_cols;
> -	unsigned short *d = (unsigned short *)
> -	    (vc->vc_origin + vc->vc_size_row * line);
> -	unsigned short *s = d + offset;
> -	struct fbcon_ops *ops = info->fbcon_par;
> -
> -	while (count--) {
> -		unsigned short *start = s;
> -		unsigned short *le = advance_row(s, 1);
> -		unsigned short c;
> -		int x = 0;
> -
> -		do {
> -			c = scr_readw(s);
> -
> -			if (c == scr_readw(d)) {
> -				if (s > start) {
> -					ops->bmove(vc, info, line + ycount, x,
> -						   line, x, 1, s-start);
> -					x += s - start + 1;
> -					start = s + 1;
> -				} else {
> -					x++;
> -					start++;
> -				}
> -			}
> -
> -			scr_writew(c, d);
> -			console_conditional_schedule();
> -			s++;
> -			d++;
> -		} while (s < le);
> -		if (s > start)
> -			ops->bmove(vc, info, line + ycount, x, line, x, 1,
> -				   s-start);
> -		console_conditional_schedule();
> -		if (ycount > 0)
> -			line++;
> -		else {
> -			line--;
> -			/* NOTE: We subtract two lines from these pointers */
> -			s -= vc->vc_size_row;
> -			d -= vc->vc_size_row;
> -		}
> -	}
> -}
> -
>  static void fbcon_redraw(struct vc_data *vc, struct fbcon_display *p,
>  			 int line, int count, int offset)
>  {
> @@ -1687,266 +1451,40 @@ static bool fbcon_scroll(struct vc_data *vc, unsigned int t, unsigned int b,
>  {
>  	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
>  	struct fbcon_display *p = &fb_display[vc->vc_num];
> -	int scroll_partial = info->flags & FBINFO_PARTIAL_PAN_OK;
>  
>  	if (fbcon_is_inactive(vc, info))
>  		return true;
>  
>  	fbcon_cursor(vc, CM_ERASE);
> -
> -	/*
> -	 * ++Geert: Only use ywrap/ypan if the console is in text mode
> -	 * ++Andrew: Only use ypan on hardware text mode when scrolling the
> -	 *           whole screen (prevents flicker).
> -	 */
> +	if (count > vc->vc_rows)	/* Maximum realistic size */
> +		count = vc->vc_rows;
>  
>  	switch (dir) {
>  	case SM_UP:
> -		if (count > vc->vc_rows)	/* Maximum realistic size */
> -			count = vc->vc_rows;
> -		if (logo_shown >= 0)
> -			goto redraw_up;
> -		switch (p->scrollmode) {
> -		case SCROLL_MOVE:
> -			fbcon_redraw_blit(vc, info, p, t, b - t - count,
> -				     count);
> -			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
> -			scr_memsetw((unsigned short *) (vc->vc_origin +
> -							vc->vc_size_row *
> -							(b - count)),
> -				    vc->vc_video_erase_char,
> -				    vc->vc_size_row * count);
> -			return true;
> -
> -		case SCROLL_WRAP_MOVE:
> -			if (b - t - count > 3 * vc->vc_rows >> 2) {
> -				if (t > 0)
> -					fbcon_bmove(vc, 0, 0, count, 0, t,
> -						    vc->vc_cols);
> -				ywrap_up(vc, count);
> -				if (vc->vc_rows - b > 0)
> -					fbcon_bmove(vc, b - count, 0, b, 0,
> -						    vc->vc_rows - b,
> -						    vc->vc_cols);
> -			} else if (info->flags & FBINFO_READS_FAST)
> -				fbcon_bmove(vc, t + count, 0, t, 0,
> -					    b - t - count, vc->vc_cols);
> -			else
> -				goto redraw_up;
> -			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
> -			break;
> -
> -		case SCROLL_PAN_REDRAW:
> -			if ((p->yscroll + count <=
> -			     2 * (p->vrows - vc->vc_rows))
> -			    && ((!scroll_partial && (b - t == vc->vc_rows))
> -				|| (scroll_partial
> -				    && (b - t - count >
> -					3 * vc->vc_rows >> 2)))) {
> -				if (t > 0)
> -					fbcon_redraw_move(vc, p, 0, t, count);
> -				ypan_up_redraw(vc, t, count);
> -				if (vc->vc_rows - b > 0)
> -					fbcon_redraw_move(vc, p, b,
> -							  vc->vc_rows - b, b);
> -			} else
> -				fbcon_redraw_move(vc, p, t + count, b - t - count, t);
> -			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
> -			break;
> -
> -		case SCROLL_PAN_MOVE:
> -			if ((p->yscroll + count <=
> -			     2 * (p->vrows - vc->vc_rows))
> -			    && ((!scroll_partial && (b - t == vc->vc_rows))
> -				|| (scroll_partial
> -				    && (b - t - count >
> -					3 * vc->vc_rows >> 2)))) {
> -				if (t > 0)
> -					fbcon_bmove(vc, 0, 0, count, 0, t,
> -						    vc->vc_cols);
> -				ypan_up(vc, count);
> -				if (vc->vc_rows - b > 0)
> -					fbcon_bmove(vc, b - count, 0, b, 0,
> -						    vc->vc_rows - b,
> -						    vc->vc_cols);
> -			} else if (info->flags & FBINFO_READS_FAST)
> -				fbcon_bmove(vc, t + count, 0, t, 0,
> -					    b - t - count, vc->vc_cols);
> -			else
> -				goto redraw_up;
> -			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
> -			break;
> -
> -		case SCROLL_REDRAW:
> -		      redraw_up:
> -			fbcon_redraw(vc, p, t, b - t - count,
> -				     count * vc->vc_cols);
> -			fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
> -			scr_memsetw((unsigned short *) (vc->vc_origin +
> -							vc->vc_size_row *
> -							(b - count)),
> -				    vc->vc_video_erase_char,
> -				    vc->vc_size_row * count);
> -			return true;
> -		}
> -		break;
> +		fbcon_redraw(vc, p, t, b - t - count,
> +			     count * vc->vc_cols);
> +		fbcon_clear(vc, b - count, 0, count, vc->vc_cols);
> +		scr_memsetw((unsigned short *) (vc->vc_origin +
> +						vc->vc_size_row *
> +						(b - count)),
> +			    vc->vc_video_erase_char,
> +			    vc->vc_size_row * count);
> +		return true;
>  
>  	case SM_DOWN:
> -		if (count > vc->vc_rows)	/* Maximum realistic size */
> -			count = vc->vc_rows;
> -		if (logo_shown >= 0)
> -			goto redraw_down;
> -		switch (p->scrollmode) {
> -		case SCROLL_MOVE:
> -			fbcon_redraw_blit(vc, info, p, b - 1, b - t - count,
> -				     -count);
> -			fbcon_clear(vc, t, 0, count, vc->vc_cols);
> -			scr_memsetw((unsigned short *) (vc->vc_origin +
> -							vc->vc_size_row *
> -							t),
> -				    vc->vc_video_erase_char,
> -				    vc->vc_size_row * count);
> -			return true;
> -
> -		case SCROLL_WRAP_MOVE:
> -			if (b - t - count > 3 * vc->vc_rows >> 2) {
> -				if (vc->vc_rows - b > 0)
> -					fbcon_bmove(vc, b, 0, b - count, 0,
> -						    vc->vc_rows - b,
> -						    vc->vc_cols);
> -				ywrap_down(vc, count);
> -				if (t > 0)
> -					fbcon_bmove(vc, count, 0, 0, 0, t,
> -						    vc->vc_cols);
> -			} else if (info->flags & FBINFO_READS_FAST)
> -				fbcon_bmove(vc, t, 0, t + count, 0,
> -					    b - t - count, vc->vc_cols);
> -			else
> -				goto redraw_down;
> -			fbcon_clear(vc, t, 0, count, vc->vc_cols);
> -			break;
> -
> -		case SCROLL_PAN_MOVE:
> -			if ((count - p->yscroll <= p->vrows - vc->vc_rows)
> -			    && ((!scroll_partial && (b - t == vc->vc_rows))
> -				|| (scroll_partial
> -				    && (b - t - count >
> -					3 * vc->vc_rows >> 2)))) {
> -				if (vc->vc_rows - b > 0)
> -					fbcon_bmove(vc, b, 0, b - count, 0,
> -						    vc->vc_rows - b,
> -						    vc->vc_cols);
> -				ypan_down(vc, count);
> -				if (t > 0)
> -					fbcon_bmove(vc, count, 0, 0, 0, t,
> -						    vc->vc_cols);
> -			} else if (info->flags & FBINFO_READS_FAST)
> -				fbcon_bmove(vc, t, 0, t + count, 0,
> -					    b - t - count, vc->vc_cols);
> -			else
> -				goto redraw_down;
> -			fbcon_clear(vc, t, 0, count, vc->vc_cols);
> -			break;
> -
> -		case SCROLL_PAN_REDRAW:
> -			if ((count - p->yscroll <= p->vrows - vc->vc_rows)
> -			    && ((!scroll_partial && (b - t == vc->vc_rows))
> -				|| (scroll_partial
> -				    && (b - t - count >
> -					3 * vc->vc_rows >> 2)))) {
> -				if (vc->vc_rows - b > 0)
> -					fbcon_redraw_move(vc, p, b, vc->vc_rows - b,
> -							  b - count);
> -				ypan_down_redraw(vc, t, count);
> -				if (t > 0)
> -					fbcon_redraw_move(vc, p, count, t, 0);
> -			} else
> -				fbcon_redraw_move(vc, p, t, b - t - count, t + count);
> -			fbcon_clear(vc, t, 0, count, vc->vc_cols);
> -			break;
> -
> -		case SCROLL_REDRAW:
> -		      redraw_down:
> -			fbcon_redraw(vc, p, b - 1, b - t - count,
> -				     -count * vc->vc_cols);
> -			fbcon_clear(vc, t, 0, count, vc->vc_cols);
> -			scr_memsetw((unsigned short *) (vc->vc_origin +
> -							vc->vc_size_row *
> -							t),
> -				    vc->vc_video_erase_char,
> -				    vc->vc_size_row * count);
> -			return true;
> -		}
> +		fbcon_redraw(vc, p, b - 1, b - t - count,
> +			     -count * vc->vc_cols);
> +		fbcon_clear(vc, t, 0, count, vc->vc_cols);
> +		scr_memsetw((unsigned short *) (vc->vc_origin +
> +						vc->vc_size_row *
> +						t),
> +			    vc->vc_video_erase_char,
> +			    vc->vc_size_row * count);
> +		return true;
>  	}
>  	return false;
>  }
>  
> -
> -static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
> -			int height, int width)
> -{
> -	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
> -	struct fbcon_display *p = &fb_display[vc->vc_num];
> -	
> -	if (fbcon_is_inactive(vc, info))
> -		return;
> -
> -	if (!width || !height)
> -		return;
> -
> -	/*  Split blits that cross physical y_wrap case.
> -	 *  Pathological case involves 4 blits, better to use recursive
> -	 *  code rather than unrolled case
> -	 *
> -	 *  Recursive invocations don't need to erase the cursor over and
> -	 *  over again, so we use fbcon_bmove_rec()
> -	 */
> -	fbcon_bmove_rec(vc, p, sy, sx, dy, dx, height, width,
> -			p->vrows - p->yscroll);
> -}
> -
> -static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy, int sx,
> -			    int dy, int dx, int height, int width, u_int y_break)
> -{
> -	struct fb_info *info = registered_fb[con2fb_map[vc->vc_num]];
> -	struct fbcon_ops *ops = info->fbcon_par;
> -	u_int b;
> -
> -	if (sy < y_break && sy + height > y_break) {
> -		b = y_break - sy;
> -		if (dy < sy) {	/* Avoid trashing self */
> -			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
> -					y_break);
> -			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
> -					height - b, width, y_break);
> -		} else {
> -			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
> -					height - b, width, y_break);
> -			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
> -					y_break);
> -		}
> -		return;
> -	}
> -
> -	if (dy < y_break && dy + height > y_break) {
> -		b = y_break - dy;
> -		if (dy < sy) {	/* Avoid trashing self */
> -			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
> -					y_break);
> -			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
> -					height - b, width, y_break);
> -		} else {
> -			fbcon_bmove_rec(vc, p, sy + b, sx, dy + b, dx,
> -					height - b, width, y_break);
> -			fbcon_bmove_rec(vc, p, sy, sx, dy, dx, b, width,
> -					y_break);
> -		}
> -		return;
> -	}
> -	ops->bmove(vc, info, real_y(p, sy), sx, real_y(p, dy), dx,
> -		   height, width);
> -}
> -
>  static void updatescrollmode(struct fbcon_display *p,
>  					struct fb_info *info,
>  					struct vc_data *vc)
> @@ -2119,21 +1657,7 @@ static int fbcon_switch(struct vc_data *vc)
>  
>  	updatescrollmode(p, info, vc);
>  
> -	switch (p->scrollmode) {
> -	case SCROLL_WRAP_MOVE:
> -		scrollback_phys_max = p->vrows - vc->vc_rows;
> -		break;
> -	case SCROLL_PAN_MOVE:
> -	case SCROLL_PAN_REDRAW:
> -		scrollback_phys_max = p->vrows - 2 * vc->vc_rows;
> -		if (scrollback_phys_max < 0)
> -			scrollback_phys_max = 0;
> -		break;
> -	default:
> -		scrollback_phys_max = 0;
> -		break;
> -	}
> -
> +	scrollback_phys_max = 0;
>  	scrollback_max = 0;
>  	scrollback_current = 0;
>  
> diff --git a/drivers/video/fbdev/core/fbcon.h b/drivers/video/fbdev/core/fbcon.h
> index 9315b360c898..a00603b4451a 100644
> --- a/drivers/video/fbdev/core/fbcon.h
> +++ b/drivers/video/fbdev/core/fbcon.h
> @@ -29,7 +29,6 @@ struct fbcon_display {
>      /* Filled in by the low-level console driver */
>      const u_char *fontdata;
>      int userfont;                   /* != 0 if fontdata kmalloc()ed */
> -    u_short scrollmode;             /* Scroll Method */
>      u_short inverse;                /* != 0 text black on white as default */
>      short yscroll;                  /* Hardware scrolling */
>      int vrows;                      /* number of virtual rows */
> @@ -52,8 +51,6 @@ struct fbcon_display {
>  };
>  
>  struct fbcon_ops {
> -	void (*bmove)(struct vc_data *vc, struct fb_info *info, int sy,
> -		      int sx, int dy, int dx, int height, int width);
>  	void (*clear)(struct vc_data *vc, struct fb_info *info, int sy,
>  		      int sx, int height, int width);
>  	void (*putcs)(struct vc_data *vc, struct fb_info *info,
> @@ -152,62 +149,6 @@ static inline int attr_col_ec(int shift, struct vc_data *vc,
>  #define attr_bgcol_ec(bgshift, vc, info) attr_col_ec(bgshift, vc, info, 0)
>  #define attr_fgcol_ec(fgshift, vc, info) attr_col_ec(fgshift, vc, info, 1)
>  
> -    /*
> -     *  Scroll Method
> -     */
> -     
> -/* There are several methods fbcon can use to move text around the screen:
> - *
> - *                     Operation   Pan    Wrap
> - *---------------------------------------------
> - * SCROLL_MOVE         copyarea    No     No
> - * SCROLL_PAN_MOVE     copyarea    Yes    No
> - * SCROLL_WRAP_MOVE    copyarea    No     Yes
> - * SCROLL_REDRAW       imageblit   No     No
> - * SCROLL_PAN_REDRAW   imageblit   Yes    No
> - * SCROLL_WRAP_REDRAW  imageblit   No     Yes
> - *
> - * (SCROLL_WRAP_REDRAW is not implemented yet)
> - *
> - * In general, fbcon will choose the best scrolling
> - * method based on the rule below:
> - *
> - * Pan/Wrap > accel imageblit > accel copyarea >
> - * soft imageblit > (soft copyarea)
> - *
> - * Exception to the rule: Pan + accel copyarea is
> - * preferred over Pan + accel imageblit.
> - *
> - * The above is typical for PCI/AGP cards. Unless
> - * overridden, fbcon will never use soft copyarea.
> - *
> - * If you need to override the above rule, set the
> - * appropriate flags in fb_info->flags.  For example,
> - * to prefer copyarea over imageblit, set
> - * FBINFO_READS_FAST.
> - *
> - * Other notes:
> - * + use the hardware engine to move the text
> - *    (hw-accelerated copyarea() and fillrect())
> - * + use hardware-supported panning on a large virtual screen
> - * + amifb can not only pan, but also wrap the display by N lines
> - *    (i.e. visible line i = physical line (i+N) % yres).
> - * + read what's already rendered on the screen and
> - *     write it in a different place (this is cfb_copyarea())
> - * + re-render the text to the screen
> - *
> - * Whether to use wrapping or panning can only be figured out at
> - * runtime (when we know whether our font height is a multiple
> - * of the pan/wrap step)
> - *
> - */
> -
> -#define SCROLL_MOVE	   0x001
> -#define SCROLL_PAN_MOVE	   0x002
> -#define SCROLL_WRAP_MOVE   0x003
> -#define SCROLL_REDRAW	   0x004
> -#define SCROLL_PAN_REDRAW  0x005
> -
>  #ifdef CONFIG_FB_TILEBLITTING
>  extern void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info);
>  #endif
> diff --git a/drivers/video/fbdev/core/fbcon_ccw.c b/drivers/video/fbdev/core/fbcon_ccw.c
> index 9cd2c4b05c32..3e787a4265db 100644
> --- a/drivers/video/fbdev/core/fbcon_ccw.c
> +++ b/drivers/video/fbdev/core/fbcon_ccw.c
> @@ -59,31 +59,13 @@ static void ccw_update_attr(u8 *dst, u8 *src, int attribute,
>  	}
>  }
>  
> -
> -static void ccw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
> -		     int sx, int dy, int dx, int height, int width)
> -{
> -	struct fbcon_ops *ops = info->fbcon_par;
> -	struct fb_copyarea area;
> -	u32 vyres = GETVYRES(ops->p->scrollmode, info);
> -
> -	area.sx = sy * vc->vc_font.height;
> -	area.sy = vyres - ((sx + width) * vc->vc_font.width);
> -	area.dx = dy * vc->vc_font.height;
> -	area.dy = vyres - ((dx + width) * vc->vc_font.width);
> -	area.width = height * vc->vc_font.height;
> -	area.height  = width * vc->vc_font.width;
> -
> -	info->fbops->fb_copyarea(info, &area);
> -}
> -
>  static void ccw_clear(struct vc_data *vc, struct fb_info *info, int sy,
>  		     int sx, int height, int width)
>  {
>  	struct fbcon_ops *ops = info->fbcon_par;
>  	struct fb_fillrect region;
>  	int bgshift = (vc->vc_hi_font_mask) ? 13 : 12;
> -	u32 vyres = GETVYRES(ops->p->scrollmode, info);
> +	u32 vyres = info->var.yres;
>  
>  	region.color = attr_bgcol_ec(bgshift,vc,info);
>  	region.dx = sy * vc->vc_font.height;
> @@ -140,7 +122,7 @@ static void ccw_putcs(struct vc_data *vc, struct fb_info *info,
>  	u32 cnt, pitch, size;
>  	u32 attribute = get_attribute(info, scr_readw(s));
>  	u8 *dst, *buf = NULL;
> -	u32 vyres = GETVYRES(ops->p->scrollmode, info);
> +	u32 vyres = info->var.yres;
>  
>  	if (!ops->fontbuffer)
>  		return;
> @@ -229,7 +211,7 @@ static void ccw_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>  	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
>  	int err = 1, dx, dy;
>  	char *src;
> -	u32 vyres = GETVYRES(ops->p->scrollmode, info);
> +	u32 vyres = info->var.yres;
>  
>  	if (!ops->fontbuffer)
>  		return;
> @@ -387,7 +369,7 @@ static int ccw_update_start(struct fb_info *info)
>  {
>  	struct fbcon_ops *ops = info->fbcon_par;
>  	u32 yoffset;
> -	u32 vyres = GETVYRES(ops->p->scrollmode, info);
> +	u32 vyres = info->var.yres;
>  	int err;
>  
>  	yoffset = (vyres - info->var.yres) - ops->var.xoffset;
> @@ -402,7 +384,6 @@ static int ccw_update_start(struct fb_info *info)
>  
>  void fbcon_rotate_ccw(struct fbcon_ops *ops)
>  {
> -	ops->bmove = ccw_bmove;
>  	ops->clear = ccw_clear;
>  	ops->putcs = ccw_putcs;
>  	ops->clear_margins = ccw_clear_margins;
> diff --git a/drivers/video/fbdev/core/fbcon_cw.c b/drivers/video/fbdev/core/fbcon_cw.c
> index 88d89fad3f05..429ad4bf293e 100644
> --- a/drivers/video/fbdev/core/fbcon_cw.c
> +++ b/drivers/video/fbdev/core/fbcon_cw.c
> @@ -44,31 +44,13 @@ static void cw_update_attr(u8 *dst, u8 *src, int attribute,
>  	}
>  }
>  
> -
> -static void cw_bmove(struct vc_data *vc, struct fb_info *info, int sy,
> -		     int sx, int dy, int dx, int height, int width)
> -{
> -	struct fbcon_ops *ops = info->fbcon_par;
> -	struct fb_copyarea area;
> -	u32 vxres = GETVXRES(ops->p->scrollmode, info);
> -
> -	area.sx = vxres - ((sy + height) * vc->vc_font.height);
> -	area.sy = sx * vc->vc_font.width;
> -	area.dx = vxres - ((dy + height) * vc->vc_font.height);
> -	area.dy = dx * vc->vc_font.width;
> -	area.width = height * vc->vc_font.height;
> -	area.height  = width * vc->vc_font.width;
> -
> -	info->fbops->fb_copyarea(info, &area);
> -}
> -
>  static void cw_clear(struct vc_data *vc, struct fb_info *info, int sy,
>  		     int sx, int height, int width)
>  {
>  	struct fbcon_ops *ops = info->fbcon_par;
>  	struct fb_fillrect region;
>  	int bgshift = (vc->vc_hi_font_mask) ? 13 : 12;
> -	u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +	u32 vxres = info->var.xres;
>  
>  	region.color = attr_bgcol_ec(bgshift,vc,info);
>  	region.dx = vxres - ((sy + height) * vc->vc_font.height);
> @@ -125,7 +107,7 @@ static void cw_putcs(struct vc_data *vc, struct fb_info *info,
>  	u32 cnt, pitch, size;
>  	u32 attribute = get_attribute(info, scr_readw(s));
>  	u8 *dst, *buf = NULL;
> -	u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +	u32 vxres = info->var.xres;
>  
>  	if (!ops->fontbuffer)
>  		return;
> @@ -212,7 +194,7 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>  	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
>  	int err = 1, dx, dy;
>  	char *src;
> -	u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +	u32 vxres = info->var.xres;
>  
>  	if (!ops->fontbuffer)
>  		return;
> @@ -369,7 +351,7 @@ static void cw_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>  static int cw_update_start(struct fb_info *info)
>  {
>  	struct fbcon_ops *ops = info->fbcon_par;
> -	u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +	u32 vxres = info->var.xres;
>  	u32 xoffset;
>  	int err;
>  
> @@ -385,7 +367,6 @@ static int cw_update_start(struct fb_info *info)
>  
>  void fbcon_rotate_cw(struct fbcon_ops *ops)
>  {
> -	ops->bmove = cw_bmove;
>  	ops->clear = cw_clear;
>  	ops->putcs = cw_putcs;
>  	ops->clear_margins = cw_clear_margins;
> diff --git a/drivers/video/fbdev/core/fbcon_rotate.h b/drivers/video/fbdev/core/fbcon_rotate.h
> index e233444cda66..b528b2e54283 100644
> --- a/drivers/video/fbdev/core/fbcon_rotate.h
> +++ b/drivers/video/fbdev/core/fbcon_rotate.h
> @@ -11,15 +11,6 @@
>  #ifndef _FBCON_ROTATE_H
>  #define _FBCON_ROTATE_H
>  
> -#define GETVYRES(s,i) ({                           \
> -        (s == SCROLL_REDRAW || s == SCROLL_MOVE) ? \
> -        (i)->var.yres : (i)->var.yres_virtual; })
> -
> -#define GETVXRES(s,i) ({                           \
> -        (s == SCROLL_REDRAW || s == SCROLL_MOVE || !(i)->fix.xpanstep) ? \
> -        (i)->var.xres : (i)->var.xres_virtual; })
> -
> -
>  static inline int pattern_test_bit(u32 x, u32 y, u32 pitch, const char *pat)
>  {
>  	u32 tmp = (y * pitch) + x, index = tmp / 8,  bit = tmp % 8;
> diff --git a/drivers/video/fbdev/core/fbcon_ud.c b/drivers/video/fbdev/core/fbcon_ud.c
> index 8d5e66b1bdfb..8a9d74dddf86 100644
> --- a/drivers/video/fbdev/core/fbcon_ud.c
> +++ b/drivers/video/fbdev/core/fbcon_ud.c
> @@ -44,33 +44,14 @@ static void ud_update_attr(u8 *dst, u8 *src, int attribute,
>  	}
>  }
>  
> -
> -static void ud_bmove(struct vc_data *vc, struct fb_info *info, int sy,
> -		     int sx, int dy, int dx, int height, int width)
> -{
> -	struct fbcon_ops *ops = info->fbcon_par;
> -	struct fb_copyarea area;
> -	u32 vyres = GETVYRES(ops->p->scrollmode, info);
> -	u32 vxres = GETVXRES(ops->p->scrollmode, info);
> -
> -	area.sy = vyres - ((sy + height) * vc->vc_font.height);
> -	area.sx = vxres - ((sx + width) * vc->vc_font.width);
> -	area.dy = vyres - ((dy + height) * vc->vc_font.height);
> -	area.dx = vxres - ((dx + width) * vc->vc_font.width);
> -	area.height = height * vc->vc_font.height;
> -	area.width  = width * vc->vc_font.width;
> -
> -	info->fbops->fb_copyarea(info, &area);
> -}
> -
>  static void ud_clear(struct vc_data *vc, struct fb_info *info, int sy,
>  		     int sx, int height, int width)
>  {
>  	struct fbcon_ops *ops = info->fbcon_par;
>  	struct fb_fillrect region;
>  	int bgshift = (vc->vc_hi_font_mask) ? 13 : 12;
> -	u32 vyres = GETVYRES(ops->p->scrollmode, info);
> -	u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +	u32 vyres = info->var.yres;
> +	u32 vxres = info->var.xres;
>  
>  	region.color = attr_bgcol_ec(bgshift,vc,info);
>  	region.dy = vyres - ((sy + height) * vc->vc_font.height);
> @@ -162,8 +143,8 @@ static void ud_putcs(struct vc_data *vc, struct fb_info *info,
>  	u32 mod = vc->vc_font.width % 8, cnt, pitch, size;
>  	u32 attribute = get_attribute(info, scr_readw(s));
>  	u8 *dst, *buf = NULL;
> -	u32 vyres = GETVYRES(ops->p->scrollmode, info);
> -	u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +	u32 vyres = info->var.yres;
> +	u32 vxres = info->var.xres;
>  
>  	if (!ops->fontbuffer)
>  		return;
> @@ -259,8 +240,8 @@ static void ud_cursor(struct vc_data *vc, struct fb_info *info, int mode,
>  	int attribute, use_sw = vc->vc_cursor_type & CUR_SW;
>  	int err = 1, dx, dy;
>  	char *src;
> -	u32 vyres = GETVYRES(ops->p->scrollmode, info);
> -	u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +	u32 vyres = info->var.yres;
> +	u32 vxres = info->var.xres;
>  
>  	if (!ops->fontbuffer)
>  		return;
> @@ -410,8 +391,8 @@ static int ud_update_start(struct fb_info *info)
>  {
>  	struct fbcon_ops *ops = info->fbcon_par;
>  	int xoffset, yoffset;
> -	u32 vyres = GETVYRES(ops->p->scrollmode, info);
> -	u32 vxres = GETVXRES(ops->p->scrollmode, info);
> +	u32 vyres = info->var.yres;
> +	u32 vxres = info->var.xres;
>  	int err;
>  
>  	xoffset = vxres - info->var.xres - ops->var.xoffset;
> @@ -429,7 +410,6 @@ static int ud_update_start(struct fb_info *info)
>  
>  void fbcon_rotate_ud(struct fbcon_ops *ops)
>  {
> -	ops->bmove = ud_bmove;
>  	ops->clear = ud_clear;
>  	ops->putcs = ud_putcs;
>  	ops->clear_margins = ud_clear_margins;
> diff --git a/drivers/video/fbdev/core/tileblit.c b/drivers/video/fbdev/core/tileblit.c
> index 2768eff247ba..72af95053bcb 100644
> --- a/drivers/video/fbdev/core/tileblit.c
> +++ b/drivers/video/fbdev/core/tileblit.c
> @@ -16,21 +16,6 @@
>  #include <asm/types.h>
>  #include "fbcon.h"
>  
> -static void tile_bmove(struct vc_data *vc, struct fb_info *info, int sy,
> -		       int sx, int dy, int dx, int height, int width)
> -{
> -	struct fb_tilearea area;
> -
> -	area.sx = sx;
> -	area.sy = sy;
> -	area.dx = dx;
> -	area.dy = dy;
> -	area.height = height;
> -	area.width = width;
> -
> -	info->tileops->fb_tilecopy(info, &area);
> -}
> -
>  static void tile_clear(struct vc_data *vc, struct fb_info *info, int sy,
>  		       int sx, int height, int width)
>  {
> @@ -133,7 +118,6 @@ void fbcon_set_tileops(struct vc_data *vc, struct fb_info *info)
>  	struct fb_tilemap map;
>  	struct fbcon_ops *ops = info->fbcon_par;
>  
> -	ops->bmove = tile_bmove;
>  	ops->clear = tile_clear;
>  	ops->putcs = tile_putcs;
>  	ops->clear_margins = tile_clear_margins;
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
