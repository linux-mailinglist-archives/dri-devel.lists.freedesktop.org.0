Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72774ECE50
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 23:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3107A10E98C;
	Wed, 30 Mar 2022 21:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D7610E95F;
 Wed, 30 Mar 2022 21:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648674121; x=1680210121;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VKsl5l0X5qZnjhCGV/8i/8Hg2/JrMfYqoAv9nloXixY=;
 b=J8lIvZFufNEaC4AnVNGeTBf8394IOzTNPPmrRG6YB6Qi1Ms+O+H4k8Ya
 6ygv634UU4Lz02Z1/E98hS4CFeqKKRsSNQaxQTUKvsl+v7w8iu6hDzwfW
 eDRRTe8wqk7BjDYcEwgXeo+xM8imuEF30w1LnLsJ176ygoOmliYL+9oC7
 SrcTnUTuwmpYjrmlQpEuQRseAegS7ku5o4fg68FI6V66mM6h/bYV6HsPT
 U2gtlYxdy0YwlY/F9/tZ0Bs7EKwm9DKCzTInyFHFGGKlEb2txvdhZwxFl
 Rvt7jviMh7fTy1i1WLNE/UipYu1ZvGjYHq8IoD7e0qkSlVVUDbUUi119K g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284557741"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="284557741"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 14:02:00 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; d="scan'208";a="565817165"
Received: from nhanus-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.62.116])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 14:01:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 01/12] drm/edid: use struct edid * in drm_do_get_edid()
In-Reply-To: <87r16jbhdq.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1648578814.git.jani.nikula@intel.com>
 <380b903fb91b1e20a1a7af61db40b6c7c5617005.1648578814.git.jani.nikula@intel.com>
 <YkRViiFfSOJQnsoI@intel.com> <87r16jbhdq.fsf@intel.com>
Date: Thu, 31 Mar 2022 00:01:56 +0300
Message-ID: <874k3fb1dn.fsf@intel.com>
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

On Wed, 30 Mar 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> On Wed, 30 Mar 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.c=
om> wrote:
>> This one points to extension blocks too so using=20
>> struct edid doesn't seem entirely appropriate.
>
> So I've gone back and forth with this. I think I want to get rid of u8*
> no matter what, because it always requires casting. I've used void* here
> and there to allow mixed use, internally in drm_edid.c while
> transitioning, and in public interfaces due to usage all over the place.
>
> OTOH I don't much like arithmetics on void*. It's a gcc extension.
>
> struct edid * is useful for e.g. ->checksum and arithmetics. In many
> places I've named it struct edid *block to distinguish. We could have a
> struct edid_block too, which could have ->tag and ->checksum members,
> for example, but then it would require casting or a function for "safe"
> typecasting.
>
> I've also gone back and forth with the helpers for getting a pointer to
> a block. For usage like this, kind of need both const and non-const
> versions. And, with the plans I have for future, I'm not sure I want to
> promote any EDID parsing outside of drm_edid.c, so maybe they should be
> static.
>
> Undecided. C is a bit clunky here.

Hmm. I wonder how a flexible array member would pan out.

struct edid_extension {
	u8 tag;
        u8 revision;
        u8 data[EDID_LENGTH - 3];
        u8 checksum;
} __packed;

struct edid {
	/* existing stuff*/
        struct edid_extension extensions[];
} __packed;


BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
