Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB48973F830
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 11:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEFA10E2C8;
	Tue, 27 Jun 2023 09:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4721A10E2C8;
 Tue, 27 Jun 2023 09:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687856791; x=1719392791;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JaKhdwJtfC7Oib/27piMBfnO+XxQp6i2NYK9CWnNEJA=;
 b=D8tBwI4OKfJK6TsPpWpbGMd/s9CihtOfVlQrc8dMEdr7yWdXlQ97lwqN
 lXDFPpXg6So4IsBgRMCKMof8fxmtKVCOn5ejTTT1NRbERMsEbFJRm3npf
 sYia+JMjInObDjfr/sdVqwveXVJRaKztXq2c69sepcRBG6cOohIljjwd7
 7UoZicaJoIFpq/j7ZmD4PjNe/J8/xw0dAlrGnZxgYUC51FYM1gelUulf4
 K1ibtEM5KxrT/nZBOcrJb2zIxhjjrBB8c+GVb9+BG1NM4isjUp/9zBLYI
 fJgbhvtgRaRnL/PY6NFKI4i1jScNEs7t/DbkqroUt/qMMkKM5EA+txCLP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="359017720"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="359017720"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 02:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="781769236"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; d="scan'208";a="781769236"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO [10.249.254.202])
 ([10.249.254.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 02:06:28 -0700
Message-ID: <f821b9e3-b4b1-d182-040f-27df81cf8aa6@linux.intel.com>
Date: Tue, 27 Jun 2023 11:05:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v2 0/4] drm/ttm: Fixes around resources and bulk moves
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
References: <20230626091450.14757-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230626091450.14757-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/26/23 11:14, Thomas Hellström wrote:
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
>
> A couple of ttm fixes for issues that either were hit while developing the
> xe driver or, for the resource leak patches, discovered during code
> inspection.
>
> v2:
> - Avoid a goto in patch 3 (Andi Shyti)
> - Add some RB's
>
> Thomas Hellström (4):
>    drm/ttm: Fix ttm_lru_bulk_move_pos_tail()
>    drm/ttm: Don't shadow the operation context
>    drm/ttm: Don't leak a resource on eviction error
>    drm/ttm: Don't leak a resource on swapout move error
>
>   drivers/gpu/drm/ttm/ttm_bo.c       | 26 +++++++++++++-------------
>   drivers/gpu/drm/ttm/ttm_resource.c |  2 ++
>   2 files changed, 15 insertions(+), 13 deletions(-)
>
Pushed 2/4 to drm-misc-next, 3/4 & 4/4 to drm-misc-fixes.

/Thomas


