Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C88A32A34
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 16:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C9810E8F5;
	Wed, 12 Feb 2025 15:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqehcKvx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E437710E8F5;
 Wed, 12 Feb 2025 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739374707; x=1770910707;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iyR42MjRtKhHnNHyQaYj3Ad5S8vHAxFVP+o2vLK9QKU=;
 b=dqehcKvxL5fgeU7QQ7NwXlsTBLZofj8tClQil/r6ET0vIiTQYN53lrvd
 wany4j4XH15gj7D4AswmDIrw6lko/ZA6zt144bSl9DEWXU8fQN8ckqPHO
 7DajSCi1MqG7KMF/wRIckTFXxUnRpxMjJyTnbWM6Kszv6BqvpAgkInk1y
 wV2gCHF9DRmMz4nxGZqEGa4WgXzHf9RtN32mlaJbcDXL4I/gRJLPbq/sz
 /8mX+xZydp72erVny1g4Tl/qyt4iB4h59dqCa4rQM204oReGyEqr7KBL2
 w/9A5SsuiBK6UDFVDI1GhHlAjp6tx5OHzYHHTVVbSFqh7RcqnBwOpLo5t g==;
X-CSE-ConnectionGUID: 2SU52a1yRRumC1DoF0bQlQ==
X-CSE-MsgGUID: ibA9J6V2SjW4p9fn6CpXaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="51024619"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="51024619"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 07:38:26 -0800
X-CSE-ConnectionGUID: VbswBBq6TVeT9UYeDxy7gw==
X-CSE-MsgGUID: BthqpApcQ26RKrvnc3xuzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="113370646"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 07:38:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 07:38:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 07:38:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 07:38:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A4e8xNcQev84CWBU4U04ZNfz9IgXJdUHctszGPCDdKOIXQeMDvwDJvmmDUSpDNrfs87YmP7L4fk4wgRWTvCTWeFstE6uX8bxNXhzKc5Zn+mj3fE4gabsHAv7AXXykhjdUbz7tKRcearsZUYg9EYUAdac4t9vweCAcPUJ83bGppzDO/STsOg/CzA6VZM7u9ZYKt+NBFTys8MtDZJQ0Tch9+HWGCaexgr6ORKriIpp9FshT6hDCqf/ux7c7dcMgzu/bk7r/eWNABhjL/FVIJaEB6+oG9IH1BrwqwTGA8YG9VHhxqGl2X1bOCGjA08kW+VttHjoii+bLFCQeWkb2zE/Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iyR42MjRtKhHnNHyQaYj3Ad5S8vHAxFVP+o2vLK9QKU=;
 b=F4sTHmVNH/IstfH5k+8CbQ2ydact1YC+ZwTWRB8UnRMAxWPADPHQE1z3JcZEohIyV0JuDjh4JyF6uXYtYml46BJdJISLE3FpZpGJKo+kTUuv1kp3oy7eD2X2j5rICEjpSVf89KLIvLz9YL7nlVIpVWEOFI1MwcQj3dMJsKNTJSmu7cpF3cpIoQbRpCJwqPQwH8F0599d4EAh+lJDD3bCk15YQaywmzNbYqMLgNne6CrUk+psiYhh9oJivxw09UXj8hH3VVJScfIgnTgaVs8u2Opf/cvwTfS2cOH9h68nhEJL3P65E3Z3zZbdGnfh4/0S5LIr0j35lIy6ZpA468goRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 IA1PR11MB8803.namprd11.prod.outlook.com (2603:10b6:208:59a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 15:38:06 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8445.008; Wed, 12 Feb 2025
 15:38:06 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH V9] drm/xe/uapi: Use hint for guc to set GT frequency
