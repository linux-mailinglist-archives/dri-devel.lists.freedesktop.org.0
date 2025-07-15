Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B92D7B0688C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 23:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ED610E6B4;
	Tue, 15 Jul 2025 21:29:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nw9sTk+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9889C10E6A9;
 Tue, 15 Jul 2025 21:29:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZixpTBdFRD5hX/x7t7SgMqcbzflGV0d56GtcHEE794EDHNB0TavgyNfozBf83HW1xmj6VgccPXjG91vVXYsDxfxCiP61iXhFPVUKa0lr6pvNrXZoHLx1UJibNWeSqWjpmDrO5d3hiDpo9jh+IxsIdfYnXTFpe+6nJvFUxJpHMl/K6x6okn0zpCu0fqWp8Z1jrczcLnH6SXzp4RTrC5kcN/fMhfGhiwI/mGHp6XJtXjtK/oHArEfyYSY2uNskMg30COnY2DR/DA1CGZdZOFY3Om7NZD/8lmJkDs9IzcbhVI4CWWMhvhSmuhvECY+J9NGg/0cpqrKqkyMBO8Fm1lmfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vZmrXBZLborxEYiVgmVEOW+qVmsqtc1lHk+gl/zENSg=;
 b=lxCtlZ0x0TgI+cSiFOaI5frzSxwZhm66H5fNnI8i3caMu+DLvG2vMs6QK4VZD+0ZM0JZcbACmVlp/ldYH2vGmIcOqLkH+r2NOzGPUN4DEDpm5pffDIzW+RitLHIReGM6+w6d7l5HHJsu96qYIHHhI0DRZ1ZOL+i9jKJtnoggpW0f5WYlZZ6U6VCbDDjfV6Lqf+PZxHCcTS38rDDyxi/kh1KTOXSoqI5Ilb9rCoYeVGFQErEXTYF//2eS04Ef5SdS24Ic+4zXA4b7O2CqK3JcRBYV7AQQO1nwvv/Qu0XAmq9JQNPtvOXsFXVCWY8Fi3YppJzeLr7YM7us4elB55BO1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vZmrXBZLborxEYiVgmVEOW+qVmsqtc1lHk+gl/zENSg=;
 b=nw9sTk+PqDroKLHJXgIovYTRKkR/7+4F9WD23v9b94s7XhsCe4CTRRo3/JSYFnbt9zFYf1E54+6YWGPS2eBvJNJ2nfdnXip/D9dI2pV+fPkb72y2xd3jZq7vXi3UcwUqqj6k8JBj1MtzYYuO4Axkm+OgLJc58qVRKYIqqOMeEqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA5PPF9D25F0C6D.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 15 Jul
 2025 21:29:26 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.033; Tue, 15 Jul 2025
 21:29:26 +0000
Message-ID: <23f01ced-2885-4513-b4b5-826fe9837750@amd.com>
Date: Tue, 15 Jul 2025 16:29:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amd/display:fix a Null pointer dereference
 vulnerability
To: Krzysztof Kozlowski <krzk@kernel.org>, jackysliu <1972843537@qq.com>,
 harry.wentland@amd.com
Cc: Austin.Zheng@amd.com, Dillon.Varone@amd.com, Security@tencent.com,
 Sung.Lee@amd.com, Wayne.Lin@amd.com, airlied@gmail.com,
 alexander.deucher@amd.com, alvin.lee2@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 joshua.aberback@amd.com, linux-kernel@vger.kernel.org, linux@treblig.org,
 ryanseto@amd.com, simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com
