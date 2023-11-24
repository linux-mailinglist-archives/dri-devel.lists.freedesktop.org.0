Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 851447F7151
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA96710E7CD;
	Fri, 24 Nov 2023 10:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5620110E7CD
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:21:53 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3A34B66073A8;
 Fri, 24 Nov 2023 10:21:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1700821311;
 bh=0UstT5q4XGqLhugf7BzP/6tcf1OIPQXVhYROpLfPmeg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=E8m+CKdVsUsF1G5OGRdCsKrrZW+LRi+CVh6lbl/tdwkzCZtajmPyZJuB8N+ZEOjwc
 jKrNzEFNediRAs+okyNZfM8vfSJfSzaYWtc0dbDWAUG8C24mDncKKUqM0vhg/eegTA
 RpvVx+URcsvGso2fab608xlkfGa4o2EpUA1dm+HMysDditQ4CygQOshoNHelFJtWLd
 IOiiTR1RYJvfdJCBxv7QB19SWwK+35dV7P1vYkr1nLzNdcr4lXAteYh/sumOKQ+rqU
 QtZU7WUDfyIR0E9XJMdp/3YIkp7JdgMEQzzFljpGSx1Ti6+BdmQiTMb4JxYXnzvaZf
 w6g8swatrZHyA==
Date: Fri, 24 Nov 2023 11:21:47 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] drm/panfrost: Ignore core_mask for poweroff and sync
 interrupts
Message-ID: <20231124112147.19b6b6b7@collabora.com>
In-Reply-To: <c4a8eb63-2d67-42c3-a6b4-c6ad3bd9ab8e@collabora.com>
References: <20231123095320.41433-1-angelogioacchino.delregno@collabora.com>
 <20231123113530.46191ded@collabora.com>
 <1740797f-f3ae-4868-924a-08d6d731e506@collabora.com>
 <20231123135933.34d643f7@collabora.com>
 <5019af46-f5ae-4db5-979e-802b61025ba4@collabora.com>
 <20231123145103.23b6eac9@collabora.com>
 <43cc8641-6a60-41d9-b8f2-32227235702a@collabora.com>
 <20231123164019.629c91f9@collabora.com>
 <5e60f1d1-8e3a-42ca-af56-126faa67ea86@collabora.com>
 <c4a8eb63-2d67-42c3-a6b4-c6ad3bd9ab8e@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Nov 2023 11:12:57 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Il 24/11/23 10:17, AngeloGioacchino Del Regno ha scritto:
