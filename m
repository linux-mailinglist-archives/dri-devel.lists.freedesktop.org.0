Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2052AA08727
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 07:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1C810EFC8;
	Fri, 10 Jan 2025 06:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYZsWHf0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A20D10EFC8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 06:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736488892; x=1768024892;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IGkgDGErwVmWgB4z/6JPjCOW1StSWowKEDwhnG5bLX4=;
 b=MYZsWHf0NORWKdS1+7Eb9TxIvQaeiUt43J1JRcsHfaFUjP5MfXlhJwdV
 w8dVrIpRQCztpCOvruk/9eooAHky5JVdlz6bjveBg1zrT4vPuCbSrPFmX
 2qh0w6Vwa4fQ69e4/AhgKL+b92ZkIJmjYx0oO3QwJrxlgWKaN1pbaKgy4
 NiqhF7hmbxC14mL40nMWXscIv2Dq5Viux+W/Dg3jcaNBI7rGYEN0StFKL
 by3RKQpWrdO6/mKElo6tnRZ3yPkUcgDhlGQLywweQx8AJzKsEp28uMG4v
 dd97C222/ryeRVMYbfElMWy1Jc0CVgfLRiUO092tlla1Fcb5VLeOCYNWM A==;
X-CSE-ConnectionGUID: Abg0TluZQ2ugqd8I9SQ7OQ==
X-CSE-MsgGUID: ZiQDWbPyTzi8GbEHCrItGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36797623"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36797623"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 22:01:31 -0800
X-CSE-ConnectionGUID: MKEXNHBySleGJiMEyNYQQw==
X-CSE-MsgGUID: UIacDUBkS9aJarXzHQOmMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="103592483"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 22:01:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 22:01:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 22:01:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 22:01:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XCosL7hHyYUNVcUMJnzKJHYQ2eyiVJLPCK+DdI1vkdOtf7NIkVUccuqEU59JpYUZjj4eCxR6cNftbDyocf2aTFO5kYFk52V2J9fbsPFiv85Z01X+LnqLrDeIeWxfCvj7NGdvb2FqzgV2hzr6Fgfa/6pO8405rgqMJUYPSzHJlrVHT/HmCmsdlGlkm4Tmnjy+XVprWOGE/rCjvK0Inb1aPZPDW292khzdjE0TzRRxoBzVuF+XLWPY1/uer9CpboicU2/J9Q15llCjtb6h/ehMyQ/uwtLP2E0S4xLNwcSOXoMX4pksrFERfZphf0proVqtFqD5Oa/AADUnizJJZkmSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGkgDGErwVmWgB4z/6JPjCOW1StSWowKEDwhnG5bLX4=;
 b=yw5H9YZ7N12b5CG2YzWTr7ffuUhRyTOJ/PlWqAOed3IbVLzba38i3jL/Y6l9+90WEI8onmwySgGN0xd+XQRWnYo/c+qm/Aafk9ogONFhaIChc3qYKwHvGDlP/1kXR+vG2umddPjb6oF4hX76P6q1m3HaIbLKb2iRnLz8Is0dqyWCdVPay2D65+BFw9j0GwWiD8BzdaaMMx4/NrYIDh1QqSGYJhcH9F+5JMNYCWYbxjzHVcPtWks7pvLxbz9jJAvsyZHlbK1fFM1da/cAcYa6dYNK/VJP2gZlwD/cY8LfeqBnFvuHBC3Wa1CMuxmGMBgfHd2fC+kCeO8UD1p6b8lKfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA2PR11MB4906.namprd11.prod.outlook.com (2603:10b6:806:fa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 06:00:44 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 06:00:43 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH] drm/virtio: Lock the VGA resources during initialization
Thread-Topic: [PATCH] drm/virtio: Lock the VGA resources during initialization
Thread-Index: AQHbS5whP2eHa4AL002sRgyX7lqIoLMOr66AgABS0JA=
Date: Fri, 10 Jan 2025 06:00:43 +0000
Message-ID: <IA0PR11MB71853E47F5E5AFE089979398F81C2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241211064343.550153-1-vivek.kasireddy@intel.com>
 <154187ae-fff1-49f9-9605-b50c5e1fd57e@collabora.com>
