Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901C07CE750
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 21:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC86510E452;
	Wed, 18 Oct 2023 19:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD06710E004;
 Wed, 18 Oct 2023 19:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSwZ6WaKAiKS6O1fmKbWhjKjsMGEKUplqDXZ3Kl0YBQHQSGPlkpCXg1k5gSzSNpwYcDsLMiGDQwZvtZ+bbwOFVeWH48oZdhkrIGj7RysRn4SvXtKJnPhyzM0wjjocv4q38TXs7bdIVVYANxYHMstDFuzhKwwl8ybwc4WUXwTXtLOfDsQUgHboVoEy2m/cgrwXQu139RAl1dTzeysEtS0y9UZ22275Ccov3ZYfxVBeMYmBuWhN2USorciCVZTqeOfW7GnpYZ/EYrrH47iXcXdmfXLZNWV2J11A/wTjkkw9DK679DdGyF50kD5BPLgFEBnTWcky87uU1d8zaD4BYUrCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pEnILFWGHVpFlImzzlkZ2Ss1m4ckbU4a5ZG/8Atyrqs=;
 b=IZLSpCzUqc1ossBQPuyxrbtFJ5hmX/Dh1eGIxEbs3TQXFA/ATxvSkOCVaDDAdk/aNio3AnRulrKNmJRiDjf1GWKNpw+wQRwA/5qytrvfExP1VBMogDsi/pcEwap3clcQ0R8q90gdnbMJEQPvasvw6D/j2WBQwcmb2OW2e+brhD8JdtfMK5+cJXEJXvnz5YxyoO/bMmC9nCaYt9iGaJxy1L+wAVS2hVV74d6ujfALDkI9NN3GrGlxKxujO/tDx4PdwQhgwvcZRYt0ZL5nUTU1fUxCyNQSG3yxTI/LZC70ojs5PjOkWAQU3mYVRZ3c9g/xmYoi3SOlexwWwFtiDPUhpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pEnILFWGHVpFlImzzlkZ2Ss1m4ckbU4a5ZG/8Atyrqs=;
 b=eF4NskfQy6BcfgaEK4VTpgEjRSQPefJ4sXQZ2ihGxpobxQ5JYkwIQ1Wo18lSeu7MgCGPA3IUfwxq6XPPTq03p2Whgiwzo1ji+x0VD2DCgikHgT48U2lr3wFqgkBkdZUUbrubssDRfgjQbzFVP///agpGrgFWhB0ZzOS6wnHPY+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.40; Wed, 18 Oct
 2023 19:06:32 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5aa2:3605:1718:3332]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::5aa2:3605:1718:3332%7]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 19:06:32 +0000
