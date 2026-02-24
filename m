Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPZYJDEwnmk/UAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 00:11:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CF418E18B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 00:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9483010E33E;
	Tue, 24 Feb 2026 23:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJnLDOxm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA1F10E33E
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 23:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771974700; x=1803510700;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U3hm49jlhcw0s241b2fOSZvfwDpYmx7+6tXDtCp90X4=;
 b=eJnLDOxm2wqKboZCKkP/SyxlT31pFy0aOFtq+ZFTWbj63HiN24kT0SEv
 MQfk1re1eUVPyvXV34KlHWL8jBDfqqdSsajNuLWUEDl3U73XTFTQ9As8Z
 pqaiQRAUEqDS8mCeXlfou/bPRw/KFmxYo31EiuMcPYiJ2bgzUPBnbZjlb
 ELTB+ChRhl7WUicMlUMBzyuTc991rrB05tIKtvwa8H8se7Ei1ys+aIsHG
 SfhAMCe44Wg6UbDhHV4FXFHa6A9xrgx1p1g9SH7GLZ7NbhhJ+VXsLYEVG
 bLkQYmhvhvHwnXwjk8EPtBJycluxbfFu0BhpOVaun7tR8iRdTyyj3W4ne w==;
X-CSE-ConnectionGUID: MjVSZoNUQaiG4FqGX/L98A==
X-CSE-MsgGUID: K1yPWTS5Q5eyVAd2S6ZSfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83629068"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="83629068"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 15:11:40 -0800
X-CSE-ConnectionGUID: JTBNk3jcQAGyoRW3b44qaQ==
X-CSE-MsgGUID: Fh1d/mmaSDOA25k1fBPlkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="216193382"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 15:11:39 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 15:11:39 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 15:11:38 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.25) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 15:11:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q65rQ9hqiK+lbLyiQeSi0EL3CArLwAnYndHq6K8CL3e+oGUjBR35mtTCD41zezpKmwP+kV3kP0Zca4Q26KBWzDbj4+dMyhdAQk4qDqjZU7WFlpdAPUFmRY4fRdi33AzBbiYmUs4I9OxlJDA4WliafXZt+BaKdBhubpjlpboPq9OHv7qdCEcjOtIgIsFqba1rUJCWZvSGoWhxazS19C8QzJT+ZCsMf862uu6H/oDnSCq1ITOGPSoEkhBT6lbSxo8UMrueFK4bYftd7yQ0eZiRIyTaN3A345/vo+hvVPYgoPx712XJUtopE1ZyqHgJM3FUWrSaGB+/EixKGGubiksdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nef0WyuYFgVPrDn/d8TTWhod589bVGoN4NmOSh52nG4=;
 b=zGw7hZWJURTjBgqmKk3VwrYiMAMDouRQh5FXHs5SgSGdkOKdUQNBMtJO9xiW3l4w1sWyP1niH9alO8QO2klMmcwVuzAsuBnff+UM6bm7ONKn0PJoYnSsfCxUMnp+HzfvbFa6qHbdoP2UL0bsbfU7MfVr0k11irxSIzA8dOqNnbfSBYIOydwgQqOOdsQifvgIxye1ci94i40IKeUp31dPIFH/LNO6WF6PJgyNHFP4E10gRM7Tzb/+pI8mHeA83/+X2BxuLsDGNAvebsBzLOlJqDC7ym9ydFAkr/KI4t/bLs7rWFzz/jZLtkaNBm2g8y3mVmvPb83jHJyV3ENXSrq3FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 23:11:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 23:11:37 +0000
Date: Tue, 24 Feb 2026 15:11:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2] drm/pagemap_util: Ensure proper cache lock management
 on free
