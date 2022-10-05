Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204855F5575
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 15:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C4710E625;
	Wed,  5 Oct 2022 13:32:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B6610E625;
 Wed,  5 Oct 2022 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664976776; x=1696512776;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eILrqrbum5QwAkBtdxqbrJnoct2lE9sWsCAfF3dyF/Q=;
 b=dIpC8Ho1up6yISb9Wnuo3kmC5PINc/OCO+fS7FgYvPCDcUhTukQK8qSL
 5THj7i9GYm8Dl0RFXJWgK3ldJPYDZjarllruxE1Ys7U3MDQYGTPLwZQQi
 9dIKAl8r/sBxXd9bxNme2ugBfLrsL1i0WhmsiTuCVbysQ6pdB59L2fx6G
 FDaxeG9QQsXC5xZnVnDKrg10k7H8cQ1GtGWfc3BtvNAKf2zdWMshjNHwF
 N5/w+ZNsHDdIb/yffzl83E5MX7syc7N3yHbdQFXbz0MYSmdi12zbdmYY3
 wvbgvM4sYuL9pg6QMksANo20jeuq8nqvon1BULdcIIZNRZY+WAFfwp2O4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="329571263"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="329571263"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 06:32:56 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="624309124"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="624309124"
Received: from vadimbel-mobl2.ger.corp.intel.com (HELO [10.252.23.121])
 ([10.252.23.121])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2022 06:32:54 -0700
Message-ID: <e9722ab4-31fe-3f2e-a1e6-5df5d1bef623@intel.com>
Date: Wed, 5 Oct 2022 14:32:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.1
Subject: Re: [PATCH RESEND] drm/i915: Fix display problems after resume
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20221005121159.340245-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20221005121159.340245-1-thomas.hellstrom@linux.intel.com>
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
Cc: Kevin Boulain <kevinboulain@gmail.com>,
 David de Sousa <davidesousa@gmail.com>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 05/10/2022 13:11, Thomas Hellström wrote:
> Commit 39a2bd34c933 ("drm/i915: Use the vma resource as argument for gtt
> binding / unbinding") introduced a regression that due to the vma resource
> tracking of the binding state, dpt ptes were not correctly repopulated.
> Fix this by clearing the vma resource state before repopulating.
> The state will subsequently be restored by the bind_vma operation.
> 
> Fixes: 39a2bd34c933 ("drm/i915: Use the vma resource as argument for gtt binding / unbinding")
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20220912121957.31310-1-thomas.hellstrom@linux.intel.com
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.18+
> Reported-and-tested-by: Kevin Boulain <kevinboulain@gmail.com>
> Tested-by: David de Sousa <davidesousa@gmail.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

