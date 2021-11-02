Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA764431DE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 16:37:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B023A72F9A;
	Tue,  2 Nov 2021 15:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5411472F92;
 Tue,  2 Nov 2021 15:37:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4mUuTxW3YzwZi8sd932+D/1izbiqLvnyFuevZ0FsWh+mE4oK7eZZ4FtLvXw6X9GC60mgroAd2BN81oRi9o5wUVzXG2aEFVXqN1yjckeR8kW6V5nNbE8C/O4+F/0CxPMuOZykduh3j/h1Cjv1J6L2xW29TIwoXJ0GFQorrY2V9qKWwFQLA60pQmXCm5KP2ltkAifx+lgB0iPzLpcvgtxy99MuT98UsGjK21U5i8kfE1N5qCE8aw/IEcFnx30meMXa9npvsp7JbVi8ecXoMOsFBYzy+ePTgeojDqJhjq08B+K4QLo9f9bQfqxfZg72U3MUBuKgMGg8Z0dmBH+SWBVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUDuLUE4H+QQWw2X9EwNHCaw3ywN4x7joYDEHF9Yx3w=;
 b=S9QlVW47xYS4K+y6BPwpYKLmyzXUvb6CDz3AYXAxLXZCyuxX5UdhqZ6AoRNI5uL2nmdcXc5UHOqLycCK300lBtY+w/sdaE5LickfEvAj2pxn96+BJrt/D1wgba5+t0Ud5wIhjVDDXWoI8u+4b1U0kS6JYBNmrh5bEuXnjQCOYj9J9XzJXOs/VIMh4gD9cArHPldeQ9Zy6dhrbhG5YkU2iK1xzArbpmJGP1WynwBb8oZSmtJ50fnvYvMSlTfVxFZQDB47673vZNc/bsxHjj5s72CXMNq0IkrzNilB4Q1SzwDDf5cVKzb5s5IBBIanoQ24KS8ABA7gp5APmAeuIWMTFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RUDuLUE4H+QQWw2X9EwNHCaw3ywN4x7joYDEHF9Yx3w=;
 b=qi2F5MkYLjoC6yTgFGmSH1wNT8SqxasqyhEZUMCW6wsCpE4fCcujT9sTq3sKMXR5GXDJG1Gr21v3UZBksTFcuW/jcQuf3EIKsuIzoGOH+IPi2I5ysEXMeAeT460ew+judnmAl5Gd+l6gfqL82reVdbO9CjK18Yze1S37lz4TCPjZrmhpgnzzu4lbVx9ZkQrNgFZcKtVvrNfvr/85QafjbV2PMxTptYercFVUKKrhoRf3dHrbrXSRIiY8px4RhGZl5ySb7extt+rcnOuoZjRDJcy3n43BrAxiFQfbDOGDudNMK3D0MA4mCcShEjMxRYwZhRWSASgfKG3w6YZTixdBuA==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 15:37:30 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 15:37:30 +0000
Date: Tue, 2 Nov 2021 12:37:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/29] drm/i915/gvt: rename intel_vgpu_ops to
 intel_vgpu_mdev_ops
