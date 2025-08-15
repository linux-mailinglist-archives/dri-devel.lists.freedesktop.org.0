Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477B2B28800
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 23:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BFD10E8F4;
	Fri, 15 Aug 2025 21:52:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LK6LPueJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A14710E0A1;
 Fri, 15 Aug 2025 21:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755294740; x=1786830740;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=E1+tNDicRhE3cjvqw3s3FAjMl4EgpqQIHHOeadsTm5Q=;
 b=LK6LPueJDec4VMr3ljRUCCya6hCfkk3TbH+1/GQISwI0yb/H0BUdi8lh
 jUyFkKmiTYZ4eILSGoderk4un1mfunHQomF75W3j4ts1uCNXzcKcNdB82
 26a1w09AAcJztnxBuE87Gi96J9q17my89LtIcBLUJwnbovWXieRLJ8ktR
 wFWnbvMp2m1M1bs5OdtL6TnenH4FEnbQz8xwebOKlGw3v+yfWX8hEhO+V
 Syua7f2sZ38jaKVB2Qc+Vc+1imnHGxaiSe87xgjRSo+3+GRlPcLR93xJx
 D47+Y9U5AEXteXfGy76IiZULU3M3oSIDn17gWTQuAIlHhPgx+qaOb5Ulv w==;
