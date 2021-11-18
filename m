Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A284559F5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 12:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BB16EB90;
	Thu, 18 Nov 2021 11:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21616EB90
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 11:16:52 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAx2QL032131; 
 Thu, 18 Nov 2021 11:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=Pjt/EqUZryZ8jD4agIaUvN2fp6L8rXV/s2HLc5iKUi8=;
 b=gh50W0tYu14lZ0WOtsJN+Vh90EKqb9zwcQGk87LmLCiDcrnrtUbRte/3i5Oix3X4N3J8
 /QIpurdR7SDXkH29bN7d3szVXytjbu8VtLYURKPQZ10g4YkckfpPHbcxD7HGBApIPAtK
 wilirzSJemIpmFVz7Dxl+kcT5oIBwPkJYWDG65BxgxP0Ot1owwFpevVk/fa/FzKFGDlA
 dk/fcAHLvyeqCF2v94YT301ZlaesDn1WULIvDFHdqQBNEPStvWX6+kmbAH3Wo8s4K+hE
 t2TPycUhqvwEGw3i7K+GFRjiVT6k4qOoE4aZlUm0oQoaf/H2SCgBZVp60COG2QuJ+vEz og== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd2ajpcc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 11:16:49 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIBAj5E160654;
 Thu, 18 Nov 2021 11:16:48 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by aserp3020.oracle.com with ESMTP id 3ca568dwm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 11:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cupVxiDjd9ywNcJ/yrig3KrY9MAdr6JhzZBJhznlY/lZOJFX5TDn9bwV469zlWrIziwicHvCsgURMrBFAS/zVpHPCDiCo6lAuEKODZDPgpc8WI4fyF5hav1f130gTzISn6IurFH3L/LZx1pZ0TjSWuxaH5cWrnXT/pEZqCeU+JKz0fSaER9RlHH4GTPKe2nJ9nDJQ+/goAvX70+366vXt5F/a+TV3r7pNI80wv9mLNA2DRKzMToH0qpDPLIOWwmdXmLdiPxW+rczBqyXmxE5SpGr6jatION2e+G1p02tYxCELrcES0v4EubzKGTxLtFe/7gl4QV7ek6H5oXMYViI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pjt/EqUZryZ8jD4agIaUvN2fp6L8rXV/s2HLc5iKUi8=;
 b=FhZffgiVsc7z6Vq3ho97BFGqZHTql41LgeuZcGIDCpjin+w1t3Tlmr4JDe2ssBFh/wiQVwa9b5JqQzjpKLlEl5tQKBxBfeOOSabqy8Wh78MyeVegt1TlYNgPPWpqljV8AtKBAX6CCwoVbbkkBJCWSYxY8k8KcFwwv0ONWjGkg6RVr0dhmk0SYxdA029am68D/3H0PlWZQPNviZXntSsRUOJdFLbHOBjdJmpAt/KwMabqpFQdClVnjX32XMFYC3PmJ2eK//Dv0eNwrtohcmP3P+OXm0uysSGBUIFjPBwB6jj1lSrOJRycQHJqRd56RboJ02wWptnKiPyW3scKktPX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pjt/EqUZryZ8jD4agIaUvN2fp6L8rXV/s2HLc5iKUi8=;
 b=cKTQgEsksg5tFvYXyetFCqgIPXOGYcMfQgV+DUYkFNkFOkuT3IQ/d17S7rqYNwMy6jXc58urltXd56edeys0hc4JpeLHdAw5DXn7Kgt5lOxsXctrzcTCP0MLrpFDYpixw3JvMTVT23Hr7FTSJ521zrPPJyr+lgQl1yDxusmRCWw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4402.namprd10.prod.outlook.com
 (2603:10b6:303:99::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 11:16:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 18 Nov 2021
 11:16:45 +0000
Date: Thu, 18 Nov 2021 14:16:32 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2] drm/virtio: Fix an NULL vs IS_ERR() bug in
 virtio_gpu_object_shmem_init()
