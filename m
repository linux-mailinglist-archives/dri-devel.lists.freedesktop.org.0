Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965A3CC17A1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 09:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD34F10E726;
	Tue, 16 Dec 2025 08:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mwrlre0A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F1B10E758;
 Tue, 16 Dec 2025 08:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765872607; x=1797408607;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wsXqudzwlcbAnR2Ey5LpJYKkwnq4UkN0+N3kajfcVcU=;
 b=Mwrlre0Au/0xSeAJa6dqPMP3wZDbWznHbH6rGxzytsxxKL/PUZG0mZFm
 uYQtE0j9qjQMNM4J4PXIZ/Uf9bj+NjHYnnUYtmcjrBCaGwJNxBN7pHAdl
 6kutPe35JrbHYBbytpyZU23+Uu8bGJogv/HZkZshsywE/zThsiHJi0/6U
 fX6BR6FLqx6x9hpcyW+P+jDw6Bw/lnEOFapTjzwOKyCShaswhUWW5Ijbh
 w6nOQZgLrKjmD11N1fAOGRlry0i+9gq4+jidTNLoTYhopFoJOZUvtBvbJ
 domuy3CxZdr82dCXPIkdknMba/BiqmKpa91qlDc9e3bNRC3O9mcfC83XJ g==;
X-CSE-ConnectionGUID: /WdZdr/MSjSx26deGtyG6Q==
X-CSE-MsgGUID: 7jhiGiGkRJOng+X+7/1tvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67540245"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="67540245"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:10:06 -0800
X-CSE-ConnectionGUID: jeaZijtDT8qcQHWE8xzqRA==
X-CSE-MsgGUID: mTinKSulQaiIHJrInMpbeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="202864916"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:10:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 00:10:05 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 00:10:05 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 00:10:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbX/tMawMbS1uE8aAOKhY215W9MBtxltnA+Nqlw+D29vSdezcvNRscK9/sJiXG4g4wonRbzLnJak5ZBWpPStKS/gzpAcYPRWMgtZXpOw7DxZDDtjY9gCRDQGUzbVBK6EG6RnhfVJ4l3kjVQfMgVj6MJIUW1hJ/BKKCMy2W0aHTkxuCvctX7DRax6h3TlDHZs5TPOsTLZvXpFwYRwZoU+DXyAFKr3VgMLDXcS5T2p9p3w1GyveEvWy1v4EcyerqJMRYc8mU4pAVLf8bmOPx5vUIPLxY1QVAPEuuOn8iN1BFWXmRoYVt5mIyjZT79TN4hN2oo+MnvQ+IeH/XO6bhrlbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7P/P1fqsxg5ef9ASXeAudiDmy7pMI/JhVu/8093rkM=;
 b=KHAvenmY7XSzzW6uqsMeEYXo149uW/U5dXafXs68i9tH8Qdy+SGZiM9L9I6zyWneIke+1Ng4m8RGJJs/TMAqoju3vQv0F/6lSig70cJ71HYCBq1SoZGXbWO9iDjjccEhM9jkZmlO3H7IQoebgbScBXlbX6ie7brUXKo9iFbYOb1zgXjhqdekkp/a82AYMv/hISKPULKuX7rPbSsqYH+gWTJP7DWeOwqWDViUh3CWrdl9xxfqituaQoRZby9sW2SlI4SpkrdZOhMyU6sD/n1G5SOq2ZB4iK3bLP1q4nfps6xbb02NoksOzzA+vfJzm4B0VbkCLW+eDGqMocugBR94ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ0PR11MB4814.namprd11.prod.outlook.com (2603:10b6:a03:2d8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 08:10:02 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 08:10:02 +0000
Date: Tue, 16 Dec 2025 08:09:50 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <stable@vger.kernel.org>, =?utf-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH v4] drm/i915/gem: Zero-initialize the eb.vma array in
 i915_gem_do_execbuffer
