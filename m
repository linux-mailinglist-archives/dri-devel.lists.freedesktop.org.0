Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C4B4FC1FF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9660210E14E;
	Mon, 11 Apr 2022 16:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2046.outbound.protection.outlook.com [40.107.95.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F1C110E14E;
 Mon, 11 Apr 2022 16:12:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QXbEeaamoPZx1gi0ogH2PfPlCYZWyV7Imvhr+V2q5CUQB2JcHGDHgQCEBhRnXDocJd06G3SPKB3qtflgfGmWOVWIF4INlTJfqPr4i05Zs0FVeQCQDry9RJuPURgT80Jct+dvfklBb2Ds4uEMKP4etgJeG+nKlJ5NGB+E+SuuDYo6vUt4ThnFOdOlS7TiiWNr+G40Ux35Yn2UUt4X0H30eejdzZh4BAEbbdz899LqbAZqwKueyE7raFcn3+Ls+zRuQcR5GjgaBSFo0qLNoheyvrQAW9RhbBUzU7rmbC0wl9WZzW5OAQZWaaJMvHq2uQCNKYSog/EwASg3R3G4OiahWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s3LILIxFotUABH1WLbE6dlNIGrN1meNX2w45rj/Dgdg=;
 b=IVZ7l6gYEX5/ViC0SV4cVxP1bm0twcUBRPcd1pKTsAsWxLkMyUoOBMXt/EkOeoWSKAxd5e2igU3I7gQtdp0jZwhYR027Lr8Ua/ECE/9rJgjKgx0kzX5Y7X3ELuubLTPPe891s28JUH6WoWRswUPgwpmMp4YFVvfC33xJLmO/cfevVwaZPy01CEB5FEbe3oPsu1SjxDsy+LmuUOy0/q8E6zxPm2W4VIgRQ38L32xktVlx55+8DvMHQWQ5kRIwjj3rkliY1InnO6Y++8ZnShkBwJrnk7ibc9fk7TCGbK/po2R8/kEQFYTWOMqF9kjMW03kMkyZm6MsCU6nDGRnOErtPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s3LILIxFotUABH1WLbE6dlNIGrN1meNX2w45rj/Dgdg=;
 b=M8z/6jdsOzJnPhxBrrah+SNl3ZQbbFfBWLzq9xfiQmrDdBa5+s9XBFVTjMm1mUjNmSf0e/U3cg02biHEI89r4QbOeLkPmJyrIclibKah9KSvHZnlp2U767btoUgODloxr8hzkHrEQJqRtQ3LsFMOH+QzCskcv/1EtbnHpc8zgjE2vlg6feBbIheo9qsxcxU+WMghAeMqZUXXcCgzbaQX3kencprXNGjnW0q6zBQOggTqC16A45AlI39xLAjcMobMX9JkE+5AaNfVrj7c2piM0WEcA+6Yk9YgJDp6DGwkk5ZLo3MkbJvdJLIrOy0pnVPebRBPmOgfKCSuEW3INJdKaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM5PR1201MB0203.namprd12.prod.outlook.com (2603:10b6:4:56::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:12:52 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:12:52 +0000
Date: Mon, 11 Apr 2022 13:12:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/34] drm/i915/gvt: merge struct kvmgt_vdev into struct
 intel_vgpu
Message-ID: <20220411161251.GL2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-11-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-11-hch@lst.de>
X-ClientProxiedBy: BL1P222CA0021.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::26) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fe8600a-8f9f-4a47-d880-08da1bd62194
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0203:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0203F610C2EB7E9221D9B7CFC2EA9@DM5PR1201MB0203.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yehBeC6uJ7sN9hebtZqIFt+65N2GmZ3uVM7b3YNZulUGhxXnXwMFFGpa3b0GnKSOS5fhSY+rIxek/RaMT0rG6oVpnMMFXkPOI8j6q2v7Stg0071Zju+gu+CSp3gFFbTWfgTkKnKEEiG6mLhbIxUhqudLh+VKVRolLoMqDPAQQDFSlKrIwuaw1teVXK6WSzJyKeiNRLhe5xhbWfqXIjMOIi8KJ8UXAWkmfbtRN1g1y7ZXmRrNx3/yb4JizwAleVvi6g2d4IaO5gUpk9+vepqRmemkameJWbGp2wVqZZzntnUMOQoBEaZzETq6xHVIkhr+0Z1i0g5TdUyhhAPbRJN+5460CacU+9ZzFJk+sqA76Y968tR4JNkRNys60qr/B4OPELJkIvSpf+sDmlWjPPxfzJybOq4U8rT2Ot+GgrHb+Vt0CIaWF64LqlntlHbx+RSiwOTVPZLVO7N6zdrA95uwj0ogHt42xD0H6C6C/Ud4tg5brDIVuutmnB5ApKg7FIuaBoEAAhGLouSpBO4Cy8NLQ0ssVB82xLxw3Llu+60H6edr88+26sXWdwwXF1xDNVVzWz7FvczkjJYb9jMmty0BKlF13D972r+Rha1Qyja73GlSwM0wo+J/Vls+Qt2K0aX4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(186003)(26005)(66946007)(6486002)(83380400001)(86362001)(4326008)(8676002)(66476007)(36756003)(66556008)(1076003)(2616005)(38100700002)(508600001)(6916009)(316002)(7416002)(5660300002)(54906003)(8936002)(6506007)(6512007)(4744005)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YzklsJ14xl8TbYoemJpimmj80JPHlnGjePunqDwWO5gyIPopLl93nmaaMpIh?=
 =?us-ascii?Q?uQobLKMxRDEhoAF1vsLgVOIqU3KU8B9RBuByH3qkbRcl+w0ZGE888Q2DikHZ?=
 =?us-ascii?Q?9CesgBi5FwyohyPI1lpUj+EWoBFb+aVn/cdP+wuvaKUJV0foHtJvLOy6W+bK?=
 =?us-ascii?Q?St4mgOxhfTnx7Fy5yk0BGxRLsai5ZAQaOrG/7ONqrU5UuW7MVjRz2gtlz71J?=
 =?us-ascii?Q?8rJBc6JmYGAbb1s9iX+km3T+w4GmPka174N9eWX3XhRWS/Pe1TLgp7UrlaE2?=
 =?us-ascii?Q?qICWL/g5lVf1nGAachfxM4iWEw6do6r90h0hEVA9W70/YRss201mpTOjH0JB?=
 =?us-ascii?Q?srvWTsKgXMR6p44h/GlFu/W1N7LkhD6m1Vhg2A7+Y32CZBh2lBdOmbixPQIW?=
 =?us-ascii?Q?szJ8WQZ69/toTbr/uLo3zK/nTGg2zJk8dxig/806zaCotfK3xm5lqfWP0FWC?=
 =?us-ascii?Q?pazCroIrfSlCT9jgjTntCu94guuLJ6KrnRZeFQhaNEux5bKOVP8JmNQKmu7r?=
 =?us-ascii?Q?7QiMP3345TYyZKlhbMmKWFGq+ZBgZ0yEeMK2ajmhGfGZTzkYGvgnGCQDM7jl?=
 =?us-ascii?Q?bskIi7EGztnrAmCCqAYl47PGYBIEg9yg/Ns2NtZ58xKTKGSHplJSxEvZeNoF?=
 =?us-ascii?Q?FvqpFP39M34SE4pse/X//i0VY3PgxW9SG2Z7pMqmmjNzRJmel4hBVjSYJ60y?=
 =?us-ascii?Q?20PI+72cbKzod9MOgNtzqwkBLS0yIJ1ESsb63JDM2jRXuGWC9nmN60pK+zw+?=
 =?us-ascii?Q?J7zv5CXLD61ejq/+YRXozOep/5uY6CO4RDVBNGA9D6lGSahzfKX/06MvB3yi?=
 =?us-ascii?Q?MQHMSVFhjdiSiQ6YTxH0C46MN6HCKKZ46x7Eay4jmcI3rZWxPpS4t0xQ0/Xg?=
 =?us-ascii?Q?5llixgbY9GnfIdp0438lUE0CnJNgaaoz3JIoO4bwRNTgm6PqRsf95GWm5J1o?=
 =?us-ascii?Q?o+AHacSMTvXt0gNc4Xs7PpJ9ZanrCRHi86WkkiDxNOakxoT+XjGgGRHd9WEM?=
 =?us-ascii?Q?7WwLyW8qRlGuoM9q42ErbWIiw66GOnS6Gug/0qzMKFxpxsj2Va2OwR5ptiFw?=
 =?us-ascii?Q?b2k1RoB7xu/91fZOyFbt5qXb7PF6RkX7llfnLd6acwl1G130qj8hf21mgXTM?=
 =?us-ascii?Q?0bKUHBbuSLIthUrmVPJp4f772IFVf07DyYzfvYdPAI615sfaiShNEgnxCWon?=
 =?us-ascii?Q?eZ0r1oWTQDAURAvYoCIR4Eejp3L+ErF/aTRUm3zKLgBdNee22DnfbV4vOy3A?=
 =?us-ascii?Q?LJZSLQ7BXOWc/ATuLurvm1MI/p9CowcL1LyQQF3gjEyrcBuYhnEBn/CXU9qK?=
 =?us-ascii?Q?/bOJsOJdwzlUZMcngiZuwvnphbtvJam281J2vx0VLtssb2154RGWlvEV6bsv?=
 =?us-ascii?Q?nt2cTIKrQte7WXVQmZ3/lN+7Ndeb7gJ0Q+KMOTTnTjCsdisP5BZYatgoOVdB?=
 =?us-ascii?Q?hl2UB7qzXm9M6gESS5dKjvNX9RDURBKN4W4WiAKC1tEh/sfw5V5mviO+PydQ?=
 =?us-ascii?Q?rebkbn8CwYeUU99crlHn36nsSUdpCmhzdBq5bHPJzI0mPGlEAJ3dE34LPO/Q?=
 =?us-ascii?Q?g3oiA03l8qUs6fRAY/Ok+FFQIfUWSouz/IegVLegbOXt6fE5G5ePgftw1A2r?=
 =?us-ascii?Q?5Eg4ow77P95Go8qLyZoVqxOQK/hn1Of7mQG/u97R8g8NQP76x7A/EU2OH7cc?=
 =?us-ascii?Q?CbiLl1ByEik6dWr5cE82txVVdxWmFSpB3dHkydAM1k2w00M+KAx25RgX83uw?=
 =?us-ascii?Q?IdMCxT8S6g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe8600a-8f9f-4a47-d880-08da1bd62194
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:12:52.7325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZhSGDQ6hSnILJbqDwMheIQh5hM1CYPAfy7UVxw5pO3Ec3vWEOLdYMaC0b74c/CrQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0203
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

On Mon, Apr 11, 2022 at 04:13:39PM +0200, Christoph Hellwig wrote:
> Move towards having only a single structure for the per-VGPU state.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h       |  31 ++-
>  drivers/gpu/drm/i915/gvt/hypercall.h |   1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 288 ++++++++++-----------------
>  drivers/gpu/drm/i915/gvt/mpt.h       |  16 --
>  drivers/gpu/drm/i915/gvt/vgpu.c      |   8 +-
>  5 files changed, 128 insertions(+), 216 deletions(-)

Happy to see it

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
