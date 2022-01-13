Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD8F48DA2C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9257C10E2AB;
	Thu, 13 Jan 2022 14:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B5D10E22B;
 Thu, 13 Jan 2022 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642085629; x=1673621629;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yXmtTjQIxA8pTDeMIhElv1FU2AbhzuAiZ2ol3bxA+/E=;
 b=dl5fdLhFG28N0Ee4K+mKE5rR4iK63Kg2fCj0q8ccQQS05VRZSpoytIdy
 TDLT0sOxy4iec7erNv4gKiQltGvILq8sJ2Oj1bBRGihxRLklT0G0TgWKT
 NdLR+wcJXiK/gva4vNtp8svtRoXaMA8+n7RUCqgCqclA3/IZujBpo5VJW
 LiFzKwc8ctjWdf8f1VzLeX4S952HrxmbgHtVusIgC1aTFQ5iYWjTXnz0q
 aZYZE6oVYwGmswkF+3eBc6Pwlo46f/VXhc+Nbn5Ofhp0lrrvTgr9jH7Lk
 5N+tVtlJgvjo7mZw8AZp73csa1pJzkKsDGcEXQfdUp1vUIDoAe/kTAwiE Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10225"; a="268375344"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="268375344"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 06:53:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; d="scan'208";a="670534007"
Received: from inechita-mobl2.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2022 06:53:47 -0800
Message-ID: <219ea473-f619-a439-927c-cbc8e78f56d2@linux.intel.com>
Date: Thu, 13 Jan 2022 15:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v5 4/6] drm/i915: Add
 i915_vma_unbind_unlocked, and take obj lock for i915_vma_unbind, v2.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220113114500.2039439-1-maarten.lankhorst@linux.intel.com>
 <20220113114500.2039439-5-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220113114500.2039439-5-maarten.lankhorst@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/13/22 12:44, Maarten Lankhorst wrote:
> We want to remove more members of i915_vma, which requires the locking to be
Checkpatch.pl warning.
