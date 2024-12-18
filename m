Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7559F5F6A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 08:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5662B10E4E1;
	Wed, 18 Dec 2024 07:38:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JeOCyBBr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3CCB10E427;
 Wed, 18 Dec 2024 07:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734507501; x=1766043501;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=byCrWQuvLsNIXq7olLGj1QpNRMnNyH8mkhKOPdEdFxc=;
 b=JeOCyBBr6P2DjVB8D/p7bPoIMN4IC0V5lyJek9YRpKy9XR1fVi1NRHTP
 nc3iEtx3igwKjYdcDVwJ7AFH0V4poq8YPbYJzRfdqeVHWVQuI4AtTEOSB
 ttpDVIF8fvVAOxe++O/AT0C7WvYvSBuIQ6sD4TJkU1T83MWu9790gjZpW
 bkGSQ7bG4ATmMc1UngpRG205px8NWQ/55NTKL+guDqXvzYPIxC5nTLt99
 TshTamubIzHNHVq7G5XJiKdnvLcHZ689OsAQd91cNmJRPwm5PCFOSnbYz
 UrFTLvSjFNiBOXGwqDXlqOBMCkJGdErtWPGLyIC95DDlyCkOBtW0l5+f2 w==;
X-CSE-ConnectionGUID: n5RUxBdjQO+8jy3HP8a3Kg==
X-CSE-MsgGUID: zYafI9IOQzePI5716sc0ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="37804703"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="37804703"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 23:38:20 -0800
X-CSE-ConnectionGUID: hQxeFFxrSZyI+vVfGfTl1g==
X-CSE-MsgGUID: gh990+GbTqeSmy+XrJSVgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98239441"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 23:38:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 23:38:19 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 23:38:19 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 23:38:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOvjcvnmiDpzKfbXa/FaqnWr5T+8zvfamvSAqR91/zifJyZu7AZekL0jD3xS4oh8mQnWynSmJaaw3kMd01xpGx+ypbYVbvW2eDHGPjpJjjQm7OOdXxyEMVDMwxuoIERPM4yt3leC5PpyrqHnbx6vDBb4UveaF0k/bWR+gV9kVgDyb4JuuLHd9sV5AzMUUo79sT6I4PAHg38bZ1d1L1Qam8IJQuWX0pZNr7KYJJI0c1GmaJzYyjXo7DRI4KWT6r9dQXuEuYCM4pDiKFk0Er1VgrTmPr2q1G+gKe8PI4tzmMKWgtMoZPmuRxAu6q1GSIa+XQMi96VSes/uQvK5cJXQTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byCrWQuvLsNIXq7olLGj1QpNRMnNyH8mkhKOPdEdFxc=;
 b=sIFeAQ402MHofuh0rrvDfJA6iHG3ObxBSmJ5Wxv8U0PNEFBp0LwoD5I43UAlunaOiex5kUvjQy29KO8ClnXHGqaAr1IKVt6kOiZl+4nciC5A/ha57bL6vPT3RwfoHmpKGCPGuAgNBX39E2CBP6Q9wmY9FfrMQbIwc9esnqTrZtSoV1iqlY7D8o1O5yR6qItphrgCtxtKGPp5uDY7g+yOCjOroDSU9QKE6813fJGDBFiQ2tKBi+BBQA7uaEWhnOb8MnoG6eNaoUy6roC9agNTvTl2tbfbWOMyhfXFYke6621R1l/9/V4VyQTXN9lbuLvgVjnw8iNCi4c2SfQaYtIv6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Wed, 18 Dec
 2024 07:38:17 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 07:38:17 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Miquel Raynal <miquel.raynal@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "Weil, Oren jer" <oren.jer.weil@intel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
Thread-Topic: [PATCH v3 06/10] mtd: intel-dg: wake card on operations
Thread-Index: AQHbOo1AUWIZth7q1kuLhA0cCsqn17LrNrOAgABrRYCAACSGoA==
Date: Wed, 18 Dec 2024 07:38:17 +0000
Message-ID: <CY5PR11MB63663382E44A258B0BAEF1BAED052@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20241119140112.790720-1-alexander.usyskin@intel.com>
 <20241119140112.790720-7-alexander.usyskin@intel.com>
 <Z2H_7Xry3R2fWpMZ@intel.com> <24725a85-47c2-49c3-b2ae-443279b2bd13@intel.com>
