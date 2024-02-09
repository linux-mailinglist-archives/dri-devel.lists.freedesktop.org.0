Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5069784FBF4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 19:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACEFA10F9BA;
	Fri,  9 Feb 2024 18:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rlvZbr+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C495B10F9B8;
 Fri,  9 Feb 2024 18:37:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bNZFkiSKn2/tufUBNP004WD8FudFzfQODEGHNsLJ7IJOQkXM3XoeqrJ88eT7qCakhfmqI4DEfoHgSM//nsbXNekBWlj7xWfI9hyRbATOoZ3Avb7yu6bbh21QN9QU+PjwP0sjqcms/90uiYRFYf5P5BaHK0OWOgwYYTvdbfRuSh/FF1Lssf/Wue8IYyM2kNyZoanYZ7u338ZiHjcqdRakxIip536PPGxHtLk8arz2GL7p3A5pYbn5SXubXJFYEerc7ZEskjMzhwGndF/9G3beme3+8OtkIqmPqaCA3puDKrDsBTd9jurKArztZ6pFKdwd770d8vWySlHOI0BQDTPQ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrmC1NlF6rUwWYleXacHZvXEI3WjRmBfokKCdAEDwsQ=;
 b=oQrfM1cJJF0JtYhnLMbB5n98qUFbeUior6Kl/3KcWgyJkL10YMG1nKeIvg6mKBXSiJHFYVuiCgiU+/eIVC47VYlOCjdaVszj3azFKoHLCkqsMwgkpIzkebA6AJ6TKB+TdvGXT8PzY90R/2X+r0WxmZgrKucE0Ls3e1rjcHSkBeQaNsRZcxYsTyuqFOPPCUcHXG7i0Zenslz9q2pMe14vftjq2OXJoBrK/ZngEBoHKy/XD+YLZz/x/JFAWwTog+VVmjKkSxYKuHTvqTI7biuOvMwWo+B32OLBpJybjfgAeCyBOZCotNUHOREH9ZwZRYKkJxc7+gAf6DfrYFOITeLdvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrmC1NlF6rUwWYleXacHZvXEI3WjRmBfokKCdAEDwsQ=;
 b=rlvZbr+9Lk0jxrA658NM5UqshMnu6dQNbyvbLZNZDlGhSrGMQExnGAvKxqjDc4YsRChdarK3vbDOm9n82hz2+raddF5HrNURZYwfkKvcQ1QUifmS+LYxi7YiViPWwZB/5IwEHoz69bt2NcMWM/VwhHnD8rTYf25fxWdMBQChPiM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by CH3PR12MB8902.namprd12.prod.outlook.com (2603:10b6:610:17d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.16; Fri, 9 Feb
 2024 18:37:06 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::795e:efcc:ad1b:aafe%4]) with mapi id 15.20.7270.016; Fri, 9 Feb 2024
 18:37:06 +0000
Message-ID: <543e5800-8ac8-215f-2377-7a0e75a98cac@amd.com>
Date: Sat, 10 Feb 2024 00:06:58 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/buddy: Fix alloc_range() error handling code
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 alexander.deucher@amd.com, matthew.auld@intel.com,
 mario.limonciello@amd.com, stable@vger.kernel.org
