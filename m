Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF41779EF51
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 18:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E5310E4BC;
	Wed, 13 Sep 2023 16:48:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026A810E48E;
 Wed, 13 Sep 2023 16:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUBeBo2YEIqB500KpQjYs4NxFbr/PfbUUcJe7guAUbioQZFgoRd1RjXqncEnlfeZrzfL7JvrsBLz8h3eMOOLMmR4xDN6SMxwxFuUrIC3B1lVmacQSMgDG3iqTFMJfTSwiBj4MbnWD3dB5TI+qpy5f9DsYhOLiRltfEABjCgaIkggp8AMU0tYYwEDNJ5epF++GVDMW7Sf73Ea+LR7soO0r5xvhwWhUF22qJWJsz6Tgz9XovnYiHet+JK/3FhE3GIA4dyC6dpyEq7TuuJhKG0YnUdOQwnfTDpsEA5RLqxL4D5LaHIYcWfau6PRzrmeCcKNAHaNRZMgbq5vwBStgHLgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhs9FzrcwlDqEO6haq6N65xeQhutEPVawLlzECKl3Ag=;
 b=n+5ZPdZbvi3y+4sfAnve+Rtx0i2jdJQpDnhYAqux+e45uPs92NAa+fy5MmfRfR5qs3dOiLdAtlb7SN9DasjSTzTfXrXq8/dt1EXyQJFVeTbxGlfGl88qtPWNOaBYw15osO2sFCAs+jUj1qdtFXyVu0gofaAUIeqAJtYsCZvW7mbH1dvmoNb1dXPoYIYQ0cJ3p8VCOSxnmQL/BF0n3V3RQ6hPVZmM8M0iXpR19jOF10eK64PFaCOokJJILgdEqgdAvMT7/J9BuO3fMdnWsWVpj7vPdy9O/P4JaKdnieN0jj9qWejXmSBKO3aoDQEl4liSUwYrXAMBzSMiDpu9lFY94A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhs9FzrcwlDqEO6haq6N65xeQhutEPVawLlzECKl3Ag=;
 b=HXZHsiYQhZJJUZ2F7mMxc9zBeUfOYHfgiHsdWqD+shbyYEVWEHc7dyh137OmCVbLrctO/wpES8U51fo1sK64tq07eZEfkYW2n4ef0H6q50wXVwYcBUecFml3EK1xWKfN3zuAcVwWJkjbbRWiWRA2mybt/zOjgujQqo1A9Z+aD00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 MW4PR12MB6731.namprd12.prod.outlook.com (2603:10b6:303:1eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.20; Wed, 13 Sep
 2023 16:48:50 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::4196:c9c9:dfe9:8079%3]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 16:48:49 +0000
Message-ID: <71517f0d-fa9c-4138-ba90-8680148c74bf@amd.com>
Date: Wed, 13 Sep 2023 12:48:45 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Fix -Wuninitialized in
 dm_helpers_dp_mst_send_payload_allocation()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, Wayne.Lin@amd.com,
 lyude@redhat.com
