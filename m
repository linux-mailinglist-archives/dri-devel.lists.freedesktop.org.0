Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4633D352E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 09:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669E16FA4B;
	Fri, 23 Jul 2021 07:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F136FA4B
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 07:23:13 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16N7D01E028031; Fri, 23 Jul 2021 07:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=wiXtC0X4uBDMPRbr2EsLYWXtO0Aa5kWq3L4ahSvqSEw=;
 b=WGJ4HUpOv4k95Z6ap76cz2+pKU5Hl5hO8hcV4tCVzPCO5J/1u3wIDqdmF0HjIBaR2zt2
 m3zISSOVCxKuJnXiDyVoRl00poCSiarAufsNsfAwXynclTzXJLG7ojJxNxPUJz5N0Zg9
 nVr7ExQPPpkmSqAFv1pjWj0DNmBA/Yhy9E7817qvbHFK31er8ykvmFI2IKpP6NsIv5EM
 90QNsrvrN/pCh3JfOvF85j/GgRE5IpCZk9Q+xDjI23kM2bBdanKVWXF48yrckX5B7WmT
 vGnua/3PVOosFISqlUJjRL28NquPjFeO8qtX637oxa/8008Y2OSgkUnBn7TKJWKjj6VZ MQ== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=wiXtC0X4uBDMPRbr2EsLYWXtO0Aa5kWq3L4ahSvqSEw=;
 b=j8JCGepCUSboEocOtffjYpBiiUEg9C5LCLe6XSgI4YwBIlTPioY3o1bKcw4b1Q+4VoIn
 8LYJoPdCaJUUtT2Z7F5ZtmgIRBqb/Tq/bN8vc83j3JG9DOYJvEN9YYVOscmBdeA0ducX
 e/JduVA6qE9RyM0aeJpKRn06BVs+dRJuqlTimOEUrieCeVFicejr2Jpynn7RZfOyTPOb
 Ee5ZnCGwXFeWQni7clPpJl57gTkrBhWzGRvhW9KSlRlD/NQNXK9pnyXfl+jmWWo3xmpD
 1ss2+rHj7gJVfDE4kAIOL8K3+/KZZrcAEHEuiFzKwqe21/YF+igp9IGYNQjYyttedQ0y Tw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39y04dtw4h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Jul 2021 07:23:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16N7FTBp151188;
 Fri, 23 Jul 2021 07:23:07 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
 by aserp3030.oracle.com with ESMTP id 39wunqedc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 23 Jul 2021 07:23:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEdsezmWct9gRwX5b7rhRtWA8iG5MWXe7HJrc5B8B4VhAgm58CwdUV6hMEePzZwdkndXQYLzwyEbydD7A9ZH5og2mdAV4uh4sTRmXP0gA124Y6zDL9ISRVIvgv7TucFad2kP3Ma7Q1HXwXt/pazZswjNq9VFTGiAKEontpBMfVUy6YQduSm8/PfK7KTxt5JfTENVKBL/YJJnojEz8ddM/833CnHm4iauNLULlb6qLx28FH4Rd7+/Zz0YVpboMfF1mgGNvIHG2+TdY2eagPd/KFgNygNluMY0pqhFKJyWuwYEgVNu3kIzhmzlpAPA9TegQq7hpxSQ5NGi15gd273Smg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiXtC0X4uBDMPRbr2EsLYWXtO0Aa5kWq3L4ahSvqSEw=;
 b=n6iw5QfPY63zCs5Ss2y8aXxy/8sOL2jnnYSr1yRfvTC+1oz5XX7Zp+a1twjzayIqG04j9ECMrzkd+CaRL6spLjFesfFnSt//koE8mM7A0I1H8i0dwWcTd3PimY23Gri2NxGVXEurqAKK6iyccAkAjUhF/0I2ahOfHlArEFLOhKGxwGX3oqmlwAWsVyHeHxPqrFcHEsJSIsdmoumFtCrOvKrDDOljTDcPfSPSOHYTa446GkMOOLjcJ5LKS8bOrJppu9nFXteV5BX4BQWgc/49AEiSdaREwsXiPjVkbav97gabdduXM5kFHbssPUA8b6nCOxZyD828a90N5mPeFEcCoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiXtC0X4uBDMPRbr2EsLYWXtO0Aa5kWq3L4ahSvqSEw=;
 b=qzJuVxDEBiDn6O4gXAqj8Qw7Qli7ghcqqPQquxH07caNCPlgTABSCu1YpGiKizGL79/lrSZq1YHny+A9b54vBX0wE8IicTOVk1y0aQUgpZbMxRnui76kRYoWQv5fFzTGdN+fJMkjjmfj9VsJhMPgw+9EDFCPL0jAk40MBausXfM=
