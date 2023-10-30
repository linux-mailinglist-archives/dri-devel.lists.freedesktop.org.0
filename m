Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9437DB3B5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 07:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C5510E20F;
	Mon, 30 Oct 2023 06:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140EA10E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 06:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698649009; x=1730185009;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4R0bw78ePjfdbCkBh/GEc997L05R9Y4a7R9w23auL3Q=;
 b=iAQpyCtrWeqIq5nAbmxWt/UDuUyyX4y61cgyLU05QiU/PYTWQ5L6rKSu
 oikbLMxsV0ftGREGmgewtlW9RF1hdl731Hkk9F5RE1gXTbA/KvFmkjTaq
 sWuylAmamz/aXkAnlzYcfQqYIXwOBRLy3pw39SQlJ3xUWT7N5wAX9iJBA
 Ehas1tAGrF10n2+APG8eryrVvepjyG7WuHj2jzdKqMRzHrZSHe6OxMazM
 qvDdtnXWHQuinziYkccle75IVJqRUvstHpsttLbJ7SWVe3W8gvsq/CHhX
 OGAwN9h21qSxoz+wa1dDBM3kOne0Hv9ZdPVINvCguoN0sTMZJ9ExPPZsW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="390879454"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; d="scan'208";a="390879454"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2023 23:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="789377566"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; d="scan'208";a="789377566"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.51.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2023 23:56:42 -0700
Date: Mon, 30 Oct 2023 07:56:40 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] accel/qaic: Support for 0 resize slice execution in BO
Message-ID: <ZT9TqJIZ07i9ZTmO@linux.intel.com>
References: <20231027164330.11978-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231027164330.11978-1-quic_jhugo@quicinc.com>
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
Cc: quic_pkanojiy@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_carlv@quicinc.com, ogabbay@kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 27, 2023 at 10:43:30AM -0600, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Add support to partially execute a slice which is resized to zero.
> Executing a zero size slice in a BO should mean that there is no DMA
> transfers involved but you should still configure doorbell and semaphores.
> 
> For example consider a BO of size 18K and it is sliced into 3 6K slices
> and user calls partial execute ioctl with resize as 10K.
> slice 0 - size is 6k and offset is 0, so resize of 10K will not cut short
>           this slice hence we send the entire slice for execution.
> slice 1 - size is 6k and offset is 6k, so resize of 10K will cut short this
>           slice and only the first 4k should be DMA along with configuring
>           doorbell and semaphores.
> slice 2 - size is 6k and offset is 12k, so resize of 10k will cut short
>           this slice and no DMA transfer would be involved but we should
>           would configure doorbell and semaphores.
> 
> This change begs to change the behavior of 0 resize. Currently, 0 resize
> partial execute ioctl behaves exactly like execute ioctl i.e. no resize.
> After this patch all the slice in BO should behave exactly like slice 2 in
> above example.
> 
> Refactor copy_partial_exec_reqs() to make it more readable and less
> complex.
> 
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
