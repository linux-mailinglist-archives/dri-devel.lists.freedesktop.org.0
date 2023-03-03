Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF7C6A9ACD
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 16:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755E710E6BE;
	Fri,  3 Mar 2023 15:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE28210E6BE;
 Fri,  3 Mar 2023 15:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677857957; x=1709393957;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PsLUt0hhdShhtqMCwP0MEZHkvWgjYOP7Rv4o2wUr3Dw=;
 b=CyyWU1r+LlqhNxKEekjbL6EM7dGmMucH7uKULqHrDuQ3GuSdcA4HhiPB
 SUQ2O4IxlbMnmIvvyFagFFEUreKUPHyqVtsbQFmsZckb0BMeFyOEM5LHy
 iswjgvX4WBK/xkWKMocqIHuzA8GS3Z/fQqf1oEZgvamnRO9Yyj9sIovIe
 +JS//rErl6kSsxb7gBPXbhTDCv6QugD0AtLIDIhdNHojl2eAwt77ktCg1
 T8GIGucc69t9C5hpXlYBAXnGYKeZaK9A1VQbS+MzPQgBTA4mXZBUtqGpJ
 /2RowhY/VhcrgnbuSfJRGK9K6/PT36q0oKV5lfs2hY2dl7xw3cxXKsSvp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="332552244"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="332552244"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 07:39:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="785294950"
X-IronPort-AV: E=Sophos;i="5.98,231,1673942400"; d="scan'208";a="785294950"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 07:39:14 -0800
Date: Fri, 3 Mar 2023 16:39:13 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>
Subject: Re: [PATCH] Change the meaning of the fields in the ttm_place
 structure from pfn to bytes
Message-ID: <20230303153913.GH3963532@linux.intel.com>
References: <20230303071659.1213074-1-Amaranath.Somalapuram@amd.com>
 <da7e9be8-4a80-7166-d6f8-20f3acf8bf9c@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da7e9be8-4a80-7166-d6f8-20f3acf8bf9c@mailbox.org>
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
Cc: shashank.sharma@amd.com, arvind.yadav@amd.com,
 arunpravin.paneerselvam@amd.com, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 03, 2023 at 03:55:56PM +0100, Michel Dänzer wrote:
> On 3/3/23 08:16, Somalapuram Amaranath wrote:
> > Change the ttm_place structure member fpfn, lpfn, mem_type to
> > res_start, res_end, res_type.
> > Change the unsigned to u64.
> > Fix the dependence in all the DRM drivers and
> > clean up PAGE_SHIFT operation.
> > 
> > Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> > 
> > [...]
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> > index 44367f03316f..5b5104e724e3 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> > @@ -131,11 +131,12 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
> >  		goto err_free;
> >  	}
> >  
> > -	if (place->lpfn) {
> > +	if (place->res_end) {
> >  		spin_lock(&mgr->lock);
> >  		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
> > -						num_pages, tbo->page_alignment,
> > -						0, place->fpfn, place->lpfn,
> > +						num_pages, tbo->page_alignment,	0,
> > +						place->res_start << PAGE_SHIFT,
> > +						place->res_end << PAGE_SHIFT,
> >  						DRM_MM_INSERT_BEST);
> 
> This should be >> or no shift instead of <<, shouldn't it? Multiplying a value in bytes by the page size doesn't make sense.
> 
> 
> I didn't check the rest of the patch in detail, but it's easy introduce subtle regressions with this kind of change. It'll require a lot of review & testing scrutiny.

Also good justification. The changelog says only what is done, nothing about why the change is needed.

Regards
Stanislaw
