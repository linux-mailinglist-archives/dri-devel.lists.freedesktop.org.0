Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AA6AEF0C1
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE8710E521;
	Tue,  1 Jul 2025 08:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c9FIdAlb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAA110E520;
 Tue,  1 Jul 2025 08:18:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWJIY2Fly/ruRlLWY/m7dxDfA5Z6wvHdn6EAHBAV+crYPQ1WTCppf8IGPySOewcU20jkqvlemXmyh1FMAOkCJFizxj3q+kSgbdrjLXjCTXoEnGhacdS6cH0o14OmTDaSnJ8mLpsEJfcksiKshYMqJT+82spKml40GZWXpytbwRQ8i/H6fyztAxMcEXO0nO5MkruAHYTomOmXTPCyVtoQluBeasEdj1bGLuDknOhBxkh6weKOFIYCVZZm4l4Xm16baPcFHVCPR+oyT11NXp5Djxdo3dyw3roDwEep/jyRPxjU0Kg6tZCS1s1CNEy86xVDZlJlHveE7jroKuxqcF6qVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xrb/q8btmOplfIAY9sxsAzImEFPi15c/ez/+vjcq5c=;
 b=BzDuIhRqXN5tC7N7P9P7mI9gnzcMurQHiz65uoEMzGLmSO78zxa9uSrdK5OF1dMH3Awnz9xFse4F+k/ZpR6BtYV2WZJUBsuCRruTZCCyJOvHdWF57w/FEgxM16mOeGIAL/+6qj2mrYFK4iHolIAOATao23ZUPUBBm6zAhNQzEJObjrSoehPoH2bjg9E+KOkTbXQl5zkigNfv09a7O1k14VlcmYI3ZbbBzrWxb26e/KDBpocZHm6s83l5cLmx+tnjvW4BONC/hYfqEgQR9jgsCg4WX3eBQ+EF2Vy1EA5So+BOZDJZW3FBqJDO6dVCadZWf5vFPwcwSCWW+D6Jx2nreA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xrb/q8btmOplfIAY9sxsAzImEFPi15c/ez/+vjcq5c=;
 b=c9FIdAlbCpWjRzPVmETx5CqRBpwxerTM02InGNbGADfbSu1vGmYBhVI2oFCY5KKu2jnF2U/vDx5yGllcEHnF/vvhwaEADl7c19UozEPDZ9mI9C26E5lqhQee46dN22O67yhEbTpkdmbESfixxjtlbGuRCJd5nps8T66WYw6BoFA=
