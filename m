Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QO5JNxemhWljEgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:28:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF57FB7B0
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 09:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D4B10E59F;
	Fri,  6 Feb 2026 08:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NqzHjkcS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C89510E59C;
 Fri,  6 Feb 2026 08:28:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/1hF1AcsEt3t36tIkHK96fbqR/3+0HSQC0fp7RcTqoA7beibVRhdTuMLwPz9w1d1sdCA1KfaJYXqf1x78cfvS4MTlcjNhB8r59KWVVy6RrHTKdw8d1zQKVjcoa3AlVhXJfQUQxjfqzPXdrpYfpAQJ0djx5NXr6CQC7Gf+y7N9VlwcWzgaXzXHaOZy6p6DpEB11eNU0+J445i/4V1enzGO0i83CKYo2/YpMN4X3ji+C7a4U+PqGXGbhdgpQaa6ntUgyg+UhUNUw87KkdGbvV9HwH4dlOsuMHj0dxJVLe00MDcAZHVEnhATFEDawN5KKuClnoID+HeyG4cotjgHkw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XI38RynwHaI51pL9z/P0jmXkhOkEMyRGGApWHafrhlg=;
 b=NT2HOII3nmOl5bLrmItmSt6YVPqdgibs+oUfxXLbmQDMmw1keya3W69alMr6isQ7AWaochcM8D7bFIm8nQS1sq9gQwAyzuHftrQqtVtZJ7yg0bWrN8yvjUUXiDAYSBpsK3uZwEAs269QfSNdV8rcSvkPiBRteVoImf33H4RnZN2lEXZ7ji31A9wN9MyAHChOMKN+HGRR/1f+5oHRgybnfiJ4PkBxN0GjiAWoi6rRCjqz1Ob94CAXmg1GBxOD1joQPd5U3RO6HCM4hOud1kGmzxtOfNR5LkkJTgB5aHKkQnqgngR7QNMYgIuch9GtmMcVv2LRkK/dIIEtKmo/lqYXFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI38RynwHaI51pL9z/P0jmXkhOkEMyRGGApWHafrhlg=;
 b=NqzHjkcSXdDFJ0E/PHkRRtF1uWsUyqgvz97Hpe8z4m1nEupZw4e3RV/YxK+h5+pdfcSrCtLNHgvDnBzoVipC/3SOAkAz+4zo4yafHw5Y12ZuPckq4UUWDsqdTBIza46wxBanYspfsx5+aythcgKqdXxu0uW/IOW3W/dHVXiCEgM=
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by CH1PR12MB9693.namprd12.prod.outlook.com (2603:10b6:610:2b0::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 08:27:59 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::8434:dc50:a68d:7bdd%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 08:27:59 +0000
From: "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: RE: [PATCH 1/2] drm/buddy: Move internal helpers to drm_buddy.c
Thread-Topic: [PATCH 1/2] drm/buddy: Move internal helpers to drm_buddy.c
Thread-Index: AQHclcOeCZxOEjacxUmvfHGEw2yb/LV1WWdA
Date: Fri, 6 Feb 2026 08:27:58 +0000
Message-ID: <PH8PR12MB7301AD70CFCC81487D6C9045E466A@PH8PR12MB7301.namprd12.prod.outlook.com>
References: <20260204104345.1980047-4-sanjay.kumar.yadav@intel.com>
 <20260204104345.1980047-5-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20260204104345.1980047-5-sanjay.kumar.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-02-06T08:27:44.0000000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB7301:EE_|CH1PR12MB9693:EE_
x-ms-office365-filtering-correlation-id: 0c8ceac5-4bfd-493e-a502-08de6559a2b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SEtLa29IWTlPWi9iMk9YSm1XSWdRVkMyZTVUS2dBUjNTWVBqYk5zM2VzN094?=
 =?utf-8?B?eTNkbGxVVGpqdmVyMXFMaEhnSE4rTG9Yek1pLzZEL1BqSmdBOTk0Q3dDdW5K?=
 =?utf-8?B?T3B0cXJSSVJ5WFY4Wk5NMXFBWTZmYWxhakt0djA1QnlkNnZCTDRCdEV4SlpY?=
 =?utf-8?B?MHBvWE1ENjJmK2lsZytaYUdjazVoL0Z3UHBmNDZOUGI3akhyS1kzc3pYWERT?=
 =?utf-8?B?aXpUU1YwdGxKbGU5TUdkZ0pKOTdBcEhueFVyWVdmWkJqNGt2TzRVQnM1OUt2?=
 =?utf-8?B?bFFPRjFzdEcxbHI5VW1FTU12RVVmVDZHL1F4RUVMUUpialpwcnBQSGU0eWtm?=
 =?utf-8?B?Rjh0NUV6d0NQenZWSk8wU2E1b3FkaVE3L1VZc25kcis4c0dxd3JZQmVOc3Nk?=
 =?utf-8?B?TGF1bzlsZWFFUm16NllCRUZiZTBMTHdmZ3ZjYUROMHlPK1FiNEZuUm5jZ0Ey?=
 =?utf-8?B?TUQ0ZmF6eVNkQzFjUG4vTy9nbFBPWWFmVW5lc2dMMWRNaGdtSFJ6OVlUalA2?=
 =?utf-8?B?WVVFcFFOdlF5TUZJT0FXZ25RZFVuOTZzeFhSbzBYTFkxSksyMHNKUzJoRDAy?=
 =?utf-8?B?T0xyVWllbUIwTEdjMFBPL1dJK0pqTERRdU1OOUFMOG9UVTlLTC9BYmhJL1FN?=
 =?utf-8?B?WTBDakJ4dEhZcUFtM3FRemNTNFNHVDN6dkhQVzdxUTFhbzhwWUdLUjFGeGp3?=
 =?utf-8?B?dWgwMXIyQWxGWHIzQ3ZQeGE1NThuUFZKTWFBTTloK1NlSXBVZDdSd0p4cXQw?=
 =?utf-8?B?dFNYS3BGNUVqTnpqMndOaHN6UDdmbUNFMW1oSXJlYU1NdC9pVjFwWnJxSjhx?=
 =?utf-8?B?bnpBdTIzMmVvb1ZMWUVVS0RKYlU1MWkxbkhjbUtIRDExZ0YrbDY0VkRyZ0kv?=
 =?utf-8?B?WHVaVHBzYmp6ZGJ4cTF0T3N5Y2E5dzJMTWZYUnYvTThBNWZFbVdqT2x1b21J?=
 =?utf-8?B?OHJtSHVDVkdxYXExWmlMSVpRSjlQZ2N5SytSWk11RTRwMnQzaG5TRWh6VzR0?=
 =?utf-8?B?S3d1QksyVFRNQldnbCtXL0FsU1YxMlc1UGZVMVhQVk1lZjVLZXpxUHlQVGdy?=
 =?utf-8?B?SHU2MWM2ZkM2MnBFMExYcVdJTHpSUUVaUjRaSlBNSG9xN2pQRkFxdzZRMWR4?=
 =?utf-8?B?akJ3N0FGZVNkdzBqTVlqT2k2aTlCdVM5bm5OYndJdU1QSC9FejAyTFA0TTFE?=
 =?utf-8?B?ejlURkNzRFN2S2w3U0JpWTgyRGFBb0NScjcxdlFPS1JkS3JuajdzUlUycm1G?=
 =?utf-8?B?RG4xUmQzUHFEWEZDN1pvSWRnOWNVc2xTREZPdWd4M1ZaczdhUzhzU2V1aSto?=
 =?utf-8?B?TSs1UjNnUUtlaE9EYXo3RkNaZEFQRmZITGNIU3ZDQVEveUdmSTFzeFRyWmo3?=
 =?utf-8?B?WHpXSUN4SXEwdkljVFdLTzdURTRWV3FMVUpub3Rzai9FK1VDMW96NVF5czZD?=
 =?utf-8?B?Q2ZpQlFXU016dllmMFVHaUoycnJVRjFvRU9KR0tBTGhicldXZXo3WVY1TGdQ?=
 =?utf-8?B?ZHBOWWtXMkVhL2Z3Q1dPR3M0bzM4TjgwUUg5eVhNWGdFK3o2MlBYVURzUm1i?=
 =?utf-8?B?R3hSbE1RekptTnRmZ0tGY3ZGbGNrdHlkRlU3TE01SFZESExVQ1FUbTlxbVo4?=
 =?utf-8?B?dU9GcXQyeGZiNmpMdnJqQTlwTENtRkJxVGVVNVRTdnh0ZVJXcUdyclI0aGlr?=
 =?utf-8?B?QkU2QWVlOTVHZ3RCbU8rVU53ajNsWndac3dRcWNzRlBmWWZQK3NnQyt3dERk?=
 =?utf-8?B?Ukg4VS81Vk1EU01kM0NzNUd4cGV5SEtydWhwOThOb25pUlg0WGJ4aTkxQ21i?=
 =?utf-8?B?RUc3NW1BVFhmUUpucG5nOW1NaTY2UzVnbXE0TTBBZzFNbkIrV09vclF6WVI0?=
 =?utf-8?B?Y1M3cGVnT1I3NVQwdmxocGVvT2hjbnVDT2VHUUJCVllWWHpob2wvYUhuMDY5?=
 =?utf-8?B?WU9pYmpocjN2VE1IWnY0VFdnZjhObFZJUjBwcGluVkppekhZcDNBcFduUjFF?=
 =?utf-8?B?UExYdmtGS2lDNTd3RHBiSFYrUU1EOGR5SkJJOGkyTEpnZFBqWUw1QVdNQm83?=
 =?utf-8?B?NUs4VlcxM1R3d01tUGYyNk9DTk9rbytBbmZoS3F2WXJIalE4T01IQTBTVTlp?=
 =?utf-8?B?ZUhJa3RkSmM2dUdLT1Njcm82RldSVDExZzNiRFg4L3FRMzRCYXdZc09lOFRX?=
 =?utf-8?Q?elH2uniDC1CzSrlfWKUZGXc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXlXOXFHV3pudmpMcEdiakZsNlFwaHVrWDhOZS9PZUVzcTlWMUdJZzVwYzgy?=
 =?utf-8?B?ZHNoUmQrM21vOVBuMjlyOWM5cTloT3FURklNRjFObEhDaHlHemxwclF1S1Qv?=
 =?utf-8?B?aE9xZ0VMaWsyb1FERDFRTWlMbDJvZHBrdzd2Z1JKeFlqdTI4TmFYK29RQUx6?=
 =?utf-8?B?a2lZN1F3YloyNm13UGM5bXZSUmtUWHJMYXlTbVI0Uk0wL0E5UXNqM2cvVkVW?=
 =?utf-8?B?L1NWdDMzMXNSalRwcUhod2tmQzBDMGVmZWN6d0V0eHQ2QmJxMmJVWlMwVFJW?=
 =?utf-8?B?Z002TXVBWTJucWY5YWVYemt4eStyRG4yVDNyKzVJMGtPTmx6VndJRXN5S2ZJ?=
 =?utf-8?B?d242TG13eklNbzE0RGxaSmduR29Ta01XRkswbktwZ1ZrOW14YWwrZEwxRVpH?=
 =?utf-8?B?YTRaVnZqY1VWYzl3aW9la05kZE11eXNoU0lBZktlWWRIdThERC9WZXdqUFcz?=
 =?utf-8?B?RURTVW1wVXFRWWhQdExVYi9NVExxRXU2eW1iMzRBNnVmeldTaEs3SEZBcXRG?=
 =?utf-8?B?aWl1YllIR2lEUTNwWkozNGJtaVlpRUpjbVc3S3RLV3UxMCs5ejZxejRVaisw?=
 =?utf-8?B?cmptWVVzSlZIMzNjRlVjUFRaRmdwNnlPL0oyTUVCdGlnbXFPWHVBMTRla0Fj?=
 =?utf-8?B?cm5haHZlYzhNT1pPQjErZzVFY1BLdzdWNzFLSkt4MXdYOHBlNjNVMm9CSnNG?=
 =?utf-8?B?SDkrbkRZLzR6TVpsZWRBNUFVeDd4bGd5RTVpcmpVelQ3K21mYml0YnczZjcz?=
 =?utf-8?B?bFozYVFrTENPRVZCZjdPMXV3SlVQQVVWRHFLTzNWc2pTdXEraHl1YWRhMDQy?=
 =?utf-8?B?Q0MyVE8vaEovVWhWSHhGRW5LOWh6YmNSWTFKbTQ5K2Y2UEp0Nk52SU5BcDMx?=
 =?utf-8?B?M3ZBZlFZOW0zbUp5d0tvZWhuVEVNbkhxUmRVMmpVR3U4Q0pEV3AzNFhIK296?=
 =?utf-8?B?bkRVc3AzMTFxc0N3VEdLNWd1bUgybmgwdFhiNWRpTk8yRUpTUTdZek1FZXZG?=
 =?utf-8?B?WmFTWUgyQVdlczlESzk2Yk9aWWo4eWxBbVpCWlF6RXhFc3ltRHRxRFdQYmdu?=
 =?utf-8?B?R0NYUWc1K2U1bW9CNTcyZml3RWlNRXVNd2twZFV3QXpvMHozZ1l2WjcwREhw?=
 =?utf-8?B?ejBRMVZEcWtCSlRNMlFzLzVITlpzMjB5V3Z5MzlFcHBDYnkvUU9UdStmb29s?=
 =?utf-8?B?ZmdEcFJDSG55bW5qUG9QQzRVZ2p3d0t6RjYvL1A4RHFwKzh0VHZJY2lwdXRp?=
 =?utf-8?B?U05sRTc3dmVjYUdsd3JFamN5dkhBeENhT1NJLzBvMVVRVDUweGQvOVFtQXBk?=
 =?utf-8?B?YndWYzlTVldjVEJhbXFBOFJSMCtQcDd1dkxYMHZJUDF1N1FMR0RLWTFhOWRl?=
 =?utf-8?B?NWxDdHlSVExsSU9uTzJlSEhBUW50NHJ5VGczRzF3Z0tRU0pOT1dwRFdyZ3c1?=
 =?utf-8?B?WVRRS29NQkJmOS9RQ2dUVVE3amFHY1N6aUptTEhGY1B6cDJMSGxwUDRnTHpB?=
 =?utf-8?B?SnFwM2VydDZnTlRwc1pCRE14Wm9mSUY3RGhRMldFQ0pOZ0NpdEgxSFR4bFJS?=
 =?utf-8?B?RzJJOGVNOTV4Uk1jRm1pZklqTTFpWEtCM25RN0x1Vjk3cUdsUEpGL2RLdUZC?=
 =?utf-8?B?dDRwWGxMQmgxNys5SjBjaXJHK0N1NVhYTDhBQW41NU1MbnJMN3EyYU5BUFlW?=
 =?utf-8?B?OVg3bEptNVhHK0tBc1U0akJ3VFNnSnhXSExHbXA3OHY3OWZoQWRyNmVPQ2Iv?=
 =?utf-8?B?ZFUxSzBLaXY0MmVZd0dOUDg5WnBuSzROWkxJODZ3TDJqREpwZGtCUkVyNXdw?=
 =?utf-8?B?UlRYNFBVL08vOVQvUXNYV0FjakhpNmlMaGF5dXA4K1h1eTV3bEgvZW5LeFhV?=
 =?utf-8?B?S3BzYnQ4SDQxVS9HWU11cWFwVk82ZG1FNzQ3K1dZRHMxejhOYVNSaW01SUZq?=
 =?utf-8?B?dUxMU05xTkpvV1VsRSt5dmg5cThXbnU4ZDlSVzRzQUU1MVp2cUlqTFhJNHJ3?=
 =?utf-8?B?MHltU2ZMSFJFMWZaZm5WTzJyczNSNVZhL2FzL3VCVnh3NEw1MjFjY1VXZHVa?=
 =?utf-8?B?Y2hBU0lydXlwYW9kcnFiSGlnbEJEUWFHSGk0aTZEdzA5Q3RyaWlxcVlCTHFT?=
 =?utf-8?B?VWlnK0c5WXk3M3RObkxyME0rOVp0S0NQWmF2TTdLbDAxeGhyTXdKSGpxSk9R?=
 =?utf-8?B?OG1HaWxsWEptbHJtc1FEbmZXc0t6Tjl3MlBMSHFvQzRGa0RsMFJjSmpLZWZq?=
 =?utf-8?B?OThHekxxYWZOZGNDL3UzcFZBL3pCWlZ1ZWVZSDJVRHI3MHNnaWZCWUY3M3Bv?=
 =?utf-8?Q?nEg/7hd5dcS49uUsea?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8ceac5-4bfd-493e-a502-08de6559a2b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 08:27:58.8570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l/MknfKO2NEixQgq94hzMhMIkQVy6sVwpWQk3onAlenQhHR4wQFlmb+tIXINXg3fu7jmLUoTUibJQfZT2EYyDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9693
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Arunpravin.PaneerSelvam@amd.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,amd.com:email,amd.com:dkim,lists.freedesktop.org:email,PH8PR12MB7301.namprd12.prod.outlook.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1FF57FB7B0
X-Rspamd-Action: no action

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KUmV2aWV3ZWQtYnk6IEFydW5wcmF2aW4gUGFuZWVyIFNlbHZhbSA8QXJ1bnByYXZpbi5QYW5l
ZXJTZWx2YW1AYW1kLmNvbT4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFNh
bmpheSBZYWRhdiA8c2FuamF5Lmt1bWFyLnlhZGF2QGludGVsLmNvbT4NClNlbnQ6IFdlZG5lc2Rh
eSwgRmVicnVhcnkgNCwgMjAyNiA0OjE0IFBNDQpUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgS29lbmlnLCBDaHJp
c3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IFBhbmVlciBTZWx2YW0sIEFydW5wcmF2
aW4gPEFydW5wcmF2aW4uUGFuZWVyU2VsdmFtQGFtZC5jb20+OyBNYXR0aGV3IEF1bGQgPG1hdHRo
ZXcuYXVsZEBpbnRlbC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggMS8yXSBkcm0vYnVkZHk6IE1vdmUg
aW50ZXJuYWwgaGVscGVycyB0byBkcm1fYnVkZHkuYw0KDQpNb3ZlIGRybV9idWRkeV9ibG9ja19z
dGF0ZSgpLCBkcm1fYnVkZHlfYmxvY2tfaXNfYWxsb2NhdGVkKCksIGRybV9idWRkeV9ibG9ja19p
c19mcmVlKCksIGFuZCBkcm1fYnVkZHlfYmxvY2tfaXNfc3BsaXQoKSBmcm9tIGRybV9idWRkeS5o
IHRvIGRybV9idWRkeS5jIGFzIHN0YXRpYyBmdW5jdGlvbnMgc2luY2UgdGhleSBoYXZlIG5vIGV4
dGVybmFsIGNhbGxlcnMuDQoNClJlbW92ZSBkcm1fZ2V0X2J1ZGR5KCkgYXMgaXQgd2FzIGFuIHVu
dXNlZCBleHBvcnRlZCB3cmFwcGVyIGFyb3VuZCB0aGUgaW50ZXJuYWwgX19nZXRfYnVkZHkoKS4N
Cg0KTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KDQpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPg0KQ2M6IEFydW5wcmF2aW4gUGFuZWVyIFNlbHZhbSA8QXJ1bnBy
YXZpbi5QYW5lZXJTZWx2YW1AYW1kLmNvbT4NClN1Z2dlc3RlZC1ieTogTWF0dGhldyBBdWxkIDxt
YXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KU2lnbmVkLW9mZi1ieTogU2FuamF5IFlhZGF2IDxzYW5q
YXkua3VtYXIueWFkYXZAaW50ZWwuY29tPg0KLS0tDQogZHJpdmVycy9ncHUvZHJtL2RybV9idWRk
eS5jIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQ0KIGluY2x1ZGUv
ZHJtL2RybV9idWRkeS5oICAgICB8IDI3IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIDIgZmls
ZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgNDQgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2J1ZGR5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2J1
ZGR5LmMgaW5kZXggZmQzNGQzNzU1ZjdjLi4wNWZlOWQxMmUyNzQgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2J1ZGR5LmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnVkZHku
Yw0KQEAgLTIxLDYgKzIxLDMwIEBAIGVudW0gZHJtX2J1ZGR5X2ZyZWVfdHJlZSB7DQoNCiBzdGF0
aWMgc3RydWN0IGttZW1fY2FjaGUgKnNsYWJfYmxvY2tzOw0KDQorc3RhdGljIHVuc2lnbmVkIGlu
dA0KK2RybV9idWRkeV9ibG9ja19zdGF0ZShzdHJ1Y3QgZHJtX2J1ZGR5X2Jsb2NrICpibG9jaykg
ew0KKyAgICAgICByZXR1cm4gYmxvY2stPmhlYWRlciAmIERSTV9CVUREWV9IRUFERVJfU1RBVEU7
IH0NCisNCitzdGF0aWMgYm9vbA0KK2RybV9idWRkeV9ibG9ja19pc19hbGxvY2F0ZWQoc3RydWN0
IGRybV9idWRkeV9ibG9jayAqYmxvY2spIHsNCisgICAgICAgcmV0dXJuIGRybV9idWRkeV9ibG9j
a19zdGF0ZShibG9jaykgPT0gRFJNX0JVRERZX0FMTE9DQVRFRDsgfQ0KKw0KK3N0YXRpYyBib29s
DQorZHJtX2J1ZGR5X2Jsb2NrX2lzX2ZyZWUoc3RydWN0IGRybV9idWRkeV9ibG9jayAqYmxvY2sp
IHsNCisgICAgICAgcmV0dXJuIGRybV9idWRkeV9ibG9ja19zdGF0ZShibG9jaykgPT0gRFJNX0JV
RERZX0ZSRUU7IH0NCisNCitzdGF0aWMgYm9vbA0KK2RybV9idWRkeV9ibG9ja19pc19zcGxpdChz
dHJ1Y3QgZHJtX2J1ZGR5X2Jsb2NrICpibG9jaykgew0KKyAgICAgICByZXR1cm4gZHJtX2J1ZGR5
X2Jsb2NrX3N0YXRlKGJsb2NrKSA9PSBEUk1fQlVERFlfU1BMSVQ7IH0NCisNCiAjZGVmaW5lIGZv
cl9lYWNoX2ZyZWVfdHJlZSh0cmVlKSBcDQogICAgICAgIGZvciAoKHRyZWUpID0gMDsgKHRyZWUp
IDwgRFJNX0JVRERZX01BWF9GUkVFX1RSRUVTOyAodHJlZSkrKykNCg0KQEAgLTQ1OSwyMyArNDgz
LDYgQEAgc3RhdGljIGludCBzcGxpdF9ibG9jayhzdHJ1Y3QgZHJtX2J1ZGR5ICptbSwNCiAgICAg
ICAgcmV0dXJuIDA7DQogfQ0KDQotLyoqDQotICogZHJtX2dldF9idWRkeSAtIGdldCBidWRkeSBh
ZGRyZXNzDQotICoNCi0gKiBAYmxvY2s6IERSTSBidWRkeSBibG9jaw0KLSAqDQotICogUmV0dXJu
cyB0aGUgY29ycmVzcG9uZGluZyBidWRkeSBibG9jayBmb3IgQGJsb2NrLCBvciBOVUxMDQotICog
aWYgdGhpcyBpcyBhIHJvb3QgYmxvY2sgYW5kIGNhbid0IGJlIG1lcmdlZCBmdXJ0aGVyLg0KLSAq
IFJlcXVpcmVzIHNvbWUga2luZCBvZiBsb2NraW5nIHRvIHByb3RlY3QgYWdhaW5zdA0KLSAqIGFu
eSBjb25jdXJyZW50IGFsbG9jYXRlIGFuZCBmcmVlIG9wZXJhdGlvbnMuDQotICovDQotc3RydWN0
IGRybV9idWRkeV9ibG9jayAqDQotZHJtX2dldF9idWRkeShzdHJ1Y3QgZHJtX2J1ZGR5X2Jsb2Nr
ICpibG9jaykgLXsNCi0gICAgICAgcmV0dXJuIF9fZ2V0X2J1ZGR5KGJsb2NrKTsNCi19DQotRVhQ
T1JUX1NZTUJPTChkcm1fZ2V0X2J1ZGR5KTsNCi0NCiAvKioNCiAgKiBkcm1fYnVkZHlfcmVzZXRf
Y2xlYXIgLSByZXNldCBibG9ja3MgY2xlYXIgc3RhdGUNCiAgKg0KZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9idWRkeS5oIGIvaW5jbHVkZS9kcm0vZHJtX2J1ZGR5LmggaW5kZXggYjkwOWZh
OGY4MTBhLi5lYjhiNGY1ZTE1YjMgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2RybS9kcm1fYnVkZHku
aA0KKysrIGIvaW5jbHVkZS9kcm0vZHJtX2J1ZGR5LmgNCkBAIC0xMDEsMzYgKzEwMSwxMiBAQCBk
cm1fYnVkZHlfYmxvY2tfb3JkZXIoc3RydWN0IGRybV9idWRkeV9ibG9jayAqYmxvY2spDQogICAg
ICAgIHJldHVybiBibG9jay0+aGVhZGVyICYgRFJNX0JVRERZX0hFQURFUl9PUkRFUjsgIH0NCg0K
LXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50DQotZHJtX2J1ZGR5X2Jsb2NrX3N0YXRlKHN0cnVj
dCBkcm1fYnVkZHlfYmxvY2sgKmJsb2NrKSAtew0KLSAgICAgICByZXR1cm4gYmxvY2stPmhlYWRl
ciAmIERSTV9CVUREWV9IRUFERVJfU1RBVEU7DQotfQ0KLQ0KLXN0YXRpYyBpbmxpbmUgYm9vbA0K
LWRybV9idWRkeV9ibG9ja19pc19hbGxvY2F0ZWQoc3RydWN0IGRybV9idWRkeV9ibG9jayAqYmxv
Y2spIC17DQotICAgICAgIHJldHVybiBkcm1fYnVkZHlfYmxvY2tfc3RhdGUoYmxvY2spID09IERS
TV9CVUREWV9BTExPQ0FURUQ7DQotfQ0KLQ0KIHN0YXRpYyBpbmxpbmUgYm9vbA0KIGRybV9idWRk
eV9ibG9ja19pc19jbGVhcihzdHJ1Y3QgZHJtX2J1ZGR5X2Jsb2NrICpibG9jaykgIHsNCiAgICAg
ICAgcmV0dXJuIGJsb2NrLT5oZWFkZXIgJiBEUk1fQlVERFlfSEVBREVSX0NMRUFSOyAgfQ0KDQot
c3RhdGljIGlubGluZSBib29sDQotZHJtX2J1ZGR5X2Jsb2NrX2lzX2ZyZWUoc3RydWN0IGRybV9i
dWRkeV9ibG9jayAqYmxvY2spIC17DQotICAgICAgIHJldHVybiBkcm1fYnVkZHlfYmxvY2tfc3Rh
dGUoYmxvY2spID09IERSTV9CVUREWV9GUkVFOw0KLX0NCi0NCi1zdGF0aWMgaW5saW5lIGJvb2wN
Ci1kcm1fYnVkZHlfYmxvY2tfaXNfc3BsaXQoc3RydWN0IGRybV9idWRkeV9ibG9jayAqYmxvY2sp
IC17DQotICAgICAgIHJldHVybiBkcm1fYnVkZHlfYmxvY2tfc3RhdGUoYmxvY2spID09IERSTV9C
VUREWV9TUExJVDsNCi19DQotDQogc3RhdGljIGlubGluZSB1NjQNCiBkcm1fYnVkZHlfYmxvY2tf
c2l6ZShzdHJ1Y3QgZHJtX2J1ZGR5ICptbSwNCiAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBk
cm1fYnVkZHlfYmxvY2sgKmJsb2NrKQ0KQEAgLTE0Miw5ICsxMTgsNiBAQCBpbnQgZHJtX2J1ZGR5
X2luaXQoc3RydWN0IGRybV9idWRkeSAqbW0sIHU2NCBzaXplLCB1NjQgY2h1bmtfc2l6ZSk7DQoN
CiB2b2lkIGRybV9idWRkeV9maW5pKHN0cnVjdCBkcm1fYnVkZHkgKm1tKTsNCg0KLXN0cnVjdCBk
cm1fYnVkZHlfYmxvY2sgKg0KLWRybV9nZXRfYnVkZHkoc3RydWN0IGRybV9idWRkeV9ibG9jayAq
YmxvY2spOw0KLQ0KIGludCBkcm1fYnVkZHlfYWxsb2NfYmxvY2tzKHN0cnVjdCBkcm1fYnVkZHkg
Km1tLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgdTY0IHN0YXJ0LCB1NjQgZW5kLCB1NjQg
c2l6ZSwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgIHU2NCBtaW5fcGFnZV9zaXplLA0KLS0N
CjIuNTIuMA0KDQo=
