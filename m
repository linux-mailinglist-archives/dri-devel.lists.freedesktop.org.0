Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 160A17E1B04
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 08:20:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF13910E26E;
	Mon,  6 Nov 2023 07:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A9810E26E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 07:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699255204; x=1730791204;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=W1bj9G4MjMbXCHih6EGkZypmYYrx6s+lCGl0yim11f0=;
 b=EV9RyEMBJvcJ2DbDj6Zw5eOINQy27eGJkzIotzPFbLRf07uqmYopZ54R
 1VSv4ly4+IgCf3OeBhwCONif8sgH5UM9J69VryfsB2U8yBSDBl6d3/J/U
 k2k1c9Y31vPpN3YClWkAgUHsH+s5ijrlGFsExwrXU7aIdVn4a0KlFLhUi
 PlfN7GnSEdvdB8uE8Z6AD0KXSZKv+fMvIZyf8x2oHOSVm2FiGAZdPhlCX
 Sv+kfQavXjZ27khD7qMz7bSjj9eIYC2SKkwOcwrVN3Sm7Au67F9T5YTLh
 JDrS9GVS+qAF/V2l4+Pa5QRr6nlz+9pK+j9/0VQSbRL2ffOG5cuAUCp/o g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="420336160"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="420336160"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 23:20:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762240043"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; d="scan'208";a="762240043"
Received: from unknown (HELO [10.217.160.78]) ([10.217.160.78])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2023 23:20:02 -0800
Message-ID: <e96207e2-e23a-427c-9176-23fb516b0f46@linux.intel.com>
Date: Mon, 6 Nov 2023 08:20:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Update MAX_ORDER use to be inclusive
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20231103153302.20642-1-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231103153302.20642-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 03.11.2023 16:33, Jeffrey Hugo wrote:
> MAX_ORDER was redefined so that valid allocations to the page allocator
> are in the range of 0..MAX_ORDER, inclusive in the commit
> 23baf831a32c ("mm, treewide: redefine MAX_ORDER sanely").
> 
> We are treating MAX_ORDER as an exclusive value, and thus could be
> requesting larger allocations.  Update our use to match the redefinition
> of MAX_ORDER.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> ---
>  drivers/accel/qaic/qaic_data.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index 8da81768f2ab..8998c28e566e 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -452,7 +452,7 @@ static int create_sgt(struct qaic_device *qdev, struct sg_table **sgt_out, u64 s
>  		 * later
>  		 */
>  		buf_extra = (PAGE_SIZE - size % PAGE_SIZE) % PAGE_SIZE;
> -		max_order = min(MAX_ORDER - 1, get_order(size));
> +		max_order = min(MAX_ORDER, get_order(size));
>  	} else {
>  		/* allocate a single page for book keeping */
>  		nr_pages = 1;

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
