Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 496BDAB8100
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 10:41:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F5A10E7C6;
	Thu, 15 May 2025 08:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="f9sm192Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2D710E7C6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 08:41:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M5xeI5ZuhKt83vTw8n31J94IxIx64/FVnGB4ZYqnsar2fZF0/+UfhX1bu76novAkeA7J4PiEbsQU7bOMzo0EfizeSX20GjrhbQAk/+rCIepwYdKrL1jGyqyUy0lDRHe7yrgWve9y3AaKndMzz9sGeQWF6iNpGOb+yo+GxKnPnoa0wWXBCe4sL/YqeaBIn5BItVza9me4W2kE7psseK980G1Zpc1DYuObChgdXo0uGnCXVbV7Ke9JqpPhlh6rXGb+PKv7GAhAoNkS+GMUu6KKe3dEsq7Z3KozQDiv5Q1sQzsB3FzVKJCuMjUnZKFj5AjYl9qJMUAEa6LAknR5mh5CFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05FkIe7WEb+6QFrV46DfAM0eBjK2sfYDzVYpPhYbaHY=;
 b=k+Blmx5UhsXGmd4RbcDr6lWSwb/pOkeJzfmtZqK6dW4sMD3PnFg+vNdDCSto/QiF16xRWzeqnWjOxEpHn2WCrraMPWisnWXTSzhcoWGIuKT4rBf2pWPS3zotuNyie6dtIZG4Epcm1w9vmyomnw8jW48c/4zgQBsue+O5fbVYhBrApDtHI9pCY4Gixt637Icld1K8TQXXa6/xvpFtQmunrarnfZlq2pHCk09E0Q9cuEQJKdwNAzQLQdNv6fpCfJUePzfxUuilTId1GRW7jt+h+9jzFBkNiHOr9TC/wUEAMBBkxr/RqIIz7iNRIX2Ukl3VN3a9PyTiq7oF1WQqWBJQtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05FkIe7WEb+6QFrV46DfAM0eBjK2sfYDzVYpPhYbaHY=;
 b=f9sm192YN9pPkmnvegXZUDK8cuOSoxw9+sOSOuvIg6djkWOK94eLtANP00A22bM7nMGI1M3WbWrMuWM2XJQKEKI3Ot9zo80VdJoF0zqH5aAd5GivTdokoypdoLFvvMRF5D/0Z48LTZZg/9RrXbfoN+nExERowSwsR7ocmfcQVyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 08:40:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 08:40:58 +0000
