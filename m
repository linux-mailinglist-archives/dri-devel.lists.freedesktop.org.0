Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F32B065EF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 20:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879A210E638;
	Tue, 15 Jul 2025 18:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EqBkuPa0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D416E10E638;
 Tue, 15 Jul 2025 18:25:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9b9/CzvKXfaTWEnD7yItTIGeMICwcTUIPvFRzr8/sBFU24dNjp20i0/zVKkYdMJxE1IwDde+AW6kmNnb0DpreZSffW7co7uSIqPz2A+OJlVWSJxz/vuTGeBtMltcrhmoVkx+pzBoj7FYz/uE3vRUHNfZPFDaQLkrzP5yvlWiNE8zYdtOX64OwFXtmyWO0omZF28vBHLGZ5U6XjEyFUPFLLq7iz1ufs4EeDceSH7AdNLpgXnq0k/CqyEwCOJl+6sUOkVFamHl+7huy0HKDcttgwEKXH0lmcVC8Fq/fWL0aUhhvUp7GTR7DOZK2VI2zfAdSC/PMLPbEdpUufy0duAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Eb9eDfwft0p+QbFuHUiz2Gr9nj+ymu27ump54pnmrs=;
 b=Qqvb2v5XVHBpHVF9/EE2URO2UycHN+GDTfiKlA7M8TiFcBXv6Un6QxmWD1JbzGbR3TzoTk+x4N8Oy3i8o6uQ7s2EfZSeji2mPHcACVkiorsoU6ggPJnN863VtwkgDtQImsw8ED06lExdsT6EnL0apQIPAQGW1qwCTjb5ylmzgxnVO3GSVkIBBbF68M+G85+RFMpY6nOR9uOYeDn+LfHMhg+TOXPTVeB4nLG7kE8vJqQONymqJo/1LJHZlaV7RHJQoXOHoDVE3xAz/PVTHmhexwdg+7pUSXH1e9MG8+l0JocycyagGKVRVs0HZBxPt+Yktw0zr41q9ifSGhZiOYKCEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Eb9eDfwft0p+QbFuHUiz2Gr9nj+ymu27ump54pnmrs=;
 b=EqBkuPa0HhrMQHTbLcEqezfwN6RfLoZYqob6I20qsNb6j4DNzKP0arxbzoBXUDIFkLP1LnCmPfn7sMNhppjE4PSjZijkdoxTJio+LXJPolKcdkxmIFDb35/ejQMpsZLpyoilcs3M1JFCSup8gasQEddO1+JnwpPXSLmfEhGdyrA=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by IA1PR12MB6529.namprd12.prod.outlook.com (2603:10b6:208:3a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 15 Jul
 2025 18:25:46 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%4]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 18:25:46 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, Thomas
 Zimmermann <tzimmermann@suse.de>
