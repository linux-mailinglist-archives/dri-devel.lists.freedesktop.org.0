Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3E4198DDC
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 10:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91FB89CD9;
	Tue, 31 Mar 2020 08:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5013489CD9
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 08:01:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u10so24669042wro.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 01:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=NP7RN6gDze0UfJ8t7IIvwLkl0F8QdLj5fqt2LMXUxbY=;
 b=Ep9UKTxoYhSEudWlGvEXKt3K7JAmOqoB4BJ2hTrbsmBIbp10oYGBfmvzcQkdI0HODH
 kPkBYd3A83rKErAAx8VEjuLBVmy4o6niPOrVVosAHK4jZcl76PrvtJgY9bAv+MwTNTP/
 mZdJOvVcPB92CkZ/F6CZZQgtzHWasemEjsYq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=NP7RN6gDze0UfJ8t7IIvwLkl0F8QdLj5fqt2LMXUxbY=;
 b=SNprS/oExECKxiXyHeNW6w7n2YUACyOlCT24ZjCVyYb/s22tSDUWvxSXZ3gJvCXTD2
 Mnsc3kcgZlDLb71iLP8czsN1AUK2C3zYFVa4zZy8AGBHhXtEu438JJwBES1jUCjyd0LU
 pHlgs3nQEvGWetNFNDXK3xFQwEuy0kQQ0xpQTtlZqZtCRW8Trw4+oqJgCfJwNlmPvhUc
 ca9wHQw/jd0DBGCMlvcliIhJ6NYLjYsg+dhuauqcHD8p3Dy+ZG80tZyCgh4i23+rC7p8
 JL75fAEbhfD+4J3E1LrNqoTXqaCwz9WVBEHs5sUUsHlErTzrPKMdsM4Uw9DCrIAdhr5R
 PbqA==
X-Gm-Message-State: ANhLgQ0ctzJAJ0eAqPvV++11fr4+m7ts2KxzpUprs+vgnVN8jDmeA7gh
 JOBJtLXH30uqbSfe7ugpXfElmw==
X-Google-Smtp-Source: ADFU+vtz+p6vgrdf/PdwcY1Polm8UQcM+44sWG/RRvi5FdtnsFgNsXI5ZpfuKOcIvc7wLaV/6dTDTA==
X-Received: by 2002:adf:f1ce:: with SMTP id z14mr19211505wro.68.1585641685851; 
 Tue, 31 Mar 2020 01:01:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t6sm2267999wma.30.2020.03.31.01.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 01:01:24 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:01:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2] fbcon: fix null-ptr-deref in fbcon_switch
Message-ID: <20200331080123.GI2363188@phenom.ffwll.local>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 Qiujun Huang <hqjagain@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 maarten.lankhorst@linux.intel.com, daniel.thompson@linaro.org,
 ghalat@redhat.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200329085647.25133-1-hqjagain@gmail.com>
 <20200330191619.GF7594@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330191619.GF7594@ravnborg.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: daniel.thompson@linaro.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, daniel.vetter@ffwll.ch,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ghalat@redhat.com,
 Qiujun Huang <hqjagain@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 09:16:19PM +0200, Sam Ravnborg wrote:
> Hi Qiujun
> 
> On Sun, Mar 29, 2020 at 04:56:47PM +0800, Qiujun Huang wrote:
> > Set logo_shown to FBCON_LOGO_CANSHOW when the vc was deallocated.
> > 
> > syzkaller report: https://lkml.org/lkml/2020/3/27/403
> > general protection fault, probably for non-canonical address
> > 0xdffffc000000006c: 0000 [#1] SMP KASAN
> > KASAN: null-ptr-deref in range [0x0000000000000360-0x0000000000000367]
> > RIP: 0010:fbcon_switch+0x28f/0x1740
> > drivers/video/fbdev/core/fbcon.c:2260
> > 
> > Call Trace:
> > redraw_screen+0x2a8/0x770 drivers/tty/vt/vt.c:1008
> > vc_do_resize+0xfe7/0x1360 drivers/tty/vt/vt.c:1295
> > fbcon_init+0x1221/0x1ab0 drivers/video/fbdev/core/fbcon.c:1219
> > visual_init+0x305/0x5c0 drivers/tty/vt/vt.c:1062
> > do_bind_con_driver+0x536/0x890 drivers/tty/vt/vt.c:3542
> > do_take_over_console+0x453/0x5b0 drivers/tty/vt/vt.c:4122
> > do_fbcon_takeover+0x10b/0x210 drivers/video/fbdev/core/fbcon.c:588
> > fbcon_fb_registered+0x26b/0x340 drivers/video/fbdev/core/fbcon.c:3259
> > do_register_framebuffer drivers/video/fbdev/core/fbmem.c:1664 [inline]
> > register_framebuffer+0x56e/0x980 drivers/video/fbdev/core/fbmem.c:1832
> > dlfb_usb_probe.cold+0x1743/0x1ba3 drivers/video/fbdev/udlfb.c:1735
> > usb_probe_interface+0x310/0x800 drivers/usb/core/driver.c:374
> > 
> > accessing vc_cons[logo_shown].d->vc_top causes the bug.
> > 
> > Reported-by: syzbot+732528bae351682f1f27@syzkaller.appspotmail.com
> > Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> > ---
> >  drivers/video/fbdev/core/fbcon.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> > index bb6ae995c2e5..5eb3fc90f9f6 100644
> > --- a/drivers/video/fbdev/core/fbcon.c
> > +++ b/drivers/video/fbdev/core/fbcon.c
> > @@ -1283,6 +1283,9 @@ static void fbcon_deinit(struct vc_data *vc)
> >  	if (!con_is_bound(&fb_con))
> >  		fbcon_exit();
> >  
> > +	if (vc->vc_num == logo_shown)
> > +		logo_shown = FBCON_LOGO_CANSHOW;
> > +
> >  	return;
> >  }
> 
> Looks much better than the previous version.
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> I expect Bartlomiej to review/apply.

Especially for bugfixes I think better to push quicker than wait for
others to ... the point with drm-misc is real group maintainership and
benefitting from the flexibility, not reflecting the same strict hierarchy
but in a flat tree to make it look like it doesn't exist :-)

Applied to drm-misc-next-fixes with a cc: stable.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
