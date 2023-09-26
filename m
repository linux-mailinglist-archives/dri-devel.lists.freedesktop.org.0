Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960737AEDB8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 15:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D700710E3D9;
	Tue, 26 Sep 2023 13:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F7710E3D8;
 Tue, 26 Sep 2023 13:10:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LO8xyhn0t3ZXRotn9VvjhSPV/RHFoiwf0zvcQV4VzlTjXvBk3JzSj7D+C/8XQ4OnUZIk7X6dxFE9lWZ3YnL59HQfCBPEWLN6HaEJrzfVnJRyZeR3w9OX9z9gCqKuPU1IPo1S45p0x24qgvOW0i0804ugfVSumMvL9arTHe3l5B/jqWBS81zDdBut5TNqwqpbG2Fc2zT4zAt2pQlhMGCImb1gMYE8iqkykITEJQlfRyM19u73aQLB6FBZ7ajtfJZzr4Lk+uC7dcCzWbWR0kJUkRmxqYKVd7MDgazpMHRSnvBwYVrvoykFcxl4zEDSF7HYicClhUvZIww3pWrDffdURA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+T+joBoxSaNFvetND2OtUyAd/8avk8c+U2ZAcKrvVo=;
 b=WI/HXCbYXyTUFOBbLSB3CEl04GvaopOSSLAdhISoC3Wut3dwgJ8659m089YQ6AaETn4sS2vmk50Kld68fAzYJrO0J8IiOTw+TMHlEKYWD1ifaTVXfSX8rNXNEwQyaaCSEHYklXhkCSsXyY5Xw1L+B2eSoJbHJ4kPo87vVAVgX/Cb/P093qJjoTj9cF1MER6zxMzJLO/u6oPAlylJ5Y6Rkn+bT28Qcccd+4P/XLR7UsE7iUZ+3L4qHqKyjyCjlDAQ5IeAg75yL8gykLfZxgKQiC33JQ2i1ihIDXghlpM+a3TGZdLSTXPCev9UP4nHwmbey+b4SKmegE9HQ0H9mHz+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+T+joBoxSaNFvetND2OtUyAd/8avk8c+U2ZAcKrvVo=;
 b=zoWQv630d5jJzGV18LmXslslNpXxqaB0x1kSSh/PhfRWWzJ+UuPAJ0wphLwbMaseO5sV3+Geub22V5BR34pTEtPSrzcEexYdMGGSrTAUK10oSsQq8zSVudWIRsjzHI45aZV8Z7IPVcQgN3msexCuZ8fyrfs3rkqyCZa2+oFz4Jo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by SA1PR12MB8885.namprd12.prod.outlook.com (2603:10b6:806:376::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 13:10:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Tue, 26 Sep 2023
 13:10:02 +0000
Message-ID: <a71a61fb-2330-4fba-85a7-9ba2a3642dc7@amd.com>
Date: Tue, 26 Sep 2023 09:09:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: Fix null pointer dereference in
 error message
Content-Language: en-US
To: Cong Liu <liucong2@kylinos.cn>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Tom Chung <chiahsuan.chung@amd.com>
References: <20230926055618.119195-1-liucong2@kylinos.cn>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20230926055618.119195-1-liucong2@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0295.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|SA1PR12MB8885:EE_
X-MS-Office365-Filtering-Correlation-Id: 791d96f5-b814-4b4a-5a80-08dbbe91e4ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zl336kVRatt1PLCVWU366XweLSdkt3KDKtTHeOC4NxHZKNWzEwGQaHQyIFGskBq8VZgJvdiRB7c+qduPlMLDY6Ec9ivIirQlUxZ0nk7IsQoQPqcCZQ/KDtTt9yQAdUxWgFU+yBpaVqlqpUZStEp5OZi1waE8PpvD6vZCr82FblrjhYKDK/FNVrCMMBHsLziFif4LQUtoNutpC74vVRfE6Hq+1/1f7l4fjNsKYa3IVcMp5Bt5MNI5QHb7R03OW+8C4GZUmLMsc68sLRytNx8GbtqjNdT7vbb4MgaEUXzvx4Oj006akvqVhufb4VmV+uhzsz289ciA935JgTSGmRSdWwi1tXpQcPiTWwHYePyjyVo1A7kSYXmrcKzoCfkjUfuY94DW5G31Yf1MrJvpk8cU/rJZXGcvfRNsYR8xSDv0C7YZpm/Q1sCtY0UcPk4NZoMoTZwVaby6gEpprD9pUe8945bPOHmzUbNhyuZyzneoyDWT4Nya0Jrf65C00MgD+kG3iLvPKt+JBI22fUZQ4tuUx7o71ZKTc7bT6eJ4h5yqrf3zinJBTJx6f8kZf2J8pI0g7WPRP5PZCXTv6wjynxl72Am6zC0iwUq9zAYIdW8AC4TyRYlmk9g0OzFUOZ9MSeo2u1O5Gi0eV6/AoKgG94C+T7cvtFsbxe1kQaq8cuo+TN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(136003)(366004)(396003)(230922051799003)(186009)(451199024)(1800799009)(86362001)(31696002)(36756003)(31686004)(6506007)(6486002)(5660300002)(6666004)(26005)(53546011)(6512007)(110136005)(66476007)(66556008)(66946007)(2616005)(41300700001)(316002)(478600001)(44832011)(6636002)(8676002)(8936002)(4326008)(2906002)(921005)(38100700002)(83380400001)(15650500001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M21rdmFXa0FvajgyY0E2M3VaUlE2OVBZS25tdE9ROUpzbjZMTG95YUJEZU9a?=
 =?utf-8?B?WUxEMGNvSXV1RkRZZWdhUTVtaGk5ei82SzhUODFCVjdWUlBvWjUyVVBYRm45?=
 =?utf-8?B?dzhVYkZGMmlWUVdzRnZybU1qWXlzRld0Z3RWQmY5aXNtWDgwbG51N2VwVDBz?=
 =?utf-8?B?ZWRhZzNPRStVVTYzT04razdXRURUVElzNzRxc1ZRZFB2U0pwb0FFYWZkd1BD?=
 =?utf-8?B?ZVJ6ZWVZZ3hXYTU2QWJUcDE1dVN2djNoMFQ4ZmMwMWI3T2Z4QjYrbDBwY3pk?=
 =?utf-8?B?QXRsbGpvTUxYRmFhYko2eS94TWIxUThJR1c2RmRYWHhPZGFnUlpKRDVYeTUw?=
 =?utf-8?B?N3crME93ODdsN1QvZXFFN2Fady9mK0diUWZlbUNZdm9iTGJuQlJPMEhNNkE2?=
 =?utf-8?B?Y3BzRWJNNXJRbitlaE93dmRwVGkvcFRpUGxIeGhGUGxhNEpCQUVtZG40NUYy?=
 =?utf-8?B?SmE2VHkwWHF3U2VjazIyWnFjRzZhVm0yaGcvaEpoSUJKak1KN3JsYjJYZHZp?=
 =?utf-8?B?SFkwVk1Wd2sxejgwelB3TXBiNHFRM3VrWEVqMlBKZ3M5TlJZWlFWUEFLdTFh?=
 =?utf-8?B?OURtMHluMU1VbVpQQjNyVmtXOVI0ajhITHlXN3hJdzdjSDYwVDlHNTc5dXZ1?=
 =?utf-8?B?Z2FyODJqeGd6T0tEQ3FybUhweEpFbVhKSDduMlVsd2tYd0JqbGtCc3UvLzBJ?=
 =?utf-8?B?cVNPeVd5bXc1THJ3bWVxcms5bUV4UHgxemRydkpsdG5KUkhEVHBQMHlmYW9L?=
 =?utf-8?B?aEd2MmZhZzFNMlMxTGNXVUxBUGZreGxMSWtKWUhjOU9WZlRYUjgrMUJWSSt5?=
 =?utf-8?B?c1lWc09iWFFha3czdFdnZmpyejlvZFIrcTc1U3JoaGJ6ZmppOTh3RzA0amky?=
 =?utf-8?B?OFg4QlpWWVREVnNENmFmaTB2TnEwY3NReUdaekI5MC9sTitFMDdUN0p4aTEz?=
 =?utf-8?B?SXZMS3F1dzV6V1lMS3dld1JTK2NpVFFwSlhhRUhlc3p1WEU3dlRuazcvNnd5?=
 =?utf-8?B?d3JKeXdJdWsveldvemdtVFJYbkFvNGNxQmlFZjQ5SjZrU1dlU3FSTzdVRFhP?=
 =?utf-8?B?bTI3R29MSUVvbFYySXpjc0ZSZ2dDMnBVd3Fka1k3WHB6d251UEpVMUx2aXBR?=
 =?utf-8?B?TDIza0gxc3IrV00rTGpxSGtCb3ROeDJKWEtlUjloVEVuK05LVjJhWmFGNTVk?=
 =?utf-8?B?elplR1I0eGJhaFZtNW05T0IvL256U3pCeXJPM0c1czdxTWl2cnNrejd4azRi?=
 =?utf-8?B?MHh1SlM1S05OV3JwaTBFRmIwNklKcXlpZ2N0Q2tuK0VVV1ZVREVVVXRlVDhH?=
 =?utf-8?B?ekZBOHZNR3FMS1JVcyt6UU0zU08yVUtnRTJORkV0Z3JCaGVKWWx1aURYd2pZ?=
 =?utf-8?B?dm1ienJrdlJpNEl1aGRhQ21YZmxYbTJNdDhkeEtKSzhIOGFzaEN1cTZHVUN0?=
 =?utf-8?B?eWFlNkIwbFRnVVlkam85aGRXYmhDVDZBZEdIaVBKTUswanUvRERKb3A1bkJr?=
 =?utf-8?B?c0FoZHpPczV0VlBndFVycWlIZ0pEblFTM3BJUnlVYTlPYjhaTFZ4SG1CMDU2?=
 =?utf-8?B?RDhkZEdZYndsOTdCdlBsZDNkQit2NUVRSGdEN0xHNVlha3pkNUlsVjlvaTF2?=
 =?utf-8?B?NGIvUW9VbnpaU3QzbVB4Q2xndlVXVks4SWc4WXNPUHhGR1ZvajVMODdoVi9l?=
 =?utf-8?B?clNaWHZPOUZQSDk0cXZ0WVJBaUNtVnc2elBCN1BhSUNZOUhGODMwV2hYYThj?=
 =?utf-8?B?S2RRallUeXZSeTZKVUtuLytua2pwTVNHdG1kanBSd3dJTGdwMnh0QVRGRWgy?=
 =?utf-8?B?OWlkVFFINjI0a1pIYTgvKzc2dVJ6SHR5VWV4RUpJai8raDNieFlOUEsxb21H?=
 =?utf-8?B?R3NyNjczOFUrU3NROGhiVVlJeG9BcjJDWG9lc3V0ckFCaWhOcHBYNzFJTTZL?=
 =?utf-8?B?alhENXpMRk9vQXhGY3ZJcVJoZnFLSW9IQlRZVHpTZ3dyb1U4NmVLbGxYelBv?=
 =?utf-8?B?aWlyc0Q1eTB6WEZlaTF0dTBnSEtySjJiVHc5aTJCUmtCNkZhMkJyTGxNV0tS?=
 =?utf-8?B?M0NqUHVzeE8xWGx6LzdNZjBheHg1Y1laNDE4VWRPTGsyQlptK0MrdnpOYUdi?=
 =?utf-8?Q?qZDo3XEHDYCZfzTFjFX6ulkJM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791d96f5-b814-4b4a-5a80-08dbbe91e4ba
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 13:10:02.1954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z00YFkpRm0HhM2ZzND2zIePkznVU0zOIk3PC54dDYR1C7P1GcWqJK0GOIYRf9f8tYH+uvIJMWgw1C4q0FFOdSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8885
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-26 01:56, Cong Liu wrote:
> This patch fixes a null pointer dereference in the error message that is
> printed when the Display Core (DC) fails to initialize. The original
> message includes the DC version number, which is undefined if the DC is
> not initialized.
> 
> Fixes: 9788d087caff ("drm/amd/display: improve the message printed when loading DC")
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 8e98dda1e084..bf52a909f558 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1703,8 +1703,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>  		DRM_INFO("Display Core v%s initialized on %s\n", DC_VER,
>  			 dce_version_to_string(adev->dm.dc->ctx->dce_version));
>  	} else {
> -		DRM_INFO("Display Core v%s failed to initialize on %s\n", DC_VER,
> -			 dce_version_to_string(adev->dm.dc->ctx->dce_version));
> +		DRM_INFO("Display Core failed to initialize with v%s!\n", DC_VER);

There is value in printing the version number. Let's not remove it.

Instead you can probably fix it by doing a NULL check on adev->dm.dc->ctx.

Harry

>  		goto error;
>  	}
>  

