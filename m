Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DF39736FE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 14:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F1910E7AA;
	Tue, 10 Sep 2024 12:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WF3CG3qR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D36710E7AA
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 12:18:52 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-6bce380eb96so3384792a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 05:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725970732; x=1726575532; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fPvvRryr0vgpHkg1cRcRCsWDsYNvGIowHyQK6GkDpME=;
 b=WF3CG3qRYDT85sPCqt1/qQ+3GS3sgvqsHwFeSDGywKimaQ2/YA+gOpqBtrGw40FVXZ
 ZbkgovnAu1BqgKLqn/XFdx/JK2Qt+oOCIoIoEOaqvhtEpqBnw3hsWQ5N7qzAr/CXdmvO
 S5nieQdYnGSCETO6PhobfDD57zbWYSNa8vmsVl3VkFJt1z1foqonX25h7ePGcSDNiQlW
 Bk9+VcARUuoBKEC71RQl4UzmzAnAAqr/7nvajbsoGUQbIK4kLJsWCzWmylOq5CXquPou
 NUPgHWcKCGt3oZv9ok+U3TvLAXqpc3gTH26yzm5YR4ZV6wQE9KGOQDJOWSVcwGqUQPJK
 rH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725970732; x=1726575532;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fPvvRryr0vgpHkg1cRcRCsWDsYNvGIowHyQK6GkDpME=;
 b=e/H+8/5PAlFTW+9mqpd+xGHBBLnf2ANuPs4+FKyhaNiEH2W6tkyQgF7+nd5kwFHrFy
 kq7nxXjp4DgZY++oVP/m90TDeYt5Tc7AFqXfHibPhwWi/FsQgYb5utKAPLpBj36CJkHF
 IBt1KfxXbEF4xbO5Xc0Lsr30v2etoseZNjm8MwotowauWz575xFdGwSap+jZBa/rKmSM
 DbQpwcvvD3TYBcD2J9EvkP6ILqQ3LTe4lPugnfXOCEUIgwx9f0vs54v3OizkYemzERz8
 Jasuavi+VDn+W89NDyZvEM1Xvop7sRHuAMoGm0+pSvCngMXDQ8pXRqcjsVO6HPtSRPSC
 ddkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVn3dKr4diNudPiPOWqbhKhFebCF4wIRg1Qo4aRidCG43nfJ71udXI8hIw/b5ZVZsQh47wxMSkU6ks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydhJwUQ5m8t6+6qQKayyNq9DNZRIWEi1wQjMbGHw3DbAzh4Yy8
 JjhZq911LyFt9BCOU9FXuRvZtASvfvckAZxO/O4DsSbm5zQaC8muBvosBlXsFrb+J36XOnzmi5H
 S18dRG9R94PY752R+4DGaMtpU731vaB0OyPc=
X-Google-Smtp-Source: AGHT+IEqnPdqGPGDHSqJ9shohkQQvK+iGfhG5oaAvU7FW7rygKnMjlmBmhrY9M9Ct4hLeZ0hd+LUouxLfQHVHh0lF2g=
X-Received: by 2002:a05:6a20:cf8c:b0:1cf:3a0a:ae45 with SMTP id
 adf61e73a8af0-1cf5e156d0fmr992068637.35.1725970731916; Tue, 10 Sep 2024
 05:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240910020919.5757-1-jandryuk@gmail.com>
 <Zt_zvt3VXwim_DwS@macbook.local>
 <ad9e19af-fabd-4ce0-a9ac-741149f9aab3@suse.de>
 <Zt__jTESjI7P7Vkj@macbook.local>
 <2024091033-copilot-autistic-926a@gregkh>
In-Reply-To: <2024091033-copilot-autistic-926a@gregkh>
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Tue, 10 Sep 2024 14:18:35 +0200
Message-ID: <CALUcmUn30tPxjToysLBVBmibMaQUWW=GqFoqduP-W5QwQ-VriQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev/xen-fbfront: Assign fb_info->device
To: Greg KH <gregkh@linuxfoundation.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jason Andryuk <jandryuk@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>,
 xen-devel@lists.xenproject.org, 
 Jason Andryuk <jason.andryuk@amd.com>, stable@vger.kernel.org,
 linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, 10 Sept 2024 at 10:33, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Sep 10, 2024 at 10:13:01AM +0200, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Sep 10, 2024 at 09:29:30AM +0200, Thomas Zimmermann wrote:
> > > Hi
> > >
> > > Am 10.09.24 um 09:22 schrieb Roger Pau Monn=C3=A9:
> > > > On Mon, Sep 09, 2024 at 10:09:16PM -0400, Jason Andryuk wrote:
> > > > > From: Jason Andryuk <jason.andryuk@amd.com>
> > > > >
> > > > > Probing xen-fbfront faults in video_is_primary_device().  The pas=
sed-in
> > > > > struct device is NULL since xen-fbfront doesn't assign it and the
> > > > > memory is kzalloc()-ed.  Assign fb_info->device to avoid this.
> > > > >
> > > > > This was exposed by the conversion of fb_is_primary_device() to
> > > > > video_is_primary_device() which dropped a NULL check for struct d=
evice.
> > > > >
> > > > > Fixes: f178e96de7f0 ("arch: Remove struct fb_info from video help=
ers")
> > > > > Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > > > Closes: https://lore.kernel.org/xen-devel/CALUcmUncX=3DLkXWeiSiTK=
sDY-cOe8QksWhFvcCneOKfrKd0ZajA@mail.gmail.com/
> > > > > Tested-by: Arthur Borsboom <arthurborsboom@gmail.com>
> > > > > CC: stable@vger.kernel.org
> > > > > Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> > > > Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > >
> > > > > ---
> > > > > The other option would be to re-instate the NULL check in
> > > > > video_is_primary_device()
> > > > I do think this is needed, or at least an explanation.  The commit
> > > > message in f178e96de7f0 doesn't mention anything about
> > > > video_is_primary_device() not allowing being passed a NULL device
> > > > (like it was possible with fb_is_primary_device()).
> > > >
> > > > Otherwise callers of video_is_primary_device() would need to be
> > > > adjusted to check for device !=3D NULL.
> > >
> > > The helper expects a non-NULL pointer. We might want to document this=
.
> >
> > A BUG_ON(!dev); might be enough documentation that the function
> > expected a non-NULL dev IMO.
>
> No need for that, don't check for things that will never happen.

And yet, here we are, me reporting a kernel/VM crash due to a thing
that will never happen, see 'Closes' above.

I don't want to suggest BUG_ON is the right approach; I have no idea.
I just want to mention that (!dev) did happen. :-)
