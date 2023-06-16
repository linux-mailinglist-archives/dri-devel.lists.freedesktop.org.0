Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6F5733C8B
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 00:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E0410E69B;
	Fri, 16 Jun 2023 22:44:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2C810E69B
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 22:44:03 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9E1032147A;
 Sat, 17 Jun 2023 00:44:01 +0200 (CEST)
Date: Sat, 17 Jun 2023 00:44:00 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 04/19] drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
Message-ID: <5jevnbocflm3tzyensi5uex4umptyy3wsbjbercm3vodqxx3md@jnbi7g5oyys6>
References: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
 <20230616100317.500687-5-dmitry.baryshkov@linaro.org>
 <gnffmawpcboaxxlpfictfkcqozppzpzaofqu5e75youwicltdz@acpdxcu73k7b>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gnffmawpcboaxxlpfictfkcqozppzpzaofqu5e75youwicltdz@acpdxcu73k7b>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-17 00:41:40, Marijn Suijten wrote:
<snip>
> > -	cfg = _top_offset(idx, m, addr, &mdp->hw);
> > -	if (IS_ERR_OR_NULL(cfg)) {
> > -		kfree(mdp);
> > -		return ERR_PTR(-EINVAL);
> > -	}
> > +	mdp->hw.blk_addr = addr + m->mdp->base;
> > +	mdp->hw.log_mask = DPU_DBG_MASK_TOP;
> 
> You lost the assignment of m->mdp to the local cfg variable, causing
> mdp->caps = cfg; below to remain NULL.

To solve that in a clean way, you might as well pass `const struct
dpu_mdp_cfg *cfg` directly from dpu_kms.c into dpu_hw_mdptop_init, as I
did for the other HW blocks in "Pass catalog pointers in RM to replace
for-loop ID lookups".

- Marijn
