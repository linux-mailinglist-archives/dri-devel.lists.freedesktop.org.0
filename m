Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8BC4707E0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 18:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2CB10E48D;
	Fri, 10 Dec 2021 17:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2703C10E54E;
 Fri, 10 Dec 2021 17:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639158925; x=1670694925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=yGQ8dD52UewsyCaU8H+F3rrt+TRzzvYwcwOBm160nnI=;
 b=jWTG0wKNGQz7lw2mINScB0JMfVfezamGwkxlsAkXsEfnBMFMHQrHXk/Q
 5/98iGiziiAQFUSGgVdDFoyrePg2N1xkt27FflpN4XJmM8GidBgufVWWI
 rKJ1+b/pShhnUaQwyV+C9Y61g0E8p3+JzSgRbUHMHg6E4hDOi8zPSYFl2
 bxcCK79tqZa7y9TNssoi+2isU2C2+9ux1400N9huG19UfUi7/QSefYP/V
 Tgozidg4mpvgXs5PY+Xz0uGxDAd7QHTxs9cVDwE62Z0vUCGVUfuXWJENL
 /q/vwIko7KvYXhLSOqd2JSjWHc+kwKY8MbJG8diG1Ikd3eKIgfPcFhz1K Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10194"; a="301787907"
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="301787907"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 09:55:24 -0800
X-IronPort-AV: E=Sophos;i="5.88,196,1635231600"; d="scan'208";a="463751625"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2021 09:55:23 -0800
Date: Fri, 10 Dec 2021 09:50:00 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Use correct context lock when
 callig clr_context_registered
Message-ID: <20211210175000.GA35534@jons-linux-dev-box>
References: <20211209184814.21125-1-matthew.brost@intel.com>
 <d1fb9875-4af7-301e-cd83-9aeb7e8a5b52@intel.com>
 <439fb357-cdda-2996-bb63-eaf41a7fe4d1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <439fb357-cdda-2996-bb63-eaf41a7fe4d1@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 10, 2021 at 08:41:22AM +0000, Tvrtko Ursulin wrote:
> 
> On 09/12/2021 19:14, Daniele Ceraolo Spurio wrote:
> > 
> > 
> > On 12/9/2021 10:48 AM, Matthew Brost wrote:
> > > s/ce/cn/ when grabbing guc_state.lock before calling
> > > clr_context_registered.
> > > 
> > > Fixes: 0f7976506de61 ("drm/i915/guc: Rework and simplify locking")
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Cc: <stable@vger.kernel.org>
> 
> I think Cc: stable is not needed here:
> 
> $ git tag --contains 0f7976506de61
> drm-intel-fixes-2021-11-18
> drm-intel-gt-next-2021-10-08
> drm-intel-gt-next-2021-10-21
> drm-intel-gt-next-2021-11-22
> drm-intel-next-2021-10-15
> drm-intel-next-fixes-2021-11-09
> v5.16-rc1
> v5.16-rc2
> v5.16-rc3
> v5.16-rc4
> 
> So still can hit 5.16 via fixes. Rodrigo, did I get this right and you will
> be able to pick it up next week or so?
> 

Will remove.

> > Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > 
> > I'm assuming we didn't see any splat from the lockdep assert in
> > clr_context_registered in our CI runs because we never hit this case as
> > it requires 64k+ contexts. Maybe we can add a selftest to purposely
> > exercise this path? Not a blocker for merging this fix.
> 
> Was the bug found by inspection or reported?
>

Internal testing.
 
> Given the buggy function is called steal_guc_id, so if the implication is
> there is no testing for guc id stealing, then it indeed please add some
> coverage ASAP.
>

Will do. I'll aim to get something out next week.

Matt
 
> Regards,
> 
> Tvrtko
> 
> > 
> > Daniele
> > 
> > > ---
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index 1f9d4fde421f..9b7b4f4e0d91 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -1937,9 +1937,9 @@ static int steal_guc_id(struct intel_guc *guc,
> > > struct intel_context *ce)
> > >           list_del_init(&cn->guc_id.link);
> > >           ce->guc_id = cn->guc_id;
> > > -        spin_lock(&ce->guc_state.lock);
> > > +        spin_lock(&cn->guc_state.lock);
> > >           clr_context_registered(cn);
> > > -        spin_unlock(&ce->guc_state.lock);
> > > +        spin_unlock(&cn->guc_state.lock);
> > >           set_context_guc_id_invalid(cn);
> > 
