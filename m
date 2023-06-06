Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 833F7723753
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 08:12:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 750D810E20F;
	Tue,  6 Jun 2023 06:12:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4514510E20D;
 Tue,  6 Jun 2023 06:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686031920; x=1717567920;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tPf1ULSmRXozNF6yiEjZqf/EHNf60rj4pld8Wlm3LKo=;
 b=oCBnQGm0uN2S1LfT3Sv33mM0EKfdbXNFtw+9iokrAcRw7+iVIw1eMAR5
 EslziB8PJXlF1IGaROYHHBW0696wiKII9lsM/kl1d0cOwBS8snCfoWjvy
 //QPfCUWKjz1QnsboGsp+57NV+h/zRaN0lwDMhlUdkHuIpj70nhUOzUbo
 osq+Fm4W9sXDprUjNynsLYJziEAw1lIbY+n7Cq6QkXfi9yeTslFdyPLLj
 XlztODFwVoLe+KztLm94ZqSZsbQL9eGZ61fZub6jZlCbA8s6p16nAziPa
 umoPp7w95nhSZ0sPr1OPhFeOY5lG7v61bC3arXvVwOwrO6vQc5ZVERtBO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="384882744"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="384882744"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 23:11:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="686399007"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="686399007"
Received: from kchmiele-mobl.ger.corp.intel.com (HELO [10.213.21.8])
 ([10.213.21.8])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 23:11:55 -0700
Message-ID: <af008d38-3492-3df4-1c1e-95c1bf3102d2@intel.com>
Date: Tue, 6 Jun 2023 08:11:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.2
Subject: Re: [PATCH v9 0/4] drm/i915: use ref_tracker library for tracking
 wakerefs
To: Jakub Kicinski <kuba@kernel.org>
References: <20230224-track_gt-v9-0-5b47a33f55d1@intel.com>
 <20230605153353.029a57ce@kernel.org>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230605153353.029a57ce@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "David S. Miller" <davem@davemloft.net>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 06.06.2023 00:33, Jakub Kicinski wrote:
> On Fri, 02 Jun 2023 12:21:32 +0200 Andrzej Hajda wrote:
>> This is reviewed series of ref_tracker patches, ready to merge
>> via network tree, rebased on net-next/main.
>> i915 patches will be merged later via intel-gfx tree.
> FWIW I'll try to merge these on top of the -rc4 tag so
> with a bit of luck you should be able to cross merge cleanly
> into another -next tree.

Thanks.

Regards
Andrzej
