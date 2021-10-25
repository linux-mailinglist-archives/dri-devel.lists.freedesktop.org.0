Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB55439ED3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 21:01:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F263C6E1E0;
	Mon, 25 Oct 2021 19:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2DB6E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 19:00:53 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PHnjo0030370; 
 Mon, 25 Oct 2021 19:00:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=7lXaKCJiWZ6P0QIzVf0jAqXIKUr5SvLSKWkgTMUehtU=;
 b=B7CPjZP1hUKeblu7LNSNi+GHXzUL0i5MvZlFtSEZ8rQNEuU0taOQrKFzdlJkHWuuEZMf
 Tb2ziXT5bdZ696GNiQEz3Zk8Kzk3/WX68h7ti7DkLV/A7kuJX0SmGixFwevtTdpoR5sL
 gYvBn4E5OqzA+B7/Oi+nFbUfe4Yd/ySWPXVKTYrBo54zMSrC3M/yFoQRuSj5K2L91X42
 A3cHykQVdN0F9RZqnv3ClRqaeWh/41/0RmEsX6o4TMM96J/AgGae7/7mExji51vXb5NG
 NO8nxjGsR6/j97fOn4F7JUamCGwLpnw9irc9efK4KMmZodYoQ0UVPK8DJgAXj0LC/gS+ JQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bw6v1w0rf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 19:00:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19PItsrS124056;
 Mon, 25 Oct 2021 19:00:51 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
 by userp3030.oracle.com with ESMTP id 3bv7gv61g9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Oct 2021 19:00:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3mhMITgGfkV6nZkJ6MeJUSi2yE15AC9pPfKoiGkMjmCcZXaQ/kckL6LYZjardu04b1gbLsrX36Y294SZhBBpG2LoISVuZSqyHyHqkoXUByBbZHPWx3ON8IvMQ58J3NM6A1p7aZpyUw2AcgumGrcK/9FWCSBFfbmYtDuZ4pgDAvhZ21eXr2g9DV9NPVSEBr8wLQF8N5rGRPxdDtQ17FGsec+jYKAspxnadh9QUVydI97N/vFHvO0Hr7GUNDJ1uNFtDw5SoUhBFjNWqCg/30r2+c8gxysrRBSW3nbWLEFKj3M/JCJQ4J944/NWW/SY2zfulq6r72VKNk461joEE3I6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lXaKCJiWZ6P0QIzVf0jAqXIKUr5SvLSKWkgTMUehtU=;
 b=OVKi6x+JUd/bB36eaFk8bXmx/4ra5LVIawR3MULXWSE8P8whSHX+S9bx3U1PTOImDqfy9xbmaflujBOb0Z8CzSP1tMplib2LM5qEjmoUpz7AnUXDrFoBqa9AbRP4RF4ts0MVAM8cRI1CI8tDto1Q5drJ8P06/BRvFlc+EjPUEklvpWEsK02pFunQuqbbh4WmiV9l6s5sU43oz6WpVabTr0dPBS+ioI0ckaTgx59hnO0AP1m0kH2qPhuwQK2D0cfdmZoZNpOTicfyQQU3ACW9FQUh1W1xDIME8ygkrMi88DhgC6c7SeapDLrzxqV14BEVnR4+ROmOIlRlq8UfbTG68w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lXaKCJiWZ6P0QIzVf0jAqXIKUr5SvLSKWkgTMUehtU=;
 b=FlLfuqhpb2AI4P67nk/58gvuyuY7nPLWaoBoPreA804GBcj1tl1llEcrAb6sI4jncPdk5fDm2bJ55CxepEi0fcmoTvJKorCGjpeu6NRMqRPPIrzrfMaYhhHELtaN5RHblIz9nAgpIYyAvHp9EDpEMn2xt1XzNKedeWRZ27MNLt4=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=oracle.com;
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN8PR10MB3364.namprd10.prod.outlook.com (2603:10b6:408:d0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 19:00:47 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%4]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 19:00:46 +0000
From: George Kennedy <george.kennedy@oracle.com>
To: gregkh@linuxfoundation.org, tzimmermann@suse.de, sam@ravnborg.org
Cc: george.kennedy@oracle.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] video: fbdev: cirrusfb: check pixclock to avoid divide by zero
Date: Mon, 25 Oct 2021 14:01:30 -0500
Message-Id: <1635188490-15082-1-git-send-email-george.kennedy@oracle.com>
X-Mailer: git-send-email 1.9.4
Content-Type: text/plain
X-ClientProxiedBy: SN4PR0501CA0101.namprd05.prod.outlook.com
 (2603:10b6:803:42::18) To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from dhcp-10-152-13-169.usdhcp.oraclecorp.com.com (209.17.40.40) by
 SN4PR0501CA0101.namprd05.prod.outlook.com (2603:10b6:803:42::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.11 via Frontend
 Transport; Mon, 25 Oct 2021 19:00:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a662441-7a07-4580-b804-08d997e9c05b
X-MS-TrafficTypeDiagnostic: BN8PR10MB3364:
X-Microsoft-Antispam-PRVS: <BN8PR10MB3364B07F1DEA7F6BCFF0AC07E6839@BN8PR10MB3364.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yCX4oQnrZgDBPzX9uJejfis47RurSs8o0BhgmLFEZ9LRGQLKAUfs1iyCiExLv+Rc8fUWBU2Q4Y+RuuOL9f0XMXVr00dC28sH1uuPZ3X02w7DIQZy5v4YfKMhH4YHtgHFERjS1DmWdeHMIagIRtcO4TqPzyo7g5woL6/ao2OeEuBuo3JO/QvINK2nk2QUDBE9TQ4cKkOJTR0ogf2fR7kJ4X2c2seX6k7kg6QOZXtVdddL33uAYpVcRAhvU3A0fG/5QLewcoHgWW4koqMMX69ZwoHAWIa7y0nC26r6HxQBS+BoW0n8vkYsWWx4g//iN0FSw4E1Hk1kzkmjpV5NDhUANkK97icEWj/qWRMfW8/w5WDO+CZ8WHYouuhHKvMrn5cGdI0+sXA0t/jfmbJgvjiqBk4G7IbB17B2+Uo45ZqLs2Xi+nMtP1NKKaZUED33dED6q8Bm5q6KxxIqiMFUuIoR9RHPjNl/Fvg1ikJhHYUYm8X6tSWo1yNXmPacRcIZ8bsSt5DQPTZx75sOqEhbhqQtulUB3rn3sgUSbpJBiNOdLSbabarK1yoVi7G3koMWariPMTE8sndNjf883ejfZJ54UkW8yMIvIVC/70ufLGgLzRiXNbfdjOQmjXxgkOJSvzsYBPfndD4bNLPw3wH5dizRGdP6H67U1MORtNfnRmm70XB/hA+uswEbZnj13tjNK/cUZ+bM35+fMY0sdUk5MRkETA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(6666004)(6486002)(316002)(186003)(2906002)(83380400001)(508600001)(66556008)(4326008)(52116002)(86362001)(66946007)(956004)(66476007)(26005)(6512007)(2616005)(44832011)(8936002)(38350700002)(38100700002)(5660300002)(6506007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pYjwyYdPBmcrnaEI1/2PsTdeioHWgB2ZfdmbIGVvzZmNgQheHHRswBDpM7r4?=
 =?us-ascii?Q?OAEi+PqBA4W8UBOcmB74fl79oFInW2Fs8mPupqpYdkqw3XS/SdlZSmf/oW+7?=
 =?us-ascii?Q?DBDe1ENpqvayypPm2T7ZZx6tGbSfKgJrjMG/9KhwK42HyJhLMJBaDrrvauOA?=
 =?us-ascii?Q?4sIhSS9Jt8yz5W29Itb/3XPESINURF1+3rBSY8zD/HYyYYa1cORSuz2Ljdwf?=
 =?us-ascii?Q?q6hRYrWZIUJ2fFIvctLCdGyCPHc/EJhBV+noSzqQPaZGH47EIFqVfFwlK5zi?=
 =?us-ascii?Q?lwS6k0puEEy5K2Quc0a4fy/TnYHFehfgWDsp+576UBaxw1Sz4MRyLFBL9yFu?=
 =?us-ascii?Q?OsSP4LRmU0FpPXWeATGPFp8Yb9z1a7XMAkyip+VRDf9nVBl1yl7uIKjIRLMA?=
 =?us-ascii?Q?c8NiWk2hIo/e/+1RcXCi/qVsTEfb6Fb2DbKF2DSSKfEZTClNzQUqI0Ievjlq?=
 =?us-ascii?Q?MkMsr5zcQqP6wt7cM5oxDSgaV7lbpyVadMr6XZb6kouEjkY9NQ9qCFa3kqxF?=
 =?us-ascii?Q?UBNa5uGf79wueNlHh5MkVwUfbu4PSYeXvrPzLkXADia5phApJ3tM8OJnk+w1?=
 =?us-ascii?Q?Dv1iArnOlpuLXxT/MU9q4S+jaaf63g80irCjBHsUZ90UP6YE7cOuNWZzdttR?=
 =?us-ascii?Q?xtyUkYhnv/Le+251kc2zJihzJ/3OCC5LpAt4FLvr2m8pj6y/zVu6r5cUzJ4w?=
 =?us-ascii?Q?BFp0LSBwJUcWbAtOnyycyPebB9CJ79I/s84EvnS+5YnDFePgAa+SRwG4Yiss?=
 =?us-ascii?Q?7Z8Sd8fbOWpRtuwB8LT5ZFxxcnxFjXpYHsCW9d04KLiT+RRE0aeKRB35UeaV?=
 =?us-ascii?Q?lh/rZQG6R9C2O84DgtQO2vxP04sxmtHH9yPVoSlELGmqOgGrsVcD8doE3OW4?=
 =?us-ascii?Q?Oau2y9fU7sGmb41XuB1SE0YTcdjLX6nmN38psYcKIdkyoawdXZ5qGV1UZt2L?=
 =?us-ascii?Q?YjeeT4sVG6cke5IwKHwyVTQ+U5UU4blAEVAsC4Z5Rnk3Vlrg3o5brkxb4QyS?=
 =?us-ascii?Q?sjMqX1rSlxLUsGP/pIVwPgsXBf//iKAoXKLaCx8hNPQVhzqEZUsJEvd6f0+D?=
 =?us-ascii?Q?KDCiMH0IvCKfMP6w67P0I/qJDEGDSHHbdron835S1LBUUARxjf4uONKTPLOH?=
 =?us-ascii?Q?vDpR+nM6RZqZbmatQFAJjfpK4aBPOtDqA9xRvkHoG93JsD5YXemVCwoJYQg2?=
 =?us-ascii?Q?sdxJW7dD4Vqg2f3ZurxJtYvTQXAttfYSyjN54RZw4tcGHvcxm9uZ0yXirEuy?=
 =?us-ascii?Q?81PiX+LRx79t3o6xyEEuhrhTSIJnLhoRK70xC4HHocqGHP0ysz5ur4bqGc46?=
 =?us-ascii?Q?eyi3evKm340Ebxe8Cs6lh1SoTfSyTu4jr/XWpMyv7RVQQjJD9FogDqb/tWTi?=
 =?us-ascii?Q?zPuau1pcA3i+wfeoglkPQ9gA+qwHE1FQPibl3hUfgS0Hi3k1C3xXIy3n9fFk?=
 =?us-ascii?Q?gq+QF6tTXuVcNZtRhXT+jAKR+K2l2ybfMfiHQvD20JgdfKp5hj9KTWP3SeDP?=
 =?us-ascii?Q?LRTUqAVHAkbFvwoQ1CmolA25E0RawqrfNQtgtTOehPYJHL3pnZTUlIBAJsEY?=
 =?us-ascii?Q?/++DE4RAFf/3fx7Vn08aoAH/F8k4Dfn/hn8XPaz4Lhsm40zfdwcs8UJDj+aV?=
 =?us-ascii?Q?h7dCYgmZ/TR64ulfRgSt5sVuSgEWUpV18750qEi67Qggu8u1WdJhPKs2xPVO?=
 =?us-ascii?Q?8iWReg=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a662441-7a07-4580-b804-08d997e9c05b
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 19:00:46.1719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BW1SOq73VD+Y/pGgWZtQRocPD1t7sIclOq/ejL8IqzZQ4nKKznburRcPbI/s+IrqYIUFXbbL7N7Kni9+6ofemvrGxzB5KJ2DzvFTwpIRS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3364
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10148
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110250110
X-Proofpoint-GUID: 1ITtTsz_fOxPwDVxLP-kznG2yrhEy4KF
X-Proofpoint-ORIG-GUID: 1ITtTsz_fOxPwDVxLP-kznG2yrhEy4KF
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

Do a sanity check on pixclock value before using it as a divisor.

Syzkaller reported a divide error in cirrusfb_check_pixclock.

divide error: 0000 [#1] SMP KASAN PTI
CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
RIP: 0010:cirrusfb_check_var+0x6f1/0x1260

Call Trace:
 fb_set_var+0x398/0xf90
 do_fb_ioctl+0x4b8/0x6f0
 fb_ioctl+0xeb/0x130
 __x64_sys_ioctl+0x19d/0x220
 do_syscall_64+0x3a/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: George Kennedy <george.kennedy@oracle.com>
---
 drivers/video/fbdev/cirrusfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index 93802ab..099ddcb 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -477,6 +477,9 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
 	struct cirrusfb_info *cinfo = info->par;
 	unsigned maxclockidx = var->bits_per_pixel >> 3;
 
+	if (!var->pixclock)
+		return -EINVAL;
+
 	/* convert from ps to kHz */
 	freq = PICOS2KHZ(var->pixclock);
 
-- 
1.8.3.1

