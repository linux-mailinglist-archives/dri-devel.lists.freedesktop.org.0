Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909D33DA05A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 11:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D100A6E0BC;
	Thu, 29 Jul 2021 09:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7BC26E0BC
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 09:38:45 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16T9bB8r022987; Thu, 29 Jul 2021 09:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=wAXkgSVuP0MrAIoMI1wRcAGGDil/SA1gyaXv/21xxz8=;
 b=YdXCG0iCAGWndRKpOIgGq9DRTOdN0Tw4nJ5muQltJGUbos9IZNI5lQSAqEEs9CRa0XMp
 O9uqSygPFkFOy4HxpxyQBbE2sYY4mrnWvZpYCflknJocb17SrAUmlAS6a22dgWRckTXh
 yyM7Apnuqs9Ck799YshgurknfXvxM5Uy5Eh6qkM8wKqUrnQjEUAfLlFShQLT1frNW1xL
 2n9j86hS3nnw7/Hddy3RGIDNwXwlsdcQd3kbtvFuDN1dNZbxCjlt9cfDhCwofFEEMK0x
 6MeGH0Tbhy3J4jqQygRTURgukpgsv0Rmrs31Nt2DZZnfWJXpf4ij0yojo9vKIGzVcbtL Gg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2020-01-29; bh=wAXkgSVuP0MrAIoMI1wRcAGGDil/SA1gyaXv/21xxz8=;
 b=qwZHuqiv7vGbkC3nePLm1DxOcvv9eQChSGjOVDwF615qyFTuGnWyRdwEIlq8LK5JpPZm
 7p/T/4TPtnCZnlzsYP8HFlPwjqkxOULUOkZhhNf9gOWJyNsnpWEA+j78KDYAOVBMCZ4w
 jk4NsLg6OW1zF2w4o4IuiX9jNWW0JM4sTe4URqjvSgTYH3pO/xM2gG24eDyRQPGteUwz
 JWBY0GliJpHkPpOoOyBOQAjde4IiUO73GyA3cpF2CIHrtLoPN6cHzcBrFBeOleIMxojC
 9sy2Jn402GNtVzkBn60UCzfVGlP04U3489cNUfz5BBxn5EmKMdthef9kgwkHRT5PWZnZ Mg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a2jkfd0c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Jul 2021 09:38:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16T9Vnkj095328;
 Thu, 29 Jul 2021 09:38:39 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by aserp3030.oracle.com with ESMTP id 3a234e5tnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Jul 2021 09:38:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJCWxoY4M7JWok/jYQp0aDwwHvqTaTKVqSZPbT8F2wdEd8rVPpoYP3b5/QEPNzCD53C08Rz0s96Wmopn7H33RW6GqUpT+TZL1bC5U7ml3HP0o0s5No7JaXZhB8qNgkvxxlZWv5+Pht8QGB7S6TpGzgxbwyxz2TM+pqc4T9ArZ3bT557hzEA0YLvD2ySfQ5jDES04vsXVre/2PE9ZmwodZBLnJurODO53MY1ibOdFy4pyQWrCLjmSZrSaglKeG52x74LHMzLtSdUZocWwA3zrZINQurw1p/Hng/isP/GWl6wNTkPbh+hYEGjprv87U4sZkczs/YBt2wH010tg6pg6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAXkgSVuP0MrAIoMI1wRcAGGDil/SA1gyaXv/21xxz8=;
 b=KY0KBFS/KKrBP5P+Z9HzBly8vqnZf0tze1Yd7mvqK1L6m/i6j4CT0LXJbdPLWZh4h8ZUMS/qXUFw8k3mLYbePpP6oeXNh08f7jOMVlz9zta/cDfIAEE1gLRj9uhvju7k9l6U3QvHxFPSiNonOiO5T9b32t6Y1Eg2F2ecVPFcXDDmGjBFnBO5EoKX8NUeQM4tOLdpIAJAz3Qt8tUWU+nOGDvnTASURAYhSy/qWc/W2lm7jXXlzCVG+ZU9cW3LA3TOTHstprxgwm7x8gVcfYKSqZqH/NA7neq/4d2jIpK7rc7Aaevgdu8YzC6+2vIcn45HogHzahk1p4WHPyCZ5msPUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wAXkgSVuP0MrAIoMI1wRcAGGDil/SA1gyaXv/21xxz8=;
 b=DfbJ5hXUe+4CcdtIuC/zQVEbxMwmtf8e67t4+lU9mRAbxg5Ek9/uzfBZZisR0jk2IOViokxsjp9ayvRgm7K3dZimsTBtqfhj5EbymT9BI2Y/JB5rICVbsWITaBxE9nvCLZoLOwjeKK1oAMvWWD3Svl2t4Dm1r2TPCChVPCeg9Rw=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1421.namprd10.prod.outlook.com
 (2603:10b6:300:24::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Thu, 29 Jul
 2021 09:38:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.032; Thu, 29 Jul 2021
 09:38:37 +0000
Date: Thu, 29 Jul 2021 12:38:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kbuild@lists.01.org, Jason Gunthorpe <jgg@nvidia.com>,
 David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 02/14] vfio/mbochs: Fix missing error unwind of
 mbochs_used_mbytes
