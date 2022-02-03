Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 017644A854E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 14:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E4810EB6E;
	Thu,  3 Feb 2022 13:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E82A10EC1E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 13:34:38 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213DREYi007910; 
 Thu, 3 Feb 2022 13:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=q2200Hfkv25m4xV1NiL+v8ASzRif8xFyXRFn1OsJEUQ=;
 b=vn814JwcFQ23iVM+q6dCPxQtUSDVJNcIPwz2Xd7FC3daudxpsai0j62wVsvsvc750u0v
 ml90XF+2qcJ2S/zlxt0i3/1O+0b1Kg1zE5+v5xTHpH5G/NuGYCQEJ2O12JbEv8Cl6LZb
 GDwf+jMTPouoSPcC2OoYJVut/2MMj2lYdScWDo3ppDvCWNOLjpMFqrowknc0fCVNPQGD
 5y7IjUizE2k+wT/6+piDbG6EHHpc0qAWH664hKo9aBbp53erOQV0JFxj0+NwTUzHU06I
 mo4BZPd6O6vFGtxHSPFLaeNzPl2mE+RxJpCgkIp6McQmj9l/zQF6Npd7za1nqnjNMiO2 6A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxj9vhchq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Feb 2022 13:34:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 213DVYwX122570;
 Thu, 3 Feb 2022 13:34:19 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by aserp3020.oracle.com with ESMTP id 3dvwdaa90f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 03 Feb 2022 13:34:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+fvgFiRYCQnxAog9Mo2k26600pqqRiYQUmN7af510SYw08j4Rocb9sfH4l3Zkm8fGm1uF3csIC2SkH4g23MvcNnkYnfQUxNB04OgksAyMkgBxtuGDPFCCo04cXHZVAVZa+8Qg3cxOLCBp6tLISSUNWeoiCFD7JiqO30+/nhSJiBkDRDPufxn34hwxXJLJeAt/5rsPUDr3+QJy5C2RodhsfaK2vqBIRtkJW1N84OhHADjl/x1F5i2u84sB60xUTy32Tty8EkyKGDFzg0iNPUDwYqVMOYW87GjzIqvC+sEJvpa9d4xKEaLlXMqDVPBWZePgyyE1tWEt1ovQ+Bjx1gDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2200Hfkv25m4xV1NiL+v8ASzRif8xFyXRFn1OsJEUQ=;
 b=VBLsepscG3h49sweFUtc3S6HMC6BKFRSCYV4BnvcunF2xkoRqLRoWju9jI4DpNbMVL+QCU5hLmYmbsiS+XsSLDbIewk4HNSaV2pg95fXyef3eDJOXYAOj8flexqmiTizDpbGebgX2eBrs8fq3KeEqshVX91iTOH95kg2aFNFKuk/mCbzERwh1lAcx1NVsrxs0n3P9YBQ/ljWO2ihwPSwKcX/qEFuVZf+BYUXcAgRfETmi4rBtLVGu1Y14+02xGKG6cyxnxTjJbP0OlrAzrF+jgtdhlNUnny1U/3D6UncTO7w2oTyUGnHV3o01Y/vvsRM/Aq117asqDxPUNn2Di5Gzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2200Hfkv25m4xV1NiL+v8ASzRif8xFyXRFn1OsJEUQ=;
 b=GSHrCXxfqoZLPnOZV5rEsrKyPzvtLrbDxB0eIJnLfFWWFgMdL1Te5REsAAvge84PZXEIu+wwZk9OOjNRtF4a+sAI8GW8j5YhAUmkfNli1p94J2WRvzD1LJItqkHcxh8L1RNUhYTP7hOiX9tormEDSGFrRvxgnWeMdzGOcE8mBGY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1470.namprd10.prod.outlook.com
 (2603:10b6:300:24::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 13:34:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4930.021; Thu, 3 Feb 2022
 13:34:16 +0000
Date: Thu, 3 Feb 2022 16:34:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 1/3] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220203133401.GF1978@kadam>
References: <20220203082546.3099-1-15330273260@189.cn>
 <20220203082546.3099-2-15330273260@189.cn>
 <CAJKOXPfCjx6UoLK6LgXBZCfixxq8k7E-RFXb8i-chyXc39WEoQ@mail.gmail.com>
 <20220203110751.GE1978@kadam>
 <CAJKOXPeLS+PZBCvEOeazc8N5w1D=WeO_D45yEazu-XQQeHNohQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPeLS+PZBCvEOeazc8N5w1D=WeO_D45yEazu-XQQeHNohQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MR1P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e44626d-9a3e-47e1-e8da-08d9e719df64
