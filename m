Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF0DC0C1BA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 08:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772F810E142;
	Mon, 27 Oct 2025 07:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kK4/tpDf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA25E10E142;
 Mon, 27 Oct 2025 07:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761549882; x=1793085882;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tsk5zdZl6Qy/OUkbEoes1SlEPkzPr5mdzBKnMJ5J4Ks=;
 b=kK4/tpDfH88IJOnql0iDNExQ5DtZew7pzZnxhzOfcB60qAW+IPY9zI9Y
 XaYcx/0aK0IX6mhdf0bUHqscqgXRnfAb2QVcUbsvgjYY1pPTfeKkZ5j5F
 YEMMOPEGKfBwLIrBeSRKETg0HzOJqJTwDPXnS6jnKai9MNuYil8IOlEOs
 0Das2HINvSVUhixQTy9ra4gr4BGSoxFedutjH+95risFD50Dn3lgWFMF0
 lGumwhpQ5iPvuKwCNN4GdNpVR2RFNEhbri11z7BzVbczm2wUTGQfX1WnS
 tKPxVwxjG1sUs7injUakES6HZgCfD1FiFpNbEg5f2Wr1PQT8bC0rw4BPX g==;
X-CSE-ConnectionGUID: suhdSZDGS42r5NRXgGU2oA==
X-CSE-MsgGUID: OEdXQbJSSQajjah9nhdHrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81049375"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="81049375"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 00:24:41 -0700
X-CSE-ConnectionGUID: b8u/RUxkSFeAUfz9TcJutg==
X-CSE-MsgGUID: 1V8CcSoKRBGIDVJMI8Fv/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="189343958"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 00:24:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 00:24:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 00:24:40 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 00:24:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7WZvqmgktU1hzIs+rmmBOLzs7Vvw8USQNrkimxXztFL6o39m+mVurhKQmH4cg1KhqpVMlEw/9GNF9HwNS32wxjfXv5UfP5AN0nA+ppTqFQ4CEwX3JwGVHm3Zcg60XDRO31NPmv5h3NwruEjrU46uZ8lRr1DeOQRh/p9ywvLtAmuk76kN/okZqZI9c+rmcsVtIUS9Kaa8NaqltvDHZh3X5GxUgz2z3wvgd36ZXyxgUoP8CHg1c+BhpWqI7yPd4klCk6A1rMSH3Fl1Yc8RYT6K+F+hOvgBPfvWB7qrePAXKZpV9dnkGAiLqesebKWtoY9oCZeHwZObdOr9XWgxJmomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tsk5zdZl6Qy/OUkbEoes1SlEPkzPr5mdzBKnMJ5J4Ks=;
 b=aviDVGkNlcjIZTGswegI5nxcW903t+NxNKUCLGAJDPWJ7fv5+1/Jj0IHYR8XrCSdYOuVhzVO7iQc0d65WwobQ8uE9WM0QXkybFBw+2D1fekJ6fRRwNVPRy8sSwyolQzYKGpfMU/n0npSu13lQYDzEo2zbHfOp3xOUrSP/6z12rmbBHcs9igqfdeR/dRDe26bcX0Uu2ea8ouitKWkM7lUmLP0wZIQ0gad3D1MA5ho8PD45M7Ksy0iKIGoSd/0B+PcKLxkMQ8am+6bMIEpOT3JuQrmOCbDI2fBVmb4vxfyLoMTp5wPbB+9opJorRVHE7GXfvLDy3+87F6H0dbugdCcmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Mon, 27 Oct
 2025 07:24:38 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 07:24:38 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Winiarski, Michal" <michal.winiarski@intel.com>, Alex Williamson
 <alex.williamson@redhat.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Laguna,
 Lukasz" <lukasz.laguna@intel.com>
Subject: RE: [PATCH v2 26/26] vfio/xe: Add vendor-specific vfio_pci driver for
 Intel graphics
Thread-Topic: [PATCH v2 26/26] vfio/xe: Add vendor-specific vfio_pci driver
 for Intel graphics
Thread-Index: AQHcQtxJWeb+cS5vDUGtKqQJRFxx0LTVmZ6g
Date: Mon, 27 Oct 2025 07:24:37 +0000
Message-ID: <BN9PR11MB527666A6CA6D9DD2F948961C8CFCA@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20251021224133.577765-1-michal.winiarski@intel.com>
 <20251021224133.577765-27-michal.winiarski@intel.com>
