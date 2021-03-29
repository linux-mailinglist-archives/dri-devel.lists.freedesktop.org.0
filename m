Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD6334D618
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 19:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD6789EF7;
	Mon, 29 Mar 2021 17:33:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FFF89ECD;
 Mon, 29 Mar 2021 17:33:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AA71YgXi3DVqt5p+qzTUX8gTuZu/UP9hvRYv4LpEYA6TqsZ5C4tD3tF1xBmlFBDgHIm5fhxfEJcwnPfIX9r7tM3HHE5uueo5opo6KmOwwvT1S5oRGfxmPK7vXcapMxk/tx/aRxqKq0mP4nBzdLn9pGzMYZM9a2uM4fmyWZFxYma/MW6fO9qxO61IORst9r+9OJxVRXWHb/wN/EEaznhYM88itWvjHXhq48WpcLbAmMf52aw1/ZHhSafXO+BSUCYcXZpRPOLDdUHCWcKuyTZn1wrZC1I5yvtSEs3UgnPgy+gp5pry7ODNVVgs4VMjUrDjAXqH86V3wAXTNvvRb4nUdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRl4CM98VnUwsjuPkji+ebpOYEO0wzKz8YEjuxmTn4c=;
 b=H0bMBkSqaoyxwkigIMha0XbJyi0TAyODZ2rYlmg0V4eNzeJj92OSC0u/sBq33UjlsHtnT0lPvIIx45X0H4nPhibWJawGzR6yc9zweGSVn08JJwvSMu4sn5rthpyU8ebY7fp1onfoaA7EROZqhv2MQRDrV+s+6Egb7QTtN8cEIzSOhaIn698/TaVPr9IRU5MSb1uBEwKSayqpBNbaNdJQxAWv0NjQbQlHko04cGU4PHGPhtdprC2covepD6e+EGv4GLKZNAuf0ktFXFyHPl5xWwFo5rhC6/lMxbhZ4A2p6gNzZ5/p0lHGZ3h6W7jYDlEfG1KQnASbuw4YLQ3xMVwKhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRl4CM98VnUwsjuPkji+ebpOYEO0wzKz8YEjuxmTn4c=;
 b=EsiIInyB9oXONVlk0aAnMvc1REWM07C6ZhavXvpdnmk982Hg9cRarBFJBGOvre87dpIlqzP8Fpjn0/BFeuA2/+Xylu8dD7/PCjkE++u7h1avRWInjqkNeBhMwUxVU4U3c2+GVKmIVmr+JnjuFaOE/F+H95mAMe6HP5xN4PaNHy8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR1201MB2476.namprd12.prod.outlook.com (2603:10b6:300:de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Mon, 29 Mar
 2021 17:33:45 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::4987:8b2f:78ca:deb8]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::4987:8b2f:78ca:deb8%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 17:33:45 +0000
Subject: Re: [PATCH] drm/amd/display: dual cursors are seen if scaling is
 enabled
To: Louis Li <Ching-shih.Li@amd.com>
References: <20210329075411.501760-1-Ching-shih.Li@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <bd4ec0cf-eb7b-4323-08f0-43f95ea75d64@amd.com>
Date: Mon, 29 Mar 2021 13:33:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210329075411.501760-1-Ching-shih.Li@amd.com>
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YT1PR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::45)
 To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YT1PR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Mon, 29 Mar 2021 17:33:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0a3c9a0e-ea72-4aa6-f9e9-08d8f2d8cd6c
