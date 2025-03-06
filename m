Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2802A558F9
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 22:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA50510EA93;
	Thu,  6 Mar 2025 21:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VpFGTltc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3E210EA92;
 Thu,  6 Mar 2025 21:42:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ST9N//r+yvtLUr4GR4pfYV0umjTomU28e14bOByz7JV2xd+ZhoG0JJdmPcqXc4/ExVXg64AVOQb3Gkndsj+IAOByRHsUs/SR3JMjrNFITVPODgzPri2zEqX9ZmkiSxgHZBJhHAE/Q1E9754wL2HxA4HDW0Ctc4f0/NM1npY+JCxG0hyqAKKp0Y/fO2Fq7cxg/LiH1Z6VaJx0CsndPCA2nKO3fDPXXHpW1/ba3/P9QqE+4lIrOOW+5safMfYzRCxmK9BfMe6WvaGuf7YDN4tGoMiLuhFfEhiC2zizV8gjFjCL2tXrto+67czC1zJFhvncnkerEZDptB/W9IAcvpTtGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBo+nsyanBmU8nlGrT2KDWAWme7zQEX4jvXuT4+tR8A=;
 b=AWvu68VdzOaHFYZs+FuqBraIhLRxMiF/KwxSQKch635wCHaMx/OzeaLE/qFP+1ywHMrWjKt7nvYoQ0Kl75MfG2HW79jkH0EqyCSVYShyC83mWngJjHpcmTugQQ8g3QQNZ6RUZS1LdIl/P2exN1tV6O0M9mO5+4Mn29bgDnpPZ6P6v+mCDfRSr5mxrLCxWkIUsURU8TkHAWM+4M2LQHJzJN87gqQ6IaUDTVZK1pn6L0PnYDD2tfFiHoUn4gRQuxsYmzzPm6bbODD6mIIPZwRgxtLp6iO4cNV12mjwHgZsSlAXc0yOsijSco5tJAEnL0LOjnNtNvpLOoA/1zz/cc0huA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBo+nsyanBmU8nlGrT2KDWAWme7zQEX4jvXuT4+tR8A=;
 b=VpFGTltcPzXt4VWBll36eqUzUbVsRIJtxHacKJerurMZnUveQAC1tmP4lBHchK6XMEqZMljR+lrLbBMpVf+jmul6XlycjK/xO9tRDR5ncv4CwwCTWwAfcxIcCTCvDogLcVeNCLLFU1j1CtRD8dJZdIPEqcA7Hm1k6jC5BfDgQX+yDgMxJPl3cIK5Z7iCArSasRwwqrGrRYhVXZTUGrCFrAVxmlOImrhnEE8M566hjCnfZeiwqravNyHZTP806QXyZ43QY79jO4Uvja8reX74EogN0+wi9zVLKnzeCms9eT8fqUCCPSauz2l7FGrciuBnR5NUqEzii1CP5GTldIDwrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by CH3PR12MB7714.namprd12.prod.outlook.com (2603:10b6:610:14e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 21:42:19 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 21:42:19 +0000
Message-ID: <9048598a-ef02-4a2b-bd44-74e17f0f97c3@nvidia.com>
Date: Fri, 7 Mar 2025 08:42:10 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/11] mm/memremap: Add folio_split support
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, linux-mm@kvack.org, 
 akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-8-balbirs@nvidia.com>
 <e1c3341f-dad5-434f-984a-4a3534657233@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <e1c3341f-dad5-434f-984a-4a3534657233@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::32) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|CH3PR12MB7714:EE_
