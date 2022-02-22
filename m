Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2434BF87D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 13:57:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90EB10E5D0;
	Tue, 22 Feb 2022 12:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B80F10E47C;
 Tue, 22 Feb 2022 12:57:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9CvdqVE6xVGRErIoKtPt84c8ir8qKYMMG72o30CEs52CgQMM/HUChWMkyPp+HrQ3z5k5QVRfM3F4HyBzLyYe/zN+d6Eoqf3rHU5YXnIY2BiqJRQ8dF6g8kCc2U6UrE4dG4DSfY+t0lga/Ch9Vn3cNhOJVzrw4n/rVbg5qshBt6XcrJCX4C60l/PEnTQl79bNHG/ZQmTd2XoZW4Bu8txtXIrc8BEFbEJ1aM4jjcGuELprp3Feop+Z6yXON+yrkJYIUXjuxwDvyRUxkYx3GcPefunCKF/lHF7YUQPrsJ3x8yY7FcoyTeCIk+XlNCMCUEIDtGa9F16qBOwXAWGh5uDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YQnLbZ3t+S+ZIusWquFCBQB1xXA7a7T6sicafag3HHk=;
 b=HU2SWTsnj8+3qs5gmFuM1AARbwgrgf8nkjDM5RA652TZdEE9hJHaUf6gFZkYdB7Y+4E90jf6RE5dyAarE6pAfBQDIZ50lwVszC26nMcFRMMSmx0VtZtEWi8fP/o/B/pXfDpZ9uTtJ88ZbBDldzLjJ8MWdQWfRYdFEA3bDcYujCq9KhXH9EXW8n/d9cDVJ/KE2Ax/YYhKLOz07uTsBKC+1i05/Xan26+kxtAgRY3UzXsQY9/zNILFacyWtdP3R5HRbPnvxc/mJv/+/SOrMVn5ThINPBXuy0SU14UCpi4QTUKTOnroFDx0fnJjPMgU7IRw+qFPYmc6f/+gDRik3f1jfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQnLbZ3t+S+ZIusWquFCBQB1xXA7a7T6sicafag3HHk=;
 b=GI3v87rJK1m2LAiXjjGFJUIKSLUdzpbrZ8/ZTsPlcJsn39bVBEAgjcxCXgn5Px3Ln5haLdxFnwR8I2xWfZcMpeiaSgy9OhmPt3L/qIUgzKicL2Kvm22NCefV0R64q8RJZK8nmgA5cBELpVze2T1VxKRd5TQIcsa64GDowJlZxWQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB5686.namprd12.prod.outlook.com (2603:10b6:510:13d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27; Tue, 22 Feb
 2022 12:57:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e03f:901a:be6c:b581%6]) with mapi id 15.20.5017.022; Tue, 22 Feb 2022
 12:57:31 +0000
Message-ID: <2186d033-5ba4-e7f9-b501-b64e357fa27c@amd.com>
Date: Tue, 22 Feb 2022 13:57:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v13 4/5] drm/amdgpu: move vram inline functions into a
 header
Content-Language: en-US
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220221164552.2434-1-Arunpravin.PaneerSelvam@amd.com>
 <20220221164552.2434-4-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220221164552.2434-4-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P194CA0029.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::42) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ec5b48e-bb6b-41b2-b436-08d9f602e318
