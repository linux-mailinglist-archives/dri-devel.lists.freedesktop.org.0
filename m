Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFA5A85C7D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 14:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29FE10EB85;
	Fri, 11 Apr 2025 12:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uQnc7HWA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A75A10EB97;
 Fri, 11 Apr 2025 12:09:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDAp2WZaZm5jhcYbu5iQbDyeE6bkEQ/PjoQ8mPHKbmvVWG199lYp/FIZVr4uHmzbuicLxKNrs83hZwRSsQ5/Axyeso2h7+0H0WZvhiwwFKRCKnegYLNACLkjXZDMGdItWZ+yfxoBzY/akwvXwLd1l4glB3NFoGTBq+oUBVY/5quxWb8LM4o58YRe3Fqi3Y9tnegqksEqkbnsiHgNmpTDi9dkKL6dWbW3bKoITCJokPxMXcHRag3/LBW7r/mXR52vamVjZiFt7lB088cjPYkYM7fUNO3I+qeb2UQPWTIah5FyGSJpj7QI/lcP5l7bO6Ayt+bEiKwQyW0Iz/daWH+G6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0GssiOZZXVc3itm+w2h/33CWpHlF1jFD7vEv+03Yus=;
 b=F4tkuGcOLyKYzpu5YrAIVKwBy+OASB+TBcUaxpKW9kUpZwAY9A7S3AtCr1vpS50aMpjye0XdG6JFyXAvL3l//ILAGpWlFeWSuRBCJ+DUT91gAXdw+6E9cWkoqyul99xZo8YYqOkaTgV27eHDuZ3P7ZIs1SVsb7kN8UAJdQQ06gG08k//CxHupIpZ/LhkGTZwamYW5iARzqhqRlhQEMkfZ6nZ08c5GPxkh/192QyQTLliazjXKIagJlsUR2PIWlOR80SvWe0nFBe8s+ou2AAu+7TifpGgP2zvhhJt5ntlHYTndiuCHazQr0Vo/0B9qDSAXZsTU0/3kI8pT1hDLf+BvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0GssiOZZXVc3itm+w2h/33CWpHlF1jFD7vEv+03Yus=;
 b=uQnc7HWA10fRcC4G75p7if2g1BGFxJwMpIzG3YG/T965dfZvOQV7B/TJ1EAF14VyhTqExrmx+LJuxTRra872qEFMvZzP9NO7EIkE4taMVpY7x0tHsqqMhVDq9c4XQAXYahpJ3rFv/IlYJB8kAHOFT9j/qBqG+whkW2TwkkbvNtI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7027.namprd12.prod.outlook.com (2603:10b6:510:1be::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 12:09:48 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 12:09:48 +0000
Message-ID: <15b041aa-f87b-4e8a-8144-cabd07e19001@amd.com>
Date: Fri, 11 Apr 2025 14:09:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: function to get process name and pid
To: Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
References: <20250411112622.4075526-1-sunil.khatri@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250411112622.4075526-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::23) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: 106f8bde-36e7-4aa3-77f7-08dd78f1c138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0VhcHA1M3lLYVZmdUZwMytlRzMzV0loQ20zQm1FWFc2NXVTK013U0FjT3JF?=
 =?utf-8?B?RFd1RU44em1PdmZRZVdxbVo2TzBVbWdvWTBVbEt3TXdUUFlIc2NaeU5scFRr?=
 =?utf-8?B?b1pEOTM0ZTZiaXQvOVg2dkN0QTdJaDFCUnRJOU1jVit6SFhnN1BmUzNYRnhU?=
 =?utf-8?B?ZjNCd2J6a1E2VmgwVitFckh3VXhSZFdQZlZGdXhlUW1pMU9zeTZwSjVud01y?=
 =?utf-8?B?SytNanFyckRHOVg1THhEbURkQlVrNW40NEx0U2pmNVZVam9tcTUrNHJROXg1?=
 =?utf-8?B?ZldLTnNnSGxIaE9ZWUZpaFBYWURVUE9DVnJwdmtOQm9RMkptejNLbHN3VlpK?=
 =?utf-8?B?SUUxdUJjaTJYVDUrMVJzUU1LaW0rSWxFVGNBdUpJN0NCcy9wcjJsSXp1bXJm?=
 =?utf-8?B?bmE5WmVyOWZ4RHBoK0RKdlF4aytyeFBiVGpxNHU1WmQ1WTRHQmFtdlhkN0lx?=
 =?utf-8?B?RDQ0ZkV4TWg4Zi9IK1UyTDJGZ0ZyOGRkNnIvVnllaU1CSjZ5d093OTFxVkhq?=
 =?utf-8?B?a3kwQy9BdUVNamJ1QThwREUwZGJkMWx5bjNGcEQ3MEtQWWRaL0NaNXk4eEJ5?=
 =?utf-8?B?MnNuVWs5RGdwQ3NnWDhPcEhkdmR5S0VVUTVVSmMyZ1UxWllDVGFjc0hYNGJT?=
 =?utf-8?B?M3VmNDNFak40TGpXNU9keE4vS1RuT2gybnpaUVJROW0yeUhmdWFvQWR4d29J?=
 =?utf-8?B?ODBPUVkvdjVUa2twQXpnZm5ieTF3cWtnRm9hRTc3OVVxRjg5Wkd6VUpsTDRH?=
 =?utf-8?B?amtQL0R3SlIrZCs0N25JZzBHSGI0ZXEvSnhjZXp5OFphK2NPUGhaa3oxMi8v?=
 =?utf-8?B?allUV2ZWWnpXTGNDYzlFRHFuSUdaazlEQm1CUmlwQ0JuVG5oMnBWSjBOVGhF?=
 =?utf-8?B?RStBbnFRcVo5YkJzV1dsbjNUL0dkeXlTRWJOM3NuejNtdVpDL3ZtblRRTGVG?=
 =?utf-8?B?aW01S09vRko3SHh0aDlXRUdMUTJxNExOK0NOZTl1dStIYXpPTms4K24vQjJ0?=
 =?utf-8?B?SS9ESi9oTFRxUUlYZnplZk9hc3gvdTM5Nkc3Wk1aRXdWZjkxZThVK0pqdDd6?=
 =?utf-8?B?UVJYam0wYjdZaGMxYTlQNEhqK1BYNFVtcmdiWUl6NEFBWGE0QldlbVQwcWVn?=
 =?utf-8?B?ODlZc2lwZk5yZUtseFdLd2tjT0NTc2xXUFVBT0wzV1pXbXhOa21KVXBZOHZt?=
 =?utf-8?B?V0hjYWxYenc4UjNOQm1jcW9CZ0pFVUtQcmVJR2pCbmFuYUtIZzhGeVlwMUZB?=
 =?utf-8?B?NmUyYTg5MjZWalZiSklKdWo3VjZmT2tKVVQ2NEdvTlAzQnJwekwxN1pnNTR3?=
 =?utf-8?B?N0ZVK0Zmb1Izck5FN1R2cFFnYVMvS2NLQTNndE1sN0N5TldFN25DWGxkZWVz?=
 =?utf-8?B?NTRhRTBNemtzSDMwZGlFYlBITDRpVVFnbWROd0xtcFE0ZVFxcG0rOFlvcGNU?=
 =?utf-8?B?RzhNc1FvcGo4NThWSWJSNW90QUNxeXhkZnJIQ0J3aE5BNlkyeHk4b0tWNTNn?=
 =?utf-8?B?MmtwTU9ZMGtUS21kWk52MysxOWxBNDdBanpPRnF1RmpZbmhYSHFMM0tQVHp1?=
 =?utf-8?B?UllCMS9FSUpGcElwNHBCb2FJUEp4dXZhbG1uNXV5WHp1TmwrZDBHcGN5clJ2?=
 =?utf-8?B?ZktJd1NBaGk0blZCVWtiNE9Ld2lydDFadzhSNXp2d0NLaVFUOUJpSHQ3V25Q?=
 =?utf-8?B?b29MOHRkM0oxTWtCTnQxd0FNYkZxRDRFbjd4ZWFkTHRibDk2QklycnVheUY5?=
 =?utf-8?B?U29USWpSMXZTNUk0OWdJQXVVeW0vZkF1SW1PRmRNQnYvdDBtMEJqcFlucnNn?=
 =?utf-8?B?a2Q5V1hmRm5kSXhjaGEwdVhtM2pPVllkdmNicTg0SWVJYnJIeitzRWhmVXc4?=
 =?utf-8?B?WW50N3dGUDkvV08veEx2aEc1K1ZIT1MzTnhkUTJGZHA4WEszam9EaVkxdllh?=
 =?utf-8?Q?UbFOfnlLCEY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXpDdDZ5L1hrK0JwMkdGeDlXbkk5cytHWnNBY3QvVzc4dGtBNXRrNXpVaGNC?=
 =?utf-8?B?dkNyWVZ4UmhCWEhlMnB0RnBrZmtidkthSHRVWUlEOFlhUk5OeVpqK0c0SG1l?=
 =?utf-8?B?UWZhMEQ0YlYrREptUnczTXI0UFhuajFYd29FU25YUUI4RDlEMlUzNU9ESDMr?=
 =?utf-8?B?ZGpnWUJLdlh4bG5idzV4bVFySk9kYVEvL20xWFVlL0pEeEI1S1JIaEJXOW12?=
 =?utf-8?B?c1k5L0NRc0dJNmcwQlNkZ3phU3lDUmxvM2NyN1lXeHdwb2t3YVdvRjVSVnBK?=
 =?utf-8?B?L3RHWTNqZkVyTzJwSE5iMXF2aG5pdGswV1ZRL1haR1ZtanBvblJzRk5XWWgw?=
 =?utf-8?B?Ny9kRzZiTGJLbjRad3MydkphYWQ3ZVUyRVEyVjMvZUJpNHNnOEhtQ3BUTTYx?=
 =?utf-8?B?Zm15bW1UdUZBYVM1ZDYwUWY3NDZTVUduVXQvV084QVNUT29tNlhEdXFhSXpG?=
 =?utf-8?B?c0U4SVFpcmxkUE5jcHpBdjFKTk1rUk5UbllVQkZVcjMwMG83NGtYSStJZXVO?=
 =?utf-8?B?OEpVZHpLclA0RklyZU5FSlpCay85bWcyUmJoc09ZVU1pZUo5ZVhGUkFwODVr?=
 =?utf-8?B?ZXBXWU5vK2huaVRiSlowZ1ZvZE5SOFRIR01SeU5janlnNVd4WnZlY2lGWlB5?=
 =?utf-8?B?eUhRbnYrVVl1a2poR1dCbXNGTzFIa3BZRUt3SXFibmtjV3RRZUpEM0Vwei91?=
 =?utf-8?B?a2duS2FDWmxrcmpZdG1wQ3JRcDBrVys2d2owWXlOTzZYUlV2QUthREZCZi83?=
 =?utf-8?B?OXFKMHM2aW5RTzZjcGg1NHpqZmFlMTE5bGhMb0FrQ3U5VFF1RkF4dUQ0V3h1?=
 =?utf-8?B?Zy9PQVJXL1Q3OHRROURYRTltRHo2QjNpVmxHcnZSTFdKRmhBb2ZPYmp6MXJw?=
 =?utf-8?B?TkJrTVVqZWhjK21Sb1NhVE41WlR4QWc4c3U0VzdUSitRcG1IQmJlV2svQWJL?=
 =?utf-8?B?UkJlOWN4akpCNzd3UzlYcjNNd1VreUlmVWdBbjk2L0RYRTVqNWtRdlNkckhC?=
 =?utf-8?B?azEwQTZFRUY3blRQc1ZrM1hCQ1FnLzBxL1BuckgxSm1ja1B6T2gvUEtjMDdE?=
 =?utf-8?B?cEpmSVRFUGxEdjVOY1d1OTFCN09rZG0vS2NXQWFJYjM1MXhvSkkvNW1lRkxV?=
 =?utf-8?B?SHJkcDk2S1FhRGZqWkZmWkVVdDdRcmdHR0xRaWtzZ0FidGhzL3ByKzM3RGdL?=
 =?utf-8?B?Y2xVNHpjaWxYTUFoQnpsWmpNZGlJcnk5VHlIaE1VKzVBcFlKNGVYU2tIZ2lN?=
 =?utf-8?B?SUlCU2ZaTWJPd3R4MnBxRElmNndXWkVKeHROVk9XNGpjT2M5VGlGTTc2SXVI?=
 =?utf-8?B?ejdMMHVIMm8zZzdqY0k5VVhaYjNCbUl4SGlTYjNqcll5MmVYNTBwTFdMRkpD?=
 =?utf-8?B?bDkyMGg2MnVqT2hUdjdFUVpGSXdLQzUydVRwbC9DUXNZa1Era2lCbkUzTm94?=
 =?utf-8?B?VGNuU0tOeFpLVC8rZnRZMk8yYkhEeVFZRGlzUWtwL1RjLzNJWjFPcVJCQ3FX?=
 =?utf-8?B?eWpXLzlkTnU0djVGZXVaREw2eXBTdVppc3djUjR5M2JRUG9GUnBOT1B3Z3oy?=
 =?utf-8?B?bFQ3NFY2eGpIZVRJOXJIZHp6Y0h0Z3VsYmIzMVpnV2NZLzFha09sa3JMcHZM?=
 =?utf-8?B?azloZG5ZYW9BMWk0ZktsZEVqZVJEUlhKUTFwdmlsNThIYVZHcmZ0clp4Smhh?=
 =?utf-8?B?VURHQlRrWVVuUjRJZ1dBVVdXN3J4bU5nd3phdTJNRTRJckY3VGs5cCtHWVlS?=
 =?utf-8?B?L3prKzAyN0JjV1Y3OWdFWWFZb3A3ZUtkMS81WjBXYVVja1Z4S0hYcFRtWENl?=
 =?utf-8?B?eGw4eFN6WVN2TzV6WnBHNWxucHQyV3RLR3FHN2llY29qSXFzS3l2WFJwQWF1?=
 =?utf-8?B?UTZMajJWc3NSc1BHVE15emltM0wwU3R5UnlGZEZjY09OdndaWUgwYWJvbnFU?=
 =?utf-8?B?SkkyYUhYN2RTN0FycG5rMXpiekFPTWVTVG1OMU5VWEIyU0Z3aGZMTzdXQStF?=
 =?utf-8?B?dlp4QWl0bVI3bVJ3STU1RTNsTnNaZ1FjTCt6a2tuNTUvaEM0bGswV3o0QnA3?=
 =?utf-8?B?emhzRmx3bUFtOWxLU1AwdGFIaURmQ1V3REpYM0VQc1UzSDd2ZURWWnVaTkx4?=
 =?utf-8?Q?VMNPSMEvJW2f9CBbC65LG4+jX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 106f8bde-36e7-4aa3-77f7-08dd78f1c138
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 12:09:48.3251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RfWf2gVF4VgcjI9NTveEqLgRMmH/FNvzWy0f7K77Z9O7z3GvotVfpucSpyCzaAQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7027
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