In-Reply-To: <20251021224133.577765-27-michal.winiarski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|IA0PR11MB7814:EE_
x-ms-office365-filtering-correlation-id: 3f910b5c-c5e3-4cf0-bbef-08de1529e305
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WEpnNG1HczhMRis4UjVNNUthNk1zc1Y5UVVDSmErQ2VzM2JvUHRLNnpxU2pM?=
 =?utf-8?B?cGQyODNiOHNrZHYrdjI5RTI4K3RUY253RVA0ODJmK2F3ZjZBSTlnOG9qbVVt?=
 =?utf-8?B?d1ZKd0ZJNGVub2R6dGdHWWdBNlJwWDh5WEo3R0RXTjJqRHQ4WW1rd0JmVkJF?=
 =?utf-8?B?c21WTE5INndZV2NLbkhacGFuQnF4TksvamxSK3MwTXA4aUQ5WHJTclFEYXF3?=
 =?utf-8?B?cnZRcVJ5VXlXSk9JOGdDeXhDZzJhSWtuU3h4UEIzejk4b1N5NzhHMi9yYzV1?=
 =?utf-8?B?R1VRREJRK3pZRUFtVmtFZGZvLzh5bXFEN0syUzlOeGsvU3AxSjlEcnZNNXpi?=
 =?utf-8?B?SUxVM3VZNlR5a2pTRnRNNS95STlaakFxaWRWbDQrUythOXRXY2FscjJBTjAr?=
 =?utf-8?B?azl3WXcwaEVzUUd5VExnNkpLS0JxUHRnMFBZS1hTRlJRMkVFTkdFVERJRDRE?=
 =?utf-8?B?OWdpa3lNUzN5cGhzbSt2YysrcmVuSktlajZ5Y05kUElHbWNGWDhBU3Zid1Vw?=
 =?utf-8?B?Tmw2RDdFSzdkcWVMRHk2UlRSWkVGNU5RTjRIendyUDZLZGJsbWJEeWZrcjds?=
 =?utf-8?B?K0dUZ3lURnh5RVZiZUxIRjY2MHVLUnhQL0s1UWZIbStoRjdwZ0Y4RSt5dUdr?=
 =?utf-8?B?d3d3YkxUR1g2bkRiQTRLZ0hTVlpzU3NBdVcrYUpRTHEzOTVOR1l4SjlYMlBp?=
 =?utf-8?B?bVFJMmtoS2RvTUh5cUc1dDZZWHBQdGx1UHBra2ZKTW1JSmxaNVJaOWF6RWRm?=
 =?utf-8?B?K01KekFaeUMwTTJreHhudkJ4VEo0bDQrTUdNTGZrVEhOMmd1ZHZKbnhnTFY3?=
 =?utf-8?B?eTFkYmgzUGY1U1k5SjY2RWhieHRHYUxjQzZnYnkvUUo5ekNHU0VNQlVYNTlO?=
 =?utf-8?B?elBmWkR1QzVqN3p3bGtweWlsMTI2YXVrdUtuL1g1WjR0MS9yRTJ2czBCdm01?=
 =?utf-8?B?ZWVqNWFNamZsSXVKbnlwanp1cFdXQVhTd3BVWHFrbDB3YVcxZ2puRTJrTU1r?=
 =?utf-8?B?WFlCWHFSdmpEbDFRUWNLbExuNkh3azhTUkJvZEZTSU5Ldkk5eFp1UVZaZnBC?=
 =?utf-8?B?NDlQeUtCanBVSXZ4YXlRU29kOE1NcytuMEl4SGs3d05tZkxXQXQ2ai9OdEgy?=
 =?utf-8?B?N0hTeFlobGdqQ0FwdlNDUit5cEpsVThHNjg4RlhtUkNKWENkQzQ5Qk5KblFP?=
 =?utf-8?B?Yi9RMTJQQW9DWFh1cGdIbytzMGhCbEhWN1gvaUlYb25jR0JaUFZXRGNHOGNN?=
 =?utf-8?B?bnl3QWhxKzRKc2tCS3Y3eFVJaGxtUFAySWFpSzlLL1drajBhRUZwVFlldVZI?=
 =?utf-8?B?N01lZk5kNllTOExpY1pxSG1OZUNYMzVoUkFkQlZJVENZRUJmcloyYTJXWERL?=
 =?utf-8?B?aXZxMkF5cHd0bTNVN1NKOEFGR3ZCVis3Z2xZSVF0aDdMUnFoMlpvaHFlV3pR?=
 =?utf-8?B?ajFvRVlNM0NIVGpqOUxkWDhzYWx5N0gvNFY2ZmxOQmVMTUwvODFCcm1kOHh6?=
 =?utf-8?B?S3krRXVUU3h6c3Bzald4dUJyak1sdEJ2TmFCSzdoZFlGQ3IyaFJhcFZKOHlC?=
 =?utf-8?B?OHBmN2NDZVErTzgxME05emVPQ2JSVUMxOU9lTGpMeVhPOFBScklVNk5RMlox?=
 =?utf-8?B?dGE3VVhFNnR6ekZjM3FnTUlUS0FUclgwWUhEL3pBQlhnYml6NFd2U2lnVE9r?=
 =?utf-8?B?WFJUTkxwMGt3VEI1aVpUK1E0MzNpVkVYVCtTcllqVmxmOEd5TStacnJmcDFy?=
 =?utf-8?B?RWRvRUpvWmZxTFVWb0dOQ3Rkdk50RnlTSHdZakRZWVBlSjVacVBKY09TaXRX?=
 =?utf-8?B?QTgxaG1iOUNQY1pkd21VU0pnelh6enZ4V3NVdVptaUJmc0hkVUd1NzVFMHh6?=
 =?utf-8?B?WTAvQ2tuczgyZ3o1MUk2R0ltTmtWWlhmWUcxRjNJTkw3T2VnMkQrMjNzR1Rr?=
 =?utf-8?B?OEMxbkJkS0VDREtjVFR5Tnc5TDRibnpWQTBJNnIyOGp6SUIzOGx5MVlPYzNK?=
 =?utf-8?B?VytoMmdJc3MwdTlzR25uTXR5b3RUYjBGUEJORGFzeXMwNlJ2ZlBIdlZVNW8y?=
 =?utf-8?B?L1M2eXE2UnEweHhvUUc2dnlRWGNOS25yUTIwQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTNhYk1IQUxGeVloc3ZKaUR4QU5nSm85KzJLY293RkZSYnRQTFdnVlljcERk?=
 =?utf-8?B?UVpGTm8rNEZhOHUrVEVQamRrdFFMMjNyaWtuNGlxckkwZklLaFBIbWMxcmk2?=
 =?utf-8?B?N1dzdXdCUDU3bjNuL2xMRzNBSER4TGNxWS9QVWhYNWNweWJjazJxbStreXJz?=
 =?utf-8?B?R0JId0F0T2NsZnpaMWxmUjJsZDNSbUluUmxyZEorZi9Kb2ZBYmRZN2RBVTZq?=
 =?utf-8?B?dG1acFZSOXE3VXFJczdXd1hMRlorUDl5RFh5TUdXTkRLZmZFWlllZkc5b0FV?=
 =?utf-8?B?TlRHZHhTbzJna1RUOW1vd0p5MzM2REFMaDRPaHQ4b0lyYXVvdEI4ekxJcE1q?=
 =?utf-8?B?MTYyZ2Jvb1lRSWJYelVmV0UvcUFCQ0hBU2lURkFocW9Rdjg5KzI5VFhJV3Zp?=
 =?utf-8?B?UE9udDlzcUpTWldla1lTRDFPWSt2L3N4N2ZHN2t1ZDUzQmIyT200NENrc3E0?=
 =?utf-8?B?Tm8rd0Q0Unk3T1hYNXlFV1U2SVN6djZLbDJ4bW9uczRvcnEwQ2s3MW1mcDAv?=
 =?utf-8?B?ZGRRVkg4VXhTcGI5OUxZR1RERVc5NlZnbjZ2NW1HQXUyVm13R0psT2ExWkJW?=
 =?utf-8?B?RmxtR3poVlZkOTV5K25iWVI3YytYZUx3VEVQcGhhYjBvNExRMG1ZSjFOZDdX?=
 =?utf-8?B?d09tc2xrVTFJa2dEZXY5azA1UnZKb1JORUJuYitCTkxOaUpJS1llSXVGelBp?=
 =?utf-8?B?M2I0NU15dHlGV0xxL1MraTIveURYT25WcUtLWmZlSDZ6eWJCTWFMeFgxZ0ts?=
 =?utf-8?B?OHA0YUI2S3BCUlZlOVVQZ1laQVRlYSt5NmxSSlNmc1paclZnZXE1dXNZem5Y?=
 =?utf-8?B?cm9pUnBlY3ZqTnVaclB3WWpXL3QvdC9BZjNHZGIreERPNTQrdWhTMW56RGlS?=
 =?utf-8?B?U0trOWplVXRPSjRxV1JiQVhGVmVWYk5EMERLZGhTZENId3dYcmQxWllOTFVv?=
 =?utf-8?B?ejJySkFHTWZZU0J6NkFaelcwOFFpZCsyajhmelFxOURSNVpvekg2UU5ZeUd1?=
 =?utf-8?B?QnJORXl6UWpkTU8zVCtKdXJlSU9jdkNwTnlUak1IT2RsWS9jT0dSN1lXeWxO?=
 =?utf-8?B?UzNCZGZraVlpVU5qUitXTnNTTjNGcVRWaUpCVnZrRlhTa09iMzBucWFEK05W?=
 =?utf-8?B?NWV2T2xaZkFhK0J3bllRNnE1cmlwc2dwVkFmQ013NlB1R3BFR3pIYlh1a1ho?=
 =?utf-8?B?SHp5NjdkTkplWU95ZWllNjNTd09WVXRPTEc4TVYwVUhjT1YxUGlyanBMTEFM?=
 =?utf-8?B?UkwwS3oxVERXWmVGSTJEcFRjSjJpeFo1c29mUUlqVWUvVGpwVVdZL1o3KzJq?=
 =?utf-8?B?U3dLak53REN2RlMxWDlxUCtxQ2sxdFdYdkdCYnFtVmlwbWtmUVlpRnl1VzA2?=
 =?utf-8?B?Yk5kN1gzZjZpdHlkQlQvSU93UXc1alNsaHlTenZiS1hseGRFUlVnSHRIOFFp?=
 =?utf-8?B?cUsxb1FyS3ZUVEJid1NyUEsvZzFlSk02ZE9iOEsrL25jSS9SNldWbXNWc3k5?=
 =?utf-8?B?cmdRaGdzYUZrc2xpNUJIMVJPZ3JUOExFRENRR09vZ3hzeHJUaU83WmIwdVZx?=
 =?utf-8?B?L1JlMUk3dlJad1hEdDk2anRqb0svS0h1MFhzaGhUZUgyZ3JtRjRtRXpqSE04?=
 =?utf-8?B?ZmI0NFAyK1IzMXEvd2ZDaytTaEp6endtaDBWQ09OdWNJa3BjV3REK0E5eGs3?=
 =?utf-8?B?VFNEaEtpQXRJc2FPSm1JWTBQdzd0alNjRndSM3FnVHRJNWpkWE91cUMwSXow?=
 =?utf-8?B?bEk3djZjTnk3WE9VRk5TUG1PQXd1NlBKeDhRNE85cjJaUHMzM2lEMEhhVHNo?=
 =?utf-8?B?Q2thKzg3Q3FBYkEyLzczeVRHMlRCenhybUxTWVdHdyt5d1N4VVlLYWoxVEFC?=
 =?utf-8?B?aXo2bnIvVUtyM1dkcUM1NmJqb05BR056NEN2bEtIVGdLMjFnbEVrNTFlZUo2?=
 =?utf-8?B?NTVlWkdEL1VETURNMXcxTHJ3S3JEZDQwWVhnaVBlbThRZ1d5UzJvTXhZU2c5?=
 =?utf-8?B?Sjhqbk1xNnFJWkwySjExL3BYNC83aUpZSXVYaGVKOWR3NEordHRJSThvZkpW?=
 =?utf-8?B?aGEvMUZSekhWdlRGZitYR2FvVFl5MXc4bCtsRFl1RXJyTjRZU2Y3WkNDV2E3?=
 =?utf-8?Q?2f29K6A5qXWpTs0dP/sY/VvS5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f910b5c-c5e3-4cf0-bbef-08de1529e305
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 07:24:37.9634 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l9Oe5+vrYjNe+tmoEiOzTALum2CpTzyOvrtYrJyw3FqzCnMOy9mrHKcNXgSuHf1wJDrcNeE4LoQ117CL1FPrmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
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

