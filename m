Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A13435FF3
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 13:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7996E43D;
	Thu, 21 Oct 2021 11:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DA26E42A;
 Thu, 21 Oct 2021 11:06:34 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="209803771"
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="209803771"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 04:06:33 -0700
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="444759330"
Received: from pkreftx-mobl1.ger.corp.intel.com (HELO [10.252.50.34])
 ([10.252.50.34])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 04:06:32 -0700
Subject: Re: [PATCH 02/28] drm/i915: use new iterator in
 i915_gem_object_wait_reservation
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-2-maarten.lankhorst@linux.intel.com>
 <022f8ecb-37c0-3d67-563f-012f0a3651df@amd.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <c7c82fa5-6fe5-33e2-e224-c5433020100c@linux.intel.com>
Date: Thu, 21 Oct 2021 13:06:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <022f8ecb-37c0-3d67-563f-012f0a3651df@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Op 21-10-2021 om 12:38 schreef Christian König:
> Am 21.10.21 um 12:35 schrieb Maarten Lankhorst:
>> From: Christian König <christian.koenig@amd.com>
>>
>> Simplifying the code a bit.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> [mlankhorst: Handle timeout = 0 correctly, use new i915_request_wait_timeout.]
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> LGTM, do you want to push it or should I pick it up into drm-misc-next? 

I think it can be applied to drm-intel-gt-next, after a backmerge. It needs patch 1 too, which fixes

i915_request_wait semantics when used in dma-fence. It exports a dma-fence compatible i915_request_wait_timeout function, used in this patch.

