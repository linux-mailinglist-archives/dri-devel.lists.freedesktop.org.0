Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 627CF6AA0E0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 22:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263ED10E757;
	Fri,  3 Mar 2023 21:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A102910E757;
 Fri,  3 Mar 2023 21:10:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOaZrEujNWLcKYW531OkNCcntj3RAeOjv2Qr6mYn4/XesRBuwSwuVkf4QDgiGaffuboKqVxyiHUn+SxoTIvwyq3fi0uaS1fWCeOLujQ8I/1EojXqtJXnMgWABNoOBE0oyJMNFRqqfwC/d4LMsi+tNJKY/3fg0Mw2drvZjBgQGYSIiKbclDmjfZcfxiFJGf2Ngi3kWtC4bd9Y7xbjDogzC3AvxdQ94KMr+tUIkaB6Wry04hjxkifXoUZKgj/0LtM40E/l+Se1WGm9afKy/QUtvMb0nAGU/0lLhdCFAGadZf4UoTcwRX+sKdtslnOwnvLPYAugEYWJZISwis3/AzAi8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lp5twSgeWCvLLfPZjGmpMyeCvyGyeyoQgYUw+WaTH30=;
 b=Fa5IXMUuRR7EV2aDXgzK9aWFiWMCEnecgq3PtDEubIOHF6RGXAeOtYl9I5p4o2r1VVHf905pOmoXiHSJDUo1Kt6wSOrQVY5iTyIfo4G8ZZv5/GCBdnJbc9qbH0j5Sx2utkMlorJjGa/69GU0p0a2UjbHWiK1R9/2gPsk/1+hBTTn7ju7CtWylS5cGufMAV+ktpq36g4xLHBrp3B9mm8G9rkoJzI57d3yvgF3l5s+TPP8ck4guTh2CHRJXP+i465M19vju4EaroFqOmUJYZCYZwzt1rNncyWETUEas3CAqeR0SO6Yl9Ui4hQOtRWBtCHK+EtAsZMAVRdf6Np6+q9yfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lp5twSgeWCvLLfPZjGmpMyeCvyGyeyoQgYUw+WaTH30=;
 b=zgZcTsNt1bqPUUGZTg15svthK0fW3nhTsaUtN/obZST3MP6CCZkctXUMC65pnyDFL5R3bRjIUBXosomntEjXkirWcOMt1g2B8mn0JWTgiJtLqiL+Ct7SAXC/K7mNueKQ5eNhkY4bOBTLWtAku0tB1q5yym9pGodxyerj5PhFmBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) by
 DM6PR12MB4089.namprd12.prod.outlook.com (2603:10b6:5:213::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.18; Fri, 3 Mar 2023 21:10:10 +0000
Received: from DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f]) by DM4PR12MB6280.namprd12.prod.outlook.com
 ([fe80::cdcb:a816:4bc3:a83f%9]) with mapi id 15.20.6156.022; Fri, 3 Mar 2023
 21:10:10 +0000
