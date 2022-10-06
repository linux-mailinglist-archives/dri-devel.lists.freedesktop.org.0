Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D78445F612D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 08:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC86E10E7F1;
	Thu,  6 Oct 2022 06:46:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2796310E34E;
 Thu,  6 Oct 2022 06:46:18 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id f193so1127666pgc.0;
 Wed, 05 Oct 2022 23:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8U8sTusKp4JhPNItLtJY5qj5sKhcgHnhEpfdOFEcRoc=;
 b=f0XpWhr7eCwozs4wwkPIJYQ/+vtm+mmphwUBVU9QPj4IA/j45fT8I6SSnjcgQAbu2f
 zjv5a34R22FYrdrlUz9an2Y3CvArVzV39Hm/vOkSChKJzyX+NhsrblOdC+lfKlZNYQXt
 0EePa93WtFh9+sZtD4MCvZm8LJyA753SFTk253mIctN46PaC5cBKum59IVDUcNl8FBC9
 giccn+9tT32i8A3PVRLF2bhwSE7ElFI1/Oo3jE8pvB2c/+hw6WBELE3UTSmNZR3kEPBs
 /NGR5Ov4b0AnxilBLCc4UYmVvCbWEtCN2sM7LWvIhD/5v4coKTfREsIDH9Nsgd9wkMXl
 fFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8U8sTusKp4JhPNItLtJY5qj5sKhcgHnhEpfdOFEcRoc=;
 b=6BL1n+KQz/n0mw0bV7c7w9IDDoN2zfEsLHA6wwmjRIs0Mfk2JckzeS1KwiPdV23Zo5
 TCfkdujHiirRBsWZCBM4uLV7gM4cChZOzgnyG7HmcHreOO3652ljd3I90yulDjRHSA6H
 hn1BV3uam5b++E4FRAt45g6+MQLbGm2lBlEZqO5ZbZhVhHLIpVSAdM2LjKZ1zKWrGnq/
 /vEYWPwE6o/v4Om+qsKzErSLsW7ZfxlWfOZBS6PseTSarx/OSULp25FKQ/NnWJS1PNEI
 dBUnQ1m2oqAyGKzr+brIersJ+gJmaLlzLocPIXocYrngG0vYLaq2vTE5mZ9HTiP8Hhcj
 1biQ==
X-Gm-Message-State: ACrzQf3OeBqDnKAG2tmm67QzJtXGPqgPj6VCriSzA010+7EfQwrVMOlW
 RT2woGhJZLSmpx/D8v/2k32JDJKpaU2lPA==
X-Google-Smtp-Source: AMsMyM5u5IO13G+eelWsn4vfLpVx9Dbk4VoW5mUJ5i95QvSBXZ0Lyc6hEUtNTQNChRi+hrOR0NQGFQ==
X-Received: by 2002:a63:211a:0:b0:451:f444:3b55 with SMTP id
 h26-20020a63211a000000b00451f4443b55mr3111339pgh.60.1665038777524; 
 Wed, 05 Oct 2022 23:46:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a1709026b8300b0017f62877604sm5852884plk.66.2022.10.05.23.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 23:46:16 -0700 (PDT)
Date: Wed, 5 Oct 2022 23:46:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback()
Message-ID: <20221006064615.GA2817657@roeck-us.net>
References: <20220927191200.216488-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220927191200.216488-1-hamza.mahfooz@amd.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Paul Hsieh <paul.hsieh@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Hersen Wu <hersenwu@amd.com>, David Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Alex Hung <alex.hung@amd.com>,
 "Lee, Alvin" <Alvin.Lee2@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pavle Kotarac <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 03:12:00PM -0400, Hamza Mahfooz wrote:
> Address the following error:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function ‘dc_stream_remove_writeback’:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: error: array subscript [0, 0] is outside array bounds of ‘struct dc_writeback_info[1]’ [-Werror=array-bounds]
>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
>       |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
> In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
>                  from ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
>                  from ./drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
>                  from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
> ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing ‘writeback_info’
>   241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
>       |
> 
> Currently, we aren't checking to see if j remains within
> writeback_info[]'s bounds. So, add a check to make sure that we aren't
> overflowing the buffer.
> 
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

With gcc 11.3, this patch doesn't fix a problem, it introduces one.

Building csky:allmodconfig ... failed
--------------
Error log:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript 1 is above array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
  527 |                                 stream->writeback_info[j] = stream->writeback_info[i];

Building mips:allmodconfig ... failed
--------------
Error log:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
  527 |                                 stream->writeback_info[j] = stream->writeback_info[i];

Building arm:allmodconfig ... failed
--------------
Error log:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
  527 |                                 stream->writeback_info[j] = stream->writeback_info[i];

Guenter
