Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A9E443248
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655BB73097;
	Tue,  2 Nov 2021 16:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FBB73096;
 Tue,  2 Nov 2021 16:04:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzJFKxXxmUUpceuSMJIPn9pSRi0/AwoB+2YnA2IKzTjTo6NTcIyt2fIlTG9sfCiZElG960vQj3wp6P2DZnTKEHS0sRkRccMPA/EPs3pNWlQHa5+AcVOVO+hUWSXngkJPPfyuh6Ol54NvUdIXOGYA/MhGZr+edNXy4HM/8JEvEA2sRPRdtYUVRTUqcXCpBzcXq0R9fpiZF++swAK/ag8N0wKjtFVsQDhXQlhPRnJ05nCvDyecIK6jzFiCaie7fLW6mCVetJmuIO+ut7YZiZE3GBIPheHK356/HBLm2FrFd+rIq260SQTYVNG1k4541nk3mvkeaDLdBqiqqDc16wfE9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvX7QtcMe9WAW5/pqOFlGav8iGYFymkQUQhii1RxT5I=;
 b=PSCJp+nEM84/2wfVsiYsGGrn6fOqOE0mOOQi/whejRhnp3LxjoKaYV5KgwTm848iCpmd4qtEohTHSHm/BhdTD9NJF3smuW3K9DlIABeFbNpeWhJQQ2tnU/TrunV8K+0B19tQR0NFLAd3UHo3vR+rYKSY1LnQCJMFdgG3v/Zy5u84ySf3oLPoltOQwvzC7/gYS/BieF+joYQISKHdxVUpQ2N0aICUzXD/1eRp6D4alRI8+y4Scdluq8C6WfzdPiMBfKIUgduSEGuSO60HITdjwliaMmjPxt/RNRSmWi8cwP0ARUv/P6KY1k9YSamMiqor9CZX4lLHEsUJFzyZBXWkxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvX7QtcMe9WAW5/pqOFlGav8iGYFymkQUQhii1RxT5I=;
 b=oGUU3gM3BEwkLDnJUyTyRAWe33j6GOT8t0vJkwT3TC80oqm9yWwMBC4QZTPF2U8EhvlhNIhDiuZaQSlHwH1VgSOXGKzJtlt75GBHf9qhykAHVTWVGbCdwp9c18N4d3w9B3tn6qKIYlbbkMSdDnYD9/+MHD/A8KtQd0zgM+Vdg7/Vxs9NKgohklF2sMOcFPPbS8yCMdu1EB3AQ4r12uIGm+9VYu/mRo2f4NO3BquMW2D/hmi4Sf8kvHTNXAfkEpSUodNdB4wvf/8LPTwf9gr6TCo5I0AsVpc2JgZZt9HqnkyWJ95KzzMH900pbshOh4uGxiZzzAQ4Ck26JluL24xLsw==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5539.namprd12.prod.outlook.com (2603:10b6:208:1c3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 16:04:14 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:04:14 +0000
Date: Tue, 2 Nov 2021 13:04:13 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 08/29] drm/i915/gvt: remove the map_gfn_to_mfn and
 set_trap_area ops
