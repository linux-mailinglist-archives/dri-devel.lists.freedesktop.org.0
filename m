Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9B66FCDCF
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 20:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880B510E191;
	Tue,  9 May 2023 18:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A465E10E191
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 18:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1683656982; i=deller@gmx.de;
 bh=GiWI3Edh7sWglYAYGfC4soQTRvcJh05ZXPMtNAs7CPo=;
 h=X-UI-Sender-Class:Date:From:To:Subject;
 b=mdIBE5Ysybm1WhiIDRAwHD2YByI9KCNrLSR6RfYoceMM/DQHmDOF0GaJpc14l7mJu
 o/XYr8Kfl6Y21zvjKOacFnasExCiXQIZcKzeQNP5Bu4mcjGnJumbMHihuiXtoZQPo8
 gftqW9Kub2EFBCVZ+O2197afu2ISu5iRtlDK+9mWz48KY+evbo6Qkhk/aFW07+9uPo
 7E8COG7BX4WT/+OSTc1q4xBtTLlnUjMNLdobXf631bwDZ1FbquqSrcV/xG5LMIMAfu
 SAKk+xkQVO/bJOMuHt4otu2oubCUt5WOWWKEDk0xJPkHtB10luf+ylIBqFfwLWPQg5
 i6TP3kHHJMXoA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([94.134.153.17]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbkp-1pY3EN0BHH-00P93o; Tue, 09
 May 2023 20:24:28 +0200
Date: Tue, 9 May 2023 20:24:26 +0200
From: Helge Deller <deller@gmx.de>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-parisc@vger.kernel.org
Subject: [PATCH v2] console/parisc: Fix STI console on 64-bit only machines
Message-ID: <ZFqP2m37YAraBLdF@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:MdiJgZwW+w4XLsQvnDIcAS/cQOITDS/Fpg79dBvIw3uUj3Aomu6
 CUNlne8ygvlwkIEGYXstDGt4Aq5qNZHroPjjkV0Y6tAJq6FjhYSItx8kHMuopRjNa2GwaJO
 kXEfhSBL+3KhTwtBkEaJ/9ebAeHIA2ITxzCx8n8novgLtN0d4zlKC8giv1EnCRplKLQeu79
 25nL6qXGQRNNijyvqCxGA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PqQ4GiWJ2fw=;FktPBVbOVtgnu6TBOMcute6oij/
 4wIC5u0YIMcfKgUgCdkcO3WVSH574perVvkra/BmuHBd8CdGTpO1bq7Dr/AT3PKrfxtJtA+To
 oR4OmaA9DdhMzPoUT9syRSnP91Zc1jA/wf0+f1p2X1Itb+c87EvEVsJDQPOSVHuu/dB+8vmWr
 lgkGY+47Z/RQtmGZAQKsYRb+wlVzUSzc5Xg5sqoq/yo2PL9wOwRMWNutAIPz9TTykcCbHeJwM
 jokqIwntjkLUzyr2IjS+MHYN6NBiM8K3FeIhShDkxU6rBt5GleJg5GT4yxpHNKaEE8/WGBm+P
 YV/jVsjLpGQvM+i2vzi13w4P1zfDTsjL7zguc0ysXn8B7j47dPSrT6f0Ucg8Ud36RCmfUiNTv
 NHEpUlVB8gM30GNFMTDGJR/zyr4LN9kZGZ+WH/HOIKBX9n1BtP4m7A8qebbwLKweQiveQ5lV/
 +xr0Pi5evKSKNmj8Zef65GvvDkhi0BFfw6Pk3GnFFt6MIfiDm8G1lvRhNSjgUs9iSFf3PiI0m
 fJGHlRR0SOaDSrVz6m7DSodWGTK/muVPt+iF4bZl4RXIHRga1MoBvqz9XAttKeV6MfUCTmdd5
 JGD4NMr6j2B0i9zXfjcU+U+6uHErwZsmZzviJfw1ZHYwMMvR6n8WOIpSuJa1pY2IQi/9MzZ/M
 3HIWThtjBjS1BUCnTSSUjokW/Apki5hk+eWcSOSQRKgy2LCtN1YYj0jV/RjEswhMxXoIBiCUA
 DTDeWZ3QIFeJaY6MlUpDRIFKv2p/BqaCQJjBnvjTEitSjiOGv56ljOChOViStVBpgW43UNyTA
 q9GovSvJ2+fEMKp4UgBR7qTYAEJpu6F1bKjB5cPpaF9EDbzJlGFV+4dOJvUemHSbYfajhSI1L
 KOhvykEke4502h/TjqfjH8eeEMbUMl7ypgjWH5KdHzhIEb3Nfg86iDs+usmx12de7zB2rQEJq
 Zu4WhW4guW/fS8TQSdL7ZL69RBI=
Content-Transfer-Encoding: quoted-printable
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

Fix the STI console to be able to execute either the 64-bit STI ROM code
or the 32-bit STI ROM code.

This is necessary on 64-bit only machines (e.g. C8000 workstation) which
otherwise won't show the STI text console on HP graphic cards like
Visualize-FX5/FX10/FXe.

When calling 32-bit code from a 64-bit kernel one may need to copy
contents on the CPU stack from high memory down below the 4GB limit.

Signed-off-by: Helge Deller <deller@gmx.de>

=2D--
v2: Forward-ported to apply cleanly on drm-misc-next git tree

diff --git a/arch/parisc/include/asm/pdc.h b/arch/parisc/include/asm/pdc.h
index 2b4fad8328e8..269b9a159f01 100644
=2D-- a/arch/parisc/include/asm/pdc.h
+++ b/arch/parisc/include/asm/pdc.h
@@ -88,8 +88,8 @@ int pdc_iodc_print(const unsigned char *str, unsigned co=
unt);

 void pdc_emergency_unlock(void);
 int pdc_sti_call(unsigned long func, unsigned long flags,
-                 unsigned long inptr, unsigned long outputr,
-                 unsigned long glob_cfg);
+		unsigned long inptr, unsigned long outputr,
+		unsigned long glob_cfg, int do_call64);

 int __pdc_cpu_rendezvous(void);
 void pdc_cpu_rendezvous_lock(void);
