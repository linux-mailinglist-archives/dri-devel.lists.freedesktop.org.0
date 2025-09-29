Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C178BA85EF
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 10:16:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6C410E3C4;
	Mon, 29 Sep 2025 08:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="popVkK5f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013028.outbound.protection.outlook.com
 [40.93.201.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F3C10E3BD;
 Mon, 29 Sep 2025 08:16:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DC/4b4RKApLBqyugL26N8KDfZCENc0otBWIcs5LwX9DqVBl97W9xt4Ym4r+UItPaBjy9qxnzn2pKhKngRksnC/9qvnE91l3NGkufvDLOnPjykOeiP3SkuHj7ECygC7oePQCHvgWDqc5PyyXJAe8lLPArS9+qitKoQVgbVa4L3tKPNdYPULXLCqrDfyd3qxE6hRa24niOMJcWQDGluGyV95wqP2GqW4JW9t0KsKQ5gCZI8p+sOgEVlT6mKsJ3T/vOf/+45apUDKYI0sOJX3uiyqPEvd0qFaNWJ9NPqZ0X+gyEddUQUcq964dvwbxgrDNFHKZlKEuOCjIeOWKNcP2psw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpS/D4OSN3OI8pt9Q9okV/i8POlW9hTg57pxsmBxM4w=;
 b=mgHfy1xeCxRzs4qKK13TgHLf0HGq/CIoLQGHyXDbali3hZN/GIBLqJ8Ieg89M25/PuG3mQbyCfHklZoxIzWg1B9W2wA8AkCu8vT5DBgKPhOfponTHplL8dDA2SmqTfHh86xj8t1hlDGZABQN6q2gq85FOrv/F3KUUdFtgNFQJZdJdyR2y9389sz74msm327HcLNP6djyqM4HKdyo6P4OsJUwDlPp/+msOhLiqvaGzqEwyCv+qXCNqCzi7H3Dp4QJXweDAOSnlZgGbzpl9JDnOOvK2G+n2O8KdUP4yRL8ptf+6sJXNC4rLF7TzYSwVSH8HzhNQCXpZpU7Z8R7+SnwAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpS/D4OSN3OI8pt9Q9okV/i8POlW9hTg57pxsmBxM4w=;
 b=popVkK5fH3+DQ72Eruj80Wemc7XxvB+cnqdqX747PKx0KHVgzxdFYsLoi4GgWjdpCU777cHG6dZj3DoCZ5HzOXKJQ+Fumn4ewJzq2QdNBAGhcmO5mtl7k4cHRvxPGHGONRDfi/9gib7PWwyJ771QJXMnOPo0H/W5CNa1UsDU1VY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4143.namprd12.prod.outlook.com (2603:10b6:208:1d0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:16:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 08:16:35 +0000
Message-ID: <f33a4344-545a-43f4-9a3b-24bf070d559c@amd.com>
Date: Mon, 29 Sep 2025 10:16:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] dma-buf: Add support for private interconnects
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
 <20250926084624.2288-2-thomas.hellstrom@linux.intel.com>
 <472f27f0-2f54-45dd-b0a6-3a26b5eec301@amd.com>
 <ef9f4fb1c55bf3e5e6423b2accdccee0607b95ef.camel@linux.intel.com>
 <20250926144128.GD2617119@nvidia.com>
 <765e3449-2eb1-49f5-954e-3bab5a5fc9d1@amd.com>
 <20250926160036.GE2617119@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250926160036.GE2617119@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0434.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4143:EE_
X-MS-Office365-Filtering-Correlation-Id: 699673b8-072a-4fb0-93ac-08ddff3081ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkdLSHd1M0E0cUNvWVc2V2lndVZHRWluYitwUVZIWlNDVzg5OTY4anBvUkRE?=
 =?utf-8?B?TnVaU21TdnIzcnN5cXM0WTR4WWJLdGRrN0E3TjJQQ1ZrU0hHWStCUGdETmdy?=
 =?utf-8?B?aTZzZjhIeENGMzhrb2dQMzFNcDRGZTI2NzRCc0lwdE92eUdXT3d3YW1SS2dF?=
 =?utf-8?B?ZGYvSXh0M3ZiY1huTDB6aVBRNlduRGJ2TmEwN0lYQTJsakRPSFBwYzJJVkVn?=
 =?utf-8?B?cC9LRjUzTExETGFyQmN4UmpISXJ2TE1LcjZYL0FyUFVoTHYrQ3JNRlFoV0F6?=
 =?utf-8?B?Z2JhdnZoV3UrNjAwMndUY3BlY2N2dkwyTmJRQ3ZBY3pmQnN4b1dmS1RvVm5i?=
 =?utf-8?B?dy9jQ2VQa05wR3ZFTXNNVzJrWDg1Sk9Gb2srSHgzMTlXL3ZNVzYwVWdLelNR?=
 =?utf-8?B?dWpiSHU4R2JUUzNLWmpIRDVvUXhxenBLc1NoS1Q3RnFuV1MvU1NLMjd5Y3Fi?=
 =?utf-8?B?V3JKaGdYY3hOeEhQU2J6bnExdE1qMURTNEVlN1JoRlJqZnlud0hLc28xTmtx?=
 =?utf-8?B?TGdkaXRYd0hvSkJwbUlNWGdScjlUc000N0Vibzg3VFJWSjIvajRhQ2ptOUZT?=
 =?utf-8?B?YVNmSVQ5VG03UXE1QW5zdytBeTIvdTlIN1Roc1I4cHFKd1RWR2IyUTgrZE1R?=
 =?utf-8?B?MzFFYjFqc3JwM3BiVXAxQ2hoTDVTRmpNdlNwcjU3enNiRDZrTGhVcklrUXFt?=
 =?utf-8?B?YzgzdWpOMDR2V21UMlpzUC9tSnR2RHpIb1J4djF1dVZORmhsa1J4SkZ1cm9o?=
 =?utf-8?B?U01ZNGltcGpSQkZTbGVnZWVuTER6VlBINVRSUDN6eHdOYnJ2SUxZTlNpWVZT?=
 =?utf-8?B?UGRORmU4WW5VOGQzOGZqTFl5L1I1alVKa3FuNHE4R0tqbkljSUNiRkMyZ05r?=
 =?utf-8?B?WTNJY1BDMzN0NHBUYUhiQmtDTy9NYkorNWVHendwcWxOV2R4MU51Z0hiaXlD?=
 =?utf-8?B?b2lJbjdFTTR5S1lDcVlqK0RtNlFvcU9lVTB4U25ZaDhnVGx2ODJHeEFTVnpG?=
 =?utf-8?B?dUdrUFBtaGpPYW1STDV6Rm1DM0dodVBuUTkzdWtBckEvSVczdks4RkxSZElU?=
 =?utf-8?B?ODJqbkE1azB1czNFMDhhVjJGSTJDMlNkYlNzYk0xbXZTQkliaWh2K09rVkdP?=
 =?utf-8?B?L0lPa1FLOUh3aTZSREFiWldQYXpiMmVxVkc1RmR4RXVrVlBZRStzcjBFa3p6?=
 =?utf-8?B?dENyTUk5M1RkeHlJdjFTYTFjd0lyTTBGZUxTcVN3Zmlia1RMVW1GZWlKc0tE?=
 =?utf-8?B?eWJaOUdyb1pSSitDQ2FtRld5YzZhdmg5eXdRK0M2YnNKTDNPekprUmtpWWFP?=
 =?utf-8?B?MXRwSVdnRmhRa1BtRjRSRHUyUFhFQzFUSDhPSXVKR0t3WEQweENZQ3prclJH?=
 =?utf-8?B?L2E1QkQrdjlEUGlpSUtiYXVZbWZ6dkFBdjVQRVVGNTdXakpCQW1hLzJGT1Zl?=
 =?utf-8?B?RUROM253TnBUby9SdElHMkVXQThNSEJYWDRJdWR4NmFrOXBLaFFuYTJ1NVlR?=
 =?utf-8?B?Q2FKVTYzR3pwVGFrVVQ3b3dOaHJqeFZxckRKd2gzTDMyYURiOFliWTJCMXMw?=
 =?utf-8?B?anZvSHgyV2hZMmZtRzN3Rkp0MmFIclVJclFOdnVGdG5sZm82Z3N1eGdFZHlp?=
 =?utf-8?B?NStpVlJXc0p2clNHc3YvaS9hNk9aUi9VMlJyQ2pDKzBOQUl4UU9lQUJxb2xI?=
 =?utf-8?B?alpLYnR3aWRodDhjeGgyVjNhZ2QyMFlQZjd2NDIrYjRZT29Wa2hkZ3JKMm0y?=
 =?utf-8?B?eHkzeG01aXI5ZGJBTVNtVzZsL0NGTS9DR204NGtPanliaWVFMjJGcm05NVlt?=
 =?utf-8?B?MFdwSGpkRCtmbVJuUFR6VXRvZDN1NHdDZTJNM1kyMTJ1eVhEU2t5S0lQZ0ZZ?=
 =?utf-8?B?Q1NIdVlvYjczTGNOYjNCUkdTZlo0RkJoWjJETlRBN29QOTRIWFBtbHF2T1VL?=
 =?utf-8?Q?G4/m+p23KXJPzkIBuRCOwbRIj/V6Sz+/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWNBNmY3WjJOVmRPZVUxNXJWL00vQWUzZEV0bTB1LzBNc2I4VlB2UDl5d3RY?=
 =?utf-8?B?ZGlmUnJuMGJjWkRqZ0h1dzdVZ3l6N2pqKy9LOVBYWEdreVJQM3lJbm9FSE5H?=
 =?utf-8?B?SXdxaXdLWFNsLzNnZFNNQm9PUXRyWUZvM2NaNDJVaElpNkdCWEYyQ0hJVDJT?=
 =?utf-8?B?N2lUUWtCNHRXd2IzaSttdHdCS1c0aW9IQzFMWlBZUXVzbHQya0lUMmtZaVBB?=
 =?utf-8?B?bndzYXppR1lqMUUxTjh3RExiT3RJUVZHbXYxb2ZLTnNHNThiaU9rNjYwQUkr?=
 =?utf-8?B?RlBCWkxQeHBuais0N2MzNHZIRkpBdlRaVzkyRmlTTlVmejJraEw3dWRqOGlT?=
 =?utf-8?B?aHFnNzh1bDR3TzRaVnpkN3dFcmJRRkNSTnN3Snk1UHRCcU81THNwUy9OTWww?=
 =?utf-8?B?eEtqNlhRTmx4MVhZeXdXcWRjcWhCdHRtOHIzRVZxNnl1VXV0S3RTNjlpVllv?=
 =?utf-8?B?MFE4eGNYMTh2WXM2OVdiRkdoZEFKV0RoMGVtMXdybW5uTmdrOHFYY3RkVUhG?=
 =?utf-8?B?YkdyVHU0WUFtNlZsdHRUKzBMb0dGS2x1M1lUM0Jjci94VXpmVUlmM0p2VzhU?=
 =?utf-8?B?NVVkYkJjVEF1UE9VT2tPa3JqbUh1NysxNnZhMGlzcFFpSmxWTHp5dDdCS3ZE?=
 =?utf-8?B?dFFDWU1hak40Q2ZaVnIvUkdJSldtMXpnbFExMytzeWxTa2xFbjFXK0FncHZk?=
 =?utf-8?B?c3FJa1Z0TWJIV0s0bnhaUldEVDkzSVBnZjVYME5hUmgweThKc09qKy90eEpj?=
 =?utf-8?B?WUJMU3hiRXJHVEMyRllYQVM2cU9SUjJVVTZzU05USnhvZXAxenE3cFQ2UmN4?=
 =?utf-8?B?cWdONWlzSkpuNXBWd0M2bUJWTk9CZkMyV2ZGMTBsaldQUllnTmJyVVVyalMz?=
 =?utf-8?B?d3JrUjNwSFE0Zkk0cndMdUlMektkR1c4djRjSElpSkZQQWdTV2R1S2lRMVRw?=
 =?utf-8?B?cXlocS9MZEdqTlNWNHFUUEhVejBtMGVuU1hERkRTeWdVWWJXV21KUWFWQXN2?=
 =?utf-8?B?UkxLWGVxRGJMb3gzU3Bsam1YYjJkemh0anBvdE1xTjJ5NFdYWWk5TjQ5OVRZ?=
 =?utf-8?B?Sm5NY0lhV1JtLzJocEc3bFI0SHA5VE1ETFFmNmprOUN6MDJZektKWEJXdGFX?=
 =?utf-8?B?bVF6VFJQVEZRU0cvQ3d0SWxtMCtocXJqTU82dFBOdjFSczYrU3dqZGJZaVo0?=
 =?utf-8?B?dUhRRmM3TUd1S2FMQVBmNHJxcytFYy8rR2hrd29PTmFwRlBBTzdDK0IxSWsv?=
 =?utf-8?B?K2NrU0ZJSTdpZ3hQRjE4SEREc1N4dXYwVSt3aitIbW5XUnM4ZWFlWWxpQms4?=
 =?utf-8?B?V2RCZjkwTkJIVUFYck9EWEFDZTN0dkpMbjJkSnl2MElwMmxkUGFrcURXU211?=
 =?utf-8?B?TWVCYUloRk12RzM1enpkTnlpR1AwWnZBcytnSjJUM2JQTlNrZ3EwK1lUZTU3?=
 =?utf-8?B?WG00TUJCRU8vMGdmRjJQUmNTU3dBaTRST2pydmcyOEtUenhCZkZXKzRqbmdn?=
 =?utf-8?B?Z2pVbnpnLzBHNVJDdEcxbUVNbzlFUHQ0RExVcWFIbFYweEViUmVhWlVDbUtx?=
 =?utf-8?B?N3ZWWUlwL1hJaGlQY1FWWmtRWWJCQjdqcytXWmtabnF3am9QS1ZUR3M2VU05?=
 =?utf-8?B?TTQwNzR1UnJYb1g2NUw3dDhLdXBtcVdoNzVLZGNGaFA2Mk9hNyttUUNZZkt4?=
 =?utf-8?B?alExbXY5ZHNuS1NvOS9jMlNXMExLTUFLb3RFT3lSRFE5NHV5ckRkTStmUXd0?=
 =?utf-8?B?MWR6Z3JOSEpabW54T3l2bXZ0UmpLYzcxYlp4NW5lL0V5OUFMVFRLbDZ4eVpV?=
 =?utf-8?B?Q1g4R1BwTnN0UDI4cmNCbTVDUFc4UnNZa3g2eWNhQzA1TlJrS0Zsa3R3cFR5?=
 =?utf-8?B?OUk5L0J4ZzZqQjc1THcvQWVIbTcyUHlKRjVaOXVXQnpYaGRFQTlweE9mSnJK?=
 =?utf-8?B?elkxbC9odWZvdlRCSGdkTTN5a1lNZitPeEFwSkdmNFJUT2R1QUt0aFB2TVpI?=
 =?utf-8?B?WUp0RVNLbjlzYUV1T2NTU2t1WHNkMlY4TzE5Uy8vRWxoazlCSU1DaGdkNUU2?=
 =?utf-8?B?eEMzRXJ0bjlHcHV2VlRxYzYxVzhwQnlJTGFPTWprSk9maDBacmxRbUEwRTRO?=
 =?utf-8?Q?gI2hTAVqKKDfZuE2ZZk0gldOU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 699673b8-072a-4fb0-93ac-08ddff3081ad
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:16:35.8122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dIOTlGMOXjC7DEbP549aAaELgoeslCBOMQ9GYB+gL7E5/gVs+wfxXcGwP8i7dadQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4143
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

On 26.09.25 18:00, Jason Gunthorpe wrote:
> On Fri, Sep 26, 2025 at 04:51:29PM +0200, Christian König wrote:
>> On 26.09.25 16:41, Jason Gunthorpe wrote:
>>> On Fri, Sep 26, 2025 at 03:51:21PM +0200, Thomas Hellström wrote:
>>>
>>>> Well both exporter and exporter has specific information WRT this. The
>>>> ultimate decision is done in the exporter attach() callback, just like
>>>> pcie_p2p. And the exporter acknowledges that by setting the
>>>> dma_buf_attachment::interconnect_attach field. In analogy with the
>>>> dma_buf_attachment::peer2peer member.
>>>
>>> Having a single option seems too limited to me..
>>
>> Yeah, agree.
>>
>>> I think it would be nice if the importer could supply a list of
>>> 'interconnects' it can accept, eg:
>>>
>>>  - VRAM offset within this specific VRAM memory
>>>  - dma_addr_t for this struct device
>>>  - "IOVA" for this initiator on a private interconnect
>>>  - PCI bar slice
>>>  - phys_addr_t (used between vfio, kvm, iommufd)
>>
>> I would rather say that the exporter should provide the list of what
>> interconnects the buffer might be accessible through.
> 
> Either direction works, I sketched it like this because I thought
> there were more importers than exporters, and in the flow it is easy
> for the importer to provide a list on the stack

The point is that the exporter manages all accesses to it's buffer and there can be more than one importer accessing it at the same time.

So when an exporter sees that it already has an importer which can only do DMA to system memory it will expose only DMA address to all other importers as well.

But in general if we start with the exporter or the importer list doesn't really matter I think.

> I didn't sketch further, but I think the exporter and importer should
> both be providing a compatible list and then in almost all cases the
> core code should do the matching.

More or less matches my idea. I would just start with the exporter providing a list of how it's buffer is accessible because it knows about other importers and can pre-reduce the list if necessary.

It can also be that this list changes when new importers come along (that was one of the big motivations for the move_notify callback).

In other words we have use cases where we need to do scanout, render and V4L to the same buffer at the same time and all three of that are different devices with different requirements.

> 
> If the importer works as I showed, then the exporter version would be
> in an op:
> 
> int exporter_negotiate_op(struct dma_buf *dmabuf,
>    struct dma_buf_interconnect_negotiation *importer_support, size_t importer_len)
> {
>      struct dma_buf_interconnect_negotiation exporter_support[2] = {
>          [0] = {.interconnect = myself->xe_vram},
>          [1] = {.interconnect = &dmabuf_generic_dma_addr_t, .interconnect_args = exporter_dev},
>      };
>      return dma_buf_helper_negotiate(dmabuf, exporter_support,
>              ARRAY_SIZE(exporter_support), importer_support, importer_len);
> }
> 
> Which the dma_buf_negotiate() calls.
> 
> The core code does the matching generically, probably there is a
> struct dma_buf_interconnect match() op it uses to help this process.
> 
> I don't think importer or exporter should be open coding any matching.

Agree, that should be somehow handled by the framework.

> For example, we have some systems with multipath PCI. This could
> actually support those properly. The RDMA NIC has two struct devices
> it operates with different paths, so it would write out two
> &dmabuf_generic_dma_addr_t's - one for each.

That is actually something we try rather hard to avoid. E.g. the exporter should offer only one path to each importer.

We can of course do load balancing on a round robin bases.

Regards,
Christian.

> The GPU would do the same. The core code can have generic code to
> evaluate if P2P is possible and estimate some QOR between the options.
> 
> Jason

