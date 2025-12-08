Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63072CAC6E6
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 08:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B9D10E3CE;
	Mon,  8 Dec 2025 07:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kSvRG3Rm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013007.outbound.protection.outlook.com
 [40.93.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F24110E3BE
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 07:54:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvHdqCRU2GFGF1J1EGElBL4xkyGLm+t9eSy1Izaht8DVbPZbcQrzrKdc7Q/EFPtlKc7vXHi7WpBKsc4Vao9daQzWdagXa9+adJahKHXoPwCTs26EhNnj+L1/5vyEcCqEQdmuUm2OrGEC1WPh9dkbPB/5Ik/uEnrNl0KQkmvxl5d8Y4D/vepdxpY5uN/jFpi+mDl1FpldujX5ZTqtAJR4/snRUySRK+rrh6f1pWSqZilVYzAgubx/DwMdwc0z8I4grBNI4cZn2GM/9mHGI45aIYoo3wravzzdnH2Xr/xF/AF49o/RHaNRH20JpY2hbtUWWW+egxQFsGqZiROwoBKSsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RDKPJG6tYozFQS/jIfGcT8V0wcOfymikQXghQm1OZg=;
 b=bgZi+9qvRBZDojZdLxQiEBHvfhNsrGh8FJK3+T1wMNN/PGnY0Na04tZ7Db67WcMHB5NKPuDQGDqe3I8N05ZnpyXk+EFwJ6CPB+EknKCfbTSUPnAcsSpr6R+neD9RgKOPfOT2Sj7EHYnwCIwNQcRPI86lCLxCds3D2DTkqImLCiaN0RxbtOMsLWWE0lRHjbRUKC+1l7hL8QZet7NUzygU886TK/04FC+0+uHDMFLufWvQyv4zBfnhllYqJd5Qmaleq8vYP+0Yjxj4Vz4/AioYvPy9u6rqrRn7HIX2qQW8/r8+gPjXUIvqp0KrHVXw6chhhT8CyfCRZOuhYSlV4LBFOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RDKPJG6tYozFQS/jIfGcT8V0wcOfymikQXghQm1OZg=;
 b=kSvRG3RmLXqnPD8aoXEgii+Dc509zjRRLhl6B/Nl0kvdrK5+0UcdM2guEsBcWuss9oXgLD5KIo7qnGSqwAqOQqZudsI4QyjSgnp71SHAaNfWDs/CQoXcDSUXqiDm99LP7/AojiiWmaQnlGdMlsWQJYZwxqIzaQnSviQwHC1eYzg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by MN6PR12MB8542.namprd12.prod.outlook.com (2603:10b6:208:477::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 07:54:01 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%3]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 07:54:01 +0000
Message-ID: <2d688a6b-38d1-47ed-9c9f-f0c7cd1e0737@amd.com>
Date: Mon, 8 Dec 2025 15:53:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] virtio-gpu: Add user pointer and HSAKMT support
 enhancements
From: Honglei Huang <honghuan@amd.com>
To: alex.bennee@linaro.org, kraxel@redhat.com, dmitry.osipenko@collabora.com, 
 Ray.Huang@amd.com
Cc: gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251112075414.3719917-1-honghuan@amd.com>
 <3b2a9f46-abe5-49cc-bde1-18f8dae525db@amd.com>
