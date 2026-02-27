Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNsXHma2oWnmvwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 16:21:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A6C1B9A53
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 16:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975FE10EBBC;
	Fri, 27 Feb 2026 15:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IywS8lKy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C3110EBBC
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 15:21:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKhZVOloECsNntNsaTeVwA4s3UNx77xAj7wqIIJxbzbpEOktRK3xETqYcZyJJfR5FHG+nWoIkbkMMm9xBzpaodzmBAxMcefIDhlEa0VNcWCtm+uiSg2W3NSCv1GJAVKc91zGNKq/9wu15In7VSVs2+sbYCANFyBc2ChvLMyjwLf0ZsqjF0gz5Jw1Nf6MOfUGFPEGGQ8pTiz6A8EMYmBk1WjpB41slBtt6MqSN2OJK2TWxLcCvPx4kNWk3z80nmW2XKG10LQpPYnwfgPHwAtnezM/dALKuvdTOeH4R4oXcZVjAaGN4nuhf9SbStRt16bq0/ejzsj1FBKOrkluengbuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3tDzevO92hFp0MiTb2w4uy5SBTIBEUoPh9az88rqkA=;
 b=JBF5cwAnOgGnsf7x8eyn8jjS+9B0AbmShkowMQEK9HR/34FDnEEVjMk5gDX425VQunHnWnAe+X0U5eu0rkNqw3WYZs7HyTeNTPWWVMCE1W7KZ5ZWkptFlYwKg+BnxdgJqbPAlWc293CUeKCLGeRU/kn+VF1g8flU2A7DQsaKkZ2pRdRGlyEZH5AKbnzOGcZXB3jHMWwFJCZPXMjbcVXIf/t33HpPdA5EPQOjREUTsNhgnlmlqXmlSJwolpDc0j1Sjwg+bJKflgOofLKGCTl5UohU+XAHMrwyIO/CFAXQg+YX3pXoC++7VYy9zprjMPvY+hO2112r7HozYBg4COrmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3tDzevO92hFp0MiTb2w4uy5SBTIBEUoPh9az88rqkA=;
 b=IywS8lKyKUyyl4LRWHODtXN+eh0nvGFLjq74oWMN6WVyGcp1BvkRKRanRm+wR/tS1U4iOtqUEpeDBnDBv3MBykwDZD7af+4631BGiJ/0ptdchBzmG3HayLxVHyyw/C8TvSOCGaHyZtxnP5IQ9x2bLnQ2Kqp+o4SQWGbxn35lxZo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB8172.namprd12.prod.outlook.com (2603:10b6:806:352::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 27 Feb
 2026 15:21:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 15:21:01 +0000
Message-ID: <a006b938-cd53-4c56-8131-30f557919ec6@amd.com>
Date: Fri, 27 Feb 2026 16:20:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/7] dma-buf: uapi: Mechanism to revoke DMABUFs via
 ioctl()
To: Matt Evans <mattev@meta.com>, Alex Williamson <alex@shazbot.org>,
 Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Alex Mastro <amastro@fb.com>, Mahmoud Adam <mngyadam@amazon.de>,
 David Matlack <dmatlack@google.com>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>,
 Ankit Agrawal <ankita@nvidia.com>, Pranjal Shrivastava <praan@google.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org
