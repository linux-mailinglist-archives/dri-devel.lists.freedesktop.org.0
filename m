Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E9190DDFA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 23:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCB610E1FB;
	Tue, 18 Jun 2024 21:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sE2y/JfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CFD10E1FB;
 Tue, 18 Jun 2024 21:05:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoQBXy4UcGAA3ie6VGtA0xPM7H6O3tg42D/8YJLFaMV4gudEbmbZAeugBVx6DU7XfbCOXxDgFsPmZ4RcU2pl93/ydF1crshx5GSxgsI+CR5TstYIgi/yaeS/PMdJ9pCNnJOajNsFfGyzOKCAyRNbk8vIoEmKB+cEnLlkl4+0YRp3u/P3Vvjvw87Ax4JbPDm2LZL9ajfjncu3cVpk7dRj+wbS+IE+Ai1FeSj7ctznkvTsgIN/8vhWUiCa8aAcSemoc8Wj1pnnQkCAKkK0E1osqVrE/dMW4Lb15dT5fB2C01I+sGXTfmNzrGrqJmP4B/DNAN/L3ZXyio1ZD1FzEsnUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WoyUOW0xK7JMiVrFElMkoIGrPBrlPfwvWO2dNXzRHwU=;
 b=OtUz46ub3ZisBNKyjFNEtyZdS45/PBGXqU1kB6KrUBhXg7z5RSIyVVpc1svcQScfUleXA5q5in1tpuSv5Rxz0rqev+DKC2t8/ACmNDJ4UBMjF9Sir6pQ+n+XbBx+VCMEQMHZHAGQf6eGHCxeM5+uapqKowqBSkvqTlLOhPCxkcjmjtyqjO+SUqUqmQEeeG5VbWhSCq1smdcaM3NYLrqjfYEi/FSs/mZDAYbyJSG5+qysZ4+SjpscUnd+NXGyLv7rg8i+1rJySs4OL/J9iy6xTTep88Iq8zMgAkPgio08Gl4Y5iJDc55os08nkVGjckF9VH904/paMoJrhqSUkWx/HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoyUOW0xK7JMiVrFElMkoIGrPBrlPfwvWO2dNXzRHwU=;
 b=sE2y/JfM7R4Rvd/cyJOn+72LvnhpuLJ5wVblDYNHtWnM+/j7j4vHw9dZ4PLV1v4EQ/bT4M8syrY1sV9KMYcTpax4VoNbo1CIQ0q4RzEvXLouMPWWqM7FftrqJbyZdkQXIYmxD8XWkd9kuYTZgjPZsuRtVcJejpLO6S2Xb6iZUoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB9422.namprd12.prod.outlook.com (2603:10b6:8:1bb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Tue, 18 Jun
 2024 21:05:24 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 21:05:24 +0000
Message-ID: <cfaedc92-9c3a-466f-a6ac-f634aa232228@amd.com>
Date: Tue, 18 Jun 2024 16:05:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] tests/amdgpu/amd_abm: Add support for
 panel_power_saving property
