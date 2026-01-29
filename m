Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNERK72ye2nNHwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 20:19:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60515B3DE9
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 20:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DE310E8BE;
	Thu, 29 Jan 2026 19:19:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j90VFeCJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1E910E2AB;
 Thu, 29 Jan 2026 19:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769714359; x=1801250359;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=YjCmfybuialBryCZF5y4oAAHGWnhXMzSO0TKMpL+zUU=;
 b=j90VFeCJsZqjthPrQuXDBzvVo9xqYxxL46G4VnvzRrwjy9iPbIe86rHQ
 GCSFgjoTGdcs4XLBouBPBW2XEIy+Rtn6FGhxINoSCFCrdVXXZmSoJyKKH
 3n7t6XZjTi/FFcghmfY8GDmcOgApGT+gweHmKKWtiATqNe8c4yewv7aie
 I89JNwlLJzeI1wkvmVdHDhk6Qu97Q64715Lg5sv34lpZA+WVsbfpUutbF
 dwK1eazKJSUeYFvRjpF2kzBK+4eO508o9JFk1iWeNJfssVt8JMXsE3GXW
 Wc6lpX7XfGD/RROiJQwrZafvvl65ecBcKcT+dBijyenM1K3Wk3SpQwZzE w==;
X-CSE-ConnectionGUID: 9QKNSBkzQmKkgbsBfJsNqA==
X-CSE-MsgGUID: 2vCUbcqLRyuuVgB9saPoEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="96428874"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="96428874"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 11:19:19 -0800
X-CSE-ConnectionGUID: oBaes623TVGvLz98jmBjOg==
X-CSE-MsgGUID: 96qvTcEEQ4u8dFK7oke/Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213147863"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 11:19:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 11:19:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 11:19:17 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 11:19:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kq+n2+S+4uaiGh5LOUHloKCyvEuzFilaWvho+sukd5BdIgudB5lLLuBsC517ib3S0nWwqqtwFvPB3W+QfBgxjl6u88H9ZtWvs1/2A74I530opyxgfcfXct3//JYCFwUcKgUW5fLc2HIGOzGNctsFpFizTaiSkfPWhMEHEdlgsl5pISG/sMyAElaJi4nPe9v73SjmgZMUKjA8mLUujT2r4JNDyCGCK4OWz3xsCeCjK3YgO60zz3p2JUZDtXLs+s6aJ3j/LMMTAmgywh6qJb9LUdcaG5GwVm+RUvwYNzsm/EQQDppeNTSBam1jHHNLPZqJ7JsQShPqtfD3VkP4jqQ0Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFoO+cLXv887MYoEToANOWr/A5glySdR86n6wSXDcXA=;
 b=Q5YZHvNuXd1RZ1sO80Hv3YxqVMn35WVa6xQKjXGZChvUQxExuIYHVikB4woiNEyzpLBvJO+o6bcFTnOBFN32Wac3da29xX/02lebU69p9eNWd1bhOg4umAlMTEIzOHCZWkKTXXSGYJaGcmx5AKlZEYv+H+tYZAyFHIYIGPi5x+67XHpwTouDWxukt8d5UQATl4UsadKwe0+n0vFqJSiq+86DsqBWemr94S4O5TQZS1mp+nKL7i7+taSAxXJDbEpfM7Io9EKSfbkQgix+Utj9BNYCLaOAybV+I7s7ku8lbZ/+jYViVzdP+NX3fGnxLez9rZO10c5pLngvZryleEIZ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB5328.namprd11.prod.outlook.com (2603:10b6:5:393::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 29 Jan
 2026 19:19:16 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 19:19:16 +0000
Date: Thu, 29 Jan 2026 14:19:10 -0500
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
Subject: [PULL] drm-xe-next-fixes
Message-ID: <aXuyrtsnlAOmj_OB@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY5PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::37) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB5328:EE_
X-MS-Office365-Filtering-Correlation-Id: 364487ba-d8b3-43e9-507d-08de5f6b4af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jxiaoqxASNJBCKiOVvzvHHHKlic2yk5aEEGtWjubiibTWWPGbeGbpab+Jx5L?=
 =?us-ascii?Q?Fh5KY/MMntb6y9h+R079SBRx+rvbGroX41q3GyrHvci9WbtFIz9OMf0FMU6i?=
 =?us-ascii?Q?JPgpEmhYVPyjzjA5X+18VcGXfXlILezKvqw/myLmz+wlPrDS0IkaMoR+0e6C?=
 =?us-ascii?Q?B4vD8jgSflI/PYW8bitgFctbdLx/Qs20XyNPUdhea/3gcOMjrAjZtI8CtzQy?=
 =?us-ascii?Q?ovZ5AYbd56FotGzh+2q91lduyk83Ynvypr7CtLmcROuhn1pD1JI7F6j5gFdO?=
 =?us-ascii?Q?sbZRRW5Ou8PIG+cA2ro7zWfkKf8wBX+JDxyM5EyFvipGzAVqVwUkUyCk4BcJ?=
 =?us-ascii?Q?smtYHxsQSNCeKGeV3n6K4MyE8e/KEM7DKpJCdnIFn1Uqp0Da8wrOgAwNyVQW?=
 =?us-ascii?Q?HpBGY6+2el6IsXlIJfrGNlxQcmhp3j93v9rtDA9Slnn8/xkuwIG5svl1RWKw?=
 =?us-ascii?Q?SSQSyPLC9I+HPRUU+o+mNC+OKsqFLvwo0W6zuI4//d3O5FbVH0zcer+pIqeJ?=
 =?us-ascii?Q?3aLr8Q7mmB9LcEE2k7R1W79lppJ+9ZKfFC6dJB8l4r1jZDwwOd710CMSrwoE?=
 =?us-ascii?Q?PUTWRSTPb4YDuAGpZSKLEa4NHabsLYxxwkSWF/ac4ICxvpybP11DDBO2QGDU?=
 =?us-ascii?Q?uEr4vHJ10/T0DkZv5c9Fff3WKssrpb7mFBCxFDgA97DrSg9pdA/4Euo6DkcL?=
 =?us-ascii?Q?cAF+9gQoB9gOilebYp456DfTyswhmZkZfsVQP30Nsltj1LlXNiU1Fr5hu+Qq?=
 =?us-ascii?Q?bZ8U54x4ltOQs1q+CyHDcU5beZZil3YxVN95Z0GRKw/J7w6f7T3oF6OIRpf4?=
 =?us-ascii?Q?C18V5Mc0Zg+4A+Q7hNmE7bz5BfC0whx+YfAr421B7RrUukHE2JXgmqzvBPT6?=
 =?us-ascii?Q?Xfc0rIwoctw2jbc7/Sc6F9ctyKI7lhqMnrMajC0j9YLY2dAM7cPi13QOSS1e?=
 =?us-ascii?Q?CRa4PGHUDCqt4aqg7N+Vf6kFyjCy66pyKK97TKyzJFkt8JZKlJnMSydLJCzw?=
 =?us-ascii?Q?UUvHO6PHi5LvPZFrGThFEyKT1sMPKfnMyw8zPWA7HvAjbolgAq62aVMzxgc6?=
 =?us-ascii?Q?rLcuyZV9TcvtKtMP+mbZq6h9l5+GtAKHNklFfCYAecFP601k/r06LCvSP/4/?=
 =?us-ascii?Q?YwXkdKOvzRchu9WZD1ooGfvMNwpUGU5WiGk5zZ6aLgaOuATVrSkMESi9jzK7?=
 =?us-ascii?Q?ru14pCqj48agM2OVeaafUATtugyDUsYGYIZkKPWIpn8t5JZS9CFE03Rm/LRv?=
 =?us-ascii?Q?mYVKoj6WC2Xsfy/OP8VEtLNDEPzOViNhek1YvCJNcn73g3ktBozd0L6hg/bZ?=
 =?us-ascii?Q?J4PVIRe5LYYsxkGrtaAuLLgdzv24eXICga9cYKWtxtLaGWYRUMiUyxnUhD22?=
 =?us-ascii?Q?FEkZwwAdl64DXli9Bg9r+ZD1xAETrZDKID+NUKUSTDtbw1hZk3Npi9e2Cjtu?=
 =?us-ascii?Q?NW52/V47pfPzVacETWhqSHvR+PcahUieDnFJ2s3uWWmue6dNDfFpD7zoLrp5?=
 =?us-ascii?Q?l1n76WXbUEnNjjQqfZO+JWMB1W0ZQdfRcYf9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X5pfdjD3UMkIbqDli7R9aBlXVeFDWwNP/oPsfBJxHg55qWaHqVhfkvuH3LWP?=
 =?us-ascii?Q?lq5N9gBR4PNYhGanxlxzl6lZPp4u3TytmH5w0cmjukWwTZ4zi/fByMDFFV8Q?=
 =?us-ascii?Q?jRec5LlveOB39vG7J9948t8sEaGn2sjWnMSLG+ypjdfgGydF2EdAjjqgf9ZY?=
 =?us-ascii?Q?dH4JlqJRdBrWHPaeyG8QSaRCdXK4Lec+dp5ZGAEz9RDN29po/iZX3Uv1SbPD?=
 =?us-ascii?Q?aX81/nTEMqvM3S6ue3PciNhOPJM+R3oSIDY17X3W2b4uSnGDTniQ/dn6LYJ3?=
 =?us-ascii?Q?J35+Eo1eXR3oN5A81U5d+HsdiV3iwNmGZ2B7WzrruGjQd0iL9NYmjz1wj/+3?=
 =?us-ascii?Q?iCr0YpCoRG9efYXnbnerf7yqDF/DNAs5r7QoLctNnFG7hMACUCx38ge4oQnu?=
 =?us-ascii?Q?7oEyPv8z0vYUeqbOlLzqOW54Aeb0x7tEqIGyBDB8OqFy4xteyltjsa0WeCuc?=
 =?us-ascii?Q?G0twWpPReFeFuq49/RfsEMHiXD31On1lUqU96z3CAcDWCKEq72eb/I6tNy5m?=
 =?us-ascii?Q?vonSJ7V2m68SqzXLHVhf0fokxIplBsHTKelJEhN7VPfR7eBE2NDHDP+NGox0?=
 =?us-ascii?Q?gHbWWFngz8kdydjEWyeK09WlrVZMbLtMrSRT+/o/I0ZcT1/A/xtJ8BsaNe+o?=
 =?us-ascii?Q?yK5KyzCBgqbEdXi4fSPauHmsZCPFvQNs9S5Zlx+4nOxF3rX0YAkZH8BpIKU4?=
 =?us-ascii?Q?L1kGm72IXdm/nievgoUMIjyG8GfvoWNth4CgPZKyFln20FSdy1DkW9zucmhb?=
 =?us-ascii?Q?EmEwI1MwXL7fnQRr7ccKunkIgjSBiliHXPyRmrzoZN46d5S/oClIaDDbwkBE?=
 =?us-ascii?Q?GDs4UOacjGkNnlTOyNpYmdPG639HgLVn94JwgpUI+c9IqFDELLtKcBs8lHe6?=
 =?us-ascii?Q?wMpsvXm6kdHzgQ+EB3DbFmlcVcc4w+0llMsPpGAiyocm3Wqe2XnRnrtQTRhO?=
 =?us-ascii?Q?qILRFScG7pMqK0cuBdET87MeVUkCSc/I+xBb+izWXAgs5zIgM4aRezIwvqba?=
 =?us-ascii?Q?rLw4Cd4YLr56Sj01Soq0OFnDoGUF7d5n3Rn8nZGw71a2FcOzoC8WvbIlgShI?=
 =?us-ascii?Q?YRK1oX9iHvvM/sjk2+YeCy9JqTHf/YEcNgPyl2TTTYaBjIafkbQWbQUqTY3D?=
 =?us-ascii?Q?Yelq7BeQ0gTCKl6BlmupG+elP6NCA35Oea4Nj3iFMg3NmAJq+HU633C8umij?=
 =?us-ascii?Q?j99zYC6sRuDDGPoAvHmYNPCH+yAyV4zxTYSygjg3W8jQ7/MmOTfwBowLKeLr?=
 =?us-ascii?Q?bZnaTlUQ6H6DJo9tz+bTecGEjgZWnbf21JV4c1n62CBLhUQ7qIpd+bh2xQdB?=
 =?us-ascii?Q?lXXVg8+OfRYaHs40pk9fM5H3hHRPcjGOIGesNOmIyTZYQq7jsJpsnR9AWSAz?=
 =?us-ascii?Q?XPz8MLsWXGjg2L6ZUNuMSL98PL1IfsM64X7zTimodKJ3UoPN2PQQDUdpUBq8?=
 =?us-ascii?Q?4oyGEBbRdYhrG5sFvqPiKARq+ZmjqA5q8iUtPVEvrAHWaqowDy4nZCQoOlvR?=
 =?us-ascii?Q?SmWxfc1mKRX7XfsoZSaQzoEATmb4Ne11W/N2sKynR9ESF+3pAqdocTQOElzb?=
 =?us-ascii?Q?JtnTS0NqsZETH1Rx+xYyAIkQM9KLH/RB1Edy0nFfVmKggVA/dkAMbull6xpq?=
 =?us-ascii?Q?vbwB261VokiDKonIUQvVpGn+/A1lV+X+JDbs+lADs3/kd82/VpFumDWUuivz?=
 =?us-ascii?Q?RHG1mza8FbtdFP8qSTySh5raxEV7jeuHf2irl870mI3K9kDJ82OL/8t028BQ?=
 =?us-ascii?Q?RmlnmDwyLw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 364487ba-d8b3-43e9-507d-08de5f6b4af0
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 19:19:16.0246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KDlFTBmjzj7GLxS1Kp4MtgByKJSyvXtBg/ele9N+XGlEXhEqbKPmn7EK9hJWRcQBMUjOLN9OkYxXSLGhV4ZtJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5328
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url];
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
X-Rspamd-Queue-Id: 60515B3DE9
X-Rspamd-Action: no action

