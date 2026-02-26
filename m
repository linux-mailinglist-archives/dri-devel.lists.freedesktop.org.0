Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGLCIC9GoGkuhwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:10:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D401A6208
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE68A10E925;
	Thu, 26 Feb 2026 13:10:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZATB1ZiS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B2810E00B;
 Thu, 26 Feb 2026 13:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772111401; x=1803647401;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=4Zx8u2yObjpU/DuMfPCntMy1Ut6xSqTFvNAl+UkRG4A=;
 b=ZATB1ZiSwYOWNIg+Y0GUXfZahFRxDc3TYFRhqcBAdv3NQWasI4Z8ha7c
 bzwaagqFF+5jourzyzV+ly3L+Cztpc+foB4HFwz//NrXZv1O5dfySYP7R
 5m1OhS/l2hrIC2s9wFXUxhfp3qVUS5/1OvBy5wCwYeId6RNP8zPqgumnG
 ESucxWXfoYaU4QgHBQ8vosoAof7WKAarNHLXDKfIJnGnkiRyQez5meeDy
 hRdS0f7yRUN46WbsqYm8dVgPUPikneLxNmPuI3ZWLcydf7PZ6tvX17qbn
 MPzjNnuDv/L3yyX8COlcOvPp4sUZ0pcjUKSRt8MU3j5mm0NW3ZOCQl/Yv A==;
