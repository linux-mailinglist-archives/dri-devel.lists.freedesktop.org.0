Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPQzIXKMgGkl+wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:37:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2B6CBC35
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBF710E47B;
	Mon,  2 Feb 2026 11:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gA1CiGEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FD710E46D;
 Mon,  2 Feb 2026 11:37:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a/r8M2nAeJtQhWXdC/Qz/ErQGycnaYJiXrma2jlQabxpOZRBs0xphlr9Ay4KIdo66I93hdgUJqVgAdRLHzkKyXDCBLp9oDXtymG+pMpnyJKqTp8aHhTMCAy5yXMBEaBUOwLaUpVIOqilGTZAROYbwCwMFtI6HDf90Wdkn8Gd/FtP36sWsGkYNOAPCYrdHQGD8n50vPZ7JinDoks187ybxHQaMFYxo44wn/tat0Lp6esgIguqrTQr3CfRccA0Cs3oqsYZxUmOrPgIvp6Rom1G3CBZEuzYb9kx11h526opIGBLDWSvTKojwXbSQEhDCG9UXNCwSF/dOMvQtXyvAFbljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DxFpVJv/av0DPVhGRwmcwo+RxumKgoR9M34Q2wLSfA=;
 b=vTDFRgeYOY5D8i40KMaFtU8av4dhFJnBI5eODbRF1hUwQWSADOUrG1s9frCZ1RyaSa3mv0nV45wnd8oJhy1Zv7w8pQiOOLIyy+886FHxtmf8o0f7dHm2Pnso1lgaZ9Hff2Z91z1agreB18UMUf5RFect2TjFVJiPd0lIJ/pYqXlyBLO9uqWbZzyVfCDCjbPrrIJ3tpIfXbY4U5tY/SvehTQjalA1zXmQ1lketRm9o0CjrZeQlww4oHHeMDgF6CJJGCrPb6v1BOhVPltMGCM5G8ENx9FFoXJTJZyLW3HqJswxjTisDqe4poeoogYh3dZcpeGlP7iMg6mWAD76iECGRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DxFpVJv/av0DPVhGRwmcwo+RxumKgoR9M34Q2wLSfA=;
 b=gA1CiGENg8zBtvaxKF25xift8ykuw3/zbIfHX7aXiNGLQHa1GMVjoAcwkJuxkIFxuYudyST3cavXW6lCqbMJR9eR7U9SuSNhas5pUMgvJzWHCcGEXsqdxTCQ6fMVpLpGG5e6LtsQuPudY1ZtuwrpMxNofgcDgofX4lAsh8NDChVbe5ac0oxwKgDt0c61wsfQB4cRCAKaFc4gYVfcCFvehwjhUfXrSPEOpdMFyFzpLiFtQ4HDzbkRVmXbchydBv/F3PjhyNxLJ2zgXJb6VLmGlWmuWKAYnE6FxpDWGxOQMh6cGTmbRgnjAtq79RZHEbGRGANXucjGeppX7XEgcD3Qbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 11:37:14 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:37:14 +0000
From: Jordan Niethe <jniethe@nvidia.com>
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org,
 jgg@ziepe.ca, Felix.Kuehling@amd.com, jniethe@nvidia.com,
 jhubbard@nvidia.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 ying.huang@linux.alibaba.com
Subject: [PATCH v6 08/13] mm: Add softleaf support for device private
 migration entries
