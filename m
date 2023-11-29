Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8B57FDBA8
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 16:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C4D10E61C;
	Wed, 29 Nov 2023 15:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 698E210E61A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 15:38:23 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3ATEDDiV029379; Wed, 29 Nov 2023 15:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=xXNOWrmfOb01nI6Hubdn1Q6iSdOZzjRFCRAYA+dQZfQ=; b=j0h
 4yuUEURGb4vq7BBZOaYejKi/tha43zk0s95yRFaIaGLSBh1OIRyv7xan5Y8+wj25
 qAg5Prq6iKU0nPsW1vNcD6U44v4CyynbPxCE1pzTw9Rfj4sJn7rKeEH1fxC6fDF+
 k8wixQ9GfV7dNHJz61ciwBuLQLI7PEuU+y2yQq4ttpTLPXEgiNoKKLDSKSp8G7P4
 8t39zK9W57GgWfSHNZ2vCCBDzOGmnQgxmJjL2Bo2wMjM4pRN78lubtkh0AcJ4dOg
 kO2/8K/84wVk9AJGy+6SLstD+LjBftXGXbGtpMCBNnGGClvFxuC5/9ZW19mEsL+5
 iw2G8EEoCkIvjhiRszw==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3unvk1rdhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Nov 2023 15:38:08 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 29 Nov 2023 15:38:07 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 29 Nov 2023 15:38:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=js+kxnQ6pu3aMsCM+bu6vVuGpvnYFiDQpvQOXZ0jEgp55S4tTmdLSEz98ADlIBXzFP2uHHh8zYwr7eR6ZvD4W6AcRs8wxfm+0bV0bKxetIv5aPmyaXiBaCxAMZ6qido6rHY7By9eYSq2tvBogCI2Ngere9EFI4j9BgD1H6Kxd/grXw4PkkKwhdF7QdWPR7Flj6TjRK8JB5GjImSmbikOfCNraqDwybJoPiRKOFyFYu4B/PaZ91ArYbhysROBvL3wEvmMTrhtcI5Ns62KbArJI3AnmohlwMKB4RdlKR/YlBgdXiJ2+8GreHtg6uC8cxbq7o5AuU/4W7uIjlbO403Jzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXNOWrmfOb01nI6Hubdn1Q6iSdOZzjRFCRAYA+dQZfQ=;
 b=eB8C+6mNNNSZw0O8OlgQpUu+GeLVQ+gBL8h4duVboAmNpVezm0IewN9b2uL4O20q+pbpm8TT4ECjVrP2/n9zK2+XlMjab672nqbb6EMOEKaTPcrzGRNsZd3MBo+g3O16J9fTjSkwgZYyGV0nReXn2NbzmdmEJbFo/nJa82qUt/J4K9TnQ62ml2C9b3QRO4jV8casVSd8e6fUnxeOR2HdRqFtd7CNVzYYyJJYVvVboljPcl/DuKdcehfQFxLEmkqQHmZbG2yR7uQh9purlCKegyxV+Fk41O7/F82CasbT6IL0+25WcYteEx37dY6VF+NMzIhNnXqICgI6gJJQ4xmnCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXNOWrmfOb01nI6Hubdn1Q6iSdOZzjRFCRAYA+dQZfQ=;
 b=gtfCghYdaRSeuMpHXf5/IGwcMLvPwR7LbdicU0fUkjD7TX/xF3W1NNirp8E97EbUxGjlM5FH+f82NXA7qMiwv4HJES1YIhaXUxqmBki3kt5FCWueZ4B+DyQqybqepkEv0Y7UTea+ibLrRKJHYkGeTkb9r6VkNG3YTHzUZRBlSc8=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO6P265MB5951.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 15:38:06 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 15:38:06 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/5] drm/imagination: pvr_gpuvm_free() now static