Message-ID: <20211102153728.GJ2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-6-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-6-hch@lst.de>
X-ClientProxiedBy: MN2PR01CA0008.prod.exchangelabs.com (2603:10b6:208:10c::21)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR01CA0008.prod.exchangelabs.com (2603:10b6:208:10c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17 via Frontend Transport; Tue, 2 Nov 2021 15:37:30 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhvqq-0059p4-TK; Tue, 02 Nov 2021 12:37:28 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7a4e57b-b5aa-4b7f-8825-08d99e16ae5b
X-MS-TrafficTypeDiagnostic: BL1PR12MB5269:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5269F6010AEC62E25326FE21C28B9@BL1PR12MB5269.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8KJLFNb79dRkR797HHAH6SxFg8JHkpenJw5mErHsqNIPmPmgJraYupzuxYxudwghch5lTZ7APV6Rq6yc1LOTJ3jFHvbF6gqIP3Urc1EfX+Bx+UiyXCEDQBnz/1bO4iBn+hCQxylzQg5d1fAqVzckRarOKNEKMRkZW08aPf5PMp8gn32S2/WKwXUSX2Tx6RvJEJyerbAoz5IkNfweH5IxPGPOMVjPpVwtFc0xkIB4XcGrKGPaocpv0twhld6rs3s3mBmvx4wVHrcq8L5aOjmVgQx2rLiNJ4DzikEGhnyZ9k8iVoSejoFEtajRMgQ/xTOo+AJQ4Ndun6hckXHrDwMzG+hagkCeTBo1TEFfnTdTlkavJv3BEfi5sBttxufh4PwYTWh3/qr33IPeD6sJ/AZv0/8OKeJREG3pNJ8EwJugJuZr78h9f1tFuRQGMXhzgJLe+BoWGGG2yozSFdfxJXO62qto5oAU/0aeaZZnI4B/o3f3AwMqmm2CS3oY0tApS9Amh3TAlLtJEDDflyrWTazaqdJ4Zh1hZYbBc9oQ8XuvWbLHI82Y4EJLGODYrG6h5C8cjceIQqH3qUoGtlZUtlxYFF3DiMUzlQEgMa5aD+fzCaOV43A6BIIhMIgM9k4hlRlJQrsKS0NmCDo83qUO0NrW0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66556008)(2616005)(426003)(83380400001)(5660300002)(26005)(36756003)(66946007)(8936002)(7416002)(4326008)(316002)(54906003)(2906002)(1076003)(8676002)(508600001)(186003)(9746002)(38100700002)(86362001)(6916009)(4744005)(9786002)(33656002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1hpnknMa/Cbj/W05mbwkliyDCcidxJB1Y6JSMyKo9Uo3AcahY8caRSlos+K2?=
 =?us-ascii?Q?tH4BrlkhojeB0KqNj2Lrtau1KX57L9r6tfMr+BKAmRDBZO4g5dtfw3COevRu?=
 =?us-ascii?Q?uHI5HeX3A6NLS2PaD9rGB1Q3ZMn86J5khbeNVviQl7kPdwsFPy7ZR8O4bNp5?=
 =?us-ascii?Q?snkfVFCXRViJJWrqPA53d7EBGvta/ErgxI+c8qBhbE9Vzchcy0oFD9Pg6fUi?=
 =?us-ascii?Q?HySihKo63Mq8IXGdXiqP72JdQamraC4KnGkSrpb0sNXRGePAkf7xv3VoiZTe?=
 =?us-ascii?Q?kGycG6ihX2qMXJ0EvzaFE/Glcv/N1CzjeFVIEIAMTI+7tQTWYjLL+0Abx6rt?=
 =?us-ascii?Q?TDe8n3S41gr88+8+zqHbI3AVGBd9qbJfv3yWzHzoI3xRY+4pii4KVN4lNIwE?=
 =?us-ascii?Q?uDVgdcOUk1Ae6dby4vHzkmWxP0WfAY0lFsuhybioWQ6YytqLWaRZVkQcIKF2?=
 =?us-ascii?Q?Gev9HyuyeqQBW+zIVtjFNSVSy1AKvPsqaxzw1/yIF28/VJVbIRvWzpMgRjsi?=
 =?us-ascii?Q?QBPgm49Bwfe0uRo/I45urMTeviIuCgjlbpv7jUCfQ2S+p4+6XeQzSbL5ao7A?=
 =?us-ascii?Q?lhbQVhoDCdo6ETB2D0Jm8ojatPuOgTjWqP8VAJL54qA0LwYtq/cwuj/IF/CK?=
 =?us-ascii?Q?QTmHcCaZpLpdZGmJTASKFCIYNG3r79lqg5T7yPwq2X8pbeR72UrSa/LFNl8G?=
 =?us-ascii?Q?mL7o3WMlR4RV7CGiULzwIHlDPQFUgI2qKzazBfP3IGRqQHMfg5VXmSRmPXaz?=
 =?us-ascii?Q?BrFunayW9zfbvB2w08lgKH044TaivJS8tWBrHlfBNzqbnsYnMNdWsOYNqgGX?=
 =?us-ascii?Q?MiCAg1DGgQSfXnsoLye4eXp8dc6cpd3zCePWE8IFhX0x5OXo4+tMujqOoev8?=
 =?us-ascii?Q?KmQ37s0BbbGDkDu6pBB+iYYvyGxVJtutpmxy/nBd//J4klFSacnCUkLeSTjq?=
 =?us-ascii?Q?7oA/XJUvVI1Ii+hGovJUAWVMIGDWCBLIF8y1WDyQAzI7z89D3xuIDeif1nau?=
 =?us-ascii?Q?+uFvctd4a1d56IgxO5BDUCLGhYh+IuXGRoSBkYoWQ8t8umx8eBfhOOcKoRkA?=
 =?us-ascii?Q?j9/C0DBrKdKXRrfZF6HlIx/tze4k/FpxV/L41K9Tx2xvYQat1OHPPLV4Pg7d?=
 =?us-ascii?Q?RMiFrfUFWDHSynFdbQPqO4m1JPGVCjBYCZ4nl/AoxcAnhK92GtewwRk9pRyD?=
 =?us-ascii?Q?Nm50rLrGSrXb3sw2Au93TlK8GUYF9Cdn24BqFa0rr4dJIwZNGNmiWykSwb7E?=
 =?us-ascii?Q?nQxcGUCna5ckKs9YFcD0kbCP1mJq6A0be7a05EczJh9AsCa36YnQWbwfbN7k?=
 =?us-ascii?Q?aFHsXNd+X50xKB3ycwkEP15Bj34tCva6UcFANgbLOjiv+YS5h6dKOCZArbbO?=
 =?us-ascii?Q?fR5Yae9DVMjOT70QNEHrHJ1mxplbbS+sPMCekNRIrXXEhBq2NU8lMbgq0k+y?=
 =?us-ascii?Q?UJsglwA+zyVhJPCkjMUUO2CM1+E1NsO2fT+tT9jtJFpRSyZsmk+FmC7U0uNH?=
 =?us-ascii?Q?dJabh9fedJMWsAlumCYRejAon2N7DhkOIRHSVTle+H4Y8HDdiVhs4Q1RJwbz?=
 =?us-ascii?Q?eXsP5aNmqaMT2Ll3IMk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a4e57b-b5aa-4b7f-8825-08d99e16ae5b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 15:37:30.2762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRyg3jGHzTC26KKhqP9RBMfFlq4LG/NCm1dr8Z4oIOGRZREb4EBye81rUko2fYNq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5269
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

On Tue, Nov 02, 2021 at 08:05:37AM +0100, Christoph Hellwig wrote:
> Free the intel_vgpu_ops symbol name for something that fits better.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
