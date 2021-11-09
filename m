Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C647744ACDD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 12:49:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 785C86E8A3;
	Tue,  9 Nov 2021 11:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7F96E8A3;
 Tue,  9 Nov 2021 11:49:12 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A9A078e017419; 
 Tue, 9 Nov 2021 11:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=h5/eBmu47csnu766K5nMaghwmJ3AsR23URowhF9jqUk=;
 b=gBo1OYI1aVJw8EmjeMDrCNXC/YFXz96bpf+DljjSCpDE0SsZQhy7e5NWKtg2hV+Gb8X/
 SGH/bfuLtmLpUzmIshRPODx2YjnSU4hjAHak2+pL6QECWHU/K+z5Tgr8kviAd/LVEaBb
 j3C92cTJxQMfvPjl0BvwTvgrrXhGBXvohWuxZ1IuY7Sli6x2UOWmrekJDigdEunWO5IP
 YIgkXgbGQx6MLoupMdh11vHoiE47XDY0sC2FtZQiQULqyXjslxry573rD4+VESWwGKmD
 Wgaos0DMpmanNF9/36wT3c0XvWhocXg0/RlzwjPLUIT2Je+N6mmocYABW9QrbxkgaME2 FQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c6sbk9xm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Nov 2021 11:49:08 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A9BkFx4125893;
 Tue, 9 Nov 2021 11:49:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by aserp3020.oracle.com with ESMTP id 3c5hh3g1rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Nov 2021 11:49:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLlTOvNQLtNq0KprxFdC5fBWRyZjtCnYUOmLwL2T1+cP3A+miXx7qJd8iSx4Fu9GoooRaJGnVaBii3bPiF4MEYWSFNiFE1N5PCpE1ZgBNR9wRv4w4AP1bRJbfd+YC9LO5DhFpWqeODTqfxwEx1dC3XuPn9Z3PsITWafRUGW+EySQ2oCiYSDBnd29pfTFeiVLC1W4/nAYiASSmQSY+GQRJElQh0TcyakZ0VMRx35wZyufYBQ7CWH/LLLKXSxtYNPKqqWPQNpcflrpv571GupNiwDtfXVJ/uXElSpeU8cy/b9RsLb/UvNyqV5/b+k9lIm4mQq3KA1BcEmIAO22mw2vGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5/eBmu47csnu766K5nMaghwmJ3AsR23URowhF9jqUk=;
 b=lp2XUe7fUZJ75gH2XA9iSGoKrR8g4Ryv0eGQs1pr8f++nW1ZsPN6KeQaZxLWmPYuLPiMgnQVKYL+08lZTm/JWbTqlHHbAV9LM8UVUdwIRnmxHr7k/GzuWN6tTmoxIswUdhHfsKGYmMwwsNSXiNv3tqVmvjpn7mfrUF80aFttv6zLFUPsSjASuKZF1aBPFdQwtOqfhNoKcjgEJxyZSoF1M8TKqcbO8WlL0e0icPW8kL5JGcagtohuTwE6R0gTUpk0KJn53utJGn4uH9L6wYOtf2+07Haf76WGOEjhkCoeB6QCsM3RoL4ZIQ9SfZNh94FEHDnc7EKhodCUuBVzEa5R/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5/eBmu47csnu766K5nMaghwmJ3AsR23URowhF9jqUk=;
 b=Vo4VkvVSt8jwxVttV/A8XiFxKxWNbB1vrN8KbWPv++AbmtySCMvrdl17H3VFq/LCrOitgOOu61HQuImYhTLTF8X/Xc7XmLpVQOV/3T+MmxtNTdZMdsDSN9oXeFAwih1cCELkfGeLotW/evOYbAxf+TSh39KWiCVd2O/KuPkkvEg=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=oracle.com; 
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1999.namprd10.prod.outlook.com
 (2603:10b6:300:10a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 11:49:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.015; Tue, 9 Nov 2021
 11:49:05 +0000
Date: Tue, 9 Nov 2021 14:48:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/i915: pin: delete duplicate check in
 intel_pin_and_fence_fb_obj()
Message-ID: <20211109114850.GB16587@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AS9PR06CA0085.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by
 AS9PR06CA0085.eurprd06.prod.outlook.com (2603:10a6:20b:464::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 11:49:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed380d19-2ba8-44c5-53db-08d9a376ee3a
X-MS-TrafficTypeDiagnostic: MWHPR10MB1999:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1999BD33A0C4973E01DE763E8E929@MWHPR10MB1999.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2g+/54rzoNnEcQ48IW5r/eqebNnJEnruECDE55D04ORIBeYJjcOpQDiR/Pa++6VNA/1dWhYThcZZE5QcNZlnmjJdvS9p1nX5qlzz+ml1sPVDsOhAfxWOlPsRHWFsW1qBwvj0SreV999iLHEBxd+Pc27uePVON1ocMKhHYdHtjEwRlZ9cwPG4zoZcOyXSBOlkiPk+234VO1lI7EQla4JPEHL4IyJdEkuJ+3IPrkdqk3llIFREDGPD0TCC0w0MvcA249Qs+GDyc8RQkoW1PMZZgRKF1KyQj+sWzkVUPXqluNMyXZ54OMxpCdRWD4ZW2zK/ZE4yC+NbPSPDoNwfu665UPtGxNHmUjVStbe7XadofeFrkltdz9Qj0oY/ubcWnP2sSlmDdQ+3wt1asWUuO6eMqS3pYo817VCNhCXFjVakgl92tU8Ob+yXJ9VUB+ejygHTcfML5/9Wt7Y2cLHC+8lVtdfrsgNKXJ6YWu1QXs4fzONLYoblKVYFBBdkri2W620t0wPWTTrpWC2idZ4x8Uq5ha6LSJO97cJvRbg2wQhyDqgiEdesAEtr+PCb6HLXwITPMZTHpxhlBZSHH04RyBDQyPMXiO6Ur2bMhV1Ugd11BO84fr5J5lJCaH2TbmlLWSFJaIJZBGx5eLsd2T7B0kwT4l3Sr2ukwNyLidLpakTIS2QdUpJwK7zhY/JkQBGCBzBpmEauOudzWpxTn0XU61z8FA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(33656002)(508600001)(7416002)(55016002)(110136005)(6496006)(26005)(186003)(9576002)(33716001)(54906003)(52116002)(86362001)(4326008)(4744005)(316002)(44832011)(9686003)(66946007)(38350700002)(38100700002)(6666004)(1076003)(83380400001)(956004)(5660300002)(2906002)(66556008)(66476007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X71ahBYabDTAW64PSpuHuafVUiqeCbCPU2E8fO6BERM76PN2Rw0cz9U93RHh?=
 =?us-ascii?Q?Z4yZMG50omytQMCBXCJiZJaUUnMB8wXZHCYrUzqcnO/JD6AVaXxHxqAdq1H4?=
 =?us-ascii?Q?q9fo+1S2JfZNfRR2UZ/J+zJi5xSBlJ7ViAXducQXMfvvQ4W/xUDaFlVi4d1x?=
 =?us-ascii?Q?C3Coo/VB1G3k/JFDvLn1XRx7ToJGnnuNzPFptqY+JiUTuDBvn24fYrhrqPIA?=
 =?us-ascii?Q?hLdFiTsc/AY3FpcrKo1EYmQpFODr0C0QgvEPBsRofJdNUynlj79f9oR6+wBr?=
 =?us-ascii?Q?DAFUAyugKiGSaDHZ//qHSBARkrp3q0dDFFbiBCJnKV18IPEQQwZIiZqWbUbc?=
 =?us-ascii?Q?RbvLkr02P7sjEnCoDvpwaxxAwgNdG7/DHVoMHBZMJoXQQoIFqPn/1w2glYPv?=
 =?us-ascii?Q?DbzTCvdZIdCXDQbi87t9T8scUu8vBTnt0WAup9BBPW2n5WYZXrcOZfrw++wv?=
 =?us-ascii?Q?52/fjG05squHbdJ4UBgQOeaZ0GAb6/xrPDK9V7QnjP/rlfQM0XdZWfnySNHm?=
 =?us-ascii?Q?zQIc0dN0UN/9iNB6O14AnGchcD7oVXF47XrlhKmeNc2gIxW/0MV9+pwiJDgw?=
 =?us-ascii?Q?SeaBMF8+/EFk6px1OzviHZjlifdYklWPgB2DAW6RmmJh0fUNsTQtE7EBecmd?=
 =?us-ascii?Q?Ju+U2cmWTT/nqdlHTTI14TJPJzObipOiBUBW6jvpWhvhdhTXm8jRQ7RseYYR?=
 =?us-ascii?Q?4Btg4lTdCoFQcLhjFc7YZvYFDDDdKtoU8tiFssvSVNK/PJtQa1vYdY+n+vMO?=
 =?us-ascii?Q?Z9Ex+1L0wJnJlIDWGDrEW+JIFCsSsPcWP3X2T3UA1nW5P8sbQD8hDckP2nHd?=
 =?us-ascii?Q?L7hGIQ0f6mpfa0YZ4E/1SbZU28pCxwttX1EP2VsitaLriDWeCz3aLi6Mwa7o?=
 =?us-ascii?Q?hOgp0u/iJSSlu5CN7r++VxjSnD4730KQjU3IODhWbxugv2gFqyWkNiX33gFH?=
 =?us-ascii?Q?uqKykrWcPX70Mxfu/bnLP4ZbnWSL7yu7dSpRD5lA/qjtHztEZ9r73rykJIc0?=
 =?us-ascii?Q?sTf/uUDGrc1pYIFGEbWBUA6JLVnAIGPwYL2Gv5Ln44sXyIKO0nfabMSA/CYe?=
 =?us-ascii?Q?042I+EBfcIirEhPFxphnTc6DPhMLmsdwS8HGj4u9txa49fTMf1rUjT6nUM25?=
 =?us-ascii?Q?oVWDPnHuVzZwsHbozlEO+qrTfZ0zdchfSzBznH4GdrUWVNvuqubVzcyKW4aM?=
 =?us-ascii?Q?n0NEttFaTjP/edrxELIcFfqcbvJlqtni3OTQMM+66X5QvLkq+zqhoWRdN4be?=
 =?us-ascii?Q?OgP1DsOuVgatGffhQtVKOZLv5oyf6m1nzWMH4I/SsvfC2GByzb6TaNPmORux?=
 =?us-ascii?Q?07vyFPhIhQNtMLcFTRfP+QUj3JCkKdfybj15NZP0yraqFAu8PKLdSXvNJOgJ?=
 =?us-ascii?Q?2QGaCxFvtKze9RjGWl/c0upQr0SpPCLriJfM7TD1MkUgdfOXHBJSrW2R0LzJ?=
 =?us-ascii?Q?SoAeeMWjCriB7VMky2YZFmDoXfZmOSgHeoJd1Z51GBgY+8OnzM9ifCora28T?=
 =?us-ascii?Q?akbt1+ke8DJkpY/Y1atfmy4chh8H71cYeoapy4iag/IOI5BR7aZu/n/qR0/A?=
 =?us-ascii?Q?ehPLv9E9i+fS2R8BFQQZPRcxbemcRPbw3lvuYK+ccMl/eJQ6QxWHlvr/wgr+?=
 =?us-ascii?Q?26tdtguyzIcpzXP3cfImeEKB6Vg12AJv/dmbGIrKWkoEUZia+S9z4ZR9qbax?=
 =?us-ascii?Q?CXN2zJHfz3kpAD11IP6tfhqe1BI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed380d19-2ba8-44c5-53db-08d9a376ee3a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 11:49:05.1741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ndI0KZmS987gtV4LaePrYe1IqmUBIr9keDTuf57OVggKn0y+fnuO1CZXp4b2r9D0NOC866qOHkCt/BY34p4CiSW10qBPE5YThQweGA8r/HM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1999
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10162
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111090071
X-Proofpoint-GUID: Zmkst-Q9M7DnMZpUOZWwJtpvE81UvX2x
X-Proofpoint-ORIG-GUID: Zmkst-Q9M7DnMZpUOZWwJtpvE81UvX2x
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
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "ret" variable is checked on the previous line so we know it's
zero.  No need to check again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/display/intel_fb_pin.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fb_pin.c b/drivers/gpu/drm/i915/display/intel_fb_pin.c
index 3f77f3013584..3b20f69e0240 100644
--- a/drivers/gpu/drm/i915/display/intel_fb_pin.c
+++ b/drivers/gpu/drm/i915/display/intel_fb_pin.c
@@ -142,13 +142,11 @@ intel_pin_and_fence_fb_obj(struct drm_framebuffer *fb,
 	if (ret)
 		goto err;
 
-	if (!ret) {
-		vma = i915_gem_object_pin_to_display_plane(obj, &ww, alignment,
-							   view, pinctl);
-		if (IS_ERR(vma)) {
-			ret = PTR_ERR(vma);
-			goto err_unpin;
-		}
+	vma = i915_gem_object_pin_to_display_plane(obj, &ww, alignment,
+						   view, pinctl);
+	if (IS_ERR(vma)) {
+		ret = PTR_ERR(vma);
+		goto err_unpin;
 	}
 
 	if (uses_fence && i915_vma_is_map_and_fenceable(vma)) {
-- 
2.20.1

