Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALnWLlCQqWkSAAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:16:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2D0213209
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 15:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6586510E147;
	Thu,  5 Mar 2026 14:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elR+zW/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB3410E147;
 Thu,  5 Mar 2026 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772720203; x=1804256203;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YQov6QqBDI8jgcKHOoSRGfUcClswj6uJupPQjOquX6M=;
 b=elR+zW/cVAVierr2fRa9nmtCLdAh+PZfIholopAeQfsWr5YFLs4/dpuX
 SSw4XEC2nZ9APi2m4GbqmcmOQgLBGsbMuKVYJMsiE+e789evyeQ4GuJnt
 ZJE3hVuaEf+VcVsEHepW2Tj5OZbG3uePL99BiqsIqFSlIXnygEh13+Sp0
 PCK5gmeZS1f/pCfaHNxoLH2A3I3abwoitt+uFa4CpCs9kacLKqbt+Tv/f
 44GbYZI4pQjClm6W37EzyOUeabo1W6ZdAnW8bNqhtkwe4mSKoA7V7nPFb
 VpbwfO5zOnstMgSK6R6Txy8kvuam0aPvqbhQ2uVOASH82KdkEBF77uu4Q w==;
X-CSE-ConnectionGUID: YxbnO0uHSPy2RsWg2eEnkg==
X-CSE-MsgGUID: 5/hI3uBSQM2kSWf3pAHg/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73723595"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73723595"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 06:16:43 -0800
X-CSE-ConnectionGUID: Lw3ou4BUTYqvVgRJUHhrbA==
X-CSE-MsgGUID: S9eRTV+0Sqy4xPyJOcXT+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="245154522"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 06:16:43 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 06:16:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 06:16:42 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 06:16:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajRhETpSCvZmHwlE6/Yv8qGadCM/P6Ea2H1MyRlYwY7hvwSnsUJenCmCthdOi/5hgCcEE2IcmitLp4rz/O4gPtNzWJOrZUvmCSXA34VWTH6aqug8MIeBHXbYLoGzynjf4KVNTbghmQEvsLSvjtlTGp8zijh23MjKKqBouwAz0aMds21oIN2JNLq2Cg6euvPFvWeRTOh2cxTZzoe+WgB7LtOjuTDzaauJVZsTtuMppesWO6KeEXtCFjQGju6/7hTysdzaVhR2jHCLDFpAyGCmBBsiVi/q30tU2a91M62R2o+Z8I6wDQEAp1lUDfPEIMd/Sck0qjAp7Heoo574j38I7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7QLuT209iLh8kcHIfJcl/HF/jIvyvQ51EH64Bt11Xs=;
 b=Gia4dFjv5PfMKrczlqWcplp5mbwV/cIYzgAKuRH62JTWhfsPthexEsR00p13NopVzTSNB1al1eSCxxJ54nVw4zFu8HWsk/8HO+5jRnV/JrwhF+zCJnpxKzAcEKXsEm3Vpp7WcfMVD8Bs345k4CDqXOM7Y9fR+r4jTyH1iNha8z9Flcxn2FEYJ6UrvFiuPpWOZpBptKdGKfsECSRd90z6na27of2Xga8hJTsxTyuIu67m3y5+MqEy+kwzGJ+VHPooZo9XrYikemQVn+nm3ZJSTb8TF1D9DOqOfMuMmLZZuJqeDPLeMp8R+oBJM1IR5f0PxF9omPDZqE7+lwXMDGcFLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS4PPFA58A7783B.namprd11.prod.outlook.com (2603:10b6:f:fc02::42)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 14:16:38 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 14:16:38 +0000
Date: Thu, 5 Mar 2026 09:16:33 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <mripard@kernel.org>,
 <matthew.brost@intel.com>, <riana.tauro@intel.com>,
 <christian.koenig@amd.com>, <andrealmeid@igalia.com>
Subject: Re: [PATCH v2 1/3] drm/doc: Update documentation for 'none' recovery
 method
Message-ID: <aamQQUyHqCwettNq@intel.com>
References: <20260305130720.3685754-1-raag.jadav@intel.com>
 <20260305130720.3685754-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305130720.3685754-2-raag.jadav@intel.com>
X-ClientProxiedBy: SJ2PR07CA0016.namprd07.prod.outlook.com
 (2603:10b6:a03:505::16) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS4PPFA58A7783B:EE_
