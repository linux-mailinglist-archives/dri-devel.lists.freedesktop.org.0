Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIBPFvPjpGnFuwUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 02:12:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A59B1D23FC
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 02:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559FB10E418;
	Mon,  2 Mar 2026 01:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="giAMZpAp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013065.outbound.protection.outlook.com
 [40.107.201.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4E710E418;
 Mon,  2 Mar 2026 01:12:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aOUcT6ay0zZmoikQM0nSEVhaagaUSijmOAU7wp/2V9+tFpGezdSJUZqxBOhdjK5MBDJTFzsxvzZvzP2n/u4tVjdv5/jc4w7hjF278esdNjHK9mYeEVOV6ED9WZ6VFUVN3vAyJCMA38ps+6nhw30t0RyK3TeQIgYDGYek0kCP6ej/JGgfITuXVkgrRg3liCGxs6AKefb69VWeeJ/3FyjBFPlI0qS7ZbTparDc3X0tuiBAPVab1yNG8FK51NG1UHBU9hggXTBdYqsTFmgJzhBpJhpzz6DnJHswoiOlkbvPx0+6UUa6yzpmhsYHN+sKWw2+V+kvJNrUg511m3Rzv1Bq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPEG8iv7klqOYCNyfrqicCXKjFtnwwmoDBZiODYwc8o=;
 b=AVIVx61pTqXCIFJW15o/yWrIh7VDqJx1WJB5XHS3+GVtRvyg2YOaB9Yq/83K5FsckQCqPTIRT5sPzswf1dGc3+1UrG7rL4JIabxGVcEOndMEEImRgad73GupapqaOVWBroNrRGiMMxbOB6H/irawv3tDMhTaZsJWL7h1VE/FJQTxm3mzh4oTHeODOs0nR4SdWzZqityjKQoMsegTR6bzmRkR+2PVhcfFxj6b0sqHeL+QBftnIEJEtdUmgEkVLF4AdWIaSZMe0rH/3Uxd7zartM0njSva0Xpt6MCrt6B7/lj9Oj/J+RJ31HAJRio+rJ2KuiPYM1t+SIzf1P3lkJ9ZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPEG8iv7klqOYCNyfrqicCXKjFtnwwmoDBZiODYwc8o=;
 b=giAMZpApaiW5ixXaUdxJXj9mIquIkS5ns/mKDWQGCuzCsALLON2tScNOrE2JDi5ZRNtpZextwP4690InIIhIyadhRW3NWTgc9q1Pm2fqTRLiSKfyp41RFIHQ5xX/oWYf8zFYZmj9tY22RxHPk1UN0Bf0INcUKCH9NDa1Ysqqb6NEHXfwYKb8kJcw5Dt/0qzyEqiSgvtFp/l1zkWiosZQ/F+RTAIVM7Jnsp5RXRQiqAIvh+FqbedjSi4ckCYHSs7xcpDeLu5odXDSEG0PqOHaMqPaMxmHyEP7EJKljzV0G3TAiP1sGmZ887gj9GdKeRS3uMnTQrVVZbxkEZPEK8dEjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by PH8PR12MB7184.namprd12.prod.outlook.com (2603:10b6:510:227::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Mon, 2 Mar
 2026 01:12:12 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 01:12:12 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Airlie <airlied@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Paolo Abeni <pabeni@redhat.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org
Cc: Yury Norov <ynorov@nvidia.com>, Simon Horman <horms@kernel.org>,
 David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 4/4] drm/xe: switch xe_pagefault_queue_init() to using
 bitmap_weighted_or()
Date: Sun,  1 Mar 2026 20:11:58 -0500
Message-ID: <20260302011159.61778-5-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302011159.61778-1-ynorov@nvidia.com>
References: <20260302011159.61778-1-ynorov@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:408:142::9) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|PH8PR12MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 602cc5b0-638f-4f06-698a-08de77f8bbee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: Yr+uVYL7aR5hoozdQonGJz7pegC8qNcXYLHVYUScsoIiqa9/Jnsj2oG/MV3KB/dP39+CZNF2ml0DfU0I833nc7VAiMxUKmuIBEOBhgPzjh1t5gz6wmINCfXeGJiePEXJ41D6lGIY6nBAAyfRgVxkjpR9vI1mUKQASy+tszKW89j0hwXFF3eqvMJGX1rQt49tY4VhN9wnLwMptjIcsm81w7PSRQiyUyL3irKmCIt98OyUMkY0TTpWALebHH7/Gho+VzSDocwEFtY0ZolOPtPcVUDC0ZWJk04nEvVwaXsbtJMO7XbG8lv3yg0DWZuS2p1XHldfsQ+cCrxxuAxEPqecfJYPp34jHukEVdHWU4WgVV/2xvrUSAWUBB5xF/deQStyjcwyF2duvYhLhRlvRaqQWowiY1bHTnfTs1ZfdyvpwPUOhcnqcYdvcygKAAoNkvt7CPxtByorPrpzNRJ6kAr8/t17G2sl9Xi1UtaAnRmX7HNfInZ8twaXQmeyZtjRHu5Py51AQVA03oR0ouOzRDFKuN/+5ty5DPthW+BaKI8/hPpBRa/YXWj/yZIuNmt4qebbqvhJOvxF81b0HXqjmvKRMb1BE+KrW1wdNEOFrdhTSW45uJ1qgf+i0E9Xn4axOju401jUbRMYx+/DWc2Fesoy5m9iXqSy00vL5hs5T6xord/PU/vTZa6eT04umZvr8ZzAaVy3VILL2UfljioPal8HGeybc5m275OETz/QNbFTq3EaUd/NdDsPTf/gGxGX1p4QQwvjs9TBhO7Dv5G8oPrhFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M6ORRpl9RB8yrtcPG2+pUQYAxw8doqxl32P5gQCapIV7Rq6N3JLprm/fcDP/?=
 =?us-ascii?Q?F09pLOAToB1ttatchSMIKhb2j0W0I9Jny9GeauxOU8riMEeGhoI/oR5gE7xH?=
 =?us-ascii?Q?aqhfQo3xzolTHUKRKfYhIssVEh75lDoYO8pP7P6qPqBw5bdjHLWJXwewn6YK?=
 =?us-ascii?Q?Nnu9IUwhApZHHcUpPPL7vP7Cmg5UDuV0U1ypK6ZrrAB0r50fwU3u4PX1kxiY?=
 =?us-ascii?Q?ApxuEr41AuOA9dbAfRv60frbriRNQrS56QwLBhTQnCUt+KPcQSlyURUyMHfA?=
 =?us-ascii?Q?Yh0pXa9zZlvJFkbGk4F865CzMm8TlqRhYbhzP0yUx86dz3AJpONVztzTH7zG?=
 =?us-ascii?Q?JJRKT2mQH9jhoRU1h7bZ4LSBy24GFN7vrXYN+5Y3FQgTU78epApoZEW4Hftj?=
 =?us-ascii?Q?lE0KfUCw71zUSK9pEKzIE7k3ulo7JstwiQqKpT+u01rNbaeq6OW55foGUKjZ?=
 =?us-ascii?Q?hrqv5Sm+hwMHgW31KBlPffhTv2Kri7uEqeVFLYQHgD33g/KclgTp5fMYR9q2?=
 =?us-ascii?Q?psGfsZucv4pPjkqRhP4FPm9HnHJ3cr2rDSbWRqce7Z2kM/CB4rOG8/ifxmde?=
 =?us-ascii?Q?EU3WlUs5mybewR7l+MNepUdlCiIf95480bbGvU8dBUvcDhRDFO0iMn3K/gLB?=
 =?us-ascii?Q?iZn0KFGDs+bdQdHSsbtLvqy6gR84sMDe+9PbrDMXRCEZOrFQgSyy1deUJsiH?=
 =?us-ascii?Q?kvw0MHPwA08X+DVfqPyFR8wn9mVsVTdyw40vOffdUgWUQiOdWaeGvoGUr7Sk?=
 =?us-ascii?Q?sVxXamXRV8R97FPAJicCh1X8aDdiDAI0sk9pT4/2FG78BoGj6J2t5eAjA2mb?=
 =?us-ascii?Q?83hvbjAooFZ2MhaJaw7OjGEN8y9l4voU1I7GsvF47qwgMCBPZ42HazLbBYT2?=
 =?us-ascii?Q?3q3XRLxbaerAEKWnKlcgdmvi8OAOXkK/Yr1OpWsuWh0oiosYGhcJ56AlR7JO?=
 =?us-ascii?Q?3QkGQOVrZyLGu197V/diHhdLQAnsrOBnG94oYHhay2Job3BdfvztKx5tVRB3?=
 =?us-ascii?Q?Ge1E3/uI0J1op415uhkWnuG0p87B1Zv2MElUI8nUFzb5tjptDpg4zZkQbfN4?=
 =?us-ascii?Q?KSF4W8bEpx7If7DJyqKbhQASjV/m6gmIL5+9U1C+VaXvr+0BYbJCrNkwCMH0?=
 =?us-ascii?Q?3pYQ14RJKxj9g3elsn8AbZy6BWHDl1fMhHVCwjKjw15nEsNsWMU7wsXYDHvZ?=
 =?us-ascii?Q?vvttzzUe2bZFOYkz95QeKB1BAlrFErQ1g1WlVhOGSgX2bXEyCSC3jXHfQaAg?=
 =?us-ascii?Q?eKgUyfgHKCKB8oE6HdmvnqMuswY95pSkiKNzfrNdfwQcBhamz3XLTNQsOZrP?=
 =?us-ascii?Q?8iwDD4r+UKEc2fiNdX1T62G7zeVijmSV5b+vh8YKkK6Uu1CsR+mwYWQBhG07?=
 =?us-ascii?Q?wXBT/5bVW31X6Fup+LxLBf8kNGG+3G7NsgdCLcZ9Rc9fUphcRrcw7OwPZmDE?=
 =?us-ascii?Q?gPoWOxWMhejgxOmyWpgtj2shGeun7cxqKeMI49GVvKGJaub+FzUv8E5hO7my?=
 =?us-ascii?Q?c/DV1lQtvAXffKsyeB++Jdvu5RfZSyG3OVA6ml25NgTY9V6jAvfjipaFE99X?=
 =?us-ascii?Q?IFr7SLbGnrf2589JhkYkUy57OflePB77oBo8Zq7TWFLBWbP80dYATegbLEY8?=
 =?us-ascii?Q?5Wn3IIk/vyY4cmd7g1sDLiQLIkMD4IT19AwToPGuUbN9Wv/Gzs0JPhwLZsIP?=
 =?us-ascii?Q?5ojphlC9ZzOj5LO7Q4D6EHusbEo2i8cgYuieDd77klogu4nlICbuyVGXsjzL?=
 =?us-ascii?Q?PWx9zQEHeYe+qPNfk3V61cRTxQCp3lnaGFOOKWGEFaIj20D1CMGy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602cc5b0-638f-4f06-698a-08de77f8bbee
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 01:12:12.2742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkDlIQ5Tlc5t6wGlP05wcR1WQDHH6vFOmTZq9u8KwMrt3ItQBhTfJe7ZP22+LakE09AAN716YTO1OQ1DaBX0mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7184
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,davemloft.net,linux.intel.com,lunn.ch,linux-foundation.org,gmail.com,google.com,kernel.org,redhat.com,ffwll.ch,rasmusvillemoes.dk,lists.freedesktop.org,vger.kernel.org,lists.osuosl.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,gmail.com];
	FROM_NEQ_ENVFROM(0.00)[ynorov@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,netdev];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 0A59B1D23FC
X-Rspamd-Action: no action

The function calls bitmap_or() immediately followed by bitmap_weight().
Switch to using the dedicated bitmap_weighted_or() and save one bitmap
traverse.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index 6bee53d6ffc3..c4ce3cfe2164 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -285,10 +285,9 @@ static int xe_pagefault_queue_init(struct xe_device *xe,
 		xe_dss_mask_t all_dss;
 		int num_dss, num_eus;
 
-		bitmap_or(all_dss, gt->fuse_topo.g_dss_mask,
+		num_dss = bitmap_weighted_or(all_dss, gt->fuse_topo.g_dss_mask,
 			  gt->fuse_topo.c_dss_mask, XE_MAX_DSS_FUSE_BITS);
 
-		num_dss = bitmap_weight(all_dss, XE_MAX_DSS_FUSE_BITS);
 		num_eus = bitmap_weight(gt->fuse_topo.eu_mask_per_dss,
 					XE_MAX_EU_FUSE_BITS) * num_dss;
 
-- 
2.43.0

