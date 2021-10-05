Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2B7421ECA
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 08:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431CC6E2E1;
	Tue,  5 Oct 2021 06:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A18026E2E1;
 Tue,  5 Oct 2021 06:20:13 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1954O5m9004481; 
 Tue, 5 Oct 2021 06:20:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=+1gSucbGLsVXYE76HSCGfaTKUWSNLjRzudivh6zbnfM=;
 b=AK5P40r2iqP0Yy8oIwcgFRB4JK4Ou6D7j5l9u3cfsTTPgrGAxRt2kNer9Nxrc58RE7Ti
 3cya2KsqMuYWFQvNmBdmHx+AWuVRyBIwZmilXW6kSHmfg2SS/nUJz9NRl5igSmtG4EiW
 3mDfXj+YIendw2ECEucYL3Y/HSWzW7zNRRFYzlF6UOZrZq4Iz/L2lv2T8vVN+7GrnMhB
 IEJx03F9oO/AmM3qeBfFIhcIhKhjKekLi8aSYD18TI1MqGk7XS9KUpTZMJP5uRnZuxPS
 36uxey9Tbvs/SM8/eJsvzTJ3sLzZ4qOpfZbKgxLxs4NYwziEIMD5aBXCqGvG0u0+RtWn 8w== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg43dvktv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 06:20:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1956Adjn035989;
 Tue, 5 Oct 2021 06:20:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
 by userp3020.oracle.com with ESMTP id 3bf16sh3ce-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Oct 2021 06:20:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YOpOUS5oibb6fIB6Q0yfsz5576pVu15/zUNkpXDsf/dHEagQ9RqNGBiGFHWnPpVpZ9BCLNQb56xTQyWjT/J3lVRZ16MVogC9PVamjNY+Tg9QdBsaT9w7GAnQnxfsUgcsZsXOvC8m1Ed/mfB+tMcF1JYezlaxXiclFdqkGcIJYSIixPpr5YQpcG9NGgPAYhmWlvJCgJJ0mnI60KI8euKT4AsEytuAXbEr0ALQ8gVzH19WRwAL8aPFfIOUX9jETMXMXlro8Dt6iH36Ldjs2XzKBn+CURMeGYa95EcMf15W9ntWInR+NtiSllHrONX/k1Z4lVkmgDjDaIElYVb+cusnxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1gSucbGLsVXYE76HSCGfaTKUWSNLjRzudivh6zbnfM=;
 b=bYkXR9DWW+o8OGDU8FnUkKTNrrOSTekM0EY4y72JXPjl+GdOEpO9BXXYwVrzOFzDsYhOtubc21ZOpU8JpT4YG/qEAC48JRkyelZbzyGAzsYvAgVppwSwWHidjdwXq0aZr084RRAvczdgNEBv3xovsvk5V+9cqCeVWOTKNzQm5lkDwlff2yYqtgyCrH8b8ddPmniB79KT44zpeGQe4DIspQiCYzAX5fHgYKk4JmAs4GAbAG5SRxIcqOT9tJko9A8TUH9wSfUaCkB+aonUKMWCdtz1bOFJKNEOJn59JnJsBfY5cDm7KEr2zku9voMoWiBfIXMVUeH9EMEb2/cNHu2kNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1gSucbGLsVXYE76HSCGfaTKUWSNLjRzudivh6zbnfM=;
 b=fQLEI9e4qo8SYgGLt4W6x2yd4V9wCqaH3/OmHNxxHeTrO33HhEsmd93ZtdNAucXro7068yUDgtU+qd546j3hRls6jUFkmk5LnDxa5tibaX3EVDQetKjb7eTpuMxVPJIoXfthT05B7ZlmM0gQ1nXKRT2HGOUq6Rvw3XUEbqyvRPw=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5554.namprd10.prod.outlook.com
 (2603:10b6:303:141::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Tue, 5 Oct
 2021 06:19:58 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Tue, 5 Oct 2021
 06:19:58 +0000
Date: Tue, 5 Oct 2021 09:19:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Andrzej Hajda <a.hajda@samsung.com>, intel-gfx@lists.freedesktop.org,
 "Sarvela, Tomi P" <tomi.p.sarvela@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: remove IS_ACTIVE
Message-ID: <20211005061939.GF2083@kadam>
References: <20211001074041.2076538-1-lucas.demarchi@intel.com>
 <163308055415.8412.14215483004176995847@build.alporthouse.com>
 <87bl49t6di.fsf@intel.com>
 <20211004205227.xpx67yawrs23gzr2@ldmartin-desk2>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004205227.xpx67yawrs23gzr2@ldmartin-desk2>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0022.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::34)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JN2P275CA0022.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:0:3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 5 Oct 2021 06:19:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf98b384-44af-4bf5-bf51-08d987c827e9