Message-ID: <20211102160413.GN2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-9-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-9-hch@lst.de>
X-ClientProxiedBy: BL0PR01CA0006.prod.exchangelabs.com (2603:10b6:208:71::19)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR01CA0006.prod.exchangelabs.com (2603:10b6:208:71::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Tue, 2 Nov 2021 16:04:13 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwGj-005AHj-0f; Tue, 02 Nov 2021 13:04:13 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd0d263d-1d3b-46e2-9f98-08d99e1a6a41
X-MS-TrafficTypeDiagnostic: BL0PR12MB5539:
X-Microsoft-Antispam-PRVS: <BL0PR12MB5539DE71C2D0CD03BF912C99C28B9@BL0PR12MB5539.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VD1tvTINdn8e9Q/k/S8OQobCFCxTlKcL+2/HrLCMgq78sWTnFqlu05e+qZtZw4BemCSBhBcvGMLryRRSqVYmHmVnfRN4hDmzfiJJgFtBZOBi492sxb0wLt/3nbbya0hxbkudMyEgJNOzJY9fo7+9IGpO9vkcD7PIG+UOVXfgTYL30eoFaMqMh2pj1cymOEZcBqvOd4xaA5uE4Qsvo6xW60RgVd4COUzbF85ELCUDWlk+orRkqA3PHX9iq4egJR5ZtNIDR4uuVbVC97jktQbsTBWRbirMdd0uHA8f9fq1gsT+4kbvY6mKPoILJa2tt0sAbi6rxUKH4ZQRChF3nvWlbjUujio9JuZLJxbJTzRLoH2ZxxRXzEjogXjP1ZqDVv+ppRi6pzIgJyF2q3YrPAjEB54PzlXNb5FvU3QcCqztGZAufO1rt7/2t66dHr4eD329b+CgTI+ToGvIi5vFNuBwCHlnWzyB3FA408/5pZHp7n6mKj2VJgge+5Xv/9NPqjvulN+Ub2CM9JT/9TkpavupK6iYzp/zCBgtOlAnwIXzejxkCRhN3dcOkbGEqbtz0wW++fxtV2j5p3R1JU3pye8HN2pLptRCJEAEZAlXVbITQCiQZbImTbtQf8OOGBkYvP7G+dbsc2eRiaCrhQ1yMRIBJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(36756003)(5660300002)(1076003)(316002)(6916009)(4744005)(7416002)(26005)(4326008)(2906002)(508600001)(66946007)(186003)(9786002)(9746002)(33656002)(38100700002)(2616005)(426003)(86362001)(8676002)(54906003)(8936002)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AxYQgyQ6RVWTYA9rq9Ewf6ahJWyxaJ1goTO645EmIASQovvWzHGYPZL1EfQd?=
 =?us-ascii?Q?ZYck0DvFJMG4yMbexEh5M1JXg4aP58S9RXUU7JcwPBzOq4L3tdMUsmoLzYml?=
 =?us-ascii?Q?O+6uoeSvnN3OoYZN29T+3VeCcuErnR0Y4iuiYNynrWS/2IkuzzS7vo4G75la?=
 =?us-ascii?Q?TgPG0PTfnmBt3pcMo/thj1mPOOP+i5RSdN6DiMyYhqTsYwEI/oXZKS5/2xkX?=
 =?us-ascii?Q?7dO+OP3SZODfBL/ZsasF/PwVEy+qzbddkdZFHQb1ttvK9HWP6T7FkpqCXkyK?=
 =?us-ascii?Q?JrYSCY7bMTo4mmt87ppwkhEbV/Y6FAF3GQhpzt73Y5XCdGgq6Z70N++a0enH?=
 =?us-ascii?Q?TfLiyMZXOZv0tgxS0JKTF9Ljj0Wvm7IaEBuZgoTHNl5/H7Yb5RBKjXwMB56N?=
 =?us-ascii?Q?dBouXvPc46vUsExHd8kik2es9pSPcanJJ2S9hPPsu+WBI6I1vNKlaLeKUQwZ?=
 =?us-ascii?Q?ilDuxGFsav6EIHSDyYGh/G3DvWZkkbzfZ0+ad7VrBvkr1UF6c86/3Ee9sQCZ?=
 =?us-ascii?Q?dvtUsFNweOgt4sqAwXzIl8xn/VCRbsrEUJXKXt5AES2hJfeOKIVuw+9TKbG6?=
 =?us-ascii?Q?mqYEMKt5de0cpCZnSEr/hmwfg3MrAfQCGzuegjbnhWa9ZJYxzI/lNjRLgeEO?=
 =?us-ascii?Q?qSt7UpgsqHw/nxlBiqsXu88Jy/tzdCGJaYowxSn1pQB9qsIdMohgCQGMsbvM?=
 =?us-ascii?Q?cfP5+jGqNHechi0TYadeRqiEwFG/0sYXnn0SQACf5Z6ZH7/0GwijTa3zbjV3?=
 =?us-ascii?Q?x+aVWKcgslKlQYslvaJiCUGeZeGxTDPg8pL/Jnawq1Uy6f5B/CC/6Qp29q3u?=
 =?us-ascii?Q?03gyKxqUEOXi3VtivnYlC8Q0L4ksvYLktdotPDobPdToT9Hv8b3nKYdG6LvA?=
 =?us-ascii?Q?KcDzdgfTeWV/fCsBcqWkaXJROYcH8bDpguP3J43V1NKokeqLXKFVhAjPs02h?=
 =?us-ascii?Q?cBtMyIIWAOWa5aNKXJQIL7Q/JFfd4Fgp41EHmePd7zAaa4y69LNfvaiw2avz?=
 =?us-ascii?Q?4cGudiuipZbcuQis2Nejb9K/1TUVUWg6LeQp2bDyBYqV3vhOUO99H3eCGCgi?=
 =?us-ascii?Q?wslwBwPu6IGxHCCP/2eK44y6+tZ+toI0hCD2AyEwfxYby5opzCcPFC91J467?=
 =?us-ascii?Q?+ZMDnMTptH7J+HV1cWKecgwQDLweKKt07ayNiWGcBmOy8Q9LzSQMbZ0mR/9N?=
 =?us-ascii?Q?fcTWoTak8sN1KrrKWMoYlusmxXxKvwubQ1OHkHG+Nc7wpl9vQ3+/GtKWVl/R?=
 =?us-ascii?Q?Fvm1XxSaaD40FY7SeJjg+M61RZOCBiPjbL9th70LZiM19BaceeYPdWPLuNaf?=
 =?us-ascii?Q?JQQzmrWb86fCYGvSFMt7jFzUhyw7Gq5z5MDGtYLVb6C/TSHtwdYdD1QpcYng?=
 =?us-ascii?Q?cU8y8J2vXXA/jtkmcBM0KR5MeQcjbyFjVTR9HMgMLxgMYgoOT0F70wyg+W6X?=
 =?us-ascii?Q?q8jzsAEoAsulh4x4jkyssDGDK42S2v2PuGm8p/i+H5TtUA6dl8JcxgM/faKi?=
 =?us-ascii?Q?pE4vCiEBD2aDpTIQveg5d+qONHZTLHhSE9gjDoAy2k1YFD1Qm+pdFcYEmbLA?=
 =?us-ascii?Q?eCqxJLFJqybCrNaD5IY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd0d263d-1d3b-46e2-9f98-08d99e1a6a41
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:04:14.0830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYRcOZ+nJh5FcEDlpzqrbLSdlZclCyF0lMxfoh8DHum0S6oTLz0wF73/Uac5CgCc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5539
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 02, 2021 at 08:05:40AM +0100, Christoph Hellwig wrote:
> The map_gfn_to_mfn and set_trap_area ops are never defined, so remove
> them and clean up code that depends on them in the callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/cfg_space.c | 89 ++++++----------------------
>  drivers/gpu/drm/i915/gvt/hypercall.h |  4 --
>  drivers/gpu/drm/i915/gvt/mpt.h       | 44 --------------
>  3 files changed, 17 insertions(+), 120 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