Message-ID: <f75bb69b-f5f5-4edb-86d5-792517fc6d3f@amd.com>
Date: Thu, 15 May 2025 10:40:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [5/7] ttm: add initial memcg integration. (v4)
To: Maarten Lankhorst <dev@lankhorst.se>, Dave Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, tj@kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250512061913.3522902-6-airlied@gmail.com>
 <ea70e6fa-22a1-4adc-927a-5e9c2563f784@lankhorst.se>
 <6a41fa3e-6ca7-4791-b491-4908971275a5@amd.com>
 <7a070692-c6e6-4dfa-aae8-5155988ca3eb@lankhorst.se>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7a070692-c6e6-4dfa-aae8-5155988ca3eb@lankhorst.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 1862d76c-884d-4cec-7325-08dd938c3734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFROaWhSOExsRDhNNlEwOVkyNFdidnN5TnNQSGI0MzNHbGh5c1FsU1dlM1RV?=
 =?utf-8?B?YnMzeUIrTHpGSm40WlZVU25DNDBDODRuMFdsdExWdW9YTHlYU2hXTlhXeE1x?=
 =?utf-8?B?cng2TE5HL2hQT3Z5OE9CMjhKc3ZzNXBLWENKQms3UngybktySjJOMlJxNHZ2?=
 =?utf-8?B?WnROS1FsSEU3eWhsVW9nMFpEdTJlRGJXV1V5SGkvUktPTFN5eG1LRzIvRllu?=
 =?utf-8?B?NWtHVUc1WXNjTG1jTWFDdFhTWnhDUFZBK0Z6aUxDdWpzMkxMWjdKVS94ZWwz?=
 =?utf-8?B?YVBBUGlRSTVIbUlkSzQ0Z00rSSttSldmVUxZdGZ5bWJwaW12cnNObDJJa3Uw?=
 =?utf-8?B?bFJFZGdod0xKOVhKNVZqaUJqbUpUdVJ2NHF4VXpkanBIWlJrTWRJVGdqR2lp?=
 =?utf-8?B?KzRRbkpYc1EvcEJEVlR2aC96dkZNbHJlcTYybGRLU1BYWFdTSG8zbHNkdXcr?=
 =?utf-8?B?b3ZtWkM2ZXB4cGhERWx6blc4Q0MwMjNTTWcxNlRwNnFNV0ZhMS9qSEt3MlBP?=
 =?utf-8?B?UlV0ZENiazlyUk5rUGcybHh3bmsvbWNLbGgvWDZNSGhYM3hVa3pXdlFVNmZu?=
 =?utf-8?B?Ry9ucVFlK2xxNTRSMEQ2TkgwNWhlajF5STBYcTNOVnlFRkwzb1hMUlBxVXdS?=
 =?utf-8?B?bS9Ma1Rqa3dJZUtTdDhvZXBUZXhvS2R6S2F1MmtiRGg4MTViT2xLaXF5MWR6?=
 =?utf-8?B?dVZCYXFiUHJvRGQ3bzg2NEQ3bk1UbnhGbEw3VjgydnpYNlNjMkY5czVhenJC?=
 =?utf-8?B?aFNzQ0xlZ0pJQ1lmd0wrdXdYODMxU3oxRWlLbU0wMHBwL3pwa21qOURUUlZL?=
 =?utf-8?B?SnY3MWhPbHVjUGFYZG1lSzZwRnBvK1NXM0dtTWhFejhvRzVWTEVub083Uk1N?=
 =?utf-8?B?Ny9VZllpVkIzYWRoMlNJZ2NmYWxob21kUGFGQ3hlaHZrRDNiQVVEbzNGaFZn?=
 =?utf-8?B?R2dFNmt1QVBxM1JqS3J3aGpBUjB5ekV5K3BzQmRCS1pKNTlaaUs1blJuY3Z3?=
 =?utf-8?B?RC96SVpPTVQybWNGdFBkaEVpVDdrS0Q5TW5FSG10VDZ0MitBUUd4UFpMWnZ3?=
 =?utf-8?B?TkdLaTd1YXVSajhNRHhoVHVQU0FpWjgxME1peDlvc2pJSk5iNU5CWnhDMjlv?=
 =?utf-8?B?a2Mzbng1akRFdXl4WTYwY1hQeDdkUXF6R3EvejRjd25lTCtiaWFqcVlVc21s?=
 =?utf-8?B?R1JQaUwvQnluU280TFZaWmhKVUZzQkFIL1kxQ1F2UXV3RDVZNXgwbHlveUNs?=
 =?utf-8?B?eTNPMFpYTlNZNlM5eDZRamc4OENSWGVBNHpxeTE0VEg3L09VeU1oS0piWDlw?=
 =?utf-8?B?T2syYWJBVExwczNTaEJsNUNKRmtUZ3N0NUNzekdyTE1VQXJYdnBMR2d4TDFV?=
 =?utf-8?B?UGdlR0F2MWs5YUNFM055VWVsU0tQQmxnOUxVb0V1V28weWNGcGIzZm1iUlVQ?=
 =?utf-8?B?bFVWMHpRNS94MkJWajdNNU5EYjZhb0pISVVudkMxRnkyd29WQWE3Ny8weWZZ?=
 =?utf-8?B?N3J2b1ZKMDRYSWVQQmxMTzhvbDN6NHFUa25YalorRTNicW5NQzY0N01pTjZJ?=
 =?utf-8?B?ZU16bFNBRUNYK0ZFYk5TeHUyc1ZmT01xZHNMU1NNdmN5UE9FQWNpSllSUlVq?=
 =?utf-8?B?cDZqNDJGV3FFQW9wZkNmTE1nRXhZRGtwcHhML2w4QkQ2UHhaSDRJWFJNeFRM?=
 =?utf-8?B?SVZZM1pZMDJZSDhWYnRUYlBOcFdSM1ZrcUNPaVVxekRFOHUwRitNMzNQN0RV?=
 =?utf-8?B?WlJKV28zTGo1cEZ2TE9HVkxWQmFvd2lSQmNlYXAxY1VjcStreENpdGoyanlL?=
 =?utf-8?B?eXdZYXlNY3N5YmROdHRxenRlWmlqNXB2NGJEVVgvNjd6eVpxQ1hReEhyTCtQ?=
 =?utf-8?B?QUFzTTFUMm5tZ1d5Qm13NHUwVG9BQksxZzdlV1F3ajRiMElVbjl6YTdmUjVI?=
 =?utf-8?Q?i3CDnpfTEE4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STYvNG04RG1FVzZDY080Z3dwZ0kzNkd4MVlxemRPK3BaSGlmcVJIb0QvZDMv?=
 =?utf-8?B?NDUzSFd1Ylc1Q2FpNElVY1kzTUhYN0lSbk1pWGhISWlpdHpBMysvQ3Bsc0tK?=
 =?utf-8?B?d0JGT0ZsdnRTZzFhb3JCZVNEMElJd24yTEdsMGhBYWtoMEJONTBwbGhQQ1Y1?=
 =?utf-8?B?dFBLVE1SUUNHYVg1ZjBkUW02Nm5lRnhvTERaSkluMjdPZUR2UHhxNU1MS0xw?=
 =?utf-8?B?M3llUVZjWHJwWk15T2Z6TzVuNjI1dzUycEx5aTM5WDk1ZDlxY3JNRG14RnYz?=
 =?utf-8?B?YkhPTDErbTBYNEd4U0JXOWI4K001OUV1MUtQTGFoT3E4TzROaXR1RUF0MVVi?=
 =?utf-8?B?dXdFMmZmRGJNZmVpcnoxaDJJbnRXa2Nhalc0TmIyOERLd3dsZ1dUZzNqczN3?=
 =?utf-8?B?NDF4MGpUNXYwcXpyaGlRaUhhRCtqdEE0WVhoczJyRnRrNlhYTUVpSG5lZ1kw?=
 =?utf-8?B?Zm51bks5Y2xOemE1blZxWFNGeCsyQ1E2SUtTa2VtZUZrclZyTnVNbnpCbXNv?=
 =?utf-8?B?YU1RYndiV2k4UmNOdFl4eFFFRkpYU1ZGSk5rdjlyY081WkVUUXNaY0xBTzFS?=
 =?utf-8?B?eUxjWVRzOStzaGtWZ1IxNHp4MkNEeTEyZ0VBTERsWTVnVTI4WjJMOUJZVkR0?=
 =?utf-8?B?ZDRYU2tMNDdPQTgyNjFXSXFDYUs4bkhrZmpVK1B6SXhMSmF4cmZnTk92M2ZK?=
 =?utf-8?B?QTRRMmloS1oxeTJhemluelZqa0xsdWlsZGlpQ05aQlQ5bndrWGdGQnNmSjlu?=
 =?utf-8?B?eVIwVEVnY1pBN2FGZmtlSXkvQmx1cE51RGFwTTZON2VsejFTTGl1T3JkckJt?=
 =?utf-8?B?RzRENm5XQnVHZGZkOG83RnZoVERkY1c3NmhkZVU5ekU4V1VuY1JiSjdtUFNv?=
 =?utf-8?B?c1RtcjBZcEJ2ZDdmWmpIZ1FXUkxoVklxekpzakFzYlBvSTVVVGtRTWhtQzlG?=
 =?utf-8?B?OVNMYmYzVENGd1FwNko5MzRsbktZZCtFZnN0M1I0Q3Y5Tm8ybGdpYXN3L1o4?=
 =?utf-8?B?dVlsZGduZU1JdXErZ1lQZStrZjJYVTR5Q2gvUHYxMkphUDdzT3llNy9mV3VD?=
 =?utf-8?B?Y1Q1NnpaQkdkN2d5ZFR4NzJjS1ZBWXlKSmVsbTNHSGREWHd3b3lmUnFaOUtm?=
 =?utf-8?B?ejBnbHptVUdNY1d4eE1NSG9SQTJLNzVXSFhJMGZWTlBOSDF5Qkd6V2pzaFRE?=
 =?utf-8?B?UDA2RkUxdDFjeUsxQzM3d2xWUWdvRGkxQTlQUDhqWG5QQzd3VzlrcFZ0MXdl?=
 =?utf-8?B?TjRPeWt3OHErVWc0Y2VwdkptUlBKS3RFRERqbXZCR0JhTXlxaHZrcU16U1NK?=
 =?utf-8?B?ZUUxODRhZW53QmlPZ0pnWnNySHBYK3djV2R4eGYvY0RjcTNSNXM5bmo1RTVo?=
 =?utf-8?B?eE5ubm1Na29wejZvdHZvMkN1QUZXMG9YSkJOeWFReVhsVlZ4aERMS21OV1d3?=
 =?utf-8?B?WmxzaUZhdHNzQjRBRWQ2ZW1lU0lPeWFkczZUbTNCdndIT082cjY0TDRZWTFG?=
 =?utf-8?B?NnVVcHBFZWxJeGsrOFVaOU14S1lwTS9NdTQ2WFNKdkZtc0dva1I0NWpKN2xo?=
 =?utf-8?B?eGlCWmRNOTRxOXJGWGxxajBMclhIZnBvT0xvaHNhejJqUmNJc3pVSjFPdzFH?=
 =?utf-8?B?c0hoblJsTzBORENTV1BUOUJnT29YQzdGaHpoY21Kc0Fqa055TmMxdDRwaENG?=
 =?utf-8?B?bURhZzdMVFFyRGVhQWpONkxNR1dRSmNNV3hNSWcrR3BCVllYQmh4dHQyUUwy?=
 =?utf-8?B?Q1NodXgyTjkwclAzN3JtejFQeUtadTRGMDZCUXhxY3ErQ0ZLNjFxZ2t2Q081?=
 =?utf-8?B?RUlQNHZCRGEwSnJZTVY3QTQ0V3RBSDdKalRaRURtcU9QV3lrRFRuWXg4Y3FL?=
 =?utf-8?B?S29pcXhkMk5FcXdxVHB3L2E3TCtpR0R2by9DYzBURitRQXE3REZwa1FxQzZ6?=
 =?utf-8?B?U3hMcTAvWjBCKytSTkdrUnV4WlQ1U2VtM0E4K2FBUWpzUVRkK0FudzhBbG4x?=
 =?utf-8?B?T01hNDNuVHdobm1SMWRZVVJNSTJpSHJWMGM2ck1IRVh1cE5iaGNrK3ZHd1F6?=
 =?utf-8?B?c25INWk2Z2kybnZXei9XUGNlcHZCMXZMS3Q2Y1pmSm0wTnJ4RWJJcUNBTlBq?=
 =?utf-8?Q?3sN0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1862d76c-884d-4cec-7325-08dd938c3734
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 08:40:58.8695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFMJUhGFzaPqQ3TmCtNXsmExhrBpBBJN33hofMWScIcSDPOl9GvB4zWT2d8vY0Bg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
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

