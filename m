Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845F8411253
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 11:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5434E6E457;
	Mon, 20 Sep 2021 09:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3E56E454;
 Mon, 20 Sep 2021 09:53:37 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10112"; a="286773771"
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="286773771"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 02:53:37 -0700
X-IronPort-AV: E=Sophos;i="5.85,308,1624345200"; d="scan'208";a="473541206"
Received: from yohlee-mobl1.gar.corp.intel.com (HELO [10.214.151.93])
 ([10.214.151.93])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2021 02:53:32 -0700
Subject: Re: [PATCH v3 4/6] drm/i915/gt: Register the migrate contexts with
 their engines
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Brost Matthew <matthew.brost@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
References: <20210914193112.497379-1-thomas.hellstrom@linux.intel.com>
 <20210914193112.497379-5-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <f19d80b0-e1c7-46f9-a9cf-2f967769b978@intel.com>
Date: Mon, 20 Sep 2021 10:53:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210914193112.497379-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/09/2021 20:31, Thomas Hellström wrote:
> Pinned contexts, like the migrate contexts need reset after resume
> since their context image may have been lost. Also the GuC needs to
> register pinned contexts.
> 
> Add a list to struct intel_engine_cs where we add all pinned contexts on
> creation, and traverse that list at resume time to reset the pinned
> contexts.
> 
> This fixes the kms_pipe_crc_basic@suspend-read-crc-pipe-a selftest for now,
> but proper LMEM backup / restore is needed for full suspend functionality.
> However, note that even with full LMEM backup / restore it may be
> desirable to keep the reset since backing up the migrate context images
> must happen using memcpy() after the migrate context has become inactive,
> and for performance- and other reasons we want to avoid memcpy() from
> LMEM.
> 
> Also traverse the list at guc_init_lrc_mapping() calling
> guc_kernel_context_pin() for the pinned contexts, like is already done
> for the kernel context.
> 
> v2:
> - Don't reset the contexts on each __engine_unpark() but rather at
>    resume time (Chris Wilson).
> v3:
> - Reset contexts in the engine sanitize callback. (Chris Wilson)
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Brost Matthew <matthew.brost@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

