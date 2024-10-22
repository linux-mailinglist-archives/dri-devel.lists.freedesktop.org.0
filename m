Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245A69A9809
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 06:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F8D10E5D6;
	Tue, 22 Oct 2024 04:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STHIj3x1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E54A10E5D6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 04:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729572690; x=1761108690;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Sx3GBgxpcT6j2Yg0jMp+Cb7iOvHDrbPAxzh7JkMQzC4=;
 b=STHIj3x1NErFHeuTM8oUnfqQqNVScUATwWebEvzoYE2AdjV6YNRmA6XE
 vfwRB/kdokmIJp3FGwswFCnWXpy7HkeCFbeLIqxF064V+Pu2onbU/WU4g
 kmJpTe/s2RAqx+w8yB//OO1GUHjN36JfzBf8JrF1j/+TMKa4rPJ6yi+8l
 /bC7LcZ8XjSyFkn7vV9Ig9xV6qRicHIZ3d2LIuXKO4YFjycrhBIhv474B
 TL1rf5twDRfX5u2fHy0tcEuFLWZlwB/Lf6068zu2/s0DW9LdA+IpTVGsE
 F+F/VhrP5p6kkfj1xa9CBv363WqHRcBk6voo+NtnG0k7uh4bbQUw3bfoD Q==;
X-CSE-ConnectionGUID: UDiPAiW6QCyN/mjo75o7BQ==
X-CSE-MsgGUID: cyTclXlFS/aBwH7M4NPqIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51625918"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51625918"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 21:51:30 -0700
X-CSE-ConnectionGUID: orCjCdyqSFmUPZBvqI0VZw==
X-CSE-MsgGUID: GIQlLQXCQjeADNoL5sPe/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,222,1725346800"; d="scan'208";a="79669476"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Oct 2024 21:51:31 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 21 Oct 2024 21:51:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 21 Oct 2024 21:51:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 21 Oct 2024 21:51:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXQD+JCQEgSjBk0obCnkXcj9cFBAeAoYYary1nlFsTIfrXu4MRE25lxTarckeyKV0wuoSl5guBveoxb6QncN4DoJ9FLDWUhBHjkExE/gQiOD9Q8hADvhZPjIhmnqm47fce6VzZ80ZEsxlFx/cW+yUUt/x4ecNnKjCKbPXIzTG0XZCQnUevXUv09hme/9OmnG/8KEkPWehE37d4AfKphraWI6kk1kjG0UvPGmrICABboLtqgPc9vyoPmBOw4Xp32aBa5k9XQDG0Glma4nEk3+MyX8Yvk0HK2v0J9OG/cBzYJ8ZBd4rEhcrgpCcmpE2MKHfiT5vqvBogaCAnTsCs3lNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sx3GBgxpcT6j2Yg0jMp+Cb7iOvHDrbPAxzh7JkMQzC4=;
 b=nk+asJM3ciJzymQko9hv9XHpDIP2fEV5DMbDTk4q8QCyTZcB2lNrjhpFpxiNX0dI9sPiHYJDs/dgBBu4eLgQvmXWmEQyQA79cOw0sklIwbF1mXoKhxCR4nWAWN+isWgUDSoso76edZqCHt+z42wMWUKc6QETbUS2zBGyXnI84MPLGMS12EwGLtZhtjbUE8ZrBo/wYQiA6/fnjbRTItLjgsPdfJPSxwtcZe0T2UKDiPYbsxdD8XkwFPUW47CPmniLSdOmtqDfsnfpwf3LP1PirZJ6bSYPVMEpKbEaztEPHX8LUobSgFavIdNdApHxQ50LYDGtZBg/GTsZZjpbPlyw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Tue, 22 Oct
 2024 04:51:27 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 04:51:27 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Topic: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Index: AQHa7TgPrcbKIkB680CVAbY2s3+7ybKQ+qcAgAEiG4A=
Date: Tue, 22 Oct 2024 04:51:27 +0000
Message-ID: <IA0PR11MB7185625CF2B9E7635A0CF164F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
 <20240813035509.3360760-3-vivek.kasireddy@intel.com>
 <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
