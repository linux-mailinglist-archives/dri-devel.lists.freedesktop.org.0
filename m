Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5C4CFCEA6
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 10:41:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 045BB10E57D;
	Wed,  7 Jan 2026 09:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v9LJOGU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012003.outbound.protection.outlook.com [52.101.53.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A658C10E57D;
 Wed,  7 Jan 2026 09:41:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wF6JuxST+LWp5OIlyfEgmLLrUSAIvAoFPTRaXGxNeAo/bXv3AySa6taV6mo71/C0+g+XTYAQhkLphjj+4lst3fo0AiW2CPPvqegkhe1ATCCKxilEzF2Boq1JYz86Dsv2qGGkl3jU8dQUL46d8Mb3D9TmBCewIZi1ZJD0RNMeUkmVgPBxt1w+BM0rEg6yyQ8MoZkovDd77znaOAIL0pLtU9tzkOOw+6hXq+XPeCe7iuzxIOdsNyEAJdKXsUPf/e/rceXwQFQ8p+ktrg3STU67uP16ZbhZRst7WOFFku/X+UTClbB1g/BxslqQ8Li/s91+EtYVvh3vK/fEo2k5203Qrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwyzmupSCvXoiCvHeRH94laqE/VqOLZn+8QGJjs2ciM=;
 b=Be/N4v0bfCvIemmJXZCRMpJw/mf79EjLIYsQKBr5g6X2zD0Bdu0OD7qXf6lE8T/vInKq85u9TxREILRgG5+GGcTvieX5L3/5t7gYN2l3yWvZuzCXmXX6/XoFK5nS2VQ9H62zrjtdDehHTKSWMbjav/WYUjXXIppCmwGZWw26yZ0a6Oek734hxPkbh7014SZdVJt8HYLuyQBT1vlzER5wfbmbs4YJ2NVOrTf4j0Sk+g7nCWT6IfcaVR9AMrkfPjlZAnn63Yim5ZT88bMQq2uapD33G0Ti5lcrAEvUDshnGgU65m+b4VN31fPbWZ+/ri0n4W4/DsIGjrXmXjOeivuong==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwyzmupSCvXoiCvHeRH94laqE/VqOLZn+8QGJjs2ciM=;
 b=v9LJOGU/iDGfJDdwOsHZL+hInoYcdNA9b2ALGFo4Z7El7EzJDe8uXFgZD89REshuVTBR7BzM1OSarR9pGJk43YSAeK7ZkqTNtneb9FlYA+3O6cL/jDNR0OjFy79am3NkuJgKudGm5e6BRQo3DPotyRvtHvBpNGtZwspHSvHNafg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by SA1PR12MB9548.namprd12.prod.outlook.com (2603:10b6:806:458::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 09:41:03 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%5]) with mapi id 15.20.9478.005; Wed, 7 Jan 2026
 09:41:03 +0000
Message-ID: <a6d5c716-9f09-412a-9613-ba3213d20b4c@amd.com>
Date: Wed, 7 Jan 2026 15:10:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/buddy: Prevent BUG_ON by validating rounded
 allocation
To: Matthew Auld <matthew.auld@intel.com>,
 Sanjay Yadav <sanjay.kumar.yadav@intel.com>, dri-devel@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
References: <20251222065238.1661415-4-sanjay.kumar.yadav@intel.com>
 <20251222065238.1661415-5-sanjay.kumar.yadav@intel.com>
 <60ab8e82-a079-4ca1-adcc-ee50cfc5641d@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <60ab8e82-a079-4ca1-adcc-ee50cfc5641d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2ac::7) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|SA1PR12MB9548:EE_
