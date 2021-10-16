Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1730B4304CC
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 21:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 382806E4A1;
	Sat, 16 Oct 2021 19:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D396E4A1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 19:35:54 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19GGYCt6011778; 
 Sat, 16 Oct 2021 19:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=8HnDcriX97/oN8tkLHkWDvBJxcl+0HykSL2aM4xCB6Y=;
 b=A5XfYGUlL+0MNb4lNWFqGe3ukSYxWt3m3oGfpXUydsxi8ednxGMskkRExjJidbJZ8zuO
 n9Fxxnl0fB3y9oQjyLdChd4JDejyl0L91K7GpmLRd6LVG6/RiMq6nYsHsyKN34VtOfgM
 6p3Ej3IHMzudyIXbUn2fFuCfA40+VJ1Uu9I4fJItIeHSHa4ZiiHNy8Q/Up7AxDB+JKjq
 w4kh7X8krU+FPUvjtIVkWtCKDN3MEIYkk0ImedABpP5rv+Z+0wN5xN2dtW1H8dylujPf
 eibTqdaOJ07etSXQVgKcIfU+jhUactyIJYSyptjTfpzTm5ikUhE2C02gWDL9is37N/G4 WQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bqqm498ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Oct 2021 19:35:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19GJUdWm155867;
 Sat, 16 Oct 2021 19:35:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by aserp3030.oracle.com with ESMTP id 3bqmsbck08-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Oct 2021 19:35:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1WJAyomWJyMx+mq5uKljd+jCo5tHOdm5dirT2Kk2f2vH6so2eVybc+TBlmtD4LZubzGeKVyx8PTw8HrGqzbXWrYbb/QZjknngnYd4dDb2DB1Mz2mVrQPg3xml6mZn2aFbIYHhI/wOLM/fcvKSX9R5Fbe+dPjkpxH5AlRMIZlAwV53TlYacIg5wvnVowt7/CgF1pEnpFMc3xbAFDMlYEAe5o4SZ8QjiUpYTuml6sbt0Tdb/MSPiYINjVc4EBlQswGB5SsgiCYXSKbPEP+IubMoEmTN7jkfA2YbmyZeT6ynExT7ErnFNX9rvJo/6HtFsnT6lavEmcFi4YrpDAMVcwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HnDcriX97/oN8tkLHkWDvBJxcl+0HykSL2aM4xCB6Y=;
 b=c/jZ3rytXLPULPUt/EQw3S9QDT81Z9k/z1JjeBlJPd5CBfAyoVwdlZ5IrWqGgr0V0JRatwDmpZGKi3reDRF1n/2MERDjV6RCI9y4XPfeXgG7/E5JPTJGK2JCQXeuRlU1xOmM5Tb+WuYDxmCbCRqVKBXz89AzuyANzMZ8p/ZrOcw4l3+JxiSThznd0wJ16AedrSufzwUy1SDetoULLXpPJOc66gwUM2ttZGpfaDHG7BR619l9TarYrwXgvVAGrS9CTmk6I3FPG9QVSl0p3MX6IB71rPxGr7kDHWjqJMe2klpcrwI/4MPX/+XKtGsQKxq4L3OuhY+gLLIt+nySmuYcDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HnDcriX97/oN8tkLHkWDvBJxcl+0HykSL2aM4xCB6Y=;
 b=VSO10tcbuGkp70a+iah3+ckPDUpvM2zPWYJqvdT9RHOUWQllOGzpy9e6BwzGWcWV/qlcnhPSg3g2WEjZYHBL/TuYW40j7n/nhun05BaUVSEY5/Gyasx16Aa9WzEl91oxqPKLWj4q1mR8Z5VJou1OuELzKsHcITEnH7HKTrjXgc8=