X-MS-Office365-Filtering-Correlation-Id: e76ae130-c536-4202-1247-08dd5cf7c53f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXhSWEZ5NktaWStzSHl2bnlOaUc4ZE90WFYrbUp1Rlk3bFplSjUzbXhwWVg2?=
 =?utf-8?B?NnA3SFVIVkYvTnhjV21GN0xtTFBlYXhmR1pGOEg3Nk5kNnV0QWJEQXZ5MjBo?=
 =?utf-8?B?bldZZ2w4aVhRWWNpL1QySTVXc2ZLb01aYlllUG80a0w1N2RWVUsxaTQ2MFdQ?=
 =?utf-8?B?QTBocXlpU0cwOHpvNUFaS2p5MU91dUhqNjZ0Q0E2KzhZSWJ6blgyOEhGMGNS?=
 =?utf-8?B?eEtqejYyVjgxUTd5cGRCbXdhL3lWWXJXWnY1bjlOQ1cxbHY1ZGNwcjNlMHNy?=
 =?utf-8?B?Yk1aVUd1VFpQUXRjY2JuTmFJUHRuYWRmaDlRUDRXZERwaWg0UVVoOU5Xc1hp?=
 =?utf-8?B?eVlBMHBGekN4WEY1QWRnL3VRaVlRRE5odFN3MXpRWkZnVlJPaXhCd0xZMVlI?=
 =?utf-8?B?UjFxa251RmFxSmR4RkZqcXhQWnR4VTVtSEVrM1JrSkU3c1RZcGEzcjdtT1hF?=
 =?utf-8?B?dEpyZUp3clRQdldPT0hEQ2czL1l0dnFlRHZ3ZVp6eUc4SEVpR3F1Vkhvbk5x?=
 =?utf-8?B?NUNud2JXZ3MzS0M0MS9FMU9uTlU1OUM2eFk4ZTQ0cXpWblZuVlBrQVREc2da?=
 =?utf-8?B?YkhwbVNYN2ZqT3hueDNxTEZzUGZYY3BVQm9kMTVOMWNQOVd3UjNJRjQ5eXpn?=
 =?utf-8?B?WDdYREtnYTE3aGk1VTM2a29hcE1nOHRoSURXT20xZUJPWmpuV3UvczFvNE1G?=
 =?utf-8?B?cWZtQmc2OGVLRmYzcHYxYkY5WHM2cFllbytmTE95QUdIUE1Xb1pOWWh4ZWhB?=
 =?utf-8?B?L0I5Ujk5WWJBQmFOa3l3cmk1L0hyd090MUEwenlCLyt4U0lKeTdOaUNKOGlH?=
 =?utf-8?B?K1d1eVZqbWZrTVNlTXI4M0lFR0dlUlN2NWxWT2kvRCtoaTZ3Wi9paVBsR1dS?=
 =?utf-8?B?TkVTdStXTXplVEExMHJZWEJId3lvamppV2FGYlZQTnpCajQyM0IweWJzM3Y1?=
 =?utf-8?B?d0ZENzNWVHNEVU9MMXBqek5oMjREUzZFN1RnT25ZTndacmtxZXBnaEdzT0kv?=
 =?utf-8?B?VGZ0cWxKTjR5RS9KTEtKNERSOElaMTRZaC8xWnI5YjdYUExoU2JXRjlXRUY1?=
 =?utf-8?B?VGFWb2JaTGh6ZVNVbHMrbGlHaXFiQnFCeitxYXl4WlJCci9rUGRCQ0prRjVv?=
 =?utf-8?B?cDBsNXdWNTFaQ29oRS9mckc5RXFXWm1hZW02Q3lOa01lVmRqZmdPMklIb3Ni?=
 =?utf-8?B?eHpOck1Va05QTzhqcU81eFdqSWZ2MnJrZXdwZ3NTMmZ6bDJOd2QwTHp6ZEh1?=
 =?utf-8?B?RXdCWWdnOVA4UytuS1JPazJHWmRzQXppZHpGaUU5Sysrbnp6S2M2N1JmbFNr?=
 =?utf-8?B?SGxtN2NuUjZCR2dTTGFUR2w0Mjk3cFkyYlE0ekFZcmVSMm5rTi80WlpmN2Rs?=
 =?utf-8?B?WTlLR1RTT1dwcXB3RVlJbnVZelFuVEkrQTBuTW1yamE3N1grRFdCZWlJN3dz?=
 =?utf-8?B?dElIY3NaZzJoN2R5ZHFYNkh5dDdELzV4VkFvM1hYdDNmY21raDVqTG5Xem1G?=
 =?utf-8?B?Y2U2UXp1WkI3aGNpaXVtVjV5dHg1QlhRWi9mdExXaGxEQ1JqUnBCeEpQZXla?=
 =?utf-8?B?b2VuK1ZGOGJ1T2h1MGVWMjZWSXpnaUlDUlM5NlFNYUthV0o1WXAxTkFLaWlz?=
 =?utf-8?B?WVdZWTJub0xGKzlnTmNoQ0M2V3NyeWZCNzBPWUZ4UmZyeGRTRnpvSTZINDVj?=
 =?utf-8?B?UXM4c0dZUlNlV1JybUsxNXlRdTRRN2pCWGQvLzhBTVI5UUlKTWFoUFZQS1R5?=
 =?utf-8?B?RUxZQW11dW9hajB2dTR5K2hYdnk3dTlVQmF2Tk9GdnlzWmgxNlJ0RUd2UmFW?=
 =?utf-8?B?OFBpVkpGQWtJc3c2UUlUVWo3Qm9EVXNDTStQbDVNYW9Ec2Zia2lyVG1TZVpu?=
 =?utf-8?Q?DnVSxNSgSGPv1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE44ZUh5ODlpVEJvb2ExREFuOUhraWUza1gwSzZVblk2c1VpSE1sdFFVZks5?=
 =?utf-8?B?MXZpQlcwKzVaZytUR2RJU0pock5vSlZ5QnYzdm9sckRZVWVqNk5haERFeENn?=
 =?utf-8?B?OEZlaGRQMmQyWUVTQXdZb29rSEJycXo3WlZ1dmk5d05iNSt5dWhqenFhTjg1?=
 =?utf-8?B?SGN3cUpPSzQwSHRDUExsdElCRkx3eUIrQ1hqaHRpc3Ria212TEZqMlZOZlRs?=
 =?utf-8?B?TGlCYnFjNVRvei9HS3BUMHhTSkxLWmJDMEFSQXZmSUlPczlkK1M0MHVLM0l6?=
 =?utf-8?B?K293amdLaDR0ZitwWkpoVFpiMEl0QnRRbGlzR1ZvUFZTdzZMdXRlR05kU2w5?=
 =?utf-8?B?NEZzbGg4c05tcFhuTDFVekl1OGFBZFF2cUJpMlUvOXNGeiswdGxsNkgxQnV2?=
 =?utf-8?B?b3F1SHFUcmI4QnVMZkpkUFp3UWRkTmx0TW9HdGVyODlicGRNK0hWdkJkWG9C?=
 =?utf-8?B?SG1XU1VaQXA3N3lYcVo4TGE1VW5wTjA2Q3grNEVUb2UzWVl6SkhheVVodlVE?=
 =?utf-8?B?WTlVZXJaMW1mNWRVUHE2OEVKeTFvUm5RcEFOenVSNTJBc0ZzamZkbElCSFN1?=
 =?utf-8?B?L2RrSEdwSk1LamgrT29KdWd0ZzdEd29ER0tzNEJhZlFrSisyMWpnY3dLeXdj?=
 =?utf-8?B?ZkgwbTE2MWdueEIwOTJRVEtwQW9qblRUZWtMQXJDSHRUN3dZdEZWZXVZS3lG?=
 =?utf-8?B?VnllK1JzQ3lFK1ZhWkpzMmxtQnpHYzd0b3h2dmtDdk5TM25OWkVNZ2hpVXBJ?=
 =?utf-8?B?YVlOWk9YQ3Y5RkFMOTNDTG5MbUEvK0Nzb3AwaEJESFYzMFZVNytZYmRMc1B5?=
 =?utf-8?B?K0dCOGtwZkZ5M2lUNXBxdGErSWpIVFBOUGJPczVtSDVtQW5TNWd2QjF3NGI3?=
 =?utf-8?B?a3ljbFBjMUZ6eVZIbGxha0Y1MmdseEJUeEVMcUVnaE01a0hEVk5WWTB6UXZY?=
 =?utf-8?B?SWVwUXN3dHBUV2Zma3VUTjJVRHptSkNZbGg2Ly94TkxSK0pUT0E2Rm1NNmZy?=
 =?utf-8?B?VU1manNEcnhHQWc3VGJtWFMyQVlFcFpueFBlVDBhaGVlUE82RXk5bjJGcUs5?=
 =?utf-8?B?VzVOMDEyNTdIQ3JUS2pySXVVbXpnSVlyTm5uOFA0STFGTk15Z3R0Y3VtcVB0?=
 =?utf-8?B?Z25lbTNWTVJvZ3ppK2JMZW9jbUp0cWRQMDhFNHdTdnBmditoenlXeU9IL2FB?=
 =?utf-8?B?WW1sWldzV2Y0QnVFWFhGNUVzcHplRjM0MVlON25LWXRGOE9ZNzB1WkRrcHZh?=
 =?utf-8?B?UzdpTWxoYW1WMlRaU0c5S1VGbnR5eEsrN0tJbW80b0Ztais4dVE4OFBkNkF2?=
 =?utf-8?B?cmRhMHBqTDVodkN5K04wR21vMFgzY0c0ZTNwQ2hUSVV2RGlONEVZbzQ0V0dq?=
 =?utf-8?B?UnhrUno2RTA5RHBLd0dUZXZ2OTliZ0M1bE5SdFU2M3JUQ2RsTUF5MEJGckNC?=
 =?utf-8?B?d2wwQU1iY20zWHU5b0FCL3VjMDExOWxkSlJJdnNYWndEN1NYRjRYTWxaQnpo?=
 =?utf-8?B?OU9kRmpkaFd6aHU0SW5YdHZVRHUvOWVzdFFXcGpCTHIveEt3UTBncmMzaVRE?=
 =?utf-8?B?a2RBV1VuQm5QekJYTTNHeS9Cclo3dnB6dHk0VnNFU2kzYjJ3REVWRXRpTjd0?=
 =?utf-8?B?RTh4RnNTU2YwQnlDQ3JtekZPQkZSOUJoTk11MkZ5RTF0K3RQV2FTOWtLZVhq?=
 =?utf-8?B?UXY1M054bUhWNFVsSDFSMm01RTRYL2JzYzFVbTE2U3NmYnBPOXJaUUNLSW1z?=
 =?utf-8?B?VlhEU2Q2K043NWJqM05hQzhvODliUmYzU0NIbjZPTmtXRVBaQXpDS3prNkJ0?=
 =?utf-8?B?R3dsbjFZTHZmYzVFWXBuZWkySVkzV3pyS0c1UUZIK0hxZTJOUEdLRW5TVUFp?=
 =?utf-8?B?MmlldDlnVW9aSHU1RXdyNjYrMEsxdmMybVhWUW5seEhrNU9BUHpSenpnb1Za?=
 =?utf-8?B?bVZYWUtsVzVhRzcwQW1Jc3RWWXpCeFJiK1Y3OGZZaTNyMmE4VXp5czI2MjFh?=
 =?utf-8?B?Zi9IVkVsOXU5L0VqKzFQUkhRMmhOS0NacUt1YW9HeUpjd0U5ekJ5cnowQm5h?=
 =?utf-8?B?eXRiMFNzUkk3azhKd3J4RlpYQTlyS2xvME9DR28ycWVpWkQvQ1pHU2NKbnoz?=
 =?utf-8?Q?dnHmCP4HDWl+EGc3gkThRmohI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e76ae130-c536-4202-1247-08dd5cf7c53f
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 21:42:19.3863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXuNLvfczOi20YzBG/sDsLK1HJxlXWhZ3oYq14hyUC9553gXxsEtkBaW5VzuXz67420SToVRIPGIYE/ClaYtRg==
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

