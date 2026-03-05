Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id v7rbCM+GqWkh+gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:36:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BBC212A2B
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 14:36:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03AAE10E29E;
	Thu,  5 Mar 2026 13:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ltyG+FhV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA91B10E158;
 Thu,  5 Mar 2026 13:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772717770; x=1804253770;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=puwyjLi84aFlyGhDwFEBjlAWROeGEDxAI7h0fzMTL+g=;
 b=ltyG+FhVPd4zPAWLMh4xwchoPiNjMQnlUoT6xdb+MqYPWB7bujuQCl0U
 A/ccV+Be3Mb/2ytxhJhyLQtjBk3v/eLCHRkYRaai9e68rvj7IY/HXgbvh
 wqLVtddxwIL2AvWqaCmXlPabUsPGmQReki/hfEoLyHxw8frCXxomDN4xJ
 vw8pHKFFvsDGsSHub7N6m7NGBPpsB40W01zBLcObp7grp+bcfwVyEUL73
 LnIBpTOAXKsCl++IbaRvVlhY9md5tLaeydVVayiRmjcB+b5jxtv1UDkbP
 EVOv3EN1gwnruXAcE2S0fESxNoiyTAfEK9+JzapG7u0iUZMsLMwAN7H6z g==;
X-CSE-ConnectionGUID: N7izWNx1RaiBH4rKAgdhOA==
X-CSE-MsgGUID: vkKZe91MTECjURyJPaE5xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73672537"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73672537"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:36:09 -0800
X-CSE-ConnectionGUID: 7KJL6ZP5Q06DOcq8CIZu1w==
X-CSE-MsgGUID: 7pFOc/piTUyM8u1WCFE3LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="222834287"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 05:36:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 05:36:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 05:36:06 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 05:36:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8VLAThUF5Tday0AGTTjetpvBjfuaFntXvVIZxOoMfoH7ykvYspo9bUgoGNsC6+f0FjDm0Y7Yy/UJM1spkLR+/41sJNS8lj+e7jn2ACmyDeAI6jSkLqr0E2Bw8wZooIulmODZ7cmCL3pIU99B3kSfvyUTJkWnp6F4aexSkQ7CDPdYJSSU/fpPmqrjTk6EajSh+RZkEaO49c13lFP4frPJkIJVz+k4KifaCWxPOsgTNl3ymErzN54J3IT1eUBhhcdytjtIiLtqO3r8Gni7wjtVjaaUvuAY9UDVKg7O0jRvZz39G4xIVVoj3TnCMpr8ssIIMo4Wkh94aIN0z53fLG64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1riuVBisAJVwTL2iCR/v2ebcTlqhhsV01ujn2snO8g=;
 b=qZx/RgpK8V0j9AS9NHfXBoR9lxzE9iKoV/2Dr2U5yq2oupXDhIeeCNiCuB6Thlb3bKfkjm1d/YcErwUt/+0mu7a2FzKPlGg6hMlduFTVU+Ycsa8eMDx8wPZOY5vIon8WukH2h8RvXLASm/VVoc7WQnno7FkoRpQHXYHNqxtxLExfa/2AbecKwYXaooYa6EStmaiVM7oe7MiHNSbExHasXROPZsCXRAds46hZghGzCse/BFy0xWrL/436QER7TYtTPneO6YZPDmrJotB/cviIWYGix82XmspKtyBx8uxC2Vyi+X7caJAF+J4TKuSwryUaObmUTFi53krj3yyImtHr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 13:36:03 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 13:36:03 +0000