On 5/14/25 19:07, Maarten Lankhorst wrote:
> Hey,
> 
> On 2025-05-14 13:55, Christian König wrote:
>> On 5/14/25 13:41, Maarten Lankhorst wrote:
>>> Hi Dave,
>>>
>>> We've had a small discussion on irc, so I wanted to summarize it here:
>>>
>>> All memory allocated should be accounted, even memory that is being
>>> evicted from VRAM.
>>
>> That sounds like a really bad idea to me.
>>
>>> This may cause the process that originally allocated
>>> the VRAM to go over the memcg limit, that should be solved by invoking
>>> OOM condition on the original process, which may have ways to solve it
>>> like purging purgeable memory, or as last resort OOM killing.
>>
>> You are basically suggesting to kill an application for something it never requested in the first place.
>>
>> In other words when an application requested a buffer to be placed in VRAM we can't make it responsible that the buffer had to be moved to system memory because of over allocation.
>>
>> As far as I can see and have discussed with others so far this approach is a clear no-go.
> There is absolutely no need to kill an application. You can set dmem limits in such a way that a buffer will never be evicted.
> Killing would be an absolute last resort, and only happens when maximum amount of memory is set.

Yeah, exactly that doesn't work. You kind of must kill it at that moment because you don't have any other chance to signal that this cgroup is OOM.

