Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9AF443251
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 17:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DB4730BB;
	Tue,  2 Nov 2021 16:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2049.outbound.protection.outlook.com [40.107.236.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA4B730BA;
 Tue,  2 Nov 2021 16:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qhu8sAPxSZoJQnxTuw839ddykTj5jzyi1XNvy+rSouzV64KAwbFWAHjSdG8xhpI7l/vohBkbOurExrPMPCg/MrheHD0DELjwbd7T1IF67Euv8lvmUFdN7MJ1Ftn46ynKkj3jxIsiowOKBQv2S3d/GbCHax8TlgI6RGis4X13P1dwbOTRKPIU7MA4LbKTFkfr+RJ6j5Zw6bYDd90pzJEPdXqeKRbMCTI475B6aDY3/qXqyIr2JLzhaK0MQtSozl8K3e5M7MnHVRjzU7hPOHLNFR78Bu6aWPzdMXIXTuY8EwAukjmj09eiGiqvRkz6CnJAryLRDkCd2oaQRmi03CRuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zgDa6mmBIH97BLeT7BA9K6IwR2OfMFQOZGlpyXxs5f4=;
 b=cxgD0+BY6b4LXbrXjIuTulNskoVV4Hrmb96o80LAaJFL21FrbseNRkUSHo89DBUHTIX109pTFfdeD/y9GMEaXvkUzEdJrFf9EZInQRDO5+rnLOvD3ihumOY6vSnLnNK/8M/tqD1c73UarO1wVEDMuaHRWrZeHCv1o/CAF0f1COM5OvqxSSfwRUiy9Vof31/8DvFMvVXQFcC6O+gtt8rgMNAzfG7ZXSGpmpJYc5S9SVyOtYRWujM0tYtzYDgLLlwQzONIFBTsHizxIE9wfBJNU9E18Kg2uqfsu9zcOwPyWcOu7GDZyiEBrPr9jX0Vqj2QQQNzKAiAf0gqyQkR/48Idg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zgDa6mmBIH97BLeT7BA9K6IwR2OfMFQOZGlpyXxs5f4=;
 b=itQwejyrYf38rkxQBcztSnQFPXaMnlpWDuYoEROpuldSpbQdrTI2c2g+Hm2v2ZwXm4hL/nPm8jwyg48BQKB4KN2H+XWZ/vWXbtYpRIu42gZJZxGW05X7Z7203+cqU1fVVio5W9ATTvNybExKhdfg+X2XFBPapBPXt9PMye9wz7JzC2B0LLOThOc+uj177Emw5hQMSMI5rPp33bFMjO2TAtR865H1vflOlvcJj7AuWmhxg8lJI8O/ndH/yLtU6iFFc6OCbwD5Qktq/n2HIR+cZtNP9L7/DKUQWRPuz8rxoa45aEiswv+cykr4b7fgcKMvYhcg12YrI9AZa0FjrkvS8Q==
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5523.namprd12.prod.outlook.com (2603:10b6:208:1ce::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Tue, 2 Nov
 2021 16:05:37 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 16:05:37 +0000
Date: Tue, 2 Nov 2021 13:05:35 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/29] drm/i915/gvt: merge struct kvmgt_vdev into struct
 intel_vgpu
Message-ID: <20211102160535.GP2744544@nvidia.com>
References: <20211102070601.155501-1-hch@lst.de>
 <20211102070601.155501-11-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102070601.155501-11-hch@lst.de>
X-ClientProxiedBy: BL1PR13CA0105.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::20) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL1PR13CA0105.namprd13.prod.outlook.com (2603:10b6:208:2b9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.4 via Frontend
 Transport; Tue, 2 Nov 2021 16:05:37 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mhwI4-005AJn-09; Tue, 02 Nov 2021 13:05:36 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58f86a24-4559-43d3-9a9c-08d99e1a9bd6
X-MS-TrafficTypeDiagnostic: BL0PR12MB5523:
X-Microsoft-Antispam-PRVS: <BL0PR12MB5523C9CD16B130184C6584A2C28B9@BL0PR12MB5523.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8B3cObYLyXtc/GKc3G44B90OhADsx5f5wWeldFdB6rZmNE/2tz4edfe5Rz+jeKhMxxbS9hs4A7GVrL1ifvYFKxomAKKpJEn6HkT8bQ6HdWdqXk9u0dzmfkHmvwZzvs4YFb1s6v+oT0cBS8mx7Dz6mCdZW3pV4wBG0SfncSGxEEwgbxv5MQFFBXvAUxlkbemYd1gXgVQVsbh2TjhJhCU2FEZ0Adc2r4S2H85U+pf8D0HW6z4oWK24dC/n2fCLDSgwncE9RqpYGsQJn2ADqQT9WbaBtQ0TdDzJ9KoeEkno1VFLn9uYRDAbplQKjAC86lDotEln9jHtlAlMgxn3ELoDlRnQBbYOYefSkDA8bhoh4My16VcGMokUw8taRY9eNbfBzSc7DXzfwcVpZ0ZoSOabCnllYxA9KBgIEZ7FFPcRoQnpJkXuxWc8lWl/ZO90blu75cCiaM3VzVRDTu8O/t3PflX+zOcigRoXZEVsdi/7rV+LapQIHSlZ2j+vEpQtIszPbu6nL4bClBRBclw3fcEt2WNaBjP+LtXA8IMCkXasRsNCs81ndvp6d+jgKOHKiozvfFB/R34ySzkEC9J8pBJ9NmHX8tuJEVY0jwdDtZMCsf3NOymQXbVxBx8+qkq36/vVoizuVbvz1zgOkonZcZKO9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(316002)(2906002)(5660300002)(186003)(83380400001)(2616005)(4744005)(426003)(8936002)(36756003)(33656002)(9786002)(9746002)(66946007)(66476007)(4326008)(66556008)(86362001)(508600001)(8676002)(54906003)(6916009)(7416002)(38100700002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KyvM67iX/RGf+Ti0lYCaG3PnlSTu4f6qQeeE23UxaYx7DLMa92d4rGIAlyIF?=
 =?us-ascii?Q?YdLYGs52XUPAelUoFlJTTRiAEi8pzm+cuTvaz/uBPi7lWHvu0lzfqFOsaNli?=
 =?us-ascii?Q?rw0igGeuQvfPxWPsEWcgo6qqofcmutASKGuxEL1dfhET5Y+FWPSSpTOO3sQa?=
 =?us-ascii?Q?CGu0JB8DpYPfxt1oPY7iktyZ+qd6uftcZm9gxkbvmVfyAnjwVCNPS+4m8khy?=
 =?us-ascii?Q?HzTgOscex9X/z+zj7boGZ4ZahIPuVieMfumjGfDcMrMf5v9n092iAwFQ+G0f?=
 =?us-ascii?Q?r595wZj9wO09fvqy6jmwEHyIVTEDX6F4/rVKfJHKjzUhgJu9LA/jANYIDghv?=
 =?us-ascii?Q?4TKk9UQu/+fDTr/WlfBuHiL4bAb5ZxZG/TJsF/vkn/pMPkXqprENhuM6WD3S?=
 =?us-ascii?Q?JU6sHSHvl3mmPV/4A8cPeZsXTswiFWeUKAjHP7YKiHpULrdLrWXW3YkWKeXI?=
 =?us-ascii?Q?3qvQQif7zeCjmtC6J/wxQ8FQ03KQpM0ia1C5ETk2JamOrWNPn5+tgN4Ybb8m?=
 =?us-ascii?Q?++HJCWp6wnfCdfwEMk+GyiZ5kixmhVwryffXoDqKHwroyXfsRLAQHfrVZSI8?=
 =?us-ascii?Q?qdTph0ZlPSvvs12H7KLKMz2Ky7l+VkfBc+qosXYdUfCyucrXcu3856/68RHe?=
 =?us-ascii?Q?nEw2TGibiR7tvvfntufDO6VU6poL2PRt9w5BRIhIs6nKDZe8ywh8ecKQ+9lx?=
 =?us-ascii?Q?Fc5zBAdlOzRAqu+kERWeZ9OPB9i9+WGzmGjrVXmd77tRT93B0DFLnmURW13g?=
 =?us-ascii?Q?YCTLwMhn+BJfXdAAzZNVXIc2VEDGIL9VHlQe8jLdK2auRqAuRQ75s7zqEPlO?=
 =?us-ascii?Q?yB/HjrVV6q0+5Klp12hq1ibpFTR+kTgHr4ftJUnNw8MonGjqdSTz8gWmKEfx?=
 =?us-ascii?Q?kwRtCtIqGOriJ58orlN7f0aMoaUZ3ryIYmUaW9jZb/iDhTB0QVyjD2tIdqE5?=
 =?us-ascii?Q?pFyGyubqDnrMvvplMnziECADm+5BUj6bVWV6xOiXkiRG4mRZhCUpk2GXzsRZ?=
 =?us-ascii?Q?GLD9ykTJjqng2XYz+tpkj5n5lviQei23m5umNF31WtlNodGg21ReUI4QCkQ3?=
 =?us-ascii?Q?131tSrHUbkPVWUqW3Mafe6pX5fDZTR/FWSQgCIbjEu+7g9CAJQ+CzgbMBsqH?=
 =?us-ascii?Q?4qYWI/UvO64TOGr/z2SKMDYgwzAlytwYgkodRehyTDU3jzn3Mz6YY3x+o/lE?=
 =?us-ascii?Q?EUdEgaD+DNIYH/8tPvGmV+p1hzIuwCLCx1d+LYAiV21Cj3QP82y882zYnKJB?=
 =?us-ascii?Q?8NvruT+asZ9nreLFLtz/EF/xZU9TqBDgziGVSfnkqXrhJohbB2JGayi6ZTXo?=
 =?us-ascii?Q?AxgJtojs+Esof5tjCEM5ifXehd8CRhmphb/xbSj0Ifrjj1DEtr3++H4nA3ge?=
 =?us-ascii?Q?iMjh+evfd4+cBx1J4hrxGhnpTwS6IBbuyJcPNDpjG6uWForphIcQRZgT9yZz?=
 =?us-ascii?Q?Nd1dqictraL5ZLt7n7SLIeVspdHSek6AEMMCr1iRIgSfjOzDKoutrMDqc4MQ?=
 =?us-ascii?Q?GSZ0ov4nrBYvJOY0p/UuOCus9lw9UpkqNNv652szq3MqBbvn8oozW9Mj5euN?=
 =?us-ascii?Q?hrA1GIiid5NZifcob8M=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f86a24-4559-43d3-9a9c-08d99e1a9bd6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 16:05:37.1821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJUQCmbentxxgbzgLhO7a9jogZoD55VGs2firisQ3LSsDcWJH0dRjmAzDPUKKipe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5523
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

On Tue, Nov 02, 2021 at 08:05:42AM +0100, Christoph Hellwig wrote:
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
