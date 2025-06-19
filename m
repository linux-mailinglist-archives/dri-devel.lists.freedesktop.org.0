Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D855ADFCBB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 07:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CF6110E988;
	Thu, 19 Jun 2025 05:07:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vUiDMW6y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A30610E988;
 Thu, 19 Jun 2025 05:07:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuX15+GaHErtuNxmpROWEq5lYP/vw+WbeGQtZJ6fJwXkDnJlVxImEnywvl26rVXF0WR+FkHm/W3fQ8l70T2DGsI/0/55MMzOh2PBVhFyQ6+NDe4pxuHvyOo3RyUteahgvA6YKyoEceLPRwUwij+3jw2r1PQCx4lI1cbdm25/u6N2pF1fUvjByRrOU+TE4v/B0xj/294nxFsMSTXgNLYlcmFwYicBvnbPRgF/+I7QyICCskiDWrEW9CLlkz+hptLnwlXGJoC6q6pen8kKWTki5GwtwyC2y/IIMEL9nmTxrtJAh9wUo4wW/a5OzcXMU1ye+zJ6BHCCBZtu1WXTR+3f8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRoYK5p64BHHzaZ2W4aC5jT6xs6N3sR+FxXgVczyNwA=;
 b=ol2d+tR6MGuteKF2tiiDXUIo/UeYV/iMi2ICA6PMgsZzFIfcl+kZgKpaEdxqLzfpd3Og7H28eTQyCp98UcgEQNQbD93B/L2vlkxGAJKxf8DHLrdX50uf3kXxkSLbcqPEiq6xveeYjGOaPyioplMLM3r1n/pgvS75Fh5haVC/BHS9XP4k1BDk9rabUkT4grRd27C0k/FfwW0kXUDHW5E+pS+B76VsjEa8leT6/j45eYyIpk0Szy/H9Wt7i2M9TDRRqlT/3gKiGgkMpPl67hHYw/Aw0sYpRcxF/nrElOHQq6UVzoEG1yaQBNaJTssiUfLSXguUYpSt1VEl8AyPn7JdAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aRoYK5p64BHHzaZ2W4aC5jT6xs6N3sR+FxXgVczyNwA=;
 b=vUiDMW6y9GwfpWX7MsorQ0UyQtBtADxZJHlN4USgZSosOUDwaVQTNQnihWAnvhiLekGpJfclzErSLMoubbXYB0q6qgVTuLgGdv8IeaM1OFYBtGYHeiHJ2jaa5T5HRzdWUXCAgzqvEYSccZkJRhe9UwWXbMgWHfgoVvntqixhcy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by DS5PPF5A66AFD1C.namprd12.prod.outlook.com (2603:10b6:f:fc00::64d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 19 Jun
 2025 05:07:29 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 05:07:29 +0000
Message-ID: <3e1b9a3b-9a38-4f48-bbae-26faeeed6f42@amd.com>
Date: Thu, 19 Jun 2025 10:37:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] drm: move debugfs functionality from drm_drv.c to
 drm_debugfs.c
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250618134747.3893138-1-sunil.khatri@amd.com>
 <752cd912-b4d2-4ca1-84f4-70aa95c4e97a@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <752cd912-b4d2-4ca1-84f4-70aa95c4e97a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0244.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::13) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|DS5PPF5A66AFD1C:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d42ee5a-29f4-45e9-4980-08ddaeef308f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ei9udGF2eEpRVzJ5ZHI4RmtwRHFUaVZKT1FMZXF3djZ6R3NaZWhyUnhVZ1hx?=
 =?utf-8?B?QTZnakVJSDBpZ1RtRUlDMU9ZalBTeFVBYzFhZ2V4bEpVcERpREdHYjZBa3ZB?=
 =?utf-8?B?RnpOamtXazJGWlhoUTJLMmlmU0FFTnJha2VBdTJKQ01oSm02VkZwbnRTRXFu?=
 =?utf-8?B?MWxMZXQzY0ZVczRsdkJIN3pDZTNSSzJTM2ZKNVNkS0s3YUJpVTNCTTQzNmcr?=
 =?utf-8?B?MW45b1B3ejFiSjF0NHVHdExKUUtxSGI3Mys1VUlIRWJRbGZnd0hMUzc0aTV5?=
 =?utf-8?B?TDF4YjNERHRoZTZqM29ZMHBzdkRhNFQ5V1hkUE9xUzZLL2hVTXpkdldyRHly?=
 =?utf-8?B?VXBmT1lrQ3ZpRzBrbGlPRHJwWmpxZGcydVU5c3FNWUxaQ0VWdWFrcEdJY0Fh?=
 =?utf-8?B?ODlkVnpibjZvME1XM1E2bnpyT3dHc2Y1U3g2bFdIQUtXdkErZHZmVVltVzZF?=
 =?utf-8?B?eEV4MW1pV3c4QTN1TUNseHRuM3J3Y1BzWFBFWWFvSm1ZZjlmblBYRnlEZ1pQ?=
 =?utf-8?B?RGlUeU9YZHduMXh6blhTV0dxQkhpS0FtbHZIQ3RwR3ZHaTFoUTBCSUY2Um9r?=
 =?utf-8?B?d0YvbVI1QTg2eWw3SE1nQlFGY28xMnY0UndWQ2lBZ1c0bms1bUdkQTZRc1Vk?=
 =?utf-8?B?Nk1Sbng5RUhHRXpWUHZsdmtzNncwcWIraUdSSzc4T3dNY1VQZjczK1dWV1lJ?=
 =?utf-8?B?VUdWclBPSnJrWVpnTHd1WDhpUm0vTlVuUDdaT3k4MGFQUzJMbFp4VXdhUUIr?=
 =?utf-8?B?amEzYmllUUJTWkQrR3kzeS9Zb1RpckFWZUlSeERTeVArTEF5YUNienEwSVlL?=
 =?utf-8?B?MFNzSUMrVlBoU3d1dEJoUklFU1BXYmhpYnZiWVVVaVZ1ZFJrajdQUE5ZOUxt?=
 =?utf-8?B?UzRMU1dnaUQ2TW1OK0M3bXNQb1NqRlhkUGJuTHk1ZXBrWWREMlVzRzRBU1dR?=
 =?utf-8?B?ZmtTdjhoSldZMnB3bjBlVlR4QkxhRlRsN1dLRG56ZUpENFk0cUlrSjRqc0Rm?=
 =?utf-8?B?YnB5c0ZjdGwvdUo0anF1M0IrdDE1NzNtRmxKZ1daL2JVZ05kdjh1eWZXVnlx?=
 =?utf-8?B?VTBVVXllYitxTVpoYWo2MUxCekx2blpUbXhzRm9FVCtsdHJQNkhYNmRPVGpv?=
 =?utf-8?B?NFhhdE1LcGhCQkVjOEcrL1NtZWtqRytGN0tyUW9MMTY0UlRaR1U2RGdHdFNT?=
 =?utf-8?B?azB6cHE1MlF3dW84TTJCMlJJVkdVRGZ4RDl3dTBScUllTkhTQmRvcFgrNGdJ?=
 =?utf-8?B?K2VrS2lkNTlNTHM3OXdmdmVpeHZhYjMwYmNIZXRTVkcwbGJLeVFKQkpVYzdm?=
 =?utf-8?B?V056aHFCNWw3QnRLTHJpcmpFQ09RTnVQd0dYbEdRL2grYlhuTzdsWU44cEVY?=
 =?utf-8?B?cEFQbHlpRUd6V0lzMjlUWVo5T1M2bXVVMWFLaVZOVFlvUC9pQStMT0RTNE0v?=
 =?utf-8?B?U2ViTVhLc0YvUUgvLzJpR3dBYVBXSDNzeWluOWNISm5xczJsb0VhUUlrK1hv?=
 =?utf-8?B?MG9sVmNrdGV4VDBRU1Fkc2xrbWt5Z0hDVEIvMnF3TjlHOW9IRk1pTmVoeUp5?=
 =?utf-8?B?ZHh5MjJrQ2orTlVkS0FINkdOUDhLcnhnekFvT0xQeStTUVAxd3RZUU52dmF3?=
 =?utf-8?B?VmJwZEloLyt4REZ0SW5ubk04Y2NZWmRNSS9zaWNNWGZ4VE9zUEV6VDVrVDBv?=
 =?utf-8?B?MW9uSEZ3ODk2S2F2em8rWHpsUHdjaVFPZFVtRTQ1VnhkTXg2Z3JGdHdZTmpk?=
 =?utf-8?B?U0llc291eW0rSTRFYVJJMUtIeW53RHJaN3ZQUmdGZEZtTVZvSDFES1RhUEUx?=
 =?utf-8?B?bkRlY2NRQWNOeUtqaGdQd1E1T0dTS1NYOXFWWUhxSm95c3psMUtLb3d2NUZv?=
 =?utf-8?B?VVJ4SkhlRTlyZUdnVEIzZnBpV1BLSUcxMDk2czY0bFJkZ0NZL0xOVjdwWEYz?=
 =?utf-8?Q?MtX8ciJR96A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTFuUjZ3K1d6RWYwUmNqbVlEOWZZYm1qYjhwbkJzYlROYTJYa0hCOWdLUTJz?=
 =?utf-8?B?OU5qY2xxRDhYQUJqRHlWTUNQei9rRGNYRmFWSldJOWY3d2Z0MzVPT0dCYW1X?=
 =?utf-8?B?alZkMFRCUGZhOUZYd3pwbGN6YUdML2xobmpjS2MyTW1XV0xzVFVHMy9pcDdz?=
 =?utf-8?B?MENOQmU1THdVa1dtaXQwSWxEb0xPYklVRkQ5eGpQMTRmREw2VllNY2pxVXhH?=
 =?utf-8?B?bEp2SUdpUnA3LzRaS3JCR2l2U2VSQ294cGtPVmpwV05tU1FSTzVuYUsrZkdI?=
 =?utf-8?B?VVExQURwTFlVdnFEVnVpSXpuRUQ3Q0w0YjhCMUtrRHdOYWxnTVVJQWN2cml2?=
 =?utf-8?B?TWZwS09jTmMxdDM3LzJDRDJwa2FONnE1WlJJdWROajA3c1NFcnF5UC9NYXR0?=
 =?utf-8?B?U0U0YURpbWpMc1d1Q1lNTktmU2tuTHhhK2JITTd1RGh0T3BRZ2Q5QkEyYTZw?=
 =?utf-8?B?R25ubGY2bkpPZmZ4dkZoMUVnQzB6SnNSY1VlNnFoMVdrNDF2VEI0TGxlU3VO?=
 =?utf-8?B?eWlOdldRRGRPNVVFQmxVL1V6OWZIMEMwczlhZlZ6KzRvck5tMFZBb0tPd1Vi?=
 =?utf-8?B?RHBwMzFtVzJ0aXl1TmxDTU5qOEE4Z29TSEE3TEltaUZrY25VU2JoYmNjbGZS?=
 =?utf-8?B?VERTclh5Mm1LZkNDYVNOOUl2WWZVUkhZKzNzd3V6RncwVUhoWW5CY09BTlFx?=
 =?utf-8?B?UlAvdk5FRVZHVWNwYUdpVlhGWC9uQk1RdHR0bWhFK0w2Y3pjbk1tZEhrUVNm?=
 =?utf-8?B?TUt6ald3bEtzaFBVU3VFTlJiMWh2bmNxN0xwTlFjbWlzU25tK3QyaVJRTE53?=
 =?utf-8?B?cTJONTloTXdXNHR3N083cjlRb1IrSmhwM01NclpOMHV3SjRJTHhwOEFLNzFU?=
 =?utf-8?B?c0pjemRsK0MvZ09kVWJoSVdMMktIMXhiRjhOTGVwMjZmcDVQVWhkeUppQng2?=
 =?utf-8?B?cmZQcWxyMVAyWDFDVzVmdFMvNmVua1lnSnI5TUdiWE9jS3FSenBJclpRQ0dy?=
 =?utf-8?B?MndBZmNOQ1BhVjdPTDlVL2lveUpDSGsvcVUwb0YzUnV2NEgzUFBSWEtoZHlX?=
 =?utf-8?B?YlBsdmZFTkxVTVpQclhHUXFYcDlQMnFFRlpicXA0MWpOMkhRR2lNbm1KZlUy?=
 =?utf-8?B?Z2R0LzgxZlFlV1RKc2hVZ2V6M1lMRjc1bjlNSnBSWHl5Z3kxQ3d2Y0VFMlZZ?=
 =?utf-8?B?L1h5NG84emsweXBRc1RGQ0lTcjYxZFJhT0MybTAxeEpzK01nWFROem93dzh1?=
 =?utf-8?B?Mm1pMkZpalozZXlldDVMdHlWQk9xNkZiRXFYMng0VU9CV2lNQ0huUXpteVNv?=
 =?utf-8?B?UC9ta0RYSGVXOXozbHVZSmp6SkdWd3RGL2hDWXVFZ2t4cjFaUUhFS3EzaUx0?=
 =?utf-8?B?ekdHbFNNUFltVStaY09qTGhmV0lKUVVldUtLR0p6NjAwb2J0TXNPcTN5V013?=
 =?utf-8?B?VXc1RUhDQVk4K09XZHRyRmlmNEszSkZVYmY1T3JpU2ZYNnh6VUxyWGtkUVRB?=
 =?utf-8?B?SE96am5ReVVEaUZqUE9FSVlNdHJtWmJkZ3R4dzNxTVZTMUZpczhLUXJSWEUx?=
 =?utf-8?B?MStSVTBJUzk1R2MxU2plYkR6YkU5U24ycW9YY1h3YjJndFJhT3RjaytRb2Fr?=
 =?utf-8?B?a1ZTcmszOHVzR2x2d0kwNkJFSk13WVJ0VjdLR0VPc0Z5dTdOK2tMOVdpNWxW?=
 =?utf-8?B?ekFPSndDZjZSNjVRU2RvNUdROS9lVHlLMTRhNEY4M3RGalE5RkNrRG1UcG5B?=
 =?utf-8?B?em9CZjJjd3lIQzc2QlV4RmZoZTNkdGhOZ3ExSm1KYlBiRS92bmVHc0JlV0JN?=
 =?utf-8?B?bk0zUi9lY0VIZjRvVmtVdFBHUStJZEhPeHc2UTZKTUVHTkxQMlAvaGhObUdt?=
 =?utf-8?B?bkxPaHZkMm9kUDBaTGZKOHMvU0FaZkErZTdFMDJRMjFMNzVPaVRSRklEOFM3?=
 =?utf-8?B?SzRDNDg4dlVOMlMzMkFBQ0s1YWo3bGovaVZDMTlmQlpSWTZCRUY5bkVxeUNH?=
 =?utf-8?B?MTl0dUl4K3ZtTXRGdTVDMEpKSTczNklOZ1VzOVJRL252ZmVmcVBpTHFNUlg0?=
 =?utf-8?B?QWtWd0RxZFNhWDJhb2duWVJWY1NsN2pZQnlvVUcxYmlOUzY2T0U1L1lvd0NP?=
 =?utf-8?Q?3Ld6veYGLazZKLbVUBipQN7sF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d42ee5a-29f4-45e9-4980-08ddaeef308f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 05:07:29.4570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJk+3s5vdVNBqBtePLkr8ZtdUmHhNR2eFvmIK1InAE4RHopJTPUG5C4kr8CSwFzuteIKKBGfsVBm3w3ZUgGowg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5A66AFD1C
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


