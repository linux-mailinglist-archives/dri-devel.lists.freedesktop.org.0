Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E762782040C
	for <lists+dri-devel@lfdr.de>; Sat, 30 Dec 2023 09:35:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B12E10E075;
	Sat, 30 Dec 2023 08:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7501D10E075
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Dec 2023 08:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1703925324; x=1704530124; i=deller@gmx.de;
 bh=VZGTN6TgRUcd52aQbEvz8CxnloFnIsTyoxfkzyF18A0=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=W+Ko+DK315YuZQzPi/dG7tMrGXbUGXGx5yait0cGNPu+QDgkxWSyjTvARR3Gc00z
 GTQKPF91mAINhHQuNMJnBVq+iZsIB45BrrydFbY/1yRZR9GdKJwdqfRf0x08xGiZ1
 p4+hii5RiGpxsdemW0AJcyKFfPeBVTLfCly4huJjqhvynFIv6DN85evSZ96SaT1sR
 UjFK0mma73QfvyCe24By12JABZZ3bf7K4H+O1XifffSCWU5mVGhv9v4qMWwLt1wXE
 cJimjcFROeDoN/L5T7hac5ISTa3QXDUv2LL02wDh26UR6ayqHwEwQe5kfUZ3vzLd8
 OFlSXi8oYxjWwitGEQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([94.134.152.157]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M7b2T-1rKJEH08CL-0081PW; Sat, 30
 Dec 2023 09:35:24 +0100
Message-ID: <a25a32c7-44aa-420c-aec6-dc4796768621@gmx.de>
Date: Sat, 30 Dec 2023 09:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] fbdev/stifb: Allocate fb_info instance with
 framebuffer_alloc()
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 James.Bottomley@HansenPartnership.com, arnd@arndb.de
References: <20231220134639.8190-1-tzimmermann@suse.de>
 <20231220134639.8190-3-tzimmermann@suse.de>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231220134639.8190-3-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qm4klWRQuI/+1b4rP7ccuVIP/NdWKW8d1HzToz/CXAgRTYcDcDc
 u+K1sa6wnmVmcNspWtcUfhAiaBH7Za95jeYRYBwEXTAnJQEEtjNFX8Yok4Q2t0tn60fAOKj
 CpRAdVRAVZurzSDQOZjXvZjJmzZRcMC6oOEATQ8YdzhUTarBaGy2+7RatKRo9NeyDQP6f4C
 fEKec70t1hNb5AHAnUjyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:he+R6uCh4bc=;nIZc/VXmsnaAzrXcryJNOLahCFl
 5tGs2W4SP0pIw2qjSPm1EPLEohak4rImEeGffXgyE188rla5gkr//YHh8548zZC3wqOXO/Yv3
 yC22E07BEedxQlpmDrpe0dr27tScWcFa+CQJ4GUD39H23bo4TNRxhOkfiWj9KA2qsag6/Mru7
 klXRVxtx40+GJWDoxrW/h1E7DI2xyfj7mShJlbgzlHgvN/87HDvzJOKX27tGTsUEbcTEDlAB5
 TzzHJOC/t8PfPrRtTotxUV882NySPsbu8fuk2zW2hb2FKrH3ChgYixL1rwwvRdxcOgfqn2e02
 b0zuz3csEVfQ0lBP7A2z5896oOr3Fy8M9ZOv6dXrXMzNwwzhsqxTlO5WdIKl82m+eYUUQtIUw
 dOBAYiYvazM3yik3rocRlNOdL8kAdFDHOwsbQosN8EBhDHYskQZe/gjL5AuI3LNXW4sslRK4B
 3MRHWlTunbB7FENzAuzwgAJVZyj25ipL+UPYfiANV6WbIj0nsHX660fFKSvwR7/lnzjxSLLy2
 p6eu0Yz+d1AIN9q9iSrjBDb4JcXVukj3HLllq7hX6z5fVDZF0Rm51Rotl0fNpHFK0rhmfWDfF
 EBmygdZrrAuAJV7pUa+KAHch3PnBpboJ3nnw1qoazyLWHDXwXdfzH+t8jjuDRJznrqbnuc1Kr
 SkcRVJdaVSfxTkGVqYw4ZwMOEv2XcQF81lXFOuatxiReeoAz0UEP97V96m+dTjOuL3HpnAhp7
 nWCaIJFYi3ALcst1bbaMti4H7868KOflqcuz6kKaGYkVqhi5kU0HVlpj8EW9ktOjcLqhHTqdW
 XBb1hTdsSn2h3qS6/ym5SYYCs5hdRC/LcH3ZXoHyiY2yh2FkCnWzT/6A4G1zLWmNUfyZA9kWS
 wI1GLEMhAukvALQUQImEXihjgEMAtMc4AgLvnjnlmU4FMO2CS/TeXA8CJ4zSDzUSDBNgNtUkb
 yE/Bqg==
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-parisc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 12/20/23 14:22, Thomas Zimmermann wrote:
> Allocate stifb's instance of fb_info with framebuffer_alloc(). This
> is the preferred way of creating fb_info with associated driver data
> stored in struct fb_info.par. Requires several, but minor, changes
> through out the driver's code.
>
> The intended side effect of this patch is that the new instance of
> struct fb_info now has its device field correctly set to the parent
> device of the STI ROM. A later patch can detect if the device is the
> firmware's primary output. It is also now correctly located within
> the Linux device hierarchy.

