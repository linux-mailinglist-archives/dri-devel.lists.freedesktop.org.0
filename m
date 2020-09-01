Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 242BA25A027
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 22:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316E489DAB;
	Tue,  1 Sep 2020 20:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0410F89DAB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 20:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598993042;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gPCf4u3EyicebY387YkKs2a22jsTBC/ti3P+b5RanuE=;
 b=KsQl7KtARyWulmDy/YfyTH7bA6jmK9sOL5EJH3IQzfRtWmTGAPonElvRfwJpraa88AusVK
 HUciAEQcXsaFicnaZ8PZ/u3dPMrJbG8S+Dxyc6Ijlh3t7jlEgEH47RvKDE6aqrhSRWIUYl
 LYxaajXLKkidanimP1LachrtcPitcOM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-L8RzcweHNLe8mao2CjZefw-1; Tue, 01 Sep 2020 16:43:58 -0400
X-MC-Unique: L8RzcweHNLe8mao2CjZefw-1
Received: by mail-qt1-f197.google.com with SMTP id r22so1971612qtc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Sep 2020 13:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=gPCf4u3EyicebY387YkKs2a22jsTBC/ti3P+b5RanuE=;
 b=hiRW3fHNqj2Birtt8CBORp+if6tHo3TQGg1LXZYg7Nk0Dg0LCrIXD08hfzq2Euxzoj
 +gkBOPCm3SUi5KqM3/0wWUZZTxxWH4EB1y0Oltt9poMLG8AW1YiW6mtQDGuIV31YqMKR
 4t3Lu6rZCRGVuRIYct/x/1RmooUcyhCLR/ejC+JQU3udLBU4UNjpXA6H7bKj2Ho2/MvA
 qGSSOwWYHDjhgd/4m1wxmNNOX187B6FTAMxBR6fBLO1s1m3mlFQ/pKjAj+CoIUAsIUFB
 Yj/zv0Yq0Gcbr+9ZJvhlyoVUKH0Zxq4ddz4/LBz1ljqAGH2rRVdiO6pwFbItd7meFRKV
 0i3w==
X-Gm-Message-State: AOAM5337n0oIzsVL7rrK8/qD/+wgSQb0vpXCODMs7fTkak+W08G8HlTs
 5/5u6XGOYonMF3gmnderaj8k4xkVcmjZrGzbOxhuS3CFae4VnWlBcPkc4cUENQoATDU99QftLuP
 YSDegRDg+QFkwhKDlfTwuKgPsoqIw
X-Received: by 2002:a0c:b2d4:: with SMTP id d20mr3919074qvf.1.1598993038180;
 Tue, 01 Sep 2020 13:43:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMmHa3fHP8NY/dodaToFLVXTDFVn0f07O4xVQ5hfDgEZxkOry+RenIOt4w6jJJl7+Ml1CEdA==
X-Received: by 2002:a0c:b2d4:: with SMTP id d20mr3919050qvf.1.1598993037914;
 Tue, 01 Sep 2020 13:43:57 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id g37sm2892530qtk.76.2020.09.01.13.43.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 13:43:57 -0700 (PDT)
Message-ID: <c099dc05ff80ea43033c72a52de51165d9b0f6ab.camel@redhat.com>
Subject: Re: [Nouveau] [PATCH 1/2] drm/nouveau/kms/nv50-: Program notifier
 offset before requesting disp caps
From: Lyude Paul <lyude@redhat.com>
To: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 01 Sep 2020 16:43:56 -0400
In-Reply-To: <CACAvsv6GKeX=u4Jn0VVJk1qgnPcnPCW6exukqjvfrfmm2mwSUg@mail.gmail.com>
References: <20200824183253.826343-1-lyude@redhat.com>
 <20200824183253.826343-2-lyude@redhat.com>
 <CACAvsv6hymdcGkEcigL3fWACZ_1POpB+aefq9d9ChnYv_dHnVg@mail.gmail.com>
 <76392bff28359a88fbdf0857f011e0ed9f666dc4.camel@redhat.com>
 <CACAvsv6GKeX=u4Jn0VVJk1qgnPcnPCW6exukqjvfrfmm2mwSUg@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
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
Reply-To: lyude@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, David Airlie <airlied@linux.ie>,
 ML nouveau <nouveau@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, "open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-08-31 at 14:26 +1000, Ben Skeggs wrote:
