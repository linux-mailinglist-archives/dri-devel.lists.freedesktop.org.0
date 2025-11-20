Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DF2C75D84
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 19:01:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0970210E7B1;
	Thu, 20 Nov 2025 18:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jhLKfI6V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CBF10E7AC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 18:01:00 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5959da48139so1177120e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 10:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763661659; x=1764266459; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e4i+XBRMdEy12pL0HjcgWxdFQn5Uv2AViQ31Fb1aIWY=;
 b=jhLKfI6VbKixPDMeiWuhP3gMZx2oIekPbvLQimlBbudiD++fHaQK4a8KuqGViIIitK
 XfNsVf9v/mggqJYZQVGtQPc/oVERoTTy7ay63uGkWF0PwhNbDi+sN/P1DD0c51y7DD0V
 R1L5vAwGfrlF8CpKX9LuIyvYJX85UnSntPZYNnDJAdP7/zHGXsvN+MDnWCZbdZ2aQNnj
 RWaA/PoM7/RigWKRbEiUHVohgKpSlsWI4Wh9oKJwkDwn45tKIXWNkz5d+stoJbpF64Da
 Lg9yQ97RrT2mRh8/24FvsjyPOTkj7jdoVTZ2PwGm4M56Z5Dg2Mln35l51kdEqwEx1I7J
 r2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763661659; x=1764266459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=e4i+XBRMdEy12pL0HjcgWxdFQn5Uv2AViQ31Fb1aIWY=;
 b=Wqoi22jfjX9vA1L0vSaWNti5UCjeTc2C6cXpWIYi+x0UgfRocm0acztFJjT+PCzyfZ
 q0ax5fnmfzTreUI/AZPwMunt3dXJtjy2kaDoSOs3tiehEhqTdP8jQ5Hbb/kttb58xLrI
 wzPv5iEFUZlju5V5Lb/gTlDLNLiHh1YX1up9i3ts2LLvwtVft4tWwLkC8qzkAj/fLcNp
 6DOpRO7ruUL2BbnZKVvYy0KzOaC/0rg5Ct/SEdEdwxmrTXAhX3K8go27nARdjj8wFxU4
 U3Ut5GIvbzgNecLd9pXrPIPqYTSE9THloFrrs25bwZ/rP/f7sL4gNTyEuw+ZnSkvYusy
 BO1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW16CpwzPVRWf51oXtWhjLFl/iwUVqWO4zGtqrWQj+c59kNM0WTOaVb+IN4sofz09aE+D72NfsJRrA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyW8Z+oX8Cb4BGtwLLNRV4wTxZflPIig4I+Ao5DGguXo/nc+aBb
 fMggEbraEihFskDWEmnqeDkQV93F6kbZeZWZttWKX2w0O8JU6nMa8renCkanOgxCZWSITEARbf+
 tnYfG/3wFmDxPYLA+Qh61cjVzPul3l6I=
X-Gm-Gg: ASbGnct9cAhEaXBq/o0+AlVsUFU/WzoOpyOo5KhUoD5GMSyFQ4m7R91Zh2K3IR1gRb9
 ZiG8/p7dedJvthwDXYOU//l70UB51U7iWWZZcspO5ZUBv29OFSNwxwfhE9VhrCejnoXFWKXzJxJ
 BSx22ozXPV2PrTNS43SIsAflUnszCtcakA8LTFNWqNGFSRYaQuWs/aUpdLeKO+hmv6IK5Fx3ASn
 bQp+VHIywT1wmzoLUuprAAKR3IUeUyqTJ9fKcHLHXnEuM6Zuxop6FmPRbAUFSA+DMuvx/LHsfUK
 7+fw6te1FfL1H6CjDD3yNikFHDNb
X-Google-Smtp-Source: AGHT+IHahn8Y/hERYatOt3b0WUUo2gmSRmy3wN7QEwtkGV+n5IPr/Emi48mtcyvcilgV4k5PIyQiZnjo7H/5FRrbfk8=
X-Received: by 2002:a05:6512:15a2:b0:594:51ac:13e with SMTP id
 2adb3069b0e04-5969e2c5badmr1388220e87.17.1763661658684; Thu, 20 Nov 2025
 10:00:58 -0800 (PST)
