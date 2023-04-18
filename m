Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7B6E6B52
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 19:44:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8B810E15C;
	Tue, 18 Apr 2023 17:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE0A10E15C;
 Tue, 18 Apr 2023 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681839875; x=1713375875;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P6qbNqbkC5sAe3IO2jo5u4p0ONmYkpo1JHbsKLgdse4=;
 b=KylfnfuScdqTjeSm7OXet943nGNtIUz6C6vRldekWdPc10XvOLsIqJzm
 94ypDe9Z1vUb4aJV1aIe0+wnLmzxy+R1D9Ee8RaHjXk/ucmyVwoszAhFM
 hxbAEqBlvX0cJ8u8mCTjIswAEUT2B1e3YvqJ4F1A7wEZNvWe7s8J1AxzO
 pHjaOepAkGzheYy7Clf3vExL5xuYiYihxqw1WfF1z2dFVtW8SCGBwrCkp
 zTrS2rVsnM9RjEJ4p/VPapZF64byLi1oIbXm7Cy9vBgYt5afQxTA92xjQ
 XU3EzlReFt4g7TCRm0kFedtgy8CQYIKd2V/U9vpfgQNVwcQETZDMINJTh Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="410471702"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="410471702"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 10:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="668650554"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="668650554"
Received: from ashfaqur-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.213.178])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 10:44:29 -0700
Date: Tue, 18 Apr 2023 19:44:05 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/amdkfd: Fix potential deallocation of previously
 deallocated memory.
Message-ID: <ZD7W5aaslOXLg707@ashyti-mobl2.lan>
References: <20230418065521.453001-1-d.dulov@aladdin.ru>
 <ZD5ZFoEk92MNQpqD@ashyti-mobl2.lan>
 <d41669a1-9e18-defb-d0cc-d43d7be7d23e@kernel.org>
 <ZD7MgL619KVYKeTV@ashyti-mobl2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZD7MgL619KVYKeTV@ashyti-mobl2.lan>
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
Cc: dri-devel@lists.freedesktop.org, lvc-project@linuxtesting.org,
 David Airlie <airlied@linux.ie>, Daniil Dulov <d.dulov@aladdin.ru>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
 Oak Zeng <oak.zeng@intel.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Daniil will you look into this?

and, because this is a bug fix, if you do want to send a real
fix, plase add to the commit message:

Fixes: d1f8f0d17d40 ("drm/amdkfd: Move non-sdma mqd allocation out of init_mqd")
Cc: Oak Zeng <oak.zeng@intel.com>
Cc: <stable@vger.kernel.org> # v5.3+

Andi

PS: please note that Oak's e-mail has changed.
