Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B11CE856DE6
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 20:40:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E4410E22C;
	Thu, 15 Feb 2024 19:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R6GfjO8m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136F010E22C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 19:40:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKEwO2g0efOEJid5ErS1UdHXbwKuTfpnx2IcmvLcUW7+xxB6obyDqSEO6iYWWo/ccJWt773ZSCzCtiUc8WeC4guX+6WKf4t3fsnqhwTXUe+pJQYSB8EVwuO8V+5OCX/FoteFTJfBUEitzHvnWpkcD2+4vi5TspAr2j62GI0wTSMvDetPXWtFUpkBxKPcCEi+Cb//BRBF8KBqMLAmV638PgqVaRJxRHRGJuw35d3QlaNQA6ayCcBRy7V5/nEPHwVS6dz3WbjgBjXxYhcTs7kA4urk69I0lgk9GmaTjTvzcl4/fan8921fHx4GLExUb7p+PPHRzs1PahX5AQzbyC1nag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yjzb9UPsFsOZlGhlPYdVL1SAW7gno/53FSEL3EuZYjI=;
 b=T4TI9vDEDmHypBMGKjhTYfx+hmzwqxAZikHx4G5P//vC5fRetRnqeKgT8MId+9wIsWERdWeeWpSvGsRM1LcErPmOmTcCRSfE0pOpKiITtuGEcJtWjZFEZi2FpOPzl9vi7Z2UQn1/JLg5AVWERYjYQHnQb6L3t5uewBICJ6r4hXH16/j2vGmtmP96qXMZ4smKE9tIlaE/jclOhrsYi7yAttjBqjyN7JtBqCjvscBZKBilYP8xfAo33gFjzLy7jc6eMIzyDpMysL/siqbHVEQXH+bBMQ3G5DxCadMKIg0q+xQxCi/1BUGlPvTUVgv/AOJduIAtQ4w9p9Z9xCFRYrcFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yjzb9UPsFsOZlGhlPYdVL1SAW7gno/53FSEL3EuZYjI=;
 b=R6GfjO8mMsvIWTUqGGYN3wmoSB2VtvLmDPBOOsZ+nz6qDyGVGVSk9lf0842pN5qLaalvh8oActlW3pKO65/+NBzmdCdwfewQb2hPtFWrZZOPYCSNKngLMV5n2pRLSk7yvpK/PZa/Te7EmHlPGDzlWZkbyPUmQvIIVJK1MjShFqY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Thu, 15 Feb
 2024 19:40:46 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::dd00:9ab5:4d11:2d1a%7]) with mapi id 15.20.7316.012; Thu, 15 Feb 2024
 19:40:46 +0000
Message-ID: <bb8d631d-9f6c-48e8-a504-8931ee21014d@amd.com>
Date: Thu, 15 Feb 2024 13:40:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] fbcon: Defer console takeover for splash screens
 to first switch
