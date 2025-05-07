Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86555AAD39B
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 04:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0535C10E73F;
	Wed,  7 May 2025 02:51:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JK4KKQeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 870D810E73F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 02:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746586281; x=1778122281;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zZ3iF+IRe9TwbsQcFlcRHZ7sYqm+nQgP8sucM9IAHmg=;
 b=JK4KKQeO5BmtQ+wv0DzVnSMyCpxCJVHggKJsr5WwLVoTfaqyqc/ojjSt
 78htvUUVN6NyaRk7qdFLC+JoWNvUS+akBc6+O+bpRW/aVDD6CsKLMafmM
 kcUz9t8TtWL8jZGSXtal3EWpoQMBQKNaG39ozxUttlRPxNGE03V/1v7uO
 kuevHXjGCRp1Ub/4pVcgAgvjiwyKjj+DAVGJGnyJGciHI/TB731XQfFuD
 Ny3vTF2c7/SI197LYcrIEFxxZqfDo0C6nu60R5iQE6R9uE0bazsKTXWMs
 1Uir1KXrdSMsNAKUz3GrQUrUF97uEwW/DOmD6bK1bsVHGVJWAIbIN6Jyt g==;
X-CSE-ConnectionGUID: EM7uNU5eTEClKET89PSyzg==
X-CSE-MsgGUID: LsbZ53USS5qTMpgyUJoYVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48372389"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="48372389"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 19:51:18 -0700
X-CSE-ConnectionGUID: asuRUJjzRzaqqCCUEATPkQ==
X-CSE-MsgGUID: rj3nKIuVTeSXuj8cos39bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="136204521"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 19:51:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 19:51:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 19:51:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 19:51:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEOfbD/l/x8vbXHRtTMHE6itAf5wSX4Q5cG7rV6NuH9yMcW7LTOdXBseYbPGC6tQAdms8yt1kX3FkbSjlUAHb27BAQ3jKNXaKn3x143/+cOB3UqTFALSyQ2FQSy0l5/WzQYFcO9j3SC09eMnn3aaNcVqN5s1pUNCRy+AR3+JPTqmThBiPNznWSaclJ2MpBOcTLxpPP8oOGYuS3u4yEyu1jF9QDRjpExrmjk2zw63AdoTeIV4d3v3gMMuwglZv+hwSCfVOIZBHDJ5qlBlIFB2JFGtp0G30TH5Cjian0IPGoDApPbdnRfOYdkaYTBzYqbNf8rusMi+ef2V6gUYGoaPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZ3iF+IRe9TwbsQcFlcRHZ7sYqm+nQgP8sucM9IAHmg=;
 b=n4qbj0WYWS/4G/ZTBx/Z5PRw9iCtClslSF35+kMuBD5kZlQoUPs3QIJyhy4WhHBjwRYUwFGBV3e4S6+6Lk/QUAR0lFXqsJh74o4ahi9Di29me4KgoFtS+zgYhCTi+gn8MdibA9u7b1F/LcNl4mwmweolu2ZZajSSMqoOOdEdHHQvegNUE0xngskxJkRKOE76mU5iUBPldkI+bK1IxSydv8x6/u8H7+hAJ61KKQHvN4CljuiU+D/bdadSUDLaNBri6dDfKzrnn9zevvA9six9OVjpTBk943YN5PT+RJEBcjgC/u5O19CHjzlN6AG20vcWpTe4HWUQUs6Nn2BTCj7Neg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by LV8PR11MB8678.namprd11.prod.outlook.com (2603:10b6:408:20b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 7 May
 2025 02:51:10 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8722.020; Wed, 7 May 2025
 02:51:10 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
Subject: RE: [PATCH] drm/virtio: Fix NULL pointer deref in
 virtgpu_dma_buf_free_obj()
Thread-Topic: [PATCH] drm/virtio: Fix NULL pointer deref in
 virtgpu_dma_buf_free_obj()
Thread-Index: AQHbuvBvn8oBNjQZAEq5SdK5DwiZdLPEPGsAgAG6SYA=
Date: Wed, 7 May 2025 02:51:10 +0000
Message-ID: <IA0PR11MB718590309CEFD76B9B9D35D3F888A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250501232419.180337-1-vivek.kasireddy@intel.com>
 <ba724d8e-f2e2-49e7-88ac-4b0ae5b49e4d@collabora.com>
In-Reply-To: <ba724d8e-f2e2-49e7-88ac-4b0ae5b49e4d@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|LV8PR11MB8678:EE_
x-ms-office365-filtering-correlation-id: d79d553a-9896-4908-787e-08dd8d1205f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bXMvSXlTOWo4dXR5aVNXS1FNTjRJQ2cyOUJhaEN3NUwvR0NMK1EzQXVvakNz?=
 =?utf-8?B?eXZwdFRvMmhxUElQc1I0dS9nU0JyNXdWWFVsNkxVdlFWblZ3K1laMTdlQzda?=
 =?utf-8?B?T0l6eGwxdGNhcm8vZ2g2emFXeVpuYnFiZnBTQWwwM0I1K2NSN3NFbVAvSi9r?=
 =?utf-8?B?UDc3QVBHOWd4UWhBYWp6cDVqSjJFMUcrRVBKVVA4UzViK0FNV0xxY0lrQWVx?=
 =?utf-8?B?TEJMcGxpMlJKY1dwamw4VjBIK29wQVhiZ1JLY2xBMU44Tis1TjlXb1NQMHlv?=
 =?utf-8?B?SDdrYkJLSk5SOWIzbS9YSmxnUkZuV1lWcHRlU0Vsc1JLeE9tVzJYOGtZNnFu?=
 =?utf-8?B?MlhmYlZicHFFNVFRMHF4RGxTOE13cUZoOGZDZ05BTTJPVk82RXFOamJqRHky?=
 =?utf-8?B?OUgzRTY0TXFUTFlGa3JvNEkzNTloYUUyVW90QkJiSE5IK2R1RFZ0cTAvc0lF?=
 =?utf-8?B?VUZPWUkwRmhqbGgzVlU3Q0lHRFVJWlBzV21hc2xpeTIxbDd3YWQxQ3RWQ2Za?=
 =?utf-8?B?WjZQNDJCR2E2N3J0eFNvQkxib0JNckdHVjk0ZjR5aXVtTHpISjY2QXVDeFFV?=
 =?utf-8?B?TDQ4WDJ4aUpCVU0vd1BzbjJvVWJqeCtaK2RzcStkRHF5dWtUUlgxM1JSc09Y?=
 =?utf-8?B?TDNwZm1jZGdHN3hHM1ZyWmNWbGRnOWU0Q0dZbUZUbnB1aUg2K3lobGY0aDFh?=
 =?utf-8?B?U25MMWdCeFVIWlpzSmp6WU9lYkx3WExaYWsvWGl5Vk9wMzdwWUNoK0llSzBB?=
 =?utf-8?B?ZStHVkhyTGV1QVl0MWRVWjhxQkp3eU03M25kYTFLQkYzRmowVE5hNFJsalJQ?=
 =?utf-8?B?UmlFR0lFbUdIbWU1TS92VEVJdXJhSGh2alhlM2g1QmVXcDk3U0VKUDJoQ213?=
 =?utf-8?B?ejZkMGJtNTJvRmVSZytCVFYwVDBnOGpITnNjSWZUNG1ZS2JFNHlwNEJqNGti?=
 =?utf-8?B?VkhPT1FGQmpVKzU1UGRUMWZqRW52ZWpPQnlYUkV1UDQ1S0VXUDVQUldZcG9N?=
 =?utf-8?B?SkJYb1psZGxLaHQ3bjdXRFg3Y092bE5KcXVjUmwwaUd1WForeDRzWVJkNjF6?=
 =?utf-8?B?ckI3dEJVOTgwcmtEQWZQYXZZMVB6QUNZd21zeUJSelozSVRPczY3UE9ONTdV?=
 =?utf-8?B?ZTQ2VGZrUm8rZ0VqR29VQ3dvVFhpVHVORGw1cElzeFNrMGttRTFOOGRkMVNR?=
 =?utf-8?B?ZWk0TU5LU1A3aVhBYUlJcE9hNEkySElQRDdFQzFqd3ZpYVJHaCtHdm1uY1Ri?=
 =?utf-8?B?ZmFxYXdHQzFBV0d1K0ZOaEtTT0xyWXdhTVppR2U5c2d5eTBQbGFJVHZDSkIy?=
 =?utf-8?B?bGtjK20zRXNzb0RxSmtsZEpDZFN4QXV0bXArbjEyMW1OeThWRkFYRno3cHFt?=
 =?utf-8?B?TkYvT2dYdG9KTHZSV25iUTdBZzF6d0J5L3NsUm10cE9IcnNocjJhQy9ZaVVI?=
 =?utf-8?B?Y2FKZmZrWkNYK2F2ZjZKTmZlNC8rRTBnUFhrcU8yMEpRZmtHQUxHdXJvUjMv?=
 =?utf-8?B?REhwRTlhT2p1Tm8xUDRHWnN0Rm1NSHY0ZTFnSWdMVG5PT3hsdjVRUjNOMlRj?=
 =?utf-8?B?cWVVaTBUMlZjODZFRkQrZk9PWU1iTmhGU3NGaTVQRFFqT0luQnhaVXB6UWNW?=
 =?utf-8?B?THVhVlFUS2FScTI0VzUwNTFUR2M5ZldSNXFEUCtHUVAzMHV2REt1UEdlL2Yw?=
 =?utf-8?B?OHZacnN1R3ZNZU52SEpiR3ZtSUFYVVdlZnFZT1dpaXdqbXdiendzRlUzU0Zt?=
 =?utf-8?B?NTdERGF4TlE3dUhzZU42SEpWY2pjYlFiS1VTMklQMFBtdzBvNE4vZDI4ajBY?=
 =?utf-8?B?T3BLV2w3VFdxdmZEeFhUWGYxMysraG5lTFBUUEhBVXJUeU52ZEVtQi9WZXkz?=
 =?utf-8?B?amZlVm1CeEVRTUIzOGdscFBvQUFKYlZTN0MzWlQxcHRLQWVkcm9NTzFUK0F2?=
 =?utf-8?B?OWFHeFlWNVA1ZTdmVEJFdlBJcHpkWjFnMEIzdFJaS1Y2WUdxbEJFYWlieEhs?=
 =?utf-8?B?LzVKT003TzZ3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZlMvNzlXVThHUjJCWWMzTjdIcVRBSk9ya0RCcE84aEludkhrang2Z2U0SUxH?=
 =?utf-8?B?cXU2Zy9oZnMwdHhNOU1pNzIwNHNwbHV0cExRcmNWaUhmVFRxOW0vTndKeHoy?=
 =?utf-8?B?bU1JWDcvSDJIRHhibW4zSUM5NElIOURWNmZBbWowZ3hoWjl0YkF5SUJjRlhu?=
 =?utf-8?B?TUNSWDVPanMycWMyOER5NGZiUzBINkRheTMraUw3K25rZzB5YzloMVpMQ05q?=
 =?utf-8?B?WUw4S2U1MU05QU94WHJndTVObHFhdERkZnQ3QmFiaUNoSS9BSDl1Q2NvYU8x?=
 =?utf-8?B?UEdGQllPNXVmVUJsZFRTcXVDdEo3ZitKRVNOdVN6UmVrWTE5clcrWjVCelp5?=
 =?utf-8?B?ZXZKRXFldk8xQ1QrckFKeW5hK0J5ZWNxWHRmd1pZODhyRVE1WjN1YWg0Uml1?=
 =?utf-8?B?eFhMdGVzaitFSmpoOHJKcDRYM0lHc0w4M2xPb2FaWmZKWkpnaXowejZ6ZERP?=
 =?utf-8?B?cm05UmhlS0s2Sk0wdEFrL2kwNVovYVNVamxzRjluSmhzbHhsWEdkRTJOdmxB?=
 =?utf-8?B?RlhIVXJKQVdjSHlidmRCdG0zMU9UeWxXd3orYVd1M3N3Sk1jRVEySy9qNXpR?=
 =?utf-8?B?V0o3TmRhVkVoYlBNZVQ2bnRrNTVvRVZVTnpERXRJQmFyamlrYVZDWEh1WnlQ?=
 =?utf-8?B?SG9kL01XVFBKZnJLb28xS2c4U0xBNmFqd3pOM0pBZEdnZE5nNm9KOUlxNW4w?=
 =?utf-8?B?dkthc2FwbTJLcU1ESUlJM0l2Z0VCeDl3YkN2M3dqZlJZbklROHVPYm94WXVP?=
 =?utf-8?B?TlhQQ21TYWFVVjNBcEdPSFpPZzVZbzlsdWRZdEkvVTMyTUFaZHBDWW4vMkhP?=
 =?utf-8?B?dTZuTzBVREh0TzNBdlQ2aFZNMWhpQUZGd1djTWx3bm5EUGFWMk9RM09RWVZw?=
 =?utf-8?B?ZmdqRGFMZFlHZ1F4a2crTFNNeTEzTWJmQk1lVzFsZTZ1SVAwSEM4WFIwR2hW?=
 =?utf-8?B?U2djbEhiUzhjNmx1NmVQNDRCbWJ4NzlLMW9LMmdGOWdBNHRuWUh0YU9qOU4x?=
 =?utf-8?B?cmpoRGJxdG4xYWQxYjlDUmI2MXJWcUppbXNReU15amNEOFBwblJ5eGNHK0dZ?=
 =?utf-8?B?Y3lGMjgrUU1XQ1VtL01GSitJcTBhcWtRVWk5d3NPeHZlY2pKdVJnUmVQbGk3?=
 =?utf-8?B?SzRZZ2FqT2JraDNmOGxEU2NDbDlQd3lpMjdZbHd1Q2R6TThMS2djUGlJUGpz?=
 =?utf-8?B?T2NOQXd5K0ZEV05IN1dZMnY2MFdnU0lLS0VGRlB0QWdpRmlQcVBWYlJTSHFQ?=
 =?utf-8?B?WjRRa1dtNkRxUlhxRHpwVU1NWE80c0Q5dHNvUi9FcWpjNHJkYkFHeTZYV0pp?=
 =?utf-8?B?Y1YrMUNKQkhoQytYVUNUTUdoMUR5bHpkMUg0VThKcDJCL3U3eElEYlN0Wlo1?=
 =?utf-8?B?ZTRuaCt1UzIyVVA0MFJ4OWJ2OWlEMVFiVGNodWQ3MXZwV2puTUtxNUhUTDRO?=
 =?utf-8?B?MVdMbldyYnNmOEU1RDBGVVJMR1g5WVJUM3g0amFBUklvTmUvUUJvblZ1OXNo?=
 =?utf-8?B?cStMS3IvU09NUVRDQmRFWlBOZy85eDhWYVgzM2YxVy9Ib1FwR05oSGZieW1p?=
 =?utf-8?B?cGNsOGdwa3FBUFFFY1BROTZRM2o2TGxmTENaM0pNMUFBQTNHZi9nTmZFM2VD?=
 =?utf-8?B?NmZRc0ZvTnE5YXRTdW5xdGxkUW14Z1RaV2drV25lcGZxMnVtN01DNzVVMlNo?=
 =?utf-8?B?MmRRN2tRcVVQb1dzS1ZTVHh0VWRGZ1FHZGtxUXg3SVVsSk00WDk4VU9iT3dr?=
 =?utf-8?B?ZlRDMlRxNHhkY2IwSXQwWEt5MFFPbmZPZ0VmN3BhZ3Q1WFlxU0F0TkVGejlh?=
 =?utf-8?B?Qy9JUE1md1BrazZLSkVKYUlQL21VQjVQNXBBYjljbFBJWmxmQjBkb0xyUEhJ?=
 =?utf-8?B?UGIzU2s5enlOUlJGS3BZMkZDWE5XTU5mTFEzSTBIUmdYMlkxaWxkNEJTRFpW?=
 =?utf-8?B?ZmRhSFhqZzFqNkhHeFdYaGp0TmFXcTc5L3RIUWtqRmhwazk0SW9jQVYwRVZE?=
 =?utf-8?B?Q0Z0alZjU1NOeVc5Qnp4dFRmcHJhK3JiS010T2locnF5VDZGUFBXSCswNHZr?=
 =?utf-8?B?eTZxTlM0U1VOV05kWGU3RGc0K1FXbHpZWjcwVTk5ZlhFQTREMGUwR3pSN2pE?=
 =?utf-8?Q?KVF2pgShrwMzsfRd6lgArh60x?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79d553a-9896-4908-787e-08dd8d1205f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2025 02:51:10.5512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sKDWMiOYI7VEfNPA2eY+y/eoPwoJoTaX6spzvXn6tfx7E/fEcb95U2jq3T2HT4moVvcxFG/XZvLI9KOankQqG9eV05DS0cM5cSDid4nU7FQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8678
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS92aXJ0aW86IEZpeCBOVUxM
IHBvaW50ZXIgZGVyZWYgaW4NCj4gdmlydGdwdV9kbWFfYnVmX2ZyZWVfb2JqKCkNCj4gDQo+IE9u
IDUvMi8yNSAwMjoyNCwgVml2ZWsgS2FzaXJlZGR5IHdyb3RlOg0KPiA+IFRoZXJlIGlzIGEgY2hh
bmNlIHRoYXQgb2JqLT5kbWFfYnVmIHdvdWxkIGJlIE5VTEwgYnkgdGhlIHRpbWUNCj4gPiB2aXJ0
Z3B1X2RtYV9idWZfZnJlZV9vYmooKSBpcyBjYWxsZWQuIFRoaXMgY2FuIGhhcHBlbiBmb3IgaW1w
b3J0ZWQNCj4gPiBwcmltZSBvYmplY3RzLCB3aGVuIGRybV9nZW1fb2JqZWN0X2V4cG9ydGVkX2Rt
YV9idWZfZnJlZSgpIGdldHMNCj4gY2FsbGVkDQo+ID4gb24gdGhlbSBiZWZvcmUgZHJtX2dlbV9v
YmplY3RfZnJlZSgpLiBUaGlzIGlzIGJlY2F1c2UNCj4gPiBkcm1fZ2VtX29iamVjdF9leHBvcnRl
ZF9kbWFfYnVmX2ZyZWUoKSBleHBsaWNpdGx5IHNldHMNCj4gPiBvYmotPmRtYV9idWYgdG8gTlVM
TC4NCj4gPg0KPiA+IFRoZXJlZm9yZSwgZml4IHRoaXMgaXNzdWUgYnkgc3RvcmluZyB0aGUgZG1h
X2J1ZiBwb2ludGVyIGluIHRoZQ0KPiA+IHZpcnRpb19ncHVfb2JqZWN0IGluc3RhbmNlIGFuZCB1
c2luZyBpdCBpbiB2aXJ0Z3B1X2RtYV9idWZfZnJlZV9vYmouDQo+ID4gVGhpcyBzdG9yZWQgcG9p
bnRlciBpcyBndWFyYW50ZWVkIHRvIGJlIHZhbGlkIHVudGlsIHRoZSBvYmplY3QgaXMNCj4gPiBm
cmVlZCBhcyB3ZSB0b29rIGEgcmVmZXJlbmNlIG9uIGl0IGluIHZpcnRncHVfZ2VtX3ByaW1lX2lt
cG9ydCgpLg0KPiA+DQo+ID4gRml4ZXM6IDQxNWNiNDU4OTVmNCAoImRybS92aXJ0aW86IFVzZSBk
bWFfYnVmIGZyb20gR0VNIG9iamVjdA0KPiA+IGluc3RhbmNlIikNCj4gPiBDYzogRG1pdHJ5IE9z
aXBlbmtvIDxkbWl0cnkub3NpcGVua29AY29sbGFib3JhLmNvbT4NCj4gPiBDYzogVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+ID4gU2lnbmVkLW9mZi1ieTogVml2ZWsg
S2FzaXJlZGR5IDx2aXZlay5rYXNpcmVkZHlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggICB8IDEgKw0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vdmlydGlvL3ZpcnRncHVfcHJpbWUuYyB8IDMgKystDQo+ID4gIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oDQo+ID4gYi9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgNCj4gPiBpbmRleCBmMTc2NjBhNzFhM2UuLmY3ZGVmOGI0
MjA2OCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2
LmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgNCj4gPiBA
QCAtODgsNiArODgsNyBAQCBzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3RfcGFyYW1zIHsNCj4gPg0K
PiA+ICBzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3Qgew0KPiA+ICAJc3RydWN0IGRybV9nZW1fc2ht
ZW1fb2JqZWN0IGJhc2U7DQo+ID4gKwlzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZjsNCj4gPiAgCXN0
cnVjdCBzZ190YWJsZSAqc2d0Ow0KPiA+ICAJdWludDMyX3QgaHdfcmVzX2hhbmRsZTsNCj4gPiAg
CWJvb2wgZHVtYjsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X3ByaW1lLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wcmltZS5j
DQo+ID4gaW5kZXggMTExOGEwMjUwMjc5Li43MjJjZGU1ZTJkODYgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ByaW1lLmMNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcHJpbWUuYw0KPiA+IEBAIC0yMDYsNyArMjA2LDcgQEAg
c3RhdGljIHZvaWQgdmlydGdwdV9kbWFfYnVmX2ZyZWVfb2JqKHN0cnVjdA0KPiBkcm1fZ2VtX29i
amVjdCAqb2JqKQ0KPiA+ICAJc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiA9IG9iai0+
ZGV2LT5kZXZfcHJpdmF0ZTsNCj4gPg0KPiA+ICAJaWYgKGRybV9nZW1faXNfaW1wb3J0ZWQob2Jq
KSkgew0KPiA+IC0JCXN0cnVjdCBkbWFfYnVmICpkbWFidWYgPSBvYmotPmRtYV9idWY7DQo+ID4g
KwkJc3RydWN0IGRtYV9idWYgKmRtYWJ1ZiA9IGJvLT5kbWFfYnVmOw0KPiANCj4gZHJtX2dlbV9p
c19pbXBvcnRlZCgpIGNoZWNrcyB3aGV0aGVyIG9iai0+ZG1hX2J1ZiBpcyBOVUxMLCBoZW5jZQ0K
PiBkcm1fZ2VtX2lzX2ltcG9ydGVkKCkgY2FuJ3QgYmUgdXNlZCBoZXJlIHRvbz8NClVubGVzcyBJ
IGFtIG1pc3Npbmcgc29tZXRoaW5nLCBpdCBsb29rcyBsaWtlIGRybV9nZW1faXNfaW1wb3J0ZWQo
KSBkb2VzDQpub3Qgc2VlbSB0byBjaGVjayBvYmotPmRtYV9idWY6DQoNCnN0YXRpYyBpbmxpbmUg
Ym9vbCBkcm1fZ2VtX2lzX2ltcG9ydGVkKGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
KQ0Kew0KICAgICAgICByZXR1cm4gISFvYmotPmltcG9ydF9hdHRhY2g7DQp9DQoNClRoYW5rcywN
ClZpdmVrDQoNCj4gDQo+IC0tDQo+IEJlc3QgcmVnYXJkcywNCj4gRG1pdHJ5DQo=
