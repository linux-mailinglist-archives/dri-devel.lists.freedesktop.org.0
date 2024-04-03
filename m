Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D3C896FF0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 15:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137FE1126B2;
	Wed,  3 Apr 2024 13:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dtuSJfLX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAC910E1B0;
 Wed,  3 Apr 2024 13:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712149958; x=1743685958;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OXeLQFpYLfKv872kx1DqTxRGattiHdnyN8/e6tdxp0E=;
 b=dtuSJfLXdZxFbiGrcZjj6eleskeqXNsBjGqlQZphE6z20wesqie/b1VX
 L0TwhQJ9/Xdjg5jF52tgOYz4HlS/NpDTq8b/s5IQ8/xaEb1nRlnUgZEkm
 sJBSwYOLBQv3+f8g7CnpOQz9qDAa8+pRnsWzQw1tJEIyBlHqkrh2kJvwM
 ApWmQT9+arOXbBrcPBSyvYaTRuxfBy8vVbcHAFYiMGUC/OEKDrTEIG7pd
 0twdQ7PhTPISExJ4i8eGDl7vv1NmDFZ+1pDUQhS/TCSdTpHOIcdpM2a5G
 RoB629ZtRghBYPdcXyCc9s0YeAzxwXnKwPyaFhGDrjh+OozAdAJL6o9cX A==;
X-CSE-ConnectionGUID: adadXHbrQTmw/ezm2T8jvQ==
X-CSE-MsgGUID: z6z+DjFOTzKyeGYLM+xcQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11153852"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11153852"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 06:12:37 -0700
X-CSE-ConnectionGUID: A//2uME0RfqongT4o59dUA==
X-CSE-MsgGUID: VTX4EE0JTMmWTl/dAUo75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="49403701"
Received: from melsaid-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.235])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 06:12:22 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
Cc: Easwar Hariharan <eahariha@linux.microsoft.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Evan Quan <evan.quan@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Candice Li <candice.li@amd.com>, Ran Sun <sunran001@208suo.com>, Alexander
 Richards <electrodeyt@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>, Hamza
 Mahfooz <hamza.mahfooz@amd.com>, Ruan Jinjie <ruanjinjie@huawei.com>, Alan
 Liu <haoping.liu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Samson Tam <samson.tam@amd.com>, Alvin Lee
 <alvin.lee2@amd.com>, Charlene Liu <charlene.liu@amd.com>, Sohaib Nadeem
 <sohaib.nadeem@amd.com>, Lewis Huang <lewis.huang@amd.com>, Tom Chung
 <chiahsuan.chung@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>, George
 Shen <george.shen@amd.com>, Aric Cyr <aric.cyr@amd.com>, Jun Lei
 <jun.lei@amd.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Qingqing Zhuo <Qingqing.Zhuo@amd.com>, Dillon Varone
 <dillon.varone@amd.com>, Le Ma <Le.Ma@amd.com>, Lijo Lazar
 <lijo.lazar@amd.com>, Asad kamal <asad.kamal@amd.com>, Kenneth Feng
 <kenneth.feng@amd.com>, Ma Jun <Jun.Ma2@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Yang Wang <kevinyang.wang@amd.com>, Darren
 Powell <darren.powell@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>, "open
 list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v0 02/14] drm/amdgpu,drm/radeon: Make I2C terminology
 more inclusive
In-Reply-To: <Zg1NW0jqwFn4lvEP@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240329170038.3863998-1-eahariha@linux.microsoft.com>
 <20240329170038.3863998-3-eahariha@linux.microsoft.com>
 <Zgb3VYsgLjhJ2HKs@ashyti-mobl2.lan>
 <ceeaafe1-49d5-4602-8251-eed63a1be2b6@linux.microsoft.com>
 <Zgb8gieDzZtZmg2q@ashyti-mobl2.lan> <Zg1NW0jqwFn4lvEP@intel.com>
Date: Wed, 03 Apr 2024 16:12:20 +0300
Message-ID: <87sf02d1zf.fsf@intel.com>
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

On Wed, 03 Apr 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Mar 29, 2024 at 06:38:10PM +0100, Andi Shyti wrote:
>> Hi,
>>=20
>> On Fri, Mar 29, 2024 at 10:28:14AM -0700, Easwar Hariharan wrote:
>> > On 3/29/2024 10:16 AM, Andi Shyti wrote:
>> > > Hi Easwar,
>> > >=20
>> > > On Fri, Mar 29, 2024 at 05:00:26PM +0000, Easwar Hariharan wrote:
>> > >> I2C v7, SMBus 3.2, and I3C specifications have replaced "master/sla=
ve"
>> > >=20
>> > > I don't understand why we forget that i3c is 1.1.1 :-)
>> >=20
>> > That's because it's a copy-paste error from Wolfram's cover letter. :)=
 I'll update
>> > next go-around.
>>=20
>> not a binding comment, though. Just for completeness, because we
>> are giving the version to the i2c and smbus, but not i3c.
>>=20
>> > >> with more appropriate terms. Inspired by and following on to Wolfra=
m's
>> > >> series to fix drivers/i2c/[1], fix the terminology for users of
>> > >> I2C_ALGOBIT bitbanging interface, now that the approved verbiage ex=
ists
>> > >> in the specification.
>> > >=20
>> > > The specification talks about:
>> > >=20
>> > >  - master -> controller
>> > >  - slave -> target (and not client)
>> > >=20
>> > > But both you and Wolfram have used client. I'd like to reach
>> > > some more consistency here.
>> >=20
>> > I had the impression that remote targets (i.e external to the device) =
were to be called clients,
>> > e.g. the QSFP FRUs in drivers/infiniband, and internal ones targets.
>> > I chose the terminology according to that understanding, but now I can=
't find where I got that
>> > information.
>>=20
>> The word "client" does not even appear in the documentation (only
>> one instance in the i3c document), so that the change is not
>> related to the document as stated in the commit log. Unless, of
>> course, I am missing something.
>>=20
>> I'm OK with choosing a "customized" naming, but we need to reach
>> an agreement.
>>=20
>> I raised the same question to Wolfram.
>
> I don't know where that discussion happened, but my opinion
> is NAK to "client". Life is already confusing enough with
> these renames, so let's not make it even more confusing by
> inventing new names nowhere to be found in the spec.
>
> And let's especially not invent names that don't even fit
> the purpose. "Client" makes me think of "client/server" or
> some real world analogy. Neither of which seem to have any
> resemblence to how the term would be used for i2c.

Agreed.

I2C 7.0, I3C 1.1.1, and SMBus 3.2 have all switched to controller/target
terminology. The SMBus spec has additionally converted generic host
references to controller.

At least for i915 where I have some say in the matter, controller/target
it shall be.


BR,
Jani.


--=20
Jani Nikula, Intel
