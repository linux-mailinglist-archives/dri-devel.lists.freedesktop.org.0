Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36B43907F8
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 19:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19C16EA95;
	Tue, 25 May 2021 17:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D7E6E416;
 Tue, 25 May 2021 17:39:49 +0000 (UTC)
IronPort-SDR: /UYyfgTU8YQoAn7GaDTNfrF1OHzHGt/++3JhF2zFHhn1/YD++XhprG4ey9ZsdErQtpgZRrsKf8
 mqhC/UPT4/kQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="199200846"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="199200846"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 10:39:44 -0700
IronPort-SDR: iQE+mLVNzb5/wnBa3Dj0tcM8oET3ezSJ7KbkBEug3m5nv1I7vZCe5TGnX8jKTsklHkDCU6DKyp
 E8GblPtKd7Cg==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="397438170"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 10:39:44 -0700
Date: Tue, 25 May 2021 10:32:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [RFC PATCH 35/97] drm/i915/guc: Improve error message for
 unsolicited CT response
Message-ID: <20210525173237.GA18984@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-36-matthew.brost@intel.com>
 <7916ebfd-ebbe-c1a9-11b1-30587ca7a009@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7916ebfd-ebbe-c1a9-11b1-30587ca7a009@intel.com>
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
Cc: tvrtko.ursulin@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 24, 2021 at 01:59:54PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 06.05.2021 21:13, Matthew Brost wrote:
> > Improve the error message when a unsolicited CT response is received by
> > printing fence that couldn't be found, the last fence, and all requests
> > with a response outstanding.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > index 217ab3ebd1af..a76603537fa8 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> > @@ -703,12 +703,16 @@ static int ct_handle_response(struct intel_guc_ct *ct, struct ct_incoming_msg *r
> >  		found = true;
> >  		break;
> >  	}
> > -	spin_unlock_irqrestore(&ct->requests.lock, flags);
> > -
> >  	if (!found) {
> >  		CT_ERROR(ct, "Unsolicited response (fence %u)\n", fence);
> > -		return -ENOKEY;
> > +		CT_ERROR(ct, "Could not find fence=%u, last_fence=%u\n", fence,
> > +			 ct->requests.last_fence);
> 
> nit: this new wording may suggest that it's our fault, but that's not
> necessary true
> 

I don't think is implies whos fault this is either way.

> > +		list_for_each_entry(req, &ct->requests.pending, link)
> > +			CT_ERROR(ct, "request %u awaits response\n",
> > +				 req->fence);
> 
> usually we don't send multiple requests that expects responses, so it's
> very likely that list with pending requests will be empty, and even if
> list is not empty, I'm not sure what is the relation between those
> pending requests to this unsolicited response, thus wondering how these
> extra errors could improve our debugging experience ?
> 

The more information when this occurs the better.

Matt

> > +		err = -ENOKEY;
> >  	}
> > +	spin_unlock_irqrestore(&ct->requests.lock, flags);
> >  
> >  	if (unlikely(err))
> >  		return err;
> > 
