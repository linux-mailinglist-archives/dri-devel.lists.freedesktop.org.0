Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E1443297
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327D36FFDB;
	Tue,  2 Nov 2021 16:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2065.outbound.protection.outlook.com [40.107.102.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03626FFDB;
 Tue,  2 Nov 2021 16:19:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PwJ6WW8e4m8hK7d3LOcIgh75EAu0qrQ6eQ6dOJtx0oJTNOrY7G9dXF5/xdZknjHyIGxMtPnHYFZz6oW61K3xOw+pLok51FyRkQtP0FmHsDH7onAkOEPNck3JE1dimZnt+nK0UutxMCe5DnrB0crXYLx+6xpGl10WzRZTm2rXaHNw/Es/WiDNcayXVNwN1gAsn5735Yjwlma63rESRXlwy9tHiKos4Da5Ll90WQATm8R6klZy6Eya2mgfa5XNfyHewXQwBkxY5MiFgnOqW0iOTQxrwGVfzyaknp0UGfckwlx2tmf8yzS+o1DIGk47rJURTGBpZXZON9SeW49GF0fwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qT+8tNyFy8DDcbJhn+5QPnPGDHYZIyE7QuplLpY+Tk=;
 b=Pe6hyURMeYufIbbnLJBqKtv15+uODyY+q/K6Bw4GEQ8mM5S1tgGCIBrtLRn3/3Lvwr0wN0Zks4mDM1h2Ynzs1QtWAAmE2m81cvjvQDoE8Q0ihvslOZiczQ6Pf7kcJFHevWwHdDjGx6YsO72OyyTkYcJJkZ0ixJ1LJxEVcwaOdhcIH8COP0oh+K+2iHFlp2HSCuPS1QK5RNRXb3OMaDOibVNdpw6hJMBVDkMa5gCUeMcfeKtAqyvmoMxbedJkSqCNWlFwBLSB7p7vVF8QE9KsRFSECA85lbrlbExXNY1VipOZgzfRAQsAEDAjDlVNCJ2EEsIfb4WiV77HXRRBnrTnwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qT+8tNyFy8DDcbJhn+5QPnPGDHYZIyE7QuplLpY+Tk=;
 b=SXyV5YUMTrqpkgqRVW2q2JwXJUSMDKhtdl2PkjncW9CrhKGHyP1h1Z+D/QQS8WVw9znzr6QWz6Rty+4yeQh8RfB+b1btR7Gev0rwlT8ItOxk+vExEhvuEIXijfymcy95PKzTU1UlkIhvmJyOLy8ErbTw2KzWDB+aYsJWhmSNoXh0BEON0A2KF167OSRAFCo35qPNJDGq44bgBjLnQGjm0u1Ytd0OqftknFJ3icK4TaLDXOd8w1IJnXiy9BPRvZIGDf7KfTvYj48zfI2g0djiad9gPjcGxUYJMv7YJkdt2CII3Zvujb82rDkTCkc4XYNMfuG0nGZ7P0BT+zLxHTWDGA==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 16:19:21 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:19:21 +0000
Date: Tue, 2 Nov 2021 13:19:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 24/29] drm/i915/gvt: remove the extra vfio_device
 refcounting for dmabufs
