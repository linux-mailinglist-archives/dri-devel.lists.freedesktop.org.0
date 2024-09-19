Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF20997CD97
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 20:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA2810E74D;
	Thu, 19 Sep 2024 18:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mmgNyJCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E49910E74D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2024 18:32:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNBh9CTbJqsWtN7w5WPZVbT1m6rKii9TOAChecCTgzfwGiATAB53OLInk76QfV+4ZmJeBBkOwbtVgrXpP2ekNn5Mbr9d7wdAYe1nimnipyq8/9YndSYmMZOkbLEi2nXvn3urHLmDNvEhUGsoaZegdvEIdvP3TOeydhi7WLAchBc1WgeikvQ0lhzm5grVChsnw+S+Pu5y+FX6NeOzdwX3DFsyoiu98RIjQEYwqyG1hwahZxXnsLH8bhWRhJFZTfJnvwYYve6iCRizD9KOlbDMxx8yJe6QsSqNEUTCNM97J1A+bMNfxhCSjIJcjLUhXZmoKH/9/JZM4SHG8SoPvcV1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/313ggd68WhfzRu/Se3PMJlgdb8JFXYKRe1YA73xPeI=;
 b=YOhDLVJXSp5q+SoPurpmOc3iE+MkuNgXsp5JM0EZIcCSsESM6SZatpsmgOlTzKmuvidPqWuU9DCNxMYkI+B7fnH6fGXY9O8HhMhDCSv25tyMmCySYhoZhVqapubo+Vkw6Dlqki+93EjFxu/sBdsiLlf/uooc4hgtYzTnL+hIX4zaJ3lm9TuSHqnbw9jSck8Ym9ysbe1sxI2flRRrRJfeRE9f1wbmhv8xJPWzu5XtBFBVee+uuTeA3Fbma+FVbCvzqh4HiyY6GXrtDoQWcz3+pWUKuqRJPnEK5a4x7aIYslzaG5y5UO4RxGhzF8D1PV5+WhZfSRAdwg9t/8Tsw2XAtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/313ggd68WhfzRu/Se3PMJlgdb8JFXYKRe1YA73xPeI=;
 b=mmgNyJCsnMJux8TlaDF4lsKSLx3oNEYSQ29sj9R7tBx3cibzTKqhTTiOo9//dSlH61fWFgVEQ+XuKvTgvHpi2ZyKf6OykBj2KxrgI/ROrEqrtdLHZc99lsf4GDsDCK8MAxiYi2ceSr8B8ug62aqCl8xOGQt0aJJzM1jJcVsQBMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB7559.namprd12.prod.outlook.com (2603:10b6:8:134::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 18:32:05 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 18:32:05 +0000
Message-ID: <248d6066-bf38-43a5-bfb1-91ce855ea03b@amd.com>
Date: Thu, 19 Sep 2024 13:32:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] acpi/x86: s2idle: handle screen off/on calls
 outside of suspend sequence