To: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@google.com>, Mario Limonciello <superm1@ubuntu.com>
References: <20240522220849.33343-1-mario.limonciello@amd.com>
 <20240522220849.33343-4-mario.limonciello@amd.com>
 <84780b0d-aec1-4674-9e54-8d1997a2d4fe@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <84780b0d-aec1-4674-9e54-8d1997a2d4fe@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::12) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB9422:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a3d118-c3e2-4b2d-a29a-08dc8fda5f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGtrL2F0V0liVTNvOUVZMFB1QTlXVWJkV1hHei90WjE5VDdyMzRYOGZlYjdh?=
 =?utf-8?B?QTg1MkRuNVFTdG1hOE1EQWFXSTVRSDU2Si8xWmlwNXNzVnVkekVydG9lb1k5?=
 =?utf-8?B?Tjdsb2FVRTM2d29QZVJ0d1o1QXhDMlVCcVJ3bThmV2hqUkNnZnZ6SGJJTnp5?=
 =?utf-8?B?NThUVzFpdTZzNy84alRXa0oyZ1c4cS9zL1lzd2JFTDc5YjVjL0c5NnpMQUMx?=
 =?utf-8?B?ekFrQzlVbE5Uc0trSFJhUTc5QnE3ZVR6K2RRNEd3S0dUUWFDa2NOdGdGaXVl?=
 =?utf-8?B?NDVFd05iVHpxS2VIWDkxbHA1ejh3RWk5Uk9wSjEzODlvUkFXMnhMaVMvT01Q?=
 =?utf-8?B?VFE3bmFtNWthWVRESjJxeVQzaW94anUzbkU2Y3h0VEZHUURrQTVWQ0RCTS9y?=
 =?utf-8?B?OGNtOFZyaEMwQklWWmlLZC9lcC9rWE9Ud0RmbTU3NlJlS3hKREd1L2kyUS95?=
 =?utf-8?B?OVJhNFpYNitFZTlKU1FndlhBekE1QVlWZHBHNC9nZ3M0V0xtY1NXU1JtM1NP?=
 =?utf-8?B?alROV2F0ZFJaVkU2TGFPcktIbFVQekZURHpPK1oyVStlTFE4T3BtNWVZa1Zu?=
 =?utf-8?B?SXJhU2ZXSjJkVTZyNkdGVHVlVkFyK1M5N1hsMnY2cDN3Tk1mTVc3Z21zcUpT?=
 =?utf-8?B?aFhNZ2wva2MwcE4reThBTG0wOUZJZHdGWVB0aXpBb0lsOEk5N2pnSXhaSi9U?=
 =?utf-8?B?TmJkNzcyL0tpQ1JrNkduSk13SkUzTzd1ekd1Zy9XZmRCd1M2cTNQb2ZHMDVa?=
 =?utf-8?B?TlY1Ky9XZG5mb3AyUnRwSndPMVhQd3VUVWQ0aEVsS1ZEUWw5bUxYK0lvTXRE?=
 =?utf-8?B?dGJ3M2RUazVNUVlLbm5aUFFRVXB2S2dVejVCcW4rdENHV1JyUm0rd2VsckpB?=
 =?utf-8?B?M213a0ZkV0ZCZ1RpMC9KUTE1L0VlL3BYM1R0Q0srRFczMGV3em9SWmxjRnFy?=
 =?utf-8?B?dlVjM2ZEMWpJRDVnUWpyL1Rlek1PVjRETGRJNHNlbnJpeXN0UHZldXBDWk9z?=
 =?utf-8?B?Q3lHQllZdEFsejNVYkVoSmp1SnNwdytDRVpWOC81WEcwaEhQWXUwYWtnU3Qw?=
 =?utf-8?B?U0xyenZpVFZSNjJPMkREUnVyaDhTaU5FdGg3ZVl4VWx2enp5d2VtZ3RObVAv?=
 =?utf-8?B?bmdqVjJja3h1akQ3SldmWmYxUHpWY1VycVZ4cTc1WG85ZWFFd3Rab0pTYlZZ?=
 =?utf-8?B?WGgzQ0Z2REMrTDVEbCtqRmhVS2NMQTc3RXRsZ0RPQlJGVEYrendtNElJT0dy?=
 =?utf-8?B?eU94WGZtUXBldmRkRXY0Uk4yN1ZJUWovZGsxRzdBWFRlQytQUjRiazZrVjJO?=
 =?utf-8?B?RWVyanRvYmVYamhYeStmYmNibzVRTEtNVHJsa0lMUWN0U2VyMWJpTmFUUGhp?=
 =?utf-8?B?dlV0aXNnRWJGVW1rNDE4VkpFVWI2VjhxeFhCKzRndm9rUGtiQXJ1UXJrWmlu?=
 =?utf-8?B?NmNSUGRTTm54cGFCMGRHemI3ZEo0djJkSVNpMzFQc1ozcVgvOTdtOFJJcUtG?=
 =?utf-8?B?QUhGQUNlQU1hSWgydGdUQ1RtN3hRTnlrL1ZZNENRN2lpWDRwb1kycWhTYkpI?=
 =?utf-8?B?ZWlCK0RpRm1aMzgreXFsbEJUZmlnRVRSUkdLZnptTXErcVB1SVZuLzhlU01F?=
 =?utf-8?B?TUFIcmVydHZhbUhDZ0g0cHh6UmNnRDh3QWZBMy9WY3hkWEs4VEFsS3c4Y3d5?=
 =?utf-8?B?VHdtd2tnVFY5elhMbk91a3VwNjJ1YVkzRlNjbnFBQzY3U2FaVlB6Y0RnT2Fh?=
 =?utf-8?Q?pp/f2Cov6ATDoPd3rW3wEPfa+kXhrWN8YlTnxd2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzE3QmFnSUh4dHZoYWt1d2FHZ0orS3pYS0dRS1R0ZFFyYzV4OHN0Sy8rdVd4?=
 =?utf-8?B?dERWdGoveVRaQnI5Q3d5aDVuQnlpdTNURGlRdUM0TFgzNHpqeGRxSHNYVVp0?=
 =?utf-8?B?Y2VHWmVacTk2SENUTzZXR0hWZ0llUWZBR0UrZ2hmQ1d1RTZENGw2cE5nVmhE?=
 =?utf-8?B?N0k2UDFDYm1QVXlLc04zZDdmVVM4WWJZaGEzTGQrRXhLTExYMHNNbkxpalUx?=
 =?utf-8?B?dXBSdkRvc1RlK1NaSkVjcVBMbXIyOWVLLzVRTTIzb21ERlpUVkpmcTE5TEl4?=
 =?utf-8?B?WjhEWWZGYk0xQXlad3lDQTBaUm1MaTZqT2dubFBHSkZKRUpWNXE1T0NUTXQ2?=
 =?utf-8?B?bkFib2owdHlpYk1lLy9LbGFsK3hzMWUyNzNobE1GU1BSb2NZb1NhUlpCM0V6?=
 =?utf-8?B?aVhWdnoyZzd5WHJVcGJKZ2tvWG5mdEtLY3NRbXhWTXVjTTVBWnVMUTFtSysw?=
 =?utf-8?B?cnFFNm0yS0VSTFVGRUo5YTJHTG9lWWpUZHVWa2M5L0RaRW9EWXl5UmorVDhk?=
 =?utf-8?B?Y3orZjV6eXA4N3VmRjJwZklvQXdyQ1ZqVWlYdUFSUGN1ODFIOXZQNGQ0T3pk?=
 =?utf-8?B?U3V3TkRHOWRxdVZIVCtpU1Z0K3pjSVJYTStoSVEzblkwaDVzM3dlQnEvZ2dC?=
 =?utf-8?B?cnhKRVh0MWVJR2hDTFFrNytyRHJvdXhJQ0srT0ZVNUdDZU9QYlMwbElXVXll?=
 =?utf-8?B?SnJQQjdtM1BKbVBaR2tZcldRLzVPV2tIc3ZlRmt1TjVnKzhIME5HRGQrZGtX?=
 =?utf-8?B?WkhuVmcwa1hCdk5ETFV6UGkzcUxZL1BNWHZVZU9wMVFpbXJaZzgvdVhYUDl6?=
 =?utf-8?B?WHBVNFEyeEd1cG93d3dnUERlVWtZd2tZTEd5enVsdzVsQXYvNjFZdWV2d2dJ?=
 =?utf-8?B?VlFUaHJiOVVueVFUTTlGaXA1MEhyaG5SeG10bVBJcEVFUHFDZ01NTzdiMEMv?=
 =?utf-8?B?TmlWNlZWcmplSTJ3K3h3bWpNd0V5VnE1ZVBrdTFjYVduV0VGVnpJeFdkVjJq?=
 =?utf-8?B?eEl3ZnQwYkVHa1l3M2ljWlhVcFZFRitOSE1TTXVkL1NVWGV5WE52WjZwV0xm?=
 =?utf-8?B?aXJVSFA1eEVZTklnenVkNk9RVFdPM0gvb29PQ0I1cnVsVHZMMFppa0tWQW9v?=
 =?utf-8?B?SGJXZWtza3k5NitQSkxObHdyUWxHNUE1V0FPK1kwOERXVGFCZW82aS9zS3Jm?=
 =?utf-8?B?V1BZazhBaWZFOVVRS1RUL1dYYnM1Z2QvSWNCb2lIcXBhbFdleE5NZ2t1bS8w?=
 =?utf-8?B?WmRQY0pWTWJxTk1lQUlRZVQwTWttc3VyQitFeUlsemUzUnc0TzVqbndiRmRK?=
 =?utf-8?B?RVFCVW04aVBUQ0hBTDBzT0FwL1lqQzcvUWFhcVlKTGMrUElwN3BGbUFVWXJt?=
 =?utf-8?B?KzNLZXY2ZjI5K3ZEYkc5SjdQR24rQndkWTRuUVdoa3hsdGRlUnFCZWp3blhh?=
 =?utf-8?B?dWQzUW5aNHlpalpqL0w3WVFJc1BjQjNtYjBsbVRHZy9EZnRHL3pocEJsdTJC?=
 =?utf-8?B?NVpRM1RqRnRmS3RkdHhJUW13ZXl0akVnNStPWmRGbnFmbXJ6bGJLWTg0NTZI?=
 =?utf-8?B?VE42bTJrT1BIR0hvRFl6V3lOb3E4OGE5UlBGcWtTcGUrUnhTbldEQTZwQUF4?=
 =?utf-8?B?cXVKajhlVjdCOStOVmgyWmZISkFjOWJRRy9WUXQ0WktNdlQ1VGxtVm5kRGNN?=
 =?utf-8?B?cnZOT1djV2JSRFNyUjg5dEk1VzNwZkV3QXlvWWxqQlFyNzlRMGJXR2Y5N1Nq?=
 =?utf-8?B?YkMxdFl3QndRNDM2SGVLd0c2UjBXTUd3blFSTTFTeFdNRytiL1c4VlNNdTY3?=
 =?utf-8?B?N2s4MnZ0ejVoemp3bTJTTHVXcENzbTlQVWdTaFhpK3hXcmFBNFpHMkVNK2RS?=
 =?utf-8?B?Qi9IRlFmb3VhYnRGcDVZYytNZitFaXdmZ0NZbC9XS2hEUnNBSXNSWDd2SGR2?=
 =?utf-8?B?Nnhudk52YnJKM1FkVmVlSmVVamwyc1BlTDU4bUJKcVUveS9GUHY0bzRxdUVV?=
 =?utf-8?B?TVA4QUQ2Mk1kYW9QQjNySXk2b25uc0ltUlJ4ZFdqaWc2QW13Tyt1YnAzSDdo?=
 =?utf-8?B?U24wSVRKQVlUVFl4elhVUGZ3M1BJbFc1aFVRazg3RDJhWXo1dkNTcVkwVU5H?=
 =?utf-8?Q?SP/0MnS4URk3p5tWqKZhTgOY9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a3d118-c3e2-4b2d-a29a-08dc8fda5f6a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 21:05:24.8394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VfZfkqquMLriR9FU2TZrJcL6x0vZOMkTR/r+xTZyoGlrgpUPMbd4eDuVzY7W9fYt4cD5A58Qf9oMTD0z3xOz9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9422
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

