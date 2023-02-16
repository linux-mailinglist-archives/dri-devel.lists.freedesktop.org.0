Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A965C699248
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 056E610ED2C;
	Thu, 16 Feb 2023 10:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCD010ED2A
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 10:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676544834; x=1708080834;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/bAnhhdpInnuUBn/kFhqVORtMwuHZxWDJV5LNw3b3Ts=;
 b=jCBFeg36sl6NsDS/TorUh0RuuJoIbr1EJqeZtmgu0aykppQy0dJqL1BK
 RB37DBQKp/Fs3nGcHR5iYlZ1rMQLREUyn/WJATObEVuHMwfkO6U3XwsoK
 t/9A/EyBmPsV3X6l99REEbtThjD6dO8Dt7r5ZtmAN1tppR2tyQv6ZWkZr
 qDWnb4DXnWUd8RpFDLLobbWSw8V5hvMr7C5pWLqNOlchz9UE3eRtM2fri
 f05KjIMOul1oEJKeo6cm2m+EwoAzzd2sAVs5Fa28IKsEYvAL2/p126rWQ
 QrfOFzdZeoh/F0cUP+Hzk4fgQfxgPuBNE5/PMM5EpjZW45VJFaRp9Kf97 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="396329428"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="396329428"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:53:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="844105887"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="844105887"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:53:52 -0800
Date: Thu, 16 Feb 2023 11:53:50 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [PATCH 01/27] habanalabs/gaudi2: increase user interrupt grace
 time
Message-ID: <20230216105350.GC2849548@linux.intel.com>
References: <20230212204454.2938561-1-ogabbay@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212204454.2938561-1-ogabbay@kernel.org>
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
Cc: Ofir Bitton <obitton@habana.ai>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 12, 2023 at 10:44:28PM +0200, Oded Gabbay wrote:
> @@ -3178,11 +3181,12 @@ static int ts_buff_get_kernel_ts_record(struct hl_mmap_mem_buf *buf,
>  
>  			/* irq handling in the middle give it time to finish */
>  			spin_unlock_irqrestore(wait_list_lock, flags);
> -			usleep_range(1, 10);
> +			usleep_range(100, 1000);
>  			if (++iter_counter == MAX_TS_ITER_NUM) {
>  				dev_err(buf->mmg->dev,
> -					"handling registration interrupt took too long!!\n");
> -				return -EINVAL;
> +					"Timestamp offest processing reached timeout of %lld ms\n",

Typo in offest, you can use './scripts/checkpatch.pl --codespell'
to coughs some of those.

Regards
Stanislaw

