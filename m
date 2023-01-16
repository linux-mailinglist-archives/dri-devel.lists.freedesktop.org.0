Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4740366C6F2
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 17:26:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D55810E464;
	Mon, 16 Jan 2023 16:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E7F10E461
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673886411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r2boqvfD+RJ61HpS/wHyE329kUvwll2CIPBJV6eZl4c=;
 b=IDjmgHopGyiIonvakEi5RH1XTKJynlefCM8gCCgv3IkRDnrFsn8eHM3cdtLzevA610m6AY
 BoBdPpdTfnU6t+Kqz/fkCTVmcw/Ij/HM9LH0ubwdZEGXra5om8fly76wPFnJmZU3LbLIjC
 sLJhK09JlB3X6D/6uBQb92BgmQRr17o=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-wKfPlELBOrOb0SSd8yi-2w-1; Mon, 16 Jan 2023 11:26:50 -0500
X-MC-Unique: wKfPlELBOrOb0SSd8yi-2w-1
Received: by mail-lj1-f197.google.com with SMTP id
 l1-20020a2e9081000000b0028b97d2c493so239465ljg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 08:26:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r2boqvfD+RJ61HpS/wHyE329kUvwll2CIPBJV6eZl4c=;
 b=f0ca147zJOpSCBgIemnYayBu0H9kKkJYN4eOXu7ct2a/wsUlsvX1mUJsl+41EPa8ap
 X/8VTpjcDZZKgwRvL5m0X4zh7CwWfQuuu6+qChodtrOPQKrSctUKg4pKdWPvU9xjPkY7
 BMYW15QCyy9PaLfmDHxuqRicLBDzT2FWkHrahVWNOvYUfmP8NNmyWuQDzX3lgvHqvadS
 yAPe/11Q/Wzj3jE/U75oJIULURwNPPrkevSkE7xuB2Wqw7NJQcgCOMNDMOSWbOqi7iO3
 ku40r5j+a76eR6ppWsfquzjX5vSedggRz4iMjr81LLchm7k9f7fN/tbxGRGXPUBLGmQM
 gFBA==
X-Gm-Message-State: AFqh2ko7GdYAA1GP9ssF/B+77qas4LDsNrlL3hoQLHU2vEp9Bu+oY6O6
 75Zj3CCw6VErIY4nlfMFtedPELvjMHDLWd9UEwx6RqySI3B/IHMpeMfHXXJHRr8nSguUm5TSoft
 1j10u/eFELdh677Q2cxdjyKUnDeQxqDyo5EoE0s8c/vJX
X-Received: by 2002:a05:6512:7c:b0:4d5:7b89:7b67 with SMTP id
 i28-20020a056512007c00b004d57b897b67mr110391lfo.17.1673886408807; 
 Mon, 16 Jan 2023 08:26:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsl3G5delLpsUSEikj3rrvMcC9LUAx6uCt/IgZvb4ulTe/2Bhgjm8AC830LNMSyFXE01XKOE/f4hSEa4jTVlHk=
X-Received: by 2002:a05:6512:7c:b0:4d5:7b89:7b67 with SMTP id
 i28-20020a056512007c00b004d57b897b67mr110384lfo.17.1673886408656; Mon, 16 Jan
 2023 08:26:48 -0800 (PST)
MIME-Version: 1.0
References: <20230103234835.never.378-kees@kernel.org> <Y7TNtQqunHIW8her@work>
 <CACO55tsyCtf-_mCPVEo-4Dj_mAu-tnNTTjP75wx=9n+TS1XVvw@mail.gmail.com>
In-Reply-To: <CACO55tsyCtf-_mCPVEo-4Dj_mAu-tnNTTjP75wx=9n+TS1XVvw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 16 Jan 2023 17:26:37 +0100
Message-ID: <CACO55tvuhLzbtg-wzy24Y7Y4k4CN_3JZM5VZ-9VPFNZK3skKCg@mail.gmail.com>
Subject: Re: [RESEND][PATCH] drm/nouveau/fb/ga102: Replace zero-length array
 of trailing structs with flex-array
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Kees Cook <keescook@chromium.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Gourav Samaiya <gsamaiya@nvidia.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 5:24 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Jan 4, 2023 at 1:52 AM Gustavo A. R. Silva
> <gustavoars@kernel.org> wrote:
> >
> > On Tue, Jan 03, 2023 at 03:48:36PM -0800, Kees Cook wrote:
> > > Zero-length arrays are deprecated[1] and are being replaced with
> > > flexible array members in support of the ongoing efforts to tighten the
> > > FORTIFY_SOURCE routines on memcpy(), correctly instrument array indexing
> > > with UBSAN_BOUNDS, and to globally enable -fstrict-flex-arrays=3.
> > >
> > > Replace zero-length array with flexible-array member.
> > >
> > > This results in no differences in binary output.
> > >
> > > [1] https://github.com/KSPP/linux/issues/78
> > >
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Karol Herbst <kherbst@redhat.com>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Gourav Samaiya <gsamaiya@nvidia.com>
> > > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: nouveau@lists.freedesktop.org
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> >
> > Here is my RB again:
> >
> > Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> >
>
> Reviewed-by: Karol Herbst <kherbst@redhat.com>
>
> will push in a moment
>

just noticed it's the same change than the other one... anyway, will
push the oldest one

> > Thanks!
> > --
> > Gustavo
> >
> > > ---
> > > Sent before as: https://lore.kernel.org/all/20221118211207.never.039-kees@kernel.org/
> > > ---
> > >  drivers/gpu/drm/nouveau/include/nvfw/hs.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/include/nvfw/hs.h b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > > index 8c4cd08a7b5f..8b58b668fc0c 100644
> > > --- a/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > > +++ b/drivers/gpu/drm/nouveau/include/nvfw/hs.h
> > > @@ -52,7 +52,7 @@ struct nvfw_hs_load_header_v2 {
> > >       struct {
> > >               u32 offset;
> > >               u32 size;
> > > -     } app[0];
> > > +     } app[];
> > >  };
> > >
> > >  const struct nvfw_hs_load_header_v2 *nvfw_hs_load_header_v2(struct nvkm_subdev *, const void *);
> > > --
> > > 2.34.1
> > >
> >

