Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFj5N8nrmGkKOQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 00:18:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27C616B5E1
	for <lists+dri-devel@lfdr.de>; Sat, 21 Feb 2026 00:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A77C10E08C;
	Fri, 20 Feb 2026 23:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBNqDgak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5711410E854;
 Fri, 20 Feb 2026 23:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771629508; x=1803165508;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7Ma/NPOlvv8rBqXRRrQczmDxwsX/50CLqhwwFZsAyFk=;
 b=BBNqDgaknxCTATIeWtQwSsek7L5br4r29sde0H0gMSn/0aUBPcrPO+f0
 OePU43fCtJDcAeMezYGEfN7jAB4E7qFZ5n19FA1uu7aF0MBD4v2VNpQrh
 0L4rbiPLc/8B/V5t4tgFv9vOS/9fIme7JvaaJYtWFUuwFhxRIv/VUy4/q
 dpAp4oAwYHwZBuXZScw3aZqgkbGSWxKtFLFgBtDR45R5HA219yEyZpJKY
 MAb7jBk5EJDxy1cGxqWn5TbSj8xTzM5se/jnu8YjvQECByFEUmdzfSkgN
 ldv4yzN1aSOSbNLGRZ5LWEgyzAe3Nnt2LkK+VEX1EATTeNU8XJq81gLde Q==;