X-MS-Office365-Filtering-Correlation-Id: a62ed876-fa6b-460c-bc6d-08de7ac1d081
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 4To58DzB88UBGzW6C+8048fwToNsby3lyWS1ZE3QRFUTncTDoqtNYke5sxRneF+4vleqD0SHAFMxUJ05Ku6GrUzIJTH2Ub9LdwSqQC78L4XzFObVszBrV3Z88o5teAhYscmlBa2Zajo5o8YjjveXjulbW2XSOCyRVWx0i/61t1dRleGeSiilUEdpYU+10tyc9nOZXqCl0LLGorgc6Y7pEKLpZquQ53GAP+lKNVSlUUbxwc/qURYUhOowr3baGH8bHUiJ/We/+wXtSrq1zhdE3xuhgTvXLTcMkhd561KI6xVW2a2WqIlXCyAKbVnPsZhSvJmvPtY5SxARyhOUE0m4ZOXhD6i6kYmRVUv4XoAhSGLli7VUTc2S0Zf2jAN09IDfeEyVJjMgSl2+PMLppD3uEyQ7mBsbpkTN8JnnLVUW7dW1B6KmdR8Aq1rTtkoAu3knHD5T43jZ/DUOzCFBRh+CLUaK4JBGnxGNmXt6YprhreTiVVlVVDE6OY1PEVUh1mldUaKKpwzgQ/iNWVdszMRUQjlFVeV81m40y9aI2gOG146xh8Q1FZe8vAuTU+uQ/w27V2KUsIqaly+vhl1HWehNTLq0pfD5CRFURrQnrSQQrC8nO6CfFFDFhhRTi9tJcPdtqgRdvqSb7M7vGL7Hd5SHs2POkM2doSfkMBxr9uwpZUvSSRDnl3RGtjFQr9fMfYzCJS7q4BSSLh6foN+iNt9wpWh01/wzHA97J8QO+7NHcJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9n7xXufQ9sJtJgCi1gFOF0j4EHs1juPavUj3M02bJ0KqRZkIONJvVmde4FJQ?=
 =?us-ascii?Q?cCDfWOA+kOw4TtMRYRXKSCKhraeUfsL90E1SoVz0oQCHOT8C12TwV9ugl19o?=
 =?us-ascii?Q?qxt9KPxMBre93Q/WdlM2PXThAvd89agIgQphLr1iLe3MGQWWqg/tWaUimDUA?=
 =?us-ascii?Q?Rds89Q6iF9chErPQreG69eINmWiDxEvINUbG5O1A93V0iczAtNVjs+VVbHwC?=
 =?us-ascii?Q?SOcI7MRdyb3swwf9OATPSXTElcOnqKUmKl0HOVZDW+l8E4NqZ745XWsT+g5U?=
 =?us-ascii?Q?egflXVotcPUhdMQyEPInHHmJdwGiYgWSqGTQJeKIIDKhwQLMDjsRBwkA/Xk1?=
 =?us-ascii?Q?Yc8frASffgrlaEpdHZERaSAEvzTXrTgAnt+qjkGZ7c1lvQOfOX8Mi00gzxZz?=
 =?us-ascii?Q?q7yPdYFWXV4cXSzO9iJ3T9drpTD46IzZ0gidGQWgM8kn2IVMvsMxZccMZP0Q?=
 =?us-ascii?Q?bV/xfxqG/1ZbShtHUNYuv8tVMw5d9arujvLKYmzbaovX3q7rh0ukMnjAJ/6I?=
 =?us-ascii?Q?oOQxs+6BToGC5ZVYT4EG0uFP3CWTO/7l1IEpf7AyYsAB5qpF+seoZp0iyO48?=
 =?us-ascii?Q?ih1wArMcl/uthhy9InS3y/U81kDq7N044HcRjdEEZ9W4XeMkfruiaXFp38x+?=
 =?us-ascii?Q?kwHco/EHr3i6lujs5so9Z3V/ZJ5D4mWoJdVsL6NQBjsxSV8MyB6NlyVD5X44?=
 =?us-ascii?Q?JHvdATnw6nIhRSPGamKeiPfZxvh3bD0PlURuPIimotYvvpSA0P5ufGN84I3t?=
 =?us-ascii?Q?yrLkJlbUhWFyD4hUXSE7uTuM3OetXffpySwaSuRdXplwPVlW8QwjNzZByGhP?=
 =?us-ascii?Q?3bMlVlE3OKvSx9KLBjPNLspFIZzpYZNSSdguM7UKnyffmDWdWl9o1ySY1f7p?=
 =?us-ascii?Q?Eltgr3pYMMfQQC10QN4H1wfOek14xIU5zi3Mto3TJ66yFtSxM+5sjxzmj7Pa?=
 =?us-ascii?Q?jdK32WgqJcnFvVFp5lO+5wfTciQNOOtY5ptqZyaOzAUGrzqkGQ2tB3GF5ZIm?=
 =?us-ascii?Q?5DHgdWbOq0TKZjVC/8LShID/KoSzH6sNQZfNqVjIGMZpKG5QuWuAuZEGR0z3?=
 =?us-ascii?Q?XuY35oJ5MiEe9KlnyBZHEftDruXhVOQIZzrGbtxB/wioWUtLGwuQDd3Q7eCi?=
 =?us-ascii?Q?4Ddx3Hq2ZGL5LiIBaMS3uD2bhxNYQKfY/tdVD4bPyo0RTkfegt9CHMlNohVW?=
 =?us-ascii?Q?Q71QLGhh70ZzqcsPJJTgxYq45nL77NbUJwTJa7wUeVxQkEKlIiFg2+ginOZG?=
 =?us-ascii?Q?ouA0ORFpxz52GK8xjCvFCd9/WSsA/PQP84Z1pAqHERt0y8DRLFaGTXaVZTc2?=
 =?us-ascii?Q?crxf/GEWh7IAXRHlEoIJfTtDCtu0m/pqsm+Xr0tSs+6jVl6pYH45peEir3u8?=
 =?us-ascii?Q?4fHY0n3eLk3ET73axb+nZF5e3d9veyQcC+OO5vZX5xMaogQwxkDCrZ/9XB+/?=
 =?us-ascii?Q?/JflgShY/OktbE8Qes6/v2kxKpHzpRauS0d5V4tkCvsWWpiVjXf9Q3Qbf8Rd?=
 =?us-ascii?Q?GzRHfEY95J8TjeL44TE3sFP22ZxBI1zIL5njJAkloRZxwwGU9iKggKVIfgJI?=
 =?us-ascii?Q?+7AbM5eSAqVWTksEVEsZE6q0EErVdqI+NFwCu/6uGjNqoa8ZFt226Wh897Gr?=
 =?us-ascii?Q?tTfhWv7+wSriCh3g/urKtH9KKoeh/C7t5XtDMAzcrduesT4Jq1fWBBYmdt73?=
 =?us-ascii?Q?exgwis9NIE2rahJCvpkh25TWxebI4muowATW+ztpQhjXy2oNMFBqHH7EKQZt?=
 =?us-ascii?Q?z/xGphzsFA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a62ed876-fa6b-460c-bc6d-08de7ac1d081
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 14:16:38.1095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCeUgNRlctsoWOyXmRbuU8rz35zUKMGv0eO6DOCxleqErnkpJ6ebXbe1iOP7PZP2FNUuA1lcTBOlXVwsc6ScjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA58A7783B
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
X-Rspamd-Queue-Id: BB2D0213209
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,kernel.org,intel.com,amd.com,igalia.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 06:36:47PM +0530, Raag Jadav wrote:
> Expand 'none' recovery method for wedged event to include debug cases
> where driver wants to hint "no recovery" without resetting the device
> from driver context.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  Documentation/gpu/drm-uapi.rst | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index d98428a592f1..579e87cb9ff7 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -438,14 +438,14 @@ following expectations.
>      unknown         consumer policy
>      =============== ========================================
>  
> -The only exception to this is ``WEDGED=none``, which signifies that the device
> -was temporarily 'wedged' at some point but was recovered from driver context
> -using device specific methods like reset. No explicit recovery is expected from
> -the consumer in this case, but it can still take additional steps like gathering
> -telemetry information (devcoredump, syslog). This is useful because the first
> -hang is usually the most critical one which can result in consequential hangs or
> -complete wedging.
> +No Recovery
> +-----------
>  
> +Here ``WEDGED=none`` signifies that no recovery is expected from the consumer
> +but it can still try to gather telemetry information (devcoredump, syslog) for
> +debug purpose in order to root cause the hang. This is useful because the first
> +hang is usually the most critical one which can result in consequential hangs
> +or complete wedging.
>  
>  Vendor Specific Recovery
>  ------------------------
> -- 
> 2.43.0
> 
