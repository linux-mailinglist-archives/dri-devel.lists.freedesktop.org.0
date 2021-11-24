Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221ED45C7F9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 15:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACFC6EA68;
	Wed, 24 Nov 2021 14:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A499A6EA65;
 Wed, 24 Nov 2021 14:49:35 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AOECtYp026924; 
 Wed, 24 Nov 2021 14:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=UU5R75cfkumRwznlkHlD7a9KEa5mFPEzRwHL56aYwX8=;
 b=wSXj5wF4y0yWQyIvI6e0cTBeyeOc/xeq4jkGgiYmy4cqgBiZLcM3BaU+iXSDwi5ubq8X
 oPCki+eyD0J7qbj3jzHDJUot3nKLEKJ/escApIfRx5C4f4nxVn/+Fd8pO5cJgMzap2KX
 W/DtkU3TJ3lrzsvRAvXr9dJa8PdwIfYUMejZp5nQq4nhrkbtg7qe0Zrd9RVYpYwEVnU5
 +YyO1XXctzwGbIP068lKhz6NI9RpXiSXkKdh3b6QnPGNIeQncI/iEypWhW8kLmt/Gva4
 NclDDxcXgHMpqwHMl+b1XDoV5UKG1zT5KHeX66rE0+49ZtJjLaoHGEdCedLmR+bwCrRE xg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3chk001jdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Nov 2021 14:49:30 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AOElKiA137011;
 Wed, 24 Nov 2021 14:49:29 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
 by aserp3020.oracle.com with ESMTP id 3ceru74mua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Nov 2021 14:49:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apF1KmI0bqUC+rDRrcCwYe99D2youv4a8t0fM9LPtqLjYbhO2BBr7Z9PDaA2sTdr4lVsII5X6FUsAOAkmy5s7XXsM+6X9S8TBwzT6tYf0+GFBLuU14N8siR24ggpAMxZQTYP70Fp2JMuAuk42TAfn88E9zg/Bcaz59AHwSXVh7eVIf2UzZaobBpRc8CcBKkRZfrbPPKNB690yQzlvpq3gD5dAi+ypDs0vaxwhQgXTB2iSpFxpRoswT7HSM8Esb+3ZsexgfaIdVBcDdO77rr05Jgg8Xs/YD7ci6Cq8DmYuj1TGXcBxmLj9WvWwdoq62iwfZW52eYD4cWKFxLfrHYePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU5R75cfkumRwznlkHlD7a9KEa5mFPEzRwHL56aYwX8=;
 b=cSAZAIF1VIK9hyZ08utd4jwYrI1PaUjTbed06x9SSH0VUsVh09snrzeB+Tlla3URvgCH2Eo9NmWy59X79h6gkaITkf96xJRanlPqyAyA7uU2HQYYKJp3sSnvSsFsHRS75m8MnJrvcW+VjORQF71wx7J/JE585pt4MszNMPCKTzBdL3mu9Gbc4UfOOqF8fXijqcrdBpaZOpq1nSUute9ppI1VRakni0EYD13vgRusVlNGDIg13GJeLWIyNnK9AGgHYwZtZETI0q8Gn/0cwsmhlJgtXH0TA7NWxXPOCuhfJp6ZjoRmsaZlK6lkDmZ2toHZAvhCcJ2LKoUP+k9/7gEuig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UU5R75cfkumRwznlkHlD7a9KEa5mFPEzRwHL56aYwX8=;
 b=mM99FfgR0k6jTeAqeFPwjrGFBLHVCT0pkfrNEpcaWjJF4ppXC/YM2HVJ0mWw1m5YjnogSqIwY90MGIBtYLaU6n2KwoBFAdaiLG5XfqfzPR1hjMT24dF6rRyZi2lX1d8acLynGPutRLg8gpthgbAx1FyX/UrP5jYqF6e56C2cMoE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1821.namprd10.prod.outlook.com
 (2603:10b6:300:107::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 14:49:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.022; Wed, 24 Nov 2021
 14:49:27 +0000
Date: Wed, 24 Nov 2021 17:49:13 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH] drm/i915/gvt: Prevent integer overflow in
 intel_vgpu_emulate_cfg_write()
