Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4393BB31835
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 14:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BFF10EAF5;
	Fri, 22 Aug 2025 12:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t5UEhXqY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E6610EAF4;
 Fri, 22 Aug 2025 12:47:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUwZ5HrFVTwjNOo399IEFA5F3rJlwlSvncNX0C3Vkc9EcxBU0ED3D/bkeVrdBQD3nFQAAdLqfOZLvFuSUROdMksB6tenz31zipBH6HDHAtZxL7pn+HQ5CRj4HXeSVcB1rpj8ldZNc0ARmKaKH7gvbH9ueYol2SxLtANCl/KnT+cMbI2kEVrCDMio++uUg85QyYen5zlOdd+QLTsPn252gsjo9WlDB4C6dB+vCW/cWHPLnwplAK4A6p9vmsxDI/PFsUEKj+n+kQpM4mR3Pfl96tH6PTVxQl+PE3lslM0Ye/09B4t/meGTY2qoohcVGvPYmXc78sZ12ivkUG8yOZgO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WWb87XPorfKrqds/EZcdznOJLaiyqS29re66WZqT98=;
 b=xQOJ61t+2mRp4OrTzC65VfwB36iUWm+Z4QsHUScjvKIXW9DaBWeGtmiI/MUdOFoGaaH1ZRae34dzfLHwahn7xrp31AZ66ZEgaDgu+0F1zliS7uAfyoXrRnqYx5802kB/e6Uvh+3EY/6bfR/0KXjkKm0uvasNlWR0yH9ipS9MCuDa1cVQT7JOoEwh/J0MxZBrskSQEsKFR5FfzhxiS2eVxPSsmv74Fy87+2hwuUMyfgAmlbfpsdsb7vibhvHAf5sYgVGhfqvmGrmFu4bUsae1dMKAhvu/91bhqnoCrRAaTD319zdM36AjXPTWqyIihd1HwUusnHs6Itz+t/B3tuSiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WWb87XPorfKrqds/EZcdznOJLaiyqS29re66WZqT98=;
 b=t5UEhXqY+etPcp7TMmMD1NRIGVQQSGYAzkhfG1fWgLKuvyqVwtYkDasj/p65UZFMH1ZHvSVsegyMGMeciOVRR3bUatelxG4pSgTaAWO7fzuzfholzVT8MrLqLpaGcKWExV++TtYQbY6fiU068tDipUq4DWXemGzfNNe1vdW7XJvsu7BVCJ0V6oYU+ogtoNCGE+gcoQKyvQc43DThj9N1uiSFUHpP8XetdX13wuV602JtbqmJ5hFmOjh/103LdoYkiIeSVIzmQeQ5TfBWchJPaS+KUNEJaDT4C1WAoeL/FAA8Fqfh0NAyjNMHgMGjlWx1MdzeOqIWx4zrrUAFsXoZTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by LV2PR12MB5823.namprd12.prod.outlook.com (2603:10b6:408:178::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Fri, 22 Aug
 2025 12:47:53 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%5]) with mapi id 15.20.9031.023; Fri, 22 Aug 2025
 12:47:53 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 22 Aug 2025 21:47:19 +0900
