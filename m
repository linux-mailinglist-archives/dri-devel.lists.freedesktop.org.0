Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D923AC4087E
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 16:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5337610EAF4;
	Fri,  7 Nov 2025 15:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXC8wtp/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A03710EAF2;
 Fri,  7 Nov 2025 15:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762528037; x=1794064037;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=P6E0sxNTAaGxSoAvV0WJ8iAr6F4as4I5ihIIj+2yP/E=;
 b=VXC8wtp/NyCct7F8afPt0a14m2ZaGephaCu8GDgHRjqk7BdBwzmeMYaC
 w+AvnMEiOFSSpuJK5h+DaYNXU5/p7Wm+4io3+bMErAbueOWTeJvD34mPS
 IYlbGtOUq5K+9dXhT/a59b3DGHU2QZti/eOPLihCWg3soWW7H4+PQ1Zfo
 VC3xezIPy2LtJ7c4BMjrz0kdfFBjU+4UMmfIUbvqCd6IStqkY0N9CnfKJ
 6YSq+JIWydXvrlWfPLKRQkX0gIAouClOMPQXEfA5uQdB96Q7THFnZXHGc
 xRcKgSg6WuPxYBVV2OG4TTVOdaUJWdYDgofYDvUqfiP9tjjoChvBb1cav A==;
