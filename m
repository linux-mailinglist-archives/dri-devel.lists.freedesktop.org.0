Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A1795546C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 02:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1080810E865;
	Sat, 17 Aug 2024 00:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lIP9z5rE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C1B10E865
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 00:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723856298; x=1755392298;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ftr5PRcd17EPKIGrRyHRtnrmhk/s5SXbQeJeVbK/8Z4=;
 b=lIP9z5rEcx72JrptqEcFvvx5k0VLWdZpTdZtYl0Zsh5ToZkh1XqI3UT1
 t8RDWVV0YVBBY91DLbyTmV0BCxmr/gpIbviOcTpqpuisjQLiyUiqm85ba
 4OgYI0gcqEjekT6MAJr6BBKj0JCFFq4iwREORsZG+ZAxrHV8vsyjZMQ3d
 2gCC5rk8yVlZHB7Xp8I/xbIashxZnK/0s6d5DRtBIrgWRt8y9ihk22WWe
 rNyK7nNbR6tlbM5q1S4vazPYwcbENsOZlTJ5ZUQ0Ivj3wJhBrxivDh/28
 9SKmDemg1ZQuPNbv06kGloyjqpCAPh/fZDF1Ug0hXCPA6TGCtUdhU9L9j g==;
X-CSE-ConnectionGUID: kfgZEwU5RFi+IFXorZVuEw==
X-CSE-MsgGUID: tnbssTQER4GFE4RN/OmO4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22020404"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="22020404"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 17:58:18 -0700
X-CSE-ConnectionGUID: jH9yingoQEKqIWZMjocBiQ==
X-CSE-MsgGUID: OAh0a9A6T2GcLm9kb3++mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; d="scan'208";a="59985905"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 17:58:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 17:58:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 17:58:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 17:58:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 17:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey/YzEJUI4ayQIH64bCvyks+47DlNNWqffpDUadgs7OLAjUH2gAMKO5ZNKfD3D1UuWv31HjMwWbzw6P149nwILYtBV3C2Df7aQh6LmeKx8uIQfpGHPVvFS0urjVMl5FXfV8tk1+ECOK+cDtDnDczS/cStb04el/4wqDN3VbolkxE2SdxaXn+Zmzf4YU+m2ep/nXNSqIazB1tQ4QMDKyTJ6JTKQqwM2+LFADd50ErNXPlYkfW18mjaNqbyYt893h3LbW/Mu0LECZZq7zqfTI7zQfDwiNo/Rw075+doenhkO247YBLP5+WuLWzcW0mKV55Sfq8LazgnS8cGLUxq4GJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=opZ1G0zpQhWK3sLpT9AWcRM2Tc++TzOVHKDPSVx65do=;
 b=TlySjQz1qr7AQjGVDlAEqGPQb0PsN32AvxPbBhiLb274w0XdptVGSEaieh/rQ/5HzYV/sLBD5yzX0Em9v90QVu84kDvOdPmLAQrp8BlcG9uhSTFRf2EtqW10w/Oyle+9+sMZmbIOfvibBdhYJo2Twlmgeiovc8iInhiaUIsLzfK/olHnpQ+JR10BxEx59VFZB7f7M5r/PWyOCgjrZelRiPue2lvX7MYMtRdHfxZNtGSnjGYAwW9cmVYhf2BKsIDy0nAYUP8dNL1lW92MXMxlAHuU92C0MctsLVBpe9JWlTqDzj5TRE5tL0PJ55IJ7rgFT0zV8XtDdOpawk04a9JOnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CH0PR11MB8141.namprd11.prod.outlook.com (2603:10b6:610:18a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Sat, 17 Aug
 2024 00:58:14 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 00:58:14 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v3 4/5] udmabuf: codestyle cleanup
Thread-Topic: [PATCH v3 4/5] udmabuf: codestyle cleanup
Thread-Index: AQHa7WAVJsbb3+TxEkK4kX0iQBkXd7IotK5A
Date: Sat, 17 Aug 2024 00:58:13 +0000
Message-ID: <IA0PR11MB718543BE49A8C394C5CC32C7F8822@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240813090518.3252469-1-link@vivo.com>
 <20240813090518.3252469-5-link@vivo.com>
