Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9671EAB6AD0
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 14:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE30410E621;
	Wed, 14 May 2025 12:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0J7oIlKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8CC10E621
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 12:00:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXTLcM3MzBGLTvOPKT889+X10pn0SDGbZGDdzAOlf9MpZBAACOWzviWXW7bZUPPCbaPoJn+X+hhif6qb5tEapEGTBQ5cyL+GoE9B2v0S1pBLq4EfWsZZ3FAUe7MqhCY72p2pT5/4fnsfLD0Z3gitPVg0fGOwqBdNQQb89K2ywzLDaXCPHp1jdT8HyV/fjfC6ATaLmGeveb7Muk5NmCCYCPIZW8v1m6G+Bydqs886ZH6KbbeassfC8ndD20vqxlSKEAQKIiWkcYw6P8BX6+fKhOM9o8SpWNRNJ1eP+dzc5QKoCD0t6xn7yLzICMYpYneo2wbxsKTqeUcDfKJrQOCJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40U4+DIcUabRTX0XiLlZhNP3UU8tOLeSUD3yLd+nnz8=;
 b=FNsE7+RyJkMnCo53bVbYwY4QGdCul9EMhUvk2N3WITsA+D9IafYHk72NSU/mWo86Q+fd2QfaBb08gpsEjl+Eoz6fQ+TjBJx0qDXNshb16dWev8v9j/eK7U7kdkG5SwLLvd34+8YXfSAp4dDA8Es9lTllkE+zPWDKfvMnVlZ5v/BgvS2mapGbY2lFR0RATWYMFvdPH3Rp4gz2WKGbt57FH/wK+ZSYTjvQq00tdu1VuNjurjqa4rfLwQz+RimvCwYNYZCXpgzlrSzdlRc4xamgbcTpo13KGyVwCJ433Qo7MiNfT4IFcqUdfa3H5WkMVt0Fi4w05zcclIaflAZJNr6x7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40U4+DIcUabRTX0XiLlZhNP3UU8tOLeSUD3yLd+nnz8=;
 b=0J7oIlKymUaBHQx/s7BxTj0PqG+wQqDfStEAEABHSfRTPTWALM55y9W9qubqW7GfQObeIrDIjO+V9fMYYI6drvWXeqZbGqEjCtvjh2KxCV5qLy3/U09FHclwueivXP+wPGnRH02datjrfBuwqJh1sbwyqizXPvZeF505tzxGLHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7884.namprd12.prod.outlook.com (2603:10b6:806:343::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 12:00:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 12:00:18 +0000
Message-ID: <50092362-4644-4e47-9c63-fc82ba24e516@amd.com>
Date: Wed, 14 May 2025 14:00:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmabuf/heaps: implement DMA_BUF_IOCTL_RW_FILE for
 system_heap
To: wangtao <tao.wangtao@honor.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "tjmercier@google.com" <tjmercier@google.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "wangbintian(BintianWang)" <bintian.wang@honor.com>,
 yipengxiang <yipengxiang@honor.com>, liulu 00013167 <liulu.liu@honor.com>,
 hanfeng 00012985 <feng.han@honor.com>
References: <20250513092803.2096-1-tao.wangtao@honor.com>
 <fdc8f0a2-5b2f-4898-8090-0d7b888c15d8@amd.com>
 <5b68b2a50d48444b93d97f5d342f37c8@honor.com>
 <ef978301-6a63-451d-9ae6-171968b26a55@amd.com>
 <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9f732ac8b90e4e819e0a6a5511ac3f6d@honor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:208:32a::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7884:EE_
X-MS-Office365-Filtering-Correlation-Id: d298a41a-252b-45af-d798-08dd92dee567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dExIUmprVUdmNmFlcTNFcXJWNW5hYTdPMnQ1R2l1Q1hVR2RGdnRaWkZya29J?=
 =?utf-8?B?cEMrOG1CdlR5Q0VJdnJzbU9KSHBjZWxJRnZ1MzJZMG1oRDhETGU5aUYrSmtQ?=
 =?utf-8?B?NU9nK1B2eUVFU3RiTE95VU5RZkNUTFhCUTlCTzV2bS90Ny9WY2pIVzFPWWFy?=
 =?utf-8?B?M0RPcWl6dUVMbFp0ckFoOTUxSFZjUng3TS9kb3hSandSbzRxSm9CVjdzWWF3?=
 =?utf-8?B?c2VJTFdOUmNNcURET00xdFFza0JqVG1UV1A2SEV1WURRdkVxbElocFFldEZN?=
 =?utf-8?B?VlZIdkVnaEdQeExwRGlIK1NzdklvUWJFWC9uUTdrOERxSlZKZTAybHpvRDE2?=
 =?utf-8?B?RG5JL09OZzFVUlAzR0VxOHlGRlllbkFtU0huU0RYczhKUFdiallXeVNlZHYx?=
 =?utf-8?B?UEFiUi9pRmJzNFlnUCtYbXlTcG1zeCtCWFNZRWs0NzJEb0V4YlZFd0d0YlFo?=
 =?utf-8?B?czB6SmRnT09jQXJGV2crNUQwUkNwM2FjR0FRdndOdHRKMUVUWFZkaXFSSU9U?=
 =?utf-8?B?ZzByUE93eEZOQjgzMEh6SXJIUmNSOWpZQ2c5dHkvK2lQbHMzWWNHbUlFYnNm?=
 =?utf-8?B?SVBOMUtRQmdlSWh6bTVnbzZHZVoxTk5jbHdxY1VlTS9ObE5rTEJLdWdYY0pU?=
 =?utf-8?B?TnJCWWp2N1A2azRvek90NVlMbytyckZHbVFNNjRjK21NTHlTbk9URHVIN3Vy?=
 =?utf-8?B?dzNTS0xvM2xHQkZqR0dCZ25mVEJZZ043MU81cVVZLzVwc3hhNVBrbXBrNlpV?=
 =?utf-8?B?YUZ1YXZVMlloLzNJV3pjMmJvaUVkb0w5K0wrcHJsTjMvV3F3NFRqYlF2aVgv?=
 =?utf-8?B?cFhDRE9HTHR1dnF0b3hpTzdSMCtKYVdpVUZyR0F0WmZ1TlEzbjB6OUlEc0xh?=
 =?utf-8?B?ZkJMS0F0ejk1NXI4VEZNeDZrVFVLTFF4dHZ6ZnRMYmdPeU9jQWxkVi9UQmhL?=
 =?utf-8?B?L2x4WW8zUldLWUpEWlBPdVhYcTJOUHk5cWJqZjBZUXpMekt1eWZxZ0xiMFpY?=
 =?utf-8?B?VUViU05TWFNINnhwNThmMEQ4UVU4VWNyQnhxQ2g0Y3MxOTJrcWZHOXU1UUs3?=
 =?utf-8?B?TU5DcFdTOGNnd1BpK1lpRXBHSGZCb28yWkZhY0FQOTdQWWc3VzhJWDNRd1hW?=
 =?utf-8?B?S2NjNWNqU1BWUU5UZzVlSTZmZ0NSL2ZseitSNmkyQzRWYUwydmRJYUNjM1Ew?=
 =?utf-8?B?akhWMlB3Q092U0NJRlNNamYxMTV2cUJkQXlQSngxR0k0TzY0UFUwVTk0ck1R?=
 =?utf-8?B?MDBnb2hmcWthQmZaemNYSXlCTElzY0R4Q05LZ2x3OVBzYTlNd0lwVnpkOEY5?=
 =?utf-8?B?bjhYdEZrcE9HMHRlRUFzelFSTjhvd2xKWXlGaVJjKytUeGpqd0NwQ3laMjVU?=
 =?utf-8?B?cHVVRE1LU0VoRk5xMnBQN1RpOWtoeVkxTWtKcGpvZTZUd21EMDJjdDlDSG93?=
 =?utf-8?B?UkVYaXQzTHNVSGVqSHdkVDhmV3dURnNnTTR0YkpLSWQreWd0by9LTHQ0dm5B?=
 =?utf-8?B?MHFTRXM3a2VaRy9mZ1Vnck5QOVNsNVVVUTZ2eldJR0N4RkladHhLZWZNVlI5?=
 =?utf-8?B?VXY3UG9IVUZZZGJnYjdiT003bStOc054R3EwdnhYZ3hQNU9xeEVKdlVFWkVi?=
 =?utf-8?B?S1lEeS83SkplNkFQRFNWcHZKTGZiTWhVU0M5ejFlb0IzcVhmeVpCSk5Xb1V0?=
 =?utf-8?B?Y0hSK2cyL3NlS2VZRWFPRDY0NHpES3FlVXlKOUVHTnFXTmh4SE13ZC84USt6?=
 =?utf-8?B?ZkdqQ2lhVVVkd3RrSW92U2cwb0UrRkdhWFpJVXZKMnhUenpycUhBNUJTa29l?=
 =?utf-8?B?T1BVUXEvMUZ2QlZwdUY3Z2ZXTUdiZTJRd0VrM2FRV2NCejJ5VFNKSVgyaHZZ?=
 =?utf-8?B?WEpwVlArQmRFYjZsZG53aTg4UzJLdjAwWWhWUWVyL3QyNndhN2s3WkVubWR3?=
 =?utf-8?Q?JVEhMuBzths=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2d1MFV6QW9pRWkzVWRaYXMzL2N5WGZ1NzVYQmJDeW1VbWJlZDRPbldNNmR5?=
 =?utf-8?B?b0JFUmZ1bFNCUW1teWVGK3BWRmJhaDZxZ1hZakpoem94S3d6clowUTJteG5n?=
 =?utf-8?B?a1RvQVY1bzBlb2VSemJ3NmJnM1JwYVpoVWhjMzZTVjVORFBOMEUvcHBtaGRu?=
 =?utf-8?B?SWxFQ3Q1UjRFUU05dXVPcGMyK1pVTnhYcFF0Z09wb2hQcWlBNWNkTEw1ZU8y?=
 =?utf-8?B?RUk2QVBXWGpZamE5RjFFTWx6Vnp3U3RnL2Nma0dtSGdFYWtpcWJOUDA5Nnpo?=
 =?utf-8?B?bE1lcEpnKzZCcWlUdW1YVWtYeXRNQ2ZqdUpNOTNYc3pTRUIvRHExVjlhUXFr?=
 =?utf-8?B?ME1GK0ViMVkveXZLS0JMTFhWeEx4TGtLK0V6UjRBUW8xcUxUNEFmOWx6bmlE?=
 =?utf-8?B?aFNPQm45QVFPcytQdGNiRDlwNnZKOUxGOG92dzI4KzBaNFFpdGQzalZuTktL?=
 =?utf-8?B?L2gzVGVSdFlQNC9SVWthQWphSWczcTZsL3BNcklkQ3MvRi9QN0t1V0RPSUI1?=
 =?utf-8?B?ZUJyR1N0S1pOdEx6engzc3dKSlRtSDZkTm1DcGladmNlUDVsTGIxVzRMaGpq?=
 =?utf-8?B?RzhjUTUyZTBTckR6M2pHMUg4UENqbGxraFZGNHVEQTl5dndmWU1mcGVOMmlP?=
 =?utf-8?B?TkZNbnl5d29kMUdrUGkrSVMza08vTTdWVzQzMG8zZlBzYWFSOEc3bHNIeWtp?=
 =?utf-8?B?dHdkdFdrQ2ZjaVRraWJMU1BJWEh0V085dy8zVW8vbUJiYlFKanl5My80WFJl?=
 =?utf-8?B?OHlwamtndmRzSVJTcTNHQmxzYnhJMzZuT0RXQjFheHRYRkgwaWFyRVdxTFhF?=
 =?utf-8?B?YzRYMVNuK0hHYnZ1T1kzemViZTlwem5id012eTdwVXh3QXFtRWJ1dGF3M3Ru?=
 =?utf-8?B?TDU0NUJCcjZoQzlCVTFnYnIzUDU0QnBTZldLVGdKeGVwRGJ0RTRiNjZVS3Bq?=
 =?utf-8?B?YWhGMXRQUWFJZXNBNTNoOGNKSFJkVmN0T1hPMHRzei8za0xiTW00Rzd3cS96?=
 =?utf-8?B?Ujh3akoxM29hZmVaMnRleXVoNVZ5VVlSVUJDUm52MnlUdzdrZTBZWFFOTGRi?=
 =?utf-8?B?alJSVENmZ3ZvRGhXZUNSZmIwUHdMYk1VaUpGOVNaQ3AwU1dtOUFlM2FyZlJN?=
 =?utf-8?B?ZmVSSTlZY0VzL0lXVCtUV1dyQ203dlN2V0x5VzhKYnZyM1dHUWdUb2FrcHJx?=
 =?utf-8?B?cXJmaDkzamVMZEFqdkhIMThNNnFYSUM0MTFadmhrVFd5OForM29ZMS80N0xR?=
 =?utf-8?B?RkpJQW12MkZRRnVobHhkMzcrUUFLZ1NNNXVmTU01dEpTSTk5enhiNFZ6V1l3?=
 =?utf-8?B?YVhtcWFZRVloY2lrTG92TVUvZjBJRWhVWGovb1BzY3dRb0c3Tkt4S3FaczhQ?=
 =?utf-8?B?b2ErbzB6Vm1BZWJaWnBocS8yRm5wVnA4MEwzSEpIdGRUSm9yS05pRUFuVFhz?=
 =?utf-8?B?bWVEcC80YlZwU09FNmJiOGw1YUlnenkybEVmNG1VLzdkS3lscW9CSEZsUTI3?=
 =?utf-8?B?Y1dKQzlwOHp0N2ZoUy9MNkc4b1RWWWhQbnJPU2wzdFhxUzJ0YktkcEQ5NHd5?=
 =?utf-8?B?VUxJVjZIWUlGUG9qWTNqOEhJRXdZR3ZKRmdYb01qVmxNWnpQYlZoMWFRcWFm?=
 =?utf-8?B?RXh3ZGtBZ3puekU4VmREeTZDak84cG1QQTdJa2ZqWnZmLzQ0R2ltbGU2TjhP?=
 =?utf-8?B?d09ib3l5ajBaV1krNzlLUzB4WU8wR1pwTHJBeHBEN1FjLzRrT1F3b1B4RlU1?=
 =?utf-8?B?Wi9RSy95enhwMVFjQ1FIK0NVSDdOeDVYSW40VlNDbnRNWmpoUTZRYWxkTlYy?=
 =?utf-8?B?VWtSMmU4NGVwdkc4OTh1SVdZUGlocG5uUGo2QmRna0puNGdzSW1BWlB4SlE1?=
 =?utf-8?B?Uy9iQlhMQ2dXQmhvdXV1blhQanczai9NNWZSamxBMmFQYm83Vzd0RE16WUZH?=
 =?utf-8?B?Q3FtRjZnZjdWQjNVMWx4U3FUblppcUdkTWhyL1ZoSXVsS0dSSXViS3ZweE93?=
 =?utf-8?B?RGlMMFp1UXB5Zy91WHJJMnkyaHUxU2RDNklpb25XT2ZYaG5DUklnUHVzMlAy?=
 =?utf-8?B?enFQY0RRQkxYVENwbTArWWU1OG1aUS9hTkNzL1VSZ2M1OHczcGcwTGZTUXRh?=
 =?utf-8?Q?AwaaGy5I4X0uJT4OWSEWlWeC5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d298a41a-252b-45af-d798-08dd92dee567
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 12:00:18.7373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Y7j8OVtYMmHrcEoUw32z8m/cc5wEMuRkxWQ2sNWweTeFcebUATU/HA4UisNTF9c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7884
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

On 5/14/25 13:02, wangtao wrote:
>> -----Original Message-----
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Tuesday, May 13, 2025 9:18 PM
>> To: wangtao <tao.wangtao@honor.com>; sumit.semwal@linaro.org;
>> benjamin.gaignard@collabora.com; Brian.Starkey@arm.com;
>> jstultz@google.com; tjmercier@google.com
>> Cc: linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org; linaro-
>> mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org;
>> wangbintian(BintianWang) <bintian.wang@honor.com>; yipengxiang
>> <yipengxiang@honor.com>; <liulu.liu@honor.com>; <feng.han@honor.com>
>> Subject: Re: [PATCH 2/2] dmabuf/heaps: implement
>> DMA_BUF_IOCTL_RW_FILE for system_heap
>>
>> On 5/13/25 14:30, wangtao wrote:
>>>> -----Original Message-----
>>>> From: Christian König <christian.koenig@amd.com>
>>>> Sent: Tuesday, May 13, 2025 7:32 PM
>>>> To: wangtao <tao.wangtao@honor.com>; sumit.semwal@linaro.org;
>>>> benjamin.gaignard@collabora.com; Brian.Starkey@arm.com;
>>>> jstultz@google.com; tjmercier@google.com
>>>> Cc: linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org;
>>>> linaro- mm-sig@lists.linaro.org; linux-kernel@vger.kernel.org;
>>>> wangbintian(BintianWang) <bintian.wang@honor.com>; yipengxiang
>>>> <yipengxiang@honor.com>; <liulu.liu@honor.com>;
>>>> <feng.han@honor.com>
>>>> Subject: Re: [PATCH 2/2] dmabuf/heaps: implement
>>>> DMA_BUF_IOCTL_RW_FILE for system_heap
>>>>
>>>> On 5/13/25 11:28, wangtao wrote:
>>>>> Support direct file I/O operations for system_heap dma-buf objects.
>>>>> Implementation includes:
>>>>> 1. Convert sg_table to bio_vec
>>>>
>>>> That is usually illegal for DMA-bufs.
>>> [wangtao] The term 'convert' is misleading in this context. The appropriate
>> phrasing should be: Construct bio_vec from sg_table.
>>
>> Well it doesn't matter what you call it. Touching the page inside an sg table of
>> a DMA-buf is illegal, we even have code to actively prevent that.
> [wangtao] For a driver using DMA-buf: Don't touch pages in the sg_table. But the system heap exporter (sg_table owner) should be allowed to use them.

Good point that might be possible.

> If a driver takes ownership via dma_buf_map_attachment or similar calls, the exporter must stop using the sg_table.
> User-space programs should call DMA_BUF_IOCTL_RW_FILE only when the DMA-buf is not attached.
> The exporter must check ownership (e.g., ensure no map_dma_buf/vmap is active) and block new calls during operations.
> I'll add these checks in patch v2.
> 
>>
>> Once more: This approach was already rejected multiple times! Please use
>> udmabuf instead!
>>
>> The hack you came up here is simply not necessary.
> [wangtao] Many people need DMA-buf direct I/O. I tried it 2 years ago. My method is simpler, uses less CPU/power, and performs better:

I don't think that this is a valid argument.

>   - Speed: 3418 MB/s vs. 2073 MB/s (udmabuf) at 1GHz CPU.
>   - udmabuf wastes half its CPU time on __get_user_pages.
>   - Creating 32x32MB DMA-bufs + reading 1GB file takes 346 ms vs. 1145 ms for udmabuf (10x slower) vs. 1503 ms for DMA-buf normal.

Why would using udmabuf be slower here?

> udmabuf is slightly faster but not enough. Switching to udmabuf is easy for small apps but hard in complex systems without major benefits.

Yeah, but your approach here is a rather clear hack. Using udmabuf is much more cleaner and generally accepted by everybody now.

As far as I can see I have to reject your approach here.

Regards,
Christian.


>>
>> Regards,
>> Christian.
>>
>>
>>> Appreciate your feedback.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> 2. Set IOCB_DIRECT when O_DIRECT is supported 3. Invoke
>>>>> vfs_iocb_iter_read()/vfs_iocb_iter_write() for actual I/O
>>>>>
>>>>> Performance metrics (UFS 4.0 device @4GB/s, Arm64 CPU @1GHz):
>>>>>
>>>>> | Metric             |    1MB |    8MB |    64MB |   1024MB |   3072MB |
>>>>> |--------------------|-------:|-------:|--------:|---------:|-------
>>>>> |--------------------|--
>>>>> |--------------------|:|
>>>>> | Buffer Read (us)   |   1658 |   9028 |   69295 |  1019783 |  2978179 |
>>>>> | Direct Read (us)   |    707 |   2647 |   18689 |   299627 |   937758 |
>>>>> | Buffer Rate (MB/s) |    603 |    886 |     924 |     1004 |     1032 |
>>>>> | Direct Rate (MB/s) |   1414 |   3022 |    3425 |     3418 |     3276 |
>>>>>
>>>>> Signed-off-by: wangtao <tao.wangtao@honor.com>
>>>>> ---
>>>>>  drivers/dma-buf/heaps/system_heap.c | 118
>>>>> ++++++++++++++++++++++++++++
>>>>>  1 file changed, 118 insertions(+)
>>>>>
>>>>> diff --git a/drivers/dma-buf/heaps/system_heap.c
>>>>> b/drivers/dma-buf/heaps/system_heap.c
>>>>> index 26d5dc89ea16..f7b71b9843aa 100644
>>>>> --- a/drivers/dma-buf/heaps/system_heap.c
>>>>> +++ b/drivers/dma-buf/heaps/system_heap.c
>>>>> @@ -20,6 +20,8 @@
>>>>>  #include <linux/scatterlist.h>
>>>>>  #include <linux/slab.h>
>>>>>  #include <linux/vmalloc.h>
>>>>> +#include <linux/bvec.h>
>>>>> +#include <linux/uio.h>
>>>>>
>>>>>  static struct dma_heap *sys_heap;
>>>>>
>>>>> @@ -281,6 +283,121 @@ static void system_heap_vunmap(struct
>> dma_buf
>>>> *dmabuf, struct iosys_map *map)
>>>>>  	iosys_map_clear(map);
>>>>>  }
>>>>>
>>>>> +static struct bio_vec *system_heap_init_bvec(struct
>>>> system_heap_buffer *buffer,
>>>>> +			size_t offset, size_t len, int *nr_segs) {
>>>>> +	struct sg_table *sgt = &buffer->sg_table;
>>>>> +	struct scatterlist *sg;
>>>>> +	size_t length = 0;
>>>>> +	unsigned int i, k = 0;
>>>>> +	struct bio_vec *bvec;
>>>>> +	size_t sg_left;
>>>>> +	size_t sg_offset;
>>>>> +	size_t sg_len;
>>>>> +
>>>>> +	bvec = kvcalloc(sgt->nents, sizeof(*bvec), GFP_KERNEL);
>>>>> +	if (!bvec)
>>>>> +		return NULL;
>>>>> +
>>>>> +	for_each_sg(sgt->sgl, sg, sgt->nents, i) {
>>>>> +		length += sg->length;
>>>>> +		if (length <= offset)
>>>>> +			continue;
>>>>> +
>>>>> +		sg_left = length - offset;
>>>>> +		sg_offset = sg->offset + sg->length - sg_left;
>>>>> +		sg_len = min(sg_left, len);
>>>>> +
>>>>> +		bvec[k].bv_page = sg_page(sg);
>>>>> +		bvec[k].bv_len = sg_len;
>>>>> +		bvec[k].bv_offset = sg_offset;
>>>>> +		k++;
>>>>> +
>>>>> +		offset += sg_len;
>>>>> +		len -= sg_len;
>>>>> +		if (len <= 0)
>>>>> +			break;
>>>>> +	}
>>>>> +
>>>>> +	*nr_segs = k;
>>>>> +	return bvec;
>>>>> +}
>>>>> +
>>>>> +static int system_heap_rw_file(struct system_heap_buffer *buffer,
>>>>> +bool
>>>> is_read,
>>>>> +		bool direct_io, struct file *filp, loff_t file_offset,
>>>>> +		size_t buf_offset, size_t len)
>>>>> +{
>>>>> +	struct bio_vec *bvec;
>>>>> +	int nr_segs = 0;
>>>>> +	struct iov_iter iter;
>>>>> +	struct kiocb kiocb;
>>>>> +	ssize_t ret = 0;
>>>>> +
>>>>> +	if (direct_io) {
>>>>> +		if (!(filp->f_mode & FMODE_CAN_ODIRECT))
>>>>> +			return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	bvec = system_heap_init_bvec(buffer, buf_offset, len, &nr_segs);
>>>>> +	if (!bvec)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	iov_iter_bvec(&iter, is_read ? ITER_DEST : ITER_SOURCE, bvec,
>>>> nr_segs, len);
>>>>> +	init_sync_kiocb(&kiocb, filp);
>>>>> +	kiocb.ki_pos = file_offset;
>>>>> +	if (direct_io)
>>>>> +		kiocb.ki_flags |= IOCB_DIRECT;
>>>>> +
>>>>> +	while (kiocb.ki_pos < file_offset + len) {
>>>>> +		if (is_read)
>>>>> +			ret = vfs_iocb_iter_read(filp, &kiocb, &iter);
>>>>> +		else
>>>>> +			ret = vfs_iocb_iter_write(filp, &kiocb, &iter);
>>>>> +		if (ret <= 0)
>>>>> +			break;
>>>>> +	}
>>>>> +
>>>>> +	kvfree(bvec);
>>>>> +	return ret < 0 ? ret : 0;
>>>>> +}
>>>>> +
>>>>> +static int system_heap_dma_buf_rw_file(struct dma_buf *dmabuf,
>>>>> +			struct dma_buf_rw_file *back)
>>>>> +{
>>>>> +	struct system_heap_buffer *buffer = dmabuf->priv;
>>>>> +	int ret = 0;
>>>>> +	__u32 op = back->flags & DMA_BUF_RW_FLAGS_OP_MASK;
>>>>> +	bool direct_io = back->flags & DMA_BUF_RW_FLAGS_DIRECT;
>>>>> +	struct file *filp;
>>>>> +
>>>>> +	if (op != DMA_BUF_RW_FLAGS_READ && op !=
>>>> DMA_BUF_RW_FLAGS_WRITE)
>>>>> +		return -EINVAL;
>>>>> +	if (direct_io) {
>>>>> +		if (!PAGE_ALIGNED(back->file_offset) ||
>>>>> +			!PAGE_ALIGNED(back->buf_offset) ||
>>>>> +			!PAGE_ALIGNED(back->buf_len))
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +	if (!back->buf_len || back->buf_len > dmabuf->size ||
>>>>> +		back->buf_offset >= dmabuf->size ||
>>>>> +		back->buf_offset + back->buf_len > dmabuf->size)
>>>>> +		return -EINVAL;
>>>>> +	if (back->file_offset + back->buf_len < back->file_offset)
>>>>> +		return -EINVAL;
>>>>> +
>>>>> +	filp = fget(back->fd);
>>>>> +	if (!filp)
>>>>> +		return -EBADF;
>>>>> +
>>>>> +	mutex_lock(&buffer->lock);
>>>>> +	ret = system_heap_rw_file(buffer, op ==
>>>> DMA_BUF_RW_FLAGS_READ, direct_io,
>>>>> +			filp, back->file_offset, back->buf_offset, back-
>>>>> buf_len);
>>>>> +	mutex_unlock(&buffer->lock);
>>>>> +
>>>>> +	fput(filp);
>>>>> +	return ret;
>>>>> +}
>>>>> +
>>>>>  static void system_heap_dma_buf_release(struct dma_buf *dmabuf)  {
>>>>>  	struct system_heap_buffer *buffer = dmabuf->priv; @@ -308,6
>>>> +425,7
>>>>> @@ static const struct dma_buf_ops system_heap_buf_ops = {
>>>>>  	.mmap = system_heap_mmap,
>>>>>  	.vmap = system_heap_vmap,
>>>>>  	.vunmap = system_heap_vunmap,
>>>>> +	.rw_file = system_heap_dma_buf_rw_file,
>>>>>  	.release = system_heap_dma_buf_release,  };
>>>>>
>>>
> 

