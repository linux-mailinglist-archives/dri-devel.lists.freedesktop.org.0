Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6D2B07432
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 13:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5892210E7A3;
	Wed, 16 Jul 2025 11:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EUs4OYqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B22110E7A2;
 Wed, 16 Jul 2025 11:01:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WURBd0zgKSZvFoQIr1ZGf0dMDYmHegMHEeRoP2d1QR3AO/2Q/NKKOoWLiF6QGhUj9eZesI3oJVjwwHjqogFrT3p8n8gMaAfAWWdSb11on5DvEG1O+E20D3OT36Zjv9iUT4/BIbXwFuRVOOktAbDtLROOTcymUXsGTfkMwqQcKyOZqJmxrkhNubFrDOTDimVF2o5zVm/Nzim5eCMmHz/EdEmr5gO12nIpLto8BocTHiX9dpe0mn+hL+tCxsP2wMfkOi8GJwlNIgmXucZwpjOgtE8iFl3CYsRMqCBCuK7dHF8lFhASs3HV1XNUy4l42aJmb1Hdk38n1NiY7vTyNcc8fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORnnAgzF2fUlZO3Wl7FA6bKjJJqFAbPcziagf4txzMM=;
 b=JeXg+Cgqxc/aNks1U9UGRCsL1R8v6MHahbDdqc5LBlww+LawfgJtbD/5ycHHW679vRgOhvBlFuK1JtTyVrSIl8xYEFdFTqXvDdsLxPTfq9YoVuzLHPM1Ul+HVkI+Uupkatib/yzIM4jpDngVjfOy5CfcrhBuX54qziG4qbY1xriFba2NMWy9J8/w/zbQ+9ZEH3TddBguNQiII4rZgDCpf7Yy/0zu6GH8n/e4qXTRNuC+Q0X+FYIeA75H9rKHdRW9QOe9xdRmA0fqtLT+Ny0OqK79SwPk0czf811TGI78t/M2aAHrD/cekuTkXX/hpn1GN28Pa4HIA953TCC/y7/mbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORnnAgzF2fUlZO3Wl7FA6bKjJJqFAbPcziagf4txzMM=;
 b=EUs4OYqBPmQ2KKALK5paLsp07KDi5c6MA1WB6amjx+dAIghArnyvj/yx9alq8czPVW4OL4cHhjN4ATUVuXqr/vUOU++f6KHsvUl0FHbXp4R2MxEoGJi+hTcP3sROGje80tB2cQ1z2fnehoxKLXcbaA2PyDnbZ5PPFI7P7DiK5Pg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by SJ0PR12MB5635.namprd12.prod.outlook.com (2603:10b6:a03:42a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.37; Wed, 16 Jul
 2025 11:01:00 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%4]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 11:01:00 +0000
