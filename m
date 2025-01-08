Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F6BA0600E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 16:26:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F065C10EBF1;
	Wed,  8 Jan 2025 15:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nog92lPj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE44B10EBF1
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 15:26:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdW08KipcwwTlPRkGQArqsiLj/rt63QNaUZOMYfg61vfeSuBBbQtozlxe4tagEXxC4HpodVb/ftNfzEN2jnk67LSnuph6PdiCjWfnf3uOxCNbnKRLg6mnFnnjiNOZDOjSaTm/xnLQ35udm9wcM2szoAoWGajWpUlsJF5EjTG/ginBF92N9MoDcaiqnyojN4IbY32C9gcvzzqgo+jhOVeUbl7i0kaE40J2D+dVajoj6eKGknfjtzN9OFPERJG9FYQuFBxw3dl14q7fElpL13/K+GXsF5OmL8cZ59Rq+QwwbZzf2Fzscfb7qiJvXgPSm/TTSnPMgJadai63nOdp1uPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5rkTErMfe8CC5GxlunhDeU1Bpr371i9i8RsZwoFEkg=;
 b=nEAQ9x6AEwPBXjwtHZRRSGaR4N6qcKjvygI+dspoOz3xl2T5atkOWNO2hKVyu4i+5JyWLZ8W/BYIkwXL3bhbmNNTqptB3JlShJ4FndRfik/nfocvwMiwL8TgE2V808d1g6Bj2El/qJraBy+4u7HH+i6DvZWJYGWp5p7YeGgZfyEG/nvoPZsgHpJs2K9H6Dgx2gOpG6Y78FdlC+qKIjlAQi1nmrAlpuSTBvubllGnw3e4I/bJMiG4hbBDDVRmwg0agEHWnnnQV1YjtE7kBNcmwHFnAF8zRXLlPMT9a/GXt/zJkuu8VHqBx9WNkrtVCsAgIkpymX+8/QRhL7qks/dX6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5rkTErMfe8CC5GxlunhDeU1Bpr371i9i8RsZwoFEkg=;
 b=nog92lPjyQ331vxwT4f0ncODzInFODdNL1xm4cLhA77uBlSfRF+JsNSVlMli0H5rG5Pa9NT/+9tX1y+csG/tihYpBgGRA/D3KR9fIoeikQ0V+OgvSLLNqUDQt1KnsKJMWOzqjBTt9j08NSg5NddSEUAweHSz63abLBpWT0uCOa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4041.namprd12.prod.outlook.com (2603:10b6:5:210::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Wed, 8 Jan
 2025 15:26:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 15:26:03 +0000
Message-ID: <5a858e00-6fea-4a7a-93be-f23b66e00835@amd.com>
Date: Wed, 8 Jan 2025 16:25:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, Leon Romanovsky <leonro@nvidia.com>,
 Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 daniel.vetter@ffwll.ch, leon@kernel.org, baolu.lu@linux.intel.com,
 zhenzhong.duan@intel.com, tao1.su@intel.com
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <20250107142719.179636-2-yilun.xu@linux.intel.com>
 <b1f3c179-31a9-4592-a35b-b96d2e8e8261@amd.com>
 <20250108132358.GP5556@nvidia.com>
 <f3748173-2bbc-43fa-b62e-72e778999764@amd.com>
 <20250108145843.GR5556@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250108145843.GR5556@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4041:EE_
X-MS-Office365-Filtering-Correlation-Id: ad192753-616f-43ee-acbb-08dd2ff8c34d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUcxT1V5dWczTnVTWmNLK3pqSCtGaGJHbFE4RmpKVDhhdjBRQm52a0E0YmxY?=
 =?utf-8?B?OWJYQjhCaWR3UGpUTTg0WTMzd05UenBJUGU1UUFENFYxZ2d0eFlCNmFUODJ1?=
 =?utf-8?B?WSsvSjM4bGxlSEx3RGZhclpuaG55R1kxWkZzZ25WOHdvbE83bDRCWXhIS0l3?=
 =?utf-8?B?djVhd0kxalI2RS9qNFYrWDU1MnVPTnd4NGtUNTQ1Vm85U3A4VmoyTGZ3MVJv?=
 =?utf-8?B?QWtpWDRwbG5QamQ5aFNkeDVmUWltTFJ1WG5HKzFhNmh5VGZyZWRNU25mdUlq?=
 =?utf-8?B?MEx6eEswRDZINFdVcE1vTHNaWUZycGdhSGVQaCs3cGRJaklaUDRrQTVVRE01?=
 =?utf-8?B?M1FKWVpIL1RSaTIvR0IvVUlCZHl3TlA0YmpmZFRuRU9pdEg3T1JpS2tjTjV4?=
 =?utf-8?B?OXV6bURBNGlmRHI1TVhTQWFHZ0NnNkVaWEdZMWFWWUFGWDFpYW1LV0NKV01D?=
 =?utf-8?B?UUNNWjJJNjB2VlNvQW5QSDVkTm9UV21DdVluZGVZZHVSdFdIbFZGeEYzR0lI?=
 =?utf-8?B?V01LSlNneG8vWkY4blFGQlc3N3Y2dnNhZzk0d0N0V2JJYmRuVVNsSEl2K0Nk?=
 =?utf-8?B?cUhqR0VUOTNjeGFJYk41T0lWcGlpK29PTXA4T0JaVndRUFVJWG9WeC9TN0RR?=
 =?utf-8?B?VTJJT1F6TzJaYTc3eEZwV1ozTUk1UWJISmgyZjd0QkpBUnR2bDl1NzNleUhx?=
 =?utf-8?B?QlZNa280c2VRMGMzMEp0R3dqejFnbVFWTjdidUwxRlVaMStGSzQ2dXJpU0lC?=
 =?utf-8?B?YmY4TVZXV1NHOEEzNUpEZE9zQTBUUVpoK09Qb3VyeldsWThFSUN3QVA3ckl0?=
 =?utf-8?B?SE5uK1NBZGx0djVFNXFKS1hFaWdjQUdPaE1WODRwcCtBaVVzOEZOcXc3SElm?=
 =?utf-8?B?ZHkwRkVwbnVsbmRXaXlNMHRYSnl5MUZreitheUcrZWVXMzZTT3VJMmluR2gz?=
 =?utf-8?B?VmR1bkpOZ005aFFpQ0MrQ1NodnlJSFlQQk5mZFBvRFNuRnRqR3RjZ0crcHkr?=
 =?utf-8?B?S2V4aVF2UDA1dFpERGpNeWUxMk1jYzZOSzZhUXRzN25UQ3MvYXFkbE5oS0pN?=
 =?utf-8?B?SHM1aHZ6WXRPcXJFRW9uS2NZbUVnT3RPN1VSNUdsbFFMckZOOGdsVUlrQlBI?=
 =?utf-8?B?R3Iwam04N3F3QXFqV09pOE8zeXVPWFlKS1kzQ2paZE5sekdvUjB2QmszeG44?=
 =?utf-8?B?OUtJZ0ZCMmw4WmovRXVTSGN1OGJYcEErdFpwMkpyWGRtd3BFRENBR2NndVZU?=
 =?utf-8?B?MFh3QUc3d3VLaVlnanIwSFVGWCtSS3o0NGM2SFl5ZWtDZnFYTmVpYW51dXdU?=
 =?utf-8?B?Wm0vVGRvTU9OOSs1MHVvMGlJRmhZcStQVUdMOUM0RVJ3aDd2ekR0VFpTb1hG?=
 =?utf-8?B?aC8zTFd2cEtGYWE0cTlrUUUzTzBUL1BQeFVVOFZRS2FmWGlycHRoZnhvZDhR?=
 =?utf-8?B?cVQ0RDRwaForeEFLL0gyVVFEdjcrd2xZMzE2bWdqZkdqZ0VKK0MrOHJ1QU5X?=
 =?utf-8?B?OS94dDAzSkM3cDhqNmZ1ZFMybDQ2ejF6S1VzOUpEUC9zaG5INFgrRDUzWE5r?=
 =?utf-8?B?UjVNNHZ6QjdzeU1pYTFjT0ltSHUxVDlKbG1SOW5mVTFwTzZlUDVCY1RQOWRt?=
 =?utf-8?B?bEVWM1Rwb2tvY01yNzh4YUM0bXRoN1dNUk1qSGdHY3Y3dHNGdmJWV2ZEZGVx?=
 =?utf-8?B?cGwrdkNmTmhqWERIQUJJa0pVaUF1NUFIVExQdmZZTDVQTEk5dE5vTTYwdHZk?=
 =?utf-8?B?MUNRV3hYbnV2UzczWTBqd1pDSDFDaFp1VGIvVXlxRWlTRjZIV3lzZktEQity?=
 =?utf-8?B?N2FENEpFMjVIQWZjUzVTM1g3ZFcrd21La1cyNG5mZjlCNVJBbm15UmwyVlgv?=
 =?utf-8?Q?UfI7V+r6sXg7t?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk1HdTAzcXVFdThMRWZGUGdWT3FNZ29PT0d4d2pxRzRyQncwYjdIT3dxWjQz?=
 =?utf-8?B?SFFRYW9xWmNuSEhRa3A5VkJhOHBFSG8xQjFQUGtWZUh0cEZ2VVZNMVRPSkhz?=
 =?utf-8?B?aFBSVzhTM1I2N2ZNeTRzYmNOdUh2TjdRRDJvakZhTjBuZS81VjNDb2xDcUtk?=
 =?utf-8?B?M054NzhDcnpvcTZka0VpMVVCQ2VHS0hadE5RR09RL1pOc3dpQVVpUnR4TFVU?=
 =?utf-8?B?OFNuSWp0QnF5Um83UWRoSE9wMVk5Y1NudmdBM0F2a0FUSjRuWmowb0xOdXR0?=
 =?utf-8?B?OFRTMXh5cndmejdTNkhxYnhBSjROQk1LcHQzOXNxV2VoRFFIQjVlZmphS3dK?=
 =?utf-8?B?V29QWDNkZllMeEFIR054aXNIdDhaUEVHaHFHWFl4QjlLWU1VeEsvNjFDeGUr?=
 =?utf-8?B?OXI4MEVJN3NTc2Z3a1AxaWd2emhFTlN1Qm5ENDkxSDFxa0xjNXZhRDBNeUM3?=
 =?utf-8?B?RDZ0eFpRbHpJUnVIMFZsVC9wSG5FbmxoMFVlQjdlYWg1Mml4NTVBdmpSbzNm?=
 =?utf-8?B?NHFhWFBvN3ZIVUhoSUIwY1Z3ZmdDTC9lTVFvUVk5Q3krQzB1aURHd1F0STR1?=
 =?utf-8?B?dGw4cVhDN3c5RTM4ZWk4eU1vSFQ3eXhXa2FUUWhmZCtIRmZqMmFjZkR6R2hB?=
 =?utf-8?B?MGIrTENySWZKbytRRytRUi82cFAwdVdNMXZjVnVSVUl3L1JNYjd1cC8wR0Fx?=
 =?utf-8?B?SllOd0FKSVF6MWl2ZytWcFBtSTZFS0VsTFBNd016Z1AyV3NRb0hvbkxKRWl0?=
 =?utf-8?B?Tk1hdFBsVmxtNkxlQ2pLelRwMTQ2N0hLa2RnWnNUQ1FkU0VsRUk2aWNvZGNW?=
 =?utf-8?B?Vjd2SE11czFybkRBMnJQYVJydTlzV0hzMUtuaGZnVmVkd3NETnhKWG51YmVS?=
 =?utf-8?B?YzBuWER0M2VwVUNHa05Pa0FvQTc1MjNQNDM4RkhFckpMT1c0SFZMQ09JK3Zz?=
 =?utf-8?B?MTJMUVloR1QwYzhGWndFZzROZ2FCVU1Ba2ZFejI4R0ZWUTJjN2ZtRWpaay9v?=
 =?utf-8?B?OGdUcnczMkk3Z1NxK1NEcHVaUzhVeFJMUEFlbVI1VmlxYzNzUnk2RTNCU25P?=
 =?utf-8?B?VlhoRXhxNmo0cnJpYzFwVmhNZmEwdzZWNHlqejU1K3hpZm5Tc1NvWGxYMGhu?=
 =?utf-8?B?RHpjUDNWY0Nab1FEYkg1SGZ3YXJDRHpsZ1VEdGlWZCtRL05rcDRZbEN5YU5n?=
 =?utf-8?B?bkVmcUZLMDlnUng3NElFWEttOGRLa3I4VUJqTWx3TEdyNU1Ja2ZKSHpTRHcz?=
 =?utf-8?B?aGRSa0pKcHMydzUyc1JwK1pSY0hFV3JJSlNXRW9Qc0haK2tXcW9XdHJkUWhv?=
 =?utf-8?B?MEh5bWJNbnFwV0dVdlF0cU5PdWgwbFBwSGp5bVhjZDFSM0ltSnNjUWNoRk1B?=
 =?utf-8?B?SnQ3RWRMNTQ2dzVCQVNXdTdDU09Vb1QvNkcyUlFya1pZeHRzNHA1WmVGNXZ4?=
 =?utf-8?B?YUhGTHp2OGJUd2xaMTBXQW90NzNuSFBDR05GcUhXVnBYb3A1S2IwcFZnZlNw?=
 =?utf-8?B?alB4N09yTkc0ZzFaemFvOXdva01wNVNVdUdreGpLeDdKNnppNnhwWnB0MVpr?=
 =?utf-8?B?aXBLK09zWHhmYnR0cHYvRWJVRjgxd2szZ0IwY010V1Iya2Z2WC8ra1F3M1Zy?=
 =?utf-8?B?U1hUb0NCUElUT1Y5bEJoR0tWMjJyYVM0MGFaUUgyZ1J2MVdXTTlYeDJyOGFF?=
 =?utf-8?B?ZzUyM3J0VUoxRzA4UGFhUnNGY21SQnNvUUljVW11M1kyWU5rTnlmVmsvWkZq?=
 =?utf-8?B?L0ZNcitldUZCTTlTbnFrbVNXVEF4VkhhNGlVT1piTjRycTVUck9tWTMrSmc3?=
 =?utf-8?B?d3dqNVFhaHhWUmI5NGxyenptdjJNVDdGREdDTFZwekd1dEViS0NKTDNZVjJk?=
 =?utf-8?B?cWY3Q3NOeTdTZ1hCOHZNN3ZoaW45SUVVU2pDK25qZDFUbXl4dmFDWWRxcVNi?=
 =?utf-8?B?S0tsTFBydi95VlVwSXlJNThWNUp4WmVuRFQ2QUYxUk9mNzZpQUlmU0hWZTVo?=
 =?utf-8?B?dCtJZzZING83TzRoUmViQ1NDN1ZUVjdCYkZtaTczcFE4U0wwaDdRNWlwTTk1?=
 =?utf-8?B?dEtrVVNWMlMwdENJaWdZRUpUbGZGSHZXWTcreE5uVkRhMWhoWkhZSUxieTht?=
 =?utf-8?Q?6LxV1RKd/ztOzTqc9PfIevguJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad192753-616f-43ee-acbb-08dd2ff8c34d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 15:26:03.2780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2KoFYhWyaoGl6vniW8wwJLyPcXqPO87p/jqTs5KBI6nejjwhDEE+/bPRSwboYkXJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4041
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

Am 08.01.25 um 15:58 schrieb Jason Gunthorpe:
> On Wed, Jan 08, 2025 at 02:44:26PM +0100, Christian König wrote:
>
>>> Having the importer do the mapping is the correct way to operate the
>>> DMA API and the new API that Leon has built to fix the scatterlist
>>> abuse in dmabuf relies on importer mapping as part of it's
>>> construction.
>> Exactly on that I strongly disagree on.
>>
>> DMA-buf works by providing DMA addresses the importer can work with and
>> *NOT* the underlying location of the buffer.
> The expectation is that the DMA API will be used to DMA map (most)
> things, and the DMA API always works with a physaddr_t/pfn
> argument. Basically, everything that is not a private address space
> should be supported by improving the DMA API. We are on course for
> finally getting all the common cases like P2P and MMIO solved
> here. That alone will take care of alot.

Well, from experience the DMA API has failed more often than it actually 
worked in the way required by drivers.

Especially that we tried to hide architectural complexity in there 
instead of properly expose limitations to drivers is not something I 
consider a good design approach.

So I see putting even more into that extremely critical.

> For P2P cases we are going toward (PFN + P2P source information) as
> input to the DMA API. The additional "P2P source information" provides
> a good way for co-operating drivers to represent private address
> spaces as well. Both importer and exporter can have full understanding
> what is being mapped and do the correct things, safely.

I can say from experience that this is clearly not going to work for all 
use cases.

It would mean that we have to pull a massive amount of driver specific 
functionality into the DMA API.

Things like programming access windows for PCI BARs is completely driver 
specific and as far as I can see can't be part of the DMA API without 
things like callbacks.

With that in mind the DMA API would become a mid layer between different 
drivers and that is really not something you are suggesting, isn't it?

> So, no, we don't loose private address space support when moving to
> importer mapping, in fact it works better because the importer gets
> more information about what is going on.

Well, sounds like I wasn't able to voice my concern. Let me try again:

We should not give importers information they don't need. Especially not 
information about the backing store of buffers.

So that importers get more information about what's going on is a bad thing.

> I have imagined a staged approach were DMABUF gets a new API that
> works with the new DMA API to do importer mapping with "P2P source
> information" and a gradual conversion.

To make it clear as maintainer of that subsystem I would reject such a 
step with all I have.

We have already gone down that road and it didn't worked at all and was 
a really big pain to pull people back from it.

> Exporter mapping falls down in too many cases already:
>
> 1) Private addresses spaces don't work fully well because many devices
> need some indication what address space is being used and scatter list
> can't really properly convey that. If the DMABUF has a mixture of CPU
> and private it becomes a PITA

