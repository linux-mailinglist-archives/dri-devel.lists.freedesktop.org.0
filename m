Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CE74A3FFA
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 11:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36C510E56D;
	Mon, 31 Jan 2022 10:19:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AE310E3BF;
 Mon, 31 Jan 2022 10:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643624352; x=1675160352;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MnTWiGQ7ZJCVsuQGZ6UlU39x39JNj3riE0XvvdnAMO4=;
 b=XuR71z66yYcflOv5C0zluwDCpHDRzmnU+WxXm0ay/IBzMECIWaBPHqFl
 aNrhgumP4lUoNkuh2K2Rp6Ah7yAsv6ra7lJSKG07uSIwrdNtmzPktJVWy
 5JWjapv75pAzrXiht7euGozh6Y0zyhAbdm5RZ1bSs8QcGwWFMJt0QMWre
 /fN78YAVJdwWfTnCYWPNwNjMYN6CzogROETxV4zjJwNTFBwKkQXV5aJma
 pj3bi+u7uhe6KVFz/VOA2kFcdK5aZNk6AIofkBFTvK7cKeqjlQoKXL2P4
 jH3sOgOjHggs4D4CrWsjEpy/qkSnq3UW0672WcBeoIPkjnAjWEIJFny4O g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="231004945"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="231004945"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 02:19:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="697953763"
Received: from bvandelf-mobl1.ger.corp.intel.com (HELO [10.252.5.180])
 ([10.252.5.180])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 02:19:10 -0800
Message-ID: <3d4631b7-d138-2c6f-299a-cdcaf569a541@intel.com>
Date: Mon, 31 Jan 2022 10:19:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/5] drm/i915: More gt idling time with guc submission
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220128185209.18077-1-ramalingam.c@intel.com>
 <20220128185209.18077-4-ramalingam.c@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220128185209.18077-4-ramalingam.c@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/01/2022 18:52, Ramalingam C wrote:
> On i915_selftest@live@gt_timelines, we create many contexts in loop and
> create and submit request and then destoy contexts. Destroying the context
> needs to disable scheduling, wait for G2H, deregister context and wait
> for G2H to destroy each context. Idling of the gt has to wait for all
> this to complete which is taking ~3sec for this test.
> 
> Hence we are increasing the igt_flush_test's timeout for gt idling to
> 3Sec.
> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Matthew Brost <matthew.brost@intel.com>
Acked-by: Matthew Auld <matthew.auld@intel.com>
