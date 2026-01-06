Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D99CF7EE0
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50B510E4DA;
	Tue,  6 Jan 2026 11:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyBezPjg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B0410E3B5;
 Tue,  6 Jan 2026 11:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767697204; x=1799233204;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nuU+T0A0FOgnd+YznRCWoa9+TiuTPyqbsAuRVxboDLM=;
 b=QyBezPjgm29tVz0mqkO0w10tCKIOyh3XLIKFKPSh8gXweId9ur0mVSMe
 fLYvn7X7dQt/oqFrxjn10d498WOga0cUGPQbJLvK4XsiMoj6czT2SDveq
 Hq5pOnZeIrzDOXaI+f6MoqxV0ZwYIui9ZuPo4RB/rii71S6qKielUzsII
 tDuJExX+5p7akwInX3rwG/4+T6JhE4py55QBJdND9/XiMdPNDakWoUOnN
 QCwjkcO3tqnrk9syQk1y4v4lG/5pL7kOdYigLg1A+IKYeeD/xpsQsS1UT
 1m4lg3q8LM7togwYNEQPJlrxohuCp+MEKwwqPNPDfqcAjx5bLTNv+MmJn Q==;
X-CSE-ConnectionGUID: NS1LXq6aSUiDIfDGnH9knQ==
X-CSE-MsgGUID: 6f2GvqVVQauzhd2s3aySdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69041711"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69041711"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:00:01 -0800
X-CSE-ConnectionGUID: FUNcBlhOQF61OvOXzA0LsA==
X-CSE-MsgGUID: hKgQ974cT2KagdJSKD8zyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207101373"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 03:00:00 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:00:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 03:00:00 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 03:00:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aCKLyP5KFp3nkguP1I7V3IPR2d6PSO7wKDmvtFPVkxLYspZJEGwdKmQbSYdN0Oh9SHZwp23fzRbsBW2GhDSpEzjg8iU0FDk1wJzNnBNZhQcT5okmYqhpuUbFEAYLss8AJBds8OcQABiHxKJUiUm/p/XwtFUE97kaO0+XUCeMkpqnrtVcAy6EPpfJoroxU4PiL2zsID90d3B/04EBigvtlPPkEihXDYZqnHFBbeN30O5gN5RSG8kvqvHiVSnNmNB04tKt22VEdasVqpfJD7XsHaIwIhASgAUm0z8ycp98DLCnGaXBT9V/ohaFwkpc71RNxKsebfggysLglvTG8dkFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZyV1qR41CV9oBHCPxM8QR2uWd8Vzon6FWQpxKaA5Mw=;
 b=vnvkcHWhJln1VIFaJkNQFeXJoVonWalmXxZBtisJVAapruEeNstq4i4APdpEy8Ayg1mZJRBTKnL5WHH++1Vw3w+TzNQiedu14b4zNSx+b56LN+CSeeXV18ZoTJ94D779m7UTIPDim9s0d21JCqSTuqPSJ9aZPXipozjpFKVtrSbmIB8fBo0lI7N9uLm58fGIFQEsde+MB2M2K6Bwz0QXIkUSd7VUVWs3AW8pkiwJJS7Varkyoskvo+hYhFfXgAfCyTDSKJbkaKvJ0hRQgDv/D1yGocsfN+RL0OX4Rltk33zl7HBORMgM0uVzoFojeEwonZhIvbZp2l8mCsWUEw6oJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Tue, 6 Jan 2026 10:59:53 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 10:59:53 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 04/13] drm/i915/display: Fix color pipeline enum name leak
