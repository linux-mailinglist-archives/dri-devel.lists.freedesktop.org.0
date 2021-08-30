Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3ADD3FB735
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 15:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29AB589C13;
	Mon, 30 Aug 2021 13:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1183A89C13
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 13:47:53 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17UBO0bd014293; 
 Mon, 30 Aug 2021 13:47:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=o/epi8tap9njZtB898niq15lt/buUImnF+y+jRWGdJA=;
 b=wHRl/wQqs/Uv+1AAnfXu0EL6B+jkHdGZZZDNmSWAD1zQmA1fGWfKcUN4h1NL4d/PZw9Z
 FwDNWNupt6KE6V/BBj7Wb+ktxGhDnZD3DFEXq7ZRvVC9z1CtzI3PIvI/F0rYxPNdX8q5
 ZPzVy6mXkSAauqiPQAFBa7WMv7Ety/hOPz2YsS2sMuN0tNHVLy3Jw+rJyXrKeiQs3gsH
 Uq/FS4aTgw2KMmfmR56geUQgho2Me1gR+TLJMNjjnym30h2GonUbNzXuu+AItateWZih
 ndHef8XcDVDbCbBOD0t06eunvJO/nIJU8v6+oZlY3jhdbEpdPkVVo6Xr6D7ynQchwHy2 0Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=o/epi8tap9njZtB898niq15lt/buUImnF+y+jRWGdJA=;
 b=TfH5vG/xTOIP0mneNvH09Hg886OIcXWFbLfCVOSMJX3i0qInFEzY5M40RDHNnbIx9mSx
 6rS2P61jvbE3dq3mxQ5qJkCe141ANTeBRTDD/dwnWv/LNHSDrPCqwC1l3QSucNQvM+B+
 rUOlg5OyZD/m4EHLG+UTQ4CuFHg11N+Ajc7x8LCzHopT3uFwcxVjnPCkGzmI6FryUs6S
 9BkklC8/CmyW0esVeHF+RBQ1rIR8Zt+Drn1CoeIsZQRYI12Fu1d1danr/ZjahrUeAC5d
 7tLKuTjPSWM715nSRYTBdTV2RIms8ABbVu/l+JtvThByNkv+MBmEo9zhZ/Lnj9FS7AgM EQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3arbymhjbw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 13:47:40 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17UDeOZv018467;
 Mon, 30 Aug 2021 13:47:39 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
 by userp3030.oracle.com with ESMTP id 3arpf2bur9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 13:47:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQzwAmhbL5xMeVbkGMjlkwzVnomeJtUeu2+E1K0FAZyxpZh9W+IZRTSqRjs5fXhu/l7BLC/5OoKCJ/fvN9zAnViPL2DuAtcLJHLxUPwQfZb2hf5FPfgAMu0oVMH1qd7uZOH0hxwGyE44UNwjWgjWvFaXzhi1tnGROKVqjBPOmEuu6lnWrzupgEZ7I3zyjH3opox2ne42JoAuhnWvSNlcZQX4aek5bUpXndDwDmPLpYmtCQ2+cWRQwBgjorwgC30iCw5gAz5tcwa17A39X50BpqYGdL+zv1kfPwk2VFWiOMDqzMY2ubAuXdTITosM3RTnisZlMPcHKTCOXh2WegG5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/epi8tap9njZtB898niq15lt/buUImnF+y+jRWGdJA=;
 b=BVi3LxS61nS6VwYhS8XGcNtJH24NfKbDr3MVUIfdo63R0SCTSBLIOVHTl6pHR2gLgKIm4PLdaTdcBURadONMBf4vR7KXBd7nei454Q+bpEa57P4v+ahmDG1rd4Ry9pYIlgqg/5+/LVJqzG/tMZU9PrYMdr0t3HnESuVLIoYqyp9Bm6Zmo/MTe0vkGguYhy34y+O5EfUphrcNY19n5PJ++17AR8JFOzlKAENG+Cl3tcB0gaEYyBVLzNaaWS3q8xJD4LUWij9vYhx5lTrqyhCRWL7n3G7SQD8U8Jej/vxTU7y1ORgxce+Wqjw0i6yeHCD8h/kn8Y9EODdtMTHE/ZW6Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/epi8tap9njZtB898niq15lt/buUImnF+y+jRWGdJA=;
 b=zXtAoPbRfWTWGRswJ5f/1a2MyafmZuGHNQBdU4KJhYUsr6nIM8mEJV69BvbdT3m+zh+tWg3L2Ba/ZjHrxq6ZxiJtq4U0oJ57GoIAuQb1emrbTsaE4hq9JN9U3sPuupltyfrKL9C5SutMwAAiLZxuiZR+EYeWSpe0TyNbUNWlExs=