Date: Mon,  2 Feb 2026 22:36:37 +1100
Message-Id: <20260202113642.59295-9-jniethe@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113642.59295-1-jniethe@nvidia.com>
References: <20260202113642.59295-1-jniethe@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0089.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::34) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed315b1-e442-46ce-5050-08de624f6920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i5IVHNj0xxgxfEScIht7IxpfkBK1PzPDhzJNfrccKN3sP0hQD2iMqp0sT3Ks?=
 =?us-ascii?Q?WcDvUn6PWrTSxBaTDpSBdrQ1p7Cepsv2t8qU/g5Wui6CL8Up0zmA5yv/x7tg?=
 =?us-ascii?Q?a9YuTZ5/av86yvcV1o6TMOqVR/VsSpeahwlMJ2hDskAX6qFsVS6AzPB9xcjP?=
 =?us-ascii?Q?NcYfHEFG0u1FgcfJ4hSd7AMdlph6mPiWN/XTzIU72mbXk3ZTMFgsh2a5kQLi?=
 =?us-ascii?Q?6VrNwNi2YHQjEdEKs0eJjzbQctiQPe1QAXr7fLJnVc1+GcnB14ngGy/WQSgH?=
 =?us-ascii?Q?rdNX7KSZA8WCJXxXyKrtXZle1JcOAB3iYxbAMSJwPVEM7L3THAap3auk2n4U?=
 =?us-ascii?Q?gO3VFgx+Z3ULwaeWTeZ8+hmSQcj0sERJz0b8aRls1AfcGzLybiJG69ICeX1N?=
 =?us-ascii?Q?iGWY8xFkLfV0MlSUupqX9FQ2WoRnkk9ewsHgngdqQweb3oc4E4iNRi+WazaV?=
 =?us-ascii?Q?A9afKcjKaBW9DASEt7rnegd8/h+2xR3E4CuZOoCLf30TYcC18mFaIU41vtLf?=
 =?us-ascii?Q?X5L0FYD0lXpHZMP3svZnmt6DBZwAESz22eMS++JjslKrDlbSzfkDgyE8Ko/j?=
 =?us-ascii?Q?XvuNd1YZLx5PG3tuABsnnHOahZE4W9A+Z1UJTvMgElGjVpX6W3tO/UG6iHKL?=
 =?us-ascii?Q?vn1M+8nt76rLNCV0ULfQIPy9aFXaGqh0XHg73IY1z4k/eHXu9L41+1tQ99Rt?=
 =?us-ascii?Q?MBgDorotK4y0ftqQDoWj9G6j6+CcWuPZxyrNGqYmU6+ZmgRNKC8Fnl3452y9?=
 =?us-ascii?Q?BPtEKLXGC21iJas5Jv+FnKQTZ2xETXl1MbxIksA2oDmBe24H2Zgqeymx/vL8?=
 =?us-ascii?Q?1pOtpUMMMouFE6oOaJqYxtK3jtquIHGZVJcplJ1Y0xQSS+Hka5tUgjFj/Gom?=
 =?us-ascii?Q?dlYF2wCtFoBqhyEVSBL39HoQY20y8GL2yhvANw15oQEaCa/1IQMwEUUf1/tX?=
 =?us-ascii?Q?Coad+/4ZhDPebBmmDng1a1Ykh+nzjCHkFaxT8L/2cf6SeuYqi8VxubuThMxz?=
 =?us-ascii?Q?4Ciyw7K2Ze4Pb7rhYQzg5z7l1fFJvuDShcoQDWXCRp/vHHgf21OBU30zuTxg?=
 =?us-ascii?Q?mVYiVnGtMkTpOuwSjV3tZeFpUeW2n8DR9UgrY8SieUTtyv/zQc6PFZ2CdP+e?=
 =?us-ascii?Q?DbONIJLYJ7dyDSiZ2Wj21O/Ei4xWe+gJb/MEYkRIZkzPIdPyBeLQQN0T1f47?=
 =?us-ascii?Q?nJzTNevhP25WM9oY9nzBpGXlE8kFvvss8IZFHhWcQh7EXqE1iCppGBLVZcPb?=
 =?us-ascii?Q?C+xb7QFGhgTJAkykcvV7wq4UnSbVDwpR9sg9Cef3kqh+oByp11idfiVDkjas?=
 =?us-ascii?Q?PRXun2ia2acAX8d6ypkoF1Ivl84Y6bEJXCqsyRuRxiwnn0BHCCFHoUBk3hgv?=
 =?us-ascii?Q?tiCe3a58S18ZyYOP/nBejLV5oBVHrf66QBexjaAH9AZ+vGBHnkcOgYX88gNu?=
 =?us-ascii?Q?JzHJBohi35o2FjT+j4s9yflDrySh94nrV82KQSEgfxf3s9oO2qZ1SPIEtPYV?=
 =?us-ascii?Q?aOTlk5zSFZ+4lYKw6266bSgWDHgYQ3ZcBduG3f1CGqsquZRWidYlw/MXU/iE?=
 =?us-ascii?Q?EZcyC7GCHpsc4rxaF7M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iFVsSQoSZ697On/OzGYyKS6hpU6PM7IXzaBetzKC0hdC0WmYP+m+ErJwocIb?=
 =?us-ascii?Q?NSif9A9puM4ouf6I88SgHVuW9E3QZQB/vr034+hhjZutqaEenPTFUtQxziEb?=
 =?us-ascii?Q?KX7GULmLQjFE7vRRiv7mGaRd00OB/yTj0teWEnt7iSMtdx6EoUa0NuhIO7mg?=
 =?us-ascii?Q?IFpT9W9AJaUxPO+HusZlwpFiUFeNlTJPfqQA0U9Wt5gH9eapyao7aAIK4URW?=
 =?us-ascii?Q?hzwZSbOm72vppZyqQ+Nx8ihQAFHTLcbsrt5QDWjHKIk+bzWZFuN/m07ZtUxj?=
 =?us-ascii?Q?neHxnCYKuN9wCiONzBN/4iMhHzJE5xA47LJob6r3xE9B2SZJsXkTwOfv2V0E?=
 =?us-ascii?Q?EbOH1bsXwmynYo/iMI2UjaJc2NzZzpvMrZZfAXZ6cRfNPf2dCYEk+abHkZM2?=
 =?us-ascii?Q?8UZl1/8eZZapQ4mpvk3ito1FEvSd4mLhfoWbstsSuHyfGUdFjNvcx9WzVQRI?=
 =?us-ascii?Q?LaweQt7WQLXU6flyvAsPBsLGdS3I4adVorMcj/dS/joa301mWuRwlHf0tMnb?=
 =?us-ascii?Q?RDyBS+1Q+4Kcp64CZkKxrj6FK+Plw7npJtBAGUWbtggOsJFMz+EWhl9/r2n+?=
 =?us-ascii?Q?r62JTBWvVA9+3e2kTpW254Ka66aznmYV3k11qpzZXEn6wf1PbXsOQvb0vElS?=
 =?us-ascii?Q?2UiMhKdNIabjkc1dRUfYxg+lqnEJTVPxfysth2em2xUG/wN6ik6T36h4WdAm?=
 =?us-ascii?Q?isJU04+rUrVyjBkdb9E60pEMmz/x2qRqIozRC9Nu8JXYq8OQ0zFmPl6tKiJ3?=
 =?us-ascii?Q?lRxg6k3TAn/oYxMxNKbzARfmYxtuaDS8TMP5x3AStUXQOsSN8gHRkCnMLrhs?=
 =?us-ascii?Q?hm8gUp8ErJJjeznQEr8PS3HESSYyU3MW/Nn/kIsSUrbofR2MnjcvysXVwTxA?=
 =?us-ascii?Q?LffiBNnW9BOnGInf1akGxVns1EtsIJPiQxQ5GePt23mfsy7eNqgFnLeRMj4E?=
 =?us-ascii?Q?LuhusM9dntNFKBH1cSFamhJ1RjKw7bJFX2j4En2BIXucBt7Xcu2G1p442rVO?=
 =?us-ascii?Q?jak0dXwSTseOCCT7/UUzgO+yBZ252+VyymkNyVCT6rlD0479eYLm8xMt5rUs?=
 =?us-ascii?Q?YVbpag/1QBsV71zyiTijOjX9Lbo5rQEBjFTQAMJ8gnp4bjN2Frb/CazluYGT?=
 =?us-ascii?Q?Jkoztun2LZAsjFf/na2v+3o3aK6R1N3Xq33+kDN5aT7uHivq4q6savWOiLjw?=
 =?us-ascii?Q?Fc2s0fBewZRBGRlolAxul+BKl0tug9xu/W96DFNPPDjpNrf9n05GRxovrrdR?=
 =?us-ascii?Q?cX/GFEpWamVCaVGfT2mQOiMbmzk23zN2FqLZI4DuIv3R6GOTREFsyPExBmQj?=
 =?us-ascii?Q?XnEiZkWKlDi6cJavUoQY0kNsZXSgOudq8JeCrwTkdqKPFiTBAVIe0xOeNAer?=
 =?us-ascii?Q?t+ZGIDMIGjx7ZBD8rCTRJJbMa0IYVzPQtqLEMhFkz8H7YltCsCTh8FY8URUp?=
 =?us-ascii?Q?bFrmClfZwkHUWt/yJc2s2V/pO2MbDDWkwfmJz8NQ/49RFDXvq4dtuLm7h9Dq?=
 =?us-ascii?Q?O10fGayWmxG2u5niA4/p1EObjGfcdWRHis/NLV5n8wo8BTfq/uusZD0egU+9?=
 =?us-ascii?Q?k2L+mpfIFb+xcLXEOxx5I5l/CgkLxJEg7t6vs9OQpMu0vlEiIlkyhYSk3zer?=
 =?us-ascii?Q?be+RJG/03Ox1Yrt9NZf7BfZ9zrgoMc5pLZ8qydqsO75ogTYH4if2oSWbP0bC?=
 =?us-ascii?Q?iY8bPDTsFqXqwpyiDq1NsSm3/kEz+tAQZYOqUCXZlJv8fS6lc2JqRmqZNHrx?=
 =?us-ascii?Q?Pn/wCW8cHA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed315b1-e442-46ce-5050-08de624f6920
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:37:14.1829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eq1u5hUM9zQ6wkzy8q0m5EmzhU5nkDBePM86xcXnDREP6sPuIsoTv3waYasLqoeosACyI3KRRq2J0tNltkH7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
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
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip6:2610:10:20:722:a800:ff:fe36:1795:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au,linux.alibaba.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:2610:10::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[27];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 1B2B6CBC35
X-Rspamd-Action: no action