Subject: [PATCH 4/5] gpu: nova-core: firmware: process the GSP bootloader
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-nova_firmware-v1-4-ff5633679460@nvidia.com>
References: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
In-Reply-To: <20250822-nova_firmware-v1-0-ff5633679460@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0163.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::8) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|LV2PR12MB5823:EE_
X-MS-Office365-Filtering-Correlation-Id: 227ce7bd-2016-4cf6-5ec5-08dde17a1c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFErdEVvVVMzTHJYcnVVQWpDNEYvQlJOVEZkckxpVWxOekhXREZMN0YzRzJP?=
 =?utf-8?B?Qm9YSW5yaVJRSUhMMDdGamc4WTc3c2w5UHpvd1k4Q3pXRDdWbkExYWk0N043?=
 =?utf-8?B?Nm85M0htQVA5bk5Bc1h2cnZINmI0OVpNMGhJOHl4dXN2eGRxK0g5M2pRSHdJ?=
 =?utf-8?B?RVhCWUhaT1JMSC91MkU5ZjRNdEhtWmJjS2lXV2l5by84dGdoY0U4eWVXNkF5?=
 =?utf-8?B?RVpVd3hldTk4Uk12ODJJcW1INm5WMjl0V3JiNXFncXNNSTJpSVlsWXQ2ZU9Z?=
 =?utf-8?B?c0ZYVE1lcWlSTTlraTlCbFdCLzFiRFRVRVhZOEhIKzBoV3k2eDN4TWtreTNZ?=
 =?utf-8?B?QlZqVHVMMmFWZ1JaNlVKYi8wYnRqY3NKRXRwYmlKL3V3a0p6eTBiSjdlQmdz?=
 =?utf-8?B?cnAzc0RWcDBOSS9JOWFMelhaQnllL2RTZll0aTZRa1VSTFZZQjUveUYvOERH?=
 =?utf-8?B?MGNBVmxXQUtpV0EwMElCWE04TmFMc05KWDZRa0tubmM2QWpGYU1JaUdESjBa?=
 =?utf-8?B?bkphSVJPZ3NMbUIzQmNTYkpteFE0ZnJPYS9QRUZ4a1gzbVFTazlnd3VFRVZm?=
 =?utf-8?B?R0RTTzkvSmNFbHY1QkpaY3ZCUE9ZT0tRSUQ4NlNhQnlWbzVpQ001V3N0dWl0?=
 =?utf-8?B?L3FObXFQMlFnNEMvOTkyQ3ZQZEQvSFArZ01lY3VNLys4c0M1cjJjWndydUll?=
 =?utf-8?B?UldFeDhXVS82QXVGRkxrZVJkbXhLOE1MZkNnVHA3YVd4UXJzS2M2UmVqN3lY?=
 =?utf-8?B?YjNvMlNzRjVLNllaTUpucWY2ODFFTXRqcmRnVkFyMGVYQ2tvWFBVY3ZaMlFr?=
 =?utf-8?B?YW1ndXUyZWxRMmpKQ0NXWlVEa2N4L0JrZ2JEZE0vYUI5dkZzTVI1STVDRFJX?=
 =?utf-8?B?VmVhenpvay9JYnpZQUNuYWlDSEdpSFJRV1lONXNoMEd3OExUekNmeGdvUTJx?=
 =?utf-8?B?S2ZRVWxMSGN1QnpVTUZ5U1BhK1dFM1lqL3pCbFRqdW1VVllyNWFUOTg5OThC?=
 =?utf-8?B?NW9zbWFsVncyRG9QT1dIWS9PSTVWRTZMR0JQSjZ6U1NLdmVSZHpKVXAyS1ZJ?=
 =?utf-8?B?T0hqWnp1cmszT3JscGVMbWFLYW52THdhZFlYcTlWQ2lyTEp4RllIdCtPUmpI?=
 =?utf-8?B?YmM4OHN2R2o3aTRlbzZYR1JWNlFzRVhsMmpaRlJmK25laG05NmVDc0c2S3p4?=
 =?utf-8?B?VDJLMnFCenhKdHlsOGkwNGRUeTNwblZCTDlpd3h4dmpZZkVCdlkxZE15TGRS?=
 =?utf-8?B?RnpQVHpFUWJPOE1nY1hUdmg5eGNISUxITUp5SkJRZ2dlSlpKWkM1SFN1REFl?=
 =?utf-8?B?dXhxZUZ0SDNIRXFzQllMRDk2Q0s5V1A5WDBXYytzZ0E2dEVBamVOaVlFYXpV?=
 =?utf-8?B?UTJsZy9od3JYMWVaRklCZG02aVA1M2VMTG41a2JUL0dHa0lMYXR1Q1luRTBq?=
 =?utf-8?B?bVdXTmFpNm5oMUVLUjJqT0l6NVZoL2RuNnB0V1VwUWZ3Nmp4RzRYTHFRanNx?=
 =?utf-8?B?aEdmN2xMTHBIc294c0NCUTFYL0Zsc3hzTjMvM08za3pKamR2RGdEd2pQRG9o?=
 =?utf-8?B?TTJEVk4yNDJnOFV2N0lMeC9kS2p1MXhqR2k0MUJIem9FcDMrYkx2ZDlUQzAz?=
 =?utf-8?B?VThJM3kvTkxpOE4vTHBHWGhvVlpOTHlGQ3IrYVlrK1UxZkpma0RPY3hBTXZE?=
 =?utf-8?B?OUc3VE1IRU85dzd3ZDVQd3FvZU9uNXhGN2YvZjltemxPTm1FZTJKOFRBbUJh?=
 =?utf-8?B?dXIzVitwUDRyby8zb0pHaFRIM1ZBTG1OcVZXSE1JbFo3Q085MWI4ckNFQ3Nl?=
 =?utf-8?B?RDBaMFlBNmxVU2Q5S0JSMGQ0R3h2WFY4TVI2dExUQkx3UVNUNnJjcmVwSGFr?=
 =?utf-8?B?NlozWVVleUc4cWg0VG8rTmNPOWdmbnJ0YmRIbG1tR3R1N2UyczRlZ0FUWGp6?=
 =?utf-8?B?a20zR2lFMEp5aDJyWENnR2JsRTg0c0laVEZWeDdTbmt1K25ydzZsc0dVbHUz?=
 =?utf-8?B?VEpuZzlxUnp3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkpXY3JOZDVOYXNvd1UvTlpHNFFJOFN3VFdMa0Jud2o1SVc0TnZzNzA2b28z?=
 =?utf-8?B?dzJjVjM4YmtQNDN0a3NYaHpqUW5pV2JYY3ZGNjJaRnZ5NHc4aFpLeEEvSFA2?=
 =?utf-8?B?dmJUQ1RaYWpqN2dOMjVpd0V3VVJONEROOXFFbjYwNHZEZXptdlVRRFkrNlpx?=
 =?utf-8?B?b0Q1amJkMWQ3WnplcWhORmppNnpNMEh1azhlZ1FnYkRiQlU4M1pCa1MvY0xZ?=
 =?utf-8?B?KysrNmdlVGthTHVkQW82TFVhK1Z1bUdIdzdwYk42K0VPc2RQbE5YZUh0YXd4?=
 =?utf-8?B?aGFVY2ZVemp4cjVCWUJiRkhkd2wrZjVFem92RjZlTDluMi9yWmtGWk43bmpK?=
 =?utf-8?B?K3N1RU5TNlRIUWxEOGlVRDNuY2FRSnpDV3dUeTVPa2VEb0lNVWw5Mzg3L09L?=
 =?utf-8?B?MlNkQ2RIKzBFN1UzQUxJdm05UHlHcWd4YWFNckt2ZG85S0lPNWNsTU9laXhm?=
 =?utf-8?B?L29keFRoNEhlcTVpc1U2dWRJU242Q2g2TkNReVovSmkzQ0V4cEdsS0wzaFVO?=
 =?utf-8?B?NFVZMWpBdmNiQVgyZW9VWHRjempybFRhU2xwdXZ0N0JtZnRTeUtySjMzSFBF?=
 =?utf-8?B?a1VianhWN0UwRGQxSEJueW1jNXNFa2EzYWhmZytVaHo4K0dQT2o4RWJ1Y0pI?=
 =?utf-8?B?cGx0aWlwR2xYYlUxMkdqNWg1bzk4cDhtdmNJWTVybjA0N2M4QnFRaWZVbzlq?=
 =?utf-8?B?MHFDSXZJazZJY0FQdm41YXVVQTRldFg0R25PQ2p2SjBWZ3VLR0g3bGRxV1BJ?=
 =?utf-8?B?ck9DZmxjalhyaXIrRHRyQnRUQ1Q5MVJJMDFOL0pnMW5vZ0lYcGRJc3ZqYk1P?=
 =?utf-8?B?SXVpL0F6NFZSMnllbm9XZmk1NmVhcDcxeCsrSUdVSDBlSFdtZTZsWWxWUEtE?=
 =?utf-8?B?VEtVZE1LRnpxY09lcHhiWnVBcFlGQngvMy9DUkpkRWcyQUp6bUlCRExuWXh3?=
 =?utf-8?B?NHFHRVNETzZBZzJsWTVPOCtZWmprQ0xBazN0WG5pRWdHeFpDR1FaODZiRmpW?=
 =?utf-8?B?eUI1NUQ4UXp4TE1hV1RwTVM3YWFoekNISDhzU1NWWjFmdE40bDFUNVBQR2F4?=
 =?utf-8?B?ZEV0cFZUNG9CMGs2bXRadUdJbzljSlRQV0xtWVFaSHRpdjR6R3hiL1NIREM1?=
 =?utf-8?B?OXp5K0RQUExGYUllQlkyR2VoeUNzZVg4KzRtekFWcmF4NHRHUmRaenBYM080?=
 =?utf-8?B?S05hNnQvVzZWY0lSQk92bnlHTlhsVVpNVUVEcS9KNllxOUNKNEQwZU9CK3pB?=
 =?utf-8?B?bml0UGhEUDBGVlpITWo3NlNXRzZlUVBBU2NhUEc2aVJUckFkb05IdWJMYlVm?=
 =?utf-8?B?ajBNRTh5MWY5ZXNTNGZnV05Zc0l2UHpoZ0llYjkrYTk5aW5Nd3V5K0lvWk1q?=
 =?utf-8?B?bHdna3ZaVy9rbENGNHkyUEptQitBOGhTYjdxYjArUFRQMmdhN2ZMcGtuSzRZ?=
 =?utf-8?B?cmVXR1cvWWFJZDdxdzlhRXEvZXFURnBsQ3JldWRwSXNBVWFNb1BzeGRFbVNS?=
 =?utf-8?B?UkZ1MkI3T0RncE1iUEMwN0hlMHpIQ29DbGloMEN3Y2ZJSjNyWDN2aXl2anp6?=
 =?utf-8?B?Ymk5MHFuYit1R3F3SEQvdWxSK1p0Mjdhbnp4NkJENVZQdWNIY1lwRW5IbnE3?=
 =?utf-8?B?eFVpTFhRL2UzcDF3T1Q1MUUxT21BcnRHNE1JVEt1eENsRGFobzdDaG9qWk1h?=
 =?utf-8?B?eGRka3BGWklvckNzcmpHdGpYdFhzLzVTbzBVVHhibngxYmN2dXo5SnBVMHUw?=
 =?utf-8?B?M2RzK25IazFYYi9oM2NxZm42TE9VSnUrOHV4MURzcTUrTGJ1MDB6UFFwZ2Ju?=
 =?utf-8?B?OThzTzZ5V3o0SUQ4TmdIaFBkMkxvVmxHKzBldXpOSHlWNHdSMGdUamhkWkVi?=
 =?utf-8?B?UHliVTFYTHNrcEkwOHREK0FPaWFPZ3NubUZ1ZDVzYkdQRGJhV0RPbXJVMzRh?=
 =?utf-8?B?YmJnK2w2eXpPdTA4TzBFSS8rQzg3azJHZUloTnF0am1OMUhLUUoydEFUbzl1?=
 =?utf-8?B?SGZXMWs5MEI1V0ZiYmQyekJsVEpnUjkzTnpTQTliODdSc1ZDMTRaTGZ1SHlK?=
 =?utf-8?B?YlFjMUtFZTlFQXBUWHhzcExjbllsMmdyRjhiY28wSzlkVVBoRTVDZStROFZv?=
 =?utf-8?B?cStudk9IRHJWeEQrQTJHa1RwRGcxR0xXUEVET1dYSXBFRzY1ZnZrMG5qK3V5?=
 =?utf-8?Q?fPAKB1ndL9UWWKwvlzi7P1P3ctPSdIdQqqOQcX48mpm2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 227ce7bd-2016-4cf6-5ec5-08dde17a1c6d
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 12:47:53.6871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1mCzTptUtpSsIT+EpViGlNyGirlO+WDREZddgOGgxcLW3uMgaPIlvKyJCP/AScu4CzDrnsVjNnRJaUKZ6Jz4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5823
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

