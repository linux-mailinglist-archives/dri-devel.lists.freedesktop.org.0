Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB28E92480A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 21:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCA1410E2A6;
	Tue,  2 Jul 2024 19:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v4uEHmvw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A88310E069;
 Tue,  2 Jul 2024 19:19:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=atLkc32CV5CPuoj0itLpsE+bWN8fclGquIXySRKQ6YMC/UoWB55m4qaMBiMpIehAQfk4v3lOzfxM/e56LQ9Sum2YTDRNXs7exFUof1FtAecWVaMulHzI1OnRrKY7gP5HxzRmAzqoqC9oktab99Q8LDGjncAvcdr061X4hUBUEHJ+HUjDJ4HCDbIDliy8XjClToxA9yPy6Q/waTTYswwx9Yfq6cYxv8OwQP9X6q8uWCS4UGMjACPhVtE0oyzxkYalVmQHl/X4GLrorwiXB9q3zaAmspQbbe/0NGKlBne21PrnpQW+vofJGq/kDesEJRUS5eg9UAUz9QBzQOQ0UrRbFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VlhQmOyS2a51XXFWn3bNu9UB5Q0bAHXK4pT8ts6p/Y=;
 b=eI0iPvlokfi/Zkk1Bw7mtUeFdMftzAVqj/FxvUfNABHa+mdTp6H3kgUIVDomJqnxvCW2L8hk1iZGSv3wRFQaVmHYGJ0Ur3A02Wmbgpev/tR1+mMGrU3V7LIlr0oCUPqvQcGWsF+KX2RaqcW4BRICf01nmtLKrxAWDuBtMruH6CoNNpzBgdK23WqRM17jMSxFDr/JDxM8+yWJE3j9ljB52fQlSST8qAXuePu1gwk0Ix/KhGfVIjyVuilWb/BiVbdluIUZmDdALWoXnDTYGoujjfEZat8xWh/zGRB8/1IPy+kODlb+l/kp7DDjO/Otsn+lNir71AREv7Hrv0Ht1Bd4nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VlhQmOyS2a51XXFWn3bNu9UB5Q0bAHXK4pT8ts6p/Y=;
 b=v4uEHmvwg8xjcCd38latBOUF/VFSO4CW1YfIWIF+ah5JXiC5yu7wANqws49Qu+48alIeoTOgWQwvuI+s7RHuqkli4yu7fpXWOF8pC5D+l3SbVcHp1Z4vOnqX6izYm2/qFnDShmB6qwVgu/WpbQIFSoH8tVF4WPovzJ6yaf682kI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4371.namprd12.prod.outlook.com (2603:10b6:5:2a3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.34; Tue, 2 Jul
 2024 19:19:41 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 19:19:41 +0000
Message-ID: <507c1574-b6a2-4568-9828-94fd4ad2d86b@amd.com>
Date: Tue, 2 Jul 2024 14:19:39 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/amd: Add power_saving_policy drm property to
 eDP connectors
To: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 Simon Ser <contact@emersion.fr>, Harry Wentland <Harry.Wentland@amd.com>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@google.com>
References: <20240606020404.210989-1-mario.limonciello@amd.com>
 <20240606020404.210989-3-mario.limonciello@amd.com>
 <bc1d81ef-d9d0-4440-b63f-ecfb735ef783@amd.com>
 <d637d3c2-34f7-42f8-acbb-6a1730d3fc3c@amd.com>
 <CAFZQkGy0xuuUw73HQvS8Ce92sUi2rVrRnX25pi1KdNmyQbtBZA@mail.gmail.com>
 <CAFZQkGz8DeoiVX2MohoBoTMxraJk1Ou41N_wKP3GkqRrPg_6sg@mail.gmail.com>
 <49d70214-21e9-4547-96a8-ff168d922eaf@amd.com>
 <CAFZQkGyr6aupS6vzHc1=eHeFnA+t-yvvpQMD-4kP45Hi3a=5Qw@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAFZQkGyr6aupS6vzHc1=eHeFnA+t-yvvpQMD-4kP45Hi3a=5Qw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9P223CA0010.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4371:EE_
X-MS-Office365-Filtering-Correlation-Id: 326a0575-ad67-46e5-f6ac-08dc9acbec0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjQ4MFcvVjMzNURTeUUxNGoycU5SSzZpNHhEZmM1Q2NJMzltOFhla25HSG1J?=
 =?utf-8?B?NjAva3FlZWl0dWZodEhnOHZBbkJvay9NN1F2VUltS3d3SmtCeThKUUU0Tlhp?=
 =?utf-8?B?TkpqeTJpYVBxZm9JdUJnUnZWT0RzYnBPanRPcDdnVHNrYk12UnN3c25mVS8x?=
 =?utf-8?B?aUZxQi93aUMxcUx6L2FTc2lwcnpKbHNQVUxZbzVKZVViSjhkNXA5N3QwcE1X?=
 =?utf-8?B?SHZBd29sQm0xOGlseE5aR1NDR2VITjhHWDFlMVpXcUlUR0J3SjQ4SDJSL3FE?=
 =?utf-8?B?UjR6Tm5YVkNZaE5BSWFSaGJVWitsK1dhUE9SVHB1Wnp1QTdkUENweDc2N2Qz?=
 =?utf-8?B?ZlVqMlpRUDhmNUlhK3BIYlFxaXIvWXo4WGcyd1d4NFVnMERhTGM4TkQ3Wjdk?=
 =?utf-8?B?eEs2c09NbXA1dkwyb2FjL3M1aEpTR0JRSGNHZnhTOWpzQkRyMVhVS1NPT01I?=
 =?utf-8?B?emV3d2IvbWdjSVE0VXhJSTUrRnRoK2wybHZGSHplVkRYMWN1bk0wekFZSmo1?=
 =?utf-8?B?OWovMkgyTkFsWU5mTFFRNnYvY3pNWGNzRDlWRGQxZXM1Q1JvektIRloya3NZ?=
 =?utf-8?B?V0p2Z0RkdXU3dlJURkVBSGFnVXNPL2RTMEF2bmNvUFNTUXJNdjFobkZtdm1i?=
 =?utf-8?B?VzNxb0hwUG1GakVMK0NlWloxNXpWblE2Z3NNY3RVenA3MEY4ekJWVzMxclIw?=
 =?utf-8?B?M3NtT3FxTUx4OWQ2eXpjQ3hqc2tkdEljOENhdDd4WG5rVUxrZGtRVkZRemdC?=
 =?utf-8?B?TE1PcHl0eFZVU3BzeGREQmhTanE0a2dvTytBbXZacVpzbTV1b2V5cUZJZzFE?=
 =?utf-8?B?RTVzUTZrN1JUc0JRbEZlSVpacTRNTDlSbDZ6dm1tR0U1WmoxemZiZ1h1Zmd2?=
 =?utf-8?B?c1ZNd2llVUcvQjU2RE9GN2Y0MjJWRkFON1FlTlRUSVIvb2ExTVVtd1J3L1Mv?=
 =?utf-8?B?RXJMMUZFVGxEVE0vSExyaVpmNllwKzdRWVBiODFhYmJ0aFVndDEraDVuZzhI?=
 =?utf-8?B?aHFUNkRaZjZKZkxrWlNVS2xaU0JjbmFnUzlpTWUwb2labmVuZEI5UWZjS3BB?=
 =?utf-8?B?bHRkMHhHNEZUMEFJVElGODNjUnRLZG9NVmZZRExXcS9SbE5QOWNyZlNqb0Uv?=
 =?utf-8?B?S1RwdmM4eXFPcEw1Vm5qNGREM0JRczkvZTJFZUpJR3B1RkZyZjNwbTYrUERY?=
 =?utf-8?B?UTVGTStIK3AxN2Y0Uk5hbFZhQzBORWliMUpMVjFDQ0VXZFR5UEZRS2k3cC9n?=
 =?utf-8?B?WHFGMTdoaDlUaTMrWm03L0dYb3pTVXlHcHpPaFlQUE9wdlEwZmNVZ3Z3VDFh?=
 =?utf-8?B?WXZwZm90ZXNUUm1qNjFsVHBKVGplNzY4a2gyYTEwV0NHWDB6bkRJdXRPKzZY?=
 =?utf-8?B?UExvRytaTVhHWWkzUm0vRmxobzBqMEE0YkthUzRBbUhOUWhkZ3QzMU9wZ1d2?=
 =?utf-8?B?RUNOL013NkR1QU5MYUczNzZ1Ni80aHJlR3ZBOThYV1VHeWQ0SjNKTE9EZnMr?=
 =?utf-8?B?N0tMY2l4emlacnB4Tlh4Vkp5dDJ3R1BnS0hnM3FuYWtWUjVkY2dXWjJtV2l5?=
 =?utf-8?B?eHNmaVoxTUdnTzlKSnE2WXprb3hVaUpDcXk0cDJEZjRqQmdVVENKblVwcGZX?=
 =?utf-8?B?WUJFdGl2OThJNGQzWWRtekpVdHdlVmRmcDFhRUp2RGF3T01jV3hZOHVDSUZv?=
 =?utf-8?B?a3lWR2QyeVJHZFVrdkpCRTE3c3htVmtJTW5CYzRyVUh2UW1OdkJXMEVYSTJi?=
 =?utf-8?Q?5jkkvtWMldx/hXiUU4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1FJR3FpcWd3OVo3a05CV3IxZkNFVys3ZkJaWHpGNXlJWmNuVFlIZ1p3ZTVJ?=
 =?utf-8?B?ek8xUWJ5dDU0UG1UK25XVXl6TStBY3J2WklBRHJkTHEvV2ZRREJORDZlZW5W?=
 =?utf-8?B?MXJDUVVoUDlPU3hVWkk5WHRwSm1iWmN4azRUT0MwaCtwWE9nR0FVS2dxYlU5?=
 =?utf-8?B?dkNnNitqRFArdmkxMXhIZkhlVUw1S2k2S095OHdjd0Rtd3Z6M05QWXkvVmEw?=
 =?utf-8?B?RTVIWEMwanAyTjhnMGM5ZWdSM2RRcmVlcGpOMWpnQ0wyVWxvUDJCc0VPcVZR?=
 =?utf-8?B?SXRVMFV2YjhQZk1Kb0hTRnpxRkxmL21ST2dUTTNxcVllbVdCUHFOdU0rOTY2?=
 =?utf-8?B?ZVlzUVhGRlM0RGR4U1EyUkllT29HY1FSMVI3SnhldlIzYWM4RWk1SFl0MHUx?=
 =?utf-8?B?SVV1dnErNUJzeFJBc2wzM2pka1FWQ2JMT0pMY0pjeEx0MDk3a3FCbllQM0d6?=
 =?utf-8?B?Z3dqeVRZeHJrSGpBTEtNckJ2ZS82TUh0VTV4dDR5eWFuVTQ4UGtaS3Z1L09O?=
 =?utf-8?B?ZzhJcGtCcytaY2luU1p6N0o1U1ZXSXNxajNpQ2RRc3VpcVFvSmc2TTF3eDdU?=
 =?utf-8?B?UGhqaVRkODVFakJsaDhsbWcyN2VvSXJMVlQyWjhNY3huYmltRzFQR0RVTmVU?=
 =?utf-8?B?REtsZksxTUc3WndKUFQ3bHVQUWVWTXR3eHVqZG5LRWs2Nlc0SHRQeWg4K1Ay?=
 =?utf-8?B?emc2cXZLRHlXSVNPMjRJcGtnSWZFOGNzZDl6cGhQUHN5SnFCM0p3YTlyYjJG?=
 =?utf-8?B?ZVJNeU1rU0loOURwK2N6SGt5YjdSdU4rRzE1Tm9jZlk5QkxQVE41dlo1bVIx?=
 =?utf-8?B?NDl0QkNFUHBVa2JOcWc2eGFIUEtQVUh6bHdaTnUwMlJwRm9qYVlLVmp1eUV4?=
 =?utf-8?B?bTNvTTBCeHZVcVR0NFZENDFCYkVBODI2bDFvR25IS1dCZVBCanFYTW5jdmx3?=
 =?utf-8?B?VDRtSzd5cktkQVNsT2tMRWZDNld0eVpibHZXTEJJUjJPSDZ5d1FMU2pIMlc1?=
 =?utf-8?B?bXFYOHJyK2syYnVjZHNCaUF6czNrTDBFZGlLR0pPZHFHWUdUYkZzeU5jTUR2?=
 =?utf-8?B?RVYwTjVGOVAwMG56aVN4Z0RCSDBuWVpvcklmcjNpVU9EZ1NkZGJZN2FQenJX?=
 =?utf-8?B?amNNOVVvT3p6VGRqS2ZOMlJxTkZ1cFFManNWRXMraVdPckNmaHJsSmpqc2Uv?=
 =?utf-8?B?THdDbzNoYmhDaDdHYjkxTnRQM3NZK1REVVNMalBrVWxGWk9vSFRqMGIrYkQ0?=
 =?utf-8?B?ZElUR3k4ck1rWkNUSHJPdFRYWkZuRFVSWHFubFZXWWlqNlBjOGU5YkdwUUls?=
 =?utf-8?B?VnBBQlg0T0RKRnZjSHFaWmo4N2tmRmdJcWRqMGlKMllxUFNhVkl2SVNhcDRG?=
 =?utf-8?B?YnBOZTJ5V1MxbUwvQnpVZmZMM0RUS0thbEF5dmRDbGhpMjVhVFVMbk9JaFVm?=
 =?utf-8?B?VzNUSjJXZTFjclFWK3FNbS9JOGJaaHRTTFRRanZqMGFkL2ZhOUpmMmdqSkly?=
 =?utf-8?B?b0xWdEhwaWd1aU5nV2NHWHQ2ZjRkQ1RCd2J6aEVEU2Y1enpQM1EzOXdRWVFw?=
 =?utf-8?B?SnY1SENUeE1uOXhwZW1Ud3ozODFOb0Z5SlZFem1lVExrbFMzNFlpZXNndTRo?=
 =?utf-8?B?dFNsOWsvOGpZakxkeEU0Tis1MmJmZy9wR0xvV05pbGJVTW5QYTczLzdqN1lC?=
 =?utf-8?B?SWZmd2htTUpnMHY5bGJuRmV3anZHeGVyS25pUVRuMStQOUxNcjNYNWFjV1c5?=
 =?utf-8?B?Nk8wVDJMSTdRNUk0RzhCcGpxYWxyUXFsNXFoK2ZiTnpvcGJBZDlYQzhDd3Bi?=
 =?utf-8?B?Nm04c2RuazlaSVFHMnVkZjRBSnVjV1RHSisveFFsSm9MU0N3UTJZOW9Yb0tq?=
 =?utf-8?B?NzBhKzkzUUxIbWN1YUN4NE5obDNEcEZ0bjE3bTE4VE5VQzdPcGFmSXd0TVZs?=
 =?utf-8?B?b0UzalZpUkNhWUcwZ1dyVnA4bS96bzNvNDNjVE8zNjByRVFiMmxRU2ZKSXIz?=
 =?utf-8?B?NTlQbzV3NytjR2xWQ3lXTEZoWU8vTXVsNGwyNVp3dTVvSHhobWsvc0paczEy?=
 =?utf-8?B?TUhiNFVzc3VOb1ZOYWlzdjdJQ0ZkRDFMeEpKOVl5Qml3WEN6ZUJYcm9qVHJJ?=
 =?utf-8?Q?l9xMC1XFw56iaSdDe6SGiVk5k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326a0575-ad67-46e5-f6ac-08dc9acbec0a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 19:19:41.0813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZiDne3+xW1F7u0MdUIX79Q116erdIkiMB6F66Uz/qE46PyvSUuF8qin1GalrMwz6zy0YEVB8nYJi8aj5WqfRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4371
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

On 7/1/2024 17:34, Xaver Hugl wrote:
> Am Mo., 1. Juli 2024 um 21:02 Uhr schrieb Mario Limonciello
> <mario.limonciello@amd.com>:
>> Hmm I'm a bit surprised the IGT tests I did didn't catch this.
>>
>> Are you working on a system with two GPUs by chance (like a Framework
>> 16)?  If so; can you try the "other GPU"?
> 
> No, I tested on a Framework 13.
> 
>> As it seems your PR to span 3 projects and I've never built KDE before
>> can you spit out some artifacts somewhere that I can have a play with to
>> reproduce your result and find the kernel issue?  Arch pkgs would be
>> preferable for me, but some RPMs or DEBs are fine too.
> 
> Here you go: https://nx44777.your-storageshare.de/s/2j4Jy5anDwwzCtF
> and https://nx44777.your-storageshare.de/s/2rxJ4Tp2L8gdc8Y
> You can set the drm property to "Require color accuracy" with
> "kscreen-doctor output.1.allowColorPowerSaving.disallow" and to zero
> again with "kscreen-doctor output.1.allowColorPowerSaving.allow"

Thanks, I snagged the artifacts.  Of course when I tried to reproduce I 
hit a new issue where my series is causing problems with DSC on my panel.

X crashes and consequently SDDM doesn't come up so I don't even get to 
the point I can toggle the knob.

Mostly posting trace below in case root cause jumps out at anyone what 
actually went wrong.  It reproduces with amdgpu.abmlevel=0 on both 6.9.7 
and 6.10-rc6, but drop my patches and it's gone.

[drm] DSC precompute is not needed.
------------[ cut here ]------------
WARNING: CPU: 7 PID: 321 at 
drivers/gpu/drm/amd/amdgpu/../display/dc/dsc/dcn20/dcn20_dsc.c:272 
dsc2_disable+0xec/0x170 [amdgpu]
Modules linked in: amdgpu(+) amdxcp i2c_algo_bit drm_ttm_helper ttm 
drm_exec gpu_sched drm_suballoc_helper drm_buddy drm_display_helper 
drm_kms_helper drm drm_panel_orientation_quirks nvme serio_raw nvme_core 
video
CPU: 7 PID: 321 Comm: (udev-worker) Not tainted 
6.9.7-00002-gde664ea69218 #241
Hardware name: Framework Laptop 13 (AMD Ryzen 7040Series)/FRANMDCP05, 
BIOS 03.05 03/29/2024
RIP: 0010:dsc2_disable+0xec/0x170 [amdgpu]
Code: 4c 24 0c 44 8b 43 10 48 8b 40 10 48 8b 30 48 85 f6 74 04 48 8b 76 
08 48 c7 c1 98 71 49 c1 ba 08 00 00 00 31 ff e8 84 53 7d ff <0f> 0b 48 
8b 53 20 48 8b 43 28 45 31 c9 48 8b 7b 08 0f b6 8a b4 00
RSP: 0018:ffffb96f80a46e80 EFLAGS: 00010246
RAX: 0000000000000000 RBX: ffff95a144c19000 RCX: ffffffffc1497198
RDX: 0000000000000008 RSI: ffff95a141d8b0c8 RDI: 0000000000000000
RBP: ffff95a1552002d8 R08: 0000000000000000 R09: 0000000000000000
R10: 000000000000014b R11: 0000000000000000 R12: ffff95a14f41d680
R13: 0000000000000001 R14: ffff95a151338000 R15: ffff95a151338000
FS:  00007f3e17557880(0000) GS:ffff95a4ae780000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ab019b1288 CR3: 000000010bb2c000 CR4: 0000000000f50ef0
PKRU: 55555554
Call Trace:
  <TASK>
  ? dsc2_disable+0xec/0x170 [amdgpu]
  ? __warn.cold+0x8e/0xe8
  ? dsc2_disable+0xec/0x170 [amdgpu]
  ? report_bug+0xef/0x1d0
  ? handle_bug+0x3c/0x80
  ? exc_invalid_op+0x13/0x60
  ? asm_exc_invalid_op+0x16/0x20
  ? dsc2_disable+0xec/0x170 [amdgpu]
  link_set_dsc_on_stream+0x3f2/0x470 [amdgpu]
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? dm_helpers_dp_write_dsc_enable+0x286/0x720 [amdgpu]
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? disable_link+0x1e1/0x210 [amdgpu]
  link_set_dsc_enable+0x7f/0x90 [amdgpu]
  link_set_dpms_off+0x1ad/0x990 [amdgpu]
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? dmub_srv_get_fw_boot_status+0x43/0x60 [amdgpu]
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? dm_read_reg_func+0x57/0xc0 [amdgpu]
  ? srso_alias_return_thunk+0x5/0xfbef5
  dc_commit_state_no_check+0x878/0x1990 [amdgpu]
  dc_commit_streams+0x29d/0x580 [amdgpu]
  ? srso_alias_return_thunk+0x5/0xfbef5
  amdgpu_dm_atomic_commit_tail+0x686/0x44c0 [amdgpu]
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? dcn314_validate_bandwidth+0x181/0x3f0 [amdgpu]
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? dma_resv_get_fences+0xb7/0x310
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? amdgpu_dm_plane_helper_prepare_fb+0x1a0/0x2b0 [amdgpu]
  commit_tail+0xbf/0x170 [drm_kms_helper]
  drm_atomic_helper_commit+0x116/0x140 [drm_kms_helper]
  drm_atomic_commit+0x99/0xd0 [drm]
  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
  drm_client_modeset_commit_atomic+0x1e2/0x220 [drm]
  drm_client_modeset_commit_locked+0x56/0x160 [drm]
  ? srso_alias_return_thunk+0x5/0xfbef5
  drm_client_modeset_commit+0x21/0x40 [drm]
  __drm_fb_helper_restore_fbdev_mode_unlocked+0xae/0xf0 [drm_kms_helper]
  drm_fb_helper_set_par+0x2c/0x40 [drm_kms_helper]
  fbcon_init+0x2d6/0x670
  visual_init+0xea/0x180
  do_bind_con_driver.isra.0+0x241/0x390
  ? fbcon_startup+0x1fe/0x2e0
  do_take_over_console+0x177/0x1f0
  ? kmalloc_trace+0x246/0x2f0
  do_fbcon_takeover+0x72/0x130
  fbcon_fb_registered+0x33/0x80
  register_framebuffer+0x192/0x2b0
  __drm_fb_helper_initial_config_and_unlock+0x389/0x450 [drm_kms_helper]
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? amdgpu_driver_open_kms+0xcd/0x260 [amdgpu]
  drm_fbdev_generic_client_hotplug+0x67/0xa0 [drm_kms_helper]
  ? srso_alias_return_thunk+0x5/0xfbef5
  drm_client_register+0x72/0xb0 [drm]
  amdgpu_pci_probe+0x441/0x4c0 [amdgpu]
  ? srso_alias_return_thunk+0x5/0xfbef5
  local_pci_probe+0x3e/0x80
  pci_device_probe+0xbd/0x2a0
  really_probe+0xeb/0x350
  ? pm_runtime_barrier+0x50/0x90
  __driver_probe_device+0x87/0x130
  driver_probe_device+0x1f/0xc0
  __driver_attach+0xcb/0x1f0
  ? __pfx___driver_attach+0x10/0x10
  bus_for_each_dev+0x77/0xd0
  bus_add_driver+0x10e/0x200
  driver_register+0x6e/0xc0
  ? __pfx_amdgpu_init+0x10/0x10 [amdgpu]
  do_one_initcall+0x3f/0x2f0
  ? do_init_module+0x22/0x230
  do_init_module+0x60/0x230
  init_module_from_file+0x86/0xc0
  idempotent_init_module+0x10b/0x2a0
  __x64_sys_finit_module+0x5a/0xb0
  do_syscall_64+0x80/0x180
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? vfs_fstatat+0x90/0xb0
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? __do_sys_newfstatat+0x25/0x60
  ? do_syscall_64+0x8d/0x180
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? vfs_read+0x1f9/0x330
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? syscall_exit_to_user_mode+0x71/0x210
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? do_syscall_64+0x8d/0x180
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? syscall_exit_to_user_mode+0x71/0x210
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? do_syscall_64+0x8d/0x180
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? do_sys_openat2+0x82/0xc0
  ? do_syscall_64+0x8d/0x180
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? syscall_exit_to_user_mode+0x71/0x210
  ? srso_alias_return_thunk+0x5/0xfbef5
  ? do_syscall_64+0x8d/0x180
  ? srso_alias_return_thunk+0x5/0xfbef5
  entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7f3e17db6f9d
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 
f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 
f0 ff ff 73 01 c3 48 8b 0d 5b 6d 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffd4f93b6c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 000055ab019a43d0 RCX: 00007f3e17db6f9d
RDX: 0000000000000000 RSI: 000055ab019a85b0 RDI: 0000000000000021
RBP: 000055ab019a85b0 R08: 0000000000000040 R09: 000055ab0199158f
R10: fffffffffffffec0 R11: 0000000000000246 R12: 0000000000020000
R13: 000055ab019a6300 R14: 000055ab019aae70 R15: 000055ab019aaa90
  </TASK>
---[ end trace 0000000000000000 ]---
