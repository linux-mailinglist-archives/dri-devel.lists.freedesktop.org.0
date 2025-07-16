Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C732B06F92
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417BE10E6CE;
	Wed, 16 Jul 2025 07:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CFspYoFd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2055.outbound.protection.outlook.com [40.107.101.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3727F10E6CD;
 Wed, 16 Jul 2025 07:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFqMzR3SdqFfTl83jOY6EzvHwIozgZMEF5Vu2WqjmZ+RZcBd08E7NoD50o6CaAQU7V7EUFpwXi7E0tLviTK/EyWrMiZj4+A9cjHmeZnE5n2I+J8gtLWp586rOOF4CTTrCXseGyvcbpsq/VAy3WqwaDeDqj8vx7597dMVIl8gDKXZOOTd6yscXSu2UNL+wkIqQCFwDRTc+QFIHtCiTFr3Ead+bTURvHRpxGzFlE4v+g0PYQGlNGyE0UnMSmkWXkWnhBrFgW1UaTiFEQzQCp0ld3DUcbyUevKTsVLYnYMCUW4EZXioLoCscdVg6Ztodetnf3TSmS/6INKeFqJJ3MOncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFnQouIESrmapN08yQxgx94zAzTBjXLbs1ysBJcfRgY=;
 b=voOKfXcapDRRKTFvNy06TtV4NXlSMnA3ZWs5VKiTRBBwfPajIli1K3NFVkmySUYYiqpAMidLACh5sDIaLN0IS6hZI/Pqjf9CP+YKkQUgVdmL8mQ4KDGLpH23+Ek2sbhWPDCGSTJy+xehWE1yGKO+OlSCpBvFzPL95FowR6sDCRw+gkrnVDoeclfL06gR061XECNAU9HyUdC3qXQuM5QoYpn5Dtvc87OaqyjdLJIK5XnIqROkQn6HRHED3TOVURKCp3XKO06gMgHE8jHW5yT+2K9D8t/4YZNc3xUr5+1WQW0RoPqorvm9vm8YRTD3gpcYc2S5ZBrW1J64sYcO7LX1Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFnQouIESrmapN08yQxgx94zAzTBjXLbs1ysBJcfRgY=;
 b=CFspYoFdLPWYouI5J7O8X7ds+S1ryRHMgrbrA9m/yujBe6Zb4mvpxD+EzVUDk7Am00kz6aoenVGGgGpJaJm8LhxtYfYyN1OdoWGIfGOW88GG0VpTFJqDe9HaM/Eq/zEE4229vZrvKoGxeVYzyPk2DUsda9hp2oWGwhA63RA0sBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by PH8PR12MB8431.namprd12.prod.outlook.com (2603:10b6:510:25a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 16 Jul
 2025 07:54:19 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%4]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 07:54:06 +0000
Message-ID: <84c5780d-e633-4b16-b62e-d78f058f869a@amd.com>
Date: Wed, 16 Jul 2025 13:23:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/amdgpu: Reset the clear flag in buddy during
 resume
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250716074127.240091-1-Arunpravin.PaneerSelvam@amd.com>
 <20250716074127.240091-2-Arunpravin.PaneerSelvam@amd.com>
 <78151115-2003-4adf-afa5-5e41667ee658@amd.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <78151115-2003-4adf-afa5-5e41667ee658@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0100.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:278::10) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|PH8PR12MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 50788455-1e58-40cb-1099-08ddc43df014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWI0UkNjZ24wdWw1c3Z3bTdka2MwdGFBODFZU2E0V3ZmdzZXN1hUUS9KRE1S?=
 =?utf-8?B?blpReFVqSWl6TDlXaUkzV2lVUnVxNUlqYXNvM1VkSkU3OXNHODNDT1lCUUd5?=
 =?utf-8?B?c0l0RXNURU1wd3BDWE5jaHlIcUQ3ZGdmRlNmYytCdFVZY2poeWlaVDdBaXhU?=
 =?utf-8?B?emZiMDFVRzUwNDExOVZhMnc3TWJVaUFjWW9MK0JrU1hWdUxoYzhBT3M1a3RV?=
 =?utf-8?B?bEhGRHlKNngwbTl5WCt5YVk2MnlrNEJQV2lUUnpUNS95KzRoTUZ4UUEvcnRq?=
 =?utf-8?B?N2lTN1M2Mll4N2U1QzFiS1FhTkZiWStNUTNmUEljTXUwV0JCL3FrZGRrZGNP?=
 =?utf-8?B?azJ6cDZHUEdaN2lNaGdiSXNIM0pqQ2ZoclRpV2J6WitvS3Z6VXhVeHN5S1Np?=
 =?utf-8?B?OTlqbG0vSFc0Z0REUWxaN2hBYmFMM3VkMjc5VWttYnF2enVwNDB4aVppTlor?=
 =?utf-8?B?c2RTRlNxQVZJbll0R0FVUlFlYlkzT1JDL1FMcEk0L0l3UXdCeVFQaG9Icms1?=
 =?utf-8?B?dVJsWDhtVC84aGpRT1I3K3oyYkJxSktQMjlkVyt3YXpjZTZibDlyUmtKZzZW?=
 =?utf-8?B?MVVVNUVzSXVsWERsVlFSb1FEZDJlOS84Lzltd1dnTk9KVERvS3YzWHpNcmJk?=
 =?utf-8?B?T01DSldLQnVsTEozdkcyVmNyaEh1TitSSkRSdm52UEw2SiticFEzblpkSVRD?=
 =?utf-8?B?UEN3UkxyZDZLTGlSSlBQdGk3SzRpejRvR2RMaDN4Z2ZhOGM0TEFVMEVTcTJH?=
 =?utf-8?B?cFVmWmJRR3JqZjE0bjd5TFl0eXh3TzhBMU9uNkh3UGgyR3duRjRWNHJjUVFs?=
 =?utf-8?B?UDQwVlJmTUJiNUFvS3NqcWFpWDhlN3JlM3VoczVvYUZRRFY0dGhVcDZ5N2ov?=
 =?utf-8?B?aTM0RVVqL2ZLdGxxdTJqdFdxYm1uUHN3QlVmQ0JaMnBlSll4Um9HdlB3WUo3?=
 =?utf-8?B?YkplbHVhbXY1dG54WUkzakdCUnZBY1VZSzVoM08rM0VBQjNtaVhZTi8rVkl3?=
 =?utf-8?B?NzVGS0JrNGd1SkNjaitDaEZHcWY4SnAxNkhTOW5UMXg3MWVkT3dGNTdsRWlH?=
 =?utf-8?B?Zk9jZ3NkcW5iWlZYTi85MEc5dE1UeUR1UWZDeE5ObTdxS3JKRzNBUS81RGdL?=
 =?utf-8?B?R3ZiWmppZ241bHN0SGJvcFV2cGNiYXJNelRxTUIxTDl1UlZlbGhYSUYxWlBu?=
 =?utf-8?B?TG9BTnVBditES3F0UkVuVHV5OUF5ZEJCdVdyREtNSVFVU0w1SXRMZTdXTTJt?=
 =?utf-8?B?dEhGbm9pUkNPUjZrV21UcjdqOHZ4NWdaQ1JQeDFYREdCNUh6MWd6L25KMDlM?=
 =?utf-8?B?ZEZFemU2RjdPRWxxQzJPSi9TSDJFNnQvcVArckhBallmVnVWRzk1b2RPU0JF?=
 =?utf-8?B?TjBET01GMVVBbGp4c3N1MG42VjJ5dFUrZ0g5amRTRTEzbTdrVVJQSWVlMkJj?=
 =?utf-8?B?R1hhOTRDWStmQkRaaTd0amZVUENOSE1QS3NUa1VyaEpvZDRJYzlaRFNEaXFB?=
 =?utf-8?B?L3lPelZlaCt4ZmxPZUpuVU5GM1hqUUsrbmt2bUtBWTVFd05DQ3JqNUUrS0tC?=
 =?utf-8?B?MFNOR3VLRVRpVlU4VkJ3aG5NdU1FRWRHcVlkaDJvaFdEVVNNcDg5Nk5IRVA2?=
 =?utf-8?B?djBlWWo5R3lGNE5HamJXVHNVU1NUWEhCOUJEZVNtaTVMV0s0bncwZDFMbU1S?=
 =?utf-8?B?cVpMSXNSM2libDZyeFdQdmVhYU5VVmdkbkNDZm01UC83Qlh0Y2VIY3U0ZzFk?=
 =?utf-8?B?Smw4bnUwTWxNSGQxYWIyaE0zUXFoMTlkK0M4eHp0NUszaHlZRlRoVU1ZcDdF?=
 =?utf-8?Q?bs7sDxDz6BY2hOmn20vHsklJPWXvKUD/XYD6c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUNvSGM5UkNNajFHbkNMMnZnTlNTc1hrYzZ4VHI1WXFob1ljZkhyTHg3anRu?=
 =?utf-8?B?a1M0Q2xueEErQWVYWjA2N0JPTDkyUkw2cGliaUo0Z251elNVMERDN1lGSEl3?=
 =?utf-8?B?Kzg0a3pmSHBzN0ltUG90K2xPdzdVNTBBNm1mWXdqL21jZlY4cXZ1OER3L0wz?=
 =?utf-8?B?Qk5GV0IrUnd6R2liMUIxMGE2bjFSSmFNZm5XNEJhUU1DTDdldUJneHBHTjA2?=
 =?utf-8?B?VE5ERnNHS0EwaklKSnNyeFVDUktvWTcvUnovaDZ3ZTFkeXFWYnN0SEZaNHBO?=
 =?utf-8?B?ZWN4WTBieC9TZ3RqbmpLb25zUG9jZ044Z1hTSW9mVkZRTXFRNU1QMkU1MDVF?=
 =?utf-8?B?YjU4WDFYN1JPYlVWM2VKVDFYYUFWckp5TFRqOGhGMFZjVDgwTkxvanhZcDhH?=
 =?utf-8?B?NURDWm9MUFFQa3ZxNWE2U1JkS2pETSt1Qll2ZkdCWFVPTVlQazVlMDByUFkw?=
 =?utf-8?B?TFQvcEhsZTVaV3VMRFRzUW1ZK2FoeGpIc1RqdEwxNXBFU3Z3R01ub2IvNzhn?=
 =?utf-8?B?NlR3YjR5OUtWZ0hmalMxMkloMFB5TWRIZFhLS1EwYzArNnVORG1WR3ZWdjc4?=
 =?utf-8?B?eHRQTyt2b3lxa09JTGM5YmdVVDNIN1RObnc3S2pSTE4zR3lveTQwOXhuRWtZ?=
 =?utf-8?B?MU44aWttT01IdzFGQkpqam1vMTFDWm1EeS9hbFg3MHZJSjliMFI3RWxIMnV1?=
 =?utf-8?B?bjY1MnNPeUNIdno0ME1Naytpem5tZUFiMTQ0eHRVbzJibzBUR2NMVWhJUjRD?=
 =?utf-8?B?aWZTRWQ0VjJIQlpPMkRJRzJCcE9VYm1pVWJTMlRUQk9pR3IyVFFRZDZBL2ZU?=
 =?utf-8?B?a2tyRElrMEVhcEhDVzEwc29XUGQxeEMvS3ZPTFEwUjJCMno3UXhHeVVjQThW?=
 =?utf-8?B?bHJoOVF1OXZ5TnZBcnJFK0xZWmQxbkVtL2xBdU1yUVdwOWdIZ2FCNlNnWlFi?=
 =?utf-8?B?VXA0bmVwa1NvaDk1RE1kb1VmVEF1QjRPRTRQM0xzbkhSUWIzT2FnUXBxZ2Vq?=
 =?utf-8?B?NWt3eEw5NjVXUzJmWXQyRk80eHdRWEpoVmR2ZEMvdjF3b2M1eHhnUVI1YUNB?=
 =?utf-8?B?T1A4ZWgwQXpBVW1MSENuVFpaQ2x5TFZqRTd1bURSdnBvbXBGVG50Wk1wcEQ1?=
 =?utf-8?B?YjBUZitxbXAyb3prUEdGdS9NM0tGWXlFZWNadkVTQ1JMQjZ2MU9OOEtyOUNQ?=
 =?utf-8?B?MGJyVlM0U295QnIramZ2bUxiTnl3MjdTbG1WczJKYmxFOWdWRlFDaTh6MXJQ?=
 =?utf-8?B?NC9adjJENm1Ndm9veFNQUHJuQk1XQzAyUmFNbUxvRjdnVG5jQ2d2SG4ybEJh?=
 =?utf-8?B?a2pBK0lIUTZzWWd0WTZtdUFSZGJZK3dOdnlVcHdZV2oxZ0ptR2dUbVJ0MTZh?=
 =?utf-8?B?c0ZtTjlxdTQyeVB3Wmh0VnVOZksxbklmM1RDYmxicjdHaU43K2pzMnYzR1RN?=
 =?utf-8?B?NkIyT1hxYndsMVllTks2UzA3bDJ4djVGa2dWVmQ3cXVjZjIyMWNjZVBQcy9P?=
 =?utf-8?B?OEkwZlk3WlBscEUxVWZSQ3ZySm94T2lIQytFcjJ0S29mTldIeFcvQk9FK21z?=
 =?utf-8?B?QU1vMXB6ZGtKWkRqa2NFdG5iWGlyUGtadDhrOEZENE90aW9ObUFLUFBZeGhw?=
 =?utf-8?B?dTFwc3AyaEZ1cVF1cU1qUE9paytYUGNlUEdrTTRUcktDeUJDb3Q3VUxhdENH?=
 =?utf-8?B?cWtCcXZXOHZRRVFNNkx1Wm1taThaWWVGZ0xpTmN0VTAxWnJkOWsrTnBMaVZO?=
 =?utf-8?B?NnhLaDc0aWFmMFIvWERnak0rV0pybnM1MkFkdEJDY3RZSGJFQVJQaEQ0OUdr?=
 =?utf-8?B?bUtjaTFYd01NN012K000amZPdlB5Um9UZzNBaVpxWUZQaVpyMGNBVm9RaVB0?=
 =?utf-8?B?RE1rckcrYVBWcFljVFZqQUdva2NHNVk0NDdFOEsySlZUUE9Ka3h1T0phejdY?=
 =?utf-8?B?NWhHdlRsWnVlZ1NLL2NXZWtwV0tWSk1UUWl4eC8ydjNqdmJrV0JVY0FyWFBX?=
 =?utf-8?B?ZXZiRDZoS24reGN3RjV4a3gveTVoL2VLSzd0VUZyNTZncTcyTG4wdHVzQ3k3?=
 =?utf-8?B?ZHlzU2I1cVhseEdiU1JPNjZlUWMrNDRLQ2FKS05wSDdHT2dWOTNQZVBDelkz?=
 =?utf-8?Q?xXopZSdgOl04fYopMp+bDSCIu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50788455-1e58-40cb-1099-08ddc43df014
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 07:54:06.0394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1i39dHQMWqQ5c7pruoyDWDff36NaV0kfHkZ+YPwUPCze+6NWOCEev8QnXLFpFj53t3RX1bBhR0eQMWaTYV5gLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8431
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


