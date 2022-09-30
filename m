Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346745F0D2E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D5610ED12;
	Fri, 30 Sep 2022 14:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5015110E25C;
 Fri, 30 Sep 2022 14:14:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WA7W6RHKKu5fTHYVXY2pX4CeAEgYWfGK/+HqVFK7X7zE1TUESKn4BMcGp3RJH8MxFZY6ZcQr1s/etTBxHXCddCmcBqzFiSM9xVqqttjCWWzCXJ8GlLdl+ZkbKYM83ZZozSFPFG/avuN/s5k/YoARuR3LRvJXKiQHFzlQlMfXY1Sy72M2NZaBKIZXTbn7dpLakwep16SX7SwnIA7C49hlB4FUR7CxvjiGbGUCkbGNxw64bcL4G1GB3DOf0KfWsU+JtleBU3Z1uuBDhT7otKOJtPi8/YazlW7BADAVcvIEuhc0y3CLMSzXnLuWuNxSVlKr4cdd8RujqwdJ4M0AyhjdPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aHzrg0FUISix76Hc9QveuvtXR8Yr7VB1USfPT8EsaE=;
 b=VXCUYaSIZRYyxKNQjfd3sGSp/AJZ4/YZXugRAsOR1pUiaOdGjN+Pu/HqNx2JE1B1CVNCoVsbD5LsGDwKDl1kY2EPPvUwppOrUnCnakTkLhyAFEQbf4i6qQFYYZ9TEK15K/h41+8GRXQTooe5+t067BCZcS+9GIzNqQ/r3ZGbONkXJe8XGmQTzsojft21S2xT2g4OaUbi6sTnm84mCktZrF1WGN8t/nwXosPuaobRIxT5r0Mi2aakc5m6Nb2OVv341ucmErVfl6vkNzENj85ZVBHrbZl5PSqFPlMh9Hh5ddIsi2J+IYmzsjSVbc/fi8u+1SuxNQQMZDHDY962wKGR3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aHzrg0FUISix76Hc9QveuvtXR8Yr7VB1USfPT8EsaE=;
 b=QmzqUyIWlCNrfreXCvbbe/FqDrMl10U3Kz3rlwm0qgM2KSc9uSpoAEXlKKIbXkk8Tc+2f9NiEml1yuGkFGsK719aRE3kn9POWntFvk4PSCT5dnUTXBiBYQRfzzttmM73topwIIpJ/Me4JueyPhBxrdQFcekuFqcCGnPTi46o2Lw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 14:14:14 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9033:772f:1339:75f6]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9033:772f:1339:75f6%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 14:14:14 +0000
Message-ID: <3a285040-8541-59e3-a124-7bf16c38b180@amd.com>
Date: Fri, 30 Sep 2022 10:13:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/8] drm/amd/display: Introduce KUnit tests for
 fixed31_32 library
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Nicholas Choi <nicholas.choi@amd.com>, Daniel Latypov <dlatypov@google.com>,
 David Gow <davidgow@google.com>
References: <20220912155919.39877-1-mairacanal@riseup.net>
 <20220912155919.39877-2-mairacanal@riseup.net>
