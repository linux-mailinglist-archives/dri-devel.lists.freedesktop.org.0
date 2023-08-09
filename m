Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0390677673D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 20:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFA910E490;
	Wed,  9 Aug 2023 18:29:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CF310E48E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 18:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691605754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VU9lj4736mFcJlFa+niJ6SImF0emcM8nxQWNCZfo+W8=;
 b=IsJWrbF3wyISeLFxO+neuxIMWKKoypsRfRnCU9UMM019HElF3YOn+J60d8k/RY1QcUPE0f
 nPq04zIU5zVDmSgK7DXQt8/OGSz8MJ67dYilZqXmFxxbMbVAhQ4n+CmwP3J+e8tfMwsbI1
 SfsdQMNr273GMrHix8o6oiDs1ta0eeo=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-lxxMOsZ7Ot2ydFRD2YFxaw-1; Wed, 09 Aug 2023 14:29:12 -0400
X-MC-Unique: lxxMOsZ7Ot2ydFRD2YFxaw-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b04d5ed394so213451fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 11:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691605751; x=1692210551;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VU9lj4736mFcJlFa+niJ6SImF0emcM8nxQWNCZfo+W8=;
 b=aZjVKu1qUl+TsXIAe3Tt8LZWczLCv+Nz9GJXGY4fiOgyjLW2WVacayp+UkAFfVvhcp
 N6jAq0pqGmxQHrW5sjbgH6ZD4P9iScfaB7FVbvirtEBfhsI4UWufDB8XoKk/9Tbfq5L0
 1Z5B28YEiXT5BWpmqmRGtACtnZAtTJuqqIP3gKCPG5fDIxBi/BnKn4ZnVfE9RPd3p6YQ
 7iiCs7I0G7aQgIpZorCdsJ8TttEgjpyPgPM4FNYycV6XEmEdqRSS39gFLnPpmjjz38MU
 MAOdS5gtPAOEvGBeDPIPrERxbbtmn1Xrwn60DI14tOa/8tVgjfH3veJ7Xfs6hofaSf8Z
 sYkw==
X-Gm-Message-State: AOJu0YwApMVqUvC3KKK8Se+Q4BS4VcUFQ8ptynxgs2t32gL22VzLNiNF
 8/DPW2HDA9mBKBj9ARpaUDdiQL+OEtGlqY1wQ35/sbub9e+BLrqXln2zPB0/a8GDjjgbvW2iFue
 wyoNrQDbhl0GwHDK2dgh71dEi1dx/uT9HEOlTGKG8tG/2
X-Received: by 2002:a05:651c:2107:b0:2b9:a156:6239 with SMTP id
 a7-20020a05651c210700b002b9a1566239mr1300ljq.1.1691605751379; 
 Wed, 09 Aug 2023 11:29:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpZzm/oAXal+SXFMKVcUnRTLHmeHrnw1rp1VRHk+gJDJwU0amodPtO6iRhHhIkzV5jJXafc51j+GnfRMuyRyA=
X-Received: by 2002:a05:651c:2107:b0:2b9:a156:6239 with SMTP id
 a7-20020a05651c210700b002b9a1566239mr1289ljq.1.1691605751013; Wed, 09 Aug
 2023 11:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230806213107.GFZNARG6moWpFuSJ9W@fat_crate.local>
 <CACO55tvZD5U4J8DawFTRVnV-dLYLngfhuqO29_sWNEGofKfnBg@mail.gmail.com>
 <20230807150521.GGZNEIMQ9rsyCmkpoA@fat_crate.local>
 <CACO55tvWuSdwdirj7S3Dk-r4NAw8jC8g5RHKFd62WXi43iQP-w@mail.gmail.com>
 <87fs4sfu54.wl-tiwai@suse.de>
 <CACO55tszwFEgt=8xn4auAE7KJVs3ybGG68OzL9HJt19XGVhhHQ@mail.gmail.com>
 <874jl8fngo.wl-tiwai@suse.de>
 <CACO55ts9YWF7nLi3Zs4xKySpdHyUFgf4r566cKx3FwNTCaz0Sg@mail.gmail.com>
 <87wmy4e4uk.wl-tiwai@suse.de>
 <60ef0646-b0ab-b4e0-9eaa-a2c431c5d682@leemhuis.info>
In-Reply-To: <60ef0646-b0ab-b4e0-9eaa-a2c431c5d682@leemhuis.info>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 9 Aug 2023 20:28:59 +0200
Message-ID: <CACO55tt=RosBaYPc_wf3NnRC-+prFg2G9E0GEjnV7TSkWjB2HQ@mail.gmail.com>
Subject: Re: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not
 PMGR AUX interrupts")
To: Thorsten Leemhuis <regressions@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: nouveau@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 9, 2023 at 4:04=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 09.08.23 15:13, Takashi Iwai wrote:
> >
> > If this can't be fixed quickly, I suppose it's safer to revert it from
> > 6.4.y for now.  6.5 is still being cooked, but 6.4.x is already in
> > wide deployment, hence the regression has to be addressed quickly.
>

feel free to send reverts to mainline and add my r-by tage to it and I
can push those changes up. Sadly those patches fixed another
use-after-free, but it seems like we have to take another shot unless
somebody does have time to look into it promptly.

> Good luck with that. To quote
> https://docs.kernel.org/process/handling-regressions.html :
>
> ```
> Regarding stable and longterm kernels:
>
> [...]
>
> * Whenever you want to swiftly resolve a regression that recently also
> made it into a proper mainline, stable, or longterm release, fix it
> quickly in mainline; when appropriate thus involve Linus to fast-track
> the fix (see above). That's because the stable team normally does
> neither revert nor fix any changes that cause the same problems in mainli=
ne.
> ```
>
> Note the "normally" in there, so there is a chance.
>
> Ciao, Thorsten
>

