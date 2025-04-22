Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01586A972A7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 18:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDA010E5D9;
	Tue, 22 Apr 2025 16:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uRgIlBNS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3E110E1B8;
 Tue, 22 Apr 2025 16:26:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xyi7OXCI9jVol68hGqHwLpdW8XFIhoWPHP4mWNZppR7yheFh2Rn7q1ms/gM3zgx5zsYpbjZheT5x+P3zj3HpF4JYH9fAs5Aovrc6Xk/OVc2Vus5R9EXQmRx12q1RaS9f89fZpl8yaum4z5B6B9LjOMr2H8JopiWWrNx0Did1ieVC+HroEON3C7tQBLoy/MqLbOzmVK37S2dRhr40JnQgSFUgo29aUiEc8CM0smGaanVqmBdb85nOaUnKbbFzD0rN90TmLUu5rmQmjnU//Q4PUFdJenzdQaa9b3afJeCH9zeojCuBvq1NP/L9qb5VbzvSBGjvcS8CrG98Gca1DqRrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVAUBL5gXVn6xRmEJqPC4oIWflYFNtF0mKy0TC6U5xc=;
 b=UMNLe09AABFa85/nFBR31muhCJ8o89sERn0LNnS+jxEpuXYAUWw18F2G1jmp1kX9V063IaakUwodlgmgfDhiHWTSoQcervQfAoarAnGXTjbUX0mZ2AtTKHhmHLlR/ZhpIseHAM5lEtCZcr5VbosAVeFRnY5oCsmE73ytyCqe3ufpXExeB3LUsljZqkvNY/Sss7z8VMztX1xXcg51vbyPHI7ndbFG7gEwoM6G1sIZ+MqO7S7MG1TkH7isGegrTSGSJdTOJO92OSiuddzgMbDpGeGUwa6igAJPbFafvQMSciz6RSe3LUNX0+gN8v/aN7GfTTThJ05XQEZYhySuF2IZ2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVAUBL5gXVn6xRmEJqPC4oIWflYFNtF0mKy0TC6U5xc=;
 b=uRgIlBNSf3j/s/eBPfnknIxWjjlGk1A7aV7iM1c64FAVUib6Ap1Wnvx/09oGe6W61LOKjKGwK+n3K0UgqYSX4NYkWN+T4ARhWs3XirLW9sYy+0e8TWSbe9irQaz48qklDMZNP9JXoyKA6031T+zLKRtopxVow4PTb5mQc01X42I=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by SJ0PR12MB6829.namprd12.prod.outlook.com (2603:10b6:a03:47b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 16:26:08 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%5]) with mapi id 15.20.8678.021; Tue, 22 Apr 2025
 16:26:07 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
CC: Denis Arefev <arefev@swemel.ru>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Chunming Zhou <david1.zhou@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
 <lvc-project@linuxtesting.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in list
Thread-Topic: [PATCH v2] drm/amdgpu: check a user-provided number of BOs in
 list
Thread-Index: AQHbsDxNn0cq9PE0GkOcvOvcbpmC67OvbNkAgABMcQCAACyBgA==
Date: Tue, 22 Apr 2025 16:26:07 +0000
Message-ID: <BL1PR12MB5144467CB7C017E030A4C3E3F7BB2@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250418083129.9739-1-arefev@swemel.ru>
 <PH7PR12MB56852EECD78C11BD15157AF383BB2@PH7PR12MB5685.namprd12.prod.outlook.com>
 <CADnq5_NLEUZget2naQm9bYH1EsrvbhJCGd7yPN+=9Z_kKmUOCw@mail.gmail.com>
