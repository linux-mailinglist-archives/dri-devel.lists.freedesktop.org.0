Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BFA3327C0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 14:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEBC6E8E2;
	Tue,  9 Mar 2021 13:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D723C6E8DE
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 13:52:12 +0000 (UTC)
IronPort-SDR: QMCT2gqPVpYJQ7TUF60FhZNqyjZ9EqBYwWoF4YPQzQMXGfRRgalZShI/cKrfJx2bvOHyktvWln
 UKKkMdYaCL9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="175343993"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="175343993"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:52:12 -0800
IronPort-SDR: spEDSwvzWniiqAJE0jQZAakJODxjrXuQeuQ57XooNAZ5kK4eRa5rqa/lWuBSaMu9ALQV3sskJF
 dfTvkI4yFW8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="408646588"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 09 Mar 2021 05:52:12 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Mar 2021 05:52:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 9 Mar 2021 05:52:11 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Tue, 9 Mar 2021 05:52:11 -0800
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Dave Airlie <airlied@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/nouveau: fix dma syncing for loops
Thread-Topic: [PATCH] drm/nouveau: fix dma syncing for loops
Thread-Index: AQHXE71Upfd0xrGkGEmONxAodkQY7ap7rUig
Date: Tue, 9 Mar 2021 13:52:11 +0000
Message-ID: <79ac615efec049aeb959207b6bb807ef@intel.com>
References: <20210308014923.30163-1-airlied@gmail.com>
In-Reply-To: <20210308014923.30163-1-airlied@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.22.254.132]
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
Cc: "skeggsb@gmail.com" <skeggsb@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Dave Airlie
>Sent: Sunday, March 7, 2021 8:49 PM
>To: dri-devel@lists.freedesktop.org
>Cc: skeggsb@gmail.com
>Subject: [PATCH] drm/nouveau: fix dma syncing for loops
>
>From: Dave Airlie <airlied@redhat.com>
>
>The index variable should only be increased in one place.
>
>Noticed this while trying to track down another oops.
>
>Fixes: f295c8cfec83 ("drm/nouveau: fix dma syncing warning with debugging
>on.")
>Signed-off-by: Dave Airlie <airlied@redhat.com>
>---
> drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
>b/drivers/gpu/drm/nouveau/nouveau_bo.c
>index 2375711877cf..4f693843def5 100644
>--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>@@ -556,7 +556,7 @@ nouveau_bo_sync_for_device(struct nouveau_bo
>*nvbo)
> 	if (nvbo->force_coherent)
> 		return;
>
>-	for (i = 0; i < ttm_dma->num_pages; ++i) {
>+	for (i = 0; i < ttm_dma->num_pages;) {

This took a bit to see how the increment worked.

Would calling it out with a comment be out of line?

With or without the comment:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

> 		struct page *p = ttm_dma->pages[i];
> 		size_t num_pages = 1;
>
>@@ -587,7 +587,7 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo
>*nvbo)
> 	if (nvbo->force_coherent)
> 		return;
>
>-	for (i = 0; i < ttm_dma->num_pages; ++i) {
>+	for (i = 0; i < ttm_dma->num_pages;) {
> 		struct page *p = ttm_dma->pages[i];
> 		size_t num_pages = 1;
>
>--
>2.27.0
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