References: <220f9fb4-45ad-4997-9572-564242737dd4@amd.com>
 <tencent_54FF4252EDFB6533090A491A25EEF3EDBF06@qq.com>
 <12c6632b-65b7-43da-a954-7107ac8cb1b1@kernel.org>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <12c6632b-65b7-43da-a954-7107ac8cb1b1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0095.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::26) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA5PPF9D25F0C6D:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d88551d-34f4-412a-5036-08ddc3e6aca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3hnajBoUHd2Z3pqbEZiMmRXVlpIWW43Qk44TllzaGFWSjE4RXlMNUxjZXZI?=
 =?utf-8?B?SGNySzhUcTlyNWhXbkVaSGpFaXRIR28rbzJtemlNOElsRVJjS1E3a3YxeGNp?=
 =?utf-8?B?RUNjRnBidHdEeG8zTVo4aVREWkV5dkVmQi8zQ2VGZDZ5UVMxRmJ4RllWMTJX?=
 =?utf-8?B?cHlZbjBYZFpKNFhXazZ0anJJMlV4TDJDNElZd0EyaTh0dWRMcGZraExHR0hq?=
 =?utf-8?B?bG13VTYva0pmZnYvVGkwVXdmWE4vcG9KTXM0dlRJOEsyS1FTTU1VNGVORFlH?=
 =?utf-8?B?L25XNFpNZnBDNjBMMlJpSnJHOE05UGkrejhFUW5aYkFaQ00zckNPV01sbVNs?=
 =?utf-8?B?eDNoV2JEQ09hTjFYZTRVTkRLYXRFY2F4NTdEMDBDWGY5WDIvT1JOdzN1dVps?=
 =?utf-8?B?T082MDdzRHlTMk1QMzRNNll4c3JqSjFLemhmVGJGd1A1S2RDK0hwM2UvWFlS?=
 =?utf-8?B?RVpDQlhtV1Zib1I1cXZ6ZXJ3YTR4bTBlaFFLajlPTXZVRFhObFhOSnRMQVh0?=
 =?utf-8?B?WlJVa1VoOGVpYUJWK1dkMU1VWnJOSGRDcHBBZ0xQR1IyTk5TclZiUnUrVnBi?=
 =?utf-8?B?L3B5dVdUMVdKd0kyYmFXa1EwU3FBQUdpNlpYbGdCdnVaNXBVdkMrMzhwT3hm?=
 =?utf-8?B?bTFsQS9mY1paUDlveVBqdmUrSjRMSVRFTi9ldFJmVENXeWp5RndKS2dSWkFD?=
 =?utf-8?B?dmpZUStlZ3dGTTYzS2FUK1V6WU16Qk9WVzlHeGtDVEs1T2tMUSt4QkV4amRz?=
 =?utf-8?B?a2xLNTlEZVdaVHR5dFJpQW5LaWlVSDRUK2JOZW96MFp0MFdmb1h2MzIzOGFJ?=
 =?utf-8?B?Mjhlek1EVTArSkdLaUVyM0tyZnF6dnFlSDJKb2l2QTVIZU52WkZEMW5zcERW?=
 =?utf-8?B?SjUyNm9nTnRkdzJCQzgvRktjaUJ6MW42TXBLZ09XbVdYeXNYTWRqNHZ1TEZh?=
 =?utf-8?B?MjM2ak9vRmdRZTF4SXgvblE4OHl1dEtHWFp5bkZQelpOSWxvblk4T0FtL051?=
 =?utf-8?B?bSs5ZDA4R1Y3b0F6RlFCaFFzY0dnM1NPanNyRk1tc25oMjZFN2Njem1uTlMr?=
 =?utf-8?B?bVM1OG5OY1hmbmpsL3hIazIrQXp0Y0d5U2V0QnJnVmFMTEVSdkZGUGJ6cUNj?=
 =?utf-8?B?WWdJRW9GZ1V1bnZTRXlqSHpzQTdhQWU2b2tGNGw1ZC9UL2dPYVRMU2lQL0pG?=
 =?utf-8?B?dDZPMDl3K2QwMzdCeGhQRXZsa1BGNi92Z1pwb2ttTFBnQjVpTFNOQmhxNDZn?=
 =?utf-8?B?WTJjR3F5V0VxRUJmVEZKT0o1eUpUYjMyTm00azZnSzZaSnEyZjVxZUwzd29F?=
 =?utf-8?B?dm9aZDRQdEdFSVVBNVA2ZVVQY3JDcmR1NWRpci9xWTYvdjdwajRFQ05kVDU3?=
 =?utf-8?B?M1JFRzJMSUYwSitlWUo0Q0hPWHdpNVFhTmhPUDkyaUJFM2JMK2RSZkNIYWli?=
 =?utf-8?B?eVRtWlNGZWlVKzBYY1REZDdDVDZ4bDNlcTNiYnhwbEd5UHBSeEVMbXhZSlNy?=
 =?utf-8?B?S3FLK1VDS3dFSDY2dkF1b1RRbW1TcGpsb09ydk5ZNVFPenByVDNkcitwY1ZQ?=
 =?utf-8?B?bXpKVHBSMmM3aVhOMkgvdFZDZWZlTVBIcForOTZVZEFFK25yVjByVC9TK0Ew?=
 =?utf-8?B?enZBVWdpODIzek9tRXgxT1ZSdVZPOVVybXgvU3hwMHlPUDhQTU1DT0NVcldT?=
 =?utf-8?B?YWlKbm5jeTByRm04ajgzYldnbEV3VjZIZmlYU2dmYzh3NlZyM1UvY1lQTXNL?=
 =?utf-8?B?K2U4cGJEQS9XUk82S1VSMFNVV0ltL1ZiK1VDckx6Skk0YWpoQjdCMkJ0YUtq?=
 =?utf-8?B?YXJIYXJpaDR1aDZNNTZZNExncjVvVk0wV2tFVGFmMGVRQnJkVGE4aC9HR1pp?=
 =?utf-8?B?YUEvOUZ2QjNDby82OXhwZ3hPSFpZYzFZUjNZNElVTVU4R0VnSzY4U3I0MUtv?=
 =?utf-8?Q?002FXm3LdA0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1JwTCtkMi93N3F1aDdrYWdDbER0VlhKM29STENCQU5qcEorQUtUd3BQaWxQ?=
 =?utf-8?B?VUZOZENMSzAzT3JtSnNZdzl3TkRSSi9LQlVBNkZaMDE5VTZWNkNPOXZQOU1z?=
 =?utf-8?B?RmQ0OE1sNHpJaU9xalo0bVR6d0VZUlNLa01UU2xHcUUra0hkeE92RmMxWnFs?=
 =?utf-8?B?NnllNit1ZmF2ZHpCc0pEdUp3SWtOQ05KQ1J1V3F6aDZkbldBWmU4Z1ZoWUxQ?=
 =?utf-8?B?TXIxL1lqeTR4TzUweWo3YUM5aWQwTkdJUkptWVlaTTVLZEloRWcrZmhqK2V5?=
 =?utf-8?B?THVoVFo0b2JTNE1hZUJ3bjljWCtaTEp4MDZjNG1OVmVib1lKZ21GazQvOXhD?=
 =?utf-8?B?R0ozcW96eFAycC9pMEwvQnpoZ0x1YnVBVzFWSEhjZTQ4elp2ZmhTeUtHNGJR?=
 =?utf-8?B?SU40Y3oxQTFrUmZFeVNxRlNOMXpqTWVpY1c1ejZ6UFg2YytMYnVsL1hUNTVM?=
 =?utf-8?B?ZTQ3d0oyYVpGcTRUTmdsSjByNkQ3TzI1eFQ2UXQ5eUl3SXhkWU1Va3MxNXUz?=
 =?utf-8?B?c2pZTm81RWdnVzE4RDU5L3doMzVPWm9LM3QrKy9YTmlhYVhXNlROWUp6THpv?=
 =?utf-8?B?TVk1bVU0R00vM2xCYXY3Rzh3eEcvQndUSW9XbExLR21DKzMrSkRma2tlZlZr?=
 =?utf-8?B?Uzg5Z2RoY2pCcDZjNFFzTTBnZVhOOVphbUx5djNsZUJFTTVTdE43OVpQTGdk?=
 =?utf-8?B?OW9TQVNsMHlSdE55QUxoYjU4a3doUHl6TWlmVTFFZm5pQ0orUHl2WTlFTkFv?=
 =?utf-8?B?QTM5aVM0S1BMUE5QU0E5d2xIUE1zajFBUTR5R01HRkpVSDE4Wk1KUndRYVBQ?=
 =?utf-8?B?VWRyMTl4V1BXdGgrUlluK3NEaFF5bnowVkdMRDdSNVorR09qWlpFdjQzMG9T?=
 =?utf-8?B?bG9DWkk5SEFRelROTkdDSnFQQ0ZmdDZyNVlYRitlTGF3WXNWNUxLTHhvci9X?=
 =?utf-8?B?N1pORzlqQnJjQUIraDlvZmFvbDJPV0l6WERrSkRhd3hobndBN2xPaHVYaFg2?=
 =?utf-8?B?eEgwbEg5K3NOZ2J6S0RKSFdsbWluS1N6WjlOYzNNUHhiMVBieHdQbElEcmFX?=
 =?utf-8?B?NmM1bGlGUGxwVWFEZ2Fob0IvZ2ZRNE1pa3FmUW1jdDlMSWhRSXI1RmxlUVYx?=
 =?utf-8?B?bnBDeTVQREhtV254R05jcDlBa2JzR3hGVERYR0RHM0RTOEVTKzZXN0dwaUpW?=
 =?utf-8?B?R0Z0SGwxTXlRRTVyd3hXZTdTOTFEQkRlT0xUMS80YzhSempJeVAydHlYbS9X?=
 =?utf-8?B?Q3FMQWJSMlJVRXhFS2cvcWthZmVQZWJKUk5ubFVBNUtDYWpoRHQraFdqTlYw?=
 =?utf-8?B?TWhEZmE5bVZpS0M2Y3FTN0JaOFczUWRQekk0dzdmK2dhN05TRXZ3V2JWd0JT?=
 =?utf-8?B?MHZJZ2JORFVXQVFHeFB6Y3NIbmhqbUlWR2dKT2ZONGd6Uk8vck5acURmOEdo?=
 =?utf-8?B?bGhNL1JtZGd5YkI0SU5pSk51ZGNnUUZtclM3RlhUSVp2ZmxkT000WWlTaHF4?=
 =?utf-8?B?d3BkMDJMSDNSVWRKdldwNG0xckoxTWJhb1FPSmRDcDIzcGRreTJIRW9hM05l?=
 =?utf-8?B?Y0FPSmZuUHI3eDVmbk1jeUtLUWNmbmExbHpvSHhaZi9qYUliNXV6bGowVjJ1?=
 =?utf-8?B?ZFpvNWNYeU54aVFjemxsenlSSHZMM1RUQXRCcUlmbnFYTHQzNmZKU1B6ZW9Y?=
 =?utf-8?B?dEN4NUNvbU92SG5yTkErS2NpY09uMHRQVFh2bFhiRVB6RWFqVFNMT09Kc2Ja?=
 =?utf-8?B?RlEyUU9WSEpSVXpVSmNITkRzRUlpUkxYTU9BeVE5Rm4vajNSZVRzNEJPVlVh?=
 =?utf-8?B?dWl3MmRCblkyUnBkZUhRanZFRC9sOUhMV2NzR1VXVnBPbmV3K3Byam9vNlVp?=
 =?utf-8?B?RFA2R05BZlJnd2c4UmpiVEJ1dWVUMExqZjQ3RGNWczFjN25BQlc4cDJyaWpJ?=
 =?utf-8?B?TGRLZ2t1UjZFcmxlZHJrbWJkS2dTQ1diM1poeXM5SWZTQXAyUjVXTVpSY3I1?=
 =?utf-8?B?Y1JDMTdON2t5U1JpbnVYMjk0SmQ5a2ZKNkpiU0gyMjB2a3FpRU95ZXNlbGFm?=
 =?utf-8?B?bGZQa1RPS05zR2lJT2JmYjlvMUJNWEVlTVgzQWVZV3VRQ1FUZHBjOFlOT0FL?=
 =?utf-8?Q?t9LBtxzSMJb+RmvEOU3cFbC6G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d88551d-34f4-412a-5036-08ddc3e6aca2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 21:29:26.4847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d87UTlFOLsJvmJqhxf28UTEP0j+Ak1swgUmZUfa/I/vCKThA7zjRK0zlVVZ4uaPEI2DHRIy5lCXxECZLme1bsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF9D25F0C6D
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