References: <20240209152624.1970-1-Arunpravin.PaneerSelvam@amd.com>
 <ZcZpH3hwBjv7s8WK@phenom.ffwll.local>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <ZcZpH3hwBjv7s8WK@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::17) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|CH3PR12MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: f2f5b4e2-e31d-4540-ac4f-08dc299e1dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wsFeEeFj2use9iElWNKp/RLoSdaRGD6s53gE0dxoGcJ36vX2VgqTUFRWsIRDGrIxcZswN9SK2quBicHJFThX836HK6br8pni4yyuGytLX+s1fTTfd5dghBToKqVocxGOcvTYBsJ4q4yAoPafMk/LY8Wg3LBW8lqziNnNzch6gDPSP79bzYaCV842DZaX4A/ZpjdMDrebPafyr3EFAzRQeMgEDlsFZ+Gl+GuA7ND3Glu07TlcgOt+0HwoDXbDyspf/yhkrGDTcuNJXz3o5eMFVvjtBEzrIJ88jRx+Xr/1voBczxSn/p+Ym871t6RiHkK5NQSCnJywbhkr5dqtHzogkvauSt20t0ewXcx3g9yTMDgf8kmYb352PnyPmpZ0tyvPpVUOn+jzitPTAdT1VmJ5XZE0OYrzgbk02eVM4buzWpjjFaT2l99TH7kxT7/uazPNSrZj9FDO6adPfO2fDCmZZ+0pYdja/wkX2KxaTGCTV79v14Dnz9pPKhAOxr6W5plSCnV12YhK8DgQ0DAIsDYo3ikTtm1FAmGRzEmsBzHleb1hvxK/fWOlN8eeZm+J3HyGqiOd/ohrQQMo5HlCb9n5HA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(346002)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(36756003)(2906002)(5660300002)(41300700001)(6486002)(86362001)(26005)(966005)(83380400001)(2616005)(53546011)(31696002)(6506007)(478600001)(6512007)(38100700002)(6666004)(31686004)(8936002)(66946007)(6916009)(66556008)(66476007)(4326008)(316002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTBMeWxwLzBBc1g0VUd6SXVGOWVnUjlSam1FOXNjR3FrOFhobXJWN2VkTEY5?=
 =?utf-8?B?Z2UrNTRlYWs5OTN4b3h3RzA5V2lmZmsxdmNQcjFaWnorYitYMGZTMHgyMlJy?=
 =?utf-8?B?dmZ5dGZ5S0NNUUV6d0FHMDJQMUh4SHRTOURpT0NxOHJIMnlzdzUzdlNZWXl1?=
 =?utf-8?B?ZnpYQ2ZHUCt2eU5tbksyT0FZRXI0Y2R2SzJsb0I2bjdOZ0Z5YWVnczkzVzh6?=
 =?utf-8?B?bDZiUG9yZXk4ZnJ1VGp4ZU1OcGlacW5GR014d1kwNTZ3aXNsR2xnWHA3eitk?=
 =?utf-8?B?MkhMTVk1WTFwdGZmaGpIS0grcWgwM2o1NU52Nkdaa0RqeXlFN2p3dHFhcEdz?=
 =?utf-8?B?TTZ1c0ZtdC9xY2FZUzFJYWxrRHpsUlphUjNlR3M5U1I5em9Fd1A3YjdLMkly?=
 =?utf-8?B?RDloV3c4K1Jjb3dOWnp2ZjJ3Z3JBaHU2SEhqNW0xdHp3dDNsSVNBT3pocDQy?=
 =?utf-8?B?U29yMWRrOTdvUStrVFZoek1KQnFEMjdsMGlYL0dxZ1Q1RGlIdXY1NGZPV3ha?=
 =?utf-8?B?MzgwbmhpS0U3a1lNTkxOU255MFJ5U01OR3FlOGcvaFVRdmRFMkFZVEVIcU4w?=
 =?utf-8?B?aVNCQXZKV2I2TDdUVTJsZVF3cXlhRDE2alpZakM3UjdSVEp0Sm9XKzh3aDJS?=
 =?utf-8?B?QWptL1Voc095c0JOOThPQ0hCdzhzaThJOTc0RTlvZGpXUHlFdU1YQ0M2Q0E4?=
 =?utf-8?B?MXZBZnhGT1ovZVl2UE5CL1hIYUxGdmdzUW5jN0NzOEZtY3oxTmNHVWo0MzVa?=
 =?utf-8?B?djBkaWRvNHRqVXdERHhreW9xU05MVjdQZm1vQVJ3SXRYdzZvV3pnWUZ3emxa?=
 =?utf-8?B?cG40NVMzV3VLeFMyWHdQbEIwRGZtVWhNUVVkVGpNdVZ0V2lTbSs5akRsWG1Y?=
 =?utf-8?B?K0xrNUx5bEJBWWR0SDRjOXBXZnpXZ0wwb2dlK28yS09oMUFtWW9aanZndHAr?=
 =?utf-8?B?amI1N1kwWnV0OHZXY3BpRW1DWnFiSmc1ZFpaRTZuWjByQnRaeVhsZXd4eVJW?=
 =?utf-8?B?NGJkNlkwbnZRU2xpZ1BtME15TUtKb09KZDVZWC9ZeDl1b2YyeElHSWoxdEJ0?=
 =?utf-8?B?Wk96MWtKdDVQN1lOSVR0Y1V6dENkb2owMDB0NEtmbnZyV3U3U0ZhbDBDMFBr?=
 =?utf-8?B?ZGhTWnRkcUlHdkNSbVdyWGVxeGRESEZiUW4rNXhsR0Eza3pWZ3FORktRM3hW?=
 =?utf-8?B?QVFnK1A4T1JjVU5xd3k5MTdnZE1DOXdWNmoycVpyU1VaRU9TV1M3YXJ4TlJa?=
 =?utf-8?B?M09DZzBsUm1CNWtFUTZ6Vk9mNlV0SGc3UXVFczVyTmVxdjBQeXpwNXhnajRE?=
 =?utf-8?B?U3FORGVKemdOUnBsdmhoM1gvUGdNcjNsY0h6OEFQMmpKYlJIL29oNWlxeExO?=
 =?utf-8?B?V2h5ZDUyVXJJMlJpUW9UdVZ5eko0b0FNN08vMHZ3ZzRianRLY3Z2cnN2b3lT?=
 =?utf-8?B?SjQrMURxdzVBVEg0NkROV0lQRm5FV1NhWG9KVWdFKzFtcjVGeFpIOXVSMnpJ?=
 =?utf-8?B?ZTNCRlJwZ28xSiszL1BnaElHSkZBQXVTWk1ZQ1V4cTdiL08rZHp5RktZQ2Qx?=
 =?utf-8?B?aVJKR0lHRklIQTY1NExVTGdOcndtaXF1ZUxYNUNiT3pGTGR0MHZHbDFHOGhs?=
 =?utf-8?B?QkZBakVudDZBeFNTVjdhVFJPWlMxZWV5VUNLYmkvRHl0aWIvRmlMQ3E5RWFV?=
 =?utf-8?B?cGhrU1ZjSTQyWnhTODNCeTRaQ2twZU1FbG1nWko3aUNYeFg1d3VMNTlaeWt2?=
 =?utf-8?B?Wjl4U05YQmdzKzJsTlNVUHFBeUNUZlczSXdzcnlrUWxJNHBVTjlxZWROY2gr?=
 =?utf-8?B?anNHMFZqendiSlVzOXBHWmx0azA4TUYwUDdYOHBXdUNycHoyMlRNWW1qbnN4?=
 =?utf-8?B?clI1cmtjVlptdmh6cjd1QTlHQ3FjNTVVQldSd3BUZmRERkxpTzl3ejRld2Rt?=
 =?utf-8?B?VUxNcnpEMVovUkJCby9nN2gzQ0QwY3NseTIzMWRDei9yV2RDM0pybjJTeWFj?=
 =?utf-8?B?ZlFaZVo1ci9zK3pmOWFnMGNYRmR4azZHd1ZuU2hxb1FTTnU2ZWdxQmlrUlcv?=
 =?utf-8?B?YW5RQktwVHNwZlZ5ODlyVkxCNC9SQzc1L21yTG1EVGdXS1pUZDNNK1NoWTBj?=
 =?utf-8?Q?A95s0cmNqtf+wX0Konx4IfgrX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f5b4e2-e31d-4540-ac4f-08dc299e1dbd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 18:37:06.1393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4M+KJ04DDnA3X24qIDBgn45jCn3odHxg2SpvBAG/QQvR8RzB7IZWzM0GH8jSmautg1tK4hkK9uf7OA9ku8++Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8902
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

Hi Daniel,

On 2/9/2024 11:34 PM, Daniel Vetter wrote:
> On Fri, Feb 09, 2024 at 08:56:24PM +0530, Arunpravin Paneer Selvam wrote:
>> Few users have observed display corruption when they boot
>> the machine to KDE Plasma or playing games. We have root
>> caused the problem that whenever alloc_range() couldn't
>> find the required memory blocks the function was returning
>> SUCCESS in some of the corner cases.
>>
>> The right approach would be if the total allocated size
>> is less than the required size, the function should
>> return -ENOSPC.
>>
>> Cc:  <stable@vger.kernel.org> # 6.7+
>> Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
>> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
>> Link: https://patchwork.kernel.org/project/dri-devel/patch/20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com/
>> Acked-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> New unit test for this would be most excellent - these kind of missed edge
> cases is exactly what kunit is for. Can you please follow up with, since
> we don't want to hold up the bugfix for longer?
Matthew Auld has added a new unit test for this case. Please let us know 
if this will suffice.
https://patchwork.freedesktop.org/patch/577497/?series=129671&rev=1

Thanks,
Arun.
> -Sima
>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index f57e6d74fb0e..c1a99bf4dffd 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -539,6 +539,12 @@ static int __alloc_range(struct drm_buddy *mm,
>>   	} while (1);
>>   
>>   	list_splice_tail(&allocated, blocks);
>> +
>> +	if (total_allocated < size) {
>> +		err = -ENOSPC;
>> +		goto err_free;
>> +	}
>> +
>>   	return 0;
>>   
>>   err_undo:
>> -- 
>> 2.25.1
>>