X-MS-Office365-Filtering-Correlation-Id: 39a3062a-f235-4a00-3eec-08de4dd0df32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFVhYmtRQkZFS0RVKzdtK3duRWVqb05pYWNxR3M1Q2JOajd5UXpEY0ZtSFl5?=
 =?utf-8?B?dkV2OU5KcVJnR1JjQkRyaUMvMm1MWEpqNE9GQ25KRGhKV1ZsQU1RYWNFU3FP?=
 =?utf-8?B?Q09sS1dwY2hxSld5Tm1NRDhqZDk3bUMvRzkzUmZQL3k3RkxZK2RsTVYxVXhU?=
 =?utf-8?B?QzlNdnBIdzBwYTVnMUovU2w5T1Q3QnB3ZmtMbkxiZ3pzZkZobWRoMzR2SDY0?=
 =?utf-8?B?YUdhYmgvUG1JYmxHV281NVVRQmxBM2xEc01MRm94Z0tzOHQ0TGFWMlM2UTVq?=
 =?utf-8?B?V29Rb2tOclg3VUlBcXZjU1haMkJRalA4RFJYdzZvemlPWk5PZmhzc0ZZTlE1?=
 =?utf-8?B?dUtYZFhGcW0rVTNIRndFZ2Z2Y3B4NSt2ekdYTzdmbkhBM1Y1S1ZHY3EwaDVw?=
 =?utf-8?B?SzVsbmk4KzdNeGJaclQ4SWtPUUZNZG9XUnI5L25wd0dscjNsVFF6QkRmV1or?=
 =?utf-8?B?RkFwQzd3cFlONW1jNStFOVJ4YXo5b1dKNVptdUJBQkhPKzFMWXFuZWRjbFYy?=
 =?utf-8?B?UzUwTCtzeGV3SGZ2eFUwK0pKUVFWSXVyRjBmWHYwbDVBUjJZR0NNS20yNnNM?=
 =?utf-8?B?dnJrK0xVOGVFdVl5K1NXZ2hzcjNpaU5PenFpak5DaW9iVUM1SjlBYXJ1NjhR?=
 =?utf-8?B?bFRMSGZneHhIVW1GRnN6a242RlpKL21tdW1HbHg4RWRXQXJTR3BrcUoyZVhQ?=
 =?utf-8?B?czFPUXNuVE1FWWVlcG4yS0krdHE5V3ZPbzJFMmtld3pWWnQwMlV6OXFzam9K?=
 =?utf-8?B?NDF5Uml1Y1FIczVuTmxVRjBPRlMwdVZtVWFTQ2twZjR3ZnI1Qys5bzFTdmVa?=
 =?utf-8?B?TTNBODBCNXQ2bGVxOFNSMnVDWTcrU09mQkxaRE5aMDREdXNramZSVHptNWRQ?=
 =?utf-8?B?NDhuaFIxcWtzZ1d6a2lFNEN3Q2NuNTZLSDVmQlkrTHcyUWhFWk5MTVk4eGJN?=
 =?utf-8?B?SUgzdmhpSmhTSUJpV2VSTHduZzd5WDRsa0czTk1YOS85SXhCWURvQ1NlWVVr?=
 =?utf-8?B?a1BCb21Xd0puTDgwU2pHekRxVHZiTVROc1NiSk1aQ0lyOHJwdDRXNVd6VEpK?=
 =?utf-8?B?bktHSFh1djBTN0c2MEJ0bGF3UGd2d2gzYmp4eE5nRzc1WjJGQ21DNEJqdTl5?=
 =?utf-8?B?c2xRNExVWDdqc2VvbFFEQnBEbnBhc2NKME9OUW9zS0c1d2xPamJiVlBRTmtK?=
 =?utf-8?B?Q0w3U2V3TmE5VFlFckZxd3lpdEplTkZOeURvVmIyVjFINy9hK3lxdUdUMjdh?=
 =?utf-8?B?cUhjbU1nZ3hDanpodDVjem1hK3paNEdhRzc1MGROQ3JKQWNVaCsvdC80WUZU?=
 =?utf-8?B?aXZ1TVhPRVU3VXRDYnVKcWtGYk5BKzVDdzJVODVIN0FXYndTQ1ZQc2hGWU84?=
 =?utf-8?B?OHdyZEk3STNJME9OYU1FZkYzYktoRi9KVEhOZk5mQlV6a1hNRGt0ZmVDU2NX?=
 =?utf-8?B?YUttZXcySHFoelJ3WTM0OThNL0Zaa2tzcFFObXVPejd6dmd4N016eU1ya1Jv?=
 =?utf-8?B?OHp0ajdsdSt2U3J6Q0owbUZWSE1NS2hwSVQzRDgyVHRDamdEc1BDdG9EWFJO?=
 =?utf-8?B?c2VHNVVzaDYzdlErckk5VXB6My9CR2Q5MDJ2RTc2UDM4ODNuSXZxakZzYUFa?=
 =?utf-8?B?SGkzOEZNcUIzRTFpa3pxTE5VVXB0bm8weW9mK1ZzR2grcmN2OEJ5WVU5RTYy?=
 =?utf-8?B?SXZnTnlWaWpkNUJxeTN1d3lOWStPczV4RW45d0I0eWFzZ3dZYisva2c2SjNK?=
 =?utf-8?B?K0NmdGJUUERuUmEzRGxJbG1Xb0JNVm1YemFYYWNIOTQ0dzU5bFRiNkdjb252?=
 =?utf-8?B?bis3bW83cmlrWHVsVXEycXN4UTE0ZHZpbVRKTUlYVytOcnI3UHR0T2Q3TUJO?=
 =?utf-8?B?eXRtVHB5SFZlSmNyUFdtTk1ZNUhEcUJxcGh5T1B6WDVRcFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2VrckhYNlowQzN2MXV0U1dCT2NsN1Avb3FzUHY3UVNDblFWQll5QzNxVnpM?=
 =?utf-8?B?bW1NcFFNZlJsclpKbm5CYlgzUWNOaytCeFRoN3NMelJSbWQ5cmJobUF3a0RR?=
 =?utf-8?B?ekZCVEEvcnZWTFl3SFN0Y1E4K2NuOFZlbk9ZdGNPdWRMNWFVQWJ2dGM1YzFl?=
 =?utf-8?B?TkJRR1MwZjJGYStiVnZnaXc5WldMYUFwRlA5ZmcvZ09BeEtMazVTY1FtMkdk?=
 =?utf-8?B?eUJFZlRoSDVUNjlVUWJ2QXpGcGNxSEIzQTZsUmgybnE3V05Mc1BVaTRSempv?=
 =?utf-8?B?SVZMOHFqMHhCbG9SRnRJZjg2aHg5ZE1pbzgxU2lTdUZ0c0g4QVlqWmZnNko3?=
 =?utf-8?B?K0VjMUpvbWFRa3QwdmNLbTJRTlFRK1VHY1lRTmJteVJjOGlwVk9oQTV0d0VZ?=
 =?utf-8?B?dGpNdnM4RE1OQ1lWMmR0bHpBc25kcDE0TUlwL2hiMEZ2d2VqSGVjRUhqbDc2?=
 =?utf-8?B?alA4RlhmYlJ4V2wrRzNqSm93K1ZlVzhhZEp6d2N2OGtiM3VIQXN6WWRJcDZS?=
 =?utf-8?B?aExXeGxLclNmMDlwa2EvTDh6ZklmZXZxKzFHZ1dHSFcvbFJ5V1FyNCthbWts?=
 =?utf-8?B?Y3JmTGdoRCtPZTJ2NDk2TjVXc2UrQmZCQmN2Z1IyQVhaTWtUR3dHckw0aE9U?=
 =?utf-8?B?M08zVitCbVBGbTdzR2paL0o1ODNhTmRUM0NrSEdNMUJvUGU4NmJTWjJmbjNF?=
 =?utf-8?B?TTk5MktvWUJYUEkxbmV2enB1bzJpY2RhOHd1Q2VGRW1ETjZ1SVN2UFB6Ylh5?=
 =?utf-8?B?WkVOblYwc1ZoS0duOEhWR290cEJIa2JxSzZHdmt6K3RkeWVwdDVaOEl1b3dt?=
 =?utf-8?B?WkFPcWVNUXBhRW5ESXpzY0tYNHlva3BySUROTVV3eWZQZkNLLy9QN2pQRzNu?=
 =?utf-8?B?cG1VZDZPQys5bDVEWXpWSVFiWk8wT3c0a2ZvUnVRbnFRVnNOWm5QaUF2OUVU?=
 =?utf-8?B?eEN6cmZOVUpINlF5QUdHQmFtK1BmaG5UL2ZIVzhBZXdvTGZXNlNTYTVJMElR?=
 =?utf-8?B?NDZuakIzV09JUk04cUZmS2RSbnB0UjJBSTh0RGJjblpMN1VORkh3aFMyb1dP?=
 =?utf-8?B?WVM3cDcrRVpIZFVQYWVuTTNMM1Jmd2RsYjJjbVlsQ3h3cjloOGVDdWNycDFV?=
 =?utf-8?B?N0ZQbDBZRVRZOFhlTjlKaFpBYnNtTGNYNXJmRTNiRTRrTmFBa0dHR1p6RmZl?=
 =?utf-8?B?elJteGNnTVVDRElGRXZVODF4RlA0Z2d3UjM0ZlMzaUsxa1BSRnU4andKdFRa?=
 =?utf-8?B?TGt4ejFvVDhibnc5aGdyTnVKR0FSbGF3OVpjNVV3SHFVT2ZZSmJDZng5WUlz?=
 =?utf-8?B?VU9tVVlSTHlRRUIrT0pGVTh1MGdYTVRpaTc2bWdoREJVNGlVV1l4L2Q2Tnpz?=
 =?utf-8?B?TTNKU2xaMHJ5VlBENHpBdWU2NWRKcmdxekFBd2c3aE1md0Fxc3RpWFBzaU1a?=
 =?utf-8?B?OHlvaWsvdWNCeVcxMGJFZlR0UUtSYmp5N0NON1VqcE81TE5IanlFd09rc2dZ?=
 =?utf-8?B?NDA4Ri8zbitkR3R4UU5yVXljNW9IS1M4OXZ6M053K0FvN2gzUnQrQjBPdnE4?=
 =?utf-8?B?VFVLbkdEL1dSdWxOYitKWlJOdTZYcFVycDlUeW9sY3RpVzdQNEJUYnEyVmNF?=
 =?utf-8?B?K2ZnZ0ZwbU1WY0NteGVUeThhbTdpUVBxa2l1TEJCczhwdHdlWXNqWjBDSnFa?=
 =?utf-8?B?SnpzdUt5dGRiMUNCblRlMTVRVWJRS1hlSUFvcFY2cEF5VXZVQTh3YXMvNzdv?=
 =?utf-8?B?WGNiRDVCQ01OY3hTRHhnRlBseEFGR1VYd2ZFUVZjYkNpL1hjRTYrSVVhYVNB?=
 =?utf-8?B?eERZUlFDU241ME1mdnlNM0xBMENHZ2tncFZiOGtBV2wvVWhQTkJxUnlnV2pl?=
 =?utf-8?B?T3NLT0FUcGJJR1lqN0lXdEgxaHZDYVNDWWx1a040ZFZlZWVBbExCMEJ0Q25L?=
 =?utf-8?B?RW1hYllLNFg1OTU0QkowenM0WWtYUFlOMEdKLzMxOFZjMVc0NDZ1R3A3ZXpG?=
 =?utf-8?B?TFAwdzYrcW54Z2JUNjFJV2hxNFVWQkZWNkdOUVVmRk5FQUlHSVlVQzhEc1BY?=
 =?utf-8?B?d2JTaXpyekRZWnUwZ1JuQW1xOGNHRithQ0ZWOWhyeCtxT1l3Mm9OK3VCb1ZU?=
 =?utf-8?B?WXAyT2I3RHl1TTdFdmRxT0pQVExqUWRoeTkzOFJGN2szUnpQbTQ5b2JOK2F5?=
 =?utf-8?B?MkplMWtPemVVbnRPdUtNS0kwK3creHpHTzJsUFJmNGt4eUZpWXJNTWNseUkv?=
 =?utf-8?B?MDY0R1gvUFRnczlKbXF5NTF6djU4Yjg0V216WTdCbVVCV1JLc2tBSzh1RjdV?=
 =?utf-8?B?anNScU10RksyTXdGUW9wQjVoWElKZHBXdUpSOEtEd1U2Wk1hRGswdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39a3062a-f235-4a00-3eec-08de4dd0df32
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 09:41:03.3005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5H0vqnb7nOqAUD0tRuKTXYOSxprcXSTVXElocvKXRm0+fhqLnhs8elWGneSwvIoYaJa9OfJSdWQyAc0C1XDSZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9548
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


