Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPgKE7BRn2k7aAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:46:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06619CE45
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDF410E376;
	Wed, 25 Feb 2026 19:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xhAe/7+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8075A10E80F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:46:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFiTwgGPB+H0b307fDppLMgyX2xQrrIxIUZnK4Pb1NIAvaHHBI6i2djJqc5/FVWsxq1v7R0rTR4ipNASEUZFIALEJMPTi63KP8rFpG9K9NJWfGmkIWJIFAHUB5TIVNP4/Ofn71n7Sj+c0fBIWaSyWyXihiH8o5yo91GN93mUcXcdd9gpQenLySkYl+Tiv4VQtIr+kyCMRSxV4rbOTeSOcYjoMOTUzu5aXwv1LMHsuvirqVYz/ICGMz1dk/agYXoJnUJWoP0azmKzSMYYamx2nfoj4INpJrTNDYwyQSRjjVNmZnoh3vSeiF5nl7K21AjEul7Mpq/A4u3Htih/Y94XpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFvCNP/ZCupPfJSVppWIKGb35/RuWw9yGBRY5IZUT+Q=;
 b=Cz3eCHYBlu9vKNN05Cwajyq8Qc3GIeHJTaOBmKPqsyaxuKE8t6HLGO4GHCUq5VXvSGImS2pL5dnYEhW55YghDFb0PBwlswN8FaLIfm8yPMmFCxYhLT8XHtQ5xmiuN2dRsnmDs+qbnk48KQRFVA91arZaxGp0P03smaQZl/U7wkOrNz9RH8jI+nGyaUWu2pWTaCJqKIqc7PGtyQBt/HlRfYeQNzhQ6Ym6bbY1UHfVDq7AvsOZIraaGeslPTipTH1LaqS0Q6S4tv1A6a4MZAJAbb6U/UvgHOhIvoRj2L0RRlByGbqLMYSX4Z7ecXCBdb+eRqxoV8f1JOFMvjxqWqm2HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFvCNP/ZCupPfJSVppWIKGb35/RuWw9yGBRY5IZUT+Q=;
 b=xhAe/7+NBcFnh477h1qBI2ZmtU2DKkGM4cfZTfXoPtgL4UB3TdMsJd8JKXcaYWpH2rTT0gMB1a4KTrog4m8MamDHTPAorT8FrOujRw4pIIf1zul1WMZu6Y1162nC66YluDEK4fRPhQIidNHpN+o24zfFPNsUUvjNKqoLTqSd3sk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by DS4PR12MB9611.namprd12.prod.outlook.com (2603:10b6:8:277::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 19:46:45 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 19:46:45 +0000
Message-ID: <8fda54f7-5b53-4d43-b98e-727f85820119@amd.com>
Date: Wed, 25 Feb 2026 13:46:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] accel/amdxdna: Use a different name for latest firmware
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20260225193022.2707525-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20260225193022.2707525-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH5PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:610:1ed::26) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|DS4PR12MB9611:EE_
X-MS-Office365-Filtering-Correlation-Id: 05fa46a0-ace1-4fb7-e738-08de74a69b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: tJD9kU1YEcs6x1kI4Ghr4Xv21pezztstvp3TSxwGlMAGw9yc6UonUunFPffqBcisXT3sZIWorGmgVnn0ghgFc/Hvq1E6XUK03L9ZueHbMFtLcoTNJTbd36ru2yZ1nFXtCW91tlBeF+df8A37W2FO/UV64EpkcC0J9l049TLnhOv5a4yJ30T/K4QQ4OVzzbrMncZ+E+8lf4DkiW63oVHKBPXO9ZeS8dCZIe4y3ya0wCOLHyuwl4Cr/Xn0bgpzpeocEM/ZRTirCylnQWyU5ygwCpqytzvJ1cIVKJt3XrQozY8OagTgyZG+25asYnhH68F7YnKjI3lc/flWvHVM6DI/hIl18WSj5PBiggKPy1+xkkmDzC5pvKi9bi921xI48sZYqRapw4NrX/7SWxIsAuXl1Kjvjf03K+79YPLG9vkNoij+zEoVhDP5erNbBTez/EcspkIO+VGP1S7PKPRm2/L+DhmuTTtKkCq21LhnqP6zHyNcNulYVSKQk5REHh6qpk3VHbjOjsKyYGseWGe5I/O4gvY7/ZVkWUfpBJSAUYg7WUYpVp+S1TqS+EIj+98bnStVuAr4FpzEReF0o5YyXVMPBTe3L4eu90AIHzQZlnKMdLQV8oB6woLfY4ARcRjN7w7iM1eeQb0qCUBkmG2zzOW5fNbfqOBxcimTHT+sMtATJp893vyzxxYlRwNVmeKNI6ni
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB4557.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVA0NkZPbytWYW9UdnFiM1pTRm9NV2NhT1dmSDV0cDRzUFFnb3VVRUN2Yy9X?=
 =?utf-8?B?OUNPRlp5RVNxYlQ2Z3o0UG1NRXVVSUYwTmFqK3lXQkxCTFN6Rk52cFRRSndw?=
 =?utf-8?B?ZkpwZVNMM1pFNE10RS9lcjRZbHhIOEl6SEVZUkQ2UlZBZ2FnNThRK0RBNnBq?=
 =?utf-8?B?Sy96cFNTMEVHLzVGb2JHTE50dmZXMlBBc0psQWI4OU1wajQ5L1RueTB2TkxO?=
 =?utf-8?B?SEtqRUl5bFZpS04xOEpBZlREQkFSYjJFUCtVbWpsbTkzcEVUTUN0UHF0aWF1?=
 =?utf-8?B?NGtTaW51MzhHNGJmRTRmZ3pXYUthcUtFYVlRMWFOQUJva3YvdVRwK2N3bTYx?=
 =?utf-8?B?TCtFRkwvTlBqeS9hd2NHOG9McnQ2R2RHdmdMejVmL21GcUVaZkpqWTJYTW40?=
 =?utf-8?B?cWZEWWZ2T3lBRVlUUTNaNjlCMjFSZjRRb0Zycy9XY1dNQmp6L3o2SVJJSFd2?=
 =?utf-8?B?VWdTZUlPMTZHZERxUTg3WmxPc0F0M1NuRk5UbFhNaUwvanhmelVsaGxaZm5S?=
 =?utf-8?B?MXAwVlhWcWlKd1dnVXJUemNlZFZoWXFFYmxRZEdUdkJvNmcvQXdlUm5oY0tW?=
 =?utf-8?B?VUZjMlpVRWc5S1VmYXYxLzh5QjNIZDRDUlpYMFcyaUM2RUw2SHFZVWhkSy95?=
 =?utf-8?B?eEtPdkRXRGlGazVZS29DSDBIc1pSOCthSGhwYWduRkZjQldEZFo5VVRiTVZn?=
 =?utf-8?B?cExSb2lRMlJDeEpUUktlUTlFTXVadWpsNnYxbElWSmJ5M2MwUkhkSFNSd3JY?=
 =?utf-8?B?aGNicnRzaVAxYm9UVWsvYVgyRzUwcEs1Z3JweVMwUW5LUzZXV0tMQldKanMr?=
 =?utf-8?B?clBzZjdXNHZxbFpacTZHUjRzZVpFaExWdTlyblJlWk5TYzRmWExORkF1MERm?=
 =?utf-8?B?SklNNE9GRFJSOXpqNEt3MzN3SXc0MUgwbU41UUdoMStxZ3Jvb0FJVkoyQnpR?=
 =?utf-8?B?L0lnbTYwYms0WDJkakdrbEFGT01obTdzN3BPN1NZM2hUN215S2dhb0dJRno0?=
 =?utf-8?B?bkZSd2tLb3J2czdjUldIZmdIUGdMMmY3NUlJTzYwMlBRQmF5NkNNZENhTjAw?=
 =?utf-8?B?bHpSa2JHVjhBazd1R0pLUmhtWEtVdUtBa2hUZkNhaE1LZHBIeWMrU01tZVB4?=
 =?utf-8?B?dFpLRms0ck9LSWN0eHZhVTAybEpCUENUQitoRk1kVzY4RGNTaml2SGwrREtM?=
 =?utf-8?B?R3dIWHEvU3Y1TVoxQlQvRGlTNEV1UVJLUlBPWm5SajB0Njc5VCtOUnZ2NVRa?=
 =?utf-8?B?b2VBeUdvbE0valhRRkl1RitWRWFpVmtLT25aWFRkdkZNQm9WUm50UUYrc3hZ?=
 =?utf-8?B?c212bVAvWnNpbk43UEJ6RTM2aXNjYjRwdlNVWDljKzNjMjRDUUZGSVc1TUNP?=
 =?utf-8?B?SjByVkU4aWZmWVJxVGltbWhhRzlZR1JNc1pPSHdzWmlDYStNM0VWb2hoRFJX?=
 =?utf-8?B?TXNhakwvMjJrTUk4d1BBdGxKOTZWWTZOZzNhQitzUjIvVTFCRVI3d2NsMllV?=
 =?utf-8?B?bGxGMFFRakQ4cFBQNVhjbFUrczg5SmgrOGV0Y0xHTzJiZVpLSlhqbGM2OGRw?=
 =?utf-8?B?d3B4bStHWEFWVXkwVlBPQ0ZOQjZKU0grRjVjdlpEKy9zdnRTNytjeUtjYnFy?=
 =?utf-8?B?dTVlUTRMdDQzaHViK0ZvaTdNdVBTNTU0SXBxVHQ4eFhXSThxbmZPNmlNZkZI?=
 =?utf-8?B?NHMzeGFtWFdQSmhJalN4dTNIdmpWSUFWNWZmZjNJRm14V2l2RHU0ejZsbW9I?=
 =?utf-8?B?ZUJMRDQzeG1lOS9PYmZlYi9OWndQM3hVdWNjdzFIR2xaZXVqUENxUUlaSFF1?=
 =?utf-8?B?RUwzejN3cjZTV09JcEkydFdGZXcrUEdNR2hIQjE5YWdIWEljVm5BRysyTTBj?=
 =?utf-8?B?bFpTeUo4UWJKcjBkc08zaXQwU2RiNWxxTUlvcHlrVFVRclV4c2RUaFhLNTZj?=
 =?utf-8?B?VlROeGpxcDk5M3FkdkhMZXNFSm1Ba3VBTHQzZUNLZmNCUVdjdHhkZVV6aHBK?=
 =?utf-8?B?TnBiTFRZUlJ0L0hncEF4Znp1OS95NzR1elhpeC91LzF1dGNTYUVvaklqd3ZR?=
 =?utf-8?B?YmRSSGhoYmZEem5mVzZIR2ZEZTA3bW4xTFpqek05bXprN1pQdkFqMXNtTGMv?=
 =?utf-8?B?TmY2L09DeHE4UU1zcyt1VDFTdHNpbFd3djlUbzVCeitpZ3JHNDNCQzRPbTE4?=
 =?utf-8?B?cmFmRk0vaGF0bnJGeGNxKzhOelIyamRiMGxUeHVJSzljclVvOGxLVjBFeTBO?=
 =?utf-8?B?ZCtUNVM3T1R1Zi9FeTRVd28zVktLOGRSUnBMYkRXTGl2SUwveWI2dFJOV05U?=
 =?utf-8?B?MVJDS0lsM21GS0ZyMVBGc0Y0c1JRZGZvRE9sazJVdHFKMGl5RlF6UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fa46a0-ace1-4fb7-e738-08de74a69b58
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 19:46:45.4790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I61I/x1ohtVK65Jr5XTjet4InG8PMgLeQiBOtVs45UdeYX9vpPccmXAxrgix7pr+jBx1f5gvRr30H15lt6habg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9611
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 8A06619CE45
X-Rspamd-Action: no action



