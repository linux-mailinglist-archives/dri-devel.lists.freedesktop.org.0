Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D61F6A6CE7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 14:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A53BC10E08C;
	Wed,  1 Mar 2023 13:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB44210E0D7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 13:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677676702; x=1709212702;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Ke7xkpEtOPznw9maWZ0BAlQ7C1fN4MKAqZcJSS5oTSU=;
 b=A3j8H9PHJoWBwL9Udau9+wBaiK6IF2pJZSv5RPC5npFup4cPrcsRCoe5
 AlSoPqXE1JHKjJpHDrC8BQCjSv5THIkz5Nu+Ni28GJK0PNRnjsc3O6r3F
 HpRv+tbGyzNlWwpZH2nxZUEl4jGOSWdBpzgWDnQcQzjrmo6FsYCv1tde0
 k/8Ed+JPJQk4z32kP8Y753EiGbW4Zs+K6FTbfg6kbz7VFjA07k9Wwn692
 WFbKgs44ucFAQhbjqLWaKPC3CjEU3yOXY7r+4svR43J724/ncie0IPCO7
 4HXL9UkWoR3Rbmy00c0vV4UB+ZL5UGcYEOZKcLtHqHBiMQuzOcjRFVlcN w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="331886141"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="331886141"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:18:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="704842218"
X-IronPort-AV: E=Sophos;i="5.98,224,1673942400"; d="scan'208";a="704842218"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 05:18:18 -0800
Date: Wed, 1 Mar 2023 14:18:16 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v2 4/8] accel/qaic: Add control path
Message-ID: <20230301131816.GC3815307@linux.intel.com>
References: <1675698105-19025-1-git-send-email-quic_jhugo@quicinc.com>
 <1675698105-19025-5-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675698105-19025-5-git-send-email-quic_jhugo@quicinc.com>
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

On Mon, Feb 06, 2023 at 08:41:41AM -0700, Jeffrey Hugo wrote:
> +	 * It turns out several of the iommu drivers don't combine adjacent
> +	 * regions, which is really what we expect based on the description of
> +	 * dma_map_sgtable(), so lets see if that can be done.  It makes our message
> +	 * more efficent.
> +	 */

Interesting ...

> +	last = sgt->sgl;
> +	nents_dma = nents;
> +	size = QAIC_MANAGE_EXT_MSG_LENGTH - msg_hdr_len - sizeof(*out_trans);
> +	for_each_sgtable_sg(sgt, sg, i) {
> +		if (sg_dma_address(last) + sg_dma_len(last) !=
> +		    sg_dma_address(sg)) {
> +			size -= sizeof(*asp);
> +			/* Save 1K for possible follow-up transactions. */
> +			if (size < SZ_1K) {
> +				nents_dma = i;
> +				break;
> +			}
> +		}
> +		last = sg;
> +	}

I would say there is reason why iommu do not combine or there is problem in iommu driver.
If there is reason for not-combining this code is wrong.
If problem is in iommu driver why not fixup iommu ?

And why not create sg list that don't have adjacent entries in the first place ?

Regards
Stanislaw