X-MS-TrafficTypeDiagnostic: PH7PR12MB5686:EE_
X-Microsoft-Antispam-PRVS: <PH7PR12MB5686067979FAABD5E9D00CDD833B9@PH7PR12MB5686.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p+/jrlYoz1SEBidZvBt2k20WFbhRq11yQ+m2iAXLCV6MgoW1yv1JBQszXUKZg57NYBEEy+zbDWPawZ2Z56TLNChve7EUXdduXXn7dVsgK5pI/eEIt6FV9HPgP2XW/umLJGMYJYdCjlOc7tZfysRmg81cdYuyNCDv4vfyWTJPdULeVczG7cxjKKeybE74bw2owG0ASz/UjUCQQ7oRBeLq0MCykEtiv1+xXopaOf5j+eZ9hhkyRbfBBwmL/YERI4jyh2Palc2yWC2a4ru5YKW8LsvDy6mU1ygWav6b55el7Eqnjlq34GgDSBDTPdNSGf3u+wd7x55720e/k7fFSdKHJb/qOxFAG0l71d8v+fgj84Dd3Ml/0wwzlV6qXTJu0WpW+ibOLQJ+yXfDhgAjQ7vfZ6POj8ThKs1QMfbFxd7pBspNiPiTJtVIomUwjIMhlDSFBDRpPBXkzMukp9MP5QD+d3Q7Q5qg3Q56MTSUUQxVXH9AzsiXF9uirq1j75TNCWEk/w1pFPKJrvSUvjI6xsLzQuQxSNBDStQBWxQrkdpF+y5+YtjlOX2m3yvJecWZN7zVNZXa7ZqH7Gd2PynlSVjbreGTTkh3EhESEMhMHaFGrlIKsLUuS6BOmREGugKe9Plf2ynqOgU5XJIBVWibKMjJZRwpPn+aB10TSFsfPVNkZDKMfojycfgQTx94CLt+7rgaflehALKReB48puf9Hil7UUdA9GLqh+86RV7IW1aPRA3XbXnOH/Mcf2czgeILMOeX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6486002)(5660300002)(6666004)(508600001)(8936002)(6512007)(86362001)(31696002)(6506007)(38100700002)(186003)(316002)(66476007)(66946007)(8676002)(31686004)(83380400001)(36756003)(66556008)(4326008)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmpudFMwbUtrY3gxeFpjMHFSNGZPaWVkUGgvM0dDcjNvdlZpRGU2dzRMamNx?=
 =?utf-8?B?MGNaMDM1U3h3RnVBUVdxbGtOZDhpa09jWlVJbkJHTWhDaFJNdVBrMlo5U1lG?=
 =?utf-8?B?L3hIMkdHbmFTcGcrRmRhU281eFBROGRMUU00TkZOMVRZUktyUkxsWE5ObGdD?=
 =?utf-8?B?aHRTekdYUjlwNkc0ZFVPZjU3TWludGlXK3dKZTBEZzVoWGVYR2JQcHF0RE9N?=
 =?utf-8?B?Y3RMa0JtRHFPbUl6OWZ2UlBaZDJIazlaWnFtNkkyTDlhRXA0Vi8yUXUrVUlH?=
 =?utf-8?B?dnhEMWt0RE9MZjljdkd5a1MrOFI5aml4R1poOGx2bUdpRVk4cVRjZ1FlTjJ5?=
 =?utf-8?B?dXI1NnAxRUJtYnNSRWVyZ1J2aVlFSXREMW1CVkVBRlRVQTQrdWVXSVdScmNw?=
 =?utf-8?B?K1hYUGVyNitHVWdkOElNT09pMXBCVEpnaXJkdVhtZFowS3BHbVJQYnJUTXFN?=
 =?utf-8?B?clBBRmFXZjQ4R0Z5Ym95OWZSK050M2VkVGdNajhWdHZiTXlyYUpScGV6QkZM?=
 =?utf-8?B?YXZ5Q1oxenZvbjB5eXFucklQRVVjZldZWUJLRnAyUGMyUmtraXR5MVhVYXVC?=
 =?utf-8?B?VEw4bHlBeFh4a1dBVjlsa3FVOFhDbWdMek5lR3lyc1RYVytlTVRIYjZyTGtp?=
 =?utf-8?B?Q3RudnkvQjE4ZTFVWXpkbXJXc1ZvdlM4YkhxLzZ5bVVOYkVCNHZzYmdLcmxF?=
 =?utf-8?B?cWRVNlkvWUk0dTVHcnBjSzZteTBORkRrbGZDK0F0MmVyVDR1aDcwcUZKRVAx?=
 =?utf-8?B?T00vbW9TcEpPcDRUS29YeGtCOXM4K01BQUZWOFRIdzY1YXhvQ3NZVWhZanZQ?=
 =?utf-8?B?NTZBNDdRelZ2ZHZlYUZSbzZjMzl2MmVObGhOWlNJd0loYUNmcENZQndaRlRp?=
 =?utf-8?B?ZUdNdXFTKzUxYlJzc3c2RUlkaEo1amhZQkZxbmdjL1lIdWt0Y3Y2SFJwZStZ?=
 =?utf-8?B?YkxoUEFreG11UDZrMGFaMDBhbkZYOEhoR25KQklpVFpZbTdWQXJuaXMzYkFI?=
 =?utf-8?B?RmN0cFVkQXowOHExS2Ewc0JaaXQxRllCLzJBbEFrajlMeXdDL2c2UEY4T21Z?=
 =?utf-8?B?b2pGbGxtd0VvNXVzUW56RWtRZUh0Slh6RHJpNkVrVlpHZS9Zbi9ETzBnQWdM?=
 =?utf-8?B?ZGlsRldYQ1dUZ0xRQ3RZVG9UKzFlM3pidnpwcXZmTVUvakFDQWZXNElJSURJ?=
 =?utf-8?B?T2NVallKcmFKSWQ2OXdSdXZTWXNmZUM0ekZTb0pEMTBHT1pYd1VWTkY1WVNi?=
 =?utf-8?B?cnppcVdubjg1anZ1cERpdmltbkx4ODhYRVpsenhFMVhzTktWZ0VZdGVyS2Uz?=
 =?utf-8?B?a3Ezd0FoNmt3Um9yUHZ1bHFJTG04UkNIOHVaUzMyeTVzbzFqRHdkQzRYZitC?=
 =?utf-8?B?bjdvMk9qL3VJWW1Na3phTGp4bW1vNVZYL3luMjhqdDQ2NHJvSlgzeXViSS9I?=
 =?utf-8?B?eFBJRSt4WnNEckxhd2xoVFkvTXI1Z2hYTkdmTCtta2J4R2kwaTN4SHZsS2Mx?=
 =?utf-8?B?ODVVY0JPNnVNMEQrUFlEd1RwUWk2WVhQQ0xXaFpWZG9EK2hWaDA5S0JRRm9m?=
 =?utf-8?B?dVdOWS8wSlp2NlIxdExnbDZuZGJ6NEo0YW1PbGZERlVET2Rha25IcncyTFJr?=
 =?utf-8?B?NDBJbmUwMVlja3Z3UCtLOEhTZ292ODY4Y1FaUjIxVGFXUStvWWlLSFFLeW00?=
 =?utf-8?B?ZjZpMktSRHYwcHpxbUt5SlBNWVhtZWRTTlU3Y3NyU2tvcGplMjRWTVhoWFpa?=
 =?utf-8?B?MEdReVB0KzRGQWhDT3kzaTVLYTFHQmRFUVZEUlpiZTBCSDNxZ3o2YW1EeXVu?=
 =?utf-8?B?T2VBMEM2T3hSN1JzN3VvV3RzS1djeVo3T0tKeitCaFp4Yms0U3F0eFdHYTh2?=
 =?utf-8?B?UWJGYndIZ2crMTVYYTh2M2g1bS9NR2g0UEMvbWt1UUg0RzBWNHl6V1ZzRTBY?=
 =?utf-8?B?WTJrVmtoa2FtbENYZDlhR0VGaElTRENkTzNKZEMvMm1Vb3NOQ3Q2S2tNSFBE?=
 =?utf-8?B?VXF0YVZaejl4SUNKdzdwRGRWckE3cHFsK1lodTZkdGh4dmp4elpNR3BlVzdz?=
 =?utf-8?B?QzhzQS8wT1F2NU1sc2pQN1QyYUxUWVNUUnl3Q3VJRUVyQ0VuWEJ2QngxdTBz?=
 =?utf-8?B?VkFnS0c2UXJtNkpseW94cEJSNEY5WktFQzNUbmY5MEhWelVYWXFPaFhReXlI?=
 =?utf-8?Q?DrhTXxwuyjzNsxHHuh9sYIU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec5b48e-bb6b-41b2-b436-08d9f602e318
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 12:57:31.2081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWbCUGAtsXYoOxZzNzlJtOm3asRz/Q8u9le+pOrgDiZ/KXzEcQM3srkaTmK/6qv2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5686
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.02.22 um 17:45 schrieb Arunpravin:
> Move shared vram inline functions and structs
> into a header file
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>

