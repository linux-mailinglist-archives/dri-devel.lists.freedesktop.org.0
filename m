Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BC46E970B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 16:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1894610E303;
	Thu, 20 Apr 2023 14:28:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6436110E0F4;
 Thu, 20 Apr 2023 14:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5pJecJMXvFHq7jV9vnm2Tl8Q9tfaT0TlmamjvchknSSHVcYM15PXQbhAQSpH1hwH5E5nGkLuTjJY2kBzTWhRjGs6hAIsQQygWrAt0vKJUkUbvmgfYJEFmCxJ5NRfHWXG7hnJaGGiqlDymYEeEQu4wwjtsuDxlnuiZFCJ5WFPOQ8WeFAMyL/JXgClfvEBHKqHR1nmpkQ5mxIEO5423tRY3e3dVZWVKeSG6gPexzl+NZrk/Ro97iFXcl+hHOJRZcqwq/ct6Z38fLMz0HbBuViKKkLjUgeCH4c3ID7drKPgLWCtVbygslQwB6DdrQCxugN2sCKe891dKSaPvHM+chICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRZuMXPWExjtfrCV8dFDCh7xnVTYi69oEYWV73/AYYA=;
 b=HVzk7yDnzQWP/sR00LPG6c/JiML3FjsfRvE3AxxJjFWpbgAfmrBoMusE49xViTJP4df5+H3oBfRVUkmcdVVitfdxRRT4f+WROgRGQ+awOgtiVudHJYQBTcJK6HQX2MYh/plcAH//eE7A9toRoqKN6ZGZaz3Nq5ShmoEpOio2IYe97n1MQLTrAXnh5Z0plDsIrb20pAwmV0mdvq3TXzxActPsXc512i6m/tulYc1XuAUBmnWbs+FCdluotqCeSL0ECIDRVMi0N7E+heTZNNDDcb/3R8LLGRwxprFs1wGYSzqegGEA/xOMSBK4jeAqilA/ucb2XqgSVmaX+1LpAjXOeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRZuMXPWExjtfrCV8dFDCh7xnVTYi69oEYWV73/AYYA=;
 b=FXysvtsgjhImTQGoqkKkTQIUMmpwvV2SAIdKlAw2kt3MGsCJ5GCJLOZAn05vOkMD5KkO1+jAyYhQq8UVUYXG5wCXVsfNZOyxrte64PnDNS9QjkGRhtRQ2R5pSKXVUDM4ECsfVGrOK7AuwE553XBLeDPrVCRe3hiI1w3foSIEzks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 IA0PR12MB8328.namprd12.prod.outlook.com (2603:10b6:208:3dd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Thu, 20 Apr 2023 14:28:30 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::fe53:2742:10f9:b8f1%9]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 14:28:29 +0000