From: Harry Wentland <hwentlan@amd.com>
In-Reply-To: <20220912155919.39877-2-mairacanal@riseup.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0122.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::12) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 8629f015-c40b-45c8-5247-08daa2ee0d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OitytcIwEEGZIkKvsF3aGkXrCVyT1CWyFVAAKt10vHcRnie0dP6OxF8SDtDtWfKJ/2jjNgIMoR5vdCS8qYwmmKM4L0+1D9Tijr3UA55jQDXnVSQVrLJ0OoJNBEdZNwfmj5gg2rP1KfK2/p31G0v63rVBZVcxNcF83JhcFgTc/GRPghMo5YmaSJoAmS6HoDt1zZvGnbmyWH7PPdY19IGkOawdMGkBWlwx2NJ1eBTGl1WEmmtbQ9d1Axb0EcZr+ym3LNrKGgRExhBngxkZoQv6NiCQDvjIuOG6p/TOs9cbIuOTsnhmoOT55yPcih2to6fQIWk3xZnIeAr+xw6zCmoU6aBhTvu0Pqc9UrXHWITh0mBx42cI/XkMNLKmthfpZFZp+mDLUgjMQynSncIif0tFGTkeY8TnL72ikzBFMrvKQoRcJR7Cq9qC5B8zOIQzzlxt82yqoMUGtyGcBhn7N3S6KoKRb2hkRcYzQtMULoBr9cxEQEoYrdG2MRhQKR15nrqwNRjVsJ9AHqtEcw1zNHCZnNrtQ4XpKQrTcAscyTyUZmHMQV83XkDU70YQUN0TdnjQWZoGUKKKS63eehP4excexewhcqfntzwPGEanLt5YMu+dugrjFIubboPP8s0eyia/DsOF1EeeT6Mk1mpiFPJFs3T7D2NH+rpkIEeJPyJAY1seoP+JW+MTjt8xM5Kk7KgNWNYix2cgFo8DVT+SZWCY0LgHyeA9WdiZPEvbMy2o0IxNiDiuVH+1m8QqBmws7VRmNANHp95j0xFRlMs4DjmDZtxAcPEP1rEej9WcJHFl7Ux9HBs8mEUaT+r0Ux6UbbEI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(83380400001)(186003)(2616005)(66574015)(921005)(38100700002)(7416002)(30864003)(2906002)(5660300002)(41300700001)(8936002)(6486002)(478600001)(53546011)(26005)(6512007)(6666004)(4326008)(6506007)(316002)(8676002)(66476007)(66556008)(66946007)(54906003)(110136005)(36756003)(31686004)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWZ0L0d0UmxPMzB6elBMcG1nMlBHMlhMeTlaeGNJWnY1WGZIeDVlbXZINkZN?=
 =?utf-8?B?TVJQaFNqSHd3dDJMWUdXMWx2bEZJT2hVOXI3MXRDd1NQSkd5blBZeHJkZ2Iw?=
 =?utf-8?B?Yjh4WUtyb1lmM1VNSncrd3JORitLSFZxcWNZczFmZFNScmNIdC9Dc0JvR0xT?=
 =?utf-8?B?QnRoYWtLUkNmSG5sN1owWVpWUXVFT2pUc2ZRd0kra0NxVjZlczd0aVcrTlNS?=
 =?utf-8?B?K2VUeEIvamFHSDlFRjlYQXI2eG5vSmMvSHFwWXRRanhZckVGak9SNVFSZ2Vw?=
 =?utf-8?B?Y0U0c2JJTUwwQVlrMEtwS2Q1RjJZcmdtcUZ0cmRBU3ZaTmx5WHc5KzBnU3dM?=
 =?utf-8?B?U0tMbFZCZXMwSTNML3haSlZPcFhQazdFNGl4dVdVK2hJbnZYNkRnM1A2S3pH?=
 =?utf-8?B?S0gvVjRlRDMyclFmT01GNGp2SVZJdWd2dDFpRlV5M1Q3VUs1ak9qWnV5Mjdt?=
 =?utf-8?B?OTJzaUNhUzUwWm5NM2tCQ0plZ3FQRTdOUlE1TVpkTm51QXpNM0svdDNMNGxX?=
 =?utf-8?B?eXh2V3k2ZWdXZmtJbndYVXYwR2dlOUFkSDI2UXFUdzRqbTI3THFhc2cvZGpu?=
 =?utf-8?B?amtVdEg0Q254a2x1eFFyWEQxWFk3VkFMZWhkZVNtQVE2YVoxbVI1V29uMGZG?=
 =?utf-8?B?cUhVNjcwVGt3ZWRBVElXL2xjUVB4RVpQaDVwazlFQTE3TWVoa0FHQmdyaHNF?=
 =?utf-8?B?emhMUGVNM1dOV0prdk9RcVF1Q2JZM3F5Sy9WRksyZUozQ3I5SmRCWW9wTjVZ?=
 =?utf-8?B?U05FSVhKWmVRdkRSN1Y5MS9rUGo4TVdDa2Z4UVdYaFNiajluNnFIbzdaOFJ1?=
 =?utf-8?B?SDJQU1F4c0NNOUorOEhDaC9CeklUWXFLekxXLzFYRUZLQWNCNHRPbjh4UHdJ?=
 =?utf-8?B?SU5BWndOL2RhejFXWnRzeDVKd1ZSQWhKNmhwVkx5RTA0WHltU0FZZjJMSit0?=
 =?utf-8?B?RStCNW1UM3E3OFpSTDhYWTZXNWtBWU96Yi9lRXBMVG1PTUsrQkI5ejBReldW?=
 =?utf-8?B?Y1FuTm9odU91R2xuNUZYdytEenp0cjZuZm9NQ3h4TnJsRlhMMmZ5aDZ4Nlhi?=
 =?utf-8?B?QkR2YUtOTlEzNGozUmsyS2g5Si83OU9iL1NiODJvMWRKelo3VGhKUlFJQzFo?=
 =?utf-8?B?cnRMbldMNVRXaHF1VkF3c3JQNE5WU3dFWGh3NTRxL3R3bXBzUzF6WWYxVklE?=
 =?utf-8?B?N0RNMTljcnVZQnhVTHB2REo3R0VtdmlybDV5SjcrL2d4bWl2S1Q2MXhQZzdm?=
 =?utf-8?B?SDRBeTFRQjByVzlYb3ZraWJpSGRGMVJ5cjRUUVRWaDJvbld1K28wM1hCS3g4?=
 =?utf-8?B?UThnZHE0ZFNpVHlPRGdBMmVwVGZZNUtOSnF1UVE3SHczcWJ0N201VmhwQVVO?=
 =?utf-8?B?WDY4Z1I1cnRDeTRpdklDV3FxVE01WU1STXg0aCtpK2JhNDlEZFNVTm4rMy9u?=
 =?utf-8?B?NTd5T0ZxQzZ5czZ1bjQreDVha0QyeWdmaU9UWG5EMHlLRFRYTFVaSlpabEdv?=
 =?utf-8?B?dFR4a0ptaFBNNjh3UVlyTVRTVE5UL2FadURHZVFIaDhjYkE3L0d1amwvWGZv?=
 =?utf-8?B?Tnhpa2UxZFkxT0V0aEFDYnBUY1FhcEVOWjBjNFBHZ2M5d1hGT0duekJpKzBX?=
 =?utf-8?B?NVBRclUxVkkzZ25NZGlWSTVpUFpiUGE0alkvZkw2OG96YTNYQnVIWFRrUThL?=
 =?utf-8?B?dVRJaGV0Z2hwcGM4Wk1WVElWRDU0SGkyQ2FuTVBjUW5OUk1DdGgrQTYwT3F0?=
 =?utf-8?B?NWZwRTNtVmlRNlNtUkxBREluR2hGUUJjc0Jzak1aNkJ4aHY4SDNITmlSOTRx?=
 =?utf-8?B?MFcrMldTWDNydjhVM2JGaDIwYVZDamlCQ0tVU3dvRG5FN0JqQTJjSTl6Lytz?=
 =?utf-8?B?ZXZVVjRUY0JoUlgxaExrSHFNRUpGMTNidVlWSExSaFRWMkFwdXI0blAwUnJr?=
 =?utf-8?B?SXUxeUR0RzVNaE9GeG5rVmZIY1VOcGhvQ2llNFZBVGtJRUJRQXhpOHhzU2dK?=
 =?utf-8?B?V29NSmQwQXNvVWNhUi9WUTdxN3JkRE54bi93dENtVE1LWTVlTmNMdVN3bXNZ?=
 =?utf-8?B?NklQL3lWZHpET2hCeFFwR3BVTU85d3NrNHA4MnBVVnNmRkJRRzJ0cW9Lemxo?=
 =?utf-8?Q?5G3VmuBbRYDKoSIJMebBnYilW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8629f015-c40b-45c8-5247-08daa2ee0d88
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 14:14:14.1643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPgEhrOeA2l4Cujaqc16NBLH5xGMhWTXG+Xhqfw68hVqPuUuuEJ9Gvq1ZrvImcx8ayYPU6el3EIcZ2b1Fh7yMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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
Cc: kunit-dev@googlegroups.com, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/12/22 11:59, Maíra Canal wrote:
> From: Tales Aparecida <tales.aparecida@gmail.com>
> 
> The fixed31_32 library performs a lot of the mathematical operations
> involving fixed-point arithmetic and the conversion of integers to
> fixed-point representation.
> 
> This unit tests intend to assure the proper functioning of the basic
> mathematical operations of fixed-point arithmetic, such as
> multiplication, conversion from fractional to fixed-point number,
> and more. Use kunit_tool to run:
> 
> $ ./tools/testing/kunit/kunit.py run --arch=x86_64 \
> 	--kunitconfig=drivers/gpu/drm/amd/display/tests/
> 
> Reviewed-by: David Gow <davidgow@google.com>
> Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
> Signed-off-by: Maíra Canal <mairacanal@riseup.net>
> ---
>  drivers/gpu/drm/amd/display/Kconfig           |  13 +
>  drivers/gpu/drm/amd/display/Makefile          |   2 +-
>  .../gpu/drm/amd/display/tests/.kunitconfig    |   6 +
>  drivers/gpu/drm/amd/display/tests/Makefile    |  12 +
>  .../display/tests/dc/basics/fixpt31_32_test.c | 232 ++++++++++++++++++
>  5 files changed, 264 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/amd/display/tests/.kunitconfig
>  create mode 100644 drivers/gpu/drm/amd/display/tests/Makefile
>  create mode 100644 drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c
> 
> diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
> index 96cbc87f7b6b..cc44cfe88607 100644
> --- a/drivers/gpu/drm/amd/display/Kconfig
> +++ b/drivers/gpu/drm/amd/display/Kconfig
> @@ -55,4 +55,17 @@ config DRM_AMD_SECURE_DISPLAY
>              Cooperate with specific DMCU FW.
>  
>  
> +config AMD_DC_BASICS_KUNIT_TEST

