Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDC5B3A8A4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 19:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C766D10E06A;
	Thu, 28 Aug 2025 17:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W5Qg14Rq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D39B10E06A;
 Thu, 28 Aug 2025 17:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756403389; x=1787939389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fmHJX9Jva1YBu+RGf6ywJ2IWIUGQZlB+e3AOIlCc1EA=;
 b=W5Qg14Rq3P4ABOPLjzYD6qkVpEAYim0k1Yqt/fPw+URTOTtUvUki40hk
 7A100W9/VSqTrOoCFfaX6mzdOO7ODzmbSywNn3F/lOgXGuwhiSgE59+xE
 ClPFxX3Kwscz13BxaLPESpR4tjImfuaPiwh0jat92QBM6T3C5Q7H14Yy8
 SHzAIEhDDevdQygwSQa5ojXW01K38HYB51SPUjOxASmKWcpU9EqQI7xkL
 8PlVpS+FsHmVSfuxkvzSnhh+TPFHjvOGcOh74Kdn3F9Qq9AwiZ5VVLrGw
 CLA/tL1VLP/P5EBmcaYKiZKVn9ny99Xhfqebz+mnfaK/XhNeF74Hylnk1 A==;
X-CSE-ConnectionGUID: H1W4w2WGTTCNKNMkro/JCQ==
X-CSE-MsgGUID: MPwcyiiURkS35aSZ0O+tQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="68959838"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="68959838"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:49:48 -0700
X-CSE-ConnectionGUID: mNAlCesxSCG45zRlNliWMg==
X-CSE-MsgGUID: ARkJrB5TSL6V6Mwd9j2uMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="169695974"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:49:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:49:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 10:49:47 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.43)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:49:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHC9MZdlHghoRF+gAUW49pAAepnYB3IARTTXbLcWB3XLH3clDx/QWt6pZHiYPwihb2LK0pDgX9HthnBBVFg9yniC810SOgQtoNB7sp2ltbf7hNVeatPqPDosFwLWqLkPE8NdPcG/JUZqwA0ZZOkEAceQxzARDUvau6BhRx24v/ODBQ56PaGGMqJq5kZDsGwrU5Uj39CUWRHoh/5Lh7Ee7SZKjcYlQtnAzLs/K0L9iEo+bUccusy8Dxhhm1dyPRj0MNKEn1aCCIxYE6es8TXLRgy4ndfhM/wyEoRdmwyyBap72Xc0KawNE674mjQffyvJ4sBs8nJAK8ixMYFH8S/vsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CcJhCkItcJu8q7Jr6pmz0jzRgRHQ7joX0NeMpU8clho=;
 b=UkFg1Viu7sTV1VEU0jDYZjcob7XQA1a0WQoif5CvnYxgyH2kqHLY6M4mScxbZo4ynCuTzTeK5gDMTEX9O0W4D/YcuX/XSKmR2uNp10ejclKcxFu5K2bnb8Emlew+WUrkJV003zmZ2WeNZmSspMatVCHZLVvdTLvLOiAPmYqW+EwKEXCJsXdfwwd/J17KmRTKFRmI1do6GXYrP4TznPwrrLYs0LjjUmeLE1hG9le8YJEbOJ82PTrQaf6y3NrxXuWQMTrqLe/O82rVxD4pwC1Z12ZVKeIpchm/E0RckPL15UFZ4u/u8+xu14wa/mVFJsdoT2JKfYDaHBY1d+E6CibdjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.18; Thu, 28 Aug
 2025 17:49:41 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9052.023; Thu, 28 Aug 2025
 17:49:41 +0000
From: Imre Deak <imre.deak@intel.com>
To: <stable@vger.kernel.org>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.10.y] Revert "drm/dp: Change AUX DPCD probe address from
 DPCD_REV to LANE0_1_STATUS"
