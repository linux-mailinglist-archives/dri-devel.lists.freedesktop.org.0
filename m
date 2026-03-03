Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPijE/1ZpmnMOQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:48:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C80A1E889F
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 04:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F9310E0F5;
	Tue,  3 Mar 2026 03:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WNd4zrJ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010025.outbound.protection.outlook.com [52.101.61.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5C210E0F5;
 Tue,  3 Mar 2026 03:48:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LY5+QWDmQd2iRHi4J/1FAkJI/H8vJzUFY2d81v/GnNgtoG0whQEl/qkOLmD8IAaegrfBDCDfBnhfd65m9CdVAw6dy4Lm8M+CLf9k2Tlv5g+2V5UxQG3eNIS/kIWP8niziMxbqfOoRhYXp1sO/06PUxLh/yv3roc1+S9wHL6G/XjeMwtco6X5FWAiSmlizaSnx6YNEQ1fo8pq2uTJvq6XlLb1PGQGPxGksE1TtbIqFMMg32Lc3dylhjseL66M84qN5wD2ST0o5+6PEtYsm/ksVFXi2sOWffEC3cmE4jNvGKl2yvX4PanJSOJUYJRTw/BFrJx8Bp03FWAEOFGczVlC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlqeKUtfiK0n3eAoyZYwVOebGUh8X+KuU+cq17I84LU=;
 b=R56Wuophl+rP00tyY80gBoIDTIKYoEjmt+EIOPbKXbirNRoFAVouZfuFUiu+rXj0RgP6V8GpsnZMr3p8WZFZ7fgp3nEUUkgL7K4aAlE3EtAFY0ERgGHsaRP1VObtQlzdh+d68Cn+Yc1husICvUYG4KvJcV8V/Krdxuc2upPRE8t4v/3JcIZ41y5VQZ2qAw0xKUXKL/apSa5jWv7d7lfK/rIOpQI/PyeUFCM/nbgjcxDAUJbN3HDXxIeVHlA9NtGN861Wxwd1mkOLsXDEkawRV6Z+0PYxk40pupgaMxwRxlGswzusiGWtcaWJ9IKS81u2z6HMTQr/kyzIfuShUkQ6PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlqeKUtfiK0n3eAoyZYwVOebGUh8X+KuU+cq17I84LU=;
 b=WNd4zrJ4Zs2Yl88IOia1q+mbdqvl89uRAom/QqUZwLgcPUscpU2Lie96G4xrf0HIKMNjQ1RbUGDAHNX448c5OHuCKbXn06DEE7Z5+MFk+vMSc7HzDw5WqT3C4ZRWa0Cdbjl67+lgTCZ4GmlQWwl7H5QmYBqwKJjZpbTQaG2zcw9se1SIGC3tqr4KOc/VcTslY/RaP5fZOmxZa3SqPj5jLX9KCkqCj1jIJOQMmKovXB/i/QfiU0SXIg8rG0YCgpotDeewbyMBCiE4RqjnxXG5XPRYA7D53Ldtpjxmh9Oxlp2EXktPfULGqse3hHvkcs7ruWhMliqL2Zp+tWQCqf9xTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL1PR12MB5825.namprd12.prod.outlook.com (2603:10b6:208:394::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 03:48:03 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Tue, 3 Mar 2026
 03:48:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 12:47:59 +0900
Message-Id: <DGSU8PPHDH66.1QQ6N7H7IMP7W@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Zhi
 Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v2 4/4] gpu: nova-core: gsp: add mutex locking to Cmdq
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-4-c7e16a6d5885@nvidia.com>
 <DGSH8LCY1JT6.2YRPF2ZO49OCA@garyguo.net>
In-Reply-To: <DGSH8LCY1JT6.2YRPF2ZO49OCA@garyguo.net>
X-ClientProxiedBy: TY4P286CA0125.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::15) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL1PR12MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d34c9d0-3882-4baa-561f-08de78d7abed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: ybuUa9Ke3Y0DtQ7OP/0iRr8TojyN2SSemmiNNc8RejF/YaOVCKdIBfenxe8NbeLbzaN6nEAUTCAHAxrSLj/AzZYay9e+VcheBp9WICgwKV4h5ZTiKqmOWNCGVVhps5XoBL4ulhYynbYkmp4ne9RNbYm4H1+163pMj18WWyPas4eYQNhqq6pGTScwh+h4HUmmpjmsz7pF/RHeijr+D+vyrEp3P/hphuFOxWqjKBfIzkDbwoOtBcfJ2zT2dvD+vK6ZnzpmB9h/DDCGZPJYm5z95F+Hjm/ZWFwjTqFD0atqFFYOTzK4ulZy/uB04ZxfBf5PLEl/QYZSL5LDBwFivcgASamb+aw4uuW99QY7z/qopxQjobUXBJSKLLZUK4NVhtLWISSLbbzZFm+6v0woA+77pmhkKQSsMLGm2V5DxU5rcvVoRNRRozWZBN2etPMEPONYnTW4mQ36dki7WYZ0tuhOLGic8yixkoDCKsYL1R4uBQQ2ol7cnelpBXPgyFGdNqetcI8FDGmUdzH8/X54oYQJv7jBpQW73GRoGmgOhITnfwrbwjsUjXbMXChbrkUPprffkGaYnelj28S75JTYV1zERso51uXt5IohJs8PP1lV01TY1Cj7GBrGMzgggc8iWn85uVDl/6p5tGwCJXK/69kqi0gsUYG/4xggVq6eNNtLDo+kF5FruJ2Sb5N0QwirOlWsMbxawR48ilBgmvBAKnWp/c0DjrcJ69feWlSKkN/aPIU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVljUFJ1V01CZTYwclpYOTUzcjNWeWhuWmVKQzJGeVY3blgyeEQ3YjNnV054?=
 =?utf-8?B?QXVQUkxmYXpRb3N5Y1lSdnJVbVhYdnJIeDNXQTJESnRvOVhzbkpjZDBxY29p?=
 =?utf-8?B?c3ZKYUdYS01kcnJSZ29PdFZ5ZHJncTl1M1lqM2phei9TV2FJcWxzeTR5Ymlh?=
 =?utf-8?B?TGFObmRWdkVjUGwxb2tOemdjU0hBOGVXSXdUSFhXeUkzcmJBdkxRY2hEL3BM?=
 =?utf-8?B?MHRaZTNtYXJMaWxpQlZRc3Y1ekJmUGtZeE1nVXFBaERYY1JUdUlyVUtoSnZG?=
 =?utf-8?B?NzVUelhpMmxmZnZFckVVUHo2eGlIS3ZFM0hhY0phQ0hXTGgybGh1TFIvQ3pC?=
 =?utf-8?B?UmVnODEwWExLaWNDdjlEQ0lJbEhwU1g2bG9ldllRRkFmZG1XMTQ3ZFhzdmxQ?=
 =?utf-8?B?ZFJWWXpERmJ4VUh3Sit3ZHFTU2w2VncxYnFlcUdQTG5uc0ZBSEZYODIvb0tr?=
 =?utf-8?B?T1pQVGNaSXBYdVNhTVhhMjh2ajBLa01HeUc3bStOZ2xyMnNoaUlobGxWL1Rn?=
 =?utf-8?B?ditqSFBPOG54ZHdMOVh3WlFoaE50RWowdG01Zml4Z1h5NnRSbGZmR0dBWnVv?=
 =?utf-8?B?amhvTUMrdU0rTFVPNUtQeXYyeWZIUG0wdkJndXkxOGhhN084VnFkSWJjcHow?=
 =?utf-8?B?Z1BmeFNQZ0REOW9RVUtmR0JJYldVd3hjMllocTJlSUxnUTRvczMvY2IwL242?=
 =?utf-8?B?NzloOTVFbjNmVlR2czRLUXJkWmhKcFQzU0NPNDB6Q1dVK0pRMTVpcCt5WUt3?=
 =?utf-8?B?SFEwNEwrNkE2SndUMUwwRmthVE9ZL2xFVXBsUnlhcUlCT1NvcVVyczc1dVlC?=
 =?utf-8?B?NGdiaElMMUd0K2Z4UDVnZUMrWVRjNDJMb1Rpb3gzRkx0S0FaS0o5S1F4M2dG?=
 =?utf-8?B?MXJmNzNYY0M3L1ozK3IydDhRTXUvV2dvUWd4RU1NbldaVkdWVStrRHZldGIx?=
 =?utf-8?B?Zkt6Q1pVTlh5NGhkLzc0VzEwMlNlb0RFZENFSVJHN2RmSnlYSEY1c2tLQnUz?=
 =?utf-8?B?cGpOM3ZSRDR1d2t5bmZXS2IrV2lYcGJyZktsU1NHdktkZkU4ZFFvbmFCSGI0?=
 =?utf-8?B?aUV2aXZlbzg4Tm4wNUNJcldtS2xzU05wQWNRMVhmVEp3QzRtdUZJdGZJSkhO?=
 =?utf-8?B?NUQ2Z0dzbzdjeHZRZ3JSWEF2U2p4WHpYTzJHZ3JlZzlUbmVPc05qU0dTY0Vr?=
 =?utf-8?B?VE5MelRnVzdtOXZzSmdsWGxUMzJTWlk3OUxnS3N6UXZFN2w2ZXJTWXlHM21v?=
 =?utf-8?B?STRHczYwSXF3U3krL1lxVFVUdFdCRzNYbkk3OFM4bjcvNUdaTHJ5K2JrNFhw?=
 =?utf-8?B?NEFPTzU4NW1SRXR4VGlTaGtwUWZPWFVCVlYzUGhxcDNyN1RudXkrNVZwc29X?=
 =?utf-8?B?STE0L0ZCdVFQZnNOUm5VMjRmT0tiaTBNd1dleXBWUHdMWWt2dnFWd252c05Z?=
 =?utf-8?B?Z3JhV2tYUkx0T2hIM25JbFRvMTl6UWZxMGU4Q2pHbEtwZ3M5WENQbUlrbnpG?=
 =?utf-8?B?MzZLM3RuTXM2d3ptQm12TWd0UDYyeGozaGpGMFZGSlhQQWZYWi8ya3dCSkNm?=
 =?utf-8?B?VUUxRGd5MFpNUGZiKzlKK09PV25QQ2ZKbXRBc2NIWlNIK1dPczFUOHBEWkhw?=
 =?utf-8?B?SUZpTldYdmIvcDBnb2FRWFdvamlNQWNDUEt0MUJqQk8wTko2YlFBTlpUTnZT?=
 =?utf-8?B?VDF0OUdxWGRxQldmS3Zjb01DK3p5UEQzSE9QdEw0YlFCaDFOcDZKTHY1NElu?=
 =?utf-8?B?TjZZMUJuZmEyV2k0eTF6anJrYXVqZUlVL0cvV0E1cVlQWHFBSSs3d0Nrb0VQ?=
 =?utf-8?B?bm1JM2VWYnBic1EvZDE2a01vaWhjUWh0YXVwTmp6aG5DYjlUMDU5WHdTcXJn?=
 =?utf-8?B?K2Q3ekxKTmduMDN4NkQrcmV2aWJKeEdFQTRzZ3ZYL24xUXhrT25RK0VFY2xU?=
 =?utf-8?B?bDcxQThwSU9CeVF1Q0lSei9sUHBnL3FUS0VDdHF1OG9yZzdLZWxPMFR4U1pO?=
 =?utf-8?B?UzdtODFkajdQT0Q0U0FkdWxHVFQ5Tkx4TDlLQWpZT2Y3cGMvTzVxUWxBZzQ1?=
 =?utf-8?B?SERlZ2c3Q2ljcGRIRWg5TE9zSGRmTXRreXY4dU9pRU1XQXdrMWZRcnQrdlIy?=
 =?utf-8?B?bmUvOXp6Zjl0OEpFS2YyMFBrV0hVcjRPeGxjRnNIaWpuZmpxRmJaWUh4M3Bi?=
 =?utf-8?B?ZE1xbnEzWkZtdTJPdnpDYkJ5Z3hjZWFINGh2YldSWlNYSnpuTzBPZmNWTjhs?=
 =?utf-8?B?aE9TTWFDRk9wOXhwa1d0aFJMaW1Kdlh3WklUMW1vZHJwbTMyc01YYXhHS3lq?=
 =?utf-8?B?WXVnaTdXV1YvbHNma3V1RWdrcUw3SVNRMEdDMUpnWk5MSTlpbEtINWFBWXla?=
 =?utf-8?Q?OT7cuDRDZamB3X8iT1NX5JTpWDpKmQ8K/acb4rH45o2PP?=
