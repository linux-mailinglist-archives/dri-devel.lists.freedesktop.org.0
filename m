Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCqDDpBwemlI6QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 21:24:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E47A8763
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 21:24:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392E610E765;
	Wed, 28 Jan 2026 20:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NWq4Thi/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302E210E765;
 Wed, 28 Jan 2026 20:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769631883; x=1801167883;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BGke+ArJSfWK+RQCGP9wWeAhOyVp3IVB4xQ2AA86zjI=;
 b=NWq4Thi/cMOeFP2ZcfMLQP/oii3lZDJovSQkxTpB6J4zm7kiW9dCoRz0
 1AxUBrRRH6us/Wpqiu442R3DwK5FeApWE5faZ7V4ouhIHDtZY0ikBDTVT
 qSIw9CXoHLK9NCgYvGLUTzp//eweCKygsyrKZorjIvdruy9TueO1x/ecy
 bPijAOjpjQoQfDgTHwjDytPiLSkThTtxv69gZJxbYwYmvQ0HU17sfw4dz
 0zsH0jcRmuRJwdSLA5cEUorEV5ri1LHwcUIIRMtAsSUk9/IWhhpKGP4xA
 znJGXdwR7VEOhWtY3NVvpzdULMsvpfJ8T2nQqehhBYmGCCL7Wlfrpf+4m g==;
X-CSE-ConnectionGUID: 5DSV8PdNSxawhNdSoTG4zw==
X-CSE-MsgGUID: xZo4tLZZSQ2b00a8omrL+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70947508"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70947508"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 12:24:42 -0800
X-CSE-ConnectionGUID: ZJu/+phXQe+usFjOBxOXpw==
X-CSE-MsgGUID: uWVkPMW8Tk6D1keAPYbwGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="213337095"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 12:24:42 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 12:24:37 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 12:24:37 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.58)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 12:24:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osYRHa1HH9PgoHW0yfP6FoBJ9xqO/nehZqEDA4qh+2CmMykQov4HL88+s507LUEsjlWvoisZ7bzsC6FXkc+K4E7acmOGV3BwDtmoZf8GVbSilZC65BvsixlE1LsRapS0dm40WAvERBirtdvWixISfrK8ZS8UKHOBEatb63r9+cXHS2muEbFaI0WQRFCTlK48O6PQ3kFSaJf8NS2B42KwL3SBycvfHwPWJmaOKpEROV0B9UZjYG6hAwZK3nAkuyq98QYmK1CbeManmAo2xaLEJU1TXMwqniMmM515Ljd+2T9V1DQ74JsiN5ENBswH4XXYojYvuLrlgiWE2YJFWQ9fww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzvJziF7PJBzZj7OmQdm589Z1xsTaxkU829HwH2TxRQ=;
 b=Y7fCQnYRAN5LTVBoijN3vgOVyNN0r8N1SRzdeiw0LVGayrnEQhj5baKBkHq2AqlBJ/Xl7R3QS9+OctmajcctAS/pj5+JIzcA17Kz2wFypv6D1EtklZlF0DEyGOGKSp8lRiBmBlug4WkFE+gLS5SW4yBLqXNU6F+HJSw723fecv1fAx882X/YRHwllkFzKDDSWGWiX/GFBZIi/cD9i3u24xNwpBlEVlfj/MxC91IqxDFXOwL7+fT1OltY83sMCJAjLxNshjyOg7T6NkE0cLD+67SB71kYkdQFHxYtiuknZwu0NiFFApoMYLMypJwN1DIMgNz8s24V1RFR9ctH//NNQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPFA424F92C2.namprd11.prod.outlook.com (2603:10b6:f:fc02::41)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 28 Jan
 2026 20:24:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 20:24:28 +0000
Date: Wed, 28 Jan 2026 12:24:25 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <leonro@nvidia.com>, <francois.dugast@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <himal.prasad.ghimiray@intel.com>
Subject: Re: [RFC PATCH v3 06/11] drm/pagemap: Add IOVA interface to DRM
 pagemap
Message-ID: <aXpwecQRovIurYKV@lstrano-desk.jf.intel.com>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-7-matthew.brost@intel.com>
 <20260128151458.GJ1641016@ziepe.ca>
 <aXpYrfUmEaaOsse8@lstrano-desk.jf.intel.com>
 <20260128193509.GU1641016@ziepe.ca>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128193509.GU1641016@ziepe.ca>