On 6/18/2024 15:20, Leo Li wrote:
> 
> Thanks for the tests! FYI IGT patches should also cc 
> igt-dev@lists.freedesktop.org
> 
> Some comments inline:
> 
> On 2024-05-22 18:08, Mario Limonciello wrote:
>> From: Mario Limonciello <superm1@ubuntu.com>
>>
>> When the "panel power saving" property is set to forbidden the
>> compositor has indicated that userspace prefers to have color
>> accuracy and fidelity instead of power saving.
>>
>> Verify that the sysfs file behaves as expected in this situation.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   tests/amdgpu/amd_abm.c | 39 +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
>> index f74c3012c..3fa1366fa 100644
>> --- a/tests/amdgpu/amd_abm.c
>> +++ b/tests/amdgpu/amd_abm.c
>> @@ -365,6 +365,43 @@ static void abm_gradual(data_t *data)
>>       }
>>   }
>> +
>> +static void abm_forbidden(data_t *data)
>> +{
>> +    igt_output_t *output;
>> +    enum pipe pipe;
>> +    int target, r;
>> +
>> +    for_each_pipe_with_valid_output(&data->display, pipe, output) {
>> +        if (output->config.connector->connector_type != 
>> DRM_MODE_CONNECTOR_eDP)
>> +            continue;
>> +
>> +        r = clear_power_saving_policy(data->drm_fd, output);
>> +        if (r == -ENODEV) {
>> +            igt_skip("No power saving policy prop\n");
>> +            return;
>> +        }
>> +        igt_assert_eq(r, 0);
>> +
>> +        target = 3;
>> +        r = set_abm_level(data, output, target);
>> +        igt_assert_eq(r, 0);
>> +
>> +        r = set_panel_power_saving_policy(data->drm_fd, output, 
>> DRM_MODE_REQUIRE_COLOR_ACCURACY);
>> +        igt_assert_eq(r, 0);
>> +
>> +        target = 0;
> 
> Is there a purpose of setting target abm to 0 (disabled) here?
> 
> I suppose it should fail given that we've set REQUIRE_COLOR_ACCURACY. 
> Though I'm
> not sure why we can't keep target = 3.

Yes I think this would work as well to prove a failure.  I'll change it.

> 
> Thanks,
> Leo
> 
>> +        r = set_abm_level(data, output, target);
>> +        igt_assert_eq(r, -1);
>> +
>> +        r = clear_power_saving_policy(data->drm_fd, output);
>> +        igt_assert_eq(r, 0);
>> +
>> +        r = set_abm_level(data, output, target);
>> +        igt_assert_eq(r, 0);
>> +    }
>> +}
>> +
>>   igt_main
>>   {
>>       data_t data = {};
>> @@ -393,6 +430,8 @@ igt_main
>>           abm_enabled(&data);
>>       igt_subtest("abm_gradual")
>>           abm_gradual(&data);
>> +    igt_subtest("abm_forbidden")
>> +        abm_forbidden(&data);
>>       igt_fixture {
>>           igt_display_fini(&data.display);

