Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML7nFjzJp2k0jwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 06:55:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBA51FAFDA
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 06:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEE210E1E2;
	Wed,  4 Mar 2026 05:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OIs5Wg/k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7278610E1E2;
 Wed,  4 Mar 2026 05:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772603703; x=1804139703;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Z/554C/TDIU0lEVABUUWsE19HT+q9LM8ZXe6hycAJX8=;
 b=OIs5Wg/kYaGbqqWPtlRRJ/E9rq/UAseWqO+Rjl8sOFBwKmbQ7EUSJj7b
 ua0mtUFUqMngt/9jkf1g45+quZ1VXRsADwL61wZVP/bpMjWD4zXxe22ts
 yYsjPvdfZrW5ymgNSj5wqlOwV9U5Es9n9jvLTzA06ghq1CHUACP6l/e5m
 VqWH5Jf1EA9zW0vgJLfEBD28CyU43ii7B0CVxdDaNaOXywkZJ90hPfpQw
 weHt61+HvEEntnLQzKvBJ/Nsbske6wT5p+V1Rst9oGGgiJZjPtVqxCMsz
 6dS0t7cj6hr/sCElTRXnnlgHhIuSF12B2AELqoJVP3/sP4d1hmg3qUIf6 Q==;
X-CSE-ConnectionGUID: wRqiNN6rQmuWM6H55gcutQ==
X-CSE-MsgGUID: dieabAR8Ri+0/SRkKgcFKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="77524772"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="77524772"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 21:55:02 -0800
X-CSE-ConnectionGUID: nxQXso/nRLW7QRqGLLDhcw==
X-CSE-MsgGUID: 691tuM2jTdKpwgI02YZGYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="222726641"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 21:55:03 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 21:55:02 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 21:55:02 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.57) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 21:55:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMq4fOndX8sM4Htr9kE/JR9elUo/wHk+t1bmYwwpu/6rfNqXiVi+K7a+iMiovqSgp0jAH2zbza2CfVrVU5HEY4/Ragg1mbDOSoiybdc/VEHqsmpla+1qqzBWXiDHeLUZ1QaixxN++GlWDkFjJ1Bh74v9OqKO8tA1TgdN9boP6WADDLh9FbMrwR473uLeVF2Fp24JADX3E8BDEEmlPaigz1I7Lsxz92OBymhStBbhPzRZFemaE4LY0OjQ7LRRqA82XDSsk4GyEO5oNZQbw7H7ADaYZNoMGycdhETQi5tHoY0XISfEo16xLz0MbNx9BpNwjYllBguXaHmUvdbTR8ccZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/554C/TDIU0lEVABUUWsE19HT+q9LM8ZXe6hycAJX8=;
 b=hj+lKv4QuxUGrFThdM3aS7GCDG0jjtRa+ytQ5sPk1sVqTXPmiHdn961RMFV3jORNtVFzyvvj0KwKMGv7FcNm46qzjIISimZno232MucihjjS9IOj3yJ5pZ3IpXiWMz2UdaLwCvdy2CUDQMPvB7m6SZS9/edgf210GR73QpWR0iuBn+zhfi2KFCeqi39A2CWagk0ePr0L43saSPx8J5Va/glxsYUQvys3/nc2dljwKUT5630kymn4kWv1ljlvCG+6ys2xbuNKl0Wo7lGSWNoxhM42ESmKRtTYcr0mwh4JYK9MZ4XwEuKO/258foXBZ+v8bfWwG5kWXw5KOR1thG13yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 DS0PR11MB7804.namprd11.prod.outlook.com (2603:10b6:8:f3::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Wed, 4 Mar 2026 05:54:55 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 05:54:55 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dev@lankhorst.se" <dev@lankhorst.se>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, lkp
 <lkp@intel.com>
Subject: Re: drm/ttm/tests: Fix build failure on PREEMPT_RT
Thread-Topic: drm/ttm/tests: Fix build failure on PREEMPT_RT
Thread-Index: AQHcq5ttVtB+GsmSqkaYt1c0H2QnDQ==
Date: Wed, 4 Mar 2026 05:54:55 +0000
Message-ID: <d5a0a62bd8de9ce035efa1edf95c8332da0ec6ea.camel@intel.com>
References: <20260226151228.256003-1-dev@lankhorst.se>
In-Reply-To: <20260226151228.256003-1-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|DS0PR11MB7804:EE_
x-ms-office365-filtering-correlation-id: 45ae29fa-5325-4bc4-5456-08de79b28f8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: N8tGHphHLC9h9Q9ihzvfVaUDjiUai19KggKNgeHapyU3F4EFxTmniaGewzSrSAUWmxVb+Af19SvSwWZE6Xtafd8cBaXGIM+rsFnO0mOwO4UNgQEEU3+kglV2JOrnBy+1Ybfl7SCGJI8YJMZ53uYl5o7vppXhK8fohkOFTMh7WC22BXPkls3d7wi4nTr43WPkT8fY+1/yk04kCZ/W7tB8KTPPuC6D1KDUVUZXRvCamoJ+ifRVCYBiXhZI64up7CNdBXABe4dzt0v8f2Sv2WVUa/IEgAW6i1Vqdr+GHh7ut3yD2UIiim4H4M26nbUWC9oCQEXEozbs0OMAq91gtf4+I7W3OndIeBbZEWKNRkTxvA+J4ZcazZeZfbDFdDDwBSNauvDd8a9SLga93W/D9X5aOmz5SOd5ndCU7qHG2JpTKwgesOxU08sczaa8qAfumyFs3/bk/KV3CjQQ6Pcpfwp51679NRIQicYi43stZdp3pihpm6beD3XXgTBQKpZCj6asQpHzsbZeN8/LPBIaq1x5Ce+KOPItpWz2KmDoFCi4Zxc4nTj6hLoBP+JG2X5+K4K0Z3taQcmNboo/DtM0lORExZu2u3I5VHsfLrZf9shQvc3MpqtM6pG94eKsP3Tu8eZEs/PeTF9a9Otiuy+WyzytwJL4AQEvMlc89SjwKOKEVA4StRL5fMaic+4Lwx6Jl+Ul6iqaq5nDDWm4W0PxaPap1DX4rV5a0iyvZNOAF1WIYeVHfXRKMOkTqywTESza4m851sOh9Uctk5o7EsV1SCeOyFmJUrjyYT0LmHjxOGg1Hd8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1h6c2V4cW5YWGJpcWJLRldSZlNhYVBxVWhkbTZnVm4rcmpMUmpOUE5oc2ZT?=
 =?utf-8?B?dXVBci9iOEowb2tTZzY1a0VmK2hvUkkvelBSa0xNcjB4QmJLZEJXam94MExZ?=
 =?utf-8?B?UXVqc1lqZk92QWNTZlowKy9RQVprTDNMcUNzSC8wNXNZZjR3S2VtN3hGRzlU?=
 =?utf-8?B?YzZUNE9EUGtRTGphYXpORjZud2E1a3U2bGVYVDI1YnpoeVZERDdKMFJoQ0pk?=
 =?utf-8?B?Y2NGeW9ISFBiR2NGWnhTdEYxWm16amRKdDQrOXFMZno1aUR2VUNPdFJKWXZk?=
 =?utf-8?B?dmNubERUYXd1L0QyQWI2QVQ1TmdYVHVLZkM1dHhTMWl3L090NWVCdENyNXVJ?=
 =?utf-8?B?MVNFRFBobHRmSC9aUXZWU1JVczExeUhrRkJoNHNwMzR5bWhIMkhSTUJONko4?=
 =?utf-8?B?VXhtSjhqcWlzQytjd3pXZnNwVmk5ZXN5YWtNZiswOVpvaE1hc3hoUG5RR1RF?=
 =?utf-8?B?RCtHSms4dGphcmVDejVrYWJEdjhuK0JxU3NmUnNSNko4ZjJQOXdWYWxldjFJ?=
 =?utf-8?B?RWczTGpQSVQwRVEyOXFiODNwUjd2VkFlYUlvVldvUUFOMC9NakZaU2x6R3d6?=
 =?utf-8?B?ZS94ZVJ6MFIrekRlSnJiUU8vYVkrb1E2U0s4aG9ZYzJHdUFmNjJDVE01WnEw?=
 =?utf-8?B?dVFvcDlQQlRQMzlSdkpBT2RvaTNvMVlPc2tHbDM4b2pheUNjemUyNGFuWlU4?=
 =?utf-8?B?c1VTUmNmWVdZWVRaTzNFc2UwV2Iza00rYlFCbFFWOFBURXhuaS9lcmpOdlRu?=
 =?utf-8?B?RUVEYjc4dFgxRFJYNlRjWENPbjhuSjJRZUJLV21SV2NKbUlXYWZoWUdJbUM3?=
 =?utf-8?B?Y1hrbm85Y0NMenFoMEVydTN6VTVoajEycUlEV2JUd3l6V0M3OXk1Qlp2cTRr?=
 =?utf-8?B?N2drTTcvdUxvTFQrMW1kaU1RVEMvYnNEMXBhdVJnZkxaSEMxR1VqaVMvbmgr?=
 =?utf-8?B?V2pGU1pOWGRKYzIzR3FyRitBMGhvcmJQYW5haWhXbDhaejBPd2liZHM0aWgx?=
 =?utf-8?B?UGhLWjZZa1AzTjQrU3VsNEhPL2I3ZXR3QUE2WW9NSHJwNmVrRU5mU29HbW0z?=
 =?utf-8?B?UkFxdzd6aE1obTlGYkRFZC95a3JpUk9hNVNSNm5rajZzZUVHbFNydWdEdlUy?=
 =?utf-8?B?NGFYUnZvTzdYbGVHOVpEaloxN2puMmg4WXhKaFVSWGIxWHkzWEhrbGI0cG1I?=
 =?utf-8?B?RmtYcTFXQkEzd01OYmRpN0IwWjRHN1hqWlkyS2dZUk9DOCt0Q3NaMWdZTS9M?=
 =?utf-8?B?blJDUk1Vd3B6M0dhWGZOTDA3a1dGbEx4T25OdkZlTFREQ2hNeEsycEcva1hC?=
 =?utf-8?B?ak9HYjU1UFQ5Um9iOXREZTNYMzNXUjdYbURPTzk4UUF1MzFCVkNnVHFiOHRD?=
 =?utf-8?B?OENJUkE1QmQvSGYralhYWUlSdnE4b3FFRm1jZDdMY1NVcG4vMlY0aXZRZjVu?=
 =?utf-8?B?bGNBZ1NvdW5PcXU2bFd1M3g5UUxHWE80NTZ1amU0aEI1aDFsbnYxRGNDTUdF?=
 =?utf-8?B?N2lmK1d0UUlVeXhTYzU5dFFHUjdNdFpRQkwwaU80UklNaExDNjFqb0t0c0xW?=
 =?utf-8?B?YXByOWVEZzR6M28vNERJMFNhMzI0Z0pqYnkwRFVTb3Rtck8wL2gva3VPUnJS?=
 =?utf-8?B?cDVUWkQvamlHK2pjbjVIQUdXN05sNWttTWpDZkROVjBNU3M1YXhFV2x4U0FX?=
 =?utf-8?B?OVpsV2hCL2E4QlQ4MG83NVZBR05WYi9vbVJNSVpZbS91SEprNlJxcndGY0th?=
 =?utf-8?B?azQreUJaWjZZQ2ZGNWVYMk0vMi9zT3d2NXRaVkZ5ZGxzUTFVV01qK25UTk9N?=
 =?utf-8?B?NEhwWjRmbEtqazdOZmpxa3Frc01wQmNjc1lGZU9oWXFhUzdOa000QTRUQkxu?=
 =?utf-8?B?TWR5dStJSUxWTk9FUnBST3ZOUTFBT2h4M0Izc2JYdkc2T1o1VSt3OC83Y25M?=
 =?utf-8?B?OE4zUno4M04xdDlVaWhwM2R2ZDNGM2tRZm16eVUycmxHOU1mNnVRQ0F0M3Jh?=
 =?utf-8?B?NjFSYjdLb2txU25sTEtrVWViRGJ4S0cwMjlWcGhYYWk2R0pFRmNLNVJWNGh5?=
 =?utf-8?B?ZW0zeXhmR2xPeE1PN2hqMzUveFBrcElROGxpYStCUHEwVmEyemxTNllqVUMv?=
 =?utf-8?B?NkNJdWZiemlqQUFmYU0wM2VEU3hnSDYwWTNXS2hQU25va3A5UDdVK0RpcnFX?=
 =?utf-8?B?dWxsOVJiMEpCTjFMNVFjaFVTVk5ObnQwclVzVWJXVEU4Mng0clY5MVMwNDhp?=
 =?utf-8?B?eE5JQ1BPYXlUaWNYYmxCclp1MmdKcjRDNk1lVDNLRmtSNGM2WU9iaGJSRGF0?=
 =?utf-8?B?b0ZGQ2JTdG5DcEdFR3Q1VEhyemFINS9NbzVwRFVTQit4RG1RV2tFZEJqOUg1?=
 =?utf-8?Q?NKqkPy0pPvDsrn9vElhi+hwxc/aC5CNXaIDNV+iYgLyHk?=
x-ms-exchange-antispam-messagedata-1: MN1440kCY+7/E0OwLZhrzWqzDjeRPp+dxzg=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0B122D98D647247A871172CC633ACC9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ae29fa-5325-4bc4-5456-08de79b28f8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 05:54:55.2639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +X6vJLWZNtakdaWi0KDuc0fdvOEetO1zghxABh2AsuswLErdBKz98/DRWGLbb864QAwJugV/F+7QWbnVrti5cLNbYg7o9AnTVXSKvwHLMQg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7804
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
X-Rspamd-Queue-Id: AEBA51FAFDA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jouni.hogander@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

T24gVGh1LCAyMDI2LTAyLTI2IGF0IDE2OjEyICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gRml4IGEgY29tcGlsZSBlcnJvciBpbiB0aGUga3VuaXQgdGVzdHMgd2hlbiBDT05GSUdf
UFJFRU1QVF9SVCBpcw0KPiBlbmFibGVkLCBhbmQgdGhlIG5vcm1hbCBtdXRleCBpcyBjb252ZXJ0
ZWQgaW50byBhIHJ0bXV0ZXguDQo+IA0KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+DQo+IENsb3NlczoNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Ut
a2J1aWxkLWFsbC8yMDI2MDIyNjE1NDcuM2JNNnlWQVMtbGtwQGludGVsLmNvbS8NCj4gU2lnbmVk
LW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPGRldkBsYW5raG9yc3Quc2U+DQo+IC0tLQ0KPiDC
oGRyaXZlcnMvZ3B1L2RybS90dG0vdGVzdHMvdHRtX2JvX3Rlc3QuYyB8IDQgKystLQ0KPiDCoDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90ZXN0cy90dG1fYm9fdGVzdC5jDQo+IGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90ZXN0cy90dG1fYm9fdGVzdC5jDQo+IGluZGV4IGQ0NjhmODMyMjA3
MjAuLjJiYTVkZGYyYjFjOWUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdGVz
dHMvdHRtX2JvX3Rlc3QuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3Rlc3RzL3R0bV9i
b190ZXN0LmMNCj4gQEAgLTIyMiwxMyArMjIyLDEzIEBAIHN0YXRpYyB2b2lkIHR0bV9ib19yZXNl
cnZlX2ludGVycnVwdGVkKHN0cnVjdA0KPiBrdW5pdCAqdGVzdCkNCj4gwqAJCUtVTklUX0ZBSUwo
dGVzdCwgIkNvdWxkbid0IGNyZWF0ZSB0dG0gYm8gcmVzZXJ2ZQ0KPiB0YXNrXG4iKTsNCj4gwqAN
Cj4gwqAJLyogVGFrZSBhIGxvY2sgc28gdGhlIHRocmVhZGVkIHJlc2VydmUgaGFzIHRvIHdhaXQg
Ki8NCj4gLQltdXRleF9sb2NrKCZiby0+YmFzZS5yZXN2LT5sb2NrLmJhc2UpOw0KPiArCXd3X211
dGV4X2xvY2soJmJvLT5iYXNlLnJlc3YtPmxvY2ssIE5VTEwpOw0KDQpUaGVyZSBpcyB0aGlzIGNv
bW1lbnQgaW4gaW5jbHVkZS9saW51eC9kbWEtcmVzdi5oOmRtYV9yZXN2OmxvY2sgOg0KDQoqIFVw
ZGF0ZSBzaWRlIGxvY2suIERvbid0IHVzZSBkaXJlY3RseSwgaW5zdGVhZCB1c2UgdGhlIHdyYXBw
ZXINCiogZnVuY3Rpb25zIGxpa2UgZG1hX3Jlc3ZfbG9jaygpIGFuZCBkbWFfcmVzdl91bmxvY2so
KS4NCg0KQlIsDQpKb3VuaSBIw7ZnYW5kZXINCg0KPiDCoA0KPiDCoAl3YWtlX3VwX3Byb2Nlc3Mo
dGFzayk7DQo+IMKgCW1zbGVlcCgyMCk7DQo+IMKgCWVyciA9IGt0aHJlYWRfc3RvcCh0YXNrKTsN
Cj4gwqANCj4gLQltdXRleF91bmxvY2soJmJvLT5iYXNlLnJlc3YtPmxvY2suYmFzZSk7DQo+ICsJ
d3dfbXV0ZXhfdW5sb2NrKCZiby0+YmFzZS5yZXN2LT5sb2NrKTsNCj4gwqANCj4gwqAJS1VOSVRf
QVNTRVJUX0VRKHRlc3QsIGVyciwgLUVSRVNUQVJUU1lTKTsNCj4gwqB9DQoNCg==