Message-ID: <20211102161919.GD2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-25-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-25-hch@lst.de>
X-ClientProxiedBy: MN2PR16CA0011.namprd16.prod.outlook.com
 (2603:10b6:208:134::24) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 MN2PR16CA0011.namprd16.prod.outlook.com (2603:10b6:208:134::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 16:19:20 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwVL-005AbX-NP; Tue, 02 Nov 2021 13:19:19 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a0d3490-eb11-45fb-4506-08d99e1c86d7
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5320FA5D995B56DB0CA936F7C28B9@BL1PR12MB5320.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qtNXGjlYoY1l8rJCcFWZOJbhEW9LAk4E1JV8l/4+RSnjMQtmrld6oC9pBIz8wZPonxCjTPYyAIXshVp/NocbbYtdcsuuAel5fMh1wbT0EWPjCftjeXMtm3FWnLFCKze2R1gS9LcantiphhFgsFEkFvjkEIcTlAvkk0VW+ZBh/FtrUcWQNr+eSWqjEw2I+wxGtZxgjvza/YA4sITB83OvGktiD2FWXekG19jV3hwqLzbg+Bg5JfS3UkU3LVBsmxs1ifdwLxdn8TfFqyMDH/P6D2o62SvjU6V8bJcmpkxbyTlwphBummb4qVB6L1IXpUJJYVfSO+ZfKiEtFgtylzE9BN58dD9/N+X5SD+9ajvHlZYvl47jm4d9GufxK1SQT/mmRIlcfXTJKCxQKU2hKLvJLKn5EQu2h5bgDFf4JKlBDOoA2b/rUXX2qjqO5U2nQduu9nJA5Vx29XDljYovRh0jzVl80lvrouu22NWKF/HCeXWXuB8ThXT5XwnJIuhxgThVbN0jxrlIpkqvFxZeC1gFvjuGol7ksJFZAozs5F8I5Ml2G6knLnfRACRId3sxsQw6IAmQAFSelDPo1mYZ5F39gJbqFLwiBaCLTfTVW99sjnN1i2ebY6OojUEZ2+eWPPdey0XWFDPnZmiEZuoUhN4j9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(4744005)(26005)(2616005)(7416002)(5660300002)(33656002)(9786002)(1076003)(316002)(66946007)(54906003)(66476007)(83380400001)(8936002)(426003)(66556008)(186003)(508600001)(6916009)(2906002)(38100700002)(4326008)(9746002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ezkoqHhfitM4+jVpVA8wd8L1EEIeS4Zrl96M5OyEzsDAcZne5PsJv5NpkWH4?=
 =?us-ascii?Q?ZY4Zvnhtumv4yPYTdFPYwDOadqCUivZl5lU9LS7J+mZtR6ICTTYEKnNyer0+?=
 =?us-ascii?Q?uRFknnCO0pkSSrb3LI/MZpwPeFwihm6VQ4PDGI6XLz0DWqkhOCqkGixOfHiW?=
 =?us-ascii?Q?sXSvbkfgicJXWWwJUXoqWQbCtRvdjF/BdjF6eORDoSZml+Tecg7UqY9eg+I2?=
 =?us-ascii?Q?/Je0FOn3G5k4vFfggFg6ulGnlFgQGNWOvB5Xq6hyhFFAhZpTui8TVoUuNANf?=
 =?us-ascii?Q?uZnD2yZ4ZFqEx3sRpCJtJg4yCEOnNHaB6QmGsJZWFOANJl01xzNO1JKTMD3i?=
 =?us-ascii?Q?0YUGQGiow5mxEqrxlGxD3xwn7X6PkNGNfAYzOANp7ACTKXl0hLXlbZcrsuo6?=
 =?us-ascii?Q?U7mMT3Dp+oPCWjRyEiFoPcz8He0TJqxmNzVNGJbLUOipSmLigG+rOCw3rn2t?=
 =?us-ascii?Q?DqVxW4yLPLewMoUbR4ZFuLvRPi1oQnUF575MZuGkU2rEqhxDV4K+SNZnESGi?=
 =?us-ascii?Q?VB1Jp4TNvO0Ul7sefRM2bNhy33RYJo6wazr2sKWAdhgPo/bG/fZQZaNuAKY5?=
 =?us-ascii?Q?IsxhVf1PbT1jWOqKzCCvqLJR048Ouqmn/LOeN66prw/jgN324ztfHw1AcKwL?=
 =?us-ascii?Q?BpcMVj0GcYT6uqVNuVALx7c9q/T2qwrw+o8BtFVpwr5uGr48y1ojGC3D9nUc?=
 =?us-ascii?Q?vJvOuSak51IdKCpndrkyJ1VAlctWKw9LgHyJ/59WlYphj8U2KFQjFn/maybj?=
 =?us-ascii?Q?imBGcWAsjxF/xJV5T9rHrM2sWVQFZR4kRk++BkuVmsQDl1zBlfFN8q2nKhX/?=
 =?us-ascii?Q?TzIiKg6P9CbysT0STsW810H5Bsz3IBuu+QIT10xazxFrS7lFUDpP1eeuvMVM?=
 =?us-ascii?Q?uU1dsysfL2L0HfqxlKM8nUq8lz0pP09RUYBED5IIta68hFBjAYBYat1lR49S?=
 =?us-ascii?Q?ODSG1DsRCl4dYNb967TMTSnlL4xpoO4IIrRN5qxfGZAI55l02/Gqqzlzihc4?=
 =?us-ascii?Q?ROHDZGhN7gJt7X3wsM7syS0ixo081VAQpcDb9MtxkBXrtzFZSdwbDtmaLLtE?=
 =?us-ascii?Q?UUQNUaOFu0PfbwB8g3UCKpIbpDS51hWNhlhLJd4LpV2E5xy9lJDX/2Ghhzyw?=
 =?us-ascii?Q?jxFM14/aYSkL/p16AVE3fu07dqzNyXoUZmMJcSPRJpRIjr6IEB2zksSGCv6e?=
 =?us-ascii?Q?oP5RBNv1OOcDq5vIArfZP+q0ePvAwYPy4ISoOtKFi5E19dM1+TRm94zawdKg?=
 =?us-ascii?Q?+3gGRRY+0XPK2+598ME9PiV5U2zUtOPSRPJQriGn1Fp+TKwmP29U9ImUUEpX?=
 =?us-ascii?Q?uiv/vUCrzorIRJS4ERignoPoKpqjWDv7mBnP2NGt/iE7TZ02gDfg3WcZzgco?=
 =?us-ascii?Q?JSowf9MNPUwzqa9v/XSLNBW6Zjv1X4wecXIC7OSCdoMly6PPFiEqDG9aaNNS?=
 =?us-ascii?Q?MCc5/lavXLxMW71iTqbXNHcsvEwx3kwGJQSVR9L55RhzPfZa11kT+R5DjqSx?=
 =?us-ascii?Q?b8pVtxQ69JH1ngQnXbkuZCn09dQnMf8yo/Al0MSZqNuyZIudgtSGaZB2SK1F?=
 =?us-ascii?Q?d3kc06LP8AFbkQryhh4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0d3490-eb11-45fb-4506-08d99e1c86d7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:19:20.9428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqwF+gUt42CDu8DAsQNUlbFWrFFhlb4d+BgptXJkQ909se928faTYRtKQkbCFCsw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5320
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

On Tue, Nov 02, 2021 at 08:05:56AM +0100, Christoph Hellwig wrote:
> All the dmabufs are torn down when th VGPU is released, so there is
> no need for extra refcounting here.
> 
> Based on an patch from Jason Gunthorpe.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c | 12 ------------
>  drivers/gpu/drm/i915/gvt/gvt.h    |  1 -
>  2 files changed, 13 deletions(-)

Oh, here it gets fixed up, yes:

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