In-Reply-To: <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MN2PR11MB4598:EE_
x-ms-office365-filtering-correlation-id: ba95f50d-5220-47e7-40f1-08dcf2553015
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RTJIbjFPVFZLVjgrcEJHYWZTVW5vcmROZjdGdXNZbkE4L25nd3g1VCs1dUF4?=
 =?utf-8?B?UHI1TktOZVRMdnRSbzd1VmZjL3lwa09jODc5UEhrTkd5bTgzWTZUamV0TWpq?=
 =?utf-8?B?UzEyS3V0c3NoM002MGMwMlF1NTBEU0VHV0VmaU1wbXY0ZGVWdlNWc1FlZ2pn?=
 =?utf-8?B?T1FvZ1NKcFh2R05BK29OamN6UmpEVzBiSG85VWViVWo3OXhIMUFRSzVLY25Z?=
 =?utf-8?B?dUh1QmxvVktsaVE5bXJZdGt3dnZyZG85eGxrQTEwZCtsUHRBVkFGdnQxQ2VN?=
 =?utf-8?B?bWhOS2pSdWhodzhiZzV2L0R3aFlKeXpMYndjNkxhOXdkYzA5WHhxZzArVHpS?=
 =?utf-8?B?dXlCQWV6QnNwQ244eU1ZRStRa2kxKzQ2WFZUQjFTN0xONkNlUjMzb2RiNDlD?=
 =?utf-8?B?VjloZFpHK0V4SWYwTWZVYXJjeHdGak9UU1VJOGNWNE4xeHFWamxNQjRKVTd5?=
 =?utf-8?B?MGg2TFJXWVhnQmxGYW5YUXg5S1RvSDBNMXdNWWU2NVlTbCtaOHlqVU1xTkpM?=
 =?utf-8?B?Y1VQUmc0YU0zNEZqZHpPWmNmMitCUG42b01FNWEyNUNOaTNjNTBvZ2tQbVZw?=
 =?utf-8?B?emFmRUVwbWdRUGI3WEo4NFV4aXh2d0Zjc1ZFUnhKL3FtU0VobGhyMnhZUEph?=
 =?utf-8?B?QnpySzFiQzdsbXAxOGRRRnZhMnY0dmdJNllhTDdXcmZKYysrZkl6d3dncVly?=
 =?utf-8?B?N2VGbDd1MUhCSkdIdjFuSnprdXVLNlBHazF0SXJTeHdlOXM2Q0RxUUJHblR2?=
 =?utf-8?B?azVJMHBaYitYYlNZNXpLS1pzemlYaFR6RlNCSlZkKzN3byt1bGxpV3F1N2Zv?=
 =?utf-8?B?Qmh3Z1VmcXAxSStydFVJU0RVazZZL0ZHUVVGSEtoTktCQUR0ZTllVWNFWjli?=
 =?utf-8?B?aE1OSXJMdFV0MzZmelNzY2I4RitDcTdqQzljdWxpcHZpNlBRUWh1aWxqWFJj?=
 =?utf-8?B?TEFsNWtuZFVkemtSRUNmVDhObCtVZ2M2amttQ0hlRitHbHFhbnljOCtNczdq?=
 =?utf-8?B?Y1RpSjBMVUFsdzE1cVBlOGloZkZtNHg0U3Z4MldKdkU4M2R0b3FNMWlBWFFq?=
 =?utf-8?B?TlBjM0NUeTRhL1R3RXErMU5NaDJtS1k0a3cwR3F0ZTJNZmZEOGRDRCtBRUZI?=
 =?utf-8?B?a3ZaTnFVQVhYd01wV1ROd0IydUIydjNFVStxMStucHdtS3kwQ090eU14WTJ4?=
 =?utf-8?B?ZlF4OGNVelFDZlJVUWwwN29kcWkyNGllQlhTSStFRmNGYlNKNlZIQmQ3bzhL?=
 =?utf-8?B?SzlzQ1BGMHBDWFJwUVRjY3VQNGx6WGVHRGhGaGxhUVJXMElZK0RGQmVqQUYv?=
 =?utf-8?B?ek9lcnBKaE5nN2xMdTR6WVc2TlZWTmt3TC9meDUwRFBtQTVVNXMwc0V0OGMr?=
 =?utf-8?B?OFp2WGMwSDBXbExrWnBPVWRhYTk2eW5oYWEwZ2xHTXk0US9GZGt1b2tCakZ0?=
 =?utf-8?B?Q1BxMTBTemswZmN0aCtLQ29hcWFRODVNamtPQlpnOG1DS0F1ZU01NERhUVEx?=
 =?utf-8?B?enA1SGl5bFZLdWtYOEdvN2pnTm0rY09mOElCaFhFWU1KT09saTdBUTRBVElS?=
 =?utf-8?B?ampFekJ4NXFIUGVqeEpuNXRWUCtldXNvT1ozV01rUkR1cDJ4TDYrQmpHVW9O?=
 =?utf-8?B?djRoNkhBeGIyN2hqazkya0dKRENKMTI4dGtlUEU3aHlyWkhiVUxRUjViRjB3?=
 =?utf-8?B?dWt4QnNJUXRua3dlT2hzbzh2eXJETFRsVUtlOGl6SlV5M3JSdi82RXV2eDR3?=
 =?utf-8?B?QTVWcEFTWkdQdm9ONjVJZ0VmV3NIYVJDQjRvTnQ1dlBkVlZyb3NPUmtuQUs0?=
 =?utf-8?Q?Njoon47NqugEIAKYvbEcwEEyA1XTBJU56aqM4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWIzZXM5MHlpT2ZaYURWdFBkYXdxbjZmN3RhYjh6VHMzUkRXQmRxWkNpOXhM?=
 =?utf-8?B?SWNFQVpqcHphZ2pWUHZncmFaN2dnSXk0dVkrRW1IMEhBVm5pNXMrVnpGZFYv?=
 =?utf-8?B?QXBBMDN1N0tUOWwzYVFQbkF6eVArdW43V1ZQUm80bWFFelhOTWprVTd1YVFh?=
 =?utf-8?B?em1Ub01jOE0vVmJPVUM3L0UzUVd2Zk5IRlh3VkFZSTVrUWIrMnc5YS9BdVFE?=
 =?utf-8?B?VjB4S0FydDNRZHRuaDhhelMvN2xCbkptYmROVW9hanJqUDJLSHl6MUcrSnUz?=
 =?utf-8?B?T0lOT01YUE5tQ21wWlZNQ3B2WUJONXFNeG9ONTBZVytpNzBwOGNIekFoa2F1?=
 =?utf-8?B?Z1cyWHBNNDNsY2J0SkVxN3ZqSmJRalVGYng4NlR1OFBTVlAvQW12dkZrZ0Va?=
 =?utf-8?B?MUUxblNMdDdnb1FqTW9kQkR4MGw1S1RraFFVNGhQSHQzOHU3TTNEOTR4Z0xY?=
 =?utf-8?B?V2hHbUZhTkc4SjVWUnpONDduNWRiWXplVGVUVTNoTHlzVzhHOUNKR2llVmZO?=
 =?utf-8?B?ZWx4SzhlbE5mU1hFc1BuUnIzYm14NzVHdGdNUldTcnllNy9qRXIyUDVXSnFD?=
 =?utf-8?B?RC9wanZHakdLWlFYM0FGT2g1UERiU0VxYytFejZEQWFwM0cweExpTUptK1gz?=
 =?utf-8?B?RXlnTjdnRXBMb0Y4dmQzQnFSYzhOeWNHMXRFL3ZnTmpvblE2bldtVHpqakRS?=
 =?utf-8?B?YVB2VGc1VjlNdVpETjdRb3dhSS9XUzhydWUydVdGUEIwdVRlelBrZ0dnTVE4?=
 =?utf-8?B?dC9WVjhxMkx1RjB2VFNkMkdhdHIvUE5JVlVvcnltTUZ3dDB0QUt1SzZqSjZt?=
 =?utf-8?B?UU9vQkZFbVFjUlpDbWZqaTQ0YVcyWkxobXcyL1J6SFFSZHBIS0NWODVuYytl?=
 =?utf-8?B?ZUIvYnRnRDVuZFljQ0FjQVB5cTI0eUQ2UjVkZGttSEpFek1yMzA2em9xbG9R?=
 =?utf-8?B?Qzc1YVUxS1d1dmFQazk5d1phZW5RTERDZ3JoTXhyOE5SL0lhSlE3b1JtQlRj?=
 =?utf-8?B?WGYwMmx1c1VGejltUG9BTGVZWWRXekw0a0FjRytHWXQvVHpLLzM3NkJESEx5?=
 =?utf-8?B?OFpsT2h1bE55cVozZ1ErbGRNQWoxS3pZeWFGV0dkRXlFOEtWMTgxUnRvN1Fk?=
 =?utf-8?B?bFVXa0JidU1kSE15VGlXRTBSYmJ4RmtkdTdaOXlWL3BPaEc1N0F5b0Z0V2Zy?=
 =?utf-8?B?aXJzdXM0NlUwQUc1WTdoTnN5WkY4dk96TWphazg5dXM3SFNxWHYxVDRFdDdT?=
 =?utf-8?B?ZW45Z2JZOWlKYS9IR2RCVkY3ajgyUDNqdWxZa0dkb0R3cnl2RW1ka1lxVFVH?=
 =?utf-8?B?eHJCS0lURHhvYjQwKzJ5V3dZMWt0WCtZK21ORGFWMFJHc2ZTdklQWTB0OTJT?=
 =?utf-8?B?bVBiRzJLNzVNcnF6dzhob2ZVUEt1alUrRlhxdTkxbGUxbTJrdTUrSVRKMTBi?=
 =?utf-8?B?WWd2NU16RXZsR2VNR2NSaFV5V1h4N0p0elJYdnlqeTE5Umk4SElId2p2VlZE?=
 =?utf-8?B?bTFaeDFib0ViSVRCdHMxaDI0VjFteWtXQzRiZ3M1bWVIV09Mdi82SEd1Vkxm?=
 =?utf-8?B?OVgyTUVWTlJ5R3hpVjlWbVVtR2tQclZ6RERHY2JJWVV4djBxaXZ2KzQvVXBi?=
 =?utf-8?B?Vi9zNXhFQ01iWWRoUHNDMXdreGJsOE9RVWpjNjBGRnNvMTBlaWw3c0dJMlJL?=
 =?utf-8?B?QktUaE5ERlQ1eFMzT1hjNUNBTGZheHdjQ2NFRnV1T3BjS0NjN0RmTTlGb0x0?=
 =?utf-8?B?cU9sZ3hwYmw0S0JiRERlcTlTMWJ6VVM5alF2UXFlQ0tHWXY4RklhMG93a2xY?=
 =?utf-8?B?RUQxWkxFTDhkUko1Ulc5TUlLRHozajkwUlUzemR0U1JtcE5nbXJpeHhnQnNE?=
 =?utf-8?B?VVVrTG9tM3ZmcUZkeUppVzUrNjVSbmRhUnd1Y01OSFo0cVBnZUZKWGUwMG1P?=
 =?utf-8?B?amJuLzI0UlE5UjAveHlEcnNaTmwweDlnNkxWcVZ4a1FQWFRzRzd2djEwVTRu?=
 =?utf-8?B?bnl2a0VFSWplOWZNSEJoZ01KQ1p0YjQ0NEVQbzZQcEdCM1dYNUFsQ1lxUWNp?=
 =?utf-8?B?SlE1R1RIeHdzcDJJdy82cFc3OVdJWFUraThrSDZHbDJ3ejNIQ1VqaWRheWd0?=
 =?utf-8?Q?QIDhWFt7U8+r6tUfUeiCAMP0U?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba95f50d-5220-47e7-40f1-08dcf2553015
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 04:51:27.2368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9ia04qgNByBHj8RO3JFCz6pGtK0z3wOw3Q06q5erncbhcdGi+iYuEf7q6xMiwoznEcVMcFUpcaVjfI4OPU/0c7K81f6e8MK9k4cDBKKHG3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
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