Message-ID: <202107291357.SRO9xgCa-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0012.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::24)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by
 JN2P275CA0012.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Thu, 29 Jul 2021 09:38:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e89df7f8-380b-4ede-0ec5-08d95274a3e9
X-MS-TrafficTypeDiagnostic: MWHPR10MB1421:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1421C95BF69E37D157ADE80F8EEB9@MWHPR10MB1421.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:758;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SqLpiQYWVs0zWAb9dii81mdfVwsV6L37wbT75883r/YUbOEPXkShhVgdaIDvuNJuDJvswpex8I6aiT3ulpwHS+yHmp3A37OeXrh4gftu7LPjBM+DJp64idHpMVBjp5lgiJq2TwpzCn/XPLqaPO1eayBUr3TcT3u+UFFPjFpi8iiYktBpFvDYJhdWgYOGe3N7rgeq2yxWHUz/PQzqRzx39RzKubS7B22KMJDvXENMK7bwwL6NjPy6mOnqTzIQaS7PKGhxZPGD95pEQ24L3IFcp4k5NGsidOl7+4nfxq66jXdxnYF/kwrsok4qzgCBk2AfEzzFSH91FEa1Gx4LNBLNxCVJ7zAeltp5JHViTp5r1jy/s88HUTYFZjWaLO6T4Z0kdpO36h38mDP6liztEtUKYO5edPYYnsCaTmR+StNiGu9ZJhQhgWx8/klnKMz0u1krAJEWMb2Kwozji6xGt4boBQtFzw01ANkdt1ABrAq9woyxvyEiHZtMZQXi+gH9PzsKbl2Oc4+gc5xKqoshqnQOQBQL0V5qCzkHU4Dp4pVzQTI2G6ge/vdvoTRfsO5up+2F+SiQhTIO+oixB+Zal30qnJCy3cJAHip0u4aUpXvfffX4QuYAZQfND+TDNBtZX+zIlEZbC3+lO6S/nE19f1Vob4XyG5ENWjLD/LX1i6UYQbb43+eK9M8/cpcBNARU9TY8bV2D73w6hI47j+gu0ZMOAB21w3jDy8R8y6H/gfghhO0+GEujDtUS69XgEl52LklZlj9RTr3InUjrNPDypUjU+T4uMHmaLnZky6k8LEeqSp3x8KeAVcUw8exdcWChiA7ws1ekzib2/f9MPOC4N5d23eXjZWCkd1m0aGhDpU44fOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(366004)(376002)(39860400002)(136003)(956004)(36756003)(1076003)(478600001)(921005)(83380400001)(52116002)(6486002)(2906002)(26005)(316002)(44832011)(7416002)(9686003)(110136005)(186003)(6496006)(966005)(38100700002)(66476007)(66556008)(66946007)(6666004)(5660300002)(4326008)(8676002)(38350700002)(8936002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YBsUb0KuYAPB8NPYVUP2YqRbxJs96getQGIpbOGt5cnu57UYGEyGnJ04sFFs?=
 =?us-ascii?Q?TiOhPmBZ5xU3DkObET9ufxkz42VOydzDDi10gqQYAiiYAPtiRVy5ftLlf8Lg?=
 =?us-ascii?Q?yZlEEyl+O70+YQMKUbPM0HlfsmqVuA3QD7uCM0Qk+Db7V2HdAShFxnJOhQhM?=
 =?us-ascii?Q?kKPjkvus5qaMna3TqHI/wDC8LpAH/XsJ34r9vLMbm/c1Ki+pM/jmscenpCmw?=
 =?us-ascii?Q?n1QZP0EcefGUrw+2moXm5zkErYlH4lLcgTFgSfq7Yh1C4BwUBrl2uXmoCH2H?=
 =?us-ascii?Q?lXkTwrZ0cjfog2DLORe5HN+Y9Ao0rwJUqGxEPWn+UcH8K3w77DTEaSfbPDAy?=
 =?us-ascii?Q?oUHrWIhTkm1NJQFwJLhPZg8WWrwMU2U7leWj0WRJ623ts3kxQhJA4Myl+Kvs?=
 =?us-ascii?Q?84G6TTU4o4XinEmrS4LQlGo6maGnOpNtv6sm1+5Ats0eB1P6dIByen7SgDNK?=
 =?us-ascii?Q?mRx6yTF5CQemZfG54PAEI8YlOultbEkQL0K/0PD/5lEVjtzmok4uU63cW882?=
 =?us-ascii?Q?mSMQBnyH3EOBzBtSu75XyR/m4Gj81y4LhAq++4r4izmtgLtg8e7tXCOJ7nVQ?=
 =?us-ascii?Q?wm9iUfVygEshTUAxTteTWbisBJQydjzOKih/veATeDYPcyjFEURlDt7n7Nvn?=
 =?us-ascii?Q?kPP6pOKmKs0boyHfUidEI62heM2uQ8DzUTFuP2T1WTGE8yKPw+HuiRve4wEj?=
 =?us-ascii?Q?DyOu6wJ/AdFeaVtRq7VQvtFQHOvOl4u+JCJ4saadawPlU3O8PDiPupKD7vdQ?=
 =?us-ascii?Q?KB1VNGvJIuFO9spnI8t9Wm2W+zKcK4GNVQJlNviZ3oDomIqO5f1sXHWarbi5?=
 =?us-ascii?Q?3E4bht+w7F7Jl0Zs+gZ4XmNcGqz+WHxjUUdLqBvFi/4Ac5J1rDxpI1UtDqbZ?=
 =?us-ascii?Q?AYFzxjkB65HAHK4M9fvCrqfGLETePGzMv+FtVQ60pFgD45TX5urgJdBYiAy1?=
 =?us-ascii?Q?Rvk43gTnx/jjnrc2g89dJoRIxLKsiZe0RyJfmLroO+t0BxvoATqBoJynpfF1?=
 =?us-ascii?Q?sNv/j4LVSp7BkiqkGCEzo7iFxX/Ymyc9un7/N0/uc8gZ6oCYkQ2PhyUPGC1Y?=
 =?us-ascii?Q?SaPtR+LpGIU/l/2rvMXM4fqM6GsqtNqyggvSo6ECzRlWQnRuiww6jSvzvts/?=
 =?us-ascii?Q?YgSwbR7GM4GS26WsMs+i3hvKH+Hv85sM4dkhBorrC/d618l8tnE+2xAnbcj0?=
 =?us-ascii?Q?OX84l0ecJrSaiwUxB7voCI6/LNOncf+nkjpBG55uU5LyIr8GBCBxbc4GrTGS?=
 =?us-ascii?Q?zNblyaDSEzTnJHH4SLnCh+pyzLx7raUG5sSh7YjqiY/i4/vh7IWchHG1JHXi?=
 =?us-ascii?Q?rRLuJjb2t2S7rWogtKALuZ1R?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e89df7f8-380b-4ede-0ec5-08d95274a3e9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 09:38:37.4266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nnVa3mJodE0ixYobhBhFwimoVuQrx03+NYv3Ys8yrV8uIDtLP31lXTIt37lC7lJA1SulR+pAd7uK/L/dK068Lg25YtPdwViV/CrmBYVkjeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1421
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10059
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107290061
X-Proofpoint-GUID: jIEEfxaFFRTNiNDaA9eA3cwCXwz3Xj37
X-Proofpoint-ORIG-GUID: jIEEfxaFFRTNiNDaA9eA3cwCXwz3Xj37
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
Cc: kbuild-all@lists.01.org, lkp@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason,

url:    https://github.com/0day-ci/linux/commits/Jason-Gunthorpe/Provide-core-infrastructure-for-managing-open-release/20210729-085124
base:   https://github.com/awilliam/linux-vfio.git next
config: x86_64-randconfig-m001-20210728 (attached as .config)
compiler: gcc-10 (Ubuntu 10.3.0-1ubuntu1~20.04) 10.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
samples/vfio-mdev/mbochs.c:566 mbochs_probe() error: we previously assumed 'mdev_state' could be null (see line 524)
samples/vfio-mdev/mbochs.c:566 mbochs_probe() error: dereferencing freed memory 'mdev_state'

vim +/mdev_state +566 samples/vfio-mdev/mbochs.c

681c1615f89144 Jason Gunthorpe 2021-06-17  508  static int mbochs_probe(struct mdev_device *mdev)
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  509  {
909fe1e3ec15f4 Jason Gunthorpe 2021-07-28  510  	int avail_mbytes = atomic_read(&mbochs_avail_mbytes);
3d3a360e570616 Jason Gunthorpe 2021-04-06  511  	const struct mbochs_type *type =
3d3a360e570616 Jason Gunthorpe 2021-04-06  512  		&mbochs_types[mdev_get_type_group_id(mdev)];
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  513  	struct device *dev = mdev_dev(mdev);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  514  	struct mdev_state *mdev_state;
681c1615f89144 Jason Gunthorpe 2021-06-17  515  	int ret = -ENOMEM;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  516  
909fe1e3ec15f4 Jason Gunthorpe 2021-07-28  517  	do {
909fe1e3ec15f4 Jason Gunthorpe 2021-07-28  518  		if (avail_mbytes < type->mbytes)
909fe1e3ec15f4 Jason Gunthorpe 2021-07-28  519  			return -ENOSPC;
909fe1e3ec15f4 Jason Gunthorpe 2021-07-28  520  	} while (!atomic_try_cmpxchg(&mbochs_avail_mbytes, &avail_mbytes,
909fe1e3ec15f4 Jason Gunthorpe 2021-07-28  521  				     avail_mbytes - type->mbytes));
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  522  
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  523  	mdev_state = kzalloc(sizeof(struct mdev_state), GFP_KERNEL);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11 @524  	if (mdev_state == NULL)
909fe1e3ec15f4 Jason Gunthorpe 2021-07-28  525  		goto err_avail;

This goto leads to a NULL deref

681c1615f89144 Jason Gunthorpe 2021-06-17  526  	vfio_init_group_dev(&mdev_state->vdev, &mdev->dev, &mbochs_dev_ops);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  527  
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  528  	mdev_state->vconfig = kzalloc(MBOCHS_CONFIG_SPACE_SIZE, GFP_KERNEL);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  529  	if (mdev_state->vconfig == NULL)
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  530  		goto err_mem;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  531  
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  532  	mdev_state->memsize = type->mbytes * 1024 * 1024;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  533  	mdev_state->pagecount = mdev_state->memsize >> PAGE_SHIFT;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  534  	mdev_state->pages = kcalloc(mdev_state->pagecount,
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  535  				    sizeof(struct page *),
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  536  				    GFP_KERNEL);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  537  	if (!mdev_state->pages)
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  538  		goto err_mem;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  539  
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  540  	dev_info(dev, "%s: %s, %d MB, %ld pages\n", __func__,
3d3a360e570616 Jason Gunthorpe 2021-04-06  541  		 type->name, type->mbytes, mdev_state->pagecount);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  542  
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  543  	mutex_init(&mdev_state->ops_lock);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  544  	mdev_state->mdev = mdev;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  545  	INIT_LIST_HEAD(&mdev_state->dmabufs);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  546  	mdev_state->next_id = 1;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  547  
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  548  	mdev_state->type = type;
104c7405a64d93 Gerd Hoffmann   2018-09-21  549  	mdev_state->edid_regs.max_xres = type->max_x;
104c7405a64d93 Gerd Hoffmann   2018-09-21  550  	mdev_state->edid_regs.max_yres = type->max_y;
104c7405a64d93 Gerd Hoffmann   2018-09-21  551  	mdev_state->edid_regs.edid_offset = MBOCHS_EDID_BLOB_OFFSET;
104c7405a64d93 Gerd Hoffmann   2018-09-21  552  	mdev_state->edid_regs.edid_max_size = sizeof(mdev_state->edid_blob);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  553  	mbochs_create_config_space(mdev_state);
681c1615f89144 Jason Gunthorpe 2021-06-17  554  	mbochs_reset(mdev_state);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  555  
681c1615f89144 Jason Gunthorpe 2021-06-17  556  	ret = vfio_register_group_dev(&mdev_state->vdev);
681c1615f89144 Jason Gunthorpe 2021-06-17  557  	if (ret)
681c1615f89144 Jason Gunthorpe 2021-06-17  558  		goto err_mem;
681c1615f89144 Jason Gunthorpe 2021-06-17  559  	dev_set_drvdata(&mdev->dev, mdev_state);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  560  	return 0;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  561  err_mem:
909fe1e3ec15f4 Jason Gunthorpe 2021-07-28  562  	kfree(mdev_state->pages);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  563  	kfree(mdev_state->vconfig);
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  564  	kfree(mdev_state);
                                                              ^^^^^^^^^^
Freed

909fe1e3ec15f4 Jason Gunthorpe 2021-07-28  565  err_avail:
909fe1e3ec15f4 Jason Gunthorpe 2021-07-28 @566  	atomic_add(mdev_state->type->mbytes, &mbochs_avail_mbytes);
                                                                   ^^^^^^^^^^

This should just be:
	atomic_add(type->mbytes, &mbochs_avail_mbytes);

681c1615f89144 Jason Gunthorpe 2021-06-17  567  	return ret;
a5e6e6505f38f7 Gerd Hoffmann   2018-05-11  568  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

