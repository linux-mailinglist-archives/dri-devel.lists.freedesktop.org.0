Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AE6AFDF36
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 07:25:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE9410E210;
	Wed,  9 Jul 2025 05:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YG3MOPHn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4DC10E210;
 Wed,  9 Jul 2025 05:25:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fz7/8FiFbO3KO2o3GXQOdu9nCS9NKn6/WXK5fJ3F+OFOPMM0+ieKC6bHaijGsGFC7H/aHH+XFbFT30Yqc922ZsRHn+jp9cXM+cYvuU9XjcUgslZRO+FgqLt1QgUu1+XJPMFS7jKrx3oE+Gsd8vPiwu/MgbBBUbu60CjkcS2Sln90YOIa9yafCwBTrtUKq/e6HeuDfT3VC7pf2BLSNAG7kcAGnziM5UnoaWsQB2hbWAZYQcqWF7ORo50flbKse45vzZo42EOFmph9MtAffFGxGZVuLCHKHI5KSIRXXv6+cdEyQJ/27PpJdIVFP1TXvyruyl5HrDIOhRUJRQM9r+D1qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oDHhwhxaztJDNvA4rY0cSSPQkkVg2a9gYLcak855bM=;
 b=VJCBtGYHjK6s/mVBYlTdo9jpAk9jjPw4jQXNhBNad0C2ReorzNFszzqXA7HFthWRnlVQFWelSMtYQ9lvBRHz5nLdsY2+Mk1pWf1KBah4KYQZfXFGLleX7Z1pUVWjxVllD+Hm3JA/dEXuWy4/q2yrhoKDKcdOtBvD6Vgu9vCgkpUnDphKw3Qe6Byqnr+VicLbhfTEZ1NNd0hYTrdXEUEOy7nxzg081exduT/cQ3Bu0V/bw+zDihN6dcr4Zxrut/RMzTH71RjTUnjTVu9t9/uuSEoNHii9HwzMNsK+EiVMWfKtbw3yhLNGEO0kboAQsJl8WtHYvu1iJXo39JUKsXq+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oDHhwhxaztJDNvA4rY0cSSPQkkVg2a9gYLcak855bM=;
 b=YG3MOPHncCgCW5S2yoVlPye7uSzRTNbjB/S1nwkq8E5wWhlWw0rMxR2sEvjlt0OgnWWdfRr8u3xpkH5UM1x+kctN1yOs/hCQWfUq97zci4t+VDbo77wtsWUtutCZ1ITz+gIP8D9+gHnuI66a1Trf7y9VwFPnjkRFrQ2qjEIq+hu2ydZ+O7wy5AOxc54hijb0ewx5NWTnhiiCzIcA/8JmwornwrUO2G1O4EF+ihpjGxgL00EwuOAMYtcwT/HXBBHSQ9aS3iuH8lqM6NEfEB00gR/pWHFTuZneQw2Ddb0J6fT9OMZ0me7Ys5qygRxCFnSjiMl73PU1gviE5ZBUGkZUpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by PH0PR12MB7079.namprd12.prod.outlook.com (2603:10b6:510:21d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 05:25:38 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%4]) with mapi id 15.20.8901.023; Wed, 9 Jul 2025
 05:25:38 +0000
