Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BB246F261
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D395410E1D3;
	Thu,  9 Dec 2021 17:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BED6810E1D2;
 Thu,  9 Dec 2021 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639071828; x=1670607828;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ucYSv1TWuUoho10aU7V2UYh07A+xOx1U8tFvFZ/JFg8=;
 b=eQpnpPCoHvt6P1tsCe9DXoYyUsunBLJzwf6ilsskb6E2Io9vzpv75EJw
 9JuQNZ5guZSm6ZVbVV/3mD9bcShfOVcNpPa/uhtgVOskRUy1OQFcLRy/Q
 lhB9S1aL/TjyOwri4jR5GwR7uIW0CE2GLCtx7+FmbHjzijdrmpG457yhX
 PMzuBFb6bmjCnfSL1GoAKqjjosVByeYSBkSJXhXuBMCufFjoX0reppDOU
 opK5dBC+yQttMO/KlN7A5mDreDZhGk+tDiBMLzXA9SIIScmsQZD9fn73i
 XJuWvOpM3gpkFtN3lYAleg56mA8C1CzlMxoaGjDHKl/j385IfqPvIzROn Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="218188534"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="218188534"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:43:31 -0800
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="480424512"
Received: from mkeogh1-mobl1.ger.corp.intel.com (HELO [10.252.18.252])
 ([10.252.18.252])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 09:43:29 -0800
Message-ID: <841f622f-24e3-fcae-e9bd-b2bea148278a@intel.com>
Date: Thu, 9 Dec 2021 17:43:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/i915: Fix coredump of perma-pinned vmas
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211208082245.86933-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211208082245.86933-1-thomas.hellstrom@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/12/2021 08:22, Thomas Hellström wrote:
> When updating the error capture code and introducing vma snapshots,
> we introduced code to hold the vma in memory while capturing it,
> calling i915_active_acquire_if_busy(). Now that function isn't relevant
> for perma-pinned vmas and caused important vmas to be dropped from the
> coredump. Like for example the GuC log.
> 
> Fix this by instead requiring those vmas to be pinned while capturing.
> 
> Tested by running the initial subtests of the gem_exec_capture igt test
> with GuC submission enabled and verifying that a GuC log blob appears
> in the output.
> 
> Fixes: ff20afc4cee7 ("drm/i915: Update error capture code to avoid using the current vma state")
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Reported-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

