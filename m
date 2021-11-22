Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6BA458A03
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 08:42:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5035A6E9FB;
	Mon, 22 Nov 2021 07:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384BE6E9EB;
 Mon, 22 Nov 2021 07:42:11 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AM5uUEo029328; 
 Mon, 22 Nov 2021 07:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=jGQKW+tQ/O0HkytSM4h8IfxYmABHa1SLHG6MrmXdSmE=;
 b=hr4jIb/KQNbO9drouc5MEhXcp6rBRBoyeaqEd1EiaU7oPzfZjljtLEVCqdyuGddcV6pG
 lJza16ux+w4mCWLGjVzMl8gmST/vUXWT4GAbGFnJShNzzh1NzLli3fG4/xo453M2oD8j
 ZBgA5mRup4St/eB2145zlMwQIAbd/doV+iVa3IZkR56s/tDaGuhYs/Zas0AtK23lL9dE
 9YuYDNqZl29+kWYq/p6Vmh9+u7W4YCA2HDCxYUI0+yQKQVp2xndIRD2Sd6KenOxIZyhw
 PEQVs7/rbjQghjC4mm3KMqTeAQRFThgkYCYvr+Q6G2VA/1L8uuyxDak+UdFurnK5FtNo QA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cg5gj0agn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 07:42:04 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AM7eiMI072320;
 Mon, 22 Nov 2021 07:42:03 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by aserp3030.oracle.com with ESMTP id 3ceq2c6qcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 07:42:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZS+y07Fk+xNxAldal71DbF/4Ao/r8Lso0NEqbWWhnhtDP7SFMVpzkcoYYzbd7n3ZAznbw+v+nPZgR2LC/ZZnY9xrwzHHB/KyKdAT67JNL6Xh+0VKMyIl+EKLpLWSP6rFPgH0Gjel9Qp/lEfLTThfYKl+jRf1zelK7oN54t5S42ZKQVmL7ziwEiCQdz2mR/YgkXq3GRikbT7+D1+eb7rHizRTs+GGef72RaU8AgkIGyXIuh3Tr3mzvb1JskJYdxAOOL6WHrOReWVgqLKMrn5QYSvQTnsYg7Z3BbvRrBhxb3BhH2jjRb3cDphrr5kfBtpypCVIWC6+bbpTbKHFxSchGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGQKW+tQ/O0HkytSM4h8IfxYmABHa1SLHG6MrmXdSmE=;
 b=lDsLRe4TgwLMuTMPyH7NgBAOAnZww0SbMaH55qpkUgFJ/B52qk6Lv7YRUxoIW0rwbziLS4MU0SCKhV1eM8/D6hgLQ8g4lp2v4Fpn+JhWrgbA3yQR3Cqloh8i5N0QokdWATkvWosqxsoxYLFVfVq2VvQbNDxmoF0nXUephXkfINWoofKR5DpQic0qPS8qGJkqs9co1ZaOEnX9ritrNQxU9B/B+Wd/3YI8duYAff3AXTxifg8oXk0fY543INW/VF1CShutMDDrhjLkVYiJbZPQ11+vqM97MQ+FsAP/r/FM1ijjCx1CyICycI9b/p1TsATUXuo/SKqfcH+yuJj9xFs+HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jGQKW+tQ/O0HkytSM4h8IfxYmABHa1SLHG6MrmXdSmE=;
 b=peQ534Z7cfoQzXMDKlrosgmdwCbCnCQHg8b7L5uXG3p9bD0rcjUsaXxcc9xPTlfUSmT58/NlMwpmoxqFmtZ/XaaG2as/kKlW9PNBkWIAAtGdcyymy0jCSKUAdeX7SoPmhnbmjAfYQmP42mw03j2cqwrhQ0qg0endXmPf6csB1Eg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1566.namprd10.prod.outlook.com
 (2603:10b6:300:27::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21; Mon, 22 Nov
 2021 07:42:01 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::495f:a05d:ba7a:682]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::495f:a05d:ba7a:682%6]) with mapi id 15.20.4713.024; Mon, 22 Nov 2021
 07:42:01 +0000
