Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F009B47D3CD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 15:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BB310E1EF;
	Wed, 22 Dec 2021 14:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1788810E1EC;
 Wed, 22 Dec 2021 14:36:14 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 x3-20020a05683000c300b0057a5318c517so3037378oto.13; 
 Wed, 22 Dec 2021 06:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YKV2BgPx3gxDDsLRq0VaVFxrk1VsU28qjAbSzmWcK8s=;
 b=F4FtXIvPLHbNUO3PvwjUupkMTlh/8PoI8Mlv+LjOyiWfHwe3Rp4hnQZYbK32u0+Uf9
 d2vsLj3kr/GNU6EArfgKY/7c01pFl10W5OlApZ8PcERSfkfKRDeWRSILqMhwWhSMJMzl
 VnPXpUUwQs39GmhzqKEw98M/UcJxxDoM0A0ovMyK57n2LZ6URDRbzkEgd8Z9c/VR8Gil
 61TtT5V1UDXYkcSnbPGKlZ2h+jyTxrBQuh0b6sD5WelYsvqD9k7sIMY/0vVuxC5qol0J
 fMyR/bh7AXjyBNk3tTMl0MMIGVHuTu0YO5n5j8xGABViZbXX3EdAwDSn8f6T4KLQ31/o
 0e+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YKV2BgPx3gxDDsLRq0VaVFxrk1VsU28qjAbSzmWcK8s=;
 b=3MdIq5TuQmeV7zgGnt+7diG28Z98pNV0r9aa8ZUgWFj9XHsOmJHE+hn9i4anWLpJhV
 1YLnmFdfIU65n/ulxp/imBmLxSs6Er+yE8iQl/hjQiDCNYIUDtgHeFnLa/6UZUBhvB0x
 MvbNklGk4l48bGLRgfP2jp4k+fzC2gr1va3Orb8Mt5BrYo7X82R09P+tEAKhsoCjpKpJ
 g9sRyuEBzKVb3Qb2Vn1tll7wHO6FlPWgGAj1zOKQIV/q6TqCOmwHKMzY2yGr7GDYfx/g
 rr+iBjemxbb5zYN4mhIQS/OsaC+C82Z/SOfl/9oBnjdOWcLVYgHXx2k1bkDePsxU0xIB
 etjg==
X-Gm-Message-State: AOAM532dVYlcZBzJZXeaYAylvqWdafafA1bsdXQjVjJbkeVliqfNPLAz
 bN3QDcimsWmmZidfLh/IX6XbVdsK4UprmZFTGQiVmLmP
X-Google-Smtp-Source: ABdhPJy3WcmtsTxv7JJwydEOin6GI2gdo+m/5Hy64ORpHVjNNh9PY34ZN27QovkF7vfUp/iqgBerodD18DXLUYQeGSA=
X-Received: by 2002:a9d:6855:: with SMTP id c21mr2261142oto.357.1640183773245; 
 Wed, 22 Dec 2021 06:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20211218042226.2608212-1-yzhai003@ucr.edu>
In-Reply-To: <20211218042226.2608212-1-yzhai003@ucr.edu>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 22 Dec 2021 09:36:02 -0500
Message-ID: <CADnq5_MT3Ci94jytrXWM_WJaMU7BpzQHMhJnPb-hgUhU6JDa1w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix the uninitialized variable in
 enable_stream_features()
To: Yizhuo Zhai <yzhai003@ucr.edu>
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
Cc: David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Jun Lei <jun.lei@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, "Guo, Bing" <Bing.Guo@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Agustin Gutierrez <agustin.gutierrez@amd.com>,
 Mark Morra <MarkAlbert.Morra@amd.com>, Robin Singh <robin.singh@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 "for 3.8" <stable@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Dec 17, 2021 at 11:22 PM Yizhuo Zhai <yzhai003@ucr.edu> wrote:
>
> In function enable_stream_features(), the variable "old_downspread.raw"
> could be uninitialized if core_link_read_dpcd() fails, however, it is
> used in the later if statement, and further, core_link_write_dpcd()
> may write random value, which is potentially unsafe.
>
> Fixes: 6016cd9dba0f ("drm/amd/display: add helper for enabling mst stream features")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index c8457babfdea..fd5a0e7eb029 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -1844,6 +1844,8 @@ static void enable_stream_features(struct pipe_ctx *pipe_ctx)
>                 union down_spread_ctrl old_downspread;
>                 union down_spread_ctrl new_downspread;
>
> +               memset(&old_downspread, 0, sizeof(old_downspread));
> +
>                 core_link_read_dpcd(link, DP_DOWNSPREAD_CTRL,
>                                 &old_downspread.raw, sizeof(old_downspread));
>
> --
> 2.25.1
>