On 3/6/25 19:16, Mika Penttilä wrote:
> Hi,
> 
> On 3/6/25 06:42, Balbir Singh wrote:
>> When a zone device page is split (via huge pmd folio split). The
>> driver callback for folio_split is invoked to let the device driver
>> know that the folio size has been split into a smaller order.
>>
>> The HMM test driver has been updated to handle the split, since the
>> test driver uses backing pages, it requires a mechanism of reorganizing
>> the backing pages (backing pages are used to create a mirror device)
>> again into the right sized order pages. This is supported by exporting
>> prep_compound_page().
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>>  include/linux/memremap.h |  7 +++++++
>>  include/linux/mm.h       |  1 +
>>  lib/test_hmm.c           | 35 +++++++++++++++++++++++++++++++++++
>>  mm/huge_memory.c         |  5 +++++
>>  mm/page_alloc.c          |  1 +
>>  5 files changed, 49 insertions(+)
>>
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index 11d586dd8ef1..2091b754f1da 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -100,6 +100,13 @@ struct dev_pagemap_ops {
>>  	 */
>>  	int (*memory_failure)(struct dev_pagemap *pgmap, unsigned long pfn,
>>  			      unsigned long nr_pages, int mf_flags);
>> +
>> +	/*
>> +	 * Used for private (un-addressable) device memory only.
>> +	 * This callback is used when a folio is split into
>> +	 * a smaller folio
>> +	 */
>> +	void (*folio_split)(struct folio *head, struct folio *tail);
>>  };
>>  
>>  #define PGMAP_ALTMAP_VALID	(1 << 0)
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 98a67488b5fe..3d0e91e0a923 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1415,6 +1415,7 @@ static inline struct folio *virt_to_folio(const void *x)
>>  void __folio_put(struct folio *folio);
>>  
>>  void split_page(struct page *page, unsigned int order);
>> +void prep_compound_page(struct page *page, unsigned int order);
>>  void folio_copy(struct folio *dst, struct folio *src);
>>  int folio_mc_copy(struct folio *dst, struct folio *src);
>>  
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index a81d2f8a0426..18b6a7b061d7 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -1640,10 +1640,45 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>>  	return ret;
>>  }
>>  
>> +
>> +static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
>> +{
>> +	struct page *rpage = BACKING_PAGE(folio_page(head, 0));
>> +	struct folio *new_rfolio;
>> +	struct folio *rfolio;
>> +	unsigned long offset = 0;
>> +
>> +	if (!rpage) {
>> +		folio_page(tail, 0)->zone_device_data = NULL;
>> +		return;
>> +	}
>> +
>> +	offset = folio_pfn(tail) - folio_pfn(head);
>> +	rfolio = page_folio(rpage);
>> +	new_rfolio = page_folio(folio_page(rfolio, offset));
>> +
>> +	folio_page(tail, 0)->zone_device_data = folio_page(new_rfolio, 0);
>> +
> 
>> +	if (folio_pfn(tail) - folio_pfn(head) == 1) {
>> +		if (folio_order(head))
>> +			prep_compound_page(folio_page(rfolio, 0),
>> +						folio_order(head));
>> +		folio_set_count(rfolio, 1);
>> +	}
> 
> I think this might need at least a comment. Also, isn't the
> folio_order(head) always 0, tail and head are splitted folios and if pfn
> difference == 1?
> If the intention is to adjust the backing folio's head page to the new
> order, shouldn't there be clear_compound_head() also for backing head
> page if split to zero order?
> 

I'll add some comments to clarify, I'll add clear_compound_head()

Thanks,
Balbir
