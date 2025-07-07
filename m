Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF65AFA9A6
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 04:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF39910E3E7;
	Mon,  7 Jul 2025 02:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A8WQT4DR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFB610E3E7;
 Mon,  7 Jul 2025 02:30:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1vpiSGEMbbDTtgep9HeKN4OIAqkhpo8QkD7gy9EE+pdcMgCsDjgm9RhQUENfpwgld2t3sbtSs6IoeHOG0v5u/UJ8DV4drC6qGoHNXER2AMt1NTn6HIvuyZEcxIC+idHsOj/8xtpknmk4Iw2FHREJ86GzGN3q/3eEnSfOhR2/lzm7D53OL4fUBeKyJknf4F88vJ/SexPtKBPBdjpu37NjFERpql7d2Yprs1/bwW6HRKJRyvWUILQ54ofbLAWdJg4wqFvONPS38eQXFVqBTKDYIYcxqsWxASJvk5350altEUhJD7WGs8E+f8uGovT2UsbVi8DL6vjxGfNPmko0DILLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51GGSdbCYYBk0jid1mqD9awAYAm1d24ABkjC36zWYvE=;
 b=bacP48U0CheMKfVItF712fiySsEsJaBOAjEHAWGVrEf+2KjwBH+/CpPWBd3vW4bWZXcDXHj2JaC+317IK1e+zNQKPQilbVX1+C/BoF13RvghMqv//n8tDnub0DyLwsRmA5FSUTOCdjiazAejDYvOIYi3WNPIre7j2A7qxHHLPFq0r7HmD8lzewDa8Z5b+iQn+Avgj8t7lN0ycOhZKOoe6uKyIViWmI05FXHN8Ck90LQGjIe18P5AmMFc0gr/TbZw+UjJzdUeqNotL3BmmOibP9QSh/FcGje+PbNhjkpGbMGv+eGQzaRc6k9/DwvdQZs8gV7JBi2LptJ1duFOLGnkEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51GGSdbCYYBk0jid1mqD9awAYAm1d24ABkjC36zWYvE=;
 b=A8WQT4DRO7xq+yNhCGkJCkkIys27mJpfMEZqKBo2v3EZX2Q1Rc5Iw2IH9bYC64tvAbXoNyv3qt7hqglQ5M+ng4YjSLuIEGBxixFrGxF6kdWgyBhOvN+WDC1lZyr8SzniJwpk9VPEmwxrgZbBcPj1JfXlsbn+HXIbJXEtlqiqVno=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH1PPFC8B3B7859.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::622) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 7 Jul
 2025 02:30:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 02:30:00 +0000
Message-ID: <733dabc9-8a5a-4e3a-99bb-e67cd36428f6@amd.com>
Date: Sun, 6 Jul 2025 22:29:55 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: "Lazar, Lijo" <lijo.lazar@amd.com>, Samuel Zhang <guoqing.zhang@amd.com>, 
 alexander.deucher@amd.com, christian.koenig@amd.com, rafael@kernel.org,
 len.brown@intel.com, pavel@kernel.org, gregkh@linuxfoundation.org,
 dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: victor.zhao@amd.com, haijun.chang@amd.com, Qing.Ma@amd.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
 <20250704101233.347506-6-guoqing.zhang@amd.com>
 <c847783d-eb92-49aa-919c-447cbc34baed@amd.com>
 <5f944f42-d631-4435-985f-c47944f770bd@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <5f944f42-d631-4435-985f-c47944f770bd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH1PPFC8B3B7859:EE_
