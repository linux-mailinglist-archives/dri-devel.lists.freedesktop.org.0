Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724D7808558
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAEB10E85D;
	Thu,  7 Dec 2023 10:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1499610E85D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 10:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701944525; x=1733480525;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yFK199f4z/5k6fY98pVHkv/iBzD0ZAv+LXPo1oUp+Jg=;
 b=d2GGAUebZny5Qgs7bvqGZzZlK+7OjlA6Y8fqj7SO6h8Wiv5C1zq+iqXD
 wGNTcIhLLfoqEm6W2sHa0VIOFOeoNPq7HKm7V7ItE4+xkBHtxFnJJa/FK
 XGxCv2SaR+FNYLxmG+6ISBtUbt3JGWP/ECC1FwoWYkBeG+NCm+TIkxHWs
 kkVYYsgR64vP1bwidGAOvPhZsxOlWjoxNi0aQxpuQAKdMYuJJnLK6MO7s
 06PFc+88NnXoO4Uhb3BjHw8cB+vJquXiPBoqlDpk4gLfSyKLAdGp7XZNh
 BhPs0t8/Y9Y9hB34oVpACHEqTCtWAbTGm8n6JT0d2Curj466QnQ3TZmrW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373697300"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="373697300"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 02:22:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="842163180"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; d="scan'208";a="842163180"
Received: from jbuller-mobl.ger.corp.intel.com (HELO [10.213.214.207])
 ([10.213.214.207])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 02:22:02 -0800
Message-ID: <c3eba2be-2498-4271-b1e5-305432600bc4@linux.intel.com>
Date: Thu, 7 Dec 2023 10:22:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Fix FD ownership check in drm_master_check_perm()
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Lingkai Dong
 <Lingkai.Dong@arm.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: <PA6PR08MB107665920BE9A96658CDA04CE8884A@PA6PR08MB10766.eurprd08.prod.outlook.com>
 <CACRpkdbPoDGrxCsuwmz-ep7V38Gi5P74jkfMBX+XJMPXFb=SJg@mail.gmail.com>
 <bed6544c-9434-42df-ba4c-a32022823b24@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <bed6544c-9434-42df-ba4c-a32022823b24@amd.com>
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
Cc: nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 07/12/2023 10:18, Christian König wrote:
> Am 07.12.23 um 11:12 schrieb Linus Walleij:
>> On Wed, Dec 6, 2023 at 2:52 PM Lingkai Dong <Lingkai.Dong@arm.com> wrote:
>>
>>> The DRM subsystem keeps a record of the owner of a DRM device file
>>> descriptor using thread group ID (TGID) instead of process ID (PID), to
>>> ensures all threads within the same userspace process are considered the
>>> owner. However, the DRM master ownership check compares the current
>>> thread's PID against the record, so the thread is incorrectly 
>>> considered to
>>> be not the FD owner if the PID is not equal to the TGID. This causes DRM
>>> ioctls to be denied master privileges, even if the same thread that 
>>> opened
>>> the FD performs an ioctl. Fix this by checking TGID.
>>>
>>> Fixes: 4230cea89cafb ("drm: Track clients by tgid and not tid")
>>> Signed-off-by: Lingkai Dong <lingkai.dong@arm.com>
>> Paging the patch author (Tvrko) and committer (Christian).
>> Here is the patch if you don't have it in your mailbox:
>> https://lore.kernel.org/dri-devel/PA6PR08MB107665920BE9A96658CDA04CE8884A@PA6PR08MB10766.eurprd08.prod.outlook.com/
>>
>> I'm seeing this as well (on Android).
>>
>> Tvrko, Christian: can you look at this?
> 
> Good catch, looks like we missed this occasion while switching from PID 
> to TGID.

Oops, yes..

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

>> Will you apply it to the AMD tree for fixes if it looks OK
>> or does it go elsewhere?
> 
> I can push this to drm-misc-fixes as long as nobody objects in the next 
> hour or so.
> 
> CC: stable? If yes which versions?

Cc: <stable@vger.kernel.org> # v6.4+

Regards,

Tvrtko
