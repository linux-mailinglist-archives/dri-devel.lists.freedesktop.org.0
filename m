Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD83EAB597E
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 18:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AB4510E175;
	Tue, 13 May 2025 16:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5fNH8ys7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD1B10E175
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 16:13:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWpbZ8tcNUx+VaDitMa3eaxpHn7bWBG/s6zSbwztOWIsK+n3sL4U3u2LO65QvVeBfsD5Az5GEHPday3oRRDHMwiYvT2I+0MWpzvGWv6wfMFVMDo3oFr9jS1hXThwkaZLg7dIP0vfnAcOi/6k9p9y7kaO9QU7ubthFlQR1ksP/B8dMEQkChNb9/D5zL1JEFb+h1G8pBns3nzPJzNHgwF4nHfDJfPajCVU6xnGmZfrseGvjRpWllzkgqpZgmJ9JycOjocqp6zySMYuUW3eJAEJSmgCFCkdUYKEA1HkOXy6LOVMfsG3hK3L6a5OXM6Hm+lynoHAHScmy7R96RILFgeQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2elEgTkY0e6rSBflRzwtH0mYBCSOFlrsWVT1aY4q8E=;
 b=aY47cSF1O4rgsdLyT19xtvSGjjW1MpxfdpF4Nu1x0MG8FpxxIaAUIamIUQmVOPelQ17b6gYS9v/QAllh7phAGB+catuZMsLY7Juk5+fSFX+uPRom3hMz5MIyHNJo/lxHUlKhiAS4Kj2rI1cH20pDwC1/Vht4yUXU9qn8mD/F38jNCQnzb1CewgN7H6EWOmGJI+YhRcgd8FroNHxas9rkvYTi9aHYCowvMZExja8UFZkngJhHD99gVf0briQch+V1ctK0NKK1kk+irL3AMyyyusrA7TdUhU0KAFCp5IsuFY7c+p2sfeFTeBLGk4R8IrGhrcDjPMz6MC/ME8Zovna+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2elEgTkY0e6rSBflRzwtH0mYBCSOFlrsWVT1aY4q8E=;
 b=5fNH8ys7aohmgUGZ2CA17UXTxgZSyq0bmILr5o1uZh53QkcuC/rVXTxnv1KFGr2cLWoYWf4lZtPn6Z4Piq++Uw26GpG6GRkvF5c3B52jENABW0vhEeJuNTV86zAihVdnE/KfZtxXMw8cVPBCFh3fl1HKYtz/pCtPb6t6CwRGMMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 16:13:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 16:13:25 +0000
Message-ID: <e90d57d5-b8df-4145-ae86-43c7216c1936@amd.com>
Date: Tue, 13 May 2025 18:13:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dmabuf: add DMA_BUF_IOCTL_RW_FILE
To: "T.J. Mercier" <tjmercier@google.com>
Cc: wangtao <tao.wangtao@honor.com>, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 bintian.wang@honor.com, yipengxiang@honor.com, liulu.liu@honor.com,
 feng.han@honor.com
