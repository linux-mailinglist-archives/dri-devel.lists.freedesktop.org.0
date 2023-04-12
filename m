Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFC26DECAC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 09:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B1010E236;
	Wed, 12 Apr 2023 07:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8933C10E236
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:38:14 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.226.251])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 281932030B;
 Wed, 12 Apr 2023 09:38:10 +0200 (CEST)
Date: Wed, 12 Apr 2023 09:38:08 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: add DSC range checking during
 resource reservation
Message-ID: <tczt5alqbadkodgorqm4pljpqkn5bc4efpxiy3em7bgu7gqaka@3cdszu4k6rhk>
References: <1681247380-1607-1-git-send-email-quic_khsieh@quicinc.com>
 <qvgbm3wimai3jytnikbcixipvwqn2uywqpg4mn6mjh5atergfx@wa4edsrp7y22>
 <96416911-bca3-b007-b036-1c4463e83aaa@quicinc.com>
 <24c5aa23-9b3c-787c-10aa-e9d5ad91512b@linaro.org>
 <49479b93-b364-d882-7a77-08223a94ed36@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49479b93-b364-d882-7a77-08223a94ed36@quicinc.com>
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

On 2023-04-11 18:50:24, Abhinav Kumar wrote:
> 
> 
> On 4/11/2023 6:06 PM, Dmitry Baryshkov wrote:
> > On 12/04/2023 01:32, Abhinav Kumar wrote:
> >> Hi Marijn
> >>
> >> On 4/11/2023 3:24 PM, Marijn Suijten wrote:
> >>> Again, don't forget to include previous reviewers in cc, please :)
> >>>
> >>> On 2023-04-11 14:09:40, Kuogee Hsieh wrote:
> >>>> Perform DSC range checking to make sure correct DSC is requested before
> >>>> reserve resource for it.
> > 
> > nit: reserving
> > 
> >>>
> >>> This isn't performing any range checking for resource reservations /
> >>> requests: this is only validating the constants written in our catalog
> >>> and seems rather useless.  It isn't fixing any real bug either, so the
> >>> Fixes: tag below seems extraneous.
> >>>
> >>> Given prior comments from Abhinav that "the kernel should be trusted",
> >>> we should remove this validation for all the other blocks instead.
> >>>
> >>
> >> The purpose of this check is that today all our blocks in RM use the 
> >> DSC_* enum as the size.
> >>
> >> struct dpu_hw_blk *dsc_blks[DSC_MAX - DSC_0];
> >>
> >> If the device tree ends up with more DSC blocks than the DSC_* enum, 
> >> how can we avoid this issue today? Not because its a bug in device 
> >> tree but how many static number of DSCs are hard-coded in RM.
> > 
> > We don't have these blocks in device tree. And dpu_hw_catalog shouldn't 
> > use indices outside of enum dpu_dsc.
> > 
> 
> ah, my bad, i should have said catalog here. Okay so the expectation is 
> that dpu_hw_catalog.c will program the indices to match the RM limits.
> 
> I still stand by the fact that the hardware capabilities coming from 
> catalog should be trusted but this is just the SW index.

These come from the catalog.  Here's how it looks for sdm845:

	static struct dpu_dsc_cfg sdm845_dsc[] = {
		DSC_BLK("dsc_0", DSC_0, 0x80000, 0),
		DSC_BLK("dsc_1", DSC_1, 0x80400, 0),
		DSC_BLK("dsc_2", DSC_2, 0x80800, 0),
		DSC_BLK("dsc_3", DSC_3, 0x80c00, 0),
	};

The only way to trigger this newly introduced range check is by omitting
the DSC_x constants and manually writing e.g. an out-of-range value 10
here, or setting DSC_NONE.  This is only allowed for interfaces.

As we trust the kernel, hence this config, the if introduced here (and
already present for other blocks) has pretty much no effect.

> > Marijn proposed to pass struct dpu_foo_cfg directly to 
> > dpu_hw_foo_init(). This will allow us to drop these checks completely.
> > 
> 
> Ah okay, sure, would like to see that then uniformly get rid of these 
> checks.

This suggested change won't make a difference to the range check
introduced here.  The range-check validates that the catalog sets `id`
to a sensible value (since we do not use array indices for this, we
could even decide to do so via `[DSC_0] = (struct dpu_dsc_cfg){ ... }`
if we so desire in the future).

It'll only get rid of the `_xxx_offset` functions looping through the
arrays in the catalog again, to find a catalog pointer with matching
`id` while we aleady have exactly that pointer here via &cat->dsc[i].

The only semantic difference incurred by the change is when the same
`id` value is (erroneously) used multiple times in an array: the current
implementation will always find and return the first block while the
suggestion will make sure all blocks are used.
But again, reusing an `id` is an error and shouldn't happen.

> > For the time being, I think it might be better to add these checks for 
> > DSC for the sake of uniformity.
> > 
> 
> Yes, i think so too.

I'd rather see a separate patch removing them then, as my suggestion
won't affect the legality of the range check.

- Marijn