References: <20260226202211.929005-1-mattev@meta.com>
 <20260226202211.929005-5-mattev@meta.com>
 <f75088c6-5795-49cc-8932-ea46c2223d74@amd.com>
 <ad614dc4-0fd3-4897-b879-5d78a22b534f@meta.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ad614dc4-0fd3-4897-b879-5d78a22b534f@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0395.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 530a7277-bc6f-45da-00a4-08de7613d08a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: hQI6wjMuaAXEMrbaK2wVx0LMIG1qBRKRabX/EIrW7Q33BgbFG84CW45QRXRUUB9suXWFzFJvgApf+1VT/ok9E+sDz8Re0PV4pNoeWfEzTTRAn3jqbGFBsKnyEtUBarlETWMchgDIy8IcGLbY+huv52nq2Byr+eJAiTktm+9UTLLCuYkbtfW75+UWARNkmqmywrMBTx4RIwKGikx6/ceFlzGn3FCoOcDbEI0/C4qZ/zdjgoZQlWijpKZw3N4p9ndYdR+lzccNXtRdQ6aHi2TB8bDT7BO5Wki9gL/X6/27bwu6z8hrDorTbWwlvXbU+vhsdbJeTV9c8KXDfzAaQF9UtwTJ3cC0BR0eZvs1+9JC1laJ4ID1iWZ7JNHJVs5e2U2MyC0K+6d3cYpe0LiR1DLCfBSzuAhnywvgfgrlbC69x5/ONfDvCQ0GGO6y5SfTxkUIKYo+EOPai7NLBMu2tXwL2vIz/UCE4ZNxf8PduIjSnAyJmG+L1WZL9vRZG0CyQeqQMwc6eviLE9Z0cyTHu7du28rkiG5Rywp2zIUMDOxSMfZBNhdZLfauhZvd3HStKkikoQHzlVIKXWsKXoO87bJM3UhC0BObvxt74h6QXlYq7Q+sdJRCqQtwSyIkvgdy6XKpiFReilQGowsM/95+M3PaHZtHfT31ej71y34Rx8FmNxLNlTWpA1HCimxCj+wRh2cB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDgzMGdPTjVqcUM4R29uaVQza1FaN0ZsaVJKQzNjMFJSeFJOckVFeWk5ZVJ5?=
 =?utf-8?B?dmtEZTRtSjZqRk4wMnF4RlhvUUtwQnVuU0F3am1RN2lrejRqL3kzL1hGWnBI?=
 =?utf-8?B?aGJmY09Ba2RtRTJES3lVcDhBRUpMTitYZVg2TWFtdzNWV0dYeFplZ01IVDJM?=
 =?utf-8?B?TnVORkVha1M0RFNTeXZvNmlYMVptWmxaQU9kU3JLMnZvbFh2YnVTOFI4UGgv?=
 =?utf-8?B?TkdJYVZTWUNCeXVVejFtMWwzdWxFa2Niakpsa2RvSWx3OWk1dG1SaTZ1SU9H?=
 =?utf-8?B?VFhkY09uNVNYTDQrd2FHelAxWmxXK3JYUVNJS0haU3piQ0crTVBXeVFnNUZx?=
 =?utf-8?B?QnFkN201SUJNTE8vWk9HR3hCeVJXelkySGwyeU9Hc1JUZVFWclc0M1k1YUJh?=
 =?utf-8?B?S05zKzAwdmlCNmtzWXIreDZQWXEydURjNTdkNGJXTmpoQUdNZ3hvV2NNS20z?=
 =?utf-8?B?cEkzOFNnWDNtWEJCbUpRV282MWxadFppTjJwTUd2d2sxc0diQkNSdkExVDIx?=
 =?utf-8?B?WXRmWTlEYUdiSS83VnkwekF2Vklpb3dSeDdvNnhzNkw0Y3JORTZHY24zZm1O?=
 =?utf-8?B?d1BMcWFJMW5HdUE0QjNTRmhoUGdWVTlwRUcwRHFZMHlzRStlSzhYTnp2U3k1?=
 =?utf-8?B?Z2xkR1dWZkY0Z1Y4R3M3c25jODVOREtUSzZDZC9QV2h1NWNibTVvdEJxS3p4?=
 =?utf-8?B?d2VlamJTNlkrbkU5TnNjNWIrZ2llK3JPakszTnR5TUZVRHd4UVlOMDJvazVo?=
 =?utf-8?B?WjAvb0hQT1djaFhacnFDNitTWU1CTlZlVXlVVXJEeExBQ3BZRmgyTXVKZVZ3?=
 =?utf-8?B?K2UvS1JxQkhIbFFkUHlRSWpVdzZRR1I0TzRhOWlZTDg4Qm9jMHluWTBPSy9G?=
 =?utf-8?B?dGJ6Q1huVEh6bXh6L0JwSFRJb280V2E0c21tV01pVTlnWVF0SFkvUkxKZm8z?=
 =?utf-8?B?NE9uVDVQVUJpTldsdHJYRmc5RG5uNGY5Zk5CV2t6VkJBUlVVOXgxbmpuR0pT?=
 =?utf-8?B?dmcyYVlEdERyZlk0NUVyNll3aStrWGcwTFpKU21yaWxPaGZMaHZnYjFmNVpD?=
 =?utf-8?B?SnV5QXZZUDhhL0phYnoyT3lkdVhMZWw4OEgxZ2U2YlN3ZVcxeVJZRHYrNzEz?=
 =?utf-8?B?eTJndlZLUnFkM0pZQUhFOHRFWFJ2eXRtKzlZek8rTCtXa0RWZ1pBRlVJV3Fn?=
 =?utf-8?B?SUNqTjJWU2JjWmw0djNFVjBMbHVIcVpiL0k5OVNQSy80Ym1kWkVhVTY0K2Jj?=
 =?utf-8?B?ajYrSFlEWTJIVHFVYTlIWmxNUGpPUkZTVnNSQTExRmg0bXdVSnQ5enhmZWJP?=
 =?utf-8?B?WUQxK2ZyUisyVkdrRTFtWjhkdU5IMk4rSkdxV2JFYXE1ZStHMFVzYW40cGZn?=
 =?utf-8?B?VEp4cTIwai9RMzZIWmNDK3BpUFd2T3lBNTkyTlVTMUtWUVZBcE10T1NiZWJq?=
 =?utf-8?B?eWlVZUhDdEhWSG1Ybi9teHlEZ0c4RmxCckowdXQ5N2hickl6MDNJbVRCOHVh?=
 =?utf-8?B?L1JrZFhwajRBSmtjMTBRbmg5VnBha3htQmZxaEY0dko5ajhmS3d6MUVpODd2?=
 =?utf-8?B?OFo5Vi95MENUT3JXOW05UUVXT1N1Mi9Id2xtS3BGVFJLSVNKSnpZOHVJbXpC?=
 =?utf-8?B?WENXYTNYOW55K2hqMHRZRkVDTUVIU3ljUk9YZEJCWmFxMFNDQzdFSzlhOHRm?=
 =?utf-8?B?UzhkbXF2OXZ0Rkh4SVZ2b2pqM0NMZmdVYkh6emFXd0cycWJkZXpCdWJlYWZh?=
 =?utf-8?B?TEJyQ2RMU3ZTSHNpMTc5QmFTOUhDTlJsR0NlbUVPV1QrekRnc3VTV0kxUERk?=
 =?utf-8?B?bXpLMG5EWXVQbjcrcmxJaE82Ym1NSld2a055RWJvM0hQaFMyeTRIRWtLN3lp?=
 =?utf-8?B?Y21qRUJuYzZRL1VIck9uVVhtNGUwNlcya0FvK2hXeGVNeFN2Vy83VktVLzdF?=
 =?utf-8?B?MlZQN21LYS80aTlLbElZbzhzZjI5dDdWRlVhU2xsWWFTZHBoOFhaakYwczZJ?=
 =?utf-8?B?cEpnM0JjRFdsYjJIbGZwRXFsR2UxOExyTS9kMFdjQVBleTZsWisvcnc5Y1kw?=
 =?utf-8?B?NExZOG9xS0dTQUV3OHlLMFYxczhSV2dOYWdYMzJXNUd5S0JYMVEvMldsdk5h?=
 =?utf-8?B?TmlhdVBmL1kvZmF0bFdPR2VvTTBUVWRwMDcxMnRjTWV3a0pQOThpb3BiUkVx?=
 =?utf-8?B?TXFVYU5PWjRkZTZrdmh3aE1Ndmp0azlUaVpiZXA1UlNEZWwxaSszSFB4bWU0?=
 =?utf-8?B?Z24zZlRwVE1DSHBwSW9ZV2U5WEFHYXh6TVVNNWE2Vi93VWFFblVJK2hRaENG?=
 =?utf-8?Q?6uAZh7MfumrJE/VQHl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530a7277-bc6f-45da-00a4-08de7613d08a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:21:01.2509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NkGk85FD5fPT7pg3ayoQGrcsztbtuLfvxbDihFAAtqkGpcS9KbP5w8EbZyqIL3TG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8172
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mattev@meta.com,m:alex@shazbot.org,m:leon@kernel.org,m:jgg@nvidia.com,m:amastro@fb.com,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,meta.com:email]
X-Rspamd-Queue-Id: C1A6C1B9A53
X-Rspamd-Action: no action