On 6/18/2025 7:38 PM, Christian König wrote:
> On 6/18/25 15:47, Sunil Khatri wrote:
>> move the functions from drm_drv.c which uses the static
>> drm_debugfs_root as parent node in the debugfs by drm.
>>
>> move this root node to the debugfs for easily handling
>> of future requirements to add more information in the
>> root directory and one of which is planned to have
>> directories for each client in the root directory
>> which is dri.
>>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c  | 22 ++++++++++++++++++----
>>   drivers/gpu/drm/drm_drv.c      | 11 ++++-------
>>   drivers/gpu/drm/drm_internal.h |  6 ++----
>>   include/drm/drm_drv.h          | 10 ++++++++++
>>   4 files changed, 34 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>> index 2d43bda82887..5a33ec299c04 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -44,6 +44,8 @@
>>   #include "drm_crtc_internal.h"
>>   #include "drm_internal.h"
>>   
>> +static struct dentry *drm_debugfs_root;
>> +
>>   /***************************************************
>>    * Initialization, etc.
>>    **************************************************/
>> @@ -286,6 +288,16 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
>>   }
>>   EXPORT_SYMBOL(drm_debugfs_remove_files);
>>   
>> +void drm_debugfs_create_dir(void)
> I think we need a better name for this. drm_debugfs_init_root maybe? Ideas welcome.