Message-ID: <0ff3f8b3-dbd9-e9b5-d015-42d39f346be2@amd.com>
Date: Thu, 20 Apr 2023 10:29:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] drm/amd/display: dumb_abm_lcd: avoid
 missing-prototype warnings
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Leon Huang <Leon.Huang1@amd.com>
References: <20230420084711.3063453-1-arnd@kernel.org>
 <20230420084711.3063453-2-arnd@kernel.org>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230420084711.3063453-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::20) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|IA0PR12MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 42ebeb43-42a1-415a-a8af-08db41ab82eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wd0vbojkaT/H1qm3P6BY5m98n/BROhePFqxow95Pov3oy3TZo/IrndpsU+2xpwP8zCBDNPhJMlflKCuUNY3Zbw56tp5O2IJ4Lz0jk+S+4cymnWsS1gDeL85+AumDE1U2Zxq3Zn+U+R+CwPl4w82tneOk+/H5gF8Td07vL3Q0shwEEbTo3G4ymdcgzvLoIkuijPEh8q3Grk3LFi67Y84K0BTbqhat8i8o0PE+zVKVrWJjmKkTpil9BKzdMygz+UmxP5Rjm1F9JMm4wDXf9DGJTMShXbUMfp8Y2lsjXIOePv5L7YsnX7cA+pN+Hb8G9iquVo+rsS9p0DIVROi2/1BChYuE3qYHA6NKNBGc8+dkWlToZfSQUGKLYtPNOxBrg0JP+voLk5XpuGzNhSmSo56SQxBV7WE6wCSeYJ2hyXhVh5IAAHLjaFcqBYkDBhwCGx6Z7r0wSpQWz7UWXVKWcu1ZWLBGAVmwPSwTKk1zZs5ss7AYWE/RerVaLlZbzG/iiK1z2DLojDH0bgPCYWOC8W5kEKnH0Djw3SAoEmqxcWjS/o5S6u2YC0vlVmZ/H9AhNdQp0s3/2S9mcphde3NBJTnoZMe3sCd7mVZyxRT0Usbw+2RiokEKYPJsrBWNnLxw3s+QNpNFVLzK9Ipdzo5tAs4Ru5OXD+T19xEBB70hetQnE5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199021)(316002)(66556008)(66476007)(66946007)(6636002)(4326008)(86362001)(478600001)(110136005)(31696002)(6666004)(6486002)(5660300002)(36756003)(2616005)(8676002)(8936002)(44832011)(921005)(2906002)(83380400001)(38100700002)(54906003)(31686004)(53546011)(26005)(41300700001)(6512007)(186003)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3F3dlI3SE5aTWJGbzEzODhRcjdwVHZBc2QxcTNJcG1PVVBBbXllaE1RZFZa?=
 =?utf-8?B?OSszQlpYbEhGVmVZQ1VyV3h3KzdUdnB0MGQydGN5cGtVUm94S0dTYkk1QUlO?=
 =?utf-8?B?Z3FUeTJidTVyZkhhM2M5NW9CZXlDTVFjNzZtR3JMRXZNZFVPZTZRVUppSVVm?=
 =?utf-8?B?R3l6dU9COUlIM0ZmUVFQak93TEZlVFFFTjNmUmxnT25UMGs2eHBTaVZwNitM?=
 =?utf-8?B?ZStJeWxhUk9zN1lFUWdnWTluVGNIUVVJRjVtd1NoeWJWK1RxbWNNZThINEJm?=
 =?utf-8?B?eFNtZU9GSWd0TE5Ebkw3dnUwaUlWck9VSzJMODdCYVVMTlZTWGo4R0p2anMw?=
 =?utf-8?B?WnRhTFh5YXI3dEY5dkVrZmJBQk5lUE1obVNidS8zMzB5Sk5HejNUM01mZjcr?=
 =?utf-8?B?ZHluZ3ZtK3hBSzJpalphVlVpaUtaZUF6alBkTklQVXZ3dGljVzBmWGJ4STF0?=
 =?utf-8?B?dVZJRzBUanlUUU40Y29HbXl2NWR5ODhFWmplRGxrZFdGbXNaZHMxa0p2Y3R4?=
 =?utf-8?B?YTVzRWxtdEhQMWVOSkpsN1RiMVhjbS9TeHFHdyt1L1A3bEx4YUdPRVFZY1g1?=
 =?utf-8?B?QkxNSjZ1Ym1oNDQwZ2JFUnFYazBoN3JnT0FaajJmcndZNGJlQ1VrOThiYjg4?=
 =?utf-8?B?NEQrYW1odVlGMzd0MEhZK2NhT2UrR1lmbVVrUVdVNlhFTDVCa2t0Y2gyNzVR?=
 =?utf-8?B?VkpLNTVwVDV1NDdrWTJqRm1RRTZFSjJpTnptajg1ZXVNQnYvRFo3S2ViNWlK?=
 =?utf-8?B?SjQ1cWJpOEEzQzA5dWJkU0RIMkRkMkJtK0RocEJjcU51WFhUT2t1NHVpQXRn?=
 =?utf-8?B?NUx2MnFTSEN6ajFmOWI2MVpMcERtOHdraks1NDZ4cEJLQ0JjVVFsVGdCY0du?=
 =?utf-8?B?MnMxTkFFMFR1Y2tneS9KMm5pNGVqV1lVb2h4b2NZRS9GY09BM2dZOVd2UWhG?=
 =?utf-8?B?ZzdFWS9aVnhmdEpLNEhSc0tPNVhHblc1NmdmcFo1Zm80YU1hUmtubWlzYlJZ?=
 =?utf-8?B?WTN1NCtSc001NElVSkV1V1NoWFM5eERjTFJtVkRJQWQ1UTJJcEg5eEtCUTFO?=
 =?utf-8?B?NGcrekQyTld1WXRBTnUveFBuUTlROE9yZkxmbHJnVzh2UlRBVDNYcTNKb0xB?=
 =?utf-8?B?MmxQUzMrY3FsQ2VyaEZYWjdlZzVOSExCLzVHRG5iN2VSY29UaDFuOFpUelVK?=
 =?utf-8?B?SHZaR0ZTUm4yWmxpR1QzbEhVMWRwcUdHWnlwTnN4M3hTajJoS1hvV2xrcWNG?=
 =?utf-8?B?OHVEYy9UQWpKb1hsdVBPbWk3aWNJTmJpakY4UEFLQkpwSEtROVVmVzkrekhN?=
 =?utf-8?B?RzVGa0Y5YWFXNDFvS2dGT3E4QnVNaUFWM2xpL2xlakxvS0kwN1NndWsyS09u?=
 =?utf-8?B?dVJUUGJSbURqY0NYajA2SDVMMG9PeStscFd5eldCeHdQTEtmajJacnc1MWpH?=
 =?utf-8?B?bjhoMHJsSUcydlJwUkcvb1VmNlNQMTFoZTZyMk1qa3Bua1IyQkFLVjZCUXNs?=
 =?utf-8?B?NHhDaGVqSWlUT3k2SnRETitnRnhhUUtXWkVKWkJvWG4rMHlvMWdmZ0oyT0Jw?=
 =?utf-8?B?Y3N2TmN3NVRzZlRKV3RzOWpab3Axd3RTeGRvdUVGWXJhN1pERDh1VlAwOWUy?=
 =?utf-8?B?eEJaQkQyd1pVbFNUNEg1ZXB6Z05aWnBtWnVzTXpDNG9mWi9taXRyVWNGdGRO?=
 =?utf-8?B?TDVTY1lwTkl5NFFxMjVvZFkzNkwwcHI2eHhBNEJZK0JpSFNQaEZ1c24zNjVp?=
 =?utf-8?B?V3ZzdC93U2IwS01YQXUrVlNqZ2ZvK0dKbU9XOW5Mcmp2MVh0K3QzRHhDNzFT?=
 =?utf-8?B?c3JucGs4NTltYkRaYmJJSTJnd1R6c0VTdXVZanhZSkNuRUdJOXQydUVSbGNr?=
 =?utf-8?B?ZW1hbkYxVmNzS0p4N2VrcDg5UDA4bzJGREd4dFlCckVFSFQrVnpsMDQ3Ykp5?=
 =?utf-8?B?bHJoRHBGTndBOU5ITFpOUUJpWm5WR25vTjNFZUJ4ZDJRVVdjNTVnV281L051?=
 =?utf-8?B?RnBqWXpxc1pPcnpwU2xySGRKaDhQck5scENtbysxaC91UmtRdng0Z3R5ZU0x?=
 =?utf-8?B?bFhVMm9pMnJwSytSNGhNUW03TTRpNnJCVngyZjVwOVVxYTVQV3ljK1FzM3dM?=
 =?utf-8?Q?MTlfkvtGZESJ6FrfYx+EBso+i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ebeb43-42a1-415a-a8af-08db41ab82eb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 14:28:29.6796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXxuBJyYU1l9Axgmbtdo8ft8LZHoYAUwUMoPgKbxclHQ4mtXOGeMz1eLmNZCeWZITFplFCQrpkljOC+RwtQV2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8328
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
Cc: Arnd Bergmann <arnd@arndb.de>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Jun Lei <Jun.Lei@amd.com>, Josip Pavic <Josip.Pavic@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/20/23 04:47, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The dmub_abm_set_ambient_level() function has no caller and can
> just be removed, the other ones have a declaration in the
> header file and just need to see the prototype:
> 
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:122:14: error: no previous prototype for function 'dmub_abm_get_current_backlight' [-Werror,-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:133:14: error: no previous prototype for function 'dmub_abm_get_target_backlight' [-Werror,-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:144:6: error: no previous prototype for function 'dmub_abm_set_level' [-Werror,-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:163:6: error: no previous prototype for function 'dmub_abm_set_ambient_level' [-Werror,-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:183:6: error: no previous prototype for function 'dmub_abm_init_config' [-Werror,-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:213:6: error: no previous prototype for function 'dmub_abm_set_pause' [-Werror,-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:231:6: error: no previous prototype for function 'dmub_abm_set_pipe' [-Werror,-Wmissing-prototypes]
> drivers/gpu/drm/amd/amdgpu/../display/dc/dce/dmub_abm_lcd.c:251:6: error: no previous prototype for function 'dmub_abm_set_backlight_level' [-Werror,-Wmissing-prototypes]
> 
> Fixes: b8fe56375f78 ("drm/amd/display: Refactor ABM feature")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thanks!

> ---
>   .../gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c | 22 +------------------
>   1 file changed, 1 insertion(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
> index e152c68edfd1..39da73eba86e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm_lcd.c
> @@ -24,6 +24,7 @@
>    */
>   
>   #include "dmub_abm.h"
> +#include "dmub_abm_lcd.h"
>   #include "dce_abm.h"
>   #include "dc.h"
>   #include "dc_dmub_srv.h"
> @@ -159,27 +160,6 @@ bool dmub_abm_set_level(struct abm *abm, uint32_t level, uint8_t panel_mask)
>   	return true;
>   }
>   
> -#ifndef TRIM_AMBIENT_GAMMA
> -void dmub_abm_set_ambient_level(struct abm *abm, unsigned int ambient_lux, uint8_t panel_mask)
> -{
> -	union dmub_rb_cmd cmd;
> -	struct dc_context *dc = abm->ctx;
> -
> -	if (ambient_lux > 0xFFFF)
> -		ambient_lux = 0xFFFF;
> -
> -	memset(&cmd, 0, sizeof(cmd));
> -	cmd.abm_set_ambient_level.header.type = DMUB_CMD__ABM;
> -	cmd.abm_set_ambient_level.header.sub_type = DMUB_CMD__ABM_SET_AMBIENT_LEVEL;
> -	cmd.abm_set_ambient_level.abm_set_ambient_level_data.ambient_lux = ambient_lux;
> -	cmd.abm_set_ambient_level.abm_set_ambient_level_data.version = DMUB_CMD_ABM_CONTROL_VERSION_1;
> -	cmd.abm_set_ambient_level.abm_set_ambient_level_data.panel_mask = panel_mask;
> -	cmd.abm_set_ambient_level.header.payload_bytes = sizeof(struct dmub_cmd_abm_set_ambient_level_data);
> -
> -	dm_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
> -}
> -#endif
> -
>   void dmub_abm_init_config(struct abm *abm,
>   	const char *src,
>   	unsigned int bytes,
-- 
Hamza