In-Reply-To: <CADnq5_NLEUZget2naQm9bYH1EsrvbhJCGd7yPN+=9Z_kKmUOCw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=cdebe598-687e-4db4-89cd-d064efcdf1f5;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-04-22T16:25:25Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|SJ0PR12MB6829:EE_
x-ms-office365-filtering-correlation-id: f7d945a6-35d5-4ed1-4555-08dd81ba62d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WlUwU3JYQzRaSG01S01WYW53K2Qvd2htQVdqOG9zSVZpVDNQaW1CanVoRlJi?=
 =?utf-8?B?cDhzZzdBYjZuRXovZ0xWLzJ5eG9qeWI0WThSejlVWnlGMVc0Ymw0UXNWQXpL?=
 =?utf-8?B?TDA5cWI4WXVId0x5MlIybDZjU1hYVlp2cnlZR0lmYUkxK1RiVGJ0cFlxR0Jk?=
 =?utf-8?B?N0gxV0s5cHJ6eUJIOHhJVzFaRWR0a0VVZnpoaTlUUnNGQUJEY2YxYmNrVEw5?=
 =?utf-8?B?SlZ0Q2FucTNjNlZzSE9CVjE2emhQVCtMUEM2TzZHVmp5Y2J4QitBUUZkdklr?=
 =?utf-8?B?Z3VQaWdVRzBCM3JHWmNZWjVhM2c0cFhMNGVvdFU5YVZXYm9nRlRiNUtmd0JC?=
 =?utf-8?B?RkVpbDl2Wi93ZHBIN3UvbS82Uldpb3ZHTGZFckZEQ2RScUYrRVMwMEZSellO?=
 =?utf-8?B?YmtrZ3hSU2lLcG9JSmRUVkYrTVRKckZNNkVxVzEvUmNCV3c4MG1qZFo4dEo2?=
 =?utf-8?B?d0xsZkV2S3FpWmxOditrTlJVWmpmOUF4QVoxam1BOGJ0c0gvNm50WmhTZjZi?=
 =?utf-8?B?ekdmN0J6d0p1RGVIVU1wQnplMm01VzR4dlQwbGxTTmN2c2pzUG0ya2QwTFk0?=
 =?utf-8?B?Z0w2Yy9lKzNQdmFyTzBiWkJEK21IUWtPTDIwSC9WelVoWjNuaXFqemdpSjFY?=
 =?utf-8?B?Vm1NbUszdDAyL1RiVVkzS2xJeTkzckJWRDBReU4xdU9nUDg3R0ozcjFSOTc3?=
 =?utf-8?B?R2treFZBOS8zclNYcDllTHM5cXhjckIxYmZ4bERuN2lJVHNVRHo5NmI3N0tG?=
 =?utf-8?B?Z1Q5RjUyS0hzNUhXbzlaeWxpbldUWkh3UGVJdWxXZEVVdUVYM3k3Q2k2Zmgw?=
 =?utf-8?B?c0MyTUVGb2dUUlQxcUdoZE9rSmFHZE9QRWxHMnA2TUpzSC94VU1Jc0c5NVJ2?=
 =?utf-8?B?REdhd3dZem9IYUltRlZqbHRMYmhBdDk4TEVsU2xhOFFXVWR4VXYwZEtJZ0N3?=
 =?utf-8?B?UEhwQ3g2ZDZmbW9GYTBONFplbkZtUmFveE5jR3lnTGVrTXhmUS82S2ZGa2xx?=
 =?utf-8?B?OVo0N05WdVMwbVgrRklUSGgyT21BVWFxd3M3WVNWS3l2YmM5MFFPd3pxbUhy?=
 =?utf-8?B?cFRTYTEzMkVGZk9rSWFPUVBScDN0cXU2L2RPNnpIcE90M1hkdVJBK0dDS0Zw?=
 =?utf-8?B?VUhjVm04eGZkUWVHdlFYbDY0Yk1PcXhoVTdPSWdjUS84eTNjSTgyKy9TMnBH?=
 =?utf-8?B?QVhiNnVlU1UzRVRhYzk0YzdVeldRQ2R1Nnd4dVU0QXhMd2owZVUyTExLODgr?=
 =?utf-8?B?eHIweGpUYXNteGVwSFkrUlUrMVZrYSthTEdVSDR6Q2t3dWpzQnFVYVNKVTdH?=
 =?utf-8?B?eGlVYkxPR0lhaS9od0RXQXI5WGplK2JUWEV0MGdqcDhtcUdsT1h3WHpSU3ZK?=
 =?utf-8?B?bWl6MHFvYUNIcUNzM01Uek1hWDdFb1V4WkxCaHFkSzRnTTJ4SHFmNWhpaTAw?=
 =?utf-8?B?V2gyQzAvdkttNlEvbXhZNTd2YWE1OENudlhDSmlTWS8rNDNCSVpIT3dweFNM?=
 =?utf-8?B?ZjdZa3UzSVlVYUNXeWNrK0EwNVhEZ0NEdW15UzlGTTh4NUJ1bEZkTHArNmRm?=
 =?utf-8?B?dUk3Yzgwckx5YzZHVVYyU1lxdU1aa3pzemlxMC81eFRiSlU2TUt6Sm96dklP?=
 =?utf-8?B?USt1YUI1cG1UVzYrbFAwa3BEbjhsS1FJN2lUZFNWOVNKQnQ3UmYxTGVQUGcy?=
 =?utf-8?B?VUdhbTR1QjhNWjR0eTdObFNBUDlhalJJWTZBZXFuSGwxMDhYZWJOS3M5MXRL?=
 =?utf-8?B?NXdBMmdrYTBreTVHb2FRVVZOVlVvYUhISVErZ05vWjFqREpIMGg3UW02c0tk?=
 =?utf-8?B?WmlwdlhwMzBadzJ2WERiT3hGYkRwYnh5eXRKbkh3TkdjM3htQ1AvTGU0MUxX?=
 =?utf-8?B?MG5sQnIyZzU1QkR3OTFlSEVja0Q2dWExdTRaN1QwZm1IY1prTittRm56RnZs?=
 =?utf-8?B?L05EUUh2QjFOeWRzMXBFM2pNMytrYlkyZmcrL1hTemJ5SXNRUk1MSTRRazU4?=
 =?utf-8?Q?Ct7aTz0bnC6QfkXLU8+aAghceRBwkc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vm9XQU45dHRMNlNUa3IwblVDSXExNFBMcUFxc2R2Zktib245cW14RGVWNVVa?=
 =?utf-8?B?M3pHckdpZkVwYVgwZklkQnM5WStlUTZwR0ltejNqdlk2cWVFdzBKanZBRTZ3?=
 =?utf-8?B?d0tXajhjNkVDMjUwSXlkME9lRDV0VzBDSXFXcXBTRlBXWWtrNmYvajlITXJj?=
 =?utf-8?B?R3dGeVc0clJqczF0RU4zMmJMTHBhMWEwV2VDaGY5bTdoekdnYXNZNEpNQkht?=
 =?utf-8?B?cWlhZ2grMmtpN1N6U1VtUlFmUERHMmtHMmJaQTg4QVdRTnJNMW5MNDlNWmQz?=
 =?utf-8?B?UlJGd1JEOWhLdlpJc0l4L3M1TTZCYlRRWlhUSEtyQWJWQi8vRWVCMEVOQ25B?=
 =?utf-8?B?cXRlUytaR0lsZWNGVkwzZnp2K25VbWpla2pBQkZsSndEQWdCNG5XSnNIM1JR?=
 =?utf-8?B?Rm9qSVc3Z3dhbytnN0kvMUZQdEJLYlh6dzFJaWY0ZUpQaFZPSnlqalJsS2dZ?=
 =?utf-8?B?YmlKRmFnMXlkeS9FcFdzQWYzZldPYnlTdWNkM1d1VnF6RWdtL2t1THBNUloz?=
 =?utf-8?B?SU16WDdPYjFNcTBqSXJJa0pTL3NYa2xtWSt0bGU2Mno5cHlJQ1gvYWVYVXpz?=
 =?utf-8?B?R2ZUU0FBS3kvcmV6VGcvRXQremtJZGJoZktTQWF5Q0RKWmRiR0wyZGRvODAv?=
 =?utf-8?B?TXpUdlJnR1lDa0ZZVzFJdy9SYmtOMmxJVWR6RVZ2NVRGOGxqVWtnQjRqalU5?=
 =?utf-8?B?c3V5aVYrV1Y0UURyTXVHUDhxVW5qRzkvTmV2NW41UHNXcFdKRm45T09pQVlK?=
 =?utf-8?B?Y0JwSkN6U3pYM0NtRk42RnBhZDNKMGh6Mi9RS2FBcTJ4bWlwUHVPRG85V2xI?=
 =?utf-8?B?UFRQMFlBUlRjaHMzUGltSHVMSnlNNVJHL1d1SDhqR2tXM1Fndm4xUGxmeGhC?=
 =?utf-8?B?UzBZeEZTNm5hU3p5dUp0eW92MUV3SEJqaEFDYlVvaE9vRWRWYmRiZXpodjlC?=
 =?utf-8?B?UEhMT2p1VUwxVHN4ekRGbXBZRzhOZVB5Y1ZiUlh4R1Y5S1diWHMzTWdBTlZ0?=
 =?utf-8?B?K1RCVWw3VS9UWlIxWTVJS2lXeVp6aDdKRHF1ZGx2bTlYREtqOVEwSDBybDNZ?=
 =?utf-8?B?S1l0RlpBb3BLeUNLRnNVU0xnR28wcUlmN05JTzduUS80VFdnSW1zRi9aOTdl?=
 =?utf-8?B?Z3hnYzMxMEp0Z1JJU3dsUksxU3Z6VjB3d3R0RlpLNGNaSmdYeXY5T0hadnV5?=
 =?utf-8?B?MjloMnZROUgvcVlRR0U5L0ZPa3pIcWpZNGdDaXBVWDBNbDluQXBVaWc5UlA5?=
 =?utf-8?B?bENIZEhZdVJJY2ZmS2tTdENJUnpxQUpSR2ZLR2lVMmFPQ3JzbGlGeWl2MUd6?=
 =?utf-8?B?SlZRTlg5K1J0VjZVMGxYdnJ0cUJxRWVybDhXQ2dzQmFRRzBsZmN3T1dVMlRi?=
 =?utf-8?B?UTFhYnRDandFOW1pSlUyby9FQUR5dDNVbm1PUjJxQXVvQWZjcnYwc0hlTDI5?=
 =?utf-8?B?d01jdDd3bG5aOXhvNUlCVmNBZkR4Y0FoY2JDRUsyOTl2akRaZnowSlM2Qllw?=
 =?utf-8?B?M0hPSDFySHB4ZDIxUjU2dHJEbWxFalUxaHpJSHlBeW53V0JZejJyTWIycjJC?=
 =?utf-8?B?MHlnOTBPVDdUT25abFNJbDh1R2JiaVp5ckhkYVdubGRhZ3AvSUh6cTlyS3FZ?=
 =?utf-8?B?dXpjemY3RWVZTTZaODBwTEx4SmhFMGN3NUNmRU9VMmE1a0puRDcvRzZLRnU0?=
 =?utf-8?B?NS94OUkzWUhQUWxOeHBudUlYTk5WazNkNVRyRUJSRFFGTjl5V1hYSngxREEv?=
 =?utf-8?B?UVFHQm5tbUd6aTlVRmdSTEJqU0FYVnFHVnQ3bmQ4ekVhakYyZ0FYNC9yeTFv?=
 =?utf-8?B?c3RJcitkamVPTWlqUnByUXFMcVVoUmpRejNOY0hUQVRqOFFMRGN0UmVQMWJu?=
 =?utf-8?B?TTFUQThGMzlGOXNnWEM0VnN4YWx5NWphVW1YYVZPdGhIZFZwbkhUbDRET3VY?=
 =?utf-8?B?MjJTTGlCM25sOU5uWUcwMjNDTnM0RHpjSEFVaG5aYjJ2RTFzSVBsRlFWU0RW?=
 =?utf-8?B?ZnZLRXVWZzlwVEVaMldFTmtadlg5S1RGOVp6MDdnUi9HQXNCMnlnWDNmd3Ja?=
 =?utf-8?B?dDU2WThvblRkRnI1eGpvay85Qk93aUxiMGVrT0JjQUl0VS9yczBjNDRWdXNY?=
 =?utf-8?Q?ehkI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d945a6-35d5-4ed1-4555-08dd81ba62d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2025 16:26:07.8577 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xW+oN2mylq/oCPp5y9pMT3BzNbG87Fup19c3vrOCqDbWrVOarQIKWct76cn5kTJkinBlO2wKek7TsrFAnvTnCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6829
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IERl
dWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgMjIs
IDIwMjUgOTo0NiBBTQ0KPiBUbzogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdA
YW1kLmNvbT4NCj4gQ2M6IERlbmlzIEFyZWZldiA8YXJlZmV2QHN3ZW1lbC5ydT47IERldWNoZXIs
IEFsZXhhbmRlcg0KPiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IERhdmlkIEFpcmxpZSA8
YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyDQo+IDxzaW1vbmFAZmZ3bGwuY2g+OyBB
bmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT47DQo+IENodW5taW5n
IFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IGx2Yy0NCj4gcHJvamVjdEBsaW51eHRlc3Rpbmcub3JnOyBzdGFibGVAdmdl
ci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIGRybS9hbWRncHU6IGNoZWNr
IGEgdXNlci1wcm92aWRlZCBudW1iZXIgb2YgQk9zIGluIGxpc3QNCj4NCj4gQXBwbGllZC4gIFRo
YW5rcyENCg0KVGhpcyBjaGFuZ2UgYmVha3MgdGhlIGZvbGxvd2luZyBJR1QgdGVzdHM6DQoNCmln
dEBhbWRncHUvYW1kX3ZjbkB2Y24tZGVjb2Rlci1jcmVhdGUtZGVjb2RlLWRlc3Ryb3lAdmNuLWRl
Y29kZXItY3JlYXRlDQppZ3RAYW1kZ3B1L2FtZF92Y25AdmNuLWRlY29kZXItY3JlYXRlLWRlY29k
ZS1kZXN0cm95QHZjbi1kZWNvZGVyLWRlY29kZQ0KaWd0QGFtZGdwdS9hbWRfdmNuQHZjbi1kZWNv
ZGVyLWNyZWF0ZS1kZWNvZGUtZGVzdHJveUB2Y24tZGVjb2Rlci1kZXN0cm95DQppZ3RAYW1kZ3B1
L2FtZF9qcGVnX2RlY0BhbWRncHVfY3NfanBlZ19kZWNvZGUNCmlndEBhbWRncHUvYW1kX2NzX25v
cEBjcy1ub3BzLXdpdGgtbm9wLWNvbXB1dGUwQGNzLW5vcC13aXRoLW5vcC1jb21wdXRlMA0KaWd0
QGFtZGdwdS9hbWRfY3Nfbm9wQGNzLW5vcHMtd2l0aC1zeW5jLWNvbXB1dGUwQGNzLW5vcC13aXRo
LXN5bmMtY29tcHV0ZTANCmlndEBhbWRncHUvYW1kX2NzX25vcEBjcy1ub3BzLXdpdGgtZm9yay1j
b21wdXRlMEBjcy1ub3Atd2l0aC1mb3JrLWNvbXB1dGUwDQppZ3RAYW1kZ3B1L2FtZF9jc19ub3BA
Y3Mtbm9wcy13aXRoLXN5bmMtZm9yay1jb21wdXRlMEBjcy1ub3Atd2l0aC1zeW5jLWZvcmstY29t
cHV0ZTANCmlndEBhbWRncHUvYW1kX2Jhc2ljQHVzZXJwdHItd2l0aC1pcC1kbWFAdXNlcnB0cg0K
aWd0QGFtZGdwdS9hbWRfYmFzaWNAY3MtY29tcHV0ZS13aXRoLWlwLWNvbXB1dGVAY3MtY29tcHV0
ZQ0KaWd0QGFtZGdwdS9hbWRfYmFzaWNAY3Mtc2RtYS13aXRoLWlwLWRtYUBjcy1zZG1hDQppZ3RA
YW1kZ3B1L2FtZF9iYXNpY0BldmljdGlvbi10ZXN0LXdpdGgtaXAtZG1hQGV2aWN0aW9uX3Rlc3QN
CmlndEBhbWRncHUvYW1kX2NwX2RtYV9taXNjQGd0dF90b192cmFtLWFtZGdwdV9od19pcF9jb21w
dXRlMA0KaWd0QGFtZGdwdS9hbWRfY3BfZG1hX21pc2NAdnJhbV90b19ndHQtYW1kZ3B1X2h3X2lw
X2NvbXB1dGUwDQppZ3RAYW1kZ3B1L2FtZF9jcF9kbWFfbWlzY0B2cmFtX3RvX3ZyYW0tYW1kZ3B1
X2h3X2lwX2NvbXB1dGUwDQoNCkFsZXgNCg0KPg0KPiBPbiBUdWUsIEFwciAyMiwgMjAyNSBhdCA1
OjEz4oCvQU0gS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4NCj4g
d3JvdGU6DQo+ID4NCj4gPiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFsIERp
c3RyaWJ1dGlvbiBPbmx5XQ0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gPg0KPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18NCj4gPiBWb246IERlbmlzIEFyZWZldiA8YXJlZmV2QHN3ZW1l
bC5ydT4NCj4gPiBHZXNlbmRldDogRnJlaXRhZywgMTguIEFwcmlsIDIwMjUgMTA6MzENCj4gPiBB
bjogRGV1Y2hlciwgQWxleGFuZGVyDQo+ID4gQ2M6IEtvZW5pZywgQ2hyaXN0aWFuOyBEYXZpZCBB
aXJsaWU7IFNpbW9uYSBWZXR0ZXI7IEFuZHJleSBHcm9kem92c2t5Ow0KPiA+IENodW5taW5nIFpo
b3U7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gbHZjLXBy
b2plY3RAbGludXh0ZXN0aW5nLm9yZzsgc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiA+IEJldHJl
ZmY6IFtQQVRDSCB2Ml0gZHJtL2FtZGdwdTogY2hlY2sgYSB1c2VyLXByb3ZpZGVkIG51bWJlciBv
ZiBCT3MgaW4NCj4gPiBsaXN0DQo+ID4NCj4gPiBUaGUgdXNlciBjYW4gc2V0IGFueSB2YWx1ZSB0
byB0aGUgdmFyaWFibGUg4oCYYm9fbnVtYmVy4oCZLCB2aWEgdGhlIGlvY3RsDQo+ID4gY29tbWFu
ZCBEUk1fSU9DVExfQU1ER1BVX0JPX0xJU1QuIFRoaXMgd2lsbCBhZmZlY3QgdGhlIGFyaXRobWV0
aWMNCj4gPiBleHByZXNzaW9uIOKAmGluLT5ib19udW1iZXIgKiBpbi0+Ym9faW5mb19zaXpl4oCZ
LCB3aGljaCBpcyBwcm9uZSB0bw0KPiA+IG92ZXJmbG93LiBBZGQgYSB2YWxpZCB2YWx1ZSBjaGVj
ay4NCj4gPg0KPiA+IEZvdW5kIGJ5IExpbnV4IFZlcmlmaWNhdGlvbiBDZW50ZXIgKGxpbnV4dGVz
dGluZy5vcmcpIHdpdGggU1ZBQ0UuDQo+ID4NCj4gPiBGaXhlczogOTY0ZDBmYmY2MzAxICgiZHJt
L2FtZGdwdTogQWxsb3cgdG8gY3JlYXRlIEJPIGxpc3RzIGluIENTIGlvY3RsDQo+ID4gdjMiKQ0K
PiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+ID4gU2lnbmVkLW9mZi1ieTogRGVuaXMg
QXJlZmV2IDxhcmVmZXZAc3dlbWVsLnJ1Pg0KPiA+IC0tLQ0KPiA+IFYxIC0+IFYyOg0KPiA+IFNl
dCBhIHJlYXNvbmFibGUgbGltaXQgJ1VTSFJUX01BWCcgZm9yICdib19udW1iZXInIGl0IGFzIENo
cmlzdGlhbg0KPiA+IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiBzdWdnZXN0ZWQN
Cj4gPg0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jIHwg
MyArKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMNCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMNCj4gPiBpbmRl
eCA3MDJmNjYxMGQwMjQuLjg1ZjdlZTFlMDg1ZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYm9fbGlzdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYw0KPiA+IEBAIC0xODksNiArMTg5LDkgQEAg
aW50IGFtZGdwdV9ib19jcmVhdGVfbGlzdF9lbnRyeV9hcnJheShzdHJ1Y3QNCj4gZHJtX2FtZGdw
dV9ib19saXN0X2luICppbiwNCj4gPiAgICAgICAgIHN0cnVjdCBkcm1fYW1kZ3B1X2JvX2xpc3Rf
ZW50cnkgKmluZm87DQo+ID4gICAgICAgICBpbnQgcjsNCj4gPg0KPiA+ICsgICAgICAgaWYgKCFp
bi0+Ym9fbnVtYmVyIHx8IGluLT5ib19udW1iZXIgPiBVU0hSVF9NQVgpDQo+ID4gKyAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICsNCj4gPiAgICAgICAgIGluZm8gPSBrdm1hbGxv
Y19hcnJheShpbi0+Ym9fbnVtYmVyLCBpbmZvX3NpemUsIEdGUF9LRVJORUwpOw0KPiA+ICAgICAg
ICAgaWYgKCFpbmZvKQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPiAt
LQ0KPiA+IDIuNDMuMA0KPiA+DQo=
