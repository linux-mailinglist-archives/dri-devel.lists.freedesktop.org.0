Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4BE9BAC8F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 07:31:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22DA610E0A7;
	Mon,  4 Nov 2024 06:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHcpdwHQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E183E10E0A7
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 06:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730701873; x=1762237873;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZpQOPmLJHnnnyVGKmD+OF6sPVMCx3vj3hA/RCQOqrq4=;
 b=hHcpdwHQxchiT8E35vokDFnQC2b0ti/Z7bhwj3AkEwbRBpmfyDXfQ6c5
 pmh7bmtVxl3wXG6LJTyMtvYYO6YeEe80pdCqOFZbtTXELJlRII9CDU6vA
 lVMvc0UDULiOnk8xmu6UdaB2joswEn3RCkurny/EClgDh8BzsKx2DjKtH
 ePTNIzsoILOmDmvHVpzQOf3m7k43GHXH8l4r5wrhAURZ/CHcm94cghgIk
 dngyLeKebZ0T0gTMnbzEZTb/ERZDO4Y/RSV6ACQrmdCxTTNxpn7ZxpCKg
 MVXwGkUWTYZyGHnMDM8qdKo4dEBdo40YxMVZjPMdAGcTJ5FTfKNxOo0V4 A==;
X-CSE-ConnectionGUID: 61U+qRpTRjqjWBhxSkp7bA==
X-CSE-MsgGUID: ZQI3GUKlQ6S5YOzAa8wTDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="41756561"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="41756561"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2024 22:31:10 -0800
X-CSE-ConnectionGUID: koVKo6kIRlqO5CJGzsB9AA==
X-CSE-MsgGUID: 9rZXdURfS0Gt73jHgL4zMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="84368087"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Nov 2024 22:31:10 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Nov 2024 22:31:09 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 3 Nov 2024 22:31:09 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 3 Nov 2024 22:31:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bd9QxmegWd1GSiP6gD7cypmbGAZOqI3CScpFL4GWQL5LrPhHHAqMjZ3cm+6CSuldu7clBRCOgcCLCJq3GSQQ4ImjWAXniWp4tzpmqmuZ/tHfdGg+f8kRCXKogdZbXi5jlPRS2LEpPtofTokciISXSTRI6MCRZBqbUuiAKgwSkoUgHMETmhgDps9u/J38QnKdur6AT6nGVm5AMZsRA6gx38jxjPRQ20MgCrgA9t+d9wwUkiwjGC0uVWYP7gjbCcwTVowUfwfWIOKzuwOP4z19vbR/R964wfN3aoE3LJkfm2JqvgOZhJ0wxz6E99z/9o3LTteBisdGIl2Z52v/oXXZfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRefuvaYaQbiKskapTwjV5CUq84GIp4fd9gV6pzNrpk=;
 b=tKVcWJTtsbt2FNnjgkP/654I4cfC4SZm6ajJWEaARSCD5MEw9uNrJcq+UdKXPFgZLJC29ZUQNOnVyxXi3JfUDkzzThMHuCV2vE3zitC1FinsAm/LdOiVHW/EbA+LhkLNKHFy0pjJO9cq6GrwDunyR1+ESltjYuUTqV4mODJ4osJEjPbQc2wxE40EYjImkpgP4MVrECyGGJ8K2YCnsSSg8hX4OisIM8/ih4bcZAXPY9qwHwZHpAv4nG6o/g8UH1HJ1txs8QRiDfyEBVrcF2tvJ4H/hfOArEeWf4EQPahWAlGRl40HlkbLuhSxofOH9YKzT/U38F/zV4rc98rJce1OCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7878.namprd11.prod.outlook.com (2603:10b6:8:f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 06:31:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 06:31:05 +0000
Date: Sun, 3 Nov 2024 22:31:36 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
CC: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: Re: [PATCH V6 07/10] accel/amdxdna: Add command execution
Message-ID: <ZyhqSDch6JY48FUU@lstrano-desk.jf.intel.com>
References: <20241030155147.103908-1-lizhi.hou@amd.com>
 <20241030155147.103908-8-lizhi.hou@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241030155147.103908-8-lizhi.hou@amd.com>
X-ClientProxiedBy: MW3PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:303:2b::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7878:EE_
X-MS-Office365-Filtering-Correlation-Id: 6349c21e-f955-412a-3f52-08dcfc9a42b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Lzx24aV3z1xtQsPaYdDoGp4y6JwAPycK/+D1MeLzfnU00N0icBO6ENLtYRaR?=
 =?us-ascii?Q?luRSlvfd3X7+Hds8oVIeZ034phqKMq4KAsU5okObgrkfHcY6/6S969vExvMr?=
 =?us-ascii?Q?1yKg+UliCtuYU90h/uTCyJCSQ3bgDt1omwrjQT7Ksw1IPAUAHj2LPAYqRD0I?=
 =?us-ascii?Q?1iVp5kavazU7+KS2ewppcascf+1UNafkDW+PSBrTCJk77cd9oX7jb3YZZyxn?=
 =?us-ascii?Q?sjUjYQMnucj6JOUahR/dPX4jb350IhAUrQZP5/nauAAytcpSdZBbMq2L0/JL?=
 =?us-ascii?Q?t7W1U9256DYyF2axL/baT1sT3/qEFAiSzZwvp71t9EM8+lg0KookZhwPHgWc?=
 =?us-ascii?Q?aEfepD9BbGaE6v5AUy5qFS6sKcAoKz7TAuhJeYaVUe3L8f/M9BspYTpibuyt?=
 =?us-ascii?Q?69dBw2/fteFL2XPE9GehmVpnC7T3KDWKxsLAONR49ic2JFIifCvLkM2n3brK?=
 =?us-ascii?Q?ymIpHwrGzZdrfYrHeo6rW2g3pUmlo//cXfcGo30wJezt6UotWxC/wVnPjlvU?=
 =?us-ascii?Q?0zGeEmBS7f7qn/Qb+tsgVC1d09K/xgVoV1iaUhOn2L9bjhr2W9rxURcDIkCG?=
 =?us-ascii?Q?vIxaeKo2Mw0ZVh0n7b0huYDKv1DUxT5sHPtXq+wtwpO9U1yE+02dgQI8NEm5?=
 =?us-ascii?Q?evUnZuIsyjU2UUp8Zrli9TdupiCdT5OKjIv6LrAn6L3RxCYyXAfhmgFHPCJj?=
 =?us-ascii?Q?DPGn1EadPrE6uT4+B3i6oKG0aYSYqo6Gul5qSO2AzXS4QLma73MeCiR355IV?=
 =?us-ascii?Q?dxSfH9kvW7sMOsHiMLy56eKZpC3c+vby5djKuQ1e1n8ktGfXn3TYPLo8rP5Z?=
 =?us-ascii?Q?wBrow+vQtiiTGEGof7nOOmR5j0SIH9ejuouK6IeXyLn+dRVk5Gt8gGWB2NlP?=
 =?us-ascii?Q?zVALrsJKHGNJTJD3eCfTLYdfrOhItnWK2PTyp/FbX6MLMIuxbQrYAM2Up5ya?=
 =?us-ascii?Q?q/490R7kQ9c7d393yf8mQq05i7ZHv59mn73vEyUXf3Q7uYPY7BECv66Pqcgv?=
 =?us-ascii?Q?F5qKJ3Sk6a1EIvvMmmsSObFKc6XL6wf8UjkdXYhearN3JzVG+pZtFpe51BkT?=
 =?us-ascii?Q?yfYF7EzhunT8Abndenu29oZ33gwsMR7CCcgf8oLSWMCzuGn19UIJ+0CcHBC4?=
 =?us-ascii?Q?4sPDcZobvLikKh+vsfgkI7F70WAdAhN6ulH/LSzOro07H5DlrjbJJVefeSwf?=
 =?us-ascii?Q?DZSB8YDYM3giVxAtA/UKxRLwpO1K3EePEfDxC5hooDV9N6C51p52ZaA0FFDj?=
 =?us-ascii?Q?34I3saCUS66bTcd9KPXu7C/hGaxsgyUB9NlFC2aAq7Ft3jm4rvCEz1CK869J?=
 =?us-ascii?Q?tAH/ck3frv6dxOW79jwCmtjp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/U70mkiLaiTsJhwa62keT87IYtxg8mWmQrgK2RinCj4+dNLA/eHNBaeOShKZ?=
 =?us-ascii?Q?J7JPuZOo4d4soOTMuXFPtMluWiSi2VCu8STpMwbm/PAxm9oYH9cRLDhAXuGz?=
 =?us-ascii?Q?8GJlIC5NQUDgcE0gZsfKER7vsshbPeLx8NrEwKqZm5KN1OiiQ6uCuCro6bhG?=
 =?us-ascii?Q?ELCzz3Brd1FmJX0MeXJj+va1ELXiYTkkBqtAVXH3wSgG4XgL5/FU0f5PcrBu?=
 =?us-ascii?Q?+5WyqPE4GTBF115O09zPBIc00ZX8ADOhBpM20X5l/5KJp56lh8wUOwZgYjRG?=
 =?us-ascii?Q?ouFkcPzYrk4Fj4w0lU90C+k7y6qZr/X8r8P6BEykyJP+eHB0/Md+058wJsj+?=
 =?us-ascii?Q?UyQjNl9VVe6SZVMas1y6ngjR1vE0aRnGn25pa5EocUPo6lpmyXncHyMYfF+n?=
 =?us-ascii?Q?MGSB6RigRKprGn7wHFV4hSUKNNtO93PuLOiwyF0kAKJyeEHO4w5tc176XZ0S?=
 =?us-ascii?Q?bVCajIbk+Z2dhoUAUum53HGnicjurEMBnvxqpkHdOP83Z1P1HIOenX7XlIjh?=
 =?us-ascii?Q?5uqQCHtWcO3260rkkq3voQ7iAiwVyF3MXVAo53jStkSIFKihwJUdQA1NSiaF?=
 =?us-ascii?Q?AcAB/nAbU9lAahkk7kUTtlg8IvZW6ett6hYzpN6V3y0pF1RTQ8n/uySiNNv0?=
 =?us-ascii?Q?eaIWs2TpBzO3L7Adi5pE0IHh2Gbs5NDR5cPR6pKo91VDgZlCRk9iub0QUbwT?=
 =?us-ascii?Q?+C0CW8k/qZ51JcGeqVtZ+xb6ASPSyjMvJN9QeQo7RQKqVJdw3AV6eSEO5zqU?=
 =?us-ascii?Q?R9adX2Rz+glZGBVvoeQL6/RL8hoXBBI35JJeY4nA7jYTO1Xahc01IXU9PYtI?=
 =?us-ascii?Q?C+wP47g5pssT16yzTNO8zGcahgzQFHCZDnxhFLdr/hxIdaDL+tEZpvPjIl37?=
 =?us-ascii?Q?luBihc/vXnZwh5NATEirbJN0wy1Gg71VBO4x7XgN6LudSuZp+gojm//VU2Ot?=
 =?us-ascii?Q?o3kfctupRC47XTLhzeUX7I52RKSj7HchAy3x0QekGq0ZyE39+vN9YMX2DI9z?=
 =?us-ascii?Q?HSmyWFPssKeUf2QKObETrqevWetolAnBmwTNX+YMUXzGPf0jq/aO8M9qA6Pw?=
 =?us-ascii?Q?lAO7fkwcYMHpIQk5Nzgb26pxl+BSkNJ0nK/2GEBoSxLzjuUWBWL0KJ07typF?=
 =?us-ascii?Q?GOjjhxbH0q5+xFQmQ2iLVhKUBU7znJMOAb4m4G6KusQzg2c36EQdi3q5ye0q?=
 =?us-ascii?Q?e/KM5StSwHlScV/QY+tL8ENWIu5Ty5b7/Py0koMYac+YcZtV5E+kIx79LLmL?=
 =?us-ascii?Q?brkH9xFBznxc1GFstP7LcXfDmnyfVlbnCu+n66+XrAdom54sPmOthxMRovgc?=
 =?us-ascii?Q?JwZghu1f8G7zguEN9MtpSjXSd9ykhUpBWLSaedQh86W7yqHF6lY24gkbelwM?=
 =?us-ascii?Q?e0sBor1jkiYEDk4AWrSjyldsuD+OSuQmn8hwe7+6GQUQjt6oAfKafQA5OeT2?=
 =?us-ascii?Q?+NqCyzY3/GBl4l7w9rMAYnkcGMfse6FuuYKOfrrs5MW+9IFCEFt4lZValQlf?=
 =?us-ascii?Q?Z1g+ShjdSTZUpTwzWfsbjEz1NBv6vcshxMhAw/XU1THlU36OTknfQUoH2rah?=
 =?us-ascii?Q?YjX+r6BVvLA1vXN+9licAHDs7x8jlb+x/Ku4ZmNlhIOx4JX1gpBsRdLRb64f?=
 =?us-ascii?Q?6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6349c21e-f955-412a-3f52-08dcfc9a42b0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 06:31:05.5849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ekg0PDUdIbKgQjGqQQdn0SOu6dfc8DCeGYM3s2xmmQib3VLFE+LkUkL5QYleSD11fmK2JRy5lkfjf/M0jZ5u7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7878
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

On Wed, Oct 30, 2024 at 08:51:44AM -0700, Lizhi Hou wrote:
> Add interfaces for user application to submit command and wait for its
> completion.
> 
> Co-developed-by: Min Ma <min.ma@amd.com>
> Signed-off-by: Min Ma <min.ma@amd.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/accel/amdxdna/aie2_ctx.c              | 664 +++++++++++++++++-
>  drivers/accel/amdxdna/aie2_message.c          | 343 +++++++++
>  drivers/accel/amdxdna/aie2_pci.c              |   5 +
>  drivers/accel/amdxdna/aie2_pci.h              |  35 +
>  drivers/accel/amdxdna/aie2_psp.c              |   2 +
>  drivers/accel/amdxdna/aie2_smu.c              |   2 +
>  drivers/accel/amdxdna/amdxdna_ctx.c           | 330 ++++++++-
>  drivers/accel/amdxdna/amdxdna_ctx.h           | 111 +++
>  drivers/accel/amdxdna/amdxdna_gem.c           |  10 +
>  drivers/accel/amdxdna/amdxdna_gem.h           |   1 +
>  .../accel/amdxdna/amdxdna_mailbox_helper.c    |   5 +
>  drivers/accel/amdxdna/amdxdna_pci_drv.c       |   5 +
>  drivers/accel/amdxdna/amdxdna_pci_drv.h       |   4 +
>  drivers/accel/amdxdna/amdxdna_sysfs.c         |   5 +
>  drivers/accel/amdxdna/npu1_regs.c             |   1 +
>  drivers/accel/amdxdna/npu2_regs.c             |   1 +
>  drivers/accel/amdxdna/npu4_regs.c             |   1 +
>  drivers/accel/amdxdna/npu5_regs.c             |   1 +
>  include/trace/events/amdxdna.h                |  41 ++
>  include/uapi/drm/amdxdna_accel.h              |  38 +
>  20 files changed, 1596 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index 617fc05077d9..c3ac668e16ab 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -8,8 +8,12 @@
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_print.h>
> +#include <drm/drm_syncobj.h>
> +#include <linux/hmm.h>
>  #include <linux/types.h>
> +#include <trace/events/amdxdna.h>
>  
> +#include "aie2_msg_priv.h"
>  #include "aie2_pci.h"
>  #include "aie2_solver.h"
>  #include "amdxdna_ctx.h"
> @@ -17,6 +21,337 @@
>  #include "amdxdna_mailbox.h"
>  #include "amdxdna_pci_drv.h"
>  
> +bool force_cmdlist;
> +module_param(force_cmdlist, bool, 0600);
> +MODULE_PARM_DESC(force_cmdlist, "Force use command list (Default false)");
> +
> +#define HWCTX_MAX_TIMEOUT	60000 /* milliseconds */
> +
> +static struct amdxdna_sched_job *
> +aie2_hwctx_get_job(struct amdxdna_hwctx *hwctx, u64 seq)
> +{
> +	int idx;
> +
> +	/* Special sequence number for oldest fence if exist */
> +	if (seq == AMDXDNA_INVALID_CMD_HANDLE) {
> +		idx = get_job_idx(hwctx->priv->seq);
> +		goto out;
> +	}
> +
> +	if (seq >= hwctx->priv->seq)
> +		return ERR_PTR(-EINVAL);
> +
> +	if (seq + HWCTX_MAX_CMDS < hwctx->priv->seq)
> +		return NULL;
> +
> +	idx = get_job_idx(seq);
> +
> +out:
> +	return hwctx->priv->pending[idx];
> +}
> +
> +/* The bad_job is used in aie2_sched_job_timedout, otherwise, set it to NULL */
> +static void aie2_hwctx_stop(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx,
> +			    struct drm_sched_job *bad_job)
> +{
> +	drm_sched_stop(&hwctx->priv->sched, bad_job);
> +	aie2_destroy_context(xdna->dev_handle, hwctx);
> +}
> +
> +static int aie2_hwctx_restart(struct amdxdna_dev *xdna, struct amdxdna_hwctx *hwctx)
> +{
> +	struct amdxdna_gem_obj *heap = hwctx->priv->heap;
> +	int ret;
> +
> +	ret = aie2_create_context(xdna->dev_handle, hwctx);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Create hwctx failed, ret %d", ret);
> +		goto out;
> +	}
> +
> +	ret = aie2_map_host_buf(xdna->dev_handle, hwctx->fw_ctx_id,
> +				heap->mem.userptr, heap->mem.size);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Map host buf failed, ret %d", ret);
> +		goto out;
> +	}
> +
> +	if (hwctx->status != HWCTX_STAT_READY) {
> +		XDNA_DBG(xdna, "hwctx is not ready, status %d", hwctx->status);
> +		goto out;
> +	}
> +
> +	ret = aie2_config_cu(hwctx);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Config cu failed, ret %d", ret);
> +		goto out;
> +	}
> +
> +out:
> +	drm_sched_start(&hwctx->priv->sched);
> +	XDNA_DBG(xdna, "%s restarted, ret %d", hwctx->name, ret);
> +	return ret;
> +}
> +
> +void aie2_stop_ctx_by_col_map(struct amdxdna_client *client, u32 col_map)
> +{
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_hwctx *hwctx;
> +	int next = 0;
> +
> +	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> +	mutex_lock(&client->hwctx_lock);
> +	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
> +		/* check if the HW context uses the error column */
> +		if (!(col_map & amdxdna_hwctx_col_map(hwctx)))
> +			continue;
> +
> +		aie2_hwctx_stop(xdna, hwctx, NULL);
> +		hwctx->old_status = hwctx->status;
> +		hwctx->status = HWCTX_STAT_STOP;
> +		XDNA_DBG(xdna, "Stop %s", hwctx->name);
> +	}
> +	mutex_unlock(&client->hwctx_lock);
> +}
> +
> +void aie2_restart_ctx(struct amdxdna_client *client)
> +{
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_hwctx *hwctx;
> +	int next = 0;
> +
> +	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
> +	mutex_lock(&client->hwctx_lock);
> +	idr_for_each_entry_continue(&client->hwctx_idr, hwctx, next) {
> +		if (hwctx->status != HWCTX_STAT_STOP)
> +			continue;
> +
> +		hwctx->status = hwctx->old_status;
> +		XDNA_DBG(xdna, "Resetting %s", hwctx->name);
> +		aie2_hwctx_restart(xdna, hwctx);
> +	}
> +	mutex_unlock(&client->hwctx_lock);
> +}
> +
> +static int aie2_hwctx_wait_for_idle(struct amdxdna_hwctx *hwctx)
> +{
> +	struct amdxdna_sched_job *job;
> +
> +	mutex_lock(&hwctx->priv->io_lock);
> +	if (!hwctx->priv->seq) {
> +		mutex_unlock(&hwctx->priv->io_lock);
> +		return 0;
> +	}
> +
> +	job = aie2_hwctx_get_job(hwctx, hwctx->priv->seq - 1);
> +	if (IS_ERR_OR_NULL(job)) {
> +		mutex_unlock(&hwctx->priv->io_lock);
> +		XDNA_WARN(hwctx->client->xdna, "Corrupted pending list");
> +		return 0;
> +	}
> +	mutex_unlock(&hwctx->priv->io_lock);
> +
> +	wait_event(hwctx->priv->job_free_wq, !job->fence);
> +
> +	return 0;
> +}
> +
> +static void
> +aie2_sched_notify(struct amdxdna_sched_job *job)
> +{
> +	struct dma_fence *fence = job->fence;
> +
> +	job->hwctx->priv->completed++;
> +	dma_fence_signal(fence);
> +	trace_xdna_job(&job->base, job->hwctx->name, "signaled fence", job->seq);
> +	dma_fence_put(fence);
> +	mmput(job->mm);
> +	amdxdna_job_put(job);
> +}
> +
> +static int
> +aie2_sched_resp_handler(void *handle, const u32 *data, size_t size)
> +{
> +	struct amdxdna_sched_job *job = handle;
> +	struct amdxdna_gem_obj *cmd_abo;
> +	u32 ret = 0;
> +	u32 status;
> +
> +	cmd_abo = job->cmd_bo;
> +
> +	if (unlikely(!data))
> +		goto out;
> +
> +	if (unlikely(size != sizeof(u32))) {
> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	status = *data;
> +	XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
> +	if (status == AIE2_STATUS_SUCCESS)
> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
> +	else
> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ERROR);
> +
> +out:
> +	aie2_sched_notify(job);
> +	return ret;
> +}
> +
> +static int
> +aie2_sched_nocmd_resp_handler(void *handle, const u32 *data, size_t size)
> +{
> +	struct amdxdna_sched_job *job = handle;
> +	u32 ret = 0;
> +	u32 status;
> +
> +	if (unlikely(!data))
> +		goto out;
> +
> +	if (unlikely(size != sizeof(u32))) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	status = *data;
> +	XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
> +
> +out:
> +	aie2_sched_notify(job);
> +	return ret;
> +}
> +
> +static int
> +aie2_sched_cmdlist_resp_handler(void *handle, const u32 *data, size_t size)
> +{
> +	struct amdxdna_sched_job *job = handle;
> +	struct amdxdna_gem_obj *cmd_abo;
> +	struct cmd_chain_resp *resp;
> +	struct amdxdna_dev *xdna;
> +	u32 fail_cmd_status;
> +	u32 fail_cmd_idx;
> +	u32 ret = 0;
> +
> +	cmd_abo = job->cmd_bo;
> +	if (unlikely(!data) || unlikely(size != sizeof(u32) * 3)) {
> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	resp = (struct cmd_chain_resp *)data;
> +	xdna = job->hwctx->client->xdna;
> +	XDNA_DBG(xdna, "Status 0x%x", resp->status);
> +	if (resp->status == AIE2_STATUS_SUCCESS) {
> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_COMPLETED);
> +		goto out;
> +	}
> +
> +	/* Slow path to handle error, read from ringbuf on BAR */
> +	fail_cmd_idx = resp->fail_cmd_idx;
> +	fail_cmd_status = resp->fail_cmd_status;
> +	XDNA_DBG(xdna, "Failed cmd idx %d, status 0x%x",
> +		 fail_cmd_idx, fail_cmd_status);
> +
> +	if (fail_cmd_status == AIE2_STATUS_SUCCESS) {
> +		amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_ABORT);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +	amdxdna_cmd_set_state(cmd_abo, fail_cmd_status);
> +
> +	if (amdxdna_cmd_get_op(cmd_abo) == ERT_CMD_CHAIN) {
> +		struct amdxdna_cmd_chain *cc = amdxdna_cmd_get_payload(cmd_abo, NULL);
> +
> +		cc->error_index = fail_cmd_idx;
> +		if (cc->error_index >= cc->command_count)
> +			cc->error_index = 0;
> +	}
> +out:
> +	aie2_sched_notify(job);
> +	return ret;
> +}
> +
> +static struct dma_fence *
> +aie2_sched_job_run(struct drm_sched_job *sched_job)
> +{
> +	struct amdxdna_sched_job *job = drm_job_to_xdna_job(sched_job);
> +	struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
> +	struct amdxdna_hwctx *hwctx = job->hwctx;
> +	struct dma_fence *fence;
> +	int ret;
> +
> +	if (!mmget_not_zero(job->mm))
> +		return ERR_PTR(-ESRCH);
> +
> +	kref_get(&job->refcnt);
> +	fence = dma_fence_get(job->fence);
> +
> +	if (unlikely(!cmd_abo)) {
> +		ret = aie2_sync_bo(hwctx, job, aie2_sched_nocmd_resp_handler);
> +		goto out;
> +	}
> +
> +	amdxdna_cmd_set_state(cmd_abo, ERT_CMD_STATE_NEW);
> +
> +	if (amdxdna_cmd_get_op(cmd_abo) == ERT_CMD_CHAIN)
> +		ret = aie2_cmdlist_multi_execbuf(hwctx, job, aie2_sched_cmdlist_resp_handler);
> +	else if (force_cmdlist)
> +		ret = aie2_cmdlist_single_execbuf(hwctx, job, aie2_sched_cmdlist_resp_handler);
> +	else
> +		ret = aie2_execbuf(hwctx, job, aie2_sched_resp_handler);
> +
> +out:
> +	if (ret) {
> +		dma_fence_put(job->fence);
> +		amdxdna_job_put(job);
> +		mmput(job->mm);
> +		fence = ERR_PTR(ret);
> +	}
> +	trace_xdna_job(sched_job, hwctx->name, "sent to device", job->seq);
> +
> +	return fence;
> +}
> +
> +static void aie2_sched_job_free(struct drm_sched_job *sched_job)
> +{
> +	struct amdxdna_sched_job *job = drm_job_to_xdna_job(sched_job);
> +	struct amdxdna_hwctx *hwctx = job->hwctx;
> +
> +	trace_xdna_job(sched_job, hwctx->name, "job free", job->seq);
> +	drm_sched_job_cleanup(sched_job);
> +	job->fence = NULL;
> +	amdxdna_job_put(job);
> +
> +	wake_up(&hwctx->priv->job_free_wq);
> +}
> +
> +static enum drm_gpu_sched_stat
> +aie2_sched_job_timedout(struct drm_sched_job *sched_job)
> +{
> +	struct amdxdna_sched_job *job = drm_job_to_xdna_job(sched_job);
> +	struct amdxdna_hwctx *hwctx = job->hwctx;
> +	struct amdxdna_dev *xdna;
> +
> +	xdna = hwctx->client->xdna;
> +	trace_xdna_job(sched_job, hwctx->name, "job timedout", job->seq);
> +	mutex_lock(&xdna->dev_lock);
> +	aie2_hwctx_stop(xdna, hwctx, sched_job);
> +
> +	aie2_hwctx_restart(xdna, hwctx);
> +	mutex_unlock(&xdna->dev_lock);
> +
> +	return DRM_GPU_SCHED_STAT_NOMINAL;
> +}
> +
> +const struct drm_sched_backend_ops sched_ops = {
> +	.run_job = aie2_sched_job_run,
> +	.free_job = aie2_sched_job_free,
> +	.timedout_job = aie2_sched_job_timedout,
> +};
> +
>  static int aie2_hwctx_col_list(struct amdxdna_hwctx *hwctx)
>  {
>  	struct amdxdna_dev *xdna = hwctx->client->xdna;
> @@ -126,13 +461,66 @@ static void aie2_release_resource(struct amdxdna_hwctx *hwctx)
>  		XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret);
>  }
>  
> +static int aie2_ctx_syncobj_create(struct amdxdna_hwctx *hwctx)
> +{
> +	struct amdxdna_dev *xdna = hwctx->client->xdna;
> +	struct drm_file *filp = hwctx->client->filp;
> +	struct drm_syncobj *syncobj;
> +	u32 hdl;
> +	int ret;
> +
> +	hwctx->syncobj_hdl = AMDXDNA_INVALID_FENCE_HANDLE;
> +
> +	ret = drm_syncobj_create(&syncobj, DRM_SYNCOBJ_CREATE_SIGNALED, NULL);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Create ctx syncobj failed, ret %d", ret);
> +		return ret;
> +	}
> +	ret = drm_syncobj_get_handle(filp, syncobj, &hdl);
> +	if (ret) {
> +		drm_syncobj_put(syncobj);
> +		XDNA_ERR(xdna, "Create ctx syncobj handle failed, ret %d", ret);
> +		return ret;
> +	}
> +	hwctx->priv->syncobj = syncobj;
> +	hwctx->syncobj_hdl = hdl;
> +
> +	return 0;
> +}
> +
> +static void aie2_ctx_syncobj_destroy(struct amdxdna_hwctx *hwctx)
> +{
> +	/*
> +	 * The syncobj_hdl is owned by user space and will be cleaned up
> +	 * separately.
> +	 */
> +	drm_syncobj_put(hwctx->priv->syncobj);
> +}
> +
> +static void aie2_ctx_syncobj_add_fence(struct amdxdna_hwctx *hwctx,
> +				       struct dma_fence *ofence, u64 seq)
> +{
> +	struct drm_syncobj *syncobj = hwctx->priv->syncobj;
> +	struct dma_fence_chain *chain;
> +
> +	if (!syncobj)
> +		return;
> +
> +	chain = dma_fence_chain_alloc();
> +	if (!chain)
> +		return;
> +
> +	drm_syncobj_add_point(syncobj, chain, ofence, seq);
> +}
> +
>  int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>  {
>  	struct amdxdna_client *client = hwctx->client;
>  	struct amdxdna_dev *xdna = client->xdna;
> +	struct drm_gpu_scheduler *sched;
>  	struct amdxdna_hwctx_priv *priv;
>  	struct amdxdna_gem_obj *heap;
> -	int ret;
> +	int i, ret;
>  
>  	priv = kzalloc(sizeof(*hwctx->priv), GFP_KERNEL);
>  	if (!priv)
> @@ -157,10 +545,48 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>  		goto put_heap;
>  	}
>  
> +	for (i = 0; i < ARRAY_SIZE(priv->cmd_buf); i++) {
> +		struct amdxdna_gem_obj *abo;
> +		struct amdxdna_drm_create_bo args = {
> +			.flags = 0,
> +			.type = AMDXDNA_BO_DEV,
> +			.vaddr = 0,
> +			.size = MAX_CHAIN_CMDBUF_SIZE,
> +		};
> +
> +		abo = amdxdna_drm_alloc_dev_bo(&xdna->ddev, &args, client->filp, true);
> +		if (IS_ERR(abo)) {
> +			ret = PTR_ERR(abo);
> +			goto free_cmd_bufs;
> +		}
> +
> +		XDNA_DBG(xdna, "Command buf %d addr 0x%llx size 0x%lx",
> +			 i, abo->mem.dev_addr, abo->mem.size);
> +		priv->cmd_buf[i] = abo;
> +	}
> +
> +	sched = &priv->sched;
> +	mutex_init(&priv->io_lock);
> +	ret = drm_sched_init(sched, &sched_ops, NULL, DRM_SCHED_PRIORITY_COUNT,
> +			     HWCTX_MAX_CMDS, 0, msecs_to_jiffies(HWCTX_MAX_TIMEOUT),
> +			     NULL, NULL, hwctx->name, xdna->ddev.dev);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Failed to init DRM scheduler. ret %d", ret);
> +		goto free_cmd_bufs;
> +	}
> +
> +	ret = drm_sched_entity_init(&priv->entity, DRM_SCHED_PRIORITY_NORMAL,
> +				    &sched, 1, NULL);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Failed to initial sched entiry. ret %d", ret);
> +		goto free_sched;
> +	}
> +	init_waitqueue_head(&priv->job_free_wq);
> +
>  	ret = aie2_hwctx_col_list(hwctx);
>  	if (ret) {
>  		XDNA_ERR(xdna, "Create col list failed, ret %d", ret);
> -		goto unpin;
> +		goto free_entity;
>  	}
>  
>  	ret = aie2_alloc_resource(hwctx);
> @@ -175,6 +601,13 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>  		XDNA_ERR(xdna, "Map host buffer failed, ret %d", ret);
>  		goto release_resource;
>  	}
> +
> +	ret = aie2_ctx_syncobj_create(hwctx);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Create syncobj failed, ret %d", ret);
> +		goto release_resource;
> +	}
> +
>  	hwctx->status = HWCTX_STAT_INIT;
>  
>  	XDNA_DBG(xdna, "hwctx %s init completed", hwctx->name);
> @@ -185,7 +618,16 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>  	aie2_release_resource(hwctx);
>  free_col_list:
>  	kfree(hwctx->col_list);
> -unpin:
> +free_entity:
> +	drm_sched_entity_destroy(&priv->entity);
> +free_sched:
> +	drm_sched_fini(&priv->sched);
> +free_cmd_bufs:
> +	for (i = 0; i < ARRAY_SIZE(priv->cmd_buf); i++) {
> +		if (!priv->cmd_buf[i])
> +			continue;
> +		drm_gem_object_put(to_gobj(priv->cmd_buf[i]));
> +	}
>  	amdxdna_gem_unpin(heap);
>  put_heap:
>  	drm_gem_object_put(to_gobj(heap));
> @@ -196,11 +638,44 @@ int aie2_hwctx_init(struct amdxdna_hwctx *hwctx)
>  
>  void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx)
>  {
> +	struct amdxdna_sched_job *job;
> +	struct amdxdna_dev *xdna;
> +	int idx;
> +
> +	xdna = hwctx->client->xdna;
> +	aie2_ctx_syncobj_destroy(hwctx);
> +	drm_sched_wqueue_stop(&hwctx->priv->sched);
> +
> +	/* Now, scheduler will not send command to device. */
>  	aie2_release_resource(hwctx);
>  
> +	/*
> +	 * All submitted commands are aborted.
> +	 * Restart scheduler queues to cleanup jobs. The amdxdna_sched_job_run()
> +	 * will return NODEV if it is called.
> +	 */
> +	drm_sched_wqueue_start(&hwctx->priv->sched);
> +
> +	aie2_hwctx_wait_for_idle(hwctx);
> +	drm_sched_entity_destroy(&hwctx->priv->entity);
> +	drm_sched_fini(&hwctx->priv->sched);
> +
> +	for (idx = 0; idx < HWCTX_MAX_CMDS; idx++) {
> +		job = hwctx->priv->pending[idx];
> +		if (!job)
> +			continue;
> +
> +		dma_fence_put(job->out_fence);
> +		amdxdna_job_put(job);
> +	}
> +	XDNA_DBG(xdna, "%s sequence number %lld", hwctx->name, hwctx->priv->seq);
> +
> +	for (idx = 0; idx < ARRAY_SIZE(hwctx->priv->cmd_buf); idx++)
> +		drm_gem_object_put(to_gobj(hwctx->priv->cmd_buf[idx]));
>  	amdxdna_gem_unpin(hwctx->priv->heap);
>  	drm_gem_object_put(to_gobj(hwctx->priv->heap));
>  
> +	mutex_destroy(&hwctx->priv->io_lock);
>  	kfree(hwctx->col_list);
>  	kfree(hwctx->priv);
>  	kfree(hwctx->cus);
> @@ -267,3 +742,186 @@ int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *bu
>  		return -EOPNOTSUPP;
>  	}
>  }
> +
> +static int aie2_populate_range(struct amdxdna_gem_obj *abo)
> +{
> +	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
> +	struct mm_struct *mm = abo->mem.notifier.mm;
> +	struct hmm_range range = { 0 };
> +	unsigned long timeout;
> +	int ret;
> +
> +	XDNA_INFO_ONCE(xdna, "populate memory range %llx size %lx",
> +		       abo->mem.userptr, abo->mem.size);
> +	range.notifier = &abo->mem.notifier;
> +	range.start = abo->mem.userptr;
> +	range.end = abo->mem.userptr + abo->mem.size;
> +	range.hmm_pfns = abo->mem.pfns;
> +	range.default_flags = HMM_PFN_REQ_FAULT;
> +
> +	if (!mmget_not_zero(mm))
> +		return -EFAULT;
> +
> +	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +again:
> +	range.notifier_seq = mmu_interval_read_begin(&abo->mem.notifier);
> +	mmap_read_lock(mm);
> +	ret = hmm_range_fault(&range);
> +	mmap_read_unlock(mm);
> +	if (ret) {
> +		if (time_after(jiffies, timeout)) {
> +			ret = -ETIME;
> +			goto put_mm;
> +		}
> +
> +		if (ret == -EBUSY)
> +			goto again;
> +
> +		goto put_mm;
> +	}
> +
> +	mutex_lock(&abo->mem.notify_lock);
> +	if (mmu_interval_read_retry(&abo->mem.notifier, range.notifier_seq)) {
> +		mutex_unlock(&abo->mem.notify_lock);
> +		goto again;
> +	}
> +	abo->mem.map_invalid = false;
> +	mutex_unlock(&abo->mem.notify_lock);
> +
> +put_mm:
> +	mmput(mm);
> +	return ret;
> +}
> +
> +static int aie2_hwctx_push_job(struct amdxdna_sched_job *job, u64 *seq)
> +{
> +	struct amdxdna_hwctx *hwctx = job->hwctx;
> +	struct amdxdna_sched_job *other;
> +	struct dma_fence *fence;
> +	long ret;
> +	int idx;
> +
> +again:
> +	mutex_lock(&hwctx->priv->io_lock);
> +	idx = get_job_idx(hwctx->priv->seq);
> +	/* When pending list full, hwctx->seq points to oldest fence */
> +	other = hwctx->priv->pending[idx];
> +	if (other && !dma_fence_is_signaled(other->out_fence)) {
> +		fence = dma_fence_get(other->out_fence);
> +		mutex_unlock(&hwctx->priv->io_lock);
> +
> +		ret = dma_fence_wait_timeout(fence, true, MAX_SCHEDULE_TIMEOUT);
> +		dma_fence_put(fence);
> +		if (!ret)
> +			return -ETIME;
> +		else if (ret < 0)
> +			return ret;
> +		goto again;
> +	}
> +
> +	if (other) {
> +		dma_fence_put(other->out_fence);
> +		amdxdna_job_put(other);
> +	}
> +
> +	hwctx->priv->pending[idx] = job;
> +	job->seq = hwctx->priv->seq++;
> +	*seq = job->seq;
> +	kref_get(&job->refcnt);
> +
> +	fence = dma_fence_get(job->out_fence);
> +	drm_sched_entity_push_job(&job->base);
> +	mutex_unlock(&hwctx->priv->io_lock);
> +
> +	aie2_ctx_syncobj_add_fence(hwctx, fence, *seq);
> +	dma_fence_put(fence);
> +	return 0;
> +}
> +
> +int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq)
> +{
> +	struct amdxdna_dev *xdna = hwctx->client->xdna;
> +	struct ww_acquire_ctx acquire_ctx;
> +	struct amdxdna_gem_obj *abo;
> +	unsigned long timeout = 0;
> +	int ret, i;
> +
> +	ret = drm_sched_job_init(&job->base, &hwctx->priv->entity, 1, hwctx);
> +	if (ret) {
> +		XDNA_ERR(xdna, "DRM job init failed, ret %d", ret);
> +		return ret;
> +	}
> +
> +	drm_sched_job_arm(&job->base);

Again drive by comments.

This looks wildly dangerous. This typically should be called once
holding all locks at the point in which you cannot fail. I get that
you signal the jobs fence on failure but that doesn't seem like a great
idea nor do I think how the schedule is designed.

The flow typically is:

acquire all locks and setup job...
arm
install fences
push

^^^ With not being able to to fail between arn & push.

Your flow is...

arm
acquire locks...
install fences
drop locks...
acquire different locks...
push
drops different locks...

Seems dangerous, I would reconsider.

Matt

> +	job->out_fence = dma_fence_get(&job->base.s_fence->finished);
> +
> +retry:
> +	ret = drm_gem_lock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
> +	if (ret) {
> +		XDNA_WARN(xdna, "Failed to reserve fence, ret %d", ret);
> +		goto put_fence;
> +	}
> +
> +	for (i = 0; i < job->bo_cnt; i++) {
> +		abo = to_xdna_obj(job->bos[i]);
> +		ret = dma_resv_reserve_fences(job->bos[i]->resv, 1);
> +		if (ret) {
> +			XDNA_WARN(xdna, "Failed to reserve fences %d", ret);
> +			drm_gem_unlock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
> +			goto put_fence;
> +		}
> +
> +		mutex_lock(&abo->mem.notify_lock);
> +		if (abo->mem.map_invalid) {
> +			mutex_unlock(&abo->mem.notify_lock);
> +			drm_gem_unlock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
> +			if (!timeout) {
> +				timeout = jiffies +
> +					msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +			} else if (time_after(jiffies, timeout)) {
> +				ret = -ETIME;
> +				goto put_fence;
> +			}
> +
> +			ret = aie2_populate_range(abo);
> +			if (ret)
> +				goto put_fence;
> +			goto retry;
> +		}
> +
> +		dma_resv_add_fence(job->bos[i]->resv, job->out_fence, DMA_RESV_USAGE_WRITE);
> +		mutex_unlock(&abo->mem.notify_lock);
> +	}
> +
> +	drm_gem_unlock_reservations(job->bos, job->bo_cnt, &acquire_ctx);
> +
> +	ret = aie2_hwctx_push_job(job, seq);
> +	if (ret)
> +		goto signal_fence;
> +
> +	return 0;
> +
> +signal_fence:
> +	dma_fence_signal(job->out_fence);
> +put_fence:
> +	dma_fence_put(job->out_fence);
> +	drm_sched_job_cleanup(&job->base);
> +	return ret;
> +}
> +
> +void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo,
> +			 unsigned long cur_seq)
> +{
> +	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
> +	struct drm_gem_object *gobj = to_gobj(abo);
> +	long ret;
> +
> +	mutex_lock(&abo->mem.notify_lock);
> +	abo->mem.map_invalid = true;
> +	mmu_interval_set_seq(&abo->mem.notifier, cur_seq);
> +	mutex_unlock(&abo->mem.notify_lock);
> +	ret = dma_resv_wait_timeout(gobj->resv, DMA_RESV_USAGE_BOOKKEEP,
> +				    true, MAX_SCHEDULE_TIMEOUT);
> +	if (!ret || ret == -ERESTARTSYS)
> +		XDNA_ERR(xdna, "Failed to wait for bo, ret %ld", ret);
> +}
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 40d9e4261e8b..db62954eb378 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -4,10 +4,12 @@
>   */
>  
>  #include <drm/amdxdna_accel.h>
> +#include <drm/drm_cache.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_print.h>
> +#include <drm/gpu_scheduler.h>
>  #include <linux/bitfield.h>
>  #include <linux/errno.h>
>  #include <linux/pci.h>
> @@ -362,3 +364,344 @@ int aie2_config_cu(struct amdxdna_hwctx *hwctx)
>  		 msg.opcode, resp.status, ret);
>  	return ret;
>  }
> +
> +int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
> +		 int (*notify_cb)(void *, const u32 *, size_t))
> +{
> +	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
> +	struct amdxdna_dev *xdna = hwctx->client->xdna;
> +	struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
> +	union {
> +		struct execute_buffer_req ebuf;
> +		struct exec_dpu_req dpu;
> +	} req;
> +	struct xdna_mailbox_msg msg;
> +	u32 payload_len;
> +	void *payload;
> +	int cu_idx;
> +	int ret;
> +	u32 op;
> +
> +	if (!chann)
> +		return -ENODEV;
> +
> +	payload = amdxdna_cmd_get_payload(cmd_abo, &payload_len);
> +	if (!payload) {
> +		XDNA_ERR(xdna, "Invalid command, cannot get payload");
> +		return -EINVAL;
> +	}
> +
> +	cu_idx = amdxdna_cmd_get_cu_idx(cmd_abo);
> +	if (cu_idx < 0) {
> +		XDNA_DBG(xdna, "Invalid cu idx");
> +		return -EINVAL;
> +	}
> +
> +	op = amdxdna_cmd_get_op(cmd_abo);
> +	switch (op) {
> +	case ERT_START_CU:
> +		if (unlikely(payload_len > sizeof(req.ebuf.payload)))
> +			XDNA_DBG(xdna, "Invalid ebuf payload len: %d", payload_len);
> +		req.ebuf.cu_idx = cu_idx;
> +		memcpy(req.ebuf.payload, payload, sizeof(req.ebuf.payload));
> +		msg.send_size = sizeof(req.ebuf);
> +		msg.opcode = MSG_OP_EXECUTE_BUFFER_CF;
> +		break;
> +	case ERT_START_NPU: {
> +		struct amdxdna_cmd_start_npu *sn = payload;
> +
> +		if (unlikely(payload_len - sizeof(*sn) > sizeof(req.dpu.payload)))
> +			XDNA_DBG(xdna, "Invalid dpu payload len: %d", payload_len);
> +		req.dpu.inst_buf_addr = sn->buffer;
> +		req.dpu.inst_size = sn->buffer_size;
> +		req.dpu.inst_prop_cnt = sn->prop_count;
> +		req.dpu.cu_idx = cu_idx;
> +		memcpy(req.dpu.payload, sn->prop_args, sizeof(req.dpu.payload));
> +		msg.send_size = sizeof(req.dpu);
> +		msg.opcode = MSG_OP_EXEC_DPU;
> +		break;
> +	}
> +	default:
> +		XDNA_DBG(xdna, "Invalid ERT cmd op code: %d", op);
> +		return -EINVAL;
> +	}
> +	msg.handle = job;
> +	msg.notify_cb = notify_cb;
> +	msg.send_data = (u8 *)&req;
> +	print_hex_dump_debug("cmd: ", DUMP_PREFIX_OFFSET, 16, 4, &req,
> +			     0x40, false);
> +
> +	ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Send message failed");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +aie2_cmdlist_fill_one_slot_cf(void *cmd_buf, u32 offset,
> +			      struct amdxdna_gem_obj *abo, u32 *size)
> +{
> +	struct cmd_chain_slot_execbuf_cf *buf = cmd_buf + offset;
> +	int cu_idx = amdxdna_cmd_get_cu_idx(abo);
> +	u32 payload_len;
> +	void *payload;
> +
> +	if (cu_idx < 0)
> +		return -EINVAL;
> +
> +	payload = amdxdna_cmd_get_payload(abo, &payload_len);
> +	if (!payload)
> +		return -EINVAL;
> +
> +	if (!slot_cf_has_space(offset, payload_len))
> +		return -ENOSPC;
> +
> +	buf->cu_idx = cu_idx;
> +	buf->arg_cnt = payload_len / sizeof(u32);
> +	memcpy(buf->args, payload, payload_len);
> +	/* Accurate buf size to hint firmware to do necessary copy */
> +	*size = sizeof(*buf) + payload_len;
> +	return 0;
> +}
> +
> +static int
> +aie2_cmdlist_fill_one_slot_dpu(void *cmd_buf, u32 offset,
> +			       struct amdxdna_gem_obj *abo, u32 *size)
> +{
> +	struct cmd_chain_slot_dpu *buf = cmd_buf + offset;
> +	int cu_idx = amdxdna_cmd_get_cu_idx(abo);
> +	struct amdxdna_cmd_start_npu *sn;
> +	u32 payload_len;
> +	void *payload;
> +	u32 arg_sz;
> +
> +	if (cu_idx < 0)
> +		return -EINVAL;
> +
> +	payload = amdxdna_cmd_get_payload(abo, &payload_len);
> +	if (!payload)
> +		return -EINVAL;
> +	sn = payload;
> +	arg_sz = payload_len - sizeof(*sn);
> +	if (payload_len < sizeof(*sn) || arg_sz > MAX_DPU_ARGS_SIZE)
> +		return -EINVAL;
> +
> +	if (!slot_dpu_has_space(offset, arg_sz))
> +		return -ENOSPC;
> +
> +	buf->inst_buf_addr = sn->buffer;
> +	buf->inst_size = sn->buffer_size;
> +	buf->inst_prop_cnt = sn->prop_count;
> +	buf->cu_idx = cu_idx;
> +	buf->arg_cnt = arg_sz / sizeof(u32);
> +	memcpy(buf->args, sn->prop_args, arg_sz);
> +
> +	/* Accurate buf size to hint firmware to do necessary copy */
> +	*size += sizeof(*buf) + arg_sz;
> +	return 0;
> +}
> +
> +static int
> +aie2_cmdlist_fill_one_slot(u32 op, struct amdxdna_gem_obj *cmdbuf_abo, u32 offset,
> +			   struct amdxdna_gem_obj *abo, u32 *size)
> +{
> +	u32 this_op = amdxdna_cmd_get_op(abo);
> +	void *cmd_buf = cmdbuf_abo->mem.kva;
> +	int ret;
> +
> +	if (this_op != op) {
> +		ret = -EINVAL;
> +		goto done;
> +	}
> +
> +	switch (op) {
> +	case ERT_START_CU:
> +		ret = aie2_cmdlist_fill_one_slot_cf(cmd_buf, offset, abo, size);
> +		break;
> +	case ERT_START_NPU:
> +		ret = aie2_cmdlist_fill_one_slot_dpu(cmd_buf, offset, abo, size);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +	}
> +
> +done:
> +	if (ret) {
> +		XDNA_ERR(abo->client->xdna, "Can't fill slot for cmd op %d ret %d",
> +			 op, ret);
> +	}
> +	return ret;
> +}
> +
> +static inline struct amdxdna_gem_obj *
> +aie2_cmdlist_get_cmd_buf(struct amdxdna_sched_job *job)
> +{
> +	int idx = get_job_idx(job->seq);
> +
> +	return job->hwctx->priv->cmd_buf[idx];
> +}
> +
> +static void
> +aie2_cmdlist_prepare_request(struct cmd_chain_req *req,
> +			     struct amdxdna_gem_obj *cmdbuf_abo, u32 size, u32 cnt)
> +{
> +	req->buf_addr = cmdbuf_abo->mem.dev_addr;
> +	req->buf_size = size;
> +	req->count = cnt;
> +	drm_clflush_virt_range(cmdbuf_abo->mem.kva, size);
> +	XDNA_DBG(cmdbuf_abo->client->xdna, "Command buf addr 0x%llx size 0x%x count %d",
> +		 req->buf_addr, size, cnt);
> +}
> +
> +static inline u32
> +aie2_cmd_op_to_msg_op(u32 op)
> +{
> +	switch (op) {
> +	case ERT_START_CU:
> +		return MSG_OP_CHAIN_EXEC_BUFFER_CF;
> +	case ERT_START_NPU:
> +		return MSG_OP_CHAIN_EXEC_DPU;
> +	default:
> +		return MSG_OP_MAX_OPCODE;
> +	}
> +}
> +
> +int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
> +			       struct amdxdna_sched_job *job,
> +			       int (*notify_cb)(void *, const u32 *, size_t))
> +{
> +	struct amdxdna_gem_obj *cmdbuf_abo = aie2_cmdlist_get_cmd_buf(job);
> +	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
> +	struct amdxdna_client *client = hwctx->client;
> +	struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
> +	struct amdxdna_cmd_chain *payload;
> +	struct xdna_mailbox_msg msg;
> +	struct cmd_chain_req req;
> +	u32 payload_len;
> +	u32 offset = 0;
> +	u32 size;
> +	int ret;
> +	u32 op;
> +	u32 i;
> +
> +	op = amdxdna_cmd_get_op(cmd_abo);
> +	payload = amdxdna_cmd_get_payload(cmd_abo, &payload_len);
> +	if (op != ERT_CMD_CHAIN || !payload ||
> +	    payload_len < struct_size(payload, data, payload->command_count))
> +		return -EINVAL;
> +
> +	for (i = 0; i < payload->command_count; i++) {
> +		u32 boh = (u32)(payload->data[i]);
> +		struct amdxdna_gem_obj *abo;
> +
> +		abo = amdxdna_gem_get_obj(client, boh, AMDXDNA_BO_CMD);
> +		if (!abo) {
> +			XDNA_ERR(client->xdna, "Failed to find cmd BO %d", boh);
> +			return -ENOENT;
> +		}
> +
> +		/* All sub-cmd should have same op, use the first one. */
> +		if (i == 0)
> +			op = amdxdna_cmd_get_op(abo);
> +
> +		ret = aie2_cmdlist_fill_one_slot(op, cmdbuf_abo, offset, abo, &size);
> +		amdxdna_gem_put_obj(abo);
> +		if (ret)
> +			return -EINVAL;
> +
> +		offset += size;
> +	}
> +
> +	/* The offset is the accumulated total size of the cmd buffer */
> +	aie2_cmdlist_prepare_request(&req, cmdbuf_abo, offset, payload->command_count);
> +
> +	msg.opcode = aie2_cmd_op_to_msg_op(op);
> +	if (msg.opcode == MSG_OP_MAX_OPCODE)
> +		return -EOPNOTSUPP;
> +	msg.handle = job;
> +	msg.notify_cb = notify_cb;
> +	msg.send_data = (u8 *)&req;
> +	msg.send_size = sizeof(req);
> +	ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
> +	if (ret) {
> +		XDNA_ERR(hwctx->client->xdna, "Send message failed");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int aie2_cmdlist_single_execbuf(struct amdxdna_hwctx *hwctx,
> +				struct amdxdna_sched_job *job,
> +				int (*notify_cb)(void *, const u32 *, size_t))
> +{
> +	struct amdxdna_gem_obj *cmdbuf_abo = aie2_cmdlist_get_cmd_buf(job);
> +	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
> +	struct amdxdna_gem_obj *cmd_abo = job->cmd_bo;
> +	struct xdna_mailbox_msg msg;
> +	struct cmd_chain_req req;
> +	u32 size;
> +	int ret;
> +	u32 op;
> +
> +	op = amdxdna_cmd_get_op(cmd_abo);
> +	ret = aie2_cmdlist_fill_one_slot(op, cmdbuf_abo, 0, cmd_abo, &size);
> +	if (ret)
> +		return ret;
> +
> +	aie2_cmdlist_prepare_request(&req, cmdbuf_abo, size, 1);
> +
> +	msg.opcode = aie2_cmd_op_to_msg_op(op);
> +	if (msg.opcode == MSG_OP_MAX_OPCODE)
> +		return -EOPNOTSUPP;
> +	msg.handle = job;
> +	msg.notify_cb = notify_cb;
> +	msg.send_data = (u8 *)&req;
> +	msg.send_size = sizeof(req);
> +	ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
> +	if (ret) {
> +		XDNA_ERR(hwctx->client->xdna, "Send message failed");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
> +		 int (*notify_cb)(void *, const u32 *, size_t))
> +{
> +	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
> +	struct amdxdna_gem_obj *abo = to_xdna_obj(job->bos[0]);
> +	struct amdxdna_dev *xdna = hwctx->client->xdna;
> +	struct xdna_mailbox_msg msg;
> +	struct sync_bo_req req;
> +	int ret = 0;
> +
> +	req.src_addr = 0;
> +	req.dst_addr = abo->mem.dev_addr - hwctx->client->dev_heap->mem.dev_addr;
> +	req.size = abo->mem.size;
> +
> +	/* Device to Host */
> +	req.type = FIELD_PREP(AIE2_MSG_SYNC_BO_SRC_TYPE, SYNC_BO_DEV_MEM) |
> +		FIELD_PREP(AIE2_MSG_SYNC_BO_DST_TYPE, SYNC_BO_HOST_MEM);
> +
> +	XDNA_DBG(xdna, "sync %d bytes src(0x%llx) to dst(0x%llx) completed",
> +		 req.size, req.src_addr, req.dst_addr);
> +
> +	msg.handle = job;
> +	msg.notify_cb = notify_cb;
> +	msg.send_data = (u8 *)&req;
> +	msg.send_size = sizeof(req);
> +	msg.opcode = MSG_OP_SYNC_BO;
> +
> +	ret = xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Send message failed");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index caeb07d1dc6b..fb369d615969 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -5,8 +5,10 @@
>  
>  #include <drm/amdxdna_accel.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> +#include <drm/gpu_scheduler.h>
>  #include <linux/errno.h>
>  #include <linux/firmware.h>
>  #include <linux/iommu.h>
> @@ -17,6 +19,7 @@
>  #include "aie2_pci.h"
>  #include "aie2_solver.h"
>  #include "amdxdna_ctx.h"
> +#include "amdxdna_gem.h"
>  #include "amdxdna_mailbox.h"
>  #include "amdxdna_pci_drv.h"
>  
> @@ -495,4 +498,6 @@ const struct amdxdna_dev_ops aie2_ops = {
>  	.hwctx_init     = aie2_hwctx_init,
>  	.hwctx_fini     = aie2_hwctx_fini,
>  	.hwctx_config   = aie2_hwctx_config,
> +	.cmd_submit     = aie2_cmd_submit,
> +	.hmm_invalidate = aie2_hmm_invalidate,
>  };
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 3ac936e2c9d1..7c4347649daa 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -76,6 +76,7 @@ enum psp_reg_idx {
>  	PSP_MAX_REGS /* Keep this at the end */
>  };
>  
> +struct amdxdna_client;
>  struct amdxdna_fw_ver;
>  struct amdxdna_hwctx;
>  
> @@ -118,9 +119,29 @@ struct rt_config {
>  	u32	value;
>  };
>  
> +/*
> + * Define the maximum number of pending commands in a hardware context.
> + * Must be power of 2!
> + */
> +#define HWCTX_MAX_CMDS		4
> +#define get_job_idx(seq) ((seq) & (HWCTX_MAX_CMDS - 1))
>  struct amdxdna_hwctx_priv {
>  	struct amdxdna_gem_obj		*heap;
>  	void				*mbox_chann;
> +
> +	struct drm_gpu_scheduler	sched;
> +	struct drm_sched_entity		entity;
> +
> +	struct mutex			io_lock; /* protect seq and cmd order */
> +	struct wait_queue_head		job_free_wq;
> +	struct amdxdna_sched_job	*pending[HWCTX_MAX_CMDS];
> +	u32				num_pending;
> +	u64				seq;
> +	/* Completed job counter */
> +	u64				completed;
> +
> +	struct amdxdna_gem_obj		*cmd_buf[HWCTX_MAX_CMDS];
> +	struct drm_syncobj		*syncobj;
>  };
>  
>  struct amdxdna_dev_hdl {
> @@ -199,10 +220,24 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>  int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx);
>  int aie2_map_host_buf(struct amdxdna_dev_hdl *ndev, u32 context_id, u64 addr, u64 size);
>  int aie2_config_cu(struct amdxdna_hwctx *hwctx);
> +int aie2_execbuf(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
> +		 int (*notify_cb)(void *, const u32 *, size_t));
> +int aie2_cmdlist_single_execbuf(struct amdxdna_hwctx *hwctx,
> +				struct amdxdna_sched_job *job,
> +				int (*notify_cb)(void *, const u32 *, size_t));
> +int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
> +			       struct amdxdna_sched_job *job,
> +			       int (*notify_cb)(void *, const u32 *, size_t));
> +int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
> +		 int (*notify_cb)(void *, const u32 *, size_t));
>  
>  /* aie2_hwctx.c */
>  int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>  void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
>  int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
> +int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
> +void aie2_hmm_invalidate(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
> +void aie2_stop_ctx_by_col_map(struct amdxdna_client *client, u32 col_map);
> +void aie2_restart_ctx(struct amdxdna_client *client);
>  
>  #endif /* _AIE2_PCI_H_ */
> diff --git a/drivers/accel/amdxdna/aie2_psp.c b/drivers/accel/amdxdna/aie2_psp.c
> index b03501e81065..dc3a072ce3b6 100644
> --- a/drivers/accel/amdxdna/aie2_psp.c
> +++ b/drivers/accel/amdxdna/aie2_psp.c
> @@ -4,8 +4,10 @@
>   */
>  
>  #include <drm/drm_device.h>
> +#include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> +#include <drm/gpu_scheduler.h>
>  #include <linux/bitfield.h>
>  #include <linux/iopoll.h>
>  
> diff --git a/drivers/accel/amdxdna/aie2_smu.c b/drivers/accel/amdxdna/aie2_smu.c
> index 3fa7064649aa..91893d438da7 100644
> --- a/drivers/accel/amdxdna/aie2_smu.c
> +++ b/drivers/accel/amdxdna/aie2_smu.c
> @@ -4,7 +4,9 @@
>   */
>  
>  #include <drm/drm_device.h>
> +#include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_print.h>
> +#include <drm/gpu_scheduler.h>
>  #include <linux/iopoll.h>
>  
>  #include "aie2_pci.h"
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
> index 9489399adea1..49a180969f4a 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -7,17 +7,65 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_print.h>
> +#include <drm/gpu_scheduler.h>
> +#include <trace/events/amdxdna.h>
>  
>  #include "amdxdna_ctx.h"
> +#include "amdxdna_gem.h"
>  #include "amdxdna_pci_drv.h"
>  
>  #define MAX_HWCTX_ID		255
> +#define MAX_ARG_COUNT		4095
>  
> -static void amdxdna_hwctx_destroy(struct amdxdna_hwctx *hwctx)
> +struct amdxdna_fence {
> +	struct dma_fence	base;
> +	spinlock_t		lock; /* for base */
> +	struct amdxdna_hwctx	*hwctx;
> +};
> +
> +static const char *amdxdna_fence_get_driver_name(struct dma_fence *fence)
> +{
> +	return KBUILD_MODNAME;
> +}
> +
> +static const char *amdxdna_fence_get_timeline_name(struct dma_fence *fence)
> +{
> +	struct amdxdna_fence *xdna_fence;
> +
> +	xdna_fence = container_of(fence, struct amdxdna_fence, base);
> +
> +	return xdna_fence->hwctx->name;
> +}
> +
> +static const struct dma_fence_ops fence_ops = {
> +	.get_driver_name = amdxdna_fence_get_driver_name,
> +	.get_timeline_name = amdxdna_fence_get_timeline_name,
> +};
> +
> +static struct dma_fence *amdxdna_fence_create(struct amdxdna_hwctx *hwctx)
> +{
> +	struct amdxdna_fence *fence;
> +
> +	fence = kzalloc(sizeof(*fence), GFP_KERNEL);
> +	if (!fence)
> +		return NULL;
> +
> +	fence->hwctx = hwctx;
> +	spin_lock_init(&fence->lock);
> +	dma_fence_init(&fence->base, &fence_ops, &fence->lock, hwctx->id, 0);
> +	return &fence->base;
> +}
> +
> +static void amdxdna_hwctx_destroy_rcu(struct amdxdna_hwctx *hwctx,
> +				      struct srcu_struct *ss)
>  {
>  	struct amdxdna_dev *xdna = hwctx->client->xdna;
>  
> +	synchronize_srcu(ss);
> +
>  	/* At this point, user is not able to submit new commands */
>  	mutex_lock(&xdna->dev_lock);
>  	xdna->dev_info->ops->hwctx_fini(hwctx);
> @@ -27,6 +75,46 @@ static void amdxdna_hwctx_destroy(struct amdxdna_hwctx *hwctx)
>  	kfree(hwctx);
>  }
>  
> +void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size)
> +{
> +	struct amdxdna_cmd *cmd = abo->mem.kva;
> +	u32 num_masks, count;
> +
> +	if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN)
> +		num_masks = 0;
> +	else
> +		num_masks = 1 + FIELD_GET(AMDXDNA_CMD_EXTRA_CU_MASK, cmd->header);
> +
> +	if (size) {
> +		count = FIELD_GET(AMDXDNA_CMD_COUNT, cmd->header);
> +		if (unlikely(count <= num_masks)) {
> +			*size = 0;
> +			return NULL;
> +		}
> +		*size = (count - num_masks) * sizeof(u32);
> +	}
> +	return &cmd->data[num_masks];
> +}
> +
> +int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo)
> +{
> +	struct amdxdna_cmd *cmd = abo->mem.kva;
> +	u32 num_masks, i;
> +	u32 *cu_mask;
> +
> +	if (amdxdna_cmd_get_op(abo) == ERT_CMD_CHAIN)
> +		return -1;
> +
> +	num_masks = 1 + FIELD_GET(AMDXDNA_CMD_EXTRA_CU_MASK, cmd->header);
> +	cu_mask = cmd->data;
> +	for (i = 0; i < num_masks; i++) {
> +		if (cu_mask[i])
> +			return ffs(cu_mask[i]) - 1;
> +	}
> +
> +	return -1;
> +}
> +
>  /*
>   * This should be called in close() and remove(). DO NOT call in other syscalls.
>   * This guarantee that when hwctx and resources will be released, if user
> @@ -43,7 +131,7 @@ void amdxdna_hwctx_remove_all(struct amdxdna_client *client)
>  			 client->pid, hwctx->id);
>  		idr_remove(&client->hwctx_idr, hwctx->id);
>  		mutex_unlock(&client->hwctx_lock);
> -		amdxdna_hwctx_destroy(hwctx);
> +		amdxdna_hwctx_destroy_rcu(hwctx, &client->hwctx_srcu);
>  		mutex_lock(&client->hwctx_lock);
>  	}
>  	mutex_unlock(&client->hwctx_lock);
> @@ -135,6 +223,12 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
>  	if (!drm_dev_enter(dev, &idx))
>  		return -ENODEV;
>  
> +	/*
> +	 * Use hwctx_lock to achieve exclusion with other hwctx writers,
> +	 * SRCU to synchronize with exec/wait command ioctls.
> +	 *
> +	 * The pushed jobs are handled by DRM scheduler during destroy.
> +	 */
>  	mutex_lock(&client->hwctx_lock);
>  	hwctx = idr_find(&client->hwctx_idr, args->handle);
>  	if (!hwctx) {
> @@ -147,7 +241,7 @@ int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct d
>  	idr_remove(&client->hwctx_idr, hwctx->id);
>  	mutex_unlock(&client->hwctx_lock);
>  
> -	amdxdna_hwctx_destroy(hwctx);
> +	amdxdna_hwctx_destroy_rcu(hwctx, &client->hwctx_srcu);
>  
>  	XDNA_DBG(xdna, "PID %d destroyed HW context %d", client->pid, args->handle);
>  out:
> @@ -161,10 +255,10 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
>  	struct amdxdna_drm_config_hwctx *args = data;
>  	struct amdxdna_dev *xdna = to_xdna_dev(dev);
>  	struct amdxdna_hwctx *hwctx;
> +	int ret, idx;
>  	u32 buf_size;
>  	void *buf;
>  	u64 val;
> -	int ret;
>  
>  	if (!xdna->dev_info->ops->hwctx_config)
>  		return -EOPNOTSUPP;
> @@ -203,17 +297,241 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
>  	}
>  
>  	mutex_lock(&xdna->dev_lock);
> +	idx = srcu_read_lock(&client->hwctx_srcu);
>  	hwctx = idr_find(&client->hwctx_idr, args->handle);
>  	if (!hwctx) {
>  		XDNA_DBG(xdna, "PID %d failed to get hwctx %d", client->pid, args->handle);
>  		ret = -EINVAL;
> -		goto unlock;
> +		goto unlock_srcu;
>  	}
>  
>  	ret = xdna->dev_info->ops->hwctx_config(hwctx, args->param_type, val, buf, buf_size);
>  
> -unlock:
> +unlock_srcu:
> +	srcu_read_unlock(&client->hwctx_srcu, idx);
>  	mutex_unlock(&xdna->dev_lock);
>  	kfree(buf);
>  	return ret;
>  }
> +
> +static void
> +amdxdna_arg_bos_put(struct amdxdna_sched_job *job)
> +{
> +	int i;
> +
> +	for (i = 0; i < job->bo_cnt; i++) {
> +		if (!job->bos[i])
> +			break;
> +		drm_gem_object_put(job->bos[i]);
> +	}
> +}
> +
> +static int
> +amdxdna_arg_bos_lookup(struct amdxdna_client *client,
> +		       struct amdxdna_sched_job *job,
> +		       u32 *bo_hdls, u32 bo_cnt)
> +{
> +	struct drm_gem_object *gobj;
> +	int i, ret;
> +
> +	job->bo_cnt = bo_cnt;
> +	for (i = 0; i < job->bo_cnt; i++) {
> +		struct amdxdna_gem_obj *abo;
> +
> +		gobj = drm_gem_object_lookup(client->filp, bo_hdls[i]);
> +		if (!gobj) {
> +			ret = -ENOENT;
> +			goto put_shmem_bo;
> +		}
> +		abo = to_xdna_obj(gobj);
> +
> +		mutex_lock(&abo->lock);
> +		if (abo->pinned) {
> +			mutex_unlock(&abo->lock);
> +			job->bos[i] = gobj;
> +			continue;
> +		}
> +
> +		ret = amdxdna_gem_pin_nolock(abo);
> +		if (ret) {
> +			mutex_unlock(&abo->lock);
> +			drm_gem_object_put(gobj);
> +			goto put_shmem_bo;
> +		}
> +		abo->pinned = true;
> +		mutex_unlock(&abo->lock);
> +
> +		job->bos[i] = gobj;
> +	}
> +
> +	return 0;
> +
> +put_shmem_bo:
> +	amdxdna_arg_bos_put(job);
> +	return ret;
> +}
> +
> +static void amdxdna_sched_job_release(struct kref *ref)
> +{
> +	struct amdxdna_sched_job *job;
> +
> +	job = container_of(ref, struct amdxdna_sched_job, refcnt);
> +
> +	trace_amdxdna_debug_point(job->hwctx->name, job->seq, "job release");
> +	amdxdna_arg_bos_put(job);
> +	amdxdna_gem_put_obj(job->cmd_bo);
> +	kfree(job);
> +}
> +
> +void amdxdna_job_put(struct amdxdna_sched_job *job)
> +{
> +	kref_put(&job->refcnt, amdxdna_sched_job_release);
> +}
> +
> +int amdxdna_cmd_submit(struct amdxdna_client *client,
> +		       u32 cmd_bo_hdl, u32 *arg_bo_hdls, u32 arg_bo_cnt,
> +		       u32 hwctx_hdl, u64 *seq)
> +{
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_sched_job *job;
> +	struct amdxdna_hwctx *hwctx;
> +	int ret, idx;
> +
> +	XDNA_DBG(xdna, "Command BO hdl %d, Arg BO count %d", cmd_bo_hdl, arg_bo_cnt);
> +	job = kzalloc(struct_size(job, bos, arg_bo_cnt), GFP_KERNEL);
> +	if (!job)
> +		return -ENOMEM;
> +
> +	if (cmd_bo_hdl != AMDXDNA_INVALID_BO_HANDLE) {
> +		job->cmd_bo = amdxdna_gem_get_obj(client, cmd_bo_hdl, AMDXDNA_BO_CMD);
> +		if (!job->cmd_bo) {
> +			XDNA_ERR(xdna, "Failed to get cmd bo from %d", cmd_bo_hdl);
> +			ret = -EINVAL;
> +			goto free_job;
> +		}
> +	} else {
> +		job->cmd_bo = NULL;
> +	}
> +
> +	ret = amdxdna_arg_bos_lookup(client, job, arg_bo_hdls, arg_bo_cnt);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Argument BOs lookup failed, ret %d", ret);
> +		goto cmd_put;
> +	}
> +
> +	idx = srcu_read_lock(&client->hwctx_srcu);
> +	hwctx = idr_find(&client->hwctx_idr, hwctx_hdl);
> +	if (!hwctx) {
> +		XDNA_DBG(xdna, "PID %d failed to get hwctx %d",
> +			 client->pid, hwctx_hdl);
> +		ret = -EINVAL;
> +		goto unlock_srcu;
> +	}
> +
> +	if (hwctx->status != HWCTX_STAT_READY) {
> +		XDNA_ERR(xdna, "HW Context is not ready");
> +		ret = -EINVAL;
> +		goto unlock_srcu;
> +	}
> +
> +	job->hwctx = hwctx;
> +	job->mm = current->mm;
> +
> +	job->fence = amdxdna_fence_create(hwctx);
> +	if (!job->fence) {
> +		XDNA_ERR(xdna, "Failed to create fence");
> +		ret = -ENOMEM;
> +		goto unlock_srcu;
> +	}
> +	kref_init(&job->refcnt);
> +
> +	ret = xdna->dev_info->ops->cmd_submit(hwctx, job, seq);
> +	if (ret)
> +		goto put_fence;
> +
> +	/*
> +	 * The amdxdna_hwctx_destroy_rcu() will release hwctx and associated
> +	 * resource after synchronize_srcu(). The submitted jobs should be
> +	 * handled by the queue, for example DRM scheduler, in device layer.
> +	 * For here we can unlock SRCU.
> +	 */
> +	srcu_read_unlock(&client->hwctx_srcu, idx);
> +	trace_amdxdna_debug_point(hwctx->name, *seq, "job pushed");
> +
> +	return 0;
> +
> +put_fence:
> +	dma_fence_put(job->fence);
> +unlock_srcu:
> +	srcu_read_unlock(&client->hwctx_srcu, idx);
> +	amdxdna_arg_bos_put(job);
> +cmd_put:
> +	amdxdna_gem_put_obj(job->cmd_bo);
> +free_job:
> +	kfree(job);
> +	return ret;
> +}
> +
> +/*
> + * The submit command ioctl submits a command to firmware. One firmware command
> + * may contain multiple command BOs for processing as a whole.
> + * The command sequence number is returned which can be used for wait command ioctl.
> + */
> +static int amdxdna_drm_submit_execbuf(struct amdxdna_client *client,
> +				      struct amdxdna_drm_exec_cmd *args)
> +{
> +	struct amdxdna_dev *xdna = client->xdna;
> +	u32 *arg_bo_hdls;
> +	u32 cmd_bo_hdl;
> +	int ret;
> +
> +	if (!args->arg_count || args->arg_count > MAX_ARG_COUNT) {
> +		XDNA_ERR(xdna, "Invalid arg bo count %d", args->arg_count);
> +		return -EINVAL;
> +	}
> +
> +	/* Only support single command for now. */
> +	if (args->cmd_count != 1) {
> +		XDNA_ERR(xdna, "Invalid cmd bo count %d", args->cmd_count);
> +		return -EINVAL;
> +	}
> +
> +	cmd_bo_hdl = (u32)args->cmd_handles;
> +	arg_bo_hdls = kcalloc(args->arg_count, sizeof(u32), GFP_KERNEL);
> +	if (!arg_bo_hdls)
> +		return -ENOMEM;
> +	ret = copy_from_user(arg_bo_hdls, u64_to_user_ptr(args->args),
> +			     args->arg_count * sizeof(u32));
> +	if (ret) {
> +		ret = -EFAULT;
> +		goto free_cmd_bo_hdls;
> +	}
> +
> +	ret = amdxdna_cmd_submit(client, cmd_bo_hdl, arg_bo_hdls,
> +				 args->arg_count, args->hwctx, &args->seq);
> +	if (ret)
> +		XDNA_DBG(xdna, "Submit cmds failed, ret %d", ret);
> +
> +free_cmd_bo_hdls:
> +	kfree(arg_bo_hdls);
> +	if (!ret)
> +		XDNA_DBG(xdna, "Pushed cmd %lld to scheduler", args->seq);
> +	return ret;
> +}
> +
> +int amdxdna_drm_submit_cmd_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
> +{
> +	struct amdxdna_client *client = filp->driver_priv;
> +	struct amdxdna_drm_exec_cmd *args = data;
> +
> +	if (args->ext || args->ext_flags)
> +		return -EINVAL;
> +
> +	switch (args->type) {
> +	case AMDXDNA_CMD_SUBMIT_EXEC_BUF:
> +		return amdxdna_drm_submit_execbuf(client, args);
> +	}
> +
> +	XDNA_ERR(client->xdna, "Invalid command type %d", args->type);
> +	return -EINVAL;
> +}
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
> index b409d0731ab8..505bff965bd9 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
> @@ -6,6 +6,54 @@
>  #ifndef _AMDXDNA_CTX_H_
>  #define _AMDXDNA_CTX_H_
>  
> +#include <linux/bitfield.h>
> +
> +#include "amdxdna_gem.h"
> +
> +struct amdxdna_hwctx_priv;
> +
> +enum ert_cmd_opcode {
> +	ERT_START_CU      = 0,
> +	ERT_CMD_CHAIN     = 19,
> +	ERT_START_NPU     = 20,
> +};
> +
> +enum ert_cmd_state {
> +	ERT_CMD_STATE_INVALID,
> +	ERT_CMD_STATE_NEW,
> +	ERT_CMD_STATE_QUEUED,
> +	ERT_CMD_STATE_RUNNING,
> +	ERT_CMD_STATE_COMPLETED,
> +	ERT_CMD_STATE_ERROR,
> +	ERT_CMD_STATE_ABORT,
> +	ERT_CMD_STATE_SUBMITTED,
> +	ERT_CMD_STATE_TIMEOUT,
> +	ERT_CMD_STATE_NORESPONSE,
> +};
> +
> +/*
> + * Interpretation of the beginning of data payload for ERT_START_NPU in
> + * amdxdna_cmd. The rest of the payload in amdxdna_cmd is regular kernel args.
> + */
> +struct amdxdna_cmd_start_npu {
> +	u64 buffer;       /* instruction buffer address */
> +	u32 buffer_size;  /* size of buffer in bytes */
> +	u32 prop_count;	  /* properties count */
> +	u32 prop_args[];  /* properties and regular kernel arguments */
> +};
> +
> +/*
> + * Interpretation of the beginning of data payload for ERT_CMD_CHAIN in
> + * amdxdna_cmd. The rest of the payload in amdxdna_cmd is cmd BO handles.
> + */
> +struct amdxdna_cmd_chain {
> +	u32 command_count;
> +	u32 submit_index;
> +	u32 error_index;
> +	u32 reserved[3];
> +	u64 data[] __counted_by(command_count);
> +};
> +
>  /* Exec buffer command header format */
>  #define AMDXDNA_CMD_STATE		GENMASK(3, 0)
>  #define AMDXDNA_CMD_EXTRA_CU_MASK	GENMASK(11, 10)
> @@ -41,9 +89,72 @@ struct amdxdna_hwctx {
>  	u32				syncobj_hdl;
>  };
>  
> +#define drm_job_to_xdna_job(j) \
> +	container_of(j, struct amdxdna_sched_job, base)
> +
> +struct amdxdna_sched_job {
> +	struct drm_sched_job	base;
> +	struct kref		refcnt;
> +	struct amdxdna_hwctx	*hwctx;
> +	struct mm_struct	*mm;
> +	/* The fence to notice DRM scheduler that job is done by hardware */
> +	struct dma_fence	*fence;
> +	/* user can wait on this fence */
> +	struct dma_fence	*out_fence;
> +	u64			seq;
> +	struct amdxdna_gem_obj	*cmd_bo;
> +	size_t			bo_cnt;
> +	struct drm_gem_object	*bos[] __counted_by(bo_cnt);
> +};
> +
> +static inline u32
> +amdxdna_cmd_get_op(struct amdxdna_gem_obj *abo)
> +{
> +	struct amdxdna_cmd *cmd = abo->mem.kva;
> +
> +	return FIELD_GET(AMDXDNA_CMD_OPCODE, cmd->header);
> +}
> +
> +static inline void
> +amdxdna_cmd_set_state(struct amdxdna_gem_obj *abo, enum ert_cmd_state s)
> +{
> +	struct amdxdna_cmd *cmd = abo->mem.kva;
> +
> +	cmd->header &= ~AMDXDNA_CMD_STATE;
> +	cmd->header |= FIELD_PREP(AMDXDNA_CMD_STATE, s);
> +}
> +
> +static inline enum ert_cmd_state
> +amdxdna_cmd_get_state(struct amdxdna_gem_obj *abo)
> +{
> +	struct amdxdna_cmd *cmd = abo->mem.kva;
> +
> +	return FIELD_GET(AMDXDNA_CMD_STATE, cmd->header);
> +}
> +
> +void *amdxdna_cmd_get_payload(struct amdxdna_gem_obj *abo, u32 *size);
> +int amdxdna_cmd_get_cu_idx(struct amdxdna_gem_obj *abo);
> +
> +static inline u32 amdxdna_hwctx_col_map(struct amdxdna_hwctx *hwctx)
> +{
> +	return GENMASK(hwctx->start_col + hwctx->num_col - 1,
> +		       hwctx->start_col);
> +}
> +
> +void amdxdna_job_put(struct amdxdna_sched_job *job);
> +
>  void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
> +
> +int amdxdna_cmd_submit(struct amdxdna_client *client,
> +		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
> +		       u32 hwctx_hdl, u64 *seq);
> +
> +int amdxdna_cmd_wait(struct amdxdna_client *client, u32 hwctx_hdl,
> +		     u64 seq, u32 timeout);
> +
>  int amdxdna_drm_create_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
>  int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
>  int amdxdna_drm_destroy_hwctx_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
> +int amdxdna_drm_submit_cmd_ioctl(struct drm_device *dev, void *data, struct drm_file *filp);
>  
>  #endif /* _AMDXDNA_CTX_H_ */
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index f2ba86ae9e1a..6a105430e726 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_gem.h>
>  #include <drm/drm_gem_shmem_helper.h>
> +#include <drm/gpu_scheduler.h>
>  #include <linux/iosys-map.h>
>  #include <linux/vmalloc.h>
>  
> @@ -72,6 +73,7 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
>  		vunmap(abo->mem.kva);
>  		drm_gem_object_put(to_gobj(abo->dev_heap));
>  		drm_gem_object_release(gobj);
> +		mutex_destroy(&abo->mem.notify_lock);
>  		mutex_destroy(&abo->lock);
>  		kfree(abo);
>  		return;
> @@ -81,6 +83,7 @@ static void amdxdna_gem_obj_free(struct drm_gem_object *gobj)
>  		drm_mm_takedown(&abo->mm);
>  
>  	drm_gem_vunmap_unlocked(gobj, &map);
> +	mutex_destroy(&abo->mem.notify_lock);
>  	mutex_destroy(&abo->lock);
>  	drm_gem_shmem_free(&abo->base);
>  }
> @@ -234,6 +237,13 @@ amdxdna_gem_create_obj(struct drm_device *dev, size_t size)
>  	abo->pinned = false;
>  	abo->assigned_hwctx = AMDXDNA_INVALID_CTX_HANDLE;
>  	mutex_init(&abo->lock);
> +	mutex_init(&abo->mem.notify_lock);
> +
> +	if (IS_ENABLED(CONFIG_LOCKDEP)) {
> +		fs_reclaim_acquire(GFP_KERNEL);
> +		might_lock(&abo->mem.notify_lock);
> +		fs_reclaim_release(GFP_KERNEL);
> +	}
>  
>  	abo->mem.userptr = AMDXDNA_INVALID_ADDR;
>  	abo->mem.dev_addr = AMDXDNA_INVALID_ADDR;
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
> index 8ccc0375dd9d..0c91348298da 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.h
> +++ b/drivers/accel/amdxdna/amdxdna_gem.h
> @@ -16,6 +16,7 @@ struct amdxdna_mem {
>  	struct mmu_interval_notifier	notifier;
>  	unsigned long			*pfns;
>  	bool				map_invalid;
> +	struct mutex			notify_lock; /* for map_invalid */
>  };
>  
>  struct amdxdna_gem_obj {
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox_helper.c b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
> index 42b615394605..5139a9c96a91 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox_helper.c
> @@ -3,10 +3,15 @@
>   * Copyright (C) 2024, Advanced Micro Devices, Inc.
>   */
>  
> +#include <drm/amdxdna_accel.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_print.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/gpu_scheduler.h>
>  #include <linux/completion.h>
>  
> +#include "amdxdna_gem.h"
>  #include "amdxdna_mailbox.h"
>  #include "amdxdna_mailbox_helper.h"
>  #include "amdxdna_pci_drv.h"
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 172109cc9617..59477204df89 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_managed.h>
> +#include <drm/gpu_scheduler.h>
>  #include <linux/iommu.h>
>  #include <linux/pci.h>
>  
> @@ -64,6 +65,7 @@ static int amdxdna_drm_open(struct drm_device *ddev, struct drm_file *filp)
>  		goto unbind_sva;
>  	}
>  	mutex_init(&client->hwctx_lock);
> +	init_srcu_struct(&client->hwctx_srcu);
>  	idr_init_base(&client->hwctx_idr, AMDXDNA_INVALID_CTX_HANDLE + 1);
>  	mutex_init(&client->mm_lock);
>  
> @@ -93,6 +95,7 @@ static void amdxdna_drm_close(struct drm_device *ddev, struct drm_file *filp)
>  	XDNA_DBG(xdna, "closing pid %d", client->pid);
>  
>  	idr_destroy(&client->hwctx_idr);
> +	cleanup_srcu_struct(&client->hwctx_srcu);
>  	mutex_destroy(&client->hwctx_lock);
>  	mutex_destroy(&client->mm_lock);
>  	if (client->dev_heap)
> @@ -133,6 +136,8 @@ static const struct drm_ioctl_desc amdxdna_drm_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(AMDXDNA_CREATE_BO, amdxdna_drm_create_bo_ioctl, 0),
>  	DRM_IOCTL_DEF_DRV(AMDXDNA_GET_BO_INFO, amdxdna_drm_get_bo_info_ioctl, 0),
>  	DRM_IOCTL_DEF_DRV(AMDXDNA_SYNC_BO, amdxdna_drm_sync_bo_ioctl, 0),
> +	/* Execution */
> +	DRM_IOCTL_DEF_DRV(AMDXDNA_EXEC_CMD, amdxdna_drm_submit_cmd_ioctl, 0),
>  };
>  
>  static const struct file_operations amdxdna_fops = {
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> index 3dddde4ac12a..be53c9447778 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> @@ -20,6 +20,7 @@ extern const struct drm_driver amdxdna_drm_drv;
>  struct amdxdna_dev;
>  struct amdxdna_gem_obj;
>  struct amdxdna_hwctx;
> +struct amdxdna_sched_job;
>  
>  /*
>   * struct amdxdna_dev_ops - Device hardware operation callbacks
> @@ -31,6 +32,7 @@ struct amdxdna_dev_ops {
>  	void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
>  	int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
>  	void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
> +	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
>  };
>  
>  /*
> @@ -88,6 +90,8 @@ struct amdxdna_client {
>  	struct list_head		node;
>  	pid_t				pid;
>  	struct mutex			hwctx_lock; /* protect hwctx */
> +	/* do NOT wait this srcu when hwctx_lock is hold */
> +	struct srcu_struct		hwctx_srcu;
>  	struct idr			hwctx_idr;
>  	struct amdxdna_dev		*xdna;
>  	struct drm_file			*filp;
> diff --git a/drivers/accel/amdxdna/amdxdna_sysfs.c b/drivers/accel/amdxdna/amdxdna_sysfs.c
> index 668b94b92714..f27e4ee960a0 100644
> --- a/drivers/accel/amdxdna/amdxdna_sysfs.c
> +++ b/drivers/accel/amdxdna/amdxdna_sysfs.c
> @@ -3,9 +3,14 @@
>   * Copyright (C) 2023-2024, Advanced Micro Devices, Inc.
>   */
>  
> +#include <drm/amdxdna_accel.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_gem_shmem_helper.h>
>  #include <drm/drm_print.h>
> +#include <drm/gpu_scheduler.h>
> +#include <linux/types.h>
>  
> +#include "amdxdna_gem.h"
>  #include "amdxdna_pci_drv.h"
>  
>  static ssize_t vbnv_show(struct device *dev, struct device_attribute *attr, char *buf)
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index 720aab0ed7c4..f00c50461b09 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -5,6 +5,7 @@
>  
>  #include <drm/amdxdna_accel.h>
>  #include <drm/drm_device.h>
> +#include <drm/gpu_scheduler.h>
>  #include <linux/sizes.h>
>  
>  #include "aie2_pci.h"
> diff --git a/drivers/accel/amdxdna/npu2_regs.c b/drivers/accel/amdxdna/npu2_regs.c
> index f3ea18bcf294..00cb381031d2 100644
> --- a/drivers/accel/amdxdna/npu2_regs.c
> +++ b/drivers/accel/amdxdna/npu2_regs.c
> @@ -5,6 +5,7 @@
>  
>  #include <drm/amdxdna_accel.h>
>  #include <drm/drm_device.h>
> +#include <drm/gpu_scheduler.h>
>  #include <linux/sizes.h>
>  
>  #include "aie2_pci.h"
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index db61142f0d4e..b6dae9667cca 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -5,6 +5,7 @@
>  
>  #include <drm/amdxdna_accel.h>
>  #include <drm/drm_device.h>
> +#include <drm/gpu_scheduler.h>
>  #include <linux/sizes.h>
>  
>  #include "aie2_pci.h"
> diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
> index debf4e95b9bb..bed1baf8e160 100644
> --- a/drivers/accel/amdxdna/npu5_regs.c
> +++ b/drivers/accel/amdxdna/npu5_regs.c
> @@ -5,6 +5,7 @@
>  
>  #include <drm/amdxdna_accel.h>
>  #include <drm/drm_device.h>
> +#include <drm/gpu_scheduler.h>
>  #include <linux/sizes.h>
>  
>  #include "aie2_pci.h"
> diff --git a/include/trace/events/amdxdna.h b/include/trace/events/amdxdna.h
> index 33343d8f0622..c6cb2da7b706 100644
> --- a/include/trace/events/amdxdna.h
> +++ b/include/trace/events/amdxdna.h
> @@ -9,8 +9,49 @@
>  #if !defined(_TRACE_AMDXDNA_H) || defined(TRACE_HEADER_MULTI_READ)
>  #define _TRACE_AMDXDNA_H
>  
> +#include <drm/gpu_scheduler.h>
>  #include <linux/tracepoint.h>
>  
> +TRACE_EVENT(amdxdna_debug_point,
> +	    TP_PROTO(const char *name, u64 number, const char *str),
> +
> +	    TP_ARGS(name, number, str),
> +
> +	    TP_STRUCT__entry(__string(name, name)
> +			     __field(u64, number)
> +			     __string(str, str)),
> +
> +	    TP_fast_assign(__assign_str(name);
> +			   __entry->number = number;
> +			   __assign_str(str);),
> +
> +	    TP_printk("%s:%llu %s", __get_str(name), __entry->number,
> +		      __get_str(str))
> +);
> +
> +TRACE_EVENT(xdna_job,
> +	    TP_PROTO(struct drm_sched_job *sched_job, const char *name, const char *str, u64 seq),
> +
> +	    TP_ARGS(sched_job, name, str, seq),
> +
> +	    TP_STRUCT__entry(__string(name, name)
> +			     __string(str, str)
> +			     __field(u64, fence_context)
> +			     __field(u64, fence_seqno)
> +			     __field(u64, seq)),
> +
> +	    TP_fast_assign(__assign_str(name);
> +			   __assign_str(str);
> +			   __entry->fence_context = sched_job->s_fence->finished.context;
> +			   __entry->fence_seqno = sched_job->s_fence->finished.seqno;
> +			   __entry->seq = seq;),
> +
> +	    TP_printk("fence=(context:%llu, seqno:%lld), %s seq#:%lld %s",
> +		      __entry->fence_context, __entry->fence_seqno,
> +		      __get_str(name), __entry->seq,
> +		      __get_str(str))
> +);
> +
>  DECLARE_EVENT_CLASS(xdna_mbox_msg,
>  		    TP_PROTO(char *name, u8 chann_id, u32 opcode, u32 msg_id),
>  
> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
> index e3e78b79a8e7..3e88ed386fac 100644
> --- a/include/uapi/drm/amdxdna_accel.h
> +++ b/include/uapi/drm/amdxdna_accel.h
> @@ -13,9 +13,11 @@
>  extern "C" {
>  #endif
>  
> +#define AMDXDNA_INVALID_CMD_HANDLE	(~0UL)
>  #define AMDXDNA_INVALID_ADDR		(~0UL)
>  #define AMDXDNA_INVALID_CTX_HANDLE	0
>  #define AMDXDNA_INVALID_BO_HANDLE	0
> +#define AMDXDNA_INVALID_FENCE_HANDLE	0
>  
>  enum amdxdna_device_type {
>  	AMDXDNA_DEV_TYPE_UNKNOWN = -1,
> @@ -29,6 +31,7 @@ enum amdxdna_drm_ioctl_id {
>  	DRM_AMDXDNA_CREATE_BO,
>  	DRM_AMDXDNA_GET_BO_INFO,
>  	DRM_AMDXDNA_SYNC_BO,
> +	DRM_AMDXDNA_EXEC_CMD,
>  };
>  
>  /**
> @@ -201,6 +204,37 @@ struct amdxdna_drm_sync_bo {
>  	__u64 size;
>  };
>  
> +enum amdxdna_cmd_type {
> +	AMDXDNA_CMD_SUBMIT_EXEC_BUF = 0,
> +	AMDXDNA_CMD_SUBMIT_DEPENDENCY,
> +	AMDXDNA_CMD_SUBMIT_SIGNAL,
> +};
> +
> +/**
> + * struct amdxdna_drm_exec_cmd - Execute command.
> + * @ext: MBZ.
> + * @ext_flags: MBZ.
> + * @hwctx: Hardware context handle.
> + * @type: One of command type in enum amdxdna_cmd_type.
> + * @cmd_handles: Array of command handles or the command handle itself
> + *               in case of just one.
> + * @args: Array of arguments for all command handles.
> + * @cmd_count: Number of command handles in the cmd_handles array.
> + * @arg_count: Number of arguments in the args array.
> + * @seq: Returned sequence number for this command.
> + */
> +struct amdxdna_drm_exec_cmd {
> +	__u64 ext;
> +	__u64 ext_flags;
> +	__u32 hwctx;
> +	__u32 type;
> +	__u64 cmd_handles;
> +	__u64 args;
> +	__u32 cmd_count;
> +	__u32 arg_count;
> +	__u64 seq;
> +};
> +
>  #define DRM_IOCTL_AMDXDNA_CREATE_HWCTX \
>  	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_CREATE_HWCTX, \
>  		 struct amdxdna_drm_create_hwctx)
> @@ -225,6 +259,10 @@ struct amdxdna_drm_sync_bo {
>  	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_SYNC_BO, \
>  		 struct amdxdna_drm_sync_bo)
>  
> +#define DRM_IOCTL_AMDXDNA_EXEC_CMD \
> +	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDXDNA_EXEC_CMD, \
> +		 struct amdxdna_drm_exec_cmd)
> +
>  #if defined(__cplusplus)
>  } /* extern c end */
>  #endif
> -- 
> 2.34.1
> 