Authentication-Results: i-love.sakura.ne.jp; dkim=none (message not signed)
 header.d=none;i-love.sakura.ne.jp; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1661.namprd10.prod.outlook.com
 (2603:10b6:301:8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Mon, 30 Aug
 2021 13:47:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 13:47:37 +0000
Date: Mon, 30 Aug 2021 16:47:19 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Colin King <colin.king@canonical.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] BUG: unable to handle kernel paging request in
 vga16fb_fillrect
Message-ID: <20210830134719.GI12231@kadam>
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <CAMuHMdV=xVhEHLEoYt3OF+kmGrLOr6t7SP1sghSmp9JqXD+3Og@mail.gmail.com>
 <20210830130000.GW7722@kadam>
 <8ed0ca59-226b-2d0e-b1ae-82305202558d@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ed0ca59-226b-2d0e-b1ae-82305202558d@i-love.sakura.ne.jp>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0010.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::22)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JNXP275CA0010.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:19::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Mon, 30 Aug 2021 13:47:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc50d49e-7e99-4c63-89a0-08d96bbcba0d
X-MS-TrafficTypeDiagnostic: MWHPR10MB1661:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1661FFA5D6E8626656D09E388ECB9@MWHPR10MB1661.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwvAaSxKoKvGEtPhZ50sUlR3yK9l80Ft8SVygdusxWIcqBF5tU7uoZ03Kkb0l9FJ3Q95+uFMN7RObck7HMSWmaCpyPymSZjt0bzBQvJIdVrll7SKWyAQNOIcpbh/Mqv80Uyjacu8OE0x4xG1zonokvBqkZkpz9V9OEqYppFoPuM7FL9euX4HWtFrlKQsYnVTHLhYef3+NIgYV70Gh7P8BX4ulYxdjmTxQSVyIEu2/lueRVWTOEhUf3M2Nb1lazpeKLi5uNHYnWXT5IFCvX9JnFbDaNcCE/TdrodQaBaGz113yesOToOQM29Mf5k0+2JCZhIoSJU/gwyqMHmx518OiJVldADPHU7dnK6vBI8ZayMXm5aY9s/6HvmPkhO0PvFsSYC2J3eLYlae+bpkuyVpYM8t/xY4Dk6w151hRKoXWAEkWtFcOI4CgJuSGe+J5OVDFr+uUn4SPemECuHDcIWAD8AiRipUbVT5SVK1/f3bRFZ+MTRo0NBouSFLhlZToR1C5HXIT9AbRJiZ8hdYdh/A0w0x6JMXt7zOC9a8hiPKC204iwt+Fv2CjuIEUilSN6GzX0eVsrEGUxCjRXyrDM+WA0zihGLcmiu2vumZojS5hCRNlteh08pBQ1jycPVf2Rl2RhzGDwZlblJvcPkZb8l2ZWpKMthFbrpJls5hsIa/cDD3l9P5moktXxAXE6fPJS5niFwXfKwtsRnzZqGuFq9K5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(366004)(136003)(346002)(2906002)(66476007)(53546011)(26005)(478600001)(1076003)(6916009)(54906003)(7416002)(6496006)(4326008)(66946007)(8936002)(66556008)(186003)(956004)(5660300002)(316002)(8676002)(52116002)(44832011)(33716001)(9686003)(55016002)(86362001)(38100700002)(38350700002)(33656002)(6666004)(83380400001)(9576002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DU6rLwUZc0hs39T7p7UtpZFZmf05wQ5ANnucx2rajJRQzQdAAWJCFg4ICA4M?=
 =?us-ascii?Q?NdQgAL32pAnnW2VYpZkGS2YaAHJ9ExG+M3qBNXmdU7U+W6itNFPIzB3lOywq?=
 =?us-ascii?Q?9/479NoeSgVXh6QBa1t4Hajkpe/d4JRbGunAyE1pg7VXDd2dVQVtKEvCEtbf?=
 =?us-ascii?Q?XBp+dxkO96cNeDs+kLMzb4OLVbzYl5QK0f7fS351FFe7r+VPjfCPBA/45TeG?=
 =?us-ascii?Q?0fsQ3Sp8QKOfErnf0si8rJ1hKx85VARXk1p3bgMWUjA4r5Ww0zDZI+YygYWc?=
 =?us-ascii?Q?1GDix8FqckC9Qjxqo4GzCe86LNVszM69oaTUzqpAc3QvwRpWmVCRmbXr5a4Y?=
 =?us-ascii?Q?bZqtpINjJ5abA6UoZtc2KCSB4NebOua0qLw18ea7tv7l0/xM/MLiX+xyz7K9?=
 =?us-ascii?Q?LthFh2Kv2gVbqgAPYuQcyqssggr+oZDUhEDEwy1AMavN7UD/OqNmByyl8aO9?=
 =?us-ascii?Q?n8xov0CKEmsJ8lClxYRW+IRvVJPB83y15RB1u6MLfr2R70OLeLWQP16GLbO6?=
 =?us-ascii?Q?uq42ZBRH658Yu6rIq/pJbeLky1waNo0pTmfQ86JqzJhubziEtqGUo/IheAor?=
 =?us-ascii?Q?esbulIqRMJJaBy1eZD5o9KW1kYs2m9NwtE4+abxyt+ujSihVccbmeLdcaKlI?=
 =?us-ascii?Q?jyXW0RoDr+0u4JJNFJwrAXRmEbEdwQDLCqN7c+JGYeEDEcq38YCSUDSnYq61?=
 =?us-ascii?Q?HvnGiSJ2QtnvUB01qozr8OpziU3fUzjsFCbrsd4G9dwYS7Qd6GtOBEXeJtYV?=
 =?us-ascii?Q?SgO+ELY4x4yQiByAvutlaLSuolR880nnExOpa2LlclQMTHcIoCOLr2jLwDQi?=
 =?us-ascii?Q?07dUp1xZEFeYFO1uNH0bpveruz5edIQQxKPw97/7Isc5RhjA6Umnc7qMbXp9?=
 =?us-ascii?Q?yk3P/2bsJGF6yqwp9KM5eUxBuIzx5s7P4smYqyDz/thrxRK7JRp9yiyg4kZC?=
 =?us-ascii?Q?keKwmPi547jFGltCwbRBeaRFQRNfPMGEu2k17QjGvE5DiKmDrK/OvdrWP2P7?=
 =?us-ascii?Q?f6cVx84dllTCD5ulxxUSG16j1kvTPEgO+ohvZsddC2C/Ri6XbmW0Zs7R6+SK?=
 =?us-ascii?Q?r1royp02jUQq80MP9jCtYqv9oJpV6OkLnphHu8p4yitUWTdUFTf6M+W8NLbt?=
 =?us-ascii?Q?thd1miTWneSsitpWUMLQpDur433q0E1z1e8lWDdjMghq4s/XQJhohwaF/QmH?=
 =?us-ascii?Q?kN1Sypknzc8hIyBvLCTilAYTg9HtcfoS0sKyMv3bAfnzPwO6m8YE11dMViNo?=
 =?us-ascii?Q?ZLFE4zPXYtCl3l6+Z/4Cu3JQCDEla4zcPkI1JlR9MlQPT2Gj9QeF22n6GmOh?=
 =?us-ascii?Q?IYtr6SWu0bdqACLfU84XttYH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc50d49e-7e99-4c63-89a0-08d96bbcba0d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 13:47:37.3964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eriV2owJm6T1opE6FhYInb1mrYeFizPsvco9+DdJd0bCj/sKJQKIEUVkXJnVQf4Nyb97yd3dTeEShEoIGOowjDq4bbDOLfc5M/jOgM3lqzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1661
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10091
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108300097
X-Proofpoint-ORIG-GUID: -SM7dnoPIhS_f6OzjmGn7EqEwbFyVxez
X-Proofpoint-GUID: -SM7dnoPIhS_f6OzjmGn7EqEwbFyVxez
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

On Mon, Aug 30, 2021 at 10:37:31PM +0900, Tetsuo Handa wrote:
> On 2021/08/30 22:00, Dan Carpenter wrote:
> >>> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> >>> index e2757ff1c23d..e483a3f5fd47 100644
> >>> --- a/drivers/video/fbdev/vga16fb.c
> >>> +++ b/drivers/video/fbdev/vga16fb.c
> >>> @@ -403,7 +403,7 @@ static int vga16fb_check_var(struct fb_var_screeninfo *var,
> >>>
> >>>         if (yres > vyres)
> >>>                 vyres = yres;
> >>> -       if (vxres * vyres > maxmem) {
> >>> +       if ((u64) vxres * vyres > (u64) maxmem) {
> >>
> >> Mindlessly changing the sizes is not the solution.
> >> Please use e.g. the array_size() helper from <linux/overflow.h>
> >> instead.
> > 
> > On a 64bit system the array_size() macro is going to do the exact same
> > casts?  But I do think this code would be easier to understand if the
> > integer overflow check were pull out separately and done first:
> > 
> > 	if (array_size(vxres, vyres) >= UINT_MAX)
> > 		return -EINVAL;
> 
> This is wrong. array_size() returns ULONG_MAX on 64bits upon overflow and
> returns UINT_MAX on 32bits upon overflow. However, UINT_MAX is a valid
> value without overflow (e.g. vxres == UINT_MAX / 15 && vyres == 15).

Huh...  I just assumed we didn't allow resolutions that high.

> Comparing like "> (u64) UINT_MAX" is to detect only overflow.
> 

Of course, that doesn't work on 32 bit systems.  Also the cast isn't
required because of type promotion.

regards,
dan carpenter