X-CSE-ConnectionGUID: V6Xp3iuQQvOZFCMY6LJXqQ==
X-CSE-MsgGUID: qoVnAHBCQQGYUw5hzxFYyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57479826"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57479826"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:52:19 -0700
X-CSE-ConnectionGUID: rf4LintWQ5CCu0wvuoHV5g==
X-CSE-MsgGUID: qjxRLQfnRiWirtxL6q4K8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="172316217"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:52:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:52:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 14:52:17 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.72) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:52:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuC/UbJH+GXNJstBo0fkdMAsGnkfcx8rCZd1nFF4TlWcJCnYEH6xhGZGCbZ/AlvBvBUKDEoqSf40+BGgkXAzTD5CbjraSEi5gyTEmFFHe4rikcIKR/72Y8alcbB2yMdcpq0oRgQJIFTwbvROMl4a5ftwjzpF6UXjnmOdWYgQaXlyAg+ifTG4ZULnNq09f+bZ0Pa/mtxJAT+85HQqxaBSdERwpObSaIqHHkOLQrVLgcyB+KImPpzC8Wy3kJwvU6aRu8a8nMisyzFWmeAOHZvtYEvGVV0v9qCcBXrshYSOCeSKgFEhDPYlClCerHPLZjRN487PewxVGga4yt7rYqCUEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czsEGhwGZ0uWn4Pw61MY9q89CrYHgkh+PH+qyo9MqKg=;
 b=sd/P42x6rvZbRuWc+BZRSogvFeTHMT7rWgNi4dT4mYiu8eiAb6fWWW+nn9heqe5iCUnwhc1cTv2RhfZG/dfvBDNUtjrb7V24f/zFKNoR2/IMuW3ESAgbtu0hodKJl7okKyIswcARfqSUtcG0UaOqJ47GKp+paqNB64UT4bQxAx6HBNylUPWISJukHYKMdAH4udiKExwkWPZLbAwnpOwUNop9DT5f/M/Fr91zgL6RwA93Gnrzczd86PEgBZV5QlfDov7kg3sVsb7kyk66f1+k679c5FWVKgMJ8rzjz7GumE604Uasx9603ECvSCv1XYigI/PXdCcoiKwZLW80VEjykg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8427.namprd11.prod.outlook.com (2603:10b6:806:373::19)
 by CH2PR11MB8777.namprd11.prod.outlook.com (2603:10b6:610:283::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 21:52:15 +0000
Received: from SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781]) by SA1PR11MB8427.namprd11.prod.outlook.com
 ([fe80::b156:b61b:d462:b781%6]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 21:52:15 +0000
Date: Fri, 15 Aug 2025 17:52:11 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Alex
 Deucher" <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, <Ruhl@freedesktop.org>, Michael J
 <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>, Anshuman
 Gupta <anshuman.gupta@intel.com>
Subject: Re: [RFC v5 2/5] drm/xe/RAS: Register netlink capability
Message-ID: <aJ-sC4CNk2Ztnyw7@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-3-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250730064956.1385855-3-aravind.iddamsetty@linux.intel.com>
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To SA1PR11MB8427.namprd11.prod.outlook.com
 (2603:10b6:806:373::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8427:EE_|CH2PR11MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1d143c-51fe-43c3-26fc-08dddc45ff9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?wvf7jfG8REKDOLrG4+IMvcOSqEUJaLZHZ/Pit/xDxBYdOpdy/0SuGSQ+fm?=
 =?iso-8859-1?Q?hgDhUW1T6uf1Wk8g7ae7VSo+abTux2wiDKEKfeTBVWGCAIapcw/VC6FGei?=
 =?iso-8859-1?Q?96G65ooEP+gaNKj2ea9INZO679uTIjaDKqdSm+XjP/o6vtjibWHjcLqjoK?=
 =?iso-8859-1?Q?ZJlpWhX6WqhIEtNOgrmLqKmFOst+ho+yKtFfxKrnYIxzMNXVu3UR0FZQxs?=
 =?iso-8859-1?Q?bO3xePZLJ1kk2t7SW41Pt02pMRzRPq7TVaTX6vxVrfld20wrsIHHesqclK?=
 =?iso-8859-1?Q?OkbhMj0qNdzsr6ZiFJmUhfyq1fx0rPSgGTmsx64jUWb51JQ4m/EN9HGZid?=
 =?iso-8859-1?Q?YJIG5dGI6BcU2P+/065/EhstpQSwiYfYGUh5YvyU+XJSVwHb6GC4pR/Rjw?=
 =?iso-8859-1?Q?/T0k9m9+4tMBTQ1bSH/D1G+1AzpHbFPqbMJao8lWi3wcuKkvcfjzXv/kqW?=
 =?iso-8859-1?Q?RMasS5QyLb2uw11kTXErsmewvWVzBSfa46JvyYrKM13fwswA74tJF3unAo?=
 =?iso-8859-1?Q?lhHhIWYPI1An4uvV5rF0coTfpZmdABh1pDQVl4nsaZ3WaLIMRqlGrHIlM2?=
 =?iso-8859-1?Q?PKlHSSmlvWpCtaq96ZK9PKb1GhTs+LK+cexjPeBz4F1WdwRGsKhoj48CK4?=
 =?iso-8859-1?Q?zTGo6h3fFEhQmZ/AW2J+0gqwdRh2YASlGG2AyZ+687lvoUhATUkr/vffGK?=
 =?iso-8859-1?Q?TKuZmlqrVwGjmgHDqhgDIHw6NJtIVzugyguZp+09Dyp2End+TtmQX/lGam?=
 =?iso-8859-1?Q?OrQoUYmQpciOy2tWLnM3+C7zB33QMtYtfO3hL6wudQwhF2x3dRTsff6wOU?=
 =?iso-8859-1?Q?RCG+6Lvo9+cSVMS4lnMQmG8Muk6PnnkGRGpAKNN86D39XZuBslH4Xz4bJL?=
 =?iso-8859-1?Q?w73VQ8zn+LOis7M+NcZ0FO6hxWEIUFGJeL+qKswYrFv+zo8CBrVckeiJra?=
 =?iso-8859-1?Q?DzdEMV1ohygfvLjvyHe7if0YJSUGC5tbDweTovvThGti8RzrFUzA6MSWO5?=
 =?iso-8859-1?Q?LeFzthGy0B0P+uahXmf+5uZIUVEjFbd5XEE0Noyhn/59JBjdeRkilE6w+U?=
 =?iso-8859-1?Q?Tc+DpxGex/UJTmIex+IxcEkLPA4sZvCi4MYC+pUAiHXQ51eHGChNj1rdrK?=
 =?iso-8859-1?Q?b84mt2T2V/f3kEoezWfv1LEVleqFdPT6ExojQaUb9d166licpaBg+/j8eq?=
 =?iso-8859-1?Q?FjUSr3fUpjfAknezAiERXBGXRUzVsRI+J3mQ2zRGqcxr3CqTC8FMdu0083?=
 =?iso-8859-1?Q?SYezSGclAicwTaNtqaARtIKr0hcKy524UwyKNc4xelL//7rJCJEaXkyar0?=
 =?iso-8859-1?Q?3QeKTGcBPWb3mAILZt0Mu+c6/aBdPY9lmzF3jhC8j3Oyc/17uF7c1/cbra?=
 =?iso-8859-1?Q?0Allrr6VL47prdB87fknbY7aIPJSvIBUjncNbqFE3tuUShCOkd5DKi/G4e?=
 =?iso-8859-1?Q?ak4EFeOkq9pXfV3MJGtyqQ9e5t3KCjMb3OADvFIU8LLND4xwSZhA7W+4ar?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0j+Y9zUf4ubkm7Zz9TJy8zOUhFhod55ThzBl5tfoL1rmGJEg6etxMoTa2z?=
 =?iso-8859-1?Q?67hmmTvqNE9neAdMnzHgzs5kYvZTpWNa60aU/+g+hkFFQzE3dnQ0xg5lHB?=
 =?iso-8859-1?Q?+T2ul7rrfxT3YUrEVFihMQ2uc+syr6/NfzopG3pxwZVnB0lgoa/EZpu4TW?=
 =?iso-8859-1?Q?zlML/lQU4Twzw9ZpPeg6GTWfRrpmrrR1Jt6x4QQ86LxyoZg/K7buqiN0yO?=
 =?iso-8859-1?Q?NnIxod2r8xDLgyTxVl8gC25aq9AjAmzZDPEkgeA2y+4KLHWSdQS20B8ypB?=
 =?iso-8859-1?Q?24mueuiE9FEkY8lPuGIUqqyvfmy6XA3EPARIMGJ6Rr2O7jVvNf6v93fItZ?=
 =?iso-8859-1?Q?yIF8LKHuEQg9Fi1D26u7nSGS9LlEN7o8SNbR4qzfT4cY5Dh1mz4yCQ9MAN?=
 =?iso-8859-1?Q?RqGAW8xgdfepxWKBJ2oqC/wyAPDe+ZsOZ/AOt5LxbyeMETjPc7SeG1HMeZ?=
 =?iso-8859-1?Q?W5SEqx/WGVhol7qMSXpsEeLjv6cHVaA30Tpyj+6ysxlwXvhxikIZEM9p35?=
 =?iso-8859-1?Q?P4+z5ap1P5ePXNvkk5Clf7grhSe2EdW6Yt18E6PLvZbM8A4DkzmPxcoAos?=
 =?iso-8859-1?Q?81DtH6YUPG5GOkNIqXYdfcR3Aft9sK9qjaTC3qdWK1HkjJWmki7KtMXYpv?=
 =?iso-8859-1?Q?mZZHbphe+oXinYqPjvEuvKTeULjfuYBubmA1BvFTzSRaA/6MSboatfgxry?=
 =?iso-8859-1?Q?Do2BFlb0a+/CqEpHLZlN9Dr0bb9WkfogghYEhqs53XizcMwJ140crT28gL?=
 =?iso-8859-1?Q?AV3bjEHISg+T5QCXqxOK9YpxqnElWStSHvPEzpzeYQ9+Anq4EbLrLuCi95?=
 =?iso-8859-1?Q?u5spaGbFPpes27M6QfU/3r1qCz/DooVe/yBuQbMxC6/Xdp1IVpG16KizlT?=
 =?iso-8859-1?Q?Rp2u4Ucd0icpg7XwQaoR4p9335eZOj1+ZcfxEsi2X2PjsDRFPQxz4MjObG?=
 =?iso-8859-1?Q?HJZBg65MbgR2LN3+0BXYBVtokrpLD/qe4AeXJUB5MrNIhQq/4kqFu+ktbW?=
 =?iso-8859-1?Q?Uni3FTkq668XkGpX2v4BUI28+grq2ZGqlAXOoIXU55ByAxGBYIgOvfddnP?=
 =?iso-8859-1?Q?C1EXN2jR/kNYBZhWvM1CHK45coIFkRm1E4tOkitAfRfduKWBTkf1qItGgX?=
 =?iso-8859-1?Q?1kZmFF/sP7b6H3Ao9mB+zgwWwWIbCMo7/DkORJw3Zli+eq6h+Rz99qRvTK?=
 =?iso-8859-1?Q?zFlNbG2XPiu2P5pOYM13iOoLlFwQbTrSm4VqougHBk/Z+VN0FUdzDhJ3Jj?=
 =?iso-8859-1?Q?4fj2RZA7AG8nQOgO41X5OsSroqmeXbRHuA1AVk+WXARmbLwrXuDMEY403P?=
 =?iso-8859-1?Q?3qBMsIy3XCszHEUtRUuRSq7LdjKnxN9LS7pWtVnN8npbs+4MCuU9ZTn5Xy?=
 =?iso-8859-1?Q?VL9zndM4l97HzEvnZ+NAdaNM1FYpE6tlrbiQull3WsVmey6euG/ZIZnn8x?=
 =?iso-8859-1?Q?+oGVod3LrIA4BZaGfwbYQ0Wc1SdO5dOuZvx4BpH+avnO8zqYYSY83k61SK?=
 =?iso-8859-1?Q?3BUgSzqSNpxOwwcNkg6neC+HbKawLnpnAt/XtSZkD3X3Yq7BXvFmAlQfuc?=
 =?iso-8859-1?Q?tkjH1Yi1MSaqZf98tA+qRAK/3o9q54ds3SlzQ0m1xDVjNj+UAy3cUOjr4v?=
 =?iso-8859-1?Q?q4MhPiEGqLdbDKCv5cV0afQz3e5MtSs96q7hD1ab7NbEglizRnkiU8LA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1d143c-51fe-43c3-26fc-08dddc45ff9b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:52:15.7926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWWPcQFrD+/zfCYhwyy4v/av5VQznxluvdh/Yjk0vZYHgP+GNBgt8e2fG9CJNhLjT+Tk2JfUZGZ0lXkbn8SrVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8777
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

On Wed, Jul 30, 2025 at 12:19:53PM +0530, Aravind Iddamsetty wrote:
> Register netlink capability with the DRM and register the driver
> callbacks to DRM RAS netlink commands.
> 
> v2:
> Move the netlink registration parts to DRM susbsytem (Tomer Tayar)
> 
> v3: compile only if CONFIG_NET is enabled
> 
> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com> #v2
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  2 ++
>  drivers/gpu/drm/xe/xe_device.c       |  6 ++++++
>  drivers/gpu/drm/xe/xe_device_types.h |  1 +
>  drivers/gpu/drm/xe/xe_netlink.c      | 26 ++++++++++++++++++++++++++
>  4 files changed, 35 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_netlink.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 80eecd35e807..e960c2dbe658 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -304,6 +304,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  	i915-display/skl_universal_plane.o \
>  	i915-display/skl_watermark.o
>  
> +xe-$(CONFIG_NET) += xe_netlink.o
> +
>  ifeq ($(CONFIG_ACPI),y)
>  	xe-$(CONFIG_DRM_XE_DISPLAY) += \
>  		i915-display/intel_acpi.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 806dbdf8118c..ca7a17c16aa5 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -363,6 +363,8 @@ static const struct file_operations xe_driver_fops = {
>  	.fop_flags = FOP_UNSIGNED_OFFSET,
>  };
>  
> +extern const struct driver_genl_ops xe_genl_ops[];
> +
>  static struct drm_driver driver = {
>  	/* Don't use MTRRs here; the Xserver or userspace app should
>  	 * deal with them for Intel hardware.
> @@ -381,6 +383,10 @@ static struct drm_driver driver = {
>  #ifdef CONFIG_PROC_FS
>  	.show_fdinfo = xe_drm_client_fdinfo,
>  #endif
> +#ifdef CONFIG_NET
> +	.genl_ops = xe_genl_ops,
> +#endif
> +

we should definitely have a drm function to register it instead of hard-coding
it here, regardless if we go with the group split or not.
It is not okay forcing this to every platform, even the ones without any RAS
available for instance.

>  	.ioctls = xe_ioctls,
>  	.num_ioctls = ARRAY_SIZE(xe_ioctls),
>  	.fops = &xe_driver_fops,
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 3a851c7a55dd..08d3e53e4b37 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -10,6 +10,7 @@
>  
>  #include <drm/drm_device.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_netlink.h>
>  #include <drm/ttm/ttm_device.h>
>  
>  #include "xe_devcoredump_types.h"
> diff --git a/drivers/gpu/drm/xe/xe_netlink.c b/drivers/gpu/drm/xe/xe_netlink.c
> new file mode 100644
> index 000000000000..9e588fb19631
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_netlink.c
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <net/genetlink.h>
> +#include <uapi/drm/drm_netlink.h>
> +
> +#include "xe_device.h"
> +
> +static int xe_genl_list_errors(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
> +{
> +	return 0;
> +}
> +
> +static int xe_genl_read_error(struct drm_device *drm, struct sk_buff *msg, struct genl_info *info)
> +{
> +	return 0;
> +}
> +
> +/* driver callbacks to DRM netlink commands*/
> +const struct driver_genl_ops xe_genl_ops[] = {
> +	[DRM_RAS_CMD_QUERY] =		{ .doit = xe_genl_list_errors },
> +	[DRM_RAS_CMD_READ_ONE] =	{ .doit = xe_genl_read_error },
> +	[DRM_RAS_CMD_READ_ALL] =	{ .doit = xe_genl_list_errors, },
> +};

this is another space that is strange. you declare it here and drm
magically uses it. Another reason for more explicity registration.
and with the struct drm_ras where these commands are part of that.
as well as the group name, etc.

> -- 
> 2.25.1
> 
