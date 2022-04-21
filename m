Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A301550A7FD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 20:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1367210E3FB;
	Thu, 21 Apr 2022 18:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79F9C10E3FB;
 Thu, 21 Apr 2022 18:20:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VYEX8MiMe+3qIWybvsj548ruFWd3ySvRtGlraRUVvI/kyd4wI7b+n0TlxZoJEnobGiW8eIofxgtecHghGwj3uJ5m8KlEMt4QyzRTkGvqh2sLUgO/wuRn7XTEJLEcQdVAtvdq0CLD1P1OrJMXncFqfL3Em4CX9z967lxEObQE6Spg8jEqMskM0BOACsecgBhyq/ZoOCVJLDGZ3XQoMco4FuLw7fCQZ9d/1Dif8Mpfjz81aJDpkDZUCnCn7UNtvqE4HvCeFzRKmnCHMlVvb+gMOM71E/AAewvqEJIRud3zWDz6T41YBzpBEkmSWA7UODd8HGozvHPxhYW8o8hlxv6kcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LssuzYtSndmpn90kpHY92m1up/SaEU3MmX7UacPqdXM=;
 b=fZJeRuOp1Jw3UEQuoC5JbOhYSak3rj27sXbMkY1zF9xYWvtpo+bRPq0W1ePpd7deUYEbSoo94IayKyHHgdQuBPTREmoxwIQmTbCRKi1QwcLYTuMJgqmLTeXN1Tr7LgOrw5kQgIqIHx8PXXNXVfKigMTroufYpKXqAIGzJdhcCvnA4pQ6VdOiGB9O3dSixp1dw0fvNrXeQQQUYzRDFFGs1XZFx0yafDG4jl3QCQTRBf8Nk3KHLW7Jg+zLRqiDpPNCN8Sfln7HAV2xCMZMTg/Xu80eNOg8+MW8wnZTDaSvTvsfELd/D+gE2uzNg6YuiZO2XSmDpKgtmIbf92MsZIgRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LssuzYtSndmpn90kpHY92m1up/SaEU3MmX7UacPqdXM=;
 b=m1vWnTNPiaqQ5F61BlFadYMUQ6+N/WKHJeeIDcPONwXVwNnw+MCopoz7JwsbyL2h87MMSYWsplLSLuVf1+Bjvop9AkKrr8YWBxuoy/geSPkAlOBPrpiqNvLAgUxHVnYzHaeqk3jPkGFnHdA2iWIf0ls//dkfnN/rFKgFmrZMZ4jQ+9GHmTnGeawafjur6/nlEaS3FbR3K6h83/6u0ddh00nEGaq604ap92yCnqo4pYwcQkQnWmq/6QLcA1RVui1Js+7pGfqJsCr7y58N7abXsvGVvtVbLydd1DVaLx9yjAQSdvfGGemCt+QWvni3LxfVMUzx3ukWlnoaEhQv19NOCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MN0PR12MB5930.namprd12.prod.outlook.com (2603:10b6:208:37d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 18:20:33 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ec2d:9167:1b47:2db2%6]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 18:20:33 +0000