Sounds good to me.

Regards
Sunil Khatri

>
>> +{
>> +	drm_debugfs_root = debugfs_create_dir("dri", NULL);
>> +}
>> +
>> +void drm_debugfs_remove_dir(void)
>> +{
>> +	debugfs_remove(drm_debugfs_root);
>> +}
>> +
>>   /**
>>    * drm_debugfs_dev_init - create debugfs directory for the device
>>    * @dev: the device which we want to create the directory for
>> @@ -295,7 +307,10 @@ EXPORT_SYMBOL(drm_debugfs_remove_files);
>>    */
>>   void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>>   {
>> -	dev->debugfs_root = debugfs_create_dir(dev->unique, root);
>> +	if (!root)
>> +		dev->debugfs_root = debugfs_create_dir(dev->unique, drm_debugfs_root);
>> +	else
>> +		dev->debugfs_root = debugfs_create_dir(dev->unique, root);
> Ah! That is also used from the accel subsystem, isn't it?
Yes
>
> Probably best to move accel_debugfs_root into this here as well and distinct based on drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) where to create the debugfs directory.
>
> We probably need the same distinction for other use cases as well, so probably best to create a helper function for that.
I did explore that accel_debugfs_init in file drivers/accel/drm_accel.c 
and i dont think of a clear and acceptable design. It is a different 
module all together and we dont want to create debugfs directory for it 
in drm code. If the module fail for some reason and also removing the 
debugfs directory is another problem. We do not know when we want to 
init/exit the module.

