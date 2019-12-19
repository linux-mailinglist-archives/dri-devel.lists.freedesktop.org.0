Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E376C126E76
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 21:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107336E3FC;
	Thu, 19 Dec 2019 20:10:48 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382856E3EB
 for <dri-devel@freedesktop.org>; Thu, 19 Dec 2019 20:10:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576786246; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: To: From: Date: Sender;
 bh=/5veci3IX8iV9Lr7OinmX1GSclV5/3Uya8rEs4CH8nA=;
 b=bf+C58Z+YYJHU7maKqouFCua7DcjUefMLlA85uPgVLJ+Fgrd189k4SBywTcREyDpvcrq20Hd
 uUp0xeU3PY8KR7E5W3rHlwaAqyS3xZ0laj6M/3wecPSXqn3d6CtITJcjBUHNgWCg+Ya+sESh
 iAQTl0hhQRQMYlMFae3giPQtqPg=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfbd944.7f9524acd6c0-smtp-out-n03;
 Thu, 19 Dec 2019 20:10:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BB6DDC447A6; Thu, 19 Dec 2019 20:10:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5878AC447A0;
 Thu, 19 Dec 2019 20:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5878AC447A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 19 Dec 2019 13:10:41 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sharat Masetty <smasetty@codeaurora.org>,
 freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 iommu@lists.linux-foundation.org, saiprakash.ranjan@codeaurora.org
Subject: Re: [PATCH 5/5] drm/msm/a6xx: Add support for using system cache(LLC)
Message-ID: <20191219201041.GB23673@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sharat Masetty <smasetty@codeaurora.org>,
 freedreno@lists.freedesktop.org, dri-devel@freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 iommu@lists.linux-foundation.org, saiprakash.ranjan@codeaurora.org
References: <1576761286-20451-1-git-send-email-smasetty@codeaurora.org>
 <1576761286-20451-6-git-send-email-smasetty@codeaurora.org>
 <20191219195814.GA23673@jcrouse1-lnx.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219195814.GA23673@jcrouse1-lnx.qualcomm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 19, 2019 at 12:58:15PM -0700, Jordan Crouse wrote:
> On Thu, Dec 19, 2019 at 06:44:46PM +0530, Sharat Masetty wrote:


<snip>

> > +
> > +	/*
> > +	 * CNTL1 is used to specify SCID for (CP, TP, VFD, CCU and UBWC
> > +	 * FLAG cache) GPU blocks. This value will be passed along with
> > +	 * the address for any memory transaction from GPU to identify
> > +	 * the sub-cache for that transaction.
> > +	 */
> > +	if (!IS_ERR(llc->gpu_llc_slice)) {
> > +		u32 gpu_scid = llcc_get_slice_id(llc->gpu_llc_slice);
> > +		int i;
> > +
> > +		for (i = 0; i < A6XX_LLC_NUM_GPU_SCIDS; i++)
> > +			llc->cntl1_regval |=
> > +				gpu_scid << (A6XX_GPU_LLC_SCID_NUM_BITS * i);
> 
> As above, i'm not sure a loop is better than just:
> 
> gpu_scid &= 0x1f;
> 
> llc->cntl1_regval = (gpu_scid << 0) || (gpu_scid << 5) | (gpu_scid << 10)
>  | (gpu_scid << 15) | (gpu_scid << 20);
> 
> And I'm not even sure we need do this math here in the first place.

One more question - can you get a valid slice id before activation?

<snip>

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
