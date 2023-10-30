Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B1F7DB3A3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 07:43:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1258810E20B;
	Mon, 30 Oct 2023 06:43:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9963410E20B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 06:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698648205; x=1730184205;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VVRilNzxZP4aE/nh/tmz3yQ3Zg9zBF6N57m7m02C4fg=;
 b=GXoaL/BQHfxzH1xFke1b0d3eGh2hpIHvfKUcD1i33u5nS6zD6w7uE76q
 E9aJvYVCaLkjA1gSU36f5ZpzdWkJlX2vH285loOki0j8YmKOYA20oMh5g
 XszpcKN7JuqEvLrZ0aNe3Wv0Jp2Jons8O2ahjh9iIUd53JHQ4qTcOXho6
 0ZDagL7bp/UYr27vGJ/DFE44cj9Nurh0Q7zDYBSgxk3bXAdhX8RdEMLZH
 Xz1qXE4pobXBmKqCkrfZMic+VRqE74Urxhpk4sZZg4akrFEm6eVJUMFQH
 CQaPUusB+cA4lgPn5ijTcQHASc8DLjLwLwx+y/EKtRg8JBIVjWZBoJgY1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="391882283"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; d="scan'208";a="391882283"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2023 23:43:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="825966244"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; d="scan'208";a="825966244"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2023 23:43:22 -0700
Date: Mon, 30 Oct 2023 07:43:20 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] accel/qaic: Quiet array bounds check on DMA abort message
Message-ID: <ZT9QiFcqHhqPfCoH@linux.intel.com>
References: <20231027180810.4873-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027180810.4873-1-quic_jhugo@quicinc.com>
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org, quic_pkanojiy@quicinc.com,
 quic_carlv@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 12:08:10PM -0600, Jeffrey Hugo wrote:
> From: Carl Vanderlip <quic_carlv@quicinc.com>
> 
> Current wrapper is right-sized to the message being transferred;
> however, this is smaller than the structure defining message wrappers
> since the trailing element is a union of message/transfer headers of
> various sizes (8 and 32 bytes on 32-bit system where issue was
> reported). Using the smaller header with a small message
> (wire_trans_dma_xfer is 24 bytes including header) ends up being smaller
> than a wrapper with the larger header. There are no accesses outside of
> the defined size, however they are possible if the larger union member
> is referenced.
> 
> Abort messages are outside of hot-path and changing the wrapper struct
> would require a larger rewrite, so having the memory allocated to the
> message be 8 bytes too big is acceptable.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310182253.bcb9JcyJ-lkp@intel.com/
> Signed-off-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
