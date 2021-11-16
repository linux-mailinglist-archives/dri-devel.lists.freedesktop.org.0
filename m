Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAE545313E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 12:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFD96EA4D;
	Tue, 16 Nov 2021 11:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500DA6EA2F;
 Tue, 16 Nov 2021 11:49:45 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AGBDbbH016941; 
 Tue, 16 Nov 2021 11:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=rqo148tyq0OmgDJ+JPS/o2HYUH3dNWnP9X2qkoLCJJg=;
 b=a1aeU+AaurEBSsKRGdq+5rxrA+LKizUhZrpO5aooongxizuSYucdbZc1qmxRMl7R4aTP
 kzB7siEW0pAvcC79hLbMT7L0ifSLLY6t6loDbEoF/Rj/gxNhdIKGLWaycxrrI6/n7Pi6
 qS0Xadd8ZhLEb8TRQHJ3iNCggvEo2aHbCqlozR74LdIUky8E5B/S7mIjASqkoZP5sZlJ
 s9xjUvpKHvUXeS8kjjB/NnjPO+ZLBqOr9R48SL2qqdE8WTAhPlpiqnt734BlYsmgMag7
 SlxGK70TyE7vlSq+vslz4AD7HxrjYzVwfyLYKZj7WQKsXIMLZO2kpzxyHQ4GdC1ISH3v lw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cbh3e0s16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 11:49:37 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AGBkCT6167122;
 Tue, 16 Nov 2021 11:49:36 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by userp3030.oracle.com with ESMTP id 3ca2fw2emb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 11:49:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOzKWEJv7eK/aTbmMtW9Ohml0Ul1TOt32lzWXzEdRshu20Uy4EOmPTz0ePJiqqRZjuh/9rct5+MMJllnOClTZ9LTwry0qyHwvZ1mjAJ1UojjVARd6X5n2gtBDyQ0fKAseENBu1s1tCNKn7qIDIwxZucRpY8UGhz9oaSwb5fW3aBtqoaLUE/gSNELy7lgLKHawj8oX56VD42+f67XZ9aox2xMJZuucq9qTDOgafV3Vj2aIUbKuZX0STRu92AR/l2Kvr1CHG85L3aKj/uaMWF7AXNPJolDxNC1/0z/00+TXVHJ+Iu0kUHINvZ6JYbqJUO5ajWqo///fsVxzJSfFFkPtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rqo148tyq0OmgDJ+JPS/o2HYUH3dNWnP9X2qkoLCJJg=;
 b=mC7vjyvmeZBKAI16nLAEGv7o14eXhV4mte6bzUvyJdiSoFdqQnQeEW75ugLQGnEEzy6JWlpecHAPViKB52fjciSM+kY3f0Ue72T5ll+yrVyL7GvSYFOngRDL+KbG8XVi6xpMNm074ZAk+jVei9vMbKZ9eTQjSnGbdbEZviwlCEDmHXaTjVlT34jnoRiOLFavmcjAkiqBjji/8CKeGvukJqSdS/7DblLI98MPs0fG4FaPmsN7mO40TlYKNNkCIKm8Qb+uAcq8hZw4VebJp7rbK/HRNptzT+7ByitClDJtEHgmlDnwWdy/n01oRRxbYennMdUhtM2cBbSjQYPJJbKvhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rqo148tyq0OmgDJ+JPS/o2HYUH3dNWnP9X2qkoLCJJg=;
 b=ofeQgiVHyRyV8EFoEx137bL80vdRqkGwrTSfjy2vPz5nYyLkmC+4mVBRcv2hpPrpC1gTvzKKNsBjB0kZEhW0SeW4EO8MQTX870Lta1bve4MiYVpi8gphLadeSFKRL3QLWhcvXTUxJ5kJN/65JJ7qxSnnQidTPQ/MMAnOoDNP4Pk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5851.namprd10.prod.outlook.com
 (2603:10b6:303:19b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 11:49:33 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Tue, 16 Nov 2021
 11:49:33 +0000
Date: Tue, 16 Nov 2021 14:49:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] drm/i915/guc: fix NULL vs IS_ERR() checking
Message-ID: <20211116114916.GB11936@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0123.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0123.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26 via Frontend
 Transport; Tue, 16 Nov 2021 11:49:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5be26a3-9332-4768-dee1-08d9a8f72836
