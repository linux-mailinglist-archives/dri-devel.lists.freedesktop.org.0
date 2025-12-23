Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1378ACD9B8A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 15:56:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B2910E13A;
	Tue, 23 Dec 2025 14:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rOeV5MyK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012003.outbound.protection.outlook.com
 [40.107.200.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C8210E108;
 Tue, 23 Dec 2025 14:56:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hx5jT9V4hzLdXzBFRsu5cDy9WdFG0n8M9n7LB8FDdJLHFaSvS31tG2aR0+mVa5Ra9Oqje/TXhtONCZzZpxqTi3qb/k4Jh2EthjIj2xAMgH4onIsBJyqtbzHPx/0+Ftwm3C73enyqAU7RjybaZVPQUwODTx34MeJG7I9nBzbn7BoindTy2+kJcXgvmq3grdmYk3Z3uoOhVeIX8T6ROmzjy3YW6xN5f4NmHj20KhpvzTQ070w5P/fCBLqFQTOnFAygC24znIIPCGuG9fYArkpggS/eeGK8w0ly6kcOkk6ENc4R9WxQstP/LznMcYb7VXE+G/FTSmiMnJnWoB3/pncWaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBRbSgTrnOl2VSe7lIEcRI5wbYulO2HOl9Q1ik4Wanc=;
 b=WdDzoPJe0Q3xKdp2SxmU7o/+C7Nj+pF+7HCOrhumYyMWJKBGoavBtqSKZ4/ScyhmZxv07/l98lesPcLakS+cJwjE2LkOrlaijhr7mAQUhCKo5oVJqFMZTPQatVOIyAqEUE3yzTicLBgLDNh/lWgGwkDNSj1VPrKAnAToEO6G9zbHbXjXiPVNbs3z7/HHWm/PXEA2QUIWuF38E4VwNLGDpGQIi7dxHd5NpzigLZP4y99wxQbZeRYaKcmKq8uDMJrHbRF69z9rNsnGVm4bDJFf4G/tNlg7OGASLfYr5k+fDZdpFAwke8tJ9IalowxQgRhpxuZkmX3ZnPDPaZ21b7yYXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBRbSgTrnOl2VSe7lIEcRI5wbYulO2HOl9Q1ik4Wanc=;
 b=rOeV5MyKK5erNnBhBcZqlqNIqnlguNPI8xOqv9u0H/zGpvz2hTLk+asytEH5RPnjBTQCl0dfEjU0HyeyvfkVKxqp8EOxOQIDsa+E/Bgs51hwnKWtEsEIp5Q/2CosmqORD1L3iZX+KR6vggetLnuB49/OVSROeOLsQ/NQZbd1IE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6749.namprd12.prod.outlook.com (2603:10b6:806:255::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 14:56:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 14:56:01 +0000
Message-ID: <2ab9f73d-ef7b-40b3-b2bb-650f83ac236f@amd.com>
Date: Tue, 23 Dec 2025 15:55:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: bypass no_64bit_msi with new msi64 parameter
To: Arnd Bergmann <arnd@arndb.de>, Han Gao <gaohan@iscas.ac.cn>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
References: <20251220163338.3852399-1-gaohan@iscas.ac.cn>
 <e86b823f-5e83-4105-8e4d-1db141d088a4@app.fastmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e86b823f-5e83-4105-8e4d-1db141d088a4@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fe::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: eb5d373b-981a-4a0d-aeb2-08de4233635d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmlidDVRRHZNbk4rbjRIcnNUOEFKd1huZlYvSlRBakw3blcwcmJDVnpGZUZn?=
 =?utf-8?B?ZTZGSFUzc2pzQUtmMmgvazRqcmRHc216TUZTdk9TY2w4TERuU3B5Y1hsajB6?=
 =?utf-8?B?TnNHUG11cVBTczN2L1VVZDVGQnNWY01zOVh5SU9sZXdRcFlIa2ZYRFc4UWpB?=
 =?utf-8?B?MVU0azlibDFTa2F1bHhxdy9ncFpuak9yVTl6NUtySlVrNkhwWkFjcFhUSTRZ?=
 =?utf-8?B?SWhxU1hxMVYrajdVR2FuaGdtbnRJZE9QSGNRYi9ySVAxa2dyVnpIOUpGcWxS?=
 =?utf-8?B?dGVIeUVNZmFuVGhEU0ZTUVlsaSswT3ZnUkdlQmQwL2h5cW9mVUpPdWxaV2V0?=
 =?utf-8?B?WXkyems4Q09CTWdQUHR1VFFhalZJWnhoWllxQ1VEbS9ORGk0RGZPcTljNEFy?=
 =?utf-8?B?KzNIcFpjZ0czczdIZllNd2ppUjFpci90bXpMd2NwUmVkL3VTSk1MR2pNYzdV?=
 =?utf-8?B?bHVSN0dMekxUZjNyamUvanhPS0ZOd2JwVlB5THhDdEMvbjFoWmYxK0lFeTda?=
 =?utf-8?B?VnJjYmdjcnZRUzYvL0VVQWxNZDc1eDA3NEozb2dEUnppa1YxZEMyTVBPTjYy?=
 =?utf-8?B?a0FuS2Nhb3RRNWNzcmFPREY3SzJ1SzMxYVlqV2pvSGdpT2NkVTh1R0djTVF3?=
 =?utf-8?B?SVpmeW0wUUtWRFdBaEg5NmpqMjh2aFppNEtUa0hFN041b2tSOUt5TXlERk1l?=
 =?utf-8?B?L0YxWnVkc1lldlcyT1ZRcS9VNlVHeEpXYkYvRUlhV2todVdKSkpOOFBiV2kx?=
 =?utf-8?B?b1AvanVQUnJocTVrdElpdjhlUU1iK3gxb00rb3RBaS8zdDZzQU5QZjdDcDZr?=
 =?utf-8?B?cDIxenpYczhqY0ZkRGpDUjNkWGU2ZEZFRlhhc3lPUkRiL2JodjBpT08xVG9P?=
 =?utf-8?B?QXJiM0JTdmNrbHJocktSRVdHVHM0aXpIQkNEdnpMbHJpMGxveG9ZM3BQMmJP?=
 =?utf-8?B?RGpnNGRqT0lVK2x4OFdaMlpsV2Z3UTlkMFZWdXlYblBrSEFCTTVYSmdWT0Fh?=
 =?utf-8?B?TWRYZEZkemxFSzFIWTQxdnpDQ1B6SnlYUVpGVWxrTWRGbW9Hcml5ajNCQmxB?=
 =?utf-8?B?b1hZSTBHdGlHcFhINk9KS2ZqQ1lwM0xVQXhncnV2cG1Yalk2TFVoaGlHQUVu?=
 =?utf-8?B?SlhWdHNDMmtOQW5zVXYxSkliS3Q5OHY4K1o5S2I2b0lrUlZ0TnFRQ1NWT1Ey?=
 =?utf-8?B?QkUyZnF3TjBrQytzN3VLRy9IdkcxWlBUb3UxSDh2M2p6bHVBcHk2czh4UVpS?=
 =?utf-8?B?Z0QzWmJ0eWNoMXFQUEV5ZCs0ZVpQc1Znb3ExM1cyQStZWFpGRmd2Q3U2dkFz?=
 =?utf-8?B?UW5BVDN4YTVEZGF6bk1HWCtPK25RVEt3NEdjdFdubWpmS2k5aFUrM1RjYzBj?=
 =?utf-8?B?U2VjdFR3a0YvOHZWU1RxcVdjMlNGak4yaDYya2lOaHNoYnVkQlV0dzRCZ1Q3?=
 =?utf-8?B?VlA1U0V2TS81aldESkJiUTVCamhLelZZYUJqQml1aHlvN1lDdFBzbzFEWFkx?=
 =?utf-8?B?UWUxOXV3dTdLbElOMnRMWElSamMySkQyeUtaVW9aRnRWVWF4MGgyN21WTHhE?=
 =?utf-8?B?cjd4YkJ5d0F2SVZtV0FFaXpUeGI1eW5uRlcveEtmNFB4MklzVE1mZzFCM0lT?=
 =?utf-8?B?aXUyUndhNVNBampEZlZyYnhpVDRKSW9jV0VIN05LNmEyMWRJSmtzSkJMeXh5?=
 =?utf-8?B?dFVDVFJNdU4zanBsZHp4SkJ2WjdHcTcvaVlEWll5L1RuVVo0TVJQMkhGSVpE?=
 =?utf-8?B?UytsM3FyeEQ0S2dldnllVzBVeWJGdWF4ZGVYOHk0aG41WWd5Z1Z6TkxRSDcz?=
 =?utf-8?B?ZENRNlNaZ0xMbE14ZFBVTGFVK24vQ2tHc1QrRkhaaGNYOHBCS2xRUWZyM1JG?=
 =?utf-8?B?YXN6OERSajB2aVh0S0M3L0JkbVdsVklpeXlHSTlUNzJLc1FqK2dNc1RGWndY?=
 =?utf-8?Q?zOXxiPaOwd0WgKcKrsWfLk2J2/BKMdtY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWVyRGZ5dmk3U3JDZDVMSEFWZTJjcnJGcmZJelZDYmdidWhxVHMvb1JQVTZw?=
 =?utf-8?B?emV2NythSFJUbHk5Y3pxQlloaFJ5UXE4UXBqanNSMTNaUU5yRHo0ZWY5V0Zo?=
 =?utf-8?B?cS9Dd0NxdSt5TlhFUWJtT0tpVXdJRCs4WkcvVVhnSnRyb3VXeitNOENiOUFm?=
 =?utf-8?B?aVU3WXJSc0w3SWdGT3FrWk1oMVFPVzFwWEtXRXdnamU0bXl3Q2tYdVZObEIz?=
 =?utf-8?B?Rk5tcmVVeHJpbUJHa1RkOWNNVTdqZnpaYS94bUtRUi92OGdwcDRRRTZDaTVB?=
 =?utf-8?B?dGJQd1RYNFpOdCtnVi9MMS9rSk5mWGswcW9LME1RM1NYYTZxUy9LazlRbERn?=
 =?utf-8?B?NnFCL3A3V1FHSzRLMjc0ZkE5OERjQXhsSTNxYitmdWpqay9pS2ZIYnU4ejAv?=
 =?utf-8?B?VFVML094NFBTM3dTWjE3bEZHYjFrQkpFNFRlTUtINWdVcU1haU1QOHlnQzQ3?=
 =?utf-8?B?dElIajNBZUs0eUF5TXd1UjB3Vk4vcEZmMGplNkdYTSsvL1lQbytqcW51WmlN?=
 =?utf-8?B?ejZTQmRPQ0d1bUpBT0FQckZHWVd2MGdiTXQ0eVdvd2lMbWJuMjdJYjYrTno1?=
 =?utf-8?B?bHNtaDBldkhHMnVKc1o2ZDlPVEtoUk9LbVoybWJjTVdGRFV5bFdyYmlqUnJU?=
 =?utf-8?B?UDdtcFpUeURyL3pwVW1FQ3ZDcDRJWXFHWGlyN0lza1B4Ri9xNFlkelhMWUJC?=
 =?utf-8?B?Mk52T1IrbmVUa2VxQ3kzdHJmemo5MkxOU3htODdSUjVjZHlkbzZROG9VSzN4?=
 =?utf-8?B?Z082amJTUWMvTkVubHhyWGJsbDRTTlJwYlBUdVlPWkMxKzdmdjZXOHZhb0xP?=
 =?utf-8?B?eGNkcXBZakFGSEVWR3VqYnpKR1E0MjArTUZVeEk2RkREUmwrRHhiaU96c0FR?=
 =?utf-8?B?QzVxTzVXZ3Q0S3FzdG50M3B4NlpvV3BzZFI1U0oxaVdDVWJKd245OVpqMWtk?=
 =?utf-8?B?ejJ4eDBWaEpXWFk0eXh6WHFsdDh5L25aalR3V29sMGdQMThlTk95WkVFUWd4?=
 =?utf-8?B?YVhrdXVSVDVZM3dOVi9aSi9oRVRXUWZRbmNHZkRmTUlEMEF0dHRGdFBaVFFw?=
 =?utf-8?B?dGllZlkydVpuaUZMeXY5QUNjdXZKeGVhdGRGOWtaRzU4T1ZLT0t5end4Q25m?=
 =?utf-8?B?dTlDMjBJbGx0QjJmbFUwZ3RtdWtzZ1FuMnBKbUhPamlaZnFxeEE0NHQ4Zm5h?=
 =?utf-8?B?WStwSDV5Um5JemtzVFFWU0doZ1BFbDFBQnp3aFo4TnlxVU9rNjN0MkJBTjgw?=
 =?utf-8?B?TDJUZ3dnUUJMNzYzcUVzK012TE9GY2NGTzJySUx3eklWekhzdUs0TWRYMFFu?=
 =?utf-8?B?bEpXaW1iN1NSY3Bqek81YjVDVE5QWVZyUVRVRWtHV2tLeTZTNWZsZGsxWnc3?=
 =?utf-8?B?SGNaNmJkSEtEaVUyODFaaDkyOFBrbEFWNTlzUEVtbEpKN1FTbmNqZnBFbW5l?=
 =?utf-8?B?b0dxZ3JGNTNBajRRbWJhUVp1dW5zd0R0SnNWemVtTFVkNXJQWEhVWHo2Tlgw?=
 =?utf-8?B?cVJBbGc5WEFSQWlvZ0dwbVlRaW4vdmw0dTZwczN3RkNkdkdaNGJlejNOMkx5?=
 =?utf-8?B?K2VQYlI1RGI4THlxYlZuWVNsZjMzWSsrdTRRWjBORTdsZUlMQnVKdEtFNTdk?=
 =?utf-8?B?TWxkOXdvSFNGRi9TMGlsMGFEbHJvMm96bEphL3NJaUVVQlE0Tkp2cUNhN3Rj?=
 =?utf-8?B?SGRmRGtxT1NUQ1pDTC9ZM2VkZ2xyeVlSbW1VTG51aFhTM3VMeFFqcWE2N29v?=
 =?utf-8?B?QkYzVXQ1ckdWUEFCaktBNjhsS3JaVkR5TERNbmRnbkFEUmdMalVacXZ4VU85?=
 =?utf-8?B?S2xkT0MvRXZvZ2dqV3Q3QXRONjdjR25YRkFDNG5tTHU2d0wxdEE0aFhpU3R5?=
 =?utf-8?B?TEYyZERKTWR0dzB0cEttS0YzeE0zYzVYeFhMZGVERlpKaWNwc0l3dE8xdWho?=
 =?utf-8?B?SEtEQmUxYnZwTXZHN1piMEVocHErYzRvUGtxRHBvOXhFb05lSFlmdXZCallE?=
 =?utf-8?B?ZTI0T3BaUnQ0emtpcWd2Zlg3a1N1by9JcnY1UytyZ0w2blJGNGpFeDI3K1l5?=
 =?utf-8?B?MGpGSFpXcUtSczRIcTE2ZFZXd0ZYaFk0UDFFRU1UVGxJVHpodFNSZTNGUHhK?=
 =?utf-8?B?bStidkxCMFJGUVFiZWRBeEl1QytSUkV0V282anJXakR1RXpIbnAwaCtMSGlJ?=
 =?utf-8?B?emVJU2JDbE96eTA2MEkvSk1QVXdYSTZRS01GbmMrWTA3a2ZsbXlwWlVDRnNl?=
 =?utf-8?B?RlVCdm9GYnJMRWFmTElXTURqQmtZWjNRSVVMR0VvcGVRLytxaStVcTZUMmxR?=
 =?utf-8?Q?kg2ozxmZ8fwE5HNj45?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb5d373b-981a-4a0d-aeb2-08de4233635d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 14:56:01.3140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ebPD9nb3n4cg/All/bS+RZJ8FXDAtTStSMv85IOorrkZGl4iYPk9FZARNa/wGL+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6749
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

On 12/22/25 22:32, Arnd Bergmann wrote:
> On Sat, Dec 20, 2025, at 17:33, Han Gao wrote:
>> diff --git a/drivers/gpu/drm/radeon/radeon_drv.c 
>> b/drivers/gpu/drm/radeon/radeon_drv.c
>> index 87fd6255c114..53af28494c03 100644
>> --- a/drivers/gpu/drm/radeon/radeon_drv.c
>> +++ b/drivers/gpu/drm/radeon/radeon_drv.c
>> @@ -249,6 +249,10 @@ int radeon_cik_support = -1;
>>  MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled, 0 = disabled, 
>> -1 = default)");
>>  module_param_named(cik_support, radeon_cik_support, int, 0444);
>>
>> +int radeon_msi64;
>> +MODULE_PARM_DESC(msi64, "MSI64 support (1 = enabled, 0 = disabled)");
>> +module_param_named(msi64, radeon_msi64, int, 0444);
>> +
> 
> As with the hda-intel patch, this should not be a module argument,
> but we should have the kernel figure out what to do itself.

Yeah, completely agree. This is basically just a workaround (and a bit ugly one).

>> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c 
>> b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> index 9961251b44ba..62eb5a6968ff 100644
>> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> @@ -250,7 +250,7 @@ static bool radeon_msi_ok(struct radeon_device 
>> *rdev)
>>  	 * of address for "64-bit" MSIs which breaks on some platforms, 
>> notably
>>  	 * IBM POWER servers, so we limit them
>>  	 */
>> -	if (rdev->family < CHIP_BONAIRE) {
>> +	if (rdev->family < CHIP_BONAIRE && !radeon_msi64) {
>>  		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
>>  		rdev->pdev->no_64bit_msi = 1;
> 
> According to the comment above it, the device can apparently
> do 40-bit addressing but not use the entire 64-bit space.
> 
> I assume the SG2042 chip has the irqchip somewhere above the
> 32-bit line but below the 40-bit line, so it ends up working.
> 
> I wonder if the msi_verify_entries() function should check
> against dev->coherent_dma_mask instead of checking the
> upper 32 bits for being nonzero, that probably gives you
> the desired behavior.

Again completely agree, that sounds like a plan to me.

IIRC the modified code here is basically just a workaround because the MSI control dword on older radeon HW was not setup correctly.

Regards,
Christian.

> 
>      Arnd

