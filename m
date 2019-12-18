Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867E01257F4
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 00:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4176EAA8;
	Wed, 18 Dec 2019 23:45:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEEF6EAA6;
 Wed, 18 Dec 2019 23:45:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 15:45:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="416004439"
Received: from nvishwa1-desk.sc.intel.com ([10.3.160.185])
 by fmsmga005.fm.intel.com with ESMTP; 18 Dec 2019 15:45:32 -0800
Date: Wed, 18 Dec 2019 15:34:23 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [RFC v2 02/12] drm/i915/svm: Runtime (RT) allocator support
Message-ID: <20191218233423.GE17413@nvishwa1-DESK.sc.intel.com>
References: <20191213215614.24558-1-niranjana.vishwanathapura@intel.com>
 <20191213215614.24558-3-niranjana.vishwanathapura@intel.com>
 <20191217201815.GF16762@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217201815.GF16762@mellanox.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "kenneth.w.graunke@intel.com" <kenneth.w.graunke@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "jason.ekstrand@intel.com" <jason.ekstrand@intel.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 08:18:21PM +0000, Jason Gunthorpe wrote:
>On Fri, Dec 13, 2019 at 01:56:04PM -0800, Niranjana Vishwanathapura wrote:
>
>> +	ctx = i915_gem_context_lookup(file->driver_priv, args->rsvd1);
>> +	if (!ctx || !rcu_access_pointer(ctx->vm))
>> +		return -ENOENT;
>> +
>> +	rcu_read_lock();
>> +	vm = i915_vm_get(ctx->vm);
>> +	rcu_read_unlock();
>
>This looks like wrong use of RCU to me.
>
>Getting a rcu lock and not calling rcu_dereference under it is
>basically guarenteed to be wrong..
>

Oops, yah, I should be just calling i915_gem_context_get_vm_rcu().

Thanks,
Niranjana

>Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
