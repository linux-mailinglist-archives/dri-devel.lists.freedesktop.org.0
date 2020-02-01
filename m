Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62880150256
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F9E6EB4E;
	Mon,  3 Feb 2020 08:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn
 [202.108.3.24])
 by gabe.freedesktop.org (Postfix) with SMTP id 719B26E4DD
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2020 09:03:40 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([124.64.3.106])
 by sina.com with ESMTP
 id 5E353EC1000026FF; Sat, 1 Feb 2020 17:02:59 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 46649154919310
From: Hillf Danton <hdanton@sina.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: KASAN: use-after-free Read in vgem_gem_dumb_create
Date: Sat,  1 Feb 2020 17:02:47 +0800
Message-Id: <20200201090247.10928-1-hdanton@sina.com>
In-Reply-To: <20200201043209.13412-1-hdanton@sina.com>
References: <20200201043209.13412-1-hdanton@sina.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:10:41 +0000
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
Cc: robdclark@chromium.org, davem@davemloft.net, airlied@linux.ie,
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org,
 syzbot <syzbot+0dc4444774d419e916c8@syzkaller.appspotmail.com>,
 alexander.deucher@amd.com, linux-media@vger.kernel.org,
 christian.koenig@amd.com, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 1 Feb 2020 09:17:57 +0300 Dan Carpenter wrote:
> On Sat, Feb 01, 2020 at 12:32:09PM +0800, Hillf Danton wrote:
> >
> > Release obj in error path.
> > 
> > --- a/drivers/gpu/drm/vgem/vgem_drv.c
> > +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> > @@ -196,10 +196,10 @@ static struct drm_gem_object *vgem_gem_c
> >  		return ERR_CAST(obj);
> >  
> >  	ret = drm_gem_handle_create(file, &obj->base, handle);
> > -	drm_gem_object_put_unlocked(&obj->base);
> > -	if (ret)
> > +	if (ret) {
> > +		drm_gem_object_put_unlocked(&obj->base);
> >  		return ERR_PTR(ret);
> > -
> > +	}
> >  	return &obj->base;
> 
> Oh yeah.  It's weird that we never noticed the success path was broken.
> It's been that way for three years and no one noticed at all.  Very
> strange.
> 
> Anyway, it already gets freed on error in drm_gem_handle_create() so
> we should just delete the drm_gem_object_put_unlocked() here it looks
> like.

Good catch, Dan :P
Would you please post a patch sometime convenient next week?

Thanks
Hillf

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
