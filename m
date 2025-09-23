Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD23B93FA5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA3310E249;
	Tue, 23 Sep 2025 02:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NUfgTOo8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012057.outbound.protection.outlook.com
 [40.93.195.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A908F10E249;
 Tue, 23 Sep 2025 02:16:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uuaLn22fgvMhtOZxZD3DEwqRN3oAGpOxrXo0Hkx9KMQulhGrmoSCignSz+cWQ4zLHFhhCw0wzrjmmL7RbP5q+hVFskzTHAhtx6y8i/+Iwe9vITF+3Ry9p/+i8kyyiYU6BsefTVlkg7i7uBUExWWvpAv4vy/HNukwGrI+nBN0q5yU7fYa1SFtw2+Z30GdsrhePhrQrQKgdWj8VhNIRF6pg46H3eXPXB+8wUUqNJhHi3OH4QcCVVoHyhkpZl99h2MK7xVtT4gG6m2+vKOWjMVkhQ3nt+xlELr7c54pbMv5umNl3q+A3fQpnYF+cjA80Rpg/ifmF4uRHX6ymcx+L/uioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJb01jWSIVv2wB4B6amSkY2zkPduVvhChqoKsk0M/GA=;
 b=bJv6/TBn7YjS99SRr9lIY5NlyoGL/GkHQjq93yrBeIS9Jq8VLZTfkbJt2Px56lctdCMBUl2eR1KGXZomGDFi+AKBUYkH3docBoFxS4KxC68VuGr3hll4tdAUGNejNXbm1SP8ekBMzREiofEnITwu8UYa5JqUPrHkyY1779tAVk3hQ/GvNpoMZjdQp/p3E6/gLrDTXyz38ky4y1uGluQYsLwuCsPLUyEHrJ8spB0VA/qpS/XfcFf/PT5OUDFhpyHtis7hJIcf9nlQ9VQA0uPB1C6zQ2FP84l0dqSWPclFmK610TTUUG67HRWHKd9XuRF17vhW7Fus0m8mrJswCgTE/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJb01jWSIVv2wB4B6amSkY2zkPduVvhChqoKsk0M/GA=;
 b=NUfgTOo8QsFije8PkKJy9KkpYw6qFbaTCppifdp7LxoaGEdcq6dHtTbOZh+CudPYR+d14Y3ILW5eKUwScLoB4xxVLAnrv7wBg+5IQ3npL29LTwhcO5DpguOwq9PpnOOv5gdkG0ptqyncsXMkxGc7/D51vKAkB1CmOdyP6/fy07pBXP+FexW7NmnfqMW5wy5dSXR6FI91INU9BEhqDRNAeBn1K+M0nf1N/FER0SMsL+8m6UVWAH/6cTW4x8bmjWStuQhMv+g1MSYY4YaRSLo7h5fx7e0KHXt8QP4K8CMQtfCPYibxk7RoGYWP2WwX10QrR+71N5Hyvs+e7zzyZPJN1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 02:16:56 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 02:16:56 +0000
Message-ID: <0dbc8f78-5cee-4741-8d33-df3358dd5383@nvidia.com>
Date: Mon, 22 Sep 2025 19:16:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] gpu: nova-core: Set correct DMA mask
To: Danilo Krummrich <dakr@kernel.org>, Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-2-apopple@nvidia.com>
 <7fb081e9-e607-401b-937f-f4e3a78a2874@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <7fb081e9-e607-401b-937f-f4e3a78a2874@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::14) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MN2PR12MB4175:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f01e30-0dfb-42fe-72d8-08ddfa474496
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFFGbVpXL3pzNktiZ2JpbC9tYnFiQlFnNm5FQ2wxNEZrc2JvR3hsSTR2TmVV?=
 =?utf-8?B?dE1nYmY3RkR2dkgyZXpYKzZlR09mb1VUVjkzT1V5UWdIL3RCVEFRWG93WG1x?=
 =?utf-8?B?VmdwM1k5U3dDbW5uRTZJaW1hYUZFcm9QVzJaWGtEZUM1RFRDdW5zdmZRa0Ri?=
 =?utf-8?B?U1pxcXJ1Ti9BQ1JHTmU3Zm5nY2M4V2VxWkdISmNCNUY3cHlPYkpzcUZkcmpw?=
 =?utf-8?B?eVhkeUNCYWZuRDRVN2hlek1SQi9rR1lESXRtL1FZZy84N25zd0VjV2gwWmZp?=
 =?utf-8?B?dEZDZTVoby9xRzlUYmN5V20vSFJQNlpJSkdTbVgwVVhoVUdLcnZTNVJDcnho?=
 =?utf-8?B?dFVtVXYvdmpPVEJLajNXYTBnRlVmWitzWVg0dDhMcklibTViMWtKUG5uVVVF?=
 =?utf-8?B?V25XL2ZCNlY3T0tsbnliUnRwMUJLM0FXWU1scXAyamFmbXZpdlV2SytWMU16?=
 =?utf-8?B?OENjbFZxdFoyY0tKZUwyR1VFRjdCdDNhRXl6QTUwdUt4bEp0eDdCRjZzenc0?=
 =?utf-8?B?T3ZQUVllSXdaUGlMYzh5Qm80ZW0vbVFPdThtdjM5OC9ydnZkR1V0MDlzd0hx?=
 =?utf-8?B?RTJpeDNBSHdzYXFsQWtDcmZubzBMYVJWbjZUeDlWWjc2cnBvdXNxUU1MNTlL?=
 =?utf-8?B?empDRW1UdXJNeHIydzFxSlFCTEtOczl1dHpaeTBxVWpLV054VFFaMzdNYkVh?=
 =?utf-8?B?dkdTaWJTa3pxQzBEZUtaSFpPWnJDWjNvY1drQ0dvMFhpWUJqcVA2Vi8weEov?=
 =?utf-8?B?dEFHRE8vQjNWQ0F4RXN1aXB4YUdzQng2Q05xWmh0Z3EzVzhoaWZHaHdmZzRq?=
 =?utf-8?B?VXdtMnVSVzk1Si9RY2xQTmg1SkRWbWM3eTB3VzNJZTAvaUFyVjlCeTltK3c0?=
 =?utf-8?B?RVNkdWlqaGYyNzNjTVlVWVlRSkpvaFdkT2w3b1U3NmFjN0F5RGpaMWhwZytx?=
 =?utf-8?B?eTltWWV6WlkxOUM5WjU5aEcwYUo5L3dGY3FIZjYvVjV5WWxvUGRUMXkvNUwy?=
 =?utf-8?B?M0swLytaeGtQZE9aa1BMd1Fnc1Nwa3c0QkliZ25VSUd0NzQzQkJocUFhbklY?=
 =?utf-8?B?aTB3MkVLR1NibXNKYkZ0Vzh0aHl6T3FyYVpCMTUwazJtazI2bzRNMURvVk96?=
 =?utf-8?B?N2hMQ2kzdHp1RU1QNERxWEN4ZmNXbURSb2ZQdlZNQlFUN0U1czhCMm56WGdD?=
 =?utf-8?B?NFZuMHRjNXZSbzZRMHNqTFA2a3ZIVW5GeFZSK2NLUnFhbFB2TE5kNXlPcmIv?=
 =?utf-8?B?VG9rVlhjUWpSc0FDcVpuQkowb0NBTjhBUXgvWFlwUlQ1UUJrT1V6V1ErdjQ0?=
 =?utf-8?B?cnE2RXgzcXZGd0J5a01YZEdWNTk2REVabW1NQzV1S3FhTjVPK3Rrcm1RdnE4?=
 =?utf-8?B?d0xiR2R3RE85Q3R0RU9ZKzVLVHZDb2lVam41Yk1JRStoeHczZzE3aktjc1du?=
 =?utf-8?B?enFYSFpYYjRvSm5jNVJ6cm1OV0xKNVkya0hybUVKRGtSa3cvU0JEa2xLMENR?=
 =?utf-8?B?QVhjbmxSNWRJWTNxMnBYZWIyVGVMbkV5ZmhibXU4TXVOMTJYcGx0SHprc2lJ?=
 =?utf-8?B?UzhJSlRiL1hKZ3B3a0dUMW1EWVZKa3RKVnNBWFBRWkdadVJjaFBuWStrZnYr?=
 =?utf-8?B?bnJ4a0JYM3NaRmhpZlFxbzJoY3RQQXBldHY0NW4zcUdWSmd4YXdlQWwyVVFw?=
 =?utf-8?B?RkNxdWJVS0dDb0xYZk5PcG1NaDVVbXdWbXY1VnJKNFl2MmNVUTM2VUg3WFJ1?=
 =?utf-8?B?NHJxZElLS0RLU21YOUlURkpIbmpSMXY1Rk5uYzRIWEZPRGhsV1NXeWlUaVlz?=
 =?utf-8?B?cGZFY20rVWhnL2VMMXc0VTVGYUFFYkt6RXNGcnFlRnNFeWZMcU82dWd6UXJV?=
 =?utf-8?B?dFNvUFpWZlpxOGtaeTVhd3FIWFdLWTFsMUM5YW1TNWJ4L1VYazlUb1RXWDRl?=
 =?utf-8?Q?CJvqtY85dG0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkxucW13cUVXZXQybk1zV1lHZEFKZzVaWUV4ZEllaFVaRGZwTGQ2bGFzbndi?=
 =?utf-8?B?QWpYOTdJVDVxVG1WKzh5STRLWjFVS1UxMlJLOEVmTFIvZjlNZjZkVjdnNmlH?=
 =?utf-8?B?RVZsRjNSMU1VTUtPWGMwZ0JVWkw2WHpDYWhjT2Zlb3J0dVhDOGovUmhWenB4?=
 =?utf-8?B?VEo1WDd6UEFrTnVWU0g4QTNmNFpCSHR2MWhDM3pGSTMycmZYTU9zWDQ0cUhr?=
 =?utf-8?B?UitwRFp3TUdvSTE5S0hvN1hkWERrazg1SXpEeWQ3N2ZpKzRYUDVZVWFVaDlE?=
 =?utf-8?B?di9BbnpCeDRjQVdDcHlqMkNQZWJOeXZBSlpQU0dUQWhVbzBZR05oakZGSkpv?=
 =?utf-8?B?S2tZVGlQMUJ1bHpGMlFtQkhNdkIxOXhEbUlSQkZ5YzMrMHlIazZmNmJkUE1U?=
 =?utf-8?B?MEgvSldIRW5VaGNCSElFaUhpcS9FYTRsc3J0MTAvUGhDR3Vua0NlWlFVQ1ow?=
 =?utf-8?B?ZGZtS3k0SjZhWHE2TFpKTU5lekRQUmxocTN6U0loUDFUQXFjTjdRcTVYcGY1?=
 =?utf-8?B?ZUp1TmJET21SZXU5ekZ5UlU3NVdYQ2lXUy9lZGRCREJQaEVZMEhkRzlQYlYr?=
 =?utf-8?B?dWhueEt4WFJpczlaVVpjcnZQQUlDanRjbGtDc2JHdkJzbTBaSXJPUEs1R2Ux?=
 =?utf-8?B?ZDBSQkZTTU9rTjFJM2xCckVYeUNNVEtJalBnM1V2NVZBcEl3eWlEQ3U0RGd0?=
 =?utf-8?B?T094djdBMVJIeWNYTlJ4MmRXRjJCYWNubEQ2UmhrUVJaZUVSQ0JwUG9DanNP?=
 =?utf-8?B?YjFDZUJoOFVQRW9oVXh6aFhPbjU5RlRkdXdtNmRGQ000czdGT1ZTT1UzOFJ2?=
 =?utf-8?B?UkQyNDR3UnlFQ2FzMlFDaVg4UVgxaEtubENZS2hUblBndSsvczIxeDgvNHRV?=
 =?utf-8?B?R21mUWpNZWJnYkVjMUlISVA3YngzVXZObUZIZWkzM3g2QUxkblJadmZZMXR4?=
 =?utf-8?B?b0FJLy81VEpydVEraEdXUnd1UTdEU21QYm84R0ZFMVZXMXR5ei81YTkvODJn?=
 =?utf-8?B?bWJYcmE4S0tWT2NDbG0xQzFBRHFMTDkxVlRjTDEyTnBFOExkSDVUeG5aMFJ2?=
 =?utf-8?B?STZObTg1TGlYZ1RYUWVNSmZLcVJIdkdmWllqUHhkanE5cFRBaXl4NmloVnQ0?=
 =?utf-8?B?K2J0T1hLR0pFQTFicXBBZWVHRXQ4RHpZYkxWblNzdzRJRmh4a1c5aDVDWDc4?=
 =?utf-8?B?dFdZMEZCaFRlTGlNUzBDTlN5NlpiMERVYjIrcjRoWkF6aU1FaFJURmw3Z2xD?=
 =?utf-8?B?a0V6YUYvUlZWTEcyQU5yUTdMZVM0MWE4OVdOWjd1SExpdllTdlVYT09qRncy?=
 =?utf-8?B?OUh3Ym5YbHloTFlKLzRkVkgwY2k3S1V5R2lLOExBVzJjVzR2UE1DRW5Dc1R1?=
 =?utf-8?B?aVNzWnora085cnFJRTJ6UXdhVE9DMDg2Sk9SUkJ3dmZpRHF2RGdUN1pZc0RJ?=
 =?utf-8?B?ZlN5ZXFVNHdWZThpNU5oWFd3RzFOUnFFWURCLzlJcXNDMFErOG5oODlMbnlx?=
 =?utf-8?B?WjdESWZCOTk2TWw5b1RTSDJhR0lTU3laMVVITms5dEt6SHF5UUl5QW1nSUtU?=
 =?utf-8?B?aVI2aHhLOG84N2JxZXVTVGtvT3diMWw4WU5CSXNIUnRIVzZDZDM4THhXRGRJ?=
 =?utf-8?B?bWpvMzFHZWtVcVBnUUdFRVNvd0xCREFlb1NaL3d6SG5aR2pSdUFZRkkwLzZv?=
 =?utf-8?B?RUp5czNwdjE3MEtSaUEyL0g2WEFYZ29YMWxtd3JpbjZyUW5LTnJGMklXbnpY?=
 =?utf-8?B?OG9XY0JMQXlESUVMV0dwTnBRbDhiL3BDTWUwbk9wZ3Bpb3F2OVc4WHZubHhX?=
 =?utf-8?B?bjd3Ni9hVGFrcSs2cnBudjdtM1ZBQ3J0L25SU0NZUkZocHhsUHoyTHRuSVFN?=
 =?utf-8?B?VkxaNm1vaVRnNWhpMXJ0eHhYUWk2SDMwL1EwNjQ0SUQvRk84eHIveklhQzhG?=
 =?utf-8?B?Q0plTjIzK0xJRUwwM3NVcXovck4wOXJoMHJCVkJ6ZGFDTldyUU1PQUpFU0Zl?=
 =?utf-8?B?ZFVTSjJzb3YycnZYUjc5Ukphdk56YnJReUg2M0gyRWlkSE9ZS1E4dHUwVnd6?=
 =?utf-8?B?cVB3b3ptWFBmL0tNQm1vRGlMOFlnOE9jWUFKOXZBSzYrZitVSXA2VG83blNQ?=
 =?utf-8?Q?Gu1eCQzN128qkYGqoW7GmCGg1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f01e30-0dfb-42fe-72d8-08ddfa474496
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:16:55.9147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 271acqqkhf4EFpH4q4gNq6E+YkQAzkAdQ2r9nNiB0fr1kn/ejhSsN/QcHjuFNJmQRpoocGB2atjVkr/nhw7VQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
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

On 9/22/25 9:08 AM, Danilo Krummrich wrote:
> On 9/22/25 1:30 PM, Alistair Popple wrote:
>> +        // SAFETY: No DMA allocations have been made yet
> 
> It's not really about DMA allocations that have been made previously, there is
> no unsafe behavior in that.
> 
> It's about the method must not be called concurrently with any DMA allocation or
> mapping primitives.
> 
> Can you please adjust the comment correspondingly?
> 
>> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>())? };
> 
> As Boqun mentioned, we shouldn't have a magic number for this. I don't know if
> it will change for future chips, but maybe we should move this to gpu::Spec to

It changes to 52 bits for GH100+ (Hopper/Blackwell+). When I post those
patches, I'll use a HAL to select the value.

> be safe.
> 
> At least, create a constant for it (also in gpu::Spec?); in Nouveau I named this
> NOUVEAU_VA_SPACE_BITS back then. Not a great name, if you have a better idea,
> please go for it. :)

GPU_DMA_BIT_WIDTH, for now?


thanks,
-- 
John Hubbard