Authentication-Results: loongson.cn; dkim=none (message not signed)
 header.d=none;loongson.cn; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1245.namprd10.prod.outlook.com
 (2603:10b6:301:9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 07:23:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4331.034; Fri, 23 Jul 2021
 07:23:06 +0000
Date: Fri, 23 Jul 2021 10:22:46 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: lichenyang <lichenyang@loongson.cn>
Subject: Re: [PATCH v3 1/3] drm/loongson: Add DRM Driver for Loongson 7A1000
 bridge chip
Message-ID: <20210723072246.GC1931@kadam>
References: <20210723031251.200686-1-lichenyang@loongson.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723031251.200686-1-lichenyang@loongson.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0066.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::10)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by
 JNAP275CA0066.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Fri, 23 Jul 2021 07:22:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96579f5d-b360-41f7-d69b-08d94daab6c2
X-MS-TrafficTypeDiagnostic: MWHPR10MB1245:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1245FE9F758A6559E73DE08D8EE59@MWHPR10MB1245.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sfs7u7ZYI9ZomqX/OfaKHbkFkKjMpluERvS0BOQqjAZqHZX4FzB36biMSCvM53VsP6hozXEdGqQE4dX7ZVFTTsBbvfipAsmWjKIpldapDbkY9aGrAqXCs6CSuagRAspRYWdUro+oYP3aw2eatNWtFb4HxgOgoX0onMqxZfSPy+KGBf/qL45VJlbd+IXv2QWQbpT00sQc9+izjkqv/9nYBat7zEKaGOcfqlL81zNPBruJ4bUuvBfNynM4TEM8AlqTQRP+gfcw8sst4FDQrAlyx0Fb3kTFMhQdqRLNJwRMN86cAZJY1ERGVYAa/ELhfOevC5e7sGzY096Ks1XV5acqQB0ltCMBqsTU6mqsOt00Zv5A/5p2JjORukl6yxu3l4cbvuoEqxazb3LwAKQmW/+3d6iMZSvw7yOPQF/c6ds2yBMCUH3fEPRRFOyI4AabvsC+8JalkGGCg+vHEwxm4kfhXZcjgwb32BL795sz7XEbyyh6bISvCtQgy/JHeOidZmFpTWef1GP61oxJ0/2xwHPNwXaAi56ujPoSXPzWUrdojJP3SN4Rw/Jltyag363y3xc3ifBcx73X3wBAieQpykTL3jBBBdCVwk6iC8U6VDEnok2J6Xan60T8xoHtCKAANoq8wI1LFWnlTWKMIVsyWdIQSHiycP4MVXi1RdwrOxaON/7GUf00inNjAuJtSagC/QahPObSCXcpJvwQIBq/lQBjnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(376002)(39860400002)(346002)(366004)(396003)(54906003)(316002)(2906002)(6666004)(38350700002)(4326008)(33716001)(9686003)(186003)(26005)(55016002)(1076003)(956004)(52116002)(478600001)(8676002)(6916009)(9576002)(5660300002)(8936002)(6496006)(66476007)(66946007)(33656002)(66556008)(44832011)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PrS/Ek8FPCCIKP2mkR1xNtHDMUST4iN7uvQnDl9zbTqDSAhMTdlsWnuf+ZKN?=
 =?us-ascii?Q?ULLKv+JA6rPXPWlpkEPEoehmJusSQFl3EjB69PklRxEqf97eeIIhOQOddpJ4?=
 =?us-ascii?Q?bV1Ue2ioNTcJOxwFoXF8cGWkutnkKYwx/DjndhqdK5mrbscz6LpezTMb+U0h?=
 =?us-ascii?Q?MF4KhlhI1muO1iKcBwdsLZCiNXAWaIZyMsyqA5Y0L0E0i+BMdj2KiTgjAnF/?=
 =?us-ascii?Q?DKbjiyidz17yHMF+2QH8oLTeYpf5LURhZn3OKfJZCqj62Vc6XE7oZrvoR+rF?=
 =?us-ascii?Q?zv81ahpnwmq3rrMs/G0IoLaQ24wvXTgTBt9MQfIyWKeU/ZZXMd8fb7at67xN?=
 =?us-ascii?Q?JYvplD2upzz0trqV3Bq3nByJcNJKP1v6FpIkDW7JlCOYSE5wjHFwHZYnDj3i?=
 =?us-ascii?Q?M0J4RQR8gsPSYpUDW7rTFsNtz3YDmpd/mWwBpjCQMQuMv8m6lKq3WIiCkf2P?=
 =?us-ascii?Q?MzHLetmhHg+ERzRuLdHmOhcRjFzLlE3B9jOTns7UJ5Q1tiZXgyuVYo2VBeEX?=
 =?us-ascii?Q?yBseQe8d+ZaKj6TOfuAdu4hDbTOGHcjoKK2yTjfg+inHwtEwqXTuE9DugwtE?=
 =?us-ascii?Q?r9AVrtCjfJqilFt11wMuvVZIRSr4iTKJQXu8mWuLQcEe8Rwv+u8MEIUl62WX?=
 =?us-ascii?Q?Us8z7LPG/ZyUVa42xjupA1wr2UQWQN+ir1asbI0YtZF3m5Pg2PHswoDKyHo3?=
 =?us-ascii?Q?hE8xBiwjzU9OF8AZpCWh/2TVbtFo+p+uOKeR+laOQrqJU1NGdaU2lJAr9Jkw?=
 =?us-ascii?Q?ujK4E2rzhfT606OU6gPWtISbYc6avGE5Mwp8q9a25XMp2UyK4cvIqUedz1+d?=
 =?us-ascii?Q?2Z1yalZ29NdPBQShyQyVtCnyOZNt7WrRhyZKNZlt5qJlCvtWOc4+NLt/URED?=
 =?us-ascii?Q?7lDaHRjwlp/zOjVV2UxvAwT9XtJ7AkH7W4kKYq3rfSqFJ95XW1C+eUMwVyqG?=
 =?us-ascii?Q?Tijr43vReKVstdl69cnp/c/2Ue2CrGf9+Fn0W4OPMumnB4tZT1VnCbbAXTVp?=
 =?us-ascii?Q?UQ0k2D3CH8Nc+FIJ2M6sl0S3YlkPXdU6cRKaBLuLLcR0OBb/gG2z9JylHl7S?=
 =?us-ascii?Q?oEI/isV9hR09kX4Ph4Pnsddd+Eq3moWeYNsmlVJ8Xcx7TuiI5jFYH3HNHES4?=
 =?us-ascii?Q?uEzdFe5/ZYWwubiXLPjFn4OFJQBH80PVrlOSOIXSS/LPjpaApNI105g/nfoT?=
 =?us-ascii?Q?MSdwKgq5hdn7PVnqyBme2IF09bWEpbx2j0OVxUsYoYdCSNq032t25rFqm/HH?=
 =?us-ascii?Q?Ngsrf0qNE8mKEB2IU4wzgyTAXLTVH5Lo0ClXNjk2NDXg0SgiPyGHOjkNJASA?=
 =?us-ascii?Q?yIf5Sm1/TsgU3Bf8Sk9sy5WQ?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96579f5d-b360-41f7-d69b-08d94daab6c2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 07:23:06.0474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gcDO7t9+Nj/fr7hcvmTViIofemfp+RhbStQBtifhCmTgvhMxvaKufOpl4GdAEHxoPUP+kHdjj+vqmeRwIrr4dVEsLHgBaTJWCTw2vXJ0Nh4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1245
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10053
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107230042
X-Proofpoint-GUID: Q2WSlAiM1SOQ14tduBwKA8HokzhdYYpt
X-Proofpoint-ORIG-GUID: Q2WSlAiM1SOQ14tduBwKA8HokzhdYYpt
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Huacai Chen <chenhuacai@kernel.org>, dri-devel@lists.freedesktop.org,
 devel@linuxdriverproject.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 11:12:49AM +0800, lichenyang wrote:
> +static int loongson_drm_load(struct drm_device *dev)
> +{
> +	struct loongson_device *ldev;
> +	int ret;
> +
> +	ldev = devm_kzalloc(dev->dev, sizeof(*ldev), GFP_KERNEL);
> +	if (!ldev)
> +		return -ENOMEM;
> +
> +	dev->dev_private = ldev;
> +	ldev->dev = dev;
> +
> +	ret = loongson_device_init(dev);
> +	if (ret)
> +		goto err;
> +
> +	ret = drmm_vram_helper_init(dev, ldev->vram_start, ldev->vram_size);
> +	if (ret) {
> +		drm_err(dev, "Error initializing vram %d\n", ret);
> +		goto err;
> +	}
> +
> +	drm_mode_config_init(dev);
> +	dev->mode_config.funcs = (void *)&loongson_mode_funcs;
> +	dev->mode_config.min_width = 1;
> +	dev->mode_config.min_height = 1;
> +	dev->mode_config.max_width = 4096;
> +	dev->mode_config.max_height = 4096;
> +	dev->mode_config.preferred_depth = 32;
> +	dev->mode_config.prefer_shadow = 1;
> +	dev->mode_config.fb_base = ldev->vram_start;
> +
> +	ret = loongson_modeset_init(ldev);
> +	if (ret) {
> +		drm_err(dev, "Fatal error during modeset init: %d\n", ret);
> +		goto err;
> +	}
> +
> +	drm_kms_helper_poll_init(dev);
> +	drm_mode_config_reset(dev);
> +
> +	return 0;
> +
> +err:
> +	kfree(ldev);


I'm sorry, in the earlier version I told you to add this kfree() but
this is devm_ allocated so the kfree() is wrong and will lead to a
double free.  My bad.  That's on me.

> +	drm_err(dev, "failed to initialize drm driver: %d\n", ret);
> +	return ret;
> +}

regards,
dan carpenter