Patches #1-#3 haven been pushed to drm-misc-next.

For this one it might be better to squash that into commit #5 as well 
since this is otherwise unused.

Might be a good idea to move the vram_mgr structur and function from 
amdgpu_ttm.h over to this file as well.

Regards,
Christian.

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h | 51 ++++++++++++++++++++
>   1 file changed, 51 insertions(+)
>   create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> new file mode 100644
> index 000000000000..59983464cce5
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef __AMDGPU_VRAM_MGR_H__
> +#define __AMDGPU_VRAM_MGR_H__
> +
> +#include <drm/drm_buddy.h>
> +
> +struct amdgpu_vram_mgr_node {
> +	struct ttm_resource base;
> +	struct list_head blocks;
> +	unsigned long flags;
> +};
> +
> +static inline u64 amdgpu_node_start(struct drm_buddy_block *block)
> +{
> +	return drm_buddy_block_offset(block);
> +}
> +
> +static inline u64 amdgpu_node_size(struct drm_buddy_block *block)
> +{
> +	return PAGE_SIZE << drm_buddy_block_order(block);
> +}
> +
> +static inline struct amdgpu_vram_mgr_node *
> +to_amdgpu_vram_mgr_node(struct ttm_resource *res)
> +{
> +	return container_of(res, struct amdgpu_vram_mgr_node, base);
> +}
> +
> +#endif

