Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF9D6BD232
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 15:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A0A10E23F;
	Thu, 16 Mar 2023 14:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C84810E23F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 14:18:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXufD/zKYZrt0W88l3gQj701AihCCxeaoDn2GTzDFvGbXbDrPCg97FE/gxoYHAqaZUwrqpvB8OhFMcn7KmiGoGI7oxKJ54fdDEuVcr0C7+yYKSRJIVE9DIsV9pO7yAxad9YQMPF8uwQCfYe8h8MHHd3BPwy1BW7SQ48LW/u8WjBqJaWYmsAx0M7122EaZD+s8sop/iOQYVdlp7kcpfYSPBHmSlemIVgK992Mkxc5ppI8mrE/Nft4Tapv+hcy1XStlx8W0W/5W+cEkrXMODbccL7bCBbj2tB93tRu+tYDcdl/GUnUaz17kJliWRUu5QL4y7a186unNQ9P6Su86SvHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nwy2GE8rnAJJrpxFQHChrGnNHpu6kgToc4sJn6i7thI=;
 b=npYF+6vXHUenpwk3hGhTsojVDuuczL+GeVM1NvhsPLR5Wa+ZE7yLxPlHF/2b5XhPmuRCxizOzJaGfBU8U6l6DSggSDAVAzI1/LDXZHvicjT7ZVUV2juvItc7vmVw4S6FtO9ec4NN8Fq68/6IY5xUhHrOytXSewjwhs1+pOZsm4y/S3I2hxFkgoltSWj3kfjA88PpEeKPdkfxNL32BuZMq3BC7U+WptMIqM9mZsQ/dhFOoP23W0qvFoZvr1jwJ/RR5XTQ5DDpmgQt/Lr84YYIyPCvyHz7jRSlJg+3gYSDYfWhDX4xRdNfkKGdWaBvTPWS7Pd829bFKzgtPXSumenFrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nwy2GE8rnAJJrpxFQHChrGnNHpu6kgToc4sJn6i7thI=;
 b=yKGhVAKwYbVKHRSPTdOzbRCsVPHGkj7rxzld+/2iSVR0D3XUYjrTDYbEkA/dzopYqpAntqN2zvr1i+77HtS4HYRnBh/u53GdxUeb8+ape/cX2mbMfy66MbmQP9zWYKKtWuSmg/RWCdycIxEYxyLLTbzVZqH+BPsU/4r8j7ITqBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by PAWPR08MB8935.eurprd08.prod.outlook.com (2603:10a6:102:33f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 14:18:26 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1%5]) with mapi id 15.20.6178.031; Thu, 16 Mar 2023
 14:18:26 +0000
Message-ID: <b49b6b01-a496-263c-470d-1edb04dff251@wolfvision.net>
Date: Thu, 16 Mar 2023 15:18:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/rockchip: vop2: fix uninitialized variable
 possible_crtcs
Content-Language: en-US
To: Heiko Stuebner <heiko@sntech.de>, hjc@rock-chips.com, airlied@gmail.com,
 daniel@ffwll.ch, nathan@kernel.org, ndesaulniers@google.com,
 s.hauer@pengutronix.de, Tom Rix <trix@redhat.com>