To: Alex Deucher <alexdeucher@gmail.com>, "Luke D. Jones" <luke@ljones.dev>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, linux-pm@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 platform-driver-x86@vger.kernel.org, me@kylegospodneti.ch
References: <20240919171952.403745-1-lkml@antheas.dev>
 <20240919171952.403745-3-lkml@antheas.dev>
 <1cbc0cda-549a-4333-9045-470c51981af5@amd.com>
 <CADnq5_N63ncHDdr+=xB5RqYZXnMjjrVCgqTDz0zmPdSP98ip-A@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CADnq5_N63ncHDdr+=xB5RqYZXnMjjrVCgqTDz0zmPdSP98ip-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN4PR0501CA0023.namprd05.prod.outlook.com
 (2603:10b6:803:40::36) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb96991-0dbd-460e-1590-08dcd8d95c5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0liUUhiZEY3SXkxb2JQTXVnUlpIeTRVOXpNdnMyU1FrK3IzN2RCNWlHOWdN?=
 =?utf-8?B?K201ZEdMcGVQdU1zd3VYakxONVlFM2lPKzFJc2dQQlJJSXh4SXFJa3krME9Y?=
 =?utf-8?B?ZXkyQkRwT3NrMlVTWmNnQklVamg2elN3SkVtMHlSeGNvRG1FMjdaTnFDaCty?=
 =?utf-8?B?VjdkWnlweUd4Tkg2d29SOGo1VDhaRkFNbUZFbXFuVlVNN0lkcWFWZEhLWDBa?=
 =?utf-8?B?cGZielk0S29sQWhyRFNHRUpKQ1JJV0RNUzN2NnhFUmYvc2dxRjBCd2FCb04x?=
 =?utf-8?B?dGlEeXBxTWpCZnN1UXNmUXBQZGNrNmZOS1E4OEJrNU1QampYNWw2VEtzOFE4?=
 =?utf-8?B?Z0Y3bitaeFgyZENZdk4xbk96ODM5WTcwVmtWS2xEbEJ1bTdoVE1nclVxdnda?=
 =?utf-8?B?MkZodFJoSkYySThjOS9EVElzVERqUzFPRGVmdjl6NzU0YW9NY0NIMVZqN0tk?=
 =?utf-8?B?WkpkSXlOUUFZVTZKaWU0MndIb3NnWTdYVWIvMUVKMEMvbFJDMlBvRUJIWHRh?=
 =?utf-8?B?T3d4TnhhM08yTXdSSFR2dVNBaUlFcE1KQm9nVTc0OGNYU3dSeC9sOE96VjBO?=
 =?utf-8?B?MHluNU5ZeXpvNjFndWMzUUZpZDFEUU9uWXhXY0pKazA4V3d0eEZPOTdnK0Rm?=
 =?utf-8?B?UDg0ajlhVGhOQ3U2bXVEMkNJRmhmM0NFVDU4WTJuczVQcXc3WXo2eENFUDEx?=
 =?utf-8?B?a3NDdnpMN3hSWlhPUmp1aGptUzZmMlNQN0dwZjE5Z1RPRE1JWGVLUmFZNDU5?=
 =?utf-8?B?SjZ2VmJKd3ExRVVLVWpUM2Z4cHUrWW9GKzB2TTdLYzh0d011MXQ5aDY1K2Vp?=
 =?utf-8?B?N0ttZ0cyN1NiTTh4U0N5T2JaOXR5OGsyaExXNjhpTlRESmFOZk9VdGlZdnYy?=
 =?utf-8?B?WG9RVUNTa0ZsMXZzS0lTS2E3Zzh2Q0dZMlR3Sng4U3dnT1JsRTl1WGFHdE04?=
 =?utf-8?B?WEhxbjFXdWhkMXBiMWtBQWVmVWhHOERPbUdFN3d3Slk0aUMrbHRHMnVMdnJS?=
 =?utf-8?B?Znhqb1RZN3pXbjlnaHNudXkrd05DWWFXVGVSYWRxVHZvOXpocGxsQnJja0x2?=
 =?utf-8?B?M0xzZjhiSWF6SDg2aEZFNnM5cW0vcTA2L2FyUWRLUTdCc0xNMXRuYWNJSFpz?=
 =?utf-8?B?RWN5bmZjUFpFU1NubHhKMEFRelZHakd3SU81a0hnV3VoYWJEQWFFcERKY2JI?=
 =?utf-8?B?ZHhocGRSdnJFTnRtL1lwcE0wSmtVM1Z6aDZ0L1BCb3pUNEIzWFZZdjJTbG9a?=
 =?utf-8?B?RWgwdUlkRkIxMHB1am92YjlISlYxZnROY3VUMDRaeWlVdGlyY3FEY21FZVpJ?=
 =?utf-8?B?N0Uxb2FaZklPalBhVmZiVnBmTGFJU1JsWDduc0FtNm85SGQzVGNhMkEwSlYy?=
 =?utf-8?B?dXoyK2VDN1pyaW0yZmw5MGdDbkFPeEpHa01Qc003RUtTcDNEN1d4dzZySmc3?=
 =?utf-8?B?TlgwTDJYTUtZalhoZk1qbUF6VWEyUXc2STR4QitqLzJwYkpiYUZPMFNqells?=
 =?utf-8?B?bmFSNkVBa2s1SVdabmdGeWRrc3VvancyNzdpeTMxa2dEQ0x3YmtpNzhaYmx3?=
 =?utf-8?B?dllHVnp6WE53TWEzYlJuUnRzNXpldGVYUENoNC80UDhOWmxDbDh5cEJwZzIr?=
 =?utf-8?B?Q2VIKzJ6YXAwMzRLL1U2TVpaN2M0WnZvdlU1bjl3WHhncHV3MXFtVXgwZVVR?=
 =?utf-8?B?TXJMWWxXRWVJTWhlUWE2STVxVmhlOS8xbis1NzNweFpHNGhwc2pjMlZKM2dr?=
 =?utf-8?Q?ZXHva5tGu/Yzvwu0pg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b210Nm9qR25RMzRGY0s3NHBaWE1oL1ZsTTNrTlNLQk5VMTJNTXhpVGgxUkJh?=
 =?utf-8?B?clhzMjltNWxlS0UwQXVsVElQa0pZUVN3dVQ5M055MWdiK25mekpoYWFmOHkx?=
 =?utf-8?B?ajNsRExHTXJUYlRxa29VSEFaa25ZL1ExQmNKb1dsMlBZNGRLUkhVWE1jQjdj?=
 =?utf-8?B?SzNOT2RqT29ONDRuMUJyeWpoa3FVQzlRYWRDcnYzYmc5NHVudmcyS3dXWGpy?=
 =?utf-8?B?Mk5Xdm52M3k2NlV1V0xnVDRHWUV3VmZKcGdnMklYbzZ1VXk0YmU3NG5Zc1hn?=
 =?utf-8?B?ZTBYZ0RMUzc1bEVRZDhudURtamUrT3czUjkwVFhoQTZhL2Y3bFBrWDJxQWpO?=
 =?utf-8?B?Mkd2VHdiUUZvYjNzRnpOMXVpVVNsVzYzWGhtblRPUGZlQkE0WUdpUm9aaHMy?=
 =?utf-8?B?S3hCaTZLZ0g5eVZ1VmxXUjBic0h4S2x3Y1gvaWZkclIwaU9UMFVseXlNaUw4?=
 =?utf-8?B?L0lTbHVmdGNPNitrYzZSSDJEWmVjNFNDdFF5bXVpajdPK2dWbVBkZWFQZWxD?=
 =?utf-8?B?MFNRTEFyczRiRWhwSm9wbEU0ZENOc1c1MitYVTcrT2hGS1dRUzUvcjlpckJL?=
 =?utf-8?B?ZVR3Zll5M25MU09uZElITzZCK1h6TW9pWElRcDREL2RFMWxTV0lHWnJza0cw?=
 =?utf-8?B?YllVMC9pbXJmQ1pNUkx3NVhtVUtGdjBFa3RGaEkzM3RKdDZGOTZ4VW9IZ0Vh?=
 =?utf-8?B?M3V4U1JpazhXV1VqZ205T3IzN1hVVXExTXlsU1hlM0hXbDViV2ZGZXBtTS9j?=
 =?utf-8?B?Sm54V1A4NGpHbmlJVHJDOEU2d25vckswV1VQSGRsc2FxZlQ3MXZQa29RYmI2?=
 =?utf-8?B?a3RGTHVzRjhUZ0M2cU4vTXd3cVJMa29jY0U5SVZFK05nbFNJQXZaQk0ycW5C?=
 =?utf-8?B?RTlSRVBnS1UyUFJ6eDd5TStCeTdZaHp6Rlk4WnI2dzYySDBUZWhPNTRUSHpu?=
 =?utf-8?B?M0ZsZC8vK3hCbmlqeVowcWhEOGY0SDZPcHp4c2lDMVpJdlI3TllQNW5CTm94?=
 =?utf-8?B?elQ5QzNlRGw1RlJrWU9zMTBWNEVJVC9MRnp6c3NrTHk5TTNoeEE2TjNWNWFp?=
 =?utf-8?B?WndicHd4Ni8xRUtabklrNlFNNnJ4WHplVk1EQzFMWTExbWp4TWZhcFh2YnpN?=
 =?utf-8?B?QjBUV3M2WWptRUFSNnhneWQxaSt1RDB6UGxoc25BK2F3d0FzT1piaENUMU9S?=
 =?utf-8?B?bW11YzMzblNpWmpwMUUwQmphSlp6MzZSY25aeVE0ZWVzN00wTGpHaTVnK2dZ?=
 =?utf-8?B?L005WXI4Z1NQVFVyTURQNHhOcE84dlhhdzQrVGlXYUluWEZHbGpnTGd3VXRJ?=
 =?utf-8?B?UU1mMU4rbGE5WjBFYnVEL0NrQlRDTjg5alkrTzRwdmlxL3FyUHlQenpTTW4v?=
 =?utf-8?B?Nnk1NFdJSmFpSUtWRHpES0plcVVXVzh0VUR5SkhpbmhlajRTeEdsY0tlNE82?=
 =?utf-8?B?eTJ6bkFjTHcrM2g2Y2RTV292VTJjK2tEZVFlYUIzajRsK214Y0x0TkVWR0dn?=
 =?utf-8?B?eXdDbHJXaituSGpReDJ1TldjYnI4R00xbDF1NWRKR1I5OEczMzdKckgwZzRk?=
 =?utf-8?B?Lzg1Vk8ycU1ZeEZDN0JvbDlkMEgvemQ0eS9KaGRWSGQ0LzlRWW1tR25vTnFL?=
 =?utf-8?B?VS9ybXJ3Q3VEQjFzaklsOXdCQ2grcVVkbXEzbkFBNTJndUlleFM1Wm9MbkQx?=
 =?utf-8?B?U1lqOXYrbngySkVBM1VOaDBZVXF0MWMzT0JEN1RDcE5HbU5RaEtvYW5Zd2Rp?=
 =?utf-8?B?SVk0SGxWM1RvMmp6TUdyREJQUHpPdjJKUnQ1aW5zak5ZN3VmZFNSOGUwTndY?=
 =?utf-8?B?Z2w0N3pzbGs5RktNMHl6K3YyV3IvYzV6RWR4Vk1UQzR2UDNNV0ExaXBveG12?=
 =?utf-8?B?OHpJUVB0YzV6OVl1Tld2N2F2TWZzSVVTRGt2b2JUc0pka0daNE1KNlFVZkNm?=
 =?utf-8?B?WEE1Ry93eTlSZG95WklJSW5rZGdsQUY3OTNhdHlodmVPV0lvQ1h2ZmptSklH?=
 =?utf-8?B?MENnQU5RcUtBbXlBUk9zN2VrcUg1ditQL0pMU0tFSmlGb2VFblE0TnliQ1py?=
 =?utf-8?B?Y1hsbW1xc0Y2aE5SR1ptMWkrOGNUSnZ1OTd1WVMvNjRMMlhOVG1ZdlZna1Qz?=
 =?utf-8?Q?ULd5vXDLH7EfNZCWp4YhmNfR+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb96991-0dbd-460e-1590-08dcd8d95c5e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 18:32:05.0003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ySGKyOh5a/0bpP4CTe5kKdNfRoF6PqdrgLBFUIvVXcpO15hPhUZYGzwUQLjaQI/ooT6eVHlQdXDHwYu+ABpt5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7559
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

