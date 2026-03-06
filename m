Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGFyAN1TqmnhPQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:11:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A738D21B650
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:11:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E6810E324;
	Fri,  6 Mar 2026 04:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y4QljnL3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7693D10E31B;
 Fri,  6 Mar 2026 04:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772770263; x=1804306263;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zx5g9YyqHOqifABXko2fX31rH/GWZPGebwNB7swQ/AE=;
 b=Y4QljnL32uJjayjNOGAJRJ/l6APaG94+7tQI7rcabRuxCvDxr/G15RDv
 GSDVpyVIt1jfvdOXD5ct8/5SbO8CZxerN3drsC7hAmozvDJqdiKQNgnxg
 IixeTvNwDnUeP3sePK/kgcQfNpiZZIfPmeS6+ycbeJaBf1ZqznC1lTVep
 DF6lBXyCGDEWCjNiSvtwXcYFYVvue03N9NtT4dclSQfA8D6I9bKm34LEQ
 GOpRxStKqt+n0ahpav5o1YYFRpN1bzZ8B202KjT75lyWqy65NOBYqL79k
 SHUP6No3Q/NTpuLVTboDodCNw1v9pdewWdy3FOcW29sM+eH/b3Q2B7aDH g==;
X-CSE-ConnectionGUID: wXzry4BmRLy+UhonC7lqJA==
X-CSE-MsgGUID: I6aElD/7QD6yVX5/Yy9yoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85222797"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="85222797"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:11:03 -0800
X-CSE-ConnectionGUID: 7CDBde3pQi2OJCfOgRPO/g==
X-CSE-MsgGUID: iJkxxxk5SSqwdYKas/R1+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="256797686"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:11:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 20:11:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 20:11:02 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 20:11:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYcYsOxAs3PIuetbkVAqzbUBa1dDkkl99vCQ7bITHFYFN+TM6c9moQQd9OBDEJBfb27YBPmI3ux8Q17TKJGaXaJ9cV2qDJGNXpOBLZ7kYH5Kv1d8o9K5K5yBH13D8I7ha1jnssrr4EcvxP8UcKHt7uB+9Toh89L8iT8rJ+A1SxnbHDU5Bp5CZtq8jW3/fnOZeUStnuCAfHTMWckAv/e8RCCX7CxaQbv0MPPT2X/7k3wQi2CneuHDw0j0LswJFOOdR0UNZOnDHIuP29sM9DsUzZ1PDwDwz80TRtssjIiYPcsPq+9Emb5efrNSJcLErHU49814aT/s9bscNxV8V8jkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqkZIJo9GjhIVrDpovApgx5TEzHZHP10NXKn91m6pjc=;
 b=M4Yd4L4OhtwTfAZVbepXdBL9tV8a5G8n7swBVz7nA27TXExjcuKkRDXhOlHzO02iKge8F7Cd73f+Uvik4oIbSB48kNiT+5wf34Qaf10by/W9pxHLyevVfFzYP2DejnZU35nzl0/RGP/QCpk9LSWGbruDSfS/YezmGFD5u24WLvQr1VsNxZ25NKu3hFaOB9gcnFcLWtNpdN5D/cvn1Bv0/oCN+vg6yfyFzCv7aovRgp6R+qO90UKGf3ZeL8YK9r5PzKNyDwBauYZjDG/LLwVcgrmz9XH8bthbMw/i3ERrfbkQRNqxdcK8X/5lKJX6ho/aE64xIlodGKHvMEGQXn6Vyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 04:10:58 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 04:10:58 +0000
