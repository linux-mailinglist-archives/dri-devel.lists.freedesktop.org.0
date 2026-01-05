Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B9CF2136
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 07:31:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C5E810E098;
	Mon,  5 Jan 2026 06:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="2DI8su5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012007.outbound.protection.outlook.com
 [40.93.195.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B180110E098
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 06:31:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0WQKbPLgvt3a+g8SNcmju9lZdVaf1O6K8WWzKiDo0yWRnBU4Rkunqs7bEV33RKqGSSkpNPPajb4aCLSfe5deR6a+zkQaBL15nL6iT4Z0Vlqs14NICH0Wbwrb2eDvyZPqNpzdI+l8v/PD18PU7+PL6Z7MnP21aEMfsxgRaCFDYEv+ib/Fc1JP7BJEQSoXfyTwl8Ovw6w/5mWrCuLAuY3wEM4HRuNubqICF6Cg4s1z3afyphvNW63Y2tJqPmuUmKDtB9oveSxv71UFOKrgy4b+BRbI5XyOtKkOtocQF2/IzyFyBSqXBAHqa37gwSUjYSFlKwdbo/Q/i/TeFTFAr0Puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zY2MaNpM9pGsrupuSIoeJB7tNZYYShQJpswW318V6Vw=;
 b=T3/DflYnREb/9PiPBdSpUqX7ah4nkkGUsFp1dCTOTqIjo6SzgjgJSuxw+7RJdOtfQNNrETtEbtX6buKIWUQhoNOfEPg0WsvolpH9PosXqk6x94cw6IN+CDo7aOX+F5A8iwCYZ4eHnuzYzdySQn6m1WG4RNw3oz14Zbk1Hd45MPW0GT28Tl+HTy5y04hb13et1tkcx5Qc35iX5giqIfkbbAIALD44kVUoum9SEDHtkmqDJILtoDx0Bi6pzwR6tpWY8q7opxqGErnVxITjzMYYPLnlVaztdzR37NV59BrHKnzbRCzdJQYK6r7avTQhYkZ8M5AT+jcrJW7Yxhnd1P13GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zY2MaNpM9pGsrupuSIoeJB7tNZYYShQJpswW318V6Vw=;
 b=2DI8su5GMSLrWB8KHPLW5/Sn+8w7YwR1hOP5X8hr6HERlsJ3dZYjNnA3d5b2toFyzNujjGaavF9IAEpt49LLSyAbTKwouu+/yi3MuZi6gVCFClGDC0JgTkn7osYkq+h4a0Kc8xPhnwN5kupZQ/qoHPsZgYLMBbZ6v7crQuXgv2BMrJAbW77IYqT9hJ26y8L7/XgktLDy5TIBq+XHssERPM4gaC/uGvlVJI5PkrROh7D9zl6qfMWi4tfEebWXHbGviaZ4K3X4YMorHlLAvScBUm+rFixD7uKQkea8tBASbcbve3RoUmzR6LiHHUGN60lwh1ftqCyGaxuJQortmzd2Eg==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by PH0PR11MB5174.namprd11.prod.outlook.com
 (2603:10b6:510:3b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 06:31:02 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::253c:c449:c087:43b1%2]) with mapi id 15.20.9456.008; Mon, 5 Jan 2026
 06:31:01 +0000