On 7/16/2025 1:21 PM, Christian König wrote:
> On 16.07.25 09:41, Arunpravin Paneer Selvam wrote:
>> - Added a handler in DRM buddy manager to reset the cleared
>>    flag for the blocks in the freelist.
>>
>> - This is necessary because, upon resuming, the VRAM becomes
>>    cluttered with BIOS data, yet the VRAM backend manager
>>    believes that everything has been cleared.
>>
>> v2:
>>    - Add lock before accessing drm_buddy_clear_reset_blocks()(Matthew Auld)
>>    - Force merge the two dirty blocks.(Matthew Auld)
>>    - Add a new unit test case for this issue.(Matthew Auld)
>>    - Having this function being able to flip the state either way would be
>>      good. (Matthew Brost)
>>
>> v3(Matthew Auld):
>>    - Do merge step first to avoid the use of extra reset flag.
> You've lost me with that :)

Just realized after sending this mail. Added in v5 :)

Thank you,

Arun.

>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: stable@vger.kernel.org
>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
> Acked-by: Christian König <christian.koenig@amd.com>
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++
>>   drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++
>>   include/drm/drm_buddy.h                      |  2 +
>>   5 files changed, 65 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 723ab95d8c48..ac92220f9fc3 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -5327,6 +5327,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>>   		dev->dev->power.disable_depth--;
>>   #endif
>>   	}
>> +
>> +	amdgpu_vram_mgr_clear_reset_blocks(adev);
>>   	adev->in_suspend = false;
>>   
>>   	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> index 215c198e4aff..2309df3f68a9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>> @@ -155,6 +155,7 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>>   				  uint64_t start, uint64_t size);
>>   int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>>   				      uint64_t start);
>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
>>   
>>   bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>>   			    struct ttm_resource *res);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index abdc52b0895a..07c936e90d8e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
>>   	return atomic64_read(&mgr->vis_usage);
>>   }
>>   
>> +/**
>> + * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
>> + *
>> + * @adev: amdgpu device pointer
>> + *
>> + * Reset the cleared drm buddy blocks.
>> + */
>> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
>> +{
>> +	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>> +	struct drm_buddy *mm = &mgr->mm;
>> +
>> +	mutex_lock(&mgr->lock);
>> +	drm_buddy_reset_clear(mm, false);
>> +	mutex_unlock(&mgr->lock);
>> +}
>> +
>>   /**
>>    * amdgpu_vram_mgr_intersects - test each drm buddy block for intersection
>>    *
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index a1e652b7631d..a94061f373de 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -405,6 +405,49 @@ drm_get_buddy(struct drm_buddy_block *block)
>>   }
>>   EXPORT_SYMBOL(drm_get_buddy);
>>   
>> +/**
>> + * drm_buddy_reset_clear - reset blocks clear state
>> + *
>> + * @mm: DRM buddy manager
>> + * @is_clear: blocks clear state
>> + *
>> + * Reset the clear state based on @is_clear value for each block
>> + * in the freelist.
>> + */
>> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>> +{
>> +	u64 root_size, size, start;
>> +	unsigned int order;
>> +	int i;
>> +
>> +	size = mm->size;
>> +	for (i = 0; i < mm->n_roots; ++i) {
>> +		order = ilog2(size) - ilog2(mm->chunk_size);
>> +		start = drm_buddy_block_offset(mm->roots[i]);
>> +		__force_merge(mm, start, start + size, order);
>> +
>> +		root_size = mm->chunk_size << order;
>> +		size -= root_size;
>> +	}
>> +
>> +	for (i = 0; i <= mm->max_order; ++i) {
>> +		struct drm_buddy_block *block;
>> +
>> +		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
>> +			if (is_clear != drm_buddy_block_is_clear(block)) {
>> +				if (is_clear) {
>> +					mark_cleared(block);
>> +					mm->clear_avail += drm_buddy_block_size(mm, block);
>> +				} else {
>> +					clear_reset(block);
>> +					mm->clear_avail -= drm_buddy_block_size(mm, block);
>> +				}
>> +			}
>> +		}
>> +	}
>> +}
>> +EXPORT_SYMBOL(drm_buddy_reset_clear);
>> +
>>   /**
>>    * drm_buddy_free_block - free a block
>>    *
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 9689a7c5dd36..513837632b7d 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>   			 u64 new_size,
>>   			 struct list_head *blocks);
>>   
>> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear);
>> +
>>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>>   
>>   void drm_buddy_free_list(struct drm_buddy *mm,
