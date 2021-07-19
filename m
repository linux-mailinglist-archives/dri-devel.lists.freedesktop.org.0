Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8723CD591
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 15:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE306E094;
	Mon, 19 Jul 2021 13:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE3006E094
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 13:14:21 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16JDCQvL012123; Mon, 19 Jul 2021 13:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=mXMDrnBwgb+MUdEOGNzwfYmUZGro/UjwwVlwHG+TNCc=;
 b=ag2mZQZ/zBbasic9hPT4yAwGVuC3X09slSUjCW8DORiqsMGkkpLdgvSyNg40LaKGcJaB
 AxJjLhI5zg0i3KeHlsMOxBsWYnvebgwvrfxqkrrZKU8J9GNhuaEqu60uk51IVRWS4vHC
 LCVOOtf3FZ87P2GvuB7bRDb9zsQ3/5gQf7C1D0AVP5uL95NkIKAS5YV9Sl15cpCYSRTS
 J+/EJlnMx4Oc5vmkG6yS5N9wMRcyaWTubfIIX4eIQD0BpHaEpWWIYp1Jc/Bg+hVctSpn
 IPoiFu4DFOxCyRmffkKbk9SuevS/h5ktw3l8a/Q8C3KlNbnzKiJt63Kd1w4lW5xQwqCx sQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=mXMDrnBwgb+MUdEOGNzwfYmUZGro/UjwwVlwHG+TNCc=;
 b=ARCSmvUMSSZL16rbqDpXTGepP69y14e3Ei5hOL8jziA/KtbjeRY9DTuXNKmsoizHIFVH
 8fkyv+FhRnvoK2UKUk/dJN3wW9TI/acfotVggf6hQlK1jMOIe7lkwyE/Ks2SugKrEfPe
 ZiwC79ModkuUsFg8FQNjMk9RS1uHTlsNGtB+IVQHyoHOudoBhOkgeZcnZ565h6T6tDE0
 +//msYy5LWS0VzslBInQxVEScN3xOuLyXPwB6quoU8y1hx9U7rROYojw7HgTGTlgFzTn
 a22HCegHzhpT4YWVHjODcINwXYchV5E/NPPCMNNpVyBrI5pFWs2w+iknUkx+weo1XeAu gQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39vpkwsfqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 13:14:17 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16JD6DGA031683;
 Mon, 19 Jul 2021 13:14:16 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by userp3020.oracle.com with ESMTP id 39v8ysq4jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Jul 2021 13:14:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xa9XthMoQRGUk6iQIGALNqiIFGiRAX5HNYx0rxGwWEzOSD9Wy+B78g5ZoHGbUfx1nJm5/r5xahykubdOrLjWlOxjdsY0Hwj6i6VDid0DRyltndzPQDUiPuBuCrCpSXXBclT3MrnQQRlNgN0Pm+rDP4/QsHd7Y4Fqrl/qSTnaITGGxhzM1PgHeYzzNRV9hJSAxaTOLpfsgCuNIawo8t6milo0kIzfQ+8zSjOpkxndUE1MjcWg9Yt0n66cL/7DET93LEMmvwvAx7xTyX4K+cPA8Gj+mvyBR5e2Dw10OVIKMWsK9c1CZPZ885qyLysqYFo4mWSlD7GwyKrAhENYsr6b5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXMDrnBwgb+MUdEOGNzwfYmUZGro/UjwwVlwHG+TNCc=;
 b=M5d2a0t6teJ4VESAWAc+eRvhdBQVJaDVo9202Yp2Lk84uzmf/8NOHNL+ja0nqGG3LyZxJ9oPbeA9TcjWsYEHGJkS2XumHbybrP/9qRc6oROm9CuG6Ui+ywQedJ9mQKuVkZKwuHtTt716bi3NzN9v4poQ+shXqfkUs6CcjACkzUSEuObWCS8uWx2LZI6KLemJUv9ociu1Ap5noy4k25LquXbmLp+KezHV+DKKhhscUiAopvUiiy1DlCOiBKq3shilS2W6fKn49KyDosZ2Vh2TxpfUFQv7EFbJ7UyhKD2wXNrD7KaqDp4nvRjnH+1GGIaa0/lM61CzFEZa7LpjJnQd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXMDrnBwgb+MUdEOGNzwfYmUZGro/UjwwVlwHG+TNCc=;
 b=NmT6t8gntFIRrEtJL49r+YFbM6RUkoDWyt0Ew9UYTVW5nFhhk52gvmluW7aZl8+5VtRdv03K7t41yGPduDYqYSM389QXm3UgAzgvD4F1AAhUJEF2n5d/8jp3DUoCL9YLAFihAg7MaaEYaulfKYRaypGfurjurwCEr+d73lfiUoc=
