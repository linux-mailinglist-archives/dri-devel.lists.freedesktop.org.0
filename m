Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DEC97EAD6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 13:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48C810E20B;
	Mon, 23 Sep 2024 11:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNTHM4OX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C8410E0E1;
 Mon, 23 Sep 2024 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727091209; x=1758627209;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hAIWCd9QF683ANYmFzBzbXTb5o1jc8OedLK7S01EHs8=;
 b=VNTHM4OXTPbmlVb64ZrvjKwR6pZcIeR2XNbTqxNx1K9br2l4vVwBy7wA
 ph4wjqx9uUKKOPYLOy/gsqKhVtb7/yL0F26OIcTUQaIEFy8EjUDwB7tWn
 mLw9ibNoSK6Y46yruKQDt96P+MwlP3wTlEHGN3dxGDU+m3F215Aaim9DH
 t0XB9cgwdNhrn+g1LeqjEQ2sjbKyshu+dynunzNwcsmuFKT1m6JlcnGVI
 gifqxlcEKTkq5rVBi+CIAOrq/qjlaNIuOoE5h1qMch1h5caPI/7SehAhz
 P2Xl7MFVkzsHtteiq7Q583PFiMUUocn9ZJTgPMuuU9EKLWIb4hY8WWiJk Q==;
X-CSE-ConnectionGUID: V/gqDa5sTReBKrpWX35Qrg==
X-CSE-MsgGUID: Yg13jc6VS2yTpVX1ufvxHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="48559335"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="48559335"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 04:33:28 -0700
X-CSE-ConnectionGUID: BFbvOKbbS1ufktMuPgJ5aw==
X-CSE-MsgGUID: LkUGlk41QCiQk91KGye9Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="75417115"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 04:33:28 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 04:33:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 04:33:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 04:33:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnDYZKN4ge+Ddf7ZEY+tGnlXYewSjhiGPrpUTsaSKGEMvwzYvwyzlT7TQbB/wWX7AMvzF4fkuhyaS1oVO4J4M6tZ7oDhCVv+I77VDijQ29ekymvNBLryp2Dv+mWZzmV2anxL5TDXSUpeWYqVgTULZnQPX+a3cVg+PR78rwdmxQ+/UeDHC+oBtizA+FHinF5u3Wsn7pay3ErZCXmsC+dL662Bkf3RAmmmJDnU0vswYvvgQaL0VfUz4xgIF8Z50FBi63r+IjoAmIHPo70YuiQs/tXxkZXvjfPXnefcU2l6qjCmp7YUSKt6W3aMM6CbP+fEsSx9eD0G2vWDuQXH8LVCHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAIWCd9QF683ANYmFzBzbXTb5o1jc8OedLK7S01EHs8=;
 b=uUTk8q89nnteasWGmvYMGPmncKla3ox9OoVs/wKVIjfF1tbj5RkAw3hzLWuGs9PePK5CJ3SLLEz4R287yozKEni+sEyhnyVCOMlzCpTHDkjcjXeUFj3HyS5/V9Lpyhu4J7/YfMvQ2t78PifusshxbEew7IaNkwg41ucc5Gqxtl030gLC8KFGBHjte7BfeCT89qXTEZJq79E/nnqP1KAJ7rz2vChwXSvwbs5cADZnF5jqRvf4ZlZE2tzAd9kPKYvx+NiJhQOeqRyK8ke1ipVIOe5UhsDMAhhv7kXxyFSbqADz6aYaoTZ+3GWH/+nW4RnVtQzosQByu1MU3lyqjL9g4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 11:33:25 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 11:33:25 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Oded
 Gabbay" <ogabbay@kernel.org>, =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
CC: "Winkler, Tomas" <tomas.winkler@intel.com>, "Lubart, Vitaly"
 <vitaly.lubart@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v6 08/12] drm/i915/spi: add spi device for discrete
 graphics
Thread-Topic: [PATCH v6 08/12] drm/i915/spi: add spi device for discrete
 graphics
Thread-Index: AQHbCECCh53H28sax0W/Y8gG+cj31rJlFYuAgAAyBBA=
Date: Mon, 23 Sep 2024 11:33:25 +0000
Message-ID: <CY5PR11MB6366FDD8EB552B40BA1A5875ED6F2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20240916134928.3654054-1-alexander.usyskin@intel.com>
 <20240916134928.3654054-9-alexander.usyskin@intel.com>
 <87ldzi7oum.fsf@intel.com>
