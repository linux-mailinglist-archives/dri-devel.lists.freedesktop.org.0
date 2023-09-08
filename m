Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36558798989
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 17:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9CC10E8F1;
	Fri,  8 Sep 2023 15:06:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8d::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE6110E8EF;
 Fri,  8 Sep 2023 15:06:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XqyPpDMiWMegT8j31KRxsuuX5IQXdn/u2tIbnyDwqXiJC2V5qyNfC74Utu4uUA+CTKAu+lMk8Rdl/r6w17kpuA9bJLKm1D734xHQL0VxyB4vI5F6vXFywCtE1ZihOY/wIM+frJxbpCJJIcXXeAjLREGpCCCM1v+Gb8YCdECbKTTy9FLMDUHwWua1TtIH/eGPwIc0KEDGEJX5dh5bJ4Sglt4exWyR9MjTWDUYZ1yVdY3R3TraeSiQL+owvn3eSQ3Nj0U6kTZttnehKywSOZ2nJbVRpd5mp7OSvBHVUIAyNdVe/EIFPA0My8AY19j7k7DbJ1dK+UwKkuRu+bKTUpO7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzTcesmLqb6SVvdRZlUls4A5elypJruO86MOTbEP85c=;
 b=DYtxRfeM1st8fEniATSSCp2jTXjO29IULJ7vchfGo2th+M1AcPQn9mEjrfZ0Nvz5Vo0EmoFAbWNG+DAd8SVmtqkNx5Ih6XyvVSD+XfTZ+5vB1hIR8CjnDupvu3OUtx+hDlm6Ev4lQB9j+aHZ9JhW2pcMonRFcFJ1f6W5faIxS0zEsSkP434Vj+SF01gfC5+4JUrU+u8JWx/BRpC0LWesE+1ds16GYa0d4g0BM70oDiCYn0IPE3dZbRfBoZrfd0me8pjW54e3w2Nr0oSKyZxuxRJH2Du2lYZi0NhwCWBr6Y4IIaAZkwGH0U3VtvVlKb4sTTJzn4ztkAmTsBx5HaO88w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzTcesmLqb6SVvdRZlUls4A5elypJruO86MOTbEP85c=;
 b=uJ14YBx9aa33MYoyE9aWA+OyrAXtDR5QuwxnFU9FCPqdp7ZD1YNn2G5NvlVCUoyQMWNBUW6/ACmeiwMahT1KIK4hs/Zr3RiiiC4nYbHA87sgWNr1ALPXCnRK+mCjuO1AK16fDSB627QZArRLSTRIkv+AvLvdQxZaTQNiw/Cx0zE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH7PR12MB7889.namprd12.prod.outlook.com (2603:10b6:510:27f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Fri, 8 Sep
 2023 15:06:04 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6768.029; Fri, 8 Sep 2023
 15:06:04 +0000
Message-ID: <a1e9a639-51f6-44f9-9058-91182d9c16f1@amd.com>
Date: Fri, 8 Sep 2023 11:05:57 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Revert "drm/amd: Disable S/G for APUs when 64GB or
 more host memory"
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230908145521.39044-1-hamza.mahfooz@amd.com>
 <20230908145521.39044-2-hamza.mahfooz@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230908145521.39044-2-hamza.mahfooz@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH7PR12MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: c7de8b86-e3e2-41b8-c390-08dbb07d1ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AFLpme+ee1760gLqX13Bu5uR7Fh+FY5+2wTZhWTJXYyD4hxnTAaAJcbmW7mSFS4f+ZV8M9W88NeYYB8evg1jFRm5tgrbKuTAZGElDde8v3oMlVvbdisCfSBjSLFgGrJqwrnqAWqOtoBCblPefydUvpRXMXG37tB6NaWYTbFjObsQMvNUoCcXZpoKNpULUsdTsTFhWV3h9FLdHRtQeZGAtNIzm0ZRCef+p4PQKBRcqjtPvAKVpGn1vaMDQ7Tq55NQTgVhpybCFYeXH9rNnA1kOrQZAtkvLgR5yrJdmzTIvJljitH3RB6A8mTM9a6UevhMxt0BYNQBJYYt5KKvevmy7kRMoHjtF+sSakjIxJK32A2lYwpAvobpn1H1nyIp7mYa9r0Oc4rgkakLriwEbbStoc+pldb4PCD21P1kWsffMLeUaUH4J804thGTjB+ehXoSkUeuzG13oYI1KEiepJ3MFt7E8bEzcWO1/Q4vfFJ6oRtcYHg6lBHV/HR26Dou6aE76jJF0gqqmMxi8Er/wrACkZ1u/4zXqPab7E/9EQU00ZH+b72C2QsAudWNw7Kqyq0EsMIueVLPvm7n/+/3YXBVJOGNpjN+IsFfPTmlHdK2TqNZeLTuwh/KTRDpS7QvyF7zEGIuykPUPDzvh3kbFF3ktiXefRlshHSdDKgKGZIZxfc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199024)(186009)(1800799009)(53546011)(6512007)(6486002)(6506007)(6666004)(83380400001)(966005)(478600001)(26005)(2616005)(66946007)(66476007)(54906003)(44832011)(66556008)(2906002)(8936002)(41300700001)(316002)(5660300002)(8676002)(4326008)(31696002)(38100700002)(36756003)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2hxcEJuK3JKRkFXbjlnWUhXRXh3NVdaekEzM285a0xvOEN3OHNvQ0E2cm91?=
 =?utf-8?B?cDRhMzhraXlseWNUeEc5MlRLeUFRbnNDVVVRS3dvOTJmUVB2RUhXenhSMC90?=
 =?utf-8?B?VWE4MFkxRCtwcG1PQUNmWWxJK2JKeFY4T2s0VVhETkNOVzl2UXlLamV3YS8z?=
 =?utf-8?B?cmE1czJyREJNbjJicWFDSWZRZVZDUTJDZGVERlpudFBYNU9jWTk2WHdNblFI?=
 =?utf-8?B?dWlVMEo4SkQwYjYvaDVORVBXSEswaVFUNm5zazFMNXIwSFJUUHBLaWUzVmo4?=
 =?utf-8?B?ajhUSk1BOVRrL0Vmb29nOVVFbVJ4SUg1am4xV0RFVTl3eUx4Y1lHaG5kS0Jk?=
 =?utf-8?B?NG5Md28rek9SQUNSQ1VpTjBlcGNBaFdGSU1yNy9PdDFOUXI1NmVPREtzbmlK?=
 =?utf-8?B?ODR3OUpSMDhEUVQyZXFtbFdNMEJzTFQ0MHZSNTdZdUlRajY5Z2FJajhMalpN?=
 =?utf-8?B?YjlZUDU5cGhuVGdlOEJtakUzeVlFdEdpL1ZhWHRKdTJmVWM2RTA3SWhHY0FT?=
 =?utf-8?B?aUNuRHRXdncvRy9XMTB3dDUrNkFCMmh6UDhyNFE3ZUp2ckt0WTJpNXgrSXVr?=
 =?utf-8?B?V1dZNkJYZGI1dWxtRXY0cjRvRm5tYXU5TkZrdWdnVXJvdHhDR2RVMU1TUTM2?=
 =?utf-8?B?NDQwb3RoWWNIdHJzOTRXeXNVNm1PS20zTDJCZjUrRU90QVdvRktjZ1hKWEFV?=
 =?utf-8?B?UGhGTjBTc05Jc09YWHQ4cW8ycDVMclpMSTFKeFpFdVhJSWxpYWl6ZWM0RVRZ?=
 =?utf-8?B?bnMwR3Btako3RitEc3VMcGV2T3g1bVlDam0rWVNrTVlqN05GclhrZ1BDN05y?=
 =?utf-8?B?S3dGeU4yOEFVU0I0UWxsdFFzbUVKUm01a0tRcmM0TXptU0R0ZW1LREtvelJN?=
 =?utf-8?B?SWhSVDAxOEhoSUZVeXFKZnd2RTdVY0ZoT2JFTGFLb0dkWHh4eXEzZ0lVcGY4?=
 =?utf-8?B?ZnJicUtxM251c0Z6U2U4NTlHbWZYaGx2RXRrRk1Hdi8rRUVIZ25sZ1p5ajVP?=
 =?utf-8?B?YmV0Ymw1NVlGVEpuUHUxdi91UEVYeWpHSHV3WEJsUHYvRTUxckk1TVpscDg0?=
 =?utf-8?B?RjAvQWNGaHA4MHQ4QlMycmE0YXhqS01zalZjSnFjQVR6VzZRRWlNMGdoTkdL?=
 =?utf-8?B?aUpNd3VtOFZYOVZpSTgzeWkxMnZuYnczd3paczdHWng1UFVibVZhVWJ2N0Fi?=
 =?utf-8?B?OEJmMmh5c05IYWYxNlFhTE5zaWxzcDFSeDA3K24rczJ6b1ZnMTRkb0g2RWFX?=
 =?utf-8?B?L2NWbEtCaHBuMFpvcU5Pc3dUMktsSUxPVjdBS2k0SW1zUUlYQU1tdS9DekZ2?=
 =?utf-8?B?UW9kbHZsb2pWbXZuQkgwbnNPdmZpdnNERVJnTTNYVzFRakQ4Si96RHFKbk9h?=
 =?utf-8?B?WmJna1NvWFFGWkhHSEp2RURBSlM1d0MwRUJwNnRvMVNKeDFHenZOOHFYdGR4?=
 =?utf-8?B?R1MxVXo0NEVtemQrbTVqMG1oODlaWUwvbUZ3eVo5YXBwM3EySUdOUzRDa0xo?=
 =?utf-8?B?TERIQmdSSWtXYTYrKzc0WG4vUktPNU1HR3JrSXFTUG4waFlVK202VSs3RUIv?=
 =?utf-8?B?R1pVVnFLNDFzTDMva3d4TVpaM3dhNWJodHVSdmJkaVlKbDQyK0QvbUcvNzBl?=
 =?utf-8?B?cll0NGxuL3Bna25sSGlnVlNsMXE2aXpDSGlzQXQxcVJuMDlVWkJBSk5QRFhG?=
 =?utf-8?B?aWJUOHRUQUVUWGxhdnhOd09xM20xNU9HK1JqVm4yNWx3SFRVZHlnL1pSbmJo?=
 =?utf-8?B?UGNhbjdxUVladVNxdFhnNmIyVldJNGw3bU5pR3lRNVE2eWJYbU9rajhIS1JW?=
 =?utf-8?B?S21pUEJ2bDFTOGN6YW13WjUvZE1tNzhGNDJ6alBKdE1SU24yUklsOUNCekFr?=
 =?utf-8?B?cCtUN1N1bU0wdk5nSEl6bFhsTFU3Q0IxVkJDU05DTlE1eHRaUGpJYVlOY2pI?=
 =?utf-8?B?NTVTcHlrMlk4enFnMSt3bTdjM1NsU08wTGxkQ0w3Rm5uVVU1QndURXNDUVRS?=
 =?utf-8?B?UkdkWUo1ZXZzYjFFNm1BdmExSnBtejNjdnVTWGNPbkVxdnk5STE4dmpvYkcx?=
 =?utf-8?B?ZU13bUhOYXE0YjdRemx2WmJwSnA1YWkwa0FNYUJYR0FRb0IwT3dtenpaZ01x?=
 =?utf-8?Q?NY2YsjOK94U1k3DYs56LwpLF2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7de8b86-e3e2-41b8-c390-08dbb07d1ecf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 15:06:03.9874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dmZxnU8vTViOXO8FHh91smLZ/KQxUMmtpxQZGwFjb6ZzL+m3wEz+JgRtvmOGh8QOxYzpZX39NMgeOUilbokKPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7889
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
Cc: Alan Liu <haoping.liu@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 dri-devel@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Victor Zhao <Victor.Zhao@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Le Ma <le.ma@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Qingqing Zhuo <Qingqing.Zhuo@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Wayne Lin <wayne.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Candice Li <candice.li@amd.com>,
 Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is
Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

