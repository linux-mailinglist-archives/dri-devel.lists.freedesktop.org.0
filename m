Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9059C4FC211
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B5710E95E;
	Mon, 11 Apr 2022 16:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4909110E241;
 Mon, 11 Apr 2022 16:15:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FQXLuetkd6m8pATWeiBQ7XL3nLYLJoLXLgK61E0wtTbUmvU3BE3qtzLuq53UfA7JtB+jPXKtbQVN6kdQtEOUadqO/s6zEVUz9qq+vCukcHjR3jHrZEAFpZQZkmUn1DftE49ZpvjJJ7hOYG5KOIZgMDKSTiD1MTUOiwwoFDC4CBv5TjtcmPs+vbF2keqrMgEo6fNNp80YtMU7oE8yQoecDGL6GxBkeWDCpYeRX+mUm9t24Y5eJn9CDYG1v0E5uMvmcAoBUCnkpITttcE9QC37ap0Zfd4zIKGSFNkCiZyMpHc+IHi5O7+Zj03uHtECU9vctIDeaDOU7ToJZZ/H7BawoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4Zuyc1C23vB6tXpdeAE7bTDquLZfy+fdeu0BC/cx2E=;
 b=iZiLKpPPCXGHBXcFMhkKNLvXhYBCZTyxJQlT8bRKdSiA4rRVyGmm/eF4P4JJUlTthuEbRWi1qT+UiGYWSRitIqp4Pam3ceKZcolBSrDkJrrxPFxrw63gn+n+4fzs6Xa/pccaHuP0gS/VxlC6F7oIJtImzSvU9njjifIuA4X6R6FBwAl/nWhTGH9+QrZRnmL8JArFPcXhzIKs2x4KlkrpPKFz/EaAvk5ZKdhVpGccmvHkJs8Q4YqyaG+97Zb1H4tmvh9Qtc5HFdJKK07rDILl6aLcL9f/GWhGGfWIbqyM1cZXK26dUqniwGDmEof+yS6KfB3V6bHF6wOyuKa3QoaVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4Zuyc1C23vB6tXpdeAE7bTDquLZfy+fdeu0BC/cx2E=;
 b=a5xicHM4P+/H8s769Qpk6dxNpjGL7o9qQZDP5ForTPaPjCELCvyt4og55JHhvJxxha7l7IwH0scd91cWUKRGKf1C9fRlU4vvkh5CeGOFZVvlaFqugqbHVWTYrzaOaVpimWLKvYvwOCWS4Kez0Lcx8xBDJ50W7QyQGTZoEgOFdatBS0/taO+n8dvkU28/yWnq2iUzPNWWxqQngVnHzcxIYEnDEwTIb4+WEB2aaysGNKorFWuVVdxPvk/VqQTwo9JxuiZaGOOCNtsxeAtRGulTRm/4MjiMNduUtUMbBm4DX4Iu+YEH4HwgNHPaiuoO9E9JFEAgL3E/dQkyVGhCuozcmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BY5PR12MB3921.namprd12.prod.outlook.com (2603:10b6:a03:1a2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:15:56 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:15:56 +0000
Date: Mon, 11 Apr 2022 13:15:55 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 13/34] drm/i915/gvt: devirtualize ->{read,write}_gpa
Message-ID: <20220411161555.GO2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-14-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-14-hch@lst.de>
X-ClientProxiedBy: BL1PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::6) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a53fd63-9b0b-4a55-1ed9-08da1bd68ee5
X-MS-TrafficTypeDiagnostic: BY5PR12MB3921:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB3921134B1FD57B83ECBF80D8C2EA9@BY5PR12MB3921.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hMmw6xDPiPZNjrp13T3JnZjOAnXjW4pYbrLDflt34IcesNurVU8fRU3cfummamRiCIAlZPB0eX253ZFANQebqqzJz5aVQpOFmdwIOrUo4xaHGPDViWy2xXMryyIao+wkpYaW9cukgmaFjNVQ9jBSwZ5NmWfKJqKFKf+FYvT2sAq9wfAzZLyXdoELAI5YUYyKYxgzW3+dcr7kup9TD2T/Ndcffb3VHH741g6mfEfM6fw/Upww/RU4ibp9TXoPYg6Ptvd5GNpcaEBx1/nicxme5EVY0qVe4YPWJ6518ffUBHCCt/bki0UHpf9Y2zZD7KHgo9o3W7SywraASUBBLJhSnRiBfWZDiku886QbsphWgkgyf4gA6zT0sptZa+2AV/nwMswrTkj05kh8aBAJngL1txifctx+g7O+uEBU9c9NM9S0fFUA3sfDUrTbuVaL7pEhxOyhy7I+1DVcJtebDC6pPNBFeoEc7jxJ5FZ/EyxBL3M98NwgzT5aGDnV8l65zzG7ojtwzMX5CdC6gMlc6U8/tBtOYu72AtfBFbIk72stWNKdJScdNZaK6M9iIhvBShBQ1herj9chyizl/trpT7992YBGgF68zBDzkgP0jNciErEPkRJnbKLGI63IvnVIYnhd+Q5Bt910LMp/1nCbfkkdFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(54906003)(6916009)(5660300002)(6506007)(316002)(38100700002)(36756003)(8936002)(6512007)(2906002)(2616005)(66946007)(33656002)(4744005)(508600001)(1076003)(66556008)(26005)(186003)(66476007)(4326008)(6486002)(8676002)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xXTROvpXoTZjOvy91NsFbGeurBr7lWrx0rhWfIF3OwAXZc8RyNUJS+pH5fcZ?=
 =?us-ascii?Q?bgKM53J02z3Iuu1XyVh1JwfGAjuSeaDvZcm1hLmk8O504bkNgwZcntL5smM0?=
 =?us-ascii?Q?sodb3hNJXRCHvanZMxcDmzZc95yh2u2VMewgeT0mJ2letssTZx2UhVUFBrtp?=
 =?us-ascii?Q?6ojjVk5wUe7+ZtoOw98ZZWHeI6k+mkhuE9111WxPEoT3tx8Ua2SPUskKl/e5?=
 =?us-ascii?Q?qhqejaSzMrvOG2DJA/ldkzNmtriIheOoJfRqGNIn2Kfd/Vqfffb4K+PsjPWb?=
 =?us-ascii?Q?H2CJmiI7CxI/Ae2nDm3ztisdyfQ4GWIOlV5oM8nfhLD5zClXjgWxVVkz4CAC?=
 =?us-ascii?Q?t8DX8DEokFctkuiTPUxjum4NFR1BjvkAls/59ItrZ5m7ln1wN7GrijHo1/mx?=
 =?us-ascii?Q?z/QD1s1OA8jSe+qJ9Cj3dYkFQpGOYjB+wf3cdRNJYH3ARnjeAwDDfsv8e5+4?=
 =?us-ascii?Q?sfFKRKgCdCp7XnhjIzQ/5aj1/3nbAHrBaepvUfqc80WYG2XRVh4++UTEd8F9?=
 =?us-ascii?Q?TbTOOb35cSNbULVdQrVia+9IA8h6s++vnzwER42mLQ5Nb9c7rYJybU/mQpL9?=
 =?us-ascii?Q?6GGEyv1/E0lK84FciMqw012zp098QghWXo0CxLLe/nFSxIOUaDNeNWQuu8gh?=
 =?us-ascii?Q?yycYH+NRyCo4Taq+PEJkYDLP1a5LCIykhg1Y3ucNuFJ/knpKLoExUXWnQ20k?=
 =?us-ascii?Q?K0DWf4I2y+/sCTdrfYeSPsW9cOTdP3TdWVoW9JpGFNqif+y6GVE8dApiLx1v?=
 =?us-ascii?Q?0FmDP8t4THIFUQaSU/67eqVRQgBGHbcrSDEPu1wqO8KKLsSo9v/98H/wfPIn?=
 =?us-ascii?Q?mfgKx5/bS4GZ0mwX1IUBVkmb+auE7hGSma7riv7NiT82hd2gzJ4G7/FnIDPa?=
 =?us-ascii?Q?Gflexsr9duNgJrDJulvdyEZkz98c8fBT5z3gjeVljtWGyATmRnZMQDid+Epb?=
 =?us-ascii?Q?xfqQLcmTXEMxydzdIjs6A71NMYlKsYoCm7BpWvlCzLl9El+di5NwhM33ZrMu?=
 =?us-ascii?Q?JWwQk+ev5V2b9+69RdactR/gWNVQiP0DryySMrM7r4ddE8sAnkvRspX02I2D?=
 =?us-ascii?Q?ekLLS84lEoEZ2USpUVS08+evd64vSWdc4WSDC75dlan6q4JQIquoOxH35ChN?=
 =?us-ascii?Q?xKYkThk4Gt4N1NbRPGiWu2zbxb0Ruj6ilPx6fN53X8Fm+GufCtZGrrvko3TF?=
 =?us-ascii?Q?3vevLDs7NSf5Bk3m1rXjQrvSFG/fFHTM3iHIeEcw1JCLr84tc6eY5KO4VMUX?=
 =?us-ascii?Q?TQeG0462Ua9FRl+scANuyVaQC0MIqvKL9L9WTnD3zKkAHm2GA3QxuNqOiZtv?=
 =?us-ascii?Q?EhIHyC2ev6shjybhkd6CAGt7mIgXTwgTPm9y/jc25/GISAJR9l3vkhpY11/T?=
 =?us-ascii?Q?oV/F89UjwH5FI4Vkd3avgoHS9U7Txedz/ZhuahG9vjxbLf4r3wZPZU65zVeF?=
 =?us-ascii?Q?fLwtkNAnJ0Yg6v70HhnWt0RvoLVk0JtSxUuZXvbg7aE1c20I2uLfq+nSVSaA?=
 =?us-ascii?Q?FJtDNHxa6q5GWJU+QmjuEIkbXe2kPdLPrB1FM+dKdLghqfmd/EnAF+ZekDPL?=
 =?us-ascii?Q?7iPJIAsj49XBykR6Y1f7cV35s39XHMXj7aqFnddRP4tFfXpYIbUoGd3lluwi?=
 =?us-ascii?Q?PtYfEsWj4tfLnfNAWA/49bPo4UWPphnUTbX6KOOuwLWFRV5e3qc35wYDXYNF?=
 =?us-ascii?Q?zTLuCuKcJ/MURsGiqxBEST62HZQzXyQtB9/45IhvDax7mTb7tcFIKJh0eo8R?=
 =?us-ascii?Q?we1kqjsIOA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a53fd63-9b0b-4a55-1ed9-08da1bd68ee5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:15:56.1771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0YDnVUDn0DNB7vPgVNE5nG/mv4TADy89ebQ358bZ9QMqf8AyBh7E181LM/w3EYl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3921
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

On Mon, Apr 11, 2022 at 04:13:42PM +0200, Christoph Hellwig wrote:
> Just call the VFIO functions directly instead of through the method
> table.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c |  4 +--
>  drivers/gpu/drm/i915/gvt/execlist.c   | 12 ++++-----
>  drivers/gpu/drm/i915/gvt/gtt.c        |  6 ++---
>  drivers/gpu/drm/i915/gvt/gvt.h        | 37 +++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/gvt/hypercall.h  |  4 ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c      | 23 -----------------
>  drivers/gpu/drm/i915/gvt/mmio.c       |  4 +--
>  drivers/gpu/drm/i915/gvt/mpt.h        | 32 -----------------------
>  drivers/gpu/drm/i915/gvt/opregion.c   | 10 +++-----
>  drivers/gpu/drm/i915/gvt/scheduler.c  | 37 +++++++++++++--------------
>  10 files changed, 72 insertions(+), 97 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
