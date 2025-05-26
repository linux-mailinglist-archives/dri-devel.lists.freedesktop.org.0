Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6D5AC3E63
	for <lists+dri-devel@lfdr.de>; Mon, 26 May 2025 13:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6EAC10E333;
	Mon, 26 May 2025 11:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aQ6M06QB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882A410E320;
 Mon, 26 May 2025 11:16:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhDZY9HU8HiE2YkZH51Vhj9xDSagPIK6EkgGjR4drLuLMRv3/CpiS1Cj7byeQEL/IgrIHxM+47RLadP2ziL6MVgPCkZ42XeTY7zGSz0ejWvo1RzelATPMtJ4S+6SBerBKngooEMavEOz1NcQT+uznwKun/W/B7tmNQhPF+bl3jdLDwYZ0ldVWDfyfInAsCVfRySIYD8389fLwL1t9bY97K0geLCMKIcCr/Xrw4dsHxz7RKzpfvXwyhdkE8zB5Bn2ZUoJ9ZjZ5HdYaIHzaJWiI0spJZuXCoe8RaWBI6UupD+5UKlZum5aYjbRwmxEINpslz2Z6YWL+F334w5qM4X4eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqBve8kORN3xDq8By+ORtpgwriKJqwLD4nsFSaTrDQU=;
 b=bqP6pFawhOJld/t1TqHomsO5YR6zPepePOTeZVpZ+WPZfffITlCZOOEiQTHJBhAGPrEnDaJXLw+omeRRGxkzwoNZiNLFlgjVlCCin8+ySuBktrLM1naBY96s9G/t9eKc6Y7LNhznvQ2Hy5wNW8Tc/oRJg+wlKI1+mQp3lBW5TuypPwydk/y24VrcyYWIH447ZjLwnGdAknAikBF5kYn3MqiHwHt4iVZImIX2FuRJuBsmo7gZWZ8V0Yi7QucdEVamBXcg5QocErYPM8GXmkRNmKLNAGJ6PszqhKGhKR0A3enm3MzV26b4SJFAfXJXQ9u544UTq/JRfb0MkUxZedVSCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqBve8kORN3xDq8By+ORtpgwriKJqwLD4nsFSaTrDQU=;
 b=aQ6M06QBLYW1oW2eZQSoQeJU8RL5RBFIOxViHKg2Hh+iYSLxDa1/+hj3dePGtwQHvbg5L0f0ktSu/KKboPheLF25HrL/QxdRq6MMTiMaO+zmGmiNdZR3xbBSDuIr4Zz3QB14LFgCDvcgQXSYs6Iq7NTUmr1cxj0576xaKTCVJLc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5861.namprd12.prod.outlook.com (2603:10b6:8:78::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 26 May
 2025 11:16:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 26 May 2025
 11:16:39 +0000
Message-ID: <74c4b9d8-5e25-438e-97c5-5aa2035fb9bd@amd.com>
Date: Mon, 26 May 2025 13:16:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/sched: optimize drm_sched_job_add_dependency
To: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>
Cc: tursulin@ursulin.net, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250523125643.7540-1-christian.koenig@amd.com>
 <20250523125643.7540-2-christian.koenig@amd.com>
 <aDCCF0JFhO7lR2VJ@cassiopeiae> <aDCDJ-sK9rRI6wse@cassiopeiae>
 <cd64af4d-f5b3-4f18-9be6-636624833075@amd.com>
 <08bb986281fefb5cbdb35c63a56e1bbd923d9297.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <08bb986281fefb5cbdb35c63a56e1bbd923d9297.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:208:160::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5861:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b977ed-7411-44fd-9dd3-08dd9c46c941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzJFdndabjhOQ2ZEVTZRUVFXWUtycktSUEtSaVZrYVdsR3lmdnFnSjF5c0sw?=
 =?utf-8?B?U0hwdVkxa1pEZVFXdkNoRWk1TEsxVXNpOVlYVHYvWmpXTEZmK1VvZGZoYzZH?=
 =?utf-8?B?cTlPSWhzMzI4TjMySS9jSEdtWGVZeGpBUWE0cFNSY053aWVSbm5pdXZ2aTNC?=
 =?utf-8?B?RzZ3UTZXWDMzSktTK0Uwb3RTejlqdEw4aTlLSEp3aURPcStjajQ4dndEWnhk?=
 =?utf-8?B?UnRZeGRabDg2Q0x1SkJPeTh4aFQ3SVNoYkw2QktRditzUjF6R1hHNmN5Nmxo?=
 =?utf-8?B?QUhQbEk1eTlXSWVxaG96TG14S25nckFSTHg5Um5DR0l5WmJ5T09ydlBUYkxW?=
 =?utf-8?B?ZGUwNXI0YStsZS9md3BodGZQMXRPTEhhSlZpN0hOejVBeS9LL093eExsNlJK?=
 =?utf-8?B?Z0lUNDdjNXM0QWV5V2MxT095YXhLR1hiWit5bk02emx0a2pLNmhyelBaS1dr?=
 =?utf-8?B?TzhVTmpLcTlmSlNXNmFhT2gxa1pTVW9Rdy9majRTc0QxZHlhVWE3bTRIaGdV?=
 =?utf-8?B?OUlQVG0wSnRadjBwb2hiakREdTNVeW1vOXZNaXEwU1VnZndrY0pUNTRJaEtU?=
 =?utf-8?B?UkhIYWJEaVgrbEJLOTIrMGx2eDhaeTBkNS96VjkrL1o5RThlb2xLV0tPbkxj?=
 =?utf-8?B?ZXpMcmNaQWFRdVJmejd1dHdYbGRXalMwaWpkWlFkNkV2WUpaQWpkQVNMZ3A4?=
 =?utf-8?B?Z1FoVVlhcnYzbllVMFcvTGQwaHQ1aXRYZHJtOUhVdE9oWkl5empudEdXYnNn?=
 =?utf-8?B?ZEQ2cFE2N2s0S0k0K3B6QWVsNTVSOTZHekdIMmZZcWdqWjZ5YjdtdXhzMStn?=
 =?utf-8?B?N2YxUmRRR1ducHNrTFB2aHhrNFFkMGhYSlo1cnJRMlM4ZnE4SjIzUHo1aVd4?=
 =?utf-8?B?amkvU09vaVRZT20vU09ZWS91d2EyWEpRTlNELyswbE1HQlF4d1lOUU1sRzNJ?=
 =?utf-8?B?UExsMGhCbU13TmdXK21mRngxdDcrcU5GcWc1T1ROdy8rOWMyMGlLLzRtV2ti?=
 =?utf-8?B?d1hRRXR6MUVkQnJBa3BrYWc5aE1VTmNCL2U0TEZVU2NkV29BNW9nYmV6ZUYw?=
 =?utf-8?B?TTVQYW1QRktkNzRScThaRVozS1BHMTNQQ1BzL0tzd0Z0ZXVOeXhPeUt3RUVa?=
 =?utf-8?B?TUMvUXB4LzJidzU4NjlXOW84cXo2Y0hKVE9kYzFnbzVEbnZzWHcrUFhXajRz?=
 =?utf-8?B?Q0xBd2hMUDFGcnJrWUdxWVJnYXRQRElDWm5kU2FKWE9ySDlTMUc1cXVjSmJk?=
 =?utf-8?B?VUFtVVlFdXV1S3FzRzQ4c0R2ZFhhTnVFNm40UGNqMS9GRnhFMGgxQkViNlc5?=
 =?utf-8?B?cUhVc1BZY3lmNEkyaXl3R1NQYmNxaERvNCtBdVgvcklsbkxhQVN0UmlBcDV3?=
 =?utf-8?B?WnRIeUt0WHZqN3VBNWxPY09ZWnZRTlNyTHl1TlhGN2pycC92eU9vVEZLd2lj?=
 =?utf-8?B?N1AwOVZuNTJwaXA1RjAwZWNSQU1pc0dmV2NnQUZIakV2KzZnRGhVNi9EcTI2?=
 =?utf-8?B?TWg4cmswVFZwaFkyZlo5ZmZmc1hyc25BL3NnYlRCYVVjSTNCRnZzbzhKcnNT?=
 =?utf-8?B?Y3JlaDVZR0U2blB3UUFKU1lhOXZodXZ5NVBLREh2a3ZCRnBHYWRhTmtoWThV?=
 =?utf-8?B?YkVlOWZZMGVsVVNRZ1o1MS8zd2lEU2xvcFYxbW5TZnMxSkYyeU1uWHY1MHFo?=
 =?utf-8?B?ZXBhbnF0ekI0NDRiYm5VS0VBMGJrZjZETHVMakt4WnVmaDk3N3NsR3NGZys4?=
 =?utf-8?B?RjB6MzFnL1hadUFuOVhMbXFUOUMzOGp5RU80L2h5Nk9Xc0dUbnNBZGppTVZr?=
 =?utf-8?B?ZU11UnZNNWRDMW5oa1ErWUprTjZEdDNwVHdEMG01UU4rVlcvdXYvNnowaDRY?=
 =?utf-8?B?bXhvTTY5bHdJWHl1OEpPVHZIWVoxTFJtRXdJbEdMVm1pakdWb3NJVlFlQ1Yz?=
 =?utf-8?Q?q+JqCli3KhQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3NQOHZNTkRjcUdIV1dlVk5QcnFOanVFSmgxSzBUQTJJbzloUEtGNFczZWMr?=
 =?utf-8?B?TTNMWEFPREdYTXVwQmRleUwwb3RGZTdWYjlpdVpKL0lWNFNJTUljL1V1QXFJ?=
 =?utf-8?B?NFFmWVhrYmtGaHp6cDRHZFNQc1lGalFTZ0xSdzRtQzFucDhlMHJkdnJsK2k3?=
 =?utf-8?B?YWM5TGJZYWplZTRJZHU4by8ydVBkTmQ3V25YS0VCQVRwVUFhbitOZVh4V3JU?=
 =?utf-8?B?aEJNSWNvemlTd09nZ3dhUDRxcUY4V1l0WTFsSDdJU2UvbEVYZGJ4bHdJcGkx?=
 =?utf-8?B?cUY0NUVqdGJMUG9ENmZBQnp2SGs4TjlGc1BlZDFSVmVMc1l0cDdhMTN3cUha?=
 =?utf-8?B?Wjg2Rk16cVhCNHIzWkpjNVFNVXFLOE5QU0xHN3NTUHA5L0dvZ2RJb1VmNktx?=
 =?utf-8?B?VDNIWWtxTHJpcjBSL21tNDhNcEkyM2ltT1FtaTcyMkZDdTFmVTlsOWs4cGpx?=
 =?utf-8?B?Y3A3Z2tSeEVqOFdXcEZVV1Z0ZWxFRkVVanBZa3R0Y0lWTXhmRkRsN3pkdFli?=
 =?utf-8?B?ejArT3dlNHNjVC9MZXUySUZtT1VFWEhMb2VRei9tUy9qdDczYXIzdndnSVVJ?=
 =?utf-8?B?M0pyeFZNOVY1MnRyUzU5aGdxd2FtVmp0MzdldWtVVkRsQmwveFRSRERiMmhn?=
 =?utf-8?B?d21ZVmNCZVhBUEFwRjRPVHMwdjV4WGFJYzhjY0VQeC9qc3BqbDFjWS82aVFN?=
 =?utf-8?B?UlV1bVNsSWJpSC9KblE4Q2RkUDVhZDdEb0JtK2J2b2V4RkFwSmRoaFliTk1m?=
 =?utf-8?B?M2hCcnBPakNKeGJKNXhGRFN2VkZZU3N0VzZIZW8wR2FUeGVzcVFNOENIL2No?=
 =?utf-8?B?Z0FudnFOQ1JMV3VrOE1DNnRMT2U0TG85cy9KK0JQazBWSHdCTjhmQkg3Nml2?=
 =?utf-8?B?UlhLWlEwZHZSaU5NOW5RNWh5emtnVnhVYlh0S3c0a1ZBb1p2WEpMQTRzSW02?=
 =?utf-8?B?QnBpblV2SUJXeVJqaWk0Ulp4SlpOQkdUL0VlYXRrRzRQbzNKNXdyaGVNVkJR?=
 =?utf-8?B?NXRlK2grYStseTFvZnVicGdFSkxPaEJYMXhTRy9zRUhpQ2pvV0JpYlo1VWk1?=
 =?utf-8?B?bStMTmtxSFhkdDFGY2UxcHk5M1Q2ZGdYVERPVE14VW1hcjd3SHBvQlJmd1RJ?=
 =?utf-8?B?ZGtMYUtNenBpbFlmeExtaU8zZWUxanJBaUdyaW16TW5hVi9kQm13Qm5kS0RC?=
 =?utf-8?B?SDN4LzEyK0tXQUEvVGYzOEt4bWt0RGJGSXVlT0h5Q2lRYVRaTU1HYU5Dcy9F?=
 =?utf-8?B?dXh6K1F5b0VRNFhrQnozK0JhdkpHaDFRK1JOb2V6OGZNVDR2Z09tMCtva0VD?=
 =?utf-8?B?bklZamJYZHdOUkR2NzFtSWpySXprM2l2N0FYaS9iT2pXNno2WTUreDliM0F2?=
 =?utf-8?B?Rm5QbjF5dmdvUXJlWFNibjlnNTA3T29Ray9FaXg0OVhPeEgzajdRU3VWMnN1?=
 =?utf-8?B?RVJUNnV4aUxxVXRoUDhoaERnZkV4dCtMRlFxSE0xNkJUTkp6SjduSmVndzZW?=
 =?utf-8?B?KzhZd2lwR0laVWFneSt3d0l4TkhaNU1oZVJwVkxEUWpncnlvdVdnN0xCM2tH?=
 =?utf-8?B?R3NzMzdvU09qWGdwUFBQKzNiSVNJaXRUZy90dGZZcUxxWHZZOEdzTFpyNGdh?=
 =?utf-8?B?b0NrZm5KMmNhSW1QejBoMWloL2RucXNHK3ZyV0x1VnUzejFxRDRUVmZLVXJa?=
 =?utf-8?B?SVVKZWRaQVozSk1kREZMLzFqbCs5eVJEOU5rYmQwWndsUE1uL0RQdTYwQVZq?=
 =?utf-8?B?b1YzV1pzM2dLRkJmV3Vod3ZLY05jKzZZZ2krUTRFR1NEWGYrb1JxcktjYWUz?=
 =?utf-8?B?d0hGRjBxc0pLaC9uSmZHUGRGa0pRdUZ2U0FjRThUWFJLVVg2RUtvSnZZc3dH?=
 =?utf-8?B?aks1UjdDd2FoMmRHa0dqUFE3L3NPWGxUcFI3TUJHYWpiT2FLcjlzZWdKQ0J1?=
 =?utf-8?B?alZ5cHdsNWQvdXl0TGpRSW1BNFpsQ3FGOE9SNmhNTkxERlhyTVZtUlk3Vi9v?=
 =?utf-8?B?cUVzNGVJNTlnK0xrTHV6Y3BadXFZZVlNb05meTc2M3kwaE5Fa1BnL29zYWJL?=
 =?utf-8?B?SkNtZTg3aUhDZWhteWI3MzFDaXMzNnlpbHFzM0Znc0dKbk80SkxDQWt0b295?=
 =?utf-8?Q?VvAE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b977ed-7411-44fd-9dd3-08dd9c46c941
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 11:16:39.5795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ir/6/EpbNsKGfN/EZvPZcgzo70O6Fpk5WgbpCCvdKmKiDmbbn0YYEygZ8dlcCRnu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5861
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

On 5/26/25 11:34, Philipp Stanner wrote:
> On Mon, 2025-05-26 at 11:25 +0200, Christian König wrote:
>> On 5/23/25 16:16, Danilo Krummrich wrote:
>>> On Fri, May 23, 2025 at 04:11:39PM +0200, Danilo Krummrich wrote:
>>>> On Fri, May 23, 2025 at 02:56:40PM +0200, Christian König wrote:
>>>>> It turned out that we can actually massively optimize here.
>>>>>
>>>>> The previous code was horrible inefficient since it constantly
>>>>> released
>>>>> and re-acquired the lock of the xarray and started each
>>>>> iteration from the
>>>>> base of the array to avoid concurrent modification which in our
>>>>> case
>>>>> doesn't exist.
>>>>>
>>>>> Additional to that the xas_find() and xas_store() functions are
>>>>> explicitly
>>>>> made in a way so that you can efficiently check entries and if
>>>>> you don't
>>>>> find a match store a new one at the end or replace existing
>>>>> ones.
>>>>>
>>>>> So use xas_for_each()/xa_store() instead of
>>>>> xa_for_each()/xa_alloc().
>>>>> It's a bit more code, but should be much faster in the end.
>>>>
>>>> This commit message does neither explain the motivation of the
>>>> commit nor what it
>>>> does. It describes what instead belongs into the changelog
>>>> between versions.
>>>
>>> Sorry, this is wrong. I got confused, the commit message is
>>> perfectly fine. :)
>>>
>>> The rest still applies though.
>>>
>>>> Speaking of versioning of the patch series, AFAIK there were
>>>> previous versions,
>>>> but this series was sent as a whole new series -- why?
>>>>
>>>> Please resend with a proper commit message, version and
>>>> changelog. Thanks!
>>
>>
>> Well Philip asked to remove the changelog. I'm happy to bring it
>> back, but yeah...
> 
> No no no no :D
> 
> Philipp asked for the changelog to be removed *from the git commit
> message*; because it doesn't belong / isn't useful there.
> 
> If there's a cover letter, the changelog should be in the cover letter.
> If there's no cover letter, it should be between the --- separators:

