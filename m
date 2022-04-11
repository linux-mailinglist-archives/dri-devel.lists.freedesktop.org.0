Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9CA4FB864
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D65210F9DB;
	Mon, 11 Apr 2022 09:52:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71E310F9B1;
 Mon, 11 Apr 2022 09:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670719; x=1681206719;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=GnKCpRluJ4MAcEqKJNoeviJ5OA/H0mHPpdohl4lhaes=;
 b=Of8NcIc/MmXILjj0Te6gzvcOaM1GRFUb6zTzRNbSpzYoRrMYA5AjFIDI
 mo8zIMkn92xRHeQfBz6zelEyet2RN824HjEbarXiMSFqfx6X1H0Nrijtw
 a92OYxyEvzK687hZXWAucLvt9yK60vAXw5mclruBCJ8qa7pxRUK3A5kks
 zemRdAC5ZuCM7Ainc1O8UDB2xhF+j0MCYrU9jKoB0PtX0YSrgY0iKrZTK
 4QXBBhThAsVtHLKC/0fPV015wSXK9dJ9w83ViF+p4djyW8at8NBxHutE3
 dGqA/qKNpiS3O4zuvsRZ/eWsFkFcGlWMbBc+cKLi2ID1xAHE8XEgFxp+x Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="261822838"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="261822838"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:51:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="525439177"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:51:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 00/12] drm/edid: low level EDID block read refactoring etc.
In-Reply-To: <Yk7csG+mdZ9LwA4+@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1649322799.git.jani.nikula@intel.com>
 <Yk7csG+mdZ9LwA4+@intel.com>
Date: Mon, 11 Apr 2022 12:51:54 +0300
Message-ID: <87fsmkhrr9.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Apr 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Apr 07, 2022 at 12:14:26PM +0300, Jani Nikula wrote:
>> Ever so slowly moving towards cleaner EDID reading.
>>=20
>> Jani Nikula (12):
>>   drm/edid: convert edid_is_zero() to edid_block_is_zero() for blocks
>>   drm/edid: have edid_block_check() detect blocks that are all zero
>>   drm/edid: refactor EDID block status printing
>>   drm/edid: add a helper to log dump an EDID block
>>   drm/edid: pass struct edid to connector_bad_edid()
>>   drm/edid: add typedef for block read function
>>   drm/edid: abstract an EDID block read helper
>>   drm/edid: use EDID block read helper in drm_do_get_edid()
>>   drm/edid: convert extension block read to EDID block read helper
>>   drm/edid: drop extra local var
>>   drm/edid: add single point of return to drm_do_get_edid()
>>   drm/edid: add EDID block count and size helpers
>
> Some of the stuff was a bit hard to follow, but I suppose that's mostly
> an indication of the messy state of the current code. Didn't spot
> anything obviously wrong at least.

I'm painfully aware. I'm just hoping the end result has more clarity. At
least highlights the warts in the logic that I tried to preserve...

> Series is
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Again, thanks a bunch!

BR,
Jani.


>
>>=20
>>  drivers/gpu/drm/drm_edid.c | 350 ++++++++++++++++++++++++-------------
>>  1 file changed, 225 insertions(+), 125 deletions(-)
>>=20
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
