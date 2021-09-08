Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E494035C6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 09:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD506E156;
	Wed,  8 Sep 2021 07:58:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2B96E155;
 Wed,  8 Sep 2021 07:58:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10100"; a="220443578"
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="220443578"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 00:58:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,277,1624345200"; d="scan'208";a="648388614"
Received: from smirnov2-mobl.ccr.corp.intel.com (HELO [10.249.254.177])
 ([10.249.254.177])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2021 00:58:41 -0700
Subject: Re: [PATCH v2 3/6] drm/i915 Implement LMEM backup and restore for
 suspend / resume
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com
References: <20210906165515.450541-1-thomas.hellstrom@linux.intel.com>
 <20210906165515.450541-4-thomas.hellstrom@linux.intel.com>
 <51111df6-bf0c-ba09-4a9a-5bd59bec5fa9@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <0c78f895-1e71-c10d-0e90-fa09bf555c5b@linux.intel.com>
Date: Wed, 8 Sep 2021 09:58:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <51111df6-bf0c-ba09-4a9a-5bd59bec5fa9@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Hi, Matt,

Thanks for reviewing.

On 9/7/21 7:37 PM, Matthew Auld wrote:
>
>> +    i915_gem_ww_unlock_single(backup);
>> +    i915_gem_object_put(backup);
>
> I assume we need to set ttm.backup = NULL somewhere here on the 
> failure path, or don't drop the ref? Or at least it looks like 
> potential uaf later?

Yes, I think on failure, we just don't drop the ref here in case 
something at some point decides to retry.

I'll fix up this and other comments.

/Thomas


>
>> +
>> +    return err;
>> +}
>> +
