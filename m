Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBp+H3b6oWlkyAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:11:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8BB1BD51F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 21:11:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BCE10EC31;
	Fri, 27 Feb 2026 20:11:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KQQyq7P0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012041.outbound.protection.outlook.com
 [40.107.200.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A243110EC31
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 20:11:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OjJo8ThWwKf0uNmNSs7OqWKvyeUbWE/kkx4rXdjUwQsxu74ogh5YfyvqaX9DJFksdByH+TPDh/lcdG+5ZsPLRMoVThxyVDiahB86blN53Ca4aI4ueLUk78OGkwRMK8jo0ZGIcfPgEnfb/W7tGbBXLkR7CuTabGNAfLCZ6LVG5rgQg4WCF3k/kkFHIUwi5KHCuWlxr6+rWUOlT/lyc16Qw/tzn/FRehbeOJS2A5n0t/Xlz2jG/ChX55/csXJNogabKfyGsQrej0ClDDfDj4yCuq1TdIGSYklncSFaAGVznSCLU7tKAWAJusUKie6N6dFsjTr5iRVsiX+VcT30VES/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfEDN7TB8mLW9g5CduBOjiw2PdQY9a5/FXMXbs+CTDU=;
 b=CiVv+lABvAzSPC6eWYeguM6gaxxUASO+pkG/fbmMVAOK759BNwyRAiYO8p1qorJfzPP5B9Ca/nvxvzrd3ZYQZSZ0v9JNtYrt+on0fhik8zUsheKqspZ85ORaJWm+/f5UXKVtLfcSZYtramT0j2r1l6+yQ6S3iKd4y0WFga2i8bvR80DVUdKNUPGpz215iG2i7QzD9xTuiwjM3MZfD8woGIF6scy4pIYy2YNGu/1NvqDWxDanZ/klhNfk+kDpixU8ROy/6RjA4b/3ToxfSDE7LHaWnt+AomQZBRHnExof5I0bYOwFAzyQ1K9MldGo62fFTFdbKlki8BOqEmf/7fwQyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfEDN7TB8mLW9g5CduBOjiw2PdQY9a5/FXMXbs+CTDU=;
 b=KQQyq7P0Kh76KKNtUrobk2Ue7qC04wVvBHDS7BbvM5yEd1v9BBJoVLHmjJJ0NUotyUOLUFWG8EKCxPhtoFAGN9UAGjEb5Pc7zD7gN6+9+VJUIvaBROVxqi7+5LRtdUGl1bBk4xf3jM8DE6yKRNtLcilqM92s4Xggwen1EiN8jEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by SA5PPFD8C5D7E64.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 20:11:25 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 20:11:25 +0000
Message-ID: <e666947b-30b7-444c-9400-966009373e8c@amd.com>
Date: Fri, 27 Feb 2026 14:11:18 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Fix NULL pointer dereference of
 mgmt_chann
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260226213857.3068474-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260226213857.3068474-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:5:3b5::17) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|SA5PPFD8C5D7E64:EE_
X-MS-Office365-Filtering-Correlation-Id: 2721c091-2d45-4e34-5f9f-08de763c620a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: lJ3MQtYRIrFtQpiWq5yPw20rhcReoKZvgGHeOSsNAjhFyzaJsRYdi8553ek/bJrCjazBhGSkljLV+bJpCOn0ajEjK9r6QfazuTdassTOiKN9tITaAhzqom82Bn39aCaeTKX3WaVgoYsKnWkJRPvpIZnDuq+rayHyXWWc9AhSjABybsOoEuIsP1wGNYFUr5QRjPAAO8ye97bEiMhV6KpLJ3Tw1CaC2DwsVy+Ag22yYg45rSyt3e55o8TA8HEwUt5mdl6/UnOQHPv12vOQkiyWzlKhKor1vlfhTtEuUKZSZoRbeTQFUjBxbFiG7CCs35tz5XOiEFCIS9xvFqMlgy0CX9UXpDvZalTag89n3eTAqF7nz3TtR/0zHEK0T18CBVasbRaJ7Cb58R3XRfdfuQkqgzBn8Co/ylnJXkoSSCDEmqL4wKkfVfyEmU2cdspYPPXhkrmFbNWoMzeEL1os0A7jzZKoBvGaHMT32O0rPGn1P/3LM2jlsnJSVCZHpftgTGrBNqUpoU3VhFmOdmlAEaqd7NPaRBzrAU2sx58FxtH0fVYtvs18ROam6K1jo3hJE3j7L14cyGSQUJ6k3FF87WS6Whbf6bTTmjedSFVXkCDE66ib57CdtYVbc5WjFcjcXlitLNOPieJl6MhBOpuXUbPc/Ohn/TVnNpyqFlATE11N1tDKut5xQZuf2mMY1flysdcNQgbdT+S4ppHtVbylC9mDvtSZiGegwdCeKe5wXTvgyqo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUU5MFdmek9mY3RudXNLdkEyNUNwWSs2SFhCWnJNeWQ5UkNUWkRhRjQ4TDlR?=
 =?utf-8?B?dEZpbk1WSUE2QnJxd1dVbGY4K0R0YUFKNmlrRXBZZzdZU3FqL24weTJCdnR3?=
 =?utf-8?B?Zkozall1bEdFeUF5bXltTUIxWi91RFc3UUVONy9ISVlkNTBaMCsyVjg3elVQ?=
 =?utf-8?B?YjZjdVBpZ0J0bk5RYjNLRFQ3NmY3SWc1VVdIS2U3cFVNb0FybHNBWFRiTUJv?=
 =?utf-8?B?blFycTNHSUpTRkRybmRHVk5EL0xqdUY0T2wzd3JhN3ExaWFTN2JVenF3YkZv?=
 =?utf-8?B?Z0h0OUg5WEkreTFUOUZabXZSWlBkY05HSlU4N0txNkV5dzdickRTL2VoYWZT?=
 =?utf-8?B?WDRGUjBnT0E3cXptV0ZqTDhSY2lzYThrWlBpbWNuUDhKVEp3RFR3ejZBN0lI?=
 =?utf-8?B?RmlsbEIwVW84RTllN3JZaWl1OVM4UGZVdG1wVGhwTy83NTQ4cFBTd3dubUVD?=
 =?utf-8?B?MVpSQUpIWnNjNTFnT3Zjbkt2dVBtK3BZZkpXaEtwM3NrWEdwSE5uUmJyWnQy?=
 =?utf-8?B?S0xBdSsrRUZPcGVxbVg0Zk15MFVRQ2ZRQUIvR3dMUDVQNEFqbVlvTUxqM203?=
 =?utf-8?B?ckRKc2FsUDZkL1pwVVg0OVBtSzh0SnFIdmtUQVkwMStoemtoZEkydDFTQVMw?=
 =?utf-8?B?dVk2b0ZqWVZEUWRpSjBsMGZtN2dHcmF4RGtFaTZGY1NqN0U4aWhNRUJjTm5i?=
 =?utf-8?B?bHRUOHRZaDdSMm56aldjU0Q1TVVCRkFwdEtCSjkyZnVpZWVyWFRycXAxcFZF?=
 =?utf-8?B?YVBQK1VjTG1Cd3h4WTVtOVpaZWhlNVRBcHBHTjFBd2tRNkp6THFkTkZ1eTV4?=
 =?utf-8?B?Rjc4MjRRQmwvZ2lnZmNoTlRwSnRDWXRsYWg5Uk1nTytJTW1zdHRhMkErQW5p?=
 =?utf-8?B?QXBYWWx3b29DNmx0ejV5RDlXakJSd3Q4S0Zmd2p1WlBCeE40WFVQTWVKaDlJ?=
 =?utf-8?B?T0IzU3MxTmZtMkNIWGUwNk5ZOVZlTjlMdVN0RWVPTUVyL2ZvL2hGb0I2N0E5?=
 =?utf-8?B?U3VDSGI3UlFTRHhiMTMyemFOOUdSSUw0T25WUVltSFVGVTF0UVk2Y1lQLzZN?=
 =?utf-8?B?N29YdkNZcThUTVQ4M1dpQ1kvNnJEaGcveXN4SmxZZWlEZnNXVC9EdXlUN3BN?=
 =?utf-8?B?R0EzOUx5U0VuL0NIelFhSmJ6S0wxYklIZUZESmNRN0lYRlJaMTFJbjc5WGty?=
 =?utf-8?B?RExjMmgxbmlKVWpyWFZaUThaRS9COTVURVowWWhpWE1LRjBmb0xLMTBRNXZM?=
 =?utf-8?B?RjArMm0wcjFPS1lYcmZGallncXduQUJrQTNnOEVkV2N6cjd0QlRXblRZbVdl?=
 =?utf-8?B?YUJ1azFnWVZOT2t5SFVqNUVCaytFbzBSQnB4NDlLZjRKZ3RQWFAwL094S2x4?=
 =?utf-8?B?dGJQWFdheE8wRksxL0dFU0xxRWUwNzdWVll4SXFoYk8vdWsyTXFCRkFvU0tT?=
 =?utf-8?B?NmJwRjFvZWhYS2JSYWVmUi9HM21SNWRkQjM2aEt6RmFIdVVZNVVkS2Nwd3hR?=
 =?utf-8?B?SjRPUmpOb25Mb2ZRYWppUzRuNGREaDJlWm5oZ1NuRUdpZHpqdEtpaE12L1JO?=
 =?utf-8?B?WEhhVC9YanQ4RERzVVhQZEJsc1RJL0R6ZjZUZHEwYWpjalFpbC9Bd3hDZlR2?=
 =?utf-8?B?amEzVVhyZnM0SGp3cmJ6ZjNCd0EzbXMwMjF5c1ZLRkpxRUFaRDgrNFplT05n?=
 =?utf-8?B?Z3Y5d2xhRWpUSmpZN1Q4dXJuMjRMRkNvUXdhakkzY1JZSTlzbXJEVmE1OVFN?=
 =?utf-8?B?b2dybGFOb3ZIbFBITHRVZGo5cGl1RDhOT2NsZ1FtdTdoc3ZadlZIK2FNUVJH?=
 =?utf-8?B?cWpQYlR4TWJtMHVGd0s1b2xEVUJkRWVWM2k1c1FHdDl6SUZxOEdhcEszRWY1?=
 =?utf-8?B?c0tFb1JOVjQwdGgzeW12T2JGS3M3QmhOWXN0U3U5WVhNS29LbGpQU3RJVTVR?=
 =?utf-8?B?L3FFWHVocDZuUUNSNVFETlpJTWt1a0JCZmFiZEZsNC9Od1MvODJLK2h4ZHVh?=
 =?utf-8?B?T0lMQWt6ejcwdHNKaDIxaW1yTmJKOUViYUM4RlF6T21uK1VhdkVpL0xTd1pK?=
 =?utf-8?B?NTI1UDAzTk9HOURwQzAvSUVqU2ZHbnRxQkFZbDU4b3ZieGJZUzVselZwN3ZM?=
 =?utf-8?B?VUpEazNpUVl4eDl3aHp1L2VJM2Vkd2p5VklGV3haQmJhWVQ4bHlKaEc4VWU3?=
 =?utf-8?B?MWNQUkVrNkw1NUFQRGtvVUVzdHNLV0lZNXpxaXdBZk9oc2djM1VUdmxTYkZN?=
 =?utf-8?B?L0UzVmN0MVI4Qkl0NkpZeHhBYTZDZkQyZXhKQ3I4QUZrSW91eGw5VVRHMDlE?=
 =?utf-8?Q?Lj5hP+bvYqmbH3JS8H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2721c091-2d45-4e34-5f9f-08de763c620a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 20:11:24.9792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8GwJBr90m/DL64urLX828KfpHYyhrvcDzPywduxJ2Ghb8pWHeIKHb/IoX5EjT0wAS6192N0QSBiy52UYmHwvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFD8C5D7E64
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lizhi.hou@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mario.limonciello@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: DA8BB1BD51F
X-Rspamd-Action: no action