Thread-Topic: [PATCH V9] drm/xe/uapi: Use hint for guc to set GT frequency
Thread-Index: AQHbfUdSOVuH4DJRkUCidmmUTgtWu7NDzaOA
Date: Wed, 12 Feb 2025 15:38:06 +0000
Message-ID: <96603cd51996168d49598bcc5e2987976905befe.camel@intel.com>
References: <20250212121814.9947-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250212121814.9947-1-tejas.upadhyay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|IA1PR11MB8803:EE_
x-ms-office365-filtering-correlation-id: 5cf84d62-ad29-46df-44be-08dd4b7b3ed4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UUpuMkRFRUdaTDgwaENVdFB2ZUsxN2xHVGVFMnhPTjFiNlRqTTlDZi91UDZj?=
 =?utf-8?B?UFg5elEwbkxWREN3eC9ER1l4RzkvYUZzOFk0Yk5JM3BKR0dDQW1kVHVMNWRE?=
 =?utf-8?B?RzhYQkE1Q0FKbkVNcFBzWW1UV01pNjJSSytKYmNxKzJMWkJQOEZWN2hQMnRz?=
 =?utf-8?B?b2o0d0ZQSThlVHhxR01HV3h1VlJvWVA4T09yUFhPalFmeXdUZFZpUVpMbFk4?=
 =?utf-8?B?eVY5cVhCMk9aMFlzRkxwb2lNMXRLRm5UNjNoZzhvV2wwR3I3cC81YTgwM2ZL?=
 =?utf-8?B?cWRldVJ4Q3VBQlJoM1RCZlFYa0dnOHdHWGFHMFphK2dZdlNJWE5wTDdzK1pm?=
 =?utf-8?B?L1RXdHNHZU5MUDNoRXREYmhJZFJ2MFJ4T0RWa1BKUkdabENNazZua0p6d3J1?=
 =?utf-8?B?d2xHeGpPVm91K1IyOGt6dnBuMndQNkpWNTFSNWN3YVl4TnhDakk1YlREZjRZ?=
 =?utf-8?B?SStMQWsxQUo3ekkwc0VjcUQ2TGJpMERoZURQVzRWQ3ZPc1pMRit0MnNjcDJy?=
 =?utf-8?B?VEQvMjRRc2xrb1dJWlVXTkdRd2wrc0dZQjcwL0lHWk12ZGNxREk4SXhNWVN6?=
 =?utf-8?B?YU04eVV5SEJCc1RNcW8xME9BMmljbUtQRTBkOGdiSG1SbDhNeDcxUGFObVRP?=
 =?utf-8?B?TE05MisvWjFlZ21xR1VxU1I4Ty9LNjRMS3VYeVlCMjZNMENPUFdseStMZFRH?=
 =?utf-8?B?SkgrSzRjdDZjRlB6bTlKaWNNNG1IVFUxc0JDRHNsR0RZVFlLNnZFQ2l5T1F1?=
 =?utf-8?B?VWtkb1BGSEIzVFZlWm93eHJFdG16Y2E5NStJVzFnZUR5Nng3NkgrN0JWeXpz?=
 =?utf-8?B?eDRNa0w5RUdrYnUxeEhna25tYnFjMzN3WEVrRzByL3c1MFl1Nkc5cWRSOGJs?=
 =?utf-8?B?WDhPVUEwdFhZVUk0SkZiZXBVMDRTZUoyZXd5UGk2b1dENjlKbkZMUE9QK25C?=
 =?utf-8?B?R3Y0QnJKVEdFTjRoOG1uK1RQVkhocko2UVVhWjEzZ0M5aElVcmtDRGVvNmhP?=
 =?utf-8?B?VzJyQlBJalY4VVFWeVB6bmc1dzBaWHJjWmhNSWI4bUFHaGVuWEE3d082YVky?=
 =?utf-8?B?M0tWWkZOYVRiTmdWYzduWTZMMWkyVW1iaVNjOVk1WVF2RGh1ZDJ1cUltSUtB?=
 =?utf-8?B?OExEekdSOHhvYW9RWTZBVDRPRDNVYXgwdlNyUW5SM1RwRWVwQnNQdVJ0UlFE?=
 =?utf-8?B?K29zMjFiUlByVERQWFdUc3dWd0dmMlB0b01ETll1cWptSzlYNEhKRXhNYVlN?=
 =?utf-8?B?KzRMNTg5cVNCWHY3V1B6dkNObHJScjlHRVJlaWp4NnRlaXppakxxc1R1VSs4?=
 =?utf-8?B?eXcyQWNOTE1nOUFBQUF4UTFESEVIR21Fejg5UHNUdk01ektDOGtNNXo5K0pa?=
 =?utf-8?B?Z1V2Qnhsd3k5UFpkWlBMZG1IbE9FbE9JRGowd2Z2dVVzVzBLczNnaEk2MkJi?=
 =?utf-8?B?MGNUaXNIdU8xUkZNNkJsREM2Y2tKZjBaYis3LzY5dWdpc3FRdU5xSjBVdldN?=
 =?utf-8?B?V0ViQ3NpY1JZVWl3ZVJpeXh6UEswQTVZZW0vTUVVMmN6ek10QWhxNnV3djhk?=
 =?utf-8?B?M0V5ZEJxUDZTWmFXN2I1Y1J1dTFTMTROOHFHUW03VUJKSlJLM3Fqb1dyaDhI?=
 =?utf-8?B?cGtvMGN5YlV5b2NiMEVab0JQVFR6M1NYSUF3QzJjTHAySytDUVc0Q0IxNGR4?=
 =?utf-8?B?R0NoU3RINC83Vzh3bWpMaXhCelRLMzVWNDlTSjE0bjFJMkpZMzZUMWZENzV0?=
 =?utf-8?B?TXIxZjg2MlJ3MkxkdEdlQ3lBYVhyMWtQSk0xVDZQSy9yMjBCdC9hempOZFB2?=
 =?utf-8?B?UEt6eUREdGNURFJoc2NlbENVVkpiRnVKdTFKVnJCM09NUEpmOThQN0V4KzdP?=
 =?utf-8?B?TklXNVdOeTFqNWwxOHZZRTdVaEozYlFsb0tLK3BYY3pWVkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVhWOWFiSDRsUnM5VkNFVGYxQ3F5MGZnKy9HMzA1RmFUNUVtaVlLUVB0ZXo0?=
 =?utf-8?B?ZEJ3VWMvUEVUVDJtQm93Zk8vV2dNdUJDd1BGWE5BTkpCSDdFZ1dMdjZwVE5l?=
 =?utf-8?B?YnBxNmlaa2lLN1hLT01BeFQvdHFGWE5WazJpUm5xa01YdEJjZXdlWUVPcGpS?=
 =?utf-8?B?L0w3eW1mSjd6bzlOSUdLTTR5MXZBZlB3M2c0MDJMbHE3REZZaHg0R3BENy9a?=
 =?utf-8?B?SHdwTFZISEhIODh2MDJtSmNRSjJGdG1lVmlPbTBvcHF4czAyMG1ERFJiOEJ5?=
 =?utf-8?B?d2lHQjgwSVFHNisycDhCUzdTWUVBV1lsODAwbHcveG93QzEyS3hoU0VrKzVP?=
 =?utf-8?B?WXlYSkx3bTdFbGpGcGhPRHNnT3dGUDdzUEVUcERLd1RjOWNnanl4VGttZ3JM?=
 =?utf-8?B?L2grUmdhQStCZ3BhTzJxbkZ3MGZmcWlFNFdYQTIrRDg3VWxMbit1V3hzTFdy?=
 =?utf-8?B?dE1aUUVZNlFINTZLVktxUG8xdHUrSlVwZUZ2QlAyZXB4VzcwQTBwSStKbkVh?=
 =?utf-8?B?YzJCRDBOcTAxaW9qck5oVFI3VW14MVZSTzZySGtFTmZaQWR6T2d4UnNYMDFu?=
 =?utf-8?B?VzZZY2pmY05aQTRNT05MWlRMdmt3bFZtNDRsYVRDS0dzN3Nad3dCQ1ZPSXJW?=
 =?utf-8?B?ajdVWCtVWGt6NHFlTkxiVVdjZy8yTlk1V3JkbVpINmVsd0kvd2tQcDBVTUEz?=
 =?utf-8?B?c2ozTkFvUjFSY0xuS1gzamRYN1o1WVE2UmM1TlVlZkhUUGwzdWc1ZzAzM2ZD?=
 =?utf-8?B?Q0ptRWhvWlFNSHN1NTk1dnpQQmdXZ2JINnVmbEVWTUhKbjdBV25Ub1ViMWIy?=
 =?utf-8?B?ZlBaUFJJUGNaV0dxTEtpVEZlK1YvTWFDMVlrUVQxZFVybnFhM25qeU5kQ0Nh?=
 =?utf-8?B?ZktUMXVXei9iT2k1OWZ1MmN6NStXemlISVNxTkxoUE54ZFNvRk52eVoyOWNl?=
 =?utf-8?B?dzN2RnhScUNseVdDMUVIb0E5MGVXWHA0TlR2cnRGOXg5Ym5PQTV4d2RKNXRo?=
 =?utf-8?B?RXdIS2g2VW1uaFMzRzhNZ3lzT2t3d0VVbWx1d0R2RERkNzNhdlhBTCsxYys4?=
 =?utf-8?B?ZmFyK1AzNXNzYm42TC80RzI0cUdOYzhmUlB6MXNoSjIxNTQwSDJTY3ZWK3VL?=
 =?utf-8?B?SG5YMEVPTHp2Ym1MVXZFL2RnWUNvcnlQT0lqSTdJaVIvZmlVVEdOeWE4dEJS?=
 =?utf-8?B?NHNyeGFwblhTbFpnZ29PTXlBZXRCN3RHUHpJOUVXWGtMMG1Rejgrd284V1Vz?=
 =?utf-8?B?czc5OHIwZllqNGNJR0VDUjk5VkUxRmNYMkFCTVd3VGx3SFAvSG1zNk1aZ3RR?=
 =?utf-8?B?NmZRY1c5U01nUWM3Qm1GU3hobXdvVEtqV2VicXAvbytqcHZ3MzF6Q2crOGEx?=
 =?utf-8?B?Nnc5MVM2cmZNT096cE5CQTFaV2wwRDA3T3RFNmpZdWk0ejBLOTA5ZUlFb0tv?=
 =?utf-8?B?dlJQVTROZlNMNU1hZWFUdFFrT0YreUNoZmtjWEZvVXdYUm9rNEI4Uk1sa3lr?=
 =?utf-8?B?ZGZ5M1lsL0VNSVJOajl6M0x4MHRkeGdyZkFBaFJVRXhHSTBiYUVHbmRONmla?=
 =?utf-8?B?dUJYU29iSzFmd20wTWtkbHhjTmNWcy9KaEJMOTF4bHFLRXFVK3FaekRnV2Jh?=
 =?utf-8?B?SHJqRkJRVy9tY2c4azdmcld5QjJCdDNXejJ4cUU2a1BhZTZhT1hRekYvWFpE?=
 =?utf-8?B?elFCOGxJZDk1Q1pha1loTkh5TXBrUTB0L21zU1oxQUQraXJEU3N1dXpLZFhC?=
 =?utf-8?B?bXZKTDNlemRibFBZY3NmTnQyUzNIY0tiOTRnS0FwNTM2MGZuR3BnZnYyV3hF?=
 =?utf-8?B?NFRQNDlsbkVxdFF3alR5Ykc0SXFRV050MG9lVEN5dDZEOVFqbnFDYXhQQnVw?=
 =?utf-8?B?c3JySUdETUJ0eC9LZDhLZnpWZFMzV3lpZHp0UzhqOWxUaWdXUjB4UU5wcmVz?=
 =?utf-8?B?VVBRKy9mWVZvZXlIcDlFN1YzbTVSWUFjakRVTVZPd05NYldPM3V2QnBDL0Qz?=
 =?utf-8?B?ZS9RMk1IVHlRd1Nwbmw5bExDUWF3RFBub0NIdGZxMzFMb1BzSUN6dzRON2RX?=
 =?utf-8?B?VTN6MkdvV00wRWFTSDh0VThqM2xQZTNrOTJJbzJOSzFzSjdEVnpBMGVJdzJa?=
 =?utf-8?B?RzdXKzhIS2RXcTFoRU9nWUJFOFBwY0tTWDZ2eFJCUU0vSnNFaFpMS0w4OXRr?=
 =?utf-8?Q?s5HccJct4kd45hdaix4MF8w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <463B6CE7CA688A49A6C052B48F875647@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf84d62-ad29-46df-44be-08dd4b7b3ed4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 15:38:06.3319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lIJmMNJ/22y2NNoKtt657UrA17UQ2Q8rg17MjhgtBXNoU9jLiUlC9NY5cG2322qlpTn8P04KLftXWNOLNv874DKk5WL9XIWlc8TDm5XDEs4VCY+c/eWTdWUi28HoV+qO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8803
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