Received: from DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) by
 LV8PR12MB9336.namprd12.prod.outlook.com (2603:10b6:408:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 1 Jul
 2025 08:18:48 +0000
Received: from DM4PR12MB5937.namprd12.prod.outlook.com
 ([fe80::c847:70c6:3c78:54ba]) by DM4PR12MB5937.namprd12.prod.outlook.com
 ([fe80::c847:70c6:3c78:54ba%4]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 08:18:48 +0000
From: "Zhang, GuoQing (Sam)" <GuoQing.Zhang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "rafael@kernel.org"
 <rafael@kernel.org>, "len.brown@intel.com" <len.brown@intel.com>,
 "pavel@kernel.org" <pavel@kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Limonciello, Mario"
 <Mario.Limonciello@amd.com>, "Lazar, Lijo" <Lijo.Lazar@amd.com>
CC: "Zhao, Victor" <Victor.Zhao@amd.com>, "Chang, HaiJun"
 <HaiJun.Chang@amd.com>, "Ma, Qing (Mark)" <Qing.Ma@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/amdgpu: move GTT to SHM after eviction for
 hibernation
Thread-Topic: [PATCH 1/3] drm/amdgpu: move GTT to SHM after eviction for
 hibernation
Thread-Index: AQHb6auS8oH8wx4YIEmNLukbJ0hBzLQbmBMAgAFVIFM=
Date: Tue, 1 Jul 2025 08:18:43 +0000
Message-ID: <DM4PR12MB5937FFB3E121E489A261785DE541A@DM4PR12MB5937.namprd12.prod.outlook.com>
References: <20250630104116.3050306-1-guoqing.zhang@amd.com>
 <20250630104116.3050306-2-guoqing.zhang@amd.com>
 <ce04e266-6c3f-4256-aade-bafca8609ab3@amd.com>
In-Reply-To: <ce04e266-6c3f-4256-aade-bafca8609ab3@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-07-01T08:15:13.6428488Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5937:EE_|LV8PR12MB9336:EE_
x-ms-office365-filtering-correlation-id: 479068e5-db83-4476-bdf6-08ddb877e78e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|921020|8096899003|38070700018|7053199007;
x-microsoft-antispam-message-info: =?Windows-1252?Q?feFaiMibye3+cUA8QA5iFq1Fz8y4u2H/EXQe0ufrWS59g/lkZbgzhfmn?=
 =?Windows-1252?Q?OZl4yR8yQcqXytMMszTFvfsd55CBUEtsqpLHMpyDGp7tt/fc08FnhEIq?=
 =?Windows-1252?Q?/G3F13UI16vfbUvS2sy1Zc7S3X283HH5xClW2E4NOJjoWvA9V5+AQo4I?=
 =?Windows-1252?Q?N8hKZBz5+CWO8PW5f6xqqJqXoeXiSnqb6YYz/r++DpXx5dvbkl1lWV6M?=
 =?Windows-1252?Q?T6qS78GGIXdnCBbR4ib/JOQ83HAC56lmujOb3D43sQ9KZtKCVIUukkoV?=
 =?Windows-1252?Q?b58t2GIPeu9y6xXnNUgw1o1r4acd++wxagdD2pPM4QqewdoJKWFrFQR3?=
 =?Windows-1252?Q?R6wIbWOXD7tOPe/sEf0giQZ8LmleKrgOjh2IGfFgf8eS2F4BEyzIJJ+F?=
 =?Windows-1252?Q?BLKI6pdZlJNVG0CL+6Fr99yAFiJkwqZOESw1yoFm0s4WaCGhhxlPfd1X?=
 =?Windows-1252?Q?sDAZ8EJBtshu330dS5AxrTOrG2cGk+T9TVIPb7SyMssv4yuA7QGPbogS?=
 =?Windows-1252?Q?C9ZEs7by5hdk7AznNUb6QMAIQtRsgo5aDgIhTs2cV7k/6Gqb5i1W/kep?=
 =?Windows-1252?Q?qr8qzgl5h0gjK8Ky3It2tkLDGd72VUom8STbHUr0DOai0UglF8/hhRRu?=
 =?Windows-1252?Q?JM3xo1hUNHzB9YRDpSkITjQ6FvipMuJKYBdIaZj7we7v8PbzxJhi7FCm?=
 =?Windows-1252?Q?xRaSXEfHMTVlwxWzudqWCWAVNvUlNeMywalSiDzEvII/qHHN7zhY5tA6?=
 =?Windows-1252?Q?0US/QMSarliZbO3fH+Oaqsi4DNXkRjkilq1G35wIk9LrGExA5wcFMJGL?=
 =?Windows-1252?Q?vdrjuvaSVxKyoSH+tqjwcF26rxYUC/81KiLwvE9GdBX7xrgzDrw64ZSm?=
 =?Windows-1252?Q?qP0T6/owd/+KCL7zlHw22UDMudQYx/9jNXBxshRL6Ynwv+7lIb+RApHu?=
 =?Windows-1252?Q?pQ1Y5pSilbGqZJquJgWTkbtJ4wEhwNuIbvsa3Sb6mmxaa/R7F9RyhOuN?=
 =?Windows-1252?Q?L+HkoFd68Q/C5NZPJmKlzZAeDGazBpHI9kk7cuBENKG5xVt7YCSRcBEB?=
 =?Windows-1252?Q?uT/wpi1fpW4vkKmT/C+b1EFP1Jy3Rfg28nFvCrcXxxiVBul45kA1sY9b?=
 =?Windows-1252?Q?V6JcBxOmMQfHLdz921ZrRvhGIJPnyUfbkjstkAnzOpAHUrwVOlorH9Uk?=
 =?Windows-1252?Q?caOKFtws/CYCmfhl3R41V1cCOI1FTcZGK3+tOOjSATywylx3O0hvBF1D?=
 =?Windows-1252?Q?/ISgiuDM2TV2D4z79Rm/26Cc5+qrex09P/waa04FdD6xUAeIRIiIX53C?=
 =?Windows-1252?Q?HetsN5xrStGWClFTB3RDfLOK2szhwIQLre6hgxPhBOZZocBHPmejD/BF?=
 =?Windows-1252?Q?m81xW04FA1/9oxRW3H/KwYSJMOBPnAjrGg0pkhlDd+EDDkUlkjgcw41O?=
 =?Windows-1252?Q?66b0DOP+OpaLjWgz/etbwwKlKzTFilU3Tdd6s1vW3lDGhb+OkqcryFfx?=
 =?Windows-1252?Q?9Yg3yzkZMqKyN26dT+FWPQHDGI6UMIKD63ECQIidB/ATphT5J+FV8Oa5?=
 =?Windows-1252?Q?+xS6hXw83G38+nmApUxQhKomoZuZEN8TIln51atnCdzVF/Vj83hh846g?=
 =?Windows-1252?Q?4cg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(921020)(8096899003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?JQAMAIOMm7+dChLFmc/dDtcwm7MTet5goQONDZi0TMjPG8wtudo1rX45?=
 =?Windows-1252?Q?Dq19qWGcRAb1ynfRDJnYVpa6/lFvTBZUQEoZvzGimxXDkKQMtrvdAR4U?=
 =?Windows-1252?Q?+dhIvuBC003vcx/beieqsMoisU8J5YwSpILSGKwez6Rdx+nwd6zb1UT7?=
 =?Windows-1252?Q?v3E0D42mclUeyx9V6o19/7mStutbrO6Ma2gsB2WPwIycpa+WTmntA6rX?=
 =?Windows-1252?Q?1Tx37YzM6EfByAZ7fnPfM8iO41incWqscEGT6S0xTuIFgWguVo3Fd1aF?=
 =?Windows-1252?Q?08s6wCQJqPazocHN5eET55jZkx0Fw/vuoRylNlqx4Ljlf21+xKQoHS1I?=
 =?Windows-1252?Q?r2+1BNTPj3HtMZVkUa6fOS8dlujo56dEsOh9rzQ4lM/cGYG+mg9Dtagp?=
 =?Windows-1252?Q?7UeX4VNn8RuzODzltwD+jd18F1fYfSyoL8ZqAl3zwbRp+HRRofR87YK+?=
 =?Windows-1252?Q?kn6NEXsfnuBRtXhuyoW2yo44fZDcq0UtQ86eqmpIIsxbFMxDaxsvAxDB?=
 =?Windows-1252?Q?X5jIn6XdusugV2s7hp8Pa0jPbmdfH3DRITAycUpvz+raqc7m5OdhwZk3?=
 =?Windows-1252?Q?YrYDYTjbfOHteVYmwgn+BJ5jHVPnhCy9VYX/kspOmEs+ukPtiQvhSzRF?=
 =?Windows-1252?Q?hjCERDWzbut/5YwOo3zxVSFKJWldszLj/r82AgGophYvJ5pcO+0TluPU?=
 =?Windows-1252?Q?tDeISHFEO//VMKnL3V2ODOx8vJtEFMRlojztjE2/0Vh+lMGMcvB4YVaK?=
 =?Windows-1252?Q?hd3k6ZZYmGhZJUR54i4DknDz5aZcspVFMd50b+Mr/60vZ1d1P8JKsuoj?=
 =?Windows-1252?Q?UP4c5zcGqZ4e0jSDzW1B5y9CB9mb/tvn1u/A+PdqhKWMJFfvZGHk2rv/?=
 =?Windows-1252?Q?e00OlnUIwPGJTK1ilLqVE/Ak252z5St8OzZtoAAl2W4VXYY36p0cPIyJ?=
 =?Windows-1252?Q?txvyFDHHgBVT38hklk7KTEVMdyDFoVCOsEcLQpJZvGQYgYIJEgKW8vif?=
 =?Windows-1252?Q?6ygrrwSNxKXHOoI9gBi2yhgBezEsWbwN/WnBJqEkW9jn+zC1LsnCd1Md?=
 =?Windows-1252?Q?TLcdKpWlncjSpyDboKriWXI/jqsdbbegfH1UKO3mxwIEVGVjtR70N5yg?=
 =?Windows-1252?Q?mnRJD/JsXHrM1z8kSMe6vEF0xMrnDQgG7Qv35dFh3Xu55z9hkTsWOje0?=
 =?Windows-1252?Q?PxNxW+cfTM3wnxb0qEerTtq/9NWH2pboARsUjlVVzbjW25DSgwK+XmMu?=
 =?Windows-1252?Q?o2+MEvnCITzKnFNEC9FENeA6OjH9pKk9YdGFTuFhF4jwjMUP6d620402?=
 =?Windows-1252?Q?/ydHSAdda+U7gQgcWT5Xy+MH5jDJ22uuAISAt/MKvxLidtSmqFxUDwRR?=
 =?Windows-1252?Q?8rmM09r0Soz8dthc4ksd/YcAS/8LvSPK0PHaweASI0BCruyJSSLv2hME?=
 =?Windows-1252?Q?xYIddLrylQJ/A28vNVEHdr8+Ljp2/VETvATWrECNOpBmLh2zg0PZ+wFy?=
 =?Windows-1252?Q?+ve+fMKYz58O0klgxWaAtGUmHs6CNymGk04DUqd09PPr6zH3ByGGcFpr?=
 =?Windows-1252?Q?q7gROpY1AsMyo3B2QCeL7TDja+kJWIS69cP2qLuwX3YNS4gIvaCBsoGK?=
 =?Windows-1252?Q?xBju+0iel2qE73EPJh/EHCwz0/aOBiDpGyxhiHZKUVSSSenNln5vzOzi?=
 =?Windows-1252?Q?o6pw3VttqJE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB5937FFB3E121E489A261785DE541ADM4PR12MB5937namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 479068e5-db83-4476-bdf6-08ddb877e78e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 08:18:48.1374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rz5S0t6woDybsZGZi0Da4hTI8pyS/60/fpMRlk9uzCd0k9V7PpzCio8z6STaw0KDJ8zWH2N3m1aTp/sjCnt6uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9336
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

--_000_DM4PR12MB5937FFB3E121E489A261785DE541ADM4PR12MB5937namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Christian,

Thank you for the feedback.

For =93return ret < 0 ? ret : 0;=94, it is equivalent to =93return ret;=94 =
since ret is always <=3D 0 after the loop.

For all other comments, I will revise the patch accordingly in v2.

Regards
Sam


From: Koenig, Christian <Christian.Koenig@amd.com>
Date: Monday, June 30, 2025 at 19:54
To: Zhang, GuoQing (Sam) <GuoQing.Zhang@amd.com>, rafael@kernel.org <rafael=
@kernel.org>, len.brown@intel.com <len.brown@intel.com>, pavel@kernel.org <=
pavel@kernel.org>, Deucher, Alexander <Alexander.Deucher@amd.com>, Limoncie=
llo, Mario <Mario.Limonciello@amd.com>, Lazar, Lijo <Lijo.Lazar@amd.com>
Cc: Zhao, Victor <Victor.Zhao@amd.com>, Chang, HaiJun <HaiJun.Chang@amd.com=
>, Ma, Qing (Mark) <Qing.Ma@amd.com>, amd-gfx@lists.freedesktop.org <amd-gf=
x@lists.freedesktop.org>, dri-devel@lists.freedesktop.org <dri-devel@lists.=
freedesktop.org>, linux-pm@vger.kernel.org <linux-pm@vger.kernel.org>, linu=
x-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] drm/amdgpu: move GTT to SHM after eviction for hib=
ernation
On 30.06.25 12:41, Samuel Zhang wrote:
> When hibernate with data center dGPUs, huge number of VRAM BOs evicted
> to GTT and takes too much system memory. This will cause hibernation
> fail due to insufficient memory for creating the hibernation image.
>
> Move GTT BOs to shmem in KMD, then shmem to swap disk in kernel
> hibernation code to make room for hibernation image.

This should probably be two patches, one for TTM and then an amdgpu patch t=
o forward the event.

>
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++++++-
>  drivers/gpu/drm/ttm/ttm_resource.c      | 18 ++++++++++++++++++
>  include/drm/ttm/ttm_resource.h          |  1 +
>  3 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 4d57269c9ca8..5aede907a591 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2889,6 +2889,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>  int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>  {
>        struct ttm_resource_manager *man;
> +     int r;
>
>        switch (mem_type) {
>        case TTM_PL_VRAM:
> @@ -2903,7 +2904,17 @@ int amdgpu_ttm_evict_resources(struct amdgpu_devic=
e *adev, int mem_type)
>                return -EINVAL;
>        }
>
> -     return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
> +     r =3D ttm_resource_manager_evict_all(&adev->mman.bdev, man);
> +     if (r) {
> +             DRM_ERROR("Failed to evict memory type %d\n", mem_type);
> +             return r;
> +     }
> +     if (adev->in_s4 && mem_type =3D=3D TTM_PL_VRAM) {
> +             r =3D ttm_resource_manager_swapout();
> +             if (r)
> +                     DRM_ERROR("Failed to swap out, %d\n", r);
> +     }
> +     return r;
>  }
>
>  #if defined(CONFIG_DEBUG_FS)
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm=
_resource.c
> index fd41b56e2c66..07b1f5a5afc2 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -534,6 +534,24 @@ void ttm_resource_manager_init(struct ttm_resource_m=
anager *man,
>  }
>  EXPORT_SYMBOL(ttm_resource_manager_init);
>
> +int ttm_resource_manager_swapout(void)

This needs documentation, better placement and a better name.

First of all put it into ttm_device.c instead of the resource manager.

Then call it something like ttm_device_prepare_hibernation or similar.


> +{
> +     struct ttm_operation_ctx ctx =3D {
> +             .interruptible =3D false,
> +             .no_wait_gpu =3D false,
> +             .force_alloc =3D true
> +     };
> +     int ret;
> +
> +     while (true) {

Make that:

do {
        ret =3D ...
} while (ret > 0);

> +             ret =3D ttm_global_swapout(&ctx, GFP_KERNEL);
> +             if (ret <=3D 0)
> +                     break;
> +     }
> +     return ret;

It's rather pointless to return the number of swapped out pages.

Make that "return ret < 0 ? ret : 0;

Regards,
Christian.

> +}
> +EXPORT_SYMBOL(ttm_resource_manager_swapout);
> +
>  /*
>   * ttm_resource_manager_evict_all
>   *
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resourc=
e.h
> index b873be9597e2..46181758068e 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -463,6 +463,7 @@ void ttm_resource_manager_init(struct ttm_resource_ma=
nager *man,
>
>  int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>                                   struct ttm_resource_manager *man);
> +int ttm_resource_manager_swapout(void);
>
>  uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
>  void ttm_resource_manager_debug(struct ttm_resource_manager *man,

--_000_DM4PR12MB5937FFB3E121E489A261785DE541ADM4PR12MB5937namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Aptos;
	panose-1:2 11 0 4 2 2 2 2 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:10.0pt;
	font-family:"Aptos",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"en-CN" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Hi C=
hristian,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Than=
k you for the feedback.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">For =
=93return ret &lt; 0 ? ret : 0;=94, it is equivalent to =93return ret;=94 s=
ince ret is always &lt;=3D 0 after the loop.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">For =
all other comments, I will revise the patch accordingly in v2.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Rega=
rds<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Sam<=
o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt"><o:p>&nbsp;</o:p></=
span></p>
<div id=3D"mail-editor-reference-message-container">
<div>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><span style=3D"fon=
t-size:12.0pt;color:black">From:
</span></b><span style=3D"font-size:12.0pt;color:black">Koenig, Christian &=
lt;Christian.Koenig@amd.com&gt;<br>
<b>Date: </b>Monday, June 30, 2025 at 19:54<br>
<b>To: </b>Zhang, GuoQing (Sam) &lt;GuoQing.Zhang@amd.com&gt;, rafael@kerne=
l.org &lt;rafael@kernel.org&gt;, len.brown@intel.com &lt;len.brown@intel.co=
m&gt;, pavel@kernel.org &lt;pavel@kernel.org&gt;, Deucher, Alexander &lt;Al=
exander.Deucher@amd.com&gt;, Limonciello, Mario &lt;Mario.Limonciello@amd.c=
om&gt;,
 Lazar, Lijo &lt;Lijo.Lazar@amd.com&gt;<br>
<b>Cc: </b>Zhao, Victor &lt;Victor.Zhao@amd.com&gt;, Chang, HaiJun &lt;HaiJ=
un.Chang@amd.com&gt;, Ma, Qing (Mark) &lt;Qing.Ma@amd.com&gt;, amd-gfx@list=
s.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;, dri-devel@lists.fr=
eedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;, linux-pm@vger.kernel=
.org
 &lt;linux-pm@vger.kernel.org&gt;, linux-kernel@vger.kernel.org &lt;linux-k=
ernel@vger.kernel.org&gt;<br>
<b>Subject: </b>Re: [PATCH 1/3] drm/amdgpu: move GTT to SHM after eviction =
for hibernation<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">On 30.06.25 12:41, Samuel Zhang wrote:<br>
&gt; When hibernate with data center dGPUs, huge number of VRAM BOs evicted=
<br>
&gt; to GTT and takes too much system memory. This will cause hibernation<b=
r>
&gt; fail due to insufficient memory for creating the hibernation image.<br=
>
&gt; <br>
&gt; Move GTT BOs to shmem in KMD, then shmem to swap disk in kernel<br>
&gt; hibernation code to make room for hibernation image.<br>
<br>
This should probably be two patches, one for TTM and then an amdgpu patch t=
o forward the event.<br>
<br>
&gt; <br>
&gt; Signed-off-by: Samuel Zhang &lt;guoqing.zhang@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++++++-<br>
&gt;&nbsp; drivers/gpu/drm/ttm/ttm_resource.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 | 18 ++++++++++++++++++<br>
&gt;&nbsp; include/drm/ttm/ttm_resource.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&gt;&nbsp; 3 files changed, 31 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ttm.c<br>
&gt; index 4d57269c9ca8..5aede907a591 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c<br>
&gt; @@ -2889,6 +2889,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,<br>
&gt;&nbsp; int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int m=
em_type)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_resource_manager =
*man;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (mem_type) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case TTM_PL_VRAM:<br>
&gt; @@ -2903,7 +2904,17 @@ int amdgpu_ttm_evict_resources(struct amdgpu_de=
vice *adev, int mem_type)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; return ttm_resource_manager_evict_all(&amp;a=
dev-&gt;mman.bdev, man);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; r =3D ttm_resource_manager_evict_all(&amp;ad=
ev-&gt;mman.bdev, man);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; DRM_ERROR(&quot;Failed to evict memory type %d\n&quot;, mem_type);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return r;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (adev-&gt;in_s4 &amp;&amp; mem_type =3D=
=3D TTM_PL_VRAM) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; r =3D ttm_resource_manager_swapout();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (r)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed =
to swap out, %d\n&quot;, r);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp; #if defined(CONFIG_DEBUG_FS)<br>
&gt; diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/=
ttm_resource.c<br>
&gt; index fd41b56e2c66..07b1f5a5afc2 100644<br>
&gt; --- a/drivers/gpu/drm/ttm/ttm_resource.c<br>
&gt; +++ b/drivers/gpu/drm/ttm/ttm_resource.c<br>
&gt; @@ -534,6 +534,24 @@ void ttm_resource_manager_init(struct ttm_resourc=
e_manager *man,<br>
&gt;&nbsp; }<br>
&gt;&nbsp; EXPORT_SYMBOL(ttm_resource_manager_init);<br>
&gt;&nbsp; <br>
&gt; +int ttm_resource_manager_swapout(void)<br>
<br>
This needs documentation, better placement and a better name.<br>
<br>
First of all put it into ttm_device.c instead of the resource manager.<br>
<br>
Then call it something like ttm_device_prepare_hibernation or similar.<br>
<br>
<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_operation_ctx ctx =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; .interruptible =3D false,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; .no_wait_gpu =3D false,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; .force_alloc =3D true<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; while (true) {<br>
<br>
Make that:<br>
<br>
do {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D ...<br>
} while (ret &gt; 0);<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D ttm_global_swapout(&amp;ctx, GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (ret &lt;=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
<br>
It's rather pointless to return the number of swapped out pages.<br>
<br>
Make that &quot;return ret &lt; 0 ? ret : 0;<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt; +}<br>
&gt; +EXPORT_SYMBOL(ttm_resource_manager_swapout);<br>
&gt; +<br>
&gt;&nbsp; /*<br>
&gt;&nbsp;&nbsp; * ttm_resource_manager_evict_all<br>
&gt;&nbsp;&nbsp; *<br>
&gt; diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_reso=
urce.h<br>
&gt; index b873be9597e2..46181758068e 100644<br>
&gt; --- a/include/drm/ttm/ttm_resource.h<br>
&gt; +++ b/include/drm/ttm/ttm_resource.h<br>
&gt; @@ -463,6 +463,7 @@ void ttm_resource_manager_init(struct ttm_resource=
_manager *man,<br>
&gt;&nbsp; <br>
&gt;&nbsp; int ttm_resource_manager_evict_all(struct ttm_device *bdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_resou=
rce_manager *man);<br>
&gt; +int ttm_resource_manager_swapout(void);<br>
&gt;&nbsp; <br>
&gt;&nbsp; uint64_t ttm_resource_manager_usage(struct ttm_resource_manager =
*man);<br>
&gt;&nbsp; void ttm_resource_manager_debug(struct ttm_resource_manager *man=
,<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DM4PR12MB5937FFB3E121E489A261785DE541ADM4PR12MB5937namp_--
