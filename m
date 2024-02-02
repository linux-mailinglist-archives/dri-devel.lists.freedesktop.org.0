Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BDA8479DD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 20:46:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE26910E098;
	Fri,  2 Feb 2024 19:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GUduTmEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56EB10E098
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 19:46:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2Dg12hg6a3Q9e5krTvDIk2J2i8Echj4Q9DcgxgLQoPxNtKMYpM5Am4+ZlaYje3vFWrKJlKbDFo+lwebgXXTV+rfikbB2DLMuMBZ+ma6NN+TDZfX+YB5T5yPlvRiDy/n4UD9t/3LEFDPZnde2DK3grH0vbMkMyRNm2ZxSEABDZqH8KDMgWLVh0Q0buy8WWPv4zHb7Y3vu9FOw1RIkzu7ZRVVGUP/6J+yWO4aP/h9kZ+xsup+iP6C/oN5waQiQrbBQYiEWjflwIYZIX+qz2IcxlzAFaGPZeEDM8/G+ufzzSrHTgFtkhdYHP3LkaPe0GJg2yEQEKhMDshzVjpz1Q4lLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlOKPTCXeHyhDQx5BurYfSJ8yZxPgyi1FpKgvQLNcOk=;
 b=Eny5WL4cnWeEOhDErrG/TNxLTzWIHFtimREX3EiVNsFNuXTP6d+L6ZGh9a2jTZSvrV29DjD5ogjFeRCKWDPxz0/QNiyKk8/zei/hypoj6B3Z1JQ+m/qnzHDm9F5VTNOSlJ2D5+bdmNa65zhO5waP2Y5bRyW3aIV335YK4bctnsSFIfYGY3xDSvn4Z+kPEOV52llup6jMO8z8WMPgRdHZE7/EaQO9wPKjg7LoOBlLpkGtjwNeso92EehoKNtt0QwzfuD5Qm/dbFcMcKTs/lo3cZlFPS+8ctrpPPhj1dvzPSa+U4EOeWYND6Fg+FyN4OcnTt5O7BoD/WLnmG8iMXCVdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlOKPTCXeHyhDQx5BurYfSJ8yZxPgyi1FpKgvQLNcOk=;
 b=GUduTmEN4NZN1kAnKuz2uFLTgkg5yZX0T6lFOnxyErymWNtZZiYiBwLag8urUYvap6AtCUWN3qLGv8IXTSq4Cu+PZosXUlBhD/eAWG0mShbzjoBMUuM8bvrk7k6ofvFkY0rIxjk2OYblCrG6jXSnjg73fuG4dTQyZGvMdmdZJaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Fri, 2 Feb
 2024 19:46:16 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::c30:614f:1cbd:3c64%4]) with mapi id 15.20.7249.024; Fri, 2 Feb 2024
 19:46:16 +0000
Message-ID: <f037df4a-8a97-4fcd-b196-43f484b63d8d@amd.com>
Date: Fri, 2 Feb 2024 13:46:13 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fbcon: Defer console takeover for splash screens to
 first switch