In-Reply-To: <24725a85-47c2-49c3-b2ae-443279b2bd13@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|MN6PR11MB8196:EE_
x-ms-office365-filtering-correlation-id: e201cc1f-7340-46e3-3fc1-08dd1f36f02f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?cmtFdDNOUHRpUUdlaHU0WXlGelc0akhDZTRLUkdnVy9ReFZSLzBlNklRSWVB?=
 =?utf-8?B?Q0VnNXZHc0RPRVFOWDlIMWtWRGY0aXpvN3k4ZjQzSXcxaUJoN3NEMG4wcU1p?=
 =?utf-8?B?bWVvSkVDWnRHSm5Xcko0VzR1Q1lEN3hXU1BiODlLMGpqbURtcm1qeUpqc3VD?=
 =?utf-8?B?aHV4YkpsZ3E0OUUrU2x0b1VYd1pmNExiWXI5YW40WXNFU1RqaHloakxsNk82?=
 =?utf-8?B?S2RrdVUvajdtYTR2bHUxWll0SnluSUpTR2lyUFhGZFRiNDJzanRKekFqRTli?=
 =?utf-8?B?SnJ5aVJrejZINVFqR01ZQ2phSXd3cnBEdzFBQ1g4QjRTUUtBMmZ2aithVS9U?=
 =?utf-8?B?YW1jdng5Sml0OGlZWUJsOCtDcXF4M0pYa2NEMFpzRWVKclR1K0pjZ1F3aXcv?=
 =?utf-8?B?RFNEYnpadDRsSWpBd1JQT21FN25OcnQySXhWdFR5d3hUVzZjbHhSdHlKRUVW?=
 =?utf-8?B?alorMFluNStIcFBwMXpRZjY4Zlh0N3Uyd2ZJWWsvcTVRaVBJR0ppVTVaOTgx?=
 =?utf-8?B?cHl6WmJuV2pzNElFdUxJSG8rQWZhNmkrd00vai9FSXdOZHNzMEg4RG1uYnFK?=
 =?utf-8?B?SEdhY3o3R2lFSHJlU08zN2F0Y2NUVmluSHR6cWpqSjdHT0xpa3ppNHhnL1pQ?=
 =?utf-8?B?QXhBNk5xeTh1eGVpZUFHU1JMYW53TG5aaWw0Z09tMHBTWjlRVXhQMXdBdnFS?=
 =?utf-8?B?L21UUUlnbjhtbTZ4ek9tOXpqRXppbUV4cGoyOUN0NFM0WUo4V1BMWTJ2SnNS?=
 =?utf-8?B?U1RsN1pKZTZLMzgzL3FUaElVeGlhdEFpeFZYK3QwRTNBV1FzTHh0RmpqeVdK?=
 =?utf-8?B?K09zZ2ZYMjBmQmNJYjNCaWNIZ2FkNTRQRzFmQ3dTSmwrRml2T3BZajM4Unl1?=
 =?utf-8?B?cjFyMm8yWmlrcVdiNlFyODdic3ZSVFplT215aHBncVBtdlV3cnQyU1VsZGdT?=
 =?utf-8?B?OHRzUmd3Y3luM3QrQld1YjRNNjhXNkJDYmlCWEFhTUdJMllnSHF6QktUVklP?=
 =?utf-8?B?SFpoRFBaazdyc3BqQ1RMaGMwaVVzMmtYL0tHSXJhOTg1UjBLSXRFMXNRRDEy?=
 =?utf-8?B?ZmxhVHhCYVVKN0FvRU9EOThsemdNcjQxNFFUODl4SEFIWEE0bDBDV1doZ2RU?=
 =?utf-8?B?aGpGaW1kM0ZhZjRBSXFrV2g3R08wRzNpRWwzcW8wWVA3YmRWRTBNdndsNmhm?=
 =?utf-8?B?Q0xZSmIrR3llK0hhMTRBajVCeUhnbENZT2J0enRyZnVDdkRLMjhmR29INWVr?=
 =?utf-8?B?ZXNJMWhHZGpyVDZSUXBrZEtycTVkQ2ZkN0dGamdEV1dxeCthcHNjZExlV09Y?=
 =?utf-8?B?ZWc2YVo4ZlZFZUk1cllCM29jZW5WSGpiY29uYmtDRTRCNFpZSW9qaDVvcWti?=
 =?utf-8?B?RzBhdjRTYm9LWG9XNnVPZGNIakl1ZFp1ekZ6VTJldWYvN0MvVUVlWHpOUk9Y?=
 =?utf-8?B?UW1IZTZsQXFvSkJSNGpDMCsvNHo5SjUyaUwzTldmTURMeEtGTmRheUl2TW1O?=
 =?utf-8?B?dFhDa1M0cDlaOTRmMUxxQTNXSjdoZ3p4YVNXRmIzdkpWMHFhZVI4UklwTWs3?=
 =?utf-8?B?OVRVdmRQSFphbi9ON2x4VlovYXVJSWpSRHQzazJmek9SRnRKaDZyMkJ5RHpk?=
 =?utf-8?B?MXo3cmYvcnViOU1vSk5jY0lvSU8vejJkc2RtY1AvQW5ZSDFiOFpobk4yVkdJ?=
 =?utf-8?B?Njc4K25xTG80Z0xFbjNaSGZ1WjMrOXJKNFQ5NXhPbnFFSW4zVFdWa1FKSDVq?=
 =?utf-8?B?ZklzSHEyOW5ZQnhFZVNNcmlkRkl2K3lvZXlnR2FNd1NSUXBWbFpIRzFnWDBa?=
 =?utf-8?B?cjhCSS82ZXNDN2sxa3lPSnBLT2lXNmVjOWR4NnFpZDd1TDlOWDVZTnZRVk5a?=
 =?utf-8?B?R2JDNjMzbENibGF2ZVJCNFgyZmU4YlYwYWdmNE9aVmw5eENoc2kveDR3SnhM?=
 =?utf-8?Q?jQ7p1ppxqQqodK3IOEFz5/dLG2Ws1jUO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmlmSFNsVVA5Z3A1K09naXZRSG1RejNmWU54OE02cFppV3N0bmwvaXBHcUt3?=
 =?utf-8?B?VDd6R0JuZTZFRkhHS1NVdEFwU2praGtPQ2t3aDRZVVJnWjNmbkU5aHhQekxk?=
 =?utf-8?B?MW5iVi9wYzVsSndFMzZLemcrMHZRa1Z4UU9wdENJa0c5OUpBRGVmVTMwcG5Q?=
 =?utf-8?B?SjZwNng4T0twaUdSdDdPL0p4L3JpbGFFdFNaNWd4cXpGYXA1bnJVcDRoL2VC?=
 =?utf-8?B?ckdFcFNNbi9NTExaR2JYaUZ3N3M1bnhnU3RkMEN0anhpMWM0b09BdUVUOWRU?=
 =?utf-8?B?cERlbHMrWVZ0ZEhvKzlwaUxHa3NlYjVDMi9zNDNnbk5nclkraFFxcHhnbjJR?=
 =?utf-8?B?M0dtL0N6V0xBSUpBWHBmWVFldDdWQk50NDIzb1NvOHJXRXRjUFBCVnhjd2lL?=
 =?utf-8?B?UmlPNDdMMlpTeHFDNDJ4MU9YdFZrMElCc0Q1dWFJUnNtYXdOaUVNazR1Zzc5?=
 =?utf-8?B?SGswRzkyYXFmZEVMWEwyR0tDSjdrdkVHUXNnY0JiRVN1ZTkwTTF4K09MaVhw?=
 =?utf-8?B?OXUrYXRqaThldEdpdUZES0JReFJBc2s4eS9JTVVPdmdPWVV2SnlvMVlyU0lp?=
 =?utf-8?B?NkdTL1Q1cG81d1E0RWJCQkQyM0lFVm91Nlh5c0NHWWQxcG5ocGVHVHh5azBK?=
 =?utf-8?B?UHAzdERUa2orT1d5aFdVU1JKSkFFb0xWRUlNZGJNbWVPaFhMYlkzYXpCU08v?=
 =?utf-8?B?d3FlNDdMM0JvL0h0Mm11NXdPcHVMekc4UEtFZXdaWVFxZU9oeUxtTnhYSTdX?=
 =?utf-8?B?ci84Rm9YRE9VQU90d1JiUEZPbmh1cXEyZk1jTVhrdkluVEhhcjFYTmNEN0tU?=
 =?utf-8?B?V0JuVkJiaW1vWExsa29CTUF1eUUzbDdEL2JaL3FaYUk2N01YdWorYUpVWFpN?=
 =?utf-8?B?bWQ3ZHYxeFdIdGlrR2U2VnAzSkpuN1M0MHRPTWZCd0FtMFNqY3h2Vkd0RW5i?=
 =?utf-8?B?WE1UUkR2NVZhclVBRjJacGJua3NMZk1wc3Vtb21VdTRtT3NhaCtoMmVsSDBU?=
 =?utf-8?B?TUlPcng5MEYrYSt6cnVzSUh6cjd4bUhhZjVCR3gxbkNKMXVkZ0Vib0NVSDVM?=
 =?utf-8?B?bG8yNzVkbFBueEw0VnMvSnJtRC85dDZzbDc5UEZqQXVCN003SkoyT25BbFYw?=
 =?utf-8?B?NjZUY2NmNFVFZS8rK0JYOE1mMDB2amM2bXV0bTBGSjlpdnZ2TVAxN0Uwb1o4?=
 =?utf-8?B?WTBaUkxHQzBGVWJzOVBra1BBMHFFSE5lSEYyS0JkMlQ1STRXS2sydE11cHlH?=
 =?utf-8?B?Q0NhVm4yeGlma1R6ZGV5dUVhM1A4QXlxM0EvNkQvcVNDMEdmTWovNkoxQVlO?=
 =?utf-8?B?T3Nsd21seDhseFF0RDhoUGMrK3pGZVBJb3hpWkJxUHJOVFBoSEtXYmRhQWFz?=
 =?utf-8?B?SkFWN09TdmdPbVVmYmE1M2FXRVRtRjI0VjUwM1I3Y1hEY0pLbUZzVVNzWGti?=
 =?utf-8?B?eGU1UDNWdkN1THBWdWtlc0o2US9hQWFVOTYxdjQ1YUJBVGhYaWhCTFdDeXoy?=
 =?utf-8?B?QTFyRG9NVnNkWU9FeElHVmVWZU9ISHkxTkhnWVVjWEJFbzdvNUswMXh2VzFa?=
 =?utf-8?B?YXI5MWRETWRoejh2Z2dGL2hvWnhhdmpqM2FMR2xRWkhhazZ6OEtpaTl1Ymlr?=
 =?utf-8?B?Qm9uTG1LZFlaeXJTb2FEbkR1dWpabkt4N0tCTlVKVlRSWEZ1Q0ZoeldtZG50?=
 =?utf-8?B?NWJrYzh3aWgwbjRLaDl1cnNzN2ZOYS9JOEhubUYrN1hpMHFNdWxiRGNONyts?=
 =?utf-8?B?cTZYYVYybVU5VVJBaDdyVG50eU5BWmJGaVBTR1NyV1ZPcjJlMUdCQ1RFZDZs?=
 =?utf-8?B?Q21vdDY3WEtmVWlkMEhXdW1PMjdxbE5IRzd5bVJvS1cxS2puekpXQVF5c0Jr?=
 =?utf-8?B?N3o1LzF1RWljMnVydjhWRXJXVFdZeE9WR2NvOUlkVzlHbmRDV25QTXNKSEsy?=
 =?utf-8?B?TDZZQ1ZEdm96ZDdOOWxQbHVZQzJ4SjQxZUJrOE1SMExqd3ozdlFWOGlnQ1N0?=
 =?utf-8?B?bm02L1A4dG5ObWZxRFVYYllla29Sb1FvVkZGVnFUSnZiUWtsK01JRGV2bFBQ?=
 =?utf-8?B?WEpaRUlMZXFXSlorcSt5T3hOc1F2QUhHVnJMMDJxeUYxOVU5SXNONkRFWEEv?=
 =?utf-8?Q?0Qz6olxq83TK3TGrmF0on8m8J?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e201cc1f-7340-46e3-3fc1-08dd1f36f02f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 07:38:17.4551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9AYVttESDonCSDtHvV2UaIzOwnYUoJTVjJAcB3eMxbqMf9Tp0wyg7H8STzJHraoITjQ3MeMqGCv1a2ts3wXajhGjLIOSTuWTxGVdmdxNkjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
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

