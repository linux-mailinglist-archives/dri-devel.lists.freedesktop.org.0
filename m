Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBA9627D19
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 12:56:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2F210E08A;
	Mon, 14 Nov 2022 11:56:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2056.outbound.protection.outlook.com [40.107.95.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D8210E08A
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 11:56:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kw2HD5pmLdOuMfCgoxiAs2JieydsGv66v5QE7NR6sQEEKovz+hjODg4Nc8wEWodeGKrYHMwWEhfh7187wXNvDLd80xQ4Qj/iNCcmOVvQkGdpC6M3bX9ryT71YlqoJaFUIbuYsu85Fgm2WFs6OYlk55J78MaySzh/mSG2ps6Uszfw0oY3ApsLZEKmNlsQ5TcfCk9YR5u7JHQHZv1nG0ygxOQXD8aFLu8vHRDiyw0qv4HbVdiwMD8v6OU4JNv1iu68BYO4xScxeiMQRvEvSAHhx5mWpXMFO9xbBa/Jv6Y+CovRFZ790PUldJNog0G/tiz1VLvC/HCLLDtc5aCo1dkY6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwxRVxFRpBl4baSdq7loLnxtH6VXkV/Ed7FUy0cRQMk=;
 b=mVFs9RzLjLwQQIAcpYoSV/qPvpzgU2nmJnH1CDvLjQ8q2eFs5aRhhnnpNZuyp7UGUSw/k9e7EGp0aMqUpBA2s2Ais8kXOerBz0J5VHLFrjO4vHvdrYqtU2MNCq8p4jyt7NLcNft6u/zov0LtNyObUk11mlT2XsOLv3UxCLhl19yPTn7inu+CUqSWdROgXAiT6yRx1zP4smCMY2ykQe4OzrajKDQ0Brxi5diEShnS2VEhF1bcXH/y20zwlh+LAH+a+67qmy3etIm/yYC/FKmgHL86+L0ORbg1u1S2TUj4NmGKZFdWfaslT20VUX8Q7YMuZwnX45fFnUO1A/8RVy2ahA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwxRVxFRpBl4baSdq7loLnxtH6VXkV/Ed7FUy0cRQMk=;
 b=NRp8nk7ER3SthA8FCnTrP034rlUAB//gPLsvlpvDvUzFUlWRWGUKafBupwDt3ehWrXaRqew3KsVXBNR+KrR7OFGXLlx3jdwUJsL5BWHrFmeN1USqLG+vz4s+KhgLCUCdCRpbdK69xNWrxPi5f6pLdheC8a2qvZEwQGSjpxwPBN6fasbsEf7hmRSn6Zx3vKhH3y6Xoe5cnMeDQbXZIJ5R+QB978fE1RcRmL/ECOqi3IXKWHhZDgHZZGaADZ10m6/CPcrTcoY9f6F4Pnompld3F+8d8olDyUlQInXcOCRq7HuwvSi8zrDbvJ9KCrFiO4yzvkHRs536vRSXtNGwhWpM/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by IA0PR12MB7652.namprd12.prod.outlook.com (2603:10b6:208:434::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 11:56:02 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::a60d:334d:2531:d031]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::a60d:334d:2531:d031%7]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 11:56:01 +0000
From: Alistair Popple <apopple@nvidia.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] mm/memory: Return vm_fault_t result from migrate_to_ram()
 callback
