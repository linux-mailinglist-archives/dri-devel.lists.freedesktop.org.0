Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 568FD6EAE03
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 17:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBED710EE51;
	Fri, 21 Apr 2023 15:27:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF4F10EE51;
 Fri, 21 Apr 2023 15:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682090857; x=1713626857;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b/WfW7NvCLz95j1pRHq/xmswTsOeZfz6FGjn8SIDucw=;
 b=kkvREUEuBFmIAO1gJZ4dRgn+xpLjxTf9walsZwrAeEaWeBoMZxjh4JrJ
 MuKHsWCdPT75iEJb/GYIiYieZVCe1B41JmliLHc3HBBAmkiN+RNcvtlED
 Ov7aCtz0xjU7WmSOhZ4QkvszCdWHBkwvMksCU6R/6qlDdRhgzFdL/gKYs
 FOC/trirBQURyweGCPeysm44Bibc7R/De8lImr9IITNm8gIna1al4U7QK
 KuHp2vlXrvoTp8psWtY4jucmawYU4fzkw7Ba1q7JJ6ZyhXor/zm9449LI
 5mmBK5yLXcG79BmmtgdBnf/BRWiaFKol9OUJ8Gx1LrOaOu2dJEN/WX7JS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="325616311"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="325616311"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 08:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="781631636"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="781631636"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.8.140])
 ([10.213.8.140])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 08:27:33 -0700
Message-ID: <f1802888-7e4b-6398-3b71-4c303fd6cebe@intel.com>
Date: Fri, 21 Apr 2023 17:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/i915_drv: Use i915 instead of
 dev_priv insied the file_priv structure
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>
References: <20230421134654.273182-1-andi.shyti@linux.intel.com>
 <20230421134654.273182-3-andi.shyti@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230421134654.273182-3-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21.04.2023 15:46, Andi Shyti wrote:
> In the process of renaming all instances of 'dev_priv' to 'i915',
> start using 'i915' within the 'drm_i915_file_private' structure.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> ---

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