Message-ID: <263305cf-bedd-4419-a136-cecffd0eac89@amd.com>
Date: Wed, 18 Oct 2023 15:06:29 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Respect CONFIG_FRAME_WARN=0 in DML2
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com
References: <20231018-amdgpu-dml2-respect-frame_warn-v1-1-43ec8d153743@kernel.org>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20231018-amdgpu-dml2-respect-frame_warn-v1-1-43ec8d153743@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::21) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|PH7PR12MB6418:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e3b99a-b471-40f7-0197-08dbd00d574c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6GSqdpWSvodTBwwl/wvYUsi/7LdfZGXskRQ5xFXKzueX3/Rd6+9h3NB2SUM/sJ3kLtyEROZWwwaDplMUU8yCB8LcKN7LRsUA5IcVfNhzajJI+GKAlBfTODLqhzCRFY+nNMJBH0EkKs59VFzq8GO8ZHl5BjssU9YR70n7q0ODEnhs/XTyFFOzV3EAkDRJnO5TsBZUD8cXiF08N19kTXA2Xx6xfI2sGpiBpqWjtwuTM2h0zHEu8FCWiqTju7gx9jpeDOnIyfWWxBq6QPOp/pwaclGxbg+KxmhD2RRk8TJNnAORMTOY4E8Y73i+Den17yo9LNyZD32RnHVITNcmXF7kljPoHpinGR3XH4FaktFjufnIYHdLP5gkX+yaKUgUD6mhZvDLXoA1pfGEcT8mU0OgHK9UJcrrEJCHZRj9IDJLtzYSb+zhmOZlN3njjk/PUhbkKMHU2adhh8UZuKQkPT9fX83q3T83+Gh6mEuR3XYpdM8zdw2uEiTtCwliNIXZSFDV6j0IjPni4z8tE0aaSSyZDDLpmHpcI/wODGdZZE3Vwi7GtgwhB8Z5/n1vxwJ17Vv4DZzEWScvykPTsfuzV0opqeGoiatjqAaC7cHMQ5CCiqkphI53PciPTf9ipG41iW569Byf29O+CWeA/rAbpu3U2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(39860400002)(396003)(346002)(376002)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(83380400001)(38100700002)(6512007)(36756003)(2616005)(41300700001)(316002)(31696002)(2906002)(86362001)(6636002)(66556008)(66946007)(66476007)(5660300002)(8936002)(4326008)(8676002)(478600001)(6506007)(6666004)(6486002)(53546011)(44832011)(26005)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnlpMENMVlVrTWtsV3p5UmZNZC8wZjBwRTZTZkpHcXpvNFB6alNLNkhNZDhT?=
 =?utf-8?B?T3VIUjNRTkkzemtVZTFNNnI0UVhITktXYnhNdTNZdTZhQjRWSG1YTHROY3RY?=
 =?utf-8?B?a3VkK0k4RU1mczZUMGlLc0cxd2ZyNnhWUE51N0ZpdzVXQVV1OG1WM3VuMGc1?=
 =?utf-8?B?MlRSSUU3UlREU0VUK2lNeWNjYU1GRW1ndEh5cTludVozR2ZmaE5uQm9vOG14?=
 =?utf-8?B?RC8zQWtMekN5TzhkdWV2NnRNZ3JDUVhwVGJmUzY2ZTNuWUxDa3JqbHhpZ29n?=
 =?utf-8?B?RDBIdUF0SDRjOFhBSTNMQ1l5em03anFpVkFxOGJlZFlCcURpajQzQW5WN3N5?=
 =?utf-8?B?Vk9Yc1p5dVFBRlFWd1NoUExnWWZqb21xWGRjU3JPTFRWQ3VrWjlXbFFNNko1?=
 =?utf-8?B?aUdXZGJSL2VMYjZsb210K0NVQ095WEprVjU3M0RvY1dCVG4wZ1YraDBkd3lh?=
 =?utf-8?B?SWtXenFnUS9OZFZNSU9UbE5TMzBmMVpTeXY1Mi9jYmdEeVI0UEVra1VtNDJi?=
 =?utf-8?B?L3JaRXJBRERGKzVQL1NYYURsbW0xanJxMDAwdlZqWEFFcDlYUFdyb3c0VmhP?=
 =?utf-8?B?eGdjMU9pbUJtSGxFN09SdXN1Nm4yZ2RXVUt4eWIzenNONHlrUUNKM2ZmS0hy?=
 =?utf-8?B?ckl0eFV2MzI4bDhkMlUzZ291R25QaG5BblVJNFkzQXZ5bmczMDQ5RFQ1Wi9q?=
 =?utf-8?B?bWR6cEFVcWRxeW5ydHN2THprV2t5WElXQWs3bm90VHFZcHUzWGxNSHc3Z2NQ?=
 =?utf-8?B?Rkc3aC9HODE3UVZGL1h3Ull6SWJYSmt1N2xDOTJoVzVDVXQzS0Nad2pDbGRt?=
 =?utf-8?B?Y1NaaUR6bE1QMERQRWwzU1k4dTVVQ0dsUTRGZTUybVFGSUtxMU11Q0l5ZWZH?=
 =?utf-8?B?ZzFzQmNLVXdDdk1jZzk4V0xiVy9GNWVDMmpNcytkYTk0a0NGWVVnTTk5SC95?=
 =?utf-8?B?RmRMTHlndFVRaWhtTzFPemVmRTR3eFlubWFWbnluUG9VNFR1dVc0VE5UTXls?=
 =?utf-8?B?OE5iUmFMLzY1SWlwL0FlN3B3bDlneUFocncrMXhhQUZBS0c5VUdqTkhwaTd2?=
 =?utf-8?B?cmx1RC8rdE5mOFBjUC9QbHp6alQvY3o2dEdtc3diZ3RBaEVhUmNUeDJzdE5O?=
 =?utf-8?B?Ty9SZ0tvOFZmM3lsbWg0OXdRQ1VhWmNEbFlmYTlEVG05UVZ4aFZocVlUaU9q?=
 =?utf-8?B?WWpBK2dKYzJjU1lkYzVEdkN6Y1M5bUVSUXlIVlowZzdFT3FNS0lQTmszT2Yz?=
 =?utf-8?B?SCszeWRLQ0VlKzRZbzFrb09xRWgySnJ2R1pmNDhqc3JiMmpkblNkdDJnQXhY?=
 =?utf-8?B?ZVVXR1Q0Z0tveEk4TVZiaml4YVJ0eGRqUzBVWldmREhNNTVXbWlkUWpvd2RK?=
 =?utf-8?B?L1hPQlhlaWxCRFR3OUdjbFY0QXRiOEx6UWVTLzVpemZGVnkxN01hUE9tRmN3?=
 =?utf-8?B?ZjVjU0dpSXFXQ3VjL0xBZ0hvWTMzQzVTbzV5Nm9GUmI4YXNEa3R5Mi8vN0ht?=
 =?utf-8?B?a2wvUmxkbDV6dGlVd05DUTNHVnQxWXJMM3VkNzFnZ0J2S2ltdE5IclhsMjVv?=
 =?utf-8?B?clJUL2xwK2pidFI0Qmt2YUErNnZlbWgyMFFWcEF1cXU1aXVZd2RNckR5MU9O?=
 =?utf-8?B?OERHc0VZSHFQNUp6TkdzY3I3WkNEbUgxdU5mcG9ZMUFXTFdSNUM2c29ydDcr?=
 =?utf-8?B?Lytib05rVTJHRkFDc2JpVVpIektmWlJlcExLdmxUWFMyVWhaSFpTejVkZUVN?=
 =?utf-8?B?aSttOElqN0d6YVAreFVGeVhuWVdKd3NjeDhhUjhpMFFBbG9tUXBlT0xXbGNo?=
 =?utf-8?B?cHVZMjYwTVl0UTJmV1RHS1NkcDE1Sk9OaDJQMHFBRUJRV0tNcmlWWld4bDg3?=
 =?utf-8?B?SU5vQVh4ZXdxMGozNngyaWIxeTBDYzQyaWJHZ3h0Sk80UFRTenBDT3A2WHFi?=
 =?utf-8?B?TTAxK0lXNXg1UzJqbE9VMFcwMXJYellpN3Y0MGxaV0lweTZRQWlpWWVObElm?=
 =?utf-8?B?QjVod3hRZW9rY3hSVEVhaDNNeVdJRmJpVHdJWUZ3TjVCYzB3UGZjNlcwTE5z?=
 =?utf-8?B?c256eTVTR3lheXdWZWpFeW40TUd2aTFvZFdkcUNTZ0FTaElWR2IzSDBTemVw?=
 =?utf-8?Q?oRZvn4dCTzqAfl9/2u1Z9NZ6I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e3b99a-b471-40f7-0197-08dbd00d574c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 19:06:32.2247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Em3IomY9eFq4jj3lNsc0ytAviZnJF+a87k2efPhAX/YBoByZQZR9+XqvMnVr4s+G6F9uR8Zytaoz2AimLeUdWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6418
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/18/23 14:45, Nathan Chancellor wrote:
> display_mode_code.c is unconditionally built with
> -Wframe-larger-than=2048, which causes warnings even when
> CONFIG_FRAME_WARN has been set to 0, which should show no warnings.
> 
> Use the existing $(frame_warn_flag) variable, which handles this
> situation. This is basically commit 25f178bbd078 ("drm/amd/display:
> Respect CONFIG_FRAME_WARN=0 in dml Makefile") but for DML2.
> 
> Fixes: 7966f319c66d ("drm/amd/display: Introduce DML2")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/dc/dml2/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> index f35ed8de260d..66431525f2a0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
> @@ -61,7 +61,7 @@ ifneq ($(CONFIG_FRAME_WARN),0)
>   frame_warn_flag := -Wframe-larger-than=2048
>   endif
>   
> -CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o := $(dml2_ccflags) -Wframe-larger-than=2048
> +CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_core.o := $(dml2_ccflags) $(frame_warn_flag)
>   CFLAGS_$(AMDDALPATH)/dc/dml2/display_mode_util.o := $(dml2_ccflags)
>   CFLAGS_$(AMDDALPATH)/dc/dml2/dml2_wrapper.o := $(dml2_ccflags)
>   CFLAGS_$(AMDDALPATH)/dc/dml2/dml2_utils.o := $(dml2_ccflags)
> 
> ---
> base-commit: cd90511557fdfb394bb4ac4c3b539b007383914c
> change-id: 20231018-amdgpu-dml2-respect-frame_warn-536e19b69ce0
> 
> Best regards,
-- 
Hamza

