Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B128C3C26
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75E610E43B;
	Mon, 13 May 2024 07:35:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LpUBnyeM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3372F10E421;
 Mon, 13 May 2024 07:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715585706; x=1747121706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Mo3jhEb1VoPRJhHnJmg4aL++VYuqzdpW0+kn3hPs4Dc=;
 b=LpUBnyeM8OMpV6ry3k7PJO0qYoIGvCP4e9QMJDePUwmRhI7U1lhqAT6Y
 fvruAHFLCnzAI4nQtwZtvvS6aT/yDFXx7tkvM5TD3ildIrTmKFXM80QQq
 YuyZr/cWgEsWxsSeATTsowCWeS4cvK+FgNLeMuxnWFjDjL78uGT8PPVG5
 0F3ykGb6yomRdK9TwRlZ1YFl+UvrybhmZ2SumH4TWKkJCePQqkEpAdrf0
 hYaTm0jQOTh9/TASEi8D8n9fYPVmdcXLgQpr2Rp957Ch0Ch5abx6rRwOK
 g/LP++5dVLNTQJ0QUvbMqQBSmkHcAPUHkXqhlcwWB+2ZtcpjMHHK30sRL Q==;
X-CSE-ConnectionGUID: ZlVza1DYRPCdWl5HSg/FDQ==
X-CSE-MsgGUID: CKB03ccZR/21CIBAkgK6aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="11327632"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="11327632"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 00:35:05 -0700
X-CSE-ConnectionGUID: nkxiQnYSQyqScgT/0fzXUQ==
X-CSE-MsgGUID: TDdPqakPTIW8VoanlxAXbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; d="scan'208";a="30368202"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 May 2024 00:31:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 00:31:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 00:31:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 13 May 2024 00:31:49 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 13 May 2024 00:31:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klhxelAJrCdwXny8mkMet/rkAT+JsnkvGLSk82N4CBSKNi4Iz5C+6gQgwT2f6JIWFoPGnQ69yS71xmvg8uHLGpsUDznnCrIDE9RILCa0FrNYlZIiv/vkx6OwFypMpZrdlqc9I2U7KU51gvyK43G+O+k+yfAVb6F9N3yn835Uwt5MxHXj3wrS0RmvEqJ4gzbsDlL+UxUHXnXhHNs2Nc+ZaLFxed6NH1Tubkp3vpqmOfvAxHDJf6JwAgfwsbitahffR0oRko+l9kmAfDjqthZLWaehZaHayCT1Vje3ZTjasntewl+tLSWTnPIQrdSBfLLcHvRQldgpes2V1G4gGOfv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo3jhEb1VoPRJhHnJmg4aL++VYuqzdpW0+kn3hPs4Dc=;
 b=Hty5OVm3f4Pp0cLz/cTW//5hjmZtEQbs0blmqfj2F1smK63K+1TUMGSYuDDgpqC9uh7T90iJo7v5dbktszErTf7RIV40SinSADbeKvXpe8T0N6C43HtUGmt3iJnAwg0bxMgyuq5yUcaxV7D3imH0lQVqRDMVqNPMwoYApW86sTt4CPHKjSgT8I1yD/LqzScZw+Yjkn83u5LoJa54l9FDSA2PxFZgfE1QDxBnRpGdzi+VSICNj1sQzXY5mSuovb2zykZBMPF0c8Lgx9oKRvk+78XouqTaIEtw/I0DQGUl+XdtOp6xW5fxef+YHvqPck5HTBjgBtwt1lq7hYmhCdtMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.55; Mon, 13 May 2024 07:31:47 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 07:31:47 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v4 4/6] drm/i915/alpm: Add compute config for lobf
Thread-Topic: [PATCH v4 4/6] drm/i915/alpm: Add compute config for lobf
Thread-Index: AQHaodR9vYptc+4s/0+eWKD1RoaJBLGUy42A
Date: Mon, 13 May 2024 07:31:46 +0000
Message-ID: <f45895701e1a6d80b163fe89b3fe5995eb38bf90.camel@intel.com>
References: <20240509053155.327071-1-animesh.manna@intel.com>
 <20240509053155.327071-5-animesh.manna@intel.com>
