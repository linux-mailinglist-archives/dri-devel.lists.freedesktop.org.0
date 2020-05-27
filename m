Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7841E595C
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:45:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D2D6E44F;
	Thu, 28 May 2020 07:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FDA36E0CB
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 13:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=3DyG6h3I4Y9QuJnn1o
 Dt9FDzi0q1kTIE4vr9uP1Hf8Y=; b=KYcnLUNVxO6wHCp0XK4d5TSzi445ljV8J4
 ruv/SA+S5CdLgJYZNQVEwilx0YJa3dsYuTbgXcZVhb076F1/aHDYVaYqqNqhvdJt
 jyzuQWKakGfEdlkt7oeyoBr7oV5rud+vKiJhG0pwBPwk6Efh2QR1ZbPA7X89FT3X
 PtnXPZPKM=
Received: from localhost.localdomain (unknown [122.194.9.250])
 by smtp9 (Coremail) with SMTP id NeRpCgBHa2sqbM5eBKQPPw--.188S3;
 Wed, 27 May 2020 21:33:32 +0800 (CST)
From: chenxb_99091@126.com
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re:Re:[PATCH] drm: fix setting of plane_mask in pan_display_atomic()
 function for linux-4.4
Date: Wed, 27 May 2020 21:33:27 +0800
Message-Id: <1590586407-4109-1-git-send-email-chenxb_99091@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: NeRpCgBHa2sqbM5eBKQPPw--.188S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyDAw1ftrWDJw48Zw43ZFb_yoW8Cr1fpF
 4xAF95KF18ta1UCasFgan7Zr13ua1xWr1xWr1Ygr1Y9ryUtFy7tFsrZ3y3Wa4jqry3Gw13
 twn8CasF9F15ArJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b8Oz3UUUUU=
X-Originating-IP: [122.194.9.250]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiJQ0xxV3WD2bedwABsW
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xuebing Chen <chenxb_99091@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuebing Chen <chenxb_99091@126.com>

On Mon, May 25, 2020 at 04:34:28PM +0200, Daniel Vetter wrote:
> On Sat, May 23, 2020 at 11:49:07AM +0800, chenxb_99091@126.com wrote:
> > From: Xuebing Chen <chenxb_99091@126.com>
> > 
> > The <include/drm/drm_crtc.h> provides drm_for_each_plane_mask macro and
> > plane_mask is defined as bitmask of plane indices, such as
> > 1<<drm_plane_index(plane). This patch fixes error setting of plane_mask
> > in pan_display_atomic() function.
> > 
> > Signed-off-by: Xuebing Chen <chenxb_99091@126.com>
> 
> What kernel is this patch against? Latest upstream doesn't have any such
> code anymore ... I'm assuming that Ville fixed this in one of his patches,
> but I can't find the right one just now.

This bug is still present in the longterm-supported versions of kernel 4.4.y, 
including the latest kernel v4.4.224,
See https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/?h=v4.4.224



> -Daniel
> 
> > ---
> >  drivers/gpu/drm/drm_fb_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
> > index e449f22..6a9f7ee 100644
> > --- a/drivers/gpu/drm/drm_fb_helper.c
> > +++ b/drivers/gpu/drm/drm_fb_helper.c
> > @@ -1256,7 +1256,7 @@ retry:
> >  			goto fail;
> >  
> >  		plane = mode_set->crtc->primary;
> > -		plane_mask |= drm_plane_index(plane);
> > +		plane_mask |= 1 << drm_plane_index(plane);
> >  		plane->old_fb = plane->fb;
> >  	}
> >  
> > -- 
> > 2.7.4
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
