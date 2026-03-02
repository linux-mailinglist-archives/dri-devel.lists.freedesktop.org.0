Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJjkMrCOpWmoDgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:20:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CDA1D9AA5
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB48A10E4DC;
	Mon,  2 Mar 2026 13:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TgQKkOgy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012012.outbound.protection.outlook.com [52.101.53.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AB910E4DC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 13:20:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fORt9AyMHeOv9XTWIO8oJ2Wq7rWUvKc2rgLzLazTtB910zgLL3evNYEXcSEycKyltfBLWGtLJJwDrXrWeNcla4I9vgWKzmtZOYjqLC3ORfsi0YSKyoiOoYe4yyzTVXqPXimGLMXk2Xk++qRqL+teLbu0KAzfDyUCaWGMmrEp6TFmMKLAZW3HnnEt7451aUCg3giSoIwxfJZUhXRQNHVbrZBCXvhxRNoVYezlLCdg+pZ/PcXYVtOVGeOaoW61LAnrJUYrqaG7sAbHBxOLpmYNpUnjYj/Lomudl8+XQykKny5XWI7quUclfxi/UrjzsrPOhxiDG+oPFmwPBqHHPEQ3sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yW/xvajfulxMY7J1+G8x/poxbdnjN5Z8tknk6RxUuuQ=;
 b=FP9Mkp/GfXY87EZpoJ6+G/jHFuNRlmyp+x01xltu5GiiG5c2zclgxqPk34SZiTTUnUeiz6GSJKnXzHhOlGvrqRICotOhesqOkn8l5D8nmyPNTIVoZftuwxKGTTwHnBz0Z5Ds3qLhonE7H1lCb7LZoPAoc2wbP+8qGul6uW1EPduPihUflNmq8SwcWy8anISpxK71jr0b/c5x7Cq6+SL/TB8K5shKijda6HmeLb/ypYFg6E5GDZK/Ux1XKE7f/55gPsTmghAHkuO6axB0TkrDqh/i0Nv8euJFAreckDSlRwMHAgs9LLmoXHq3JigiaRPvMH5gyIWr3Oitbuz4CIxDLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yW/xvajfulxMY7J1+G8x/poxbdnjN5Z8tknk6RxUuuQ=;
 b=TgQKkOgy2iBj4WUd4QKWAyIOXWN1Fbgr2kYNQhPH7LMLOYfYRnbfDjQ+FDAsOWaAgNJkjfgRY5aDQurXJ2HZwxf5YIZk0YUPIH4ees+0eIZR3mrc9FEbdz7XOzAXBkqNtySzRGOFEFmB9EpncM70VMrQQ0SNidWhz0m1/Xu85NU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7928.namprd12.prod.outlook.com (2603:10b6:8:14c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 13:20:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 13:20:41 +0000
Message-ID: <9043241d-8af6-4892-b479-1d06841775fa@amd.com>
Date: Mon, 2 Mar 2026 14:20:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/7] vfio/pci: Support mmap() of a DMABUF
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Mastro <amastro@fb.com>, Matt Evans <mattev@meta.com>,
 Alex Williamson <alex@shazbot.org>, Leon Romanovsky <leon@kernel.org>,
 Mahmoud Adam <mngyadam@amazon.de>, David Matlack <dmatlack@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kevin Tian <kevin.tian@intel.com>,
 Ankit Agrawal <ankita@nvidia.com>, Pranjal Shrivastava <praan@google.com>,
 Alistair Popple <apopple@nvidia.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org
References: <20260226202211.929005-1-mattev@meta.com>
 <20260226202211.929005-4-mattev@meta.com>
 <90bd4185-1e87-4393-b9e1-1318a656a7d9@amd.com>
 <20260227125109.GH5933@nvidia.com>
 <c5a8f318-20af-4d80-a279-2393192108c3@meta.com>
 <20260227194807.GL5933@nvidia.com>
 <aaISD4mw1XzQl1S8@devgpu015.cco6.facebook.com>
 <20260227220427.GM5933@nvidia.com>
 <b729ebe1-aea2-4f45-bb3f-3b4b59078c8d@amd.com>
 <20260302125455.GU5933@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260302125455.GU5933@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:408:e6::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 474b0696-2bd2-40ca-d1fd-08de785e8080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: NkaDVfgHUw6U6k3a+hcFVs8a/lzYq8axAnvsbbaB9B3513E23rhmPZMU6PWIrWou72TzgLx31YzA1chrf9aQMAaDBgi9MMs6zb1wch5oABs6VKcRJXre4tOFhUNiXR++iYaOvS5WRpJ+3smZsbXqPJBN6b5wc9QDY1IpBYVj92QLyw1EbMozpdA6jEKFwuQg8law156llcA4fawWA7n3G4WbVm3G8S3r2phucrDTpzUH/txZbeXzviEl96cbwSRk90BrZQ2f6nREC+fnnKrBVfdDBjkka7NWTac2hp9TwoMpRSX8UkBhbIKv5gxBm4LObju09EK1BplaRbAU+T8nhGQL6Ke9CWW7j+jxt47slYlHhXLjHirvFXDhCr2/bGvJrIE0NXq24eUOb56j7C8FXuJb5OvPAYbStZohFvBaWp4skkiYfSI/s8LUeXtuB3ec8qtmi8IYEqXDKVwFrKZTHPZd+7Tu9EJAikeqJQjzpPHfKXvCeN7X/QXWA16yScvq18CEYOBTASvFbdPsYbNMFX8WqsvlfssSskNTSTfFBfeVwrTTl8Nh1Q5CKLUZoVI4VkLgarVIFMhG9vYpoOXfL2WrNCBDxwiHkMvFzFRt7rcAxFG9WU8qS4+kQnOEPzh13RU3OK/MBFDM0aUjZHU+Goe7VRIrJsaMA88u/ylqCrfqnObmrbeJ/85ASVKeQoz0p+7arTUrcD/+nwctifxmtR78CPZ70rEDGTqrLbf4hS8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2ttR29CRWVablNZbWRkcDFOcHJTc0hWNi9CZEZOM3FmVkZTZlFSM0MvbEZB?=
 =?utf-8?B?WG0wd0lOc1ZOdzhBU3NaN1RFVmloQ2FBTDVNc2dZNWJCRDlrOXAxaHFmbFhW?=
 =?utf-8?B?Wk1CU0lQVzU5akkrWktvWG4vOU1QS2tuVU96K3haMGFkQTl5SlVleG1sRk92?=
 =?utf-8?B?eUFMdklmNFdxbVZpRFUzZU4rY0JLWlpRMVkyL2dXeEJNMzI1amM5aTIrSTJC?=
 =?utf-8?B?NlJrTWF4UG41bm5hRGVrUlYxSHhLZTBaNGl3UFUrdE8weWpVN1FLUG51anFh?=
 =?utf-8?B?cmlPdUo0UUJNcFVFcytISmNwZW5wb0EvN01ERWVVSXFGRU42cFFqVXdJL0JJ?=
 =?utf-8?B?dGc2SEY5Z2xDbFhZOXpQMXJkci9ITUhLelJpUjFaYXpZRmxvZHZmMmVpTGJO?=
 =?utf-8?B?bGlIRFJIMU1uOWRTRG9UdU1IS090N0J3TTFhaEhram44TWVJNXYvTnJNclM5?=
 =?utf-8?B?Kyt6TjNSdGlrOHBZRWR6WUZmNnVvNU8zQVdKUVNOV1V5MStsNkJCdjBwdkpq?=
 =?utf-8?B?S2p6Qm5DV3hMMXNUK3JXQmRXVUpJa01UdHVlZ3dvbWpqbXV6ZmVRbzJ1d3dk?=
 =?utf-8?B?eFdwUkJpQncxSW5URjhVdUxKNHA5SExsN0ZXWFRhWitiVmhNS1lxZDVqekFW?=
 =?utf-8?B?QWFpYUxGSUpuY0FkalpsYkVJTzVRTnhlL3d2eVZxVmsySGU5VnI4VFdGMTJY?=
 =?utf-8?B?SHZPK3FBTUFMdXVSYWJ6Szh4d3BpRUtBV3hJa1YzZDJXQUdOWk0yaXBHbnVM?=
 =?utf-8?B?Z01jNzM3MmpyZ00zWUpFcnZmYzcxRGNWQ3JtRzlFekJObU85SUhVL2lRNE5L?=
 =?utf-8?B?Z1FFSUdCVlNtYjFoMGZacHJxN0lXaUtHWjhGSk5LUTNIeCtLdFJjazY4TW1m?=
 =?utf-8?B?Znd5UEJkdGZiK3FPUEZPbXErWE42czRaZ2dlOUpLZzVyT3ZMS2VjRDlrdWJT?=
 =?utf-8?B?K3ZqdmNSR3BnQk9VNTZJM2RVTVNDRk9PK0RoeDZqMk1KVXNmcnlueFViUzB5?=
 =?utf-8?B?dHI3eVI4QzZGTHhJMCtpMXZQU0VONmZtTmd6eDNHWFBGQUZTekNZUGR4Q01E?=
 =?utf-8?B?Rm5pVFQwZjZpc014YklOZ1daYVRBd1A2RnhxYStoYXhESEpaODI2c3VFSGE5?=
 =?utf-8?B?M3R0QzkzMzlBTFJjeHJFYkpteEZxMkM2WG1HVDhqNlVXTmc4K3hHWmQrTExZ?=
 =?utf-8?B?OTVZQy9pNmM0NEFyM3FobndSbkZ0TXBCdjhUQ0owQmZud3BabzM3cWJ6ckNI?=
 =?utf-8?B?Q0ZFL0J6MVVna3dkREgxNklpODFnUjVVYmlFQzdOeCtSb3lEWFM0c2FXYXR6?=
 =?utf-8?B?RjVESzdmV3RuSDdCY3RGZ3lCU0IvaWwvN0lMa1JmTXZiS08vZW5pbk1QWmFE?=
 =?utf-8?B?Zzk3OTFlOWVRU2F6eTVLMWFRcTQ3Z25PSHFuWEdyL1dkcTYxNWpBMk9wU1VL?=
 =?utf-8?B?UFlPUWJIR1ZkVG9jc3JkMEpyMnM0QTZaN0cxR3F0b1MrUkxZVERWSVFQZjlw?=
 =?utf-8?B?QU0ra21jNTRjbXpwbnpBRGJhNGQyZDhVU25QVWdROUJkMytORXdzTHQ3ZHJu?=
 =?utf-8?B?a3F1eEVzWlpGVkprdXJVb2xzMnFwVmhrcWtZcXp4ZXlMNVdvSEhXbDcrVDBT?=
 =?utf-8?B?NzlEN3kxWXFVdmg3ZG5uUHVYeEpGYzdlejMrV3N5TlpwN1JwYWxPMGNKdEd5?=
 =?utf-8?B?d0haWlpCVWN0L3VxOG9qbmZVQ20xTzFrM3ZNR1VYcE1vazRQelQwTmZHaHBY?=
 =?utf-8?B?bDBGQXZXcmdNbFJGZUVGclNVUjNsQTIvZG05ZTdwYzVuUlR2amFpTi8xM0ZC?=
 =?utf-8?B?QnZyWEJQcFVQQnZsVnJmdjV2bUJhdzh6clJBbE1HaUREa0NZTTd5aWV6NFRO?=
 =?utf-8?B?OGVrbjNqaUFVenZZQThldXphVFJLbXMrYjZFdnBxclpvWXdBOTJmaWVuS1hh?=
 =?utf-8?B?MmpqeW8rQVJPL1JKUFpNWG9SblI3SHNnUWovY2swMDI4VDNicldvZUtydHJv?=
 =?utf-8?B?OU5xaGQyQ21FSTNsSlloT0dJdkREUEVJUXhCQkx6b1lJejJLNTRWL2JGZmtn?=
 =?utf-8?B?djg4MzZvSkhnQ1U5ZnVHR0o5Q1YvQXlOSWV6ZWZtQ1hxTEU4N0NTc0RPSlV3?=
 =?utf-8?B?WGpBYjlZQmc2c1d0ZGJOTG0yMTBjelVFd05nWTBDdFVmUHNhdmZhTzU4TDRy?=
 =?utf-8?B?dVdxRjJuRzhDc2UvMGxrMEdXWVhNVGViV0lWL0JDdHNUL0Y1NGpYb3U4aloy?=
 =?utf-8?B?SDJnVjlvbXFDa2hnRlNWWE1WT25KWXJTN3RrRWg3Sk8yQzB3ay9VMkNpdnh2?=
 =?utf-8?Q?0xwazYK11Vg+54uFLg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 474b0696-2bd2-40ca-d1fd-08de785e8080
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:20:41.4036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4iLCCxx+OfwD9Lg0KmA6Inc2X61M/tm38bkrgGFnWKcGnZ0VRklaJWVza6qhvu6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7928
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
	FORGED_RECIPIENTS(0.00)[m:jgg@nvidia.com,m:amastro@fb.com,m:mattev@meta.com,m:alex@shazbot.org,m:leon@kernel.org,m:mngyadam@amazon.de,m:dmatlack@google.com,m:bjorn@kernel.org,m:sumit.semwal@linaro.org,m:kevin.tian@intel.com,m:ankita@nvidia.com,m:praan@google.com,m:apopple@nvidia.com,m:vivek.kasireddy@intel.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:kvm@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 32CDA1D9AA5
X-Rspamd-Action: no action

On 3/2/26 13:54, Jason Gunthorpe wrote:
> On Mon, Mar 02, 2026 at 11:07:41AM +0100, Christian König wrote:
> 
>> As far as I know background is that on x86 pte_special() only works
>> on true leave pte but not pmd/pud.
> 
> This is not the case, there are pmd and pud_special as well, protected
> by CONFIG_xx
> 
> The arch should not define CONFIG_ARCH_SUPPORTS_PMD_PFNMAP if
> vmf_insert_pfn_pmd() doesn't result in pmd_special() working, for
> example.
> 
> eg:
> 
>  vmf_insert_pfn_pmd()
>    insert_pmd()
> 
> 	if (fop.is_folio) {
> 	   // Not Taken
> 	} else {
> 		entry = pmd_mkhuge(pfn_pmd(fop.pfn, prot));
> 		entry = pmd_mkspecial(entry);
> 
> This stuff was all put together by Peter specifically for VFIO to use,
> AFAIK it is correct.

Oh that is really nice to know, thanks for that information. It means we could give that approach another try.

> IDK what Thomas was using, but if you tried to do huge faults before
> all of this was built it definitely would not work right as it only
> supported a folio backed path.

Yeah Thomas tried that like ~6years ago and my educated guess is that the whole infrastructure was just not there at that time.

Christian.

> 
> Jason