T24gV2VkLCAyMDI1LTAyLTEyIGF0IDE3OjQ4ICswNTMwLCBUZWphcyBVcGFkaHlheSB3cm90ZToN
Cj4gQWxsb3cgdXNlciB0byBwcm92aWRlIGEgbG93IGxhdGVuY3kgaGludC4gV2hlbiBzZXQsIEtN
RCBzZW5kcyBhIGhpbnQNCj4gdG8gR3VDIHdoaWNoIHJlc3VsdHMgaW4gc3BlY2lhbCBoYW5kbGlu
ZyBmb3IgdGhhdCBwcm9jZXNzLiBTTFBDIHdpbGwNCj4gcmFtcCB0aGUgR1QgZnJlcXVlbmN5IGFn
Z3Jlc3NpdmVseSBldmVyeSB0aW1lIGl0IHN3aXRjaGVzIHRvIHRoaXMNCj4gcHJvY2Vzcy4NCj4g
DQo+IFdlIG5lZWQgdG8gZW5hYmxlIHRoZSB1c2Ugb2YgU0xQQyBDb21wdXRlIHN0cmF0ZWd5IGR1
cmluZyBpbml0LCBidXQNCj4gaXQgd2lsbCBhcHBseSBvbmx5IHRvIHByb2Nlc3NlcyB0aGF0IHNl
dCB0aGlzIGJpdCBkdXJpbmcgcHJvY2Vzcw0KPiBjcmVhdGlvbi4NCj4gDQo+IEltcHJvdmVtZW50
IHdpdGggdGhpcyBhcHByb2FjaCBhcyBiZWxvdzoNCj4gDQo+IEJlZm9yZSwNCj4gDQo+IDp+JCBO
RU9SZWFkRGVidWdLZXlzPTEgRW5hYmxlRGlyZWN0U3VibWlzc2lvbj0wIGNscGVhayAtLWtlcm5l
bC1sYXRlbmN5DQo+IFBsYXRmb3JtOiBJbnRlbChSKSBPcGVuQ0wgR3JhcGhpY3MNCj4gwqAgRGV2
aWNlOiBJbnRlbChSKSBHcmFwaGljcyBbMHhlMjBiXQ0KPiDCoMKgwqAgRHJpdmVyIHZlcnNpb27C
oCA6IDI0LjUyLjAgKExpbnV4IHg2NCkNCj4gwqDCoMKgIENvbXB1dGUgdW5pdHPCoMKgIDogMTYw
DQo+IMKgwqDCoCBDbG9jayBmcmVxdWVuY3kgOiAyODUwIE1Ieg0KPiDCoMKgwqAgS2VybmVsIGxh
dW5jaCBsYXRlbmN5IDogMjgzLjE2IHVzDQo+IA0KPiBBZnRlciwNCj4gDQo+IDp+JCBORU9SZWFk
RGVidWdLZXlzPTEgRW5hYmxlRGlyZWN0U3VibWlzc2lvbj0wIGNscGVhayAtLWtlcm5lbC1sYXRl
bmN5DQo+IFBsYXRmb3JtOiBJbnRlbChSKSBPcGVuQ0wgR3JhcGhpY3MNCj4gwqAgRGV2aWNlOiBJ
bnRlbChSKSBHcmFwaGljcyBbMHhlMjBiXQ0KPiDCoMKgwqAgRHJpdmVyIHZlcnNpb27CoCA6IDI0
LjUyLjAgKExpbnV4IHg2NCkNCj4gwqDCoMKgIENvbXB1dGUgdW5pdHPCoMKgIDogMTYwDQo+IMKg
wqDCoCBDbG9jayBmcmVxdWVuY3kgOiAyODUwIE1Ieg0KPiANCj4gwqDCoMKgIEtlcm5lbCBsYXVu
Y2ggbGF0ZW5jeSA6IDYzLjM4IHVzDQo+IA0KPiBVTUQgQ29tcHV0ZSBQUiA6IGh0dHBzOi8vZ2l0
aHViLmNvbS9pbnRlbC9jb21wdXRlLXJ1bnRpbWUvcHVsbC83OTQNCj4gVU1EIE1lc2EgUFIgOsKg
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9tZXJnZV9yZXF1ZXN0
cy8zMzIxNA0KPiANCm1pZ2h0IGJlIGEgc2lsbHkgcXVlc3Rpb246IGxvb2tpbmcgYXQgdGhlIFVN
RCBwYXRjaGVzLCBhbSBpIHJlYWRpbmcgaXQgd3JvbmcgYnV0IGl0IGxvb2tzIGxpa2UgdGhlIFVN
RHMgYXJlIGp1c3QgZ29pbmcNCnRvIGFsd2F5cyBlbmFibGUgbG93IGxhdGVuY3kgaGludCAoYXMg
bG9uZyBhcyBody9rZXJuZWwgc3VwcG9ydHMgaXQpPyBJIG1lYW4gaWYgdGhhdCBpcyB0aGUgc3lz
dGVtIGxldmVsIGRpcmVjdGlvbiwgdGhlbg0Kd2h5IHJlcXVpcmUgYSBtZXRob2QgZm9yIHVzZXIt
c3BhY2UgdG8gcmVxdWVzdCwganVzdCBhbHdheXMgZW5hYmxlIGluIGtlcm5lbD8gb3IgaXMgVU1E
IHN1cHBvc2VkIHRvIGV4cG9zZSBhbiBleHRlbnRpb24NCm9yIHNvbWV0aGluZyBmb3IgdGhlIHN5
c3RlbSBpbnRlZ3JhdG9yIHN1cHBvc2VkIHRvIHNlbGVjdGl2ZWx5IG1vZGlmeSBhcHAgY29kZT8N
Cg0KLi4uYWxhbg0K
