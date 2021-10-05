Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEDD421E91
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 08:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C80E6E20F;
	Tue,  5 Oct 2021 06:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866FE6E20F;
 Tue,  5 Oct 2021 06:01:04 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1954iu6d029416; 
 Tue, 5 Oct 2021 06:00:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=v99/2YgSryIO89iCPZA/wQsanSH8JYjYrvIoY1HiiJo=;
 b=dnonGWrlosZ+6KdpHQeCIT5sS03hq5Cjy4JPMezEbvbaXiK94SMupIBVelmxMU3Ego38
 2oFOLQO4MDBMOUGtG7H03FxYsCyw+F1B64zR5pnzPbnzyHK/klEGZ538Nn6hYjKk+KCB
 KnZAW0TvEW1X8TyHpsifT310dyMVwcXcytrcskC+/po1S/LtcKIQjSnivMQm7kyaP9o4
 zutoorGq9fM+smFiwfrXUmrnAuXWcxnJVCL8Gry4QMbTAhpHwNVC0R/ZdAFkVbrnJXyi
 plzeIjmxak3FTQ0z6mIxfz6Z+GtaZ9IACsYWXydG6vDHhhZzuRI5lLxfklVekKNIu/2p Pw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg42kmx8r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 06:00:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1955scdU158240;
 Tue, 5 Oct 2021 06:00:55 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2042.outbound.protection.outlook.com [104.47.57.42])
 by userp3020.oracle.com with ESMTP id 3bf16sgevm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 06:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUBcgmQYXyhVqpWCps9eibakzwGI5juBc5+pQTfXm8exSOLYi08Tz7WSJFFijSoIhBpOPXw2uYdHD9qgAH3MIOgqzGf8TJnaxR5AQ78bR7ZC+BtE9BfWssbxR/R3cTT979uwz/8oRl7ek5vmeJjskoygkIDkI2fFJZhy8xdVTHiz5UhJ/gB1VCgRVVKOSZ6OcM0poqEScAviOEsTmKOujJOvFn5cfYOokvjuBL5lzjjLaomjdsU69JFuKWCF+ZEbROgzjnGtoAErEaMOvkd3Biah8gk3GQtUZ5opCFA6LNzvj3Er8Ptd2DDXPIdak1ka6uW3KeWpiivAFmJGTBwrMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v99/2YgSryIO89iCPZA/wQsanSH8JYjYrvIoY1HiiJo=;
 b=USL3TTqET+eMXkxzCEeRHBplMCxO0XuppAafM3s3auDOax50jADTEnLl03D/GL/32j3lH04QyeZJjyxqOmigbtlJs34yRSyJ1mZWlmT7ezfw2tjFyXKWdT8nJjDuy4ZiYVqF4Ym1LeyDRgT9OBH0woMvoHrfwVQRyR3VwyE0KN26y6BUYxTCAhk3B45Al1WFZIJuCC22jA0VzWoL9W/17zCTYmRZ73MLKKKwHYTpS4so5CzKaSOEhI9nAe7O47I/Fqa4L/KhkFVNbUU4IG6A4YSK7q4lIUVIn5wc2ZJ8zNsQy7xipOBR2VCTJVk9ptmLZmE6MIaJpodvIXLKyEE6rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v99/2YgSryIO89iCPZA/wQsanSH8JYjYrvIoY1HiiJo=;
 b=GnZDcTsRJzd2KQFu2iQhRxxW6yeF2t3QbgZjx2yVmLCqNN6X40hj94puuNSy+NikaubbmklNOeiOGOlHZoagRhVSE+YJ4aVSa1SpFTsAtghjvjpmSMgLWBnjdWhkzCKulm8Sf8Nosf6X7Pv4S7W+rHByu7LHlgutmfW+wP62l8c=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2127.namprd10.prod.outlook.com
 (2603:10b6:301:33::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Tue, 5 Oct
 2021 06:00:53 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 06:00:53 +0000
Date: Tue, 5 Oct 2021 09:00:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Lee Jones <lee.jones@linaro.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/msm/disp: fix endian bug in debugfs code
Message-ID: <20211005060033.GV2048@kadam>
References: <20211004134721.GD11689@kili>
 <ab7f1f10-f366-40c1-436d-d7ebe15c7a9f@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab7f1f10-f366-40c1-436d-d7ebe15c7a9f@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0030.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0030.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:4d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Tue, 5 Oct 2021 06:00:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99e513a2-b873-4e8f-56b7-08d987c57d8c
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2127:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2127754BAD9F0B2C3CB021328EAF9@MWHPR1001MB2127.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ifL0xG6fQXQH9adzxOEiHlmQ0G16/Wy3/ZSA1yj/NFYa4zfDuuzh8JoBP1OI4YyKf2AVHiaTyFhq2ft7fVU1PdfsVX/ugqTOTwM63KNjLqEVEYUyOa+jpRLdQyvL6hrdYilZvGfWMRQuzfidWgNjCGe1NRd3io2G0ou5vFLKspkPiX/tyr+owm750rgtzNfJ6hecJhbrdafPt9as3UZs5b+008X5o1BuJiXPEByi0Hf3JEcLbI3IL6zibxOa+EdwPjmOw9ryjItwutF1GFucI3dpzTPh/S584P1oDdUTG0f3KenbqIVY2Fasf34GO08NVNTi3fiq86jLAuRIlj+gK6bOU8nMilR95nstmuhPGoJt1FymSrCHs4f1HfBOhJG9QpmdYoV4o/1r0iyln+EyEIToV1q2DJqK80JAEZ3wPqSVTze0cWE9XCYHjmVQw9eEvLY8G/87C8n/Q2n4AzBS9DnkaaloGSVu1P9IEkltYOaArAaYs+FucsQ7zGZAQDsLsDsg3zuRD85c6OLbK8uVkfAT76wivvwI6kZbPbHeDp4r6Vkn7U/oubpK9dF54a0oPaGyx4vB/1Wk2MeBrVsWfaM/rEhiS6uLKW+Fq90tMPCGCfPbGoj1qU+QkW11h39weTmYnC0mG94LokCEDKUpTmRiQMsKp3Aih6QCs4wH0HqTVgarI0pZ/QX9qHLicYl1+tJTFGKWs9m7GZCy06Edfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(9686003)(1076003)(956004)(38100700002)(86362001)(186003)(66556008)(55016002)(66476007)(4326008)(38350700002)(83380400001)(66946007)(8676002)(6916009)(6496006)(26005)(33656002)(7416002)(8936002)(508600001)(316002)(9576002)(6666004)(2906002)(44832011)(54906003)(52116002)(5660300002)(53546011)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IKcFhWsgTdIdsdX6d6JLM8oKgnXscpqg8jshfOUIE9E72ebkR2X3Qv2c5k/p?=
 =?us-ascii?Q?O8RmeZOcthhxR7vRdhoh7NitdRgDPzj5+JsFzXIsJmQhl/rUuft6BZSXyPpI?=
 =?us-ascii?Q?uYSxmG28qjvq8C1AVy4b0J/gz7U1BXcOzgef9KYuLpsyp14NOj1QQ2G0THaZ?=
 =?us-ascii?Q?C5WHMi4bFhSzjXGYrGUWrAgecCfsvToq4PXuR/G6M73D6VD4LK88t9gQAW83?=
 =?us-ascii?Q?+skxOFYj2IhaJhjtagU3Z1fNu4+lIrgFzPNWOKO8Q1ufC6HNYBhpy30wnzME?=
 =?us-ascii?Q?fav0mQNjy4YsNJJXsk2Bh2tO8THI1x1WvTpd8rlkNeoyeSTcj2j+xd/H6o1x?=
 =?us-ascii?Q?NzBKBMnMGqLC/AQkr9UOwPbtbQKm3KlGa3ZjvTVVp7xM0HZonY5o+jPRls4Q?=
 =?us-ascii?Q?osYy0V7b9WGq9LSN7YqpXhZ/OwqiySZNH4XDL4UFFV5+hp0j8Z7PcMqaRGIl?=
 =?us-ascii?Q?Th2xbKWgj1RamuHdVdGVaBK6730tEXn0OQTefzfGSXMX8qi0gA5qJ/Q+qU8W?=
 =?us-ascii?Q?WF6Fx77/kZK0xQpPYNWewSaVp6pf91Iq9nlRlD8SrhbkknNGl4tWWsF7LCVo?=
 =?us-ascii?Q?IZj9g5Uf/+ht1reD2Apgnn0D8QUQfmQrMeAmufKKFOtb68Rmo9j2S6IMNcBG?=
 =?us-ascii?Q?mD9MnS+WSmscSdOkBmQpjyzDQWQTCn8hqAcamGYU4s34nf17MzrnP9c9WkNx?=
 =?us-ascii?Q?BcQLPyjkbj01LISlEjUDw+gTuoxxbRAuHkkPV2CYyzfqhBfXkmKCUMzOTUCt?=
 =?us-ascii?Q?Z4HuHu7aOOwdvuYdnRCMOtQPIdOe7bSWyEcZiVCOWzxZjR3t408zvhEQCQZ9?=
 =?us-ascii?Q?vsnBk6oXdgoUwRzirHhkYk96YjIadzs21Kdz7xwx97L3hKQwfYicsxb9GpoG?=
 =?us-ascii?Q?xMFjpC+dpFYOt7UbETpUkChaxHUMB+xNF2Pcw5WYHyBO/3mfoXv6etK6F7kR?=
 =?us-ascii?Q?K1+LzeclxaINqS+DXJDLNT4LneRFfU0lb2XbKlxYh9ELanqDxyvrl6c4Tr9q?=
 =?us-ascii?Q?sACG1SAgIMexmbmXCDf0pY+9s9zwdli46ibxrBKAS9yio7YgVmRdBLjlJ4vA?=
 =?us-ascii?Q?z+KBnn1pkYdd96RxaLFzdwgvFkNQm4OLipPnz+dMHum0vkmSFnjAcSTWQ7EC?=
 =?us-ascii?Q?HtNs7CCL/R+UyAmJtzYIKQbYaohofTOoHSjLABl965h0xDhhSQxaN1KC24I/?=
 =?us-ascii?Q?lTdc4G3iLcMxKYv+DBBPVMVTWjZVpSoi3qEc/vU0gzh9y8byraSJ1S5WcnhZ?=
 =?us-ascii?Q?CCV7HyH0fTd2PUJUs2FjJ22j7Rzr0x//pZOnN5nmbFCYbeIzC+eP76HRAM0i?=
 =?us-ascii?Q?4csrcN1lIHXLWc7NdxUuGowJ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e513a2-b873-4e8f-56b7-08d987c57d8c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 06:00:53.6530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNY3kQwEfhWN4CUvlJmpqXRnTyL5dEZebQyuld93rxfOjncI8tKUP3V+E3UzJ3bV44c20IB4Jv8xBLhxI1f4drpGCjfDmJ4SqskEyc6IAcM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2127
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10127
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050032
X-Proofpoint-GUID: zBBtJy3Kooc3fAW0gbNDQqH90mP5uuOB
X-Proofpoint-ORIG-GUID: zBBtJy3Kooc3fAW0gbNDQqH90mP5uuOB
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

On Tue, Oct 05, 2021 at 02:31:12AM +0300, Dmitry Baryshkov wrote:
> On 04/10/2021 16:47, Dan Carpenter wrote:
> > The "vbif->features" is type unsigned long but the debugfs file
> > is treating it as a u32 type.  This will work in little endian
> > systems, but the correct thing is to change the debugfs to use
> > an unsigned long.
> > 
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > You might wonder why this code has so many casts.  It's required because
> > this data is const.  Which is fine because the file is read only.
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> > 
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > index 21d20373eb8b..e645a886e3c6 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
> > @@ -305,8 +305,8 @@ void dpu_debugfs_vbif_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
> >   		debugfs_vbif = debugfs_create_dir(vbif_name, entry);
> > -		debugfs_create_u32("features", 0600, debugfs_vbif,
> > -			(u32 *)&vbif->features);
> > +		debugfs_create_ulong("features", 0600, debugfs_vbif,
> > +				     (unsigned long *)&vbif->features);
> 
> As you are converting this to the ulong file, could you please also remove
> the now-unnecessary type cast?

I wanted to remove all the casting but they are required because of the
const.

regards,
dan carpenter

