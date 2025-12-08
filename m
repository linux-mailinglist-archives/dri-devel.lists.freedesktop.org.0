Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A5ACAE1B2
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 20:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B497510E11F;
	Mon,  8 Dec 2025 19:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H9/3JPrk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012055.outbound.protection.outlook.com [52.101.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8303E10E11F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 19:42:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlLTlO6qH5ihyjuFqsA4jTvEKLWIZa45snJIGKYRngoSy09NZnRqwBlmZLlGirsvcvPSQy/5uWaCr6CmoMhaVfoAAxIuh4mdbvHwGSGFEFD1Mf3476IOXvWo6RXKKfuiL2OhoMbk2R/sItG557iGTbSHF6aw9jq0xBTLiwZSsl4Pc9vhr+BsT6m3sBb5D3VSJ/QV11lmmPvFu7naTdJ16kC0esF+Yr9106QHniPXIAEcW+LaDE3vL0oaCnD6n3X64Y5WSVAbwAbisRZ13L6j9SQFe/RdL2bBqmXGfJ1xWoXs5lITDEUENx5avIWG+nZDvwG9iewr+2UpAEVJg5KyWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HHeWFuP2yN/4Db+qKBuLobOvmlQwlJhtOM9PKUdNUA=;
 b=ncWbVrxTpHTk3ozlMNk5S8Ode86qqHJ8yhFPXT58casz0XL5trxB4kyKyIKskm0k/mUBMyuJMRmBorT3kDLvSbAScWRMFq+YBcfYma070Ns4xBzHg3+rkkOUyq1v4Vos3BG4j/WoHgX4z2wsq2DYEC5vAhKdWpaB0fOqYeD37+MEwTRIOG95iOzpyY4z4S8pA7uwXvUCy9W5AY2wj9HSCx+nFQJLlvDFz6jwEZPWfczv4nxA9tzXFj/4x3rjc1DGTOcFV0nVGjEZWc67+jgZGzDzSHtjhA1bMZocfHeNxSAkWEhoXGnY+aYwK1liunuvR3tI/w4KkqajnXCwxTc/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HHeWFuP2yN/4Db+qKBuLobOvmlQwlJhtOM9PKUdNUA=;
 b=H9/3JPrkD2MELsP7Q0t4rmmqDIO1WjQuMwNmRSAnCx0eaeT6vQznq8JJchH+fcNmPkhSlIvTFx8fEnf2oR5niVfkVSkstXdNNiPKifyiFvCjyCgVc/4uAPuDtpcJf24/I1j/v+DoU+KURIMEtYNsURMyRZXu/aKp9DgjZaj8Gnc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB8017.namprd12.prod.outlook.com (2603:10b6:8:146::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 19:41:59 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 19:41:58 +0000
Message-ID: <b77ce7ec-d73c-4884-a48c-4e76e771b94e@amd.com>
Date: Mon, 8 Dec 2025 13:41:54 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Fix race condition when checking rpm_on
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251208165356.1549237-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251208165356.1549237-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR02CA0098.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::39) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: d2cbcd1d-6e9c-479a-bece-08de3691d9c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDlDSlVjOVc2U25SaG1VYVdHRXM0TEVJV2pCVHlLZS9mb0RjYTVadUY3di9R?=
 =?utf-8?B?a09GYkxCQVBYZ01Oa2Z1eC9lTUVFYS9GTjFxakFkbldrUkVaOVBjaHo3QTN4?=
 =?utf-8?B?UnF1OStkYmxpeG1Pd2dXYzVyS0JHSTBHUkhaRjA3TklLb1FjS1lhRlMvbnho?=
 =?utf-8?B?eUlic1krZXJvT3FOWE50VytwZWZwYjJ3S1BNN3d4WG1MNlFxSmVBOFowSFZw?=
 =?utf-8?B?b1hmNFRkZUZtOVdHbUtGdHhkdzVpbVZNM2lkLzMwMUM4blJtM1JCWlovOE54?=
 =?utf-8?B?SzNkOS9TZExEcFQ3dG9PYmJmbkg4QXhpUkZGT01WRXRiZndHTENmQUV0dy9n?=
 =?utf-8?B?UUM2V3lhTEFNMjlGcTQ2Y2hPUmowWVAxRW1QNmdPNnV2NWRRdlZvWWNyN2tz?=
 =?utf-8?B?QUwyU2dCb0NrVzNSRDBPblpWYlNUWjdUeFhvbTZ1ZmdUOE1FQjJvbVVjeTh4?=
 =?utf-8?B?YnJyajMzTzZCNHBpTkdYUjZaVTBYc1N4U1A4ZDlrdjlaZWdTRWFFTkxFMHFL?=
 =?utf-8?B?bTRpbHB0b1l1MzQ3NTQwekZFVCtwOG0yNk9NK0NGa2dDUDhBVjVRNWtXQWRh?=
 =?utf-8?B?WkNQQXhQUTRsd0dLcUVWeXdiNzVBMVBOenJCS0kySFhVZGlGL2Q2d2ZZem51?=
 =?utf-8?B?dnV5aFV3eFZvMlJvbkN3SndSNnNWS2FjbE10Ym5Da3JnWXhtTkMrUEhHR1hH?=
 =?utf-8?B?dU1LYW5oaXFjamR5UDRMSzFoU0dDNDNRbEFtRnFpZ3dyOUdKcHo2elYyV0x6?=
 =?utf-8?B?aDJ1Q0ZJZkRYbUJRT0VxVXRYSHQ0eTAzT095eGR5aExadGVTeEFKZlpFRnU0?=
 =?utf-8?B?eDZHWmw5c2pkc00rbkdwbmR4UTJDM294YlFrWWJzbWxENGJuQ0xNV1lVYVVX?=
 =?utf-8?B?a3AvdXBSVEg2cHM2eEZhWWMzc3Q5cE5DL0pzTWR0L1NSZGtCMkcza3ZYOXBx?=
 =?utf-8?B?dWVxWVltakNPYmplYVB0NmRPaWgySGJoS1dWTklxN3pUUDM0aVZnMFFuekFw?=
 =?utf-8?B?UG1RZW1jcXo0RzMzN2V0Z0RGTXRERHU4TWREdmpXTWFHa2lIc1cwQUEySGxG?=
 =?utf-8?B?ZnYycG83V1RVUE9LaHNZcURTUm9aZ0dQYjlqUmswdVhmY2l4NmRPQnFTc3lq?=
 =?utf-8?B?YlR2TnlqWXluQjNyaEpPMURQME5TREJ2ZXhCaWp6dllVY0NlYmpOMXJDYXdk?=
 =?utf-8?B?cDc4dnc0TVRWZlAxTWdFL1B3K1F2L1ZMSkdHallPRjQrRENyMjBQU3MyNDRt?=
 =?utf-8?B?cnRCbTRrN3pEOFZXY1JnTmhNZERQYm43ekJ5elJsNnYwTm9MU3RMc0ZWVEJx?=
 =?utf-8?B?UzVQZDlVamw4dkExL3dTRTdCOHhpODBSQ3FHZi8wUXg5YXY4ZkthTWxiSVBi?=
 =?utf-8?B?V3VGUWQyWUJobDQ4ZXd5QnExYkhKNHZ4SkJLUHNhaGErYXFyWTB0ekN2RENy?=
 =?utf-8?B?NmF0R2hoaVlYdDlNMHYreVh0dHFTZlcwOU9zdERQZ1k3c003dkEvK0ZVcHBJ?=
 =?utf-8?B?dHpCUmY5bndYSUJENlFMREVUQngzcW9ZUTN4cE9jR1dmQXFETDRrNWRkYjl5?=
 =?utf-8?B?QWpDeE1VK2s2SkUyMFFaMDJaZEwrWUlRZHRBWFJ5NElTUjExd2ZIYkdVcS9V?=
 =?utf-8?B?RnhSNC82ZUNHWk9LWlFFU2pKcEUwQ2wwL3c3M3F1NnJiUVpUSUpLRkpiTmdp?=
 =?utf-8?B?cEZaRmozUVpvUkE1TE51b3VndXdzVVc2cUcvcnZrRlNuS0I2bjluK3EvV3ZF?=
 =?utf-8?B?enRsd1RET0lCV3A5WmxoRTV5Z1c3T1k3alJRWkpoMjkzcHlXaUsyRTJiSnp4?=
 =?utf-8?B?eHpmekYvZDBZY0lHTFZHUEZNbGNKemxTNG1GU0hUNm9tYjBLemcyUGdLSVdl?=
 =?utf-8?B?RTNuUXljaWRqR2FnVnM0dThZdTlXdmZpdXNoVmZQUDU0dzFJKzVTSklldmla?=
 =?utf-8?Q?YAtvuDsUu09h/1A+Ug10C/TM2Ah/Ns5f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE9uV0lsTXcwNzlrK0UwUlJWVGtCZEdjN1BhZFNYNVQvZGhrUnJoMStabVA1?=
 =?utf-8?B?emFFQ0E0eDlEcDRDSVQyeE1PWGtZOTBvcDBRYzZuUHdnYzQ3aXUzVGJzWnFy?=
 =?utf-8?B?UENaUnpyVnJOZ1c1KzZJdXJWRHhCR2pyb3h2MEpuYmoxOFBQUHQzK0oxZjI0?=
 =?utf-8?B?WmlPcVJVNDZ0S050UDNTVUhjbElxOUVobEIwVXlYbm5mWnJaVUtPcWVMTnE0?=
 =?utf-8?B?S1hJV0hLSHBJbU5CMWNXVUtLUG9NeWVwZzhod05PMURUMzVFcFVCUjNJTXVG?=
 =?utf-8?B?VFdiK2FidFNRbHdUOGZ3MkFvSEtaQm5PaVZuay9vd2d2enhuenZGeVBCaWIz?=
 =?utf-8?B?NnU5K2Zmd01vMk1FWW9vMmVxOU5BUmpYbFkyWWx5a0NkQ3lScGI2Kzhka3N3?=
 =?utf-8?B?RWViR04wMEg3ZE1EZHZ4VHY5OGhPS3h4ZXZzS045M1lrYStESk0yMEdUdUh6?=
 =?utf-8?B?MENOSUVOY3pJY0pDWjIvRDJVMGFEWXFqajVzR0xhMXA3dE5Ea2t3eUpQR1BV?=
 =?utf-8?B?ZGlRQVdKMmIrWXVDK3pReVhUVWF1U1dkNzB0Kzg0c3BJZFJjOHpzRE9KRmNS?=
 =?utf-8?B?V0ZvTVZ4aUpYWFV5OC84UmIxMC9xa0dXMFd2dVYzcXZzRDhwL0ZIc21qWmdX?=
 =?utf-8?B?VUpCTU9LdWsvelFJOGN5aERENmRqNTNNY2taMHhaKzRtOG8wenE0aFd5TWpM?=
 =?utf-8?B?dFUwMmFaeVh5TTBpRi91d2FnSjMwakpMVXFOdXJwTjc3TWpCV3l4djk4OTJ6?=
 =?utf-8?B?ci94RkppZWZCRVRHMzRmd1FrSEVXVmhPLzJua0NEa3JNMWFobnFScDdMQVht?=
 =?utf-8?B?SElPeVg0TW16NzVmdGJQVlBLVk0vU3RnTXZKUWVBN3dNTldRQlJOVmVQWUMw?=
 =?utf-8?B?WGZ5RGR2TklrbzVaMFZuZ0JDazVqTkZQdk1WODZmRndBMExETGxCM05WWEE4?=
 =?utf-8?B?MnkwcGU3MmxTRXBOMFhyM1FXZFMvTGZmL1kxVHQraTFrWUtRcVV5SlVUSXRD?=
 =?utf-8?B?cEE2Zk5HajZlQ2pLNm9uWkxwbWZlZ2c2S2ZTMkZwWFE0eXo0ZFgyTHRvYmQy?=
 =?utf-8?B?MU1adlZ4RTFwbkdJOXFScHNwYXJwSGRZRDdpNEw2d0tDTGhEZXlhQThiUm9H?=
 =?utf-8?B?UUM5Ulk3TERHYjM4YXM0Rmw4S05YbnJnMTcycmQ4V3hFaFV4dGZOeG8yUmxY?=
 =?utf-8?B?YTZ6S3pDOVF2UzAxbVRlcGxlaW91bzZ1dmJUZVExNzVncTJXT1BpTkRFTkpv?=
 =?utf-8?B?Y2pXM21POHlTMElrNzNpQm9Qb21SODJrK0QxazhvZ2plbjZlZDhpR0ZvWGox?=
 =?utf-8?B?ejNJV25BUTlIOENQcU94dVp2OWpCWmhNRUZQQy9DaTVFUFh4SjM2Z0hhbnpu?=
 =?utf-8?B?QmhjNlNGNmp1N2pXaXBOYWU3eHhNQmtEVytML04vTmw1SDVKRFkzTWJYaXlD?=
 =?utf-8?B?RHBGaGNvS08xcmlTUHFhMWI1MVI2ekkxbEFMSkFHdHM1cTdhR3owemJ5K1pT?=
 =?utf-8?B?QUlwQ3ZhL2VadTNHY2JRbmxJUE1sOEhEK0dlUlJRNm5FL2FZekIrS3pIcTZs?=
 =?utf-8?B?Y1lkMWlmOWN6UHZTdTNOVHRsTlZLVjNDWi9HSFNRdXc3RkxzenVZWVVkM05H?=
 =?utf-8?B?UU95Z28wS1RwVXZaRGVwVVlHeHlEczZsQmNXTGRPWm1HWURrNG84TStrS0NR?=
 =?utf-8?B?R0d3MUMwVkVRR0QyNUhOTWlKN1I0Q3NDalN1TGVIYUw1Yy82VmxMK3dHNXhy?=
 =?utf-8?B?VGJBTzQ5UDYyQ3NuQzZreC9GRVhRRWJPUkhhMDFNVFdzc0ZMV2V2T3dsTldu?=
 =?utf-8?B?WXgwYWxLL3R0dSs4UnhDN0RmSDNLbFhEbUczRDhWSTUwOElqSkcrc0ZnTlo5?=
 =?utf-8?B?QWN6MFJES3VzS1RtaVFzR1lVRWlTd2FxQTRjTHN5NEtyZmUwVCtRbStnTUl2?=
 =?utf-8?B?bFNLRndBMFl5WTlFYWZXa2Y5dE5zL2dxRWg4cEVNOU9pNjQzVFpPak44Q0R6?=
 =?utf-8?B?NWRzSmRVVWUyYjI0ZGxCQmpiK3FSSEJiS0dtcktRY0U1QitSSDNnNlEvRGhr?=
 =?utf-8?B?a2Z1aGoyYURYUjJhbUxnbUJQRVlQaWY1QWRFcGgyRFVqZkV4Y1liWGdaUy9I?=
 =?utf-8?Q?UP7CTsp/KoT0Ed4RfRwYRKeso?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2cbcd1d-6e9c-479a-bece-08de3691d9c3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 19:41:58.6543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GN0BIAUe9L6Inijw66l4SE6TBvflv+hnQo8Y0InVdyUD2BmYN76yqj9qJ1MKAVNRAkOYsMmWaIXPA+tnbKwa3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8017
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



On 12/8/2025 10:53 AM, Lizhi Hou wrote:
> When autosuspend is triggered, driver rpm_on flag is set to indicate that
> a suspend/resume is already in progress. However, when a userspace
> application submits a command during this narrow window,
> amdxdna_pm_resume_get() may incorrectly skip the resume operation because
> the rpm_on flag is still set. This results in commands being submitted
> while the device has not actually resumed, causing unexpected behavior.
> 
> The set_dpm() is called by suspend/resume, it relied on rpm_on flag to
> avoid calling into rpm suspend/resume recursivly. So to fix this, remove
> the use of the rpm_on flag entirely. Instead, introduce aie2_pm_set_dpm()
> which explicitly resumes the device before invoking set_dpm(). With this
> change, set_dpm() is called directly inside the suspend or resume execution
> path. Otherwise, aie2_pm_set_dpm() is called.
> 
> Fixes: 063db451832b ("accel/amdxdna: Enhance runtime power management")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
> v2:
>      Removed drm_WARN_ON() from aie2_send_mgmt_msg_wait().
>      Revise the description.
> 
>   drivers/accel/amdxdna/aie2_message.c    |  1 -
>   drivers/accel/amdxdna/aie2_pci.c        |  2 +-
>   drivers/accel/amdxdna/aie2_pci.h        |  1 +
>   drivers/accel/amdxdna/aie2_pm.c         | 17 +++++++++++++++-
>   drivers/accel/amdxdna/aie2_smu.c        | 27 ++++---------------------
>   drivers/accel/amdxdna/amdxdna_pci_drv.h |  1 -
>   drivers/accel/amdxdna/amdxdna_pm.c      | 22 ++------------------
>   7 files changed, 24 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index fee3b0627aba..a75156800467 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -39,7 +39,6 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
>   	if (!ndev->mgmt_chann)
>   		return -ENODEV;
>   
> -	drm_WARN_ON(&xdna->ddev, xdna->rpm_on && !mutex_is_locked(&xdna->dev_lock));
>   	ret = xdna_send_msg_wait(xdna, ndev->mgmt_chann, msg);
>   	if (ret == -ETIME) {
>   		xdna_mailbox_stop_channel(ndev->mgmt_chann);
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index ceef1c502e9e..81a8e4137bfd 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -321,7 +321,7 @@ static int aie2_xrs_set_dft_dpm_level(struct drm_device *ddev, u32 dpm_level)
>   	if (ndev->pw_mode != POWER_MODE_DEFAULT || ndev->dpm_level == dpm_level)
>   		return 0;
>   
> -	return ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
> +	return aie2_pm_set_dpm(ndev, dpm_level);
>   }
>   
>   static struct xrs_action_ops aie2_xrs_actions = {
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index cc9f933f80b2..c6b5cf4ae5c4 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -286,6 +286,7 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
>   /* aie2_pm.c */
>   int aie2_pm_init(struct amdxdna_dev_hdl *ndev);
>   int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, enum amdxdna_power_mode_type target);
> +int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level);
>   
>   /* aie2_psp.c */
>   struct psp_device *aie2m_psp_create(struct drm_device *ddev, struct psp_config *conf);
> diff --git a/drivers/accel/amdxdna/aie2_pm.c b/drivers/accel/amdxdna/aie2_pm.c
> index 426c38fce848..afcd6d4683e5 100644
> --- a/drivers/accel/amdxdna/aie2_pm.c
> +++ b/drivers/accel/amdxdna/aie2_pm.c
> @@ -10,6 +10,7 @@
>   
>   #include "aie2_pci.h"
>   #include "amdxdna_pci_drv.h"
> +#include "amdxdna_pm.h"
>   
>   #define AIE2_CLK_GATING_ENABLE	1
>   #define AIE2_CLK_GATING_DISABLE	0
> @@ -26,6 +27,20 @@ static int aie2_pm_set_clk_gating(struct amdxdna_dev_hdl *ndev, u32 val)
>   	return 0;
>   }
>   
> +int aie2_pm_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
> +{
> +	int ret;
> +
> +	ret = amdxdna_pm_resume_get(ndev->xdna);
> +	if (ret)
> +		return ret;
> +
> +	ret = ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
> +	amdxdna_pm_suspend_put(ndev->xdna);
> +
> +	return ret;
> +}
> +
>   int aie2_pm_init(struct amdxdna_dev_hdl *ndev)
>   {
>   	int ret;
> @@ -94,7 +109,7 @@ int aie2_pm_set_mode(struct amdxdna_dev_hdl *ndev, enum amdxdna_power_mode_type
>   		return -EOPNOTSUPP;
>   	}
>   
> -	ret = ndev->priv->hw_ops.set_dpm(ndev, dpm_level);
> +	ret = aie2_pm_set_dpm(ndev, dpm_level);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
> index bd94ee96c2bc..2d195e41f83d 100644
> --- a/drivers/accel/amdxdna/aie2_smu.c
> +++ b/drivers/accel/amdxdna/aie2_smu.c
> @@ -11,7 +11,6 @@
>   
>   #include "aie2_pci.h"
>   #include "amdxdna_pci_drv.h"
> -#include "amdxdna_pm.h"
>   
>   #define SMU_RESULT_OK		1
>   
> @@ -67,16 +66,12 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   	u32 freq;
>   	int ret;
>   
> -	ret = amdxdna_pm_resume_get(ndev->xdna);
> -	if (ret)
> -		return ret;
> -
>   	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_MPNPUCLK_FREQ,
>   			    ndev->priv->dpm_clk_tbl[dpm_level].npuclk, &freq);
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Set npu clock to %d failed, ret %d\n",
>   			 ndev->priv->dpm_clk_tbl[dpm_level].npuclk, ret);
> -		goto suspend_put;
> +		return ret;
>   	}
>   	ndev->npuclk_freq = freq;
>   
> @@ -85,10 +80,9 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Set h clock to %d failed, ret %d\n",
>   			 ndev->priv->dpm_clk_tbl[dpm_level].hclk, ret);
> -		goto suspend_put;
> +		return ret;
>   	}
>   
> -	amdxdna_pm_suspend_put(ndev->xdna);
>   	ndev->hclk_freq = freq;
>   	ndev->dpm_level = dpm_level;
>   	ndev->max_tops = 2 * ndev->total_col;
> @@ -98,35 +92,26 @@ int npu1_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   		 ndev->npuclk_freq, ndev->hclk_freq);
>   
>   	return 0;
> -
> -suspend_put:
> -	amdxdna_pm_suspend_put(ndev->xdna);
> -	return ret;
>   }
>   
>   int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   {
>   	int ret;
>   
> -	ret = amdxdna_pm_resume_get(ndev->xdna);
> -	if (ret)
> -		return ret;
> -
>   	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_HARD_DPMLEVEL, dpm_level, NULL);
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Set hard dpm level %d failed, ret %d ",
>   			 dpm_level, ret);
> -		goto suspend_put;
> +		return ret;
>   	}
>   
>   	ret = aie2_smu_exec(ndev, AIE2_SMU_SET_SOFT_DPMLEVEL, dpm_level, NULL);
>   	if (ret) {
>   		XDNA_ERR(ndev->xdna, "Set soft dpm level %d failed, ret %d",
>   			 dpm_level, ret);
> -		goto suspend_put;
> +		return ret;
>   	}
>   
> -	amdxdna_pm_suspend_put(ndev->xdna);
>   	ndev->npuclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].npuclk;
>   	ndev->hclk_freq = ndev->priv->dpm_clk_tbl[dpm_level].hclk;
>   	ndev->dpm_level = dpm_level;
> @@ -137,10 +122,6 @@ int npu4_set_dpm(struct amdxdna_dev_hdl *ndev, u32 dpm_level)
>   		 ndev->npuclk_freq, ndev->hclk_freq);
>   
>   	return 0;
> -
> -suspend_put:
> -	amdxdna_pm_suspend_put(ndev->xdna);
> -	return ret;
>   }
>   
>   int aie2_smu_init(struct amdxdna_dev_hdl *ndev)
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> index c99477f5e454..0d50c4c8b353 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> @@ -101,7 +101,6 @@ struct amdxdna_dev {
>   	struct amdxdna_fw_ver		fw_ver;
>   	struct rw_semaphore		notifier_lock; /* for mmu notifier*/
>   	struct workqueue_struct		*notifier_wq;
> -	bool				rpm_on;
>   };
>   
>   /*
> diff --git a/drivers/accel/amdxdna/amdxdna_pm.c b/drivers/accel/amdxdna/amdxdna_pm.c
> index fa38e65d617c..d024d480521c 100644
> --- a/drivers/accel/amdxdna/amdxdna_pm.c
> +++ b/drivers/accel/amdxdna/amdxdna_pm.c
> @@ -15,14 +15,9 @@ int amdxdna_pm_suspend(struct device *dev)
>   {
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>   	int ret = -EOPNOTSUPP;
> -	bool rpm;
>   
> -	if (xdna->dev_info->ops->suspend) {
> -		rpm = xdna->rpm_on;
> -		xdna->rpm_on = false;
> +	if (xdna->dev_info->ops->suspend)
>   		ret = xdna->dev_info->ops->suspend(xdna);
> -		xdna->rpm_on = rpm;
> -	}
>   
>   	XDNA_DBG(xdna, "Suspend done ret %d", ret);
>   	return ret;
> @@ -32,14 +27,9 @@ int amdxdna_pm_resume(struct device *dev)
>   {
>   	struct amdxdna_dev *xdna = to_xdna_dev(dev_get_drvdata(dev));
>   	int ret = -EOPNOTSUPP;
> -	bool rpm;
>   
> -	if (xdna->dev_info->ops->resume) {
> -		rpm = xdna->rpm_on;
> -		xdna->rpm_on = false;
> +	if (xdna->dev_info->ops->resume)
>   		ret = xdna->dev_info->ops->resume(xdna);
> -		xdna->rpm_on = rpm;
> -	}
>   
>   	XDNA_DBG(xdna, "Resume done ret %d", ret);
>   	return ret;
> @@ -50,9 +40,6 @@ int amdxdna_pm_resume_get(struct amdxdna_dev *xdna)
>   	struct device *dev = xdna->ddev.dev;
>   	int ret;
>   
> -	if (!xdna->rpm_on)
> -		return 0;
> -
>   	ret = pm_runtime_resume_and_get(dev);
>   	if (ret) {
>   		XDNA_ERR(xdna, "Resume failed: %d", ret);
> @@ -66,9 +53,6 @@ void amdxdna_pm_suspend_put(struct amdxdna_dev *xdna)
>   {
>   	struct device *dev = xdna->ddev.dev;
>   
> -	if (!xdna->rpm_on)
> -		return;
> -
>   	pm_runtime_put_autosuspend(dev);
>   }
>   
> @@ -81,14 +65,12 @@ void amdxdna_pm_init(struct amdxdna_dev *xdna)
>   	pm_runtime_use_autosuspend(dev);
>   	pm_runtime_allow(dev);
>   	pm_runtime_put_autosuspend(dev);
> -	xdna->rpm_on = true;
>   }
>   
>   void amdxdna_pm_fini(struct amdxdna_dev *xdna)
>   {
>   	struct device *dev = xdna->ddev.dev;
>   
> -	xdna->rpm_on = false;
>   	pm_runtime_get_noresume(dev);
>   	pm_runtime_forbid(dev);
>   }

