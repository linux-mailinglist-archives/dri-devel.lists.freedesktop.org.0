Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2649E93E9
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 13:28:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DC110E6FF;
	Mon,  9 Dec 2024 12:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E0dzUGWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 466D810E6D9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 12:28:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9jWmPfEe8i1V9BuJJ0MpOMhVQ6PeK2yk5KaX2xxw9DNCWAkilSBzuLonWEsOLY3mOdJ0Xx6bNckplfE0bxwpTcYBClaBhK4evnHOcfIEb1B8iyOmh+mhv6nynkakXmzlqv4ihlEoHwunrpv4gCMb3+TQqeSTe9h8jv3TclsH2Hi7j91sOMywfvUMvj03q00yqVuNzryCvLh16Yakkx52xMinhpxk/2/Gnb1NvZre1vlVw9jAOrSCTpNXwgVulEfj9s41sfE9yho8ntMK5HQugENRgtytPA+yIRoD2XGTGMgcqpBHMXKFLIu7NmRBB7IIldPSm5EKO1d/goziXy1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3gXwbLF7ec4E+qCH3HUJ9Yzg2Nirswc69Reb7raWrU=;
 b=v01uS9IZPdpWbIuU6t13VbzJALPAyUiWIUbIXR9Ra/KsmIWxoWABtYa6fiF2hsSefTLdDKkd43lvCqkHJLmxbZPKjMa1VuMbyBVXvFf2IwY7cBZX2FTNQVtZQb6vgma7fhMpRQzasCecmN5uOUwzQB34JqABVogbFd16TRQ+3t5omKQXaSlOLecVoSUZB3ml4J9Z/GmMGJ1wdG5GehGxecnO00DMMZfKqNsGK+Yi3ROzRx1ZyjX/i1SHIDfhcXJnhStXUmJyq7Av6yeb4l5D0pvYQoBXDcDRNaq6yJXs5q0l8PfDyqV5SlS1XTeUfUfYwTkXjAi4HuJf/7XtFUFCoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3gXwbLF7ec4E+qCH3HUJ9Yzg2Nirswc69Reb7raWrU=;
 b=E0dzUGWKwESCWA32waB9aTThOByKS5ULXygacoklpkmk0SJ0klqPMEwn7pneITw6ZP8oX/kM6TVeTfHWPtW6WGsXHkcYI5s5bMFP2Vb3n9o7RM9oEZ2CE8+OtK6Tk68p7K1i6hKVsSnK/ki0eBZEXncIxu8qxiLX0fScbpFBBuo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4266.namprd12.prod.outlook.com (2603:10b6:5:21a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Mon, 9 Dec
 2024 12:28:26 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Mon, 9 Dec 2024
 12:28:26 +0000
Message-ID: <36aa77a1-7a72-4cf4-850a-210e6f7f266a@amd.com>
Date: Mon, 9 Dec 2024 13:28:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/virtio: Implement device_attach
To: Julia Zhang <julia.zhang@amd.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 xen-devel@lists.xenproject.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Daniel Vetter
 <daniel@ffwll.ch>, Chen Jiqian <Jiqian.Chen@amd.com>,
 Huang Rui <ray.huang@amd.com>, Penny Zheng <penny.zheng@amd.com>,
 Zhu Lingshan <Lingshan.Zhu@amd.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
References: <20241207105023.542399-1-julia.zhang@amd.com>
 <20241207105023.542399-4-julia.zhang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241207105023.542399-4-julia.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4266:EE_
X-MS-Office365-Filtering-Correlation-Id: a99ceac9-f966-4ac2-a6cd-08dd184cfabb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUtSZzBNUllkdmtxWmdMczZRalZsU3BUSnlCYTNvaGtKNkFVM0hmR0s5a2p3?=
 =?utf-8?B?a1p6YUZ6ODlkWFZrYzN0OUo5c0o5Nkl1T2MvWmZuREFRS1FmTWpNMVRqU09o?=
 =?utf-8?B?ckZYWXE4U3ZOdGRoeEIxdjIwNHhyak0vRUpMcFNTclJXTi9sVmF5OCtsWldr?=
 =?utf-8?B?bTk5UUcrTDBHUE1IOEFXODZPVnVNYXZsbGZOWjhVMTFwYWlkUTlLb2Q1bXNs?=
 =?utf-8?B?OGNhVjlhRlVaa01VOStpNlJmaTB1UjJNSVRybUZ2TmFJNEo3NXVSZlBzeWtZ?=
 =?utf-8?B?N1pIVzhCVWJ2MG1HR0dXM1R4dVk2b3pGOXRsWHlzWmpPdkpFcXpxb3NhM1A4?=
 =?utf-8?B?ZkVjK3RCRml5RUI4eFZqekRYdGdDUVAwelFIelpyRXUvMHJPRUJpNklkd1RP?=
 =?utf-8?B?ckZJNCtBUG5QejBPZGZ2dE1oVC8rQWlLaS9JQ0E2OUpheDNyNDZKR2RjWTF6?=
 =?utf-8?B?U3VMQlNUYlZsajFva2dTa1FLMW1WNENTZHAvYXVScUd2c1RzSXVPSXlWS1I0?=
 =?utf-8?B?VGhlTktRMjdrRUxRdElYbXNOVWNBOUhjb2dlWnVZcjNZV3BqWUl6TDc2TjFP?=
 =?utf-8?B?VnBDL0F0THRZeldBWWltMlovRVFaZE9IMG56NkRqQlJBYVNISVRpMndxVkRa?=
 =?utf-8?B?VmhrMHlOd0wwQ3Bzb3FqQmw5NnB1NDA2dXJUTDhTaURmcVgvb0dXYW5DWXFW?=
 =?utf-8?B?ayszakx3RXQzM1ZkaDExcjg1YmRSbXRNZFM4Y3o2ekNuN1RiU25IeEJiQkVl?=
 =?utf-8?B?OSszY1RKR1E2eHdlMlhDeVp3SjFNbUdqNzRDeWF6WDQ2NmFHK3ozMzRlVnVD?=
 =?utf-8?B?TFhZaE1aTzFIOG12NHVNTE56NGZpaXN2dWd0MkZPUFhwME0zQVhrN1lXaUpZ?=
 =?utf-8?B?WStueSsvS1E5QTczbHZ3WGNtVWV4Q2tUVFNNcWVIN3hVZGs1cytaZGhXWDNw?=
 =?utf-8?B?d1dIZFZCUHZsU2pkNnFETWIrdDlUVDVoNzFWT3FUM2ljWGhNK3ZBaVZISnhX?=
 =?utf-8?B?eTg2RzR6dVpnS2tSZG1oZUhwMFlSbjdndDVtSndpcnE0K3NYajRRY0s1SHVC?=
 =?utf-8?B?T3JTQ0xDK2ZjcjhlUVoxOVEwNDJEbkc0elE4MWt3dEJtWEQzV3JPMjZxeUF4?=
 =?utf-8?B?TDF6RWJwYlh0djloS1VPT05tZC9RKzd5Wng4SlovOWlUUVEvQkdrQzJYbEdo?=
 =?utf-8?B?OEJtYnc1NFRXc1h2Y2Y3QnhpS2dHdUxyUkF3aWdmNmM4UEJIMVFyRDJzOGQy?=
 =?utf-8?B?b05hTHBYTkN3L2J0WGxyY0FFWUE3WEgwbmtoMk5lN3I2SCtubWpmMTNJTExj?=
 =?utf-8?B?dTZLZFhEUzR6QVNSYWlRVHVXanFHckt3SHkxdHVkcCtVbi9RWFMvYzhrTkgx?=
 =?utf-8?B?ZHNIYXFtT1RNOXUyUW9XZUF6a1lkaTByUWJaRTRBUjJSVFhTbVJzMXp1ZEJ2?=
 =?utf-8?B?UUh2VmxGa1VkNFJ0QkVsSGJOODhFalloeVVWNEUyTE1PRFJtYzFLNzZWNzA1?=
 =?utf-8?B?Mk9rZmVVMG9Fa1plK3BicDZPbG1icE1RYSt3WnVjalNBQlVObHBoOHgxdGRK?=
 =?utf-8?B?V3Bha3BjODZRUFM3RDQwa2lONHJibllZc3drRXdyamNpbDdnRjdvRmJOY1FQ?=
 =?utf-8?B?YTVZWEZLZVdTbWVNS2d5aDMwcWszWktQNVlNSFZxTGk2eUZvTjdUd01wTGk0?=
 =?utf-8?B?MDJoSjZGZE5DN0dNeEFPUnR6dmdkTkkzcW54eWN4VVZqY1k4aERTckVieTNa?=
 =?utf-8?B?SXV1Tzlsblpna1dWcjhCeXhoZENBU0FOWC8xaHV6TlkwU2p3SVRRODdTUWhn?=
 =?utf-8?B?NkljTUJFbk5JUHplTHROVEFETEpPSmp2N1pad1lWdS9vWnpIRXpkYS94TGZt?=
 =?utf-8?Q?VX4HN+C1VTNvR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEZGMzJ1V282K3hVZ2Vzb0EwYjNZbEZiNUJZZ2dOS2RYa0FwcnlXSzJ3SmhX?=
 =?utf-8?B?dFcvcU5wODB3TW8xdFNGTFc0N0VtU3czSU1mRnVLZVREd3djd3J6ekd3S3l3?=
 =?utf-8?B?SU1XeE56UkxMZ2tvRXg0TEpQcEVOQ0VPZUN3WUF4b3B3b1pDZ1lUTHdacVli?=
 =?utf-8?B?OFBQb2t1ZHVJWXc4MjhXWE8yRHE2QWs0SExSRFZJdWdRLzhnUnN0cmhqS3ZU?=
 =?utf-8?B?eDExM2EwSTRVd3ozemxIckdRRmx1NTkxOXl3ME9SOGhORUZuTitUUmR0OHhJ?=
 =?utf-8?B?aCtCTVYya0xSQ3didlE1Ty9HYnBnSUpwK041a0dWR2hVT2E0ODJUVUlXWUtt?=
 =?utf-8?B?SS9taDZVZ01XR2d2TjdhbjV0UWdqdUkxeStKNTRnNWM2VUlBTTVRTEJRb2lR?=
 =?utf-8?B?bkxMcnphMWlVK0hCM1A2Q3ZZQUk0MlVlYW1YOExwcEU3WUMvQlJrWDFEcURl?=
 =?utf-8?B?VEk3NWNpK3ZOMHl6U3pEOStyTUthZWJmL25xWlhiUXkxbWhIb3RLbVFnN0NW?=
 =?utf-8?B?QTRNcTRrSmU0UEMrVDBuUnFORnVuSlFKTTNJcnN0ZFNBcnkvaHU3Y25TSElM?=
 =?utf-8?B?bzFwZVJSeWc0L3M2VDlnbVVwR3dCQWloelFDeDg4bDZGbWJmMjkvOFZXQU1l?=
 =?utf-8?B?T0F4djJsZXY0QjhWei9rTm4wY2FrQngwV1RJUGFrcTQ4NVEyZ2pYZmNOaUd6?=
 =?utf-8?B?dXhQbFExMmhYYXZKcTBDMVJIcjliNTVjT2dwYWxNTFBCRDZQVVVjR1cxanRO?=
 =?utf-8?B?RVZvZmtnT3p6dll2ODBHdWNsa2lvYmptR3RqcUhwUVdzUW8vZXhHeHZ0ZFdO?=
 =?utf-8?B?Vm5QOFZTMTIzU2V0Tk4vckkxL0x3QVhGMWhqcms0WnJEaDhydFNpMVhuc0Zj?=
 =?utf-8?B?djM5SjM2MmVXNzduUGx0a1JTNFo0THpmTElSRXMweXFVVTFCWjBnNkNSbU9k?=
 =?utf-8?B?RXJBdmMwTDRINEVoKzU0VW90RElaYys2cU9Mb3hhT1hRY1czem80R1VhZWxh?=
 =?utf-8?B?VUxPZ2xsazZMTHRPNS9SZUhDUHBXUFhUbjV1VXdVT2lWTlBRb25FbW1CUWJ5?=
 =?utf-8?B?OVdrcXFJY00rRzRWN3RYZnBjSHBhUXlobkhTQkF3azFKTEsxTmpBSW9WUUVE?=
 =?utf-8?B?Vms0eSt1dU90Z0doOFNZcXZkUDBoc1hKTUlPeGhmNzg5bFJ0VUdvQlFrc1Iz?=
 =?utf-8?B?N2Myblk5MkltVUtUM0duZmlMaHZsUlFwdVRPWkt2R2UzZWU5dzRacHN0U3hE?=
 =?utf-8?B?cSt0YjlSV1REVDhXQUZxU0pNZTRSRHlnMkNsRE5CTXYybzVIUnFpQituNjVN?=
 =?utf-8?B?Uk9NZTZUQnNybWViTWFpcXRnZzl0Q0xPVDdHcHFGUnlMcnRhaUdKWCs0a0J0?=
 =?utf-8?B?amVFR3hPdG5UOWdMb0NMSXJ5bzVNeHRqckpqQml5OTVkTkhFdkFLUmpwd09p?=
 =?utf-8?B?UWlYWFZGdFF1eDVjQVhHcCtIa0NJWjVlL1JucmJzL2U3WG52eHdHY1ZKbndk?=
 =?utf-8?B?aFdlelVqekpZSENFc0NlY2puTGtwS3pwU0h0Q3MyZXVDVEg1RlhZWmY5UEdv?=
 =?utf-8?B?anBvNU1UT29RV1dlSFNYVDJsc2lFT2VXNUpqUDl3UkR1REw5dUZYOW5iV0xG?=
 =?utf-8?B?ekpsa09tR211MFErRm1sejVhenRFTzVlMUg0SnRBUS9DUjJPOUxmaW5sY29S?=
 =?utf-8?B?cUtZVlcxUjVIQ0ZlSzBubUFjMy8wRjduMDY2Q2d2ZDVXTElCTC9HcHFlU1Jw?=
 =?utf-8?B?bUtMb09mYWllaUQ2WHFKQ1VmdWZEUnpHclcvMDBFOTkwY3JvVHQ1Q2xia0R3?=
 =?utf-8?B?UHJhdmtJS3JYdGxxS3M0b1AveGF5ZjE2NUF4Q281dW1SQm5Lb1JYaElQQzZY?=
 =?utf-8?B?V1JVSWcxSjQwV1M3VzVORCs2MUpzVUo5SGRxMkFFajNRMm5tOGZQbGZjRWZn?=
 =?utf-8?B?b3Y1U3hYTXBoc0M0MTM4eVJKRmRnMkNhMnpVNDJKVDVRZkZTUDEvSVVza1k1?=
 =?utf-8?B?RkRBZFJjYWZEVVk1QWJFaDFnY1Q0czJUVHNTdkZJVHhrVjhVanZITWRLYStz?=
 =?utf-8?B?em5OeDhneThSa1ZRcDcrcVF5UGpOM3IzS1RFMEFZMnJycXBDbEp2NS9WbnVI?=
 =?utf-8?Q?1Si7K9dvCFl7rbuaq/UwDDk5R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99ceac9-f966-4ac2-a6cd-08dd184cfabb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 12:28:26.0910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8vxxuHrWl3xKqjQj6hmnK6KwGJoAvtZS/wTC2xPE7wBsqVY/shgS6CENsL6qbdJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4266
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

Am 07.12.24 um 11:50 schrieb Julia Zhang:
> As vram objects may be imported by other gpu drivers, peer2peer flag
> should be checked in dma_buf_ops->attach(). This reimplement virtio gpu
> dma_buf_ops->attach by adding a device_attach() function for virtio gpu.
> This function will get pci_p2pdma_distance and check attach->peer2peer
> before calling drm_gem_map_attach().
>
> Signed-off-by: Julia Zhang <julia.zhang@amd.com>

I can't judge that virtgpu or XEN code path, but that here looks like it 
should work.

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/virtio/virtgpu_prime.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 4960620eba02..4f6bce79e10e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -116,6 +116,18 @@ static int virtgpu_get_p2pdma_distance(struct dma_buf *dma_buf,
>   	return 0;
>   }
>   
> +static int virtgpu_gem_device_attach(struct dma_buf *dma_buf,
> +				     struct dma_buf_attachment *attach)
> +{
> +	int ret = virtgpu_get_p2pdma_distance(dma_buf, attach);
> +	if (ret)
> +		return ret;
> +	if (!attach->peer2peer)
> +		return -EBUSY;
> +
> +	return drm_gem_map_attach(dma_buf, attach);
> +}
> +
>   static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>   	.ops = {
>   		.cache_sgt_mapping = true,
> @@ -128,7 +140,7 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>   		.vmap = drm_gem_dmabuf_vmap,
>   		.vunmap = drm_gem_dmabuf_vunmap,
>   	},
> -	.device_attach = drm_gem_map_attach,
> +	.device_attach = virtgpu_gem_device_attach,
>   	.get_uuid = virtgpu_virtio_get_uuid,
>   };
>   

