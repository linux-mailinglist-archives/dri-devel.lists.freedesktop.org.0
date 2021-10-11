Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDCE428D39
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 14:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87D889FC5;
	Mon, 11 Oct 2021 12:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E0389FC5;
 Mon, 11 Oct 2021 12:40:29 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19BCTKiu022706; 
 Mon, 11 Oct 2021 12:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=8uLva7CMEPi/XxAxxcdMwhoM/iLHSnHn+IraUGRIp1E=;
 b=TOb34Ky8PVurDjPLScc6xIT8bkqnItrHRVfQ0Avla3ensxab5sQ0KRrAASVc+bSjlbkY
 HGMXITX1umLHiMK4aZ7NcxvKX5+SUDtFVxf3/dJEVO+lN5kaXKaks78lA03KwJpzqs9S
 TukjZXFpy88KdHcYtOHXxsyQxlXKFxGiOH4QKlq+Ud97MD614fSX+p5JYWD/UGrUVjuI
 UTSyu5Q5YlQ0LmQuw8DyPwQ08yCKfNSSUddrJNJHgP7z/056Y5Ld/3450arMUzZhlYYZ
 yjK1met5BkMFGVGn9oiEnaK1ApAAoETYkdWKBPaXByzQ7UlYHuUTYdMT2FJC1BFIgEhv ZA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bkxxabp4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 12:40:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19BCUtYB191065;
 Mon, 11 Oct 2021 12:40:21 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by aserp3020.oracle.com with ESMTP id 3bmadw6j1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Oct 2021 12:40:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDh16BREQDscAVS6DiP7i6xIW94UmYZ6ju53SrmC7Ut+y5M0qM6RwkHmtYhIVDxi9MXZ2dCBCAks+r/4UIDGo5ZkYd5bIcnP7RjdlR3iOfpHNeJOx5OkEmjDHBw99PWC/xHeplBF0bVJfg3L2v83sE7VwYsQsg/PeGjypNiMlDPLN19F6l3qmnbGzbNKcHgNYqO4yVGXqA75LTUWZW2G74DlWpidVczyHj3403rVFtrPqN5PyTH7H5giBtBYdhB97Kem+ICND+4ga9z705nQ1CoqXgWMg0PuUr2/HMRYy58fvhCmxrmikvsWqG9hKTZzK9Ot6IBzlT1fmNsQltSxwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uLva7CMEPi/XxAxxcdMwhoM/iLHSnHn+IraUGRIp1E=;
 b=aN1zL0b/AsuiocnXnnppwaVqhuhQv55XSOCms/iQSuI20vMIF6am9GpSLY9zyz45sjqaMzKaT1z3w2AJKHNmxeGTMFhWv0yfQ6cvnSf1IDrLo45389KC7Q53+uS9kKRcFuyrgFjFsutWqzJKbbvvLhrwwGqAkVnxn44yS1B/T/ItxPh7ar4He24QzzNgKcW8BlkC4KyIF4ZyLLNTDriKRSyj8YnGfd7kjegNTVkAxdT9sXuh12e349hhxsysra7YQNjw/vC/ZRtl4/Cu65dzOWNLSB1Qtx2ZlLaqoPZQREiAPQtou1P74Uw4eva78WEqio96DCtsgYP+PF1F8GoZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8uLva7CMEPi/XxAxxcdMwhoM/iLHSnHn+IraUGRIp1E=;
 b=fm3KzQouX5QTyt0LUr3+wqS0eGuGD6UPdUINS6V6P7Zlhm8qJ9l0ujiGmWjb8ZtHYGURsQfKHWn9j05pUzy54qsZ/oQICwag1/C3dJg6lzxNabnyZd90Ag7Y9Mx5w+bg/SNdQP+tGU3bz0gcf30xStsp9Hcphwp2FY6J3eZ41GM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2127.namprd10.prod.outlook.com
 (2603:10b6:301:33::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Mon, 11 Oct
 2021 12:40:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 12:40:18 +0000
Date: Mon, 11 Oct 2021 15:40:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm: unlock on error in get_sched_entity()
Message-ID: <20211011124005.GE15188@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0130.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::9) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0130.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Mon, 11 Oct 2021 12:40:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69ef4a7b-e13b-454c-790d-08d98cb4484f
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB21275B853F5D201898E4C4A18EB59@MWHPR1001MB2127.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kj7syl/jIOhW9h4/3xRwFu5/YdjHTjmD8A+Gw1em1/MY5g7jkLV2ldWgTP5Gk7XVAEYzN/IBIIqikfW1NbRtz4TSxQXbWRzvlZoy5sbddcdO9vLCWBqcxu2WM7Tj9NgzRcgkU8oXdrM83pVn3q3M3GiAu6zPgDxjsrDv4QNJCCICc0rlyhfeMzi+1TSMxhYyOTgsI4xXHptxw9iMcd8x4n2Sf5fobKT2M/hfn0CITDs5yZMoCPuBNLD1uJRpMJRBhxqVt/wgxK7Xm2ETtLW8D4ic0zpkdLYiHlWzLhRx+LOmFzfxigw3t2vo6nHT9Cy1loCuCIx+QOEZCWqG072jbUXBI857FXVyixOXj5l1yjXJTio5nxd+krMhkzkBu2YXCM3Cu/WBA4rTyFaS0bEHu4DDTbkmq+Haarlb6SmArKPnXP0LRbY465+aEFU7bGrrx7tmBOdZwh092V7UPbLmLU6rZKKObt55O28/y30nJJNUjacaiC/+ls2qJqeiGN6O5ZWfM/eDKNacOTyOpd0DpwpkqoqCxafnYOKoi/5wttFVGEKQGfrmPEe+OSzXuMN5acmNDYpAAK4e5/UubEbVf4L6gHsXIK6XIZKu/NWDRwLdYt6n8kWBZJ3XXGeXxM+jNX8f5mjBDKg5CgSFmQgXF8r16y5BuYRhKJ2/pFIATvsc1gipJT95o3olHLpmgWburc8ct2vy5e5q2eTSfZtHEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(4744005)(9686003)(956004)(55016002)(26005)(316002)(4326008)(83380400001)(6666004)(9576002)(186003)(86362001)(66476007)(66556008)(5660300002)(66946007)(1076003)(8936002)(6496006)(52116002)(33716001)(508600001)(33656002)(54906003)(44832011)(38100700002)(38350700002)(8676002)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ywxvtM2Wip8F/QIlFIb5slvYi/sMeC4+M/E4HRfrKmaEf11AdA8ljVdBL3tY?=
 =?us-ascii?Q?r2gEOROElzurbv/6joWvrTjy48EcEIQaStEyv2Jm6L1x6AcsCQ4PgaW2nWNs?=
 =?us-ascii?Q?yFG4adDutJhCJzBE/tjZedVl1sSE+XYBi+d3lku/baTvd7S5v3cHaKEmtTv4?=
 =?us-ascii?Q?HgyZCPO+VqHigTtO+/NO+QR48q0R6NhkZE1YnK91KpG8kxQP+pIH8+YDoTl4?=
 =?us-ascii?Q?BlAwiDHIPHYAe5B8+1ZTY5ZyRh4x9626tojkZ1u6tLhDpZWbSEI0TDgPHWcE?=
 =?us-ascii?Q?tNjuNn2jxelxmmOqPst9Xis+uSgXFSty9go53LbKqqBB8zz94rdJ3ztOVcwK?=
 =?us-ascii?Q?rdC5UtBmd1Hv+a+qoEcLO+qaMnwLm79O1f9lDu3lHnibfJGkLKgxOsaVMhtx?=
 =?us-ascii?Q?KenKHTIoEGBq0AL5mekabFQ8b1nHJUSminw8q0Cpf11JWgDpLQS2QDVMFW8B?=
 =?us-ascii?Q?d2gQkeDF2GSqSZ3TCkrRpYGuAnSSz+W4sZr7rLfuYBJAR34hz8vL2vj9X/tm?=
 =?us-ascii?Q?MD1vRd4WIvAsapiO2LOIUAOYVUAP2roDK7Y5yczCSVW6VJtscoZJJYISJdcx?=
 =?us-ascii?Q?2QFssB9PTCEySGvOU4KwnKf9QGtJijJ65STgTlfFASWdcQdOf5u+UeiQcK/1?=
 =?us-ascii?Q?KxGUjbwc1LOJXj0peUI59em94QrWCk5AuRDNOR/HheJ+au+H52t6cCv8qhq6?=
 =?us-ascii?Q?eM06M/9/F0J6ZebJ9qwY4gyc0NsZJQd6geZDucfRzmsBvIAo0lfYNAaVXvWr?=
 =?us-ascii?Q?Pj2CgEOaVZpCg+sMJFfgJgbIIl5fmbPvBH0dP7sNzwDWVVru3yBMPRdvUrpL?=
 =?us-ascii?Q?LFHfhMtLFvMY/MIEQpOuFPJCVZ6foZ/T/8RLwRA+/pi3bk1jIseVdsvBZZ8M?=
 =?us-ascii?Q?Gftfm6Ccul8E9XI84eltjpqU+nIatbYtlU82MgIa/QE299uYxeD4MVxWYYDt?=
 =?us-ascii?Q?ohOP0LReBgOV0vu7M/8CjImelpuf2OkpckXk6xuSzB624+dNZPXBuok3XZmz?=
 =?us-ascii?Q?bBJhon6HNYKwoZqweRDT72zAvUTw/dpugW9rLu/yZ40LxTFTEhvNigaTnJP3?=
 =?us-ascii?Q?KymNidsb2hE8bDi+PZQ/OVPtVleBxrvsbjkRdy0TT3bfC4PlKebecVfj8KB6?=
 =?us-ascii?Q?BSHyMZLF/5Ad3Ha37fDOpr66pKoOLh9jNUkXosNOPHelBLGyIoPKPCz0L+5J?=
 =?us-ascii?Q?wncoBAlksCQEGsM4+oaENmPcu3icmBxhWTit3E0zmzxjyVn53Dw2C6GD+3zi?=
 =?us-ascii?Q?s6a4yA4kIiaLdNoHQnSUh07QGb0fkNe9y0w2Jxdnwp+8uZeRZrz2n2SXWV9i?=
 =?us-ascii?Q?iI+YS1FACjRO018T7inZytXX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ef4a7b-e13b-454c-790d-08d98cb4484f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 12:40:18.6094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXWa1d91VjmUO51qJOivvuHXEuXaOpluUpLIi6ZPP62NaKlp6mSsVhdB7AZpTIh5CCHbUMsGRozaZwJeuheruOb7lYvQzDaiT7NYZZklcLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2127
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10133
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110110072
X-Proofpoint-GUID: 2KRIQUVwmY3IrlTGnfHPKktl50ZDOMbz
X-Proofpoint-ORIG-GUID: 2KRIQUVwmY3IrlTGnfHPKktl50ZDOMbz
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

Add a missing unlock on the error path if drm_sched_entity_init() fails.

Fixes: 68002469e571 ("drm/msm: One sched entity per process per priority")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index b8621c6e0554..7cb158bcbcf6 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -101,6 +101,7 @@ get_sched_entity(struct msm_file_private *ctx, struct msm_ringbuffer *ring,
 
 		ret = drm_sched_entity_init(entity, sched_prio, &sched, 1, NULL);
 		if (ret) {
+			mutex_unlock(&entity_lock);
 			kfree(entity);
 			return ERR_PTR(ret);
 		}
-- 
2.20.1