Hi Matt,

On 2/27/26 14:02, Matt Evans wrote:
> Hi Christian,
> 
> On 27/02/2026 10:05, Christian König wrote:
>> On 2/26/26 21:22, Matt Evans wrote:
>>> Add a new dma-buf ioctl() op, DMA_BUF_IOCTL_REVOKE, connected to a new
>>> (optional) dma_buf_ops callback, revoke().  An exporter receiving this
>>> will _permanently_ revoke the DMABUF, meaning it can no longer be
>>> mapped/attached/mmap()ed.  It also guarantees that existing
>>> importers have been detached (e.g. via move_notify) and all mappings
>>> made inaccessible.
>>>
>>> This is useful for lifecycle management in scenarios where a process
>>> has created a DMABUF representing a resource, then delegated it to
>>> a client process; access to the resource is revoked when the client is
>>> deemed "done", and the resource can be safely re-used elsewhere.
>>
>> Well that means revoking from the importer side. That absolutely doesn't make sense to me.
>>
>> Why would you do that?
> 
> Well, it's for cleanup, but directed to a specific buffer.
> 
> Elaborating on the original example, a userspace driver creates a DMABUF
> for parts of a BAR and then sends its fd to some other client process
> via SCM_RIGHTS.  The client might then do all of:
> 
> - Process mappings of the buffer
> - iommufd IO-mappings of it
> - other unrelated drivers import it
> - share the fd with more processes!
> 
> i.e. poking a programming interface and orchestrating P2P DMA to it.
> Eventually the client completes and messages the driver to say goodbye,
> except the client is buggy: it hangs before it munmaps or request other
> drivers to shut down/detach their imports.
> 
> Now the original driver can't reuse any BAR ranges it shared out, as
> there might still be active mappings or even ongoing P2P DMA to them.
> 
> The goal is to guarantee a point in time where resources corresponding
> to a previously-shared DMABUF fd _cannot_ be accessed anymore:  CPUs,
> or other drivers/importers, or any other kind of P2P DMA.  So yes, a
> revoke must detach importers, using the synchronous revocation flow
> Leon added in [0] ("dma-buf: Use revoke mechanism to invalidate shared
> buffers").
> 
> (Apologies, I should really have just built this on top of a tree
> containing that series to make this need clearer.)
> 
> But, it ultimately seems to have the same downstream effects as if one
> were to, say, shut down VFIO device fds and therefore trigger
> vfio_pci_dma_buf_cleanup().  It's just the reason to trigger revocation
> is different:  a selective userspace-triggered revocation of a given
> buffer, instead of an exporter cleanup-triggered revocation of all
> buffers.  In both cases the goals are identical too, of a synchronised
> point after which no more DMA/CPU access can happen.
> 
> (If I've misunderstood your question please clarify, but I hope that
> answers it!)

Yeah that makes it clear, Jasons answer also helped quite a bit to understand what you want to do here.

First of all your requirements sound reasonable, but absolutely clear NAK to the way those patches approach of implementing them. You completely mixed up the different DMA-buf roles and which is used for what.

See the IOCTLs on the DMA-buf file descriptor are for the importer side to communicate with the exporter side. E.g. thinks like "I'm done writing with the CPU, please make that visible to yourself and other importers".....

But what you want to do here is just the other way around, the exporter side wants to signal to all importers that it can't use the buffer any more, correct?

If I understood that correctly then my suggestion is that you have a new IOCTL on the VFIO fd you originally used to export the DMA-buf fd. This IOCTL takes the DMA-buf fd and after double checking that it indeed is the exporter of that fd revokes all importer access to it.

I'm certainly open on suggestions on how to improve the DMA-buf documentation to make that more clearer in the future.

Regards,
Christian.

> 
> Cheers,
> 
> 
> Matt
> 
> [0] https://lore.kernel.org/linux-iommu/20260205-nocturnal-poetic-chamois-f566ad@houat/T/#m310cd07011e3a1461b6fda45e3f9b886ba76571a
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Signed-off-by: Matt Evans <mattev@meta.com>
>>> ---
>>>  drivers/dma-buf/dma-buf.c    |  5 +++++
>>>  include/linux/dma-buf.h      | 22 ++++++++++++++++++++++
>>>  include/uapi/linux/dma-buf.h |  1 +
>>>  3 files changed, 28 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index edaa9e4ee4ae..b9b315317f2d 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -561,6 +561,11 @@ static long dma_buf_ioctl(struct file *file,
>>>         case DMA_BUF_IOCTL_IMPORT_SYNC_FILE:
>>>                 return dma_buf_import_sync_file(dmabuf, (const void __user *)arg);
>>>  #endif
>>> +       case DMA_BUF_IOCTL_REVOKE:
>>> +               if (dmabuf->ops->revoke)
>>> +                       return dmabuf->ops->revoke(dmabuf);
>>> +               else
>>> +                       return -EINVAL;
>>>
>>>         default:
>>>                 return -ENOTTY;
>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>> index 0bc492090237..a68c9ad7aebd 100644
>>> --- a/include/linux/dma-buf.h
>>> +++ b/include/linux/dma-buf.h
>>> @@ -277,6 +277,28 @@ struct dma_buf_ops {
>>>
>>>         int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>>         void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map *map);
>>> +
>>> +       /**
>>> +        * @revoke:
>>> +        *
>>> +        * This callback is invoked from a userspace
>>> +        * DMA_BUF_IOCTL_REVOKE operation, and requests that access to
>>> +        * the buffer is immediately and permanently revoked.  On
>>> +        * successful return, the buffer is not accessible through any
>>> +        * mmap() or dma-buf import.  The request fails if the buffer
>>> +        * is pinned; otherwise, the exporter marks the buffer as
>>> +        * inaccessible and uses the move_notify callback to inform
>>> +        * importers of the change.  The buffer is permanently
>>> +        * disabled, and the exporter must refuse all map, mmap,
>>> +        * attach, etc. requests.
>>> +        *
>>> +        * Returns:
>>> +        *
>>> +        * 0 on success, or a negative error code on failure:
>>> +        * -ENODEV if the associated device no longer exists/is closed.
>>> +        * -EBADFD if the buffer has already been revoked.
>>> +        */
>>> +       int (*revoke)(struct dma_buf *dmabuf);
>>>  };
>>>
>>>  /**
>>> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
>>> index 5a6fda66d9ad..84bf2dd2d0f3 100644
>>> --- a/include/uapi/linux/dma-buf.h
>>> +++ b/include/uapi/linux/dma-buf.h
>>> @@ -178,5 +178,6 @@ struct dma_buf_import_sync_file {
>>>  #define DMA_BUF_SET_NAME_B     _IOW(DMA_BUF_BASE, 1, __u64)
>>>  #define DMA_BUF_IOCTL_EXPORT_SYNC_FILE _IOWR(DMA_BUF_BASE, 2, struct dma_buf_export_sync_file)
>>>  #define DMA_BUF_IOCTL_IMPORT_SYNC_FILE _IOW(DMA_BUF_BASE, 3, struct dma_buf_import_sync_file)
>>> +#define DMA_BUF_IOCTL_REVOKE   _IO(DMA_BUF_BASE, 4)
>>>
>>>  #endif
>>> --
>>> 2.47.3
>>>
>>
> 

