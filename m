Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC76BF3027
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 20:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC2810E4B0;
	Mon, 20 Oct 2025 18:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HBzKp5rt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C963710E4AF
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 18:50:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A3C19620FA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 18:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6ACC2BC86
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 18:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760986234;
 bh=T9xox0HM4UF95GIL4X1Mn43yKdjkpOS/EWQtbC4EEJ8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HBzKp5rtQ0Q8SVxn/1FlqftM/plmc2WgoX+gulyccpBKV5FTDk2wp5otTaeIk4jFC
 fEt62b6Kv9PD71QGe/1OuyX8OcUtrQV9ifO08jXPy8cCSOwfjmH4oYCp3gB6jN+0q9
 snx49ojC4QIbP8v1S+Wx3Z9b0058PyeXPDjlHjnZkeh+diBAqfFg4TsXtszuVjSExg
 DAUt/syVsbuu7YNFn3ofbBGaRKXaeXQfzroNKoJ5JKYBRzLls68TXNvsA73DjzeF8w
 dyScxKWNtAUvvb5e++cTiRbz30AH4/qM0T19Qh3DnEKpxdBbLC/GbztpLYJNzsU2KC
 UTdwsD6+qpvPQ==
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-7c28bf230feso1984409a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 11:50:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXQyGcZENjQ2tIAQSjflzTCaCJV8EJp9QkW4za7ZNx+VHmAmosChfohKEQayyeKyJjCRnZkHArHse8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCHU4wIhm+kKJifS00xXuJV/xJNiM3980uA5YC+omdpbpI5daa
 1sb6W1lk4wXiz5yOgpddTcgVbbxQ1YJusbvIjSJoKi5tiI89QFyMAyC8KqF8S9ULwBWuHXgH3jO
 I0Lz9c36y4mlhgfffgDL/k6I5vL9F1B0=
X-Google-Smtp-Source: AGHT+IHST6iSSjR9sowIUp74URZmCfDo260rlv0OLY3MtNgq5MbkgmXa21ZyE1N1chceC+tTpTh+NIvIgmYQVBg9HjI=
X-Received: by 2002:a05:6808:6718:b0:43f:abc7:f840 with SMTP id
 5614622812f47-441fb97f76cmr7641827b6e.17.1760986233391; Mon, 20 Oct 2025
 11:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251020165317.3992933-1-superm1@kernel.org>
 <20251020165317.3992933-4-superm1@kernel.org>
 <CAJZ5v0gsdmfXUJuLW8Ogt2jKDunx4g51LqCfSVMWQ6WHXBw_zg@mail.gmail.com>
 <85c039ef-e189-48c1-8bf7-50ac0c2484e2@kernel.org>
 <CAJZ5v0gT9BG5QPcwg6jJ1Jghny2YxC9_HY542LTBy-aVc_2T_w@mail.gmail.com>
 <aec8fc6c-3f9f-4ec1-a929-7a0be6026a3d@kernel.org>
In-Reply-To: <aec8fc6c-3f9f-4ec1-a929-7a0be6026a3d@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 20 Oct 2025 20:50:21 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gMf-qMGa6iBL2NdRXd-Mt5cpsoVQ90y+rSyK5xoYEf8A@mail.gmail.com>
X-Gm-Features: AS18NWBuf_ZaMFCedSeiIN34onuDzQPdHGd1wzQY-S5DN-sJHQED06c6kG-OGlI
Message-ID: <CAJZ5v0gMf-qMGa6iBL2NdRXd-Mt5cpsoVQ90y+rSyK5xoYEf8A@mail.gmail.com>
Subject: Re: [RFC 3/3] drm/amd: Return -EBUSY for amdgpu_pmops_thaw() on
 success
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, mario.limonciello@amd.com,
 airlied@gmail.com, 
 alexander.deucher@amd.com, christian.koenig@amd.com, dakr@kernel.org, 
 gregkh@linuxfoundation.org, lenb@kernel.org, pavel@kernel.org, 
 simona@ffwll.ch, Muhammad Usama Anjum <usama.anjum@collabora.com>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 20, 2025 at 8:32=E2=80=AFPM Mario Limonciello (AMD) (kernel.org=
)
<superm1@kernel.org> wrote:
>
>
>
> On 10/20/2025 12:39 PM, Rafael J. Wysocki wrote:
> > On Mon, Oct 20, 2025 at 7:28=E2=80=AFPM Mario Limonciello (AMD) (kernel=
.org)
> > <superm1@kernel.org> wrote:
> >>
> >>
> >>
> >> On 10/20/2025 12:21 PM, Rafael J. Wysocki wrote:
> >>> On Mon, Oct 20, 2025 at 6:53=E2=80=AFPM Mario Limonciello (AMD)
> >>> <superm1@kernel.org> wrote:
> >>>>
> >>>> From: Mario Limonciello <mario.limonciello@amd.com>
> >>>>
> >>>> The PM core should be notified that thaw was skipped for the device
> >>>> so that if it's tried to be resumed (such as an aborted hibernate)
> >>>> that it gets another chance to resume.
> >>>>
> >>>> Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
> >>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >>>> ---
> >>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_drv.c
> >>>> index 61268aa82df4d..d40af069f24dd 100644
> >>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>>> @@ -2681,7 +2681,7 @@ static int amdgpu_pmops_thaw(struct device *de=
v)
> >>>>
> >>>>           /* do not resume device if it's normal hibernation */
> >>>>           if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_=
is_suspend())
> >>>> -               return 0;
> >>>> +               return -EBUSY;
> >>>
> >>> So that's why you need the special handling of -EBUSY in the previous=
 patch.
> >>
> >> Yup.
> >>
> >>>
> >>> I think that you need to save some state in this driver and then use
> >>> it in subsequent callbacks instead of hacking the core to do what you
> >>> want.
> >>>
> >>
> >> The problem is the core decides "what" to call and more importantly
> >> "when" to call it.
> >>
> >> IE if the core thinks that something is thawed it will never call
> >> resume, and that's why you end up in a bad place with Muhammad's
> >> cancellation series and why I proposed this one to discuss.
> >>
> >> We could obviously go back to dropping this case entirely:
> >>
> >> if (!pm_hibernate_is_recovering() && !pm_hibernation_mode_is_suspend()=
)
> >>
> >> But then the display turns on at thaw(), you do an unnecessary resourc=
e
> >> eviction, it takes a lot longer if you have a ton of VRAM etc.
> >
> > The cancellation series is at odds with this code path AFAICS because
> > what if hibernation is canceled after the entire thaw transition?
>
> Muhammad - did you test that specific timing of cancelling the hibernate?
> >
> > Some cleanup would need to be done before thawing user space I suppose.
>
> I agree; I think that series would need changes for it.
>
> But if you put that series aside, I think this one still has some merit
> on it's own.  If another driver aborted the hibernate, I think the same
> thing could happen if it happened to run before amdgpu's device thaw().
>
> That series just exposed a very "easy" way to reproduce this issue.

Device thaw errors don't abort anything AFAICS.

What can happen though is that another device may abort the final
"power off" transition, which is one of the reasons why I think that
rolling it back is generally hard.
