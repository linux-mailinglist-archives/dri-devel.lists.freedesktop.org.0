Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5C38D1A6B
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DED610FE97;
	Tue, 28 May 2024 11:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FpIMn57m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2043.outbound.protection.outlook.com [40.107.93.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B73B10E1F3;
 Tue, 28 May 2024 08:40:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=drgI9932U8Hnin5tvfkW3Bcsy7mBTI8DEpIWzqP2Mc8d/phl0dnrPkuMX4tmzvV7lY0WuHBAyAjQIqRnQ5dZ1NrgeHLmDc+p06hrPRcUVRnM/oOG/xaa3DGr9DrMq3nQjUmeyk3uC73tuVoMKPaYD8zmzRlaI+wvQ0rpVvv377MPGMT99poYmSJwPtFd+Ze4W3MRthcaurlsbJ7SKIBFybCrQGVD+WQaS3kW3aMfpL+LTl/NiiDjQCXipSISfd2JxoO5+RWd62ygPweg8DR2W0wjOTCO+tI8lw2hJ79vWBlzp30Xm6gdI6UwnpDUa7mHLS5ag8CzE/7l+dDFv7FfyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sXgUTEdzC9uohZA/AhbUACzvTmHSCYf5GkU1Q4t/wVg=;
 b=OkAMgX8ul3D3s8M/WFtTUb5TbIGX1x/uc3AJ5X0bqv8kd8UQIkQVC2E92vdIWZYGg/8Iurbv5joM9Ht0h/PCr0p/Lgzj1aX+Djx9t7kXwYIsw6zd7jnF/IziuP7FXXf+9UJYSbJiSsrf9g6Ag5lCCju4tTcgFkx9h9PHp5UwJI7iG7urBFIZrH62RDULLu15OUku+JbpHwFv15WiGWS6G2pDvrQgId6EjRoQ47mcQucOjLmPUVNv5ibO95D1X1ONIdIFu/7yEHeQm7ZgCzGA88+Y4mS1NCSpbxaJ0SkvPUHJZ0ElKrKE+2ldqdQOcMFOQHSNzYjwowrGCLh7m+CaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sXgUTEdzC9uohZA/AhbUACzvTmHSCYf5GkU1Q4t/wVg=;
 b=FpIMn57mzRwP4uGeyWa6X+hIWkVzKeEvFy8dxfbBpLVTng1xFTKqQY5PsUNfR1LTpy60Y4gWwIPm0d9PUIml93a5YCULvz2N5uSKf36e5eeaHv9Lzogil6Q3vrm1IG9EavvgAgkzUDg7LCh4VK2k5+ScQ5ll/LddD+Spgzy1xhgwcifftZBtTIZnA9lRp3lavLUd7cpintWO1vuA5PqpGinfM4PvIgp/8HFhgrV93tJahr584CMJ2ZYnsxRi5U/GYo7Q2C+FB1fD7mfO0ohcHFc7gDe6tEGn1HogwL//VjnjRL9sztjNxarITVBABGwqOdPrD0P7E8j3MDmBME8VYg==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by BY5PR12MB4163.namprd12.prod.outlook.com (2603:10b6:a03:202::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 08:40:20 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%5]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 08:40:20 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "ojeda@kernel.org" <ojeda@kernel.org>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "wedsonaf@gmail.com"
 <wedsonaf@gmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "benno.lossin@proton.me"
 <benno.lossin@proton.me>, "a.hindborg@samsung.com" <a.hindborg@samsung.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "fujita.tomonori@gmail.com"
 <fujita.tomonori@gmail.com>, "lina@asahilina.net" <lina@asahilina.net>,
 "pstanner@redhat.com" <pstanner@redhat.com>, "ajanulgu@redhat.com"
 <ajanulgu@redhat.com>, "lyude@redhat.com" <lyude@redhat.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [RFC PATCH 7/8] rust: add firmware abstractions
Thread-Topic: [RFC PATCH 7/8] rust: add firmware abstractions
Thread-Index: AQHasGq9PdWC/vvfakyx3/WUuSONP7GsVISA
Date: Tue, 28 May 2024 08:40:20 +0000
Message-ID: <fd5dbd42-24b7-422b-bc0b-393347b3fdca@nvidia.com>
References: <20240520172059.181256-1-dakr@redhat.com>
 <20240520172422.181763-4-dakr@redhat.com>
 <20240521083231.000074c2.zhiw@nvidia.com>
 <ZlTcnYNff2EDQJdj@pollux.localdomain>
In-Reply-To: <ZlTcnYNff2EDQJdj@pollux.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|BY5PR12MB4163:EE_
x-ms-office365-filtering-correlation-id: 2aabe9e3-a899-4115-db2c-08dc7ef1cede
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|1800799015|7416005|376005|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?Vmdlb09obXlIbDhaYkptQldzTGRXRFZjaHcyK3BJcHlNRHFEcTVUaG1ubEJr?=
 =?utf-8?B?QXM1MUpqQ2Zhd2JEMmsxZHNkVVp3RXRxUTZBMTF0Y2E1WnNnU0JZdk9KZzhn?=
 =?utf-8?B?dG9VOTFIdUhzaHgvM1M0MVRpTmZvVGdwb01JV3pZRHVHS3Y0dGI3YzlLQy84?=
 =?utf-8?B?ek9QeUk2TEZvSllObWY3dUI0alhGU3doOHVnV3o3eWRtYkNIODdEM3ZlN0hl?=
 =?utf-8?B?blVkUDZLVk9PVzBxTE1xWHB5Qk5JU0tDaFgyWnRhTVJKSVdycnRqekJ2YWpm?=
 =?utf-8?B?eWxLcTVuSytQRmZFbUxPZUpJbGtsT3dFL3NGcTkrNjZlT1dJcGpaelRRZm1j?=
 =?utf-8?B?UUlwNW0xU3FXeGpDSjJWS2Jjdm1vY2xhYXB1ZDBFdndieVorWERoeStqQWdi?=
 =?utf-8?B?RkFwWGtJcytYTHVmNTVCVy9CTVk2ejdybFFvUnpjZlFNNkVSRlpsYjFZU3lu?=
 =?utf-8?B?Z0hRejdBUEkybWRQOXc4cDZpdGY2b0F3OHVjdStIbytXK0VuYlpHazF2aUFp?=
 =?utf-8?B?T05jVWRjeENQREo5dmZKUUIyVFdIcE5RNVJKOEpQSXp6Q29VcUQ0aTdQNERj?=
 =?utf-8?B?S2gvODFLZERHVGg2YzBJazF3Y0FPY1gzYjJ3TTBMRm1vd0gwaS9xYkJZZGdj?=
 =?utf-8?B?dWZGL0xpT2pFdHUzajU3dGx1U3VYSXJDQ0FvV1VtVmxmeWRuc3c4WWVJSkhI?=
 =?utf-8?B?aTlPODJTS1RuY2RVNSsvSXp1VVIxWG5XOXgvWXNidWhySDRPeDhDcVVaRTk0?=
 =?utf-8?B?Vkx2bFczd0VaWjY1RXF6MUwwaHlzZlcyUGhLTHl4c2FwWGxjaTBhcjZYWEtB?=
 =?utf-8?B?TnU4QURwTkZFRWNYMVBDZWFQZk1scTYxN2gvY3U5Rk94ckFJN05ya0ZWNzQ3?=
 =?utf-8?B?UjBuRmhhOW9KSS9HWGFxUldJZVEwOERBRjM4TWhEb01aYjhYbnF2TUpQVkZZ?=
 =?utf-8?B?Rzc2V2l5RW4xVVJUZDJ3N0tRc1Z5bVJudFBjMGptVTdXeXVaZHNyRm8wdzlZ?=
 =?utf-8?B?WUFLdUdsRVltL3NaOENwR21xQStoNGl5cC9qbGk4WWhPbWFDbUwrVEdiYUtp?=
 =?utf-8?B?blRoN1Q1aFNPaXdhbDh3RVNQNE5lVDlFZWJ1SUtjTXYxVnRHQU1TVFk4UVgy?=
 =?utf-8?B?RnIzOG1RR2phcUE0TFlZdUJoNE5QR1BpQWpzejZwR1lTNkVJRTdwQzJma2I5?=
 =?utf-8?B?L2hrMis5UE5UYVNFS3c2dFR1Z1RjQ1RxTnB6YW0xZTRnMWpiZkNnODJkVUoz?=
 =?utf-8?B?ODlRcFYxdmxqU1FNa3hQNDdwdm9SaW43ZllnL2dJUWNJTUZKS0RYUDBtLzEy?=
 =?utf-8?B?Sk9TN3lhak1BQ1NGL045ZktuT0laamFNZ0w0YkJZR0pEZzh6V0NVTEpKc0lG?=
 =?utf-8?B?Q0RlaW13VVY0bVdnMUxPQ1d6WnBzQUxFN3VTWkZaMUVRZWR3akQxVDFjTWpB?=
 =?utf-8?B?U0EzNmlQc0FrZHNQeGovV3htZzFNbXBuQVpyZWd1ZXYwcXBORjFGallYSkFo?=
 =?utf-8?B?SVBXUWlJUEFJazJiVDFRc1c2WDJueHMyQzdncitWK1J0RGxoaGhiMGU2YUgw?=
 =?utf-8?B?cDE5T1k2YmE4dDlQQi92bHN3NWdZNW5tZFJUNWg3MXdpc2tGTzAyeFplUVp5?=
 =?utf-8?B?WkZUdkwyK2ZNNEkrNW1uWXdvUTBCVjNzcmgzb3NQSEE2KzNQd3BxUU53ZVpU?=
 =?utf-8?B?TVZCaXo5dmw3QVhaOEpLaGt1ME9VbzB3MURtYzhzWEtvaDdsejQ2dU0zcm5k?=
 =?utf-8?B?S1F0TlVuUTd2OXRHcVozam9DcjU0bkdkc25vb1lqc2ZSM3E2VzlVTmNsTllm?=
 =?utf-8?B?WVVkS1FoeDhQOHI5SWJVUT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005)(38070700009); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXpIY09kbzdxM1Z3dUFTN3FLWWRlNFdIUTRsWm9tVFVmOTdZOGNPWCtudGgv?=
 =?utf-8?B?TUpkbGRMZHUrcjhBa2EvYzdRZnpuaDFIcjVhSWhHZmEyYlMvSHI2NEpMZ0NP?=
 =?utf-8?B?WHJtOGV0Uno3QXpsRlpzZlgwV2VCalR1eGQwQ25obUl3TnRxdzFCOHZUQ0tW?=
 =?utf-8?B?dlk2U05LN09qMVRKTjR4eTBnUXFWbTdlRERBUU8wNEhRVTRzSGxVMHp6L2JV?=
 =?utf-8?B?OExVNWNsNzdiMktDekdvQmdnYnpMVzFTakM1QVdUSlRZRzRkSHhlQkZ4R0N2?=
 =?utf-8?B?QUw1dXlyOFVxdkZsOS9ZZWRxUEdSRUVabE9yUVFZNlFCSTEwSWJPR1pLVkt3?=
 =?utf-8?B?Yjk1b0YxclljOG15U1BmdzFaTC9HVDVKeGdyVjdDcEN0NkJsUmtsTWZ0SlA0?=
 =?utf-8?B?bjh2V25rZzlHVm9rSmhuSENJRTNlYktKanl1WDFkWVVRMXB6OFlXeHhQeG1J?=
 =?utf-8?B?a0ZFalFmNnlGdHZhMGg4clZQQzdad1ZQc1FoeU9MdldHK3Fwd1hZQW5XNXE3?=
 =?utf-8?B?OVdBRm95dktiUVRZVHVpQWhyUWhvTnYxMG0yN2lrM2NGTm03cGtodXlwMFRG?=
 =?utf-8?B?MERzc0ZUQkpVSVVFZTRHdm5iTUt6UytZMmdHUWVSQk5oLy9KUlpFSDFHbklk?=
 =?utf-8?B?S01XRlRmUEVKdVVRMEoyVDIxd2xETWlNc1pDNVRYU3BNa2JVQjRKYVVJTmhE?=
 =?utf-8?B?aGVFZjU3L3UyNHBsVXlTa1RnczNFU1BocEJBM3M3QjdaRTgzeFgxd29keUd1?=
 =?utf-8?B?Y2xNaUd3ZG9ncHFNQ3ZjanVpVzZ0VmtUN0s1blEwd1gzTFlzNksvbmY2Y2E4?=
 =?utf-8?B?ck1wMkJIbHhzcjVMd1NsRzBlU2pQSTJwMzlQVk1HVTd1NW5jNklqbTdGQkRL?=
 =?utf-8?B?RUVlNVRwSVVLVy9VRlE3ZFlpSGJUWGVNWTNOT2JVY3RYeis4V0JvOStJVUt3?=
 =?utf-8?B?RkJqVkdKM0NVZXJaQVdhbitlTjhMU2NYOTVRb3hBeDRMbndDc2o0VWFrbnB4?=
 =?utf-8?B?TzNaZ21NdzBxUkpPS1g0MFE5K3ZvMUxyNG9rYklHSVM1ZTVkdTc3aU9xTEtT?=
 =?utf-8?B?SDFTeFpBS0ZmTlNoOG5EQlVQcFdTejBEOWJaVzBHbDhlZzBLS2Z6cm1tbGtU?=
 =?utf-8?B?SmkyMTc4YUhSdndSc1I4QzZRb3EzOTZxTDVHeWFZU1hqdS9vZmh2eDlIZ01O?=
 =?utf-8?B?N2JjUm5uQUNraDRucEVGN0xTRWo1VSt5WVlSTjFuS1VObVJXOHNCbFpXM2RR?=
 =?utf-8?B?ZmxvbFE0Ympzc05La2lPcmROWitoQWRoemY0WkZwRCtoR2xqS1BseTE1b0pk?=
 =?utf-8?B?QWM3bCtBL3MrTno0SUV4ckkwKzdkUlFib3NTdVZ1VU9RcUxBY2tzS1B5Z2Z4?=
 =?utf-8?B?SGNqY2xYUGlJeTBYSmtGUi8ySEZrQ2JOaUtHelpRek9yMDhIS3VCMjFIZzZJ?=
 =?utf-8?B?WUE0dndQRlFRc3NiaUNnbFdHdlVYVlpyY0tVOHNBdHB6QTBMM29ZTXQrb0My?=
 =?utf-8?B?SitEMmo3TTEzWFFLaHpXMmtzRFI5MEFXUEJQWUZJQ00wbmxmUjRCT29TZmxr?=
 =?utf-8?B?UUJqcDdlNWpGbkFDbStMT3pYeVlFWVoyU2h2bzlZWHFzRHliODFqOUkyUUVZ?=
 =?utf-8?B?SXI2OTNTRU4waXlQTHgxemNCb1hlMmsrM2oweXFnYnVZQlh0dm1ZZ2NzQS9H?=
 =?utf-8?B?am9oK1dxRDBmVHpZdkM2TjZrUjNWM2prcEtrL1llN0d2cnBTbktMK3UzOC9L?=
 =?utf-8?B?TGtxaG1BVmhsZDZpY1Uwa2d4S0tLN1BPSlpaMTYrMjNnL3hhcm5kOVBMWEhs?=
 =?utf-8?B?Tkx5UjhVUHFRcFV1TVM5LzhHRmRkcHVyZnBSdmxTNlJzNVoxaDd1WDVId3V6?=
 =?utf-8?B?RWxpOUE2WWVBTFpuQnJNMnFkU2ZudkY0aTBEZkdFNWlNWE16VUpyNFFzbWxZ?=
 =?utf-8?B?SHJXQkhieHoxUHAyLzJEOW1yZ25uYnhLL0ZwYy92V0dkYTVWeTVzNENVMWV1?=
 =?utf-8?B?aWFIUnlnZVRNRy9POFllUFp2c0tMak03RkpseEFpTnUwUDh0KzVBcXhCMUFp?=
 =?utf-8?B?MTNCUDBXMVFKa3MyQlh1NGdSS3ZHek9HV010bXFGQUxlNDBDbW1EdTJzNEFw?=
 =?utf-8?Q?vt9o=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E50486CE3CC7DC4CA91099FB97E29B7A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aabe9e3-a899-4115-db2c-08dc7ef1cede
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 08:40:20.2648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iyY5kenTiiOQNYT+8rkuZFNqgvzlarCXoJsVVyxnz4Fp9vTQl77UZkIzDHiF/fBF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4163
X-Mailman-Approved-At: Tue, 28 May 2024 11:57:27 +0000
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

