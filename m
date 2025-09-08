Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADAEB48D7A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C181F10E500;
	Mon,  8 Sep 2025 12:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWj8oLiB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA28010E500;
 Mon,  8 Sep 2025 12:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757334506; x=1788870506;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=oXzgEA2l8mZkS5Xh4t73kf063Q6TxexyhEyxZLZfXw0=;
 b=MWj8oLiBS0xfewtCOZcYOmtRK9fdmQ9ZNZBRq8GJOXBT/kAoL2SYfv4c
 g3ZwA2IauX412Vpe2yog1lNKmYRSILkb6X9QN4KOsjX6Seo+5JQgLc3C9
 n28FgyrN+bxnGMYgS/NXi2EV8QmW6OTFf5w2H6R/WLnkGZiQzBZts5dN1
 RhDfUW4rohGk3OWtbzOVgFLSL7ztI8TP7PbZNok3viMFd1J7S2+t6wGqD
 e9h1uwP+iArWBy/qnEJfhwjUUSkWUd16uGZpyysGC/8eydeSk0Tcr7Omu
 /06BpNTrVnK/9ho78pOy1a6AqFt52zjooFmdkywJH1JdGzhB6dkAwtf4b Q==;
X-CSE-ConnectionGUID: 56jjf+E7TamUkcveTPm1Dw==
X-CSE-MsgGUID: dhB/1rsJQzehtk00e5xrZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="70207407"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="70207407"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:28:25 -0700
X-CSE-ConnectionGUID: Wv/04zG2RZaKp8kHDxJEvg==
X-CSE-MsgGUID: Jl4oZ5htQBuKfp3gexJ0qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172702528"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:28:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 05:28:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 05:28:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.73) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 05:28:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOJ3sp6dns9qG7RHb1g7mg4Gv2AOeo+uxiou24z2WCjzTv3wMl0Qw340Lx3hJqZwRuGApzlbAQkwOlpSRzMXI9tkeFksgB051f25NaWGZaNAkzttXEzzIaNHG6+A0pNMjph/Vb+Ga1hecdb3vfXL9QXlyOmX8q4cLvOG95XmBf12ooCA3wQBHHHv7cEIAqu/f0mu2zLoBmRf/BQCDQ7u202R/HCefzHMxo44iYkzn0VJT76/XQg9qu+gyBpzQDllydf1FzK7VfV85KihrAFkOOWVVpqp6hnfZlowsA4Fgb2krGRG9ZVf/xkt8UzBX2TysskG0SFQmkvzuBxdVGQcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXzgEA2l8mZkS5Xh4t73kf063Q6TxexyhEyxZLZfXw0=;
 b=SXzGlRkWsGuZ0MHCTifUNUi9nShTPnWSgcdTe9BfmjB3i1+/x+5uAs+PXvKCQ2j5wagHIC8AVhKhoz+QX4zqQVHXR9b+3qMUh2j0NNI9dzkxKi0o32W3cj2wwcB4cA19pm7rMrF/JBoCczlECLgHcWbTcEC/cAOCxZxyJCLeMxHeroCDTdbJjuRbGTKkvCs+MM9qyUixy8F+eeaXCVApvppYo94vHnA1EhNSAInZvY00v9w1qh1HjWAFh4JI64OT2dBuE7qicOeptw/gS5s/bSvsdNpqZvtkRmMrwu3dGyc0fnNHtiZzKbD0eKd2ONlgwumBQvZm5XQvKPnEmVr3/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 12:28:20 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%5]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 12:28:20 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "kees@kernel.org" <kees@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hardening@vger.kernel.org"
 <linux-hardening@vger.kernel.org>, "gustavoars@kernel.org"
 <gustavoars@kernel.org>
Subject: Re: [PATCH 3/3] overflow: add range_overflows() and
 range_end_overflows()
Thread-Topic: [PATCH 3/3] overflow: add range_overflows() and
 range_end_overflows()
Thread-Index: AQHcGQzma9ZpCBaSdka1x4Lo0GNSxrSJRgOA
Date: Mon, 8 Sep 2025 12:28:20 +0000
Message-ID: <7059a21202d09cbb5d024baa7b566a825f51ee1b.camel@intel.com>
References: <20250829174601.2163064-1-jani.nikula@intel.com>
 <20250829174601.2163064-3-jani.nikula@intel.com>