X-MS-TrafficTypeDiagnostic: MWHPR1201MB2476:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB24763EDCCA16C9AF1AD158DC8C7E9@MWHPR1201MB2476.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /e7CwaaydWqXoJt7htMwaZPQyn2xK8x6HkF9idHzLpiX/ZXeYSU8pvsf9OEHNBOq3OjTmHnZbsEFcSBoaUMfMkVv5nz/YHQI2OAs4KjuSUk/iJUasrRpXgCU2mmQwZSipEyJB1CuQuFYqn3K97xYD66h7RjEcSv3IR4dffBA/Pd9c9Zs5RT+6oXg3f9EKvv/dX326RVCm7oHm4e7yThDx9RpdXcoG0LMDdC7uJp/yRruGt1ujxF/VY9DMLwMjMB7F/Ici2Mn+G+Rwvy+625/3qpS7FmSUw93L/JUXQ1Or3WcyP8nVAbYTOD9i7FndfffTP5sULkxN0aaL48JT1uRge0noxPasmYH1VynAgWYtI62MpGX24sCKRlXqI/S2ZORLc8nUjU0KXj3/POXMAicdZK57BTTyV8Rh07P/SRBuAD6BgTu9W6DIwbOHf6z4kme1v+jhb0JHlFyUC46fp8e78YLJLCJH4xhCY1rbAxJkgv5qJBfVMp6G8NnlnmGWX3De60T40incRJ/UNZwGyjirDpuGoMgXsQv9A3OLCoA/ABmhbU5RS6AdPRRD2cJ7qnDb1eH4LHpMzw8yTjRSxEsywjFLEwQrZktEUP+2TG1+qHhV7KBGyfu4bAbAL/C/Pc1xJV2WeOx/Qpdd0H0x2l6Lxjyc3QwnHNCKP/+La+qzIHE2zq6jibpC3/Hy8tOH0XmimZMkoH2YgopxpPesMmf7g31YA1OGUQWsla5wXAATNo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(66946007)(4326008)(83380400001)(66556008)(8936002)(2616005)(66476007)(36756003)(5660300002)(956004)(16526019)(86362001)(6486002)(6862004)(31686004)(38100700001)(186003)(316002)(54906003)(16576012)(37006003)(44832011)(2906002)(31696002)(53546011)(6666004)(478600001)(26005)(6636002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N002Nm8zUFN3TUJ6RkZqeG5KYmc4S05MYlE1enR3NGE0TnJnaVY2ZFZaQ01x?=
 =?utf-8?B?MHZGZjh0NW9IeUp1eXBJNkVMYVZkTEdDaldudlZHZW54TXB3ZW1QVTg1azBN?=
 =?utf-8?B?ajdIcmZTcXhzQ0tuNkhRTEp3RGEzdHFRVlBvcittYXVEbXduRTN5SzVWSHpR?=
 =?utf-8?B?N2JwU3NLa1dSZmNoV0prRm5laVV4c1JEaGUvSWtvS28yd3Q5VWZ5V20wT3VZ?=
 =?utf-8?B?OVBUK09RMGhpQ1lSYU9Ubkc0MTZUajRPZkU3Wi9kT2ZaT2c3OVBnVExPL0Vw?=
 =?utf-8?B?L1dYRGlkQVBHRExQZXdTdkY3bFFkdWFhMFdhTENmTlRDYVVxTGtnVExxUDVJ?=
 =?utf-8?B?cFpSR2xTTDJEQVJYSEhhRGcwbVZwKy9xaHBMa0dHQTZiSkFKbVhrWFJXTUZl?=
 =?utf-8?B?MWI3MElpL1hYRHVnNkhRZWpsUnJxT2dSenFURmNRRCtsNnRRRXAyWDlFaXBv?=
 =?utf-8?B?ZmNObmErK2gwaGxBSExENjBoQWhmVXk5Vm9NbUNhV29YeW1mci9qbFZFNERW?=
 =?utf-8?B?TjRJRkpXdEpNSWlRazdkRW5VbU9yRkY4amxDdU9UOTF1VVB5RnZKSXlNOGpa?=
 =?utf-8?B?elJDV3VySFRzTktOQXVlNStiTXVZSXBvU3o4eE1WMjRhQ2pBVi9mOTd4ZjRR?=
 =?utf-8?B?LzJMd1VCZEpkd3VBS3NtbzFqU2wxdGNUZHpyb05uUlB6eEJSL3lha1RYQUEv?=
 =?utf-8?B?YnNNNSt3VHlJTW1oNmJjRnkzOWdBZXRUd0VsZ0t6MW5CQldNeXh4c0tDeVcx?=
 =?utf-8?B?VGV0YXVDUlI3NGhwejV5cHZ4RFNLSWF5T1FQQU1ZVTNjdGdzaktCeHFuMUVr?=
 =?utf-8?B?cDF0RWFwZjFzN1hOQUNiSmhkNVhkTkxnaXFlcVFoMnRyTWVTeHpxQzhKV0wr?=
 =?utf-8?B?Z0trZ2ZqRy9tQUVrakx6TWdHWGVNTnd4QUs3bWNSM1J1UmFqdGpscDE4MVc0?=
 =?utf-8?B?UVkyb2Qxa0tuY2tKdUQrMHpvSEVqdWs3aTQ0QnJad096VUgrNTE2U1ZVTHJ6?=
 =?utf-8?B?THQ2bEhkdkU1N0c3blpiQXJqUW9kQ0FDYlJ5K2JSV0dzYnRuMzJ3cmdSUVZl?=
 =?utf-8?B?ZVl4SEtnVDRZOEpFQzBJOGZzR0RUTk80ak9BRDhwc3JsTG1iZG8vQkIxdkQz?=
 =?utf-8?B?UlNiZGF5Y2huMVo0VXdVSTd0ZFNkWm9aUUNrbDQvSmtKVHdpZTZvaGFSMHNV?=
 =?utf-8?B?WS9XNnJwbHhabENEcUtWdTNWSHFuRVg5Q1VURlRoTG9NQjhhVXpaMDlpTStY?=
 =?utf-8?B?Qi9kbTBVbUZGZmVkT04zSG1uMXl0cHllL0RYRlR3VHozaXVXUDhXM0VZTUVC?=
 =?utf-8?B?U0hmaWUvNld1SU43TTFTUGRhTjlTb0hLWU5nV2FwSEZ4MDNLWEllVk5TVUJv?=
 =?utf-8?B?eGhjLzBPN0VRQVNybXVzdlllZENUZ005enVML1I2L2VLZFBaZ01PMldwdXFB?=
 =?utf-8?B?ZGRzcHNMSzZtOEJBdm8xZTM0YjNKaXc2Nkl2YU9MTENhbVRZMWwrOEEvcTZY?=
 =?utf-8?B?R3JTN3lYaE5tQkNHSDlzRGxJRm9obGJZM1VEOGFOS3NoWERRdEJBVk9PclZL?=
 =?utf-8?B?WjBIK3dIMkJnSVhTOFM3ZEJ3cnRNVkxxempKVjVKdnhVYWI1eExqdWs0ak9O?=
 =?utf-8?B?OTRyNk51a0ZuWUhhYUlUYlhqK3VSODhLMnJsUVNTbmFiNytWTXlEek5QZFdp?=
 =?utf-8?B?TGcwM1FGeWJVTUNGQWRVb0xVOHN2RnUxc3FKVHBEalk4NUNvbXdsYldOYkNl?=
 =?utf-8?Q?pzegZkc+D3ytX5IBrF+IfF+79bBGfGsFaissvYR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3c9a0e-ea72-4aa6-f9e9-08d8f2d8cd6c
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 17:33:44.8663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfcHNo2x8Xy/3Rj9y91vep7abQf49E+b3wi70QPMIm5+oiMNvfzvalQH6sPsIyhBX5/N/P1usGDUaoWe/PdQ4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB2476
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ching-li@amd.com,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>,
 Ikshwaku Chauhan <ikshwaku.chauhan@amd.corp-partner.google.com>,
 hersen wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?St=c3=a9phane_Marchesin?= <marcheu@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-03-29 3:54 a.m., Louis Li wrote:
> [Why]
> This issue is found when scaling is not equal to one from src to dest.
> When issue happens, there are offsets in both axis x and y between
> two cursors. Users cannot control APP under such a condition.
> 

What's the use case? I don't think we support two cursors on a screen.

Does this pass IGT cursor tests?

Nick, I thought we don't allow cursor on anything but the top, unscaled 
pipe.

Harry

> [How]
> For dual cursors, cursor should be disabled if there is a visible pipe
> on top of the current pipe at the current cursor position.
> For offsets between two cursors, need translate cursor position from
> stream space to plane space with scaling into consideration.
> 
> Tested-by: Louis Li <Ching-shih.Li@amd.com>
> Signed-off-by: Louis Li <Ching-shih.Li@amd.com>
> Change-Id: Ic19e4f3b9225736f037f5ade10b68e8afe5f9ab7
> ---
>   .../amd/display/dc/dcn10/dcn10_hw_sequencer.c | 40 ++++++++++++++-----
>   1 file changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> index 83212ea40077..1ce5e58e3a9e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.c
> @@ -2999,6 +2999,10 @@ static bool dcn10_can_pipe_disable_cursor(struct pipe_ctx *pipe_ctx)
>   	const struct rect *r1 = &pipe_ctx->plane_res.scl_data.recout, *r2;
>   	int r1_r = r1->x + r1->width, r1_b = r1->y + r1->height, r2_r, r2_b;
>   
> +	struct dc_cursor_position pos_cpy = pipe_ctx->stream->cursor_position;
> +	int cp_x = pos_cpy.x;
> +	int cp_y = pos_cpy.y;
> +
>   	/**
>   	 * Disable the cursor if there's another pipe above this with a
>   	 * plane that contains this pipe's viewport to prevent double cursor
> @@ -3013,7 +3017,8 @@ static bool dcn10_can_pipe_disable_cursor(struct pipe_ctx *pipe_ctx)
>   		r2_r = r2->x + r2->width;
>   		r2_b = r2->y + r2->height;
>   
> -		if (r1->x >= r2->x && r1->y >= r2->y && r1_r <= r2_r && r1_b <= r2_b)
> +		if ((cp_x >= r1->x && cp_y >= r1->y && cp_x <= r1_r && cp_y <= r1_b)
> +		   && (cp_x >= r2->x && cp_y >= r2->y && cp_x <= r2_r && cp_y <= r2_b))
>   			return true;
>   	}
>   
> @@ -3034,15 +3039,30 @@ static void dcn10_set_cursor_position(struct pipe_ctx *pipe_ctx)
>   		.rotation = pipe_ctx->plane_state->rotation,
>   		.mirror = pipe_ctx->plane_state->horizontal_mirror
>   	};
> -	uint32_t x_plane = pipe_ctx->plane_state->dst_rect.x;
> -	uint32_t y_plane = pipe_ctx->plane_state->dst_rect.y;
> -	uint32_t x_offset = min(x_plane, pos_cpy.x);
> -	uint32_t y_offset = min(y_plane, pos_cpy.y);
> -
> -	pos_cpy.x -= x_offset;
> -	pos_cpy.y -= y_offset;
> -	pos_cpy.x_hotspot += (x_plane - x_offset);
> -	pos_cpy.y_hotspot += (y_plane - y_offset);
> +
> +	int x_plane = pipe_ctx->plane_state->dst_rect.x;
> +	int y_plane = pipe_ctx->plane_state->dst_rect.y;
> +	int x_pos = pos_cpy.x;
> +	int y_pos = pos_cpy.y;
> +
> +	// translate cursor from stream space to plane space
> +	x_pos = (x_pos - x_plane) * pipe_ctx->plane_state->src_rect.width /
> +			pipe_ctx->plane_state->dst_rect.width;
> +	y_pos = (y_pos - y_plane) * pipe_ctx->plane_state->src_rect.height /
> +			pipe_ctx->plane_state->dst_rect.height;
> +
> +	if (x_pos < 0) {
> +		pos_cpy.x_hotspot -= x_pos;
> +		x_pos = 0;
> +	}
> +
> +	if (y_pos < 0) {
> +		pos_cpy.y_hotspot -= y_pos;
> +		y_pos = 0;
> +	}
> +
> +	pos_cpy.x = (uint32_t)x_pos;
> +	pos_cpy.y = (uint32_t)y_pos;
>   
>   	if (pipe_ctx->plane_state->address.type
>   			== PLN_ADDR_TYPE_VIDEO_PROGRESSIVE)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