Thread-Topic: [PATCH 04/13] drm/i915/display: Fix color pipeline enum name leak
Thread-Index: AQHccLb3H11s9+X0RUehvhHs4wk+ULVFFYnQ
Date: Tue, 6 Jan 2026 10:59:53 +0000
Message-ID: <DM4PR11MB636088DF9B129A72EB6077BFF487A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-5-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-5-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DM6PR11MB4595:EE_
x-ms-office365-filtering-correlation-id: 36eb914f-e70f-4685-30f5-08de4d12b89f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?YcS4jsQqV1eU/uEhWLe2VQdv5HmW9q0VudSPQzzYc6vvTJpXRUQiN5EtdUFq?=
 =?us-ascii?Q?XWbywdFcI8I84SapRtJD3NNS5ju2DzfW0244KuKZw9n8e/CvwpUevMKQeVmr?=
 =?us-ascii?Q?pbOpXYJyNNGZMalcSxM28uBYlGZDZgiFwqjbySRIsQdppHcUZqe9JWFgqk5e?=
 =?us-ascii?Q?lbiW3W3R0URTgS/7qA3C6hbvpBmRDmFTsIccw3wlr4TAuhcdu3vBso98miLD?=
 =?us-ascii?Q?0XIbnf0N7V7+3PoI+9odut3SyOPbcvS78tbuLwCLxVD8bWWXVAXzxFdFQsyG?=
 =?us-ascii?Q?dHEbzXnPzU9hP+q306gEyAMnl5l1X7NvYuFYYDcxfDSoz3UZEtSfUzFRtliM?=
 =?us-ascii?Q?TnM33yp1BaGQr8Ky8+HbOJLJNvjvdvXpAJmNetbI+n6HtMWu9fSqoDtILNaZ?=
 =?us-ascii?Q?bAqapRWZVUvmbWXsniYqTMLP/REYpjOHuzhaSSt2YTX5zK12vbHFrvCgej8v?=
 =?us-ascii?Q?CTFQ+gY3wJZzEmLcB8KYG6zPdYZUGfAyl9yYABuHcDHiWqKJsdN0cRYDN8Kh?=
 =?us-ascii?Q?L3BUbN1jqhhAkcJzU7C98XT0fdYaBJp2wWYIwvPUMkmSCRsG25jBzJoPXO+P?=
 =?us-ascii?Q?uJ3KoERcolP0NZktb3a8pNxVyjCDM0NwgwZVezt2UsA0l4OjvoTT6doyP7EF?=
 =?us-ascii?Q?pXazh+pt3ZnYhlQgkO95igTBT+gxoF4YRq88G5mJl9FsybaQZ9FGbJaYSZkR?=
 =?us-ascii?Q?vN5CKjc1KERPZmha3zDnWctEO3oyNNo+V3tHizKoc6P2M1og9+MxQkM8CNUg?=
 =?us-ascii?Q?50Kx2I8GeVf77yY2EXXvYYK+hAzS6lPnUTmaIykt/6M05QHN7sgUmkusf+5o?=
 =?us-ascii?Q?z6RPeGDtaat4BPTsLJsmp1dHV7xgaXGDzzcfelaot987AS/SQzM5hcztwlFg?=
 =?us-ascii?Q?fbZx3JA7QAslvQCq38Oj2tSN3Q5oIbCTXCzhCBswWZ/Vom4wVqYzgmqP0Chv?=
 =?us-ascii?Q?oeo2Qc3MKwjPOBM42vqxN56t9qlIEYjkvk2BwfObKl65zKtHXRXQefpyQRPC?=
 =?us-ascii?Q?yfTvmQ3wT/R7scyvzCklhtXnsKF8OIVze+q8tPM+dZcYHekz7u5l4f+cvLeq?=
 =?us-ascii?Q?oytEe0HDnQhFlOCdxZ96TOz+JlSVlqsVyfIfgMbCL4WhXRiiPzUW0FtqFRpW?=
 =?us-ascii?Q?ppKY8xIP35fUaoHlFKisYi0vERlMGNaRwNHceEV8gyGgQdB4OmKgwlgMdbc8?=
 =?us-ascii?Q?DwTZR7ZNZsW7NWwXdKZoDSC6S+G7B/JCC6os4Hry0UhnwgOVUjXPmhdrN5ez?=
 =?us-ascii?Q?6SqKLzsoII7dmKBjfNWNQlsVTVwNvCsx6D++0vA+Y67bUyKHly5PFZASjKya?=
 =?us-ascii?Q?3+Fvb3feEASyaa1bsb2PZEb3NC9qu/0SG1k90Hsvl9+jSyjUSyHGY01AxoXW?=
 =?us-ascii?Q?B0Rplb/I75vHm7QrQt8QoNzDgdbWy22I6kuxnhrb9ZTEaiYuCScQgbCc5KN3?=
 =?us-ascii?Q?D/82QQvIIT3x4iXI7YR7NnNNwuStFqrff7EbT81fQ57jWjTEV7+h3LfvjKtn?=
 =?us-ascii?Q?AjbDTnfZ8j3MurPXWUDvjWHmGbl2FG0nV8Qh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7yijOtLJwVI9c+JwdND6KWipvlpvMPWj0/Py/QaOVySG7E32M7nCOkpJylK+?=
 =?us-ascii?Q?K0bS5S0+ujl/XVwbnoDZ85f6O7XCJHBJxkgpt9ktCAkCKLu5Q04/EklGnWjj?=
 =?us-ascii?Q?VpAMi1bDl+p9zcj/vLBl5wJCyKbxspGCJ1256O2QywbdT+Taji9AQXjoO+Ra?=
 =?us-ascii?Q?luCCz6UQRUpR1A5OhdUaIClExj2C+lI2CaSokXIevEwV2wTDAzmiI5pOjoUg?=
 =?us-ascii?Q?GUHkeX7uWL1TQSlW4PA4T795Zj8Bv9dviunEIE86NC/Nt8P3yEAUdGVartCm?=
 =?us-ascii?Q?2bEAvTWfUsfTe1xuE7fALrSH8Dc3prf4c19/ymgweoNVQGdiLO0N2v7NbH6N?=
 =?us-ascii?Q?Ir+xcB53CGaReSYYUM6TDzLqLuvWI7aWa68O0Ca0HRS0IalqBFuy7JhIHLCZ?=
 =?us-ascii?Q?IGKcg1t5kAog7jP878S/sKXGtLq3IGh1TQE/Nvvr0DwlsrnG4RhtbdySAC10?=
 =?us-ascii?Q?WCb8xZ2lYogTOmSo2EeE1TivdSPc/oe+waGde62HT97mMjC5yCc8sT1+f0lG?=
 =?us-ascii?Q?nfdNSEKVArhIrovmIC1BQjX3BM9OLyhUWK2zTiLnUO5d9AciYIjWhnBt7nHD?=
 =?us-ascii?Q?wr+qpDwv3BEe1iWNC3iX1hw+fvzWxyJJ5802i49gkSvMXXlNTVdPyvb1mvbU?=
 =?us-ascii?Q?v2KYyagk44RVpIk1f4/5fhU68nG/3j1wqNapekZVcoatym2NgnfDxDk8OIKo?=
 =?us-ascii?Q?XDh2osRdR2MKyV9J05ZnqYMSYI5pPFJhQhCBmlNFdgK55ArQMXR+9CsceNqx?=
 =?us-ascii?Q?TLgCn1FZ/wKsgbcdLXbxSNtG0aBWumcP2U3iGZR13XUepFK0hW+14mK+RhGG?=
 =?us-ascii?Q?4Xb5gb1yqGtcNerO1czgdYqwtc9n5kl0TsIzhD7k7zt3uDUbybWK00worS5b?=
 =?us-ascii?Q?3N/vM2YO/G1kE6irVX+iawaKD4r4CyNpWl0zs3+kmK1ZgsgffstOSRlJapxZ?=
 =?us-ascii?Q?/EV/nszLDQUlefTP2MJP/l9nOYdXqOKJtkpADkEh2hBHV9GR8SzNgn8elNw+?=
 =?us-ascii?Q?0Azsavxo+qT350Lwa/MKmCP8oTt3v3C0CpXXiAZhI7siPiWVy/7mhj0ctuhE?=
 =?us-ascii?Q?HrXZZAQzeFvWdqKh/LWjNKGkCsZvEG39M9z8BAgk6MuyspxqTyW7VNplZAxe?=
 =?us-ascii?Q?8B2yjRSJD62ULlx6LAfWBsd+W9BzaatoVhraJfV7W4kMqPHoyzXrQmzJSeti?=
 =?us-ascii?Q?SFX3Mu8TBh+hev/8d24wDAoxqyXPxfbbeQbhDl7gDzRZ7Ox7AbSojlVbH3Gz?=
 =?us-ascii?Q?0idlwi73lQIrCF4NXwb2jcv/q+lKQZr91XfLI3xYpC69AIkV7msmB4b8FB2Q?=
 =?us-ascii?Q?O0tKY+WTeuNh75cz9v9j8eeGbGKqhd8VOe6eJMPFs6H1F1kf+3pikKZBAXVK?=
 =?us-ascii?Q?d+HfrqBU4PMuznDcbwpS3FrVzduw/UJL8uc35wTHVEinbgJDSe3kONwuSx+/?=
 =?us-ascii?Q?QdRugvwJVlXt89HH44pULl46PSI4WqASB3ssztrA5yaKx575aKiv72+KUMuj?=
 =?us-ascii?Q?xTAaPdcPFtFdmJcgp58SRrFK5/mS/UCo7JQJp/Eruz2Aa+yunGoGM3bhUehY?=
 =?us-ascii?Q?MkUf05E4VBvTiIbxrgMpQYqjbjTlck20VizfRRVCYCGY4pTBGAXKhzUHudkB?=
 =?us-ascii?Q?lwcFeTE/b84HLD1uZkLLfHJykj3wc6Ja4hJjIFXUkfFSDgFh5CXgmz91wBTy?=
 =?us-ascii?Q?fI/DZWuCnmS2ZkA4F/8GyWanopWaINtCc7Dvuy+j4OpNajUsjiwxVYKFtnFU?=
 =?us-ascii?Q?SDWC3kmphg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36eb914f-e70f-4685-30f5-08de4d12b89f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 10:59:53.5248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dVZHrITrx23N5tQWtusVGBDcARdCfRbKM+vy2UAXP2yBuggiYA4/+i1TLbE/7PAwpRVycvrqPCI21mohSI0JCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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



