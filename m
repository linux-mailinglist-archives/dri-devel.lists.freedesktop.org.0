Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBC82D771D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 14:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A61816EE11;
	Fri, 11 Dec 2020 13:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A494C6EE10
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 13:57:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t4so9092085wrr.12
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 05:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/kA40mSIrLnZ0RgEQ2Dpjs3F6f+M4jjau+UbsX3Ywow=;
 b=EcQVLUcdBvbn1YsbP+wEwu1A/ghGuwHAY6/pixBgGog1lTm6KJ/W3BmCKt7jdBZTeI
 +yko0DpUL1XuCQGbX3coFwO6rjq6p5HLxNbUd+YNtgsKTldh6m4NU8OYl7lyw94iNvXv
 LEl3H4SpoWT3lNz5NT7cW8Nip6LLX4Ic77uYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/kA40mSIrLnZ0RgEQ2Dpjs3F6f+M4jjau+UbsX3Ywow=;
 b=JJoINxkVnxExO5a3aMXEGSny7MFNAoYCPvAZzwMFbxPtOTS/NFc1v8V3Itx5rR/mjS
 2dfzrj2KsUzKd2Aa67rx6kUrOEfI4ZPye0gPSQOmLFfpSWE4B1zEsd7aaC1nKC6Xks/D
 Tk0kmeNPX0dUEYnCndQD6HwsrRh7U3YIEw4ZUUEQ3ApQ5GUlVfwvtLqYi1qkE36AyTIH
 ZeiPJ2xbYV1tcurv/k7lkCr6vYPAQ+XIAKLyM5ZyaOiURqZnF+FED77JTLZO+zNfHLqS
 19YPdxRYJrvO6pzNjFkxRfDv2ThNsi0Y5yS06l0mysoefKMw0BIpx4QuQTDFTB8JS2h/
 sWGA==
X-Gm-Message-State: AOAM530miTgTWxkg7dYmJZz5BTM4msOXL3XXaFmKIDhS0XMseW9KPAb1
 /hzbq7w5OGKdl95C+jUyhRAy7w==
X-Google-Smtp-Source: ABdhPJzDlOC0c73ofKS9HsJmwMYeq4QQFi9oMxc4voraOETJBiStS3UUdAbSSnl/S7E+WUYJRiwC+g==
X-Received: by 2002:adf:8b5a:: with SMTP id v26mr6337057wra.138.1607695026266; 
 Fri, 11 Dec 2020 05:57:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h16sm9075486wrq.29.2020.12.11.05.57.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 05:57:05 -0800 (PST)
Date: Fri, 11 Dec 2020 14:57:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 2/8] drm/ast: Only map cursor BOs during updates
Message-ID: <20201211135703.GR401619@phenom.ffwll.local>
References: <20201209142527.26415-1-tzimmermann@suse.de>
 <20201209142527.26415-3-tzimmermann@suse.de>
 <20201211101833.GQ401619@phenom.ffwll.local>
 <0c628bab-e4e0-170b-e695-abf3cde13c01@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c628bab-e4e0-170b-e695-abf3cde13c01@suse.de>
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
Cc: airlied@linux.ie, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, hdegoede@redhat.com, kraxel@redhat.com,
 virtualization@lists.linux-foundation.org, sean@poorly.run,
 christian.koenig@amd.com, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 11, 2020 at 11:49:48AM +0100, Thomas Zimmermann wrote:
> =

> =

> Am 11.12.20 um 11:18 schrieb Daniel Vetter:
> > On Wed, Dec 09, 2020 at 03:25:21PM +0100, Thomas Zimmermann wrote:
> > > The HW cursor's BO used to be mapped permanently into the kernel's
> > > address space. GEM's vmap operation will be protected by locks, and
> > > we don't want to lock the BO's for an indefinate period of time.
> > > =

> > > Change the cursor code to map the HW BOs only during updates. The
> > > vmap operation in VRAM helpers is cheap, as a once estabished mapping
> > > is being reused until the BO actually moves. As the HW cursor BOs are
> > > permanently pinned, they never move at all.
> > > =

> > > v2:
> > > 	* fix typos in commit description
> > > =

> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > Acked-by: Christian K=F6nig <christian.koenig@amd.com>
> > =

> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > =

> > Now there's a pretty big issue here though: We can't take dma_resv_lock=
 in
> > commit_tail, because of possible deadlocks on at least gpus that do real
> > async rendering because of the dma_fences. Unfortunately my annotations
> > patches got stuck a bit, I need to refresh them.
> > =

