Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6007A5DB5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 11:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1520D10E251;
	Tue, 19 Sep 2023 09:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1996D10E362
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 09:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695115504; x=1726651504;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ST9gyPlOYrPzsga1F4aipdwekab8Iyf1gnpBi5RD90g=;
 b=aDMXHxqJJOsBcwsuoqWK3fvM2Z98x0bcxtu5tMom+pKBuCdUGd78ba+A
 H2jYyyTTDckzF3W1bZsbrw9DfKDj+KE8zdqejDoTn7tgy1OIoR0kWltZs
 hN0nz2YPlaMakUuoveqPNCQ7DbC73Oj7gCc6UqazJdmkx2MAvgBxRyvZZ
 ZjVniKjcfCGFTN7F8mCdEpeYjbnE7aGs1CNIBh01QESFZ4AoQRtN+N/OV
 Vz7WcziH1ZsaizAhMKFw7ScTo1ncYTT9HTtgKOeFGz+DLdqsVLj5NohRt
 ufPinW8gctHt/HDyUsYgn13o3jOIniMzKl/ptP9BAcOjyCz+EqQNLeckJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="360154278"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="360154278"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:25:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="775483391"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="775483391"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 02:25:01 -0700
Date: Tue, 19 Sep 2023 11:24:59 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [RFC 1/4] accel/ivpu: Allocate vpu_addr in gem->open() callback
Message-ID: <20230919092459.GA563961@linux.intel.com>
References: <20230901164842.178654-1-stanislaw.gruszka@linux.intel.com>
 <20230901164842.178654-2-stanislaw.gruszka@linux.intel.com>
 <62e3769d-b747-9258-c330-97c034ea52ec@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62e3769d-b747-9258-c330-97c034ea52ec@quicinc.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 09:19:03AM -0600, Jeffrey Hugo wrote:
> On 9/1/2023 10:48 AM, Stanislaw Gruszka wrote:
> > From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> > 
> > gem->open() is called during handle creation for a gem object.
> > It is called during prime import and in BO_CREATE ioctl.
> 
> I feel like the "why" is missing.  This appears to start to explain how
> gem->open() might be useful for the driver, but does not seem to complete
> explaining the connection to the driver.  From the code changes, it looks
> like using gem->open() simplifies the code by allocating the vpu_addr in one
> place for all BOs.  If that is the goal, I feel that it should be mentioned
> here.

I'm going to change to:

Use gem->open() callback to simplify the code and prepare for gem_shmem
conversion. It is called during handle creation for a gem object - during
prime import and in BO_CREATE ioctl. Hence can be used for vpu_addr
allocation. On the way remove unused bo->user_ptr field.


Regards
Stanislaw