Date: Thu, 5 Mar 2026 08:35:58 -0500
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
Message-ID: <aamGvvGRBRtX8-6u@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0034.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::47) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ2PR11MB7617:EE_
X-MS-Office365-Filtering-Correlation-Id: 62bc5ab6-1c9b-4e16-75f2-08de7abc2582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: XIVombEbew+B2eJ1kjEjAsakT/Kd36zbOC+F9jnQIc9gSAwa7sjN8D/hdRPoYtFiTBDOlPpqyTUHx9Aq5fXJcwBCNkFmntzMrcpM7658xWff7Qwhg6+ma2CYjj68BRerC0aZu0IYGvhl6YBlj7yOgZntxD82u2OOoApyCr0wjBpjEzqvp8cTcFNf1iz42Fl49xd0yhXF5/Bgw0Ggrdp2MfRFMJR+uiKia17I3iZPLjEoyZ2jSPTMj3OtDldzdfd1RQRPndJ7HGxTV4TQb2SpePllBOj83LeEIiiFcqTtPY0wrcHUUjjWaW14GPW33L2M4Cp+I1K6iY9IWezUk638BO/gtzsxCP2M7jWnmRNmOHz9xqOlERxj3HQmSsp8tdpA6NSebyyXpnkVuCu1s9dCxtptvtnvkyEl3admzj8/ClWDtlREHIt+A+TehdpF/wzaRfzuKhh3XzMkEZg9uX1DzdLimOl5gax3k/eTJa/eEdf+eX0Cbls8gotFQ+y9mlSUIVZVIdxzoEn3Ca01Y5nEHWX3ZYnep6PkprGTsUgNqx+5ah1pbUMj8KtlzuBEDjdjKPHg5M45kgWGD2kETTR7aahBOiCLz5tbpU+V218dbJFNT3yYAYjJ3B1D3TXdvEgsy/oAr1q3ZXAFQsFzHlHQfrwN+VWgEUhdsxDEDHTDnGU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uc/6miOYASxlKWjDr3u5PaEhHX8dxnBVHPJGU+rRZOV19T6RdLl9gcBX+9?=
 =?iso-8859-1?Q?iz297GixeAABhpcHj3Ww+q0JNAxbo4F30AcaG3EilkSyIyx9p033PVin8a?=
 =?iso-8859-1?Q?5qVFHzbtzNlCTO2o7UoM0LEbrJhF+B5Bj+wbLhvY4X+ukS3PDvRi/Ufjmn?=
 =?iso-8859-1?Q?oawhtuqKYj+4Lh84/RCJljVEIKUFN0eMgNeDfbVqdxixmv4P9RfWTER41I?=
 =?iso-8859-1?Q?ApOWINGkt1T03P/+lw+KQKLZsKfBxGXjYomvN9pVR8aGr5aMDXK+Hku9nt?=
 =?iso-8859-1?Q?0ZSR6bA+6g7JogoiANia8hv0cdLmvORCXyZjlKMEQ4NGMsuvSM+RxMuJnH?=
 =?iso-8859-1?Q?8y/HN/nK509h5J0K/B4c1AkPSTa/OSMybrmAow3ZWISiZ8FPR02kUGavA5?=
 =?iso-8859-1?Q?J4HILVadQXFov4tBrspPXcVHUP0/e9QaUJke7na69e2H9j+jkz9BorOhtK?=
 =?iso-8859-1?Q?xaYc3PYycEeRaWDdrrmLu/7RMESfiUQbdkh9A0KbCjoYpSPHtghuIgvKdh?=
 =?iso-8859-1?Q?uEqCxRBQi1WhwxtkoRVdvnKP8KRASflS5zkPyIrcDaqkqiT97tZlRCbD++?=
 =?iso-8859-1?Q?f79qHCepC6gai/V8PTjt8y4j+C911o3Cjomw0HfqvjL6hRvG3vzO6KWdVl?=
 =?iso-8859-1?Q?FI2rtPZU52mMnrNKHC57HtIFKBEZcR8K+XieTg1lA8V/qzBkXasMa/+69p?=
 =?iso-8859-1?Q?veRYH1IvJ4IFGpylG7cNW+XHBLE5ZotGogZWB3+2hWMSCU09ReD5s8s4GF?=
 =?iso-8859-1?Q?fT0AOcAUi1syqhAkGbCjIhfic1t55OuIZnamKyQv4ptzVwhD1M2U+qtzo+?=
 =?iso-8859-1?Q?rxdYXrQTjoejQiv2I5eUgI59wBRN45vpEMwvrqc4kFS1YEi7HFNvO7uAkP?=
 =?iso-8859-1?Q?mDlHmxZ24r4AN2n2FmxsmPtZWBNg890i8AhFdqNtZCMQppzfwbdwyAaDm5?=
 =?iso-8859-1?Q?kG1xBzQ6f0ossQBKUKrvQp+ezDEMtHKyLkkN1iDLBhsnNGdlaAPq+7O6h9?=
 =?iso-8859-1?Q?TYZjxu7qpCVE73tBlDrDD3iR70BlZoTnXWjfNFVxnBwNlic31uxvMkNzX1?=
 =?iso-8859-1?Q?BrU2XNMqo5whLYl2ag3w7GfDyRyJ5u3lSvh/HbhWNoB6k8iOYD2XnVbQp/?=
 =?iso-8859-1?Q?0imKyfgPwWnCfnzVjxxLDveV9iJLh/XY0ITA44PvkltbFXQzOUOFMIAkeO?=
 =?iso-8859-1?Q?/shrFTPo+yRex0+9atTvFSsj21CdPk7nhgBSKgmZj29a47Hfx6A7QXrAfR?=
 =?iso-8859-1?Q?dqWBIe6woN5B+C+E8HIfbllV35xYmO0R1br7YwnfrWFFAEIJtYz2jQXhHH?=
 =?iso-8859-1?Q?J0wKH+A5EnWiJ1Xoyzh93Gcp9Yc3kB8DcfwCfZWf6eYejWBjjdRak8D5Fg?=
 =?iso-8859-1?Q?NWpdbvvxRN1JkKmdM2l7gEV86N0r0+ut17TX6NxErKcqoxHjUjnMVrHJ2X?=
 =?iso-8859-1?Q?AYLjqPLl/r/F5mJWrRkUh5a7jFA8yi+9j0n1NnIraloKHHOfHOXryCO1ZQ?=
 =?iso-8859-1?Q?hq9wnyfQtc3p7kwcSxdKA0hT0jgpyzqxf2waqqxOTpA59ZBef8hTpIqoxH?=
 =?iso-8859-1?Q?70/Ae/dbjVNlUL9s+jCx+5dXmItc4IrOi8iQbfm+URPNDXhrxzD6TJlrOq?=
 =?iso-8859-1?Q?wIjcpgcbDfDhm1mqxJSeoA0F8FWodhpUaYZnOpU21Uq4ySgp4So0GabtGK?=
 =?iso-8859-1?Q?vrnNhq5pZ8Z4MSS+g6M7Nab27SLZa+G6vFWB0JL4cxT9tt9o45g4ckfCjD?=
 =?iso-8859-1?Q?f3jARVsH7/Np8YoX7iJ+h6SWtNy1yBQg6QTR8vqyNcqCvkhRceT+BEayhM?=
 =?iso-8859-1?Q?4XN0yVKAig=3D=3D?=
