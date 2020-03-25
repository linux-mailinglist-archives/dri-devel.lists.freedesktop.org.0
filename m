Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB73E192B02
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 15:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B3F6E867;
	Wed, 25 Mar 2020 14:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537066E867
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 14:19:50 +0000 (UTC)
IronPort-SDR: gChyo0mPTwiblud1zTtPPq0J8xkQRHDR+dkMLmUgY0lvkQqRnplTB0KyWP8jPTsNeZMcVr77Va
 d6dxfFW3uXsA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 07:19:49 -0700
IronPort-SDR: XS6LI5XnckcHTf5zP+rVjmfqI2VY0FD2NSScpEi9NFm4cUlytCe0p7mRQSsFRjOrmiUtNLbg2H
 HbPJ9wZxpw4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; d="scan'208";a="250420335"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 25 Mar 2020 07:19:49 -0700
Received: from fmsmsx118.amr.corp.intel.com (10.18.116.18) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Mar 2020 07:19:48 -0700
Received: from fmsmsx107.amr.corp.intel.com ([169.254.6.38]) by
 fmsmsx118.amr.corp.intel.com ([169.254.1.221]) with mapi id 14.03.0439.000;
 Wed, 25 Mar 2020 07:19:48 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Shane Francis <bigbeeshane@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 3/3] drm/radeon: fix scatter-gather mapping with user
 pages
Thread-Topic: [PATCH v4 3/3] drm/radeon: fix scatter-gather mapping with
 user pages
Thread-Index: AQHWAoUBcNgIkBIx5kKMIMnKtZMniKhZW20g
Date: Wed, 25 Mar 2020 14:19:48 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663FFFBD48B@fmsmsx107.amr.corp.intel.com>
References: <20200325090741.21957-1-bigbeeshane@gmail.com>
 <20200325090741.21957-4-bigbeeshane@gmail.com>
In-Reply-To: <20200325090741.21957-4-bigbeeshane@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
MIME-Version: 1.0
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx-request@lists.freedesktop.org"
 <amd-gfx-request@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Shane Francis
>Sent: Wednesday, March 25, 2020 5:08 AM
>To: dri-devel@lists.freedesktop.org
>Cc: airlied@linux.ie; linux-kernel@vger.kernel.org; bigbeeshane@gmail.com;
>amd-gfx-request@lists.freedesktop.org; alexander.deucher@amd.com;
>christian.koenig@amd.com
>Subject: [PATCH v4 3/3] drm/radeon: fix scatter-gather mapping with user
>pages
>
>Calls to dma_map_sg may return segments / entries than requested

"may return less segment..." ?
                       ^^^

>if they fall on page bounderies. The old implementation did not
>support this use case.
>
>Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
>---
> drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
>b/drivers/gpu/drm/radeon/radeon_ttm.c
>index 3b92311d30b9..b3380ffab4c2 100644
>--- a/drivers/gpu/drm/radeon/radeon_ttm.c
>+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
>@@ -528,7 +528,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_tt
>*ttm)
>
> 	r = -ENOMEM;
> 	nents = dma_map_sg(rdev->dev, ttm->sg->sgl, ttm->sg->nents,
>direction);
>-	if (nents != ttm->sg->nents)
>+	if (nents == 0)
> 		goto release_sg;

This looks correct to me.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M
> 	drm_prime_sg_to_page_addr_arrays(ttm->sg, ttm->pages,
>--
>2.26.0
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