X-MS-Office365-Filtering-Correlation-Id: daca20a6-5f11-4bba-1b34-08ddbcfe2c52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDRPdGdBWW9qNEhLalM3MlhuSzlqb1JsVGZ1NnV5dFBvY1V6U0hFYWs5VE5a?=
 =?utf-8?B?YUhZZ1RsYnVTRXZVb1prYllGMjNRSzRmSDZyNXlzNFcyMDgyZDF4VkRaUDJO?=
 =?utf-8?B?d1I0VVpkRncrd0p0R2JvczBmWXY1RTdjR2dXUEdPQzB2OE55WllDNUk3MStu?=
 =?utf-8?B?QVhETzhpa0NmVjdRdG41L3hDZmJ5akRIQ2VEOWFFQUFSM2pLcTlWbzh1dzU1?=
 =?utf-8?B?czk1SWh4SWxyODFRRVltczZEd2ZFcnI2MlNyeHoxQzdmRFE1SlJ6bWZkSFlI?=
 =?utf-8?B?UFZOSnhmQ01xQk9IU1JOajNwSDV5YmRxeHJjdFJ1S2ZSK0FXaVdBZlVNMVln?=
 =?utf-8?B?cmhTZlNueUVqTjFIdThvOGpYZXIzb0EwMlZMcWowdi8vN1dwN0dCeFFtTzk0?=
 =?utf-8?B?Sm1KbzV6M1RxUWdTc2g5Ykx2a0t0VDZ4T1NXSXBmTnQ1VHRndDJQai9WTXRx?=
 =?utf-8?B?bkdWMElEWEJjVXpVb0ExSklGWkVQY0djWkFFckhFdS9id3pIT09IYmt0bmJp?=
 =?utf-8?B?dEoxM3YzVDhBMDhnTGFSNmxLdFgxd3JYQ2pmNjM1dlN4WUlJLzIwRUF6L1gv?=
 =?utf-8?B?RWM5RXg5d1RkZERhdUpnVTd6VnZaS1R6Y0lSV2Z4MmJocnlrc1g1b0FmU0VG?=
 =?utf-8?B?UUVsK0JjWVpMRGVaeVB0MENWS013QTR3ckVGdDdQWXp6NEV0NUxVb0VObVNR?=
 =?utf-8?B?aktvNWpiaTNjcTZzY2E0aTlrdFhjTTgzNUFsQkZFR2VCaW84dGl1VG0xQVdh?=
 =?utf-8?B?NEFyRk1rY1J6d21zZmx0MmhYQ2lrVFZ3SXBsVGRLYjR5bnNaNnloL2F3cGxi?=
 =?utf-8?B?aEFkQjJadHhzZTBONmRlMVpOMjBIU1FrYm01d1hxMWY1RUFiVTAzTE9WcERL?=
 =?utf-8?B?NEdWRkxlMVFUUFByRmUxcGE3UlJpRVJXeWZXelV6eVJHMVNZM2c4WU1memlM?=
 =?utf-8?B?NVhheFBYVnlkOVVNZzF1YklLejl0eEtmaUdXRzhadUJ6K01PVEpZNjAxNzhB?=
 =?utf-8?B?aEtnUmsxNGpCYlNBKytsZDVVVWVDUXJKN0FuS0V6NUhsOXF3SjJxVDd0NjNM?=
 =?utf-8?B?dGxTa1k3dVA0YitVOW9TOGVVVFpSNGtoVG1nMHlydUJDNWhzTExrQzlKMXRP?=
 =?utf-8?B?THMrcEFqMmhTVHNNYytNem5MVWc5SDBlSjNMZ0FidVFyUjZxelR3V1M2alRV?=
 =?utf-8?B?M1NGWkZhRnl5bG5nbFg2M1lKRVJmZlRtU01lUStkU2Fxd0tMSE4yZ0ZFcFBH?=
 =?utf-8?B?bHRtVEdONXhnMFJEc3RLWEo0NjQxSC91Y0RTUFlISlplYjRhNW54dDhKMkNC?=
 =?utf-8?B?WmJPQTAwY1JIZFB6ME1zN3YvZktlYm9nc08wcVRWVGRnbVNoallrNGlYUi9Q?=
 =?utf-8?B?ZE0yL2xuaGZyall3VzRhZEFUYnovY3hNWFBNelV3U2JqNEZvQlE0TVp3SFBX?=
 =?utf-8?B?c0FueFo4ZGVsdXJ6Yjk3VVBlVmlGVW1YL0FTRnJWRm1Sc1QxSWY4RkV2Ulkz?=
 =?utf-8?B?OUQvNXFNWUhmUmtiYUM1d25wTVlpazFvVmQ5NjhPeDFqWmFNemlyTnZZUHVI?=
 =?utf-8?B?MGNsNlhqSitndUdaUzVYWnJmeUhYWXkrNjRpdWFXajRjWGRGUmpUY0tRRkRN?=
 =?utf-8?B?cWZKT0tuMUVvR1JOOTlmcER5cGIxVU5XRzdwdjRZUmhoM0JWbVVoRWZ0eHAy?=
 =?utf-8?B?azBwV3dkUURUSVdlS1RTZUVUN3VRMEk5MHhOTTBSV2xDRUVEa05sTmhYTmF6?=
 =?utf-8?B?WDF5WmRtYy9CVnlLSjAvblZib1B4SzdneDJHRjNvanFwNW5JL1hKK1drWWxT?=
 =?utf-8?B?K3o5UzFJdEpVR3ZJMGRndEJvblBZWTA3Zmw4M1FobFRUdENZMmRzNmFlTGdJ?=
 =?utf-8?B?VXp6WHQveTFTQm9RQ3Y5bXFMS1NQWitzZ3FaWDFSejVueVIvbStudlh5RDFE?=
 =?utf-8?B?bDhXSnpnOVk2YmJSUmU2Ny9OWENMamZzMXZTUitxNnpyeVNoMy8yTzY2K3F1?=
 =?utf-8?B?WFZIOGZWeFpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1NFTUZEUWE3U09QamE4MDE4c1RiK2ZNa1E0MEd0YXJPVW80M1UzTkh6b094?=
 =?utf-8?B?WDNwRHdETTFTeVpubVY1M2U0bUpsZDFlYVJBM3J6YW9qZ3NPWDZEcWNEZUZl?=
 =?utf-8?B?bVFBSjZpc0thcC9sVmwrV25rUnZUMmdYSGRpOXkvenlsb2JCTWRYZDA5NmFt?=
 =?utf-8?B?UTRyL01oRVJHMjhNZVZ1eFVhN2hzUTkvcE1teDIzTCs5R3JncE54OXlKTFZP?=
 =?utf-8?B?cC9xUVJlRUtJV0lLV2UxWXFhRG1BZk1Ddy9MRkJpNlRpNGxhTnArRGI1ejNR?=
 =?utf-8?B?cFlGMDRwZy9nYzMzVGpMalNFSVpnMk1MZGpaZnpiSGJJVmE4UVlNWGtTU0d5?=
 =?utf-8?B?dmpTdmlsMXFUV3VlY3Z5dzRhZE03Vkk5bFJ3enFHQ1k1MWJUNzVhZGU4Zkd4?=
 =?utf-8?B?c1ZBdXJHV2l6dmRxTjJSNTBFSjRTcytCVFJ0dnFPOXVrQXM4VmVLRjFYVFZC?=
 =?utf-8?B?aS9IUGlINkx6ZXYyVGRyb2dNWlRlei9kSUlWcTRkTGdrUzhvVmw2Z2s2UDF4?=
 =?utf-8?B?elNpOVkwWDVNNlV1emhlMEFnbk4za3EzeTVYVXRNY0lLRzBMUG9RWlFKRnRI?=
 =?utf-8?B?VVh3OEFZNnVHR2pTUk9tOWQra0s5cUxWR28zT3p5T3BHakpyMXhZZUlkZGc2?=
 =?utf-8?B?WUlvcmk3TU0yRHl5VUpFaCtuQnk1bzhnVXhtR2puM3NORUx1T2diUkM5Q0Jm?=
 =?utf-8?B?R3IvN2ZSNVBoM3MreU5DcTZiaDRkLzRha2M4aXJJTlpWUlQzTzAxYkdCYStr?=
 =?utf-8?B?VkpUVDhSdUlJWU9keG10MlpiWmxPL21Bc1I0N3grVXg3N1dXU1FGT3dJemFi?=
 =?utf-8?B?c2taN2pPWmk3VUc5VURkM2pZeTFwTjF1Nmp1WisxQ2NBVGM5a25VL25MeWpl?=
 =?utf-8?B?aHZDelpnN1IrdTVhVWZ6YkVaSjc3OEVlYUtNUDM1cXlGY1dwSkg4Z0xudVN4?=
 =?utf-8?B?RDJCa1MvZGZCWTlrUjcwNmhkL1dyUnpKUW5iZ1krTU5NQ045Q1l2eEJtRHFN?=
 =?utf-8?B?Mm1ObTNJT3B0MnFMNzVJb0lVWEdiQUZJN2lQN0ltbWY2ZFNMRkZTdHdhZjFz?=
 =?utf-8?B?ZXJuWlZEZjRMdnl3bjRkRmxNU0k2RkFrbU9uam5EODhKVUhwVVhZUVh3VTU2?=
 =?utf-8?B?VE9OOG9xVWVGUVVtRStYcm5PcGhPWE5Wcmh5UkJreTJQR3lQZnRURFAwQ25T?=
 =?utf-8?B?bjI3Z29oY3E0VFFraDl5MmthZVJ6b1h4TFI2b3ZXNmMzNUVNWWNjTE9aZHRG?=
 =?utf-8?B?bGczcEJ1YVVXVVZTQnFSU0YyeGIxZ3hJMFI0OXFmTHJTdm9oUzFucWlUR0Vy?=
 =?utf-8?B?Um95eXpXSUJMdHdseExRbGRsZm5Ma3ZjS3B1TG0yaUlMTTY3UVUxMVAxYVJ0?=
 =?utf-8?B?TkE4SGU1T1VjR1Z3QWg5MEdISWgvRDVYTSs1OThmTHZiMExyc2kxYnJ6bmh0?=
 =?utf-8?B?RTVpUElqS05xU0laZ2R6c1RydmcyeVNYZnNkYytGMmF4NjdHUkw1MXdZcVR6?=
 =?utf-8?B?VFhPNmNaMVFuL0JsOWFydk9GUGxydFpZVGJjM2ZQdHBwVndGa3lDMmkzaWNq?=
 =?utf-8?B?RGJEWmRmUm1pSXU1ZTVvQ1hHMWhXZWxhdURZNHEySVB4aGVLSURwUnFQN3NC?=
 =?utf-8?B?OU9SYkJrMlhhMkt1N0xNa2VkNGhJTzhyVHI1eTVqMGl5TkZaek9wVHd6NlNG?=
 =?utf-8?B?NGlnOUE1c25IaEpOM3lVbXZaUGVvR1BvMGkrMUlaRDlOOWlyeVc3SlJKVVJ6?=
 =?utf-8?B?SUJ4b2lOWXVXOEhnK2VxNytIL2VOYytycnNtV2tKRFVFVEh5dkUyVUViWWhx?=
 =?utf-8?B?dWI5bGJHVkxBQkk3V3QzalY0Q0R4Q1dTMnJmNjNrZWRMZUJMcU40a0RFdS9n?=
 =?utf-8?B?Vjl5eVNQOUlqc2NCL3Q0eVp3alIwTTI3SVppMXQxNXFsZnZNRjZHeiswTFMw?=
 =?utf-8?B?OUVMcnpPc3RTMG5XOUdLVFF3QkpKYUxubWR4Rkkxdlg2Nk1qdHF4eGQvQ29M?=
 =?utf-8?B?WlBPMmNCSVdHVWsvNllSVmFtVjFIQm1vR3ErTjZ0UmpGalNYbnlocHJyT1Qw?=
 =?utf-8?B?QzZ1bzRFaHExOUc3QjlvL0dvM0oxK0FlaFlMOVBxL2l2dkMzUUxXeXlXMlpD?=
 =?utf-8?Q?+k64wjgokd/UPtpotPCUSAraG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daca20a6-5f11-4bba-1b34-08ddbcfe2c52
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:30:00.9220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvUgqx0zx2xpJ2dOw02uPgCBntcH3WD+58VKC5KiF16ix5gGZ3mWDzs7xL9CEaaT0Fkk0KCXAyQb9FXXSDCa+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC8B3B7859
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