X-Exchange-RoutingPolicyChecked: hcla2/RgokEWrDOTcNL3f7oT6iVuwWeuTb+4JU72k7v+9HjMmkqSLp8HY8Ks+9CKHuzWmazaafiS+Nb8w/TyMmHBamOaduPPLvt7TChysEnyY/TTo2GLRJDTMeDPD2qTpfStcJ8x8YGE5Hu+lVKIhyn96AhH6yEqOferUjt6XsGgX5uX5bCqyeKJEwICKHbtC8tyvZZxqIbgQdBh/pqkq0XqYaGoRv21nCVVJN2QV/SszlB5A7vYqliOl4gS4i5AehKDx1mjXdoyYg2XT9roaqiRkw9UxFp/d8RSc76q+h5FZtZe9YCoUfrzNMolQrrq575xHSHVO9OIR8yTOobQYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 62bc5ab6-1c9b-4e16-75f2-08de7abc2582
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:36:03.7003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQqi5LiR2QAtJM71ui7ljrwZMW7r54qXjRYfVbEe9D3vAr/rUJ1mkcH8VPy9MX9NeH8qifcWd4mBm1Zeja0XQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7617
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
X-Rspamd-Queue-Id: 75BBC212A2B
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:mid,gitlab.freedesktop.org:url];
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
X-Rspamd-Action: no action

