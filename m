Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8426BA70F44
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 03:59:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82CD10E2A8;
	Wed, 26 Mar 2025 02:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQK+28h0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9791010E2A8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 02:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742957964; x=1774493964;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Wwdbo4jChh/IypcoFDoGV1E8pzDinIA4VDPEyavgzvc=;
 b=JQK+28h0+Lq9wfR79W3IScj3yFVIsQ3IjH+1qvF/6tMFq/lMviuwdpDw
 0/lNsYgZrUJ6Po1/T1lBb4p0GDqcWWKRH40YbXX8iQeq08K+fnS6bhxNY
 Olu+oVBH/1cxwOawfLAUq0rqgfr4WPWR98ZxUx27xcZewtBSepWUos+ni
 Z5nRqy3Fmy/yujzD9hIkQbuPKx0sVxLHmzMUIVOO70/EzL4ySD86vaVYc
 7B50vkh4x2cl9h0dNxOjlEPxXW344Ep5DXJLgAHMMBf4x0bE9xu47SpNg
 f86B8Dc1HKdK20+Ye2xmp8BSW4v2W5DLQ9V/siAWQlrQT/IEr9NYImWDX g==;
X-CSE-ConnectionGUID: s2sDWckTQheKZphpFaz2VA==
X-CSE-MsgGUID: uK4V3/WuSF2er97/9JqPcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54877578"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="54877578"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 19:59:22 -0700
X-CSE-ConnectionGUID: jWt9cvi/Rca62M+mxCXztQ==
X-CSE-MsgGUID: MFZhtuUxTwSAOXYuiEVajg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="129702389"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 19:59:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 19:59:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 19:59:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 19:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MRh8cFtgMDMTQBOYtAVpUvXg7fzmMtpZradlKLutSaJGATCek48NQBeX34zxqwIi7Sn7vngsGtFLBLBak8QrGWz1Yd8XfawbHxwImGUuyr3My5dRG02GHS+WefDqiWwUbv9BXm+JObeItwH2gjwyKpO9xB5GdzthqtKbIW2tkVFPpmAhL7kd58flHrverb5iBfDJdcfx/12cWhEvhVRjIGdxTWDHcGvyGWYOXtlqp3+1qAzOyiGOxMLfW3S1rEoUK84/LqUlFm0/0rlPIJ/C+tS9JZlikmHA1hybKKwIorQqgCFcOwAvYQBvUtmOzejzSoA37VUnytQkhNZmlXPRXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wwdbo4jChh/IypcoFDoGV1E8pzDinIA4VDPEyavgzvc=;
 b=tg+dWbS8ctIagJ0mKQUoqsGwECEy6PjQ/x94C+RGf69fDSkl7WEKhhRA34pD4C1bo7ejIzrmzxHnrkWWJx0uZsyd2g0gGb6G3qBz9sJK54PMgdoEXo3nGIaUbsq103stS2Rq66wpGp1RedsLed1a/BaLOwXfXXsyyJK3Wbx6ct8OcLuqO91fJrnF4vRwesNTsLvp5y1h8RHzBw2F2wOcH48tlJHdL+NoW1F+sfy0SUlt8h0enh0XTjbJqXfLS78Em4lE0Uqxp09+OO8FCf83kvqPVvAwF1n58Mgzq93xzCdpejIWz8ATcVoGRStsuM9FpUlgRcAwB1MIsgg8HKxnIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 02:59:19 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 02:59:18 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 Xiaogang.Chen <xiaogang.chen@amd.com>, "kraxel@redhat.com"
 <kraxel@redhat.com>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: RE: [PATCH] udmabuf: fix a buf size overflow issue during udmabuf
 creation
Thread-Topic: [PATCH] udmabuf: fix a buf size overflow issue during udmabuf
 creation
Thread-Index: AQHbmn/fUd4ZT7YUtUKBH62R28NelbOCMOiAgAEp1qCAADcSgIAAnWeQ
Date: Wed, 26 Mar 2025 02:59:18 +0000
Message-ID: <IA0PR11MB71859EE03E705A33BB5274F3F8A62@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250321164126.329638-1-xiaogang.chen@amd.com>
 <555feb70-5d80-4a36-818f-f00fbc3dff23@amd.com>
 <IA0PR11MB718563F5C571E07F1314F152F8A72@IA0PR11MB7185.namprd11.prod.outlook.com>
 <099dbff3-42fb-4445-b5a0-1c4031bb9e7c@amd.com>
