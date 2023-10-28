Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADA37DA5D4
	for <lists+dri-devel@lfdr.de>; Sat, 28 Oct 2023 10:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E2B10E08D;
	Sat, 28 Oct 2023 08:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3DC510E08D
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Oct 2023 08:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698482184; x=1730018184;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=K50TtdGflaJbGGrwCCGgiZ3+33xzglKgS60aXNaVez8=;
 b=CbHNARo2KmvOAlFKKBC/80PVRdFAVxLz9TgVk2Hwmq+BOtY8rf9raPLE
 7NG02/SpkiKUq9oVtfA2rNbn4jlN/1Fgud7RimedxgcOw2SX9kgbOF5yN
 5EaMtY+FsqAMHo5RiD9ljfvnu2ImPYsGO99uBcjvNVlmHMb22xif5j91M
 ERLN9QcPhpTV3FjKoDMIGpGWWuhOTcD0+0kloL/L1JVdqe+q7mrNfPJsk
 SCxWueX7Yx+EPd7ijTxdZJJZiCrzQPMTRr8+MxQAzRmWtp02SH7aanXI+
 K/d2w7VsgnrPQk8IF4kzfE72/UajF0w94bwSfqJCNAdOkY7kdaaOlKV+y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="418997384"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; d="scan'208";a="418997384"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 01:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="736317212"
X-IronPort-AV: E=Sophos;i="6.03,258,1694761200"; d="scan'208";a="736317212"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.50.225])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2023 01:36:22 -0700
Date: Sat, 28 Oct 2023 10:36:19 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH 07/11] accel/ivpu: Introduce ivpu_ipc_send_receive_active()
Message-ID: <ZTzIA3+kVl9n/Emj@linux.intel.com>
References: <20231025094323.989987-1-stanislaw.gruszka@linux.intel.com>
 <20231025094323.989987-8-stanislaw.gruszka@linux.intel.com>
 <bdd18dc1-fb4c-2058-b242-5e311266de5b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdd18dc1-fb4c-2058-b242-5e311266de5b@quicinc.com>
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
Cc: Karol Wachowski <karol.wachowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 08:49:21AM -0600, Jeffrey Hugo wrote:
> On 10/25/2023 3:43 AM, Stanislaw Gruszka wrote:
> > From: Karol Wachowski <karol.wachowski@linux.intel.com>
> > 
> > Split ivpu_ipc_send_receive() implementation to have a version
> > that does not call pm_runtime_resume_and_get(). That implementation
> > can be invoked when device is up and runtime resume is prohibited
> > (for example at the end of boot sequence).
> 
> There doesn't seem to be a user for this, which would make the new function
> dead code.  Assuming that this new function gets used later in the series,
> it would be clearer to combine this change with that one.

It is used in patch 10. I would prefer not to merge those, since the changes
are not that related. I would reorder this patch just before patch 10 and
add note it's used there.

Regards
Stanislaw
