Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B604FEE4D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 06:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C0F10FB4B;
	Wed, 13 Apr 2022 04:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B603A10FB4B;
 Wed, 13 Apr 2022 04:29:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5QXs+kaHhyHTs3E6dKu3WwI3V2Ye+EJbdrTkXCfwur8AAUoUEBYpN0EDwZ6E6G/NCRFaD4vEhOeYThphq6kMbuofV4GGKMHrBbX4EjBXqVS8niUyDIhoQHu4+Oy00Iiupro1r7muou6M1Puq01BDptSnZ2M/++5ObV721s9I1af3yvIYY3mRZ+Z0O83EvM1MHbKDoYTH3prfqoPaRO7rRepRQCh/r9DPWBOGBPkISOvQNIuYwW9+ExxJ4Ue2DscE0QXq3Rqo9ze8ajYZQHcqF6Xp4cpLz0vew5EJR32h4U5Dahy0BNYo16gAbCkgfeTOYeDvl13U7vOMScZPbpJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tr0bCw77gXzEyGe2lFAwqtIbx/h9BI8BK2iV/rm8c6k=;
 b=fqhl9YyfRdpH7ulJ9/XnWfz2lXPtdCmOxYaJl4cE0d2ZWhRK8eyUL8Y43QAh1ToE9xl0f2hSmcfeYkfZJjr/RCaZkZnYdtUsDvq96xsdfOUa3fTyw+lv9WjsBy0cxDKCPJ78rGjGriDHp4c+Ksxs2M5heDjpit75z3v8q5gp9lyyhM/TgfqRU+En27u+SzTrw+TujuhSvWyZ4U4e1Ed6lKPy4HXYE4MeRxyyp+ZG0PIn95voNV6q8W1GB4ASVBIuUOF0bgSJGQdJeYhqPptGv0prnqetJJYbZUM5NI43p+nZMJBX1KQadys5IMdRFGifZ7/8NYWbFVBlAGgiXoq3uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr0bCw77gXzEyGe2lFAwqtIbx/h9BI8BK2iV/rm8c6k=;
 b=p6qgbEKhnPjXbAbyLQXylEJtBxHxn1cuU54d4eyYKFJV//wW/v1JfaNRQ8OgVKmEtnr1JP4ARsFrcbL5+/uWhCec5fm5vuSTTWx7vyid0xgAzMl/E/91k+faW83QmJYQqM9qIHkwsb4x2K6x/9MUpEjjcK2920mU0kVVMKKwAJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by DM6PR12MB3978.namprd12.prod.outlook.com (2603:10b6:5:1c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Wed, 13 Apr
 2022 04:29:17 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::f110:5c81:79d0:a302]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::f110:5c81:79d0:a302%6]) with mapi id 15.20.5164.019; Wed, 13 Apr 2022
 04:29:17 +0000
Message-ID: <6c2aae03-f873-c673-ab93-d665831a2def@amd.com>
Date: Wed, 13 Apr 2022 09:59:00 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCHv4] drm/amdgpu: disable ASPM on Intel Alder Lake based
 systems