> > Rules are you can pin and unpin stuff in prepare/cleanup_plane, and also
> > take dma_resv_lock there, but not in commit_tail in-between. So I think
> > our vmap_local needs to loose the unconditional assert_locked and requi=
re
> > either that or a pin count.
> =

> I guess my commit description is misleading when it speaks of updates.
> ast_cursor_blit() is actually called from the cursor plane's prepare_fb
> function. [1] The vmap code in ast_cursor_show() could be moved into blit=
()
> as well, I think.

Oh I failed to check this properly. Even better.

> I guess the clean solution is to integrate the cursor code with the
> modesetting code in ast_mode. From there, locks and mappings can be
> established in prepare_fb and the HW state can be updated in atomic_commi=
t.

Yup. I'll still refresh my series with lockdep annotations, keeps paranoid
me at peace :-)
-Daniel

> =

> Best regards
> Thomas
> =

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpu/drm/ast/ast_mode.c#n646
> =

> > -Daniel
> > =

> > > ---
> > >   drivers/gpu/drm/ast/ast_cursor.c | 51 ++++++++++++++++++-----------=
---
> > >   drivers/gpu/drm/ast/ast_drv.h    |  2 --
> > >   2 files changed, 28 insertions(+), 25 deletions(-)
> > > =

> > > diff --git a/drivers/gpu/drm/ast/ast_cursor.c b/drivers/gpu/drm/ast/a=
st_cursor.c
> > > index 68bf3d33f1ed..fac1ee79c372 100644
> > > --- a/drivers/gpu/drm/ast/ast_cursor.c
> > > +++ b/drivers/gpu/drm/ast/ast_cursor.c
> > > @@ -39,7 +39,6 @@ static void ast_cursor_fini(struct ast_private *ast)
> > >   	for (i =3D 0; i < ARRAY_SIZE(ast->cursor.gbo); ++i) {
> > >   		gbo =3D ast->cursor.gbo[i];
> > > -		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
> > >   		drm_gem_vram_unpin(gbo);
> > >   		drm_gem_vram_put(gbo);
> > >   	}
> > > @@ -53,14 +52,13 @@ static void ast_cursor_release(struct drm_device =
*dev, void *ptr)
> > >   }
> > >   /*
> > > - * Allocate cursor BOs and pins them at the end of VRAM.
> > > + * Allocate cursor BOs and pin them at the end of VRAM.
> > >    */
> > >   int ast_cursor_init(struct ast_private *ast)
> > >   {
> > >   	struct drm_device *dev =3D &ast->base;
> > >   	size_t size, i;
> > >   	struct drm_gem_vram_object *gbo;
> > > -	struct dma_buf_map map;
> > >   	int ret;
> > >   	size =3D roundup(AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
> > > @@ -77,15 +75,7 @@ int ast_cursor_init(struct ast_private *ast)
> > >   			drm_gem_vram_put(gbo);
> > >   			goto err_drm_gem_vram_put;
> > >   		}
> > > -		ret =3D drm_gem_vram_vmap(gbo, &map);
> > > -		if (ret) {
> > > -			drm_gem_vram_unpin(gbo);
> > > -			drm_gem_vram_put(gbo);
> > > -			goto err_drm_gem_vram_put;
> > > -		}
> > > -
> > >   		ast->cursor.gbo[i] =3D gbo;
> > > -		ast->cursor.map[i] =3D map;
> > >   	}
> > >   	return drmm_add_action_or_reset(dev, ast_cursor_release, NULL);
> > > @@ -94,7 +84,6 @@ int ast_cursor_init(struct ast_private *ast)
> > >   	while (i) {
> > >   		--i;
> > >   		gbo =3D ast->cursor.gbo[i];
> > > -		drm_gem_vram_vunmap(gbo, &ast->cursor.map[i]);
> > >   		drm_gem_vram_unpin(gbo);
> > >   		drm_gem_vram_put(gbo);
> > >   	}
> > > @@ -168,31 +157,38 @@ static void update_cursor_image(u8 __iomem *dst=
, const u8 *src, int width, int h
> > >   int ast_cursor_blit(struct ast_private *ast, struct drm_framebuffer=
 *fb)
> > >   {
> > >   	struct drm_device *dev =3D &ast->base;
> > > -	struct drm_gem_vram_object *gbo;
> > > -	struct dma_buf_map map;
> > > -	int ret;
> > > -	void *src;
> > > +	struct drm_gem_vram_object *dst_gbo =3D ast->cursor.gbo[ast->cursor=
.next_index];
> > > +	struct drm_gem_vram_object *src_gbo =3D drm_gem_vram_of_gem(fb->obj=
[0]);
> > > +	struct dma_buf_map src_map, dst_map;
> > >   	void __iomem *dst;
> > > +	void *src;
> > > +	int ret;
> > >   	if (drm_WARN_ON_ONCE(dev, fb->width > AST_MAX_HWC_WIDTH) ||
> > >   	    drm_WARN_ON_ONCE(dev, fb->height > AST_MAX_HWC_HEIGHT))
> > >   		return -EINVAL;
> > > -	gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
> > > -
> > > -	ret =3D drm_gem_vram_vmap(gbo, &map);
> > > +	ret =3D drm_gem_vram_vmap(src_gbo, &src_map);
> > >   	if (ret)
> > >   		return ret;
> > > -	src =3D map.vaddr; /* TODO: Use mapping abstraction properly */
> > > +	src =3D src_map.vaddr; /* TODO: Use mapping abstraction properly */
> > > -	dst =3D ast->cursor.map[ast->cursor.next_index].vaddr_iomem;
> > > +	ret =3D drm_gem_vram_vmap(dst_gbo, &dst_map);
> > > +	if (ret)
> > > +		goto err_drm_gem_vram_vunmap;
> > > +	dst =3D dst_map.vaddr_iomem; /* TODO: Use mapping abstraction prope=
rly */
> > >   	/* do data transfer to cursor BO */
> > >   	update_cursor_image(dst, src, fb->width, fb->height);
> > > -	drm_gem_vram_vunmap(gbo, &map);
> > > +	drm_gem_vram_vunmap(dst_gbo, &dst_map);
> > > +	drm_gem_vram_vunmap(src_gbo, &src_map);
> > >   	return 0;
> > > +
> > > +err_drm_gem_vram_vunmap:
> > > +	drm_gem_vram_vunmap(src_gbo, &src_map);
> > > +	return ret;
> > >   }
> > >   static void ast_cursor_set_base(struct ast_private *ast, u64 addres=
s)
> > > @@ -243,17 +239,26 @@ static void ast_cursor_set_location(struct ast_=
private *ast, u16 x, u16 y,
> > >   void ast_cursor_show(struct ast_private *ast, int x, int y,
> > >   		     unsigned int offset_x, unsigned int offset_y)
> > >   {
> > > +	struct drm_device *dev =3D &ast->base;
> > > +	struct drm_gem_vram_object *gbo =3D ast->cursor.gbo[ast->cursor.nex=
t_index];
> > > +	struct dma_buf_map map;
> > >   	u8 x_offset, y_offset;
> > >   	u8 __iomem *dst;
> > >   	u8 __iomem *sig;
> > >   	u8 jreg;
> > > +	int ret;
> > > -	dst =3D ast->cursor.map[ast->cursor.next_index].vaddr;
> > > +	ret =3D drm_gem_vram_vmap(gbo, &map);
> > > +	if (drm_WARN_ONCE(dev, ret, "drm_gem_vram_vmap() failed, ret=3D%d\n=
", ret))
> > > +		return;
> > > +	dst =3D map.vaddr_iomem; /* TODO: Use mapping abstraction properly =
*/
> > >   	sig =3D dst + AST_HWC_SIZE;
> > >   	writel(x, sig + AST_HWC_SIGNATURE_X);
> > >   	writel(y, sig + AST_HWC_SIGNATURE_Y);
> > > +	drm_gem_vram_vunmap(gbo, &map);
> > > +
> > >   	if (x < 0) {
> > >   		x_offset =3D (-x) + offset_x;
> > >   		x =3D 0;
> > > diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_=
drv.h
> > > index ccaff81924ee..f871fc36c2f7 100644
> > > --- a/drivers/gpu/drm/ast/ast_drv.h
> > > +++ b/drivers/gpu/drm/ast/ast_drv.h
> > > @@ -28,7 +28,6 @@
> > >   #ifndef __AST_DRV_H__
> > >   #define __AST_DRV_H__
> > > -#include <linux/dma-buf-map.h>
> > >   #include <linux/i2c.h>
> > >   #include <linux/i2c-algo-bit.h>
> > >   #include <linux/io.h>
> > > @@ -133,7 +132,6 @@ struct ast_private {
> > >   	struct {
> > >   		struct drm_gem_vram_object *gbo[AST_DEFAULT_HWC_NUM];
> > > -		struct dma_buf_map map[AST_DEFAULT_HWC_NUM];
> > >   		unsigned int next_index;
> > >   	} cursor;
> > > -- =

> > > 2.29.2
> > > =

> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
