Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGjhOeJyqmkWRwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 07:23:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342C921C033
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 07:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680AA10E37B;
	Fri,  6 Mar 2026 06:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MWPhnXxy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013029.outbound.protection.outlook.com
 [40.93.196.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 762D610E37B;
 Fri,  6 Mar 2026 06:23:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3w2ur6yHFfhIIiLT5bREnQXEZ66KD5Af8w8mJ4fpSilhYh04i/W2wGLpcb02EaNai8CB1XZAtcrhqO6pNKMruVbjNrbdh2BhFblfNHZw5NOPPlmPKwooGSy0EMciBxwmSCJm0HDpt/RJLAPr+XaPQ6GJwvg6EQEPUNO+TKWfdwGaZI2UGpkv5aT65ZtZ+cieNPc8uBPoDobqFednmEDfllTmWo+YzAg38Ey5rfgV30kVYykxHnisQw7j2WkCQT0PHo27nIv6qYT+OirclXeIdaGfa/qEqkEHTL0HP+msVQU/+9HcGfoPXUE53pn8KFoUytU+igrrkGFmb8CxHjqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T5zJos9jRmwkzkUfSL93l7Lm2uqhgutqy3JCx3ZnC0=;
 b=Ux+t7FRSzua5FJBsUwopaDoPUoQ6J+1AzDTb3BLqA5H2VvyAa5VmLuBoUO/fZ9+jHSd61CndoGazFnRq0n24Bv4L6DVwcP1prFOakvty+iBa5T0d2lv3aOWVx9TPQkNA7nEqSlwVoiG2BHYNwVhGA/0bC7txfsvmttesAxKkJNCkw5c33pvBDp+rKSR8FJZyDtjrmdLMPDuD2ChPzNNIkSpidNPPg4BaO/b602B44U6paX24OlNq28GEPYvMgWT43rCwexFy/4P2+uJZvStGoof/XImrzLrpxClHkSpJX3bqmf//qNZLHWK7Lkrh/FdPyl+Yx14IpCbNRVHkizaowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T5zJos9jRmwkzkUfSL93l7Lm2uqhgutqy3JCx3ZnC0=;
 b=MWPhnXxy9UqqYbAbCO0rWLUlKgl/zGStQ8x+BRfNKTaraEuGeg07jffstBMoiIfg0qPxTscz+xFgj7Gv22L+JChIilS8KFWmEUFpFQClkwSEImk+a0onNElMRNixiFzWlRlMfrsJfteqNCEkAsbPvoi0iyLaq+Nh44VqOK93ZnAzzES0H/4eUVYwnZsKzUVwPYGrEZXZwv6gX2PnZifk5jKaqlRerBaaqsEVSiG9oM4A/G3aZu2/A6QIXjgaDVMfQABbbNook7Aky9e8H5KjE02XlnSTnHUlIYOysSAdI5xKq/slRnNBQ3gHOHdK1jIehtAWHe/o0cUiZGK+f4cN4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH3PR12MB8658.namprd12.prod.outlook.com (2603:10b6:610:175::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 06:23:21 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 06:23:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Mar 2026 15:23:18 +0900
Message-Id: <DGVHF99F95ED.Y0BNFSQPLJPJ@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v11 03/12] gpu: nova-core: falcon: rename load
 parameters to reflect DMA dependency
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <20260306-turing_prep-v11-3-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-3-8f0042c5d026@nvidia.com>
X-ClientProxiedBy: BY3PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:254::22) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH3PR12MB8658:EE_
X-MS-Office365-Filtering-Correlation-Id: d8700eca-b7fe-4288-cff4-08de7b48dd03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: BRy5TMkgjP6lsmTi5gjm3jQPXXCsk/mmJAMfdBMf3ZUkoKD10LjFBpDOlgcAI21WntJg87SCLblek72yUDtM4Ik0E4bXzQhGhqIAvgnBjanqVpZQAsaDkxyGbB3HGzeO+CDrDPjNFFNvesdBA0LXVTS8BxSE3gyWlo3WgbGW0+JZpue1QTIqRyJDs1vucwkATMjWzbnK3cZ0HQJIzxBn6vt97dWkmtzg+Jzorqlox3JgYDDyfi0jG7ySmUbS3cJoW5fe812uif3suTcF8ngM+BGFqdBBd/feVkTPIiEGiNRgE9zpRAUpYekymvOR47ou0zkY7zkn81EH9TX8UezMCL9QUf0z8gL7g6/gjLdOH7I30hHiw6y6x2ssjUYc8EtPe8Bqf7yaoIBNEXcthoRY83D+qq1L22PUQ6IP57DCJhSMB0NMmHFQEs8QH8mfzEO8PGoLZMzzLY6XvWkLeI62NWEXiZt/k/IlF+Y5Ens6+fYI8XNyyZHMa8cVp1vZKd3IZ1kI/k892ptNV4eOpXdwAc5Dah2cptJg3IA/vD7+rN+AEisHENNfj60tfRk8eZ1VIg/C+1KiF08WpikT7PWxPOO9XWx2GriKH1pUAgcfGjrgT653ZnLlq+BvVBAqjj4ey9B85kw49TpPc+UIq+0OWTlTZ9MJHLt8pROGa1CoG5Y184NNLNjef+K3IfQoYaxSnqDDvQkKEwbJ/mmiXs9qTo5KzTLZeesoUJX/hNfArYg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3dSNmxiNFVQL3BESG15TE85dkRHeDd0VlFMQ25Pb1R1Q1JndnFYTnJBOHRs?=
 =?utf-8?B?OExLWEhhalRvTzNCYnFscFgvNWNSeVV3dmxiUklxSlNua0xRc0VCSTNnajNr?=
 =?utf-8?B?ZUdqaGZQbmxxVktFYkIvYzVWT0ZIcjJKQUNJNExPcEpXVlRnQllHRy9JRXdX?=
 =?utf-8?B?c1B3MFg0R3BPVTBwNWxHVTVveW01MWVZL0JlUTVjMG4vWERjelBvbmhRZGdh?=
 =?utf-8?B?b0UyUFBITSs3djhBWUZhTFJQVkY3aEtYTEQwUzRoc3lRY2VERjVCeWlINktF?=
 =?utf-8?B?aG5ZNkszbVBpTHBwQms2OGV2KzFnaXp5OFJvNkVrc29ub3pJSGFpZCtmQmJC?=
 =?utf-8?B?TGY2K01OVFkwNlYya0owQ0tFak1abmNYT01LTnU4NjJoYUVHOHdoS0xCT0Mw?=
 =?utf-8?B?VTVvSDBDVDg4QmJrb3Y1ZTlzaVdNNjAwZElEbitBbG5HNWtjWnlNaVpFRTNo?=
 =?utf-8?B?SVFyM1Y0OE9RRktXZ1VwZmRiaEZIL0ppRDdGbm5NRTlocVdGUWxsVVoyT2lv?=
 =?utf-8?B?bDA2L2RnYWgrNGdpTTNIc1FUY2VxK3EzbkVEakFiVjFibWVHQVo5d3JoNEtW?=
 =?utf-8?B?UmtJNnhGN2pxdXphNlFoN1Z0UHZaaytBL1oyZzZ6NitGY1ZONysyL3VZVlJM?=
 =?utf-8?B?S1BDeHNxZ2VSTWRBUHdtNkhVOUc5dEp1VjByZnhiUzcwc1hFNHhCTHpZcE1H?=
 =?utf-8?B?OHdUTnBiWjF4OFpVVWFyQlBzVlUya2FGeVprV1VhbHpSdGVYSTFZeWNRcFls?=
 =?utf-8?B?cjJHMG95OUxMMXZ0T2FVMm5jOU5JWHl4UTFHMkRaL1FqbzhVZEw0QTgwZG96?=
 =?utf-8?B?MzIrRENLczdjdUVNQzdiYTZLY0Uzb1FuTTlQeEtxU29CcTVqc0xQMlJlU2pI?=
 =?utf-8?B?R2xiSENCdVpISVZyUUh0b0tES29aREc5anZlVlI3bkxRRS9WdlpxZXN1Q2tq?=
 =?utf-8?B?ZEN0S244dFZscENuQ05USUpaM1dHa0ozbmdlSWZRTHZ1ZHNiTXJjb3lpOW1L?=
 =?utf-8?B?QjVhVjFKM2lnTTFIUGcyeHZWZXJHNDdtd2NvWnMrdWVmb1gxbkVUcVZkVlZZ?=
 =?utf-8?B?ZE9ndmo5Lyt4aGREU3FzWXBOTmMxUko2VDlTOStnS05ZK2pVL1lHTzVtOG1s?=
 =?utf-8?B?STEzY01oU1F0cmFpOUdoK1B6ZW1yY3FIZmltQlJIMGZtVDY2UXI5Z29TTmJa?=
 =?utf-8?B?YzUwSEphOEI3NEpiVHlWK2tmS21hbDBkOXZ5Y1NzVHhDa2JxaVlBdXlOdlNu?=
 =?utf-8?B?a3NzTSt4R0ViWVJPYlpkN0tWc3NlZk9tNGpjUDdVdUMxVVFMK3hONllJVjR0?=
 =?utf-8?B?RWwwVzZaOFN3d0FjaFNZL3o5MmllNTY4NEFDZGU1V2l1Z1hUb0lyRjcwMEts?=
 =?utf-8?B?cjZXKzVsWDBQSlhPM2YzYVlTMGcwOGljdW1UOTlGQ1ljb1JUekNZOGxJbjB6?=
 =?utf-8?B?RjNVZWJHTFdVUHU5STRJWW42VkhNekdFSkkvY2tpdEMyWDN3RjcxbHQyOTU2?=
 =?utf-8?B?MVBDWmgwM3hEbDNiOVR6MEtSZXZOTk14Z1BNbzNMOWhRQkdnaUszREVxNEdj?=
 =?utf-8?B?TTdwbWFvWTQ3eDAzanhTcWtldS9UMGdha1o0Qklhby82Q2lqRnhUcDNLUm9T?=
 =?utf-8?B?SFVWSlJ0bWNISE05SGtxNzVKUU11bGVyYkVLM0tFdkc2UWk1Q2ZGdU9pM2tn?=
 =?utf-8?B?a3pjQkEvWjZ4OGE2VUE4UHczcSs2V3JqQWJDa0N5cHN4TG5WdFl0L3lBemVZ?=
 =?utf-8?B?T3B6RXhONTFnVDZGOEhneWZLSUg0amFGV1krdzdlYWIyUFIyRUw2VmFRYUgw?=
 =?utf-8?B?SGZrZmJScCs3OWozMzM0RGxVTmwzeXFnTjF6RUw4blhuNUorZkdVWkNibmxi?=
 =?utf-8?B?N1hMRkc5OGFPSnhWVEZtcFRwTlVKS2RuWmtYZ0p6bmVlNWxkbUJCblhKMTIx?=
 =?utf-8?B?bjZob1VhSWVIZVFXaitTL0VCTHNYdzBrL1l0RXJNWnBTQyt1UUlXUHppN0sy?=
 =?utf-8?B?VGVFd1BlRFN0QlVGTjhXckQ4clRaNmZzeXk5NDhUWG5LdDlhZ2F3ZHl5a3E4?=
 =?utf-8?B?R3dLZWUrcWQ3MyttZmxZMkk4SUJIWVptR2VvRGcvZWRvNExZZmJtKysvN2ky?=
 =?utf-8?B?TStHNWoyRUgxc3lpcjNNMHVabmxsV3FGN1hmTUc1RTJXUUNnRmFNbXJOcW5Z?=
 =?utf-8?B?T1pUSERjSUhLK3RXelNKL0M3N0FWcjJnb1Vla0M4dzVVZmdidEd2MWlQOXRH?=
 =?utf-8?B?Zks5WVlKQTFPQTJCUFhhM3pReGlaRzV4ZXhySlhvRFUra2tjUXJXSUxoL3Bl?=
 =?utf-8?B?SUlXQm4vcFRIakZGRDJIVjVkNjRQRjdkZUJkeHhLU3hub1cyMHpuaElKNUw0?=
 =?utf-8?Q?o8R1NWPJAG9bz+eHXTflEfTfJ4fDG3vIQcbyH9DvXUx93?=
X-MS-Exchange-AntiSpam-MessageData-1: OuE/a+PpO1gQyQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8700eca-b7fe-4288-cff4-08de7b48dd03
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 06:23:21.0575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPg7fwj/HIHlTL7xCnsqdh4bEwnP0h8V6vrdlqVQ0sLWxVyqMHAApAnfHavOGMMbKl+8zseGQfRZ2wD2OlRZTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8658
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
X-Rspamd-Queue-Id: 342C921C033
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
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim]
X-Rspamd-Action: no action

On Fri Mar 6, 2026 at 1:52 PM JST, Alexandre Courbot wrote:
> The current `FalconLoadParams` and `FalconLoadTarget` types are fit for
> DMA loading, but not so much for PIO loading which will require its own
> types. Start by renaming them to something that indicates that they are
> indeed DMA-related.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -16,8 +16,8 @@
> =20
>  use crate::{
>      falcon::{
> +        FalconDmaLoadTarget, //
>          FalconFirmware,
> -        FalconLoadTarget, //

nit: // guard on wrong line I think?, here and other places in this diff

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
