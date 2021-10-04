Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A029F420961
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 12:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBDB6E199;
	Mon,  4 Oct 2021 10:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21A56E199;
 Mon,  4 Oct 2021 10:37:56 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1949eCvD009321; 
 Mon, 4 Oct 2021 10:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=iyabQ+cMsJPr6HtKmlZ32UgmhkaSksri2ghTb8GADy4=;
 b=ar+GouYG8xMOPpVuJNC0pLtPmmCnSSIKCZyNP3QjPHoWpp65vgu2IoQzhbDMZQpSMTID
 t9H/z2X4vP9kNUC+kqORi3FtNvrxmPuNpt0TMMqTmnEvn7cUCbDH1T26aDZJaYJ+RMQf
 XmMrvoaS6VdzHcSBOFJ0UqL5R4/hamIO94egoq7HYtZuzTDjm6iNvESelPYwhtUevid7
 2rouhOZ5njVNOLGjdSF+5BSMQ3QcJPYnX8/aFsmtE7couDOsGTuSjfbJW6CGSb0zk9AB
 HfZPDgX7YfY2mMsRJYjhGGzrUD0Jrpl7brgQnMJ37JWaZnKrU6fTznb3QE/mouZUinv6 EA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bfbatu4bp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 10:37:53 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194AUG8I130186;
 Mon, 4 Oct 2021 10:37:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by aserp3020.oracle.com with ESMTP id 3bev8uy8c6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 10:37:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CD1XQd0RouBcxpbyk8T9gNuZG9F4FQDlcsZQdNhS1h+5MYOsuPjA/7WlAUAFeCM9z9udBwVqXW1Ft8pmYSzbMQTuYJpwffLYu6XoXQCUgFs7td0GaRCjGwvXt9k7nKGrAgruE6e9zcvlDFybRKTk9vnJm/ig3VpdMMDKKHBryARSsUdpEr/NYQjFYz0D0jVSFWM/kp6GcABvRN0p9/tlYYOhreYjxQdLvDLuHn0yYYjMDR6WLFqLaV3KsWlhikiBO1TdsJtdjo1qU9MTOvznYYAaXAOGb1eJFc+tt3hkNriqxHctVv8v7Go+cnYIVrQkU8ABH3VaUy0osXfHeO9u8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyabQ+cMsJPr6HtKmlZ32UgmhkaSksri2ghTb8GADy4=;
 b=hwjVnzATqzbP0QkNapqdTfKliELfcLcurbXgNJEy2rO2/9a1ZcwV64SBdwk1ZqPofHJn0OaKrhiFK3jp4dc05cHdysgKGMKuaSTbO7m3UdfR/9Tq+1DOZqEQksSuMSCg2NtHoj+ZcfUorU2slYdcc8/sI+i6md4UEBWKfho6y7VGem5KwmESehOp/8lVaRr65LI/997Sowoe2Yv9LYfbkWUeGCA5ECeCIOzS7SE0l85FEFYYtwNtU9cZqk+WZ58oRIATWbDhQjR3oGez4+oRsXd/6RSg7jFprD4NGHtnRaTlL2iQ9ztZcYioEBIxC6HdWYoVG4XSeDLD/9uav7uLnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iyabQ+cMsJPr6HtKmlZ32UgmhkaSksri2ghTb8GADy4=;
 b=YG0pMzXlEO8qTSlct9LK8neIVv8cHgBgWVgNF9SaZjr/cypPC8gr15k77T1/96rctRjhaYzdr3zrjr+5ab5ExRV3UWzDYNTNGn/IEe+J/A668mzxonTY4qL8+2MGle+f+kQwM/2g51Qs5IxT+vCyCxy6JZCM/IqeBqM18kKx6UU=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none; linux.intel.com; dmarc=none action=none header.from=oracle.com; 
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4466.namprd10.prod.outlook.com
 (2603:10b6:303:9b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 10:37:50 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 10:37:49 +0000
Date: Mon, 4 Oct 2021 13:37:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/i915/tc: Delete bogus NULL check in
 intel_ddi_encoder_destroy()
Message-ID: <20211004103737.GC25015@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: LO2P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by LO2P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Mon, 4 Oct 2021 10:37:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46b22f66-3908-4d56-5f1a-08d987230324
X-MS-TrafficTypeDiagnostic: CO1PR10MB4466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4466EF8DCFDDE42B3D93E6098EAE9@CO1PR10MB4466.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PbZjNcSjZHy6jceyZ7Bus/T9YYA6ATI68x+LKfpcxVNCHVopTrePckoCGnb/s0L8cVCwP/wSeWp/Ug+PNbgne/pY8as6oaawkZ+cJrOWGuP/aEY4y9qm2wXdISmU2nrutetDr7xhsRgaJtuoiWT9mjsfeVUUxiiWetkVSzVe/zXxxk9lqmhw30XBqtL2zx9ykMZSf+vP3cOLseBZAq9RI1u2Nw36/LsX5+PfSqvsXPLirSZEFVlEimWU8NVd+MpJwFXsv7z6qi4OFAD9Mu3N/rHi2L3psGHWDLOrNd3xUaRD6Koj3/vEah1Ex+cgACOQF2Mv/nXQAUhyua8LJRm9L6L5g1omkBnDwb106z5sLyWcyW8G8KhhEtf3qgrsmCf+2r8mt76IZYPHkDZVGU5PI5rm5SMzf+yJ0RTTq35VyccT6o8gwUBNcjljc79qqkRpVrUX9iPH7pdV2MpebDWCl3ohM/B4X0rvPY1ABhSuKwd6Ny8+P0/PF/gdb+d7d3mT/YQl1mOVLXgoARVe+xG1xQ+x9bFBLX22cUMShDC6XQaWbsWC9pn7CQIpRnJYN7zXaURsOcnswkq7jIPui7NC2x065gY5tEUYYGM+wgNnXSPyvCL4pOhBXhix6zYp8RpCGiY+dYGptb0FcukLb2o+vl+LfX28FOrtRJSI2CTZhMpKJWCzUBUr//e1ET1lir+eNl/kVVqU163jvwIBA6Wy9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(52116002)(55016002)(316002)(9576002)(54906003)(6496006)(9686003)(66946007)(66556008)(33656002)(33716001)(4326008)(186003)(6666004)(26005)(4744005)(6916009)(2906002)(86362001)(956004)(8936002)(44832011)(7416002)(8676002)(5660300002)(508600001)(38350700002)(1076003)(83380400001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VuEKCVrRjdGkScHH6yBeDxNPdL/6JjqCBilycTnKagCSCfC6N/fhTxJGXHcN?=
 =?us-ascii?Q?vg8Qea1sZNCnxse+ZUWSmYtsqBwI2X7uK0oKYa0l+YgJLUGDFw9R5WMEAOk+?=
 =?us-ascii?Q?qmpdpZBIcY6DddaK01us4nalx3Q0gFI+mN34URuVZJQkaJs6sX+v+xFNF8Nv?=
 =?us-ascii?Q?qIEII7VOzw6iY38SIUxx6bPDCp8vBBOY6KB671cuXQwGmk22Hki/N7Sh/keI?=
 =?us-ascii?Q?/nB8Zr6/hhtWwves8NFRZgL+fRktn/hTvemAl0aqTsP2GAkvQyuCUAAepX2U?=
 =?us-ascii?Q?1Nu1yC3URM/WBDB24XYsrj6VQBy+DA9n3BI1MUXIIMnoufRB1/cEn/h7UtsZ?=
 =?us-ascii?Q?VAMJxybxz7e/yS9wilpK34vHV2LX/3OVGvkQyzbUGgcifWts8J/dHTq2RHnH?=
 =?us-ascii?Q?sIzaMWt0N9uHYQRSEPLUIDCdxVdxqEQ6IAkSC7FUGkrj9yANWWaRpY8P/IpC?=
 =?us-ascii?Q?c/VxG+HMLX5g/pDd0INalu2/0y7QsViTk5C2tszH1yDRo6Q9bl9pTxroIASe?=
 =?us-ascii?Q?W8lUCTf+rFeffg2w4r597dqmqb0se1vWI8AYOzCYCsu1GzfkAkSCSBJrycww?=
 =?us-ascii?Q?/MtjIiViwPKFsgVxMCnxgbH0SxHRT7OJn4OE9x92SqckgzdKObRFP6RYV+Uf?=
 =?us-ascii?Q?29cRaLYDjJ3mrI6wmZzZNPl+6/1O9bOzcoMzZ6UvA9iM/vOk9G5A1s7eX3UP?=
 =?us-ascii?Q?aXl6Oz5BuQ0zCkGIh4oSd2LJyYccZ8yTsZS/uCVEj3DQCXv24KnfQTJyelP1?=
 =?us-ascii?Q?7EOM1f8O/zvEfaLa448kQWgJ/EISGJ7+w1bp+j2hQwXwPvnHh8StrBxOH/Lk?=
 =?us-ascii?Q?fNQYbz0P4y1jdxtosT8xJqL8vh6MgVrBsTf+y5LCoq4Er1DvBuLIN5vhPQk9?=
 =?us-ascii?Q?WmuDhPNzowyRDzfM6TkLjLDrd4CgIXXNpEW/DRfOwGsU8QTl2IBbsgXvgCky?=
 =?us-ascii?Q?nnGx+BgVbf2M++wc9mJXFUhKWjO8XINxDkfZ30Wy6ECqcEEVPR/pwO0NxzNT?=
 =?us-ascii?Q?6GjJKaEwvJmCG6cxaUInsLHpDDCtLt3sLqoHBaqurUONj3pSa7raZ8f//m6/?=
 =?us-ascii?Q?9vzF6rCbR6e/9C5YhosmR36MnBiF27zoIq7mSnmSQFbAr/pvFyet4sFA3wRe?=
 =?us-ascii?Q?Txz/yEXwoUVcMVnkuM66djYLQYSDC2ehOQ5++Dc9J3dg/W9KaK8VGMe95PKh?=
 =?us-ascii?Q?ytIyGUuT94N5oZSG6cwaAdm0+jMM7Nb3KELB/EoQaonF0dLQoOvoiYgct3Cn?=
 =?us-ascii?Q?kdl4ld/5USfM+8i8y/iO+5epyds/3NhUC4NpDA+HUUcUB+trrnjVx8uJ9MaJ?=
 =?us-ascii?Q?spFY6sGzeCYVkpMVKwPyFvfe?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b22f66-3908-4d56-5f1a-08d987230324
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 10:37:49.8514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pL/1YovpO5C5UoyBLgkgee5pOiLO2+3bsVWC3LJBBd7DYBhZXAGIZ9SnwMlM5KwSFG70+B/ZqRuonTonuF9y9aDwbw6wIvdTd1wAAiPjJJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4466
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040072
X-Proofpoint-ORIG-GUID: ZcbEjD3vjRl_hrUodsvML9XE1gHhOSBk
X-Proofpoint-GUID: ZcbEjD3vjRl_hrUodsvML9XE1gHhOSBk
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

The "digi_port" pointer can't be NULL and we have already dereferenced
it so checking for NULL is not necessary.  Delete the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 51d07e9af9f3..b9c6eb13804f 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -4025,8 +4025,7 @@ static void intel_ddi_encoder_destroy(struct drm_encoder *encoder)
 	intel_display_power_flush_work(i915);
 
 	drm_encoder_cleanup(encoder);
-	if (dig_port)
-		kfree(dig_port->hdcp_port_data.streams);
+	kfree(dig_port->hdcp_port_data.streams);
 	kfree(dig_port);
 }
 
-- 
2.20.1