Authentication-Results: loongson.cn; dkim=none (message not signed)
 header.d=none;loongson.cn; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4738.namprd10.prod.outlook.com
 (2603:10b6:303:93::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 13:14:14 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 13:14:14 +0000
Date: Mon, 19 Jul 2021 16:13:52 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: lichenyang <lichenyang@loongson.cn>
Subject: Re: [PATCH v2 1/3] drm/loongson: Add DRM Driver for Loongson 7A1000
 bridge chip
Message-ID: <20210719131352.GU1931@kadam>
References: <20210715015809.107821-1-lichenyang@loongson.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715015809.107821-1-lichenyang@loongson.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0040.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::28)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by
 JN2P275CA0040.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 13:14:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d823f2a-822e-48bc-872f-08d94ab71aed
X-MS-TrafficTypeDiagnostic: CO1PR10MB4738:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB473863E23F6A064D863517438EE19@CO1PR10MB4738.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1122;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TdyKJBHKC1rENB8mWBy1RzorMRLU2tEPsku+7QFP+RnYqKurLms1mDweQmnrfPMhODTqfXpb6MhwQC9+XCjNUlsoKr1nqw58CVNtzAFYOZc0NhZgW1AXkEd4QLGEKg9Qv7PrGEWvxgsghdMBEn9vRyFJj0rYxnZCDI0Y+a/XNwW9uNebA+Z3c2AsUCThjhfT4hTyISA4Q1SRxm7IlwbhfeL8/2EvJWJ4LLXFCLvwyZX93QfCz3/RmhbHBtr3A8wHJd9UPtlXGg7jdhN89oPs52Xhs9BIZge+JaIl1BwowQ9aNi5ihSgu8OGwdxHUrLvPpPJ6It37jxjZyocNUBTZSw4Gwph+kbUhWOi2t1uuEoxB9qO2lu0HOimj4tFStXqTqfJIHThZ8FYsdftQmEGVAjBA6hpf5cX/vBIw1f3vE78THkoJNd9AYQx/VdHa2tSB/kghgY2g6cJxCf4nV8kmudCnPfkWKsU2WFvrk/mNgvhzEM5J1dOPr99u3Ptp3kxFHC1K6G+wx81G3O/Ulh1TK2DeidSqLHPecvVA15m/UewCW3+vpB8t/cMY3B61vN1RcUvcHl430za9lKHhpzJQeJOVF1qQG1SP+JkitefdsEwe9b7UunAP+HYCDEK/tm3qOlCx99jwpMfbcZH90EvaQ3/Qs0r9GCEji85zzLKLnD/sMtHiwL0Bh0ZTzxwwCSRkdgie06Zscz4uYg06ujiBmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(366004)(396003)(346002)(376002)(186003)(4326008)(55016002)(44832011)(478600001)(86362001)(26005)(38350700002)(38100700002)(33656002)(6496006)(6916009)(6666004)(54906003)(8676002)(956004)(316002)(8936002)(5660300002)(9576002)(9686003)(52116002)(1076003)(2906002)(66476007)(66946007)(33716001)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?83mBOpWhPqspklr6cj0092HkjEjTNSG48cuiMgErLMx31o3zdDWgEHJ/Pd55?=
 =?us-ascii?Q?DiW7wkj9zvY0cxeCShnxD5L2KyeGbEVCUJiotbamrwFg9Fkzr4voQOyTDQ9s?=
 =?us-ascii?Q?ruHOkdqHPDw412cHd3coIw2vNTDSbNagSloe0pFJ2aMogV0+a+ik5wwJDlrX?=
 =?us-ascii?Q?xycg8TkkGPst6o1OFcIs8pYKTKSsCoxsuphV4LNwBBkXopCIDcg23YZKs0Ye?=
 =?us-ascii?Q?WtoGAGCAvfaYhhOMPT+c59gMs96W+cJmzm00LvUfQlb3CFuAq/h4mvSiHyjI?=
 =?us-ascii?Q?uvyXrEmWZtjuhS+NUyvp130FjRMzYSBmCc/XkhMkX4CNkQkEgYMLpRO2SmH/?=
 =?us-ascii?Q?ADbRTz2IJVHsK8w7Lwq+epT000T1j85extyfte7+l3alHRyESQUvxlpn38Er?=
 =?us-ascii?Q?du7rg+fhHdAOInDVCxxkx5gsrcrXypEFqrBvWCUrwKwHn3fgb+1kDQO6uWnw?=
 =?us-ascii?Q?pUMjalgocxXCZjswJPnS11rfQYA0HMse8bcEAZyq0ze3TZGSEccp+trkb2n2?=
 =?us-ascii?Q?fphD2DooUjZ2kuJJo/mce76G1c0hVTf+jm8bVLnq2LnWuRpBcQfBJOfUqsLh?=
 =?us-ascii?Q?Azwr+Ax7ZV7JQpbwQeRJ7LDrykNkZl37aNH1ryWTBetHNF4NoXfAqGwUhR0K?=
 =?us-ascii?Q?VlhRdfWWuebweVvNtlSznOnZBTfan+Bw05gE9joFDLaZ0R7vqC+DfZXgGnW5?=
 =?us-ascii?Q?pGx8aNKrossstj27c3MUP4gaSE4df8vOyKXrvGNRjtozhORU8+jblNRhNaDJ?=
 =?us-ascii?Q?vO6jxUwu3ltlHp2kFTpX4Jdacwc9HbZb4e0B1uNGht1guzwULVWNFXJq0SIS?=
 =?us-ascii?Q?MwUqq2+zGDHhWfX6j7YHYeqIS20KcgMDTdBsIAse0r18Yndzfcp2w8gauJnp?=
 =?us-ascii?Q?wI1o+CbYKBIM0yQhtcRiXDKxMJDk/tjnghoJdMx1l9E5NO2qaBQ0t1ONO+VP?=
 =?us-ascii?Q?MXQTCx1c3Q9PSKLa41BFjdTZjkoVCj4H/ysp6IwWYymJF10lvCFgaUHoOzuE?=
 =?us-ascii?Q?cOJPZ41FQXZtaTWw6YndBpdSF/oJxmqkcT0jLWXnXik+lca5wCa46qQInEbw?=
 =?us-ascii?Q?T344fQN2LZtpERURRTirlGbvmrXqJwZ13aYGtW66I9IwepBdEmL6HneJj8wV?=
 =?us-ascii?Q?K5bm9NFLKnHxUW6dbkSeIiCz10RZxMnNDewAy0cKhRgq/WGKyunqwLwOfTRP?=
 =?us-ascii?Q?oaU//dW+wRwvSY5/xD2bU64EB3qVhpvHW81DRhUqsDlulK/q043DGKHEScTY?=
 =?us-ascii?Q?Oj7rwrQF3wbbrRjZ00g6XxGj0zo6pY3ht5clLW3EX/jBkAsAmuPYC7grbxKo?=
 =?us-ascii?Q?zZlq3mYiOKtPtxgqDnbe8acn?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d823f2a-822e-48bc-872f-08d94ab71aed
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 13:14:14.6787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6sBADYX+UbJz9FO/dbbuCUt9MdfTDHeqpxz2FdRs+ooHzPZf8pWuJJJUNRdwkBEQueNkxxQJ1WKL+0Gp5HNS0COL+5yi3ImzPIIvqhYQ5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4738
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10049
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107190076
X-Proofpoint-ORIG-GUID: cgTw4jc3YBFVSKz5_6tEUC3_kRMNqu8l
X-Proofpoint-GUID: cgTw4jc3YBFVSKz5_6tEUC3_kRMNqu8l
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