PiA+PiBAQCAtNDc0LDIwICs0NzgsMjggQEAgc3RhdGljIGludCBpbnRlbF9kZ19tdGRfZXJhc2Uo
c3RydWN0IG10ZF9pbmZvDQo+ICptdGQsIHN0cnVjdCBlcmFzZV9pbmZvICppbmZvKQ0KPiA+PiAg
IAl0b3RhbF9sZW4gPSBpbmZvLT5sZW47DQo+ID4+ICAgCWFkZHIgPSBpbmZvLT5hZGRyOw0KPiA+
Pg0KPiA+PiArCXJldCA9IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQobXRkLT5kZXYucGFyZW50
KTsNCj4gPiBvbiB0aGlzLCBJIHJlYWxseSBkb24ndCBiZWxpZXZlIHRoaXMgaXMgcmlnaHQgYW5k
IHdlIHNob3VsZCB1c2UNCj4gPiB0aGUgcGFyZW50IGNoaWxkIHJlbGF0aW9uIHNoaXAgaW4gb3Vy
IGZhdm9yIGFuZCBvbmx5IGhhdmUgdGhlIG10ZA0KPiA+IGRldmljZSB0byBoYW5kbGUgdGhlaXIg
b3duIHJ1bnRpbWUgcG0uLi4NCj4gSSBjb25jdXIgd2l0aCBSb2RyaWdvLiBJZiB0aGUgcGFyZW50
LWNoaWxkIHJlbGF0aW9uc2hpcCBpcyBwcmVzZXJ2ZWQsDQo+IHRoZSBwYXJlbnQgd2lsbCByZXN1
bWUgYmVmb3JlIHRoZSBjaGlsZCwgZWxpbWluYXRpbmcgdGhlIG5lZWQgdG8NCj4gZXhwbGljaXRs
eSB3YWtlIHRoZSBwYXJlbnQuDQo+IFBsZWFzZSByZWZlciB0byBodHRwczovL2RvY3Mua2VybmVs
Lm9yZy9kcml2ZXItYXBpL3BtL2RldmljZXMuaHRtbA0KPiANCj4gVGhlIG9yZGVyaW5nIG9mIHRo
ZSBkZXZpY2UgaGllcmFyY2h5IGlzIGRlZmluZWQgYnkgdGhlIG9yZGVyIGluIHdoaWNoDQo+IGRl
dmljZXMgZ2V0IHJlZ2lzdGVyZWQ6DQo+ICJhIGNoaWxkIGNhbiBuZXZlciBiZSByZWdpc3RlcmVk
LCBwcm9iZWQgb3INCj4gcmVzdW1lZCBiZWZvcmUgaXRzIHBhcmVudDsgIg0KPiBhbmQgY2Fu4oCZ
dCBiZSByZW1vdmVkIG9yIHN1c3BlbmRlZCBhZnRlciB0aGF0IHBhcmVudC4NCj4gPg0KDQpJZiBz
bywgSSBoYXZlIHRvIGFkZCBwYXRjaCBmb3IgbXRkIHN1YnN5c3RlbSB0byBhbHdheXMgaGF2ZSBk
ZXZpY2UgZm9yIG1hc3Rlcg0KaW5pdGlhbGl6ZWQgcmVnYXJkbGVzcyBvZiBrZXJuZWwgZmxhZy4N
Ck9ubHkgdG8gaW5pdGlhbGl6ZSBzdHJ1Y3QgZGV2aWNlLCBub3QgdG8gY3JlYXRlIGZ1bGwgbXRk
IG5vZGUuDQoNCk1pcXVlbCAtIGFyZSB5b3UgYWdyZWUgdG8gdGhpcz8NCg0KLSAtIA0KVGhhbmtz
LA0KU2FzaGENCg0KDQo=
