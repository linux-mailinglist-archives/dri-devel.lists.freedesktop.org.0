Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ACA3E9F22
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 09:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF726E24E;
	Thu, 12 Aug 2021 07:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2716E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 07:01:01 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17C6q1c3024291; Thu, 12 Aug 2021 07:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=CAG9O7olk6fQNsKPZKowIWgPJLIH0wGU7Z0zGHvNRWY=;
 b=tgLx2lHzTyGXFocp8U+oOlZgU9PyHCYActVlQPYpe0FDXN/PCGji1zKngngnYAij+Wht
 oWkri1WqAjFwlFKxWb4LlEzVM3r1zbhJhM87xMOnD9TTl5TbqolGFhIVA7aAmPeTnigz
 DvJMTu/HcCUw11pQUqB6kVJ6OGXOOLzM+7A5sOoRQVOTHGX1LNTmFuhKB9+nfq0aTR4D
 6c87R5RCl6MCDSBT348vs/3mVWO4KZAmgKklC3Qc6WKNFrG4Cu47CNCaFZfHqwgKVXyn
 1x7saRR/Ab7ddS3LlM8rxdYrTa6bCppBXqIaccsRJgid+lbkPCB1USJX76FkbL8IVJ9j pQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=CAG9O7olk6fQNsKPZKowIWgPJLIH0wGU7Z0zGHvNRWY=;
 b=bnJfOK3TKygzpxm40dHlESs01osPCvLKDPGukFGQRCBInfcpStFlKA/fzev5K8z9hRg3
 5bJZv644+1nGB3nIK/CfW9ma/5QMrMWMmXjdHrWwwHfaSOzyq/FglVa+sQddXyDCjkFd
 24c7VCOuL6Riwhd81BIN094CVcbefNp7nTeY6yLFkh009DxuLyyiEjQ0KNMy6dkrYVlo
 DRZhYDwFaqBManutgexZN7JdqhTurPtKGPjrb479L1Rsq2+LEp8ildVh6z5/PuV4m6o5
 L7DHte23dfLFi11JuWzTY2enxRhsyFCi+NoZJNutuXRPtE+Je3OQRFvwW/WQDzJgTC9E lg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3aceudt13s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Aug 2021 07:00:59 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17C70L26130910;
 Thu, 12 Aug 2021 07:00:58 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by userp3020.oracle.com with ESMTP id 3aa3xwsd3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Aug 2021 07:00:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1xg8+576wRQo6thTI+RaQ2tZ8MFA0ewV4LHvs4/8D2ABXY6xgnttNByRs0TQsH9fE/ZhrsL9A8/I2cyNwJTKR/oVtZLReJNoRw4BaO2qjniBKzLD1/Rj6QSRLHZPeSuA4U78pjJN8wb0ClkLTnvBagg7MXTOeWgj1I45oBuWcKExhRQGFbmyPjsXABXsDjrdz+D3Z9GkxM2+u97twv6g3H7CdrAb/9y+CnQAqqTrzM0GwgSxor/jdvRvgH/BKDS1AvA0ENTweHwXmfBVaB6LeNymOrFKUpiXM9QcCBRtiuL9Co4q17t2WCb8445IuLDrif8ZY1bKZTyon62v4IKag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAG9O7olk6fQNsKPZKowIWgPJLIH0wGU7Z0zGHvNRWY=;
 b=QJxDNFQCAqLp6J4m7fuTvIdsW9ak9D8tVe1nmyjhKjyeUMFEsY9SXvCGncV4jg77RKNNxM6fQfvQLIt/d9Um/Limf0EF2WejqkBaBWMxuVZkddUYxBGM3dkt0n4Rj5Z6tqVsNU60iro+LdIGEjG/JmAfbsEgv9yEEc0X1e6N+dMa8TWFIwrmpBFvYi1qKjKuiOXk3e/ghMdxRuGYClhCIcqtXibEHzVBA0twLt11dHoWmkm0FwMvooaZ3/1fr3QxKbkX4k7UZwRtwnssPIMORAPX5gk8eGbqqtoDBqq324qlgytjZwxTAQq7EILIyXUDxjomVxLQzPVi44ubumNiDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAG9O7olk6fQNsKPZKowIWgPJLIH0wGU7Z0zGHvNRWY=;
 b=n2CHVS3fdE4UaO/n4lvUIs4D1s44tEzyUchc2fp5xQA7Nde6DEpUmet4O1wgy7kopsud30ScrNPfulqO6fab/6DGtJA1aXAXH2BRjlcnh5fgmkL5Mt1Cb2wGO6UooGqDY8W677ty0zxIctAvKa1Cd8hRiQJR1r87qo8A8NJbAko=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1488.namprd10.prod.outlook.com
 (2603:10b6:300:23::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 12 Aug
 2021 07:00:55 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4415.016; Thu, 12 Aug 2021
 07:00:55 +0000
Date: Thu, 12 Aug 2021 10:00:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>, Sinclair Yeh <syeh@vmware.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Martin Krastev <krastevm@vmware.com>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Fix some scheduling in atomic bugs
Message-ID: <20210812070044.GD31863@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0126.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (62.8.83.99) by ZR0P278CA0126.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Thu, 12 Aug 2021 07:00:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dc26c4d0-00d4-4057-68e4-08d95d5eee54
X-MS-TrafficTypeDiagnostic: MWHPR10MB1488:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB148803266E97848CF715B3CA8EF99@MWHPR10MB1488.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:628;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iD96qOgfd9JRDLQDUxPVbq5f4RR3ZiH1qFIN9oFxQg+7nGYAE/Ph/3eMFM/F/lQEe1sGV/ijQBazbue7Uuw1oImMwt9clEhK9nawlqqkoOXS9rmp+1n79vLASZvmrXEVK4Gz0nOIOROhly/AITKKM6En+5qFozFR2I4ZAv9LGY3pix1s8ign8Yc3nykLCjpKBxExlqozFLxcTAFZ1alqy1JyJkAjTrLO5ruEFho/mGZhhzjUGfO66xaMXpbpYgzEOQQQ0bHMPDuxVftKIjyU/1cwR2QRgWBhuBLRzV80qof/LnA1Eu9iSRA86K3xAGsXVrBQ20sc4RaGlKPpLfRao6xvrVMjvoAD/yGofTalvfaOa2Bxwh4EwG6TBkYuqcSg1CASjP7n9ZO+FhPP/DXGsM8m6vULX2hcqKTk3FziHrRzQJUIl1cdKP/hs1n9GxM1wXOzkQedUV1tEVgHY8TV3qcK2sMGylZHfW4i6DmzIHprxWyBKBNzdeYZrn3uAiJWLbebw88YifdIfrO+b39+i65DZVFdwF/wBu8QPh4D8KJOOwPqgaAlGwsdUZBXQvEwHPOV0i2yN0yiRPleTT7DhT43tG1TBn7FSycvCs4RwQuJVIwiGyERNxNwBVWnM/9k5/L57+LE663DkJ+F5C8bd02z/ordI2Q2SlCOSnnmZgIevcgsAqm2RWBiCcC1Ch/mq9ZDS1xFlJJY42hyuRuoOA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(346002)(136003)(376002)(39860400002)(4326008)(52116002)(9576002)(86362001)(33716001)(54906003)(316002)(6666004)(33656002)(6496006)(8676002)(26005)(8936002)(110136005)(66476007)(38350700002)(66556008)(66946007)(38100700002)(478600001)(186003)(9686003)(1076003)(44832011)(956004)(55016002)(2906002)(5660300002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/J2H3H+PUCucAPXuJeZimTmW5Fe/7DeUhmvMTAjoHEVyOKm12VB7VanfMnfZ?=
 =?us-ascii?Q?ZCD9He3EZ5gOmXPet0YSybZmzoRihiLIzrop3VdLz86znlhmSngxaUiNE+pE?=
 =?us-ascii?Q?KlGnoctP8JilvnsVvi438uTtuwIKFwcYsuxH/IsKD6JNWnHvMSBDC9sZ5v+/?=
 =?us-ascii?Q?og1mBIz1K9ZQGigFX2rLbTEXohKVbJC0SKXe15/euEFM+4crTmoGFtshBCis?=
 =?us-ascii?Q?5Ijj+x5B3thHmgxkJtVW5cvKiWZg1X/YvoEULM6zVYCXIqq/MwQe84UA3wUy?=
 =?us-ascii?Q?x1Refhdmzgpo+E9Ybr7v+oCihGR1Kh7wM2i1/kd4cWDgE4Bw0JsuCCy57DQb?=
 =?us-ascii?Q?sSMdOAKEglbb56Jo5l6CTHF8HOKuRK1l7hvJDSmc46HVkr2oZZg6ZbhhIATV?=
 =?us-ascii?Q?SsEddeD5D10R3IKGh8xCkW6ASdwXtfvW8Kc6PMSzf8WqeiDXRJQ3C4jsOqOz?=
 =?us-ascii?Q?IW2a49N9X2PN7JxouB9ly+C8w314DZzI14kkETRB2GRc1l8Eq64EQpTcOcQu?=
 =?us-ascii?Q?GjtXRGoo4vTFb8pchJBCzjzrrxeuxo5bTtRdIZclPGfQVVGtEc2o0MNezjl4?=
 =?us-ascii?Q?aXwFeUVnj2alxHroPMT18i9Cq2+C8Sps3alWTfUc3N421buKMFYSo3lmw290?=
 =?us-ascii?Q?DbvJ9e344O69dvLB/kyigBFG6bZGXwNIjUyp2iTXnQbSWSG77lJEtvy9wiy3?=
 =?us-ascii?Q?/ew+MNqmMkeJ9XZLsyGDyAcYDoGaYj/wPm4eSRc/7cLDu1g0AO8JOGq0OVUN?=
 =?us-ascii?Q?BjIFl58YZtmuwRqDCsxVe0B5iBUZL7IqbdzGVQVqsNPKjhK6IfsGcczYCqr+?=
 =?us-ascii?Q?ObudSZjsKoBlIe6/1l16gzrLVlP3WPo6534uFgNJuhsWM2sPED4XVj223Kee?=
 =?us-ascii?Q?HuMmPFZE1rDVtuBr1h2fQMJfR2iHenrSP9wskVuNKTWbdLQUeb2lMu4eOaPS?=
 =?us-ascii?Q?Lsv3DqzwJEHOvMONenHsQAxYouhg2a85Xu6zoKe1kFOIo+a7H1z0anzHR3lc?=
 =?us-ascii?Q?V7qJvH1JqRsuHSEY39kWcfMips00AXn/x5M4b3so3pVQEdd52YsIHpy+bz7r?=
 =?us-ascii?Q?Q5VGNHaX+oombTawUXbyETSoGoB2tjEKRc9MAWXh46s/q1TXcR3vi7bEL9XU?=
 =?us-ascii?Q?apcFSPoeEPIuiIhupOHnVsy2y8SMpSU6UP8ihFPS7A5mKghgMotepdhnCzX0?=
 =?us-ascii?Q?mpu1/lXjGNflP/GOO8G/YhbEDxmJ9WKPqWgEKuINwzGtSHIsrpyZzWJh7ken?=
 =?us-ascii?Q?CxiITSDUeKYnHUmTDNV7N4rT7XHDBQO1OgTCDWNtjsomBHC0xwSOttcWpP15?=
 =?us-ascii?Q?/nY/WXtbunHUrvBToOkVTHou?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc26c4d0-00d4-4057-68e4-08d95d5eee54
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 07:00:55.7353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +O2seG2C6I5wEa5jLZVYu1rsTG0LmBhYOzMirPE77xzf2XfrvbrsLOGK5HB181Sz6M7h5hFrj1Ohc+oGX0ILSE3TbKTkN9vc9+qjoAa4sZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1488
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10073
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120045
X-Proofpoint-ORIG-GUID: Id4hGczW0ha4AgmwQ1pfb-fMdMa_bv2-
X-Proofpoint-GUID: Id4hGczW0ha4AgmwQ1pfb-fMdMa_bv2-
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

The vmw_gmrid_man_get_node() function calls vmw_host_printf() while
holding a spinlock so these functions need to be atomic.  Generally,
no one expects printf() functions to sleep.

Fixes: cfdc3458db8a ("drm/vmwgfx: Be a lot more flexible with MOB limits")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index ed9c7b3a1e08..16be71c4c679 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -506,14 +506,14 @@ int vmw_host_printf(const char *fmt, ...)
 		return ret;
 
 	va_start(ap, fmt);
-	log = kvasprintf(GFP_KERNEL, fmt, ap);
+	log = kvasprintf(GFP_ATOMIC, fmt, ap);
 	va_end(ap);
 	if (!log) {
 		DRM_ERROR("Cannot allocate memory for the log message.\n");
 		return -ENOMEM;
 	}
 
-	msg = kasprintf(GFP_KERNEL, "log %s", log);
+	msg = kasprintf(GFP_ATOMIC, "log %s", log);
 	if (!msg) {
 		DRM_ERROR("Cannot allocate memory for host log message.\n");
 		kfree(log);
-- 
2.20.1