X-MS-TrafficTypeDiagnostic: MWHPR10MB1470:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1470BA3CACC13DC0E8AA9B468E289@MWHPR10MB1470.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nh4fRml3g6QKa1lHGAkkFAsG9KhC/H6PkRwsu1eSeLYhhUCQrXcEHjFoQioRveau+cYe7NDIqfx9nP8Y2wp/ylvqi4f1eUM0QXm0RBMRCefCoxv9JDcdixezzwgLchnQDiNOkyBhLX6adk5Elxar7D4HayAJFjVW7nE3WeP0WRuTwwjAfShf4F1jUblPVyffeRMPWu3nJ/TXR9R61JQNyzWA6VH6K1NUOR911GYNtJYgSKosFZmP884e0LwXhlJT3iqIoFwbR2/6vk+H6YznM1fgjw2LsqmmhUvEcrdRYmz4AhM9jM6duL1ACm3+BYdUqt+9/o98QadlfLf10GMT0yWU4fpFoaIxVj+A95zI8vGu8lZrCn5qHXiQHayr1cuM3kQxk6YqCHiSgLoOjmYzT/HygwMgYKdnFNzxA8SxNJC9q6S7Fd3O6ZCc2xRFwco7o+v87REDXzjx9NDsLfyOA7dm6wEtkqeQ5E0rNRQaw+KDICWPtrWlmacooFLixbvEixo2jO7Ly6nAtPSjA0lf7rwFs2s/6eYo/jMmRYWEnAtLTUvI2l9j4vouGa0kJUgNeffMbPo3Y9TZK9/kiaSFK9rcMB9rSDiHb972EHHChXq0OK9ulSwd+tKxFXdfGP8GbIM43lpjUzZVuky6nX7/e1Nx2eBRRozCWYdSTS2/CdW1UHjy7cLVpqRa16KrJwuL0Vv89E5SNH1Vdv8bRngz2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(8676002)(83380400001)(66946007)(66556008)(66476007)(508600001)(33716001)(4326008)(26005)(186003)(6486002)(33656002)(1076003)(8936002)(5660300002)(38350700002)(38100700002)(6666004)(6512007)(6506007)(54906003)(7416002)(6916009)(316002)(9686003)(52116002)(44832011)(2906002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IEuK/HHPEAJR0LINNi4rJBpEpo3olhYiI0luiAXEyTo+6Jf7xYJFkl3DRPqd?=
 =?us-ascii?Q?l8Zj+GEEVPEqzYl0IAXyEMbhZmHBbE1/XpfeGXaO8Ngu01Z0myaLgfxs10QC?=
 =?us-ascii?Q?yttIsAtSZ2oRE6vB58/63xK/4brSJuwynwoZzouL7W8jeoZIYHR5O8sGaC9Q?=
 =?us-ascii?Q?dD+d7C6TrghYT280uY5tcD1AOBudfexlm7QPjhHAJNGRuT34RECUx/B5cF5U?=
 =?us-ascii?Q?3HqQxtoJ+7T12Rd00HUvJ0QLz62WfrX11k1nb+vzu5j+F0AoOCL5ul/uLlEN?=
 =?us-ascii?Q?QNBIQSKzX4KuCyl1emccOiqY0iT1uAXivvdwvyhfcxMICWH03mXqVxDki5JA?=
 =?us-ascii?Q?ucA8oWl3TyA1Fx+CA3TxeDzNiLKQRHUy46k19S+f1daiGIkcSAnfxhEx+zrz?=
 =?us-ascii?Q?UkZfQKZCHMALDQTPvENzQXazISX2Or/YKxGziMRMOBLrosbcpavumXz/WFSx?=
 =?us-ascii?Q?rg0YL5OSkGIoBZhdCOLmSUiP2PT1NBAqwh184S+Koiy2G6aSirnTjGdh9y+B?=
 =?us-ascii?Q?CNhWaJOWW0RD9BFi2BgCH9O2+UnYZipLbV9CiJF1XE0qPz5D8uyben0KQ1L8?=
 =?us-ascii?Q?Md/AfJy7j8Lo6GItbD2FCENXup52Wqa4PjLGMyoI4s/5N3lZh/nezSkbBlPO?=
 =?us-ascii?Q?FlSNN7FfHnVqcuxss6hoWQ4dQZACFaIHX9M5GTxYQ7frbuCBabqv4Y5VUK9z?=
 =?us-ascii?Q?/jXD8aRu/oUGAleoyIMeWH3yFzv7+Ky+1sjfOmrgyl6IU1haUAbCuj1YgdCD?=
 =?us-ascii?Q?pLdyyCsaMVarY4JbLGrWZBjvkY72+/dSJhWXh9dHJ6doJkJjPVnRo1LTJtXX?=
 =?us-ascii?Q?bIuZiw00pgyQutpXVHLDG+Q54Dbd0hkavpOib0OuvQYtk3J/Sk0+mwbmK9F+?=
 =?us-ascii?Q?EUzcMYzX/4VYkxmHRsFx5sTWl1GWZ5jU0vgZAszqAH61rvCfT3XfkCnVGa3j?=
 =?us-ascii?Q?vaQja6tmCJQNSnlzCRKfgIkPy84uLhIC7Usbo9QtciZboTGZvb49EP+g61t9?=
 =?us-ascii?Q?bprB5Gkq31EFaEP/qhFEEDQACTc0sJTbIZGcpUV80d8/vyRUgkf2pUQ6ekHp?=
 =?us-ascii?Q?ZJaQZOThXhVgL+YIJ1hpW2EPsLtBUoM7gwghHMWyqsfcFDUXbGSnWbwQvtve?=
 =?us-ascii?Q?/SBSnEGVxDs4fh/9w28AHc5GCu75VE4+R50IvT/AQbuqb4Rjcp/IxaRW1i6E?=
 =?us-ascii?Q?6f9qwt4ATeo11TyFCKgrhN498QOCnhNPmwCN+jvEivLekYfQcp+xX+l6NwjU?=
 =?us-ascii?Q?fLbD/KytwP9PdVrZnLEkiTPxyo+2xsvHd7f1CeHvmv5T/3EzygYPXL+KiXNX?=
 =?us-ascii?Q?02rr6s3W3vRhVetCshhvkhLErwQpWMzQ3QNeNrb+ITy0nR9G0IwTdplbYZ2p?=
 =?us-ascii?Q?Kx6xPgcasghuV+VnS+8oXvtOI4GlkI4yqfjX9qx7PG24uUyQB0+99jOAfN5L?=
 =?us-ascii?Q?cTZ8S1tes2SU2HA1BQObszS8h5ImfFySqAwFziYKy/ogjqA9RK0iKHzXgpFx?=
 =?us-ascii?Q?Mit1o2Jq3bSfEdjyiV3nrqDqjzLV8iOfQZkVekhEl8Oyjm4+beu/+FSc1dGv?=
 =?us-ascii?Q?sK4d5CgqkJT4B5pOaJorxcoetyY33g5QFLlEL2BR8U6cv/rBVgDa3s42mnqn?=
 =?us-ascii?Q?OPgBwfiSegajtCZW9teXkJr6VL8bfbdOLi3GDWTIxELxo8nIgU0foGK3Ur4Z?=
 =?us-ascii?Q?N87UGMBdyAykVTo84YullD+ItzU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e44626d-9a3e-47e1-e8da-08d9e719df64
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 13:34:15.9954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aKtjRd5bamVbsLAM3A1o2bdpCzMhYzSD0xeyl22QjfVn6KzzJHZUfhVoFVApGO2fGyIeKrmrXhgqg+EBepiompdJ+QQwMTFxGAQt8l0As4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1470
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10246
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030084
X-Proofpoint-ORIG-GUID: 1-3INV1221BKvuH5ZQWEj9gqyJP3geXd
X-Proofpoint-GUID: 1-3INV1221BKvuH5ZQWEj9gqyJP3geXd
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

On Thu, Feb 03, 2022 at 12:29:11PM +0100, Krzysztof Kozlowski wrote:
> On Thu, 3 Feb 2022 at 12:08, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > This does not look like compliant with GPL-2.0. You cannot call a
> > > license GPL-2.0 and restrict it with some other provisions.
> >
> > That's the MIT license.  It's not the GPL-2.0 license but it is
> > compliant.
> 
> It's compliant when included as "OR" for example in SPDX tag. The
> current solution - SPDX and MIT license text - is not the proper way
> to describe this. Otherwise one could argue that both licenses apply
> at the same time and one has to fulfill both of them, which is
> ridiculous. There is a SPDX tag for the proper case - GPL or MIT.

You're saying a bunch of different things.

We both agree that the SPDX text is confusing because it says GPL-2.0+
but it has the text from the MIT license.

"This does not look like compliant with GPL-2.0."

Wrong.  The MIT license is compatible with the GPL-2.0.

"You cannot call a license GPL-2.0 and restrict it with some other
provisions."

Wrong.  The MIT license just says you have to include the No Warranty
text.  The GPL has it's own list of requirements.  But you can combine
MIT and GPL code and easily comply with both requirements.  That's what
"compatible" means in this context.

In the kernel we have MIT licensed code which is dual licensed.  This
means that someone can take that driver and release it as closed source
software if they want.

// SPDX-License-Identifier: GPL-2.0 OR MIT

Then we also have code which was originally MIT licensed but now you
have to comply with the GPL as well.

// SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) AND MIT

These examples were cut and paste from Documentation/process/license-rules.rst

regards,
dan carpenter