Content-Language: en-US
In-Reply-To: <3b2a9f46-abe5-49cc-bde1-18f8dae525db@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|MN6PR12MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: e24de013-40d4-43f3-dd99-08de362ef329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REpWUWRFeTA1N211VzhuVlBWcW90MEZ5ZGozM0JaQUlLcEV2eFZsQmdENkpi?=
 =?utf-8?B?Zis3QzJnL1MxSWhPaVUyOU5RckRudjF2NjlvUWpkTEY3am43NTNOaUNYUlhY?=
 =?utf-8?B?eUxVZmFGN2RkeURkT0J1bFJBckJkczFMYk9JTjNWQU1reHpEaGZKdmcxcHBn?=
 =?utf-8?B?WXpHbDloTUV6R3lVamptcWEwMEdaeGN3aCtrZEtYelV1ZjV5NWRSd3hkMjB6?=
 =?utf-8?B?bVBNL0pEdmhKVFZOaTNGS0kxbXlvU2R3eUVXSzNabmtXeXc1L0ZWMEhyeUVy?=
 =?utf-8?B?ZzFRSldEb0puQWJrUEcwUjcvVzEvTXBHY2oyT1lxbGZxcUZaVGZFbDZpZGlM?=
 =?utf-8?B?RVVBS1Z0UGZmSnZQaTBmZ2dqVUJReURhZUcrRk5zaWZOYVJFRWI1a0xZWmNu?=
 =?utf-8?B?TVlYcHJRQUJGT1Z6dHVSVGRtelgvdzZmTHN3SHdITHowYWIzNTRmYTBNNWtD?=
 =?utf-8?B?aGdDV3c3Vm9aaFFLZUtsb3M4MVVtUkViTlphbFVkYVdETG1XNUJVcXF6ME9K?=
 =?utf-8?B?d0gvRWtQQmxFSDFYY0RtdVJORVA5UEZQMzVUaTlTNUQwTnYyak1uYXVJMlVi?=
 =?utf-8?B?UERFT3RYOHBrcFF0T3pBc3lOcE1iSUFtOVlwMWxPRmMyOVhuSGhVVGJVdHBS?=
 =?utf-8?B?SlVhODQxRzY3b0ZUYmMvRURGYlRrdnRXWlJkSDdLR2Vaak80YTc2cVkxNXJi?=
 =?utf-8?B?ellkRjA4YkxONWhGOUR2cXQyL1FCYnhyNElhUGd6b1BEajJsVUR3UjR1NGJv?=
 =?utf-8?B?RXdEcndURkU2WXEvR2I0TWV4SEw1WTR2Y0cyeE05YUNtaWNqb09VUFZWelQv?=
 =?utf-8?B?SlZIelhtZ0dnQXBwL0s3Z0ZlRkIyTitzV3czcEpPL3hqb2JsOGZKY2x0ZDlH?=
 =?utf-8?B?L0FId1NDS0JZUERJUkJQblYxK29IOHgzcnpQWldsUlRqM3pkNmtEVnBGc0pa?=
 =?utf-8?B?N1h4aFY0TGY2VmJldGIwMTkxR0FEaEVCNUZVbDVGc1NUdEllZTdOQkQ5Z0Rr?=
 =?utf-8?B?bExVRkJvRlZ0bE1HcEtwam1YMHRoeEE5T2pRejc2ZjJaYjFNd2pjRVJpRDVh?=
 =?utf-8?B?V1dpMytIU1VwUWpLUnN4QnpMcHBVRDJRT0UxWjFkdTNsK1JReXhBUktTU2dI?=
 =?utf-8?B?dGNVYVlab2VjVVhYMitvY0R0Y1hQMjMzVXQwY3RMVVVaSGV1R1NHeXgza1Uv?=
 =?utf-8?B?RXhLc0ZuSWw2VXEzczdlMXd6RzN2WUR3c1c0eHBXZHNnRGU3cFJPWnc5bVI3?=
 =?utf-8?B?ejRDVG5BWk1vWkRwaC9kMXlqbCs4M0hMb0dZS0dSTm0rYk5RZHkvVXFLRWR3?=
 =?utf-8?B?dm5ISFltR0VDVW5CT3Ruc2VaSWc3TUp1NHVCUUtMaVo1TGZ3V0c5L2dCMkww?=
 =?utf-8?B?NVhmTlp6d1lWKzFSR3dQTVVqV0JmREJRTGV6c0VZVVVzZXkwenNFQS9Cd0dS?=
 =?utf-8?B?OE1HejlaY0xKaVV0OW91NVpzR3JCajVpanN0YVpLK0o0ak11NmNPNW5LMlly?=
 =?utf-8?B?aVRRNmQ0ZGNvNHNhQU9yYVBnblRsSGlkR3V2V0R1Ym9SZ0FCQlpFY0JwME5O?=
 =?utf-8?B?TTR5VnlGTHdldGUyempzLzhibUhQUFRkeEQvbFpvWFRvSGg1WGJqR2ptRWRS?=
 =?utf-8?B?NzVuM2JFRUROTFRHZkNETzMwVXZvT3VtUWN6UUFiSEFpbXFjcjVqNmJ6TGUz?=
 =?utf-8?B?WTdKV0dYeGdGV0NJMjVKaFQwM1dBUEZ4RGRnK1psY1VWalJwbk0zUEdGUVo2?=
 =?utf-8?B?OVgxZnBvRDFuaGZvN2crSDlLY1piNVVKcDZIbHh3Z1FyTFFJUk51cEJXZW1M?=
 =?utf-8?B?K2JhOHFPaFRoZVNTOFVsZG1wUnpWcmp1bVVTLzFYSDBQRkIyVXpWV3VmYk5r?=
 =?utf-8?B?U1dHeEREQkt2NmFvRTgzaitqdmpRa0grcmVJR0hLdDdpdXNkZFlzTGJhaTlB?=
 =?utf-8?B?Z09wdUg0NC9DY0I3VDR3QXhXRjVpMHozWWlaWVJsMlRGWFY3ZDg4enZBeDV6?=
 =?utf-8?B?UUZXREJxNlZnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGk3bFJsaHZaQ21DWnZIU2lyUXh6VUtpY0RQa21nSTgvZHpMdDMyc0lEbzYy?=
 =?utf-8?B?VE1tZWxMZlZDQkp6Ky84aC9scytNNFpiNm5lOTBvcVhiQkpLa0ttSWJ6RVlN?=
 =?utf-8?B?d2RRZUZZOEpIcUh0RE5XRG9POTFWOGpnaVFTMi93NEF0eUxmeHFpblRFTTFi?=
 =?utf-8?B?SjdXL2lKeGJKU1o0dWpOM3Y5U3dGc2FVWEpBTkdlSE1mL25FejNBZmhKVVBT?=
 =?utf-8?B?QVNJNW5SYUFTZWJEVk04TGpjWE85am01OGc5c21EUWU1dnJCK0I0Y2R1ejFN?=
 =?utf-8?B?eW1mVzFyaDliRkFVQlM3OHhPRVMvcmQrbEcxS3RWZ1NjZ0dIbU9Tdkxra2x3?=
 =?utf-8?B?QXJaSDRPQVE4TWdCdmF2TUZtLzFzRVpobmd4TDEydXNhQ2s3Um9EVFg2MTM0?=
 =?utf-8?B?RDVMWGtqdTMxSnAva0Eya1A0TXhRU21WWXd6bGI4SWdHWXpzYVFHVVkzbEFl?=
 =?utf-8?B?SjhUMXpTUm9NeEJUbVlKVmEwdkZKV3hFQ2E2QUtVYU1pajVWZnZ4bkZuNlhB?=
 =?utf-8?B?MVlCZkRJSVlUQ2NEVWVlRGI5TGQzREoyalJqYjVhRWRHWFJab2JQaW1rbkk5?=
 =?utf-8?B?Rk5vSmN2ZlBPWEFkSFRoeEEwQmVkUUNEMDdRR0k1cnhZRDhsZnhha3BENjFE?=
 =?utf-8?B?cU81WWVEdlgyZ1BiMXlyNTJ0YW9oRkltOXFSNFVNNno2RGYxKzFJZjBORzJV?=
 =?utf-8?B?R0EwaXpybDd2Mi9RUys0SUlkMmhtRlA1RHVTRzdSVG13SVlPVTJVUWMyK1cx?=
 =?utf-8?B?R0grU3pVbkpjd2Y3UFk4MjJWWjFDRzJBV2JvYVg3a0xHSHhNOGkwbHZLWXZB?=
 =?utf-8?B?WnMwWkZZTzREeXpwbHJIUmt4blJsVE11TjVCQi9Velg2bXVHTkcyMXFscDNl?=
 =?utf-8?B?ckF1NXE3S0l1ZE42MUZuNnBWNllOVk1KcnhkV3JVL292a0kzbkJQTVZmdktF?=
 =?utf-8?B?c211anRqYzYzMkxpSDVjbzllOFp1ZTVkV1hWN0FpUzB0Mis3YktLNWFqdGpa?=
 =?utf-8?B?TitXRUFJWmNiS3VyWGlYQm5kc1VsWlgxZGNuQlNUVGVCcHN6WWJaczJ0RVJ0?=
 =?utf-8?B?eTUreVFjN3U4ZGVyN3FTeDZPNUxhemhLU3YxNzlEV2IreUJLUm9oZm0rY0VF?=
 =?utf-8?B?aDA5dlRDNDZXL0hMNU5qNENVc3lzSVV4N1cwMjNRZWQ2VWlabUEwZEV0UVlv?=
 =?utf-8?B?d2R3UDZuVXEvZE1HdFd4MFF6cmM1cGJDdTdIU1J6Vk1ubjJuNjN6YlhraXox?=
 =?utf-8?B?SWFtUXNOUHRHTTg4T1BVMmRHVzZwSUtMUDcxSlc3S0cxdHFVbXhZYVdieEs1?=
 =?utf-8?B?ZHF5YWhYK1BxTUhkeEMzQjl5ak82WkJMYjMrc0o1Z21pdjdFZ0UwaEhJOGNk?=
 =?utf-8?B?Y3V3Z3NQaVVDTGI3OElTM3Z1RXFKTzZQYWRtNmVkWWYzZEgzM3pwQU1pYnE2?=
 =?utf-8?B?elRKNitsZ2N0N0xwanlReUJjSVB0RUVGeUtuRUgvRzUrSTIxN3FSbFBYRDNB?=
 =?utf-8?B?ME9SYyttTXNRRENYNm9pNmN5YmNQOUNTSnFTdmpzNW5rVDlXbVptRERLdHVY?=
 =?utf-8?B?eGUxS1FPMmJRQ2hWbWplNFhHQUJKWVlSKy9aRSsra3g4cm5vUERmT3hlYlJr?=
 =?utf-8?B?aGo5RG5DRUxBNk5HM3l1dkg3cm0wQWJqMWlaOW9hYW1OTXBkZ0VnN3RHM1Y5?=
 =?utf-8?B?dU42NG5FcUdEVjFLTkpPTVVaUDAwNnJpdUxQM2pCZkRSanJkQVJodlY2aWMy?=
 =?utf-8?B?TzJJNldzVlgyakt1RXA0aGhsMnRyLzZ6dzJjZ1RRblJlclpYT1MzTGJoTVlw?=
 =?utf-8?B?SlVtZm9NYTE4NTZqNis1bzZWWFQvZkg0VktlbmRpeTNxR1RLMkNLdG1jeU1W?=
 =?utf-8?B?MjJ2dDhOeFVqcEJBbkZSNTNKTTVKSDhzbG41czRIeFZ2MGVTd0JHMm5hdGIz?=
 =?utf-8?B?Z3NQUzRvcjV6RmdjdFZkQnhSdzIwRHUxK1ZSc0tHVUswOWY3ZWtqVnZlbEM1?=
 =?utf-8?B?UHhLOEVkeGVnVjE4d2QxdkQ0TUNOUm9BeFNkbkxCY291ejluQWtMTGh0UytP?=
 =?utf-8?B?VXNoUHZFcjdtTUh4eWpReXNKb1ZVOFovS3RiVjYwR3FZRnRUZHZoNUpERUgr?=
 =?utf-8?Q?clr2wlciETyN0Ytno3aH2db/N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e24de013-40d4-43f3-dd99-08de362ef329
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 07:54:01.2583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BqA2Mt/PyQ+Yltb/tPDubwYjQ8aLzWFEeXep2cLacbSBUCe7+Fz56Ld9JcgV95Cyuc9QVEiBaUOI2lQrBogIig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8542
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