diff --git a/arch/parisc/kernel/firmware.c b/arch/parisc/kernel/firmware.c
index cc124d9f1f7f..71ef1640db5a 100644
=2D-- a/arch/parisc/kernel/firmware.c
+++ b/arch/parisc/kernel/firmware.c
@@ -1389,17 +1389,24 @@ int pdc_iodc_getc(void)
 }

 int pdc_sti_call(unsigned long func, unsigned long flags,
-                 unsigned long inptr, unsigned long outputr,
-                 unsigned long glob_cfg)
+		unsigned long inptr, unsigned long outputr,
+		unsigned long glob_cfg, int do_call64)
 {
-        int retval;
+	int retval =3D 0;
 	unsigned long irqflags;

-        spin_lock_irqsave(&pdc_lock, irqflags);
-        retval =3D real32_call(func, flags, inptr, outputr, glob_cfg);
-        spin_unlock_irqrestore(&pdc_lock, irqflags);
+	spin_lock_irqsave(&pdc_lock, irqflags);
+	if (IS_ENABLED(CONFIG_64BIT) && do_call64) {
+#ifdef CONFIG_64BIT
+		retval =3D real64_call(func, flags, inptr, outputr, glob_cfg);
+#else
+		WARN_ON(1);
+#endif
+	} else
+		retval =3D real32_call(func, flags, inptr, outputr, glob_cfg);
+	spin_unlock_irqrestore(&pdc_lock, irqflags);

-        return retval;
+	return retval;
 }
 EXPORT_SYMBOL(pdc_sti_call);

diff --git a/drivers/video/fbdev/stifb.c b/drivers/video/fbdev/stifb.c
index baca6974e288..fe54ca8726e6 100644
=2D-- a/drivers/video/fbdev/stifb.c
+++ b/drivers/video/fbdev/stifb.c
@@ -71,9 +71,9 @@

 #include <video/sticore.h>