Content-Language: en-US
To: Daniel van Vugt <daniel.van.vugt@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Maxime Ripard <mripard@kernel.org>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <f2c54ff7-d601-49d0-b5ad-9b111d743ded@canonical.com>
 <20240214052412.22770-1-daniel.van.vugt@canonical.com>
 <20240214052412.22770-2-daniel.van.vugt@canonical.com>
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240214052412.22770-2-daniel.van.vugt@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0181.namprd04.prod.outlook.com
 (2603:10b6:806:126::6) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: b93f765b-08c5-4aa0-6f1c-08dc2e5e0133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0fu6ottflXg7W3CLSXlbE1qDpEVSlsmaOoBqVJon+70AX6eu4IeddgYj/g+ne8Ow//vbb7PTTOoEhkC5/BgTrKvIju80Mbl14NOebRP4xD5Qy3nMMnQ6jdDDXhN/izruIyQ7tdyQd9XEH1AkaRy7bHNwo3au7Ehxqb2jAiRmufzKgBf7TmpjG6+3ikAObX2MxpgAZQWb03Z8zoVUqhAcX/lXth2TjH5xGewhEBMSzNKcQGexrwLUljQE5MtaeJ5jJ/EJUaUF0vXwLRQxhHC5849YmbVD5BwC4QlY+fZSTjJV9zNCXHP3kzWYkg9Iz4AIVz7khJnSDxzGpzWYkb/HKVJ1YWoFLwY3N5FDp0ddRREgCbisU8FdfhusPE5Q8EWdWOQNHZify02Qt82R8qoQCP2WOO2fTtfbP5wnfUXLy9hnqe/Rlf65eslLJPcuivkttCgI4bSYNrK2itNqAN4/CsqvU9dD4Z7qh45jE5Dj2V2pBESclQ7OGtbI01jqnQ+YicL1NQJ7vZdH2DOLSAN/kkQpXws/8/VmZ1aO+o0HmPg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6666004)(2906002)(316002)(31686004)(54906003)(7416002)(44832011)(5660300002)(66946007)(66476007)(66556008)(966005)(4326008)(86362001)(31696002)(83380400001)(6916009)(8676002)(8936002)(6506007)(478600001)(26005)(36756003)(41300700001)(2616005)(6486002)(6512007)(53546011)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2twTGw5WWdnSHY3dlk4YjlVcEkzMXlMTHhWSkFRZG1yRW9UUFFqbHVTK014?=
 =?utf-8?B?UGJucS9BOUp2azVzdjhrQ2cxK0ZoS2lYN0c0R3o4TFMxaVJCWVJDcWF5SXdj?=
 =?utf-8?B?U2h3Yk1FWXNqMm1LdTRPQnhzMFhjaG1OTzZBUmF6NjlydVJrbEo1R1drNStp?=
 =?utf-8?B?V0ErdUZiVTVuVnl3bEhBVjE3MVpUSDBHeW5kSkNNeUQ3S21zYncrNDRHSGNs?=
 =?utf-8?B?RFF4U0VVOWI5Qzk3Q3I4SnV0N0IzVWhkUVpsTDVLU0ZLMzN3S3ppNE54QTdI?=
 =?utf-8?B?N3JwclBRdU93K3k0RlVmMndDZnZPdTN5OHgrZHhkUG94TXBpRGdGUUVibEN1?=
 =?utf-8?B?YTNBTk9VeUpZUDJnNmtWRDUwYkJTZElyalNuT1JNYnVLN3c5NTBCUS9mU0Va?=
 =?utf-8?B?SFlPT2FNakVxVm5GWnBVcW8weGM4N3g5Mnl3NUVWbVZuMEpXTk1FL05nMVg4?=
 =?utf-8?B?KzlSdnAwWnh2MUhPMkVkaWF4TDJhSFUzRGZxWE5hcGM4L25nZkEzaEpYYjVC?=
 =?utf-8?B?U2diMWZxYitzR2xtOVppMHFWd0VTS3l1QkdsY0RwR2dxemE0SmlVREVXZzc3?=
 =?utf-8?B?bC9KQ0Y0RllCaDNENDBFeUZWRnlGVTMxVlN5R08reWpkK3RIb0R2NXhHd1Fu?=
 =?utf-8?B?U01YdDVpTHVPRW4yRU16TE81SkowZUpHRmE3bTUzL1dHZVljNkpWUFJsOUVM?=
 =?utf-8?B?MUtNVG9uMlNzQmJqNk5xaW5ScWdwazhVRmU3cjdHRWxER2NiMXk4UU1DUWw3?=
 =?utf-8?B?elJkOGZSWkVsWGEwdXcwTUZnWGZlMFNJdDRkZW9Yd1FUUXhkMis3WDVCRUth?=
 =?utf-8?B?bVZraG1mek9kZFErSlRQWE5pcGp0ek90d0F3aHV0R0tTdHBaVWQ4YnU2aXBZ?=
 =?utf-8?B?YmlDeTRNL0tPYkdMeHZnTEJzVjZMblpjL3ZqcjhHek1ScDJLNE5HSWNQSXhs?=
 =?utf-8?B?OXM5VkJ5QUw0VkQwNUNVZWVISytnREdrS1RJNkQzM0ZYbTZ6dUZuTDNXQ0U0?=
 =?utf-8?B?UHpuOUNZQ3IzWmFlZFgrM3N0RUxqNEt5bE5aUzRyUlZYbDNUR2JZQVFwTTYr?=
 =?utf-8?B?UWxIbk9BN3g0bG16bGJwaWYvbW1ob0pHRGV2V1E5amNNYzJJdjVPQzI0alJj?=
 =?utf-8?B?b0NnODFkYTh1bDBEQTBCMkNwSlMvQUQ5UWhMeUdaeWtTTU1qVEdNUCtobVo4?=
 =?utf-8?B?cDdhc2FCNkJSNnNFV1oxY2cvM0tMZ29vbTZadFZzUmdWVGRMSWwzNHFldm96?=
 =?utf-8?B?dk9WRjZlaVdHc2NPVGN5OFB5RnlHTSthRlNBMnpFZVcvTUwwdDZ1Kzl3dW9S?=
 =?utf-8?B?K05oM3V5Nk9KSVRaMGJTcndBTUdCTHgrS0dwSFFpZXVZMWFPQXphSGxHcHNZ?=
 =?utf-8?B?aGtRN1JaQ2FCWXBGYTcrWldvNVRYUnllSEZFRURJOThPczVidUlQbDZCaHU1?=
 =?utf-8?B?S3ROOGhrSTgzMzhFS1dnS1o2REF3czB4ckVXZGJBR3dPcm9SbXlSeDNkT0xo?=
 =?utf-8?B?aUVEWE96NHZ5aENFWHhSbCtNWE5NdmhTV1hIdnhhYVYxV2JhWjBIRHNQaGp5?=
 =?utf-8?B?UGlrMnFTWUVYVHJhVXdETnV5ekxwSG1XTHBVSTVUajlKQTNPUElHc0ZMVFRs?=
 =?utf-8?B?dGIvYWVGRWZNRGVpdWg4RExDbkFjekt5d3MvNHcvYzFzY2Joais5VzNVeFkz?=
 =?utf-8?B?ZU5tYjBqMDRqLzUyZ1JkbEJlZUZWNW1OUm9uN3pjK0pPZG5UdTQzQ3FsTXIy?=
 =?utf-8?B?S1hoYjVXRy9NdUQ3L3l0eUJXdWtXSlZ5N1drV1F3bmxzVDdkcmEvNWZ3K0J0?=
 =?utf-8?B?My82bGJOREw5a1F3bWR1L0VHSEJvNkxPaFNRdU9VM0tFYmY2dVhwRXhWb01Z?=
 =?utf-8?B?WUM0SXozSmRGMS8rSzh5RklCd2JJSWc1ZkovRDI3NUxPTWVLUG5CZHJXQ09V?=
 =?utf-8?B?V0ZsTW90WmdWR1lyR21RSUVKQTBhT1M5dWFwMGd1b3VHZFdUTHd6all6bXlz?=
 =?utf-8?B?dzVXOGxNQVpOQzYwcnhwenFBVFZDTlc3QmdHY015YndzVkc3dEt2bVlhbTRQ?=
 =?utf-8?B?WW5WWWJRUUdTa0lacjRFNmFVRzhLVTBlUnV0OVY2VHVFMS9XNnkzeVZkOTJP?=
 =?utf-8?Q?EXX8O0Rxd7kRP0btI4rF4Sf5i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b93f765b-08c5-4aa0-6f1c-08dc2e5e0133
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:40:46.3176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWSyuPn2bQR1DPzNGxst6HU5hOb4pQsZRmjkKNDLyebt6l9AKlS7LjCFZx2ZGxAkMWpwtjIEI9bo6iz6e37fSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
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

