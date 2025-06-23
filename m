Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749D6AE4786
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jun 2025 16:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D68F010E008;
	Mon, 23 Jun 2025 14:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dHueb9e7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED65898F0;
 Mon, 23 Jun 2025 14:55:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNJ+zS8QzgVCQ9PRsnDJURxI42OFpV0V1jTrCx6L9g7pvvCq4suh9VjUlIpc8JBhNTdun4YgovtR0BroQPfVWMwv0APIbrW6kHN8HAwi7gTIzk3iL7QUVutFU483SAjhPSuTcL2wOjVf/CX8Tbs5Y9mWFCLUcLN21R1bUffGE2qDFdEYIXBu4ACG2zK0qTH21OVy+2G+FhCXsKfEvhyWjypqqZd4WPftvE1R8raZEa9FeyMTf2cIsDIRunsMwzoFjaRpZXNdURfKIuVchChQsMn8SrOLeI/zIaWlWZ9ltkX1dj6ugTAYj0Rm4FgDMAjuGEhcyjedAhHDl4TO8+xvRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdnW6hA5Ekr7EHbO6e17ERisqFeRmcLaPjey+QZ/4e4=;
 b=hpWvYEUedv6Xl7/dR+3rdku7AlsemtzooutRQOCh/pAWnH1b2RZJd2sDGpxUr5fy0H6INudQKyrkGVm/jUx+s0DsRI8EG3t5iN9/6cXrcKTi2GMLkMgPUA3kpBXdmo7oSnABilvG2AAXdDBMVwoYqYiYO7Knbmld/HC/LZhKldBH2UFfLGNTj430+oXD1MELYuLbdrU/Yq9+7DCgcn6Q7Dd6noExbiVAlnVdw6973UaZ8p3IbTs2MPFqp9eWaGtx7Ppr2f2Bnt8Pv8Hx2qE9Biz9JeA+Emznsb9y3DHLTlyADLje7+2KyTlRvGWatrvwB7/EaovRIZcUDMUkAgI0sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdnW6hA5Ekr7EHbO6e17ERisqFeRmcLaPjey+QZ/4e4=;
 b=dHueb9e7Jq/LymL3RVZMbON14CS+DWBOg0kK6mFtraYeVvHsjF9CGHRW5vDTCaX8jqw9Z5DRu0F7bivui/UX864nn9XF+JnsnVDQ/FkmerRxtH8xU4sokw5klFfOCsB0XbewEaYYnScV78c5DL22tC7ba8jrlEVwcPQeO37+lN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 14:55:22 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 14:55:22 +0000
Message-ID: <fd381676-d0c7-4981-8d23-b666ea5b29f6@amd.com>
Date: Mon, 23 Jun 2025 16:55:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm: add debugfs support on per client-id basis
To: Tvrtko Ursulin <tursulin@ursulin.net>, "Khatri, Sunil"
 <sukhatri@amd.com>, Sunil Khatri <sunil.khatri@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 phasta@kernel.org, dakr@kernel.org
