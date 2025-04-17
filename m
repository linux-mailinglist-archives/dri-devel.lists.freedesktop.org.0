Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0958A91B08
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 13:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AE010EAD3;
	Thu, 17 Apr 2025 11:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RtICPirR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9D710EAD3;
 Thu, 17 Apr 2025 11:38:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4rTDyaTkM/q0kNPs2sS4j7asMawxUeDjtETEeeFJrDICRGvp3zhE5ZjLVX47dL0UpbFezgJLwqIGQ9z41X4mER9MBvPwiW6JH4uYi3dPbFjwk9LMKm77nIvH1SufpHIDqS0UbL5vPeDv5Lc2asUaBkJz8rrD1zgjfD73BRcXTDC29k1/KhcLbab4gQQ8n6J0mwLyYbMZwprqzSISbLmNWgq0BMMb/be0d/kAyBOEblExKTR6R6G0/+GoX/FNV6B13vHufEiyVsPRx7gO3lGVDkptDTaLgWqy01mywlJL0FSo13SQUz+cIdttz2kIyamc2Rq6eUjEGVx4MoYilm0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vIzqPluA1yWh0QYPC1wpbepOh+6ZNDsTY6U1gtL5Tok=;
 b=O7hw/dnlPKNACGgAPcWig4AZDWSULjRHBIHKtdbGMuXtjGW3JC6WfuJIQunfsHIkSMQdSgrnBP3s2Cqz5ecyGeIuGy785VfGqTLvkOQmjOfj6Sb7+nZ2hWZo2JaEgeIXPdvdXz50cMEtJCX4bcgSvro20JGmSCMXsLldZSiJkGTAibuVUYRA2k4qs/z4l5SYmU160HMv9aHYVoUdh7Yacxyw/EI+VIj5jPEjCy9BBuXgd+GfS91B8X02ZcHnuK0v1b2qZfCIbVw9ddI2BmaoBsJcsajm+uKFuGV5vA0h72boQYgWXik6WOcEa7mg/6TmQsxpnVf2bRjYaCMgAOs8JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vIzqPluA1yWh0QYPC1wpbepOh+6ZNDsTY6U1gtL5Tok=;
 b=RtICPirRe8WUNG2qq5FYDAVB0yBIEhVHnWJAzHyxA8GX/Db/e1MCGfhFk82GsidnHI7NF25qDZKcVf6P+g96h/EzUp0yYXvLcQwkoM4NMMQbLLrghG2/i3ME7ANe1cvG3VBZ24+thUkyGu9saJ/vD8t1gs/MU9HCmEysEz99Ixo=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 11:38:13 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 11:38:13 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, "Pelloux-Prayer, Pierre-Eric"
 <Pierre-eric.Pelloux-prayer@amd.com>
Subject: RE: [PATCH v6 1/5] drm: add macro drm_file_err to print process info
Thread-Topic: [PATCH v6 1/5] drm: add macro drm_file_err to print process info
Thread-Index: AQHbr3kSQT/TX6SGzkOWvR2OhH+7m7OnmR6AgAAGKQCAABO1AIAAAw2AgAADMoCAAAHPgA==
Date: Thu, 17 Apr 2025 11:38:13 +0000
Message-ID: <BL1PR12MB5753AE536A87EFF65B71A42F93BC2@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250417091355.2240384-1-sunil.khatri@amd.com>
 <874iynp1uw.fsf@intel.com> <05d7ba43-28ff-4c76-9b63-782b8df0f9f6@amd.com>
 <871ptroxkl.fsf@intel.com> <2ec09b8a-25f3-484c-b81c-f6478d9743cd@amd.com>
 <87tt6nnhyw.fsf@intel.com>
