Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOZrA5IJkGkFVgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 06:35:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7C613B235
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 06:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0158110E1BD;
	Sat, 14 Feb 2026 05:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="ekUl1Jgt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022099.outbound.protection.outlook.com [52.101.96.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0270D10E1BD;
 Sat, 14 Feb 2026 05:35:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUmMHlP+6tBdBbeBR9U1Z7/nEXR2pGA2gTpaknQMKK99EK8vXv0xJWlVPRvQ6tDb0DNaNpBZ6yZjuJYsMusxg/oWJ+9MT+qzI8ZOa48pSGplZqH6mLJxD71g/9sdGbsj9fy70GYl4mPKHlCckYmjLtn2Q/qcBtMqTDPKQ+4jM9opmfQjt/M0Y/mTLbWbYeW4Al3xqplpUpEo5SdO19zVzKX4naKZSHeIXST+h5kpodzFNCbZOuFdzsVaFR063XSAq3Ptfr8MHfQlprWESqx7KY2KhCuV9aCKNx2e0uAB79afV0/oaVvAW6JPsAmLjfvaaDupok2ApZf4/eU+Uy9eBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RhLSj+WgniiwLn6FewymLFGbWYG/HRQtO48ldzyoUs=;
 b=aHIcA0gEVjGc/6ej05+CKkaXOhN2IP1nwOyBBR8C97ye0Tiu3hlGGUT5nbf4vt/EwX4jZqbXIDOh9V3dkEe0Vf3hWkeOhIIqHy8YbMC2LNVam0OHEER0oNHkDvDbLnnOThDw7vj5SxHQuopK/VKiyN11/7AkLncKygolBB/9IbK8Jm0JGQsAZNcnRGzIMnqOFB4soLe1DOKhCMJBbmtNpfB1SFlzjsu/YB2kip9bvQQGIuRzfsCDdfrWt9GHeublM+SZgIIXwy5Du0CeEInayaziAh7EP3H3zStr55fO5sBuBO0tfvDmo8VmkSaVVCB6lb3JkNAb2TtZG0+5oz0dhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RhLSj+WgniiwLn6FewymLFGbWYG/HRQtO48ldzyoUs=;
 b=ekUl1JgtOdh3QHpJWa4/WIWfWUvyBsI1k1zJaCxfAf4J83uNuXPWXuAAEOmMbjYB7a2gn7nkWDppgCbiAqYleeTBkoow38PVxKVc5H7DdifYc0ppuIGu35dmNJNco4fTVqWtrMdXdTEP6a8tRZK8LeaDkjKWyKNgT8itnLaFC5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:34::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Sat, 14 Feb
 2026 05:35:04 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 05:35:04 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] gpu: nova-core: convert to use new `dma_write!` syntax
