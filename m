Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOHBKdG4j2kYTAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 00:50:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A7713A0C1
	for <lists+dri-devel@lfdr.de>; Sat, 14 Feb 2026 00:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2520110E05F;
	Fri, 13 Feb 2026 23:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="HBtPDhwR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022135.outbound.protection.outlook.com [52.101.101.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5917310E05F;
 Fri, 13 Feb 2026 23:50:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSjBCq1fdDBxHcSchwxUhPB7lF3ela3+BMMvJIdUnBpkPxmv8/J0fec+n8Vl7HToSH+M386Dh3l7JxAj647NuMd4kJCg5gByElS0NR/W4T884mV9qATpIuzoXtViYfLk0DuP/b8Vq66rekkBa/vlPi/drWx7zTuqWMi5Iv+nBM5bcHG/GLr/zQsbV1E/SRRyhumeJTbevG9JQ26nHLg88xj2Ynl9x2LSr7a7Dg9GZSCqAn4Phyba5yjKthQH8V1isRrbBhKrtf6h96D/60EsoH8T/tty0peSIfSf7aWGTWPmKkNu476hqzWu59K1zh8gWD/NOz6bOLttDtSYJ9h9Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fO6WXtMujxIt0UQt9JWa/L0uvI4Fx9S2/kK7jEGQYGE=;
 b=IDEZiD7SQvi67I4ghmpCsIdYFI7bpSyXLsq10pYb6L8iOItP9NT75J70g1W9Uwku9xlW2VSky5FQDD0q50Un6iNSDY3dihWuvdbHdmCY1J4wJna2CmtaUPX7R7Kc18ZZliDQPRTts/mZkxEAKwhm9Dq1zDH8XhPAekMBm+upT5QbHnyYCxwSyWqmSOanMll+QGB1GEfgZ/LPmpE9nygGDboJT+wDCspUhfCKfM5b5WMJzug9ZQpr8Q+qHcbMaFW4lXTUhAbpfdFrJPrZNwWc6KaN943TqyT5ue5+/E3tiP1yNcChZqfs1IJEOPhCV0Tf78Ms9kafY1T2MgMxHy5DqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fO6WXtMujxIt0UQt9JWa/L0uvI4Fx9S2/kK7jEGQYGE=;
 b=HBtPDhwRpdTHB903zg6zaxp/NHZPnW1N8/tlINq502UHEDRi/ofJ1MPhOmzfIZdK5KEmFdilNyhH8IGWQgDH9RBDLhTrtsGYl/L43cjk94/ePGZqzLB1K45zTlIau5GyDE9X5sD2nwRVYnBGmC2o804zIcoHWWE0qF7wRF9l3xY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2132.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:71::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 23:50:34 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 23:50:34 +0000
Date: Fri, 13 Feb 2026 23:50:34 +0000
From: gary@garyguo.net
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tim Kovalenko via B4 Relay <devnull+tim.kovalenko.proton.me@kernel.org>,
 tim.kovalenko@proton.me, Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl
 <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] gpu: nova-core: fix stack overflow in GSP memory
 allocation
In-Reply-To: <DGE5NO2W48YJ.34YKFNI6VS63A@kernel.org>
References: <20260213-drm-rust-next-v2-1-aa094f78721a@proton.me>
 <DGE5NO2W48YJ.34YKFNI6VS63A@kernel.org>
