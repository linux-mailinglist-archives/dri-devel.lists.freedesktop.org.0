Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D889D32BF
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 04:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57F0610E157;
	Wed, 20 Nov 2024 03:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BoJQvd+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FE510E157
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 03:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732074296; x=1763610296;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B3fOKJDM8lhgcLPBzcWIhVWV7SIWL4ma6Ap/nNMlUHM=;
 b=BoJQvd+evZTev5rKTGgJ82l3Lp4Az4y3s9lmZbOCCtP2f3XnlH1YnS3j
 abCsKgVjZvs9yoQO1xhCfE4p0MLf+FbqbumGbGe8f81nuxoNW9LAWx8/Q
 9fN8pZqyY9RRVga84ckYbmUQszBzjGm1tjvldCy2NjU0uisgs7rxwHLqS
 8R3R4Wgf7QVogohJwfljI9vvhM2dIdkXLRdNcxemJCBG8xe7vaJtBPU6u
 BG09E2ZV6RT7ZJQ+9hg3RQpJcRncjm/2wuP9HEQHTrpKprSmWZNxUMk5f
 9lHE7/si9edkzmT0wfSzMbRWSwtV9N3srcahWblijMIs9qHFSsAG2zZur w==;
X-CSE-ConnectionGUID: IwRzitHzSsOeSL5OW1WGrg==
X-CSE-MsgGUID: V8ipr5jlSvuTJLIJTQQnSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="35787479"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="35787479"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 19:44:54 -0800
X-CSE-ConnectionGUID: YNI/ZqPIRta2SI6BQqeNXw==
X-CSE-MsgGUID: 3r/zsUmLQHyEvYPDoVGvog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; d="scan'208";a="89931742"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Nov 2024 19:44:51 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 19 Nov 2024 19:44:50 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 19 Nov 2024 19:44:50 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 19 Nov 2024 19:44:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L98T0YeRZ/w3EbGasXGAWff7WhHXM5fjM2TJOK0jcTPN00eB8nD9vQt+qluqvV5IeBtoIKeAInX/pXdk+zQeBYz8R8Q6nXjznjpLZECN77RFWLRhmuNJzk6oyseBpL4+lk7MFoI/KCBd6dSP7ZzIcU587rrnGalY8jgqm8qfMLULSN2CMxT1Ygdn5niltBvc/y2PhooZ+J38vnKee3RSWSjtFTzKAsPW2Z7lV/lpwiVLQ+T78slfurD9n1Kig0uuK2YXWwytsiXxcl6havwnSpfpkRUPATwR3WF3+WHxfbseK4iKOPo4CS6Yn6tJFnZja2wuQI7LmhynRaSZy4Khhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3fOKJDM8lhgcLPBzcWIhVWV7SIWL4ma6Ap/nNMlUHM=;
 b=hjBtmjxkK7WX58LDmHQX4P76PRsYMJLzmEh1ktSLqtEQbfjzYBFwXCNyeBqN47sG4QYTde/zIgRL06T33CdX9NjFQ5eKn6mJ97pzi4VLRnZlQNC/uOcqWR9PFZJ2Ymn14CRTsqvLm+qkBF5b+rVKjccmI3c8hW46W1PGnF0HpZk+RHBm2Em2faaTk9fkH1UjdNJYnlgU+P6IQmIB+ULeq4Jaa5ard4BOyscqY7upUkkTa19GOYXRGYikyeHR5hyXqiXnQkEQNv3xoVYYGEATha73XSUOUT+JOY3r3OEBwDCotHczQHJ6R5cCCSliT5sBNNOqStfz0+QBjuhqhq6jtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Wed, 20 Nov
 2024 03:44:47 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 03:44:46 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
