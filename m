Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A18812D09
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 11:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1525110E186;
	Thu, 14 Dec 2023 10:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F1C10E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 10:34:45 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BE802Tw001848; Thu, 14 Dec 2023 10:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=LAGUe2B/RBQTEREPl9wTD
 s1Izsez/CTwKRo5fnnmk9w=; b=oDt6dBhgxvUq/wCgUK1lA9Cx2y510P1ffVFm3
 ueEKGP1cinlAMkU1D6OYSpquz1Zu2izAaGmphCq+VV6V61cc/GErJ0SeNhKyzO2i
 RKBjA0X2wdGd5TT6HwcihlKWNoJDXxRHUstrgwrquz8Ujbw7hyf1Vdynu2bD9INO
 Wb1pr6fVzfjogUOgQzP3u9+3CKfUszxx8oZQbf2botIGjYsSGCHEwf/nQNUp99cT
 6UAa9PIWapl9c+GxCWByI5Ss6mNAw8OfiRHEfXbIpw7Uz5Jh+MnTiYvEerFAva8u
 wSW2MMZUqpXYuIPUxWGMx0rt00fUHC1krwUg/8/M2yh2vUudA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3uyr3u87ty-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 14 Dec 2023 10:34:35 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 10:34:35 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.104)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 10:34:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nI1z6AlvMnUmDeGawBafmgeuqCYgkXVdT8/dWJ/Yu2gekUbBeXdgrdbAa5nKnltDIsoS5o3vV/BIJ9cihjn/H0a/ygqiwzMhnx1QXSOL9UvJ3n9zRhkffZDj5e4qnCMYXKrspeyMggU2aI7TBVRhVgsQngvqAdZc/mOX77iN8LiKlbjjmTKwHv1fXmiqELLv20D+IiTUFVoHF7MfZnLOkPMGqFMfH57/Q+ewANnZ/Pg/nuE0OpdzXRBg2Ri7+fOHF+JX1zvCsJTZnmK/9chh6xUA6I10UYbRuGlklu3w7H0QTvHHlr7UkwqwjvD/KdgcAUuJSZ8YR94j71LQk4cxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAGUe2B/RBQTEREPl9wTDs1Izsez/CTwKRo5fnnmk9w=;
 b=D1f/9vFAkvY0AqDxP85UZvfT0sEe1wrD6wa59Vj7fh5/MJm23ldR6z40sY4b2Y0CVRLJHrZ/Ie3mLjN7aVIKSj2e3DNdhVEjVjPR0z/Sd7l4Zb045zj/Vd2KZSD1xsJh/XspSGNWIUribDn5OS6HnfHpdIL7MomemE/E32P6EqZlm6p9pGTzBXvC4WxMZG8kUVWVOMRG5UB+ez8pMf00I4S/xd0kYh9WVVH+U05dYsj1wWgEYfTCTPyPEeT11VmE2C6ZuYb+kiuaK96xMFriC08hTA24LqTVDITDf/ab0plGmwQsfnryFTZGPUyc5rjbcLip/7azVRBHhSrL3IdmJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAGUe2B/RBQTEREPl9wTDs1Izsez/CTwKRo5fnnmk9w=;
 b=RTVl/kGhAVg7pfvQyDURrqV4gp3gDa86qB5HxpM9VIYoIW+L7W67XXCuW+ol32hmIe61vyqD4SljwB2NuB21kiMlVaOIz4ygOJGZrw7My0wroOO6kH1k/JZ0h/sb0LPHKzWeBfw14SNdqFbfUeBhuS3+Dk+g2uESN/w6+1htQ5Q=
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:23c::11)
 by LO4P265MB5915.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:29a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 10:34:30 +0000
Received: from LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2]) by LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a3f5:aa1a:ff75:79a2%4]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 10:34:30 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Remove Donald Robson from powervr driver
 maintainers