X-CSE-ConnectionGUID: 587i48e3T/CnWae6Hm0AQQ==
X-CSE-MsgGUID: 7okj95DcTOyyKidWMSKP1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="64376625"
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="64376625"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 07:07:16 -0800
X-CSE-ConnectionGUID: K550GDPuQUyDOoPFrJdzlw==
X-CSE-MsgGUID: RaFUhFSUQIGX+cqbwMu5/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,287,1754982000"; d="scan'208";a="218714607"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 07:07:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 07:07:15 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 07:07:15 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 07:07:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Au9xic6JrK91DLu1lDkfpnI3cgP7aW1kTi5WqyCsToUJCu7yHvf37sXsuLCV57HIze3rPMSEEgsvY4SpesnREJLaT3jtaaXiypciiVm4FkM+NvVbQ5Oo4yZ6EiNZgY9zFg2KicOaL2tb6d5oTX2PcR2QkEBv9LKKcbECDXrxXPeqGaw7Vg6MJ7/1Gn1HRL5VjOTbMWyEFdbPkX2pcIRf/SF6N3VVGkFgnm3Jg9QFyOC/jnIhHpu2AuF0OhwXYqi8LwiBMzu9umW2MEE8VAFgp0ExGgnLtIxfbUuqqJtazUavUDm3gl1QaQSuLFBjsXVKpOHhiSwDrXgm51CMhVq7Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vpo9AZTZKUk8svzpVw/d49pVKQuEf1tMJVMkjCxvlH0=;
 b=a3mOpGxsiZXlFB/+BgeDf3fiBKQZTCixjNOzLZv0gUiH3LXXuz2aST+zW754d3ad6YqKBAgwvZ6Vdam12sY+SqPZPGIHdxw/qaq7reRo4sW6VaE/eozwiS3z2nWSRPQSaI/i6/TKTLl8AJ5inA4/u+od+7PyyXa0N6T3h/RRV+T0iPhGezjTaxjhFjS3dtAZyBeEv1DoNA1sHS6WKi1prmn+5jQtlVCo5/S9j08vSEn8AzldCGfwdw3uECmJkXsuum8gLeLkfhoAvcijZnzG1vEBQBUQtqMTYGN+knl4/9gP5I3zRn8gRmU+WBj6FjeZv/aalSx4oCgZl1+l5s/M9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4709.namprd11.prod.outlook.com (2603:10b6:208:267::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 15:07:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 15:07:11 +0000
Date: Fri, 7 Nov 2025 09:07:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <mvfyflloncy76a7nmkatpj6f2afddavwsibz3y4u4wo6gznro5@rdulkuh5wvje>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0079.namprd05.prod.outlook.com
 (2603:10b6:a03:332::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4709:EE_
X-MS-Office365-Filtering-Correlation-Id: c4220cfe-c34b-4dad-8576-08de1e0f53e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wn5ZxFdAh0yIXLpf4CktvJy6RoObYjFEhBVi1L2/W9OemCW/z+XrNiTz0C?=
 =?iso-8859-1?Q?kV3ngjNje3lFT/gnzi3CpvaG01rR8qyyPc2NPim2+LXewSsfhI5kZI1NP7?=
 =?iso-8859-1?Q?tjLIAFL4VqemhZVSF0jX55p6B/3vShVQIj4c3ZIR8qcZuLNneUawac9OV2?=
 =?iso-8859-1?Q?Ewg72IGHEb0PtK8VOiCwe9fS0yFNLIV7SsILsZYP2D7drdjK+alIKD8axF?=
 =?iso-8859-1?Q?QO2TfjltYB64lNCIWsP1CGreQZJydsmhm3/BLUn2BohLUPwyuyq4rey+um?=
 =?iso-8859-1?Q?PeJutNEpKRYAtd2TpvmOpqcn8ORizHz2/iMX9UOwqkea+C7YR7aY6CPqSL?=
 =?iso-8859-1?Q?Tiq0z1NbaA+eXNjVmzmhPmCQ6Q72HW61NLkNoS5ZKR0Vth1PpooflWLdEy?=
 =?iso-8859-1?Q?6IM2wiyekQoq8b2UwM7cOuy0OUvb16k023+5J99xpyIy+hGbjg6ip7Hncf?=
 =?iso-8859-1?Q?0WvTXWQvK5s1vpcACcC2+DeOPaJKHdCcUiYIPR+NsWimbZ3qtX4UmxSED9?=
 =?iso-8859-1?Q?3B7djD7wlhTqEjGwn88cf57OmQEAVa/qV6iqRq+geIRwwzupou0BhfNm8M?=
 =?iso-8859-1?Q?G44i4DVPtb1je5zY9ZfSkKopcYWr3eNs2UEriktplOOS6wzdi1ejpitB2l?=
 =?iso-8859-1?Q?+/zKMXdbZ8avWUB0GHXmggsNoYzFePjg1a5dGJRJKwvLW7g2b3rrVCS4qM?=
 =?iso-8859-1?Q?5fZn3zT5BTLJYSyuttXY6lGUXMqYFB+rYCmtX/l3z0FAwdJt5DDWENwrkS?=
 =?iso-8859-1?Q?AwqqN8PLFqM1z9pA6UryCdzo97UAS79neLADv73aQRnRK10guXVKjatlMd?=
 =?iso-8859-1?Q?U5txoy6WVEyaVWDqq1AxoAexAyxCCSkbUl7u2AE5Fjawn49aIeqx3k0L/n?=
 =?iso-8859-1?Q?fg3p//MaVw2Gc8GFDnSdKSS9+CHx8SLuwN0rscXF0ZrYcs9KnBph9FWe10?=
 =?iso-8859-1?Q?Ldf1yMODdiAQ9z9k/JlIEze7bHqvSL/TWyW/ExdzyJeeDWO3P6IZGOEWKO?=
 =?iso-8859-1?Q?QGFLL3HdTX2fNKSzq+LYmwLi8zLekaYbY6IuGHseBwwE9elKpfXDgS8A6O?=
 =?iso-8859-1?Q?AfSZKPIf/6UMmPKvrY+s1y+RYG/bekixiwZF5Pw3Ipqya7YkeCRTWDgjm7?=
 =?iso-8859-1?Q?kIv5mqOpGaGUlhsxKAyf21L7WbhVnOe4XIpFy28l0SvncAAF5KfcXejaYr?=
 =?iso-8859-1?Q?2Eip8SYrNJ3/UY0onloTioTw6t7zE2muSR46PBkE2egXQvP16Zwm6UuabK?=
 =?iso-8859-1?Q?5VUDiABiwlQIHVcO8xKytvCax1ZE9CuiRsY41GhsMq5vnOmAkd26FXHc/C?=
 =?iso-8859-1?Q?cGv/vO4902IT/7NKNT30Ebo2O//dieOj8Q4qIWdgwTjCwklqAuXj/zhaIA?=
 =?iso-8859-1?Q?jCHhyR5717pJg6D18e4NlyDM9mPMqoyQeIIT40KTM58fjNXUR/+si9iHs0?=
 =?iso-8859-1?Q?bS4ZKYSCVviitTO9THqgUREP403THu4n9xbMgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ouH/8imT7/wPLuaKocMmdM7FE3o5nJswm/8iM5Sgi1WAeV8ewv6So3FAAd?=
 =?iso-8859-1?Q?RptoA8vxW07TGnhoiki0eQXrXnNLa5xWOeKMM02rAmC4/7USrRmLSslWgw?=
 =?iso-8859-1?Q?xkTEOFgGd5b784pBdIn0yuHkpny1LCxdDy80RimzQuuunwnj6NLPDjvrSs?=
 =?iso-8859-1?Q?J0yHOfIyGODYyIoNoyqWWdNSEmrmRryOWCsTI3Ij02Hw2LRpljTRyRueDO?=
 =?iso-8859-1?Q?TBIe4ETt6FY06Ybcj66K0kRtiA/w/Iy2fkTTSSEN+MzWScZdX7hxTVZZj5?=
 =?iso-8859-1?Q?Gva+lJjIxp4/4jyZH4DCQjbZAFVn1pifM5yh02yR40PVqQI36nNvOlmDYx?=
 =?iso-8859-1?Q?JeZzS9Rb1hMyCUoNvB8lbUflDsK0JI2h/GHu3uJhdpOX60I6Irn1yho7w8?=
 =?iso-8859-1?Q?ojxHNHpxLBcOxXWnX3cRcKgDrm88R4IxNYe8JK4s6lE7Gh7zCa097RVxV6?=
 =?iso-8859-1?Q?8RG0IIp3++wBsKfDZEShxa2AUevmoaiDPSIy6gnY4Il4sNozJnB6usq4J+?=
 =?iso-8859-1?Q?cxGbSB14qWXrOMC69YrZ6Was+4Jn29D1D5nIWUYq5OYTfT8jS/QNeVyTvP?=
 =?iso-8859-1?Q?5hgpxmk/3+JAKs/vXmEfTQKFmAKJCrcEX5cbFwqyM032eI1QqM37sphh0r?=
 =?iso-8859-1?Q?2O7bS7d08Eb33i8hlDf2AkQbQ6efJsV0qSfVN6x1KYXcy8Go4cGrkevzZ4?=
 =?iso-8859-1?Q?ZhBpuUNFVVa66QLIAvMThR9T5Gk9t2Tg+/CiGjsXKN50z++gJCKgCANj7i?=
 =?iso-8859-1?Q?MuhzZQv4z0FxFy4kSRLpsPAMosgR21H7fAhthk9MLHBg73+ClDVI1t7r9q?=
 =?iso-8859-1?Q?6fxQc2lCORrhpUBzN8iZtYQuX0hWGZeznb1vy+Ml2p2jvIGEdXwe6YK2A5?=
 =?iso-8859-1?Q?9N0YbL8ExNT4NGkMorK2Z0k1b7mmH3igNzH0kGpYkVDPHGNNXakFtfHSmC?=
 =?iso-8859-1?Q?Lkd5eRh24XbUh1ivQmr3SrJg7FgEe4hn2qlSl4b0vG0KREwSAu1Tg36oEb?=
 =?iso-8859-1?Q?paj8yPaTX9rQKtocveEdQkIeFKeuZDQ0NGYNmEg4QsZlpxzq73kpl3BL+f?=
 =?iso-8859-1?Q?XTNCag60/aKyplOrGbfMcBZgd0OWZb+TGCmF4EhL/edbnP86iOwfp+ZhFs?=
 =?iso-8859-1?Q?Ycjm/2nzNYLAQ+BOjaiRewE0NLCmwlp3vH0gbZ9J7hV2yszEay/wkM61Br?=
 =?iso-8859-1?Q?P142bGSgzAt49BYGVIwhJhy44iVFEQ80zr+3BeOx5RURj+334riXv8Sda6?=
 =?iso-8859-1?Q?nIWcf2EmPN4nu61mua8mcLxCrhIA9JeiiHphTq28AX44V5kNhbWP55KO01?=
 =?iso-8859-1?Q?bw+9pS0KYl8Sxd1TlS4Gz1HrBBv/JQqukFQN71GZxumjpSeT69trQvSTU+?=
 =?iso-8859-1?Q?SxLgXjtc/92OxzKt9a2hlo1I6zwzGP2GtBQRtMuJgxAXWXiq1JuHF7zKWy?=
 =?iso-8859-1?Q?tSNV26Pt+Q2m3jBTkiT/p1sMDQqHAogL3wGETZHXfKJ5B15Q6bHOedU45a?=
 =?iso-8859-1?Q?9tpEXXFj+tvd8azt3t8vOep2QB4K3j6ctUiTR8WstmDiQHXlyGKzdvTKQU?=
 =?iso-8859-1?Q?+I632VKlYnqVgtS9SjaY6RWyoCdOKHkrtojAsNg+7dgUF2Ree9B66lrqPL?=
 =?iso-8859-1?Q?Mq3SpahFcSxZiONZW4RXWXPNk+WqST9OJpTO4xxQeW1gtOlDWi5VgnRA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4220cfe-c34b-4dad-8576-08de1e0f53e3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 15:07:11.6206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBOTrMJaJvnLwqHnUJXvLmdDYcEyo2noXe6B1UQ/s55YltSyU1IuUvjR0bi1bw/mC0xY5yP9BBfj928zCJu05SWsK6UYk3w+kzl7B8cEMM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4709
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

Hi Dave and Sima,

Here are the fixes towards 6.18-rc5.

drm-xe-fixes-2025-11-07:
Driver Changes:
  - Fix missing  synchronization on unbind (Balasubramani Vivekanandan)
  - Fix device shutdown when doing FLR (Jouni Högander)
  - Fix user fence signaling order (Matthew Brost)

thanks,
Lucas De Marchi

The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

   Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

   https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-11-07

for you to fetch changes up to 0995c2fc39b0f998d40f5d276f67ae22fc1c37c3:

   drm/xe: Enforce correct user fence signaling order using (2025-11-07 03:55:19 -0800)

----------------------------------------------------------------
Driver Changes:
  - Fix missing  synchronization on unbind (Balasubramani Vivekanandan)
  - Fix device shutdown when doing FLR (Jouni Högander)
  - Fix user fence signaling order (Matthew Brost)

----------------------------------------------------------------
Balasubramani Vivekanandan (1):
       drm/xe/guc: Synchronize Dead CT worker with unbind

Jouni Högander (1):
       drm/xe: Do clean shutdown also when using flr

Matthew Brost (1):
       drm/xe: Enforce correct user fence signaling order using

Tejas Upadhyay (1):
       drm/xe: Move declarations under conditional branch

  drivers/gpu/drm/xe/xe_device.c           | 14 +++++-----
  drivers/gpu/drm/xe/xe_exec.c             |  3 ++-
  drivers/gpu/drm/xe/xe_exec_queue.c       | 14 ++++++++++
  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++++
  drivers/gpu/drm/xe/xe_guc_ct.c           |  3 +++
  drivers/gpu/drm/xe/xe_oa.c               | 45 +++++++++++++++++++++-----------
  drivers/gpu/drm/xe/xe_oa_types.h         |  8 ++++++
  drivers/gpu/drm/xe/xe_sync.c             | 17 ++++++++++--
  drivers/gpu/drm/xe/xe_sync.h             |  3 +++
  drivers/gpu/drm/xe/xe_sync_types.h       |  3 +++
  drivers/gpu/drm/xe/xe_vm.c               |  4 +++
  11 files changed, 96 insertions(+), 25 deletions(-)
