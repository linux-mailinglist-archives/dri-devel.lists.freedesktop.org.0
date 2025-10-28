Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C50C1693A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:13:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7C610E641;
	Tue, 28 Oct 2025 19:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/PPdBIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BE610E12A;
 Tue, 28 Oct 2025 19:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761678814; x=1793214814;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=niSTwtaZvLRxO66UfGegPvx512QsG1q968Qr5oHRdq8=;
 b=K/PPdBIzR8yhILGwikvQcDWnvdayErTSAizmAc9zkbjFthbAEB/RfEih
 GCZ4gsF3CAidIwXb2Eaum95LBbsakqGUxaYAyulYuL7k3u1N2l4txbRQm
 OaSYlo3ttA/FVPkWpJiIlq76Z65tH7VWZK5BtIiOtRDBIAyP5ldqBrfiM
 4WLjMPluTAnqtQc0VB0Nom5Akty+T+JURyUdkqNOuFg8PReQGuQM7ToM5
 TJpZ9fx73ud4iYjpzBFy8lVYfBfLhKjAeHhy9w8hGGDg5G1X+hTQxyCkC
 8R6jQlR379wezMDJLciwT/PFDvsrGFFW8gZcsWCuwAgE5xU1D0fYcfP84 A==;
X-CSE-ConnectionGUID: qIbZb8zBTfmS7JlU8JTkTw==
X-CSE-MsgGUID: MdTMy2b7S/GXcgUwYtp4tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63940463"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63940463"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:13:34 -0700
X-CSE-ConnectionGUID: kJPc4zCjTTCwMm9679LeUw==
X-CSE-MsgGUID: R1cod2hBRkS16nOc7Dz4/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="216312521"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 12:13:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:13:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 12:13:33 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 12:13:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1BfnoyYlrIVhgNd/rZQBb5kg9KjLR3YN38/pdJfYLw+lD5OgOtgU9CHl3Xhp1NYJt2HQU2v9c0zV1fGktPr1jwZJ8g9duXZjkl6qFzGigZaOIFX8psaH+q3ibT+m6zL7GWsaR/g7Vittf9L1QIW5rn+Qc562ATv7+nTxkjL8hPlU+XPSdWo2YGBb9+wRp+8HnGpbQZAT2QMJ4toF0R6aqL7KEXjb5M40VbaZI5uvFgN3r3gUYG+WyllsYWBBXwtXh477XYndY84CE1nRGK6vtoULGHErqI4MfsKuJwWJE6K5MNfqv9u3HDrluNW2ckc3bej3rDnbHFtpUTwyq8eEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Z6L3m6ScVr2tuN1+L4YFT7yVFDgUAfCQ3FRUrjDPak=;
 b=k53IQtniKwxAXmiANzBfrLs/sM9BoM3x6n1JNXEowDPeDdEG7gmQ3RzQjq2AMHHUCQCIsbFYP4HdzOWZdiU5vsEvoB4oLQCeLOrgll91bSDnVFjzT0hb35+CZKT+dgpj5D+lgJhD2m9wE+N63TLL5uMkTM1itVG9BJVXChu2tOqHZlQU/kYuP7dL2mSKslBYrgmkEbtjmuJpxo8FszeHDE2bJw05LFCOlxoh6RZNSHjcIz3pE1uSHMwSo44jLZdauwuJFTpV9ZOm5/Atv5R3nH17snUIVl2HO8G3bTaoEISlPm+klF9ZP6JgyPOFRn+mzCQnKivhgvzRWc3LKFf5OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB7701.namprd11.prod.outlook.com (2603:10b6:a03:4e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 19:13:25 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.018; Tue, 28 Oct 2025
 19:13:23 +0000
Date: Tue, 28 Oct 2025 15:13:15 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Dave
 Airlie" <airlied@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner <lukas@wunner.de>, "Aravind
 Iddamsetty" <aravind.iddamsetty@linux.intel.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Zack McKevitt
 <zachary.mckevitt@oss.qualcomm.com>, Lukas Wunner <lukas@wunner.de>, "Dave
 Airlie" <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>, "Aravind
 Iddamsetty" <aravind.iddamsetty@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>
Subject: DRM_RAS for CPER Error logging?!
Message-ID: <aQEVy1qjaDCwL_cc@intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250929214415.326414-4-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: d49d6444-ae40-463d-fae2-08de16561068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dBigEUZeleaRjTE1cmJhoNfxKv6nogUB7Cj6abkrobwC/KGxs38fBIBDtBrc?=
 =?us-ascii?Q?KVPrhAGxxh656CxsQYy13fCxsn86f4lF5teVV/PQQPbIdr/qAsoSa53vpH4l?=
 =?us-ascii?Q?Ke7zx2rDM17J/hswwy4vjQS2MFYmx9V5o6y88FCGos9PslffKgZct0zMZqQK?=
 =?us-ascii?Q?OmJOunksHpPsLwk69zZ+DJIXEjQZGMY4KK+oZLkfcohg5xbM2gWq1FaRRB1x?=
 =?us-ascii?Q?WQfodUv5V+3QB5EyBl/WuvUXDkyHZNGko98OMsdusZHbdfcfU3pDupgfnR8Q?=
 =?us-ascii?Q?oTRdoWycUoz+uLVPdLoLHGa78yFEXk+LMjbuVvEMkIWpODECfxIj/2vGf2IQ?=
 =?us-ascii?Q?K9h1ugb3eWluIspWrLIOhro5fkWib8VampQa6CQQi4/5+ZaZF9Rz03epr6+B?=
 =?us-ascii?Q?jvtE/LEjT+RVgUNbyF6wVyoqC5SeVrjp3EmixYEIDb8M6FimMQXYFUwVjxcu?=
 =?us-ascii?Q?B5uL6q3CsWOqQPgwaXoBUYwh2oclKqwjkgtycaxgKDjaj5CGaGrZuQIZwYJa?=
 =?us-ascii?Q?J7hGuRXlbFzbrFwjN6Kc8xFwPTE5iRT+GKwC/EzL+j8ie+lHezoYCXc+5nnJ?=
 =?us-ascii?Q?WhbE5d3TTx/WC9mMN1ytrFc1/zn648yQ0PHsSKYcTVguhwZyWsG33pWCkOnZ?=
 =?us-ascii?Q?cmNGEoGj5jdvAGfuGmtJ7bHxGTGHe+8iDvCE/in9Rr7Okvafb4hAiWYoNQNw?=
 =?us-ascii?Q?YE/AYmnuI8X1xq1FicBveWNmwHm6mNPXulZe+EmBBLobZFl2R0osX3xF/pDw?=
 =?us-ascii?Q?Kov+BS+eqLby4FMIR2sfghk3septodGsnCSd/VM+BF6zTmsvMAfbfdiA9cjm?=
 =?us-ascii?Q?SwCxKrZ+Sq0j4S41pdZX629MzaliYAS1OC5TCBJnb7Uwtb35jFjBoC26q05t?=
 =?us-ascii?Q?xPimENkXr/hZJzjTrwYhKJ+ADxMbGKPys+pHWawoLnIhDE81jrIohwMGfy/c?=
 =?us-ascii?Q?GU/1+FZi7eZpOZnGDrXpJJ8xQ6lQXog1NOUtcNUE8lr6eII9giOqRN6mAzfH?=
 =?us-ascii?Q?ODWtGlwWFJc5ZMLJZqIhUS6T0QIFV8o3sCj/2gHT6Wizqj35TG8e6lCdzBpr?=
 =?us-ascii?Q?HcHePekvdYdCOybMgfa02JlzuD1x8L4B5l2JYx4nXQ9DHUV8FkoUjL9GKdvo?=
 =?us-ascii?Q?8iesSv7vFW6WlVfvAo8BG2/4fKE/LhiYwZY0JGkfHFYT3lAB/EjQSivCj1kM?=
 =?us-ascii?Q?N7c4cMHWS0GLMAW1O1+nkYSr2jtV31nr5hUEY+jaXQ4zqoDYSKlxVUumcmEa?=
 =?us-ascii?Q?Pzv+bltaerRG1aVJfR4XoIoUHRds+Pu1wdlAMqbST3Al0U6BKjCRmhmy9wMP?=
 =?us-ascii?Q?cgBkhFJu2us7t+ZVEbFziDyz99E5YT1MDqkwaHu6aToDrzWoaBuHHBZM8AlV?=
 =?us-ascii?Q?qj1dzJy2S5RUq1ERHmr0n6JZSGO35+t081cJDMINwjYVvlIm6iC8ALWaZyz7?=
 =?us-ascii?Q?V89cSDn43HVp1b+uB9r2BkeWCaURainN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o0Tf/lJWgGOkgVbJC/GmBZlVsvslp1MHPOjOYETNs3/0zJBylwVOPuM0cUuc?=
 =?us-ascii?Q?MamWImhWdkynyOlOniLzOiZfVtutETZuWEeAg7Zm5uX1Fc388e+4ydWGd1Ya?=
 =?us-ascii?Q?YfTNZA7AqFNge3BKDCoULpePBlY2jUqRVXnPNxeSeRoDQhjiv3oGt5EWceVQ?=
 =?us-ascii?Q?cYX8oQFE6J4v0JocZtq2KNnuhgfPCsXO2VPjEhlRIdbO5y5piC7iRc2M7SID?=
 =?us-ascii?Q?kIA83e6SXFW5nABmkAJc8ip7Xp1jOe+enQdKpdx3/CpTFAtg0PMlYfrJft6H?=
 =?us-ascii?Q?Y0jgl73t7XxOq3Fledp6jrVpN1OYcusL0Ojfrkwcft0cqINcwbs5bjjgZJNn?=
 =?us-ascii?Q?aWShvUXmKlhz3wrUJdipuIfkGnF8I4qZ2uCj8amzsN1a8IIHeOol5+xZFxB2?=
 =?us-ascii?Q?P47ta3Ul+YpAX6COGOsuaCKlaTR8ZqZWI+PC/WPneAliS1izLX+YncxO3VcB?=
 =?us-ascii?Q?XpjmLj2QH4+79ENXn/iay770cpfdZN7OhnmtPI5ug+7ThGspD7C68NNaHszu?=
 =?us-ascii?Q?vQHhXMp66O6mvkoBaYkcbyvBDMX9q7wGZtnaHDSBfPYPR8nZ4dQPGD9ldKiZ?=
 =?us-ascii?Q?WYYgptEdmMcxyUhLEadpFqJVIi9cki20+YKQKPu4h498vw7IgUHU6YfJaEbZ?=
 =?us-ascii?Q?ITU6XsZd+vhyzzLxJngvoRZqzeslcGyYFpHXtWAq1VnuxP3KJwIS/F+jJW3p?=
 =?us-ascii?Q?UoxfgmY9kh1JGl20YWNGNoPqXSGh2SnBfjLU7r191pBusIoRJ0F4Cg86weiy?=
 =?us-ascii?Q?S+nXJNQxVLGWxO55nDdLSAPvcnF/LC+BUVqcLVDpwDYjEqMQn+OQSTdtmC2P?=
 =?us-ascii?Q?TShOgNOaG7MF6C+GkGTAHUEnYxxaBDftRZCtShu7v/utn9LQo11D6RsT479+?=
 =?us-ascii?Q?Xd/KkDaj137cw65V+wVPnnAH8N2n+TVE6gYrtLMoTStclpzYPVaORfHP+x9M?=
 =?us-ascii?Q?Z1lPZkdJ5M2uGo2i9zDhmgCPBxiTJ6Lwk7g/JBgDmuHxoDPv3YD2R1sArmtG?=
 =?us-ascii?Q?OYIUe70BNT+pupoogJREOuYJi3JtGyeolXDyRKSRCD3MIHyYYtMrWasF3IyR?=
 =?us-ascii?Q?tAKfkLMzbSi/feH0Norug0F891CeufZSDF8sHBbNOrtrHVSTXjsQ27btdFiY?=
 =?us-ascii?Q?jPOWm5ZpvtbAceL24urMGyNu+b7wOpszb28kSoT3bQPbX+gbtQ+f/gEawdZs?=
 =?us-ascii?Q?i7RGDqJBVrYArsg+VEkOpVGIvL3BBOp3ubuhIeXmCWOUP1DxRBJcSCX5vMsK?=
 =?us-ascii?Q?ostY9/czQILG9e+/r0621QnZX9q5Kg1IIbpZT3pRHh8MSCqnaOiAlN4U3xDw?=
 =?us-ascii?Q?yzQ4FkSs136kbfW+ki27Hf2QpE5Ao36S7xcW/Nlp4jIyRhIVVejfvsoPMek6?=
 =?us-ascii?Q?Q6De+UaA0z3FXXVb4qRSUdLrgol2NcAi7ru7za2sGihq4xxxoE7ULdugGApO?=
 =?us-ascii?Q?go9KNHR6I7rvzmB5g3AWDDJUMze4oia5M7vTIErMWnlMfcG0ybRaNv+FGVIx?=
 =?us-ascii?Q?z4a7YuC1aSO9LIyOfVi89YBO0Ac1XqCV4q5wj8vhhUpgK+ToUgsYKscJzdzT?=
 =?us-ascii?Q?AM19EyNE1qk4DR01VZx7+qK9nRwDNbUR86Svdcvism5dXCzmX6oT4rvLbSF8?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d49d6444-ae40-463d-fae2-08de16561068
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 19:13:23.4167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfJA63d8fK734DcZHc8ZuZQ70GIa6SL0a2NVAmIQ2NYoqnPraKpuUIQhlhCUdok2t9Ejk3Z3J9LTc5JxYuBEVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7701
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

On Mon, Sep 29, 2025 at 05:44:12PM -0400, Rodrigo Vivi wrote:

Hey Dave, Sima, AMD folks, Qualcomm folks,

I have a key question to you below here.

> This work is a continuation of the great work started by Aravind ([1] and [2])
> in order to fulfill the RAS requirements and proposal as previously discussed
> and agreed in the Linux Plumbers accelerator's bof of 2022 [3].
> 
> [1]: https://lore.kernel.org/dri-devel/20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com/
> [2]: https://lore.kernel.org/all/4cbdfcc5-5020-a942-740e-a602d4c00cc2@linux.intel.com/
> [3]: https://airlied.blogspot.com/2022/09/accelerators-bof-outcomes-summary.html
> 
> During the past review round, Lukas pointed out that netlink had evolved
> in parallel during these years and that now, any new usage of netlink families
> would require the usage of the YAML description and scripts.
> 
> With this new requirement in place, the family name is hardcoded in the yaml file,
> so we are forced to have a single family name for the entire drm, and then we now
> we are forced to have a registration.
> 
> So, while doing the registration, we now created the concept of drm-ras-node.
> For now the only node type supported is the agreed error-counter. But that could
> be expanded for other cases like telemetry, requested by Zack for the qualcomm accel
> driver.
> 
> In this first version, only querying counter is supported. But also this is expandable
> to future introduction of multicast notification and also clearing the counters.
> 
> This design with multiple nodes per device is already flexible enough for driver
> to decide if it wants to handle error per device, or per IP block, or per error
> category. I believe this fully attend to the requested AMD feedback in the earlier
> reviews.
> 
> So, my proposal is to start simple with this case as is, and then iterate over
> with the drm-ras in tree so we evolve together according to various driver's RAS
> needs.
> 
> I have provided a documentation and the first Xe implementation of the counter
> as reference.
> 
> Also, it is worth to mention that we have a in-tree pyynl/cli.py tool that entirely
> exercises this new API, hence I hope this can be the reference code for the uAPI
> usage, while we continue with the plan of introducing IGT tests and tools for this
> and adjusting the internal vendor tools to open with open source developments and
> changing them to support these flows.
> 
> Example on MTL:
> 
> $ sudo ./tools/net/ynl/pyynl/cli.py \
>   --spec Documentation/netlink/specs/drm_ras.yaml \
>   --dump list-nodes
> [{'device-name': '00:02.0',
>   'node-id': 0,
>   'node-name': 'non-fatal',
>   'node-type': 'error-counter'},
>  {'device-name': '00:02.0',
>   'node-id': 1,
>   'node-name': 'correctable',
>   'node-type': 'error-counter'}]

As you can see on the drm-ras patch, we now have only a single family called
'drm-ras', with that we have to register entry points, called 'nodes'
and for now only one type is existing: 'error-counter'

As I believe it was agreed in the Linux Plumbers accelerator's bof of 2022 [3].

Zack already indicated that for Qualcomm he doesn't need the error counters,
but another type, perhaps telemetry.

I need your feedback and input on yet another case here that goes side
by side with error-counters: Error logging.

One of the RAS requirements that we have is to emit CPER logs in certain
cases. AMD is currently using debugfs for printing the CPER entries that
accumulates in a ringbuffer. (iiuc).

Some folks are asking us to emit the CPER in the tracefs because
debugfs might not be available in some enterprise production images.

However, there's a concern on the tracefs usage for the error-logging case.
There is no active query path in the tracefs. If user needs to poll for
the latest CPER records it would need to pig-back on some other API
that would force the emit-trace(cper).

I believe that the cleanest way is to have another drm-ras node type
named 'error-logging' with a single operation that is query-logs,
that would be a dump of the available ring-buffer with latest known
cper records. Is this acceptable?

AMD folks, would you consider this to replace the current debugfs you
have?

Please let me know your thoughts.

We won't have an example for now, but it would be something like:

Thanks,
Rodrigo.

$ sudo ./tools/net/ynl/pyynl/cli.py \
  --spec Documentation/netlink/specs/drm_ras.yaml \
  --dump list-nodes
[{'device-name': '00:02.0',
  'node-id': 0,
  'node-name': 'non-fatal',
  'node-type': 'error-counter'},
 {'device-name': '00:02.0',
  'node-id': 1,
  'node-name': 'correctable',
  'node-type': 'error-counter'}
 'device-name': '00:02.0',
  'node-id': 2,
  'node-name': 'non-fatal',
  'node-type': 'error-logging'},
 {'device-name': '00:02.0',
  'node-id': 3,
  'node-name': 'correctable',
  'node-type': 'error-logging'}]

