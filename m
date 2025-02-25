Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B194A44384
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 15:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AD510E6FD;
	Tue, 25 Feb 2025 14:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q28q47qM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2D210E6EB;
 Tue, 25 Feb 2025 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740495135; x=1772031135;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ueChEMbTrORu0E1KxGD03q7tdzuHJzu3/2ElMNDuGOc=;
 b=Q28q47qM8E6PjoiZP3elhEPA15PAyz5NU0BgRHzFUFBXzD5deSf/PSM6
 2GdiDpYrdXdV78vua1d1b72BzoIjmwC7ly2t/yByBmCvLVZuUNSixlxzt
 Y3FoSP6bRD1OihDu7Vnz/R1Rc2rMylrsPKaOfGsWZoVGkm6XaHUtISy6h
 6EMkhzDyYxwhl81qzpnN+WXpilRcWNsagtkvWZB1JMnbJ5e4FECy527qE
 07+gLmVQ1gnAT6/XtKn+EGQFB8BW7BnQETANF3jEUsYB1rjNbRvD5GCXz
 9CdHrcBAVAB/4EZTv4tjjNVIL8yfbpLRq3GWn2G+tzsyY5uGI6WW1gpqT g==;
X-CSE-ConnectionGUID: x+BVMDNDS8y9ppkM00wweQ==
X-CSE-MsgGUID: ZD0aBIa4Qxyz1qkoPzQDNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45211258"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="45211258"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:52:14 -0800
X-CSE-ConnectionGUID: 6/cd2IxfT0eQ1ss6N+0M6w==
X-CSE-MsgGUID: 8oShGrLATpi03VPL6Px6NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="117021149"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 06:52:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 06:52:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 06:52:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 06:52:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUZ0Z3E4L+b2uERXk9lEadH3RLtjTUim7kCE6Ky3ExJMAZzNhpphHRBVqiBEA8IF7taIuPp9rWLiXeos+3iLSHK6+mZWCOaccDfK5DVmO9A7N8tQLtZAZrpt4sxNlQMFxHeTHrtgXodJRcjXD1RCD5/oOtXITTAPUsdnTQ+9WpFinRTV9LhUj9JOG/oOgkkxO5ar4FJQR2n5a77Ks8MPRaukdG2sjL1GoIPFIATNpL2P+uKcPxXe+7HpPXd1zAHMOe+Ztp1/0p6bOUysFJCW9E4BAo4Akid+qU+zHbzKz8snAlPJ10MLdRFLgsrC3g67lURTUJ5UwCqGUK7CoTitzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ueChEMbTrORu0E1KxGD03q7tdzuHJzu3/2ElMNDuGOc=;
 b=sD1bh88rTjdk/ZrtS34rcQlM0jV3WOQp/mX/PLxD+5Ln4yZnjTLb2WgSU6OVQ319+ko5OPXBXiqsqkBIQ/oAwqNEWdp8d7vJCKwN6pZB0lyTuw5KDCIt+Sy7CMxhaUraF+zPzG9rQHOmwhxGE4nyxE9rfv8NkEhht6e2ZWnu034gWN//Uch45bn6RwpU+vBN/YOeBGXT3i+1eY5tJE/4KguCB+QhAKdnS5GFwoLSvuhCixMtFotKvjGv7qnAVG8mJZZPeO/sJvFFZdxiaM67K3sJbUwd6AiJeI7TX656G9YjtZGkw5Spi2PNg12vMGXbDjMTpxky9ciLBx7cFcR9Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CYXPR11MB8691.namprd11.prod.outlook.com (2603:10b6:930:d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 14:52:08 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 14:52:08 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: RE: [PATCH V9] drm/xe/uapi: Use hint for guc to set GT frequency
Thread-Topic: [PATCH V9] drm/xe/uapi: Use hint for guc to set GT frequency
Thread-Index: AQHbfUG+IH/7dwIcJUihK/kEt9BQL7NWqxeAgAA6S4CAAJ1LgIAAq1kAgAAAXsA=
Date: Tue, 25 Feb 2025 14:52:08 +0000
Message-ID: <SJ1PR11MB6204376B8BEE7BAE2C58C4F781C32@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250212113830.9027-1-tejas.upadhyay@intel.com>
 <zi3xuzjcih4ok6ce6znqzx4azkorwkvxyt6n45wzadzwaiialg@7fsjvbfkmdby>
 <xow55bqw5z2p33fq7z2pj75fhuogweynco2j76ku4skre6axoj@t7blqywfmsqb>
 <SJ1PR11MB62042F65378253D198C6642881C32@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <petwt7bcigkh2rtqwdq6urdtrv5tdeyccqgfmqekto3y62prkl@b4ojplpk6qmv>
