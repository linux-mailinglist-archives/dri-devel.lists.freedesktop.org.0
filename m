Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1917853358
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 15:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 348A410E743;
	Tue, 13 Feb 2024 14:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITWVV9q1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5E910E743;
 Tue, 13 Feb 2024 14:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707835225; x=1739371225;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=THfw4I0Qphi3SKfp8HbqGt3bURhu5IPRo803/A/IIOw=;
 b=ITWVV9q1lz/d8JcBzF7QAYrgdfHFymTRjiEwTYc899644jbPJCzt+RWk
 BTlCxzQzx7N3vZRvajgxvhyZpqr5fnnsxZaz7iceNP8xrEYcYxstSx8VJ
 QajtJ+QpCNstOrMWllgb3Z7gIB0jQBxxTZOp4dH96ecG1SEj2MeL3o2MV
 QMIJF8FP2BsdOp/xpzVaX5GSGATPxHu6XjyHjvDTEaERLPUO01OUg+h1S
 i7bCFWh0CTSAOMV8DtyI6fJTGISHmPF2Osq/fW00W5/mG0vIy4X9c7FUs
 /c/Ll7pzpMtjS7Stzh7EnTltRW7E1D6AsK/GikCmK59uCySRxtNsgd467 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="396277775"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="396277775"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 06:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; d="scan'208";a="33975269"
Received: from snasibli-mobl2.ccr.corp.intel.com (HELO localhost)
 ([10.252.44.50])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 06:40:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Luca
 Coelho <luciano.coelho@intel.com>
Subject: Re: Re: [PATCH drm-misc-next] drm/xe: Fix a missing argument to
 drm_err_printer
In-Reply-To: <yjeqfuxc3az2j5bbvt7g5wtjmulcuxhill2n2hspjsmiokxfnb@pdd27bmfvd2m>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240212103833.138263-1-thomas.hellstrom@linux.intel.com>
 <87bk8m9coe.fsf@intel.com>
 <yjeqfuxc3az2j5bbvt7g5wtjmulcuxhill2n2hspjsmiokxfnb@pdd27bmfvd2m>
Date: Tue, 13 Feb 2024 16:40:19 +0200
Message-ID: <87a5o48m24.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> On Mon, Feb 12, 2024 at 12:53:05PM +0200, Jani Nikula wrote:
>> On Mon, 12 Feb 2024, Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel=
.com> wrote:
>> > The indicated commit below added a device argument to the
>> > function, but there was a call in the xe driver that was
>> > not properly changed.
>>=20
>> Aww, crap. Looks like my drm-misc-next configs don't have xe enabled.
>
> FTR, there's defconfigs in the drm-rerere repo that are fairly well maint=
ained.

None of them have CONFIG_DRM_XE enabled.

What's the procedure for updating the defconfigs? Do we have it
documented somewhere?

BR,
Jani.

--=20
Jani Nikula, Intel
