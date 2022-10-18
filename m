Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8ED603068
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 17:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A035B10E938;
	Tue, 18 Oct 2022 15:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB71A10E620;
 Tue, 18 Oct 2022 15:59:21 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1322d768ba7so17316030fac.5; 
 Tue, 18 Oct 2022 08:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1ZN69xuQm2c6PKH22c+9Q2bjVWUVl8bcz7rztLXwnaI=;
 b=oqhBCJCQNN0gNeu67PqXuDHNskdCnZHhJDplOmiEOXGQ1bfOrWsAhz3untjgRIkWGM
 yqCnYJQE3HjDVMxniL9hyPnV8fEbVvIqAV/b/m91zbZBGBStet2452A+P4cuiQEyq4ve
 bbq4r8BxCJ+Goak8YrJJPRnsObvkYx+Ynhex53/2ouiui+TJWbPL8E35bsjxWmueqPhh
 tTLELYlAwl5V6SLXrnAUS0jXkoDGV5TUMzBaLZEZFeTMHO8YX1CvOoqEIMGRCqMlmX3N
 sVd90AAQ7kRIDv5rgI7HFUjZYBSyiFzg7Tywq5yfEES4F2pNwXXWAx85A4+jNXfECMXk
 KKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ZN69xuQm2c6PKH22c+9Q2bjVWUVl8bcz7rztLXwnaI=;
 b=AUR/qu4Cs3X9Yiiuh486iGSp/hPhKWwL8pkY9lAwRuDOJbJpAsjBWIlLXaOTZ71KRC
 EgeZpTOBlUyGVGyUnD7vislet/DL38lR8ewwEV9Hz3sr5E0Lt018W2dXeoAzLv6yHnm/
 SnhdlFN56t9yb8j2moneyH5R/7woE6UYwEcnDZaX6M745T0psHGOE3yNeklj9b+kzdlN
 IwnpI2ljKR4kA90t3/Y5XA1AdlCiP8gTst3+hHp/U2PPZGKJlwTM44g8nUk7enerQ+VZ
 hVOl6hf69riky3Sav8U3PKu+USrZ8dt4Ym1YF4MSVpqN7u/F87JjjZU6Cdejs7Q830pK
 R5sQ==
X-Gm-Message-State: ACrzQf1yxHP32ZZXt+90/CLuDCNYCj17JXOlMkGKHvg1uArqQ9tjyItn
 8e9YUmeZE2yNbag2mGT+2SRklyMTZL6Ayrmgqgg=
X-Google-Smtp-Source: AMsMyM5oYHBWpOm3cQNeoGaH9Crfv+3DU6wqAoUt7+7GNbkl38+RHKBcvGqXlPFtc/c7DvCP1gY1VJKqGFe49u8A+f8=
X-Received: by 2002:a05:6870:a7a4:b0:136:7c39:979e with SMTP id
 x36-20020a056870a7a400b001367c39979emr2076264oao.96.1666108761134; Tue, 18
 Oct 2022 08:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221018005357.887009-1-rafaelmendsr@gmail.com>
 <DM6PR12MB261914D4B306F738E6CA9B27E4289@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB261914D4B306F738E6CA9B27E4289@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Oct 2022 11:59:09 -0400
Message-ID: <CADnq5_PjcAHt=sDqes81F=j5j0p4o3tZEyPYk_2MgQku2XBBWg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/powerplay/psm: Fix memory leak in power state
 init
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rafael Mendonca <rafaelmendsr@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Oct 17, 2022 at 9:07 PM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Official Use Only - General]
>
> Reviewed-by: Evan Quan <evan.quan@amd.com>
>
> > -----Original Message-----
> > From: Rafael Mendonca <rafaelmendsr@gmail.com>
> > Sent: Tuesday, October 18, 2022 8:54 AM
> > To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> > Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>
> > Cc: Rafael Mendonca <rafaelmendsr@gmail.com>; amd-
> > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org
> > Subject: [PATCH] drm/amdgpu/powerplay/psm: Fix memory leak in power
> > state init
> >
> > Commit 902bc65de0b3 ("drm/amdgpu/powerplay/psm: return an error in
> > power state init") made the power state init function return early in case of
> > failure to get an entry from the powerplay table, but it missed to clean up the
> > allocated memory for the current power state before returning.
> >
> > Fixes: 902bc65de0b3 ("drm/amdgpu/powerplay/psm: return an error in
> > power state init")
> > Signed-off-by: Rafael Mendonca <rafaelmendsr@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
> > b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
> > index 67d7da0b6fed..1d829402cd2e 100644
> > --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
> > +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/pp_psm.c
> > @@ -75,8 +75,10 @@ int psm_init_power_state_table(struct pp_hwmgr
> > *hwmgr)
> >       for (i = 0; i < table_entries; i++) {
> >               result = hwmgr->hwmgr_func->get_pp_table_entry(hwmgr,
> > i, state);
> >               if (result) {
> > +                     kfree(hwmgr->current_ps);
> >                       kfree(hwmgr->request_ps);
> >                       kfree(hwmgr->ps);
> > +                     hwmgr->current_ps = NULL;
> >                       hwmgr->request_ps = NULL;
> >                       hwmgr->ps = NULL;
> >                       return -EINVAL;
> > --
> > 2.34.1