References: <20230316132302.531724-1-trix@redhat.com> <8664878.T7Z3S40VBb@phil>
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <8664878.T7Z3S40VBb@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR08CA0029.eurprd08.prod.outlook.com
 (2603:10a6:803:104::42) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|PAWPR08MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d942ffe-e022-4a17-e358-08db26294ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ufo2YBfLxhsRAjq9bpqJn+wcTH2ajRltem8MQa7mU4U6tBUQPi90/CrFFt/lbeMH7kcBbO73nYmKTeek/SoEvLkB+3+T7btxKAsBiBvB9xkUKQ16xkYEVXR9G07VlmQRg0eOepkBVoXIENmAi+owns30mq6sn6pbA7riobQhMb7NnhZ2pO4iMBLaCC6FPYyvqYzLxDjJi7Y4Fagaoy7NjAKCuv52g+NtPZv45QsVFUlnEParaYqa6MKnk4ES5zDmYWlinsubGZTVVkZuxIEbgYCdDyzop2DIJX8rp7SjX5XTB8QKtFW6F5lV81WuK06d8YnPgpc3/8yuHjQ0EQ+7546LxEa2+UtXQq9SeG3iDwwFg8lyyuV39NR5FHNLzRkKfHtZxIfhoVr3FjODgalhC2+5eqledbbx3LeqtzBg5M9uE7Dae+gBe6J4MeplR5j5WPWYzUgavHOZf5a5TRCLrRvNA7cBz0wTFf+YOU79mKyywtwf2jUBkeJtzpfFmzAKeTR4JVVDmfVsTsQxy7EfqCl2Kb6itDM/SdJ3E3BvWz6u6MCwTWzrmL95+8CI6yihU/oUxEpucdI4y5ZlE924xfGDHjugu5Dne3TlePQgl8oVisJ2yFBF8Oi8cV+rhrzivgQb4gVh2mviBYjsN+oiHGPAJxTKzyKvJmjsShWPBbuRylj2JGLOWVg8c4XULa73SXZ2vIWelNwv6zuJ30iDF4f+0nfE/0CjEV3cit403Uw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39850400004)(346002)(376002)(396003)(366004)(451199018)(2906002)(31686004)(83380400001)(316002)(7416002)(44832011)(36756003)(5660300002)(66476007)(66556008)(8936002)(66946007)(31696002)(8676002)(4326008)(38100700002)(86362001)(110136005)(478600001)(36916002)(41300700001)(2616005)(186003)(6666004)(6512007)(6486002)(53546011)(966005)(26005)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFBZaWdmS09oV29xTE5xNmhudkJtS0h6VXdPejZ5cndtWE5BYTFlT3l6Zm9o?=
 =?utf-8?B?akdkcTdJOXR4YnBKUHcreTJNVzNDODZ1M0I0M0tHOThtcGd3aE1yVjFNYmE3?=
 =?utf-8?B?bmZYbVVFVW14M0Q0QW94eEpmZkJnZExPa2dHa2dwL0l6L2l5VmxDNjFvMWlK?=
 =?utf-8?B?enFvSDFBeGZnK0FmdVFOTVFQM2xZZC81UUhKYkZtbjFpTWh1U0xUckErLzd6?=
 =?utf-8?B?VE1xQ1dJU3JqNzFHUWFLdTBITGRPbU1UVTFZM0RocEhOa3FEaTFsc3pXUXVk?=
 =?utf-8?B?Wm92ZmxpRFpoSDBsSWJBamdnTjZHZTZxUE1XTUhQUDIyb3VMSi9HSjRuN3R0?=
 =?utf-8?B?QmJhMmd0enRwOW9ETXdvN1pFWG1FN0U4Y2gwcVZobm5rdEkwb1FCWmpIQWZG?=
 =?utf-8?B?WERtUEtLaStyTXliWFZPTTJXOUlVSTNYWTZYQXV5d0tubzJXUExGakNkcFRk?=
 =?utf-8?B?V1MrY0g3WUowekFRMFR6c3pOV0FLc0piczM5QjlYZzZDeWZES084YWZmTW13?=
 =?utf-8?B?QkxJSGpwdTl0M3pEdUZJUWhpSEtPdWFDV3AxOEFqZGRMRnNrOFFYZWdRNnox?=
 =?utf-8?B?WDA4RU1ZekYrMlpCRmNvN0FHT1craythdHVQWUFSQ05DYVFOVTRxR1NJNThF?=
 =?utf-8?B?ZUZ4ZnV6ZWw2RUorczk2RGFrbCtKVWQxeGIraTMwRG9nVDJ4eDdBVWpuKzln?=
 =?utf-8?B?QktLa1ZVbVhlTWlRQWZkVTM2aDRUTFAxTk9sYUxvb0YydW1lVCthLzNQMlpU?=
 =?utf-8?B?eXM4ejF3UkN1d3BhUmdCb2d6VGNzblBNV1VudlovL0FrT0ZYNkRiRklFb2g2?=
 =?utf-8?B?MUxtSU9CdVRUNy9rclM4aHNuQlRuM2s3WTh2Ui9pK1EyVGtHdXhBQlk3eXN5?=
 =?utf-8?B?MTRqVlJwSGJzKzVpbWlvNVN6Mlg1R3ZUMmxJdnRQcTFBaWcwdVJDSEg2cHVX?=
 =?utf-8?B?UE1zOUtlcVlPRU1LOWlydWZsMHZnNG82ZmNNS21GRGh6c1orNlowY2JUTklN?=
 =?utf-8?B?SWZXYm5JTHBTT2F0VDFjTDFFM0pOdFVZTTFXd2huNkJYcjVCN2M3V2xVWjFP?=
 =?utf-8?B?a1ZQY25QOUlDbCtya0tOSnhSTDJUQkF1cXdGcVhsczdnUW9SbWZCYko4ZnRN?=
 =?utf-8?B?b1dJR1JIMkIwc3NTdXd6SHRlc09XNGQ4dU9aUkJMeW40eHM5L3YzNmppM0lL?=
 =?utf-8?B?REsxQ2ZqR0p6MXNXUHR3WksxQjNPME1MS1VZd3lkZ0N0K3VpaTZwQmg1djkz?=
 =?utf-8?B?MG15RDY1bVNFNitrTVlEa2dlNmpMQ2I2R1VzSTdWaU5kYU0yOGhQTGt2RlBp?=
 =?utf-8?B?dzdRbEpLRzlINkluSGxBZXlVaWtocnRVNDd2d01pRStLdzlyR0xQR0V2RkpU?=
 =?utf-8?B?YkFVdmZ2cmt0aW5KRFI1bSs3eVpnOUlIR2REQTF2YWs4TmRNVXhKOGlkSXox?=
 =?utf-8?B?dkpRSFpvWWNnQSt6bU0yK1RTTDNTcXdwL0lZRDZYTGhmVmFPY3FGOVRaSnVX?=
 =?utf-8?B?VVo2YjNGNDBoTGEvOTN0UFFaNnVtejMybjY1SmM0QStHNjg3MmI0RGJWWXZY?=
 =?utf-8?B?OEM2b012bFVxMHdOVlNjdEYvUjVESWRxMUliTWFpUUZGUjZhb1Y2bEhkV3lm?=
 =?utf-8?B?bkhhbnh3N0lhSlNYK3VlOEZ0b0NCd2NXMVJmNkI0NngyZDY1NW4yME9UVHV1?=
 =?utf-8?B?bVcyN0ZVR2drVkVxRmJ0d0NtU3pvNXJGT0Zoa2w2Vy9tS21Ya2Vab3kyTnlH?=
 =?utf-8?B?S05FZGVKWk53NVZza0ZKaHcwNTd0WUtSTS9QVVRSSEFHS2c4aVF4WFo5VGlI?=
 =?utf-8?B?WlNmaXRRdzJyUVp6bk9CUjVuQzdiS1JBeGlqZElzdEFSUVRuNEliSVZnMzRi?=
 =?utf-8?B?REg0eDBGM0ErLzQxSlk3RE16cElCN1Znbmdkc0h5eUJ4RmY5TDhWZ3ZqWHBa?=
 =?utf-8?B?ZVNDd0hGQnVZRTljNDJHc1RoK0tnMVEwQ1lwT0JSMDlBbEE0YzNSUVZMVFR3?=
 =?utf-8?B?NUtUUHRSNkVESlBhbGYwUGRBRzVOditTaUhZRXRHQW0rRnprNFBMd25vOWZj?=
 =?utf-8?B?WFJUOVVJaHYzTGNHaEo1a1RjZHJoTEcxeERXV1dQRnVBVHZzUW01WDl1RlVF?=
 =?utf-8?B?YUVjSHk2UktRcTVwdlhpVkZacVd0VXdOQmtxSFdpS1UxUmZjVGw2S3cxNlJ6?=
 =?utf-8?Q?OC8/b0Yfumhu0KHLp2TNcKk=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d942ffe-e022-4a17-e358-08db26294ebb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 14:18:26.0289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSnDrq8Fw1SKNyqMtA2dxtiuyfwxlfmRxfHWvdisSnD8FBB4rhguP1tS8KfZddLVgI9ziyUSfKsDS4TCoc7t2wZ+BAoMIrKmyMeyN+OnrtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8935
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
Cc: linux-rockchip@lists.infradead.org, llvm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tom, Heiko,

