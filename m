Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64F44FC266
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC18A10EA8B;
	Mon, 11 Apr 2022 16:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2072.outbound.protection.outlook.com [40.107.92.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4BA10EA8B;
 Mon, 11 Apr 2022 16:31:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/Uuc2dvdn91CD7jAwXQzrlSMlTryz77yeIHJARyjVqXKuuVaOJftFXnYeKK49bHxGrnYuoJe37+QSpbceaaUNrnqDT0qfJpiOyTH06OOlC6tj1qHKaPy2ud5uLkfjdyX90ZRwyVA/0ReE+LddLeX858r8+Xs6uYx00sZxk6ojeakAUdNdi8KGkl0yU3qz8HHPHStJ+8zc/Z9nYpnFxUr/cG4EnLixWCLnGTYmk4sGsEPPqhJXb/KEfl3YMkuqFF7uYOrFwELp0aYrm8LytT/opqRmRHrtPrxdgtQILXuuUo7imcYUPEY9uTWPjrCO8KmkpXxndrVbMWqnfO0eUPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3qu8cOExeDH5IUfVEBYmaklyqGB3ZTfP06MLgP8vko=;
 b=Nhu2WC1LEE4XCK0FhDFrwlNZ+x7VAS6eWM7lAKCjLltnqGhQj4pd9QQQh4j6bH60OJYv3I4H4DuJYRfH6fTLqnRFiivSb5GhzdI8JnCpJBiDWIMcxNBn+PIlVUU+s8US0AKTTRM6R3RCG5mVK8IUVp20rgAxVauFLfmlKONnokBOooj9xIv+PhhjzlT2mqmhtF0gh32N2jjbSSKllx1qe6NBUHXdtnnvBAwkCQXuSnoL518PB9kXArmB7L+NYvwZyEfVBagaqzsa+krpddpkLdq8X41KDvxTRya+56ATEA62B68r6SrIB+2dRwvEFUb2a1HknwfbhNo2JzC6D0x6fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3qu8cOExeDH5IUfVEBYmaklyqGB3ZTfP06MLgP8vko=;
 b=Gec7dxgVlMVjqrJuFTWib8GLJ5xv9PGaT2gKFmTqW3Gr+yBcjRU9tc/2fpbAnA+QrIARBRYV/2ESUJl3bKfSDUTUIrwBZxy/AA4uHdSCyQJhFAvfUmlxW0nViFXUAcKsk5gXSSy36OmGbqsoQzFzO6zDvl7p688nJ+3U9HIYgAiYRa6LI4tXdZ9CpTKU77UsI0jLc1KZjpHu0FP7ybOldqWr25is54NhzG9PhMJtizgUb5rKftgm3FKXPn0AZweLef0pCcRe2cb/A52ZZwH2kD8YE9k2Cud4FZqSpNB1V5bc+WY+eZ2VaKpppCVlDODeL5Y07Rkez4LTKHc9TY5NjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BN9PR12MB5368.namprd12.prod.outlook.com (2603:10b6:408:105::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:31:03 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:31:03 +0000
Date: Mon, 11 Apr 2022 13:31:01 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 20/34] drm/i915/gvt: devirtualize
 ->{enable,disable}_page_track
Message-ID: <20220411163101.GV2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-21-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-21-hch@lst.de>
X-ClientProxiedBy: BL1PR13CA0280.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::15) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c874ad4-32d8-4fc5-d99c-08da1bd8ab6a
X-MS-TrafficTypeDiagnostic: BN9PR12MB5368:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB53683757615E261AD745CB6CC2EA9@BN9PR12MB5368.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tAGRzQK+WkbWgSRPGff3VvZLM6OYDQjoxzvi6fRmpDjPOjByQfA6SxwCxcUT94nBfWBlEcgyzjIg3yJykB3PX8p1FDAtc100C6VdJ1XtE+bM0N1q8SASNVoIrJSV+YZKqGQ3yiITzsUzXLanFNEJLA8RfzpOJA4izzUfLNvviMAvrAsk06gcYBOAp6H6NzFnebhpB8TMv7hujkMw9mbV9NNWCF51m+W0T6flcZkxKYB0pGtD353CUZCaUdvotRnfEWQLpzWKhxPeammcOZ4nqxZnv7C/Ze2ayNtHcezDdyfzQoC2ClwdiuxVeMvdDl4Qphj4tWgej40wZHv/NZWGxXO/3GPywmPhpdy2O11jxkEOl9TPJVlJSPoGlXKWDuY67u53yQ+7gE/1GJdvWVHxla6yQBITlYo4cGKmq7XhjhZkBqBJDWAsOMEaqWIRtFhLj/jVPEU4a+kZ5b1fmNjta2gFUg81osrkTxOn02eXDpbRgrDvw02YZsln5R4IZGtCzXuRoj9JVujTZR+N+mb+C6dQFj+yARFeOgkaYGJ6Gnfdo8D+56CDGPCBeNGpIlDJdtAPHbhjIq38Nya3aOBAIspDUU26KAIDOYOpUVA+arWcXdmXi1CN2dscbJg/cLcRfvW/7MDDdAROpc+JpPi1CQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8676002)(66476007)(26005)(38100700002)(54906003)(7416002)(316002)(6486002)(5660300002)(508600001)(66946007)(4744005)(8936002)(6512007)(66556008)(1076003)(6916009)(36756003)(2616005)(6506007)(33656002)(186003)(2906002)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f7Xdje0N6TRN8Wnk7rI6QB6mIsmiPh+WLiNCALHgZq2R86Nt4yy7FVdZ9pkG?=
 =?us-ascii?Q?CUjTv1BOOWMTJfYLaNAYpET5+1vSwodpK0cezMOMNejSRTZq2CMuWdt4wDAf?=
 =?us-ascii?Q?Fkn6xFcgEwAiPwhKTz/j2FRwBCBQ1k0dl1J6lMJZzp36xegOs5qn6kehfrbZ?=
 =?us-ascii?Q?t0xQLIb4C63LbNSHouGnsSWxq8uz/J7FnPgUy2gs2AIkAah1U7+3Xer2IQXA?=
 =?us-ascii?Q?wxih/HI2TfIngiDERz5uZq8G7J5HgFZPZUt8XKDCdQ/C/MJf/7AlJHiyg6cK?=
 =?us-ascii?Q?0/1vmq27aZZWIWO0EepXD3RrGDdQKhioUyr9QwRMEsbGCING6PNzCt5IB8R7?=
 =?us-ascii?Q?24c9NshWI69RlZ8Ok5iHc5U0f/4/+kUvTZQ6oDFqCNHdyC/GEcGkT0IsaAPk?=
 =?us-ascii?Q?0JtQTOmAr/RG68V6b/K9yHCzNm6+EVX0c0nnmfLUH+KtXtmpAOrpwRWMOHBp?=
 =?us-ascii?Q?96nyvGqNrrHEesEeSx11yHbo6c3yHPgzh1y7ybdm7krSVmbtkSkGR7eu1MNs?=
 =?us-ascii?Q?VEJUL4PfiBIs8bdEJ1Nuoz+fVwKDEH1zFBcsh41EOY5rR7SYL68OjpDu7Mph?=
 =?us-ascii?Q?QuAhBlmFfG8i8BdyXnXWfahjDo2i/ONrkxZymTLsrmkvY1nJmGQR7nB07efm?=
 =?us-ascii?Q?DFfG6KVTb5KEPTONXrrwjZefEj5t7WLq78bg3YiK4Shg/XLukpYVcM8imEYo?=
 =?us-ascii?Q?J3eGZzdCu1YXAhddpqBABcZb8O6ssc2jirKM1kWICPuSFMP3e9zYQkWT+jDM?=
 =?us-ascii?Q?ln/GpeuTtY06cu+O9fY+pet2ySrvdLiRc520xXqMTei5pTZnTdieJOxlF2Ho?=
 =?us-ascii?Q?KPnGz+3ZMH4X1B1+LITLtEkt/ix53ZgT9BWYUAZEzUtLJVBLQub8guIV3fLb?=
 =?us-ascii?Q?A2LTUCZGEtjUaq4t/eHnoZ6P4+XI1y18lvmRQW+fkHHN4yUsZ0642uIAjAzM?=
 =?us-ascii?Q?Nbf/g3uxcUjne7Uz+xPUcVyNlkluBRFaTzpH4ILTuHHDH2jBl7mGd76w+QFb?=
 =?us-ascii?Q?+hHRd5gn1AHioCvfPRDc6+NB9fCkhWK3eVndyyTs5pYXPpgShExL7vHXF1FZ?=
 =?us-ascii?Q?Be04sg5L4jTmkXvq7kBer5tn1GCljbkLB54jjBPPp5prSZ00s+b6d5Pn4I6l?=
 =?us-ascii?Q?1GEuDKd2GtNt+ybLbpr02pE62FVP3DsueXEUDDpE5Urw/aMedI5f+HNisJSl?=
 =?us-ascii?Q?H2JK3yCGYOG47pRWx8pRo4D0K6TqR1ISr5crF6JLgxZlbSZKvHY+FpxtKo+o?=
 =?us-ascii?Q?/lkXViCn+LBocfYDZlAWdHBBIM6vXsbFrwX2uCcJVw1okQPWYoRqhVmvYYM8?=
 =?us-ascii?Q?wi5ND+7X4mcKtk7VMVK5CDdA17t1eDSMDaIWN/ihpn+KIFz1LfEh3GoWA5xm?=
 =?us-ascii?Q?kaVbmoBX3C8oB9jgvzHHCZkO2ZXftW2uEUTplZ6CwdMog+HtuoRmoQyD0vNy?=
 =?us-ascii?Q?aif4Vr16thZVghy6LuoOdS6iDbVJGxV4YW2TYHAmxifOtBJYz3elqlcMLyGg?=
 =?us-ascii?Q?PJIesgjqoh4y1Vtr+ga0fgsr3UsOtaR1FE0/iFKsNpphtZVP6JRcbqhgW4Gt?=
 =?us-ascii?Q?soAqSYnAghZkPHtmsRYiDyCYDEuTJE20hrrleivHvR/qGKftN6ZoT+l9vna9?=
 =?us-ascii?Q?Ve/Xcxm0Cn48Q6Vcx/HiUpYkTE89ATetL486rdXZM5HmJk3EPvol3l45hBU1?=
 =?us-ascii?Q?lrX6Tj2KfqOVt6hXbvv1cTRVo1b3kAVyGM0GV62oMb+rR+anLZSnNSdmrS0p?=
 =?us-ascii?Q?E+4SvfN2uQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c874ad4-32d8-4fc5-d99c-08da1bd8ab6a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:31:03.0857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3zyODhbSML6Riaq/H+ra8X6zkKEDyDuYk70/4m2z4MCTu0KKyQXHpFD6LzA/ORm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5368
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

On Mon, Apr 11, 2022 at 04:13:49PM +0200, Christoph Hellwig wrote:
> Just call the kvmgt functions directly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h        |  3 +++
>  drivers/gpu/drm/i915/gvt/hypercall.h  |  2 --
>  drivers/gpu/drm/i915/gvt/kvmgt.c      |  6 ++----
>  drivers/gpu/drm/i915/gvt/mpt.h        | 28 ---------------------------
>  drivers/gpu/drm/i915/gvt/page_track.c |  8 ++++----
>  5 files changed, 9 insertions(+), 38 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