Add equivalent softleaf entries for the device private migration
swap entries:

  - SWP_MIGRATION_DEVICE_READ -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ
  - SWP_MIGRATION_DEVICE_WRITE -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE
  - SWP_MIGRATION_DEVICE_READ_EXCLUSIVE -> SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE

As with their SWP_MIGRATION_DEVICE_xxx kin, the
SOFTLEAF_MIGRATION_DEVICE_PRIVATE_xxx types are used as specializations
of the SWP_MIGRATION_DEVICE_xxx types.

The new entry types have the following relationships:

  - SOFTLEAF_MIGRATION_DEVICE_READ is-a SOFTLEAF_MIGRATION_READ
  - SOFTLEAF_MIGRATION_READ !is-a SOFTLEAF_MIGRATION_DEVICE_READ

Update the existing softleaf_is_migration_xxx() predicates to reflect
this relationship.

It is possible to distinguish the between a
SOFTLEAF_MIGRATION_DEVICE__xxx and a SOFTLEAF_MIGRATION_xxx type using
the softleaf_is_migration_device_private_xxx() predicates.

In practice, the only reason for introducing this new type is so we know
when to not call pfn_to_page() on the swap entry offset once the device
private pages are removed from the physical address space. That is the
only time that the difference matters.

Creating these new entries will occur in a subsequent patch.

Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
---
v3:
- Separated from previous patch
- s/SOFTLEAF_MIGRATION_DEVICE_/SOFTLEAF_MIGRATION_DEVICE_PRIVATE_/
- Update comment for softleaf_is_migration_read()
---
 include/linux/leafops.h | 90 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 80 insertions(+), 10 deletions(-)

