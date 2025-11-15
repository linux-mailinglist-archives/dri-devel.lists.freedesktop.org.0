Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A063C6011D
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 08:31:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6D610E0C6;
	Sat, 15 Nov 2025 07:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fPcbfF5e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BFB10E0C6
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 07:31:25 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-6419b7b4b80so3941172a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763191884; x=1763796684; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1GthNzvU7oIYpZFVMhRNcIwup0JI2wPPRFd6se98Fvw=;
 b=fPcbfF5ejUnLJM3zHxaNTXsBm+40GCSzY3ogBULcxPEZDUzvgh28QYoUjvpjk/xd3+
 Ix5QDbd6ue4xRqzQJpOjVU6s4hVtsHHb+HL2BWYH/vT1dWL/KtkzsWno8z7I7IRN7cbY
 tRPCZ97waa5uebNlokdCm0SZKR0/8glyRcionV8YjWEvKDtSfW74tkIqQLGUQNpncFKg
 I483ru6c4dbMIW24eDTckxQjO/hYGqs8FyroMUoIIvfxCzFVxv//ezErIdMMGTPZq6nj
 AHh7vIF3ut5akzvBdqieRRRmpLzNsCQoftJ45R6wHV9Cg2i3TpPxcENp3+m307nepNLx
 IxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763191884; x=1763796684;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1GthNzvU7oIYpZFVMhRNcIwup0JI2wPPRFd6se98Fvw=;
 b=FK3UDu3zj8Tym3HkQmPWJkv/pmi7dkHNYaiwX7zhu8aymAzQvQXMrDxo0GbOVjRn0H
 ldjtUiE9Zr9gN1cP7VkY3HnVj7pxuhtlxz11xKyqvHXMo9goQ9RhahxipS+nzo8FlRb9
 JvdIebf5I4pATHLil6bd+Jbq2LTyRQFdBA8qKcKcKXTnhOEnVdB/96btkTWihGDQCeRL
 nqqQwAeiM5zb8dMX7XP/bXnLsHdlConEdFE6q4M36SI/h7ItVADzXkpv6xQ4SfFvs9wv
 Er7iaH64NirjI2IbaMJIJsa7xBEJzrC2hHES0QR05blLG5L7ybbaz1ruPEh5HPH48Cob
 xqdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIMcv4pTpfOXUG21EKOi0PUPL8UWGR0sivnihGTxtqko3ap1qC9IiTdRg+dAqVxXQubu93aoYn8ZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUppIZeskMducOCqdMKhAfzdKBvBLi/Vyd9/2fzomgZ6sOVQwQ
 cUJsh6qTvNnKhft3LZN53AkY/l5IjenyW/1SO/2uIVx+kdyEImNBjku05vzz+yk6GMVb384GHV6
 63oyb2gasHgKeKmR5W7+/SnPeagvvHto=
X-Gm-Gg: ASbGncvQD/gfM/POFtTRmIxcO4s3cqfPmQvGjCEuRqd1COAi4u3fpLeBvp7NfD5hycX
 OTnKQ8uMfhqpoYtxh+QLwfbolFCt7uiS3u8EaJMFF5IwjNFv4B9CgjCpeI4t+Agb5Jc9vUSa1PY
 LWoCD8+49iaidkyyszzlcVD8dUQ+g9WVY98evnETTBAoUSOkGWGT3f2JCr0YSvV8eVBLZqDFraM
 Tqj1Y20ceDp+iLunPgzL69nL1RigK7PYuDWsxAm+hG2uRapMHzvkMf0dnjxSZ568WKSS6YpfWLO
 Z4O8lXIk6rN/5GcebUy+cJqn
X-Google-Smtp-Source: AGHT+IHeQM7ska+yl8ZfByGr4aIQ8nWV7A0qqzSGCvXBmMDkvmobczaDf2bIGmtPK1vTSc5h13fGDlsqSNTRmjJYcJ8=
X-Received: by 2002:a17:906:c18:b0:b73:6d57:3e06 with SMTP id
 a640c23a62f3a-b736d573f0fmr368135966b.7.1763191884278; Fri, 14 Nov 2025
 23:31:24 -0800 (PST)
MIME-Version: 1.0
References: <f9998d60-e532-48ae-8e03-d867cc0ec847@gmx.de>
 <20251108093348.2842180-1-rampxxxx@gmail.com>
In-Reply-To: <20251108093348.2842180-1-rampxxxx@gmail.com>
From: Javier Garcia <rampxxxx@gmail.com>
Date: Sat, 15 Nov 2025 08:31:13 +0100
X-Gm-Features: AWmQ_bn5W6cFQWAXvma80RKDC3o72Zt4SI3uXLPsjYIbAeCDIpi_bsg6NlHL0hg
Message-ID: <CABPJ0vgAK5-vhuqCDa0LNkjUeD8qE8GD0Yu5D3wc59ixw6OHiQ@mail.gmail.com>
Subject: Re: [PATCH v3] fbdev: vga16fb: Request memory region.
To: deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi,

Helge Deller, added this extra space clean as a I received a bot msg.


---
Javier Garcia

On Sat, 8 Nov 2025 at 10:33, Javier Garcia <rampxxxx@gmail.com> wrote:
>
> This patch reserve and release VGA memory region.
>
> This align with Documentation/drm/todo.rst
> "Request memory regions in all fbdev drivers"
>
> I've tested with 32bits kernel and qemu.
>
> Signed-off-by: Javier Garcia <rampxxxx@gmail.com>
> ---
> v1 -> v3:
>       * Add space after comma.
>       * v2 https://lore.kernel.org/lkml/20251028191615.2765711-1-rampxxxx@gmail.com/
> v1 -> v2:
>       * Add release in vga16fb_remove , thanks Helge Deller.
>       * v1 https://lore.kernel.org/lkml/20251016171845.1397153-1-rampxxxx@gmail.com/
>  drivers/video/fbdev/vga16fb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> index eedab14c7d51..3b4c50d98ba6 100644
> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -1319,6 +1319,11 @@ static int vga16fb_probe(struct platform_device *dev)
>         if (ret)
>                 return ret;
>
> +       if (!request_mem_region(vga16fb_fix.smem_start, vga16fb_fix.smem_len,
> +                               "vga16b")) {
> +               dev_err(&dev->dev, "vga16b: cannot reserve video memory at 0x%lx\n",
> +                      vga16fb_fix.smem_start);
> +       }
>         printk(KERN_DEBUG "vga16fb: initializing\n");
>         info = framebuffer_alloc(sizeof(struct vga16fb_par), &dev->dev);
>
> @@ -1398,6 +1403,8 @@ static int vga16fb_probe(struct platform_device *dev)
>   err_ioremap:
>         framebuffer_release(info);
>   err_fb_alloc:
> +       release_mem_region(vga16fb_fix.smem_start,
> +                   vga16fb_fix.smem_len);
>         return ret;
>  }
>
> @@ -1407,6 +1414,8 @@ static void vga16fb_remove(struct platform_device *dev)
>
>         if (info)
>                 unregister_framebuffer(info);
> +       release_mem_region(vga16fb_fix.smem_start,
> +                   vga16fb_fix.smem_len);
>  }
>
>  static const struct platform_device_id vga16fb_driver_id_table[] = {
> --
> 2.50.1
>
