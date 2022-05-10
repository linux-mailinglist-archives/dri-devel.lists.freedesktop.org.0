Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA5952259B
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 22:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FA010E705;
	Tue, 10 May 2022 20:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA8BE10E705;
 Tue, 10 May 2022 20:42:09 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id q8so356610oif.13;
 Tue, 10 May 2022 13:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VIAQOazJPjJfrZdIk0eSxwF2xbtTrMY68Mwjij7d8gE=;
 b=WCBx2+IfqAmZC8sXmKqzLtNc8sHWu8odkNtBLzkoy3C8snxpSkQIsZ5EaT/JcbeW1I
 FpzmywcEv1N9JRw3dvg2+UuJ4xV+7lQQ0JIaIYxyikEWF6w00JzdeN+kdA4G3t/oLd3j
 7Gb11tLiEjhmT4XNI0DlsXRpz0g4De9qK8I1prbAHKcPD9eCnIn71VWnRY7BXX8LELRw
 ZVns+2/DAi4ZnhuYldcbuf/2foYJ9wKJqOAlZXWt2VoUqNuAHcdVrSSi9cLx9W3ovx6O
 /NiurRgWVIk1qXf81GsW296h7fzNIkmi8+vMcuMIKreliJjY4lUp6lxRG+zUrlRSSany
 2QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VIAQOazJPjJfrZdIk0eSxwF2xbtTrMY68Mwjij7d8gE=;
 b=Cm/GZNaFTvsbBGCnJNO/h97ou6nwjYOiLOwwudIiq2wwgw7p6NjuRLV4Qwuwtl8glB
 Qq5axr5sXZsYcjyvQtwhJIwVjglVUMV3MmgOTsqcWyuq/G/Y0XDNBx64l/lRrOsGaR95
 ld79MMJI/MpuX0qdhWGGiicOaQWXnEMnBwZIeZr759wUBTCDIAP/ymljOrQ7QY613n5e
 8qPLh/WiMja8B97c0e5+cqw6g9axrwDBPgArwlDXMfjjYDs3j3sVjR1RNqHGl/PHfnJ+
 DoPhO5xw+s2567JTEBFzhBCcyCAAhNf57vtleq3Zz47SpRmKhuYfJOm7ryw8QO1kSN+U
 dT7w==
X-Gm-Message-State: AOAM532b/7evBF4i1yUohIfR38RfjBsNrsWW+LIxxt2ztKFMMMzIcIA1
 HZhm5+QlW0aEDPPUksewQTQGcnD9rHu5L2S+LLQ=
X-Google-Smtp-Source: ABdhPJyiYvR8gCRPu/xnvVY/i7Ko/yIUH9sG0FYEQoYT5AaJrawyX4S+NkTMMg/TFQj6Z7EX1WGqeksfxdGAvinnHOU=
X-Received: by 2002:a05:6808:f8e:b0:328:a601:a425 with SMTP id
 o14-20020a0568080f8e00b00328a601a425mr963626oiw.253.1652215328989; Tue, 10
 May 2022 13:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <YnTAc96Uv0CXcGhD@suse.de>
 <CADnq5_NT3UtawpGuPDwF+dgmRdaoysb7sD_-oWWBC=T3BoUH7Q@mail.gmail.com>
 <YnpIjdTT3esZ72Bf@suse.de>
 <CADnq5_NYVvjcUru9hfbnATfcHJR5+eiK9bJAA9m41WKa=OJsog@mail.gmail.com>
 <505081FC-4323-4424-87A9-89B95A89515D@suse.de>
In-Reply-To: <505081FC-4323-4424-87A9-89B95A89515D@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 May 2022 16:41:57 -0400
Message-ID: <CADnq5_PoWLHydAGqHXKNwBnnc_Uz7xc01Mmp2ri-h+RtnRqgfQ@mail.gmail.com>
Subject: Re: [BUG] Warning and NULL-ptr dereference in amdgpu driver with 5.18
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 10, 2022 at 2:17 PM J=C3=B6rg R=C3=B6del <jroedel@suse.de> wrot=
e:
>
>
> > Am 10.05.2022 um 17:31 schrieb Alex Deucher <alexdeucher@gmail.com>:
> >
> > On Tue, May 10, 2022 at 7:12 AM J=C3=B6rg R=C3=B6del <jroedel@suse.de> =
wrote:
> >>
> >> Gentle ping. This is a 5.18 regression and I also see it with
> >> 5.18-rc6. Please let me know if you need anything else to debug.
> >>
> >
> > Are you doing anything special when it happens?  I.e., does it happen
> > when the monitor is coming out of DPMS or something like that?
> >
>
> Yes, it usually happens when I return to the machine and press some butto=
n on the keyboard to get the screens enabled again. It doesn=E2=80=99t happ=
en always, it seems to depend on how slow the monitors come out of power sa=
ving mode.
>

Does setting amdgpu.runpm=3D0 on the kernel command line in grub help?
If so, that should fixed with:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Df95af4a9236695caed24fe6401256bb974e8f2a7

Alex


> Regards,
>
> J=C3=B6rg R=C3=B6del
> jroedel@suse.de
>
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5
> 90409 N=C3=BCrnberg
> Germany
>
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