diff --git a/include/linux/leafops.h b/include/linux/leafops.h
index 52a1af3eb954..60681ada7b8e 100644
--- a/include/linux/leafops.h
+++ b/include/linux/leafops.h
@@ -28,6 +28,9 @@ enum softleaf_type {
 	SOFTLEAF_DEVICE_PRIVATE_READ,
 	SOFTLEAF_DEVICE_PRIVATE_WRITE,
 	SOFTLEAF_DEVICE_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ,
+	SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE,
+	SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE,
 	/* H/W posion types. */
 	SOFTLEAF_HWPOISON,
 	/* Marker types. */
@@ -165,6 +168,12 @@ static inline enum softleaf_type softleaf_type(softleaf_t entry)
 		return SOFTLEAF_DEVICE_PRIVATE_READ;
 	case SWP_DEVICE_EXCLUSIVE:
 		return SOFTLEAF_DEVICE_EXCLUSIVE;
+	case SWP_MIGRATION_DEVICE_READ:
+		return SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ;
+	case SWP_MIGRATION_DEVICE_WRITE:
+		return SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE;
+	case SWP_MIGRATION_DEVICE_READ_EXCLUSIVE:
+		return SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE;
 #endif
 #ifdef CONFIG_MEMORY_FAILURE
 	case SWP_HWPOISON:
@@ -190,28 +199,88 @@ static inline bool softleaf_is_swap(softleaf_t entry)
 	return softleaf_type(entry) == SOFTLEAF_SWAP;
 }
 
