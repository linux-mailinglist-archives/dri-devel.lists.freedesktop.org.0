Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D960358535
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 15:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 743316EA93;
	Thu,  8 Apr 2021 13:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51206EA93;
 Thu,  8 Apr 2021 13:49:42 +0000 (UTC)
IronPort-SDR: O2na41PMLQERxEO3lZti0TWis7Dq+pvKA+hBMb5PpAMbQgXfmBdai0c4aEF+xcrmdUm4J5lP00
 JJgbSxMTqE+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="173019513"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="173019513"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 06:49:42 -0700
IronPort-SDR: fUibmGKxzyzFqlQNTm9BdVVKyP1BK/engqrOtAIhz/X4VnCNEQM59xRJI7tZ/+WYFpfb4XIQ2M
 ZJE2v0wTROpQ==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="422253777"
Received: from akervine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.34.131])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 06:49:39 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 xorg-devel@lists.x.org, linux-media@vger.kernel.org
Subject: Re: Call for an EDID parsing library
In-Reply-To: <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210407114404.13b41822@eldfell>
 <7d8dc3ea-a935-5145-482c-42ea43dfd782@xs4all.nl> <87mtuajshc.fsf@intel.com>
 <33467672-b66a-7658-de04-7bc37153613f@xs4all.nl>
Date: Thu, 08 Apr 2021 16:49:37 +0300
Message-ID: <87r1jkj37y.fsf@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Apr 2021, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> On 07/04/2021 12:31, Jani Nikula wrote:
>> On Wed, 07 Apr 2021, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>>> It is the most complete EDID parser I know based on the various standards.
>> 
>> Does it support pure DisplayID in addition to DisplayID blocks embedded
>> to EDID extension blocks? I think we'll be needing that sometime in the
>> near future. (We don't yet support that in the kernel either.)
>
> It doesn't, but that shouldn't be too hard to implement.
>
> Do you have examples of that? If I had some, then I could implement support
> for it in edid-decode.

Alas, I don't. We don't come across them naturally, because the kernel
does not follow VESA E-DDC 1.3 to read 0x52 address to read the plain
DisplayID. I guess it's also common to add DisplayID 2.0 data blocks in
EDID extensions (and I see that edid-decode handles them), though this
is not described in DisplayID 2.0 spec the way it is in older DisplayID
specs.

The differences aren't that big, really. Slightly different constraints
on the block size when they're not embedded in EDID, as well as
different mandatory blocks.

Anyway, this is only tangentially related to the library. I just think
we need to take DisplayID better into account also in the *users* of the
library, as they shouldn't really even look at the EDID if the plain
DisplayID is there, per E-DDC 1.3 section 3.1.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