Authentication-Results: quicinc.com; dkim=none (message not signed)
 header.d=none;quicinc.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4466.namprd10.prod.outlook.com
 (2603:10b6:303:9b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Sat, 16 Oct
 2021 19:35:48 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4608.018; Sat, 16 Oct 2021
 19:35:48 +0000
Date: Sat, 16 Oct 2021 22:35:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <jesszhan@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>
Subject: Re: [bug report] drm/msm: dsi: Handle dual-channel for 6G as well
Message-ID: <20211016193515.GA2083@kadam>
References: <20211001123115.GE2283@kili>
 <144b8ba5-82db-fc90-1d0f-5a8e2ce45c90@codeaurora.org>
 <CAA8EJpoDfWRT48J=G5-VQcHC6Zg8D-0VujjnjQyvHD0PQ=SoKQ@mail.gmail.com>
 <1f3f3047-327e-15dd-3179-d012edfc1865@quicinc.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f3f3047-327e-15dd-3179-d012edfc1865@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0018.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JNAP275CA0018.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:4c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Sat, 16 Oct 2021 19:35:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 879a6d71-77ee-4577-71ac-08d990dc2740
X-MS-TrafficTypeDiagnostic: CO1PR10MB4466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4466AB874D383CFF0700B5D58EBA9@CO1PR10MB4466.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2TZlTj2Q+Cn7ZyDjknlxDroZO54PAyUWUFKe8AZvv0PvDFLfUcEPORHzrMpQrIcZ3AE9pbf4kMHYGnMGCybRlcS/GDi3vW5HmaTvc0v6ZuDCyFy+yJ1cZ7yCwvCPMIJyqgvQXQNsYIkw6aVizZdUS5XIPtGEjAuGx/b6x3mzdbOnJ9TgWqiNWhbNZ0vNeBFJDTIpiOVv+nfmnPcL9GhCwBDMVx3RZvwatdB3qlMCgYNHoQEOWHdm5JhS1QnxasIzZ957sDPOIADFE4zCvB1ObLtrjlQcGfbuYk2cw5TwVTK8v3jh4ImSUtdrh3qLVJ2AVoXI3/fU3iL/2Wk7eFaCjn9WhODc3dpfPrz0J5yjfl7LXC6iNcqBOD2Lr36hap4trRjDTgnQMwvlCDwl/Y9x8UevGWcgDXrFKMDEWiPeu0AihQJRu3+bhwClDey/2ARw/8RU2ihXP8M8tksI9fuZStskDw9U2Zyc3QD5hqc3SDzfUq2nP3RjNQPDwmJwrD2rGGKwrLY34GMPze+/WLCZ8La8EWgBVNb3G232i4TFF/OOvt47LfmGbEzCfTTVpbjqz1GD0ZPQibjwU7FlHspUiG5i+mQx71x6uf6PDZXxZ/EZGtw1kuBv9qHJyzhaEDQTPX8QknVcr68F2dWdEi2mE93IYqlG1IZvaIxicRCbH9edh/Lv1pX4AmK4al/hM0Fi6PxH0g9LW/AJgefeySLqxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33716001)(26005)(52116002)(55016002)(8676002)(6916009)(83380400001)(316002)(4326008)(38350700002)(38100700002)(86362001)(9686003)(1076003)(54906003)(9576002)(6666004)(66476007)(8936002)(2906002)(956004)(33656002)(44832011)(508600001)(66946007)(6496006)(5660300002)(186003)(53546011)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JtZEPS16/mfYCQcjkYTKENrfFkkq2EL6qo/zLU7HdZq44BAcDRJPCnLKEwIq?=
 =?us-ascii?Q?5EuVJmmfhE67B4VFqxw149yD0dbray3rGz06iPRCXNjquA9zvdny7gOJ8vB8?=
 =?us-ascii?Q?YYQEKz50tXQplYUxAT0zjsEjQm2iFnyrkAsmf49DXQ82IT4PZH/7ocjJjKO7?=
 =?us-ascii?Q?UOE9X2ZR/odCHJItfKrcTtcORK5612yYbijFvsrWYAy3RqGGDk/Dle0kdt4e?=
 =?us-ascii?Q?ThN2hG0IaGo0UKZ0O0vBCvnYR9KRxiTezImIkuclgM9v708EdBrINpJFHujQ?=
 =?us-ascii?Q?DVVyT4uC6LLOXQvSJuaMsaScL74ww7ZmOUZGuWbgk5+syaiSRAtkLIR+Jw4m?=
 =?us-ascii?Q?gfoajmuFvoJk6+7oxhRZhFDHoxJ8yiJRcjD+KCtFdF2beq4mSEM+fef0NFB+?=
 =?us-ascii?Q?63hopEAu+GKJobLIIRSTsKTHHv5cHKZKQ6/60whHflJvBJsO3yigYgliJV/8?=
 =?us-ascii?Q?t2pO1XxevCPxtY36xgFP8rJdgXNJO+6g/c0AFn1uKXiEy6SEM1jekdy4pmX6?=
 =?us-ascii?Q?cZrSHbBrxBz/yUiGKcCzu7mbjl/396nBpysHa2qTMrldu79ghSPLwujhIKjR?=
 =?us-ascii?Q?zGR5wwSKJfeE7lUBi3Fliy5B4p/aOk3vDhrKZM2AUgVZtn5ILKdKAX6Mh7wP?=
 =?us-ascii?Q?kQUp6+EAT+9cHtHv3v7DUJzbzKJ7zPLEl2LFkhQ/+sLY8JTvbqxmRnuxQNm1?=
 =?us-ascii?Q?XAdWh3P6A9giVAeQh7Xp9VJh20Px9sWqDVUqbSXJppZe2mRnPRORQciF8BlD?=
 =?us-ascii?Q?3V0hxqvXDOxkak5aELCsX+cKRcApIpjbToM5s44FA9mYDVhE9pA1qdmJsKYM?=
 =?us-ascii?Q?Z9cgaesT/j6F0z4szKwBPPi4XWE/gdNqYZk+y7AP0vpoNm0dRqtsb4A+q7tT?=
 =?us-ascii?Q?EBWEZa55Xz8YBqBiG+QD8taS57mrvm8/M5r7vsYOmAMrFrRQt/Wt48St19iH?=
 =?us-ascii?Q?hfLLSHDQaR1Nhl52iNtemxdB1OZoV1hRbdtODM7xlKYyr/6RlflPoRfOJH2F?=
 =?us-ascii?Q?zL7jSNjDhdjq6MW6dyPlHIIpSg/OOUEDOFT1ZExNVGrF7SQowjZmxsLgSpHG?=
 =?us-ascii?Q?9AOxqMUDU0ChoLzyte/9O06l112BduS5PWkJGd2+tOo47ffCBT1/tcrbZdn6?=
 =?us-ascii?Q?rsoEHuazGc6qry+wTOCwHBpgYpeFenACLo2Heq3OmWugDJN+kpvXtnXcpQEw?=
 =?us-ascii?Q?4GdRTZpMfIDMgNT5dIyDf78qqU2JiGK6kYul/BAi3esJ5Uag7FoIItTKsDMg?=
 =?us-ascii?Q?Irz+d5Zb1KqiHOnDyY3PidMX/QYt3Si70JCt/GyCrwI6Jl0BeaBL5KRGl2Ks?=
 =?us-ascii?Q?7Jvcy68B/fab7IHTP599N/JD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 879a6d71-77ee-4577-71ac-08d990dc2740
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2021 19:35:48.1841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hclaJGiE0wHtJqS37zXHaIr6PKTA6JCi+yRtPHiC8fIFwfxngOniUz9qHP/+rGRyTQBxHH2g6rRCRAlxGBsEsVObKun5LAmNJp9xkJDeRiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4466
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10139
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110160132
X-Proofpoint-GUID: -PeFvE-G1QB2GOYF6mewwx-kRVJ7EwW7
X-Proofpoint-ORIG-GUID: -PeFvE-G1QB2GOYF6mewwx-kRVJ7EwW7
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

