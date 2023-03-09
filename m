Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770F56B281C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 16:02:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB7510E84B;
	Thu,  9 Mar 2023 15:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5195F10E83F;
 Thu,  9 Mar 2023 15:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSi9kM1Q88J8DDFYmZZ+7nDFZv+7gfLWqezzYuYhbiNY0dARM/1lys5a49TbffqdZ1D+B5iBZy553C8U7Kib0enKrTLshhyY/sGCCS46aBYALO8Tf/649bjym94p0LyV2rqZ/K+3Y9gl/xuzSECdnoHEDLIE/1tjwJ8H6ujhnNbPrY+TvaaQPV8KlzAp0prVnNnMKkjWgQJci7yHX4ayM0GWnyRW0S93g7pYLn79rTT5PhAhbkQI8DE5buwZSIuhvHS4OGlX+CxekWszWDbaO8UaBdr8xKVQ5w8mtxcAdc2Ulk1WXzUAezo04AHW2d0OMeI2FNcuHySy4f//XausVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCxH7Nqw2S28MYV0Fuia4LNdGKdZCNNxfeE354BngTw=;
 b=guuz+gjQd6BvnsQICrDQMPdkR8O+8wDMEybxC/RBLGxAoZjF/tf9xKSjSjWFmzIuAk+6tCR7L72ieCvrfUUIln7RLM4U/7b2QIPr4DTS0myqkMW7mQ/ruFFI4gUl23ho8QDDTuvhmi0VJNl2cx7HMY6t+/f6C/0o++FcChQOkuDjQ5r3aKrRonwyqyUXRMA7ost0EpLg6KKH2C76TK9Vp8zH3RfgAOseirmvNPB7XOqBbxFZsTX0FdcqM7o3XGnELxkEy5qEewazeG/Td2zxc5/ghvRq7DMFpra4YYYUHtDzHWLMwqXIng5Qz3A8/P0QflnL6oGzMymNubxLw98udw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCxH7Nqw2S28MYV0Fuia4LNdGKdZCNNxfeE354BngTw=;
 b=pnOeBQyF7mrpxMKsistOJtYuvLei/9nVbVaymRfe4Ljyh83nWeiPC1vPwMTml2cYuz9giQZ000kldpcSH3yZDqNrye5cAUiS0xRZNbJuQmvpBd63q3CJLw/yzKgSWayA+n9rGfn6DEyvl8Etfjgstn0X7dHPN4HEvShEI6epwvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DS7PR12MB8274.namprd12.prod.outlook.com (2603:10b6:8:da::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.19; Thu, 9 Mar 2023 15:02:44 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 15:02:44 +0000
Message-ID: <e51d01a9-c678-18a8-b861-894315c872a9@amd.com>
Date: Thu, 9 Mar 2023 10:03:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/amd/display: Use swap() instead of open coding it
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, harry.wentland@amd.com
References: <20230309025250.2534-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <20230309025250.2534-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0206.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::25) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DS7PR12MB8274:EE_
X-MS-Office365-Filtering-Correlation-Id: 0005e5dd-9ef7-4d42-ff06-08db20af563c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yOyMLAS1Qgu/HkKV2PfLbpOrtnC0bh8TTSdoAqvmcT81kX5ZJ0NAQ+oQpYu+cNjOxDE7QFUkzBBB+KA+uGFWvaEDRppCYpBOQ2q7SlimB2/7d82sYwIF2Wq+GddJXgyR6++AAUD8xbttUPogoTCSkKYCPLvA+xh1WhTKkgdK4MPski3WiugXxM0yZX0Bi/5anfPOm2oBXCnXaC/RoZW841r2gfQHvzmXOQsgGXE0/lFYRnDzggCjxS/t0qMOcrwuKHV0e47S2vRjQ8xO6KS+GE7XeSG2ye9jERiKA/P2rJYLBuJgoAgzQ6NFhqts2higczEzuDFcpS1oH9HZFawLC5ECnIyq5OsRXRJp+chUivH/GZzi3UYjVZWhAEfw19UDy/tzPHFAOW1M+WZsP0cgczQ5KAhEdl4Ow+mr/eSZDWjk0M3xAdXzDsKNLKqsvgI+2keleL+hGlZgUglglCqpah2H979gSssj5wlMkVdawZjqur9rVyS0Df50JtfC6ouQJBW+Iulks2SCBNaSGg9eDoZDPXdyNNT6FXio6/YExNUmazxERV/Z2b9DC0T8CAuTS1vWCPDQ6EjYDVcsO6H/WSefvNeuzx67AkXuchBQjFO6Ow2f/oCnJlnv/Yzxty3S7MOL5prLN0q3bnOD2pSoA1hc8dW5pZ4PSNyubYDvtedCzXsx5+l/9mLZtJjfeHSMkozzRz3m5DX+nX9JIyEhv8xqIf3xr71ATyzSGeBn+1M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(451199018)(31686004)(6636002)(36756003)(31696002)(186003)(38100700002)(86362001)(6512007)(53546011)(26005)(83380400001)(6666004)(6506007)(2616005)(5660300002)(316002)(6486002)(478600001)(966005)(4326008)(41300700001)(2906002)(44832011)(66946007)(8936002)(8676002)(66556008)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wjg4S3NRMndId211UlFEU2ZEN2toK01CMXNyVHVXRGtSdDgzRUpwVVlHUzYz?=
 =?utf-8?B?TEZBSkExcVR0dDQvOVVpRXdCeTE5TnY1YmUyajhtK1BPUi9SYU5lVlhqWFVi?=
 =?utf-8?B?VThpdSt4VTlOQUhBNDRkWmVSY2JiOVMzM0hveHp6VjdrZWlwd212TWc2RkdK?=
 =?utf-8?B?L0ZCSERRUEZGbkVtU29yME8zN0ZrdjJNVkNwaUdLSDJkWkZjdmlFVTNwUHND?=
 =?utf-8?B?ZUo0RC9QS21xMXpoazRLaWZZL2R3YmJwNVRhMy82TVJ0Z3NZdnR2aXFFVGs2?=
 =?utf-8?B?aU11eUt4K3ZZRXRCSjhVREF2bVQzYkM4OUdrY1JhaG16QTVremlYUkxOMC8z?=
 =?utf-8?B?bnpmYWVIL1FLdXRscllCdGpacngvY1Z6d1Y3SStVT1puajBqOTNrMUVQQ1p4?=
 =?utf-8?B?WmlvU3FvaExHd2lBWHJkdVJVbzhkekN1R2pFZDB3YWpCTmhnRlp0dGx5WU5U?=
 =?utf-8?B?NU9LSE5zaU4wT2pSa1NhSUF1WmlHV2EvUWl2eVhNNTdxZmFJVmVuNEppMjBo?=
 =?utf-8?B?Y3NaUUhKMGRBUWZpcDNYVm12UnZaWEF2dTV4MGRKQmNqUkN2ZGZUWGFnelhw?=
 =?utf-8?B?dUNLVVpzNHM3d2RIMmMvZlBDVDJsUmFSeDFzQVFTaS85RXlLeExJZFVKZVpK?=
 =?utf-8?B?SndYc2oyZzB3c2hMNExLa01BcEsvaXQ5Ym9UNnBjL0NURnRTWlBRWUtWbnZj?=
 =?utf-8?B?SzVpemkrcGVmN29tY0F6Yld4WjJXTGZRNmRPNTVEMEVSb1Q0MEQ3aHd5T0Nl?=
 =?utf-8?B?SUM1eUhKVGpVL0twQklsQWQzR2pyYWVlemJzRmNzTWpWb0FzNVF4NnlINUFs?=
 =?utf-8?B?OUwrNGZqcmRmNkNVa0ZsQUVPaVZnMGYxelYrZzgrZmZqZHdvT2h1eGZYeDRO?=
 =?utf-8?B?SVN1bnY2OUpyZGU1Yk1sdGs5ek1mQm9nODkvSmJQSUU1b0QvTnNYcDV3NHpZ?=
 =?utf-8?B?dUo3Q21JeDhyNXJFK3FKakw0bHV3RjhGNEVCVVpycUF6S2VOSmRabWNyT3JB?=
 =?utf-8?B?N1F0ejVTcU1TbUlaNzVlMXFzaTZqYkhjTXZYbnZjR3dYSHNwNG1xeTdvVFVK?=
 =?utf-8?B?dmZLNEk1Wk4xWk5QVUF5emVudjZRaUhiSGFJK0cxa0ZiN2dqMDQyQXQvaWt2?=
 =?utf-8?B?QUR5cGFRN0pSUms2b1g2MUhhYUpheDlwQ3RIVkEyTlJGNXI2YzNIT1FJSkh6?=
 =?utf-8?B?RUpNanMxUnJldkJvdTJ6NE9uS0ZUQTJhR2pTbnhqSms1NG5PZkhwRlhrbkF6?=
 =?utf-8?B?WkF5aHhIbEtrMGZsYXg2QnBCNVRMa3VkVjh2OWNJS3BVdnNCRjAxUlNpRWxn?=
 =?utf-8?B?ZnBYLzFIT240ZlFQUzBRTU12TWpCeWdkQmxFWU5HcGExZXBTMk1WZzlFVGdt?=
 =?utf-8?B?YUF5bkFRN2F3cnZicmpHSUtYMnQ1SEx1WVRxSUE5Vi9wSHVHVkpZbkliOE5t?=
 =?utf-8?B?d2xKMk1FR3pFbEtJclFvSGR3dnVhemc3NmJCT2VxRUxMYTMrNlpUZEdlMHAy?=
 =?utf-8?B?N2s3UWl5T2N4NlJLa1BCZXk0dGtEVU4rRzI4UUQ4a0VnRVdLdWkzNmxPenY3?=
 =?utf-8?B?d3ljYzJiblhaSVNXVnFacWFhR0t4WEtjaDhWSU9NeUlRU2ZOdXlHdUEvSm5q?=
 =?utf-8?B?a2RuNkVMM1RrVHdvUGlubFVHZWJ5QXVVWXVML20zOVpyRlRPYkswdTUxT1Jy?=
 =?utf-8?B?MWRwWFROR3Rhc0dHSDB0SGJRd1JNRGpTcWh5RHVjcWZaY01ycG1WVExzdXZK?=
 =?utf-8?B?aUt6dXQwTkQ3Z2dobE9ONzJvS3EvTUJxQnlSUWpFMWc3YjM2MEtrVkpmcW9i?=
 =?utf-8?B?R3VvdmcwL3Y1V3RTbTN1dFJqaVFYZklrcG9ETkVJZmxsTmhHM0llYmJHU3NO?=
 =?utf-8?B?TU14MUc4aGtHUTBDVTVsWi9XTDF2dXZBZW1EY1FGbFJ3KzhHbGZBOGFGZTlB?=
 =?utf-8?B?Wjhsd0xyaG03a0NYN241VXRydllYY2VRSjBPTzZyS3R4QkFXYjV5OG45K2NE?=
 =?utf-8?B?c1AvMnJFa2dOZWNGOUZvT3FtVUtNSjdDb0VWNmttUVJDV3diMnNySHkwVEZp?=
 =?utf-8?B?MFNFeWVlRURaOGtOU3ZDTnZyc1lob2U1eWhaU0ZZNnNFSlFxUW9QMmVvZ2k0?=
 =?utf-8?Q?bmpIo3TsJeMj3Dva2xtQVke8b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0005e5dd-9ef7-4d42-ff06-08db20af563c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 15:02:44.4072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMLsIvwvawZcWrJpIdpJB/57VFiED6j/+/7eSLeUSGz0swPQx9ObUl2moTNY88JEc2GFggK69YK7c4pZ/M6OZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8274
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/8/23 21:52, Jiapeng Chong wrote:
> Swap is a function interface that provides exchange function. To avoid
> code duplication, we can use swap function.
> 
> ./drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:359:57-58: WARNING opportunity for swap().
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4448
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied, thanks!

> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ae994c6c65ac..f6d9bbce15b2 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -352,13 +352,9 @@ static inline void reverse_planes_order(struct dc_surface_update *array_of_surfa
>   					int planes_count)
>   {
>   	int i, j;
> -	struct dc_surface_update surface_updates_temp;
>   
> -	for (i = 0, j = planes_count - 1; i < j; i++, j--) {
> -		surface_updates_temp = array_of_surface_update[i];
> -		array_of_surface_update[i] = array_of_surface_update[j];
> -		array_of_surface_update[j] = surface_updates_temp;
> -	}
> +	for (i = 0, j = planes_count - 1; i < j; i++, j--)
> +		swap(array_of_surface_update[i], array_of_surface_update[j]);
>   }
>   
>   /**

-- 
Hamza