Correct, yes. That's why I said that scatterlist was a bad choice for 
the interface.

But exposing the backing store to importers and then let them do 
whatever they want with it sounds like an even worse idea.

> 2) Multi-path PCI can require the importer to make mapping decisions
> unique to the device and program device specific information for the
> multi-path. We are doing this in mlx5 today and have hacks because
> DMABUF is destroying the information the importer needs to choose the
> correct PCI path.

That's why the exporter gets the struct device of the importer so that 
it can plan how those accesses are made. Where exactly is the problem 
with that?

When you have an use case which is not covered by the existing DMA-buf 
interfaces then please voice that to me and other maintainers instead of 
implementing some hack.

> 3) Importing devices need to know if they are working with PCI P2P
> addresses during mapping because they need to do things like turn on
> ATS on their DMA. As for multi-path we have the same hacks inside mlx5
> today that assume DMABUFs are always P2P because we cannot determine
> if things are P2P or not after being DMA mapped.

Why would you need ATS on PCI P2P and not for system memory accesses?

> 4) TPH bits needs to be programmed into the importer device but are
> derived based on the NUMA topology of the DMA target. The importer has
> no idea what the DMA target actually was because the exporter mapping
> destroyed that information.

Yeah, but again that is completely intentional.

I assume you mean TLP processing hints when you say TPH and those should 
be part of the DMA addresses provided by the exporter.

That an importer tries to look behind the curtain and determines the 
NUMA placement and topology themselves is clearly a no-go from the 
design perspective.

> 5) iommufd and kvm are both using CPU addresses without DMA. No
> exporter mapping is possible

We have customers using both KVM and XEN with DMA-buf, so I can clearly 
confirm that this isn't true.

Regards,
Christian.

>
> Jason