Date: Thu, 14 Dec 2023 10:33:53 +0000
Message-Id: <20231214103353.122257-1-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0095.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::10) To LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:23c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB4600:EE_|LO4P265MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 619c71ee-c6a9-4db0-94d1-08dbfc9040e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8rjwceMH3h9PoIhsVgupZdE7QKdtLUWDUT+2qcC0s/iwfT9bAP3Ds9UGy+IhnvoETbyQlxnpFrKQ/duG7kHL8okP1ANrxx78Y+QoiMrIwx/l3wx+eysnn1uUAvwlHasvL5FUfqqqXeNh2sPiXYTDmVZkZ8WW0UeWhkPSoRyaOdgUehDNnYxd4V/gnZXdQjhOkxYgRYMgs2j0swtXNKPhOLyobWMzDa4C6T+kK4SQQ07lnrZu01/dfCYAC15we5UZk3cgB92tBOrcuEMPfGwVvFp8tyybozFvrMsNWS4Fm0ZYhFzsZ/aMPgfxdEA4igN0oKS7Vc82m0OlnPFHokKiE6H7VHCfk03h1+sG0Nxrgy27eGTqSNno61fCADEMOmCHcpIEVlCXuVbKj6kc3wOYSDxUkbzpXIM129g6C/iE8b3BtaBtF3AQtcpHui1QZCV9gQQckKnVuOokULu/BRctUfv8B9BRGJvr/hGB6FsX0j/1mdZBMjpOkgMTh/Hf/Po8KBzaA5GriAwZieTFYiPdYiwf8ZvWkv+p3WV/XjiHOxPVGKq6KTW1duv2wCLRqeZgQ8suvmTUPz1ZPElVHr957dJ6EGjIVFzu+La34NfylmqBIURSb60jzFXAk/hWOH2F
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39850400004)(346002)(376002)(396003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8676002)(4326008)(8936002)(44832011)(4744005)(2906002)(4001150100001)(5660300002)(6506007)(6486002)(6666004)(6512007)(478600001)(52116002)(66556008)(66946007)(66476007)(316002)(41300700001)(38100700002)(86362001)(36756003)(38350700005)(83380400001)(2616005)(1076003)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CO/v7lR7oj9aeSZpyunRg8l6dNs6tIid1FwCaXTGGvW9XbxydBSlGAzHTkb7?=
 =?us-ascii?Q?D89vC8qbg5M8D41SmeUzWSgpoWA20pxYrqZHbEovOVmPjdHbUin7h2OLvCpg?=
 =?us-ascii?Q?aULChZFmDfCvOpEtE1e6u8A+lGXRXN5MDSgQTIbE66KVxFLea6SiHvNJWjgE?=
 =?us-ascii?Q?CikPqdJtN6FpA62j4qHFf+vp1uTL7EdjxLz4Wa/uBm5EOnp/PGmtTmKL747C?=
 =?us-ascii?Q?6BjAFNDqdbaz7O0w4DZ7etYGGmVbpYCr7BMFBrRGSDsE4zc3EMrJIhSUE9B7?=
 =?us-ascii?Q?AtNem84eSMwBf8kix5hTmA78rmRXEwbCuNvb4CULkn0+Qu1ONkoIxCauln6b?=
 =?us-ascii?Q?I0P6nHmE7WRHZ3vS471nWtxlBadPbZ7TNAQIjT2vYiKQW+Z5+H0SV9MZQL9S?=
 =?us-ascii?Q?v3/LKq7mdg8NGq9PqFSoJZbecSCwef+tQmnLfjTmyevfDYiibJX+TKAncUsi?=
 =?us-ascii?Q?0QdC6d8gWLvLQlqxXyECnpu9VwWRx9bQRHQYzhK3NiDkF/BXP5rj3COWkDZC?=
 =?us-ascii?Q?E3QlQGJJyNsW3nKR9l9g/nzBCGQKOnDSkg8zcvoCyQfAmV1RhPOvd0kY/8Vu?=
 =?us-ascii?Q?h90ariBnVvrByO/5MEjCvZ48CZHXWwtmq8CU31225ESri/YoHW8F+8YjX6RS?=
 =?us-ascii?Q?M2PmX4Aeay53BW1nHkrW3m2tJpGNVN8JvOqAUTMRuoPTOfkVIc5IWGnh+Y6E?=
 =?us-ascii?Q?CXki3qJqIGO67Ydh5l8NkdkNJNExg8Dni5VHPxD8AslVwPQfG/eRb5vVFOMA?=
 =?us-ascii?Q?PJGwNhOeURKgtHAY1wGCrCD7Id3Gu+156jSNtmezpwPd0KZnndqyCAIR6zaK?=
 =?us-ascii?Q?D9fJ01AeLQsh6CfzPZlHuEWuxyPaEeiPZDI1sJR1YoWeA4zK612ieaV5cbE4?=
 =?us-ascii?Q?nMVmxoPtUslVxyzNsGMlXX5rPMzATBf22ehwg7E3DneiMaV1eYvWmf/mVhgx?=
 =?us-ascii?Q?DvuEHih6b+Ead4H0WCVe7uXIc9S0t2LeS2EAml2bb1BLxkbE2hbllh2Jmzoe?=
 =?us-ascii?Q?B4EDCNZsrNfVZzspImsFRJQWoGD/o/08plS53R0HOztXHqOLfu69sP6ry8rX?=
 =?us-ascii?Q?f0qN+fBq2PnDf5K++2iV+aDv5UmwcgSK5k4NktZ9qczhgc6EsfgL6oE/vbos?=
 =?us-ascii?Q?L0DonaQ1H+DrwK/c/UQBIOxPkwePHx7qncPRBzb5Be2ya4vKgAZFsaUYn8V6?=
 =?us-ascii?Q?Jgw3Recdv9LudKC+fK0qMVf90DvU9k7nLzMrag4VMezUQkU2JpJLmlEOiUAE?=
 =?us-ascii?Q?9fYBYpbIJXm/1CkKrH8r6+psD9A7W/RnVx7jLaeF2DXVwSzei4orQXCK6u/F?=
 =?us-ascii?Q?XU2fv9hoOUdj8Z94Qjba80s+Bq9c7CJHhPur9OynLKwGRJib0rB6VrIITCKA?=
 =?us-ascii?Q?gKwtOFX9NIrNElNogC/e/oTd1OUSe+2RXlPvxduXDhfK5o5kxXkzdGCbnqNu?=
 =?us-ascii?Q?x7P1pMNTMfd2IBfz7LzSue9nEJoA1Ph0aVhNSPQFNgN6qvWL4likjyJP4pje?=
 =?us-ascii?Q?58qpn218oqN/E6hH5/HU3ETc2ueXHAQKPxf/9vRAOVxLVZQxxTDldDif0eDj?=
 =?us-ascii?Q?si2Q/d2WGQHBWLnxpHN8bzsEbYW6/nEF6ZiZgcmBPa9ece91Ji11hMDXtU31?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 619c71ee-c6a9-4db0-94d1-08dbfc9040e7
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB4600.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 10:34:29.9203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhsXsndPWYSV8hp0HcE8qTW7tKOvdDTEIAvRSu2Z6LguA6X5pW4Zm/BBRspdXBRLOBrvtdc718M+uN+3bh7TxSNUXLysZejPQD3EPRD7Uho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB5915
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: tQT0zu_b0YxHh3fEl_7iGe8PNqjESsNj
X-Proofpoint-ORIG-GUID: tQT0zu_b0YxHh3fEl_7iGe8PNqjESsNj
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
Cc: matt.coster@imgtec.com, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I will be leaving Imagination Technologies on 2023-12-15 and will no
longer be working on this driver.

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4b46b3db022..0eba015ac5f1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10394,7 +10394,6 @@ F:	drivers/media/rc/img-ir/
 
 IMGTEC POWERVR DRM DRIVER
 M:	Frank Binns <frank.binns@imgtec.com>
-M:	Donald Robson <donald.robson@imgtec.com>
 M:	Matt Coster <matt.coster@imgtec.com>
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.25.1

