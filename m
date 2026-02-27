Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNYUBkkGomkGyQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 22:02:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497ED1BE09C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 22:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC8610EC42;
	Fri, 27 Feb 2026 21:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQ4Y/gyh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D4010EC41;
 Fri, 27 Feb 2026 21:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772226115; x=1803762115;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZAiRDJS+eBJkQy6qVHxk3eKLqExsZThBKdfkutJQKl4=;
 b=QQ4Y/gyhtlzWtdz0Ohacz1MAmlFZJwjxB0uV5QPzsWyVxRxi6gxH4rjR
 rocQJsXdTWHmikCGARsAt2gIv9wfZVbun+PeSG6RavVGpaq/eiIp71Qac
 Mh/q7GhekYHOMkPcNpCemRU+2Pj0JZzhlXuVFaNLSWKBtZGh+JkmlxEOr
 4vh0Li2BcS14prpxA2zvMPozJbUq3C0F5EAdHrfGvDabuGME15nslOjpl
 jA5oN2WEgYOtU3MzhterOKp3TGve5JYoULNc6kDnqQeVj7yd3rVe2jpP9
 ZFwajZArtVsio/NcX4/m75cNnIKsDeW1C6LVplZBHBWNCIUHZJavXZev7 A==;
X-CSE-ConnectionGUID: 7ruMjkLHQ4O34Ne+JK81Lw==
X-CSE-MsgGUID: oarWmrhKT46+vCHwIxAbIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="83650829"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="83650829"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 13:01:52 -0800
X-CSE-ConnectionGUID: 7Rpqi8ldQTqHoiiRo49Faw==
X-CSE-MsgGUID: MzUkIut9TSq2Y6c41Vuv3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="216917753"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 13:01:52 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 13:01:51 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 13:01:51 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 13:01:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8oGfoTFZJOPSeGVUojBNWZ7IjUyUbFNWkvgOieey1O3KWyzwlv5NK2HUzJ0wRwSRXja1Fj0Nf6lRX+e5xf0wgT9sg0Krz3mj1aBkoeztkd09rAdlYj2c4uqABTQKgoBTnT9srLapTVdT9Pug5tZVMD6kMPBzsTD+OoZt0o5zIo8nOLziC3nGsKzbEOdBNCbIO6eAmTHS5/axao7HIJL41sYwQ0Ildj55N2hA8lG9EPqDslX6PCNlhVary/kuYPhlycnABTrH75A1K2fsVdPbGorrsSifDCBWCiS5edyBmMw1lqlqAJIC7Hzmip3dHHsLbXwXNjfhnj2W8kGdImiNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ky9FcCTeLKk3dbxt/z9nBLqn3VtIiJduA+rC4LMzFss=;
 b=Cw+9p8SLaMCGVyd/NvrDIeGk2T3kVB23WbvgTch7dDM+DN36rgI8jOMoDc/83xDzoyGhib1MCABhB84VuSbZFJ8aZnSMQ7Ohs5CYErWF6Lv14MC3cKO/e22Ve5coHDZ+FpQYQzOHtZpFhnnslbdckY1CHDL2sItH9dz727SvXMMDWtElK7gNJ624pAsA0yFjil2WwCYm1trDe+8VwSjU5h7yR5u+KW6gAMsLAyZUeymfBSBRNmsDpvZogzAYIVZ2e/7vXU3ZKAOA+Y65b3e1ZKyUutIpH4aUS008coWUwv2ZVFTQBNYC055dtyalrZb1k/WAXUh2YTaT7mA0jjtiIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6505.namprd11.prod.outlook.com (2603:10b6:208:38c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 21:01:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 21:01:49 +0000
Date: Fri, 27 Feb 2026 13:01:46 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/ttm: Don't spam the log on buffer object backing
 store allocation failure
Message-ID: <aaIGOqOD5ti5W5v1@lstrano-desk.jf.intel.com>
References: <20260227160012.82309-1-thomas.hellstrom@linux.intel.com>
 <20260227160012.82309-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227160012.82309-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0329.namprd04.prod.outlook.com
 (2603:10b6:303:82::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6505:EE_
X-MS-Office365-Filtering-Correlation-Id: e1fc094b-9aa3-44ca-f240-08de76436c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: lmU22s8B6PspBdYwMKJgWEU9edOhT0wkrfCdXcB2N0Anq5OF1iUBBP/yC5xAIgWHjyG2bA/wmS1zbayB+FVclbu8aslU7GTqzHkfBq3eGhOVflB7i8T+iv7YWeCEgcc3PJooqooEC1uDscsKrlc+8ixX+R1x4I+t9l21lt6bjyJoMenxfqZWYsXvK/oH6yWzuD3p9ktVE8gl3A15UpnO6w+ifJiJAWuZ5hoKvrbOoD+ZlQMLAb5zLOdBRll3kGkLivD+xhvPVB/BOPzv48pltS0FRzbPPUMK3E3eJmZbT1p//LSditzTV4ZkGAuoniMdPlXb/6q35SeWJp4BSQYF9I7q0RJFBcva3TSzWAiFDGW4unTfRNcalUlQQpoy1h5MrFnKcWC9BO+EM8w3srTN4FHymsRvLyW0WcD7t3P8ifZxZmLFQc4AylcwK1EqRGrUsCTj12DFdLw5D4bpdtXTxT0/6sZUs60tT9YVUeAWvGC5eaTZR/B/br0Kgg0iE9N+IbeoJ0gc5U2sMTdI+avyqrK4Bn1+LenLiBzTjF1cplryg32iWJLcX04cjCA2gVukzzrcA8QGQuZjv87Ag7G7qZbKu7QWfz4AvS/kssS2zUITL78Vr18sndAwdXhn7Ir43baQyiHTtV6fBoGz/W2J634XOJ9wirI5S16FHtzDp2cB0bx4/LCHoTBJK0YstpQ57HAT6OUTJjYWyhz/1aaNY7bWxAWqukJbbvUZrFWnvdM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cf5d1ABkNUXqqLhX4afsNGXCkpyWgm42QdhvMTR9wpNakQLHiLWM1joI7l?=
 =?iso-8859-1?Q?LDr+Z2XVoykFKG3ITDtQlWq70ZEjrnMTFj41zd4v1YdDuhLCJI5KtuZoY4?=
 =?iso-8859-1?Q?PcrWOZqep3L+B8PmsDMcBf7Xg4qetE3bll//YyocppROfD1EVJDZccJwyD?=
 =?iso-8859-1?Q?Hss/i8GhjEhIr0DzXDDAjYRf/H1El7RGsCBSfikdwyZUFti4QDg4JWRqzr?=
 =?iso-8859-1?Q?qRkFOfeoj46pAURddbCDNsNKz5Vssa0SVZYdtitd70zlMm6lgM2lRw8Z8f?=
 =?iso-8859-1?Q?awsAbB16T+WkuksDfCkW54P5pvoQu6GLHLLIsv/zAlWNWKMPOkeBzbY0cK?=
 =?iso-8859-1?Q?tntWUM0o7HqxFxSu5YMetkYVgEoGsYsMf41LJ8WtkxE4aLFtEoq/0qUN6N?=
 =?iso-8859-1?Q?bho5eI3OEwvoMWzoIq/tS7hHlGm+pVFg8n2oAk2JRBFqhSGrEWfYKTZgVu?=
 =?iso-8859-1?Q?831HH0OR1HXMq3iAFklEGj+kRvGrygU2jbzcU/VDFIvDrQZQ6sPynivKd4?=
 =?iso-8859-1?Q?IHRMCFL9mZB+GhN0p6H7KTTCFVHypcU10VGd6eWR2wzMQ5EIwTD6FB65QO?=
 =?iso-8859-1?Q?yOboRw6gxqXfAl1pMPwzW+kuNKP3imnqc7rFmWm3PsNO2BDBSErDAQJJng?=
 =?iso-8859-1?Q?0baoOV9tUEWQWsqbCDlLJ6HbMwMbLfumuXprKPuvo609AqJsqEMYBwZCii?=
 =?iso-8859-1?Q?ScnUUrhC47N1YoXl9fv6ZLN1MpjhzMnCz9iTi7Ur4A0b/xIzCE/MPiNzrv?=
 =?iso-8859-1?Q?eBkaRe0fBnRZUf+/8jQMgSoNyRbAoznWvdg0fHkmBBeYYL2W0xSwUcttyY?=
 =?iso-8859-1?Q?6HWIdKJMKTjNVhuCLpNYKSRkamghApZZY85mskcAlPmraOsj3hxeTH5smc?=
 =?iso-8859-1?Q?PteSSMlMvjKUKOEj7YOCgl8GQ0oMwzOrHiI2bhQpWGJBdiOpqEs28mRlsV?=
 =?iso-8859-1?Q?GPtvwVoeQjlZkYrIMkPwq1MfzfLvl+wkN/CtyofUNEI5aYHfVDzksqYFmK?=
 =?iso-8859-1?Q?ja2KsfOwviImPucD16F5OLuM2vME1JHpOQbVfSI+XBnuPfXTTpJnutU/Ad?=
 =?iso-8859-1?Q?hzF1lWVXRZrYC/vZNuhvDzgcDZfoqPyeqT72vI7wbW68w2ssdRemleDLF2?=
 =?iso-8859-1?Q?O/I8yTcN5vN5d368ROdnsE4M39y1C9WVL3LLWjL1w9y/qjubvicR0JlgHR?=
 =?iso-8859-1?Q?mdY4xMtEPgNPJ2KcHmjsVQtIO4RjeiswZncPQxXuTdi5NMRU04LzHtrNTz?=
 =?iso-8859-1?Q?o8vRxA0gPhu6nfbVFVfEoYhVgJIg6sjuTPMBRxldjv3oCOKFnIjHNdCkdE?=
 =?iso-8859-1?Q?v5uoNb14TI1/gFC1CDE8KnAwFqCKPSmGqPqYNxnfz86jcdua22KPQ/c8qm?=
 =?iso-8859-1?Q?Ud6uZsNIq6SOc6PstGW6TsukXO0XRZtUNOS2SLkqGL1ppmocU86YoLNzaD?=
 =?iso-8859-1?Q?xaQjYVQisnOeit3d5BxVRG75/rGCVN9UWvq5cjK0ObQssOoT4ihG1T9B+f?=
 =?iso-8859-1?Q?BKGnWArqIZA+1R3NAdDBwBKTQSohOjzc/PALbYd+XnGsm24fw/plOQiM02?=
 =?iso-8859-1?Q?7lLke700Ba3yeauLuGIF8SOFUpzyb7RX12Bnsia8XphKsr+DhuS8l9XNIV?=
 =?iso-8859-1?Q?4k2iEhvwbXts9ya2WJZQhfaBi7HJ8zi2R041HOcBIFjiJZsKDZAmZRwED0?=
 =?iso-8859-1?Q?ciRaUK9Cun9XnonYxPeBBZHI1PV/KIIy+uso9LgXbxW8Pbp62X0jAB/spD?=
 =?iso-8859-1?Q?JeHYmTn+w/DroPqwGlypYFcnuhwEzceaANaXmQz5t0H2pcCGGiN6+XkQ+r?=
 =?iso-8859-1?Q?cAmIt8vHtFRrI69u9l0hUTWbk6nErQI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fc094b-9aa3-44ca-f240-08de76436c84
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 21:01:49.0321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5JSti/sGB2fpKDTdiLoOmVLARDNFvEJwK92D2SXHMqQJHZtcNDfSlyHl29+NiSj4prvG3XB584aLorc1TlKWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6505
X-OriginatorOrg: intel.com
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 497ED1BE09C
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 05:00:11PM +0100, Thomas Hellström wrote:
> If the struct ttm_operation_ctx::gfp_retry_mayfail is true,
> buffer object backing store allocation failures are expected to
> silently fail with an error code to the caller. But currently an
> elaborate warning is printed to the system log.
> 
> Don't spam the log in this way.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

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
> -- 
> 2.53.0
> 