Hi Dave and Sima,

Here goes our drm-xe-fixes towards 7.0-rc2

It is important to highlight it includes a fix to mm subsystem
to fix a hmm_range_fault starvation, and a subsequent revert to
drm/pagemap related to that.

The rest is regular xe fixes.

Thanks,
Rodrigo.

drm-xe-fixes-2026-03-05:
Cross-subsystem Changes:
 - mm: Fix a hmm_range_fault() livelock / starvation problem (Thomas)

Core Changes:
 - Revert "drm/pagemap: Disable device-to-device migration" (Thomas)

Driver Changes:
 - Do not preempt fence signaling CS instructions (Brost)
 - Some leak and finalization fixes (Shuicheng, Tomasz, Varun, Zhanjun)
 - Workaround fix (Roper)
The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2026-03-05

for you to fetch changes up to 0cfe9c4838f1147713f6b5c02094cd4dc0c598fa:

  drm/xe: Fix memory leak in xe_vm_madvise_ioctl (2026-03-04 08:54:19 -0500)

----------------------------------------------------------------
Cross-subsystem Changes:
 - mm: Fix a hmm_range_fault() livelock / starvation problem (Thomas)

Core Changes:
 - Revert "drm/pagemap: Disable device-to-device migration" (Thomas)

Driver Changes:
 - Do not preempt fence signaling CS instructions (Brost)
 - Some leak and finalization fixes (Shuicheng, Tomasz, Varun, Zhanjun)
 - Workaround fix (Roper)

----------------------------------------------------------------
Matt Roper (1):
      drm/xe/xe2_hpg: Correct implementation of Wa_16025250150

Matthew Brost (1):
      drm/xe: Do not preempt fence signaling CS instructions

Shuicheng Lin (2):
      drm/xe/configfs: Free ctx_restore_mid_bb in release
      drm/xe/reg_sr: Fix leak on xa_store failure

Thomas Hellström (2):
      mm: Fix a hmm_range_fault() livelock / starvation problem
      Revert "drm/pagemap: Disable device-to-device migration"

Tomasz Lis (1):
      drm/xe/queue: Call fini on exec queue creation fail

Varun Gupta (1):
      drm/xe: Fix memory leak in xe_vm_madvise_ioctl

Zhanjun Dong (1):
      drm/xe/gsc: Fix GSC proxy cleanup on early initialization failure

 drivers/gpu/drm/drm_pagemap.c      | 14 ++-----------
 drivers/gpu/drm/xe/xe_configfs.c   |  1 +
 drivers/gpu/drm/xe/xe_exec_queue.c | 23 ++++++++++----------
 drivers/gpu/drm/xe/xe_gsc_proxy.c  | 43 +++++++++++++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_gsc_types.h  |  2 ++
 drivers/gpu/drm/xe/xe_lrc.h        |  3 ++-
 drivers/gpu/drm/xe/xe_reg_sr.c     |  4 +++-
 drivers/gpu/drm/xe/xe_ring_ops.c   |  9 ++++++++
 drivers/gpu/drm/xe/xe_vm_madvise.c |  3 ++-
 drivers/gpu/drm/xe/xe_wa.c         | 13 ++++++------
 include/linux/migrate.h            | 10 ++++++++-
 mm/filemap.c                       | 15 ++++++++-----
 mm/memory.c                        |  3 ++-
 mm/migrate.c                       |  8 +++----
 mm/migrate_device.c                |  2 +-
 15 files changed, 100 insertions(+), 53 deletions(-)