The GSP bootloader is a small RISC-V firmware that is loaded by Booter
onto the GSP core and is in charge of loading, validating, and starting
the actual GSP firmware.

It is a regular binary firmware file containing a specific header.
Create a type holding the DMA-mapped firmware as well as useful
information extracted from the header, and hook it into our firmware
structure for later use.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       |  7 ++-
 drivers/gpu/nova-core/firmware/riscv.rs | 89 +++++++++++++++++++++++++++++++++
 2 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index be190af1e11aec26c18c85324a185d135a16eabe..7006696bb8e8ec0d7fa3a94fb931d5f0b21fb79d 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -12,6 +12,7 @@
 use kernel::prelude::*;
 use kernel::str::CString;
 use kernel::transmute::FromBytes;
+use riscv::RiscvFirmware;
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
@@ -22,6 +23,7 @@
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
+pub(crate) mod riscv;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
@@ -32,7 +34,8 @@ pub(crate) struct Firmware {
     booter_loader: BooterFirmware,
     /// Runs on the sec2 falcon engine to stop and unload a running GSP firmware.
     booter_unloader: BooterFirmware,
-    bootloader: firmware::Firmware,
+    /// GSP bootloader, verifies the GSP firmware before loading and running it.
+    bootloader: RiscvFirmware,
     gsp: firmware::Firmware,
 }
 
