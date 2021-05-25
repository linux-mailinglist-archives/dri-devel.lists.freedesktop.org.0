Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4A390772
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 19:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9A76EA8C;
	Tue, 25 May 2021 17:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586936EA8A;
 Tue, 25 May 2021 17:23:04 +0000 (UTC)
IronPort-SDR: GoD+jEOUYy61SrE+n5J6/NJ2q18FJNO5Xi2DZBZkop4GgFjpE/+ES8mGalezLs/NDGfSIYWXrY
 LmOTCNn5U8lg==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="223423077"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="223423077"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 10:23:03 -0700
IronPort-SDR: VVlbl1csEQA+j643Jem9REMHOHGdjKPNAQ+qEdoQ3JCMxsiIWbgxi8AQUnw5EnTqc8V1Xoi69x
 fyCr6BaZROdw==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="633104712"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 10:23:03 -0700
Date: Tue, 25 May 2021 10:15:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 39/97] drm/i915/guc: Increase size of CTB
 buffers
Message-ID: <20210525171556.GD14724@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-40-matthew.brost@intel.com>
 <c3c50a1e-c871-a424-8598-2da7eaffba05@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3c50a1e-c871-a424-8598-2da7eaffba05@linux.intel.com>
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 10:24:09AM +0100, Tvrtko Ursulin wrote:
> 
> On 06/05/2021 20:13, Matthew Brost wrote:
> > With the introduction of non-blocking CTBs more than one CTB can be in
> > flight at a time. Increasing the size of the CTBs should reduce how
> > often software hits the case where no space is available in the CTB
> > buffer.
> 
> I'd move this before the patch which adds the non-blocking send since that
> one claims congestion should be rare with properly sized buffers. So it
> makes sense to have them sized properly back before that one.
>

IMO patch ordering is a bit of bikeshed. All these CTBs changes required
for GuC submission (34-40, 54) will get posted its own series and get
merged together. None of the individual patches break anything or is any
of this code really used until GuC submission is turned on. I can move
this when I post these patches by themselves but I just don't really see
the point either way.

Matt
 
> Regards,
> 
> Tvrtko
> 
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 11 ++++++++---
> >   1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > index 77dfbc94dcc3..d6895d29ed2d 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -63,11 +63,16 @@ static inline struct drm_device *ct_to_drm(struct intel_guc_ct *ct)
> >    *      +--------+-----------------------------------------------+------+
> >    *
> >    * Size of each `CT Buffer`_ must be multiple of 4K.
> > - * As we don't expect too many messages, for now use minimum sizes.
> > + * We don't expect too many messages in flight at any time, unless we are
> > + * using the GuC submission. In that case each request requires a minimum
> > + * 16 bytes which gives us a maximum 256 queue'd requests. Hopefully this
> > + * enough space to avoid backpressure on the driver. We increase the size
> > + * of the receive buffer (relative to the send) to ensure a G2H response
> > + * CTB has a landing spot.
> >    */
> >   #define CTB_DESC_SIZE		ALIGN(sizeof(struct guc_ct_buffer_desc), SZ_2K)
> >   #define CTB_H2G_BUFFER_SIZE	(SZ_4K)
> > -#define CTB_G2H_BUFFER_SIZE	(SZ_4K)
> > +#define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
> >   #define MAX_US_STALL_CTB	1000000
> > @@ -753,7 +758,7 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
> >   	/* beware of buffer wrap case */
> >   	if (unlikely(available < 0))
> >   		available += size;
> > -	CT_DEBUG(ct, "available %d (%u:%u)\n", available, head, tail);
> > +	CT_DEBUG(ct, "available %d (%u:%u:%u)\n", available, head, tail, size);
> >   	GEM_BUG_ON(available < 0);
> >   	header = cmds[head];
> > 