+/**
+ * softleaf_is_migration_device_private() - Is this leaf entry a migration
+ * device private entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a device private entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private(softleaf_t entry)
+{
+	switch (softleaf_type(entry)) {
+	case SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ:
+	case SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE:
+	case SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * softleaf_is_migration_device_private_write() - Is this leaf entry a writable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is a writable device private migration entry,
+ * otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_write(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_PRIVATE_WRITE;
+}
+
+/**
+ * softleaf_is_migration_device_private_read() - Is this leaf entry a readable
+ * device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an readable device private migration
+ * entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ;
+}
+
+/**
+ * softleaf_is_migration_read_exclusive() - Is this leaf entry an exclusive
+ * readable device private migration entry?
+ * @entry: Leaf entry.
+ *
+ * Returns: true if the leaf entry is an exclusive readable device private
+ * migration entry, otherwise false.
+ */
+static inline bool softleaf_is_migration_device_private_read_exclusive(softleaf_t entry)
+{
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_DEVICE_PRIVATE_READ_EXCLUSIVE;
+}
+
 /**
  * softleaf_is_migration_write() - Is this leaf entry a writable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is a writable migration entry, otherwise
- * false.
+ * Returns: true if the leaf entry is a writable migration entry or a writable
+ * device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_write(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_WRITE ||
+	       softleaf_is_migration_device_private_write(entry);
 }
 
 /**
  * softleaf_is_migration_read() - Is this leaf entry a readable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is a readable migration entry, otherwise
- * false.
+ * Returns: true if the leaf entry is a readable migration entry or a readable
+ * device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_read(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ ||
+	       softleaf_is_migration_device_private_read(entry);
 }
 
 /**
@@ -219,12 +288,13 @@ static inline bool softleaf_is_migration_read(softleaf_t entry)
  * readable migration entry?
  * @entry: Leaf entry.
  *
- * Returns: true if the leaf entry is an exclusive readable migration entry,
- * otherwise false.
+ * Returns: true if the leaf entry is an exclusive readable migration entry or
+ * exclusive readable device private migration entry, otherwise false.
  */
 static inline bool softleaf_is_migration_read_exclusive(softleaf_t entry)
 {
-	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE;
+	return softleaf_type(entry) == SOFTLEAF_MIGRATION_READ_EXCLUSIVE ||
+	       softleaf_is_migration_device_private_read_exclusive(entry);
 }
 
 /**
@@ -241,7 +311,7 @@ static inline bool softleaf_is_migration(softleaf_t entry)
 	case SOFTLEAF_MIGRATION_WRITE:
 		return true;
 	default:
-		return false;
+		return softleaf_is_migration_device_private(entry);
 	}
 }
 
-- 
2.34.1

