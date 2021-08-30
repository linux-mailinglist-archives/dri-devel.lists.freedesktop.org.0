Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2B53FB841
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 16:30:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262EB89E43;
	Mon, 30 Aug 2021 14:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0625689E43
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 14:30:06 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17UE4EYq030340; 
 Mon, 30 Aug 2021 14:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=BvX8GxFYXmDTzfgva5O6yq8cGXYgg0pTGTojZ3H+Q7g=;
 b=SqQKXR987L5hPTNEijcToXpkFw9rsHEVq/QBMzR9kuSC0nqSI34E3VZ/q2vF2yiAO+zG
 GDHHdYZmE74GpAeOMPh/MCeiwI4x8CPUUnwwBi+3LGxPqrzu84Bun+0x96rkadBl6bHX
 3eWAGzJ3+V6gFAlC/Sy1wgkI0g2GuATW/g7MGPIwloiUdy658pqstLFrhGyQz05GZABW
 AR6nBk82SMLWzbZsCGkptb8pwZOzZvwcd9oM8cWta/tJR1abf68ujifmuZ1uNfYGGnbd
 ynXEmwKoxuUA8ND1OMvtZllFlXCgcxi24efiwPY7Z8+DxgIn2QmpwezDLigRfyIp0hor Og== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=BvX8GxFYXmDTzfgva5O6yq8cGXYgg0pTGTojZ3H+Q7g=;
 b=aZW6zI55NppC4ywY+oMTNhhrV8koNSVj1iSpL00lbJDJpr+yI+84+TfkpAl2lku5aiyo
 HwtOogcN4Z2YdEZUq86ZOj6RQK+0iYmGby2zvVnRfziHtCB7w8WC5FJJXmiZIXzs9O4u
 KdjbbyJ6pgVjKbFgTC+YlTEbB2Txm2GBb446/+jQWPNE2AJWexHM3l1g1GthmJXVfUOy
 fdM+qqh9A6kKEgBAdD6C77Sc4T+xlzxDacfTAhXqbX1hO3YFhAm2yCqFUD/drrtcd+mR
 XeGr/aWL2ta7AAZ5mceKxVP1rxnXAQMGpFHtY/ep2alK/gh4g4J4iDKfhyOjYk13VyOg wg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3arbxwhpxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 14:29:54 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17UEA9JA162519;
 Mon, 30 Aug 2021 14:29:53 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by userp3030.oracle.com with ESMTP id 3arpf2eaqg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Aug 2021 14:29:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U88Sw2YUna9fwYuzBzeks0+5J0OT4pKj6duCLnxLEPr2io7zQnb32Xr5VbzuYqHDlkOZizhfIiD+3LHdNayxjlDXQG9JhvtJkraSo0HYD/uxGZJavJ+nDA2W+Ik7oaroNYNyJSPvESYK2hA+3q7Euf/Guza4I3bFNcwKpheEQ5NsDwLDyqSS+kZtGqFeD3hrupDC7SeqpyHHNFkcntqz76HvWqKShKIX/s0+5HwATOVTZL3YK0TcKBM9ytXZVNSUw5vofgiRZTcGn+awMg807eVg0+ZdTHdIfm2725B6j59evt3URlvFyd4kP9dt9i/zADHxz5IlWlV2uY8NEdXbjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvX8GxFYXmDTzfgva5O6yq8cGXYgg0pTGTojZ3H+Q7g=;
 b=duhTbDMI07/4F7LkIAHxbknZD2m3fVp8114raV0bHLFdKyj06WEgQBsXST85Lloh0dUET5OmA5HfPXvPEIyATPATwyyBp9KA/H4TwbyHrr8aYtiqiJJbn9VEZT+BePmK/QVat1Sp1SMCIGr+FJg53eCx2ibv2zmrKpES8vN8goUwFwryH5s8A5c+wFGMqeeg/2rPKD5drmK/78/oXS1BJgvKye9cdImf0Lx1dMU6fHFG38QLvsJnlmRB5FD9v7i8GnSKfNnIMTPx6XRRti7YtTix2xJr3fI4WV19zbi9ERRxyQ1NcP8wXdhRTMYGS7oPBU7KTgdQB6KrmBmer+omIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvX8GxFYXmDTzfgva5O6yq8cGXYgg0pTGTojZ3H+Q7g=;
 b=y4ECVGzJKlKoVCrvs2QRU3nDf5jP37fxVTE0jxJIBELU1hYYa7rSMRz8pljIi1e7gXjkZOLtETzyof9GMIXH1lqMBW/yHcofJFjErONgNn0FFfeX+fgRvKF6W+JjvbKKxfsPAO2IMZilHQOmZk2Usf3S1SehZUIf+sKF9Ul9scg=
