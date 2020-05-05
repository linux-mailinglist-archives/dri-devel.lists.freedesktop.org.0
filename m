Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38051C59E2
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 16:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADEB6E40A;
	Tue,  5 May 2020 14:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC9689AC9;
 Tue,  5 May 2020 14:44:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e16so3070243wra.7;
 Tue, 05 May 2020 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PSNzqE9w9ggP7uPPAK4KUUUBVcwgOZ6j5qNH5gD8e9M=;
 b=Vrc0/YFLCwJscVtU+i19mS5ZPJ4jJwcbi1fjI6iSdiVA6OPDvdjhENuyWxI4BkCiaG
 Xr2hpK0QyALgA7Ybaf4ot3Nu7EzljpTTaX7gotdwnfOMXDO3RHOE3dbDBFQgaXK1Gg92
 h7I4fweMdD6WRiiZN5fi1xfyhNBqsrjPRkgY0VSlakJi3r8Gf9g3MgVjYT1qjrzdEXme
 zjWW0y+HTxsnpCVPCxQNzqAOhvZrKEMGQYyAizxpKafY1AieP7z+V9T5WB5VGxZPv0Hb
 OCtnke1/f+JpiPEol/Lrk/t9K27CKVwPyAW5JGPpVyMQoYxgIjYXW5w+s4go/ckRPoko
 x5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PSNzqE9w9ggP7uPPAK4KUUUBVcwgOZ6j5qNH5gD8e9M=;
 b=olUt402LkvqI0p8ikfy2sD4NHzbJeP+dgWGLhVJTM+YG/DbnqHtsP2bqHGQ2cGLAy6
 t0b6MV533cNvJa0VSaDHVYUbQlATyN8zL0C8mNP8o05Ez1ww39L4BDcmVcuJ/qKcEBmk
 Rf+DIzr8xMJuc+Y5BTchhUNv9jYB6kxkR10QDucy0/m3H6Gj1JpmM9I+YdjmjFlE2lDB
 ws0ZBA0BRxDzXYjgoGawbgfjr6t+W/w5/ngTtE+PuCmqou29HCqrLWG7/R+Q0MjCwO5O
 X3ktE7yCE3jOoO3MT4529F65qnXJIpCRFHe9jkHs000HKEYFyXfDHUvdhayOvFTndmP9
 o3iQ==
X-Gm-Message-State: AGi0PuYJ56M8uiGJhNd0Zy0R+Htz2bSM+egf7n5J/LnIdFNMV4C6Z16S
 cEpXwhH2d6tT8MaRDhIt14i+NSC2f8u/XWAMScEVGg==
X-Google-Smtp-Source: APiQypKTq0dXp0DSGKg2+q37wBHHkO+EXX+oz5MRyNqq/kymYUpV5ub11RuMWZHYWMrUunT1XhX2hQFAfXHne9/rvtM=
X-Received: by 2002:a5d:4389:: with SMTP id i9mr4322821wrq.374.1588689891557; 
 Tue, 05 May 2020 07:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200502031141.2732221-1-natechancellor@gmail.com>
In-Reply-To: <20200502031141.2732221-1-natechancellor@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 May 2020 10:44:40 -0400
Message-ID: <CADnq5_NdtZh5_RGDWKJ9c_42XLvrncCs5DDU1YSptfZP94KXkQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Avoid integer overflow in
 amdgpu_device_suspend_display_audio
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 2, 2020 at 4:35 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> When building with Clang:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:4160:53: warning: overflow in
> expression; result is -294967296 with type 'long' [-Winteger-overflow]
>                 expires = ktime_get_mono_fast_ns() + NSEC_PER_SEC * 4L;
>                                                                   ^
> 1 warning generated.
>
> Multiplication happens first due to order of operations and both
> NSEC_PER_SEC and 4 are long literals so the expression overflows. To
> avoid this, make 4 an unsigned long long literal, which matches the
> type of expires (u64).
>
> Fixes: 3f12acc8d6d4 ("drm/amdgpu: put the audio codec into suspend state before gpu reset V3")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1017
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 6f93af972b0a..caa38e7d502e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4157,7 +4157,7 @@ static int amdgpu_device_suspend_display_audio(struct amdgpu_device *adev)
>                  * the audio controller default autosuspend delay setting.
>                  * 4S used here is guaranteed to cover that.
>                  */
> -               expires = ktime_get_mono_fast_ns() + NSEC_PER_SEC * 4L;
> +               expires = ktime_get_mono_fast_ns() + NSEC_PER_SEC * 4ULL;
>
>         while (!pm_runtime_status_suspended(&(p->dev))) {
>                 if (!pm_runtime_suspend(&(p->dev)))
>
> base-commit: fb9d670f57e3f6478602328bbbf71138be06ca4f
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
