Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87744B48D76
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C258D10E501;
	Mon,  8 Sep 2025 12:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m+as50H0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045D310E4FF;
 Mon,  8 Sep 2025 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757334471; x=1788870471;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=efWaSga/0OpyO2XUDDB41GFAVRcaiOU8eOK3765awV4=;
 b=m+as50H0NsNB2kzFDQ/c+vTX7MhZj08GMuwksspJiRfUhyJ6mLFfNlWF
 gZoi00vV+NMPUECRIGtZiis+4RprxMJGhGg2IxAcWfsm1O5H6u7CMjjJo
 kzTxfOqJA9QLnlylPlziGxWpYk2elxmTX1E8+H7jhQRwNmM75HYGAohrs
 NAWw3F4LGx/NeYCr71Uh3nSbgCewuxaISStL8wzRRVggq8MMEPKXc2opO
 yhA5Ou7z+EvqAWXPGcxiMEAdJA9zKp8xkiG74O+U7eOGaNXIUp1tifMnh
 hmpIJqN2J3n/NIa092XBt7TqsuoYvvKZy2EqtanxFXCqNtHVbmOVQeaD6 g==;
X-CSE-ConnectionGUID: /qb37wFuR8K/EemDbC24rg==
X-CSE-MsgGUID: RhclGehtQwCxc3c2vd5Jew==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="70207368"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="70207368"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:27:50 -0700
X-CSE-ConnectionGUID: 3/n2VmNFSHydlyTjBTcA4A==
X-CSE-MsgGUID: dXQn/207Sj6QCyXEeWoxPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172702463"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 05:27:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 05:27:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 8 Sep 2025 05:27:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.76)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 8 Sep 2025 05:27:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEknpmo0bdypO0o9cXmvJx3K05/bu1YYpn9l2iYxwhyOWARUNYqCPsA4UE9qrcX4KkrJ5A5GwYYHzNC41PPNhs3e2zWNYTjt4gmNHtQgaX/6q23+Q9hdiaIUr582ruhJOFNk8/JjQVBbj22T6Pn7UKE9IymO5f5rOVFjG+alLzXSHhy3mfizHTFklJKV8xbE3O9etKzAjS9CmmwbMGcysEBfp1JwQC4a4lmLi83WTbS8XtSV55ApVX8DzYx2h8TKZFTn93ktWSUi9n2yp7uTUBO2xfb09WmDW2BLEwErdqLb7jRF8ZIzsPI+gCUiFqx7iG5uuP8Av5yc8Wunz4SV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efWaSga/0OpyO2XUDDB41GFAVRcaiOU8eOK3765awV4=;
 b=ufT14P8FiM+qXs80K5m0u+RnYva10zn42Ln/1hFSyuhmXIYhPmATbKQySRPTSzgDaPBHjD+NuJmA+7GoAu/cfYvsKtoW0nlyR/0i9lKCwdIIqJ6ja1ehxIcKVlm4ONuDbKvHIdLwSampm/xojBH/Qqj+mhExzW8MUaGlbfpnxiOwhxhpX7dtVYXybkXnSsQ9AZqerquPHdnEsHc1En9ZYvGQn3eL7K/qnGPiIbj63tBPM0Mk9n2boPjyQ8dPFJd9hX6gYYeBiZo+K2tNu8sGgCc669ZFHZj7a6jI7wyMK/QvSAdtZwTMEILgHOAUxvuFg1FzWLFYcoYE+ro2k1A5Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW4PR11MB7029.namprd11.prod.outlook.com (2603:10b6:303:22e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 12:27:47 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%5]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 12:27:47 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "kees@kernel.org" <kees@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hardening@vger.kernel.org"
 <linux-hardening@vger.kernel.org>, "gustavoars@kernel.org"
 <gustavoars@kernel.org>
Subject: Re: [PATCH 2/3] drm/i915: document range_overflows() and
 range_end_overflows() macros