Message-ID: <66b630bd-d9c5-42f6-afc6-f670a40694d6@intel.com>
Date: Fri, 6 Mar 2026 09:40:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] drm/display/dp: Read LTTPR caps without DPRX caps
To: <imre.deak@intel.com>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
 <20260305-dp_aux-v1-1-54ee0b5f5158@intel.com>
 <aamvgGUPH-SWA7Yh@ideak-desk.lan>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <aamvgGUPH-SWA7Yh@ideak-desk.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0114.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::11) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SN7PR11MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a509209-26ea-4979-2af2-08de7b365ea2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: fSL/GThS/MUQr9rmrKRwXdGr2Dl8xXvK4VzlHe/ZG1M2BBIjINvnfQncH6f2ddmh3BPm3IK5qCAUvsTFChuQcVYz1CVwfFwcRF3VfZX2K3Vb0LAOkFz2nMmvl6zxJ0PJU4Y+EmC7yYK3EVL41jlaspygb+acCKbHF/hRuZnCo59yhJXASWx/jJnbquH0QJs6idY9CymrtQsYSSym4rKtRJ7bcumkckJo1WpF2uRQef162c8fawREHdBS/eTUUGQsTUbKueTL+fBOY1mVhgUjieDGHvE+Q99jJ2zIqRj5jLNLEx3Kz1aLLBjLla4Kc8e56CKkXw3X1hs1R8idybRr+590AOYld39jUZP1/XXgpkPMX7Vh8DbUpzbP3ag0SytBZvDWqHX6Ct3e8Tp7TAM4uamngj/XNnW1kp5LD3J1JJgjxtzVvscoSkvOgeC90GjiTdIGSB2ADOSgLNSnEXaEDXBL3Ec4zIoPCqh9+ujl29I+c1aTatXLP5/B0V05SW9wGKj3YFlh0PPcMGhtxwciJlSP0u1oKqqR8224AjTvRc8JuQ6lBI1pFRxtsQFEi0oS1fUAo1v/KDKSNx2HvO5Wu7z8rY4axjaE3+0dldptAOFokWUN7JGBYAxfgBf7bO5VSPSFqPW2rHpoX1lBWmnrJuqpKuXtbgBXHbiE4Gk1NK38hSbfmqmpH3B0tFOgQ2L0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ulc3M0QvZHI0UW5zVkZ1ZFdiU3BuUGtKa3pZTERNclloMU5TUklyRGNiWUdk?=
 =?utf-8?B?c1dSQWFYTjRzT25BbVU5WHJxdWdVaEFQTVovdDF3UzZVUWNBNXdGUmlBbU1Q?=
 =?utf-8?B?K0x2VUVhZUxvQXcrbFVTeVZVdTVCNFROMGUzam9BVWl5Q1ZWMDlxaCszTUcr?=
 =?utf-8?B?ZjJ6RW9pRkdEeTlRMnh3d1lQQzQ1aFpQMHFLNEorY0VDZHE5Mm9raCtqUzlC?=
 =?utf-8?B?bnpOWDR6V1VyL1ZKTnFDWmlacU9Nc2RPRmMxUFFENWVGTEpJY2M0dlAvaTli?=
 =?utf-8?B?bXdUMk5zcFdnb25MMzc0QmpWT0VWV2xRK25aRndCalMxcFFNdHBlbThVSTdL?=
 =?utf-8?B?S0lrYVkwUVk4UGdBRFAwV2ZMUndUOGVNcjNCc1llakFmWk1EWkRyV29mMS90?=
 =?utf-8?B?dGNXR2IyQlRCZGdaL2hBZy9iOU5zQWFqYWJyUSt3TkVOcEdNM1NRNnZyMGFC?=
 =?utf-8?B?Rjg2WXlPMGNRc0VBTnM2WDMwOStnS1BpbnhHZEFSKzF6M213aFhRWFdxMWQ3?=
 =?utf-8?B?WlpWZnd6bm5CeEFmQklYV2IxWmQ2ZHZHZG05UU9hcWJkNVBXZVh1WDBqQ1lj?=
 =?utf-8?B?dEJXTFJGVERCL1RZYmZaUkRXdVBna0FFekZCbXl1clp1Q2tlSTVLNGhjQ0Fn?=
 =?utf-8?B?Tk1YbWphY20wTlNvOUpMd2lDWmFsN2hTeGpiRHI2WjhYbHdSK1JhbEFLb3pC?=
 =?utf-8?B?dGErYlZwRWg3VENOUWdLWnd3Ti90N3JwWHB6Q0pzUVh1SUZMNkoxeE5HeTlI?=
 =?utf-8?B?NTNORmx6bUsvVFMzZy9UNHZqT2NvYzdWd1grcHBDMlVwOWJzZC9uVUhBVUVa?=
 =?utf-8?B?NUJZZmNNbGtBZk1RdEVDS0tRRDhoWTZYMHZ6T0padVFhU0RPRjJpUVVhRW5m?=
 =?utf-8?B?aU01SzltTVBPdUhWSzRjUkxVdjVRZld0R080TzEwK2g4Zm9vWXZwQ3ZaZkV3?=
 =?utf-8?B?aGJEQWc0ajBOQnZoQlo1Sk9iWWExUkppbTRZUEVxdjJnNXJud1daMW5WN1hl?=
 =?utf-8?B?SlFnT0VUc2p1RUZFdXU4YmRDYkxTNWtZQi9FaDlVY2Q0cy9zeHFNd3pHSDZo?=
 =?utf-8?B?TnlSUDFPM2dwWkF5R2xXdmV6SVY4eU9aNlh6TEY0K0JFdzJydEtCWFgvRVZW?=
 =?utf-8?B?cmVWUDdZWGRSVFdZMGlWcklDRWdRV1kxWjFsUk04RUJDeVhjUndaTUtqWFJV?=
 =?utf-8?B?WlJJVHJuTTZtVTVtRlFBSW9VSWhERjdRd044OElJMFVVdDg2dnhaVzJoY3gy?=
 =?utf-8?B?WjRWT2szdUJ5TytVRU15YjNURzFKNzhDMzdUdHhzeTlqRDc0ZDdEem1uNnZI?=
 =?utf-8?B?c0wrUEtQVnVoN0pKakptWlZ3TVNnWnBrQTFPZGM4UmdyWngwK280SDNER3hu?=
 =?utf-8?B?Wk0rZTFZTndPUFYxTkROOGE4djZZcUVTS0hTMXBsRjNXSGI4cUtoR2thVlJz?=
 =?utf-8?B?QkEwRVArRCthNGdZU0dFaFJtVEEwc0dDWUorTUJSTndXcnJZUDJvNWRPZUI4?=
 =?utf-8?B?bW5JdEI4bVRhNW1kVU5iSVNKV1h6ZmcvWURnSUFQRUxQVi95anlhWW40T2RX?=
 =?utf-8?B?elowZUpGUEl1SlpJYm5PMlhpemwycHlBVjVsNXBVeVNNMCt4VkRKNGJXRGVW?=
 =?utf-8?B?ZXQ0dll6bFN3TVFZaDJWQ2o2MGJzQU1yOVdPMWl6SEtjRmVnRmxQeTlFTE9r?=
 =?utf-8?B?OGJld0V2bjdOVFZvNG1qRU5JZDdkNTdLSHN4MGxhNk9zL2lVdFV5YWdGOHhx?=
 =?utf-8?B?NkpsOWY0U3BOdFpKdWErKzljMjhsSGF2QlgzZUVpa1JWcUVTaGJTM3JUdDEv?=
 =?utf-8?B?NkNYdWFEUEw3UkdIR2pXRE90S3UvZi8rMkRwa0tNTVozUGVDbDlWbnlGSXRo?=
 =?utf-8?B?SG9pZytRRmVsUkcra0kvRDRKbkRPV2ZielVJbVRmamk3MWdkSENLT2FlejNi?=
 =?utf-8?B?cWljUldIL3hOOFNRbndaNUhUcS9VWWVqZGt6YWVmem1TQlpOWkRBWW5TeTJI?=
 =?utf-8?B?NVJ1YWJHZ2hFeHQyWEFQT0ZycVpPcXN5cFZBRzFCVDdzYlZ4SGlTSVVMSDVm?=
 =?utf-8?B?R2RnVGpqNU42aC9BMzBHaWlZakZYcitxc1NHVmMyREp5djFEOVJjMUprdlFr?=
 =?utf-8?B?UythSzBvOUJKdHJnaVZVQmFyR0g1OU5QeVEvTlFxQkhXQmswdWtkZ2FzcUxZ?=
 =?utf-8?B?TmtoQVJZNGRmUFpVUUNmWE9SWVZTQnBZVUxLV2g4WWovLzYzQmFoV2xGczdx?=
 =?utf-8?B?SlBLTzRZUnJyY2RNUW05VHVma05XS0pZRi9pUVc4b2pqRmVtMWkyZ0lhUWRB?=
 =?utf-8?B?TWNQcElkUVJMamkzKytzK09QaTZjR1FVVjQwQjIvNEEydDlpVlVLZz09?=