On Thu, Jul 15, 2021 at 09:58:07AM +0800, lichenyang wrote:
> +int loongson_crtc_init(struct loongson_device *ldev, int index)
> +{
> +	struct loongson_crtc *lcrtc;
> +	u32 ret;

This should be "int ret;"

> +
> +	lcrtc = kzalloc(sizeof(struct loongson_crtc), GFP_KERNEL);
> +	if (lcrtc == NULL)
> +		return -1;
> +
> +	lcrtc->ldev = ldev;
> +	lcrtc->reg_offset = index * REG_OFFSET;
> +	lcrtc->cfg_reg = CFG_RESET;
> +	lcrtc->crtc_id = index;
> +
> +	ret = loongson_plane_init(lcrtc);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_crtc_init_with_planes(ldev->dev, &lcrtc->base, lcrtc->plane,
> +					NULL, &loongson_crtc_funcs, NULL);
> +	if (ret) {
> +		DRM_ERROR("failed to init crtc %d\n", index);
> +		drm_plane_cleanup(lcrtc->plane);
> +		return ret;
> +	}
> +
> +	drm_crtc_helper_add(&lcrtc->base, &loongson_crtc_helper_funcs);
> +
> +	ldev->mode_info[index].crtc = lcrtc;
> +
> +	return 0;
> +}

[ snip ]

> +int loongson_modeset_init(struct loongson_device *ldev)
> +{
> +	struct drm_encoder *encoder;
> +	struct drm_connector *connector;
> +	int i;
> +	u32 ret;


Same.


> +
> +	ldev->dev->mode_config.allow_fb_modifiers = true;

regards,
dan carpenter