Date: Thu, 21 Apr 2022 15:20:32 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: Re: [PULL v3] gvt-next
Message-ID: <20220421182032.GJ2120790@nvidia.com>
References: <25a713cd-0b7d-4c09-7d91-4f4ef6c9eb11@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25a713cd-0b7d-4c09-7d91-4f4ef6c9eb11@intel.com>
X-ClientProxiedBy: MN2PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:208:c0::40) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65875cd5-3735-4d58-8f93-08da23c39fb2
X-MS-TrafficTypeDiagnostic: MN0PR12MB5930:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB59304C772E385F7FDFC0DF5BC2F49@MN0PR12MB5930.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kEGPRpUO+E3thHugjBTVlCTn0EQJspfRG5JkuIgB+NhttX/Z+6bensXcrKiGHCM/h+Yts46c5ZmhQ9+gEk9W0dPVEwhJcInkCVe5BzDmjlMND7BcjTbX4h3te6kdTU1o6bncNyHbOJxzIcldatR0556fyPx2rwdAJWf4KyJcp1HbP9/+esJxuHdiZV441wSox8YEtePXnBggPxhlw96uKTTiULTYAx8ggdFKNGfcQz8ddk6z/wycbRcKJXg9AJj0M8ANa5USlcdKAGM9h7ndkPAgUuskrtPW2BY/W9NHe/PZLjFOZ9sOD7y2k0tRTmsfG22NJox7VyGNqqHZezVFwJD08L8FO2nviQhBGCD7j6PjCBj/hg36j0izc7kmeShBeZbX8wqdACR7Fl2aQo7pXkS9qMFNNEEah5ZiNh4JOBuD35KgjnTNpD9qH5aiYcZLDIMgOr5IY83vfXf2P5Wfh84VHfhkqkdJ7mAbohoDAMBQVhtlkURluWP0vDDt4VNodXeYaIzWAbx6mpwaNoSG2jlLd6qX/C5QO5XvJ0N/gwcYNVk7rjcChMJbz2gX41oRt214R2Zr3L48XtXGB7gJPixxtdT9+/ZgWwyh0gHINJgl5B+XdIWHMT3b1fUJcarWQMNIWQGHI4ylmZ+bqlT7qA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(36756003)(8936002)(6512007)(6506007)(26005)(66556008)(54906003)(508600001)(83380400001)(7416002)(5660300002)(4326008)(66946007)(186003)(38100700002)(316002)(1076003)(33656002)(86362001)(66476007)(8676002)(6916009)(2616005)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXpMWnBkaUIxU3lFeU5MVm8vOUtpQU5KYXU5emRJcnNsUVN4S2IxL2dKWTVl?=
 =?utf-8?B?T1RCc1h0UjllM0Y2bloxakplb3VCVklRS0dwOXg1a3o5R2VYNGllQ2RjMm5u?=
 =?utf-8?B?dERhS0UxcGlkb094SUFKZVFmNlJzS1ZDYzlNSHU4OHMzNC80c2ViVEs0aHpW?=
 =?utf-8?B?VFJod1ZlUUxLYVRjbkxzUS81d2tvdDZnUVBWdkZGTWNyZThQYVd4VWVTbmVt?=
 =?utf-8?B?eXpDdk9EOXQydzR4SkN0TG10bEFTQlorOVh0dGEyeWRyUTFEQ3g5aXlBMWZR?=
 =?utf-8?B?Q3F0U3d3TUpFbGExeHNxYnZmWnF5ZGxobFJjNWdXYjgvWFVHNGQ5UjR2WkxU?=
 =?utf-8?B?ZFJPMi9XTUNXYnN3RjBOb2lTWitFbXNwa2lSVTNsTS9Pam45N29vUjg1UFBi?=
 =?utf-8?B?SWRXY1VKYmlBZ2MxL285UGVOeWgxTUNxSC9Ya05lK3phNGk1djlOY0FlTEc2?=
 =?utf-8?B?ZnlaWWYvNGlOblBwZHBlTzNha1NidW51MEs2N25ObitnTVhQTVFkZWx4cUVW?=
 =?utf-8?B?YnlSQWtueEVibHFIc21ubkx3Tm5HKzdEdHowMk5NV3lCZXdGbDRiTFdadG9j?=
 =?utf-8?B?MlV0VW1QQlBJVkt4VkNsMVhOcUk3NHplbzVKd2UyWncySmJ2MzU0YUxZZjZD?=
 =?utf-8?B?RzQyZ1YrL2hHZytYVEhnMnFFeDNaM2NVTWpxcG1ZalRvcHVaTlRwK2NuNm52?=
 =?utf-8?B?U3ZDbjVvRUNLdVZnbEg1VEhQNGVjemE0dEpqZFBWREp5MTJPdExTeXZSTmk4?=
 =?utf-8?B?UVE2Mm5IM0lwNnNmMkhiQmtqMHZuNHR0UGpTdUNUNm1OZmZCdnV0M3h4MDVj?=
 =?utf-8?B?blNWTXBMenF0NUJjRExPbFJlcWdMdnNXc2k1Nm9iNnBtczk1NlozK3FMOVdV?=
 =?utf-8?B?SGx0K1lGajV6cEcvU2lDS0xRUW00NjJGVWFtWFcxV3ZJcXU5UkZQL3VrM1Ay?=
 =?utf-8?B?cjloQTFlYTU3ZFlFOSthOWlrYnRITFVpclA2NlhlTEt5UmhmNElUM2QrbE9Q?=
 =?utf-8?B?eVJ1WGRxdjEyVDZxbXhwRU9SVVdwRlhaL3R2emx1UFAzQ09qN1FOSXhScWpV?=
 =?utf-8?B?YUhKWDVjOUVtdzM4YTdjNTU4T0JsOWVOcndRVE1FWlpjbUhia1MvMElpYWsx?=
 =?utf-8?B?eDE1TklFWnFQdThUOWs1eHBUTnIzekxCeFZEYVBrUjNIWDgwckVaRnNjRndN?=
 =?utf-8?B?SVVvbXdlVEN2a3BoMk5GRmRTdjZQRWdoTEpkY2xvYnBqbEREbTR6QnZVRW5r?=
 =?utf-8?B?QlRlNmI0cDR5Uktob293QXMyYWwvaVdzZEtLSXFjN0ptUnkxdzRJM083V2E2?=
 =?utf-8?B?NGRFY284TWJUYlFhVWN0MzBOMDZWV1BMMFhDbWtBZldqbzFUbFpKQUN2bHJB?=
 =?utf-8?B?WE4xSThyQVpQckduM0dDOVJPQzZ4MzFYR21PbFUxTTlwcVFHdUJUbVlTVENW?=
 =?utf-8?B?dFhqeHYySW1TY2ZPUjJ1R21odEJQRHl2NjNUckNyWWRKWVA5MTN2SDdFS0Yr?=
 =?utf-8?B?ZDRNU0tLVnR4VVZ2K2hNZlhBNjFjZTdIS2daa3ZtRnFwTkFIZkhqZzRyR0E1?=
 =?utf-8?B?WEJVTU01TWVEK2RhaDNvTFRpZHBxbTMrS1R3MjE4Tnl1amkxdGhFcGhkNjlq?=
 =?utf-8?B?MWpFMlVaRXl0cmFKNjUxTXRuU2FJR0JDZDl3cFJkdmZBak5YUjBLeThQMnRZ?=
 =?utf-8?B?Q2xJMVhhTGNYcjVJMXNVMTlMdTJKVEJaTGpRQ3lMUElvbXhwOWxCZnMzTlNo?=
 =?utf-8?B?cnpBOXZucC9SL2NTU1NzZXdzME1pbktYV1c5WXZHcWk5Yk14UHRXSUJUbHk3?=
 =?utf-8?B?bDV0M1UzNkVGSDRjKzFmWmU1azlMZGlFTXV0dUptbTlvSG1ibUVydHArZ0k5?=
 =?utf-8?B?dGhKWjNsOTRyajhGc2VtTTFEdFltcGdlWCtuUlcxUXMyaXhPUkZiNStnOFdI?=
 =?utf-8?B?RGtFTGszWWRFVkhHcDd5d3BkSitqcWszMlBycmVIMWJ1bE9MMlJRci9SMyt4?=
 =?utf-8?B?SjYyWVBndTcyWEhlZ0NwcDlROEN1ZDVMVmdncWZ5VVpMUnErNFBrdlJ6T2Ur?=
 =?utf-8?B?VVRaME55dm1YWEZWUHczQ1BIa0k1VCtNSkhnS0NxbHVaRlhIRk1lU2liUm5s?=
 =?utf-8?B?RThYZ0VSaHcySUFOYXB1c3dxMEhJVkx4VlhjaG9keUYxZGEzOEZVQWhyRklZ?=
 =?utf-8?B?OVAvMVp2YkRVTFhYbGloRTNaSlVwWHhqeFl2eE44RlhMcTR2aEN5Q3QyM0Fl?=
 =?utf-8?B?eWVYZEpLaXR5MVRtcVovN1FkTHV0cjJvaEQ5dVJTaHQ3SExOSTZhdk8yT2JE?=
 =?utf-8?B?YW14dlplWmxrcjY2OThoemIyNlo3RVR0eGxvbXcxMkQvUTY2L0xqdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65875cd5-3735-4d58-8f93-08da23c39fb2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 18:20:33.2783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GO6dGd9nIFlg7efkg0946pMExaIvNqwdABd5qFobuDmfFxln3LoRjHgixu0hVgK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5930
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 05:32:32PM +0000, Wang, Zhi A wrote:
> Hi folks:
> 
> Here is the PR of gvt-next. Thanks so much for the patience.
> 
> Mostly it includes the patch bundle of GVT-g re-factor patches for adapting the GVT-g with the
> new MDEV interfaces:
> 
> - Separating the MMIO table from GVT-g. (Zhi)
> - GVT-g re-factor. (Christoph)
> - GVT-g mdev API cleanup. (Jason)
> - GVT-g trace/makefile cleanup. (Jani)
> 
> Thanks so much for making this happen.
> 
> This PR has been tested as following and no problem shows up:
> 
> $dim update-branches
> $dim apply-pull drm-intel-next < this_email.eml
> 
> When merging this pull to drm-intel-next, please include the following code in the merge commit:
> 
> diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> index 03a7fcd0f904..72dac1718f3e 100644
> +++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
> @@ -3,6 +3,7 @@
>   * Copyright © 2020 Intel Corporation
>   */
>  
> +#include "display/intel_dmc_regs.h"
>  #include "display/vlv_dsi_pll_regs.h"
>  #include "gt/intel_gt_regs.h"
>  #include "gvt/gvt.h"


Great! This looks good and compiled for me now

Thanks,
Jason