Message-ID: <yur6xh5bj5bwsp6jcr32mx5gxx5dpjd5qrbhxnaultoygivhti@vn4zbuccr5cq>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251212150611.18757-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251212150611.18757-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: LO4P265CA0257.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::19) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ0PR11MB4814:EE_
X-MS-Office365-Filtering-Correlation-Id: 55aba05b-19e8-43a8-5a35-08de3c7a8362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzJFS21pVEorQ2x2ZERDcVIxbjBWSUc3YVpBZnVER2lQMS9CTmNiTFVJVzBT?=
 =?utf-8?B?M0FjeTgwcFlhSFE4cThwbjlITkVSdVozdWdMaCs0M1NVOGxOdzhKMUExYXB2?=
 =?utf-8?B?WE51bEdYMEgzQ3FLVHgrL2dZbUQ2d2NKcGNxMU0rbncrZE93MGc4Z1pDa1I4?=
 =?utf-8?B?S0JvT0JHNnVYVXNBYTJqc3UvU1JWbmcwYXlRZFhQaCtsaVRPb3AxVDgwRVRQ?=
 =?utf-8?B?YUVlWEJOVk8ycHhVcTVFYXhRN1VtekFicDd2T2dzS29jdGdzSDQ1MWpEM3ky?=
 =?utf-8?B?UjdIM1Azemt1M2l3bjlvWFl5M3ZZRmZjUlVIYWRLR2ROM0MxdjFrNnJMc0VR?=
 =?utf-8?B?UzRmam05bTdCU3FkV1F3UXlBWFQ2MWwvMVFCNXFpR01zSHM3RjhnR1NCdHZJ?=
 =?utf-8?B?L2xJbGZ3SDVLZGxDZVcxTWx6cHRXNFhWK2Q4T3VyZGZiUW5jVURqRjZrNXBG?=
 =?utf-8?B?cS85Y29PNkZ0WVpydGhYajB1OE00NzY3WDZ3dVhIakQ4NTVUcnorUlV2UmZs?=
 =?utf-8?B?STRYa3p0bXh1Y3FWMnRNNUdqczNRRW1oUXN0enpIVVZTdkR4NFNSTzNSOEVp?=
 =?utf-8?B?UzlSMjhMa24xckxpU3hNSmpRbVFMUDJadmFNaFZTWWJoZDVNUXdldDAwK2Iy?=
 =?utf-8?B?SmxnMEJrRkVTdlZIeWhKdFUzUEVUWUloOUpSRXlCeHdSdmdMUWE2d1M2dFdK?=
 =?utf-8?B?d24rZE91dXM0T2dTaTBOWGkxdGhlN1ZGblcvNzJ0RFVNejg0SGpvcVVLalcy?=
 =?utf-8?B?dHVOWFlXdFo3WU9QTEdoNGFGMTF3VGpsT2Y4L0ZjYVhmdEt0VitFZzRQbTdX?=
 =?utf-8?B?Rnpza2Q4bjZPOENDZG9Nb0I5Nm5wMVRWZTJyMUhMdXc0ZlFUc0dsNzlJWEJx?=
 =?utf-8?B?aThpbXhkeENaeGhnZlJXWmZNdXdzek1mNTU1UEdIbENrNkxkUkJ0UDdIaG84?=
 =?utf-8?B?MCtUWXdYZS9yS2lkVHNEYmFBdlgzQ2VQaFpPaEZWMkRqQ0o2YTNlemhWcnZk?=
 =?utf-8?B?MjNLaEFjZnpuM2hmTS9paEdnUWxSdUdWTlo0bVp1YVJ5Y1hzRWQ4Ym1DWnN5?=
 =?utf-8?B?NUFJQWdOUi9OT1NRcC9lejE2T1pxQ3U2azlCbUV0Zi9tRTA4ak5kbHB2akRX?=
 =?utf-8?B?bmlqaHNZUUFmWUZQTW5ocjRpa2F4K2d2dHg5bHlHRU9UZlAxNlBtb0s1VWpF?=
 =?utf-8?B?R0ZTdmZabEZEcy81YU9TZUxPdnQreXRvR05GM2ZxM3FrREZzOUdkZjFYOWVj?=
 =?utf-8?B?c2VQUVFXYVZGVXM5a2Z5UXNEUGhBQS9BZlYwSVNEQTI1Mnh5TUd5K0JjalhZ?=
 =?utf-8?B?dU1DUWdFeDR0WXpLNXkzM0tEVTF2NVh5V05rQ2FrVHZvZjFMTGxBWU5rMXJJ?=
 =?utf-8?B?Tk8rbmprZTVYRzBOVFZVTldaNCt6RnJ1cjNESmlDWmV2SDl3WDlHMlhrd0Zm?=
 =?utf-8?B?VlN3RCtpQTlxL1NrQmYyZVBqRFY4aGpZTlJoQld2NS9CZ01HdWwveG4vUTBR?=
 =?utf-8?B?a3VDSUVKa0lFeEl4WTcxbzJLR3VMTkUxWmp2K2kwMksvUGlUUkhoV2ptOVlB?=
 =?utf-8?B?blRla1lTUFg1QkVNa1RlcjNTeE9qRk9DTDc5TjBEMHNEREJCM1czN3FiOHpS?=
 =?utf-8?B?OUREbnNIRjR0RVZmeFF6amIvMzRBYUFVMTgyMzU3NDAyUjhWQkFJSXFocDhQ?=
 =?utf-8?B?Smw2enJlczBnU2xtb2JRdUtqL0Z3Z2ljWUdibndWMHNTcVNKN3k5ZVN4dlVW?=
 =?utf-8?B?Q0NqdWRmdFlhMHVoWGFUdVVWUGxYaVoyMmdqZUZlYTR6Q1V5NHdGREIxU0ht?=
 =?utf-8?B?UFVkNDNjdVRlMkREUHhjTlhHWnhsczF4NlZpVlNSU3Jjbnl1OXVFY29jU1Fz?=
 =?utf-8?B?YnVURWh4bmJ6aFQ3ZUoraWdVRjR2TnZPR25BVWZpRytGRXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDZEcHE0YjBjVjJmc2g3QytxRFhaK29QdzE4cDZhU2lSOXhsS044Q3Y1a0hy?=
 =?utf-8?B?RWt2bEpMeHRUQ1pUTkcwZlY0S0RIcUN1bWRxRXJDalR0cGVuM2tiZEovZGg4?=
 =?utf-8?B?TzZXK0VFQld2ZkJFb1ZvcjJpK2tsK1UyTkdhdDJwdHQ4cnZMbjYyODlua1Fq?=
 =?utf-8?B?NURTbDRUb3Q4eXFyQ25Xc1FtamZocStuTWlLQ09LcVZwYWl1U2t3NFp1ajVu?=
 =?utf-8?B?YW5hdFlDRnJuTVN5eklud2x3VFI0SFZFUy82M0U3RndmSmlDbDFqc3FZc2lS?=
 =?utf-8?B?VVRvczNuUkJ1YmdybUZTeTZvWHV4TFgyQTlINlVjcXh5QU1pRDIvZC9wZkhq?=
 =?utf-8?B?MWlhb0JibzF0K2FiQktZdmhMeHo5eUtsa0ovRnhIWXR2YUh3VE5TRUFrRS9D?=
 =?utf-8?B?RnJUM3hld2VIYmMrTXphOXZHU2gwUGVHckhoQzkvOG0rLzU3MWhhTEl0ait0?=
 =?utf-8?B?WGRUTHd5OWFZRmRaL29ZMFRNY1grRDMyaS9CVEVuVitUWDMxRW9WVS9aajJu?=
 =?utf-8?B?SGd6THNjbUdxWTF6LytqTkpwKzkwbzJsNlV4am8ydEpKRzNRRXFxMmM2VVQr?=
 =?utf-8?B?ZWQwazExOE10RGxqRW9LYnI2aWhOQ2RHWTVsRDhYUEZLZEN2bmphdzQxWTd4?=
 =?utf-8?B?UlViOHIwMkNzeFE3eGhQMEJWUmp6TXAzZUFsTGRJZjI5eFUxL2l6LzVMN2Y4?=
 =?utf-8?B?TVJ2Rm5xeW5qRzZnaWMzdUJsS2JtMzVqNVVOMWhIeCtLUkQwR0xVQUM1SCtL?=
 =?utf-8?B?WVd4WGEvd2VtY09MNGFLbmpqYjdHdXhkTDYxS1lraVlhYVBlMHh0TjdUbWNE?=
 =?utf-8?B?V1QzbURWRk5wczZIMVpDSC9adXpDaXVkcmJEeU1zNTBZQ2N1MW9KOFVFMmg1?=
 =?utf-8?B?VFlIS0tUUFNXRmIwdmlQUmF3aVJRb0RTbWFUUjMvSjg3VVNYamhxS1dOM01r?=
 =?utf-8?B?bUR2RzBlVW80V2duOEY3YWRhbEJET0VndUtBTTc2UDM4d21zRmd5TjN6MXhy?=
 =?utf-8?B?TFlmOW1ZdzN4Z0xUVGQwL0dhOU44OEtjVVVmU0VzVlZVZTZLNHh4TzVYdkVX?=
 =?utf-8?B?MTVjd083bUFmZGJOQzd0WnIzanJycm1Pb0s4VXp4M1VRZ2diNThIcUFWZVRC?=
 =?utf-8?B?dGQxYVdCaGJySEhibHlMZkFXaE4vWC9kcVpPT1RVRXVQSHpPbUFnZFNDVEVT?=
 =?utf-8?B?YkZkTlNYVUZ6WHVTVzJiQUo1cFFqSTkyOU42U0NXNHQxWlBPTFZPUGRibHd6?=
 =?utf-8?B?YWdOMFFMTHdHbXU5emdQSUFEaGhzc3ViNFZ3T25yVVVXblRpMm01TkZER2hN?=
 =?utf-8?B?SUVlY2hVenpRbVRjQXE4VnpXRFBIZGZVeGxFbXNqeFpIZmVIWUlmdVlsZEMw?=
 =?utf-8?B?ZGw1ZGx0RUhpWHh6d0J4ZTdiREd4R2h3L2pzMDg1Um5DS1VQaWdCZnlvWkwr?=
 =?utf-8?B?RVRBTTVCSU9lWGw1Q2VFcHA3aUw3bTM0eDBPNDRpK3RaNUFTTEpudk5DbFBt?=
 =?utf-8?B?SFZ2UXE2b1ZUZE91QUZhSVdLSjM3WVRQOHNxWXcyYXg1dm4xTkQxWGZKNXFS?=
 =?utf-8?B?NU9qMFdrVFM0ekVtdStoVjhMcms3bWFqcE1adXhTb3RwT0lkZmJ3eGhuMUtt?=
 =?utf-8?B?aFUydEpSZkVubVFzd3NWZm8vcEZSYncvOVNrYStHZ3RlWmdDcUpVeWtQYkVj?=
 =?utf-8?B?R1dOcEQ3aUdTM1dxQmYzcUFvOXh4NCtNZlNIQWRreHlQWFRDTXZnZ2RvZVFN?=
 =?utf-8?B?anFMNGxyVnBjVFVWRjh4aUhweFdZbkVZb3c2VWZPM0NNTWJhTkErMDJjejd5?=
 =?utf-8?B?SGJTS1M3TmhQWXA4S2crS3FjeHAyZHFteVVOYlJiUERXb2t4RGZyZWs1emNi?=
 =?utf-8?B?SGpEVzJKc2lrSG5HMWRpajZuMXpnRDhtQWpVc2JnRk1ucUp3VXVPYXNVYUtS?=
 =?utf-8?B?RzVkSDlEWVRPek9INmdLcHN1NGRncHQ3b1dIZGpXcmNoNDQybzdhN2k2dkFM?=
 =?utf-8?B?NVFOWWhhYXlxQ2xFSlVncG11M3I0dWJQdjFxK1JGZXBCK2NlOXExWldtZVQ5?=
 =?utf-8?B?Y25zdURSdlYzK29xakQ3NUVYRGlkTEFrVUVpRlpXU2crcU5HQVlnUHV0MXJD?=
 =?utf-8?B?NklJOFNFQW1zMXA3bEJoR1lKOVBOWWxicVMvYUNOd2dtckJsTTl6ZGRHU3k1?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 55aba05b-19e8-43a8-5a35-08de3c7a8362
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 08:10:02.2156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMIVI6d4dEvw/b/XBVP7m9cFYulmDG36IA0qJZSioAMJk4ndH/XoGyBeP5BmIx3Yg5uwCMVdR95BzVTHsG+RRQzHsgHXXxbY8XhOlQuiVh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4814
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