In-Reply-To: <099dbff3-42fb-4445-b5a0-1c4031bb9e7c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH8PR11MB6999:EE_
x-ms-office365-filtering-correlation-id: 8e6c141a-9f74-4cae-1ad9-08dd6c1233b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cUl0TVF1c2Fub2tUWFM4NXY4bEJ4dUVscEpVOXAxS01BQkdrNlNRdXJwdDNL?=
 =?utf-8?B?bVBjelVkeG5vRnBDNmRhV2dmTkJZL0IvVzFoM21FdjMwUkhkaGE5aVN6Wjly?=
 =?utf-8?B?UXdJU3V1QVBSZ3NMUXVZd3c4V25zeUY3ejNpQnJzNkVpb2RXdkxJQjZXbkFl?=
 =?utf-8?B?TFNZa0szYjdRR0tNODhSb2hEZkZOUGZ0aDBXMjA3U0pBNFBrMUVJZHJ1aVFC?=
 =?utf-8?B?aE9RVzlHZVBjaXhBVWFjNzI5Sk9DVU1rZ0pHcjZvNmpLTXZKdWpta29ocUtY?=
 =?utf-8?B?L29LQW1TOWJPbVVwYlNyL3pic29URnFQYWVyVTQzWXhJQy9aUEgvazZaeHZr?=
 =?utf-8?B?RzNEcUNOdXBLYVlueHBTb0FlRFFScHYxdlhBejZabFZWTXBHVWJzQnJYUmNH?=
 =?utf-8?B?L09BYitoV1hsMjJ2YUZLbGxuU045N2pQU05CUWFEOUJFbXlIQzNMZ0x2MzNl?=
 =?utf-8?B?Z1EydnBqam1jbmwyOExaU2xDN3VYcWVPV3Y0WjBDUGhBY21sNndneWR0L0py?=
 =?utf-8?B?OW5MT1R4U21DQ3FVU3BzK3YrVmhTWjNYc0VkWTZ4SDZudFAycGpIWEJlWGp2?=
 =?utf-8?B?bDZjNUhtVG1uWlFXKzRUeWNuTE5JUmsxbTFZYzRzQ2ZCczJjMDZXajFTazY1?=
 =?utf-8?B?ZHZnNzJzRktocDdhclU4WGtFTGtyaWFHZWhKVFhEQ3hxdDRzS0dqa1JKKzJl?=
 =?utf-8?B?SUNHUGJjTUFvY3laSTZJb3pQUDlqdVd5WS9rZmRkVUt0VnNaelZUSHBxZUZo?=
 =?utf-8?B?eDRyQzJlT2ZmTnZEa3lKZjR2ajV2Z0o2SCtnM3h6Yy9jZ3ZwcEtLTGwrRGZL?=
 =?utf-8?B?MlM2TjJCcFhiMmZPelZsdGxDaDB4T3B2RnhBaTNmVStNRGhMZEIybll1MGZh?=
 =?utf-8?B?VVM5RCt3Q2pBRGNxblNteE1XaDhON1cwT1BQMTc0TVV2bDQ3Q2xkak53L3VI?=
 =?utf-8?B?UTJDcHhPQVpIWGVPemlqOGZ1YkxOQjg3VllmRUZXdDNpSGxEaGFZVXdiVjdN?=
 =?utf-8?B?cWRuY2lkb3I4Y21qVlpYcVFYeVdsUVlUTTdvS2JmZHJpZmNEVlY0MENYTnZ1?=
 =?utf-8?B?YXVEcjhWZDJCcWpMbjhPb29tVStPQzc4K0pOSkJ0aThtYmJNSU5vK3JMMVRC?=
 =?utf-8?B?bzBiOVNrWWdTVG43NzljY2RVN0E4b1Q5N0c4a1hwMXRkMmN4ZlROclJVVXl0?=
 =?utf-8?B?MDgxMzJMcUg5SmhMQ21QUUd6RHkwNVRjRjNqSzBUdHN3K1lwU1Baa3ZFaHMw?=
 =?utf-8?B?cndNaUdjWElZc1BYbDZWUnpSMXZxNDRNaTE5T1RJS1VDSCtMcExlMll6VWNt?=
 =?utf-8?B?WUpRdDFnS21Ib01hdm9weDlWQS9aM3JEMElnaHFEN1Y1ZzJlWmFvYStMeFd4?=
 =?utf-8?B?ODZFTVVLSVVsdEV6QXI4NU9KQVFJZTJJYmZ2aHNHcjN0cktBbjZTQ2RFRFgy?=
 =?utf-8?B?akt0SFVSa1UyMitMY21ESFRqalY3OGU4WTRaWlBNZkR1Vys3VXk1YUcwdW1T?=
 =?utf-8?B?NU5DUEx0eDFQVFZaMVdVNncySHdpQTVGWm1kN2dRTnIwWVppUVNVRFViNnkz?=
 =?utf-8?B?T2NHRmxrdWI3dVZBVlNhVjVHRzQvaStqUmdLUWxuUkdNN1g5WGZqOTM5MWlx?=
 =?utf-8?B?OWtDN2dzQy9XYkpnaWc4RVdCM3hrb2dyUE1TTW9CdHhNbVBoLy9SdTlwaU1z?=
 =?utf-8?B?bnVSbEJhNDRZT09zN21BZkhnVDI2bUZYR0FpMzBoR2p1ZE1tTWd4LzVjY1JM?=
 =?utf-8?B?ODJMYUtERE1IOWNMdk11ZHRWR0dkUVhkYVc3K3hraERTSTJhdVBsdjhGS2pB?=
 =?utf-8?B?VE5VZ1JnSzJFOXd5MXdIQkdkajl4a1lobFVCMzkrTmkzL2VzZ2NHZU45dktn?=
 =?utf-8?B?SExxVWVlZVJpYVQ2MzgyOEgrcmR5WDE1Q0xSNnFTODVXbnArcjUxRkNDZGhq?=
 =?utf-8?Q?zFDqIVgJFfGl0grMS85oTtL5W4Mp+QQM?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OWdPdG9MamdxSU5KYktLRWw5M3BXWDZTTjNHRmNLVEE0ZER3TDB4eE8yTklX?=
 =?utf-8?B?UW1Wa00wVFBqMFBrTCs2MmZEZ1V4d3hiWnhtTlhQanc0SkR3V0FnWVE1cjlW?=
 =?utf-8?B?Tnh1cTYwdjkvczBFMlBFNmNLOWxoSHJpSGViNFBmNit4MExkZzl5eVplNkJN?=
 =?utf-8?B?a1IvS0hRUjNzbERSNGMrbXdjQ0g3eXE1Yk9OKzFjUGVrZ0w2a1NJZjhUU2Ey?=
 =?utf-8?B?V0ZLQmFrMzRMNFMrc29LYWNDbmpzTTZ1UU9sQnM5NmhTQ1Y1dm5ia1REdmw4?=
 =?utf-8?B?aC92SkNSb3dNUDZPQWlPMXFHTDJNdzJuU0FxTzlQVHpadDBzTTBudHdtb2c4?=
 =?utf-8?B?NGZ1Kzhnc2xqZ0l5L1pnamtJd0JVMmNzRkNrRXkwOGl3Tkc0aHZoYnBBMGVl?=
 =?utf-8?B?TjdKbUh1MkFZc3JVWkFLb2RkRjE4djhFK3lhOFJDbkZYdnZieHoxVmNlTUp1?=
 =?utf-8?B?ZDJHY3NmZUpiejZhQ3FrcTNUeDVYZ3kvNmw3TVhsM2tteEZpSXJ4RmlQQ29F?=
 =?utf-8?B?Z2xZOXBzN2VRaHhVbW9WeWdSeDZyY0RySktxY09OcVhGaVlScUFhVVhCS3VZ?=
 =?utf-8?B?ZXNjU0FkcUpONmtCbG05UWZLNXJsZTZPdEkwWGJoNkRjOGdmQU8rR0Fkbytl?=
 =?utf-8?B?RFdYUjc2WU5EUEZuZmhSNWwvTXk1ZVdRUEduNDU2Q3ZseVpWRHF6bUR0eFlO?=
 =?utf-8?B?bXVJTTJwNGR4dUdJN09YNEpCeGxDdWJxME9GWXNaL3owUUsrRW13d2ZCaVg2?=
 =?utf-8?B?Q2RGNDVoU1F1V2R0dS81bGY3WnE4SXB5L09LUWUrdVI4SEVyeFlIeXJvNnVR?=
 =?utf-8?B?NmRoNTVUUXV5dkhpS3UrSkZuS2R6cWNGUmdhUXkrd0ovaGUrOTJhOHFTd2Fw?=
 =?utf-8?B?STlCWDhTZEVNWk8zU2pQOWUxaFlqcmRSVDU1RGg1bTUyb2pmcnB1UCt3UlJ2?=
 =?utf-8?B?NDVtUWVwbTdPNHFjMFAralRQTnd1ZFlvc2cyMlpNNXo2M3pVeWdtTVBDQ2E4?=
 =?utf-8?B?SkFMZk1qdkk1ODNvUjdJaDR1ekR1dDJHUnczOTR2RVBNNFE2RGNqcTBNMllY?=
 =?utf-8?B?WlQ3YXcwa1MrKyswaG5Ua1V6ZXVCQzV1YyszcUlDbzdGa2RkVXNiSFV1VE9N?=
 =?utf-8?B?RkFPb1UzbGtSb0VCdHlncHlEbG9uYXNBRnlzREV5Uk8rQXhTZUN1cVZyU2ZU?=
 =?utf-8?B?enJ1VnlzM3I2VlF4eFQ2U0lrMzJXUGNFbzA4eXltZTQ0cDdJM2l0VVBvekdm?=
 =?utf-8?B?ZjBRT3ZXbFFleTBuMUw1YUowK1pkeDMvdVdBSmZPRXVYaTB1MngzUWpJbDlQ?=
 =?utf-8?B?eGQwdEs4eXBiL3pVQnFQRVZZR1NvUDZKVTduOWNrWERaVkYvMlJCbWpkMHda?=
 =?utf-8?B?ZGd2OXc0L1llTWI1SWJnbWMvVEEwMUJmc0dWa1NQSTdEUDB6dXM0bFJLOU5Y?=
 =?utf-8?B?Tk92N2ViWWtsODU3cFB5ZzBzWDU0TW9SN3VVbnFSWDZ3WWtkb2p3MlNycERW?=
 =?utf-8?B?eEJoS1JnTmphbjJoVHVHcTc5Mi9kQVhvQlNabGxuNythUTdDdURrelFDQngr?=
 =?utf-8?B?WjB6UzFwaW55SEVBYXI3SzNld2kvMVJMWTRwZ3RFRGhjVWp6a2hyOExKTnBt?=
 =?utf-8?B?UEYvZ0xQZ2cyL1R2aGIwS0hmTTBNZUo4Mm5GUXNxZlQzMkhDZ2FKV2Iya1hz?=
 =?utf-8?B?Wmgrc2xJQTlvOEJBZEhURXJSQkNGYmMyK2pYWWZPOEdHRWRhM1hscS95THc3?=
 =?utf-8?B?ZldBcnJBZGtmbVowRFNzRkYrVkpXaXE0SUdZRGpJWC96RkV0YjhGdUVEVzdN?=
 =?utf-8?B?VDRyNzEwcDdOQkQwSVl3cCs5WHk1WkVLcGs5OHBXY1Z4Z0tVOWVLay9DbkhN?=
 =?utf-8?B?Ujd4NERlZmxMSHI5QTRnWTkwTDR1VGpmQWRnd1pNaHNwdHMrdGxPSnN4YkpC?=
 =?utf-8?B?SlBSYXJ5eTBJMGttK0FnUmNtZmpuWjFPUjlqa2RxSGwwVklLa1FLclFaSTVK?=
 =?utf-8?B?aGhyeEdmVHFERGpRVWNYL1ErWlRoYUkwVzNMY3FnZWtVcWw1LzRlNjlLWkZI?=
 =?utf-8?B?TmpMU0M5SzFYMVJYTnhjdER3N1hqT1FCbjgxcEltekU0dndBUW9WOWVBOHVF?=
 =?utf-8?Q?BEofI6BZV+3STnrJrbMhMH+g+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6c141a-9f74-4cae-1ad9-08dd6c1233b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 02:59:18.8980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CiAsb8leYxsCM/289teZxQnj8+oFBBfxrZCOwvGcY3qquoSDjSiI7afGIWMOq1aqAr7xbzkoGck3oWWQQs6V8shIhD8l6gKqYhvp6IMsT3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
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

