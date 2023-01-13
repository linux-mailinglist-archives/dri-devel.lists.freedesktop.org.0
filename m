Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A866E66965B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 13:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFCB10E9F2;
	Fri, 13 Jan 2023 12:05:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CCE10E9F2;
 Fri, 13 Jan 2023 12:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673611529; x=1705147529;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IJ/sdzhc2eeITgP3/UPdBD6zgvBTF1ZXWr21IV0FHds=;
 b=at3lkguRdhOhVaSKKu3jJ704ASwnFopDu7Fcf9gJbzDtXXD0jdbBjqhs
 w2WSMf5duGnJHJMp1ruO0HIJjctaERIjBvJYY3ogx5irQPQAEmyHotVx1
 P8EvrqrmachwGzoS3RIQxrRyGEgI4srd6E1nk4QhMC6tLyo1dp7tG9tKv
 dbzFKmeDahwkvZCAib4rfz1oSOEinXYVFs1xh8oqUsh5RJpDw3w2JQGAm
 xuqjbtAg7HmIPLr/t2vlWn4WT7bZ+VjNvElKpqVjh0poVjBGbXPR6LdeK
 NvpWhswRTt7+Bb8CNZt+IU1B29BTKU6HCu2pKe8zzML8obBvqyxSMAaHk Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="410213620"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="410213620"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 04:05:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="800583028"
X-IronPort-AV: E=Sophos;i="5.97,213,1669104000"; d="scan'208";a="800583028"
Received: from andreasg-mobl2.ger.corp.intel.com (HELO [10.252.13.101])
 ([10.252.13.101])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 04:05:22 -0800
Message-ID: <e2c3f194-8122-5fe1-c6e4-25d8af867f64@intel.com>
Date: Fri, 13 Jan 2023 12:05:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/i915/selftests: Unwind hugepages to drop wakeref on
 error
Content-Language: en-GB
To: "Das, Nirmoy" <nirmoy.das@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230113114903.7824-1-nirmoy.das@intel.com>
 <f691df00-a1b3-a6e1-3ed8-cdb4eb7a5a56@intel.com>
 <28a2aa02-b62c-9666-6b1f-11bd33b50c23@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <28a2aa02-b62c-9666-6b1f-11bd33b50c23@linux.intel.com>
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
Cc: chris.p.wilson@linux.intel.com, dri-devel@lists.freedesktop.org,
 andi.shyti@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/01/2023 12:02, Das, Nirmoy wrote:
> Thanks Matt, I missed the Fixes tag so resent it with fixes and Cc to 
> stable.

I don't think kernel selftests are really stable material. AFAIK it's 
not something normal users care about.

> 
> On 1/13/2023 12:51 PM, Matthew Auld wrote:
>> On 13/01/2023 11:49, Nirmoy Das wrote:
>>> From: Chris Wilson <chris.p.wilson@linux.intel.com>
>>>
>>> Make sure that upon error after we have acquired the wakeref we do
>>> release it again.
>>>
>>> Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
