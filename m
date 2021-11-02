Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D67443295
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5FD88ED6;
	Tue,  2 Nov 2021 16:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2078.outbound.protection.outlook.com [40.107.94.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC637318A;
 Tue,  2 Nov 2021 16:18:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJAxcFdcL6NoKYMdyCKhxqosGcQmIB+51Bg4ZFY9XSIrSlC3H6eqpqQ5jrNxpsMKm0ctlv6JE2SWzLzi82uR55I2VR+1dn6MCPsYpYSm+9XQaBG4AREGFCfh4X3FwoiZ9FLjXlKKYiCyNzv8sYLIdRT+gv0Hr4G+uF1xJ3FvxOud730mvUUjNal5Rz6NyFv8huArdHZDdsNz7u0MlojoDb1DEszOuyU9dNfRciAmcLWf/Nt0O9I0m0L5Ic/pb8QOYzcrHEHuo5bBPpB+htU5+AH+yAHe56l8u6s2VgrQo6Iq3REapwJWllR6dtfVRPwZFDhaWsKhWsKP/mRfjh8Vfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quhMcPw8eM7TEJD5KkksBTJyGk7KKCYtDdT4iWRzb04=;
 b=FTv3OKTZ7MM/ejxCB5Fa4/yExlSs80l3oOxNdP4So0PVJ9aMD4QRADC6pl649Sa3MCfcmkJoJWl77R8q1RAXJYmOip6Od0SN6YEq/7/uaoH/MsEWz2xjsdNseqB6z9UmvAKZYj7lBH9HR8Bw0y1k1B1LJ3IWUKjNryO3MKBTxvIvs5J1GZ3puCN6Syp6Oaa6UgT91StlFCimWID27cIuFRCz6BA556pj9A407t7sYqzeKqgv/3Vy4kgAnUPaxZUqEejl88qSIY5c9XKhzlAUcFNnkGuqOj1PDPJeeHZZxUR3OCKHVpoyz81dzKFNdTVlJc1L+l1rfarb5qWtl7Q1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quhMcPw8eM7TEJD5KkksBTJyGk7KKCYtDdT4iWRzb04=;
 b=Fff4Hi1G7MvCsMxuuqtt/ml4Ci1rolSeaFrwpFYQtBC+YYnDPCXXHcBZ+hwj3AB0+kDmXxUTdJAYEzd2S1qh77n34uKS0zUcVX1GwMBtdbXL8zJKFNzC5BWOFtJ6Ww9cHgJL46xDFo5VYWaeL57OBNoPMvV/OQpmYGq8Dy3UtT1SOjSZdLZkmC+B0fQCX8zwMmoAb4yzMa8prLEYtLD6mv6xFb3o+1iVE/nJBKTIVreypxLH3rrIEY2awdvlNcr5a9l64soQJoZo4mxD/1m402h1Q8vZnunNfnoRgFTK69h8Px/y6wkQqS4GN5YKtH8dyeCxPnQI0Vw72YZqHvyBaw==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5524.namprd12.prod.outlook.com (2603:10b6:208:1cd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 16:18:27 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:18:27 +0000
Date: Tue, 2 Nov 2021 13:18:26 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 23/29] drm/i915/gvt: remove struct intel_gvt_mpt
Message-ID: <20211102161826.GC2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-24-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-24-hch@lst.de>
X-ClientProxiedBy: MN2PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:208:23a::11) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR03CA0006.namprd03.prod.outlook.com (2603:10b6:208:23a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 16:18:27 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwUU-005Aak-KW; Tue, 02 Nov 2021 13:18:26 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67e7542e-7376-4c12-049d-08d99e1c671c
X-MS-TrafficTypeDiagnostic: BL0PR12MB5524:
X-Microsoft-Antispam-PRVS: <BL0PR12MB552419060235B1F2BE93890FC28B9@BL0PR12MB5524.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:330;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tMGDA7weDNs22HC4r1tCx45BPotx9JeRsBzV5MkcxlfTPMyKRveKQoiqgQZ+6iZ+xYA3YcfrelOKne3nBYKtFT6nvEgg8QWL8NE99SGz+UNPT3xwV8k2TNgeppeMZbqUyTsBFpIU2fLtDWPgSlSz2Z2eMUAvkggh0Q4AWabUlw+PoKqMSNvHFcvY79uhlhpl2rXoTXxLik2jvsfQKHBPKDtvx5KR2oSp4H6KuEdZUGU8A4rgfEtc2doMh6E/G2C+S31LKaylx310gEhTjRvu/CTqYCu35xwnkz6S7fJbBjiKx0/L50WwQOsBwpPvuNs+TYdGD1CL5Ak2e4G6VQZu2Eedt0lsOh7T4kcUDN6tDdQ457xtTLsVY2AAxGzjSiQXuWNpWDJpy4FdRrmwVHDR1sSyILzzEWlFSOFQ+3GVOr0L8d43kiNh2G5DAfuWabTjpI6IegRHSo2afd89jF00jFp2yMTXEqpkT7a1GvekgzvTChJF30lyBZ6CE3kJrtnQzD92VUuWUojWYomRoDvjBj0jJ0OBTeCI4qhroJeBOyk1HwoG5IK2j0VBIyBU0mF0BajEN5Uvx2DQ9tUzcFnrWHL6hMNTDRfBZvYy8duwyaCyd/r0GVakS6WPIPiONxPEMQ7Ngs7bSwjM6f4BnK7rsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(66476007)(2616005)(66556008)(66946007)(36756003)(26005)(4326008)(8676002)(54906003)(2906002)(5660300002)(4744005)(316002)(426003)(33656002)(38100700002)(186003)(9786002)(7416002)(9746002)(83380400001)(8936002)(1076003)(6916009)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?csTUbNqbwezVeyXe6eGSLI1H/h6VCf5SVRzz25xhtgpgRP1+8eChdKsWmIam?=
 =?us-ascii?Q?5LBykRvln5To/A6FzetwFRmBHIyjhxSFKlujpJA20hEA4TcimTPxOJCJKj8Z?=
 =?us-ascii?Q?hHep3+hgxJXk18G8/FL794A8EjkBDGs5PvkyKVv4uHw06WrH8qfKbuds7Siz?=
 =?us-ascii?Q?jfSykvHwe7T6pRKdj/80IGOTPigYIrQslEE0O2glDvQ1HPKSQA0xP1Q1M/Ec?=
 =?us-ascii?Q?wtUB+VQ98T7zo87Og3qZ5lZnK0TYAHmD4aSj4oK83MDusc4+rXcvaPUsWUHy?=
 =?us-ascii?Q?UGoUwOJWR2ba8kRRJxPvgEVGHcFUtnygKjuy98qjI8vC2kQVC6QAiFv2D8bi?=
 =?us-ascii?Q?u94dvNv1vYX6Q6KH7yjhk/+/XmilN5+zVF9pq0cScv5Xy2lBYu18KpJE3QyC?=
 =?us-ascii?Q?TCWhZruLcOLk5qL/l0xfTTSKlRr64GCJPKchIUnY5wWV5l79BNTs5z+xMStR?=
 =?us-ascii?Q?iGR9rvJ9/J+056zhIxWMoKe4UxmX5zxjrrwrE3PGcJVmCWbS1FALVtt7djDt?=
 =?us-ascii?Q?VC3vmqu+NwYfmzw6tKW9CCix9iqd5w5HKmb29wFbABtRwvVK6a+dK38845Kc?=
 =?us-ascii?Q?5TzXtoBmMPOh223SuHTYww2OTYaJft8T0uH7lhh9i0Bajyfm95TbJYEw68CT?=
 =?us-ascii?Q?SMpghCvJ6jy+iotEgOinlMd+c9kaIRIRdpKSUQSF977NdfbNDvMCmbFlHVz+?=
 =?us-ascii?Q?5a+nOcjerCIcvCOQP06hMzIZoSRIOIlRCmdbDE8/5KeJzpHOGwMMmzd2UhBN?=
 =?us-ascii?Q?trc9Sp3WQWOEO22GGwECuHFmrR+/ULXgU/lBRmZA7q4cv5pEVg/pBwOjCtZT?=
 =?us-ascii?Q?hPUpAMZ9i5pLF55pwpYi8QhwW0Ube33wd2H9v4+61OAC8YChaZAr7SjstRL0?=
 =?us-ascii?Q?YM6jZEk2hQB9M1MSQPbjZO+SEWmfJ9kfTZvGW913yyCT42QekhYAaAjTwQoX?=
 =?us-ascii?Q?8cWVD+10Mlbru1SYx5UuLK1js/w/lHP8AFR7E59oN/4l81mfV2/AbOU+pKfo?=
 =?us-ascii?Q?AOIG1LL2zpKgN9zerhNH1B49CADXHwm6pZKIACcbR+ZtrTAtf6/NEOvqg+3v?=
 =?us-ascii?Q?rM02QILlm/H5bnlG5xn5vJHaDYZ5vHqi8HKvp7qpn52ybdprG7hKO51LZHMa?=
 =?us-ascii?Q?DOXpV6NuYbzbcJZSr3RplGQqZ4lvYqVK4yoRWDloSV9PoFWLGt6NLmHinCQn?=
 =?us-ascii?Q?7rXj4gHMs9awx38UUxihjyTcNnm/UrR4F5fCbfpjaEXciJotSAOhQoNDfO5z?=
 =?us-ascii?Q?u7SfyBUxGhjE8pQLjm8fcMJqJZnh/JS/5aehy1ez41a991jDlrBtc/sVKkfZ?=
 =?us-ascii?Q?Gnu+jM/obrgBnJwA0vgCoteRPswfFrDvG9ZnpJI66h8gD9U3FaYSM4HqeuH9?=
 =?us-ascii?Q?SaBdluVDmpe6hO3kqPMkguTiD7V420Opia6XqTamuVZSqTMDfTkzWuohO95U?=
 =?us-ascii?Q?R74vl1A0iKnZwfRfWtSj0gPXFvz9Dbe+7pHzLdRYf6X9rwKstQdw4dThBgRB?=
 =?us-ascii?Q?461e4M3agppZBCrYEPh85KymP276AaWGAkj5f8AknawimP0KUIOJ07KSs3hw?=
 =?us-ascii?Q?+JVEhXxuni3oDZy3zhc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67e7542e-7376-4c12-049d-08d99e1c671c
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:18:27.8137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NReCz0T874lEpgwnak8efRidvlOjtGEzaiVas9tnhLjDyEqEBaIg6VfLnSz/JG2e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5524
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

On Tue, Nov 02, 2021 at 08:05:55AM +0100, Christoph Hellwig wrote:
> Just call the initializion and exit functions directly and remove
> this abstraction entirely.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.c       | 11 ++++-
>  drivers/gpu/drm/i915/gvt/gvt.h       | 12 ++---
>  drivers/gpu/drm/i915/gvt/hypercall.h | 50 -------------------
>  drivers/gpu/drm/i915/gvt/kvmgt.c     | 39 ++-------------
>  drivers/gpu/drm/i915/gvt/mpt.h       | 74 ----------------------------
>  5 files changed, 17 insertions(+), 169 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/gvt/hypercall.h
>  delete mode 100644 drivers/gpu/drm/i915/gvt/mpt.h

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
