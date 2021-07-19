Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 189073CD150
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 11:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C953F89CF5;
	Mon, 19 Jul 2021 09:59:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2442089CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 09:59:04 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16J9uQ7G032289; Mon, 19 Jul 2021 09:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=fUD2sNH4VpPL94hJVeC0HArY1XA7st2Xbs+9/DXfHg4=;
 b=Nvfj4qniIk3PFwILR/AWEGB7HDYm0ePCiR8NzAafjaSdLEoJADcdW/qRylK6G0yo8pO2
 CW0yEP/vE2VXhKrmHAsW3PZ3N7fKUtIs2Z+tKlt6FHIsKgNJpWuPTdiJCFcFVRyVm9K8
 a5PeirgiQkbI3UpMo0uzFCpjt3lRNiRzk46tD8D/J5drRb+BTFD4KAaW4FIilkjzRUYp
 dEbXt2bhIKccWQALrnIEI9X/zAw4lhjS91QzIaXsKxLbsqywuzqs2WMjo7Dmv0Kgb6aI
 aHRdxK9z1LNLTH3/nrszMfKHU1Z6cywjiz34NvYKQhOE0v2tZlxlsHdpsjUtdACD3AiK FQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=fUD2sNH4VpPL94hJVeC0HArY1XA7st2Xbs+9/DXfHg4=;
 b=xQrVzizpVPISQWYXWM86DUw8UxIRSnspZSDFySwEt33WLRlBG+a2xb2HuYuTYWqFqNCA
 fS/sK1D96T5o8SMDA4OekSvQCS2nyOjc0Z3g8VM55eCp3mIBbb7/fNXwRJbs6NzGgD0u
 PMykKJRLAA7t40G3fvBuy/OdQVDFsVw6TmD9qHR8DSoogbes6bi5XFrKua1XViLpOUk0
 z9FFBmk37qS08OAKcHnle0JuD96GzHb9FCpJadRKy31MtAqa4F44MuEwxvwOGKrMVh7c
 1eVI2ZfRYHlSTAk0pTLbsEmN6ZT7FQ+nJpy7qppLfYtVB77XanVY/dZ/kagJ16TwLAL9 kg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vrn5h20q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 09:58:43 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16J9tDLG105114;
 Mon, 19 Jul 2021 09:58:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by aserp3030.oracle.com with ESMTP id 39upe807ec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 09:58:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQ5FX7vdUXmkcWg/DvpDvbEZJJREeMgpnFGumN/aEa8tbKxcjJqfOZWf5SkY7/hnDmEUb6/JLr0JWu0zxWqRlCePe72B4StajlNJaFeIJOjT3XI6gooG7i6MdmFipnwBWI1MEP51cvPQRBMoDHYS/7PVgBsMT71uYyNGuQbcnOASBd7QDcZ9QNuxBaDxorQ4OLbrftQ4zsL4wCeNF8pU6eSMEEQXGYcR1E1Tlv/IZ9pjbZDyKOavxOSJwFwFqqcznHw2TADyqjTCUVyJC+IL03CujCbRi5Z4ExgxDnGwoInB6jGkQPNqRyWdzTcMw7QTpPjy8VXCLrLqsGvnHaS42A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUD2sNH4VpPL94hJVeC0HArY1XA7st2Xbs+9/DXfHg4=;
 b=jTD5VL/6M+7lRywNOqmNraPgCOhqjX9kSOkR3PU0yZdeF0Eve1tneFJBTL9HdbcQv9UwKJ4aY2a2XDqgG6Sqou652VYsB7XvF28DykdRo5n4jtVQv0tWq0hKVxPxdxPFjramfv1biWRGhlIi831GBHuo8Fgp6fntDBLx3UBuNc2sqKa5CP0w9uJrmNN5qpEzU1LLMOdNU5X1oIdiDen3RpT+ie3EcZ6QZCSOEO1RaLR/hMFqBTfe1ibTgnZM4BDTpnnV9lbP4pUTN1hBlU1XN5m5cLQ49jJh6LliDpCFoGoBTALAAfe7aLq3VGfeH68lpJjlrRkqEGUQDj6O+KJ3aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fUD2sNH4VpPL94hJVeC0HArY1XA7st2Xbs+9/DXfHg4=;
 b=NMd4AD4n0+dYTHuRxVd5a3RGVWAoBDH0wBXYKtw4SThyT08oclAZdNkRK92R5U5+FIu4ErqJ8zMu74dIQfFalrBDAnm0J8ULtUXgdVWuqxO3+JS1Hx+QRjp3WtZ59Un8orX+ndDBkVeU9TBd7bSzlEj1ubo5oe5qqRT3eGWjvdA=
