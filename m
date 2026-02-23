Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAP/CwrKm2kJ7AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768331718B0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C1610E202;
	Mon, 23 Feb 2026 03:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KgvH2CMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012047.outbound.protection.outlook.com [52.101.43.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26BE10E202
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 03:31:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IqjpkTf6ab0FZLiD4SpWvR/ahwS7+UUVk5FTvJ4e3Q5cZsfu8/fQk8QJsUQA7G9C5Mdg3RmmEzrPGwf/L5zJSWKQBMhKZDUDGVbjiEL+eareQVUbSN5raVTfsFjCeqD/sK2XxeLGN3qrtlfXKgq/kvCkBj34mIpEL+qCqPRK5CeHiy4lNe7iLv4VgzEandJCF3CWmcohulf+pGoGypT6m0u2INCtS6Av9Zdux+crYYopPYfFJlloFXakYmRpw/XbXecrBzDSpDFcQhzNzFA+Y0zkUx7ALSTPztF+UqlWTBZVLNuQV70NtWByDISp+jFrAUqogMwJhP2yjYCsxAdXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5/ekvOAqgmaMnRuTG0RPx+A+Yl3YCuZYrH+ulcka9Q=;
 b=mCmeJaKUqr6T4mmLAMuG/Dx5DJ0QrDhuoTyeP3ubh4tD/NfYDe74PcYhhvjbtQ6rGAKyWMZPGuTnGmQrGv9pG/IkrNFGiVglGx8IuUeNnl2guZGazm1AvOuFvaufd62m2IM3mUQtOMiRxDV7frR0xOBnZ70y7KP+ZdwTacdTDCQ2ocm3LvDHyidzrmgvglt6h9f1rA7NYfy5H1wJ4fjgXeYz4tDQ25+pPlg6o2pOa2klCKKcV7sYtBafuiQI15F+HYzLwlYiE2BWjY4ntnAxsl5J+s3anit7MGnwVdDSxCiaP2FuSa0jTJOdPpY2lEB8v+why8HKx4xonTPuC7lYyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5/ekvOAqgmaMnRuTG0RPx+A+Yl3YCuZYrH+ulcka9Q=;
 b=KgvH2CMGL25xabPWjxTpSIA/R2Zl+IW693ZIc6H9+OPQM7SSPMVJ8SYyJ8Iaa82Q0fqnrMqHmJHWysb7kPtGVSBvX5b8CXehfKpKwP2wF7TgAMw3+J6na4jiieDOHyw0o9aevkBrMYBLDmaVxLLo9QOsi7MiByXF2Iq2/Dop+J7aqv8YkqdN1mr+AGnWpoZ9XMcr5+2VaQgi3bFB5YVEueGaBb7p5w0m4B7r0Sxr85Pk6SZP+4/l0aiACU3nslkTzmKhJbHtGBqH0QlnqNJSEWVKCBOHsoktw0kD9W0bDXOEOyJjA9n5pxxlBkV2hCFmJuXbUM8R+uI54T3UNWH9dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 LV3PR12MB9168.namprd12.prod.outlook.com (2603:10b6:408:19a::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Mon, 23 Feb 2026 03:31:09 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:31:09 +0000
From: Zi Yan <ziy@nvidia.com>
To: linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 Gao Xiang <xiang@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>, Hongbo Li <lihongbo22@huawei.com>,
 Chunhai Guo <guochunhai@vivo.com>
Subject: [PATCH v1 09/11] erofs: zero page->private when freeing pages
Date: Sun, 22 Feb 2026 22:26:39 -0500
Message-ID: <20260223032641.1859381-10-ziy@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223032641.1859381-1-ziy@nvidia.com>
References: <20260223032641.1859381-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::14) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|LV3PR12MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: 6618aa96-3655-407a-7a76-08de728bfc15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UeZ//bIwP4vgn6+c2L5zS099+Glt414NHeRFwiFOGA83CqAsag4tqFqOoZG2?=
 =?us-ascii?Q?08EFL+urEF0Yr5nVIbaYLdVGmWcRXLblph2vtTrXpW/B2di6qlNZ393Z5Vax?=
 =?us-ascii?Q?0MUiWJFswMHcxxAuBY0kmEnkguHO4GobCCYhuhe7wMPVUJc/HI4PaAH4fu6e?=
 =?us-ascii?Q?P0jBdGNxOVZCJ0uHNIC4f0ByQPcOG0Wf5XkGcokcYC5NBVAj55cUvDHzJ9Ve?=
 =?us-ascii?Q?DvSuRI+xWDlFpZaoKvH84EyLeAyeshRDKHFMf+G8aJcWvfCOu0SjEWXRsBI/?=
 =?us-ascii?Q?PBt1dgzlAgtkrbuLGVH2RfhYuri/b6Q5dpONbbRL2SumztmSytrFmBMU2dJB?=
 =?us-ascii?Q?DQr5jCWWyFnNdqMtgzuQ0ywhqkWIeiztJ6suhy3nprFBvAB9qVyHYKbywENO?=
 =?us-ascii?Q?vsKrS38SLWZFQLAT0htuYZOZ+Xado87R5AujW9hOyg+WDQEctfX6I41QeFpo?=
 =?us-ascii?Q?qoyVR81Gheg/hcFsNH69t9l9KJL7hlaC3Qrizth2I38IlWsbdGBd/oZLGibW?=
 =?us-ascii?Q?P2dPwHUDgN3kOkB7zx45jEBkFWYpi2kS+s/iEZHwTlmcJ1FDS819boc4tPun?=
 =?us-ascii?Q?YndmaSIJGyow2uwr4pPqQSvQA26yg+FodpUp35QNZ1YEfRhmBFLLbd//ocwd?=
 =?us-ascii?Q?Z+a1oosWWL8A9OVKefkKAZjRLZ/Di5IdFJtVt10Btdcfcm+4Ki2HkvbhPCYI?=
 =?us-ascii?Q?QzX2InMoBxQUQin0S/o3VfK/O3XE/aKfVPrwuOzteDlBze1+3gq5xQc4+uUy?=
 =?us-ascii?Q?cCLIfBAD/AP4niAQaErK9n8Edpp01EChRoTLQINmU/FA2vbR7hbwqVrNwcs/?=
 =?us-ascii?Q?EV5WpeeNPC2JcXk8kL8kIvVFgX33WrzSXoEiwn2qoGrLqYxp9PGXAgSbXAuu?=
 =?us-ascii?Q?KiIMZDv/Ta5y3Gbyh1F6xpzFjqxfSlj2/4aa8KsFSGcKIpD/DV1sf0ygy4EF?=
 =?us-ascii?Q?w0EsC6559YA9bVf2FOVDHxN1C1R22t/JTgCQvJEiuak6EZ1oxpDfwTlu/ajp?=
 =?us-ascii?Q?kbDEtaJgL5qAzBsIe/gehauaxXN8AXaz5BAN35YEy5shCA4jX4EJXpc/6HZk?=
 =?us-ascii?Q?cx72VDlnnFZMtimqtZF+/NWlMRMfuJqQ6xfc9SVxm7oXT/xqk6C0O/RvBV4r?=
 =?us-ascii?Q?cIf4MrQ+1rx3wdw9hdT6EKJV9BeczE9fzSpDFgxj1v93ZFqlXOw4UdImE8kw?=
 =?us-ascii?Q?ItA+ai0V2STgBKaunikOZwRou44nJrgxmlJaTrGkpor2Ra8vRbVLsaMyrxru?=
 =?us-ascii?Q?E4XnkDUIJ//8iXlj23SbDVKrge7Nnhnfq+VZVSGiGT6+ZMYY86LP4NPV184l?=
 =?us-ascii?Q?S7vAShb3/MAkOX3NmplH5oVbgnlGCNgVA/SdsN10MXxHytJlYgiM/i32FFv0?=
 =?us-ascii?Q?Gl1zgrMFN9TIBnrL49dZumT81hjL5bCH9sS2bqL+yT74hjWNez67xKvTudI7?=
 =?us-ascii?Q?B9WM4GVOComUEQRM6MDWQ3BaDxj3ihokR2akIymBSUH/hJieb9HWMERgfE/G?=
 =?us-ascii?Q?clihFWuTzgUMggbAmDOSKt26Ow+8bie3bnGOehNkR+Vk1zi/+prhDh1BiqlR?=
 =?us-ascii?Q?QCaDR8fK/QGd1o0gvlM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G5Jgwh7rR/Z+8BU1F6OYtEPzEZqysVibEAFktK8Jg6Lmye8+unScfJRwUrG5?=
 =?us-ascii?Q?cQfAngKN9NevymgDtnvv721DSHPAyvxIsVc8m/TmnXfxIpE28he43Nq0ZWDl?=
 =?us-ascii?Q?Y1kJCC8cJkidXul2Lc+6ZNAcfXoIbc+HYQQbf9/Z87cEtxvyOZVlxNUZLRpA?=
 =?us-ascii?Q?5tPLFarzW/DEybD9Ay8iB8YJGn5BQW++QOgWhL1AxWUji0YiOb/cVA36Bq74?=
 =?us-ascii?Q?oVn6EyUCuqkHFUqNSdS0elxeZJ8cSkHkf8BCS0pT7Izik9A51j5X0r0kVQxr?=
 =?us-ascii?Q?Wth/ETowiZoogSBnXnrzqU9FCT3gwj05ZtR/HzVfBRUEFvfw1AemUS78VtrP?=
 =?us-ascii?Q?FZETyjSmHonH5fKhjHb4arFPAgjzhCdRR/hMapK6fjxLBGiGV0DFJMWxQsEe?=
 =?us-ascii?Q?sD4hUwoT3CelC6vdHp6/FKZKvzTg3XjMO9952p2qVdxpOUF/xZWtU8VwNKkN?=
 =?us-ascii?Q?J1HcVMpvQkYuYkexpoEAMzgGlgYsCjJOhVr40LRy+Omlq9cZBGO3G5rYXgfo?=
 =?us-ascii?Q?/BO7TlSkQSJc91v7S7LXTpXEzUshlPTgOxAGPghCaKkAH0sWEsXpWGCu6GMY?=
 =?us-ascii?Q?Hei3D6INmcKkddxABMXqIF80rgflHc0TWCb8xUao9QO+XtM/t9GGWvJmyH28?=
 =?us-ascii?Q?tmRbVmbEnh8t/nsrkqFcbMYSkYB3tZkacSC79VxSIZXI/TsieCXMH35EDGbv?=
 =?us-ascii?Q?5Ja92Ct1ugbIb2seg9eJKKa5I/qP97/N0TrBQnI1ZMZG8XM0dxomuApgP1Rs?=
 =?us-ascii?Q?GvzgxKEdohhX7a1+WQ6zx/8BwsO9hWt+dPAqpJ/N9EDroNtz/R450tdImHsA?=
 =?us-ascii?Q?y51HmN1AUJNAIkAC4tmI9F46es7labV1FuFzQGhMykKRiBALbe/fyiNp04Uk?=
 =?us-ascii?Q?lNRH2UphWl7zSKVf8SwaIQ5ShZzeWZ309h6uz+uIBGQk0/WYFEY2kw38y/5o?=
 =?us-ascii?Q?zltyzu+TNMJoQARy/03+W+06AiGhqwJV/JmQGbVuY2JbLRhEGS/xw7b/mrcy?=
 =?us-ascii?Q?+yA8zXj2qWVxHVCOKDNkygDmrgxqADL6t8l8D5mXmLhJ1GOB8Y4RHwheGFMO?=
 =?us-ascii?Q?uZ/hqC9PHCPSIF1cr1vzWdta4I34lamVP/Ljv120hnNadAgA+6/yfGZAf5Vg?=
 =?us-ascii?Q?HivSw8hneLm6CarN2jW5tt9MzH1q27CDCbqLWmpROPusCe6a7Z/z/FinFFBR?=
 =?us-ascii?Q?XmndXA7pVapsP8YcOHtjnCBRQOuXyfPoK5MpB6vhIGdOh10yZqBhnSSGecdI?=
 =?us-ascii?Q?xp10TcYF7unHqtWvwcC9KkUY3jHC0Pj0o7ynS/TGPP+k0j6fC7Y4dfr44zUO?=
 =?us-ascii?Q?4oDZvgxLzntUcic983A69NNmrr7G/biSE3t4B92EZ5yPhAibEdkWONMY43LK?=
 =?us-ascii?Q?cn/U2ffFp7eW2u/8CnkhOWudiyrOobs/M4koyJUCGOgMl4OtNTAZgDttYY2O?=
 =?us-ascii?Q?R7A/KJtXzSx69pF5yDURrM76m0c36bMAIe4OQ+9Vvs5hR6o4bNgQDk99wPI8?=
 =?us-ascii?Q?GoyjwZ3uw3Im5konEJ+SawIscdHuGYrDfqJcNqxZUNmBAOmcnKIX6vVorUK8?=
 =?us-ascii?Q?gAwQFu9QRhOkWxVvTcP1cNk/Xzf8YrDpZLCGguSILtWY5cSC1H9/2Ztz10Xn?=
 =?us-ascii?Q?dovRsLQ2pKY8/tCEI+rXyGcJXRw9EJbSJZIhRx06/jJX1fboqA/+JXnPteME?=
 =?us-ascii?Q?oz+A/9sGdeTKu8YtetHumtrydJrxXJsrCpfrXDD6C6bN844k?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6618aa96-3655-407a-7a76-08de728bfc15
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:31:08.9493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzjaWyzRdTgkhS8OqmcB+pb5WGMmidqhWwfv7UM8Aj0nqo/9yDtNibcNKB5zGuby
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9168
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:linux-erofs@lists.ozlabs.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ziy@nvidia.com,m:xiang@kernel.org,m:zbestahu@gmail.com,m:jefflexu@linux.alibaba.com,m:dhavale@google.com,m:lihongbo22@huawei.com,m:guochunhai@vivo.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,nvidia.com,gmail.com,linux.alibaba.com,google.com,huawei.com,vivo.com];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,alibaba.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 768331718B0
X-Rspamd-Action: no action

This prepares for upcoming checks in page freeing path.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Cc: Gao Xiang <xiang@kernel.org>
Cc: Yue Hu <zbestahu@gmail.com>
Cc: Jeffle Xu <jefflexu@linux.alibaba.com>
Cc: Sandeep Dhavale <dhavale@google.com>
Cc: Hongbo Li <lihongbo22@huawei.com>
Cc: Chunhai Guo <guochunhai@vivo.com>
Cc: linux-erofs@lists.ozlabs.org
---
 fs/erofs/zutil.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/erofs/zutil.c b/fs/erofs/zutil.c
index 55ff2ab5128e..94310b70e6af 100644
--- a/fs/erofs/zutil.c
+++ b/fs/erofs/zutil.c
@@ -210,6 +210,7 @@ void erofs_release_pages(struct page **pagepool)
 			}
 			spin_unlock(&z_erofs_rsvbuf->lock);
 		}
+		set_page_private(page, 0);
 		put_page(page);
 	}
 }
-- 
2.51.0

