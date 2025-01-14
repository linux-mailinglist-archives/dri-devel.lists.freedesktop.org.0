Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA14A10C0E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 17:17:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9160710E3C5;
	Tue, 14 Jan 2025 16:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqtTJVzG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182D610E3DC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 16:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736871422; x=1768407422;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=I08ztUwedBYE7Sp4rm7LcfxmEj7sWCYbjN+9oEamEpQ=;
 b=eqtTJVzGGV54fkZYFmUzXBHnv47b6bgGWrr6d7tfvHi3TKY6q3vpCJaP
 UbbvocqMqToGxNLHdi0YTVhPGjccUx/D1oU2tL3DEVu+eh95qE4EIwxeG
 28JGGMWH6OmplPUl8nGXg0hEve+RRy1yil7UOWWs+aVvUL31Pme4E+Rhi
 /hdS9Ag+stQay+I9dMlReIGScLNQ14mh/UZP4Z6yREpIREGC6DR4h/+NQ
 dJjzqqGTcewvGZQBQk3+RW8T9hUqY5+ec41CbvCQOm9/m5/3T5Eys/hih
 UROIL/+SXkYIb5Dg2t+wrRHOTy3y+eKfCRT7LH0BZMKr78qBXIzW18e9w g==;
X-CSE-ConnectionGUID: 532NA6tfRAOufQnu0z0Jiw==
X-CSE-MsgGUID: zWsg+3mATgan/TfyaFCCzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="59659412"
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="59659412"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 08:17:01 -0800
X-CSE-ConnectionGUID: VGmZPL19SPOIpjyzD+xDYA==
X-CSE-MsgGUID: mE4wVoYdRx6B78CDbGegyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; d="scan'208";a="105362229"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 08:16:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 08:16:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 08:16:58 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 08:16:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qENhqYyzfU8rVEwKZwqN9NqsgyHqeJWMTNL4TgvyJ0vEK6xEC5aG7NjRY7oCaC6g5p/nRVELb2UQkuuW5AcUp0JDxXT2XE80LpzJDPIB9UrORA1J9Rlj4cPxAE1M1Q2tmE1m8bQIw+mK/L5BMTZXlsCEDNq2XRguKc6zsrD94x0Tykmivbcridom57k/fhO5T4nvlCTJB6DGZY9Z2TPzmTJofoZ4ZCK+4tCrPG1cx7W3BBZOuduIPcJIcaX+tl8MIzQxhJuNrbbgftHsazqyyugJ33UXorwOseI7+yQU4dn8HF+3LPOwYk4+gMGCJrkM/1DqVXFhpaZt5EtiTzkqoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZFfCgBc9POTk5cRWkCZXgTHy2XOvPxOihJIyuNeNWA=;
 b=MfCm8cFZ42DS5vsmvcP7LEvVi5ROQbViXyZHPPGmVOfkjywQtvxIlQIL3U2FLTxd24CjfddP5OYEw9K54ftEulX/cnpp5SQNqP4/QozeCRBZrr08fJgcYD+DtmO+HIBeSAzNczpEshKgR4mXxZXa/MaPG/YygMlpf/JDLiFzd9LX7oDo7v1Iv32HcpYyz77mheq3cKLIhq7IKiZToDy0uOFwRW4Xf9BR00/0gscAj61RIN/cyYiAeSRqGPaGCiZ5a7MothMWaQ6NahUco7BoOwOei00slDK0ULg3V3LTXDRLBfyqV4gkIlMRouZBOLUMpyEpC3VVADNbCiDQIQKVuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by IA0PR11MB7209.namprd11.prod.outlook.com (2603:10b6:208:441::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 16:16:55 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 16:16:55 +0000
Date: Tue, 14 Jan 2025 11:16:50 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/bridge: fix documentation for the
 hdmi_audio_prepare() callback
Message-ID: <Z4aN8jQvqowYCqR6@intel.com>
References: <20250107-drm-bridge-fix-docs-v1-1-84e539e6f348@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250107-drm-bridge-fix-docs-v1-1-84e539e6f348@linaro.org>
X-ClientProxiedBy: MW4PR04CA0222.namprd04.prod.outlook.com
 (2603:10b6:303:87::17) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|IA0PR11MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb4c823-ab37-49f2-0f44-08dd34b6dccc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|1800799024|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DCd6IbYLp7Y+JwkxmzTxtooQVATJaqjhQt2/gkiOjgLctox0W+9duKmE1rGv?=
 =?us-ascii?Q?jSQmc1cfp1kRL/w41GIiqhE0q+cfCcVKToDRb/svTEsjYczclpXJozfax+3h?=
 =?us-ascii?Q?3qx59GHhOduDu7MbPFqAdzIxkcMKSiIVhVzyb0rQFWJ0dgnbaSrLjwD+9mlf?=
 =?us-ascii?Q?WiQmCi2bPldOy6ovU9v0dtep7llNFxp5F+ATZ/nl5kpPhbS8PfnpQbvn3Q5q?=
 =?us-ascii?Q?9dyi59BpvjUIZi6gQ1Rn57O5tTg0j4hJ0uWUh4UhW3k5Ryim5dH6hwb+VSPe?=
 =?us-ascii?Q?aqdlZGGkwyHgqLmbsSWjoFN1A39MWSArnltVK6sDz8WGDP6CMn668cBbVHqN?=
 =?us-ascii?Q?TxkpNdJQKL6Ng8VG/BbBr0w0ClrgyUdOveDhK8b3lay2lULkpEhylEfFYV/A?=
 =?us-ascii?Q?TkQhzB4nx86Nh3oUMOrjfuDKds7oUEFTVlhVxj4R/k/mKWr1iY1zTEaQBkyn?=
 =?us-ascii?Q?0ItbkrSs4JaxOEuhGs9hf3lk9RpGNY3986EkT1sz2AqZMlJaKUfAu8S55DNr?=
 =?us-ascii?Q?ShcoMrKcl5i0YzmQXCn2MRzj6uY40OnEodjHOIu3DBmn+6gIoMmDF4kUUK6O?=
 =?us-ascii?Q?QrK/zgviSwNLTLqbtPzl7uPKcy4dHCQYOAK7NDxjoYdH/l/vDckAULE7X50K?=
 =?us-ascii?Q?tcIAtowvRv4JtKAu34YTGubb7uph+foIvup6641kXOA1pbIMGFTTBb4V4K1o?=
 =?us-ascii?Q?SNXspJxQ+nCqC/bqZ/SQBHDtQyd+lrZUOJdFUU1BHQbKG+m1YpvNSmGnB2N7?=
 =?us-ascii?Q?u+yLlBwAplAKIwgNmurS6cUIqIxP9W1PhQYhGEMaPproYlLQpXCrb25d0Dcr?=
 =?us-ascii?Q?JMyVK45kt+JnZeKSPvs1lwUjMXPE/UDE3XkUxte4f7B0kbGZprtBuM11xUXK?=
 =?us-ascii?Q?AcrDcjQO5fUJv07kPFONppsI6NOxJU9+Z2AvxoIKZmjXjuIDzxfrHE4+5Ulv?=
 =?us-ascii?Q?TTEIGZoNiOJmo7lXIjCmc3CR0FhRkbQ2aYMItHAE2bdAnv9tE0Ie1qPZlKGx?=
 =?us-ascii?Q?XalbOxqcrcIG+oEteiy5F9ipjIvl8dhh05IH+3yMpWiMWpyGgr+Fueak5UQa?=
 =?us-ascii?Q?v/iwY4HoOc4ijN8DvMGEAbfXhepA85jr+1RLqbSzZQqhBPEFPyJvghayQvvR?=
 =?us-ascii?Q?FDw/fZE2BPCNwnqikJFNmKhNQPTIJUaxR/G5wEKaYOxEwB1MUGJK8O2OV2LS?=
 =?us-ascii?Q?K+EhKYcXbQjUQusukRFpD2RjzG7oixWDn1C0O2o51zygJlYokwdPY3fMc0iL?=
 =?us-ascii?Q?05bnYZG/vO1IBez8oabh1UvaYK4I7/psTPMzO8+zfd12/fPpFCsVxHehcV+e?=
 =?us-ascii?Q?bpZVS7kVIMWp/bSiyEHC+Xr2S6U+QQZTmWzI2gkQ9R0qr/2Yx4cHDGHHAZOk?=
 =?us-ascii?Q?CeO3/LsjEasXrDnc9XlnAIlYZ2+D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5oNIM8Fj/ozNsdUtqojRiIJMBwRI/NWcdepqSGSCR0vLCXqMydhsaXnG/s0c?=
 =?us-ascii?Q?3DIiFiL+6nbM6DJuqQ7t6lPf6ic80Fk50kQQgAW5sCo8vaMRGtqEyztlW4lf?=
 =?us-ascii?Q?qIj28rDe9XTmF3cSbnZ0Pd1Wdf5TMD9QUTmrm9/tzh3SQjSkFl/0S2G+kvJW?=
 =?us-ascii?Q?ECisonTwUkjhv7WqI2+iSGBs/3e83rxa28CPFdfFWqkeysn83W6pIIu6mBFa?=
 =?us-ascii?Q?f9+tB4mKI5ihU0jXf55fd6hX+RYdPg8nHckSRuuJpP+cVDP0VsXupiIRQZpg?=
 =?us-ascii?Q?kBLv11obvL/5Lyc+pfInfQYbwQAJE/GqxOL9Gl5iAoUxHQfhORvhoID9tvIZ?=
 =?us-ascii?Q?TAzJ48Fm5aQllbhYI8fyrZe2NZDbvWFNzfB+C0kmc4Qp3cLUJ8t6ZzgWmBDq?=
 =?us-ascii?Q?jNWZaTLCHxcfhQl2HyQXyDTUXwQ+tqrm1lgeOyK9KOB81BIHNRqIIMyF1Uew?=
 =?us-ascii?Q?VppCFgnv0ce6ehGnejCg/bmuge8CtmpTYtEVLUSD9qZtbxAly0PCbW/N2oHI?=
 =?us-ascii?Q?mwr3kzBBeSRHDnfhJRCtSWN4fgf6z/GvOaTed1V5Q9zysBgyYi6oV8EVUB4v?=
 =?us-ascii?Q?cNd5niF7o4e36ywq1wcdT778/cnQy6xwcdQXfjAntXV53xVOoeHAylRIMUZE?=
 =?us-ascii?Q?IU4MiGUNsaYBLS50Lqgnp16mJs0CxPQt09py+rStcgUwyjd/6hi7tcC5vlfZ?=
 =?us-ascii?Q?ygjQWp7yy1NPJM2O23RLHzq4Yw12meRggMLF4dpezjfQlVbGxjg0w7lFFwDL?=
 =?us-ascii?Q?w0WE5qL85WO2fnqMaRC5ov/1S7lK9iCcwLs2fDmwe+2b+w5NkbePqv8mshKb?=
 =?us-ascii?Q?MkMl2Tygq/WIAqO/JKOH499M13M/A5TZav3y7/9uEXwqWwJazu2Iz2V++WXu?=
 =?us-ascii?Q?JzTnL7wbtHODpdzE4t/entzpUgtJ4aYkEySn/bylJ3WUQ5fg0ZlmkpyaONd/?=
 =?us-ascii?Q?wkkmCxe4NabxDnHJR+gImIHWDXWdK4NbS+qrHWASHDIwAs4fw/6RrgflgZ0p?=
 =?us-ascii?Q?PKrj0O06L47FdZjWrxZgAWJDqQupbb8MBCTbdoNFvFJYFb34TX+lPis/OquA?=
 =?us-ascii?Q?IpN03Y0TOVJQpXOkD98+c02GCbDWWSCvmdBS/oJxobY+QRqMlUtAYff8I4U9?=
 =?us-ascii?Q?fWGPOyRROTfO+P0Tpf7YBTTKS3TBrFg1ZgQl7YFXD7d7OGPdoHuWkgljMRpl?=
 =?us-ascii?Q?64CfLycfaQLxUNj4FYc2RxeXQPsWPehFUIuvZQm6yt/emDOA9HnEvyZ9Sq5a?=
 =?us-ascii?Q?7VN0XbVKAEscCc/xq/n++k1ySISvEqbeFgHaRp0w9Huorw8+98G7FqHzoiEi?=
 =?us-ascii?Q?7znobCXOUVYoDaZG06dGVlMA7wn4sjLs+pwojrd/VQvgEGcXZGBoDXKdFKer?=
 =?us-ascii?Q?LikUrGqjFdECkRk0aQbeFCUVZ6oWfar3vjheme2tFJX1a6ZZm3emyb0mscEo?=
 =?us-ascii?Q?jV4D3hTTNShBvjU+Kaa3sNCEcTYvII55hCY057pRwsFJUbFjjZqnSTLHQj9b?=
 =?us-ascii?Q?+kDKZbu7qJkv5r25awqXN2Pqiq8KDArFSES5u7hNiioyPG/kj5s7NwxqwLha?=
 =?us-ascii?Q?+lZpBa3JErYnpb+HBOzk6Ai39hobK1umOl44KRtBkvv36zrq+0kbRRLddPSg?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb4c823-ab37-49f2-0f44-08dd34b6dccc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 16:16:55.3055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vv5cu44ZzohOkysC8bjjRW6OxGepl1b4KWLS4XF6f40EyFqlkBR3dK9WTiBwIVIcl4+GhyBm4QobnYjkwNWbeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7209
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

On Tue, Jan 07, 2025 at 12:06:39PM +0200, Dmitry Baryshkov wrote:
> Fix c&p error and change linuxdoc comment for the hdmi_audio_prepare()
> callback from drm_bridge_funcs to mention the callback name instead of
> the original prepare() callback.
> 
> Fixes: 0beba3f9d366 ("drm/bridge: connector: add support for HDMI codec framework")

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20250106174645.463927e0@canb.auug.org.au/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  include/drm/drm_bridge.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 4b84faf14e368310dd20aa964e8178ec80aa6fa7..496dbbd2ad7edff7f091adfbe62de1e33ef0cf07 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -691,7 +691,7 @@ struct drm_bridge_funcs {
>  				  struct drm_bridge *bridge);
>  
>  	/**
> -	 * @prepare:
> +	 * @hdmi_audio_prepare:
>  	 * Configures HDMI-encoder for audio stream. Can be called multiple
>  	 * times for each setup. Mandatory if HDMI audio is enabled in the
>  	 * bridge's configuration.
> 
> ---
> base-commit: 938fbb16aba8f7b88e0fdcf56f315a5bbad41aad
> change-id: 20250107-drm-bridge-fix-docs-f9931636e335
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
