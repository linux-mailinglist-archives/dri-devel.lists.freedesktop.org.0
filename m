Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1555A483743
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 19:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7464889D9A;
	Mon,  3 Jan 2022 18:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC67889870;
 Mon,  3 Jan 2022 18:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641236258; x=1672772258;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=nU6vWZWZhKZhv6sqSOiFoNQ0cbmogFp4gZjuVnk1evc=;
 b=bcQLlRWKPwGt+u5dzAgSxtHiPvp9rGvGpNDQdhTxTPzUqHWP7qDrUTHV
 wr1uigIAnzr3XuIZLElv5oLAK/iSXECIN+iMNmyYStqOWat4gXiTCk2ZX
 fnqje5/Anywe4/gr5umMpU4ExOZDUZx/QszkK6JnrAuj72Zmu2CiiLugc
 1XkadfEvw+S92sZZgwCl1j4rosz1851ymE2F9EON8HJaG5fsTR+s7KYN0
 eH/H7Q0Ad95YYWNpPvWkzjtEJXa95pNXyusVwL2vaQ58tt3rz2dAV3vyT
 i4svZTCUsM5hrmWMJmzpoaD1h0dUTnfeZTY69a3xG5s0UGsB8aY2n5RIP A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10215"; a="242312984"
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; d="scan'208";a="242312984"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 10:57:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,258,1635231600"; d="scan'208";a="487944544"
Received: from mikaelsk-mobl1.ger.corp.intel.com (HELO [10.249.254.198])
 ([10.249.254.198])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2022 10:57:36 -0800
Message-ID: <c501276b-58f4-9764-30d2-5da2ae00e7e9@linux.intel.com>
Date: Mon, 3 Jan 2022 19:57:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma resource as
 argument for gtt binding / unbinding
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20220103115947.92688-1-thomas.hellstrom@linux.intel.com>
 <20220103115947.92688-3-thomas.hellstrom@linux.intel.com>
 <BN6PR11MB1633E8200E7999D439707F2392499@BN6PR11MB1633.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <BN6PR11MB1633E8200E7999D439707F2392499@BN6PR11MB1633.namprd11.prod.outlook.com>
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
Cc: "Auld, Matthew" <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Oak.

On 1/3/22 19:17, Zeng, Oak wrote:
>
> Regards,
> Oak
>
>> -----Original Message-----
>> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Thomas Hellström
>> Sent: January 3, 2022 7:00 AM
>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>; Auld, Matthew <matthew.auld@intel.com>
>> Subject: [Intel-gfx] [PATCH v4 2/4] drm/i915: Use the vma resource as argument for gtt binding / unbinding
>>
>> When introducing asynchronous unbinding, the vma itself may no longer
>> be alive when the actual binding or unbinding takes place.
> Can we take an extra reference counter of the vma to keep the vma alive, until the actual binding/unbinding takes place?

The point here is that that's not needed, and should be avoided. If the 
vma is no longer alive, that means nobody uses it anymore, but the GPU 
may still have work in the pipe that references the GPU virtual address.

/Thomas.