Message-ID: <20211118111632.GE1147@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 11:16:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64aae6d2-588a-492f-64a8-08d9aa84e7fb
X-MS-TrafficTypeDiagnostic: CO1PR10MB4402:
X-Microsoft-Antispam-PRVS: <CO1PR10MB44027AAA37395C26E5F508C28E9B9@CO1PR10MB4402.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eYW8E+5p3JR4eOj0mwUpTSUUDShxbF6xMyogpo1Ay4N+jt9UODsRIvjXlnp2yjhDX7TX8m/b0+K3X3NkCGr23rKj730+Z/6crpaaa4S1CftVIzhNXhoE5qiFuTAehVA8tS+S93OjjhFns/ayB6bD2F69EN5i8xMwtbrbczT+Agv7uPFntaCWxL0A4PZEFX2Zt/6r7JHbkCgM4+OELEGCsIGFyjCQDmQGJsUrRJCDvXlylRzd/vrUz2jjB6L3f5qmGq6T0yH+frYVQ11yIRWZpTMxzVOdoWUThQFs9b194C84uGNqJgvRB+wq5OYclpKoxojXmcUPv9d6ddsXrVOQIKlGV0yk9DJlUecaU/7pei3tGYBhGWjbL0Ip4fmVY7yOQJ6VFo4o31ArfX0s13NIjwUXWLeESMQLoKYI/CepmUcaJnOaBbyH8fSnQdzcJFHoqd7xp90Kda28+pGJ+cDocAkx4Cvkbe9T0R++Vk4sMA50kQsdi84t3YL/5F9apXWJWtq7lQa5tjvtF/Z1zcFSRBrV8GpShZUfY8iunWuQbGZPmZGbpZGrVP7E3ZttD/7UjsWa0IEvYCWwyaNMiDhVDIo6+5qMSNiU7wB2G01juJ58RYDp27/NwJ4UTQDLKnszcOyUcxbY9vk3cPoNzyMRwUawh4n/bObQbNhkZ0zKwTDoP0SY6TNmkJjjjPVZWYDc8ADuFkujj6HK7MoZarn7ZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(8936002)(33716001)(1076003)(186003)(8676002)(508600001)(52116002)(44832011)(86362001)(316002)(6496006)(66556008)(66946007)(66476007)(38100700002)(956004)(55016002)(9686003)(54906003)(5660300002)(6666004)(33656002)(38350700002)(9576002)(83380400001)(110136005)(26005)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fgidpFxbetZOLKjP5OLsRouz74iy5dFDzbBSxLbSHk5ZmUYg9B0jJWKihyci?=
 =?us-ascii?Q?RIe6zEn08IyPa/cvbJ7C9efvPkT1TwLdgD4QP0SkNC+eaCE7Gt2j3X77kOGd?=
 =?us-ascii?Q?sHv2Gu9oXtVVErPbffY0BauefiHOPgFJVfIgBnC3FR3pLlaI6iqGK72lft7v?=
 =?us-ascii?Q?T6MQo5xoMQIGa7SrkM0GhxG/UF+xNtQoszYNwUe6xodXpEEykiKZaTULw0FL?=
 =?us-ascii?Q?YCGw6nuO8l9YayXSuzi//PkKu1pIJ6i6BqueT7NrKBKVk0v8Xf7F45dpGZBR?=
 =?us-ascii?Q?2U3n2wUbynGthIuJMUMyCde9HH7Ucx5S9580dsxoxDI2d+H4T0mS8hqqg1Vm?=
 =?us-ascii?Q?QIBTXVKJgwYz2oYFUm5IPX5I+i+idnUoScqyN/l0yXZ6S6ykN+HyQUQhpqwu?=
 =?us-ascii?Q?F3wgv2RQSbQS6gZVoyp6JnGriu+/yivqnXsg96bAMySeYm70BHmvMOmagvIa?=
 =?us-ascii?Q?MSUDepdZizsyX3Ra/PFS2jBPjhl0Ie1EsEz/uSH6FYHkioF9sWpod9tOkS72?=
 =?us-ascii?Q?IpYUJfPf7ZfXMZlZu/bZDzGvdB+hwaNei+nTQCrBHUHyJjbStAKATUq+hWmP?=
 =?us-ascii?Q?usAg+JwNpfyTTfuHULDigOUyduKfqqnYKJLW8HY2KYfeYg4XmRoo/uDepPOZ?=
 =?us-ascii?Q?xpfFz6rByDqE1+8yroCMtOCla+0mXd7a9TC6Gd+VtDl63xWDpRlT6nQ/ifls?=
 =?us-ascii?Q?P9sxsDoQw2QqbvZ5oWyJEz3CybiC2HMx3e4sfskA3L3dJiZggsRNrpsGGmPN?=
 =?us-ascii?Q?IT94PJuaJk2vkWB+g389oNRXw4kOXbGT1WHdhsspQfU1G1EIUthynjZwgFWN?=
 =?us-ascii?Q?NsFWUKxKh89H17upT2pezTStR78bWLoF9ftyzsOJKjAyqGebbWxXGCyRHvIP?=
 =?us-ascii?Q?RH+X8uzPwbqEWTTTXnK9ezHgQzteWtwmLmsBVJU1iRuBl4R/Fo9Q5bfDR9ho?=
 =?us-ascii?Q?WKxT/cvwgmeBYlWgRr2GFIkIWWL4VUxp3TWkfX17kWKcdSusQoarRpdui3l/?=
 =?us-ascii?Q?ysOAyVxMqVEl09DZpQ5dMu5aDh2HIncApT5pKJ7Fx56NZVsjrTH/07GJP3Bh?=
 =?us-ascii?Q?R9O2jAY0DET9jg+8FBb6GgfGoGc0Md+7E17khsQ29Ug3GQjkVW5TNkJtoDHS?=
 =?us-ascii?Q?0QK3409FfAFxE1EM8igQj6NUrXflBUGE4HNtraRxabVp7nxD+4k9nBxMle6O?=
 =?us-ascii?Q?td+82eDcp8kfLpMhWyGq2suJRuMeNPij4bMZnR6QEN7IP+L9+ABHHgtMFbPU?=
 =?us-ascii?Q?TPInMgwsVewAfxLA9RuwQE37LwyWw218JL9DjtrWIBvNJt2GDP76HJk0Blpm?=
 =?us-ascii?Q?rYrWB1DMWkxv0RJ0GFSLmsgSviGCaYG+yAbccdaGB7mjjVIpdSTsiHU0UnTN?=
 =?us-ascii?Q?EP6IXi9ujS7J6OV9l1B7wfPJDEKKDmnuO+fJ0MWKpiz+nuwbzLMYS24ERMOT?=
 =?us-ascii?Q?/GGzvB0GZQ7tVD7GvBc78qzp8GesCT4GK5GhuhnACosmEUe+swtPYtmjxs3g?=
 =?us-ascii?Q?x8vG0+s+RNndzAl6TmhLwAaApQFJvcJ2w9YAo/rDGsepT7DEbawJl6LyoKGq?=
 =?us-ascii?Q?1NxJTUQVnRY04Xrkwv7LbYrlRxbMtDVRyqwtatY7a6GpMdsZIkjsdhQBJV3C?=
 =?us-ascii?Q?T2Yy1fzwr8e4PkCyGRwV5JdcFg9GCWmBHBADflQ6w/HXgQ7b/sgFc/TYLmpf?=
 =?us-ascii?Q?Nt26BRW9bqhbs+CIi6RBakE3Lpk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64aae6d2-588a-492f-64a8-08d9aa84e7fb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 11:16:45.6881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKTjgXC4y6wVg3XFkyQWb6e7O27j8mZA0hjJomwrllSkvHxoPHICkqY30gvoGudECS3ukPae+cmrOlg3Lid+GMza2f2F3BThYih2BJ5Y0Fk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4402
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180066
X-Proofpoint-GUID: FmLsABOXcOhWT61UAb3s0wF-jc9I0Eyo
X-Proofpoint-ORIG-GUID: FmLsABOXcOhWT61UAb3s0wF-jc9I0Eyo
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
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_gem_shmem_get_sg_table() function never returns NULL.  It returns
error pointers on error.

Fixes: c66df701e783 ("drm/virtio: switch from ttm to gem shmem helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: I originally sent this patch on 19 Jun 2020 but it was somehow
    not applied.  As I review it now, I see that the bug is actually
    older than I originally thought and so I have updated the Fixes
    tag.

 drivers/gpu/drm/virtio/virtgpu_object.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
index f648b0e24447..8bb80289672c 100644
--- a/drivers/gpu/drm/virtio/virtgpu_object.c
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c
@@ -168,9 +168,9 @@ static int virtio_gpu_object_shmem_init(struct virtio_gpu_device *vgdev,
 	 * since virtio_gpu doesn't support dma-buf import from other devices.
 	 */
 	shmem->pages = drm_gem_shmem_get_sg_table(&bo->base.base);
-	if (!shmem->pages) {
+	if (IS_ERR(shmem->pages)) {
 		drm_gem_shmem_unpin(&bo->base.base);
-		return -EINVAL;
+		return PTR_ERR(shmem->pages);
 	}
 
 	if (use_dma_api) {
-- 
2.20.1

