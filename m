Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9076A6CF3
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 14:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0FF10E066;
	Wed,  1 Mar 2023 13:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A654110E066
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 13:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677676790; x=1709212790;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xKV0pJjYtXJBsiCqkFZBbabUmN7pckAX0viBdG4pUTU=;
 b=bcnJFLQueYl8A1vDcIwn8Gnz1TB2REG11hjEcnQoFjaLdg8QKoV3vNti
 JhWaNr7erLJvAh4UpFdsV9yPT4Lyw2vL3YlRXRtzPU3UYpxJGpsn6mvEW
 77n1Xt+M1jUf5mUEWX2gJSqnQ+d0wBCwW4dla+XD9BaVzHsKhyeI0CA4H
 1DODMgZcW65pRaYfAuzCRw9/c5pz1rMqL7bEtFf9HvnZobLPj2Mp3AKx3
 sVNFWmrgBOMPs0kdoXSUB/YUDcfDX+NoP8wmarm0g52LU6UAdqbh+LoMU
 aN1K4aMSUCJk8Um8O5m0sSJX8FYo0+GCo3t/wfjwnCdRPQryjy8KOCFE3 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="335898245"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="335898245"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:19:50 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="674551592"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="674551592"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:19:47 -0800
Date: Wed, 1 Mar 2023 14:19:45 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 6/8] accel/qaic: Add mhi_qaic_cntl
Message-ID: <20230301131945.GD3815307@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-7-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675698105-19025-7-git-send-email-quic_jhugo@quicinc.com>
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
Cc: linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ogabbay@kernel.org, dri-devel@lists.freedesktop.org, quic_ajitpals@quicinc.com,
 quic_pkanojiy@quicinc.com, quic_carlv@quicinc.com,
 jacek.lawrynowicz@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 06, 2023 at 08:41:43AM -0700, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Some of the MHI channels for an AIC100 device need to be routed to
> userspace so that userspace can communicate directly with QSM.  The MHI
> bus does not support this, and while the WWAN subsystem does (for the same
> reasons), AIC100 is not a WWAN device.  Also, MHI is not something that
> other accelerators are expected to share, thus an accel subsystem function
> that meets this usecase is unlikely.
> 
> Create a QAIC specific MHI userspace shim that exposes these channels.
> 
> Start with QAIC_SAHARA which is required to boot AIC100 and is consumed by
> the kickstart application as documented in aic100.rst
> 
> Each AIC100 instance (currently, up to 16) in a system will create a
> chardev for QAIC_SAHARA.  This chardev will be found as
> /dev/<mhi instance>_QAIC_SAHARA
> For example - /dev/mhi0_QAIC_SAHARA
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
