Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D598BA897
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 10:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCE310F296;
	Fri,  3 May 2024 08:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/dCcp6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D1110F9B7;
 Fri,  3 May 2024 08:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714724421; x=1746260421;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EwCKmAHSNSWI1cHZ+ICiog+tDKp+iez4Sg+2xuynBF4=;
 b=j/dCcp6nVuEoUF0ENsRoP71KfKhfMRz+l26DYS9zjtxiob6arVXCBCSu
 aR0Bow1Zo2aW2sH/WlgqgFfcCPmKH8tK5XzcnndgfNWsq94bzKH9uDc/S
 US314AuMrXcUK85dE6OamKye7EFoLY60jf+L9fhtT4Vq/AgmNKDlrD4PC
 XoXjtDrA0myGBNkqKvJLy9koM80/kJcf/UyaKzSrmRuliTN9uC1uQ0uZM
 gb9LOtujo+jkWsRVD/DkvoYPxTzsGLHNgrrg5x5km/+A/GW7E0Rj6Ab2S
 WzXMvFnG5EtStpT5eB1TkBVQQblO16BTQKnZR/xlo+kQFc53NjZitCOBP A==;
X-CSE-ConnectionGUID: F7QHhwWES9K+/JvRKVtwvw==
X-CSE-MsgGUID: /+H6TbWRRtC3eYx87Wasfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10455499"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10455499"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 01:19:55 -0700
X-CSE-ConnectionGUID: 41Gu9CZTRFmx0Sb7PvQxdQ==
X-CSE-MsgGUID: FV/hduJfQKmG9W4vGLDzhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="50578010"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 May 2024 01:19:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 01:19:53 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 3 May 2024 01:19:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 3 May 2024 01:19:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 3 May 2024 01:19:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIWcXjGxnXU5mDnhNDDRHozZtEMg1YUmuiAsgJnQXmA9lfrOmV48iBXwMIeo/svRcJfBw14rU+/74uUdzpHjE5HWxsfgCRMgto08rChUVsgxR+Nti8r4lg56j2JFJdbKJhj0m/Dlohay4HWXW8WnNxlrjuRzCFPkG6n1H5pKiPnw7Abzpsvde4wZClfdWCmx2n1Ref4KaF9fLq1+mvYh5NwkBpPd1RzGQARRU+8YlYG2UlY4bUPBTmznjq4xGhXdQNImQ/cIc6pWIsm+mJxCxgnJ6ZSqMLHa0Msd9skdh9hUENmBVJxLfqmGOVe+v2EUoi5uf3bOZJbe+BePVJqwXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwCKmAHSNSWI1cHZ+ICiog+tDKp+iez4Sg+2xuynBF4=;
 b=MI+TCD86+q8qtt4SgOKYPuoH7GetUtQY2U1tAI61v7gASVnlKIqN4UkeZ93a7s3r6w+LATJWECDEVTFEgLUSrtYFwbwTUHQnWON449eO81aw09aM204UszX22CF7ti3c4TY+DAH7vOK4z58oEJ2EwAm8XEF7nlPvQ4N9l65fykiQrI6fmb95+5/qDBHmd3roavk7g2oWg7XQdp5zGuFaOmVORedrDCdoMV4Ju7OF7p6M0tf9IpkLhzR08TY7Swrs/fmZg8/pLd2MBeEf48f4bxIkB18LnLTc0tHQnQIr1+JHjSpJGVEg4m/8n4+mFp8i9sbAtWMBVJUoEa5xVHkVhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15)
 by SJ0PR11MB5791.namprd11.prod.outlook.com (2603:10b6:a03:423::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Fri, 3 May
 2024 08:19:44 +0000
Received: from PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::40e0:95a6:26e8:8de0]) by PH7PR11MB5981.namprd11.prod.outlook.com
 ([fe80::40e0:95a6:26e8:8de0%5]) with mapi id 15.20.7544.029; Fri, 3 May 2024
 08:19:44 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [PATCH v3 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Topic: [PATCH v3 5/6] drm/i915/alpm: Enable lobf from source in ALPM_CTL
Thread-Index: AQHalnjWFJLXppme2kOQeXf92EqlTbGFL5kAgAACgSA=
Date: Fri, 3 May 2024 08:19:44 +0000
Message-ID: <PH7PR11MB5981E8362DD409AAB082B98DF91F2@PH7PR11MB5981.namprd11.prod.outlook.com>
References: <20240424183820.3591593-1-animesh.manna@intel.com>
 <20240424183820.3591593-6-animesh.manna@intel.com>
 <8996bb1d911feaecff7c551853f6f020480a33a2.camel@intel.com>
In-Reply-To: <8996bb1d911feaecff7c551853f6f020480a33a2.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5981:EE_|SJ0PR11MB5791:EE_
x-ms-office365-filtering-correlation-id: ab3d6531-4a8a-477c-9f96-08dc6b49ca05
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?SkdiVXhKRzNaei9tRFc5aUluN2lhK1A4WStway8wSm1kV2ZzOFFDZWlvRWQw?=
 =?utf-8?B?N2JTa0QyZmh5Ti9TckRldjVRbXpxejI1c25OL3RaNnh1K1AyUUEySnhzaE1i?=
 =?utf-8?B?cWo5Q2xGQ3NhSDdFQkZUb2ZZUXE5OEludGxUamxDVjR6Mng2cjk2SWp2ZGwv?=
 =?utf-8?B?ZUF1eVJjamV1MzFKbm5KQ25TN2RNYlM0Q1VIR2psTWo3ZllBNXRCTlNBUTZJ?=
 =?utf-8?B?S0pvTU1qY1o4aVUweHRSN3JiNExhTHR2bTVsMWkweFFldzBvcmoxbm9YSGxF?=
 =?utf-8?B?N0UreTNhcGkvbm1HZmRFM21kT3VMUFJmV2h1N0ROVVoyNm1YZTFwWDlKbTBQ?=
 =?utf-8?B?VDNrb0VCbG03TlMzNG5Zc1BWODByZ05nbjFyRjA3NGNpSjJCRFVhUTM5aXVp?=
 =?utf-8?B?cHM4WEJhU2UxVjZRRGxOM0pqSlpJaGFsaEgxSU9OVVB0OCtieC9GaGQyaWx6?=
 =?utf-8?B?MXhZVTBNYTZvVUZuZGcvU21iRjltdnluTnhKNVFlajFpeUlzaERxdWhSdUw5?=
 =?utf-8?B?RkltcmVORHRqa0ZBN0crOGo2SDlyejJhaG44eFNaRCt3V3VoWDY2TEtpMjRQ?=
 =?utf-8?B?bThxdVl5OFEyenB6NGg4TnZTdzAyZEZOQkZCRzkya3MwajdlcGREdlVjdnFH?=
 =?utf-8?B?bmk5OG5hR3NHN2VKc28vTmh1dVFranB2TzBnL2RlS2RSaC96d1UrdHg2NURY?=
 =?utf-8?B?aWtqRDk0bTBOM1RFL3ZIelhFQmg5eXZ3VmRIYllmUXJnUXIvNUtDNyt0SkZQ?=
 =?utf-8?B?dFBOeXZEbmdaSW9QYldXZ2ZhN0EwYW94NDFXdWI4U0ZWK3FlNE5tYXNZME1l?=
 =?utf-8?B?MDkrdUIyVk1Rc094RitiR1cxaW5EOFVPd2xjUUZXNUhoWEZvOU5WNjFtN0o5?=
 =?utf-8?B?MFQzY0l2NHFRMVZoWlFSL0crMDRpT01lQmVoZDdnTFloQnd1SWVzbTBrb1RT?=
 =?utf-8?B?dGZraUhxU3NLMGU0ZVZzdWNZZGdHVWxQUXFTc1d4VGprVmNqWmI2aGd1NXdH?=
 =?utf-8?B?SWJBYTI5U3d1NmY5U3lWbjlVU0IrdHIvZDJHMm1qMFJTZk5DOERyUndrTVh3?=
 =?utf-8?B?R0dSaDRPR0g4SVp5VDVia2tKSWtxb0FpOGxiYWJBMkxsVTl5OFAreVBXSUh0?=
 =?utf-8?B?d2JtZnhlaTB0SEQ1c3JnTFQ5Y0lYU1NWa3hoK1F4MGtzQW11UEFhNkg5NEdh?=
 =?utf-8?B?ZmJNS1RYL3cwTWFncUs0ZVN5eGNlR0xxdXVMcEEwMXNlYW5qZGZNaS9XWmQr?=
 =?utf-8?B?NVlLVUpuMzBCVnZ1VjkvUkFJV3dMU21mV1g1NTVHbUdrMjY2c3BWa0V0UVVS?=
 =?utf-8?B?M0s1OGlERmltSG9xeE9oVE9XbTBFOXBEWW9uWkdYU2VXWVgyQmk3NVdWTFBV?=
 =?utf-8?B?Tm9Zd3V6aTFNWklqdmZEdWR5eGJ4NHFkWFIrVEIvWGFIN0p3YnZvNzRxaTRC?=
 =?utf-8?B?YkRmdWcrdWM0bTdiUEhKK1RzZ09JVmVxRks4bDlvR29QMFBkZUJGTXhUYXN0?=
 =?utf-8?B?MHNzUU5ya2w4Yld0NE1UNGplUEpXa1BYRW4vRDA1eTZzWXV3U0RFWGlDcmw2?=
 =?utf-8?B?TkVBSFlRUGdpcDIxS21tRXlKQVhIektYbmNBaHhydlB2MjU5VEJKWU11VDdj?=
 =?utf-8?B?ZFpEcU9xcVFQMktjbUI0c3VpZi9YNk9qSDRPblJiV2VhWHVYR1pCcmtQR0Zw?=
 =?utf-8?B?TVlxTTVpRjdPZlV6amdSM2JvSDJ2UXZBajArdFdYd1NzK09pSGV6UFppZ2Y4?=
 =?utf-8?B?cDI1aXR6cS9Ec2pXUkQ3eWJDYk5LUXlyZE5tV2hIYStOUUJCNGJtMWszWUZS?=
 =?utf-8?B?S3p0MTl3TlhFVXljQmpDZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTV4dnJrbWhFVHRMVUx4L1RWcFIvU1Q3ZHVXc3Q2VWlVVjkvZWw3ZWkxaU5l?=
 =?utf-8?B?Z3ExR2pFamtCYit2a0ZZRTZoYWtKNkNXeGRlMEFFczlqeTBPZWhwQkMxSjc4?=
 =?utf-8?B?R0RXaCswd0ZjNTgwODhoREVpNnNLditndzVIS0o0MmNzb3pBYnFnMFZ0c2JI?=
 =?utf-8?B?TitnYnQzMC9KcHBXNUJtdFVwRitxbnVTbXgrVmErdXhQcFlNSS95bFhuSWoz?=
 =?utf-8?B?UGZDcnVtQzlFdE9VYlhId01iUVVGWWhWRC9DRzVzWFFrdm1vc296TVdqd05w?=
 =?utf-8?B?Z29kQmhTMkV4Z0dMWFFpSFRVbnUyV1BMWTdKSzRReXdua2RhcTRFcTlFeGxp?=
 =?utf-8?B?ZEhpS1RqOUZCanVVaW1MbjFaVXA0NzNYUk14M2gvOHN4Wm5UQXFuQ1o2Ujky?=
 =?utf-8?B?NUNrV3czZ1gyWWR4RXlmRmhMdlJLWmp2MDdLR29HanBoRU11SzFOdjNDcnNa?=
 =?utf-8?B?NjlrMjNJd2VqWndhbm9VWEdvZDZmcmo5NU94WUtnM3YwYXRtOU9jV3N1M3VM?=
 =?utf-8?B?TE94dzVCbjBpdlNnY1hHOHQ0bUhGbGlOWUNJMVltNG1GcDNIbmF1eU5EdGxu?=
 =?utf-8?B?T0IvNi9jWDIrcXU1VzN0RVZNYVRpVHFDOXI2VU9HK2NPcTBMRW8xdzJjcmph?=
 =?utf-8?B?YUZOVS9HdXNoREo4VFZQVllhcktRWWlzYXJiZyttNUJ1aWlHM2dsc3ViYlY1?=
 =?utf-8?B?N2t4TUkrSWdwMWtrdWRZRHliQUpPTm5qMDRMd1lISmVMcVZaaGU4Q0xWbGVm?=
 =?utf-8?B?bU5ST3JUcmZiei8zZi9Nd3B1MmhQdWlGTzBpd1JwdVJqeWI3Z1FDdEx4UFNJ?=
 =?utf-8?B?L0NGVFEzOEtYeVhWSFlSSWdqRGlKL2hlRUpreHNwbVNoRFFGd2lpenFvMm5V?=
 =?utf-8?B?TVVVYlcwc3lQcmxzRDA5QkpISHBwZ0N0eDVBUVNnOWZXbFFuZC80bmdKTlIv?=
 =?utf-8?B?TGhITEpTUlNzY05ZaXNSQ09SWXE5NUZZUnNYdkNRWnlaLzZOM3NucGZGV1d1?=
 =?utf-8?B?TTdiU0VLaGU4TUVaYm5CMFh3UjI0a3Q3TENoRGRqWWhYZy9ZRjA4MGd2SDJR?=
 =?utf-8?B?d3ZwM1NOL2tNN0VaWW9SMXFqSlBrbHVuamNBeG5PUldScUpwM3djRVZoYThr?=
 =?utf-8?B?T01neHZvNWwweVg0cmI4QUQ3L3N1NkxNOXVHYTFUREF6dXB6a0VJWGNNOXEz?=
 =?utf-8?B?dkJzYjdiVHRYbk10ZnJTTVZIODJyZFdvQmhzNVhSdHN6eHI5VEpHbjVOdnFz?=
 =?utf-8?B?KytFQi9HVjJjd0pkR2tpU3RDTHBxMHFnREhwOE5KQnh3M2lhVVhJQkxBKzBE?=
 =?utf-8?B?ai95MjhVK1ZUd2dyRFJnUGRJMEFERGlCM24vUG82Mm92Mys3b0p3a3lYOFFh?=
 =?utf-8?B?RStKMGZXNGhGTUxxdktUVTNCU3lUNnFFYm12ekRqVWxYa2ZjOVVMeU43TjhS?=
 =?utf-8?B?bmJKc25ueDZWWFN0Q29SZUR3Q1lwMmtzN1FVZzVTTDhEWHhVTjUycENqZTB2?=
 =?utf-8?B?TGQzcms3Q0VxckRFV1lJRHI4TW4rdzVUdE1SdThlYVJQVjhTRmlhbEt0VjVx?=
 =?utf-8?B?MkNxbk1FRGdxcDBHMGpLWm83cmNhNTI3OEtVWmcya0RabzFOVDg3c3dtUXJt?=
 =?utf-8?B?MUdVUjllVENlbW9JR2ZtNjRLNmU4My9WUFJjd042VlVPYVNCN1p2Rm16enpF?=
 =?utf-8?B?ei8xSnB5dUFFYUtpaTlMOXVQaXIzMjZDTzR0WXFNQldRSFZjb1BpcGZBUXVa?=
 =?utf-8?B?QWplblQyeXBHVTBJOE5XdFZyditibzNLZG5kelg4WGhtaHZ3dXlvZEpUajlx?=
 =?utf-8?B?em9Da0tsYktmM2FtRkh5RDhSQVNhYUpRbWY4Y29yL1VMV3FlaUJuSUx0K2Mz?=
 =?utf-8?B?K1c1Y1UxMElwTkRqYkdLcEwrVnZEdEJEdkpITmdnc29qS1IvK2NacDF4amhM?=
 =?utf-8?B?NTNHL0xMNk1Ob2lOdlV0Y1NLVzJlZ1IrYVNXS3ZUVTROMStYcm42azlHYnBp?=
 =?utf-8?B?cTdjK0drSWRBVURXdXRVWERLSmUwM0psQjdsQzU0S3UzOWUyckRPUS95NGpH?=
 =?utf-8?B?OFF4cER2clhyaFFTNzZMcVFNRXI4WG4rUi9jOFhjNktCQkN4RVRPbGNvdkdF?=
 =?utf-8?Q?hUuCpC+QUG3Ga6yMbY1mNpIbF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3d6531-4a8a-477c-9f96-08dc6b49ca05
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2024 08:19:44.5631 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o7Za1fleSKgJN9eF2yMQYd9GkA20q3UrVhsekI+/HB43rMe8PSE1fYFweps5gYRV+OUkZqrZ5QyuLWM/vFCZRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5791
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSG9nYW5kZXIsIEpvdW5p
IDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWF5IDMsIDIwMjQg
MToxOCBQTQ0KPiBUbzogTWFubmEsIEFuaW1lc2ggPGFuaW1lc2gubWFubmFAaW50ZWwuY29tPjsg
aW50ZWwtDQo+IGdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IE11cnRoeSwgQXJ1biBSDQo+IDxhcnVuLnIubXVydGh5QGludGVs
LmNvbT47IE5pa3VsYSwgSmFuaSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBS
ZTogW1BBVENIIHYzIDUvNl0gZHJtL2k5MTUvYWxwbTogRW5hYmxlIGxvYmYgZnJvbSBzb3VyY2Ug
aW4NCj4gQUxQTV9DVEwNCj4gDQo+IE9uIFRodSwgMjAyNC0wNC0yNSBhdCAwMDowOCArMDUzMCwg
QW5pbWVzaCBNYW5uYSB3cm90ZToNCj4gPiBTZXQgdGhlIExpbmsgT2ZmIEJldHdlZW4gRnJhbWVz
IEVuYWJsZSBiaXQgaW4gQUxQTV9DVEwgcmVnaXN0ZXIuDQo+ID4NCj4gPiBOb3RlOiBMb2JmIG5l
ZWQgdG8gYmUgZW5hYmxlZCBhZGFwdGl2ZSBzeW5jIGZpeGVkIHJlZnJlc2ggbW9kZSB3aGVyZQ0K
PiA+IHZtaW4gPSB2bWF4ID0gZmxpcGxpbmUsIHdoaWNoIHdpbGwgYXJpc2UgYWZ0ZXIgY21tciBm
ZWF0dXJlDQo+ID4gZW5hYmxlbWVudC4gV2lsbCBhZGQgZW5hYmxpbmcgc2VxdWVuY2UgaW4gYSBz
ZXBhcmF0ZSBwYXRjaC4NCj4gDQo+IElzIGFkYXB0aXZlIHN5bmMgbmVlZGVkIGZvciBib3RoIEF1
eCBXYWtlIGFuZCBBdXggTGVzcyBXYWtlPw0KIA0KQUZBSUssIEFMUE0gKGF1eC13YWtlL2F1eC1s
ZXNzKSBkbyBub3QgaGF2ZSBhbnkgZGVwZW5kZW5jeSBvbiBhZGFwdGl2ZSBzeW5jLg0KQnV0IExP
QkYgaXMgZGVwZW5kZW50IG9uIEFMUE0gKGF1eC13YWtlL2F1eC1sZXNzKSBhbmQgYWRhcHRpdmUg
c3luYyBmaXhlZCByZWZyZXNoIG1vZGUuDQoNCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jIHwgMTMgKysrKysrKysrLS0t
LQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmggfMKgIDQg
KystLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuY8KgIHzC
oCAyICstDQo+ID4gwqAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9hbHBtLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YWxwbS5jDQo+ID4gaW5kZXggM2JiNjllZDE2YWFiLi5iMDg3OTk1ODZiNTggMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+IEBAIC0yOTAs
MTAgKzI5MCwxMSBAQCB2b2lkIGludGVsX2FscG1fY29tcHV0ZV9sb2JmX2NvbmZpZyhzdHJ1Y3QN
Cj4gPiBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiDCoH0N
Cj4gPg0KPiA+IC1zdGF0aWMgdm9pZCBsbmxfYWxwbV9jb25maWd1cmUoc3RydWN0IGludGVsX2Rw
ICppbnRlbF9kcCkNCj4gPiArc3RhdGljIHZvaWQgbG5sX2FscG1fY29uZmlndXJlKHN0cnVjdCBp
bnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUN
Cj4gPiAqY3J0Y19zdGF0ZSkNCj4gPiDCoHsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gZHBfdG9faTkxNShpbnRlbF9kcCk7DQo+ID4gLcKg
wqDCoMKgwqDCoMKgZW51bSB0cmFuc2NvZGVyIGNwdV90cmFuc2NvZGVyID0gaW50ZWxfZHAtPnBz
ci50cmFuc2NvZGVyOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGVudW0gdHJhbnNjb2RlciBjcHVfdHJh
bnNjb2RlciA9IGNydGNfc3RhdGUtPmNwdV90cmFuc2NvZGVyOw0KPiA+IMKgwqDCoMKgwqDCoMKg
wqB1MzIgYWxwbV9jdGw7DQo+ID4NCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKERJU1BMQVlfVkVS
KGRldl9wcml2KSA8IDIwIHx8ICghaW50ZWxfZHAtDQo+ID4gPnBzci5wc3IyX2VuYWJsZWQgJiYN
Cj4gPiBAQCAtMzI5LDEyICszMzAsMTYgQEAgc3RhdGljIHZvaWQgbG5sX2FscG1fY29uZmlndXJl
KHN0cnVjdCBpbnRlbF9kcA0KPiA+ICppbnRlbF9kcCkNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFMUE1fQ1RMX0VYVEVOREVEX0ZBU1Rf
V0FLRV9USU1FKGludGVsX2RwLQ0KPiA+ID5hbHBtX3BhcmFtZXRlcnMuZmFzdF93YWtlX2xpbmVz
KTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiA+DQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGNy
dGNfc3RhdGUtPmhhc19sb2JmKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBh
bHBtX2N0bCB8PSBBTFBNX0NUTF9MT0JGX0VOQUJMRTsNCj4gPiArDQo+IA0KPiBIb3cgeW91IGFy
ZSBwbGFubmluZyB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gQVVYIFdha2UgYW5kIEFVWCBMZXNz
DQo+IFdha2UgZm9yIExPQkY/DQoNCkxPQkYgY2FuIGJlIGVuYWJsZWQgaW4gYm90aCBhdXgtd2Fr
ZSBvciBhdXgtbGVzcyBhbHBtLiBTbywgY2hlY2sgZm9yIGF1eC13YWtlIG9yIGF1eC1sZXNzIGlz
IG5vdCBuZWVkZWQuDQpGb3IgYXV4IHdha2UgQUxQTV9DVExbIEFMUE0gQVVYIExlc3MgRW5hYmxl
IF0gPSAwDQphbmQgZm9yIGF1eCBsZXNzIEFMUE1fQ1RMWyBBTFBNIEFVWCBMZXNzIEVuYWJsZSBd
ID0gMS4NClNvLCBJIGFtIHBsYWluaW5nIHRvIGFkZCBoYXNfbG9iZiBjaGVjayBhbmQgZW5hYmxl
IGlmIG5lZWRlZCBiZWZvcmUgQUxQTV9DVEwgcmVnaXN0ZXIgaXMgZ2V0dGluZyBwcm9ncmFtbWVk
LiBEbyB5b3Ugc2VlIGFueSBpc3N1ZSBoZXJlPw0KDQpSZWdhcmRzLA0KQW5pbWVzaA0KDQo+IA0K
PiBCUiwNCj4gDQo+IEpvdW5pIEjDtmdhbmRlcg0KPiANCj4gPiDCoMKgwqDCoMKgwqDCoMKgYWxw
bV9jdGwgfD0gQUxQTV9DVExfQUxQTV9FTlRSWV9DSEVDSyhpbnRlbF9kcC0NCj4gPiA+YWxwbV9w
YXJhbWV0ZXJzLmNoZWNrX2VudHJ5X2xpbmVzKTsNCj4gPg0KPiA+IMKgwqDCoMKgwqDCoMKgwqBp
bnRlbF9kZV93cml0ZShkZXZfcHJpdiwgQUxQTV9DVEwoY3B1X3RyYW5zY29kZXIpLCBhbHBtX2N0
bCk7DQo+ID4gwqB9DQo+ID4NCj4gPiAtdm9pZCBpbnRlbF9hbHBtX2NvbmZpZ3VyZShzdHJ1Y3Qg
aW50ZWxfZHAgKmludGVsX2RwKQ0KPiA+ICt2b2lkIGludGVsX2FscG1fY29uZmlndXJlKHN0cnVj
dCBpbnRlbF9kcCAqaW50ZWxfZHAsDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19z
dGF0ZSkNCj4gPiDCoHsNCj4gPiAtwqDCoMKgwqDCoMKgwqBsbmxfYWxwbV9jb25maWd1cmUoaW50
ZWxfZHApOw0KPiA+ICvCoMKgwqDCoMKgwqDCoGxubF9hbHBtX2NvbmZpZ3VyZShpbnRlbF9kcCwg
Y3J0Y19zdGF0ZSk7DQo+ID4gwqB9DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5oDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX2FscG0uaA0KPiA+IGluZGV4IGI5NjAyYjcxZDI4Zi4uYTljYTE5MGRhM2U0IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5o
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4g
PiBAQCAtMTgsNiArMTgsNiBAQCBib29sIGludGVsX2FscG1fY29tcHV0ZV9wYXJhbXMoc3RydWN0
IGludGVsX2RwDQo+ID4gKmludGVsX2RwLA0KPiA+IMKgdm9pZCBpbnRlbF9hbHBtX2NvbXB1dGVf
bG9iZl9jb25maWcoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCwNCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlDQo+ID4gKmNydGNfc3RhdGUsDQo+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZQ0KPiA+ICpjb25uX3N0YXRlKTsgLXZvaWQg
aW50ZWxfYWxwbV9jb25maWd1cmUoc3RydWN0IGludGVsX2RwICppbnRlbF9kcCk7DQo+ID4gLQ0K
PiA+ICt2b2lkIGludGVsX2FscG1fY29uZmlndXJlKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAs
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSk7DQo+ID4gwqAjZW5kaWYN
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3Iu
Yw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiA+IGlu
ZGV4IGM0YWIyODlkYmMxNS4uNGViNDVkZjIwYWQyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jDQo+ID4gQEAgLTE2MTEsNyArMTYxMSw3IEBAIHN0
YXRpYyB2b2lkIGludGVsX3Bzcl9lbmFibGVfc291cmNlKHN0cnVjdA0KPiA+IGludGVsX2RwICpp
bnRlbF9kcCwNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBJR05PUkVfUFNSMl9IV19UUkFDS0lORyA6IDApOw0KPiA+DQo+ID4gwqDC
oMKgwqDCoMKgwqDCoGlmIChpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKQ0KPiA+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF9hbHBtX2NvbmZpZ3VyZShpbnRlbF9kcCk7DQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVsX2FscG1fY29uZmlndXJlKGlu
dGVsX2RwLCBjcnRjX3N0YXRlKTsNCj4gPg0KPiA+IMKgwqDCoMKgwqDCoMKgwqAvKg0KPiA+IMKg
wqDCoMKgwqDCoMKgwqAgKiBXYV8xNjAxMzgzNTQ2OA0KDQo=
