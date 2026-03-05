Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIKvFtzSqWmYFgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 20:00:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8AF217333
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 20:00:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3CC10E203;
	Thu,  5 Mar 2026 19:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAnZAqaw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD03910E05A;
 Thu,  5 Mar 2026 19:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772737239; x=1804273239;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MuXBJoRnUuNRPfWjGFH5N0R0ky6le7g7NO0TZ5OrX40=;
 b=hAnZAqawjraycGm145xRPsmuOCwUoqPqBTWAz02M5I8sAhR6/HsTZLvq
 TMKzz4H9Qf8SUx5Ov65swXCthiKVPlJZ5tMj2bn45hJ3tJ32vqoWnP1v0
 saNYjnht2X3456Mzrr/+0gCO+mOI7f1DtEw5uW2aGW1raTmlWViVuduPM
 XZcdjHi8bux+ytulAfg4HKH7iK54FmzrWc1XvZ1v4KHjqx/O7FRhI/cjI
 VAmG9eT3X3pR78zeVyuj4JIFElSHgPu2DFxbMdtBvljgsyodx10ubuk8j
 2qOD1sY6A3e1fzIfw2r+U4MLf/k3wsWVLtveHeVJgXrq8j/pfeVX5Z1w7 A==;
X-CSE-ConnectionGUID: YEjrz6LCQOmgxUBj+8AgwA==
X-CSE-MsgGUID: AERIDnh0Sya4Q30GEEuDXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73958332"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73958332"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 11:00:37 -0800
X-CSE-ConnectionGUID: qzgP047DTEOWfmc/ZfT4Ug==
X-CSE-MsgGUID: J/yGv+/2SrO1unJBG0puaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="215970005"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 11:00:34 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 11:00:33 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 11:00:33 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 11:00:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGkSxScjY1l6Rmn7//LBPbIzvo0I7NCY8LbQijLOxEeV+dSmo6u/X/XjNi/CZ8Dj+hwGhnetcEfxM+4Hwl2xEDHSJJJVjbYYkNHCOM5nMHfjwJHyqzZdnXoBhVkv8ajLkweJjv53MQnndCTE2kPbdddz9Fa+WjSybdFcsordzyeGXbjW7vIAdVZl42ATpPjkOIhdQqLFObNAAxhXF/lrAr11SPz3lvfFUJnijcFACqwcIssMb/HeuTA+Kc7QKhQ+dDrPpv+J2lF7WcZoxotSAkD4bhvPWpjXUT2dalY3AOHukAjADDEAHaklzVIqzREopWfxmKW4Kx8a+P9u18rWrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NciT7JjyuRqoowZE0ZfSkrABepeRrh5uVwoh5DSMPTI=;
 b=AbZ0AUdsBkmTEk94WPsKJ+TuuMWAQY1u4rJm1ojwGuXlznI3XSZQR1qRMMWaicQdpfeJvrIxhaTwtu8gvPbHdPp2yKhrhG1SQFBofHpLfdYdUm3YesTnUruIvGDjZgKQ7GTVnzB0U79TRWU0Fir/QiQZ8WvXmMtcxir2zs+b3PY3Q7T3fJgSosZKFZjRDDk13/zJ7BRgL8jeu8Uqwqx7u2Am003jHiOHHkGIUFgTyIKOTpJAY85wsTeUkxgfVb+cXv/qOGTWxjKQ97GxpkV/zV4PbNn4alwi0b/pubRgIjoleVCR69vdPCPv0wfg1C+cb8Qc77arfhEX6IOF/ipajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ0PR11MB6574.namprd11.prod.outlook.com (2603:10b6:a03:44e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 19:00:30 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 19:00:30 +0000
Date: Thu, 5 Mar 2026 14:00:26 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>
CC: <linux-kernel@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, Tejun Heo <tj@kernel.org>, Lai Jiangshan
 <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko
 <mhocko@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Krzysztof
 Karas" <krzysztof.karas@intel.com>
Subject: Re: [PATCH v3 0/3] replace old wq(s), add WQ_PERCPU to alloc_workqueue
Message-ID: <aanSyqBzTygkzg80@intel.com>
References: <20251104100032.61525-1-marco.crivellari@suse.com>
 <CAAofZF4bvBoecKaJv_sEEK54htXBv_dc23tJRrwhXrGb3O_D7A@mail.gmail.com>
 <aanRQseClNRRDZxq@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aanRQseClNRRDZxq@intel.com>
X-ClientProxiedBy: SJ0PR13CA0195.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::20) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SJ0PR11MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: 0711fafb-6119-46b0-ac20-08de7ae97850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: +tZsh/ANt7K+tD7cNRaYjyehzWaf4JBRAVz4wsK9+UfY0zmePc6TY67mec+fiVQFb94W/roRtM1smcwwz8jLkrpZR2I5mQhnoWtRoz0R6d0haaaCvjkii6PqnslIJx8lYuX9QNQsNyExhzASStqUkmnsFwWCVtiJmKXKCqxR5kGhLM5Hm+mrcqwL6Fab2XUMIMoC+3a7OmQ26V3A4QCTplCty4U/yIrQB8/Ub/+L5DyrgeipvHJg1nj/0RDGPvagyA08O/78S3e+/NlaMp56EnQCvT5VCO7wFQBiogJQKscdPIC2krEXJyKH3yNbWq/OImFO81UuiGh8FUdaYLddySPQrL3Jdb6WX5V6f49dO21TcilWRJKx8w9ydaLS0g/pysZuEbooUYz6V5M0KMXceGWTWXCDhtjEEjMgMdlDM2P6vmTV9m1+OFHvUjaF9lXZUZ+Sbw6QRawv0MFOQwLwQ4XmX4sOplZqJgnXsd0qRqWdc081rqV5yYFciw2NwHGha9+HL0pDZ3k+S+IVP6Vm8Rc/v+kvbnvGMqPEgCUAylu1Xd8rnHU4kbFfjyB5/PqlzAOqlpXZt8SGuAjj7GrgMnXAihu0znAp3HEeNau85as0D/QsCMuG0uyKjjMGQ4AzQRXkQQ8oM0JSOzkjDOPRJwaqi6dEXT65gdOtdaeyApq996gzpOxmJ86MaKILv7DAZeBlNCT49hoAeetafgPXtUJQaZ5v5WUEJMWC5e2L0ec=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmF2eXRNd1I1czl4eldicVJJRDlOZlpKaFJ3SFh3UlE3cGFwckF0dFFyaWRX?=
 =?utf-8?B?MW0zRkcrbjlCMFRyWm1WUEN3ZGVLRHVNbFZUZzh3L0RuVm50Qy9aYUwxclBW?=
 =?utf-8?B?T1lpam1UZEZtNUoxS3VhUFhVUUxtSjZCdTBXc1I2SEtkeUJmZ0NGT0FaTzJX?=
 =?utf-8?B?SHZxUjJwWkFHWVFWWFQxY0JvSTd0ZTFud29mZVgvM1FFNElWNDdoQ0NjSXdB?=
 =?utf-8?B?Nng1eWNIbDhsamVuZWNmVFBBMkV4ZVVvQWw2WUlQdTI4ci9BZG9wbFNvNklX?=
 =?utf-8?B?UG00cmxJRTBrSW1TSWhpS2FRZFJTYThnT2gvSmdoV3l0T2x1UEdtdStxby96?=
 =?utf-8?B?RzM1WTdKR1lMRjRSMXlZanFNSUc1QjF0RzRwRFBWbE9uVEFVblFwMWxSWGh2?=
 =?utf-8?B?bFZidkt1ZmJ0MmxQWVcwY0QzbDVSU3M0bC9FSDZ0MDA0M25GOGRUOURSNkNQ?=
 =?utf-8?B?V3BQMVhib0xVNUVNc1U4eWxxREE0MnZvdmtpT0ZmM2FnZEdRelJTaU5FZFZN?=
 =?utf-8?B?L01INWQrRFozNGpjdHFIc0FydDZZTFhpWGlHWmo0ZnVhejZsRFZwM0kyOXhO?=
 =?utf-8?B?UkdzTnRBbXd1VTRHdkJjeWhVZ1hQMS9zemNVTjJlMzdsMVVjZitxZEJGYzNN?=
 =?utf-8?B?SkR6c1hheWZHSXIwZlFuS2l5Y25FREdQb0xUWCtEVUlteXJ2NU12R0ozdGtr?=
 =?utf-8?B?bTllVjhZR0Z1ZjBOL0lyU1lOYitHZUp2TzNJb0lLekl5RGk4SWFLVE1DMUU2?=
 =?utf-8?B?NFlWU0lIOE1LU0phNForQ285b1cwSzEzakJaWDZEdnB3WGNKakJTcDNTZjRJ?=
 =?utf-8?B?S2hjaXorUTNjZ3lYdXVzNkZxbkxxbmFUUUh5S3FmSlMwMHhQblc1MTFvYUtW?=
 =?utf-8?B?VEI1elhQckRpUzJ2OEZzcUxYU3Bqc2ppVC8rY0laUmV1Y1NuRTJHM0NNakI0?=
 =?utf-8?B?QnBoQlNzMUpzcmJPbWZaZnFCMm5RMW5EUzZYbStNaTBPQ3dhcXVhejM3bVFM?=
 =?utf-8?B?UmZjeE1QN25BeG81dGl6Y1ZlVTlHMGkySzRqVVhadVBOM0lPTFIwaDRSTXVz?=
 =?utf-8?B?aWFWaFMyYnJra0ZPYS84YS84NzNJZWlLbVh1Q0VpODFWSUE1UTgyYmp3cnVr?=
 =?utf-8?B?K2FsNHptQ0VuOFA2M0haSkxnV0loVHF0U0huUVA5WVcycEpPQ1VxSDFrTElr?=
 =?utf-8?B?MU5zUTVveTFOUnZheU1FMXluSmovYnZhbTlnemhWd1huOFVBbTlzMnFob0gr?=
 =?utf-8?B?WmxiUk96SVNxc2NOQ2wrbGZWeWZFRmxQZXpIcVp5bkZMZ2s5bTVxSDdhaFFS?=
 =?utf-8?B?Y2NMVE05bWlsRnE3Umt2MUplbGlUa2VwbXlZRGNDODlSQ2xEVThXNDZKN3l6?=
 =?utf-8?B?WEVWKzBoZVo1NllVNXhBTENNdGZLOVByamNVODAzMi9FTitXaGhENlVReEtv?=
 =?utf-8?B?Zm9ZVE9jemNNc2xnU0lVVzlNaTNVUFlFM2Z2Tm1oVW1MNGFHOVNrM29YUm9Z?=
 =?utf-8?B?OHZqU09RZXdNREEzODFERTR2LzFqb0FGaFNKUmc2aU9IWHJVWVBDQWtGU1FE?=
 =?utf-8?B?NDBHaG52QS9jd01NMkE1T05QWHFBYzMrYU9sZkhjYzJJZ1NiZk9ObElidkcv?=
 =?utf-8?B?dVVSajUxTnpVem04ck9ZeUJIRDk2eUtwSVk5WTQxRU1UT1UrZDhQbG41QXQz?=
 =?utf-8?B?QTR6YjdhNXNIanI1RkFsdlkrTkFLSjYvWlJkU1UyNFRMQ24ybm5Tbm5ydGh0?=
 =?utf-8?B?OStLWkZkSEY3LzQ1dHkxNDNrb3ZnOFgzeEJmK3RxaHhYTEtINGhzcmtPeGlp?=
 =?utf-8?B?Z1Z5NGJHTm16R0MxY0RZLzVIRXQ2cmdieXdncC9FSlp0UDMrYWFNZEV6L250?=
 =?utf-8?B?bGE2Y254dFhnUDhZQVJSd2VCYnkyWXIzYWNodHRRZ2N3NWlOM3BPdmw3UFhM?=
 =?utf-8?B?S0gvdmZZcHFiYThCUitDZmdsc0VtZGpRbUQ5eWpiWjBjQU8vTTZUN3k3blJX?=
 =?utf-8?B?dk5keWd0RUJWL1pDdkxLUnlwcDZIaSs2RnNKSDZyZSs3akNuVndjNjZqUEpm?=
 =?utf-8?B?RGtEYTJRUzIvczBWRDNVMEYvckt6VE50a24yelBUNXJ6N1dmTHp0dXZTdENT?=
 =?utf-8?B?OEExUnQwbFQ2b3E3VW1uUDdGK3A3YVF2NFhtSDQzWkFhbnhrS3NmWEN4Uk1V?=
 =?utf-8?B?dXA5TVNtVEgvT1JYNkJ3bFI5STY0blljQ2RMWVlRZ05MQkE0bTdDNlBkbTY5?=
 =?utf-8?B?ZS9sNnZZRFIwdk5odzk1VmpVUnVSdmw0RHRWWHlkeWtEL0NWMDBhQzJVMEV2?=
 =?utf-8?B?Z0tQREhBVG9iSXlyNjh3dVl2UmtqZEdTeGhwallQZUFSMVliNm1YZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0711fafb-6119-46b0-ac20-08de7ae97850
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 19:00:29.9820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e45adFmt7duvWTS4mLNJpdjb3SMKT830262ZNuPdlOeTpQ9IN44XrMBvEvXPVRev6W09y0NAy9PzBppt6bpOjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6574
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
X-Rspamd-Queue-Id: 0C8AF217333
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,kernel.org,gmail.com,linutronix.de,suse.com,linux.intel.com,ursulin.net,ffwll.ch,intel.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:mid];
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