References: <20250513092735.1931-1-tao.wangtao@honor.com>
 <d77ed1c0-3f66-447a-956f-37e1dd543ca3@amd.com>
 <CABdmKX08DgEi4Gq6mQ-xPrtiNeRvarMyp9t+biRd001TRQzpQg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CABdmKX08DgEi4Gq6mQ-xPrtiNeRvarMyp9t+biRd001TRQzpQg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 879a1a77-0cf1-47f5-0724-08dd923916c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjBBQkt1QVlBOVBhZmVKbU9KYWRrOUJSelpLdVBVMHNZa1B2SUpKOTJEWHdO?=
 =?utf-8?B?TU9ZSi91aytaMjRqMElWeW5ibWVTaGJmNkRrak1Weis4ZzBGa1cyNkZMQWhh?=
 =?utf-8?B?aFcxeHJDMUpIZVdRbWZUNGltaTNKcUtVTWVObmlnc3Y0aXNxRUtPajFhQVds?=
 =?utf-8?B?REkvTHVydFcrOGdhbURyQlcvRU0xWTNzVVZrc2NXR0d5YzJnN0wrbzFEcVdF?=
 =?utf-8?B?MUZvSXdMRDhWVi80MGppeG1FbEFSNkhkN0E0WTVuaVJaaWdES1IrcU94QWt0?=
 =?utf-8?B?MS9qK0Y0U2JzLzN2K0VBTndhRjJTd3lvelRGR2NmZjJiR3ZpMnh0VG5SV3Fk?=
 =?utf-8?B?TS9EaW1IellLMGxHcWdoalBVaGxYUHRLNTFmemFGUURlVXhBNTRNVVRzU0hV?=
 =?utf-8?B?NUl3R0xmTDZZMUk3R1R0blc1VG9lU1FDWkUwZTRPaTRPYUhMaFkwZjEyRUVZ?=
 =?utf-8?B?dkMxS251OG84UnZIS3ZVUUh4b0hvQldicU1Rcm8wcGp6d1dpaEhmMUNheHho?=
 =?utf-8?B?by9QeStLSzlHTnBFZXBwOG9Mc3FCKzRyV1o3TTFtM1YyQVdnbmo5UTZLeXk4?=
 =?utf-8?B?cWVNeHJpSG5uczdZczRwVDNUVG1RVFIyZnhsM0M5RktyMkw1YWh1Q0dDWGJa?=
 =?utf-8?B?Uk9LSFJzOVJadmlTUmhPL1J5c3diOXVmSEV6Q1pGZHcxL1lVV0lNaXEzR2di?=
 =?utf-8?B?a085WW94eHFJZURKUXFpNTNXY2oyRm51ZkxCNjlGTzBrZGgzUWlaVVQvaG1h?=
 =?utf-8?B?WGswbFFQUVAxVW42WUkxdStDcStOd3QyVDlJZld3Qjh0OEsyMUcxYmRNNjJQ?=
 =?utf-8?B?amZWbkVQbTlWRFBXaHVhUGY4Yi9WZWk3eDBydjNmL2JKckc0MC9Fa3dudVkz?=
 =?utf-8?B?Ukg3dVA3VDFWQTR1ZVhpeFV5R1dsN3R5RzRDemhsSkM2QWs1Nm9tMVgxR3dP?=
 =?utf-8?B?VEZrVFIyc0tpMVcrZEdzVjBEa1dYVmlrVC9Cc2VTTTFFY0VRYzhBOWZLbUU0?=
 =?utf-8?B?SjJYeVhNaU9JK09XR2tucDd0TlB4Mi9mSUxsdHMwWkFIbDRlMG41YWJQbkxV?=
 =?utf-8?B?VVBMWlBXUGZlM1NkZjdIRFZiUFNHcWFWUzlSSVBVdGF1RElNcWQ1em5oeE1F?=
 =?utf-8?B?UUxkeko5S1lCdlFnd0ozbTd2K2krYlRIWiswUkdaZTFNQURjRTNLWUUwZmxw?=
 =?utf-8?B?MU05c0ppN2Z1TWh3bmlRTmFYeGUzWDZuUHJrTDVGMmlMMGhBWFVhbFdoNmRZ?=
 =?utf-8?B?ODUvamJmTE0zNjdFakREVnFOcy83SEtpWWRiTnkyOEFheG5wS1NFb1MvWDh0?=
 =?utf-8?B?TWlYeVJ6STlOcVM1bFhDSFBvTU0xNVpZaUFkczBIQmhkOG1QODh6T3pUVVRr?=
 =?utf-8?B?KzRSNjF1cGJDSXRXaFZIY2VNN0dxbGZvTG5KU2QwVWN0YXlTYmxtamRSc3NU?=
 =?utf-8?B?NEdVU0FxVUthcTVOZU5laytHUEhic0F1NTljQjNMeWg5dFVaUjVWbXdlMzJV?=
 =?utf-8?B?eGxFeWdybUcvSUdpZGhNaGQxVGhTRmJYTjRXdGFwZkwxY3c1dCttYnZKZWpo?=
 =?utf-8?B?WSsra0Vpb2drUzNJZlhzN2xJbVdsSENOWU5CdlgrbnROdVRYeW5vQnp3R0wx?=
 =?utf-8?B?WjdpSzgzY2ovUVhnNU8yN1k5NlpDUXdCMllPckpEL3hOTlBhTGVxYmZuNjRk?=
 =?utf-8?B?WXpYcWNQWEpUaGlnSnJkTFh4d2xMb1lWV2pHTFV6YjJuMVZtVzhIT29xQUdi?=
 =?utf-8?B?aWRPMWRndEJYczVMZVRLNDhkcnZhb1VDVm5lbmg4cUx1N0JPTTNLa0ZmNkM5?=
 =?utf-8?B?dzFmYmxORUJnTC91dFJ5Qlp3b2VXMTZrNTRGdXVFRWcwM2l0M1pwZG5UV1l2?=
 =?utf-8?B?aG9XaDRWS0lMN3FFMjZVWTN0YzFKSTg4NzJYSmVTSWRoSjVXWFBLK1MvdVJo?=
 =?utf-8?Q?jvZUzTNZIAk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dy9OejhpNlJTNmd1M0NTRDVvTE9nS3QzUERGanZYL0F1ai9KbmR4NGNxYXNI?=
 =?utf-8?B?cFh0aXYxZHNUOTMxTjlicGZUWW5saDI0OFdsdVRhek5MZ2pHc2RON0gzdS8z?=
 =?utf-8?B?NlRLQWliaXBWSGZYUTg2MUl3Q0FBamxYVlNXdEMzVkUySzZUK1hRWmRFOWRY?=
 =?utf-8?B?SjZJcFhkV1d6VFpmUGd6eXBhLzV0aHpNRzlxbjQxVU9zbHQ1cmF3MGJqRlRB?=
 =?utf-8?B?b1NKQ2lyTlVpQUc2cVlsTDRwQ0hKb21iT1MvWnYzR0pxZWNTcHZaZkM3cGFM?=
 =?utf-8?B?RmpzcDkxb01hb1N0WHA0YVJwWXJHMncza1QwYkY5emhLclVaZ3pqbVppZ2hr?=
 =?utf-8?B?R09XSStSZVUveU9DM29ibnJzREtJQmJPMXFEaUpxSVZDMDVyYXNHRWVqSmxD?=
 =?utf-8?B?Tjc4blVpRVBIL0NCQUZRekJqc3lFc0FmVkFvekpoZnZVNE9BdGhyK3pWVHla?=
 =?utf-8?B?WDJnclUyM0hTRmVZYnhFMXdsc0ZsOGFib0VJVTVrbUdtTHliN09kRzFkYlZh?=
 =?utf-8?B?S1FWdGs4d1hQc1VIN0plWFRTZG9PVWIrRTh2QW12YXhTcHJ1NkZ2RDhSN0Fq?=
 =?utf-8?B?MnJBdEZIenExKzlYLzdYMkh5QXpTdDRYQWlTa1d5MkNmazhKL0o3NUlSbHls?=
 =?utf-8?B?aUxtdExKUTNJcjZkUVNnV0k5Z0NUWXQzcU9TR3NmYnNSa3RIM29zazhVTm5Q?=
 =?utf-8?B?WjNDY0p3VXJIaTRwNFRwMk1KbWZKaWhuM3FwbklhTTlRTFJ3Z2lsUGRWY0Fa?=
 =?utf-8?B?ZDVSZG1VR2xaWGdBMnRpYjEvdndIODBnQjk2dzAweVNZVzA3d2FWWnNWb2N4?=
 =?utf-8?B?Wk5oekp4VXhYL2hESEZTcDAvQUVTME1RN05sM3VPNkJIdnNLU3ZPdTdORGRD?=
 =?utf-8?B?NmhtV2ZxaUtJWUpXZ25maTUyUWw1WjAyVXhVTnJ1TUNjNDF0eS9UVU44L3pv?=
 =?utf-8?B?VUdNVCtidlRpOVlqMjVwM05ra3RDSTNsWUdiNlI1bzUxQWwvbis2cW9QbXZp?=
 =?utf-8?B?bm5hZVl2c3BPN2l6OEhrUWRFRUhGampXUzdhUWNjeXNFbzJndVVFYXpPZ2F4?=
 =?utf-8?B?VzJxZUdibE9QVkx1UENKRTF6SGZYbkc0aDNzR0RPZWdhbzhDVG1sTXA5K0Ru?=
 =?utf-8?B?MjNMYy95V1JQREhaTXlGemFSL3htNGpVbzRJOW54c3RobkFncE9XTUNXbm92?=
 =?utf-8?B?dUtRRVdRNVZNb0ZYem9rSzlzQVF1cTlLTzRsTU8rcXVXbzJIWmlCa0xLbXRU?=
 =?utf-8?B?NEduc2xQQUE5am9pRFdrYytwNGVodEJiNEZBWFVxMDRlc25vdHJLVTdTQndU?=
 =?utf-8?B?VjZ0M1NyU3lMSVVDZ3hEdUtLMnFQeDQ1cjhSNDVJT25RQnNlNzVyRDZmUmpo?=
 =?utf-8?B?ZkF5d2VkY1E5NGg2cUdsVWNoNllYV0F0VVNHS1VkTkoxQjllaWdsTEJYU1lP?=
 =?utf-8?B?eUJXdjdWNWJjcTFhZkYwNzRXQWtHRzJ2M0pZL1pMWm10R0cweTdmMjBrNzdy?=
 =?utf-8?B?QnNUSlN2U1ZwQVlQaUptZitIZ3g4MXVDUXRSTlJNejQzRDYwZG5FaWFvR2Vj?=
 =?utf-8?B?ZlNuS0gweG5TTlpRMERja3podlRwWUY3Y0tqR3hFSWdSNHhlc2VvMFNDaDFV?=
 =?utf-8?B?U0ViTXhiZHlTTFpWS25mSHZhaTU5a0NZdy9uSUVuNUhOQkNtM1Z1TUxxSlF5?=
 =?utf-8?B?Y1ZsVVBZL0xST1lZTkZkQUdBWmQyazdtZkIrVUJrTi9IUWgrQjlTWCt3ZmQw?=
 =?utf-8?B?NEltNVN5cUNEY3RxdzB2ZHYvcnEvWDZXZlZJd0FBZmVLOGRzd3hJM21iSzJD?=
 =?utf-8?B?L3JBaCtxeUFCU0VuZFcrcmgrSjJub3VWK3E0WDJJa2MxWDZTY1BoTmtiOFBx?=
 =?utf-8?B?aEhqQ1RtWE9JUUIzbk1rRURzMFNqQzRtZ0t5d2p3Sm42UmpXb3V1M1BoaEVC?=
 =?utf-8?B?LzkwZGFUU1A4d09ycFU2WVlDOTZtZWpaU3ZuWDIxOGFwM0dGRUFEWDBRajJm?=
 =?utf-8?B?MHNZS1F6UWszZG9iSTl6N083N3I1bmRSdlJiZDBhQlVIT0o5STdRVjM1TnVV?=
 =?utf-8?B?RlYvMmg5S0xxSEpmTTBacHRzVWgyYTFIQ1NFRit3aGhLN3ZWUjRaOTUwTXRm?=
 =?utf-8?Q?sLm8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879a1a77-0cf1-47f5-0724-08dd923916c3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:13:25.2470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMa/GOsOHDx1sD32KiBEKQ+wraYCbBqrjYlbCe9RDZmJh2hoevdy2Yznq6+9neh4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789
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