On 7/15/2025 5:44 AM, Krzysztof Kozlowski wrote:
> On 04/07/2025 05:16, jackysliu wrote:
>> From: jackysliu <Security@tencent.com>
>>
>> A null pointer dereference vulnerability exists in the AMD display driver's
>>   (DC module) cleanup function dc_destruct().
>>   When display control context (dc->ctx) construction fails
>>   (due to memory allocation failure), this pointer remains NULL.
>> During subsequent error handling when dc_destruct() is called,
>> there's no NULL check before dereferencing the perf_trace member
>>   (dc->ctx->perf_trace),
>>   causing a kernel null pointer dereference crash
>>
>> Signed-off-by: jackysliu <Security@tencent.com>
>> ---
>>   drivers/gpu/drm/amd/display/dc/core/dc.c | 20 ++++++++++++--------
>>   1 file changed, 12 insertions(+), 8 deletions(-)
> 
> You should disclose that you used some AI tool for that... and that
> other report(s) was really fake finding.  People should know you
> generated it with AI, so they could make informed decision whether to
> even allocate time here.
> 
> Best regards,
> Krzysztof

Failure paths are so rarely executed that it sometimes takes years or 
static analyzers to find and fix issues.

In this case I think it's a real problem.  During init the following 
sequence happens:

dc_create()
->dc_construct_ctx()

If dc_construct_ctx() fails then it jumps to a label that calls 
dc_destruct().  So if the context wasn't set up then yeah there could be 
a NULL pointer deref.

So to me this makes sense.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

Harry, do you agree?
