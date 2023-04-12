Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CBC6DFDF2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 20:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE2810E91B;
	Wed, 12 Apr 2023 18:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD77E10E91F
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 18:50:58 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id BFAD320251;
 Wed, 12 Apr 2023 20:50:53 +0200 (CEST)
Date: Wed, 12 Apr 2023 20:50:51 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add DSC range checking during
 resource reservation
Message-ID: <szwu75yxcfxeyvfvrsyuoc3jeoaylydwtlzm3cevmpr3zpmfpo@wrdgbf3w3de2>
References: <1681247380-1607-1-git-send-email-quic_khsieh@quicinc.com>
 <qvgbm3wimai3jytnikbcixipvwqn2uywqpg4mn6mjh5atergfx@wa4edsrp7y22>
 <96416911-bca3-b007-b036-1c4463e83aaa@quicinc.com>
 <24c5aa23-9b3c-787c-10aa-e9d5ad91512b@linaro.org>
 <49479b93-b364-d882-7a77-08223a94ed36@quicinc.com>
 <tczt5alqbadkodgorqm4pljpqkn5bc4efpxiy3em7bgu7gqaka@3cdszu4k6rhk>
 <8310d7ce-7ac0-05a6-b95a-c18a498f7644@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8310d7ce-7ac0-05a6-b95a-c18a498f7644@quicinc.com>
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
Cc: sean@poorly.run, vkoul@kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, andersson@kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 agross@kernel.org, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-12 10:48:18, Abhinav Kumar wrote:
[..]
> > The only way to trigger this newly introduced range check is by omitting
> > the DSC_x constants and manually writing e.g. an out-of-range value 10
> > here, or setting DSC_NONE.  This is only allowed for interfaces.
> > 
> 
> Correct, its just working on an implicit understanding that the indices 
> in the catalog

.. this sentence appears to be incomplete: what did you want to say? ..

> which might still be right stick to the RM limits.
> 
> Thats why this is not bad to have.

What do you mean by "RM limits"?  We have constants in the kernel that
both define the maximum number of blocks in these arrays and a
predefined set of ids that block can have.  These are all used in
constant structs in the catalog, so there's nothing "software" or
SoC-specific limiting about this (except what is available in the
arrays).

[..]
> I think kuogee just added this to keep it consistent with other checks 
> present in the RM. So I didnt see any harm with that.

Yep, that's the only reason

> If he did see an issue, i will let him report that here.

If so an out-of-bounds constant was hardcoded in dpu_hw_catalog.c.

> Otherwise, I dont want to spend more time discussing this bounds check 
> when other blocks already have it.

I'll whip up a patch to clear out the extraneous lookup (assuming there
is no other reason/dependency for it to be there...) and can follow that
up with removing these range checks of known-good values in `const
struct` fields.

- Marijn