Message-ID: <7dc8fb2e-7b60-4d8b-b91e-a4a6b90cdc52@amd.com>
Date: Wed, 16 Jul 2025 16:30:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] drm/amdgpu: Reset the clear flag in buddy during
 resume
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com, airlied@gmail.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250716075125.240637-1-Arunpravin.PaneerSelvam@amd.com>
 <20250716075125.240637-2-Arunpravin.PaneerSelvam@amd.com>
 <05a2b3f0-2166-47cd-9964-53254e4df6ba@amd.com>
 <9e9be088-fca0-4f31-bfa9-5201f46e1d12@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <9e9be088-fca0-4f31-bfa9-5201f46e1d12@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0252.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::11) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|SJ0PR12MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 326be2b6-8eaa-45b9-20f2-08ddc4580c04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVN1RXR2MU1XQlZmeXY0YkdLcXlZbndMeExRTUZIVDVvWHBFODJTWDhzVUFB?=
 =?utf-8?B?OTdmRmRPR3pyYVRRWlJET2lldzBhR3pNeTRDM2hGTUhWcUpaWC9acDQ4UVFQ?=
 =?utf-8?B?eGtyMTVqOVk3VnJQNk1XME93VGlWaWVpbDRpQTZrSi9hR24yNkx4MG1DMXRI?=
 =?utf-8?B?YnVwNWJ6Q0dZUnBYMUVJaW03ZGNaN3Nwdkl5VUt3TWpTQ1hJMXE1cGx1U01W?=
 =?utf-8?B?SmhYQUVMUktpZGhhbS9xcmlobnA5S3lEZHFnTG1qSTRSVU8yOHBaY08xWmRV?=
 =?utf-8?B?b043cEk0UjhFNGd6QmlJdGw0dkIwNFlZYjUwbkJGVVhReHRvazdrOFV0N0U4?=
 =?utf-8?B?Z202K1B4SzBKTEZDNFlJT3F3WUp6dHZwNTlpVXMra3FFY29HNi9Kc2EzUVJH?=
 =?utf-8?B?OVpIYmRPYUExbDYrZ1JLRUxMWFdIRFd0cFpIb1RwQlZXYzBlREt5MTF3OUJ3?=
 =?utf-8?B?aXFTUTNtbHNHUURRYzNVNUI2VGx5NFlxNElGbnVCSHF4OWNQaHF1WExEQm92?=
 =?utf-8?B?bGR2Q2hhcGV6VjNNcWlBTSt6RTlDYzlHMkUyckcvSVc5bUl4OEZnRDAxTGtr?=
 =?utf-8?B?MHBFTUtlVFRRd2VJR29sQS81ejZseUVEYURtVzJxMXhELzE5dC9scXlkWHFh?=
 =?utf-8?B?VVhPc1psSFA4S2thaWlvNVZpK2NVUWhsSXpRU0ZBbmlFOXBYQVdVb1crQzJE?=
 =?utf-8?B?SGZLYlg0SG9yUi83NDg4QXlUMktpNHlzaEd2THgxL25FdG9rNTAyQVlhTEtT?=
 =?utf-8?B?K1BEalByQjZKdnFHdnBDUW5DUERKd0RneG9aRDg5NGJmOGZDT0VHaUgrS3Vq?=
 =?utf-8?B?OWZ0ZVk5SFFkNlhDSmFjWWNoaUpzTmJFYWhxRTNNYzRYTFJTSmpYWkxMeWR4?=
 =?utf-8?B?c1B3UW1vTGFBWXc3dkw1MytVKzZ6WXpvRE45OWo3Q1hUN3FyMkpVVmFCMzAz?=
 =?utf-8?B?UkxLOTNXQXNFR3BleE12OFVjOEhkWkRoOEVTS1JwOGZjNzJwOFhkdnFBU0s0?=
 =?utf-8?B?SHFkZ0tvMUJ2M09TTm9SejJaZk1nWjJTQ0toc1h3K0VWQjZ6OGdleHdTZUh5?=
 =?utf-8?B?VDBqWEplR2tJK09hZU0rd0pPSGhPNGNYOW42UlUvRzVWSDBNSFpzUVVUS0Z2?=
 =?utf-8?B?a3FlWmFwOXlsQWthVnJVaGZZbWYrUVpaenowR0RORnNHYmhQM3NieVFONVRF?=
 =?utf-8?B?eEkwaGtCSUwyOGRTa1BtVE1ZdFJiaFE4WTM0QVk3Tk5YZXQzZUtqVVdZaVJj?=
 =?utf-8?B?Q2QvTFJQMFl2L3ZudHF3R245Mlh3NHlXTWJnY2hPRGFYMWI1eEwweUxOTUt2?=
 =?utf-8?B?YytRUlRlSVRua2YzQ216cHhTbWNsZWQxYmZabnVkLzVzNkJDQzFmV3M2RW1u?=
 =?utf-8?B?OXY1Wk1Oc01uR2RPYXNaSTMrdXFXc1E3MTA1OXdNMG5kOHJ2M2FSSEI5Nm4w?=
 =?utf-8?B?UVEyTGRtanVGU1FBWU5UajJPMnpkMFVhbXlicG1XSGNqZWlKcUx5RDN2NThi?=
 =?utf-8?B?ek1PMU5HZ3VseGFOWGVKUXdpRzRsdlNZY2hRSzhrbnNLY3ZmYW9YMWM2TkxB?=
 =?utf-8?B?eHJtc3gwbU1FZXdYQ0habk5FU2llTXJQdTI0cjRPS1hlQWFMMG52TXFKSHNm?=
 =?utf-8?B?OUlmRVZSZ1pxZUVhTUVVenhxSkxPbGxYbzM0d3BwdC9ZcHYxemF0eUtub2Ex?=
 =?utf-8?B?V0lNWm5mczN2Q3QxU2dIUDVJWjNzbGdNVXl5eHRXV3FCUTFwYmt4dUZkYTlJ?=
 =?utf-8?B?VUVSdEVVUUwwSGJiRTF3T0VLczM0cE1zWDZlTlRxZVlqM1ZkZVl1MUFQMlVn?=
 =?utf-8?Q?ri/fRWI3CqvkScUqAKYMNT3+hbJ90w6B0/Io8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGJMaHFsTXd5WGF2MitKVm1xSkpNQitNRWFGVGZLSjFyS29uYzVEUVpyaHF6?=
 =?utf-8?B?T0Y3M0NNUHVsNWU1Q2VIZlhqUTl2YnNPQ1NVQTlPTXRHSXNzYU1kMkcrRXFz?=
 =?utf-8?B?TGYvKzVZUUdpbFZNQ2lncWJreHhFS2J6bVpUa2UzWkx1cGI3ODNZUWJBQXRl?=
 =?utf-8?B?WFNGazFBR1ZTNXFYSFArRkpRMW9jNzRSOFVJSUFMb1NRVk5EQmVXZTBxcy9G?=
 =?utf-8?B?cHJYQmZYejFPaFc3YktoNnZuUlN5WjE3MXBKZzRuYnp6ckUzWWpRQ2hQNTJT?=
 =?utf-8?B?ZU5VRjIyY3NGcWlyenFQc3JHZG9HNEtlVUR3RHVQWnh3UlpWd1dhMEZCbEdC?=
 =?utf-8?B?dUNiM2dmbFhGcjhaRnNleUZXZWttZTFudXhQelBVdGRSYzVQM1MvL0wvZzh1?=
 =?utf-8?B?TC9mdEVCQTQxQ1Q1SWRhdUZpMXBPTnVmOWVSYTBmaFlFa3NUN3VDUG9hWlA2?=
 =?utf-8?B?ZmpVS3FiNDNBNFpMbkZIMGQ3cEZEYVZFQXlPSWZuVmlnN2dLKzRLUHNzMi9y?=
 =?utf-8?B?VGxnR2RIWVR2YnB2VHNnOEhxd29HWXM3UVdnNlQxQVpFTmVwTVdiVHBEbENM?=
 =?utf-8?B?YUZRaWkrUENLdVpiWEVUSENzMXJlekR5WDNnNGlYcS9ldVlvd2xmMERNbE1u?=
 =?utf-8?B?aE9KbmFrMkpsRTh2SWhPQzlycE1aa0FaOEZEL2xIWXVocnBadmhPN25peElr?=
 =?utf-8?B?L3lTN2dpL205UWpVZVA2eGZTN3dDRzMzQit6MXFtZUN0OTJtQ3V2OUdzZDNp?=
 =?utf-8?B?RjdaNlNNQURPZi9vU0FJY0xScGFJSVdJR1dxdWxXV1dmZ2tXTzllSTYvc3Zt?=
 =?utf-8?B?bDhSbFdIVkdacm9lY3RwWjhMeFFTdmhvL3JTUzdXanVoUUkyQlU5c2c0Szls?=
 =?utf-8?B?bHdHSWlFbUJkUTI4KzF4UmJJM1MwMWhjQm1RT1lWM292QTN3UGZCZTEwSWF4?=
 =?utf-8?B?U0JjRFVPcDhGamhodmFUdko5VHR0TlYwM0dwRXpoU1hmUHhCU21ORzRaR0hq?=
 =?utf-8?B?aGtYS1dtb2hsSnJLM3l0NzBReHd5b2hFejIyeWdEWlBRVWl1U0F2OG96eU9G?=
 =?utf-8?B?Znh5ekE4aXN5ZDh2UHU4SkN5a2RzV3RMcVY5dnFqdTE3d1VpR29wZ08xdnB3?=
 =?utf-8?B?WnBjVGF0VU5HMVJxbzJsRmFLVWVMSHkyd0VrdHBCb0NsbkN6N3VML1dDbGxa?=
 =?utf-8?B?TXFubWFybmFicUNKQXZYZWlOWnNwa2pHdGlkMWhDREtwdk5Hamh1NlpVTU5u?=
 =?utf-8?B?eU9FbDEzVy9tQjhQc0RWRW42aGRxWW1nM0w3ek9SQkM5d1UrdzBIb2JRYUhB?=
 =?utf-8?B?d1FWZmtaVjZJYnJFWllLN2FLTTRpOGw5RHNQdGtXTXczVFpBZDVpZ0taL0RG?=
 =?utf-8?B?cCs4OVVOL2pHaEVKN25LUTN1cjdIYytpcmUyUVltTmdsRXhWQ3JUc3Znazhv?=
 =?utf-8?B?QWFpNEtiUGR0Tnp0UkhNZUhYRDhWN1habitwM2M3OFRQTmhvVEdySEsrWTdX?=
 =?utf-8?B?cUNWczBjWFNueWdMeXZwRnFZSldFK2N5eld1YXRFWVp0VjVSbC9teXlhMjZ5?=
 =?utf-8?B?UnN2TjNOQUU0SkJmVFQ2bnA2N1ZCSmM0bHdYODJ3Tjk1VTZiSm9EanA4TjNs?=
 =?utf-8?B?dlBTbmxJSnMwSmsxRm4yV3BhRVNuelAzbGZDT1ZUSnhTcE9kTlhmZmR5ZkJD?=
 =?utf-8?B?N3pNUVpFQmRXZFFtR1pkNEJxWm44T2sybGpHZ3pya1ZxMm00a1VBeEpIN2Vr?=
 =?utf-8?B?MERmN3d2SkxCVEYrTkMzZklkMkN0VEZQL1JYVmQySUNXK0hTblE3OGZ1YlU0?=
 =?utf-8?B?WnQ4bG9oUk5sRXBqajZWeDk1cUs4QzE3RmVkUGVscC9VVUpPZlhKYmVuVzRt?=
 =?utf-8?B?SXhzUG9lNExlUUJqbnROdFU3U0R5WEp0UkdtU1hWZXhFSWJmMW8rT3ZERDRo?=
 =?utf-8?B?Um02VTE1amZ6WGh5dG1kRDlUc2ZleDBmOUdBUUpIRDRJQWRBZEQyU1EzREFn?=
 =?utf-8?B?U3VSSzhJZTM1L2NKY1hkN1FVUEVLYkI0S3dYU1hkdmVWRnFERnhQUHc2LzR3?=
 =?utf-8?B?SkxBL005Ky9LNmxNUGN6ZmxTMHVwK3ZIYUF4UWx4a0Z3cmcxallsRnQrOVl5?=
 =?utf-8?Q?ja8lbBQdbu9UiASd9XUdTioGT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326be2b6-8eaa-45b9-20f2-08ddc4580c04
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 11:00:59.9345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aI9x/4rCsWRiQ//3hNH8wDG8i2FskihIlMRxQKLDHWe+pZ2sFwXGUo7WuvL5VziOpAk8E81ceKPNFKcHDA2jEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5635
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

