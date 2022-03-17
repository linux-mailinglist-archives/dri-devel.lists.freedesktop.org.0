Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0B34DC0E5
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 09:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5AC10F01D;
	Thu, 17 Mar 2022 08:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C225810F018;
 Thu, 17 Mar 2022 08:21:57 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22H3XW03006895; 
 Thu, 17 Mar 2022 08:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=wkoXgq4FgmplemcLAbi1y6MUK8J6fjNwq3PSOh3vrVo=;
 b=SCntx/FAzVwlJnTg10xp/SXFBUU4pX4Nqq5PfEAT5rRAc7uoEIDuP1BRXERIwdic57jD
 BYeAktfmAgwrMDngtfKUGI6OQeU8EKxb41bG+K9hsDpyDdsBB0LyWemn86FoACBNbALU
 zFipgAA6+JdbOnRnJd7lkLdjY9+8ryUcUCPLKQuq2L/lKGgvTa2fI94gc4LsnlI1LVF9
 h7pL0KaHn9h24MS8vy3E9fAj/gTryDW4SZKr+ZJXCORQyLP8Lo5ZIxfTy4WVi0YTFQok
 x2iRLwhEbCmpEAjmLMPNXrPx8ThHmte/K7tf+DRAxCRamsOYiJuboBtqaWHPhuQaUVKh tg== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3et52q0j48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 08:21:53 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22H8GrD3195093;
 Thu, 17 Mar 2022 08:21:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
 by aserp3030.oracle.com with ESMTP id 3et64u1c0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 08:21:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2hihkimXf/A6NI6/GF1mv0H/29tgAnDGD6Q/kbQARMZJuXF8utv/Vf2MGw+LgCkpExRLFziyI106J05p+pKgegbTK4eGlYBWmpCVWFLDDewKI32Hya3j4EezbYLMupRaHtfHN5D2BzH6wJyvgLOGYtTCbpEjXH32fPyG4iNM4vU93QEe6XXex5DIzfc6mV294m/R3FgopgUjZ4lblIBG2WwlErSj26HsdpJrO8O9Caa32DnS3IBotQrvXadRH3Rhh8ncsvbxFgar5jrnONWBrnjgDAm2AmtbvD8LVxVj5qCBr7OaCfplxqGDEH/0f/1u9SN1xRO6MWDkhQtq4eB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wkoXgq4FgmplemcLAbi1y6MUK8J6fjNwq3PSOh3vrVo=;
 b=VD8e6s06F0Ak40hOGmiIshfmXyiS0mwob62y/fQAiE064gTyNbybB/dgePPN/HQkXpWoHDSNmINN9Da5Ff8uloioGkyDNJiyQwAHLAeXztKYQr5m3pE4aSuML2rq8kdFVzLcVGnpXWjgqUD3Q8LdeNWvz/wSTtgn25Sx1lgKxw23A1y9estZ7detpKh30Fwz8gnEMIYz4YOo/PpQcCAI9fyMZdWxiFJSHowdM1+t8EWvKahGR7b2bk2N2lJF70BCWXLowBwAk9Qz+5Xla1eYbpd97XhZCGuyIckt5GW2Z1MiQfToePu6zvmOJDiLjKrn2cRd1eJxPR1BBZqDLpNbRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wkoXgq4FgmplemcLAbi1y6MUK8J6fjNwq3PSOh3vrVo=;
 b=glGe5+/DbK3vgu5t1qArvUvS8oYdHS2NV9VuLwhdPGoJNmL5JA8+zIO5fBAa09IFlFWpPWazIMYyKxR5xGiMqbfVCe9uGTW0LOLXVTOmEgnDSS+z3vG/XqdRLdnPmrAPUyp/xItuY3VgBtncdnP0klsWXTP7kJZnXekUbKojXT0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB4606.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 08:21:50 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 08:21:49 +0000