Date: Wed, 29 Nov 2023 15:37:02 +0000
Message-Id: <20231129153703.162642-4-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231129153703.162642-1-donald.robson@imgtec.com>
References: <20231129153703.162642-1-donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0541.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::12) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO6P265MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fc088e-c4ce-48fc-b385-08dbf0f12e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZWVk/9TpMzJI5481zv9SHV48BxTWhw8uAgp5/4Be0wEwsKHuyjlhMl6IX9ECj+cY+1HiiUH9kRDGm/jgKTQGhJIUbA1MPHPd2gc5LsIOOUnn0Zz5Pu9BA8xg3C+6rBDsbmbuzr/rdn9jL8Bc4ym2+wjNvf3IJCDCm0PWV2TLNOMnAfF7Fv93nvgwlQK3Wot0wMUNB0OnyUrfp9PNs7UvIeRMkf1bKygmioS50Zmu/LYi1EzdTKZTC2uGqpkvDC3cF5DqQZcF/hV8SYCEovLIc7VJbAYzPzoLbJoXVc0mTk/XOd7o3Ne7t4MSEOj0NfGkLNTaLCbqcvhdraNMLxxWZVIvPhQn5GkBESYRa5q748VyTBhpHTE0TLxz5BGBbLCSpORGuWbOtabLQVZWGtSmIch6s+jtrQ7V9/wDgp47gwncpW0NOKL2ai+D0St9y9QrS2lYW83Q5EHAx8FXkqnY6z76ALX9By4k/+vWC+Rywg7BTR1XFpaY3HlX/H6X+WAzGuRrLmSArWpSHwDUDtPGwwBQg9c1vFAI0p8Vd25ET64ZLt6b1iAgNubVbdQgT9XzdTIWBZiSZW1qmfNWjCUnGW32xUhypRoz2rX/kjhDGzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(366004)(376002)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2616005)(1076003)(26005)(8936002)(8676002)(4326008)(7416002)(6486002)(478600001)(44832011)(86362001)(54906003)(966005)(66946007)(66476007)(66556008)(38100700002)(83380400001)(316002)(5660300002)(6506007)(6666004)(6512007)(38350700005)(4744005)(41300700001)(2906002)(36756003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5tzIw4jXcA68NjYFjo+4roYC7I1LEdUYMlJvwhVtS/pvRDkJKAqWVcV4J9x3?=
 =?us-ascii?Q?+3wrfhM/f8SY2uvjyM3F6B/GCI6Yry9fR1/YT1pbSHEZ4+KgLU7T0Ga5QgFp?=
 =?us-ascii?Q?gqaXtPslVyhejfMoo/Ilo6SmKpJzGAFPrPTpkE51OL4BQY/QikK9vl512Mpq?=
 =?us-ascii?Q?GFgJm7mYNe8kEL3K6bDA6U5A0A7atAXOehKkpSXDsyuOuo9KA411f3KHbIDn?=
 =?us-ascii?Q?bWL+5UaJYRpNFaRKQisfeMUW7Qf+EBfCxBHWAeZfpgPi4m5qURHlkkiLSt6A?=
 =?us-ascii?Q?alYj7ctwXolXtEqlmDXW17Cfz0BOuKBq3H7rKYGUCJ9hluUIONGRxGMbm4/A?=
 =?us-ascii?Q?F0dr8+3HyE7CP0O22lc3lXdppJjVQdXeQff2i4y/30d1YrEk3tQjfmM80swS?=
 =?us-ascii?Q?07M/42e1D/sosZl0/RK9Ngm3fnvZmB1+a+flgusWrKye+bD7vCQvIKPFMbJ/?=
 =?us-ascii?Q?g+j0Ezds/jZFKpo2dhcgrb/fkpInCyhalg53BqTkZeWR1dZsYd2jnhg5aLgb?=
 =?us-ascii?Q?vKJqbFTrWh1fvfjrNtoSqPNbWtiNbFzan9mwr/qZI1I1ydNmYQAkVz6OnUzv?=
 =?us-ascii?Q?71KBr4N60G4wgpfuE6iVvQ0svN1URtQNY7GepeO09bDIbmRULKbw08JIxurJ?=
 =?us-ascii?Q?FspTVNNj5Z7hTZVaC9JgViF3Uawr9+/6yruSb3vXeyeWZ9VehVmpZveKMnF4?=
 =?us-ascii?Q?kibYyCZW+4Y/XaREy1ZAWfRl+GaeoNGIPBP0I5osXBOapoD5RFVXhdk1oLDl?=
 =?us-ascii?Q?cD/8VlM1Uk9ZBjGakn4uxYUZIe8E3R6791on1XPjoctD5dgnH9fgXpNQND6A?=
 =?us-ascii?Q?5Dg6XSKp7CbKjOECgS0QXYVBBegs0Ml6ZhsjhSHceQFls8+G2PVRH6ne2mKc?=
 =?us-ascii?Q?/GsRpPHTerKCz7j4sIEWWXcaodGcu9B2pIEToxAZT6lXZarbGw3BVQizg5NR?=
 =?us-ascii?Q?gDWtbMrRjhI7YC7z+VespZl7vabazEzcXaZqDr/Q/EXICbZ6Zv683FJ/mOp0?=
 =?us-ascii?Q?1SYcKAUHmcTnzMeIIN8W5JK09xwZQbbnrznA/l9y0C/0HQszMlWBYwB3B/tY?=
 =?us-ascii?Q?XehJyRKOWw+rF/cVpXQW1dftwUhUnXpB5WJV5A2UCk7t9KygckOmV3vCRX9F?=
 =?us-ascii?Q?Jf29jWOIs3i4woEO3l0QUa6Uqb6a0jb6yP8sz93DnxRKa6vdagK6PfLLI3xd?=
 =?us-ascii?Q?tXI/pltEeftcUrOTvsOi6y5dlzWSMpVFozVWKx+Q1s74YAgd+xH2hl6qxC/T?=
 =?us-ascii?Q?0TaA7i1GJlOIQa8ic96uysJt7d9cZ/qTRxlMZ6SIxsNwCfAB/hFQ6GKtxm6l?=
 =?us-ascii?Q?kid+oqAp6A0oPaZX54bUbGiN41fk5+Smxruerg77ZIGYQN0VQtz+AL4xgc3J?=
 =?us-ascii?Q?5cpKzSq/rCiS4r7ksteQ6rMj+F6b7PFd930DdSbs/OGTToMtBgkIr84OkM3e?=
 =?us-ascii?Q?NlVLBTdew04lKCZBUyavDlbTCxaOa/TX3CeyiGRjkGDxPcPno5d4tUaSEZga?=
 =?us-ascii?Q?+B9oY6fnLQFdlecNYZGN/NKkX8KwqTZ/fr4OPRLIKoVKtoKoBbOOo+4HGXbz?=
 =?us-ascii?Q?f+VkFOseT8pESNW2TZjfDd4S/g4eoN1irjQEllyyMTuy8gKFUdTafVEZM4W1?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fc088e-c4ce-48fc-b385-08dbf0f12e6c
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 15:38:06.1077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaFIuG801Xz690XeNqFMgmj8Xx+mR8gsmj7UkLrq6u3PwEN2qkDCq/th+WqO8+eQUOLm1EDcUa9gH4Z0nsRbPd2pnJuD6tiQN0BP94xi7uE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5951
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: 0H8WikpzwYWpgHjf8hkrfgDEvGjM-NhA
X-Proofpoint-GUID: 0H8WikpzwYWpgHjf8hkrfgDEvGjM-NhA
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
Cc: Arnd Bergmann <arnd@arndb.de>, mripard@kernel.org, matt.coster@imgtec.com,
 boris.brezillon@collabora.com, donald.robson@imgtec.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reported-by: Arnd Bergmann <arnd@arndb.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311242159.hh8MWiAm-lkp@intel.com/
Fixes: 3c96dd170efe ("drm/imagination: Add GEM and VM related code")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 04f7d0cf4188..89eb6ee1bbcf 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -528,7 +528,7 @@ pvr_device_addr_and_size_are_valid(u64 device_addr, u64 size)
 	       (device_addr + size <= PVR_PAGE_TABLE_ADDR_SPACE_SIZE);
 }
 
-void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
+static void pvr_gpuvm_free(struct drm_gpuvm *gpuvm)
 {
 
 }
-- 
2.25.1

