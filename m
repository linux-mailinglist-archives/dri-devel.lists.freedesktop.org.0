Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1B2AA710C
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 14:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380AB10E189;
	Fri,  2 May 2025 12:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vuBhRLxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2076.outbound.protection.outlook.com [40.107.212.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5186410E189
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 12:01:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mtu7cfxE8d99/BzZIUE8ukXKFDq5aslecmhsIUhiWK04KWZJdvISiE39wUtDi6uFJUyoGsqA8otsfQZaYEG8gMSwYI7yDjDo2XQhRyclCFKGotSO/rYyZaLG991wWXMq6b9eBKrL5zKHxNK+kM+Ael/L48OEOp5qAR7waQLbrn0OipOvIvSQnGjdtROhEjs8vm4uilqe1G/QuH6FcEMgYug87PlckVjYtT9oo6VMXjv47pGJpCiRuaNTuPywgNfYhCGHwUgtAvPerjqqB6iAsNZa1ZklTWUxFTT/HpzrdxCqWVF4aWBnu2lsCmWLB8lrBj+T7a7vQ4C+eo38MZcFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJ1UZBySybbIYi3/CnkP8wnOTtFANtKXNZ6rXIZCivc=;
 b=Ssb61pCbuQ8GA8mjCAJVr9HD00OEUm+IxBpTiurzZb+u8r99i31v8tPGaH/j4E4y3puTCsjEQAEKY36TAcTd8YXE+6YXBS1fXUyX5/JkzMFvB/M1ZuFjClWMbw/8MInvSJNrofmBl/PBRgdvZBLYOcIIkm+FScxqGWDegtA0NAZrvDW6LFNniMCLqdphdVEZv1Dvrug9bzD8nb7NVla6hWqO+LuEEUSvYJsrOKiZaxTkFd95mpKrYZrtFtnJlBCFWWKYTg0jnQa0NBUQ6nRn37nDzJpa5WaZfcmmUS9c+THF8rUF191a/4U1fEJF0JBiMgYeybFAVvAMQhdup9vk2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJ1UZBySybbIYi3/CnkP8wnOTtFANtKXNZ6rXIZCivc=;
 b=vuBhRLxXVOg/tm2G48i2LU8cQ3yzlNhJLfRM12ZZaUjx0rzMLwgA5+pQEqooV0xF+qYcT6KyeFyaMj6MKN7OD0+zttouveDJA2DWgM2gfDacW5tDGZiQburLB+r6/t2WU22ZdcaoD3xHwCzAPQLthi54PvOXTzg6PnffNysEUys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS5PPFF8845FFFB.namprd12.prod.outlook.com (2603:10b6:f:fc00::66a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Fri, 2 May
 2025 12:01:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Fri, 2 May 2025
 12:01:18 +0000
Message-ID: <841d7108-2591-4f26-9126-cb55f3f46858@amd.com>
Date: Fri, 2 May 2025 14:01:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ttm: add initial memcg integration. (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 tj@kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>
Cc: cgroups@vger.kernel.org, Waiman Long <longman@redhat.com>, simona@ffwll.ch
References: <20250502034046.1625896-1-airlied@gmail.com>
 <20250502034046.1625896-4-airlied@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250502034046.1625896-4-airlied@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:208:32e::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS5PPFF8845FFFB:EE_
X-MS-Office365-Filtering-Correlation-Id: c2364673-37d9-46a0-72c3-08dd89710bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VDZvaUtnWkxRNW83TktkaGRqbDA3V2hURUpMbklMY0pLblJtLzV1bFhLdHp5?=
 =?utf-8?B?OFFWQ3dlTGVRZ2V3WHp2Y0FMT2hubkV4RmhVNjYyZ0FENlNkbWhITXJ2d0xY?=
 =?utf-8?B?elZLeEliVTRnb0dvTi83OGFWVUphbFpKVE00ZHRYMEVMUGVsblJVUGYzSjJi?=
 =?utf-8?B?ZEdtSnBySlVPZ2h6cDZ5V1pDNDlWM2N0SkpEcnk1eGNENk9RTGZqQWJhZHBZ?=
 =?utf-8?B?dUZLVGhlTDc0MWY1Q09UQVhEU29hR0h3bDdid2lzQ1lEN3NBZ2ZKRUV3bFRp?=
 =?utf-8?B?SjU0SU1JRlFGeHVWN004ZFZENWtPYXE2MTQyT0MxUk5IY1QzLzE0RHAyT0l3?=
 =?utf-8?B?S0dXUEFMY0dtT3ZZRGxZRTJoSnJVV05PYVdaRWVraXFidmNVVENlcFZWK0g3?=
 =?utf-8?B?TTBjTGdhNWFWNGVkelAxdUJKN0dlUkgvbGc1VnBxT2pLVDdHZGZNVUp2SUli?=
 =?utf-8?B?WWlTeU9WVjRQaGhUWGRnbm0vdmhhSk1jcnFySFpkbDNsc0ZvSCs1aEE3ekJF?=
 =?utf-8?B?a2xTWmNNUzlZOFI3eFU3WlUzcXg5K1hHZEFqdEFIS2laZ2I1MnpJUHRsU2RO?=
 =?utf-8?B?YXlqcUFIcTJyNE9EeEFKWjBiNlYvVjdwYkZuZFMwU2xJL0djRC9kWE1Bc2Fw?=
 =?utf-8?B?YlV1ajNxRUo5Z09TZnM2ZWl1SHA2SGJITTNFSXRLLzEvTS9CdXYyYTdUemxv?=
 =?utf-8?B?TUdQUFA5TDE5VHZSekVzMmxqRmF6TWdCNnRPeGV3Ykh3VG5GQTJNQk5MWnU3?=
 =?utf-8?B?cTdsN3NnbkxsZ0JCUjF1cHZ6Nm5oazhzVDdWaklWNGZYSFNhVjh6YkZaYlFw?=
 =?utf-8?B?NERWR25acXJGTnNPZE5ZdkxISXFuRU55UHE3bnV3OWhsSG5yMSs5a3ZWdkR1?=
 =?utf-8?B?VkxjMHUvZFhuQ1d6TWRudGlTMm9qL0tUeWV1NWZIWHVPelBWazNlK2tBSW9X?=
 =?utf-8?B?ano5UnZuZHBWbFVMOUxOK2xnalc0b1FoZVdxU0ZoNHl0YjNwWk16YU4wTXRh?=
 =?utf-8?B?ZmNPZWQvbkVyR0RrWUN0V2xwK3lzN3pxc0UzRVZTUm5DUFAvc2RPb1JKNmdG?=
 =?utf-8?B?SlBYcGdxbG5XT0lFUmkxUC90dUZDbDNGUmFWZGxoR3QrTFRvNkovN2xwQmht?=
 =?utf-8?B?OXNUNk1wVVd4cXNVdVBBR2Z4L3l3a0x3NFBqcjcxcFJ5RE4rN1lYU2VZRnZ1?=
 =?utf-8?B?SGh5WU9wd28vMitVUE5wYUt6c1RuaHI1SlIvOGpqcDk5WHhXRm5nSyt2Nmt4?=
 =?utf-8?B?MllJeHFrWUF4ZW55VFNzbTZLYjduRkhURGNXM2dCbTkyNjd6R2JNS3BaNjR3?=
 =?utf-8?B?U2E0bklpL0w3STRrODlpV1ZwbU9MalpFcDE1bll3NE5BdjNoc0N3dWFmVU1k?=
 =?utf-8?B?cEpQaWV5ZWxGTkZEZC81YUtFRSs1UHpBdVRUc0RXRHk5bjVDNm5WTFE1cUJt?=
 =?utf-8?B?TFlES2ppaTZySTRKMVE2TXB2NnRYTVhaQllLMmpKbDNMTllqcCs3QVVnOUlI?=
 =?utf-8?B?KzJuNlFxc1Z6UVRTZWljbE1xQk84YjU5aXJnbkFzYVJ1UmlNb3FBSytYRUpL?=
 =?utf-8?B?ck5oN2JxRjVwNjNnc21NM2hkYkhFSTdnUFJLbUlHYjZBLy9Zdi9obDloWCt0?=
 =?utf-8?B?c2E2amdvTGgvd0k4YkVIQWxhTWFEekFUV1NQV0YxTm5YKzdUSmNMT0IyWTdu?=
 =?utf-8?B?aFBQRlU0Mk5VMjREUGdFZWdqTThzREk1S2RvNER0TTBuM3JnU0NrTWd1ZkhL?=
 =?utf-8?B?cDFJMTc1QjlqT1NQT2daREpuY2Y1cm13c1JHWVpVVFRMTUJnbHpuRjVXZXU4?=
 =?utf-8?B?N3pDNm5QT0hZeHZlSTg1SkVrMUNFSTlzbXh4WUo1Z2hvc3g3Zi9rcXpkMGh6?=
 =?utf-8?B?YkpuRFdoajdnaU4vcEhtOXB2RXF1NDk3U3VVR1p0N294QmpJZHk5dnR5YVU5?=
 =?utf-8?Q?OFdRiQK0X7Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnVjOG45U3ZQdm8vRVdQbzJvYjNpd1NoMFR2UFZBbWhkNWppTG9NWGc0RG9L?=
 =?utf-8?B?MGxpcytMZWdUaXZpbzF2bXpLcjhBai9jMjVwNGFyd2hDckdNR2xuVER2bHlo?=
 =?utf-8?B?c3ZIZkZkY1FqZnZWSk0rUjJwZXRHLzkzTEtNNC90blJkWDF5eU9KeGlmNFZz?=
 =?utf-8?B?UnFUNFUwOXMwRW1lSnB6bUhFS01UVXBVNWIzaEdKZHQydDJ0YWZ4YmY4OFdL?=
 =?utf-8?B?c0JpcVNPNjF6aE0weUZkRHlmY0xLaVYzOWl6d1JPYUZiaERSRTl4L3VEZEY2?=
 =?utf-8?B?bmhScjZLR1l4LzdZdkQwREowekpUcDFqaFgveDFDR3hmNXVLRURmWjlYNW4x?=
 =?utf-8?B?M0FvMFd4QTE0K3RoUUUzek5LVjBJWDBBN0VSZDdOUlM5Ykp2dlhENEFyOEVw?=
 =?utf-8?B?OWRrTGI4ZVZBTnYwWWtMQ0IrRXNrbUlPZDhnNmJjNlNUTEhqOG5QeFY1d1pH?=
 =?utf-8?B?a1ZrRnE3eURmakxMQmczTkhwQ3FWamVFUkJMc1Bzd2pucXVNY1lNTHZaZUE3?=
 =?utf-8?B?N242cnF0bllXYmRGVE9ocmRXWmJqVkppbmoyNHE2c0pnS09aVk5TWVZtSnlG?=
 =?utf-8?B?UGZxOUxBYW41UTZCOVlhWFVtZmxrNW5yRWtBNlhneXh1djI4dDZPNWJlSzNS?=
 =?utf-8?B?ZGZwSW9aa2tzckJzS3Fid3AwcGhKYkdGcWs1OXVaVEs2bEFGVHFJd2FEaTdP?=
 =?utf-8?B?RmU1ZXJOOHhxWVdycDJKdlloeGhwbUlZdmFKaHNoZm5pZjFqam10NG85VnFF?=
 =?utf-8?B?Vkk4dHJiU29pRkRxNDg4eGhmaCtkbFJiSXlYY2M1UVhRUXhjT2lBQWY4VXdu?=
 =?utf-8?B?VkRNTEJQSVNPYzc5bmRoODZuaEwzbmlpaDFrZ3pMeEwyaU9EWm11MnFacmo0?=
 =?utf-8?B?SjlpdHBIcGxxRFZOQXFVaU1XL0RRbFdtZmRjblNTZUFqRnB1eUJlNjVEMlFK?=
 =?utf-8?B?VVZlSExQR2RTVWhwRWR2UGxjbG1mYlQyaG5BdzFOVGNXUmhxUWsxTVpYNlkv?=
 =?utf-8?B?bUFEUHQ1YUZSeGVTUGxxclpDaDJKSG9SaUZzekRWQkNXM3lUcDRNNUlBODVZ?=
 =?utf-8?B?RFI4aThWRUxtWktrUmZWZS9yOVV3a3oyUTQ0Sk1MSlk0MFZGSlRtU2lPbW55?=
 =?utf-8?B?VW1yU0FDeE9jNVBGZGZ6cGdOSGFoTGswemI2bHRRUURobCs1MllBbDBMTFVG?=
 =?utf-8?B?ZktiYXpNaVVsQTdwMGh4cmR4S2ZIRkRWRDVQSGxPa2dVaTFHZjBjOTBqRmI5?=
 =?utf-8?B?eUYxam5kUGk0WmV6Yy9uVHFVZ2NVcWFqVTFiUEQyKzdMM3UwdmtpOHk0VDg4?=
 =?utf-8?B?WkliT0Ewa21sU2FBK2ZpZjZlN1R5UkdHeCtNNnR5Z3NZSkRJS3Zua2x1Rllv?=
 =?utf-8?B?NkJFM0JxTFdad0dVOWJFdldsR2RGdUc2aTAyUktkVWxGUkpMUk1LMnN1eENX?=
 =?utf-8?B?ZXRCbWVreSs1U3BwOHRFRWhtMUlhYmorMGtZQU91TWJoMEs3N2dvY2RZc1Fh?=
 =?utf-8?B?RDBkTW13TGd0SkxldWNaWCtSczhHN3JxRG12YlZ0V0ZYUzN6UE42NllPZzM2?=
 =?utf-8?B?dG5JeUltTVVQNExwa1ZNa1R5Ly9GQnNiWWE5Zk5PazBJb3RPWXliTVMrTzMx?=
 =?utf-8?B?c2tsQThCbGdHZHpYQTk3SDBscWNURmlGNExSNkFSaXVjdHdDNlZLOWZuRWNB?=
 =?utf-8?B?NW5wK3BGTEVPaUhlcGJNSi9nN3N1WGZLYTJZWHhIMXF1eDZOU2cvUVZQSkNR?=
 =?utf-8?B?ZGdtenJzTVlNYWxxcWlMTTFBYlJWZmRXZ3liaG1jMHpjcERJUW9LYnFNQzNU?=
 =?utf-8?B?M0JISk1jUHJMcDFaMm5CelFHVHZOUzR5cHVZWDZLRGhKaDNGVm5QbHdZdVNF?=
 =?utf-8?B?ZDM4U3lFSmpQeXBoUElDM2ZMOEt5ZzdnaHo0ZlJsUGs3cXJmajM5N0VKUGNC?=
 =?utf-8?B?SU12VTUrcS9HUWYwdHZwNElvS3FiVG44UE5HcXcyNXBzOHcxUisyQzFZK0hl?=
 =?utf-8?B?ZGw5UXB3N0pQUXQvT3l2blpjZXlBajRuT3czckRSK0pzRXYrTC9TdThMWStG?=
 =?utf-8?B?OHQvZnNMSHN3eUZDMzBUUXZyT0hSTE53c1RkWTdZSzFobXBnSUpnTVhJSldE?=
 =?utf-8?Q?qVPObPqFNLFsvI//se4nELqX4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2364673-37d9-46a0-72c3-08dd89710bd4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 12:01:18.1303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TLNVid649p0H/phc1n0VugbDFtF6ZbasgkXHtIEL9qb1YMYaPR+KWLsLJdieO0DM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFF8845FFFB
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

On 5/2/25 05:36, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> Doing proper integration of TTM system memory allocations with
> memcg is a difficult ask, primarily due to difficulties around
> accounting for evictions properly.
> 
> However there are systems where userspace will be allocating
> objects in system memory and they won't be prone to migrating
> or evicting and we should start with at least accounting those.
> 
> This adds a memcg group to ttm bo and resource objects.
> 
> This memcg is used when:
> a) resource is allocated in system/tt memory
> b) the account_op is set in the operation context
> 
> This patch disables the flag around object evictions,
> but any operation that could populate a TTM tt object in process context
> should set the account_op flag.
> 
> This v2 moves the charging up a level and also no longer uses
> __GFP_ACCOUNT, or attaches the memcg to object pages, it instead
> uses the same approach as socket memory and just charges/uncharges
> at the object level. This was suggested by Christian.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c       |  9 +++++++--
>  drivers/gpu/drm/ttm/ttm_bo_vm.c    |  3 ++-
>  drivers/gpu/drm/ttm/ttm_resource.c | 20 ++++++++++++++++++++
>  include/drm/ttm/ttm_bo.h           |  8 ++++++++
>  include/drm/ttm/ttm_resource.h     |  6 +++++-
>  5 files changed, 42 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 95b86003c50d..89d2df246ed2 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -537,6 +537,7 @@ static s64 ttm_bo_evict_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *
>  	evict_walk->evicted++;
>  	if (evict_walk->res)
>  		lret = ttm_resource_alloc(evict_walk->evictor, evict_walk->place,
> +					  walk->ctx,
>  					  evict_walk->res, NULL);
>  	if (lret == 0)
>  		return 1;
> @@ -733,7 +734,7 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  			continue;
>  
>  		may_evict = (force_space && place->mem_type != TTM_PL_SYSTEM);
> -		ret = ttm_resource_alloc(bo, place, res, force_space ? &limit_pool : NULL);
> +		ret = ttm_resource_alloc(bo, place, ctx, res, force_space ? &limit_pool : NULL);
>  		if (ret) {
>  			if (ret != -ENOSPC && ret != -EAGAIN) {
>  				dmem_cgroup_pool_state_put(limit_pool);
> @@ -744,8 +745,12 @@ static int ttm_bo_alloc_resource(struct ttm_buffer_object *bo,
>  				continue;
>  			}
>  
> +			/* we don't want to account evictions at this point */
> +			bool old_ctx_account = ctx->account_op;
> +			ctx->account_op = false;
>  			ret = ttm_bo_evict_alloc(bdev, man, place, bo, ctx,
>  						 ticket, res, limit_pool);
> +			ctx->account_op = old_ctx_account;
>  			dmem_cgroup_pool_state_put(limit_pool);
>  			if (ret == -EBUSY)
>  				continue;
> @@ -1145,7 +1150,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
>  
>  		memset(&hop, 0, sizeof(hop));
>  		place.mem_type = TTM_PL_SYSTEM;
> -		ret = ttm_resource_alloc(bo, &place, &evict_mem, NULL);
> +		ret = ttm_resource_alloc(bo, &place, ctx, &evict_mem, NULL);
>  		if (ret)
>  			goto out;
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index a194db83421d..163039cf40a5 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -220,7 +220,8 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>  		struct ttm_operation_ctx ctx = {
>  			.interruptible = true,
>  			.no_wait_gpu = false,
> -			.force_alloc = true
> +			.force_alloc = true,
> +			.account_op = true,
>  		};
>  
>  		ttm = bo->ttm;
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7e5a60c55813..da257678a5ba 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -27,6 +27,7 @@
>  #include <linux/iosys-map.h>
>  #include <linux/scatterlist.h>
>  #include <linux/cgroup_dmem.h>
> +#include <linux/memcontrol.h>
>  
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_placement.h>
> @@ -373,12 +374,14 @@ EXPORT_SYMBOL(ttm_resource_fini);
>  
>  int ttm_resource_alloc(struct ttm_buffer_object *bo,
>  		       const struct ttm_place *place,
> +		       struct ttm_operation_ctx *ctx,
>  		       struct ttm_resource **res_ptr,
>  		       struct dmem_cgroup_pool_state **ret_limit_pool)
>  {
>  	struct ttm_resource_manager *man =
>  		ttm_manager_type(bo->bdev, place->mem_type);
>  	struct dmem_cgroup_pool_state *pool = NULL;
> +	struct mem_cgroup *memcg = NULL;
>  	int ret;
>  
>  	if (man->cg) {
> @@ -387,13 +390,26 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>  			return ret;
>  	}
>  
> +	if ((place->mem_type == TTM_PL_SYSTEM || place->mem_type == TTM_PL_TT) &&
> +	    ctx->account_op && bo->memcg) {


I suggest to make that a placement flag instead of putting it into the ctx.

E.g. something like "if (place->flags TTM_PL_FLAG_MEMCG)" here and then just set the flag in amdgpu_bo_placement_from_domain() and clear it in amdgpu_evict_flags().

This wopuld not only simplify the handling here but also gives a potential solution to the eviction handling.

In other words allocations don't get charged to memcg on eviction, but when the next CS says during validation that the BO should stay in GTT we then charge the memory to the application.

Background is that then the right application get's the potential ENOMEM from their CS IOCTL.

Apart from that the solution looks totally sane to me as well.

> +		memcg = bo->memcg;
> +		gfp_t gfp_flags = GFP_USER;
> +		if (ctx->gfp_retry_mayfail)
> +			gfp_flags |= __GFP_RETRY_MAYFAIL;

BTW: gfp_retry_mayfail is kind of deprecated. Sima is strictly against that.

I was about to remove it but then XE picked it up as well.

I never kicked of the discussion on what to do with that.

Regards,
Christian.


> +
> +		if (!mem_cgroup_charge_gpu(memcg, bo->base.size >> PAGE_SHIFT, gfp_flags))
> +			return -ENOMEM;
> +	}
>  	ret = man->func->alloc(man, bo, place, res_ptr);
>  	if (ret) {
>  		if (pool)
>  			dmem_cgroup_uncharge(pool, bo->base.size);
> +		if (memcg)
> +			mem_cgroup_uncharge_gpu(memcg, bo->base.size >> PAGE_SHIFT);
>  		return ret;
>  	}
>  
> +	(*res_ptr)->memcg = memcg;
>  	(*res_ptr)->css = pool;
>  
>  	spin_lock(&bo->bdev->lru_lock);
> @@ -407,6 +423,7 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
>  {
>  	struct ttm_resource_manager *man;
>  	struct dmem_cgroup_pool_state *pool;
> +	struct mem_cgroup *memcg;
>  
>  	if (!*res)
>  		return;
> @@ -416,11 +433,14 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
>  	spin_unlock(&bo->bdev->lru_lock);
>  
>  	pool = (*res)->css;
> +	memcg = (*res)->memcg;
>  	man = ttm_manager_type(bo->bdev, (*res)->mem_type);
>  	man->func->free(man, *res);
>  	*res = NULL;
>  	if (man->cg)
>  		dmem_cgroup_uncharge(pool, bo->base.size);
> +	if (memcg)
> +		mem_cgroup_uncharge_gpu(memcg, bo->base.size >> PAGE_SHIFT);
>  }
>  EXPORT_SYMBOL(ttm_resource_free);
>  
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 903cd1030110..56a33b5f5c41 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -135,6 +135,12 @@ struct ttm_buffer_object {
>  	 * reservation lock.
>  	 */
>  	struct sg_table *sg;
> +
> +	/**
> +	 * @memcg: memory cgroup to charge this to if it ends up using system memory.
> +	 * NULL means don't charge.
> +	 */
> +	struct mem_cgroup *memcg;
>  };
>  
>  #define TTM_BO_MAP_IOMEM_MASK 0x80
> @@ -174,6 +180,7 @@ struct ttm_bo_kmap_obj {
>   * BOs share the same reservation object.
>   * @force_alloc: Don't check the memory account during suspend or CPU page
>   * faults. Should only be used by TTM internally.
> + * @account_op: account for any memory allocations by a bo with an memcg.
>   * @resv: Reservation object to allow reserved evictions with.
>   * @bytes_moved: Statistics on how many bytes have been moved.
>   *
> @@ -186,6 +193,7 @@ struct ttm_operation_ctx {
>  	bool gfp_retry_mayfail;
>  	bool allow_res_evict;
>  	bool force_alloc;
> +	bool account_op;
>  	struct dma_resv *resv;
>  	uint64_t bytes_moved;
>  };
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index e52bba15012f..1ab515c6ec00 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -45,6 +45,7 @@ struct ttm_resource;
>  struct ttm_place;
>  struct ttm_buffer_object;
>  struct ttm_placement;
> +struct ttm_operation_ctx;
>  struct iosys_map;
>  struct io_mapping;
>  struct sg_table;
> @@ -245,7 +246,8 @@ struct ttm_bus_placement {
>   * @placement: Placement flags.
>   * @bus: Placement on io bus accessible to the CPU
>   * @bo: weak reference to the BO, protected by ttm_device::lru_lock
> - * @css: cgroup state this resource is charged to
> + * @css: cgroup state this resource is charged to for dmem
> + * @memcg: memory cgroup this resource is charged to for sysmem
>   *
>   * Structure indicating the placement and space resources used by a
>   * buffer object.
> @@ -264,6 +266,7 @@ struct ttm_resource {
>  	 * @lru: Least recently used list, see &ttm_resource_manager.lru
>  	 */
>  	struct ttm_lru_item lru;
> +	struct mem_cgroup *memcg;
>  };
>  
>  /**
> @@ -444,6 +447,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
>  
>  int ttm_resource_alloc(struct ttm_buffer_object *bo,
>  		       const struct ttm_place *place,
> +		       struct ttm_operation_ctx *ctx,
>  		       struct ttm_resource **res,
>  		       struct dmem_cgroup_pool_state **ret_limit_pool);
>  void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);

