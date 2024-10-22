Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1049AB0EF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 16:35:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273FF10E6A4;
	Tue, 22 Oct 2024 14:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TnQUfYcr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C66110E6AD;
 Tue, 22 Oct 2024 14:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729607740; x=1761143740;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DpGKWlshZysJjod4/wy/ZAeaeZiDhCEXowZpCLlxFgc=;
 b=TnQUfYcrkwhX0veWC/riM44iWel0TdsocK9BkwLPXA4/+rY9UR4dYzTW
 ZRSBMpuzDSw+JgipmKXzaEzm2Zg/8+9h3NW2iC+qJNL5uLTBn33U/ZesT
 tOVmk8etwO9fibcXMfPGmk+sANObV+OLBXA73iJkAAq+zGMz5rR7kwoX7
 Er9IxWoBm39zCb1WvKhf8EyVA1om4uMWDVUb8/8CPPsrfiWchPF43H3Ps
 xnayL77LKe3iCKWnlNQlJ1dzKH3F/4Tt94TXCdTbyFltzYrCP4LdSPUg/
 xbeeraIaHnRqg/3yyVjf8wW7fPHZlznZKdA+cUWCuNj+UI6UjGY6jgB1q A==;
X-CSE-ConnectionGUID: vxr1pwCnTkChfZfn/B0jsw==
X-CSE-MsgGUID: ShyIP7GUTV60Nqyv8p4IuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="16774158"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="16774158"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 07:35:39 -0700
X-CSE-ConnectionGUID: jIUs4AHyTN+fBDn5QnWTVQ==
X-CSE-MsgGUID: a1rdWWrRSqWq+eeJmEIBDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="79896219"
Received: from sosterlu-desk.ger.corp.intel.com (HELO [10.245.244.157])
 ([10.245.244.157])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 07:35:38 -0700
Message-ID: <f51d8491-1c7e-4497-8f9e-8e5ec25ab4c5@intel.com>
Date: Tue, 22 Oct 2024 15:35:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/9] drm/xe: Take PM ref in delayed snapshot capture
 worker
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, thomas.hellstrom@linux.intel.com
References: <20241021211835.1675640-1-matthew.brost@intel.com>
 <20241021211835.1675640-5-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241021211835.1675640-5-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/10/2024 22:18, Matthew Brost wrote:
> The delayed snapshot capture worker can access the GPU or VRAM both of
> which require a PM reference. Take a reference in this worker.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Fixes: 4f04d07c0a94 ("drm/xe: Faster devcoredump")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