The approach that i used is that drm_debugfs_dev_init is used by other 
module(right now there is one but we never know in future) as well as 
drm itself. The parent node is passed by the caller and for drm itself 
the parent node is defined statically.  So with the approach i took is 
if parent node is NULL its an internal call within drm and we can 
directly use the the static dentry i.e drm_debugfs_root.


Can we move below call from accel_core_init to drm_debugfs.c although 
its a different module all together for accel ??

accel_debugfs_root = debugfs_create_dir("accel", NULL);

>
> Apart from that looks really good to me.
>
> Regards,
> Christian.
>
>>   }
>>   
>>   /**
>> @@ -322,14 +337,13 @@ void drm_debugfs_dev_register(struct drm_device *dev)
>>   		drm_atomic_debugfs_init(dev);
>>   }
>>   
>> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>> -			 struct dentry *root)
>> +int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>>   {
>>   	struct drm_device *dev = minor->dev;
>>   	char name[64];
>>   
>>   	sprintf(name, "%d", minor_id);
>> -	minor->debugfs_symlink = debugfs_create_symlink(name, root,
>> +	minor->debugfs_symlink = debugfs_create_symlink(name, drm_debugfs_root,
>>   							dev->unique);
>>   
>>   	/* TODO: Only for compatibility with drivers */
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 17fc5dc708f4..8abc52eac8f3 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -69,8 +69,6 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>>    */
>>   static bool drm_core_init_complete;
>>   
>> -static struct dentry *drm_debugfs_root;
>> -
>>   DEFINE_STATIC_SRCU(drm_unplug_srcu);
>>   
>>   /*
>> @@ -183,8 +181,7 @@ static int drm_minor_register(struct drm_device *dev, enum drm_minor_type type)
>>   		return 0;
>>   
>>   	if (minor->type != DRM_MINOR_ACCEL) {
>> -		ret = drm_debugfs_register(minor, minor->index,
>> -					   drm_debugfs_root);
>> +		ret = drm_debugfs_register(minor, minor->index);
>>   		if (ret) {
>>   			DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
>>   			goto err_debugfs;
>> @@ -754,7 +751,7 @@ static int drm_dev_init(struct drm_device *dev,
>>   	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>>   		accel_debugfs_init(dev);
>>   	else
>> -		drm_debugfs_dev_init(dev, drm_debugfs_root);
>> +		drm_debugfs_dev_init(dev, NULL);
>>   
>>   	return 0;
>>   
>> @@ -1168,7 +1165,7 @@ static void drm_core_exit(void)
>>   	drm_panic_exit();
>>   	accel_core_exit();
>>   	unregister_chrdev(DRM_MAJOR, "drm");
>> -	debugfs_remove(drm_debugfs_root);
>> +	drm_debugfs_remove_dir();
>>   	drm_sysfs_destroy();
>>   	WARN_ON(!xa_empty(&drm_minors_xa));
>>   	drm_connector_ida_destroy();
>> @@ -1187,7 +1184,7 @@ static int __init drm_core_init(void)
>>   		goto error;
>>   	}
>>   
>> -	drm_debugfs_root = debugfs_create_dir("dri", NULL);
>> +	drm_debugfs_create_dir();
>>   
>>   	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>>   	if (ret < 0)
>> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
>> index b2b6a8e49dda..d2d8e72f32d9 100644
>> --- a/drivers/gpu/drm/drm_internal.h
>> +++ b/drivers/gpu/drm/drm_internal.h
>> @@ -186,8 +186,7 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>>   #if defined(CONFIG_DEBUG_FS)
>>   void drm_debugfs_dev_fini(struct drm_device *dev);
>>   void drm_debugfs_dev_register(struct drm_device *dev);
>> -int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>> -			 struct dentry *root);
>> +int drm_debugfs_register(struct drm_minor *minor, int minor_id);
>>   void drm_debugfs_unregister(struct drm_minor *minor);
>>   void drm_debugfs_connector_add(struct drm_connector *connector);
>>   void drm_debugfs_connector_remove(struct drm_connector *connector);
>> @@ -205,8 +204,7 @@ static inline void drm_debugfs_dev_register(struct drm_device *dev)
>>   {
>>   }
>>   
>> -static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id,
>> -				       struct dentry *root)
>> +static inline int drm_debugfs_register(struct drm_minor *minor, int minor_id)
>>   {
>>   	return 0;
>>   }
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index a43d707b5f36..4e77a0c4a7f9 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -567,10 +567,20 @@ static inline bool drm_firmware_drivers_only(void)
>>   
>>   #if defined(CONFIG_DEBUG_FS)
>>   void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
>> +void drm_debugfs_create_dir(void);
>> +void drm_debugfs_remove_dir(void);
>>   #else
>>   static inline void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
>>   {
>>   }
>> +
>> +static inline void drm_debugfs_create_dir(void)
>> +{
>> +}
>> +
>> +static inline void drm_debugfs_remove_dir(void)
>> +{
>> +}
>>   #endif
>>   
>>   #endif
