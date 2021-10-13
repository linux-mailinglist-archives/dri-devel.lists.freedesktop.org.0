Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FCA42B9EC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 10:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797836EA0B;
	Wed, 13 Oct 2021 08:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BD16E0B7
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 08:09:22 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19D70Fwn023376; 
 Wed, 13 Oct 2021 08:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=LhrK7TAnWTlAln2rH1TXROU+Ivw9kmS3I8HpXqrufCI=;
 b=pohNTG4tlTBMhnUnQl2F547bnHr9eQV++Dkxs3RxV0rf8dXvoBk91mqxLTxze4PQ3iv+
 Z7V4wsSokuBpR7a12ZtJZ+/ncfbPxnnDuW+UtHkYhyK3RI6A9dHIz7PysgzJ3euqLH4A
 hOa34i51wk5QufCG6AzEl8TcM8rmRMev2Cs/nW+x0yefvpiMCxTSsJrKg0kFpuyeXZSi
 rZTT1DnhnNy//B/NAeclLDVnuHcB7+WYycdYVw7iV0purX5U+Ir+bwVRaVe41NZuwzTZ
 Qao3rCpgIOamgvtEYAPgAqHBAK0jNw6IOOgqwpbx+IUSYmJU67nHmApKHqvL9ZYszJPX 6Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bnkbj285g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 08:08:50 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19D859cY062218;
 Wed, 13 Oct 2021 08:08:47 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
 by userp3030.oracle.com with ESMTP id 3bkyvabydt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 08:08:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4Vsy5y0QnOzdIb0eUcfk7Hu3bomGZeLUHjus8wKPxMTwmX3LaBcFGn5PdT1OFfeQuJysJt2CmhsK6hueAPAlvis0/D9q0LLEfPRiNW9sDUOvoRN9LzZs4I1a2Imd6my3FWIHGxsuXmc/l4OeLUHKjyLumtw+Xa/bL6auu+ltX4RWzjUAyGAyKfMP2oiWry5/XffT2cBkOhR0hqs1gTt3Prhj7YlMVMVlCEOCrXOOHG1kN6gEUNig2mwxsLwLjll4KSiqpwvvc98ln1FBMeERqv83JScrqsxQmYCyd0bvl66xO6c8ROl1nbUWi/lR8src4LYENIvr23VOntnrTr+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LhrK7TAnWTlAln2rH1TXROU+Ivw9kmS3I8HpXqrufCI=;
 b=TGb/PSCs2cXpX2iEq2i6YmNZ4uwrqFoNvhaqrqmptYEybB1QqMQXSUo4LHunGW0R9BO+OZ1thkD48CD/OYGha/SowDOBDC6NklOvAiex4GBAG1uCR5WoOfw8VzJ7FQ8Jo0vS++GlcQIyJzKnZv5lMyWX9F888rJ8fSVgJLBldxpMEWp+wzfNM2TVIyp4eDx5kR47nLEmUD6oCcmPvW8EzY/JoQd0AYGhB5a2ZRTlxiMfcIcjgjNORyx61OdvNtjwJ4J61iZECYi5K6L2818yKfpxGWsf5AfEsrsWBiUfe88o2l6oJdB7b8uYgaT1oJbgGfaGpK6RoJyzgQ3jQabOtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LhrK7TAnWTlAln2rH1TXROU+Ivw9kmS3I8HpXqrufCI=;
 b=QiJdN0yxdKpOr+YOSHoqqQWD16ghCa42k44F7XZvxaVF2quFFXxwWH2mQgh/BHBz/zDGw9zvSsBbJyze4F+aMdvYNGHBjO656F7tBip8q/D9QheAjxvgakrRxYZGLv9GgUH7EaLqNUm8bFpgQCT9OZ/z9B1ntuTK1uD2wFQy9ns=