In-Reply-To: <87tt6nnhyw.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=a9e2ab7b-37b1-4adc-84a9-81a722326f95;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-17T11:36:43Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|IA1PR12MB6259:EE_
x-ms-office365-filtering-correlation-id: 0614ebbd-991c-4dee-5869-08dd7da45631
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Y0UxaXhjek02ak5ZcVBIZjBrQlFvOXZmK3k3M244R280VEl1cU1hbnRyN0VS?=
 =?utf-8?B?dGRMRExDZlR0aXdxejIyZ1gwM0g1cHpISDMvTnRKdmhhbG0rRTJCV29yeDQ4?=
 =?utf-8?B?THN1SUdwTUFYcEd6anRXS1h6Y0VCMmN3V29NK1dweElWZ1NDMUpaWHg1bUlQ?=
 =?utf-8?B?WmlDQk53amtTVnlqY3lqVUpidCt4WjNaLzU4bllwd2R3UFFJOENaQyt2YTd6?=
 =?utf-8?B?NjlZNitqN1BYSkUvNW5tOXoxZmhSMlZJa0ZTRThJeXMwYkVMN0UrQWI4UWFB?=
 =?utf-8?B?aGhpMzY3eHRWSVVOaTRUT3ZmekpMRnVCRWxGdjFGNjFTRDRua0JTTGhsUDRG?=
 =?utf-8?B?cUpjMC80NnVmbE9DTUx3RFhBL2xzbkpXZEJvRFY5bmk4cjVXNGxzazRGaGtV?=
 =?utf-8?B?SHpHVWRNWW9sbDJrRXh6RWtrZ2ZodGhzOW1wWm1DMXJiSGlwbFJxK3dzbFNQ?=
 =?utf-8?B?TVRxOUgxSmpMYmxZRXFNMG8wYUVkSXZCbVRxTUJsZkMyR3R0ZW5UcCs4RUJw?=
 =?utf-8?B?RGFtQytmZ012RFpyalJ6SXl5WkdpK2xqeGNaTFNnaHVPSE5RNUZyMDllbmIw?=
 =?utf-8?B?Y2lLWVFrbm9RRjMzNkpJdUlkd0lqdkN5OVJ1YWhBRSs0VnNXYyt4MEIyWVZN?=
 =?utf-8?B?cGUyU1YwcDJ1eTBHdDN5eUVHNWM2ck1XM1k2eVpnMjhZaVB2UmZZUjJsa2R6?=
 =?utf-8?B?YlhjZWFYRkdHbjlDOUU4TGVJdHg0cmhjK0pCdk1JU01GaWhMc1VIS1NkK1JI?=
 =?utf-8?B?eThsb1ZsKzlTRXpBcmFWMmdFYmd4SW91TEc4Sysva3hPVWZ6VEpLUnZKRCtE?=
 =?utf-8?B?eHZvTDdSRUZCYThkQ0dwTmUveHhHMm1OSEluc042OGM5aXFIRVRMemt1NXV3?=
 =?utf-8?B?LzdiR0RhNW5NSFVGbmNJRW5CbW1vUGt5ZHB1NUQyd1pSTEUxUzlaVkc4YzlN?=
 =?utf-8?B?WVV3ZlJZZWtIeXFSdWVKZWVKQmE5aFZZR3JXNGtIWFFRYnJsKzJISWxtaGtZ?=
 =?utf-8?B?S2ZlbU1ma2FZRGxud3FvMjh1ejRXNG4rVmNCM3pCUWkyZ3kvNzhra01NL3I3?=
 =?utf-8?B?RVo2SDRoUXZmUUlRSkpUUmt3QjVTT29SbGF6SWF1Nnhmb1Y3M25rV3ZMRjBi?=
 =?utf-8?B?MWM5L3B5d3hlOGlQU3dXRFVPU0Q2K1FlTXJqOWVyRTFhck45SzBESnVsZ2FO?=
 =?utf-8?B?RHp5V0syaWNjUnRpQ2k4VmZsb001cEM3T3RTRE5DZ2VaZU1ldkJxd2hnWWpS?=
 =?utf-8?B?ak8zUEdOM0ZyNE1mc0lsNnFYVWoxTXlpNGV0NVNDdFRGRWNtRzUzRzViaXM2?=
 =?utf-8?B?UllHY3lmN2JHajJzd3ZrSHAvYUxzV2JoWFB0NVo1cHI0RGV5N0h6U2hUd0xp?=
 =?utf-8?B?WGtkWGVlRjRpL0ZYRFppZ2kwTFc0aWVJd1VHMVJSNysvTkxrVkp5bVBXZm0z?=
 =?utf-8?B?TVMwbkN2aGFIdTVtdFlyTzY1SjhEeDdnVE90b3FhNFVFc3g3OE9EN1l2UTFi?=
 =?utf-8?B?cTJIdFVWQStYNnIrdm41ZUk3VDVjSWJVM3pxV1FRZGRaZGxabEVFa25oendz?=
 =?utf-8?B?M1hwSENsaWs2dE9GUEdoYzU5cXZmeThzOU1GOUJkV0Yyc0NZc3V4Snc0ckdH?=
 =?utf-8?B?Z2JOQXA0bWw3elR2cVE2dnNiVGtJNmpXaWkwV2c2MVNlazZ5RWt1NDJpbEVk?=
 =?utf-8?B?ZllDQnZuZ2VuNjYxcXBhRm1oeG1GdUlwVmErbGhKU21kR3pIdmgxTEN2eUNH?=
 =?utf-8?B?MXNJS3VZYnZDRXpFbC9QYzJnUnhvc0Z2UTBXV05RRUxjdkFpWEptRjdsc2lL?=
 =?utf-8?B?VyttcFA5VldqMGRoZTRBUWw4bFVydXpodDBVZU0wZHNmTXFSTDRHUFZpMWlw?=
 =?utf-8?B?bWlpelBGNzdNSDhTZnhXWEFwQWwwWFRqd2FwVlQ1V3BBRE9DY2syN1UvaWww?=
 =?utf-8?B?Q2lsekk3aTdPK1BsMWtXVjR2T3diZGloQjBHWGJ6YWF2RnNhZWZSQ3FxT0tu?=
 =?utf-8?B?SS9mRWlwNDVnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0pZZzJqZ2FjNGQ3NncrMzQ3TS9wbHJUczJBQklvbzFUczNnYlVlRUFSZTVF?=
 =?utf-8?B?M2l2cmdhbkhrMDV0NUluM3NMUUV0MTFHUDh1b2g1b2JqVVJja0lUajY2d1hz?=
 =?utf-8?B?eW01RHhpelpheWZCeUxmNEJnSEFjODVTaVV3ZWJnc3hnUllNRVNzand5Ujha?=
 =?utf-8?B?RGk2TFhzUkJYUFIydVE1dmVIb3BCNWZ5bUEwaDlyYlpLTnplTDRVK05GbGd3?=
 =?utf-8?B?RDZkenhYY0g2TmpwaVluclVGcUhBSVZveDZxY0ZTUVNuQytRNEZlUEFkK2hZ?=
 =?utf-8?B?RWwzYVVwdHFVdG50aUkyMUx6Qk8xbjJnM0x3aytYQ3poQ2tVd0VXcXJGTXc5?=
 =?utf-8?B?eGJIZTJzUTk2TlFDQ0xWV2JwRXdrOUk0M0ZwZ1ZzVFdNaFR2M0crZmxkRW4z?=
 =?utf-8?B?cGZWVE5BRytRdGJjNjhKZmI5NkJOeERJeU10TS9MYW84bFN2U2FUSFdmdGJD?=
 =?utf-8?B?VFlDNDFqNHA2cy92TGFrKzlSSGlGajFkQmhnYzd3a3Jjc3lCOGZ0QWZoS3BI?=
 =?utf-8?B?MHhXbEcrU0VoY3BPc3pjb1FLWWY1dmNDbFAwVnNWRVJtalBiRkcwZzdZYUI0?=
 =?utf-8?B?dmVrTjVoU3FMSWRPZWZzRnZQM01OR09NVlF3Q1lHcXB0VWhtaGJjVVRjUW9R?=
 =?utf-8?B?VHFDeGJwUlp2T0p2WXBlZzhpTnZINHZvMCtoSks4V2xBbVZpV1ZvUVZIbHZG?=
 =?utf-8?B?TWx0YWRWS2VNdWg3S1hpU0RvdnVhL1RJOXlOS1VPZ05kVFZWNlR1V0E0UHdL?=
 =?utf-8?B?M05kUkV6enJDelVYMjdEWGdFc1lNUWNlenBMYU4wZStXWmV1eVUzZFpOcFlp?=
 =?utf-8?B?MENXZUh3Y2ZBaEF3c0x2T0FSK0N6U1BWeTJHM1hOa3o1c05zYVNwY2RWYlNW?=
 =?utf-8?B?cGZoRlVWL3pFS0F5YlhsazVxWTdKZVlMclRoM0c1R1YwM2RaQmJYWXBxRWJk?=
 =?utf-8?B?ZkkrMUo3NFROdVVaWW5YYTZOOSs2Q21rYWpZVEpSTEVjVkhQdGtkSUhUVjhV?=
 =?utf-8?B?dzd4TW54dFlhbE00YXhGenF4R3EwdFp1Sjl5MTNPVXQ5MEhLZ0p3SC9vZmg3?=
 =?utf-8?B?ZUZJa3RMZityNGJadFMzKy9mZXUvSDJKV2JVUkF0R0k4alN6VWcxWGgydDNY?=
 =?utf-8?B?VVFXNTE2QUY2eGFZSHcrN29TY3pCblhSekE0ckkxdkRlMUlQQ1dYTlhVWlhj?=
 =?utf-8?B?NGUrR2xFbXltQ2VtR2hpSW45ZmlmS2c2eWtvQ1pYQzZMbHYyQ1VJbG0yU2Vl?=
 =?utf-8?B?Q05pUG4wZGV5aEE5QjVTNG10Z1VnUFN3U3UwVFIzYVNhbXB6L1YyenVqSWpk?=
 =?utf-8?B?cFIxVU5Jb1dFMGJwcm52NzF4NW1yN25YUktlK0sxa1g5YVhSTDFCb1d4aGtJ?=
 =?utf-8?B?MEhhN2hYOFBPUEE1NmFNdFdYa3diMThnWEFtSVZaNkRHY0xYTUVPVkR5MHp3?=
 =?utf-8?B?cG1oeUNVOGFlN2c1QjlqQVAwOVpiQWN1Um0ybnRMZzRPUG9vUlFNSnAveG1F?=
 =?utf-8?B?Ukx2ZjlmTEFRSis4cEMvZHVFK0xTa3Nia1hxenJIeWplWG02TVBLR1ozMTdw?=
 =?utf-8?B?Tys2RkRhc0oxMjVUQWlrYkt3WXZEaURTQ1N5YnBtckdWbStQSEg5S0pNSXhl?=
 =?utf-8?B?NnYwdFVLNXh0TnY3SEV5WFhqY3VKM2h0Q3d1c1F2RnljY20vc0JSSHF6a3hp?=
 =?utf-8?B?b2FDT2JoMjlXamVwN0h4RE9zMzNoaklDWTJheDNLSHpWNDFLbVJPSHpEQjZG?=
 =?utf-8?B?KzFDMmZ6UkJyN1ZaR0F2bG8xSG01TDBrbE91ckhGeDZiR3lHeEtqTS9OeUdt?=
 =?utf-8?B?cDhBSHVYS1d5MXJyeGJYbTJqckhMOU5ieW05WDduYWlHeTl3a25lZkNLTUtu?=
 =?utf-8?B?WU51Zk0xVHk1cjU4aWIzZjVHNWZaamRNcktuOHFyd2R2aFVHUEhaOW1XbGNJ?=
 =?utf-8?B?VWxxVjN5M0pWMXZsNHJZZzd2dHJNVHJQT3VFTjQvNFptTWx5Ymc4cS9OSXNm?=
 =?utf-8?B?ZDNlNTdzU3AxbHFSNGpiNGkrOEQzTVplNGpLVUp2cWhXM09DSGc4LzBCczkv?=
 =?utf-8?B?YjVKQ2ZOamlsY3BlMXlSTE9GTkFsQlliM2QxWFVIQUJURnZuT2tMcmJqQi9r?=
 =?utf-8?Q?pskU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0614ebbd-991c-4dee-5869-08dd7da45631
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 11:38:13.0393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vGmenxo+iOfJzqtF3/iqteSxDzTwJ64CLG+x18/WWCNSTJrhYeFqdQmgzXJ7tdLlNuyHCYO0YHofUkWUJ4Xonw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
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
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEphbmkgTmlrdWxhIDxqYW5pLm5p
a3VsYUBsaW51eC5pbnRlbC5jb20+DQpTZW50OiBUaHVyc2RheSwgQXByaWwgMTcsIDIwMjUgNTow
MCBQTQ0KVG86IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBL
aGF0cmksIFN1bmlsIDxTdW5pbC5LaGF0cmlAYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogRGV1Y2hlciwg
QWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgVHZydGtvIFVyc3VsaW4gPHR2
cnRrby51cnN1bGluQGlnYWxpYS5jb20+OyBQZWxsb3V4LVByYXllciwgUGllcnJlLUVyaWMgPFBp
ZXJyZS1lcmljLlBlbGxvdXgtcHJheWVyQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIHY2
IDEvNV0gZHJtOiBhZGQgbWFjcm8gZHJtX2ZpbGVfZXJyIHRvIHByaW50IHByb2Nlc3MgaW5mbw0K
DQpPbiBUaHUsIDE3IEFwciAyMDI1LCBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOg0KPiBBbSAxNy4wNC4yNSB1bSAxMzowNyBzY2hyaWViIEphbmkgTmlr
dWxhOg0KPj4gT24gVGh1LCAxNyBBcHIgMjAyNSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToNCj4+PiBBbSAxNy4wNC4yNSB1bSAxMTozNSBzY2hyaWVi
IEphbmkgTmlrdWxhOg0KPj4+PiBPbiBUaHUsIDE3IEFwciAyMDI1LCBTdW5pbCBLaGF0cmkgPHN1
bmlsLmtoYXRyaUBhbWQuY29tPiB3cm90ZToNCj4+Pj4+IEFkZCBhIGRybSBoZWxwZXIgbWFjcm8g
d2hpY2ggYXBwZW5kIHRoZSBwcm9jZXNzIGluZm9ybWF0aW9uIGZvcg0KPj4+Pj4gdGhlIGRybV9m
aWxlIG92ZXIgZHJtX2Vyci4NCj4+Pj4+DQo+Pj4+PiB2NTogY2hhbmdlIHRvIG1hY3JvIGZyb20g
ZnVuY3Rpb24gKENocmlzdGlhbiBLb2VuaWcpDQo+Pj4+PiAgICAgYWRkIGhlbHBlciBmdW5jdGlv
bnMgZm9yIGxvY2svdW5sb2NrIChDaHJpc3RpYW4gS29lbmlnKQ0KPj4+Pj4NCj4+Pj4+IHY2OiBy
ZW1vdmUgX19tYXliZV91bnVzZWQgYW5kIG1ha2UgZnVuY3Rpb24gaW5saW5lIChKYW5pIE5pa3Vs
YSkNCj4+Pj4+ICAgICByZW1vdmUgZHJtX3ByaW50LmgNCj4+Pj4gSSBndWVzcyBJIGdhdmUgYWxs
IGtpbmRzIG9mIGNvbW1lbnRzLCBidXQgaW4gdGhlIGVuZCBteSBjb25jbHVzaW9uIHdhczoNCj4+
Pj4gd2h5IGRvZXMgKmFueSogb2YgdGhpcyBoYXZlIHRvIGJlIHN0YXRpYyBpbmxpbmUgb3IgbWFj
cm9zPyBNYWtlDQo+Pj4+IGRybV9maWxlX2VycigpIGEgcmVndWxhciBmdW5jdGlvbiBhbmQgaGlk
ZSB0aGUgaW1wbGVtZW50YXRpb24NCj4+Pj4gaW5zaWRlIGRybV9maWxlLmMuIFRoYXQncyB0aGUg
Y2xlYW5lc3QgYXBwcm9hY2ggSU1PLg0KPj4+IFRoYXQgd29uJ3Qgd29yay4gVGhlIG1hY3JvIGlz
IG5lY2Vzc2FyeSB0byBjb25jYXRlbmF0ZSB0aGUgZm9ybWF0IHN0cmluZ3MuDQo+PiBJIHRoaW5r
IHlvdSBjYW4gaGFuZGxlIHRoZW0gdXNpbmcgc3RydWN0IHZhX2Zvcm1hdCBhbmQgJXBWLg0KPg0K
PiBPaCwgcmVhbGx5IGdvb2QgcG9pbnQhIEkgd2Fzbid0IGF3YXJlIHRoYXQgdGhpcyBmdW5jdGlv
bmFsaXR5IGV4aXN0cy4NCj4NCj4gR29pbmcgdG8gZGlzY3VzcyB0aGF0IHdpdGggU3VuaWwgaW50
ZXJuYWxseS4NCg0KUGxlYXNlIHNlZSB0aGUgY29tcGxldGVseSB1bnRlc3RlZCBwYXRjaCBiZWxv
dyBmb3IgYSBzdGFydGluZyBwb2ludC4NCg0KQlIsDQpKYW5pLg0KDQoNCg0KRnJvbSA1NTk2OGFi
MzM5NDY3YzViNmUxMmNlYjE1N2VjYmFmNjJlYWE2MDgyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQ0KRnJvbTogU3VuaWwgS2hhdHJpIDxzdW5pbC5raGF0cmlAYW1kLmNvbT4NCkRhdGU6IFRodSwg
MTcgQXByIDIwMjUgMTQ6NDM6NTEgKzA1MzANClN1YmplY3Q6IFtQQVRDSF0gZHJtOiBhZGQgbWFj
cm8gZHJtX2ZpbGVfZXJyIHRvIHByaW50IHByb2Nlc3MgaW5mbw0KT3JnYW5pemF0aW9uOiBJbnRl
bCBGaW5sYW5kIE95IC0gQklDIDAzNTc2MDYtNCAtIFdlc3RlbmRpbmthdHUgNywgMDIxNjAgRXNw
b28NCkNjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KDQpBZGQgYSBkcm0g
aGVscGVyIG1hY3JvIHdoaWNoIGFwcGVuZCB0aGUgcHJvY2VzcyBpbmZvcm1hdGlvbiBmb3IgdGhl
IGRybV9maWxlIG92ZXIgZHJtX2Vyci4NCg0KdjU6IGNoYW5nZSB0byBtYWNybyBmcm9tIGZ1bmN0
aW9uIChDaHJpc3RpYW4gS29lbmlnKQ0KICAgIGFkZCBoZWxwZXIgZnVuY3Rpb25zIGZvciBsb2Nr
L3VubG9jayAoQ2hyaXN0aWFuIEtvZW5pZykNCg0KdjY6IHJlbW92ZSBfX21heWJlX3VudXNlZCBh
bmQgbWFrZSBmdW5jdGlvbiBpbmxpbmUgKEphbmkgTmlrdWxhKQ0KICAgIHJlbW92ZSBkcm1fcHJp
bnQuaA0KDQpTaWduZWQtb2ZmLWJ5OiBTdW5pbCBLaGF0cmkgPHN1bmlsLmtoYXRyaUBhbWQuY29t
Pg0KU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCi0t
LQ0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysNCiBpbmNsdWRlL2RybS9kcm1fZmlsZS5oICAgICB8ICAzICsrKw0K
IDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9maWxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyBpbmRleCBj
Mjk5Y2Q5NGQzZjcuLmRlYTk1NGY1Nzg5MCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZmlsZS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYw0KQEAgLTEwMjUsMyAr
MTAyNSw0OCBAQCBzdHJ1Y3QgZmlsZSAqbW9ja19kcm1fZ2V0ZmlsZShzdHJ1Y3QgZHJtX21pbm9y
ICptaW5vciwgdW5zaWduZWQgaW50IGZsYWdzKQ0KICAgICAgICByZXR1cm4gZmlsZTsNCiB9DQog
RVhQT1JUX1NZTUJPTF9GT1JfVEVTVFNfT05MWShtb2NrX2RybV9nZXRmaWxlKTsNCisNCitzdGF0
aWMgc3RydWN0IHRhc2tfc3RydWN0ICpkcm1fdGFza19sb2NrKHN0cnVjdCBkcm1fZmlsZSAqZmls
ZV9wcml2KSB7DQorICAgICAgIHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzazsNCisgICAgICAgc3Ry
dWN0IHBpZCAqcGlkOw0KKw0KKyAgICAgICBtdXRleF9sb2NrKCZmaWxlX3ByaXYtPmNsaWVudF9u
YW1lX2xvY2spOw0KKyAgICAgICByY3VfcmVhZF9sb2NrKCk7DQorICAgICAgIHBpZCA9IHJjdV9k
ZXJlZmVyZW5jZShmaWxlX3ByaXYtPnBpZCk7DQorICAgICAgIHRhc2sgPSBwaWRfdGFzayhwaWQs
IFBJRFRZUEVfVEdJRCk7DQorDQorICAgICAgIHJldHVybiB0YXNrOw0KK30NCisNCitzdGF0aWMg
dm9pZCBkcm1fdGFza191bmxvY2soc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpIHsNCisgICAg
ICAgcmN1X3JlYWRfdW5sb2NrKCk7DQorICAgICAgIG11dGV4X3VubG9jaygmZmlsZV9wcml2LT5j
bGllbnRfbmFtZV9sb2NrKTsNCit9DQorLyoqDQorICogZHJtX2ZpbGVfZXJyIC0gRmlsbCBpbmZv
IHN0cmluZyB3aXRoIHByb2Nlc3MgbmFtZSBhbmQgcGlkDQorICogQGZpbGVfcHJpdjogY29udGV4
dCBvZiBpbnRlcmVzdCBmb3IgcHJvY2VzcyBuYW1lIGFuZCBwaWQNCisgKiBAZm9ybWF0OiBwcmlu
dGYoKSBsaWtlIGZvcm1hdCBzdHJpbmcNCisgKg0KKyAqIFRoaXMgdXBkYXRlIHRoZSB1c2VyIHBy
b3ZpZGVkIGJ1ZmZlciB3aXRoIHByb2Nlc3MNCisgKiBuYW1lIGFuZCBwaWQgaW5mb3JtYXRpb24g
Zm9yIEBmaWxlX3ByaXYgICovIHZvaWQgZHJtX2ZpbGVfZXJyKHN0cnVjdA0KK2RybV9maWxlICpm
aWxlX3ByaXYsIGNvbnN0IGNoYXIgKmZvcm1hdCwgLi4uKSB7DQorICAgICAgIHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYgPSBmaWxlX3ByaXYtPm1pbm9yLT5kZXY7DQorICAgICAgIHN0cnVjdCB0YXNr
X3N0cnVjdCAqdGFzazsNCisgICAgICAgc3RydWN0IHZhX2Zvcm1hdCB2YWY7DQorICAgICAgIHZh
X2xpc3QgYXJnczsNCisNCisgICAgICAgdmFfc3RhcnQoYXJncywgZm9ybWF0KTsNCisgICAgICAg
dmFmLmZtdCA9IGZvcm1hdDsNCisgICAgICAgdmFmLnZhID0gJmFyZ3M7DQorDQorICAgICAgIHRh
c2sgPSBkcm1fdGFza19sb2NrKGZpbGVfcHJpdik7DQorICAgICAgIGRybV9lcnIoZGV2LCAiY29t
bTogJXMgcGlkOiAlZCBjbGllbnQ6ICVzICVwViIsDQorICAgICAgICAgICAgICAgdGFzayA/IHRh
c2stPmNvbW0gOiAiIiwgdGFzayA/IHRhc2stPnBpZCA6IDAsDQorICAgICAgICAgICAgICAgZmls
ZV9wcml2LT5jbGllbnRfbmFtZSA/OiAiVW5zZXQiLCAmdmFmKTsNCisgICAgICAgZHJtX3Rhc2tf
dW5sb2NrKGZpbGVfcHJpdik7DQorfQ0KK0VYUE9SVF9TWU1CT0woZHJtX2ZpbGVfZXJyKTsNCg0K
SSBtYWRlIHRoaXMgY2hhbmdlIG9ubHkgYW5kIHZhbGlkYXRpbmcgaXQuIFRoYW5rcyBhIGxvdCBm
b3Igc3VnZ2VzdGluZyBpdC4gV291bGQgYmUgZ3JlYXQgaWYgaXQgd29ya3MgYXMgaW50ZW5kZWQg
YW5kIGFzIHdlIG5lZWQgaXQuDQoNClJlZ2FyZHMNClN1bmlsIEtoYXRyaQ0KDQpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaCBiL2luY2x1ZGUvZHJtL2RybV9maWxlLmggaW5kZXgg
OTRkMzY1YjIyNTA1Li5jZWIwOGE2N2YwYjcgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2RybS9kcm1f
ZmlsZS5oDQorKysgYi9pbmNsdWRlL2RybS9kcm1fZmlsZS5oDQpAQCAtNDQ2LDYgKzQ0Niw5IEBA
IHN0YXRpYyBpbmxpbmUgYm9vbCBkcm1faXNfYWNjZWxfY2xpZW50KGNvbnN0IHN0cnVjdCBkcm1f
ZmlsZSAqZmlsZV9wcml2KQ0KICAgICAgICByZXR1cm4gZmlsZV9wcml2LT5taW5vci0+dHlwZSA9
PSBEUk1fTUlOT1JfQUNDRUw7ICB9DQoNCitfX3ByaW50ZigyLCAzKQ0KK3ZvaWQgZHJtX2ZpbGVf
ZXJyKHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LCBjb25zdCBjaGFyICpmb3JtYXQsIC4uLik7
DQorDQogdm9pZCBkcm1fZmlsZV91cGRhdGVfcGlkKHN0cnVjdCBkcm1fZmlsZSAqKTsNCg0KIHN0
cnVjdCBkcm1fbWlub3IgKmRybV9taW5vcl9hY3F1aXJlKHN0cnVjdCB4YXJyYXkgKm1pbm9yc194
YSwgdW5zaWduZWQgaW50IG1pbm9yX2lkKTsNCi0tDQoyLjM5LjUNCg0KDQoNCg0KLS0NCkphbmkg
TmlrdWxhLCBJbnRlbA0K
