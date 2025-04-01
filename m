Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54807A782E5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 21:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9983C10E667;
	Tue,  1 Apr 2025 19:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M8aDVD64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106BB10E667
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 19:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXxiqEY98HHkgZA7ZSPycZ97IGVlBNcWrhtXSjEwvU4Kd/HXjDU6xa7DWwUvVXBp2dvf/mgSAzHabuKt/KtP5g7IPNCa+UH+G+dnpCWpeL9VuBgOVDxo1I8G24q7ijOF7SpDq6JFJu22DymuPGaX3QwoUx9VaFEzTKDxagxoU8Qauxb/rszaqAEux63/EGVq4W33VvQPEHlAPKNP5bkMTHe5m/2/CybZNqaQFJEj3r/iW9/bn98d+LX/NEnIC29Mh5COeSSFHsQ8GbMQFJYvkqvC7ys+yFv3TVl7ThSqLs+jLX6zwL1k4ii+qWBWQXUvV7wGHehO/SsU4o071k0EXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NdhoxNJsHyP5CPa/peXEe2643wlKU33E1ZIlGMiliw=;
 b=FkRWsbhCT+iz8vDoeXFLqUXRWXFJE+xVVeWsZdln6EG8XxssNV+R8Qe0ekP1yRc+0xU+i3jXVBUAxgps+9sCoPd8hEjwvMYfDRiltBQw9XGsEMAh5haiTZRO4eWFM2oh2UyaMY3fTuH1YIVYUmBt5Prg32PDWih89KcMp83/6iZo+xz7BhXE10LTMFUy97FPJRE9bqsDxnBih+m/uVHMAbfVIRDfgkjeQt14C21VW/u7aN32M2crd/IX3B+iRMpCtwCYa0n37yxIl13iQCcHlCim3tSHGp/cqX4dDKIjjSB1Hx/gF/JKBAYZ7Zp2TZ8Wk7grS3FVg5Cvd7gH0zAGRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1NdhoxNJsHyP5CPa/peXEe2643wlKU33E1ZIlGMiliw=;
 b=M8aDVD64VwkCNYm2RKD9VTq7lxfmPaGRHdplwyyiF1izHOBklex1AAWGPn+sTdo2pmw5IvNqGzzzkju1RJQZFJRbAzGVyShDHD5pEMJVLL1BBntkBAGOMroZMmuz17DBkJPHf2p0a6ISg9AnOrCk/o8jv3zyBiYHNx5b1KBllgjpHd6g00/+GsciAvl5W5S3ME5y2uPOEeGHBBxen1lcE5GPEP4iR4JBSygNtLBB/qvF+EaGMStx1Vc0igiTcz2sKRE0g0oqLpS8z6Uw5/N0WbGCJb16FHyQzz60ZVHPhs7ZHRb3THKPrZGNHAiBslPNxmwL5w5mdZz71xxn3YNWTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB9431.namprd12.prod.outlook.com (2603:10b6:610:1c1::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 19:46:50 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 19:46:50 +0000
Date: Tue, 1 Apr 2025 16:46:49 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Airlie <airlied@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.15-rc1
Message-ID: <20250401194649.GE325917@nvidia.com>
References: <CAPM=9tyx=edsZ3ajuAUAv4vjfa=WNEzobqAsYbBTjCfLbuEeFQ@mail.gmail.com>
 <CAHk-=wjcdfrDTjzm6J6T-3fxtVyBG7a_0BXc2=mgOuM6KPFnCg@mail.gmail.com>
 <87h6394i87.fsf@intel.com> <Z-p2ii-N2-dd_HJ6@phenom.ffwll.local>
 <20250331133137.GA263675@nvidia.com> <87tt782htn.fsf@intel.com>
 <CAHk-=wiP0ea7xq2P3ryYs6xGWoqTw1E4jha67ZbJkaFrjqUdkQ@mail.gmail.com>
 <CAK7LNAQThGkgtKgquRPv8Ysi_omedRthF1_++apKda-xWeWcbA@mail.gmail.com>
 <20250401191455.GC325917@nvidia.com> <877c433bys.fsf@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c433bys.fsf@intel.com>
X-ClientProxiedBy: BN9PR03CA0498.namprd03.prod.outlook.com
 (2603:10b6:408:130::23) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB9431:EE_
X-MS-Office365-Filtering-Correlation-Id: efc3ff3d-0ae7-4f3a-cd02-08dd7155f1f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I/VWNRsroPJYSozV9S39IPoLDWSiTMzVFF3fXQvxYrD/jrEmjdsHfkIPdPjF?=
 =?us-ascii?Q?w7tEeCaHy2LgfzHgDIxHJ+u/GIh0UJ6WmRjvNwh+UnFerfCqL2YGSdBbT5p6?=
 =?us-ascii?Q?KfyxlLqP71dHHFh9IM67FOmGPXZ6zfXsrDhZ+ZxZS8074k5nFwn/QVLhf83X?=
 =?us-ascii?Q?dN7KhJdSHrW86Z7/JX/YTxHZR6Qny71xCD17EBJJkNJc7aA8qOdhTqlUUkdb?=
 =?us-ascii?Q?ybTntIHuLOSGed+o1mXr3kec2puzVVOZCmu91342disiAyUI1lhhiJsK78Pt?=
 =?us-ascii?Q?uFWrnYP16HVGYVWNffgnXUYmWaSjIoBTyxsQOJPz+ChNetufDhE+MI9SWTbv?=
 =?us-ascii?Q?JJ8Aq+JE7YvvHwqUFUpEH6aQQxxmKJGQLFCUzPOrcESJ/34XbW1Es8JqnPXd?=
 =?us-ascii?Q?w5hs+U/JaDn4wBd4JsqXXDSYbwVQtI2IXtZTGk4EdR+BYEiTK26voL72OZxZ?=
 =?us-ascii?Q?NLgpfK9sUBXEnQBWWClSDUAq46q628LRef4CXUBMP3YRt6s/JzpL+NPLVLCq?=
 =?us-ascii?Q?orisckniAH09ucdyg45GNjTfY9qSe3Gn6NKLZPv3AQjYr8fXPjJOkeklcOjm?=
 =?us-ascii?Q?4KxdT/bYzJKgwc6q/RtcZxBjoH4MQk0LTT3PByTvXeZczmmbyUlHfZ9Gt/Y8?=
 =?us-ascii?Q?90LP2Y299fZOMFzNff76xm9G0CnusYlECCO4pIx7AbW9lONtswrhz7hIQBmF?=
 =?us-ascii?Q?snmyqSeqxVq9XZr/N/rOlR5hoIa5hfJJXNmlFz+yCxTHfjcWxYa3VgjiBMQ6?=
 =?us-ascii?Q?DkYUX4Qq8Yx1KKwrE2vOehagW0eBFNGv/3bNL9pETEQ5P5Z1VsOsqo8CQE6V?=
 =?us-ascii?Q?KHi8WJjBQsLcBJgiWKX36LEs+m/DitcnXpF0YQZBzTMel8L2EHs8wwF5E7dR?=
 =?us-ascii?Q?2qzoCYcMER2A7LeLRG9WHwONiV08U8Ia2exzXyZfRcRhLNhkLKqUoy1+dIKa?=
 =?us-ascii?Q?xPN3tWDnbN6MEYzbjba/5S5S0OkXYV8mKL5E3dw/HBdniX6NJg1dKEsJJmV1?=
 =?us-ascii?Q?Cd2lwBvSj2SzWz/oZcWacXSzn0BJ+PpuCHKnPSLPZHka+k5EuXDMVGiMV7Dr?=
 =?us-ascii?Q?984Oqc8Ec62sBjQHFOKXJX0EpvI2XICX7xVUvdcOqKshFxOBzCycHWElyKR9?=
 =?us-ascii?Q?UVOgFny9Oyn+FFvLsJ7C4CH9ECUVcnA0tE6IpQvAqIjur2a5cD2oPeY7N2l5?=
 =?us-ascii?Q?BJPSL8jtqs2MW8NBeF5sXXhiJLg+QM+nXgo7xZlC0uCpmly4AuAPDBsDTnmm?=
 =?us-ascii?Q?Y7a6fcQYhCOkYLEfMiFCNrOlk2IhwDpucfLCGTUI85tQa5+CWrvuXfVI6AVE?=
 =?us-ascii?Q?7POE0Dd92udsWcKOZzpEGu/pIUFVLnPxrNCS+m+oUsdayJt7Ms4ypQUjIZpb?=
 =?us-ascii?Q?9NfSvSMZ2Vo8pTSwqtOmAA23SzwG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?36cHUeANp/tym23qIwnNsG3TnciCPC5vJ8iaj50NSsiXOMJ0v0iu5eaMzG97?=
 =?us-ascii?Q?Ow+5nDHt/W/dymldtnaWC8InjsdgaD85HILHf2M+ManKvbuFmSFhg+IrQh/M?=
 =?us-ascii?Q?BtcmqeA0uaNksuXuxPwPvZCPmG1ofS+otJkzY7zQHmWbbHvjfqfJrH8u90k0?=
 =?us-ascii?Q?ZCtxIjsqigwjeAp9VX37P+ByeBabti/P5NsTAG6rwXefGkPOZjB1BU3wsC+S?=
 =?us-ascii?Q?VW8E5gDYRecc5HxirLuKP8B5fH5hnM/bQ9p0+0xVxOyGpJhrT7IflRYDSM5r?=
 =?us-ascii?Q?bqqmpCgHo3CKImtyk9ysIUndOFtnWcMvv9Jk0CdNEvkC2JPyqbt3I7p2vCEy?=
 =?us-ascii?Q?AYv0pryO2XqZQSp5+SyclDB8TNKH5+eoyMOBfQA6/B4pefY8FPPu1vn4PJ3A?=
 =?us-ascii?Q?zrkMs5cqxnQUc+cg8Faxl2y/7Qn8aSIbqeLuAVM7jXIwdq3bT1oChaLmAvKc?=
 =?us-ascii?Q?9KmY+rETJFmt559Q3lYjlcGAShiAGT2C2gnlgE2EmH0DCfZ8TxPgRyx2BocP?=
 =?us-ascii?Q?/qKcVr+0Lys7DNHKXeY52Z0kgBfiZJUBRBfvq6zsKNuOlEvnDLQNfJutw5Lf?=
 =?us-ascii?Q?sSG3A4+Mm3+wPMwbThZo8xFUhDA+6WQcGJWFDJN4DpJ6U58ZmSNfB97dyPbw?=
 =?us-ascii?Q?54M9j8XPtadE0oAg580y6qXhs8cE17rIPBVRygvpQPOo4CHtSA4PdyxkgMg6?=
 =?us-ascii?Q?xB32/Eg5JWPvbEJPpcFOWmhy7bSEhN6nu9aopDz5bpej6HSfApMeanJSF3IN?=
 =?us-ascii?Q?DBjxMqZY8vD4th4gnY1D/qU7u8d9PtILqrFtb7VCPW8fe3rbUnkm5OWoiKVL?=
 =?us-ascii?Q?UGZJq3TbA3uWJswbDloW1SOVq08O5BIm3pr6CFqBGqoCMsocMF6PtJ7aRRZv?=
 =?us-ascii?Q?6UOo3r0F8r6h2lMsDC0LCVJGcR+Fy6TBayiFwaFDFgIXbZVpHv9gMbmbVK/q?=
 =?us-ascii?Q?VnIKOMsl0JzqR3f3JrWtrjyS8qOhJ5pbmd0INOS0sai+g5vNWfBGtMrvatCb?=
 =?us-ascii?Q?43uu8tJS41/EZR7bB7ycg+Nhtbg7S4HIIL8AIJZVqWNlX6K/fNC1Z/DqXnea?=
 =?us-ascii?Q?hgc4hIdzbWoph5MT0wG7gu0Xzv4gMNx9fSpTKz/+bA2tKD2pic0T173DfRwa?=
 =?us-ascii?Q?3gQk4QlJUTMmjaqjMfXL1LMLrIReLt0bmFyNhC+jme65C886IhpbECutcM3N?=
 =?us-ascii?Q?9XUBiL1xbHqplIC77tQDAV2t5/UW7jYgaqQaUjms8HdQCYj6Qd3jxbbc3ipv?=
 =?us-ascii?Q?0gBZ5lmLCIizKyx7o4VPcAuGYz//gjsmL8ad5jZ/uvOswwRdg+8dpB0yaER3?=
 =?us-ascii?Q?Z6UL6rXV5SY2i3SMB4uHz92x/fblt1XFwxaw+1OItH9HklRxXULS6ZYLf+Te?=
 =?us-ascii?Q?4cyOfur29ktX/U1dIvr+0dJX57q9HCzrP5qCcuBS8H64bJ7WMzMIxDzBTeS3?=
 =?us-ascii?Q?Tl91Xuk6Ca88l1y2QbRw8TmNmT3wJCj2WzrY3oQQ+RCAaOGfAgYawBLJ2kEQ?=
 =?us-ascii?Q?Wf3sb7BFY1gDT02SrXvCeF36OOKg+TQ9YISzQYjiqCpFycSBv0JiaoyOKb0N?=
 =?us-ascii?Q?p2P+Csw2ewz1qG1SWYo0ZyJgcxI2hK1YEMTilTpL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc3ff3d-0ae7-4f3a-cd02-08dd7155f1f3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 19:46:50.3649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbKv2+Gs5KH9kKsgVpSukxU3zNVobRMezCGHBwUX6i0f3YdLaJMWErib5NXJChJ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9431
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

On Tue, Apr 01, 2025 at 10:42:35PM +0300, Jani Nikula wrote:
> On Tue, 01 Apr 2025, Jason Gunthorpe <jgg@nvidia.com> wrote:
> > So, I'd suggest a better way to run this is first build the kernel,
> > then mine the gcc -MD output (ie stored in the .XX.cmd files) to
> > generate a list of headers that are actually part of the build, then
> > only test those. That eliminates all the kconfig problems. Opt out any
> > special headers that really have a good reason not to be stand alone.
> 
> I think we'd want the drm headers pass the checks independent of configs
> (apart from CONFIG_DRM). One size doesn't fit all.

Why? That demand is just making it impossible to make shared
infrastructure, and I don't think DRM should go off and build its own
stuff just for DRM in a way that nobody else can use it.

If you really, really, care then you can have your makefile codegen an
"allheaders.c" that #includes drm/*.h and compile that.

Jason
