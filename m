Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 877F4589DE2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Aug 2022 16:50:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F8D29A7B4;
	Thu,  4 Aug 2022 14:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253E418A523
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Aug 2022 14:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRRUEKC4men3xhsKO+vWRLeHcOAjC75lQ5C2FJKXQ9cdJkU4ZTQdveSgqrqkatCtjbBlKpyGho6lA3spyrcht07cksa6JmHsb/bvt1VvKR5xX/suqHlpSz/ilwllAOkmbrmsyqI7iyrTgtO2C+HiiL0MlVPDOCo4lWcSdf+BOvWov8lzwXMBrYRtnHW8thylVuWSBlJgbcaziM5WFI7dlkxRt8AEfo1BdSlVeyPzRGTRDNdjoibxYAW4UsGlKJ6wJZhoW+QD+OyOm3rAZKwBsrpdHf/zZ8I260wsb2mO5gAh+iQOTteTBNuoZdNdoOyti3ZK8Prw670RCGdK600w6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVBcRVAx9X1uPZPiQV5Rqd5dySwPvCS21UiFAXXVZWA=;
 b=UAzXegfOpu6V0vjsIYdEAqOKvDJPO8e4rvQbFDnFWfky1E854R7K+dxCmkSDVQXE9RhgJBEDq4BxZYIvCK1dJBJqFnnyZQ/tesor1iFrWrsMCGPQg+vnE4TQ8fwcV54CKOrBmSaGuoLrptj4p8mrtSBzGtdrn2gZFT6If3nxsqNukNpu8+K76RrGU7aoLKR2HcT7iSyp4rmAzCXU/TljZNinYg3tWiITz+aroXoB/52WSqyf8leB5sLVIt9jPyqc18bD8+5/Zafj+P5CYvlfBa9D1IqB7Z2Uq2LclVgvArzvC1IbzDpVicn8vjyPye76Lkw6QLeNcUwq+gfBzjK+pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVBcRVAx9X1uPZPiQV5Rqd5dySwPvCS21UiFAXXVZWA=;
 b=YYGULDoGVEQZ2/17KPSwYSscX0oU6cmyx3BoKETUBLcWF0DXtHRTPlYifaC2Y172Zkq9vb5YLuvsRngilXK+RnvhSEI90PBWJI+TNzKApz6Vrqa7nlwFRxeN+6ef2/FYkOc6qmhP72FTo97vSXoK+KXqBtZKYV3Ux2qybD8W6EjQnrkkx6uOFcE0tQO8w9AwY6d94j9gY2NJhsu9ooKXkjZrtp1ZmavPFW6dGU0y8iD/UhBzeysWSQ1lox5F5iB4nyUlxMAggLh6qtOgxlZ4cUx6M4mYEmRAXF0gZA+1ekf6NCZ291sYvFjHGe+ug+MdebmYVPqwa8b7etee8u74Ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by LV2PR12MB5797.namprd12.prod.outlook.com (2603:10b6:408:17b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 14:50:30 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::1a7:7daa:9230:1372%7]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 14:50:30 +0000
Date: Thu, 4 Aug 2022 11:50:29 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: New subsystem for acceleration devices
Message-ID: <YuvctaLwRi+z0Gw4@nvidia.com>
References: <CAFCwf11=9qpNAepL7NL+YAV_QO=Wv6pnWPhKHKAepK3fNn+2Dg@mail.gmail.com>
 <CAPM=9tzWuoWAOjHJdJYVDRjoRq-4wpg2KGiCHjLLd+OfWEh5AQ@mail.gmail.com>
 <CAFCwf12N6DeJAQVjY7PFG50q2m405e=XCCFvHBn1RG65BGbT8w@mail.gmail.com>
 <CAPM=9txSKv_xwZJ6SndtqsdQm6aK1KJVF91dB5Odhc_Xv6Qdrw@mail.gmail.com>
 <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf10CsLgt+_qT7dT=8DVXsL0a=w=uXN6HC=CpP5EfitvLfQ@mail.gmail.com>
