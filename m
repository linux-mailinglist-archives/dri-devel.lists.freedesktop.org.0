Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5A9C6DA4E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 10:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D0610E5B9;
	Wed, 19 Nov 2025 09:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5q2wLnOj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012066.outbound.protection.outlook.com
 [40.93.195.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE77710E17C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 09:18:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ek9QUknVnS8p2TFDmCp3S8WogOQGRAvwM0NwWq6g6vyF4fw8LBcB5fZNri8rA/10ik7hhk9fduEhE9YeLgsXdV0fyib3jplHufaihThz85lz4suxIKQgi3gXlubM2FmKz7o018UxdxRjw8sztwQh7DMhlYc7NpZzlaIF9zR6zeOW8g75C1GGffwtB2n6kiK9rxTf/ajvEnDdIto0lgg4QzSg9iCSunraQLNWbUPmcR86ZOCLFf7Hn6B8qUX+qDXLLQFULe7ujak3Z76vQpPaQvoHt+a0nMnKC1K7eZdZ6PkLuDnSUo0L/gFbZWiAKLXx9Y1uJvktIdfGmjaVm8SPVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuvBF4Dq9FvtFnke+tgXeNA0BH6QY6fGLiaaZqA8Loc=;
 b=w8sCWn8v2A/yYomI0bsuDti16ks28dWnMk6d1by9MTXNFTWRLC1hMjI+YelceT3fY5RsDgbaM6WGLZwro7a3G3pdnFHgAWGqevvJT+VFsD0dqk5QrZB8e/d4mb6QvE63vayGIPgyDdtkmk6RSsU/BvlakZhLcfE6vX3zlbJpHmLiamZimY+VlNaAhaW0xTNkKQ3TInwkPuSrfceszFLGyBebFerhFJcGQC17J8UoEa2REYLNTXY2TgSqp72+ihPs3MHgmKc0LsMqoOkr7C4e57u5pmPS2TH4ESce/j/80KTR0B5O//hee10QcxIhz+J/9PL/BjwbTBlXAwVeiS5QNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuvBF4Dq9FvtFnke+tgXeNA0BH6QY6fGLiaaZqA8Loc=;
 b=5q2wLnOj8nRpnE+/QtB40amzWDv4a0uAn6GA7+IHF2p6blHolik1fzv710W9cFTL/dZ5qNsxMecPcjELYlLnKJI1SsIsejscgeCwComGzaDZiFjbN44m9+6XfsQKQa90lPqdNbdHjuZl0nR+iBfJXwALrA5BdRPshA0JmsvQBPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB7714.namprd12.prod.outlook.com (2603:10b6:610:14e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 09:18:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 09:18:16 +0000
Message-ID: <9798b34c-618b-4e89-82b0-803bc655c82b@amd.com>
Date: Wed, 19 Nov 2025 10:18:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/11] PCI/P2PDMA: Document DMABUF model
To: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>
Cc: Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-5-fd9aa5df478f@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251111-dmabuf-vfio-v8-5-fd9aa5df478f@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0ed3c5-cb15-4639-aeae-08de274c922b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWF0SGR4SHhuM05kRWtQZGd5Yks4NGtDNWVKK2EvVGhWcnZ2ZjU5cTUrUERK?=
 =?utf-8?B?WkI1U1pXUzAzZDlmaGQxT1Y3aU8wazVxWTlIblY5MnlQVnllRnloWm9raDNa?=
 =?utf-8?B?elJadkZWNUdOWjNISWtzT0V0UlpuWHFhYUtlR1YrQzBKekl4enRWZERqZzRM?=
 =?utf-8?B?U014amJxNmh2cUpPTG5YNFZlUWNCTXdERVc1ekRSYml0TVhmSGNFQ3ZTcnU4?=
 =?utf-8?B?akcxM0VEZEhZTjNmVFl5aHBvQ1lvcXRsNnk5ZUNHKy96ZEZDZ0xGcnZqS1pX?=
 =?utf-8?B?TFdkTnh3U0VPSjZaZFNPWElSNytkS1MzL0ptbnArUUxIZkZQOERPSkZTWFUr?=
 =?utf-8?B?T21haGJGUzVWYXc3WDYvY1pVeFZ3YVp0Q3l6a1JGTUNEbTF4dlVYOHR0aWli?=
 =?utf-8?B?SlM2QmxKdjlOekZaOG95dEI3SkZBQnRGeDA2SGxEL1psc1gvbkloZUN0UjFt?=
 =?utf-8?B?MGpjWDVvMFhLYnJkNEtINWwwN2FVbk9MVEhXWG53K3RzTTRsTmNPTkF4a1ln?=
 =?utf-8?B?WkxaOHBieG9UV3R1a0tFYU9reldDV3RMRHZDQ3lhdWo1b3psSlovN0d2VTZC?=
 =?utf-8?B?Smgxbm1ET1RuQ0tXZ09zRTJQenlvZWdXU3NUWGFVSThpV3pGL2xpRWRCZU9K?=
 =?utf-8?B?NUo0MVlVZERhVDVMV2hnRjlEQ0p5N2EvNDYrWnBwWkJwdkhUSVVFcnUrNzky?=
 =?utf-8?B?OEVuMjJRdUNoelprNjFwQXBHblhCUWsraEx6UWRod3NyOTBtQ0ViV0xLZmRH?=
 =?utf-8?B?ZXF6S084eWl0RWE3ckRQTDJLbXBIeTFNcWtteGcvK0RYWFE0NVNrVk1xbisy?=
 =?utf-8?B?ZERlUmc2RFhhaDdkdHMzaHlNQVhtcndjb1BNdkdYVmIrM2x4OHJ1M3ZSclBu?=
 =?utf-8?B?ak1xUCtFa1pqNjhZKzNFYlBoWlRrZTk3WVIzck9PM3F0UG1UOEczSmdKYTdn?=
 =?utf-8?B?Y0NsaUdFQjd5RVZka2xsLzRSSGQ2RTBoTHAxeHZSMUp0UTZCcUNyU201bGFi?=
 =?utf-8?B?R242a1ZBelVoQ1ZiRU5taEhrY3V5andoSWo2UXZveXllQWxBNVFlVWFPRzZX?=
 =?utf-8?B?cUEySXptd0tLTExMdnBRcm9BOElWZkRuUjhFT2phcHRmdXlOV01FNERPNENI?=
 =?utf-8?B?QStoVkdob294VnNJN29laG9UVmNDN0VMMW0xa0l5UzY4VEF1YS9VVjNRU0tS?=
 =?utf-8?B?N1dDT3pabmEwSHRLb1VuSXRIN2oxSUhZMS9jZVlrcFpPOGtZWkpxYStIUVV4?=
 =?utf-8?B?SlpHcDV2NXgza2o4WVZnVzJCc3RxSXpnZS8vS3JXM0lWY0NrRlFETFBjcHVE?=
 =?utf-8?B?aHFqbjZPK21sWmJ2OHY1YWdjQktyYXF1bW1rekVMVFd2N1djL0VmNTd6WWpI?=
 =?utf-8?B?WjNMQ216NDEyUGc1SnBodkcyMFQ0NC8zMDN2RmxLcmd5S3lVMmQrVmpxQk9Q?=
 =?utf-8?B?SnhYc0phc3VUV05FOGJSM2s2cjRlN1MwYWdiUys0NXpJalUyVHRsNmF5ZmlK?=
 =?utf-8?B?SWtKdENPL1YycW16ZlloSDVNMEY1ZFU0MGtjTHhjcmtabVdYNmtZRDlBbkhl?=
 =?utf-8?B?N2IzcTFiK3RHbU0xd3BUYlJRWFEyaGhocEx3YjdtaUpUZHQ4bDlFeVEyNURj?=
 =?utf-8?B?YVdvZWxyVDBxcCtOdTg3TlBIdWIrMWtkRVJwQVFnbjB0RzI1Ujc3U2xjS0lZ?=
 =?utf-8?B?eThsR2E3MUx1cVJIcERyZGlvYXRWMFpCazA2dkIzd2M2ZGVmcEdkR0RvM0NB?=
 =?utf-8?B?L1MydkRWQ2orNUZGN1N1dUh3bDdZNDNpZ3VITWdiL0RSdXNOV2hYOE1zYXow?=
 =?utf-8?B?QUx3YUo0QXJkYnZzUHNWZWVIYk4vclV6RFp2WmJCK053dGN6WWF5clRtQW93?=
 =?utf-8?B?cWhteFIvTW5WcVFTcnBFb3ZrcUcrTGEva1dudlpBNFhNNVBQM2crSUFGQXc2?=
 =?utf-8?B?U3I1KzhwNzhJZmhnYmRxRjhSK2ZwRkZiSy94SmFkaFdibXJaSUc1ckt0U2d6?=
 =?utf-8?Q?TNmoie+eGNaOgkAmOrpLjki3WgUGdE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmRhbkpiVDZEWE1JMjFJdGtFK1NXakNzWUd1OWRobnBtWVYwRDk1b2xxQjg4?=
 =?utf-8?B?bW9FRHI1bUlWWHZ4ZGtZajR1QTYvNzZZellDWndxMDc3M2s3Zk1Kc0t6VExv?=
 =?utf-8?B?WDBOdWRQTWFHaUUraGszS0hZK1p3WVk4ODRGSk4zc2kyUW9jWHBLbjZScXBt?=
 =?utf-8?B?eGZQeWE3ZUxqZGFGeE10MHI2bG1XTktud0tCMlhwZmdvZWFUNEpGY1pZY1BG?=
 =?utf-8?B?OVg3Zm5TL3JBQU5GdWs4aEJrMTFHZFJGaU85MU11T2REMkFjZTlqY0NLdU9Z?=
 =?utf-8?B?VXhlalJVSWxHbFc4TndYZjFQUk9oenZJU1hxUWhVUU5xNlVqU25RMjR3NVJZ?=
 =?utf-8?B?NjRZTXA1dm54Y3BrTXVxdStWNG84TFE5dGRpVXI0b0RnSitzWlNnZjRwTTUr?=
 =?utf-8?B?dThwbktvRWplYVFxRmtCN0NsMk1HNjY3Q3hFZkY0NkxRWFdHNFYxWWVPVUxB?=
 =?utf-8?B?WU5yS0ZLN0VxTHBuQ0o0YmZpamllUCtMOTZHeUNvOU80QThRMXIrTGpTNTZR?=
 =?utf-8?B?SG5JdjY3eWE5dmQ3RzlKdFdjUktsblFhcnE3ellHdzJCN0RGdjNkRHpuamZ6?=
 =?utf-8?B?eUUxYnVIa3BJZmJzVHlHS0pDcGVXY1ZNb0NvWTg2YmV2eEg2UXBtV3lYWVVp?=
 =?utf-8?B?M0s0RVprMlVMNW8xTEJldkV5UVFLcGd3OTF2SEFSUlNKb1p0eGFtUUdtZzds?=
 =?utf-8?B?SFU4YkZmckE0dTRCOXdqSmpUNmFQTzJMRnRVNkVlQllNbU43eHNKR2tCb1Uw?=
 =?utf-8?B?MGdNSWV3akdkUDl2aWkxOHk4RHdJS2pkMG5mUkZkU1I4UXo0Rm1OSkc4dVJI?=
 =?utf-8?B?WGJOdk45Mi9NZ1VjeGUrT2VNRWdEVHdRTDJaalJlVDVPdFdBTWNqOUl3VEtw?=
 =?utf-8?B?S2NBcjVZZzZ5TmVxQ2FyblJMYkJpQWdjeUIwRVJXcEUzakZ6ajRSVHE2dmd5?=
 =?utf-8?B?MENsUnUzQzlqb2tPWWtoOEVBc3NVd1FKN2cvWEdkL0pValh1bEh3dXR5WGor?=
 =?utf-8?B?K0dSajFZMDlkMlE2amlvbkxoSlllbDhaL3dWYzhTWXVORzJ4bVd1QWlvNmIx?=
 =?utf-8?B?bmVqMERDRis3LzJSVE12cWEyNGFEKzBUdWJ2QWFjUVpBanVYL2toV21MQmJR?=
 =?utf-8?B?UDBJYi9pVUxjcVBhb0dEdHE2c2Y4ZndUU1RDUVptcFJiWmlWa2VraHRiMnpy?=
 =?utf-8?B?bDNycCs0dU5VL29SR05takxsa0JXSGo3bEZPZEhyeEFjYld3QkExVmNqeHFm?=
 =?utf-8?B?cTh5UHFqazVzb2RQS0NOcVp3bzNCRmtYTXJ2cWw3RjZJT2hJOEdFY054Q1dW?=
 =?utf-8?B?ZHRSV0lhMUgwUWUwTTVtSTNudW5wQmhVdDlSSkNlWnVja1BiY2VrR3dTSDl5?=
 =?utf-8?B?U1RlcjdKSkJ2YkZENEo3eGcwdHBnOWJDV3pFSzNzb2g3OXo1NGk0UEpvS1FR?=
 =?utf-8?B?SHUrQWhDZzVHQk40N29jK2VYSEJiQUtYNitMK284MDZQd2F0LzZpdFRVRlVk?=
 =?utf-8?B?RkZnNk5wNUF1UUtxdTJIVURWTnZoVkk0ZEJrekdhZEViMXlUc3FUUGlTSEZL?=
 =?utf-8?B?L3dudmNxODJ3YlB0WW44ditOby91VC9ZQmxzUUVoSUkwNFN3aG1yZUdza3hv?=
 =?utf-8?B?K3o1RzVSRFB3VlhmUEhRTy9tNVBDYUFwUDFUNnV3REJnOTN4OCszMWhqZUJE?=
 =?utf-8?B?Nnh5Y3QrT1pKSGkzeXZKVFpIUDVDNlNOT1BYMVRpK0x1NGJnVFBJR2xheHhH?=
 =?utf-8?B?d2l5VXNEWk53V2ZLN0I3bmNlUm9YTkpZR0NRekI3YXQ0RjU4cEtScERhQkpv?=
 =?utf-8?B?U3VFUFlwQ0g3UThTNDQwVDF0a1lhVGQzTWpaZkNOVnFyMzg0QXkrbmVvUXc3?=
 =?utf-8?B?ekdxWFg1Zmk5UDBkQnNPMTN5bXptSWM4Q2FpRUlnY0RQS2lkZjUrSGY1SWJ3?=
 =?utf-8?B?d0FNMllXcUhUZ1Ftemx0ZXBxWk5taXNVK1VXNk9FMzU4eWI4UHpnUzdXSkZ3?=
 =?utf-8?B?WGg5Q2JLdWZqUVFZR0JqZVB6STBWV1dXTDM1YUt1Nm9hNVJsYTlhMDdRSFZo?=
 =?utf-8?B?ZlBPUTlRUSt1LzdFMW93UzZlaXl0aVlsY09FZWQ1RFZFekdtK0lRQlNOSE9m?=
 =?utf-8?Q?H1Vl6A4X7p65TvS83YMAu0yuP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0ed3c5-cb15-4639-aeae-08de274c922b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 09:18:15.9792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjOsscU9slSYMzvnN5LiBJ2zbWekpts7dViPI0tOmMvliHlarI7J7lrugUBwQRZr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7714
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



On 11/11/25 10:57, Leon Romanovsky wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> Reflect latest changes in p2p implementation to support DMABUF lifecycle.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  Documentation/driver-api/pci/p2pdma.rst | 95 +++++++++++++++++++++++++--------
>  1 file changed, 72 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/driver-api/pci/p2pdma.rst b/Documentation/driver-api/pci/p2pdma.rst
> index d0b241628cf1..77e310596955 100644
> --- a/Documentation/driver-api/pci/p2pdma.rst
> +++ b/Documentation/driver-api/pci/p2pdma.rst
> @@ -9,22 +9,47 @@ between two devices on the bus. This type of transaction is henceforth
>  called Peer-to-Peer (or P2P). However, there are a number of issues that
>  make P2P transactions tricky to do in a perfectly safe way.
>  
> -One of the biggest issues is that PCI doesn't require forwarding
> -transactions between hierarchy domains, and in PCIe, each Root Port
> -defines a separate hierarchy domain. To make things worse, there is no
> -simple way to determine if a given Root Complex supports this or not.
> -(See PCIe r4.0, sec 1.3.1). Therefore, as of this writing, the kernel
> -only supports doing P2P when the endpoints involved are all behind the
> -same PCI bridge, as such devices are all in the same PCI hierarchy
> -domain, and the spec guarantees that all transactions within the
> -hierarchy will be routable, but it does not require routing
> -between hierarchies.
> -
> -The second issue is that to make use of existing interfaces in Linux,
> -memory that is used for P2P transactions needs to be backed by struct
> -pages. However, PCI BARs are not typically cache coherent so there are
> -a few corner case gotchas with these pages so developers need to
> -be careful about what they do with them.
> +For PCIe the routing of Transaction Layer Packets (TLPs) is well-defined up
> +until they reach a host bridge or root port. If the path includes PCIe switches
> +then based on the ACS settings the transaction can route entirely within
> +the PCIe hierarchy and never reach the root port. The kernel will evaluate
> +the PCIe topology and always permit P2P in these well-defined cases.
> +
> +However, if the P2P transaction reaches the host bridge then it might have to
> +hairpin back out the same root port, be routed inside the CPU SOC to another
> +PCIe root port, or routed internally to the SOC.

Please keep the reference to the PCIe specification where that behavior is defined somewhere here. E.g. "See PCIe r4.0, sec 1.3.1".

> +
> +As this is not well-defined or well-supported in real HW the kernel defaults to
> +blocking such routing. There is an allow list to allow detecting known-good HW,
> +in which case P2P between any two PCIe devices will be permitted.

That section sounds not correct to me. This is well supported in current HW, it's just not defined in some official specification.

> +
> +Since P2P inherently is doing transactions between two devices it requires two
> +drivers to be co-operating inside the kernel. The providing driver has to convey
> +its MMIO to the consuming driver. To meet the driver model lifecycle rules the
> +MMIO must have all DMA mapping removed, all CPU accesses prevented, all page
> +table mappings undone before the providing driver completes remove().
> +
> +This requires the providing and consuming driver to actively work together to
> +guarantee that the consuming driver has stopped using the MMIO during a removal
> +cycle. This is done by either a synchronous invalidation shutdown or waiting
> +for all usage refcounts to reach zero.
> +
> +At the lowest level the P2P subsystem offers a naked struct p2p_provider that
> +delegates lifecycle management to the providing driver. It is expected that
> +drivers using this option will wrap their MMIO memory in DMABUF and use DMABUF
> +to provide an invalidation shutdown.

> These MMIO pages have no struct page, and

Well please drop "pages" here. Just say MMIO addresses.

> +if used with mmap() must create special PTEs. As such there are very few
> +kernel uAPIs that can accept pointers to them; in particular they cannot be used
> +with read()/write(), including O_DIRECT.

> +
> +Building on this, the subsystem offers a layer to wrap the MMIO in a ZONE_DEVICE
> +pgmap of MEMORY_DEVICE_PCI_P2PDMA to create struct pages. The lifecycle of
> +pgmap ensures that when the pgmap is destroyed all other drivers have stopped
> +using the MMIO. This option works with O_DIRECT flows, in some cases, if the
> +underlying subsystem supports handling MEMORY_DEVICE_PCI_P2PDMA through
> +FOLL_PCI_P2PDMA. The use of FOLL_LONGTERM is prevented. As this relies on pgmap
> +it also relies on architecture support along with alignment and minimum size
> +limitations.

Actually that is up to the exporter of the DMA-buf what approach is used.

For the P2PDMA API it should be irrelevant if struct pages are used or not.

So I think you should potentially completely drop that description here.

>  
>  
>  Driver Writer's Guide
> @@ -114,14 +139,38 @@ allocating scatter-gather lists with P2P memory.
>  Struct Page Caveats
>  -------------------
>  
> -Driver writers should be very careful about not passing these special
> -struct pages to code that isn't prepared for it. At this time, the kernel
> -interfaces do not have any checks for ensuring this. This obviously
> -precludes passing these pages to userspace.
> +While the MEMORY_DEVICE_PCI_P2PDMA pages can be installed in VMAs,
> +pin_user_pages() and related will not return them unless FOLL_PCI_P2PDMA is set.
>  
> -P2P memory is also technically IO memory but should never have any side
> -effects behind it. Thus, the order of loads and stores should not be important
> -and ioreadX(), iowriteX() and friends should not be necessary.
> +The MEMORY_DEVICE_PCI_P2PDMA pages require care to support in the kernel. The
> +KVA is still MMIO and must still be accessed through the normal
> +readX()/writeX()/etc helpers. Direct CPU access (e.g. memcpy) is forbidden, just
> +like any other MMIO mapping. While this will actually work on some
> +architectures, others will experience corruption or just crash in the kernel.
> +Supporting FOLL_PCI_P2PDMA in a subsystem requires scrubbing it to ensure no CPU
> +access happens.
> +
> +
> +Usage With DMABUF
> +=================
> +
> +DMABUF provides an alternative to the above struct page-based
> +client/provider/orchestrator system. In this mode the exporting driver will wrap
> +some of its MMIO in a DMABUF and give the DMABUF FD to userspace.
> +
> +Userspace can then pass the FD to an importing driver which will ask the
> +exporting driver to map it.

"to map it to the importer".

Regards,
Christian.

> +
> +In this case the initiator and target pci_devices are known and the P2P subsystem
> +is used to determine the mapping type. The phys_addr_t-based DMA API is used to
> +establish the dma_addr_t.
> +
> +Lifecycle is controlled by DMABUF move_notify(). When the exporting driver wants
> +to remove() it must deliver an invalidation shutdown to all DMABUF importing
> +drivers through move_notify() and synchronously DMA unmap all the MMIO.
> +
> +No importing driver can continue to have a DMA map to the MMIO after the
> +exporting driver has destroyed its p2p_provider.
>  
>  
>  P2P DMA Support Library
> 