In-Reply-To: <20250829174601.2163064-3-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW4PR11MB7029:EE_
x-ms-office365-filtering-correlation-id: 9beacfc7-3094-437f-ded4-08ddeed3325a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MWR6eFY3WGJ2Sm1Ud0pPRTV4Vk1OY2luQkJnc01KamNkQ1FhU3orTUhnSFE4?=
 =?utf-8?B?bGExKzVRaDZ6Wk03elpLWjFUcjJ4b3ZJNWJDUnJLWVZDSGI2UVZhZWtrcENz?=
 =?utf-8?B?YnhRcVJ5OCtnZWdXazNvdTRKanp1MUZLM1ROd2tZSXgwa3EvSHgxdnlGelVJ?=
 =?utf-8?B?aGxQQUgzME1GM2YxTUpJcGluVHp0d0NtWE1PWHVZaW9RK1RsUDcrZGNpeTlI?=
 =?utf-8?B?TndZa0xMdFlsa0s4MWYybDZ5MWEwVXVsa3MyTmR6aERBSDdSYngreDdhbFY4?=
 =?utf-8?B?eEVqNy9MNEJSRnJQbEk5bS9pbzRFR2YzWWlRMzlqTXpIQnJBRkx6Y216WS9s?=
 =?utf-8?B?RFBNU0hweEp3ODhGdlZUT2NBWDVUZmpydlNHL08yRnNidjdERVpqcENDVUk1?=
 =?utf-8?B?dDMyc3lpNnNtVnNXVFVFVE9CajNveDhOVVE4YU9JZzhUZVFhV1BRdk5tSTYw?=
 =?utf-8?B?VFpSeTBvSXZxMUV3SFB5R08vQzZpU2lxdk9NNisrZ0pEdmlMVDJ0blNtbmIz?=
 =?utf-8?B?U1FmMm1RK2tuQlpqYTV3TFJ5bWdqRTFsZ3dSMkJlaGFSUjF2U25pbHNTMnpt?=
 =?utf-8?B?SWRuZjk2a1JhTUVNVFhPMWF3UmtvcVZkRkcxM3BCRmlDWTN0LzFSclQ5dEV4?=
 =?utf-8?B?T0lIMlBjaW80ZEFwdEZXOGRkSmVuc21LbWJ6NGsyaG9WbTJtU2dDNXlPSm1G?=
 =?utf-8?B?T3piT3RhV1JJSDI5WVhGM3BySTQ4RjJBWWJHczVlK1FQL3FHNnRyV29aeDVK?=
 =?utf-8?B?ZHY4dUJuMnhocEZVZXBSN1NiNDBSMWpZaGk5aW9MKytSamFIZ2t1OHZCWVJ4?=
 =?utf-8?B?K1ZZRW9LdjdzR3ZuQjN4c2ozaSttN0tDTHdRdjhUM2hHM2RuaWJBQXZGV3Zw?=
 =?utf-8?B?ZTlabVBzdVIyYUh1enFaV3pNRk53TWV4WEt0YVdTWVp5TWtrZ3c3UkdVQTlS?=
 =?utf-8?B?WXpKc3gwSzVxaUFVTXRTcGRBWDlDSWgybHFwS0xsbWtUL1RFTUlFMk1oNGJS?=
 =?utf-8?B?Z3hVWDVsS3U0SG93YXFpZW5vTWM4WE8wd1Y3RWJsTXBFdnVhUC9IUDJPelcr?=
 =?utf-8?B?UWNIMGxGeWMwdlNVb1Z1dVRFMzN1WUhXQktCTEN4QW5HMytVS0haTityR0pN?=
 =?utf-8?B?R3hjRnh6RkY4Vy9OV09pVUxkaCtjZkUrWDAyMFNLcjlkaW8vZ24wUUZkTnFD?=
 =?utf-8?B?bGRUNSsyc2JNRzBJTVJkdVE3M1R5L3h0aUk3TjdDYlQ5RWJoNzBoWEhxd1Qw?=
 =?utf-8?B?T2lXMXVrRy9wbjEraDRnTzlNV2oyeGJKanlURmRWNDFpdVlHdVZ2V0xHNC9j?=
 =?utf-8?B?TzdOWnBuYWJtL25INGdIQmhYRkpsUWRLTFR2c3hUQ1RZRi93RmtNcEZpRTFE?=
 =?utf-8?B?RGdFdy80djBPYUs3Y3R4djJpVmpBUHF4Rm5QWnZsb3BaNEZhdEdqT1lXNmxx?=
 =?utf-8?B?OThHODBHeEhSOGk3aFIyU1BtcFNOR2U5YU1Gdit2MEJNZlRsSzQzcnV4dlRS?=
 =?utf-8?B?YzlaNUN6N1MwbXlGQ1JuekZhY0NhMFM0dmVhNUNXKzJDblNsOWFScGFEVFZ3?=
 =?utf-8?B?ZVZuMTRadytxR1lSZm1PQ0k3VnpLSUkxNEM5QVd4T3IvTjBCVjJMM2NyV0ZI?=
 =?utf-8?B?YW9YQ21FTG5FQkZNbVErV2J3T295NzEwTVdNSFNNNmN1cnZ5Skc4cG5oUE9U?=
 =?utf-8?B?bW9NODN1Q3ZLTVRPcENNbURKT2hLWFpwN3dldXQ1OVNJbVlWRm05dTRZb0Rn?=
 =?utf-8?B?a3M0cThnL0tOdUJlUFVrNEFaVkFpSmRNc0J4WlE1VlJacnc2dWtzaEZmVStH?=
 =?utf-8?B?MU1SUDc0RDg3UEY1RjhtOWNmQ2l2MmFERnRwL2F0SjN4VTB0YlJ2aUV6eWJj?=
 =?utf-8?B?M3hIaGx0VWNKZnVQM0VjL1c5NGMzTHBJZ0xCZDZaOFgzM0ZhUkZwZmJuZE02?=
 =?utf-8?B?Z1RnRjZwUmRPMHhFV2xjSEdYUTFrTzhDWWg0LzNyMTg0ZUFLZGdEOTlxZXlR?=
 =?utf-8?B?SmlhUk1EVXNnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SENmOFVpRWFGZ21BQXhlaDVyd2hhNjMwWGJ4bTlEc2Z5Q1hVaWUzYVl5K0Y5?=
 =?utf-8?B?MjM4eGVOZU9FRndsMEMzUEhNTkdIRlN2ZlBRK0NSbTkwc3gxcUhLaXVRWDFI?=
 =?utf-8?B?WnVOQW01RHk0ODJPZTJQZ1lrRkZKbEM4V3UvdmRRMy9iZXBPV1dKR2Jyc25P?=
 =?utf-8?B?TVozQW05Z2RNQ2xXd0hxR3M2R0swTEdld0lGcStPeUpwSklxcmxGUGNIYWQr?=
 =?utf-8?B?YmJQQjFDVXFiYmJBU3ZndlExTW9YSjdBeWUxUlkvcVNxLzdDaEthaitGYUk2?=
 =?utf-8?B?a3Z4b2xIOVJ2MjZqdlJ3RU8vNmdvcHkzVkVsYnBPdDBTMzhYSFNmUmlrWDF2?=
 =?utf-8?B?Qjl3akNQWlMvRHNhZ20xc3pUR09RY25XaEtrL2tuRUs3dUJOYnFuR2p4LzE0?=
 =?utf-8?B?dS9RYnIvL09LM3Vka2tGeWd0VklKMnFsdExRTzNBV2M5ZUp2MmRtOWswdXR6?=
 =?utf-8?B?dUNxNXBXYkNKbWh6MjQ5ZlBuUzFDdTFXY0c3N05Bdm5SQkR2RGZ4dGF2UXZN?=
 =?utf-8?B?YWJXNGZDUXdlZVRnNzZJYWhsL1hvTTIzRVFCQytmL3owb0x0c2M5d0lGZGM2?=
 =?utf-8?B?WlJKMU9udTdMNVF0Q0lmQVZuWml3bi82RktaSVdLVHhZckI4NWZHRlp4WE9x?=
 =?utf-8?B?c0U3TlZmWHZqMVNpTFdtVlNicTJlTGlkM2Z2VmNpMFhPOVRrUStKWUNzcTE1?=
 =?utf-8?B?SVV5RFF2aVY2Mkp4M0UwVndlRzQ4ajRHMnVCQnFGK0dndHFHcjRBbm9maXJD?=
 =?utf-8?B?VEFINnphNlEyNkExSzhBRjNhZGtiWldWVERqRmJ1OEVITS9FcEpheEx6b3BL?=
 =?utf-8?B?VlBSdG1uOUl4bWRWTGYxNVJHS1RvMEFma2QzeTdsRmtkdkVpZ1lRcFNtL2ZI?=
 =?utf-8?B?V2svZEpQK2lWZHlrS1BmWlRZTW9QTnVMZE90VWJ6U2JMa1F0clBKdE9Xb2Ir?=
 =?utf-8?B?MjcrQ1cvZVFWTVRqRTlwczVlQzM2OHl4VUMxK2ZXVk56NGFUU05qVXBobFRW?=
 =?utf-8?B?Y0c0ek5OMnpRZVlxWHRIdUlMNWNMZGlBOHlqL1daQ2FNd0VuWHQ3eWhKME1B?=
 =?utf-8?B?UUpOekMwVXpxS25raERVOXJYUWVPYmttYnZ2ZzZSRjNzM1Nxck5SSEF0V2hw?=
 =?utf-8?B?bkxFamlZWEJYK0Ztb202U1IvekUzeHNuR1N3czFZSWpiNDZZcFJwM0RCM0RJ?=
 =?utf-8?B?V3BuN0xwcHdGbnF1V3hTZC9tWVQxM21VL0tvUUkvVzd4OUJQQUU2YU04aUxn?=
 =?utf-8?B?TDRvK01IQllZMWRJWmlYaGtwMU9UN1Uvbk5VeHo0dXdZakZoTkxOL25VQWJC?=
 =?utf-8?B?dXVlS1RNaGxIc1RCUGtyTDdBaUc4eWpEZkwrbzJhYUZJNkdYNnI2SEtlbUZj?=
 =?utf-8?B?V1ltczUzYXc0bHZxVmdxYlN6R1NQNzFacEJVVXZjdy9TK201djJKMkhITWgr?=
 =?utf-8?B?eHFYeWFiblZtUTZ6b1B0TkdxUllCemFoQlNhSy81cFRtWmJESUw4Y3RudFJ1?=
 =?utf-8?B?enZsRUV3Zk5mYlBQbDJ6OGJ4cVdoMnpFem1kblltcmpnbFoxUWUycVdwdVRH?=
 =?utf-8?B?MWRVeXhVY044NVdFeENLS1dxZ0hieHF2aWRPVFlyV28vc1doNVJQSjhWSkx2?=
 =?utf-8?B?clprNUJGK3RBQU1QWlBnYmQ1NjdIaVFFWElJYW5LdlBDUERRVStacHlLMVBM?=
 =?utf-8?B?dmRzZmd2UDR6NVJ5VVZkYzdwdHE5dDl2SGhKeXMxWk04WUJBVm1Md3ByQjBT?=
 =?utf-8?B?MVNEclc2ZFpvcHdmKy9FSnlNMDFiNlVEU1M0OTlBcklOMXdVbEtzOGY1NGd3?=
 =?utf-8?B?YnFPbGdTbVo5NmNRZHpKV2RRYlpkSkZGcW9jSUxDOXZoSm0xNHE4RGJBRzQ2?=
 =?utf-8?B?WUVsVnQ0cnFQc09RMWltODRGMlRySFlhS3NLeEZlVHFEY3pZZzB2WFlSbzNY?=
 =?utf-8?B?UWZHdDhtbmZhN0pzR3YvdUZ4NUJvcFl2VXdDbzFPSlk1UVBWTWE0SENEbDdN?=
 =?utf-8?B?b0pDM01xajE3UlZreGRjVWFVRGE4ZlZHWUkydnFWRlNkUU9scXJSMXc0RzNI?=
 =?utf-8?B?NklQVnJYM29BL2pPTHJCNUEvTXpmRmtkcm9VclFSekZ2V21LY0JOdVBYNWh4?=
 =?utf-8?B?MEh0MzZyeXFoQW5DNG90ckhVZ0U3ZnoyYjNtclRYRzh6ZkRoL2VNMTdNcWRO?=
 =?utf-8?B?L1BuTUk2aFFEUy8zZEx6QmRNalpnQWc0YUdlbTV6ZnVDbkxLTVAvcENIQmRk?=
 =?utf-8?B?SkJrUitnUUJrbVAzL2xZeHFicTNBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FC97BC8892E25418AA079B842E65AEC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9beacfc7-3094-437f-ded4-08ddeed3325a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 12:28:20.6282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yWP914vHNTpKAxMOXOUW5tV2c1p12gNDLykrKS7li2XWZXUWyY+H5xOO2KVQsWZw67F0SI19kashnJSj90+rAU9a6nmrzIEat8/872HtREA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7029
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