Hi Krzysztof,

On 2025-12-12 at 16:06:12 +0100, Krzysztof Niemiec wrote:
> Initialize the eb.vma array with values of 0 when the eb structure is
> first set up. In particular, this sets the eb->vma[i].vma pointers to
> NULL, simplifying cleanup and getting rid of the bug described below.
> 
> During the execution of eb_lookup_vmas(), the eb->vma array is
> successively filled up with struct eb_vma objects. This process includes
> calling eb_add_vma(), which might fail; however, even in the event of
> failure, eb->vma[i].vma is set for the currently processed buffer.
> 
> If eb_add_vma() fails, eb_lookup_vmas() returns with an error, which
> prompts a call to eb_release_vmas() to clean up the mess. Since
> eb_lookup_vmas() might fail during processing any (possibly not first)
> buffer, eb_release_vmas() checks whether a buffer's vma is NULL to know
> at what point did the lookup function fail.
> 
> In eb_lookup_vmas(), eb->vma[i].vma is set to NULL if either the helper
> function eb_lookup_vma() or eb_validate_vma() fails. eb->vma[i+1].vma is
> set to NULL in case i915_gem_object_userptr_submit_init() fails; the
> current one needs to be cleaned up by eb_release_vmas() at this point,
> so the next one is set. If eb_add_vma() fails, neither the current nor
> the next vma is nullified, which is a source of a NULL deref bug
> described in [1].
> 
> When entering eb_lookup_vmas(), the vma pointers are set to the slab
> poison value, instead of NULL. This doesn't matter for the actual
> lookup, since it gets overwritten anyway, however the eb_release_vmas()
> function only recognizes NULL as the stopping value, hence the pointers
> are being nullified as they go in case of intermediate failure. This
> patch changes the approach to filling them all with NULL at the start
> instead, rather than handling that manually during failure.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062
> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> Reported-by: Gangmin Kim <km.kim1503@gmail.com>
> Cc: <stable@vger.kernel.org> # 5.16.x
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
