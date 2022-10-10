Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE745FA51F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 22:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E250210E703;
	Mon, 10 Oct 2022 20:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2E810E700;
 Mon, 10 Oct 2022 20:16:18 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-132b8f6f1b2so13613270fac.11; 
 Mon, 10 Oct 2022 13:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zQo9CpEQOxd8V/Gnq9d1IqgBFMZ32QQpuKIj7r7NKWU=;
 b=dSUXLhcRKIZVH3q5lAX9w1Sjipi2FBkD3S3AJw8zTLfOJybtcjQoPR1iTC7PLnVVuf
 TpaUyfjZ7mwW/0WOfIdM/KQYj8DsRzcXOQWCRdFRAsaNjYx4LhHo9LGEr2BXQo9SVB4c
 Vew7ExS55SDBCIQcUathisVLmkU5xfdBBZyByYFc59O2NtR/SFG3pELPoMILT7pHFkP2
 E5c7mWZIDNSQj6OojMGL1tRz9EcOy82oNgC8XMaGSYGz3UFFBzowfv9SRchUaD5xIi+J
 a5C4WmW5YAgqfam8iTjrfr7Zo6nPUor/YeKLZNRQvYWrPKTGKKqDY7E8tqE0SXPrLUJI
 FZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zQo9CpEQOxd8V/Gnq9d1IqgBFMZ32QQpuKIj7r7NKWU=;
 b=LdAiwp0m6tOqotj7fqE/+4uSWBDbD7OJaDSoEowhUOXBC3fmi+cCVlgrP3KVmYTNjt
 wqVGmLIdtUKhL8VFBCkgPcME988XeB8PBAwd3cFMkkeaoFOgyq7K60bm/ZdYtbJ8YBz3
 JPj0UCIHb4GSWHJRAEae6uwY3/B/bC5g5/Sa/TBKBSfqoySPBjXZamy5GKVIlYdtYIQf
 zNv1eHbraEpI83ZTzcZvsFO40zqh01BnT49CbOrIUHgE7IUeqJ1tFtWT/ZENy+siTtjv
 Cdw25ZY+d8M6kSj6x6+/e1QdCsYa2f8HcxgMsrobLWlNXfgFKrqUepEBvk5NMN7U7AsR
 xsUw==
X-Gm-Message-State: ACrzQf1uUHK5waNfjBX2YCKtQb3uWg9hCXGfqRwrNNRWlyioJp+yQVqw
 1DPsAd8GuayFg7I8xv2idZ+g73hEPkj5WSfW/yU=
X-Google-Smtp-Source: AMsMyM4qJfDM7UUUcDtmV8h9gbgCQq1xrzkSI7eacitRYeX1RGvN1jyZLWCyX1jvdEm9guTjynYyZLTk48YwcyGMRtQ=
X-Received: by 2002:a05:6870:40c8:b0:136:4389:1375 with SMTP id
 l8-20020a05687040c800b0013643891375mr7561495oal.46.1665432977966; Mon, 10 Oct
 2022 13:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20221010060512.3064524-1-linux@roeck-us.net>
In-Reply-To: <20221010060512.3064524-1-linux@roeck-us.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Oct 2022 16:16:06 -0400
Message-ID: <CADnq5_N5wLSnACnpuqVCMm7LGc20cdGdRhtnwRjUBq7vbrZn8A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback() [take 2]
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: regressions@lists.linux.dev, Leo Li <sunpeng.li@amd.com>,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks.

Alex

On Mon, Oct 10, 2022 at 2:05 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Commit 5d8c3e836fc2 ("drm/amd/display: fix array-bounds error in
> dc_stream_remove_writeback()") tried to fix an array bounds error seen
> with gcc 12.0. Unfortunately, that results in another array bounds error,
> seen with older versions of gcc.
>
> Building csky:allmodconfig ... failed
> --------------
> Error log:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:
>         In function 'dc_stream_remove_writeback':
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83:
>         error: array subscript 1 is above array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
>       |                                                             ~~~~~~~~~~~~~~~~~~~~~~^~~
> In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing 'writeback_info'
>   241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
>
> We could check both i and j for overflow to fix the problem. That would,
> however, be not make much sense since it is known and provable that j <= i.
> Also, the check introduced with commit 5d8c3e836fc2 does not really add
> value since it checks if j < MAX_DWB_PIPES. Since it is known that j <= i,
> it would make more sense to check if i < MAX_DWB_PIPES. Unfortunately, that
> does not help to solve the problem observed here: gcc still complains.
>
> To solve the problem, replace the subsequent check for 'i != j' with
> 'j < i'. This is identical to the original check since we know that j <= i,
> and it makes all versions of gcc happy. Drop the check introduced with
> commit 5d8c3e836fc2 since it is not really useful and does not solve the
> problem.
>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Hamza Mahfooz <hamza.mahfooz@amd.com>
> Fixes: 5d8c3e836fc2 ("drm/amd/display: fix array-bounds error in dc_stream_remove_writeback()")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> index ae13887756bf..9f568d618cd0 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
> @@ -520,9 +520,9 @@ bool dc_stream_remove_writeback(struct dc *dc,
>         }
>
>         /* remove writeback info for disabled writeback pipes from stream */
> -       for (i = 0, j = 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++) {
> +       for (i = 0, j = 0; i < stream->num_wb_info; i++) {
>                 if (stream->writeback_info[i].wb_enabled) {
> -                       if (i != j)
> +                       if (j < i)
>                                 /* trim the array */
>                                 stream->writeback_info[j] = stream->writeback_info[i];
>                         j++;
> --
> 2.36.2
>