On 5/13/25 17:55, T.J. Mercier wrote:
> On Tue, May 13, 2025 at 4:31 AM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> On 5/13/25 11:27, wangtao wrote:
>>> Add DMA_BUF_IOCTL_RW_FILE to save/restore data from/to a dma-buf.
>>
>> Similar approach where rejected before in favor of using udmabuf.
>>
>> Is there any reason you can't use that approach as well?
> 
> I also recently verified that udmabuf + O_DIRECT works with
> sendfile(), and you can even MADV_COLLAPSE the underlying shmem if you
> want.

Oh, nice :)

Going to keep that in mind if somebody ask for that feature again.

Regards,
Christian.

> 
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: wangtao <tao.wangtao@honor.com>
>>> ---
>>>  drivers/dma-buf/dma-buf.c    |  8 ++++++++
>>>  include/linux/dma-buf.h      |  3 +++
>>>  include/uapi/linux/dma-buf.h | 29 +++++++++++++++++++++++++++++
>>>  3 files changed, 40 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 5baa83b85515..95d8b0158ffd 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -460,6 +460,7 @@ static long dma_buf_ioctl(struct file *file,
>>>       struct dma_buf *dmabuf;
>>>       struct dma_buf_sync sync;
>>>       enum dma_data_direction direction;
>>> +     struct dma_buf_rw_file kfile;
>>>       int ret;
>>>
>>>       dmabuf = file->private_data;
>>> @@ -504,6 +505,13 @@ static long dma_buf_ioctl(struct file *file,
>>>               return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
>>>  #endif
>>>
>>> +     case DMA_BUF_IOCTL_RW_FILE:
>>> +             if (copy_from_user(&kfile, (void __user *) arg, sizeof(kfile)))
>>> +                     return -EFAULT;
>>> +             if (!dmabuf->ops->rw_file)
>>> +                     return -EINVAL;
>>> +             return dmabuf->ops->rw_file(dmabuf, &kfile);
>>> +
>>>       default:
>>>               return -ENOTTY;
>>>       }
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index 36216d28d8bd..de236ba2094b 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -22,6 +22,7 @@
>>>  #include <linux/fs.h>
>>>  #include <linux/dma-fence.h>
>>>  #include <linux/wait.h>
>>> +#include <uapi/linux/dma-buf.h>
>>>
>>>  struct device;
>>>  struct dma_buf;
>>> @@ -285,6 +286,8 @@ struct dma_buf_ops {
>>>
>>>       int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>>       void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>> +
>>> +     int (*rw_file)(struct dma_buf *dmabuf, struct dma_buf_rw_file *file);
>>>  };
>>>
>>>  /**
>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>>> index 5a6fda66d9ad..ec9164b7b753 100644
>>> --- a/include/uapi/linux/dma-buf.h
>>> +++ b/include/uapi/linux/dma-buf.h
>>> @@ -167,6 +167,29 @@ struct dma_buf_import_sync_file {
>>>       __s32 fd;
>>>  };
>>>
>>> +/**
>>> + * struct dma_buf_rw_file - read/write file associated with a dma-buf
>>> + *
>>> + * Userspace can performs a DMA_BUF_IOCTL_BACK to save data from a dma-buf or
>>> + * restore data to a dma-buf.
>>> + */
>>> +struct dma_buf_rw_file {
>>> +
>>> +     /** @flags: Flags indicating read/write for this dma-buf. */
>>> +     __u32 flags;
>>> +     /** @fd: File descriptor of the file associated with this dma-buf. */
>>> +     __s32 fd;
>>> +     /** @file_offset: Offset within the file where this dma-buf starts.
>>> +      *
>>> +      *  Offset and Length must be page-aligned for direct I/O.
>>> +      */
>>> +     __u64 file_offset;
>>> +     /** @buf_offset: Offset within this dma-buf where the read/write starts. */
>>> +     __u64 buf_offset;
>>> +     /** @buf_len: Length of this dma-buf read/write. */
>>> +     __u64 buf_len;
>>> +};
>>> +
>>>  #define DMA_BUF_BASE         'b'
>>>  #define DMA_BUF_IOCTL_SYNC   _IOW(DMA_BUF_BASE, 0, struct dma_buf_sync)
>>>
>>> @@ -179,4 +202,10 @@ struct dma_buf_import_sync_file {
>>>  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE       _IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
>>>  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE       _IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
>>>
>>> +#define DMA_BUF_RW_FLAGS_OP_MASK (0xFF << 0)
>>> +#define DMA_BUF_RW_FLAGS_READ (1 << 0) /* Restore dma-buf data */
>>> +#define DMA_BUF_RW_FLAGS_WRITE (2 << 0) /* Save dma-buf data */
>>> +#define DMA_BUF_RW_FLAGS_DIRECT (1u << 31) /* Direct read/write file */
>>> +#define DMA_BUF_IOCTL_RW_FILE        _IOW(DMA_BUF_BASE, 4, struct dma_buf_rw_file)
>>> +
>>>  #endif
>>

