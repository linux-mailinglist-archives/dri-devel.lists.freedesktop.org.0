Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B253CA72B5B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:23:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AFCD10E877;
	Thu, 27 Mar 2025 08:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ViYCWhyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1422610E877
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:23:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqkWQ4rLVZzs8XHa+y6WoVw0Abk9tkpHqrNl4XUH+w3n96e4XQzob14b/JXJoB50pFi8dtuMqm084qh4UsRG/A4lJOA7vSCPaVJTSK34ghubfGkhfnGWtTv03tujU6WxTRdBzS0mQVytdIuAN6DKHnfpo7dBOR1zEroq7e7REPANKH0SxDvP1NTH0yx2TvJYeW4WmAJFjgouZE5KFAeh/+mT/3vFYnxrAI5VxHryOTjzD9hr5e/PegSntrgXPvTkdDSp3Cf/gq8NgpoSQlvq9OnlXdIq5sImnC5NfGvlG8V/MLvwnT+FVqIv3DTw+lYBKRj5BCGf4dO+tmrbR3RqQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAozeP+mCD2MxzQ7GjGEx0I+OU4RG+ocPGCNOooUK3I=;
 b=BsNDdxkHwXxoGWnu0cjfvbWBhgMK+U9xP/2JWI+EbhIyvQwoe99ILJ2xFRyF8zqKdEwUimsEQfPA1Clt+thsgNVjaiyXRwADb2rjlil/N5dcUwLSCTUw/ew747Fg190FygtVuejXu2SkS5WEIluMOp/6LXYMwnLZe6qKfSRW+q+xnzSsAQRFX5sEg6hKEA0SMd3YO2U+FHcg/5Zb8x58u2ZhditJ3Fqx4ItykkaBlnck4SrlStnrkeziG6MAPEkMgIEEx7xE6EE+IRI8oYVhcO6VdLvwNSo5IZ+g1kB0KD7bd7Xp5HRHfTjZNJL3VbpnnirJed0C7zZ5sg99c26vSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAozeP+mCD2MxzQ7GjGEx0I+OU4RG+ocPGCNOooUK3I=;
 b=ViYCWhyFBcffFbKdFbRUfTPcBNyBJs/6qc1w8xk/J3A0/95UT+a1X17DPHNV/BRXdFbbPh3qDwnfWNN2p+dTUtQQ2se0qKiqCcO1PBpQllHOjOit2ci5bxT0lfBZpuBo4fouskelwqijKdmZeKC+3FwI5eBs0AKVzMX/9V3kfYk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:23:28 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%7]) with mapi id 15.20.8511.026; Thu, 27 Mar 2025
 08:23:28 +0000