On Fri, Oct 15, 2021 at 12:34:20PM -0700, Jessica Zhang wrote:
> Hey Dmitry,
> 
> On 10/15/2021 11:24 AM, Dmitry Baryshkov wrote:
> > On Fri, 15 Oct 2021 at 04:43, Jessica Zhang <jesszhan@codeaurora.org> wrote:
> > > Hey Dan,
> > > 
> > > On 10/1/2021 5:31 AM, Dan Carpenter wrote:
> > > > Hello Sean Paul,
> > > > 
> > > > The patch a6bcddbc2ee1: "drm/msm: dsi: Handle dual-channel for 6G as
> > > > well" from Jul 25, 2018, leads to the following
> > > > Smatch static checker warning:
> > > > 
> > > >        drivers/gpu/drm/msm/dsi/dsi_host.c:729 dsi_calc_clk_rate_6g()
> > > >        warn: wrong type for 'msm_host->esc_clk_rate' (should be 'ulong')
> > > > 
> > > > drivers/gpu/drm/msm/dsi/dsi_host.c
> > > >       721 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
> > > >       722 {
> > > >       723         if (!msm_host->mode) {
> > > >       724                 pr_err("%s: mode not set\n", __func__);
> > > >       725                 return -EINVAL;
> > > >       726         }
> > > >       727
> > > >       728         dsi_calc_pclk(msm_host, is_bonded_dsi);
> > > > --> 729         msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
> > > >                   ^^^^^^^^^^^^^^^^^^^^^^
> > > > I don't know why Smatch is suddenly warning about ancient msm code, but
> > > > clock rates should be unsigned long.  (I don't remember why).
> > > > 
> > > >       730         return 0;
> > > >       731 }
> > > I'm unable to recreate the warning with Smatch. After running
> > > build_kernel_data.sh, I ran `<path to smatch>/smatch_scripts/kchecker
> > > drivers/gpu/drm/msm/dsi/dsi_host.c` and got the following output:
> > > 
> > > CHECK scripts/mod/empty.c
> > > CALL scripts/checksyscalls.sh
> > > CALL scripts/atomic/check-atomics.sh
> > > CHECK arch/arm64/kernel/vdso/vgettimeofday.c
> > > CC drivers/gpu/drm/msm/dsi/dsi_host.o
> > > CHECK drivers/gpu/drm/msm/dsi/dsi_host.c
> > > drivers/gpu/drm/msm/dsi/dsi_host.c:2380 msm_dsi_host_power_on() warn:
> > > missing error code 'ret'
> > > 
> > > Is there a specific .config you're using (that's not the default
> > > mainline defconfig)? If so, can you please share it?
> > Are you running your checks with ARM32 or ARM64 in mind?
> > Note, esc_clk_rate is u32, while clk_get_rate()'s returns unsigned long.
> > It would make sense to change all three clocks rates in msm_dsi_host
> > struct (and several places where they are used) to unsigned long.
> 
> Thanks for the response. I'm aware of what's causing this issue and how to
> fix it, but I want to also be able to recreate the warning locally with
> Smatch.

No, sorry, I haven't published that check.  It's just something I have
locally.

Btw, I will be offline for the next two weeks...

regards,
dan carpenter