On 2/25/2026 1:30 PM, Lizhi Hou wrote:
> Using legacy driver with latest firmware causes a power off issue.
> 
> Fix this by assigning a different filename (npu_7.sbin) to the latest
> firmware. The driver attempts to load the latest firmware first and falls
> back to the previous firmware version if loading fails.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/5009
> Fixes: f1eac46fe5f7 ("accel/amdxdna: Update firmware version check for latest firmware")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>

Thanks for the quick response on this one.  A few comments inline.

> ---
>   drivers/accel/amdxdna/aie2_pci.c        | 21 +++++++++++++++++++--
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  4 +++-
>   drivers/accel/amdxdna/npu1_regs.c       |  2 +-
>   drivers/accel/amdxdna/npu4_regs.c       |  2 +-
>   drivers/accel/amdxdna/npu5_regs.c       |  2 +-
>   drivers/accel/amdxdna/npu6_regs.c       |  2 +-
>   6 files changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index 4b3e6bb97bd2..884e7702b674 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -32,6 +32,11 @@ static int aie2_max_col = XRS_MAX_COL;
>   module_param(aie2_max_col, uint, 0600);
>   MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
>   
> +static char *npu_fw[] = {
> +	"npu_7.sbin",
> +	"npu.sbin"
> +};
> +
>   /*
>    * The management mailbox channel is allocated by firmware.
>    * The related register and ring buffer information is on SRAM BAR.
> @@ -489,6 +494,7 @@ static int aie2_init(struct amdxdna_dev *xdna)
>   	struct psp_config psp_conf;
>   	const struct firmware *fw;
>   	unsigned long bars = 0;
> +	char *fw_full_path;
>   	int i, nvec, ret;
>   
>   	if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
> @@ -503,10 +509,21 @@ static int aie2_init(struct amdxdna_dev *xdna)
>   	ndev->priv = xdna->dev_info->dev_priv;
>   	ndev->xdna = xdna;
>   
> -	ret = request_firmware(&fw, ndev->priv->fw_path, &pdev->dev);
> +	for (i = 0; i < ARRAY_SIZE(npu_fw); i++) {
> +		fw_full_path = kasprintf(GFP_KERNEL, "%s%s", ndev->priv->fw_path,
> +					 npu_fw[i]);
> +		if (!fw_full_path)
> +			return -ENOMEM;
> +
> +		ret = request_firmware(&fw, fw_full_path, &pdev->dev);
> +		kfree(fw_full_path);
> +		if (!ret)
> +			break;

Since you're falling through two different binaries, I think that it 
would be a good idea to use firmware_request_nowarn() and then have your 
own warning if both are missing.

> +	}
> +
>   	if (ret) {
>   		XDNA_ERR(xdna, "failed to request_firmware %s, ret %d",
> -			 ndev->priv->fw_path, ret);
> +				 ndev->priv->fw_path, ret);

Looks like unintended whitespace change.

>   		return ret;
>   	}
>   
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 4ada45d06fcf..d5c699e1afe4 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -22,7 +22,9 @@
>   MODULE_FIRMWARE("amdnpu/1502_00/npu.sbin");
>   MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
>   MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
> -MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");

I think this should be separate commit.  It's actually a fix for this right?

Fixes: 3ef93841033ed ("accel/amdxdna: Remove NPU2 support")

> +MODULE_FIRMWARE("amdnpu/1502_00/npu_7.sbin");
> +MODULE_FIRMWARE("amdnpu/17f0_10/npu_7.sbin");
> +MODULE_FIRMWARE("amdnpu/17f0_11/npu_7.sbin");
>   
>   /*
>    * 0.0: Initial version
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index 6f36a27b5a02..6e3d3ca69c04 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -72,7 +72,7 @@ static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] = {
>   };
>   
>   static const struct amdxdna_dev_priv npu1_dev_priv = {
> -	.fw_path        = "amdnpu/1502_00/npu.sbin",
> +	.fw_path        = "amdnpu/1502_00/",
>   	.rt_config	= npu1_default_rt_cfg,
>   	.dpm_clk_tbl	= npu1_dpm_clk_table,
>   	.fw_feature_tbl = npu1_fw_feature_table,
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index a8d6f76dde5f..ce25eef5fc34 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -98,7 +98,7 @@ const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
>   };
>   
>   static const struct amdxdna_dev_priv npu4_dev_priv = {
> -	.fw_path        = "amdnpu/17f0_10/npu.sbin",
> +	.fw_path        = "amdnpu/17f0_10/",
>   	.rt_config	= npu4_default_rt_cfg,
>   	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.fw_feature_tbl = npu4_fw_feature_table,
> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
> index c0a35cfd886c..c0ac5daf32ee 100644
> --- a/drivers/accel/amdxdna/npu5_regs.c
> +++ b/drivers/accel/amdxdna/npu5_regs.c
> @@ -63,7 +63,7 @@
>   #define NPU5_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
>   
>   static const struct amdxdna_dev_priv npu5_dev_priv = {
> -	.fw_path        = "amdnpu/17f0_11/npu.sbin",
> +	.fw_path        = "amdnpu/17f0_11/",
>   	.rt_config	= npu4_default_rt_cfg,
>   	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.fw_feature_tbl = npu4_fw_feature_table,
> diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
> index 1fb07df99186..ce591ed0d483 100644
> --- a/drivers/accel/amdxdna/npu6_regs.c
> +++ b/drivers/accel/amdxdna/npu6_regs.c
> @@ -63,7 +63,7 @@
>   #define NPU6_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
>   
>   static const struct amdxdna_dev_priv npu6_dev_priv = {
> -	.fw_path        = "amdnpu/17f0_10/npu.sbin",
> +	.fw_path        = "amdnpu/17f0_10/",
>   	.rt_config	= npu4_default_rt_cfg,
>   	.dpm_clk_tbl	= npu4_dpm_clk_table,
>   	.fw_feature_tbl = npu4_fw_feature_table,

