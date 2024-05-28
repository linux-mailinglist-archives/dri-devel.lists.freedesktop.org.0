Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAA08D1960
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36497112166;
	Tue, 28 May 2024 11:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4SJ9h7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0403112166
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716895544; x=1748431544;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=5f7mel31k9pJLocLQLl4aYz3xwooR/IiiMKxJ9jgPI8=;
 b=I4SJ9h7LwWQIewVaFitqHhYmkk7iR9pKU5e0D5seu5ledBE8t5JsEwhd
 3K2lLOaNd6S3CGqpjQLnzQhKb7FseYdsLNQ4urVCiXr5EaxTdVscDf7XI
 BoMNqYqFOHbC0NaPFzuokRJqmuHFOuQrh+XvETxqvUfvxByxfiMGOmSzf
 zGBPHdkHiBEiTxFTQh01oqGp9XlkPW5kW6MASAjnPTAZudzl0Y56igLZv
 s5l+fV24Guj869gV1cV7XGPazulOrjLmnfrNyDurFEOV1HmQ11vddfqu6
 PcjO7xWKZ0I+E4AjBgTCCk8+2F15yr9fTYXlrsjzW1P91k2g3hqnGu61i w==;
X-CSE-ConnectionGUID: bs2VYLAOSt2QlXxG8eHlDQ==
X-CSE-MsgGUID: tIhV/N8gTee9IoSihCWcIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13081302"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13081302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 04:25:43 -0700
X-CSE-ConnectionGUID: OQcfyCOGRfyfcTES3oSf9Q==
X-CSE-MsgGUID: OFymvoICSv6bhFlTYbEeIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39865180"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 04:25:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 04:25:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 04:25:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 04:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1J9bRXsdm4zehunwnm5QVVpvMW1QGs97pipuGMBUAUa8QDfi+y/Y0PfI9xqDfr5zpgQEz8oVyQSR1DccRzbApUMDRTzFNEh6Yw/5G6Q5/YRaLv3b+TsRrc81cRXYo9ZS+SPpBULoUNBftIWKxFkKARZ9DMNKjx/EXAKZU4UubP9xPA+ZotXuv4SGzwOF3I2AZRy6/T/lblAlNudhh/UBWcChBz/e8jIlfpbJYgySn9jmlVXJ4SEpLDuitotKxLS1hfrGqo0rxSjKUvC7k/u0a1NdJtEoZ31Ap77SG1FjZqAJlKp29wQJ/dBG1BHa737l4wAvOsc31rdYusTJyC+Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5f7mel31k9pJLocLQLl4aYz3xwooR/IiiMKxJ9jgPI8=;
 b=Na7/HZTucG/dSgQy6ifCNcXn9nqXULLDkd6QBMuUEeDQulp2e11Mh4ajMAyFVaRTDUzSlE4V3L4+Y5k0Oxkud8cI/qvzEAjfA1SexVlR9zgCM96tz0tIZXv5Q6pNRPMiD4ycuSbyENtIfPCkG8uEL4MzSlZnuSwQaz4rjsAR5vY7/vq2SoTGLecfk9GI5nY6IM33YeMvkRgJi5DYt715b+OeO6OLNuAxWNYmFVcXgybtm43HCHV7hySQy6SuCtajm3cVgG1/bmMMG+dh7eqXj4vtIpU7y4IFwiKLhAJS/HLHJMB93QAQYz3QP2GXlxewU1+BaDI3ivRY/Ig6Xu6JAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS7PR11MB5966.namprd11.prod.outlook.com (2603:10b6:8:71::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.30; Tue, 28 May 2024 11:25:41 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 11:25:41 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>
Subject: Re: [PATCH 02/17] drm/panel replay: Add edp1.5 Panel Replay bits and
 register
Thread-Topic: [PATCH 02/17] drm/panel replay: Add edp1.5 Panel Replay bits and
 register
Thread-Index: AQHap26pw8/PFMA4REGRkn1BDfvGlbGslKwA
Date: Tue, 28 May 2024 11:25:41 +0000
Message-ID: <9a785a57e2d48024d9fa622e89c8c6d4fbf20050.camel@intel.com>
References: <20240516085342.1559562-1-jouni.hogander@intel.com>
In-Reply-To: <20240516085342.1559562-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS7PR11MB5966:EE_
x-ms-office365-filtering-correlation-id: abe249d8-edfd-44b6-451c-08dc7f08e83e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?NnRjaCtMbG13MmZqWTArOG9OQ0ZUY0VTUjBkc01oVjdQWC9oTnRVMHVEU3ZW?=
 =?utf-8?B?VWt1RVdmRnJsVlZhdGdnOXhJZ2ZqRVo5ZUt5NENnY0hONjhnSFhQc3lsSDlY?=
 =?utf-8?B?aldHLytCakV2ckdOOHNIRFBWYzVQaE9lTW1wcW9NMGl2SnhxNnlSUHoxeVRy?=
 =?utf-8?B?TUhOTGMrb2w3c1ZKcGxkdk5SUUN3MFFkMUl6VjdJTW82b0twRmQ4c0hweHVl?=
 =?utf-8?B?VzV0ZU45ekpXMzVKaEhCUXMrSjVpbXF1Q3ZLWktUcGdraVlBUUY5NjdRR1Yy?=
 =?utf-8?B?VzRJZTJ4bVphakdaN2NNVjZRM2Z0SkRKYUNXdVVYVC9wb1dMS29YOXhkekhH?=
 =?utf-8?B?T0FEazN2aFBFUFprTkZWMmJsa25hUlFaK1FuMDhzRGgrZHlsNkNtSC9KMGZX?=
 =?utf-8?B?TjZDWXZQV2pLVHdocXU0TnNZTGFqdllza3VIS0JKYVB1SysrRmFHSkM4eDA4?=
 =?utf-8?B?aXB2MVFPUTBHcXhWMGswbkwzVjM3MWpUNzE2U09ISGpVczI4QTQ2Rk1QK2lM?=
 =?utf-8?B?Z1VkOUk3OTJWUWF1U2d0czVtL2sybWNLMW1uQkUwZjl5MlNzdzZWaUsydktp?=
 =?utf-8?B?TVVoQ0R6MnBacTUzUVFpcFBOUlBUZDNSTGRZTEdzRVRFeXBDdS9vYlpETkor?=
 =?utf-8?B?aTVEbWQ2TVRpNkg5VStkOXhjK1A1cms2aUpHM0s3TENjQXB0MU5IMlQ0VE1D?=
 =?utf-8?B?WldETWgwWTN4WC9nazMxRC9RU3ZEQXhsTVlsUHB1SE5RR2l6S2JUYkozM2VP?=
 =?utf-8?B?QWlSNUJUenZmTkZaSHRwZ0Naa1ZrbmE0WmhkcnowcnNzRTBHQ2VoRDQySkF1?=
 =?utf-8?B?NDR1OWJEZlRtK2tZSXJ6U1lKMTVqaVpwZEtyaUpMMTZmaTNjMFpFVUNrUWpQ?=
 =?utf-8?B?dTM4TXhqSmZGd1lpbXp5QkthZDVuUDFoTUZwM1NHQ3VZNUR5aFBwNVhJZzVD?=
 =?utf-8?B?WkJvMWx3OWUvZFZwSU5ONDB0K3FiRW1nQkhNNk9SUnUwQUM1ckVPMUF0NmdM?=
 =?utf-8?B?R0VsVm9jTTVtZGE2RVd4cW8vL0Zkejh0WFJnZFJ5b1lQL1YyQ0hhU2NGYjIy?=
 =?utf-8?B?azZIcDRiM21tTEYxemFrbGtEN2Y5aktpVnFmWmdHSkdqUHFraU84aGIrQkRk?=
 =?utf-8?B?Q3Y5SGdyRjd0NFZUY2UyM2ltc1JicXNHcTcrVnlnQ3VmNVVvR1hFYUYvN2o5?=
 =?utf-8?B?aGV6ODlnditPTTA3bkp0ZTQ4MG1HTTAyNU9oaWhBb1g2UnpaMnlqcmwzQnAr?=
 =?utf-8?B?ZTIzV3R3N1ZlWUdWQi80TDRZWUxjWGUwTk1GTlF5QVZ2MjBRVUgvb29tbDEx?=
 =?utf-8?B?TThiZmZXVDQycUNrcFQ1YTBwd2xpVzFWcXZYZTJtd1FPT255MlU3QWxZUzRF?=
 =?utf-8?B?cmZXdGRQcEltSkIwcGpTQlRXd05NSWxFd3YvNVdrWVhlVVQwYTJrZHJwVEtI?=
 =?utf-8?B?VWQvOTNIcGo1NzY5a3M0NS9SL3lqaXQwSUxKS28rT21rTExvU09ydlM2NnBq?=
 =?utf-8?B?SU0vVHBUQlBwNlc2VmNRREJUbHA0TDk4M1ZLa3psR1gxRWJnSUFoWUdPMFUr?=
 =?utf-8?B?OE13TUorRFhzTXh0VGRlTWdDMmxFNXB3OWF2SnB6bWxsY2VDTW5sc1Q4aGJp?=
 =?utf-8?B?ZVZJeUMrNitoQ2VCK2JSemg5V3dDSzlYd2ZPWVh4TWZtbjJ0TGl6aE50cmwy?=
 =?utf-8?B?ampCYU5XbDN1N0hmU28yd2p5elc3UXBnTkJNZkJ0TEtmdWt0Z2w5WG9jOEtr?=
 =?utf-8?B?eTE2aHFrMFphejZ1NG0relkyUVpST2UxWkhKbTNsYlZWaFBPY2c3TVVVaUFE?=
 =?utf-8?B?ZUg0SFhwSUV6cHc0NXhJQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2ZpSzBBdS9NWjl1UVZaWXdvMVFYbHNPdkg1MWp2K2grdVQ2b2Z6ak1MWWxD?=
 =?utf-8?B?SkcyeE1LRDBnSElkS0ZzZFkrMWhYTU1EZmgyY1NhUHZaVk1xSzIyQUJzeW9L?=
 =?utf-8?B?NEhOUGRrd0dUbERIa0toWkZnNmUrYnY5NmlZZ0VFalk5K0RSaFlrSDV1Yits?=
 =?utf-8?B?QWZlUFRFRk9vSkl4NytmNktQbWhMU2RMRFNDNjJXM0M4dGd0V2w1QlhDVjND?=
 =?utf-8?B?YkdtcS9iZWhSNzF6K0wraU5sVXlTZk5ualprRTVUT3ZCczRCeHU5ZjkyeUI4?=
 =?utf-8?B?SXFuenoyY0prbllXeXM5ZjZIM3hDbGJFYWxRSE44cS9ScWlpSGFvZG9JTGFW?=
 =?utf-8?B?N0FsU0F3Y0ZPRUZLTVFDWGlvZEUwWENVSHRCdS9DdS8raTJZZzI5enF5TXkx?=
 =?utf-8?B?RjFaRGprTnB2SjlnSmtmbFUwOHdHcUIwSzNZSzZOUHVTd1FaSUVYaVJubHhI?=
 =?utf-8?B?VDk0STZHMEM5Z2tPRzEvQU9wN3JZM1lTR1I3NUt4eUZVaUNWL2ZEQmhsWkRH?=
 =?utf-8?B?K1RQNTZaUlhZekxPcTg1NUk4QXVjWnIvOE1obWVXTU52Ymo5Z1JsYVQ3cjRU?=
 =?utf-8?B?ZjJPNFhWMUtmanBoWW9rUzNEN21Qb29MZnN4a2VDS28xQ1JhOXQvc3g2bit0?=
 =?utf-8?B?Qlg4aTlUZHpOSlErZS9JMEl1SityejZLd2pCRUdCMHJoeHNSNDZuK0QzbVk4?=
 =?utf-8?B?ZzlicWNiempHSk50ejVWSll6NjhqcWo5TXlPZkZJRE9yMEYxQnBzRnpiSVh1?=
 =?utf-8?B?djM3cmpGQ0ViYWgzYnd6Z0xnVEQvSUhRa05pTko3TlEzd1hWZDltY0RxY3F4?=
 =?utf-8?B?OXlTME9LeW1mTGxHL2RjTE1wVnFwRDZ6UzlYeXhZMVFjcFBLYm00MjlBSWJm?=
 =?utf-8?B?RE1EZm9Ca0NoVXJLSGNlSm40N25mc2JwQ1RaalhnWTNWR1lIaGdKb2xCWERy?=
 =?utf-8?B?QjVjMHEyZUVGdmJ0NE5rbmZTaUJXQTNxbjZIUjB1MnpoUnU4eUo5ZjlNOXls?=
 =?utf-8?B?L2wvTU1xQm5qeTVBdk5EdHlNdkVaSXhkcGNPVCs3cWJDR0E3eUpEaWpTSEJk?=
 =?utf-8?B?QkNSM21IT3lvWXpMb0RIVEc2ZmRoekt0QVJqdFpRdEhPTjh6cThMdW1OeERa?=
 =?utf-8?B?WlJwdEladkhOVkN5SXFpQmY0SW5xcjhWRGJQUSt1L0MzMm5YREpOcUN2Z0dx?=
 =?utf-8?B?c2REUUF6SHhBREhHNW5NWTVoZHFaampwNFpvZDJNazJwNkRUT0JrZWdLNFRS?=
 =?utf-8?B?c0szdGlQVGZuNURwZnRJY242aDI0Ynh6ejdlVW5XaHJGRzlQaXQyM3FhNDBB?=
 =?utf-8?B?RkxqQ1o0YTZBVFgxVTZGejN1OE1NT3lqOHhyVXBxZ1V5MTJOazk3K1dUZ3Br?=
 =?utf-8?B?Z1FZWkdsMCtHM2Zyc3Z6TFFwU3A1YzFiRzhkbXV5K21aeERweGwxcVR0ZXJy?=
 =?utf-8?B?U1c1QmxKd2h5QTJod2xpTFZYTEVWMUZPcE45MENoUnI0MmtpeHhvNUdUb3BM?=
 =?utf-8?B?Zm5jeHZQTzM0NmVteXZqTGdwMldzbUNCWEhPQjRQRU00Wko4WFUwa1g4Q0dQ?=
 =?utf-8?B?alUrYlJBNEJ5WWlCaGx5WCsxMEFZemxqSkYzcFdwRDZHdWp5bHlzWTNQTnp2?=
 =?utf-8?B?eG82SjlhUGEyTjB1T1R2eXhsNEFvcmxPZzBwd2J0Wk5tS0E5c0Z4QkZtZXho?=
 =?utf-8?B?bnppcit4Sm5LV0NpQ0VsL00raWk2cSsyTjNHcWgxdkVnNHZtdXVEVStvR2hU?=
 =?utf-8?B?MjJTR2RmUHBSVFBvdVJ1d3QwS0V5cFEwVmlUSmVwNkluRno3eE12VFpaUGU5?=
 =?utf-8?B?bGhyTGswYVhGejRjNzFaZ010aVcrZlB3R1JxckxiR1UwSm9naXkveGdsTWo5?=
 =?utf-8?B?My8rRnRzTUFiQ0ZkWW1GZm9BV3N5eFduZjRsd3FicjdHWEtGSEozL1NsU3VH?=
 =?utf-8?B?aU9NNGJjNUJhMGE2VC9YWUNrM0V6ODNLTmlHaGJQMFpmOHV2Y1R4dVI0cFNW?=
 =?utf-8?B?MWlDZGNoYmx1bTFDV3JCY1BpREcvSVdCclBidDM1Z0tUamdFVlM3R29MWExu?=
 =?utf-8?B?R1VDUlJOU1UycGxDUFRpTEFSM1B2elh0TWVFRDNuZlpYQnNBMmlhbG1EK082?=
 =?utf-8?B?VlJ6VXRUeUpubTAzeGMwZlhnSW9DT0M0TWdxS0Z5TWd0T1cwd3hYaDZSaFhz?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BE2CE72C796EB468FDEFDF4A45FB9C0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe249d8-edfd-44b6-451c-08dc7f08e83e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 11:25:41.2481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ip3rB07Yg1B5MWTtH+f4KamMXXkcIDK/0PDapS2GEHNQdrh1Rw9mymiV4Vka6DUcRVyKVhg3HNseJaWtgsPVwyHlG2VIk/SAbyF1bT+5UFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5966
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

T24gVGh1LCAyMDI0LTA1LTE2IGF0IDExOjUzICswMzAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
Cj4gQWRkIFBBTkVMX1JFUExBWV9DT05GSUdVUkFUSU9OXzIgcmVnaXN0ZXIgYW5kIHNvbWUgbWlz
c2luZyBQYW5lbAo+IFJlcGxheQo+IGJpdHMuCgpIZWxsbyBkcm0tY29yZSBtYWludGFpbmVycywK
CkNvdWxkIHlvdSBwbGVhc2UgY29uc2lkZXIgcHJvdmlkaW5nIHlvdXIgYWNrIG9uIHRoaXMgcGF0
Y2g/IEknbQpwbGFubmluZyB0byBtZXJnZSBpdCB2aWEgZHJtLWludGVsIHRyZWUuIEkgaGF2ZSBh
bHJlYWR5IHItYiB0YWcuCgpCUiwKCkpvdW5pIEjDtmdhbmRlcgoKPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4KPiAtLS0KPiDCoGlu
Y2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmggfCAxNiArKysrKysrKysrKysrLS0tCj4gwqAxIGZp
bGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaAo+IGIvaW5jbHVkZS9kcm0vZGlzcGxh
eS9kcm1fZHAuaAo+IGluZGV4IDkwNjk0OWNhM2NlZS4uNzliZGUzNzJiMTUyIDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgKPiArKysgYi9pbmNsdWRlL2RybS9kaXNw
bGF5L2RybV9kcC5oCj4gQEAgLTU0NCw5ICs1NDQsMTAgQEAKPiDCoC8qIERGUCBDYXBhYmlsaXR5
IEV4dGVuc2lvbiAqLwo+IMKgI2RlZmluZSBEUF9ERlBfQ0FQQUJJTElUWV9FWFRFTlNJT05fU1VQ
UE9SVMKgwqDCoMKgMHgwYTPCoMKgwqAvKiAyLjAgKi8KPiDCoAo+IC0jZGVmaW5lIERQX1BBTkVM
X1JFUExBWV9DQVDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDBiMMKgIC8qIERQ
IDIuMCAqLwo+IC0jIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfU1VQUE9SVMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKDEgPDwgMCkKPiAtIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX1NVX1NVUFBPUlTC
oMKgwqDCoMKgwqDCoMKgICgxIDw8IDEpCj4gKyNkZWZpbmUgRFBfUEFORUxfUkVQTEFZX0NBUMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMHgw
YjDCoCAvKiBEUAo+IDIuMCAqLwo+ICsjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfU1VQUE9SVMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMSA8PCAwKQo+ICsj
IGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfU1VfU1VQUE9SVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAoMSA8PCAxKQo+ICsjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfRUFS
TFlfVFJBTlNQT1JUX1NVUFBPUlTCoMKgwqDCoMKgwqDCoCgxIDw8IDIpIC8qCj4gZURQIDEuNSAq
Lwo+IMKgCj4gwqAjZGVmaW5lIERQX1BBTkVMX1BBTkVMX1JFUExBWV9DQVBBQklMSVRZwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMHhiMQo+IMKgIyBkZWZpbmUgRFBfUEFORUxfUEFORUxf
UkVQTEFZX1NVX0dSQU5VTEFSSVRZX1JFUVVJUkVEwqAoMSA8PCA1KQo+IEBAIC03MzQsMTEgKzcz
NSwyMCBAQAo+IMKgCj4gwqAjZGVmaW5lIFBBTkVMX1JFUExBWV9DT05GSUfCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDFiMMKgIC8qIERQ
Cj4gMi4wICovCj4gwqAjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfRU5BQkxFwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgxIDw8IDApCj4gKyMgZGVmaW5l
IERQX1BBTkVMX1JFUExBWV9WU0NfU0RQX0NSQ19FTsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICgxIDw8IDEpIC8qCj4gZURQIDEuNSAqLwo+IMKgIyBkZWZpbmUgRFBfUEFORUxfUkVQ
TEFZX1VOUkVDT1ZFUkFCTEVfRVJST1JfRU7CoMKgwqDCoMKgwqDCoMKgICgxIDw8IDMpCj4gwqAj
IGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfUkZCX1NUT1JBR0VfRVJST1JfRU7CoMKgwqDCoMKgwqDC
oMKgwqDCoCAoMSA8PCA0KQo+IMKgIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX0FDVElWRV9GUkFN
RV9DUkNfRVJST1JfRU7CoMKgwqDCoMKgICgxIDw8IDUpCj4gwqAjIGRlZmluZSBEUF9QQU5FTF9S
RVBMQVlfU1VfRU5BQkxFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICgxIDw8IDYpCj4gwqAKPiArI2RlZmluZSBQQU5FTF9SRVBMQVlfQ09ORklHMsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoAo+IDB4MWIxIC8qIGVEUCAxLjUgKi8KPiArIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX1NJ
TktfUkVGUkVTSF9SQVRFX1VOTE9DS19HUkFOVEVEwqDCoMKgwqDCoMKgICgxCj4gPDwgMCkKPiAr
IyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX0NSQ19WRVJJRklDQVRJT07CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoMQo+IDw8IDEpCj4gKyMgZGVmaW5lIERQX1BB
TkVMX1JFUExBWV9TVV9ZX0dSQU5VTEFSSVRZX0VYVEVOREVEX0VOwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKDEKPiA8PCAyKQo+ICsjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfU1VfWV9HUkFOVUxBUklU
WV9FWFRFTkRFRF9WQUxfU0VMX1NISUZUIDMKPiArIyBkZWZpbmUgRFBfUEFORUxfUkVQTEFZX1NV
X1lfR1JBTlVMQVJJVFlfRVhURU5ERURfVkFMX1NFTF9NQVNLwqAKPiAoMHhmIDw8IDMpCj4gKyMg
ZGVmaW5lIERQX1BBTkVMX1JFUExBWV9TVV9SRUdJT05fU0NBTkxJTkVfQ0FQVFVSRcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAoMQo+IDw8IDcpCj4gKwo+IMKgI2RlZmluZSBEUF9QQVlMT0FEX0FM
TE9DQVRFX1NFVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDB4MWMwCj4g
wqAjZGVmaW5lIERQX1BBWUxPQURfQUxMT0NBVEVfU1RBUlRfVElNRV9TTE9UIDB4MWMxCj4gwqAj
ZGVmaW5lIERQX1BBWUxPQURfQUxMT0NBVEVfVElNRV9TTE9UX0NPVU5UIDB4MWMyCgo=