X-MS-TrafficTypeDiagnostic: MW5PR10MB5851:
X-Microsoft-Antispam-PRVS: <MW5PR10MB5851BFF3407F3BF43C9BA07C8E999@MW5PR10MB5851.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y2nLB3InuKuWoGtOhgEKFdZ0loNN2FoWpXESd22XU5GJ8kbr1ZmLo/h+YlhGqachd104DWZA/DrrFDx9PsAVpX8IlO0QxOT8xqytsllsp4Z/UJVXI4j5emyOZaRCashXx9aAulYXgteDlp+Ndeo5uCWZgnIMnfVouJGKbWbuVrS2Y/N02qWySqtWOh0IzB0kZmmDPmd/kiSwg/wXVpRw+m7kuelnkiVXMODdp6DnkqOa/5KK3VryH+jv/RoyuZzFxi3drp3MHLcKUyzNDx4CBAHvT90sk2CVjW4wXMzb3YjHXUZ09/2ivDMKviueWUSgE9o4bBbaSzN2YI/+qjuccxSMHVtnde3m/87RCSfu1X+jE36lUKXYlF4BBKBe+B/leLl9SoFAHAxOfwPoIH7jfB5m2t2pjtVZm5BXHj2a1GTmSM8wW3/KbzOmkKd5dghh+D7GMuZPTGlQnp/04zK0SIu+oObczXBIh29Z3+DKxtcG6II7ZOL12OE/jWuDsuB2KhKdFWVIpHxF57X0jLrMTlmA47b3yc4RhaupvKYIGQJ4A3aU8HdQNMvs/w9aYCEaAg7ssrMi8ulrGAfxY5eCYe2yIZSpZnxgCsUQqWdtmxdo2GuHmXpjkHhGIvCZ/yprI6kWDqxuBd7xJYh7zfMNUhHidTwcB92topRCtnvMdK8IxfOC/0M2PSJxljgAD30tu+KV7xVhORiAXfH/ZbUGQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(7416002)(186003)(55016002)(508600001)(26005)(110136005)(4326008)(66946007)(86362001)(66476007)(66556008)(83380400001)(38100700002)(38350700002)(5660300002)(33656002)(6496006)(52116002)(9686003)(6666004)(8676002)(44832011)(2906002)(4744005)(33716001)(1076003)(8936002)(9576002)(316002)(54906003)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zOJW4OOuEEj8mcqQbMy/rzW6mokbqrZJWrOa2kDSNih1KJ3cu6rUaznWnn5W?=
 =?us-ascii?Q?7xeyHLcHccPkO6jo43cdkiHdwK6goXfOQUgI6e6OpD/DJSrC/QcmeXXND8Iq?=
 =?us-ascii?Q?FRBTMGljESM0NohAIpZTd5d1ZxpT2OaaO4MVKNlq/QAznFSwfe/NTuWzqt3u?=
 =?us-ascii?Q?ErSTsdn2xFg1hf1QzFU8aMeSjFcBRflUaI+jT/Qu6/y3vQq9hScxi9nFlJYh?=
 =?us-ascii?Q?GkiEVoFV28bP8weJ5Nlr9eK9DnAFOrXIwdU9T8Y+wdUdHBn9006AYppbXaYJ?=
 =?us-ascii?Q?qwa0g6Jcm2sUUGzRHziA9I2hJCyBXfhV8dSVn6xncHT6Ps4n5WXRIjMN3usl?=
 =?us-ascii?Q?kh6F3dl6bcCYX2SEq+Gom+5PuOj36JNL/X8G9fDvCStKh7BvBMpje/b8N6Xe?=
 =?us-ascii?Q?047Yq+C1Ch5IR3uNFnDBBv3U3TrmlLeiJ0PWV9LCfrAjQrEo4uz9Q7lanyGk?=
 =?us-ascii?Q?q7It19uk8OI7WvlOdM8i2O6cPs668pMwtX03ZkueCiQ8YeB3kZDt+0F7JSjp?=
 =?us-ascii?Q?VFP/QcU4CbYZ6XWGmNfaJcJws9zSh5U/Acu7gSCvyySlcF48ju8mrm1G+b8d?=
 =?us-ascii?Q?tVmrJEdJUooI4Q5NmkJwIhmh+9/xMCYI+oPKc9H7oooder0dAbX153yEilux?=
 =?us-ascii?Q?7Mzmi3uoKren7lR6hAJf5cfZK5LgTUHWxNbLYAJD0gIqv/C3hnUmiXeVZNfl?=
 =?us-ascii?Q?qmHXH8jDDHuOgmxY19/7aQMeb/7pnIiJiDROCJj3d42yETqZPiXKMJ7dLQ+a?=
 =?us-ascii?Q?79WZOTBtg+Qi3qjfsOdACe2lgYySYIw6iOg3oBcpmzijUls+BSGqrVOd5oeh?=
 =?us-ascii?Q?DD9XIXfeZa8PV9qRaY5e19Q0SXNkuMQHZFSwbWKclUCpFUFtOEkJQZ/ZSrm2?=
 =?us-ascii?Q?CYgpHQnor4ZP4ptyMZeNMnMVvu/O+OZ5ajZ0ZaV0YdD44w95Q9cSQvCqQqkG?=
 =?us-ascii?Q?b5fUUrIQ9r1RaxeaVy5LHPnm7WVKW9SbDmGbKHqA4qY2NP+G83ooWPhwg6AW?=
 =?us-ascii?Q?ZiwFIEEMa4El8T1ZK5EI9KptWAvh2dPCQBFwIqt6RKUe24EZhVPlZ10HCyp3?=
 =?us-ascii?Q?XNhvXgVRiO7bLGCL8veoNmYaGzrP3DwvzWlzxAh3lsyafNl6ZtnCsw9wu1bW?=
 =?us-ascii?Q?8M2qclSe00oT9tInxgcfTQcR2YdE2eVY57Uh8+sdk+iNeB0+Jh1e8ruzDBkp?=
 =?us-ascii?Q?dnoaVVHyEDtgN9XrJz/AyM3BOwcTEnNfSphkId83ELe3xMHjk7BsASQhafbO?=
 =?us-ascii?Q?1Fv8cVIy3IdNqTTiPsgyIcmSmaAuOccuQggHuBNI0COe64NK0zZ8EpPZzpFX?=
 =?us-ascii?Q?7pWfoQkcvFquco5dlI65HZECI587AY1jDz/N0JuIWlqMHZSFvveLdGiZJEN8?=
 =?us-ascii?Q?numCGmROU6HAO87BxmBxwy+0Aa7K/oCMjlG722H4iAdk4nqYozguaPjzpR4x?=
 =?us-ascii?Q?aiCNOyTOtmhlbMJVXW6N1ozCW3ScgUtM7XhUVKwPUdrAHSf9iOXIG2etJgrm?=
 =?us-ascii?Q?HcuT3313+zSw/i8/1rLfFpODXqAsWvIMDVh3xXHSssusW3Z9+v0iAxc/lZXU?=
 =?us-ascii?Q?/O+T/ALaetP1AhloMgyOlCHoHebMfmuVbP900ICZ56iJJiGylM44NXQeInCG?=
 =?us-ascii?Q?GKvr5mvEH8Vz9LkKLHF3+xf+0ELWYuPVCJPFXkp90fFeSBNOSRJae4TqM/fy?=
 =?us-ascii?Q?itN4cxJ/fg5jX7SEJRlM84/hPiM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5be26a3-9332-4768-dee1-08d9a8f72836
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 11:49:33.7377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xfCgLffWcPkov4ud2Gm0n9cGa09Zum8lXSDeKt41+v9iglRf9SFmSIRTCqw01iJcmyvXHbb4kdPGWkKJ60n9EPOmoTLbCz5jVbyMOQUSu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5851
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10169
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111160060
X-Proofpoint-GUID: B45N1aifGw0ikBnKuMWOkgRSozZx1udT
X-Proofpoint-ORIG-GUID: B45N1aifGw0ikBnKuMWOkgRSozZx1udT
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The intel_engine_create_virtual() function does not return NULL.  It
returns error pointers.

Fixes: e5e32171a2cf ("drm/i915/guc: Connect UAPI to GuC multi-lrc interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
index 38b47e73e35d..c48557dfa04c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
@@ -3080,8 +3080,8 @@ guc_create_parallel(struct intel_engine_cs **engines,
 
 		ce = intel_engine_create_virtual(siblings, num_siblings,
 						 FORCE_VIRTUAL);
-		if (!ce) {
-			err = ERR_PTR(-ENOMEM);
+		if (IS_ERR(ce)) {
+			err = ERR_CAST(ce);
 			goto unwind;
 		}
 
-- 
2.20.1

