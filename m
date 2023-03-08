Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 717BB6B000F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 08:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6F710E5A7;
	Wed,  8 Mar 2023 07:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D92910E59E;
 Wed,  8 Mar 2023 07:41:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A4F8EB8169A;
 Wed,  8 Mar 2023 07:41:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E655C433EF;
 Wed,  8 Mar 2023 07:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678261261;
 bh=aCR9I3Z2NCLeljkYNaOiZc+/Zdv5OTStgUR3AMzITfk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q4DTLcz1oQL49YelKS5JnXxRqz4rSAIVzR+/neEru8DhdvpGSiS8y9dUIAa6uv7IW
 mYCjvsd0OJM05eQXl3xmmoiKBuQ7CfbCo4UtYk6FdTmICKDxDHJaxMjisFacfajr+7
 pA9Mf4cSQnf6RfkveUFEzg2T3RgOFX49BCaPHWPwzRemUlvgXz99sdaMGd+P67NAXv
 CePpJ9CQvB/aP5UbcvLWiYAiHfgt4YSlPBJA4fCkdCdqslBT9SqFJjveEhXfULEqsI
 wCSQyxZEYhr6dplWW4zjkTeQMqOik6ge4O7NIkNATO/K581fhHwDPtqmlqlTjm5N5V
 USQrSKjhQMYeQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1pZoQk-0007XJ-SZ; Wed, 08 Mar 2023 08:41:46 +0100
Date: Wed, 8 Mar 2023 08:41:46 +0100
From: Johan Hovold <johan@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH 01/10] Revert "drm/msm: Add missing check and destroy for
 alloc_ordered_workqueue"
Message-ID: <ZAg8Okiumzg9gpHJ@hovoldconsulting.com>
References: <20230308021024.13566-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308021024.13566-1-jiasheng@iscas.ac.cn>
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
Cc: freedreno@lists.freedesktop.org, sean@poorly.run, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 johan+linaro@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 08, 2023 at 10:10:24AM +0800, Jiasheng Jiang wrote:
> On Mon, 06 Mar 2023 18:07:13 +0800, Johan Hovold wrote:
> > This reverts commit 643b7d0869cc7f1f7a5ac7ca6bd25d88f54e31d0.
> 
> The commit not only adds the allocation sanity check, but also adds the
> destroy_workqueue to release the allocated priv->wq.
> Therefore, revert the commit will cause memory leak.

No, reverting this commit does not cause any memory leaks (look at at
diff again).

The original patch called msm_drm_uninit() in some early error paths,
but that was just completely broken as that function must not be called
before the subcomponents have been bound and also triggered a bunch of
other NULL-pointer dereferences.

That bit was however removed when the change was merged with a second
branch that also touched these error paths. In the end, the leaked wq is
still there and this commit only added broken error handling for the wq
allocation failing (as it does not free the drm device).

> > A recent patch that tried to fix up the msm_drm_init() paths with
> > respect to the workqueue but only ended up making things worse:
> > 
> > First, the newly added calls to msm_drm_uninit() on early errors would
> > trigger NULL-pointer dereferences, for example, as the kms pointer would
> > not have been initialised. (Note that these paths were also modified by
> > a second broken error handling patch which in effect cancelled out this
> > part when merged.)
> 
> There is a check for the kms pointer to avoid NULL-pointer dereference in
> the msm_drm_uninit().

No, there were further places in msm_drm_uninit() which did not have any
such checks when you submitted your patch. Some of the missing checks
were added by a separate patch, but that would not in itself have been
sufficient as with your patch you'd still end up trying to unbind the
subcomponents before they are bound, which will lead to further crashes.
 
> > Second, the newly added allocation sanity check would still leak the
> > previously allocated drm device.
> 
> The ddev is allocated by drm_dev_alloc which support automatic cleanup.

We don't have automatic garbage collection in the kernel. You still need
to release the reference to the device for it to be freed.

Johan
