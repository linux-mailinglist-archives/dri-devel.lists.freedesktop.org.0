Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C11A1021B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 09:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5B010E44A;
	Tue, 14 Jan 2025 08:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="cTbdG2LS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2123.outbound.protection.outlook.com [40.107.236.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B236410E6E5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 15:28:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p8b8kRkgIRGTc4i3gMO8UdI/STn4irVoAu40JA5i3VapYK9Xv3qgRqjSZ32SPRz30r60Y75vZ9kVcPrC2rxjOWDekS9UeLEV1A/oaIUUUqyKj2O77DY4x4GHkBfEkOF5q9G22WMLH8t+tIWuK5KhOtGMgpZvVJeHszcHxbGH8U0ZKBVREiEzA4IKYQXMYNf9lF1iQHhwtYPxTGqLtN6Wt0qsJNMh0Oerp6eFCIstAXOaxs+SycS0lcsAiFmQcte9b0Tbhckb0tQ/fE08EvmluksTMnNUPoydN8oP4vu3bXFDKYWP9qYGd+/p8UvtN9Y5JFX7ZeJpG4I62VRH2ALqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3JVBf06rT6OZJlPNsZPT+2+04Zi3Zhs3/v+TZCc6e4=;
 b=S3qt/UhtA9cGqQEux1qtGee9XVJ9zxHXtg0w+UbwKOiB6Xsr8SVa0s3bki20oiK7L5sc1E9ZA9LFg+UaMQyJa0fDURq23XjM76V78lJ7KBjQMhw0TsF99yJIsRYEcn/FMGlHQ3AETR2tZHuR+xZUqZOJLxyZA1YLtGuyRxM4kYKcIamiNZVRjRByXBU89PmvFfjb0bSutlzXNY0KP1xQLdNByFXyjhSsLfA0nh6k9MZXNna7Eai6MQs+UfGpb9NlKyo8Dqt3L4ZmbCeiIYZntm7VZtIzqPqZ0t93fdD+xz2pFpeAK4PCit3ujdrZKJFF+tTQSOwrdrhDp2/s4lQpiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3JVBf06rT6OZJlPNsZPT+2+04Zi3Zhs3/v+TZCc6e4=;
 b=cTbdG2LSU6cP0QjJRnMu/IdDre528b2cNSE4PxafRQbIM3BSYRSqjaH/t9/Wsgt+I7v3SK8rdpR4yCXXgdnhejDTHnnVq5SAP7p9lo2rKYaJirVPI2+h/IgKsm8KmGQ6/Gr30w9MDUPYGuk25FAaWX142k2nhz9msunG618m4hE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by CH3PR08MB9065.namprd08.prod.outlook.com (2603:10b6:610:1c9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 15:28:10 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%3]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 15:28:10 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/ssd130x: fix ssd132x encoding