Hi Christian,

On 7/16/2025 4:17 PM, Christian König wrote:
> On 16.07.25 12:28, Arunpravin Paneer Selvam wrote:
>> Hi Dave,
>>
>> I am trying to push this series into drm-misc-fixes, but I get the below error when dim push-branch drm-misc-fixes.
>>
>> dim:ERROR:e24c180b4300("drm/amdgpu:Reset the clear flag in buddy during resume"): Mandatory Maintainer Acked-by missing., aborting
>>
>> Looks like maintainers Acked-by is required to push the patches into drm-misc-fixes ?
> Strange, it should work with my Acked-by. Let me give it a try.

Sure, thanks!

Regards,

Arun.

>
> Regards,
> Christian.
>
>> Regards,
>>
>> Arun.
>>
>> On 7/16/2025 1:21 PM, Arunpravin Paneer Selvam wrote:
>>> - Added a handler in DRM buddy manager to reset the cleared
>>>     flag for the blocks in the freelist.
>>>
>>> - This is necessary because, upon resuming, the VRAM becomes
>>>     cluttered with BIOS data, yet the VRAM backend manager
>>>     believes that everything has been cleared.
>>>
>>> v2:
>>>     - Add lock before accessing drm_buddy_clear_reset_blocks()(Matthew Auld)
>>>     - Force merge the two dirty blocks.(Matthew Auld)
>>>     - Add a new unit test case for this issue.(Matthew Auld)
>>>     - Having this function being able to flip the state either way would be
>>>       good. (Matthew Brost)
>>>
>>> v3(Matthew Auld):
>>>     - Do merge step first to avoid the use of extra reset flag.
>>>
>>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>> Acked-by: Christian König <christian.koenig@amd.com>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: stable@vger.kernel.org
>>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++
>>>    drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++
>>>    include/drm/drm_buddy.h                      |  2 +
>>>    5 files changed, 65 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index 723ab95d8c48..ac92220f9fc3 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -5327,6 +5327,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>>>            dev->dev->power.disable_depth--;
>>>    #endif
>>>        }
>>> +
>>> +    amdgpu_vram_mgr_clear_reset_blocks(adev);
>>>        adev->in_suspend = false;
>>>          if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> index 215c198e4aff..2309df3f68a9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> @@ -155,6 +155,7 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>>>                      uint64_t start, uint64_t size);
>>>    int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>>>                          uint64_t start);
>>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
>>>      bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>>>                    struct ttm_resource *res);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> index abdc52b0895a..07c936e90d8e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>>> @@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
>>>        return atomic64_read(&mgr->vis_usage);
>>>    }
>>>    +/**
>>> + * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
>>> + *
>>> + * @adev: amdgpu device pointer
>>> + *
>>> + * Reset the cleared drm buddy blocks.
>>> + */
>>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
>>> +{
>>> +    struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>>> +    struct drm_buddy *mm = &mgr->mm;
>>> +
>>> +    mutex_lock(&mgr->lock);
>>> +    drm_buddy_reset_clear(mm, false);
>>> +    mutex_unlock(&mgr->lock);
>>> +}
>>> +
>>>    /**
>>>     * amdgpu_vram_mgr_intersects - test each drm buddy block for intersection
>>>     *
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index a1e652b7631d..a94061f373de 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -405,6 +405,49 @@ drm_get_buddy(struct drm_buddy_block *block)
>>>    }
>>>    EXPORT_SYMBOL(drm_get_buddy);
>>>    +/**
>>> + * drm_buddy_reset_clear - reset blocks clear state
>>> + *
>>> + * @mm: DRM buddy manager
>>> + * @is_clear: blocks clear state
>>> + *
>>> + * Reset the clear state based on @is_clear value for each block
>>> + * in the freelist.
>>> + */
>>> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>>> +{
>>> +    u64 root_size, size, start;
>>> +    unsigned int order;
>>> +    int i;
>>> +
>>> +    size = mm->size;
>>> +    for (i = 0; i < mm->n_roots; ++i) {
>>> +        order = ilog2(size) - ilog2(mm->chunk_size);
>>> +        start = drm_buddy_block_offset(mm->roots[i]);
>>> +        __force_merge(mm, start, start + size, order);
>>> +
>>> +        root_size = mm->chunk_size << order;
>>> +        size -= root_size;
>>> +    }
>>> +
>>> +    for (i = 0; i <= mm->max_order; ++i) {
>>> +        struct drm_buddy_block *block;
>>> +
>>> +        list_for_each_entry_reverse(block, &mm->free_list[i], link) {
>>> +            if (is_clear != drm_buddy_block_is_clear(block)) {
>>> +                if (is_clear) {
>>> +                    mark_cleared(block);
>>> +                    mm->clear_avail += drm_buddy_block_size(mm, block);
>>> +                } else {
>>> +                    clear_reset(block);
>>> +                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>>> +                }
>>> +            }
>>> +        }
>>> +    }
>>> +}
>>> +EXPORT_SYMBOL(drm_buddy_reset_clear);
>>> +
>>>    /**
>>>     * drm_buddy_free_block - free a block
>>>     *
>>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>> index 9689a7c5dd36..513837632b7d 100644
>>> --- a/include/drm/drm_buddy.h
>>> +++ b/include/drm/drm_buddy.h
>>> @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>>                 u64 new_size,
>>>                 struct list_head *blocks);
>>>    +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear);
>>> +
>>>    void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>>>      void drm_buddy_free_list(struct drm_buddy *mm,