Date: Thu, 28 Aug 2025 20:49:27 +0300
Message-ID: <20250828174932.414566-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250828174932.414566-1-imre.deak@intel.com>
References: <20250828174932.414566-1-imre.deak@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0111.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::12) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: b92c9824-0f25-422e-9b13-08dde65b43c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e8IIdryy4fpRqVvDVvFGrt3iWMoOquart3oC6c/6lQj395KZ400NB8t2FWCV?=
 =?us-ascii?Q?q09N6LRDjRTdfVxZ+MwYJ9qbMkwb5tqnpistb/GPln3Jy6NN82Z7h58vxcRN?=
 =?us-ascii?Q?+DE2Fq7HXc0E5f/ARS+rUfqTo+Op/iTNtFhA8OYhtlyd3gVcIT9ODTED1Oa8?=
 =?us-ascii?Q?5/n8VJvzW1fncl5zgG2ox+HqOTA1Ez4d0FKgoK3ITnKdibDcw+KQX0kboYr3?=
 =?us-ascii?Q?RLs24o5QLw4D9xbXHbsuSCbTMH1Os1YOxQ+teIBl8P3o8nqYLBBVaYVr/oNx?=
 =?us-ascii?Q?9B0plUWpYLN87HBZ3cyLgpgni9eJr9HI0sD0f5vqcOge8mpudVWVVED/8XdX?=
 =?us-ascii?Q?EzLhjXLgu8Lm503dHQDeB37zorwwTQmZsgRHo+hpZWwdYVFx2GqYprO76vdj?=
 =?us-ascii?Q?11tBY1ArPvED8GXJ45bzgODeYcCQD2UZ4hR6hxJjEWz1t2KSY/S97v2sBfzj?=
 =?us-ascii?Q?nOLOXuQk2MCXUwmUxjzrn3Voi07Frk2FNXrY+KccHtp4JyYzOsHbao3FelDw?=
 =?us-ascii?Q?BGgLuUtgAjLrweL0hWLTrXSyZbH1fukSma4xQddpzC1Wyulbz5I+ZIo8mxLY?=
 =?us-ascii?Q?eRPwO1k4zZWknK7HmWoCojZGLNJgHKZh5r8TmSBd5BRUdx5WR+P+MGc/JThi?=
 =?us-ascii?Q?7LJSSWU8QxVfUBQtpsjZ8d0OZPWAHOR8a0R5qYdpVGzJ0qQHrVb23B6y6IhS?=
 =?us-ascii?Q?6yaNxN146NSi5hqejuEuvjMKEb7UInOiwDAE/XUWXWC/WitPM0CkJrausgAp?=
 =?us-ascii?Q?neyYx0iuLpKt5IXyeOIZ1H5OBO5lsMZEqAYz34OaEKhRwJdFpBn4p3nDtLpV?=
 =?us-ascii?Q?yVAJ+IByc9Ue4NZMhB6vVhBo9hFZYqlm0murg+SNvPvg0V5v+FsGfC7oHWBC?=
 =?us-ascii?Q?gV/Ro31fa5UC/1vHDm5zSjoHKtreLaDkeCuLp79QYqt3gfJJrj8UFcXXUbDR?=
 =?us-ascii?Q?CD4v2I65jUkmVylKltJeSHlINmxWvtlyhD8xU3STB6lCUIw3FxixpB5OwEh7?=
 =?us-ascii?Q?Q4hn4IMQ512w4ZNQ9k3XGTrnoTXe7B75+PaLHXYphqHmaZ9oV41DNYYGtoqf?=
 =?us-ascii?Q?bKbNwWEEUlIPIPBEtYNRyYwBwiqosaoHs1R7UA1XYSL2s17q7yBxiAK14QK3?=
 =?us-ascii?Q?Z7aQkpgYIIK5SCvuYFs0y0Y9iURuiHrqK2xUyqjKOBUZL9OogQFtyZTo5Nuk?=
 =?us-ascii?Q?iKxAqlztRuDvE0Tr96/JhBroAIq1gG+7hc91OCuMvIQIbLFC6KpBYxzpWB8E?=
 =?us-ascii?Q?92nuDnARP/NlcdqP3rS9zqUC4bylYkyqJLDXuQTekvOThGy5nJYtf5UUvU1+?=
 =?us-ascii?Q?7JSl/JctUweaQxdP3PHVfv9VGBgtWvd077V/SJ7HSP5TemaQDpDt13rYRW1M?=
 =?us-ascii?Q?31aFDGI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wEdODqwPOFyqwv5Dh0Laeq08RIFtRmmMv7q+eCR+ea3jVhHUMnwxXCmhWAqu?=
 =?us-ascii?Q?TyFDfKzKSl0hv4AZ17Pk9O+XIxdBE33MTDz000mjjD430B1TbfVmwtmV1DBV?=
 =?us-ascii?Q?LkmW3cmEPzaNoOU46z8EeIkpjo436D1Tb+C5VBgXOtLroLbXie6LEa+WPO7s?=
 =?us-ascii?Q?qKi9AwP7Jd4QbjxtWxcdDDOIkgZXEWYsZo6zf69Hp+6n4ijPIj4EHMLrglUj?=
 =?us-ascii?Q?nAE9O34kFFa2/3STX9F6BVoZn+TLpM9OYfCXmaufuEzK70o40ZCEzhIQ7P++?=
 =?us-ascii?Q?sb0ppREfnSa6PJmLYTPpTb/lypJ5DCK8wyhYlTGSkIk3Vs5If5gnoS1bIvtz?=
 =?us-ascii?Q?g7HPcUwoF79uxza6nqh+f4qHZxGP+Ol++0vlvICQPWP1yAX1jxSLznYR5n3+?=
 =?us-ascii?Q?3w+gGBwQT+eA4mEC9PZZZjgG3i551dCq4MUANbOLtDh68NDrCOMT8OLWM6RY?=
 =?us-ascii?Q?aH/LlmQcnTfLK1GLfTdzaiFYnuIJUscVCFKa69ef/noW2d+5zyUZeeVx8zfL?=
 =?us-ascii?Q?PYCLB1hcsZiLgwXmcZWIJ5nIs4Dwbu1AD/UtDf1COGSV52xfZjDuJW27QJMc?=
 =?us-ascii?Q?FIYR+P2nYSFR0Jr464fOVJNDT3r5RFZva/5nWF/TQn/VeQ7mGrdLGuuZISc/?=
 =?us-ascii?Q?szY4BhtYU0CGEt93LBat4VEZvkKCcE8hfYmB5EMMXGDy2Ma9iHcaC6JyMP0J?=
 =?us-ascii?Q?WiQOjhhUDt2PPS5BNgsaOMHQwhbG6z1siY/F+NJShmxQoD4hM+nE/erCJ3K3?=
 =?us-ascii?Q?2PDCIthLhxfHqvDZf4Rk+AFLuxUFrhR+qFPVok0GTVrH2MJT8jp3dIQZQfpN?=
 =?us-ascii?Q?r/a/mgiImmopt5zHQyKbHpue/W3lEcN/VrkgiRU7+9ckELtoTNoLDALxvT/R?=
 =?us-ascii?Q?OTsR2WtGWeJMr1BzF8B+3k/9Jws0+MmT0wdDvuAQCejg8YGtS5R5zJH79Ss7?=
 =?us-ascii?Q?0Qlh1V8sCJ2xOlVM5T8KibSO2foe+IgS5iIhmQIoVVjOGN2fwe1YL+7ULJ+t?=
 =?us-ascii?Q?vcyNRQ8tlmLQ0ElPi+cl2x3uJFld1ZIx41b0P1LN4NM0uObuQXgNmQYCnFJw?=
 =?us-ascii?Q?nGFuEav72U7bqHceHL3bmwUp8/SMFB7KCIIsrotc+tVzoC/A4SiELmM5sjPQ?=
 =?us-ascii?Q?PwYfgtW6Hjb4yn+Gca5q2Sc2g/okB2FHlnTB7qRQpOlu1EOPhQSfK1wJSsez?=
 =?us-ascii?Q?5P4A/g3tRSwa7+o0gKaD1xQLk6cCk9fJFY4rRdQsZz6YHC9NyIwf41eToiqP?=
 =?us-ascii?Q?EM1JqzWS39cb2hX17AtmEdOzTpc4d6+Epn75rbWl1r0PfIwAaw/Tdbi9k47N?=
 =?us-ascii?Q?U3oyByzFkrdk78h9exlmMlK0GJ4iKP0B/oM73CAGYSOlKB70f8nm8S+AxGnt?=
 =?us-ascii?Q?N6ATltTzIaogxYZ28Q8y/GmyHAcqjx301OehSjg1cZ1sDhVQJWnOxHhl2Ban?=
 =?us-ascii?Q?Bx9QfTysyXCKqSh0C4B+ytF9mAjtQ1ZN3R6Sd2/cuAZNEu1liRHhSjwMjAjk?=
 =?us-ascii?Q?oQbJtT4pzsbTPiDxsWIs41UME8x8wv+5w0TJQr0Zm4jTUjjFWIAQqhPwoy+T?=
 =?us-ascii?Q?dckBpToKZEgnF3fGaaw7OXMB9Poc052glQDm5M0HXT6t/6bADbhBEB2ZzfEs?=
 =?us-ascii?Q?ZSKbPcFQWN/JoZmWoMmQUsvpizRcjasJ4P/oaY59PqBa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b92c9824-0f25-422e-9b13-08dde65b43c8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 17:49:41.3064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VOc8lpFYxBTj/79y2mGyS/6mlusbB5+tbu9IO3dwv3Tz96LCokw3PM2BxADjPfuNUxqaubxef9AtJftFPiyhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
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

This reverts commit 89d17a2d89a83c5b7643ca934651a3f9229e4734.

The upstream commit a40c5d727b8111b5db424a1e43e14a1dcce1e77f ("drm/dp:
Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS") the
reverted commit backported causes a regression, on one eDP panel at
least resulting in display flickering, described in detail at the Link:
below. The issue fixed by the upstream commit will need a different
solution, revert the backport for now.

Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: Sasha Levin <sashal@kernel.org>
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index ba8ab1dc4912..6ba16db77500 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -299,7 +299,7 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
 	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, DP_LANE0_1_STATUS,
+		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, DP_DPCD_REV,
 					 buffer, 1);
 		if (ret != 1)
 			goto out;
-- 
2.49.1

