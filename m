Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K+HGtEnr2mzOgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 21:04:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC44324097D
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 21:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B124610E5B3;
	Mon,  9 Mar 2026 20:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="l6UY21Mp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B3C10E5BF;
 Mon,  9 Mar 2026 20:04:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkFdhuoq63xVbj3YNPyCyWimUq4JVYlyd7yl50tOMRSuygM0I4I4s0TVqRPycNWHGWAc1B/FC/1kWC0JyCtSDbvxWE3mx8m1wbveG9LWT0c42eiefeP3AzV28v4+ExPNXYFDKMFiP2poVsjG/YpjRtR1LeqlCa0veeFemFNN5GMEjZkiQ8kZ43mtsFmLp3zqjhJ+QdV/W70amocmcgNIlw2tcUrcfarqMBeG5VkgDTYy/neoqT+iQNa0Y2pRlyZWXi0rzyvFhflOnhhYs8eqLV+ZWq0PyGPy5qSmJBaKUgnQClVyxH677l3CFgun86bAJ/GqWOtU8Cf/l8hyoFVg6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3rxjeXiyGLrCNpgZ7OsPNnTfV/wcfc+lWYrkQYqAx4=;
 b=bQKqvlteq9n6U0uyQTJi8E8xq29NwlXgyjmGlHdF7ZYIYRbRSHKKdlC66b1um2nJN6gJoPnX5brgaAlX3f3NyXBrkbwGbPl8s5kQ7eYVnXzln4Zjkp96SAmczuT4ipXhZRksIWYQWAA4+/343ba18VU+FvirIk+TI5C1sa+rGp9WSNulzi8ChemHFFOY8PUI8k3IsIKksc9kkdwHWMDDNVFLoNI+9BHRd8XsEy+OQo4PehCQsRTH1bU9i68eUv3SRr0yyieNJ58la9zHEN+YPwGNo8AIWVf8sllZ4zXN8dzL5Wq9JP0MgjB5BZeSCGBhFeDi4HtSRZmqJm8i0VTIxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3rxjeXiyGLrCNpgZ7OsPNnTfV/wcfc+lWYrkQYqAx4=;
 b=l6UY21MpF9pfiAwLjsbv5TvANBzZim7SvIXFLhkpscwmWRVKI9pj2hm6G9VqnhIFwvLCxqHji2HKT0IxtrvkJDH/XEqnkvZhR9jdi7ggbRkLh3/dO6GiFTjEK5OrmenF91N4w0Ypb5diJlIC79ijFAwPqj/U9SmrLqBZP2OQrqcD9skc6foW+on0hqInEcLj7DgHMLvs9LVij3Mamv1w/9QhVYggmoHTDOgP4e7kEI4AN5qDTuZmBFapHrNkoWNNUsCX8V7nEz+eIQrDO/pScKgFXtAAUq3TQa0DbTyXjqZ2Tw0kSVU85KeBolj9FZgAow5ojq586/jJ2zB4rdFDAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN2PR12MB4376.namprd12.prod.outlook.com (2603:10b6:208:26c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 20:04:24 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 20:04:24 +0000
Message-ID: <282984b6-a0e1-4e3a-bb57-db817b7e9249@nvidia.com>
Date: Mon, 9 Mar 2026 13:04:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
To: Ewan Chorynski <ewan.chorynski@ik.me>,
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::41) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN2PR12MB4376:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f29e692-5065-4219-59d5-08de7e170f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: TLUV/3r6ZtQ0bIrIKaz+CSjXgqKU/Q4wubJNUqNTHcbsOv6o3WuD+J304ULlYuMtoKH97rBAOq+wrCDjf9PusuaT65qz89Sh9xVHYgOvc29cY2vMHnDp/DNsJ4Ex9CSFEa7McSvRf8HS5ZZrGVNYuL5j8GH7dFf8hJtcPXn4/RV0Sv2HuMy+jHdbOfR3gEmDh4i0WfzPhSVH/VoRWV2/bjODGKxb1SdHrIQRI5r8u9k82UrZGWb7nEBLv3LQQiBPqkc+Qefr1OFKA1zo070I4Whf+AYRwIKbsjHSnipKFJ5XulHbuyctTQCEx/AqSugLGxSPxOZWltmFu6dKyP+dcyfRYxsVgEufWIDF3iWgz1ATG4uaIQ8zwW+4XsntyGadHXFYKfr1mEta/NRgwN74t2/U26/lzIFn57t2zXhT/7Lz4aB0Pf9u12cPYj89U8Dl93w9QzEBgvxUMecNA6oK2T5CLvRQBR2tKo6yX+NZ+uGDXxgqF9WAbv5CO68UxrTjVDFHIXt55Aubcwy1G9/W7Gi4Giq5ndCcs3GGKyjRG+A2wAHxZHqa5PtXI/sq8RjjwBBVijGQL6yEKbQXo9BiiEp+Jayji/mMHVycdgspY6CuJ7xJNazc7d8GqDTdlG2kPg4P7lbkiB2fyhmqvYC7c3WJ6Flwt7hH1KyN+xNxc3yvgMl15gAgURjGJ3MBxvhE/hy1+ddD36ALBFcSSAPx0zXkPfeHHdqMwKhUMPCS2pA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODJIREdFazhMb2JrdHdrMC8zNGJ0dHYzS3ozRGpORmtYcm53ZWgxK3BEVmR6?=
 =?utf-8?B?TndhVXVGc2U1N2o3N2xyOG1xRGtSNksrSnpJWERDMUNHbzIwMXY4Y1ZWSWtk?=
 =?utf-8?B?bmN2Q3FDbm9hTGZ2K3RNT2xYZllmM3pyKyt6UmtjL3lqc3pnNy92cFl2SFY3?=
 =?utf-8?B?aUZvakFGTFVwU2tmLzR2cHk0QzR6Z3Vwdi9paFZsU3c4ZmRhYnF5REJmemFa?=
 =?utf-8?B?Y214S1lEa3E5YW1NT3FEWDhyOHcxUGJFUmFFWmQrdktMRi9VUURySFY5bWFD?=
 =?utf-8?B?SlRCRzdUem1QMGVNelljUFcrWldRbVh1ZFEycHhoRDkyQ2t4ZEFvTkVRWUwz?=
 =?utf-8?B?SXBFcTFJQ3hpWC90R1ZOME1wa0Z3bG9qTG5Eb0t1RHRTMmZOSC9RM2VxcW9x?=
 =?utf-8?B?b0orOEtBYVJPNExhMFc2NjkwdS8zTDduNGZuRktFM0ZpREl0aVBPeVJ4Qzl5?=
 =?utf-8?B?bEN5QmdKNXhtUEIxNm1IZnl3dXhBcldVMkNqSWF1T0RZdzJHTnB2bm82Nno1?=
 =?utf-8?B?emdtS0FNZmxEekxEbXNSSVV1VVk2aU9XSWxUc3lQN3QzdHh4bWNxSzQrVGpu?=
 =?utf-8?B?RHVVR0x5dlJDakNESStXRlFJeEl0TUJzKzRqb3cvUytYVlJOL01qRnZ1ckI1?=
 =?utf-8?B?b3o3RkxqUm1hbU1WclB5YVNnWkNaQ1FaQjVsbVNVNmp6YmdPbTZvSkp2QUw1?=
 =?utf-8?B?cmRpWG9SODJxSy9IMmZSODBXVFR4ME1oemI4bVlJTkpYamFrY2pVdkdhY0pW?=
 =?utf-8?B?QlRKczNKS2NJZGFBSGdUR3FYdlh6dVJTY0FjdDBhTEl6K2U5TWxOZG5adStk?=
 =?utf-8?B?VmRJeXl2UVZLbmdEd0llVUVzRjJnejVxVE1zenhRNlMvSlFpMXpBdE8zYmlu?=
 =?utf-8?B?dURLUnZSbVl2SzN6RHEvZUZ5RGlyUUVTck1MVUhyZWxqbHJhejNBSWg0SThK?=
 =?utf-8?B?dERncTZnMW54YVI4SUhnRVNOdXovblB1UVFYTDI1WlFLMjgrR3RoRVp2VDBN?=
 =?utf-8?B?eE05dUw0c1l6MTU3MktzQ0xWZzhydFBDaHZEUUhzZ09xWDdKMjhJaENrNC90?=
 =?utf-8?B?c2dBZjkyOEJhRnA3akJ1Z3pFQXB0OHpFU0F2VllUV0dpcmpsRGhyTnhaY2gv?=
 =?utf-8?B?MTJ6a1hXcS9DOVpvNCtubGIyRDhqN0tZN1RubzdEN0R3amx6T1Y1eVduZmJz?=
 =?utf-8?B?VTFqRUJGLzdrOXlRQjZhSDU3UlgrZkRkOS94aXFVWXNlaWJPOEpTYVpLaEFK?=
 =?utf-8?B?Z0JwNkFjdVhUNEhHVGgvYjdqcDdWdm5TbnlJTnpOREM5bGhlSVNFM3dCcUFN?=
 =?utf-8?B?dndsZ24zRnRNUi9FaE8xL0dYTlNxT3pqYTlZYk1ZODZFSGdRN3FPOWxuaFlL?=
 =?utf-8?B?YUJweTc5MFN1VGlMYjh2eXB2cCtuYSsyOGN5UC9vNFVETTdwdyt1RkFGaW5j?=
 =?utf-8?B?NGVOOGJaVzlPbm5TTlphaEk0Yko5R1FQUVN4MkJQMGxabmxRK09jK0ZpTjJy?=
 =?utf-8?B?N0xQVnRXRDhsZnZlbisrelFUZzFrc2lSOUFNKzRuK0xIaHd6Rk9nNUFhSXNx?=
 =?utf-8?B?VWpqZ1R4T0VhWGUveUJlT0lncVdnUUFaRkV4M09TSXNNemUrSVdtOHNORUUy?=
 =?utf-8?B?dU1BOGVGK1EySXAxb2ZhUnc3U3JNQmtFd1JSclF2YVQ0RlRYTWswTlR0TFVY?=
 =?utf-8?B?SzhKNmxuVkRjSjF0OVBzMFkwRVlQNEVoMWRzOFc5TDU5Q3NSYjlMWWozcCsz?=
 =?utf-8?B?WFlvUVdiK1hUMGsybzUzU0FWQmNyay9naE4weUhKa0JhUDRNdk9zRjRUS2ZI?=
 =?utf-8?B?V201MGdYeHhSMm9PUktDdTN6Tk5XeVdUcmVTODJjRUdnb2VMMkRHVGFaTUdJ?=
 =?utf-8?B?RGQ0cnA1UDc3cmhlRUdMOW5JZVdac3VqVmZFQ3Jqd3pxVEtDbXZYL3Qva0dS?=
 =?utf-8?B?RW5KWE5zVldaSUFKZ3BjTlEzSCtlT2xRNklWb2Ftall0OW5vTDJpdmgyUHBO?=
 =?utf-8?B?cGFMdHBGYXpSZFYzMXZDeDFWR0MrRXMrdUVKK3l6RVUwUktiMzlrUi9rdm5y?=
 =?utf-8?B?V1QxYlNKN29GZ3Q3L2RCOE4vUkRDWTNHeU9nRmJuU1BRSWsrb2FtRnc4VHlN?=
 =?utf-8?B?RXF1aW1JSDkwWDJodmduMkhMdVdkaHZlVGE1KzRwbmxtMWFRUmxXOG9NNjli?=
 =?utf-8?B?b0hjeU4wcUlIUDNXMTBONWw2bXJFaDdYREZiTkU5Mi81OHUyVUFlWXpVT2dX?=
 =?utf-8?B?ejhEOW8vRFpmSnJuUVo4WEZVUXo4RkdUTkY3bE1iUVVjbW1NaVZ5YjdiQlM5?=
 =?utf-8?B?RTVoZFc0UkZYeU9rQU5hUjFaaFdNYklUV2UvZDRZbzNBMStxbzlHQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f29e692-5065-4219-59d5-08de7e170f34
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:04:23.9316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WmFVLztN4qbwVOyC2fYffycK41Hsyt5RbA4QGWyVra27UNmkuYUTNeKyLeq759bI55VyydFMWCbXlNs+zxlmWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4376
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
X-Rspamd-Queue-Id: CC44324097D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ik.me,nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Action: no action

On 3/9/26 12:48 PM, Ewan Chorynski wrote:
> On Fri Mar 6, 2026 at 5:52 AM CET, Alexandre Courbot wrote:
...
> I am not able to probe on my GeForce GTX 1650 Mobile :
> 
> [    2.246095] NovaCore 0000:01:00.0: NVIDIA (Chipset: TU117, Architecture: Turing, Revision: a.1)
> [    2.722681] NovaCore 0000:01:00.0: Booter-load failed with error 0x31

I have that exact card available, so I'll give this a quick test and see
what's missing or wrong, now that Alex has pushed the entire Turing support
set up to drm-rust-next.

> 
> However nouveau does not probe either with this firmware so that's not
> really this patchset fault.
> 
> Are there any plans to check this to enable support on all Turing cards ?

Yes, the plan is that Nova will support all Turing and later GPUs.


thanks,
-- 
John Hubbard

