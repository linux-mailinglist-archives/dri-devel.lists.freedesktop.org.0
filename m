Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOHrIt6AoWkUtgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:32:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D291B69BB
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 12:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612AB10EB06;
	Fri, 27 Feb 2026 11:32:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dzqnfMin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013040.outbound.protection.outlook.com
 [40.93.196.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC55110EB06;
 Fri, 27 Feb 2026 11:32:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VX84hBvnm7zhDzrCQbSAyLcb+yCJjOvn9f89D82sINBtO4ceap2/kPRQ4X6jyGW8fo+kwwLDjLGEizXaxFZ+HRFrTz2B3wF9aQNF+GJaSUOHlSW/wyIMttGa9XFOJfncYdcUBFlUsfxZbXXPDgMTZySri0Y43t93ap1KyWxdfYsBM9g9GdHcLFv5YypticmJR0zWrqi8PnWb7czjP6yjo5n7r5/It5VCHe2Xz0LiCGDl9B83VUmzofFAh32yM1VIgV/Ia0r759FaSg51ExgOMdIsMNaxCrmWhlFcdNwaMDKBvcPb0Vdlcjw6l2g29/w/d7DI/N3A6zgtiPzn5ldmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HydwHC7wsV66ivF5pyWg+u3mEGejd2bN1hKLCaTmxXc=;
 b=QoDbMpXVpSu8wUihD+/ZgZnxJ4EbtjDFCvHWqZW8lllwK46Gxrvs8yhu9R2FEh1FdtAYZ+vd6w5Or7N+4wwtY7hUWT+WxcGpapF8E/WDiAWtyCtwp930x0pwcPyisn7FgF6jxATaLuHgWYpq2oPwtKLfE8yZm+l4c765Of2HX1sxoQbofkYYg+FS2BDA+3kc1VbYtgtlpJD7+++OXbSioXMHdVmn6umcewFSskQBAdhato3DryOIaE/lIH5HQ/me41qtoCL7xR+yl04v7KvNUdppqy8XIpMbl/44FCCEfHX267icROlnC/7lhihmlyBthMWGKiMnyplYhVModXox8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HydwHC7wsV66ivF5pyWg+u3mEGejd2bN1hKLCaTmxXc=;
 b=dzqnfMinWWqo8XtqC1afsWHkaSIHcKBQuUZz9JYmzgXC8oPNwCmw47Wac/kSt3AGTnQtgc7uoSMZ9EUavSqeumyUrbPKPprn1zrB8cv+PPr+dUwdFai8MYNsS38f8eT/KfMQeeckroIILxyQIF2NeF2qu4VMPazlvHAcvXf+J1FwbLh4I9srMy/QJU7sSNz0yG2H51iFTVA7rZLPOzlPHAwTUBHN61hgWfeyRrBjqlLqWMQKKZnTDZFGm7PJzI4CQyE8RiqTVCTgU0Cw2LzmriTmOmoFqUy8AflnSE/8G/zgGTB3i5ncq7e+k2wBFJBMkf4Neq23wam08Twz/5VXYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7460.namprd12.prod.outlook.com (2603:10b6:a03:48d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 11:32:37 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:32:37 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 20:32:33 +0900
Message-Id: <DGPPM80YS5P8.3UOZ42Q2O8U3G@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 9/9] gpu: nova-core: gsp: add tests for SplitState
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260226-cmdq-continuation-v3-0-572ab9916766@nvidia.com>
 <20260226-cmdq-continuation-v3-9-572ab9916766@nvidia.com>
In-Reply-To: <20260226-cmdq-continuation-v3-9-572ab9916766@nvidia.com>
X-ClientProxiedBy: TYCP286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b380d7b-0ec0-421e-9a5f-08de75f3e837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: JxhOKQ4IYvlUlxjwk8x9dGTzA3fX8dSDc2slDtLs/AeJMxJsZ8nJcwo5zxzvsvIiGXR1fGrYroR+xTBLy/jBH9cdqT7ErDrMLNxcJBAxkxCP2HXPD6sqe+2jrff8wVTrsksGDbljJ07Nfmic529LMaeDdQyRyNiI9PESjH6KTo3Vff9BhvuLlvEBqU9lMZwVI5PXN0zy+rsPsbpncekO6DPWuoZE1dPFOLi0OfaggFqQ0J6Viel3xm1Iw9hqp0HKuEV+2O1E+/EgLGoggNZj+UbdDT3g3bCrK1tEGlh0erdIEzu8OnK98EwFTLJpIX/7255Tq+juI04KXJBoo4v7WhmBozKj2H8R1tx44ZnTXn6MZZedl37fBO9w8H0b/mWIyXB0N3BcxE0LpNV59JB2teIPI8wy3Xbih+ter6nQK6fmtoF3TrfuXA5pM4fq/4mz1+qEWvkpfKtYkbvcqeRyhtO5gdpmRV4jG7vaOMBAHGyr4QRl2gqocOWHsoWujJ20Puwrj2EzLYg7lR+XUburu9NWzU4AKwZWg70+tOMyHSuSxdjX5cUBYG4zdx9rA3e44s7GN8Y02lvuX6Orn49z0hBJXCGDwum2uLkDoxeTPDeuuvCsPT4h8I7rH/2qR16JNbuCsQhvFQYhvyobZE5hVmguT+AYYF/+woFPptI9HAMD7ygdrjWcNTLU7+2AotYpMDyGZD6xC6dmb1jUkETwlLfcHJLsZEQyU1QdjhNJnTk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qkx2Vkp4K2RVWUlZeE5Kd1JzZVFEUE9BekNRRGk3eURQQURad2dYMG56RWUy?=
 =?utf-8?B?MmdRMzNHdmgzNS95UFB3S0thWUpINklkZDRNNE5lNzQwL09Pemxoc3Z6Q2pu?=
 =?utf-8?B?RzFINDJrZitjRVpXRitsZnhyQkt1TUtmZGpJYUprWUx4OHo2M0IwRVlHRFNX?=
 =?utf-8?B?NmNYaUNVRElVK2VCSWg3ZjViZXpHY3hnUUhZNlFtMkxhWkdvQm5qU1BHTmVw?=
 =?utf-8?B?RElOK3pkNFArY2dwankxQUp4UkxqMno3N0hHbVk3ekRqSk9TZkpHM2VtcXRN?=
 =?utf-8?B?NldkOWswSjNLVjZ6ZlE1YnR1cUhpNFVYMjBZbVRCbVRSYnNUdWZzVkVMZ3JJ?=
 =?utf-8?B?Zjh4dzI3RmlGVldlSjMrUC91UFN5WHl6cHB3NFp6RWF3WU4xcTBPVE1ieGpx?=
 =?utf-8?B?c2xYWWpwdi8xUXkydlBZL0NvdHlpaVJJV2tERjNrcXB6OG1DQlM4dXFtK2pF?=
 =?utf-8?B?bFEzM0lmK096RVBPMGdhZk9MVkEwaGFIVTNwclJWLzBGYlNtNEVBUGJkc2RF?=
 =?utf-8?B?WmE0QXFYSCs4K0RZdzAvREJ6VEZFRCttOGtRZzcwY0I0V1l5b0dDSmdzS2JB?=
 =?utf-8?B?a0wzaFNRM2pXQ0dUdi9lY1dlbmZnUFdxUXlaUWpjS0ZCWHVMaUY2VDY2bXFL?=
 =?utf-8?B?Rk1GK052UGwvcVNXZ0RUVTlXMG1GZmpIWHV6SkhRVEU0YzlrcCtTT1FadzFT?=
 =?utf-8?B?YmZyK2NSVlZpdWgwNlVLM0E0eEErT2k0b3dUSDk2dnJjWXF3a2UyVUFrWUls?=
 =?utf-8?B?WG0xazVLb2xhdTRpbzh6RXhCbjlkdFRtT3lKNlJoUlVRV0Q0dmhyNm52SGhM?=
 =?utf-8?B?d1FRTVRaanFGSzQxWmNmVmlEWENuOTljMlJKQ0Jsdk9xaXBVbDdDMWUrMkRE?=
 =?utf-8?B?Q3Jxb1dLQnZNWWlldkhUQmQ1K3V1eFNhMXlFOW5jcjhhenRtMG01T29hSGFR?=
 =?utf-8?B?Rzd0TlI0KzJJVy9SS2YwWkppUTQ5Ti95aGdYY1JLVDUrVWxmTzFTVnU3N1Ri?=
 =?utf-8?B?MW8wK2JMM0FxTGMzaDUreis1dlZCMjNSWjR0VGhtc1Jpcnpmcy9obTdGYWdh?=
 =?utf-8?B?Z1BtT3ljcGs1RnRCSDBoZk5UcFlreUc1d0hJb1MrS09xSTlPVWY3U0NtYlFS?=
 =?utf-8?B?eUVmRWlncjVUSUY4aTNoZitIdEhEdUpwaFIzVGx0UmRsZWZ6OFRPcXM0RXh4?=
 =?utf-8?B?R2JHK2paUzBXWjhMRFQ3bGF6Y0M5QThsK1luVUVoMEg1ejhhMVl6cmR3Tlho?=
 =?utf-8?B?Z2RDd3QrYlFCS3dpdVFWeUpjTjhjd3cydm15VlFFajVJUTNzM3pFN0Y0OGpr?=
 =?utf-8?B?eHJFdThiK0ppMGs5eUEzV21tM3NORlBEbml5ZzlWWFZ0b1U5WkNTcnNZK3BT?=
 =?utf-8?B?Y2hJeXp2T2xydlZLM001ZkEyaXkyUmxlWlRwRGFrbVMwRzUwWm1lSVpIeDdO?=
 =?utf-8?B?b1dhWGxWaGJKR0dvd1lWei84QjJScjdCbTNKTWh2UE1xemZ1Wkxxb3hTWlgw?=
 =?utf-8?B?OEdZaWVVaVlzWHE3TlRsdHZFMnc0SHhYcCtjK0pOaTdBNGJSdmE5VnJjZmRm?=
 =?utf-8?B?RzBRamdtcFBHbmg3N3VPSHNNNjFZY055MW9DVkw5ZitCblgwL1lveGMrOFhD?=
 =?utf-8?B?bGl4UGZFVGVsSjBNNWVOeDI4QUtrWXM4OE1xSUNWRW1nUExhT3U5MGJSRnZW?=
 =?utf-8?B?UENOK1k2QXFYZHh5R1dVUTUyRWYrV1dlamx3N2lVaktqU2tqeGMxQXd4cGtZ?=
 =?utf-8?B?NGpoRUVheUk3ZHMxTjJXblQzdWpNSVdQWHRiVllzamlBOG9YYnlEY0g1bjFT?=
 =?utf-8?B?Q3JlSDV5b3lNR0tFR0lHRmxidGM5NzdpSUJ4a2owN2Y2L3lCNFFDdGM4TW5w?=
 =?utf-8?B?blRObjFEdUQ3UjNFaDZOMWZRaFUxTldONjBsdFlHYWoyQjg3bWgvSkliY2pI?=
 =?utf-8?B?dUdIR3JIUUZKTk1uY00rK1J3ek5oUnJCYnhoZFRhNjNDRFJGc0UweTNOU2ZW?=
 =?utf-8?B?bm0xcGQwSHB2OUsrd2FzbEhZWld1bXBrV0tlK0hUeGExblFDU3VXeW53bXAy?=
 =?utf-8?B?RnBZaDR6bTlHN294QVdBSUFrQy9pMGIwMHN6c0M0MEdKQmYyZjgyZkZNaXdZ?=
 =?utf-8?B?YlZGdENRRmRCQllobVQwVTZZTE9YcjNacS90SXVISTNFSmVkYWovVUZaTkY0?=
 =?utf-8?B?cFNJOEpFZGtZbmVzSzZZYzZub01wM3I2YUhOODU0VWpHbkpncGt2UUNpcVJO?=
 =?utf-8?B?SC9NSTU0NXdINzIxZmt2dU9KSWdVSlVkZnE0ZkJzRGg3akxQa1NPNHVhb1hL?=
 =?utf-8?B?NnE2V2JJMGZMbmhETlpybDdzSmhTSjlZVnhSakROZzBHV2drOTJnekM5UHNp?=
 =?utf-8?Q?2mpUgm5i9DFN7k1zXtapn5egccKmsHMwI52DTpe+m9U5p?=
X-MS-Exchange-AntiSpam-MessageData-1: 2KIOtlZJldS+IA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b380d7b-0ec0-421e-9a5f-08de75f3e837
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 11:32:36.9322 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XHTmqAgOSD6HMvKmVI21hWyp2PhQ4OsMPniezlbTY9dGxDAQ02BGu9SUHNcGrjr6XmO+a7exPRWshXgv/7E3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7460
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org,nvidia.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B4D291B69BB
X-Rspamd-Action: no action

On Thu Feb 26, 2026 at 8:45 PM JST, Eliot Courtney wrote:
> Add tests for SplitState. They cover boundary conditions at the split
> points to make sure the right number of continuation records are made.
> They also check that the data concatenated is correct.
>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/commands.rs | 114 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 114 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index 6ffd0b9cbf05..74f875755e53 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -384,3 +384,117 @@ fn init_variable_payload(
>          }
>      }
>  }
> +
> +#[kunit_tests(nova_core_gsp_commands)]
> +mod tests {
> +    use super::*;
> +
> +    struct TestPayload {
> +        data: KVVec<u8>,
> +    }
> +
> +    impl TestPayload {
> +        fn generate_pattern(len: usize) -> Result<KVVec<u8>> {
> +            let mut data =3D KVVec::with_capacity(len, GFP_KERNEL)?;
> +            for i in 0..len {
> +                data.push(i as u8, GFP_KERNEL)?;
> +            }
> +            Ok(data)
> +        }
> +
> +        fn new(len: usize) -> Result<Self> {
> +            Ok(Self {
> +                data: Self::generate_pattern(len)?,
> +            })
> +        }
> +    }
> +
> +    impl CommandToGsp for TestPayload {
> +        const FUNCTION: MsgFunction =3D MsgFunction::Nop;
> +        type Command =3D ();

Since we are testing the size of the data written on the command queue,
can you make the command itself larger than 0 bytes? Otherwise there is
a potential for missing errors.

I'm saying that because it actually happened to me, I used
`MAX_CMD_SIZE` instead of `MAX_CMD_SIZE - size_of::<C::Command>()`
somewhere, and despite it being broken the tests were passing.