Hi Dave and Sima,

Here goes our first round of xe-fixes.

Thanks,
Rodrigo.

drm-xe-next-fixes-2026-01-29:
- Reduce LRC timestamp stuck message on VFs to notice (Brost)
- Disable GuC Power DCC strategy on PTL (Vinay)
- Unregister drm device on probe error (Lin)
The following changes since commit b2c6627e406d00bc53903ff6204aabb0c6a22b1a:

  Merge tag 'drm-misc-next-2026-01-22' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next (2026-01-23 12:45:15 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-fixes-2026-01-29

for you to fetch changes up to 96c2c72b817d70e8d110e78b0162e044a0c41f9f:

  drm/xe: Unregister drm device on probe error (2026-01-27 11:40:20 -0500)

----------------------------------------------------------------
- Reduce LRC timestamp stuck message on VFs to notice (Brost)
- Disable GuC Power DCC strategy on PTL (Vinay)
- Unregister drm device on probe error (Lin)

----------------------------------------------------------------
Matthew Brost (1):
      drm/xe: Reduce LRC timestamp stuck message on VFs to notice

Shuicheng Lin (1):
      drm/xe: Unregister drm device on probe error

Vinay Belgaumkar (1):
      drm/xe/ptl: Disable DCC on PTL

 drivers/gpu/drm/xe/xe_device.c     |  1 +
 drivers/gpu/drm/xe/xe_guc_pc.c     | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_submit.c | 11 ++++++++---
 3 files changed, 43 insertions(+), 3 deletions(-)
