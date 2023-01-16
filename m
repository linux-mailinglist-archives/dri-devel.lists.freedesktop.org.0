Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B8566D120
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 22:54:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1B310E4ED;
	Mon, 16 Jan 2023 21:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300E610E4EC;
 Mon, 16 Jan 2023 21:54:42 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 f5-20020a9d5f05000000b00684c0c2eb3fso7769119oti.10; 
 Mon, 16 Jan 2023 13:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s1FVL9rmxMWH5/xv/SjySidtAVSYhrKt+B3XAFlRA4I=;
 b=nhs09Bx3K39gwZ/3ZZEYiw+ZvGJrlexvSaQGnFzGpmPSCOwQ2tTCNHWIywHcm/Oti3
 flDYXp7fW0FtIYzHu3GW3QCwmYpRjwzC9FLFZYZBNNDFJ9FhwC9jnkavMAZZKS90QvWy
 Ejw5iNvlMH9hYuL3awFYEznf4Vxrer06Tcav1ORBSl3C94yCT4yfL9a4vppyoTSXC4jV
 rPOvR/58V3YIjPMMNgeJH2Ws5F+oVp/5FDh7/Dpm3EHk/hCQgXk+m8zVfWAaRJ6iFNx4
 jyxz6a3586RSdkSrVOSPGP6c0d2TmzZgoM29HkgaCV+rXIsVp+sHmGlMtIuorjHj8RKU
 J/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s1FVL9rmxMWH5/xv/SjySidtAVSYhrKt+B3XAFlRA4I=;
 b=NPef8Mp4HsoBMx1WqwTpr8tIjc2jJEnTtTVVMn5FEhJ4jFbjhJJWPvFqNu8zZ8sDTk
 9TBe1NQuMMz4yJebuAF/yudF2B0iTGJe0sGdn/eM1QFpwO1zgfbxdtzStxQ5e9ATbkkC
 Ycp74u4b8r2a9+eHfOrKP0+O1k/SGaDc3XBv/YEE2MQsTzK18DFoNLV58HmKtMb3piUw
 6HbTxoRffBzjEsr/JirWAliheXDQ9VHKFq+bfqiRGtwsaBw6MSjtKXf/QVP3t7Gxul/I
 s1E7gDE1HswJ6seBQJeR91aq1Xu+bqBwnoZq5g5FKF7TKZdGtX52bippey8DeUI79vi8
 1t6Q==
X-Gm-Message-State: AFqh2kocBRj+I00btbw2+ZXfJD9z9PrNV1Bn8kM/fppcuo3A5TKcQdg4
 vU3HAINSF50/GZGfM15gd6couML27G0z90RQmFY=
X-Google-Smtp-Source: AMrXdXsimriivh6Z0mOx7x+Gw0ZPisggJLjDT9QQnX/1z2M8tpug7NSnxNLuMWzqmm9tpvzhaml20DK6GkzE4LIPctE=
X-Received: by 2002:a05:6830:3486:b0:675:cde9:90b9 with SMTP id
 c6-20020a056830348600b00675cde990b9mr36311otu.123.1673906081455; Mon, 16 Jan
 2023 13:54:41 -0800 (PST)
MIME-Version: 1.0
References: <20230116212004.860968-1-gpiccoli@igalia.com>
 <20230116212004.860968-2-gpiccoli@igalia.com>
 <CADnq5_M6z=BTvcspVsC_5YmZCwEP48e=6nvcr4ck4Q7KR126MA@mail.gmail.com>
 <dbb667bb-dbc0-a6ff-63e2-b81309a2fc62@igalia.com>
In-Reply-To: <dbb667bb-dbc0-a6ff-63e2-b81309a2fc62@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 16:54:27 -0500
Message-ID: <CADnq5_PcviEmNKryGY1mz4phDECioGLpTOoA7ipJEoC=cm3gMg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/amdgpu/vcn: Deduplicate indirect SRAM checking
 code
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
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
Cc: Lazar Lijo <Lijo.Lazar@amd.com>, kernel@gpiccoli.net, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Sonny Jiang <sonny.jiang@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 4:51 PM Guilherme G. Piccoli
<gpiccoli@igalia.com> wrote:
>
> On 16/01/2023 18:41, Alex Deucher wrote:
> > [...]
> >> +       case IP_VERSION(4, 0, 0):       /* Vega10 */
> >
> > This comment is incorrect.  Vega10 does not have VCN (it has UVD and VCE).
> >
> > Alex
>
> Thanks Alex! I'll resubmit V2 with this comment removed.
>
> I've stolen it from
> https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c#L1147

That is for a different IP (SDMA).

Alex

> , but obviously I misunderstood the mapping here heheh
>
> Cheers,
>
>
> Guilherme
