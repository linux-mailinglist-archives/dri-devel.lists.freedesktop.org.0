Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1135996BC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 10:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D561E10E65A;
	Fri, 19 Aug 2022 08:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80C910E5E1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 08:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660896853; x=1692432853;
 h=message-id:date:mime-version:to:cc:from:subject:
 content-transfer-encoding;
 bh=p1AFOA1+GdWpzFH37AAY/NUHh8tvjQmkD3EKtPg2kCQ=;
 b=MTRysamH9+pRQLcc+bM1oCOE+6SnlmtZAhuxuC6RA3aArU9VS6DBTxfS
 vSxAkp/ZEPGOumlqQCC94mtAtySddbWPlMgNBqSaICR9h8lmCDRYhmRct
 Kx5XjHmwadHviYqzUYBB+cz4k3d/1geOWQEAjAjYc7Ml05JE7oV3Tq2Hx
 XCgD4ktbGZBpV1kzs1W0zFSQHsftfT/NP7YhTmu9nS20lunjnBIXkK8qB
 knfvkTOJ1Dj3sIHBRDkGl5cfHOoSS01crUQO5/jPPL6vbVicEO5l5uw+H
 /HDPa64KLgdw+9+yH45rLNNfL1utjN6i7vmAZx5LftYsKkHx2nGmSreh4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="279927029"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="279927029"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 01:14:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="936138480"
Received: from sorenthe-mobl2.ger.corp.intel.com (HELO [10.249.254.179])
 ([10.249.254.179])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 01:14:11 -0700
Message-ID: <e1c2abdd-8b7e-5611-e848-f9ec551a8880@linux.intel.com>
Date: Fri, 19 Aug 2022 10:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Subject: Balancing ttm_mem_io_reserve() and ttm_mem_io_free()
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I'm looking for a way to take some sort of reference across possible 
VRAM accesses  over the PCI bar, be it for runtime PM, workarounds or 
whatever.

The ttm_mem_io_reserve/free seems like a good candidate, but is 
completely unbalanced and looks racy. In particular error paths forget 
to call ttm_mem_io_free().

Would you have any objections if I took a look at attempting to balance 
calls to those functions, or do you have any other suggestions for a 
better method?

Thanks,

Thomas



