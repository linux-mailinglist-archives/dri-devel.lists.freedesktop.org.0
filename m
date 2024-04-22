Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BF28ACF25
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 16:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418DC112B4E;
	Mon, 22 Apr 2024 14:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dpmYiJdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BCEF10F619;
 Mon, 22 Apr 2024 14:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713795475; x=1745331475;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=30Q+O1BlhE3qWZSby7HFlpAKVZVO1iD7d56RpLG5wkE=;
 b=dpmYiJdX2bViyh503kUeGkR3505d8jUeLwd5b+w1v/YDx0VSfMOBMf9Y
 +bFVqdgDyYPVqunV2eHAodn15jbRwafg5k6uae5XsBTLo8HRtCyvqA0Mc
 3taPoSBvrltMj7cYLGkDTdv1vDvcZIA3w4ew3m0l5NZSVpQqpmKiKC/yv
 r+wYhd/v+QHffzNZazpS9lelpTcVZGN3lwRMDHPjpfi3wucJDSTWArapE
 cO037V/qZNMuge/D+LU0hnb/NE4kdZFSVK5iH+MrETsVcGN5TIXC9dp+Z
 DCrSk5ZbXK3l5mzr8Y6Up87ZXXxKKoYWDh7PMMxJKlTdhLl+ajeI+DGSX A==;
X-CSE-ConnectionGUID: IndK2ov2S+uEY8B5eaAoMg==
X-CSE-MsgGUID: NmjQusbOTa+G2rqS6+ohPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="13112618"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="13112618"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 07:09:38 -0700
X-CSE-ConnectionGUID: 5rnCN8GVT6eSq5o5YzmDdQ==
X-CSE-MsgGUID: whDKPad8QKC79HI+ioQ2ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="28846407"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 07:09:38 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 07:09:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 07:09:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 07:09:37 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 07:09:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMp2LWnIVsjY8/5+1VY9OVCRNX7Q1GWYRpvooADG5jxBji6VjcraRK3x51IKBsLNNUaVQOExbJDPImpszPzHmyogg8ZwEBr7LeCpHf+8PkuFCA0FFfWY0jis8XMq3GVfad/HqDx5+LGzYnxqQp+KfGIcdARwJuoRFSsOg0rwidUx3urerrVoA6vo/VyxRyZzOdZ/Mqs0iepRwH9xKKGX724vn5+RTaCukGsSZksDwyLVbVCfdJuA7MtdplWo31/Cnsk9KUQxSCue0y8HVAtKPs3eiL2PC2i3fuvbTpFNKX1HBdsYZywlbNboZkuRXKsWByWYk2S/JERcQH7tF4FpPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30Q+O1BlhE3qWZSby7HFlpAKVZVO1iD7d56RpLG5wkE=;
 b=GfukjopFNO59JetdphEi/yZclJPIM64rMB4k3jXRxZrAARCPehqqPr1i2Mg7aXL07TSpyonyIy8zGzeqKexO3HlZ5jSllXAuPs6RhWqlwZ1DbN8rFNkNxObtQgDHomU71Z+N2DJ/siyiow+v9HqZcul9onEr/64gxLQpKUsVt4xxktbP2/NeCuh+DFMILwWy9mqD2bRHWJQw0ZGjGq1SRykAwH0XkiZqsMzNTxcePHKNVci9lH0pSfdU8BZyp8CPWzotDiHaIECeVQPx+OgBI7nsw4TvjUJWVZcGiDYRxqTrIR+wBFBeyVGkH/qA0qECO1VmaZjL+2OtbB2SfBqvwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB7661.namprd11.prod.outlook.com (2603:10b6:510:27b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Mon, 22 Apr
 2024 14:09:31 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 14:09:31 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>, "javierm@redhat.com"
 <javierm@redhat.com>, "airlied@gmail.com" <airlied@gmail.com>, "Deak, Imre"
 <imre.deak@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v8 1/6] drm/client: Export drm_client_dev_unregister()
Thread-Topic: [PATCH v8 1/6] drm/client: Export drm_client_dev_unregister()
Thread-Index: AQHailVtCHBh7mHybEmOJEgGg2cdCrF0aLcA
Date: Mon, 22 Apr 2024 14:09:31 +0000
Message-ID: <54e5a80d3a1e91f98f74a850e9a47f0c05335885.camel@intel.com>
References: <20240409081029.17843-1-tzimmermann@suse.de>
 <20240409081029.17843-2-tzimmermann@suse.de>