Message-ID: <e4feba70-632f-4d97-a917-e53c19d09a32@nvidia.com>
Date: Wed, 9 Jul 2025 15:25:26 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 01/11] mm/zone_device: support large zone device private
 folios
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-2-balbirs@nvidia.com>
 <564babd9-fe33-4ca7-b63f-73f007fbfb51@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <564babd9-fe33-4ca7-b63f-73f007fbfb51@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:a03:331::6) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|PH0PR12MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb063f0-f13d-4fe4-8889-08ddbea909a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXRGalgvajFoVkFlcVFaQ3YyZFJNMEZNQUdJa0JSMjRPTjR1aUtrNXJzWVZ6?=
 =?utf-8?B?QTU2V1k2aWhqZThSWGxhcVFLOGJ2SHFMNFNRSUNsOXRjQm85amw3YXBEVUV3?=
 =?utf-8?B?SkhNSExyQXc4NGV1cmpjYTRTUlBEWXBHYXM4bkRyTjRPZWQyQ21sN2E5V3RY?=
 =?utf-8?B?eUlwSk4rUHl5Z0NwOE04VFhhUzVBREFzWjFOdmNOWWJnSkZqTVdVaXJ6U1ox?=
 =?utf-8?B?Y0kvdGd4QklKODV0Z2NaT3dYaXpZamUwa3pvbTJ2ZXk4bEFIVjFqUGlwbGp2?=
 =?utf-8?B?bE04M0xEMHMyUGtxaWhKeXpGcmFKZUUrY0Z0MkxYSUVJQklmVFJkTHRaWFZy?=
 =?utf-8?B?WUtuTDE3cjNDQVN1RkxFN3U0aVlQczNDNTZWS1RVcVpkRk8rSm9wT0UvWW5I?=
 =?utf-8?B?OFRBa0tCbjRDVXpIUzRqcUg3YlY5aEhVbTBjdUtSdWlNMTBOQytIc2JQWG9V?=
 =?utf-8?B?OVh1bFR6NHhtWWROZ2UycnZvcmJqQ2dnV1Z5ekZEYWhDOG4rWWtxK1Z5VU1M?=
 =?utf-8?B?WFJUMC8zbDNRd3BBZlBEdk4ya1g0OUlCOC94VGhoOTlLbGpZVEUzZEJFMCsx?=
 =?utf-8?B?VnJzaGVUVDRFWVZGK1hRdjJ1VDZ4MnQrdjdXNDd4eUFUWE9QbWFkak9tUGN1?=
 =?utf-8?B?MjUzekt4OXQ4Z1FxUzljT0FzbTlvektjTktrRzQ2VjNQTUtsN3duSksvblRS?=
 =?utf-8?B?dURxcXdEalJ4VlNhNjR2KzN0VXJUR3NWa2VwNk1HRityM2s4QmhEcHRmVEpu?=
 =?utf-8?B?N040ckZheTAxZGJGK3pYME5BYkpTakhTcndtZzAvbjJEU0VLVnlJaDdhVkRv?=
 =?utf-8?B?M1hEYlhnKzRwT2ZWUm1VWDhvZm4wYkFTajFPRElZcm5yblhrWDQ0elpBc1dl?=
 =?utf-8?B?VHVmNU02a3ArbWt4VHdGL2VCbHp5YURiM0JlWVlYNE50LytZVXc3cmFFb0Z0?=
 =?utf-8?B?RUlobmdNcXZkYnhoZTl6NU4wOVNsTXFPcW5IZTQwbjRGOHIxdmlyNnhhbE5U?=
 =?utf-8?B?REZla1M3MFI1QVZXU3BJSXozUGtoa1duckpBQ1ZOZk1tUXlWNS91am1vWDNO?=
 =?utf-8?B?ak9DdEtjZzk3MHk2WU5ob255WFlLZWlVVytaeStmRjRZeU56OCs0UUxEckZ6?=
 =?utf-8?B?aDYrM2FJOEk4ZWR5d3ZHR1BFNE9KU1IxWmVYMWJ2UGtMT25RdmJRNGg3U1RZ?=
 =?utf-8?B?M0RtMkFET3hjNllRSFVyaHlwSDBPTTR1K1BJKzZUTWp6WEw4OTVDOXIzanA3?=
 =?utf-8?B?RUd6OTMxbWhtV2QxemQ4R2ozRmVxUWk0cHJxSndGNjlaVWZTT2Nwd25sZG1i?=
 =?utf-8?B?ajNwZHF6REZvQjNkT3M4OU1XT05rVWRZaklKMlNZVnZMaTIxRDNEcVlvQmhX?=
 =?utf-8?B?QW9GRWN0N0lURXY2anY2ekl5bFJhN055aUw4bmJHN3l0N29ld2RqeGxtcWVt?=
 =?utf-8?B?eWJwZEFDNG9YNDYwWTN2TWJJL0pOQVlJMDN5S2RlV0tvcENDMENjdkwyeEl2?=
 =?utf-8?B?TDloV1pOdzNrTFEvR3BuLzBQTzdRWElVb1RnenI4czdobmJlbWkrUHUxclRG?=
 =?utf-8?B?YWNDcXo1OGNCYUtOSU5pZFBiYk5BOXpLdThlRW1OMFc4UTFPL2JIeS9mVWlQ?=
 =?utf-8?B?Nndna0VnUlNhTlN1MDVoNGpZbERScC90YzRNWFZtR1ArMlFrck53djZ4cTgx?=
 =?utf-8?B?NmU1djlDQlpkc3lwUFlwZERqUWZKckl2cVpTVG1JU3c4SmcyeGQ3ckcvVjFW?=
 =?utf-8?B?N0hsUVFjNm1aOW04T09paTJNWmhDL1BIK2FMMXhTdnM1d04xQ3VCSEVJeEdY?=
 =?utf-8?B?N2RyUThXUnJONEJrSHoxam1RWWpzelVIK2E1QW5JM0p1Vkh4L3lJYkNoTmxv?=
 =?utf-8?B?dlFIWE8vZG44d1ZWRk9aaFliUmZVektzSzZtR1pPNDV6SDd4RDNuY2NZeFdJ?=
 =?utf-8?Q?zhgpje2gsYo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGdJZCtpWlh3TFNOMUlBaU1rbWRXaTQ3K0FXcUxWMHM1WlFWWDFpVm0yeGd3?=
 =?utf-8?B?OTFDTXJBeDFGd2dxT0ZnL212NGlTWDM0K21jZ2tuYnFzaFFoUS9tTDFKTWtX?=
 =?utf-8?B?V1FkMUtEZVRTYWJwNFgwanR5dFJ4aSt0SmJEOFJRbWVKUkc0VGlHa0Rxb1BV?=
 =?utf-8?B?c2ZEOHFQYzRaZVdWYnFDRkd4RWRwSHV5WU9Xc0V0NDY1cmhFK2d5WlA5d3ov?=
 =?utf-8?B?VzM3VmhZdFo5M283OFAvUmFmM3crQnhRQXFadS9nTTlnQWJTbjlSeTFFTm9p?=
 =?utf-8?B?a3VscmZVdnFrbDVHV1pDZXQ0c2hUdFFzWlZLZHhNdzJmOVhoSzg1MGdVd3Zz?=
 =?utf-8?B?NlVBRzJocmk0UVl4ZlU4dDM4SzZHUHFoc1JjRmt5Rk1ZTk9YWjY0VEZlcVlu?=
 =?utf-8?B?TlE0V1FiSkhHdGl6RnhYcERJRXFRWVorenphZEo3Qm9jWWoyb3RBdVMzaGor?=
 =?utf-8?B?cldNR2kzRjZxUUwwcHlsTWlDT2Y5SGVHcTByOFRvVjB4Y3A0bmU0OXJZUm5G?=
 =?utf-8?B?bEtCOTYzQm14ZGwxbHBRdGFQSGFXRWdBVzQvajhZbXJlYnpiN3JHcndqb1FI?=
 =?utf-8?B?Rk4zdFRLNVN2ZXhTRnVzWHJXQnBsZVlyR090UXplMHczK0RyOU14Z09sRDZh?=
 =?utf-8?B?WElDRCtLcXVDbFM3eTJZcWQwRFFEMUtYdGZqQTM0S2NWWnhCdWh2WnJNa09u?=
 =?utf-8?B?SzRnbVRXTTZXV0JtSVhFSlIzd3RvZTRrcjBiRnhHV3J4ZjZYbGtEZVFadTlO?=
 =?utf-8?B?ZjdER2xyMm1aOHNKYi8rQXhMTDFRRm83QmQzeEdxbzBVdUxYK1A0NXd2MUJT?=
 =?utf-8?B?czVvTFg1ZmdWTVZYaFprUmlHR0N3di90dEhZY2xSdTdMUlNOMzNhbHI0QnNP?=
 =?utf-8?B?NU9wWlpyTk5FOUlFOGR6WmhPUVRVcG5VSmhzb1k3aExrNXo3MmtQQWJkVHR6?=
 =?utf-8?B?N3ZUWWNUL25nOFZBd0MwVUtjdUMrSGNlVEV2cTBQMHlkSy9ZL2dTMWxzV0lM?=
 =?utf-8?B?Y05tZmNsR2ZocVFDKzdxNUlUSjJBdmxYNlFSanNsOERNUW12aytRdXRSMGFx?=
 =?utf-8?B?S0d4T1UwdHd3b1ZFVWFnUVU0Yi8xM1hJendqZnRSYmtpMmJPdGdVS05Id1ha?=
 =?utf-8?B?eXVUSWNoZWlrbmJVVW9GNjVqdnBmSVJ5aHl5TEtiUmg3RGhNWU5JKzkvZERn?=
 =?utf-8?B?MHBrVDBwdzJPWVhTaUJiU042YUkwWUlvaFZVUVVnUWw1clJHSDJ3Y0Vnemlr?=
 =?utf-8?B?T3poamxXcjQyZTYrRVcwajUvNHdqUXl3Z2VTeHExbWI4TzQ1VWFKL1lXbDV4?=
 =?utf-8?B?K2ZINzQwVVhwcE94dVZzQ1EwL2ZETFlUUHFhdmcxOFgxZFozVGhrazlTQ0hE?=
 =?utf-8?B?ekRXK2UzSGNtQ1BnSXdKRjgxK0M0QTU4U1k0UmNHYzNzeTZ3NFJzT3huRmhs?=
 =?utf-8?B?ai9OWFhycWc5cXhoU1JMM21LVVlUUnNpM3Zwayt4anduR0pXZE44TUJxYWgv?=
 =?utf-8?B?TDUycFNWTnVtS2lNOCtCVFRWbmRDY2NGK1d3ZFVEclUwZkhHUDFRMTVVUEN2?=
 =?utf-8?B?OWRxZ3Z4QVk1QXB4OHFUWkMwR1NwSGh4UzRmZFNseWNzS2NQOFI4TzZLMFdx?=
 =?utf-8?B?cVVsUWlKdDl2dHRsM0c5Qng3QnRzMm00ZTM4dEd4bE9ycm9mOWh0RWhGa0xY?=
 =?utf-8?B?V1JXbnFBVVRXc3BuUXdnbzJBQlRIWU1PL0pmVzNJcFRUOUVDeTR5VUVCNVQ0?=
 =?utf-8?B?RzhIcFFsSTN1d0h2ZDIzWXg2c1hBbGFkY2JGcGJIQ3N0SmhLRmZLVkhEVFZM?=
 =?utf-8?B?TlNEKzlwcFl2eXBHQS9idk9uQnNFeWprNU43R2w2SzRYNlhML3BWL1lkT1lJ?=
 =?utf-8?B?ZUk4QXJ4MHN3U3laK0J3MUxsZTQ3Q2k2dmVmUTFmdklBd3pmaEpyUVhwUFRo?=
 =?utf-8?B?VXN3SjhZdkhBVHJsd3c4cm01M0VMS0Y4bTdnbnZpMldrUXpzWmUxc1VFK0JP?=
 =?utf-8?B?MTd1UzVlSkNHTG9yNVhZdis1Z0taM2Y4VGRjU01DdmVtbzFHby9POGc3Szl1?=
 =?utf-8?B?SnpuQVJpTlgzcTA1MUtkN2NxVmg5eXByVHdWZ0Y5dlBOdUlwcmxpaXB4bWFC?=
 =?utf-8?Q?YcJZ1a4ol+g7u+eQsFBDCeuEu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb063f0-f13d-4fe4-8889-08ddbea909a0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 05:25:37.9101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c023WE/N71KH9qHfIYpfC0tKErDdsDPfIe++FKJ969TKzLGtz9r1sj05ZarNoFWsvhGLLa1Ai6Pfe6qEjlLtcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7079
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