X-ClientProxiedBy: MW4PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:303:dc::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPFA424F92C2:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa6724f-5014-4171-a895-08de5eab3cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWRZUG5lZHZtSmVkWm5FcTFJTkR2b3Zmc2lMbEhyS0lLOHhhSk1IbXdWTnNF?=
 =?utf-8?B?anhiaVdmVzJUZmpxdHBvbzJxQlVVZm9yMks1RktqZnJ2RjBnSE1tYWdxbjUr?=
 =?utf-8?B?dDNzWWpERWF6NWJpOGFzb0Y0ejhvZjh6KzBUSlEzWFZuRHgvaUhOUzFIOFho?=
 =?utf-8?B?ellXS0NIOTd4eWNQMTM2OGFJM1hYVGZCR1ZYOHJ2YTVjdGhObnpseVVDMWhm?=
 =?utf-8?B?NVJhbXV2MGx4NDNERHVoZFFiQU82RmtLUzdXaWxPYWV0akFIWHdENVVBb1Vy?=
 =?utf-8?B?eG4vWnJsTEJLK3Q4bDdNUXJLOEZCSm5iaTFhWEk2V3lVd0wyODYwai9oUGhF?=
 =?utf-8?B?Wkx1bEZkL3NZbTJKMDE3WEpKaDJrSTlHWWZLeG5xNndybXNIeVFudUdNMTdO?=
 =?utf-8?B?RVVXYlZOdW1YOFVNVDQzc3F3c1ZFTEhqSldGS1JOVWZBWGJPUDhJZEVURG5j?=
 =?utf-8?B?TTB3T2cvb2JleENMakk5Q3FnbWdFdi9ueDhRRWNFN2YwUWR5MWVIMGVsZVNL?=
 =?utf-8?B?TzhSQXIyQ3RhaFltUStsaTIzbFdlYzE3OGMybE00cnNQVG1tckN0VDlSSmEr?=
 =?utf-8?B?UjZHaFk5Q1ByckhuREpzTTUzY3JMTExzdlRyK29FWkt6NzYwV3lWQzlMNExX?=
 =?utf-8?B?QzF3ZXZ5dHZONEgybjlFbUgvUU5jUS9nRDhEelJZMFlpOExRZkZ2Yk9BcXpW?=
 =?utf-8?B?cVdVL3dlTTR1Nk5MNFNPSlJLMGZuZmFnMWJnbENwWW5WRlkzWmNubUp4My9J?=
 =?utf-8?B?Z0I3VE85TXBraE5KWWZKd0t2WHNhYmZaWk4yMlNUbExhMXV3YXdOWjhUdFFN?=
 =?utf-8?B?T1dqekxBRDZqLytzYlFtU1YzTjloa3V4cWpNQlZOMlREZFdvUS81SzRRMVJs?=
 =?utf-8?B?d1FwSGY1YjgvcEFhUVZXQllza3NOaG8weW1xektpNHVvbUhMZUljcHNwNW9L?=
 =?utf-8?B?cXJQZjNNMkxQOUVkYkw3c3BLMUVFWDVpOEpRQlNnaUJhR1hKNmlacjBEVmZY?=
 =?utf-8?B?aXdrUG1yQ2hlVVZxKzZkM01wUTIwZUNkOG9FcWVyMGRHNkRHVnZDemlLNGVH?=
 =?utf-8?B?eWZOWVFpYko0d3o4RFhQMjVnYUZYRDgyQ2dJK0VNOUkvQnVMWlhjMXZKVFFa?=
 =?utf-8?B?dVlDdG9JVDBEZzlMUEhYNjhnRWhrdHZqZS9iaTRIZS9PSXkvRDFFeVJUZEVn?=
 =?utf-8?B?SjdEdG9zV0JxcldSc1ZvUUsxT3RsZW1EdFRuTmtSS0JQUk1CM0N5M0FPZjRj?=
 =?utf-8?B?bHFYU3NNcFJ6c3I3ZmFVUXN6SUJSZzZpYlkyUVNiUjBSTHM5WEFlVUI2aVgx?=
 =?utf-8?B?YmJ1Yko5OHl6RXJDSWFYZmoxZUx3cWszUTBUNHNhVVpzcC9MeElLODQwcjIv?=
 =?utf-8?B?NndBakJGb0tFNnYySmhMbDU0ZVVsbjJkS0VWbHVDWTdGT3U3UG9vRUI1eFQ1?=
 =?utf-8?B?RkVSUWNUYk4yNnc5V3JOTWszNnIzYlBmRVBwTEtXZDdwMlR0Z2duVTRDY21F?=
 =?utf-8?B?OXpBQWZkQXpaMXg1UXRQQjF0MmdNMkdGM3c3bFZOMzJKMnhDaHhtbDlJdFhL?=
 =?utf-8?B?a0ltNlFRSC8zOGhkSkNMbi85MnpSbEZMN0Y3bGIwbHIvc2ZRWW9pbG5aNFJQ?=
 =?utf-8?B?R0FKaXkvN3JQbEF0QThzeWdnVFlhejdmMWs5TFZsTGpvMmNPb0I1Wi9TSmtY?=
 =?utf-8?B?UGVvdk5hdGIzT2pQUFRmOUpGbkN1WTl6QXZMNXZQRDZUOTBDOG0wNVF1bUJT?=
 =?utf-8?B?K3E1dFNNdEI5SXFTNndmaEVuREZzeFRaTFNrL3B0UjQ4Wkx1dmZianNQQTd0?=
 =?utf-8?B?QU40dTFEbFpoRkFFblpvUHRIdjRmR2tUaWdYSXpCenc5UnREUGxPYzE1YXZY?=
 =?utf-8?B?YWpSbUlia0w4WWZLMzJkYmFUdXFiQVdSYXJGZFpqRmN4T0I5d2d3NzJpN3RE?=
 =?utf-8?B?N1d1VGFCRHY2eGpTSTJLRkw1Z3N0MFdIZWdWV0pPWm1oUEpBUldTbjFqaEdY?=
 =?utf-8?B?UWpJU1JINnhHYURENjNPci8rczRwMk5HUnIvTFU1R3ZMUHhnY1NMZVlRNGNL?=
 =?utf-8?B?TkRFZmM5NHpyaThsak1hQk4wMDFNdnU2d0hJMU0zY09qakl2ck5vVnlBb2M2?=
 =?utf-8?Q?W3NQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUtvdzdjeDduLytOMkMrTE1Nb0lXUVhXRnhYdm5mVmFTbmQzZUJnekFIaDIv?=
 =?utf-8?B?QitzR0creGx4OWZ3cWN6aE9NRUsweW1oYTU3SWFGRlM3aEZFaVR3SFc1VUxE?=
 =?utf-8?B?dWFHdS8vRmhDUVNhUmlVbDNQUXh6cjRhdXdkZ2hmTDVTdFJaTkdnekZMSEFN?=
 =?utf-8?B?MmtIdGxqSGx5aXN5UDVPNHcrQ0V0QVNRSnVGVkpmRTFha2NMODdJZEJSTHNH?=
 =?utf-8?B?YVpyNW8ySlRyblIvTkUrVm9NUExrWUhMVmdHOUpIQUtKMW1vNjhiRytIVnZ0?=
 =?utf-8?B?UmpWdDltTWpneGdCRVREQXo1NUo1N2tmRFVEUS9PbFdzWHBVcGxBRDg1U2pa?=
 =?utf-8?B?c2xIMmY3VjBIOGxsbFhXUHp6MFlJVXk3NUpDVk5UZFRJL3RiNzNrN2N1dVZ1?=
 =?utf-8?B?UnhPZGFqOHdkKzZteFZ0ZElpb2xDNjU3ZDIrSWRWZEQ1aUtSZXZMaXB1ODh5?=
 =?utf-8?B?eHBaeHR0OGxoL2hKQjk5RVlLalAwWU9ZcnJQN0s5ZUVacnMyL0t4YnZyaHVI?=
 =?utf-8?B?YjcwZUpDalp4MWJvRlVTL080NXFFbEpUMktadDlaZWtOWTZkLzNSS2wxRTZT?=
 =?utf-8?B?OTA5L1RKdVRiZTNEaFhnd3d3Ukp3Si9IamFPUmVHek5GZUE5Yld6Z1BSNFNw?=
 =?utf-8?B?SGRkd3Y5eGhuQTBLYWp4MkM3TkFXbXNvSE00TGVTL0ZIRmRFR0pUYnZvSkor?=
 =?utf-8?B?V2ZuYW1hZW51a1VncTh6aUI2QjhVUlIwZVFBOXZzeFhqQi9sUHhaV0g4dWg0?=
 =?utf-8?B?dDhzdGUrR2psbWgwZzIzMVp2THVON0NBRDFiSjNRZFVTT3NCRGxnTTAwN0NL?=
 =?utf-8?B?MUhQb1hxaGFqSkNhbUJoRmhGY0M2ZThLL24vK21GcHZKVTIxd0FEV3d3TFQx?=
 =?utf-8?B?ZVd3MmhhOE5rREZvdWdVMEUxbXhyV3RDMDdMMWxraS9SbTFNRkdKQjcvSG43?=
 =?utf-8?B?ZnFkYWYydHczWDNZbU9tZXVvc0VrRFY3cS9NQ1JFYUt2SEpJanBOcUsvVDA2?=
 =?utf-8?B?U3ptSDJZbnMrSDRIMlV4bDF2RzFtZW9WRnBCRDVzN1JxRStTTXc2WWxlUGJC?=
 =?utf-8?B?aTZpRDRnZ3lKd2k4NEljS2tiNjZhWTFaZGRQMUk5U09HZlFPN0d1bGdSdkpw?=
 =?utf-8?B?Wkh1clhCTE92dTZpVXkzVUs0dGdRQ3BPdnJSanY1WmZ4eWZ2TWZKN05NczJR?=
 =?utf-8?B?eWxJdm1YUjJITGFna3BKZ1hjUmtMOGNubitKdlZZbDdkNnJqT2UxcWZKcUNt?=
 =?utf-8?B?SVIrVkc3MWxvMmFONS91TjFCdmhIMUI0TmNLY3ZKNy96OWZ6OFJKSHpsUTRK?=
 =?utf-8?B?L2RUTThaUXh5Q3lVdmNTRHNKdVdKbE9iSjFhMXNqZklyZ2hMZjhNQXJxdEQz?=
 =?utf-8?B?YUsvWFRjdEdjM2RoTUhPL0MrQkd0N2NUQVZFNGdVN3Z3RU1FaGtBZTBPbVRJ?=
 =?utf-8?B?SnE0OC9MR0w0R0pDRDFjRURLeThEVXVCc0pSRTZqeVpBSEFqQ056RVJnQ1pu?=
 =?utf-8?B?ZVdvNDJES1FueWEycGRTQ21zN1pISDczcHNSclUvNmdQelhHSzFDVXJwR2Vm?=
 =?utf-8?B?WE1SajdXOCs5UVUrYUkxQ0NpK2cvblZoSmJxczFObXY2N0E1K1NPV3V4cFBP?=
 =?utf-8?B?d05ReVZXTWQ4NVpXK0IxQ2c4cTdyYTdzRVN6ZmJPVzJhSThBMzEvWitjT3k1?=
 =?utf-8?B?bUE0WlBaa2ErUi9pOW92dHVwL0lONFlpN1pFNlNMZDhUWTZzbUZ5Z3J4by9L?=
 =?utf-8?B?QzJTK2pLc1RwMW1HUWFUS2w1RlRWUU9aOEdwaWZzcWxUei9Hc0dIR3RjZTRK?=
 =?utf-8?B?QmlzNi90RndTRXA1Y2x5RDREaFdXS01xRUdDbjBqQVhFMU9RRTBYSzBnMGc5?=
 =?utf-8?B?cktyQ2hCYWNzSFZXbVlHK1RGWFZVcER2bU5kSmFrOXIzVkVHTVlKQnF0QTgy?=
 =?utf-8?B?YXFtQUE3TTV4ZmlSNytZOVVVZndIQjY4alMyWXA2ZVpZTGl2ZnpFSVZPNkcx?=
 =?utf-8?B?dTFrUFoxU0QwK2ZJaXlWaUR4ZFV4TExsVmdPRmlBSG1PS0haRWVPeG1DbWVF?=
 =?utf-8?B?L0NETGxybWIrZE9lZXQzS1pSbktENHMzdGgwbVlIQWVhcWg1OC9XQi92Y0Jz?=
 =?utf-8?B?cmNMcUk0RnphdFZVNUErdUNzaFM5Z1kyRk83cStsdmpLRms3UitXVHRnM1ZZ?=
 =?utf-8?B?a0JTWUFOdmdSL0FKVFlSQ25yczVCbGlqV2ZLZGxmeXM3VEY2cnVxSUUwZjVO?=
 =?utf-8?B?b2c4dFdlWXQvYTRPdWhVQm5yZzNHak9zRUE3dG9UdXNGNTg1SFgyR1JqVWpV?=
 =?utf-8?B?bGViUUJvMTByc1psdzMzKzVFUnZDUW54UWxENCswREF5ZE9NbWdNTlg1SGZo?=
 =?utf-8?Q?cfyG5goTRi0fg9To=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa6724f-5014-4171-a895-08de5eab3cc1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 20:24:28.6664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXL2LFuOWCcibIsPsMxByk7esTEj7YJJEUYHQaNtMAGUrevmqEGF+UpIvAJPO8C1fghWw/TdymRV9TXlM10uFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA424F92C2
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 40E47A8763
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 03:35:09PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 28, 2026 at 10:42:53AM -0800, Matthew Brost wrote:
> > Yes, this is exactly what I envision here. First, let me explain the
> > possible addressing modes on the UAL fabric:
> > 
> >  - Physical (akin to IOMMU passthrough)
> >  - Virtual (akin to IOMMU enabled)
> > 
> > Physical mode is straightforward — resolve the PFN to a cross-device
> > physical address, then install it into the initiator’s page tables along
> > with a bit indicating routing over the network. In this mode, the vfuncs
> > here are basically NOPs.
> 
> Ugh of course they would invent something so complicated.
> 