From: <Manikandan.M@microchip.com>
To: <Ludovic.Desroches@microchip.com>, <Dharma.B@microchip.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] drm/atmel-hlcdc: fix memory bugs
Thread-Topic: [PATCH 0/2] drm/atmel-hlcdc: fix memory bugs
Thread-Index: AQHcRQFeQJRKPVfW2Eqh1yNSJs0dQLVDj7QA
Date: Mon, 5 Jan 2026 06:31:01 +0000
Message-ID: <b47bc69e-3b98-4462-a709-2f5d407d01f5@microchip.com>
References: <20251024-lcd_fixes_mainlining-v1-0-79b615130dc3@microchip.com>
In-Reply-To: <20251024-lcd_fixes_mainlining-v1-0-79b615130dc3@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|PH0PR11MB5174:EE_
x-ms-office365-filtering-correlation-id: f3071f23-067f-40ed-54e8-08de4c23fed1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?Ry9sTDV2d2lScVlSc1M2WElSUjJ3T20wb290eHVPUUtkV254VVAwdmRINlAx?=
 =?utf-8?B?TXp6QzRuZ1NXK1lObTZuMTIrSTlRSFI3V0Rzd0RKYm5lUksyNlJlMmJML01r?=
 =?utf-8?B?ODdtMXlLM1lLbDBZb1ZPR3lEbHRzQXh2eWpIQmFUQ3NTbW00THNWT2JSN25V?=
 =?utf-8?B?N1ZnYUU4UDVwK1lHUWdrRlZNQW1LVjhnTkpEUHJzKzJGOHFYTVhWL0dCQ2VR?=
 =?utf-8?B?M3p5QllDRFRBTlp6Skw3S09JOVpsMkNGcjRERGZuYTlPSkxEQTBXeEhZNWl4?=
 =?utf-8?B?TFpCME5HbnYwc3o1UFVCSVZvdTJrNXJWei9sZ3UrcXA0NUJRNGFhZ2Uvekky?=
 =?utf-8?B?TVZKREE1T3UwcUY4cWxFK0VIelRFUmZ2RFVmL0RRNmljQzJrZG1GVmM1aW1y?=
 =?utf-8?B?aDEwdFBiR0xwNXBzK3Yxc0NmY1NrUUhkSE1PWkRjWm94U1dwMjlrcUxKMVE3?=
 =?utf-8?B?bUUrdVdCTEZwNW9pdVRMVEp5Rk9mRWlOTDdtTmtJbEdHRXdXcGJvQnNyU0JG?=
 =?utf-8?B?dG92Z283K3JXek9BZGNFaEpLSE9iQUd3bkpHN2I1MkFLWURWdysyd2JZcENo?=
 =?utf-8?B?aWh4eXVKVW1TUHN6VlYyYmFtOVhZdFR2T0g5UDN4LzZoK1BwZFZzczRDUjFG?=
 =?utf-8?B?WGRMWGFxU1BQQzcvRDNxMHpmRVVacEE2QzYySmpYYTNnNnd2a1FkRE10WmNx?=
 =?utf-8?B?K1haV2Z1WDQ4NWtrQ1lGNHFkT0gySC9SK0VZZVE0S2lYVlZzVThMS0g5VEdt?=
 =?utf-8?B?cG5URldVV2owclRtcnpaZEZCNlZzREpqcDlHQm0rOUhJMGJhM29uRUtkdThU?=
 =?utf-8?B?Y3hPSFV4aElrNG5GWG5JanhsR2phYWg1dmpwd1JBTG1XcDBYQS95RHhtWE5s?=
 =?utf-8?B?S2VmMnRnZENzeWkwWDZwQ05RMFNPUWN6UW1Ec3lCWHI4L3g4RUJ4aFhWSlMv?=
 =?utf-8?B?WjE5M1RDcHZZdkdtNkp3dXU0Nm94NFNkdkRRallRbFF2cno3V3NvcThocjRZ?=
 =?utf-8?B?V0N4TjNTSUZ2WG1pU21BNzNGSTdlaEJnU2ZWeUNWcVBJaUZrTlY5OHVZM0w2?=
 =?utf-8?B?ZFNJNDdlRXRiR2tvQlRTaGUrNCtOMm9KWWhXbkNKM0NibTNsVmk5N29zcTdi?=
 =?utf-8?B?YVdybGl1UFc5SWNCOXo2NzlVYk1iZ1JVZEFyMEZvRXUwZXRiSVV0UWZNK0VB?=
 =?utf-8?B?c0NudFRCS1dWRUZFVytYTm9iZnZhZVZCeCtIZzJLdjFtRGR4cUFzNkJIelV2?=
 =?utf-8?B?YW9yeU4rM2dpaHhXbVpJOTY4ZzAycmpoZStGaWI5cTVWMUJjMVM0WEF0Q1Mv?=
 =?utf-8?B?WFVHMFVVUEFVNy84OVFGOVBnazdyMERqbUVOSC9XYmJYNUtCTHlvZ0ZFQmpu?=
 =?utf-8?B?VXJCS2xRUTZhd2FqZGdRUFJUTWxLanFGY1plMUVyNGxMRElxVjdhREFZRndh?=
 =?utf-8?B?TjFQZy8ydkk5cW9US0szRlhlVjU4WnNmT2RzdGxObk1GT3RFK0JSYWdNY2Q0?=
 =?utf-8?B?YUk1QzBsOElxdzMzc081RlNxSDJFNGtwdHNieGV4KzFlcVdQNFBoaWNUd3Fj?=
 =?utf-8?B?OHFqZ2xxejIwTVNnTnNSVlp6SkpMTnprdGdhWTFwUzF6Zk5UMnpzdmRLaDNC?=
 =?utf-8?B?NGtxbEtGTjdLcGl0NW1xK3NUSmFUSlhMZGczZ0F6ZTJOSHM5V3Q2VThVYXJs?=
 =?utf-8?B?N1dCT2Q2Y2VldDFhTWQra3gzTVN3MlB6TVZXRHdYS00vT05aa2JOL0Y0UzV2?=
 =?utf-8?B?Q3QrQmx4Ry90N3VGUEhXK25LT0xIMU5FVzRJR2kyRUxpTE9vM2hUSGp2aWRB?=
 =?utf-8?B?NEhOZkJYOFpzZ01LUkxLQmZtYURmRDI0a2ZRTGlNTi9EUTg5bVVBZzgxalhX?=
 =?utf-8?B?Zm90WVk0Q3BVYmdiNGltK2M0d0JwZkpaa2JsVmp2YkJ3ZDhGVTVlbE9jMXN3?=
 =?utf-8?B?Vks2ZmxOL1NxVEhDLzg0c0RRejlXOS94Qko1VUVZTmRVK2h4aGNrVDdndFA5?=
 =?utf-8?B?bzhZMThZTHJaY0NoYVhLaUV5aENlOXBNRnZubEphSWRrRkRPTlZmbUxEdzNM?=
 =?utf-8?B?ZFZrbnNiRWNLOVR2d2NmbGlhU1I3bGVzeElGdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF9623118BD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjlSYTNKeG5mazdQWExYOWdOWUFPeEJiNkg4TTB3VDl6TkNkSmxQZ3N0S0p6?=
 =?utf-8?B?UUJRaWNzWk1ucG8zeUpmc1Z3VlZCTGFoVHNNSzl2ekEvWlpMUS9XM0ZRT0hQ?=
 =?utf-8?B?aTZCWUpldHpvaVB5OTBXVFRPREdwWXNSMHowV2labnYyMTcxS0I0bHZKUWh0?=
 =?utf-8?B?Q3ZOanRpNVdOK2Fvd3pRZ3hzL3Q1SWhybm5CM250RFhMSE9yWjBKK1V4YS9D?=
 =?utf-8?B?VXlXQ3EvUDErYy9QT1M0TTdocFhaL29wZlJGa1lCcjlUUG5PSjdUU1dNWENw?=
 =?utf-8?B?czdaNzQxNFEyZWpQVEYwT2FqSXNaeU5TQ0h5ZC9xMkpXYTBTRWV5L0s4WFRi?=
 =?utf-8?B?akkvTDRBRzcyRXFOckhYRzRSRERWUkNrc2NFc25FM3B2d20ycUFCZ3Q5TEx2?=
 =?utf-8?B?Y2NIaFJpUlNIZ25FWlVXbGw1c0ZzQW8wUjk2U0pGWHVzQmk3UUdWMHNsZ1Ry?=
 =?utf-8?B?RGNvS3hGbkQ3RXJZYldDeE9yNWtWWmEwVlhjZkprSDl6a1lHUnZnR1NjTUpK?=
 =?utf-8?B?eHJlb21nWWxBRk5sOXRJT1EycFZWSzgzM01VMXZDK0pSSnhhMDFxaklTdjF0?=
 =?utf-8?B?bUU2dTB5VzF4QXFsVnNHS0FmTVJ0UGhmT2IzZkg2cENPRjltS0dVRm02TlY5?=
 =?utf-8?B?MCtJVUFGM3dzL1lxWm5rY2hJNjJlM3dobEtzK1BCckNEWDFuUTBuUjZTTlN0?=
 =?utf-8?B?OGRpMmtqZzViS3Bna3k4eHM1cC9naW5ncjRiQkJCMGVmOWsrdUlXVmxvZmMv?=
 =?utf-8?B?VGFHZUYxUjBBOHJRMTVobWhEOXozUUFSWDhPWW5QRTZVUk1aWitvUTFZOVo1?=
 =?utf-8?B?NitETWw5SG5zb1MvWHRvRjRuUmd4Vzl5UE9vUGw4cGVDYkx1R1VvQjVLcm9r?=
 =?utf-8?B?YTM0QXozVlVBQjVzOXVteXcvVXQ4K1VNZEl4c1REVDBjRTBVa2p3RHF0bnI5?=
 =?utf-8?B?Z1ZhZ203aG55N3R0L1lLNXROZWgxWGh6Mk5jak81N0tjUGdJSVBiemY0cDh4?=
 =?utf-8?B?YnpoVlFNNGtUSTB5N2hiTVZjV0sxeEdYRVZib1c1YlFxSWRBVmw0S3FkUXpQ?=
 =?utf-8?B?Q0V1Z3hFSTFoYTMvdXN1dlZNMG5OanQ1c3FWTm91ZEZZUFBscjZidzJlckhJ?=
 =?utf-8?B?aWMyTWllZk1sNnJqRnFIL1hCSGY5N1lnWEFQemZYWGxaY2h2cnBhZEZEMnV2?=
 =?utf-8?B?SW9YemdoUkhtaTV6UjFhYzVZN1psbGdUclV0VDZKTitCeG9aNU42MW4vM28r?=
 =?utf-8?B?bDA0Sis0aUhiWEc1dlV1ZHc2Z3FKRUUxQXY2K05ZUXdDWmZBRVhtdmpzV0hJ?=
 =?utf-8?B?dmRmZjNUWGdUUFVrL09OMjZXMzNQYnVFazNTVVBicXJST1dhZHc1SUxqQ2d6?=
 =?utf-8?B?cFB6UDd2RWVWQ0dUTmYrR2NuS3Q1OFkxczNNQzlmWkRtOERrOVNxQ1diRXo0?=
 =?utf-8?B?cGdXc0owOVIwdG9JdFVMbVl0SVdHQXVUcS9Da0I4bTJzanJOa1pWV0o4U29J?=
 =?utf-8?B?bCtjWXBQa2h4V0VDWnJBaHRsN1RkV253azBMY3JQM2o4OXROVXJQWEcrVzEx?=
 =?utf-8?B?MllWZ2Zka2JscVNuanYzbzE4cVIzWDJqN2FIblFhSUErblFLVHQ0dlZhRU1Z?=
 =?utf-8?B?czVIWENjR2J0dGp5R1R3T1JGNElhS3B4OHVRZVdsNTUyRkwvTDVkMGJGeWhC?=
 =?utf-8?B?NU9FMStFUXNCVzl5REY3WFlQUmhlZjFKcDhRUm11SjZkNzFULzBIak1pK0t3?=
 =?utf-8?B?dmxBS2l6SVpoQlgrYnExODhLMkpVbU1aUWMrMGRRMlh1b1pyUTh4SXk1SlFq?=
 =?utf-8?B?WWhQZWRSZDg4TDkycm56U3l3L0FtN2tIUGZBY1I4N1AwR2FzcFNWM1N3ZGNn?=
 =?utf-8?B?bDE0RGlyd00rY0RsTlc1VnIxY0htSWtuRk00OUNtSUVJZ1hmYzhaaXoxSzFu?=
 =?utf-8?B?VWE0ZGFzOVduanlCRzFsS0JlTWtRZlk3Q3UwcWRNR3hHemk1OVJNWVVDZkpv?=
 =?utf-8?B?RGR5QU5qa1l2N1orc0tzUDNaQzRGLzVoS09lZkFPZ3UzcGFwQlRlQTZ5eUR5?=
 =?utf-8?B?alJTakZhOE04VzkrTTNsR3U5NVo5Z0JkNitiV3dKU2gyTi9TOGQ0YkZmeW53?=
 =?utf-8?B?dzZMREFrblFYaGNQdC9lNVd3VjBVa09vTGptK3Q1OEhRalM3cU9sWjRabFJt?=
 =?utf-8?B?Zk5IQmFMWkdTT2tLM2Y3MnkrSldkUFRzcjRoM0tyWmtHY0M2eDRWTDQwdUR5?=
 =?utf-8?B?TFlFanBxd3IvS1B6ak1tUVZQSS9zUmhraUd5MEp3Q2ZLSU5Id3czOGFlMjBo?=
 =?utf-8?B?b1lTT3lTWkl0aWlncGFZZ2hiR3B0Vks2OVFoWVB5RmVCN1JyZEhKZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AEAD69AC9524E4FA396BE04461C7E48@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3071f23-067f-40ed-54e8-08de4c23fed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 06:31:01.5577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0Zkj6nE2T2eJOnG1UMS0MhJ52BAbp6Hj/KjPK8jUpMxZEN9bH8DMZgsCaQXym3y9gEZu3ZTPS7SicexH0xJETQdWnpA3kRG1Lv7W1NQcTTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5174
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

