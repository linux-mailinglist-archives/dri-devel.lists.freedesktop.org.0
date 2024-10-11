Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBC8999DD4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 09:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209D710EA6A;
	Fri, 11 Oct 2024 07:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfZ01zOH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F0810EA6A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 07:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728631512; x=1760167512;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ga19TDWAVXLp74B4e+M5voJ3hGpSU1u6zny4p1lqEbQ=;
 b=EfZ01zOHbiAzoO6wT08g4gQzWPuNacT3L7heHvVzQieogJ9E4ghKT3fQ
 JuTdiBWq3862EFECUSRxi2kARoqtnJXGZFTAxsj83QMEwRQv+XxhaG/xb
 Zmw5y8hyQn6ILljUzzuwOphdiB13nOXCtMC/zvLTZse2TBcLFKs63IBQq
 qDHVi3BuEpT6n0AahrWtmX0fuOFNNL9bgk05dH3Fd3EFV/0/DNAz1sm6f
 Zd8atru6YzEqE2lZrN58GXmkPrEpT04kc73p7YGFrCxLLkSPTWKVGGOo2
 BOwGZu4KI9hyWT53VimnlXswdAfGPIZA9DpwameYfVUpW3pssPj8kdD5K w==;
X-CSE-ConnectionGUID: SoHU8PvzT/aP4iEX23RR9Q==
X-CSE-MsgGUID: M7R5Qx0KR/ayj8PRTJoP9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28114255"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="28114255"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 00:25:12 -0700
X-CSE-ConnectionGUID: hIERh4JjQZeMd+2vbR2Rvg==
X-CSE-MsgGUID: qw4eVT0rR76EohZifz4RvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="77306120"
Received: from jwbates1-mobl.amr.corp.intel.com (HELO [10.245.100.202])
 ([10.245.100.202])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 00:25:11 -0700
Message-ID: <0587cd70-af62-41c9-acca-bbbab5b56659@linux.intel.com>
Date: Fri, 11 Oct 2024 09:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix the for loop used to walk SG table
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com
Cc: ogabbay@kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20241004193252.3888544-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241004193252.3888544-1-quic_jhugo@quicinc.com>
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 10/4/2024 9:32 PM, Jeffrey Hugo wrote:
> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> 
> Only for_each_sgtable_dma_sg() should be used to walk through a SG table
> to grab correct bus address and length pair after calling DMA MAP API on
> a SG table as DMA MAP APIs updates the SG table and for_each_sgtable_sg()
> walks through the original SG table.
> 
> Fixes: ff13be830333 ("accel/qaic: Add datapath")
> Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/qaic_control.c | 2 +-
>  drivers/accel/qaic/qaic_data.c    | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> index 9e8a8cbadf6b..d8bdab69f800 100644
> --- a/drivers/accel/qaic/qaic_control.c
> +++ b/drivers/accel/qaic/qaic_control.c
> @@ -496,7 +496,7 @@ static int encode_addr_size_pairs(struct dma_xfer *xfer, struct wrapper_list *wr
>  	nents = sgt->nents;
>  	nents_dma = nents;
>  	*size = QAIC_MANAGE_EXT_MSG_LENGTH - msg_hdr_len - sizeof(**out_trans);
> -	for_each_sgtable_sg(sgt, sg, i) {
> +	for_each_sgtable_dma_sg(sgt, sg, i) {
>  		*size -= sizeof(*asp);
>  		/* Save 1K for possible follow-up transactions. */
>  		if (*size < SZ_1K) {
> diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
> index e86e71c1cdd8..c20eb63750f5 100644
> --- a/drivers/accel/qaic/qaic_data.c
> +++ b/drivers/accel/qaic/qaic_data.c
> @@ -184,7 +184,7 @@ static int clone_range_of_sgt_for_slice(struct qaic_device *qdev, struct sg_tabl
>  	nents = 0;
>  
>  	size = size ? size : PAGE_SIZE;
> -	for (sg = sgt_in->sgl; sg; sg = sg_next(sg)) {
> +	for_each_sgtable_dma_sg(sgt_in, sg, j) {
>  		len = sg_dma_len(sg);
>  
>  		if (!len)
> @@ -221,7 +221,7 @@ static int clone_range_of_sgt_for_slice(struct qaic_device *qdev, struct sg_tabl
>  
>  	/* copy relevant sg node and fix page and length */
>  	sgn = sgf;
> -	for_each_sgtable_sg(sgt, sg, j) {
> +	for_each_sgtable_dma_sg(sgt, sg, j) {
>  		memcpy(sg, sgn, sizeof(*sg));
>  		if (sgn == sgf) {
>  			sg_dma_address(sg) += offf;
> @@ -301,7 +301,7 @@ static int encode_reqs(struct qaic_device *qdev, struct bo_slice *slice,
>  	 * fence.
>  	 */
>  	dev_addr = req->dev_addr;
> -	for_each_sgtable_sg(slice->sgt, sg, i) {
> +	for_each_sgtable_dma_sg(slice->sgt, sg, i) {
>  		slice->reqs[i].cmd = cmd;
>  		slice->reqs[i].src_addr = cpu_to_le64(slice->dir == DMA_TO_DEVICE ?
>  						      sg_dma_address(sg) : dev_addr);

