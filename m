Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9DCA97DBE
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 06:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54B610E194;
	Wed, 23 Apr 2025 04:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nrWTXJXr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9A6B89A94
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 04:23:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EG7FVnHKySsBAob2c8m/lmkq5LNkPyT87b1FYVsuSH2bTt6m5NuwPOV6TAO2+S+lW1t7cmI3UJWpd7yfSenWnvzRj4KIJlHGmfFrpUKx1qckmIYxd/pwk45fmGbnFf4rqlOby8MOOq+Kn6/RwyQis+Xe0XSxXFNJzs2aqedAVWhktn4/IHYyvoP5oJjzo/T0+p7Wn7JALmgv33LG2t/w4NVgIT8jOPHGSDLuRbj7SgHxocVm/20e/h7q1WGIFnLDnDU2Fje5OMftu+Qa2HnphWQABDylsSp4OORoTyYn8pw/jm1EkLzq6gTg/rEv92YwmbLoKrlJrfzBfAC4O3TqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsK7+3v1sqGTzNsOiWHqClGKc86Lf3eP5sLkAPnJrtk=;
 b=HZmT9MfT3UuMeyiYgxVpWqduvWS0xb3NjHj1/XaqqGfXWS+kUBzVujfAiQccrBdbaXMKNmQ7Nkot8onN+XNQV1iQhzseyJpwkT/GURefpROUqkp1o2BJ6wvn5RRHq+ndCazmlrMda36qNIINrGY/oU+DNAUwFMirYslQHut9x5/n0al3NKZCDReaBthtHRCpWOElLLpaAMLG4N4LPgW/aJcw5UT8SWXn7VvB7lXTzF7zIHHFyVQVYPeyyy5gglkq6rT/8/jOnRRIA29eTzlzeNdgjjuumyP/0BrX7LtaKzGNP+YwNU++OzKHLin7nW0LIX+0THRCdkZLNPzVmjXiWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsK7+3v1sqGTzNsOiWHqClGKc86Lf3eP5sLkAPnJrtk=;
 b=nrWTXJXrcDQqgmsy9Aa2zcYrphZ30KnZnijyEXDo9nA78Gn7AuoOqaX+Xg9cCY28thGnoRE3034EGiR2Gd0vc3QKzn0nMLv2+f9gfmL+UjdQDJ0l8VDbDsipTsJ2+rML+ISvS2lNLh6LRf1BPjFS5BLRFcGD9KOFehLgulELEdg=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by CY8PR12MB7436.namprd12.prod.outlook.com (2603:10b6:930:50::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 04:23:06 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.030; Wed, 23 Apr 2025
 04:23:05 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: Maarten Lankhorst <dev@lankhorst.se>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: RE: [PATCH] drm/ttm: fix the warning for hit_low and evict_low
Thread-Topic: [PATCH] drm/ttm: fix the warning for hit_low and evict_low
Thread-Index: AQHbsq82BId8jCgic0CauEUtm+EU9rOt+lAAgAHuoYCAAL+hsA==
Date: Wed, 23 Apr 2025 04:23:05 +0000
Message-ID: <BL1PR12MB5753C0FD8EF14466E97FE85D93BA2@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250421111902.698287-1-sunil.khatri@amd.com>
 <91f82c7b-26d7-44b3-8c11-1341c020c022@amd.com>
 <68966ea6-3170-4ee5-ae9c-779845743ba3@lankhorst.se>
In-Reply-To: <68966ea6-3170-4ee5-ae9c-779845743ba3@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=1464307f-cf1d-4f3a-b3bb-9c7c74a03a19;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-23T04:19:56Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|CY8PR12MB7436:EE_
x-ms-office365-filtering-correlation-id: 87ba8398-f847-4e2c-bf3b-08dd821e8b99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?L1hwc2twSFo3bG9sc0syVU43d2dWZk0ydUhjb0dZV1p1NGNPWFRaeDhWL0Fz?=
 =?utf-8?B?cmlsaHB1ZU14QnkxOUNYbVV1S2svS0d2VDZMdzhLSXR4Ync5NFZGeUNpUjJD?=
 =?utf-8?B?Q01wMnR1c3NnamNiSWpMdFZYV3JNaVl5T2hXemlQcFoxUWRxbk9LUGxOcFp4?=
 =?utf-8?B?T2pwNzhpQ09DWG1GZm40ZkREdUtHZXRtMEZmTmdjRUhXYklMcUVHUGZsd0Nt?=
 =?utf-8?B?YS9semE4SmZtWlRjbWQrblIvWE1qR2F3SDdmTE81SlB1b054ejNwK3JIOEtn?=
 =?utf-8?B?bEVWSjI0dGRPM2pzR3FBcTdFU092SnhaQllYdHVFNGw2WjM3TFdHOWZrelA1?=
 =?utf-8?B?Sk9yZnIrOEZ2T3pZWS9CYUV2bGc1U2MyUlJMMkhqSTFJSkhTd0tOeEtkbFg1?=
 =?utf-8?B?RWJtTUk1WlFyVkhiMkFFb2hoaExscmZmZitRL2xjQWxkb0x2eDltRGxDWFhT?=
 =?utf-8?B?eWRJYXNnL1NqdkFGVVhCS3A1UEhQVUk1L1VSSEFPOTViK2JIZDBOTk1KL1Zl?=
 =?utf-8?B?Z29MSmNvdUZldzAzRmg3YWUyZ1Q4MVIwUlREMGFsV2Y3MUY2UU80WlV4M01T?=
 =?utf-8?B?TTF1ZEtMN2tOK20xUkxoTEpGUkcrQWdxeUdJZkc1QlRGR3hSRjJoazcyOS9x?=
 =?utf-8?B?SDdYS0hmTjdhUkNXSy96N0MrV3VCQS9hd1o1V2FiRUJPbW9ranFIMzJNdXJO?=
 =?utf-8?B?Q2Y0aUVrKzV5aUZoZ1lYUzkwdnBLZWNvVFNJK0IvSHI4NVRKblpzRlVDam9F?=
 =?utf-8?B?Nnd4UmExWnBpUENkUWd0TC9rdm1sNWNTYVRwWElCeFdGZDBPSEd2ejRWeCtk?=
 =?utf-8?B?bVlxaXhNZjRGWFFSUWZaRFhiVnN6VUpDUVo5UVhOUDM3WUpGL2txajlkcGR4?=
 =?utf-8?B?QTU3VFBZV2w1L3A2THUxQ05PWXoyYzlkYmtaNUhCeWZodHVWMDdKU0pIZ3cr?=
 =?utf-8?B?RG1VNzB4YVNCMnpKY203S3EzTDJKYUtpM2ZMM0dFWGtYZzhwTUZ2cGl3ZSt0?=
 =?utf-8?B?dUcwRUFDQ0M5OGsrcC9abW8wWnEwL3RYSDJoTW1seExCbXhUNHZzNno3M3p6?=
 =?utf-8?B?NVdYMmxNMzJmbjN2UUYyL0hTVEszRVVkcXhJZ0hOWm1pNWUxYjE2SzRxZ3U1?=
 =?utf-8?B?MzFRd2c0NXFLaTJrcmNubERvVk5rdHR6WWcxM3E4Q0JoRnBEK1NBbjRPOVZH?=
 =?utf-8?B?aDk1bTkwVExDNlJxYTVNQTRSR0I5REtJZTd3eko0eGwwMzBnRm8zRnVvclZS?=
 =?utf-8?B?dDJCN210bzFnNU5PTHhQa0huQnVaN3VRRTg5T1JHOHMrTDdiN2lpcVlrWjF1?=
 =?utf-8?B?dWpHbGF6eTg2ZnBEM1hZK1RIWE9JTm9tNitNcER3OWFJWnZGZGF1amw3cVhu?=
 =?utf-8?B?b3F3VU5QSVJpb1pMZis0dEI5THhUemhNUUROTS9qTWFYNjlTRm1FbitOTlRv?=
 =?utf-8?B?a3laYWRFNnBpSnFXamZ6Z3BsVDJFTjh0Z1NkUUNHSzQyYkpZaFVQSWRpTEZl?=
 =?utf-8?B?aVVab1B6SUhoSVRiTVJZSFBGVGl0N2Y4UndTcDZpS0l4RHlsd3p3bldpemE0?=
 =?utf-8?B?d01yTU1QM2dwak9taUFUeHorQ2xQRFBJTzN3NFJDNUxSRGFMVU1yTWNsS0VW?=
 =?utf-8?B?VUtvTTJ0Q2s2R3RaYlpHK0g2S25rbFkxRUxmeUtHS1NCU0s0VFpwVHlBeFBw?=
 =?utf-8?B?OFNuVTBMUzl3bll3aU1xTEpOZlpReXJpaklKazZRUW05dldlS2w2Um5aSzZ6?=
 =?utf-8?B?ZlNUZ3g5WXloVU16U1Y1MzdxZGNlWjJTdTVIeDIzODFLbmpwbFlwbk44eUNz?=
 =?utf-8?B?cjBOc05Jd0Z4eUswMjJOQ2o1bTZ6QkFwNFlaNVA4L095V3hGVHkzTkErNURp?=
 =?utf-8?B?QjVNQVA1ekROZ21WNFlGUXpvS3FZaURVSHBDZCtCdDk2blpyWEJDdUtmK2Ix?=
 =?utf-8?B?VktBZFl6MjhaM0dUVVpPc2MrclMwYWFaZ2N0SE1LaVpmMUc1RE1SZW9sdUZu?=
 =?utf-8?Q?IWUPxuIJTGlWOgeQEV1nAebP6rWLso=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZnMrbGF5cmRsVENsdCt2R2t2THpYOEhyWDFlTFlhTkhHdW1VR00xT1pHRkRY?=
 =?utf-8?B?TFBGc09JQlJ4RjhxTVZYdUQ1Ly9ISERwNTRMbldKWVpxUExzeEhxVGJUTE83?=
 =?utf-8?B?VFllaHFaYU5RWHYrNjhDREZGSXdGRVBTNXdpMTBVWlRFNk5sNWZwL283MHVx?=
 =?utf-8?B?N0ZPMHlmMCtpRGkxeEE5cWJrTVdKd1pFeHl4TkJGdEs2UndWY3pUMnp1Z0hG?=
 =?utf-8?B?NGYrRWdFSW5BaTd0NCsyZ3pYTjgvYkZSTzJuVkxQNDNaRE5MQlM4VjFsUEx6?=
 =?utf-8?B?RmZoRFphZm1oREE4bzgzcHNPSTlVQ1ljbW9QdUVHQzk0MzczYXhILzh6dzZz?=
 =?utf-8?B?a0owQTNBL1pyRDRqSlRIUHFFUXJwczE3ZmE5aXVua1V1VjU2QURqUmtXUEE1?=
 =?utf-8?B?dnd5K3BOdWVNM2RhbHZ0RUFYdEdNVGJRNnRSOHhsWkRYamdNY2Z6VFliQTFJ?=
 =?utf-8?B?ZDZuMFNEUzlLVlVxSWpuOFlNOURPRW1QQmN5ekFldU92NUNTYmRuQWc1MDkw?=
 =?utf-8?B?aVNmYjlrUUVpaTVBRWt3c2tPc2JiSXR2VDh1Y2ZlemNQQllrWUdnb2s3cHNM?=
 =?utf-8?B?dWovVjVWakVYMDcvQy93dXl2aDhDdVFKY015NTdiMXlzNlJ6SFplSXE0U01Q?=
 =?utf-8?B?aXVVVWNwNHh1QllIMWhRWFFwVU9qTFpQR0x6VnZ5RStQUEx4OS8zZEVsVlY1?=
 =?utf-8?B?WmZtN1FBamtwc2ZncXRHbTZJTEI2SzBjODgrR2lhc2hGSy8vN29YTENpOFBz?=
 =?utf-8?B?UVkwaFJxU2ZJR3BndDZUS3RwV1pERnNVQ0d5SUJEdi9LNXJZVUxUTDhQTVVl?=
 =?utf-8?B?OGtmNlNkVGY5eHM2YmpKYTBrK3dWWHZ6ajJHMVdtOWJmRnhhOG1WbmV2djFQ?=
 =?utf-8?B?S2VEL0VJZzB5dnU0UEl4VW92NTlyYzBOVEFic1ZsV0FmWTgrdzE4RXNYSDRu?=
 =?utf-8?B?ZmlpaHFSMXlGMUtKaUlqT2wvZWx2bUNrU3NENkZOR1M1L05FckRORzZWNmxP?=
 =?utf-8?B?SXBkVUo5SStZd29nNy9mS3kzWjlrQU1VQjFLVllCbFlGa2ZVbFNHem8ySUZx?=
 =?utf-8?B?UlArYmhlMndSY0tYRTlubzFxM1BoT204b1dDQ2NvNjJzeWVFc0p6a0dOcm91?=
 =?utf-8?B?NnRDNm9DUW1INEhlQzNBQlNlbGhpRzVJRXk4MHVsK1lNYTdpRENyTmpxckFU?=
 =?utf-8?B?ZWxCaGUvSUlyNXNiaHN4NnZFaTlXODRrU0J4NHlLaEVldmRlZDd0UTkrMG10?=
 =?utf-8?B?bTlUcGRreWVpaktGQ0xLM1BjRzJjYVhXb0dIZThuYWIrdHdFc21KeUNZcnBt?=
 =?utf-8?B?SkM0b0xBV0lRNnR5VCs4bWtuMGY2aWxaaGlGT2o3Tno4RlpEYjRGUkxHNjBV?=
 =?utf-8?B?NC9qMnVLTVlHZjRVdVZXdStXbGlROGFQMzEyRnVQaFJiUzM4czdCVzF2QmtJ?=
 =?utf-8?B?ZVo5ZEhSZEpPSHFXS1pNRDc2WUxrcjhrd2MzSzhVZDlpeXV4RHNubU9ycWd3?=
 =?utf-8?B?V0UrcGZyYnhsYnZCMTM4ZXJEUnF4Y2ZJWUhNQXJiR1JXMVhEOWI2YjdLMm1N?=
 =?utf-8?B?ZGhGR0dDQkFhd0xnNlROb3lQL2Y1VStyTjBQeDJzVzQ1YzgwRXd2OW1kSlUz?=
 =?utf-8?B?elplbmZpdzdvM1lRZUcyN1dLSWkrNW14U3dsQlROTVEzQVBvWVE1ekpNS1BZ?=
 =?utf-8?B?ZDFSL2pJdFpodURJSG9WTmltUThid3FiODNxQnB1eFV0enZ6WXhvb2FGT0VZ?=
 =?utf-8?B?MnZLd0JhUlJ6ZzE3ZWU4RTMvcXQwc2orWk5SeEFJMkJPMUFjRWU0bVRVVk1Y?=
 =?utf-8?B?QmgxTDNJa2kzeXFhdDRVOE5Hc0FGRk1vWWcxZ3pyR1FQa3JrRXBPbVY1MzZ1?=
 =?utf-8?B?cy9FSkh1YlB5NFhZRVhkY1lpL2g4bUx5OGhtbUo1TEJzTTBGbTN5RFU4cFAz?=
 =?utf-8?B?SVRxcHRBQVFtdk0xMzZhRk9CdXJ2UHQwSWZ1K3JycTNpM3M4OU9lTWN3Uito?=
 =?utf-8?B?TzQ1YVkwTXVlckJaOGlWNGN5U3BIV0duTUZ5VDBxZXZuME5PM2UzYms0aTVT?=
 =?utf-8?B?cHBDMHFVMDZZRWprbldzcGFJTU1XaUdkek5uWmErb3VzbmkxM1gxUWo5cTVa?=
 =?utf-8?Q?0rCk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ba8398-f847-4e2c-bf3b-08dd821e8b99
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 04:23:05.8917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BsOSA3JQojD2ADjxvEM0tEHrqMKQzi6/qC7R3ynMyhsUQToKtATGD837oQZvLCPg7kqMDaS/c/Is3dM6w+yxZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7436
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KVGhhbmtzIGEgbG90Lg0KDQpSZWdhcmRzDQpTdW5pbCBLaGF0cmkNCg0KLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCkZyb206IE1hYXJ0ZW4gTGFua2hvcnN0IDxkZXZAbGFua2hvcnN0LnNl
Pg0KU2VudDogVHVlc2RheSwgQXByaWwgMjIsIDIwMjUgMTA6MjQgUE0NClRvOiBLaGF0cmksIFN1
bmlsIDxTdW5pbC5LaGF0cmlAYW1kLmNvbT47IEtoYXRyaSwgU3VuaWwgPFN1bmlsLktoYXRyaUBh
bWQuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IERldWNoZXIsIEFs
ZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxD
aHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5A
aWdhbGlhLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS90dG06IGZpeCB0aGUgd2Fybmlu
ZyBmb3IgaGl0X2xvdyBhbmQgZXZpY3RfbG93DQoNCkhleSwNClRoaXMgbG9va3MgZ29vZC4NCg0K
UmV2aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxkZXZAbGFua2hvcnN0LnNlPg0KDQpPbiAy
MDI1LTA0LTIxIDEzOjIzLCBLaGF0cmksIFN1bmlsIHdyb3RlOg0KPiBATGFua2hvcnN0DQo+IERv
ZXMgdGhlIGNvbW1lbnQgc291bmRzIGNvcnJlY3Qgb3IgY291bGQgeW91IHBsZWFzZSBzaGFyZSB3
aGF0IHNob3VsZA0KPiBiZSB0aGUgcmlnaHQgY29tbWVudCB0byBhZGQNCj4NCj4gUmVnYXJkcw0K
PiBTdW5pbCBLaGF0cmkNCj4NCj4gT24gNC8yMS8yMDI1IDQ6NDkgUE0sIFN1bmlsIEtoYXRyaSB3
cm90ZToNCj4+IGZpeCB0aGUgYmVsb3cgd2FybmluZyBtZXNzYWdlczoNCj4+IHR0bS90dG1fYm8u
YzoxMDk4OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Igc3RydWN0IG1lbWJlciAnaGl0
X2xvdycgbm90IGRlc2NyaWJlZCBpbiAndHRtX2JvX3N3YXBvdXRfd2FsaycNCj4+IHR0bS90dG1f
Ym8uYzoxMDk4OiB3YXJuaW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3Igc3RydWN0IG1lbWJlciAn
ZXZpY3RfbG93JyBub3QgZGVzY3JpYmVkIGluICd0dG1fYm9fc3dhcG91dF93YWxrJw0KPj4NCj4+
IENjOiBNYWFydGVuIExhbmtob3JzdCA8ZGV2QGxhbmtob3JzdC5zZT4NCj4+IENjOiBUdnJ0a28g
VXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaWdhbGlhLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IFN1
bmlsIEtoYXRyaSA8c3VuaWwua2hhdHJpQGFtZC5jb20+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYyB8IDMgKystDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm8uYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGluZGV4
IDk1Yjg2MDAzYzUwZC4uNWJmM2M5Njk5MDdjDQo+PiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMNCj4+IEBAIC0xMDkzLDcgKzEwOTMsOCBAQCBzdHJ1Y3QgdHRtX2JvX3N3YXBvdXRfd2FsayB7
DQo+PiAgICAgICBzdHJ1Y3QgdHRtX2xydV93YWxrIHdhbGs7DQo+PiAgICAgICAvKiogQGdmcF9m
bGFnczogVGhlIGdmcCBmbGFncyB0byB1c2UgZm9yIHR0bV90dF9zd2Fwb3V0KCkgKi8NCj4+ICAg
ICAgIGdmcF90IGdmcF9mbGFnczsNCj4+IC0NCj4+ICsgICAgLyoqIEBoaXRfbG93OiBXaGV0aGVy
IHdlIHNob3VsZCBhdHRlbXB0IHRvIHN3YXAgQk8ncyB3aXRoIGxvdw0KPj4gK3dhdGVybWFyayB0
aHJlc2hvbGQgKi8NCj4+ICsgICAgLyoqIEBldmljdF9sb3c6IElmIHdlIGNhbm5vdCBzd2FwIGEg
Ym8gd2hlbiBAdHJ5X2xvdyBpcyBmYWxzZQ0KPj4gKyhmaXJzdCBwYXNzKSAqLw0KPj4gICAgICAg
Ym9vbCBoaXRfbG93LCBldmljdF9sb3c7DQo+PiAgIH07DQo+Pg0KDQo=
