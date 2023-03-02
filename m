Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7656A7FE9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 11:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1595310E4A5;
	Thu,  2 Mar 2023 10:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C855510E4B8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 10:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677752732; x=1709288732;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Zg8zIpePcUTWTG6jLpnoRC8w3cmeMjCx0K5pGe8kfuI=;
 b=br9ZDR8xmKDxiGAQl8ozLx1cM6+mOvVvqCu7kB3dv7w5om4CaQmirmYM
 iNZO3v5rMKOkeGNgUSiuDXd1pR6eq8UaHeghk59EotR07xsXmhiyNBNd5
 oYGWOM6LqaQ4G8cwL0PoWaowDy2Ihw2yDSaW5tVtxgLYswTjGjOMf30Lr
 Eq4wG2iHOw3B30YuxQdy1VZGJvWKgmxwmSipohc2DTt7Nae/tjcEVIQgc
 oXKN/3iwpDRnPedb8nXezjxXN5qKqgkcbKNLZlAYoSD83x5V+3gS9OEFT
 aXft0vA4C0jAkGUQwZ53tp1xMTKbpdvqBnOuEvMS6u8b6ThQGwQWBKD8h Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="322958706"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="322958706"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 02:25:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="674910510"
X-IronPort-AV: E=Sophos;i="5.98,227,1673942400"; d="scan'208";a="674910510"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2023 02:25:31 -0800
Date: Thu, 2 Mar 2023 11:25:29 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 2/2] habanalabs: use scnprintf() in
 print_device_in_use_info()
Message-ID: <20230302102529.GC3963532@linux.intel.com>
References: <20230302091517.14896-1-ogabbay@kernel.org>
 <20230302091517.14896-2-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302091517.14896-2-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 02, 2023 at 11:15:17AM +0200, Oded Gabbay wrote:
> From: Tomer Tayar <ttayar@habana.ai>
> 
> compose_device_in_use_info() was added to handle the snprintf() return
> value in a single place.
> However, the buffer size in print_device_in_use_info() is set such that
> it would be enough for the max possible print, so
> compose_device_in_use_info() is not really needed.
> Moreover, scnprintf() can be used instead of snprintf(), to save the
> check if the return value larger than the given size.
> 
> Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Tomer Tayar <ttayar@habana.ai>
> Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
> Signed-off-by: Oded Gabbay <ogabbay@kernel.org>

Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