Subject: RE: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Topic: [PATCH v2 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
Thread-Index: AQHa7TgPrcbKIkB680CVAbY2s3+7ybKQ+qcAgAEiG4CAAgTjAIABpIUwgAK8GwCABQI3cIAeUOCAgAErI0CAAZMJwIAAapgAgAD9CrA=
Date: Wed, 20 Nov 2024 03:44:46 +0000
Message-ID: <IA0PR11MB718531B09D692B0BCEE6F81DF8212@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
 <20240813035509.3360760-3-vivek.kasireddy@intel.com>
 <45fbbd65-7e97-41c3-898a-49b6fa65e27e@collabora.com>
 <IA0PR11MB7185625CF2B9E7635A0CF164F84C2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <071a239f-50fd-44f3-9283-3dc928edb389@collabora.com>
 <IA0PR11MB718548F4F8971C91FCA456CCF84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <4feda09d-7a5e-4db4-83f8-f75eb0566b4a@collabora.com>
 <IA0PR11MB7185C176AF07732D39AA4F86F84B2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <e336b9ef-c8f3-44c8-904f-42736f6ac481@collabora.com>
 <IA0PR11MB7185A20AA84175C4D44D44E3F8272@IA0PR11MB7185.namprd11.prod.outlook.com>
 <IA0PR11MB7185671D43889B076086940CF8202@IA0PR11MB7185.namprd11.prod.outlook.com>
 <666c6ce3-d713-48a8-af17-e8bc28956e38@collabora.com>
In-Reply-To: <666c6ce3-d713-48a8-af17-e8bc28956e38@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|CO1PR11MB5139:EE_
x-ms-office365-filtering-correlation-id: c28f6d75-12c8-4024-dfad-08dd0915ada2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V1ZsWFkwSmRIajNYYTAyRUw1Q0lRMGVBWEswTCtkcHFDTTA0dTVoMkF2Ujhn?=
 =?utf-8?B?SDJoczhMMFp5V3BuVmttQzdLRXhTOVlZS1kzUHhOY3k5MzBIUm51SmVTTDNH?=
 =?utf-8?B?RlRGc0lIMk8yTEtJV2IwZWlGMjFtbkpSck1SK2JzZXpWZlgzR0crWWwxZVBs?=
 =?utf-8?B?MWdRTzdrTm5nTjAxWmhRMmpnNDlWQVJTMTY3cmkzNlNyeFFEbFYwWExPUWNN?=
 =?utf-8?B?UkFiWG1mZlhKUXlXczYrTmtYa1dKTW9GZ0s4MDE0bzJPdHQwZW9hdzBuQVN1?=
 =?utf-8?B?ZXUwUkFoZWM0NUhuUXZ3L0p0NTAxWE1uOWdFY3B4QlFyZXhlb3ZtbjU4bEhX?=
 =?utf-8?B?RkVFOEdQSmwzVHppWXdjU3JQRWdCZ1RzUWdZazkzWlB0RGxHeXBjbVI1cUJq?=
 =?utf-8?B?cVFkMXBzUG5SN0tvV005V1hud3FsNlhJWE5HUE5BTWhSMVVVZ2tTbHZacDkr?=
 =?utf-8?B?blhFb2hxR0dLanlvd3dUdURGb3ZPajF6c3F5L1UzelF2TjlSQ0VqL0tzSmFR?=
 =?utf-8?B?OEkrLzE2bllWNWs1eUdrYUpBTnphaU91ekpINXkxa29scnNJVitXN3ZpZ2xs?=
 =?utf-8?B?UkxoM1FuMDVudFkwSEVkS01wdWdPVFpCVnhudDEzUEVZbTV4QVNWMDJRZ2dW?=
 =?utf-8?B?YnRWdE1DZFRLQkNoRDRRcElYZ0d4UDBGM1RzOGxtTXo2RGZuQWI3NThRcWtu?=
 =?utf-8?B?bk5neFJsWDVDTm1HRUNacWRQdnZFNmJndjIzb0RZK0dsUW11OG1yNU0xZmUw?=
 =?utf-8?B?M1ArM29NbTVRa1B0OHRpV2lSQ2R3Q1ZZVHlqdHArWEJmQ3RhcHlRS2N5TzFB?=
 =?utf-8?B?ZGp2Q0VBYTZiOS9Scm43KzZYK0h6VGlBOWNibk1STjBjTzE1M1R0T0VodGZV?=
 =?utf-8?B?YkRYSVdkRm5YdHM3RThqNFk0WHAvcm95ZkM4QXF4Q2IwaGU2V3NtWk5RVE9O?=
 =?utf-8?B?TkR3bGtnL25wUEljY1VCdENWK0hLWlVXb2ZRa1VhM3l0N0toSnBEVkU1cFZi?=
 =?utf-8?B?QUFUTUM4N1ozZFQ2bW5oMVZyaXpBS3l6ZWNJdjBRNUVPMksvd3U0akthMmJH?=
 =?utf-8?B?OUd3dnA1OWFRRTllV0Q1dmZUTWZNYlQ5UkFld2FiVnMzL293V0sxdjQzbVBo?=
 =?utf-8?B?dlAvSHVJcG1nL0ozbmFDb0lkVmdsVWd2U3RrQ2NiOW9TZk1NWGZiWE1LN3BY?=
 =?utf-8?B?K3BuSGtsM2dOZ2dWWmVBNTZxWFNTM212ODlxeGV6dlNycUROWjZMRGx1MnlS?=
 =?utf-8?B?V1UzZHNGVmFDdkRBb29adkM0NEY5YnFjck0wdU44SlgrcVE4dmNWR1BzWXFX?=
 =?utf-8?B?b2FERWVtd3hrQ2lhWG1McmhGNWxhM1d5cnRoaGpNWkZmNzV3N2JCWFFHSXcz?=
 =?utf-8?B?MEZiOVllN2dSVE5CaXRyRU9jR2tpQlgrZW5lNUtSZzVEcURvNGpRVlEremwx?=
 =?utf-8?B?bCtmUUlWdHJORjFvZ3hjWEhZTTdlZGdKSGd1bTdTQnVSb3RjZ2lRVEdMUisy?=
 =?utf-8?B?Q1ZkUWJ1TE1ucDE5L25nbWQ3RmhwWGNLdkNGdjh3TTBzQjFQS2p2Tmswejcx?=
 =?utf-8?B?VFo3Q0lVQi9FVWpaRHRwV1lYeWVmYm5zQm5RcTcwdkM3VGV5YWpIdnh3a0tE?=
 =?utf-8?B?NkFkazRFQ21NeTNtOG1kakIzQUFZdDJBM1U1SUozcXAvU2MvMTZWMlhiaDgw?=
 =?utf-8?B?dDdtSSswaXl3VXpJdlZtT3ZkMUxyaFMxNFN3ZmZxdGVGci9IenNXYndLKzdi?=
 =?utf-8?B?MkwxdVVuekp1b2hXOWorcUlNeHBGNGRoRG9JYnM0UHU3SjlrM3hJY0FzbEJL?=
 =?utf-8?Q?i+0UGOpqa5eSnwUhFoCt3QJ1NHm+DF3W9wEqw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RW1rM1ZTdVRlM090cDYzNzMzVjMxS1dNeldnU1RnTUk0VUUxVzVTeWJzb1Fo?=
 =?utf-8?B?aUhTT2lEL0ZLTzFKTFB3VzZDT093T0NMWXJWUzB2UUNCZmFpNHlhZ2lXMzJm?=
 =?utf-8?B?N3Y1aDJnbkpWQlBwVGxMc01YV0VabXQ4U1Q0ZjNhdHIwZEF4ZHFkRGFkRS8y?=
 =?utf-8?B?aHBmclNMTG10V241ZCtkOXVtN3Nlczk1ZE5tNzFta1FRZTdoWGkvVXloWVN1?=
 =?utf-8?B?UFlmTE9jeEVKS0FvWkxSbGw3OVFWMS9MZ1NoRDRXTGpRVFRPTE5temc5aXVX?=
 =?utf-8?B?MkFDZDV3WGl4bVdqTUNKL1Z5NVg1K09RWUE2aEt5aWdiWkE2ZzI3d3ZKZExM?=
 =?utf-8?B?akwvSmZQalNockJlenNQenNYYVgrT3hadXEveHpKL25PajVhTW1FU3Y2UnpV?=
 =?utf-8?B?WkUvTFpSTGIzRVBRYlkwdVVMU3laUTdJMkJlRGU2Uy9INVFndmNOYWNZTTZj?=
 =?utf-8?B?V1dlNDJoQ0NUMml1WjBTK3Y0c1ByNTdLQzFzZTBLMDc4Wk5NSDhSV291aisz?=
 =?utf-8?B?eVRQSUJuNk1samFPenNNS0JXTGg2T1MvcEptU0JodVo1MU9Sc1VObkdrRERK?=
 =?utf-8?B?Rkw4cVBRMzV5NXhnZW5tenhXSGw2c0E4SEVlUkVQTHRxelVmbklsbi9GZzk5?=
 =?utf-8?B?Z2ZZeTRoci9EZ3doN2Q2S29CVDZuSDdhdElyUXdpTXV5S2lrMHVsSVFrQ1JB?=
 =?utf-8?B?MXN1Wi9udnRVdVlTQ3l2bE1jWUYyekg0RTRaMVYzUEJiam51aDl5eis5VUNV?=
 =?utf-8?B?TGlBMHVwMlcrZXJ1Y3ZFM1ozREY2UTBGZndvTjYzb3A4Ykdyc3QxbUNya1Z4?=
 =?utf-8?B?akNTK0wzb1VqYjdKUHV5anNVZDhacHVqSEVlOU9wdm42QkRzMXk0L3AyTGxL?=
 =?utf-8?B?cW5zazVSYlg4Qlg3elU0SE5YL2pQYUVZQWJBbEdjWU9USlcyNUNmWDh2bnF4?=
 =?utf-8?B?Yk5wUkdHY1Y1aWwxVExkaE9qd1BRQmpDQWQyUzhxSyt2V0lOOVZQQWsvWXFv?=
 =?utf-8?B?eVRLWVVDZDZ0Q055RFRFVCtuaEF2eXh3Zk9CcDdIa1F5Ky96dkxiS09zejFt?=
 =?utf-8?B?K1JCdlMxZHRnNy90TmxRVVJybit6YmRLQW1FMkM5d28xdmlVQUZaK1FtaXds?=
 =?utf-8?B?N3BPMmFFaWRZWXl6NmY1bHo4TUNCMlNzQVh1dElwekdlOGY2Y3Vsc1FWb2Y1?=
 =?utf-8?B?Rk5LektMOW13UWZOQWEwVWhmWkxYemxJQXVGNSt1V01hb0VEL3o2TVVpUGdp?=
 =?utf-8?B?cHdoOUFNN3Jtam5XamNNUFZRdUhuRXFpdTVqMjNBY1FYUlp5czI1RXQvb1lB?=
 =?utf-8?B?UDJDUEg2ajJEY3U4dlVScE04eW1SZU1hc2lDMkI3UHgrR3NpNEplUURwRFhK?=
 =?utf-8?B?MXorTTdua0NkZHppb3Z3djh2YjRReGJ0ZVZiWGhFRURrSCtyTTd0djlVSmh6?=
 =?utf-8?B?cHBWRXFHUlhXNmdtcG8zZ3NZTW9zNzRBbWtqTXV2OEFKb3gwbDgrSEFobGwv?=
 =?utf-8?B?clZSSHRGYTIvRWluMVIyTU14YVlJbmlhMHRLbWI0YldXQURHR3lkd3JjRE9w?=
 =?utf-8?B?Y2NZcVlKbU5OdWtVM29HcmJ1NVVGWXVpRjJUb21sSnIzbW9ZdGNtdERrR2hp?=
 =?utf-8?B?MnpFMlBaZ3V1eVhuNmdKb0RPa1NXbjdUN2tJY1I2THhSeXdHbWY5NmxUUHhs?=
 =?utf-8?B?d254aC9QQmlnTDdlc3l1clNCUllXZGVHWXd0eVlGRHhrRFNzSnBMYW9PY0VE?=
 =?utf-8?B?Z2RyeDhFZVlxN0xsRFFscmJJUHJQaXpRYnZGdFMxMjZuZ2EzcUplT0N4emZG?=
 =?utf-8?B?bDhmcWR0YTVZZUZ0Tk5yUENwMzBIT3JhQTcrcS9BZnFQWVFnMUhLdDQ3czRQ?=
 =?utf-8?B?cWNwNU1WbGw4aS9yR3g4dnJwUGhIZFZiRGlxNThsdGpBWTczUENMSVMzQ3lM?=
 =?utf-8?B?SlNrUmp6SjJFSU9STkpRYU1jNndJT3JyaDlmZ1RhcDFMVHZaVWUrMWRrckdm?=
 =?utf-8?B?YnEzeDhIVUtsaHY5K011eU9sUE1WQkM0b1F6VHJJNmM5bjl6YjYyc0xjU0Zu?=
 =?utf-8?B?ZC9qQ3pveTZ4NWp0ck0vcHNJTXFuaW5WNnMwb0hCOEE4OGdUckNXT252aTVL?=
 =?utf-8?Q?YG0QTOsaPri7kGEXNZwI6f7Ip?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28f6d75-12c8-4024-dfad-08dd0915ada2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 03:44:46.8050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: go8RbBWEhXsf4eHsC0XlQ+NB7v2pgPVW0jhmdZmGFPnCDZEV1JjedUtOgwzsUb0clanwW/2tRcfFiu3pNARjGxw1B3SrjnazpjbXmW/S6Jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMi81XSBkcm0vdmlydGlvOiBB
ZGQgYSBoZWxwZXIgdG8gbWFwIGFuZCBub3RlIHRoZQ0KPiBkbWEgYWRkcnMgYW5kIGxlbmd0aHMN
Cj4gDQo+IC4uLg0KPiA+IEFmdGVyIHJlYmFzaW5nIHYyIG9mIHRoaXMgcGF0Y2ggc2VyaWVzIG9u
IHRvcCBvZiB0aGUgYWJvdmUgcGF0Y2gsIEkgc2VlIHRoYXQNCj4gPiB0aGlzIHVzZS1jYXNlIHdv
cmtzIGFzIGV4cGVjdGVkIHdpdGggUWVtdSBtYXN0ZXIuIExldCBtZSBzZW5kIG91dCB2MywNCj4g
PiB3aGljaCB3b3VsZCBiZSBhIHJlYmFzZSBvZiB2MiBvbiB0b3Agb2YgdGhlIGFib3ZlIHBhdGNo
Lg0KPiAuLi4NCj4gPj4+IEFtIEkgZG9pbmcgYW55dGhpbmcgd3Jvbmc/IFN1Z2dlc3Rpb25zIGFy
ZSB3ZWxjb21lLg0KPiA+PiBDb3VsZCB5b3UgcGxlYXNlIHNoYXJlIHlvdXIgUWVtdSBsYXVuY2gg
cGFyYW1ldGVycz8gSSdsbCB0cnkgdG8gcmVjcmVhdGUNCj4gdGhlDQo+ID4+IGlzc3VlIHlvdSBh
cmUgc2VlaW5nLg0KPiANCj4gVGhhbmtzIGEgbG90IGZvciBzaGFyaW5nIHlvdXIgUWVtdSBjb21t
YW5kLiBJIGhhdmVuJ3QgdXNlZCB0aGUNCj4gYGhvc3QtcGh5cy1iaXRzYCBmbGFncywgd2lsbCB0
cnkgYWdhaW4gc29vbiBhbmQgdGhlbiBhbHNvIGNoZWNrIGhvc3QNCj4gZXJyb3JzIGlmIGl0IHN0
aWxsIHdvbid0IHdvcmsuDQpBbnkgY2hhbmNlIHlvdSB3b3VsZCBiZSBhYmxlIHRvIGZpbmlzaCBy
ZXZpZXdpbmcgdGhpcyBwYXRjaCBzZXJpZXMgYmVmb3JlDQp5b3VyIHVwY29taW5nIHZhY2F0aW9u
PyANCg0KPiANCj4gVGhlIGBuZXcgZmVuY2UgZm9yIGV2ZXJ5IHBsYW5lYCBwYXRjaHNldCBpcyBu
b3cgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0Lg0KVGhhbmsgeW91LA0KVml2ZWsNCg0KPiANCj4g
LS0NCj4gQmVzdCByZWdhcmRzLA0KPiBEbWl0cnkNCg==