On Thu, Mar 05, 2026 at 01:53:58PM -0500, Rodrigo Vivi wrote:
> On Thu, Mar 05, 2026 at 04:04:32PM +0100, Marco Crivellari wrote:
> > Hi,
> > 
> > On Tue, Nov 4, 2025 at 11:00 AM Marco Crivellari
> > <marco.crivellari@suse.com> wrote:
> > > Marco Crivellari (3):
> > >   drm/i915: replace use of system_unbound_wq with system_dfl_wq
> > >   drm/i915: replace use of system_wq with system_percpu_wq in the
> > >     documentation
> > >   drm/i915: add WQ_PERCPU to alloc_workqueue users
> > 
> > Gentle ping.
> > I checked patchwork and seems still in the "New" state.
> 
> Please ignore patchwork status.
> 
> Both patches queued towards the next merge window targeting 7.1
> 
> fa171b805f25 ("drm/xe: replace use of system_unbound_wq with system_dfl_wq")
> 0bc2c2e1a388 ("drm/xe: add WQ_PERCPU to alloc_workqueue users")

doh! please ignore me.

The similar subject titles confused me.

I just pushed this i915 series to drm-intel-next.

Now, also queued for 7.1 along with the xe above.

c15d0056fb74 drm/i915: add WQ_PERCPU to alloc_workqueue users
4fb289d352e3 drm/i915: replace use of system_wq with system_percpu_wq in the documentation
36ed3648a2f3 drm/i915: replace use of system_unbound_wq with system_dfl_wq

> 
> Thanks,
> Rodrigo.
> 
> > 
> > Thanks!
> > 
> > -- 
> > 
> > Marco Crivellari
> > 
> > L3 Support Engineer
