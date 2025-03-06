Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2807A55AD7
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 00:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3790B10EAA8;
	Thu,  6 Mar 2025 23:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uVtQR1i0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C6DD10E288;
 Thu,  6 Mar 2025 23:20:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebV06TUPchNcuEhRMGXJn//7b75QK5AJEO67hZekutllMkJG3CJwy4z1HCQWYbr/Ut6XfK658a8WEXRE1PEfmwZD0SyRPtwf2CXeRnMHq/9+sc41/0nawjvsA4Wsm9VOijJy3tyUXITMBlQOij61L0CLC7HmB5Ohx/yrfzP9dAHGmh4ldFOVRX1y0nPmZ00GRfsdBdjkkRvGq995PXCfiYBwPxl/SNpTBEJBDPc8gtyxdXvodp71B6lnwVuIer9ijP1U+LTRtx67nDf2FKcv/QYLWTyBytUsLudXoodYgxV57kD+5FZCXa2uEboCPU2B9NQzbG2agNKyfbLRbHgEmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bww/b3jbVG/RXaq8bC1xNoTPypStt+KB5fR58EaUBc8=;
 b=Toe6vmGwY6fZ10kMRB+B3Muo7g2THzER18Ed15K9ZcRKmTQArk+FnmEdMYj7aPjkxTMroLCPR8wRVuI6+6vZuqLZXTzuVq07gHw24n1hVc2kN+7fkQ3GHys4TaH8U2jtljlEcb4NRnHFFnYQGPs3eEBvfZ2YxeYBXvjTjpIGYgYFuDvjzsHzAWH5UOj47WI5tO1a7sqokboV5pL0PLsXnjb64DJ9+DulfH96J6vnxE0K2/79gOB7/AcMsF3aU0VbyylgkZndEHTSWs7Nw8n2qRphkGst9NyLfX1oHVUiWZv53RFDXA1wg4Sh59kF+5D+f5Os1dqH40Z9w6ccva8VuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bww/b3jbVG/RXaq8bC1xNoTPypStt+KB5fR58EaUBc8=;
 b=uVtQR1i0ANrInQLwxqHgUkwqIDVQSPNmuFu2Oim+ohtbFMo9Acw/Iqe4CuFMWax8r60BKDvanThV+BowGy7Gz7ToeSOOyE0lEKm06GnlXlrhA2toucCzUnD0SW40FHGXpHQcFt6EpGUF7gTO6DXh5bGtsdM7lIDihh0WSh6PfYcADFqbIiSuT4R/3gFByo+9wTicQllZkSolwfTvn4n3soZJO0dVcln5qW7gkDGo0fIzu3DTvrNRBnE/rAjitQxHyiG66ethQUuQZU0NZvc++um1uXTqiXGHAi85g0bLhrIc+4Zd7IzXWN5ATAGn7heLSH7CNaysXwe0kk7n54jw8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by BL3PR12MB6404.namprd12.prod.outlook.com (2603:10b6:208:3b4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 23:20:37 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 23:20:37 +0000
Message-ID: <6a8d6234-9d45-40b0-9038-e09f1084b229@nvidia.com>
Date: Fri, 7 Mar 2025 10:20:30 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 00/11] THP support for zone device pages
To: Matthew Brost <matthew.brost@intel.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
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
 <Z8oq10LQBGnqpjQl@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <Z8oq10LQBGnqpjQl@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:40::34) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|BL3PR12MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c1d09a3-9644-4a3f-d5ec-08dd5d0580cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmRsYVZJN2dRV2hvcEdUOTNTVVppTDEwTmg0azZzTVRKRDZtc1IrbXFld2wy?=
 =?utf-8?B?MGdFWlBseXRyS2ZwS2FSMkdtNWJvb3BzYjAyU0tlRUtma3lQWVdUTlFybHFO?=
 =?utf-8?B?c0JsaENGVmxxSHY4bjEyOUNjeWJ3VkJVMHExaVdmMnk3ZkpjSUo5SjZ1Rklo?=
 =?utf-8?B?ZVVFdzdmd2JsK2RTYTY0dURqSGdMcDd5YjhhbW41MDNPOUtXUTYrZnpJcjJn?=
 =?utf-8?B?M3ZNWEhzQUZ2bVo5ZStVeEEwNjBqd085U0JGWDJhZ0M2cHgwL1RDZXgwV2Rw?=
 =?utf-8?B?RXMrTWdkNVE5Vk14TURBcHdRWXlrQ2VMejBOQUhQTkdqZzdrcTVIS2FRMWl4?=
 =?utf-8?B?THZnRlFMVWNaMVl4NTc3ZzJGUDlPTDlNYlQvd2U3OE0rTmtuNGZhSTVPVzFh?=
 =?utf-8?B?OFI3eTlPbEJpdjlkT3B5cWVpWFBSZkhCVFJhVFpWS1ZpN0pNaWhSMk9nSWkr?=
 =?utf-8?B?bFhFVzdBTGIvd2tLeXYvOTlqSUJRMWE5eVY5WFVKR2JVNUxKYXNaRzU5dzJH?=
 =?utf-8?B?VGNTOSt2VVRPdXRFeHJ3eXF3em9PNVJHNWd0bTAxQ1VQMXpCMHZmKzFJNGNU?=
 =?utf-8?B?RzlscDNUMDl0OFBrQ25sbTgyY3lSdVFGLzBRbFBwNFhzSUZnUDRGNURYZ2xj?=
 =?utf-8?B?cEN2T3VJZ1l0TTA5K3JXR20veGpjZzVDWW55d3BRTDIzcHVFK291aDlSM0Qv?=
 =?utf-8?B?SkZBNEwwelMyUk03dGY1OGtwN3FwVUF3OS82bGRRV1gvVS84WWJkSHgyT2pw?=
 =?utf-8?B?V2tBU2tLMEhHSTdHLzhuYXE3ZG5INDRES3JRSVZ4Q3VxR05xcHVob25XRzQw?=
 =?utf-8?B?eXNSOFAvYlE2M2laV3VqRTNMK3hlNHFjdkloVFE3NGxCWGhyL0xLT2FYMEp6?=
 =?utf-8?B?T0tYUUEzYkNDRWJmVGxzWmh2dmJVWlpMV1FETGNCaHE0YnNjc0Eza2dWVFBl?=
 =?utf-8?B?V0ZOZndvSmRLWE10M1hnVGVFNUdGeHJmWGdPVUQwMjJBTlZSUUp5emRhbUYw?=
 =?utf-8?B?MkhheUdWeExJeklQT1ZtM0dhK0toZ1lOWlQ2c1ZZUWVSd1U5TVdQNitHTmF0?=
 =?utf-8?B?OWVGcGZTb1p3YTZYMFAzbXdVQm9tNTNZaFA3Q1N0T2ljZTFwdWNFVU4waSt0?=
 =?utf-8?B?VmdVcG9ENE5wdWFEYW9saFZaUERnOVAxN2FVSmt3NnlULzBYbTdVN3MrYVk5?=
 =?utf-8?B?VmpUTmpNazFpRGozODFLSFNsdm9aM1NnQUhDOE5QVDgrSlZsZVY1b0kxZlVu?=
 =?utf-8?B?aFlXNUhRWmo0RUFwalc0RkNoMEdWZnY3TGRYakpudDNMS3NNQW1ra1FZVVRl?=
 =?utf-8?B?TDVrZ284U2FVbEdMVUhkWERBR2xqTUZ4VG1sVVd6UnUwQWF5ZlgyaCswYVNp?=
 =?utf-8?B?dGNCbGo2L2hkNWZSU3VPc0g0b3ZPbWZtTFRxZXlIeDhEU3pHVzc5d0l2SDRK?=
 =?utf-8?B?UnBXUnlNYW14YWg0TWU4c3E2Y2RYV204Y1VsZ1NIYmJiZHhrSzBkZE1tZHdt?=
 =?utf-8?B?eU03WkRDWGZSbkZxUkZheUE3VW9tdWRMR0RJNUhvL29pNklFTHZObXB6amxS?=
 =?utf-8?B?Y3dCb0cxQituM0xtTVhKMi9ld2xVMnU4Ri9rK3VrKzFyNC9yRC9yWXRiUE50?=
 =?utf-8?B?WEtLZ3RDcHFxa1hyRFNrVmJQNS9Ed1RmWDNjcEFHcUtJZEJDdVdFQkcyYng5?=
 =?utf-8?B?NTE3clpYb1RyMFZLOHFIbFRRclFCOWZNL3FjN2lxS2M5eWhXclBLTlRFU1Zw?=
 =?utf-8?B?bkF5eHFaZHRUcS9xekxTeFd1Vms4Q1I4T290TE9GMHlNZzV3blpEaDRaS0Fy?=
 =?utf-8?B?bzFYVDJ2WnRqUnI1ZDNocDcwREt1WXU5Uk13MVZxQlQrWSs4T0xDTjJTQm4v?=
 =?utf-8?Q?Ej1gMn3HvtsAt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REJrMTQ2QnZNWkRqV0FIRFIrb05iZTlIanF6LzZqRUNUUTFPcHFGNVdpUE9k?=
 =?utf-8?B?TmhjS2Q3ZFFCQ2w5dGVEVEpDbi9wcUIzVG0zREE2a0p2ZXdJZU9LUDN4SUF5?=
 =?utf-8?B?M3dXNXNoWW5xOFlvdkRGYlBJYkdwWUcvZ2N0Nk5zV3VEY3dWSjRxRnZVK2dx?=
 =?utf-8?B?ajlQaHRJcDhqWi9lU3FSU1dpS2JoSUpmSWU2VWpnRlVxS2VwbVhTcFNSNzdB?=
 =?utf-8?B?UWNVVUZINXZYTzRzYTlqcEhjbGw4MGRFSEkrVDZVVTdWR282a3BBazU5SDJn?=
 =?utf-8?B?WmFaZHZ0RHhJLzIwU0hsQWVoYktCMFBMQ0VXS2VjdGdleVA4R2F3blVTaGR5?=
 =?utf-8?B?d2xLV0oxaHA0VlJTdlRrdU9VSlZHYm54NDA2a0RxbFBtM1RGd1RsZHFRdjRS?=
 =?utf-8?B?Rm55ejdrejZwVTdsVitEVGpoRjVUVjMzV0ZKQ21ybGhHbjRNQVFDUEtYVUU3?=
 =?utf-8?B?WlgycTltU2hnbHNLUHdwekxnSXpWMm40VUtEdnpta2NLR1pPNTBFMUxlNTlz?=
 =?utf-8?B?eVZ6UDFxb2hLOEpOVlRSL3pHZWlWdFZEaEUyUXR6K3FtYk52OWRoMWZJYklx?=
 =?utf-8?B?TTgxRlEvMDIvWlpUS0F1c2VPc1J1NWRFQWh0L091dGhmc0hnczBXQnVmTWZQ?=
 =?utf-8?B?UVg0S2JQWmY5d1RGRFVVQ3d2MDAvQTVpMmZnRlhmTHRtZWtBcnhmYXU5OC9D?=
 =?utf-8?B?L29meW9wYUdxdmFEWmtLTFQ3bWdweS9kWWpqT3h3TE8rb3Y3M2JTaXNFMnF6?=
 =?utf-8?B?USttL3N3L1FoTUVxSUJCc0VtV1JqSVBZeVZFL01iMDRjY1hOeTlYNkkrbG1o?=
 =?utf-8?B?NkIzT2tTWVhQcENJbmgxKzUyb1ZIOXptQlp1UjdoZmJsaS9GUTlpaG81WHlP?=
 =?utf-8?B?cTduVWVKVXhzTWxMeDE3U3NZNWJrWWY2RTFOcmwyOHFrLzB3VjlTWFdUdm9Y?=
 =?utf-8?B?QXlOTlJvd3pHWEFTZ0JKRWY2RXZZRjJkMlpEZzJLOUpnbjZPcmdEZDNIcTNW?=
 =?utf-8?B?TkJmZ3RVUWhWWXNJbW04Q2M0RU51QmtiOFJnc3pINUxWcGhhLzNxc3VIcHc2?=
 =?utf-8?B?bzlGVFB1dHBCaFllVEUzVS9yWldmeVJWcnJBOFhyRzU4MHVFcXZneDl5c3Jy?=
 =?utf-8?B?aDdvOXp4TTBRcVlFV25odjd3RmtxUzM2aDk5YUV4OWc0NGJ1T1pZc0xRdExT?=
 =?utf-8?B?b1RkQjY2MTVLYktHWGlicWdhRktVZVNUdThTS3JPdWtkbmNsek4xOEZoYWJG?=
 =?utf-8?B?R3Q4VHRaWjZ1bjdsZkc1YWQwaWhXZWF3ajdnYVFHK3BTR3JtbHlHdnlkZ3JD?=
 =?utf-8?B?MmJMeFJ6RGt5Y2JQUWhRRFVpM2wva3JKVWJwS2xQYkZVMXBlcHRWWjJJdHhP?=
 =?utf-8?B?bUJhMVZnNm56ckh3SHBic2tFRVBadG9ncDFGOW9SRGcvbXhmUXNPMTJUT1BZ?=
 =?utf-8?B?YURjNEVwN01NeDNZeks5Nm5GU1h1a2RtT2xHSFA1OUl2Q0ZCSitoV2VyU1R0?=
 =?utf-8?B?RHVrcm9KS3JOajZ3QzhNVERvcFBMakI3b1RkcW45bnpJNEd5ODBsTGlpU1Nn?=
 =?utf-8?B?Q2xGMXNKNjFsZjBkVUQrSHpjWlk2UUxpekVrWU15WE4zSGNPQ0dnUnFWaDFY?=
 =?utf-8?B?K0hJQ1QyM2RDN0x1c3NXU1c4b3BTeStxdkx1UUxjcUZINXBMLzJzTUsxYUZ5?=
 =?utf-8?B?am9rVEFDUlBCcGNTUm8xVlBFQ2hUaU9QeEs2S015TjVCK3RRZU5hMnVRZDdL?=
 =?utf-8?B?UG1jRll3RXNPYy9pV1kzRDVxY21VZC9IaTBiL2JkOFNhcmMyZHd1ZWVrYXFZ?=
 =?utf-8?B?NFBwampSVlphWThzTzZTeHRwdFBOc0ViUFBHbXAvWER3RG5zK3R6M2ZOaGM2?=
 =?utf-8?B?WDBYSThwcHhaZUNXYngxb1NDRklVOXY0UmxOUkdiNm9TRDZlVUFyc1gyWENl?=
 =?utf-8?B?azdQYzNNS1UxZVlBQ01yelk4NFg1SHVqSnpBSFcwOFMzc0lWbEwraS9remQ0?=
 =?utf-8?B?VzJPL3VjaVJ0amdsUTlodWtIdWIxajhGKzR5Y0c1QnJlU3YwcTJwU2NuV24v?=
 =?utf-8?B?aGJJdjcwTCs4VzVxaDQ0Zjh0M3JoOTQrN05GT2JVdEtabTAwdmZQcFVXRENV?=
 =?utf-8?Q?pO72K/wNT4+QG+pJDIsUu6C/f?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1d09a3-9644-4a3f-d5ec-08dd5d0580cf
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 23:20:37.5684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rn4TGdmiMMugPflYQJBjmk5iskZhjOiIJ41kWBfZlCH3o73Am/DuhYajwI9ytiiQwTqxIWZEU9jouowkgHl4UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6404
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

On 3/7/25 10:08, Matthew Brost wrote:
> On Thu, Mar 06, 2025 at 03:42:28PM +1100, Balbir Singh wrote:
> 
> This is an exciting series to see. As of today, we have just merged this
> series into the DRM subsystem / Xe [2], which adds very basic SVM
> support. One of the performance bottlenecks we quickly identified was
> the lack of THP for device pages—I believe our profiling showed that 96%
> of the time spent on 2M page GPU faults was within the migrate_vma_*
> functions. Presumably, this will help significantly.
> 
> We will likely attempt to pull this code into GPU SVM / Xe fairly soon.
> I believe we will encounter a conflict since [2] includes these patches
> [3] [4], but we should be able to resolve that. These patches might make
> it into the 6.15 PR — TBD but I can get back to you on that.
> 
> I have one question—does this series contain all the required core MM
> changes for us to give it a try? That is, do I need to include any other
> code from the list to test this out?
> 

Thank you, the patches are built on top of mm-everything-2025-03-04-05-51, which
includes changes by Alistair to fix fs/dax reference counting and changes
By Zi Yan (folio split changes), the series builds on top of those, but the
patches are not dependent on the folio split changes, IIRC

Please do report bugs/issues that you come across.

Balbir
