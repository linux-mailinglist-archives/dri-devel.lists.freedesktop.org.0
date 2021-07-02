Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E207E3BA611
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jul 2021 00:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEB86E215;
	Fri,  2 Jul 2021 22:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2063.outbound.protection.outlook.com [40.107.96.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25AD6E213;
 Fri,  2 Jul 2021 22:51:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrjI541S6ev4Yp1jYrlIStusA+Ah2wt5KYSrx8jC86EFNXnzpzHkMFXgf9HA3uaMxiJkiKdcd6Z/bHXrjzkC7l05Z2KpLKQFObD5qz/bn0Jm4wD9kie1VfB45mi7exdojY1cMkao40ZRe2C7u/mt4ExCZ+Ocb/uiQ5JutriSQYWuWEKfmF10i0SgEO9deqreUJg25Xo+PyCGgYXGSLI2su+msXUq3dHMqiU7o4jQVd+LvULKhWUaUhq5pJoN7kXsD7HVKFAx404dZW5oRNeMGGPn1ERa8K6Gq4clHPIRZruD6UxJuhm94tfyle6ZDs98SLJjpE/9TEbiv4WX8+oQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIcPlXyzqCIXumsAb1s5PKSru0AACBkf+RqSIt9MipU=;
 b=IsENyNl0nE0JUiFB7dvqgGoRDj+TrbbMbkwrhDCVznSovhVCm/3Mbror1+KorNfXCL9hhgv0pC/sMIhrnslX0hfPAHSUdml2QGDisHLNKCk1VYiqjPLwjhvr1rmfHFQw0P1Nn7USmgFnM9HSXTlC1AItMY+KXok+wEIqQaE07kbKVWzJdbMHFlMsNHs1lURKRKXwc97hpi+E601KIE7oNOe6fF+VR1XW2P27rM4KMJYb/jn3ylwz8E5cnWDfszASwJk+qY6fPW95fUBGZdHwwJJfkGm5QPeVeptqzSx4/PB8VzjSdnaV9Hdu1MvF/GL8zyu5HHN/m9l5WlztNAwjoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JIcPlXyzqCIXumsAb1s5PKSru0AACBkf+RqSIt9MipU=;
 b=Trv2Di3J947kaxmpWvcovmPr4DJpJS3FsYwG9YLbrtOaxqE+QUNvk8t7/d0NJhZy5eijDGicVlplTIvfNbw7NYxhUUw0d1hlAmn8x3hhho3hGltvZAfM4/Ndft0FMLDFSZ2/nARoUIMueUV86OSOi45gh2Pslz9EyRGAJzrrpvs=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4959.namprd12.prod.outlook.com (2603:10b6:5:208::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Fri, 2 Jul
 2021 22:51:30 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::50f2:699c:121d:f257]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::50f2:699c:121d:f257%4]) with mapi id 15.20.4287.023; Fri, 2 Jul 2021
 22:51:29 +0000
Subject: Re: [PATCH] drm/amdgpu: initialize amdgpu_ras_query_error_count()
 error count parameters
To: trix@redhat.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 Hawking.Zhang@amd.com, Dennis.Li@amd.com, guchun.chen@amd.com,
 Stanley.Yang@amd.com, nirmoy.das@amd.com
References: <20210702195245.1629908-1-trix@redhat.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <a836cafa-86a9-3d72-1f02-f9f2d58ee127@amd.com>
Date: Fri, 2 Jul 2021 18:51:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210702195245.1629908-1-trix@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-CA
X-Originating-IP: [108.162.138.69]
X-ClientProxiedBy: YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::20) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (108.162.138.69) by
 YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Fri, 2 Jul 2021 22:51:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe38aa3d-fb1f-4abf-9712-08d93dabee46