On 7/8/25 23:37, David Hildenbrand wrote:
> On 06.03.25 05:42, Balbir Singh wrote:
>> Add routines to support allocation of large order zone device folios
>> and helper functions for zone device folios, to check if a folio is
>> device private and helpers for setting zone device data.
>>
>> When large folios are used, the existing page_free() callback in
>> pgmap is called when the folio is freed, this is true for both
>> PAGE_SIZE and higher order pages.
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>>   include/linux/memremap.h | 22 +++++++++++++++++-
>>   mm/memremap.c            | 50 +++++++++++++++++++++++++++++-----------
>>   2 files changed, 58 insertions(+), 14 deletions(-)
>>
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index 4aa151914eab..11d586dd8ef1 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -169,6 +169,18 @@ static inline bool folio_is_device_private(const struct folio *folio)
>>       return is_device_private_page(&folio->page);
>>   }
>>   +static inline void *folio_zone_device_data(const struct folio *folio)
>> +{
>> +    VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
>> +    return folio->page.zone_device_data;
>> +}
> 
> Not used.
> 
>> +
>> +static inline void folio_set_zone_device_data(struct folio *folio, void *data)
>> +{
>> +    VM_BUG_ON_FOLIO(!folio_is_device_private(folio), folio);
>> +    folio->page.zone_device_data = data;
>> +}
>> +
> 
> Not used.
> 
> Move both into the patch where they are actually used.
> 