$ sudo ./tools/net/ynl/pyynl/cli.py \
   --spec Documentation/netlink/specs/drm_ras.yaml \
   --dump get-logs --json '{"node-id":3}'
[{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
{'FRU': 'String with device info', 'CPER': !@#$#!@#$},
]

Of course, details of the error-logging fields along with the CPER binary
is yet to be defined.

Oh, and the nodes names and split is device specific. The infra is flexible
enough. Driver can do whatever it makes sense for their device.

Any feedback or comment is really appreciated.

Thanks in advance,
Rodrigo.

> 
> $ sudo ./tools/net/ynl/pyynl/cli.py \
>   --spec Documentation/netlink/specs/drm_ras.yaml \
>   --dump get-error-counters --json '{"node-id":1}'
> [{'error-id': 0, 'error-name': 'GT Error', 'error-value': 0},
>  {'error-id': 4, 'error-name': 'Display Error', 'error-value': 0},
>  {'error-id': 8, 'error-name': 'GSC Error', 'error-value': 0},
>  {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0},
>  {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0},
>  {'error-id': 17, 'error-name': 'CSC Error', 'error-value': 0}]
> 
> $ sudo ./tools/net/ynl/pyynl/cli.py \
>   --spec Documentation/netlink/specs/drm_ras.yaml \
>   --do query-error-counter --json '{"node-id": 0, "error-id": 12}'
> {'error-id': 12, 'error-name': 'SG Unit Error', 'error-value': 0}
> 
> $ sudo ./tools/net/ynl/pyynl/cli.py \
>   --spec Documentation/netlink/specs/drm_ras.yaml \
>   --do query-error-counter --json '{"node-id": 1, "error-id": 16}'
> {'error-id': 16, 'error-name': 'SoC Error', 'error-value': 0}
> 
> Thanks,
> Rodrigo.
> 
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Rodrigo Vivi (2):
>   drm/ras: Introduce the DRM RAS infrastructure over generic netlink
>   drm/xe: Introduce the usage of drm_ras with supported HW errors
> 
>  Documentation/gpu/drm-ras.rst              | 109 +++++++
>  Documentation/netlink/specs/drm_ras.yaml   | 130 ++++++++
>  drivers/gpu/drm/Kconfig                    |   9 +
>  drivers/gpu/drm/Makefile                   |   1 +
>  drivers/gpu/drm/drm_drv.c                  |   6 +
>  drivers/gpu/drm/drm_ras.c                  | 357 +++++++++++++++++++++
>  drivers/gpu/drm/drm_ras_genl_family.c      |  42 +++
>  drivers/gpu/drm/drm_ras_nl.c               |  54 ++++
>  drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  22 ++
>  drivers/gpu/drm/xe/xe_hw_error.c           | 155 ++++++++-
>  include/drm/drm_ras.h                      |  76 +++++
>  include/drm/drm_ras_genl_family.h          |  17 +
>  include/drm/drm_ras_nl.h                   |  24 ++
>  include/uapi/drm/drm_ras.h                 |  49 +++
>  14 files changed, 1049 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/gpu/drm-ras.rst
>  create mode 100644 Documentation/netlink/specs/drm_ras.yaml
>  create mode 100644 drivers/gpu/drm/drm_ras.c
>  create mode 100644 drivers/gpu/drm/drm_ras_genl_family.c
>  create mode 100644 drivers/gpu/drm/drm_ras_nl.c
>  create mode 100644 include/drm/drm_ras.h
>  create mode 100644 include/drm/drm_ras_genl_family.h
>  create mode 100644 include/drm/drm_ras_nl.h
>  create mode 100644 include/uapi/drm/drm_ras.h
> 
> -- 
> 2.51.0
> 