X-MS-TrafficTypeDiagnostic: CO6PR10MB5554:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5554DF05D14F319BEB5F000B8EAF9@CO6PR10MB5554.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8m3LDzkkH+tRZ/Jj2F5lZ+XV6zquZSmQ0QQ1/b61GJ1B3cy5vdv6jDk5MJwyiy/A3fVVnOOxafmx+J+IOtyXN4jF/gv/9/+Bo3UXCtLp2rlJAl2htKAn1fMboUqSHatpgqTzq5DN21Jaud2JmJwJef4jkPyiOPmLkJSh/bKQHJ5Z8SlvaT3zpr4QleXA9ILtmwrB/l6PpVN+ch46C7uYosF8e1enRy8HnNkGFroT3wu+p9gdMAnBAcq/hZ/O1k5neEyS+RqHTToguJRoL2bdqcToCC86fTnZ6DxGfzqc70u0MglUxFBxNIsLMtKfT1BsUIMV3RHAfj9QuGCVNf+befvnvDlFnEtD2WM0juak/KmmvjlT2hQI67gRSBF77ACJrw08PzAPzPzmr1ZyachKit2ZkDQ0AlKn6XTwjGGP9xDRrZJTWDwer8aWS+W6P552JKTYEIT468OFqTUw2nHbe/uwWQn4cvYovSaZ5P2zWuAGG5JSXbkNy6pUpTGk8MSS5gWgdaUQCPegMJ1POOkMjDQPQlbxNHVOzjvC3p+1FYva+cmUniY2PKZsFlXhyXwH7zU7hCUiWKlRkudwdA/BuySzaF99HM2CNqFtMKUyPXJyfkyUAsPrnINd08AU4NIiYy8Am8Utung/ZhEV6pFKZbE53lcLzDJpd8gcfmFCgwHRfXO63++6SSZXrHgs7PdxuJt+ebhrtopzUFk2hU6TEO0DBcnopwCAvRNU+kFhkY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33656002)(9576002)(86362001)(26005)(55016002)(186003)(66476007)(1076003)(4326008)(5660300002)(44832011)(6916009)(66946007)(66556008)(8676002)(6496006)(6666004)(9686003)(52116002)(508600001)(956004)(33716001)(316002)(54906003)(38350700002)(38100700002)(2906002)(83380400001)(8936002)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XAAhduuhWAL7Kohcdlb+MFEvSW7a/FpP9GSERHoQ18JxwIR6B/TPrALwg4vb?=
 =?us-ascii?Q?rV7korv0e9CYMesWCIS9zFWa6ImD7buIJxOjnvJlfvutuGeBPGrk58/P8Elx?=
 =?us-ascii?Q?0lbtrbPR2qLFzE1d3kHSoaJ1NvCv7mSQSYEBAnnxg2BrNgUwvit1tRoeO748?=
 =?us-ascii?Q?RDykGzihNxa02bntA/f5FiDFE6UnvJvUXZ3344mFb4xcswrICUqa6+13QmMo?=
 =?us-ascii?Q?MfxVcNLQFzSvvaAnXWMzxfLMyRfNxMHFxLLMF5MjgkKRVVE6H4wAqbnu2EXG?=
 =?us-ascii?Q?fhhQkF0xaxACLwoCxM4RVj/AAoSvUNQQBfYeqlUVD/I2eKQiMs9mt3UW0n6K?=
 =?us-ascii?Q?FOYzhSU9VR9gNap+lx0o9KvgG9LHJ+U6TnTao7NvKTueGtHfEz5d0e25WqNl?=
 =?us-ascii?Q?7x9Uxfn2A7iR3iy4nAasF1t+RJXY+IEwdeq7fJLbenWjJpTOAqMc4b53KrUO?=
 =?us-ascii?Q?SYQO8sEDYEaQUhenQUpByKieZdBVcVRa6mzce9TnZ8EzExXvf6jEC5L6LDTh?=
 =?us-ascii?Q?fyqL2/yZG3FyrKtrSY1QhNadqMUNfeFw1i69YGMK2j0stgUypDTD2YLG/LVV?=
 =?us-ascii?Q?LuHfQvMvCbiT09DwIW0UXGKtTSaFWDd3NMW5wqCA3NwmQJAqSsVm8dyLlI8+?=
 =?us-ascii?Q?gaF46tDaPA7McGRTmrrYjOq01WUqaBtP4C8DUDGswOqpV8N5ydqjDadlNuT6?=
 =?us-ascii?Q?3h934rFAE6GlzpIfaLCnt5aVeGKuJEzw7wQyxNpdg4UpJRHGF51yKmo7uc0+?=
 =?us-ascii?Q?wXKLaiz4klL99kO47+rD565VCZovu5vbgdAk24AvLjmBlVH638j8AVV3GOlY?=
 =?us-ascii?Q?t5kIZmUs9uhPrsaxQ8Pw6mmaziwEh/TyGVubzI6ZgCUfQ+ZO4jba2zR3ELpZ?=
 =?us-ascii?Q?QHzHurqz0ab6w1+9OD/Gq3jO12+XhcmQob9YcbRcRvCOAVutGPjdCgRFrU2o?=
 =?us-ascii?Q?JkYw8pN94pCa/k5kbsnftOpt2tdbeGPq3CUqHrCipznJNNPkxBlKK9apTXdJ?=
 =?us-ascii?Q?bo6Ig4CAXg15qtsZ9tcZ0O6HSKoOxZ6eElV2CojpHwnunFnmmH4ww9K2Dovx?=
 =?us-ascii?Q?opnaSzbkqA6RKlXZIcRg5IHKWsF0EzyBnFX9dOulqQbsC9bPEDXRLF/IEkML?=
 =?us-ascii?Q?lvf2IoI3LQj1g721bEH9M8ZMCDX01PTFZrCZfFLetlmrE6n7tO/UzeoWJb1c?=
 =?us-ascii?Q?jyPSDgsrLxbRcgPpjnYnzH+tMeB1T5WOg1kuCPeA4DkTli9GV2Ow61fpyDtA?=
 =?us-ascii?Q?RTQC6og5pIWSanzftLASnW+HBdGnZwLx3Fg6ScdnDt6A0X8Ajf8hnOOLu/9Y?=
 =?us-ascii?Q?ZHRAR0RbiFasKZj2tPnyO8Lv?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf98b384-44af-4bf5-bf51-08d987c827e9
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 06:19:58.4134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j76tDaGkFWa5j0XPJTM35sURTLWuL002DSe8d0DXEJIwoaZeVvJGK17tc2sjYYhzjkzSUkZpwziQHReIzOy6WZn4B4CTpqtrDnJgIp8765k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5554
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10127
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110050034
X-Proofpoint-GUID: RinzrOQD5Ha8P-lwYoNXB6z0-p_XI_r0
X-Proofpoint-ORIG-GUID: RinzrOQD5Ha8P-lwYoNXB6z0-p_XI_r0
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