PiBGcm9tOiBXaW5pYXJza2ksIE1pY2hhbCA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+DQo+
IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciAyMiwgMjAyNSA2OjQyIEFNDQo+ICsNCj4gKy8qKg0K
PiArICogc3RydWN0IHhlX3ZmaW9fcGNpX21pZ3JhdGlvbl9maWxlIC0gZmlsZSB1c2VkIGZvciBy
ZWFkaW5nIC8gd3JpdGluZyBtaWdyYXRpb24NCj4gZGF0YQ0KPiArICovDQoNCmxldCdzIHVzZSB0
aGUgY29tbWVudCBzdHlsZSBpbiB2ZmlvLCBpLmUuICIvKiIgaW5zdGVhZCBvZiAiLyoqIg0KDQo+
ICtzdHJ1Y3QgeGVfdmZpb19wY2lfbWlncmF0aW9uX2ZpbGUgew0KPiArCS8qKiBAZmlscDogcG9p
bnRlciB0byB1bmRlcmx5aW5nICZzdHJ1Y3QgZmlsZSAqLw0KPiArCXN0cnVjdCBmaWxlICpmaWxw
Ow0KPiArCS8qKiBAbG9jazogc2VyaWFsaXplcyBhY2Nlc3NlcyB0byBtaWdyYXRpb24gZGF0YSAq
Lw0KPiArCXN0cnVjdCBtdXRleCBsb2NrOw0KPiArCS8qKiBAeGVfdmRldjogYmFja3BvaW50ZXIg
dG8gJnN0cnVjdCB4ZV92ZmlvX3BjaV9jb3JlX2RldmljZSAqLw0KPiArCXN0cnVjdCB4ZV92Zmlv
X3BjaV9jb3JlX2RldmljZSAqeGVfdmRldjsNCg0KYWJvdmUgY29tbWVudHMgYXJlIG9idmlvdXMu
Li4NCg0KPiArc3RydWN0IHhlX3ZmaW9fcGNpX2NvcmVfZGV2aWNlIHsNCj4gKwkvKiogQGNvcmVf
ZGV2aWNlOiB2ZW5kb3ItYWdub3N0aWMgVkZJTyBkZXZpY2UgKi8NCj4gKwlzdHJ1Y3QgdmZpb19w
Y2lfY29yZV9kZXZpY2UgY29yZV9kZXZpY2U7DQo+ICsNCj4gKwkvKiogQG1pZ19zdGF0ZTogY3Vy
cmVudCBkZXZpY2UgbWlncmF0aW9uIHN0YXRlICovDQo+ICsJZW51bSB2ZmlvX2RldmljZV9taWdf
c3RhdGUgbWlnX3N0YXRlOw0KPiArDQo+ICsJLyoqIEB2ZmlkOiBWRiBudW1iZXIgdXNlZCBieSBQ
RiwgeGUgdXNlcyAxLWJhc2VkIGluZGV4aW5nIGZvciB2ZmlkDQo+ICovDQo+ICsJdW5zaWduZWQg
aW50IHZmaWQ7DQoNCmlzIDEtYmFzZWQgaW5kZXhpbmcgYSBzdyBvciBodyByZXF1aXJlbWVudD8N
Cg0KPiArDQo+ICsJLyoqIEBwZjogcG9pbnRlciB0byBkcml2ZXJfcHJpdmF0ZSBvZiBwaHlzaWNh
bCBmdW5jdGlvbiAqLw0KPiArCXN0cnVjdCBwY2lfZGV2ICpwZjsNCj4gKw0KPiArCS8qKiBAZmQ6
ICZzdHJ1Y3QgeGVfdmZpb19wY2lfbWlncmF0aW9uX2ZpbGUgZm9yIHVzZXJzcGFjZSB0bw0KPiBy
ZWFkL3dyaXRlIG1pZ3JhdGlvbiBkYXRhICovDQo+ICsJc3RydWN0IHhlX3ZmaW9fcGNpX21pZ3Jh
dGlvbl9maWxlICpmZDsNCg0Kcy9mZC9taWdmLywgYXMgJ2ZkJyBpcyBpbnRlZ2VyIGluIGFsbCBv
dGhlciBwbGFjZXMNCg0KYnR3IGl0J3Mgcmlza3kgdy9vIGEgbG9jayBwcm90ZWN0aW5nIHRoZSBz
dGF0ZSB0cmFuc2l0aW9uLiBTZWUgdGhlIHVzYWdlIG9mDQpzdGF0ZV9tdXRleCBpbiBvdGhlciBt
aWdyYXRpb24gZHJpdmVycy4NCg0KPiArc3RhdGljIHZvaWQgeGVfdmZpb19wY2lfcmVzZXRfZG9u
ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4gK3sNCj4gKwlzdHJ1Y3QgeGVfdmZpb19wY2lfY29y
ZV9kZXZpY2UgKnhlX3ZkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7DQo+ICsJaW50IHJldDsN
Cj4gKw0KPiArCXJldCA9IHhlX3NyaW92X3ZmaW9fd2FpdF9mbHJfZG9uZSh4ZV92ZGV2LT5wZiwg
eGVfdmRldi0+dmZpZCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJZGV2X2VycigmcGRldi0+ZGV2LCAi
RmFpbGVkIHRvIHdhaXQgZm9yIEZMUjogJWRcbiIsIHJldCk7DQoNCndoeSBpcyB0aGVyZSBhIGRl
dmljZSBzcGVjaWZpYyB3YWl0IGZvciBmbHIgZG9uZT8gc3VwcG9zZSBpdCdzIGFscmVhZHkNCmNv
dmVyZWQgYnkgcGNpIGNvcmUuLi4NCg0KPiArDQo+ICsJeGVfdmZpb19wY2lfcmVzZXQoeGVfdmRl
dik7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2Vycm9yX2hhbmRsZXJz
IHhlX3ZmaW9fcGNpX2Vycl9oYW5kbGVycyA9IHsNCj4gKwkucmVzZXRfZG9uZSA9IHhlX3ZmaW9f
cGNpX3Jlc2V0X2RvbmUsDQo+ICt9Ow0KDQptaXNzaW5nICIuZXJyb3JfZGV0ZWN0ZWQgIg0KDQo+
ICtzdGF0aWMgc3RydWN0IHhlX3ZmaW9fcGNpX21pZ3JhdGlvbl9maWxlICoNCj4gK3hlX3ZmaW9f
cGNpX2FsbG9jX2ZpbGUoc3RydWN0IHhlX3ZmaW9fcGNpX2NvcmVfZGV2aWNlICp4ZV92ZGV2LA0K
PiArCQkgICAgICAgZW51bSB4ZV92ZmlvX3BjaV9maWxlX3R5cGUgdHlwZSkNCj4gK3sNCj4gKwlz
dHJ1Y3QgeGVfdmZpb19wY2lfbWlncmF0aW9uX2ZpbGUgKm1pZ2Y7DQo+ICsJY29uc3Qgc3RydWN0
IGZpbGVfb3BlcmF0aW9ucyAqZm9wczsNCj4gKwlpbnQgZmxhZ3M7DQo+ICsNCj4gKwltaWdmID0g
a3phbGxvYyhzaXplb2YoKm1pZ2YpLCBHRlBfS0VSTkVMKTsNCj4gKwlpZiAoIW1pZ2YpDQo+ICsJ
CXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiArDQo+ICsJZm9wcyA9IHR5cGUgPT0gWEVfVkZJ
T19GSUxFX1NBVkUgPyAmeGVfdmZpb19wY2lfc2F2ZV9mb3BzIDoNCj4gJnhlX3ZmaW9fcGNpX3Jl
c3VtZV9mb3BzOw0KPiArCWZsYWdzID0gdHlwZSA9PSBYRV9WRklPX0ZJTEVfU0FWRSA/IE9fUkRP
TkxZIDogT19XUk9OTFk7DQo+ICsJbWlnZi0+ZmlscCA9IGFub25faW5vZGVfZ2V0ZmlsZSgieGVf
dmZpb19taWciLCBmb3BzLCBtaWdmLCBmbGFncyk7DQo+ICsJaWYgKElTX0VSUihtaWdmLT5maWxw
KSkgew0KPiArCQlrZnJlZShtaWdmKTsNCj4gKwkJcmV0dXJuIEVSUl9DQVNUKG1pZ2YtPmZpbHAp
Ow0KPiArCX0NCj4gKw0KPiArCW11dGV4X2luaXQoJm1pZ2YtPmxvY2spOw0KPiArCW1pZ2YtPnhl
X3ZkZXYgPSB4ZV92ZGV2Ow0KPiArCXhlX3ZkZXYtPmZkID0gbWlnZjsNCj4gKw0KPiArCXN0cmVh
bV9vcGVuKG1pZ2YtPmZpbHAtPmZfaW5vZGUsIG1pZ2YtPmZpbHApOw0KPiArDQo+ICsJcmV0dXJu
IG1pZ2Y7DQoNCm1pc3MgYSBnZXRfZmlsZSgpLiB2ZmlvIGNvcmUgd2lsbCBkbyBhbm90aGVyIGZw
dXQoKSB1cG9uIGVycm9yLg0KDQpzZWUgdmZpb19pb2N0X21pZ19yZXR1cm5fZmQoKQ0KDQo+ICt9
DQo+ICsNCj4gK3N0YXRpYyBzdHJ1Y3QgZmlsZSAqDQo+ICt4ZV92ZmlvX3NldF9zdGF0ZShzdHJ1
Y3QgeGVfdmZpb19wY2lfY29yZV9kZXZpY2UgKnhlX3ZkZXYsIHUzMiBuZXcpDQo+ICt7DQo+ICsJ
dTMyIGN1ciA9IHhlX3ZkZXYtPm1pZ19zdGF0ZTsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJZGV2
X2RiZyh4ZV92ZGV2X3RvX2Rldih4ZV92ZGV2KSwNCj4gKwkJInN0YXRlOiAlcy0+JXNcbiIsIHZm
aW9fZGV2X3N0YXRlX3N0cihjdXIpLA0KPiB2ZmlvX2Rldl9zdGF0ZV9zdHIobmV3KSk7DQo+ICsN
Cj4gKwkvKg0KPiArCSAqICJTVE9QIiBoYW5kbGluZyBpcyByZXVzZWQgZm9yICJSVU5OSU5HX1Ay
UCIsIGFzIHRoZSBkZXZpY2UNCj4gZG9lc24ndCBoYXZlIHRoZSBjYXBhYmlsaXR5IHRvDQo+ICsJ
ICogc2VsZWN0aXZlbHkgYmxvY2sgcDJwIERNQSB0cmFuc2ZlcnMuDQo+ICsJICogVGhlIGRldmlj
ZSBpcyBub3QgcHJvY2Vzc2luZyBuZXcgd29ya2xvYWQgcmVxdWVzdHMgd2hlbiB0aGUgVkYgaXMN
Cj4gc3RvcHBlZCwgYW5kIGJvdGgNCj4gKwkgKiBtZW1vcnkgYW5kIE1NSU8gY29tbXVuaWNhdGlv
biBjaGFubmVscyBhcmUgdHJhbnNmZXJyZWQgdG8NCj4gZGVzdGluYXRpb24gKHdoZXJlIHByb2Nl
c3NpbmcNCj4gKwkgKiB3aWxsIGJlIHJlc3VtZWQpLg0KPiArCSAqLw0KPiArCWlmICgoY3VyID09
IFZGSU9fREVWSUNFX1NUQVRFX1JVTk5JTkcgJiYgbmV3ID09DQo+IFZGSU9fREVWSUNFX1NUQVRF
X1NUT1ApIHx8DQoNCnRoaXMgaXMgbm90IHJlcXVpcmVkIHdoZW4gUDJQIGlzIHN1cHBvcnRlZC4g
dmZpb19taWdfZ2V0X25leHRfc3RhdGUoKSB3aWxsDQpmaW5kIHRoZSByaWdodCBhcmMgZnJvbSBS
VU5OSU5HIHRvIFJVTk5JTkdfUDJQIHRvIFNUT1AuDQoNCj4gKwkgICAgKGN1ciA9PSBWRklPX0RF
VklDRV9TVEFURV9SVU5OSU5HICYmIG5ldyA9PQ0KPiBWRklPX0RFVklDRV9TVEFURV9SVU5OSU5H
X1AyUCkpIHsNCj4gKwkJcmV0ID0geGVfc3Jpb3ZfdmZpb19zdG9wKHhlX3ZkZXYtPnBmLCB4ZV92
ZGV2LT52ZmlkKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCWdvdG8gZXJyOw0KPiArDQo+ICsJCXJl
dHVybiBOVUxMOw0KPiArCX0NCg0KYmV0dGVyIHRvIGFsaWduIHdpdGggb3RoZXIgZHJpdmVycywg
cy9zdG9wL3N1c3BlbmQvIGFuZCBzL3J1bi9yZXN1bWUvDQoNCj4gKw0KPiArCWlmICgoY3VyID09
IFZGSU9fREVWSUNFX1NUQVRFX1JVTk5JTkdfUDJQICYmIG5ldyA9PQ0KPiBWRklPX0RFVklDRV9T
VEFURV9TVE9QKSB8fA0KPiArCSAgICAoY3VyID09IFZGSU9fREVWSUNFX1NUQVRFX1NUT1AgJiYg
bmV3ID09DQo+IFZGSU9fREVWSUNFX1NUQVRFX1JVTk5JTkdfUDJQKSkNCj4gKwkJcmV0dXJuIE5V
TEw7DQo+ICsNCj4gKwlpZiAoKGN1ciA9PSBWRklPX0RFVklDRV9TVEFURV9TVE9QICYmIG5ldyA9
PQ0KPiBWRklPX0RFVklDRV9TVEFURV9SVU5OSU5HKSB8fA0KPiArCSAgICAoY3VyID09IFZGSU9f
REVWSUNFX1NUQVRFX1JVTk5JTkdfUDJQICYmIG5ldyA9PQ0KPiBWRklPX0RFVklDRV9TVEFURV9S
VU5OSU5HKSkgew0KPiArCQlyZXQgPSB4ZV9zcmlvdl92ZmlvX3J1bih4ZV92ZGV2LT5wZiwgeGVf
dmRldi0+dmZpZCk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlnb3RvIGVycjsNCj4gKw0KPiArCQly
ZXR1cm4gTlVMTDsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoY3VyID09IFZGSU9fREVWSUNFX1NUQVRF
X1NUT1AgJiYgbmV3ID09DQo+IFZGSU9fREVWSUNFX1NUQVRFX1NUT1BfQ09QWSkgew0KPiArCQlz
dHJ1Y3QgeGVfdmZpb19wY2lfbWlncmF0aW9uX2ZpbGUgKm1pZ2Y7DQo+ICsNCj4gKwkJbWlnZiA9
IHhlX3ZmaW9fcGNpX2FsbG9jX2ZpbGUoeGVfdmRldiwgWEVfVkZJT19GSUxFX1NBVkUpOw0KPiAr
CQlpZiAoSVNfRVJSKG1pZ2YpKSB7DQo+ICsJCQlyZXQgPSBQVFJfRVJSKG1pZ2YpOw0KPiArCQkJ
Z290byBlcnI7DQo+ICsJCX0NCj4gKw0KPiArCQlyZXQgPSB4ZV9zcmlvdl92ZmlvX3N0b3BfY29w
eV9lbnRlcih4ZV92ZGV2LT5wZiwgeGVfdmRldi0NCj4gPnZmaWQpOw0KPiArCQlpZiAocmV0KSB7
DQo+ICsJCQlmcHV0KG1pZ2YtPmZpbHApOw0KPiArCQkJZ290byBlcnI7DQo+ICsJCX0NCj4gKw0K
PiArCQlyZXR1cm4gbWlnZi0+ZmlscDsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoKGN1ciA9PSBWRklP
X0RFVklDRV9TVEFURV9TVE9QX0NPUFkgJiYgbmV3ID09DQo+IFZGSU9fREVWSUNFX1NUQVRFX1NU
T1ApKSB7DQo+ICsJCWlmICh4ZV92ZGV2LT5mZCkNCj4gKwkJCXhlX3ZmaW9fcGNpX2Rpc2FibGVf
ZmlsZSh4ZV92ZGV2LT5mZCk7DQo+ICsNCj4gKwkJeGVfc3Jpb3ZfdmZpb19zdG9wX2NvcHlfZXhp
dCh4ZV92ZGV2LT5wZiwgeGVfdmRldi0+dmZpZCk7DQo+ICsNCj4gKwkJcmV0dXJuIE5VTEw7DQo+
ICsJfQ0KPiArDQo+ICsJaWYgKGN1ciA9PSBWRklPX0RFVklDRV9TVEFURV9TVE9QICYmIG5ldyA9
PQ0KPiBWRklPX0RFVklDRV9TVEFURV9SRVNVTUlORykgew0KPiArCQlzdHJ1Y3QgeGVfdmZpb19w
Y2lfbWlncmF0aW9uX2ZpbGUgKm1pZ2Y7DQo+ICsNCj4gKwkJbWlnZiA9IHhlX3ZmaW9fcGNpX2Fs
bG9jX2ZpbGUoeGVfdmRldiwNCj4gWEVfVkZJT19GSUxFX1JFU1VNRSk7DQo+ICsJCWlmIChJU19F
UlIobWlnZikpIHsNCj4gKwkJCXJldCA9IFBUUl9FUlIobWlnZik7DQo+ICsJCQlnb3RvIGVycjsN
Cj4gKwkJfQ0KPiArDQo+ICsJCXJldCA9IHhlX3NyaW92X3ZmaW9fcmVzdW1lX2VudGVyKHhlX3Zk
ZXYtPnBmLCB4ZV92ZGV2LQ0KPiA+dmZpZCk7DQo+ICsJCWlmIChyZXQpIHsNCj4gKwkJCWZwdXQo
bWlnZi0+ZmlscCk7DQo+ICsJCQlnb3RvIGVycjsNCj4gKwkJfQ0KPiArDQo+ICsJCXJldHVybiBt
aWdmLT5maWxwOw0KPiArCX0NCj4gKw0KPiArCWlmIChjdXIgPT0gVkZJT19ERVZJQ0VfU1RBVEVf
UkVTVU1JTkcgJiYgbmV3ID09DQo+IFZGSU9fREVWSUNFX1NUQVRFX1NUT1ApIHsNCj4gKwkJaWYg
KHhlX3ZkZXYtPmZkKQ0KPiArCQkJeGVfdmZpb19wY2lfZGlzYWJsZV9maWxlKHhlX3ZkZXYtPmZk
KTsNCj4gKw0KPiArCQl4ZV9zcmlvdl92ZmlvX3Jlc3VtZV9leGl0KHhlX3ZkZXYtPnBmLCB4ZV92
ZGV2LT52ZmlkKTsNCj4gKw0KPiArCQlyZXR1cm4gTlVMTDsNCj4gKwl9DQo+ICsNCj4gKwlpZiAo
bmV3ID09IFZGSU9fREVWSUNFX1NUQVRFX0VSUk9SKQ0KPiArCQl4ZV9zcmlvdl92ZmlvX2Vycm9y
KHhlX3ZkZXYtPnBmLCB4ZV92ZGV2LT52ZmlkKTsNCg0KdGhlIEVSUk9SIHN0YXRlIGlzIG5vdCBw
YXNzZWQgdG8gdGhlIHZhcmlhbnQgZHJpdmVyLiBZb3UnbGwgZ2V0IC1FSU5WQUwgDQpmcm9tIHZm
aW9fbWlnX2dldF9uZXh0X3N0YXRlKCkuIHNvIHRoaXMgaXMgZGVhZCBjb2RlLg0KDQpJZiB0aGUg
cGYgZHJpdmVyIG5lZWRzIHRvIGJlIG5vdGlmaWVkLCB5b3UgY291bGQgY2hlY2sgdGhlIHJldCB2
YWx1ZSBpbnN0ZWFkLg0KDQo+ICtzdGF0aWMgdm9pZCB4ZV92ZmlvX3BjaV9taWdyYXRpb25faW5p
dChzdHJ1Y3QgdmZpb19kZXZpY2UgKmNvcmVfdmRldikNCj4gK3sNCj4gKwlzdHJ1Y3QgeGVfdmZp
b19wY2lfY29yZV9kZXZpY2UgKnhlX3ZkZXYgPQ0KPiArCQljb250YWluZXJfb2YoY29yZV92ZGV2
LCBzdHJ1Y3QgeGVfdmZpb19wY2lfY29yZV9kZXZpY2UsDQo+IGNvcmVfZGV2aWNlLnZkZXYpOw0K
PiArCXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2Rldihjb3JlX3ZkZXYtPmRldik7DQo+
ICsNCj4gKwlpZiAoIXhlX3NyaW92X3ZmaW9fbWlncmF0aW9uX3N1cHBvcnRlZChwZGV2LT5waHlz
Zm4pKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwkvKiB2ZmlkIHN0YXJ0cyBmcm9tIDEgZm9yIHhl
ICovDQo+ICsJeGVfdmRldi0+dmZpZCA9IHBjaV9pb3ZfdmZfaWQocGRldikgKyAxOw0KDQpwY2lf
aW92X3ZmX2lkKCkgcmV0dXJucyBlcnJvciBpZiBpdCdzIG5vdCB2Zi4gc2hvdWxkIGJlIGNoZWNr
ZWQuDQoNCj4gK3N0YXRpYyBpbnQgeGVfdmZpb19wY2lfaW5pdF9kZXYoc3RydWN0IHZmaW9fZGV2
aWNlICpjb3JlX3ZkZXYpDQo+ICt7DQo+ICsJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lf
ZGV2KGNvcmVfdmRldi0+ZGV2KTsNCj4gKw0KPiArCWlmIChwZGV2LT5pc192aXJ0Zm4gJiYgc3Ry
Y21wKHBkZXYtPnBoeXNmbi0+ZGV2LmRyaXZlci0+bmFtZSwgInhlIikNCj4gPT0gMCkNCj4gKwkJ
eGVfdmZpb19wY2lfbWlncmF0aW9uX2luaXQoY29yZV92ZGV2KTsNCg0KSSBkaWRuJ3Qgc2VlIHRo
ZSBwb2ludCBvZiBjaGVja2luZyB0aGUgZHJpdmVyIG5hbWUuDQoNCj4gKw0KPiArTU9EVUxFX0xJ
Q0VOU0UoIkdQTCIpOw0KPiArTU9EVUxFX0FVVEhPUigiSW50ZWwgQ29ycG9yYXRpb24iKTsNCg0K
cGxlYXNlIHVzZSB0aGUgYXV0aG9yIG5hbWUsIGFzIG90aGVyIGRyaXZlcnMgZG8NCg==
