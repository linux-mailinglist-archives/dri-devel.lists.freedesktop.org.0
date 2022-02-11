Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E64B2649
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D2FE10EBD2;
	Fri, 11 Feb 2022 12:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E7310EBC3;
 Fri, 11 Feb 2022 12:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644583819; x=1676119819;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=le1Y9ZiRDgLGbqnqoXTkTM4Rhv1K8JUf7Aq7ZYiWoME=;
 b=Pz5R/wX4iXbBKUWZFoDlEKDSA4wUJI2ycv/Iq9PfHcG44tsnL4iX3hCf
 xcp0bY6dvCtSD66D8/h9/bGNIYIdBrrjW9RC4CAvCeqWluW7kR8NFp0Dj
 xKl8z7dArFqmR5COlLGARgUwUFh24lo2GvazN8MYYxZSaIO8aPO/pz1ji
 +pF/Y+9tEt1OX9BsOyGbMwG/W2EwKJflrsnjR4eGdlpqnatw5GGQIly+e
 QNPOoKbocaVxNfMcOmlmXC98T8KkRZv6Ci8CuOfEvbWShKcK2D2jmcVU6
 cSeXl31YQl1I6XiJ6G9bZtpThVSAbi5OoyziUulBNltmhJrtY5kuy/QIb A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="274282137"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="274282137"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 04:50:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="774244563"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 04:50:17 -0800
Message-ID: <9334e31d-fa6b-0c2f-17b1-bc182870830c@linux.intel.com>
Date: Fri, 11 Feb 2022 13:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 14/15] drm/i915/uapi: forbid ALLOC_GPU_ONLY for error
 capture
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220211113437.874691-1-matthew.auld@intel.com>
 <20220211113437.874691-15-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220211113437.874691-15-matthew.auld@intel.com>
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
Cc: Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/11/22 12:34, Matthew Auld wrote:
> On platforms where there might be non-mappable LMEM, force userspace to
> mark the buffers with the correct hint. When dumping the BO contents
> during capture we need CPU access. Note this only applies to buffers
> that can be placed in LMEM, and also doesn't impact DG1.
>
> v2(Reported-by: kernel test robot <lkp@intel.com>):
>    - Also update the function signature on !CONFIG_DRM_I915_CAPTURE_ERROR
>      builds.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