Content-Language: en-US
To: Daniel van Vugt <daniel.van.vugt@canonical.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Jani Nikula <jani.nikula@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240202085408.23251-1-daniel.van.vugt@canonical.com>
 <20240202085408.23251-2-daniel.van.vugt@canonical.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240202085408.23251-2-daniel.van.vugt@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR11CA0050.namprd11.prod.outlook.com
 (2603:10b6:5:14c::27) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: ea08c657-b8a5-44f4-e176-08dc24279e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JIygyFZIM1ImBSFNGMjeRFycniRzzmv8LBZAm1/OOBER5mohEnfxoQ/Fn2j79wsKeJIIXCLxhkSh8gxvPw6nP/ceyhfE8KT+hU6MGvv0lpYmgyQeWt/+xr7BfrVsxwNitxgoF0ccMQAYnmq6HcKTgd/TzHre+HO7jwzQAszKlXVrcVTrxpJru+7hy9HtOhqB6kmAsEnz3Br9gzaUYoUz9Gy6QcIIGZUYZvV3FVTy7/8Q3ROtRsFJvIefVK1ISvHRUounttF9d7e918wGAJI+AjbIxKm+JipFjqAlBdbMaUz41yq/JxuD4SCDc9gWul7cSCOOzbLyFyHvoVXm6bPToqdqLntrcmZaO09jsFWTyStseRC+UV/kJlull40Aw9G6IDsvBGPyxnqvel2Edm5zuf8x+z1lA28mg/iTRlsxporAwpTQOrU4Kb3B0I4tXKzWn8t/HOIv283f9nWm9b6X0Dxs3zk0VrwvJ6XUweM75ujRllSf2T6yHNbaAreHSV3oQJCKuw7jyJ0J5MaHEWhO/TtwWtNqisZF4d637VukMlF+l+bl22YPHmj4ZSeSV8wZYMeCAevRxkNb3Y6261Qi102UVT2m2jlhWutaVcox84/Lh032gPC5mV+CIrI/sqAH6ZsDSrn7YO0g6E90ruxCwo+4/X0n5uRF3OpqlDLYTk0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(376002)(39860400002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(54906003)(966005)(8936002)(6486002)(66946007)(31686004)(8676002)(66476007)(316002)(44832011)(478600001)(6666004)(6506007)(4326008)(53546011)(2616005)(2906002)(38100700002)(66556008)(5660300002)(6916009)(26005)(31696002)(86362001)(41300700001)(36756003)(83380400001)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REpUdkQzUGpCenBDZjU5dzlnOEQvdjUvNFZEdjdHWGl2UzdQelBpOEh4cWdm?=
 =?utf-8?B?U2tTN0FXUWpVUjMxZEl6QzFpUkY4Y1FNdVFtTUUrUjMzV1lVMnNpNWwyTzEy?=
 =?utf-8?B?SVFKRVdsdXdTdGhrbDAyQTJUNmRDaEdNMUl4QUVoOUl3RmtEVW9LRVg3WkJ3?=
 =?utf-8?B?NmVmSkN2b0crS3AzYjdPMVVtTVMwZzRaZ3FLRkZKRWxPWHErOUVQV1RmYmZB?=
 =?utf-8?B?My9MbXVSdlBuemhDVWJGZUxtZlF6SlRDVFVlUExSWlgrbFI1blN0c0lUcXpD?=
 =?utf-8?B?QzN1aTlJc1gvN3E3RGdhNEV2eW9xbHBRb3QybDRsZHI4RFNxZDVhWHZxRm1I?=
 =?utf-8?B?RUpVTTlyeElDUmROc1FhZFR2QXMwdDAyUm5pb0Y4L0NVNkNxdTRRRU1qYjVj?=
 =?utf-8?B?MXhuUHZFZTJiU29lcFYxdWpqeU10TDdZNFNqT1U5clEwK3hQSDZJdjZVQTA4?=
 =?utf-8?B?UnFHcGtGcXZhTzFtamJJOENLaCt4bUYzV1NyallUOUFZMlZRcyt6dUZUUEhM?=
 =?utf-8?B?ZGg1L3VlaTNWRWs0Yk5DWWdKNzdsT1k5UDNSc1NiMFUwSDlaWGdvRU1MZzJS?=
 =?utf-8?B?TE1Vdng3SHl5K3RYTG1uSDJNUk1FMmV1WGEwVmhxelJvSjBSM09pSWNMbmFD?=
 =?utf-8?B?RG5PU2ZlNWlaVzZJOFlZZlFZbTA3MUt6M2wrKzdaSUt0MmV3cTB4MCtDaEI4?=
 =?utf-8?B?aUkxK0dkUXdReUxhclV3WTNSR0hvYlpXNFpjL245U2pEWk1ROXpZVkhwYUxI?=
 =?utf-8?B?YmsxVlFOWmdBbDVaRFl5eGVJQVpHRWJ1TlNvaXR0SjJXWU82NzBVbmR1UGVj?=
 =?utf-8?B?eXU2eGQxVkt2ZUF1ek5VS0lRSXJOY2YrUmVybTZZRXgvME9FUm1NK1VUblFx?=
 =?utf-8?B?TXV4d3ErcXdTOUtkY2FEcTJVMVdzanVYRytQS3VrK3FNVXFqVHpOWWZxU00y?=
 =?utf-8?B?dUxIRStHcm5mcVNaa3dhb0JaZndNQmRLcnJsWnpyc3o4WFFVdS9ud09tSHlo?=
 =?utf-8?B?VHNJMU4wcGsweDE5Qjd4ZmVHTFU1R295bnZsQW9UcG51NUlVL0ZQSWxGQjU1?=
 =?utf-8?B?VTN2ZTNTZHdVKzRhbS9CanExNy9yRnI2MzZmWDAxVTBOa3EzOGpwbGNlcWYz?=
 =?utf-8?B?K2pGdGdwRjVmNjZ0QWdFNGsyZ1hUQ0dPSmRwWmtFWldocU1XU1lrQzN2V1hE?=
 =?utf-8?B?VUo5bjFwckdiYXZXV2w5RE9EQk9Fa2ZqSjN4cDZmNXNiaXVzM2s3c2tVU3pF?=
 =?utf-8?B?MFRjTGMrV1BGTmR5akdFOG9jZFdydGlOaC95bndCVklvWm9TZk5QdFlobndu?=
 =?utf-8?B?V20zaCtpZ3RvVHJkUUkrSzgzTXNtdTdua01GM3BoZmVlazhQWGJTZGpTcEhp?=
 =?utf-8?B?dnFMQWVwWjZmUUxxRU5PVFdiNFpwK0c0MkNsUEFHaVdWK3VRZXRtK1RlM1hU?=
 =?utf-8?B?akdyOGlVdm1zaFZtK0ZUVW43WDMvL1c1ck9PczdtZ0NiL0VGcjlkUkpBSEVJ?=
 =?utf-8?B?TE9tL2ZzQWxlQWtvUFNqMTRXVzEzeWxaWDhENGxlc2dZTVZTbjE4b2VNUjFT?=
 =?utf-8?B?SDluczJjN0lkY3o2WVhlcWNHa1U0Uk9QbzhjR1dnRFM5MHlEK0Z0VThkcW9F?=
 =?utf-8?B?MEZNQVhrWkJ2Rmp5cFhaM09yMzh1Rjd3MU10ZGtuOVl6cGNHWStvc1dKcmY0?=
 =?utf-8?B?cVFjT09odWFYbVRUbzFwaGh2YllPNFF3ekdFOUd3WDhHYXFTb0x2VkRYL2Z2?=
 =?utf-8?B?eXNYeklDVUdOUHpGZTZuTkpGNEtkV2dWQW82bEhFeFRtVDBkZ3BmVEVCTGFy?=
 =?utf-8?B?RHR2OU1TTFdIVFFDYUZ4ZlFSV1crNlJ5czNHV2xVUzhGM2VhaDRTODVyc0Vs?=
 =?utf-8?B?ZG5JRjFYaE93c0ZwWktuMG5BaXNPMEVqWjAxS1pNUlNwdkVXaDkxZEd4ZnhV?=
 =?utf-8?B?WFY0TTFBeUt6VjViMzhQUVlLaHVpYW02T1Njc2ROUTVYSDgzbHVqakQ3emUy?=
 =?utf-8?B?b2wrNmF3ZXVOdVBXcTFJMzhKc3BCZVdrS0hRYWxEUzJDWHZaMG9qSExGQUZR?=
 =?utf-8?B?VWxBY0tvL0owR2lyM0JJNTdRcjBScC95SDdtZGRRNUtuNytTVUdPWk5FTS9q?=
 =?utf-8?Q?7LRmzgj3VfZsZqDRCHUkSfIZu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea08c657-b8a5-44f4-e176-08dc24279e6d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 19:46:16.1741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mBd4mXo7HPSm0ZL+6xnRpdJCf+sngAgLP/iQ2xsmSXJCI8uKdNPRFwbGRTffBVLAe+dVz2iLd6tCoDdmEFGybA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834
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

On 2/2/2024 02:53, Daniel van Vugt wrote:
> Until now, deferred console takeover only meant defer until there is
> output. But that risks stepping on the toes of userspace splash screens,
> as console messages may appear before the splash screen. So check for the
> "splash" parameter (as used by Plymouth) and if present then extend the
> deferral until the first switch.
> 
> Closes: https://bugs.launchpad.net/bugs/1970069
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
> ---
>   drivers/video/fbdev/core/fbcon.c | 32 +++++++++++++++++++++++++++++---
>   1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 63af6ab034..5b9f7635f7 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -76,6 +76,7 @@
>   #include <linux/crc32.h> /* For counting font checksums */
>   #include <linux/uaccess.h>
>   #include <asm/irq.h>
> +#include <asm/cmdline.h>
>   
>   #include "fbcon.h"
>   #include "fb_internal.h"
> @@ -146,6 +147,7 @@ static inline void fbcon_map_override(void)
>   
>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>   static bool deferred_takeover = true;
> +static int initial_console = -1;
>   #else
>   #define deferred_takeover false
>   #endif
> @@ -3341,7 +3343,7 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
>   	console_unlock();
>   }
>   
> -static struct notifier_block fbcon_output_nb;
> +static struct notifier_block fbcon_output_nb, fbcon_switch_nb;
>   static DECLARE_WORK(fbcon_deferred_takeover_work, fbcon_register_existing_fbs);
>   
>   static int fbcon_output_notifier(struct notifier_block *nb,
> @@ -3358,6 +3360,21 @@ static int fbcon_output_notifier(struct notifier_block *nb,
>   
>   	return NOTIFY_OK;
>   }
> +
> +static int fbcon_switch_notifier(struct notifier_block *nb,
> +				 unsigned long action, void *data)
> +{
> +	struct vc_data *vc = data;
> +
> +	WARN_CONSOLE_UNLOCKED();
> +
> +	if (vc->vc_num != initial_console) {
> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
> +		dummycon_register_output_notifier(&fbcon_output_nb);
> +	}
> +
> +	return NOTIFY_OK;
> +}
>   #endif
>   
>   static void fbcon_start(void)
> @@ -3370,7 +3387,14 @@ static void fbcon_start(void)
>   
>   	if (deferred_takeover) {
>   		fbcon_output_nb.notifier_call = fbcon_output_notifier;
> -		dummycon_register_output_notifier(&fbcon_output_nb);
> +		fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
> +		initial_console = fg_console;
> +
> +		if (cmdline_find_option_bool(boot_command_line, "splash"))
> +			dummycon_register_switch_notifier(&fbcon_switch_nb);

So there is a problem here that this would only apply if the distro 
happened to use "splash" which some distros use something different.

I looked at the matching plymouth code [1] and they have a bunch of 
variations of what they accept and what it does.

[1] 
https://gitlab.freedesktop.org/plymouth/plymouth/-/blob/main/src/main.c?ref_type=heads#L888

If from the kernel side we're going to have code that caters to the 
userspace behavior of plymouth we probably need to match all those cases 
they do too.

Another alternative could be to make it a kernel configuration option 
for which string to look for to activate this behavior.

> +		else
> +			dummycon_register_output_notifier(&fbcon_output_nb);
> +
>   		return;
>   	}
>   #endif
> @@ -3417,8 +3441,10 @@ void __exit fb_console_exit(void)
>   {
>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>   	console_lock();
> -	if (deferred_takeover)
> +	if (deferred_takeover) {
>   		dummycon_unregister_output_notifier(&fbcon_output_nb);
> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
> +	}
>   	console_unlock();
>   
>   	cancel_work_sync(&fbcon_deferred_takeover_work);