> > Il 23/11/23 16:40, Boris Brezillon ha scritto: =20
> >> On Thu, 23 Nov 2023 16:14:12 +0100
> >> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> wrote:
> >> =20
> >>> Il 23/11/23 14:51, Boris Brezillon ha scritto: =20
> >>>> On Thu, 23 Nov 2023 14:24:57 +0100
> >>>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >>>> wrote: =20
> >>>>>>>
> >>>>>>> So, while I agree that it'd be slightly more readable as a diff i=
f those
> >>>>>>> were two different commits I do have reasons against splitting...=
.. =20
> >>>>>>
> >>>>>> If we just need a quick fix to avoid PWRTRANS interrupts from kick=
ing
> >>>>>> in when we power-off the cores, I think we'd be better off dropping
> >>>>>> GPU_IRQ_POWER_CHANGED[_ALL] from the value we write to GPU_INT_MASK
> >>>>>> at [re]initialization time, and then have a separate series that f=
ixes
> >>>>>> the problem more generically. =20
> >>>>>
> >>>>> But that didn't work:
> >>>>> https://lore.kernel.org/all/d95259b8-10cf-4ded-866c-47cbd2a44f84@li=
naro.org/ =20
> >>>>
> >>>> I meant, your 'ignore-core_mask' fix + the
> >>>> 'drop GPU_IRQ_POWER_CHANGED[_ALL] in GPU_INT_MASK' one.
> >>>>
> >>>> So,
> >>>>
> >>>> https://lore.kernel.org/all/4c73f67e-174c-497e-85a5-cb053ce657cb@col=
labora.com/
> >>>> +
> >>>> https://lore.kernel.org/all/d95259b8-10cf-4ded-866c-47cbd2a44f84@lin=
aro.org/ =20
> >>>>>
> >>>>>
> >>>>> ...while this "full" solution worked:
> >>>>> https://lore.kernel.org/all/39e9514b-087c-42eb-8d0e-f75dc620e954@li=
naro.org/
> >>>>>
> >>>>> https://lore.kernel.org/all/5b24cc73-23aa-4837-abb9-b6d138b46426@li=
naro.org/
> >>>>>
> >>>>>
> >>>>> ...so this *is* a "quick fix" already... :-) =20
> >>>>
> >>>> It's a half-baked solution for the missing irq-synchronization-on-su=
spend
> >>>> issue IMHO. I understand why you want it all in one patch that can s=
erve
> >>>> as a fix for 123b431f8a5c ("drm/panfrost: Really power off GPU cores=
 in
> >>>> panfrost_gpu_power_off()"), which is why I'm suggesting to go for an
> >>>> even simpler diff (see below), and then fully address the
> >>>> irq-synhronization-on-suspend issue in a follow-up patchset. =20
> >>>> --->8--- =20
> >>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c=20
> >>>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> >>>> index 09f5e1563ebd..6e2d7650cc2b 100644
> >>>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> >>>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
> >>>> @@ -78,7 +78,10 @@ int panfrost_gpu_soft_reset(struct panfrost_devic=
e *pfdev)
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpu_write(pfd=
ev, GPU_INT_CLEAR, GPU_IRQ_MASK_ALL);
> >>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpu_write(pfdev, GPU_INT_MASK,=
 GPU_IRQ_MASK_ALL); =20
> >>
> >> We probably want a comment here:
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0/* Only enable the interrupts we care about. */
> >> =20
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpu_write(pfdev, GPU_INT_MASK,
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GPU_IRQ_MASK_ERROR |
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GPU_IRQ_PERFCNT_SAMPLE_COMPLETED |
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GPU_IRQ_CLEAN_CACHES_COMPLETED); =20
> >>>
> >>> ...but if we do that, the next patch(es) will contain a partial rever=
t of this
> >>> commit, putting back this to gpu_write(pfdev, GPU_INT_MASK, GPU_IRQ_M=
ASK_ALL)... =20
> >>
> >> Why should we revert it? We're not processing the PWRTRANS interrupts
> >> in the interrupt handler, those should never have been enabled in the
> >> first place. The only reason we'd want to revert that change is if we
> >> decide to do have interrupt-based waits in the poweron/off
> >> implementation, which, as far as I'm aware, is not something we intend
> >> to do any time soon.
> >> =20
> >=20
> > You're right, yes. Okay, I'll push the new code soon.
> >=20
> > Cheers!
> >  =20
>=20
> Update: I was running some (rather fast) tests here because I ... felt li=
ke playing
> with it, basically :-)
>=20
> So, I had an issue with MediaTek platforms being unable to cut power to t=
he GPU or
> disable clocks aggressively... and after trying "this and that" I couldn'=
t get it
> working (in runtime suspend).
>=20
> Long story short - after implementing `panfrost_{job,mmu,gpu}_suspend_irq=
()` (only
> gpu irq, as you said, is a half solution), I can not only turn off clocks=
, but even
> turn off GPU power supplies entirely, bringing the power consumption of t=
he GPU
> itself during *runtime* suspend to ... zero.

Very nice!

>=20
> The result of this test makes me truly happy, even though complete powerc=
ut during
> runtime suspend may not be feasible for other reasons (takes ~200000ns on=
 AVG,
> MIN ~160000ns, but the MAX is ~475000ns - and beware that I haven't run t=
hat for
> long, I'd suspect to get up to 1-1.5ms as max time, so that's a big no).

Do you know what's taking so long? I'm disabling clks + the main power
domain in panthor (I leave the regulators enabled), but I didn't get to
measure the time it takes to enter/exit suspend. I might have to do
what you did in panfrost and have different paths for system and RPM
suspend.

>=20
> This means that I will take a day or two and I'll push both the "simple" =
fix for
> the Really-power-off and also some more commits to add the full irq sync.

Thanks for working on that, and sorry if I've been picky in my previous
reviews. Looking forward to review these new patches.

Regards,

Boris
