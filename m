Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C698D4A82EC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 12:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD6210E588;
	Thu,  3 Feb 2022 11:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F98F10E588
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 11:08:28 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2139i0AY010090; 
 Thu, 3 Feb 2022 11:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=0Dp6l5zSMUtvU74Uo/xjDQyswHKdDlVDqsNeN2xCCck=;
 b=zKkvixJZw2QvCh7uFgsXMxxuSCCbto2GyCQcc0FDg0lXg3B+vExlwxZOvWPFCUBLJssw
 tcCo9AoIP0FqTjAY3ibPigWHgWCK0SZjLV/Iu3ei0IlyksZLFF6k042f9IvjmmCfyzxX
 lrOPR1FvMtyA8nEAilowVvvqLWa/dJyKW8sMdiLYNc1KxmRazsB9o6+2xsXQF8KhPsm9
 sO6rzouo48/aDDL4/1zr1/2Ltyut0TRrfn4UgcSS1DefXgFx7O0xQwYs262E8VSD29P2
 oHZsbWTsmy49p23Kw+nHcCFQwsiOX7lAsqT1ja6VobhI8Xp2QLooCoXcn+vwD/vWRrlS Hg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxj9wgsbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Feb 2022 11:08:09 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 213B5VEr148099;
 Thu, 3 Feb 2022 11:08:08 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by userp3030.oracle.com with ESMTP id 3dvtq4tpmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Feb 2022 11:08:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TggGFT6Sy0ifGtnM9HnGvk2d3mP3fWpNZlAHh7EOQLDzXhuxjhAqHbiB2zKEI/iElBZ3s23SrJYFsTmD1dg5i8Ci2f0hbP+CcUIPlNWWck19MEMt97Md8ettO7iCcDgVUjIOWeMU4vP8XnNE1jcEcai+BpjIMf5G7aUaNHiF1jDBrputX2gxxJiZMbpdHU+LIzM+fNasO0pFp7DNdmx/ttbbfLRlr8rArg/NjWrZs8/ZH4dTyf/Hm2jYPCON9DDHrDDh5WWgaaay+K7JDXXBgUvQP4J6CNJhMIBB4uOwxpRqyGJ4XqE465nk2Qq0q5DaUbZ/ha/pYHnx/xTxZOaaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Dp6l5zSMUtvU74Uo/xjDQyswHKdDlVDqsNeN2xCCck=;
 b=JryhUKwNF+bkCN7NzlWe+LKua+g5Cnmy6QBoYzLSFtLZgDhEiDdzQt1DnxC+efucXqb4I9Nfo3kePeD59cwPof1k5H2cxewiRi2Rx98+VvDVnTmt6KVOP20yuqpzXcTh3KFacxRpY4opJbAyGHUzS4Tn8G0HGshPf45uTQKLRye+0WfeD0r6bY4UabyVrzau9vjFeZN6Q7dlglEFSGpHwl9sMFVjcGdmsQmoY9izqfN5HxdctkUH5tR5T6Oh15FADOlfCADP+nUefRL0Flj9LLWCPCHXtqxeLUb73FqvZuu67wf14TvZ7nq16enwf/Nn6ITiPBOthlyoFkwiLC1gdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Dp6l5zSMUtvU74Uo/xjDQyswHKdDlVDqsNeN2xCCck=;
 b=ns0q6YTAoS6HQZzLt7apTyBZFZybfnGPeuExFTCCDiqKDNiSvyWAc6PG6FkV85T6yg/PjMvwq9kp6QlVgZ2SD7Nq1QhsXKn/s9hy5WOhEtpnOO3uIqA2HN2ZUe2Oeiz+lhZYprI/sUexKvOMlvrCpy8pypHwIas86cu/+lYibsQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB4091.namprd10.prod.outlook.com
 (2603:10b6:5:155::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 11:08:06 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4930.021; Thu, 3 Feb 2022
 11:08:06 +0000
Date: Thu, 3 Feb 2022 14:07:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220203110751.GE1978@kadam>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <CAJKOXPfCjx6UoLK6LgXBZCfixxq8k7E-RFXb8i-chyXc39WEoQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPfCjx6UoLK6LgXBZCfixxq8k7E-RFXb8i-chyXc39WEoQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR2P264CA0025.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500::13)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ea4bd18-e077-4093-9778-08d9e7057407
X-MS-TrafficTypeDiagnostic: DM6PR10MB4091:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB4091ABA6F20DF4133874A15F8E289@DM6PR10MB4091.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qkgjA9BjvZYp7v4rkexP1mbpW+l6WW+aluPftrBwaJORyy9DTiO8zvpR+R89OaCNOFPSuWslNNaWhCGjQYazlBkmSmkXkKr5YxpOZ9riGhALYFY+ReRTJ329Zy/TyQr5ng/GcXcOghUp39Aqzv9DW8Tf/NtItqb4EbAXTp447OYxPhIi/Vuek4E+owKPpd0Gr8KebTcZjaTSQcYpyftPG5CyCTHLm+HLhSfrjbEg5knPXu5vRFrDhk344xjySEPVylMEWJN/9Mxn+vFnKtwQmNnUK5tFf8ncQ6qiCtnJNzBisTFNW+ZVxoW8Uhf0N+Jahg0pTZuCU3T0STmsA3U6gNHDlMSEBrfuB4248ms6dEaT4300i2aCG7pC/A6aKvrZu+BNjFHKhSLqWxTTEDR34uGMLiD0iUzjM4J9vMZMS4VL9e1mFeu/NojP8grEbSgAGnIr3/m0O7RdhG+to4proo87ZgXhEkQszeKbth5xQ9m+Ybn0ETChEdtZygg0235l9h7Tyq6RSp8wapQP6GLRyXzXvS4dHnZ6kTEZnHTcDHJDJjp9RKEr2ge3Re/tM4VB2xjS1tpHsZ+MtyGP2FfA8Vd+A834y0Oflolw0WOlaYLLtt9EUnD8l+zEfZcJoax0vn5J/i1dCLJH0T8x2D7r2k0aYfUB/WbGIqOtloluO4A+WH6UcjRUqE12JdTG9oer8SppEpOmHtJ65Twfsvg2IA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(44832011)(33716001)(38350700002)(38100700002)(52116002)(83380400001)(508600001)(9686003)(6512007)(6486002)(33656002)(26005)(186003)(1076003)(6506007)(6666004)(7416002)(66556008)(8936002)(66476007)(66946007)(8676002)(4326008)(86362001)(5660300002)(316002)(2906002)(6916009)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sUlEAQZ2KGB5bSeWQ/BX49xcyqG02bDE7GedGIwQALEotqjfRjRgmlrI1nW8?=
 =?us-ascii?Q?ndKZuQ6OQJk6wYLpEBsrrrA6yCFLJUPdENYC4poC63VeFXYIlNK7N6Iu1klA?=
 =?us-ascii?Q?QBaqD5CbNfYu+SyiwfG2MKoCAcobw3Lfu1sqBNHvNHH2eL7rmH9UNagJpOY5?=
 =?us-ascii?Q?C1Id1uA+OUQzFtBx/KC+uIj4o/Cc6wQh/qaDXJXg6ZDHjxgD349jrvaP10oK?=
 =?us-ascii?Q?Yr7VWclBJIJC4AIWLS+7YyLhsxJ91RcfH+U4SU8jVqDy4Fw+7y4dmO+2zyux?=
 =?us-ascii?Q?NwTPLEOE7WpwPL3MFFWyJslig6HFFavvvzrdMGjRrtaBYL+mh10hlQSyskgd?=
 =?us-ascii?Q?eJRISe8tLhxGfJs+ZFLLMSurmPGci62RtcyuhbNKtqMBqS+rNcOKEbG1XHpp?=
 =?us-ascii?Q?GM2gPyj5qPoR910N41dR0dOkkrhUKBg/d+bkB4NHXhbS0Ui2O6rXEaXDsDCV?=
 =?us-ascii?Q?BwZoO0J4Rdx+bkoi9m57PoD8SMgTRNVGSD2Xso2l4cawf/QTTZ27U7lvHpYL?=
 =?us-ascii?Q?QRL4rGckeWjzzvoLla5DXh1P89H3ozcIyuuDJrY12dSBMGf5Y3jexLdB2q/r?=
 =?us-ascii?Q?NhcOEhRjdF8hV01pwTOPwBo8VaNsCChmpubMCrtJIlWEvwZ65b4KYc3Bkito?=
 =?us-ascii?Q?Q9D/5rJZcOdwjRW+02q2yOMzMt3rFXHTnnzShLsjFykpipTlp+I+xNanS1F8?=
 =?us-ascii?Q?3sBBR7g30vswyPapU8TwOeBYH8wqfbk1P+VlcIwuBhjFPCKCIuWs8jEoihT2?=
 =?us-ascii?Q?hh2i4m1zE2h2RknXrJ7EE1Vj3Ipx5Y6QiUvjeMHhJmK3HBBBWjk7XKCci/FB?=
 =?us-ascii?Q?e+jyx+Rb80iFCnfRb8SmKU36oLE7cqfLWPkGqIed1poM22ZWxefyGcWslxxa?=
 =?us-ascii?Q?l5r5r/SkkmHkRbRNkRFhP7x+TSH4OKQjhoWm/iUoz7JRVovj2O4ArNj1f/1D?=
 =?us-ascii?Q?ipY2oGHHz8qfIWTJ1iPx/Tz3QJ5uP5Mh+P3O+k9CT8Sq30U1n9Je4mRhgdTz?=
 =?us-ascii?Q?EDiKMgIvcL9EW0jHiVdXOlKoZJV29xdItwA3bNWiAkn/3GcVVwVSfGxwR6+F?=
 =?us-ascii?Q?t4h5o1jVCQhAjLU50jS9338nbYUry+1u0j2+GVTIE5HG8XWu6xK4BluzVvuI?=
 =?us-ascii?Q?KNZQQquANVjuLrdiK2eNoAd0KFQZvoLCe2cPwaWZbn3WcvQ3wByGH+TOo2EU?=
 =?us-ascii?Q?Zlp/XyCjw177ww98J9E4bfekTDfh3dp+75Oo+BwID1OR30PJNVsElerJUKWK?=
 =?us-ascii?Q?A6O31IIG7mtdKUKIzG6ZFpLIJe19Am6zZ4sEO7llnZ8sbeUlfY/H6mJjpvv9?=
 =?us-ascii?Q?qPpKa8rEbEAdYVrNfDhdsdT6gd+560J3JE7Z4WjEK660V0ecIkLWckyXl21g?=
 =?us-ascii?Q?8lsZiLR6zf5VWaRriLyDM0KVsC2e6o3K1nDT2uXejhwAm4M7nS+BzLDNWlcW?=
 =?us-ascii?Q?PWrcg+3zz3vl6cpb/Bwwt3QUUrt2R1fCLV2pEJjB3xWaAzqJOXm+J811DSJO?=
 =?us-ascii?Q?xA77PxJTaRwQLwT8c7/AQMXeq2uxThSw8OWCoVhA8/T83XwOo94oQKWZ9hup?=
 =?us-ascii?Q?++ZxRFFB743UebkzRDMhIyzVelRqyfEA51tnD3xoJX30t/mIEu//mXZns+mx?=
 =?us-ascii?Q?FnCq4JHWD7t7cSNrwElGjuF4AR12Yp+a9fmMqFLQviKkZsGKRWuHryt8RR7a?=
 =?us-ascii?Q?JTSdDS54JHMQMXdJhEUV+ensAgo=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea4bd18-e077-4093-9778-08d9e7057407
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 11:08:06.0111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71pM0IVBnYmsmUKUYNW6UlbuQ2bbG3sYsogkt8NF2NQBJgUjTImBro0wbGo1hyNE0UEYogPYoBQzQB+QXDg/QdkKNNzSho1NYSEoy5VTddw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4091
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10246
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030070
X-Proofpoint-ORIG-GUID: yvDkm0Dt_bbLCCO1rQnoJGYLkGC7-Jzx
X-Proofpoint-GUID: yvDkm0Dt_bbLCCO1rQnoJGYLkGC7-Jzx
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 Randy Dunlap <rdunlap@infradead.org>, Roland Scheidegger <sroland@vmware.com>,
 linux-mips@vger.kernel.org, Sui Jingfeng <15330273260@189.cn>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 03, 2022 at 09:53:35AM +0100, Krzysztof Kozlowski wrote:
> > diff --git a/drivers/gpu/drm/lsdc/lsdc_connector.c b/drivers/gpu/drm/lsdc/lsdc_connector.c
> > new file mode 100644
> > index 000000000000..ae5fc0c90961
> > --- /dev/null
> > +++ b/drivers/gpu/drm/lsdc/lsdc_connector.c
> > @@ -0,0 +1,443 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2020 Loongson Corporation
> > + *
> > + * Permission is hereby granted, free of charge, to any person obtaining a
> > + * copy of this software and associated documentation files (the
> > + * "Software"), to deal in the Software without restriction, including
> > + * without limitation the rights to use, copy, modify, merge, publish,
> > + * distribute, sub license, and/or sell copies of the Software, and to
> > + * permit persons to whom the Software is furnished to do so, subject to
> > + * the following conditions:
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> > + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> > + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> > + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> > + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> > + *
> > + * The above copyright notice and this permission notice (including the
> > + * next paragraph) shall be included in all copies or substantial portions
> > + * of the Software.
> 
> This does not look like compliant with GPL-2.0. You cannot call a
> license GPL-2.0 and restrict it with some other provisions.

That's the MIT license.  It's not the GPL-2.0 license but it is
compliant.

regards,
dan carpenter

