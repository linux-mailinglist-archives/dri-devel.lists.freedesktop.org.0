Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F23A706414
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 11:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A553E10E116;
	Wed, 17 May 2023 09:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF6210E116;
 Wed, 17 May 2023 09:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684315617; x=1715851617;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=VWH8Yd9TXHbUafP3hxVcv6CDSzejG60n/1ZK/XYmBwA=;
 b=W9P1wfF936yiCk6Cbegoxxtfa9s7xdpxS0TQPQeuePYirIiPzOngDgUY
 JqYmRLbEGprtRKS03FvJq3zR8uTj5Y9VR6cTvNOWpsH1l4f4oPFa6k9OR
 UETZjOGN+esds9EF0NFD8M3zC5TugOSdZfpyb6D1P7ZxO0aigUUFx0h+j
 lblOQQLv+zQcxU+vyNu/cRcjTToJeWDGKdz/fl5urcsKePKkr/DcYm4Z9
 AezPPSzSUCKHz9HucbaVuFZMGftktKnm621vnn4YY5cyp+OZ3+9aDd81b
 cRS7in0wcA4nBYiBDH4+lZ7uduqCH4D6bryoDo/gi4zpquP6dUlnma9Q9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="438055991"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="438055991"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 02:26:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="1031639118"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; d="scan'208";a="1031639118"
Received: from pakurapo-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.50.207])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 02:26:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/ttm: let struct ttm_device_funcs be placed in rodata
In-Reply-To: <CADnq5_NL-Ouh5-NRaoRknPDRTq2NDKWcHKxDEXfmkuqgWL54kw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230309123700.528641-1-jani.nikula@intel.com>
 <d844e8f4-dbfe-15a6-32db-4ab928fad77d@amd.com> <87bkl29jk0.fsf@intel.com>
 <875y8sitv5.fsf@intel.com>
 <CADnq5_NL-Ouh5-NRaoRknPDRTq2NDKWcHKxDEXfmkuqgWL54kw@mail.gmail.com>
Date: Wed, 17 May 2023 12:26:51 +0300
Message-ID: <87fs7vgvfo.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 May 2023, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Tue, May 16, 2023 at 4:05=E2=80=AFAM Jani Nikula <jani.nikula@intel.co=
m> wrote:
>>
>> On Thu, 09 Mar 2023, Jani Nikula <jani.nikula@intel.com> wrote:
>> > On Thu, 09 Mar 2023, Christian K=C3=B6nig <christian.koenig@amd.com> w=
rote:
>> >> Am 09.03.23 um 13:37 schrieb Jani Nikula:
>> >>> Make the struct ttm_device_funcs pointers const so the data can be p=
laced in rodata.
>> >>>
>> >>> Cc: Christian Koenig <christian.koenig@amd.com>
>> >>> Cc: Huang Rui <ray.huang@amd.com>
>> >>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> >>
>> >> Good idea, Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.co=
m>
>> >
>> > Thanks!
>> >
>> >> Should I push it to drm-misc-next or do you need it on some other bra=
nch?
>> >
>> > Go ahead, I'm not urgently depending on it.
>>
>> Christian, I guess this fell between the cracks? Can I just push it to
>> drm-misc-next?
>
> Go ahead.  Christian is out of the office this week.

Thanks, pushed to drm-misc-next.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