Why wouldn't we... But conceptually really fairly close to IOMMU
paththrough vs. enabled.

> I'm not convinced this should be hidden inside DRM. The DMA API is the


Well, what I’m suggesting isn’t in DRM. A UAL API would be its own
layer, much like the DMA API. Of course we could stick this in the DMA
API and make it high-speed-fabric-generic, etc., but I do think the
fabric functions would have their own signatures and semantics (see my
explanation around device_ual_alloc reclaim rules, what locks it is
allowed to take, etc.).

> place to make things mappable and for an open standard like UALink it
> would make sense that the DMA API is the broker to connect things as
> it will be more than just one GPU driver talking to itself.
> 

I agree that a UAL API would just be a broker, similar to the DMA API.
It should support multiple devices and drivers communicating with each
other. If the UAL API only works with, let’s say, two Xe devices, then
we’d be broken.

> There is a journey to get there, but I don't think it is too
> complicated. It also probably ties in fairly nicely with the ideas

I agree it will be a journey and really shouldn't be too complicated.
Open to other ideas here.

> coming for multi path PCIe fabrics.
> 
> > So, if it isn’t clear — these vfuncs hide whether PCIe P2P is being used
> > (IOMMU in passthrough or enabled) or UAL is being used (physical or
> > virtual) for DRM common layer. They manage the resources for the
> > connection and provide the information needed to program the initiator
> > PTEs (address + “use interconnect” vs. “use PCIe P2P bit”).
> 
> This looks like it is taking the DMA API and sticking drm_ in front of
> it :( I don't think this is a good direction for the kernel, DRM
> should not be internally building such key infrastructure.
>

Again, it’s not my intent to stick DRM into this. The DRM parts are
specific to how we do SVM (locking, migrations, page collections for
bindings, etc.) so each driver doesn’t reinvent this piece (see AMD’s
and Nouveau’s implementations), but the UAL mapping logic should be
generic, also being able to used in dma-buf, etc. Also, all of the DRM
SVM parts can be pulled into the device layer if needed as there really
isn't anything DRM specific in it and parts the existing DRM SVM code
could be pushed down into HMM type helpers too. The DRM SVM code only
has a single user for now (Xe) and this will evolve as others just in. 

I can park the latter half of this series for now, as it isn’t really
required aside from multi-GPU performance work, and with larger device
pages this really shouldn’t matter anyway.

My feeling is we probably need to circle back to some high-speed-fabric
API consensus within the next 6-9 months though.

This was just a PoC I started thinking about when converting to IOVA
link for dma-map and UAL ideas popped into my head.

> I'm confident we will see NICs and storage wired up to these fabrics
> as well.
> 

Yes, I agree eventually this will happen.

Matt

> Jason