In-Reply-To: <20240409081029.17843-2-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB7661:EE_
x-ms-office365-filtering-correlation-id: bd820a53-f6f8-4457-02c5-08dc62d5d4b8
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|7416005|1800799015|376005|38070700009|921011; 
x-microsoft-antispam-message-info: =?utf-8?B?TEtUS1Q5SFNvbUgxOHo1WTBLcDNhM3FpaWFyT01oZ3BTSlRncVhsMzdHQ2hT?=
 =?utf-8?B?Q1FXcDdybFJRWDY4YXhHMWNkbFM4Y3dLZ3BOUTJBd1dQZUhJckNDUmgrQmhs?=
 =?utf-8?B?VGhQTk5oZmtXMHFLckNSVmFLSzgvTm14K0xxbmdBcGVWRzdhdzhOT2Z3aGZy?=
 =?utf-8?B?N3ZlZzhvVHhPZXJOUit1UElyVjVFY2MzK3g0Q3YxdEUyVDFSRXNvOGxGU3dC?=
 =?utf-8?B?ZUxYNDhyVUxFOE9PeURMT3RadURRMGFCd2E1Vi9ROXBnNWtNZ2J5USszcjd1?=
 =?utf-8?B?OWpPTURzcU9FM1VkWjU3YjkyRlJOZ0szVkw4clRwRThCc2I0OGVmVSs3Szgw?=
 =?utf-8?B?ZlNqdnlya0VJemZWVzNQL2dRS1lKMEJiVERWMndtY1EvSTdiNmhVVE4xWCsv?=
 =?utf-8?B?Tm9iaWR6YkljRTFpd1IvWlpHaHFKMkxJbENja2JTNkVHUDRWVEhNUm9EQnNR?=
 =?utf-8?B?ZXZmbU4wNU1GTm5ON0hSSGRPbDd4L2lVYnpWUllPVk1xYjNaaER6S3o2SGow?=
 =?utf-8?B?VEVVdm9XbG5vSW05NEhGS3JxU0o2OXI2djVOVjhEeFR2aHdBdStXMHBjYWty?=
 =?utf-8?B?WGxsSG5ZOHRUc3dVY0ZxaG1OVmI3bEFpNnB4bWJVM2lMOTNLYi9vWTB6b0pQ?=
 =?utf-8?B?ZU5ObmJvQ3puSGI5U2lVcnBQaG1sYXRnMVZTbzJQNTZOK3UzZFVQbks5TTVV?=
 =?utf-8?B?VVllVTF5YnBNTHphUUtML2RtUGhEa2tsQ1VzdnZrWWxmb1RUSnZSUldGT0s3?=
 =?utf-8?B?VjFrRTNMekttUTVpZGV4d0owMGw5S1FrRUh3QVpUMi85czB4cWsvZGh3UWJv?=
 =?utf-8?B?SUFPTjEzK3FjREFhb3pCayt6dldIdWFWUTRaTlRQbVk1ZEkyanNCcXpoalk3?=
 =?utf-8?B?M1dTWHFPVnh5Z2VsSUY4U1JzdnhSN3BJMWt5VHpyVmJKV25EbnQ4OStXbkw1?=
 =?utf-8?B?V0xlSDFDWTVpVzVkbGtYS0laMmRyYjQrNHZEeUtMTHVLeFFjWkpXeEZNaE5P?=
 =?utf-8?B?Z3FudHFkUERmL0pGVmVDaUNESkhTQXJZdXNTSjlFT3p0bXMxb2RkS0JVbEdz?=
 =?utf-8?B?K1UzckRvaTlUYTVsVmRZaHBaU1RudnJ2d1gzY25OZmJjYUNmdjh4U0tDK0No?=
 =?utf-8?B?OWhXNDBQS25GTHErbnRxNlQwdkQvdSs2MnB0T1JzSzgrM3FNY0dQV3VtQXhr?=
 =?utf-8?B?NW9FVERJMnd5M2w0am5zLzB3QURvTEtQV3dHT05MUzBZZmFQLzZDUFllQi9i?=
 =?utf-8?B?V2VnMUx0UUYzakl6Vk9kZWwwem1TQk5jWW9Qd1JXejk2SjZlb2ZIZnJGdEJV?=
 =?utf-8?B?MCtrWEtKa2RWSm5lcWJsNWlOVk1FRDBPNlY1cUVkZXR5TUp1dXIvQmJhK0NG?=
 =?utf-8?B?WUUrNGkrem9JVm5NcHdXeDB0Y3NFM0xCeThlbDU5S1hmK3FISjdhSEJNMElh?=
 =?utf-8?B?RVcwTmJNdEdtMVVmZmEwZTM5dW9tdjM2TEprUGdFWFhYRUpyWXIyS1NEWDhW?=
 =?utf-8?B?dG5FVHJQaGdnd0FSVUhqWFdCMC8yeTBzTkRJbmFoOWV6RUs0Z1FUWFZlRG9R?=
 =?utf-8?B?N1VBWktvYTVWWU9XNUdxWXhBS284V2pxVGlKajRleW1ZVFd2OGhKUU51TmRx?=
 =?utf-8?B?TExMRWdjOEdnQ0dDQzlwdXlrY1dNTkdoc1M2djZxSWk0Wng5NXZITU9HMXRQ?=
 =?utf-8?B?dEZOYVkwQ1FwZHhtSWNwZ1BSSEJKTi8zc3c3WG0rN0RRTlBqdDlmUUlPNlJm?=
 =?utf-8?B?L2pIUWR1R1dhbFpqcHpraXFmQzUrSU01SnRpaWlZK1pPVHl6VnpReUp2WmZy?=
 =?utf-8?Q?T7Ks3OcGPOdujhXyucIQSDzJipyPx0LcJAY08=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(376005)(38070700009)(921011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUNIbVl3OTc4MXZ2dURiY0RZVlM1a2ZMMFlISlpaUW16eHUzTWxoNGpudHJZ?=
 =?utf-8?B?MUJTUkQ1N3l6cGU5T2QyMnZlUTdPSVZrRzZaQXNvWFZoWmhoQWppbFRaNDQ3?=
 =?utf-8?B?RlFtanZMZXZDT0dZc3F5Y2x5QjlrVWVUYXluZWpONEVRMGZ4dVQvcUpOR2Er?=
 =?utf-8?B?cU5rWGEzSjRqSm95dzg4ZUpEVHFMZG02UGp2bllFTVF4SWI4OGtTYUlFSDlM?=
 =?utf-8?B?S1UzYTNZNC92U1oyQUVTcWw4cUljcE1uQU5OeGFhRWNPVHNMS0VOdW4xUzJa?=
 =?utf-8?B?a2dQUkZaTHFIeE4zcUpEMUFldzVNUmNWSnV6QmRqbmxFckZhdlB4dUk2K09r?=
 =?utf-8?B?eVRueFNhcmlaVzliUW9MUDJ1bkZnNUpEc2FNSWxjaVA5bWdNT1puaFg1ZzdP?=
 =?utf-8?B?OHFiMU4xcTQzMnllQXpabkJrcVRIbm5iUGtHVGYvZEhLZ2RMbTR5U0Rtd2tx?=
 =?utf-8?B?dFhGb0RTVGo4dFIyeDdGZUo2RVFEY2Y3OFlIRitDckFxWUdOT2hqZnliQnMx?=
 =?utf-8?B?Umg5SjhyYTU1WkJzQm9MY3hyVjlnVUxvSXVUNkR6dEUyRUxHWllRTkFremFZ?=
 =?utf-8?B?Qkd2SW5LSUpMemlDaVVQL1RUN1BPUUNGeDl0VnpqNmZPTzJPR2J2NlFIWjBN?=
 =?utf-8?B?MTZsNUZSNUtvQUx2cFVaRzZHbkdWdE9SWkErSjl0YS9YcFZKZmtWWGN0Ry9s?=
 =?utf-8?B?NElic2xTVGMrTnFvRzE0aFNBL3FnNHZqanJoTGtmTk41dTNGTkNMV1ZJcEs4?=
 =?utf-8?B?aDYyckNoWGlpZllRYTBMYzg1Y1YyMEFmREtWbDN2UEpTcDM2cXEvdlRNYlRC?=
 =?utf-8?B?dWJvaU1QS0Y5UEZxTjAyY2swalBrT1RieCtDV2lENzBDSVlON0xzZG5ZeWJu?=
 =?utf-8?B?SVcxSTNZQmFuZlJHbGNETHZ4YkZYdmpzbXV3b2lUWFhpTXJlak1EWDU5SU9m?=
 =?utf-8?B?UDcxZGY1UmVqaU9hVkdBTmhYYXRRcDk1b3RqT2pPQzlmdjV2N2RvUGE3MWYx?=
 =?utf-8?B?ZWdvcG54SjlWQ0VYL3lwNE5iUDlDdlhpUlREUGwxUmFWOXdQWUtCOHdHVDNB?=
 =?utf-8?B?cFFudEk0b1QzVEJUay9Ld1dONFNKazh2ZFhtMEtsZ0pkQ0s3cUxZUjdaOFVT?=
 =?utf-8?B?NnkrY0kyUnNxSVhwNHh6bWJ6ZnpEZ0JnZnk3ZVYvWStCRTkveEI3UGNhNEpv?=
 =?utf-8?B?TmpUakZESGJWcEtiT29QOFUwWTBzazZjVzllRzVhVTRxY1lJZVN6UlduNHJN?=
 =?utf-8?B?NFdkdm5lS3hFblpBenFnNFpCNjlub1Rmanh2cmRETDlRTVZFSW5JSXlMaWxo?=
 =?utf-8?B?NllYWkc5TitLWkJQTmZIbHdjR2svZHNuRW8wenA2WklEMEUwUjhHWVk0cFJM?=
 =?utf-8?B?VWJGbWtNNDBIaXpGWkdXOFE2K2FpU3FPY0dwbHRwNHVGLzkvZHVUbmRXbytr?=
 =?utf-8?B?b3hJMm9Rb3dRekJIMlRYMWd0YWFJbGlwSVNFKzBTbkFKTlV3VjJVY0xFNVFW?=
 =?utf-8?B?eHp5RmI3NEI3L3dDdmhqMTFIamlIRWRCNXR4b1Z5RmVmOVY4LzJpYWx5NGgy?=
 =?utf-8?B?bktEUTVmeXZpS1Y5Vm9telFRYWZ3MlQyRDRna1ZoWlc0Y1FHRW9RNUhBdE9w?=
 =?utf-8?B?bmRBTXpQQnJGNmtIc1NJZjJDRFY2c1M1eDdKbkdJSUQzSjdmZzM2UENRVmRa?=
 =?utf-8?B?OGVoTS9YV0UyVjdiaVRneHNST2t2R0w2V1J3SXJUbkF5cVE4Nk9SQWIrZ21J?=
 =?utf-8?B?b1ovQlFzTmp5eGIwQk9GZzFIVjNnZkRPbGZoSmpEeGFEdnQ2N094SUZiSGxu?=
 =?utf-8?B?UkFiL1lmcFN4OTFjZVN5Z1QwblJwUXMvYjJNTDNvTzN6OHBCNVRWMC9Hd0Fk?=
 =?utf-8?B?ZUt2aVlJOWppSmxNNVpqT1RmMHhOR1o3YmZ2M284LzExMEM4djRHdmRpYkNY?=
 =?utf-8?B?MHhab3I4bDFRVHNGYVpKSGNab1F4SURNaWNhODZJaGtyY0FucHgrN3VUbm03?=
 =?utf-8?B?UmpoKzdjM3ZOVE5IL0JoK1RkUnNsN205aHkreURqdFlpMk9icFVreGZqdEht?=
 =?utf-8?B?bUNzWSsvM1NHT2ZFdXhNdzNJWjZIb1hCK0dHOFZXQkhobFlFZnUxLzBiQmdB?=
 =?utf-8?B?d3BEVWcwcERZZVVBUjV2Vk1RTWZtblpRd0hQbGdsR3FNYkYxUmhrLytsWFEz?=
 =?utf-8?B?aHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <740B19171E381945BA30489B6A84EFE2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd820a53-f6f8-4457-02c5-08dc62d5d4b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2024 14:09:31.6028 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cjooy4CibbLpiht4Gt6f7WdngYTYkrT6wap+vZvzJHkY2Mew+rFpymjYtqBtLQUXR6W46Yg/7J83TrYEFMh9QK7Q62xnuPUUkDAI8bpEiKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7661
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

T24gVHVlLCAyMDI0LTA0LTA5IGF0IDEwOjA0ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gRXhwb3J0IGRybV9jbGllbnRfZGV2X3VucmVnaXN0ZXIoKSBmb3IgdXNlIGJ5IHRoZSBp
OTE1IGRyaXZlci4gVGhlDQo+IGRyaXZlciBkb2VzIG5vdCB1c2UgZHJtX2Rldl91bnJlZ2lzdGVy
KCksIHNvIGl0IGhhcyB0byBjbGVhbiB1cCB0aGUNCj4gaW4ta2VybmVsIERSTSBjbGllbnRzIGJ5
IGl0c2VsZi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPg0KDQpSZXZpZXdlZC1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dh
bmRlckBpbnRlbC5jb20+DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQu
YyB8IDEzICsrKysrKysrKysrKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jDQo+IGluZGV4IDc3ZmUyMTdhZWFmMzYuLjI4MDNh
YzExMWJiZDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYw0KPiBAQCAtMTcyLDYgKzE3MiwxOCBA
QCB2b2lkIGRybV9jbGllbnRfcmVsZWFzZShzdHJ1Y3QgZHJtX2NsaWVudF9kZXYNCj4gKmNsaWVu
dCkNCj4gwqB9DQo+IMKgRVhQT1JUX1NZTUJPTChkcm1fY2xpZW50X3JlbGVhc2UpOw0KPiDCoA0K
PiArLyoqDQo+ICsgKiBkcm1fY2xpZW50X2Rldl91bnJlZ2lzdGVyIC0gVW5yZWdpc3RlciBjbGll
bnRzDQo+ICsgKiBAZGV2OiBEUk0gZGV2aWNlDQo+ICsgKg0KPiArICogVGhpcyBmdW5jdGlvbiBy
ZWxlYXNlcyBhbGwgY2xpZW50cyBieSBjYWxsaW5nIGVhY2ggY2xpZW50J3MNCj4gKyAqICZkcm1f
Y2xpZW50X2Z1bmNzLnVucmVnaXN0ZXIgY2FsbGJhY2suIFRoZSBjYWxsYmFjayBmdW5jdGlvbg0K
PiArICogaXMgcmVzcG9uc2liZSBmb3IgcmVsZWFzZWluZyBhbGwgcmVzb3VyY2VzIGluY2x1ZGlu
ZyB0aGUgY2xpZW50DQo+ICsgKiBpdHNlbGYuDQo+ICsgKg0KPiArICogVGhlIGhlbHBlciBkcm1f
ZGV2X3VucmVnaXN0ZXIoKSBjYWxscyB0aGlzIGZ1bmN0aW9uLiBEcml2ZXJzDQo+ICsgKiB0aGF0
IHVzZSBpdCBkb24ndCBuZWVkIHRvIGNhbGwgdGhpcyBmdW5jdGlvbiB0aGVtc2VsdmVzLg0KPiAr
ICovDQo+IMKgdm9pZCBkcm1fY2xpZW50X2Rldl91bnJlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYpDQo+IMKgew0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9jbGllbnRfZGV2ICpj
bGllbnQsICp0bXA7DQo+IEBAIC0xOTEsNiArMjAzLDcgQEAgdm9pZCBkcm1fY2xpZW50X2Rldl91
bnJlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYpDQo+IMKgwqDCoMKgwqDCoMKgwqB9
DQo+IMKgwqDCoMKgwqDCoMKgwqBtdXRleF91bmxvY2soJmRldi0+Y2xpZW50bGlzdF9tdXRleCk7
DQo+IMKgfQ0KPiArRVhQT1JUX1NZTUJPTChkcm1fY2xpZW50X2Rldl91bnJlZ2lzdGVyKTsNCj4g
wqANCj4gwqAvKioNCj4gwqAgKiBkcm1fY2xpZW50X2Rldl9ob3RwbHVnIC0gU2VuZCBob3RwbHVn
IGV2ZW50IHRvIGNsaWVudHMNCg0K
