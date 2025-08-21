Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CEDB30794
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 23:00:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5798110E2EB;
	Thu, 21 Aug 2025 21:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N+Mwd09+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0882010E2EB;
 Thu, 21 Aug 2025 21:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755810042; x=1787346042;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7i7xEUzC9k13c/BYDUkzcOZy5YMDSeIjPDuNGcqu2ws=;
 b=N+Mwd09+C07bxxthby9Qp/MvyhdxI+M740ISkhEgaoAGh2ZiMd4/JYaw
 pRPxjaVYUwLfpcHKX6knPGH+cviN8yMsuG92NdQ3F4pMsznyyTP8C18fd
 TElQ/tcPWfkjuGkchnMuIKgNuFOb/7eCceonSgaiGe430oPWMq50gZWYy
 VkMrthL1lLIlrbG88tOIXAR118H1U+nHOwYDPL0uLcBKnAPUlGW+sAkLp
 sHYMlzNmH5RLb4YyScDf5wqj663j7ol+R4+6mpl3UZ9bmpRsmnx0WBzw3
 Xh+02l77u4N5kCNGAaRwmPY9SjDYsxuGTOSVHQtLrg+t1Nv9uMw+3iApR w==;
X-CSE-ConnectionGUID: GvHjQN2sR8WDkhH/pdKqfw==
X-CSE-MsgGUID: kOtWoMeXShqToEKE5vPK4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="83532841"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="83532841"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 14:00:41 -0700
X-CSE-ConnectionGUID: fU6/YZjjSfOaav6CXgJ/0Q==
X-CSE-MsgGUID: SCMKqRBYS82Iqlb+nkoc/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="169331332"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 14:00:41 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 14:00:40 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 14:00:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.47)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 14:00:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWLXbk+ByWjfq9zMH+i1iT5bk8POhZ73je9pvVKmtxCbTdkoftGqHGAMdvTgKpaS1Zo0wnLgLkdP+StuKK7tGEwoz1UO6tdDWypPaX/QVwuQtDRmX52rTfIhnQu3j9xmjqFiuVosVn4Lh5QaHOyBpkTx6hjG1TZghCUgyZY0XfXWmX5r5UsN2ftMz8BmLw9DwTYWo6WFOD/c3KvUPG3V0m2w1vJ20kkNw5JXBvbhyOjBGUw/vERDmnU9LzRSdn933oeaMq6R0zmf07H+dme6opvyWA7QD3Qc1234fQkblGAkrnnztmPSqLzhJeExzpPW0/rAIm2304ru4rNit4lNWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnvsPpMExLR5gYJh7MXgiTBDZslkBR/OdveoWudEiFg=;
 b=PV9UwUO1kxH7bixCbxwJAqnlKGeSwyIkpj1KMSVEmuXK6P+8nLJK29pfpZ3WfGDSBH7rOsv847q3+HFfGsP6yCH4aF9LuPNEb7u9oudYXaOLKuxKbv5bqnucu4h9CbmjcRNZbATgPnPQVyQuy2Epv7qvju4/p7lwdKU1dhFZMR3JXl0m/3yLIqkvBr7IUh87kjQLm9GrWyMoiajtPF3xQkcFELpiLuBNFkLbRV6qJeOIC3ScGeGLeCLQB/gTt1Gbn6gSin0lBJfSgO+O4mAXizLY9eSFZkTJYfZiLwHfGeM0SePATag66kP8ZL8AaU8QudZyk/SfRdUWlovUGznEEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7889.namprd11.prod.outlook.com (2603:10b6:208:3fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 21:00:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 21:00:38 +0000
Date: Thu, 21 Aug 2025 16:00:33 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Carlos Llamas <cmllamas@google.com>
CC: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matt Atwood <matthew.s.atwood@intel.com>,
 <kernel-team@android.com>, <linux-kernel@vger.kernel.org>, "open list:INTEL
 DRM XE DRIVER (Lunar Lake and newer)" <intel-xe@lists.freedesktop.org>, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: replace basename() with portable strrchr()
Message-ID: <v5j6nxynzvvlcxu3m3mkeyjv5dlozzp7ixkgc6u6hdzh7en6jh@zvzqm5n7njfd>
References: <20250820201612.2549797-1-cmllamas@google.com>
 <peqczm4644mskitmvsq5b2t4r4rs3beei7li3p7uw2nhjne6h6@a3mztccaxfey>
 <aKZUy_XZxHKLQUAS@google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aKZUy_XZxHKLQUAS@google.com>
X-ClientProxiedBy: BY3PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5c8a3b-2ac9-4621-a031-08dde0f5c7f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0RHejE1ZW1jTlFYaC81b2lFMlZMWWVlVjlEWFpYNnZVdDRSUTNiRlhsR3NW?=
 =?utf-8?B?bXI0MGxVUUIwMVlSa3pBN3VITGw2ckwwNk8rcm0ralVidUN5SkVnQm1pMGtE?=
 =?utf-8?B?eHpVRWhSWVQrS09EdFdGNGIrZHBFZTFYOWFRcThVZGZmNEl1TFVpWVNXV2ls?=
 =?utf-8?B?VFNCYTBzREg4K3FONDZna3ZrL3VtaDJnc2NZRnFVSlYvdWdjaGF4dlhnamF5?=
 =?utf-8?B?dEFHaGxlbTFiOCs0M25hbldHblluYUFpZkVqTWFxNmhwTUVwU0RvRTVCQU9l?=
 =?utf-8?B?RTRUbUFyZXAxT05CUWYveWlyVFkzNGNXZXU3N3VEK2RLdWpKeWgrc21BOFNw?=
 =?utf-8?B?elhGQ1hsQUQ4QWFZaTkrOW52Qm1jaVpuMDlPRTYrcDZBZjN3L2E1SGxxOHJM?=
 =?utf-8?B?MmErZ2lxQVB4ZHJuYWJaclJOUjRZV1JLSXRGUFZ0TUVwaHQ5YXlBcFpUVVd2?=
 =?utf-8?B?bXFBaG4rR2V5Zy9wVS9lbW85cHU5WlZWV2Q3aDdhbWszY2RMUkRhUldIZHNz?=
 =?utf-8?B?NVZRcFBKTVM2SWV3eU8ybEFxMmVkdmY0dXdtSmxhVEdnVC9wN0F3RW1qampk?=
 =?utf-8?B?aWxnWmRoeDFJS1paRWdKWEE4SnRURnVHZHpnMFkwUDFLOWVMeWNaYVU4NTFG?=
 =?utf-8?B?NXpGalZvKzd6dDNyaFkxN2ExVHd1dEdzV3pJSm5CRUgzM2s2ZXdFTG9GWnBk?=
 =?utf-8?B?MCs5SGN4S3l2QVRNU0ZESHRCSWlRYjZKeWZDTVkxejFQNW1iakF5bTdtYm83?=
 =?utf-8?B?V3lHaGhlbmVXUGhCTVhuU2FLZVJwaHRsZzR0OXYvTStueXlLcUtvY0NkU01j?=
 =?utf-8?B?T0JOcHZuejd4aVBIdXptamRqTTNZZUVnRzd1aTdNZ1g0OUEwNUhidCtVT1pX?=
 =?utf-8?B?eGRQNGF0WmEvblFwWU96OWNNNGk4NjY4Zi9FTk5zbytYYUZBREJvbUFDMENr?=
 =?utf-8?B?STYrbU4rcXMvSEE4TUFmVjkwYStGMGFzS0dFUC9WVFZKR3VhbnREMVNHWW56?=
 =?utf-8?B?TStieWtNUTZSMFdrYTd5Q1lleVZpOXVlNnd3dUd4N2Fya3hEMlN5b0hLQTRP?=
 =?utf-8?B?UngxeHNtUmloZ3JxNVhHaTYreHFockx2QmJSSTh4SlFFUTQzckFXNS9rMjJK?=
 =?utf-8?B?aHJwdXd4NmNCVWp4Wjg1OVRnZytTMEhsd3NFWXhST3hHR1lIcUY3UEZKMmVV?=
 =?utf-8?B?OWkyZHc4UkNtOWMxSDlqZUorWkNRQkZ2R0J3V0ZObTlMa2hFbFYwUFZGdjRY?=
 =?utf-8?B?ZXVZZjJPc0JOdUNtSVdyN2w5OXZtMERiQS9tSE4rTEpjTnltRnJMbnNZblZI?=
 =?utf-8?B?OEJaUTFDTjhEZmZMaFZmMnpKY3lYOUFRakk2dnBvanFPcWhheW5VNUIrSCtt?=
 =?utf-8?B?UWo3SFRmWnBaaDk1Q3k0WEd5clc2ZXdpYWRpV1l4aC9LaWVuMS9Qa0EvVXFx?=
 =?utf-8?B?VnZVbjhYVnBwZTRDODF0cGc2TVE2ekE2NkxYOEFYYnNTKzdqYUNHRU5YVy9i?=
 =?utf-8?B?VkJNb25uTjUvbmVnU2RmSVd1bTkwS3RseloxamdIWDh4VEtLWlc0NGtad3Zp?=
 =?utf-8?B?R3N5WDVwNFlIZjBFKzBHSVNFVDdPV1pUdzJ3ODdFUzFaVWluRjYxVVJJR01M?=
 =?utf-8?B?K08rbjBnYnVRZXcvbmVUbm5yRG40ZlR6WU5wb1RleG1hanJab0ZrblNmcWdS?=
 =?utf-8?B?d0ltelJtRHZlcCt1MktvU1Y1RCswdno1eFZIR0M1UkhNWjFEWmRZTkl0Zk0y?=
 =?utf-8?B?eUMvVnVoTFppTlplU2JTVGhaSVhsWUJLMDAvWEV1WTJFcENldDNydjJscjhW?=
 =?utf-8?B?a3ZjSG1qWlpMQXRUTk9zTytQbHdnemRqdUtnMytQRmZmUzFZV0NOeDBQZnJy?=
 =?utf-8?B?akM0bmwwbVNsYTdxT052ZUtyVFV4MDk3N0hLZnl1ZEZnZHcyWnpoTmViRnQ3?=
 =?utf-8?Q?DkGC7a6Y1nc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlVvcXJEaWJkcVMyTmx0dDRoWmZJM29UL3B6UkRwV3grZ3BnL21PNXhDODFk?=
 =?utf-8?B?S0hPQ1pwY21UM2xkR0NOeWlSeEZVYzBnVW4vVXVtS2ZEUVZFVnV5WmI2L0Fx?=
 =?utf-8?B?TUlOWDdWdlB1R3JWVDhRK2tPRFlpMEVkZCsvV0NjTk4vdEZYUWozenliUFNL?=
 =?utf-8?B?RWZKemZoRHcrSHd1Wng2TWE1Mk05blhZaThQQ3BBN21ZdzBySGl4SG5YOUxr?=
 =?utf-8?B?MzlLV3hLbXJjWjg1b2ZiWGtFamY0SENiN3BDNllBL3RLZ1g4cEY4QW9QYWNU?=
 =?utf-8?B?M1BpM2xlczNYcTV1TWRQWHRCWGFMTFNVeTJMejNKcjR3WlpDUElrc0l1Nnhj?=
 =?utf-8?B?R2N6NENPVWs5UTNXM0x3b3EwK05yeHdBU1lwbUxlN0trb0wxa2gyd2RWemlY?=
 =?utf-8?B?R3BqaG9QZmIxSG8zeFluVVBrVSswWlJRWG5FTENlekxLZFBXY2xxTWpNdm1y?=
 =?utf-8?B?M0I0QmhDT1RRMUQyVjZlUElMZlc2QmhmY1RjQ0NBT0dEdmFiZ1JOOVV6TVVX?=
 =?utf-8?B?bVVOeDFkQUZGVHM0eWljSVNjQnVibjBrcTNORWNVT2o0VldoT3BZZVBwS0Jn?=
 =?utf-8?B?Mi81WC9VWUM1TW1wR1FMdXFoeGNmMElJSHdHM0FSOHRaQ2g2N0k0Wm8xMVZV?=
 =?utf-8?B?RC91OVBRRWFYaTkveFNBRE5Nd2tLRHd6REI0c01reEdsRmt4RHdjZkdmWHU5?=
 =?utf-8?B?UUloTTVQSWNLR29WcE1vaC9JY2pBdU1ZRS84SHBKeGZza09xQldjc3VXUWRk?=
 =?utf-8?B?VmQyOW1rd2FJUklDOVkreUZYNEIxbXMzWVZ1UkVDdUl3QzNDOGlKYnNpSlR4?=
 =?utf-8?B?ZlZlTW5RZ1dyeDlWd2lGTkNEN0VDREZjL1Vaa1VCK0pmeXQ3Yi9HN3h4L2Ja?=
 =?utf-8?B?UCtuc1dkTmhucTdobjU0bXZPRlNxZENNU21ZVEMvUUxva0djaFhic0hpdXVj?=
 =?utf-8?B?UzJBZUhxR1Zabnh3Q0tZeWJFMmZQVzVCV0QrS0VhTkhnOUEzQmUydWpwZEg3?=
 =?utf-8?B?L2ZRaXhTbzZCM0plY040MlNoS2xCWitoM1pwT01aVUo0eCtXVzRTb2dOcElm?=
 =?utf-8?B?REJMOHg3eVFyaEtoOVlKeGEweUQzbTUrU2ZlTjNyQk9tM0N1ZWYvVFB1Qm52?=
 =?utf-8?B?YmZYZytIemxtWUU0aTVUNWJ3eTc5dnNrR1lyb3BjckZTM2tkSFVtSzRqd1kw?=
 =?utf-8?B?cjRUSGV5cSt6UTU2OVFPT0FmbjZlaEt0MUVENVJhbVRyVW5IWk03SC9TelZL?=
 =?utf-8?B?TXluZGZyTmswQWZCYkJCc09majB3TWhhbTYxbDdXQkJhZVBSMXcrQjc3b09a?=
 =?utf-8?B?Tks1Y0FhM0d6aDNHUTRDZzMvQUdEd1lJMjBUYVhaMTRJTHNiVmFxU2p6eDlT?=
 =?utf-8?B?aG1VVmFsWncyRis1a3B3MGs1ck5WZ3JLSVhwSDFmYldFVDdRQUVmUU9YZVJI?=
 =?utf-8?B?Z3VhRmlxUE1qdU0yUHc4bGNwbXk4V1gvSlF3OXJHSCtBcHN6V1FqdVZ6U2x0?=
 =?utf-8?B?Z3R3NGh3eUFrWnZpM2pocVV5OFJENnpPWWl4OGhjSGUwVlNRbUVpUzU4WjRp?=
 =?utf-8?B?OWt3VEtzVHdjYW90aHpHVWdnd2Zxb3RORnAyanc3U3dVTEhPdTNISTl5U1V0?=
 =?utf-8?B?MDBaUHlweUpETVNUd1RkTGNLV1NLdEpET0hyN0dDa2NMVlViSmFWb25NVGR2?=
 =?utf-8?B?djNuRnlwQjBGdWowRFZERmQ2VElJUm91UHh3UzEwY3BoZDNpTWtVNzcvTW8z?=
 =?utf-8?B?QWY4NGVJbGtTSitJNDBQMkZKVi9VM3Y2Z3grV3dBcWxnNEVFNmxJVFBINUZj?=
 =?utf-8?B?QURnOTdzR3dqcDZLeUpVcW5uK2VVQ3FqSFdSNU05K1RET1VicHNQMHFuL0Jo?=
 =?utf-8?B?SU5JK3psOFE5UEV4Q2Jpd0xlVlR2c3V5dkZJQkRKemNqaUNEeStpeGd4L1Na?=
 =?utf-8?B?ZDM0MEp5VVlnZ0R1aWU5YUxRTGhlMTdaOGJoc3hDeElnMWUzY3YxdCtQei9n?=
 =?utf-8?B?Y0JuUmIrSzNXL2xRS05xV1dpVTcrY1dDc2Vpb21EdFB5eGI5Wkp5UnZRSVEv?=
 =?utf-8?B?bWFoVG83Nno5aG9JVTVyOHorMHVIeHhvcVBqY0JaSXE4QjF0WEVNTWIvZmc2?=
 =?utf-8?B?ei8vWVhFNnp0aHQyci9hOHBWR0FuczAvSWxNbWloK0RkTDY3MkFFcVBMOWxy?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5c8a3b-2ac9-4621-a031-08dde0f5c7f2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 21:00:38.4721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmg/jmXbxtbaf1X9+K/snYxvolMpZo3KXGHBfLLTePr3rHVmaQ7/vX0HGMnW257nj0o0uLdd+zC2iT1djkt2FLfDD1EKnsQQwB+M366qPwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7889
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

On Wed, Aug 20, 2025 at 11:05:47PM +0000, Carlos Llamas wrote:
>On Wed, Aug 20, 2025 at 04:15:47PM -0500, Lucas De Marchi wrote:
>> On Wed, Aug 20, 2025 at 08:16:11PM +0000, Carlos Llamas wrote:
>> > Commit b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
>> > introduced a call to basename(). The GNU version of this function is not
>> > portable and fails to build with alternative libc implementations like
>> > musl or bionic. This causes the following build error:
>> >
>> >  drivers/gpu/drm/xe/xe_gen_wa_oob.c:130:12: error: assignment to ‘const char *’ from ‘int’ makes pointer from integer without a cast [-Wint-conversion]
>> >    130 |         fn = basename(fn);
>> >        |            ^
>> >
>> > While a POSIX version of basename() could be used, it would require a
>> > separate header plus the behavior differs from GNU version in that it
>> > might modify its argument. Not great.
>> >
>> > Instead replace basename() with a strrchr() based implementation which
>> > provides the same functionality and avoid portability issues.
>> >
>> > Fixes: b0a2ee5567ab ("drm/xe: prepare xe_gen_wa_oob to be multi-use")
>> > Signed-off-by: Carlos Llamas <cmllamas@google.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_gen_wa_oob.c | 4 +++-
>> > 1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> > index 6581cb0f0e59..0a94a045bcea 100644
>> > --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> > +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> > @@ -125,9 +125,11 @@ static int parse(FILE *input, FILE *csource, FILE *cheader, char *prefix)
>> >
>> > static int fn_to_prefix(const char *fn, char *prefix, size_t size)
>> > {
>> > +	const char *base;
>> > 	size_t len;
>> >
>> > -	fn = basename(fn);
>> > +	base = strrchr(fn, '/');
>> > +	fn = base ? base + 1 : fn;
>>
>> I think just a xbasename() helper like we've added in kmod would be
>> preferred:
>> https://github.com/kmod-project/kmod/commit/11eb9bc67c319900ab00523997323a97d2d08ad2
>>
>> Alternativelly add it somewhere that can be shared across the userspace
>> tools in the kernel tree to fix the mess that we have here:
>>
>> 	git grep basename -- tools/**.c
>>
>
>This sounds like a nice idea. However, there is no "centralized" shared
>includes/ across the userspace tools that I'm aware of?
>
>> Some dup the arg simply to be able to use the libgen.h version, some use
>> one or the other on purpose, etc etc.
>>
>
>Yeah, and I can force the POSIX version if you prefer. I just personally
>think the strrchr() alternative ends up being simpler.

IMO the POSIX version is horrible. Let's add a xbasename() in this
xe_gen_wa_oob.c and use it:

/*
  * Avoid the libgen.h vs string.h differences or lack thereof, just use
  * our own.
  */
static const char *xbasename(const char *s)
{
	const char *p = strrchr(s, '/');
	return p ? p + 1 : s;
}

static int fn_to_prefix(const char *fn, char *prefix, size_t size)
{
...
	fn = xbasename(fn);
...
}

Lucas De Marchi
