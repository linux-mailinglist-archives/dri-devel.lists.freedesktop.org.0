Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B6F192A8B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 14:56:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 276D66E12B;
	Wed, 25 Mar 2020 13:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E7D6E12B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 13:56:09 +0000 (UTC)
IronPort-SDR: WIu6EhS6t8JJZARcQUlHJtd+lYpYe2aN9VhN6e7YiCFJd76p4l2Z/Z7PDPErQ7wF0884vhY3eH
 osre3472nPbQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 06:56:08 -0700
IronPort-SDR: s57Q6TOkQpu6PJRl7m3fQgh2HQCgGEcvzcVIQBs7hOlRQkCk5SIMJhdsmq1cn+TmvdKZD+wDkY
 //bcVV7IYhLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; d="scan'208";a="250414365"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 25 Mar 2020 06:56:08 -0700
Received: from fmsmsx107.amr.corp.intel.com ([169.254.6.38]) by
 FMSMSX103.amr.corp.intel.com ([169.254.2.250]) with mapi id 14.03.0439.000;
 Wed, 25 Mar 2020 06:56:07 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Shane Francis <bigbeeshane@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 1/3] drm/prime: use dma length macro when mapping sg
Thread-Topic: [PATCH v4 1/3] drm/prime: use dma length macro when mapping sg
Thread-Index: AQHWAoT+OOcEgrTLV0+k11mipUYGbahZUVMA
Date: Wed, 25 Mar 2020 13:56:07 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663FFFBD421@fmsmsx107.amr.corp.intel.com>
References: <20200325090741.21957-1-bigbeeshane@gmail.com>
 <20200325090741.21957-2-bigbeeshane@gmail.com>
In-Reply-To: <20200325090741.21957-2-bigbeeshane@gmail.com>
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
>Subject: [PATCH v4 1/3] drm/prime: use dma length macro when mapping sg
>
>As dma_map_sg can reorganize scatter-gather lists in a
>way that can cause some later segments to be empty we should
>always use the sg_dma_len macro to fetch the actual length.
>
>This could now be 0 and not need to be mapped to a page or
>address array
>Signed-off-by: Shane Francis <bigbeeshane@gmail.com>
>---
> drivers/gpu/drm/drm_prime.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>index 86d9b0e45c8c..1de2cde2277c 100644
>--- a/drivers/gpu/drm/drm_prime.c
>+++ b/drivers/gpu/drm/drm_prime.c
>@@ -967,7 +967,7 @@ int drm_prime_sg_to_page_addr_arrays(struct
>sg_table *sgt, struct page **pages,
>
> 	index = 0;
> 	for_each_sg(sgt->sgl, sg, sgt->nents, count) {
>-		len = sg->length;
>+		len = sg_dma_len(sg);
> 		page = sg_page(sg);
> 		addr = sg_dma_address(sg);

This looks correct to me.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>
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