On 9/19/2024 13:21, Alex Deucher wrote:
> On Thu, Sep 19, 2024 at 1:35 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
>>
>> +dri-devel
>>
>> For those joining late; this is the full series for context.
>>
>> https://lore.kernel.org/linux-pm/20240919171952.403745-1-lkml@antheas.dev/T/#maee308be5349d8df25c8ccf12144ea96bbd4cbbd
>>
>> On 9/19/2024 12:19, Antheas Kapenekakis wrote:
>>> Currently, the screen off/on calls are handled within the suspend
>>> sequence, which is a deviation from Windows. This causes issues with
>>> certain devices, such as the ROG Ally, which expects this call to be
>>> executed with the kernel fully awake. The subsequent half-suspended
>>> state makes the controller of the device to fail to suspend properly.
>>>
>>> This patch calls the screen off/on callbacks before entering the suspend
>>> sequence, which fixes this issue. In addition, it opens the possibility
>>> of modelling a state such as "Screen Off" that mirrors Windows, as the
>>> callbacks will be accessible and validated to work outside of the
>>> suspend sequence.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>    kernel/power/suspend.c | 16 ++++++++++++++++
>>>    1 file changed, 16 insertions(+)
>>>
>>> diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
>>> index 19734b297527..afa95271ef00 100644
>>> --- a/kernel/power/suspend.c
>>> +++ b/kernel/power/suspend.c
>>> @@ -507,6 +507,19 @@ int suspend_devices_and_enter(suspend_state_t state)
>>>
>>>        pm_suspend_target_state = state;
>>>
>>> +     /*
>>> +      * Linux does not have the concept of a "Screen Off" state, so call
>>> +      * the platform functions for screen off prior to beginning the suspend
>>> +      * sequence, mirroring Windows which calls them outside of it as well.
>>> +      *
>>> +      * If Linux ever gains a "Screen Off" state, the following callbacks can
>>> +      * be replaced with a call that checks if we are in "Screen Off", in which
>>> +      * case they will NOOP and if not call them as a fallback.
>>> +      */
>>> +     error = platform_suspend_screen_off();
>>
>> It's a bit muddy; but I wonder if calling
>> drm_atomic_helper_disable_all() makes sense here.
> 
> I think we either want to call this after devices have suspended or
> it's something the drm drivers would call themselves once they have
> turned off the displays as part of their suspend handling.