-/* REGION_BASE(fb_info, index) returns the virtual address for region <in=
dex> */
+/* REGION_BASE(fb_info, index) returns the physical address for region <i=
ndex> */
 #define REGION_BASE(fb_info, index) \
-	F_EXTEND(fb_info->sti->glob_cfg->region_ptrs[index])
+	F_EXTEND(fb_info->sti->regions_phys[index])

 #define NGLEDEVDEPROM_CRT_REGION 1

diff --git a/drivers/video/sticore.c b/drivers/video/sticore.c
index 7eb925f2ba9c..7a57dacbb15c 100644
=2D-- a/drivers/video/sticore.c
+++ b/drivers/video/sticore.c
@@ -4,7 +4,7 @@
  *	core code for console driver using HP's STI firmware
  *
  *	Copyright (C) 2000 Philipp Rumpf <prumpf@tux.org>
- *	Copyright (C) 2001-2020 Helge Deller <deller@gmx.de>
+ *	Copyright (C) 2001-2023 Helge Deller <deller@gmx.de>
  *	Copyright (C) 2001-2002 Thomas Bogendoerfer <tsbogend@alpha.franken.de=
>
  *
  * TODO:
@@ -41,6 +41,26 @@ static struct sti_struct *default_sti __read_mostly;
 static int num_sti_roms __read_mostly;
 static struct sti_struct *sti_roms[MAX_STI_ROMS] __read_mostly;

+static void *store_sti_val(struct sti_struct *sti, void *ptr, unsigned lo=
ng val)
+{
+	if (IS_ENABLED(CONFIG_64BIT) && sti->do_call64) {
+		/* used for 64-bit STI ROM */
+		unsigned long *ptr64 =3D ptr;
+
+		ptr64 =3D PTR_ALIGN(ptr64, sizeof(void *));
+		*ptr64++ =3D val;
+		return ptr64;
+	} else {
+		/* used for 32-bit STI ROM */
+		u32 *ptr32 =3D ptr;
+
+		*ptr32++ =3D val;
+		return ptr32;
+	}
+}
+
+#define store_sti_ptr(sti, dest, ptr)	\
+		store_sti_val(sti, dest, STI_PTR(ptr))

 /* The colour indices used by STI are
  *   0 - Black
@@ -87,7 +107,7 @@ static int sti_init_graph(struct sti_struct *sti)
 	memset(inptr, 0, sizeof(*inptr));
 	inptr->text_planes =3D 3; /* # of text planes (max 3 for STI) */
 	memset(inptr_ext, 0, sizeof(*inptr_ext));
