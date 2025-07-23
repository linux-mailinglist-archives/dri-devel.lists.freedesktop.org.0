Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C41B0F430
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 15:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CEA10E7D4;
	Wed, 23 Jul 2025 13:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xCw5ycBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC3510E7D4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 13:38:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B019B456EC;
 Wed, 23 Jul 2025 13:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E005C4CEE7;
 Wed, 23 Jul 2025 13:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1753277891;
 bh=pjrEu/ZYnLRzeKLNkYuVmzbdoItD0h6Ztyl55j9UJ88=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xCw5ycBAwUcSaJdYIWrBLul+jQrB7dwkGTn2u5FjIRpwVuwhXNLMC4x5c0z+JNam8
 i/uV1iyhSUR0o/r9E+RRUx3biiUHk2biae0Vb7GQlaZgtMle4zOhr97Q6nwZXzTmu4
 pgwMlVjU8DTkD7sFKA/vSawi/TNplZYWQK53hbb4=
Date: Wed, 23 Jul 2025 15:38:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nicusor Huhulea <nicusor.huhulea@siemens.com>
Cc: cip-dev@lists.cip-project.org, Imre Deak <imre.deak@intel.com>,
 stable@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 6.1.y-cip 2/5] [PARTIAL BACKPORT]drm: Add an HPD poll
 helper to reschedule the poll work
Message-ID: <2025072342-handpick-geriatric-ce9a@gregkh>
References: <20250723125427.59324-1-nicusor.huhulea@siemens.com>
 <20250723125427.59324-3-nicusor.huhulea@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250723125427.59324-3-nicusor.huhulea@siemens.com>
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

On Wed, Jul 23, 2025 at 03:54:24PM +0300, Nicusor Huhulea wrote:
> From: Imre Deak <imre.deak@intel.com>
> 
> Add a helper to reschedule drm_mode_config::output_poll_work after
> polling has been enabled for a connector (and needing a reschedule,
> since previously polling was disabled for all connectors and hence
> output_poll_work was not running).
> 
> This is needed by the next patch fixing HPD polling on i915.
> 
> CC: stable@vger.kernel.org # 6.4+
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Jouni Högander <jouni.hogander@intel.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20230822113015.41224-1-imre.deak@intel.com
> (cherry picked from commit fe2352fd64029918174de4b460dfe6df0c6911cd)
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Partial-Backport-by: Nicusor Huhulea <nicusor.huhulea@siemens.com>

What does "Partial-Backport-by:" mean?  I don't see that in the
documentation files as a valid tag to put in kernel commits :(

confused,

greg k-h
