Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A10FE3587AB
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 16:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CB06EB26;
	Thu,  8 Apr 2021 14:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DEA6EB20;
 Thu,  8 Apr 2021 14:58:19 +0000 (UTC)
IronPort-SDR: kh4TWBRWSeQGJsIQONTX/MtJvAPd1wt1bJ1/xH2VWCCja0dxqmY42K8kiXtSFidmJ/dTyimLnB
 YmBX1hkbhfew==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="213966839"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="213966839"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 07:58:19 -0700
IronPort-SDR: 6pSZNutxS8MTmDert/d2Z3yCWLWiZRro2ylFwLZbHrIw7M5PQvnXlzkM46CfpuhIEEdGk4GDot
 AgCY6TGlRC7Q==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="422281819"
Received: from akervine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.34.131])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 07:58:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: Call for an EDID parsing library
In-Reply-To: <20210408171311.61f433bd@eldfell>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210407114404.13b41822@eldfell>
 <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl> <87mtuajshc.fsf@intel.com>
 <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl> <87r1jkj37y.fsf@intel.com>
 <20210408171311.61f433bd@eldfell>
Date: Thu, 08 Apr 2021 17:58:13 +0300
Message-ID: <87o8eoj01m.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
 xorg-devel@lists.x.org, dri-devel@lists.freedesktop.org,
 wayland-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 08 Apr 2021, Pekka Paalanen <ppaalanen@gmail.com> wrote:
> On Thu, 08 Apr 2021 16:49:37 +0300
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
>> Anyway, this is only tangentially related to the library. I just think
>> we need to take DisplayID better into account also in the *users* of the
>> library, as they shouldn't really even look at the EDID if the plain
>> DisplayID is there, per E-DDC 1.3 section 3.1.
>
> That makes me wonder what the kernel DRM uAPI for getting a DisplayID
> block into userspace would be. A new read-only KMS connector property?

It's certainly a model everyone's used to working with. Is it worth
coming up with something new when you anyway have to deal with the
existing edid property for years to come?

> Which means userspace (e.g. Weston) needs to know to read the new
> property. If it does that, then it already knows that it should favour
> DisplayID over EDID, and there is little the library could do to help
> with that.

Agreed.

One of the problems for this uABI is that technically you're not
supposed to read the EDID if the DisplayID is available. But the kernel
needs to read both to expose both to userspace. I don't really see a way
around that.

The spec allows for leaving out EDID at 0x50 completely, which may
eventually require updating kernel and userspace to be DisplayID aware.

> Unless you think the library should be making DRM ioctls, which doesn't
> sound good to me.

Agreed, keep it simple.

I'd say the library should probably stick to parsing an in-memory blob
or fd passed to it, and focus on providing parsed information that's
independent of the underlying data structure, whether it's DisplayID or
EDID. Perhaps that should be the takeaway; try to minimize parsed data
where the consumer needs to know whether it originated from DisplayID or
EDID?


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