Message-ID: <aZ4wJle/SaHCpj5A@lstrano-desk.jf.intel.com>
References: <20260224154832.7249-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260224154832.7249-2-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:303:2b::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: c774b7a7-7506-451c-978c-08de73fa0f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OS/EJ8gvU0NGM0H7luKOa/l4cg2HLtNpneCEH78YjSfb2Fw8orHUPme3lfO0?=
 =?us-ascii?Q?ViVeQAp8XMWwNpqapY0L2gfy1UA6lR8DwV8j66boc9DzsM7o9anGGHw94tJs?=
 =?us-ascii?Q?4yEBdw0VoHgxU4AP/D7mtcAfuJI0ano6exeF0MCrssKNgdehoP4jab/S3u4d?=
 =?us-ascii?Q?1QApLmHqgl++g1qT6OsnZ2vszG2JNcz9yfMKlUEwl784P/xSgArX26QHtl0y?=
 =?us-ascii?Q?NU/sNl3CFaGm60UNWdyDdVtD6j5ajgpf/OGi/uQ2M0qivSQAvTQ+y4rt8nOv?=
 =?us-ascii?Q?RW1o9zIiAASyx1pjEyTktfNVIjyB9Xq0NDqJc0/SmX1PxcZUBHS4FU8DghdX?=
 =?us-ascii?Q?wcZspJ9KabDIUBKnSzOPJgVav1ZZ1VvFLGnmBh+utOyBbo9pj0mIzTt6NMD9?=
 =?us-ascii?Q?xXzu0aa4GyLxG1oFwSZg8UFVV6xJvqQ2GGi3ddlOwnucKBT+4bYVmNWmp6R0?=
 =?us-ascii?Q?aeeyIbOK2unAQCNOidxYamewZDq4Lk7xRDAUmg0nIWSkT2T/Mfpz/YeiXGH+?=
 =?us-ascii?Q?/Jl1D5g2p8rwEJzJFCrlIM/WirMbifFp3T/ontmlgkdVNnWypru2QmSxKsDP?=
 =?us-ascii?Q?y8y6X8X7jH/VHqcDaT3xDetgVY0/u388Rq5okn6WhNFWS0E0pv99l4ifbfIP?=
 =?us-ascii?Q?reg1Kkji09va3ECGVrstPEk+MGRk5cvgLwy3IiZVoQtFl6p3PbWZcgsXllll?=
 =?us-ascii?Q?3XLbbKfCxWa31JHLa5JCwfB8a7DdIwD/zwDXXyM4FhGKzr2hO0Y3w93dUrie?=
 =?us-ascii?Q?nZ5CrsCtkqVH5q8iamlsS73owNJ+vTGS8X+Fj/fAE7e8B+zruTbe0eSriPmX?=
 =?us-ascii?Q?nF0inci/ci/pTHIGDlldLha31/0U4FnUCnBiiwBRdAOpnqTZpeLQwJEjHkD4?=
 =?us-ascii?Q?NHEkAKEp216fnDddr3FBKtq85P2wVaOQdmUYv3UyuZ+3n+/MqJFGxRBzmYpI?=
 =?us-ascii?Q?CJWEKvnBeEwWV2WGo4bbodIQJ8j2Uxi8Q57iF1sNXEwNykjySqsISpfrWlR3?=
 =?us-ascii?Q?udNId3qebfPKdt4aMgGbSor4lToxA+pK1JR24JMJGCBnIBg0lfYegDyHkVqW?=
 =?us-ascii?Q?V+Y51Y7y1At8mEY15Zq9obCSPIP2hDqSGt9MwdBkK0nYn/3Ot2v5so6Dd7Pb?=
 =?us-ascii?Q?QTfKEuAGGii37oWH9DWdteF8CXjZxdB3W/h0OIDF63yQ5arZ+CzjQPkbytGE?=
 =?us-ascii?Q?5iqVwD8BpVSZb9B3So7ca8rodXbc9YbNJ7XKxYJHfnVwbNgS+zbwOaDB/Wv7?=
 =?us-ascii?Q?tFosyLMvUS4ueBiiwSxmbVYnRLvtNGuOBdUXtyjWK+6w/k6f94XnERalVbyt?=
 =?us-ascii?Q?z7ALU9v0lODPC6OH9cJkUPEqMzHHcq+DgoyUPbq2sosLBhFJP1Via5DQfnIO?=
 =?us-ascii?Q?DKFW0oWXxrT2VrNcMAvpzNjpmthRZR97efy/758Mwitg1k/ULw+F3GHkSmJR?=
 =?us-ascii?Q?xsXfo4yf5LpHZKI8dkn/yilrkDEFUdBQzKKcVybdNxwMWzxByWEhz3cSBchm?=
 =?us-ascii?Q?wsLqWlRTJ+5qSCcQNmOjjwa+85MJCSHm8C8jarOvZwCI6VvoxTJ8he3Bjlpx?=
 =?us-ascii?Q?3nnMknO32SDW/JQSk6s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UUXeAGHcKQ/QLWDikG0hCkRpL536zrqg/wXBUClo9YeGiZdK2FJ73eUz415B?=
 =?us-ascii?Q?8R2LkJu5UXpfHcGW+iHVXg0IUOIvC60wlJexzgIicxNpUAh47b1pG1hywhGR?=
 =?us-ascii?Q?BHumhM/lEDWY07R2d/hu9Xt5TK07/F8Tq5oeedHjqee0qPY+Q/uwaPedb/PV?=
 =?us-ascii?Q?Dm1SMQ7WSMKQ7zaMGSJJiQZvjO2FSvYvVjKXUdD0r3h67yKwHAZ0vCDrT7iw?=
 =?us-ascii?Q?qMMkTqVoaABovnbW61mTlQelv+aEqSNg9KMj49OnG0E4vBjF1pelwg04j6AM?=
 =?us-ascii?Q?ik0rTl202FuLOI5p/4Zf0vz/PouSHDP1/sqtHqBxjrOvpTe6+CmLs9FKdjaw?=
 =?us-ascii?Q?TwUT5SFwHrHBGJdmyjGS52vn8Su8aGhroEMCe+5n+ET0+r4+FCWxENhgiHO0?=
 =?us-ascii?Q?RWL2HPolIQHUkg9Yvl1j+szMe+JT7HRN/MQlF2/R23D9ZN0WVUTKzcGxxRK1?=
 =?us-ascii?Q?mHLBpmT9NrRO4jTcIZMH8ACJ0/cPSe3GTw7oMYt8HrW4lG5cmORS36sdNKtE?=
 =?us-ascii?Q?NEyAInO2i0RSpHbNUZfLxhIrYQshM0ibnYJ6zhGSZg+fItAVTlfXBsnHC9vN?=
 =?us-ascii?Q?DPB5emv2Q6aEDO0qspIKtJ2f2Rgo++u6Tgbwzm5/krjm/B1w78sfFrQqvW/Z?=
 =?us-ascii?Q?B3wEG3qYva1NczScZPpZqE0S9z/nX+5/CfkippH7HOjaE/DsC3+KE53qIvlI?=
 =?us-ascii?Q?O1vVR6Yefea7mb1gHGSlJAKsWEEuNH2Mb16LH0DpGKMczCH0X/s6m251gjPD?=
 =?us-ascii?Q?0zjxCHCUKIRrOiaiCW2qEqlDK0wJM9Yj683ZnEN0KJipz5/1u80HYiVNG5m+?=
 =?us-ascii?Q?yF2nk/W7PkVUuM0L0hguORL83/0H5gwv2Ogen2Q74VnhXE4z80wVKR8RGUyG?=
 =?us-ascii?Q?DiQpeC3Zqa8f7lTNIUf9n2pkBrPBtDV402e7kPimqSOv4mplhrk7ZmWx88BC?=
 =?us-ascii?Q?96lMGv3ffuRCRmVxT9lMcQiVRHeDJeUBDu2OGIyk28cMZ3iVnLP5xc8j72Ub?=
 =?us-ascii?Q?AiwgkO+DBKBvPFomPSuYPfTh2yEVGkCXKLcWFInJYVXjx4jXJtdSwL7cbebS?=
 =?us-ascii?Q?pgufHcEwgoju5KWjhSEp9YBarrwby+9yPhzfa6LqeJza32LQ9dUwGjJNXYRe?=
 =?us-ascii?Q?TyrSgSCOaHkQnEyuE0OOOP/wQ/8qnwh6pZ8u/eozhpfq4ymxb4lDWbuTxREl?=
 =?us-ascii?Q?yC1SfKhBE9M7bZ4uV7AYL23eoFRm9IC/yau7NOHhkRidSQbj1IIlcUf3BQId?=
 =?us-ascii?Q?bc3GtojJIqhtRZzY5KjJr5c8GBmJE0zlhEB/+Dxr9RTL30WcRG/ou3Wej5tn?=
 =?us-ascii?Q?Ov5t1+mJsD+VNfVmoF5M1f2h4f5qCdoSrRf4GfvupsJU2krmiQ7BjJNL+PNK?=
 =?us-ascii?Q?g51oflzcJYzKKq/IagZ4q2pegv+BPzgMOsHRmGSHJENU+XUYaOdYWhR+hkyZ?=
 =?us-ascii?Q?oCH9VieMhzA9efPy+FBEFd4W3lR7m8eMyNxHbMi8okbW7ok0aqa5l+iEV8rC?=
 =?us-ascii?Q?1QZiTYIJ5QBehBjm/Rwv7KChLQrdnyupJcS3GWXBlzhI7BJ+ekfAeSiHCWcK?=
 =?us-ascii?Q?xNDVXd30n3668SjGwTkiv1LLMVpHsmiOvxIH4mRbdT8QmjL7Gxz4UM5zU783?=
 =?us-ascii?Q?sXJCyrOOoOM9/NhDcFKUBmTzKinJ+xfzoFbNKeQHPe7TbHu/PlvAq9PaR5f/?=
 =?us-ascii?Q?igwaWYL+5DY+4lyix+L9asvlqG+JXyxG+yClphLab9mRrIHU3bbsEwN1hif0?=
 =?us-ascii?Q?oaDafxNR374iX48mlr+0ecZE6msB1RE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c774b7a7-7506-451c-978c-08de73fa0f46
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 23:11:36.9751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaA+l6QB3h83CriQlwOFne+WpPxqeZsfDpor+AGLPMFimberj/56TV+oG1pZw0XVkvEDSZ2zbSk8znp93Pvtkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,lstrano-desk.jf.intel.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jonathan.cavitt@intel.com,m:saurabhg.gupta@intel.com,m:alex.zuo@intel.com,m:thomas.hellstrom@linux.intel.com,m:maarten.lankhorst@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 97CF418E18B
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 03:48:33PM +0000, Jonathan Cavitt wrote:
> Static analysis issue:
> 
> Though probably unnecessary given the cache is being freed at this step,
> for the sake of consistency, ensure that the cache lock is always
> unlocked after drm_pagemap_cache_fini.
> 
> v2:
> - Use requested code flow (Maarten)
> 
> Fixes: 77f14f2f2d73f ("drm/pagemap: Add a drm_pagemap cache and shrinker")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap_util.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap_util.c b/drivers/gpu/drm/drm_pagemap_util.c
> index 14ddb948a32e..66203a19f8f6 100644
> --- a/drivers/gpu/drm/drm_pagemap_util.c
> +++ b/drivers/gpu/drm/drm_pagemap_util.c
> @@ -65,18 +65,13 @@ static void drm_pagemap_cache_fini(void *arg)
>  	drm_dbg(cache->shrinker->drm, "Destroying dpagemap cache.\n");
>  	spin_lock(&cache->lock);
>  	dpagemap = cache->dpagemap;
> -	if (!dpagemap) {
> -		spin_unlock(&cache->lock);
> -		goto out;
> -	}
> +	if (dpagemap && !drm_pagemap_shrinker_cancel(dpagemap))
> +		dpagemap = NULL;
> +	spin_unlock(&cache->lock);
>  
> -	if (drm_pagemap_shrinker_cancel(dpagemap)) {
> -		cache->dpagemap = NULL;
> -		spin_unlock(&cache->lock);
> +	if (dpagemap)
>  		drm_pagemap_destroy(dpagemap, false);

The logic is different here as 'cache->dpagemap' never gets set to NULL
under cache->lock when drm_pagemap_shrinker_cancel returns true.

Also be sure to include intel-xe list for CI too.

Matt

> -	}
>  
> -out:
>  	mutex_destroy(&cache->lookup_mutex);
>  	kfree(cache);
>  }
> -- 
> 2.43.0
> 