T24gMjQvMTAvMjUgOTo0NCBwbSwgTHVkb3ZpYyBEZXNyb2NoZXMgd3JvdGU6DQo+IFRoZXNlIHR3
byBwYXRjaGVzIGZpeCBhIG1lbW9yeSBsZWFrIGFuZCBhIHVzZSBhZnRlciBmcmVlIGJ1Z3MuDQo+
IA0KPiBUaGUgbWVtb3J5IGxlYWsgYnVnIGhhZCBiZWVuIHJlcG9ydGVkIGJ5IHNldmVyYWwgdXNl
cnMuIFRoZXJlIHdlcmUgc29tZQ0KPiBhdHRlbXB0cyB0byBmaXggaXQgaW4gdGhlIHBhc3QsIGJ1
dCB0aGUgcmVzb2x1dGlvbnMgcHJvcG9zZWQgY2F1c2VkDQo+IG90aGVyIGJyZWFrYWdlcy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEx1ZG92aWMgRGVzcm9jaGVzIDxsdWRvdmljLmRlc3JvY2hlc0Bt
aWNyb2NoaXAuY29tPg0KPiAtLS0NCj4gTHVkb3ZpYyBEZXNyb2NoZXMgKDIpOg0KPiAgICAgICAg
ZHJtL2F0bWVsLWhsY2RjOiBmaXggbWVtb3J5IGxlYWsgZnJvbSB0aGUgYXRvbWljX2Rlc3Ryb3lf
c3RhdGUgY2FsbGJhY2sNCj4gICAgICAgIGRybS9hdG1lbC1obGNkYzogZml4IHVzZS1hZnRlci1m
cmVlIG9mIGRybV9jcnRjX2NvbW1pdCBhZnRlciByZWxlYXNlDQo+IA0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jIHwgNiArKy0tLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiAtLS0NCg0KRm9y
IHRoZSBFbnRpcmUgc2VyaWVzLA0KDQpSZXZpZXdlZC1ieTogTWFuaWthbmRhbiBNdXJhbGlkaGFy
YW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KDQpUaGFua3MgTHVkb3ZpYy4NCg0KPiBi
YXNlLWNvbW1pdDogNzJmYjAxNzBlZjFmNDVhZGRmNzI2MzE5YzUyYTA1NjJiNjkxMzcwNw0KPiBj
aGFuZ2UtaWQ6IDIwMjUxMDI0LWxjZF9maXhlc19tYWlubGluaW5nLWExMjM0ZDgxYTc2OA0KPiAN
Cj4gQmVzdCByZWdhcmRzLA0KDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4g
TS4NCg0K
