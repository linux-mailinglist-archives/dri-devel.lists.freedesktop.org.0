Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F318665E4FB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 06:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DBD510E6A2;
	Thu,  5 Jan 2023 05:07:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2056.outbound.protection.outlook.com [40.107.96.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EDA10E69C;
 Thu,  5 Jan 2023 05:07:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iKkHQlWIQQ/Eb7WgWv5JXTI2Nr3S75+zIJCvWpiP0JKdN2Vr2OZz/CKhyERL9Ql4BFo7Pfz52ijKI6WZpDe8w7/IN+z1NrCHGU4t0jRzPxHx1J7vdB084SnOQ6NcHhRNqIdHBqoTs38vG93doT+HTi+9fAI4Xq4xxSNC1HJ3sSU9Pmr8svS+hqihPEO46pA20MkaS5YjjvAbbMOvG71MwKrwRVbehe4xncfQ6CRG9YVJ3o4N1H8IHx3veN1GNNpYzprPVHNPgh6ej9hOLgzKJPVLgAR8e8/DMYW/SrNYf55pjc3/sbflVyFZdZ/sf70mBTLQqXHdyz2tadzA8R3yeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk5Gjwc7P9fo3qNfMVN8ZS7RfC1BrMlF2fJOokOAUSw=;
 b=Nhokek/IevG5nZAoGx+i3cTt3g2xTs8C1cjb1bwF00fSL3v4iP1Yiy4MtcqfwUWMymmx4Jx+s3MsxIVKMONdq6N/nFFZ50b2b+mcxqOcg27MhctcY2QZCe5sSSy00EuWwtf/MjdNsdlp/YWdRMIIJ7FBZcLmV9frLRemEsjnaicLNT5GuregrAdofeRdM513XYlPWXCSPLSYIaH47et26O0UXiDKiThX3QbQqb3vrTapgwznE2XdqcvhZLn/p+An1xga1cel7teBG5Qnq0PnhJr0jK9oMtjUT+T8nsnVMDKImJNCUkhV6RQEjYxrLmq68Nk8Gty+rSF/VQMgNNwmLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk5Gjwc7P9fo3qNfMVN8ZS7RfC1BrMlF2fJOokOAUSw=;
 b=Hs+d2XhX26MhCyjsMaNnm4WEib7NZ3vRzl13k4pGHw/mc0IgUvns5dSzhYRDzJ+w3Wj1wAMh69IaUyCxJoSBTNnEm3BkaoFyyEFL8Tyrjzz2rZQZdPiSzAr+RNWwFyzIXyTzlbP7tMrY3q1cLlc87FpMpbGAq/xSeTWiWqI5IuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by BL1PR12MB5852.namprd12.prod.outlook.com (2603:10b6:208:397::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 05:07:52 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::457b:5c58:8ad2:40fa%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 05:07:52 +0000
Message-ID: <804491f0-6e83-dae5-f108-f80950838a52@amd.com>
Date: Thu, 5 Jan 2023 10:37:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v6 05/45] drm/amd: Add a new helper for loading/validating
 microcode
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org
References: <20230105034327.1439-1-mario.limonciello@amd.com>
 <20230105034327.1439-6-mario.limonciello@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20230105034327.1439-6-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::28) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB4614:EE_|BL1PR12MB5852:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8daef5-58e4-4aaf-25eb-08daeedacc08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i9W1M9vhCpS9FcaVaiY9wjwBq8ore3AIlm3EyzJfeWTc0rxGduDttyRjjb1Uc30zujInbxoYlGHoQotDR3KnngRVZXjFKgMxj14qfTZWCNimkwJTtbfAV6PHrnBU6TSghH1m08jPvi/sIPoSFeX86EvUWkxG7a3KgNLI9Y0Dt50hzAW7IIX35Mtx8oO455PWJMpZeUieeHjd/szNmTeWbAX3uLWk70yEnZIyKhtG8zCW4o37m8Sd1k46/pEr9LB4T2os4jX3ySJjbpWbMqmIKqRppUlQQloTLdb19s2jEJGxRboVeUgeHKlelM8v7WCc9NyswwK4G7IHqCoJBLoylaiaTqUGLOMzql1yDwogp30WsV0f3I4jif2qCZQoU1BaN6ZYgpAj3Ffxl9zZ9drLhR45vOFSKdsn09noxwWvov7luVnAh8cCd9CrpTt6sxY7xzSNpzOHKuvtbR3wl7w+eVf016diZCrF6ooSn95ecnOK1jO5ljSF4ZgICERyOI1ogjZW/JEjV431H53uGFWihbtp77MzkGd00EGQTZSfGOQth9WJY8JsZGjkUNDsSh8sV5fKK6WYwCLZEfE4J/Tw0/UnfY+eMLFC6nyUVr9ry+QrceXSPlShPsZ0diSggUym9YQ18yAXdXKtz1eSgvvTkDfUjQaVjpXRzj7VV5xeu12M3jZ1wKPTk0Mgn/ZdSohnMaaRbPAnCxTTJJuxMbIc7yz0mX71y1uu+c8zBMp2Ppg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199015)(5660300002)(2906002)(8936002)(41300700001)(478600001)(4326008)(316002)(8676002)(54906003)(66556008)(66476007)(110136005)(66946007)(31686004)(6486002)(6666004)(6512007)(26005)(6506007)(83380400001)(2616005)(53546011)(38100700002)(186003)(86362001)(31696002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2lwMHpUTG5sOVZGUG5JRERsOWdPU3lxVGVocCtQcEQ0Y3pxaGhmNTkrSVkw?=
 =?utf-8?B?WU5vUE1lZTliSTluRWZVVCt6anBEcDEwRmIzLzlDNkdsdmN0OUthWUlVTHFS?=
 =?utf-8?B?OWhraEw3K043VUhjS2NVbEE0eXNzbDJVRUc1dWsrRWRpcWpPa1NlTk45Wjc0?=
 =?utf-8?B?SHpsby9ubWNhd1dOVXBhUzNJR0ZSZDQxb0w4REM1ZkpwR293Yzlwd1VvdmZI?=
 =?utf-8?B?NEhEUTk5VVBCNDRaUng5cXZGK21mTVA4bGd1ZkxMbitpbEpJQzJuV2d0aFpH?=
 =?utf-8?B?ZkpKNGF1K1lHZ29UeWo5QzdPUEZ0WWptVjBtZURJSTNzdGJYd0RjNzZMNGlT?=
 =?utf-8?B?akdzc2w1RC8zVnRWUVdQaHZBLzRJbS9jbGNhczJ3QmhsSGxhWEZHUVdNdCtz?=
 =?utf-8?B?VTlZbzVtTzhWWjVmaE85YzJQa0drZUprNFg2dlkzOFlsNWNSUzRuMlYxQWgw?=
 =?utf-8?B?dHM0bWpXNzNUTVRxdEZ6Q21NaFhPeEpVYzd3dVVjU0NvcFptMmh0N202RWhm?=
 =?utf-8?B?RFk4bkx4NkRoWWVIS3Mxd1N2Syt3NGJVeC96WS9WNk1uTHBFY0k0UXF4QjJB?=
 =?utf-8?B?WUlmWkNhRnEzQldUeTJUcWQvL21MSTgxc1RKU3BVZDBxK09pdDBMTmM3UmhD?=
 =?utf-8?B?ZVN4Z2V0azBUOUErQjRya2dCV1pFT3JIZGRYejROaU81VFExM05STldCV3Qy?=
 =?utf-8?B?R3lDcWxobDV4UDE0RWNlVHl0cDNlTmxlNXkyVEZNTmV4ZXZiQmcrMEloL1pQ?=
 =?utf-8?B?dlZyZVg0TjRUaGlDWWxaSDdqUXh4eWJEVDdKanB3YnpmQ0xkOFV1bmhGYU1K?=
 =?utf-8?B?QUw1WWhPeXNOam1XbmdGSWJWbXgzRjYrZm5IN3QvNEw1cTRXZDVDdHlUUk5u?=
 =?utf-8?B?eXZMTUhOR2ZEdlVtd0I3bk9hZXdWUzNvM0tRclFqUGppRXY4b3NpS0RmQUhM?=
 =?utf-8?B?STVxNTliZVlLYy9jUUZndFB2VHFCQWNoa2theVhpeW14eUZQbG5VaFFRQ0JR?=
 =?utf-8?B?Y21YYk5RQTJ3SVpYTzAwRHo5QjBPZ1o0a2ZUWi9scHJraTBDd1ZiR0dUUlFo?=
 =?utf-8?B?UTkzTTlVTFEwVkRXUVBWblhsY1diRkczKzVzQ080dk01RlRiclp0aGVqemFV?=
 =?utf-8?B?LzdGNW4vNlhqY1UvbFpYWG9JdmJxQzh3a0lWMmt2Um1RNWRJY0tXMnNBT21X?=
 =?utf-8?B?ZUZuVVRvY2Z5WXV4RWtJNHBxbTFTUmR4VG5vWlhBb3hIam9KN1cyRW8wV21s?=
 =?utf-8?B?TVNBWXZiMld3Y25DM1Uyc0xnWUgyR2habE8vTTFjTGJQbnd4eFdhbmZSVmNN?=
 =?utf-8?B?dHcyM1hWTTNSSS84RUJvMnhoTmdJUjJYdXc3VnlGNHZ2a3M2ejljQXFJOE5w?=
 =?utf-8?B?TmFvU0p1Ym1rOTRrNnZXTzNiZEdCanh3aEU1VEU4WmVQWUtrZnBHVENoSVNn?=
 =?utf-8?B?ckhYTHQvL3pvWXlvTHY5bENOT1NRK1VFSC9STU5uVy8rdGJVc2xnRlQxQUNs?=
 =?utf-8?B?RWxRUTk1ektCRzYvb3RTZUQzSzFIaUtxb0MvSFYxcXJDNmJoSk1ZMnVES0lk?=
 =?utf-8?B?Z1B3MTNVWVhrK0E1MlRKcnZMRXQ4R2l3bEFXTDhqUUZmNGcvejZzOW4vcDBv?=
 =?utf-8?B?elgrWUg0SHJrYzlnK3haaFowMEkwbkIxUVlNVVN4SGJka1BTOW5wZTg3Nngr?=
 =?utf-8?B?RytVQzZUM1l3T3B1TTAzQllQL25UdndFQXJNTUErcUZQbVgrQW1zR3hPSjRI?=
 =?utf-8?B?V0o0aU1KRVhFUzk5c1VJbExwejAzdFhEUjFDMmN0d0Z3eVlZczJIVXdGUFp4?=
 =?utf-8?B?aEhQT0xHNVBKWE5hQnVBYnRwdFZwOHNCY29iZlBycEhmSUNTVGFxQWc5TXRO?=
 =?utf-8?B?S0Vpa053dGgwb1lRQnVacXk3dklqT3dRWGY3WVZjd2E0eHRndU9GNjBPWW9V?=
 =?utf-8?B?eUpLV0NrNFBZK3lEd0ZuVCtxUHFHV2FmWmdVamg0bEwrWGQ1MENSU0NobDZK?=
 =?utf-8?B?eDRNa0ttS2o0eHBWUkJ2MThyc2hDWTVHYU1yZ1lnQWRuTDhLVnBrQUdZNXBL?=
 =?utf-8?B?K2UwWlc2TkpiOWI0cGJPSVE3NGZOOCtBZWRwaG45ZHRGYUZVQWgrK3FKb3Rr?=
 =?utf-8?Q?PBBJUs3Wfnpl4qlYfyWZg0Pgl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8daef5-58e4-4aaf-25eb-08daeedacc08
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 05:07:52.3463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJnB555tDxep/PgmhzET1S+DhMsUnhs89fyq22EUz7cYAf5fGfCKpiVNHeOvwW+L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5852
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/2023 9:12 AM, Mario Limonciello wrote:
> All microcode runs a basic validation after it's been loaded. Each
> IP block as part of init will run both.
> 
> Introduce a wrapper for request_firmware and amdgpu_ucode_validate.
> This wrapper will also remap any error codes from request_firmware
> to -ENODEV.  This is so that early_init will fail if firmware couldn't
> be loaded instead of the IP block being disabled.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v5->v6:
>   * Fix argument to be ** not *
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c | 36 +++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h |  3 ++
>   2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> index eafcddce58d3..8ebfec12da87 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.c
> @@ -1312,3 +1312,39 @@ void amdgpu_ucode_ip_version_decode(struct amdgpu_device *adev, int block_type,
>   
>   	snprintf(ucode_prefix, len, "%s_%d_%d_%d", ip_name, maj, min, rev);
>   }
> +
> +/*
> + * amdgpu_ucode_request - Fetch and validate amdgpu microcode
> + *
> + * @adev: amdgpu device
> + * @fw: pointer to load firmware to
> + * @fw_name: firmware to load
> + *
> + * This is a helper that will use request_firmware and amdgpu_ucode_validate
> + * to load and run basic validation on firmware. If the load fails, remap
> + * the error code to -ENODEV, so that early_init functions will fail to load.
> + */
> +int amdgpu_ucode_request(struct amdgpu_device *adev, const struct firmware **fw,
> +			 const char *fw_name)
> +{
> +	int err = request_firmware(fw, fw_name, adev->dev);
> +
> +	if (err)
> +		return -ENODEV;
> +	err = amdgpu_ucode_validate(*fw);
> +	if (err)
> +		dev_dbg(adev->dev, "\"%s\" failed to validate\n", fw_name);
> +

Missed this earlier. If validate fails, shouldn't this undo the request 
operation by calling release?

Thanks,
Lijo

> +	return err;
> +}
> +
> +/*
> + * amdgpu_ucode_release - Release firmware microcode
> + *
> + * @fw: pointer to firmware to release
> + */
> +void amdgpu_ucode_release(const struct firmware **fw)
> +{
> +	release_firmware(*fw);
> +	*fw = NULL;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> index 552e06929229..848579d4988b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h
> @@ -544,6 +544,9 @@ void amdgpu_ucode_print_sdma_hdr(const struct common_firmware_header *hdr);
>   void amdgpu_ucode_print_psp_hdr(const struct common_firmware_header *hdr);
>   void amdgpu_ucode_print_gpu_info_hdr(const struct common_firmware_header *hdr);
>   int amdgpu_ucode_validate(const struct firmware *fw);
> +int amdgpu_ucode_request(struct amdgpu_device *adev, const struct firmware **fw,
> +			 const char *fw_name);
> +void amdgpu_ucode_release(const struct firmware **fw);
>   bool amdgpu_ucode_hdr_version(union amdgpu_firmware_header *hdr,
>   				uint16_t hdr_major, uint16_t hdr_minor);
>   