Subject: RE: [PATCH v2 09/19] drm/amdgpu: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Thread-Topic: [PATCH v2 09/19] drm/amdgpu: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Thread-Index: AQHb6me4w97BooBgbUGhojMx5sIC17QzlqOA
Date: Tue, 15 Jul 2025 18:25:46 +0000
Message-ID: <BL1PR12MB514419F79C06264416511BACF757A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-10-ville.syrjala@linux.intel.com>
In-Reply-To: <20250701090722.13645-10-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-15T18:24:46.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|IA1PR12MB6529:EE_
x-ms-office365-filtering-correlation-id: 93f8ea94-489e-424e-4203-08ddc3cd0465
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NnpWczhkcnl5RkxHSXpUQlBWZjZTOHc2VGszZkViQWNtcUtpTUlhY3ZtQWRJ?=
 =?utf-8?B?TG5HeTlNZVhQQVhSZzQrR3ZzZjB6UkMrdHdjeW1LWi9rdk9taXdhZmJKUm9E?=
 =?utf-8?B?U0VCSWZhOGR6OG1lc2RSdDN6RnJkUVpUVWx2bmR6M3AzOXBQclBzbnVCOFFD?=
 =?utf-8?B?OU0yenAwV01KR3VvMm9xYm1acDZvSTNhSmgvb0N6dXJNS0lka2pyWnJONHQ2?=
 =?utf-8?B?aTBJM2pLVW9CcjNyMTRJNlZjaHdMdTZ1MDQzSHc1Q3hQaHY5VlNCS0ljMVB6?=
 =?utf-8?B?L3l4K2tCTG1IaHVaS0h5Z3hSWnU5SC9qSmpBWEQ0RTlHM0p0N3BlNGN1VmdY?=
 =?utf-8?B?MTZwQ3Mwcllqc3VmcXRXd2VXdStLeHM3S2VWK3V5R0szNUJMQ1phWFVSMEFQ?=
 =?utf-8?B?bm8vZGxVZnJicEFndkJhTXV2Y2wyczFHaVRYUmtVU2V4QStVczlOL3hWVW5r?=
 =?utf-8?B?L0dEbEh1eHljSmk1WVBzTUhSM2dhREdNbnVpOHJxYThnM2o5TmVWY3JiSU1I?=
 =?utf-8?B?ZnMwWWhxOUd2WTY1Q1dtWHRPZmw3cEU1Y3dFeU5Nc2NPSVdPWk55dHBnV3Rt?=
 =?utf-8?B?VEk3L3QzODdxUzJ1RGZOcTZueTlMTGZITnVwYUo5S3YvSXIyVE9lQU95Z2l6?=
 =?utf-8?B?elRWbXJuVTRTNEpqeTJybHVyanV0VFlpZFVhRkNoYTRHL2p0N2RJRFpSK21o?=
 =?utf-8?B?T2pBUGVMTzNub0wvNjkzanFieEg1NFFlQ2FwVzJjb1Vmb2VuL3NSaW5XSzh0?=
 =?utf-8?B?MkRGV05LeW94QUlaR2RpTEZOQmorVEVyaGJCcUZiTG8vMjJ0TnhTdVpsRmpv?=
 =?utf-8?B?eXhsOWRJOERySlgrUHVMYmlyaVM5YjNVSXVORmlGSVorNVNlVlIvaWk1dDF4?=
 =?utf-8?B?UVQ4SURDR1doa0wwcjAwb09CTVp4NjFUZ1pFU3VOMytlQzZqbisvdG5mSHdV?=
 =?utf-8?B?ZkhmbFVGVEd6T0U4VFpzRzhLRTNPeStHaWF3VEhoUmpDelRTbVVpVFg3NlVr?=
 =?utf-8?B?TnZIdTZIOUpVSytVbHpkMU1UcG1WZnIzUmhNNStqQmxFRmpOdnpZMFNHVk1m?=
 =?utf-8?B?T1F0alZsLythWFRkMi9VcVBqeEJ2QzFhbXhQeVpVTElIeFRjV2JaTHk0bmRZ?=
 =?utf-8?B?NUROWGdONkZmdVpaZnFCUjdFTkl0aEhXME9INUJkd2hEZS8vWmFVWk53UUY4?=
 =?utf-8?B?Nys3REJ0Q3pkR2xsb1JBZzVSOXFOT1orLzNpcGh1WUVQRjdJa09aUGd2SFVq?=
 =?utf-8?B?MHVvRkJPSEJIeVZqUERPaDJGSGRJUGVyaXRsREZIdXM2NGdzOHhMZFJNbVNX?=
 =?utf-8?B?YlNoanV0dFBJUGVqOE1MU2pJbDlkK1lOb2RhajU0V1IycGltVE1oNVFFbC9o?=
 =?utf-8?B?b252aWx6em13Z29JcHoxbHhLWEgzOThUY1dpbk13bGxjdG1qTTVWakxOUVpo?=
 =?utf-8?B?dkEySFZYcWM5aVlhb0pjdmZCZkJFS2hJbjh4QUZkU1dZUkJ3VEtxNFplZUk3?=
 =?utf-8?B?cFRlMFhQaDBFUkVYb1pUcHpNa3M0N051WTZta1RiTy9DVEpibWxBL08vbEVH?=
 =?utf-8?B?TVA2WDJQM2ZNSEFjR0tFcmwxQ1BTQUVhNmhXVlJiYVdldWhiYW8wQjMvRSti?=
 =?utf-8?B?VlJpQTRDMGF5NStnRmwrdmp4S2pTcHBnTiswMTJEYjFObTBJbFl4UkVlTlN2?=
 =?utf-8?B?VFFXU2R6a2Fpbm4rY2ZkK0E0Z1dXYWtnUkNYdHZBWlV2b2ZuTWRQek9rNzBP?=
 =?utf-8?B?QUp2YTZ1ZnpVbFI1VWVhM25LMlNScVdjVUVieG1zMzRrWG1maXVwYjZuT3Uv?=
 =?utf-8?B?RnFVWkx0TmRzWk5mTEgxS2NwTUZuZDJHRG9GN21kL0tWN1JvMm12dUNqRktG?=
 =?utf-8?B?Wlp3aGRyWW9TQXhBZmZPRGw2V21rVXRrRy9ta3hQYXlITEtmeSsyL3pqaDhi?=
 =?utf-8?B?d0JWVGdwRkpDVUdkZGVHajM2VjAvazhHdTFBZWZOVHJTK3dreXkxNDV1OGx3?=
 =?utf-8?B?YThKSVJTbDNBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1FMN2JXVDVUZVIxUXhTclNsQTFCTnZZWHVlSy9MUHUwcVpKaHRMZTBCVVpY?=
 =?utf-8?B?WFo1QUM0RW83cVN3aWRaM2RXL1dnV2NhVTF6a1FKWklPY3V4TGNrZFdmQzlV?=
 =?utf-8?B?SldSTzZlb2RTd0tUNm9YWkRzQW1seTdMQlEzcGtxWFhpOG0vOTZ1cnVQbndB?=
 =?utf-8?B?SEJHdHc3NDFqZFdSRUcrV01Mc2hLRG1TbEhHcXVXZXpHeWlTeG82YWRyYTZH?=
 =?utf-8?B?YnRLdDBrdDIzMUxiQUNVV3p4akVQZEtvbWFDOTliTFdLNFhxRUZRT05EZkpB?=
 =?utf-8?B?QXRhcmZDeTNWUTlJT0JubHF4SEdmUXVkVm9OclkyaHR2cXJzRDRKMExPNjdj?=
 =?utf-8?B?eWk3R2hQMzQ0UlYzNnBXbE5yM2w5VHBtSWd1bm1LSWs5Z1dwTzk2MGJVQzJS?=
 =?utf-8?B?ZmVGU3p6T3RyVkEvcnppemZrRXF2cE9hdDdZazQ2VG14YTFnaE1wVTVRZnZ4?=
 =?utf-8?B?RmpqUG81TVpoNC9QS3QrQ2tHdUlDTFpOaVJHTk1QYTRtN2JUMUJKTHl0Q2Vy?=
 =?utf-8?B?Q2xzck9tNDRtSG1ibm5IbEVpWWQrL3NUekFMYU9KV2I1UGIvRHhtU2F3clFj?=
 =?utf-8?B?MmxqRTBZTzNETzR6SHg2OXFPNERETlZOMVF1RExUU1RGZjNkTGVQUU1icXlw?=
 =?utf-8?B?ei9Rc25ndi81SUJCQ1ErZHA1QXFKZzErbW5CdFFRbVFybVNUN1gxd0M0RTNj?=
 =?utf-8?B?UjJERVlkWlh6SlZ1WlFuVUdwTnBGTk9NcEV6eUFFT0YrKzNhdThsNFVZTUlX?=
 =?utf-8?B?M0tFbVVvdnBqU01BOWhLUnl1WmhkVUswY2pESDlwYnZ4N0M5WXAxd254MlVG?=
 =?utf-8?B?TDI0bkF1VFpUemM1aHlOd1d0Nkp3WitRUlU3RG94TFM0ZWlPemdFclBnOVhv?=
 =?utf-8?B?djdZTndGVW13MzZZSHN0blphUDFZbU4yWVcxdXBxeVEzZ1gvelZHcE00TS9k?=
 =?utf-8?B?NkEwZHVRNVM5azlydVpuVk01VjhUMGdDT2NmL01XdEtySVVyYVpzZi9UNzRi?=
 =?utf-8?B?a3lPaVU0UjJ2cnlOa0w3L1NDbkFXZm5TRnFrUjBoS09JTzdWSEYrdDg5VEZW?=
 =?utf-8?B?alVMLytGVDM2cjJhQzR2eTA1Wm5qSmd5RFNOeUxnbytreHlIYzV1VW9BL0Nt?=
 =?utf-8?B?YjVHMEpKRFRSNDY3RXV3bGNpNmg5YngvZEpLNDcwM3BuNkQyVDZJaXJhdDdh?=
 =?utf-8?B?OERHbndqQlprREhrUzRpOFhZQWJ3YjF4MU9rdjNkdDhoaGF5a0duZTdFbTU2?=
 =?utf-8?B?bC9JWHJ2SWFZcGl1VjF6Zmtybzh6emxJVlhqSkdvZ0J3VzF3aEtQcHFQc3pj?=
 =?utf-8?B?TnN1VzlkcVA5bWppYkIwV1ZRMVRnb0IvVmpTL0hUT2tIa21FU0NhbjBBbVJ4?=
 =?utf-8?B?VjBNaGZMdHR0eHZjcGVZODczL2l2bHRMM00rQm9QMVJwY1lnK0dPM042UG5p?=
 =?utf-8?B?cndCKzYwdmNqUml4akFFTjN0NnVmeXl4T1hZN0pOUElHSEZ0RER0UDdhNFVy?=
 =?utf-8?B?MnVpci9BWnQzR1V2RHJTem9Ya0d0TkxLQXBJaXppK09VUjU5ckJYZWpUWHN1?=
 =?utf-8?B?eXRkNUxNOXlNcUE1Y0pMYm9hNWw3L2F6VEtqOWRacUJHQy8yUXArMmtCM3Mw?=
 =?utf-8?B?OHFTaWlsQmdUR1l0UldCNXh4T1pQS1VqR3ZraElicVNOaGpTSjBudlE1SHdN?=
 =?utf-8?B?QnJHbFNYTm1rZTZPMEpLZlFBTFRrWmVWNnB5eG1qeFZQMXA4Qldvay9tL0Jx?=
 =?utf-8?B?MlF6dldlYmtrbkcxTjIrRms1R3MwMzQ2ZEJJdmw1SDZrMkhvdTQxMGxXc3NK?=
 =?utf-8?B?VzRKb2JncVV5cHF2QVdNR1JuS0hXRnk0UW94R3lIM3QwWDBXUnB0cW1jdVls?=
 =?utf-8?B?VUpNSlJYQkdaQWZFQjdPOTBLNk5RbjZpVEF5QzUrbmpQRllFR3Jta2N2a3NP?=
 =?utf-8?B?SE14cStrdTBkNUw5QjdjeFRSL1A4VzZ0cC9Ca1dtejZmUVRiTDlVa0Jtb29R?=
 =?utf-8?B?cVhoaDBXNnlJWVR2eFBKaE91MzdRdWRLZlR0VzZpUmpTdnFIYTFFQ05sdmg3?=
 =?utf-8?B?aFNVbGFadjJWZVB2WjR0c0p2WGRQc0JxOTJaUlJCb21NUVBldWx1Kzk4ZlVI?=
 =?utf-8?Q?Kb8A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f8ea94-489e-424e-4203-08ddc3cd0465
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 18:25:46.5304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FnFutZkHC+09XcVorUFWLIawdnm040nneFEhrp6GxSF/8AJQCs6cy6hnPmvKSL/lyWjh8neBiQn10BDhuT6DFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6529
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVmls
bGUNCj4gU3lyamFsYQ0KPiBTZW50OiBUdWVzZGF5LCBKdWx5IDEsIDIwMjUgNTowNyBBTQ0KPiBU
bzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogaW50ZWwtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEZXVjaGVy
LA0KPiBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsNCj4gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MiAwOS8xOV0gZHJtL2FtZGdwdTogUGFzcyBhbG9uZyB0
aGUgZm9ybWF0IGluZm8gZnJvbQ0KPiAuZmJfY3JlYXRlKCkgdG8gZHJtX2hlbHBlcl9tb2RlX2Zp
bGxfZmJfc3RydWN0KCkNCj4NCj4gRnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxh
QGxpbnV4LmludGVsLmNvbT4NCj4NCj4gUGx1bWIgdGhlIGZvcm1hdCBpbmZvIGZyb20gLmZiX2Ny
ZWF0ZSgpIGFsbCB0aGUgd2F5IHRvDQo+IGRybV9oZWxwZXJfbW9kZV9maWxsX2ZiX3N0cnVjdCgp
IHRvIGF2b2lkIHRoZSByZWR1bmRhbnQgbG9va3VwLg0KPg0KPiBDYzogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPg0KDQpTZXJpZXMgaXM6DQpBY2tlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KRmVlbCBmcmVlIHRvIHRha2UgdGhlIGFtZGdwdS9yYWRl
b24gYml0cyB2aWEgZHJtLW1pc2MuDQoNCkFsZXgNCg0KDQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jIHwgNSArKystLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMNCj4gYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jDQo+IGluZGV4IDRjYmJhZTU0M2Uz
NC4uMmJjMGQ5YTI1MDlmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGlzcGxheS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kaXNwbGF5LmMNCj4gQEAgLTExOTYsMTMgKzExOTYsMTQgQEAgc3RhdGljIGludCBhbWRn
cHVfZGlzcGxheV9nZXRfZmJfaW5mbyhjb25zdCBzdHJ1Y3QNCj4gYW1kZ3B1X2ZyYW1lYnVmZmVy
ICphbWRncHVfZmIgIHN0YXRpYyBpbnQNCj4gYW1kZ3B1X2Rpc3BsYXlfZ2VtX2ZiX3ZlcmlmeV9h
bmRfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBhbWRncHVfZnJhbWVidWZmZXIgKnJmYiwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
ZHJtX2ZpbGUgKmZpbGVfcHJpdiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBk
cm1fbW9kZV9mYl9jbWQyDQo+ICptb2RlX2NtZCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikNCj4gIHsN
Cj4gICAgICAgaW50IHJldDsNCj4NCj4gICAgICAgcmZiLT5iYXNlLm9ialswXSA9IG9iajsNCj4g
LSAgICAgZHJtX2hlbHBlcl9tb2RlX2ZpbGxfZmJfc3RydWN0KGRldiwgJnJmYi0+YmFzZSwgTlVM
TCwgbW9kZV9jbWQpOw0KPiArICAgICBkcm1faGVscGVyX21vZGVfZmlsbF9mYl9zdHJ1Y3QoZGV2
LCAmcmZiLT5iYXNlLCBpbmZvLCBtb2RlX2NtZCk7DQo+ICAgICAgIC8qIFZlcmlmeSB0aGF0IHRo
ZSBtb2RpZmllciBpcyBzdXBwb3J0ZWQuICovDQo+ICAgICAgIGlmICghZHJtX2FueV9wbGFuZV9o
YXNfZm9ybWF0KGRldiwgbW9kZV9jbWQtPnBpeGVsX2Zvcm1hdCwNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbW9kZV9jbWQtPm1vZGlmaWVyWzBdKSkgew0KPiBAQCAtMTMz
MSw3ICsxMzMyLDcgQEAgYW1kZ3B1X2Rpc3BsYXlfdXNlcl9mcmFtZWJ1ZmZlcl9jcmVhdGUoc3Ry
dWN0DQo+IGRybV9kZXZpY2UgKmRldiwNCj4gICAgICAgfQ0KPg0KPiAgICAgICByZXQgPSBhbWRn
cHVfZGlzcGxheV9nZW1fZmJfdmVyaWZ5X2FuZF9pbml0KGRldiwgYW1kZ3B1X2ZiLCBmaWxlX3By
aXYsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
bW9kZV9jbWQsIG9iaik7DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW5mbywgbW9kZV9jbWQsIG9iaik7DQo+ICAgICAgIGlmIChyZXQpIHsNCj4g
ICAgICAgICAgICAgICBrZnJlZShhbWRncHVfZmIpOw0KPiAgICAgICAgICAgICAgIGRybV9nZW1f
b2JqZWN0X3B1dChvYmopOw0KPiAtLQ0KPiAyLjQ5LjANCg0K