Message-ID: <054797fb-ee9e-408a-a28b-81f174c7b89e@amd.com>
Date: Thu, 27 Mar 2025 09:23:21 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
References: <20250326143903.24380-1-robdclark@gmail.com>
 <342ee079-ee0e-470d-afd2-c2870115b489@amd.com>
 <CAF6AEGu2Ax+u3QmD2VADwh4A4s5TAmP5Lq4DcYYadKP4csH-=g@mail.gmail.com>
 <CAF6AEGv-Zad2GF-=gDdYQdZGkJ_u+eyBFvTNK49m5+1ycaZu9Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGv-Zad2GF-=gDdYQdZGkJ_u+eyBFvTNK49m5+1ycaZu9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::13) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DS7PR12MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: fefd38fb-9bea-4472-c9db-08dd6d08a6d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnhvZnVDZmhjeDhaelRRL1p1a0MwYmVpdUswbWRGdWF1NTArc0xHdTd5K2hr?=
 =?utf-8?B?ckFvQ2hzcHlteWtRaVhFbTNVWG1LekpCN2Qrc25BYmswNWVpZ1dqeG5lT3dF?=
 =?utf-8?B?MDQ3NGRlb2o4ZXUrUkhlQm4veE1lZ3AzRVlxbHloUFhqemFhOEdSa1N4MjV4?=
 =?utf-8?B?S3pGSk5wNUtOLzllazl3eVpOMHBYVTBtcUZGUzFwRG9ZNGtiR0VOSW1pQzk1?=
 =?utf-8?B?aS9tQlRDV2hOTWN6ekk2SnRkWmNydGJTVlRGYTh4TnFUN296Wm9IVmZ6eVFX?=
 =?utf-8?B?QjhRUzFhUWFnUVhMZ0dZYzlROWdmRSttaEhNYjIrSXBOQis2T2dOU0xVaW9j?=
 =?utf-8?B?T0JkRStRUDVEeWllcHg4UUw5c2pZR0twdXlYNm5ubmExY1lrNEtRNXAvTlJV?=
 =?utf-8?B?UHN6SXpPVnRzNklnb0NncXNaT2RBMHV6YUdWanZlWmVwU1I0cUhIcTNpTFBR?=
 =?utf-8?B?RnRJWG9DNXdIZ29OdStpL0JoRGpqY0xrM25XWTVRWk91UWVOcFBGWjV0Rlcw?=
 =?utf-8?B?dFU1UkZYbXl5SDFOcytYQmdnc0kxWGZza0dEeGNHSTlMcEJodVNKWFo1NC9u?=
 =?utf-8?B?U3g2RjNmbDExRWZ2NW9QY3FBbHlDK2dIY0M3N25WWjRmSkJoUTFxaVJIaDA3?=
 =?utf-8?B?L29KRnRpU1BMWkIzemhwS2NRY29EcnZWbXlMb2hoZmpMeW5tbVhsSzBCcEhU?=
 =?utf-8?B?VWJ0Vms3dm1xcWJEZWc4WldjbVBjdEpsSUN0S0t1SHVuUTFyQVlEclFpQ3dM?=
 =?utf-8?B?cFZ4VGJqb2wzNE16TEVIdE4xT0FTdEJwNDEwSTc2bmd4WDkxaW1EWVllaDM3?=
 =?utf-8?B?RTRmZGlhMXZ3bmJOYkhOUGdPSFRrUHMvOHhEUWF1ZmNTeU9KaEtMem55aHpq?=
 =?utf-8?B?OEU3Nm5rb0RTb2U1Q0lacEc2ai9QN3pzdkZNaE5lUVhkTkluUEJ2TE9GZkNT?=
 =?utf-8?B?SEtzVG1YUldXWVFxM3IzNytOcmhvckJUSEZPYXUzMzNEdDhkQmtteHJPRVFx?=
 =?utf-8?B?cWJxeFliYXRvNGdMcHRPYWZlb05qaTdXY0VvQld4STNGc3h4UXJ3cjcvbjRR?=
 =?utf-8?B?Q25IWnpnNFpNMml6ME9rb1dvUk5iakV1MlpaNWFjaEhGU0dmMEV6akNvQnRo?=
 =?utf-8?B?Vk1seUJFTXVGMjFiUS91b0tpRFZlM0d5amx6WjE4WXZjNFdOQWNlbFNXYWN0?=
 =?utf-8?B?T0tsVG9tVDQ1MnBhSG52M2F2dzJHeTF0OFhNMDlnbWJQRVVqRDZNcGYwbVpP?=
 =?utf-8?B?YXU4UEJXOU92bTlyTjZQT2RRalBtVzJEWjV3bmdRQXBKZjVnREFTcHkrSGNk?=
 =?utf-8?B?RkFrN256Q2dYNzUybDBVOGl1UURUdEtoOVhLRGt4anozMzIvL0srbUlxT3Rj?=
 =?utf-8?B?YTIvWGY1YllUYlVEUTBMRWl5TFNaYW5KaUg4a0dGakYyUER2ZkZISmtuZS9B?=
 =?utf-8?B?V1prczBDK0pzaEFlU2lrcVFoSHcxZ2RmTVdKb1hhZStKQ0lSaG5adGFGUW45?=
 =?utf-8?B?cUxHVzF0cXIyQXMvQW9HRG5aUTc0MFg3cGtYNktDOEk0cVJCVk56eXd5S2pp?=
 =?utf-8?B?cHNicER5UnoybVA1ZVZxVFRRSno0a2VlYVIvUnRxVmliWllBanlCSGhwNSt1?=
 =?utf-8?B?SHEzdFVaYnR6ZlRHd3k3em5hd0VIMldEYW8wWkZWK2xFVTBOdHdYV0FBRTlR?=
 =?utf-8?B?OEpoNFZGL0g0eEI0OGhDSEE3OVYrN0s0OVhzQVdMZXZob0xZcEtEYUFTKzZw?=
 =?utf-8?B?Y0ptWEZySzIzcll3QkJ3S1VXKzdCL2ZoRklodW1ndlZ1UHB6L3FQV0NzMmtQ?=
 =?utf-8?B?RnBoZkJPNTRxUXkrc0hYZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUNGMWJVSCsyUXREYkhDYVJYQjF2bTE4d0xHR215MVZwTFpDMFJIbUlmaGNZ?=
 =?utf-8?B?UXhDRmRGWmNVUjJQNG9MeUdRVW1xb3VucVdQZmlocGkyeG5GR3JCTjR1NzRw?=
 =?utf-8?B?Qm03NXZjTHlYNCtnb3lCaEpqcFRhb3dYSFdpK1laMmZReWNINzM0Q1V5T2FM?=
 =?utf-8?B?Q1R5cTJ4NUpueVFIMFF1ckV5V05Edy9JbWttNUd2RkpMaDBWTDBlYURaTWNl?=
 =?utf-8?B?YWRpYlNBNjRNL1BwOFFXYWdZa1N2M0praHV4cGx3ZXBRUzlBOTNVQ0UxbDNJ?=
 =?utf-8?B?dWN6bGJlRG5QMi9rVzlkOEJ0TVlkRm5OK28ydXcyVi9GeWcyaXlNQkZPaVl0?=
 =?utf-8?B?aHdWRHRkWStZZ3dacDVqT3VCREp2VjVNTCtjc1MrVHpyN3N6QzgvV2ZYbHU3?=
 =?utf-8?B?MDVKbGVFNk9uaTNpNXIvZHI4SEtrOUQzY2liVnRFeTJhME83ZC9qT3B3aXFZ?=
 =?utf-8?B?VVBaaUtNZlhvRjVjc1V5UHZwcS90ZGppdW5hWmFIMVVEZE5HaVUrblhRRE9t?=
 =?utf-8?B?cDYzQnc2NGROT05Fd0ZMT25lOWFQVWk4TFk0ajRab2FPNnMyd241UXdFU0Nm?=
 =?utf-8?B?SzltanllWWU3VzNmVnhiV24vQ3IrTVVyS1NvcWdLcUZycjRNOUpsQWJodXA3?=
 =?utf-8?B?L09OU0NQbWJQZ3JxOEM0aXlERURtZVV1UlI3MXZ0UkM1TFVlSll1M2U3WnJk?=
 =?utf-8?B?NldHSFhQdUg1VmIxZ2Urd2NvbHRCak43VGJrV2ZOSDl2SWo5U0ZKVzI4aFV4?=
 =?utf-8?B?VDc0L1lKRHJtNW5SV016RWM2dW9wQTU3RXlOc0U1MG5nUjV0Rk9PdGZLQytW?=
 =?utf-8?B?Mys0STFHdGp0RGMvdU5Dc2UwczNsc1p2eGZ0cHBPejR4V0hsZjA5Mm8zVk9w?=
 =?utf-8?B?cVhmTUJqV2N2UlVKdUNud01LeTkzR1pVK21hTkg4djROYUczRWt2V2dqTjNT?=
 =?utf-8?B?ejZENWM5OWg2WHA5STA3cG1tVHhTdDVqVG5wN2ltNDE2K05oZjFzNnMrVkoy?=
 =?utf-8?B?a0U2Kzl5Z1Y4RHFGZW54OTlmQnp2NVdzZTAyRlAwTVlQY2hUUitqdkNRR0hi?=
 =?utf-8?B?Y25NQ1V2ODMvcmxWRk9RdDJOMGQvSXBFMjNIT1dyZkhFZXViSzBjTkZFMVFX?=
 =?utf-8?B?aGRxNnhRQk5zdXFUdHNHeFYwQ3lnbmhMSnFoL25HbnFZOWNGUno1WjhDTGph?=
 =?utf-8?B?cVdUbzRybTlFamlYY0J5cEtFd01qK3hFUlp4NlhKVG1iaGw4bFFsRkNqV2Nq?=
 =?utf-8?B?VHkxN28zQ0h0aUlDMk5lWFBvRmhkQ1hMVHd1bFppT3dVc1psZFZjVWlwWm8y?=
 =?utf-8?B?T0lZMkRvV0pFaFo1b0FmeWlCR1ZRVkRjN1pYd2lqVlV2WC84QXUyT09VNFZi?=
 =?utf-8?B?ZUduakI2bXJXM1l0RGRHQ2FqT2puTnNOWEc0TXZTOGJFYW9QYnVqcHdlM0ZH?=
 =?utf-8?B?b0l3T3h5aWdCdDF1L2lMRWsrQXl5YU8rZGUwUFRhTmNoeHFWdHpiYWQzT2ZU?=
 =?utf-8?B?ZVc1cWNLbkNpZFYzQU5kNFZhbFpJeWdPM3VqK3pYU0Ivc0g4SWptdkZQcE4z?=
 =?utf-8?B?d1ZJaCt6VDRXQkh1YTlaTXlhc29IMVFjRk5QOFVHOHZuOWtCN0xXWkIwUFJX?=
 =?utf-8?B?b0tSSzFiM25hMHhGTUpDRitjMExqYVZqVkw3Ynl1ZnJPT1FKMjltayswS2pE?=
 =?utf-8?B?cVZoOHY3bTg4RUprcjNocFBSS3VVcHRoQnNsYmg1NHRSMFdRaTVZdjJQT1Qy?=
 =?utf-8?B?UjkyNCtaamVlbWY4VmJPaUZkZWM1VG1oS1F4UkRWVEYzZFZyTWI0VWsxRkxm?=
 =?utf-8?B?Vjc5ZnQ3SUVRLy9yb29aSFREZStnUWVwZTRnSUwxanNJcURralJnMnZYei9x?=
 =?utf-8?B?QVhmWjZNanJWWi9vRjNQQTZ4a0ErTmQ4K0xicnQ0dlJkTTVyWGxLS0NEYXJ2?=
 =?utf-8?B?YS9KUk5PRXNUaDFlZXJvZUdMQU5GS3Y5bjdlNnlrUkVRWWg5Rm5pNU82Z0Nj?=
 =?utf-8?B?UnFTdHQyNUorOEVmaUFiaWdwQkhLeFJpd2NTSDVNR1hibFN3MEpxbnN5eDlQ?=
 =?utf-8?B?SDB2RXhnZWJMK0NzU1g5aEhHamRNQ2l0LzRFczlPVFdaT2tNTGdhbWJPZHdF?=
 =?utf-8?Q?YY5odj9hyZ/tHtoo/CUsTcF4s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fefd38fb-9bea-4472-c9db-08dd6d08a6d8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:23:28.5730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7e/uSf6BAnMgIvhSHU2AqwSRObrUtr00KF/nMs+mnoxzP8HeeUzGVo7z861/Bkcm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9473
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

