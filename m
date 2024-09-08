Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF799706CE
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2024 13:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D4610E081;
	Sun,  8 Sep 2024 11:23:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=math.uni-bielefeld.de header.i=@math.uni-bielefeld.de header.b="pDRBNJRs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.math.uni-bielefeld.de (smtp1.math.uni-bielefeld.de
 [129.70.45.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22FA110E081;
 Sun,  8 Sep 2024 11:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=math.uni-bielefeld.de; s=default; t=1725794599;
 bh=GAHLsftUhhnPcpc0uT5uzBSX2NzdjwHmltUPb3AwtuI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=pDRBNJRsaW0GEriSMht6ab29UL6njGVsDEubkhiO0XirdrZp4g1wq1hMIg5Ry1OaU
 3q4bJofQV2FcqELNQ74YFNKDnQkG3FUYzZWeDAW01LszqnQ/zqXSnxYfx+unsvesew
 o/QOVhmrZsASuJcgbDWmgq0Vja4z7rHdcS9NZSjIOpKIjO4gPhgrbIVbUc83vNGwEJ
 5ucQ99u/UIe9IvWUlBLuGLDYbIQx5PGg2B/SEl+KNFa9YhKXIyBmWbmeAj4E3A4Ir4
 ZAqHJGjapV1+F3EAvnrvEOgm3tzBAs70vZOPx7vwWW+tIpVrXOPs8wIN1BwvXsx7d3
 6wFl7geqzlc6g==
Received: from [192.168.0.106]
 (dslb-088-074-203-146.088.074.pools.vodafone-ip.de [88.74.203.146])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by smtp1.math.uni-bielefeld.de (Postfix) with ESMTPSA id A1059207D8;
 Sun,  8 Sep 2024 13:23:18 +0200 (CEST)
Message-ID: <deb6d962-f24e-4769-b313-be3b0efb873b@math.uni-bielefeld.de>
Date: Sun, 8 Sep 2024 13:23:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/amd: fix VRR race condition during IRQ handling
To: Christopher Snowhill <chris@kode54.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1725269643.git.tjakobi@math.uni-bielefeld.de>
 <D40Q9ZLDQIZF.3OERFS0AYREN0@kode54.net>
Content-Language: en-US
From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Autocrypt: addr=tjakobi@math.uni-bielefeld.de; keydata=
 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
 JRHWPGCL3BhOxQ==
In-Reply-To: <D40Q9ZLDQIZF.3OERFS0AYREN0@kode54.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 9/8/24 09:35, Christopher Snowhill wrote:

> On Mon Sep 2, 2024 at 2:40 AM PDT, tjakobi wrote:
>> From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>
>> Hello,
>>
>> this fixes a nasty race condition in the set_drr() callbacks for DCN10
>> and DCN35 that has existed now since quite some time, see this GitLab
>> issue for reference.
>>
>> https://gitlab.freedesktop.org/drm/amd/-/issues/3142
>>
>> The report just focuses von DCN10, but the same problem also exists in
>> the DCN35 code.
> Does the problem not exist in the following references to funcs->set_drr?
>
> drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:      if (pipe_ctx->stream_res.tg->funcs->set_drr)
> drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:              pipe_ctx->stream_res.tg->funcs->set_drr(
> drivers/gpu/drm/amd/display/dc/hwss/dce110/dce110_hwseq.c:              pipe_ctx[i]->stream_res.tg->funcs->set_drr(
> drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:        if (pipe_ctx->stream_res.tg->funcs->set_drr)
> drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:                pipe_ctx->stream_res.tg->funcs->set_drr(
> drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:                if (pipe_ctx->stream_res.tg->funcs->set_drr)
> drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c:                        pipe_ctx->stream_res.tg->funcs->set_drr(
> drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c:        if (pipe_ctx->stream_res.tg->funcs->set_drr)
> drivers/gpu/drm/amd/display/dc/hwss/dcn31/dcn31_hwseq.c:                pipe_ctx->stream_res.tg->funcs->set_drr(
> drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c:      if (pipe_ctx->stream_res.tg->funcs->set_drr)
> drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c:              pipe_ctx->stream_res.tg->funcs->set_drr(

Maybe. But the big difference I see here, is that in this code there 
isn't even any kind of NULL check applied to tg. Or most of the members 
of *pipe_ctx. If there really is the same kind of problem here, then one 
would need to rewrite a bit more code to fix stuff.

E.g. in the case of  dcn31_hwseq.c, the questionable code is in 
dcn31_reset_back_end_for_pipe(), which is static and only called from 
dcn31_reset_hw_ctx_wrap(). Which is assigned to the .reset_hw_ctx_wrap 
callback. And this specific callback, from what I can see, is only 
called from dce110_reset_hw_ctx_wrap(). Which is then assigned to the 
.apply_ctx_to_hw callback. The callback is only called from 
dc_commit_state_no_check(). That one is static again, and called from 
dc_commit_streams().

I could trace this even further. My point is: I don't think this is 
called from any IRQ handler code. And given the depth and complexity of 
the callgraph, I have to admit, that, at least at this point, this is a 
bit over my head.

Sure, I could now sprinkle a bunch of x != NULL in the code, but that 
would be merely voodoo. And I usually try to have a theoretical basis 
when I apply changes to code.

Maybe if someone from the AMD display team could give some insight if 
there still is potentially vulnerable code in some of the instances that 
Christopher has posted, then I would gladly take a look.

With best wishes,
Tobias

>
>> With best wishes,
>> Tobias
>>
>> Tobias Jakobi (2):
>>    drm/amd/display: Avoid race between dcn10_set_drr() and
>>      dc_state_destruct()
>>    drm/amd/display: Avoid race between dcn35_set_drr() and
>>      dc_state_destruct()
>>
>>   .../amd/display/dc/hwss/dcn10/dcn10_hwseq.c   | 20 +++++++++++--------
>>   .../amd/display/dc/hwss/dcn35/dcn35_hwseq.c   | 20 +++++++++++--------
>>   2 files changed, 24 insertions(+), 16 deletions(-)
