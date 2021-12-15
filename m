Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C1447644D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 22:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3037F10FA76;
	Wed, 15 Dec 2021 21:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D893A10FA71;
 Wed, 15 Dec 2021 21:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639602589; x=1671138589;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k0cpiTf2b3sof3q8ZCR+A4XSzZbGc/TK16t1qQbQikc=;
 b=A9jM4vKWTUyowrpMGaKBzBbg5t1PEerqmQFJESx56orsqdPOnFxDRDHm
 jCfo1OrCM5jmpxtaV9YHT9BpgzOQtzwOUftfxKOa5S4VGoLRwQ21WQpgF
 N5aPgFnPyXfnzTrMRb2wJqK7hPJ013VzfVfUQ9RFPJCB8ZD2knGxMceJ3
 piu85S/4ioNAI5UjXO9gGthdgPRPmjgZ4PSz5VWH7MWIvsRqv3fjf1H6U
 2wq9Gm3YlCX7y6N8naQCuBN8QJB78r3ynoXTwxoAUin5jsPr5AmuJgL4n
 dh3dQ0UeU3P2ZgZVW8Ti94+7134L1jpjGxcZvlq6+q9kHGTC5lHtcw5XZ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="220018099"
X-IronPort-AV: E=Sophos;i="5.88,209,1635231600"; d="scan'208";a="220018099"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 13:09:49 -0800
X-IronPort-AV: E=Sophos;i="5.88,209,1635231600"; d="scan'208";a="610885273"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2021 13:09:49 -0800
Date: Wed, 15 Dec 2021 13:09:49 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 6/7] drm/amdgpu: Ensure kunmap is called on error
Message-ID: <20211215210949.GW3538886@iweiny-DESK2.sc.intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
 <20211210232404.4098157-7-ira.weiny@intel.com>
 <5bbd3c48-1388-9469-8b6f-deed64406d7d@amd.com>
 <20211214033725.GR3538886@iweiny-DESK2.sc.intel.com>
 <c3b173ea-6509-ebbe-b5f9-eeb29f1ce57e@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3b173ea-6509-ebbe-b5f9-eeb29f1ce57e@amd.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 14, 2021 at 08:09:29AM +0100, Christian König wrote:
> Am 14.12.21 um 04:37 schrieb Ira Weiny:
> > On Mon, Dec 13, 2021 at 09:37:32PM +0100, Christian König wrote:
> > > Am 11.12.21 um 00:24 schrieb ira.weiny@intel.com:
> > > > From: Ira Weiny <ira.weiny@intel.com>
> > > > 
> > > > The default case leaves the buffer object mapped in error.
> > > > 
> > > > Add amdgpu_bo_kunmap() to that case to ensure the mapping is cleaned up.
> > > Mhm, good catch. But why do you want to do this in the first place?
> > I'm not sure I understand the question.
> > 
> > Any mapping of memory should be paired with an unmapping when no longer needed.
> > And this is supported by the call to amdgpu_bo_kunmap() in the other
> > non-default cases.
> > 
> > Do you believe the mapping is not needed?
> 
> No, the unmapping is not needed here. See the function amdgpu_bo_kmap(), it
> either creates the mapping or return the cached pointer.

Ah I missed that.  Thanks.

> 
> A call to amdgpu_bo_kunmap() is only done in a few places where we know that
> the created mapping most likely won't be needed any more. If that's not done
> the mapping is automatically destroyed when the BO is moved or freed up.
> 
> I mean good bug fix, but you seem to see this as some kind of prerequisite
> to some follow up work converting TTM to use kmap_local() which most likely
> won't work in the first place.

Sure.  I see now that it is more complicated than I thought but I never thought
of this as a strict prerequisite.  Just something I found while trying to
figure out how this works.

How much of a speed up is it to maintain the ttm_bo_map_kmap map type?  Could
this all be done with vmap and just remove the kmap stuff?

Ira

> 
> Regards,
> Christian.
> 
> > 
> > Ira
> > 
> > > Christian.
> > > 
> > > > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > > > 
> > > > ---
> > > > NOTE: It seems like this function could use a fair bit of refactoring
> > > > but this is the easiest way to fix the actual bug.
> > > > ---
> > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
> > > >    1 file changed, 1 insertion(+)
> > > > nice
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> > > > index 6f8de11a17f1..b3ffd0f6b35f 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
> > > > @@ -889,6 +889,7 @@ static int amdgpu_uvd_cs_msg(struct amdgpu_uvd_cs_ctx *ctx,
> > > >    		return 0;
> > > >    	default:
> > > > +		amdgpu_bo_kunmap(bo);
> > > >    		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
> > > >    	}
> 
