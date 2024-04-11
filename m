Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C42E8A1665
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 16:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44CB10F0F2;
	Thu, 11 Apr 2024 14:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IuYQoFWL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F51C10F0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 14:00:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9DF77CE2E07;
 Thu, 11 Apr 2024 14:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C7FC113CD;
 Thu, 11 Apr 2024 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712844022;
 bh=tRqmwlzhcYdgVr2YujS1WgTqkzUd0nEXs80I0voRZ+c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IuYQoFWLDW0TewoWOc1egpvTc7oRKlFdRDOxTdOO6mj8F+jf/LWNPnH6utlZMgCRp
 Wlm7VdDje7q00dBLqJawgrlJWje3n8r7h5914tgSM1R4vzFi/aElZWtaxhbFhhmRgC
 e58DoLz7Np5deIUBaY59yKM3JF4OYy/zVNTZAdncc0IZG9wlVf/Lp3ONzbho3qDhxA
 7PiLNDS4jimFjHuyBxgGXNcQIY7QPBXIJgMAFhYS1GK6mqT4LKEvKcSN1Nce0pzVqp
 IrVB4USDmK+/pPizmKeVnvc18vBGueLeCeNv0UC1glnbvyiNGiLZG0DyscUb1jvVjk
 uYc17bsqWwNLA==
Date: Thu, 11 Apr 2024 16:00:16 +0200
From: Helge Deller <deller@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] video: Handle HAS_IOPORT dependencies
Message-ID: <Zhfs8CN5XdgldKUn@carbonx1>
References: <20240410142329.3567824-1-schnelle@linux.ibm.com>
 <20240410142329.3567824-2-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410142329.3567824-2-schnelle@linux.ibm.com>
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

* Niklas Schnelle <schnelle@linux.ibm.com>:
> In a future patch HAS_IOPORT=n will disable inb()/outb() and friends at
> compile time. We thus need to #ifdef functions and their callsites which
> unconditionally use these I/O accessors. In the include/video/vga.h
> these are conveniently all those functions with the vga_io_* prefix.

Why don't you code it like in the patch below?
inb_p(), outb_p() and outw() would then need to be defined externally
without an implementation so that they would generate link time errors
(instead of compile time errors).

diff --git a/include/video/vga.h b/include/video/vga.h
index 947c0abd04ef..32c915e109fa 100644
--- a/include/video/vga.h
+++ b/include/video/vga.h
@@ -203,18 +203,20 @@ extern int restore_vga(struct vgastate *state);
 
 static inline unsigned char vga_io_r (unsigned short port)
 {
-	return inb_p(port);
+	return IS_ENABLED(CONFIG_HAS_IOPORT) ? inb_p(port) : 0;
 }
 
 static inline void vga_io_w (unsigned short port, unsigned char val)
 {
-	outb_p(val, port);
+	if (IS_ENABLED(CONFIG_HAS_IOPORT))
+		outb_p(val, port);
 }
 
 static inline void vga_io_w_fast (unsigned short port, unsigned char reg,
 				  unsigned char val)
 {
-	outw(VGA_OUT16VAL (val, reg), port);
+	if (IS_ENABLED(CONFIG_HAS_IOPORT))
+		outw(VGA_OUT16VAL (val, reg), port);
 }
 
 static inline unsigned char vga_mm_r (void __iomem *regbase, unsigned short port)



