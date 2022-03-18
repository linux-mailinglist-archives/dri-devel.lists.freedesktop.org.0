Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FE24DD528
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 08:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AD910E9BE;
	Fri, 18 Mar 2022 07:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A9889C09;
 Fri, 18 Mar 2022 07:19:17 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22I35DnG022983; 
 Fri, 18 Mar 2022 07:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=B9zVUBF9HZX/gVochmv6zsgzjtdhSG0fg0nkeeCJAls=;
 b=NBUQD09sSbVgHGYdWAYRILB3DPip7OB6x6UhS79smpODBJFf0ryNs/Q/y8jHS1P15tn3
 DI7R+/o85+cyq8Pq3kUBxC4JbkqSuWGdYtXVU5D/wqTS5NkBbtUyDzLWVwD3rxG8iQcx
 kGcWBG/zPhn3iUNcdOk5xsIbMxZeQAdZuxERWF6sutwWKREQ9j6WXBsvcOVIKEL0vCNn
 91QEpUMOMSSMTaJ7jQk5RXPmGgSPgECKBOABCIQmjC4q8SRFMJmPlQVGT+05VvGxkPeO
 BxhSiEVQvNPzvrsp+zwokosaZaO3f6nzxTviJKQID3PeYxER7IBdJRKqz+ZZMWZYrAFG 1g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80] (may
 be forged)) by mx0b-00069f02.pphosted.com with ESMTP id 3et5fubfr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 07:19:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22I7JCtu007199;
 Fri, 18 Mar 2022 07:19:12 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by userp3030.oracle.com with ESMTP id 3et65q4v1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 18 Mar 2022 07:19:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNTMewYtI/7O1qgz7wrFIWN66Wa7MA1q9pBExRoyY27qeWks1X5cILncU0MB4jZNlGKwV4K8wNlzYQt2L+vBtviC7tKH8h0mAJLZXkrIsbH0IKiIt1QqsHHkvP6q7bRs+4xSaQ87iweGehrfAo0XedwMKqzsfFDSHRlNK9/HhZl0UI+o7Ou+aHfviwd30h4AtqALGE0LzyUwo1xw7Kw15SdnNVjLDzX/I5iF4FZ2v/pS1Ksa9qf/OHckVjJ450pGJCPPN9Z/ZfprX2nn4P1aIKBbQbXqqVLDKYOqrvVntbIAAvw4wtk5tvAOXHqoQ00PGbRz1cG+1mAouLdKbksWUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9zVUBF9HZX/gVochmv6zsgzjtdhSG0fg0nkeeCJAls=;
 b=BhHvDDcIUp/IECAx7KLggrun600ll3ATOG6bCDdNB3lp01fFyh20VpNam2ySw4zks4JQBsmzrs8qvUHIdrciRfzOYc5PaAOtNOF2sNH57EYljDZz4SyxBWN77Bykd+wu1USRtz1ocbq9MicI/SCDM0T5u4Rwk/c7P8sdyj6Yf0f2CTcLwLhaky98K7dq1LvgOBMY2h6T3ROJ90qGn9lnpmmIDsdSf67hyXPbn7i9FvabIQ9bO8mYNPMrIsqrp6D6m4qkDkR32lOpGl/E6AET4xEZgBEus2MbFI6Zk1X3iBGIRpRRLMo7m4EoCDlrKTGqqJNR38bMawADoXn3sXMd5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9zVUBF9HZX/gVochmv6zsgzjtdhSG0fg0nkeeCJAls=;
 b=B0sECfWfyosDY1j4Z66ECvtqGfOsQCwl5yv/8czTfmDgfEGgoLSSUs3VXY3z5DwxJbEKJC9cHweuLdUmZgf9mnyAPvuI0e3Cn5C+BQvX37IP3TknqU+5L6dHUdPNJx64ueXk+vvYqlwDgSMQM+9THMqDN9Q/fVmBTP8zy6MZqpk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN6PR10MB2557.namprd10.prod.outlook.com
 (2603:10b6:805:3f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 07:19:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5081.017; Fri, 18 Mar 2022
 07:19:09 +0000
Date: Fri, 18 Mar 2022 10:18:43 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Add a way to override processes comm/cmdline
Message-ID: <20220318071843.GF336@kadam>
References: <20220317002950.193449-1-robdclark@gmail.com>
 <20220317002950.193449-4-robdclark@gmail.com>
 <20220317082121.GH1841@kadam>
 <CAF6AEGsnXz05fCnYAvFk+Hp-2z7N1kdVS0kYKn7+ejohLp8H7w@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGsnXz05fCnYAvFk+Hp-2z7N1kdVS0kYKn7+ejohLp8H7w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0035.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68640327-62f0-462f-bf6a-08da08af981b
X-MS-TrafficTypeDiagnostic: SN6PR10MB2557:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB2557ADF55B532F2E6ED2FBFF8E139@SN6PR10MB2557.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4sX1fCcExOqdjvqlj4KLAagZA5D9dmONrD4ZJncCAGITwXmI988x6wdmvMvB5NBozXY3xHLpvgYhQzVXjUL72reQLeDqf6RlhAdAjvu0ONWQgPltYYHSTZqTTtZdlZxxkTgpXGuaxlR0Z48dnB6jLA+MGnn7VGIxlUoL002sbuupdMyCmAgE+SRg+CZ2x3pWAGTyFNrCtb6WuthqvZ8LlszZ+JYOfHmGmzx/THYGAbaQuGYQjC9WiWCchogu4776v0E0tPDjFa7j40vttVo0NU/mppur2DAb2zkr1HiiY/aAwrgSI5WaBGGiNHOPHnvR5FMPuKyRC44EFGf3O29aLnQ6bSPUMqzUNctLOtzh6YrVNoBoE2dHI83jRLSmzbuDq+7b6KKM9XIkvXXOHl0Rf3N9MZPNS4YkVbCYbVZp3E+xkpdxHgt311H2MNz8N2FP9XqeR39SWuSXmErfcgeMu7d3EqQF3ofU0Sv9lXgPpL0oWrnLuoCb4gw3ZE4UgfgjLXrP7HMSvmvj7IYo/5+YiroBpe93lUN5C9DnEbfd1RCi7r636IlBQDu5ejh7OLUEM0LLvvGf8oSWg2lZBoR898Ye8SdE5+0rDa9cJtvMABQ2ePoqVWjGLJZyaeAPSwgqBZfHyACO5pJVCfetduMnUjL+MHkOlDStQa+/e3LcB9iXT2Z8K05nJJJa5t598hgXZC2v1qOu+YrlAS+It53jMN7SuoyqdOfEDI8xwM1OG6w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(66556008)(8676002)(4326008)(66476007)(38350700002)(66946007)(38100700002)(86362001)(508600001)(6512007)(9686003)(6486002)(52116002)(26005)(186003)(6506007)(54906003)(6666004)(33656002)(5660300002)(8936002)(7416002)(6916009)(83380400001)(33716001)(1076003)(2906002)(44832011)(316002)(43043002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mk6Vy05RP063Nbucax8Hspnf8xZd9ZE1+6pGudyMqA8dPjXMHjVNU96B+wU1?=
 =?us-ascii?Q?YthOWOut8FNWsvgpedb+CZknUlcTR0KrxYl2KWeJo+Px4Ru+GoqOEUrIOyYS?=
 =?us-ascii?Q?6MIo5wxlzpVIiwYyWKXGz9213QL/XeK97M31mLaaSKG0Ki7bNDhKztiNGxpL?=
 =?us-ascii?Q?vrHjKtS075ljY9vs2HMgXuIixpzUR7UPAM1sB+WQbX8cdSDHcl2DeaRWoHyW?=
 =?us-ascii?Q?T1qGuiGzeank3IHcMCDqGiP3XoBYowr+w4+G80tQvYvkleHFZlIpSGYMX7Hw?=
 =?us-ascii?Q?PCPXUCOozOtFOBgSnwEXlloOrWHnnz7AEJ7ubhj1xri43Q7UgfghAuullOtr?=
 =?us-ascii?Q?T21yq8grZYMEn7/Pl+ThCqziwlgRzEbUb1ysQwG0XP3Zwd5dmot2qCToFHlE?=
 =?us-ascii?Q?GOdehNEXrseZmZ0iny+jw1/USzboI9/dgLQnW6w9syKIn6P1MZcU5zNsXwiX?=
 =?us-ascii?Q?qpZNWJjih9tskXrjmo+FETZ5NT6+PdddLT2k6KgXTB799LUP59eczFy/soEG?=
 =?us-ascii?Q?kH7JHkRnAtXUJOeA5TRvErcJUNQuOYPeJW8dqjo1Z/RDFvfprWfXK7bMioLA?=
 =?us-ascii?Q?73hDLtGrjKCf5gzGimIruUPITwJImVIgt0WuApfXh0+BlVJb5QnDykOuspnR?=
 =?us-ascii?Q?cCYuP4Oda52fWYFJGBKOvOeCf6FvGljhHPT5BGZppJ++cbfKN0tDJfJxlmWC?=
 =?us-ascii?Q?8x+hTIrQ8JJZGQN/FRxDyNPQ5edyDyvHe1pYAxa4YSsTYlnnLWc/sbqmvgOQ?=
 =?us-ascii?Q?eg1R0/m7cHi2+tSMWb7TLODINienfbyYn3ZQVE/UDWOk+2x//nE1yck0iGXI?=
 =?us-ascii?Q?giN/aYpUdroD3UlmVUyC37QcKmlB5UYK5BunjxBNjY9zUho6EUfvx+xRvgFW?=
 =?us-ascii?Q?UqyiDvLWh0CcxFyVkF0W2J4s521IrvcI2deaAMgr9vMsfk2YKpX6qG9nis4z?=
 =?us-ascii?Q?Gy89baNWzADUr1B5MAtRa7hEoe2dTQ/b6M/5VrpeELf+tcTHf5jWgVM3jaOQ?=
 =?us-ascii?Q?BO1kRp1UDhDvZcE7sEjSBABAQFDvAglHPQKEuyXx0/oEyTWAQXsdmyuPBdl0?=
 =?us-ascii?Q?hm2gXfnu6G+c8xPX7Qgej+V6smjl7pkeEFAgmSCBxrybe0x/gKinTVJ3Hr1e?=
 =?us-ascii?Q?BNUR97dF9mQMmKjrRGr4balzv0+gxQclIrnMVsweI0acsvn0kE0OXi5D9kFU?=
 =?us-ascii?Q?O0/+RJfQfSSRhKy5g7wmKZu4GmQuKyYAtbTeCa9baMSbqBv2TesR4bXwbVoT?=
 =?us-ascii?Q?YStRseXYeS7kT1Cy9n8B0UOqXJNCe8DEgTEgOyXTdjdTrEFuyRCZ1A3TBwQk?=
 =?us-ascii?Q?cYyLyq0Dsbkr0hN1ZIAQxFksbyaqVH/D1bbUMozkA2M+gfBaMtqpwtCO60l5?=
 =?us-ascii?Q?pVgIdW+/AMG8+nJKQHO+xs3FOE+sbVwKVNgvLWItFvoJ6y69m/CoiDjF+00N?=
 =?us-ascii?Q?YulsoAqyEmF9c+XFj32bhDbqCbZ/elhlBS3Ugvb/hvn7oSIWLM3GMQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68640327-62f0-462f-bf6a-08da08af981b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 07:19:09.3725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7FJRo9pAcr/qdlboTgv7Xo5ovFTsd+1h1rSt9EKpF0JnOT9bZcR9S8lE62jSwk4Srupm98lK9oaJWUysZrXpuQ4gj6x847NGjeqDE9g09u0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2557
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10289
 signatures=693715
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203180038
X-Proofpoint-GUID: _tEbzoVsXhZ0NUFX8taug9UPdUHd0jav
X-Proofpoint-ORIG-GUID: _tEbzoVsXhZ0NUFX8taug9UPdUHd0jav
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 17, 2022 at 08:03:59AM -0700, Rob Clark wrote:
> > > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> > > index 4ec62b601adc..68f3f8ade76d 100644
> > > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > > @@ -364,14 +364,21 @@ static void retire_submits(struct msm_gpu *gpu);
> > >
> > >  static void get_comm_cmdline(struct msm_gem_submit *submit, char **comm, char **cmd)
> > >  {
> > > +     struct msm_file_private *ctx = submit->queue->ctx;
> > >       struct task_struct *task;
> > >
> > > +     *comm = kstrdup(ctx->comm, GFP_KERNEL);
> > > +     *cmd  = kstrdup(ctx->cmdline, GFP_KERNEL);
> > > +
> > >       task = get_pid_task(submit->pid, PIDTYPE_PID);
> > >       if (!task)
> > >               return;
> > >
> > > -     *comm = kstrdup(task->comm, GFP_KERNEL);
> > > -     *cmd = kstrdup_quotable_cmdline(task, GFP_KERNEL);
> > > +     if (!*comm)
> > > +             *comm = kstrdup(task->comm, GFP_KERNEL);
> >
> > What?
> >
> > If the first allocation failed, then this one is going to fail as well.
> > Just return -ENOMEM.  Or maybe this is meant to be checking for an empty
> > string?
> 
> fwiw, if ctx->comm is NULL, the kstrdup() will return NULL, so this
> isn't intended to deal with OoM, but the case that comm and/or cmdline
> is not overridden.

Ah, I should have thought about that.  Thanks!

regards,
dan carpenter

