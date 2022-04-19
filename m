Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0D25070C5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 16:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D61F10EE9A;
	Tue, 19 Apr 2022 14:39:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E6310EAC9;
 Tue, 19 Apr 2022 14:39:01 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-e5e433d66dso6358587fac.5; 
 Tue, 19 Apr 2022 07:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1s42UKgWJ4Pw4SvGNmkzwP7DSmoxOCXsEkE3mMBdmkk=;
 b=bryyFja6G/AfZjaCCp3S0G0ceVcHhyW1VQrZVSljNUEwwov2BVcqUpiqzWWuUzKqiW
 9rJzlHdS162QkPuOqWZq7UQ2VwiHR0xor0h0WIoSFyLZhJlv2+zectxrETiTHrAjY79E
 zvaLn+f9Sm9B8dmjE0Or93kQWpSpKq8AoM3n7JxTsgPapjJO/8m3TQ/iaLFyz1DG2xIq
 RiP7Bb6DpCXBOYWqJ6Jt2a/BXMLG9VaCGTBE7IW3ABkGUkYwH5Uo8gsuMe03xupp43CJ
 d8Hsw0jY3vd60CmLcfC6WgcMi3fzGpjUKBX5/aT2leGku3O/VYO4boI+1k75w43bNywb
 4uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1s42UKgWJ4Pw4SvGNmkzwP7DSmoxOCXsEkE3mMBdmkk=;
 b=IZIYqO239SbaOW/zEpQeswdnK8ybyJdX2JhWW7PVF5kAcy58hcIe8im6PDJLk/0tTL
 pUan6Wen1Y4n2Ew26fW3oOBxixMnZUBvWfNPCmevXsEdYWwmj3X94iD1Z3536hseeoxs
 2yifAbIW4Z2FRmzFxZoED0YqwKbSuTb3ULdfAlgGgCs3PqiDTNKkTy/cVO4Adsb+8UmJ
 W6dsT+UioT1JdCyBCat3UBT+RB/yOXW1YHaPNx4QpwnPlhf5oYpgi4udiJYyuZhu3mt/
 JPss/m5V1XKrjmlo6vfQSyl10W2+n1dO+IsCIdgiTFEm6w6m9aQdwBTUBJ6LH8Vwus3/
 Jvww==
X-Gm-Message-State: AOAM533qu0OP7Zi1xS3b2c36RgvFjnvXtbqnicjxHO5iRrIVQ7vwZ596
 Dxw5G4DZgp/bJ1cZnH8yL2W6DqBNfHzDHNqXepVXxMj7
X-Google-Smtp-Source: ABdhPJxYRk2m9Utt9pJajmRXaqGutiUzLUudX5XJtfTMosQAR+UFtPG9su2APCdSuDKfZxLYGcxAh0AbE+xOcVMMHxQ=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr6741761oap.253.1650379140409; Tue, 19
 Apr 2022 07:39:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220419103721.4080045-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
In-Reply-To: <20220419103721.4080045-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 19 Apr 2022 10:38:49 -0400
Message-ID: <CADnq5_MfjrZvegj-4r4DhRR5FDe6casvfcy54G0tM8PZqbsHeg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: fix double free in si_parse_power_table()
To: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>,
 Lijo Lazar <lijo.lazar@amd.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Apr 19, 2022 at 8:49 AM Keita Suzuki
<keitasuzuki.park@sslab.ics.keio.ac.jp> wrote:
>
> In function si_parse_power_table(), array adev->pm.dpm.ps and its member
> is allocated. If the allocation of each member fails, the array itself
> is freed and returned with an error code. However, the array is later
> freed again in si_dpm_fini() function which is called when the function
> returns an error.
>
> This leads to potential double free of the array adev->pm.dpm.ps, as
> well as leak of its array members, since the members are not freed in
> the allocation function and the array is not nulled when freed.
> In addition adev->pm.dpm.num_ps, which keeps track of the allocated
> array member, is not updated until the member allocation is
> successfully finished, this could also lead to either use after free,
> or uninitialized variable access in si_dpm_fini().
>
> Fix this by postponing the free of the array until si_dpm_fini() and
> increment adev->pm.dpm.num_ps everytime the array member is allocated.
>
> Signed-off-by: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
> ---
>  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> index caae54487f9c..079888229485 100644
> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> @@ -7331,17 +7331,15 @@ static int si_parse_power_table(struct amdgpu_device *adev)
>         if (!adev->pm.dpm.ps)
>                 return -ENOMEM;
>         power_state_offset = (u8 *)state_array->states;
> -       for (i = 0; i < state_array->ucNumEntries; i++) {
> +       for (adev->pm.dpm.num_ps = 0, i = 0; i < state_array->ucNumEntries; i++) {
>                 u8 *idx;
>                 power_state = (union pplib_power_state *)power_state_offset;
>                 non_clock_array_index = power_state->v2.nonClockInfoIndex;
>                 non_clock_info = (struct _ATOM_PPLIB_NONCLOCK_INFO *)
>                         &non_clock_info_array->nonClockInfo[non_clock_array_index];
>                 ps = kzalloc(sizeof(struct  si_ps), GFP_KERNEL);
> -               if (ps == NULL) {
> -                       kfree(adev->pm.dpm.ps);
> +               if (ps == NULL)
>                         return -ENOMEM;
> -               }
>                 adev->pm.dpm.ps[i].ps_priv = ps;
>                 si_parse_pplib_non_clock_info(adev, &adev->pm.dpm.ps[i],
>                                               non_clock_info,
> @@ -7363,8 +7361,8 @@ static int si_parse_power_table(struct amdgpu_device *adev)
>                         k++;
>                 }
>                 power_state_offset += 2 + power_state->v2.ucNumDPMLevels;
> +               adev->pm.dpm.num_ps++;
>         }
> -       adev->pm.dpm.num_ps = state_array->ucNumEntries;
>
>         /* fill in the vce power states */
>         for (i = 0; i < adev->pm.dpm.num_of_vce_states; i++) {
> --
> 2.25.1
>
