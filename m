Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4215B47582A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 12:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982E510E1AB;
	Wed, 15 Dec 2021 11:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AC310E216;
 Wed, 15 Dec 2021 11:49:20 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFBSuet028543; 
 Wed, 15 Dec 2021 11:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=kCLJlGeKm5XEiPIh0XtP3dohzdyA0M6MUtd0BRzJw2s=;
 b=f1UMYOrSMwto9h1KJ+kGRiBorHWSubefyKIvBT4SBTrUVP2bfU7pVGq+17erN9qSwW6K
 L8toVYmQGSPLPRRnUfwQpWLEnFp1wl1dnhcphVMuhXt7pvuLzUxS5j9cD/XYb4zKaAmH
 oz2GNGTB9KnhnaMsvEuIy/HeCoVZQUrx4KVhsCFbDfu925vkH+vMEdni6QjRi7UCWmAV
 zag2AmpBqCICVhoKa052QrlLFXmzEF80f9GFhawCn862AzyYBlDlGXVhC7dhojcu/XPn
 zIZq8Cfvdog6996W4AV0CVnw+MptTfGfLWp1Dps/FpFIOUJERSCm1paFWrqJJwNuWr8J PQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx3ukek15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 11:49:17 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFBg5t7154807;
 Wed, 15 Dec 2021 11:49:17 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2174.outbound.protection.outlook.com [104.47.73.174])
 by aserp3030.oracle.com with ESMTP id 3cvj1fa72y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 11:49:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8Ez8mgtopWH98ZAO561e/KeJLI86ww5LCiTcgcTC6THb97SVpKzujfeCAJJl+EULj7jje/iUTTF24z6Ec3sgdEOf9Z85v8gdQ0VgrybxOdkGPze641w8gHjotglyWWVJdu8Qs65cKaQcTF+l/8gu82UUrQJOU2cuwnq2KCp1tNk6/9r/xBXviEPltplCFL/PrCxy0srGSdbrWOwpOdlF+WYmb+cy8GJJ7AhvVwM8sj4j8sJ1SagOug6ZzLLnsFCV3/NYMFozTt6LFW+zA9Trt6FzJirOS6P4lZqk2AI3jJbQXnJzhvX/LUElXTvxIR3NtURjkEgPRbyyxAEsEz+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCLJlGeKm5XEiPIh0XtP3dohzdyA0M6MUtd0BRzJw2s=;
 b=TVJxDBslCAB3zfSvQScZ5zddIRJES2aFmhgSWak3gOSJ0E3liqaxKN8cW0gpAF8or5BfBvtp91aqowPx3Uq5W/9rzASv0DTiJ8OHTNbbhiMGqt16DHIPR6UAy+fhkR1RjnSyEIkZNN+4P6XCiIen8UqgWHJvqIqJIATtAvgKARdat6pRCdlEK6RakiWosnYYR2L7FwWDODwCMtxkVxDZGb4hQb9rXWk9BATPBzaEho3hAwdNk/NmJmRwgLDdkSeFv7J8gjfXkhI3jVLZXGmTwBIKsybLhj9h9VYB4imI0xKo3BBmpCihiHrWN5xuJnHNLaWQNG1oDu+YvJnOI/4jIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCLJlGeKm5XEiPIh0XtP3dohzdyA0M6MUtd0BRzJw2s=;
 b=Bd2ghvTx5OCYekv0gyjRSSEq/5aA4gvwyhOd6wu5LP6ONqBCClvM41qt12tMu9ksQgzPgnU6xAvU01gzUVbGUDQTCwq/lneiRr417LR4XbT3Yg4jstZ8PPdOexBNbI40ClejtHN783HkSO6iHb9eagPl5yc3eZR9TW+tgJDGAiw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1664.namprd10.prod.outlook.com
 (2603:10b6:301:9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Wed, 15 Dec
 2021 11:49:15 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 11:49:15 +0000
Date: Wed, 15 Dec 2021 14:49:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>, Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH] drm/msm/dp: Fix double free on error in msm_dp_bridge_init()
Message-ID: <20211215114900.GD14552@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0136.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbff2a61-7a30-458c-87b8-08d9bfc0eafb
X-MS-TrafficTypeDiagnostic: MWHPR10MB1664:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1664BB31936C7B42BD9D0F898E769@MWHPR10MB1664.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k5CIXs8SotImzWn6BjeJhMHJethpRpuDIKtRgdZAGuKnaNi5qcUpcJiwzJN/VQtOGCkYT5plJamj2H6yxzIySLeldWg3JXYG4pbtUZJ02I3z6r3fXwqnYm2dWIpyRe4lmXmCgknSS2Aq5Vs7+3JvnrDxHCAdNRFwqo5VE3tRxX738Ub+mL6E4IcBNzKhcfPdZVu8TImQmAC8chIraxcnKUTuFjK2vLa+3cPRO5u7UaZZljCjNw9+EYITgSJNbArkBjA1mCPsBhOLFqX/LUzPapeAESXQnUgJvYl5CSAshCd/XR2g9DSlvzr//irh3iGpn4j8KC0VFA2MIxYCkyGCHgVQJ3CoErDK5womUsLUh8+FLCXgltflzuVT9AajQae9OGuEtAFIoTxrM+iVCXNlPGjMHhzWtDXNTTbT2zSsHk2r5hpcf4U6H1ElZKYVDWQnhKLsEyUaIuYkqmfBwDoGBiLRiUGWhADlZkk/TL/xv9ZkW1Fp1GYWEhzYsCq19cp2KMjdGxe9pOuc1z4pXsxZ0nhbJ5b3t+YsdOEcDRXYyRdxom+AfJpDouYCxwIPBnZREQd/nm5EnsuKBB3tGpMsAOKzZUdjJQFCrT5PsFmZkWRDnoImgKrA+MYoh4iFDaJLRubuxDDZYfoJg811bOdHifpxhqJ8oFGhftUQvgKqdBUfwA9lTXRdDxgixPCoTjgZ62kqnUwZjyeLrC3zwqq82g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(38100700002)(6512007)(9686003)(4326008)(38350700002)(26005)(66946007)(6666004)(33716001)(44832011)(8676002)(66476007)(66556008)(5660300002)(86362001)(54906003)(1076003)(2906002)(110136005)(4744005)(8936002)(52116002)(83380400001)(508600001)(6506007)(6486002)(7416002)(186003)(33656002)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dZQ3PnfOp2XvWgdwNqff0qG6tC8BMh1FQr+SpfTQ1NIn8sL3dIPU5/dScAd4?=
 =?us-ascii?Q?meFtpPOslFDl2RArMSyUA0GVNfiyd/DdpuXkA4vbvrdbGPr4hn1vP9rJA9wR?=
 =?us-ascii?Q?jpybsKlmVWJ5E+JxzHD8tD+H7J0JdbU4TXp1FHj25M8fUL0FIF2mWznw+Ovy?=
 =?us-ascii?Q?bZ0cbWJLQUBB5FN10YpLY7iaMyYAZQF58e9DAdPhUKR5qyfjGSrN1SwrrpcE?=
 =?us-ascii?Q?VmwFY42NJSvYBwOQsgFfncpa9XHyr1ZV1ecg2VXtNkslMq0WQFwbDyLQRAmh?=
 =?us-ascii?Q?esEc16sWOCJeq7Vt5WNZQ2Em6oGgFcyrSa0SFJ8PLZScztr2B+9Pe1F1LxpU?=
 =?us-ascii?Q?hn24Y/6QdyYevcgECj5GU5JeSs4DfHq6lKiSpHzA5rhKrginCIhP5WMMrsVp?=
 =?us-ascii?Q?qyDtcIigWAZcm4Y5e/Z/RXSRA2dSHJSNGVw/hYKEQh0zuJycPFFBmrxi3BQh?=
 =?us-ascii?Q?EzES3492ixRPNWCfFk3cVkSGzQc3r2NL5hLClisJ8+FXe0hiHBdUoAu0PZDC?=
 =?us-ascii?Q?M0WpFomNluLc8qpIu0d4yx1MDYYKEtolLAgMPnvOUQd6B6JyOSiyidvpq6Hv?=
 =?us-ascii?Q?ufc/DHRaQMVXFQ097TroLr0AgwRRufFYdOihNtysiqp7NLQtPlXAXIlJc04F?=
 =?us-ascii?Q?ObP7Llk7ny0KkRBRv/FnsEkZGTy6DuwXA+z7rVqE18NtD54EIfNdhpexRQ+Z?=
 =?us-ascii?Q?KkeOCKfHvrBc0OZg3lPvTz0W52xz5alBMI2f7r3kvI8Yf+UScMSrKarWaNra?=
 =?us-ascii?Q?HL8NWiLlnR4WxB9X3UBcPloPPWZZEUEiq3yssdjMGwpDwY1JMSyrTJ4onbwx?=
 =?us-ascii?Q?R93UA+iokRROj/pN9mLtOVG9/gTBdBRwZ9wmHTsaZviDEQSstZWsPc+8hT6b?=
 =?us-ascii?Q?4pxItbfqt/S0XHh//F0PQsHBazT9DPXhExvatDzi6+mp7G4Lg5PNVn2j5Adi?=
 =?us-ascii?Q?wVWGL8HN4u/nwegDll8dpgLltqsNpb1wc4d4dHIus8TSj8Eg2WebfumXPt+z?=
 =?us-ascii?Q?olRHXjLKBOxexUhD2nstruZIkS1pi3AQpPrbSbIjyyiY57fqj/D/aehrzJZW?=
 =?us-ascii?Q?2JLiM7VCa2LEWcEpKKf+P85bRbDTTwgHu++CMpKLe7p7lzagD8TtpHgIqgxC?=
 =?us-ascii?Q?1pnthiYy5saiPVj/S7KBymoq37kUe/udvcYqdg6Xr0EaKeV3pqBP9V9Lb8fW?=
 =?us-ascii?Q?DSlT8woI1IThClbkdoSgP1iRF23Pibe/LG98/vUQq9AOb3qXlZYUwhHrJmfU?=
 =?us-ascii?Q?zWupkVpb32HhkF/QsAasGx7B7FaKSDYZqpyJvzRKlCPrprpliXpWB2k1QmX2?=
 =?us-ascii?Q?X3yCSSPTHgwpMN9nYWjhnOzDrpx2ycuwKXbTKIyZBnQuvdF1EnpdtM1vYxwd?=
 =?us-ascii?Q?uqMj94iCjDyGGhU9cy4BymPfWvN5rP51vpB1KvTypJiSQLvO7MN0i4HPQxOa?=
 =?us-ascii?Q?AUuewxzGFo8lSsh1aqHMVFHkJmSFXDNcexQiAyluIHMC53XBZl3TqNQCImzv?=
 =?us-ascii?Q?lq9dgA66r3S05b77SOhA9HPW7k0vDo7sS1hUN0bZy+NsGrkqB6ua4PkY3Sy4?=
 =?us-ascii?Q?Ol5cNWg0aDBPBQ7ghNku16wzvwnWVbl1/YM5bKf0vKT5Sh+18Y9bbmrvE3dO?=
 =?us-ascii?Q?G+L6fataSl9D4UxCWFBYxaGpwYrXEjctS36AzVESTOsG2KAvsmF9w3geFykf?=
 =?us-ascii?Q?qn4jBRhYvIMQS1ZnYG1Ry9Uj3gg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbff2a61-7a30-458c-87b8-08d9bfc0eafb
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 11:49:15.0732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hyBz2i2OMYAecVr3/V0vMJtldzyxQQUMSi89qYt5XixkMZF2qK5lNEgivSmuP2NWgVbl0OSqufp34M2QFD3mp8P/lil7sPJXciRCtepamo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1664
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150065
X-Proofpoint-GUID: X3IE-xODy5KVqjc7umG5BLJqkBfqe42y
X-Proofpoint-ORIG-GUID: X3IE-xODy5KVqjc7umG5BLJqkBfqe42y
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "dp_bridge" pointer is allocated with devm_kzalloc() so it will be
freed automatically.  Kfreeing it here will only lead to a double free.

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 188e77c59885..d4d360d19eba 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -243,7 +243,6 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (rc) {
 		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
-		kfree(dp_bridge);
 		return ERR_PTR(rc);
 	}
 
-- 
2.20.1

