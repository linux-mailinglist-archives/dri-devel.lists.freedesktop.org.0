Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKahMySqpWmpDgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:17:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713261DBA76
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 16:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AB610E1AB;
	Mon,  2 Mar 2026 15:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5OVij24D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010000.outbound.protection.outlook.com [52.101.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EDB10E141;
 Mon,  2 Mar 2026 15:17:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udkOR0+F0fATz5i5u0a4nlf3fTMlyTQVF09PB70bVAz427LId9aSJ9NXsdhbMqbzBT3wjzcS900pQCvomzeyJ16fZSYHKsJ4HpbqM5KjWdBEDYXDBCHFRaAWW1I6gBqwZMerQUS74Mj+JF1U+eJpJ+aMQ4rfhdLiV01NXA8ZIfLepNrgSEdbqBYO1CJoyqFXWf/8tAue9l6xTOqFWCGNWu5zWyIyO00B8XyAViWp67l+najCAcZz9QBWZtdrBTvuibihdA+nTS8LyPzQROS20tfv48SX3/mIFLkEwsiIPe+tWDtjPcZEGBpSWNfbaNIP9BFuBvjtkhVV5aH3/qeaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KCl0aMaLWm+pPtvAnUSyh+LZ9eR44NN1FD8pV3pEgs=;
 b=Au4js5NXsi469PZ1VojJ1K40pfnXTy75dQdll8IA3QFovobYY6Q8oMILJhjInWQ2Kq4h5nyLg0VmeWTSi313BUZhkSpXqTUnNErJiTNxYDbAKvwRN6thvngSZvzTb26LWLhBHb+ngiexM/gEwacksK5vJyg1KrXDIO+lCO9g4PVmhZ/dDB/iAnu2jPqpdnBTLvmLE7o17UaBEu+LhsBl9luKtBIJpvD8Qo1L4KDkO8ZOeXWUtdlOP6ljDmkw1rxXK7oDl6xpIq2Xirjkmrn6JsxJu9LGtZ5gNfG6jJATUX1XT11ZTdrzkMwUD7h/IOxjOkxup8lT/k+sdXOjH458BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KCl0aMaLWm+pPtvAnUSyh+LZ9eR44NN1FD8pV3pEgs=;
 b=5OVij24DvBDpb2o0unBsCf14OXbXuFfK3mOJYVmmwSkNRex9whsa8wjaqQG5MeV6pnZ3o3ekstQRhQmRcc5Ou3T8QF+qYwXq1y9Hke2E95A5y167IU9Es2xCBwD5QsWbyLY+bAcFBhpAdCbKuj+dssZW7i1ErLfPAfuMLjNp6v4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA0PR12MB7463.namprd12.prod.outlook.com (2603:10b6:806:24b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 15:17:48 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 15:17:47 +0000
Message-ID: <d76b2758-1428-4efc-83d2-a7f140b24eea@amd.com>
Date: Mon, 2 Mar 2026 08:17:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/amd/display: remove extra ; from statement,
 remove extra tabs
To: Colin Ian King <colin.i.king@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260228095938.548728-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260228095938.548728-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0388.namprd04.prod.outlook.com
 (2603:10b6:303:81::33) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA0PR12MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee96f1c-e7cd-480c-26b9-08de786edc73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: d0iDq8xZtKbzfWCYgtRWhag0tBhIQEppGwbTOU0B8G3L2kf7n2QgljVTkySBZboU8wLXNKpSw5kmQq1Pyp0HFVA3RRRY00q5pM+qIkN7stvy7oAClNbWQevauYDMkcS0JmvBq2xnvzsW8ezbmWLGk7ndq/psJ0//vE1yz3QbajcQNB0UdtSLEHYGl6t5AA7afVqelUj1Dc+XSEq/R9OazJ9vS/Ph9CW3EmuGOvd/NTZd6BIG8zdae+v6GwHR31N/eaFooz22r9CwvSRViPRgSlTBA/Vc9KS1S9cpoLmb6jRxMBzTuOK7N98oLGeiZOe6GuEl4OkklBjB5SFjVLS0rqktKBjf0w+KDKhjyUPupmGDpVD4gpM8ZsMDSElVQYTQtw2m5Tg0C7HmNRohaqF6Ij/Hnniw/c4IaBoaG/Chufg4f+1eOqU1ZpvSZbAKxN1CFtA8LbOmt5irCDS6yjDTZcNzpiAeXPMF81rpT0VPGGD0nELb1WWjMbmir5nfVO50obuPCWkbiZ/FdkQnWoPB/HofuyZOZ3lv19f8CKm1rwX6yljlgUgwNzrNVyP4qsmLhIIPvy5yuU6cVuej/ltT6RCiOTG4fVYXMzCxIb3x3RXc7OpmOo8sO96pe/vqFxQYVnSZN5HN4E3t4s8HTGwu/LrbfXNsEIzgmZ8KLgfOAQXOzqljIjl5TFYHil2BuQL/thPSBlhfWa7sJbv6QVS/uSw7ZqHaWTYTNkFVAZ3JUQg0In2Q2Cao26oYOq05AGVCCpOKvVhHiwN7IxI2Qa431Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(921020)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGRxVkZTT2RXV05ESjIvTlhnMmFtaCtHbkVab2JYYWVrUFRTQWtrbUdNTTk0?=
 =?utf-8?B?NHhFV3ZEdEN1VXVDSzcwT24yRFJJUFZjeFVSS3hzakhpSVowOG5XQ1huSy8r?=
 =?utf-8?B?NVRkd0h2WUpra2RCV1NnczIxczJ4NkxzeWdDajNQUzU1b280RDZQckNBcUpJ?=
 =?utf-8?B?MWxrL2xlSFJHQndUN1V3MXFjRHkrM0oyK05vaWpuUEpSSEFUVjNUWVFHVDhm?=
 =?utf-8?B?dVhwcCthVHRITkJoN0gvSllqN25GZXlJMEUvM29VQWNBS2FTTUJUREFuVG04?=
 =?utf-8?B?eit2MkNYRVNPNER2N0c1TW1nclJXY1luMzN1WmFub3g0aklWZ3BNekwyMmxG?=
 =?utf-8?B?UGpsT2hUU0cwRjI4MzlacnRiMjMrL2NrTjhSS255TnBDekYzcnRVUGQ2a0VD?=
 =?utf-8?B?Uit1ejk0WHF6bWZaMTFlRWVRN3JKUUl1TWIyWkM3Y0ZhSTM2bGF3MjFuMW9Y?=
 =?utf-8?B?Qk5adFJueFhRYkV3bXV6ZkcveldIbWw0RklCQUp5UVlWdG5ENEttYWZCWDFo?=
 =?utf-8?B?aklvNGpZWm5MdkIxeE9COHlIcTY0L3FxNmZGTmRlQnVuL2RrYzJydDhpYTY0?=
 =?utf-8?B?UFhmVS8zeTVBblU2RWhlay9YWnlYbWJsa0RNbzE2SkN2OFFIcThFd2ZJYXFS?=
 =?utf-8?B?Z283cDQ3Qzh0ZjdCTzg0eHZqT0JVNUx0RzB6dk01VHNCN2piOVJhUzFIMVZp?=
 =?utf-8?B?RFAvN1N2cVgyaEo2elZCRVZ6dDUvMy9QS0ZnaFlWUlUvQlhRcWEwa3FURzRq?=
 =?utf-8?B?eHpOVExSS1BZVzRySG81SC83YUNYWjlpSG91elkvYUFDZEZFb0xqZ0RQMTVl?=
 =?utf-8?B?RndVYTV1OHYxN1ZWZ2pXU2xCOEkzNG5kM3dWc0tWQXhYNHBPclg1QW5MalpN?=
 =?utf-8?B?akhyK3BPWW0xQnoxeHhFVlVGNlRIMUJkRE1XRmZ0Tm9SUDVqYmFqRFM1R1VU?=
 =?utf-8?B?TnJ3dHQxTTN5QngyLzhpbG5uQVhPWXZnaitCb3NOUDU5MnlBR1VXL0VOVVFZ?=
 =?utf-8?B?TFhWVUZnMUlhaFZIZWdZSXpJRHVSZ2dkVlkxQytYSjRrM3pTVlB5bkgvbTZV?=
 =?utf-8?B?UGUrQTdYMVd3VTBheXVhNTJEMnhxMWNiWHJIRDRlSjh2bnI4Vkw5bTgrZ1Np?=
 =?utf-8?B?VlhkOFVYM3ZpTVJVektac01YczJEODNXNXlQM056bEZBamtkWlNRQmhqeWRV?=
 =?utf-8?B?RXZzZ21iSnBwRkpDK25LVGhsRFZDSzZFSDQrcWxqViszNDgrbmpMbVMwc3FJ?=
 =?utf-8?B?OEoxcWdSSzRjTjBEZGg1aXN2elhheWNyOGRmOUpkeXBJUEFtNEhDTWJQWmZF?=
 =?utf-8?B?Uko2NHFwYzhRbHlvMVNjTUtMYXB0WkI2NTVmeHl6RTAzazFSbjA1QjlkMzdN?=
 =?utf-8?B?V1V3UCsvQUszTUZ5aGJDazE0TFFmU0tMT0NXWWdOSkdIQ3d4ZlJwdmpqOHpp?=
 =?utf-8?B?MU5DYmZubHdZbDE0NGtnRzRaNkorRUQ5TGpTRFEwV0VrbXJSZHpYTVY5RXk1?=
 =?utf-8?B?SFRNcmhDeGRGdERNMm9IWE1nR2xsTTZiVVgyOFRlT2lPQkI5YnptbEdTKzdG?=
 =?utf-8?B?TW51SzBwUXVHbHNPaHJzV0xwOTVpTkNNS2h5SkZwUmNKVjlSMnZtWDRUbSts?=
 =?utf-8?B?aXJUYk5Mb3QwVkp3dzF2UGNvUDNLZGxmY25JSWZIK3FMbE5NMUtMem9EUUx3?=
 =?utf-8?B?V3VTNmxhWGpCYi9raUxDS01EUkcwU3FPRXJ6ZE1Hbkh4UEJjOHZKMlRDZSsy?=
 =?utf-8?B?bW1UK1FiTnBNWE1FaFdxTUZkL29GWEZhRWlQVUJ4U2p4WFRrOVpuMVBKWGxp?=
 =?utf-8?B?WC82amR4UmVTVGNTNnQzcFI0cTIxZUtLcU1XYWFPSzlhZ0JhRWlJRzFPS2Vr?=
 =?utf-8?B?QVd1eWdncExwU1hjcWFmQzlpMFAvdjExVW9ZeUV0YnRCV3UvdHlEM2I0QnNW?=
 =?utf-8?B?a2U4bG5ISUwwS3RSeG9VUk1jeXFPWFVReTFCcjFESDQ0RTIybTBhMXBTT0hI?=
 =?utf-8?B?WW9BcGFGOVJJTUprdW8zcTRWUjQxWHlXaXd4OEFhV0R4cnk2V1dWZGo2TExw?=
 =?utf-8?B?UHRHNWJONmRMMXpXNXZwL3RyOERRZ0l1cDFZZzdESzBGdXRxM2UxUXFEUFZT?=
 =?utf-8?B?NTU0cnllTFRTc2VLbDVoVUM4R0JSMTRzdjZ4TFZhcFBZNWtiZEpVejBIQVZy?=
 =?utf-8?B?Wmh1dFBldkVadE5UK2N0dEl3aEQ2WlVXOUhudy9OMjdmSzZ6RzBwbEdxT1U5?=
 =?utf-8?B?WGpIaHUra2Y1bkVXNXY0NnI4M1BvU0xhRkNibkZCV3JlQ1JHckxMa0VUZ2Ew?=
 =?utf-8?Q?9/42+EKQmXAqy8eO3p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee96f1c-e7cd-480c-26b9-08de786edc73
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:17:47.5620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JqagU1T9w4RckruTvtb4I1xRamx6GhOJC9J/uqYG+k8iMb9zwGCInZHAUo/7h1clFxzuVXqetl96Cnac/tyQtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7463
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
X-Rspamd-Queue-Id: 713261DBA76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,igalia.com,ffwll.ch,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[alex.hung@amd.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,amd.com:dkim,amd.com:email,amd.com:mid]
X-Rspamd-Action: no action

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2/28/26 02:59, Colin Ian King wrote:
> There is a statement that has a ;; at the end, remove the extraneous ;
> and remove extra tabs in the code block.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 71cfc623bc2d..f3fa8eb4bcce 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -1165,9 +1165,9 @@ void dm_helpers_override_panel_settings(
>   		link->panel_config.dsc.disable_dsc_edp = true;
>   
>   	if (dc_get_edp_link_panel_inst(ctx->dc, link, &panel_inst) && panel_inst == 1) {
> -			link->panel_config.psr.disable_psr = true;
> -			link->panel_config.psr.disallow_psrsu = true;;
> -			link->panel_config.psr.disallow_replay = true;
> +		link->panel_config.psr.disable_psr = true;
> +		link->panel_config.psr.disallow_psrsu = true;
> +		link->panel_config.psr.disallow_replay = true;
>   	}
>   }
>   

