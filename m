Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MwVK2QnlmkvbgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:56:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F40159A29
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7769B10E5DB;
	Wed, 18 Feb 2026 20:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y2HgL4/y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013055.outbound.protection.outlook.com
 [40.107.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1A010E626;
 Wed, 18 Feb 2026 20:56:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0Uwbm0+rNQ3fOadgjb5a2cPOmNbqeF9G2qIFkCCnbMl9jkBybckNx+WPIPLsWIf3tnPpYCTZxDi9fCt3SpQgUb7R2Uzg/SUI1YxyTgjb5jx9OFyAuIPAnoMdfAop4Zl+RWG4UBNbi02dkB7Bl5HPdG3leIEf/sVkGoovgJSjbJEEnqKSfkfesCp2BKMDGf9G9UYkMG86aNEQLS3Ot0qslStL8X3oxGuBiaCv+mIYHrE7BhokthmtHw50jaMP8ZcwenmGhq7yunGKUqhsEvFDsi+riE6gTuFrLO/3mrDDPgT2S6pun6SbiDscG+QHvfObwstw7341tVPlt0cfwXIDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8Gf71f1+HF14bhLysIpw4Ntoz2jJyjAr3DBKm3rwow=;
 b=pki+VlHaoi0YZsE09GDTv3sYR7YWAveZbvp6/E0gXki6CUJoUw4ZHV4l886jFDARjX+f0IPK1JFzEgpqR4mG49lu6P9L8FvENOvdGFp3CItqsi/wp9iko9rA6z9ynIGkJ18k07oa5e4LczWMosVsoSnDQo7R1Cc0zesLnGMUu3ZYqh41QJ7arQU4PdO/5RkPTMODxxlvpQDIE+HJHft4gZVoWrwOPzWjmhPB5r/mj55TbtBDjAaRI3LSRzJ5n/Y4NdakmMinRHOcYUaKQpaJ8GD4a0Ae3GDkXIatZ7jLkfnidIQ3EFE3ieSVkhu5EYuVt+Uj6gl8KU5w4j80INSicQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8Gf71f1+HF14bhLysIpw4Ntoz2jJyjAr3DBKm3rwow=;
 b=Y2HgL4/yNnkh/LcGNpculNZGTh/YzBVOBUG3tKF3tirP2flbcQicLTKOXHATCKsS6ib34BJqph8yjPPBMs0WRFsNyn/n6Q8kLqVpVfK2Dkixk4fym9ewgua/Q2IfMGRc/w1QsHhc8aaAiKL6t4exJdhkKmggPuqndI23klEpjGje/3o8yqd98kIS1i/hYAnZ7Zjwt7ma+nS17LyQhMRIZFVCimS2Ym+6oHbI8dGPJ5UWxJqJ/Dzyu2OD4OSryZPTAH7gohzzIrjg8g9+5/xaZH/LVnLzWsBPIHJMzDSlx3/SU35DiQFNEsZnf5BQfXCb4e6ZBWaXhrf1mc6P5Ukegw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Wed, 18 Feb 2026 20:55:57 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 20:55:57 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v10 7/8] nova-core: mm: Select GPU_BUDDY for VRAM allocation
