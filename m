Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F447B0D9C3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 14:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80D410E670;
	Tue, 22 Jul 2025 12:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N2cK6LGx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA9E10E66D;
 Tue, 22 Jul 2025 12:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753187816; x=1784723816;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=DA3oyklXr9iO7/TaCfwfMSZosvx7jJjWPpa7mLDHWfI=;
 b=N2cK6LGxACoLWTKd/apHbaXqCA4ocCl6/GA3xCxsjseL1bUzBh6NrsBU
 kAx9dVwqOzjdjbnGoXsMqhLbDndsV8YbjGGWtoKW4XTf7QKqrg9cHGhKy
 +YeS9CbDacJ6VFub1VmDdFPMDH/dEZr9imFs0LVsfoWFJPWDlta3CQuGa
 MEladWdYHe3jkVofEdKWycx3ygkQoNJjxJJuhyJ6EMHRhqMtuqXXGcEG/
 /Dc6qNEVynkINcJU9Txz8uOHik6bZ3emRkwOFdv7RjZiRPhIt5Mczy/R3
 yZ7ChWuFkQOBdyLKtd/AZT+9+b+JKFOD2qLCGKJ9TRkU34TiUQFb6UuoP g==;
X-CSE-ConnectionGUID: S+W8mCUJQ5ODDa8DYQLwAg==
X-CSE-MsgGUID: 1U4brgleS6KjcU2O0jKaYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="54649919"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="54649919"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:36:56 -0700
X-CSE-ConnectionGUID: PrHAHVQuRMynZBBN1YH7YA==
X-CSE-MsgGUID: 7FBRdUz6SWmyWwumKv2jzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163686711"
Received: from vpanait-mobl.ger.corp.intel.com (HELO [10.245.244.202])
 ([10.245.244.202])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:36:54 -0700
Message-ID: <c5830530bafa9806b9e1b0604d87f7907f651c82.camel@linux.intel.com>
Subject: Re: Switching over to GEM refcounts and a bunch of cleanups
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Tue, 22 Jul 2025 14:36:52 +0200
In-Reply-To: <20250716160555.20217-1-christian.koenig@amd.com>
References: <20250716160555.20217-1-christian.koenig@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

Hi, Christian,

On Wed, 2025-07-16 at 18:04 +0200, Christian K=C3=B6nig wrote:
> Hi guys,
>=20
> so I hope Thomas is back from vacation while I will be on vacation
> for
> the next two weeks.
>=20
> Here is the patch set which cleans up TTM and XE in preperation of
> switching to drm_exec.
>=20
> Please take a look and let me know what you think about it.

I'll take a look.
BTW Did you see my comments on patch 6/6 on v1, essentially I think
both i915 and xe rejecting some TTM callbacks if the object is a zombie
(the GEM refcount has reached 0).

Thanks,
Thomas


>=20
> Regards,
> Christian.
>=20