Thread-Topic: [PATCH 2/3] drm/i915: document range_overflows() and
 range_end_overflows() macros
Thread-Index: AQHcGQzpsimbVwxcqUevYGAwop40CbSJRduA
Date: Mon, 8 Sep 2025 12:27:46 +0000
Message-ID: <a9336d8418ad95cdf3724bc027aa938371ea6312.camel@intel.com>
References: <20250829174601.2163064-1-jani.nikula@intel.com>
 <20250829174601.2163064-2-jani.nikula@intel.com>
In-Reply-To: <20250829174601.2163064-2-jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW4PR11MB7029:EE_
x-ms-office365-filtering-correlation-id: e1dae546-a09c-40e2-2833-08ddeed31e3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UGpQdVcxNzJ1QXlmeGpLM01OK2NnME50NEQ1VVBlMFFQVnVvbGV4Tm80NWNw?=
 =?utf-8?B?aU05SERjMFJTNm11eVJnbVhJYjVEL0FyVURNdVdaWE5GbHhmTFdsQWdqR25s?=
 =?utf-8?B?THZ3azMwVld3QTF3ZExKblhUcmVkTWVleUxXMjMxWjZxRGVOZTBOYWswYUsz?=
 =?utf-8?B?RitVZ3ZqS01VaXJrbVVDN2t3TXdoTE5SeUNuVzlybHJuWW9vZDlHL3JldHlv?=
 =?utf-8?B?ekQydmlnWW10RHVIOTFhQU00Uyt3bFQ5UUZEWHFDV0hVZXlrby9DaTBZM3RD?=
 =?utf-8?B?eVQ4a2FIZENIeXNjNU4yMEdEVG5YeUJhZndndXYwdGJUTCsrVGtSRTFod282?=
 =?utf-8?B?YXd3VlZSUzkzNHlIZXB2Ky8zd3lZZFltbWE3V1F3ZjlqazAvczFVcExaNDJT?=
 =?utf-8?B?NzRwQzFlVGtuVUFIcERjNkdiZGcwMTIwakpXTWpHQXY5MGlMNEdJUG1wQ29W?=
 =?utf-8?B?QUdZdFRsSXBYdS9NUWRKbXYyWmVxN1RtMFdCN1NKWk1ZRHAwdExIMFVyRFZ3?=
 =?utf-8?B?ZERUUzZOM0prYlN2WmxYTTJ6cEY3Z0s5VFVEajFmTXRwRWlVbkZoeTBySnBt?=
 =?utf-8?B?ZXhoRFU0K254WVFaRGlmS3pwRFVFWUJUdWQxUFFtWFlaUlYwakM0N2JWeHI4?=
 =?utf-8?B?OGFndUYzZG5ZaUszb1AwalBSRm9FbGRnRFhJdzBXcEFDR1Foc3ZwclNNSzdF?=
 =?utf-8?B?cGdvSDBXMTFmMHlxWVFXMnBhSWpPd2d5dFhqbGt5L0FZVzVXUFJ2N1pVVlB0?=
 =?utf-8?B?K2p0L1RTNW54bTdYWHlGWUYxdXF5RVpYNStXeXgwMG00aHVUaGVlOHRjK2Mz?=
 =?utf-8?B?S2Nvb1dIcFNTR3F3NEFnUFhwMVI3a05JSEhYUllTZnFuZWp2ekk5ZUNFdVpl?=
 =?utf-8?B?ejhjb0pxVGNIL0t2d1JpU0tTcVdwM0JoTktXUjRYVVA0UHZaWTFRVnZjTXZE?=
 =?utf-8?B?Q2ozdDYyUGJBQkFsMHZVSG1BTTVuKzl2VXpsd3A3SDNqTWtjUlVlSmVSMkhu?=
 =?utf-8?B?OU93bzhDcHBZWmhISkJCS1QwMWdYR1REVGZNYUpFOHZXRjM3ek9maXZ3NGRD?=
 =?utf-8?B?Qzl4WkpvQTVpYWhUVjJaOUZDWUNOMTMwK3FzNXRzeWEzcTR2YVd0dG96c2VI?=
 =?utf-8?B?VE1HNU1Va2tQdy9TcnVSTFcrUmwvblJ0WVAzZG9FUXVtOFE2MXJSNW5pdW9V?=
 =?utf-8?B?Y2VNNTNFSDZXaEg0YnlDaGswM2xycnl6SVlWT0g4RWVIUlZVa1UrMllta044?=
 =?utf-8?B?bE1BODRvUGxDY2RrQ3BXRzdBZDRWQUZMUjdRZG84TkxtUjcrK0syWW1zM2dE?=
 =?utf-8?B?Z09ZMnIvcVJsVytvT001WE9lYzEwOVdJZ1lITUdIMVhZT0h6N3Y1NWllaDdk?=
 =?utf-8?B?ekRRVFhQVEszdXF4MTVGWTA1MUVybjEwbXltbkFRWWNRRUZqQnRRbVNZaWww?=
 =?utf-8?B?NFR0WHJYamZ4Zkl2RlpvU3lWcVE5MjZmcHl0dXJsaXRxdEtMaEtaa3Q4cFRX?=
 =?utf-8?B?WnpxdnNvV2xKbjdpMkNMK2ZvZ2RkQXh0aThEZWtMcUxQb0FjdXV6WUlIaHlY?=
 =?utf-8?B?YnRVOGJGWXdNZFlhUkk3MGNreW1oanFnQjdQa2RNREQ3dHJ6YXZOQ3M2MzFM?=
 =?utf-8?B?ZzN4VkwrenRwSWRuR3pqUEJWeXlsKzBxTlZrQ20yazhMQ0FmVnZGRVRvb2hP?=
 =?utf-8?B?dlJuN3Jad2x0WGg4VGJGaVIyZ0dKYnNIR2lDNWRldko4TXFoK2F3M2s1SnNn?=
 =?utf-8?B?cU9jaWJkUXk0RlVmVmExdjhEaERvb0lGd20wTUxBSmJmTUxsYzlyT05Td294?=
 =?utf-8?B?dkZadGZrNDFuQW9ia0hFcnhHN0tBd0ZBSnhEemZRSHB0UGJQdUNhdTNXQlBt?=
 =?utf-8?B?QnhjRVVMTlRsbUlkVVpyb3JURXdtSVF2a1h6bDlMcTduWXdsanp0bmhRVEJN?=
 =?utf-8?B?NWQ4T3UxcEdGVGxuelltNCt5OUZXV0w4V1hkSXcyRFhBODRzcWRqamJQN2lr?=
 =?utf-8?B?M0xJc3gxQmpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UWc5UmR5QVFYVHhiY096OHR0cm9oUXc0M1JHYmQ2dHZWQURiY010dG01eE9C?=
 =?utf-8?B?Tmh5dFhTUEl4MXBrVjVITmk0aWxLTmtVRzRGZVgzTDc0WkdTYUw5NmhjUVE4?=
 =?utf-8?B?U3RLOWNYWVAwYnk4RWoveTlRY1lCY3VOUjBFZzllTUM2b0FyWkV3cHlBRXZ1?=
 =?utf-8?B?eURPbXNuMHFDMUFRQ0x4K1lNajNZYkxrY2VFbkZrNXlFRXN4WEV4WENkWDF6?=
 =?utf-8?B?K1VlUDA0ZlA1QWxBTTE3R3NzRUVHM1JQTjExR0RGNjYyY3VoR1VwUmw1dmh2?=
 =?utf-8?B?L0FwaGh5NlpaRnFyYkIvZTQwd2RUdExTa2ppTlNhM00vcWJVbUZ0alFUT09z?=
 =?utf-8?B?S3RzTWV2bnlOd2tsd0tkb0J1Z0tNd3JoNURlMWF3bUxZSHE2TWFTdGVWT0NP?=
 =?utf-8?B?bHJZWi92VStFaFVJOWNYeFRlOFNFWnZKdWl0Z3UxWi9VYW90QTVaa0J2dStL?=
 =?utf-8?B?RzdFRXhuWVQzMkt0Ui84aEJCc0ZEUkxvQkFDMXlOaHFYSGhud1VNNk9mczVl?=
 =?utf-8?B?bEZnOWk5VU1PMjY4bXF6YSs1WXBmNDdVZFczQVFkY1JneDU0R0dBRWdyS3ls?=
 =?utf-8?B?SjVJVkxPREl2b0FNR1l0WEdNUzYvUE5GTnJuWnlwSWw0Z3lmM0d6Z2NjVHl3?=
 =?utf-8?B?UTQyVTNrOW5ZVi9YMTluWW1QWm14YXdYMHpTL05mMDByb0JZL3RsVGgzcXBB?=
 =?utf-8?B?dkdrdTRkNzU0bEtEQmMyc0RtVTUrczZpU0FGa2ZhVmswOTRDNHBrYTNsUEdC?=
 =?utf-8?B?VGdYRUY5dURMZGVNNEl5dnZTWlluWTREZWNPSG5kVHd3dmVQcHR0SG1nYW9J?=
 =?utf-8?B?aHVldUZDOFVJbnBORFZOczdwOHNlUVhZSnMrQi83dW0yUHorTGdoalJyQnY5?=
 =?utf-8?B?SGxQbE56WmlOeDJIN0x2d2htbjVYdnF4MnE4NTk5VkEyQUZIL3hlTlJqUDVQ?=
 =?utf-8?B?RU9kVElGVjhsU2pnMkQwVXNvY255ODZDRDZsZ2ZWcVl5OGFUbnNNeW5kaE82?=
 =?utf-8?B?MmtNeGtCbjE5ZXgzMURSVnpKNEJxN3VnWWxGUEljQnFRNUtxaGovaVp3bDlG?=
 =?utf-8?B?M1l6bXNDd2RycWNmbGNzZytRVmpCelBLbzVkajZaVms0TEdraUVRZmRxTUd3?=
 =?utf-8?B?NHpsNWJmY1JyODJ5V0J1ckQ4bmtnQ25mM2QxYThuRjB6bjg0MndPa1k4a3hi?=
 =?utf-8?B?a05LdnNpSWxFTFF4K1RGY1hISlNHekkzVHZuYXRjMitOYU43Y1JwOTRLc1lj?=
 =?utf-8?B?azIxcGJpb1dQamFGamd4akdnT3NPYVYzRjVjdGh4bGtRWUNTRVpUYVVFTnNn?=
 =?utf-8?B?UGpUQmYxQjFPR0xSb0hwUUVlZnB4TG9vRXhhSWJjTkNhVFFMTFRZWXlWZlhp?=
 =?utf-8?B?Q3EwUThGWUlKUSttQ2I2emFsQkdEeUppUTRneXEyWWNRRGtxM1UzaS9kYkhW?=
 =?utf-8?B?QUdaUXp5V1NvV2RYK0NpY2RkZEhhNXhxQzBBZmlHb2tTK3M4Rk5qR0JqL2ha?=
 =?utf-8?B?d0ZuV1lPa0JpNEQ5blVWcG5ETDA2aUh5amJNT29OSHZXNkRDbG1wQWRyclVl?=
 =?utf-8?B?Y2xwMjJzcDhsMzN0bTJaWVFMWDN2SXdWVVoxOTZVTlBjVDZBTXgzRWFEbDlS?=
 =?utf-8?B?VlRHYThwbzZHclcwaTh6MXNKT1V3TFJwSDZ4TWlQVFRoL0p5eFJhcUtkSlps?=
 =?utf-8?B?UnB1Zi9RbDhPM3FBYytaOWZXb21oOGdxVGUyVmp0VkVkbEpWcnhpUkZObHAx?=
 =?utf-8?B?dklIbTgwSE1Cb2xtSmY0MjFwM0dvRW9RNVorUWxONmMxSm5KanhDL2hmQ3ZK?=
 =?utf-8?B?Y3Z4ZHo2eFFMaHJIQWlJMjlaeTJJQ3N0WktiWW5xdnFVZm1DUFcwb1VRQlNN?=
 =?utf-8?B?dEZMM3FwcHR6WWtzRWVoV3VVTGcxWUlLckw3TmZBVmxETUJzcHJjbEo2UDgw?=
 =?utf-8?B?emhOdTRuSkJVRjdFRis5dFZibm9rM1RlTG5JUWdZbzRNVVBVUk40ZXowZmdw?=
 =?utf-8?B?WHh0cW1nbnZCMFY5dnV4bVZDSGNXeWhwWFJlaUJ6aWlmS3FQSy9nLzVtVFps?=
 =?utf-8?B?NlJlUThrQUxsa3Q0MXIrSGRGMlR3MVM4UnJQa0tKYUhnUUk2OFRkQVRzVC9Q?=
 =?utf-8?B?VkZLSnJmdW11VXdXQytTc2pBTTVWN09JRjdacUkrMGg3cm1CQVl0Q0o4MndB?=
 =?utf-8?B?QnJuMHBHeVpjNEVCbW1Qd2lFdzdHeHJaTTZWcFdDRXdKL3JWL3E1MDVWeEV0?=
 =?utf-8?B?cll4QnFPN2FwcVI1WGFPTDdIdlFRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED88097FA180EE488BF8C0291BB2DD9D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1dae546-a09c-40e2-2833-08ddeed31e3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2025 12:27:46.9388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RP0VMLmh64gNTC7svoqt5eIzOLSS62Mxfnu0z//YfYFkuLR0kQXJPBoNohbmYjfwnO3esP6I0dmCx/KgHQitqcPoP14VNiCYjupkrwvYEMU=
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
RG9jdW1lbnQgdGhlIG1hY3JvcyBpbiBwcmVwYXJhdGlvbiBmb3IgbWFraW5nIHRoZW0gbW9yZSBn
ZW5lcmFsbHkNCj4gYXZhaWxhYmxlLg0KPiANCj4gQ2M6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPg0KPiBDYzogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPg0K
PiBDYzogbGludXgtaGFyZGVuaW5nQHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBK
YW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1ieTogSm91bmkg
SMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IMKgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV91dGlscy5oIHwgNDYNCj4gKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV91dGlscy5oDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvaTkxNV91dGlscy5oDQo+IGluZGV4IGZkYWM5YTE1OGI1My4uOTY4ZGFl
OTQxNTMyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3V0aWxzLmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV91dGlscy5oDQo+IEBAIC02Nyw2ICs2
NywxOCBAQCBib29sIGk5MTVfZXJyb3JfaW5qZWN0ZWQodm9pZCk7DQo+IMKgCQlkcm1fZXJyKCYo
aTkxNSktPmRybSwgZm10LCAjI19fVkFfQVJHU19fKTsgXA0KPiDCoH0pDQo+IMKgDQo+ICsvKioN
Cj4gKyAqIHJhbmdlX292ZXJmbG93cygpIC0gQ2hlY2sgaWYgYSByYW5nZSBpcyBvdXQgb2YgYm91
bmRzDQo+ICsgKiBAc3RhcnQ6IFN0YXJ0IG9mIHRoZSByYW5nZS4NCj4gKyAqIEBzaXplOsKgIFNp
emUgb2YgdGhlIHJhbmdlLg0KPiArICogQG1heDrCoMKgIEV4Y2x1c2l2ZSB1cHBlciBib3VuZGFy
eS4NCj4gKyAqDQo+ICsgKiBBIHN0cmljdCBjaGVjayB0byBkZXRlcm1pbmUgaWYgdGhlIHJhbmdl
IFtAc3RhcnQsIEBzdGFydCArIEBzaXplKQ0KPiBpcw0KPiArICogaW52YWxpZCB3aXRoIHJlc3Bl
Y3QgdG8gdGhlIGFsbG93YWJsZSByYW5nZSBbMCwgQG1heCkuIEFueSByYW5nZQ0KPiArICogc3Rh
cnRpbmcgYXQgb3IgYmV5b25kIEBtYXggaXMgY29uc2lkZXJlZCBhbiBvdmVyZmxvdywgZXZlbiBp
Zg0KPiBAc2l6ZSBpcyAwLg0KPiArICoNCj4gKyAqIFJldHVybnM6IHRydWUgaWYgdGhlIHJhbmdl
IGlzIG91dCBvZiBib3VuZHMuDQo+ICsgKi8NCj4gwqAjZGVmaW5lIHJhbmdlX292ZXJmbG93cyhz
dGFydCwgc2l6ZSwgbWF4KSAoeyBcDQo+IMKgCXR5cGVvZihzdGFydCkgc3RhcnRfXyA9IChzdGFy
dCk7IFwNCj4gwqAJdHlwZW9mKHNpemUpIHNpemVfXyA9IChzaXplKTsgXA0KPiBAQCAtNzYsOSAr
ODgsMzIgQEAgYm9vbCBpOTE1X2Vycm9yX2luamVjdGVkKHZvaWQpOw0KPiDCoAlzdGFydF9fID49
IG1heF9fIHx8IHNpemVfXyA+IG1heF9fIC0gc3RhcnRfXzsgXA0KPiDCoH0pDQo+IMKgDQo+ICsv
KioNCj4gKyAqIHJhbmdlX292ZXJmbG93c190KCkgLSBDaGVjayBpZiBhIHJhbmdlIGlzIG91dCBv
ZiBib3VuZHMNCj4gKyAqIEB0eXBlOsKgIERhdGEgdHlwZSB0byB1c2UuDQo+ICsgKiBAc3RhcnQ6
IFN0YXJ0IG9mIHRoZSByYW5nZS4NCj4gKyAqIEBzaXplOsKgIFNpemUgb2YgdGhlIHJhbmdlLg0K
PiArICogQG1heDrCoMKgIEV4Y2x1c2l2ZSB1cHBlciBib3VuZGFyeS4NCj4gKyAqDQo+ICsgKiBT
YW1lIGFzIHJhbmdlX292ZXJmbG93cygpIGJ1dCBmb3JjaW5nIHRoZSBwYXJhbWV0ZXJzIHRvIEB0
eXBlLg0KPiArICoNCj4gKyAqIFJldHVybnM6IHRydWUgaWYgdGhlIHJhbmdlIGlzIG91dCBvZiBi
b3VuZHMuDQo+ICsgKi8NCj4gwqAjZGVmaW5lIHJhbmdlX292ZXJmbG93c190KHR5cGUsIHN0YXJ0
LCBzaXplLCBtYXgpIFwNCj4gwqAJcmFuZ2Vfb3ZlcmZsb3dzKCh0eXBlKShzdGFydCksICh0eXBl
KShzaXplKSwgKHR5cGUpKG1heCkpDQo+IMKgDQo+ICsvKioNCj4gKyAqIHJhbmdlX2VuZF9vdmVy
Zmxvd3MoKSAtIENoZWNrIGlmIGEgcmFuZ2UncyBlbmRwb2ludCBpcyBvdXQgb2YNCj4gYm91bmRz
DQo+ICsgKiBAc3RhcnQ6IFN0YXJ0IG9mIHRoZSByYW5nZS4NCj4gKyAqIEBzaXplOsKgIFNpemUg
b2YgdGhlIHJhbmdlLg0KPiArICogQG1heDrCoMKgIEV4Y2x1c2l2ZSB1cHBlciBib3VuZGFyeS4N
Cj4gKyAqDQo+ICsgKiBDaGVja3Mgb25seSBpZiB0aGUgZW5kcG9pbnQgb2YgYSByYW5nZSAoQHN0
YXJ0ICsgQHNpemUpIGV4Y2VlZHMNCj4gQG1heC4NCj4gKyAqIFVubGlrZSByYW5nZV9vdmVyZmxv
d3MoKSwgYSB6ZXJvLXNpemVkIHJhbmdlIGF0IHRoZSBib3VuZGFyeQ0KPiAoQHN0YXJ0ID09IEBt
YXgpDQo+ICsgKiBpcyBub3QgY29uc2lkZXJlZCBhbiBvdmVyZmxvdy4gVXNlZnVsIGZvciBpdGVy
YXRvci1zdHlsZSBjaGVja3MuDQo+ICsgKg0KPiArICogUmV0dXJuczogdHJ1ZSBpZiB0aGUgZW5k
cG9pbnQgZXhjZWVkcyB0aGUgYm91bmRhcnkuDQo+ICsgKi8NCj4gwqAjZGVmaW5lIHJhbmdlX2Vu
ZF9vdmVyZmxvd3Moc3RhcnQsIHNpemUsIG1heCkgKHsgXA0KPiDCoAl0eXBlb2Yoc3RhcnQpIHN0
YXJ0X18gPSAoc3RhcnQpOyBcDQo+IMKgCXR5cGVvZihzaXplKSBzaXplX18gPSAoc2l6ZSk7IFwN
Cj4gQEAgLTg4LDYgKzEyMywxNyBAQCBib29sIGk5MTVfZXJyb3JfaW5qZWN0ZWQodm9pZCk7DQo+
IMKgCXN0YXJ0X18gPiBtYXhfXyB8fCBzaXplX18gPiBtYXhfXyAtIHN0YXJ0X187IFwNCj4gwqB9
KQ0KPiDCoA0KPiArLyoqDQo+ICsgKiByYW5nZV9lbmRfb3ZlcmZsb3dzX3QoKSAtIENoZWNrIGlm
IGEgcmFuZ2UncyBlbmRwb2ludCBpcyBvdXQgb2YNCj4gYm91bmRzDQo+ICsgKiBAdHlwZTrCoCBE
YXRhIHR5cGUgdG8gdXNlLg0KPiArICogQHN0YXJ0OiBTdGFydCBvZiB0aGUgcmFuZ2UuDQo+ICsg
KiBAc2l6ZTrCoCBTaXplIG9mIHRoZSByYW5nZS4NCj4gKyAqIEBtYXg6wqDCoCBFeGNsdXNpdmUg
dXBwZXIgYm91bmRhcnkuDQo+ICsgKg0KPiArICogU2FtZSBhcyByYW5nZV9lbmRfb3ZlcmZsb3dz
KCkgYnV0IGZvcmNpbmcgdGhlIHBhcmFtZXRlcnMgdG8NCj4gQHR5cGUuDQo+ICsgKg0KPiArICog
UmV0dXJuczogdHJ1ZSBpZiB0aGUgZW5kcG9pbnQgZXhjZWVkcyB0aGUgYm91bmRhcnkuDQo+ICsg
Ki8NCj4gwqAjZGVmaW5lIHJhbmdlX2VuZF9vdmVyZmxvd3NfdCh0eXBlLCBzdGFydCwgc2l6ZSwg
bWF4KSBcDQo+IMKgCXJhbmdlX2VuZF9vdmVyZmxvd3MoKHR5cGUpKHN0YXJ0KSwgKHR5cGUpKHNp
emUpLA0KPiAodHlwZSkobWF4KSkNCj4gwqANCg0K
