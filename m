Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D53DB2B347
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 23:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5118D10E4CD;
	Mon, 18 Aug 2025 21:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u6dsC/Oo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D786610E0A7;
 Mon, 18 Aug 2025 21:17:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFWAm5J7J+SePXoyiP6sSpJUkL2RY7699HRceqG0J7nIv/RZU0gxFElZkV/woeSvfZoGAqHgvVg41dACd4CCLlY82CZcLcHJXxxL0H2VqvwVDbi9J218y6Fdtv1uEnmBjJXvinYEqUJdXC0vk57fcrj006B316fLmfzAHM3ZRTHPxZYUnbN7DcTc6XZUAqp0roMxcpAeQOGJiryinadZKHiM88S1y8rRyIA31o/l0d9lkq3kIuZE0OWzbj6R2ALOA9zrBEWBiM8dKKDUnyq8/C7Q+0b7/gHpZeR5frduirHjOU44kL2KaeZKZ+arhBjtE/xL2+P54e0nniJTT5j66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seR9WZ8fnOWlsbIIHx5RBRJ9YN7OPUDSZRAQXTY8OLw=;
 b=HqiyGxS82/QbvzrYrcLy70L3fQhL3ybWUFB3glKxvu3JjiMgSW4t/ctuAspHwN2qAn9DdDQvfZQfUa82G8WuNu5NGxAKIJPpx/QPXBJlvd6BtxAnV4KODj2bTiqB3Xz9DTvfVnsxsTdRGy5+4fqRzPPcIDXD0evPvynBMuXeECDU5BCUiZPxtd7bje4uHaqkHxZ9jC5S1OR95J6scEwCuka1v/umnQtfH4iZNk3HpRA0Th6pBn/TUZdvPPHeGhU1hbGULI5a4U8mzMjlSn+ETHsSzCBg+iuFOczDW1Nyi9F2lkfX7B9P/PBu08JCB2105aYXopkXwWoWi8BEiDE73A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seR9WZ8fnOWlsbIIHx5RBRJ9YN7OPUDSZRAQXTY8OLw=;
 b=u6dsC/OobCmasaDQSDpFq8xmWA2f1Dti5VpAAWIoEaHWBahU2Jm8bfI6wDdaXgGX+14gRNydFNae19whsD4pvGJnWuST4iRPnBEnudcOFQDS5A0jPq87IQAlHVLm+hUBLqJahNVoSSLQ4Hk/NIUSLRKdN8UpypvCF7SiIfAdvd0=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB9075.namprd12.prod.outlook.com (2603:10b6:510:2f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 21:17:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 21:17:01 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Fedor Pchelkin <pchelkin@ispras.ru>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, Melissa Wen <mwen@igalia.com>
CC: "Wentland, Harry" <Harry.Wentland@amd.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Hans de Goede
 <hansg@kernel.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
 <lvc-project@linuxtesting.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/amd/display: fix leak of probed modes
Thread-Topic: [PATCH] drm/amd/display: fix leak of probed modes
Thread-Index: AQHcD1t5ASgRki/N2Eur00vsBBvr/rRo7CmA
Date: Mon, 18 Aug 2025 21:17:01 +0000
Message-ID: <79a7f64c-4afa-441d-b1be-bab489174c7e@amd.com>
References: <20250817094346.15740-1-pchelkin@ispras.ru>
In-Reply-To: <20250817094346.15740-1-pchelkin@ispras.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|PH7PR12MB9075:EE_
x-ms-office365-filtering-correlation-id: 4abbc7d9-d040-4cbe-b46f-08ddde9c92ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?R2EvMVV1Q3Z1b2trS0E5OFFPNkdnS055ZU1ZSnBOeWZMNWRhOHBSM1dMWWFo?=
 =?utf-8?B?WTJaVHFUbmxUTzVxdWxlWFFhYmNkcGJzcWdPcXZ3blZhcloyU2hNaHlBdnpV?=
 =?utf-8?B?Sm5ML1FjOWZNMHliRmVkLy9BbEhPa0hjYlVnT3RTK01aZTV3c1ZJb2JVcVNX?=
 =?utf-8?B?YUhyYlNFM0l1dVB6U2VIUkEvSGRUankwMjlia2hUMmNNdXkwaEVqQW1PNDk1?=
 =?utf-8?B?OGJlcXl6eHBMMnZ3bFpDYnNNalRvRE1mZGdYSmZmeVQxZFYreDl5RkluQ0tR?=
 =?utf-8?B?VXhLVDZFb0liMllBN2g3cit5TEpPNGZ4NXE1a3pMcXQ0MXE0LzVpeWsrUEhs?=
 =?utf-8?B?aDE4NjVaWFIvb092RlBhSFQ5SWtXN24ydUhIdnNVNkUraW1hMWZjQUdWTVBB?=
 =?utf-8?B?WlZrVU9MTzg4cGs1SlB4d3FqR1FVYVd6K0JJTkJURmlieUdXRzhMVWVuUlh5?=
 =?utf-8?B?c2tKU25WR3o5aFUveStDblZKcFE3TzI2WC9WcXNoWlI1ZE5FODc2eXdIUVBi?=
 =?utf-8?B?RVVxUkhjN2l6cUdOVWI0TlB3SzAxbVdHTkpuVWt5cm1IVkQzQ0dDcHNuQnBY?=
 =?utf-8?B?K3p4RG51dUx3KzdmcTNRQ1c0QjZRaHF4Rk5JOXdmQnNRa2pPMTg5RFlQRldv?=
 =?utf-8?B?TENDTGVUaWJTQnhEMUlqMW8ybGkyaCtNUVdITGF2K0hrdFNiZEs0VTlvOEFv?=
 =?utf-8?B?T1QvY1V4WnZBZjExanpDY2hQbmxPLzQ1VW5SbWhEaHkvbnJwUENaUjRhdWdP?=
 =?utf-8?B?Y1MxdzdteXBPMjVBdDZPSkF5Q1F3c0FOWW9tcXdtQnJJMzVUY2NUd2JCbmlo?=
 =?utf-8?B?enpqSkpYaDEvRzg2dlZIQmhCSTh4ay92cFpwcExBeWRKR0lMSTltY2x1Skcx?=
 =?utf-8?B?d3cxUHZjNXdwY0h6UUN5c1QxeDFOZE9ORnV6ekt3OHFya0ZxMitiamJzSStS?=
 =?utf-8?B?akk3SDJ2U0lHSlZqY3F2cW1ZSDA3YWNMay9pcVVheWtCcmdHVGhyUlVXcUhG?=
 =?utf-8?B?Zlp3dnBYcHJQdHFDNDFIaWxUa3RGdUVYS1RWc2VVdzBybG1PMlU3N2ZZUXNs?=
 =?utf-8?B?SE5TdkNGTWp3TUdaVXBDaW1WYmxVWmppTWR5enVEczNOTmZ6SUpHNlBZUjlY?=
 =?utf-8?B?NGFyRUZnOERHdEI0bjJQcDhvczhodjNVQjc1SU5IV2dDYkJNTXNiRWRPQlpw?=
 =?utf-8?B?czl3SFRSQ0w3d09HUnVsWFg0OXRGRmpsZzNtQjdzNDZ6VWozQVdFVE5hU0Ni?=
 =?utf-8?B?dXBsdU5xMkJHRWpDY0xsOTN6ekhPMGdPZUE5em5JS3NHcm1BOFMzbUN5ZHVF?=
 =?utf-8?B?RlVBS25ETEFsc2R6ZUd0NnJBR1dTbC8vSlBHWnRQOUpFQmVYbjg1U2o5QTBI?=
 =?utf-8?B?YWZwS1liR0xEMXZXSytaZ0tuZU5UMDJSUEo0bWI0TGhSY3FETVFXc1lRYTRW?=
 =?utf-8?B?OFNCeWdpWDdaVndpNW1UbG93T1Y1U0l2NURFOTZpVnY5YXJ3OG45MG14Rm9G?=
 =?utf-8?B?QmsyTmRvNGpZOHZxbERRTlpTcHlZL2hzOWlrUUJDcTQyYjJKckI5aDZjS0Ft?=
 =?utf-8?B?M2tYcjVNUCsvWHh3ZkhvamVrdGUyMlBUYUdTYnMxZ0ZiZS8rTUhuZjUvRXN6?=
 =?utf-8?B?MVdQMFNKazczTWtBeUYrenU2ekZxUEpMcERKVnhHdTFaTjBJMU1xYkdTRDQ3?=
 =?utf-8?B?eEJWcHpwaWxVcGt4cXhtQVdWdDhjUzU2aC9hbnlBdExiT25aL1VnWmwxcnhP?=
 =?utf-8?B?UWs3UGVhOWorazlTbnozZlNJRTZYaG1KZzNrMHlKWWlyNFN3NVVvR2xZa2tR?=
 =?utf-8?B?STgrM3JNSmxPMEd4U3g0YVNmbGEvTlU1Yi9lRWszWllQL0oxOGduRVp1QUdp?=
 =?utf-8?B?R3ZtVmgwTSs4OTFHdlZ3dlBYSElBcG1hVUxCNmc0S08vQnRZL2VTTVhVOTh4?=
 =?utf-8?B?WFdWRkJuUVZick1NbkkwS21rY2pFcE5TRmVkdEhrb0FuUU9Zc0R4Rkt1akZT?=
 =?utf-8?B?Z0xzMHIyQm1RPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDF3TTZrNGNpQy9JekhSRHlDeWJSZ0svYVNZaE85VWF1b0xCQm0zVHVrZG5V?=
 =?utf-8?B?R2lnYm8vQTZhYzJ1RU1VY3FleTBIWHJBTnpXbFJ0TVpVcnhGQXlxdHJHbmFM?=
 =?utf-8?B?dEVHOXR6UzZrUE5rSTFDQndOeDkvMjh2VkNzdXJJWVd3akFuMGFpc1c2ZnlM?=
 =?utf-8?B?ZjlNMjYwNENIeC8zSU5IeDdLckRaRmU4RittQ01tZkU5YS9Ta3JhaGlLcG9F?=
 =?utf-8?B?T0E1V3hzQnBVNklWS2Naem1QTlJVM0tiOG9EdWxobS9OUHNjVWYvNlA0aDk3?=
 =?utf-8?B?b1VaZHNPenpXNnltWnB5YlpWeVF3Y3A4aXRlaEtwT0FXMGVYcTBHeGViYjZm?=
 =?utf-8?B?Qyt3ekRmeEdZTnljZlYrVkt0ZVBCQVVpdFVzNWV1MjNSUS93c2RiTm9BaDZF?=
 =?utf-8?B?alJHZXhVdU5hNnduOW5JcHFITWZaMXhMUDF3T3JFbVYxdU9US0tBMitzNVNQ?=
 =?utf-8?B?ZFk3MVM2MXhCa0hBbGVOVWRnbnpsd1haQkZlRE1GbDFLT3NVU2NaaGhjMjJW?=
 =?utf-8?B?NzhOMld3WXlTMSt0Ty9lMGNrczU3ajV5Z0ZrbUl3NFN3S0hVRFAyRkp1STdx?=
 =?utf-8?B?TE1lRmxMd1JhMXdYc3VhNmtJc1JLaUJlZGlyVllHZEdyMjZtYjB6Zkd2WG44?=
 =?utf-8?B?djFHZ29FN3lFSDdTOGZEUkM3NmVPZHNxUGdKYno1ZUxiVk1IMEgwUWdWcFdy?=
 =?utf-8?B?SnhwYXRzTnRKdXR2cU1SUmZnT0swbFJwWWJ6SDNQeUd1WWZWaDZ3Tnd0NFRW?=
 =?utf-8?B?dUkxZE5wUTIrZXZndGhLbmlrUGJDdko3TjNraXU2SUUvdFE1eVlCYnlNdklH?=
 =?utf-8?B?T0tCWk9uR2doaW5iS3IzSGFDRmMyang3TEpNUHJVQk9LaytrZDViQmdhcyt0?=
 =?utf-8?B?UU9maXh0SEw5T2hRVEEzTWtLU2xoNk5PM1BVc3ZNQzZkR1NlS2NjVmoxSnMr?=
 =?utf-8?B?K1ZuZkwvallBZkJpL1RKYjM3cVJ6RWcxYk5oVVV4ZXkvRllBN3ZSUU5uWlM4?=
 =?utf-8?B?NDlOeUNXMU82LysxV2JYaVA4Qmx4NmNwK3p5YlJPQk1HakJtbVcwVzdYNkFn?=
 =?utf-8?B?UW13eU9kdjVyejlzVExKcGRHekczNW50bkc1czV1SGFyZ1huYUFjUVp6a3Z5?=
 =?utf-8?B?YVBuTEtSRHJVV0pLNmNUSENGVTRkcWVNY2FUMXliMmJjM1BQQ0pnalpBbXV0?=
 =?utf-8?B?WjljNWcxVUxLbUdWUUV6QksrTEYvd05hTWhycHFDTDR1d0x2Y0tWT0xFNXQx?=
 =?utf-8?B?QU9kN2FiaGZvR21ReHlWcndkakEyT0Q5QVFNcVpTMk82d2JqS3BOTFVxdGhm?=
 =?utf-8?B?cUJLb0o1ZTZkM0dVZndnVXRrZkZyRGxGOEZ3MXBmdXJRVzV6UmdEWXNQYm84?=
 =?utf-8?B?dFdPS2RaeENVamw1NVJpbCtyajVCbi9xQ0xxU1M5RzB4c2V3WUN2SVNHYlVh?=
 =?utf-8?B?a3pYdmNhbnlNK1o5UlpWWFd2SkdkVm1ic0RGckxrM2NkeUEvWHZjV01mZnUw?=
 =?utf-8?B?V0tFOE02T1VwUU9pWGdQM3FONWt5TDF5bmVBTnE5UUZZdzBtWGVrcWRyOTh6?=
 =?utf-8?B?VVR6cUh1Zko2Yi9QYlhWYy9Vc3VKNjB1N0xYSUUzSEg2TU9IekI2dERRUzR3?=
 =?utf-8?B?dmZSZTlaaFRScTdRaGllRTExYzNVSnc4T3UrRnNzTk9FQnBCYzRRcExYazQ3?=
 =?utf-8?B?Kzc5d0tUcTEwR2hoVUJkbUdMU0lSSFVYRjQrZlFTOEZXUU16Zmt3Y3ByeTU3?=
 =?utf-8?B?TS9LQmcxbE1JTVAvR0hvT2hkdmowNzlOMzhhREMvTUNEZklpblJ6TW95bkY2?=
 =?utf-8?B?WGRVS09nMTdyc1pKQmU5T1V6aWluclE0cUU0WEFKWGwrTzNucXM0WG1MRWIw?=
 =?utf-8?B?bytVKzV5VXFybHQxNUhBbW9lMU9ZT1RtQ3FaaFc1bUErUklGZjVVZnB4d3Fa?=
 =?utf-8?B?MkdkV3NERngwZUppZ1EyelZvT2NielV4dWRLa0toK3dhU3p5dWhjL1hiMnlV?=
 =?utf-8?B?RHErMGp4dGU2cGRPSjZ0R0czVFhHWE5pbHlBUEVpekVSU3FWaEpjSWxsNUov?=
 =?utf-8?B?U2sxYy9KOW1lelV1L3kweFlJcHcyVUJYT2VzNVBaWXFBNWpyaHNXMDRpZGNE?=
 =?utf-8?Q?pe0k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <221D644169F0744799E79B6D511F1AEF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4abbc7d9-d040-4cbe-b46f-08ddde9c92ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2025 21:17:01.3280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pjoUJLca2h1OtN4l9QSU6NeJmpaBV3L7raezhs7Kc3VXl4bKRqe3nKJ/eac/KbSOUrsQ4wVhsqyKjVcv7iFk/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9075
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

T24gOC8xNy8yNSA0OjQzIEFNLCBGZWRvciBQY2hlbGtpbiB3cm90ZToNCj4gYW1kZ3B1X2RtX2Nv
bm5lY3Rvcl9kZGNfZ2V0X21vZGVzKCkgcmVpbml0aWFsaXplcyBhIGNvbm5lY3RvcidzIHByb2Jl
ZA0KPiBtb2RlcyBsaXN0IHdpdGhvdXQgY2xlYW5pbmcgaXQgdXAuIEZpcnN0IHRpbWUgaXQgaXMg
Y2FsbGVkIGR1cmluZyB0aGUNCj4gZHJpdmVyJ3MgaW5pdGlhbGl6YXRpb24gcGhhc2UsIHRoZW4g
dmlhIGRybV9tb2RlX2dldGNvbm5lY3RvcigpIGlvY3RsLg0KPiBUaGUgbGVha3Mgb2JzZXJ2ZWQg
d2l0aCBLbWVtbGVhayBhcmUgYXMgZm9sbG93aW5nOg0KPiANCj4gdW5yZWZlcmVuY2VkIG9iamVj
dCAweGZmZmY4ODgxMmY5MWIyMDAgKHNpemUgMTI4KToNCj4gICAgY29tbSAiKHVkZXYtd29ya2Vy
KSIsIHBpZCAzODgsIGppZmZpZXMgNDI5NDY5NTQ3NQ0KPiAgICBoZXggZHVtcCAoZmlyc3QgMzIg
Ynl0ZXMpOg0KPiAgICAgIGFjIGRkIDA3IDAwIDgwIDAyIDcwIDBiIDkwIDBiIGUwIDBiIDAwIDAw
IGUwIDAxICAuLi4uLi5wLi4uLi4uLi4uDQo+ICAgICAgMGIgMDcgMTAgMDcgNWMgMDcgMDAgMDAg
MGEgMDAgMDAgMDAgMDAgMDAgMDAgMDAgIC4uLi5cLi4uLi4uLi4uLi4NCj4gICAgYmFja3RyYWNl
IChjcmMgODlkYjU1NGYpOg0KPiAgICAgIF9fa21hbGxvY19jYWNoZV9ub3Byb2YrMHgzYTMvMHg0
OTANCj4gICAgICBkcm1fbW9kZV9kdXBsaWNhdGUrMHg4ZS8weDJiMA0KPiAgICAgIGFtZGdwdV9k
bV9jcmVhdGVfY29tbW9uX21vZGUrMHg0MC8weDE1MCBbYW1kZ3B1XQ0KPiAgICAgIGFtZGdwdV9k
bV9jb25uZWN0b3JfYWRkX2NvbW1vbl9tb2RlcysweDMzNi8weDQ4OCBbYW1kZ3B1XQ0KPiAgICAg
IGFtZGdwdV9kbV9jb25uZWN0b3JfZ2V0X21vZGVzKzB4NDI4LzB4OGEwIFthbWRncHVdDQo+ICAg
ICAgYW1kZ3B1X2RtX2luaXRpYWxpemVfZHJtX2RldmljZSsweDEzODkvMHgxN2I0IFthbWRncHVd
DQo+ICAgICAgYW1kZ3B1X2RtX2luaXQuY29sZCsweDE1N2IvMHgxYTFlIFthbWRncHVdDQo+ICAg
ICAgZG1faHdfaW5pdCsweDNmLzB4MTEwIFthbWRncHVdDQo+ICAgICAgYW1kZ3B1X2RldmljZV9p
cF9pbml0KzB4Y2Y0LzB4MTE4MCBbYW1kZ3B1XQ0KPiAgICAgIGFtZGdwdV9kZXZpY2VfaW5pdC5j
b2xkKzB4Yjg0LzB4MTg2MyBbYW1kZ3B1XQ0KPiAgICAgIGFtZGdwdV9kcml2ZXJfbG9hZF9rbXMr
MHgxNS8weDkwIFthbWRncHVdDQo+ICAgICAgYW1kZ3B1X3BjaV9wcm9iZSsweDM5MS8weGNlMCBb
YW1kZ3B1XQ0KPiAgICAgIGxvY2FsX3BjaV9wcm9iZSsweGQ5LzB4MTkwDQo+ICAgICAgcGNpX2Nh
bGxfcHJvYmUrMHgxODMvMHg1NDANCj4gICAgICBwY2lfZGV2aWNlX3Byb2JlKzB4MTcxLzB4MmMw
DQo+ICAgICAgcmVhbGx5X3Byb2JlKzB4MWUxLzB4ODkwDQo+IA0KPiBGb3VuZCBieSBMaW51eCBW
ZXJpZmljYXRpb24gQ2VudGVyIChsaW51eHRlc3Rpbmcub3JnKS4NCj4gDQo+IEZpeGVzOiBhY2M5
NmFlMGQxMjcgKCJkcm0vYW1kL2Rpc3BsYXk6IHNldCBwYW5lbCBvcmllbnRhdGlvbiBiZWZvcmUg
ZHJtX2Rldl9yZWdpc3RlciIpDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25l
ZC1vZmYtYnk6IEZlZG9yIFBjaGVsa2luIDxwY2hlbGtpbkBpc3ByYXMucnU+DQo+IC0tLQ0KPiAN
Cj4gSSBjYW4ndCByZXByb2R1Y2UgdGhlIGlzc3VlIGJlZm9yZSB0aGUgY29tbWl0IGluIEZpeGVz
IHdoaWNoIHBsYWNlZCB0aGF0DQo+IGV4dHJhIGFtZGdwdV9kbV9jb25uZWN0b3JfZ2V0X21vZGVz
KCkgY2FsbC4gVGhvdWdoIHRoZSByZWluaXRpYWxpemluZyBwYXJ0DQo+IA0KPiAJLyogZW1wdHkg
cHJvYmVkX21vZGVzICovDQo+IAlJTklUX0xJU1RfSEVBRCgmY29ubmVjdG9yLT5wcm9iZWRfbW9k
ZXMpOw0KPiANCj4gd2FzIGFkZGVkIHllYXJzIGJlZm9yZSBhbmQgaXQgbG9va3MgT0sgc2luY2Ug
ZHJtX2Nvbm5lY3Rvcl9saXN0X3VwZGF0ZSgpDQo+IHNob3VsZCBzaGFrZSB0aGUgbGlzdCBpbiBi
ZXR3ZWVuIGRybV9tb2RlX2dldGNvbm5lY3RvcigpIGlvY3RsIGNhbGxzLg0KPiANCj4gDQo+IEZv
ciB3aGF0IHRoZSBwYXRjaCBkb2VzIHRoZXJlIGV4aXN0cyBhIGRybV9tb2RlX3JlbW92ZSgpIGhl
bHBlciBidXQgaXQncw0KPiBzdGF0aWMgYXQgZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3Iu
YyBhbmQgcmVxdWlyZXMgdG8gYmUgZXhwb3J0ZWQNCj4gZmlyc3QuIFRoaXMgcHJvYmFibHkgbG9v
a3MgbGlrZSBhIHN1YmplY3QgZm9yIGFuIGluZGVwZW5kZW50IGZvci1uZXh0DQo+IHBhdGNoLCBp
ZiBuZWVkZWQuDQoNClNvIHlvdSdyZSBzYXlpbmcgdGhpcyBjaGFuZ2Ugd2lsbCB0YWtlIHR3byBp
dGVyYXRpb25zIG9mIHBhdGNoZXMgdG8gcGluZyANCnBvbmcgdGhlIGNvZGU/DQoNCldoeSBub3Qg
anVzdCBzZW5kIHRoaXMgYXMgYSB0d28gcGF0Y2ggc2VyaWVzPw0KDQoxKSBFeHBvcnQgdGhlIHN5
bWJvbCBkcm1fbW9kZV9yZW1vdmUoKQ0KMikgVGhpcyBwYXRjaCwgYnV0IHVzZSB0aGUgc3ltYm9s
Lg0KDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMgfCA1ICsrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1k
Z3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jDQo+IGluZGV4IGNkMGUyOTc2ZTI2OC4uNGI4NGY5NDRmMDY2IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMNCj4gQEAg
LTgyMjcsOSArODIyNywxNCBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1fY29ubmVjdG9yX2RkY19n
ZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gICB7DQo+ICAgCXN0
cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphbWRncHVfZG1fY29ubmVjdG9yID0NCj4gICAJCQl0
b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5lY3Rvcik7DQo+ICsJc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm1vZGUsICp0Ow0KPiAgIA0KPiAgIAlpZiAoZHJtX2VkaWQpIHsNCj4gICAJCS8qIGVt
cHR5IHByb2JlZF9tb2RlcyAqLw0KPiArCQlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUobW9kZSwg
dCwgJmNvbm5lY3Rvci0+cHJvYmVkX21vZGVzLCBoZWFkKSB7DQo+ICsJCQlsaXN0X2RlbCgmbW9k
ZS0+aGVhZCk7DQo+ICsJCQlkcm1fbW9kZV9kZXN0cm95KGNvbm5lY3Rvci0+ZGV2LCBtb2RlKTsN
Cj4gKwkJfQ0KPiAgIAkJSU5JVF9MSVNUX0hFQUQoJmNvbm5lY3Rvci0+cHJvYmVkX21vZGVzKTsN
Cj4gICAJCWFtZGdwdV9kbV9jb25uZWN0b3ItPm51bV9tb2RlcyA9DQo+ICAgCQkJCWRybV9lZGlk
X2Nvbm5lY3Rvcl9hZGRfbW9kZXMoY29ubmVjdG9yKTsNCg0K