On 7/6/2025 10:28 PM, Lazar, Lijo wrote:
> 
> 
> On 7/7/2025 2:04 AM, Mario Limonciello wrote:
>> On 7/4/2025 6:12 AM, Samuel Zhang wrote:
>>> For normal hibernation, GPU do not need to be resumed in thaw since it
>>> is not involved in writing the hibernation image. Skip resume in this
>>> case can reduce the hibernation time.
>>
>> Since you have the measurements would you mind including them in the
>> commit message for reference?
>>
>>>
>>> For cancelled hibernation, GPU need to be resumed.
>>
>> If I'm following right you are actually handling two different things in
>> this patch aren't you?
>>
>> 1) A change in thaw() to only resume on aborted hibernation
>> 2) A change in shutdown() to skip running if the in s4 when shutdown()
>> is called.
>>
>> So I think it would be more logical to split this into two patches.
>>
> 
> This is doing only one thing - Keep the device in suspended state for
> thaw() operation during a successful hibernation. Splitting into two
> could break hibernation during integration of the first part - it will
> attempt another suspend during shutdown. I think we don't take care of
> consecutive suspend calls.
> 
> Thanks,
> Lijo

Got it; thanks for clarification.

> 
>>>
>>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/
>>> drm/amd/amdgpu/amdgpu_drv.c
>>> index 4f8632737574..e064816aae4d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>>>        if (amdgpu_ras_intr_triggered())
>>>            return;
>>>    +    /* device maybe not resumed here, return immediately in this
>>> case */
>>> +    if (adev->in_s4 && adev->in_suspend)
>>> +        return;
>>> +
>>>        /* if we are running in a VM, make sure the device
>>>         * torn down properly on reboot/shutdown.
>>>         * unfortunately we can't detect certain
>>> @@ -2655,6 +2659,10 @@ static int amdgpu_pmops_thaw(struct device *dev)
>>>    {
>>>        struct drm_device *drm_dev = dev_get_drvdata(dev);
>>>    +    /* do not resume device for normal hibernation */
>>> +    if (pm_transition.event == PM_EVENT_THAW)
>>> +        return 0;
>>> +
>>
>> Without digging into pm.h documentation I think it's not going to be
>> very obvious next time we look at this code that amdgpu_device_resume()
>> is only intended for the aborted case.
>>
>> How would you feel about a switch/case?
>>
>> Something like this:
>>
>> switch (pm_transition.event) {
>> /* normal hibernation */
>> case PM_EVENT_THAW:
>>      return 0;
>> /* for aborted hibernation */
>> case PM_EVENT_RECOVER:
>>      return amdgpu_device_resume(drm_dev, true);
>> default:
>>      return -EOPNOTSUP;
>> }
>>
>>
>>>        return amdgpu_device_resume(drm_dev, true);
>>>    }
>>>    
>>
> 