Date: Mon, 22 Nov 2021 10:41:47 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH] drm/i915/ttm: Fix error code in i915_ttm_eviction_valuable()
Message-ID: <20211122061438.GA2492@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0120.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0120.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Mon, 22 Nov 2021 07:41:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: baf0bf7c-d6ff-49d1-f5e5-08d9ad8b920f
X-MS-TrafficTypeDiagnostic: MWHPR10MB1566:
X-Microsoft-Antispam-PRVS: <MWHPR10MB15667AE16D1F9A1EE15CF0548E9F9@MWHPR10MB1566.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 27vKe/zg3eyqsIlgT3V3ZpvWjfxVl/ENuMw2P1G9JNEdXBTJqlGELsNMemi01vbUKItpOphXGeoF2XjVvn9hv8xRodEOXGLKG+xHKGjjbzkc42cSsiQVZsAmrwRQnkkh7HAdBZU5OY625/4JQHEqdtFEbHHejexWITpKnkpT00AJYQ7lqyan+0G005bdykSXxzwlop8epbBYovkLNksqBAzgUeSmYsPn9P9G6CzpGVnwG+Ax1d7neDDUAU5AL7J1tiZFY09CSJdxaoJipC0oa3ICCirs8vubKpdqbTEaZuonkZ6zAJ/VcFRHG4BUDxVMJUb+iiA5Uu7jejPy1Vvblo/Mfs7TzmpgfC3gdxKtoAuMqZ9nthnQZFFnM2xJ7gVdXe56LeI6OZNUzO9JssrYLIgSY5NmRDL/Xu8dBdsD7pYu7vBQvbkAfMCP4EoxfFOLCsn8+lcllpQ7oBNEIAZZQB3tYwUpbMqulrWgxpM7IpvnAIEG9wJvLnPyypSYGU8WwdyJk+oKnbRrHethdrSm9gqGMVtbRgoFjmAA7VLNmVDmrC9qKOg3WapiFnpOGQWVNMBd9Wc5s5DaIf+XdDH8s+/2Hli3euJoKECEzGBEE1aH2VHiBjAHFuwvQWiyhlA3nnWmYkllwBq8/YbstJYTBOhtmdMFE8CCW8bFiN2mnto7L67FcXAebfatC+fIHPOxjdWyx/0tMIn9vY+Hdd58AQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(33716001)(508600001)(2906002)(316002)(1076003)(54906003)(33656002)(110136005)(7416002)(4744005)(26005)(186003)(86362001)(55016002)(8936002)(38100700002)(38350700002)(83380400001)(6666004)(9686003)(5660300002)(44832011)(66556008)(66476007)(66946007)(9576002)(4326008)(52116002)(956004)(6496006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yYq8dErc+3lquui4yZ6dYOiP9ei2XIara1WrrI5tXhCIfCnz1UQg2tzYnghG?=
 =?us-ascii?Q?FtcKzfIfrtErILy743g3Y0z2UAtQoLtGO08Ncz42TGP3kXPocAoRvyCgq7Hb?=
 =?us-ascii?Q?EItW9XUj1IUOMhlVHubyQe/JXYGkmQoCcZaJ7WrkgDWNes+k4p/H2OaessJ9?=
 =?us-ascii?Q?khGyUBiyzS6kJxOR8FbAH8WVNzhsHejcfMc7UwdRClVANfLg1PQuYokmRv3E?=
 =?us-ascii?Q?02Ga4WlsE9zzg+2JIkRxpopt56zh9LWbTErCG3gxNK5OQugf1q8aepprbOfa?=
 =?us-ascii?Q?VVg9MSz45DQDCbZ5lW3e5KWs3uyPh4bIk/jqkom+w2KKq9g1WDPdlyFStJWf?=
 =?us-ascii?Q?HYvQFjpC0BpKfIi5M2o/cSBua5Me9jkL1EtE2BsEZZFbR8LkTksaeSH23YnW?=
 =?us-ascii?Q?YLTaj0qUEhTo/QTe+L8G4mDPR39+Gk5PBHhIcERfIO8xJYYvxXSZom6Ku2X4?=
 =?us-ascii?Q?uUBPHzz+/TfdI1a79ELXgupnrmlgi5LAPHT64c6pvqduZYS9CE+i3VDlC1Nn?=
 =?us-ascii?Q?cbq2ExJaKR7s5hveOJnhvS0pNeuWUAnC1axQEPFg2RcuCLS+YiZbfjsmH3W4?=
 =?us-ascii?Q?mHMfbrQSm7XxfhCOrAWmZZ8nm6+1+4UzYMK/IAeZL6PohSnn69CCMA/NyDWN?=
 =?us-ascii?Q?EGQRqMHo5t4XwEy+B4frmheDzP0IfVUWqovKlilsrXz5OpzVdHHFBcQB66o5?=
 =?us-ascii?Q?DQ6QUyNZioIwuQbgHeGn+rmNoDt1owS/3ILyOgoMvz1QGWCuze6m2Ja3jIJL?=
 =?us-ascii?Q?db576PFwSGDL0/4esgjGXhgg9gvbJpwQ1duCSvkA1CQP2HfPkD6oNx+X/GGB?=
 =?us-ascii?Q?5h4qRvwu86QtXAjTL/tTnsmkZrmcayZ6fWx4XM4huDYa2oQh9wx9PaIb+ihH?=
 =?us-ascii?Q?6KoFrWAgT5jM79+81wXCNpJ+yKQ66a3OInh2HasTVTAhUED0U36CVcPckl6x?=
 =?us-ascii?Q?bTV43I7OvWhTYa4z7kwR209wCvTiJUMolfB1KfhaKJTN2B6UDViof+oxwRyc?=
 =?us-ascii?Q?bp6qLxKeOGuOETHbUCMSwrXiCEP9VPSOjK1vAzYeZHaUPEYteErOTzl1oHtn?=
 =?us-ascii?Q?GCUuWbdCRbDEz9fbnUd0BQHXAOrsuvNEOS/K0+sJobtk+WACQCBNvIW7dRZB?=
 =?us-ascii?Q?xXsBZSyX+eMyRGqbrmKlf4jFCtXP0WxZh6Pz8sOrINYK8pL0OsS49k1R3dxe?=
 =?us-ascii?Q?okBEtM5aiMG/Xf2jk4Mf646tAwKLfV8pNgQsIE5+SpQQ70mFkqE4NIdzJMMG?=
 =?us-ascii?Q?LBcDR6f60JhBu40wIUDNj2Lo/hNJZNUaDVNBIdR1bwN8Ib39+eybuhjV5zXi?=
 =?us-ascii?Q?sdykYp+bIZ1DGl5dAWZvGBJoL3lzK9RGeJc+QsupvJuWTAmGC2SA3zM7M/pY?=
 =?us-ascii?Q?8m6FsNoPbpYUJXwbDYKZly6FNxUdZrgZiNv9ADJZNG0s/89tbu1YEHpR49tI?=
 =?us-ascii?Q?NsPrbEipybZmIedpbXZ0Xmo72pls0Rh8lEErAD4rxHSJl17Kp9PlelYwDICX?=
 =?us-ascii?Q?heTyRZKtSPY5EWHuRYPr/fAa7pYtd6+ElKn/UFzn+mR0lhQri797nqJSxFep?=
 =?us-ascii?Q?EpQdfwb3XewmdlRTByyUazAPVP03DO/vStaABBlCs6qak48lJM/OokSpdINK?=
 =?us-ascii?Q?auCH3pMoSEYdl40UOKdMvggPOaAY5h1D+jrp4ikQXEoEtlDSo++SJLH2Fd2f?=
 =?us-ascii?Q?tYyB6A5YjLPDjoy1zB/lUh/T/i4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf0bf7c-d6ff-49d1-f5e5-08d9ad8b920f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 07:42:01.6342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aO1YlWABdi3jTrcwdzlD1itRMhTPmspe3rDc0goYGK6OQCBALDswNeA59HUJq5p5TaDSTRP2PPihPY1Q3nSePJ0qVwyTa+9W98W9eI1mpTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1566
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10175
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220038
X-Proofpoint-GUID: P_9FWGKrPLOK1q64iRI3FMj5mF1ZQ-47
X-Proofpoint-ORIG-GUID: P_9FWGKrPLOK1q64iRI3FMj5mF1ZQ-47
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
 kernel-janitors@vger.kernel.org, Jason Ekstrand <jason@jlekstrand.net>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function returns a bool type so returning -EBUSY is equivalent to
returning true.  It should return false instead.

Fixes: 7ae034590cea ("drm/i915/ttm: add tt shmem backend")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
index 68cfe6e9ceab..02918b990b25 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
@@ -332,7 +332,7 @@ static bool i915_ttm_eviction_valuable(struct ttm_buffer_object *bo,
 	 * but we would like to avoid grabbing locks for no good reason.
 	 */
 	if (bo->ttm && bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL)
-		return -EBUSY;
+		return false;
 
 	/* Will do for now. Our pinned objects are still on TTM's LRU lists */
 	return i915_gem_object_evictable(obj);
-- 
2.20.1

