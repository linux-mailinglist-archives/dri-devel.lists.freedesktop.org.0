Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DBA6DEC81
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 09:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B948810E714;
	Wed, 12 Apr 2023 07:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D90410E714
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:24:18 +0000 (UTC)
Received: from SoMainline.org (unknown [89.205.226.251])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9B2BD20301;
 Wed, 12 Apr 2023 09:24:13 +0200 (CEST)
Date: Wed, 12 Apr 2023 09:24:10 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH] drm/msm/dpu: always program dsc active bits
Message-ID: <feedv4isliterjtwyicqfarwuvzhtov3jkmvjcwqvt7itkyh7y@e2jq5t6r3lxc>
References: <1681247095-1201-1-git-send-email-quic_khsieh@quicinc.com>
 <z7wj2lcgcdxsqh7ylhec3ig6o4p6q37zqvpzoxp4bd4vid2z2n@ubsgt3ebqrwr>
 <83f9a438-52c5-83f3-1767-92d16518d8f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83f9a438-52c5-83f3-1767-92d16518d8f0@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 dianders@chromium.org, andersson@kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, vkoul@kernel.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-11 16:45:34, Abhinav Kumar wrote:
[..]
> > Does this flush all DSCs programmed in CTL_DSC_FLUSH as set above?  That
> > is currently still in `if (cfg->dsc)` and never overwritten if all DSCs
> > are disabled, should it be taken out of the `if` to make sure no DSCs
> > are inadvertently flushed, or otherwise cache the "previous mask" to
> > make sure we flush exactly the right DSC blocks?
> > 
> 
> Yes, DSC flush is hierarchical. This is the main DSC flush which will 
> enforce the flush of the DSC's we are trying to flush in the 
> CTL_DSC_FLUSH register.

That's what I was thinking, thanks for confirming.

> So if DSC was active, the CTL_FLUSH will only enforce the flush of the 
> DSC's programmed in CTL_DSC_FLUSH
> 
> If DSC is not active, we still need to flush that as well (that was the 
> missing bit).
> 
> No need to cache previous mask. That programming should be accurate in 
> cfg->dsc already.

This kind of implicit dependency warrants a comment at the very least.

What happens if a device boots without DSC panel connected?  Will
CTL_DSC_FLUSH be zero and not (unnecessarily, I assume) flush any of the
DSC blocks?  Or could this flush uninitialized state to the block?

- Marijn