Well the DRM devices do call drm_atomic_helper_disable_all() already as 
part of the sequence.

I had what I thought was a more logical way to approach this done in 
this PoC:

https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git/commit/?h=superm1/dsm-screen-on-off&id=db65ddd1c745108e0ad42fe613f5d2c1146ed3d9

But from the testing Luke and Antheas have done this doesn't work or 
change things.  It's still "too late" in the sequence.

> 
>>
>>> +     if (error)
>>> +             goto Screen_on;
>>> +
>>>        if (state == PM_SUSPEND_TO_IDLE)
>>>                pm_set_suspend_no_platform();
>>>
>>> @@ -540,6 +553,9 @@ int suspend_devices_and_enter(suspend_state_t state)
>>>     Close:
>>>        platform_resume_end(state);
>>>        pm_suspend_target_state = PM_SUSPEND_ON;
>>> +
>>> + Screen_on:
>>> +     platform_suspend_screen_on();
>>
>> The problem with my suggestion above is what would you put here for
>> symmetry?  drm_atomic_helper_resume() doesn't look right to me.
>>
>> Maybe it's a no-op from DRM perspective and the drivers handle it.
> 
> if suspend is aborted, this should be called after devices resume or
> from the relevant drm drivers.
> 
> The question is whether platforms with multiple GPUs care whether all
> GPUs have their displays off or if just the integrated GPU matters.
> Maybe after all PCI display class devices have suspended?

 From what Luke has told me about this problem unfortunately there's a 
nuanced "ordering problem" with a difference between Windows and Linux
at play here.

Asus does $STUFF in this _DSM screen off callback with assumptions about 
what happens next in the Windows suspend sequence.  Luke can talk more 
about these assumptions; he's studied it in HEAVY detail.

Before this series the order of events on the way down was like this:

(devices suspend)
(LPS0 screen off)
(LPS0 modern standby)
(LPS0 low power)

On resume it was:

(LPS0 exit low power)
(LPS0 exit modern standby)
(LPS0 screen on)
(devices resume)

What this series is "aiming" to do is move the LPS0 screen off and on to 
the very beginning of the suspend and screen on to the very end of resume.

The way it's done right now; it's got nothing to actually do with DRM. 
It would just be so much more logical to me if we really tied a _DSM 
screen off call with screens being off...