SGkgQ2hyaXN0aWFuLA0KDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHVkbWFidWY6IGZpeCBhIGJ1
ZiBzaXplIG92ZXJmbG93IGlzc3VlIGR1cmluZyB1ZG1hYnVmDQo+IGNyZWF0aW9uDQo+IA0KPiBB
bSAyNS4wMy4yNSB1bSAwNzoyMyBzY2hyaWViIEthc2lyZWRkeSwgVml2ZWs6DQo+ID4gSGkgQ2hy
aXN0aWFuLA0KPiA+DQo+ID4+IEFtIDIxLjAzLjI1IHVtIDE3OjQxIHNjaHJpZWIgWGlhb2dhbmcu
Q2hlbjoNCj4gPj4+IEZyb206IFhpYW9nYW5nIENoZW4gPHhpYW9nYW5nLmNoZW5AYW1kLmNvbT4N
Cj4gPj4+DQo+ID4+PiBieSBjYXN0aW5nIHNpemVfbGltaXRfbWIgdG8gdTY0ICB3aGVuIGNhbGN1
bGF0ZSBwZ2xpbWl0Lg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFhpYW9nYW5nIENoZW48
WGlhb2dhbmcuQ2hlbkBhbWQuY29tPg0KPiA+PiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5p
ZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiA+Pg0KPiA+PiBJZiBub2JvZHkgb2JqZWN0
cyBJJ20gZ29pbmcgdG8gcHVzaCB0aGF0IHRvIGRybS1taXNjLWZpeGVzLg0KPiA+IE5vIG9iamVj
dGlvbiBidXQgSSB3aXNoIHRoZSBhdXRob3Igd291bGQgaGF2ZSBhZGRlZCBtb3JlIGRldGFpbHMg
aW4gdGhlDQo+IGNvbW1pdA0KPiA+IG1lc3NhZ2UgcGFydGljdWxhcmx5IHRoZSB2YWx1ZSB0aGV5
IGhhdmUgdXNlZCB0byB0cmlnZ2VyIHRoZSBvdmVyZmxvdy4gSQ0KPiBndWVzcw0KPiA+IFhpYW9n
YW5nIGNhbiBzdGlsbCBjb21tZW50IGhlcmUgYW5kIGJyaWVmbHkgZGVzY3JpYmUgdGhlIGV4YWN0
IHVzZS0NCj4gY2FzZS90ZXN0LWNhc2UNCj4gPiB0aGV5IGFyZSBydW5uaW5nIHdoZXJlIHRoZXkg
ZW5jb3VudGVyZWQgdGhpcyBpc3N1ZS4NCj4gDQo+IElzbid0IHRoYXQgb2J2aW91cz8gQXQgbGVh
c3QgaXQgd2FzIGZvciBtZS4NCj4gDQo+IEFzIHNvb24gYXMgeW91IGhhdmUgYSB2YWx1ZSBsYXJn
ZXIgdGhhbiA0MDk1IHRoZSAzMmJpdCBtdWx0aXBsaWNhdGlvbg0KPiBvdmVyZmxvd3MsIHJlc3Vs
dGluZyBpbiBpbmNvcnJlY3RseSBsaW1pdGluZyB0aGUgYnVmZmVyIHNpemUuDQpSaWdodCwgdGhh
dCBwYXJ0IG1ha2VzIHNlbnNlLiBJIHdhcyBtb3N0bHkgY3VyaW91cyBhYm91dCB3aHkgb3IgaG93
IHRoZXkNCndlcmUgdXNpbmcgc3VjaCBhIGxhcmdlIGJ1ZmZlciAodXNlLWNhc2UgZGV0YWlscyku
IA0KDQpUaGFua3MsDQpWaXZlaw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+IA0K
PiA+DQo+ID4gVGhhbmtzLA0KPiA+IFZpdmVrDQo+ID4NCj4gPj4gUmVnYXJkcywNCj4gPj4gQ2hy
aXN0aWFuLg0KPiA+Pg0KPiA+Pj4gLS0tDQo+ID4+PiAgZHJpdmVycy9kbWEtYnVmL3VkbWFidWYu
YyB8IDIgKy0NCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYu
YyBiL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMNCj4gPj4+IGluZGV4IDhjZTFmMDc0YzJkMy4u
ZTk5ZTNhNjVhNDcwIDEwMDY0NA0KPiA+Pj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYu
Yw0KPiA+Pj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYw0KPiA+Pj4gQEAgLTM5OCw3
ICszOTgsNyBAQCBzdGF0aWMgbG9uZyB1ZG1hYnVmX2NyZWF0ZShzdHJ1Y3QgbWlzY2RldmljZQ0K
PiA+PiAqZGV2aWNlLA0KPiA+Pj4gIAlpZiAoIXVidWYpDQo+ID4+PiAgCQlyZXR1cm4gLUVOT01F
TTsNCj4gPj4+DQo+ID4+PiAtCXBnbGltaXQgPSAoc2l6ZV9saW1pdF9tYiAqIDEwMjQgKiAxMDI0
KSA+PiBQQUdFX1NISUZUOw0KPiA+Pj4gKwlwZ2xpbWl0ID0gKCh1NjQpc2l6ZV9saW1pdF9tYiAq
IDEwMjQgKiAxMDI0KSA+PiBQQUdFX1NISUZUOw0KPiA+Pj4gIAlmb3IgKGkgPSAwOyBpIDwgaGVh
ZC0+Y291bnQ7IGkrKykgew0KPiA+Pj4gIAkJcGdvZmZfdCBzdWJwZ2NudDsNCj4gPj4+DQoNCg==