In-Reply-To: <20240509053155.327071-5-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|LV2PR11MB5975:EE_
x-ms-office365-filtering-correlation-id: ef14dc18-41ad-46c8-b3d0-08dc731ebf02
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?K2hxSllTU29xWkhUSU00S0R3WG1SMEd4WmxGTWppdTl4ZkRBWkNGNDY3S3pt?=
 =?utf-8?B?eDNiTGxoc1p4U3daMU81R1lidWdEc1NxRFl6MzFuWk5UeCtEYkxGYzczek1E?=
 =?utf-8?B?MXFTZllMSnArMmJuS3FrYWZEdUwzSThRVndPRFd2UmJoSlVDSjk3K3pjT0Q2?=
 =?utf-8?B?T0Eydm9lNlpuY21hRWRkWTRRZitSMjRtUkNkejFudkVwZW1haThlUS9BUXQz?=
 =?utf-8?B?S0wrdDUxQ05OVzU5VHJjZzhnSXFiZ0tIay92dGlLWW9pa29NTXlSbjFKZFla?=
 =?utf-8?B?MEhtSXhOZmpyT3ZHMWJ0T0F1MFl4VXdIZWJBOEU3OFdtNFROQ0NsVmV4RFVl?=
 =?utf-8?B?Zms1bm1yRW5lTmFJMTc5V091bVF3N2J3Vy8wbUYwN0UvNzVpMWJ5cnhzekVs?=
 =?utf-8?B?RC9QYjI1UmoxbmpVRGtnUlpQWk1raTJvOGdaMnZLNGhQWG1zbHZVRXNEVjRI?=
 =?utf-8?B?a3RBdnNuakdJdGw4UGJxU2VBN1hQbFJqK0xEZzIvdmhSTnliWUxscUJtVTBo?=
 =?utf-8?B?VWhQS1htL3Urd3BNVEpteTIvL1ljS3ZqcjhUOW5oaWM3LzlkY29wWHllcEth?=
 =?utf-8?B?a01pMGNVVzBiQmF3MHgzRXdraEZ4c0hIZDRFNERULzd0cUdDKzBUM0JyQS95?=
 =?utf-8?B?RXk0SXNOY2dOZHArSUhueDYveDlvTjJZbnA4TjhKS1NVbTgyRm9NNzIrS0VM?=
 =?utf-8?B?MFNpeGNEdjAxdjBWT0ZzYTBtSmNRK2Qra1lDb1Nqd1VkNGNOOGtqZXBRNEo4?=
 =?utf-8?B?S2hWd21aa3ZnL2VTb1V0d2hEVERwTU0wT1poVUtQRVdrNEdVdkxldXhYRE9a?=
 =?utf-8?B?WWkzMnVyOU94cEJTTWEzb3BKb1JuZWczd3FuVFF4RXFac2V0c0twcmVaR2hj?=
 =?utf-8?B?cnhzL29UVVZxOFlzdHRjMEl0Ymh3YVRteFBuQk1Sc1ZBVDFVTEZBWTRjYXhj?=
 =?utf-8?B?dG9XS25xSmZnL3IzWTVqT09aOTFYRmZldGU3eW01NzQxSkdXQ0RnaUtFTW5X?=
 =?utf-8?B?bk96K21VRWZaMmhmVkprS1FKclFqNDdKRjBNNFRwZW9POTFnNXQwREppWHI5?=
 =?utf-8?B?TlVDY21HaEo4SjZCVStzdXhTaGVQTUEwZW1YZWxjSGFqY3Q0Q1dtVmM1cXZw?=
 =?utf-8?B?Q2hEZWhWOXE3NnMzaE9wVHZPbVpVTkNmU1NzWmttYnlNWWlQZUo3am5ldHpE?=
 =?utf-8?B?UEpHdWRhYlNqejgvaU9kTk16LzJId3liMU1ja0NNUFM4NnNWdm5tQ1VneWx3?=
 =?utf-8?B?a2Q2bXhMM0s3ZE44MGFkSFF5Z3ZXUk93SmVKM3JqY0ZuNG02ZG5WZHNjMkJr?=
 =?utf-8?B?cXJ2dk1ZeFB1K0FyWnhtWXV6UTdrSlZoVS9paUlWN25yMFNGVGsvZFUxK2xw?=
 =?utf-8?B?blBoMHRHN3BTL3llM2ZpYXVkZlU4a0xJRCtVZktqOVp3K3pxTFJNOXdpL2Zk?=
 =?utf-8?B?K0FyRGpXUUkzUHNGTFFRaHBtcHFGQlZoVkpCTzJoQkp6b0NvZ3pTUmVPUFhN?=
 =?utf-8?B?Ri8xSncyL0ZOQ05zVlFjVmFOMmdDTVRNTVVEclJWT2NxSVNBSW5xY2pXbkNW?=
 =?utf-8?B?R0ZvM3BmNUhZSWRST0VZZ2s2VTA5V0gzdkIxcXJYcEtwTWtYNXpseUkxR0l2?=
 =?utf-8?B?S081NjNPSlQ3bGROU09NQkZtOU5Nd2hJMHMzNXBNT1JDTlMxR2xnZE5tVnRI?=
 =?utf-8?B?SXAyc1BVWERLUzFZdmVGbU5NNnN6MDFFWk85OUdwOXVFQStIKzByN1hGRXlT?=
 =?utf-8?B?TC9sRktiUHB3RzVCZUdQb2I4azErQVR2cllkSVV2clZOUlRTZ3JzT29McnJ5?=
 =?utf-8?B?ZEROc1N2SmtYNExkL2NZdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2puc1ZjTmtKOUQzaFQ2bmF1VkpzbElyT0hEOHB2dy8vc3VnODduNjd0OEEz?=
 =?utf-8?B?QUJlVXNKVzdMazl6WVpoZG9HQUt4YjhkaWFmOTk3N3NqYmdJa2g0WFR5SG5C?=
 =?utf-8?B?RXRLU1dtZ3VCOXd0VmpFRFRGRnh0N2ZVcllTSGUwR09jd1pBWkdBZFJLNm1R?=
 =?utf-8?B?R1Z5b2hMYmlmZ0FrVTJTeCtjaHNHOTRFVW1takZZSmd1ODE1eGorYkFoT1hU?=
 =?utf-8?B?NitiZGdXcDlscFVWcjhsY0dRM28yNGhxQVNGOFFUbmJGNHBhQVdXYktFK1BN?=
 =?utf-8?B?SVpJRXhNc2k2TlY3SGQ3ZjA2b01ZNnhReE1jS2ptaktiSVJUZHNxbGkrb2Y3?=
 =?utf-8?B?Q0dUR3JmWDk4TlExemx1Z2c2Vm91aDkxRkxoVXFwTEsrMW9xc05KVVhneVNN?=
 =?utf-8?B?blZKa2pHTXZwV2gxZ0hrR1RhSS9Nc29OTVdNT0I0ZU1oMWN2UmZrQ3R3VGNm?=
 =?utf-8?B?UG9FVk1taW1TL3g5L2F3VG5wWGpYTWl0K0xJL1Jsd1NCZGZjbmR5YjZvZlQx?=
 =?utf-8?B?L3hwUWFVRDJHNWlITEJNcVI3Zlg4WXVFZERGSVZMNklTK1ZHLzE3VS9mZnYv?=
 =?utf-8?B?SVdZeDUzbVNpWTlYS3dqK21PZ0w2ajRacFgxa2ZUa21pTE1HVmdhY3ZmY0gx?=
 =?utf-8?B?WkJEanJhTDZpcDBWVDNXQTFmSjdWREZCbjBsSmZFV1RFS0MrUEtpOVpWT0Iy?=
 =?utf-8?B?ZVp3OW9YRDRSUThESzRBU2pDdnRvalkvZjE0TWlyeHlqdUZjekdSQUtYL3k1?=
 =?utf-8?B?a1c0cDRhV2xqTkd4SGt0ejhJZ2ZNZThBbEZRamFwdFl4K3pHbW1xRGUyTFVo?=
 =?utf-8?B?dEt2RWwxTEFaVUpaT1Q0R25VNlU2OXlybVY3KzhyU21PRTNBa1I4V3BZckJU?=
 =?utf-8?B?QUxiNGxkblBHOHBZR0Y1dU9kMXFyMFluRVVQalhTdTFTdjhXMlBmRXk5VFda?=
 =?utf-8?B?QkRia1c1Qk94RDZHT28zTHk5VGd5aG1DU210WjF3ZDd4Y3YyWXlNd2h0bW9B?=
 =?utf-8?B?MU5TdWJ6d1hITDI0UTB0QVoybkYxTWpBQjdpZXUvTlgvUHNYdXRlVmJJS29G?=
 =?utf-8?B?ZEdEMW5MSTlBOGVLZHVNaFc3OERoQlZoMk4vSEIxVE5GZGo4Y0hpbjNoT1NK?=
 =?utf-8?B?c1NtaldaSmFZRVdQRGg1RjFhTkpocWVZN0dwWFN4QjlDWEp4YnBKTUM5RElX?=
 =?utf-8?B?a0FyZC9uWjlVaUVSMWsxNGxQUVdUOUZReWZUNWpGSEhNdHNzUUMxUXV1aGJt?=
 =?utf-8?B?YjZQNjVQOG5PcUl2b0l6T0RyNWtiRm5QZkFRbjBESFlNSkc5OStTcW10L0o5?=
 =?utf-8?B?V3ZmeFVRT0tjeUZGNWY3QmM5TDBiaXBGemRiMmgxcUhaQ2hIcGs3eHR5S3lN?=
 =?utf-8?B?QW16VkFYRmlFcTZhY0hpZURFQ0JiWGtSZjhPbjd5QldtbEhWYnRkYXBRaDhy?=
 =?utf-8?B?UkN1bzRtMjFyNjBBQmZySzdYbkdwa09tQWRZTkdmWUtZZUNqSHlULzRqMk16?=
 =?utf-8?B?aXBnaDBhbjlzUGNJUDhycHNsVkRKMHdrNU5IdjRnVXMvbkdObFhmd1M0ZjYr?=
 =?utf-8?B?QUo2NUhKREtleEtxM3M4UG1qYlUzNEJKRHlab1VmY0R6eHZDSllHRVRFblNV?=
 =?utf-8?B?OFZnbm5yWndnL3VXWVRETGE2dU9DUVlVWnZEWWx4bk5Cc0xkendWQzNXWERE?=
 =?utf-8?B?czVhVmdWL1dqb2ZVY282Z1FEb3NzWW53Z2NnemVpM0I5VExXY0VITU52YnBY?=
 =?utf-8?B?WkJOMWszcVMzamQxWGZpdUZBUzBva1E5cTk0eldMNEZGVFRzZzYwT1oxcldo?=
 =?utf-8?B?bEtpeGZaRDlHUXg3dngwcUNGZzliTkpUSnhNdTR5eWZSZnNDeEpxSFdvdFBu?=
 =?utf-8?B?L09VVktEV2xMenRkSmh6SEJBaExBNGRvczBqN1diZHJucVFlcnI3RHVnb1J4?=
 =?utf-8?B?dmNoK0h1MXkrWVNRK2xMR2EyVlM2UURQeDhVUEREU0pLcXVWUzVjWGFweDRs?=
 =?utf-8?B?cTRORXcxdDlBamhTaE8xSXZHVlNVenI5S1dhazlzemFad0w0VTJDRG96bjlI?=
 =?utf-8?B?emhLRVgySmo1MUJXQjFVU3ZyamJzL2RUTE1wSEw0UkNKb2Jmbk9SMVUwQm45?=
 =?utf-8?B?MkZJb3NkSjNlOXRJNERVTDNwQzlnN0YxT0ozM1NQcHN3azJsUVNRblJHWWVa?=
 =?utf-8?B?T0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4C68546FEF28F4AAE3CE31602B20D4B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef14dc18-41ad-46c8-b3d0-08dc731ebf02
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2024 07:31:47.0036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0MiKfCaC3mIw9Q6VVS+/scQbx47tNRRYFZOu7BUPgepu9qUIWCwkGhIkw6zYmTHN9S9xvzpolIYnutgWdRkyPldOhzHkcMaJ967GgTXPjqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
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