-	inptr->ext_ptr =3D STI_PTR(inptr_ext);
+	store_sti_ptr(sti, &inptr->ext_ptr, inptr_ext);
 	outptr->errno =3D 0;

 	ret =3D sti_call(sti, sti->init_graph, &default_init_flags, inptr,
@@ -118,7 +138,7 @@ static void sti_inq_conf(struct sti_struct *sti)
 	unsigned long flags;
 	s32 ret;

-	outptr->ext_ptr =3D STI_PTR(&sti->sti_data->inq_outptr_ext);
+	store_sti_ptr(sti, &outptr->ext_ptr, &sti->sti_data->inq_outptr_ext);

 	do {
 		spin_lock_irqsave(&sti->lock, flags);
@@ -138,9 +158,9 @@ void
 sti_putc(struct sti_struct *sti, int c, int y, int x,
 	 struct sti_cooked_font *font)
 {
-	struct sti_font_inptr *inptr =3D &sti->sti_data->font_inptr;
+	struct sti_font_inptr *inptr;
 	struct sti_font_inptr inptr_default =3D {
-		.font_start_addr =3D STI_PTR(font->raw),
+		.font_start_addr =3D (void *)STI_PTR(font->raw),
 		.index		=3D c_index(sti, c),
 		.fg_color	=3D c_fg(sti, c),
 		.bg_color	=3D c_bg(sti, c),
@@ -153,7 +173,14 @@ sti_putc(struct sti_struct *sti, int c, int y, int x,

 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		*inptr =3D inptr_default;
+		inptr =3D &inptr_default;
+		if (IS_ENABLED(CONFIG_64BIT) && !sti->do_call64) {
+			/* copy below 4G if calling 32-bit on LP64 kernel */
+			inptr =3D &sti->sti_data->font_inptr;
+			*inptr =3D inptr_default;
+			/* skip first 4 bytes for 32-bit STI call */
+			inptr =3D (void *)(((unsigned long)inptr) + sizeof(u32));
+		}
 		ret =3D sti_call(sti, sti->font_unpmv, &default_font_flags,
 			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
@@ -170,7 +197,7 @@ void
 sti_set(struct sti_struct *sti, int src_y, int src_x,
 	int height, int width, u8 color)
 {
-	struct sti_blkmv_inptr *inptr =3D &sti->sti_data->blkmv_inptr;
+	struct sti_blkmv_inptr *inptr;
 	struct sti_blkmv_inptr inptr_default =3D {
 		.fg_color	=3D color,
 		.bg_color	=3D color,
@@ -187,7 +214,12 @@ sti_set(struct sti_struct *sti, int src_y, int src_x,

 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		*inptr =3D inptr_default;
+		inptr =3D &inptr_default;
+		if (IS_ENABLED(CONFIG_64BIT) && !sti->do_call64) {
+			/* copy below 4G if calling 32-bit on LP64 kernel */
+			inptr =3D &sti->sti_data->blkmv_inptr;
+			*inptr =3D inptr_default;
+		}
 		ret =3D sti_call(sti, sti->block_move, &clear_blkmv_flags,
 			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
@@ -198,7 +230,7 @@ void
 sti_clear(struct sti_struct *sti, int src_y, int src_x,
 	  int height, int width, int c, struct sti_cooked_font *font)
 {
-	struct sti_blkmv_inptr *inptr =3D &sti->sti_data->blkmv_inptr;
+	struct sti_blkmv_inptr *inptr;
 	struct sti_blkmv_inptr inptr_default =3D {
 		.fg_color	=3D c_fg(sti, c),
 		.bg_color	=3D c_bg(sti, c),
@@ -215,7 +247,12 @@ sti_clear(struct sti_struct *sti, int src_y, int src_=
x,

 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		*inptr =3D inptr_default;
+		inptr =3D &inptr_default;
+		if (IS_ENABLED(CONFIG_64BIT) && !sti->do_call64) {
+			/* copy below 4G if calling 32-bit on LP64 kernel */
+			inptr =3D &sti->sti_data->blkmv_inptr;
+			*inptr =3D inptr_default;
+		}
 		ret =3D sti_call(sti, sti->block_move, &clear_blkmv_flags,
 			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
@@ -231,7 +268,7 @@ sti_bmove(struct sti_struct *sti, int src_y, int src_x=
,
 	  int dst_y, int dst_x, int height, int width,
 	  struct sti_cooked_font *font)
 {
-	struct sti_blkmv_inptr *inptr =3D &sti->sti_data->blkmv_inptr;
+	struct sti_blkmv_inptr *inptr;
 	struct sti_blkmv_inptr inptr_default =3D {
 		.src_x		=3D src_x * font->width,
 		.src_y		=3D src_y * font->height,
@@ -246,7 +283,12 @@ sti_bmove(struct sti_struct *sti, int src_y, int src_=
x,

 	do {
 		spin_lock_irqsave(&sti->lock, flags);
-		*inptr =3D inptr_default;
+		inptr =3D &inptr_default;
+		if (IS_ENABLED(CONFIG_64BIT) && !sti->do_call64) {
+			/* copy below 4G if calling 32-bit on LP64 kernel */
+			inptr =3D &sti->sti_data->blkmv_inptr;
+			*inptr =3D inptr_default;
+		}
 		ret =3D sti_call(sti, sti->block_move, &default_blkmv_flags,
 			inptr, outptr, sti->glob_cfg);
 		spin_unlock_irqrestore(&sti->lock, flags);
@@ -359,42 +401,31 @@ __setup("sti_font=3D", sti_font_setup);



-static void sti_dump_globcfg(struct sti_glob_cfg *glob_cfg,
-			     unsigned int sti_mem_request)
+static void sti_dump_globcfg(struct sti_struct *sti)
 {
-	struct sti_glob_cfg_ext *cfg;
+	struct sti_glob_cfg *glob_cfg =3D sti->glob_cfg;
+	struct sti_glob_cfg_ext *cfg =3D &sti->sti_data->glob_cfg_ext;

 	pr_debug("%d text planes\n"
 		"%4d x %4d screen resolution\n"
 		"%4d x %4d offscreen\n"
-		"%4d x %4d layout\n"
-		"regions at %08x %08x %08x %08x\n"
-		"regions at %08x %08x %08x %08x\n"
-		"reent_lvl %d\n"
-		"save_addr %08x\n",
+		"%4d x %4d layout\n",
 		glob_cfg->text_planes,
 		glob_cfg->onscreen_x, glob_cfg->onscreen_y,
 		glob_cfg->offscreen_x, glob_cfg->offscreen_y,
-		glob_cfg->total_x, glob_cfg->total_y,
-		glob_cfg->region_ptrs[0], glob_cfg->region_ptrs[1],
-		glob_cfg->region_ptrs[2], glob_cfg->region_ptrs[3],
-		glob_cfg->region_ptrs[4], glob_cfg->region_ptrs[5],
-		glob_cfg->region_ptrs[6], glob_cfg->region_ptrs[7],
-		glob_cfg->reent_lvl,
-		glob_cfg->save_addr);
+		glob_cfg->total_x, glob_cfg->total_y);

 	/* dump extended cfg */
-	cfg =3D PTR_STI((unsigned long)glob_cfg->ext_ptr);
 	pr_debug("monitor %d\n"
 		"in friendly mode: %d\n"
 		"power consumption %d watts\n"
 		"freq ref %d\n"
-		"sti_mem_addr %08x (size=3D%d bytes)\n",
+		"sti_mem_addr %px (size=3D%d bytes)\n",
 		cfg->curr_mon,
 		cfg->friendly_boot,
 		cfg->power,
 		cfg->freq_ref,
-		cfg->sti_mem_addr, sti_mem_request);
+		cfg->sti_mem_addr, sti->sti_mem_request);
 }

 static void sti_dump_outptr(struct sti_struct *sti)
@@ -414,7 +445,7 @@ static int sti_init_glob_cfg(struct sti_struct *sti, u=
nsigned long rom_address,
 {
 	struct sti_glob_cfg *glob_cfg;
 	struct sti_glob_cfg_ext *glob_cfg_ext;
-	void *save_addr;
+	void *save_addr, *ptr;
 	void *sti_mem_addr;
 	int i, size;

@@ -432,9 +463,7 @@ static int sti_init_glob_cfg(struct sti_struct *sti, u=
nsigned long rom_address,
 	save_addr	=3D &sti->sti_data->save_addr;
 	sti_mem_addr	=3D &sti->sti_data->sti_mem_addr;

-	glob_cfg->ext_ptr =3D STI_PTR(glob_cfg_ext);
-	glob_cfg->save_addr =3D STI_PTR(save_addr);
-	for (i=3D0; i<8; i++) {
+	for (i =3D 0; i < STI_REGION_MAX; i++) {
 		unsigned long newhpa, len;

 		if (sti->pd) {
@@ -457,13 +486,10 @@ static int sti_init_glob_cfg(struct sti_struct *sti,=
 unsigned long rom_address,
 			REGION_OFFSET_TO_PHYS(sti->regions[i], newhpa);

 		len =3D sti->regions[i].region_desc.length * 4096;
-		if (len)
-			glob_cfg->region_ptrs[i] =3D sti->regions_phys[i];

-		pr_debug("region #%d: phys %08lx, region_ptr %08x, len=3D%lukB, "
+		pr_debug("region #%d: phys %08lx, len=3D%lukB, "
 			 "btlb=3D%d, sysonly=3D%d, cache=3D%d, last=3D%d\n",
-			i, sti->regions_phys[i], glob_cfg->region_ptrs[i],
-			len/1024,
+			i, sti->regions_phys[i], len/1024,
 			sti->regions[i].region_desc.btlb,
 			sti->regions[i].region_desc.sys_only,
 			sti->regions[i].region_desc.cache,
@@ -474,11 +500,16 @@ static int sti_init_glob_cfg(struct sti_struct *sti,=
 unsigned long rom_address,
 			break;
 	}

-	if (++i<8 && sti->regions[i].region)
-		pr_warn("future ptr (0x%8x) not yet supported !\n",
-			sti->regions[i].region);
+	ptr =3D &glob_cfg->region_ptrs;
+	for (i =3D 0; i < STI_REGION_MAX; i++)
+		ptr =3D store_sti_val(sti, ptr, sti->regions_phys[i]);
+
+	*(s32 *)ptr =3D 0;	/* set reent_lvl */
+	ptr +=3D sizeof(s32);
+	ptr =3D store_sti_ptr(sti, ptr, save_addr);
+	ptr =3D store_sti_ptr(sti, ptr, glob_cfg_ext);

-	glob_cfg_ext->sti_mem_addr =3D STI_PTR(sti_mem_addr);
+	store_sti_ptr(sti, &glob_cfg_ext->sti_mem_addr, sti_mem_addr);

 	sti->glob_cfg =3D glob_cfg;

@@ -802,10 +833,19 @@ static int sti_read_rom(int wordmode, struct sti_str=
uct *sti,
 		raw->alt_code_type =3D=3D ALT_CODE_TYPE_PA_RISC_64
 		? "and 64 " : "");

-	sti->font_unpmv =3D address + (raw->font_unpmv & 0x03ffffff);
-	sti->block_move =3D address + (raw->block_move & 0x03ffffff);
-	sti->init_graph =3D address + (raw->init_graph & 0x03ffffff);
-	sti->inq_conf   =3D address + (raw->inq_conf   & 0x03ffffff);
+	if (IS_ENABLED(CONFIG_64BIT) &&
+	    raw->alt_code_type =3D=3D ALT_CODE_TYPE_PA_RISC_64) {
+		sti->do_call64 =3D 1;
+		sti->font_unpmv =3D address + (raw->font_unp_addr   & 0x03ffffff);
+		sti->block_move =3D address + (raw->block_move_addr & 0x03ffffff);
+		sti->init_graph =3D address + (raw->init_graph_addr & 0x03ffffff);
+		sti->inq_conf   =3D address + (raw->inq_conf_addr   & 0x03ffffff);
+	} else {
+		sti->font_unpmv =3D address + (raw->font_unpmv & 0x03ffffff);
+		sti->block_move =3D address + (raw->block_move & 0x03ffffff);
+		sti->init_graph =3D address + (raw->init_graph & 0x03ffffff);
+		sti->inq_conf   =3D address + (raw->inq_conf   & 0x03ffffff);
+	}

 	sti->rom =3D cooked;
 	sti->rom->raw =3D raw;
@@ -818,7 +858,13 @@ static int sti_read_rom(int wordmode, struct sti_stru=
ct *sti,
 	sti_font_convert_bytemode(sti, sti->font);
 	sti_dump_font(sti->font);

+	pr_info("    using %d-bit STI ROM functions\n",
+		(IS_ENABLED(CONFIG_64BIT) && sti->do_call64) ? 64:32);
+
 	sti->sti_mem_request =3D raw->sti_mem_req;
+	pr_debug("    mem_request =3D %d,  reentsize %d\n",
+		sti->sti_mem_request, raw->reentsize);
+
 	sti->graphics_id[0] =3D raw->graphics_id[0];
 	sti->graphics_id[1] =3D raw->graphics_id[1];

@@ -876,10 +922,12 @@ static struct sti_struct *sti_try_rom_generic(unsign=
ed long address,
 	spin_lock_init(&sti->lock);

 test_rom:
-	/* if we can't read the ROM, bail out early.  Not being able
-	 * to read the hpa is okay, for romless sti */
-	if (pdc_add_valid(address))
+	/* pdc_add_valid() works only on 32-bit kernels */
+	if ((!IS_ENABLED(CONFIG_64BIT) ||
+	     (boot_cpu_data.pdc.capabilities & PDC_MODEL_OS32)) &&
+	    pdc_add_valid(address)) {
 		goto out_err;
+	}

 	sig =3D gsc_readl(address);

@@ -949,7 +997,7 @@ static struct sti_struct *sti_try_rom_generic(unsigned=
 long address,
 		goto out_err;

 	sti_inq_conf(sti);
-	sti_dump_globcfg(sti->glob_cfg, sti->sti_mem_request);
+	sti_dump_globcfg(sti);
 	sti_dump_outptr(sti);

 	pr_info("    graphics card name: %s\n",
@@ -1141,8 +1189,8 @@ int sti_call(const struct sti_struct *sti, unsigned =
long func,
 			"Out of 32bit-range pointers!"))
 		return -1;
 #endif
-
-	ret =3D pdc_sti_call(func, _flags, _inptr, _outptr, _glob_cfg);
+	ret =3D pdc_sti_call(func, _flags, _inptr, _outptr, _glob_cfg,
+		sti->do_call64);

 	return ret;
 }
diff --git a/include/video/sticore.h b/include/video/sticore.h
index fbb78d7e7565..945ad60463a1 100644
=2D-- a/include/video/sticore.h
+++ b/include/video/sticore.h
@@ -39,7 +39,6 @@ struct fb_info;
 #define STI_WAIT 1

 #define STI_PTR(p)	( virt_to_phys(p) )
-#define PTR_STI(p)	( phys_to_virt((unsigned long)p) )

 #define sti_onscreen_x(sti) (sti->glob_cfg->onscreen_x)
 #define sti_onscreen_y(sti) (sti->glob_cfg->onscreen_y)
@@ -78,8 +77,8 @@ struct sti_glob_cfg_ext {
 	 u8 friendly_boot;		/* in friendly boot mode */
 	s16 power;			/* power calculation (in Watts) */
 	s32 freq_ref;			/* frequency reference */
-	u32 sti_mem_addr;		/* pointer to global sti memory (size=3Dsti_mem_reque=
st) */
-	u32 future_ptr; 		/* pointer to future data */
+	u32 *sti_mem_addr;		/* pointer to global sti memory (size=3Dsti_mem_requ=
est) */
+	u32 *future_ptr;		/* pointer to future data */
 };

 struct sti_glob_cfg {
@@ -90,10 +89,10 @@ struct sti_glob_cfg {
 	s16 offscreen_y;		/* offset height in pixels */
 	s16 total_x;			/* frame buffer width in pixels */
 	s16 total_y;			/* frame buffer height in pixels */
-	u32 region_ptrs[STI_REGION_MAX]; /* region pointers */
+	u32 *region_ptrs[STI_REGION_MAX]; /* region pointers */
 	s32 reent_lvl;			/* storage for reentry level value */
-	u32 save_addr;			/* where to save or restore reentrant state */
-	u32 ext_ptr;			/* pointer to extended glob_cfg data structure */
+	u32 *save_addr;			/* where to save or restore reentrant state */
+	u32 *ext_ptr;			/* pointer to extended glob_cfg data structure */
 };


@@ -119,26 +118,26 @@ struct sti_init_flags {
 	u32 caller_kernel : 1;	/* set only by kernel for each call */
 	u32 caller_other : 1;	/* set only by non-[BR/K] caller */
 	u32 pad	: 14;		/* pad to word boundary */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr;	/* pointer to future data */
 };

 struct sti_init_inptr_ext {
 	u8  config_mon_type;	/* configure to monitor type */
 	u8  pad[1];		/* pad to word boundary */
 	u16 inflight_data;	/* inflight data possible on PCI */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr;	/* pointer to future data */
 };

 struct sti_init_inptr {
 	s32 text_planes;	/* number of planes to use for text */
-	u32 ext_ptr;		/* pointer to extended init_graph inptr data structure*/
+	u32 *ext_ptr;		/* pointer to extended init_graph inptr data structure*/
 };


 struct sti_init_outptr {
 	s32 errno;		/* error number on failure */
 	s32 text_planes;	/* number of planes used for text */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr;	/* pointer to future data */
 };


@@ -148,17 +147,17 @@ struct sti_init_outptr {
 struct sti_conf_flags {
 	u32 wait : 1;		/* should routine idle wait or not */
 	u32 pad : 31;		/* pad to word boundary */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr;	/* pointer to future data */
 };

 struct sti_conf_inptr {
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr;	/* pointer to future data */
 };

 struct sti_conf_outptr_ext {
 	u32 crt_config[3];	/* hardware specific X11/OGL information */
 	u32 crt_hdw[3];
-	u32 future_ptr;
+	u32 *future_ptr;
 };

 struct sti_conf_outptr {
@@ -174,7 +173,7 @@ struct sti_conf_outptr {
 	s32 planes;		/* number of fb planes in system */
 	 u8 dev_name[STI_DEV_NAME_LENGTH]; /* null terminated product name */
 	u32 attributes;		/* flags denoting attributes */
-	u32 ext_ptr;		/* pointer to future data */
+	u32 *ext_ptr;		/* pointer to future data */
 };

 struct sti_rom {
@@ -258,25 +257,25 @@ struct sti_cooked_rom {
 /* STI font printing function structs */

 struct sti_font_inptr {
-	u32 font_start_addr;	/* address of font start */
+	u32 *font_start_addr;	/* address of font start */
 	s16 index;		/* index into font table of character */
 	u8 fg_color;		/* foreground color of character */
 	u8 bg_color;		/* background color of character */
 	s16 dest_x;		/* X location of character upper left */
 	s16 dest_y;		/* Y location of character upper left */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr;	/* pointer to future data */
 };

 struct sti_font_flags {
 	u32 wait : 1;		/* should routine idle wait or not */
 	u32 non_text : 1;	/* font unpack/move in non_text planes =3D1, text =3D0=
 */
 	u32 pad : 30;		/* pad to word boundary */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr;	/* pointer to future data */
 };

 struct sti_font_outptr {
 	s32 errno;		/* error number on failure */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr;	/* pointer to future data */
 };

 /* STI blockmove structs */
@@ -287,7 +286,7 @@ struct sti_blkmv_flags {
 	u32 clear : 1;		/* clear during move? */
 	u32 non_text : 1;	/* block move in non_text planes =3D1, text =3D0 */
 	u32 pad : 28;		/* pad to word boundary */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr;	/* pointer to future data */
 };

 struct sti_blkmv_inptr {
@@ -299,12 +298,12 @@ struct sti_blkmv_inptr {
 	s16 dest_y;		/* dest upper left pixel y location */
 	s16 width;		/* block width in pixels */
 	s16 height;		/* block height in pixels */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr;	/* pointer to future data */
 };

 struct sti_blkmv_outptr {
 	s32 errno;		/* error number on failure */
-	u32 future_ptr; 	/* pointer to future data */
+	u32 *future_ptr;	/* pointer to future data */
 };


@@ -351,6 +350,7 @@ struct sti_struct {
 	unsigned long block_move;
 	unsigned long init_graph;
 	unsigned long inq_conf;
+	int do_call64;			/* call 64-bit code */

 	/* all following fields are initialized by the generic routines */
 	int text_planes;