References: <20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-v1-1-2d1b0a3ef16c@kernel.org>
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-v1-1-2d1b0a3ef16c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXP288CA0025.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:41::34) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|MW4PR12MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d48cf51-70db-47f0-5674-08dbb4794e0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n7YjoUbL3kVe9/xfWG2Qwyiji78PslJMlefgi6mSgpHzpWdD2HMkrX4wM8c66hnn5WK1YoPDcGax3plYY8B05AAUmdMBFXsQuVr/WEDx8Foj8WXyM7iHntSGz6dkBOkTM5ZeEYXhClr8MZsMbdILo21868ibWu4kkpcQWgeZuwV88owgnmAlXwQRpcXwIw3fjfplmtrZo/m/d3HDHxXvD77y/++I/UwCIiuwRWDmTmAqWAls/hwmktUUlYDUVAa9qfO4G/gnh2sR8r4StpNtw8bIwHgxnSHbEK0NuukU+MMhuulIEU/RivUMQeggaagCZKBTelAjBMfO6VN1sE4XSuIhgiAVvjo4H+2VjmWE0gni0+e/PMMsBnxi1AKRTL0Nhtn1tOp2NmtEeMCB2Xne60UWxFeEGihIbSWumgImqjpmvo2MxMZA5VuJHxo5cyIsZcZM/LZFLMJ0fAukkJuSfnkUPbf6NA4VOB94dJ9LpOid3edTXk/Z171eKgxkcaKSQMTcQZYuRb7A1doDY5RbUzjKiVWhwtWQR+m9+epBPwRDiJvZpjNObKWjjqlB/qMPn5x355QIt/XhPttuRkKTZz2AJsAnGlDuhDm5GN1asNOISGmvI1qNd5bikC5dZR+vDYSJm87Psqn0PcdAih8FQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(366004)(396003)(136003)(186009)(1800799009)(451199024)(6506007)(478600001)(6486002)(6666004)(53546011)(966005)(83380400001)(26005)(6512007)(2616005)(2906002)(41300700001)(66476007)(66556008)(66946007)(316002)(5660300002)(4326008)(8936002)(8676002)(44832011)(86362001)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ay9PWVlBTmpJOXIxdTkvOGpjVkk0Y2lGbkVybG53MmQ0bEdGM2J4cWdxY2xs?=
 =?utf-8?B?UlM5dk1kNmYrd0dBT21sL01EUksyS2ZVSlhXNXdDSlYyNjRzbEFCQnhRbi9S?=
 =?utf-8?B?Y1Qxd1YvdFpOOTZSU09hbnk5YjB6cE1TanllNExscG5qVytzdWdkRGVkaUp0?=
 =?utf-8?B?TzVOSTFDbDJzSFBBeHJVMUhlMEgwb2lrQU52c1J3amRpTnNobTJSMEp3UWN5?=
 =?utf-8?B?enUxTDlEUGJ2LytxS1c2Si8zTHBoWnFQRDllZm5GbTFCcHUxSDJOdjYrQjd1?=
 =?utf-8?B?MGYxY0Z0VjBuR2xDaHpjWVNmVHFhcWZDdEVCNEFFZGg5N29VcFJkSk1RaDl4?=
 =?utf-8?B?TzY5S0Q2V3VobmpBeUUrMlJIcHFXVXFNRGdpVjUxM3JlSng4V3l4ZmJ3Z3F1?=
 =?utf-8?B?ZnA0QnZTTG1QWXRpNGdLV0hnL2tHVEVkTGlOZW5UdEdUVUZ0ejcvRHNqazRM?=
 =?utf-8?B?SlRGMWQzck1LMHNjQ3dzd0VaMldBVTZMajQxRkh0bzlMWXQrWkxPMUwrN3ZO?=
 =?utf-8?B?Y094RDZyWEFpZ0ZaNThVNWN2WXlQYjNoN2RsMHdGZFhGd3JvQWZTczY4eFRH?=
 =?utf-8?B?ZW5tUStaTHRldzVlZ29EMkVJU01zczIvR2hTY3gralByQitiNTBJdGRaeC9y?=
 =?utf-8?B?L1kyTVBoaFNNaGxEUXJTeTJJdFhhWlJYTWd6U1liTjNzbGpPWlNpblAzU2pZ?=
 =?utf-8?B?R3Z3TTRNWnpFcUp1ZWQ5UE9GbmR5bElyZVBYbHVTck44bGpKMktSd2ptZWhj?=
 =?utf-8?B?aUEyaWdLY1hpY014Z0ZtL1hzQWJFbitpTGVWV1l5QW1qc2NzQjgvTUQzUmZn?=
 =?utf-8?B?cFpsR3lOczk1RlRRY2cwTFRsTWQ3NExONy8vNmVCOGcybWZXL2RQamhUMHlF?=
 =?utf-8?B?UU5kZDRwYjN5MTVUVFNzYU1XMTdYMGdPQzczSjloSnRROWc5UFladEI5Y3Iy?=
 =?utf-8?B?WS9vOVVrdll3dFVBMWRaaWticEliYTd2ZTB4ZGljWFlJZklUckV6SmhlVWMv?=
 =?utf-8?B?ZkdkTk9CbS9iLzI0c1l2YTNPSGtMZFVYbXpHVEhqYTBqU2hZUGNSRjJGb2lj?=
 =?utf-8?B?QXFnbXllSFlYMFBUZHkxcC80MjZFL1lJSWw0eFdZTWZSZnhVbTVpRzJIdWRK?=
 =?utf-8?B?RmNrWk9BTnBEeU9wRVltR3FFb3RjcmVCbElJZEV2aHVscU1LMVlKVVkyakdE?=
 =?utf-8?B?c2RGR08vSUgzTHhNNktSQUY0TnN0eGhQeVoyYkp0YXhqVTVIN2hzWUZueEUz?=
 =?utf-8?B?UVJSNG5tWjZuU2VXTmNFYXJlYk1uQUgyUjdaWG5UcEdUcHZleHJhaWgzdDIv?=
 =?utf-8?B?TmJkeTI2NFdHeGZZTS9iYlRaNWNzalV4TFNHUGcvb3dSL055TW5nTDJvUExW?=
 =?utf-8?B?dlNUVGdlWE1hZEVLVGY0TEp3a2FSdi9WWlc0SVoramtMbjZDcmlaS3hORDJQ?=
 =?utf-8?B?NTlNa0x5WnBabjVOWlE5a0VQdGRqd1FuWE5vM1lLTFBMODYxbVV3RnN0K0hU?=
 =?utf-8?B?ZUtOR1FPamtoaU50U2hSbTlqQ2ZqdlYrb2Yxc0VpMGJ6SVcwS3ZRL3NPUnIr?=
 =?utf-8?B?NWlHTU1VMUpMQmY5ZFJxNjBGbjNDQVRjMTVsZEM3eGVZUUFGRmdqMUE4ZVpT?=
 =?utf-8?B?dmxOVG42cnpBb1lWV0srSnlFeFI2YnJKRUt1amoxUW1mV1JTWk1IMjZLeHhV?=
 =?utf-8?B?VHUwWHpXNjBPMzd5enJQaFdvNDRTRjdqZFRVNkt2ZXEvc0NBZDBIRkZPUTBO?=
 =?utf-8?B?MEtvYWRmY1h0RGZUVUNzcmR5c2R0N0wxT05OUVBCV1VzSGJ3d09SS01DV0p2?=
 =?utf-8?B?RGRGbEVROUpzcmw1MnB3eENyUWNmZG9BZEpzaFdQM1NuUC9KNWs0RVlvVE13?=
 =?utf-8?B?a0xScDBOVlJNZnVhTVg5dGI5MmZ6YWtUalRhbmhGbTZNTUxhcGVHYXZ1RzlB?=
 =?utf-8?B?WXg5cmpjQXp2OHVlVWQzVTBpejlGdlcvaXR6ajJYWjdsTnkweWI4N2dxTlc2?=
 =?utf-8?B?bGtPRXRFRW9iSWtDZ2tvK3Q1SU1ZVGl6SWEzbkdtVmpEMkhDUzJ1cjRZQWVq?=
 =?utf-8?B?SSsrSWNsYUtRbXcrRmNFWjRPbGE1Y3NWTmFVUmxBU2lDMGVpaFJ2cEhrZGYz?=
 =?utf-8?Q?0EvFsr+WcBRjGno4EQCMVI2qR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d48cf51-70db-47f0-5674-08dbb4794e0d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 16:48:49.8189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xYqpsGGkb0hINrHQflGvNTu2W3/SmjQLZjS+NBvT8dfiQJOZoVE/pd5zg88fiIckHnMUiv6psWxsUqDsEJ+Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6731
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
Cc: trix@redhat.com, llvm@lists.linux.dev, ndesaulniers@google.com,
 patches@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/13/23 12:10, Nathan Chancellor wrote:
> When building with clang, there is a warning (or error when
> CONFIG_WERROR is set):
> 
>    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:368:21: error: variable 'old_payload' is uninitialized when used here [-Werror,-Wuninitialized]
>      368 |                                                  new_payload, old_payload);
>          |                                                               ^~~~~~~~~~~
>    drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_helpers.c:344:61: note: initialize the variable 'old_payload' to silence this warning
>      344 |         struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
>          |                                                                    ^
>          |                                                                     = NULL
>    1 error generated.
> 
> This variable is not required outside of this function so allocate
> old_payload on the stack and pass it by reference to
> dm_helpers_construct_old_payload(), resolving the warning.
> 
> Closes: https://github.com/ClangBuiltLinux/linux/issues/1931
> Fixes: 5aa1dfcdf0a4 ("drm/mst: Refactor the flow for payload allocation/removement")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 9ad509279b0a..c4c35f6844f4 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -341,7 +341,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>   	struct amdgpu_dm_connector *aconnector;
>   	struct drm_dp_mst_topology_state *mst_state;
>   	struct drm_dp_mst_topology_mgr *mst_mgr;
> -	struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
> +	struct drm_dp_mst_atomic_payload *new_payload, old_payload;
>   	enum mst_progress_status set_flag = MST_ALLOCATE_NEW_PAYLOAD;
>   	enum mst_progress_status clr_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
>   	int ret = 0;
> @@ -365,8 +365,8 @@ bool dm_helpers_dp_mst_send_payload_allocation(
>   		ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
>   	} else {
>   		dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
> -						 new_payload, old_payload);
> -		drm_dp_remove_payload_part2(mst_mgr, mst_state, old_payload, new_payload);
> +						 new_payload, &old_payload);
> +		drm_dp_remove_payload_part2(mst_mgr, mst_state, &old_payload, new_payload);
>   	}
>   
>   	if (ret) {
> 
> ---
> base-commit: 8569c31545385195bdb0c021124e68336e91c693
> change-id: 20230913-fix-wuninitialized-dm_helpers_dp_mst_send_payload_allocation-c37b33aaad18
> 
> Best regards,
-- 
Hamza

