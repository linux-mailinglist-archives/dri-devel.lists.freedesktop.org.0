Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E025A2A27C5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 11:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5801B6E46B;
	Mon,  2 Nov 2020 10:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDA36E46B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 10:10:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n18so13850672wrs.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 02:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=/jCBLmaCudwHAJHAidbrPtDf5EnkITSIWvI62MHOukQ=;
 b=FPWp/swlBnqBkl1B3JK7NsX6n/++Ji0QGa1CPTVP5ISH9HOzOklGZggjcUq1dkZAuK
 1P9ufpBGRckno/zLlghYzi8qdLKLX3zphP4QfhOrjq2VvILw1Ty75o8c5uUha3pggSli
 vxiQfKC4O+5Zgxyx5SEefhRd5y3XmyOU96K3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=/jCBLmaCudwHAJHAidbrPtDf5EnkITSIWvI62MHOukQ=;
 b=I4SBZT4y5LDErIX0/iiQzNIgA9hLNrdZp+aZtYYa1O9Zt+Xx1RrKukdrh6ZYj99djH
 XnNOvIe8UClXbxUxU76CnU2oOLsR5tc+T3+SxKHcmxh1BrYYeMrapuyoWwcH5NAWbGom
 QJwKuGnOwFhh/8Jbp5Kd6jDpgxY4TAdf+nYJC663vUmTfUD+8DD4sYBOgRwvPDMN5sT2
 T0QbJJEt/zVt+RufsuneFOBlsmbvzV/aZcxY3aLBLzHcy6chcsXAbWML9+p+ZHrJO6ja
 pyapWJJBL+Wn0QyMn4PJPzVRu1in71COW9NHtfsNltxUOnp5bWjp9UzqgfddNPmIO/ut
 drrA==
X-Gm-Message-State: AOAM532TQ9wkzuOVQg2Uzi8ajWBa4vlh73E6QzCABikSVMqK04esKs6L
 S2/Xyi8TXTXVEHM3pLVAgIR/eZY5hGaeNHE6
X-Google-Smtp-Source: ABdhPJy6jfLVwkZqySMOwLFsx4xGyqy0UGSjPX4MTh1s9JXutyGH4qa+vJ2YyDxaw4XFdjk/eWh61Q==
X-Received: by 2002:adf:fc07:: with SMTP id i7mr14102371wrr.223.1604311847466; 
 Mon, 02 Nov 2020 02:10:47 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t12sm22032523wrm.25.2020.11.02.02.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 02:10:46 -0800 (PST)
Date: Mon, 2 Nov 2020 11:10:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH v2 2/2] tty/vt: Avoid passing struct console_font_op to
 con_font_copy()
Message-ID: <20201102101044.GM401619@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 George Kennedy <george.kennedy@oracle.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com>
 <72c954371ed9b1d050901b2d498a979017de8a3c.1604306433.git.yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <72c954371ed9b1d050901b2d498a979017de8a3c.1604306433.git.yepeilin.cs@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, Nicolas Pitre <nico@fluxnic.net>,
 George Kennedy <george.kennedy@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Rosin <peda@axentia.se>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 04:37:55AM -0500, Peilin Ye wrote:
> con_font_op() is passing an entire `struct console_font_op *` to
> con_font_copy(), but con_font_copy() only uses `op->height`. Additionally,
> con_font_copy() is silently assigning the unsigned `op->height` to the
> signed `con`, then pass it to fbcon_copy_font().
> 
> Let con_font_copy() and fbcon_copy_font() pass an unsigned int directly.
> Also, add a comment in con_font_op() for less confusion, since ideally
> `op->height` should not be used as a console index, as the field name
> suggests.
> 
> This patch depends on patch "console: Remove dummy con_font_op() callback
> implementations".
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> con_font_set(), con_font_get() and con_font_default() also pass an entire
> `console_font_op`.
> 
> con_font_get() and con_font_default() actually update the structure (later
> copied to userspace), so let them be.
> 
> con_font_set() does not update the structure, but it uses all fields of it
> except `op`. Avoiding passing `console_font_op` to con_font_set() will
> thus make its signature pretty long (6 parameters).
> 
> Changes in v2:
>   - Remove redundant `con < 0` check in con_font_copy() (kernel test robot
>     <lkp@intel.com>)
>   - Remove unnecessary range check in fbcon_copy_font(). con_font_copy()
>     calls vc_cons_allocated(), which does the check
>   - Do not Cc: stable
>   - Rewrite the title and commit message accordingly
> 
>  drivers/tty/vt/vt.c              | 8 ++++----
>  drivers/video/fbdev/core/fbcon.c | 2 +-
>  include/linux/console.h          | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)

I'm not sure switching from int to unsigned just here makes much sense.
All the console code is still using int con to index all the various
arrays (I just checked fbcon.c code), and using int to index arrays is
pretty standard. As long as we have the con < 0 check to catch evil
userspace.

There's still the switch from op to int for con_font_copy, but I think
that's better done as part of the larger cleanup we already discussed. And
then maybe also include patch 1 from this series in that rework.
-Daniel

> 
> diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
> index 9506a76f3ab6..27821ef97b13 100644
> --- a/drivers/tty/vt/vt.c
> +++ b/drivers/tty/vt/vt.c
> @@ -4704,9 +4704,8 @@ static int con_font_default(struct vc_data *vc, struct console_font_op *op)
>  	return rc;
>  }
>  
> -static int con_font_copy(struct vc_data *vc, struct console_font_op *op)
> +static int con_font_copy(struct vc_data *vc, unsigned int con)
>  {
> -	int con = op->height;
>  	int rc;
>  
>  
> @@ -4715,7 +4714,7 @@ static int con_font_copy(struct vc_data *vc, struct console_font_op *op)
>  		rc = -EINVAL;
>  	else if (!vc->vc_sw->con_font_copy)
>  		rc = -ENOSYS;
> -	else if (con < 0 || !vc_cons_allocated(con))
> +	else if (!vc_cons_allocated(con))
>  		rc = -ENOTTY;
>  	else if (con == vc->vc_num)	/* nothing to do */
>  		rc = 0;
> @@ -4735,7 +4734,8 @@ int con_font_op(struct vc_data *vc, struct console_font_op *op)
>  	case KD_FONT_OP_SET_DEFAULT:
>  		return con_font_default(vc, op);
>  	case KD_FONT_OP_COPY:
> -		return con_font_copy(vc, op);
> +		/* uses op->height as a console index */
> +		return con_font_copy(vc, op->height);
>  	}
>  	return -ENOSYS;
>  }
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index cef437817b0d..cb5b5705ea71 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2451,7 +2451,7 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h,
>  	return 0;
>  }
>  
> -static int fbcon_copy_font(struct vc_data *vc, int con)
> +static int fbcon_copy_font(struct vc_data *vc, unsigned int con)
>  {
>  	struct fbcon_display *od = &fb_display[con];
>  	struct console_font *f = &vc->vc_font;
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 4b1e26c4cb42..34855d3f2afd 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -62,7 +62,7 @@ struct consw {
>  	int	(*con_font_get)(struct vc_data *vc, struct console_font *font);
>  	int	(*con_font_default)(struct vc_data *vc,
>  			struct console_font *font, char *name);
> -	int	(*con_font_copy)(struct vc_data *vc, int con);
> +	int	(*con_font_copy)(struct vc_data *vc, unsigned int con);
>  	int     (*con_resize)(struct vc_data *vc, unsigned int width,
>  			unsigned int height, unsigned int user);
>  	void	(*con_set_palette)(struct vc_data *vc,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