X-ClientProxiedBy: MN2PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:208:23a::8) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52fa82fd-9f11-489a-8f58-08da7628ad40
X-MS-TrafficTypeDiagnostic: LV2PR12MB5797:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YzdrC32APWDk2KLpGY5c5zyCgbLJYkBS0iBQcsfWpcEmK911uphlrya2BIGPGHRljo2feCYMhIQVKVz3pOeDfUwtpmFquKhls195ivAZ17U594FlWT46Its9puqVHBgCsMTjXNQUPxTNP5AKB5iCCsQIklAOecuIxyvKT5Y1ooYPA2wn47euFApTN4sj461g818DDiCumpJL4JYuTpPWVz28vNXe5pMFOSvkXSPQrw+UrS8AzUogpMQZZAAeIfxLioGeCFfpkxBZF88wJfei7IOkHzuS4ZOxz7L0PQWG0kyPRNoNIxL20x8b6j0fDwrhljJs5kXi/jjRuHMyMHTskeC0k3VK+sy4aYxuoJooiHKD/Z3umXdEzCHuPuBomBU7IFaTL3U503iWfaG0CVqe4IkUMhSK1pDJWuPxL0+iMmjN2+LBhu4sxTwO4hGdo7DTxPFMNEkYS2LYdhIqyfbA4mdApDMIf0MO0lC2yrKvIltrc2XoKTjBl7Q5tfjPhbUcDi7+vxuHEXvoh9JNIWF74kit+izKa6ugos/fhSR8BEnmI8iAFBkCr9ggkrwK5TE1OxozEkkCfI2Evg28N6Gx0xG1O+QUPUUur39WDU+c0vgbdEXeZE0lWaUHOdAap5FqhpHyuXacLmF+5cMY8QFRLejMKJzQGkptUZtFvAO8Uo4UPosN6fGwcywwFKs4gzbaUUa7dtFWsOl0qRNp/YVY+r8x43wPPIoCouG5nt4Wvy59vH5cOVqygQD+figOQ/V6cqtuRBEZlTwwOo+vHEIFVTWZoYUcpBM7mM0nWRF6q4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(38100700002)(8936002)(186003)(2616005)(4326008)(36756003)(316002)(66556008)(66476007)(6916009)(54906003)(8676002)(66946007)(86362001)(6512007)(6506007)(6486002)(478600001)(2906002)(5660300002)(41300700001)(26005)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vRaHFA8eun9H00hh9xMg09skvdq30ZR7rpUrUVsqL5dcd4idUgNzOlycllMX?=
 =?us-ascii?Q?9UD7VKRa517e7QtzK19Kfe5rMZj+H0X9B1lK562K5M/J+V76lZLXGMRvuS/g?=
 =?us-ascii?Q?ufX1PzMMQUJq3K0g96rDwSykMRksk9LdqNoQ+crMtS1IvL2mBOMoCaD0O2PL?=
 =?us-ascii?Q?nRtM7DvgJz6noK+pg+Uo0VPYHvKHPU5SMtuxZ8LYoo9pPj0eyzhoeb4TKL35?=
 =?us-ascii?Q?JSaeDJfJsTFkQzSdWHFAAZD+B90ctb43UnUdLvMm81nEd8XBdvUbF1FD9PPT?=
 =?us-ascii?Q?QEMxDu0m7DbScZ0tiqlFzqpbKoOwoYVASfb9HIytIct6QE1+xLpqfgFatVjc?=
 =?us-ascii?Q?zWAkHz803VeMl14vpZ+esr+9yqddcXIur9CgdnhT+RD74LAcSoxwh5Ul+RdB?=
 =?us-ascii?Q?XNc1hRFikT/fGbPnUnPYFBRDZ+qdAcFdn6dZdf49mPskWJqoJC5E10RMncRN?=
 =?us-ascii?Q?f7g2lw9eMY6iZUf9YnK3CokhmgSPWbUX5lLCG9umirO5daCAWQXgrIGQf7FU?=
 =?us-ascii?Q?JJ1C5S8PZEEYOGiZb0T2c36KHJRgFo+Tj4qwyYajS0BFAKNrWl9c2kecU73a?=
 =?us-ascii?Q?g9ZBlyYn3O/Tc2GozDP0/69QhES52q6ckokUxUlTqZVyK7Evr5NdQY+a2lrN?=
 =?us-ascii?Q?n+GWomEMmRZ6Q7h8/Fj6leh5vEN5KrW3L1+i+m+rtQ5y+gSsNIn0WO2ZoE5A?=
 =?us-ascii?Q?NUF3P4dp38VLuPNWT8IEqimEVQpL1xsOK5LBwzTtz5bkZs58DlVRoerca72b?=
 =?us-ascii?Q?Ac6fNXdVoIxHxae1NJWwoLXTG1wzATnTNXgyipokD/zfcHNWAtCdQmHv9s0S?=
 =?us-ascii?Q?ynAhI+URErmQ53nrlui5xY4jgrLPjYctkDSkrBUCWX7ib1Y7dQf1Azt3tG3R?=
 =?us-ascii?Q?1pJrDXsX4+o1osh56m7rvSePufbnZpDvvfNSBw+LkT93aAQk+8OCK2HTwlyA?=
 =?us-ascii?Q?OuXxSCMc7DTxae5IWt6mFkaqVrFupgPro0+mTXK011IbfLPqU0SUkftGwRpG?=
 =?us-ascii?Q?dq+HmJjTJazFbo8H0rdER9A9Ol6cT/VusJSgBv28aQsDR7VdhXNr5oWVDbU+?=
 =?us-ascii?Q?K92CA2q5JB/H09BNWMNonupQe+se+Z2hbSnBFtCeIfuO9ODcrEGzXTH3sKYh?=
 =?us-ascii?Q?Qrw8d5RwjkjRmJGDi3og0PNAU7ZLAEh3sHldipjbg5ZjT5OfH0toqClm8YcS?=
 =?us-ascii?Q?toqwyb+Hxk9HYBjGuP1dZQNr/ipjOTiChY3NfF8g4ll8KKDtiR4KZc2sdTrx?=
 =?us-ascii?Q?j3owilGVxlhzePREhh4sJwxgDodvMAfseO39wJf1A6+7HPj5Z6+dYZROXtj0?=
 =?us-ascii?Q?QSPuwa/yjVj3ztRgZNgt9NqsSFRPDksBBBbsNFnthVkVnx1S5SBS4zqPtKCD?=
 =?us-ascii?Q?FpgUEwpinqgsT/Xlwc/Ivn1x/9ijQTGAIsRZclYWLd4UKPyTawxq17TI0foY?=
 =?us-ascii?Q?WQiSrnEI+eQstS5gCMovQNl2Ajjow/ZUC/a65KgG3B7CZAzbVpiCKlJ8Gg5R?=
 =?us-ascii?Q?L960dMnKlru5VXzERfQKk2XQ9LXV0iCuL0u1uVanyd59fZelZt9w039vaX0e?=
 =?us-ascii?Q?WLUT3BU3OhYejX62oQT077OfM8CjSEY6FcZB9eJT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fa82fd-9f11-489a-8f58-08da7628ad40
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 14:50:30.6160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzUMDY1SMTr4qcm5NYmFlja4S6KaVGOFsFLr+TzP+LElg2+a8UJq4drZxM4RfZrK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5797
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiho Chu <jiho.chu@samsung.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 04, 2022 at 10:43:42AM +0300, Oded Gabbay wrote:

> After all, memory management services, or common device chars handling
> I can get from other subsystems (e.g. rdma) as well. I'm sure I could
> model my uAPI to be rdma uAPI compliant (I can define proprietary uAPI
> there as well), but this doesn't mean I belong there, right ?

You sure can, but there is still an expectation, eg in RDMA, that your
device has a similarity to the established standards (like roce in
habana's case) that RDMA is geared to support.

I think the the most important thing to establish a new subsystem is
to actually identify what commonalities it is supposed to be
providing. Usually this is driven by some standards body, but the
AI/ML space hasn't gone in that direction at all yet.

We don't need a "subsystem" to have a bunch of drivers expose chardevs
with completely unique ioctls.

The flip is true of DRM - DRM is pretty general. I bet I could
implement an RDMA device under DRM - but that doesn't mean it should
be done.

My biggest concern is that this subsystem not turn into a back door
for a bunch of abuse of kernel APIs going forward. Though things are
better now, we still see this in DRM where expediency or performance
justifies hacky shortcuts instead of good in-kernel architecture. At
least DRM has reliable and experienced review these days.

Jason
