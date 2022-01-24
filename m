Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A83497F6E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 13:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899B910EAF1;
	Mon, 24 Jan 2022 12:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (unknown [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09ED10EAF1;
 Mon, 24 Jan 2022 12:26:53 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OAYF5U007774; 
 Mon, 24 Jan 2022 12:24:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=xXuSl9Fccf9PP9wpw8nU35jHHiZCk3E5xTDQzAJmkR0=;
 b=pQMIrEd+4ndy3D0cAzMtLhUv41JOjRwmme4M94LN/a/gviMouGLhTKwgyFr8voiB3MYe
 Lu7fIW/rytwTlCAUFfV7BLmxf4tNjBQjiaBh1UE+83JWmAzyUjfy+95Oc/LdYeGkCgo2
 S2NPN5GBB0so3oCx1nEcpPvl7/tbHLB5d4edrmSAm57ac2Vx8NjMzqpgbSgyCP2Fa/D1
 GfgdLuqw+5RzrMC1Ibmh+6NvuM99sxXwB0t0vdC3sRJj4vKbxxWTRHipn7tDIhep8wrG
 ik6jndBl+zwTgCeug/ETmfy3A++C1gtMJt5sLh1fHxr0vUFauPrYAs3nPEedian0xA39 7g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dr8bdkx3x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 12:24:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20OCGhUl180220;
 Mon, 24 Jan 2022 12:24:32 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by aserp3020.oracle.com with ESMTP id 3dr9r3v0t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 12:24:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcL5BuRafh8oxYPEtpB+igpaABg616BDVc3R12yQakPmCIHvWcBEmVGBQk517i5aLg+kW1/SUkou5r3hASm0qIqasWTnxmrg96ExKoYg9o8bKqnlBDAW4N5anZ/ZjTvRgXrZsQ6Q9FOVQMt6NLW9D30v02bO0ZscFcGbC0EKqGde08QxOHJrxdsxtigsFalFwHF0dglgQTC1Fz3XUkJFPwBq5MVfXYPDds1QRudlLOgXNRoNwMhTVHYm9nfwimoeU44moihpkDtwt8Z+YNaREljZQoObiWU34xQRe5RpktlY9UehHfwVGEfiKxaeCk+N4asR4PKlNNCARNy1ZPoarA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXuSl9Fccf9PP9wpw8nU35jHHiZCk3E5xTDQzAJmkR0=;
 b=A9qcdugeBhh3Nkbu7Huq8BIlcoChG4yhpD7N3eEYYdLtH7yw+M57vIyrU9bZ0b1oXOMGx8qfEY1/GLRZfNUSsxSFUpwG8a3lQsf0hWMlo8BZzqamINfpNktQPH8lVIEjBAXn+i3dtb4nfhCzC8SYt0xqQbILMOi6hzZdZoZr3mND1hQWEuoZutGcdxoeAhQqEz0qDmb48cDYm+xYX+BqFioTDZ6bK5kjRhxrosFxh2BPRBv09YuBEwsCfyaIN+0AOCNw4N2cClgO9p5RjVa/t0pepp9ZMmpFLsx++Zl7W16pK+P6vRMBTBe1vSc9ZJOUTvLzK//zMSQFEjzf1QzKfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXuSl9Fccf9PP9wpw8nU35jHHiZCk3E5xTDQzAJmkR0=;
 b=Kg+sKG+xznyIZhCs91/fsVjx1iasceqn0ax3bTxtT2VVUmHJgUR/4SlCiOIzUC0i4INkRBbHKs/Gffjpk8vbHPtiUgq+cV4NfUOEUA3J6y+mPpozgJwpzfyyxsRF+pTgCcek2ONavGw8kfXS7B9z6UnrBSwXIXnFmhcZox8WRyo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1734.namprd10.prod.outlook.com
 (2603:10b6:910:8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Mon, 24 Jan
 2022 12:24:30 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 12:24:30 +0000
Date: Mon, 24 Jan 2022 15:24:09 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915/overlay: Prevent divide by zero bugs in scaling
Message-ID: <20220124122409.GA31673@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0198.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0519f3e-982a-4068-dc21-08d9df347886
X-MS-TrafficTypeDiagnostic: CY4PR10MB1734:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB17348A804070691480BE0DA98E5E9@CY4PR10MB1734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LeUdMKU2MZidwhmhQN+XjOH6+hXl6X1h5T3BF0saaWg9Y3Ck+Op7zHI+0s/x/b/0S+Euv094C25cE5q1zk/p6KF94/aPAsbDPJx2J2D0ArZCupU2HxYj4XEM8giM0cN8YIhzd83eiSVlWYSX0S+OBiwCd3CIP0tphVu+g6LrGXHM4mc00yPjS1FQLQbSkzUzf1N1m0+qmVyduaOTRb0ljv4bWySEi4IN+zLqHa1jUbialhkn28devT5xZweTS0vu6JHyi1/bVxE2Q0SrlY9gHZuWtfv4ovcLEn29mQCcfDXYrQ2l7YvqGBC1HGcwaG0wY20QhmNL4uEUMhrsYbu7rShtxY0KPFKbpbSgjGPKedJDbvhzTwVrSYx3YbxmNzJqN57t9sTc39Y6QeksUw5U/2k8cpHH0bs/RxtGt9k/OgTHpIx6kV9sNX540Y4U0kWL4v7FO5rthi1BHZZfTnS9SNmdJ6HLKARtIkHvF2gc6wtCXW5fnjEqAZgITbhsjbDFhbkWJ2yRnsh3WKV4TcXPe19IxaIAo7UOx/aycB+BVCIjR0D0yiLvacM1w5jSx4ZTIj64p5VgH2R6LsgYIMqj7E0F5vc7QDuiy2XSnVDnHS8tZp1xAhf71mALtY8DOlQiQb9UJbte9oTto/ElT/2SRtdmlI6NHyFzt8YrShtF6knsA7i0nHMVkkbItQsP1zahXD2oZCCRjEkBfymZ3H3yhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(6486002)(2906002)(26005)(6506007)(316002)(186003)(52116002)(6666004)(33656002)(4326008)(66476007)(508600001)(38100700002)(38350700002)(66946007)(86362001)(66556008)(7416002)(1076003)(8676002)(8936002)(44832011)(83380400001)(33716001)(5660300002)(54906003)(9686003)(110136005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OmfXZwI3qxbp/8a7egz4ZC0zH3CqM8uxI7ISxg/9eBpxL1tfJcgiUYWCwCVP?=
 =?us-ascii?Q?vQkQmWXCfCi/vnRlBgtChR1oPDyG+uWS1rzmS/yhOYrrtOkLT6JaYT9HDxXQ?=
 =?us-ascii?Q?tMMPrAo13O3rGhYrTEPa+LbniEHOV9GesFJp936W3w84UbS1+c2G9KnU0VJz?=
 =?us-ascii?Q?jRSr7Htte+qK3SGHXEoep7RlVd2gCDs2NiprcT/ozuPVWW3NmCGcQuT/zZvm?=
 =?us-ascii?Q?DJx8AkoIhbLE/9Wfrd7848VdpYZcK9ETqB++Rbhb8zP7SZ5/wnrnRqh9aDiF?=
 =?us-ascii?Q?2STKQgiEV7lwdCG8kfjYPVar96odUSG2Zwo8/2N/MPrZdR/RJnBhbR0Zc/yN?=
 =?us-ascii?Q?pCreRTyT05qlKcDLUdG/vf+nrfqY6hHRecYBvemfwo2q8OZjYQnmtzwfySbw?=
 =?us-ascii?Q?WpDZlY6NTCbWfv2FpD/yrUY6Jz12yJV+W2zVzmXbm87rYmoyEiwJqztPQn8X?=
 =?us-ascii?Q?mInIII1bBVGsJt32q7TzWN/LnUl43QzSctzgoPkCKapc7U3Tax5pTaqALHol?=
 =?us-ascii?Q?5II6JSZItWSKPhp5VHlibK85jKdScX1UBg9ZGUeswZzXeJKyQU/f0TQD/S/f?=
 =?us-ascii?Q?uWdtG8PVpMm5TB6WlaAgNlHttl9Lt8kM7VDFVzjv/QjZD5OaXGkJ57+2TyQi?=
 =?us-ascii?Q?Uh5hUhpaNP8Bqe0WqEcRBb1NhvgzcGmBQhAMnKHYH9Jg5nI60QL/BvihT1Bw?=
 =?us-ascii?Q?wezIKOsbmEVMOnYIpJ3LJMCq6e3wd1Tm+ZR58N0H6dVNvM8bofkMU0/n3GW4?=
 =?us-ascii?Q?aKigLfx192zB456WWaXCo74/XVSQt5gNj+57HjVJy2tsGVB8gRwzcRPsBey3?=
 =?us-ascii?Q?ik486RrMzZIfEbk/jE3yvAhSW0ldJDU1f+m0pcTaTx6JAis3TmGOCTD0Fecl?=
 =?us-ascii?Q?YHU0JfQ7vnHnYNAZMemewW2qwMjvFtyirvlNixBRdoOnv35/D9zYrSf/axth?=
 =?us-ascii?Q?ejycbwERajDhY98YogZpsQtki/xa10FcivqAf0m0EqBJs7PVijGoyiDsg+5/?=
 =?us-ascii?Q?n3vZ2utOazTkkdY4ilL5y6O7urIH1Y2rRUW+91sl1LLeUVfKukgaGxiblqxC?=
 =?us-ascii?Q?CmgnCrJbkrbIm2jXuLK5sPkNREZt1ztTmIYXfhSWHmq/7Qjy6v5quJGXGBBL?=
 =?us-ascii?Q?xqKQNWU05iGRl6Y5AxDjJX5UVBsfsTv+9Hav5d6qUyQZlMPIqtIvFfSVzunK?=
 =?us-ascii?Q?ifhdFWxwAG6ApWEr4aPUcmoiuGdltY4uFr77Tdty6EB/31ik3+EU8e/N7Kkz?=
 =?us-ascii?Q?BwYdE5JbLs6ZIjb8i9jS0dD8PDDdE+2TmnXvXMyTEdUw/5qgGxME3W2DD67K?=
 =?us-ascii?Q?5DnRu/QlqK19l51BsP3lFkvt/qmJQBr23IdZhCpNX2SvLIbRkLV9dm7feqIH?=
 =?us-ascii?Q?HRA+YPgeJYHURrp5Q8wHKI1XtAqsaUnEmXlkNPz5k/uVer/B81Nu3GeHdu8a?=
 =?us-ascii?Q?NgzTIvYXDg4YynGv8Z1jc1bJVjNEjtF/ENPUtN0UJ/eTK3SbPrdcZ1zQ0mBP?=
 =?us-ascii?Q?pWy76ISAReg5ZvBh2v5Vncd365QRP0JiEKx2is9jyCZIXALz9U9zW4cMpKHt?=
 =?us-ascii?Q?qbb887oZDjwp2s4hG+mf+WkaPcNxs3dr0Gn92C3eXjus1XX/bx/4ti+i9+dP?=
 =?us-ascii?Q?NGe8lZ8/T/3MHHnugG1RG1PEOTva8WBaypPfBtXIIXbMhvusAICW15zyjsvs?=
 =?us-ascii?Q?9+nZUmGPicFyPtcP0FBDqfrmyzk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0519f3e-982a-4068-dc21-08d9df347886
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 12:24:30.4283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6HnpPLq55Trq+l0b/c/pQ+VzsQHpMgrSbOM4CjeSkaKHszJGnf+YSRbrloytMS8J5uJ6nv8bMkk3QDtr3J1xnP9Wf5q7PaYetOiwXuVPzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1734
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10236
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240082
X-Proofpoint-ORIG-GUID: C3N97HIr4t49F0e4DbNpJnwUYb62Ut4J
X-Proofpoint-GUID: C3N97HIr4t49F0e4DbNpJnwUYb62Ut4J
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
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Anholt <eric@anholt.net>,
 Sean Paul <seanpaul@chromium.org>, Fernando Ramos <greenfoo@u92.eu>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smatch detected a divide by zero bug in check_overlay_scaling().

    drivers/gpu/drm/i915/display/intel_overlay.c:976 check_overlay_scaling()
    error: potential divide by zero bug '/ rec->dst_height'.
    drivers/gpu/drm/i915/display/intel_overlay.c:980 check_overlay_scaling()
    error: potential divide by zero bug '/ rec->dst_width'.

Prevent this by ensuring that the dst height and width are non-zero.

Fixes: 02e792fbaadb ("drm/i915: implement drmmode overlay support v4")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.

 drivers/gpu/drm/i915/display/intel_overlay.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index 1a376e9a1ff3..d610e48cab94 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -959,6 +959,9 @@ static int check_overlay_dst(struct intel_overlay *overlay,
 	const struct intel_crtc_state *pipe_config =
 		overlay->crtc->config;
 
+	if (rec->dst_height == 0 || rec->dst_width == 0)
+		return -EINVAL;
+
 	if (rec->dst_x < pipe_config->pipe_src_w &&
 	    rec->dst_x + rec->dst_width <= pipe_config->pipe_src_w &&
 	    rec->dst_y < pipe_config->pipe_src_h &&
-- 
2.20.1