On 2023-09-08 10:55, Hamza Mahfooz wrote:
> This reverts commit 5b7a256c982636ebc4f16b708b40ff56d33c8a86.
> 
> Since, we now have an actual fix for this issue, we can get rid of this
> workaround as it can cause pin failures if enough VRAM isn't carved out
> by the BIOS.
> 
> Cc: stable@vger.kernel.org # 6.1+
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2: new to the series
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 26 -------------------
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 ++--
>   3 files changed, 3 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 83a9607a87b8..3a86d11d1605 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1316,7 +1316,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>   void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
> -bool amdgpu_sg_display_supported(struct amdgpu_device *adev);
>   bool amdgpu_device_pcie_dynamic_switching_supported(void);
>   bool amdgpu_device_should_use_aspm(struct amdgpu_device *adev);
>   bool amdgpu_device_aspm_support_quirk(void);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 5f32e8d4f3d3..3d540b0cf0e1 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -1358,32 +1358,6 @@ bool amdgpu_device_need_post(struct amdgpu_device *adev)
>   	return true;
>   }
>   
> -/*
> - * On APUs with >= 64GB white flickering has been observed w/ SG enabled.
> - * Disable S/G on such systems until we have a proper fix.
> - * https://gitlab.freedesktop.org/drm/amd/-/issues/2354
> - * https://gitlab.freedesktop.org/drm/amd/-/issues/2735
> - */
> -bool amdgpu_sg_display_supported(struct amdgpu_device *adev)
> -{
> -	switch (amdgpu_sg_display) {
> -	case -1:
> -		break;
> -	case 0:
> -		return false;
> -	case 1:
> -		return true;
> -	default:
> -		return false;
> -	}
> -	if ((totalram_pages() << (PAGE_SHIFT - 10)) +
> -	    (adev->gmc.real_vram_size / 1024) >= 64000000) {
> -		DRM_WARN("Disabling S/G due to >=64GB RAM\n");
> -		return false;
> -	}
> -	return true;
> -}
> -
>   /*
>    * Intel hosts such as Raptor Lake and Sapphire Rapids don't support dynamic
>    * speed switching. Until we have confirmation from Intel that a specific host
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5f14cd9391ca..740a6fcafe4c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1654,8 +1654,9 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>   		}
>   		break;
>   	}
> -	if (init_data.flags.gpu_vm_support)
> -		init_data.flags.gpu_vm_support = amdgpu_sg_display_supported(adev);
> +	if (init_data.flags.gpu_vm_support &&
> +	    (amdgpu_sg_display == 0))
> +		init_data.flags.gpu_vm_support = false;
>   
>   	if (init_data.flags.gpu_vm_support)
>   		adev->mode_info.gpu_vm_support = true;