Message-ID: <20211124144913.GA13656@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZRAP278CA0008.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Wed, 24 Nov 2021 14:49:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 887ebaac-dc2d-48c4-f263-08d9af599cdf
X-MS-TrafficTypeDiagnostic: MWHPR10MB1821:
X-Microsoft-Antispam-PRVS: <MWHPR10MB18219F7645620450D8EF8F918E619@MWHPR10MB1821.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1+oMY03Dbg84+1C8OChbuOvOJKpueMTiLgS9Kam/ow7rE7q8Wyy4U6KdaWPMK+zrSeid54qZVzL6RudbclkRg/EisXk9p2qDc1MT25WfS9daeLnU+9rEAyyzBVYgSqBmLzak+I7VjdnR7Ikjr8+95nYoVbmahOCbghcp70DJenINrSUNcWH/zakl4VWa/nMh8DmGzgi0N0Hb4nQVX1xBlUPaoQr3yLkyktWaSp1mPUOngL1HH3ls4clTWHugwWfUM7Q2QmGrdpFVdP2yn+ZAifaIbQVwTF7Y94Ytg3wBYJmdn1+703pEcbGDJDGWGFbcxkAdbZzT/L7yj8M7zguU3elxI4WzH4vYfR8EY0+ByBww84KoGqdam6Fx3gJ6WXiTik6b9l3ljsdk4NT0wO6gwSTLJk24tmZ0m01xCFGM2Y8FSOzjZrPFqBwmjheoScLKmLX/tWbpaF1VSGzGOQFUZvYtySjI1dWvLQuFxAKT0a18QJVIaVE3RIdDORpHJZ4LiSwoa664uWuP05ZrFjvbK5v7/v2mxbLOLwe3N1V4GtE7OuIsKsfFzQPeTXr8i51KRugyJLrC+F5rHKgjraYPMFiLoxq9irILZU5GKxnVDCIjgM8uZFx76qkbAGRmG+IWvm3i78VWUUXVQIkeDWIaK0nmT867QywxfCjHMJ71eiYGieqxXMUbRrtBQRLKWw6cyvgrBTwbbT4zlMyIFsOXyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33716001)(26005)(52116002)(2906002)(6496006)(38100700002)(4744005)(33656002)(55016003)(4326008)(186003)(86362001)(66556008)(956004)(38350700002)(44832011)(5660300002)(8676002)(8936002)(9686003)(6666004)(83380400001)(316002)(110136005)(9576002)(54906003)(508600001)(7416002)(66946007)(1076003)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BjknjfANioorQ9oT7TNAeo/efpLmeQNkGsdCeIvg9XTJOqtgTCk/Yzchl6rM?=
 =?us-ascii?Q?WKz4/glZcuJMioj6dO8q3tP5CyAz5PIu32XPjfxVxRCMrsEuCmqclxw0tiUr?=
 =?us-ascii?Q?iCEA+zqU2NJNHdhBob1AGRa9FkpWI1KmFDvgF851oZc3t2shMJiYwsebAwJ/?=
 =?us-ascii?Q?0Ea8hIpzJtAcJEkhwhnXiwXoY1kuhCVbbjS3jwbxrwyaQ6p+fDSPj3dbIKhx?=
 =?us-ascii?Q?4f7XytP/ZHm9Sxj+OFQxh0WWCBjOuWMJJhTZzASBFQeOkPrg919t9HQK8Ycd?=
 =?us-ascii?Q?eRH8R/tT2gxt1UAuVjcc334Uzx04Poymu0Talg/s88w8yU5S3wenMOlvIYr1?=
 =?us-ascii?Q?Noq+UMfSs6l/zN6ctOV1bLi9C/xupAZqYfa9W87dPtyLTPgxY0Byird6vYM7?=
 =?us-ascii?Q?Qs/yYVdZ2ZipLV2VvzWF3f4gdSgPvri7NGO4ZvDi9FBxa2kL1NAR1W52v0PE?=
 =?us-ascii?Q?SQG8UTkqfGdnpZNQLzmbugKrlbno0kZsRZ123x3R3+LLFYuR14CtsFIbCjwf?=
 =?us-ascii?Q?CHkocJv2ayYsvmO6M6/8BKrIEhFuBT08H7ZwXB/r+v6wtA2GzoH/tkzgAGKu?=
 =?us-ascii?Q?hiX9Jf4c8Ky46ZuO99JMJqcBBFbSqKfqM7f8nvk8JRjKvQDVvoEFGKH/PPXL?=
 =?us-ascii?Q?B0iuKSc5QWfig/XfciOXOKeO5JbJWbXL55Q+yeFmObhZ0Rg5Wl0h6Nr6GoSc?=
 =?us-ascii?Q?N25op1J4I4O1qM0J3so68r5VFIasIacVYXXLP7Kbryygobbv5+paAgcZCnwi?=
 =?us-ascii?Q?7wJLSNFPmdU9dRIfALFOC44nKHotokjtFxb1T22hZCg1kNX6qtr2Mx276DNW?=
 =?us-ascii?Q?eh8vslD256grVQv9lehMhhlY2a+VBxTRU+2sxbovLe//wSaV9DEqhjYj0SIT?=
 =?us-ascii?Q?pBOVUfJ9eiaGSqSNpjFrby/hyPtTxZlqSrP1x0calp4GijcrqWVwzFcfh9Qx?=
 =?us-ascii?Q?s5+UGbg8oISjndlD1TMfpT5gjR/7wOFZka8Rrq2LuA+7DKGx3LK5wp8VAS4s?=
 =?us-ascii?Q?bfPQRPbUMo3YkZ1kEBhcNa6rvo/ZSfIUeecQYxdabXx90S/jO4ELLtowF5Fb?=
 =?us-ascii?Q?TbZ4+Bg34gwSapRSgo14vEL27GfzfqhNSr50CJWbYrlH7qvP/cdL51vKs4i3?=
 =?us-ascii?Q?TDmNSrFovNYvTG4dDKm93W+2TNKlUYCFCIw/uuy48o40hNGPpLHF26JHgNHL?=
 =?us-ascii?Q?nsw+o8vYiaWrtleElHX/xBG9L/FrGXujQCijVhctAogW945TZKaPmmdK/iyN?=
 =?us-ascii?Q?7ZWM7LgcxxlNWUFhdEpYvFgKGuxa/J1sD9j2uQZQkxvktI1Lhep/s3TuoJ5m?=
 =?us-ascii?Q?/LFTWicY1eN4R903zW16xe5szLLnFlZFAyXfD6tHsUptgcM6RyoH+CG/55oi?=
 =?us-ascii?Q?fISLYi8u+kiY7QhLCnVP9rjO+m2gN0pBpiBLpkqZMUHXd2JTq1y3K2ikQnpV?=
 =?us-ascii?Q?3NUlymYOO0urms0Bf22sunn8TzGYufF+EGmXq9SfZ/gc/dhrL0ffRY0G5TcO?=
 =?us-ascii?Q?teoqYOScY7boozPb97d9wKQt6Q1xhN8l6vgKIcu64X8djp+pp64gQTu+0Yeu?=
 =?us-ascii?Q?nAUn5npMFynDmVg+WStWMLCkFMgspvPcmNvGzfKRJ/pugOt59b+oa6HkMzhs?=
 =?us-ascii?Q?l0Drlo1kDO8Y7Xwqsx/WJssbifc+wK+730Z7HwWtRhnTR/MFbdZK59vLoPUI?=
 =?us-ascii?Q?ioFYHOh/r3CiD120wuged9DDnNU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 887ebaac-dc2d-48c4-f263-08d9af599cdf
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 14:49:27.1266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I1V6x6KjeepyHV1dL4rZ5wtjKS0Kt4lW6pHzAn8aHybEq/1Ixdh/6/xM/5On/NL7cLOOn32gRgsltrtWSqlYTdm9yToyssrAiKw8V9/5ym4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1821
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10178
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111240082
X-Proofpoint-ORIG-GUID: r9kXK26y5Y8gSV9_qnDaWrLdgB2vYh52
X-Proofpoint-GUID: r9kXK26y5Y8gSV9_qnDaWrLdgB2vYh52
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "offset" is a u32 that comes from the user.  The bug is that the
"offset + bytes" operation can have an integer overflow problem which
leads to an out of bounds access.

Fixes: 4d60c5fd3f87 ("drm/i915/gvt: vGPU PCI configuration space virtualization")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gvt/cfg_space.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index b490e3db2e38..8a54dd3de91c 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -316,6 +316,10 @@ int intel_vgpu_emulate_cfg_write(struct intel_vgpu *vgpu, unsigned int offset,
 	if (drm_WARN_ON(&i915->drm, bytes > 4))
 		return -EINVAL;
 
+	if (drm_WARN_ON(&i915->drm,
+			offset > vgpu->gvt->device_info.cfg_space_size))
+		return -EINVAL;
+
 	if (drm_WARN_ON(&i915->drm,
 			offset + bytes > vgpu->gvt->device_info.cfg_space_size))
 		return -EINVAL;
-- 
2.20.1

