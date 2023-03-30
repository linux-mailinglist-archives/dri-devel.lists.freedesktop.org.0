Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 531C26CFFF9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 11:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25DD10ED71;
	Thu, 30 Mar 2023 09:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C07D10ED71
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:41:41 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id a11so18957233lji.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 02:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680169299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jj7uHqZOdLN0sDK3Xcz4ned4693ywIi2Ky9y8C4gIS8=;
 b=h1EQTKbpKmU7pno6HTiq8ogo8/pH+W+4Mm4OT5kugbSihTJ8styMzSEeLWyyaZa2Ej
 LPcYGcBDDZn6cpWVr7Sx/8sP2d/E8E8QWGf+2oLgcvvuf/Z3rpqqHv9Wr2WWXo1NVRVE
 cEFmT4JCiy2FZ4OO2QLPY8ljt2/SQJeR11cqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680169299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jj7uHqZOdLN0sDK3Xcz4ned4693ywIi2Ky9y8C4gIS8=;
 b=hwcvhhRBeKtD+I8LNXg5kZFrXVofksJ7AY7735NifVNx4SaH02Qc1ACc0WUJEg355N
 T89iLAl3nAHt+EKUTcrPspz4X9KBMiBcaBYTXgkDu6ppfZEzMz5+GRFwlckWfZhlvYHI
 59W0bH6d21diR0uetLCpkXlIF0qGroQhKo6DtNAJhWenFtGmrlmtYYjUEEFstJEG4SP6
 hPYqX+G/rM4tEnB/chubleTtZ1uMcYJ36p9U3YfhsMpePA4EuLXVvIMe1PwgeXwRheDN
 sKueE84Z1zXiV38dMSpg2x5/kAW9ozKH+5xCZqvdEIVmE4hD8b71uMXmpV8XdTLLuF/C
 yeyg==
X-Gm-Message-State: AAQBX9eFCO591FJ89rtEgNO7bN6C7xBo/SrMleJumC2obL/CngqYwX+0
 JwZYMTKVz4Vf2Tqf8anKvvytn6ZSkp9OydBjiXYKzQ==
X-Google-Smtp-Source: AKy350azpEvSCVTTqZWh+pFop3JxTWe2D3s69e8wMoqyUQnuJn2Dn6aVN/g/D93LLQxSuvIARKB2yC7RN7kPnkWkCmM=
X-Received: by 2002:a05:651c:c1:b0:29a:a76a:194b with SMTP id
 1-20020a05651c00c100b0029aa76a194bmr2468697ljr.3.1680169299472; Thu, 30 Mar
 2023 02:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230329135401.105592-1-christian.koenig@amd.com>
 <46f01fc0-ec64-c215-b027-bd748711e6d8@redhat.com>
 <0080e53d-b597-ad34-7e66-6384cae456ae@redhat.com>
 <cf2f0771-39b0-49d6-011c-66b60b6a95c9@gmail.com>
 <ab8ed64b-5c4a-4948-7067-bac5351a45f0@redhat.com>
 <7e2845db-0a8c-c9f2-b858-89d7cb09d098@gmail.com>
 <4a60cf2a-193f-c06c-5747-766bca1ca01f@redhat.com>
 <ZCRzzi7bmDyOra4X@google.com>
In-Reply-To: <ZCRzzi7bmDyOra4X@google.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 30 Mar 2023 18:41:28 +0900
Message-ID: <CAD=HUj7n8doQkChtfCf2WAHpz3nMsR6Oa2PGUvv3P3YJ12fPUQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: set TTM allocated pages as reserved
To: Sean Christopherson <seanjc@google.com>
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
Cc: Pierre-eric.Pelloux-prayer@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 npiggin@gmail.com, dri-devel@lists.freedesktop.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 30, 2023 at 2:22=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> +David
>
> On Wed, Mar 29, 2023, Paolo Bonzini wrote:
> > On 3/29/23 18:43, Christian K=C3=AF=C2=BF=C2=BDnig wrote:
> > > >
> > > >
> > > > 3) other uses of kmap() must switch to MMU-notifier protection.
> > >
> > > I would rather suggest to return the page additionally to the pfn fro=
m
> > > hva_to_pfn() when the function was able to grab a reference to it.
> > >
> > > When the page is then not available you can't call kmap() on that eit=
her.
> > >
> > > >
> > > > If the DRM people are okay with SetPageReserved() as a temporary
> > > > hack, we can change or remove the WARN in kvm_is_zone_device_page()=
,
> > > > since that is what you are referring to in the commit message.
> > >
> > > Adding Daniel for additional comments on this, but essentially we hav=
e
> > > changed quite some infrastructure to make sure that everybody uses
> > > VM_PFNMAP to prevent stuff like this from happening.
> > >
> > > I would really prefer a proper solution in KVM instead.
> >
> > Hmm... Now that I think about it that would be
> >
> > https://lore.kernel.org/kvm/Yc4H+dGfK83BaGpC@google.com/t/
> >
> > Time to resurrect that work.
>
> Ya.  I had previously asked David to first eliminated the usage that isn'=
t
> protected by mmu_notifiers, but after seeing the resulting complexity, I =
had a
> change of heart[2].  Can you weigh in on the latter thread, specifically =
my
> proposal of using a module param to let the admin opt-in to "unsafe" kmap=
 usage.
>
> [1] https://lore.kernel.org/kvm/Ydhq5aHW+JFo15UF@google.com
> [2] https://lore.kernel.org/all/ZBEEQtmtNPaEqU1i@google.com/

I just finished rebasing my patch series and sent out v6:

https://lore.kernel.org/all/20230330085802.2414466-1-stevensd@google.com/

-David