T24gMjcvMDUvMjAyNCAyMi4xOCwgRGFuaWxvIEtydW1tcmljaCB3cm90ZToNCj4gRXh0ZXJuYWwg
ZW1haWw6IFVzZSBjYXV0aW9uIG9wZW5pbmcgbGlua3Mgb3IgYXR0YWNobWVudHMNCj4gDQo+IA0K
PiBPbiBUdWUsIE1heSAyMSwgMjAyNCBhdCAwODozMjozMUFNICswMzAwLCBaaGkgV2FuZyB3cm90
ZToNCj4+IE9uIE1vbiwgMjAgTWF5IDIwMjQgMTk6MjQ6MTkgKzAyMDANCj4+IERhbmlsbyBLcnVt
bXJpY2ggPGRha3JAcmVkaGF0LmNvbT4gd3JvdGU6DQo+Pg0KPj4+IEFkZCBhbiBhYnN0cmFjdGlv
biBhcm91bmQgdGhlIGtlcm5lbHMgZmlybXdhcmUgQVBJIHRvIHJlcXVlc3QgZmlybXdhcmUNCj4+
PiBpbWFnZXMuIFRoZSBhYnN0cmFjdGlvbiBwcm92aWRlcyBmdW5jdGlvbnMgdG8gYWNjZXNzIHRo
ZSBmaXJtd2FyZQ0KPj4+IGJ1ZmZlciBhbmQgLyBvciBjb3B5IGl0IHRvIGEgbmV3IGJ1ZmZlciBh
bGxvY2F0ZWQgd2l0aCBhIGdpdmVuDQo+Pj4gYWxsb2NhdG9yIGJhY2tlbmQuDQo+Pj4NCj4+DQo+
PiBXYXMgcGxheWluZyB3aXRoIGZpcm13YXJlIGV4dHJhY3Rpb25zIGJhc2VkIG9uIHRoaXMgcGF0
Y2guDQo+PiBVbmZvcnR1bmF0ZWx5IEkgZW5kZWQgdXAgd2l0aCBhIGxvdCBvZiBwb2ludGVyIG9w
ZXJhdGlvbnMsIHVuc2FmZQ0KPj4gc3RhdGVtZW50cy4NCj4+DQo+PiBBcyB3ZSBrbm93IG1hbnkg
dmVuZG9ycyBoYXZlIGEgQyBoZWFkZXJzIGZvciB0aGUgZGVmaW5pdGlvbnMgb2YgdGhlDQo+PiBm
aXJ3bWFyZSBjb250ZW50LCB0aGUgZHJpdmVyIGV4dHJhY3QgdGhlIGRhdGEgYnkgYXBwbHlpbmcg
YSBzdHJ1Y3QNCj4+IHBvaW50ZXIgb24gaXQuDQo+Pg0KPj4gQnV0IGluIHJ1c3QsIEkgZmVlbCBp
dCB3b3VsZCBuaWNlIHRoYXQgd2UgY2FuIGFsc28gaGF2ZSBhIGNvbW1vbg0KPj4gZmlybXdhcmUg
ZXh0cmFjdG9yIGZvciBkcml2ZXJzLCB0aGF0IGNhbiB3cmFwIHRoZSBwb2ludGVyIG9wZXJhdGlv
bnMsDQo+PiB0YWtlIGEgbGlzdCBvZiB0aGUgZmlybXdhcmUgc3RydWN0IG1lbWJlcnMgdGhhdCBj
b252ZXJ0ZWQgZnJvbSBDIGhlYWRlcnMNCj4+IGFzIHRoZSBpbnB1dCwgb2ZmZXIgdGhlIGRyaXZl
ciBzb21lIGNvbW1vbiBBQkkgbWV0aG9kcyB0byBxdWVyeSB0aGVtLg0KPj4gTWF5YmUgdGhhdCB3
b3VsZCBlYXNlIHRoZSBwYWluIGEgbG90Lg0KPiANCj4gU28sIHlvdSBtZWFuIHNvbWUgYWJzdHJh
Y3Rpb24gdGhhdCB0YWtlcyBhIGxpc3Qgb2YgdHlwZXMsIG9mZnNldHMgaW4gdGhlDQo+IGZpcm13
YXJlIGFuZCBhIHJlZmVyZW5jZSB0byB0aGUgZmlybXdhcmUgaXRzZWxmIGFuZCBwcm92aWRlcyBy
ZWZlcmVuY2VzIHRvIHRoZQ0KPiBjb3JyZXNwb25kaW5nIG9iamVjdHM/DQo+IA0KPiBJIGFncmVl
IGl0IG1pZ2h0IGJlIGhlbHBmdWwgdG8gaGF2ZSBzb21lIGNvbW1vbiBpbmZyYXN0cnVjdHVyZSBm
b3IgdGhpcywgYnV0IHRoZQ0KPiBvcGVyYXRpb25zIG9uIGl0IHdvdWxkIHN0aWxsIGJlIHVuc2Fm
ZSwgc2luY2UgdWx0aW1hdGVseSBpdCBpbnZvbHZlcw0KPiBkZXJlZmVyZW5jaW5nIHBvaW50ZXJz
Lg0KPiANCg0KSSB0aGluayB0aGUgZ29hbCBpcyB0byAxKSBjb25jZW50cmF0ZSB0aGUgInVuc2Fm
ZSIgb3BlcmF0aW9ucyBpbiBhIA0KYWJzdHJhY3Rpb24gc28gdGhlIGRyaXZlciBkb2Vzbid0IGhh
dmUgdG8gd3JpdGUgZXhwbGFuYXRpb24gb2YgdW5zYWZlIA0Kb3BlcmF0aW9ucyBoZXJlIGFuZCB0
aGVyZSwgaW1wcm92ZSB0aGUgcmVhZGFiaWxpdHkgb2YgdGhlIGRyaXZlciB0aGF0IA0KaW50ZXJh
Y3RzIHdpdGggdmVuZG9yLWZpcm13YXJlIGJ1ZmZlci4gMikgZWFzZSB0aGUgZHJpdmVyIG1haW50
ZW5hbmNlIA0KYnVyZGVuLg0KDQpTb21lIHNvbHV0aW9ucyBJIHNhdyBpbiBkaWZmZXJlbnQgcHJv
amVjdHMgd3JpdHRlbiBpbiBydXN0IGZvciANCmRlLXJlZmVyZW5jaW5nIGEgcGVyLWRlZmluZWQg
c3RydWN0Og0KDQoxKSBUYWtlIHRoZSB2ZW5kb3IgZmlybXdhcmUgYnVmZmVyIGFzIGEgd2hvbGUs
IGludmVudCBtZXRob2RzIGxpa2UgDQpyZWFkL3dyaXRlIHdpdGggb2Zmc2V0IGZvciBvcGVyYXRp
bmcgdGhlIGJ1ZmZlci4NCg0KSW4gdGhpcyBzY2hlbWUsIHRoZSBkcml2ZXIgaXMgcmVzcG9uc2li
bGUgZm9yIHRha2luZyBjYXJlIG9mIGVhY2ggZGF0YSANCm1lbWJlciBpbiBhIHZlbmRvciBmaXJt
d2FyZSBzdHJ1Y3QgYW5kIGFsc28gaXRzIHZhbGlkIG9mZnNldC4gVGhlIA0KYWJzdHJhY3Rpb24g
b25seSBjb3ZlcnMgdGhlIGJvdW5kYXJ5IG9mIHRoZSB3aG9sZSBmaXJtd2FyZSBidWZmZXIuDQoN
ClRoZSBjb25zIGlzIHRoZSByZWFkYWJpbGl0eSBvZiB0aGUgb3BlcmF0aW9uIG9mIHRoZSB2ZW5k
b3IgZmlybXdhcmUgDQpidWZmZXIgaW4gdGhlIGRyaXZlciBpcyBub3QgZ29vZCBjb21wYXJpbmcg
d2l0aCBDIGNvZGUuDQoNCkhhdGUgdG8gdGhpbmsgYSBsb3Qgb2YgeHh4ID0gdmVuZG9yX2Zpcm13
YXJlX3N0cnVjdC5yZWFkKG9mZnNldCk7IC8vIA0KcmVhZGluZyBpdGVtIEEgaW4gdGhlIGNvZGUu
DQoNCjIpIERlZmluZSB0aGUgZmlybXdhcmUgc3RydWN0IGluIHJ1c3QgKG1pZ2h0IG5lZWQgdG8g
ZmluZCBhIGJldHRlciB3YXkgDQp0byBoYW5kbGUgInVuaW9uIiBpbiB0aGUgZGVmaW5pdGlvbiBv
ZiB0aGUgdmVuZG9yIGZpcm13YXJlIHN0cnVjdCkuIFVzZSANCm1hY3JvcyB0byBnZW5lcmF0ZSBt
ZXRob2RzIG9mIGFjY2Vzc2luZyBlYWNoIGRhdGEgbWVtYmVyIGZvciB0aGUgdmVuZG9yIA0KZmly
bXdhcmUgc3RydWN0Lg0KDQpUaGVuIHRoZSBjb2RlIGluIHRoZSBkcml2ZXIgd2lsbCBiZSBsaWtl
IHh4eCA9IA0KdmVuZG9yX2Zpcm13YXJlX3N0cnVjdC5pdGVtX2EoKTsgaW4gdGhlIGRyaXZlci4N
Cg0KSW4gdGhpcyBzY2hlbWUsIHRoZSBhYnN0cmFjdGlvbiBhbmQgdGhlIGdlbmVyYXRlZCBtZXRo
b2RzIGNvdmVycyB0aGUgDQpib3VuZGFyeSBjaGVjay4gVGhlICJ1bnNhZmUiIHN0YXRlbWVudCBj
YW4gc3RheSBpbiB0aGUgZ2VuZXJhdGVkIA0Kc3RydWN0LWFjY2VzcyBtZXRob2RzLg0KDQpUaGlz
IG1pZ2h0IGV2ZW4gYmUgaW1wbGVtZW50ZWQgYXMgYSBtb3JlIGdlbmVyaWMgcnVzdCBmZWF0dXJl
IGluIHRoZSBrZXJuZWwuDQoNClRoZSBjb25zIGlzIHN0aWxsIHRoZSBkcml2ZXIgbWlnaHQgbmVl
ZCB0byBzeW5jIGJldHdlZW4gdGhlIEMtdmVyc2lvbiANCmRlZmluaXRpb24gYW5kIHJ1c3QtdmVy
c2lvbiBkZWZpbml0aW9uLg0KDQozKSBBbHNvIHJlLXVzaW5nIEMgYmluZGluZ3MgZ2VuZXJhdGlv
biBpbiB0aGUga2VybmVsIGNhbWUgdG8gbXkgbWluZCANCndoZW4gdGhpbmtpbmcgb2YgdGhpcyBw
cm9ibGVtLCBzaW5jZSBpdCBhbGxvd3MgdGhlIHJ1c3QgY29kZSB0byBhY2Nlc3MgDQp0aGUgQyBz
dHJ1Y3QsIGJ1dCB0aGV5IGRvbid0IGhhdmUgdGhlIGJvdW5kYXJ5IGNoZWNrLiBTdGlsbCBuZWVk
IGFub3RoZXIgDQpsYXllci9tYWNyb3MgdG8gd3JhcCBpdC4NCg0KDQo+Pg0KPj4gVGhhbmtzLA0K
Pj4gWmhpLg0KPj4NCj4+PiBUaGUgZmlybXdhcmUgaXMgcmVsZWFzZWQgb25jZSB0aGUgYWJzdHJh
Y3Rpb24gaXMgZHJvcHBlZC4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IERhbmlsbyBLcnVtbXJp
Y2ggPGRha3JAcmVkaGF0LmNvbT4NCj4+PiAtLS0NCj4+PiAgIHJ1c3QvYmluZGluZ3MvYmluZGlu
Z3NfaGVscGVyLmggfCAgMSArDQo+Pj4gICBydXN0L2tlcm5lbC9maXJtd2FyZS5ycyAgICAgICAg
IHwgNzQNCj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysgcnVzdC9rZXJuZWwv
bGliLnJzICAgICAgICAgICAgICB8DQo+Pj4gMSArIDMgZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0
aW9ucygrKQ0KPj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHJ1c3Qva2VybmVsL2Zpcm13YXJlLnJz
DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvcnVzdC9iaW5kaW5ncy9iaW5kaW5nc19oZWxwZXIuaA0K
Pj4+IGIvcnVzdC9iaW5kaW5ncy9iaW5kaW5nc19oZWxwZXIuaCBpbmRleCBiMjQ1ZGI4ZDVhODcu
LmU0ZmZjNDdkYTVlYw0KPj4+IDEwMDY0NCAtLS0gYS9ydXN0L2JpbmRpbmdzL2JpbmRpbmdzX2hl
bHBlci5oDQo+Pj4gKysrIGIvcnVzdC9iaW5kaW5ncy9iaW5kaW5nc19oZWxwZXIuaA0KPj4+IEBA
IC0xNCw2ICsxNCw3IEBADQo+Pj4gICAjaW5jbHVkZSA8a3VuaXQvdGVzdC5oPg0KPj4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L2Vycm5hbWUuaD4NCj4+PiAgICNpbmNsdWRlIDxsaW51eC9ldGh0b29sLmg+
DQo+Pj4gKyNpbmNsdWRlIDxsaW51eC9maXJtd2FyZS5oPg0KPj4+ICAgI2luY2x1ZGUgPGxpbnV4
L2ppZmZpZXMuaD4NCj4+PiAgICNpbmNsdWRlIDxsaW51eC9tZGlvLmg+DQo+Pj4gICAjaW5jbHVk
ZSA8bGludXgvcGNpLmg+DQo+Pj4gZGlmZiAtLWdpdCBhL3J1c3Qva2VybmVsL2Zpcm13YXJlLnJz
IGIvcnVzdC9rZXJuZWwvZmlybXdhcmUucnMNCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4+
IGluZGV4IDAwMDAwMDAwMDAwMC4uNzAwNTA0ZmIzYzljDQo+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+
ICsrKyBiL3J1c3Qva2VybmVsL2Zpcm13YXJlLnJzDQo+Pj4gQEAgLTAsMCArMSw3NCBAQA0KPj4+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPj4+ICsNCj4+PiArLy8hIEZp
cm13YXJlIGFic3RyYWN0aW9uDQo+Pj4gKy8vIQ0KPj4+ICsvLyEgQyBoZWFkZXI6DQo+Pj4gW2Bp
bmNsdWRlL2xpbnV4L2Zpcm13YXJlLmhgXSguLi8uLi8uLi8uLi9pbmNsdWRlL2xpbnV4L2Zpcm13
YXJlLmgiKSArDQo+Pj4gK3VzZSBjcmF0ZTo6e2JpbmRpbmdzLCBkZXZpY2U6OkRldmljZSwgZXJy
b3I6OkVycm9yLCBlcnJvcjo6UmVzdWx0LA0KPj4+IHN0cjo6Q1N0ciwgdHlwZXM6Ok9wYXF1ZX07
ICsNCj4+PiArLy8vIEFic3RyYWN0aW9uIGFyb3VuZCBhIEMgZmlybXdhcmUgc3RydWN0Lg0KPj4+
ICsvLy8NCj4+PiArLy8vIFRoaXMgaXMgYSBzaW1wbGUgYWJzdHJhY3Rpb24gYXJvdW5kIHRoZSBD
IGZpcm13YXJlIEFQSS4gSnVzdA0KPj4+IGxpa2Ugd2l0aCB0aGUgQyBBUEksIGZpcm13YXJlIGNh
biArLy8vIGJlIHJlcXVlc3RlZC4gT25jZSByZXF1ZXN0ZWQNCj4+PiB0aGUgYWJzdHJhY3Rpb24g
cHJvdmlkZXMgZGlyZWN0IGFjY2VzcyB0byB0aGUgZmlybXdhcmUgYnVmZmVyIGFzICsvLy8NCj4+
PiBgJlt1OF1gLiBBbHRlcm5hdGl2ZWx5LCB0aGUgZmlybXdhcmUgY2FuIGJlIGNvcGllZCB0byBh
IG5ldyBidWZmZXINCj4+PiB1c2luZyBgRmlybXdhcmU6OmNvcHlgLiBUaGUgKy8vLyBmaXJtd2Fy
ZSBpcyByZWxlYXNlZCBvbmNlDQo+Pj4gW2BGaXJtd2FyZWBdIGlzIGRyb3BwZWQuICsvLy8gKy8v
LyAjIEV4YW1wbGVzDQo+Pj4gKy8vLw0KPj4+ICsvLy8gYGBgDQo+Pj4gKy8vLyBsZXQgZncgPSBG
aXJtd2FyZTo6cmVxdWVzdCgicGF0aC90by9maXJtd2FyZS5iaW4iLA0KPj4+IGRldi5hc19yZWYo
KSk/OyArLy8vIGRyaXZlcl9sb2FkX2Zpcm13YXJlKGZ3LmRhdGEoKSk7DQo+Pj4gKy8vLyBgYGAN
Cj4+PiArcHViIHN0cnVjdCBGaXJtd2FyZShPcGFxdWU8KmNvbnN0IGJpbmRpbmdzOjpmaXJtd2Fy
ZT4pOw0KPj4+ICsNCj4+PiAraW1wbCBGaXJtd2FyZSB7DQo+Pj4gKyAgICAvLy8gU2VuZCBhIGZp
cm13YXJlIHJlcXVlc3QgYW5kIHdhaXQgZm9yIGl0LiBTZWUgYWxzbw0KPj4+IGBiaW5kaW5nczo6
cmVxdWVzdF9maXJtd2FyZWAuDQo+Pj4gKyAgICBwdWIgZm4gcmVxdWVzdChuYW1lOiAmQ1N0ciwg
ZGV2OiAmRGV2aWNlKSAtPiBSZXN1bHQ8U2VsZj4gew0KPj4+ICsgICAgICAgIGxldCBmdyA9IE9w
YXF1ZTo6dW5pbml0KCk7DQo+Pj4gKw0KPj4+ICsgICAgICAgIGxldCByZXQgPSB1bnNhZmUgeyBi
aW5kaW5nczo6cmVxdWVzdF9maXJtd2FyZShmdy5nZXQoKSwNCj4+PiBuYW1lLmFzX2NoYXJfcHRy
KCksIGRldi5hc19yYXcoKSkgfTsNCj4+PiArICAgICAgICBpZiByZXQgIT0gMCB7DQo+Pj4gKyAg
ICAgICAgICAgIHJldHVybiBFcnIoRXJyb3I6OmZyb21fZXJybm8ocmV0KSk7DQo+Pj4gKyAgICAg
ICAgfQ0KPj4+ICsNCj4+PiArICAgICAgICBPayhGaXJtd2FyZShmdykpDQo+Pj4gKyAgICB9DQo+
Pj4gKw0KPj4+ICsgICAgLy8vIFNlbmQgYSByZXF1ZXN0IGZvciBhbiBvcHRpb25hbCBmdyBtb2R1
bGUuIFNlZSBhbHNvDQo+Pj4gYGJpbmRpbmdzOjpyZXF1ZXN0X2Zpcm13YXJlX25vd2FybmAuDQo+
Pj4gKyAgICBwdWIgZm4gcmVxdWVzdF9ub3dhcm4obmFtZTogJkNTdHIsIGRldjogJkRldmljZSkg
LT4gUmVzdWx0PFNlbGY+DQo+Pj4gew0KPj4+ICsgICAgICAgIGxldCBmdyA9IE9wYXF1ZTo6dW5p
bml0KCk7DQo+Pj4gKw0KPj4+ICsgICAgICAgIGxldCByZXQgPSB1bnNhZmUgew0KPj4+ICsgICAg
ICAgICAgICBiaW5kaW5nczo6ZmlybXdhcmVfcmVxdWVzdF9ub3dhcm4oZncuZ2V0KCksDQo+Pj4g
bmFtZS5hc19jaGFyX3B0cigpLCBkZXYuYXNfcmF3KCkpDQo+Pj4gKyAgICAgICAgfTsNCj4+PiAr
ICAgICAgICBpZiByZXQgIT0gMCB7DQo+Pj4gKyAgICAgICAgICAgIHJldHVybiBFcnIoRXJyb3I6
OmZyb21fZXJybm8ocmV0KSk7DQo+Pj4gKyAgICAgICAgfQ0KPj4+ICsNCj4+PiArICAgICAgICBP
ayhGaXJtd2FyZShmdykpDQo+Pj4gKyAgICB9DQo+Pj4gKw0KPj4+ICsgICAgLy8vIFJldHVybnMg
dGhlIHNpemUgb2YgdGhlIHJlcXVlc3RlZCBmaXJtd2FyZSBpbiBieXRlcy4NCj4+PiArICAgIHB1
YiBmbiBzaXplKCZzZWxmKSAtPiB1c2l6ZSB7DQo+Pj4gKyAgICAgICAgdW5zYWZlIHsgKCooKnNl
bGYuMC5nZXQoKSkpLnNpemUgfQ0KPj4+ICsgICAgfQ0KPj4+ICsNCj4+PiArICAgIC8vLyBSZXR1
cm5zIHRoZSByZXF1ZXN0ZWQgZmlybXdhcmUgYXMgYCZbdThdYC4NCj4+PiArICAgIHB1YiBmbiBk
YXRhKCZzZWxmKSAtPiAmW3U4XSB7DQo+Pj4gKyAgICAgICAgdW5zYWZlIHsNCj4+PiBjb3JlOjpz
bGljZTo6ZnJvbV9yYXdfcGFydHMoKCooKnNlbGYuMC5nZXQoKSkpLmRhdGEsIHNlbGYuc2l6ZSgp
KSB9DQo+Pj4gKyAgICB9DQo+Pj4gK30NCj4+PiArDQo+Pj4gK2ltcGwgRHJvcCBmb3IgRmlybXdh
cmUgew0KPj4+ICsgICAgZm4gZHJvcCgmbXV0IHNlbGYpIHsNCj4+PiArICAgICAgICB1bnNhZmUg
eyBiaW5kaW5nczo6cmVsZWFzZV9maXJtd2FyZSgqc2VsZi4wLmdldCgpKSB9Ow0KPj4+ICsgICAg
fQ0KPj4+ICt9DQo+Pj4gKw0KPj4+ICsvLyBTQUZFVFk6IGBGaXJtd2FyZWAgb25seSBob2xkcyBh
IHBvaW50ZXIgdG8gYSBDIGZpcm13YXJlIHN0cnVjdCwNCj4+PiB3aGljaCBpcyBzYWZlIHRvIGJl
IHVzZWQgZnJvbSBhbnkgKy8vIHRocmVhZC4NCj4+PiArdW5zYWZlIGltcGwgU2VuZCBmb3IgRmly
bXdhcmUge30NCj4+PiArDQo+Pj4gKy8vIFNBRkVUWTogYEZpcm13YXJlYCBvbmx5IGhvbGRzIGEg
cG9pbnRlciB0byBhIEMgZmlybXdhcmUgc3RydWN0LA0KPj4+IHJlZmVyZW5jZXMgdG8gd2hpY2gg
YXJlIHNhZmUgdG8gKy8vIGJlIHVzZWQgZnJvbSBhbnkgdGhyZWFkLg0KPj4+ICt1bnNhZmUgaW1w
bCBTeW5jIGZvciBGaXJtd2FyZSB7fQ0KPj4+IGRpZmYgLS1naXQgYS9ydXN0L2tlcm5lbC9saWIu
cnMgYi9ydXN0L2tlcm5lbC9saWIucnMNCj4+PiBpbmRleCA2NDE1OTY4ZWUzYjguLmVkOTdkMTMx
NjYxYSAxMDA2NDQNCj4+PiAtLS0gYS9ydXN0L2tlcm5lbC9saWIucnMNCj4+PiArKysgYi9ydXN0
L2tlcm5lbC9saWIucnMNCj4+PiBAQCAtMzUsNiArMzUsNyBAQA0KPj4+ICAgI1tjZmcoQ09ORklH
X0RSTSA9ICJ5IildDQo+Pj4gICBwdWIgbW9kIGRybTsNCj4+PiAgIHB1YiBtb2QgZXJyb3I7DQo+
Pj4gK3B1YiBtb2QgZmlybXdhcmU7DQo+Pj4gICBwdWIgbW9kIGluaXQ7DQo+Pj4gICBwdWIgbW9k
IGlvY3RsOw0KPj4+ICAgI1tjZmcoQ09ORklHX0tVTklUKV0NCj4+DQo+IA0KDQo=