Date: Sat, 14 Feb 2026 13:33:40 +0800
Message-ID: <20260214053344.1994776-4-gary@garyguo.net>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260214053344.1994776-1-gary@garyguo.net>
References: <20260214053344.1994776-1-gary@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1781:EE_
X-MS-Office365-Filtering-Correlation-Id: cc316201-70c1-4257-8df5-08de6b8ace31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UqpYmGS5kgKm2SLWm1xAektuYa65YLjH+zcVRGc6Dlr+RJe/XmZfrbshjPOq?=
 =?us-ascii?Q?7/HZkxmvDnUXvfMkywHDUoI58e2QXAcTPAcmZJVWHvrZk22xpcNt7dtRFrIN?=
 =?us-ascii?Q?CZPjk0OX5IbCKb+G/W1x69u5EX0hoWFTa54nTwTNxh4FcpH1gcIE7zPtxStQ?=
 =?us-ascii?Q?bUKsdqNIezfI07yATD1MYCQei+rPakwwLQh8H44xAYsh/iZOGGZNulxava1d?=
 =?us-ascii?Q?3QxKWbN/peJuduPcnYzLbLqYMxps0cfHcP1RHJW+Ug94v1w2+VsBqoOUdysY?=
 =?us-ascii?Q?wXRDK0BZPfNwfOi/ZUnf9lmoogr+VO5Fg0ovV8hNOq4GxTimEJs+TMP6tolk?=
 =?us-ascii?Q?CarzClzvj1Oh+6Vz99BljdTkr4fgPjBO44ifZUB7biOPhfe9Ia3AVyK7jgKy?=
 =?us-ascii?Q?waDqf2MNdj8LVzX5EhBBofGJdtGUjAo0IYOSHSX6yhi2Vas8k2/ZCJLMtcsV?=
 =?us-ascii?Q?V8wUXmMZjj6rEraeSivkhJTVrSbxHWLtnhrxd1xuDcoGnPn58X7nLJYEiy9d?=
 =?us-ascii?Q?xgI7CJOUcLZTc+UbEl0iLLooUqbuc++FUfne5jOhzzoBP2ViCNJj6kBvRAX2?=
 =?us-ascii?Q?PTMC/37dY7qCj89UIkLuhyScBAMl1FxedNrf+iFR595Atxn/XaLE+haTAiLo?=
 =?us-ascii?Q?OBU62HFjpwJ0oeO8xjJTN6HxubbwlXYPuqhkWlLIsDK3YPZFIjc6skygCx2v?=
 =?us-ascii?Q?3SB9DeqJmaKfCtLYJy3YKxTKrWlSlEvBjuN96kGGaotRwK0+TGxhpQRzyTmr?=
 =?us-ascii?Q?FQdwoRFvT2KQaVUORRU0qiaRu3V6hFQfxuSKts8IYuVxcpn8u8JDHUFAxEty?=
 =?us-ascii?Q?ovAgea6n2T+0z0jq2gXG1l6icEZHU5iX7wVHowy+TfFPnVTg69ouFFPYpK7Q?=
 =?us-ascii?Q?vAVMFj4qsyqQQxe2T7vR70OYNL+7dcEo+FpPyXJocGWTahmoT32K6Fy8aD0S?=
 =?us-ascii?Q?lKR013AAc/E1CmpYA9St3i5UbsAEHOQCIdG+t/ClvtpKFgSmr/Q2++QdqRBW?=
 =?us-ascii?Q?q4y6mnh2fpxu2D9mF4wa/C+yOBObNukGvGJizMuiFbb/bKCQAeVffvLrbrh8?=
 =?us-ascii?Q?tfVowVGjjn4lxzowJXe+E7JWz5jeNl/loVECAmotpVYu6ZEX7Ejx+je4quDM?=
 =?us-ascii?Q?sOR0bPriUXwU58Lwd4PYQjlm3qiYdklrJS6b5XtStKlE8LbAIY3GRlECAx0z?=
 =?us-ascii?Q?APiRnn4syJ9UCdefYDpuCztNGtaWbpRkN+bX3mPMgycdc5CzxA8QWFMeZ7Wy?=
 =?us-ascii?Q?+8NgmcbAZXuKQ7irYOSiB2nWnbfJmwYv4ir+ylwokAlPUFbJtTXRY6vxAGrW?=
 =?us-ascii?Q?1W45Lxgxp70uhYxy2p/he+O8MBWFyOtaVbnLOXRJUdAHhYl/Pyj0EiKn6V64?=
 =?us-ascii?Q?ZeDamqjf6wlAfIT34+6fNUTTP14b+anX5rxbcywYdAfWfrhVzMJAxE5X+b8t?=
 =?us-ascii?Q?dE0POy/j/l5oEM6QCtavVluLRSwSqiw2CahD44cSd//qdIK32r9vj8vJxm6i?=
 =?us-ascii?Q?i29b/2MXNou/bjbcCs3znbC+h2azSiKph2QsMbpP2ppb8Pm7twp95hB8wBSJ?=
 =?us-ascii?Q?t83u+dckDnkLJmwMvKZSxOcm5A9d26EMlg2Bl/tsvuIMNJseUrcUMYdGm8Si?=
 =?us-ascii?Q?Pw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YIf0m1QUhQrfycZ46M4QeAxRHnKyIlMGwEdlTQZUQ0ozcQyDn+pomWhhl/4q?=
 =?us-ascii?Q?imua0C8iph3/cTfb7am3GlPxSj0b36qcN0T4CnjFE8irQiotZQA6h4i7WGKh?=
 =?us-ascii?Q?NTXqYZpv0KvyLjdAbKv+Oq0ozHBx7b0UYkgJFxt4jXGRm+XUNVCKI3kOiIYS?=
 =?us-ascii?Q?+Ci3SVyUIBdYf4hogqx2usMaNsXAk3uJS3T2S/Cmc6RPbMN8YdGdOHxw8HPP?=
 =?us-ascii?Q?G30drPbTxn5+LMk77o2BIe54AmQxauvZ3s6bbm8t53dFysMjvsGbd1l/WiEh?=
 =?us-ascii?Q?dnV2BNVaglCjNZ8U2WOeVtfLPhzL5m5fLiB3e0v081PcdunTOE7zA0Il1WI4?=
 =?us-ascii?Q?A9IRsoHL9MUqvHaC0KPldnISaqIhn35b2DCZASgu4gbx913f2BssennAihW9?=
 =?us-ascii?Q?xgaokC7SI5DKoSXkG/tZN2dwC9JKd6bKhLRg6PP15OdBuK/C9yS5To5yYM02?=
 =?us-ascii?Q?FmrPKyrbcZjtT5hnuC37z/C5SwMto0XSXXGchbM1xCYbFkwUFQmHMzsgglxB?=
 =?us-ascii?Q?24VJIMT18xYkvXfQ7reHAAE6H5CIqcggogRYMV7NjptU/brJ+rp49uYlqQOD?=
 =?us-ascii?Q?Vhda3GYPtlPzzrGjHo5LaaSgD4mMiB9AHV0sIlwFXX2Glhs4GsCkn8xZAoVT?=
 =?us-ascii?Q?kaxw5D6EfvO0Up+R/krgsyNVGjWL0uEnc3qSmrXFc4kuLHHBjCU1feEj1ko6?=
 =?us-ascii?Q?3VX1ksnWtBqj64qIffgiJ/TmISHj/OZADy62RRRv4+BfCPKBp95+9UgV+O0T?=
 =?us-ascii?Q?TSu+PSrNRKdKhz81OEm78+kfqqqoWE7GCPjaW8pmNRAImDPrq2ddQlnMpjUA?=
 =?us-ascii?Q?iLMKf2jiR/5ZexEJYHUpm/1Tjh6GnAvR7mo9KEFK23lrKkDrKRX5YNedd565?=
 =?us-ascii?Q?T+X17g9CxT/zxgbZUWLvH8q6QbM4K7ZHONWcqGms67fx0PF1T57yciXBqETe?=
 =?us-ascii?Q?b2f/qhgWhyxBpmsa0Hc8gJOmtQ4ssjl57rqdo42RlUvbdBdqXeT1ANGKk8ii?=
 =?us-ascii?Q?I1Na0SKyzTsIqHwLLgfvUGi/MGd6GjIdaIKhUCxIklzqIG8XWxN6XuIKE8cW?=
 =?us-ascii?Q?hmR7aJDbrpQ+laXRVCQyDGMMqoT2BCW2nZMoxHbM7oqYC2zm1Z77rZOjWIF0?=
 =?us-ascii?Q?WBD0FQAHpYrGeC9KwWxfi9RzsFUB1+CFCEXeTsTOXdn04kz4mnLyAt8/IPgQ?=
 =?us-ascii?Q?wOZlew92mmfRUQKIMin3Yr/2rmervf3ZfvLlkG+WRqVL3GUr9TrbG4LQjuZr?=
 =?us-ascii?Q?CIPTqf0SlHuLgGK7xBChbIdk3ehNTma9k5Jzzm2Nu213JfnOxN7bHeboKWrO?=
 =?us-ascii?Q?gzVR4fXmzS9k7eQJT/0dt8/lCrPwJPo7CKGVgMVuvo/KFg40yy56oBpJcx8J?=
 =?us-ascii?Q?/PocmTtFAsx0nIjXhJxjt3FvVtDrJqz9O+HFBmJznQfjrRc6klRI1ClbXWYs?=
 =?us-ascii?Q?kTQADihHdaXvr+TpJeia2Qy+bwLOikttziFFmMMUah9Wtes2qFdyH8pwHCau?=
 =?us-ascii?Q?EKj51m9HxY9VeCZBAoJkpnMu2hjr8iskeFGq32ZaGbBfklFWZrjOLyIhhnoM?=
 =?us-ascii?Q?eZp1k5yIoC1jszrT41BVPV0vSVPzt9ibaueB38aXamF1cDTo9MRkLnn9ygp4?=
 =?us-ascii?Q?9RMDGTCSA+ThDlrn+ybghv7yLGNHVHYAMWBoo6w9+hEsEiXvTMcLJut1AM6J?=
 =?us-ascii?Q?F1VrUMtZoyeJfZZJebGkzcl/4ISHprQNckvkK0ZA2DeGWvzDbR1f+gQQDqw4?=
 =?us-ascii?Q?d6JcyTwDXUCnAYJO2Lh34kN6tRPpDWSpJlwicIfdKODTvuESc4XA+TEhKnlM?=
