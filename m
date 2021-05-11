Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A59C37ADCA
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 20:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745C76EAAB;
	Tue, 11 May 2021 18:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870C16EAAA;
 Tue, 11 May 2021 18:06:46 +0000 (UTC)
IronPort-SDR: ZGbrVvLthhDa4uy8NqJ19hB/Qr8krGzcKIIYQuxhJkoG+Nc+eQH9wZ3AOS+Pyvr0PtO6vhAlBB
 LmcbLBNcbJUg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179104431"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="179104431"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 11:06:43 -0700
IronPort-SDR: SyTTqJmGI3VUXhozlyOBHEtmtGIR7DqA9oL2VYF/sb5P882vbL3BjrxCwHFpdTQ/9Em4Prwiee
 7IPxjpUJDyWA==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="537128673"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 11:06:43 -0700
Date: Tue, 11 May 2021 10:59:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 20/97] drm/i915/guc: Introduce unified HXG messages
Message-ID: <20210511175923.GA6986@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-21-matthew.brost@intel.com>
 <YJqf1uKIyeHvSf+f@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YJqf1uKIyeHvSf+f@phenom.ffwll.local>
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

On Tue, May 11, 2021 at 05:16:38PM +0200, Daniel Vetter wrote:
> On Thu, May 06, 2021 at 12:13:34PM -0700, Matthew Brost wrote:
> > From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > 
> > New GuC firmware will unify format of MMIO and CTB H2G messages.
> > Introduce their definitions now to allow gradual transition of
> > our code to match new changes.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 226 ++++++++++++++++++
> >  1 file changed, 226 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> > index 775e21f3058c..1c264819aa03 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
> > @@ -6,6 +6,232 @@
> >  #ifndef _ABI_GUC_MESSAGES_ABI_H
> >  #define _ABI_GUC_MESSAGES_ABI_H
> >  
> > +/**
> > + * DOC: HXG Message
> 
> These aren't useful if we don't pull them in somewhere in the
> Documentation/gpu hierarchy. General comment, and also please check that
> it all renders correctly still.
>

Sure. Let me figure this out before my next rev.
 
> btw if you respin a patch not originally by you we generally add a (v1) to
> the original s-o-b line (or whever the version split was) and explain in
> the usual changelog in the commit message what was changed.
> 

Still new to this process. Will do.

Matt

> This holds for the entire series ofc.
> -Daniel
> 
> > + *
> > + * All messages exchanged with GuC are defined using 32 bit dwords.
> > + * First dword is treated as a message header. Remaining dwords are optional.
> > + *
> > + * .. _HXG Message:
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  |   |       |                                                              |
> > + *  | 0 |    31 | **ORIGIN** - originator of the message                       |
> > + *  |   |       |   - _`GUC_HXG_ORIGIN_HOST` = 0                               |
> > + *  |   |       |   - _`GUC_HXG_ORIGIN_GUC` = 1                                |
> > + *  |   |       |                                                              |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | **TYPE** - message type                                      |
> > + *  |   |       |   - _`GUC_HXG_TYPE_REQUEST` = 0                              |
> > + *  |   |       |   - _`GUC_HXG_TYPE_EVENT` = 1                                |
> > + *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_BUSY` = 3                     |
> > + *  |   |       |   - _`GUC_HXG_TYPE_NO_RESPONSE_RETRY` = 5                    |
> > + *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_FAILURE` = 6                     |
> > + *  |   |       |   - _`GUC_HXG_TYPE_RESPONSE_SUCCESS` = 7                     |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  27:0 | **AUX** - auxiliary data (depends TYPE)                      |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | 1 |  31:0 | optional payload (depends on TYPE)                           |
> > + *  +---+-------+                                                              |
> > + *  |...|       |                                                              |
> > + *  +---+-------+                                                              |
> > + *  | n |  31:0 |                                                              |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +
> > +#define GUC_HXG_MSG_MIN_LEN			1u
> > +#define GUC_HXG_MSG_0_ORIGIN			(0x1 << 31)
> > +#define   GUC_HXG_ORIGIN_HOST			0u
> > +#define   GUC_HXG_ORIGIN_GUC			1u
> > +#define GUC_HXG_MSG_0_TYPE			(0x7 << 28)
> > +#define   GUC_HXG_TYPE_REQUEST			0u
> > +#define   GUC_HXG_TYPE_EVENT			1u
> > +#define   GUC_HXG_TYPE_NO_RESPONSE_BUSY		3u
> > +#define   GUC_HXG_TYPE_NO_RESPONSE_RETRY	5u
> > +#define   GUC_HXG_TYPE_RESPONSE_FAILURE		6u
> > +#define   GUC_HXG_TYPE_RESPONSE_SUCCESS		7u
> > +#define GUC_HXG_MSG_0_AUX			(0xfffffff << 0)
> > +
> > +/**
> > + * DOC: HXG Request
> > + *
> > + * The `HXG Request`_ message should be used to initiate synchronous activity
> > + * for which confirmation or return data is expected.
> > + *
> > + * The recipient of this message shall use `HXG Response`_, `HXG Failure`_
> > + * or `HXG Retry`_ message as a definite reply, and may use `HXG Busy`_
> > + * message as a intermediate reply.
> > + *
> > + * Format of @DATA0 and all @DATAn fields depends on the @ACTION code.
> > + *
> > + * _HXG Request:
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN                                                       |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 27:16 | **DATA0** - request data (depends on ACTION)                 |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:0 | **ACTION** - requested action code                           |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | 1 |  31:0 | **DATA1** - optional data (depends on ACTION)                |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |...|       |                                                              |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | n |  31:0 | **DATAn** - optional data (depends on ACTION)                |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +
> > +#define GUC_HXG_REQUEST_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> > +#define GUC_HXG_REQUEST_MSG_0_DATA0		(0xfff << 16)
> > +#define GUC_HXG_REQUEST_MSG_0_ACTION		(0xffff << 0)
> > +#define GUC_HXG_REQUEST_MSG_n_DATAn		(0xffffffff << 0)
> > +
> > +/**
> > + * DOC: HXG Event
> > + *
> > + * The `HXG Event`_ message should be used to initiate asynchronous activity
> > + * that does not involves immediate confirmation nor data.
> > + *
> > + * Format of @DATA0 and all @DATAn fields depends on the @ACTION code.
> > + *
> > + * .. _HXG Event:
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN                                                       |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_EVENT_                                   |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 27:16 | **DATA0** - event data (depends on ACTION)                   |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:0 | **ACTION** - event action code                               |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | 1 |  31:0 | **DATA1** - optional event data (depends on ACTION)          |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |...|       |                                                              |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | n |  31:0 | **DATAn** - optional event  data (depends on ACTION)         |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +
> > +#define GUC_HXG_EVENT_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> > +#define GUC_HXG_EVENT_MSG_0_DATA0		(0xfff << 16)
> > +#define GUC_HXG_EVENT_MSG_0_ACTION		(0xffff << 0)
> > +#define GUC_HXG_EVENT_MSG_n_DATAn		(0xffffffff << 0)
> > +
> > +/**
> > + * DOC: HXG Busy
> > + *
> > + * The `HXG Busy`_ message may be used to acknowledge reception of the `HXG Request`_
> > + * message if the recipient expects that it processing will be longer than default
> > + * timeout.
> > + *
> > + * The @COUNTER field may be used as a progress indicator.
> > + *
> > + * .. _HXG Busy:
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN                                                       |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_NO_RESPONSE_BUSY_                        |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  27:0 | **COUNTER** - progress indicator                             |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +
> > +#define GUC_HXG_BUSY_MSG_LEN			GUC_HXG_MSG_MIN_LEN
> > +#define GUC_HXG_BUSY_MSG_0_COUNTER		GUC_HXG_MSG_0_AUX
> > +
> > +/**
> > + * DOC: HXG Retry
> > + *
> > + * The `HXG Retry`_ message should be used by recipient to indicate that the
> > + * `HXG Request`_ message was dropped and it should be resent again.
> > + *
> > + * The @REASON field may be used to provide additional information.
> > + *
> > + * .. _HXG Retry:
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN                                                       |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_NO_RESPONSE_RETRY_                       |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  27:0 | **REASON** - reason for retry                                |
> > + *  |   |       |  - _`GUC_HXG_RETRY_REASON_UNSPECIFIED` = 0                   |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +
> > +#define GUC_HXG_RETRY_MSG_LEN			GUC_HXG_MSG_MIN_LEN
> > +#define GUC_HXG_RETRY_MSG_0_REASON		GUC_HXG_MSG_0_AUX
> > +#define   GUC_HXG_RETRY_REASON_UNSPECIFIED	0u
> > +
> > +/**
> > + * DOC: HXG Failure
> > + *
> > + * The `HXG Failure`_ message shall be used as a reply to the `HXG Request`_
> > + * message that could not be processed due to an error.
> > + *
> > + * .. _HXG Failure:
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN                                                       |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_FAILURE_                        |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 27:16 | **HINT** - additional error hint                             |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  15:0 | **ERROR** - error/result code                                |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +
> > +#define GUC_HXG_FAILURE_MSG_LEN			GUC_HXG_MSG_MIN_LEN
> > +#define GUC_HXG_FAILURE_MSG_0_HINT		(0xfff << 16)
> > +#define GUC_HXG_FAILURE_MSG_0_ERROR		(0xffff << 0)
> > +
> > +/**
> > + * DOC: HXG Response
> > + *
> > + * The `HXG Response`_ message SHALL be used as a reply to the `HXG Request`_
> > + * message that was successfully processed without an error.
> > + *
> > + * .. _HXG Response:
> > + *
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |   | Bits  | Description                                                  |
> > + *  +===+=======+==============================================================+
> > + *  | 0 |    31 | ORIGIN                                                       |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> > + *  |   +-------+--------------------------------------------------------------+
> > + *  |   |  27:0 | **DATA0** - data (depends on ACTION from `HXG Request`_)     |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | 1 |  31:0 | **DATA1** - data (depends on ACTION from `HXG Request`_)     |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  |...|       |                                                              |
> > + *  +---+-------+--------------------------------------------------------------+
> > + *  | n |  31:0 | **DATAn** - data (depends on ACTION from `HXG Request`_)     |
> > + *  +---+-------+--------------------------------------------------------------+
> > + */
> > +
> > +#define GUC_HXG_RESPONSE_MSG_MIN_LEN		GUC_HXG_MSG_MIN_LEN
> > +#define GUC_HXG_RESPONSE_MSG_0_DATA0		GUC_HXG_MSG_0_AUX
> > +#define GUC_HXG_RESPONSE_MSG_n_DATAn		(0xffffffff << 0)
> > +
> > +/* deprecated */
> >  #define INTEL_GUC_MSG_TYPE_SHIFT	28
> >  #define INTEL_GUC_MSG_TYPE_MASK		(0xF << INTEL_GUC_MSG_TYPE_SHIFT)
> >  #define INTEL_GUC_MSG_DATA_SHIFT	16
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
