Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F7D2E87F2
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jan 2021 16:31:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436E38990D;
	Sat,  2 Jan 2021 15:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 225AC89907;
 Sat,  2 Jan 2021 15:31:49 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d26so26559155wrb.12;
 Sat, 02 Jan 2021 07:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0VSvM7IGxFdMYmuCzZe4nwk/Wn91F9QoqiNO7b3rATM=;
 b=ZcAlZDVBCGnBnRwsJnofeqsLtA4f3uyTmAFRqnv9fEaO86cNJ5fli1klHH8aAuiO9U
 hIED/txcGKth2CgkE7D+hLBdAvaoLX+5TYKFCvTGUIHRXuSUJzeVL592KwM37gYVokPV
 lt4ish9O/I/IF8qAwyTaQDCsBvIyWK7j+d3ke0fqq+GA2i8wpMlorztW2ZvWS1DS28xz
 ckgyroUUl2ZSJ/Z32MTzPsaNjWdKxger6zOxsb/HfK/xFaHZsdVh9pvVTrnU2ROzys9R
 XhaHXCm3yo29tAaT5gE9hid4LDEQFmj/dxEfhM0tAa9SHjX7aXAxt3kMCtoPHe/bu+Cs
 JX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0VSvM7IGxFdMYmuCzZe4nwk/Wn91F9QoqiNO7b3rATM=;
 b=qjscYV07QEYvTIhWhicd9Y6F+TCMt1jYLaQC8VN1anSB/0Q/TSM+5eXGS6QZotTGVS
 zVoXxMCi6+e26cbp1w3qPzn442D6Jqh7ab0XeTFQEOpmE1j4SIfSiSIc/J3OvF0EIT/A
 tmFO0ErNlZf0SMtnuaOCFdXtURoTcKmEX1rUECj/0h7oR3Xw2j8yoFynr3zb+zt7MPsi
 kigyxu5ktm8wf7Z6LnuKHv2Co9yLAVxRcqodGhEDLMTKxJer/OOIXvLxGh3zedmWBClY
 LHk6vRqMAnth2VdrC0C/afZgAjpNC0WA+1b5E81xxfdV1Te0xfJ+ZV3p5QffTqQq2QqA
 E1gA==
X-Gm-Message-State: AOAM530rbq29S1gOg40Go7yVl2O+X2/O0Hadzg2jZhCDRVkRcZFWcMGK
 IxXbVok5rD0TP8ANcMHisrWCQVvmkgATT/tTYyHaAz9w
X-Google-Smtp-Source: ABdhPJyAYfUjjCu/KWmpa0MdtxyAtGejbw3BRDE46+yFZNHqdCY/uJRjyuBytg3c/Mvo2Ng3OOyVi1YbS9KHiUfdzJs=
X-Received: by 2002:a5d:6a05:: with SMTP id m5mr71792388wru.96.1609601507641; 
 Sat, 02 Jan 2021 07:31:47 -0800 (PST)
MIME-Version: 1.0
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
In-Reply-To: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Sat, 2 Jan 2021 16:31:36 +0100
Message-ID: <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>
Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, zhan.liu@amd.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen
<bas@basnieuwenhuizen.nl> wrote:
>
> With modifiers one can actually have different format_info structs
> for the same format, which now matters for AMDGPU since we convert
> implicit modifiers to explicit modifiers with multiple planes.
>
> I checked other drivers and it doesn't look like they end up triggering
> this case so I think this is safe to relax.
>
> Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for converted metadata.")
> ---
>  drivers/gpu/drm/drm_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index e6231947f987..f5085990cfac 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>         if (ret)
>                 goto out;
>
> -       if (old_fb->format != fb->format) {
> +       if (old_fb->format->format != fb->format->format) {

This was btw. the original way before Ville made it more strict about
4 years ago, to catch issues related to tiling, and more complex
layouts, like the dcc tiling/retiling introduced by your modifier
patches. That's why I hope my alternative patch is a good solution for
atomic drivers while keeping the strictness for potential legacy
drivers.

-mario

>                 DRM_DEBUG_KMS("Page flip is not allowed to change frame buffer format.\n");
>                 ret = -EINVAL;
>                 goto out;
> --
> 2.29.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