In-Reply-To: <154187ae-fff1-49f9-9605-b50c5e1fd57e@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA2PR11MB4906:EE_
x-ms-office365-filtering-correlation-id: b8777cf4-2222-4ef7-a5d9-08dd313c1eb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZkhPTWtBaklHWjgxWDA5UnVWcUFFYmhua0ZLUzdxK3V0VmpSMlZkamd2QzR6?=
 =?utf-8?B?cDJ2RmRJWTNJMmpQNVRTT2tvMnZ5dWZRVlJFaEhzMkZITG43bWhyRjh2c2xG?=
 =?utf-8?B?dUdRUDZrbFllYnpYUHlseFJ4dnh1c3lEM09ZMkZZeG12U0lrSVg5Tlk0MnJ2?=
 =?utf-8?B?RFd1TEJ1dmVDbjc3cWdUdHRnLzF0b2RiaG5ZcS8wWkloZVkzamtnREFYZ3ZM?=
 =?utf-8?B?WEdYVUlqVzVnYkJHditTK3dYL0FZK1cyTmxJWjhaZjM0a1I1c09kbnRSdTBx?=
 =?utf-8?B?SzZHRHNPYWlmeHNRcFNlNzluQ0svclpHSDhpcXVoSUIwSDlTd2NmOEFvR25N?=
 =?utf-8?B?UkI5RDd3aVdTODRkbVZEMHRmWVV3MnFoSFNYMEtDUFA0MG1PNFBZdmdocmJq?=
 =?utf-8?B?WENiQmhyV1VzVVdaMDJ6bHl1WjhTWmRxbnVKM3Y0Y3hucFIrc0tMZ3dYZzlY?=
 =?utf-8?B?ZGFUVlliRzVEM0E0NG9abU5xWmpUa3lOcG5RNE5oNVZxSFdlUXNDcktoMFZp?=
 =?utf-8?B?Z1NwSmdzU2dCS1NpeEZtR054RWEvT25md0FrL0h3eFkzR0RQQnp3dkNGL0Jo?=
 =?utf-8?B?czdMaUpwZXpWSmNWdkFIVVhlNVVtK0V0T2VNSm5McFphc3d1bHIxWTE1OVpF?=
 =?utf-8?B?ZmJnT2RzajVXd2FxZkRjaDMySXRvdDdTaGRoblJzQ3FmWFJQbXF2eU96OU4w?=
 =?utf-8?B?U2hqOXFraSsySS9ua1pTNnROcTNXRUNRdDFZNnZHZzhPT1VsY2NsS2R0azVU?=
 =?utf-8?B?ZGpocFMwUFV6M0phc1RWcFN5TlJrN3A0VlFzTnAzVjlHS0JoOUIvL3MzcElW?=
 =?utf-8?B?NTV3N29WdTMyY3EraVRQMGdJZHduRXJTWjgrK0JTQ0xlVjJQeEVtNDVTL0ls?=
 =?utf-8?B?ODVYZjhSNm1TZWQ4UDhad1NWbGFXbzlzOWtra3pMRE5ZT2xiQ01vVDJrdzRK?=
 =?utf-8?B?WklVVGZLUVdZY2lQaVFndDErRTRBUEpLS0JTV2dIc2lsQnpnTVVJTHM1T0tE?=
 =?utf-8?B?ajVjRERGNHU5SnhRaW9MdlRKMUFEYnpuM1c2RU5naWo5cXhIdlYyVUhQZGUx?=
 =?utf-8?B?ZlJWSWkzQnBSd000dDlaOTZ4WnBFelhLSTFYTVdHL3dvb1NoMDhwd2NHZ1Zn?=
 =?utf-8?B?SGtNU1RwenEwZG9HajJhaHhNRTRLSWlHTEpYUGtjZnRiL1l6MUhzUWxlTUU0?=
 =?utf-8?B?M3ZSVmY2YnZMNUU3a2xtYWt4aTJNcTBFOWFaSGdrRWx3azRQUmNWYU1zenE2?=
 =?utf-8?B?QXd4VHlvMHdTTGF6Q3FJMFdpazA4dTV3YW5EK0xmSGZJMmJmaTRpMTcxa0VK?=
 =?utf-8?B?UzBCTjFaM3E4bzZ3ZFJMUEFKejZ1bUV4bkk2Ykt2MEdvUmdEYk9CSjJVOHVy?=
 =?utf-8?B?OHhhWkpxZkNzd09UY1JCczg4ZUdsV0MrNEVsK1hEN3JRK1NQamR2cXZlMktP?=
 =?utf-8?B?N1FSNEIyY0FKc3kyQ3U1dFRZUXBUa0ZPeUlNcEpCamgzM1ROY1Y5dU1CYWp5?=
 =?utf-8?B?OTVHL0pka2kvVmhNRkJ0eXNoUjdyanZrblpGUkJHQ0tWSTR6bkE4aDZjMjMz?=
 =?utf-8?B?VXVFQ01jTE9MN2wwbTluQWc1cXFzaURGQUZjVmZBaHNLWTFySGhhYW5FTE9L?=
 =?utf-8?B?bUE0Y1N4aGp5NThwaXRHaFpQRzlaN09tQU1zY2djcWpZbUNNOHRFZS9OU1gx?=
 =?utf-8?B?MWx0ZWR3Z1lTOFg2anMrZXBzMUFsblpscW95SGRwZjJ2SytEQkpDdkRCZnpC?=
 =?utf-8?B?S01WdWxvMDQ0M3IxZjVBVWtDK1VXZDdUMlgyc1ZwSG9KVmFzdG9OS2lwZkQz?=
 =?utf-8?B?VjVqdFlKU0E4cG92OXVoNG1sKzhKeXBLZ2N0U2pkVUJxdnI5VEtxVER0UStz?=
 =?utf-8?B?Qy9IWDB3bmlGcFNrcDZRNVkxMWF6dDhIVUwwNDljdmVnUGc0eU5LcHl1K3ZV?=
 =?utf-8?Q?LT+mXc9l6a9Y+uQ5GeZnHDkzEJFjxuFi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVh2ZXlhODZkdTRiTHMydTAyelQrenJPdVdQSUc0bEVNdGg4NngxeWs0dUlJ?=
 =?utf-8?B?elBXekw3M1pmUm0yYS9BQmVyRExtaDFHU21jdlZNc2dwTm9FL0tqTk9IWnpu?=
 =?utf-8?B?QkEwM1dXb0NNZGJxa3lPbXFDSmRqa0wyV2Q0Rk5EOHJSVVJDNmZaclAxK2dQ?=
 =?utf-8?B?a1BodkRmdXVUaXRiTG1ZTjlEZnMwMGNvWWw4VkJyeGE2djl4akRRaWdlem50?=
 =?utf-8?B?cFg4VE9pUEVoRXBsM09wN0hyTkFTUEU5R2dONmFOdUJsN2hBa1hnazBEU3BO?=
 =?utf-8?B?VHJwTCs4cllyUXJkbW0xdkxET2p0MUNvd2l3UXNEVVRIL2dPZFNVTjNDbjFG?=
 =?utf-8?B?Y2x3ZFJrZ1JpbTBiSkxiNjc4U3o3VTgrbnhPSDYxRm1rZVp2YVNMZEd4VmRq?=
 =?utf-8?B?Y09NRm1BM3JJWUZuc2M0d0tYdVozc2F0a2xyaStRL2k4QzB4c1hLVHhIMzdy?=
 =?utf-8?B?eEtKK0dRM2dKakVHbmV3RXlhZWd1Mit0MEFObHhIQXZWVUtrTEl3ck5uVDBk?=
 =?utf-8?B?NHlRaE01VVRwQUZrOG50WU5ZZ1lQVnAxN3FqVC9QNFF1OS9lMXpWelk3SDRN?=
 =?utf-8?B?OUIzdVpjS2hqUlpKdnVqK0xXRmMxN2dJd2hpWVpBWlF5RGEwaC9sZ1UyRnh5?=
 =?utf-8?B?SnBNUW0zS0FIMjhqU1Z5VWRGVEtnM09ucTM5Y21KNWJ4dTB0MUhqVFBsZVlP?=
 =?utf-8?B?QWJVaXduUzV5Z09HSmdpMFhrTUVlTkRHTVNRUE1FNi9XRHp3ZHNuUGM2RWJG?=
 =?utf-8?B?djNVZXJpYW5YRVQ3ejhEYnNVTkU5Nk8xSEJOY210SVBxUTdyV004ZkQvb3Vz?=
 =?utf-8?B?NUhQTWZENnRZRkdJa3hicVNBRkU1ZU8xQzlVc1JsQVhrQy9wL3ozRlExand5?=
 =?utf-8?B?M1k3WTIyTEV2QVBoS25qaFd0dXNvMkRpcXl3SDZXSHdHbWtocnIrTUZyd0J2?=
 =?utf-8?B?VXgra3BFanh2OGNLcEJCSXNzTW1jbmlBRDdMV1hQeHJJV3QycGtyWDQwVG5p?=
 =?utf-8?B?MzBpYkkvMk5XYk1hYTJlMnZ1Rmw4L1hpd2FtWnJGd25PMkdzUWVzVlQzeWRU?=
 =?utf-8?B?Sm4xd1k4a1NUMkVsSm54Qk1CcXFxdzlZbjhXRTJTWitiYVBoS0QrTnh0MFE3?=
 =?utf-8?B?VE5KWUovYnlYQ0l0NE05ckMzNHJtZE1BbGcyS0hzVFdralhHdStrUlBKZEFW?=
 =?utf-8?B?YSt2c2I1bUhJemdWL2VFOExnWjdXeHdLa1dhaGUwVWliWXpSeEMrNnpsYk1V?=
 =?utf-8?B?a1NYeXhBd0ZqT3o2NzJYVzQ2emVCbXE1ZkdsdHg2SmdjZ2VyRGpydm4zVS9t?=
 =?utf-8?B?S2U1QlQ4eS9DbXhvbU1ZSWE4K0IvSjNhRTBTaGVrbWZnS3FqMFlNLzZwWnZy?=
 =?utf-8?B?dHlqanZkcXVLVWhGb0NNbmFlbEpTektQclNXQWpEVzN0ZVdUc21vL3dFZmxu?=
 =?utf-8?B?RUVkWG85TlRLaDJzY0NmOUdBSG1nOXFOV1EyRTFKbDFNNTBkNi9acVY4cnVk?=
 =?utf-8?B?cm9QcHBiTGFxTDhlTTZtUUt6cVVZWnA1WlJ0eWY5WndEdlhWQW1BQ29uZnlH?=
 =?utf-8?B?ZTBYNVBVT2wrY3N2Mlg0R3RyaXU4NDJscGFWNHBoWXdMR1dnMDJBSFNzYU1p?=
 =?utf-8?B?WHRoKzRpQW43WmYvWko3YnFNenV1cWIreDIxUEJadmU3VmhSSElhdndJUHFn?=
 =?utf-8?B?SSsxUDZLVmRja2RNdlF4aUpmeDNKVmhiTXZQS0FSbWtsQzFOMzQxdVVHbmxJ?=
 =?utf-8?B?b0FWMWVyZlI1WkJhRWFveDFFd3lwK0tDaTVFUGxMK040YkhPSFNXUklGZ1Zr?=
 =?utf-8?B?YkhzQ3NSWkl5WHRSbTg2MEtLbHBtWE91M3NBNW92YllNblNzeVI2MHUrNFRl?=
 =?utf-8?B?R1dGMktUY0R2TkZVYXJIb2hiMXVyOVFnd0x5YXBqNXBOUHk4dG5pTHlveURy?=
 =?utf-8?B?cGRQU3NCR1NpRUtMTkVQVGNybWFWMUFNV1BQaGZ0VkVCMGNhN3hwRTF2RUg5?=
 =?utf-8?B?U1pRTjliNDFmL2RTakt1UVBBT2sySjdRZmlQTjdJbXk3T01Ba3ZlZCtSd1gx?=
 =?utf-8?B?RGlNQUV3VUErNkRRdElvbWY5Z1orTGdISndpb0J2b2V2YjFERGw1dlZJelhi?=
 =?utf-8?Q?eUp7vI5zXMUbgCtg/S9nbeSqF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8777cf4-2222-4ef7-a5d9-08dd313c1eb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 06:00:43.9317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hSYoq6rApCl40c9AslSDs4hKOIECQZe5oOIANzBEXPd0Sky0cdPyJt8SMjuAOf2G4RjGkMuDZgWzfqPqoTwql/rSSkm3Z7slUwZ2pW8TU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4906
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS92aXJ0aW86IExvY2sgdGhl
IFZHQSByZXNvdXJjZXMgZHVyaW5nIGluaXRpYWxpemF0aW9uDQo+IA0KPiBPbiAxMi8xMS8yNCAw
OTo0MywgVml2ZWsgS2FzaXJlZGR5IHdyb3RlOg0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCB2aXJ0
aW9fZ3B1X2RyaXZlcl9pbml0KHZvaWQpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBwY2lfZGV2ICpw
ZGV2Ow0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+ID4gKwlwZGV2ID0gcGNpX2dldF9kZXZpY2Uo
UENJX1ZFTkRPUl9JRF9SRURIQVRfUVVNUkFORVQsDQo+ID4gKwkJCSAgICAgIFBDSV9ERVZJQ0Vf
SURfVklSVElPX0dQVSwNCj4gPiArCQkJICAgICAgTlVMTCk7DQo+ID4gKwlpZiAoIXBkZXYpDQo+
ID4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+IA0KPiBJIHJlYWxpemVkIHRoYXQgd2UgbGlrZWx5IHNo
b3VsZG4ndCBhc3N1bWUgdGhhdCB2aXJ0aW8tZ3B1IGlzIGFsd2F5cyBvbg0KPiBQQ0kgYnVzLiBJ
dCBjb3VsZCBiZSBNTUlPIGRldmljZSwgQUZBSUNULiBBbmQgdGhlbiB3ZSBzaG91bGRuJ3QgZXJy
b3INCj4gb3V0IGlmIFBDSSBub3QgZm91bmQuDQpZZWFoLCB5b3UgYXJlIHJpZ2h0LiBJIHdhcyBu
b3QgYXdhcmUgdGhhdCB2aXJ0aW8tZ3B1IGNhbiBiZSBydW4gaW4gTU1JTyBtb2RlDQp3aXRoIFFl
bXUgTTY4Sy4gSSdsbCBzZW5kIG91dCBhIHBhdGNoIHRvIGZpeCB0aGlzIG5leHQgd2Vlay4NCg0K
VGhhbmtzLA0KVml2ZWsNCg0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRzLA0KPiBEbWl0cnkNCg==
