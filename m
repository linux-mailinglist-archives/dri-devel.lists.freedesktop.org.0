Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E95B940DB34
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 15:29:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11BA86EDBE;
	Thu, 16 Sep 2021 13:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76486EDBE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:29:34 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18GDCrsc030302; 
 Thu, 16 Sep 2021 13:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=WYBU4bsVufnTKrXlKG+jGVBT3Tc0lXO5xMob4CsUuIU=;
 b=NCQ14vacZfxAlmMF/azn/GFm5Yg96wgdvlohM53BzJkxYvSBhcouvAhpTGXFd+3guhYY
 DX0/OGSdJIadQtr8bIA90dCsOR/RRCkKNB68iyGuKmx5Gx5jh+MQju1TafO2fVvz7xQG
 PWWDEDwSIsCQS8hHmNvKX/d2U1ts8MNzBR+EVm/h5vJ68RofeX9BRiXJ4XnOMJT8p+lY
 Mti/u//oo5bN4ZFHlm9bNhD/x3odhJy7QQeDy4CJU/8tdDTWJ/BnkrjkYrEOZPNtswga
 XBnuuj7zoHu+p/A5zJOQZytNF9K8HQdPxOg6BceGR3UCcDt/tT7CF8hua8ybVTd5eXPH 0w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=WYBU4bsVufnTKrXlKG+jGVBT3Tc0lXO5xMob4CsUuIU=;
 b=T9+jjgwp4KvEIU6d6y7TI/UYRrIuZolsnS8npR2dxJOYPqyCOwzPIdG3JUA7DTVa2OJ2
 A3tOG+4z/YqjuhagVlq4vA+gki72eJnrkMD5hX9y2X2E4CZTjhPIwX6H8/IJeSB8DADA
 +Pf8dhs73cUtuLt+SpWOmn1/WUqUzrALQXTEp896p0VVNeL98FieKHOp2UXKbtLKffCn
 J6TX9qSwG1Dm1xis/VO1LAx1a491NeoXYMQb8HjiSxLLmnCrP3/HnHCx/FsiIH3S7AeH
 UDM0uChMB6tBLSEFQDu4GxTeaKdTOaJz0XTn2UjnlIAVoTrmyNwS/xwu91ZHNc1H6lyT mA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3b3tnht3tq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 13:29:32 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18GDQmeY144712;
 Thu, 16 Sep 2021 13:29:32 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2047.outbound.protection.outlook.com [104.47.74.47])
 by aserp3020.oracle.com with ESMTP id 3b0m99be3v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Sep 2021 13:29:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdFCR+T4rxtnHJinmAPbBmfok90J7Ej61qgR1p4mKDYZ4bkm8GHJbMSe0Z55zduabtBsForT12gz42o/t2Cvn8H54qNwgEnsVqqvaQ7iMtzdnz3lwMKxrtLRu7ODdM2TqON2QFlY1jeqmSegMjJ/NAh17hxAUeSbvaFe5qf0isGg24ToMyIxtJ1IRIln4+XgJOHWW0FX+1AC0g2rMu0q79+yp6EdCWcDCS+GRVhmSzO6NAqdR6YZFprDFppohwkwUmh9aSEuLybi8m5dhrjWHH8eL62yrdzC5kE1iKxtK7PCDWHpNmnBnLm/6FcfCCsmf17Pj0W/hDdq1ARaE1GNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=WYBU4bsVufnTKrXlKG+jGVBT3Tc0lXO5xMob4CsUuIU=;
 b=aY7SuY7D5wwws/OFprHWncVnQbxkIo0uHRqavhe9kaAPtgFFygcZMEnsnfFbQZtEzM9mcAPVMBWaFuZSyGEj0i2Kc22gbYUlBQVbTrbnsqQZzthEwHueDcxipq95yhbvWEBAGvfsclENmX/0pCUQet0IHd3b0x4uz+5xTe0XJyBLgXc6r9ARlelHshH+WByszYQR03XbuJ07BY50Y+uajXaXddZwu6AOv2GofGg1dw/osouRNPetR4QggTkYI057uoojVXl9ichuLWU5GwsRR/wz1IqtmR4PNipRV07nHNV4sjAwk36+UwHC5o4e26FYC814MUdJIvM8duHkjuQ5ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYBU4bsVufnTKrXlKG+jGVBT3Tc0lXO5xMob4CsUuIU=;
 b=cQKxbPnZJIawuH5ALDj1x91qEudfUkw8gV+TIad9cUUWoQOaD/Btj3azVvlyHnXo+Pl6GdHg0ArnWz5+VeHsGUIOxEwi4udIXWBkYXae1V4Klnpd5HDNiNScm07khDJeIK3yZ4AYqARGaNdcwtGPkb7+n5HaOBlzFY+dGXCiKXc=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com (10.174.166.156) by
 MWHPR10MB1773.namprd10.prod.outlook.com (10.172.52.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14; Thu, 16 Sep 2021 13:29:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 13:29:29 +0000
Date: Thu, 16 Sep 2021 16:29:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@osdl.org>, Antonino Daplas <adaplas@pol.net>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] fbdev: fix printing in fb_cvt_print_name()
Message-ID: <20210916132919.GG25094@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0060.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::11) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0060.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Thu, 16 Sep 2021 13:29:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cbcade6-cab6-4a30-4026-08d9791602b4
X-MS-TrafficTypeDiagnostic: MWHPR10MB1773:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1773B5F8CEA97FEAB11B1AEA8EDC9@MWHPR10MB1773.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H0u9r71l6DL9Y9KkI9AR41S1c3Fx8PwuMbDhm8+LjBqVc67gz14MqTOHXcNu8N9p/E/qbiaxB/7QhEKqdcQk5ikQ4FSS3l5ARnaTsCb0p69D++cTYjZT7UVMY6UL27rpebE8XHaIqJpuBBr7gO9Ws5NwkDPmHAeZ5uDHldiAk7DEJcuEIMvhE+0S4hoGh/UjpebUl8XfC9/1SlkktXFR7/mj4T4dPxxA9oyOSz/hgBm/WDD6pkP4+2I7CR82S4xfDVFXFwgIFTru09yGFZm+RiyGLkGcRjfWUvYbX/DBZKNzdQ+Qj2FTmS9GdmvUf6Sklt5Zgks83ZLwsNfkDVcCeiUuUijlVV9WNQmQr9STIHwb15KRVQXZdMJthTyHDPUKe5kkvTHKY7VlgmPVRovRZ397sPuyTKNIJ1MIWqvZqOe5b4qrK6bcExrNf++r0skvstFNfHySOBoJbD8QJno0OSbp3viL4m6LCKZgCC6vJg1uu/mv3t3e0yMzVP7Fd3rEkYyXc+teZJN6cfmbx0Z0vZaj8kgb0OwatPlpCH51rGDOcwNWDQFZQbbx3Q2k1elgZjnu7NAr056V3Bs0WRD6EPhkC04yMXTaSuJ03ZhGXWwSbagou26ugb6bCyMrC999YQ553awa28QxPBXkBr0URyrqFejQon8ncynyJVgC6dNKbcdw2dQUUzep1sk5mxiGRFrk2mycjNAtx9DE6pzLcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(1076003)(86362001)(508600001)(33656002)(66476007)(66556008)(9576002)(6666004)(5660300002)(38350700002)(38100700002)(83380400001)(33716001)(55016002)(54906003)(44832011)(6200100001)(316002)(2906002)(6862004)(6496006)(4326008)(956004)(52116002)(26005)(186003)(9686003)(66946007)(8936002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?htdSKRCOASc+xeLaXA5Ac8GRTkWZAEgUogc96JQwMzGgVO9vybYH1Kkv5PKT?=
 =?us-ascii?Q?ybU/4VlRIcSeQSO8xoQSpGqIP+eHajxR9tzcbEt8dYItN43/+ic1QyOCwDnp?=
 =?us-ascii?Q?EVSuXX4N4kPIBDI35ZbS6dVteMGvxBgDC5L1HOxqKS5qmYT3q2QhESauVGBV?=
 =?us-ascii?Q?96k41KqelvAr7NUqKrH1wb3Bwy5IriLQp9A9146Yb7WD//7vWUnb3QZkFYAR?=
 =?us-ascii?Q?9E9phSxblgOkfWTtpe41sVDOaG38DFwvPs9MRJYs62hi1nVTTwGkuzM7LM64?=
 =?us-ascii?Q?BZZwJKjMINeGBMi4qRIWxj4z5T7uPpa3EyRDbVuJiO19Qn59/3HPfIGcc8VU?=
 =?us-ascii?Q?eZpzoH2fbhmQenEwtZaObEkY7Msx/fIBSnRDSARpn2M8LjJ4E+fj6xleTGQ+?=
 =?us-ascii?Q?MXWphzDfSxZv/bRrwiKEZVNoAMASnh0DPmmH3gexVuSyDdBzoZEl7vqtVOjJ?=
 =?us-ascii?Q?QNNnjbhkxXZlrrTDOBoNv2vUG9s44XUA3cIT5KbmdOJCZ7D57+wHZOm54fGw?=
 =?us-ascii?Q?r7rZAG7ychcm8DBrsBN2/8A4KzKMmJd5vQ09N6lDB8NHRIK8fzmkHkKd3NR6?=
 =?us-ascii?Q?Raypbz23p/Z6NBqIAokKCjkh1MCsIwxq5GOpOYzH9qsQgybsYnHBIN0xfAFZ?=
 =?us-ascii?Q?X2vIjc48qGHfo9m9PaNtIqseYYsv/U48dUY+TTbaS+Rpdi+M0crJYZTttx7F?=
 =?us-ascii?Q?JVVIz8BJ+FoMYJIA0R3o/N6FZcgUxWWLR+zOLkGFNZ7YyYxtv1Enytwmuz37?=
 =?us-ascii?Q?tOguM7j2nGx9Z0QJi0pMpOlVhTXPIqmjm0GzEauEBxY/kiBtcrNrHEmh3uK1?=
 =?us-ascii?Q?VnVncFH9F78np1r/3/E8l5ZEfEGRKb0wxT69xcMw5UyjGVdDjcdO8WMmzmtk?=
 =?us-ascii?Q?28AeK+hr0hk2dqWi6Z4oZJiBMDXMYZf6bLfYpxlWomR+w42TCQ9ARW71PI+P?=
 =?us-ascii?Q?Hiut68ZC3WBuMcGHm0/dTEPmRCpqjkpcc+VDcyhZhsfV/ZPDZLwlTdNOOhNN?=
 =?us-ascii?Q?USjzEjk6i9Ns0xOkAvaPjtOtNqjequzURHZptdYT7DUormHBLgPH+YXWAW7V?=
 =?us-ascii?Q?sZRoMa0ODEflIJKSaDj5vTRyPKkXlDSzwBEhj2bqlT6+0InOPwMRBIvMEx6z?=
 =?us-ascii?Q?/C6HrL6r2/2I+Q9zG2ETz5ZjauVJ6xOur9wLsxfpVDR862rhiMXOrx92FZmy?=
 =?us-ascii?Q?pjyWa5pmdLzEc37lZS8g3gnVsg/Hs6iAZZL4k3mKvoMzcf5gZ8h/ZYHgL/Oz?=
 =?us-ascii?Q?xSSHdyhBU1puumoF5SNnA9z9oRgqjDslPckVC5p7LU7kRQDXeCbcJ36MbA2C?=
 =?us-ascii?Q?iiSAShxeDDmfiVuZTRkNd15Q?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cbcade6-cab6-4a30-4026-08d9791602b4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 13:29:29.3583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJkjo7K1SDl9tjO7F8sHiuu7DbL+Con5r06r/Vf74ZFTxn9NvG9zZ7g0fM8Dr2W+cDFNVOWFoZ9rbpVCP3iFMfvyYV6T2Wv7tDH1s9zq9yo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1773
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10108
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109160086
X-Proofpoint-GUID: OsUH_42FkBQYX7IBaPTG5edto35KDFai
X-Proofpoint-ORIG-GUID: OsUH_42FkBQYX7IBaPTG5edto35KDFai
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

This code has two bugs:
1) "cnt" is 255 but the size of the buffer is 256 so the last byte is
   not used.
