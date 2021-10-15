Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66042F178
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 14:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502566E2DF;
	Fri, 15 Oct 2021 12:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0656E2DF;
 Fri, 15 Oct 2021 12:52:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="227861330"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="227861330"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 05:52:38 -0700
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="492547111"
Received: from gbocksch-mobl.ger.corp.intel.com (HELO [10.252.63.132])
 ([10.252.63.132])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 05:52:36 -0700
Subject: Re: [PATCH 2/2] dma-buf: Fix dma_resv_test_signaled.
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20211015115720.79958-1-maarten.lankhorst@linux.intel.com>
 <20211015115720.79958-3-maarten.lankhorst@linux.intel.com>
 <ebf0714c-2f49-a0ad-1861-16394ade468d@amd.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <9b7e43bb-e175-0aff-2cc1-cc10236fe8e5@linux.intel.com>
Date: Fri, 15 Oct 2021 14:52:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <ebf0714c-2f49-a0ad-1861-16394ade468d@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 15-10-2021 om 14:07 schreef Christian König:
> Am 15.10.21 um 13:57 schrieb Maarten Lankhorst:
>> Commit 7fa828cb9265 ("dma-buf: use new iterator in dma_resv_test_signaled")
>> accidentally forgot to test whether the dma-buf is actually signaled, breaking
>> pretty much everything depending on it.
>
> NAK, the dma_resv_for_each_fence_unlocked() returns only unsignaled fences. So the code is correct as it is. 

That seems like it might cause some unexpected behavior when that function is called with one of the fence locks held, if it calls dma_fence_signal().

Could it be changed to only test the signaled bit, in which case this patch would still be useful?

Or at least add some lockdep annotations, that fence->lock might be taken. So any hangs would at least be easy to spot with lockdep.

~Maarten