References: <20250618134747.3893138-1-sunil.khatri@amd.com>
 <20250618134747.3893138-2-sunil.khatri@amd.com>
 <d1372124-616b-4bc7-8a5c-50c524bc3e5d@ursulin.net>
 <090b8491-329e-4dd7-9480-cf58fd4477da@amd.com>
 <067c1b95-9411-437c-9c57-0cc040547ffd@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <067c1b95-9411-437c-9c57-0cc040547ffd@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: IA4P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: cb298ba9-b127-4429-d3d7-08ddb265faac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUVpbjAvTkxEb3B0bDBDZ0VNVUZmeTNHeC9HV1h1Y2thQmQ3TjlubzROY2Jh?=
 =?utf-8?B?R0VpOFFKcGI5ZC9pT1Y4dHZOTVV2dWI5L0Y2RGVWVlk0WUhaamdiYUd1MjZC?=
 =?utf-8?B?UHYxbTIySFZ1RjRSekRPYkd2dTZlVzl4UkxyTitqTFhQUnJOSzUzMGdCenFh?=
 =?utf-8?B?SkRXTjBqdlFYd0grRnhoZXJmT0xKbC9rTGtPVWVVNElVN1N5VnJpUFZrTzdT?=
 =?utf-8?B?OVk4NkxNYkYxR0tpUUhnMjBldUVZQ0tMNWRJc0wvR2tuU2tqc2tZWjB3VmU0?=
 =?utf-8?B?eWtJd3JjdGtqVStOcVNTVFJQQ2NzK3FhbnBnRW9Va3dMN0xDZmJra3BLOTBX?=
 =?utf-8?B?TFVUanZSM2ZzdERHZFArcTRBakUyUmZ4ZWd5YitXWlRlL21qc2pyc2xGVkNB?=
 =?utf-8?B?cDBnLzlVYThTUjJoZmJJNnZaV1A5RGpZUnl5b283eENzWXg1M1R1Uk5KZDZu?=
 =?utf-8?B?akRtMEMwQ3JibVdhM1AyTGtDTnp5R1VGTXZKNFc4dVdVYlEvWVY0d3pZUTdm?=
 =?utf-8?B?cllNdklWb1ViYzN3bHhMVlhJOGVvWUcweVVCM3VFSTdqeVJmZVdic0xVUENW?=
 =?utf-8?B?UlpjOGFicGhKWndaN0svRFVQb21GZWFMUFI2Vk13VUxlRHZuWXo4Y3FJZ2xu?=
 =?utf-8?B?eGpVbWZjUXdzeWRFVnBVMThKNjVwVXdhRW1jZ2kzczdONlh4RTZLSWxmcUxl?=
 =?utf-8?B?QkR2QnFkakpNNi83aFJueWx0U2lsWVdxSjU1dFpBZG13M3RRRHYyVTUxajZX?=
 =?utf-8?B?Q0s0TUR5ZHdPYkcxNVNSOVFZRzIzem54WFY4Rk8ySm1tZVpoc2pDT3VMTHN0?=
 =?utf-8?B?UlZSZDh0R09pZjluZWVWa1Y3bTFVRTU3dTJmdEtpVVpiWXpod2xQMENpdlBu?=
 =?utf-8?B?amxMdUdmengxSnp2K01JV1lnbWI2TTF2N1ExVXhPV0JzM1RPVjFJdnU2Wjdx?=
 =?utf-8?B?aFpDQ1QyaWM4TWdCTWlpWFNvckJHV2hWNVlzNEE5cjk4OGRmcEkyVzVzWENI?=
 =?utf-8?B?cUY1M3YxR1oyalEvVFJGRkxmWS9zZ2s2bTc4MW9pNFpXTG9OR3UxZFFUNU91?=
 =?utf-8?B?Z29ibFgvSDVkM3FBSk5Db0N2b2Y1NENBQVRtOS9jWVZST2RhNEswMytvMVUy?=
 =?utf-8?B?L0E5OFFQSnhCTTZyRTluZmZVR1NUWUZFeDBEd0dYOFo3VGVrRVhqMTlUL1ZF?=
 =?utf-8?B?VFVQTmk3VjM3Y3VXY3ZxcCt0NFJMQUtrOWlKY0FsMTNiR1Z6MVAxVWJFREhL?=
 =?utf-8?B?VHZHdSt3UlM0QytROUFabVhUOElVZjUzUEhkZUdKQ1ErWHVSSWRJNnRtRXBF?=
 =?utf-8?B?b1crTG43VitCVElZdzRpaTRtSW1vdzVleGRpUUFEejFBOEN3UWJuejU3VFl3?=
 =?utf-8?B?MEZ3d0grYnFVWXpON3k2RG5YZGJPRGpYdHFLQ2RObjkrWDdGc09weEZ0Z3VW?=
 =?utf-8?B?OVc0VkxuS0IrUDNMY0pyWFVXSWE1R0k1RXhxYlM3eERZaXEyVnhSam16QWlr?=
 =?utf-8?B?NzVGclpwRUR0TTcrMXFuV09yR1U1NGZrREpSZGtCbzAvMTFwMlJwUjQ4aDdL?=
 =?utf-8?B?cU5Sa3JUTkV5WDdlRzdGNGx0VExkYTlBWXM3V1J1bmlJZWdWMXU0U0oxSWVX?=
 =?utf-8?B?VGxobkhVUWM2M3lMS092TzNCL0lKcUYyakR6SGdyZ3dNdXRzTEFFQnk2ZHZl?=
 =?utf-8?B?ZzNQamlyVHVaTG5QVi9KMlJySUZ6RkVYRng2VlVpdGRmbTY4VVVtNFN3MXkx?=
 =?utf-8?B?bys1ZWxLdXhHY1ErbDc4M2p5SWtDa0xCTzlpNkhSaFF5dUN0SlJ1bEVYd2dN?=
 =?utf-8?B?andzN1lhTDZXNXFqMFdzc1JINTQ3QUUyZVFJcCt2aGNxSUxDVmQwZ3JMbU5C?=
 =?utf-8?B?N3A0SEwwVHJTaCtUZzRvM2h2bnBmSkd3QW9YZVlualhQZkR2RTE5T0YyN1FI?=
 =?utf-8?Q?nyykiUmLsvA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXBZdUFmV2R6Rm9heDJEQVV1ODhOQnhhYmxmUms3bVJYQ3FzM2VQdGhnNWdn?=
 =?utf-8?B?MDBmd0ZUN2ZtMzhsNlRuZUVDZ2ZnalQyQ05pQnd4RlozdHBPTEEzV2FudlFG?=
 =?utf-8?B?VG9BcFZTKytkQ1d0bmV6R2xSTGFGTmJPTHlXa1JJUXNMempGT3A1YlJaSWE1?=
 =?utf-8?B?ekkwcTYrMnNVb01Nem9hSXN6bHFkaGJkTlBKVkZISU9yRHlQdE8wU1RoN0hZ?=
 =?utf-8?B?cm8xazF1ekgrbU9rM0RyTUZEQisxZUNSdnNIRm9SdXorTTdTU3U3RngzcnJw?=
 =?utf-8?B?WHlUNVBKdXlKL0NMKzBZWGFhZmpSYXNFclRsSmNQRWNDZ09OeHhHSXVxU2tu?=
 =?utf-8?B?aG1MYUJrcTVNZk9qZ20wWWtkVDZjRjBrU2ZEcmNNeHc0ampyOFdWdDBzNHgy?=
 =?utf-8?B?TFlDTXYxQmNqOTJpRVBJTWpWTjY2Tlg5OFdzMXA0cmtkMUtIRXJ0bnF1b0FM?=
 =?utf-8?B?S0MyZUpjYVY4MnJaZXl6czRNV0hKeEdhS0VtZCtVNHdITnJDZHpqNkdGTGFF?=
 =?utf-8?B?VGR4OTh5Yzlrc3MvSHJDQm04R0dvWVVxWC9GWjhOYnV1ODhaNis3ZGx1STBt?=
 =?utf-8?B?d2dwcWQ3eDZ2QUNURHhTVWpiWkJzNEoyWU1lRHNJZjlRbkpOWXNNZ0V0MU53?=
 =?utf-8?B?SFJ6RjN0SWowVDBBWTU5MDY1YS9tOThGMVRFUDV1QUlWUFlsRE01SHM4L202?=
 =?utf-8?B?SlBIZDFoMGtWTzFpcGJoVTh6QWVRTXcxWXZvcXBMaGlxUGltZzczZVJwRUN0?=
 =?utf-8?B?eTcwbzZISXA0SytCNWpOMG10OCtvaHB4eUI5ZUhuS2srVFpRZ1FJb2thZWQr?=
 =?utf-8?B?VU0wNGpzSndHM0ZsSVM2UlRaSmNCeW1XQmlvTDBMZzhVUkYvSmJ0cDZoK3VC?=
 =?utf-8?B?cGVjVFowMXE3UUExVDlPNkNmVGpQL1pTL1ZGdzdpOHIrdWdKcXgzOWxwRitU?=
 =?utf-8?B?M2xsNjRJT1F5VE1JUVpzRVdPLzdRK0dnRmM0cFV2b043Mm93TFlvY0l5Zkpn?=
 =?utf-8?B?Ym1Gcyt0OXN1ZHlROCs0ZDVaeFF4dUVHbUthbnMwWEV4b2tTN01LbE1iMFdK?=
 =?utf-8?B?UnpXS2NhVlltQk1Cd3hZcVAyT1NPakdRTmJiTHd5TXFITldtNXo3SmFwQllV?=
 =?utf-8?B?UUcyblFaOEpNT1d4NlltdlliRXJnL0ZobjVrYXE5SC81U1E0TnVPWnNhQU1K?=
 =?utf-8?B?ckhjclE2QmI2TXEzTEVzYW5iS3Y0U1J3RzdTdDZMeWNYWGpoUFlpWkd3Y1h4?=
 =?utf-8?B?Z2I1L2I2YncySGZ4M0hSNFVFYVlLWDdIa3NlVVBvZWhlM1hWUEd3QTJzZ1lR?=
 =?utf-8?B?RnorMUJzeWhzNEFRWUtBU1ZkTFZ4SnRHMDdsajNTTHVPVUo0dXZFVEgxMFlK?=
 =?utf-8?B?MFdINDVYVG5LdTVPakFLN2IzU2Q0NzRHQUkzckVPWi94Rml3SHh1Tyt4NHl0?=
 =?utf-8?B?aWFHVkFxV2Z4OHpQbGJvY0pkcDFiNk5DSUdhSXZYQWVtRXhJVllnNTljSDVL?=
 =?utf-8?B?UUxKVkxmYVhISm1RbjBXZ01VaEpsaGZYUDdoT3pBU1VWSFo2U2VrN3lXZ3lX?=
 =?utf-8?B?TDlPVnhzY2JBaE52ZENNR2xKbVJlOXZjWm02VE9wa3l2M2tRd3VQSkVRZHd4?=
 =?utf-8?B?d3FZNlpxKzA0OUxmSFVxcktqcVQrOVNlWjk3SHF3RTZaNTdMdk85V0RQcy9Z?=
 =?utf-8?B?alR3eHVXdzFUS3VnNHlhRUVMalFoN2xSZXBCVnBpMElqdFd5aEFJTkVXZzY5?=
 =?utf-8?B?c1Rvb01LWFNGbnFjSlBmYzNqclBOYjdqOVRVd2FOd2h6TGRhcklqNHp6dHUz?=
 =?utf-8?B?bURnaTE3amxjbEIyNUZPa0gwK0M4eG5yckNjc1ZIL0ZvbmIyblRxQ1RRQkI0?=
 =?utf-8?B?UXJmV2MzeXk1dXBnSTd3K2dBbHhXWk1LSUVReWc3MHNJY3FBT1BSUmVaUlNp?=
 =?utf-8?B?MFJpSDR1R0pDaFZ4T01Gcld1azJUYXJHVjMrL1lRNUh5a2NyWEd1RXM5bG1W?=
 =?utf-8?B?aFJnQWswT21vYkZZVGpvK3MxbEsxV3MxODNIUHc0djFYU3EwMUlkZURVcmJl?=
 =?utf-8?B?eUkyVWhtRlNnODl2eUU3S1FjemhjZm5zMW15YUM2UnNWTlVJNGZiVG5SNHRB?=
 =?utf-8?Q?1uyvRFMDR8KkPMm7DYNdW3/eN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb298ba9-b127-4429-d3d7-08ddb265faac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:55:22.5123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3uDPRHglcqMZtCQrpkIQ46rts+rMBiyvGZypmd8pI0QP24rLNP+FG5P5tQKvMtfB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796
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

