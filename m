Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8409D96FA2C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 19:52:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053E910EAB5;
	Fri,  6 Sep 2024 17:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wa6EI8+R";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E795510EAB5;
 Fri,  6 Sep 2024 17:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725645170; x=1757181170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sbv998mNHtgwL38BH7i304JdPaefW7VlO/eyK6X1Ze0=;
 b=Wa6EI8+RC6sAueXQ3QwZcOujRa1AzJwLpF4iU1Ndm/P8Rg2QdQvjkKKl
 Ld3nbKNEHd683VLQ9gMRdTm1j51iNTaC3RH1OunSGDVt0t0RfmQUejEHp
 3O80VsxN3Nx23ADfKm8FeCz89IlZJqUMKqSbqK4Qon4Fv4adJmNXQhET2
 ol7JRsHCzpcdGhrUoXJLTg0k+qESFbhU2G4QBKuiSqNxCkoMDeIASFjg8
 0g8hbngA+aZhaZsIJx+aKW1Z8lV2TWoro7LWherBt9skjEIS+QZAL1+uk
 Jp0V1uGnLW0VCZVmKj81a1inSO8rolcCKLADz1lgZrHtbolwHwP91REaz Q==;
X-CSE-ConnectionGUID: +GFiICwlR4uAT8BvewhB6Q==
X-CSE-MsgGUID: 65+uGEYIQ8emwJzUAN+6CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="28200085"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="28200085"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 10:52:50 -0700
X-CSE-ConnectionGUID: 2MxH14loQV6nBSqwY/WXaw==
X-CSE-MsgGUID: 5T7QubeGRty8awYD+fyfWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; d="scan'208";a="66360263"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 10:52:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 10:52:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 10:52:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 10:52:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 10:52:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4qV+Fyw2pXpMWDLLMuLR85ntAF78wSc9BQEISWvi8kwn5rrosrB1jbQtR1kxQ0XDBik5CjkcY8w8WCESbynAf1Z7GWCCKKB7RHEqsUdpvrkt+2gP2cpQJji03Zuf4wa8bBK+dls3Hoqxbe5i5gG25TNbfWvqv012BWj35hMvU0MbSUGIGL0VSsz3gRjJQttO34cwT7dIRr9hfpVQ9GvdxdwI1n9LFVmLk45e4W6RlLgppRSG9lbmHMj7wLHYoJnQWmztRHrEfn7EWzH8d/6NtT4Dg6SA7/ZOXz0QssmPl9ddbUPurozoRdLGNOlcLZITHoAKVl+DveL+u0476Phzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbv998mNHtgwL38BH7i304JdPaefW7VlO/eyK6X1Ze0=;
 b=B1yErNJ3X6WooQbd5dbOGInlvPsKqIaZsUtTFDtZlE1+S5m9EA7rxpWrchMYE73Ivoez7TkJdB4L39vFKGbY+g9q0DSE0pB63LPT9S5SwzjEj0S0t46ScRbbu9YK+SAiGVAd02Oh0LP9PI1QPH5MkZTISqjwAplK9ZfMDLTSnSivmG+L3XDvxBHM36som+/TLoJOj/0tXqNvSJGFQo1nI+YCodZSXMNtHjDyUlrHBPVvLBJz8kTVlQ6hq2CXtPjZK9o3M3wERf0VQaQHllwJCmG7lE1faPenWQiPxt9716UDgXq2qy3fNzRvhgVaCAz/1dBsHciAIxZaRzHi/bvtJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 DS7PR11MB6014.namprd11.prod.outlook.com (2603:10b6:8:73::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.25; Fri, 6 Sep 2024 17:52:46 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 17:52:46 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-GFX@Lists.FreeDesktop.Org" <Intel-GFX@Lists.FreeDesktop.Org>
CC: "DRI-Devel@Lists.FreeDesktop.Org" <DRI-Devel@Lists.FreeDesktop.Org>,
 "juston.li@intel.com" <juston.li@intel.com>
Subject: Re: [PATCH v2] drm/i915/guc: Enable PXP GuC autoteardown flow
Thread-Topic: [PATCH v2] drm/i915/guc: Enable PXP GuC autoteardown flow
Thread-Index: AQHbAIPuLXyhoyVNV0qyPbhDNnicQrJLCh4A
Date: Fri, 6 Sep 2024 17:52:46 +0000
Message-ID: <7ded0302b073a7335a0065508fb5a4ff12f5a0c1.camel@intel.com>
References: <20240906174038.1468026-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240906174038.1468026-1-John.C.Harrison@Intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|DS7PR11MB6014:EE_
x-ms-office365-filtering-correlation-id: 4e3ee1e8-4859-4c89-fd02-08dcce9cb70e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?blQ3TmN5Mk9yQSt3d2xLRVRGVTUyWEVOaFRIcGUwNnlIeFMwVlorTXcwejNE?=
 =?utf-8?B?dGpHZENXaVlIL3dGMUxqRWR1VGdKZlZjZXNtanpJaTViZWtmanFjbXB2UmxG?=
 =?utf-8?B?TnFmV1lXY3NSWGRHOVlPaG82Ry8rakxYazJKUnpkZnVQSHVsM1ZhMTh2SEpj?=
 =?utf-8?B?L1pHcEQrRHFaVVg2NnFSTG9IckZ6Mm1DWk5TbSt6ekF5YjF6U1FROHU0N2dY?=
 =?utf-8?B?UUJMZGpXMGg5a081OUxQTVplK1J3a3pyV25OeDV3bGd4Nzh5eWtOMzk1eVU0?=
 =?utf-8?B?RytaNlNUYUMwZjgxSGJ2cVdDK0QxY2pjck5sM2VtTmp3NEtOY1FGOXQrcTM3?=
 =?utf-8?B?VU15NkUyYVBxeVRWOUlkdlQvd3ZrbUZYYkNxQnNWRmpUNW43ZFREZFJZcCs2?=
 =?utf-8?B?c21jUjYyajNwWS9ISTU1eEUxVjNJY2VidHY5eGM1NEhnNzBXQmM4blkxb21F?=
 =?utf-8?B?endOLzNRaW9QWU1raUpHbWZRUCtLMkhIT1VUbENQQjJNWERpQllRZkQzdy9n?=
 =?utf-8?B?VHVsRlcrSi9RdXZJN2J4ei9Eb0o2K3BaVzhucVVGVzN6YXF1RFVhL0M4VjlP?=
 =?utf-8?B?cGZBRFQ1TjMxcEtDYzRMSGQzcDN4bHlsQW9haE9tOFhJZTFpa1FJU2ZuSGRi?=
 =?utf-8?B?a2E2a0NDUGEzSVZsSzR2WVBBTjRnYmNvb1NLTEY4eXBkeVZxTUxwR3NxenQ3?=
 =?utf-8?B?enlLRkxxdDhSWXRiaDhwNnpsTFVxZzBSMW11bDJiaGtvdUJwWTFnY2ErckRS?=
 =?utf-8?B?eUJWRkxBV0svdmZ3WHhBVGNUc3ErQTc3OEEzbDVvYStwbmd2MFRBVXl1Z0JO?=
 =?utf-8?B?QnQydFE1K0I0QUU2RHcveVAvdFp0WGdkbTVKandFdWNidEFSa2JaejBxVnVi?=
 =?utf-8?B?Qm9qL0lVM1ZIUGJWRTZROWRrYjhhZ25pY1VBc21ZaitNdCtZajVpamgzaWNQ?=
 =?utf-8?B?YkFlcTlGN1NnYThXQUlnUjh6dHlGU3lDRUZnOGQ3VTh6elpkTnQ4Qjhwejcv?=
 =?utf-8?B?T1BEQTZEaVVSeC9sL080Q050OE5mTlNXNzhXWWxodGdidGUvd0JybFJ4U1Fo?=
 =?utf-8?B?WUVUWkdnNXQ2d05Yb0dWcnFVYnpWcENYUmV4R1dxYWJSdWdZbUhZdFkrRWFJ?=
 =?utf-8?B?bEs2TnVONU9qd01PY3BIbTQ3cHlFQ0h1N3Vaa2hPVnNVRFJBWTNvZjM3cGIz?=
 =?utf-8?B?aUJ6TzNNdVYzYmI4Wm5IbTY1WXZLVHAyQmplbG9PU1RzZml4V3A2bEtOdDVD?=
 =?utf-8?B?Nkh6NjlvWVY1akNEUWxaQk41N3VIUnJRZE5rd3ZIVGltMHloWUcwSXBKaHNM?=
 =?utf-8?B?MVNnNFFvR3hRZit3OVVoQjIzMUdvK3VadmtEYmh2NHFuYUl1enRhTkY2bFBL?=
 =?utf-8?B?anN1QjA4V2VtOFpCRVJFMURhbGpnajdQNmRHdjFBNk51L1BYKzdKOFd0SEVS?=
 =?utf-8?B?ODk1RVRIOHd5Z3BSS3lzS21EcnhkOWh1dldVL0t3Ty9aK1NkZmdOSGxFQUhn?=
 =?utf-8?B?M2pXMXBhR1lZMktxVFhmdlpoUUZzcXgybGNKazBxbm9HS3c2R0VNU3h5ZUxC?=
 =?utf-8?B?SlVCZWNvSFZ3YUFic2ZEUVBvRGFpQTc0a3NyTmhXNjdZMUhjMkdvbWZQZW9k?=
 =?utf-8?B?bDVNdldHRy9BTkZBM29FMGE1RStDelFYd05qeDlUNTFFbjR6SWxtTVVKcGo3?=
 =?utf-8?B?U1ZMamJZNzEyTGJkelBpYnFtWDhZU3pTT2hWL2xXNFhGK0MvcVFrbG5iYlRx?=
 =?utf-8?B?N0RDMmNrbDk1R1A2LzlBY3BudmRxb1dxYS9HR0FTekViVXk4cW5kMVJTeGJm?=
 =?utf-8?B?Vm5PUHBuZHYrZmF1UWhPRDF1bitHNWtRMjZYYitPMG9mdnlOcHlydjVVbllZ?=
 =?utf-8?B?ems0SVYwU3Q1QmNLTW5RdVBrYnNjM3VWQk9QS0lXUU9EdVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3JraFh6SmpSRWhldTJCR1dqWG03MVgzellRSEFvUmw1b2FYbVh0b3oyMWRL?=
 =?utf-8?B?anRZWGVmT3JIbUNCNld3cWl4KzJxSFFFNTBXVUlsRTVWeVV0aTEwNHhKcnUw?=
 =?utf-8?B?Vys3VS9PUlFTanpFRlE0cFZPeGRrUG5ESmt3T3dGdW1xQWthR1IwN3Z4UGpY?=
 =?utf-8?B?N3lGNXEvbE5kYitTM0ZuLzlaUERFVHovc0IxVFFiOTYrb3pFcStBUXFQeUZr?=
 =?utf-8?B?ZnBDOHQ5RDBPYjlDU0FyQTBwbGs3clVpSzVETUVjN0dLMGI3bjRNLzZJSEVC?=
 =?utf-8?B?QkI1MU5Md0FYRGlSZkJwbHVNb2NPeU4vWm15RnE2Vy9UWE5BSmJFUTd1TFFU?=
 =?utf-8?B?bHhBeTRFUUtqMFJkL0RGdFFGNUlCdDVRUklVYjdZNHlwVi92RHNISHlMS1B4?=
 =?utf-8?B?eWlPVVhaTUQxL2dQN29pa1g1aDRrMjM5eVF1QTBJY3RQb0pFS0t5TjFCTW9M?=
 =?utf-8?B?QW4xSGw5MFF3L1VaQ2Q1T1p6MnlJWC94dXNvM0ZOV2R1Q0F3Q1M0QXRnb1Vi?=
 =?utf-8?B?VU0vek5Rd2Q3TUxoVzZQN1U1YXJGdWRtOUpmSUhlSGxRNWdXc1RLRzlKUWVV?=
 =?utf-8?B?MW5yaGRNZEhsaWVWcDFVRXlBdVpEc3gybzUxRFNCNlgyNlhmeGZseDZHV08x?=
 =?utf-8?B?VnNsVENSLzJPeElMaUpCYVBaQXB3aUpVTHpNZW1jTy91Skg1dWc0bDBLOWRT?=
 =?utf-8?B?OU1DbkE5OXRGSUtWdTEzZzNSc0JtMHpoVlJHL04wc2VWRkJMNkZSOCt1aXpM?=
 =?utf-8?B?VEdNdkI0Z1NXQnBGSFBRN2hXV0szTEIwamZsSU53TWN1OWJodnRDRG45R1dM?=
 =?utf-8?B?NDR6dG5qRmpkdDFmNTl0SXdFdnJ6Z3FSaktDNWNtWDRmd2ZSOCtEaUkzeWxv?=
 =?utf-8?B?RXlXUUtCYkJQUWljVCtVb1p1RlVSZ3gyZzltWHl5dG1ZUDE5TEkxVDlsMFJ3?=
 =?utf-8?B?c3l5eXBaTmxGaUhrc2NTeWxEYWhEM2hhRnJraUJaSWFINXNzTDJOZVBSK1pX?=
 =?utf-8?B?V3BzQTdybVg4bHBpczVpRnVHNktJSEkwSWhRQ3J2YTFLMVJyK2pyWjFSM2da?=
 =?utf-8?B?WVhCVHZ4Q1NvS1VWWHV4c1JZcFU5VzkySVpwNDR0MWorRVVoMkF0TWd2YmlQ?=
 =?utf-8?B?d3hGblJlT2sxdEFDaVZjSmRvd3dpUS9pS3Z4VzQ5cHJldU8rbUoyMFBPTzR0?=
 =?utf-8?B?UFI1NVkyUE9lT2dSMWx6d3NBSGNhK2kwOHpXWjFnL25NWG5sdEd6d2MwWTg4?=
 =?utf-8?B?RmxobitROFNGTGZiS2lyMmxlaWNYb2E5YnVCWENIMHhrOXR0K01BYXI1TG5Q?=
 =?utf-8?B?c0hQQTNVSC9KTEFYcWlXQ3pQWm81N0UrMEVwNFp5WE8xWTlmSW5vRlJ2WHRv?=
 =?utf-8?B?d0YwV2tkeFdRR0tkM0hMOEl2NUUvMTVLTTU1S0NXRjdIeGEzRGJxWkNaOGww?=
 =?utf-8?B?cjM5QWpVOHdPR2UyTkdqU09DTXJ5aVdyQXRIQXdZQisxc3Z1Y2RmaDZMRWtC?=
 =?utf-8?B?ejl2MDdodjZvbDRoRjcybVZmbldnakthd3MyWEpOUkx2SmlsUGVHUHJKZWx4?=
 =?utf-8?B?bTJlSHU1aHErdzd0NEQrM0FyWHpZL0tHSEN6S3hiNnIzbUxzSExvak5TMFJX?=
 =?utf-8?B?NnZwVEVxQytvcTZoa2w4MmUvQVVlZThQYTlSOVRCOVpOdlZ0VDB6OEpqL0NG?=
 =?utf-8?B?ZGF1T0xPY1JzMXVRdk9xWHM4U0xGZzFqWklQeWtJdDJpK2Nhb2lFMThtVCtk?=
 =?utf-8?B?eUhKVnhieW9xcHA4d2xUei85RmFzYjF3dEZHTjIyeEJNY0t0cFJYcEMzeTV6?=
 =?utf-8?B?bUdZRFVCQ2Q2ZytSejhMb3dHUllrVFIzZDlWRjVvUGhDTCtQbmQ4Wmo2Y21l?=
 =?utf-8?B?U0hXelFwYjkxTmk0enBucmVqdlQ3WlM0a043N0xPQ0RVSjFNQVhhTkx6N0lG?=
 =?utf-8?B?dmZ5V0h0TzQ4M0dqcW4yY0VtazhhbVNCUjN3NXJJdnlXZ1F6SVpaMmQvTHRs?=
 =?utf-8?B?Mm1YbmZITi80cVJFZmcrYXozTHB6b3FWZ3JvWXZWU1JQOC9yVGJ3eTQrTnFh?=
 =?utf-8?B?d1BLNkVNVXFwSDlwdXc2OHJTQTlPR3p1bm5tRkpyLzJqTW8vRFIzQytrSW10?=
 =?utf-8?B?dHBya1RWQmhYc2ErYXlBNzkyNGlucklOc1JuUXFvMmxpd1ZsOC95eTl3Kys0?=
 =?utf-8?Q?ubIIhAQHFvZ5TLkP9LQeaJ0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B6325FE3654C6547917A1C624A5111DE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e3ee1e8-4859-4c89-fd02-08dcce9cb70e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 17:52:46.0667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /BuNUMdd2CdZ9dMBD0UgfDBgDRjeK9BmaW6KooNkIEgeMpA30IU1RW9wxuqJ3+4Z2JP1TPa1MCwc1iUgOQlJhKvTD1pn25yiro0B76ICUyJC9PX84jI7vW6Z7Z+7IvKb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6014
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

TEdUTToNCg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4
aXNAaW50ZWwuY29tPg0KDQpPbiBGcmksIDIwMjQtMDktMDYgYXQgMTA6NDAgLTA3MDAsIEpvaG4u
Qy5IYXJyaXNvbkBJbnRlbC5jb20gd3JvdGU6DQo+IEZyb206IEp1c3RvbiBMaSA8anVzdG9uLmxp
QGludGVsLmNvbT4NCj4gDQo+IFRoaXMgZmVhdHVyZSBmbGFnIGVuYWJsZXMgR3VDIGF1dG90ZWFy
ZG93biB3aGljaCBhbGxvd3MgZm9yIGEgZ3JhY2UNCj4gcGVyaW9kIGJlZm9yZSBzZXNzaW9uIHRl
YXJkb3duLg0KPiANCj4gQWxzbyBhZGQgYSBIQVNfUFhQKCkgaGVscGVyIHRvIHNoYXJlIHdpdGgg
dGhlIG90aGVyIHBsYWNlIHRoYXQgd2FudHMNCj4gdG8gY2hlY2suDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBKdXN0b24gTGkgPGp1c3Rvbi5saUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEpv
aG4gSGFycmlzb24gPEpvaG4uQy5IYXJyaXNvbkBJbnRlbC5jb20+DQo+IC0tLQ0KPiDCoGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Yy5jwqDCoMKgwqDCoCB8IDggKysrKysrKysN
Cj4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfZndpZi5oIHwgMSArDQo+
IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDMgKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4cC5jwqDCoMKg
wqDCoMKgwqAgfCAyICstDQo+IMKgNCBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
dWMvaW50ZWxfZ3VjLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWMuYw0K
PiBpbmRleCAwOTdmYzZiZDEyODVlLi41OTQ5ZmYwYjAxNjFmIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC91Yy9pbnRlbF9ndWMuYw0KPiBAQCAtMjM5LDggKzIzOSwxNiBAQCBzdGF0aWMg
dTMyIGd1Y19jdGxfZGVidWdfZmxhZ3Moc3RydWN0IGludGVsX2d1YyAqZ3VjKQ0KPiDCoA0KPiDC
oHN0YXRpYyB1MzIgZ3VjX2N0bF9mZWF0dXJlX2ZsYWdzKHN0cnVjdCBpbnRlbF9ndWMgKmd1YykN
Cj4gwqB7DQo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBpbnRlbF9ndCAqZ3QgPSBndWNfdG9fZ3Qo
Z3VjKTsNCj4gwqDCoMKgwqDCoMKgwqDCoHUzMiBmbGFncyA9IDA7DQo+IMKgDQo+ICvCoMKgwqDC
oMKgwqDCoC8qDQo+ICvCoMKgwqDCoMKgwqDCoCAqIEVuYWJsZSBQWFAgR3VDIGF1dG90ZWFyZG93
biBmbG93Lg0KPiArwqDCoMKgwqDCoMKgwqAgKiBOQjogTVRMIGRvZXMgdGhpbmdzIGRpZmZlcmVu
dGx5Lg0KPiArwqDCoMKgwqDCoMKgwqAgKi8NCj4gK8KgwqDCoMKgwqDCoMKgaWYgKEhBU19QWFAo
Z3QtPmk5MTUpICYmICFJU19NRVRFT1JMQUtFKGd0LT5pOTE1KSkNCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGZsYWdzIHw9IEdVQ19DVExfRU5BQkxFX0dVQ19QWFBfQ1RMOw0KPiAr
DQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIWludGVsX2d1Y19zdWJtaXNzaW9uX2lzX3VzZWQoZ3Vj
KSkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmbGFncyB8PSBHVUNfQ1RMX0RJ
U0FCTEVfU0NIRURVTEVSOw0KPiDCoA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3QvdWMvaW50ZWxfZ3VjX2Z3aWYuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2lu
dGVsX2d1Y19md2lmLmgNCj4gaW5kZXggMjYzYzljM2Y2YTAzNC4uNGNlNmUyMzMyYTYzZiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2Z3aWYuaA0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfZndpZi5oDQo+IEBA
IC0xMDUsNiArMTA1LDcgQEANCj4gwqAjZGVmaW5lwqDCoCBHVUNfV0FfRU5BQkxFX1RTQ19DSEVD
S19PTl9SQzbCoMKgwqDCoMKgwqDCoEJJVCgyMikNCj4gwqANCj4gwqAjZGVmaW5lIEdVQ19DVExf
RkVBVFVSRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDIN
Cj4gKyNkZWZpbmXCoMKgIEdVQ19DVExfRU5BQkxFX0dVQ19QWFBfQ1RMwqDCoMKgQklUKDEpDQo+
IMKgI2RlZmluZcKgwqAgR1VDX0NUTF9FTkFCTEVfU0xQQ8KgwqDCoMKgwqDCoMKgwqDCoMKgQklU
KDIpDQo+IMKgI2RlZmluZcKgwqAgR1VDX0NUTF9ESVNBQkxFX1NDSEVEVUxFUsKgwqDCoMKgQklU
KDE0KQ0KPiDCoA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYu
aCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmgNCj4gaW5kZXggMzlmNjYxNGEwYTk5
YS4uZmFlYmE5NzMyNDIyZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9kcnYuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oDQo+IEBAIC02
OTMsNiArNjkzLDkgQEAgSVNfU1VCUExBVEZPUk0oY29uc3Qgc3RydWN0IGRybV9pOTE1X3ByaXZh
dGUgKmk5MTUsDQo+IMKgDQo+IMKgI2RlZmluZSBIQVNfUlBTKGk5MTUpwqDCoChJTlRFTF9JTkZP
KGk5MTUpLT5oYXNfcnBzKQ0KPiDCoA0KPiArI2RlZmluZSBIQVNfUFhQKGk5MTUpIFwNCj4gK8Kg
wqDCoMKgwqDCoMKgKElTX0VOQUJMRUQoQ09ORklHX0RSTV9JOTE1X1BYUCkgJiYgSU5URUxfSU5G
TyhpOTE1KS0+aGFzX3B4cCkNCj4gKw0KPiDCoCNkZWZpbmUgSEFTX0hFQ0lfUFhQKGk5MTUpIFwN
Cj4gwqDCoMKgwqDCoMKgwqDCoChJTlRFTF9JTkZPKGk5MTUpLT5oYXNfaGVjaV9weHApDQo+IMKg
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwLmMNCj4gaW5kZXggNzUyNzhlNzhjYTkw
ZS4uNWUwYmY3NzZhYWMwZiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhw
L2ludGVsX3B4cC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHAu
Yw0KPiBAQCAtMTcwLDcgKzE3MCw3IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfZ3QgKmZpbmRfZ3Rf
Zm9yX3JlcXVpcmVkX3RlZWxpbmsoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5DQo+IMKgDQo+
IMKgc3RhdGljIHN0cnVjdCBpbnRlbF9ndCAqZmluZF9ndF9mb3JfcmVxdWlyZWRfcHJvdGVjdGVk
X2NvbnRlbnQoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUpDQo+IMKgew0KPiAtwqDCoMKg
wqDCoMKgwqBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0RSTV9JOTE1X1BYUCkgfHwgIUlOVEVMX0lO
Rk8oaTkxNSktPmhhc19weHApDQo+ICvCoMKgwqDCoMKgwqDCoGlmICghSEFTX1BYUChpOTE1KSkN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gTlVMTDsNCj4gwqANCj4g
wqDCoMKgwqDCoMKgwqDCoC8qDQoNCg==