On 2/13/2024 23:24, Daniel van Vugt wrote:
> Until now, deferred console takeover only meant defer until there is
> output. But that risks stepping on the toes of userspace splash screens,
> as console messages may appear before the splash screen. So check the
> command line for the expectation of userspace splash and if present then
> extend the deferral until the first switch.

I think your comment from the earlier version that this can still happen 
on simpledrm (albeit less frequently) is very relevant here for the 
commit message.

> 
> v2: Added Kconfig option instead of hard coding "splash".
> v3: Default to disabled, not "splash". If enabled then take over on
>      switch rather than on first output after switch.
> 

These you'll want below the cutlist (---)

Also I think you should mention in the commit message that the 
indication of a userspace splash is set by the Kconfig.

> Closes: https://bugs.launchpad.net/bugs/1970069
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
> ---
>   drivers/video/console/Kconfig    | 12 +++++++++
>   drivers/video/fbdev/core/fbcon.c | 44 +++++++++++++++++++++++++++++---
>   2 files changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
> index bc31db6ef7..2f9435335f 100644
> --- a/drivers/video/console/Kconfig
> +++ b/drivers/video/console/Kconfig
> @@ -138,6 +138,18 @@ config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>   	  by the firmware in place, rather then replacing the contents with a
>   	  black screen as soon as fbcon loads.
>   
> +config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
> +	string "Command line parameter to defer takeover to first switch"
> +	depends on FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
> +	default ""
> +	help
> +	  If enabled this defers further the framebuffer console taking over
> +	  until the first console switch has occurred. And even then only if
> +	  the specified parameter is found on the command line. This ensures
> +	  fbcon does not interrupt userspace splash screens such as Plymouth
> +	  which may be yet to start rendering at the time of the first console
> +	  output.
> +
>   config STI_CONSOLE
>   	bool "STI text console"
>   	depends on PARISC && HAS_IOMEM
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 1183e7a871..e5d841ab03 100644
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
> @@ -3348,7 +3349,7 @@ static int fbcon_output_notifier(struct notifier_block *nb,
>   {
>   	WARN_CONSOLE_UNLOCKED();
>   
> -	pr_info("fbcon: Taking over console\n");
> +	pr_info("fbcon: Taking over console for output\n");
>   
>   	dummycon_unregister_output_notifier(&fbcon_output_nb);
>   
> @@ -3357,6 +3358,27 @@ static int fbcon_output_notifier(struct notifier_block *nb,
>   
>   	return NOTIFY_OK;
>   }
> +
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
> +static int initial_console;
> +static struct notifier_block fbcon_switch_nb;
> +
> +static int fbcon_switch_notifier(struct notifier_block *nb,
> +				 unsigned long action, void *data)
> +{
> +	struct vc_data *vc = data;
> +
> +	WARN_CONSOLE_UNLOCKED();
> +
> +	if (vc->vc_num != initial_console) {
> +		pr_info("fbcon: Taking over console for switch\n");
> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
> +		schedule_work(&fbcon_deferred_takeover_work);
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +#endif
>   #endif

Once you start adding nested #ifdef, I think it's very useful to add a 
comment on the #endif to make it easier to follow the code.

IE
#endif /* CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION */

>   
>   static void fbcon_start(void)
> @@ -3368,8 +3390,18 @@ static void fbcon_start(void)
>   		deferred_takeover = false;
>   
>   	if (deferred_takeover) {
> -		fbcon_output_nb.notifier_call = fbcon_output_notifier;
> -		dummycon_register_output_notifier(&fbcon_output_nb);
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
> +		if (cmdline_find_option_bool(boot_command_line,
> +		      CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION)) {
> +			initial_console = fg_console;
> +			fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
> +			dummycon_register_switch_notifier(&fbcon_switch_nb);
> +		} else
> +#endif
> +		{
> +			fbcon_output_nb.notifier_call = fbcon_output_notifier;
> +			dummycon_register_output_notifier(&fbcon_output_nb);
> +		}
>   		return;
>   	}
>   #endif
> @@ -3416,8 +3448,12 @@ void __exit fb_console_exit(void)
>   {
>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>   	console_lock();
> -	if (deferred_takeover)
> +	if (deferred_takeover) {
>   		dummycon_unregister_output_notifier(&fbcon_output_nb);
> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
> +#endif
> +	}
>   	console_unlock();
>   
>   	cancel_work_sync(&fbcon_deferred_takeover_work);