I would prefer if we kept the same prefix as for other
configs in the file: "DRM_AMD_DC". Maybe name all the
KUNIT configs here "DRM_AMD_DC_KUNIT_XYZ".


> +	bool "Enable KUnit tests for the 'basics' sub-component of DAL" if !KUNIT_ALL_TESTS
> +	depends on DRM_AMD_DC && KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +		Enables unit tests for the Display Core. Only useful for kernel
> +		devs running KUnit.
> +
> +		For more information on KUnit and unit tests in general please refer to
> +		the KUnit documentation in Documentation/dev-tools/kunit/.
> +
> +		If unsure, say N.
> +
>  endmenu
> diff --git a/drivers/gpu/drm/amd/display/Makefile b/drivers/gpu/drm/amd/display/Makefile
> index 2633de77de5e..0f329aab13f0 100644
> --- a/drivers/gpu/drm/amd/display/Makefile
> +++ b/drivers/gpu/drm/amd/display/Makefile
> @@ -43,7 +43,7 @@ endif
>  #TODO: remove when Timing Sync feature is complete
>  subdir-ccflags-y += -DBUILD_FEATURE_TIMING_SYNC=0
>  
> -DAL_LIBS = amdgpu_dm dc	modules/freesync modules/color modules/info_packet modules/power dmub/src
> +DAL_LIBS = amdgpu_dm dc	modules/freesync modules/color modules/info_packet modules/power dmub/src tests

