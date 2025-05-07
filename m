Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC324AAEE6D
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 00:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1AE10E1C4;
	Wed,  7 May 2025 22:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B+dS8IXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB2D10E893;
 Wed,  7 May 2025 22:04:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5/bkdVGyD5lPwUYGYmexPlvTtKcRjd4FlyfnkO1Cx0i5pKI+ugnROVjTc08rGjtYjqn2wMKM9YtO1DHWLB1kLAO1chRc26Df8UqIroNhFf2uBRr0nIGl7Xv92j7SOm9JWB6Zdv5hJiJxf4GZCNOKOhszj33/MUSOp7jnMckXLiDmTVTB93+ewJelaDKGfBcTQCAjM29Isxs8PY9Xl+mfagBgwWqyMy3/uMY41SFFoeQ5gV4r1bRlAHDT8sIbKi8pkEAb0RKIhiVZw/kVfl17tUk6f/UsCWmX/PpFtxi0/KX/PYTrw1/gfk2xeb+pzaZhryOWnsJPDmXd1glO3dGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q+H29EZExRUvpRzyctW1oU35Y9MNx+ZWzEOBP5HTgPU=;
 b=Etty8c2yt99b8tP44xNfC+AXwkW9GJDykvdXxhQB0KkadLjxYyDKGsa+tOZ0++5FNKvgPgsoBxjXjucszvgXPXQYAkM4T1uhCBunyMLWGlJYKvHdgUIdcBynebEGCmtGAHRROOmtPFZsYMSi7OjNq4BA4tUpyvzgAUB+u6iOorldsWLIDBELk827coGk49ZjMKjlldr1ART0ifQk4pHUopVofYgl2Y4SI0wEi+b2+XxEsfmL4zJmhWsK5+bgH0CU3GrllIvXmf5GpTYlSoaDuz4wlHSFhlqSPT48YDeKAq4EMB50ivSyIfwri3FKRwxkgd8w08+mk2SIbvdDAHAclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q+H29EZExRUvpRzyctW1oU35Y9MNx+ZWzEOBP5HTgPU=;
 b=B+dS8IXYvtRzqvztQAMy3Oyi7vvOjdrw8Ruze3OKfk7aqurBqN8ugIIWNzIjX85Bzw3YA1mig1Qvas/8zolwQSaJhIJepOSw7xVZhQG57Z+Qby4Ato2/8KbkNCf6eKryL4UG8kEPIHa/x8Vc1xwwC18GdsPZQPoUJNhGbO3fIeCwGi45OYttFVl3qMpQBxdjrZqHokQdPrDDIcPDnBwtqpTQ/zgZ8fgA/bLbvN+UrbGUAg+Po0Qohzbhn+12rxdOsFbvIYiJublI+TY335Bp7Aq6AE3hEdW6N/NgTODBpr86DJoOdHplbFKaKQ2fMCPFZG/aWKq80jptsKEMpBuTZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CYYPR12MB8732.namprd12.prod.outlook.com (2603:10b6:930:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 22:04:45 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 22:04:45 +0000
Date: Wed, 7 May 2025 19:04:44 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, anshuman.gupta@intel.com,
 alexander.usyskin@intel.com, gregkh@linuxfoundation.org,
 daniele.ceraolospurio@intel.com
Subject: Re: [RFC 9/9] {fwctl,drm}/xe/pcode: Introduce xe_pcode_fwctl
Message-ID: <20250507220444.GA232705@nvidia.com>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-10-badal.nilawar@intel.com>
 <20250506181353.GA89958@nvidia.com> <aBu5O5odAKaxhhym@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBu5O5odAKaxhhym@intel.com>
X-ClientProxiedBy: BN9PR03CA0399.namprd03.prod.outlook.com
 (2603:10b6:408:111::14) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CYYPR12MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 655d5bc3-fb99-4b06-3508-08dd8db32d16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8M7FQi2wSL6w4p4ynYNqv1I115mdFaYvv0kYh9tIPgjVY5xJnfgdsEjdbHIO?=
 =?us-ascii?Q?BQqg02aRN0r0JE3wZwDvVrvRoHlMnyTKuGd3HxO1sufIYN3+nUQQlJSw683l?=
 =?us-ascii?Q?Gc+kgvSx4chtEE7gog494sun4zeczbxvAfo0yJh96SJSV582vTnDgIBE7kxm?=
 =?us-ascii?Q?vLphlmtl2c7cCdd6eu90Ew4cpFWtiS3xEu7vJX9C8MV+xcjSuu87b7/kTJN2?=
 =?us-ascii?Q?IMZrqwcSCjWxkD6pYTw/Pno2opfOAR6BppSOu47hQBIOH6jY6rynj0NYBtk1?=
 =?us-ascii?Q?WUPqEaeSoFIdv53KHVGakJcT6/FMFjAprqsnITWgW/3e38U8rt6Us5zQBsW6?=
 =?us-ascii?Q?Mhf/+m9/CCss6JHLwI9xQaR3xIZPU0oEy4/ngAlPZ4n6XzBaqRga0xKeVGOf?=
 =?us-ascii?Q?qRm9L5aOrrQSK4w0Y86ptGEit80UC9uVtXA4pt/qCeIssizGLeuOC8TakwbQ?=
 =?us-ascii?Q?rmvQEUuv3niKQXLd1XR6IYe4k52derFwC5V3EqrLX51u3j0RmyiIdnQ4jEa/?=
 =?us-ascii?Q?YA0qzXNnvNyT+6iy8ImpsQjePlUCrFjaWynltAl1k5Pu73dFxjY+jzUtuaFY?=
 =?us-ascii?Q?eCw1UzeSa1npyYTg0TaAxMtbOnFajZmZO2qhQohPodqWSmGYKwcA7MAGu1pB?=
 =?us-ascii?Q?pxFlkbSLmTXJDxjAH+q+NaDyVpiubznJFrpch5jAvKfwtchhMtBmrTubv+nk?=
 =?us-ascii?Q?UFzwEO+dzgW82PSOYsSg3AupI2d6blAFCBobkU21wBjMGzKqY/spIAmp3mIK?=
 =?us-ascii?Q?FW+q2Tv7XNXJtKeFCuFcYywZck4Z1cYX21imanbuHzHKbxueJx2gN5bt0iG/?=
 =?us-ascii?Q?HHMJsbVLsYJf+YJwsn2/Mj2FiOyxDyU+exuY3aDBav+AlLz+Zc7Jda0SdPeB?=
 =?us-ascii?Q?aRYKjzx23x+s3RheNdUZzoYaOWstHBOaRz6TV2T23E9nIjTw0zIZ5IyYvQXm?=
 =?us-ascii?Q?SjKgMCyjxQRZvywL1EZDuJOcUpo/qepMqLB4BLF4G2DffathA8aU8CldiiXg?=
 =?us-ascii?Q?w/c2GwjchEez2mXQeHTZ0UnRn1CkbL5pIXBqUmFOnmRMKrVEOhS7RmCqljcQ?=
 =?us-ascii?Q?Hd4PTR/+4+N+C5sjlj+CP2iFa/O1+iRAIrSKKOxxYyzYRKD8R/7wCGSzynoC?=
 =?us-ascii?Q?pG/Xtzt90NKHhDR3Mrw2ssOBaAahafYmZ59WWnPeKsck/rPaeY14Yr2zm4jL?=
 =?us-ascii?Q?yVdE1/zvfDKJsj07M5+l0dtfpYVP3jF2EwrRHy+Unfhkq+RPkHdbXTvk/d8u?=
 =?us-ascii?Q?n7CfwI+uK9CdnLAUQ3CIDnykk4R7GDOdek+uEUOlfZjN1WRIfZbRcUrl9xS+?=
 =?us-ascii?Q?OIsYs0IwW6u7wVIPPocJGJ98/700WXFtNc0AUz2AFakupH1KMlytlrpCR70v?=
 =?us-ascii?Q?Lrotu2lYcnPMvuns7NaAqGaPgtIOm5EwGZ9cxwFi+kEIf1Tt3icoyjsKhmh3?=
 =?us-ascii?Q?ouNL3fWzzSE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wn1ryUWgJRarFYNVgFGh5eC558PqRNdD1RZU3Y0B1dKUFm312IF38Qwoa3t+?=
 =?us-ascii?Q?D1EE/lVNhjH43N0HmUK/KKV9uVZULSLakChM7aLFFJn07SC7D2eYtV8W+KMt?=
 =?us-ascii?Q?8FLtxkg59eYYWA7coLV5v7t/8EY4jtw+eHaEMGlcFw/Rtijvxk79XegQrLrB?=
 =?us-ascii?Q?/9WRt2mOzAkVEnqcRj3+fcbql77ltAbL3iDGJHOBaZP3j2tqEYWdnTBQgyQG?=
 =?us-ascii?Q?aIaTXRgK90HBRtqNb2KBjzAu+4LwPw4V/yztrGk9hfDXYJTSWuBFybx6r0OX?=
 =?us-ascii?Q?4uvtN+BCZazKGrASAtAym+5WKv8WNsFMkHRjxEQ/OGnujChEOicJchH6A7Un?=
 =?us-ascii?Q?T0skq7HsDrUo2Ky7Sz3bFUchzwaOh/7wDJo21Dm8/DZ1Nyvc9ctcdPBRnzSf?=
 =?us-ascii?Q?L32aq8sq6nPxI0DvSKwPaDxTo0vMLF6xL0kd28SIGDeUiDIN3y5mwpmqJ500?=
 =?us-ascii?Q?R5QHrM164HGJ+wUnAyyc4HTHuPcajQQ4KXK3pL35FOpuillYJcUaMCM1aUrs?=
 =?us-ascii?Q?OIVfL/yqleAbX/45seoAaNWYdR2lV46qOuPG4fJcPtGagKAFtz9WPAr/2w7l?=
 =?us-ascii?Q?gqlhu00p3t5bdBiT5g/KTGTtMz7wlnDU/j+PH80IPAUO298L89XyCQE189Tk?=
 =?us-ascii?Q?bp7AkE6oZME+qNUueRlEQrDTYKoxfvEglXEcigk9HcuEnh1F/R96LbzaJCtT?=
 =?us-ascii?Q?KsDqx3ClqLKFmNSHDsUeaU+uIsRsy7NAwvPYjvrEI9CahRBBm4OH2/HobtG6?=
 =?us-ascii?Q?C3t4DnNdyvu8E9Vuz7kdUDScGQwiY+lU/MI2Q7eg9EvkIw1jhokbRSsRrM9N?=
 =?us-ascii?Q?ZqC7HJfNLBF47RYWCP94OxMtxsXfXXYYIvVOiWkYL8qLP0G8mvUoZsFiVUd2?=
 =?us-ascii?Q?vS4q06Tox0ZdwKmrcwX+cz0b0RLnaYg5pLJqqr06DY8Z8uL5cX9zxdtqJBA4?=
 =?us-ascii?Q?AKc3xlLV+fhfMO2X0PESV77xeZM7M+n/97rfglfpKhOfUMsHuRggIlQoBMyG?=
 =?us-ascii?Q?+Ywnc6e1Tdq3ej8rxGGOfr6YpcDBB1FXUDhYWrAcvY/2WUXZeE8sb9AQPdlM?=
 =?us-ascii?Q?T91t5FjsUSihQretnmJmqvsFNFrHkJo1MpPr1aonw6zo8SDWsL6crxdGEFMK?=
 =?us-ascii?Q?IPZGudTPwR/9X8SzMS106FWIv8bVF+oIZq4K7OrfDA9KUmg62qfplAqSOVUg?=
 =?us-ascii?Q?VMvwAdBJcs8IDgzo+0uZhgo6DqezvjQh17nelezNbADsawWj+L0tYRSXJAkY?=
 =?us-ascii?Q?H8B8O5emrIqrEfvYiUdTozT2sy5gbuhOjQt0gNnWG28z/2iyACv92rZF9LDS?=
 =?us-ascii?Q?mISrLR6OVapi3ZdZBnjNddVDOqQMPztk+cwXlt/BZ+0+3cvLwmlY0hrrVHoK?=
 =?us-ascii?Q?7HqMsriqFy3K3jjDvs6BIm+t7oLf3Gfta9egVln56ucR7ca2WRiNCer2FKHZ?=
 =?us-ascii?Q?CtHZcHmIer9MhMFuwIHuJ5IUBPtFp0YJWJMOT+8mE5CTQwpI594yri4PZi+L?=
 =?us-ascii?Q?HICTGiJIDMfN3Jrg1oOgVYMBydxku57+04FsyFp9qAdwykxyKzIcQrVvelZ8?=
 =?us-ascii?Q?H0ZH6yqpyuVYVyRI2bRfUvf1u8JLGZP7GRGZqbEo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 655d5bc3-fb99-4b06-3508-08dd8db32d16
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 22:04:45.3606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6/IYD1zjnpgNtURhYxbmOlyK5RvETx5jcDtmxCZmPdigPzRmYzT7e/P/vWbrb25P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8732
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

On Wed, May 07, 2025 at 03:49:15PM -0400, Rodrigo Vivi wrote:

> One last thing since I have your attention here. Was any time in the previous
> fwctl discussions talked about the possibility of some extra usages for like
> FW flashing or in-field-repair/tests where big data needs to filled bypassing
> lockdown mode?

For FW flash I do suggest you try to use devlink's firmware flashing
interface. I think it would be really great if that could become a
cross-subsystem standard in Linux.

If that isn't going to work out then yes I would say fwctl should be
considered for flashing.

Saeed's original version had a "big data" memory pinned DMA capable
interface as well. With justification it could come into the fwctl
version. I'm not against it, but mindful that it widens what is
possible by quite a bit.

But you might not need something like that just for flash. Some
internal improvement kernel side to allow streaming from large
user-space RPC buffers instead of a single alloc and copy would be
sufficient..

Jason
