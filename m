Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE4442EB36
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 10:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0EF16E22F;
	Fri, 15 Oct 2021 08:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9648E6E22F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 08:13:07 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19F7QB18022075; 
 Fri, 15 Oct 2021 08:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=wxmnGoK2g432q5CUQEn3gP/rv+sNag8GfYXR3FdlUU8=;
 b=UUCf+HGjDjQzeZknMbwRiRTiQUu0nqXbZYVTOJvPsi5d/EOMXk+DcV+xd0ICcjxaxq/5
 lQ9hgImYz3aoUuTxPQheoqugg8wxL8LjFL0S1qdsJrtX9sRBiLnX3YeXZk27dSkpLEvO
 zGw2LK5Tw3ViR3E12bIgJQGIxT/ObUZbBzjF+Xpux2MVkMromXtjSqGjxjew5II4xyg+
 D3PaZj2zz02wVmU9xtzz6QiV/gmWEEYUb2UAspwMhziusIuf7jwVlr+LbuyYFL/WxzmT
 bmDt7HpcWS+w0cps61fC5xI8NMDiYqYxeTIG2nQ5haw1OZqYvdVl5O2BvjxnfvUQAaun 3Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bpfvef7vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 08:13:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19F8BGY7045479;
 Fri, 15 Oct 2021 08:13:01 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
 by userp3030.oracle.com with ESMTP id 3bkyve3sp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Oct 2021 08:13:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXr0OHyrSYIHRneuwoEjihh1Z9OFRtHAY25Q2bZtopPHnRajciBnDTWiUBU/Wa7ZIVg8RQ6ScXLB/zjDDEeZTfPEgFPZHrt3juNViTzQXxWUd068sZtEdjIN/tRIBnQQiuVJheddAjpyVgdcghp+1klzxH2Fz7IOQ8Q1X82JCHDjMkzLRb6Sx967CHoFCPOtcMIW+nPGxVlQplBP1V7fGGtCYeIfuspyUxJzAzRi+3t5bSWDow24B5cF7/a3RRmDhq0UebcqWcDmyJc7SCg0UntFhp9jmguBRXbiF+VcyFxH+q9d1GQ1rWBCXzw+sGtIdjWjudRAI5Ait2EpiwWLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxmnGoK2g432q5CUQEn3gP/rv+sNag8GfYXR3FdlUU8=;
 b=ivi1KWZr0HF0WNSz/HrzvK+BH80i70lQt1XqfaArb2Gk/72rfK9HjY8GzcfFEucIsD3dkGkTeKuvUbc3Eb8zL1MyvhUmQ/Gb21t+W0mJ9nD+4gV0xmzDYfQnobdvj6F0KuWdHp3EhnKPF4mRI4PID9XJMDYAf1omKT9DlgB2mCqVOBtZODn2VUe/wWTCgb5QQil4FTbs0c0UvNS26wZ/1jOJWDmSUfmrifEBRRYqcxCJUOr8UUwpTH96tVyBmQKjiN7gd9MInytrlgZ0G6VeOPfbvM9qoHYT4Q0boVcqnaN2eqD9sYn/KzJJy/HxWpF3qSgNSTIi7On6PLL0wyAFiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxmnGoK2g432q5CUQEn3gP/rv+sNag8GfYXR3FdlUU8=;
 b=ClcerUPG+2jrb5PF1mJudHyB9fGi8FwrHuqiEmEBtbMZYO7MhpEqUeZLnPVHJPw0SkTczb+TlLypO0pilbq0i/LNnssXysADLGIRqaj2Jo9cQuGNWkgW9WED92hNThRd6lGllNKacokn3HDowtpx6T6tQcBD0Oix7ULgOck25wE=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4692.namprd10.prod.outlook.com
 (2603:10b6:303:99::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 08:12:58 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4608.016; Fri, 15 Oct 2021
 08:12:58 +0000
Date: Fri, 15 Oct 2021 11:12:41 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jessica Zhang <jesszhan@codeaurora.org>
Cc: seanpaul@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [bug report] drm/msm: dsi: Handle dual-channel for 6G as well
Message-ID: <20211015081241.GZ2083@kadam>
References: <20211001123115.GE2283@kili>
 <144b8ba5-82db-fc90-1d0f-5a8e2ce45c90@codeaurora.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <144b8ba5-82db-fc90-1d0f-5a8e2ce45c90@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0046.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JNAP275CA0046.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:4e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Fri, 15 Oct 2021 08:12:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efd73640-4630-4bf9-43f7-08d98fb398d5
X-MS-TrafficTypeDiagnostic: CO1PR10MB4692:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4692B4D6EE30F3A51FA56EF68EB99@CO1PR10MB4692.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:337;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9igEuUNGPF3m1vRo2esa/06/4Su6Dwn1f9uCqwk/Zg1UvdjcXoQFErjrvizItUBqy493yic0s7HOOnqc5xzz4P+ZOlGx/1RrTlBN1dpT4DXHo9II+n4lmxf47cqosw/EoD4tpoqOXemfWET1CMl4FdHV3kA1VX5deJQtuoWCRJ6EV/2g3qUNcY3MH8dz+jJmoSHPWUKOsHZJweKET8v+HH+HjIoZ/SH7jLi8IIT5RXp1co+Fv4/ncdP7D/rD8CVcoop0226nqoJFaauOsP9UmPoUmj8XO8BkYgIe2Q2AL08JJb2IdGNnCT4jmK/zh/F9Wz6NO0Ndz/IP3/GtnmUg2XRJ3BEgzU8yR5zJzECW+ECtRNS3gLPqkcBJ9eC05SU3ZNQkgz8DmI7Jiwy+52Hw6YKRdeqOuZWiVyF0vz5u7VIaQGJ7cmU+AHy6NW3gEa878nQR1O3KY7tVpRBQnpIDxJ6igNpbyCa48ZkNOJbV1mRxlQGxADL+wonw2TS9dBV+V5LlB9Ydrs3Eys227z/cKVnnQvqIm4amOfEBsMoVMoEsw9sg/xv/zC0nxquz8BpJCQnTUFbw+cBwm5ircjngQbSknlK3r+AIcEnWXiaYjzB+k35kSqZrsKoOFCHrIYlQ1bDgEq21JGf6idOrRzsTvEvEP7Rq6RJCKHmUPZJhEJoMfVtVnxVm/nVTW5unQk/be/KBiq1/HbTu0DK8+10m5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(956004)(38100700002)(6496006)(4326008)(9686003)(44832011)(53546011)(33656002)(2906002)(86362001)(8676002)(66476007)(66556008)(26005)(66946007)(1076003)(316002)(52116002)(5660300002)(55016002)(8936002)(508600001)(6916009)(9576002)(6666004)(186003)(83380400001)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gqvzxUN96o/F27BxznLzHpXMPtqplB2z6imLfTcMigndWCN2n0VJ4lH9SE0Y?=
 =?us-ascii?Q?tkSlqY7u2pqbMw0R5/VlxksTCQwtBjOSae064D/J+zBGqNahS1e7JaVa8loT?=
 =?us-ascii?Q?TCP8ti4A1g+4JR8EgHKZCXee+XHpAN+307tiV6lraY/tfuMW7Tp+GXoIlUdk?=
 =?us-ascii?Q?Yn5+lPc34VCZXgY2M6ZfieoUTHzmlVt3xVP+9fc46w6iYYkEPAUWZsx7ZoNs?=
 =?us-ascii?Q?G64JnAnEFgFA1wDrKndfKdogJt9p491cfmlpdz2LZlQKM9mLzoKhaI68PA5E?=
 =?us-ascii?Q?1pYDkd1g9vzu6tep6o5Icwq5E+g5kNpC6A89ZbbaaYfOH2x1ZFeAkofNi2QI?=
 =?us-ascii?Q?zA0C7Wu0mLy3H86wma1vAQyK5V0VHzp0A3ON+JAKFIXP26PQNuZqU/DMUmWn?=
 =?us-ascii?Q?DD6a+GPrRrvOiI6hPLpwc1qQ24V7ycOW2AbXbqzlg/8B4f/rHjOsg3T3nysF?=
 =?us-ascii?Q?t4JpwAdCMAS19SmWNTlbFwTEE/yoxLNB7lt5vU+6xL+EMCdiZ1q+jZUIgBAr?=
 =?us-ascii?Q?8VXpVOxhU4U8IxwIVmrXbjk2rISEc67DTjJdn9MA2xPovwl1jk6X0kAmIR+Y?=
 =?us-ascii?Q?aCD8tBUr7xx16810i8HLteOTzDhz5ZYfeAl+V18S+85iLu1luE6hALeCC0/o?=
 =?us-ascii?Q?b7VYHbC4Ee2uR/xEE/qYCCGnJhdoGJk7dtR9gpr2vlvZT1WpEiAGc4WFurcG?=
 =?us-ascii?Q?xmJ/2erouWm+mRJRHrsZNXsbHFEgDjNBXuS8yVjmG6ra8xYJi1WxCK0+yaCp?=
 =?us-ascii?Q?aD7bgAc5aMeJED/ho9ikCuPWhorTW4QI+4BrSOTUpajQoOh6tVoU2dgWErt8?=
 =?us-ascii?Q?v9hHrlhT0m9peb+frX2Rmc50E+XHjNEz9qn9o8sujXckDbd0Fx8EvhJyz0iY?=
 =?us-ascii?Q?O93RieX7udEJx96J3pANXBaNEZGmvehv2RT25QJtxk3YlzCWCYEzv1oTlhtv?=
 =?us-ascii?Q?PPsujBy7wf69P8sdNwNQU5Qb2LjRmdFHL+zQYkt9mKOzEqMxd+kUSXsnnVe9?=
 =?us-ascii?Q?DXQHNVNxTDmYXvcYTJmUx22qSt4IZ7Z7yU7JPDMPh2VNyKynk5/MPTFUOjjQ?=
 =?us-ascii?Q?0dGwGb8jhB4hsfT521hWoiuZQhDOwrrHN8CxMVYngqNPAPMoWLJzPc6YnMCL?=
 =?us-ascii?Q?5hSYuCXW6KRGukwOImXit1YWWTcdDKSBi4JzZpeVwxeLWfhezg3do7QOwZSU?=
 =?us-ascii?Q?hNcF2aeDk0N2YnLpBTl1k8q4hhzWD/yCtL69acZrQ/qjxN73E+Oyw52k6iR2?=
 =?us-ascii?Q?3/HxpHvaj7CnSdFeXhIH7ZPOxJ6tRUJTYi9Vy5ECy6E+7YK3ofYO1x4k/ohI?=
 =?us-ascii?Q?YjKrmlds1zK3Y8DyrGXqhDOS?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efd73640-4630-4bf9-43f7-08d98fb398d5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 08:12:57.8015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EZ/UCIsON4gafaPClVQTZkVr06Rp2PGNolJf9dIYEEfpTn+VJZ3mpOXJBrDG9H926GHts/h3rAtuQGXq3wTpGyIiiktKXEnVd81VZ6M7NU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4692
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10137
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110150052
X-Proofpoint-GUID: n-8QdxD6LhMOnzLhfBpRnM5R8Vp5x-bs
X-Proofpoint-ORIG-GUID: n-8QdxD6LhMOnzLhfBpRnM5R8Vp5x-bs
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

On Thu, Oct 14, 2021 at 06:43:22PM -0700, Jessica Zhang wrote:
> Hey Dan,
> 
> On 10/1/2021 5:31 AM, Dan Carpenter wrote:
> > Hello Sean Paul,
> > 
> > The patch a6bcddbc2ee1: "drm/msm: dsi: Handle dual-channel for 6G as
> > well" from Jul 25, 2018, leads to the following
> > Smatch static checker warning:
> > 
> > 	drivers/gpu/drm/msm/dsi/dsi_host.c:729 dsi_calc_clk_rate_6g()
> > 	warn: wrong type for 'msm_host->esc_clk_rate' (should be 'ulong')
> > 
> > drivers/gpu/drm/msm/dsi/dsi_host.c
> >      721 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> >      722 {
> >      723         if (!msm_host->mode) {
> >      724                 pr_err("%s: mode not set\n", __func__);
> >      725                 return -EINVAL;
> >      726         }
> >      727
> >      728         dsi_calc_pclk(msm_host, is_bonded_dsi);
> > --> 729         msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
> >                  ^^^^^^^^^^^^^^^^^^^^^^
> > I don't know why Smatch is suddenly warning about ancient msm code, but
> > clock rates should be unsigned long.  (I don't remember why).
> > 
> >      730         return 0;
> >      731 }
> 
> I'm unable to recreate the warning with Smatch. After running
> build_kernel_data.sh, I ran `<path to smatch>/smatch_scripts/kchecker
> drivers/gpu/drm/msm/dsi/dsi_host.c` and got the following output:
> 
> CHECK scripts/mod/empty.c
> CALL scripts/checksyscalls.sh
> CALL scripts/atomic/check-atomics.sh
> CHECK arch/arm64/kernel/vdso/vgettimeofday.c
> CC drivers/gpu/drm/msm/dsi/dsi_host.o
> CHECK drivers/gpu/drm/msm/dsi/dsi_host.c
> drivers/gpu/drm/msm/dsi/dsi_host.c:2380 msm_dsi_host_power_on() warn:
> missing error code 'ret'
> 
> Is there a specific .config you're using (that's not the default mainline
> defconfig)? If so, can you please share it?

Oh, sorry.  I never published this Smatch check.  It generates 236
warnings and I'm not sure the rules here about where clk has to be
unsigned long so I can't publish it...  I think someone told me that it
has to be unsigned long?

regards,
dan carpenter