In-Reply-To: <20240813090518.3252469-5-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CH0PR11MB8141:EE_
x-ms-office365-filtering-correlation-id: 789c1a29-b239-4204-0fd0-08dcbe57ac36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?1sV2LCzXRaejfiFBWeaZhLWfEacWEe46dnXX9rCX7XH1CGsTMOZdGOiIfM?=
 =?iso-8859-1?Q?JyQOEe9CaI37iZHWhWnE61CKi8KszAwIkRHgcopCe1qSO3z2+0dQkwvk1D?=
 =?iso-8859-1?Q?O1f9agp4w4Y65LdvdF5r9e3QeOcTakbcFn4H1vFvE7AHMqzeZc8DTQlIZ0?=
 =?iso-8859-1?Q?1lHz1DpV91FSYDRHHd+5dfuH1onpH04HbtKTHICu6YUIHRP12ovUumBulj?=
 =?iso-8859-1?Q?lVOwhBXnssW+wbg5LnxRFisWwpqpsSkCXSznuYFAKFOpuX1MuJTK8u81mK?=
 =?iso-8859-1?Q?dBobS3YohNr84Z5cZ0SnXwM6xvxZSPkElkV+glEeGMwmNjFJYiZL6+LAhF?=
 =?iso-8859-1?Q?4xI7w29bfGXwbxKMdUMBmyL+ZHzqwdlFsY6lSyD5re9kvqXPLvRNSx8IMr?=
 =?iso-8859-1?Q?unYcri0B3q4Av9CA1Fq9lD2Unbnv5R/fp5F2/UbAGDCAyz155B2TyOglJJ?=
 =?iso-8859-1?Q?FTzhoq0ctOal4MJsqHQ1fHtpotVQaHqAPRX4OEblXKJNnfvtCEPWNzzBvX?=
 =?iso-8859-1?Q?oBvSgaS43CrdRGa3h9hUg3gfahYqFL+AkenMKWZnqpi/OaTAVva0c4v2xl?=
 =?iso-8859-1?Q?bsHrJpKGAxMOknnoYmVgvxuV2zcTMta2L9vKKV7ngSLN2Ox8EI7c6Gzk06?=
 =?iso-8859-1?Q?Ej0kLYIjxeodJbA5COnwnExY21fmzDQCtRmvG6dK1zLfT4ThdYIMz+Yhu9?=
 =?iso-8859-1?Q?pg24vO8uuFif02lvhxlic9k4zzy+6v1jS3ct5Wl81xvJjo2wZbR91j3yog?=
 =?iso-8859-1?Q?BwrB8WmnK74mct131TTKdw718PRf5Ma0K8Cy8cEoHku1oXPVo5aWP33aob?=
 =?iso-8859-1?Q?tQQfWfHAqc/W3/0mczapEsCzK4CaiIztmJEW8qNeyqkVtneSFwppUTw8FM?=
 =?iso-8859-1?Q?pGh9ofE2IHgWnhOzu3R+KP3FHwgmFLcpxEqzUQS0wpw6k1bFJs6KaGu5Ra?=
 =?iso-8859-1?Q?qDpvCRMaOvck9QH/J2mFmQ9O/+3LTEnquX3dAtGRRljAbO0spKqJ1/FhRy?=
 =?iso-8859-1?Q?/TJ/cxOtJoZ8e1wCm7wxfeZFQ2AYnFeW2RwJkBJ1mUbjYXT9rfcjJous6j?=
 =?iso-8859-1?Q?ugDtE90NUFtIHc+o2RLA1OJXNTy7JT36jhfwPKxIxFa+sNiVddujzY0YMF?=
 =?iso-8859-1?Q?5ZX2TG6g0poyqWPuxmdu845tiROcHcWvOPtC7ktD8wmfvcdKXUsxl3lQSl?=
 =?iso-8859-1?Q?3FGU4G7FHczxHmuf+hko7ZXCvwyiuFAYN0rNx4Cv3xKqKofPByM3T64yyz?=
 =?iso-8859-1?Q?N6b7gIvYuNixrBw/+dH/Z1NiNy4ZzNQ514BUkv/MjaRxMOslTGVNCzqzCq?=
 =?iso-8859-1?Q?agO2a1DRdcQFzG6dbesNHla2PBnLTbDV2SBtrxH+rp/qHNK0sDViIy6s+V?=
 =?iso-8859-1?Q?TCU84KQOtM4Q12R8MLkmRXc0puYapVgWujq/y8Q6JpYv0ejkAAV1Qxcr9k?=
 =?iso-8859-1?Q?t61/WwI/RIMKmsoR8oiJ/bv+Hlm3NS6ivVkzhg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hNpSUsaQ0CxSoG6Np4f82MalvHgqQKn5tC6eaokuVoe68LaddbCwdZHwXO?=
 =?iso-8859-1?Q?rSUbfzIAtkcRaKcY1P7DdiwmLWToW3RysdVmb+INStEURjOwX1GN0CEz3i?=
 =?iso-8859-1?Q?JS2hGF0ckFXS6KwjgQ9GAZAoAWxh0U1df5NMy3HjOxC2rpQQWm88byscIW?=
 =?iso-8859-1?Q?G0X99yc86RRGBfYhHRdesHe6WFCxCu7pR3yT5CztW2N1h4RD3ieHIK9MPW?=
 =?iso-8859-1?Q?/CJDh1NeD2W+Qldo3SDCZmrdfdvo9IYtfPigna2fqNwJbPcTqVVexGmKwd?=
 =?iso-8859-1?Q?71zG2yTNzPMbMGIw0Cpa5007OH27v6rTV5vbX8wiXv8VXnCpt+p3k+GQrB?=
 =?iso-8859-1?Q?Nz/AtinB283bSY5MDbD1dvk8qtXC81e4PEKnhOIDTWD9gxrvUiavjdZj9n?=
 =?iso-8859-1?Q?c1iOermQYk+mStCDFl92k5R7FwFtIyhqYh+Zn7YgHyOKiNyOGMbQTojaxi?=
 =?iso-8859-1?Q?+hJcv9SLPQjVkb4AZAofF9ej1xpepsgTNm5xeU4Rfe+61vnJ+SvOCPloTw?=
 =?iso-8859-1?Q?192J1NR1OqluwrvJWx8yZ24TcFMwfpOE7U1RTUsom8rHehwM2VUwwdMp4N?=
 =?iso-8859-1?Q?DPD7Vu1zb+f//e+ThO6PkYHl8Pf9HA62pUhwxRE3XfWrwAosHq22Bmk5Qa?=
 =?iso-8859-1?Q?423HDPKCqeD3THaK1DGpO7eFAmQvvnK3bjF+QmcFuVG5knOcPNGiA+P868?=
 =?iso-8859-1?Q?VfMI6kv3+xzvGWz6Job/+D0OsC6FeS3OEgdGAo4jkyWNFIriqvMkoWXLut?=
 =?iso-8859-1?Q?Y/h0bwZKchqBgq4eK8Dr/KWeS4AKlsI+4dtpociaCjSpIV+4y7uxn2kkbC?=
 =?iso-8859-1?Q?kXyCFnO8uc0EB2r/BK5ynGCzK2zV+grCp+O5pAepooORL4U2d0CLY+7LF/?=
 =?iso-8859-1?Q?gTe/fIkAkneYst5NUcu2tD20WPBMTZBcVU9ynpKo/h3+2YQzYaImca3b/m?=
 =?iso-8859-1?Q?uwjKGfu2J5zAkb3z1r6kBj5seT2EHeH+62xKqj7s5vKpOMTpLHTHxqBaeM?=
 =?iso-8859-1?Q?NaABE1tp/hMGo0idrqzME+AMbQq9UKR/fD7LwvgTn6HKAGzQodDWteWe52?=
 =?iso-8859-1?Q?U17nuC+nwQ+6VerFqjp6DVTQyE0DUmywSTeOsxsjTbv0uB/FT6kf5hr2y/?=
 =?iso-8859-1?Q?3HHk0+Iqz8FR3g3Th1xpcVjLriNetLComKJTnE4KUM2gURrhQrPOB2Q2KJ?=
 =?iso-8859-1?Q?m0J7or9Ts4C5G1WlAKlgI1P9VyOxzSsZp2NEOuyYBKB7c9UVDckBSqYhcl?=
 =?iso-8859-1?Q?HaKVKiRVGDJb0dxekVbyd87YGOso91kbyq2KAelNshk3s8eaV+iFAATMgQ?=
 =?iso-8859-1?Q?1ZCQS9CANRbvc+tajFbiZda+ULe6fdpkpJghPqVWMJGmm1us2dwDI14OzB?=
 =?iso-8859-1?Q?rMiFKSbCp2s5FDR/OCGR0mLqy2pZeLTAaeXpF9fOKo3xGKtOuktq2OshAQ?=
 =?iso-8859-1?Q?K7epWJon9jKshO239Xwa03my0BpiJjEjmY4f0s8ITjS+eap81FI2OWXyhx?=
 =?iso-8859-1?Q?o9IconQF3efcr02LwdZ/eKGe56uVRxESrN62mWertcOi4oAHtanoy975rZ?=
 =?iso-8859-1?Q?QECdlAf39VE8N2JplW9UT1b/y7C7sniVVdKdiyKIDQEC6Pv7v2WJy3UfG0?=
 =?iso-8859-1?Q?SxvR56tM+Jymat/IxsMDcu2SDuGURWBQVo?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 789c1a29-b239-4204-0fd0-08dcbe57ac36
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2024 00:58:13.9924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f/SD1UfP/8VWJ1ObfG30YJ8Gv8YI10k0mU1CbZbB/FQg5/Zcjf/dwIeRmSGaWLAMqc8t8j3SgEhlpl8t6TvE1vzoe11dA8lq3gAfjN0sHWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8141
X-OriginatorOrg: intel.com
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

