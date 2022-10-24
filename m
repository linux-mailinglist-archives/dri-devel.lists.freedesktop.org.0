Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F0B60B28A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 18:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF2C10E37E;
	Mon, 24 Oct 2022 16:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7664810E110;
 Mon, 24 Oct 2022 16:48:48 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-13ae8117023so12501357fac.9; 
 Mon, 24 Oct 2022 09:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fShq1F8MCtr7H1rIrt9dF42VoxsVe4EiV73x1/8GfMQ=;
 b=AZgGfvOK1KD08qsmji2S9sKDHIHWDZ2uTSX7b+y/9ACFeQ8zK64RdgYia5Pe5y2JQX
 9XAw1dnIsYVKmY0iM5NWcg9m9Po7a88B96Mace45+QsUFKcEvrTdawgtPbqCWibKvDNh
 vNzUAPRrJoQDAmDWv9dUmrgnJTm7Tvj0DFnuoCExRL1Jf7gnPxijXwM3ZgQEEqr/4Rgl
 422FGAWgTLWbBBTGLNAiJtR782p+uGuuKrLUb3WrRakfv/90TJZjyYzt5d1LYWuZyM/H
 GnG6N6yprSMQR6xncPQw4hgJob/g6LESGPY1uFHM5DcaTuzgRymnhFGlPTWWkhVi9T/O
 u35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fShq1F8MCtr7H1rIrt9dF42VoxsVe4EiV73x1/8GfMQ=;
 b=aGbdUJmVRHmJdIJfCI/Ck3TF70JdCP/P87ZvWOmZHdRK3/0QyUu8xY0h1C/y+u8oaq
 qVuuhXTSYKKod1aCC2B83W7TXbg965hJg7YG5Y2lDRpVSWUVVEllb++vcPTl6CD7Kc64
 L3WjfNjeK+jQE0uuJrJxbihfQQ0fw2zqgV0/ohcDp+bGDAVVRvkpP0veKQ74Y5wizfHt
 JeNU8YVIcrqcKAF4sEZKLQLpEi2VNQkj1E0MqON94Vb59Hb2usEOO8h5ZW4GzDm82BlE
 siV52oeSWcBOk2dqmAOFn5Uo1SDAcIUHZo3+UrOCN9kG0Qv04D8o5WQATDwYd6gufJ7H
 89Zw==
X-Gm-Message-State: ACrzQf2KetdzGytaNl9ZTNNCA4vQkz9xMhcQIvChRdsefpUugf1867L5
 m9c0im/HwPtolMz8A3jLW/MTU5ALaaimIeziKvFUfehO3HE=
X-Google-Smtp-Source: AMsMyM5elTbqhJRg2/4CxKTddWKEQFpt53OdEb9hNtHVIQShbQDVoJk9cV8eR64KPw+F2Nfuz9CEza+jV42Gnxi0qUw=
X-Received: by 2002:a05:6870:a116:b0:13a:f9de:6fd0 with SMTP id
 m22-20020a056870a11600b0013af9de6fd0mr13870435oae.46.1666630127719; Mon, 24
 Oct 2022 09:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221020143603.563929-1-alexander.deucher@amd.com>
 <DM6PR12MB26194FC4A9B18912448DA8CEE42E9@DM6PR12MB2619.namprd12.prod.outlook.com>
 <e494d819-f960-f2bd-913e-83ee820ac399@suse.de>
In-Reply-To: <e494d819-f960-f2bd-913e-83ee820ac399@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Oct 2022 12:48:36 -0400
Message-ID: <CADnq5_P7r71zETyJRZ+KVKFS+C56NAZaht5stVE=uZQ6tP6fdg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: don't call drm_fb_helper_lastclose in
 lastclose()
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 3:33 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 24.10.22 um 08:20 schrieb Quan, Evan:
> > [AMD Official Use Only - General]
> >
> > Reviewed-by: Evan Quan <evan.quan@amd.com>
> >
> >> -----Original Message-----
> >> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Ale=
x
> >> Deucher
> >> Sent: Thursday, October 20, 2022 10:36 PM
> >> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> >> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Thomas
> >> Zimmermann <tzimmermann@suse.de>
> >> Subject: [PATCH] drm/amdgpu: don't call drm_fb_helper_lastclose in
> >> lastclose()
> >>
> >> It's used to restore the fbdev console, but as amdgpu uses
> >> generic fbdev emulation, the console is being restored by the
> >> DRM client helpers already. See the call to drm_client_dev_restore()
> >> in drm_lastclose().
> >>
> >> Fixes: 087451f372bf76 ("drm/amdgpu: use generic fb helpers instead of
> >> setting up AMD own's.")
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 1 -
> >>   1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >> index fe23e09eec98..474b9f40f792 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> >> @@ -1106,7 +1106,6 @@ int amdgpu_info_ioctl(struct drm_device *dev,
> >> void *data, struct drm_file *filp)
> >>    */
> >>   void amdgpu_driver_lastclose_kms(struct drm_device *dev)
> >>   {
> >> -    drm_fb_helper_lastclose(dev);
> >>      vga_switcheroo_process_delayed_switch();
> >>   }
>
> Without the call to drm_fb_helper_lastclose(), the console emulation
> will be restored by drm_client_dev_restore() from drm_lastclose(). [1]
> It means that it's now changing order with the call to
> vga_switcheroo_process_delay_switch(). Can this become a problem?
>
> I looked at the other callers of that function. Most restore the console
> before doing the switcheroo. Nouveau doesn't seem to care about the
> console at all.

I don't know off hand.  I suppose if the switch powered down the GPU
and then we tried to restore it's console state that would be a
problem, but it looks like vga_switchto_stage2() just powers down the
GPU without going through suspend so I'm not sure if this actually
worked correctly?  What are the potential problems with calling
drm_fb_helper_lastclose twice?

Alex

>
> Best regards
> Thomas
>
> [1]
> https://elixir.bootlin.com/linux/v6.0.3/source/drivers/gpu/drm/drm_file.c=
#L467
>
> >>
> >> --
> >> 2.37.3
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
