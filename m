Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0392A3A8324
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 16:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCE86E328;
	Tue, 15 Jun 2021 14:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7A589FBC;
 Tue, 15 Jun 2021 14:45:15 +0000 (UTC)
IronPort-SDR: PX4xQA0S/SI/SKryiWODDEszpaKeHnEH2bhkNRwjF4Kn/zaJvCh2b+utvkwHRwIkR+IXV8a6Io
 AC34b8x0HXXA==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="291634863"
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="291634863"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 07:45:13 -0700
IronPort-SDR: KhJG8PAt/x2XOA4OLoeTuDEWjZ6cC+zrxgSc0e1YUhdcSiOinRmdILQm0a/wK8rVr3ruqH1UNg
 pla+Vp8u11nQ==
X-IronPort-AV: E=Sophos;i="5.83,275,1616482800"; d="scan'208";a="451989432"
Received: from vlernihx-mobl3.ger.corp.intel.com (HELO [10.252.12.108])
 ([10.252.12.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2021 07:45:12 -0700
Subject: Re: [PATCH v3 07/12] drm/i915/gt: Pipelined page migration
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210614162612.294869-1-thomas.hellstrom@linux.intel.com>
 <20210614162612.294869-8-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <cc1f996f-e8fe-7e74-5bc9-c7d61ebe8322@intel.com>
Date: Tue, 15 Jun 2021 15:45:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614162612.294869-8-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/06/2021 17:26, Thomas Hellström wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> If we pipeline the PTE updates and then do the copy of those pages
> within a single unpreemptible command packet, we can submit the copies
> and leave them to be scheduled without having to synchronously wait
> under a global lock. In order to manage migration, we need to
> preallocate the page tables (and keep them pinned and available for use
> at any time), causing a bottleneck for migrations as all clients must
> contend on the limited resources. By inlining the ppGTT updates and
> performing the blit atomically, each client only owns the PTE while in
> use, and so we can reschedule individual operations however we see fit.
> And most importantly, we do not need to take a global lock on the shared
> vm, and wait until the operation is complete before releasing the lock
> for others to claim the PTE for themselves.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Co-developed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

