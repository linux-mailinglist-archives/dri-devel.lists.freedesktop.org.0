Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73094770089
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 14:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A086010E608;
	Fri,  4 Aug 2023 12:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B344810E6E7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 12:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691153517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dRlXGWY/CFWI5iW4ld/1S29gsGd4s6U2sDlhS/FmuSE=;
 b=inyIqqQtYt9/hxpljKhZne0FpgImGeemVbUqOBFFlRvYDRrJWVURZG6lajHHNow75LGdgk
 KJ5e9Q8PDCBT/UiMngv2D2+wAfRwjqO6OYcuGC+NmQxgv/u2F3ofJGqap4CRORssrjDYcK
 T3djS65XdEsa04gnfwp9svq4fbYMYtA=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-j918rNwmOiC3CNXihoqS5g-1; Fri, 04 Aug 2023 08:51:56 -0400
X-MC-Unique: j918rNwmOiC3CNXihoqS5g-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b9d5bc6161so3206281fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 05:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691153514; x=1691758314;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dRlXGWY/CFWI5iW4ld/1S29gsGd4s6U2sDlhS/FmuSE=;
 b=iawsQLtxskqkWJD60VLDqIABgMQnzNzuMmREbEpAPNCHHj7br7IMchbZo8q+RYodc7
 4EnbjXqTqATdCxNAJihVhp+fqXn4rtwZyaS89VBS3G71dvUZSl8Z7YukLbl4URHkLnmo
 z56PRO9NBYS19wAECiMEI+Vq4zSsgW0+bMuzsEkWMzWiTmVmSujyIaMAJDxaZtijM++x
 zS/E2JntBmGzcCchzvaUkZthNK4f37F3xV0vhcwHDbbwzwY19dHX5ZclOMzohpyCtxXJ
 rjaYjln78VvO6UOH1KtxJFuYtdNCB1mmJn5xdHjIO+rg1toCvYZm+ww0ES5pr6OTsax7
 QFjA==
X-Gm-Message-State: ABy/qLZMjmsi3KvpzHaNFMtcxIy5cWJzyBRf1n9F4kHrkdujJxsDXe48
 OKZkER4uAeIK0hg8Q2KU98ddP+F+pZX0U1z+YTUT6w4FrsO28Bipd0E3hZZVzmh5/kTPWsRN1zS
 S/cqwacslg9ooW0ddMKd8vo7I7Wt/GsEa6CRCxaXqgXK+
X-Received: by 2002:a2e:a7cf:0:b0:2b6:9969:d0ab with SMTP id
 x15-20020a2ea7cf000000b002b69969d0abmr14626220ljp.4.1691153514606; 
 Fri, 04 Aug 2023 05:51:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFrcSjZXh6YM3wQYlauuWGfFGZv19JjISaVV8WqI5Be/z9XCLqb6j13RdZZx7ibxrrJTgr6pbJPMHFHOKn9vpw=
X-Received: by 2002:a2e:a7cf:0:b0:2b6:9969:d0ab with SMTP id
 x15-20020a2ea7cf000000b002b69969d0abmr14626204ljp.4.1691153514326; Fri, 04
 Aug 2023 05:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20be6650-5db3-b72a-a7a8-5e817113cff5@kravcenko.com>
 <c27fb4dd-b2dc-22de-4425-6c7db5f543ba@leemhuis.info>
 <CACO55ttcUEUjdVgx4y7pv26VAGeHS5q1wVKWrMw5=o9QLaJLZw@mail.gmail.com>
 <0a5084b7-732b-6658-653e-7ece4c0768c9@kravcenko.com>
In-Reply-To: <0a5084b7-732b-6658-653e-7ece4c0768c9@kravcenko.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 4 Aug 2023 14:51:43 +0200
Message-ID: <CACO55tvu4X3u8K-FGUeN2CBw1BnumRPBNEEqjn+EPzNCCCQYyg@mail.gmail.com>
Subject: Re: nouveau bug in linux/6.1.38-2
To: Olaf Skibbe <news@kravcenko.com>
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
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 nouveau@lists.freedesktop.org, 1042753@bugs.debian.org,
 dri-devel@lists.freedesktop.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Ben Skeggs <bskeggs@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 4, 2023 at 2:48=E2=80=AFPM Olaf Skibbe <news@kravcenko.com> wro=
te:
>
> On Fri, 4 Aug 2023 at 14:15, Karol Herbst wrote:
>
> > mind retrying with only fb725beca62d and 62aecf23f3d1 reverted?
>
> I will do this later this day (takes some time, it is a slow machine).
>
> > Would be weird if the other two commits are causing it. If that's the
> > case, it's a bit worrying that reverting either of the those causes
> > issues, but maybe there is a good reason for it. Anyway, mind figuring
> > out which of the two you need reverted to fix your issue? Thanks!
>
> I can do this. But if I build two kernels anyway, isn't it faster to
> build each with only one of the patches applied? Or do you expect the
> patches to interact (so that the bug would only be present when both are
> applied)?
>

How are you building the kernel? Because normally from git reverting
one of those shouldn't take long, because it doesn't recompile the
entire kernel. But yeah, you can potentially just revert one of one
for now and it should be fine.

> Cheers,
> Olaf
>

