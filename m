Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8588C64D197
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 22:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA6010E077;
	Wed, 14 Dec 2022 21:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D971710E077
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 21:05:49 +0000 (UTC)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 983FE3F790;
 Wed, 14 Dec 2022 22:05:17 +0100 (CET)
Date: Wed, 14 Dec 2022 22:05:16 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kalyan Thota <kalyant@qti.qualcomm.com>
Subject: Re: [v10] drm/msm/disp/dpu1: add support for dspp sub block flush in
 sc7280
Message-ID: <20221214210516.u7drmdhc74a7rxvk@SoMainline.org>
References: <1670417963-19426-1-git-send-email-quic_kalyant@quicinc.com>
 <20221207140832.6r2kznoulfek7yye@SoMainline.org>
 <BN0PR02MB81425C5E341E0FF1C374A3A496E29@BN0PR02MB8142.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN0PR02MB81425C5E341E0FF1C374A3A496E29@BN0PR02MB8142.namprd02.prod.outlook.com>
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
Cc: "Kalyan Thota \(QUIC\)" <quic_kalyant@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "robdclark@chromium.org" <robdclark@chromium.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-12-12 11:35:15, Kalyan Thota wrote:
> [..]
> >> +             if (ctx->pending_dspp_flush_mask[dspp - DSPP_0])
> >> +                     DPU_REG_WRITE(&ctx->hw, CTL_DSPP_n_FLUSH(dspp - DSPP_0),
> >> +                             ctx->pending_dspp_flush_mask[dspp -
> >> + DSPP_0]);
> >
> >Shouldn't this loop as a whole check if _any_ DSPP flush is requested via
> >`pending_flush_mask & BIT(29)`?  The other flushes don't check the per-block
> >mask value either (and could write zero that way) but only base this check on the
> >presence of a global flush mask for that block.
> >
> BIT(29) enables dspp flush only from DPU rev 7.x.x where hierarchal flush is introduced. For other targets that supports CTL_ACTIVE, it's a NOP.

The only way this patch ever writes pending_dspp_flush_mask is followed
by unconditionally setting BIT(29) in pending_flush_mask.  I was under
the assumption that pending_dspp_flush_mask should be considered invalid
or irrelevant unless BIT(29) is set.

> With the check "pending_flush_mask & BIT(29)", unintended DSPP registers for that CTL path will be programmed to "0" which is not correct IMO.

You can also keep the second `if` to guard against that; as said the
code above does exactly this though, but I think we could assume that
if a pending sub-block flush is set, pending_dspp_flush_mask is nonzero?

> Secondly "pending_flush_mask & BIT(29)" although will not be true for DPU 6.x.x versions but can be confusing w.r.t code readability.
> Let me know your thoughts.

Ack, it is /super/ confusing that BIT(29) is used for DSPP (sub-block)
flush, but also to flash INTF_2??

In fact there are many overlapping flush bits used for different
components.  Only few are clarified via a #define.  Can you confirm
whether this is correct?  And whether these should all be pulled out
into numerically-sorted defines to improve readability and document
intentional overlap?

- Marijn