Date: Wed, 18 Feb 2026 15:55:05 -0500
Message-Id: <20260218205507.689429-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218205507.689429-1-joelagnelf@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR14CA0021.namprd14.prod.outlook.com
 (2603:10b6:208:23e::26) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 61469780-d231-4426-d4f0-08de6f301d17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8PNZMZLIh3o1OR4uyqYSAZMYO23wnUgphyZuq/nOXhndHReOXZVTn5bH0KYQ?=
 =?us-ascii?Q?iJrWnLAc4RsCBQrfzpzHrohNWK3W/XYLfOPOmkHHloMT5S7MC9HlxfuU4DWC?=
 =?us-ascii?Q?Huqji9Ir7rqvmgySdbx1Q35Px74m+dNMgQBxI2fwq3PpJWl/alwUA4OEXez7?=
 =?us-ascii?Q?OOzOSJNQgXs6HNrUoKPwLRRcD5233+O9rFXYmVn3QiEv0VVJ4p7Vm7ZIA4TK?=
 =?us-ascii?Q?3Xztu9heYGHB0+w94Ll53FzTDi8Ix9YF5YQVp4rdztEfD8PN3kBP8Ilr42oY?=
 =?us-ascii?Q?HsoDszEAYFnS04R/UwZ/SXisKyd0fRqgZTABkw6p3eEFANubvag11aFBxn67?=
 =?us-ascii?Q?K6vSd9esFua9d/w7uB1MLBoUZCCZCMQg2WwZ7QJZ1kUl2Iki6ZENbsaloDI9?=
 =?us-ascii?Q?Cjlgn7ZrDYIO0jxibl+wZs+CFVJIiSxyB+/8r5dKA3zJAnYr+WyLxtGEvYZy?=
 =?us-ascii?Q?dr3/zJWQ9Tn3FPbea8ljh5P7EoEKSKiaobRHZQQIE+O/X1fZTFU7SIgmAhmT?=
 =?us-ascii?Q?1UL0of7S8QjodYO7Ke99e3rLKbP7BKRwMcUu97bYN+zsjPEZRSZhBIkNYBJU?=
 =?us-ascii?Q?myEQ/6wzeu6H+uSNkzZyWKn506CkH8/ctM/2JHUd1KZQx2Yy4/XnIxaJNQjg?=
 =?us-ascii?Q?Rxe81nU1HguyE8fOyJKtQykGl9U/pnQZwLwzOUxny/bzkU/MJivYHbYp1A47?=
 =?us-ascii?Q?udkD2LAU9pc5I4l/5H6xVTEK/zvCoSzC9hX14fBtGObuP0DH7LfSAOX+6lAA?=
 =?us-ascii?Q?db7hs9qlbWD/+VHOmdHiea3GA7fdC9gB9mEwCB+hqQrwL610KD/U7REuJiQN?=
 =?us-ascii?Q?ra3JsZqN4UUlZvOHOuLH/9Dr3c2oX35oPkERW0jTKcNPWLiNrCQxEmgfGSyr?=
 =?us-ascii?Q?+mbMNDSQsTXCU+9Bd1xjXaHgdp4a8tYM3HmJriXs+vwan/oyKgCCCBz4H8jr?=
 =?us-ascii?Q?b9/6cQey/7HJZFNxV5Ur7KaOeLJmGG6Hv7cfZUuq8qjRt9Y+cUlwepX8lbJj?=
 =?us-ascii?Q?wzYD+qcGqvYA4mhFxiK5L7XRwhcL03PNngfBGe6Cz29pAK2hpV90A8YLJa6W?=
 =?us-ascii?Q?yeNvpsCdydW/kxOc9VI7BA6WF6/lV2BBFan44Sf1wvL8BBQqsWpcFXI+72S7?=
 =?us-ascii?Q?VXbCLHW+tUDPkyVr/Mp2Y1CaBe2ZQm+E9X1QZo7kYYzleizTvzUwho/P3iOf?=
 =?us-ascii?Q?eK+69wiSdq65NXqBHW+TUjGeQFATyH6mmfwboaH6MOo5EtKOLq3GbDfZQWzw?=
 =?us-ascii?Q?oSR0We+W64hairTTWD41SLFAkjy7DYwmqfEvSThM5+4wWFCu/YqCu63Kuq7t?=
 =?us-ascii?Q?WUx30FW04rvvKniC6Jaht7BXL5OKtScuwfKcuHMlfYEOC4d30wAKgnrORCYN?=
 =?us-ascii?Q?VRJXHrs9VC8c3T2+uIWL6nCM7ShyidrSewCTJHJnB45GktBXbxm/nsqlZe2h?=
 =?us-ascii?Q?dJXMEFqf6OjHH1DHpXQojuPbwCtfAc9BBjTcs8oMs+EcVb1pj9TaVsgmDGXq?=
 =?us-ascii?Q?2C9Iw1vwo9Btq1DXreVz1ZAB3ZPf4/KiSLzg5nxPrTURQdl+JDLS04eY60Eq?=
 =?us-ascii?Q?d3tF7zwNs4Sz0i+SJOM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5LPksoILg8bkOEAlbpslDwE5F9Zvg7DM+brx8G0N/byYn0zLYol3/1XE0d4l?=
 =?us-ascii?Q?fYlvCE7EVbtqASh/+as7APAivsek15yiup5PcVO7X/UGqDLplpVQhXy7zEkH?=
 =?us-ascii?Q?+W7DnIyc8N0Iv8RagMpRyHPoXabfWT/eej1uzCn25LG6Zdy7Z0+kNfjjz+Wq?=
 =?us-ascii?Q?nwXEOO3p4tMdaj1N/I5MF8KLLOSpMlqOmvWe5qt2cKnjMKxqjPaAs0xAu31K?=
 =?us-ascii?Q?t6oBnAwYArGNMEzWzeRxgvJEtm+eyAsqelq9k1qGlnGKfk92gk+6Q+Exbp2X?=
 =?us-ascii?Q?6lwZKynwAIkTsKAWBF9X/AQ5CE/NcIf6viNAqSQR8TXV58Qob/EfrXMWeNZx?=
 =?us-ascii?Q?j7a8PEKCg/i25aD15Icl+VTwBli7nN0cRQOH/91C4qDA2wR8q6wIEkkkZKJy?=
 =?us-ascii?Q?A2iGYh/ReC05gHX0Iohxkh+tZjl2vM2IZaZ0uUL7G87PcVjuPH6QtmHlmOux?=
 =?us-ascii?Q?YnEqCe6kWXzU7IHA5K4PpBuyk4pBDongw+WLsoMF/LbQYj3ckZQqs7FHprPF?=
 =?us-ascii?Q?CBCIG4mwbw1jvJvHapkNalNGKrFVQYAOgNcrt4ZwWTnYgEG83l8kR4SXYnx8?=
 =?us-ascii?Q?8Lg5PANQQ25nBTvtpAFLtsWK6Pgg/exacJIM5PWFSRdBqAyUfv3u+8rh5PQU?=
 =?us-ascii?Q?zmmisEas/nCmD6KG+0DLGMynqjtfU5WHTbtMSFydmjVOB7VDTo4fHBxAyOds?=
 =?us-ascii?Q?Cru9XZlTxOCtBfLGl08Q4oTNSOIlmgsiIoQTTRbNFNo1HCrNYv9JGmJRsOZC?=
 =?us-ascii?Q?bUgfBXseNZCQetYEwhArqV9IeR8saGnWimek8mqC7IGFedZtgnJhjnxURit/?=
 =?us-ascii?Q?sQbHG00U7w14tysYxJOhkOclETsWtbaZW25N7j9YFA70uzf5JoJ1BOrt2jmL?=
 =?us-ascii?Q?1smJ4FdVB42Tl3tI3a4NZ+e4yeeh6lMtHEeiPnnKQG/Qcb0fLxzqM+JwAYi8?=
 =?us-ascii?Q?FhwlUtSenDKdzqJeFWiLmuP1h6dLAiCw2jvs0ssDFO6Kz5cKNbSKeHoog+L2?=
 =?us-ascii?Q?mVYtAJlC6ckkxpLD73Kj3mhtwb3IwPI/+Gqsa3OcxzLNGwZwUGJHRKw2M/NE?=
 =?us-ascii?Q?CpMmahHHfSNMunu3I/USznpz0sfQa2vGb0sEV0KU6Kw6ku+H1HMw06WX1nPc?=
 =?us-ascii?Q?6jPmZncZxzyAkC0pc18318l/pIoGcK2t2AV/hg02MfC/DXb+2DseD4teuBam?=
 =?us-ascii?Q?uDSVd7Vb2nf3gq50azMjJ+9jPwRJEPSRcpuBsQkABnKu6sO3cqtqdZLVIq5t?=
 =?us-ascii?Q?rNQHz5LJLhyV80mBRuxoJusc77Fasziu8mg7nLv0tsEoismD7IzxrbCt3VqU?=
 =?us-ascii?Q?BHQMRnmWc/z37HW3I1luvXwoNf99ovDXJx4nUzSw0M3MfzHdM864H806iobH?=
 =?us-ascii?Q?t8wbdj/P7KvHb9kLxV6OH369S/8ntbH63jsGRp3nc4iscbo3dpezzTzJ5Qvb?=
 =?us-ascii?Q?6QlNIOqN2j4xJdOko2NuHriYoJEQ2ELrhOuEevV2spwCDvRJ0tt+1/iIJvcZ?=
 =?us-ascii?Q?7vk+Ud1StOQgQJ7ZXCpxKcPLxk4ustjY3rtLmy6CP/ZAzC+hXHQWj+na0Vnz?=
 =?us-ascii?Q?ybC3uijz8CP3cAS7WwBB9lTuN8m2XCI6I4oLEDqq1oJWOaH0AqYzreu8tS9n?=
 =?us-ascii?Q?0dlZx870MR649/qGwMqE7kRV0DKV+/qs1iEeoL2l72kX/HI7TVxAXc+FycLn?=
 =?us-ascii?Q?3KMxeV0WSBUfT6+Gcx60FGGislWb5/iou5mcIitcLnKXswhEeSkX5Yk5J3y3?=
 =?us-ascii?Q?rdPyhPPo4A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61469780-d231-4426-d4f0-08de6f301d17
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 20:55:57.1728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dm2nXX9t5SrwIfN8++SUGe8ow3LIvXCauw6OFha79dx1GeRgzyNpQwibM0RD9za1lwKE0EHD7KmcEZicP3+fcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 56F40159A29
X-Rspamd-Action: no action

nova-core will use the GPU buddy allocator for physical VRAM management.
Enable it in Kconfig.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 527920f9c4d3..809485167aff 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -5,6 +5,7 @@ config NOVA_CORE
 	depends on RUST
 	select RUST_FW_LOADER_ABSTRACTIONS
 	select AUXILIARY_BUS
+	select GPU_BUDDY
 	default n
 	help
 	  Choose this if you want to build the Nova Core driver for Nvidia
-- 
2.34.1