Content-Language: en-US
To: Richard Gong <richard.gong@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, xinhui.pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220412215000.897344-1-richard.gong@amd.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20220412215000.897344-1-richard.gong@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN1PR0101CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:d::28) To BYAPR12MB4614.namprd12.prod.outlook.com
 (2603:10b6:a03:a6::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5003b4f-b680-468d-3537-08da1d062bc1
X-MS-TrafficTypeDiagnostic: DM6PR12MB3978:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3978134433553997C465B7E997EC9@DM6PR12MB3978.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ndKfjxRQoSZ22MTts8Kq4vtnsgYfcjigi/W2gjoA7biCekh13OZWM0DchOY8fXhUYh7bXcvhUlpArNUp+aTJoDGQgguDR2ppULZpe7xgT9tCiLdG1THrVIFqZuR5skYZKHH60GpRAfT6ljAnHVpqJlISBPA8nkWsEhCskgeqro1EfrQKtegDPjMHC+gjdDxQCz3GNv1TpROuR1Uom30IN63NVaB3zfgMDtz9sNiZx6ChlYrnqFlnDfIoEsF8bzQwQCVnNGK6ZDIAtgRq3QhZB6UPAmcEQ1Yg8LRoWCTuQ+/POVVPbol3PWZPyMv/3GFzsX1gsyTTfVKkmom1Yls/izYqvkq/M+Blou1Hh9HPw8B7uDcsdpaQmuG3TBmOO4adWNXaPIzLxwcyxb+T/LQv9iVqZoqdFcWL2f7VPxvmnc4+aj5bbRa0NaLZ9yaW2X4Ou3ZEoP+22inReN1f+1PR6qeTns6xou+bnASAZDcLkCbFWRbpPsasgAaC78Q4CP5elirbfP5cEVZjQJmK9EwzM4Lfro0imMHDkdpe+a7vMoaBwI+N93V+6d6YsZ5MHABa/z/8pXzyCJorqaA2ZfBM3/ODNZ9/2bh8Fes1G1JbSF/E+t1DD0MWrNHDFslBzBxIT2KfLxn3czUy9ejMUeF2HPxyxn0b5AXgQV0VuekUezY+QAoOVAT36PbxRoTOWeWAu0zNR4RvkFj1AW2fFMGhif7UKrbYLzEFQ+1zR7U/2jmHQzJWx+mYdYO9bYmulE/x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(6506007)(6666004)(966005)(53546011)(86362001)(508600001)(36756003)(316002)(66476007)(66556008)(8936002)(2616005)(31686004)(6486002)(83380400001)(5660300002)(26005)(2906002)(186003)(4326008)(66946007)(8676002)(31696002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUxyWE5qdG40eG9hY1FSaWxJUHZuaDNjcnJRdDJFQ3BHdGhMakpFQkRBak5F?=
 =?utf-8?B?TGVZWDRrM0F5SjZwS3J0bksrcWxQcUZJcHU2UXgyUTJEUko0ZHRkcHRXMzVM?=
 =?utf-8?B?QmQwanRudzFkKzBra0JLWmJLa2NKditjN0tyNUMvdVpkaXZFUkFSTVJkdVdF?=
 =?utf-8?B?dkwyWStONG5NSVhOdVJVWjVlbzB4bWxBM3RST0RlSkxydFJVYTFWNXNhdmhH?=
 =?utf-8?B?L0tMM3lJUFdhRGd6L1NUQlpIWVpnODdQRjBEbE00a3NCWEg2bi9HRm85VFFW?=
 =?utf-8?B?bG9KUnZsZ1hwSTV1cW03UWxHeUpHVWphdTdEVXd4MllqVW5DZldDWVJuTWRl?=
 =?utf-8?B?WTJCdG04UjlQUGIwWmRVSExsdUY2a3l3S2o0UXdHTjRKMDNHOFlPZnJXcHBU?=
 =?utf-8?B?NmprQWcyTk1CQXJMYzd3QmUwVUpOcHVoQ2t4ODIvaThKc2xMNmNLNStlZzhy?=
 =?utf-8?B?RGcrYUZWMjBtNkt6U0FtV1pMS1h1eHk2ZlF4SXN2UG5iV3RFdlVrVVRJNjBT?=
 =?utf-8?B?N0F0MnRCRmZUMWtmTFIrRU1BWmZKMk1KbWZEWTN2a0hvMEI3dGNOaTd6RDlu?=
 =?utf-8?B?WXcrOUNhTC9reWxaMGh2ZFpnOFp4aWd2aE9pRkRnYWVVNmlSdGRaajduWkVJ?=
 =?utf-8?B?QXZTR2hhcGtWV0MvK21HR2FpV2sxM25WeURYR1BZSmtvR1NESWtHWGxYYlpn?=
 =?utf-8?B?c2h0eFBGaWhLUlFtYmNrVjE2cWJaaHBCdSthMjdCOWJJZTJPVTdVSmNTQzZI?=
 =?utf-8?B?T054NTMrMTlOdTFFd0VVVkN4RDhxLy95T1VSNnFFSE1jVUJkRzR5WnRZVDho?=
 =?utf-8?B?M29tTmhjMGdCejJvdGpEMWJGeS9pd3FJRmFrM1pjZmNNdlZSUG9QaTRiZzMw?=
 =?utf-8?B?d1E0NTQ3ZHUzWjFDcDFaaStoWjBnN2F2VG9pNmg3RUtDMCswWDEzdFhJaHBE?=
 =?utf-8?B?RitVNHh6L2JOTXRrYzU2M3JpUE05a0tlWEpkbnB1OWlrVUdTNTRheCtDNU85?=
 =?utf-8?B?SUxvVzRBMmNvQlpvVFA4TU1JVStWT0ZxVWJaOVMzdHVKMnFXa2lUZmZhNWoz?=
 =?utf-8?B?aGpBU3J4ZnBkV3NNaUc3TUhqZ3dDSklMT1VDWTlxbWdjNFBKQlBWVHVuY2xM?=
 =?utf-8?B?WG45cHlmUDJYSENTejVsRWV0VkJZT044blN1Y0tZYU9SaWI1Ym5EOHdHSWRv?=
 =?utf-8?B?dERLbC9zeXI1Nll0Y1BvdEh2SW1JZmh2TGhGNU9KOExUajZ1UFphdDMwM0E3?=
 =?utf-8?B?cGR2RE9WYk10dnNzUHFBdWJrY0MzaWtvck5YcGFyQktyTmFaSFNNbmRIelVy?=
 =?utf-8?B?T293Z0tWYit6TStSbWpkWnlqV2VkeEk3MGYyVmJ6bHVDNjJieVlBaGUvZWtX?=
 =?utf-8?B?OGxncmJCcmIxRUZRblZLN1ZKalY0ZTZ5N2dHVmJwdk1nVmxDaUpDeHM1VWdh?=
 =?utf-8?B?dXoxeWkzK0RVMnM5bGVIM3R0Q0MrYmdodURzajkvcFh0NnIyaklqZFJaMTZj?=
 =?utf-8?B?YXltOTlSbkUrN05LOGFXZkt2U2wzTjFIVEREd2NmZld2dXpJWDY1aHJ0bHkw?=
 =?utf-8?B?cXF1U1NRSHpTWkltQ1pmZk12aXE2TDF0U2NSU3p2aUJScHZQTXd6R3cxUkZI?=
 =?utf-8?B?VXVJSUt3WUVOcmR2amFPTjJTTUVYNGdNSHBXdlhIVlNYQVpwN2RVVzJFNVlZ?=
 =?utf-8?B?SCtRcGJLK2xaTGd3aVZRYVhJaG53bDNBdE5mdGRBZlBMbW10bUNZc0pia3Y1?=
 =?utf-8?B?TXdoZDZqMjlkMzMzckNkLzhQd2t4VFRoeTVlSms3SDZjQ01pWlA1NmIyemEy?=
 =?utf-8?B?RHhiSFRUMFpmSjYzdW43MDF4M3V3Y08zNFhIcXZYZEhRU1BuZ0I0RkpBR09E?=
 =?utf-8?B?N1ZjRmEzWkxlTCtDaUN0WkFCODJob2pPRWlCZnhWVFFreU1zQTVEYlNjQkVz?=
 =?utf-8?B?VFZkaWRFYWc4L05JWUdkc3ZKVExmSitaK0VCODZQWGdlVWNjTzNsV0ZVU2la?=
 =?utf-8?B?K1RnenpUcm8rWHVEeW5Jek5HY05BVHNOY3kxaTZwNWg0Y0ViOE5SYmhaSElT?=
 =?utf-8?B?UFNXbENIdHZ4U3o4WnpMaDQ0QUdFN1dTRktOTnl4OURBSDFvMGhMekprOHFW?=
 =?utf-8?B?bXFZL2lJdzRMNlJpUG9hQ0lqYTA0K3k4dTBYcWhNU0tyVjBLdVpHRERuYVJH?=
 =?utf-8?B?blBoR0pzRXF0ZzJRSWw1S2xIcm0rRlZFTVNTRUNKU0tSV25JUU1nUlJhUFBu?=
 =?utf-8?B?UHJUejhka2pSTVZUYjArU0ZvOUc0MjdaUHRzTDVhS0VTeXJNbjBmQ05YeUY2?=
 =?utf-8?B?d0lwblBadTdha0F1OU9iOGU3ZkpKbTBZa3J4Vm9oeE55UVBjVnJzUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5003b4f-b680-468d-3537-08da1d062bc1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 04:29:17.1969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WonVccqFIBC2RN1p8hk68LBMBdLDK1ZaoKHs3bMdPGPscI52IgTc2ieW8mnhLaY8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3978
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
Cc: mario.limonciello@amd.com, dri-devel@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/13/2022 3:20 AM, Richard Gong wrote:
> Active State Power Management (ASPM) feature is enabled since kernel 5.14.
> There are some AMD GFX cards (such as WX3200 and RX640) that won't work
> with ASPM-enabled Intel Alder Lake based systems. Using these GFX cards as
> video/display output, Intel Alder Lake based systems will hang during
> suspend/resume.
> 
> The issue was initially reported on one system (Dell Precision 3660 with
> BIOS version 0.14.81), but was later confirmed to affect at least 4 Alder
> Lake based systems.
> 
> Add extra check to disable ASPM on Intel Alder Lake based systems.
> 
> Fixes: 0064b0ce85bb ("drm/amd/pm: enable ASPM by default")
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Richard Gong <richard.gong@amd.com>

Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>

Thanks,
Lijo

> ---
> v4: s/CONFIG_X86_64/CONFIG_X86
>      enhanced check logic
> v3: s/intel_core_asom_chk/aspm_support_quirk_check
>      correct build error with W=1 option
> v2: correct commit description
>      move the check from chip family to problematic platform
> ---
>   drivers/gpu/drm/amd/amdgpu/vi.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/vi.c b/drivers/gpu/drm/amd/amdgpu/vi.c
> index 039b90cdc3bc..b33e0a9bee65 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vi.c
> @@ -81,6 +81,10 @@
>   #include "mxgpu_vi.h"
>   #include "amdgpu_dm.h"
>   
> +#if IS_ENABLED(CONFIG_X86)
> +#include <asm/intel-family.h>
> +#endif
> +
>   #define ixPCIE_LC_L1_PM_SUBSTATE	0x100100C6
>   #define PCIE_LC_L1_PM_SUBSTATE__LC_L1_SUBSTATES_OVERRIDE_EN_MASK	0x00000001L
>   #define PCIE_LC_L1_PM_SUBSTATE__LC_PCI_PM_L1_2_OVERRIDE_MASK	0x00000002L
> @@ -1134,13 +1138,24 @@ static void vi_enable_aspm(struct amdgpu_device *adev)
>   		WREG32_PCIE(ixPCIE_LC_CNTL, data);
>   }
>   
> +static bool aspm_support_quirk_check(void)
> +{
> +	if (IS_ENABLED(CONFIG_X86)) {
> +		struct cpuinfo_x86 *c = &cpu_data(0);
> +
> +		return !(c->x86 == 6 && c->x86_model == INTEL_FAM6_ALDERLAKE);
> +	}
> +
> +	return true;
> +}
> +
>   static void vi_program_aspm(struct amdgpu_device *adev)
>   {
>   	u32 data, data1, orig;
>   	bool bL1SS = false;
>   	bool bClkReqSupport = true;
>   
> -	if (!amdgpu_device_should_use_aspm(adev))
> +	if (!amdgpu_device_should_use_aspm(adev) || !aspm_support_quirk_check())
>   		return;
>   
>   	if (adev->flags & AMD_IS_APU ||
> 