X-CSE-ConnectionGUID: THE3e6SoQq2yxXzeXcDGRA==
X-CSE-MsgGUID: 0ZZljKcKT+iYpUCQ6Q69Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="77038743"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="77038743"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 05:10:00 -0800
X-CSE-ConnectionGUID: UYIaWpYWQXymAauR5TYrdg==
X-CSE-MsgGUID: rKAebnwdQ2WcvkvaUvB6yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="216696202"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 05:10:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 05:09:59 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 05:09:59 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 05:09:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n+or8rDWwpySmtebezl0kwkYZ9U49vA+dZWFc1fivjrz6LYObG1xMZk0hn4+1Wbom2FoSaihJVUgCykLfCTSp68UsIrWJuqmYQw7bjjHzU3Af4fpBstq88JD0+3DDJCA5AvLncOo1c1X28YOSUTS1ggepad1c3MElQB36Tzcm57HCuc8A5Va0syOMm6PzPrOXse3BbGurgNP4CRcszsnuuaecJpkpfYPToKXSXKFXLHByrU2yPydw7f3PpFHdcnpvnjGw5HIedt1Gbo9MhREnYd4GygQ/3uH/9/jh73sZCznYgNHQ3qdwAPgUFKwp0EdGoHaurXKsJfqscAC4wmGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eg5jIaCyjfT1UFWhyS2k/tCyPQBj9Of2uysg5bV3yX4=;
 b=mrJxScmjtm7yO6M0aTJ/ASqXm9NkWlEHymaqdvagZnPMpIMCZts2UzBDS7v4bv311sfsNhgu3UwTv4g5FoYwENEoQBYlDsDl/4X2dk8G7tSCrfklYaVHRt5D/qbUOW7Lk26YqIHZ8vcndeGk3aWS7e4M8nOHrGAgdaWy4RRIt7SsEAvmEpgw/aRZQyLJljeTW61sVSbH7N3KDMuEA8kVtui7W08PUrYoGRaVmZZdtLOkZ0oEEnir6hDVJ7QGzsR/gFhKsTVvCtp1L5L1iIbl8mnTqQaVnF1ZFsoPIMAwXyXmWuVk1xX0QGtF0VzdGnElus8JnfAeZmgy4aXqk8NA4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA4PR11MB8961.namprd11.prod.outlook.com (2603:10b6:208:56e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 26 Feb
 2026 13:09:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 13:09:57 +0000
Date: Thu, 26 Feb 2026 08:09:51 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <aaBGHy_0RLGGIBP5@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::15) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA4PR11MB8961:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e39175a-d50c-4dc6-5899-08de75385702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: ZP4XWhpTWlF/r5DeNfNzVcunN421Uiy5lepYh5BXhapuHzDthm/gaGTiJnOJi8m358/q36PhJEVK5nz/q939d73eyP+C5SgmfrPBaExP2oDonu34WRhM7wxK/PM8g9+8WQNN1JNqq+D+IKXmQZ0+B32yjm2qvws4o7P/7WxV+5Bx/YkYtGOFnSAqX7pytsc9py68I3IWygImGRXbxYrMCgSRWBnxhOkNqXJ5hAUgZbawz447+sKHM1Dasd2jol6DFfnXkJH1WvDMlPVpTR+Ib6cD9s3e+HimcVAumZvSg9RWgipvb/ydIedC13f8mwhN6vTRCkydZwFrN1qrdHD/TqRjcWT1DsodAsS5jIYPPkjfgclxqgVjX4B0czwqTA4gsO/ftohXKWFFjq/R1gpba/x0Uazh6XoyMx4Bg5Pdd3zww/7EkNkVD1aiMQj+DLhp9L+kJnJEnPYLh/0VapkHCsPfICqbJXR62tK7f4mSJKqQKrIMcAxSkPnaJUTbrLwtDTxmBl+hks1kEDujPepOd+EV3CycvrsvBmFlBwVXRaJ2R8qTc/SZnpKVLjHW9SwdjmlRg06YHCnFXnPfAFjGFvXIAaCn+g0rluJdqR/fuJa58JeRolNxgMaI1C3URAlD5T6D1stVWgk2VHDPO+vnQ9y2Q6OnsVwpH/NAkALz9S4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w5rARXI3Opky33TXhaTO2VaaLtkiHshuEShE6lrLdp830KBT0YkGIfX7Z9iC?=
 =?us-ascii?Q?NcNQm2+8aTFRwZRZRj/GY3i/xwZoM5No+BfDv2sn5jQrD+EyCyhccvpaCqFu?=
 =?us-ascii?Q?KCdPkwOhzyfOl/TyIaLzm1+TL3Y/+17PyDZokjAmz6ABU6oTlSdAvJcNd6re?=
 =?us-ascii?Q?W6hhiEQa1HshkwmZZF8R0qItczVIGcOmoXaBF0PSj03VJV/fp1yjGtXRy1F9?=
 =?us-ascii?Q?u3CsA0ygHE4/SsifE/9ip2NYD3IYTot16951KUevi96dy7TQOfG1hHgqyzDw?=
 =?us-ascii?Q?JuwcrsABylQoM2ibpxnW5XHMpZp1pCaVgTK+0LGBqJbHUch+cCv2+5EvP/IW?=
 =?us-ascii?Q?bGe79n5Ty6hmHIqHRVXrTCjEP8DlwNb/IIBQClflcNQO/DPENfnM4GdmIY3/?=
 =?us-ascii?Q?oY+86OY/YuTjQM7mkxV/sEgRuOGNfwcQFiE0EXt+smrFblwHGWcOwAsrF8+i?=
 =?us-ascii?Q?6Vih2w3bNMUHttO28hQE6u6UHkZWuujYRqUxXCOT0cYWTYzLth2jOdBq2GUS?=
 =?us-ascii?Q?yfZ1efv9US9SmRLjbrruu8ayblLpSSUIztOqP1d/9yUZc1qwKxVBsSZY+kwx?=
 =?us-ascii?Q?UfWSG+ZvyqJD7Q2Ww45Tae5OpNsA0cyukz0uCrZjiG+QXYkfocCS0AisvgMb?=
 =?us-ascii?Q?ItM8cgQkzPLnBZ5rpxgK4UgB/L8+vP2pAGu5JPeGad0Bvz7KznmuZjSJ78+q?=
 =?us-ascii?Q?hCCTxxSyBwBX4DvZo/9mlWRFbJAhze7Sto/PNTvTlvLKcNixqBBAdQmgS8r+?=
 =?us-ascii?Q?7kcoV2u/c8GGRvKYrxF4d8/lRfN2qlPlYUmMLtnzOo8dPVslWMMZgY8YLv5i?=
 =?us-ascii?Q?5saDsHQ91p+YgYhrQtn4chF++bkNKdCMtCjyLZWcuO+eVO6RaRfL0iwcE3/d?=
 =?us-ascii?Q?EolTsdgQzt02HgGMlxMDauE6jhM7W7JSr76dUGni2XUIdmb6PeUt8DqFl9yh?=
 =?us-ascii?Q?3Xlzn+K0Ztz90YIfVN6YIuOyT4nqDO1dtpYFJRwwCxwhBsE3kXsW/irViMUW?=
 =?us-ascii?Q?e6fbWskWUk0LotIhNAN1s1eKdOOBEUmVy353e4FbBkd1L+X53ZHL+2HxOdSc?=
 =?us-ascii?Q?5tu4xAnkSTNrAmon91LRx5RgykPbW9Ovlw/3fJaSEAJSL2Hc58ZBRVeikQAY?=
 =?us-ascii?Q?2W9gE3gg7iNOJi3rIkcZs/dWbR8KDee4LvxZMmiQ8kPHHkLwRxJIglmFejXQ?=
 =?us-ascii?Q?+2ROirytnfSLwZ/kkFxnpTytLjdW4e9+k7QwRQjF+lJGFYWENcYLEP+YQuaP?=
 =?us-ascii?Q?5OseHf2lNYYBd0QrMVksbN5cXQyBSG/umfioV7IyTQ03zBnCmfU1GwBTbEad?=
 =?us-ascii?Q?gUgBDlDlRaUS+iwajBPP8OqGOaoyzZAxUmVVx0uhLAPbkgimKWnjrl5us4YG?=
 =?us-ascii?Q?eS5tJsKHBcig+mtxOqxhoK2Va+AhRyUIHBz0x/6eqfK5ZdHSOFO8V+Ii/KPp?=
 =?us-ascii?Q?jJ+THaZId4LL61vrCHBtmwspUrXQWjDQF7jCzGoMrJkuEE6I4n9gdri4FUb3?=
 =?us-ascii?Q?1McP8muduVbWtSyE3PVn6yvhHyf+6vrTBKXvaGcgermuNmsiuoFE8qPLHelp?=
 =?us-ascii?Q?BXMvmTDcmkCyf5bW+qyhW4OmVIbNMVxncmoyaRefXUHZfKGqundEINABBlnb?=
 =?us-ascii?Q?u3Bvqc6LfvR+vH46s8jCuct95K4pUKLxfWCCWGAxNDdt6r8RlJrTy0wHgh02?=
 =?us-ascii?Q?bqvgip3HkIpzqQmwnK5VvWlLDUeYxolGSNvfOxOCOJzrW7AetjfiMTbP+yu1?=
 =?us-ascii?Q?aSP24xloQA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e39175a-d50c-4dc6-5899-08de75385702
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:09:57.3610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hVvc1P6hlCGhexNTG5q4FU6yyq9bI1deRUx6tz1WsCoQGhuNTCfx1IGTX2P4VbcoTBsNtayQFx0RHNWKOLQSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8961
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,intel.com:mid,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[rodrigo.vivi@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 13D401A6208
X-Rspamd-Action: no action

Hi Dave and Sima,

Here goes our first drm-xe-fixes PR for this 7.0 round.

Thanks,
Rodrigo.

drm-xe-fixes-2026-02-26:
- W/a fix for multi-cast registers (Roper)
- Fix xe_sync initialization issues (Shuicheng)
The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2026-02-26

for you to fetch changes up to 0879c3f04f67e2a1677c25dcc24669ce21eb6a6c:

  drm/xe/sync: Fix user fence leak on alloc failure (2026-02-23 16:48:43 -0500)

----------------------------------------------------------------
- W/a fix for multi-cast registers (Roper)
- Fix xe_sync initialization issues (Shuicheng)

----------------------------------------------------------------
Matt Roper (1):
      drm/xe/wa: Steer RMW of MCR registers while building default LRC

Shuicheng Lin (2):
      drm/xe/sync: Cleanup partially initialized sync on parse failure
      drm/xe/sync: Fix user fence leak on alloc failure

 drivers/gpu/drm/xe/regs/xe_engine_regs.h |  6 +++
 drivers/gpu/drm/xe/xe_gt.c               | 66 ++++++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_sync.c             | 30 ++++++++++-----
 3 files changed, 81 insertions(+), 21 deletions(-)
