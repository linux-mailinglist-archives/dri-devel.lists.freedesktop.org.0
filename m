Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 861DA96BEA5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 15:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB9110E7DC;
	Wed,  4 Sep 2024 13:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kQ4pZnIb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2063.outbound.protection.outlook.com [40.107.244.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2287110E7CD
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 13:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1SKvjH1hOiVHrnA2mTZJn0xEUqMrLxVaqHvc6sZqzVnL5kPt95kn2KpvsCh1tsXVWPqXNOvd8uzfX39VAWGx0GZhPGTZTdHMnZCJxk3wHQjrVP/1qi90+CtTsDlMgI9GjVX6E9jN2GjB1U+ZPAcfBa2B/gZqkgGCNkRPjlGVBOltmpFYsAiOQltXnKFUClXs6Eqg88pa8GCwmYg1Le8nAlI7vgLV5oPNTenRkcZi6zOLU9lsPorW9pTuYiEuxNW6/uRnwuHpuLZP76p6O1xwZK1DqQm5lyzHMd4vEAEt2MmypI9VwN8tVedvaWb0LgAwDn9DWHX+WF36SYJ92TQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pa1C3eCI6MDzi0fP77x6vCkZi9vXUXwAEg4/5fZkII=;
 b=sdvkHMbGjifOxcP7sfWQ8E/gv0K0v6evq9vsVoZbC90pOxJyFvme6ffULySWxXi6mbuDVWUnWZq5Faxun3iLsIyXlzIdZHGWsdAA2LWE4gt3jbaRNZEbGrXJMMleQ4cXZsUewb1lY2iH6OzL78N751ze1WAc4FoWQDatrpuLGaJKV5wRhwu42QHV/ELmCOFnuDAoiPeBaiQIIgeJWyaF5AOrKonoqHJrf9gOYxuJaJjBjxm0riRwPVf57+Z/ARfguR1COvp8Y3rHRQl6KK7hBe/ujaDtxLNLa6TEs/5GE3be70n1Xs4t4zGjST006Kt8UgoP9BzbnxLZCeE0WImlIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pa1C3eCI6MDzi0fP77x6vCkZi9vXUXwAEg4/5fZkII=;
 b=kQ4pZnIbqswDirslSVSDu7h/eCYtBXRWGpN3rgoUnJDk/IvwKEANkaFxLVizNH4A6j8S5UIRdO+ObBx1dTf2iQkHvCWHma+j9AecfjRAShVCEojsAX39eMQR9qDMFQoa1LGGWQYr39Z2q9GbX9vU+M5rVeHYZ9bb4u/faGlYJSM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7593.namprd12.prod.outlook.com (2603:10b6:610:141::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Wed, 4 Sep
 2024 13:36:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 13:36:46 +0000
Message-ID: <9c99084a-de85-4c7f-8350-045f73c8019f@amd.com>
Date: Wed, 4 Sep 2024 15:36:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
To: Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>,
 linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
 <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
 <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
 <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
 <090ae980-a944-4c00-a26e-d95434414417@amd.com>
 <80ffea9b-63a6-4ae2-8a32-2db051bd7f28@arm.com>
 <20240904132308.7664902e@collabora.com>
 <a5a53492-9651-403e-b613-91ef0b9e80b6@amd.com>
 <298d0516-3b92-47e9-ad54-185de97561ee@arm.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <298d0516-3b92-47e9-ad54-185de97561ee@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0280.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7593:EE_
X-MS-Office365-Filtering-Correlation-Id: 585cbb7f-e0c0-4a8c-c274-08dccce69f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cy9QQ3I2QXJKSnNXdjNqeXBUb0NUUmFIS3JLb1J6bE4xUm1xMWZmU1hMZldp?=
 =?utf-8?B?OExhL0RBa3h6QzRiL0J3TXFLellNRXkrb2dpdk5nUElnbFR5ZmZIa3EwZmlX?=
 =?utf-8?B?bmhUaWpMZkNYbGFZcGNLeVhoTW0wTU01byt6VFJrdWJrV0ZnQ0JvYnp3RkQw?=
 =?utf-8?B?ajNrNjJBUzk2MDdPZGwwTmtTNVkva2w5Vmk0cjVORWthMVRQYVI2bDdpeWM5?=
 =?utf-8?B?eUJlY21iSEdSNWxSTmpkcHRrclNlMnUwQitHSExGT0Ewak43YTE4aHkyR1pD?=
 =?utf-8?B?OGEzci9xZmZaYzQrUE0ySURQODVmRk5hSlhwS2dMY295K3c0bWY4SlFVR0lJ?=
 =?utf-8?B?Q0szb0pTdllpSUdMbC9zeHgybjBoU0RHb3d1N1Y3V1dyM0RhUm0veTNpS1hv?=
 =?utf-8?B?Rmh2UnNwQStMTVJUdktFQ0FBWU5MdlpISmF3TktDUEVaNzRyTDdrejROSk94?=
 =?utf-8?B?WjNwZ2dmR1RJdWpGeGYrOUFJMDg5NVc1VHM4Zzh4ME9TNGhSUytLT2dSV2Vn?=
 =?utf-8?B?UnlGbEpQdkt0enRDV0ZESWlpTVNmQm9jbTZDNWEvZmVqWmkyWXUzekZyS3JB?=
 =?utf-8?B?ckNuM3FEaGtzUnJTUkVRcEY0SllRZ3JlazJ5WENaWXhSY1lDNlNrN3FBbjRW?=
 =?utf-8?B?SmRIMVhyVFZwZ3RHVGRMbEk1Wmk4ejluT0tKb29yeGV6RXFXZEttbXlpb1hr?=
 =?utf-8?B?VkcwZ1M3cW5GRldpcTBTZTR4Y0t2QnZjRCtBSFlVVFdQMmRhUnZDb0ZGdkdV?=
 =?utf-8?B?YVFDWkJmRlNmOHFWYjhVNGNSeXhaSTJzMFFNU0lTeElhYXZVSmVTd2VLcE9J?=
 =?utf-8?B?bkt5RjhPK2xyK3lvaUJGQmV6eUUzeE4vVGdQd0ZOSHZUMk1WNG1zK2tqUGpR?=
 =?utf-8?B?YVZ4MmJ3b2RUU1A1ZzhFTkJETkxLZC9oemR2Qk5KbzJzbEdHT2xGOXJLck1C?=
 =?utf-8?B?UUZOMmhaaUhRQmZUZzBYcWo2UitrVTFiWld4YllyMkErdTIxK2FjUlJiYVdX?=
 =?utf-8?B?OTFyM3RHaEVNN3k5a3ZzUGtsams1eHZHN250OE1YYWV4WjBCNDVzV1lFQW1v?=
 =?utf-8?B?UGg3eFhLSG50QUh4REV0VHZENUd5SHR0a2owRkdadG9vb0hoVFJlNmp0VFNM?=
 =?utf-8?B?ZVlHSkN3cEFVMm9aeGcza2JtbEt2MFJJaDVFdmJzODY5Q29xUFhaR3h2eThm?=
 =?utf-8?B?T1h6NmFNaHlWTkprTUVWbnlRV3VnTnhYWVdWcUx6WUFBRDFhQ2c2aU9XVlVB?=
 =?utf-8?B?WGlpT1VLZlRET094a0Y4bzM2NXdRcXlFeXcyNy9ISVROVjZzTDdRbFMxMGd3?=
 =?utf-8?B?QVAxQ2Q2YzkxT05jQWY1OFlrQVU2emF2VUpFMFp1eGlVcXFJZ1g1SUZFcGVz?=
 =?utf-8?B?L2E5bVJjZjVRVThWanpjRnY4TFZPTDE3MXdqRlQybVErME1lb2tSZHZYRmpB?=
 =?utf-8?B?dUZCcktsRmdCZytvaTFpWXNId1Y3SFB3bnRCRnAyYlZ6di83WEQ2ZVVRTmZ5?=
 =?utf-8?B?Q0NoNVR5dHl4UlhDUUhhcXBXbnNxUWg3aHRwQmFabHBuUDlxcDBoK1hZMnEv?=
 =?utf-8?B?MmxpU045MFhtOE0xdURmdkFHTDBXS1A4RmlzczJXUUF4WVVCNjJRL2tQV2lX?=
 =?utf-8?B?TGlYZWRzV2Z4Qm1pd25zT0k1cXlnYmpJUmY1TmlhNXZ5N2h1eTF1NnlGVWNE?=
 =?utf-8?B?MHFwVnNoOTR4UmtSYTZoVGs5SXVheUV2Z0loaVVYVWZOS25qangzSmsySWRu?=
 =?utf-8?B?VWwxMzRXOVZLdVRkbzhZZGZsRDA0VlAzMGE0dStteGhMOUIxVkY0bElHNmxW?=
 =?utf-8?B?NzJBOFpSejNnQ3duZlFWQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXdZK3hmTlYyUmoxa08rZTZlSU1STHg4Lzk3WEVYc0czUklPejlPQll6VlVP?=
 =?utf-8?B?SHhUWHVTNkx5VlFYOWVqbk9wSEo1MmtadTRsemFCaDZTV0p1a0lwQ0dzckMy?=
 =?utf-8?B?QmRWcG1sZVJ4dWRURWpjdnI4TEdpM3N3VEE2Z3pVdDY0TDh2a1FNMUFTR1Mv?=
 =?utf-8?B?ekJTWVVhWE1CakR5dXdtdVJSbmZFTWJZWFBhb2tXY1JQWlc5MDZGRW9sMkcr?=
 =?utf-8?B?MGFlSCtZQldoMU1wR3Y2MWVxbllTczVHSFo2OXEyeEt1K0JhN3NJakJVMnhH?=
 =?utf-8?B?Z1dHaFU3TW43Z2NPSGxZcHViZGlsMm9ONXAxZ2RtbE1YREVmd3JUVFRobTk3?=
 =?utf-8?B?VFowckJsUnV6SVEzaUlNc1J2SUJEU29TSk0wd3JHRnR0eTR5N08vdU8xT29p?=
 =?utf-8?B?cDhxRVFVZTR5c2tvbTE4YmdkZVM2RlJRbHNMSmhUcHRWd0NHNU1zZWVSTHNp?=
 =?utf-8?B?YUVJSE9KbHVqbnN4M2RUeVFXVGRPVTl2bWUvVTN3S1JmTVVHOUtrSndwZGpo?=
 =?utf-8?B?TWdqaUw5VWx4RlZNZlpWeFBKTWIyLy9TZmU5b3h6czNFc29EbFF2Q0pzTXZL?=
 =?utf-8?B?MHBsamZ6UmZ4UFcyK204aE84Y3ZHZWJIV1hwdXNvQWpSWXVLeVVENTFKaDBY?=
 =?utf-8?B?VHFPay9GZTlBZmUxcWJuaEVnQk5vVTd6a0V5QmE0c1NQV1VDZC9DNncycmUz?=
 =?utf-8?B?RWtsOC9yTjVFVWpxZThCdmltME5BMU4waDZrTWpZNEg3NnlQWXBPV0FLdENW?=
 =?utf-8?B?dU5sSlhZQkVTc0RhRGFmMG9ZOHdNN09wWVcvL2JuTFFiVmEwbW9qaFFZTzFy?=
 =?utf-8?B?QmRCZlpXRnhyOVpDRVE5NHJuTGtxMTc3Sjhwc1JzM2VhMlVXTUpFN2lqbEt1?=
 =?utf-8?B?R245S3d2NVFOaFQ2cDYyN0RXVmVnWVFiVTFnWWJSQStBYXBUM0ZSL21EaFJU?=
 =?utf-8?B?OWc2MHBGU2J4VStMQjVZOG5OZjhRZDBESWtmYmxvbE1MQjJ4ZS90K2JpK1Nt?=
 =?utf-8?B?ZDJLWDEydnlpTURxTVVyVmlnSWMxQ3l1OWZ0eFhUWXl2amlPcHh6QkZPdkR2?=
 =?utf-8?B?Tnk5L09YYTAwR3psd3RDalU1WEJIT29JMkRMa0lmb0pwMEduN1YrdW9RSldJ?=
 =?utf-8?B?SHFNanRsVVNPY29nNis0VERPM0M4WUNnRlRqK1lqVXJBcHNOeU55MDVmNGgz?=
 =?utf-8?B?YUdrbDJFQjhodXVSSjEvdUxGMTZMSWYyWWtyK0lwUjdPaGM1NWtkOWlTOFZi?=
 =?utf-8?B?enNUbW91ZFBRY20rSEJJZFNla2Jyd3kzOC9ORFM4YTFMZ2F6RkhCdVdFdy85?=
 =?utf-8?B?M1l5MVpkZFRmRDdGMXRXZUhYV0p2SGx1Z0ZyZEVyZ2VFOWtDNFUxeEV5dVlZ?=
 =?utf-8?B?NGNkMFcyWm5Ick9hMUEzL3VWN1A5R0NLcFNtNk1ndzRMNzlWSG55VFNZMVFR?=
 =?utf-8?B?am1GYitwMitnSURlZjNEU05lRGFCemtkL245cyt2b2lwUnFZK1ZXaVdMU0JY?=
 =?utf-8?B?OTlHd083QXpWYXlDZmlKM2NaUU8zVXpNQ0F6UE92KzFLdTFhUlozenFZbkI4?=
 =?utf-8?B?dUNlRVFndnN2bGc4R1dnZFQyVDdjVVB4R0xPa1pKS01YZENWcTNubTd4emF2?=
 =?utf-8?B?SkVtYUlxRmJQVkZBR1A2d2hpRkk2S2NrNkZHZCs4M1dRZ1p2RkJYR2VmUXZD?=
 =?utf-8?B?bEJiMndleUFNSjN4NXVjbk9iSHFKMkpwQTNXVVplS0UyWFhVNkdCYlNBS25U?=
 =?utf-8?B?N2owMXFFTHIwNjVXUEFNek5BaUY4bG5MYW8vbjQ2NitqbkwvLzJCNE9UcVR6?=
 =?utf-8?B?eWdmWElIZyt6UGxsS2dMQ2dpZlRtRlVTcE4rL0JoQzdBVzVVM21panB1Vnkr?=
 =?utf-8?B?ZTd4bFhTejI0YU90ZGpDMER3Y2FWOEV0VFhzSTQ2UVZUZmI3M0REUG82bFZZ?=
 =?utf-8?B?Vm1NWndTMU90RlQ4Y3ZpSEJsMlV5RnVERHVKUE51bHVxd2VSMzdiMk9zWE1p?=
 =?utf-8?B?N0dDbjkvdXBxR3U4Um1OTTF6YU1MaHg2MUpZZWtqUkNGTjZGd1pVODZXQ0dt?=
 =?utf-8?B?djFtWU1hVzNHbnQ4SCt6dTJXMDF6UjhJU1pwUkxkV3MvSGg4VXgwWnV3OWNO?=
 =?utf-8?Q?0xViWEkfGf1/zh5ujvT5rKxWP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 585cbb7f-e0c0-4a8c-c274-08dccce69f07
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 13:36:46.5149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSCf70qRvSFqDI/OhbpIVW+MX3Vv0jTH4vBGuLjS8U6iW6BBhOK0bqlIQtApSRH4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7593
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



Am 04.09.24 um 14:46 schrieb Steven Price:
> On 04/09/2024 12:34, Christian König wrote:
>> Hi Boris,
>>
>> Am 04.09.24 um 13:23 schrieb Boris Brezillon:
>>>>>>> Please read up here on why that stuff isn't allowed:
>>>>>>> https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences
>>>>>> panthor doesn't yet have a shrinker, so all memory is pinned, which means
>>>>>> memory management easy mode.
>>>>> Ok, that at least makes things work for the moment.
>>>> Ah, perhaps this should have been spelt out more clearly ;)
>>>>
>>>> The VM_BIND mechanism that's already in place jumps through some hoops
>>>> to ensure that memory is preallocated when the memory operations are
>>>> enqueued. So any memory required should have been allocated before any
>>>> sync object is returned. We're aware of the issue with memory
>>>> allocations on the signalling path and trying to ensure that we don't
>>>> have that.
>>>>
>>>> I'm hoping that we don't need a shrinker which deals with (active) GPU
>>>> memory with our design.
>>> That's actually what we were planning to do: the panthor shrinker was
>>> about to rely on fences attached to GEM objects to know if it can
>>> reclaim the memory. This design relies on each job attaching its fence
>>> to the GEM mapped to the VM at the time the job is submitted, such that
>>> memory that's in-use or about-to-be-used doesn't vanish before the GPU
>>> is done.
> How progressed is this shrinker? It would be good to have an RFC so that
> we can look to see how user submission could fit in with it.
>
>> Yeah and exactly that doesn't work any more when you are using user
>> queues, because the kernel has no opportunity to attach a fence for each
>> submission.
> User submission requires a cooperating user space[1]. So obviously user
> space would need to ensure any BOs that it expects will be accessed to
> be in some way pinned. Since the expectation of user space submission is
> that we're reducing kernel involvement, I'd also expect these to be
> fairly long-term pins.
>
> [1] Obviously with a timer to kill things from a malicious user space.
>
> The (closed) 'kbase' driver has a shrinker but is only used on a subset
> of memory and it's up to user space to ensure that it keeps the relevant
> parts pinned (or more specifically not marking them to be discarded if
> there's memory pressure). Not that I think we should be taking it's
> model as a reference here.
>
>>>> Memory which user space thinks the GPU might
>>>> need should be pinned before the GPU work is submitted. APIs which
>>>> require any form of 'paging in' of data would need to be implemented by
>>>> the GPU work completing and being resubmitted by user space after the
>>>> memory changes (i.e. there could be a DMA fence pending on the GPU work).
>>> Hard pinning memory could work (ioctl() around gem_pin/unpin()), but
>>> that means we can't really transparently swap out GPU memory, or we
>>> have to constantly pin/unpin around each job, which means even more
>>> ioctl()s than we have now. Another option would be to add the XGS fence
>>> to the BOs attached to the VM, assuming it's created before the job
>>> submission itself, but you're no longer reducing the number of user <->
>>> kernel round trips if you do that, because you now have to create an
>>> XSG job for each submission, so you basically get back to one ioctl()
>>> per submission.
> As you say the granularity of pinning has to be fairly coarse for user
> space submission to make sense. My assumption (could be wildly wrong)
> was that most memory would be pinned whenever a context is rendering.
>
>> For AMDGPU we are currently working on the following solution with
>> memory management and user queues:
>>
>> 1. User queues are created through an kernel IOCTL, submissions work by
>> writing into a ring buffer and ringing a doorbell.
>>
>> 2. Each queue can request the kernel to create fences for the currently
>> pushed work for a queues which can then be attached to BOs, syncobjs,
>> syncfiles etc...
>>
>> 3. Additional to that we have and eviction/preemption fence attached to
>> all BOs, page tables, whatever resources we need.
>>
>> 4. When this eviction fences are requested to signal they first wait for
>> all submission fences and then suspend the user queues and block
>> creating new submission fences until the queues are restarted again.
>>
>> This way you can still do your memory management inside the kernel (e.g.
>> move BOs from local to system memory) or even completely suspend and
>> resume applications without their interaction, but as Sima said it is
>> just horrible complicated to get right.
>>
>> We have been working on this for like two years now and it still could
>> be that we missed something since it is not in production testing yet.
> I'm not entirely sure I follow how this doesn't create a dependency
> cycle. From your description it sounds like you create a fence from the
> user space queue which is then used to prevent eviction of the BOs needed.
>
> So to me it sounds like:
>
> 1. Attach fence to BOs to prevent eviction.
>
> 2. User space submits work to the ring buffer, rings doorbell.
>
> 3. Call into the kernel to create the fence for step 1.
>
> Which is obviously broken. What am I missing?

Those are two different fences, we have an eviction fence and a 
submission fence.

The eviction fence takes care of making sure the memory is not moved 
while submissions are running.

And the submission fence is the actual signal to completion.

> One other thing to note is that Mali doesn't have local memory - so the
> only benefit of unpinning is if we want to swap to disk (or zram etc).

Yeah that makes sense, but the problem remains that with an userspace 
submission module you completely nail that pinning.

Regards,
Christian.

>
> Steve
>

