Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 483458B0AC7
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 15:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A01C113B4E;
	Wed, 24 Apr 2024 13:24:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMTRiPxm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB485113B4E;
 Wed, 24 Apr 2024 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713965041; x=1745501041;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/KJJt1YA1PdT4yPk1nkkNy/ClpJC1USVLCO5tNcbICM=;
 b=LMTRiPxmHRVx1AQpNglv4TTsIv5sjMOqxwx/R+BsOCY3Kj5If0sKL+O4
 ApN757z8/P3akHaujgQz9IVNQ3/AxkKjSYMstEyCaxwxBFu0LynRyHOx1
 lyx40bnLsmiNeKJQjl0x5h19Y5c+2+GoJ7S/zjYDT4H1twCpS/XNGIqle
 5PGYtfXNLYnsRlnCxidsR2PEHHBx74+ywpzDaIChhZsa/63+TM/OEgwxW
 FxKKMc4mXnaPCWAXC4hWhknU+zwKWeQUpNwW0CDhmYO0SUE3ySQdmoklT
 nkzlSvUrMehm52LG1h4gW2c7lu3vmbV/ra7mVK9V31ayRJARX4pws/6Nl g==;
X-CSE-ConnectionGUID: zQGaP+5/Qo2GO0RN9uhQSA==
X-CSE-MsgGUID: 4foSzlAmQ6qdgg6QBzAStA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9423977"
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; 
   d="scan'208";a="9423977"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 06:24:01 -0700
X-CSE-ConnectionGUID: ZMc+c0UVTkKN8Kr8q1XZig==
X-CSE-MsgGUID: 9/wJ09htRCm+oU8KpH2oJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,226,1708416000"; d="scan'208";a="24677890"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 06:24:02 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 06:24:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 06:24:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 06:24:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 06:24:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVZOjbGH6BlGgmaBIxw2+XLGGcBuoVX0vIXm9aq94vHoJ/tmr3N6COx5oiUTq1d5SQI/6Q6U4NiRLGptlZ3aakV4aTbxeeiFFmO+oXi8BMl3gmtJcZEdhfziBobEDBLPS521MTFliG0ZqAr1d9OTfC3Ov7P3s9WYjRs/jPGaaqNviueyZhT1usVT4yEt+ttxkIGcP8Fu30Uzd7ww8su79kc995/f1SP8DLuJ8jPbc9jnQ3ifsQL0vev6mGWM8LcilDCPI97F3vB9DDONJbyh080HtG1beGOWYg+XzzVOF9W99Zw0jTiznvNkJpzbDW7vWyMpf/tzH/vpu6sET/JivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vdOd+eJV9S5fw57yMtGEthMIib6BQdEo95f19DnzGQ=;
 b=mG5ImvoQWMRcmz5qk0nEF7LgpnPSw/qD9ohQZGfbIBesD7hdRKJnzYlJm9KIJnp91/M45YIPjNRVEc+XbWBmGkBahgf22Bu0N/ls+6bdV9TGuWnMO+UxIz/VtghBwMMpN7eLJJrQtseY1/ytx+/0C0vaihM+c1TD+9OgBETmXubpjrVfr5GZkuZsLAeyaXQdJKpz1o748Wc3sgJ9sxAH2+Hsjv8hvL6uBy6qdhcOmIM9/vwlIs88NfdkPcxNSdnHHhAV1IRR0bxmXA6ISsEZt1N0aDiu3+HvkONZRwujb8u4V8o3RUHhjQ0iMMEXEIqiIX14vTiaMMFfOhLbif6PwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB5161.namprd11.prod.outlook.com (2603:10b6:806:fa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Wed, 24 Apr
 2024 13:23:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 13:23:58 +0000
Date: Wed, 24 Apr 2024 08:23:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ryszard Knop <ryszard.knop@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] nightly.conf: Update drm-intel URLs, add missing bare
 ssh drm-xe URL
