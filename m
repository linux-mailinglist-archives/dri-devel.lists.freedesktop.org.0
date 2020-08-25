Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCBD251D7E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 18:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7716E593;
	Tue, 25 Aug 2020 16:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBD58915A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598374333;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GH3XQPFWbt0lqGRNQZepy/lyen7L04oI1NtwwdbRf3c=;
 b=NrXlumnecMEHxwDwn5rsp9Ui8UGR+Qz/VL2uyOKCAPTxCpKnAktJCLNa1uYWTACXU3Cjfj
 FBIDQwDatcXhkFtRYfHFf/YAQH9fL3gDrD1OXX5mvuj9YPG63R1ZZVap1pwtBkTESFYwh9
 YeE1CgnRV9XeAAEUX90m4d1rvGbqRIc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-uar_jzEwNeevId2SN16oEg-1; Tue, 25 Aug 2020 12:52:08 -0400
X-MC-Unique: uar_jzEwNeevId2SN16oEg-1
Received: by mail-qk1-f198.google.com with SMTP id j7so9445674qki.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 09:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc:date
 :in-reply-to:references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=GH3XQPFWbt0lqGRNQZepy/lyen7L04oI1NtwwdbRf3c=;
 b=d1W42+f0bTzO1F7X0c0Z6Edxc7H7gnOCqpqsTUf4x5ncO78RwvfYgSfEEVWrd0le5I
 5o0ZQtbmXmW0qAhpVx0xMgPixRnHSuAVgQ5kEoPOgS4lEy9bvlna02g3sKu6glEDtfHe
 2vXshoTzWWiRzFqzWAQA+AzeO6D5qoKFNEoQFghGbjCCxDf+ccZg+m27BAzHCGcV352I
 gIKcIeZ/NIVpfi+iKDnVzkfPWeda8hgUOdBTfi2yRfKfcxFOlKXoCpxvdvLdAZZqaUJB
 BRJ9rEXJgVaCwl59sX//zM/q3vYrpfLtASUqN5EXvv/AyIyNCQN8ENxQxcCsw2kXHf0U
 LRYg==
X-Gm-Message-State: AOAM531KMVKo3pavm9FyVakAykRjjr8sQxKR7Ucc6La4T6Euf0d8gI4o
 6k3GgAM2T8GtVY1YL8OwlavOQc9GqQLKy4YoTcdfL4Hgp8nvIY7nmVuEgco5F+ZSkuZI5P50aX8
 9zIxioeHH9dSe8VaiQuqeN4dXj0M0
X-Received: by 2002:ac8:1773:: with SMTP id u48mr9877464qtk.259.1598374327294; 
 Tue, 25 Aug 2020 09:52:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPR44U8niNebYvUrKITYg+kbJjP80i+hSedazIwkyueDHLFtKe3ByC0Rxwfw2DlIYaJ18R6g==
X-Received: by 2002:ac8:1773:: with SMTP id u48mr9877443qtk.259.1598374326949; 
 Tue, 25 Aug 2020 09:52:06 -0700 (PDT)
Received: from Whitewolf.lyude.net
 (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id k3sm12047360qkb.95.2020.08.25.09.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 09:52:06 -0700 (PDT)
Message-ID: <76392bff28359a88fbdf0857f011e0ed9f666dc4.camel@redhat.com>
Subject: Re: [Nouveau] [PATCH 1/2] drm/nouveau/kms/nv50-: Program notifier
 offset before requesting disp caps
From: Lyude Paul <lyude@redhat.com>
To: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 25 Aug 2020 12:52:05 -0400
In-Reply-To: <CACAvsv6hymdcGkEcigL3fWACZ_1POpB+aefq9d9ChnYv_dHnVg@mail.gmail.com>
References: <20200824183253.826343-1-lyude@redhat.com>
 <20200824183253.826343-2-lyude@redhat.com>
 <CACAvsv6hymdcGkEcigL3fWACZ_1POpB+aefq9d9ChnYv_dHnVg@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0.002
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

On Tue, 2020-08-25 at 08:28 +1000, Ben Skeggs wrote:
> On Tue, 25 Aug 2020 at 04:33, Lyude Paul <lyude@redhat.com> wrote:
> > Not entirely sure why this never came up when I originally tested this
> > (maybe some BIOSes already have this setup?) but the ->caps_init vfunc
> > appears to cause the display engine to throw an exception on driver
> > init, at least on my ThinkPad P72:
> > 
> > nouveau 0000:01:00.0: disp: chid 0 mthd 008c data 00000000 0000508c 0000102b
> > 
> > This is magic nvidia speak for "You need to have the DMA notifier offset
> > programmed before you can call NV507D_GET_CAPABILITIES." So, let's fix
> > this by doing that, and also perform an update afterwards to prevent
> > racing with the GPU when reading capabilities.
> > 
> > Changes since v1:
> > * Don't just program the DMA notifier offset, make sure to actually
> >   perform an update
> I'm not sure there's a need to send an Update() method here, I believe
> GetCapabilities() is an action method on its own right?
> 

I'm not entirely sure about this part tbh. I do know that we need to call
GetCapabilities() _after_ the DMA notifier offset is programmed. But, my
assumption was that if GetCapabilities() requires a DMA notifier offset to store
its results in, we'd probably want to fire an update or something to make sure
that we're not reading before it finishes writing capabilities?

> Ben.
> 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Fixes: 4a2cb4181b07 ("drm/nouveau/kms/nv50-: Probe SOR and PIOR caps for DP
> > interlacing support")
> > Cc: <stable@vger.kernel.org> # v5.8+
> > ---
> >  drivers/gpu/drm/nouveau/dispnv50/core507d.c | 25 ++++++++++++++++-----
> >  1 file changed, 19 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > index e341f572c2696..5e86feec3b720 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
> > @@ -65,13 +65,26 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32 offset)
> >  int
> >  core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
> >  {
> > -       u32 *push = evo_wait(&disp->core->chan, 2);
> > +       struct nv50_core *core = disp->core;
> > +       u32 interlock[NV50_DISP_INTERLOCK__SIZE] = {0};
> > +       u32 *push;
> > 
> > -       if (push) {
> > -               evo_mthd(push, 0x008c, 1);
> > -               evo_data(push, 0x0);
> > -               evo_kick(push, &disp->core->chan);
> > -       }
> > +       core->func->ntfy_init(disp->sync, NV50_DISP_CORE_NTFY);
> > +
> > +       push = evo_wait(&core->chan, 4);
> > +       if (!push)
> > +               return 0;
> > +
> > +       evo_mthd(push, 0x0084, 1);
> > +       evo_data(push, 0x80000000 | NV50_DISP_CORE_NTFY);
> > +       evo_mthd(push, 0x008c, 1);
> > +       evo_data(push, 0x0);
> > +       evo_kick(push, &core->chan);
> > +
> > +       core->func->update(core, interlock, false);
> > +       if (core->func->ntfy_wait_done(disp->sync, NV50_DISP_CORE_NTFY,
> > +                                      core->chan.base.device))
> > +               NV_ERROR(drm, "core notifier timeout\n");
> > 
> >         return 0;
> >  }
> > --
> > 2.26.2
> > 
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
-- 
Sincerely,
      Lyude Paul (she/her)
      Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