X-CSE-ConnectionGUID: jGG8F1VlSoa19oFNA3AZwQ==
X-CSE-MsgGUID: Jm0OUxXERieebxfw+THEgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84178204"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="84178204"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 15:18:28 -0800
X-CSE-ConnectionGUID: zXOCja9eTEKxmcYLtwSksA==
X-CSE-MsgGUID: xNC3s9fETligLRQ30tzghA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252671066"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 15:18:27 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 15:18:26 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 15:18:26 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 15:18:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUhJajd5VS/AddJxHisdo1B3L31DemFi5FoUYj8wnkv/QzmwcCkVP2S36fjpqGXvrO48ZZeTJxsKxhfm42w0JsZKuyW0HZel1qgPP/RmWZYG7lfUy124PM7STLHvG/yRmkCHO88f1ApHZtTvEurHKWqd+Ktt2YZjsER4mN9+62Y+cJNS6by/3KgVQSqMbmUh6Tk1zcV7tY6QOVJX8K5ksCORPlfoKQ1vPpHx4edJ5EQmvBTlcWb0Rq5Nkhf/OGIQicsldn7GiLIhhXxziAlz3UCuPblrzmqsdc00RORL3gi3HGb5x8BPbfLz+IzqZwq7dbo7X+bC6XxSi0uIoThgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDq6IAOYfvBXZTNykNKnJmgzLgPBtAe8HGUo2eWGoP8=;
 b=vBLhxnwVGOWzCxyx5oBQ/lEN6HJDsSV0sqOmJX4FXFpZ/sl1gM9LROmdb9ZClUtdbFqEYD3L0MFnJ2gYIaxixfC2qoJb0VNe3DU+vud9Ikd0gVlVO0sAEATgVqlyaXRkgCEa/bD9blLwGk3SptaegBwH8abcoV+QkCee3JJI9IOJOV6/Ci2J659J4L4kHed5+NJ+ddkellkHNo7fRgI1lrFhHuQDjikK+t/r/sgWRRe+U9smIbyR7HNTX+r+Nkx1vF9zAjypk7/FEMXwIt3e+pCS349jPBVlfRmgX5LENXwen8gyN1EHViPwBsm+df9el98o1pPvDcom0RtGS5Lpag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF97652A3E1.namprd11.prod.outlook.com (2603:10b6:518:1::d3a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 20 Feb
 2026 23:18:24 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 23:18:24 +0000
Date: Fri, 20 Feb 2026 15:18:21 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <joonas.lahtinen@linux.intel.com>,
 <jianxun.zhang@intel.com>, <shuicheng.lin@intel.com>,
 <dri-devel@lists.freedesktop.org>, <Michal.Wajdeczko@intel.com>,
 <michal.mrozek@intel.com>, <raag.jadav@intel.com>, <ivan.briano@intel.com>,
 <matthew.auld@intel.com>, <dafna.hirschfeld@intel.com>
Subject: Re: [PATCH v34 4/6] drm/xe/uapi: Define drm_xe_vm_get_property
Message-ID: <aZjrvYXrR/dXpNbY@lstrano-desk.jf.intel.com>
References: <20260213223410.99613-8-jonathan.cavitt@intel.com>
 <20260213223410.99613-12-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260213223410.99613-12-jonathan.cavitt@intel.com>
X-ClientProxiedBy: MW4PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:303:8f::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF97652A3E1:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a210b6-763a-4304-1f4b-08de70d6584a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KjtV9QFogFvXudztE5bTSS07W3zYSF/vsww6+jnLncp/mA9TRdlINmGFClUT?=
 =?us-ascii?Q?OM6adDC4tb0fTSnY2Gsw2YLKdsTMbbpubeBFlzlxh0wpfr8b3qqyymi22UKF?=
 =?us-ascii?Q?H6mZcEfN6s8CszQL/bjlaUFbKjnAflj3c+p3W6CfV20EJqDw+O4uevoYuZgW?=
 =?us-ascii?Q?SQD+54jkdtGHVIR7sQNcOtKb5N7iC/B3g7K9VfIi20X2RFqDshOTONZtC+74?=
 =?us-ascii?Q?qmFBuMuo4d2iiFBLm2cyqEhFbzCDaaUF+mZrhOo5t/NfN9/SkJDnPPyTwTSu?=
 =?us-ascii?Q?UNLYAZrKDuHrjzwVvDbwAOwExiIIVnqpDv1wrCzedQrnujmx85QgX5B93ChR?=
 =?us-ascii?Q?AROzRt9GT/e3w4GxPP7PXaJpOD8M93P/2A38bIViwzpwrAQ5xztKmq2AAcy1?=
 =?us-ascii?Q?rxF3QSYx1TDS0iGljFWIevfuoOobNwNFWc04PrBoY+sk1bYWdvd+Cl0liiRI?=
 =?us-ascii?Q?EVVfKKwCU/lACs3ZTFMYU39SX72zu4kktxhW8BkcNM93Xu4oGlYple+TaYMV?=
 =?us-ascii?Q?GQC01ctvB0nLftd8+AhUrHWDMG1T/PyTIiPe6lKdWD0RX1kTeEf1VHJ/Qda4?=
 =?us-ascii?Q?8PQZBUeFvbUGw3NI4gxCPp09rQ2b41SHzzh5scBK3CMx59wYcknZfAE+Dgjo?=
 =?us-ascii?Q?sgatjNJmAbTeBtm+fwoV/RXs8Ln5AF2bFUC5mOIbgJe4H52G7q8p+TYoQH9K?=
 =?us-ascii?Q?WYsTg6GK0HpN1G6da+qIRKhc/VEwVsTad9l0quMwH++vzf/8NP/GtdZLluPi?=
 =?us-ascii?Q?Fa3kCDOUugCbCtKXvqDNxbBUwexKUKE+sWTW7hoDvvzY6K2jKY+4zbXpATy5?=
 =?us-ascii?Q?ku/Uy55Ui6NRoYwOX6D76EmhLxjGoPCi6v2HdYaVoyU3Btv8iKSRlzw84IjL?=
 =?us-ascii?Q?fq7T3T0FeM5Jvy/JcAO5PMBVh5ubabwGHg9r9L0BbsGZFnZXV8uQ80j8jxtT?=
 =?us-ascii?Q?J0s0z9js6Yz3dbetC+QkcX2dMs8j0OVGVm2MUXumzTQ60XN01YGWH1tfBsdp?=
 =?us-ascii?Q?l2+kpf11BFI97eXvfDaOZFKMLAe1CllT47Cyxr0Lg9STk4x6TeMdCj4UQSHB?=
 =?us-ascii?Q?kD3EY/EyN2dpoRyvEw1Ry33YXaRpFQ2n1kFhhYN6aqZZn65+StqiwuEHU/dN?=
 =?us-ascii?Q?dHkrLOn1MbNnfckrLb7pi0QCeSWjT9UiuGKBz6v8hTvleBD0rhPROoj6otgQ?=
 =?us-ascii?Q?UT3aSzqUU0eQbZOfQ2+57TipqRMeUaiAOfgvFsZnH367l3gLzBHL9/5yiqpi?=
 =?us-ascii?Q?tvLt3BLJMzgIeSj+/aisjrCyw5IFUQMmOjZiJ4uOEADApIH2/5PbiZPdO1AX?=
 =?us-ascii?Q?3Q6S0R1jEbNpfqxLaR2DpFcSz37v1q7f0e2YfBzzAK4B3s1XZ3/sHbrlgwq4?=
 =?us-ascii?Q?GzcodY+vVDCYQNQG1ug+sCrEuJ0jPT+mLowlv8QKq7ZfUiZT/sUGhisYMqxp?=
 =?us-ascii?Q?U0oy2EfkCjPooQSK9K0hL9bHYUOyGo2p/JyERd1AtZVtyLC+fQInUcrZ2Bud?=
 =?us-ascii?Q?Lr0bbfiNItXDKAumxijvcxoYR3zu81uPpdnTvGJqCOGz5IPvhMFSXthSDewJ?=
 =?us-ascii?Q?+ijbDfnz7hWRHoWexO+vCCuVszuaTikvtg+Gs9ys?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1kdnMfA97yFqfzC0b2LAz0fHbRbvg5hcQgQ8GBENPy72hC9teS3aDdxT94jZ?=
 =?us-ascii?Q?TC/PWr8bg/vQREFcHr01DDc/t3nG032AG9SZPJysuZrrlTGorSer7Pye8eq5?=
 =?us-ascii?Q?RAQ75ntwPK2a4id2eOtsXTO0cbSNgsIldqRHshtVIIOo7FlktXn/AAFxaYip?=
 =?us-ascii?Q?1jhwYNKghHLEqT598PUCeGNKRjRVJPRYL175tHrF1zUkFHjPKzjJSPh8fg1C?=
 =?us-ascii?Q?hhggi+RxbPmpayLm+S1cCWH/c5w3chLekdfK93DvcLALt0OKm27R16VOMxoH?=
 =?us-ascii?Q?UdmKju1bQypqFD/4aSM260nmsscOBRu/ROk5UAD/e8Xt8MN2x0cGttl4xHSa?=
 =?us-ascii?Q?XuOKnvJofe/nXLmcS+MdbnBqFARYBXKL17FYBK2NOodcpkiA/JonOBhP0Sgj?=
 =?us-ascii?Q?8CjkosVs+FwtBDhlMGMyRfcwEhyy81fEsLmtLa176ZFapcVPEIq7Znxf2CNR?=
 =?us-ascii?Q?LBGXwS+2iaOkKRtEu40MQ0LtMRpxCsgp3WzY5f+tgsuw4qgxPfMXgkSCcDPu?=
 =?us-ascii?Q?KZJWCzrtt5Oqdu1XCArUhq6ds9Jwhv5zezS8K1srdXLbV5TVT/qI3xExOkHl?=
 =?us-ascii?Q?SHpADQ8U/KXWK6aobeB8V8GfPN62HRdwDeThIzINMiysjYradN1uJEdyGcPW?=
 =?us-ascii?Q?AvZ2FI6b3F8q1VI5HQadchoFXj5P7fIIVYc/GPT6/FIkgVSA6zHz5DJW6YmH?=
 =?us-ascii?Q?valyB6uwsgz86a71cWeOjtMiYf5zmbuNMd/sUhcJ8KrId9GHY8qw2d2CgUoS?=
 =?us-ascii?Q?FdyKnARsigww2cuLJgHKy0lt4OobFsumCjrndJ8/CebRHzveN8mUIMk/GSVa?=
 =?us-ascii?Q?gxzd57YSLDjVFmEGDElvVNraPbWMal4wGsGwjGgNPNeolrjcu+ukQh3WOV79?=
 =?us-ascii?Q?d9ho/855LtlS1BiIO1xb1eNfn21/74lrjfFbdQiEMkCpYMl+IyCeVmz/WJsF?=
 =?us-ascii?Q?wElQflNDzfCSbzFHyU0Yk21jKftCUysIeyrhwq2saj+HnQVx5jQOmsZKQxrA?=
 =?us-ascii?Q?f1123hts6HnIniCXuUY/NhgQuO9677JDgKe3LGSB7wZ4A5Ld0bsUKtVvY8Qr?=
 =?us-ascii?Q?QDnJOesmVe5NQw4HXanxkKKNf4GUCoKCSsHzdMd/gP9OzIFztOdgvkYJPiDz?=
 =?us-ascii?Q?Q1Gm6FKIfxJnGdUgQhkiRez40YN3xK63b7FgV6hYTbcsquiI9J8+yxklAGb1?=
 =?us-ascii?Q?ZReUsME4GfIskepphXgdP+8QV0b7bNvsEahK9Jnw+c+u069mis5iWDstEzMh?=
 =?us-ascii?Q?WIYqwJXbNlGfa1DlfAUSSDyHYRXTEDyJ+HexLMnaTvZV3yMMOsDmqZCkrUGI?=
 =?us-ascii?Q?ZP8T0cGtK++OZx0/cuhxmzcj83sWhdOkrjJ78LDPdKn+ZkXMqj/xpOi8xWrs?=
 =?us-ascii?Q?OG0guXOJUXr7D9ezl9qOM8rTtopzn22N+WwI3SuMOtxNfVKedQJKQgwG4rOA?=
 =?us-ascii?Q?LFdsJ496W8YwupXET/lCXQP+RZg4OD1Ib3nobOkbpsWqP5huFUHpOfccMFCU?=
 =?us-ascii?Q?HNFgGTi1CGvHowMBh6F/FNywGEVU4uUhq/72WSiyvuxQOVx912LPswBtFEgh?=
 =?us-ascii?Q?WnZSfwmWoopkwUboe99tCZCs1n+wgxq1xLIJ1GyhJuB8OUkkkBCcSFOd9GG9?=
 =?us-ascii?Q?vLXCXrEZSMC/xXpYuwdGDg8Uzy+IeS+bJOXb/LJTR89HlSxBTeTn8Vor3OCw?=
 =?us-ascii?Q?MeOtAcWCzeKPWZ1XKxu14L5hJtqVb8ZyOY4m8sJngNb8HtMcePwmU5d+TuOH?=
 =?us-ascii?Q?GCg9aaLQ4vwOM+xwX2MH9PCzL+GZesE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a210b6-763a-4304-1f4b-08de70d6584a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 23:18:24.1169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JY4GJ9c/lI9KBEWeijM+m4GVc2Xmb7HGVCu9qsJ32aoClSk21HnBXBS/xtT9+R71aeOYA78tkyPn8TOKmyrlpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF97652A3E1
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C27C616B5E1
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:34:15PM +0000, Jonathan Cavitt wrote:
> Add initial declarations for the drm_xe_vm_get_property ioctl.
> 
> v2:
> - Expand kernel docs for drm_xe_vm_get_property (Jianxun)
> 
> v3:
> - Remove address type external definitions (Jianxun)
> - Add fault type to xe_drm_fault struct (Jianxun)
> 
> v4:
> - Remove engine class and instance (Ivan)
> 
> v5:
> - Add declares for fault type, access type, and fault level (Matt Brost,
>   Ivan)
> 
> v6:
> - Fix inconsistent use of whitespace in defines
> 
> v7:
> - Rebase and refactor (jcavitt)
> 
> v8:
> - Rebase (jcavitt)
> 
> uAPI: https://github.com/intel/compute-runtime/pull/878
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> Acked-by: Ivan Briano <ivan.briano@intel.com>

Mesa ack? We will need one of those.

Matt

> Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> Cc: Ivan Briano <ivan.briano@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 86 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index c9e70f78e723..56a7482ebd79 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -83,6 +83,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_OBSERVATION
>   *  - &DRM_IOCTL_XE_MADVISE
>   *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
> + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
>   */
>  
>  /*
> @@ -107,6 +108,7 @@ extern "C" {
>  #define DRM_XE_MADVISE			0x0c
>  #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
>  #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
> +#define DRM_XE_VM_GET_PROPERTY		0x0f
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -125,6 +127,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
>  #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
>  #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> +#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1243,6 +1246,89 @@ struct drm_xe_vm_bind {
>  	__u64 reserved[2];
>  };
>  
> +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_FAULTS */
> +struct xe_vm_fault {
> +	/** @address: Address of the fault */
> +	__u64 address;
> +	/** @address_precision: Precision of faulted address */
> +	__u32 address_precision;
> +	/** @access_type: Type of address access that resulted in fault */
> +#define FAULT_ACCESS_TYPE_READ		0
> +#define FAULT_ACCESS_TYPE_WRITE		1
> +#define FAULT_ACCESS_TYPE_ATOMIC	2
> +	__u8 access_type;
> +	/** @fault_type: Type of fault reported */
> +#define FAULT_TYPE_NOT_PRESENT		0
> +#define FAULT_TYPE_WRITE_ACCESS		1
> +#define FAULT_TYPE_ATOMIC_ACCESS	2
> +	__u8 fault_type;
> +	/** @fault_level: fault level of the fault */
> +#define FAULT_LEVEL_PTE		0
> +#define FAULT_LEVEL_PDE		1
> +#define FAULT_LEVEL_PDP		2
> +#define FAULT_LEVEL_PML4	3
> +#define FAULT_LEVEL_PML5	4
> +	__u8 fault_level;
> +	/** @pad: MBZ */
> +	__u8 pad;
> +	/** @reserved: MBZ */
> +	__u64 reserved[4];
> +};
> +
> +/**
> + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPERTY
> + *
> + * The user provides a VM and a property to query among DRM_XE_VM_GET_PROPERTY_*,
> + * and sets the values in the vm_id and property members, respectively.  This
> + * determines both the VM to get the property of, as well as the property to
> + * report.
> + *
> + * If size is set to 0, the driver fills it with the required size for the
> + * requested property.  The user is expected here to allocate memory for the
> + * property structure and to provide a pointer to the allocated memory using the
> + * data member.  For some properties, this may be zero, in which case, the
> + * value of the property will be saved to the value member and size will remain
> + * zero on return.
> + *
> + * If size is not zero, then the IOCTL will attempt to copy the requested
> + * property into the data member.
> + *
> + * The IOCTL will return -ENOENT if the VM could not be identified from the
> + * provided VM ID, or -EINVAL if the IOCTL fails for any other reason, such as
> + * providing an invalid size for the given property or if the property data
> + * could not be copied to the memory allocated to the data member.
> + *
> + * The property member can be:
> + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
> + */
> +struct drm_xe_vm_get_property {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @vm_id: The ID of the VM to query the properties of */
> +	__u32 vm_id;
> +
> +#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
> +	/** @property: property to get */
> +	__u32 property;
> +
> +	/** @size: Size to allocate for @data */
> +	__u32 size;
> +
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
> +	union {
> +		/** @data: Pointer to user-defined array of flexible size and type */
> +		__u64 data;
> +		/** @value: Return value for scalar queries */
> +		__u64 value;
> +	};
> +
> +	/** @reserved: MBZ */
> +	__u64 reserved[3];
> +};
> +
>  /**
>   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
>   *
> -- 
> 2.43.0
> 