Date: Mon, 14 Nov 2022 22:55:37 +1100
Message-Id: <20221114115537.727371-1-apopple@nvidia.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:a03:338::15) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|IA0PR12MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 134edf88-c10a-4f78-2b41-08dac637338c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D0hmB2UKXqE5ZSG0JhNDiMO9QAUjVseOxDyTFyVIapy8AX3dnxtKCLhzZiEM3LNgKAtvkKwlvcsMw0DP653UVXArA2kP6R84DkSbAZcQZYvvQQZSI15uU3M0yEJP8BB1fZKh09IQb5RlRRavnjBr+4Q2E3bcbRY/sAO6w0CVHAf91vUNQ5nxUDV0nbD6smLFSh3L9KyPYSmTLK8iRWBznH50b6c/yOIqbqCqZisF1W8/wDIHYVULQJoCnPAfm80dVOPVeDTTRMGbcLLCJK9Zp+Xha5PZ+wc3NrrWcHLwOqd5bD03Ho9SbhIcA3Di30G4yeNGNwHejDTlEzQoTiYF0RRL2cnpHsW1eB0HQ/8j70V03WFdQPepxsLI8+zjm9XxnfFWtJ5yLblQorAlexIbCKJRpQv8PZ0R1dtJnhBiUO5icFLySwC4gilkTbaPd1zHJob7PcdiHNHea+8dSp7zzShV0ImCaMwwzP78ea5XD76EYnyV1ZcC4i5FVoPWzjE8FscqfhqTpCSHFTrih5CqNNn6/a/dLVCMrLZXSe+SMWAlHL3C6C3mUOIvDgOqJ88cZZ2uA/VAwPyezKOWvaN7k1Azf4OPmvZ6CXtAEQCEwlvX2uvB1ToPbu3dK8t0vZVjCM9jkzobQEkNvLN8pmGqaBOb4gyLrwdWhEkz96S1+g6Bn1IXgUNcIfWZA5EggdEtYkQ299QKVXo7ItuQBWoP99V61uLnmfndgRjZR65NfWgydkITgnunIYV2wjQyowB4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199015)(83380400001)(86362001)(38100700002)(478600001)(8936002)(5660300002)(6486002)(66946007)(8676002)(66556008)(54906003)(41300700001)(4326008)(6666004)(6916009)(316002)(186003)(66476007)(1076003)(2616005)(6506007)(6512007)(2906002)(26005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sHSPGcKqB2o8P23aImdY4IpTnAtY79KKAVHvcVW32rpcuYRsRWbOinkQz1KE?=
 =?us-ascii?Q?NHvPFlBKSWbygtlNURWJRTt1DPJ3q6ZlmyoGOE9w1Q1KVXacJMWk7obzIE8T?=
 =?us-ascii?Q?zALN9x3YkIh1xUnZSYevMCcKh19ROI5CKo3ifKnxTf6cA1Fj3ouMniJbLvkC?=
 =?us-ascii?Q?vBbsmn6Yd0Ahwiqp3ujWd/ctjjG5S2+c51T7ifhzyxz/MinRfPeT9tLbev2t?=
 =?us-ascii?Q?SO/P+fb69pQ6kqYwEISdEwiFHcQbniUmm/5adOiFSQC9TzstoWMc1gP3ckAH?=
 =?us-ascii?Q?LqCtTrHkKEHUiouEPJDLxLgeXbE5SyXLG6ijqpOkuTiRfV223xBnrA3WxcgC?=
 =?us-ascii?Q?1jrsJ8cYdBXK2e+acBuozorNgq+YZhl8o4KlJn/V3dYeJDOVUMxlGW+Cdy0R?=
 =?us-ascii?Q?/YniBuoJY4ivD/koSULufu6xTaK4en6oL64Q8qpzVQcPnikLsAD33ig6BmgC?=
 =?us-ascii?Q?jMO4djPXrMD3PsYpxhktZhAosMeLu2bmtgApol6IeYhaC8ZSdy0+W4OJ1ZCr?=
 =?us-ascii?Q?OXm2c91NY35XeBqMT8PAoD4soSJPA7tj/i8lFsg/iYeptb5DFybGhFBpFCxe?=
 =?us-ascii?Q?evbpWSOEjoDFj2akaaOGHuKkfMU+miogu2ajOUBv1C1X+lK25pS/w47UqJAV?=
 =?us-ascii?Q?sftd/RF1cgJDaMQLDCbuxlAvTJY382yWSlUmYZi4D0Bqz2FUc6aC26pwC3zo?=
 =?us-ascii?Q?OTENC4M44Idh+UmoeYz4dJeTLlGlru6Q/4bL2cycju6P8XRAtn+S570EUtse?=
 =?us-ascii?Q?rxChUcSTLNtqHXwj1PVe+zfu41dRCwOdk/T6cuYp8nflX63u7x8+Kyvhr/7v?=
 =?us-ascii?Q?g4RUXjwxYdubew3r5l/zHmgY4SthdI8hKkX7pgaUfMYKw65Nb3XPmn4qFac2?=
 =?us-ascii?Q?Bi2y2yn93lThNKid1Nok0mjxTOVi9xPv9hF0ouormY7p1VVTukaXxb44gaS4?=
 =?us-ascii?Q?AKmF6q6v5lmjaF3Nk61vnWkQOJBYWiypNFPtc1SPj0eOZ7DyErZzWkL7gOiA?=
 =?us-ascii?Q?JznAS7G423S/FR6lDSxwEKUv6FTez5z6kpPepjdCXCniGKuxkOh75TGzuQGK?=
 =?us-ascii?Q?Txbtds9Au7GlczrKasV4W0cvjlCtciH7ecGpv5PsFCn1mS+hkMBUXm5Cilj8?=
 =?us-ascii?Q?Wu4CU0ysaEF3xGIJvcUdr5suya7QQoXxGP2NUbDrbXqyHQ8pnXHbhh2sgBBX?=
 =?us-ascii?Q?bApskTeMW1ciyEQ7fTu1UMO/7/SSX9lOfgyQDsn4ic+AEai7kQDGEN46zsLj?=
 =?us-ascii?Q?uE5ss/sYR656wXlC13ocsImg+EU9MHoHyfiYX+cPYUjE1vmUaLsDO9AwkHt6?=
 =?us-ascii?Q?m/3EwgCy1K8DJoOT8UB13cOdJWOw5uABpzjifQlN+KKYHwpZA/nnA8mCrWai?=
 =?us-ascii?Q?HhQoFVzdTNE4l0QjDkGoWiGKuCZeQ8MoQToUjgmoaztk055TysK87cQi/E0N?=
 =?us-ascii?Q?HFLQ5Hu1h/+oRzn6m9af+p9FX4OnZ8i+jSQHTQxeQIskdfaHapX2gSlXWBdf?=
 =?us-ascii?Q?s51D4gRaAWNiML5JrtU0eQbux8WyRO/Ig4z7AQnNEkoV/V6nctjnL7Dtomv3?=
 =?us-ascii?Q?9xka+QJqDigU552oYEdXuEx+0Au9MouIejM3Y8D5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134edf88-c10a-4f78-2b41-08dac637338c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 11:56:01.8233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SspfW9F5dVGF4ZiF6mE3J6T2PCViwYObVFKJV1ixGbzcIpoY1pQRKTiZYPB2ZOZK5MPZkbOvTUcdJUAnEwuM1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7652
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The migrate_to_ram() callback should always succeed, but in rare cases
can fail usually returning VM_FAULT_SIGBUS. Commit 16ce101db85d
("mm/memory.c: fix race when faulting a device private page")
incorrectly stopped passing the return code up the stack. Fix this by
setting the ret variable, restoring the previous behaviour on
migrate_to_ram() failure.

Fixes: 16ce101db85d ("mm/memory.c: fix race when faulting a device private page")
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Alex Sierra <alex.sierra@amd.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>

---

Hi Andrew, I noticed my series needs another small fix which I'm
hoping you can apply for v6.1-rcX. Thanks (and sorry for not catching
this sooner).
---
 mm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index f88c351aecd4..8a6d5c823f91 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3763,7 +3763,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
 			 */
 			get_page(vmf->page);
 			pte_unmap_unlock(vmf->pte, vmf->ptl);
-			vmf->page->pgmap->ops->migrate_to_ram(vmf);
+			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
 			put_page(vmf->page);
 		} else if (is_hwpoison_entry(entry)) {
 			ret = VM_FAULT_HWPOISON;
-- 
2.35.1