In-Reply-To: <petwt7bcigkh2rtqwdq6urdtrv5tdeyccqgfmqekto3y62prkl@b4ojplpk6qmv>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: rodrigo.vivi@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CYXPR11MB8691:EE_
x-ms-office365-filtering-correlation-id: ac2a06c1-a7a5-4b75-b9bf-08dd55abfa7b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?ZHJkSDhmZkUveFpITE94VjFyRzNMRVFMamJjenZBVHFvRmpGNDlxelg1NEcx?=
 =?utf-8?B?a0c0VWNBaGRycWNGUi9zejhxVjN6UGNIK092eWhVb2ZzVldHQWlReGk5TFJs?=
 =?utf-8?B?ZXE3NVJRYXVaOUZ5cHpxSUpiNVVHV0VpWU1mMHFBdDJ0T0l5TXRlWGVTM2ZI?=
 =?utf-8?B?MTRkcXcxZEZFdGpNYXdxS3dJS2tsbytaOHd4VDBpMU9VMmYydmdvbDFqUmFt?=
 =?utf-8?B?bFoySlFUNTJJaStkK1JQcEtPU291NjBXMFUxNUQ5Vy9lOGxmcXJ6bEdydUhW?=
 =?utf-8?B?dEt4bWZLYTFscTNmVU5OQ1lQS2lQemRUVTBOZXhmOVBTVlBoSEZWa0p0dGFi?=
 =?utf-8?B?bzJLUWpJaDgxMElkMDVycWZYZGJITE9HS2dvMFZJRlRFU3pENmxRTFlxTGoz?=
 =?utf-8?B?SjJVYlFiUUx2YWszN2RXZS9jZzE5NGovRDFPbFpqcDI2YnppWlpxaHBLWHdI?=
 =?utf-8?B?cFhRcDN0UVpvZW14ME5UK05iVGlDY2JCYkNTbjBrR1VTUDhtUFB6R0xjVGM0?=
 =?utf-8?B?QjRqNDhoVll0cFBqSnRkbjJJSXg2aWxRaXp5bGR3MG83OG9KQWtpckx6aWwy?=
 =?utf-8?B?WDVLWXBPeklEOHV6YVBBWkZGTHVMTXN1eGFLZDNybFcvSkU4TUROREZPdS93?=
 =?utf-8?B?Y3N4M1Q2TG5xQmxYZmwrcm16b1pZV2lVOWxNRG5CT3BCZHJncEZ0VVo0SU5p?=
 =?utf-8?B?Q3l1N1owRUU0MGg2YXk4OGdjZDAySk9mQWVGbFc3NDZXckxCWHNXY3gyNlBq?=
 =?utf-8?B?d0ZRNDkreTFDMEhseE9SeFR0YUNaZUYzMUhxbXloby9jL2JySC8rZ1BGODh2?=
 =?utf-8?B?K1hSNm1tWURnMStFZzN4dlVJUXN3YitURGR2aGV0aFZuUU1jUUZLWlJmODhH?=
 =?utf-8?B?aFd1WE9GNXZCejRqRmJiRFJ5Qnp4L1V1aHpLWm9qb0FRY3VBdVBYb0YxYnNI?=
 =?utf-8?B?WTFrL0RHeEhpbStWZ2hKamRqd3NaVVduMlNWenQwSTZmRm51R2ZEdnhheXBn?=
 =?utf-8?B?RFlML0dudU9ybVBqWTZ4RnFpRDJhZUttZEYvU2hhWk9ETGNOMXdwTHk2RkR2?=
 =?utf-8?B?US9UazdERFJnR3EzRGN1OVZyRCttQzBZUGEvbWhpWTBhL05BVXdSMEZQaC9x?=
 =?utf-8?B?OEdzN0Y3aVRmT0dHZC9CeUJMKzVXRFJEdkZKVzJqRXdYcTFsSjM4dnZ0cWpu?=
 =?utf-8?B?YTMrcDRVK3hRWnBGcEhDZUxDaDBZV1NKdjJLcHYxWjFZVHBieTNOb2xPR05T?=
 =?utf-8?B?RExVSGIvWnZ1SWhrc3p5YWxzWi9CVDNDTTl2WGRPL25XSjBtWTN6bVpGc1Uz?=
 =?utf-8?B?SEZ1dGU4ZmgyVm4yS0VRUVZGREpZYTlvditlcFNUSEVNNnhkc2hOQmJkQWlo?=
 =?utf-8?B?YTlZK2pmanZ0QXFmK1gzNjc1VDNKN3YxekZPakp1RXh2LzRRVk1EWHNlSWVY?=
 =?utf-8?B?ZHJXbER2MzlMMVp5WTlaQmJBdkoybkJldlVOVlBuRG9TK0h4elpEY2JlQWVE?=
 =?utf-8?B?MDRoRUJvelN6VEh2cVBkZWtKY3FqV2daUFJ2MTNiTE9mZGdxQnY5S29ZbzB4?=
 =?utf-8?B?MXFpemlNV2tlYnl1Mmx0emRTOVRLRDd4eE5jaGF5ZWthSEdIT05UVTN1ZnJS?=
 =?utf-8?B?OXU5Yi9jZFE2OFVJazBSSmUxVmlWdEpsaFcvbFZRMWRDTXRnU3VUQWIrVnBZ?=
 =?utf-8?B?eWRMVW80V0tXT2xrNDVpME05RnAwdWlhUWVDTGJQb21JZEFSalRLamQzR1Bw?=
 =?utf-8?B?elBTYUw0dlRMbzE4WFZIUWxDdzJRMEsreTZyRG04Ky9FcXB6RDdURWZ4TTNV?=
 =?utf-8?B?ejJ4NmI5UXlPYmFGdSsrWUxHcjJaUWExZVk0ZFdRRjNXWGpiS2NCUFRMU0RS?=
 =?utf-8?B?eE9PUFAxd1NiMnc3RlVNbWJlQVFudCtvZ1Jyb0hVMk8vc2c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXJ4ZFkwNS9Sc0NYbWVvcHI4MjZyUHpIMDVWb1NjQ1JOVlFaVmY4bkdRN3pR?=
 =?utf-8?B?ZmdsOG5TbWgxY0tZN0Z6elgzNVVIMVE4eUNuanZIZVFnRTBjS1NWcTAxMzc4?=
 =?utf-8?B?Y0NuQm11V2M5WnFTM1JEcUNYejRKVnh0NVR3eWRaSElXYUs5akZlRkZ1RGI4?=
 =?utf-8?B?cmVmMUhrclI5VjFwTnNsbUVPbHpxdEc2eUFjam1oWXpCV0dtZE5RVlJyNU5G?=
 =?utf-8?B?UFdpWGFrZmd3alhXYVNmZjU4ZDhXK3lIUmZSekV1endrT0xHaW1SZVhrekZC?=
 =?utf-8?B?QzgzcDZrSFdDc1ArdHluSzRpc2wzcVhQcVdpRjNTQVI4TXNwdmpTYmh5WEJ3?=
 =?utf-8?B?QUNYaW5PNkQyTkhaYkNid2tqYzZIdm5rdTNVd2JadDdGTjB3Qzg3ZXIzNmZ4?=
 =?utf-8?B?V3N2VC85RlRXbjZZS1I5emVCMmcyMHVvQ1NUbUsxelc5NExEYlQvYlJHSHNJ?=
 =?utf-8?B?VURiRHdaR20vdlFJT09NRnVWZldIVzIrbEY1QVlyV01neGxQYm9CZGZYWEVx?=
 =?utf-8?B?YXdIVW13dms0TU9SZlEvdmNSYmw2L3N1ZEg4NkIyN0U1ZGtCU2RtTnc4YXFi?=
 =?utf-8?B?ZEFCdDVMcDc0U2dIcGtVQm9rRm5JMnNvQzlQWFF2Mzl4SnNJdTRCVml1WldI?=
 =?utf-8?B?ak9rcGQ1dEFrRS9Ca2p6SVk5RnkxTHFhSk5Eb080TG54T1JuNUM4Wkd0L3Z1?=
 =?utf-8?B?V1VGdzUwT2RuWmRyZWl0V1J3ME9Wbks0T2hZK2w5dDZMUXo5SWRTZWpMTEww?=
 =?utf-8?B?bXFRR3VUdFIxUCtEVytid1FGZm9wNGxZc1VJbFV3eVpXcmRjRmF5Vm5zNGVj?=
 =?utf-8?B?allzL3o2Yy8rR2tEZzJRRWs5bUprdWpaOFQ3K2VBZk1YbFhaZVFMdTEwMURl?=
 =?utf-8?B?YUpPTXpwT3RtTkNDdDJjeWNhM1UrdVlFdUlaVkMwaEJ6RGRnSzVlbmlkaWNV?=
 =?utf-8?B?QlRQb2dZWnJVVGIwN3B2ZlpUc0pNWDRHRkNQVmw3TW9SQzE4WVAvVmZDdWlo?=
 =?utf-8?B?WnpWSWlwUzlLNlJlakZGeHMxUHFDUUtjU3NubCtlYnhBazNJRk93UnpnM1h1?=
 =?utf-8?B?TzVqVEZzdUpGcStBM1JaQWQwWGNhb1k1aG9ocUNkNVNIczd3NTRpTDk0TUJp?=
 =?utf-8?B?M3VraE5TUU84TUZvNDF4U3kzOFhUdGp0Q2pXK1Q1UHlvYkNTQWJsRzQrNkMx?=
 =?utf-8?B?OWV4SWMxVXprR3FjZDRKSXNTYTdoZUEyaDlCdzdxYWVaKy9LQzNodFVRWTd2?=
 =?utf-8?B?N1E5L1AyNDNrQVdmNDhRR0tPTmJHUW9QV0xUOFZMT2s3anpwcG43aWNFc2pM?=
 =?utf-8?B?MGp6eWVKNUZoU0FnMGF5MUJTNHRxK3VYY3VkcTlySDBCTW9lZXRpTnViNWp0?=
 =?utf-8?B?REdXcU9VQy9PSXZlOFBJWlpOZ2pIem1iTVg2ZjdKc2M2Vkp1bHJNZHZSMUkx?=
 =?utf-8?B?RiswUitqUVVrS1hMUUxoNU50UjhrRGcvQkdrVlM3NlZKVm1xUVo0SnlFdEhk?=
 =?utf-8?B?bFd6K0IxclFSVEVJT1ZJK0krOGM5RkhPMXhpVGV1Q2JDU0J5bHBTbHUwcmtX?=
 =?utf-8?B?cXVGT01ER25WYm9pWTRSdFFCeVNVMTdFZFBDNnJlOG0vTGNQOGFxNi9yblEv?=
 =?utf-8?B?TU53WWo3M0d4TEpLOFZHc2MyM3VxQ1oyb2VLY1pnVHpvVVh2dXpaK1FLbUhU?=
 =?utf-8?B?VmkvM05lWUJ0SDh0WUljc0JZNFJ6WDhJNGdZN2FxZHVxTmoyYUx2UGx6NkFC?=
 =?utf-8?B?QVJvVkFZdlJTbXE3Q0VUNlBHOTJNNmdFMlJ3WlRJNmJzeVd2LzBmMmIzN29y?=
 =?utf-8?B?dmQ0N3JURytwNllPd0dBZzcranYxNHgwSTFiK0RzL0xGZW1EYi9na3Z2Z3d0?=
 =?utf-8?B?L25DZE9SdjR2eWNhclh4aWxNKytZZjM4TFRNVGk0dEhFWjRPNUJFajlueWd5?=
 =?utf-8?B?dnFIcjNHUDVIQno0SFNacTVzS0ZlQklqT0VQUnUvMjFUdldZY1k1L2xhTDhw?=
 =?utf-8?B?WE00eUR3UjJYdlV3dlQzdTFrRCt2bERkNXcybVJIWlllUXpVb09VZ0RYRjRv?=
 =?utf-8?B?SkhBRHhKZXBKMGlUUkhxWWJITjB4b05HWmhoeFNoV0lMOFBOS2RNR212QWdt?=
 =?utf-8?Q?dbwrILpW032rp0dYpqliEqY15?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2a06c1-a7a5-4b75-b9bf-08dd55abfa7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 14:52:08.6276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L4Mh38nZ6s9JUGc/nDakFDYIdbCCNLdG767z50AyP9+iRE104lPrjvvRCEReXn2BUy/GGeHtBKF/bhq6panRe8iR8tLwHe6IgSflXhuh/gE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8691
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGUgTWFyY2hpLCBMdWNh
cyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAy
NSwgMjAyNSA4OjE4IFBNDQo+IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGlu
dGVsLmNvbT4NCj4gQ2M6IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBpbnRlbC5jb20+OyBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnOyBCZWxnYXVta2FyLCBWaW5heQ0KPiA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5j
b20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjldIGRybS94ZS91YXBpOiBVc2UgaGludCBmb3Ig
Z3VjIHRvIHNldCBHVCBmcmVxdWVuY3kNCj4gDQo+IE9uIFR1ZSwgRmViIDI1LCAyMDI1IGF0IDA0
OjM5OjI1QU0gKzAwMDAsIFVwYWRoeWF5LCBUZWphcyB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IERlIE1hcmNoaSwgTHVjYXMgPGx1
Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gPj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkgMjUs
IDIwMjUgMTI6NDIgQU0NCj4gPj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlA
aW50ZWwuY29tPg0KPiA+PiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+PiBCZWxnYXVta2FyLCBWaW5heSA8dmlu
YXkuYmVsZ2F1bWthckBpbnRlbC5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjldIGRy
bS94ZS91YXBpOiBVc2UgaGludCBmb3IgZ3VjIHRvIHNldCBHVA0KPiA+PiBmcmVxdWVuY3kNCj4g
Pj4NCj4gPj4gT24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDk6NDM6MDlBTSAtMDYwMCwgTHVjYXMg
RGUgTWFyY2hpIHdyb3RlOg0KPiA+PiA+T24gV2VkLCBGZWIgMTIsIDIwMjUgYXQgMDU6MDg6MzBQ
TSArMDUzMCwgVGVqYXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4+ID4+QWxsb3cgdXNlciB0byBwcm92
aWRlIGEgbG93IGxhdGVuY3kgaGludC4gV2hlbiBzZXQsIEtNRCBzZW5kcyBhDQo+ID4+ID4+aGlu
dCB0byBHdUMgd2hpY2ggcmVzdWx0cyBpbiBzcGVjaWFsIGhhbmRsaW5nIGZvciB0aGF0IHByb2Nl
c3MuDQo+ID4+ID4+U0xQQyB3aWxsIHJhbXAgdGhlIEdUIGZyZXF1ZW5jeSBhZ2dyZXNzaXZlbHkg
ZXZlcnkgdGltZSBpdCBzd2l0Y2hlcw0KPiA+PiA+PnRvIHRoaXMgcHJvY2Vzcy4NCj4gPj4gPj4N
Cj4gPj4gPj5XZSBuZWVkIHRvIGVuYWJsZSB0aGUgdXNlIG9mIFNMUEMgQ29tcHV0ZSBzdHJhdGVn
eSBkdXJpbmcgaW5pdCwgYnV0DQo+ID4+ID4+aXQgd2lsbCBhcHBseSBvbmx5IHRvIHByb2Nlc3Nl
cyB0aGF0IHNldCB0aGlzIGJpdCBkdXJpbmcgcHJvY2Vzcw0KPiA+PiA+PmNyZWF0aW9uLg0KPiA+
PiA+Pg0KPiA+PiA+PkltcHJvdmVtZW50IHdpdGggdGhpcyBhcHByb2FjaCBhcyBiZWxvdzoNCj4g
Pj4gPj4NCj4gPj4gPj5CZWZvcmUsDQo+ID4+ID4+DQo+ID4+ID4+On4kIE5FT1JlYWREZWJ1Z0tl
eXM9MSBFbmFibGVEaXJlY3RTdWJtaXNzaW9uPTAgY2xwZWFrDQo+ID4+ID4+LS1rZXJuZWwtbGF0
ZW5jeQ0KPiA+PiA+PlBsYXRmb3JtOiBJbnRlbChSKSBPcGVuQ0wgR3JhcGhpY3MNCj4gPj4gPj4g
RGV2aWNlOiBJbnRlbChSKSBHcmFwaGljcyBbMHhlMjBiXQ0KPiA+PiA+PiAgIERyaXZlciB2ZXJz
aW9uICA6IDI0LjUyLjAgKExpbnV4IHg2NCkNCj4gPj4gPj4gICBDb21wdXRlIHVuaXRzICAgOiAx
NjANCj4gPj4gPj4gICBDbG9jayBmcmVxdWVuY3kgOiAyODUwIE1Ieg0KPiA+PiA+PiAgIEtlcm5l
bCBsYXVuY2ggbGF0ZW5jeSA6IDI4My4xNiB1cw0KPiA+PiA+Pg0KPiA+PiA+PkFmdGVyLA0KPiA+
PiA+Pg0KPiA+PiA+Pjp+JCBORU9SZWFkRGVidWdLZXlzPTEgRW5hYmxlRGlyZWN0U3VibWlzc2lv
bj0wIGNscGVhaw0KPiA+PiA+Pi0ta2VybmVsLWxhdGVuY3kNCj4gPj4gPj5QbGF0Zm9ybTogSW50
ZWwoUikgT3BlbkNMIEdyYXBoaWNzDQo+ID4+ID4+IERldmljZTogSW50ZWwoUikgR3JhcGhpY3Mg
WzB4ZTIwYl0NCj4gPj4gPj4gICBEcml2ZXIgdmVyc2lvbiAgOiAyNC41Mi4wIChMaW51eCB4NjQp
DQo+ID4+ID4+ICAgQ29tcHV0ZSB1bml0cyAgIDogMTYwDQo+ID4+ID4+ICAgQ2xvY2sgZnJlcXVl
bmN5IDogMjg1MCBNSHoNCj4gPj4gPj4NCj4gPj4gPj4gICBLZXJuZWwgbGF1bmNoIGxhdGVuY3kg
OiA2My4zOCB1cw0KPiA+PiA+Pg0KPiA+PiA+PlVNRCBDb21wdXRlIFBSIDogaHR0cHM6Ly9naXRo
dWIuY29tL2ludGVsL2NvbXB1dGUtDQo+IHJ1bnRpbWUvcHVsbC83OTQNCj4gPj4gPj5VTUQgTWVz
YSBQUiA6DQo+ID4+ID4+aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8t
L21lcmdlX3JlcXVlc3RzLzMzMjE0DQo+ID4+ID4+DQo+ID4+ID4+djkoVmluYXkpOg0KPiA+PiA+
PiAtIHJlbW92ZSBleHRyYSBsaW5lLCBhbGlnbiBjb21taXQgbWVzc2FnZQ0KPiA+PiA+PnY4KFZp
bmF5KToNCj4gPj4gPj4gLSBBZGQgc2VwYXJhdGUgZXhhbXBsZSBmb3IgdXNpbmcgbG93IGxhdGVu
Y3kgaGludA0KPiA+PiA+PnY3KEpvc2UpOg0KPiA+PiA+PiAtIFVwZGF0ZSBVTUQgUFINCj4gPj4g
Pj4gLSBhcHBsaWNhYmxlIHRvIGFsbCBncHVzDQo+ID4+ID4+VjY6DQo+ID4+ID4+IC0gaW5pdCBm
bGFncywgcmVtb3ZlIHJlZHVuZGFudCBmbGFncyBjaGVjayAoTUF1bGQpDQo+ID4+ID4+VjU6DQo+
ID4+ID4+IC0gTW92ZSB1YXBpIGRvYyB0byBkb2N1bWVudGF0aW9uIGFuZCBHdUMgQUJJIHNwZWNp
ZmljIGNoYW5nZQ0KPiA+PiA+PihSb2RyaWdvKQ0KPiA+PiA+DQo+ID4+ID5obW4uLi4gdGhhdCBk
b2Vzbid0IGxvb2sgcmlnaHQuDQo+ID4+ID4NCj4gPj4gPi4uLg0KPiA+PiA+DQo+ID4+ID4+ZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS11YXBpLnJzdA0KPiA+PiA+PmIvRG9jdW1l
bnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0IGluZGV4DQo+IGI3NWNjOWE3MGQxZi4uNzMzN2QxYmU0
NWVmDQo+ID4+ID4+MTAwNjQ0DQo+ID4+ID4+LS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLXVh
cGkucnN0DQo+ID4+ID4+KysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0DQo+ID4+
ID4+QEAgLTU4MywzICs1ODMsMjEgQEAgZG1hLWJ1ZiBpbnRlcm9wZXJhYmlsaXR5DQo+ID4+ID4+
DQo+ID4+ID4+UGxlYXNlIHNlZSBEb2N1bWVudGF0aW9uL3VzZXJzcGFjZS1hcGkvZG1hLWJ1Zi1h
bGxvYy1leGNoYW5nZS5yc3QNCj4gPj4gPj5mb3IgaW5mb3JtYXRpb24gb24gaG93IGRtYS1idWYg
aXMgaW50ZWdyYXRlZCBhbmQgZXhwb3NlZCB3aXRoaW4gRFJNLg0KPiA+PiA+PisNCj4gPj4gPj4r
TG93IGxhdGVuY3kgaGludCBieSB1c2VyDQo+ID4+ID4+Kz09PT09PT09PT09PT09PT09PT09PT09
PQ0KPiA+PiA+PisNCj4gPj4gPj4rQWxsb3cgdXNlcnMgdG8gcHJvdmlkZSBhIGhpbnQgdG8ga2Vy
bmVsIGZvciBjYXNlcyBkZW1hbmRpbmcgbG93DQo+ID4+ID4+K2xhdGVuY3kgcHJvZmlsZS4gUGxl
YXNlIG5vdGUgaXQgd2lsbCBoYXZlIGltcGFjdCBvbiBwb3dlcg0KPiA+PiA+Pitjb25zdW1wdGlv
bi4gVXNlciBjYW4gaW5kaWNhdGUgbG93IGxhdGVuY3kgaGludCB3aXRoIGZsYWcgd2hpbGUNCj4g
Pj4gPj4rY3JlYXRpbmcgZXhlYyBxdWV1ZSBhcyBtZW50aW9uZWQgYmVsb3csDQo+ID4+ID4+Kw0K
PiA+PiA+PisgICAgIHN0cnVjdCBkcm1feGVfZXhlY19xdWV1ZV9jcmVhdGUgZXhlY19xdWV1ZV9j
cmVhdGUgPSB7DQo+ID4+ID4+KyAgICAgICAgICAuZmxhZ3MgPSBEUk1fWEVfRVhFQ19RVUVVRV9M
T1dfTEFURU5DWV9ISU5ULA0KPiA+PiA+PisgICAgICAgICAgLmV4dGVuc2lvbnMgPSAwLA0KPiA+
PiA+PisgICAgICAgICAgLnZtX2lkID0gdm0sDQo+ID4+ID4+KyAgICAgICAgICAubnVtX2JiX3Bl
cl9leGVjID0gMSwNCj4gPj4gPj4rICAgICAgICAgIC5udW1fZW5nX3Blcl9iYiA9IDEsDQo+ID4+
ID4+KyAgICAgICAgICAuaW5zdGFuY2VzID0gdG9fdXNlcl9wb2ludGVyKCZpbnN0YW5jZSksDQo+
ID4+ID4+KyAgICAgfTsNCj4gPj4gPj4rICAgICBpb2N0bChmZCwgRFJNX0lPQ1RMX1hFX0VYRUNf
UVVFVUVfQ1JFQVRFLA0KPiA+PiA+PisgJmV4ZWNfcXVldWVfY3JlYXRlKTsNCj4gPj4gPg0KPiA+
PiA+aG93IGRvZXMgdGhpcyBkcml2ZXItc3BlY2lmaWMgZG9jIG1ha2Ugc2Vuc2UgaW4gdGhpcyBm
aWxlPw0KPiA+DQo+ID5UaGFua3MgZm9yIGxvb2tpbmcgYXQgdGhpcy4NCj4gPg0KPiA+VGhlcmUg
d2FzIHN1Z2dlc3Rpb24gdG8gYWRkIHRoaXMgaW4gZG9jdW1lbnRhdGlvbiBkdXJpbmcgcmV2aWV3
LCBAVml2aSwNCj4gUm9kcmlnbyBDYW4gd2UgcmVtb3ZlIHRoaXM/IEFuZCBpZiB3ZSByZW1vdmUg
dGhpcyB3aGF0cyBwb2ludCBpbiBrZWVwaW5nDQo+IGRvY3VtZW50YXRpb24gaGVyZSBmb3IgNCBs
aW5lIHBhcmFncmFwaD8NCj4gPkBEZSBNYXJjaGksIEx1Y2FzIERvIHlvdSBtZWFuIGNvbXBsZXRl
bHkgcmVtb3ZlIGZyb20gaGVyZSwganVzdCBrZWVwIGluDQo+IHhlX2RybS5oPw0KPiANCj4gQUZB
SUNTIGluIHY0IHRoZSByZXF1ZXN0IHdhcyB0byBhZGQgaXQgdG8gdGhlIGRvY3VtZW50YXRpb24s
IG5vdCB0byBhZGQgaXQgdG8gYQ0KPiByYW5kb20gZG9jdW1lbnRhdGlvbiBmaWxlLiBJbiB2NCB0
aGlzIGV4YW1wbGUgd2FzIG9ubHkgaW4gdGhlIGNvbW1pdA0KPiBtZXNzYWdlIHJhdGhlciB0aGFu
IGluIHRoZSBkb2N1bWVudGF0aW9uLg0KPiANCj4gSWYgeW91IGFkZCBpdCBhcyBrZXJuZWwtZG9j
IHlvdSBhcmUgYWRkaW5nIGl0IHRvIHRoZSBkb2N1bWVudGF0aW9uLiBTZWUNCj4gaHR0cHM6Ly9k
b2NzLmtlcm5lbC5vcmcvZ3B1L2RyaXZlci11YXBpLmh0bWwjYy5kcm1feGVfZXhlY19xdWV1ZV9j
cmVhdGUNCj4gCQkJICAgIF5eXl5eXl5eXl5eDQo+IA0KPiBUaGUgeGUgdWFwaSBzaG93cyB1cCBo
ZXJlOg0KPiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9ncHUvZHJpdmVyLXVhcGkuaHRtbCNkcm0t
eGUtdWFwaSBiZWNhdXNlOg0KPiANCj4gRG9jdW1lbnRhdGlvbi9ncHUvaW5kZXgucnN0Og0KPiAJ
Li4uDQo+IAlkcml2ZXItdWFwaQ0KPiAJLi4uDQo+IA0KPiBEb2N1bWVudGF0aW9uL2dwdS9kcml2
ZXItdWFwaToNCj4gDQo+IAlkcm0veGUgdUFQSQ0KPiAJPT09PT09PT09PT0NCj4gDQo+IAkuLiBr
ZXJuZWwtZG9jOjogaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaA0KPiANCj4gSW4gdjkgdGhpcyBl
eGFtcGxlIGlzIGR1cGxpY2F0ZWQgaW4gRG9jdW1lbnRhdGlvbi9ncHUvZHJtLXVhcGkucnN0ICh3
cm9uZw0KPiBmaWxlKSBhbmQgeGVfZHJtLmggKHJpZ2h0IG9uZSkuDQoNCkkgZ2V0IHdoYXQgeW91
IHN1Z2dlc3RlZCBlYXJsaWVyIEkgY2hhbmdlZCBhY2NvcmRpbmcgdG8gdGhhdCBvbmx5LiBCdXQg
bGF0ZXIgdGhlcmUgd2FzIHN1Z2dlc3Rpb24gZnJvbSBSb2RyaWdvIHRvIG1vdmUvYWRkIHRvIERv
Y3VtZW50YXRpb24vZ3B1L2RybS11YXBpLnJzdC4gQFZpdmksIFJvZHJpZ28gQXJlIHlvdSBvayBp
ZiB3ZSByZW1vdmUgZnJvbSBoZXJlIGFuZCBrZWVwIGluIHhlX2RybS5oIG9ubHk/DQoNClRlamFz
DQo+IA0KPiBJIGhvcGUgdGhhdCBjbGFyaWZpZXMuDQo+IA0KPiBMdWNhcyBEZSBNYXJjaGkNCj4g
DQo+ID4NCj4gPlRlamFzDQo+ID4NCj4gPj4NCj4gPj4gdG8gYXZvaWQgbmVlZGxlc3Mgbm9pc2Ug
aW4gdGhlIGxvZywgSSB6YXBwZWQgdGhpcyBjb21taXQgZnJvbQ0KPiA+PiBkcm0teGUtbmV4dDoN
Cj4gPj4NCj4gPj4gICArIDhmNzhjMGRmYmU5ZC4uLjhiNGIzYWY4NjllOSBkcm0teGUtbmV4dCAt
PiBkcm0teGUtbmV4dCAoZm9yY2VkDQo+ID4+IHVwZGF0ZSkNCj4gPj4NCj4gPj4gOGI0YjNhZiBv
IFtkcm0teGUtbmV4dF0ge2RybS14ZS9kcm0teGUtbmV4dH0ge2RybS14ZS9IRUFEfQ0KPiA+PiBk
cm0veGUvdXNlcnB0cjogcmVtb3ZlIHRtcF9ldmljdCBsaXN0DQo+ID4+IDZiOTNjYjkgbyBkcm0v
eGUvdXNlcnB0cjogZml4IEVGQVVMVCBoYW5kbGluZw0KPiA+PiA0ZTM3ZTkyIG8gZHJtL3hlL3Vz
ZXJwdHI6IHJlc3RvcmUgaW52YWxpZGF0aW9uIGxpc3Qgb24gZXJyb3IgOGY3OGMwZA0KPiA+PiDi
lIIgbw0KPiA+PiBkcm0veGUvdXNlcnB0cjogcmVtb3ZlIHRtcF9ldmljdCBsaXN0IGYyMjExYWEg
4pSCIG8gZHJtL3hlL3VzZXJwdHI6IGZpeA0KPiA+PiBFRkFVTFQgaGFuZGxpbmcgYjlhYWFiYiDi
lIIgbyBkcm0veGUvdXNlcnB0cjogcmVzdG9yZSBpbnZhbGlkYXRpb24gbGlzdA0KPiA+PiBvbiBl
cnJvcg0KPiA+PiBiZWUzN2E4IOKUgiBvIGRybS94ZS91YXBpOiBVc2UgaGludCBmb3IgZ3VjIHRv
IHNldCBHVCBmcmVxdWVuY3kNCj4gPj4NCj4gPj4gdGhpcyBkb2N1bWVudGF0aW9uIGlzIGFsc28g
aW4gaW5jbHVkZS91YXBpL2RybS94ZV9kcm0uaCwgc28gbWF5YmUgdGhlDQo+ID4+IGJlc3QgdGhp
bmcgdG8gZG8gaXMgcHJvYmFibHkgdG8ganVzdCBkcm9wIHRoaXMgcGFydCB0aGF0IGdvdCBpbmNs
dWRlZA0KPiA+PiBpbiB0aGUgd3JvbmcgcGFydC4gT25jZSB0aGlzIGlzIGZpeGVkIHdlIGNhbiBh
ZGQgaXQgYmFjay4NCj4gPj4NCj4gPj4gTHVjYXMgRGUgTWFyY2hpDQo=
