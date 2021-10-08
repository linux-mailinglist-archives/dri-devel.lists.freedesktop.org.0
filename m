Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37698426509
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 09:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775BA6E0AD;
	Fri,  8 Oct 2021 07:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67C76E0AA;
 Fri,  8 Oct 2021 07:08:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="287332827"
X-IronPort-AV: E=Sophos;i="5.85,356,1624345200"; d="scan'208";a="287332827"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 00:08:53 -0700
X-IronPort-AV: E=Sophos;i="5.85,356,1624345200"; d="scan'208";a="484913901"
Received: from lenovo-x280.ger.corp.intel.com (HELO [10.249.254.98])
 ([10.249.254.98])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 00:08:51 -0700
Message-ID: <5b8767c6-74f3-b35c-ca98-25ecfcec031a@linux.intel.com>
Date: Fri, 8 Oct 2021 09:08:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Subject: Interface additions to dma_fence_array?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi, Christian,

We have a use-case in i915 with async evictions where we'd like to use 
dma-fence-array in the following way

*Create in commit mode
*Add context and seqno,
*Publish (signaling critical section starts)
*Add fence pointers to the arrary
*Commit (signaling critical section ends, fence can now signal)

With a patch series I have, we use the i915 data structure 
dma_fence_work for this, but it'd be better to use dma_fence_array for 
various reasons. Would it be OK to add interfaces to dma-fence-array to 
facilitate this? Basic idea would be to defer the actions done by 
enable_signaling until commit is called.

Thanks,
/Thomas