Authentication-Results: loongson.cn; dkim=none (message not signed)
 header.d=none;loongson.cn; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4690.namprd10.prod.outlook.com
 (2603:10b6:303:9f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 09:58:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 09:58:39 +0000
Date: Mon, 19 Jul 2021 12:58:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: lichenyang <lichenyang@loongson.cn>
Subject: Re: [PATCH v2 3/3] drm/loongson: Add interrupt driver for LS7A
Message-ID: <20210719095819.GS1931@kadam>
References: <20210715015809.107821-1-lichenyang@loongson.cn>
 <20210715015809.107821-3-lichenyang@loongson.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715015809.107821-3-lichenyang@loongson.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by
 JNAP275CA0011.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 09:58:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eea22496-4c98-4ed5-d6b8-08d94a9bc82b
X-MS-TrafficTypeDiagnostic: CO1PR10MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4690AEBF7C3533F37FAA2A068EE19@CO1PR10MB4690.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qhhtFLPEJC0Xu4OnhOyMuTD4S9Xe2UiLs7gKyKn0lMtYbLtcZsVHWyI6nI/bLbofmRRCG/yrOFMEAK4/B1IHdmwCleX/odcSz7uC277aModzt5BbeFB6Foo79RKxW97jn/GlSPCjKuC69Oq4jzjuPccct8+EpiG6vJ+th4/xgfUREwhdIDK/CIRkHKWXdl+7pT6FyzHUQp5zniGZimRFcAB7bzgrE7J83C12dPfjsgdGiShXtiKyOnidPEGdzVsXNZbCA85YEG0Q1CKzW3RveWZ3Fi6+FCLIgv7oeYdjN7o90YIjbdbWfLGr1uQvc4tFXX+gaLyAtEMNuKOwhUw8W42MyFb3+YfH+6Qmn8Rt/6jIigI5jYiGra32MB1oYGaDycoiUQNoxrag2CfQiBEVxurbMEb1nHntVIH9LEQVWFFJ3i13LK+j8qC42aHKGECgBWLuKUNvAyUYbtQLwMKp592RD/hMhpJ7xqjO31LYqrGuCXIFGz9ny+CHKyyiJCfeo3wXlV1iQbB9bjoQYdfa1RrEugYOy1hg2YwidPNUAqP4Yfzpw+Lc+MgjuuIU3sx0mTYIKcMvdBPzF+ONIBWfeNQ8o4hsd3oLtEoMfDmkjyBRj0aPRP+cw4diErK0z43AFhjo1ia1VnfGxd73aCjj4q9qPNSZFWmRnsYXlfIJneUwSsmFi6Tk5rlQgtWujEWjuVWcFJ+2jcMSknB3De2Fww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(136003)(366004)(396003)(376002)(26005)(6916009)(186003)(2906002)(86362001)(54906003)(30864003)(33716001)(66476007)(66556008)(316002)(66946007)(5660300002)(1076003)(4326008)(8936002)(6666004)(9576002)(83380400001)(478600001)(38100700002)(38350700002)(956004)(52116002)(44832011)(8676002)(6496006)(33656002)(55016002)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vArUiJCM/uImWY+L0RBFhXW7OT+6fKhyV1iPW274b0bKfBaKiCiLbOj7z3sw?=
 =?us-ascii?Q?O+IZ7sYvKrtELzBuIp8IScfIG/FdQ0323dMCbuYtygShhahTdMPYbG3ZAHVw?=
 =?us-ascii?Q?Td1vAHMjhhKN/xL2Ur2gu/p8pKtlu5zd+ILBbIFuEqiVMyyD06boZ4iP5nIp?=
 =?us-ascii?Q?yZD/Tghavx2CVQ3MfGZUgYKkQNGUs64p0X6NzAdxnHSQdFCEbpvIKCMObPX3?=
 =?us-ascii?Q?BLfzsT/pbTxzWm4tMnjBRzwL7dM+JA6XB/Syx9TnW6Knz1gc+DzD1PwzvDhA?=
 =?us-ascii?Q?9qdwWuD1K81KNtbgiefM4PJGh7S3eyjWd+l45ar8Tj8br17dBHuXfsz0nNdK?=
 =?us-ascii?Q?J428xrjgRUgONWzhuiFp83Ovkb82IRhjiPWrezJDlfUh1N/A6c0FAD/jiPMb?=
 =?us-ascii?Q?msfdl4l0BVX1iWKHu96xgwsbwhRogwzf2y/q+/2cjlcFET9HNiOsVoX4LzsV?=
 =?us-ascii?Q?W8sOgxDcskoPLpSWK8V4qmZU2660Lw4NHqpLUgnPGzgkkuuLQJx5Y2V1+jO0?=
 =?us-ascii?Q?GuNmCMOfDAg6TFXjCYIR7WKecslfhjoRIHRMOjgxQyJe4TQVbisdLgM5S5vn?=
 =?us-ascii?Q?9HmmJJXMXtAn2W7szzp2hGpZpTWQPfrGxe6rf5v9PNgxdem+sc1pkJ6kmItp?=
 =?us-ascii?Q?xehZbUVeg9WxiY/RPRoujOemh9v+uLQm+g0WhTVFg9ewLeblsC8x2W8cvc9F?=
 =?us-ascii?Q?h4C8me2ybn/daz1OUbv40tPGtx1d0HTFiu+8ETcHvuGMNUdwRtiO2pQrB9/7?=
 =?us-ascii?Q?2ZiNHctgzD+3seLarw9eLqXEbqmaDA23xpVb80aE1KPUc8GAPkmSFMXJgSxL?=
 =?us-ascii?Q?gfB47XuxvhQg0NuComqhLqkcu1tzZ6zlVngIP6yEK9qZgjlcIBzmDNz8f3c3?=
 =?us-ascii?Q?8gkNX6ktF2TsuMSDpVFLpqjv7n2VJcpwA1R7m5QWFRLIH3QRtpPkUtXs+Oet?=
 =?us-ascii?Q?KslL0FWrXLfykHcNa5VScK9HZX/6ZQIPZqWI3gWcvR04UWTxzuXa1NFIFMXA?=
 =?us-ascii?Q?md7RfPTPxbySjqmlXN9153HAtF+YaNpCb7yMjh95+nCY1RQqHpKZPQXLI4rA?=
 =?us-ascii?Q?6HX+6T4g39Fj1q4FaJ5Ie8q0m8BVK0Bt6KSKxAY+R28K+ytSE0HO9KYG6dCJ?=
 =?us-ascii?Q?FEHqit1YUGON25JO2Q3PkXXriLgIDARbOzFLSg3H9p72fH55FRrL2R+3wWiF?=
 =?us-ascii?Q?IxB7gCVnvqdKXy6CfCbq9osPX73O8bcp1cENBp9iN4fAQB7wq2znEEAJ3+A1?=
 =?us-ascii?Q?iHmTarL3myfGQEipChXRb+97EMWh4Zw9PVc2t/FFC2ccoW3pdgoESCUcMLau?=
 =?us-ascii?Q?o8XOjh1bw9PJPOH/vpQ8RRec?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eea22496-4c98-4ed5-d6b8-08d94a9bc82b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 09:58:39.2765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7nqbytOXUYQqRFTopQz2AnjJEkHx9qisZ18pBBKDnsFgMOLN2QPPd5vQPzOnoZ/spRDCCWVe6hy+jIuW+meGzEITdDgEKaGEHTmMh0VsQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4690
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190056
X-Proofpoint-GUID: kqxbPwezhmudkwCDJuxNppxN6quqLrtj
X-Proofpoint-ORIG-GUID: kqxbPwezhmudkwCDJuxNppxN6quqLrtj
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
Cc: David Airlie <airlied@linux.ie>, Huacai Chen <chenhuacai@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devel@linuxdriverproject.org, Tiezhu Yang <yangtiezhu@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 15, 2021 at 09:58:09AM +0800, lichenyang wrote:
> Add LS7A DC vsync interrupt enable and close function, and
> register irq_handler function interface.
> Add vbrank event processing flow.
> 
> V2:
> - Remove the useless flags parameter.

Do this in a separate patch.  It is an unrelated cleanup.

> - Added error handling in the loongson_drm_load function.
> 
> Signed-off-by: lichenyang <lichenyang@loongson.cn>
> ---
>  drivers/gpu/drm/loongson/Makefile        |   3 +-
>  drivers/gpu/drm/loongson/loongson_crtc.c |  43 +++++++++-
>  drivers/gpu/drm/loongson/loongson_drv.c  |  22 +++--
>  drivers/gpu/drm/loongson/loongson_drv.h  |  17 +++-
>  drivers/gpu/drm/loongson/loongson_irq.c  | 105 +++++++++++++++++++++++
>  5 files changed, 179 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/gpu/drm/loongson/loongson_irq.c
> 
> diff --git a/drivers/gpu/drm/loongson/Makefile b/drivers/gpu/drm/loongson/Makefile
> index 773b806e99a2..cc50b65c7e03 100644
> --- a/drivers/gpu/drm/loongson/Makefile
> +++ b/drivers/gpu/drm/loongson/Makefile
> @@ -11,5 +11,6 @@ loongson-y := loongson_drv.o \
>  	loongson_device.o \
>  	loongson_connector.o \
>  	loongson_encoder.o \
> -	loongson_i2c.o
> +	loongson_i2c.o \
> +	loongson_irq.o
>  obj-$(CONFIG_DRM_LOONGSON) += loongson.o
> diff --git a/drivers/gpu/drm/loongson/loongson_crtc.c b/drivers/gpu/drm/loongson/loongson_crtc.c
> index 4cb65fa08778..4c62d5b2bd56 100644
> --- a/drivers/gpu/drm/loongson/loongson_crtc.c
> +++ b/drivers/gpu/drm/loongson/loongson_crtc.c
> @@ -154,19 +154,25 @@ static void loongson_crtc_mode_set_nofb(struct drm_crtc *crtc)
>  }
>  
>  static void loongson_crtc_atomic_enable(struct drm_crtc *crtc,
> -					struct drm_atomic_state *old_state)
> +					struct drm_atomic_state *old_crtc_state)
>  {
>  	struct drm_device *dev = crtc->dev;
>  	struct loongson_device *ldev = dev->dev_private;
>  	struct loongson_crtc *lcrtc = to_loongson_crtc(crtc);
>  	u32 reg_offset = lcrtc->reg_offset;
>  
> +	if (lcrtc->cfg_reg & CFG_ENABLE)
> +		goto vblank_on;
> +
>  	lcrtc->cfg_reg |= CFG_ENABLE;
>  	ls7a_mm_wreg(ldev, FB_CFG_REG + reg_offset, lcrtc->cfg_reg);
> +
> +vblank_on:
> +	drm_crtc_vblank_on(crtc);
>  }
>  
>  static void loongson_crtc_atomic_disable(struct drm_crtc *crtc,
> -					 struct drm_atomic_state *old_state)
> +					 struct drm_atomic_state *old_crtc_state)
>  {
>  	struct drm_device *dev = crtc->dev;
>  	struct loongson_device *ldev = dev->dev_private;
> @@ -175,10 +181,36 @@ static void loongson_crtc_atomic_disable(struct drm_crtc *crtc,
>  
>  	lcrtc->cfg_reg &= ~CFG_ENABLE;
>  	ls7a_mm_wreg(ldev, FB_CFG_REG + reg_offset, lcrtc->cfg_reg);
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	if (crtc->state->event) {
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		crtc->state->event = NULL;
> +	}
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +
> +	drm_crtc_vblank_off(crtc);
> +}
> +
> +static void loongson_crtc_atomic_flush(struct drm_crtc *crtc,
> +				       struct drm_crtc_state *old_crtc_state)
> +{
> +	struct drm_pending_vblank_event *event = crtc->state->event;
> +
> +	if (event) {

Flip this around:

	if (!event)
		return;


> +		crtc->state->event = NULL;
> +
> +		spin_lock_irq(&crtc->dev->event_lock);
> +		if (drm_crtc_vblank_get(crtc) == 0)
> +			drm_crtc_arm_vblank_event(crtc, event);
> +		else
> +			drm_crtc_send_vblank_event(crtc, event);
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +	}
>  }
>  
>  static enum drm_mode_status loongson_mode_valid(struct drm_crtc *crtc,
> -						const struct drm_display_mode *mode)
> +		const struct drm_display_mode *mode)
>  {
>  	if (mode->hdisplay > 1920)
>  		return MODE_BAD;
> @@ -194,9 +226,10 @@ static enum drm_mode_status loongson_mode_valid(struct drm_crtc *crtc,
>  
>  static const struct drm_crtc_helper_funcs loongson_crtc_helper_funcs = {
>  	.mode_valid = loongson_mode_valid,
> +	.mode_set_nofb = loongson_crtc_mode_set_nofb,
> +	.atomic_flush = loongson_crtc_atomic_flush,
>  	.atomic_enable = loongson_crtc_atomic_enable,
>  	.atomic_disable = loongson_crtc_atomic_disable,
> -	.mode_set_nofb = loongson_crtc_mode_set_nofb,
>  };
>  
>  static const struct drm_crtc_funcs loongson_crtc_funcs = {
> @@ -206,6 +239,8 @@ static const struct drm_crtc_funcs loongson_crtc_funcs = {
>  	.destroy = drm_crtc_cleanup,
>  	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +	.enable_vblank = loongson_crtc_enable_vblank,
> +	.disable_vblank = loongson_crtc_disable_vblank,
>  };
>  
>  int loongson_crtc_init(struct loongson_device *ldev, int index)
> diff --git a/drivers/gpu/drm/loongson/loongson_drv.c b/drivers/gpu/drm/loongson/loongson_drv.c
> index 252be9e25aff..13003f6ae062 100644
> --- a/drivers/gpu/drm/loongson/loongson_drv.c
> +++ b/drivers/gpu/drm/loongson/loongson_drv.c
> @@ -24,7 +24,7 @@ static const struct drm_mode_config_funcs loongson_mode_funcs = {
>  	.mode_valid = drm_vram_helper_mode_valid
>  };
>  
> -static int loongson_device_init(struct drm_device *dev, uint32_t flags)
> +static int loongson_device_init(struct drm_device *dev)
>  {
>  	struct loongson_device *ldev = dev->dev_private;
>  	struct pci_dev *gpu_pdev;
> @@ -131,7 +131,7 @@ int loongson_modeset_init(struct loongson_device *ldev)
>  	return 0;
>  }
>  
> -static int loongson_drm_load(struct drm_device *dev, unsigned long flags)
> +static int loongson_drm_load(struct drm_device *dev)
>  {
>  	struct loongson_device *ldev;
>  	int ret;
> @@ -143,7 +143,7 @@ static int loongson_drm_load(struct drm_device *dev, unsigned long flags)
>  	dev->dev_private = ldev;
>  	ldev->dev = dev;
>  
> -	ret = loongson_device_init(dev, flags);
> +	ret = loongson_device_init(dev);
>  	if (ret)
>  		goto err;
>  
> @@ -164,8 +164,16 @@ static int loongson_drm_load(struct drm_device *dev, unsigned long flags)
>  	pci_set_drvdata(dev->pdev, dev);
>  
>  	ret = loongson_modeset_init(ldev);
> -	if (ret)
> +	if (ret) {
>  		dev_err(dev->dev, "Fatal error during modeset init: %d\n", ret);
> +		goto err;
> +	}
> +
> +	ret = loongson_irq_init(ldev);
> +	if (ret) {
> +		dev_err(dev->dev, "Fatal error during irq init: %d\n", ret);
> +		goto err;
> +	}
>  
>  	drm_kms_helper_poll_init(dev);
>  	drm_mode_config_reset(dev);
> @@ -192,6 +200,10 @@ static struct drm_driver loongson_drm_driver = {
>  	.fops = &fops,
>  	DRM_GEM_VRAM_DRIVER,
>  
> +	.irq_handler = loongson_irq_handler,
> +	.irq_preinstall = loongson_irq_preinstall,
> +	.irq_uninstall = loongson_irq_uninstall,
> +
>  	.name = DRIVER_NAME,
>  	.desc = DRIVER_DESC,
>  	.date = DRIVER_DATE,
> @@ -221,7 +233,7 @@ static int loongson_pci_probe(struct pci_dev *pdev,
>  		goto err_free;
>  	}
>  
> -	ret = loongson_drm_load(dev, 0x0);
> +	ret = loongson_drm_load(dev);
>  	if (ret) {
>  		drm_err(dev, "failed to load loongson: %d\n", ret);
>  		goto err_pdev;
> diff --git a/drivers/gpu/drm/loongson/loongson_drv.h b/drivers/gpu/drm/loongson/loongson_drv.h
> index 24a534c3c79c..60f5bd48f7f2 100644
> --- a/drivers/gpu/drm/loongson/loongson_drv.h
> +++ b/drivers/gpu/drm/loongson/loongson_drv.h
> @@ -4,9 +4,11 @@
>  #define __LOONGSON_DRV_H__
>  
>  #include <drm/drm_drv.h>
> +#include <drm/drm_fourcc.h>
> +#include <drm/drm_vblank.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_irq.h>
>  #include <drm/drm_fb_helper.h>
> -#include <drm/drm_fourcc.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -49,6 +51,7 @@
>  #define FB_HSYNC_REG (0x1420)
>  #define FB_VDISPLAY_REG (0x1480)
>  #define FB_VSYNC_REG (0x14a0)
> +#define FB_INT_REG (0x1570)
>  
>  #define CFG_FMT GENMASK(2, 0)
>  #define CFG_FBSWITCH BIT(7)
> @@ -60,6 +63,10 @@
>  #define FB_PANCFG_DEF 0x80001311
>  #define FB_HSYNC_PULSE (1 << 30)
>  #define FB_VSYNC_PULSE (1 << 30)
> +#define FB_VSYNC1_ENABLE (1 << 16)
> +#define FB_VSYNC0_ENABLE (1 << 18)
> +#define FB_VSYNC1_INT (1 << 0)
> +#define FB_VSYNC0_INT (1 << 2)
>  
>  /* PIX PLL */
>  #define LOOPC_MIN 24
> @@ -136,6 +143,14 @@ int loongson_encoder_init(struct loongson_device *ldev, int index);
>  /* plane */
>  int loongson_plane_init(struct loongson_crtc *lcrtc);
>  
> +/* irq */
> +int loongson_irq_init(struct loongson_device *ldev);
> +int loongson_crtc_enable_vblank(struct drm_crtc *crtc);
> +void loongson_crtc_disable_vblank(struct drm_crtc *crtc);
> +irqreturn_t loongson_irq_handler(int irq, void *arg);
> +void loongson_irq_preinstall(struct drm_device *dev);
> +void loongson_irq_uninstall(struct drm_device *dev);
> +
>  /* i2c */
>  int loongson_dc_gpio_init(struct loongson_device *ldev);
>  
> diff --git a/drivers/gpu/drm/loongson/loongson_irq.c b/drivers/gpu/drm/loongson/loongson_irq.c
> new file mode 100644
> index 000000000000..d212e16f3c00
> --- /dev/null
> +++ b/drivers/gpu/drm/loongson/loongson_irq.c
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "loongson_drv.h"
> +#include <linux/pci.h>
> +
> +int loongson_irq_init(struct loongson_device *ldev)
> +{
> +	struct drm_device *dev;
> +	int ret, irq;
> +
> +	dev = ldev->dev;
> +	irq = dev->pdev->irq;
> +
> +	ret = drm_vblank_init(dev, ldev->num_crtc);
> +	if (ret) {
> +		dev_err(dev->dev, "Fatal error during vblank init: %d\n", ret);
> +		return ret;
> +	}
> +	DRM_INFO("drm vblank init finished\n");
> +
> +	ret = drm_irq_install(dev, irq);
> +	if (ret) {
> +		dev_err(dev->dev, "Fatal error during irq install: %d\n", ret);
> +		return ret;
> +	}
> +	DRM_INFO("loongson irq initialized\n");
> +
> +	return 0;
> +}
> +
> +int loongson_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct loongson_crtc *lcrtc = to_loongson_crtc(crtc);
> +	struct loongson_device *ldev = lcrtc->ldev;
> +	u32 reg_val;
> +
> +	if (lcrtc->crtc_id) {
> +		reg_val = ls7a_mm_rreg(ldev, FB_INT_REG);
> +		reg_val |= FB_VSYNC1_ENABLE;
> +		ls7a_mm_wreg(ldev, FB_INT_REG, reg_val);
> +	} else {
> +		reg_val = ls7a_mm_rreg(ldev, FB_INT_REG);
> +		reg_val |= FB_VSYNC0_ENABLE;
> +		ls7a_mm_wreg(ldev, FB_INT_REG, reg_val);
> +	}
> +
> +	return 0;
> +}
> +
> +void loongson_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct loongson_crtc *lcrtc = to_loongson_crtc(crtc);
> +	struct loongson_device *ldev = lcrtc->ldev;
> +	u32 reg_val;
> +
> +	if (lcrtc->crtc_id) {
> +		reg_val = ls7a_mm_rreg(ldev, FB_INT_REG);
> +		reg_val &= ~FB_VSYNC1_ENABLE;
> +		ls7a_mm_wreg(ldev, FB_INT_REG, reg_val);
> +	} else {
> +		reg_val = ls7a_mm_rreg(ldev, FB_INT_REG);
> +		reg_val &= ~FB_VSYNC0_ENABLE;
> +		ls7a_mm_wreg(ldev, FB_INT_REG, reg_val);
> +	}

More readable to pull the common code in one place:

	reg_val = ls7a_mm_rreg(ldev, FB_INT_REG);

	if (lcrtc->crtc_id)
		reg_val &= ~FB_VSYNC1_ENABLE;
	else
		reg_val &= ~FB_VSYNC0_ENABLE;

	ls7a_mm_wreg(ldev, FB_INT_REG, reg_val);


> +}
> +

regards,
dan carpenter

