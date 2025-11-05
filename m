Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56F0C35C8D
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 14:15:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482E610E751;
	Wed,  5 Nov 2025 13:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lPHmOsV6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010065.outbound.protection.outlook.com [52.101.56.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD9A10E74E;
 Wed,  5 Nov 2025 13:15:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rbRhNVGN+S08jf8uR6QDiPQJnk37dvY8yEWDlkzHnr1MawjSzRMUKgxcIikU3whhGKIqiOx0umvCNsCAcBAVduvUN1AqxzALmuwnOOQR9Z2l4hYnW45tZL0jQJub7oSK6m1cDkKfID/G7s8aqJiyspbahYw/uPBObPvB8jhZUiCdnvZKxT2b95C/Vm3RbOdXoKSTIRexoqVs+CspcjogCjZXEPHbyG5x/vLGvlSseBHwp6HdC/DxIWW/HG1ctcO5RIbS3GQM+6NVj3BIx/Gkr2j57xa0/rMBiA+c/sWB+ayjeVLYxRfFuClad8FxVJot+sxr0npSA6/z6LzFVBVgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUtE511ff9/qfDP0LvmZ1AaZWuLS5KyegwDnhBd5YC0=;
 b=C1q8+TtDzJzHD4nC46Kb3n4VviFbcrs2WhVx73oq706ykufIT2WOSVfIcJ5wRz//EJ2uSTjgD87lDdSix9H/bLCHhqR+YuhsrhgblG4xE/WzTQnLbk2tEk2X1mQ5GWebUFN2/pkUwCe6WIFkuLjFBSNIA6K0Xij6bBZMt4B4HM0Pf3xplr1oHVaSihfaOfR0lt59OJtTXCiLNkhpqEZq42rSXDXaOe58IdVXOoHh4Vpdy9SrQlZ6S0NOUUx9kxBHm8HV5Xq21zqoCrouVy18lS4qFpGecKxk3gjbxJ+39xAQQz+CUcvPgN+UAFeAo11gi9NEfymy17hH+x0OSSzEnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUtE511ff9/qfDP0LvmZ1AaZWuLS5KyegwDnhBd5YC0=;
 b=lPHmOsV6+4zybOXwnLpDMdKsnbQh0SkjehHccgVEseScU5365dPa0WYV1ozIJeyWGlNX6ZjEGEScc4IasPEcAPWQdHsY97xIo0dkY+K9RaOyDSnV0DnEMMFSeNdnpaNZnkDvdGfq1AAoubBAc9dMVsFW95T6SET0SmwT1DZZnk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by CY8PR12MB7729.namprd12.prod.outlook.com (2603:10b6:930:84::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 13:15:25 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9275.013; Wed, 5 Nov 2025
 13:15:25 +0000
Message-ID: <caa27d52-d668-4320-b40f-0e1fde8c0a9b@amd.com>
Date: Wed, 5 Nov 2025 18:45:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Perry Yuan <perry.yuan@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Sanket Goswami <Sanket.Goswami@amd.com>
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-2-lkml@antheas.dev>
 <3792db59-7dc1-4e34-9436-84df4b6c3e10@amd.com>
 <CAGwozwFTDD2QrHy37axhanwQYv6ty9K_hfhxS05djKpv8HfY6g@mail.gmail.com>
 <2684d3ab-d7cf-4eab-acd4-91bdd5debb6b@amd.com>
 <058eda7c-ab93-40a5-b387-54f7a18f3922@amd.com>
 <13fd3b12-03a0-457f-a5da-fe018b032211@amd.com>
 <CAGwozwGLfcYdpetwTk=QH+k29u8SdroFxfkxb-KbAXh36sr1XQ@mail.gmail.com>
 <100c2f25-d1f4-5b82-4a76-a08394ece471@linux.intel.com>
 <fe9bb350-6dc5-4911-ad32-a95911251167@amd.com>
 <CAGwozwFRWiR4xQ422tp6H0R9knLjNkn4ewERyYtZgzOYfnJWxw@mail.gmail.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <CAGwozwFRWiR4xQ422tp6H0R9knLjNkn4ewERyYtZgzOYfnJWxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|CY8PR12MB7729:EE_
X-MS-Office365-Filtering-Correlation-Id: f06e453b-376d-4760-b934-08de1c6d613e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnJsTEpDV3Z3bnpYZm1EMDUxQ1pydEZuZDdTRWJRelZxbndrazRoOTVTTU1s?=
 =?utf-8?B?Wm9ramlRaEEvSVZXZzRGMERyUFU5c1ArbDkzckNjTlg4cWFwbGFjL08xVWdU?=
 =?utf-8?B?SGs4ZmM1TjdLd05WVmdDenI0NVJDcDJYU2VQV3pHSzBEVXpOb3J3YkVzMEx3?=
 =?utf-8?B?UXNCamdaWko2RUFvTlk1R2hQSG1oM1A3cVNNeWdlVjdaR0lBRmRONEdzdlh0?=
 =?utf-8?B?a0Y2TnozSjRnL2lpSXp5WGwxZHB3ei9id2dJTE05ODJLSk5GcnJadXFFTDJj?=
 =?utf-8?B?Z3F2L0JGelRCSUhaWXZZKzdJNnk5dnNpckdESDk1R0dWZHk0K3VZS3Q5U2Iw?=
 =?utf-8?B?WHh0TWMrY2xGMjNnbVI0VCs1K1I1Um45c29DZE1EbWkxTDI5cm5rWC96ZUp6?=
 =?utf-8?B?dlBJaUlldFdiOXpPWkhXSW1PODM1WU1IZFcyUkY3T2pHL0liL2loQ1RiYWFJ?=
 =?utf-8?B?NzhkVEtJVzM4WmJ0Z2NIUCtLMUFqT1NBOEtadUc3VCszS1JabC9yRnlSYVZw?=
 =?utf-8?B?eU5HbHJPNHJod3EwUTJGNTBIRElTQ2pITU9zbTRudkZFdWM3bEF5L09YSDZi?=
 =?utf-8?B?STZhRlJ5VWl0UEtkYVd1U2ZhQ3dFL2lSRXR1U21PczNaY0FCUTgwSUYrRkRY?=
 =?utf-8?B?cklMWVdyaEkrRFgrdXlmRWRsVzB5OFdYc1U1cG9LVCs2MElmbEpTSThveDhB?=
 =?utf-8?B?dzl5RnRIQXJsbU93TVJ4VE9jUnUrV1JjMHdIbjdFd1dhbGsxVVpBWUxOck5r?=
 =?utf-8?B?NmxYclRvWUtzN2E2dXlHN0hZR2RyZWRtN29iN0hzZHBnN3laMkdTSGF5MEo5?=
 =?utf-8?B?WTZEV1MycVVIY3VCalhVRGtOeU9FYVhJVHh5OEJ6dXF0SCtOMlF3RWpTeGFp?=
 =?utf-8?B?MXVrSExQdUp0NmYzWUF3dGs4bld5U1g3eFh0aVFtU3kza0VRSmRyL3ErZkFn?=
 =?utf-8?B?dCs3SkRsbHFYb0ZFOTEyUFk2QVgrSU1jQmIwM0V0TGhDczBVZXB1bVRFMVZP?=
 =?utf-8?B?VHhnb1Q4NVlmRzAxYUtWZWhYaVl5aWNVb2ZBTXVna1RiMENBemM2Q25jdzFu?=
 =?utf-8?B?dnZ5elVEWTY2ZGl4bUZqZnZFM1BqZjhIWXJKNFlHMFRDRmRpTW5vMlFZK1Rp?=
 =?utf-8?B?T3RQdFZoV3BLdjExMWZyTTFEeGRDUTlkN3hjNk5uVk1KNmpPZysyTkl2R3RF?=
 =?utf-8?B?eGhXaC9BdDQ3cUJyR3dlQ2lYWHIwWkprNE5weEdXcWFnSFBGTW9jNlZVM1No?=
 =?utf-8?B?djVlSlhVNkdEeFVzcW1pTVE5SjVWRjVBUXJaa1JkcVBjb3ZtczhMS2dMaXZK?=
 =?utf-8?B?YnVJRjBPeGV5cm52NFIxSUFVOHE5aldyUi9EWWYxNmJzRWVkQjN6YjNGWlZN?=
 =?utf-8?B?cGIyTGduWDNDaGd2cllvdFFIZ080Y3pZNkFhN2hZYm1WWjlEUE9XWUdldjVD?=
 =?utf-8?B?ZUY0UVhaSkZIVkN5L3JuTWdnbjlTaU10Uko5dlF2STE2Z1NLMGtZZ2IveFNt?=
 =?utf-8?B?RzhJRzBlbDlLWk5VZEl4ZnYwYjYyUmI3Qk9WOXd6c0VJVWE3RnlSM2YvZ2x4?=
 =?utf-8?B?U3ZYZGx0Wlk3NHc3NnlYL0xJWWtoRHV2a0JxSlRyRDJFVmxQK2dUVlBFbmsy?=
 =?utf-8?B?dmM3MUkwelhVN2h5SHdJc2I4NVdoWS9WTksrRW9sS1FiOXIzUkw1bHBHNWxP?=
 =?utf-8?B?Nmp6S0M1VkcvUkg3Wi9IMVFCV2lQY2dSSGwwSGpRNzZ0YXNUMFY3Z1hIdzg2?=
 =?utf-8?B?UjRWMHFNdFRhYmR5cW1sOFU2bUFUUDZKMm5jRFNnQmVraTIvMC9zUnZrZHZj?=
 =?utf-8?B?SjVpdXJZejVTT0E5V1IvYjIrSzJTTWhVMStaR3I0K2ppUGQwRjM2TVpqTTV2?=
 =?utf-8?B?bDZheWZldEE1a1lUSktSTTc0enhycTFOWTZGZ09vYjQyWXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nm45MUdiMGFEczZVaWo1YlBKY0JTdUNKWUUwMDMrN3NZZ0Y1WmlocDFuSWE3?=
 =?utf-8?B?YWJtRU80cmJQK09YMnJ1MEFQRDA2ZThRbWdJK0VDcVBndkI1TjVvREpKSXM3?=
 =?utf-8?B?QmZ2TDd5RHZ1bzZ3NTBkU1JXdDJ3UW0yK1l6UzRXTi9aOU1mOGdCK2FjTktC?=
 =?utf-8?B?NUw0Q0FOZWRZblJua0ZKZlF2QWNtTFkwdU5VM0dTMXJEVzhrbHdublJ2ZklI?=
 =?utf-8?B?dDNuU05VWWJDdHVrbnpleDlQaTV1NjBTb3AyM2FJdUU0Z1lyRnVOWEJwZ2xz?=
 =?utf-8?B?bUZxU2RVWGduYXYwTjIza0J5THlET0JzMkdhZWVVS0loMVBWSXBTeXp1RmRv?=
 =?utf-8?B?Wm1DQldzTUx4ZlFvNXN0bjF4cEI5WERBYUgvSG1CZ0Y2b2xQNStrQzRUdWh6?=
 =?utf-8?B?dGNpVEVuckpQbklDQWtBK1F3MWNSRjNBc2ZJejE3N3RXdnZWakxLQWxqaUI4?=
 =?utf-8?B?a1lYR0xQNXNFQmFJeGNCaCsvSEVDbjM4WFMvTG4vRTBEa0U0ejBxYTJrK29w?=
 =?utf-8?B?ZGlUK1NGQm1QUnNsM3NSYU5LVkR5cGtMUFFvYWNtaUcyb2JLUk1TaWJZUmh0?=
 =?utf-8?B?NnB2Z0laZEMxVkFNVmVCeVFrNDF4ZmxNc0hzMGtQZ3phZ3NBNnJML01qc2xC?=
 =?utf-8?B?WTlaZmFUWEg4MGZVa1h1OXNTUHJlc1QyWm1FbTVTbkJtcUVsTTdjeWE2aUFL?=
 =?utf-8?B?WVRxTmIrNi83SVhJVnVIeXZYbjBONW1LVVlCcVlHR0VqZVN1K1BmcFlqR0xp?=
 =?utf-8?B?dW00MkRRN3kzVTJQV1I2ai9GZThEcDVmMFVnQXp1cTM3SDV5aVBIcmpzZVBU?=
 =?utf-8?B?aUxBcVJPbTVVanhaUUExV2xkUUQxaUkxbVYrUmI2dU1jZTI2WWlyOHluUmtt?=
 =?utf-8?B?UFExV0wvQXBaSzU4bi95TlVqaUgrSG00UXdSWldFNENYKzFPakZSa2R6OXVl?=
 =?utf-8?B?d2JKZW1GbXc1YkZnS3hLU3luM0N4S3B0ODNqcm05OXowdEF1U01JM09hNDlP?=
 =?utf-8?B?VjJ4R096QWRUNGhHWk1pWDBRbnBvWFoxdGtrcnpjYTAwTVZWQ3k4MTcxL2xy?=
 =?utf-8?B?Uy9nSUFJM05DenRZUmV2SkNITS9WUlR4UEhRM2ZaRmpleXd5MUNRdDlVQ0Ry?=
 =?utf-8?B?TXZXTGFxMHRxalNxYjE5Y2tEdUxkdkJaVmY2N2taZlMvdVNrQ3lQVllxd1ls?=
 =?utf-8?B?ZmpmblZZVEN5RE0vamxXZFkzMzU2MzZjQVl5TC9TZmZaaVlESDRocGdzUEVC?=
 =?utf-8?B?SGVoZjNudllXaUE2L1JGUm45SzJSbGJ2aWZSaVNNV2IyekNiNUxHa1VhTmpn?=
 =?utf-8?B?NXd3Qlp5R1NuUVpnWWplMFdiYS92SmFBRk9yeHlnOS82TmRVb0FBcWxhTEI4?=
 =?utf-8?B?MGpoYjVMbStZUkdpNk02SlFaRWZOYW1TQW92QU9odG42QTZUTGprSW9pQ0VF?=
 =?utf-8?B?RnI2VXp3WlBCQkJpa2gvcVgweGhVWDZ3Q0dWWVNyY29Tb05lWENFUkRLTUZF?=
 =?utf-8?B?SjZPSFFQMDNLNllsK1JlaUdwYjBnZjRad3FhQ0RINWU0bEloRVF2Wlg2OFc2?=
 =?utf-8?B?NHR3aFlzZFY5RU1LeEMvUnNCSUF2WjlnZUlCbVAwRWdYcURaWVF1eXRQWW1x?=
 =?utf-8?B?REJZVWFDRCttZ1pDRTlsNVVaV3dKa2dQRGF2ZE03dVpEZ1BjZU5BUkt2ZmJI?=
 =?utf-8?B?QjBFV1ZNckh6YlkrOFFaWXFDQ0RWUXRqWmJaeldWdHNYdHVtdXlBMVZ0emdw?=
 =?utf-8?B?VHZOZU5NV3ZtWUVGZU0yeVhKejc0MHAwWjlhWXUzUERIWkdMdFowd0VlWDRU?=
 =?utf-8?B?QnlrTlUza3VTdmpKb2dpVUNPOS9UdTZtVFZUWUJVU1VGc0tFbWlad2VZVGVa?=
 =?utf-8?B?eElsT3BNZ3FyNC9nUWpobGx4MldwcUxzYStMbzBFSnlLRzYwQzJVdzk5VVJn?=
 =?utf-8?B?ODV6Qytub3RqTGdXQXllRUdTMHdSVFpIendaZlNCeG14enlPNEhUNjlWYWxV?=
 =?utf-8?B?ZVcyQ25aOHlUWVAycXZvYUQ5UlF1NTl5dWNqWnBBTzRtdHJzK1gwazhQT29o?=
 =?utf-8?B?UWFDWkdsOFl0YU8veEJsSUpHMzJDdmJLQ2x0YWQ0OFlvVlY4WUIzakx6ZndO?=
 =?utf-8?Q?jAEWvOPt4u2pcLl2H8dPOEAcL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f06e453b-376d-4760-b934-08de1c6d613e
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 13:15:25.4178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CluPRrLDqs/NCSh5nuQGjZ652CpYkgGpsg38p9nABvLd0K/OaFVGgrsscRSCJdTvDS0y8rKEGESZwnorQwA5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7729
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



On 11/5/2025 17:04, Antheas Kapenekakis wrote:
> On Wed, 5 Nov 2025 at 12:28, Shyam Sundar S K <Shyam-sundar.S-k@amd.com> wrote:
>>
>> Hi Ilpo,
>>
>> On 11/5/2025 16:43, Ilpo Järvinen wrote:
>>> On Mon, 27 Oct 2025, Antheas Kapenekakis wrote:
>>>
>>>> On Mon, 27 Oct 2025 at 09:36, Shyam Sundar S K <Shyam-sundar.S-k@amd.com> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 10/27/2025 13:52, Shyam Sundar S K wrote:
>>>>>>
>>>>>>
>>>>>> On 10/24/2025 22:02, Mario Limonciello wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 10/24/2025 11:08 AM, Antheas Kapenekakis wrote:
>>>>>>>> On Fri, 24 Oct 2025 at 17:43, Mario Limonciello
>>>>>>>> <mario.limonciello@amd.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
>>>>>>>>>> The ROG Xbox Ally (non-X) SoC features a similar architecture to the
>>>>>>>>>> Steam Deck. While the Steam Deck supports S3 (s2idle causes a crash),
>>>>>>>>>> this support was dropped by the Xbox Ally which only S0ix suspend.
>>>>>>>>>>
>>>>>>>>>> Since the handler is missing here, this causes the device to not
>>>>>>>>>> suspend
>>>>>>>>>> and the AMD GPU driver to crash while trying to resume afterwards
>>>>>>>>>> due to
>>>>>>>>>> a power hang.
>>>>>>>>>>
>>>>>>>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
>>>>>>>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>>>>>>>>> ---
>>>>>>>>>>    drivers/platform/x86/amd/pmc/pmc.c | 3 +++
>>>>>>>>>>    drivers/platform/x86/amd/pmc/pmc.h | 1 +
>>>>>>>>>>    2 files changed, 4 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/
>>>>>>>>>> platform/x86/amd/pmc/pmc.c
>>>>>>>>>> index bd318fd02ccf..cae3fcafd4d7 100644
>>>>>>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>>>>>>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>>>>>>>>>> @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct
>>>>>>>>>> amd_pmc_dev *dev)
>>>>>>>>>>        switch (dev->cpu_id) {
>>>>>>>>>>        case AMD_CPU_ID_PCO:
>>>>>>>>>>        case AMD_CPU_ID_RN:
>>>>>>>>>> +     case AMD_CPU_ID_VG:
>>>>>>>>>>        case AMD_CPU_ID_YC:
>>>>>>>>>>        case AMD_CPU_ID_CB:
>>>>>>>>>>                dev->num_ips = 12;
>>>>>>>>>> @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct
>>>>>>>>>> amd_pmc_dev *dev)
>>>>>>>>>>        case AMD_CPU_ID_PCO:
>>>>>>>>>>                return MSG_OS_HINT_PCO;
>>>>>>>>>>        case AMD_CPU_ID_RN:
>>>>>>>>>> +     case AMD_CPU_ID_VG:
>>>>>>>>>>        case AMD_CPU_ID_YC:
>>>>>>>>>>        case AMD_CPU_ID_CB:
>>>>>>>>>>        case AMD_CPU_ID_PS:
>>>>>>>>>> @@ -717,6 +719,7 @@ static const struct pci_device_id
>>>>>>>>>> pmc_pci_ids[] = {
>>>>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>>>>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
>>>>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
>>>>>>>>>> +     { PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
>>>>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
>>>>>>>>>> PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
>>>>>>>>>>        { PCI_DEVICE(PCI_VENDOR_ID_AMD,
>>>>>>>>>> PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
>>>>>>>>>>        { }
>>>>>>>>>> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/
>>>>>>>>>> platform/x86/amd/pmc/pmc.h
>>>>>>>>>> index 62f3e51020fd..fe3f53eb5955 100644
>>>>>>>>>> --- a/drivers/platform/x86/amd/pmc/pmc.h
>>>>>>>>>> +++ b/drivers/platform/x86/amd/pmc/pmc.h
>>>>>>>>>> @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>>>>>>>>>>    #define AMD_CPU_ID_RN                       0x1630
>>>>>>>>>>    #define AMD_CPU_ID_PCO                      AMD_CPU_ID_RV
>>>>>>>>>>    #define AMD_CPU_ID_CZN                      AMD_CPU_ID_RN
>>>>>>>>>> +#define AMD_CPU_ID_VG                        0x1645
>>>>>>>>>
>>>>>>>>> Can you see if 0xF14 gives you a reasonable value for the idle mask if
>>>>>>>>> you add it to amd_pmc_idlemask_read()?  Make a new define for it
>>>>>>>>> though,
>>>>>>>>> it shouldn't use the same define as 0x1a platforms.
>>>>>>>>
>>>>>>>> It does not work. Reports 0. I also tested the other ones, but the
>>>>>>>> 0x1a was the same as you said. All report 0x0.
>>>>>>>
>>>>>>> It's possible the platform doesn't report an idle mask.
>>>>>>>
>>>>>>> 0xF14 is where I would have expected it to report.
>>>>>>>
>>>>>>> Shyam - can you look into this to see if it's in a different place
>>>>>>> than 0xF14 for Van Gogh?
>>>>>>
>>>>>> Van Gogh is before Cezzane? I am bit surprised that pmc is getting
>>>>>> loaded there.
>>>>>>
>>>>>> Antheas - what is the output of
>>>>>>
>>>>>> #lspci -s 00:00.0
>>>>>
>>>>> OK. I get it from the diff.
>>>>>
>>>>> +#define AMD_CPU_ID_VG                        0x1645
>>>>>
>>>>> S0 its 0x1645 that indicates SoC is 17h family and 90h model.
>>>>>
>>>>> What is the PMFW version running on your system?
>>>>> amd_pmc_get_smu_version() tells you that information.
>>>>
>>>> cat /sys/devices/platform/AMDI0005:00/smu_fw_version
>>>> 63.18.0
>>>> cat /sys/devices/platform/AMDI0005:00/smu_program
>>>> 7
>>>>
>>>>> Can you see if you put the scratch information same as Cezzane and if
>>>>> that works? i.e.
>>>>>
>>>>> AMD_PMC_SCRATCH_REG_CZN(0x94) instead of AMD_PMC_SCRATCH_REG_1AH(0xF14)
>>>>
>>>> I tried all idle masks and they return 0
>>>
>>> Hi Shyam & Antheas,
>>>
>>> This discussion seems to have died down without clear indication what's
>>> the best course of action here. Should I still wait?
>>>
>>> There's no particular hurry from my side but it seems Mario gave his
>>> Reviewed-by already and there hasn't been any follow-ups between you two,
>>> I'm left a bit unsure how to interpret that.
>>>
>>
>> The thought process to was understand how do we debug the rest 5%
>> failures when we do no not have idlemask concept, which got introduced
>> after sometime. But both the patches should work independently, so I
>> am ok with both patch 1/3 and 2/3.
>>
>> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>
>>
>>>
>>> In addition, is the patch 3/3 entire independent from these two PMC ones?
>>> (If yes, I don't know why they were submitted as a series as that just
>>> manages to add a little bit of uncertainty when combined into a series.)
>>
>> I see a note from Mario on the cover letter that the patch 3/3 can be
>> dropped from this series and a newer approach is being planned.
> 
> To be more specific, patch 3 became two separate patches that went through drm.
> 
> For the rare failure, it would be an additional patch (if appropriate)
> that does not affect 1 and 2.
> 
> Do you have any idea of where the failure for the other 5% of cases
> comes from? I noticed that after I hibernated my device and it booted
> up, it would never go into LPS0, the OS hint stopped working, would
> that be a hint?

Possibly. If the PMC driver did send the hint but the PMFW didn’t act
on it, that could explain it. However, your earlier logs don’t
indicate that, and the PMFW response register shows success, so I am
unsure about it.

Thanks,
Shyam

> 
> Antheas
> 
>> So, 1/3 and 2/3 of this series can be taken.
>>
>> Thanks,
>> Shyam
>>>
>>> Thanks in advance,
>>>
>>> --
>>>  i.
>>>
>>>> Antheas
>>>>
>>>>> Thanks,
>>>>> Shyam
>>>>>
>>>>>
>>>>>>
>>>>>> 0xF14 index is meant for 1Ah (i.e. Strix and above)
>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> Any idea why the OS hint only works 90% of the time?
>>>>>>
>>>>>> What is the output of amd_pmc_dump_registers() when 10% of the time
>>>>>> when the OS_HINT is not working?
>>>>>>
>>>>>> What I can surmise is, though pmc driver is sending the hint PMFW is
>>>>>> not taking any action (since the support in FW is missing)
>>>>>>
>>>>>>>
>>>>>>> If we get the idle mask reporting working we would have a better idea
>>>>>>> if that is what is reported wrong.
>>>>>>>
>>>>>>
>>>>>> IIRC, The concept of idlemask came only after cezzane that too after a
>>>>>> certain PMFW version. So I am not sure if idlemask actually exists.
>>>>>>
>>>>>>
>>>>>>> If I was to guess though; maybe GFX is still active.
>>>>>>>
>>>>>>> Depending upon what's going wrong smu_fw_info might have some more
>>>>>>> information too.
>>>>>>
>>>>>> That's a good point to try it out.
>>>>>>
>>>>>> Thanks,
>>>>>> Shyam
>>>>>>
>>>>>
>>>>>
>>>>
>>>>
>>>
>>
>>
> 