X-MS-Exchange-AntiSpam-MessageData-1: uIM6SbVTV4oFLw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d34c9d0-3882-4baa-561f-08de78d7abed
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 03:48:03.2038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHUvW/NPmEzVuu0dMXjB3RDwrpTex2KyuuLORv4vhkNi3IG12b8UIzGYy6RjzUh3UxZK5d+dOXp75+nqVeP+Sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5825
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
X-Rspamd-Queue-Id: 9C80A1E889F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[garyguo.net,nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue Mar 3, 2026 at 2:36 AM JST, Gary Guo wrote:
>> +impl CmdqInner {
>>      /// Sends `command` to the GSP, without splitting it.
>>      ///
>>      /// # Errors
>> @@ -540,7 +493,7 @@ fn notify_gsp(bar: &Bar0) {
>>      ///   written to by its [`CommandToGsp::init_variable_payload`] met=
hod.
>>      ///
>>      /// Error codes returned by the command initializers are propagated=
 as-is.
>> -    fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Res=
ult
>> +    fn send_single_command<M>(&mut self, dev: &device::Device, bar: &Ba=
r0, command: M) -> Result
>
> Any reason that the `dev` is passed in everything instead of just have it=
 be
> part of `CmdqInner`?
>
> It appears that the `Cmdq` methods don't actually use it apart from passi=
ng it
> to `CmdqInner`.

Not a strong reason - I originally thought it would be a bit nicer if
CmdqInner only contains what we actually want to lock on. But I think
this way is good too, so I will update it. Thanks~
