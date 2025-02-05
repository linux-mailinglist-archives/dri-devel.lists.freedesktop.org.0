Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0496A29B75
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 21:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5557A10E3FC;
	Wed,  5 Feb 2025 20:53:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DY3VLEIF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A669F10E3F0;
 Wed,  5 Feb 2025 20:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzzl0Is6+ftn2FR/8/mX6EwfJ2df5sWvy10grLnHIxwSpj+FOjSxOvhh/8RrcGiHr6QUZmtQg1jaVmwb7zZxh/d0pkVc2VM3NY/qibUis/iRKRKkdJaf5hzF3l5iUrYLrJeSkz4Z9QuI/4Jq3lOaZTK+k6A9Hyd+rRVp/TYpn9DRBtUuCn6+erdjn1a3gk+8+t3P3U92yeD3cd5Xb3+SuV1c2uhiAmnBllvd6cHmbmXLylY4RF/UkOpALUhujO11f/g3sc2Q2mhvwZCCujlbW8N9YYHxc9HJ1RKIigvHojJwzGM+EwouCGXKpT0b5fGL73VfaX7qenw+hZ2O/SyjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfNUTjexu8V6cSXnqw9JMeQ9M429L8jp18UZ83/4Pwc=;
 b=y+ZwcgvTaOS6QVRWyrfEvOgjj8geh4HFN8pH7OYtLxJ77P73HL+l0X0rvCpkSN/nI1M8WRq+b7NH2xgrYVTKOJEWGr///1Btw/YcN3czcqKCZD3iU2AkxO0J3HuQh3mdWxRXZzjl3ggXMDuGhN/Endj0MrTA2Mn18MKR0esiJ4tvaJne5s8a33Rs4cwxEKscu8zjenUSZ/xHQFlQ4wa0e70qxqaA8IRSzIpHyAKvZKse4zCUqjGy/flrMn3Wv1kF5sJdxsHc39oM1QF4sIFSp4GD1ozU4KJ34kcsrhaUlJ8VGidlZsdA2jblrbDd2BqDYTQNq0wQ1Ke+ye023NvbyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfNUTjexu8V6cSXnqw9JMeQ9M429L8jp18UZ83/4Pwc=;
 b=DY3VLEIFsBxahnXoP8OYkzw5/HGCWK21GAwPZq7962WSLKutj9TqAt8264UXUgb2ryBS0G2OXQxc/UiB/XiRU2bT7Sr52hgc5Yn49yNC4JH0f+IfCvUBi2FzrmfH5G39PHQAAqN924hMyTcVHgsKw91i8PNMfmJWol6ozjGEsgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DS7PR12MB8370.namprd12.prod.outlook.com (2603:10b6:8:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Wed, 5 Feb
 2025 20:43:04 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 20:43:04 +0000
Message-ID: <8d81bf09-ec6f-4753-b324-a9614e2a37a1@amd.com>
Date: Wed, 5 Feb 2025 15:43:01 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Refactor find_system_memory()
To: Mario Limonciello <superm1@kernel.org>, mario.limonciello@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250204222140.3883013-1-superm1@kernel.org>
 <65b47db9-883b-46c6-919a-e84c3ffde401@amd.com>
 <0451e510-f8e4-4539-a3ce-cc9fbe71964f@kernel.org>
 <30fbb0d6-b911-4a99-bcdc-38e2ede5eaa0@amd.com>
 <1a046955-de2e-4d5f-8b47-ca90d7aebf9f@kernel.org>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <1a046955-de2e-4d5f-8b47-ca90d7aebf9f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0159.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::19) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DS7PR12MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee704a8-ec24-46f3-cad2-08dd4625b01f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3c0UGpKN21QRSs4TUVhNDZram5aaTBwcGJuTU5la0NYZ2lsckt0ZmxkZmd6?=
 =?utf-8?B?NndvbWFvQkYxblZlOVRaOTNIc2dFYXhqT2c4N1VrcFpLaXZvSEp2d0VxRUY3?=
 =?utf-8?B?MnFSUFFiVEtLaG91dis2WWJXVFRneW9mQ1FiYmZWVTdEamxGMW9qTEc4ZmVw?=
 =?utf-8?B?UktrNUdzd0UvWHpHRkJkanpXd2k1ZHFFRnk2STJweUxwWlJldGhmQzk2WVFM?=
 =?utf-8?B?S2NETkVPZXhmWXBCeit2cVBLTFRPMnNaM040cWZ4VVVldU44SG51eVNuRmJV?=
 =?utf-8?B?OWpoQWYrbjFpUThKUVBoZG5QVDNlOWNHSGplK1ptNHo5WEQrdStLRDZZd1Mr?=
 =?utf-8?B?TGEvNEUwMnZkQjZGTmhKdjNDSUpKWGRkaGk3QXMvOEt3dEpJY2FGVEtjT29k?=
 =?utf-8?B?ZGlpbnUzVHE2UkYvanI1d2s5NWN3cks4cE51SEhxdzRwRUlpTTlJeG1rSzZZ?=
 =?utf-8?B?a1RJYWZkZUdhbHh1S2pRa01WY0U5SE40Vk82VkRidXcyby82WWI3cXpvaHcx?=
 =?utf-8?B?aVFJMWIzNzhKZURzS1pjbjQyMzJEQVRiUFcvS3RYL2dFNzRNTjhTaHVhU01K?=
 =?utf-8?B?ak1xM2N4WUdsWmMvRkl6OUJSbzZhWE0rRWZDSXd6Y1NTcStIZkJ4ZzExMlRL?=
 =?utf-8?B?MWZ6SElLMEJHSXZmTUR4UlB5bWl1a2hmUldoWWNwcURaeDF4ak1jMTFXeXNw?=
 =?utf-8?B?NTZiSmlaU3V3R0FzQ2syTDBKUmV3U1BpV1Y2YmIremJ1TEx1RklhRDJzQUt3?=
 =?utf-8?B?MHRZYlFSTGhWSXo0eFVRbVBVUmlEUGx5enBoc2R2TkxRRUk4bGtNSTNxREhD?=
 =?utf-8?B?d0c5eVRpMWdRbGNpNzBCS3ZDaXRMbEs5VUljWG5zV1dmTWtIbXNNWFBoVnRH?=
 =?utf-8?B?OTdVM2UwNHBGOXlnenZ2Z1BlM1dTb0NQTkIxNFdaOWl0QjAwTXBQdCs2TWpn?=
 =?utf-8?B?cmhseHFRakJqVXRaTWJlYzJKRTMxK3lKazlydDdIM0RZWVh2anRMVkNiNlRX?=
 =?utf-8?B?Y2doTVpiYXc3VStpNjN4MWVqU0d2VVVJQVRTQUErQW9CRXJ2aFRLc2sxUlJs?=
 =?utf-8?B?bU4wazJTKytlNVhJdVhUNk03cmsrUW5YNzlqOXRWeERjNSt5cU9UY1g2RVhM?=
 =?utf-8?B?TjdmS1YrUGVyRjFXREltOVNvQ1NWaDhwR25seVRUT1BYMTlFajBWQzhrTWk0?=
 =?utf-8?B?MEVva2tBRHRHdHV3WUFHREZXcjl1ZG9SSUt4VGIxbEhNVnFxYysxc1lmTE5X?=
 =?utf-8?B?M0k5NU9RWVlJeDJDS3BlV0J5V0MyQ2JSdGtHU05UWms5NkpsbWdjOGl1Y1Y5?=
 =?utf-8?B?dEtkMnNVV0VkOHpVMy9uRlFzeThSTDhKYWxYMk8wYTcyWFF1WWN2TituL1FS?=
 =?utf-8?B?alVqaDBHRkdFb2kxdHRWT0R6cEhuaVZnYzJ4dUhPWlNGOWtJMEJQeUptSk9l?=
 =?utf-8?B?N1lCYkVMOTNjeWZnS0lsWkpzc3VVOVVrb2xPUk1DSFV3NVErWGdtdG43U0Jk?=
 =?utf-8?B?cHlwenA3TmlOMkNRRWJvU3U0MS9KNjE0emVuRWRJRjBXUk5nbUd1TEROTDFD?=
 =?utf-8?B?RmdLVC90UkNnc2h5Wkw4TzU1REFQMDFoelNNblFUS2srQW1SZWQvY2JqZW8x?=
 =?utf-8?B?cmdkd3BnTncvSUlFSXpFYitwaWNFMXVTMUcwWmV3UHFrQUhXUlV2RTMxRHhK?=
 =?utf-8?B?d3IrQnVhNU5TbXhIY1E2Mk9ybnJzam15RzFMamgvbnJOZDFTMUpCQ1lJK0M2?=
 =?utf-8?B?VEZPVXRZUVNOODVacS9JREJpa09OVkFkZWNtWDMvUy9IZUlkWSs5bkVPdG43?=
 =?utf-8?B?K1lVVEF0MlA2M21KRmMyQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVBqY0Ruay85aklFRlpyNkU1cUpmZzExY1JTYnhZYjduZUN3a21oU0NyRTlk?=
 =?utf-8?B?VFdTdDRQWEhXK1pablpreUU0M0M1OEkrUGViN3BkS1RtMUozTFMyN2hLK1hx?=
 =?utf-8?B?bXhiV0tWRktnQXl3UnM0cU0wYjdWOEJ5NnQvZVp6S2NCR1dUSGNvTDFlUUNo?=
 =?utf-8?B?WG9Mcmp5U1UvaDdhL3FwYUVIanRPVEQ5aDlZc0FWVm9IUzExbkxtTXV2Wksr?=
 =?utf-8?B?ZkV3NnZ6aGpvOXFvU1ZmS0VsS25FNjluTk1oUUcvZWp0ckVEb3c0a0pHMHlG?=
 =?utf-8?B?YkdzYXFjRTF0QUE0YXJON1hwRTZXYnV6c0p2c2dqV25jTkhNaEQ2WmV5UXJG?=
 =?utf-8?B?akJZZVdDSmpDM1ZNN25zQmUzNlZhNkpuSHNsMTQ3ODZRbnJ5ZVM4M3QxN29H?=
 =?utf-8?B?NjB4SHZDS1I3d3VlekVvYmkwa0w4THp4U2t5aUx0M2ZLOFlWUjZlYk05cnlk?=
 =?utf-8?B?NWgzYVd4SytWRGF4NUZ1V0tNc0Vlcnh2SDRydC9uQ25nb2tVVi90anJnY1Z4?=
 =?utf-8?B?eWNpd1FuSjZnOTZudTdWOEtTaElubEwwaDZsNkp2RGxHNVpyNWlWOWI1VEw4?=
 =?utf-8?B?ajFWM0JhUWpRcWZlWkJZSWp2TDhwUFgzaGxYMzIxRXhacTNkUXN2TVlrVWRH?=
 =?utf-8?B?eEJ2Um5PZ3M0bjExZ0QyRThRQk5BWTUzbjVUQVRYenl2TjE5ZnkxR3dIVGpv?=
 =?utf-8?B?QVU3VFFjSkNqU09rbGR6dkZvRlNqL3V1dFJ6YVRlYlQ4U1dwRnJ3RDRiajhJ?=
 =?utf-8?B?dGZOaFJVemJwWWl1ZmlTY0RIL3BZNUhmeXh0ajFoZk1nSjEvazhRa3J2dmlX?=
 =?utf-8?B?N0R0YjI0WVREUVI1cHplUjFhMXBXeXUveGJDQTJ1N0VGbzQ0TjgzTXpMc3dh?=
 =?utf-8?B?YTlUM0FGeDNFSExRQWtuVGR4dWJibjZNNjdLWFVDeXpzTXRSRVhoVG5WYmhY?=
 =?utf-8?B?L0FWc2pPZUxNSi9xUEU5OWdvS0luNlpleG56ZUJvaGUwOU1TK2ZEOC9JVDVr?=
 =?utf-8?B?VkxWTkdaWU90NnFCbG9vWU5qSDN1V29UOW0yc05HcTJ1NjdremdIenpCV0tu?=
 =?utf-8?B?RnYwa2NQVWtCaGNKSVJFanVFdldobjlDSGdwdXFENjQ4SXZaQjJaS0xHU3BY?=
 =?utf-8?B?OWo5SXVzSWdFTTJJbFdOdlgwV1NTVDlRdzM2VDlYeHQreG40bGY2MDlORmpO?=
 =?utf-8?B?c3V1bWZPemNRUDlOblExR2tETFBLQkVCRnhZV3o3cGFqKzB3VGFWbnlEK3ly?=
 =?utf-8?B?ZE1YbWdBOUpwUDNkVDN6MnBJR2tsTFZaU2JMUUxNMC8xNGFNdTRhWVlGTGtH?=
 =?utf-8?B?N3BPNEJ1c1A5Z3plZFNWSXBwNjNEYVpIci80MWNqQ2s2K1hxUHZBTitjVWI2?=
 =?utf-8?B?ZWI3MGJnSTUxS056cTNONVkyOXYrM3phd044S3BKUTNYRUVobDVsUnJ5aVB2?=
 =?utf-8?B?eXEyYTgrZXU4U2NiOGp5N25YdGZiV2gxdHF6eDMxa3RhclJ4Rm5VYTFDZkhx?=
 =?utf-8?B?czhHSnkrZks5amphR05kSVNRTnl0aHFxZlRVZUZHNFRBUzhzdExiRk80TnZU?=
 =?utf-8?B?M1o4MWRDak1kZGNlZ3JIMXk5U2NrM3RxdmdiclM5UkcwVlE0M1ZPWDhlU0U3?=
 =?utf-8?B?TkZFYTJ2NUVmdkhCVTNvTGh1TVZRcUNKTG52cDR2Y2JrQnQwdnpRRk41WGdU?=
 =?utf-8?B?NTBJK3kzRW82S0t5U1JLSEtHcFpzNVVzNlZCUG11T3BUS2Roam51eDk4M2pt?=
 =?utf-8?B?cmNSYzE1RmhOTlZYcE9XMHJYa295ZjVxRUxRcmJBbzEyK012ZGlHbGVvKzVo?=
 =?utf-8?B?SVB5K0llSmRiMU1WK2ZjSDZsenVYd0NBRWhIQ2RqUDdXMkJqMUdkdzFXNW4x?=
 =?utf-8?B?NlEyU0FDdnZxUVNQRnExN1hXT3ZRSUhteUQ1NU0rSlNqUmVKdWowZXl2WVd3?=
 =?utf-8?B?OG15UDFMVmZrMXN0WU1OUldPR05vZVI3elFyVTU5RjhrZTNUZ2VPa2MzNjgx?=
 =?utf-8?B?U2RXMmEwSmhiMU5mQ1ovUmVEVWpPRlNMcU5Mc2psQmhqV0VBMzZwczZzUytH?=
 =?utf-8?B?bDhJYnJCUm1taGV0QTBhRURLWnJkcHJoNUovVW1jb2k5cERyd2Rpc21TVlZZ?=
 =?utf-8?Q?bd9Yq+FJkRKqFqHCdCCBLjVzg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee704a8-ec24-46f3-cad2-08dd4625b01f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 20:43:04.0690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Fv9+nivtBg0nXn8aoDZhECyXSpt+vh5d8N4MtFnupSYUSFwTfjl075bXRy8HrKNPE/oVJq9T1xVUpiz8nrfsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8370
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



