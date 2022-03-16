Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE034DACB4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 09:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2A310E676;
	Wed, 16 Mar 2022 08:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F386510E671;
 Wed, 16 Mar 2022 08:42:12 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22G83Yfc011435; 
 Wed, 16 Mar 2022 08:42:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=BOv8/vrw2GuwHTpUKlI6SvoViQyBYDyccxYS0CdSUDo=;
 b=w+EtBDFgzdiurvuznvMOl8AZpBOvXvdPpXoi+P0sQHG7VO6Y1X+HMf/CCWvXUDakw4SC
 SSKsBMIOvoGQiQED0++q29jl7aVkJw2+6tdI8AS6ipV1XQYa4YNQFAGSPgrRElTczlv0
 QgdxgK9US9iRWLGHKAfeVyyvF2VeTPKnu9chGJBeKSMR9DiAhZC2sleeGuY0gJMLGf3E
 SBEpf2xXI+XNVNpURjj2BDKmwmE+qVLvbrK0uLQCktYQs9ZEmCTePi6BRVrqAByoaPCV
 xAJXcUB5wDAfdU6lGskLGSD1uFOVR2YagiL6HEI4pt6BN4flaNYXbtzZ/VmJVfCcsrCq YA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et5s6nfwg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 08:42:08 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22G8etnP078111;
 Wed, 16 Mar 2022 08:42:07 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
 by userp3020.oracle.com with ESMTP id 3et658h3af-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Mar 2022 08:42:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjibVeZVoLI873WX9ytLwBY9hvmrp0wgC7bccCfngbUS/FQ+yyVUbfMvRs5NJm2Km4EhxoqIWD/O0iImqozE6SdGt43wSdDlqVrM7XyDM1N6Q80KrPRerxG20uCTneDWMG5Udji312cXKBxr4hcDU6k3GJMdpvfacWThvin0NZ3SP99btsgMbOgAc/cMFUVNDdg7W6HrT+0aZTq4zEiEARl46pyOSfjLhIVBpq3Onk3ycJqkC0zCHcP+Umirks1gbjogxmBDZXY2D+JWjBxOa89Xnowst6bT9qYLTONT/PKFGXk//c1XdK2eXaeOT6nBI55Vt+sbpwFlXceM+5r9Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BOv8/vrw2GuwHTpUKlI6SvoViQyBYDyccxYS0CdSUDo=;
 b=X//hpqpBHQhhJyTeQUSDlMAW+ySDJOYgMM1qH+uBUlxPcs92epMwMrdRPfbMgFZgly9uiTF6jIw1bKqxvMzXL24JEtA8colEzps8lMiaouU+mCMuNR63haOLij14Xt+klarrTl+/uT5FtX31+iR7KNifIMb00gRWsWKLBZNPFxBLFaFlWrupcdZ9rFp8iLyU7ar5Yaeug8xGvqbW6zgIebKQc975VeXdjUbEeepD6qfOdxp6FrhlEBFO63VL8DXKeN6saBX7OqpOeD3AK6mv1jcfvjmjOZAFu1Kh7f0IqYrE1Z241AJoAmfjed3ekbfHY/Xzl/XY6NnPtQ1u3RqF+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BOv8/vrw2GuwHTpUKlI6SvoViQyBYDyccxYS0CdSUDo=;
 b=rilCCpSenR1a7PZCWk38KaJ8srPNMiEAEK7F1S1/6wZMY+YvW6pn8UPyJHuA1AX7o80k+4SWOPbFZseuYievsPwtctAJzISt/ubNydTISzjbZ7uMBF1RMUDuevd0W2OWE4wQEn7vKYHAs4eoAWCQjEbA9sEYxxbzr1u83bhJ3Fw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR1001MB2145.namprd10.prod.outlook.com
 (2603:10b6:405:2d::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Wed, 16 Mar
 2022 08:42:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 08:42:04 +0000
Date: Wed, 16 Mar 2022 11:41:48 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu: fix off by one in amdgpu_gfx_kiq_acquire()
Message-ID: <20220316084148.GD30941@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0009.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6da16d6b-790d-4fed-7840-08da0728d8a0
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2145:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB2145C938E391E6E23FA7F38E8E119@BN6PR1001MB2145.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RUmOgSdbEMm7pZkYTEtLwZmzGfug38FAjBXr/ANV3nEnTgEkca+xMxAz9xWlEF8CtJRXB8MCdWfV0jPACrWx9EF8u8hyRNkSNptv/dQX3LP475vEvO+iV9ZwaDHzLbLMXdg5utLtxdZAA8l8zHqqqD0ksE51wZnzUqoQCnSt8Z2klpOKUynOX3uPabcIFcnJAzi4N/JJWzZV8QGRTmY/CpISz+Q8zLimFsEJW0W2hUK9iLYLh3r1BNmrG7Ct7ZDmXxupIvtX9aAbjxp3iS+77RBDSm29I/ovfULWAeqlwSpUsCXJpKs46KgQK+zhtNn7sPwbLLaFaG1ekJnKQ+rtRL7GkC1wJldwIMogn/93cVmFhXQ3EdDXY6syaYar2qQECxAAL+dkKuAdmsfStDgQR2VJsLnH5sj7pW3llcqBJBe7scOvELurg2Nq4uFW/+wX+0HEpT+9+0+AcM8hjdeK/i9rsSHBJd8MtoX5zYKJ1lJ2U8K22iRqIMZePcL6YtnKABHclDg+7LPzKI3szLiV2RViH8hAfHQISTVlLP7+EtX7SLhTJPdzggJKHls9JnyG+DQi2Aklor3zpSgwviGEtXEd0rAcdDkUdWw7y1Br78XcseqSEx8IUqOOyY9LtP/V40BVfLQGoFvO9xtsmQZCSbTFdPwTfNfDuWzVk9FIdPwmlRkqwQIabsIldahYJCr8lqWajIRv7LyP5kgt/6rjhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(86362001)(33656002)(5660300002)(8936002)(6666004)(6486002)(6506007)(6512007)(7416002)(9686003)(2906002)(52116002)(4744005)(44832011)(508600001)(1076003)(38100700002)(38350700002)(83380400001)(33716001)(186003)(66556008)(66476007)(316002)(66946007)(4326008)(54906003)(8676002)(26005)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SpSTn30oxM0EEVGnBhlLJ9HDjhk4tBqHkOSJBhvUfPIGyn6uk01cMuWB+5L0?=
 =?us-ascii?Q?yJWoGUXsT2L9Sa8GAaN5Aae/q6cgJfXDjgaYSQvWgV8QLD8bUaL9UGOAZ0LO?=
 =?us-ascii?Q?ZmD2PXnpS84R1jsUcSI1RdH3aiLT79D8Nn9dYy21LddK4kTjNziWtzNkE519?=
 =?us-ascii?Q?AfTXt+9R/p9JK1lM/d0jVwY3YGR8jpxpvGroAIhqQgbaBjO9opIFoXXxGjtL?=
 =?us-ascii?Q?b5VunmjXqYT2BBsmciR5XvZpnQI9Ocj3KbVL/9MHGuiN7sogIdjHm93RRIk7?=
 =?us-ascii?Q?Qxlb3yqMAfMufpO/wwfTYUcTik88DWoHt3ume0pycUM5YqpSi++JyHHZyY1M?=
 =?us-ascii?Q?IxOvasOHoTe468OGOkmCm7gKWOHNDhRJt9UgUgHKCW4oozLJjZGlvIABiQ47?=
 =?us-ascii?Q?5oJ+3I84UTAZ7Tk8xpqnq7rwWEPYVSytz2UcJY3a64QMrZEZCUKClw0dnC3W?=
 =?us-ascii?Q?DEh7pRcLDI5z9B0/e2JRuoS5hLM+h0YU5SPgDvhfcN6aOcqi3wzJjeZabgbN?=
 =?us-ascii?Q?dl9vu5CnkSIE1chPM8Ck1o3sJ58nckCSAk/Z7Z2l9AN7aRAt83195Ut8bkwm?=
 =?us-ascii?Q?ZWTTptznJGpwxMr2fJs0C4WhXTLwfeiAHdtsN09bYwzxCleZVvlQb6Gv/TUR?=
 =?us-ascii?Q?epNv7jU7vlE7p8IlRYcVa9jArJ43/zQB77raXB5bXFIJDywkAo4CefR+NtSy?=
 =?us-ascii?Q?ObRQxAyv403SOWI/wdigaRiJWrVyBNqXqjuk7s2oAUkiRjPmiH1nEKWf9Mrl?=
 =?us-ascii?Q?bkWPH//3Q4Y12oqn5sdquDZ19r1jHqvJ1Qs0K2QcWduUIGuo29vVNGwpVAQN?=
 =?us-ascii?Q?52FeYLfDXTArvPWd9GOoH4mAB1iXxvOLkkm0GwO4YSekpVajHzoR/0albNnK?=
 =?us-ascii?Q?rppRNr/pRN/5ChcquXydUHE4ztc9kmcnW/NLiH2kpfuzAe5V48lVf82Fdpn+?=
 =?us-ascii?Q?ePkqQAx+b/MSJBMcq7hC9uMwIdCyrK/fyxV+KTvHfPnqV8DZP8pUIZDXc4an?=
 =?us-ascii?Q?bEGuIvM2t0SeUPkjuCP+yWbCdEPZg77cl2FyTUaVH+jqv03hdMgkAmAN2qTt?=
 =?us-ascii?Q?xjEMlbg2ayyKQ/ld4LbxN+q/xNDgBvjV+g3KYs+VuDM4EpaIfWaCGK3m4p9g?=
 =?us-ascii?Q?pAoAQnFymM6B3vgdHtrpn+bGjDlkl0ziNZQiIPmeroGkSBd9zHj4YWYFQWKN?=
 =?us-ascii?Q?3Hjh+j6BGjsNcZDrBjzFxOPsBJvSM1aVIv84Tgk517n5Xzft9h6W+ZhAAWvP?=
 =?us-ascii?Q?XqCQIU8aWOregR86I/c/6ZA1lzF2KR5Zzx87NVNJtpZ4870BxOztBqR0MtAW?=
 =?us-ascii?Q?U17Xb1l9G+VCel47hx1Tf+o7YESsYCQsG0xHSum6RKXz+RxFccujpyraL+xr?=
 =?us-ascii?Q?fh17oP7tig873T9gdYs1bpDm/+SszWoUkSCVLlvCA4GDMEykiupxU4xSdTNC?=
 =?us-ascii?Q?AVOspkY7QnNdXWZ9YMLbtgM+BMe46AWRekD/PkD+aW6tklpUwdAcow=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da16d6b-790d-4fed-7840-08da0728d8a0
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 08:42:04.1921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdOncrTz2U2kPmfsU1T5+Iu15BFqGTuqClhXoe5lQK4JvlaPMV+5gpCoHC+YsEi1ZcElvZh2MadMjNDOJJoEQQlFLPDTYXCEWoiaJp9dyos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2145
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10287
 signatures=693139
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203160053
X-Proofpoint-GUID: 8x24pVhZy1IELzNgrNoC8bNUdUyZGnlx
X-Proofpoint-ORIG-GUID: 8x24pVhZy1IELzNgrNoC8bNUdUyZGnlx
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
Cc: Tao Zhou <tao.zhou1@amd.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, amd-gfx@lists.freedesktop.org,
 Lijo Lazar <lijo.lazar@amd.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>,
 yipechai <YiPeng.Chai@amd.com>, dri-devel@lists.freedesktop.org,
 Evan Quan <evan.quan@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Alex Xie <AlexBin.Xie@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This post-op should be a pre-op so that we do not pass -1 as the bit
number to test_bit().  The current code will loop downwards from 63 to
-1.  After changing to a pre-op, it loops from 63 to 0.

Fixes: 71c37505e7ea ("drm/amdgpu/gfx: move more common KIQ code to amdgpu_gfx.c")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index 8fe939976224..28a736c507bb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -266,7 +266,7 @@ static int amdgpu_gfx_kiq_acquire(struct amdgpu_device *adev,
 		    * adev->gfx.mec.num_pipe_per_mec
 		    * adev->gfx.mec.num_queue_per_pipe;
 
-	while (queue_bit-- >= 0) {
+	while (--queue_bit >= 0) {
 		if (test_bit(queue_bit, adev->gfx.mec.queue_bitmap))
 			continue;
 
-- 
2.20.1