Ack

>>   static inline bool is_pci_p2pdma_page(const struct page *page)
>>   {
>>       return IS_ENABLED(CONFIG_PCI_P2PDMA) &&
>> @@ -199,7 +211,7 @@ static inline bool folio_is_fsdax(const struct folio *folio)
>>   }
>>     #ifdef CONFIG_ZONE_DEVICE
>> -void zone_device_page_init(struct page *page);
>> +void init_zone_device_folio(struct folio *folio, unsigned int order);
>>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>   void memunmap_pages(struct dev_pagemap *pgmap);
>>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
>> @@ -209,6 +221,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
>>   bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>>     unsigned long memremap_compat_align(void);
>> +
>> +static inline void zone_device_page_init(struct page *page)
>> +{
>> +    struct folio *folio = page_folio(page);
>> +
>> +    init_zone_device_folio(folio, 0);
>> +}
>> +
>>   #else
>>   static inline void *devm_memremap_pages(struct device *dev,
>>           struct dev_pagemap *pgmap)
>> diff --git a/mm/memremap.c b/mm/memremap.c
>> index 2aebc1b192da..7d98d0a4c0cd 100644
>> --- a/mm/memremap.c
>> +++ b/mm/memremap.c
>> @@ -459,20 +459,21 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>   void free_zone_device_folio(struct folio *folio)
>>   {
>>       struct dev_pagemap *pgmap = folio->pgmap;
>> +    unsigned int nr = folio_nr_pages(folio);
>> +    int i;
>> +    bool anon = folio_test_anon(folio);
> 
> You can easily get rid of this (see below).
> 
>> +    struct page *page = folio_page(folio, 0);
> 
> Please inline folio_page(folio, 0) below instead.

Sure, is that preferred to taking a struct page ref?

> 
>>         if (WARN_ON_ONCE(!pgmap))
>>           return;
>>         mem_cgroup_uncharge(folio);
>>   -    /*
>> -     * Note: we don't expect anonymous compound pages yet. Once supported
>> -     * and we could PTE-map them similar to THP, we'd have to clear
>> -     * PG_anon_exclusive on all tail pages.
>> -     */
>> -    if (folio_test_anon(folio)) {
>> -        VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
>> -        __ClearPageAnonExclusive(folio_page(folio, 0));
>> +    WARN_ON_ONCE(folio_test_large(folio) && !anon);
>> +
>> +    for (i = 0; i < nr; i++) {
>> +        if (anon)
>> +            __ClearPageAnonExclusive(folio_page(folio, i));
>>       }
> 
> if (folio_test_anon(folio)) {
>     for (i = 0; i < nr; i++)
>         __ClearPageAnonExclusive(folio_page(folio, i));
> } else {
>     VM_WARN_ON_ONCE(folio_test_large(folio));
> }
> 

Ack

>>         /*
>> @@ -496,10 +497,19 @@ void free_zone_device_folio(struct folio *folio)
>>         switch (pgmap->type) {
>>       case MEMORY_DEVICE_PRIVATE:
>> +        if (folio_test_large(folio)) {
>> +            folio_unqueue_deferred_split(folio);
> 
> Is deferred splitting even a thing for device-private?
> 
> Should we ever queue them for deferred splitting?
> 

Not really, but wanted to do the right thing in the tear down path, I can remove these bits

>> +
>> +            percpu_ref_put_many(&folio->pgmap->ref, nr - 1);
> 
> Looks like we instead want a helper put_dev_pagemap_refs(pgmap, nr) below instead
> 
>> +        }
>> +        pgmap->ops->page_free(page);
>> +        put_dev_pagemap(pgmap);
>> +        page->mapping = NULL;
>> +        break;
>>       case MEMORY_DEVICE_COHERENT:
>>           if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>>               break;
>> -        pgmap->ops->page_free(folio_page(folio, 0));
>> +        pgmap->ops->page_free(page);
>>           put_dev_pagemap(pgmap);
>>           break;
>>   @@ -523,14 +533,28 @@ void free_zone_device_folio(struct folio *folio)
>>       }
>>   }
>>   -void zone_device_page_init(struct page *page)
>> +void init_zone_device_folio(struct folio *folio, unsigned int order)
>>   {
>> +    struct page *page = folio_page(folio, 0);
>> +
>> +    VM_BUG_ON(order > MAX_ORDER_NR_PAGES);
> 
> VM_WARN_ON_ONCE() or anything else that is not *BUG, please.
> 

Ack

>> +
>> +    WARN_ON_ONCE(order && order != HPAGE_PMD_ORDER);
> 
> Why do we need that limitation?
> 

mTHP is not yet supported in the series. We could keep this routine more generic
and not need the checks, but I added them to prevent unsupported order usage

>> +
>>       /*
>>        * Drivers shouldn't be allocating pages after calling
>>        * memunmap_pages().
>>        */
>> -    WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
>> -    set_page_count(page, 1);
>> +    WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
>> +    folio_set_count(folio, 1);
>>       lock_page(page);
>> +
>> +    /*
>> +     * Only PMD level migration is supported for THP migration
>> +     */
> 
> I don't understand how that comment interacts with the code below. This is basic large folio initialization.
> 
> Drop the comment, or move it above the HPAGE_PMD_ORDER check with a clear reason why that limitation excists.
>

Ack

 
>> +    if (order > 1) {
>> +        prep_compound_page(page, order);
>> +        folio_set_large_rmappable(folio);
>> +    }
>>   }
>> -EXPORT_SYMBOL_GPL(zone_device_page_init);
>> +EXPORT_SYMBOL_GPL(init_zone_device_folio);
> 
> 

Thanks for the review
Balbir