Thanks for this cleanup series!
Sadly stifb then crashes at bootup.

Please include this copy&pasted hunk in this patch, which then fixes the c=
rash:

diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index 2de0e675fd15..f8bbd8d6f5b2 100644
=2D-- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -1158,7 +1158,7 @@ stifb_init_display(struct stifb_info *fb)
             }
             break;
         }
-       stifb_blank(0, (struct fb_info *)fb);   /* 0=3Denable screen */
+       stifb_blank(0, fb->info);       /* 0=3Denable screen */



With this applied, you may add to the series:

Tested-by: Helge Deller <deller@gmx.de>
Reviewed-by: Helge Deller <deller@gmx.de>

Thanks!
Helge

>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/video/fbdev/stifb.c | 106 +++++++++++++++++++-----------------
>   1 file changed, 56 insertions(+), 50 deletions(-)
>
> diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
> index 548d992f8cb1..36e6bcab83aa 100644
> --- a/drivers/video/fbdev/stifb.c
> +++ b/drivers/video/fbdev/stifb.c
> @@ -103,7 +103,7 @@ typedef struct {
>   } ngle_rom_t;
>
>   struct stifb_info {
> -	struct fb_info info;
> +	struct fb_info *info;
>   	unsigned int id;
>   	ngle_rom_t ngle_rom;
>   	struct sti_struct *sti;
> @@ -153,15 +153,15 @@ static int __initdata stifb_bpp_pref[MAX_STI_ROMS]=
;
>   #define REG_44		0x210030
>   #define REG_45		0x210034
>
> -#define READ_BYTE(fb,reg)		gsc_readb((fb)->info.fix.mmio_start + (reg))
> -#define READ_WORD(fb,reg)		gsc_readl((fb)->info.fix.mmio_start + (reg))
> +#define READ_BYTE(fb, reg)		gsc_readb((fb)->info->fix.mmio_start + (reg=
))
> +#define READ_WORD(fb, reg)		gsc_readl((fb)->info->fix.mmio_start + (reg=
))
>
>
>   #ifndef DEBUG_STIFB_REGS
>   # define  DEBUG_OFF()
>   # define  DEBUG_ON()
> -# define WRITE_BYTE(value,fb,reg)	gsc_writeb((value),(fb)->info.fix.mmi=
o_start + (reg))
> -# define WRITE_WORD(value,fb,reg)	gsc_writel((value),(fb)->info.fix.mmi=
o_start + (reg))
> +# define WRITE_BYTE(value, fb, reg)	gsc_writeb((value), (fb)->info->fix=
.mmio_start + (reg))
> +# define WRITE_WORD(value, fb, reg)	gsc_writel((value), (fb)->info->fix=
.mmio_start + (reg))
>   #else
>     static int debug_on =3D 1;
>   # define  DEBUG_OFF() debug_on=3D0
> @@ -169,11 +169,11 @@ static int __initdata stifb_bpp_pref[MAX_STI_ROMS]=
;
>   # define WRITE_BYTE(value,fb,reg)	do { if (debug_on) \
>   						printk(KERN_DEBUG "%30s: WRITE_BYTE(0x%06x) =3D 0x%02x (old=3D0x=
%02x)\n", \
>   							__func__, reg, value, READ_BYTE(fb,reg)); 		  \
> -					gsc_writeb((value),(fb)->info.fix.mmio_start + (reg)); } while (0)
> +					gsc_writeb((value), (fb)->info->fix.mmio_start + (reg)); } while (=
0)
>   # define WRITE_WORD(value,fb,reg)	do { if (debug_on) \
>   						printk(KERN_DEBUG "%30s: WRITE_WORD(0x%06x) =3D 0x%08x (old=3D0x=
%08x)\n", \
>   							__func__, reg, value, READ_WORD(fb,reg)); 		  \
> -					gsc_writel((value),(fb)->info.fix.mmio_start + (reg)); } while (0)
> +					gsc_writel((value), (fb)->info->fix.mmio_start + (reg)); } while (=
0)
>   #endif /* DEBUG_STIFB_REGS */
>
>
> @@ -210,13 +210,13 @@ SETUP_FB(struct stifb_info *fb)
>   			reg10_value =3D 0x13601000;
>   			break;
>   		case S9000_ID_A1439A:
> -			if (fb->info.var.bits_per_pixel =3D=3D 32)
> +			if (fb->info->var.bits_per_pixel =3D=3D 32)
>   				reg10_value =3D 0xBBA0A000;
>   			else
>   				reg10_value =3D 0x13601000;
>   			break;
>   		case S9000_ID_HCRX:
> -			if (fb->info.var.bits_per_pixel =3D=3D 32)
> +			if (fb->info->var.bits_per_pixel =3D=3D 32)
>   				reg10_value =3D 0xBBA0A000;
>   			else
>   				reg10_value =3D 0x13602000;
> @@ -254,7 +254,7 @@ static void
>   FINISH_IMAGE_COLORMAP_ACCESS(struct stifb_info *fb)
>   {
>   	WRITE_WORD(0x400, fb, REG_2);
> -	if (fb->info.var.bits_per_pixel =3D=3D 32) {
> +	if (fb->info->var.bits_per_pixel =3D=3D 32) {
>   		WRITE_WORD(0x83000100, fb, REG_1);
>   	} else {
>   		if (fb->id =3D=3D S9000_ID_ARTIST || fb->id =3D=3D CRT_ID_VISUALIZE_=
EG)
> @@ -503,7 +503,7 @@ static void
>   ngleSetupAttrPlanes(struct stifb_info *fb, int BufferNumber)
>   {
>   	SETUP_ATTR_ACCESS(fb, BufferNumber);
> -	SET_ATTR_SIZE(fb, fb->info.var.xres, fb->info.var.yres);
> +	SET_ATTR_SIZE(fb, fb->info->var.xres, fb->info->var.yres);
>   	FINISH_ATTR_ACCESS(fb);
>   	SETUP_FB(fb);
>   }
> @@ -526,9 +526,9 @@ rattlerSetupPlanes(struct stifb_info *fb)
>   	SETUP_FB(fb);
>   	fb->id =3D saved_id;
>
> -	for (y =3D 0; y < fb->info.var.yres; ++y)
> -		fb_memset_io(fb->info.screen_base + y * fb->info.fix.line_length,
> -			     0xff, fb->info.var.xres * fb->info.var.bits_per_pixel/8);
> +	for (y =3D 0; y < fb->info->var.yres; ++y)
> +		fb_memset_io(fb->info->screen_base + y * fb->info->fix.line_length,
> +			     0xff, fb->info->var.xres * fb->info->var.bits_per_pixel/8);
>
>   	CRX24_SET_OVLY_MASK(fb);
>   	SETUP_FB(fb);
> @@ -607,7 +607,7 @@ setHyperLutBltCtl(struct stifb_info *fb, int offsetW=
ithinLut, int length)
>   	lutBltCtl.fields.lutType =3D HYPER_CMAP_TYPE;
>
>   	/* Expect lutIndex to be 0 or 1 for image cmaps, 2 or 3 for overlay c=
maps */
> -	if (fb->info.var.bits_per_pixel =3D=3D 8)
> +	if (fb->info->var.bits_per_pixel =3D=3D 8)
>   		lutBltCtl.fields.lutOffset =3D 2 * 256;
>   	else
>   		lutBltCtl.fields.lutOffset =3D 0 * 256;
> @@ -688,7 +688,7 @@ ngleResetAttrPlanes(struct stifb_info *fb, unsigned =
int ctlPlaneReg)
>   					       DataDynamic, MaskOtc,
>   					       BGx(0), FGx(0)));
>   	packed_dst =3D 0;
> -	packed_len =3D (fb->info.var.xres << 16) | fb->info.var.yres;
> +	packed_len =3D (fb->info->var.xres << 16) | fb->info->var.yres;
>   	GET_FIFO_SLOTS(fb, nFreeFifoSlots, 2);
>   	NGLE_SET_DSTXY(fb, packed_dst);
>   	SET_LENXY_START_RECFILL(fb, packed_len);
> @@ -738,7 +738,7 @@ ngleClearOverlayPlanes(struct stifb_info *fb, int ma=
sk, int data)
>           NGLE_REALLY_SET_IMAGE_PLANEMASK(fb, mask);
>
>           packed_dst =3D 0;
> -        packed_len =3D (fb->info.var.xres << 16) | fb->info.var.yres;
> +	packed_len =3D (fb->info->var.xres << 16) | fb->info->var.yres;
>           NGLE_SET_DSTXY(fb, packed_dst);
>
>   	/* Write zeroes to overlay planes */
> @@ -760,7 +760,7 @@ hyperResetPlanes(struct stifb_info *fb, int enable)
>   	NGLE_LOCK(fb);
>
>   	if (IS_24_DEVICE(fb))
> -		if (fb->info.var.bits_per_pixel =3D=3D 32)
> +		if (fb->info->var.bits_per_pixel =3D=3D 32)
>   			controlPlaneReg =3D 0x04000F00;
>   		else
>   			controlPlaneReg =3D 0x00000F00;   /* 0x00000800 should be enough, b=
ut lets clear all 4 bits */
> @@ -890,7 +890,7 @@ SETUP_HCRX(struct stifb_info *fb)
>   	GET_FIFO_SLOTS(fb, nFreeFifoSlots, 7);
>
>   	if (IS_24_DEVICE(fb)) {
> -		hyperbowl =3D (fb->info.var.bits_per_pixel =3D=3D 32) ?
> +		hyperbowl =3D (fb->info->var.bits_per_pixel =3D=3D 32) ?
>   			HYPERBOWL_MODE01_8_24_LUT0_TRANSPARENT_LUT1_OPAQUE :
>   			HYPERBOWL_MODE01_8_24_LUT0_OPAQUE_LUT1_OPAQUE;
>
> @@ -924,21 +924,21 @@ SETUP_HCRX(struct stifb_info *fb)
>   static int
>   stifb_check_var(struct fb_var_screeninfo *var, struct fb_info *info)
>   {
> -	struct stifb_info *fb =3D container_of(info, struct stifb_info, info);
> +	struct stifb_info *fb =3D info->par;
>
> -	if (var->xres !=3D fb->info.var.xres ||
> -	    var->yres !=3D fb->info.var.yres ||
> -	    var->bits_per_pixel !=3D fb->info.var.bits_per_pixel)
> +	if (var->xres !=3D fb->info->var.xres ||
> +	    var->yres !=3D fb->info->var.yres ||
> +	    var->bits_per_pixel !=3D fb->info->var.bits_per_pixel)
>   		return -EINVAL;
>
>   	var->xres_virtual =3D var->xres;
>   	var->yres_virtual =3D var->yres;
>   	var->xoffset =3D 0;
>   	var->yoffset =3D 0;
> -	var->grayscale =3D fb->info.var.grayscale;
> -	var->red.length =3D fb->info.var.red.length;
> -	var->green.length =3D fb->info.var.green.length;
> -	var->blue.length =3D fb->info.var.blue.length;
> +	var->grayscale =3D fb->info->var.grayscale;
> +	var->red.length =3D fb->info->var.red.length;
> +	var->green.length =3D fb->info->var.green.length;
> +	var->blue.length =3D fb->info->var.blue.length;
>
>   	return 0;
>   }
> @@ -947,7 +947,7 @@ static int
>   stifb_setcolreg(u_int regno, u_int red, u_int green,
>   	      u_int blue, u_int transp, struct fb_info *info)
>   {
> -	struct stifb_info *fb =3D container_of(info, struct stifb_info, info);
> +	struct stifb_info *fb =3D info->par;
>   	u32 color;
>
>   	if (regno >=3D NR_PALETTE)
> @@ -961,7 +961,7 @@ stifb_setcolreg(u_int regno, u_int red, u_int green,
>
>   	START_IMAGE_COLORMAP_ACCESS(fb);
>
> -	if (unlikely(fb->info.var.grayscale)) {
> +	if (unlikely(fb->info->var.grayscale)) {
>   		/* gray =3D 0.30*R + 0.59*G + 0.11*B */
>   		color =3D ((red * 77) +
>   			 (green * 151) +
> @@ -972,10 +972,10 @@ stifb_setcolreg(u_int regno, u_int red, u_int gree=
n,
>   			 (blue));
>   	}
>
> -	if (fb->info.fix.visual =3D=3D FB_VISUAL_DIRECTCOLOR) {
> -		struct fb_var_screeninfo *var =3D &fb->info.var;
> +	if (fb->info->fix.visual =3D=3D FB_VISUAL_DIRECTCOLOR) {
> +		struct fb_var_screeninfo *var =3D &fb->info->var;
>   		if (regno < 16)
> -			((u32 *)fb->info.pseudo_palette)[regno] =3D
> +			((u32 *)fb->info->pseudo_palette)[regno] =3D
>   				regno << var->red.offset |
>   				regno << var->green.offset |
>   				regno << var->blue.offset;
> @@ -1007,7 +1007,7 @@ stifb_setcolreg(u_int regno, u_int red, u_int gree=
n,
>   static int
>   stifb_blank(int blank_mode, struct fb_info *info)
>   {
> -	struct stifb_info *fb =3D container_of(info, struct stifb_info, info);
> +	struct stifb_info *fb =3D info->par;
>   	int enable =3D (blank_mode =3D=3D 0) ? ENABLE : DISABLE;
>
>   	switch (fb->id) {
> @@ -1036,12 +1036,12 @@ stifb_blank(int blank_mode, struct fb_info *info=
)
>   static void
>   stifb_copyarea(struct fb_info *info, const struct fb_copyarea *area)
>   {
> -	struct stifb_info *fb =3D container_of(info, struct stifb_info, info);
> +	struct stifb_info *fb =3D info->par;
>
>   	SETUP_COPYAREA(fb);
>
>   	SETUP_HW(fb);
> -	if (fb->info.var.bits_per_pixel =3D=3D 32) {
> +	if (fb->info->var.bits_per_pixel =3D=3D 32) {
>   		WRITE_WORD(0xBBA0A000, fb, REG_10);
>
>   		NGLE_REALLY_SET_IMAGE_PLANEMASK(fb, 0xffffffff);
> @@ -1075,15 +1075,15 @@ stifb_copyarea(struct fb_info *info, const struc=
t fb_copyarea *area)
>   static void
>   stifb_fillrect(struct fb_info *info, const struct fb_fillrect *rect)
>   {
> -	struct stifb_info *fb =3D container_of(info, struct stifb_info, info);
> +	struct stifb_info *fb =3D info->par;
>
>   	if (rect->rop !=3D ROP_COPY ||
> -	    (fb->id =3D=3D S9000_ID_HCRX && fb->info.var.bits_per_pixel =3D=3D=
 32))
> +	    (fb->id =3D=3D S9000_ID_HCRX && fb->info->var.bits_per_pixel =3D=
=3D 32))
>   		return cfb_fillrect(info, rect);
>
>   	SETUP_HW(fb);
>
> -	if (fb->info.var.bits_per_pixel =3D=3D 32) {
> +	if (fb->info->var.bits_per_pixel =3D=3D 32) {
>   		WRITE_WORD(0xBBA0A000, fb, REG_10);
>
>   		NGLE_REALLY_SET_IMAGE_PLANEMASK(fb, 0xffffffff);
> @@ -1141,7 +1141,7 @@ stifb_init_display(struct stifb_info *fb)
>           switch (id) {
>   	 case S9000_ID_A1659A:
>   	 case S9000_ID_A1439A:
> -	    if (fb->info.var.bits_per_pixel =3D=3D 32)
> +	    if (fb->info->var.bits_per_pixel =3D=3D 32)
>   		ngleSetupAttrPlanes(fb, BUFF1_CMAP3);
>   	    else {
>   		ngleSetupAttrPlanes(fb, BUFF1_CMAP0);
> @@ -1151,7 +1151,7 @@ stifb_init_display(struct stifb_info *fb)
>   	    break;
>   	 case S9000_ID_ARTIST:
>   	 case CRT_ID_VISUALIZE_EG:
> -	    if (fb->info.var.bits_per_pixel =3D=3D 32)
> +	    if (fb->info->var.bits_per_pixel =3D=3D 32)
>   		ngleSetupAttrPlanes(fb, BUFF1_CMAP3);
>   	    else {
>   		ngleSetupAttrPlanes(fb, ARTIST_CMAP0);
> @@ -1193,11 +1193,11 @@ static int __init stifb_init_fb(struct sti_struc=
t *sti, int bpp_pref)
>   	char *dev_name;
>   	int bpp, xres, yres;
>
> -	fb =3D kzalloc(sizeof(*fb), GFP_ATOMIC);
> -	if (!fb)
> +	info =3D framebuffer_alloc(sizeof(*fb), sti->dev);
> +	if (!info)
>   		return -ENOMEM;
> -
> -	info =3D &fb->info;
> +	fb =3D info->par;
> +	fb->info =3D info;
>
>   	/* set struct to a known state */
>   	fix =3D &info->fix;
> @@ -1390,10 +1390,10 @@ static int __init stifb_init_fb(struct sti_struc=
t *sti, int bpp_pref)
>
>   	/* save for primary gfx device detection & unregister_framebuffer() *=
/
>   	sti->info =3D info;
> -	if (register_framebuffer(&fb->info) < 0)
> +	if (register_framebuffer(fb->info) < 0)
>   		goto out_err4;
>
> -	fb_info(&fb->info, "%s %dx%d-%d frame buffer device, %s, id: %04x, mmi=
o: 0x%04lx\n",
> +	fb_info(fb->info, "%s %dx%d-%d frame buffer device, %s, id: %04x, mmio=
: 0x%04lx\n",
>   		fix->id,
>   		var->xres,
>   		var->yres,
> @@ -1402,6 +1402,8 @@ static int __init stifb_init_fb(struct sti_struct =
*sti, int bpp_pref)
>   		fb->id,
>   		fix->mmio_start);
>
> +	dev_set_drvdata(sti->dev, info);
> +
>   	return 0;
>
>
> @@ -1414,7 +1416,7 @@ static int __init stifb_init_fb(struct sti_struct =
*sti, int bpp_pref)
>   out_err1:
>   	iounmap(info->screen_base);
>   out_err0:
> -	kfree(fb);
> +	framebuffer_release(info);
>   	sti->info =3D NULL;
>   	return -ENXIO;
>   }
> @@ -1480,15 +1482,19 @@ stifb_cleanup(void)
>   		sti =3D sti_get_rom(i);
>   		if (!sti)
>   			break;
> -		if (sti->info) {
> -			struct fb_info *info =3D sti->info;
> -			unregister_framebuffer(sti->info);
> +		if (sti->dev) {
> +			struct fb_info *info =3D dev_get_drvdata(sti->dev);
> +
> +			if (!info)
> +				continue;
> +			unregister_framebuffer(info);
>   			release_mem_region(info->fix.mmio_start, info->fix.mmio_len);
>   		        release_mem_region(info->fix.smem_start, info->fix.smem_len)=
;
>   				if (info->screen_base)
>   					iounmap(info->screen_base);
>   		        fb_dealloc_cmap(&info->cmap);
>   		        framebuffer_release(info);
> +			dev_set_drvdata(sti->dev, NULL);
>   		}
>   		sti->info =3D NULL;
>   	}