Authentication-Results: samsung.com; dkim=none (message not signed)
 header.d=none;samsung.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4643.namprd10.prod.outlook.com
 (2603:10b6:303:9c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Wed, 13 Oct
 2021 08:08:45 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.027; Wed, 13 Oct 2021
 08:08:45 +0000
Date: Wed, 13 Oct 2021 11:08:25 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/bridge: display-connector: fix an uninitialized pointer
 in probe()
Message-ID: <20211013080825.GE6010@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::17) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0048.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Wed, 13 Oct 2021 08:08:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d763e772-8469-4d9c-b09e-08d98e20aa14
X-MS-TrafficTypeDiagnostic: CO1PR10MB4643:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB464365E3126E878B477CDE5B8EB79@CO1PR10MB4643.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hJIwHoWeRVf9vHAscFrRQy9+730IdTHqevttUzvCCOAssO5lTevK47/YX+LjFnPTwOlqN5PeRwXmonJ71fg3PgMV+HORMQOlkTj9azD7fZ26vYGvhyhIG2nRh1NgEBz+z+0S7KwJmaPLm8gn/u97YcwJE1RFHhHWOW3vaOrDwVpBu+zhzsembJyni9tFbD1XDUkA/a/oRd4XMkKU6UoZOZsnkVEEt/9ozl+wghdemLsuQcZdny20fjqmr2SBBWfXduCGvGyVjwXApH+Xodnsai6U655j3nG0y+ofUCrVr4d9DLbsdbu+xLZI94H/iZwAYGyX7xyLGgPknnzyPesvHZVzs3YruFtrCiGSENtPAaCykF4ihZhd0pfZrsNPXJkYVvr3fR8vgZWIO76L2eVHMhgikTcWu/3TKsr61g4h3HGYW557F97oERSBpU5O7Wl9QL+R1M4QHcsALrDeFHk0e9zoUjgGxPmOu+9CIewT32tE8Quy50riWj28xNmdeimgkrlwcBAi0lWLfEhNXPle2Zh3DeOa4PC9BNfBkVg2dWPnPoFVWx7/04RJsBpTGtvxmk/30YgPDn2+So1QTQwrQJXjFnXBnzPMRhh0X7DIS9Vln5rHdXY6vO2kT3mzAve4jI2E6WWmCX5BFUYr16D/aTATbNm8sFiB7nLPHV43z4RJoCFLdpORpsbIfoArsl0ffbjheb+EaLUqhUPhrjoJWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(7416002)(66946007)(4326008)(66556008)(6666004)(54906003)(2906002)(956004)(38350700002)(33716001)(6496006)(38100700002)(66476007)(83380400001)(186003)(508600001)(33656002)(1076003)(44832011)(4744005)(8676002)(26005)(5660300002)(316002)(9686003)(8936002)(55016002)(9576002)(110136005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lx/aCu0gpeOy4/AhWZVxE/ujS0IhwbYdf64cPpLn/TsSPq2QOdHUvCa0g2MH?=
 =?us-ascii?Q?v/SzHMZOxHHz9t4obIzjU13MK5HjYZiHVDZhGSvtspcziMODR80ZXKSOCG4Z?=
 =?us-ascii?Q?TZ+5KPfUr52QapD7aJYjh/xajhp0EwRFFaySYoZAfzJhhCMSUBA/r/67Q4Bc?=
 =?us-ascii?Q?TlWmpbOS9xjcb28pTYuS30nkgckkK5t//SslX1SIHRY8/iZlGzwIIpyqe+HB?=
 =?us-ascii?Q?PP/Eu5VNCqmT7MktvjAr98qys0e5eyizSfow1TuwMfB3WoUctyJpHJ0TMoEF?=
 =?us-ascii?Q?kdjANiWYVLf5sXsCp/8pRMJat2Cl7k6Zwxl+HaYYFwCBQ42MAUUyO6nGgc1C?=
 =?us-ascii?Q?por8Oen+PHxcAdWfisr1et/JZVJoDIlM4oXOMjhFoF/f2jQWCqNspwh0q6Jz?=
 =?us-ascii?Q?OsJjuGS6DtXnqLjDfE+kByPwA5FOAtWDPK13vTBKXibqfblNDhZNcchMALNt?=
 =?us-ascii?Q?42aPQu126iguPtdg1FOYY8PfZFZEJZweELBqA5zReZsOAjW/QzSAxM97BY5R?=
 =?us-ascii?Q?Uc37pney3+EEYeVrhZOwgNt9J/8OvuF5JXhj6KwY3vpRvH54jbtK78/PJJfk?=
 =?us-ascii?Q?Ri7tteK6a/5KZyGY9Fq96bnuPLm7BHnXVkL5a/IscxqHctoiPt4JhFL/F244?=
 =?us-ascii?Q?jf07PH+YomfxgYfLF5Rq3gmLJuvTLYSIk8XiWWA7Tnrm0x0d5Oaob/OX70H9?=
 =?us-ascii?Q?K26WNH2qWgKu3H6rrzT5U+KMblt26U9aczEyFBV5+4tKoltGiyIAG84E+zq0?=
 =?us-ascii?Q?usgTZOuLdmK0CBEvFQAJB0/u0SJ5QMcBgpeXwKp2FEc5nbaJFlLLm0JG1PbU?=
 =?us-ascii?Q?GInadZ9n3D4lb6Z9wld7nxrRR+DvqjVdBwlOqPQK91DiF9xOpkJgyp0xqua4?=
 =?us-ascii?Q?HRwnnGX05nAvSSMhLZSNEzFuIKGL77oSceGc77yOBSjH8wjumSOToKveuH93?=
 =?us-ascii?Q?UQ5TP7FjHMzxTmevFvSHz0sVarD0L+JtnZXcz5d3tZK1iuUoKDhplLereiPs?=
 =?us-ascii?Q?AKspn3KZ8ZRxgnYNCfEAZw+6jILjwIy1z/C0H0QRQ/8UI/TbXBTtxKkO0kG1?=
 =?us-ascii?Q?EJjgj9eIVwxq0Awrz/SHMVkaJVbyJjhfZImvtlmedZJ+0uZa1PBxIuX+RDUR?=
 =?us-ascii?Q?JmWWStM9eudsoBW73CZtZTWAZhgqaKlfeO5Dw5+7jP5tt+UzqWRp+rCMCLB8?=
 =?us-ascii?Q?Cc2w+/5rSvD+gpw5bHCwp53GAbKLOcVlz8jIILBMfe4qphrZFWbtaJiodgcx?=
 =?us-ascii?Q?UWHHWIggwsvt769E/w8Ba/JBVI2cbhGjeqSGux624C6GsvmczmU+eRjUZc+u?=
 =?us-ascii?Q?9lJfshJWxd6LG0a0kEDnE/bu?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d763e772-8469-4d9c-b09e-08d98e20aa14
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:08:45.4240 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xR/eV+xd8kI1na4v1uvc/i+q8Xor9xM/Pothtaanx3A1XBh4JCxUPfhWoKyITlDbNlvvB74w2IQB3MI3fMMmVIo5WPmNh1dM6frJC/4e7n8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4643
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10135
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110130054
X-Proofpoint-ORIG-GUID: nFWKUsXIbpFjobqjC7cZ651bVndJ-dGr
X-Proofpoint-GUID: nFWKUsXIbpFjobqjC7cZ651bVndJ-dGr
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

The "label" pointer is used for debug output.  The code assumes that it
is either NULL or valid, but it is never set to NULL.  It is either
valid or uninitialized.

Fixes: 0c275c30176b ("drm/bridge: Add bridge driver for display connectors")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/bridge/display-connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 05eb759da6fc..847a0dce7f1d 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -107,7 +107,7 @@ static int display_connector_probe(struct platform_device *pdev)
 {
 	struct display_connector *conn;
 	unsigned int type;
-	const char *label;
+	const char *label = NULL;
 	int ret;
 
 	conn = devm_kzalloc(&pdev->dev, sizeof(*conn), GFP_KERNEL);
-- 
2.20.1