Message-ID: <dajmi6yhre7tdszzx3q5eirad2suahm6b5yawtelcpas4jgmj5@4v7kachrsrpo>
References: <20240424113218.37162-2-ryszard.knop@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240424113218.37162-2-ryszard.knop@intel.com>
X-ClientProxiedBy: BY5PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: 10373cbd-0c1d-4358-3ca1-08dc6461cc70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fK+FNjASYx/SYcYSfBEe0K+bBDh0PwrDdJSFKJqNsdpL6/cmkbKaXEMJfY3k?=
 =?us-ascii?Q?D/Bg0sMYtBAMFF2Wp7IqgIfqrfOLB8mwaBioUu59sj5EgRwvKn4eIH3pRr7l?=
 =?us-ascii?Q?4EYB76Rt97Iu5v+C4vyqvXr/qVPc6R1rrgV/yLY/dNgtoKIN1AQwkTdC1haa?=
 =?us-ascii?Q?4fFOGS2aWAjE7AKvnXO24/VqPXsj5Fg0SSGdmj4NO8TRjl+EkGJPcdwffALb?=
 =?us-ascii?Q?Ms4Q6LP02jX9iSiZesG/zyGnB8Juj/4zkHiRdmufl0jrbOQUtjspP/zevSgO?=
 =?us-ascii?Q?/BTPRcDFjbDWIyMuTGm9WdT5VBLzDy1YEDwCVNFfX+zZ0qJXw9toE/ejk2yp?=
 =?us-ascii?Q?He2DjNOEbLvpTFPMJYkSQYK2+TEJotaHxuEyHNRnDBn125CSVxsAYGg9vJLU?=
 =?us-ascii?Q?LDwhlSanbKXbL5D/4KI2G3PVFLD5wHJ60invf6IBODB806vJBI2f9j6q90Ag?=
 =?us-ascii?Q?7ArRKVnmYjjxFQykb4q2dGI/b3RORJeKtBISNTmAVbeDAQUcC2mqVwIrYxiX?=
 =?us-ascii?Q?Xbk+4ou8wjko5+wf1n6JDbnarhwDDMfTRWKZ3VidHyKlNgq178N41/urNm3h?=
 =?us-ascii?Q?zMewYaiSCCIdu8a6mKxF9rQgoCIlToumInE8O5GRjK8emr55vSC9MPfuPNRy?=
 =?us-ascii?Q?q25ZdlZ8A7jQF9lQUU0ywgBHf6DjLfyM02+rcYl2LbKUMkex1hnoDc7golfr?=
 =?us-ascii?Q?+54SNvo/0YJyJ5elNYuJVIgVBVt3vIeOYFcQ+oo9iYfclzLf8XmhiXqfMJLJ?=
 =?us-ascii?Q?Imxd1eQLK4G7uLtO8iaw0l2EEnyftHqqGjduz2kSus/BPhGdTyyIxdomnAjD?=
 =?us-ascii?Q?/rHxx6DpHj7GycnhfqyIlIQsy8rNILOwg4HFBvy6RiOqlhsRWcb+eWs6QLM0?=
 =?us-ascii?Q?BNlHD0tKux9lAtdXa7c805r+3q6a6zRgfwRI9MJ6knYaWsER5/e0qw/qRKJ0?=
 =?us-ascii?Q?kX+G2s2pTpY+bR4Y5shpK0zFj/cN/PLgnxbjK2ZYlm28K4fg4MOXoQhhEtp+?=
 =?us-ascii?Q?SRnATnVXEFSYOxJ0tLvQ7PRF2Sw+5dec2t+Oxi8KAnfrGzQ+o+8YOrvyqbm+?=
 =?us-ascii?Q?GKRfMjhCuwi666senEW/18BsbNHXfGeXOB/89rkUv2XQFi06ikQdPpQJ86Hj?=
 =?us-ascii?Q?WEBEKZWkGLgxo4X1cfoTvKjA6/ec1a6fcDfK9lSTfr1Cp9KzZSjWzVO28vEV?=
 =?us-ascii?Q?8AY+gr+LUaAosK7PQIFnfMd9VPBTVBPbJFHhj9xLtRiASmw6EpTTsV3TgpM?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vMXYNhGXKTjVvDxYIwtn3b7R/9j/9R60un6vAtDcKxZeoHY020GaPEsGs92w?=
 =?us-ascii?Q?YLRVJoMwkfwxTYGpsbWlg4zP5wW3abXyS7sSDFvVecRJyuW5YIaEPk3asouA?=
 =?us-ascii?Q?tRwOttFTI9NknbYmyXtCECzWgo79lCQMNHBlJH6B+b+inW668MoE168MneDZ?=
 =?us-ascii?Q?MjETy+4WMVe5uu/g2vni9NZoYl3qc0c68hRuhNwKLKneK0H3d+932rIbOr3g?=
 =?us-ascii?Q?RM5DfD9tbDXhjd5PNsb+qmNEpH5TMWDhjwjF/thgQS1hjdiGUlAFJWQ0i8qO?=
 =?us-ascii?Q?kTn6PjjVxR94CYpRuQESeA3pejKcmBxp+tpPGKAKQwyqHgxpQOfW8sDxgqLk?=
 =?us-ascii?Q?5ss9FjI5GpTdJ83CKXPE2Pc5YWFIggcEbUpi4+79nCMjNZcOql/NDx0rvxun?=
 =?us-ascii?Q?AXhWcYUVlwfZed075m8qes9spqLlK91x+mpmUuHvyVFRJ6MaGZSCQcMJKUZL?=
 =?us-ascii?Q?5RX43S7jkzv3+aTP5QxZHoxZpezRZD8ydf7BY0B9JwJw+NE1azmjl4ztgNuY?=
 =?us-ascii?Q?pUcGWQIHM6Ty7PIlmPn0LokK7hwJG2mEIXsss0QW27rUim3ODOXJ9RbxaRyo?=
 =?us-ascii?Q?3DbJzCSZm3jFjQpOFA05UaVos/eLj9nljRtQaRPrXKWxGk0ff6GarGYhDvFh?=
 =?us-ascii?Q?dy2jWf82kT5ZOuADd4r6GzFInrSH4jTPqxeGem+61G2zM0XCjXB/Obcu3e9J?=
 =?us-ascii?Q?cyoJyZ+4ZWfq8Ljf055M9Vm96kfjInaDySwMlbCaUW3UY/M2rcyNwm6KNVD5?=
 =?us-ascii?Q?WedJaOX7Li4T3ZAo/S6yyLY/3+zKO3tce62Sl5svT1j9yjwoiCtQhEICcw8z?=
 =?us-ascii?Q?VqLw8GrS4+AaADtHt0l6VlPq/sChBoWuCO3wSFPO6aNdJ093iffiwXwK7W86?=
 =?us-ascii?Q?HxebUqR8sEIGqIJC4evNH8A9qa/39I55OH7KbhWJUgsxKIn1IT3ZBLDXVRlc?=
 =?us-ascii?Q?1zcoluaSn7eScmDTB82vwnQ07UQm/8kVfbmmcxAyt+hiWLRk8MWQPakiCMAt?=
 =?us-ascii?Q?3Z6RE8jZ34BJMbp8PmtdeHW18iWt65PXZzgHP/u+uFqecfPSaWlYue0LV1sO?=
 =?us-ascii?Q?b04DSr8ju5PrrDEITxVDGNCJE+ljJeDluyk2RRC7PqsfurY127ByuVfaR4IY?=
 =?us-ascii?Q?ikBhD+813Mq0B10ctpe2E6FpZkGjXoj9mWN1YSgJGp2xaS48HxIVTrUJ+Naj?=
 =?us-ascii?Q?4FzAaznuxVcUZI54KLYTmmuhhZCUAioHqXRsK4mPiih9GyoAyQbRZnX6JvY9?=
 =?us-ascii?Q?8TnrFHOd30Y4VbnlKZquhpFUQDOFeLq86X9RA9a46cZ/1/AHsaCmU46Z255H?=
 =?us-ascii?Q?KdTFQsGHKomvk/HHDW6VqC8i+jkwLiq51iZttQdNitF5aag5W/aPSLUi8aFa?=
 =?us-ascii?Q?R5wTriRsk64+TiV6wxD1NMqX4WVAPE7kcSZ0HaTdYR8ZaefxoQ/JFMykwe1t?=
 =?us-ascii?Q?Yb54kjOzxK3UMaR8IzySTFzWx8pD46sjm4D7OmZ1pyAGvmuv6YftQ2Qw05VJ?=
 =?us-ascii?Q?66oIky1AD/DuSJLBosGAodhhc4lMnv32S/V2YLJdSnbzrbpTBnRcuOXEO8YV?=
 =?us-ascii?Q?IOzSlM8UJC7ceUlE3cqYaAepsMeta3eMlPm4e1O1q5k3YEOYm8hqcukM3ZpE?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10373cbd-0c1d-4358-3ca1-08dc6461cc70
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 13:23:58.6121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5r8gHYGPcW0+LO8I2AjbFQaDKTIbcSgqtHJAP85b7BsBCCYigsGTbp1lzUJ8nQqZ+iIm0ndX+Te5DsPdxl5JkBbiMEePkopwuiK9zKy9g8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5161
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