On Mon, Oct 04, 2021 at 01:52:27PM -0700, Lucas De Marchi wrote:
> Cc'ing Dan Carpenter
> 
> On Fri, Oct 01, 2021 at 12:57:13PM +0300, Jani Nikula wrote:
> > On Fri, 01 Oct 2021, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> > > Quoting Lucas De Marchi (2021-10-01 08:40:41)
> > > > When trying to bring IS_ACTIVE to linux/kconfig.h I thought it wouldn't
> > > > provide much value just encapsulating it in a boolean context. So I also
> > > > added the support for handling undefined macros as the IS_ENABLED()
> > > > counterpart. However the feedback received from Masahiro Yamada was that
> > > > it is too ugly, not providing much value. And just wrapping in a boolean
> > > > context is too dumb - we could simply open code it.
> > > > 
> > > > As detailed in commit babaab2f4738 ("drm/i915: Encapsulate kconfig
> > > > constant values inside boolean predicates"), the IS_ACTIVE macro was
> > > > added to workaround a compilation warning. However after checking again
> > > > our current uses of IS_ACTIVE it turned out there is only
> > > > 1 case in which it would potentially trigger a warning. All the others
> > > >   can simply use the shorter version, without wrapping it in any macro.
> > > > And even that single one didn't trigger any warning in gcc 10.3.
> > > > 
> > > > So here I'm dialing all the way back to simply removing the macro. If it
> > > > triggers warnings in future we may change the few cases to check for > 0
> > > > or != 0. Another possibility would be to use the great "not not
> > > > operator" for all positive checks, which would allow us to maintain
> > > > consistency.  However let's try first the simplest form though, hopefully
> > > > we don't hit broken compilers spitting a warning:
> > > 
> > > You didn't prevent the compilation warning this re-introduces.
> > > 
> > > drivers/gpu/drm/i915/i915_config.c:11 i915_fence_context_timeout() warn: should this be a bitwise op?
> > > drivers/gpu/drm/i915/i915_request.c:1679 i915_request_wait() warn: should this be a bitwise op?
> > 
> > Looks like that's a Smatch warning. The immediate fix would be to just
> > add the != 0 in the relevant places. But this is stuff that's just going
> > to get broken again unless we add Smatch to CI. Most people aren't
> > running it on a regular basis.

I would really prefer that instead of ensuring that code doesn't
generate Smatch warnings, people just look over the warnings and then
mass mark them all as false positives and never look at them again.

It let's us warn about more complicated things without worrying so much
about being perfect.  When code is fresh in your head then warnings are
not a big deal to review and you want to warn about every possible issue
After a year then they take forever and so you really want them to be
correct or it's a huge waste of time.  I'd prefer Smatch live in the
space where people run it when the code is fresh.

You would have received some automated emails about this Smatch warning
but I look over the zero day output and filter the results.

> 
> clang gives a warning only in drivers/gpu/drm/i915/i915_config.c and the
> warning is gone if the condition swapped:
> 
> -	if (context && CONFIG_DRM_I915_FENCE_TIMEOUT)
> +	if (CONFIG_DRM_I915_FENCE_TIMEOUT && context)

I like this rule that when the constant is on the left it's not a mask.
That makes sense.  I will add that.

> 
> which would make sense if we think about shortcutting the if condition.
> However smatch still reports the warning and an additional one
> in drivers/gpu/drm/i915/i915_request.c. The ways I found to stop the
> false positives with smatch are:
> 
> if (context && CONFIG_DRM_I915_FENCE_TIMEOUT != 0)
> or
> if (context && !!CONFIG_DRM_I915_FENCE_TIMEOUT)
> or
> if (context && CONFIG_DRM_I915_FENCE_TIMEOUT > 0)
> 

I guess I prefer the first and third but I'll add the rule that Clang
uses to silence the warning.

regards,
dan carpenter

