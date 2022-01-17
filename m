Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509D3490A0D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 15:12:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F9510E2B0;
	Mon, 17 Jan 2022 14:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9682510E2B0;
 Mon, 17 Jan 2022 14:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642428763; x=1673964763;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3gjd90KyDW8OtAxIchXgpgTpyf16MjeNJjcM+3d9sGA=;
 b=TTB8ExL7vsVMnMsFQmfFUE34zlnHRwzLKEPoFKpRtrVEnQbCSK8/DJ9r
 r8fuwH0yi5TPMaDDVntWButOvjRdoWtob6xD0/x/7hbOzx9LdkEOfZSb1
 DH1e0wxJZW5s/a0J3o7ppwZ5x6n/YT48V9EODK8VEKLDf1ZKZEEEvy9ja
 uX2wr/e8N8DrHdd6Xm4V1Hui2I2CMj8lOuEuyxyxGkOMh+WYcKP3IkKKG
 ++9bbElo1rKmeCG1OOLQJdOfKEboPVxpvc4eEX+SCulMlSD1m/qzmwD+V
 FCbA8IkRB5P5peSkfjSZ/LOGoJwQmuql7Dl1eFg1pzJNQ+1PXpM+vbVig A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10229"; a="244827782"
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="244827782"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 06:08:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="764328869"
Received: from sfhansen-mobl1.ger.corp.intel.com (HELO [10.249.254.119])
 ([10.249.254.119])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2022 06:08:25 -0800
Message-ID: <fb8f8150-bdc3-32aa-5352-5f15ae91a592@linux.intel.com>
Date: Mon, 17 Jan 2022 15:08:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/i915: Add locking to i915_gem_evict_vm(), v3.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <bb70ccb8-043c-bd99-e01e-c2f2a0c48d54@shipmail.org>
 <20220117075604.131477-1-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220117075604.131477-1-maarten.lankhorst@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/17/22 08:56, Maarten Lankhorst wrote:
> i915_gem_evict_vm will need to be able to evict objects that are
> locked by the current ctx. By testing if the current context already
> locked the object, we can do this correctly. This allows us to
> evict the entire vm even if we already hold some objects' locks.
>
> Previously, this was spread over several commits, but it makes
> more sense to commit the changes to i915_gem_evict_vm separately
> from the changes to i915_gem_evict_something() and
> i915_gem_evict_for_node().
>
> Changes since v1:
> - Handle evicting dead objects better.
> Changes since v2:
> - Use for_i915_gem_ww in igt_evict_vm. (Thomas)
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

(Please note the series checkpatch- and DOC warnings before commiting!)

Thanks,

Thomas