X-Exchange-RoutingPolicyChecked: UoLtaMeejGwc2APvBHqW7lHXsu6i8FuiuBefD3OJxy8Qvr+b9g0BBJoV6fMThC+Q8MpcOZPZjVYwGgfWov3GekwTklDl8Ls/UYlXPxjh/O8Cqr3ylWxLSDVf8A4/7JxfuYwVPQaJasBfme+hZD7ZExmMFDHIFOciZEuSEM0wKS+T81mLtS9/4pEVRg2BPncnwBU8BxWK4jv+vJmQYHWSBW3LUr0bfRlq8a29tU2qH+fnVEqVrLc/+Qs1ipywxsX6CHtQtoGrGpmqD/7ic6IL60Svh8m5TVLFzpjIHlCxV7FJaZj4LYDeaavHjRTsp83okopUc1/tCoTek91UarEvGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a509209-26ea-4979-2af2-08de7b365ea2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:10:58.2324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wINGSgHX4pf2b5Hyhm0hRsRTV+RCe3XdfQbHwqrN/z1duoeSjShDrBU8HgQBxp7qZBNkg9jeouNTIyNDrhuf4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
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
X-Rspamd-Queue-Id: A738D21B650
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action


On 05-03-2026 21:59, Imre Deak wrote:
> On Thu, Mar 05, 2026 at 01:48:11PM +0530, Arun R Murthy wrote:
>> We at present have drm_dp_Read_lttpr_common_caps to read the LTTPR caps,
>> but this function required DPRX caps to be passed. As per the DP2.1 spec
>> section 3.6.8.6.1, section 2.12.1, section 2.12.3 (Link Policy) the
>> LTTPR caps is to be read first followed by the DPRX capability.
>> Hence adding another function to read the LTTPR caps without the need
>> for DPRX caps.
>>
>> In order to handle the issue
>> https://gitlab.freedesktop.org/drm/intel/-/issues/4531
>> of reading corrupted values for LTTPR caps on few pannels with DP Rev 1.2
>> the workaround of reducing the block size to 1 and reading one block at a
>> time is done by checking for a valid link rate.
>>
>> Fixes: 657586e474bd ("drm/i915: Add a DP1.2 compatible way to read LTTPR capabilities")
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/display/drm_dp_helper.c | 63 +++++++++++++++++++++++++++++++++
>>   include/drm/display/drm_dp_helper.h     |  2 ++
>>   2 files changed, 65 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>> index a697cc227e28964cd8322803298178e7d788e820..9fe7db73027a43b01c4d12927f1f0e61444658e5 100644
>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>> @@ -3050,6 +3050,69 @@ static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
>>   	return 0;
>>   }
>>   
>> +static bool drm_dp_valid_link_rate(u8 link_rate)
>> +{
>> +	switch (link_rate) {
>> +	case 0x06:
>> +	case 0x0a:
>> +	case 0x14:
>> +	case 0x1e:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +/**
>> + * drm_dp_read_lttpr_caps - read the LTTPR capabilities
>> + * @aux: DisplayPort AUX channel
>> + * @caps: buffer to return the capability info in
>> + *
>> + * Read capabilities common to all LTTPRs.
>> + *
>> + * Returns 0 on success or a negative error code on failure.
>> + */
>> +int drm_dp_read_lttpr_caps(struct drm_dp_aux *aux,
>> +			   u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
>> +{
>> +	/*
>> +	 * At least the DELL P2715Q monitor with a DPCD_REV < 0x14 returns
>> +	 * corrupted values when reading from the 0xF0000- range with a block
>> +	 * size bigger than 1.
>> +	 * For DP as per the spec DP2.1 section 3.6.8.6.1, section 2.12.1, section
>> +	 * 2.12.3 (Link Policy) the LTTPR caps is to be read first followed by the
>> +	 * DPRX capability.
>> +	 * So ideally we dont have DPCD_REV yet to check for the revision, instead
>> +	 * check for the correctness of the read value and in found corrupted read
>> +	 * block by block.
>> +	 */
>> +	int block_size;
>> +	int offset;
>> +	int ret;
>> +	int address = DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV;
>> +	int buf_size = DP_LTTPR_COMMON_CAP_SIZE;
>> +
>> +	ret = drm_dp_dpcd_read_data(aux, address, &caps, buf_size);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (caps[0] == 0x14) {
>> +		if (!drm_dp_valid_link_rate(caps[1])) {
> I don't think the code can depend on what will be in caps[1] (i.e.
> DP_MAX_LINK_RATE_PHY_REPEATER / 0xF0001) after the monitor returned a
> corrupted value when reading this register. That is the code cannot
> depend on this register value being a valid link rate encoding or
> some other value.

I have mentioned another option as well in the cover letter, i.e read 
the lttpr caps and then the dprx caps. Now check the DPCD rev and if < 
1.4 re-read the lttpr caps one block at a time.

Thanks and Regards,
Arun R Murthy

------------------

>> +			block_size = 1;
>> +			for (offset = 0; offset < buf_size; offset += block_size) {
>> +				ret = drm_dp_dpcd_read_data(aux,
>> +							    address + offset,
>> +							    &caps[offset],
>> +							    block_size);
>> +				if (ret < 0)
>> +					return ret;
>> +			}
>> +		}
>> +	}
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_dp_read_lttpr_caps);
>> +
>>   /**
>>    * drm_dp_read_lttpr_common_caps - read the LTTPR common capabilities
>>    * @aux: DisplayPort AUX channel
>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>> index 1d0acd58f48676f60ff6a07cc6812f72cbb452e8..def145e67011c325b790c807f934b288304260c1 100644
>> --- a/include/drm/display/drm_dp_helper.h
>> +++ b/include/drm/display/drm_dp_helper.h
>> @@ -755,6 +755,8 @@ bool drm_dp_read_sink_count_cap(struct drm_connector *connector,
>>   				const struct drm_dp_desc *desc);
>>   int drm_dp_read_sink_count(struct drm_dp_aux *aux);
>>   
>> +int drm_dp_read_lttpr_caps(struct drm_dp_aux *aux,
>> +				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
>>   int drm_dp_read_lttpr_common_caps(struct drm_dp_aux *aux,
>>   				  const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>>   				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
>>
>> -- 
>> 2.25.1
>>
