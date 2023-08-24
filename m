Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9F0786C02
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 11:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BED10E514;
	Thu, 24 Aug 2023 09:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7AC10E514
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 09:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692869618; x=1724405618;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2vFCU4cKjzROt9iNRAPD3gq42jmR3vOwCKOXq570yeM=;
 b=JIBfTkpBHIsA37slPaUluFSeNaKkcXJNDzLpgOwCfo8vzzymvZyQPDyZ
 iu//EPqpfGzPAXovKZcb4X2CCfWQaCTNGBpj2rejgUEVKVLCdj044WXkP
 RVNzg8canes5Ri9OZnZp/IXD8/A+JMPRNI9bOvpbpu5iQqeRvMXPDeZNV
 LnCuEaZ9m3Y4JWHDFtyS04MWWSLvnHVUkoguNOhaXFNlEqsF+hXnOkJry
 Vr40I8apGoMn05d8Y2TwOpUy785XcT6zRleLGvxKS0hsKJTVPhxB45CFJ
 tKz2cGRRZIaz1rHce7UciL/jdz8Iv2HE5qHIVMQOXVVPa2lIoG9vz3hPA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="353934197"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="353934197"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 02:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="730548687"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="730548687"
Received: from andrzejk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.46.90])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 02:33:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 15/20] drm/tegra/hub: Increase buffer size to ensure all
 possible values can be stored
In-Reply-To: <ZOciEaJlHhp4xnFv@orome>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-16-lee@kernel.org> <ZOciEaJlHhp4xnFv@orome>
Date: Thu, 24 Aug 2023 12:33:33 +0300
Message-ID: <87r0ns4weq.fsf@intel.com>
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
Cc: linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Aug 2023, Thierry Reding <thierry.reding@gmail.com> wrote:
> On Thu, Aug 24, 2023 at 08:37:00AM +0100, Lee Jones wrote:
>> When converting from int to string, we must allow for up to 10-chars (21=
47483647).
>>=20
>> Fixes the following W=3D1 kernel build warning(s):
>>=20
>>  drivers/gpu/drm/tegra/hub.c: In function =E2=80=98tegra_display_hub_pro=
be=E2=80=99:
>>  drivers/gpu/drm/tegra/hub.c:1106:47: warning: =E2=80=98%u=E2=80=99 dire=
ctive output may be truncated writing between 1 and 10 bytes into a region =
of size 4 [-Wformat-truncation=3D]
>>  drivers/gpu/drm/tegra/hub.c:1106:42: note: directive argument in the ra=
nge [0, 4294967294]
>>  drivers/gpu/drm/tegra/hub.c:1106:17: note: =E2=80=98snprintf=E2=80=99 o=
utput between 6 and 15 bytes into a destination of size 8
>
> I wish there was (perhaps there is?) a better way to annotate that i
> will always be within a given range. In practice this is always going to
> be smaller than 10 and even in future hardware I wouldn't expect this to
> ever exceed anything like 32 or 64, so 8 characters is already generous.

I assume you could do

	snprintf(id, sizeof(id), "wgrp%u", (unsigned char)i);

but it's perhaps less obvious than just increasing the size of the
buffer.

BR,
Jani.

>
> Thierry
>
>>=20
>> Signed-off-by: Lee Jones <lee@kernel.org>
>> ---
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Mikko Perttunen <mperttunen@nvidia.com>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Jonathan Hunter <jonathanh@nvidia.com>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-tegra@vger.kernel.org
>> ---
>>  drivers/gpu/drm/tegra/hub.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
>> index 1af5f8318d914..f21e57e8599ee 100644
>> --- a/drivers/gpu/drm/tegra/hub.c
>> +++ b/drivers/gpu/drm/tegra/hub.c
>> @@ -1101,7 +1101,7 @@ static int tegra_display_hub_probe(struct platform=
_device *pdev)
>>=20=20
>>  	for (i =3D 0; i < hub->soc->num_wgrps; i++) {
>>  		struct tegra_windowgroup *wgrp =3D &hub->wgrps[i];
>> -		char id[8];
>> +		char id[16];
>>=20=20
>>  		snprintf(id, sizeof(id), "wgrp%u", i);
>>  		mutex_init(&wgrp->lock);
>> --=20
>> 2.42.0.rc1.204.g551eb34607-goog
>>=20

--=20
Jani Nikula, Intel Open Source Graphics Center
