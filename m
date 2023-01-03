Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D065C3E8
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 17:31:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD14A10E26D;
	Tue,  3 Jan 2023 16:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E6A10E070
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 16:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672763467; x=1704299467;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cuLVXqBKitfJu7cWSS3kXh4OUsfRP4UzwtSLqsbAn2c=;
 b=F55d2vo1eNrJURNhdS44r/ozY4Ys6c7kdvDeEqfbIcX7g/7KTmVHgKJR
 3sin120xew0fUkl39A7YYkQukrvT9HkKpH3Ylz2zEu1ECmmq+1DxMIhnE
 srQLgFF3KjF16vNPQiW9YCiWhIBYfTYcrvncYVCeegdN5ICaiaaFCcHSU
 rdWg8iROTWFVM09WqG2A5pAttpnnlnx7P07KN3eiyy4WCKGXZpnaG9aX0
 W4V3odjFvc1GY9i8QEHx8ZHN8T7h7IKry4GaR9cgIzDrXAUVAb4n8Sxdm
 c5m51PjxHI5erp6aU+SQpZ0cGCjreddaE542YkQrSiXCHXai2fchWOOgz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="301376989"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; d="scan'208";a="301376989"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 08:31:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="900230341"
X-IronPort-AV: E=Sophos;i="5.96,297,1665471600"; d="scan'208";a="900230341"
Received: from adorney-mobl.ger.corp.intel.com (HELO [10.213.222.30])
 ([10.213.222.30])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2023 08:31:00 -0800
Message-ID: <5b12840a-6449-9f04-2161-37eea635d7e7@linux.intel.com>
Date: Tue, 3 Jan 2023 16:30:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm: Replace DRM_DEBUG with drm_dbg_core in file and
 ioctl handling
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20221223112302.320097-1-tvrtko.ursulin@linux.intel.com>
 <Ouj8KzpA0lrnzC2YtFbX5tEX0Ul5cCTyrv3EU8NV43vW4OvkygMxFbbmZuuNHzVQd0sve9fgk2ZcATKeu1inEq12B9W4SYGGTdDWLBfuUWo=@emersion.fr>
 <c7337539-9d75-49c5-286a-d94e3e78c4df@linux.intel.com>
 <xnufxH1XoaGhgn-6c2f0sIWqdDktkVmzwOVZqN5R_W5elPxJnzD3ZIXOzUd3vg7RcatrWvxFvElw9JF7MdduIdpAkvT4iilppyO43KEr-no=@emersion.fr>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <xnufxH1XoaGhgn-6c2f0sIWqdDktkVmzwOVZqN5R_W5elPxJnzD3ZIXOzUd3vg7RcatrWvxFvElw9JF7MdduIdpAkvT4iilppyO43KEr-no=@emersion.fr>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/01/2023 15:39, Simon Ser wrote:
> On Tuesday, January 3rd, 2023 at 16:37, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> 
>> On 23/12/2022 11:26, Simon Ser wrote:
>>
>>> Reviewed-by: Simon Ser contact@emersion.fr
>>
>> Thanks - adding some drm-misc maintainers to consider pulling the patch in.
> 
> I can push the patches if you don't have commit rights.

Don't think I do - drm-intel only. Great if you can then, thanks!

Regards,

Tvrtko
