Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE5B3F9A7C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 15:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B246E96F;
	Fri, 27 Aug 2021 13:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B276E96F;
 Fri, 27 Aug 2021 13:55:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="217679135"
X-IronPort-AV: E=Sophos;i="5.84,356,1620716400"; d="scan'208";a="217679135"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 06:55:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,356,1620716400"; d="scan'208";a="426477942"
Received: from sidorovd-mobl.ccr.corp.intel.com (HELO [10.249.254.150])
 ([10.249.254.150])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2021 06:55:27 -0700
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Ayaz A Siddiqui <ayaz.siddiqui@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Subject: TTM tt size larger than buffer object?
Message-ID: <04145fb7-522e-b6da-09ad-a90bb91e5dde@linux.intel.com>
Date: Fri, 27 Aug 2021 15:55:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi, Christian.

We have a use-case with i915 where the data representation of a buffer 
object is larger in system memory than in LMEM/VRAM. Hence we'd like to 
create a ttm_tt that is larger than the buffer object itself. Quickly 
auditing the TTM code it looks like that should be pretty safe, as 
ttm->num_pages is not really much accessed outside the tt code and the 
pool code where we're doing the right thing.

The additional data will really only be accessed by the blitter so when 
cpu-mapping, mapping just the original buffer object size is correct. 
However with swapping the additional data needs to be swapped out and 
the code is doing that correctly as well.

Do you think this is an acceptable solution?

/Thomas