I can live with that, just clearly state what you want.

For DRM the ask is often to keep the changelog in the commit message or remove it entirely.

Regards,
Christian.

> 
> 
> Signed-off-by: Gordon Freeman <freeman@blackmesa.org>
> Reviewed-by: Alyx Vance <alyx@vance.edu>
> ---
> Changes in v2:
>   - Provide more docu for crowbar-alloc-function.
>   - Use NULL pointers for reserved xarray entries
> ---
> <DIFF>
> 
> 
> P.
> 
> 
>>
>> Regards,
>> Christian.
>>
>>>>
>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>  drivers/gpu/drm/scheduler/sched_main.c | 29
>>>>> ++++++++++++++++++--------
>>>>>  1 file changed, 20 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> index f7118497e47a..cf200b1b643e 100644
>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>> @@ -871,10 +871,8 @@ EXPORT_SYMBOL(drm_sched_job_arm);
>>>>>  int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>>>>  				 struct dma_fence *fence)
>>>>>  {
>>>>> +	XA_STATE(xas, &job->dependencies, 0);
>>>>>  	struct dma_fence *entry;
>>>>> -	unsigned long index;
>>>>> -	u32 id = 0;
>>>>> -	int ret;
>>>>>  
>>>>>  	if (!fence)
>>>>>  		return 0;
>>>>> @@ -883,24 +881,37 @@ int drm_sched_job_add_dependency(struct
>>>>> drm_sched_job *job,
>>>>>  	 * This lets the size of the array of deps scale with
>>>>> the number of
>>>>>  	 * engines involved, rather than the number of BOs.
>>>>>  	 */
>>>>> -	xa_for_each(&job->dependencies, index, entry) {
>>>>> +	xa_lock(&job->dependencies);
>>>>> +	xas_for_each(&xas, entry, ULONG_MAX) {
>>>>>  		if (entry->context != fence->context)
>>>>>  			continue;
>>>>>  
>>>>>  		if (dma_fence_is_later(fence, entry)) {
>>>>>  			dma_fence_put(entry);
>>>>> -			xa_store(&job->dependencies, index,
>>>>> fence, GFP_KERNEL);
>>>>> +			xas_store(&xas, fence);
>>>>>  		} else {
>>>>>  			dma_fence_put(fence);
>>>>>  		}
>>>>> -		return 0;
>>>>> +		xa_unlock(&job->dependencies);
>>>>> +		return xas_error(&xas);
>>>>>  	}
>>>>>  
>>>>> -	ret = xa_alloc(&job->dependencies, &id, fence,
>>>>> xa_limit_32b, GFP_KERNEL);
>>>>> -	if (ret != 0)
>>>>> +retry:
>>>>> +	entry = xas_store(&xas, fence);
>>>>> +	xa_unlock(&job->dependencies);
>>>>> +
>>>>> +	/* There shouldn't be any concurrent add, so no need
>>>>> to loop again */
>>>>
>>>> Concurrency shouldn't matter, xas_nomem() stores the pre-
>>>> allocated memory in the
>>>> XA_STATE not the xarray. Hence, I think we should remove the
>>>> comment.
>>>>
>>>>> +	if (xas_nomem(&xas, GFP_KERNEL)) {
>>>>> +		xa_lock(&job->dependencies);
>>>>> +		goto retry;
>>>>
>>>> Please don't use a goto here, if we would have failed to allocate
>>>> memory here,
>>>> this would be an endless loop until we succeed eventually. It
>>>> would be equal to:
>>>>
>>>> 	while (!ptr) {
>>>> 		ptr = kmalloc();
>>>> 	}
>>>>
>>>> Instead just take the lock and call xas_store() again.
>>>>
>>>>> +	}
>>>>> +
>>>>> +	if (xas_error(&xas))
>>>>>  		dma_fence_put(fence);
>>>>> +	else
>>>>> +		WARN_ON(entry);
>>>>
>>>> Please don't call WARN_ON() here, this isn't fatal, we only need
>>>> to return the
>>>> error code.
>>
> 