Can we put these tests into a 'kunit' directory instead of 'tests'?
We use the codebase on other platforms and 'tests' might be
confusing to some AMD-internal developers, whereas 'kunit' is
explicit and will ensure people understand where these are coming
from and how to use them.

Other than the CONFIG and directory naming these tests look really
nice. Thanks for your contribution.

Harry

>  
>  ifdef CONFIG_DRM_AMD_DC_HDCP
>  DAL_LIBS += modules/hdcp
> diff --git a/drivers/gpu/drm/amd/display/tests/.kunitconfig b/drivers/gpu/drm/amd/display/tests/.kunitconfig
> new file mode 100644
> index 000000000000..60f2ff8158f5
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/tests/.kunitconfig
> @@ -0,0 +1,6 @@
> +CONFIG_KUNIT=y
> +CONFIG_PCI=y
> +CONFIG_DRM=y
> +CONFIG_DRM_AMDGPU=y
> +CONFIG_DRM_AMD_DC=y
> +CONFIG_AMD_DC_BASICS_KUNIT_TEST=y
> \ No newline at end of file
> diff --git a/drivers/gpu/drm/amd/display/tests/Makefile b/drivers/gpu/drm/amd/display/tests/Makefile
> new file mode 100644
> index 000000000000..ef16497318e8
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/tests/Makefile
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: MIT
> +#
> +# Makefile for the KUnit Tests for DC
> +#
> +
> +ifdef CONFIG_AMD_DC_BASICS_KUNIT_TEST
> +	DC_TESTS += dc/basics/fixpt31_32_test.o
> +endif
> +
> +AMD_DAL_DC_TESTS = $(addprefix $(AMDDALPATH)/tests/,$(DC_TESTS))
> +
> +AMD_DISPLAY_FILES += $(AMD_DAL_DC_TESTS)
> diff --git a/drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c b/drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c
> new file mode 100644
> index 000000000000..2fc489203499
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/display/tests/dc/basics/fixpt31_32_test.c
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: MIT
> +/* Unit tests for display/include/fixed31_32.h and dc/basics/fixpt31_32.c
> + *
> + * Copyright (C) 2022, Tales Aparecida <tales.aparecida@gmail.com>
> + */
> +
> +#include <kunit/test.h>
> +#include "os_types.h"
> +#include "fixed31_32.h"
> +
> +static const struct fixed31_32 dc_fixpt_minus_one = { -0x100000000LL };
> +
> +/**
> + * dc_fixpt_from_int_test - KUnit test for dc_fixpt_from_int
> + * @test: represents a running instance of a test.
> + */
> +static void dc_fixpt_from_int_test(struct kunit *test)
> +{
> +	struct fixed31_32 res;
> +
> +	res = dc_fixpt_from_int(0);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_zero.value);
> +
> +	res = dc_fixpt_from_int(1);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> +
> +	res = dc_fixpt_from_int(-1);
> +	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
> +
> +	res = dc_fixpt_from_int(INT_MAX);
> +	KUNIT_EXPECT_EQ(test, res.value, 0x7FFFFFFF00000000LL);
> +
> +	res = dc_fixpt_from_int(INT_MIN);
> +	KUNIT_EXPECT_EQ(test, res.value,
> +			0x8000000000000000LL); /* implicit negative signal */
> +}
> +
> +/**
> + * dc_fixpt_from_fraction_test - KUnit test for dc_fixpt_from_fraction
> + * @test: represents a running instance of a test.
> + */
> +static void dc_fixpt_from_fraction_test(struct kunit *test)
> +{
> +	struct fixed31_32 res;
> +
> +	/* Assert signal works as expected */
> +	res = dc_fixpt_from_fraction(1LL, 1LL);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> +
> +	res = dc_fixpt_from_fraction(-1LL, 1LL);
> +	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
> +
> +	res = dc_fixpt_from_fraction(1LL, -1LL);
> +	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
> +
> +	res = dc_fixpt_from_fraction(-1LL, -1LL);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> +
> +	/* Assert that the greatest parameter values works as expected */
> +	res = dc_fixpt_from_fraction(LLONG_MAX, LLONG_MAX);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> +
> +	res = dc_fixpt_from_fraction(LLONG_MIN, LLONG_MIN);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> +
> +	/* Edge case using the smallest fraction possible without LSB rounding */
> +	res = dc_fixpt_from_fraction(1, 1LL << (FIXED31_32_BITS_PER_FRACTIONAL_PART));
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_epsilon.value);
> +
> +	/* Edge case using the smallest fraction possible with LSB rounding */
> +	res = dc_fixpt_from_fraction(1, 1LL << (FIXED31_32_BITS_PER_FRACTIONAL_PART + 1));
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_epsilon.value);
> +
> +	/* Assert an nil numerator is a valid input */
> +	res = dc_fixpt_from_fraction(0LL, LLONG_MAX);
> +	KUNIT_EXPECT_EQ(test, res.value, 0LL);
> +
> +	/* Edge case using every bit of the decimal part without rounding */
> +	res = dc_fixpt_from_fraction(8589934590LL, 8589934592LL);
> +	KUNIT_EXPECT_EQ(test, res.value, 0x0FFFFFFFFLL);
> +
> +	res = dc_fixpt_from_fraction(-8589934590LL, 8589934592LL);
> +	KUNIT_EXPECT_EQ(test, res.value, -0x0FFFFFFFFLL);
> +
> +	/* Edge case using every bit of the decimal part then rounding LSB */
> +	res = dc_fixpt_from_fraction(8589934591LL, 8589934592LL);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> +
> +	res = dc_fixpt_from_fraction(-8589934591LL, 8589934592LL);
> +	KUNIT_EXPECT_EQ(test, res.value, -dc_fixpt_one.value);
> +	/*  A repeating decimal in binary representation that doesn't round up the LSB */
> +	res = dc_fixpt_from_fraction(4, 3);
> +	KUNIT_EXPECT_EQ(test, res.value, 0x0000000155555555LL);
> +
> +	res = dc_fixpt_from_fraction(-4, 3);
> +	KUNIT_EXPECT_EQ(test, res.value, -0x0000000155555555LL);
> +
> +	/* A repeating decimal in binary representation that rounds up the LSB */
> +	res = dc_fixpt_from_fraction(5, 3);
> +	KUNIT_EXPECT_EQ(test, res.value, 0x00000001AAAAAAABLL);
> +
> +	res = dc_fixpt_from_fraction(-5, 3);
> +	KUNIT_EXPECT_EQ(test, res.value, -0x00000001AAAAAAABLL);
> +}
> +
> +/**
> + * dc_fixpt_mul_test - KUnit test for dc_fixpt_mul
> + * @test: represents a running instance of a test.
> + */
> +static void dc_fixpt_mul_test(struct kunit *test)
> +{
> +	struct fixed31_32 res;
> +	struct fixed31_32 arg;
> +
> +	/* Assert signal works as expected */
> +	res = dc_fixpt_mul(dc_fixpt_one, dc_fixpt_one);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> +
> +	res = dc_fixpt_mul(dc_fixpt_minus_one, dc_fixpt_one);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_minus_one.value);
> +
> +	res = dc_fixpt_mul(dc_fixpt_one, dc_fixpt_minus_one);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_minus_one.value);
> +
> +	res = dc_fixpt_mul(dc_fixpt_minus_one, dc_fixpt_minus_one);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> +
> +	/* Assert that the greatest parameter values works as expected */
> +	arg.value = LONG_MAX;
> +	res = dc_fixpt_mul(arg, dc_fixpt_one);
> +	KUNIT_EXPECT_EQ(test, res.value, arg.value);
> +
> +	arg.value = LONG_MIN;
> +	res = dc_fixpt_mul(arg, dc_fixpt_one);
> +	KUNIT_EXPECT_EQ(test, res.value, arg.value);
> +
> +	arg.value = LONG_MAX;
> +	res = dc_fixpt_mul(dc_fixpt_one, arg);
> +	KUNIT_EXPECT_EQ(test, res.value, arg.value);
> +
> +	arg.value = LONG_MIN;
> +	res = dc_fixpt_mul(dc_fixpt_one, arg);
> +	KUNIT_EXPECT_EQ(test, res.value, arg.value);
> +
> +	/* Assert it doesn't round LSB as expected */
> +	arg.value = 0x7FFFFFFF7fffffffLL;
> +	res = dc_fixpt_mul(arg, dc_fixpt_epsilon);
> +	KUNIT_EXPECT_EQ(test, res.value, 0x000000007FFFFFFF);
> +
> +	/* Assert it rounds LSB as expected */
> +	arg.value = 0x7FFFFFFF80000000LL;
> +	res = dc_fixpt_mul(arg, dc_fixpt_epsilon);
> +	KUNIT_EXPECT_EQ(test, res.value, 0x0000000080000000);
> +}
> +
> +/**
> + * dc_fixpt_sqr_test - KUnit test for dc_fixpt_sqr
> + * @test: represents a running instance of a test.
> + */
> +static void dc_fixpt_sqr_test(struct kunit *test)
> +{
> +	struct fixed31_32 res;
> +	struct fixed31_32 arg;
> +
> +	arg.value = dc_fixpt_one.value;
> +	res = dc_fixpt_sqr(arg);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> +
> +	arg.value = dc_fixpt_minus_one.value;
> +	res = dc_fixpt_sqr(arg);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> +
> +	arg.value = 0;
> +	res = dc_fixpt_sqr(arg);
> +	KUNIT_EXPECT_EQ(test, res.value, 0);
> +
> +	/* Test some recognizable values */
> +	arg = dc_fixpt_from_int(100);
> +	res = dc_fixpt_sqr(arg);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_from_int(10000).value);
> +
> +	arg = dc_fixpt_from_fraction(1, 100);
> +	res = dc_fixpt_sqr(arg);
> +	KUNIT_EXPECT_EQ(test, res.value,
> +			dc_fixpt_from_fraction(1, 10000).value);
> +
> +	/* LSB rounding */
> +	arg = dc_fixpt_from_fraction(3, 2);
> +	res = dc_fixpt_sqr(arg);
> +	KUNIT_EXPECT_EQ(test, res.value,
> +			dc_fixpt_from_fraction(9, 4).value + 1LL);
> +}
> +
> +/**
> + * dc_fixpt_recip_test - KUnit test for dc_fixpt_recip
> + * @test: represents a running instance of a test.
> + */
> +static void dc_fixpt_recip_test(struct kunit *test)
> +{
> +	struct fixed31_32 res;
> +	struct fixed31_32 arg;
> +
> +	/* Assert 1/1 works as expected */
> +	res = dc_fixpt_recip(dc_fixpt_one);
> +	KUNIT_EXPECT_EQ(test, res.value, dc_fixpt_one.value);
> +
> +	/* Assert smallest parameters work as expected. */
> +	arg.value = 3LL;
> +	res = dc_fixpt_recip(arg);
> +	KUNIT_EXPECT_EQ(test, res.value, 0x5555555555555555LL);
> +
> +	arg.value = -3LL;
> +	res = dc_fixpt_recip(arg);
> +	KUNIT_EXPECT_EQ(test, res.value, -0x5555555555555555LL);
> +}
> +
> +static struct kunit_case dc_basics_fixpt31_32_test_cases[] = {
> +	KUNIT_CASE(dc_fixpt_from_int_test),
> +	KUNIT_CASE(dc_fixpt_from_fraction_test),
> +	KUNIT_CASE(dc_fixpt_mul_test),
> +	KUNIT_CASE(dc_fixpt_sqr_test),
> +	KUNIT_CASE(dc_fixpt_recip_test),
> +	{}
> +};
> +
> +static struct kunit_suite dc_basics_fixpt31_32_test_suite = {
> +	.name = "dc_basics_fixpt31_32",
> +	.test_cases = dc_basics_fixpt31_32_test_cases,
> +};
> +
> +kunit_test_suites(&dc_basics_fixpt31_32_test_suite);
> +