> 
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
> Note: This patch does not depend any not-yet-mainline HAS_IOPORT changes
> and may be merged via subsystem specific trees at your earliest
> convenience.
> 
>  include/video/vga.h | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/include/video/vga.h b/include/video/vga.h
> index 947c0abd04ef..ed89295941c4 100644
> --- a/include/video/vga.h
> +++ b/include/video/vga.h
> @@ -201,6 +201,7 @@ extern int restore_vga(struct vgastate *state);
>   * generic VGA port read/write
>   */
>  
> +#ifdef CONFIG_HAS_IOPORT
>  static inline unsigned char vga_io_r (unsigned short port)
>  {
>  	return inb_p(port);
> @@ -210,12 +211,12 @@ static inline void vga_io_w (unsigned short port, unsigned char val)
>  {
>  	outb_p(val, port);
>  }
> -
>  static inline void vga_io_w_fast (unsigned short port, unsigned char reg,
>  				  unsigned char val)
>  {
>  	outw(VGA_OUT16VAL (val, reg), port);
>  }
> +#endif /* CONFIG_HAS_IOPORT */
>  
>  static inline unsigned char vga_mm_r (void __iomem *regbase, unsigned short port)
>  {
> @@ -235,28 +236,34 @@ static inline void vga_mm_w_fast (void __iomem *regbase, unsigned short port,
>  
>  static inline unsigned char vga_r (void __iomem *regbase, unsigned short port)
>  {
> -	if (regbase)
> -		return vga_mm_r (regbase, port);
> -	else
> +#ifdef CONFIG_HAS_IOPORT
> +	if (!regbase)
>  		return vga_io_r (port);
> +	else
> +#endif /* CONFIG_HAS_IOPORT */
> +		return vga_mm_r (regbase, port);
>  }
>  
>  static inline void vga_w (void __iomem *regbase, unsigned short port, unsigned char val)
>  {
> -	if (regbase)
> -		vga_mm_w (regbase, port, val);
> -	else
> +#ifdef CONFIG_HAS_IOPORT
> +	if (!regbase)
>  		vga_io_w (port, val);
> +	else
> +#endif /* CONFIG_HAS_IOPORT */
> +		vga_mm_w (regbase, port, val);
>  }
>  
>  
>  static inline void vga_w_fast (void __iomem *regbase, unsigned short port,
>  			       unsigned char reg, unsigned char val)
>  {
> -	if (regbase)
> -		vga_mm_w_fast (regbase, port, reg, val);
> -	else
> +#ifdef CONFIG_HAS_IOPORT
> +	if (!regbase)
>  		vga_io_w_fast (port, reg, val);
> +	else
> +#endif /* CONFIG_HAS_IOPORT */
> +		vga_mm_w_fast (regbase, port, reg, val);
>  }
>  
>  
> @@ -280,6 +287,7 @@ static inline void vga_wcrt (void __iomem *regbase, unsigned char reg, unsigned
>  #endif /* VGA_OUTW_WRITE */
>  }
>  
> +#ifdef CONFIG_HAS_IOPORT
>  static inline unsigned char vga_io_rcrt (unsigned char reg)
>  {
>          vga_io_w (VGA_CRT_IC, reg);
> @@ -295,6 +303,7 @@ static inline void vga_io_wcrt (unsigned char reg, unsigned char val)
>          vga_io_w (VGA_CRT_DC, val);
>  #endif /* VGA_OUTW_WRITE */
>  }
> +#endif /* CONFIG_HAS_IOPORT */
>  
>  static inline unsigned char vga_mm_rcrt (void __iomem *regbase, unsigned char reg)
>  {
> @@ -333,6 +342,7 @@ static inline void vga_wseq (void __iomem *regbase, unsigned char reg, unsigned
>  #endif /* VGA_OUTW_WRITE */
>  }
>  
> +#ifdef CONFIG_HAS_IOPORT
>  static inline unsigned char vga_io_rseq (unsigned char reg)
>  {
>          vga_io_w (VGA_SEQ_I, reg);
> @@ -348,6 +358,7 @@ static inline void vga_io_wseq (unsigned char reg, unsigned char val)
>          vga_io_w (VGA_SEQ_D, val);
>  #endif /* VGA_OUTW_WRITE */
>  }
> +#endif /* CONFIG_HAS_IOPORT */
>  
>  static inline unsigned char vga_mm_rseq (void __iomem *regbase, unsigned char reg)
>  {
> @@ -385,6 +396,7 @@ static inline void vga_wgfx (void __iomem *regbase, unsigned char reg, unsigned
>  #endif /* VGA_OUTW_WRITE */
>  }
>  
> +#ifdef CONFIG_HAS_IOPORT
>  static inline unsigned char vga_io_rgfx (unsigned char reg)
>  {
>          vga_io_w (VGA_GFX_I, reg);
> @@ -400,6 +412,7 @@ static inline void vga_io_wgfx (unsigned char reg, unsigned char val)
>          vga_io_w (VGA_GFX_D, val);
>  #endif /* VGA_OUTW_WRITE */
>  }
> +#endif /* CONFIG_HAS_IOPORT */
>  
>  static inline unsigned char vga_mm_rgfx (void __iomem *regbase, unsigned char reg)
>  {
> @@ -434,6 +447,7 @@ static inline void vga_wattr (void __iomem *regbase, unsigned char reg, unsigned
>          vga_w (regbase, VGA_ATT_W, val);
>  }
>  
> +#ifdef CONFIG_HAS_IOPORT
>  static inline unsigned char vga_io_rattr (unsigned char reg)
>  {
>          vga_io_w (VGA_ATT_IW, reg);
> @@ -445,6 +459,7 @@ static inline void vga_io_wattr (unsigned char reg, unsigned char val)
>          vga_io_w (VGA_ATT_IW, reg);
>          vga_io_w (VGA_ATT_W, val);
>  }
> +#endif /* CONFIG_HAS_IOPORT */
>  
>  static inline unsigned char vga_mm_rattr (void __iomem *regbase, unsigned char reg)
>  {
> -- 
> 2.40.1
> 
