Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22D4B05060
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 06:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F68510E14E;
	Tue, 15 Jul 2025 04:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5m/tGOg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1D310E14B;
 Tue, 15 Jul 2025 04:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752554367; x=1784090367;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WpWMBraFCoM6JmfnrJ+XaqFsm7o9aqmtQoK/DDu9xMw=;
 b=f5m/tGOgNti2F806tpOZ7L/Jeft/qtCPtN16YjUaGED13cnVCxbKszhY
 66wr01rdvhcYtYw5Mr9QyG/PDoRyn631KwqMVEWxHy3yAo6n3bniBcDty
 n+aX3OADx4VVT3LkH+1VPhQ/aYb4ODwVOf7S4KtBENt/ZiCeA942hBl6x
 bri/zlWg2JFGCQ/cqZYdZATGcCTfKpgoByoTWAUd4EK4++v1nPfWo2FP6
 FJ4IrjbgPM78aE+/6kyuhEwI9evllncn5fckfy0mU3rOQ6hgrRndrmuz1
 KO8lSBES8ciBxhRMregwyhpKVbmBF3BD0Kbr+ZDmq90HQ2eirjodrKRRY Q==;
X-CSE-ConnectionGUID: wzR6UYybQkmVrwknO5lU/Q==
X-CSE-MsgGUID: OmBhSPVSQV+FRLfKK7C3Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="72337963"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="72337963"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 21:38:30 -0700
X-CSE-ConnectionGUID: 6ywXrY6YQlaYNdCUTN/iGg==
X-CSE-MsgGUID: 3IQuOvXUS6m22rIZmDr4cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="157220676"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 21:38:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 14 Jul 2025 21:38:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 14 Jul 2025 21:38:29 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 21:38:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5FkEIZ+W6nU8fYBGOgOA6f4+JSVcV1UPkr+8T2AcL0HQXE3/WtfbEeS1ruY89SLL8fvWQprM+kObUAzfyawXCGo2dhpyZR7PIfk4RhRn9yao6lmV0f2MLB/6oW7UdbTL9n/Iyobv2WIeLrXMcvgfSC8bDX/QWv9X28egCNxjXF5qLpGlkVUnTQXrdHOnHOpzQKd6+GwtHALoOOI9FbHkmFP4SsboyWvATbwJrv62tTSv+E1bZIk6WGC2Bo9yoQfz/5hoWs/alWNkHY+SkQayBxFtApWrNPo45IHPNNjM6XDC/0xvdEqnt6K4xrVEtK/UennKaZPiZSO+kuOqj083w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpWMBraFCoM6JmfnrJ+XaqFsm7o9aqmtQoK/DDu9xMw=;
 b=cf5rmXvXNIB/TdVuG90WE3/FRNHZ7bz1sdx+kJG4fvqbFjEAeNW5KFgA0RJ1zlr6BxlcRZIyzIUj3Y1Or09gSA0WLa5en9fP7drBk46x/ozkRtyXUhT74URHFq+EcgbNQ1+kQzhJFHMON5Sip/qYHEYcY5vuMJfE/3CcQ3H+3FFTRPEVOMZczkAFEIMN6NWBYh+nNB7ptWsvPei+gv/z0BEMxvgkqkSgyPWPUfq69PQqqtRZL14WQJoKTW6iYG6wvalth85vurZ953cmZqM0FzusND58FyM+uKK7E1StoA1jfFLuW033SiS+fLlIlQduzuOvIZcgdjTBpRUglZMwSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA0PR11MB7750.namprd11.prod.outlook.com (2603:10b6:208:442::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Tue, 15 Jul
 2025 04:37:59 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8857.020; Tue, 15 Jul 2025
 04:37:59 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Alex Hung <alex.hung@amd.com>, Simon Ser <contact@emersion.fr>, "Shankar, 
 Uma" <uma.shankar@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "wayland-devel@lists.freedesktop.org" <wayland-devel@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, "leo.liu@amd.com"
 <leo.liu@amd.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "pekka.paalanen@collabora.com"
 <pekka.paalanen@collabora.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "agoins@nvidia.com" <agoins@nvidia.com>,
 "joshua@froggi.es" <joshua@froggi.es>, "mdaenzer@redhat.com"
 <mdaenzer@redhat.com>, "aleixpol@kde.org" <aleixpol@kde.org>,
 "xaver.hugl@gmail.com" <xaver.hugl@gmail.com>, "victoria@system76.com"
 <victoria@system76.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_naseer@quicinc.com" <quic_naseer@quicinc.com>,
 "quic_cbraga@quicinc.com" <quic_cbraga@quicinc.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "marcan@marcan.st"
 <marcan@marcan.st>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>,
 "sashamcintosh@google.com" <sashamcintosh@google.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>,
 "arthurgrillo@riseup.net" <arthurgrillo@riseup.net>
Subject: RE: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
Thread-Topic: [PATCH V10 33/46] drm: Add Enhanced LUT precision structure
Thread-Index: AQHb30AAJLHwA8CO4EyfEs1O7PT3RLQodneAgATM1gCABYBKoA==
Date: Tue, 15 Jul 2025 04:37:58 +0000
Message-ID: <SJ1PR11MB612940940934BD8499DA179FB957A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250617041746.2884343-1-alex.hung@amd.com>
 <20250617041746.2884343-34-alex.hung@amd.com>
 <Mk2DCOdpZ75QLmGiZYM8GfnoMHRIGsx2S0_gzq2ryBHKEfLQMP5ArB3s94s8NYyci5xYBPN1md01QaUOqqlwKb3KxJIBRxMLO9yjoitMVJc=@emersion.fr>
 <9e116b0d-c46c-41f5-a953-7d17d22c98c5@amd.com>
In-Reply-To: <9e116b0d-c46c-41f5-a953-7d17d22c98c5@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA0PR11MB7750:EE_
x-ms-office365-filtering-correlation-id: 3a90bea9-9f4c-43ca-6762-08ddc359603a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?YzcvU2xRZGpPbW1JckNpR3FMYVo1dGxjdSt4WlNENWQreks0ZUdnYWlrOGdk?=
 =?utf-8?B?V0drUU5pVUFwelRFUTNoMXBIZ0cvNkpJVzNZcnJHcjNSbmpSU2dEV0g3Q3Vw?=
 =?utf-8?B?WCt2K0tPOVVIUGhSK2V2Mm9kRFNjQ3NwQ3B4R3d4YTBITHNZSHZSM3U4aU95?=
 =?utf-8?B?TVQrL3BWcm1UOE1wYnhBNURPQ2hMaUE0VFJtL1l5RmhqbEhZZ0h3VHEvUU1l?=
 =?utf-8?B?c2NndHJUSWRRZ3ZVN1g4TFVJVWZQTkZXM1UxckdKWk9WRUxFTnlqT2szUHBl?=
 =?utf-8?B?enRGUEVOb1VRTG1IamRYNG5Qdklwa2ZpTk80TDdIdjJCM29McHVjQmpoaWNT?=
 =?utf-8?B?NFdqeUtWbXNOUGtOdk1mRmVSdlFtRXROK2tMNjY2V3ZWelpmaHZJTStycUtm?=
 =?utf-8?B?d1N1QmF1YmNCZlVoQzNwcjRMYzlzais4QmY1UVhKUUF0eFIvNXJUYTVEcUZ0?=
 =?utf-8?B?YzF6SlZXWU9zY1JyTjREM2cvYkhaNkFWN1lyZHpQcUhBOFZNWEMvZlNVN0J4?=
 =?utf-8?B?YzlNbjA3WTkvbTNDQmIwOWdLMVBrTnQ4Y3lpREZyZVhGdjVlK0R0YlB4WHhW?=
 =?utf-8?B?bWdta3llRGlLZmlGN1RoYWZkdmhpVG9pKzdDU2JWQXZrSUI0Wk11blJTbjB5?=
 =?utf-8?B?WFBYcEdjYWhIVUVwVEZzeHJOOHhyTFNWeGNhUUVPWnBORXJCM29QMzB0Vzl5?=
 =?utf-8?B?QVpLZVZwTjJQd0ZjcTNiY1RCQlpRQUNBdTF6Qi9KSlF5UmJMK0hKTkNYOTQ0?=
 =?utf-8?B?a3hhMjFNcHNRMHhxY2JMeDRBQlI3MExHQ3ltQ04vYXpvZER4YkhnQUczRXhs?=
 =?utf-8?B?RURMenkxcDJCaXA4ejJabXBORi94M1Jvb0ZINHljV1pDamZoK1FKRTlySlVF?=
 =?utf-8?B?c3JKK0F1TGszeWt3dnhjVW43cHlWU1hjMmtQRTMzNkZpbHRxRDZLaTF3aDVO?=
 =?utf-8?B?QmFWQ3NzeDgybEZKNk1LWCtyMXYvMkdyZmM0VHp4dXkrdU13MXFCOG9pdkFp?=
 =?utf-8?B?c0lJUEpGakVNWHVtS3Znb21CcmkwQmc5ZDgzVHRxUVAzNlc4aHRheU9FNWV3?=
 =?utf-8?B?VUMrMS9FaWtSS1pIdkpKOTQxY0lyNWN1SE5kRFFSeXBSdm1CZ1owcTI5Undu?=
 =?utf-8?B?bnJRSEJZTUdRK0FhM3V2dkoyeHJmUUNFSmNTd2p1YVhHaDNvZk5MVy9Fd1ZP?=
 =?utf-8?B?NXV3QXFCTGVtRjY3d1NhRCtPQXhvY3phSzNCV2h3SnFrWS9FT0VtTWcwbzJr?=
 =?utf-8?B?NmdSZ3lKTGgrNThzYk9ZMTd5M0s3VnBsQmFsbFZXWmdCVHI2Q0FRK3BmZlcr?=
 =?utf-8?B?aENsYTZLT0lwSFRpYVVELzE4YnRGaXpUekhVa3BiL0tERW5EeHVlYUk1Vldr?=
 =?utf-8?B?K3JqZ2J6dm84YmtwSDBjeXpKWml6dFovRWxNeTRQaEwyZ2hmSGIzK0UzQXBL?=
 =?utf-8?B?b0ZlWFg4bzNWQmNRSitJK0VZN1VvZkVxNEEvalJRdi9jUDd3Mzh0QTRac0Iz?=
 =?utf-8?B?Um54bUxTSVBvYk95cnp4ZzMybVNkSHRGaW5SSjZseUtKK0RHbDBRcVZ1RzB5?=
 =?utf-8?B?dzQ5cTlGd1UyVWtxZlZxUDFUcHJSaGRZNjY3WU9DczFQcGlEUnBhVFRZSVlh?=
 =?utf-8?B?d1JZcS9LT3JwN0RjbjVEbXVVRy90QUVlUlFEZ3NEYTNPUGRKM05OZ1hiS1VY?=
 =?utf-8?B?Mjl3MExuSkdmTy9GNERYSDBOQVJHUUNCNVVoQlJGN1dmZVl6TGRkczVncTBG?=
 =?utf-8?B?UDUrd0dvNyt2WWFlYkRrcXU2WThzZE1lU05RRWNoRm5CeUNoeFFHa3lqMjlY?=
 =?utf-8?B?aGhOVTQzZEUwaXBmSDhnZEQzU0pHdFIzSTBaZWFkMXAzRzlVaC9qRWtYNVBF?=
 =?utf-8?B?UHFNV1ZmakdRT3lKSGk2SUlZNnlCajM4cmZmOW5nbUlFb09RWjNVVFg1MmpF?=
 =?utf-8?B?K08rMkRHTVBmWjhhTWRVT29hN3JaWGJOOWUyNHl6LzljZjkwRHZ6NHVTdDhk?=
 =?utf-8?B?ei9xY2tONWh3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tk9ud3RsOUQ1M0dqUTBSWHBoZ21OTDJzK2hSYjBWV1BnZzR4U0hqYy9BNGdS?=
 =?utf-8?B?UjlRd0VHbGh1Sk1IMTlXWUV4ejg0TWdqWnNJNC9pUEJDdm4zSlBoUnlTSVZS?=
 =?utf-8?B?blduQWFPOWsvbnB1RUVtaUwvUGZDeHlMdys1aTdwTG1SMmpOWGVNTTFPcm41?=
 =?utf-8?B?UFd6TmVRbml3c0dvaVhHR2hnSEtySHBRelc5TjlDM1Z5VjFXS1BVSFk2eStB?=
 =?utf-8?B?eEMvb2dURGZ4UXM3eW5DTDdzeURwaXJocjJablpobFFZTXRzSy9JWEtJL0Qz?=
 =?utf-8?B?ci93YVUvbjROOElLMDdPTUl4QkIzZmo4eUJ0RGxYeE1RSjJpTncwVllFT09q?=
 =?utf-8?B?QllHcXg0R0dUeDAzandnNzQ1ckVEMEhNZlJDWWs0TitIT08wc0NXTWFmdXBS?=
 =?utf-8?B?SFlVa09hekdZdXB3b2llbWR6U0pOS1BBMUp0R0QrVENiTE93R1VINC9SMVhI?=
 =?utf-8?B?Vi9BRVRXWW85dFB0OCtjajdLbmx4SW8yV0NVcElWbVhZVkhLOXB0alMwMTlK?=
 =?utf-8?B?a0xtaXY2amZOVEkyeTFzRmpKaGJqTWJsSTJ3QmVTc1dxditwRHFVVkIyM3V4?=
 =?utf-8?B?RmM0UGxsNTYxNlMyc2tjUDBHWm5RWkpLL25TOXNES3JMRkRBSlBxVzNsT0xn?=
 =?utf-8?B?c1J5U2JqMjJmY2RQMGt2WGRHeDRJYjhpRGtCb0E0ektXRVpHOHZwaTF6M25C?=
 =?utf-8?B?T2gxdGlOTFpwaERWL0kxOFFZdldqVmMzTVdNejFpMEJkcG8xWnhIVFRFekxP?=
 =?utf-8?B?NzV1MlYwYXJ3empNOW5MU3c0QnpMQWxwTHlIU003UUFpNmd0cTNYenA5blVk?=
 =?utf-8?B?SDU3VlZJdi9QbnBwQzg1bnZRd0pXOTZDb3hoR24yTFVxR29uSlFJNmplWkRM?=
 =?utf-8?B?M3JPcnZLaTVXQi9hQ09wMldXWFlRcVYxMS8rYlRDMG9jZTlwWVBNQ0F2bWsx?=
 =?utf-8?B?VjFEbFA4UHdLNFNmYkx3Smh4Ly9pV05NekZ2cDBSOENEVnIxckhXcFpVbjV5?=
 =?utf-8?B?VlplY0VTYkRTOERoN2Z1TGMrQXNJRmxBWG0xYnlwSXROS0FjN1FCRlB1WENi?=
 =?utf-8?B?WXFEU05ob21GMzRBQ2loTkE5a1V1TEFFM1dIbVo5RDRnQTJjMGpGanFRWmJ5?=
 =?utf-8?B?NkJZNkt5YmwrQzJuLytianZuU3N2WXAwK29mMDREYXB3V21rUFhPTEJkMFZG?=
 =?utf-8?B?TEk2bnduK1BaaEdkNmV5WmpOSmtNd1l4OGsxdmhsYzJRdldDaEZSVWF6YVov?=
 =?utf-8?B?OWdrL2M1Rjd5c2ZwUkhtczIyenV5Kzh6MmsyZE4zTW9rRVI3cFo1cUVXMVdC?=
 =?utf-8?B?azIzZzlHRUdEdlNyRnhuVEYyTXJXM3YwQURLSkt3T25TZmJobEcwekJweHNU?=
 =?utf-8?B?REdoWkk1R3FLbzkrQzFkVkx4R0lkTVExNDB3U1B3Ni9KS3IzZlorZk9haUdQ?=
 =?utf-8?B?dmNaTjJ3SDJJT2lqUTBvNDUzc21HbVFBK0ZBZWdueFdmRk80Zm1jcURWcjhT?=
 =?utf-8?B?cmFmdkRSblBtdmdoQVVuMXlBN3NMK1ZiRDFlbUFIVldJSUMvTGZ0djFSdHVE?=
 =?utf-8?B?enQ0U1c0WTJlaHMxUHZ1a3QyQzFOdXlwUndUK0NNalRiS05iMTYyRzZYT3lN?=
 =?utf-8?B?VlJweWQzdmd2RTBJN213QVh4VTRqU3IveU9kNVg5V0JENnM2VHNhNTQ5REpl?=
 =?utf-8?B?aUlxbjVMOWhaWVM1citma0gzYnMwTW80SytHSFdpWmIzOGdVc3YrQndzU0Va?=
 =?utf-8?B?UGJDOGo5b3JNdUZxaDlkbXFJSTJyTUlqMXpHaWtDRGN0NDVOU0d0UzhQUlBU?=
 =?utf-8?B?LzkzaGJUb3dnd3RsejlZTFcwUEJlZE1kOFlDTHgyTEd2TXZvOXJSTXhmTGdi?=
 =?utf-8?B?NlpGS3RBNVk3ZGdnYWdKR1JRSlp3NUZXSlEvZDBFOFVOS0I1bUlzOHd4M2h3?=
 =?utf-8?B?ckJRcDBhV3VkbStrejg2WE5RV1hPcWR0Mmc2VkVUWkcyM084aVM4VzF1OUZq?=
 =?utf-8?B?cjEraXh3eUp4WE9tdmxBcEFqODlhWlF4UnVoMWpHSGQ2eDFMWHZWcTlUbGI3?=
 =?utf-8?B?WDBHajNPQU1UNzNSeTdydk4xRktzQ2dmcUs2REhBRlQvVFExQVlvWTViQS9N?=
 =?utf-8?B?U0w3WXVqUU9TcXc0S29pYUJTaEwxR2trK0NkU0psS3hpbXpWMWEvQzJCcTB4?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a90bea9-9f4c-43ca-6762-08ddc359603a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 04:37:59.0081 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uGGQ7pDw/2tyVf3qvFWGfjYBa+Y7qsFhsUNNjgL2Gw/22GF37UPoHD7tKghKwkkkSxhBlYaA2nkshDLIlInA4BYbferA3OMqDFapazku3i8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7750
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleCBIdW5nIDxhbGV4
Lmh1bmdAYW1kLmNvbT4NCj4gU2VudDogRnJpZGF5LCBKdWx5IDExLCAyMDI1IDk6NTkgUE0NCj4g
VG86IFNpbW9uIFNlciA8Y29udGFjdEBlbWVyc2lvbi5mcj47IFNoYW5rYXIsIFVtYQ0KPiA8dW1h
LnNoYW5rYXJAaW50ZWwuY29tPg0KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IHdheWxhbmQtDQo+IGRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgaGFycnkud2VudGxhbmRAYW1kLmNvbTsgbGVvLmxpdUBhbWQuY29t
Ow0KPiB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbTsgcGVra2EucGFhbGFuZW5AY29sbGFi
b3JhLmNvbTsNCj4gbXdlbkBpZ2FsaWEuY29tOyBqYWRhaGxAcmVkaGF0LmNvbTsgc2ViYXN0aWFu
LndpY2tAcmVkaGF0LmNvbTsNCj4gc2hhc2hhbmsuc2hhcm1hQGFtZC5jb207IGFnb2luc0Budmlk
aWEuY29tOyBqb3NodWFAZnJvZ2dpLmVzOw0KPiBtZGFlbnplckByZWRoYXQuY29tOyBhbGVpeHBv
bEBrZGUub3JnOyB4YXZlci5odWdsQGdtYWlsLmNvbTsNCj4gdmljdG9yaWFAc3lzdGVtNzYuY29t
OyBkYW5pZWxAZmZ3bGwuY2g7IHF1aWNfbmFzZWVyQHF1aWNpbmMuY29tOw0KPiBxdWljX2NicmFn
YUBxdWljaW5jLmNvbTsgcXVpY19hYmhpbmF2a0BxdWljaW5jLmNvbTsgbWFyY2FuQG1hcmNhbi5z
dDsNCj4gTGl2aXUuRHVkYXVAYXJtLmNvbTsgc2FzaGFtY2ludG9zaEBnb29nbGUuY29tOyBCb3Jh
aCwgQ2hhaXRhbnlhDQo+IEt1bWFyIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwuY29tPjsg
bG91aXMuY2hhdXZldEBib290bGluLmNvbTsNCj4gYXJ0aHVyZ3JpbGxvQHJpc2V1cC5uZXQNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCBWMTAgMzMvNDZdIGRybTogQWRkIEVuaGFuY2VkIExVVCBwcmVj
aXNpb24gc3RydWN0dXJlDQo+IA0KPiANCj4gDQo+IE9uIDcvOC8yNSAxMToxMCwgU2ltb24gU2Vy
IHdyb3RlOg0KPiA+IE9uIFR1ZXNkYXksIEp1bmUgMTd0aCwgMjAyNSBhdCAwNjoyNiwgQWxleCBI
dW5nIDxhbGV4Lmh1bmdAYW1kLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaA0KPiA+PiBiL2luY2x1ZGUvdWFwaS9kcm0vZHJt
X21vZGUuaCBpbmRleCA2NTFiZGY0OGI3NjYuLjIxYmQ5NmY0MzdlMA0KPiAxMDA2NDQNCj4gPj4g
LS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oDQo+ID4+ICsrKyBiL2luY2x1ZGUvdWFw
aS9kcm0vZHJtX21vZGUuaA0KPiA+PiBAQCAtODcyLDYgKzg3MiwxNiBAQCBzdHJ1Y3QgZHJtX2Nv
bG9yX2x1dCB7DQo+ID4+ICAgCV9fdTE2IHJlc2VydmVkOw0KPiA+PiAgIH07DQo+ID4+DQo+ID4+
ICtzdHJ1Y3QgZHJtX2NvbG9yX2x1dF8zMiB7DQo+ID4NCj4gPiBTdWJqZWN0aXZlIG5pdDogSSB3
b3VsZCBwZXJzb25hbGx5IHByZWZlciAibHV0MzIiIG92ZXIgImx1dF8zMiIsIGJ1dA0KPiA+IHRo
YXQncyB2ZXJ5IGRlZXAgaW50byBiaWtlLXNoZWRkaW5nIHRlcnJpdG9yeS4gRmVlbCBmcmVlIHRv
IGlnbm9yZS4NCj4gDQo+IEkgdGhpbmsgaXQncyBhIGdvb2QgaWRlYS4NCj4gDQo+IEkgZ290IHRo
aXMgZnJvbSBVbWEncyBwYXRjaHNldC4gSSB3aWxsIHN5bmMgdXAgd2l0aCBoaW0gdG8gYXZvaWQg
ZnV0dXJlDQo+IGNvbmZsaWN0cy4NCj4gDQoNCkp1c3QgZm9yIHRoZSByZWNvcmQsIHdlIHRvb2sg
c29tZSBpbnNwaXJhdGlvbiBmcm9tIHN0cnVjdCBkcm1fY29sb3JfY3RtXzN4NCBmb3IgdGhpcy4N
ClRoYXQgc2FpZCwgSSBkb27igJl0IG1pbmQgdGhlIGJpa2Utc2hlZGRpbmcg4oCUIG5hbWluZyB0
aGluZ3MgaXMgaGFsZiB0aGUgZnVuIGFueXdheS4gSGFwcHkgdG8gZ28gd2l0aCBsdXQzMiBpZiB0
aGF0IGxvb2tzIGJldHRlciENCg0KQFVtYSBmZWVsIGZyZWUgdG8gZGlzYWdyZWUuDQoNClJlZ2Fy
ZHMNCg0KQ2hhaXRhbnlhDQoNCj4gPg0KPiA+PiArCS8qDQo+ID4+ICsJICogU2ltaWxhciB0byBk
cm1fY29sb3JfbHV0IGJ1dCBmb3IgaGlnaCBwcmVjaXNpb24gTFVUcw0KPiA+PiArCSAqLw0KPiA+
DQo+ID4gSW5zdGVhZCBvZiB0aGlzIGNvZGUgY29tbWVudCwgd291bGQgYmUgbmljZXIgdG8gaGF2
ZSBhIHByb3BlciBkb2MNCj4gY29tbWVudC4NCj4gPiBJbiBkb2MgY29tbWVudHMsICJzdHJ1Y3Qg
WFhYIiBpcyBlbm91Z2ggdG8gY3JlYXRlIGEgbGluay4gKHN0cnVjdA0KPiA+IGRybV9jb2xvcl9s
dXQgZG9lc24ndCBoYXZlIGEgZG9jIGNvbW1lbnQsIGJ1dCBoYXMgYmVlbiBpbnRyb2R1Y2VkIGFn
ZXMNCj4gPiBhZ28uKQ0KPiA+DQo+ID4gImhpZ2ggcHJlY2lzaW9uIiBpcyBhIGJpdCBzdWJqZWN0
aXZlLCBwcm9pYmFibHkgIjMyLWJpdCBwcmVjaXNpb24iDQo+ID4gd291bGQgYmUgYmV0dGVyLg0K
PiA+DQo+ID4+ICsJX191MzIgcmVkOw0KPiA+PiArCV9fdTMyIGdyZWVuOw0KPiA+PiArCV9fdTMy
IGJsdWU7DQo+ID4+ICsJX191MzIgcmVzZXJ2ZWQ7DQo+ID4+ICt9Ow0KPiA+PiArDQo+ID4+ICAg
LyoqDQo+ID4+ICAgICogZW51bSBkcm1fY29sb3JvcF90eXBlIC0gVHlwZSBvZiBjb2xvciBvcGVy
YXRpb24NCj4gPj4gICAgKg0KPiA+PiBAQCAtODc5LDYgKzg4OSw3IEBAIHN0cnVjdCBkcm1fY29s
b3JfbHV0IHsNCj4gPj4gICAgKiBhbmQgZGVmaW5lcyBhIGRpZmZlcmVudCBzZXQgb2YgcHJvcGVy
dGllcy4gVGhpcyBlbnVtIGRlZmluZXMgYWxsIHR5cGVzDQo+IGFuZA0KPiA+PiAgICAqIGdpdmVz
IGEgaGlnaC1sZXZlbCBkZXNjcmlwdGlvbi4NCj4gPj4gICAgKi8NCj4gPj4gKw0KPiA+DQo+ID4g
Tml0OiBwcm9iYWJseSB0aGlzIGV4dHJhIG5ld2xpbmUgc2hvdWxkIGdldCBkcm9wcGVkPw0KPiA+
DQo+ID4+ICAgZW51bSBkcm1fY29sb3JvcF90eXBlIHsNCj4gPj4gICAJLyoqDQo+ID4+ICAgCSAq
IEBEUk1fQ09MT1JPUF8xRF9DVVJWRToNCj4gPj4gLS0NCj4gPj4gMi40My4wDQoNCg==