T24gVGh1LCAyMDI0LTA1LTA5IGF0IDExOjAxICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOgo+
IExpbmsgT2ZmIEJldHdlZW4gQWN0aXZlIEZyYW1lcywgaXMgYSBuZXcgZmVhdHVyZSBmb3IgZURQ
Cj4gdGhhdCBhbGxvd3MgdGhlIHBhbmVsIHRvIGdvIHRvIGxvd2VyIHBvd2VyIHN0YXRlIGFmdGVy
Cj4gdHJhbnNtaXNzaW9uIG9mIGRhdGEuIFRoaXMgaXMgYSBmZWF0dXJlIG9uIHRvcCBvZiBBTFBN
LCBBUyBTRFAuCj4gQWRkIGNvbXB1dGUgY29uZmlnIGR1cmluZyBhdG9taWMtY2hlY2sgcGhhc2Uu
Cj4gCj4gdjE6IFJGQyB2ZXJzaW9uLgo+IHYyOiBBZGQgc2VwYXJhdGUgZmxhZyBmb3IgYXV4bGVz
cy1hbHBtLiBbSmFuaV0KPiB2MzoKPiAtIGludGVsX2RwLT5sb2JmX3N1cHBvcnRlZCByZXBsYWNl
ZCB3aXRoIGNydGNfc3RhdGUtPmhhc19sb2JmLgo+IFtKb3VuaV0KPiAtIEFkZCBESVNQTEFZX1ZF
UigpIGNoZWNrLiBbSm91bmldCj4gLSBNb2RpZnkgZnVuY3Rpb24gbmFtZSBvZiBnZXRfYXV4X2xl
c3Nfc3RhdHVzLiBbSmFuaV0KPiB2NDogQWRkIGVudW0gYWxwbV9tb2RlIHRvIGhvbGQgdGhlIGF1
eC13YWtlL2xlc3MgY2FwYWJpbGl0eS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5h
IDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfYWxwbS5jwqDCoMKgwqAgfCA1OAo+ICsrKysrKysrKysrKysrKysrKysK
PiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5owqDCoMKgwqAgfMKg
IDUgKysKPiDCoC4uLi9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaMKgwqDC
oCB8IDExICsrKysKPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuY8Kg
wqDCoMKgwqDCoCB8wqAgNCArKwo+IMKgNCBmaWxlcyBjaGFuZ2VkLCA3OCBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxw
bS5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYwo+IGluZGV4
IGVlNmMyYTk1OWYwOS4uNTk3OWVhYjFmMmUwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9hbHBtLmMKPiBAQCAtMTEsNiArMTEsMjMgQEAKPiDCoCNpbmNsdWRlICJp
bnRlbF9kcF9hdXguaCIKPiDCoCNpbmNsdWRlICJpbnRlbF9wc3JfcmVncy5oIgo+IMKgCj4gK2Vu
dW0gYWxwbV9tb2RlIGludGVsX2FscG1fZ2V0X2NhcGFiaWxpdHkoc3RydWN0IGludGVsX2RwICpp
bnRlbF9kcCkKPiArewo+ICvCoMKgwqDCoMKgwqDCoHU4IGFscG1fY2FwcyA9IDA7Cj4gKwo+ICvC
oMKgwqDCoMKgwqDCoGlmIChkcm1fZHBfZHBjZF9yZWFkYigmaW50ZWxfZHAtPmF1eCwgRFBfUkVD
RUlWRVJfQUxQTV9DQVAsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICZhbHBtX2NhcHMpICE9IDEpCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiBBTFBNX0lOVkFMSUQ7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlm
IChhbHBtX2NhcHMgJiBEUF9BTFBNX0NBUCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIEFMUE1fQVVYX1dBS0U7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoGlmIChhbHBtX2Nh
cHMgJiBEUF9BTFBNX0FVWF9MRVNTX0NBUCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIEFMUE1fQVVYX0xFU1M7Cj4gKwo+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBBTFBN
X05PVF9TVVBQT1JURUQ7Cj4gK30KClRoaXMgd2lsbCBhbHdheXMgcmV0dXJuIEFMUE1fQVVYX1dB
S0UgaWYgYm90aCBhcmUgc3VwcG9ydGVkLiBJIGRvbid0CnRoaW5rIHRoaXMgaXMgd2hhdCB5b3Ug
d2FudD8KCllvdSBjb3VsZCBhZGQgYWxwbV9kcGNkIGludG8gaW50ZWxfZHAuIFRoZW4gZm9yIHRo
aXMgcHVycG9zZSBhZGQKYXV4X3dha2Vfc3VwcG9ydGVkKCkgYW5kIGF1eF9sZXNzX3dha2Vfc3Vw
cG9ydGVkKCk/CgpCUiwKCkpvdW5pIEjDtmdhbmRlcgoKPiArCj4gwqAvKgo+IMKgICogU2VlIEJz
cGVjOiA3MTYzMiBmb3IgdGhlIHRhYmxlCj4gwqAgKgo+IEBAIC0yNDIsNiArMjU5LDQ3IEBAIGJv
b2wgaW50ZWxfYWxwbV9jb21wdXRlX3BhcmFtcyhzdHJ1Y3QgaW50ZWxfZHAKPiAqaW50ZWxfZHAs
Cj4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiB0cnVlOwo+IMKgfQo+IMKgCj4gK3ZvaWQgaW50ZWxf
YWxwbV9jb21wdXRlX2xvYmZfY29uZmlnKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlCj4gKmNydGNfc3RhdGUsCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlCj4gKmNvbm5fc3RhdGUpCj4gK3sKPiAr
wqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IGRwX3RvX2k5MTUo
aW50ZWxfZHApOwo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICphZGp1
c3RlZF9tb2RlID0gJmNydGNfc3RhdGUtCj4gPmh3LmFkanVzdGVkX21vZGU7Cj4gK8KgwqDCoMKg
wqDCoMKgaW50IHdha2V0aW1lX2luX2xpbmVzLCBmaXJzdF9zZHBfcG9zaXRpb247Cj4gK8KgwqDC
oMKgwqDCoMKgaW50IGNvbnRleHRfbGF0ZW5jeSwgZ3VhcmRiYW5kOwo+ICsKPiArwqDCoMKgwqDC
oMKgwqBpZiAoIWludGVsX2RwX2lzX2VkcChpbnRlbF9kcCkpCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybjsKPiArCj4gK8KgwqDCoMKgwqDCoMKgaWYgKERJU1BMQVlfVkVS
KGk5MTUpIDwgMjApCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiAr
Cj4gK8KgwqDCoMKgwqDCoMKgaWYgKCFpbnRlbF9kcF9hc19zZHBfc3VwcG9ydGVkKGludGVsX2Rw
KSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+ICsKPiArwqDCoMKg
wqDCoMKgwqBpZiAoY3J0Y19zdGF0ZS0+aGFzX3BzcikKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcmV0dXJuOwo+ICsKPiArwqDCoMKgwqDCoMKgwqBpZiAoaW50ZWxfZHAtPmFscG1f
cGFyYW1ldGVycy5tb2RlID09IEFMUE1fSU5WQUxJRCB8fAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpbnRlbF9kcC0+YWxwbV9wYXJhbWV0ZXJzLm1vZGUgPT0gQUxQTV9OT1RfU1VQUE9SVEVEKQo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm47Cj4gKwo+ICvCoMKgwqDCoMKg
wqDCoGlmICghaW50ZWxfYWxwbV9jb21wdXRlX3BhcmFtcyhpbnRlbF9kcCwgY3J0Y19zdGF0ZSkp
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybjsKPiArCj4gK8KgwqDCoMKg
wqDCoMKgY29udGV4dF9sYXRlbmN5ID0gYWRqdXN0ZWRfbW9kZS0+Y3J0Y192Ymxhbmtfc3RhcnQg
LQo+IGFkanVzdGVkX21vZGUtPmNydGNfdmRpc3BsYXk7Cj4gK8KgwqDCoMKgwqDCoMKgZ3VhcmRi
YW5kID0gYWRqdXN0ZWRfbW9kZS0+Y3J0Y192dG90YWwgLQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYWRqdXN0ZWRfbW9kZS0+Y3J0Y192ZGlzcGxheSAtIGNvbnRleHRf
bGF0ZW5jeTsKPiArwqDCoMKgwqDCoMKgwqBmaXJzdF9zZHBfcG9zaXRpb24gPSBhZGp1c3RlZF9t
b2RlLT5jcnRjX3Z0b3RhbCAtCj4gYWRqdXN0ZWRfbW9kZS0+Y3J0Y192c3luY19zdGFydDsKPiAr
wqDCoMKgwqDCoMKgwqBpZiAoaW50ZWxfZHAtPmFscG1fcGFyYW1ldGVycy5tb2RlID09IEFMUE1f
QVVYX0xFU1MpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHdha2V0aW1lX2luX2xp
bmVzID0gaW50ZWxfZHAtCj4gPmFscG1fcGFyYW1ldGVycy5pb193YWtlX2xpbmVzOwo+ICvCoMKg
wqDCoMKgwqDCoGVsc2UKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgd2FrZXRpbWVf
aW5fbGluZXMgPSBpbnRlbF9kcC0KPiA+YWxwbV9wYXJhbWV0ZXJzLmZhc3Rfd2FrZV9saW5lczsK
PiArCj4gK8KgwqDCoMKgwqDCoMKgY3J0Y19zdGF0ZS0+aGFzX2xvYmYgPSAoY29udGV4dF9sYXRl
bmN5ICsgZ3VhcmRiYW5kKSA+Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoChmaXJz
dF9zZHBfcG9zaXRpb24gKyB3YWtldGltZV9pbl9saW5lcyk7Cj4gK30KPiArCj4gwqBzdGF0aWMg
dm9pZCBsbmxfYWxwbV9jb25maWd1cmUoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCkKPiDCoHsK
PiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gZHBf
dG9faTkxNShpbnRlbF9kcCk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfYWxwbS5oCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2FscG0uaAo+IGluZGV4IGM0NWQwNzhlNWE2Yi4uODBjOGE2NmIzNGFmIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgKPiBAQCAtMTAsOSArMTAsMTQgQEAK
PiDCoAo+IMKgc3RydWN0IGludGVsX2RwOwo+IMKgc3RydWN0IGludGVsX2NydGNfc3RhdGU7Cj4g
K3N0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlOwo+IMKgCj4gK2VudW0gYWxwbV9tb2RlIGludGVs
X2FscG1fZ2V0X2NhcGFiaWxpdHkoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCk7Cj4gwqBib29s
IGludGVsX2FscG1fY29tcHV0ZV9wYXJhbXMoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpOwo+ICt2b2lkIGludGVsX2Fs
cG1fY29tcHV0ZV9sb2JmX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLAo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZQo+ICpjcnRjX3N0YXRlLAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZQo+ICpjb25uX3N0YXRlKTsKPiDCoHZvaWQg
aW50ZWxfYWxwbV9jb25maWd1cmUoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCk7Cj4gwqAKPiDC
oCNlbmRpZgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2Rpc3BsYXlfdHlwZXMuaAo+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5X3R5cGVzLmgKPiBpbmRleCBlODFmZDcxY2U1N2IuLjc5ZTllNTQzMDIwYiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMu
aAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBl
cy5oCj4gQEAgLTE0MDUsNiArMTQwNSw5IEBAIHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlIHsKPiDC
oAo+IMKgwqDCoMKgwqDCoMKgwqAvKiBmb3IgbG9hZGluZyBzaW5nbGUgYnVmZmVyZWQgcmVnaXN0
ZXJzIGR1cmluZyB2YmxhbmsgKi8KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV92Ymxhbmtf
d29yayB2Ymxhbmtfd29yazsKPiArCj4gK8KgwqDCoMKgwqDCoMKgLyogTE9CRiBmbGFnICovCj4g
K8KgwqDCoMKgwqDCoMKgYm9vbCBoYXNfbG9iZjsKPiDCoH07Cj4gwqAKPiDCoGVudW0gaW50ZWxf
cGlwZV9jcmNfc291cmNlIHsKPiBAQCAtMTcxNSw2ICsxNzE4LDEzIEBAIHN0cnVjdCBpbnRlbF9w
c3Igewo+IMKgwqDCoMKgwqDCoMKgwqB1OCBlbnRyeV9zZXR1cF9mcmFtZXM7Cj4gwqB9Owo+IMKg
Cj4gK2VudW0gYWxwbV9tb2RlIHsKPiArwqDCoMKgwqDCoMKgwqBBTFBNX0lOVkFMSUQsCj4gK8Kg
wqDCoMKgwqDCoMKgQUxQTV9BVVhfV0FLRSwKPiArwqDCoMKgwqDCoMKgwqBBTFBNX0FVWF9MRVNT
LAo+ICvCoMKgwqDCoMKgwqDCoEFMUE1fTk9UX1NVUFBPUlRFRAo+ICt9Owo+ICsKPiDCoHN0cnVj
dCBpbnRlbF9kcCB7Cj4gwqDCoMKgwqDCoMKgwqDCoGk5MTVfcmVnX3Qgb3V0cHV0X3JlZzsKPiDC
oMKgwqDCoMKgwqDCoMKgdTMyIERQOwo+IEBAIC0xODM1LDYgKzE4NDUsNyBAQCBzdHJ1Y3QgaW50
ZWxfZHAgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTggZmFzdF93YWtlX2xp
bmVzOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBMTkwgYW5kIGJl
eW9uZCAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlbnVtIGFscG1fbW9kZSBt
b2RlOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTggY2hlY2tfZW50cnlfbGlu
ZXM7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1OCBzaWxlbmNlX3BlcmlvZF9z
eW1fY2xvY2tzOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTggbGZwc19oYWxm
X2N5Y2xlX251bV9vZl9zeW1zOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2RwLmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZHAuYwo+IGluZGV4IDQ4NjM2MWViMDA3MC4uZGY0MjNhMzNmNmZjIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwo+IEBAIC00OCw2ICs0OCw3IEBACj4gwqAjaW5j
bHVkZSAiaTkxNV9kcnYuaCIKPiDCoCNpbmNsdWRlICJpOTE1X2lycS5oIgo+IMKgI2luY2x1ZGUg
Imk5MTVfcmVnLmgiCj4gKyNpbmNsdWRlICJpbnRlbF9hbHBtLmgiCj4gwqAjaW5jbHVkZSAiaW50
ZWxfYXRvbWljLmgiCj4gwqAjaW5jbHVkZSAiaW50ZWxfYXVkaW8uaCIKPiDCoCNpbmNsdWRlICJp
bnRlbF9iYWNrbGlnaHQuaCIKPiBAQCAtMzAwMCw2ICszMDAxLDcgQEAgaW50ZWxfZHBfY29tcHV0
ZV9jb25maWcoc3RydWN0IGludGVsX2VuY29kZXIKPiAqZW5jb2RlciwKPiDCoMKgwqDCoMKgwqDC
oMKgaW50ZWxfdnJyX2NvbXB1dGVfY29uZmlnKHBpcGVfY29uZmlnLCBjb25uX3N0YXRlKTsKPiDC
oMKgwqDCoMKgwqDCoMKgaW50ZWxfZHBfY29tcHV0ZV9hc19zZHAoaW50ZWxfZHAsIHBpcGVfY29u
ZmlnKTsKPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfcHNyX2NvbXB1dGVfY29uZmlnKGludGVsX2Rw
LCBwaXBlX2NvbmZpZywgY29ubl9zdGF0ZSk7Cj4gK8KgwqDCoMKgwqDCoMKgaW50ZWxfYWxwbV9j
b21wdXRlX2xvYmZfY29uZmlnKGludGVsX2RwLCBwaXBlX2NvbmZpZywKPiBjb25uX3N0YXRlKTsK
PiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZHBfZHJyc19jb21wdXRlX2NvbmZpZyhjb25uZWN0b3Is
IHBpcGVfY29uZmlnLAo+IGxpbmtfYnBwX3gxNik7Cj4gwqDCoMKgwqDCoMKgwqDCoGludGVsX2Rw
X2NvbXB1dGVfdnNjX3NkcChpbnRlbF9kcCwgcGlwZV9jb25maWcsIGNvbm5fc3RhdGUpOwo+IMKg
wqDCoMKgwqDCoMKgwqBpbnRlbF9kcF9jb21wdXRlX2hkcl9tZXRhZGF0YV9pbmZvZnJhbWVfc2Rw
KGludGVsX2RwLAo+IHBpcGVfY29uZmlnLCBjb25uX3N0YXRlKTsKPiBAQCAtNjYxNSw2ICs2NjE3
LDggQEAgc3RhdGljIGJvb2wgaW50ZWxfZWRwX2luaXRfY29ubmVjdG9yKHN0cnVjdAo+IGludGVs
X2RwICppbnRlbF9kcCwKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9wcHNfaW5pdF9sYXRl
KGludGVsX2RwKTsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoGludGVsX2RwLT5hbHBtX3BhcmFtZXRl
cnMubW9kZSA9Cj4gaW50ZWxfYWxwbV9nZXRfY2FwYWJpbGl0eShpbnRlbF9kcCk7Cj4gKwo+IMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gdHJ1ZTsKPiDCoAo+IMKgb3V0X3ZkZF9vZmY6Cgo=
