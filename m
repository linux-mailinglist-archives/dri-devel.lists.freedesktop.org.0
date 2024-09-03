Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D09F96ACA7
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 01:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA4110E61B;
	Tue,  3 Sep 2024 23:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="C15Rremv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com
 [209.85.221.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B4F10E61B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 23:14:56 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-4f2c8e99c0fso1820133e0c.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 16:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1725405294; x=1726010094;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vKGnNzBix9k9BwTLwmd0F4XaUJ7PXl0Hgu4ajuAli18=;
 b=C15RremvMpUPqP7Q6XoK1SMOVIl8WxU/NERnb9DqWUaw/9YlrtNUd7rtqNp21Y913S
 EmDpwLKcPPogwvr+a1sPOhzDIoMIG3oj+mz+5gdcTjP0pPWXPYPZ7qs4tSK45fTxUK+e
 dwSmVKXkZ46vq5u3x08QLnH5TSXBXWAkB7eFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725405294; x=1726010094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vKGnNzBix9k9BwTLwmd0F4XaUJ7PXl0Hgu4ajuAli18=;
 b=Oa7BvMQQo8e1tEQOJCUzKhpDh5CTOam+c/wXHgtRFexTVGqOjGUr329I+ssKty3DT/
 LE+T8sWqyyj2D+u21f0GYD8yVPAmZTXhInLHrrJsF3OR2Bxkof0Ze6YmOKp/aC8wMAbM
 xcDW4LTOEEy8ky3V+0bbyEZlOnMhqU5SUHZkyptYeljILulJq3vktIzEABfUxwhLkLfM
 YYzA0JE7E/2c5IKl+temh76r2AbnStkUmkRFMLGknzjrIty5luqXA5TeaCCLbKQ8z6B1
 3cuhczVxMPLjBfSjBLzOoXtAP5f7zOmk5+zUhIA94x6c8suaq/DyWx2oHIB2/CJbmgtU
 KOSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTkUtP5R8tefSDRDh9FMIx5rmUnM7gSE+aLo0AjvKj8cPZ8dWcD013WF8ldEuEHnVMSmsanBfENzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDvMTPxwA8PpZL0+ZeluiC98Z48q6zUcEWQrY31otTmO7bymsV
 FSTBonX0yLxEFSbeP1Cd4qLMH3/Di2lxDDakFnfFv8or3ocA5PBaNSQ9TNfbROGoYBh9wxQJ5fs
 =
X-Google-Smtp-Source: AGHT+IHWSKbb7YYgDmYTf0cbS3xJwmyE4iDbSbfyDLv/DG/RHItdcPc2gjM3veH2EnfwQsJtFgvuPg==
X-Received: by 2002:a05:6122:222a:b0:4f5:199b:2a61 with SMTP id
 71dfb90a1353d-500aadf45abmr12224670e0c.9.1725405293613; 
 Tue, 03 Sep 2024 16:14:53 -0700 (PDT)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com.
 [209.85.219.43]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c340bff43csm58278916d6.33.2024.09.03.16.14.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 16:14:52 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6c35ac3a7e6so18142116d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 16:14:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUlCPw0ZAiwi9UTBIddDaPMHqdiZ9mYWdSteGAGZRJhT71C9mNt5YtEs4ucQIMhFMMo1OAfWuGP2DE=@lists.freedesktop.org
X-Received: by 2002:a05:6214:5b0f:b0:6bd:83c3:ba1 with SMTP id
 6a1803df08f44-6c3554753f6mr170317256d6.52.1725405292025; Tue, 03 Sep 2024
 16:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240823163513.4344-1-hanchunchao@inspur.com>
 <CAD=FV=X_a2NzAi6L3N-Bgta4Vn7uSd3DPZ355LBg1gpd=A7H+w@mail.gmail.com>
In-Reply-To: <CAD=FV=X_a2NzAi6L3N-Bgta4Vn7uSd3DPZ355LBg1gpd=A7H+w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 3 Sep 2024 16:14:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzEucvODyhYo=o-eroe3Q3+siKN2yWwAfOQ=L8NXBD_Q@mail.gmail.com>
Message-ID: <CAD=FV=UzEucvODyhYo=o-eroe3Q3+siKN2yWwAfOQ=L8NXBD_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: himax-hx83102: Add NULL pointer check in
 hx83102_get_modes
To: Charles Han <hanchunchao@inspur.com>
Cc: neil.armstrong@linaro.org, yangcong5@huaqin.corp-partner.google.com, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, liuyanming@ieisystem.com
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

Hi,

On Fri, Aug 23, 2024 at 9:49=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Aug 23, 2024 at 9:35=E2=80=AFAM Charles Han <hanchunchao@inspur.c=
om> wrote:
> >
> > In hx83102_get_modes(), the return value of drm_mode_duplicate()
> > is assigned to mode, which will lead to a possible NULL pointer
> > dereference on failure of drm_mode_duplicate(). Even though a
> > small allocation failing is basically impossible, kernel policy
> > is still to check for NULL so add the check.
> >
> > Fixes: 0ef94554dc40 ("drm/panel: himax-hx83102: Break out as separate d=
river")
> > Signed-off-by: Charles Han <hanchunchao@inspur.com>
> > ---
> >  drivers/gpu/drm/panel/panel-himax-hx83102.c | 2 ++
> >  1 file changed, 2 insertions(+)
>
> FWIW, this looks to be v4 of your patch, right? The subject line
> should include a version number and you should be providing version
> history "after the cut" in your patch. Tools like "b4" and "patman"
> can help you get this correct [1]. If you plan to continue posting
> patches you'll need to start getting this right. The next version of
> your patch would be v5.
>
> [1] https://sched.co/1aBGS
>
> I see:
>
> v1: https://lore.kernel.org/r/20240821095039.15282-1-hanchunchao@inspur.c=
om
> v2: https://lore.kernel.org/r/20240822093442.4262-1-hanchunchao@inspur.co=
m
> v3: https://lore.kernel.org/r/20240823083657.7100-1-hanchunchao@inspur.co=
m
>
>
> > diff --git a/drivers/gpu/drm/panel/panel-himax-hx83102.c b/drivers/gpu/=
drm/panel/panel-himax-hx83102.c
> > index 6e4b7e4644ce..e67555323d3b 100644
> > --- a/drivers/gpu/drm/panel/panel-himax-hx83102.c
> > +++ b/drivers/gpu/drm/panel/panel-himax-hx83102.c
> > @@ -565,6 +565,8 @@ static int hx83102_get_modes(struct drm_panel *pane=
l,
> >         struct drm_display_mode *mode;
> >
> >         mode =3D drm_mode_duplicate(connector->dev, m);
> > +       if (!mode)
> > +               return -EINVAL;
>
> I would have returned -ENOMEM since drm_mode_duplicate() is defined to
> allocate memory copy the mode (like strdup does for strings) and it
> should be clear that the only failure case is failure to allocate
> memory. Other callers convert a NULL return as -ENOMEM.

FWIW: if you spin v5 of this patch and have it return -ENOMEM then I'm
happy to apply it.

-Doug