On Wed, Apr 24, 2024 at 01:32:19PM GMT, Ryszard Knop wrote:
>- Switch drm-intel URLs to the new GitLab location.
>- Add a short SSH link for drm-xe for completeness with other blocks.
>- Add a missing tab in drm_tip_config for column alignment.
>
>Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
>---
> nightly.conf | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>
>diff --git a/nightly.conf b/nightly.conf
>index 7ef4249f0c67..2971277b0e25 100644
>--- a/nightly.conf
>+++ b/nightly.conf
>@@ -30,10 +30,16 @@ https://anongit.freedesktop.org/git/drm/drm-tip
> https://anongit.freedesktop.org/git/drm/drm-tip.git
> "
> drm_tip_repos[drm-xe]="
>+git@gitlab.freedesktop.org:drm/xe/kernel.git
> https://gitlab.freedesktop.org/drm/xe/kernel.git
> ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
> "
> drm_tip_repos[drm-intel]="
>+git@gitlab.freedesktop.org:drm/i915/kernel.git

we probably need to update dim so pick_protocol_url knows this is an ssh
remote.  I think it's harmless right now as if there's no chosen
protocol, it will use the first (git@... in this case). If a protocol is
chosen, it will use one of the urls with protocol in it. We'd have a
problem if there was only this form for ssh remote.

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi


>+https://gitlab.freedesktop.org/drm/i915/kernel.git
>+ssh://git@gitlab.freedesktop.org/drm/i915/kernel.git
>+"
>+drm_old_urls[drm-intel]="
> ssh://git.freedesktop.org/git/drm/drm-intel
> ssh://git.freedesktop.org/git/drm-intel
> git://anongit.freedesktop.org/drm/drm-intel
>@@ -97,6 +103,6 @@ drm_tip_config=(
> 	"drm-xe			drm-xe-next"
>
> 	"drm-intel		topic/core-for-CI"
>-	"drm-xe		topic/xe-for-CI"
>+	"drm-xe			topic/xe-for-CI"
> 	"drm-intel		topic/thunderbolt-next"
> ) # DO NOT CHANGE THIS LINE
>-- 
>2.44.0
>