X-MS-Exchange-AntiSpam-MessageData-1: Wi/f7sU5DTYRuw==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cc316201-70c1-4257-8df5-08de6b8ace31
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 05:35:04.4461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKCq5gI8KRyRz5XWNFdyFYSvTugZrzzzbO0MOGmWQP9K8K4yZjk4HC5iOFnNZuXykfQVHuFvaOR/q2vbfT5nUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1781
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,garyguo.net:email]
X-Rspamd-Queue-Id: 2E7C613B235
X-Rspamd-Action: no action

`dma_write!(dma, projection, value)` is the new syntax to be used.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 drivers/gpu/nova-core/gsp.rs      | 14 +++++++-------
 drivers/gpu/nova-core/gsp/boot.rs |  2 +-
 drivers/gpu/nova-core/gsp/cmdq.rs | 10 +++++++---
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 174feaca0a6b..25cd48514c77 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -143,14 +143,14 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
                     // _kgspInitLibosLoggingStructures (allocates memory for buffers)
                     // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] array)
                     dma_write!(
-                        libos[0] = LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0)
-                    )?;
+                        libos, [0]?, LibosMemoryRegionInitArgument::new("LOGINIT", &loginit.0)
+                    );
                     dma_write!(
-                        libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
-                    )?;
-                    dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
-                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
-                    dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
+                        libos, [1]?, LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
+                    );
+                    dma_write!(libos, [2]?, LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0));
+                    dma_write!(rmargs, [0]?.inner, fw::GspArgumentsCached::new(cmdq));
+                    dma_write!(libos, [3]?, LibosMemoryRegionInitArgument::new("RMARGS", rmargs));
                 },
             }))
         })
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index be427fe26a58..94833f7996e8 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -157,7 +157,7 @@ pub(crate) fn boot(
 
         let wpr_meta =
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
+        dma_write!(wpr_meta, [0]?, GspFwWprMeta::new(&gsp_fw, &fb_layout));
 
         self.cmdq
             .send_command(bar, commands::SetSystemInfo::new(pdev))?;
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 46819a82a51a..ae54708c38eb 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -201,9 +201,13 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
 
         let gsp_mem =
             CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
-        dma_write!(gsp_mem[0].ptes = PteArray::new(gsp_mem.dma_handle())?)?;
-        dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES))?;
-        dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
+        dma_write!(gsp_mem, [0]?.ptes, PteArray::new(gsp_mem.dma_handle())?);
+        dma_write!(
+            gsp_mem,
+            [0]?.cpuq.tx,
+            MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES)
+        );
+        dma_write!(gsp_mem, [0]?.cpuq.rx, MsgqRxHeader::new());
 
         Ok(Self(gsp_mem))
     }
-- 
2.51.2

