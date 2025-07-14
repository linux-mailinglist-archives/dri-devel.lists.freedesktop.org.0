Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B7B045E7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 18:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E0210E2A1;
	Mon, 14 Jul 2025 16:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Lj1fYBpL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260DD10E0A7;
 Mon, 14 Jul 2025 16:52:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOp+lzwqYzbxll5kMS4byNHAyff+nhZdszOGW+YZ0aNgEieTLiURfZRxRm0GigBlok2RLTfBDYrn79sUPp6c0enaHrm/i9owhoKwv03hvaVjrla5D3W40bOYNbcdxv2TnUciD+heb4OODokelOWplXCo0ZVtJgSczlK6/Z5jWKUI/vToDEmKXeJISB9MwMctSbH44q/Zxi/23F+hImJL/rsNndBDs1g9jpLh2SxgEbiUYSQyKTHBWtzXKqLFOS5G44qIep3fjimZNjrm0bIVRtsdkCJbhwbgJ4fPGVR0lkGAYCJ1pVk3azuD46wj3QbIX+duYBHFRP7INLcU3ZhGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAs2SZnRHoOG//bCdbS5kbD1wdKKONlrdKMi0/xOf0g=;
 b=ah66fXjjIEakyFZ41n0tBU2GsH0Di/v/DuwIT5RxoarE0RSffyrREAzbuFqYHsUpV+vNpgHwVai98es0D47xLKCizFQLV0ix5KvZ4s749NEmXEkhxMgqrgGdg/cLThP9vysXDnJsY5rPvZcTpM1PdhgcxZRJDIxYpbYdCe6c+nOcJ4f+rOvzyuEzWA8es7clHjdY2WfhOE2w+WjnmF75WT0+9w2eP4RDvEWwQpXcvKvmV1Y6BQbAHf9qTX0eiOBw9/fg2ikPmMLKbxwrjUrqkORDhhwt93jN7h1j/HAMPTXf8lqslT3aDDkk+L0PbnrUunUEoH2WG3n2GzGMebWpgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAs2SZnRHoOG//bCdbS5kbD1wdKKONlrdKMi0/xOf0g=;
 b=Lj1fYBpLWivH2Jq9T48Nc7+RseTJrGh/ayiCYrJ45jauJvBjOgleSRjZ0ZQDxQJbV5eZ6pToLDPgcTwgZVRjhhVK62HYeKwsWgwUdyCM798bvYt3F2+JdsMscfyxeiYTnOoq0XSDEE72nWZMOf2Svg5vtjJkh74LZJ65tVi0YpU=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5724.namprd12.prod.outlook.com (2603:10b6:8:5f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.33; Mon, 14 Jul 2025 16:52:23 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 16:52:23 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, "Ho,
 Kenny" <Kenny.Ho@amd.com>
CC: "Olsak, Marek" <Marek.Olsak@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "Zhang, GuoQing (Sam)" <GuoQing.Zhang@amd.com>
Subject: Re: [PATCH] drm/amdgpu: fix link error for !PM_SLEEP
Thread-Topic: [PATCH] drm/amdgpu: fix link error for !PM_SLEEP
Thread-Index: AQHb9Jeh7iYLBsEnJ0q+oYD5dzOV5g==
Date: Mon, 14 Jul 2025 16:52:23 +0000
Message-ID: <d2de07ae-9558-41e8-a0d3-ae46bbaa19de@amd.com>
References: <20250714081635.4071570-1-arnd@kernel.org>
 <db654178-a6d7-416c-bab6-b494a7c118ce@amd.com>
 <724b4600-d983-434a-acf6-68cd87b04636@app.fastmail.com>
 <8ed29f44-9f64-4b8a-a5f2-c8ee374df40d@amd.com>
In-Reply-To: <8ed29f44-9f64-4b8a-a5f2-c8ee374df40d@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|DM4PR12MB5724:EE_
x-ms-office365-filtering-correlation-id: b76be406-ba76-4201-5ed2-08ddc2f6ce23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U0xLNnBieFlkYTU1UEJDM2hyTllCTVJiTDFtblhZNE1lbFRoZnFnTnhOamIx?=
 =?utf-8?B?ZUp1OVRKWDVkaUNMV3VNZ0NQMVEwTVRNQUh3K0JGckhxZXd2Y3FTZE1GeE1E?=
 =?utf-8?B?dzNaSjBtUHVGakxWTEhSVEx2elkza0FFeTZ0UUNYeWlrVDBlckFMNGQ5Wjcv?=
 =?utf-8?B?cHdxR2UvQ0ZNTUtRaUkyMkdKVmdER0RXcTBtMzFjK3VJVXdacVZrQnR1QXdz?=
 =?utf-8?B?NTc0d2JPYVhjRVlYbnVEU2h0R1hxMWYzeDdFNUlmMElvMFJhZzRNM0hpcG92?=
 =?utf-8?B?R3JQZWVObS94V3dTaVZxYkJxNllMNVdmL2QyVG5FRUwrKzdHVlJjWEVieXk3?=
 =?utf-8?B?RFd1YTNObmdaemRoZ2M1eDhIMlJ4cXJqeGJOOVFMNmszaUZvSDFpVlpVZUI3?=
 =?utf-8?B?YkhmM1Y5dmVIY1VLbWxjMWtNMTBKblNhaXFaQ2JDU1QvVUFEMEMyZC9xRFZP?=
 =?utf-8?B?eTRiUlh5ZmFiREMrWHU5TytrK01RZ28rOU53WDF1ZWpnN2tPTVIwam9mYTZH?=
 =?utf-8?B?SlRPWkxVb3BoZ3VlLzF2SGU1b05kMmh0SFpscHY5ejFvUUFLWkFvK0ZEbFFh?=
 =?utf-8?B?ZGZkdWVZRDdjTEM2T0wrektjOFpDUDZkZ1VJNS82VzUzc3hSbjVycnp0WXVu?=
 =?utf-8?B?RkJLVzRRN1NmOHFpTjZaU1FRY2hPdmt2b2ZhTU5Wck8xdm9BSDErVXN6UG5n?=
 =?utf-8?B?Y1FRZVJ3M2JkQVVZT2JIYlc1eU8zeGxHVUNPOTVWR2drNXNMMEZ6bEhLWUlU?=
 =?utf-8?B?TU5BMnVjNkxjRWRMVFFjTVRieUMxT1QvL1JoYksvQ1dDcjVSNG4zS1pDY1U1?=
 =?utf-8?B?NDREUnkzWDV1RmI5STNYemZHRUdZRHlqSTh6VTdwUmwxa3BKNXNDRjdCRWdk?=
 =?utf-8?B?VDBGR1d6VFFoOGtsRnZrSTZJa0hYSzZWUnZKbURnZlE3Mk53MnpsNi9xcHJC?=
 =?utf-8?B?MG5KcVJCRUR2ekF0Q08wY1hmSnYxZk1yMVdIUDE1cHBLcXhycnJHRUxaQk9I?=
 =?utf-8?B?cGlaRlh2OFlwYTZQTk1SdHZpc2NZU0ZRby8rTG8wdHV3bHNNbXBMS3lHbWVh?=
 =?utf-8?B?RnZkQ0pyT3I1YSs5TkF5V3VTVmFwUWNYaC92czhXNm4vdC9makt4WXJ2dHRk?=
 =?utf-8?B?S0lwbjVGazZaU1FaZ1UzZ2ZJTU45UldtcHVIUE1qNVMxSVlRa1VCZ0d3Rm0y?=
 =?utf-8?B?azJIanVwbG9HWlhmaUU5RitEbUlKbEM4T1lkeXVXa0JzYnZMeUNpczg5c1JI?=
 =?utf-8?B?c3Y4a28rQTJmd0I3cHJhZXBRME1HTVRmZnhiczNDcmluNHFtVHRROTlXUllO?=
 =?utf-8?B?SXphVEIxYjJvVURMczlYVEJYN1FmOWhLTGdhaloxZENMazNqMURab1FMRFhq?=
 =?utf-8?B?a3FyNWd3d3FNSG1URGdmKzdtQzY4NGt3SW1Pdmd6bnhPOWtwNHNqOEdpNDY3?=
 =?utf-8?B?ZDc1eWpoYzV2d21qdXJlaGFCYjhSczlIRzhlZXV2eEVXQnErQVFVYTYrTU9h?=
 =?utf-8?B?cUVXci9pd3hJb09QNjNwanNJakZmVW1teUVWMnJMR3lFcXd2YVFrNG9WdnBu?=
 =?utf-8?B?R1F2QUFKbG1BcFhyTnVuZlJvcDV6L1FHSVZ0V3JqTlcwVU1DcG5ISFhPc1JF?=
 =?utf-8?B?ZXQrUktvL2J0Z2YyWHR2QXBqR09COEs1WThqUE51RHEvZzBHYjkxRHQrbWFM?=
 =?utf-8?B?ZTZUVk1Ga2VrNTByS1grUTZzdXQySFVHUkRxenBtR2hBd280TDllWjZrT05h?=
 =?utf-8?B?TFdEczZCR2psMnV1M2tXdVVRR3ZTT3pJQ210UG0wTGdqaTlxZUYzMFk5RXVG?=
 =?utf-8?B?dyt4YjBIN3ZLbzFuZW84bjVyMGk2RlNEU1JSclUrUUxUYU5rUWJEaEs4Qyt6?=
 =?utf-8?B?ekxXZDJWYjhWRnd2RmNsR0NzazdCVzhhb3pYQnFldkhNMFhka0ZiNWxZU0FO?=
 =?utf-8?Q?uhffhehShbs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnBRSlRiNkN1TDRXVzZUMHNLeXlneTVYaHFsdVVQV2dQOW9jMnp4RU9lbmFX?=
 =?utf-8?B?REJSS3VVMHlHM0JpV0Q4RFNieVJUT25wOFFJS05tYytxcndOMHBFZTd0RHFp?=
 =?utf-8?B?VWdHd2VSQkVhZUNIWEk2dkdFdlplNCs4OXNlL1llZmhsY0wvOXRtOTE4cUFE?=
 =?utf-8?B?WlZZV1Z2RDNEdlFUVlk0ZE5rRWlJbS9nNFNsbGtxYVg2NnVSVHpSL3Uwb0lI?=
 =?utf-8?B?L3pIakZhd3FYN0hIWjgvdGcvQ3krYXpTYSs1ZFE0aHFjb2tHUk5ORzRTVnJY?=
 =?utf-8?B?NG5KRlBzTENnSS81NSthYnBpMDlGUU1YWUhwcVpZTllNcVpkbVk2bmJoM1R4?=
 =?utf-8?B?d0NyZzNQVHFrUnE3VzlGWUJOdjl1MGh6NmJwU1ZPbHRUbGRCZnNtYUs1L1Fv?=
 =?utf-8?B?RzA0eVd6VFdaclR3N1ZqMDdOeFd6SHdwMUkzSVRsRFRZNlpTRGF0azZVMG9j?=
 =?utf-8?B?SmpQVVRmcjloekpETGo2S2xwZlFHRWNZenhvZWhSZzk3UXRiTUJITDIyWFdC?=
 =?utf-8?B?K2NQTkh1SHNLTjJBVkwrQkxtNmV1MkRIU2NqNGZNaEFqKzdRWGV5NFJpaFNp?=
 =?utf-8?B?UWJRdEdVcG5ySGtVUWNKKzR0WmVIZmVBdHZFblJ0bkwzLzFPcDliN0lGU0hn?=
 =?utf-8?B?bVZQTEZVTERSc2NBU29DVVp0VXVvYVI0RXNaZElrZElhWUhoVjQzVXRVMmtn?=
 =?utf-8?B?YjltbE4xNUp4aFpQaFBab2k2NGZsbEt3am8wL3dKOUM2Y3I3YkMxZEJqelJv?=
 =?utf-8?B?YVg0N0lMM1ZiR0k0akRDOEZxZGxtbmxJaTE2c3ZlVW9OSXZSZ2pmcUo2QUYv?=
 =?utf-8?B?UCtkajJiZnJwQ0JWdFZadDVZMmNuTTZaZlBLU3djMU1JMkl1d0lsTDhHcnh5?=
 =?utf-8?B?NEVQa3VONThhVTZqb1dYTHBOU3FzWlJQTlluUHVQZzY5QUtheC9MU0VaYXpO?=
 =?utf-8?B?Z0NlOVhFU25VTHBTNktmc2F2YmRUdnEwbmxGTThWbFlmMUVyclNIQUVWSllu?=
 =?utf-8?B?aXlBVXprZ2VHRURTaWhMazE2RXp0em5Iem5aVUN6bTFxTllmMVlhcTRqcWZq?=
 =?utf-8?B?SkRaS1hOSkNUWDNoaklSbkdRenhUOFp0b3hZT3ZZK2xzaDUwMTB4YWR3NDJ2?=
 =?utf-8?B?ZU1JeDBGWHNHazNEcldqZ3lFdCtKRnRNN1BLYkl4cTlBaVBvd1FITytDWXVz?=
 =?utf-8?B?T0RoNFhRaDlZbmpiR2gwRXZCMzYxUG1YcjJrOVJxeGoxR2phL25VaUh1Sm1C?=
 =?utf-8?B?ZG03cVhYaUdWVkNTSzJlY2N6VjJodnBhS1JHc3VoS0dvNmprbGc5TFpyOFd1?=
 =?utf-8?B?R0w5ajBMQ3JxTGRhYmtCK0FHR01kMzl2dFJzamh6Y3hEMDJqcFR6YmtudkJs?=
 =?utf-8?B?eTNZSmJQR0xMK2pheUhjYnZ6SjlRQ1d4eXh0Ynp4dktBZklNNXhOWExnL29n?=
 =?utf-8?B?OWRlU01UT21kRmZwREk0L3U0REpFdFp2WFBCWDJlQUVETTdkR3NDWXRJR1hy?=
 =?utf-8?B?L3UwYUswYXl1VXhDbnBVaEhSMDVxQWx0alFMYkZ6VFhBRFhzYlBKSDlpWW5B?=
 =?utf-8?B?WGk2ZzFXaTl0dkhVUGpnSEh3NTNQYlM3YU0rODcyWFQ5b1dBbC9pUnUwWTRr?=
 =?utf-8?B?UkVNM2V6UUdLVEQzWFFNaVBhYUU0UjFRSmN3NnVoaXFHWVZkUmcvdzNhaXJk?=
 =?utf-8?B?NXhXODJqMm9HMVlrN2tYN0NqdEJIVU9zSkZHblQ5MUtCbnVkQitkMTRqSGdR?=
 =?utf-8?B?NWdyL0NtNkJFUmdlanZCZENoRExocHJYQU1VcGxUMXBYWlJYQ1h2TmFMdkFO?=
 =?utf-8?B?WXJ5RFRvUGx2NGNuTWlYbkxzZWxrc3QzMk55ZVpnVHh2aVpZRVBoZmlnNjR0?=
 =?utf-8?B?WTdJakEyZ1BQbk5ZUTFyUW5zckVaQ0IzWU43MnpFcHZJTEhMWlJYRE1lSTFL?=
 =?utf-8?B?ZnY4bTU5WGgrN0g5V3k2STd4d0ZKcmoyWng1ZHZod0dCaFJIZmtpdkdCNnNW?=
 =?utf-8?B?Ung1aGpSZmhlSStGdThEZVlWU0xPYzRMMW8yYzZWSk1aMUpTeS9ZRXJIRUNM?=
 =?utf-8?B?MHBXVDBXM3VQS3JXejlUdm9wNWZTUCtxeUordHl4QmE4THJnUTdzeDNpSERQ?=
 =?utf-8?Q?cv0M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F8F6F4FEE198FF49AB72DCF69179AABA@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b76be406-ba76-4201-5ed2-08ddc2f6ce23
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 16:52:23.2625 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: teVs/Qdr/MMmDNmAhi1jck6i14FvQhGj+Q7vhKhghUf7kSlTiVPrkHRRaaMrg5mS1B1MSPBfWCviVpCoDX83Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5724
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

T24gNy8xNC8yNSAxMDo0OSBBTSwgTWFyaW8gTGltb25jaWVsbG8gd3JvdGU6DQo+IE9uIDcvMTQv
MjUgMTA6MDEgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+PiBPbiBNb24sIEp1bCAxNCwgMjAy
NSwgYXQgMTY6NTksIExpbW9uY2llbGxvLCBNYXJpbyB3cm90ZToNCj4+PiBPbiA3LzE0LzI1IDM6
MTYgQU0sIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+Pj4+IEZyb206IEFybmQgQmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+DQo+Pj4+DQo+Pj4+IFdoZW4gcG93ZXIgbWFuYWdlbWVudCBpcyBub3QgZW5h
YmxlZCBpbiB0aGUga2VybmVsIGJ1aWxkLCB0aGUgbmV3bHkNCj4+Pj4gYWRkZWQgaGliZXJuYXRp
b24gY2hhbmdlcyBjYXVzZSBhIGxpbmsgZmFpbHVyZToNCj4+Pj4NCj4+Pj4gYXJtLWxpbnV4LWdu
dWVhYmktbGQ6IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYubzogaW4gDQo+
Pj4+IGZ1bmN0aW9uIGBhbWRncHVfcG1vcHNfdGhhdyc6DQo+Pj4+IGFtZGdwdV9kcnYuYzooLnRl
eHQrMHgxNTE0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byANCj4+Pj4gYHBtX2hpYmVybmF0ZV9p
c19yZWNvdmVyaW5nJw0KPj4+Pg0KPj4+PiBNYWtlIHRoZSBwb3dlciBtYW5hZ2VtZW50IGNvZGUg
aW4gdGhpcyBkcml2ZXIgY29uZGl0aW9uYWwgb24NCj4+Pj4gQ09ORklHX1BNIGFuZCBDT05GSUdf
UE1fU0xFRVANCj4+Pj4NCj4+Pj4gRml4ZXM6IDUzMDY5NGY1NGRkNSAoImRybS9hbWRncHU6IGRv
IG5vdCByZXN1bWUgZGV2aWNlIGluIHRoYXcgZm9yIA0KPj4+PiBub3JtYWwgaGliZXJuYXRpb24i
KQ0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPj4+
DQo+Pj4gV2UncmUgZ29pbmcgdG8gZml4IGl0IHVzaW5nIHRoaXMgc3R1YiBpbnN0ZWFkLg0KPj4+
DQo+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcG0vMjAyNTA3MTIyMzM3MTUuODIx
NDI0LTEtIA0KPj4+IHN1cGVybTFAa2VybmVsLm9yZy8NCj4+Pg0KPj4+IEl0J3MgaW4gZHJtLW1p
c2MtbmV4dCBhcyBvZiB0aGlzIHdlZWtlbmQgYW5kIGl0IHNob3VsZCBzaG93IHVwIGluDQo+Pj4g
bGludXgtbmV4dCBpbiB0aGUgbmV4dCBkYXkgb3IgdHdvLg0KPj4NCj4+IFRoYXQgcGF0Y2ggbWFr
ZXMgc2Vuc2UgYXMgd2VsbCwgYnV0IEkgdGhpbmsgbWluZSBpcyB1c2VmdWwgYXMgYW4NCj4+IGlt
cHJvdmVtZW50IGV2ZW4gaWYgaXQgZG9lc24ndCBhZGRyZXNzIGEgbGluayBmYWlsdXJlIGJ1dCBv
bmx5DQo+PiByZWR1Y2VzIHRoZSBvYmplY3Qgc2l6ZSBieSByZWR1Y2luZyB0aGUgYW1vdW50IG9m
IGRlYWQgY29kZS4NCj4+DQo+PiDCoMKgwqDCoMKgwqAgQXJuZA0KPiANCj4gVGhhbmtzIGZvciBw
b2ludGluZyBpdCBvdXQuwqAgWW91J3JlIHJpZ2h0LsKgIEknbGwgZ2V0IGl0IHBpY2tlZCB1cC4N
Cj4gDQo+IFJldmlld2VkLWJ5OiBNYXJpbyBMaW1vbmNpZWxsbyA8bWFyaW8ubGltb25jaWVsbG9A
YW1kLmNvbT4NCg0KVGhlIGludGVybmFsIEFNRCBDSSByYWlzZWQgYSBwcm9ibGVtIG9uIGEgZEdQ
VSAoZGV0YWlscyBiZWxvdykuICBJIHRoaW5rIA0KdGhhdCB0aGUgZGlmZiBtaWdodCBiZSBhIGxp
dHRsZSBvdmVyemVhbG91cywgcGVyaGFwcyBvbiB0aGUgcG93ZXJvZmYoKSANCmNhbGxiYWNrPw0K
DQpIZXJlIGlzIHRoZSBhc3NlcnRpb24gdGhhdCBnb3QgcmFpc2VkLg0KDQpodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMvLS9ibG9iL21hc3Rlci9saWIvYW1k
Z3B1L2FtZF9wY2lfdW5wbHVnLmMjTDM3Ng0KDQpGYWlsZWQgdGVzdChzKQ0KPT09PT09PT09PT09
PT0NCg0KaWd0QGFtZGdwdS9hbWRfcGNpX3VucGx1Z0BhbWRncHVfaG90dW5wbHVnX3dpdGhfZXhw
b3J0ZWRfYm8NCn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+DQoNCiAgIEVycm9yIG1lc3NhZ2UNCiAgIC0tLS0tLS0tLS0tLS0NClN0YXJ0
aW5nIHN1YnRlc3Q6IGFtZGdwdV9ob3R1bnBsdWdfd2l0aF9leHBvcnRlZF9ibw0KKGFtZF9wY2lf
dW5wbHVnOjk4MSkgYW1kZ3B1L2FtZF9wY2lfdW5wbHVnLUNSSVRJQ0FMOiBUZXN0IGFzc2VydGlv
biANCmZhaWx1cmUgZnVuY3Rpb24gYW1kZ3B1X2hvdHVucGx1Z193aXRoX2V4cG9ydGVkX2JvLCBm
aWxlIA0KLi4vbGliL2FtZGdwdS9hbWRfcGNpX3VucGx1Zy5jOjM0NDoNCihhbWRfcGNpX3VucGx1
Zzo5ODEpIGFtZGdwdS9hbWRfcGNpX3VucGx1Zy1DUklUSUNBTDogRmFpbGVkIGFzc2VydGlvbjog
ciANCj09IDENCihhbWRfcGNpX3VucGx1Zzo5ODEpIGFtZGdwdS9hbWRfcGNpX3VucGx1Zy1DUklU
SUNBTDogTGFzdCBlcnJubzogMiwgTm8gDQpzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQooYW1kX3Bj
aV91bnBsdWc6OTgxKSBhbWRncHUvYW1kX3BjaV91bnBsdWctQ1JJVElDQUw6IGVycm9yOiAwICE9
IDENClN1YnRlc3QgYW1kZ3B1X2hvdHVucGx1Z193aXRoX2V4cG9ydGVkX2JvIGZhaWxlZC4NCioq
KiogREVCVUcgKioqKg0KKGFtZF9wY2lfdW5wbHVnOjk4MSkgYW1kZ3B1L2FtZF9wY2lfdW5wbHVn
LUNSSVRJQ0FMOiBUZXN0IGFzc2VydGlvbiANCmZhaWx1cmUgZnVuY3Rpb24gYW1kZ3B1X2hvdHVu
cGx1Z193aXRoX2V4cG9ydGVkX2JvLCBmaWxlIA0KLi4vbGliL2FtZGdwdS9hbWRfcGNpX3VucGx1
Zy5jOjM0NDoNCihhbWRfcGNpX3VucGx1Zzo5ODEpIGFtZGdwdS9hbWRfcGNpX3VucGx1Zy1DUklU
SUNBTDogRmFpbGVkIGFzc2VydGlvbjogciANCj09IDENCihhbWRfcGNpX3VucGx1Zzo5ODEpIGFt
ZGdwdS9hbWRfcGNpX3VucGx1Zy1DUklUSUNBTDogTGFzdCBlcnJubzogMiwgTm8gDQpzdWNoIGZp
bGUgb3IgZGlyZWN0b3J5DQooYW1kX3BjaV91bnBsdWc6OTgxKSBhbWRncHUvYW1kX3BjaV91bnBs
dWctQ1JJVElDQUw6IGVycm9yOiAwICE9IDENCihhbWRfcGNpX3VucGx1Zzo5ODEpIGlndF9jb3Jl
LUlORk86IFN0YWNrIHRyYWNlOg0KKGFtZF9wY2lfdW5wbHVnOjk4MSkgaWd0X2NvcmUtSU5GTzog
ICAjMCAuLi9saWIvaWd0X2NvcmUuYzoyMDc1IA0KX19pZ3RfZmFpbF9hc3NlcnQoKQ0KKGFtZF9w
Y2lfdW5wbHVnOjk4MSkgaWd0X2NvcmUtSU5GTzogICAjMSANCi4uL2xpYi9hbWRncHUvYW1kX3Bj
aV91bnBsdWcuYzozNzcgYW1kZ3B1X2hvdHVucGx1Z193aXRoX2V4cG9ydGVkX2JvKCkNCihhbWRf
cGNpX3VucGx1Zzo5ODEpIGlndF9jb3JlLUlORk86ICAgIzIgDQouLi90ZXN0cy9hbWRncHUvYW1k
X3BjaV91bnBsdWcuYzo1MCBfX2lndF91bmlxdWVfX19fcmVhbF9tYWluMzQoKQ0KKGFtZF9wY2lf
dW5wbHVnOjk4MSkgaWd0X2NvcmUtSU5GTzogICAjMyANCi4uL3Rlc3RzL2FtZGdwdS9hbWRfcGNp
X3VucGx1Zy5jOjM0IG1haW4oKQ0KKGFtZF9wY2lfdW5wbHVnOjk4MSkgaWd0X2NvcmUtSU5GTzog
ICAjNCANCi4uL3N5c2RlcHMvbnB0bC9saWJjX3N0YXJ0X2NhbGxfbWFpbi5oOjU4IF9fbGliY19z
dGFydF9jYWxsX21haW4oKQ0KKGFtZF9wY2lfdW5wbHVnOjk4MSkgaWd0X2NvcmUtSU5GTzogICAj
NSAuLi9jc3UvbGliYy1zdGFydC5jOjEyOCANCl9fbGliY19zdGFydF9tYWluQEBHTElCQ18yLjM0
KCkNCihhbWRfcGNpX3VucGx1Zzo5ODEpIGlndF9jb3JlLUlORk86ICAgIzYgW19zdGFydCsweDI1
XQ0KKioqKiAgRU5EICAqKioqDQpTdWJ0ZXN0IGFtZGdwdV9ob3R1bnBsdWdfd2l0aF9leHBvcnRl
ZF9ibzogRkFJTCAoMC4wMzNzKQ0KDQoNCiAgIERtZXNnIG91dHB1dA0KICAgLS0tLS0tLS0tLS0t
DQo8Nj4gWzcwMS40Mjk1MTZdIFtJR1RdIGFtZF9wY2lfdW5wbHVnOiBleGVjdXRpbmcNCjw2PiBb
NzAxLjQzNDI1OF0gW0lHVF0gYW1kX3BjaV91bnBsdWc6IHN0YXJ0aW5nIHN1YnRlc3QgDQphbWRn
cHVfaG90dW5wbHVnX3dpdGhfZXhwb3J0ZWRfYm8NCjw2PiBbNzAxLjQ3NTUwOF0gW0lHVF0gYW1k
X3BjaV91bnBsdWc6IGZpbmlzaGVkIHN1YnRlc3QgDQphbWRncHVfaG90dW5wbHVnX3dpdGhfZXhw
b3J0ZWRfYm8sIEZBSUwNCjw2PiBbNzAxLjQ4MzgzOV0gW0lHVF0gYW1kX3BjaV91bnBsdWc6IGV4
aXRpbmcsIHJldD05OA0K