Am 11.04.25 um 13:26 schrieb Sunil Khatri:
> Add helper function which get the process information for
> the drm_file and updates the user provided character buffer
> with the information of process name and pid as a string.

Hi Sunil,

you need to send this out together with the patch which makes use of the new function.

Regards,
Christian.

>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  drivers/gpu/drm/drm_file.c | 30 ++++++++++++++++++++++++++++++
>  include/drm/drm_file.h     |  1 +
>  2 files changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index cb5f22f5bbb6..4434258d21b5 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -965,6 +965,36 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>  }
>  EXPORT_SYMBOL(drm_show_fdinfo);
>  
> +/**
> + * drm_process_info - Fill info string with process name and pid
> + * @file_priv: context of interest for process name and pid
> + * @proc_info: user char ptr to write the string to
> + * @buff_size: size of the buffer passed for the string
> + *
> + * This update the user provided buffer with process
> + * name and pid information for @file_priv
> + */
> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size)
> +{
> +	struct task_struct *task;
> +	struct pid *pid;
> +	struct drm_device *dev = file_priv->minor->dev;
> +
> +	if (!proc_info) {
> +		drm_err(dev, "Invalid user buffer\n");
> +		return;
> +	}
> +
> +	rcu_read_lock();
> +	pid = rcu_dereference(file_priv->pid);
> +	task = pid_task(pid, PIDTYPE_TGID);
> +	if (task)
> +		snprintf(proc_info, buff_size, "comm:%s pid:%d", task->comm, task->pid);
> +
> +	rcu_read_unlock();
> +}
> +EXPORT_SYMBOL(drm_process_info);
> +
>  /**
>   * mock_drm_getfile - Create a new struct file for the drm device
>   * @minor: drm minor to wrap (e.g. #drm_device.primary)
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index f0ef32e9fa5e..c01b34936968 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -501,6 +501,7 @@ void drm_print_memory_stats(struct drm_printer *p,
>  
>  void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
>  void drm_show_fdinfo(struct seq_file *m, struct file *f);
> +void drm_process_info(struct drm_file *file_priv, char *proc_info, size_t buff_size);
>  
>  struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
>  

