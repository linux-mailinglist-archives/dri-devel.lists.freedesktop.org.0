Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 940A262FE96
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 21:11:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6CD810E7C6;
	Fri, 18 Nov 2022 20:11:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335C210E7C4;
 Fri, 18 Nov 2022 20:11:29 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-13be3ef361dso7173476fac.12; 
 Fri, 18 Nov 2022 12:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J3I3CkdX4BAay5C0IaiSoCWmkDjQWfYtrKIg7MfvyUY=;
 b=Q/x00Xs+INcK9wrEmPasiROezIpYZC96sD9AlGuzIT/Z3B5xav8JQrZLsf0bVIgp5+
 5Q+2qjQy3fS+GISqFZJhFMnzu47CkNAZE7m71SW9UQ17vnGUQpwiS9OKW6/MUhhtScw5
 rmQE+jvC32tw6PE3xkMOHh8unguMDvvorOw4YTLgyM14YhM+ybgTfJCq5rWOqyrj2Ap3
 0/J11dqVCnkqj+XSIJQ+DxDn4vpz+4MOBl12IFG7tH8JhO7TnWt2jfOI1cmSB1SxSAjN
 3paOxl0zP4YAjdfDjVQFzbaNMzytEaPUXeT1hSYrktGE7oTwcUpZPOnfTAvg/bpL13nL
 mF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J3I3CkdX4BAay5C0IaiSoCWmkDjQWfYtrKIg7MfvyUY=;
 b=SfbpnO5e1Tb+mfy8k/94ybPP/3yhQxkEyfs2wSzL7q7guh8DquBxumLEkVV3afb+WF
 sueFulcv+4dpOZFkf1jboLvjhgDshlJt53Iqvj81YelMmC/GrUJyssR5xtvYv/Sf2bXM
 whZ9CuxziMaziAYl7BX4PdPATuM2Ttp/AZ0osq8xDyxi7I/trCWXok6baIG++xZ/72l5
 4vHJNQj4FTGFO2/dQId8zvYxjAZ6fc135r0aJ8ooiIfp4AgJLrW6wahCvq3/b/k5P6lH
 4umGxlU7eAGQ1rOOjwnq9rcACNt4dyCJ9U7rO3M50CPV5qaZhH4/cdpn8ksCmF+MqaeU
 oO9A==
X-Gm-Message-State: ANoB5pm5d4aR/c7iC65T1vwf1UayoPZOEOkwJizndWNf51YWU0GvQNhk
 XXd8LA87gNkYS5I1sC89nY2SVSttK1xoNJyQCMY=
X-Google-Smtp-Source: AA0mqf4HAPt5v1Yu7vw9aDVSNnvY2xhI05VAW34pXE3l0dIiWaEtvxVZJXNOHwbRMWzNZ+ydN1qTwgQIHgLOBuRB8/A=
X-Received: by 2002:a05:6870:2b05:b0:12d:58c1:33f9 with SMTP id
 ld5-20020a0568702b0500b0012d58c133f9mr8296943oab.46.1668802288282; Fri, 18
 Nov 2022 12:11:28 -0800 (PST)
MIME-Version: 1.0
References: <20221118195406.95779-1-lyude@redhat.com>
 <b7c8a41d-6657-2646-4f18-ed13293369b2@amd.com>
In-Reply-To: <b7c8a41d-6657-2646-4f18-ed13293369b2@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 18 Nov 2022 15:11:16 -0500
Message-ID: <CADnq5_M0zdoSe3w1A-XxLc4G_x4-a2RT6CkRfhwP_4OLdP=Uow@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/dm/mst: Fix uninitialized var in
 pre_compute_mst_dsc_configs_for_state()
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <Roman.Li@amd.com>,
 amd-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, hersen wu <hersenxs.wu@amd.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Nov 18, 2022 at 3:03 PM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 11/18/22 14:54, Lyude Paul wrote:
> > Coverity noticed this one, so let's fix it.
> >
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > index 59648f5ffb59..6483ba266893 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> > @@ -1180,7 +1180,7 @@ static int pre_compute_mst_dsc_configs_for_state(struct drm_atomic_state *state,
> >       struct amdgpu_dm_connector *aconnector;
> >       struct drm_dp_mst_topology_mgr *mst_mgr;
> >       int link_vars_start_index = 0;
> > -     int ret;
> > +     int ret = 0;
> >
> >       for (i = 0; i < dc_state->stream_count; i++)
> >               computed_streams[i] = false;
>