> -----Original Message-----
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Friday, December 19, 2025 12:26 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: harry.wentland@amd.com; jani.nikula@linux.intel.com;
> louis.chauvet@bootlin.com; mwen@igalia.com; contact@emersion.fr;
> alex.hung@amd.com; daniels@collabora.com; Shankar, Uma
> <uma.shankar@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> nfraprado@collabora.com; ville.syrjala@linux.intel.com; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 04/13] drm/i915/display: Fix color pipeline enum name lea=
k
>=20
> intel_color_pipeline_plane_init() allocates enum names for color pipeline=
s, which
> are copied by drm_property_create_enum(). The temporary strings were not =
freed,
> resulting in a memory leak.
>=20
> Allocate enum names only after successful pipeline construction and free =
them on
> all exit paths.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Fixes: ef105316819d ("drm/i915/color: Create a transfer function color pi=
peline")
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  .../drm/i915/display/intel_color_pipeline.c    | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index 684641c8323b..04af552b3648 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -34,7 +34,6 @@ int _intel_color_pipeline_plane_init(struct drm_plane *=
plane,
> struct drm_prop_en
>  		return ret;
>=20
>  	list->type =3D colorop->base.base.id;
> -	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d", colorop-
> >base.base.id);
>=20
>  	/* TODO: handle failures and clean up */
>  	prev_op =3D &colorop->base;
> @@ -74,6 +73,8 @@ int _intel_color_pipeline_plane_init(struct drm_plane *=
plane,
> struct drm_prop_en
>=20
>  	drm_colorop_set_next_property(prev_op, &colorop->base);
>=20
> +	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d", list->type);
> +
>  	return 0;
>  }
>=20
> @@ -81,9 +82,10 @@ int intel_color_pipeline_plane_init(struct drm_plane *=
plane,
> enum pipe pipe)  {
>  	struct drm_device *dev =3D plane->dev;
>  	struct intel_display *display =3D to_intel_display(dev);
> -	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
> +	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES] =3D {};
>  	int len =3D 0;
> -	int ret;
> +	int ret =3D 0;
> +	int i;
>=20
>  	/* Currently expose pipeline only for HDR planes */
>  	if (!icl_is_hdr_plane(display, to_intel_plane(plane)->id)) @@ -92,8 +94=
,14
> @@ int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe=
 pipe)
>  	/* Add pipeline consisting of transfer functions */
>  	ret =3D _intel_color_pipeline_plane_init(plane, &pipelines[len], pipe);
>  	if (ret)
> -		return ret;
> +		goto out;
>  	len++;
>=20
> -	return drm_plane_create_color_pipeline_property(plane, pipelines, len);
> +	ret =3D drm_plane_create_color_pipeline_property(plane, pipelines, len)=
;
> +
> +	for (i =3D 0; i < len; i++)
> +		kfree(pipelines[i].name);
> +
> +out:
> +	return ret;
>  }
> --
> 2.25.1

