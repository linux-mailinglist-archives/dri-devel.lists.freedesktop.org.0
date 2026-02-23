Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NL/FPvJm2kJ7AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66DA171873
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 04:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957BD10E1F3;
	Mon, 23 Feb 2026 03:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WMDN9Oxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91BB10E1F3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 03:31:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGPthFGmXCJSR7EvKGPMq3nNakPKRFGuaBJNpFHu2jiADOrDLabdQtxPgSqpdw7Qxtr1LSJFRty6iLeNf8byrDdgtS/uuotc/EWpkOfYSoEwe2EMaYOAC10FieY7PqYlI11K8TWqeXqMG8QtD84J/WoucXjQbe+rWw0WN2IEphyEYl/LjRuHEaW9uEbkeDnH5lbzJZ7VGumjZGIvm6pXvp0mJzgjpTNK4sIAV7oGK24+xR4kNeNo/8Z60CIFnCugvVqmXNAyWu1hcr2KMbNq8wCUeMlvRlhhJWLn8+jvDxrzw6IWW6h1acS5TL86O7qkXCP8+IsvM83Of2ApmmZYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BsArd5uquRUyqTx7lIbuF9jvLkAvbJbODCSdF0bRXUE=;
 b=f5sGyUUDRGRILx1U36P091EEHa/izK443RYTAtpA7543eSq3Czwpr71bnjAEkSfwe3G3Hen2NB7j9RiALZlG/ikejU/b4LNfNiTOPPNDPkKqfkXpZhEMAXcfm1lMfpnHqnQBOkJ6oo3D5Mpwk94gx+qvToNa+lacLGrqDhWvbPU7r9WIQx67HkoaZ8U6YEtgoZuJFAhyo4tSNkq9yZcC3dEiMkdfGKFuEZhRpSrXkb8a4JlQCCQtB0hj+LtPWJCEyqYej0Xx9eY/ocFzaLePbDidnkd+WV07AdX3bjOBiCoQjcb9FOmBvb8mH3ZadHouX+hMAAYpTJR4/+MaWaV07Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BsArd5uquRUyqTx7lIbuF9jvLkAvbJbODCSdF0bRXUE=;
 b=WMDN9Oxfo2Fvez+gyUm8l/FgajDJGhmGNdJHns0taxOJfLc0s+vIDfhHR6zk64ReEXDpOZTDuhl0ShQQq5Kla4AAlFZqlt5Do0uYfuRH5tgz9ZOmpK9J1kVN42/3y5y8hFx+WObGhlpoKqnunIAV5KM+CA1crM8Gt5tFD0YK8YsTbqBcL66lNuvE5YiQA0ymniejlzq7nXbg7zdVqEPdZ0TAbiUiUxj+Ph8wcgG/tvpSrZeTQB4CbuLXUl/auFlTGFCMrDWhwlqXa/frdHFJndW0nRFmCCvT1oH89AH+wlBaT8zUr7HFjWN5uaIpYAxd2tv2hxAv0szo4Qm3bAVOvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB8908.namprd12.prod.outlook.com (2603:10b6:208:48a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Mon, 23 Feb
 2026 03:30:59 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 03:30:58 +0000
From: Zi Yan <ziy@nvidia.com>
To: linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
 Jason Xing <kernelxing@tencent.com>, Yushan Zhou <katrinzhou@tencent.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [PATCH v1 01/11] relay: zero page->private when freeing pages
Date: Sun, 22 Feb 2026 22:26:31 -0500
Message-ID: <20260223032641.1859381-2-ziy@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223032641.1859381-1-ziy@nvidia.com>
References: <20260223032641.1859381-1-ziy@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::28) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB8908:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bfd900d-f828-4926-8418-08de728bf613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?62Qpt6n9o48iMFWu3/5p0/I0uBXVXq1tojUzEll/ry6DYCR0dNJMQlNvGUp2?=
 =?us-ascii?Q?mF3ScbSgKA9bujF44RlNfq1V9MuphDsNwS+ZcXzxwRzkaGYHj0iXwDuOwHer?=
 =?us-ascii?Q?j0eAy/FFqA0JUDjYAXTRrgHf6lLGuRvHTg3qpP5VfzQpa6JN83mt3LpxNnlh?=
 =?us-ascii?Q?eOYAuTgx9B3T6v2jvV95X4FLOWsSYw/8Nz+572zhctwmbmWzb2jDLigHNlsB?=
 =?us-ascii?Q?kec7NBVuL+qM/UgLx9XXY5gbysQgozuKkQUOj98f0wQ717bzh0g4G9QWZc2U?=
 =?us-ascii?Q?EySEJZo1RtD0Z4sPl8TI84+R/r53wtGevLfwKlc1l3waP9oHw2y2WWMs2RYR?=
 =?us-ascii?Q?7lyeeMwz65bCJPyIkcmfP31hjLZUKO42/nhQaK8fydHoEI/xLyffuuMsrOZQ?=
 =?us-ascii?Q?Ht7SeCu2Jum/9pctp5mMNJ3kKX5CXLnkAjU2bSnuOh/tt8CVXL79CVBfCT9h?=
 =?us-ascii?Q?htmb4LcUBjtDaEYdKO/3NzFvRuS0ssrq3dHGedIzbMfpVLH6fLw2qzzaTda1?=
 =?us-ascii?Q?tr3qgJ4uug/Ey3wT5xCfHhf7KcjrkPb728tpyvlF7hAZUnaq5jCXTtVEaDgm?=
 =?us-ascii?Q?8jMppT0IZOg2YOQaQwm6L9LzAVEJBj0M++jqId+IRL5CQa8LAew5k7D7kR4p?=
 =?us-ascii?Q?XyvjjCpRG/72KnRINLYJeICsQIKVJmBDnXRbo8L3RzUl/KH7u1g/YckphRhK?=
 =?us-ascii?Q?akFk8clSpiZfps7CmUImXQAa1/RfM06Ad+ghBxciV3a/aNjJIj1bv5ni8Nzb?=
 =?us-ascii?Q?+8n8rAPUv/MyE4jIi0uts6sYMu6gWrgRuWXlZdhIozilYgC7EV9dx+Ds6Y+O?=
 =?us-ascii?Q?lmVnrorBLn8pNm+ck3TrwlUStiEtOEUHb1V4lrePng+LS+D4feB51WmfqPuR?=
 =?us-ascii?Q?bc46IPNwl8ASSxenTZoJew9est80Jg6o2VEcYg6U0A0we4K70TLFEUmLD/VY?=
 =?us-ascii?Q?yLZRcEA/Ug7BfCuyi1vbA7CzAONz7hwIS+h6akozPEvJlmUR2H1Kd8yV4Vkg?=
 =?us-ascii?Q?9fd289hB8cMOsLJ6oXZKPPaAsCLg7usyFzf23MN+p0ZVJEhOkP15wGoIpdxO?=
 =?us-ascii?Q?MdyXOq1FVqCmvywNQ9ETzRtAmOAvJdYe7S9qxgl1uubSrCKE1Oluuu/bvR0g?=
 =?us-ascii?Q?I8AlIMgAtoXeqhuno74nZcZM+bNclpqjr4T21T2moSd7OJL+S9ISWQb5IwIn?=
 =?us-ascii?Q?ZHyTXUGbk3yxq5O6qaop4DBaT227RLXQmJ/OMUOTh2vgMnyQytWcE3iuhJ1I?=
 =?us-ascii?Q?O0JFIzT/0Z1wg+19qavcUTP2U1AzoZFCN6VNKeIlkcAsXR+mCWZuzcEZZ49n?=
 =?us-ascii?Q?Ar06/BwWt2GyU8mqd0OIXrF69mRGfMjqRCwEZTzKmhFXeK5CPYW9hCqvKSCM?=
 =?us-ascii?Q?DU2j8tBbGANSebohbJE9sHWaHaLC2LTzZtS7I03Lr3PpV4+9nvk+gZTKdW7D?=
 =?us-ascii?Q?FCnoHygq5taDrYAgzx6lmejDTuW3q6DRYhaFBoR0mELKs0wasstyICkMT5N8?=
 =?us-ascii?Q?FdAkYuOwnqsJ48RuOVVufQ+r+IWygYrU1S5rGtT5B8FbnGbLedT/EhunwCbZ?=
 =?us-ascii?Q?xBMkxfInnW8Er9UaL2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?10db90MjHGbI/MCJGWBPUpXodXhKF3VPMbjQolUrghnP/8dsNyJ1hiAb4I75?=
 =?us-ascii?Q?K0ArEjyrTtOIH2ZWA5zwi0tlSzzySdPAms0aby7xu2KKdUWASCxyzrPBXT3/?=
 =?us-ascii?Q?Ru9o31NmgskB1wMeexmWNRfkNlgUrwcVTHIisqX6WCr8ev5kVYjkP5mxlRtn?=
 =?us-ascii?Q?3jWh3OoSp2EthtvZSnLCDNfJ6NrYXt0IQBQ2ULgAJWj+OlWIIeAvBkTIy6p/?=
 =?us-ascii?Q?iBWjaIWONqBxylTCFkDw8U/kcznp6V1XIvrHLAoYT+vL/HDEI8y452aav5Ka?=
 =?us-ascii?Q?H6lDCh0GzmlYN/zuDK/VaAEzJ1at3B9eGJUpYCcvsEmbkfznXGJzDy5aXs6w?=
 =?us-ascii?Q?pP/1PbPiW9Lt2cd+njajy5uT9Wcp7U3ZCsMX8MSnStVV/KCwS0RWDzEwnM4E?=
 =?us-ascii?Q?0IcbHP5RJGn5mEGoGgGh0clUHFezULX4fzs3DmtDW6uqgGysbbS+ZDuJWKBo?=
 =?us-ascii?Q?VUHZCTDHT1BxQhO8E1PTgQXclLJ4+R4mAOnLgKnm4SQFnr/+ta3KKU5qT08Y?=
 =?us-ascii?Q?D7S4ahkrBt+9vU2VefvrH5vLhn+TxLn/QdaZZxsl6sM33oLfX4pluePi8Wmh?=
 =?us-ascii?Q?C2DQ9tJ6qrHXbsHrLJuM1tTF4h3Q+zEDjLOC7+683w6yKQWShL6sOFUgMimm?=
 =?us-ascii?Q?5f1pGVA/VtLQ6k7mNU0nYfybrk1NqjLovtaRAgiWv9ojcOhmp/X+O2QdQpUB?=
 =?us-ascii?Q?QbqwQQo6stWJ3xfgJfKdIK+ASu20sVZcaB+DI2S2PDSjr1EFjyXPDMAfcJu7?=
 =?us-ascii?Q?sC/KEKEgeMyisnxC+A9byG/UBhCOWmcJpHPYU8IW0pTH2nM/rcpJSTe2QKzq?=
 =?us-ascii?Q?6BVIQVHEZHQ5SVKV0U86/sOWkQZmrxTZAV8FGVka2Vir7OyS0o85Fi5xULX+?=
 =?us-ascii?Q?AWgo1jlH8ldBG4IrWS621EMWH370iek7BduRwqUFD+De3i86MZes+7GU1bL1?=
 =?us-ascii?Q?cBhs2Qh8v2mwCrhwaPIQY3X4+PKU0+s5Q1gS/AvfXrOqAl4/jpLvb24p/b39?=
 =?us-ascii?Q?mJ3EkParxT8xUsegLoP5AII0E1AXZ6hhzmnGxm/UMLTpY2Gvjilicui3EHTv?=
 =?us-ascii?Q?FDCzSV55sMmMafmEntrccPHG+XtOZ8AS2eOFe95oQxZT/VMrkZb3KN2BLZKe?=
 =?us-ascii?Q?QSBjQf6knPFfjzAE5fc14Hk37fdS1ATog82736JQW8kJZuLsZqtZ3FU8Mqyz?=
 =?us-ascii?Q?k3yLIgu8Ik07xbUR8KRTa0m7fG2xL8UkNdQD+ytRkvJvTZF1gAPqYYRB2Few?=
 =?us-ascii?Q?pxauBH1GuI8KBwl8iCW6+xPQRLw+h4SVEppdKBm+vTLjpjp+00EW7lDwjIkA?=
 =?us-ascii?Q?MlFE5XMVXlhSIjMghkA3HFywIClGUV67jlUVwWrytYG5sXgFORV91SfKybwU?=
 =?us-ascii?Q?1ZMLParyjN2u9VOn3qGdbKYRZKjueTB70y8Tp37Srk61TmfKeHleDioVnL6C?=
 =?us-ascii?Q?6o1RjfCptgYlSXsCKEwdO3Sg9kox9XMW88TnZe61jBmNvff3Dw8JNvGjNOTz?=
 =?us-ascii?Q?FTf8Qr2bnF3YPVG7SBcR3jLjkFNesL6FrVLNThaHhlR3vz+VreXwX5NIPqGW?=
 =?us-ascii?Q?hCIu5aATUyoaLR8uaM++E8CzQvslUDeiId8CeZGK3fG8wXJObSvfX8IM++6+?=
 =?us-ascii?Q?2sjkvCititUialVTpZt5PJ0BJHowoi9jLaE0nNyyZ3zWokU9U3fTXHV3JHIp?=
 =?us-ascii?Q?AitziIPv/z2dbnnpuDSQSrra55bCs/vlz932/xsUQlllRpra?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bfd900d-f828-4926-8418-08de728bf613
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 03:30:58.8653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y3OJ0+3Q58KvOZWej/YXOwougFz03+OvXQNDyihjJXKYo5bmqFQW4kuk4U3Zm+Lq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8908
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:linux-erofs@lists.ozlabs.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ziy@nvidia.com,m:kernelxing@tencent.com,m:katrinzhou@tencent.com,m:mhiramat@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[ziy@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tencent.com:email,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: B66DA171873
X-Rspamd-Action: no action

This prepares for upcoming page->private checks in page freeing path.

Signed-off-by: Zi Yan <ziy@nvidia.com>
Cc: Jason Xing <kernelxing@tencent.com>
Cc: Yushan Zhou <katrinzhou@tencent.com>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
---
 kernel/relay.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/relay.c b/kernel/relay.c
index 5c665b729132..d16f9966817f 100644
--- a/kernel/relay.c
+++ b/kernel/relay.c
@@ -131,8 +131,10 @@ static void *relay_alloc_buf(struct rchan_buf *buf, size_t *size)
 	return mem;
 
 depopulate:
-	for (j = 0; j < i; j++)
+	for (j = 0; j < i; j++) {
+		set_page_private(buf->page_array[i], 0);
 		__free_page(buf->page_array[j]);
+	}
 	relay_free_page_array(buf->page_array);
 	return NULL;
 }
@@ -196,8 +198,10 @@ static void relay_destroy_buf(struct rchan_buf *buf)
 
 	if (likely(buf->start)) {
 		vunmap(buf->start);
-		for (i = 0; i < buf->page_count; i++)
+		for (i = 0; i < buf->page_count; i++) {
+			set_page_private(buf->page_array[i], 0);
 			__free_page(buf->page_array[i]);
+		}
 		relay_free_page_array(buf->page_array);
 	}
 	*per_cpu_ptr(chan->buf, buf->cpu) = NULL;
-- 
2.51.0

