Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE78CWb/pmk7bgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:33:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC811F2B68
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 16:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508E610E837;
	Tue,  3 Mar 2026 15:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZOzVqyK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAECB10E837;
 Tue,  3 Mar 2026 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772552034; x=1804088034;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y6EJNBSh9YxfQprketfsfLbojG3I/59lgZM++63KtQg=;
 b=EZOzVqyKubBdFJn4fNfoQ1Ym4LBrU226qFAaBzv9q2/u/9JkmluCZvTG
 wfI3XtnF/K6A8qfyupQkcQ+qOqi3vU1eqBt+LRyv+rDNm2lxQBkiYc0s7
 Py4rdX5WgA/vUJPmwWMS4iHimEpzsDKV2a/2TiE/5OTSFPfOJncJPKGUW
 lmZgHadY1JZtvn5UFzDVGEMBoqr5QCvg8Go810jATydNpTbj1x5RULilc
 z2jjaaN01QbRyuHqXe939BEFOV3/Qod4acdDrJbtHsyBGonobYK0fAhEc
 D5pYh3UMxG5/gF4LYapiu1qqJJb2KtpL23eRcahWVsbgjXjLTU1wKpt+V w==;
X-CSE-ConnectionGUID: 1NNydRwSRn+NowdfQ6lITg==
X-CSE-MsgGUID: 79Btri/2S8qlAzyLhFLr0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73506558"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73506558"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:33:49 -0800
X-CSE-ConnectionGUID: GHea564oTzy3FXpJuWZ4LA==
X-CSE-MsgGUID: TfGQS1ywTHKmsGFuGdsguQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="217270288"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 07:33:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 07:33:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 07:33:48 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 07:33:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lg45El26H1iqGTvATS5hmE28iPaymE9QwUjL8CmmQZecumt7NBZAhjhQxeZ9DMSkEaH5jXk1V+sDNk4+uSTk/62EoP9L5CpTu+aYa+n6Q+EIKbnC1KNVVTxfYRylLS+N86oadArc5/H369Q3FWBhKuT0l3Ffv7hS9+85Ac+IBd99XiJV+1iPh3qpGF4upFymdg5OkdgAZaYHvGG+ZEHKelq+l6yNIV+BXRvCYrMVU9+/kofRp+yqZ1vkzw5NNHdzBBtGbLDwj353FjziAG76zPbgRwsmLc/tTn9UUJx59U0RXSYq/R8jg4RgPIJPtH/oQvU0ZKsLw9jYbwTsfpbI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7uv0rCzlEhs7zNINZOSJucMHTJqIx1sJk7utA2pQQE=;
 b=QphKLT/XFLsa3tKHvagGXCp2njdcTZtxDG4xOXA0WrWswKvzxYfnhNkT+P8sPjJJ/qSuFh7D/7XJDWhim1KpcFvDDDmKoDy+cuo8OZf37Y6d9DlKvyt8L4hgAQE0Ue71VqsR2Ced0oPBMPBoruEMCJklRM5IjQmgxOGIowWoZtYISlHrkyhikOJEXsJeutmr3nz/0Av3XeT1su+2/rYqtS45i7m7/S4uaQYDgnjxD8Qih/xRn6SivQ0x30bkigZ6bvCHqA0vPRYdUxcAR6wA82QlZODSxPftH/rjxeKVWW0B4l8iTc3xtY+wUCODn+AEv2tAGBZnJvtYmRYxDmcVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6979.namprd11.prod.outlook.com (2603:10b6:510:207::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 15:33:39 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 15:33:39 +0000
Date: Tue, 3 Mar 2026 10:33:35 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <mripard@kernel.org>,
 <matthew.brost@intel.com>, <riana.tauro@intel.com>,
 <christian.koenig@amd.com>, <andrealmeid@igalia.com>
Subject: Re: [PATCH v1 2/3] drm: Update log for 'none' recovery method
Message-ID: <aab_T7YLUUtZAbHU@intel.com>
References: <20260303110556.3577612-1-raag.jadav@intel.com>
 <20260303110556.3577612-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260303110556.3577612-3-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6979:EE_
X-MS-Office365-Filtering-Correlation-Id: f22226b2-c72e-4ce0-6853-08de793a3e32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: z7rcj3/l9OsrVslOUaUFD4HH58/LgrHEoXJSxomN4vKmZh1PtWVxCIVPv+BFCkTUySWdjjDTgHkvOLhsxf784X/cOonAzpuI3uN1ymvZ6QSAu4HDEkw3Xsg7FPmzop9HR65IdhBZeVJA2pCRaCX0icE8sqI3rU3b0XgIG++bq83CB9iEG4tb5aWCIi391FII5oe2bAY7B+rjdeclK3W1QMG+aB8qme1l+AXoco1MKOiQz9n/1ybzEHStPB0wCQ2AbcRlGAtfGQBhpieJWRYctQZNmQHd9D10Q10/z11jrepbFc6fMSXqHZlYBICKXZ15+Ua0WHStB2e/ldSJjy/ZV0zDaydk3cTgfr5q3fHFYHqmHCY/1mUfzusWN41kZH6/zAC4Vr98BFQT7CaP5DKI2oG+8S+ghp0BzDhKuEo6eQ44/BDia/TjpvHcdVVHl413aUlY2OP8FkS+E62APU8xcUxDVcnQFXOv7F8NCd5GfeYZkmPxKhcunckUc8mokyjTLvy2vVa4PiercD7TjbnO5Qz5GvfL/7Rdk3pz8/a8Vt8aarXxqYQC9Vg+Q46T0aLVYLgJkKVYo81LuY7cgfmszVhKtMBhQmtItVY43MZA2OUhypqeILninFLyByh5Qm/Y4H698P3xLcJ/nQOjI1WkEmrGUF5v0+jsalS44zcT3ErFTqhODKIxBuZ0Q4Q6YfUKPLaGYThZxd+kswU7DcEATeGPNY9vQq5UlWf/eewRQsA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XSYmqqqmvrGc+OAY/MwX1eJ4apJasJP2WPvsNhnT4k4C6t7K6b7S6i/s+U6r?=
 =?us-ascii?Q?Rk2tPMzkS3pD4pnXAA5df2Zov9ZTBBWlb18O4EmMhhyhDLXNVLuU5eHWIZ5K?=
 =?us-ascii?Q?B4Xu1ojYAa91rrNeXCdIoYG88g3PvpqPcbvt7HwiFp6wpnr+uKcLe/dBDkJ9?=
 =?us-ascii?Q?ROcDhYTFcmSR7c/Fy7ogax6L48Pqm0YLv4hzyF1JCxzI2SJptaz0FmwG6ac8?=
 =?us-ascii?Q?QJpvotlPfi9Ozpi4dkYrev8DtZNKglBD83LEnrnfO9ShZd0XYywjeaRxtnev?=
 =?us-ascii?Q?wYoaxymOWO/gX0o7vph7ux6baQM33x/mtjrwm4LbVQtymc5JHv8y0doFhtZk?=
 =?us-ascii?Q?3G0HWBooqOeFLZpEs+RsYppWI7mvYwxpZgphywwDwl//BvCq1+QEZrloC78b?=
 =?us-ascii?Q?h6aHKQez5a7Xid3MBHE6bG9n8IfIeVf7gIW4Iqmyw4dE6MjU3GsJXH+KlEGL?=
 =?us-ascii?Q?OMSZKaGprHaOGpAyvq2UY0oo0nyrdxda+czpi+lRZApTmZ39v2ukK5lOwp0P?=
 =?us-ascii?Q?wpYnfwKSZ6W8sVumq9JKK209+CXNejTm9PYPUlNu7k1An71OXBTmcI64rE+K?=
 =?us-ascii?Q?9C2oKnpNJQ6oeyBBmucIOWarc1hSXHu3HFNHVboE9wGBg9RH4AiTurR3HTrF?=
 =?us-ascii?Q?WWiML0S36oPmh7k/k8aMtEarZtcm20kYJWUhNucGiIlLgAA3dICSKS+OCxYY?=
 =?us-ascii?Q?076jT4yqwwGa8dq0J6Ezk9k5x8G7Vbny1h1aL9S2jZBxMjts0y+bBhBWIuTX?=
 =?us-ascii?Q?PgQdHu6pC3M1wDFJy/qHF3yOUzK7vOhuovV/AGfwhtv/SmuB8+8HmQcBg5FL?=
 =?us-ascii?Q?qcy6N/jWpAMnum+sWn1/PK35xo+wU8wsyAuLi5z73z68SwxlaSocvvfW0X0f?=
 =?us-ascii?Q?FnMoRlLl53oe79AjwQW0INJOjh2q22ijPBqqO/2OzQpbtbZsrah6UQ2fGljO?=
 =?us-ascii?Q?HmMnjLndFJ1fecMf1XIVOgCxskwFE0n5Qx1x9zxYrdZ/18wgggoBL+TXhvdX?=
 =?us-ascii?Q?lqyqC7v2he5k0RxInkywyy5sePozICsPKdCadUZft/y7BXcH4K9EWAsv3Wds?=
 =?us-ascii?Q?1XVaevZFjXZatFLcFbK9TIRQ7Rgyp9/E/rgcGDpBjAumu8hzGHhJLMIqzhZ4?=
 =?us-ascii?Q?tPHeKb5U3BhaE17II7ASaz6vPBsSflvqqM+hGLzz0diPAIF8e5sE6pDsFCAo?=
 =?us-ascii?Q?0cs7ZkmNQBBESi+bthJWrcFRO47KkspoHqudZ/3EEJYjyljRVwDdo0KHbfPi?=
 =?us-ascii?Q?5xXcUCXHeRFXN7wIli8BKkvGn9g36Bk47YGTkbeXYYGceFbNCa5TzJ+pZmvb?=
 =?us-ascii?Q?gYTP1aM544+p08Cegs1QdkudeiKfIrA6rctOKy/7RPPNn2o2IfOqXC2iAmZ6?=
 =?us-ascii?Q?3b46O5B06DzAFaPq3KMGssNS+bP9vWo5W/w6Zx4TMYetfGyDu5d852AeRGcc?=
 =?us-ascii?Q?n9g5tdNY2sAekfP4679ZNJ8Q1UWSoaRIaVqmg4aLNRNa+Z+nu+YrXS1bmNDW?=
 =?us-ascii?Q?FTCthHC6oamC9PluuFi3fk7JV4kyKrf76WuwZzY09ZagQf6BByxKOQn1Tdbl?=
 =?us-ascii?Q?Ovi66CCRK1uZpGDmaFqtFJLVsR0r9+tBAcRnqSmCJgKtep+YKAWzajq6NTEQ?=
 =?us-ascii?Q?BBHc/jTz0Cijv+MhPaxoySUGq7N8gOgw4z+WOIl764Q0WIwA6HZz3oz4tHPA?=
 =?us-ascii?Q?X44PpB7aMXbRXf5cBbGAmwijp/wQmcp2jfwzsDSZLLj2uG90+qtfjmHRm3FB?=
 =?us-ascii?Q?CdsYjl0f3w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f22226b2-c72e-4ce0-6853-08de793a3e32
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 15:33:39.4248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F73vuJY786yF2lcNd7EkXzxnLRzwYuoctn2whPZpML6UsnOkYD0zFQntmBoC4x2Ad//RutcLBlWkMUAY7vgQBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6979
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
X-Rspamd-Queue-Id: 6AC811F2B68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,ffwll.ch,kernel.org,intel.com,amd.com,igalia.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
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

On Tue, Mar 03, 2026 at 04:35:18PM +0530, Raag Jadav wrote:
> Update log for 'none' recovery method for wedged event where driver wants
> to hint "no recovery" without resetting the device from driver context.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/drm_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 2915118436ce..72e7e09225c7 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -586,7 +586,7 @@ int drm_dev_wedged_event(struct drm_device *dev, unsigned long method,
>  		snprintf(event_string, sizeof(event_string), "%s", "WEDGED=unknown");
>  
>  	drm_info(dev, "device wedged, %s\n", method == DRM_WEDGE_RECOVERY_NONE ?
> -		 "but recovered through reset" : "needs recovery");
> +		 "but no recovery needed" : "needs recovery");
>  
>  	if (info && (info->comm[0] != '\0') && (info->pid >= 0)) {
>  		snprintf(pid_string, sizeof(pid_string), "PID=%u", info->pid);
> -- 
> 2.43.0
> 