On 2/26/26 3:38 PM, Lizhi Hou wrote:
> mgmt_chann may be set to NULL if the firmware returns an unexpected
> error in aie2_send_mgmt_msg_wait(). This can later lead to a NULL
> pointer dereference in aie2_hw_stop().
> 
> Fix this by introducing a dedicated helper to destroy mgmt_chann
> and by adding proper NULL checks before accessing it.
> 

Is this actually going to fix it?  It sounds like a concurrency problem, no?

Do you want a mutex in the helper perhaps?

> Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/aie2_message.c | 21 ++++++++++++++++-----
>   drivers/accel/amdxdna/aie2_pci.c     |  7 ++-----
>   drivers/accel/amdxdna/aie2_pci.h     |  1 +
>   3 files changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 277a27bce850..22e1a85a7ae0 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -40,11 +40,8 @@ static int aie2_send_mgmt_msg_wait(struct amdxdna_dev_hdl *ndev,
>   		return -ENODEV;
>   
>   	ret = xdna_send_msg_wait(xdna, ndev->mgmt_chann, msg);
> -	if (ret == -ETIME) {
> -		xdna_mailbox_stop_channel(ndev->mgmt_chann);
> -		xdna_mailbox_destroy_channel(ndev->mgmt_chann);
> -		ndev->mgmt_chann = NULL;
> -	}
> +	if (ret == -ETIME)
> +		aie2_destroy_mgmt_chann(ndev);
>   
>   	if (!ret && *hdl->status != AIE2_STATUS_SUCCESS) {
>   		XDNA_ERR(xdna, "command opcode 0x%x failed, status 0x%x",
> @@ -914,6 +911,20 @@ void aie2_msg_init(struct amdxdna_dev_hdl *ndev)
>   		ndev->exec_msg_ops = &legacy_exec_message_ops;
>   }
>   
> +void aie2_destroy_mgmt_chann(struct amdxdna_dev_hdl *ndev)
> +{
> +	struct amdxdna_dev *xdna = ndev->xdna;
> +
> +	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> +
> +	if (!ndev->mgmt_chann)
> +		return;
> +
> +	xdna_mailbox_stop_channel(ndev->mgmt_chann);
> +	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
> +	ndev->mgmt_chann = NULL;
> +}
> +
>   static inline struct amdxdna_gem_obj *
>   aie2_cmdlist_get_cmd_buf(struct amdxdna_sched_job *job)
>   {
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 85079b6fc5d9..977ce21eaf9f 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -330,9 +330,7 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
>   
>   	aie2_runtime_cfg(ndev, AIE2_RT_CFG_CLK_GATING, NULL);
>   	aie2_mgmt_fw_fini(ndev);
> -	xdna_mailbox_stop_channel(ndev->mgmt_chann);
> -	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
> -	ndev->mgmt_chann = NULL;
> +	aie2_destroy_mgmt_chann(ndev);
>   	drmm_kfree(&xdna->ddev, ndev->mbox);
>   	ndev->mbox = NULL;
>   	aie2_psp_stop(ndev->psp_hdl);
> @@ -441,8 +439,7 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
>   	return 0;
>   
>   destroy_mgmt_chann:
> -	xdna_mailbox_stop_channel(ndev->mgmt_chann);
> -	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
> +	aie2_destroy_mgmt_chann(ndev);
>   stop_psp:
>   	aie2_psp_stop(ndev->psp_hdl);
>   fini_smu:
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index b20a3661078c..e72311c77996 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -303,6 +303,7 @@ int aie2_get_array_async_error(struct amdxdna_dev_hdl *ndev,
>   
>   /* aie2_message.c */
>   void aie2_msg_init(struct amdxdna_dev_hdl *ndev);
> +void aie2_destroy_mgmt_chann(struct amdxdna_dev_hdl *ndev);
>   int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
>   int aie2_resume_fw(struct amdxdna_dev_hdl *ndev);
>   int aie2_set_runtime_cfg(struct amdxdna_dev_hdl *ndev, u32 type, u64 value);