Message-ID: <e6df0b7ebd86d0c84ffd4b15cee15716@garyguo.net>
X-Sender: gary@garyguo.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0265.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2132:EE_
X-MS-Office365-Filtering-Correlation-Id: 3386d5b2-0eea-48e3-29f9-08de6b5aae17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GNoKCMfvzIDi+9RFQAbrDuSGfBiI2Lk1cx5UzUwDOvlNWRSqcIuY5UB9J9J6?=
 =?us-ascii?Q?hdKxRr/6EZxaAwW1S2+xm3c0VEnJVmbGab2qDSkPw62LzjO/EMQhPZ1wTFcl?=
 =?us-ascii?Q?A4f+d1WKqCEOQ2Ijr6GeBDL+32e13tGz4MmyJ8Is3hibEDpqAwk7EYOAjlxL?=
 =?us-ascii?Q?ozAMP09U5yemGPtbxdv9+xBsPFcvEmk5x7IITUaqcxG8A50UEEeHNjIHdsJL?=
 =?us-ascii?Q?ZQVMjLCz9NAk0pazsbxTt8ArxCpZ1VBSz+W6eSLjTYUCB9Q07yF8YepHHs55?=
 =?us-ascii?Q?A2t3Hw5qOWc1JTo6ZRAIrvfUGZjRNqHBF2Pqr6dSmjTcNMMM1tBeRSKgrJJe?=
 =?us-ascii?Q?Xz+eLkmN4bDCJGJoXu18BBhfywlWMmCMJ0jxAtKZWWDAJN0we0DtO2mhPi6r?=
 =?us-ascii?Q?oYtLps85KJAtdC2hqa7utA3zoiQ1dY0+F06yLsj0Gst8DlTWYPExN+PGUsVM?=
 =?us-ascii?Q?HJpm44tUtoyqCpqsUiP376yk1+J4bE2MFYcxMG8nvWlLlEL+rUftLqXMVBbu?=
 =?us-ascii?Q?hwsG2tcAJSg+l0NsxwfpqGUUNKOELBMAUeDJh9rIdmCIucSnFL86cFIJQFrd?=
 =?us-ascii?Q?BGbuD9kP70uCI7EuDEP8rjz7XAlkw06cIV3PVYHJzfUbRoOY0oFC8bpFW/09?=
 =?us-ascii?Q?W+F8r8o5/5kWTD2MHIWOu/AufVf3K9KbBBF3vBLRz7WjjX7UKQKTZhIZj9gf?=
 =?us-ascii?Q?Fm+nqEqrZnVk85bmyOLC6DbLNbmMSKOTsglGdihcNB3kKu4c8cjtl7I5T5o6?=
 =?us-ascii?Q?nbMnCSEPQopf1KBVS1ctceWm5r2MIBrdbOCZTse96PznjozYPYOpV20v8wj5?=
 =?us-ascii?Q?CtCTbzrvO2yzX564gTNtFYwBtCdExyJ53dUHXO+fFWFfEckjlbyD2w3XrWZP?=
 =?us-ascii?Q?HjwL2K+Ma8o40TAR61ST2ZRP/Gy9H+aLxxIcLDSU36Fjaw6U2oLPJ6CvEeZ1?=
 =?us-ascii?Q?s4uKkefdACgXp2KqumcP1o0YOv7ytyW4m9hBi7EiZA3weoncsjLh98b2zGDc?=
 =?us-ascii?Q?U6akVUDHGvHvCHgptfP8cl1asDyoXUvkbuRJskAxwCvqGL2fMEYzX7R8DiA4?=
 =?us-ascii?Q?CTcI0sGXViZv7CCPbeTeFuc+dhUOuerP0UdPR/uiP+s2+UIqNcLUOi+zmSwY?=
 =?us-ascii?Q?LFZrKeiAiYk1hNUlLxohJvMPbE4xkE4nZcJDVH1DKSRUPltwBDvELFT8DjeI?=
 =?us-ascii?Q?kV4ON+yd4qMMTwqUVVQQbTP2tkeTXzZan14kwA81wYkncFXG9IPy1ifJGbJk?=
 =?us-ascii?Q?8IOp/1PRtNY4Kh0+kzwWALxu+IMkJO/KpM3n5+8meTK7ukW5AQYqg2hNYSA8?=
 =?us-ascii?Q?DNOa4qXEc6u5zHfK2uLvtq1OsHOrbBFQRRerjPAaAjO07fsyk12hJ1FDtsyW?=
 =?us-ascii?Q?PZxSbWWd9mTqgEeaAXgkSXPpIOi8RQOnDN77Gi2eDocGa8fNc3yODsRD9pYh?=
 =?us-ascii?Q?BkRW2MXrfuGGacmYxo51+JLzUbCOPnTasyFne5sUqTqACPlFnk8JqN4BkLVK?=
 =?us-ascii?Q?QuObHG5Ew/ZJIpQCeF9R1Ji9RKd+ks0Rp8od+VHynuRcYWzsVFPh11YZRtYK?=
 =?us-ascii?Q?Yh8QdWWVYx0eCQFuBTA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IAg7Z0RgGTM5IVLzB7UbRLSpPJg55WSQ+xaM1G1k0brGX0eB3mP1WQdixvnl?=
 =?us-ascii?Q?nODg5SgerLb+2asFnM+JYOnlaNDUGQDvFbwGuC7DZrBvooyvkJeOjSJ8z2sd?=
 =?us-ascii?Q?mXgtmyblhuGTH87aMNzDSwEIluv5klYieo975MWnRBTYVfygdFnn5IRjGCuL?=
 =?us-ascii?Q?lH5cH2fmxsUpxb/Eg0put1/yRph4WILi3AMWcJsEKV2hgPOGGtuWsEvIXryS?=
 =?us-ascii?Q?FPIMQyMCwIuh+KFNK9//c23p8d5jqZbEo+WsJRiCs4JrBMw+hWZbRBTboYtu?=
 =?us-ascii?Q?t1/esEnFD+vo1c1wygF3dAfg+/9qgwQbzNJfwIpFgBuKqcEbFVouDL7R4ERo?=
 =?us-ascii?Q?KBtPcjdTNGxMVnE5rNAOQR7CjVjqu0IIh7k6/jT11LP9i2MrRlRVUD83NXCQ?=
 =?us-ascii?Q?QR+/7CXHDx3lV8Z+Oc5k6zUoQ0U/FMS358hWQj1wBsjy9urPYb00s23TBRJ5?=
 =?us-ascii?Q?896N9vP9VQRDAyusAKWmXvaPIr5nuR4Q+yihTnlwqkkxSnHvb3WEdRFy4dOn?=
 =?us-ascii?Q?jLnxCPLshOh+fdrxTu3yQab7mTx6E8wSpKksHJcWK+2dK2KzJWedR9E1Gy+k?=
 =?us-ascii?Q?vtBtX9Mv3CSWZqHlQ9O/065Xpgm41QJH9fD/IVHIdhPvvueGeZBnIm+7S+PP?=
 =?us-ascii?Q?+lLNILNxK6e1ljLqFEMBVEktrAg7lN0COhTTheMasPoXZq5czYZMr0Yx0Dcl?=
 =?us-ascii?Q?aEhDmzruvAb/y+2Rvgg+mZr6a6TjAl1U8cRq+cgL/r3pvcFJ0sP4TDSL85v4?=
 =?us-ascii?Q?IuyVpdlQdKAYqBn0XdoMGlfLLqorjbpsEi7BRn/iuoWOm7PKX/9WGDOv3p9+?=
 =?us-ascii?Q?9stpfhPPanlwjyNhgXhqvhf2W/6AIEVmZoU1MZDTW0IErnhjaQP7GAWhfjmS?=
 =?us-ascii?Q?901i8pJ7l8EFDREACkq2Xo9n4lseQmJr1Y/wNxQWcLmyFIV8qmRp6MwCvmA0?=
 =?us-ascii?Q?D8IA5sC8fgB2Fsm6PnfgrbTV3u/TBHYPVlCUlymIrm2MyDzTX2Wey4579FU6?=
 =?us-ascii?Q?mlt4eQTUpH0v/pqwWAkGHrf2GSpggUX3dsqhFh+gB1m9xGImLL+gn/MCbxZG?=
 =?us-ascii?Q?Hc861MFMM9aWuupPOH7FxTGPzc2ZS3MO7vqsGBC0PhZolCw02PBYezduojdC?=
 =?us-ascii?Q?501tzKt2cXwjMnXQyUm65XUeQYCxdoYGGVWp2SYqnQ0zHae2yCHuJMrzjtnw?=
 =?us-ascii?Q?z/Pvnoce58OZIH/Wyg1GRLwmcSUI4DkQEvbxJGbgul9wSSLhqDtno9CiQOxu?=
 =?us-ascii?Q?ranRBnhmlOXfTPMnsU6MnDDgYqPZuKvxh3NewcQha2sQuZdDENPEZMu82+uE?=
 =?us-ascii?Q?XgYv8eVINN/WEU+3jhbgtuIn4AatgbftWboIgtB0aNvBvlK6m4yGJKY0m0vA?=
 =?us-ascii?Q?Yhe6F3tlpdOIOpmpQJgW27P7i+rwvNpVparEy1ThYodVVHei+MoqttBISH0W?=
 =?us-ascii?Q?RSTn9iJYAGUo56xqh/Jfd7GRbQgAonRRj1RokV1iVTWAVj8OYb5+cjoxRfWC?=
 =?us-ascii?Q?QBx9G7Sc70s6BczAEaBrlgy6+iUp2Z4Y8RrO5izQGxEb0WsKrg4/GNDBoZ5l?=
 =?us-ascii?Q?jxI1UeHC4DD5JhNEXwgMUrQiN5TK6X5tkmpEWFJ2Klt5S+83PtKpynmQvOKr?=
 =?us-ascii?Q?TvVGfqdO83gCdBg6znAoE9sx9u0h+PMZX5ZQs6g3yhe3IWUOEGvlE3MMVKvT?=
 =?us-ascii?Q?N5SNQZ5VSOVGUL4ab0oqHsFul/uMl0U1be+VuhWwn5tgzcuBGJnet/Az2X7P?=
 =?us-ascii?Q?wOuKu5XG2w=3D=3D?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3386d5b2-0eea-48e3-29f9-08de6b5aae17
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 23:50:34.5873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6AenuThuI/15QWJ5v2j4shunoySs6OaMfNSYSWNQvV1NhCxR3Jq/chDIM5kiw56bmtWzM8v0e2qqSrHV2mlTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2132
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,tim.kovalenko.proton.me];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,proton.me,nvidia.com,google.com,gmail.com,ffwll.ch,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:mid,garyguo.net:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 06A7713A0C1
X-Rspamd-Action: no action