In-Reply-To: <87ldzi7oum.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB6954:EE_
x-ms-office365-filtering-correlation-id: 00f6332d-512b-4adf-eae2-08dcdbc38998
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?Qzl6TytuMlJEblZVTEphTXZDcWRQbGROWmdHNFJmWWJNYkhCVDY2YjFESm9w?=
 =?utf-8?B?c1B2RllRMHNGZ0VxeUcxOEtSM2p1QmpLNlFBRlVBMFA5WlIwVzV6OFZCRk0z?=
 =?utf-8?B?SUpsTVJWeGVKY0QyQzEweW9qamozS2pVM2d0aEtYMnMydHdoWmEzMk41OUlM?=
 =?utf-8?B?WGVDMHU1dGc2RkJ3OWZXNWFXbmhwV1FzWVZVUGxyRXJYOUhJdkJRbUZqY1FT?=
 =?utf-8?B?Znl5MTd4TUZCelk4enNsT2FoVzdGWGNRQkFLbnQxMUtROGk5Sk55Tmp4R1pz?=
 =?utf-8?B?RUhkTDZJNkJPSUVLb3A5S25taVRxVERLUWxDTWZucVhiZnlxNThkT2VwS2tj?=
 =?utf-8?B?c1NBWUZYbmJEMVArOVBsZXNNTmZaNnVYYWp2aENLNHlXMkFQbEMrOC80VzFK?=
 =?utf-8?B?dGlDTUErcm5mcmRsRjhDSkdVa1R6U1R3dEVnYTZ2Nm4wQzUyUmgwbzlFSFFx?=
 =?utf-8?B?UDFsVmpwY3R1aEtlU1RQeU9GZDdrcExsQmR5azgzVmlHdURnMll1L1hPWU9p?=
 =?utf-8?B?dG5XRlhFS01oTks3UDRVMWhZd2h1VUJNYzdVRzljOXVEM2JRRC9vN1hsQlY0?=
 =?utf-8?B?WEtVZ2ptVzJFc0dUQXlSd3FpK09lSlFVUGZLT2Zvd1h6NkNGVjJFSis5QUtI?=
 =?utf-8?B?dEpYSjdZZnRJUkhYanRhQzB5enJ4NDFnK0R3eVBtb0p1ZjgzSjdpRVZkSU1Q?=
 =?utf-8?B?Q2RGL0h6ZXlmb01tblB4U2plYzJMMmdQN1hpMyt5cDJDOEplWnoxckpPNXIz?=
 =?utf-8?B?WVZ1NFVtZE5CWWhZZm5wN2lhTldyZk1rTVpsTVg2QTVXS0htdTVXVUp4cTJ6?=
 =?utf-8?B?MTFNUitpMkRVdlEwU1NpQ1lkYy9ybzNmM09JeTdRaHdRd0lBY05nMmdFa2Jp?=
 =?utf-8?B?VndwNFpkdVM3UktrWmdkUEdHTXVGU2wwM1hWS2VDS2J3MEo4MmdvN29wbTBu?=
 =?utf-8?B?aG52R1J2S0IwZWVaSTVIdzd5dEZsZnhsMlJpZkU3NWx6d0JQYi9yM3BqV3RP?=
 =?utf-8?B?clg0KzVLeE9EZW5ETU16RURYcmkrWWlnejRXaFJOSWxaOTNUZlIwVzlsZXA0?=
 =?utf-8?B?azJCVHFXUXJlbytYK1dUQjJnWDV0NmtmY0llb1JYcFA2SDVTQmdSeEttU2VM?=
 =?utf-8?B?UXFJdDBLT0RRekhHcWY4LzQ3dW52YVE4TW0zNXE4SUhmMlJQbWNaY1JQazll?=
 =?utf-8?B?d0kwNjZvZjU2V3FvOHBxb2xZbnRNOU5ORUxFKzl2V2x1QThSZ0t4TVdhV0Mz?=
 =?utf-8?B?RUxGUVU1ZVRtcWZna1lKcS9YWkQvMk9VWllkbGxHMGprdmdUYVVQWUhQS1Vu?=
 =?utf-8?B?cE51b2t2TC9mRTh0TjV1L2YvZWVrdlZwenpBNnJ6QXVhMjl6dVl5d2kzMHZZ?=
 =?utf-8?B?TXp5YWU0L21VU3EyMDNtUHlGeldzSVZMd1hEU05mVERWSFY4by9hUVVvMDQ4?=
 =?utf-8?B?T1ZmWXZaOHNtS0pUN3ZvUE9GeHdoRkIzbEs0U3BmT01GU2NzbEFxQ3NNZWV3?=
 =?utf-8?B?K0RNWEtuOVRKOXdBVFJweWwrUmZlR0M0YklwYWdsQU10dkE2dG5qRXJxY0ZY?=
 =?utf-8?B?Q2p0b0xLdkd1SUdvL282aUlLcy9OSjJHRzA0VG1qSWVLMnpKSVRteWdibkg0?=
 =?utf-8?B?aHdUaFAwTmFJOGtKenQ5bDFGUm43RFZMc3hCTWdwU3pFL2RpaDk5bnh6T0FF?=
 =?utf-8?B?ZFpBa29LTHdFMC9hdWlXSUYwUnUzSFI0OGw0OEl0UW9YMzMvMmdld1ZqTE5o?=
 =?utf-8?B?azI4N0E5c0ZJaW01Lzd1ZGtvYVlCRXFsY3lkblJ4SmNkcUNkRjJONE8xWjRZ?=
 =?utf-8?B?OFFwdGxVdlR6bFJWM3pmWXVoTGJVeXRIaHorQXlBd2xSUjJrbHFLWDZMUkJK?=
 =?utf-8?B?K3RCWGZKUkxRNmJGWXYxcXZqcEtSY2pYSTNva2pmbVI5Z1B3SlZpb3Vac05t?=
 =?utf-8?Q?p/zJidOtKJ0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTM5UVcyR0RBTEhEM2VsNkYxbWZQMVlyWFBERFFaWEJLbjZDWjV1N1N1L0s0?=
 =?utf-8?B?SzVlcnowWURwb25ueHFYTHVKUEpEYTZtcVpFN0hrTnc0YWZTcWdQNkwyRHJy?=
 =?utf-8?B?NlBieUZtVG1PbFdDMXNOS0RNOFh3aEllbU1hUVJkdVB0NWRBSmFDek16b2h2?=
 =?utf-8?B?M3pSb2pDUVJzMzhrdFJmc3BmWFFpWXBkblNFVmt2ZjZBN2t1djlWWno0QitN?=
 =?utf-8?B?R1pOVmwvN2cra1REc0gzSTFJZXR2emVLZFJiS0pBQTFyTVczc3IrUnp0dTFH?=
 =?utf-8?B?WStyU3V0MEdJd3JYeXVKOUtsTzZyM0l5UWRlQUd6SnlDK0ZDaGtTRlNseE1u?=
 =?utf-8?B?SVV1L2VHd3RwNnRwL2hKTkFaUHR4c1g2NkF6cjVNeHhUcXJnbjRTQXVGSWRh?=
 =?utf-8?B?eEEzZ0o3cWlTdGhPT1ZMU2YrZkFaa0RNMnUwVnM2MHdjV2FXYldVblZ4eVJ2?=
 =?utf-8?B?MFpKQWxnZ05ibFRFNHRoZjVTeVBjVkZxRmxVN0RHNDh1VEFzanQvS3hrMHJi?=
 =?utf-8?B?RHM1aXNkVTg5c2x2dHU1cm9QeTRRV05lTW51dlpxRHdSSmFRb0gzcFppTUs2?=
 =?utf-8?B?d29ySUtuZlcvcDNsYUpwK21XY0RtclJuVzloUzJqWWhlUGkxVE1ydStCdVl1?=
 =?utf-8?B?OVF1T1E1cnFOMCtKS3JVVThIcmpLNm9QYnpjaFVWR1hjRGxXR0tueTdobHE2?=
 =?utf-8?B?bTAvWnBHYUVTaWcxcytNbkxRNXpDejlsK21WWERJTC9zdDlZNmV2UkxJWmdm?=
 =?utf-8?B?ZjQ2eCt4dHYySE9EY2MyUkFMdjVOL2xlb0RIck5ZZlkxVko5MTZ6RlhDclR2?=
 =?utf-8?B?RXY4L2FRb3FIWXFjcHNyUUVjL0pvV1dHUkxJL2o0M3BwMXluUS9abnVFeHl0?=
 =?utf-8?B?Tkh4Y2gwMDB2bFg1MXgrbHI0OVNnbzcwcURrcVVLeHNHbFNrQWNhZkpwbmJn?=
 =?utf-8?B?RGZOR3lxbkN3YXlMSTdGdUNRenhSV3NORmJ2eW4xNW83VWFwcWI3WjlkaWVE?=
 =?utf-8?B?Z1R5Vmozak4xbCt6VTJ3QXg0MENqa0g1NkNFR2JQZ1E1aFdkRXFEcnMwbEZ4?=
 =?utf-8?B?MDFwUkNHVjZGdTNZZXRBU2ZPNDA5eFUxT1ZWRWJrRjc3VFlzVVV2ZXBsNWhH?=
 =?utf-8?B?dEtHVnRDa0s4dFR1ZTdSVjNUQmo2SEJtajI5M08ybm1rUUxBbGNvMWUyREhF?=
 =?utf-8?B?NUZxWTc5TUdwTHNHOEQ4a283UWFxdGJkWjVnMFp0QUo5RnNpZWM5N2J3Ui96?=
 =?utf-8?B?eER0UEFJNlVlbERDdW5Wa01uZ3BnZ09Mb2Z1TW5yQ2tmQ3RmVXIzZDg0YnFH?=
 =?utf-8?B?MUplYzN6SEhaNytoNWlxNTVUWU5YTDVEMFl4c3NvWnAvRzdPcUl3OGdhOGV0?=
 =?utf-8?B?R1Z6R3BNY1ZtM1F6cjJrZDMxTWo4cTJqUkVPR3NmMWFIQjc4RlFlOXBLei9I?=
 =?utf-8?B?dXRMbmEwN29aZlBtSDcya3hML2tYVnlqQ2tvYnlhbG1Fc00yNjhmeEJrMkMv?=
 =?utf-8?B?TzZuYmMvNmxESVVWbmxMVGJjd29PNlhZdm1EbkFvLzkrQWJZb044anpwYlpm?=
 =?utf-8?B?L3FHWmx1RkdtS2E2bXh0L0NuOTF2Q1NCaG9MdkhneWIyRDVtaW45MVYwMTRG?=
 =?utf-8?B?cTEyWk92Nm9VaVdyTTdHT0d6bEdoTmxpMmpsdnBHVGd6SXNmenExZ3A1MTNW?=
 =?utf-8?B?cHpOYXk3M25IWTJMTjBOSDZvbGg1TFA4UmNldmE5eEl3a3l4bnBkVnVBSXNC?=
 =?utf-8?B?MmFlbXZ0RHVCVkI3aHpYV3l5S3hzQ1pScEJFdnpWV2VuL3psNG9lQmw0cVZt?=
 =?utf-8?B?TUhpUWN1bXlTWTFkeUhvQ3g0UCtXcXZoc1h1d2N5MlN6OTVjajRZQzhidUZr?=
 =?utf-8?B?TldhNVB0OVBQd004K0h5bEZ3dCtSdW5VVFlEOWM0SnRIdlpCUVMwWUV6Z3ZT?=
 =?utf-8?B?L2I4YWNVRS9WcWVLQ0RyU3FwR256Lzk4QUt0SmxQd2czWDNXWXp5bU1ueDBy?=
 =?utf-8?B?MGVJVmhiYzE4ZXFoK0UrRld2c0FlYXpjT25mREd5dGxEb2NrQW5PK0ZvYlZD?=
 =?utf-8?B?L3JjYTNrenZCcWdLRk9lYnU3VzcwTkxXWXpGTnREVGM3d1I5THJjcndLNFNh?=
 =?utf-8?Q?3LcfvBzcMcogcLNX37wznASaj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f6332d-512b-4adf-eae2-08dcdbc38998
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 11:33:25.3201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8o1w0UIvBZkYztbVKYDo5UXfK7LpaTkDlFLIFaNnWtzb6P66eQsKzjq64PResU6FiaJPG2tiTKFxnRpqlxlVZKIyQn+gzKozCYHF+Cw5IdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDA4LzEyXSBkcm0vaTkxNS9zcGk6IGFkZCBzcGkgZGV2
aWNlIGZvciBkaXNjcmV0ZQ0KPiBncmFwaGljcw0KPiANCj4gT24gTW9uLCAxNiBTZXAgMjAyNCwg
QWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGludGVsLmNvbT4NCj4gd3JvdGU6
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmgNCj4gYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2Rydi5oDQo+ID4gaW5kZXggMzlmNjYxNGEwYTk5Li5i
OWQ0ZjliZTUzNTUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9k
cnYuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmgNCj4gPiBAQCAt
MzQsNiArMzQsOCBAQA0KPiA+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9wbV9xb3MuaD4NCj4gPg0K
PiA+ICsjaW5jbHVkZSA8bGludXgvaW50ZWxfZGdfc3BpX2F1eC5oPg0KPiA+ICsNCj4gPiAgI2lu
Y2x1ZGUgPGRybS90dG0vdHRtX2RldmljZS5oPg0KPiA+DQo+ID4gICNpbmNsdWRlICJkaXNwbGF5
L2ludGVsX2Rpc3BsYXlfbGltaXRzLmgiDQo+ID4gQEAgLTMxNSw2ICszMTcsOCBAQCBzdHJ1Y3Qg
ZHJtX2k5MTVfcHJpdmF0ZSB7DQo+ID4NCj4gPiAgCXN0cnVjdCBpOTE1X3BlcmYgcGVyZjsNCj4g
Pg0KPiA+ICsJc3RydWN0IGludGVsX2RnX3NwaV9kZXYgc3BpOw0KPiA+ICsNCj4gDQo+IFNvcnJ5
LCBsYXRlIHRvIHRoZSBwYXJ0eS4NCj4gDQo+IENhbiB3ZSBtYWtlIHRoYXQgc3RydWN0IGludGVs
X2RnX3NwaV9kZXYgKnNwaSwgZHJvcCB0aGUgaW5jbHVkZSBhbmQgdXNlDQo+IGEgZm9yd2FyZCBk
ZWNsYXJhdGlvbiBmb3IgdGhlIHR5cGUsIGFuZCBhbGxvY2F0ZSBkeW5hbWljYWxseSBwbGVhc2U/
DQo+IA0KPiBEaXR0byBmb3IgeGUgZHJpdmVyLg0KPiANCj4gc3RydWN0IGRybV9pOTE1X3ByaXZh
dGUgaXMgaHVnZSwgaTkxNV9kcnYuaCBnZXRzIGluY2x1ZGVkIGV2ZXJ5d2hlcmUsDQo+IGFuZCB0
aGVyZSdzIG5vIHJlYXNvbiBldmVyeW9uZSBzaG91bGQgYmUgYWJsZSB0byBsb29rIGF0IHRoZSBn
dXRzIG9mIG9mDQo+IHRoYXQgbWVtYmVyLg0KPiANCg0KVGhhbmtzIGZvciByZXZpZXchDQpZZXMs
IHNlZW0gcmVhc29uYWJsZSB0byBtb3ZlIHRoZSBzdHJ1Y3Qgb3V0LCBJJ2xsIGxvb2sgaG93IHRv
IGRvIGl0IGFuZA0KdXBkYXRlIGluIHRoZSBuZXh0IHJldmlzaW9uLg0KDQpBbnkgb3RoZXIgY29t
bWVudHMgYWJvdXQgWGUvaTkxNSBjb2RlPw0KSXQgc2hvdWxkIGJlIHVuYWZmZWN0ZWQgYnkgY2hh
bmdlcyBpbiBzcGkvbXRkIHBhcnQuDQoNCi0gLSANClRoYW5rcywNClNhc2hhDQoNCg0KPiANCj4g
QlIsDQo+IEphbmkuDQo+IA0KPiANCj4gLS0NCj4gSmFuaSBOaWt1bGEsIEludGVsDQo=
