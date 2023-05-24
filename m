Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D2F70F368
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 11:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A39910E63E;
	Wed, 24 May 2023 09:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142F010E673
 for <dri-devel@lists.freedesktop.org>; Wed, 24 May 2023 09:48:44 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 7EF1C3F321;
 Wed, 24 May 2023 11:48:39 +0200 (CEST)
Date: Wed, 24 May 2023 11:48:37 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Message-ID: <bvjtgmuyz4zdjvt4jyjyt5hasiwnnaz4lyse6mf6b7grtig23f@yuji3z2mxue2>
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-05-23 13:01:13, Abhinav Kumar wrote:
> 
> 
> On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
> > Drop SSPP-specifig debugfs register dumps in favour of using
> > debugfs/dri/0/kms or devcoredump.
> > 
> 
> I did see another series which removes src_blk from the catalog (I am 
> yet to review that one) . Lets assume that one is fine and this change 
> will be going on top of that one right?

It replaces src_blk with directly accessing the blk (non-sub-block)
directly, because they were overlapping anyway.

> The concern I have with this change is that although I do agree that we 
> should be in favor of using debugfs/dri/0/kms ( i have used it a few 
> times and it works pretty well ), devcoredump does not have the support 
> to dump sub-blocks . Something which we should add with priority because 
> even with DSC blocks with the separation of enc/ctl blocks we need that 
> like I wrote in one of the responses.
> 
> So the "len" of the blocks having sub-blocks will be ignored in favor of 
> the len of the sub-blocks.

The sub-blocks are not always contiguous with their parent block, are
they?  It's probably better to print the sub-blocks separately with
clear headers anyway rather than dumping the range parent_blk_base to
max(parent_blk_base+len, parent_blk_base+sblk_base+sblk_len...).

- Marijn

> If we remove this without adding that support first, its a loss of debug 
> functionality.
> 
> Can we retain these blocks and remove dpu_debugfs_create_regset32 in a 
> different way?

<snip>