SGkgRG1pdHJ5LA0KDQo+IA0KPiBPbiA4LzEzLzI0IDA2OjQ5LCBWaXZlayBLYXNpcmVkZHkgd3Jv
dGU6DQo+ID4gK2xvbmcgdmlydGdwdV9kbWFfYnVmX2ltcG9ydF9zZ3Qoc3RydWN0IHZpcnRpb19n
cHVfbWVtX2VudHJ5ICoqZW50cywNCj4gPiArCQkJCXVuc2lnbmVkIGludCAqbmVudHMsDQo+ID4g
KwkJCQlzdHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvLA0KPiA+ICsJCQkJc3RydWN0IGRtYV9i
dWZfYXR0YWNobWVudCAqYXR0YWNoKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3Qgc2NhdHRlcmxpc3Qg
KnNsOw0KPiA+ICsJc3RydWN0IHNnX3RhYmxlICpzZ3Q7DQo+ID4gKwlsb25nIGksIHJldDsNCj4g
PiArDQo+ID4gKwlkbWFfcmVzdl9hc3NlcnRfaGVsZChhdHRhY2gtPmRtYWJ1Zi0+cmVzdik7DQo+
ID4gKw0KPiA+ICsJcmV0ID0gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0KGF0dGFjaC0+ZG1hYnVmLT5y
ZXN2LA0KPiA+ICsJCQkJICAgIERNQV9SRVNWX1VTQUdFX0tFUk5FTCwNCj4gPiArCQkJCSAgICBm
YWxzZSwgTUFYX1NDSEVEVUxFX1RJTUVPVVQpOw0KPiANCj4gV2h5IHRoaXMgd2FpdCBpcyBuZWVk
ZWQ/DQpUaGUgaW50ZW50aW9uIHdhcyB0byB3YWl0IGZvciBhbnkgcGVuZGluZyBvcGVyYXRpb25z
IG9uIHRoZSBiYWNraW5nIG9iamVjdA0KdG8gZmluaXNoIGFuZCBsZXQgaXQgYmVjb21lIGlkbGUg
YmVmb3JlIG1hcHBpbmcgYW5kIGFjY2Vzc2luZyB0aGUgdW5kZXJseWluZw0KbWVtb3J5LiBCdXQg
SSBzdXNwZWN0IHRoaXMgd2FpdCBtYXkgbm90IGJlIG5lY2Vzc2FyeSBnaXZlbiB0aGF0IHdlIHdv
dWxkDQpoYXZlIGFscmVhZHkgY2FsbGVkIGRtYV9idWZfcGluKCkgYXQgdGhpcyBwb2ludCwgd2hp
Y2ggd291bGQgaGF2ZSBoYWQgdGhlDQpkZXNpcmVkIGVmZmVjdD8NCg0KVGhhbmtzLA0KVml2ZWsN
Cg0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRzLA0KPiBEbWl0cnkNCg==
