Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10132B8488F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 14:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC1B10E125;
	Thu, 18 Sep 2025 12:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WTbbT0Jo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010070.outbound.protection.outlook.com
 [40.93.198.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C0410E11E
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 12:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4SpE95b/wrY9I/FUSVmK+wlZVFKIlqoYGPdYP32uYigOrBFcHW2e7E3J0epm7XZllq/TUYeYDQuA08lJCn9bQB6bdhmalP1O9wzJr0HkOEy1lx1bMiy3Hg07lbNBQNkO2y7kSgIIP56/crNeCJy5JlBsKYyM9yrMIdWqkqbZ3NsEdoRrMI0muNF2OjydOfVGFSZxKqS/Elmi7W2ww4fq0F+jc3HXYjgIFaRGrEu/9n2odckE72VW2JTR7Lo5chy610BEuX5tBpBb7AjQ8tN7oZi81lyGZ5Rk/vuO7uD5AZrsKwyhKGswHNZjEd01aXi0E5TefOdMyhuZpjpltnTVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbDELzVLcwCifVP3dBN8D543WRaGOUC7izyW7yDtNP4=;
 b=jn4tpU3cwIjCrF6FNAqGocqnsXGLnP13/TgnNx/Pm8haEDnPhbE8uij+n4qXPqMEk1syqR3aonmIO/qHGvHZe6jTGplFcCCPA6yYYVdNstk35ENr8AMdeF61Vp4st2qHDuKRhUd8LZvYup3J4R7zhUHdsB485HiqVChWVWCHY4FcvnCfL4ZhOhha11F0ANcwr3NE7OOqb67xsevOeTgVCse07NRbKJGVzUmZ54yf0oy3jIIR+HFGRSiH1232UV/uAhU6IW6C/whDt5g+K2y3dmQNZnwuCSxJY4qCw7uOqDNLwdOuDa3fuF/i4ZmUMGdq73dbb5cJTI0JxXbM+YsH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=suse.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbDELzVLcwCifVP3dBN8D543WRaGOUC7izyW7yDtNP4=;
 b=WTbbT0Jo3pRz7O8yvogP0gLs2epPYVBxc1dpXtlXoGFqOsGJbSBpvm2dj8tvrjAPdNcj+zKIlLKm3M3aVAe0EnXC9xa3Dbz3NzCm/ZeEIYV3jqF+Qg6YuJpypmrJfET/g2+R2fE+Z4bmaQBbBZMedEuEVtpdT9NzUOpB7wNbiPGlASByQc3OXglojBoYy7dgmt5qLPuOOnf4MmNmdu6zZL7onY5ijDi1Juf2XWA5kEbNXemUL+iGoU7X/UusFQF0sqegDFKFKTQ6bsHVMFwy4qjXbzeoNshKX4+TRUb88rq4hPm+541QEmen5VKuvMMKmptpbrieaRjXpAuKtCFbOw==
Received: from MW4PR03CA0026.namprd03.prod.outlook.com (2603:10b6:303:8f::31)
 by LV3PR12MB9168.namprd12.prod.outlook.com (2603:10b6:408:19a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 12:17:02 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:303:8f:cafe::20) by MW4PR03CA0026.outlook.office365.com
 (2603:10b6:303:8f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Thu,
 18 Sep 2025 12:17:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 12:17:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 05:16:43 -0700
Received: from [10.221.136.181] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 18 Sep
 2025 05:16:41 -0700
Message-ID: <5c4da62d-f829-47b5-97ae-51a08e0e470e@nvidia.com>
Date: Thu, 18 Sep 2025 14:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/ast: Use msleep instead of mdelay for edid read
To: Thomas Zimmermann <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>
CC: <jfalempe@redhat.com>, <mripard@kernel.org>, Carol Soto <csoto@nvidia.com>
References: <20250917194346.2905522-1-nirmoyd@nvidia.com>
 <6eef0446-5747-4717-8146-788b32bf7969@suse.de>
Content-Language: en-US
From: Nirmoy Das <nirmoyd@nvidia.com>
In-Reply-To: <6eef0446-5747-4717-8146-788b32bf7969@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|LV3PR12MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: e30af6b7-89a8-4d3c-6e37-08ddf6ad45c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3dNbkxqdzBac0xoUFY3aTdqYSt4V0tMdnFIOElOdGw0OEZxUkxzcndjUndo?=
 =?utf-8?B?bExDa2VWZ3ZubklYUHBQcFhXTHdRY1JnaDFBV0ljR3h5aWNuY1dHbVNiS2tX?=
 =?utf-8?B?NWxsbFEyZW02R3lZVWVxS1VkaHpVNE11ZktGQkxIYmpaRDFCRGZjcm9jRjJx?=
 =?utf-8?B?YTdwRVI4QXgwdDZUMkptOWVwNElzYkNDVjVuMElhaTBOTWFPaUNNUlIyVS91?=
 =?utf-8?B?QzR4MzdwcGhoL1I0M2NCUG14WGJ6b3lFeEZ3ZWhNbzZZeVJWenJJSFh4RFdp?=
 =?utf-8?B?TkhVMjlqang1MVc1RmZKTVoyMVdCdmNCMnk0NGtncURLYjFWVTJaVXFIbXVH?=
 =?utf-8?B?S0VaSFQ5Vm1nY29YeHBJOVhxS0NyaEN4VGlSNTVGNyt5cmpHTE9GOWk0M3Rv?=
 =?utf-8?B?RUlrU3N1RU55ZGZzVUtMN3JvZ0RsWWk4aXNyRkxNL244Nk1JVXR2LzJrdFo4?=
 =?utf-8?B?QzA0WXIxRktTSUQ5KzJKTm9paFZFc3ZYLzBCMmdqZXM3L0E4L0tUQjNYZXFk?=
 =?utf-8?B?bzl4RGRTYzFoS2svYlpGa2ovWGlHTzNzcm50NnJPQk9WRk1jOXNLTTAxKzdO?=
 =?utf-8?B?OXFSTmZPN2QvYlZMdzVJcEd0QkJZS050UCtqeEhhaW5KYkM0dHhBQUxCNmF5?=
 =?utf-8?B?M2ttU04rL05UZElSb2hDbjBrdjYvM1gvSDRrTWFHOS9tSldjRnZ6dGpwM0Y2?=
 =?utf-8?B?OXcxRTlNcWV0SjJqeW9LWWpJU0xYdWFwZEtoeVU4TjNuUnp6WWRteDMrQjJY?=
 =?utf-8?B?SUNFZERySDdSRnJJczAvSEErNFVBMUVxU2NzS1B0R0ZOR3BmaFB2N3JseHQv?=
 =?utf-8?B?aHFkWUM2UENFeHZQNksxK21Od2orWjRBbFByeEhHTlkxNTV1UGxDWG13Sm41?=
 =?utf-8?B?ZHdWYkRpcDdJN1puaTZyVmhEOGYzNHlmWlpTNXBWMExxTTBMcERvOHo3Mzlu?=
 =?utf-8?B?dmNZVDRIdThic0JSMkNQckx4aHZrZDZHOE9SWUR2NkQxTmNNMG1GS0dJZlJj?=
 =?utf-8?B?WTRvaWo2NVpHZHV0RmxrTGZBN3hsS1RyUnVhTjBTL2U4UWdLcDBDOHdlRDBa?=
 =?utf-8?B?N3dZK20wcSszaEdlSUxOLzExS2haTFhNbk5lcTlOaTB3dkF0TnMvSGpWdHdV?=
 =?utf-8?B?U2o4QWhLUm51QTB3anExV0hITVo5YjhZTWZST1Bac1hOeHI2cUhTQnBxYVRy?=
 =?utf-8?B?dlovMFh1R3NTV3dpMm41dVgzNEFNWElkZkZVV1cyOGFYSXBZNlVubHlYcUVL?=
 =?utf-8?B?dGxWajJ0MGw0SGh4SjIvcEVYMzMxOWM5R1NCZ2VXa0tLNkcyaEN6a0J2RjRq?=
 =?utf-8?B?czJtb2hBbjNPbDlwejB1SUx5KzZTZ2t4OXRqbzduNzRlWXpRYUxhemNWeFM0?=
 =?utf-8?B?UUhGM2l3a0NOaDY1SzJLY1lmTTYrZ0ZBVVQwalMzeVdBTTliWi9qSGJvL3Yw?=
 =?utf-8?B?UmNNeG9OSHQ0TlhBblMrb09sRENiMzVVb2xybEszSmFEcnl1RDUyYU9wV1Rs?=
 =?utf-8?B?aEIySmZuZU0yNTdCVzM5WlQrVnNndDZOVTJPc3EzOW9UdEZtd0pWS0VFdVdK?=
 =?utf-8?B?ang2QUk1bDRmRnRhOUVkSHlkWG9XbjJyVGFPRjRlY2NJdzU4Vm1uakRvQjFm?=
 =?utf-8?B?TlIxeHNHTmZnZXgycmpBWVk1TDZRcm9oSm0zbFd4MTlRdGxtUXhSdDhLbFha?=
 =?utf-8?B?bUZaVnhYMVNYRW5aSUdsVHNXVHZVWHNxTFo1YVlhTGlQUHIyWmFINTBpa05s?=
 =?utf-8?B?ZFdhaFNscFJUYVpaenJ1WCszcHRIS0xhRk4wYVQyUU5qSFNUR0F5MGRIakdN?=
 =?utf-8?B?RDV3cUhsNDRmOVVIKzRvK2c0QzF3UkFXc29PVU5GTmNFQkdiaHAxSk9xcTFn?=
 =?utf-8?B?cCtPSm5CVkpLMjRlYTFVVjFPRlRpYTNlMy9MYWFFT0xGK3lIa2ZYRzhTZ04v?=
 =?utf-8?B?bnFWZUpib1Y3TlJRb3QwN1dHZlIvNlpXOFhWbjhqaFFYTkxFRjNnY0I4UGd4?=
 =?utf-8?B?c25IOXVnNzY4WVVtNGlDOEdhaGJoeWxzTjRjWGh0eHVMdjhlSk5aVnZIYmF0?=
 =?utf-8?Q?3aUaGX?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 12:17:01.5301 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e30af6b7-89a8-4d3c-6e37-08ddf6ad45c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9168
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 18.09.25 12:32, Thomas Zimmermann wrote:
> Hi
>
> Am 17.09.25 um 21:43 schrieb Nirmoy Das:
>> The busy-waiting in `mdelay()` can cause CPU stalls and kernel timeouts
>> during boot.
>>
>> Signed-off-by: Nirmoy Das <nirmoyd@nvidia.com>
>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>
>>
>> Sending this as RFC as I am familiar with the code and not sure
>> if this transition is safe.
>
> It's only waiting for hardware, so most likely safe. I'll give it a 
> try before merging the patch. Thanks for this fix.
>

Perfect. Thanks for also trying it out. We tried it on older kernel and 
it helped.


> There are other calls to mdelay in the driver. Should they be replaced 
> as well?


Haven't observed any issue with those calls which occurs at shorter 
intervals and may be that is why they didn't cause a blockage.


Regards,

Nirmoy

>
> Best regards
> Thomas
>
>> ---
>>   drivers/gpu/drm/ast/ast_dp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
>> index 19c04687b0fe1..8e650a02c5287 100644
>> --- a/drivers/gpu/drm/ast/ast_dp.c
>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>> @@ -134,7 +134,7 @@ static int ast_astdp_read_edid_block(void *data, 
>> u8 *buf, unsigned int block, si
>>                * 3. The Delays are often longer a lot when system 
>> resume from S3/S4.
>>                */
>>               if (j)
>> -                mdelay(j + 1);
>> +                msleep(j + 1);
>>
>>               /* Wait for EDID offset to show up in mirror register */
>>               vgacrd7 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd7);
>> -- 
>> 2.43.0
>>
>
