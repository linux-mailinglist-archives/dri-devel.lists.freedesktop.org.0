Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B67AA0537
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 10:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CF310E2E9;
	Tue, 29 Apr 2025 08:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oyDpcRt9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6214910E2E9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 08:12:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdcYj2A/dTxctByKgZJo9x0DN1oSP/kqdwc6NP/44SIB3qPBVqvjGuaFvr0BdnxZGTsm2IuK0YEjvrrnLnklclsezCLpGjgpL6nNjY+05LK+w/zAre/Kzn/Z+/HnoeATsx/+jmACKWygscGTnXto+j/EomB/C8u+k36UOh8ThoUHp57FqMveOZ9ie0h+ZKh6JUBbTZ3+2jep65Wz52kZhplWoAc4V5yQq60ZaaZcPdO996y3Od01qMFzY3ckZsDnZPSeJFIQPg4+1L+GxYtyoS0uiNm3w2dNdiRO8KNWq7RO7cFgHnNKNhpnApN+LgJOHyF6NEOv8UDGWCcHKzrlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WeX3rMeEJ2I+horWWVpFZy1fQBt/2ys/vpfhp/9FGmg=;
 b=igRq+eYc9dsdMmIqumMMMHKz63vntqg2LlwQ4fL1Ow593776JL9lB4Sj0zzkOJg3Qjtd+Eo3QdvinRogGWyrKnVsTIVLEils8iZ8i2tYjtCgoE1bXT7lNc9+BVT1TeNfi5FFj5ZogmR1RV9b3aZv1G8/ievU1G3PiVjc4cqWRQKsYyswt4LUzTLRaQ/OPxoq+bp6qs7MqP5/9jNYc9ss6NuXSjVcNO24PCAYYq9qcjrL9Jx/quNIJuQAaokj8A6NH2vQPZm4oZT3/9nqw9IytrUKhThld2khuUtbNApqeaYryhshJsZZfCAzMW77RIpFy8tpyHREKqzqK0iGMP1xBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeX3rMeEJ2I+horWWVpFZy1fQBt/2ys/vpfhp/9FGmg=;
 b=oyDpcRt9WOrEedgZIbPzYIk5FcZB/S+lcJ35fdgeKNQarDlD7EQiElOix/rSVogO48df56tZQ8puQllNjaTv2pIiTsAYRKniK41Q7Gc0p0UvgD5OwzDj1y0bnp2VKAsrnQ00LOrtZSwdUbhF38IP19+YtDithQ1ugJWUVzN91HI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6836.namprd12.prod.outlook.com (2603:10b6:510:1b6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 08:12:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 08:12:55 +0000
Message-ID: <72b7e968-10cb-4db6-8a1a-dc39187c7855@amd.com>
Date: Tue, 29 Apr 2025 10:12:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dma-buf: Add DMA_BUF_IOCTL_GET_DMA_ADDR
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <20250410-uio-dma-v1-2-6468ace2c786@bootlin.com>
 <d19639fb0fbe5c0992a69d7783e6fad91c50561b.camel@ndufresne.ca>
 <aBB0NNOg47XHIjpq@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aBB0NNOg47XHIjpq@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e408065-92ac-422a-d264-08dd86f5a4f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTNnYTd2QnBYY1pBY3A1REZ5eDdCdWdhc0xQTDFzeStHWURRbHNtVTBUdmFH?=
 =?utf-8?B?RWd0bWw4MGZpVGZDb0loU0EwSE9MQ2RRS0dCOUx2d0M1blRtTDVSQWNmbjZr?=
 =?utf-8?B?eDJoVHNvK1hKY2FtNUhIazZidk4vVjdBKzNCdVMrOUdWZ1pxdzdVVEdBQzZF?=
 =?utf-8?B?WUpwVzlZTWRMTVl6VG1UMGFaZFZnUEZqSjExaFdINVBNb0dXLzNhUU56cGla?=
 =?utf-8?B?THlZNW9HcnhSaVBxam44Qk1JdG1XYTJSaU1BUDYrZ1B4S0RVK2o1OXB6MVBZ?=
 =?utf-8?B?N003Y2FJNkFHK3J4NlJ3cTZKYnhWS3lVRWk3TkFQK3ZLb2lGWjdNMWRKUnZv?=
 =?utf-8?B?WUFpU2U5cW1DeldSd0RsSGdyNlF1K3htWlMvR0dYbkpaOTNYMFRKYnZ4dWdo?=
 =?utf-8?B?bVF0aXhDaXl5bUxMeG5IWkUxTkpzejNyZGxZVkY1U2ptQlpGb2VFNXVNcW1a?=
 =?utf-8?B?ai9DdVVzT3QzUExOSW8wOXJMajI5K25yblV1di9lUVk3ZkNCdzVXZEpUblh0?=
 =?utf-8?B?R3BRNnRNR0hMd1Z4T3lxUGpOWktEeFIwV1FXK0J2T1lzMUlsZHMwdTZ5eXVW?=
 =?utf-8?B?VE56QkNtazE1M0cxUmxKaXBuWlNCQjFJY0QxNHFFS0hZekpxWE9EZFZVVUp3?=
 =?utf-8?B?dytGUzhab0I2ZS81VWdjcCtwYkZvak5xTXQzWkZBUWxMbVZEL09va2tHcG1a?=
 =?utf-8?B?Ujc4QUFOTDZoVm8xcmxPVmI5cy9pYjU0dHR4ZGFMd3BvR3RmbnlmZVZrRW5h?=
 =?utf-8?B?OTE3dzR5QlNwQTZnckFvTDBVbmlQWDhBcEpTZmRMZmJMSVNDcVlST2FNai9y?=
 =?utf-8?B?c0VRTmNvNEsvU3NITG0xSExiQkpGSEp2QmNrVE10c1A2VGFqTnpMdkRJVy9l?=
 =?utf-8?B?bHh6K0lLRWVWOE9RMmkxNEpZOU52VU5OS1ZxbkVEWFBJbVQvRGg4RGE5d1li?=
 =?utf-8?B?MjBUeWVIYUtlU2kycGZrbWdxWW9WTjNBcDQ3UE8wc09tY0ZFZEg4VW8zOGlR?=
 =?utf-8?B?NlA1enZJbWlkSUNZVS9Cd3psUktubTM3MlM1M1VwLzVEVUVSV09aUXZsOWdl?=
 =?utf-8?B?ZkJlcHRNdytVQ2RkblRZcXI4amxvQ3JXSDdkNWRRNThvdVZIajhnRnV5ME9t?=
 =?utf-8?B?NHhvZzVybzZMSTJRZjd1UlNrQXZWbVJ0U2UrM3JQM1c1dGFwbmJsVWZSUWNF?=
 =?utf-8?B?Z1FKOWMwaXBDVnlWS2poNzB1MW44cTRaUk1JR05Ra01NcUppU3RhQjF6a2xT?=
 =?utf-8?B?M0p0ekFQNm5pTExxQjA2b1lINnI0MEZYU1JGS2h0TzRRcFdtRUZtSzhGYWpp?=
 =?utf-8?B?L25TTTF3TmlhN05pc1o0NEZ1NHljRGpUeTdTUVJXRzBDNVE4ZVlITVI3VlBF?=
 =?utf-8?B?WE5OQUNHSTg3RDVIK2l6ME9oQ0ZjeG5tRG83S0FxYkNVWHlIYTh4SGVMRDUz?=
 =?utf-8?B?RmJwTWNhTE5GVnBRck5yYUxvamcvamdBTEpNNkNGbENSNXArTlBCVXhFUkdq?=
 =?utf-8?B?WXZSY25JUnFQVS9FN09rUEd1VzUzdVdDbzJhd1p1QU81bUN2YnpCUjRmTnI4?=
 =?utf-8?B?WTZxSjM5UjI5OWd0Z0U1VzhTME9vaWpXYS9YOGdYeXYyRjlLMTdoL2hNMUtN?=
 =?utf-8?B?eFE0dE9EbHp6cmF3dEV6WFIwbW15dlEvZk1leFNUdmE4a25Cb2txSmY4a1VX?=
 =?utf-8?B?QUc3U2dJajlCRUF3Z0t0MHBjUEJQeXZRWmFnYUNKdEJsaWlSaXNTL2djbkhx?=
 =?utf-8?B?YUlGSHg0QlQ4ZlhndHNHb2RFYXMvN2srb2lVSXVzdFlWQWxYWEtyTHJ1Tkw0?=
 =?utf-8?B?em1rMGNhclhDa1h5RHhyeXg2UitQMlRMNzhRakRQOGkvcE9JUG5zclVRVE4x?=
 =?utf-8?B?ZDB2SjlaZEVhQkl1VXFWUm0vSEw5d2EvdTBKS0ZIRFhWeUg1V0ZsSTRKa2xR?=
 =?utf-8?Q?sJ2zybJJyKY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2VTZ2lxaUhMR09aWFlzMWFHa0l2M0ZUWTR1MTdGTWhPS1AyM2pTYkxZb2xR?=
 =?utf-8?B?K3F0Vmk2ZFdmdkhRNDROTm5uL1BndzkrWGFtVnJCelVtTjlFNXZlQWNPY1da?=
 =?utf-8?B?L3p0TXZZR1FPb1JsbmgzZmVQMzVnTTdVaGNHVmNQNGdVZkpGYzlMdjZ4VjQ1?=
 =?utf-8?B?UHhTWHdiVzVPR1RUbjJCRmV6Y2NkdDBrR0lUY2lOc0RTTS91ZC9mS1pzM2Fa?=
 =?utf-8?B?WFA1STRmTGlWZGlDM3p6Z0tXUWZJRDBBcjBxYnRWRG1Ed2pCS0R6VTg5Y3lD?=
 =?utf-8?B?ZWwrREoyamJFYlZPVHpTY1dZam5xRkhqTjdyaWFjbThLaTZ1U3Zic3lmRnJL?=
 =?utf-8?B?VzI4bjFPTWRRNm1SVEJGQXhrQUhRNWd1d3NHU1FQNFF4K283WlZ3ZjhONlZa?=
 =?utf-8?B?a2xnY3k4d0pDZGl6UkJwd1A4YTNsS3YvUEhCd2hIbmJQQlkrbUNaRnNDZ1B1?=
 =?utf-8?B?QXE5NnlDV2M0N2MvQWh4enBwRnU2eXBnUWFDRGVtOE5xNjdUWDc4dG5aTE5K?=
 =?utf-8?B?ZEtXZmRVK0dkM05Na1VlMGJvZHRNQWNZMkhRUVhZQ3BwZStvelQvQ3JmSjVL?=
 =?utf-8?B?Q2hNc0xheDRBNHkxTllRcCtVU3ZhdHlmY1BVcms5L1QzNlg0MVBPczNrUkEv?=
 =?utf-8?B?amxyNDE3WkJOanNZNUN2SGdXeGRyK0YxbmdnTGdmSDRIU05IUVJJUW93UXQw?=
 =?utf-8?B?bmFGZDhnbUJNK083SjBoOTQ1U0hjTUhhWXpoWkVhTVJwaFFtOEpaTXZBaDdK?=
 =?utf-8?B?bFM5L3pPWW04MTFXMHhFN0lOdWNIQkJMZXVqWVZvWTlRUGlSc0FBTnNkc3lV?=
 =?utf-8?B?N0pSVjY0UjdDcmtKb2R4ZUtuQWhkL2VjU3RUc2NDbnRjN1FmMVpSWXNUbDdw?=
 =?utf-8?B?b2p4MlFETmpNSzFUdTcrWEFXM0c4Uk1Bb1RBNlk1QnBGbFZUN0RQT3o4OWh5?=
 =?utf-8?B?OUZzelIxSVM5Yks4OTIzMnZSaGdqWkFwL01QYlA1bXBFSmFKbDZKcEVqbXJo?=
 =?utf-8?B?c0VIWTl5ZzJ3d05OR2RURGRTQVFOSGVnSU1EK2NMaTVUTDdUaFBXR1JDVHNX?=
 =?utf-8?B?Q2FIWHlzMXFDMzk5enBRQlVycllrcTAwa3RuS1VNb3ZTV3dzVWR5RTg1YlJ6?=
 =?utf-8?B?TnFFODljQUVRcElFRFR6WWpwNXlZQzNNSXFhTS9NeENmRjlDeENkY1N5VjdH?=
 =?utf-8?B?U0cvWVpBeVBxbUVvTUc5bGtEYjZNWjArT08xU3A3dFBXV3RQN0J0Y2dtR1g4?=
 =?utf-8?B?N2t4R2FsMVpDZE1YY1RvN2pYVVhEYVZjQWFqaXk3cVNFUHc5bzVpbWlPc25M?=
 =?utf-8?B?UkFSTlBaa25nT0U2Um1PQ3hYLyt2N2VRRnEzM1cvZ1lWaHN4QkFFejZFS3Mx?=
 =?utf-8?B?T1lFbldQY2ZkeHFiWXMxRGlxSUN3dmtNM3NNZUtpWHFyVW4wR2FnOXpRL2U2?=
 =?utf-8?B?cVU2SFg1T0xLVzd4SEVzK0xoYjFqV1F3U3dvd3FQYXVrQ1FHa094d2RkSUlO?=
 =?utf-8?B?WU51V0ErTFRDTGJ6dGoxWkpMNEd2S2thSHlHck1OM0JwNXF3U253TklTU0RX?=
 =?utf-8?B?ekphOFhZVG5sVTRBTFJOd1p1Um5KLzg1NmJlcjUwNDU1Y1ZvRHpwdFE2S00z?=
 =?utf-8?B?UWVmb2FKZVZ6Uk51UTFIRk04a28vN2xOc0NUaDE2U0FoUStuVThnUE40M3po?=
 =?utf-8?B?cisxLzhhL0NjMmpFTjdieFQ4UFBDYWwyUDJXRjliUmZGa2owYTFMdWJYRU0y?=
 =?utf-8?B?U2ljbVc3Wm9pb01UUFZhVXZzRVRnZDRqS3czcXUwMHNJaVVtbkNlSGVaSUFi?=
 =?utf-8?B?YmxCNzF6RTAvcWRLOTV5R3lycENpL1l5WmxIdWdVMlFxMFJxN1dRbjZ4aTRT?=
 =?utf-8?B?cXJwcjlRckE0WjFVTlZLM3pCMkI4QTRHaHV1VUt1WGx5ZTBnaEZwYTViSTBF?=
 =?utf-8?B?SzIweHVDQW9UYjRwYlhzK3czWUNZS0F2MlJ1ZlloVzBTWk11alhxeGVjaW5W?=
 =?utf-8?B?b1FGc2l5bm1VWTN6WG52RllDaXpyeHVpdjVHMm5Jb1Q0QTljdUJHem9IWEVD?=
 =?utf-8?B?dnMwYzFsVE9sNVF2Mktyb3BnT29leitmWnY4dzBtc2xZNTVWRFQwc1BmS2g1?=
 =?utf-8?Q?65uEzf6HUPsNFCBPYvruzc67i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e408065-92ac-422a-d264-08dd86f5a4f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 08:12:55.0143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ICx6Ei5SKdrpVlS5qFpD7eczb7wJMSn9sq4l0BkV2Jm+ImE9JRyqhmHk46Ho6la
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6836
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

On 4/29/25 08:39, Simona Vetter wrote:
> Catching up after spring break, hence the late reply ...
> 
> On Fri, Apr 11, 2025 at 02:34:37PM -0400, Nicolas Dufresne wrote:
>> Le jeudi 10 avril 2025 à 16:53 +0200, Bastien Curutchet a écrit :
>>> There is no way to transmit the DMA address of a buffer to userspace.
>>> Some UIO users need this to handle DMA from userspace.
>>
>> To me this API is against all safe practice we've been pushing forward
>> and has no place in DMA_BUF API.
>>
>> If this is fine for the UIO subsystem to pass around physicial
>> addresses, then make this part of the UIO device ioctl.
> 
> Yeah, this has no business in dma-buf since the entire point of dma-buf
> was to stop all the nasty "just pass raw dma addr in userspace" hacks that
> preceeded it.
> 
> And over the years since dma-buf landed, we've removed a lot of these,
> like dri1 drivers. Or where that's not possible like with fbdev, hid the
> raw dma addr uapi behind a Kconfig.
> 
> I concur with the overall sentiment that this should be done in
> vfio/iommufd interfaces, maybe with some support added to map dma-buf. I
> think patches for that have been floating around for a while, but I lost a
> bit the status of where exactly they are.

My take away is that we need to have a documented way for special driver specific interfaces in DMA-buf.

In other words DMA-buf has some standardized rules of doing things which every implementation should follow. The implementations might of course still have bugs (e.g. allocate memory for a dma_fence operation), but at least we have documented what should be done and what's forbidden.

What is still missing in the documentation is the use case when you have for example vfio which wants to talk to iommufd through a specialized interface. This doesn't necessarily needs to be part of DMA-buf, but we should still document "do it this way" because that has already worked in the last ten use cases and we don't want people to re-invent the wheel in a new funky way which then later turns out to not work.

Regards,
Christian.

> 
> Cheers, Sima
> 
>>
>> regards,
>> Nicolas
>>
>>>
>>> Add a new dma_buf_ops operation that returns the DMA address.
>>> Add a new ioctl to transmit this DMA address to userspace.
>>>
>>> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
>>> ---
>>>  drivers/dma-buf/dma-buf.c    | 21 +++++++++++++++++++++
>>>  include/linux/dma-buf.h      |  1 +
>>>  include/uapi/linux/dma-buf.h |  1 +
>>>  3 files changed, 23 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index
>>> 398418bd9731ad7a3a1f12eaea6a155fa77a22fe..cbbb518981e54e50f479c3d1fcf
>>> 6da6971f639c1 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -454,6 +454,24 @@ static long dma_buf_import_sync_file(struct
>>> dma_buf *dmabuf,
>>>  }
>>>  #endif
>>>  
>>> +static int dma_buf_get_dma_addr(struct dma_buf *dmabuf, u64 __user
>>> *arg)
>>> +{
>>> +	u64 addr;
>>> +	int ret;
>>> +
>>> +	if (!dmabuf->ops->get_dma_addr)
>>> +		return -EINVAL;
>>> +
>>> +	ret = dmabuf->ops->get_dma_addr(dmabuf, &addr);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (copy_to_user(arg, &addr, sizeof(u64)))
>>> +		return -EFAULT;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  static long dma_buf_ioctl(struct file *file,
>>>  			  unsigned int cmd, unsigned long arg)
>>>  {
>>> @@ -504,6 +522,9 @@ static long dma_buf_ioctl(struct file *file,
>>>  		return dma_buf_import_sync_file(dmabuf, (const void
>>> __user *)arg);
>>>  #endif
>>>  
>>> +	case DMA_BUF_IOCTL_GET_DMA_ADDR:
>>> +		return dma_buf_get_dma_addr(dmabuf, (u64 __user
>>> *)arg);
>>> +
>>>  	default:
>>>  		return -ENOTTY;
>>>  	}
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index
>>> 36216d28d8bdc01a9c9c47e27c392413f7f6c5fb..ed4bf15d3ce82e7a86323fff459
>>> 699a9bc8baa3b 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -285,6 +285,7 @@ struct dma_buf_ops {
>>>  
>>>  	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>>  	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map
>>> *map);
>>> +	int (*get_dma_addr)(struct dma_buf *dmabuf, u64 *addr);
>>>  };
>>>  
>>>  /**
>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-
>>> buf.h
>>> index
>>> 5a6fda66d9adf01438619e7e67fa69f0fec2d88d..f3aba46942042de6a2e3a4cca3e
>>> b3f87175e29c9 100644
>>> --- a/include/uapi/linux/dma-buf.h
>>> +++ b/include/uapi/linux/dma-buf.h
>>> @@ -178,5 +178,6 @@ struct dma_buf_import_sync_file {
>>>  #define DMA_BUF_SET_NAME_B	_IOW(DMA_BUF_BASE, 1, __u64)
>>>  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE	_IOWR(DMA_BUF_BASE, 2,
>>> struct dma_buf_export_sync_file)
>>>  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE	_IOW(DMA_BUF_BASE, 3, struct
>>> dma_buf_import_sync_file)
>>> +#define DMA_BUF_IOCTL_GET_DMA_ADDR	_IOR(DMA_BUF_BASE, 4, __u64
>>> *)
>>>  
>>>  #endif
> 

