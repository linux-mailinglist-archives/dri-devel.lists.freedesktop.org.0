Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88780809E3F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 09:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB5C10EA1B;
	Fri,  8 Dec 2023 08:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853CF10E09D;
 Thu,  7 Dec 2023 19:30:27 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so173860066b.3; 
 Thu, 07 Dec 2023 11:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701977425; x=1702582225; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=q48OiF/lVPVtmeNyCTqSSEKXn8DDTHHhml+BMoIRLy8=;
 b=ZQYbuMDFZZBKQYZ7Ik7pL1y/DOmlci9zG0EINEdVva4aQ7w8T0cO0n7YTc/kohIzOn
 4FSGgNn+mgV4NnVUHjxUjzlQW2Hjh1BUW03QDORTM/GT7sj1grbszQXUbmn0bvI3vwCT
 ulibgEhXRwX+InbICDQP8XPm6N29cFHzfEyyJDz5cqq6DDN93iQGEWTEXRaYIqmPxuSa
 8EG+jxMJMrdyXUIRxywwsKlTDiN16d1z5IWqCFR7iVgXTzTrUaFIdI3XwyDPPj90iCC1
 1HLRQ2w/meospVEvGuHLBE4erFJtEakyftROA1vcn3ZbwmVYfXMt1XNvlFnDpF1JZkpI
 TvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701977425; x=1702582225;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q48OiF/lVPVtmeNyCTqSSEKXn8DDTHHhml+BMoIRLy8=;
 b=LoBY8/sLjTrd3yHdHflPK0M6JdKEXtGcUWmjeIyK54cLpUqLZzV2mKGTywveJJnzHC
 jhvUI4z1GFBuxFru2bCsj+x/AWJWnBxhRH9JZjQEFqgq/W7F7LGLPTNfqM8C2Gyp7EOL
 V7BuYrAYQxMp9QM5Sbr2E0xJCy3nRfHHATVGZl2LbuDFvXPp5mkoHOOBtFwrccM0I41m
 7F4T6W9Pzx/wvcvsgrNdoVK+vQn1hl0lD8lgYKLwEqS7np58Uqms3Wr4iUlPTatZma6c
 p9DQsVyWmzigCJWxua0O6GbkKhDd8HMgZuTl6Me2+3b5gvhhaDC4ZS+vlYcuMqkn/jLw
 3aMw==
X-Gm-Message-State: AOJu0YzW/Zl4upVpwBD2KpUM7amfwCyx+tKiQZd7199AfKd+Z0w4IWwp
 kSSliRVrpgtM6kkMmKCKSZFV3ia9EpSUiII4nOcguaVRaFf4Qw==
X-Google-Smtp-Source: AGHT+IFO2W/Tsba8mLbIR2TuZGFSrj7b1RB5EaDc4fZr14vH2kCpyGnEl8oaH8gZrPquoIIdjmOZr3Aq4DR6s8a1X10=
X-Received: by 2002:a17:906:fb05:b0:a19:a19b:c736 with SMTP id
 lz5-20020a170906fb0500b00a19a19bc736mr1781633ejb.134.1701977425265; Thu, 07
 Dec 2023 11:30:25 -0800 (PST)
MIME-Version: 1.0
References: <20231207182532.19416-1-xaver.hugl@gmail.com>
In-Reply-To: <20231207182532.19416-1-xaver.hugl@gmail.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Thu, 7 Dec 2023 20:30:13 +0100
Message-ID: <CAFZQkGzOn9L+qmDm=_0kBrkX1H0obqYsjpyuOzMuO8xS1Bm1GQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix cursor-plane-only atomic commits not
 triggering pageflips
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 08 Dec 2023 08:35:21 +0000
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
Cc: stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, it looks like I sent this too soon. I tested the patch on a
second PC and it doesn't fix the issue there.


Am Do., 7. Dez. 2023 um 19:25 Uhr schrieb Xaver Hugl <xaver.hugl@gmail.com>:
>
> With VRR, every atomic commit affecting a given display must trigger
> a new scanout cycle, so that userspace is able to control the refresh
> rate of the display. Before this commit, this was not the case for
> atomic commits that only contain cursor plane properties.
>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3034
> Cc: stable@vger.kernel.org
>
> Signed-off-by: Xaver Hugl <xaver.hugl@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index b452796fc6d3..b379c859fbef 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8149,9 +8149,15 @@ static void amdgpu_dm_commit_planes(struct drm_atomic_state *state,
>                 /* Cursor plane is handled after stream updates */
>                 if (plane->type == DRM_PLANE_TYPE_CURSOR) {
>                         if ((fb && crtc == pcrtc) ||
> -                           (old_plane_state->fb && old_plane_state->crtc == pcrtc))
> +                           (old_plane_state->fb && old_plane_state->crtc == pcrtc)) {
>                                 cursor_update = true;
> -
> +                               /*
> +                                * With atomic modesetting, cursor changes must
> +                                * also trigger a new refresh period with vrr
> +                                */
> +                               if (!state->legacy_cursor_update)
> +                                       pflip_present = true;
> +                       }
>                         continue;
>                 }
>
> --
> 2.43.0
>