Authentication-Results: i-love.sakura.ne.jp; dkim=none (message not signed)
 header.d=none;i-love.sakura.ne.jp; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4721.namprd10.prod.outlook.com
 (2603:10b6:303:9b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Mon, 30 Aug
 2021 14:29:51 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 14:29:51 +0000
Date: Mon, 30 Aug 2021 17:29:32 +0300
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
Message-ID: <20210830142932.GJ12231@kadam>
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <CAMuHMdV=xVhEHLEoYt3OF+kmGrLOr6t7SP1sghSmp9JqXD+3Og@mail.gmail.com>
 <20210830130000.GW7722@kadam>
 <8ed0ca59-226b-2d0e-b1ae-82305202558d@i-love.sakura.ne.jp>
 <20210830134719.GI12231@kadam>
 <03d0f549-9731-8b06-1393-60d4bef27884@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03d0f549-9731-8b06-1393-60d4bef27884@i-love.sakura.ne.jp>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0050.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::10)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (62.8.83.99) by JNAP275CA0050.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:4e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21 via Frontend
 Transport; Mon, 30 Aug 2021 14:29:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b47e5125-c09b-4b0b-37dc-08d96bc2a066
X-MS-TrafficTypeDiagnostic: CO1PR10MB4721:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB472155E4C11A64E8EC670BEF8ECB9@CO1PR10MB4721.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEFC4Aj3DbcFtzYTwZCLrgz2KZdrHO1iRlRaxsXE87w3N7Aid3uEcb9DiC8DCRPaecVby10ZQOtl+Fzo3VRjVL2YjFjCkhhVwVWRnPOU5k73e7vf0FcsuMs1c5HQq9G3MAWb3EQULSEzLKeMnfzOf4yiURcl67Gh0+O3+70zgcdl5SuaJ5cYKxGEcryrGYjYAHzxY34YiM+uKj4M1/IEnXp4673DmPsJ5WJ0FFSnRLeRhItt3xU2LBTjUkAjtc8PwWyW5tgiTntOk7VVnj1bl5jue740t2CyV3zlfKKwRRWNUP2AT+g4RrsmBs4p6aqOpSC6gpj59Cv8bSNta3cATT9qmLbHQ1KVDZCOMxUJ0PfeiETaW5pIJ18wyIIirWnleRMOMy23lo1JGQl7JRVd8N4OUxloXm+FxohkVaejb9EtJs78KQSlqh1+Q4v9YoIXu+rcet31IhbhkY2ie+DhVM/TEWua+QgtDwdYg4oKmMAe8akdko+daBJSB4q1TrkYTJNYVADuFwXArSzyj2Z63Hb2rUIU8YMuENLArUUvyyeZ1agmoBc6Z9Zz+efT5JOu0ch4IDULFUDuavqd1F1c3+qn4CeeyD11XPdvTShrQ82joofmcqxNNyj1WR4qSJ6Ae3zgaOGNiKP5qNJkmXOr1IpmT93vepxtMRz45SOeVo4Vmm+mqyWV5ZWGLckT8bYK9jOKPrwRcHoiEbND81uN5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(396003)(39860400002)(366004)(376002)(7416002)(66476007)(478600001)(33716001)(33656002)(54906003)(66946007)(8676002)(83380400001)(38350700002)(1076003)(186003)(5660300002)(4326008)(6666004)(2906002)(38100700002)(956004)(6916009)(9686003)(8936002)(86362001)(44832011)(6496006)(26005)(316002)(9576002)(52116002)(66556008)(55016002)(53546011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MYv6v6OpNivjfrQzAPS8GWxwiIM0TBABbCwPV0YZZ5oVZHqko9IB1ZxAB+jh?=
 =?us-ascii?Q?RsHEeRCb0547T3MLitE9pZf55S7HXy1MAHsTCtuKmX58xZ6NyGVcFcIwAZAT?=
 =?us-ascii?Q?GJGkYDFAcN4l3Hu2l1Kuq7AdB/79txY8ikT70ELybTk0d3attKsGsgFSGvcD?=
 =?us-ascii?Q?m1trIDNYvloqSQr3pCv22sheu7zmx4qEB72ceHQ/RrOknH/zNWE8texCzFCJ?=
 =?us-ascii?Q?YoQFavONU/dVkE0HNtUl3WT4P3p4FQkzSw+D8NNyu4lh0eML7CXCc+twkt0X?=
 =?us-ascii?Q?RQAPmwKe62fsHo0s5oYXWCsqA0imsv+zA/evF9FJ5SnK0bQtt8pVNXgF+kNo?=
 =?us-ascii?Q?0842EgR7TY/JFG8nkHvxzRC0oaA880C3LkdUPUdav2D1hoYFdDUYSSTYs6wD?=
 =?us-ascii?Q?mGHdbSiZ09MFjoDrqjzza6rLCuf5EFHrLXENsVjLYp/fC6inaVv1iYmpQ472?=
 =?us-ascii?Q?E/qwDKtaJzlKtxyEQwHdaLACS4/n6dS/mx2mE5WcM74F65b4eswI657Kn/TB?=
 =?us-ascii?Q?i150jDLIpeU7PvfyyRzatSPZWR2CWA/w/YoALIq1/HKb7uyY1r3mZR/H+EF0?=
 =?us-ascii?Q?zhP05YwzznOzMfa6lzQR9knhFngHKIVN28VrX/enKt4bQNkL64M55DCiHUEG?=
 =?us-ascii?Q?kf8ukACGjhVq+8LElkog4bCVa7D9t5EBShZiBH4M8J3xS2CQxphdu7NL3Qgj?=
 =?us-ascii?Q?arVSJbUq1NXrmnAUjsS7fHcb7KS9vaDDXbRTdwaKntqH93Q5gRbKEX1H40Sz?=
 =?us-ascii?Q?2WcQOPxCxf4E7v+LHhICcpG2L78nimDlsADMZI6we/sv4xSf6P+X2vHSYqNV?=
 =?us-ascii?Q?ESqSmXK6hgcFuTv9llpkrMuRH5xq6czJfYaZHXYDdgo69d7piyWlLqp0fsU/?=
 =?us-ascii?Q?z3LWbEV1Miu/rRkcaVHfEbEa9Ququ6D7WvVpvXY+2hF4iPvoZk0yjHdLeI6c?=
 =?us-ascii?Q?TGqHgGFL1HB3LqLc1A8nk193Q75ZGdjV18aVC28VtSJT9TD9tgFB5ln/Nocf?=
 =?us-ascii?Q?3piJY3yy290Wk6ct46qc9tlLe4UVWmkhf/7edOHYV5i268FcTnCmFC6Alfp5?=
 =?us-ascii?Q?31SCQy0WmrQKKjCNf9RfVSKXVtf6TOJ3uoQ2oU1wjgW5dhCiYdmei9kzPLdg?=
 =?us-ascii?Q?Qcm48UdXSc1bOCFk2V/Bw9wBftE1mUUbUWR4mjmwIWQQ/hbh1Vp1IX7aNLXx?=
 =?us-ascii?Q?iEFa8u5hcBjJH2Wa8HjzAD53EMOq3FM5atXTZ2nDm5vKet0ajUMTjm3536cw?=
 =?us-ascii?Q?D60Haz+hx+qQ3R0xGinIsMpjARy4hxJMPpsC9SByQtxiMsobpoIYrWkfgpWe?=
 =?us-ascii?Q?ICncbajxPrts+aTGgawvr+G8?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b47e5125-c09b-4b0b-37dc-08d96bc2a066
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 14:29:51.2848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLEtK8xzLMB/AW5z8jwCz1h0Dn8s9QDNSRTlXWBFh27ofEQKAPFv2ziTa23l0KqiVgcQnHHlYLW1HG1on0qc+EqxWwkas9/9Qe8XgI9BeQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4721
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10092
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108300101
X-Proofpoint-ORIG-GUID: fTIA_0Lgv34BE2MwUYEjntPerMfy16xQ
X-Proofpoint-GUID: fTIA_0Lgv34BE2MwUYEjntPerMfy16xQ
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

On Mon, Aug 30, 2021 at 11:25:51PM +0900, Tetsuo Handa wrote:
> On 2021/08/30 22:47, Dan Carpenter wrote:
> > On Mon, Aug 30, 2021 at 10:37:31PM +0900, Tetsuo Handa wrote:
> >> On 2021/08/30 22:00, Dan Carpenter wrote:
> >>>>> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> >>>>> index e2757ff1c23d..e483a3f5fd47 100644
> >>>>> --- a/drivers/video/fbdev/vga16fb.c
> >>>>> +++ b/drivers/video/fbdev/vga16fb.c
> >>>>> @@ -403,7 +403,7 @@ static int vga16fb_check_var(struct fb_var_screeninfo *var,
> >>>>>
> >>>>>         if (yres > vyres)
> >>>>>                 vyres = yres;
> >>>>> -       if (vxres * vyres > maxmem) {
> >>>>> +       if ((u64) vxres * vyres > (u64) maxmem) {
> >>>>
> >>>> Mindlessly changing the sizes is not the solution.
> >>>> Please use e.g. the array_size() helper from <linux/overflow.h>
> >>>> instead.
> >>>
> >>> On a 64bit system the array_size() macro is going to do the exact same
> >>> casts?  But I do think this code would be easier to understand if the
> >>> integer overflow check were pull out separately and done first:
> >>>
> >>> 	if (array_size(vxres, vyres) >= UINT_MAX)
> >>> 		return -EINVAL;
> >>
> >> This is wrong. array_size() returns ULONG_MAX on 64bits upon overflow and
> >> returns UINT_MAX on 32bits upon overflow. However, UINT_MAX is a valid
> >> value without overflow (e.g. vxres == UINT_MAX / 15 && vyres == 15).
> > 
> > Huh...  I just assumed we didn't allow resolutions that high.
> 
> Of course, we don't allow resolutions that high. ;-)
> 
> Since I don't know possible max resolutions, I chose UINT_MAX + 1 as a common
> limit for returning -EINVAL. Unless overflow happens, vga16fb_check_var() will
> return -ENOMEM on such high resolutions.
> 
> > 
> >> Comparing like "> (u64) UINT_MAX" is to detect only overflow.
> >>
> > 
> > Of course, that doesn't work on 32 bit systems.  Also the cast isn't
> > required because of type promotion.
> 
> Indeed, "> UINT_MAX" seems to work on both 32bits and 64bits.

Sorry, for the confusion.  I'm talking about array_size() which is
size_t.  Your approach using unsigned long long works.

regards,
dan carpenter