2) If we try to print more than 255 characters then "cnt" will be
   negative and that will trigger a WARN() in snprintf(). The fix for
   this is to use scnprintf() instead of snprintf().

We can re-write this code to be cleaner:
1) Rename "offset" to "off" because that's shorter.
2) Get rid of the "cnt" variable and just use "size - off" directly.
3) Get rid of the "read" variable and just increment "off" directly.

Fixes: 96fe6a2109db ("[PATCH] fbdev: Add VESA Coordinated Video Timings (CVT) support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/video/fbdev/core/fbcvt.c | 53 +++++++++++++-------------------
 1 file changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcvt.c b/drivers/video/fbdev/core/fbcvt.c
index 55d2bd0ce5c0..64843464c661 100644
--- a/drivers/video/fbdev/core/fbcvt.c
+++ b/drivers/video/fbdev/core/fbcvt.c
@@ -214,9 +214,11 @@ static u32 fb_cvt_aspect_ratio(struct fb_cvt_data *cvt)
 static void fb_cvt_print_name(struct fb_cvt_data *cvt)
 {
 	u32 pixcount, pixcount_mod;
-	int cnt = 255, offset = 0, read = 0;
-	u8 *buf = kzalloc(256, GFP_KERNEL);
+	int size = 256;
+	int off = 0;
+	u8 *buf;
 
+	buf = kzalloc(size, GFP_KERNEL);
 	if (!buf)
 		return;
 
@@ -224,43 +226,30 @@ static void fb_cvt_print_name(struct fb_cvt_data *cvt)
 	pixcount_mod = (cvt->xres * (cvt->yres/cvt->interlace)) % 1000000;
 	pixcount_mod /= 1000;
 
-	read = snprintf(buf+offset, cnt, "fbcvt: %dx%d@%d: CVT Name - ",
-			cvt->xres, cvt->yres, cvt->refresh);
-	offset += read;
-	cnt -= read;
+	off += scnprintf(buf + off, size - off, "fbcvt: %dx%d@%d: CVT Name - ",
+			    cvt->xres, cvt->yres, cvt->refresh);
 
-	if (cvt->status)
-		snprintf(buf+offset, cnt, "Not a CVT standard - %d.%03d Mega "
-			 "Pixel Image\n", pixcount, pixcount_mod);
+	if (cvt->status) {
+		off += scnprintf(buf + off, size - off,
+				 "Not a CVT standard - %d.%03d Mega Pixel Image\n",
+				 pixcount, pixcount_mod);
-	else {
+	} else {
-		if (pixcount) {
-			read = snprintf(buf+offset, cnt, "%d", pixcount);
-			cnt -= read;
-			offset += read;
-		}
+		if (pixcount)
+			off += scnprintf(buf + off, size - off, "%d", pixcount);
 
-		read = snprintf(buf+offset, cnt, ".%03dM", pixcount_mod);
-		cnt -= read;
-		offset += read;
+		off += scnprintf(buf + off, size - off, ".%03dM", pixcount_mod);
 
 		if (cvt->aspect_ratio == 0)
-			read = snprintf(buf+offset, cnt, "3");
+			off += scnprintf(buf + off, size - off, "3");
 		else if (cvt->aspect_ratio == 3)
-			read = snprintf(buf+offset, cnt, "4");
+			off += scnprintf(buf + off, size - off, "4");
 		else if (cvt->aspect_ratio == 1 || cvt->aspect_ratio == 4)
-			read = snprintf(buf+offset, cnt, "9");
+			off += scnprintf(buf + off, size - off, "9");
 		else if (cvt->aspect_ratio == 2)
-			read = snprintf(buf+offset, cnt, "A");
+			off += scnprintf(buf + off, size - off, "A");
-		else
-			read = 0;
-		cnt -= read;
-		offset += read;
-
-		if (cvt->flags & FB_CVT_FLAG_REDUCED_BLANK) {
-			read = snprintf(buf+offset, cnt, "-R");
-			cnt -= read;
-			offset += read;
-		}
+
+		if (cvt->flags & FB_CVT_FLAG_REDUCED_BLANK)
+			off += scnprintf(buf + off, size - off, "-R");
 	}
 
 	printk(KERN_INFO "%s\n", buf);
-- 
2.20.1