Date: Mon, 13 Jan 2025 15:27:50 +0000
Message-ID: <20250113152752.3369731-3-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
References: <20250113152752.3369731-1-jkeeping@inmusicbrands.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::20) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|CH3PR08MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: ea36fb3f-9650-4d2a-1c9c-08dd33e6e307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9ltebddyMWGSv6asHPe715TDv3eoEW+vrarFWGZgeRSi8yZJiKu+EHvaWfte?=
 =?us-ascii?Q?PM7xAUYTYo76l9rpaGFJwXCPyTv+cTCzmIZCsB1GxDsOYjesQiqXmZhhXOih?=
 =?us-ascii?Q?hvvrcdUoUA8jorDp4OYuF4evs5D/OOBEnIE03HOz2TgpYMI1y4OWjS7jDYuy?=
 =?us-ascii?Q?CnByN/L0DMDPEnkS7JGDs+woRsj/SNsxROaUGeyVAR5wWiif/JEoTa9HN3xq?=
 =?us-ascii?Q?u2flF2H6f8KH3Z9gBFKOJ7ZMzZk1WUT9LzPL4UtD5dD2mUYhNdPrJSz7bgb7?=
 =?us-ascii?Q?D9MyXjARuOdhiYzv4fYKOl5ln0muP+sy0H/Wmq9dA17cGwXwEE2g6zpB5S27?=
 =?us-ascii?Q?aNYZKTY9f6yEfhx9NHPv9qXEdbRgcZR/7eTt1OwPv63lAcYNKtBYaZIhZfgG?=
 =?us-ascii?Q?zyCibXmYZ6V06a08hCyEGiFJNd6q3h4zL9sixWmuOUhT81Sl6zmNz5armRnx?=
 =?us-ascii?Q?0t7qt1c1g1YtyLkHFZLStGwBND0P8NXb0zEdtuTXTWeFgQzL26DD4ngrCMwI?=
 =?us-ascii?Q?zWcjs7nDvDM7IA1lJowmAPF7EjiDKBKH9Ag1CmD9WYbsd/LF2tUndLiMmF7t?=
 =?us-ascii?Q?8VjlYI6ZKJZ1in1NTHWlkNXcdEPODCwERDJbssx57qzoHMFbUCWxtLjxXETk?=
 =?us-ascii?Q?7Rsy3G3EQI7GUcuFpHY2gI7uP9+5okY2N+LWAzs/M3rCptaWPnrUfBbHg5KD?=
 =?us-ascii?Q?4QHM8ac5KAi9/LGK4SnaenE0jxs/+G3EumIg4MhfpwBdQIM2uvd6B2ULfbRh?=
 =?us-ascii?Q?60D1WSJUXX0u6rQeLol0pGdMc9CKIZclnZs4PTnNLYU6yCFmBoiwhIvB6gLB?=
 =?us-ascii?Q?Fu5EE9hks5EbmXlugiUnsWTJgFm03WLV7dX3tKFSg+eUYbKTrRh0MIM5wxWt?=
 =?us-ascii?Q?041DXdpglcQWU+f3hNMNcRNz63mZKGlJ/f8pR/+nh/g9VGqtRZk19oTYhNfh?=
 =?us-ascii?Q?8M7QECnDlv5EAMibTwnFlSpKxFXUAJbo9eZXtWifws5v9/09gMkm2+gut2on?=
 =?us-ascii?Q?sn76Pv8qnrJ/PJT7jhRQo//TIA98uwxG1KFRt5vhlAHf0XYdJy+5ns70WdfE?=
 =?us-ascii?Q?5XRaW3ErgXwqJDnPa6TXhTVqx22KVL1dH2cCnnPUN3ReGYlOpExq9HKUko2W?=
 =?us-ascii?Q?So//jOymrcjzcc0++O8SIn0yocaXOHaMh9h9XxyVzBZfdHksrt5NQefPqpif?=
 =?us-ascii?Q?TAmERXhSVWf3ZA10igXh7FBd3EY03bP3etftzMSNaQbnA02zs5Xx3SRbBGKf?=
 =?us-ascii?Q?Jy8gNubWcN75V6ir9MIfjCKuuAXkTbR/h44Lxa9JWwjEYk/Q5bK6NcOk+LGM?=
 =?us-ascii?Q?ReFj6n1K/4rqkfrGB8liumPe654up6kq2I+izhiW/Kl8oKqdQElgc9sRaHlW?=
 =?us-ascii?Q?IFMH1IQFhsK/lufTjFj6PKiRCGQUOzfNiFP10NSjAOuzHCUfTq6p18v6gI+U?=
 =?us-ascii?Q?OfMT1RUtHVerE95ZK0zw5DITXs40MJcc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR08MB8282.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?n/OZ1D3Hz9rcFegNEv0SjYK9D1p5pE9TW05KgFKW2MrlIYO6kvd9DKG4xRTu?=
 =?us-ascii?Q?8yAcRluUhQkukE2CSBPscisktSaF996NBPjcfwUlOekTT7H2LlV+E27UNMJe?=
 =?us-ascii?Q?lUpcQKFUGRXk61RH+m5trofxUrHhvqzRbx0Y10vFm2VmQuqXqNaN+g/JXa1X?=
 =?us-ascii?Q?cCkekXAE6+2wAU5Csx0mxZbBGlbpS5jQjozoqHdcAyLMpq6oJrAPZAQceg/H?=
 =?us-ascii?Q?OMNdUZxr404CRYtx6jNpVGDuep/84URwYFjPwyeahO9PcgZMBfNYeuj+nHho?=
 =?us-ascii?Q?/QUqOz9XUVW0Jw/PMytnXOGBwh3unzca0PG8IHkMbEHk8Up4of8wgweBq1Wd?=
 =?us-ascii?Q?4Hsk2m7XQa/4EpfwOyw+uCOLlUJFpq+jr+rkMWaJPJmPjIx10s5hhPC4ISxu?=
 =?us-ascii?Q?TEhSQAiVtcejlKdhsscQ9jfWKiBh2Ha9VCm5km6/56/3CIkh+lRWunqxrfD3?=
 =?us-ascii?Q?EVf990F9mqvYNL9u2Y+Qt6SGxYV/eW2JGxEhB7yuxnuCwRVURYKShJFP7Hhy?=
 =?us-ascii?Q?abfsv2s38hMHZsRYF1pmwbQhNuvtbJ8izNW5U+bT96RlLHw6MdBRm1Rr73HF?=
 =?us-ascii?Q?9lFFOKsaOifZafKRQIAh0EO//cFTvMNYbmH2OGDWVmdQl0pvgVeq5dXx06n8?=
 =?us-ascii?Q?mDP8ACVbnoEgTAyQMgoxj61G0XN14OjehxQlmf/Cge1mpiunAWtJfO3nusgL?=
 =?us-ascii?Q?0BgTuW0EDNywJXjloBMC9rSuPe2h4bJ/9eZ7TamcCf6yJGztyihI2meF3Yiv?=
 =?us-ascii?Q?EEqvI6puR02xad+4K6r5YjevONwi5amT/OBM2sQHaqVLYcmBMsernVkdAMlW?=
 =?us-ascii?Q?GNkfFUVLx//dZW9fhSlaQtcrFytI4uum7+WqIzWRBjCF3ST/p+xxa/z1HQq9?=
 =?us-ascii?Q?gozShFyNC+wGx3wrLRfVn0I+azT5E8/3seqoMwuBdk5nFkwPRdmU5CzxB/UH?=
 =?us-ascii?Q?sNbyLkF8l7kLdThCVLwcSKJKP3OVBXUnpN//WQHQXJJSU6lt+VnEjhal/Yuu?=
 =?us-ascii?Q?mqlHtH8aJais32TYwzxLS9ICePPaUt83OjdkFY0oG2dxPCPSZZu2TcQBIafT?=
 =?us-ascii?Q?feS1xwbLHIPqJ2KVNoCu9/2nVtdK1Znwbk7uplgD0qPd8xvo/fN5JRC9aJXm?=
 =?us-ascii?Q?fx6q2NZ74NIlc6cCiQsMnJM2VcU0PHASz/wHEKcFCPksOe54skk85FJjGlbQ?=
 =?us-ascii?Q?HMgYvyIhijryPXUy0LZZzBVHqY7VVaDBRg2XDHnmuoa/+jZSjTxobOyJQnhR?=
 =?us-ascii?Q?DjviSypuesH1SJLrVRKCrBS6MRyweTpd8dl5alYikOM5ADvYxX0cJZG7aylm?=
 =?us-ascii?Q?eIcXP/S6ktbBfH7B0Ks7twdMWby7N1eC5BfkZAHOkxiwlROdGthq7vIV3X4r?=
 =?us-ascii?Q?5YekGkFEvtAWKUGobzYTKB5PNWYMygPFWFS/hDoju8JYIEACj2naR3uGcG0g?=
 =?us-ascii?Q?B8mym0jagElQr1VxuTCXgHyUPLJFDl5TY0wY9t6IToK1z2j/pKN1fAatU4qD?=
 =?us-ascii?Q?8qIyZ5D9y3GNoDQN4fpgOf5+W/3XHrXojfiLbvhiQYYQXLskYQTAK7BY3Ah0?=
 =?us-ascii?Q?VRV7GhwYQ+O9KGxe1ObkVJZVCIfPrXhTqx98U4eoQxp7ay9cFSYzda1zfk5s?=
 =?us-ascii?Q?cA=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea36fb3f-9650-4d2a-1c9c-08dd33e6e307
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 15:28:10.3428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zip10aXRCHB3C8z4PJVOiW/+lE+k9u2GSypOGq35E8jep9o1nlULFGF8iNjC8qxBT+LbNtDVVnTGjj7eIvfRBu1noIbDQSI11/DbMoHD7vQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9065
X-Mailman-Approved-At: Tue, 14 Jan 2025 08:33:59 +0000
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

The ssd132x buffer is encoded one pixel per nibble, with two pixels in
each byte.  When encoding and 8-bit greyscale input, take the top 4-bits
as the value and ensure the two pixels are distinct and do not overwrite
each other.

Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/gpu/drm/solomon/ssd130x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 2622172228361..64f1123080996 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -880,7 +880,7 @@ static int ssd132x_update_rect(struct ssd130x_device *ssd130x,
 			u8 n1 = buf[i * width + j];
 			u8 n2 = buf[i * width + j + 1];
 
-			data_array[array_idx++] = (n2 << 4) | n1;
+			data_array[array_idx++] = (n2 & 0xf0) | (n1 >> 4);
 		}
 	}
 
-- 
2.47.1