Correction: full documentation and testing resources are available at:
https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1568

On 2025/12/8 15:50, Honglei Huang wrote:
> 
> 
> Dear all,
> 
> I would like to share some progress that has been made in exploring GPU 
> compute capabilities within virtio-gpu. Work has been undertaken to 
> extend virtio-gpu beyond traditional graphics workloads to support 
> compute applications, and I wanted to update the community on the 
> current status and gather feedback on this effort.
> 
> Virtio-gpu has the potential to become a unified solution for both 
> graphics and compute, providing efficient GPU access in virtualized 
> environments. This work aims to enable modern GPU compute stacks like 
> ROCm, allowing AI/ML workloads and scientific computing to run in 
> virtual machines with minimal performance penalty.
> 
> The current implementation is functional with essential features enabled 
> and operational. The implementation has been validated with production 
> AI workloads. For ComfyUI image/video generation on AMD W7900, the 
> observed overhead ranges from 0.4% to 8.3% across different tasks. For 
> LLM inference using deepseek-r1-distill-qwen-1.5b, the implementation 
> achieved approximately 86% efficiency with 14% virtualization overhead. 
> For OpenCL, most CTS tests have also been validated, and on certain 
> hardware platforms, full CTS can be fully validated.
> 
> As someone approaching this work as a learner, I would greatly 
> appreciate feedback from the community. The current functionality and 
> performance are not bad, there are certainly areas that could benefit 
> from improvement. I am fully committed to addressing any feedback 
> received and working with the community to refine the implementation to 
> meet the expected standards.
> 
> Full documentation and testing resources are available at: https:// 
> gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1475
> 
> Thank you for your time and consideration. I welcome all feedback, 
> questions, and suggestions.
> 
> Best regards,
> Honglei Huang
> 
> On 2025/11/12 15:54, Honglei Huang wrote:
>> This patch series introduces three key enhancements to virtio-gpu to 
>> improve
>> memory management and GPU virtualization capabilities:
>>
>> 1. VIRTIO_GPU_BLOB_FLAG_USE_USERPTR support: Enables user pointer mapping
>>     for blob resources, allowing guest applications to use user-allocated
>>     memory for GPU resources more efficiently.
>>
>> 2. Configurable HSAKMT capset support: Provides better control over 
>> HSAKMT
>>     functionality with a new device property "hsakmt=on" to avoid 
>> exposing
>>     unsupported capabilities to guests.
>>
>> 3. VIRTIO_GPU_F_RESOURCE_USERPTR feature support: Introduces a new 
>> virtio-gpu
>>     feature flag with configurable "userptr=on" device property to enable
>>     user pointer resources for enhanced memory management.
>>
>> These patches work together to provide more flexible and efficient memory
>> management between guest and host in GPU virtualization scenarios. The
>> changes are backward compatible and controlled by new device properties.
>>
>> Usage examples:
>>    -device virtio-gpu-gl,hsakmt=on,userptr=on
>>
>> The series has been tested with GPU workloads requiring advanced memory
>> management capabilities.
>>
>> Honglei Huang (3):
>>    virtio-gpu: Add support for VIRTIO_GPU_BLOB_FLAG_USE_USERPTR flag
>>    virtio-gpu: add configurable HSAKMT capset support
>>    virtio-gpu: Add VIRTIO_GPU_F_RESOURCE_USERPTR feature support
>>
>>   hw/display/virtio-gpu-base.c                |  3 +++
>>   hw/display/virtio-gpu-gl.c                  |  2 ++
>>   hw/display/virtio-gpu-virgl.c               | 30 ++++++++++++++++-----
>>   hw/display/virtio-gpu.c                     |  9 ++-----
>>   include/hw/virtio/virtio-gpu.h              |  6 +++++
>>   include/standard-headers/linux/virtio_gpu.h |  4 +++
>>   6 files changed, 41 insertions(+), 13 deletions(-)
>>
> 