On 23.06.25 15:07, Tvrtko Ursulin wrote:
> 
> On 23/06/2025 11:24, Khatri, Sunil wrote:
>>
>> On 6/23/2025 2:58 PM, Tvrtko Ursulin wrote:
>>>
>>>
>>> On 18/06/2025 14:47, Sunil Khatri wrote:
>>>> add support to add a directory for each client-id
>>>> with root at the dri level. Since the clients are
>>>> unique and not just related to one single drm device,
>>>> so it makes more sense to add all the client based
>>>> nodes with root as dri.
>>>>
>>>> Also create a symlink back to the parent drm device
>>>> from each client.
>>>
>>> TBH I can see an use case for both clients at DRI level and clients under DRM devices. I guess you have an use case for global and per device can be added later if it becomes needed.

We already have a "clients" file in the driver directory giving you a list of clients who use this driver instance.

>>>
>>>>
>>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/drm_debugfs.c | 32 ++++++++++++++++++++++++++++++++
>>>>   drivers/gpu/drm/drm_file.c    | 10 ++++++++++
>>>>   include/drm/drm_debugfs.h     | 12 ++++++++++++
>>>>   include/drm/drm_file.h        |  7 +++++++
>>>>   4 files changed, 61 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/ drm_debugfs.c
>>>> index 5a33ec299c04..875276d5fb9f 100644
>>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>>> @@ -298,6 +298,38 @@ void drm_debugfs_remove_dir(void)
>>>>       debugfs_remove(drm_debugfs_root);
>>>>   }
>>>>   +int drm_debugfs_clients_add(struct drm_file *file)
>>>> +{
>>>> +    struct drm_device *dev;
>>>> +    char *client_dir, *symlink;
>>>> +
>>>> +    dev = file->minor->dev;
>>>
>>> FWIW, as dev is only used once and string locals are not overlapping, you could reduce to a single local variable like char *name and re-use it. Up to you.
>>>
>> Let me see what i could do with that. But yes can reduce locals.
> 
> Ok.
> 
>> regards
>>
>> Sunil
> 
> Usually when you sign people stop reading. In this case I accidentaly spotted there is more below.
> 
>>
>>>> +
>>>> +    client_dir = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
>>>> +    if (!client_dir)
>>>> +        return -ENOMEM;
>>>
>>> It is a bit more work, but I think a clients/ directory with numerical client id subdirs would be nicer.
>>
>> It was with the id only first but with feedback from Christian i moved it with client-$. Also since we want it in main root directory along with nodes like 0 and 128, it makes sense to differentiate and make a clear
>>
>> representation of clients.
> 
> I don't mean id only in the root dir, but add a clients subdir in the root, where clients subdir contains more subdirs for individual clients. Maybe it is personal but for me $dri_root/clients/1/something feels nicer, less cluttered and potentially easier to handle in scripts and/or code that $dri_root/client-1/something.

I've played around with that idea as well, but then abandoned it as only an extra step. But it might indeed be nicer.

>>
>>>
>>>> +
>>>> +    /* Create a debugfs directory for the client in root on drm debugfs */
>>>> +    file->debugfs_client = debugfs_create_dir(client_dir, drm_debugfs_root);
>>>> +    kfree(client_dir);
>>>> +
>>>> +    symlink = kasprintf(GFP_KERNEL, "../%s", dev->unique);
>>>> +    if (!symlink)
>>>> +        return -ENOMEM;
>>>
>>> Worth removing the partial construction?
>> Ideally it should never fail and but yes makes sense to clean up.
>>>
>>>> +
>>>> +    /* Create a link from client_id to the drm device this client id belongs to */
>>>> +    debugfs_create_symlink("device", file->debugfs_client, symlink);
>>>
>>> This can also fail.
>> sure. Noted

Keep in mind that the results of debugfs functions should *not* be checked and failures should *not* be fatal.

Otherwise Greg comes out and beats your code into shape :)