MIME-Version: 1.0
References: <20251118095700.393474-1-hsukrut3@gmail.com>
 <4ec784a5-0f67-4fd3-9d51-d89a9fa9a385@gmail.com>
In-Reply-To: <4ec784a5-0f67-4fd3-9d51-d89a9fa9a385@gmail.com>
From: sukrut heroorkar <hsukrut3@gmail.com>
Date: Thu, 20 Nov 2025 23:30:46 +0530
X-Gm-Features: AWmQ_bkm9gCUmV6YMuwXUBLKyVsWtV8rR0o7D9LtASeWj-n-9-UVTo-Ks6EE5Yc
Message-ID: <CAHCkknoKsS7bjgR5WaV0-1e_2mB1XiqXi_Y_UWyAeC5N8PfPRw@mail.gmail.com>
Subject: Re: [PATCH] fbdev: q40fb: request memory region
To: David Hunter <david.hunter.linux@gmail.com>
Cc: Helge Deller <deller@gmx.de>, 
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, 
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Nov 19, 2025 at 7:27=E2=80=AFPM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> On 11/18/25 04:56, Sukrut Heroorkar wrote:
> > The q40fb driver uses a fixed physical address but never reserves
> > the corresponding I/O region. Reserve the range  as suggested in
> > Documentation/gpu/todo.rst ("Request memory regions in all fbdev driver=
s").
> >
> > No functional change beyond claming the resource. This change is compil=
e
> > tested only.
>
> Reserving memory is a significant "functional" change, so you should not
> put "No functional change...". I have noticed that in the mentorship
> program, mentees might say this often times when they have not done
> testing.
>
> Thank you for describing that you did a compile test, but I believe that
> more testing should be done before this patch is accepted.
qemu-system-m68k does not emulate a Q40 machine, thus the change
was compile tested only with W=3D1 & debugging enabled.
>
> As a result, if you are unable to test this device, I believe that an
> RFT tag should be used. Also, the testing information goes below the
> "---". This puts it in the change log and would make it so that if a
> patch is accepted, everything below the change log is not put in the
> commit message.
Thank you. I will make a note of this for the future patches.
> >
> > Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
> > ---
> >  drivers/video/fbdev/q40fb.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/video/fbdev/q40fb.c b/drivers/video/fbdev/q40fb.c
> > index 1ff8fa176124..935260326c6f 100644
> > --- a/drivers/video/fbdev/q40fb.c
> > +++ b/drivers/video/fbdev/q40fb.c
> > @@ -101,6 +101,12 @@ static int q40fb_probe(struct platform_device *dev=
)
> >       info->par =3D NULL;
> >       info->screen_base =3D (char *) q40fb_fix.smem_start;
> >
> > +     if (!request_mem_region(q40fb_fix.smem_start, q40fb_fix.smem_len,
> > +                             "q40fb")) {
> > +             dev_err(&dev->dev, "cannot reserve video memory at 0x%lx\=
n",
> > +                     q40fb_fix.smem_start);
> > +     }
> > +
>
> Is this correct? It seems to me that in the case of an error, all you
> are doing is simply logging the error and proceeding. Would this cause
> the device to continue to try to use space that it was not able to
> reserve? I do not have experience with this device or the driver, but
> that does not seem correct to me.
I referred to a patch, which was recently accepted, having a similar
implementation.
However, other fbdev drivers with similar implementation, returns a
-EBUSY  when the
If() evaluates true indicating resource already being occupied.  I
will make the necessary
changes and resend the patch as RFT.
>
> >       if (fb_alloc_cmap(&info->cmap, 256, 0) < 0) {
> >               framebuffer_release(info);
> >               return -ENOMEM;
> > @@ -144,6 +150,7 @@ static int __init q40fb_init(void)
> >               if (ret)
> >                       platform_driver_unregister(&q40fb_driver);
> >       }
> > +
> >       return ret;
> >  }
> >
>
