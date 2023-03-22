Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345C56C444B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 08:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBE0C10E35D;
	Wed, 22 Mar 2023 07:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5DF10E096;
 Wed, 22 Mar 2023 07:46:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 95B6761F94;
 Wed, 22 Mar 2023 07:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F176BC433EF;
 Wed, 22 Mar 2023 07:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679471185;
 bh=OcfApPzBhFbVilWX9veIC9cR3TcxTEM6uyoh7NQTV4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ieqy7YeKERD238mqSeqZHh7bdt9fv+09KJAVhevtdiTYCEvGE9yxrzC3swox3JAPb
 NfqyXmLjIqhaRUjmAtqjkMxmhBoozBBh/ukaB8AFPSxzPu5m7aEGgQE9kWjGqtcdQ/
 O/KPhln1Xk/gb2TYzrb97riZItapLy5TVtlRo2Kru2gq6hCpNX6WhkBXUe4kn3asu6
 GpOGzQ6HnmiZRA/KlS74CvuDUQM1gXZWD+Clwx4c3QTltnB4tyRBAEBWl6wiMnYsRW
 7vVaKdsFj5QX3Lv9orvk3bS2n0JOHa1yvyUPBkJty7oI/vRbSvh+RIS3w92sJyGpIA
 EE2WuNkUxPRxA==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1petCI-0002Sf-Be; Wed, 22 Mar 2023 08:47:51 +0100
Date: Wed, 22 Mar 2023 08:47:50 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 05/10] drm/msm: fix drm device leak on bind errors
Message-ID: <ZBqypsYBMSr8HPxP@hovoldconsulting.com>
References: <20230306100722.28485-1-johan+linaro@kernel.org>
 <20230306100722.28485-6-johan+linaro@kernel.org>
 <90264695-131e-46b7-46db-822b0aee9801@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90264695-131e-46b7-46db-822b0aee9801@linaro.org>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 21, 2023 at 04:54:51PM +0200, Dmitry Baryshkov wrote:
> On 06/03/2023 12:07, Johan Hovold wrote:
> > Make sure to free the DRM device also in case of early errors during
> > bind().
> > 
> > Fixes: 2027e5b3413d ("drm/msm: Initialize MDSS irq domain at probe time")
> > Cc: stable@vger.kernel.org      # 5.17
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> Can we migrate to devm_drm_dev_alloc instead() ? Will it make code 
> simpler and/or easier to handle?

I'm just fixing the bugs here. Cleanups/rework like that can be done on
top but should not be backported as it risks introducing new issues.

Johan