Hi Huan,

>=20
> There are some variables in udmabuf_create that are only used inside the
> loop. Therefore, there is no need to declare them outside the scope.
> This patch moved it into loop.
>=20
> It is difficult to understand the loop condition of the code that adds
> folio to the unpin_list.
>=20
> The outer loop of this patch iterates through folios, while the inner
> loop correctly sets the folio and corresponding offset into the udmabuf
> starting from the offset. if reach to pgcnt or nr_folios, end of loop.
>=20
> By this, more readable.
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 65 ++++++++++++++++++++-------------------
>  1 file changed, 33 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 4ec54c60d76c..8f9cb0e2e71a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -296,12 +296,12 @@ static long udmabuf_create(struct miscdevice
> *device,
>  			   struct udmabuf_create_list *head,
>  			   struct udmabuf_create_item *list)
>  {
> -	pgoff_t pgoff, pgcnt, pglimit, pgbuf =3D 0;
> -	long nr_folios, ret =3D -EINVAL;
> +	pgoff_t upgcnt =3D 0, pglimit, pgbuf =3D 0;
> +	long ret =3D -EINVAL;
>  	struct file *memfd =3D NULL;
>  	struct folio **folios;
>  	struct udmabuf *ubuf;
> -	u32 i, j, k, flags;
> +	u32 i, flags;
>  	loff_t end;
>=20
>  	ubuf =3D kzalloc(sizeof(*ubuf), GFP_KERNEL);
> @@ -315,22 +315,21 @@ static long udmabuf_create(struct miscdevice
> *device,
>  			goto err;
>  		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
>  			goto err;
> -		ubuf->pagecount +=3D list[i].size >> PAGE_SHIFT;
> +		upgcnt +=3D list[i].size >> PAGE_SHIFT;
>  		if (ubuf->pagecount > pglimit)
>  			goto err;
>  	}
>=20
> -	if (!ubuf->pagecount)
> +	if (!upgcnt)
>  		goto err;
>=20
> -	ubuf->folios =3D kvmalloc_array(ubuf->pagecount, sizeof(*ubuf-
> >folios),
> +	ubuf->folios =3D kvmalloc_array(upgcnt, sizeof(*ubuf->folios),
>  				      GFP_KERNEL);
>  	if (!ubuf->folios) {
>  		ret =3D -ENOMEM;
>  		goto err;
>  	}
> -	ubuf->offsets =3D kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
> -				 GFP_KERNEL);
> +	ubuf->offsets =3D kvcalloc(upgcnt, sizeof(*ubuf->offsets),
> GFP_KERNEL);
>  	if (!ubuf->offsets) {
>  		ret =3D -ENOMEM;
>  		goto err;
> @@ -338,6 +337,10 @@ static long udmabuf_create(struct miscdevice
> *device,
>=20
>  	pgbuf =3D 0;
>  	for (i =3D 0; i < head->count; i++) {
> +		pgoff_t pgoff, pgcnt;
> +		u32 j, cnt;
> +		long nr_folios;
> +
>  		memfd =3D fget(list[i].memfd);
>  		ret =3D check_memfd_seals(memfd);
>  		if (ret < 0)
> @@ -351,38 +354,36 @@ static long udmabuf_create(struct miscdevice
> *device,
>  		}
>=20
>  		end =3D list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
> -		ret =3D memfd_pin_folios(memfd, list[i].offset, end,
> -				       folios, pgcnt, &pgoff);
> -		if (ret <=3D 0) {
> +		nr_folios =3D memfd_pin_folios(memfd, list[i].offset, end,
> folios,
> +					     pgcnt, &pgoff);
> +		if (nr_folios <=3D 0) {
>  			kvfree(folios);
> -			if (!ret)
> -				ret =3D -EINVAL;
> +			ret =3D nr_folios ? nr_folios : -EINVAL;
>  			goto err;
>  		}
>=20
> -		nr_folios =3D ret;
> -		pgoff >>=3D PAGE_SHIFT;
> -		for (j =3D 0, k =3D 0; j < pgcnt; j++) {
> -			ubuf->folios[pgbuf] =3D folios[k];
> -			ubuf->offsets[pgbuf] =3D pgoff << PAGE_SHIFT;
> -
> -			if (j =3D=3D 0 || ubuf->folios[pgbuf-1] !=3D folios[k]) {
> -				ret =3D add_to_unpin_list(&ubuf->unpin_list,
> -							folios[k]);
> -				if (ret < 0) {
> -					kfree(folios);
> -					goto err;
> -				}
I can see that having a loop that iterates from 0 to nr_folios is more intu=
itive
compared to the previous version which was a legacy carryover.

> +		for (j =3D 0, cnt =3D 0; j < nr_folios; ++j, pgoff =3D 0) {
Can all the code in this outer loop be moved into a separate function? This
would reduce the length of udmabuf_create().

> +			u32 k;
> +			long fsize =3D folio_size(folios[j]);
> +
> +			ret =3D add_to_unpin_list(&ubuf->unpin_list, folios[j]);
> +			if (ret < 0) {
> +				kfree(folios);
> +				goto err;
>  			}
>=20
> -			pgbuf++;
> -			if (++pgoff =3D=3D folio_nr_pages(folios[k])) {
> -				pgoff =3D 0;
> -				if (++k =3D=3D nr_folios)
> -					break;
> +			for (k =3D pgoff; k < fsize; k +=3D PAGE_SIZE) {
I think renaming k to something like subpgoff or tailpgoff would make this
more easier to understand.

> +				ubuf->folios[pgbuf] =3D folios[j];
> +				ubuf->offsets[pgbuf] =3D k;
> +				++pgbuf;
> +
> +				if (++cnt >=3D pgcnt)
> +					goto end;
>  			}
>  		}
> -
> +end:
> +		// update the number of pages that have already been set
> up.
> +		ubuf->pagecount +=3D pgcnt;
Since pgbuf also reflects the total number of pages (or folios) processed,
I think you can use that instead of having to mess with pagecount.

Thanks,
Vivek

>  		kvfree(folios);
>  		fput(memfd);
>  		memfd =3D NULL;
> --
> 2.45.2
>=20