On 2025-02-05 15:36, Mario Limonciello wrote:
> On 2/5/2025 14:33, Felix Kuehling wrote:
>>
>>
>> On 2025-02-05 14:31, Mario Limonciello wrote:
>>> On 2/4/2025 17:19, Felix Kuehling wrote:
>>>>
>>>> On 2025-02-04 17:21, Mario Limonciello wrote:
>>>>> From: Mario Limonciello <mario.limonciello@amd.com>
>>>>>
>>>>> find_system_memory() pulls out two fields from an SMBIOS type 17
>>>>> device and sets them on KFD devices. This however is pulling from
>>>>> the middle of the field in the SMBIOS device and leads to an unaligned
>>>>> access.
>>>>>
>>>>> Instead use a struct representation to access the members and pull
>>>>> out the two specific fields.
>>>>
>>>> Isn't that still an unaligned access? I don't understand the purpose of this patch.
>>>
>>> Unless I added wrong, it looked to me that the offset it was pulling from previously was incorrect.  So I was expecting it should be aligned (and less error prone) to pull from the correct offset from a struct.
>>
>> The way I see it, the offsets that were used before were correct and match the offsets in the packed structure definition. I'm annotating the offsets from the end of the header in the structure definition below as proof.
>>
> 
> The problem I saw was that the dmi_data field starts a byte late though.  That's why I was thinking this is the source of the unaligned access and the mistake.
> 
> Let me annotate below.
> 
>>>
>>>>
>>>> One more comment inline.
>>>>
>>>>>
>>>>> Link: https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.8.0.pdf p99
>>>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdkfd/kfd_topology.c | 27 +++++++++++------------
>>>>>    drivers/gpu/drm/amd/amdkfd/kfd_topology.h | 17 ++++++++++++++
>>>>>    2 files changed, 30 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>>>>> index ceb9fb475ef13..93d3924dfcba0 100644
>>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.c
>>>>> @@ -968,24 +968,23 @@ static void kfd_update_system_properties(void)
>>>>>        up_read(&topology_lock);
>>>>>    }
>>>>>    -static void find_system_memory(const struct dmi_header *dm,
>>>>> -    void *private)
>>>>> +static void find_system_memory(const struct dmi_header *dm, void *private)
>>>>>    {
>>>>> +    struct dmi_mem_device *memdev = (struct dmi_mem_device *)(dm);
>>>>
>>>> I think it would be cleaner to use container_of to get a pointer to the structure containing the header.
>>>
>>> Ack.
>>>
>>>>
>>>> Regards,
>>>>     Felix
>>>>
>>>>>        struct kfd_mem_properties *mem;
>>>>> -    u16 mem_width, mem_clock;
>>>>>        struct kfd_topology_device *kdev =
>>>>>            (struct kfd_topology_device *)private;
>>>>> -    const u8 *dmi_data = (const u8 *)(dm + 1);
>           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The type of dm is struct dmi_header *. dm + 1 is the first byte after the dmi_header. In other words dmi_data points to the physical_handle field, which is the field with offset 0 as I annotated it below and all the other offsets match my annotations, which match the original code.

Regards,
  Felix

>>>>> -
>>>>> -    if (dm->type == DMI_ENTRY_MEM_DEVICE && dm->length >= 0x15) {
>>>>> -        mem_width = (u16)(*(const u16 *)(dmi_data + 0x6));
>>>>> -        mem_clock = (u16)(*(const u16 *)(dmi_data + 0x11));
>>>>> -        list_for_each_entry(mem, &kdev->mem_props, list) {
>>>>> -            if (mem_width != 0xFFFF && mem_width != 0)
>>>>> -                mem->width = mem_width;
>>>>> -            if (mem_clock != 0)
>>>>> -                mem->mem_clk_max = mem_clock;
>>>>> -        }
>>>>> +
>>>>> +    if (memdev->header.type != DMI_ENTRY_MEM_DEVICE)
>>>>> +        return;
>>>>> +    if (memdev->header.length < sizeof(struct dmi_mem_device))
>>>>> +        return;
>>>>> +
>>>>> +    list_for_each_entry(mem, &kdev->mem_props, list) {
>>>>> +        if (memdev->total_width != 0xFFFF && memdev->total_width != 0)
>>>>> +            mem->width = memdev->total_width;
>>>>> +        if (memdev->speed != 0)
>>>>> +            mem->mem_clk_max = memdev->speed;
>>>>>        }
>>>>>    }
>>>>>    diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
>>>>> index 155b5c410af16..f06c9db7ddde9 100644
>>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
>>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_topology.h
>>>>> @@ -24,6 +24,7 @@
>>>>>    #ifndef __KFD_TOPOLOGY_H__
>>>>>    #define __KFD_TOPOLOGY_H__
>>>>>    +#include <linux/dmi.h>
>>>>>    #include <linux/types.h>
>>>>>    #include <linux/list.h>
>>>>>    #include <linux/kfd_sysfs.h>
>>>>> @@ -179,6 +180,22 @@ struct kfd_system_properties {
>>>>>        struct attribute    attr_props;
>>>>>    };
>>>>>    +struct dmi_mem_device {
>>>>> +    struct dmi_header header;
>>
>> Comments below to annotate the byte offset of each field from the end of the header.
>>
>>>>> +    u16 physical_handle; // 0x0
>>>>> +    u16 error_handle;    // 0x2
>>>>> +    u16 total_width;     // 0x4
>>>>> +    u16 data_width;      // 0x6 (matches the original code)
>>>>> +    u16 size;            // 0x8
>>>>> +    u8 form_factor;      // 0xa
>>>>> +    u8 device_set;       // 0xb
>>>>> +    u8 device_locator;   // 0xc
>>>>> +    u8 bank_locator;     // 0xd
>>>>> +    u8 memory_type;      // 0xe
>>>>> +    u16 type_detail;     // 0xf
>>>>> +    u16 speed;           // 0x11 (matches the original code)
>>>>> +} __packed;
>>
>> The bottom line is, this patch doesn't change anything about which DMI data is accessed. It's still an unaligned access. Now I think your patch is still a decent cleanup. But the justification in the commit description doesn't make sense.
>>
>> Regards,
>>    Felix
>>
>>>>> +
>>>>>    struct kfd_topology_device *kfd_create_topology_device(
>>>>>            struct list_head *device_list);
>>>>>    void kfd_release_topology_device_list(struct list_head *device_list);
>>>>
>>>
>>
> 