(Sorry Danilo, resending as I didn't hit "Reply All". I was travelling 
and not on my usual email setup).

On 2026-02-13 21:34, Danilo Krummrich wrote:
> On Fri Feb 13, 2026 at 8:40 PM CET, Tim Kovalenko via B4 Relay wrote:
>> @@ -159,7 +158,7 @@ struct Msgq {
>>  #[repr(C)]
>>  struct GspMem {
>>      /// Self-mapping page table entries.
>> -    ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
>> +    ptes: [u64; GSP_PAGE_SIZE / size_of::<u64>()],
>>      /// CPU queue: the driver writes commands here, and the GSP reads 
>> them. It also contains the
>>      /// write and read pointers that the CPU updates.
>>      ///
>> @@ -201,7 +200,29 @@ fn new(dev: &device::Device<device::Bound>) -> 
>> Result<Self> {
>> 
>>          let gsp_mem =
>>              CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, 
>> GFP_KERNEL | __GFP_ZERO)?;
>> -        dma_write!(gsp_mem[0].ptes = 
>> PteArray::new(gsp_mem.dma_handle())?)?;
>> +        const NUM_PAGES: usize = GSP_PAGE_SIZE / size_of::<u64>();
>> +
>> +        // One by one GSP Page write to the memory to avoid stack 
>> overflow when allocating
>> +        // the whole array at once.
>> +        let item = gsp_mem.item_from_index(0)?;
>> +        for i in 0..NUM_PAGES {
>> +            let pte_value = gsp_mem
>> +                .dma_handle()
>> +                .checked_add(num::usize_as_u64(i) << GSP_PAGE_SHIFT)
>> +                .ok_or(EOVERFLOW)?;
>> +
>> +            // SAFETY: `item_from_index` ensures that `item` is 
>> always a valid pointer and can be
>> +            // dereferenced. The compiler also further validates the 
>> expression on whether `field`
>> +            // is a member of `item` when expanded by the macro.
>> +            //
>> +            // Further, this is dma_write! macro expanded and 
>> modified to allow for individual
>> +            // page write.
>> +            unsafe {
> 
> Both of the statements below are unsafe and should be within an 
> individual
> unsafe block with their corresponding justification.
> 
>> +                let ptr_field = 
>> core::ptr::addr_of_mut!((*item).ptes[i]);
> 
> This should use &raw mut instead.
> 
>> +                gsp_mem.field_write(ptr_field, pte_value);
> 
> Formally, we won't be able to justify the safety requirement of this 
> method. :)
> 
> The good thing is, we don't have to:
> 
> I understand it seems like the problem here is that dma_read!() does 
> not support
> index projections. Well, it actually is a problem, which I think will 
> be
> resolved by Gary's work. However, I think the real problem here is a 
> different
> one:

Yes, this will be fixed. In fact, I've already got a working version. If 
you prefer,
I can send out a version with just improved projections without all the 
generic I/O
improvement stuff.

> 
> This code does not need volatile writes in the first place. We just 
> allocated
> the DMA memory and haven't published the corresponding address to the 
> device
> yet.
> 
> So, for such initialization code we shouldn't have to use dma_write!() 
> /
> dma_read!() in the first place.
> 
> I think the proper solution for this is to provide an API that allows 
> for
> initialization with a "normal" reference / slice.
> 
> For instance, we could provide a `alloc_coherent_init()` function that 
> takes a
> closure which has `&mut [T]` argument, such that the closure can do the
> initialization before dma::CoherentAllocation::alloc_coherent() even 
> returns.

I've already suggested that in
ttps://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nova/topic/.60Cmdq.3A.3Anew.60.20uses.20excessive.20stack.20size/near/570456463.
The issue is that however the PTE array needs the actual DMA address to 
initialize,
which Alex and I feel that we shouldn't provide to the initializer when
`dma::CoherentAllocation` is not yet constructed.

Best,
Gary

> 
> Another option would be a new type, e.g. dma::InitCoherentAllocation 
> which has
> safe as_slice() and as_slice_mut() methods, but does *not* provide a 
> method to
> get the DMA address. Subsequently, it can be converted to a "real"
> dma::CoherentAllocation.
> 
> With this, I would also keep the PteArray type and change 
> PteArray::new() to
> PteArray::init() taking a &mut self.
> 
> This way the PteArray init logic remains nicely structured and 
> isolated.
> 
> Thanks,
> Danilo
> 
>> +            }
>> +        }
>> +
>>          dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, 
>> RX_HDR_OFF, MSGQ_NUM_PAGES))?;
>>          dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
