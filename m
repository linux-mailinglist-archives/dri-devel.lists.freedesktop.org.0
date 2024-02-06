Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDFB84B9E1
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 16:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892E110F487;
	Tue,  6 Feb 2024 15:41:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p47jcIjT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483B810F487
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 15:41:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTwzaBSR0PXwkr1XRHQ5vHCL+hXwr9v6ZhbHheFI6nPBSLp656nZqt4223+pxW4PTKzOtbRVnlTlXpinQRABdLWyYD8usti069F6antO/8ey3s4XZrdX1w5kD1IYXWo1vdJA12eK/A0Sk0rvBgzxIn9/ril0vboAoImrrXgc8a6gQLAzko+fc5/ZNULKl+7271MjiYLsaiuKxWH1xUTP0bway0ir/T8HT3wEl9oKkiTYE5qUoMTnFRSAWNGqYyWirGycOG3VWQLvZHEFoJEVOA9Nb+jmL/VgUc2ouSrkl6DBh9Oh1U8Ub4nBncPYfTyHsxwhk+91ad+USalVbdQFJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BABUTrbv+RW+c3AQ7L7r8IgpZ5jRk5/tpMWK9EC6Q7g=;
 b=L/8KUK2Trc0FSGsPwHSxagUgtMtgiqYqckcGy99yoYJiHnQxir2aq9mRILrp9fGmmCkSo0GkgEjte09nxHrgKogxPmaarf09pg8C98GfZ6q+pPXws6fFnDgsJZrqC9WJ/0LBIGvlQnhg9hYPzl2aL0WPjUxY6ULvBz7ABhEmsjwtOlT6fNotRVPapp2sqsCbWHhOARc4MSs/mdbmnyGEatZJCrAC2YG6CIlhNH6E2NncofMgMSgBaUlR/8C9BqsbPHSvTgTKug/RgWOqnP8cvOVvgG6+GohmOZLhcl+u6ywn2NF/4DhwlHSiZJnJrDnU5xZ0HuEgHjaGv7xkAh1hYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BABUTrbv+RW+c3AQ7L7r8IgpZ5jRk5/tpMWK9EC6Q7g=;
 b=p47jcIjTg1sDYeb0sMhW6M3q3OGFx/Vd4EBtBaXxI7aU1YxbTkls6rDa7HGvX2f3RDWKUKPtpzTpcfPaXpmxCQqD7XrQoBn6mMa9SkUSznrSTbE1yivcFqJo/VNzwEETydVdyeo7pkp9En1+pEfEd/Nja1HfeH+P6d+72z9C+eM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by IA1PR12MB8261.namprd12.prod.outlook.com (2603:10b6:208:3f7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.16; Tue, 6 Feb
 2024 15:41:31 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::f6d2:541d:5eda:d826%5]) with mapi id 15.20.7270.016; Tue, 6 Feb 2024
 15:41:30 +0000
Message-ID: <e4fc61ae-97f5-4fa1-bfed-1312466a2a22@amd.com>
Date: Tue, 6 Feb 2024 09:41:29 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fbcon: Defer console takeover for splash screens
 to first switch
