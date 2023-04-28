Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 554856F16E2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 13:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3323E10ECE9;
	Fri, 28 Apr 2023 11:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C8B910E3B5;
 Fri, 28 Apr 2023 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682681856; x=1714217856;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r+lEb9TiFos67P+XBhpmGcYi3Yo9mEf1O2PfhzE4aek=;
 b=KvmE+85QCZeqxgfCWHRBNRxB7lyNv0+XAdX/C4aDc4dTd2JSVf3EUhq2
 MitSDet7m/kdfqyl2Mz+KikjwkWIzNj0dPgWv95VEWiGSdBNoyd++572m
 ds4Pl1v87rQcpheFjsHXGHvjXYZUoiCEWcaHp8XqQMQhXKmxEis3Ob5da
 rVz3kB2KWdaHFhD+Y3cLvQzOZ9ksc3+QV1sM8m4LihDnZ5CxhrIO8PoIH
 1eC3meOUb9w/FrhJr6zSwHcCsZY8+Qkh8jPkrF4ahOxA+s+Hga1pvPHhJ
 54UnIGNym34zOHsCtHxNhp+QGQ9jkjGdS8UNsjvKI4qaor6vdDd7FHsq/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="328059576"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="328059576"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 04:37:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="759629569"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; d="scan'208";a="759629569"
Received: from ahermans-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.35.91])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 04:37:31 -0700
Date: Fri, 28 Apr 2023 13:37:28 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [RFC PATCH] x86/mm: Fix PAT bit missing from page protection
 modify mask
Message-ID: <ZEuv+PoleXWAa4Nw@ashyti-mobl2.lan>
References: <20230424123524.17008-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424123524.17008-1-janusz.krzysztofik@linux.intel.com>
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
Cc: Juergen Gross <jgross@suse.com>, x86@kernel.org,
 Yu Zhao <yuzhao@google.com>, David Hildenbrand <david@redhat.com>,
 intel-gfx@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andi Shyti <andi.shyti@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

On Mon, Apr 24, 2023 at 02:35:24PM +0200, Janusz Krzysztofik wrote:
> Visible glitches have been observed when running graphics applications on
> Linux under Xen hypervisor.  Those observations have been confirmed with
> failures from kms_pwrite_crc Intel GPU test that verifies data coherency
> of DRM frame buffer objects using hardware CRC checksums calculated by
> display controllers, exposed to userspace via debugfs.  Affected
> processing paths have then been identified with new test variants that
> mmap the objects using different methods and caching modes.

BTW, are you going to update those tests in IGT?

Andi