In other words when you have a cenario like application A causes eviction, application B is the victiom of that eviction who do you charge the system memory needed for the eviction to?

Application A caused the eviction but never asked for system memory in the first place. So letting that allocation fail because of some other application is OOM would result in basically not reproducible behavior.

Application B is now owning that memory, but you can only send a SIGKILL to that application and not an ENOMEM because it is currently not doing anything.

T.J. suggested that we charge but don't enforce a limit for application B. I would say that this is kind of ok for now until we have found a better solution, but it is clearly not the end of the story.

> Alternatively we could count memory in VRAM similar to swapped out memory, since it's just another placement of allocated memory. :)

Yeah, that idea came to my mind as well. But there're problems with that approach as well.

Regards,
Christian.


> 
>>
>>
>>> The VRAM evicter is already memcg aware, so it should be possible to do
>>> the same for the shrinker. I created a patch to use the same cgroup for
>>> memcg as for dmem, we should probably extract the cgroup from mm->owner,
>>> and create a function to charge dmemcg and memcg with a specified cgroup.
>>>
>>> For applications that use a centralised allocator, it might be needed to
>>> charge a different cgroup when exporting.
>>>
>>> Kind regards,
>>> Maarten
>>>
>>> On 2025-05-12 08:12, Dave Airlie wrote:
>>>> From: Dave Airlie <airlied@redhat.com>
>>>>
>>>> Doing proper integration of TTM system memory allocations with
>>>> memcg is a difficult ask, primarily due to difficulties around
>>>> accounting for evictions properly.
>>>>
>>>> However there are systems where userspace will be allocating
>>>> objects in system memory and they won't be prone to migrating
>>>> or evicting and we should start with at least accounting those.
>>>>
>>>> This adds a memcg group to ttm bo and tt objects.
>>>>
>>>> This memcg is used when:
>>>> a) when a tt is populated (and unpopulated)
>>>> b) the TTM_PL_FLAG_MEMCG is set on the placement for the
>>>> bo when the tt is allocated.
>>>>
>>>> The placement flag is set for all non-eviction placements.
>>>>
>>>> This version moves back from the resource to the tt layer,
>>>> when accounting at the resource layer, if an object is swapped
>>>> out there was no way to remove it from the accounting, whereas
>>>> the tt layer has more info for this.
>>>>
>>>> v4: move back to the tt layer from the resource layer to
>>>> handle swap, but keep the memcg charging hooks for now.
>>>> v3: moves from having a flags on the op ctx to the using a
>>>> placement flag.
>>>> v2: moved the charging up a level and also no longer used
>>>> __GFP_ACCOUNT, or attached the memcg to object pages, it instead
>>>> uses the same approach as socket memory and just charges/uncharges
>>>> at the object level. This was suggested by Christian.
>>>>
>>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>>>> ---
>>>>  drivers/gpu/drm/ttm/ttm_bo.c      |  6 ++++--
>>>>  drivers/gpu/drm/ttm/ttm_bo_util.c |  6 +++---
>>>>  drivers/gpu/drm/ttm/ttm_bo_vm.c   |  4 +++-
>>>>  drivers/gpu/drm/ttm/ttm_tt.c      | 17 ++++++++++++++++-
>>>>  include/drm/ttm/ttm_bo.h          |  7 +++++++
>>>>  include/drm/ttm/ttm_placement.h   |  3 +++
>>>>  include/drm/ttm/ttm_tt.h          |  9 ++++++++-
>>>>  7 files changed, 44 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> index 5bf3c969907c..1630ef28e5a8 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>> @@ -140,7 +140,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>>>>  			goto out_err;
>>>>  
>>>>  		if (mem->mem_type != TTM_PL_SYSTEM) {
>>>> -			ret = ttm_bo_populate(bo, ctx);
>>>> +			ret = ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, ctx);
>>>>  			if (ret)
>>>>  				goto out_err;
>>>>  		}
>>>> @@ -1237,6 +1237,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>>>>  /**
>>>>   * ttm_bo_populate() - Ensure that a buffer object has backing pages
>>>>   * @bo: The buffer object
>>>> + * @memcg_account: account this memory with memcg if needed
>>>>   * @ctx: The ttm_operation_ctx governing the operation.
>>>>   *
>>>>   * For buffer objects in a memory type whose manager uses
>>>> @@ -1250,6 +1251,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>>>>   * is set to true.
>>>>   */
>>>>  int ttm_bo_populate(struct ttm_buffer_object *bo,
>>>> +		    bool memcg_account,
>>>>  		    struct ttm_operation_ctx *ctx)
>>>>  {
>>>>  	struct ttm_tt *tt = bo->ttm;
>>>> @@ -1262,7 +1264,7 @@ int ttm_bo_populate(struct ttm_buffer_object *bo,
>>>>  		return 0;
>>>>  
>>>>  	swapped = ttm_tt_is_swapped(tt);
>>>> -	ret = ttm_tt_populate(bo->bdev, tt, ctx);
>>>> +	ret = ttm_tt_populate(bo->bdev, tt, memcg_account, ctx);
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> index 15cab9bda17f..7d599d0707e4 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> @@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>>>>  	src_man = ttm_manager_type(bdev, src_mem->mem_type);
>>>>  	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
>>>>  		    dst_man->use_tt)) {
>>>> -		ret = ttm_bo_populate(bo, ctx);
>>>> +		ret = ttm_bo_populate(bo, dst_mem->placement & TTM_PL_FLAG_MEMCG, ctx);
>>>>  		if (ret)
>>>>  			return ret;
>>>>  	}
>>>> @@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct ttm_buffer_object *bo,
>>>>  
>>>>  	BUG_ON(!ttm);
>>>>  
>>>> -	ret = ttm_bo_populate(bo, &ctx);
>>>> +	ret = ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, &ctx);
>>>>  	if (ret)
>>>>  		return ret;
>>>>  
>>>> @@ -507,7 +507,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct iosys_map *map)
>>>>  		pgprot_t prot;
>>>>  		void *vaddr;
>>>>  
>>>> -		ret = ttm_bo_populate(bo, &ctx);
>>>> +		ret = ttm_bo_populate(bo, mem->placement & TTM_PL_FLAG_MEMCG, &ctx);
>>>>  		if (ret)
>>>>  			return ret;
>>>>  
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> index a194db83421d..02aea23a34e7 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>> @@ -224,7 +224,9 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>>  		};
>>>>  
>>>>  		ttm = bo->ttm;
>>>> -		err = ttm_bo_populate(bo, &ctx);
>>>> +		err = ttm_bo_populate(bo,
>>>> +				      bo->resource->placement & TTM_PL_FLAG_MEMCG,
>>>> +				      &ctx);
>>>>  		if (err) {
>>>>  			if (err == -EINTR || err == -ERESTARTSYS ||
>>>>  			    err == -EAGAIN)
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>>>> index 698cd4bf5e46..81c4cbbeb130 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>>> @@ -161,6 +161,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>>>  	ttm->caching = caching;
>>>>  	ttm->restore = NULL;
>>>>  	ttm->backup = NULL;
>>>> +	ttm->memcg = bo->memcg;
>>>>  }
>>>>  
>>>>  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>>>> @@ -365,7 +366,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>>>>  EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapout);
>>>>  
>>>>  int ttm_tt_populate(struct ttm_device *bdev,
>>>> -		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>>>> +		    struct ttm_tt *ttm,
>>>> +		    bool memcg_account_tt,
>>>> +		    struct ttm_operation_ctx *ctx)
>>>>  {
>>>>  	int ret;
>>>>  
>>>> @@ -376,6 +379,14 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>>  		return 0;
>>>>  
>>>>  	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>>>> +		if (ttm->memcg && memcg_account_tt) {
>>>> +			gfp_t gfp_flags = GFP_USER;
>>>> +			if (ctx->gfp_retry_mayfail)
>>>> +				gfp_flags |= __GFP_RETRY_MAYFAIL;
>>>> +			if (!mem_cgroup_charge_gpu(ttm->memcg, ttm->num_pages, gfp_flags))
>>>> +				return -ENOMEM;
>>>> +			ttm->page_flags |= TTM_TT_FLAG_ACCOUNTED;
>>>> +		}
>>>>  		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>>>>  		if (bdev->pool.use_dma32)
>>>>  			atomic_long_add(ttm->num_pages,
>>>> @@ -437,6 +448,10 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>>>>  		ttm_pool_free(&bdev->pool, ttm);
>>>>  
>>>>  	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>>>> +		if (ttm->page_flags & TTM_TT_FLAG_ACCOUNTED) {
>>>> +			mem_cgroup_uncharge_gpu(ttm->memcg, ttm->num_pages);
>>>> +			ttm->page_flags &= ~TTM_TT_FLAG_ACCOUNTED;
>>>> +		}
>>>>  		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>>>>  		if (bdev->pool.use_dma32)
>>>>  			atomic_long_sub(ttm->num_pages,
>>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>>> index 903cd1030110..d7c0dd9e0746 100644
>>>> --- a/include/drm/ttm/ttm_bo.h
>>>> +++ b/include/drm/ttm/ttm_bo.h
>>>> @@ -135,6 +135,12 @@ struct ttm_buffer_object {
>>>>  	 * reservation lock.
>>>>  	 */
>>>>  	struct sg_table *sg;
>>>> +
>>>> +	/**
>>>> +	 * @memcg: memory cgroup to charge this to if it ends up using system memory.
>>>> +	 * NULL means don't charge.
>>>> +	 */
>>>> +	struct mem_cgroup *memcg;
>>>>  };
>>>>  
>>>>  #define TTM_BO_MAP_IOMEM_MASK 0x80
>>>> @@ -486,6 +492,7 @@ pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct ttm_resource *res,
>>>>  		     pgprot_t tmp);
>>>>  void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>>>>  int ttm_bo_populate(struct ttm_buffer_object *bo,
>>>> +		    bool memcg_account,
>>>>  		    struct ttm_operation_ctx *ctx);
>>>>  
>>>>  /* Driver LRU walk helpers initially targeted for shrinking. */
>>>> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
>>>> index b510a4812609..668798072292 100644
>>>> --- a/include/drm/ttm/ttm_placement.h
>>>> +++ b/include/drm/ttm/ttm_placement.h
>>>> @@ -70,6 +70,9 @@
>>>>  /* Placement is only used during eviction */
>>>>  #define TTM_PL_FLAG_FALLBACK	(1 << 4)
>>>>  
>>>> +/* Placement causes memcg accounting */
>>>> +#define TTM_PL_FLAG_MEMCG	(1 << 5)
>>>> +
>>>>  /**
>>>>   * struct ttm_place
>>>>   *
>>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>>> index 406437ad674b..2790fc82edc3 100644
>>>> --- a/include/drm/ttm/ttm_tt.h
>>>> +++ b/include/drm/ttm/ttm_tt.h
>>>> @@ -90,6 +90,8 @@ struct ttm_tt {
>>>>  	 * TTM_TT_FLAG_BACKED_UP: TTM internal only. This is set if the
>>>>  	 * struct ttm_tt has been (possibly partially) backed up.
>>>>  	 *
>>>> +	 * TTM_TT_FLAG_ACCOUNTED: TTM internal. This tt has been accounted.
>>>> +	 *
>>>>  	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
>>>>  	 * set by TTM after ttm_tt_populate() has successfully returned, and is
>>>>  	 * then unset when TTM calls ttm_tt_unpopulate().
>>>> @@ -101,8 +103,9 @@ struct ttm_tt {
>>>>  #define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
>>>>  #define TTM_TT_FLAG_DECRYPTED		BIT(4)
>>>>  #define TTM_TT_FLAG_BACKED_UP	        BIT(5)
>>>> +#define TTM_TT_FLAG_ACCOUNTED	        BIT(6)
>>>>  
>>>> -#define TTM_TT_FLAG_PRIV_POPULATED	BIT(6)
>>>> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(7)
>>>>  	uint32_t page_flags;
>>>>  	/** @num_pages: Number of pages in the page array. */
>>>>  	uint32_t num_pages;
>>>> @@ -126,6 +129,8 @@ struct ttm_tt {
>>>>  	enum ttm_caching caching;
>>>>  	/** @restore: Partial restoration from backup state. TTM private */
>>>>  	struct ttm_pool_tt_restore *restore;
>>>> +	/** @memcg: Memory cgroup for this TT allocation */
>>>> +	struct mem_cgroup *memcg;
>>>>  };
>>>>  
>>>>  /**
>>>> @@ -245,11 +250,13 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>>>>   *
>>>>   * @bdev: the ttm_device this object belongs to
>>>>   * @ttm: Pointer to the ttm_tt structure
>>>> + * @mem_account_tt: Account this population to the memcg
>>>>   * @ctx: operation context for populating the tt object.
>>>>   *
>>>>   * Calls the driver method to allocate pages for a ttm
>>>>   */
>>>>  int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm,
>>>> +		    bool mem_account_tt,
>>>>  		    struct ttm_operation_ctx *ctx);
>>>>  
>>>>  /**
>>
> 

