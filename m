Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHQxNzJSpWmU8wUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:02:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F7F1D52FE
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7A210E462;
	Mon,  2 Mar 2026 09:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bsmm3QcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011046.outbound.protection.outlook.com [52.101.52.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA72410E462;
 Mon,  2 Mar 2026 09:02:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpTTKLN9STg7TrsGH0vyxAM74QPQxvBsqWbbGU7UGDHyefaeoT4/dc9jFFX2uY4uE7NhepPFK2Y20SM1hSjsGcdmNOThYTdcrWcGFZ/WT7FmPRhNuXtaBDe2Kl3KZpuXQVN4VJl5k98EWMMglCE0Mt/AeHk67NlImY/HdTcV/bM2XkB1KOOaWkHn9N1ZiUJBkKaG6ql609OWSPGfc8TagwpFbQy8UhVvRsRbosjGyFDI9tGA+70RYlkGTa1x7+03xFV5cLM6my65fTdrCVShaPhxqoZhhY37AVTq7OO5pjVkdQqV0/PfsXBOl6Ff0Plmsb8kyM4Ybddr+ecdF0ZD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WpOTTf1KnYtuMAqiWkA8eAdpuDa9NYS2ymWwn/XysM=;
 b=QmItCcNTMfmmFozSYlwacbSMBwTbfilddEX+Ye2wFb1Sk4//5Gy/WKBcBuJE7mZ908FkLVomS1NwmyMgBmGRosXGcNbbQynXAT4fmvN6gs+5bhF0xRZ/K8qtZycNeVy87O1wJNke7DYwgbqeyY7AFwhACa7G9uezGrkb09eurSx6/HbS+3Kinu2/B4KLWka+ZXBxY+53K7vACPNO8RFa1avOr7QC1Ohbm8aDzSMoE2TkxRWmYaxtk5ILahBCPSNVmQQlgYSGd0MMStT1PWkN8SmlclsfuJ4lX3L/eMVx/b4D0UJzVtabgMLg5iIaZLC4SX7a9CjUuShhby9kypk1NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WpOTTf1KnYtuMAqiWkA8eAdpuDa9NYS2ymWwn/XysM=;
 b=bsmm3QcJ/Yj/LNogjbideWBzf61xOpT+FFt0/K7hM9t6ZWd2ydE218uQMIWCILavnfZBJrcMKUM8zlBokpgCOFSQCzgP5gWUgMdOOoSWEBUNm/KFqdeNNPATOyXfHtgLqQKBtmL1sMpHKQGml0VKWoO2m5zn4XArMLiQsvJIu7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 09:02:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9654.014; Mon, 2 Mar 2026
 09:02:32 +0000
Message-ID: <fe4d93d8-5c9c-460b-93e1-5d0d49a316ab@amd.com>
Date: Mon, 2 Mar 2026 10:02:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/ttm: Don't spam the log on buffer object backing
 store allocation failure
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org
References: <20260227160012.82309-1-thomas.hellstrom@linux.intel.com>
 <20260227160012.82309-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260227160012.82309-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 236db270-7e1b-46f6-184a-08de783a7089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: e7W+H+EpoY0A7waVOMYwL/Ggi5ZzlZUxxLKf8IZeeLy1HVDAQjo06YL7/WGhI0z872421es7JRfJyMiLLKxle5nRZxZGhkmWX/rjhkKtTTYufXbfnYxiiLjjynm6aHB9cuytAGIy/NVkUaD7bW/FBhFSTSqLwdL6iw5rkCUPOuycOWZ0dcZcA9BF4pn7SG5LPPIaiUUa+pPnDBvb3Mw48VQO8GRbe+buHu31ogYxB2/3zZXPpJNxGKfwoa/KCqhQnR2ORS1SnUNtFiv/QFCsUWqiQhziVuYo0cVJxgVGQjWSdHTtgU3/5L9NkhHkioc9evUCwrvBfKtorltDzGx2GjX8lKR8q5y/3g70+was8n+sCmrAFjS+neTvCcwb9k+K3a8NWqNxor038dLR9W5eCfp/AgCHl9/v2pyTgHkfcLMpwGCc7DXPOKtCW6zgx6Y8KyeyEs8wY9KaZDKPAO0hPslJ0JuoZZQ/Tpj9Ffk8LMuENM2AYEE+DUEn5evhALalL0AmKaqMcm4/x0LkB58Sqe7TDRxs2FvwJbK38SCOPKD1uAfG3gkPrxPQkH0rfjOCRbPN4LHPzIztyHY4eDS0oqnJAiY/Uo4f+FwQ2RvPzGlBGp4pBwexOqgtU9uo6EQdanMg5Bjhd3WXXJ5v8a5d5gbBNEoNCt0ajal4gOiXdYAo24savuwrFKPfdUHTJ2o1laUI6x7R9KzhAjlJq1Lwk1UIen0B32KtmC4usPIWddM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clFKVzBtYVdQMnY3R3JKNWhxZXVhUmFvYytEc3hCdEwxbWZLOHlrYWtDelFj?=
 =?utf-8?B?SkJlS281Z2N2Q3ZuWlRYdjNGVmY4OThFNjgyckk1VDRaRzRoMGUwU2xLS1N4?=
 =?utf-8?B?dHJLWE82bVE4MkpYNmIzMHo4R1dCUm9NV2UyMHg5VHcvVWlBczN6UUg4VG1i?=
 =?utf-8?B?N29KcXVtNmZpZ1U2ZUZKelhrZFFldHl3cTN2WG1vUFVhTkFFVnYxVjNWVE5M?=
 =?utf-8?B?dWMyaG4xV3RHZU9ZTG91MnlJNWhtUmFHZFpJcTVwQVBudzJuZkV4d2J1TjV5?=
 =?utf-8?B?VjRvM0pFazFNdkdDZk5aY0NIVnJjMjVaUWlnMHh6dEtSNkZoTnd6c0RtS0RF?=
 =?utf-8?B?eG4xOFBBdTNpMWdHVDdDWmRpRVByUng0enVCL3hQeWtzNFdOY1QwdFlKLy82?=
 =?utf-8?B?NWZER1lHdnhySkZveWJ6dDRtc3RwdG1YaVAwRVB2cE5URWZBUFV2NklyNnow?=
 =?utf-8?B?dVVJbitZeXRSZGdHMHF4TjErcDBhRHpMMktTajN5TVRUVG5ablFtbkJLT040?=
 =?utf-8?B?bHRnUUlTSDgvRy9rZXprSzhiVEtXNU41RHBmMnB4NlN2NVFKT0hBbFZGK3cy?=
 =?utf-8?B?dS9GdGg3bE5abE9wR2xDUkovQThRZkFqaE0xWDNHUUprOHJVeTlORzcxdEFJ?=
 =?utf-8?B?TFFVVk9aTVY5UTdqUURDekNLMjNlT0tsRlc3c2huMmpnbVlSNndxK1lHY2Jm?=
 =?utf-8?B?em9aTkMraU95ZXQ1c1dwNXJQbURUMkVpSEphZDdxcTJBYlI5Rm00OHBMdEs0?=
 =?utf-8?B?R3lPVDJEVURoNDlhOElUNnk5bncvV254WWVwTjFtN0N2Q01NMHpSK0t6WDNm?=
 =?utf-8?B?RGVMWndjcUR1cld4dEhNZEdkOUZrbFc1RVpyZHNpUW5TZ1pHNWJ4N21DSzJz?=
 =?utf-8?B?NnZ0TWhROEM3RVV5YnhERWhLNFlhT1dueHh3RFlJR1pHYVNicEpZNmxhc1Fx?=
 =?utf-8?B?QnRCS0pod08xaDA0cWFGSTZPNjR2RVFCb3RSSjJaeDBRZE1oWEdvZFlwNWFV?=
 =?utf-8?B?ejl2YUVRYW1yNitDUUVldmIvUXMyMzFtSWNsTnp0S2d3U2M2MXI4SUQ4MU1s?=
 =?utf-8?B?VWc2UTZmWGFDcXk2ZU54bk5PVFc0alNIOGhtUkxyQ0pZUHRMaUg2Vjl3a08v?=
 =?utf-8?B?ZiswYVBKd0Rzc3NpZDREVUtYUTNNN25zNUxYOTVocXpHN0NPVGovQTRSMitT?=
 =?utf-8?B?WUlQZTdEQWlqbzNlK1JkR1J5d0M4REJUTmQ1eGdPcnBUcWtqTGxSY3lxUk1V?=
 =?utf-8?B?ZkRuY2F1VWlsZ0gwWTdpQXNIdHVFNTMvaTFhSmhrekE3NmtFNEhiQm4ySkVK?=
 =?utf-8?B?MEhOUlhMYmU4Y0djMncrdGlILzNpdlZvWUNMNlJxZ0gwOTlRZUttOTRNU0d3?=
 =?utf-8?B?K3AyaUMvdTZKTGVRRHdVejZMT2NSQkg5OHJTSmhmYnJDdk04bFZzSmo1SXFt?=
 =?utf-8?B?clR3a1dwQk51Y1pmSXhSL1JOaSsvV2prY2ZoNy9SR1ZEUWlPc1VOeW5Qa2JQ?=
 =?utf-8?B?NExOak12TjdOejE0N2RoRGRYaTRDeThjR3FrZnUrSXk4bG9DWm55ZmxSekNs?=
 =?utf-8?B?RVhSRXltOVZrVElwOTNjSVpCUU1pQlp1eURxdlIxWU9tci9ZK2QxVVBXSWVP?=
 =?utf-8?B?bXBQb3JIR3BtMDJLb1ZndHdNZEFoazZmbWY0SEdpbVlxbWZOSnh2VW9odGt2?=
 =?utf-8?B?OVpwRE14RFpIYm04Ti9SQStEcmx4QkttZ1l0dHFuak8rdEhTNlFZMEQyOTdt?=
 =?utf-8?B?MzkwSzFha2ozbXhEd2pVcXNwOGdPT3J0UVNlU25MNXdIRDVSRk82ZVYvaEcy?=
 =?utf-8?B?NzRoNmowN0ZKdld6VHhWTVV0RmwrS1NyMGkwMU5janJha2RuSG5SZXM0YVk4?=
 =?utf-8?B?Y1FmeUpOaThWVEJsNi9udkx3VWRwM0lJWWdlSUF6aU5DWno3Mzl3NFhvODFX?=
 =?utf-8?B?eVNpNmErYTJtV2R3czdkczlUbGUxRDJ2MlZqd2JYczF0ZjNNY3lqT09jOUJD?=
 =?utf-8?B?U0doTTdsK2l0bm55eGxKMlpWRW1ycUU3QWZ6WGJpTWhxZ1pTSWE4c0lJUldW?=
 =?utf-8?B?WGpJM2g4eHI2dUZnLzNRQVo4UmlWakQ4ZkhYcDAvTFZjNldyODBUSWs4SWVu?=
 =?utf-8?B?YUtKMkFiVUEyQ0RGazVycXNFMEFwdnlCUXdldFUybmU5T1dGL3E0YzFFM0Rl?=
 =?utf-8?B?Ym9tQVRGNmJUTVB6R051MUhhL094Q2NLdXdkbVJIL3dnc0lYVllrZ3p2b1Iz?=
 =?utf-8?B?Q3Y0VDI0alVoSTJ1OEJqYURNQjN2OWdTUmdmSTh2RHZoN2dUVlQxNVhpallh?=
 =?utf-8?Q?cAm4uRDY+X9qXd+3E3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236db270-7e1b-46f6-184a-08de783a7089
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 09:02:32.6263 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /u/C186VggS/AB323W42UUuYcsVWD3/wRLVNqYy2JaQFOCyn0h4GwGcPgcpc0X2C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,amd.com:mid,amd.com:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: 40F7F1D52FE
X-Rspamd-Action: no action

On 2/27/26 17:00, Thomas Hellström wrote:
> If the struct ttm_operation_ctx::gfp_retry_mayfail is true,
> buffer object backing store allocation failures are expected to
> silently fail with an error code to the caller. But currently an
> elaborate warning is printed to the system log.
> 
> Don't spam the log in this way.

That was intentionally removed or never added because Simona absolutely didn't liked the gfp_retry_mayfail flag at that time.

In general I'm fine with this change since I think we have proved by now that the flag is useful, but that probably need more wider discussion.

Regards,
Christian.

> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c0d95559197c..8fa9e09f6ee5 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -726,7 +726,7 @@ static int __ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  		gfp_flags |= __GFP_ZERO;
>  
>  	if (ctx->gfp_retry_mayfail)
> -		gfp_flags |= __GFP_RETRY_MAYFAIL;
> +		gfp_flags |= __GFP_RETRY_MAYFAIL | __GFP_NOWARN;
>  
>  	if (ttm_pool_uses_dma32(pool))
>  		gfp_flags |= GFP_DMA32;