Message-ID: <b106b6ea-f1c3-1d47-6851-2e580b885c58@amd.com>
Date: Fri, 3 Mar 2023 16:11:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/amd/display: Simplify same effect if/else blocks
To: Deepak R Varma <drv@mailo.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <Y8POxreeC3EvOXhC@ubun2204.myguest.virtualbox.org>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <Y8POxreeC3EvOXhC@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQXPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::31) To DM4PR12MB6280.namprd12.prod.outlook.com
 (2603:10b6:8:a2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6280:EE_|DM6PR12MB4089:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e55f3f-e7ae-4c14-aab3-08db1c2babd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TzyPXKrw4rfyevZlNjsvs/1VNKMpIJwB4t0MF+ajYmJ8LYicShJiyAAK42zLEedw6e/ww4jcq0Zt9fmJ6I5iEZ/89uhW1iPkY/Ur7SGDZexGOQwq7FgICqa6Y+f3efLblZWzYud7tlExb21FZtaiS90sDJnVIK8CcoIqBRFDM0PIqsASsibxlYEoCFnWcj7ua2ekAFezJbkrgAY8MdlmMWD8U7G5h0HwQqM3tij9SIqme0+TQVJwywM92qz4qU3pxz2NoEk2KtD5MLfQ88gF+OE4ln2IsvonthXsxdHKwj2rSf+UhtvZKszJgosrTijtyZqwLDGDa54ft0sEOipIlTvmvP7MXwYR5RYYgT5MwC/qGn+3VSeg6AmBJ1MLVtV2K8VMsIX6/2cA5c1U0m8a4PTK6Zw/s4Tc0MdR9c3/YWGilIXeF4VYb+2xDyqhFHdzt9+HIMxTEpY4cT3wB2oi9LE0iPH1Nu66JQRG+8RP3mKSofdTMDJTa3c2HL4VNXTZd6VPWRIcBZrLpwJBUeb8XZTi4+KhgI91O59qmrfQkW9tTwUAsgmOsRbGjLm7DtRHwFNMQLh+lQx26o7a9mzDGxj7yM+KrnZkptXJXBALm50Zm8iihvSWf2l7w6GGMIDrHznKxKC3nlg46d9rdoD7rjCjYsn7guUfys/uBUS9/7C9Mcp8yzLEjwlgXzUc14zmYwTpcszKSuWEFQe020gYp/AZ6CdVhlA2ISINrdcJ7yn2+1GUynbpaBrhShI6zY+G
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6280.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(396003)(136003)(366004)(346002)(376002)(451199018)(31686004)(66476007)(36756003)(38100700002)(478600001)(83380400001)(316002)(54906003)(110136005)(4326008)(8676002)(2616005)(6666004)(53546011)(6486002)(186003)(6512007)(26005)(66556008)(6506007)(2906002)(66946007)(5660300002)(44832011)(8936002)(86362001)(921005)(31696002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEtxNThWRUIvUkZOd0RNd2VYdkFGWC96Mmk5Ky85S3J3MEFJdGYrZHRvZ2dH?=
 =?utf-8?B?SnNjeHpPNmJsT2NFTkNDUmVObkE2RXBad1pqSy9qekh2a2RtbVlTdjdGTjRW?=
 =?utf-8?B?OE1leXN4aU5GSlorY1VqZXJFaHJHTEp4L3FhRkpkRDhwYVJ3Qm8xTmFsdDBw?=
 =?utf-8?B?Y3RkUlh2VTRzUitxbW5Rc3ZTb2hKbHFibmVqKy8zTzFadXpiU1hiWkJWY295?=
 =?utf-8?B?WWV2WEtpUWc5eURLSE5TRVc2cG8reVE2S0pxalRqcFZCSk41QjQxRGgrRkUw?=
 =?utf-8?B?aGFmRHdTNUZ1aXZaMm5nSksySmN2YWU2cHBFUjBzS1BaTHF6VDVkT3VkVDU2?=
 =?utf-8?B?cFVDeE9uUEgwekhSYlg0ZWxvSkwzMGllL2tlTkJXQ29kSlJGRDBzWUdLNVl3?=
 =?utf-8?B?WHJhQjh5ek14NVZhdzdxU1JjYmVSRVZ1RHVYS3BjbUN0N3BjT3NQRmhNYVp6?=
 =?utf-8?B?SmRLVk0xWU81VnRQMld4ckVCQXJGQ0t1NkExOHNPSWlXa21NVmtMRFVTVG5s?=
 =?utf-8?B?SUVxU0lqajBnT3hoWHl0V0VQWlhmVlpmd2RVR1IyeExBZ0U0R3ZHTXkvbUp5?=
 =?utf-8?B?R2o0Y1FTdm96OXZZM0pVWHg4SHhxY2sxbnUyQU5BUG1Qc0xFS2I3UXdEbEdY?=
 =?utf-8?B?Z3pDUS9NUDJLMU5iVlVKcmltVmtKU015d0ZjSnNwOEJVVHBmK1pOOWdUSzdl?=
 =?utf-8?B?aU9hY1F0cXI4UnVyYmZWMlQxK2R6aFJRejFnbFpBcW1wdUx2UVk0SWVFL0tX?=
 =?utf-8?B?RUF3Q3dHOHlHQ2ZxbGcrOHNBcFRWQktjTmlBdzlqNmhpa1lOemx4MlpEaVdE?=
 =?utf-8?B?U0ZwRzVjUEFDU3lwcEtFZkx0NWlrRWdkd1M2cjI1WjgwQXdabzYvTkZVS01D?=
 =?utf-8?B?cExXa2V3QytUaEFLdXllTGhSaVM1Ui9YK0E5M3VQK2UyeXZQbVE5R09UUG90?=
 =?utf-8?B?OEhxcHN2VjJOdWY0Qy9LZENhTDhKblQ0Q1RmMHQ4SnlHRHY1c3kvRFpPMDJa?=
 =?utf-8?B?SlNJYTRRTFZsRXdhZFpyREZyOGhkVVJXZ1g0T0NXK2tVMUNlaTFCZHV0Zyt3?=
 =?utf-8?B?a0ZOQnN5bE1hRmJCZ1J0eUhnMWJaVVh5QzR1Smttb2FkWXlLSjV1Vm5kYzNT?=
 =?utf-8?B?TW5TU2hpZkVjazBpT0d2dUZVT0R2QTZPSDBZQm1uWTk5bUxVaUNQd1FCL0Ni?=
 =?utf-8?B?YUprWURicEtFbDVHbEFHWHczV3BUb2hIMGFVTGE5SU1OZHV1QVpOTEtwVmVV?=
 =?utf-8?B?L1dNS2FHQVZSVHg4QjJoQnJZN3JVMDdsU2JlMFVQN3ZNNGFqcW9Hd3RmQU51?=
 =?utf-8?B?R2VDY093T3pSQ0ZDb084RWNTbEdaUHNxb2tqZ0hTUFYycWMwbTl4OTYremVO?=
 =?utf-8?B?WkxDOUFRaGdpWmg4UlRrSUgxNWlmRHlud1p4WFM0MEdWczArRVhlMGs3bDVz?=
 =?utf-8?B?SkdaNFVnb2szQ3BoUnhQdVU3R1EvZ29hZGdTNFJFN3ZDMXpHSlF3eEZZUWc3?=
 =?utf-8?B?NDFZd0kreFFLT1laM2RZWWVabTBUNjF0QmJPeXpiaVBTQTVsVnNyUTgyMFdp?=
 =?utf-8?B?L2NVVkIraDA1ZzlBQmNDWmM5OWgyWXZYV1Q1RkdMazg5TitvL2t3MWlsOGNi?=
 =?utf-8?B?T0NWNHg1cG0xN3FKdGY4UUxJbGw5MHV3RFBGdmpuODV4UGRXNGlUbXlpZDF6?=
 =?utf-8?B?T0huYkNLQXhSL1o1YWEyZE80STZZQnA4MUpNZzd3Uy9scVdJWjhpd0RuS2FK?=
 =?utf-8?B?NjQvU0RwOG9vNjQ0MGYzazJKWmxGWkViYmVwZ1lyczdOelFjYUlWTDFESWlW?=
 =?utf-8?B?TDZMSVgxWVU4TnJBTndmRkg2QjJvWVU0KzJZd0JOWnc3c1FvakJUSkN5K2dz?=
 =?utf-8?B?Z3JnYWl1eVRlcVI0SE9lNEd0ak56Sy9VMlVKZHFhUWYyRkw5U2xSUHlaS0JO?=
 =?utf-8?B?TjIrd2thMHB1ZmEwMFYvVEc0M3gyM0xxMUVUdERReDdsRnlUUS9xcnlsVFIw?=
 =?utf-8?B?MUdDTU1YcGRNN0F0VWZWK0NRekZaR2lQM093UUlnUUN1cUtuR3VaNVF0WGZN?=
 =?utf-8?B?b0ZJTjlxRTNGcVJVNTk2VjIzTXpvQTVIMDllaUg4TmcvTzFKQ2ViUjhKaHNL?=
 =?utf-8?Q?Lx6z0tockf1Ljh3kLuyiNj04n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e55f3f-e7ae-4c14-aab3-08db1c2babd6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6280.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 21:10:09.7544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUT3xNeE7px6LsECF8/KoCJc9OndWDnhyWcMBDhvxJXIG+qAhiE6i70EG30YNnRKK4s1pStpGk1WQpz482HuCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4089
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/15/23 05:00, Deepak R Varma wrote:
> The if / else block code has same effect irrespective of the logical
> evaluation.  Hence, simply the implementation by removing the unnecessary
> conditional evaluation. While at it, also fix the long line checkpatch
> complaint. Issue identified using cond_no_effect.cocci Coccinelle
> semantic patch script.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>

Applied, thanks!

> ---
> Please note: The proposed change is compile tested only. If there are any
> inbuilt test cases that I should run for further verification, I will appreciate
> guidance about it. Thank you.
> 
>   drivers/gpu/drm/amd/display/dc/core/dc.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 0cb8d1f934d1..776209e5d21f 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -3470,14 +3470,9 @@ static void commit_planes_for_stream(struct dc *dc,
>   		/* Since phantom pipe programming is moved to post_unlock_program_front_end,
>   		 * move the SubVP lock to after the phantom pipes have been setup
>   		 */
> -		if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
> -			if (dc->hwss.subvp_pipe_control_lock)
> -				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
> -		} else {
> -			if (dc->hwss.subvp_pipe_control_lock)
> -				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
> -		}
> -
> +		if (dc->hwss.subvp_pipe_control_lock)
> +			dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes,
> +							 NULL, subvp_prev_use);
>   		return;
>   	}
>   

-- 
Hamza