On 06/01/26 21:34, Matthew Auld wrote:
> On 22/12/2025 06:52, Sanjay Yadav wrote:
>> When DRM_BUDDY_CONTIGUOUS_ALLOCATION is set, the requested size is
>> rounded up to the next power-of-two via roundup_pow_of_two().
>> Similarly, for non-contiguous allocations with large min_block_size,
>> the size is aligned up via round_up(). Both operations can produce a
>> rounded size that exceeds mm->size, which later triggers
>> BUG_ON(order > mm->max_order).
>>
>> Example scenarios:
>> - 9G CONTIGUOUS allocation on 10G VRAM memory:
>>    roundup_pow_of_two(9G) = 16G > 10G
>> - 9G allocation with 8G min_block_size on 10G VRAM memory:
>>    round_up(9G, 8G) = 16G > 10G
>>
>> Fix this by checking the rounded size against mm->size. For
>> non-contiguous or range allocations where size > mm->size is invalid,
>> return -EINVAL immediately. For contiguous allocations without range
>> restrictions, allow the request to fall through to the existing
>> __alloc_contig_try_harder() fallback.
>>
>> This ensures invalid user input returns an error or uses the fallback
>> path instead of hitting BUG_ON.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>
> I think we should maybe add a fixes tag:
>
> Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
> Cc: <stable@vger.kernel.org> # v6.7+
>
> ?
>
> I don't think current xe can actually trigger this yet, but not sure 
> if amdgpu or something can somehow trigger this in some obscure case.
>
> We could maybe also add:
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6712
>
> So it auto-closes plus gives some more context that this fix was 
> motivated from code inspection and not some user report. Otherwise I 
> think the change looks reasonable,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 2f279b46bd2c..5141348fc6c9 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -1155,6 +1155,15 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>       order = fls(pages) - 1;
>>       min_order = ilog2(min_block_size) - ilog2(mm->chunk_size);
>>   +    if (order > mm->max_order || size > mm->size) {
>> +        if ((flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) &&
>> +            !(flags & DRM_BUDDY_RANGE_ALLOCATION))
>> +            return __alloc_contig_try_harder(mm, original_size,
>> +                             original_min_size, blocks);
>> +
>> +        return -EINVAL;
>> +    }
>> +
>>       do {
>>           order = min(order, (unsigned int)fls(pages) - 1);
>>           BUG_ON(order > mm->max_order);
>