Am 26.03.25 um 21:46 schrieb Rob Clark:
> On Wed, Mar 26, 2025 at 7:46 AM Rob Clark <robdclark@gmail.com> wrote:
>> On Wed, Mar 26, 2025 at 7:41 AM Christian König
>> <christian.koenig@amd.com> wrote:
>>> Am 26.03.25 um 15:39 schrieb Rob Clark:
>>>> From: Rob Clark <robdclark@chromium.org>
>>>>
>>>> Add support for exporting a dma_fence fd for a specific point on a
>>>> timeline.
>>> Looks good on first glance. What's the userspace use case?
>> Timeline syncobj support for vtest/vpipe[1][2].. since core
>> virglrender and drm native ctx works in terms of fences (since in the
>> VM case, everything is a fence below the guest kernel uabi), we need
>> to be able to turn a point on a timeline back into a fence fd.  (Plus
>> it seemed like an odd omission from the existing uabi.)
>>
>> BR,
>> -R
>>
>> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
>> [2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/805
>>
>>> Regards,
>>> Christian.
>>>
>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>> ---
>>>>  drivers/gpu/drm/drm_syncobj.c | 8 ++++++--
>>>>  include/uapi/drm/drm.h        | 2 ++
>>>>  2 files changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>>>> index 4f2ab8a7b50f..eb7a2dd2e261 100644
>>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>>> @@ -762,7 +762,7 @@ static int drm_syncobj_import_sync_file_fence(struct drm_file *file_private,
>>>>  }
>>>>
>>>>  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>>>> -                                     int handle, int *p_fd)
>>>> +                                     int handle, u64 point, int *p_fd)
>>>>  {
>>>>       int ret;
>>>>       struct dma_fence *fence;
>>>> @@ -772,7 +772,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>>>>       if (fd < 0)
>>>>               return fd;
>>>>
>>>> -     ret = drm_syncobj_find_fence(file_private, handle, 0, 0, &fence);
>>>> +     ret = drm_syncobj_find_fence(file_private, handle, point, 0, &fence);
>>>>       if (ret)
>>>>               goto err_put_fd;
>>>>
>>>> @@ -882,8 +882,12 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *dev, void *data,
>>>>
>>>>       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE)
>>>>               return drm_syncobj_export_sync_file(file_private, args->handle,
>>>> +                                                 args->point,
>>>>                                                   &args->fd);
> Hmm, maybe I should add DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_TIMELINE so
> that userspace gets a clean error on older kernels, rather than having
> the point param be silently ignored..

Sounds reasonable to me as well.

And please include the links to the userspace code in the commit message.

Apart from that looks totally reasonable to me.

Regards,
Christian.

>
> BR,
> -R
>
>>>> +     if (args->point)
>>>> +             return -EINVAL;
>>>> +
>>>>       return drm_syncobj_handle_to_fd(file_private, args->handle,
>>>>                                       &args->fd);
>>>>  }
>>>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>>>> index 7fba37b94401..c71a8f4439f2 100644
>>>> --- a/include/uapi/drm/drm.h
>>>> +++ b/include/uapi/drm/drm.h
>>>> @@ -912,6 +912,8 @@ struct drm_syncobj_handle {
>>>>
>>>>       __s32 fd;
>>>>       __u32 pad;
>>>> +
>>>> +     __u64 point;
>>>>  };
>>>>
>>>>  struct drm_syncobj_transfer {