Date: Thu, 17 Mar 2022 11:21:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Add a way to override processes comm/cmdline
Message-ID: <20220317082121.GH1841@kadam>
References: <20220317002950.193449-1-robdclark@gmail.com>
 <20220317002950.193449-4-robdclark@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317002950.193449-4-robdclark@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0062.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1a345d3-5a85-45c8-07e9-08da07ef2f37
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4606:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB46066CE122CEA1C2BA253A218E129@SJ0PR10MB4606.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fscGJE4+61Ng9QUACXrnroDMdE2i5gbkcrzlrqVTBeV5jbjyYrKzKsTk45JwAt2c/TzsTyRs+HI77HtNvM8kxa5GHEMafySSjzOl+eNtSlNOHKCTKH33bSnGtmBNH0iBt4kmp6sKztIVEq+wcBhfGbrlvW8D7zFa5vwuHwiq2OSQltKCWmtVls8bFeVneinYbznlPJpIgE4ml6pX+0BwIj4qw7x3AoR3olfcwfOWgIqPPIoS2FRvYR5RHXLnbEKGXudljWlFQxYUk5K00qRC0p6ltCkiRsoUzEMkS7Jqc92eQBad3wM53LolBSZFaIjiRCEExv+MVWQb2cWFNKBme5sTni3z/w25SshcV6AzLfYGvPjHTZSRtjwZeuBzKKxToVpVVmVLslFq07p9Y353RA+kKuqp5CozUZ1BEbpK+303/EBPNHBuUi+MpxYML7dfPyzYkVL4CzwWNVHG5/jy3bsqGlaSu0KQhzTM1+oj0MlJt/4OL/1TuB5Trw+JlwQaMjRRQ0ZOdKSc/hIQq4SgRaRfZZcGLuKDfeQHBFhf4g3HdaTBv0qzMEEATrLkpztcSQ/ihV9hoSknjd7dA+i/06seOBEfro4VcSdB/6Qd8zYyp44V7TCG+3YT9eAM5bIlwTDWid+8cXRg24ma91b9UpLAtpoeQoxqhSqet/tWpppglp/hPTC2Y6mNy2kaGznxDwV8O24uH1NSTLN5t02KBGhsZXbDMFQlyLKpu3jrK2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(5660300002)(83380400001)(33716001)(44832011)(7416002)(2906002)(316002)(54906003)(6916009)(4326008)(8676002)(66476007)(66556008)(508600001)(66946007)(9686003)(186003)(6512007)(86362001)(6486002)(6666004)(38100700002)(38350700002)(6506007)(52116002)(33656002)(1076003)(26005)(8936002)(43043002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t88ieubEVsywZNOgR51Fny20QwH2RbZcuMqIzktqJBqWdyTLIC2PBbBfQ+ps?=
 =?us-ascii?Q?88r+xaTfQyNa7/wxnhS/+aTa9fXVvyXzun2CAubF/U4cQgTXClJqj51udBUj?=
 =?us-ascii?Q?AK5mzmhiEQJH20t1W2f7Vii5EsAoi+MaB1gGd8nysKiEN+IfR+w/i9NaajIJ?=
 =?us-ascii?Q?iMBgviZOw0T7Yk2VMi0fZABINtVaPX60F0+CEs2GtnIO4PWWDOc9FC+ETJcB?=
 =?us-ascii?Q?gqsH+kpyg9B0wmVctMbETe5xPsP+kMX0nJr+p17cfJOexnP2nyswpWQBE9sq?=
 =?us-ascii?Q?3m4kJ92DEpvXZhkt3bE8VuK3O5CnnwDTXEYU8GdEnvoy6mIFvGa9J2Ypb5cw?=
 =?us-ascii?Q?2vGtz8vhC66Con8Y6bpntrXBzds+/PxazI66J5NRfsVS244FYcOmdKHSbWAf?=
 =?us-ascii?Q?F6fVDmq1UtvgGK807PU026zs369WDD5mj05dn7Gw0Q+6eVJJ7xpBM3BChnO+?=
 =?us-ascii?Q?V3Hn1QXC25eWb8U4P9/2ut82eyG/P6v1PHJx1DZaSLTYNkwORbpMREJiwE/C?=
 =?us-ascii?Q?keTwI1vK85u6b7igj0F+lh7mBRnsNJVcRICzq6VD5zc6zCk/Yi7k9aOMz4vL?=
 =?us-ascii?Q?h5K0O8nqlO4Uz3T1fpqq43wtcUOndxIb55DgxAhlWoKDBPwzB7ncwVEjEKjr?=
 =?us-ascii?Q?8lgTxP6onfIsja+tmS9uOpFJV+M9Gr+EyUAv7unqiV9F+lELW+0Z2Zqf0683?=
 =?us-ascii?Q?Q5sFmq1I9KC7toz38jM68tWvPt5PJZ0OBYv81IXThoZ4ffujJ4SVCZmillNk?=
 =?us-ascii?Q?USWL+ueychJhC7iwUQEqaf0XBVzdA9tGirw6WlTqbhFl87UgixoQJI4rVLBk?=
 =?us-ascii?Q?z7gz9N4I8cicoaXWxQjPTl9Pg2wN0Czfas2uCzIZ+rDfyKcysAe98UP4Kf9j?=
 =?us-ascii?Q?lwMJ/8Yj4mAU+0vYkMBthL1GOA0QvSEsAmaAHL+AnZW6qhX9LuUBSFy4W4M/?=
 =?us-ascii?Q?ieizGOs6MkX1OXdoauaYC2eYIT7iYs8ocF8i5y3S7ofeoBaceB8sD99zS61G?=
 =?us-ascii?Q?lOrChAorhRVUQHi+ak7BGTrsdh37YCbKPU5/vn0tHAWMI4Du86m8MVGHBojw?=
 =?us-ascii?Q?eOzToUn6uSat1RxykLSgIjJTJf+7OOFBVk6Et6OousGhzeRH4CpGSc2upXnB?=
 =?us-ascii?Q?w3yDsPLai+p4aIwbIv1efQr7sKBbD8d4SIBDMvmoYdmHo5TQJrBoluaXiqIb?=
 =?us-ascii?Q?k262xJU2MuoGRMqAyBgRbxQmFyuUjYYxmfa/7h8yvASzekvE8U3Q0LYvKv8r?=
 =?us-ascii?Q?C+e9z3lcbECbnn9XDBMQfVWRX7EDBysY/y6ViCOZHUIxDFJw+CXHTLa9L5JJ?=
 =?us-ascii?Q?2lfBA5lWIihMuVMJqpHdI7+IMe80znVC6LokD7fNYT23TKJsG8I4T/ezGnXi?=
 =?us-ascii?Q?o8XSEVQ6xlYT6JjmDWYVnAfis4qfZyuJGeH3/5M4wWRp1rzbWap4Y6oCiGf2?=
 =?us-ascii?Q?NceAlgQaSEXpWRL8LaTdCodM5JuOruzVT8xqVWJg94WseCtzLUllWw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a345d3-5a85-45c8-07e9-08da07ef2f37
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 08:21:49.8310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSpO6nKSR4pBsXjljHsD0BIF3+NS2wHe6UNPvtObUS7phPlgxcFrOT22X8WHBmXsNSd5/LIsa2z/S+Vf5Y6mip5Pjcieqpngc9PW4GGlxMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4606
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10288
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203170048
X-Proofpoint-GUID: nkV2Y2rcSmoHSPtoya4wq9GFaj2EqKDD
X-Proofpoint-ORIG-GUID: nkV2Y2rcSmoHSPtoya4wq9GFaj2EqKDD
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 16, 2022 at 05:29:45PM -0700, Rob Clark wrote:
>  	switch (param) {
> +	case MSM_PARAM_COMM:
> +	case MSM_PARAM_CMDLINE: {
> +		char *str, **paramp;
> +
> +		str = kmalloc(len + 1, GFP_KERNEL);

if (!str)
	return -ENOMEM;

> +		if (copy_from_user(str, u64_to_user_ptr(value), len)) {
> +			kfree(str);
> +			return -EFAULT;
> +		}
> +
> +		/* Ensure string is null terminated: */
> +		str[len] = '\0';
> +
> +		if (param == MSM_PARAM_COMM) {
> +			paramp = &ctx->comm;
> +		} else {
> +			paramp = &ctx->cmdline;
> +		}
> +
> +		kfree(*paramp);
> +		*paramp = str;
> +
> +		return 0;
> +	}
>  	case MSM_PARAM_SYSPROF:
>  		if (!capable(CAP_SYS_ADMIN))
>  			return -EPERM;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 4ec62b601adc..68f3f8ade76d 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -364,14 +364,21 @@ static void retire_submits(struct msm_gpu *gpu);
>  
>  static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
>  {
> +	struct msm_file_private *ctx = submit->queue->ctx;
>  	struct task_struct *task;
>  
> +	*comm = kstrdup(ctx->comm, GFP_KERNEL);
> +	*cmd  = kstrdup(ctx->cmdline, GFP_KERNEL);
> +
>  	task = get_pid_task(submit->pid, PIDTYPE_PID);
>  	if (!task)
>  		return;
>  
> -	*comm = kstrdup(task->comm, GFP_KERNEL);
> -	*cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
> +	if (!*comm)
> +		*comm = kstrdup(task->comm, GFP_KERNEL);

What?

If the first allocation failed, then this one is going to fail as well.
Just return -ENOMEM.  Or maybe this is meant to be checking for an empty
string?

> +
> +	if (!*cmd)
> +		*cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);

Same.

>  
>  	put_task_struct(task);
>  }

regards,
dan carpenter

