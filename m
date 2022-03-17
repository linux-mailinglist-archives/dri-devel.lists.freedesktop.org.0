Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C13B94DCF74
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 21:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D8F10E7E2;
	Thu, 17 Mar 2022 20:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F30710E7D1;
 Thu, 17 Mar 2022 20:37:39 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id q129so4849646oif.4;
 Thu, 17 Mar 2022 13:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8j5CUElz+Xo86FpooZsOlxnvFZ+PR1Bpcl1guwPiarA=;
 b=gz0dwdB8WpOZfkssgMWBpHYCL8oGf20dbtwM2azw1sRmxoE+lAi28BW0CPKaTDxa+R
 9qrDBgrcGWMV1FE74Mrg+sEbObEM4Q6fywZ/x9fQ2pWh6jOt7DHaL6uyUsd9eZ50Hx1g
 a1zGOvmzOsR+FfSIMuku+Bcgy4xTh4yufIPbsFw/XmhG+2VQw1z5JKx5ZE3ZsDAAR1Hg
 69Ad71CsximB9oHTzh0lVNA7zT/75t3A8YbvzEv6IQh9cGAnkMuzxODeZdJMClOPS1tw
 b8cD/K4fg+7vcrBMeI3NArluLYk2xFB4Hkvsid/QhrWCDZpdc01AtUZZcpC/6rySgWo0
 7EVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8j5CUElz+Xo86FpooZsOlxnvFZ+PR1Bpcl1guwPiarA=;
 b=gmfXIn1ZR3IQrHKHyEuqTpi/72aJdNqjh0mO7Pw/CFM5DdrKYyG8Iaesmrs18T/uG/
 B+E/5pqhVz740yMKVZUfSFiyFy4boK+a7Vc3yLTaftwndFwS7TE3YNA7jh8U7cZgDJ20
 Vxr3XVlsyf+ryFDIYwAXBmniayKkRDwCKm4m8pWibh4mBD0dDom0u9ZajLKOd8gajrzt
 XatJAmIIC1gV40GwDGc2oEzfqpIMVYesiU01abaUNelcBRaLM1z0rFkwfi3+yZE9J1or
 pHhztImmulktnJRDKI7/puep5rf9QedGgDDnt1X1jvP6lc8MZ5jL1IM+lw/1fw73iXSu
 lG5A==
X-Gm-Message-State: AOAM532l5urXSC0iNsFn+Z0Fs99d9rnO8kwV62lqv8ekvF9kgkX3VBTt
 bz3Cq8Ly+LIJHH+xllO1h06eICP9lb6UxZ/5ybw=
X-Google-Smtp-Source: ABdhPJyiBHRtB02UVP/cno1U+t2NeLS239WXwvlRFSWx7qxMOQM9DsBhnreJnrLXxaQEnb0U3SvkU/5zi4guhJV6pTE=
X-Received: by 2002:aca:d07:0:b0:2ec:eaaf:a036 with SMTP id
 7-20020aca0d07000000b002eceaafa036mr2877112oin.253.1647549458774; Thu, 17 Mar
 2022 13:37:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220316084148.GD30941@kili>
In-Reply-To: <20220316084148.GD30941@kili>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Mar 2022 16:37:27 -0400
Message-ID: <CADnq5_OSHLyHew-emmzp99=8kigJohWjzL4z2dGCiDU=1dB-tw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix off by one in amdgpu_gfx_kiq_acquire()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
 Tao Zhou <tao.zhou1@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Lijo Lazar <lijo.lazar@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 yipechai <YiPeng.Chai@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Alex Xie <AlexBin.Xie@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Mar 16, 2022 at 4:42 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This post-op should be a pre-op so that we do not pass -1 as the bit
> number to test_bit().  The current code will loop downwards from 63 to
> -1.  After changing to a pre-op, it loops from 63 to 0.
>
> Fixes: 71c37505e7ea ("drm/amdgpu/gfx: move more common KIQ code to amdgpu_gfx.c")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index 8fe939976224..28a736c507bb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -266,7 +266,7 @@ static int amdgpu_gfx_kiq_acquire(struct amdgpu_device *adev,
>                     * adev->gfx.mec.num_pipe_per_mec
>                     * adev->gfx.mec.num_queue_per_pipe;
>
> -       while (queue_bit-- >= 0) {
> +       while (--queue_bit >= 0) {
>                 if (test_bit(queue_bit, adev->gfx.mec.queue_bitmap))
>                         continue;
>
> --
> 2.20.1
>