On 3/16/23 15:05, Heiko Stuebner wrote:
> Am Donnerstag, 16. März 2023, 14:23:02 CET schrieb Tom Rix:
>> clang reportes this error
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:8: error:
>>   variable 'possible_crtcs' is used uninitialized whenever 'if'
>>   condition is false [-Werror,-Wsometimes-uninitialized]
>>                         if (vp) {
>>                             ^~
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2336:36: note:
>>   uninitialized use occurs here
>>                 ret = vop2_plane_init(vop2, win, possible_crtcs);
>>                                                  ^~~~~~~~~~~~~~
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2322:4:
>>   note: remove the 'if' if its condition is always true
>>                         if (vp) {
>>                         ^~~~~~~~
>>
>> The else-statement changes the win->type to OVERLAY without setting the
>> possible_crtcs variable.  Rework the block, initialize possible_crtcs to
>> 0 to remove the else-statement.  Split the else-if-statement out to its
>> own if-statement so the OVERLAY check will catch when the win-type has
>> been changed.
>>
>> Fixes: 368419a2d429 ("drm/rockchip: vop2: initialize possible_crtcs properly")
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 03ca32cd2050..fce992c3506f 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -2301,7 +2301,7 @@ static int vop2_create_crtcs(struct vop2 *vop2)
>>  	nvp = 0;
>>  	for (i = 0; i < vop2->registered_num_wins; i++) {
>>  		struct vop2_win *win = &vop2->win[i];
>> -		u32 possible_crtcs;
>> +		u32 possible_crtcs = 0;
>>  
>>  		if (vop2->data->soc_id == 3566) {
>>  			/*
>> @@ -2327,12 +2327,11 @@ static int vop2_create_crtcs(struct vop2 *vop2)
>>  				/* change the unused primary window to overlay window */
>>  				win->type = DRM_PLANE_TYPE_OVERLAY;
>>  			}
>> -		} else if (win->type == DRM_PLANE_TYPE_OVERLAY) {
>> -			possible_crtcs = (1 << nvps) - 1;
>> -		} else {
>> -			possible_crtcs = 0;
>>  		}
>>  
>> +		if (win->type == DRM_PLANE_TYPE_OVERLAY)
>> +			possible_crtcs = (1 << nvps) - 1;
>> +
> 
> After a long hard stare at the code in question, I think doing it this
> way looks like the correct one, as as you mention in the commit message
> the first "if" will change the win->type to OVERLAY in one case, but this
> then will never be added.
> 
> Michael, do you agree/disagree?

Shoot, this bit of code is more complicated than I believed it would be.
Yes, Tom's patch makes sense to me. But having overlooked the win->type
change in the if-clause makes me think I shouldn't be the judge of that
:-) Still,

Acked-by: Michael Riesch <michael.riesch@wolfvision.net>

Thanks for fixing it and best regards,
Michael

> 
> 
> Thanks
> Heiko
> 
> https://lore.kernel.org/r/20230315090158.2442771-1-michael.riesch@wolfvision.net
> 
>>  		ret = vop2_plane_init(vop2, win, possible_crtcs);
>>  		if (ret) {
>>  			drm_err(vop2->drm, "failed to init plane %s: %d\n",
>>
> 
> 
> 
> 