T24gRnJpLCAyMDI1LTA4LTI5IGF0IDIwOjQ2ICswMzAwLCBKYW5pIE5pa3VsYSB3cm90ZToNCj4g
TW92ZSB0aGUgcmFuZ2Vfb3ZlcmZsb3dzKCkgYW5kIHJhbmdlX2VuZF9vdmVyZmxvd3MoKSBhbG9u
ZyB3aXRoIHRoZQ0KPiBfdA0KPiB2YXJpYW50cyBvdmVyIGZyb20gZHJtL2k5MTUgYW5kIGRybS9i
dWRkeSB0byBvdmVyZmxvdy5oLg0KPiANCj4gQ2M6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3Jn
Pg0KPiBDYzogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPg0KPiBD
YzogbGludXgtaGFyZGVuaW5nQHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBKYW5p
IE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2
Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9n
cHUvZHJtL2k5MTUvaTkxNV91dGlscy5oIHwgNzAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gLS0NCj4gwqBpbmNsdWRlL2RybS9kcm1fYnVkZHkuaMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCA5IC0tLS0NCj4gwqBpbmNsdWRlL2xpbnV4L292ZXJmbG93LmjCoMKgwqDCoMKgwqDCoMKg
wqAgfCA3MA0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IMKgMyBmaWxlcyBj
aGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspLCA3OSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3V0aWxzLmgNCj4gYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X3V0aWxzLmgNCj4gaW5kZXggOTY4ZGFlOTQxNTMyLi5lYjRkNDNjNDAwMDkg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfdXRpbHMuaA0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3V0aWxzLmgNCj4gQEAgLTY3LDc2ICs2Nyw2IEBA
IGJvb2wgaTkxNV9lcnJvcl9pbmplY3RlZCh2b2lkKTsNCj4gwqAJCWRybV9lcnIoJihpOTE1KS0+
ZHJtLCBmbXQsICMjX19WQV9BUkdTX18pOyBcDQo+IMKgfSkNCj4gwqANCj4gLS8qKg0KPiAtICog
cmFuZ2Vfb3ZlcmZsb3dzKCkgLSBDaGVjayBpZiBhIHJhbmdlIGlzIG91dCBvZiBib3VuZHMNCj4g
LSAqIEBzdGFydDogU3RhcnQgb2YgdGhlIHJhbmdlLg0KPiAtICogQHNpemU6wqAgU2l6ZSBvZiB0
aGUgcmFuZ2UuDQo+IC0gKiBAbWF4OsKgwqAgRXhjbHVzaXZlIHVwcGVyIGJvdW5kYXJ5Lg0KPiAt
ICoNCj4gLSAqIEEgc3RyaWN0IGNoZWNrIHRvIGRldGVybWluZSBpZiB0aGUgcmFuZ2UgW0BzdGFy
dCwgQHN0YXJ0ICsgQHNpemUpDQo+IGlzDQo+IC0gKiBpbnZhbGlkIHdpdGggcmVzcGVjdCB0byB0
aGUgYWxsb3dhYmxlIHJhbmdlIFswLCBAbWF4KS4gQW55IHJhbmdlDQo+IC0gKiBzdGFydGluZyBh
dCBvciBiZXlvbmQgQG1heCBpcyBjb25zaWRlcmVkIGFuIG92ZXJmbG93LCBldmVuIGlmDQo+IEBz
aXplIGlzIDAuDQo+IC0gKg0KPiAtICogUmV0dXJuczogdHJ1ZSBpZiB0aGUgcmFuZ2UgaXMgb3V0
IG9mIGJvdW5kcy4NCj4gLSAqLw0KPiAtI2RlZmluZSByYW5nZV9vdmVyZmxvd3Moc3RhcnQsIHNp
emUsIG1heCkgKHsgXA0KPiAtCXR5cGVvZihzdGFydCkgc3RhcnRfXyA9IChzdGFydCk7IFwNCj4g
LQl0eXBlb2Yoc2l6ZSkgc2l6ZV9fID0gKHNpemUpOyBcDQo+IC0JdHlwZW9mKG1heCkgbWF4X18g
PSAobWF4KTsgXA0KPiAtCSh2b2lkKSgmc3RhcnRfXyA9PSAmc2l6ZV9fKTsgXA0KPiAtCSh2b2lk
KSgmc3RhcnRfXyA9PSAmbWF4X18pOyBcDQo+IC0Jc3RhcnRfXyA+PSBtYXhfXyB8fCBzaXplX18g
PiBtYXhfXyAtIHN0YXJ0X187IFwNCj4gLX0pDQo+IC0NCj4gLS8qKg0KPiAtICogcmFuZ2Vfb3Zl
cmZsb3dzX3QoKSAtIENoZWNrIGlmIGEgcmFuZ2UgaXMgb3V0IG9mIGJvdW5kcw0KPiAtICogQHR5
cGU6wqAgRGF0YSB0eXBlIHRvIHVzZS4NCj4gLSAqIEBzdGFydDogU3RhcnQgb2YgdGhlIHJhbmdl
Lg0KPiAtICogQHNpemU6wqAgU2l6ZSBvZiB0aGUgcmFuZ2UuDQo+IC0gKiBAbWF4OsKgwqAgRXhj
bHVzaXZlIHVwcGVyIGJvdW5kYXJ5Lg0KPiAtICoNCj4gLSAqIFNhbWUgYXMgcmFuZ2Vfb3ZlcmZs
b3dzKCkgYnV0IGZvcmNpbmcgdGhlIHBhcmFtZXRlcnMgdG8gQHR5cGUuDQo+IC0gKg0KPiAtICog
UmV0dXJuczogdHJ1ZSBpZiB0aGUgcmFuZ2UgaXMgb3V0IG9mIGJvdW5kcy4NCj4gLSAqLw0KPiAt
I2RlZmluZSByYW5nZV9vdmVyZmxvd3NfdCh0eXBlLCBzdGFydCwgc2l6ZSwgbWF4KSBcDQo+IC0J
cmFuZ2Vfb3ZlcmZsb3dzKCh0eXBlKShzdGFydCksICh0eXBlKShzaXplKSwgKHR5cGUpKG1heCkp
DQo+IC0NCj4gLS8qKg0KPiAtICogcmFuZ2VfZW5kX292ZXJmbG93cygpIC0gQ2hlY2sgaWYgYSBy
YW5nZSdzIGVuZHBvaW50IGlzIG91dCBvZg0KPiBib3VuZHMNCj4gLSAqIEBzdGFydDogU3RhcnQg
b2YgdGhlIHJhbmdlLg0KPiAtICogQHNpemU6wqAgU2l6ZSBvZiB0aGUgcmFuZ2UuDQo+IC0gKiBA
bWF4OsKgwqAgRXhjbHVzaXZlIHVwcGVyIGJvdW5kYXJ5Lg0KPiAtICoNCj4gLSAqIENoZWNrcyBv
bmx5IGlmIHRoZSBlbmRwb2ludCBvZiBhIHJhbmdlIChAc3RhcnQgKyBAc2l6ZSkgZXhjZWVkcw0K
PiBAbWF4Lg0KPiAtICogVW5saWtlIHJhbmdlX292ZXJmbG93cygpLCBhIHplcm8tc2l6ZWQgcmFu
Z2UgYXQgdGhlIGJvdW5kYXJ5DQo+IChAc3RhcnQgPT0gQG1heCkNCj4gLSAqIGlzIG5vdCBjb25z
aWRlcmVkIGFuIG92ZXJmbG93LiBVc2VmdWwgZm9yIGl0ZXJhdG9yLXN0eWxlIGNoZWNrcy4NCj4g
LSAqDQo+IC0gKiBSZXR1cm5zOiB0cnVlIGlmIHRoZSBlbmRwb2ludCBleGNlZWRzIHRoZSBib3Vu
ZGFyeS4NCj4gLSAqLw0KPiAtI2RlZmluZSByYW5nZV9lbmRfb3ZlcmZsb3dzKHN0YXJ0LCBzaXpl
LCBtYXgpICh7IFwNCj4gLQl0eXBlb2Yoc3RhcnQpIHN0YXJ0X18gPSAoc3RhcnQpOyBcDQo+IC0J
dHlwZW9mKHNpemUpIHNpemVfXyA9IChzaXplKTsgXA0KPiAtCXR5cGVvZihtYXgpIG1heF9fID0g
KG1heCk7IFwNCj4gLQkodm9pZCkoJnN0YXJ0X18gPT0gJnNpemVfXyk7IFwNCj4gLQkodm9pZCko
JnN0YXJ0X18gPT0gJm1heF9fKTsgXA0KPiAtCXN0YXJ0X18gPiBtYXhfXyB8fCBzaXplX18gPiBt
YXhfXyAtIHN0YXJ0X187IFwNCj4gLX0pDQo+IC0NCj4gLS8qKg0KPiAtICogcmFuZ2VfZW5kX292
ZXJmbG93c190KCkgLSBDaGVjayBpZiBhIHJhbmdlJ3MgZW5kcG9pbnQgaXMgb3V0IG9mDQo+IGJv
dW5kcw0KPiAtICogQHR5cGU6wqAgRGF0YSB0eXBlIHRvIHVzZS4NCj4gLSAqIEBzdGFydDogU3Rh
cnQgb2YgdGhlIHJhbmdlLg0KPiAtICogQHNpemU6wqAgU2l6ZSBvZiB0aGUgcmFuZ2UuDQo+IC0g
KiBAbWF4OsKgwqAgRXhjbHVzaXZlIHVwcGVyIGJvdW5kYXJ5Lg0KPiAtICoNCj4gLSAqIFNhbWUg
YXMgcmFuZ2VfZW5kX292ZXJmbG93cygpIGJ1dCBmb3JjaW5nIHRoZSBwYXJhbWV0ZXJzIHRvDQo+
IEB0eXBlLg0KPiAtICoNCj4gLSAqIFJldHVybnM6IHRydWUgaWYgdGhlIGVuZHBvaW50IGV4Y2Vl
ZHMgdGhlIGJvdW5kYXJ5Lg0KPiAtICovDQo+IC0jZGVmaW5lIHJhbmdlX2VuZF9vdmVyZmxvd3Nf
dCh0eXBlLCBzdGFydCwgc2l6ZSwgbWF4KSBcDQo+IC0JcmFuZ2VfZW5kX292ZXJmbG93cygodHlw
ZSkoc3RhcnQpLCAodHlwZSkoc2l6ZSksDQo+ICh0eXBlKShtYXgpKQ0KPiAtDQo+IMKgI2RlZmlu
ZSBwdHJfbWFza19iaXRzKHB0ciwgbikNCj4gKHsJCQkJCVwNCj4gwqAJdW5zaWduZWQgbG9uZyBf
X3YgPSAodW5zaWduZWQNCj4gbG9uZykocHRyKTsJCQlcDQo+IMKgCSh0eXBlb2YocHRyKSkoX192
ICYgLQ0KPiBCSVQobikpOwkJCQkJXA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2J1
ZGR5LmggYi9pbmNsdWRlL2RybS9kcm1fYnVkZHkuaA0KPiBpbmRleCA1MTM4Mzc2MzJiN2QuLjA0
YWZkN2MyMWE4MiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2J1ZGR5LmgNCj4gKysr
IGIvaW5jbHVkZS9kcm0vZHJtX2J1ZGR5LmgNCj4gQEAgLTEzLDE1ICsxMyw2IEBADQo+IMKgDQo+
IMKgI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4NCj4gwqANCj4gLSNkZWZpbmUgcmFuZ2Vfb3Zl
cmZsb3dzKHN0YXJ0LCBzaXplLCBtYXgpICh7IFwNCj4gLQl0eXBlb2Yoc3RhcnQpIHN0YXJ0X18g
PSAoc3RhcnQpOyBcDQo+IC0JdHlwZW9mKHNpemUpIHNpemVfXyA9IChzaXplKTsgXA0KPiAtCXR5
cGVvZihtYXgpIG1heF9fID0gKG1heCk7IFwNCj4gLQkodm9pZCkoJnN0YXJ0X18gPT0gJnNpemVf
Xyk7IFwNCj4gLQkodm9pZCkoJnN0YXJ0X18gPT0gJm1heF9fKTsgXA0KPiAtCXN0YXJ0X18gPj0g
bWF4X18gfHwgc2l6ZV9fID4gbWF4X18gLSBzdGFydF9fOyBcDQo+IC19KQ0KPiAtDQo+IMKgI2Rl
ZmluZSBEUk1fQlVERFlfUkFOR0VfQUxMT0NBVElPTgkJQklUKDApDQo+IMKgI2RlZmluZSBEUk1f
QlVERFlfVE9QRE9XTl9BTExPQ0FUSU9OCQlCSVQoMSkNCj4gwqAjZGVmaW5lIERSTV9CVUREWV9D
T05USUdVT1VTX0FMTE9DQVRJT04JCUJJVCgyKQ0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9vdmVyZmxvdy5oIGIvaW5jbHVkZS9saW51eC9vdmVyZmxvdy5oDQo+IGluZGV4IDE1NGVkMGRi
YjQzZi4uNzI1Zjk1ZjdlNDE2IDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L292ZXJmbG93
LmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9vdmVyZmxvdy5oDQo+IEBAIC0yMzgsNiArMjM4LDc2
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBfX211c3RfY2hlY2sNCj4gX19tdXN0X2NoZWNrX292ZXJm
bG93KGJvb2wgb3ZlcmZsb3cpDQo+IMKgCQkJwqDCoMKgwqDCoCBfX292ZXJmbG93c190eXBlX2Nv
bnN0ZXhwcihuLA0KPiBUKSwJXA0KPiDCoAkJCcKgwqDCoMKgwqAgX19vdmVyZmxvd3NfdHlwZShu
LCBUKSkNCj4gwqANCj4gKy8qKg0KPiArICogcmFuZ2Vfb3ZlcmZsb3dzKCkgLSBDaGVjayBpZiBh
IHJhbmdlIGlzIG91dCBvZiBib3VuZHMNCj4gKyAqIEBzdGFydDogU3RhcnQgb2YgdGhlIHJhbmdl
Lg0KPiArICogQHNpemU6wqAgU2l6ZSBvZiB0aGUgcmFuZ2UuDQo+ICsgKiBAbWF4OsKgwqAgRXhj
bHVzaXZlIHVwcGVyIGJvdW5kYXJ5Lg0KPiArICoNCj4gKyAqIEEgc3RyaWN0IGNoZWNrIHRvIGRl
dGVybWluZSBpZiB0aGUgcmFuZ2UgW0BzdGFydCwgQHN0YXJ0ICsgQHNpemUpDQo+IGlzDQo+ICsg
KiBpbnZhbGlkIHdpdGggcmVzcGVjdCB0byB0aGUgYWxsb3dhYmxlIHJhbmdlIFswLCBAbWF4KS4g
QW55IHJhbmdlDQo+ICsgKiBzdGFydGluZyBhdCBvciBiZXlvbmQgQG1heCBpcyBjb25zaWRlcmVk
IGFuIG92ZXJmbG93LCBldmVuIGlmDQo+IEBzaXplIGlzIDAuDQo+ICsgKg0KPiArICogUmV0dXJu
czogdHJ1ZSBpZiB0aGUgcmFuZ2UgaXMgb3V0IG9mIGJvdW5kcy4NCj4gKyAqLw0KPiArI2RlZmlu
ZSByYW5nZV9vdmVyZmxvd3Moc3RhcnQsIHNpemUsIG1heCkgKHsgXA0KPiArCXR5cGVvZihzdGFy
dCkgc3RhcnRfXyA9IChzdGFydCk7IFwNCj4gKwl0eXBlb2Yoc2l6ZSkgc2l6ZV9fID0gKHNpemUp
OyBcDQo+ICsJdHlwZW9mKG1heCkgbWF4X18gPSAobWF4KTsgXA0KPiArCSh2b2lkKSgmc3RhcnRf
XyA9PSAmc2l6ZV9fKTsgXA0KPiArCSh2b2lkKSgmc3RhcnRfXyA9PSAmbWF4X18pOyBcDQo+ICsJ
c3RhcnRfXyA+PSBtYXhfXyB8fCBzaXplX18gPiBtYXhfXyAtIHN0YXJ0X187IFwNCj4gK30pDQo+
ICsNCj4gKy8qKg0KPiArICogcmFuZ2Vfb3ZlcmZsb3dzX3QoKSAtIENoZWNrIGlmIGEgcmFuZ2Ug
aXMgb3V0IG9mIGJvdW5kcw0KPiArICogQHR5cGU6wqAgRGF0YSB0eXBlIHRvIHVzZS4NCj4gKyAq
IEBzdGFydDogU3RhcnQgb2YgdGhlIHJhbmdlLg0KPiArICogQHNpemU6wqAgU2l6ZSBvZiB0aGUg
cmFuZ2UuDQo+ICsgKiBAbWF4OsKgwqAgRXhjbHVzaXZlIHVwcGVyIGJvdW5kYXJ5Lg0KPiArICoN
Cj4gKyAqIFNhbWUgYXMgcmFuZ2Vfb3ZlcmZsb3dzKCkgYnV0IGZvcmNpbmcgdGhlIHBhcmFtZXRl
cnMgdG8gQHR5cGUuDQo+ICsgKg0KPiArICogUmV0dXJuczogdHJ1ZSBpZiB0aGUgcmFuZ2UgaXMg
b3V0IG9mIGJvdW5kcy4NCj4gKyAqLw0KPiArI2RlZmluZSByYW5nZV9vdmVyZmxvd3NfdCh0eXBl
LCBzdGFydCwgc2l6ZSwgbWF4KSBcDQo+ICsJcmFuZ2Vfb3ZlcmZsb3dzKCh0eXBlKShzdGFydCks
ICh0eXBlKShzaXplKSwgKHR5cGUpKG1heCkpDQo+ICsNCj4gKy8qKg0KPiArICogcmFuZ2VfZW5k
X292ZXJmbG93cygpIC0gQ2hlY2sgaWYgYSByYW5nZSdzIGVuZHBvaW50IGlzIG91dCBvZg0KPiBi
b3VuZHMNCj4gKyAqIEBzdGFydDogU3RhcnQgb2YgdGhlIHJhbmdlLg0KPiArICogQHNpemU6wqAg
U2l6ZSBvZiB0aGUgcmFuZ2UuDQo+ICsgKiBAbWF4OsKgwqAgRXhjbHVzaXZlIHVwcGVyIGJvdW5k
YXJ5Lg0KPiArICoNCj4gKyAqIENoZWNrcyBvbmx5IGlmIHRoZSBlbmRwb2ludCBvZiBhIHJhbmdl
IChAc3RhcnQgKyBAc2l6ZSkgZXhjZWVkcw0KPiBAbWF4Lg0KPiArICogVW5saWtlIHJhbmdlX292
ZXJmbG93cygpLCBhIHplcm8tc2l6ZWQgcmFuZ2UgYXQgdGhlIGJvdW5kYXJ5DQo+IChAc3RhcnQg
PT0gQG1heCkNCj4gKyAqIGlzIG5vdCBjb25zaWRlcmVkIGFuIG92ZXJmbG93LiBVc2VmdWwgZm9y
IGl0ZXJhdG9yLXN0eWxlIGNoZWNrcy4NCj4gKyAqDQo+ICsgKiBSZXR1cm5zOiB0cnVlIGlmIHRo
ZSBlbmRwb2ludCBleGNlZWRzIHRoZSBib3VuZGFyeS4NCj4gKyAqLw0KPiArI2RlZmluZSByYW5n
ZV9lbmRfb3ZlcmZsb3dzKHN0YXJ0LCBzaXplLCBtYXgpICh7IFwNCj4gKwl0eXBlb2Yoc3RhcnQp
IHN0YXJ0X18gPSAoc3RhcnQpOyBcDQo+ICsJdHlwZW9mKHNpemUpIHNpemVfXyA9IChzaXplKTsg
XA0KPiArCXR5cGVvZihtYXgpIG1heF9fID0gKG1heCk7IFwNCj4gKwkodm9pZCkoJnN0YXJ0X18g
PT0gJnNpemVfXyk7IFwNCj4gKwkodm9pZCkoJnN0YXJ0X18gPT0gJm1heF9fKTsgXA0KPiArCXN0
YXJ0X18gPiBtYXhfXyB8fCBzaXplX18gPiBtYXhfXyAtIHN0YXJ0X187IFwNCj4gK30pDQo+ICsN
Cj4gKy8qKg0KPiArICogcmFuZ2VfZW5kX292ZXJmbG93c190KCkgLSBDaGVjayBpZiBhIHJhbmdl
J3MgZW5kcG9pbnQgaXMgb3V0IG9mDQo+IGJvdW5kcw0KPiArICogQHR5cGU6wqAgRGF0YSB0eXBl
IHRvIHVzZS4NCj4gKyAqIEBzdGFydDogU3RhcnQgb2YgdGhlIHJhbmdlLg0KPiArICogQHNpemU6
wqAgU2l6ZSBvZiB0aGUgcmFuZ2UuDQo+ICsgKiBAbWF4OsKgwqAgRXhjbHVzaXZlIHVwcGVyIGJv
dW5kYXJ5Lg0KPiArICoNCj4gKyAqIFNhbWUgYXMgcmFuZ2VfZW5kX292ZXJmbG93cygpIGJ1dCBm
b3JjaW5nIHRoZSBwYXJhbWV0ZXJzIHRvDQo+IEB0eXBlLg0KPiArICoNCj4gKyAqIFJldHVybnM6
IHRydWUgaWYgdGhlIGVuZHBvaW50IGV4Y2VlZHMgdGhlIGJvdW5kYXJ5Lg0KPiArICovDQo+ICsj
ZGVmaW5lIHJhbmdlX2VuZF9vdmVyZmxvd3NfdCh0eXBlLCBzdGFydCwgc2l6ZSwgbWF4KSBcDQo+
ICsJcmFuZ2VfZW5kX292ZXJmbG93cygodHlwZSkoc3RhcnQpLCAodHlwZSkoc2l6ZSksDQo+ICh0
eXBlKShtYXgpKQ0KPiArDQo+IMKgLyoqDQo+IMKgICogY2FzdGFibGVfdG9fdHlwZSAtIGxpa2Ug
X19zYW1lX3R5cGUoKSwgYnV0IGFsc28gYWxsb3dzIGZvciBjYXN0ZWQNCj4gbGl0ZXJhbHMNCj4g
wqAgKg0KDQo=