@@ -58,7 +61,7 @@ pub(crate) fn new(
                 .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
             booter_unloader: request("booter_unload")
                 .and_then(|fw| BooterFirmware::new(dev, &fw, sec2, bar))?,
-            bootloader: request("bootloader")?,
+            bootloader: request("bootloader").and_then(|fw| RiscvFirmware::new(dev, &fw))?,
             gsp: request("gsp")?,
         })
     }
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
new file mode 100644
index 0000000000000000000000000000000000000000..926883230f2fe4e3327713e28b7fae31ebee60bb
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for firmware binaries designed to run on a RISC-V cores. Such firmwares have a
+//! dedicated header.
+
+use kernel::device;
+use kernel::firmware::Firmware;
+use kernel::prelude::*;
+use kernel::transmute::FromBytes;
+
+use crate::dma::DmaObject;
+use crate::firmware::BinFirmware;
+
+/// Descriptor for microcode running on a RISC-V core.
+#[repr(C)]
+#[derive(Debug)]
+struct RmRiscvUCodeDesc {
+    version: u32,
+    bootloader_offset: u32,
+    bootloader_size: u32,
+    bootloader_param_offset: u32,
+    bootloader_param_size: u32,
+    riscv_elf_offset: u32,
+    riscv_elf_size: u32,
+    app_version: u32,
+    manifest_offset: u32,
+    manifest_size: u32,
+    monitor_data_offset: u32,
+    monitor_data_size: u32,
+    monitor_code_offset: u32,
+    monitor_code_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for RmRiscvUCodeDesc {}
+
+impl RmRiscvUCodeDesc {
+    /// Interprets the header of `bin_fw` as a [`RmRiscvUCodeDesc`] and returns it.
+    ///
+    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
+    fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
+        let offset = bin_fw.hdr.header_offset as usize;
+
+        bin_fw
+            .fw
+            .get(offset..offset + size_of::<Self>())
+            .and_then(Self::from_bytes_copy)
+            .ok_or(EINVAL)
+    }
+}
+
+/// A parsed firmware for a RISC-V core, ready to be loaded and run.
+#[expect(unused)]
+pub(crate) struct RiscvFirmware {
+    /// Offset at which the code starts in the firmware image.
+    code_offset: u32,
+    /// Offset at which the data starts in the firmware image.
+    data_offset: u32,
+    /// Offset at which the manifest starts in the firmware image.
+    manifest_offset: u32,
+    /// Application version.
+    app_version: u32,
+    /// Device-mapped firmware image.
+    ucode: DmaObject,
+}
+
+impl RiscvFirmware {
+    // Parses the RISC-V firmware image contained in `fw`.
+    pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<Self> {
+        let bin_fw = BinFirmware::new(fw)?;
+
+        let riscv_desc = RmRiscvUCodeDesc::new(&bin_fw)?;
+
+        let ucode = {
+            let start = bin_fw.hdr.data_offset as usize;
+            let len = bin_fw.hdr.data_size as usize;
+
+            DmaObject::from_data(dev, fw.data().get(start..start + len).ok_or(EINVAL)?)?
+        };
+
+        Ok(Self {
+            ucode,
+            code_offset: riscv_desc.monitor_code_offset,
+            data_offset: riscv_desc.monitor_data_offset,
+            manifest_offset: riscv_desc.manifest_offset,
+            app_version: riscv_desc.app_version,
+        })
+    }
+}

-- 
2.50.1