To: Daniel van Vugt <daniel.van.vugt@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Jani Nikula <jani.nikula@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <f037df4a-8a97-4fcd-b196-43f484b63d8d@amd.com>
 <20240206101100.25536-1-daniel.van.vugt@canonical.com>
 <20240206101100.25536-2-daniel.van.vugt@canonical.com>
 <ZcJAVSyH3gRYx3EG@phenom.ffwll.local>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <ZcJAVSyH3gRYx3EG@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0089.namprd12.prod.outlook.com
 (2603:10b6:802:21::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|IA1PR12MB8261:EE_
X-MS-Office365-Filtering-Correlation-Id: 8283c294-3f38-4dd3-0f94-08dc272a16f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PZV8/4XFDFAQ9qaaiilFL8GqUmk03dtrHrw+VatPKZy02/8KJ0mAF0zCbMRohM+NHwMMrczlYzaxut3oxcJvGtdRPAKyP/7akkOG05tsIP2rWiMcaBr7xeH1lHin1/n+ESPJhGIG/WOH69kbze8stsRAsgDF2Yii+0A1rySKXTabbSKO0NQiZWB7NDJ+bZ2NHgCzh/TVQJpDZz6HTWAIiuz73RjEeD0Tl0OOxdXA9PUFzx9N6gfo6NYt//KYSIe8TBQwJdsNVAstkVIirLLYOFY2D4P14z/XDfvvek1FOR4h45/G6Vh2lO46mlFoyq4FftWiCblL7uM6tIYQpYvT/87JebN3ZhPYHO+hu7uHWE5mNxwVtCUG/NVDgPCEOvy8w4hSsivuWJ31+cjOnEX31tcHwKiRoffgn3a7woSWRmyUWb+zSXVGPkJVMvC5Q4vmL04Xi9cKJ+nvj5oZNqaTHXtxs2EIW5Ry9hm2c4IHGiRqnghaEG3WK8fjuSj4quLTnoBeuSwaupjGqlxB8Oe38NxnjAxhWDmlzX5wRhhpBowBTrOmoAdbNvNW2cLKDfBgFhPsb89gEuHOGyhpViEVNT47FpshskrQO1fSc2uRo6DFndNxkxLeTQj5VDdec02h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(396003)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(36756003)(44832011)(2906002)(5660300002)(41300700001)(26005)(2616005)(83380400001)(6512007)(478600001)(6486002)(966005)(6506007)(86362001)(31696002)(53546011)(31686004)(38100700002)(66476007)(66946007)(66556008)(8936002)(110136005)(8676002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVVCT3oveDR4SjJHK28wR1RnR2hQVytVVU9yamhwT2Nsak1IdzBRcTA1N3hz?=
 =?utf-8?B?eDhUc0kzeGxrWHhhWWxPaDRrZUxoa0RzR2p4clh5dUN4djMwSWUxL21MTmU0?=
 =?utf-8?B?ZEdWVzVzUEhaQU50S2htOVJHUHo0QUhDaFVDdkhMZEljWndSdTJWY3FvNGpK?=
 =?utf-8?B?UHIwd2haNmZiN1ZHM0N5S2VHbmxxZG0rK3hRVG8xcmdtQ1BBelVMY3BaL3VT?=
 =?utf-8?B?OG55NENuNFJ5bFprbS8zOWwybU5LRUdLQUVSNUhRRnRNSDVyTzJSYVVPVkVL?=
 =?utf-8?B?QW40ckJqUUxFbjJlamlkbmZmdkI1bU1xeEZ1R25neFA4c01nRW5MQW8xOFNz?=
 =?utf-8?B?bkZCcngxV2NCMVJ5V0ZTeWFhK1hjaDV1am9FUmZwWnh4NUxVbFVGNTlGUkJ0?=
 =?utf-8?B?MXpDUjBvMjhCZkJxd0c0NnV3ZWdxMFAxUCtjV3BwVW01WDJja3AvV1MwTzB4?=
 =?utf-8?B?eFA3TnR2Tk1zckdiZEdQYUwxcWUrYXVyTEV0bnFaQzU5QmwxN1VJYWd6Yno2?=
 =?utf-8?B?K3dHcXdGZmtRWGsvbDFzcnVLL2ZVS3pyczlGaGtHOHlrVFB3Tys1UUxQZ3M0?=
 =?utf-8?B?R1M1OFROREh5c2Rzczh1R3dROGU0TXdEcmV1Rm0xU3lMOHYzOHhzcWJwSjQ4?=
 =?utf-8?B?UGNQT3hPWGZiZytEVG5TWHNFei9haXlsM3BvMkV0VzZjcTJiK0hSais5QjlX?=
 =?utf-8?B?RktSM3hnd05UVDhGWkRoWDRlcVJtd1BKZ3RaWWpRY3dhTXc3US8xY2RYVEx3?=
 =?utf-8?B?YlFoam9hdmVITit6RGVGcEI0THlGeDZvaTVBdTBDaTBQYVZmcVQ5RlBqTnJF?=
 =?utf-8?B?dCswRktKYUx1WlZtbVA2eHBkUUdDR2t5Q1BDTzBWU2lmT2hTem1zZXA5azdW?=
 =?utf-8?B?ZjRSMjV5Y1VvUXVzak1tTGZxbWZKSTRYVzNKTmZLOVdxZ3FUZXVweU9qRWQy?=
 =?utf-8?B?Z0NZVWd1c3FNSTB5QUNNbkRvdnBZZ2Q4cVNnODdoZS9hL3VsT2hta045Vno0?=
 =?utf-8?B?dnhLQ3AvQXhzOXd3THJndjBGM0wxUmFVVTd2b0NYaldSWndYaVFQNk10cHEy?=
 =?utf-8?B?aUdsRHJrd1FmRFkvRmRPK1VCZUJFUFZPY3VRUHAyR1BQdi9WM05BNHMra1ZV?=
 =?utf-8?B?dkdYSVk0ay85a2J1cm9wdlFaa0xjYit6dVVNaE9lMm9MSWpLakJITUl3N29x?=
 =?utf-8?B?M3Y5bTZPRjVFNDRRN0MvL0N0Wjc3UURnelNLNEpJS3o3REJ6a0gxdmpjYkVo?=
 =?utf-8?B?NWFSbGhrQWtlTUc5V0Njc0Y2TGZWaXRvMm9IUVIxcjZTQU9BWkh5M1lxcDJE?=
 =?utf-8?B?di9UUUk3NTk2R0c0TzhqWlY5ZGFlNVVSbE9sTzIzSGwvMkJ1bWUwcTI0N053?=
 =?utf-8?B?YS9JUlR3c3B1VEdxYmVjUWlnMURtNzNhdndQQzd1RDRwc0lmcm1jVGRVZGRJ?=
 =?utf-8?B?UmFlSnllTWcxdUZFMFpzVkt4TUVxRXlGT2lwYWFqdkdiNGh1VjRBZDZ2a1Fa?=
 =?utf-8?B?M1luSzV4WXlrUzRWNXVHTDdQdXJLZ0w1dEF1TFIwKytTdWorSGI2c3dzMG9k?=
 =?utf-8?B?dUxFT0l3NWcrMGVnUXhLRzNjUDlwMjRGU3lQWFZXUzhzZXJIait4VTFVS0dl?=
 =?utf-8?B?Q0NPMS9IMEdXbzllOEJ2TnBGK25xdndJRTdPVlpYUTlERFQwUTRFTWY3dmZF?=
 =?utf-8?B?SjJERFFoQ2swZVhmaDZocmh5OW9DQlE1MGZMbFZuREUva3dJMnZEQjVHUEFT?=
 =?utf-8?B?d3dFRGE0c3lJRGNrb3BOdUw1Q2wvLzB1L2hENXRRZDdqTFQwYVg3Q2FCMVFo?=
 =?utf-8?B?RjVhTittajN4R2pKNUttRDFzRThaOUJvYXd5RGZ6VDZiaDQ3S3RQV0F3YlBU?=
 =?utf-8?B?c1RPQXpWY0RXeVRGR05JTVpHejV0MnlHZklUOC9xbnJpbTdmOC92RXA2ZzlK?=
 =?utf-8?B?MEs3aDc0SWs2N1NoU3o4MWVMcW9QRks5UFEzbTFaY0swc3JmU3MzcTBGRlNG?=
 =?utf-8?B?NDVkdEs3b1FlSGNwUlpoSmxJT01iWkk1aEh0Zy9ZYXEva3ZKTlFGbHo5ZnFv?=
 =?utf-8?B?T29vc3hOb0FsMjY0Mm1UL1I1QWxTUTdqOVVmM21NOGlSZlVmbkZFT2hNaUV3?=
 =?utf-8?Q?GFzpxjAOqa3VBbTKA63kUZ7SY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8283c294-3f38-4dd3-0f94-08dc272a16f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 15:41:30.8568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4wL7F47exmAEGTYoweMJGqkTDxSWUSS/olLvyTxR3A+g0HKwvkJV5SVpe2ceN0s2ImHVimwocJ1+uCPxeBSdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8261
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

On 2/6/2024 08:21, Daniel Vetter wrote:
> On Tue, Feb 06, 2024 at 06:10:51PM +0800, Daniel van Vugt wrote:
>> Until now, deferred console takeover only meant defer until there is
>> output. But that risks stepping on the toes of userspace splash screens,
>> as console messages may appear before the splash screen. So check the
>> command line for the expectation of userspace splash and if present then
>> extend the deferral until after the first switch.
>>
>> V2: Added Kconfig option instead of hard coding "splash".
>>
>> Closes: https://bugs.launchpad.net/bugs/1970069
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
>> ---
>>   drivers/video/console/Kconfig    | 13 +++++++++++
>>   drivers/video/fbdev/core/fbcon.c | 38 ++++++++++++++++++++++++++++++--
>>   2 files changed, 49 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
>> index bc31db6ef7..a6e371bfb4 100644
>> --- a/drivers/video/console/Kconfig
>> +++ b/drivers/video/console/Kconfig
>> @@ -138,6 +138,19 @@ config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>   	  by the firmware in place, rather then replacing the contents with a
>>   	  black screen as soon as fbcon loads.
>>   
>> +config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>> +	string "Framebuffer Console Deferred Takeover Condition"
>> +	depends on FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>> +	default "splash"
>> +	help
>> +	  If enabled this defers further the framebuffer console taking over
>> +	  until the first console switch has occurred. And even then only if
>> +	  text has been output, and only if the specified parameter is found
>> +	  on the command line. This ensures fbcon does not interrupt userspace
>> +	  splash screens such as Plymouth which may be yet to start rendering
>> +	  at the time of the first console output. "splash" is the simplest
>> +	  distro-agnostic condition for this that Plymouth checks for.
> 
> Hm this seems a bit strange since a lot of complexity that no one needs,
> also my impression is that it's rather distro specific how you want this
> to work. So why not just a Kconfig option that lets you choose how much
> you want to delay fbcon setup, with the following options:
> 
> - no delay at all
> - dely until first output from the console (which then works for distros
>    which set a log-level to suppress unwanted stuff)
> - delay until first vt-switch. In that case I don't think we also need to
>    delay for first output, since vt switch usually means you'll get first
>    output right away (if it's a vt terminal) or you switch to a different
>    graphical console (which will keep fbcon fully suppressed on the drm
>    side).
> 

IIUC there is an "automatic" VT switch that happens with Ubuntu GRUB + 
Ubuntu kernels.

Why?

Couldn't this also be suppressed by just not doing that?

> I think you could even reuse the existing
> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER for this, and then just
> compile-time select which kind of notifier to register (well plus the
> check for "splash" on the cmdline for the vt switch one I guess).
> 
> Thoughts?
> 
> Cheers, Sima
> 
> 
>> +
>>   config STI_CONSOLE
>>   	bool "STI text console"
>>   	depends on PARISC && HAS_IOMEM
>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>> index 63af6ab034..98155d2256 100644
>> --- a/drivers/video/fbdev/core/fbcon.c
>> +++ b/drivers/video/fbdev/core/fbcon.c
>> @@ -76,6 +76,7 @@
>>   #include <linux/crc32.h> /* For counting font checksums */
>>   #include <linux/uaccess.h>
>>   #include <asm/irq.h>
>> +#include <asm/cmdline.h>
>>   
>>   #include "fbcon.h"
>>   #include "fb_internal.h"
>> @@ -3358,6 +3359,26 @@ static int fbcon_output_notifier(struct notifier_block *nb,
>>   
>>   	return NOTIFY_OK;
>>   }
>> +
>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>> +static int initial_console;
>> +static struct notifier_block fbcon_switch_nb;
>> +
>> +static int fbcon_switch_notifier(struct notifier_block *nb,
>> +				 unsigned long action, void *data)
>> +{
>> +	struct vc_data *vc = data;
>> +
>> +	WARN_CONSOLE_UNLOCKED();
>> +
>> +	if (vc->vc_num != initial_console) {
>> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>> +		dummycon_register_output_notifier(&fbcon_output_nb);
>> +	}
>> +
>> +	return NOTIFY_OK;
>> +}
>> +#endif
>>   #endif
>>   
>>   static void fbcon_start(void)
>> @@ -3370,7 +3391,16 @@ static void fbcon_start(void)
>>   
>>   	if (deferred_takeover) {
>>   		fbcon_output_nb.notifier_call = fbcon_output_notifier;
>> -		dummycon_register_output_notifier(&fbcon_output_nb);
>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>> +		if (cmdline_find_option_bool(boot_command_line,
>> +		      CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION)) {
>> +			initial_console = fg_console;
>> +			fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
>> +			dummycon_register_switch_notifier(&fbcon_switch_nb);
>> +		} else
>> +#endif
>> +			dummycon_register_output_notifier(&fbcon_output_nb);
>> +
>>   		return;
>>   	}
>>   #endif
>> @@ -3417,8 +3447,12 @@ void __exit fb_console_exit(void)
>>   {
>>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>   	console_lock();
>> -	if (deferred_takeover)
>> +	if (deferred_takeover) {
>>   		dummycon_unregister_output_notifier(&fbcon_output_nb);
>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>> +#endif
>> +	}
>>   	console_unlock();
>>   
>>   	cancel_work_sync(&fbcon_deferred_takeover_work);
>> -- 
>> 2.43.0
>>
> 

