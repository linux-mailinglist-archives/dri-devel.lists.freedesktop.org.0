Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651233372E8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 13:42:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FBB6E50C;
	Thu, 11 Mar 2021 12:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121526E50C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 12:42:43 +0000 (UTC)
IronPort-SDR: 5mTgd6hfE97qyl0SpGhYt3ZKjvocWVc/P7jmTZ4QyoZLovocsr1Il1roFluMkq2hUa9jIoYKWS
 +fFV7WxkfXJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="186280920"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="186280920"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 04:42:42 -0800
IronPort-SDR: mUuf66nLnksrq9snV+vcRYLSV609adDzsXvzD8wOvxQV/jPKgz4fcQ6CDMXuj4YzV/KKvDi7PC
 HKxEiel0ZGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; d="scan'208";a="387000784"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP; 11 Mar 2021 04:42:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 04:42:41 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 04:42:41 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Thu, 11 Mar 2021 04:42:41 -0800
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Dave Airlie <airlied@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/nouveau: fix dma syncing for loops (v2)
Thread-Topic: [PATCH] drm/nouveau: fix dma syncing for loops (v2)
Thread-Index: AQHXFi/8Paj3K2ybgE2g2gZ+3UqiYKp+uzlA
Date: Thu, 11 Mar 2021 12:42:40 +0000
Message-ID: <9c5e342f77cb40cf96e26e58316eaab0@intel.com>
References: <20210311043527.5376-1-airlied@gmail.com>
In-Reply-To: <20210311043527.5376-1-airlied@gmail.com>
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
>From: Dave Airlie <airlied@gmail.com>
>Sent: Wednesday, March 10, 2021 11:35 PM
>To: dri-devel@lists.freedesktop.org
>Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>; skeggsb@gmail.com
>Subject: [PATCH] drm/nouveau: fix dma syncing for loops (v2)
>
>From: Dave Airlie <airlied@redhat.com>
>
>The index variable should only be increased in one place.
>
>Noticed this while trying to track down another oops.
>
>v2: use while loop.

Ok, that makes it more obvious for me. 

Thanks.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>Fixes: f295c8cfec83 ("drm/nouveau: fix dma syncing warning with debugging
>on.")
>Signed-off-by: Dave Airlie <airlied@redhat.com>
>---
> drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
>b/drivers/gpu/drm/nouveau/nouveau_bo.c
>index 2375711877cf..fabb314a0b2f 100644
>--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
>+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
>@@ -556,7 +556,8 @@ nouveau_bo_sync_for_device(struct nouveau_bo
>*nvbo)
> 	if (nvbo->force_coherent)
> 		return;
>
>-	for (i = 0; i < ttm_dma->num_pages; ++i) {
>+	i = 0;
>+	while (i < ttm_dma->num_pages) {
> 		struct page *p = ttm_dma->pages[i];
> 		size_t num_pages = 1;
>
>@@ -587,7 +588,8 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo
>*nvbo)
> 	if (nvbo->force_coherent)
> 		return;
>
>-	for (i = 0; i < ttm_dma->num_pages; ++i) {
>+	i = 0;
>+	while (i < ttm_dma->num_pages) {
> 		struct page *p = ttm_dma->pages[i];
> 		size_t num_pages = 1;
>
>--
>2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
