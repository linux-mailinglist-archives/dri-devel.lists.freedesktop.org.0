Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1299BB048
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 10:53:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACBA410E128;
	Mon,  4 Nov 2024 09:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Or2091ec";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D12710E128
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 09:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730714025; x=1762250025;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=nN5JdRqbpR09wpFxPWggsKdndZS4TPirUIMk8hnY/ZQ=;
 b=Or2091ecCyxXfJeAJtyDBqnIRi0ahlSA8oGyvXSwv65YYEHqpuUhQZWb
 PSE7dnLt7Di8/FL/q5h3SmdplT6I1AVM5JErCW6f8y7qKtWx2iZWM2oWX
 cIIhNan/q/7/bHnNpz40rEfSBTc83FpP3BUk59UqwJ2Gs/C5chbQ+ORX9
 +NHLbT/7/PUaOUHyoWaYve+zEnzVGerG/PW/k4i0SIC7/H5htrHYfWzrx
 Lzw5OSfkhORVu+N5YnqWlmF2iGzuPpCGvBa/SM6F6mU/dMVYBjSWHgbpR
 nCZH/9oz7TXNtdIAk8+oT3rrBce2V4vUHQpJy5l4HOEV8OwxnyMIH1NMj Q==;
X-CSE-ConnectionGUID: fept9+hNRIC2Nq+jJqu67Q==
X-CSE-MsgGUID: BAed0awQTy+O8IMm3bk+ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="30511360"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="30511360"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 01:53:45 -0800
X-CSE-ConnectionGUID: 1t3aNrHfRiuq2heJrRwIBw==
X-CSE-MsgGUID: Q6v2o3hKTJOAHXOSjEmGrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="83717292"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.33])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 01:53:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ian Forbes <ian.forbes@broadcom.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Alex Deucher
 <alexander.deucher@amd.com>, Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH v4] drm/edid: add CTA Video Format Data Block support
In-Reply-To: <CAO6MGtg-+btwUk9ZkJj7Zreyk_VfyDtsc_4k05rCv+vFJRSJVQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240909171228.148383-1-hamza.mahfooz@amd.com>
 <CAO6MGtg-+btwUk9ZkJj7Zreyk_VfyDtsc_4k05rCv+vFJRSJVQ@mail.gmail.com>
Date: Mon, 04 Nov 2024 11:53:38 +0200
Message-ID: <87wmhjiau5.fsf@intel.com>
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

On Fri, 01 Nov 2024, Ian Forbes <ian.forbes@broadcom.com> wrote:
> We'd like to use the OVT modes for vmwgfx. Can you export the main OVT
> function so it matches the CVT one? Something like this:
>
> struct drm_display_mode *drm_ovt_mode(struct drm_device *dev, int rid,
> int vrefresh);
>
> On Mon, Sep 9, 2024 at 12:17=E2=80=AFPM Hamza Mahfooz <hamza.mahfooz@amd.=
com> wrote:
>>
>> +
>> +/* OVT Algorthim as specified in CTA-861-I */
>> +static struct drm_display_mode *
>> +calculate_ovt_mode(struct drm_connector *connector, const struct cta_ri=
d *rid,
>> +                  u16 vrate)
>
> Also all instances of CEA should probably be replaced with CTA, not
> necessarily in this series, but they changed their name ~10 years ago.

Yeah. I've gradually done some renames, but it would be good for
consistency for someone to finish the job.

BR,
Jani.


--=20
Jani Nikula, Intel