>>>
>>>> +    kfree(symlink);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +void drm_debugfs_clients_remove(struct drm_file *file)
>>>> +{
>>>> +    debugfs_remove_recursive(file->debugfs_client);
>>>> +    file->debugfs_client = NULL;
>>>> +}
>>>> +
>>>>   /**
>>>>    * drm_debugfs_dev_init - create debugfs directory for the device
>>>>    * @dev: the device which we want to create the directory for
>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>> index 06ba6dcbf5ae..8502c5a630b1 100644
>>>> --- a/drivers/gpu/drm/drm_file.c
>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>> @@ -39,12 +39,14 @@
>>>>   #include <linux/poll.h>
>>>>   #include <linux/slab.h>
>>>>   #include <linux/vga_switcheroo.h>
>>>> +#include <linux/debugfs.h>
>>>>     #include <drm/drm_client_event.h>
>>>>   #include <drm/drm_drv.h>
>>>>   #include <drm/drm_file.h>
>>>>   #include <drm/drm_gem.h>
>>>>   #include <drm/drm_print.h>
>>>> +#include <drm/drm_debugfs.h>
>>>>     #include "drm_crtc_internal.h"
>>>>   #include "drm_internal.h"
>>>> @@ -143,6 +145,13 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
>>>>       rcu_assign_pointer(file->pid, get_pid(task_tgid(current)));
>>>>       file->minor = minor;
>>>>   +    ret = drm_debugfs_clients_add(file);

No error handling for debugfs functions please!

>>>
>>> Slightly tricky part is that as soon as this runs userspace can enter debugfs. If in the future any debufs clients file is added which can dereference any of the drm_file fields not yet initialized it has the potential to explode and/or be exploited.
>>>
>>> Hence I think to be safe the usual pattern of exposing drm_file to userspace at the end, only _after_ drm_file has been *fully* initialized.
>>>
>>> Slightly annoying part with that might be undoing dev->driver->open() but maybe it is not that bad.
>>
>> I need this before driver open as the entry is accessed in driver->open in amdgpu to add files to the directory.
>>
>> So, i could see to move it just before the open but not after. Anyways if we reach till driver open surely file is fully initialized. Nothing else is done in that function after that.
> 
> I guess it is fine as long as dev->driver->open() will be the only place which will be adding files. If one day DRM core decides to add some common file it will need to make things it can dereference are fully initialized.
> 
> Perhaps what makes sense today to make this more robust, and it is not hard, is to simply move drm_debugfs_clients_add to just before dev->driver->open()?

Well the common files should always work and never crash on read, don't they? So it should be save to have them created as soon as the drm_file exists.

The question is rather how do we handle teardown? Removing the directory as soon as possible?

Regards,
Christian.

> 
>>
>>>
>>>> +    if (ret) {
>>>> +        put_pid(rcu_access_pointer(file->pid));
>>>> +        kfree(file);
>>>> +        return ERR_PTR(ret);
>>>
>>> Onion unwind already exists in the function so could have used it. (Add a new label and here simply "goto out_put_pid".) But as above we discuss tweaking the order lets see how that goes first.
>> Sure.
>>>
>>>> +    }
>>>> +
>>>>       /* for compatibility root is always authenticated */
>>>>       file->authenticated = capable(CAP_SYS_ADMIN);
>>>>   @@ -236,6 +245,7 @@ void drm_file_free(struct drm_file *file)
>>>>                atomic_read(&dev->open_count));
>>>>         drm_events_release(file);
>>>> +    drm_debugfs_clients_remove(file);
>>>>         if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>>>>           drm_fb_release(file);
>>>> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
>>>> index cf06cee4343f..4bd6cc1d0900 100644
>>>> --- a/include/drm/drm_debugfs.h
>>>> +++ b/include/drm/drm_debugfs.h
>>>> @@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
>>>>     int drm_debugfs_gpuva_info(struct seq_file *m,
>>>>                  struct drm_gpuvm *gpuvm);
>>>> +
>>>> +int drm_debugfs_clients_add(struct drm_file *file);
>>>> +void drm_debugfs_clients_remove(struct drm_file *file);
>>>>   #else
>>>>   static inline void drm_debugfs_create_files(const struct drm_info_list *files,
>>>>                           int count, struct dentry *root,
>>>> @@ -181,6 +184,15 @@ static inline int drm_debugfs_gpuva_info(struct seq_file *m,
>>>>   {
>>>>       return 0;
>>>>   }
>>>> +
>>>> +int drm_debugfs_clients_add(struct drm_file *file)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +void drm_debugfs_clients_remove(struct drm_file *file)
>>>> +{
>>>> +}
>>>
>>> Static inline for the two above.
>> Noted
>>>
>>>>   #endif
>>>>     #endif /* _DRM_DEBUGFS_H_ */
>>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>> index 5c3b2aa3e69d..eab7546aad79 100644
>>>> --- a/include/drm/drm_file.h
>>>> +++ b/include/drm/drm_file.h
>>>> @@ -400,6 +400,13 @@ struct drm_file {
>>>>        * @client_name_lock: Protects @client_name.
>>>>        */
>>>>       struct mutex client_name_lock;
>>>> +
>>>> +    /**
>>>> +     * @debugfs_client:
>>>> +     *
>>>> +     * debugfs directory for each client under a drm node.
>>>> +     */
>>>> +    struct dentry *debugfs_client;
>>>
>>> Is it worth idefing this out if !CONFIG_DEBUG_FS?
>>
>> Surprisingly i dont see CONFIG_DEBUG_FS used in drm much.  So keeping it same for this one variable too. Need a whole new change to keep debugfs related things under the if.
> 
> Ah struct drm_device.. I see what you mean. I guess the waste if progressively worse as the unused fields move from structs with fewer instances to ones which can be a lot more.
> 
> Regards,
> 
> Tvrtko
> 
>>
>> Regards
>> Sunil Khatri
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>   };
>>>>     /**
>>>
> 

