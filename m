Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C1788147E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 16:26:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B063710FD43;
	Wed, 20 Mar 2024 15:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.b="iJDk19kQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D82510FD43;
 Wed, 20 Mar 2024 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 In-Reply-To:References; bh=/EpaCQTpGqGU5ULt8qAmE+s8SSReKSogNzvd/au7Mjs=;
 t=1710948357; x=1711380357; b=iJDk19kQI0h1rWpfWxZMvwGYy4BhFVt0xFqe+K6sL+3pK8c
 LefGsCHVAm/tLPRhULuODPeD6Lp8Hrge6OrY3k7BE26ER66/hkbtUSLTCtUvy++UbFo7sYgLQdrAB
 Df+akJCXVUNQ54Ve13A5thZfVBjgH7DCl/+xu3jWFWPJvDksKyO9TniVn/4AOo2/NsCdAmdAyQfY1
 mnniJzhvSKy2BMq2NQrX33Ebvcjr+I+Zpxd7CCCFpEE/ZW9NX1yuE+22heR/b3TbvWsd5n7MBepsj
 pu9oMBXbikThZ8ISQftaljIWvCU6AXGxeg4Ql8stH5z3OAo/8Jwd8iOyyzbKnQBQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1rmxp7-0004iK-29; Wed, 20 Mar 2024 16:25:49 +0100
Message-ID: <db4c8e74-5c79-49be-9781-a5d8669eccc1@leemhuis.info>
Date: Wed, 20 Mar 2024 16:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/qxl: fixes qxl_fence_wait
Content-Language: en-US, de-DE
To: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
Cc: 1054514@bugs.debian.org, airlied@redhat.com, carnil@debian.org,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 spice-devel@lists.freedesktop.org, timo.lindfors@iki.fi,
 tzimmermann@suse.de, virtualization@lists.linux-foundation.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
References: <fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info>
 <20240308010851.17104-1-dreaming.about.electric.sheep@gmail.com>
 <20240308010851.17104-2-dreaming.about.electric.sheep@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <20240308010851.17104-2-dreaming.about.electric.sheep@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1710948357;
 7ebe72a6; 
X-HE-SMSGID: 1rmxp7-0004iK-29
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08.03.24 02:08, Alex Constantino wrote:
> Fix OOM scenario by doing multiple notifications to the OOM handler through
> a busy wait logic.
> Changes from commit 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait") would
> result in a '[TTM] Buffer eviction failed' exception whenever it reached a
> timeout.
> 
> Fixes: 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait")
> Link: https://lore.kernel.org/regressions/fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info
> Reported-by: Timo Lindfors <timo.lindfors@iki.fi>
> Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1054514
> Signed-off-by: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
> ---
>  drivers/gpu/drm/qxl/qxl_release.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)

Hey Dave and Gerd as well as Thomas, Maarten and Maxime (the latter two
I just added to the CC), it seems to me this regression fix did not
maybe any progress since it was posted. Did I miss something, is it just
"we are busy with the merge window", or is there some other a reason?
Just wondering, I just saw someone on a Fedora IRC channel complaining
about the regression, that's why I'm asking. Would be really good to
finally get this resolved...

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
> index 368d26da0d6a..51c22e7f9647 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -20,8 +20,6 @@
>   * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>   */
>  
> -#include <linux/delay.h>
> -
>  #include <trace/events/dma_fence.h>
>  
>  #include "qxl_drv.h"
> @@ -59,14 +57,24 @@ static long qxl_fence_wait(struct dma_fence *fence, bool intr,
>  {
>  	struct qxl_device *qdev;
>  	unsigned long cur, end = jiffies + timeout;
> +	signed long iterations = 1;
> +	signed long timeout_fraction = timeout;
>  
>  	qdev = container_of(fence->lock, struct qxl_device, release_lock);
>  
> -	if (!wait_event_timeout(qdev->release_event,
> +	// using HZ as a factor since it is used in ttm_bo_wait_ctx too
> +	if (timeout_fraction > HZ) {
> +		iterations = timeout_fraction / HZ;
> +		timeout_fraction = HZ;
> +	}
> +	for (int i = 0; i < iterations; i++) {
> +		if (wait_event_timeout(
> +				qdev->release_event,
>  				(dma_fence_is_signaled(fence) ||
> -				 (qxl_io_notify_oom(qdev), 0)),
> -				timeout))
> -		return 0;
> +					(qxl_io_notify_oom(qdev), 0)),
> +				timeout_fraction))
> +			break;
> +	}
>  
>  	cur = jiffies;
>  	if (time_after(cur, end))