> On Wed, 26 Aug 2020 at 02:52, Lyude Paul <lyude@redhat.com> wrote:
> > On Tue, 2020-08-25 at 08:28 +1000, Ben Skeggs wrote:
> > > On Tue, 25 Aug 2020 at 04:33, Lyude Paul <lyude@redhat.com> wrote:
> > > > Not entirely sure why this never came up when I originally tested this
> > > > (maybe some BIOSes already have this setup?) but the ->caps_init vfunc
> > > > appears to cause the display engine to throw an exception on driver
> > > > init, at least on my ThinkPad P72:
> > > > 
> > > > nouveau 0000:01:00.0: disp: chid 0 mthd 008c data 00000000 0000508c
> > > > 0000102b
> > > > 
> > > > This is magic nvidia speak for "You need to have the DMA notifier offset
> > > > programmed before you can call NV507D_GET_CAPABILITIES." So, let's fix
> > > > this by doing that, and also perform an update afterwards to prevent
> > > > racing with the GPU when reading capabilities.
> > > > 
> > > > Changes since v1:
> > > > * Don't just program the DMA notifier offset, make sure to actually
> > > >   perform an update
> > > I'm not sure there's a need to send an Update() method here, I believe
> > > GetCapabilities() is an action method on its own right?
> > > 
> > 
> > I'm not entirely sure about this part tbh. I do know that we need to call
> > GetCapabilities() _after_ the DMA notifier offset is programmed. But, my
> > assumption was that if GetCapabilities() requires a DMA notifier offset to
> > store
> > its results in, we'd probably want to fire an update or something to make
> > sure
> > that we're not reading before it finishes writing capabilities?
> We definitely want to *wait* on GetCapabilities() finishing, I believe
> it should also update the notifier the same (or similar) way Update()
> does.  But I don't think we want to send an Update() here, it'll
> actually trigger a modeset (which, on earlier HW, will tear down the
> boot mode.  Not sure about current HW, it might preserve state), and
> we may not want that to happen there.

I'm not so sure about that, as it seems like the notifier times out without the
update:

[    5.142033] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000000: 00040088 mthd 0x0088 size 1 - core507d_init
[    5.142037] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000004: f0000000-> NV507D_SET_CONTEXT_DMA_NOTIFIER
[    5.142041] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000008: 00040084 mthd 0x0084 size 1 - core507d_caps_init
[    5.142044] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 0000000c: 80000000-> NV507D_SET_NOTIFIER_CONTROL
[    5.142047] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000010: 0004008c mthd 0x008c size 1 - core507d_caps_init
[    5.142050] nouveau 0000:1f:00.0: DRM: [DRM/00000000:kmsChanPush] 00000014: 00000000-> NV507D_GET_CAPABILITIES
[    7.142026] nouveau 0000:1f:00.0: DRM: core notifier timeout
[    7.142700] nouveau 0000:1f:00.0: DRM: sor-0002-0fc1 caps: dp_interlace=0
[    7.142708] nouveau 0000:1f:00.0: DRM: sor-0002-0fc4 caps: dp_interlace=0
[    7.142715] nouveau 0000:1f:00.0: DRM: sor-0002-0f42 caps: dp_interlace=0
[    7.142829] nouveau 0000:1f:00.0: DRM: sor-0006-0f82 caps: dp_interlace=0
[    7.142842] nouveau 0000:1f:00.0: DRM: sor-0002-0f82 caps: dp_interlace=0
[    7.142849] nouveau 0000:1f:00.0: DRM: failed to create encoder 1/8/0: -19
[    7.142851] nouveau 0000:1f:00.0: DRM: Virtual-1 has no encoders, removing

Any other alternatives to UPDATE we might want to try?

> 
> Ben.
> 
> > > Ben.
> > > 
> > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > Fixes: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for
> > > > DP
> > > > interlacing support")
> > > > Cc: <stable@vger.kernel.org> # v5.8+
> > > > ---
> > > >  drivers/gpu/drm/nouveau/dispnv50/core507d.c | 25 ++++++++++++++++-----
> > > >  1 file changed, 19 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > > b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > > index e341f572c2696..5e86feec3b720 100644
> > > > --- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > > +++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > > > @@ -65,13 +65,26 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32
> > > > offset)
> > > >  int
> > > >  core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
> > > >  {
> > > > -       u32 *push = evo_wait(&disp->core->chan, 2);
> > > > +       struct nv50_core *core = disp->core;
> > > > +       u32 interlock[NV50_DISP_INTERLOCK__SIZE] = {0};
> > > > +       u32 *push;
> > > > 
> > > > -       if (push) {
> > > > -               evo_mthd(push, 0x008c, 1);
> > > > -               evo_data(push, 0x0);
> > > > -               evo_kick(push, &disp->core->chan);
> > > > -       }
> > > > +       core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
> > > > +
> > > > +       push = evo_wait(&core->chan, 4);
> > > > +       if (!push)
> > > > +               return 0;
> > > > +
> > > > +       evo_mthd(push, 0x0084, 1);
> > > > +       evo_data(push, 0x80000000 | NV50_DISP_CORE_NTFY);
> > > > +       evo_mthd(push, 0x008c, 1);
> > > > +       evo_data(push, 0x0);
> > > > +       evo_kick(push, &core->chan);
> > > > +
> > > > +       core->func->update(core, interlock, false);
> > > > +       if (core->func->ntfy_wait_done(disp->sync, NV50_DISP_CORE_NTFY,
> > > > +                                      core->chan.base.device))
> > > > +               NV_ERROR(drm, "core notifier timeout\n");
> > > > 
> > > >         return 0;
> > > >  }
> > > > --
> > > > 2.26.2
> > > > 
> > > > _______________________________________________
> > > > Nouveau mailing list
> > > > Nouveau@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/nouveau
> > --
> > Sincerely,
> >       Lyude Paul (she/her)
> >       Software Engineer at Red Hat
> > 
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