X-MS-TrafficTypeDiagnostic: DM6PR12MB4959:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4959C98464DF750581B9D18B991F9@DM6PR12MB4959.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:480;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9EMna5o8rmLS3dh5RCQ0juun+gy/FFKfy2t/X1/HsbB7uqtbB5jiKN1jXXfTGdGsPgL82KXAPra3ev4qCD50zD2Qqh8YLug34DtB4IhpxA5TbJUpgv6dH/f+QMb3F4a5YFUQ3Qeu4mE962KwTSZ20PnwaVN0Dm8paPro9YBcaeDr4CLU6R6gfepwFi5LvSiUdOOsOyPvg4fzY/NRFY+tN715xL0adFsYjM8Qp1U+k3x8u6nivJrcakAEHMtk2gFAzJY9bSplKNtBSpWHbL53LYu9SyvvSGw2ijqgPj6yTBC9aombZM8+OWgkzRHTA6rVi9XjKVjOILNTZvr9B7+qKn4LhUIiBVYEwKOGglsPiNTwKHA6ZvL+XyrKguZDR+fvUGDPHHVZCwRdAHQhszjABGfgyMuUU4AAIrHcKlPwGNSboQdOPrfUSIpEWFq7cF44lObslkw+VML83e9U6gEb/Pg3dsUiMr/gpNTfBwnKDCShF3sZLMyZuFBCRJWnn9Q0lusfx9fd3uQAkiUv56dYIpPclmPqmJKQVg2oV4ivi4DCQSlOvq7p/HqGi6iCU3ms4j5xX64kr3On4WbJXo6rLo1gZCzdIl35zkUNHpHZlEZXaEkHO9DyzpjOQ1YpZj99CVo4Ac1ZGuwLBveFHhdkeaFSA67ByPHZFSGFB9HnxxX9CLPN86yD7Aws1il6ABcCcdUuSQ0n4GfHHCGvrl0rrjajVlBXmbtT23tPPAvDSJ88gWrjjh6VtOgeCgABc0KYviFFq9uKeSs7StiM8GQZKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(66476007)(66556008)(66946007)(31696002)(2906002)(86362001)(921005)(6506007)(55236004)(53546011)(26005)(6512007)(16526019)(186003)(6486002)(38100700002)(8676002)(36756003)(6636002)(83380400001)(956004)(4326008)(44832011)(8936002)(31686004)(2616005)(478600001)(5660300002)(316002)(3714002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlZtN0NaTysvaHA2S01QMVM2VmNJdEkvZXhjdVJrYjZYL1pOTExJQXlnOUN2?=
 =?utf-8?B?Vk5hMzBqdU9UeUhjeXJEWHRNYnNoQ1lobzhmTGEzblYrM004K2sxZjl0cVQ1?=
 =?utf-8?B?RTBndTRQRldpT0krRGpGRXc4dld5cmxocDFCOHl6eEdHM2d5LzV2REJ2WFYw?=
 =?utf-8?B?Y0I2MlN5K0dHQWxYdEhka1dXeUhJNG9qT3p1NmFyZmNseDlYMDBOSFF4S3ZY?=
 =?utf-8?B?dDB6VGJES3E5dUt6bUJ4S0o1b1gzTXZwMG95VVdmMDNmSXFDZUxCVjVJV2hl?=
 =?utf-8?B?d05NbjFtNE5wZS9iN09pcVJhZU0yYXNCbjBwVmNwdndZaHFBRjRkKyt4NVNR?=
 =?utf-8?B?MGZjZjFSNnZqTTlXMWEvUVEzSnZvVWZIc0NOWXlDMVErc3hJWTUzdnVIcWEx?=
 =?utf-8?B?TzVFdEFMeG1pRmV2d1pJN090YmxFbjA3a3FsSXZWMEhaTkE4RC9JKzcrdG8x?=
 =?utf-8?B?R3FoOGZ1V3BpS2I3aU94T2U1SUFBTmFaUWZCRmlJcE5TVFBSRGdMODNaWWRx?=
 =?utf-8?B?bEhrUkxGcktLem5RRUdzOFMvZWYvck02T21mQnF2aThwZlJMR1orVWZ2VVlE?=
 =?utf-8?B?OVNlZWdOMTJVVVdLcFdhSjFabVhuZVJaMk96azRpSkY4UVFsbWQ3cjNzQktz?=
 =?utf-8?B?NWVxLy9ENGdEeE90RFFGMXFYNlNMRDhHM2pOUnh0NVVvUzVObC91cXlHUlBt?=
 =?utf-8?B?Njd0cGRhMUk3ZkZoZHNkeGhNRFN4SHAxRHJkVURhT2pWNHFvQVlNRkxVbzd3?=
 =?utf-8?B?SHEvTVE2dG1lZW9FWW92cXR4bk14RXlHRVV6T1lEbWJZL2Z1ZWtoeTBucW55?=
 =?utf-8?B?cTV4dlRUREZITXNOVEhXTU9WeGorZnUvZEkwcGhBMFVNc09BTTIvVmo1TmI0?=
 =?utf-8?B?blNQZ0l4ellqMzFPaVBieWZsRDZ3aUhwOTk5ZE94YTJwRUVFUGJuN1M1MUd1?=
 =?utf-8?B?TVNzdHFNbFNSb3EvM1A4bFdyK2JzNFhiREJCbUZJNmhSaitDYVBQcWVaWnB2?=
 =?utf-8?B?RVJPK0Q4d0U5b2R1MzJUWFQxakt0WXZYR0JRbWRjc1MreEFaNGV4NHVibjlD?=
 =?utf-8?B?aE0wVzVYWXN4OFVoYzhlb25ZcHprVGxJcGVpS3RkV2lQQ3JPdzBRc094NUN5?=
 =?utf-8?B?TzZDczJvSUs2K1NraEVJZEtwb0t4eER6NkR2ZUJENW1MU1VhMGRSMTlNOGxI?=
 =?utf-8?B?TUJmNUZ3MmVDY2dESGVaQmhNajArVnJQaUxpU0xEM3hPUGRsYzBieGRxRFRI?=
 =?utf-8?B?SFdrOHVOcVM0bU8yZGJkN1Z3bnBzSzlHZ1h5VFdDVW9iVUZIQlVzUXFPdjVn?=
 =?utf-8?B?emQyODJWdEJKbDRMTFhNZStGelp2RXcrSEQxaWJLT0FaSzBaUkNzbHl4R1pz?=
 =?utf-8?B?ajdsb2FPS1A3TWQvQnNISk9xV3VhVEUwV2VaUDFxTHJNWmQ1Ly9UVzJINWxR?=
 =?utf-8?B?SVJYNDdXSWx3NklDM0srNXdtNlFyNk5wR1pYTS9aOGh6M2l0QzJueTkwc3FM?=
 =?utf-8?B?SkNDSWtZblhobzg1d0ZFT2x5NWtDeG1YSmtySmF3QkR3dWZlN3RyRU5iekFF?=
 =?utf-8?B?UGVUNnVJRVo4Q1RybHlNVUE5Qktrcmc1dk0vV1JuQ1pneU9wZkZmejVzckZT?=
 =?utf-8?B?OXFOR0FXNEE0MDVoZ1FJZWdwV2plMkxuaklrYWhjSVNBVWFKOHRnd0M5ejdX?=
 =?utf-8?B?SVhkWmk0R3FWMmh5UlFGL0NUR0hUR2t4am1DNWdFRXBycWtTSVJueHNCQ3ph?=
 =?utf-8?Q?CIAlfpHlTdDzuvPojtogwlMtZmgCLrjBcK/sEks?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe38aa3d-fb1f-4abf-9712-08d93dabee46
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 22:51:29.8909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RbCtrloLGN9fPmzTluOYQVv7W6Z233Nc2zgbUovSLVQ8WzxnZJHUZhonu24fGKUO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4959
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That's a good find, but I'd rather functions have no side effects. I'll follow up with a patch which correctly fixes this.

Regards,
Luben

On 2021-07-02 3:52 p.m., trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
>
> Static analysis reports this problem
> amdgpu_ras.c:2324:2: warning: 2nd function call argument is an
>   uninitialized value
>         atomic_set(&con->ras_ce_count, ce_count);
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> ce_count is normally set by the earlier call to
> amdgpu_ras_query_error_count().  But amdgpu_ras_query_error_count()
> can return early without setting, leaving its error count parameters
> in a garbage state.
>
> Initialize the error count parameters earlier.
>
> Fixes: a46751fbcde5 ("drm/amdgpu: Fix RAS function interface")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> index 875874ea745ec..c80fa545aa2b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -1056,6 +1056,12 @@ void amdgpu_ras_query_error_count(struct amdgpu_device *adev,
>  	struct ras_manager *obj;
>  	unsigned long ce, ue;
>  
> +	if (ce_count)
> +		*ce_count = 0;
> +
> +	if (ue_count)
> +		*ue_count = 0;
> +
>  	if (!adev->ras_enabled || !con)
>  		return;
>  

