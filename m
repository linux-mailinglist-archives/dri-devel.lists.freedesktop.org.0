Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE60FA0B0F1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 09:22:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4B110E4C4;
	Mon, 13 Jan 2025 08:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DYY0qnsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C139C10E4C4;
 Mon, 13 Jan 2025 08:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736756543; x=1768292543;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GKGgpUbsDzw7FhyiT3ErAMn7Q+VX7A2G8dLu92Fop3w=;
 b=DYY0qnsMHEbcQS5s6gSHXTMDlxCF2NvQzRP5kr8TTFuL2XBruCSeHsSD
 5oRwGjZoZmVR1oCjfAopY35VIDYZ5/27SVlBz4u3+KmEH2AqpQ49O4Mt1
 Y6uYZeLagbPYtX3Qbcxrv1U7u7QAX2xQlepLzxh1A6Ko44KdhW4LTVqzS
 4Qp87CLGQnes/ARkWP8aGR2yvZmHlvAxJej1LjWvRbJGM8HLdg7tzZ+y/
 +LysrUWU3vP325x6zDnNEU2zDxkmiReTUy1pI1Tgv1F1MhI1vzmjt0p80
 /v7WTh+XOyoAulE2HipiyrrDXHfdUQyqPIZ3aKUdKvR4C5FM7xbQqq0Mi A==;
X-CSE-ConnectionGUID: uPVJihv6RKaKrg1j0r21Iw==
X-CSE-MsgGUID: oNFJCPZwSxig5kPmnvHifg==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="62378949"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="62378949"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 00:22:13 -0800
X-CSE-ConnectionGUID: x5e1F7X0SJGkuA77uKqbCQ==
X-CSE-MsgGUID: WkwZCHwhTS+hF02z1V2Q8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104561573"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 00:22:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 00:22:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 00:22:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 00:22:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IW+xQxMNxPl0MpgvEV3HtIhF3qH3cKltG+QMdPoaYfEb3vnLL+MRd16fbHFgxxSZVR3Qqz4oFffI1Ty80dwRgUKHPCb0lgzdjKl9r5dzFOM7BS3ie0ngf6Mf40jJ+/MMrt+RVKs3FuqBhPgBzsVzSXetF9lfI2sXkcUcrySTLR/hoLbaQXgXrD+SVUmutcKyZp4gX0n+CJARBQRCDVhqsVlmiV7kdn/xZUmD3rJdpCvXZDNv79fbpEGaRUxevHgTAcTRN+k0UiYKnNAuqu1lX4RQ4fZphooen0BK4IPFa9rJz3hj9mtVPG/ScKdm8q87QnElgN6nTBrEGeR6LtcUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKGgpUbsDzw7FhyiT3ErAMn7Q+VX7A2G8dLu92Fop3w=;
 b=Be56K2fN5v+bW2iW0fzjFPdXrRadsIb6wRIxLrq26AVzD1FtXz8f0TMFOHfRBdVtVDNGcmfzYWBls5Us8zm4l3/si7ccfB+R7tg7twDpoOP4vtf7uovbDMiPRuZ8xRHWVq5Jp9F/0TGyBtwIc1cEWX7Onc644pIkCD2O854ldSRxYVlkgzegXpQikXoeiBMIUCWiltKUXsyQqpdVtt5J3jBUgH78p9Owj+1E47s3cWaVB3gJMQSbuo8CvMQ+zjk6qVpSpkm4wt6NLctbIdddHHDJ9ojm+0774jDTkOj2zrHzDReYMjh4Yaqn30GS3xZAzGsD3fI45+QLy+vu/Ktkpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MN0PR11MB6158.namprd11.prod.outlook.com (2603:10b6:208:3ca::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 08:22:05 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 08:22:05 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Topic: [PATCH v3 2/5] drm/plane: Expose function to create
 format/modifier blob
Thread-Index: AQHbYZGzhgFMA5eT/kS28E0OXJhdlLMSzOiAgAGIAJA=
Date: Mon, 13 Jan 2025 08:22:05 +0000
Message-ID: <IA0PR11MB7307837C9E598D7E2563750EBA1F2@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
 <20250108-asyn-v3-2-f4399635eec9@intel.com>
 <SJ1PR11MB6129D345A6E295DF51F48643B91E2@SJ1PR11MB6129.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6129D345A6E295DF51F48643B91E2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MN0PR11MB6158:EE_
x-ms-office365-filtering-correlation-id: c6015bb7-9f94-4a23-8782-08dd33ab5d21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MHRjT3piV1RscnBsTG82SkpNSjVVMFZncnQvU2g5Z3FlVVdBRUJzRmxJbVVR?=
 =?utf-8?B?ZzRUVDI2aWR1N2lnbnJRQXdhOFl2NFJzV0FycmxDSzFDby9yMjRPR1huRzN5?=
 =?utf-8?B?OTE4N0JuSE1HYlpqY0hQSUlyOHhvakpFMlpIK1VDSzJqVjY3bkVDenQzcHRm?=
 =?utf-8?B?eG5jMHFGem9RcHpjNnRCOFJ0a2kvRmpVem9BVk9WWExudnlDdmw4SjE5ZmlU?=
 =?utf-8?B?VkI2K1J2RjZOdjVIUVpzcVdyMDFPdFlGUzdML253dzFwQWd1cUJtRzNRZEMy?=
 =?utf-8?B?NWZZeUtwY1dKcHBCSTBGUnBIZGN1ZmVOeTY4QkxtUG8zNUlMSFVEYW1xcVVO?=
 =?utf-8?B?ZnJyV1JwQW42TENyVmZ0Q2NiWFFTOEpnK1ZtdGl4TDc1VUJVdnovdyt0VXBw?=
 =?utf-8?B?NnQ2SWduMkNLcGI0OHk0WFNJemdNNFNKWncvdGNKWGJRN25pVnU2dmY2VW9E?=
 =?utf-8?B?UVdEaUlzeEhwM2ZGdmhCNTBCdkZTcUprNytUeU9KcjZwenZwNkFVTFZTM2VB?=
 =?utf-8?B?Wlh3cUdVaEtLd3dnSk9MbWxxaTZtNmxGNVF0VFI3dzFreTBHNkZrZFBDWE9W?=
 =?utf-8?B?a2VDeUxDai9va3JhNlhOdk03ckIrMlArL1RzdFN1T3IzYVB5eE9jaTB2YTBa?=
 =?utf-8?B?ZTRncnlhck1yRisySVFHWXBoWEkxNmZLRTBLdUVQUEdkRjdHNldBUjJZMmpm?=
 =?utf-8?B?WUlPQjBWbktLMGlDMmVrM3VoK1dhRGtYZnovclQvciswUWZpSHhuTm5yOTdN?=
 =?utf-8?B?NzB1UWhRVkZkMENvdzJvR05ZVWYwMzhsT1FVbW5OZm03MnJYMkZzY1J1YjNQ?=
 =?utf-8?B?S21tbmYzMkFtZjFOMyt2a3gwWUVrZllWY0grdjFmWkpXYjFTR3JjUElDWXkr?=
 =?utf-8?B?Vm81bnZyQzNZZDZ6VEkxQVVMWDFxMmx3aXFYaVJHdTVyZGpYdklxdU5EL0tO?=
 =?utf-8?B?UWZGOTJtWXArVUcwU0N6RkE0T2dwTUw0S1FjV2N1bklmcXlncDFiem41Tnds?=
 =?utf-8?B?YzUyNnl3WGZiVlJRSEJCZytIYVFGb0lPQllTQ24zeGZYOXE0Nks4SU5ZYmtq?=
 =?utf-8?B?blFhSU1IVW82cXE1OWt5anYydlBkVzNRVVE0WE5yK1QybDB2TFpJVkljNmhp?=
 =?utf-8?B?NThnempOc3hIZUtRdHlRaXFEMno0NEg5T295Vmg0bERURnJxZnpONWRhM3JQ?=
 =?utf-8?B?eGxTUTU5VGxrc0RKeXNYVGpuZ1dLQmpTdDM5RVBaazRlWmxlT2U4Y2JhV296?=
 =?utf-8?B?Wi9YbncyazhIZk5iZTA4Z1pUYTFEMWNLVFB4MjlhK0lHamZPb3pidXMxVG5Q?=
 =?utf-8?B?WVdRb3RUN1RES0NWMkpCMlFzc2xsYm9XdHNJaTVjZ0J6M0VONU9xVDRoTDkz?=
 =?utf-8?B?Y1FXRzQ2dGNBVEx1Y2xZdlBuNkFySllTeWRZNUVQcDN0bG5JZE9iSm91blJL?=
 =?utf-8?B?VEpMR0VpZTZuNGxjUnorNGo3a0VQVkU2bTV6dUlQTnBCN1lzai85NDZON1F3?=
 =?utf-8?B?WFpwVFkwNTdkWmpIN1p0djZ4VnhCTlMzdWNacEc1WHRjeUg5TUdRZnQvaHVz?=
 =?utf-8?B?eDRrYmF2SG9KN3UzRnV5TU1xMkp6bTNBNjdiaHpzYjI3RkZSaEsrbVdPVHRs?=
 =?utf-8?B?NHJWNlNuVjd4dWM2VFg5QXJ1VE9JZldQNEtJSTR3bVNHSmg5dW1mbzVaTzA0?=
 =?utf-8?B?WlhWRkUrUncvU1R5NER5NVZvT2w4aEtzaDk1cFhvRmp4UHNjWjlkRkozbHQy?=
 =?utf-8?B?d0FRWS9lUTUyL2FyaEppb3d2YmVRbFplVXJhWWJ5cEYxbXdFM3Y1dnJTUUt3?=
 =?utf-8?B?VllIMmw5Vm9zeXNYNmY5RUFMT3owWVZsM2dlTHE4NmYxRFJpMzE5MzE2ayt2?=
 =?utf-8?Q?BgrFnJnQX84ik?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFowTGh3WDdpWXlLL0FhMTdJeURqYlh0aEFXeE00encrMUVOTTJOSEJ5L2wr?=
 =?utf-8?B?d1NRaEljVFpiRXhFZkVkeUh2MG5IZmJPOFJFRXJ0OFBVaWRjc0NwZ2QybThZ?=
 =?utf-8?B?NXdjM2lTVVo3RWxGS2U4SWxkTXlYLzB5ajJUbFl2NW9UU0xjMDUyUkEyY0pT?=
 =?utf-8?B?RkdVVGlkUVVuUlhlWHUvUDVVWVlVRlVQd3VNb1V3VzVJdFFqYVR1T1plTG1M?=
 =?utf-8?B?KzNid1hVRm01YWs5SDFrUGFKUDJiNXFmbC9QRElpNWdHSzJibE52anlMT0Vn?=
 =?utf-8?B?TTZvUHR3RytvMC80NHc4TE1jSVVjeTNDUGUrRkpMOTU3enFzSlpwelkwa2g1?=
 =?utf-8?B?eHFNSGtvYWRkTWtrTFZ2aG1JUGJ4N0JidWZJa0xtSzhyd20xM1lKRmdYeEJu?=
 =?utf-8?B?OThSU3ovamt6RldPRHV4WkRheE1aMjJpRHY1TjZ0K0dQYytIM2J6M1dZK3Rs?=
 =?utf-8?B?STFvVlI3dXpzb2xtTWVzNUtSWEN0L1RDY1R6c1crNlR1V1lOSTNyM1g0QjNB?=
 =?utf-8?B?N1U0cGV0YzBvMVlMRXphUncwa0FyZlpDVlhjSEgzVmdaUS9pZzBMNXlsTDFi?=
 =?utf-8?B?WUtpZVR2bTB0SHhTc0k2TVBCZTJXTjRDby90bjBUbnNmaEdzbGpmWWtQUWpW?=
 =?utf-8?B?SXY2TmVwb3pUMUx2NE5ldFNNM2F4RVlMWFAwQ0FRR2RMd1FYZk5SbTEyQVRK?=
 =?utf-8?B?eUo4M2M1ZkRLNUlwTFFHWGo5ckZ0UWo3ZUF1V3JjV3R4ekpEc3dPVTQ1REhm?=
 =?utf-8?B?Zk9LMldlYVRPVlBlbWEvazJBVXFVcUVYbHdXU1JHZklidXV3TkVXcklZMnYz?=
 =?utf-8?B?WmV5MTZxQlNkRlY2TkE2YVFrN3k0UVE3bytNK2ZTQXY4dFhJVnhJZFcxb3dm?=
 =?utf-8?B?MFpRRDdvQmRaME1zQ2o0d3ZEaWhWZWFtTlRYRXpkN2FWdDhNU0kvSjMrVkJ4?=
 =?utf-8?B?ZUtoYTRxRjJ3NGhLRmtvUkd5ZUJNNzNQYUVrSmRjdUI3Y2M4Mm96eFFiQ09s?=
 =?utf-8?B?UGVFV0RoMllKWE5Wa1Vza2Q5ekNxNERlNFJRU2JKbkRDLzQ5N1R5NDVLNkJL?=
 =?utf-8?B?Zm8rS3FGaHo4UFIyUm1hRVRIYk1Uam5leXB4cG1HUXhkS0c4Qmx6STgyQnJB?=
 =?utf-8?B?dVdWNnZjMW9QdTFUcUFEMm9idDdTZWd5Yy9YZmlKT2lmWUt3VVptZTB4ZmFs?=
 =?utf-8?B?eTBJQkxCblg3OW5qcmZXaXBqcEZIWFY4WGdxTUI0NGRuTzVNei9RT1M5U00x?=
 =?utf-8?B?YlhibmdXMmNqYW41Mjc0eDE1ejVQdmMvcmtqa0U1cDg3L0gyTENkOSthVnpo?=
 =?utf-8?B?OVRVTVdTSG9panAwMTkwRzIzdkpMNjBLRno5V1pDbXBDdlRYaS9MejFHZnJz?=
 =?utf-8?B?Z1VLY2JMZHZ0cERUMHorQkxPVXh2QUM3ZUMybWY4dTBxNkRsQWIwcGtibnh1?=
 =?utf-8?B?aHhvbEpmUkpuSGduSTNwbkxCaGRDRit6dW44OHhlZ29BRk1sSEF6QXgrWWxi?=
 =?utf-8?B?bFo5SWRTdldsVjRubjZ3dFozQUovZnFvcG04SDFvQi9YOTZKc01RaEFnZHN6?=
 =?utf-8?B?QVh6RXV1L3V0YUxPVWQwK09KdStiWEFBNjMraGNtL2wxU0lyMnBKeld2c3dJ?=
 =?utf-8?B?dWFyZE82bERja2hYVldPWG9hMm1kWFpJd3B0Q3BhU0lNR0xyVGtlTkFPaFo3?=
 =?utf-8?B?UTJUNDBjS2ZNaUpYbmx3N3l3aG1WaHhwTmluS2lFWVVlVVliVHA2VkNEMW1L?=
 =?utf-8?B?cFJBYlQ4VW43Skl6MWpiN2h0b0kzZGpCL2liajhrdzJJZWM5N1BsVnFFeFRQ?=
 =?utf-8?B?SGgxZDM5YU1MdmNKbGdqQ2U1QVZQeFVSdStIMjN3UzRiKzFvVEJYSHJJNUdi?=
 =?utf-8?B?YnFja0xLRGpoK1VBZVRFSzlnL01KZ3VRZWRMcEV1cW5SMHZhbzRSZGlhZU15?=
 =?utf-8?B?aUQ3MkFmcmF5TGllN21RWWthQjY4b0lzZ0x2T3U3M3IrODg2TjZGMGEvR0pr?=
 =?utf-8?B?czVsK1dlS2pPaDFCbTdiYmMrQ3FlZ1FKWk1nWjNYUVZYUnJsOXF0TzVVeVZ0?=
 =?utf-8?B?S29QS1ZEMHRkZHdwelY4eStyWDU5U1Y1RmswcGdBd3dYc1RCUENRMWVUT0VG?=
 =?utf-8?Q?BBwIrtqMNHenKQvsvQU7ER1a4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6015bb7-9f94-4a23-8782-08dd33ab5d21
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 08:22:05.1195 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h34bUaMCpmO3NSDwRd8AKRcjJsH16HWDgGmwxCFa268xeQkCv2SSL/XA25hcloROlKPo4jjx85ugEPVXi0/wAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6158
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

PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+IEFy
dW4gUiBNdXJ0aHkNCj4gPiBTZW50OiBXZWRuZXNkYXksIEphbnVhcnkgOCwgMjAyNSAxMTowOSBB
TQ0KPiA+IFRvOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOw0KPiA+IGludGVsLSB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gPiBDYzogTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+IFN1
YmplY3Q6IFtQQVRDSCB2MyAyLzVdIGRybS9wbGFuZTogRXhwb3NlIGZ1bmN0aW9uIHRvIGNyZWF0
ZQ0KPiA+IGZvcm1hdC9tb2RpZmllciBibG9iDQo+ID4NCj4gPiBFeHBvc2UgZHJtIHBsYW5lIGZ1
bmN0aW9uIHRvIGNyZWF0ZSBmb3JtYXRzL21vZGlmaWVycyBibG9iLiBUaGlzDQo+ID4gZnVuY3Rp
b24gY2FuIGJlIHVzZWQgdG8gZXhwb3NlIGxpc3Qgb2Ygc3VwcG9ydGVkIGZvcm1hdHMvbW9kaWZp
ZXJzIGZvcg0KPiA+IHN5bmMvYXN5bmMgZmxpcHMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
cnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9wbGFuZS5jIHwgNDQNCj4gPiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tDQo+ID4gLS0tLS0tLQ0KPiA+ICBpbmNsdWRlL2RybS9kcm1fcGxhbmUu
aCAgICAgfCAgNCArKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwg
MTUgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wbGFuZS5jDQo+ID4gaW5kZXgNCj4gPg0K
PiA0MTY4MThlNTRjY2ZmY2YzZDNhYWRhMjcyM2U5NmNlOGNjZjFkZDk3Li40ZjM1ZWVjMmI3Nzcw
ZmNjOTBjM2UwN2E5MA0KPiA+IDY4YjMxYzA1NjNhNGMwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fcGxhbmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGxh
bmUuYw0KPiA+IEBAIC0xOTEsNyArMTkxLDEwIEBAIG1vZGlmaWVyc19wdHIoc3RydWN0IGRybV9m
b3JtYXRfbW9kaWZpZXJfYmxvYg0KPiA+ICpibG9iKQ0KPiA+ICAJcmV0dXJuIChzdHJ1Y3QgZHJt
X2Zvcm1hdF9tb2RpZmllciAqKSgoKGNoYXIgKilibG9iKSArIGJsb2ItDQo+ID4gPm1vZGlmaWVy
c19vZmZzZXQpOyAgfQ0KPiA+DQo+ID4gLXN0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9i
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdA0KPiA+IGRybV9wbGFuZQ0KPiA+ICpwbGFu
ZSkNCj4gPiAraW50IGRybV9wbGFuZV9jcmVhdGVfZm9ybWF0X2Jsb2Ioc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwNCj4gPiArCQkJCSBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwgdTY0ICptb2RpZmll
cnMsDQo+ID4gKwkJCQkgdW5zaWduZWQgaW50IG1vZGlmaWVyX2NvdW50LCB1MzIgKmZvcm1hdHMs
DQo+ID4gKwkJCQkgdW5zaWduZWQgaW50IGZvcm1hdF9jb3VudCwgYm9vbCBpc19hc3luYykNCj4g
DQo+IFdlIGNhbiByZXRhaW4gdGhlIG9yaWdpbmFsIGFyZ3VtZW50cyAoZGV2LCBwbGFuZSkgaGVy
ZS4gQXMgSSB1bmRlcnN0YW5kLCBwbGFuZS0NCj4gPmZvcm1hdHNbXSBhbmQgcGxhbmUtPm1vZGlm
aWVyc1tdIGFyZSBwb3B1bGF0ZWQgd2l0aCBhbGwgdGhlIGZvcm1hdHMgYW5kDQo+IG1vZGlmaWVy
cyBzdXBwb3J0ZWQgYnkgdGhlIHBsYXRmb3JtLCByZXNwZWN0aXZlbHkuDQo+IA0KPiBUaGUgZ29h
bCBpcyB0byBlc3RhYmxpc2ggYSBtYXBwaW5nIGJldHdlZW4gdGhlIHR3byB1c2luZyB0aGUgY2Fs
bGJhY2tzDQo+IGZvcm1hdF9tb2Rfc3VwcG9ydGVkKCkgb3IgZm9ybWF0X21vZF9zdXBwb3J0ZWRf
YXN5bmMoKS4NCj4gU2luY2UgdGhlc2UgYXJyYXlzIHJlcHJlc2VudCBhIHN1cGVyc2V0IG9mIGFs
bCB0aGUgZm9ybWF0cyBhbmQgbW9kaWZpZXJzIHRoZQ0KPiBwbGF0Zm9ybSBzdXBwb3J0cywgd2Ug
aGF2ZSBzdWZmaWNpZW50IGluZm9ybWF0aW9uIHdpdGhpbiBkcm1fcGxhbmUgdG8gZGVjaWRlDQo+
IGhvdyB0byBwYWlyIHRoZW0gaGVyZS4NCj4gDQpQbGFuZS0+Zm9ybWF0X3R5cGVzIGFuZCBwbGFu
ZS0+bW9kaWZpZXJzIGlzIHRoZSBsaXN0IG9mIGZvcm1hdHMgYW5kIG1vZGlmaWVycyBzdXBwb3J0
ZWQgYnkgdGhlIHBsYW5lLiAgKFRoaXMgaXMgdHJ1ZSBmb3Igc3luYyBmbGlwcyBvbmx5LikgRm9y
IGVhY2ggbW9kaWZpZXIgYWxsIHRoZSBmb3JtYXRzIGxpc3RlZCBpbiBwbGFuZS0+Zm9ybWF0X3R5
cGVzIG1heSBub3QgYmUgc3VwcG9ydGVkIGJ1dCBhbGwgb2YgdGhlIGZvcm1hdHMgbWVudGlvbmVk
IGluIHBsYW5lLT5mb3JtYXRfdHlwZXMgaXMgc3VwcG9ydGVkIGJ5IHN5bmMgZmxpcHMuIEluIG9y
ZGVyIHRvIGdldCB0aGUgbGlzdCBvZiBmb3JtYXRzIHN1cHBvcnRlZCBmb3IgZWFjaCBtb2RpZmll
ciBhIGJpdCBtYXNrIGlzIGNyZWF0ZWQgYnkgdGhlIGZ1bmMgcG9pbnRlciBmb3JtYXRfbW9kX3N1
cHBvcnRlZC4NClRoZSBlbGVtZW50IGZvcm1hdF9vZmZzZXQgaW4gc3RydWN0IGRybV9mb3JtYXRf
bW9kaWZpZXJfYmxvYiBpcyBwbGFuZS0+Zm9ybWF0X3R5cGVzLiBTbyB0aGlzIGlzIGxpc3Qgb2Yg
Zm9ybWF0cyBzdXBwb3J0ZWQgYnkgdGhpcyBwbGFuZSBhbmQgaG9sZHMgZ29vZCBmb3Igb25seSBz
eW5jIGZsaXBzIGFuZCBtYXkgbm90IHN1cHBvcnQgYXN5bmMgZmxpcHMuIFdlIG5lZWQgdG8gZ2V0
IHRoZSBzdWJzZXQgb2YgZm9ybWF0cyBmb3IgYXN5bmMgZnJvbSB0aGUgc3VwZXJzZXQgb2YgZm9y
bWF0cyBmcm9tIHN5bmMgZmxpcHMuIEZvciB0aGlzIHdlIG5lZWQgYSBzZXBhcmF0ZSBsaXN0IG9m
IGZvcm1hdHMgc3VwcG9ydGVkIGJ5IGFzeW5jIGZsaXAuDQoNClBsZWFzZSBsZXQgbWUga25vdyBp
ZiBteSB1bmRlcnN0YW5kaW5nIGlzIHdyb25nIQ0KDQpTbyB3aXRoIHRoaXMgdW5kZXJzdGFuZCB3
ZSBuZWVkIHBhc3MgMiBzZXBhcmF0ZSBsaXN0IG9mIGZvcm1hdHMvbW9kaWZpZXJzIGZvciBzeW5j
IGFuZCBhc3luYyBoZW5jZSBtYWtpbmcgaXQgYSBwYXJhbWV0ZXIgdG8gdGhpcyBmdW5jdGlvbi4N
Cg0KPiA+ICB7DQo+ID4gIAljb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnICpjb25maWcgPSAm
ZGV2LT5tb2RlX2NvbmZpZzsNCj4gPiAgCXN0cnVjdCBkcm1fcHJvcGVydHlfYmxvYiAqYmxvYjsN
Cj4gPiBAQCAtMjAwLDE0ICsyMDMsMTQgQEAgc3RhdGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Js
b2Ioc3RydWN0DQo+ID4gZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZQ0K
PiA+ICAJc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXJfYmxvYiAqYmxvYl9kYXRhOw0KPiA+ICAJ
dW5zaWduZWQgaW50IGksIGo7DQo+ID4NCj4gPiAtCWZvcm1hdHNfc2l6ZSA9IHNpemVvZihfX3Uz
MikgKiBwbGFuZS0+Zm9ybWF0X2NvdW50Ow0KPiA+ICsJZm9ybWF0c19zaXplID0gc2l6ZW9mKF9f
dTMyKSAqIGZvcm1hdF9jb3VudDsNCj4gPiAgCWlmIChXQVJOX09OKCFmb3JtYXRzX3NpemUpKSB7
DQo+ID4gIAkJLyogMCBmb3JtYXRzIGFyZSBuZXZlciBleHBlY3RlZCAqLw0KPiA+ICAJCXJldHVy
biAwOw0KPiA+ICAJfQ0KPiA+DQo+ID4gIAltb2RpZmllcnNfc2l6ZSA9DQo+ID4gLQkJc2l6ZW9m
KHN0cnVjdCBkcm1fZm9ybWF0X21vZGlmaWVyKSAqIHBsYW5lLT5tb2RpZmllcl9jb3VudDsNCj4g
PiArCQlzaXplb2Yoc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIpICogbW9kaWZpZXJfY291bnQ7
DQo+ID4NCj4gPiAgCWJsb2Jfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgZHJtX2Zvcm1hdF9tb2RpZmll
cl9ibG9iKTsNCj4gPiAgCS8qIE1vZGlmaWVycyBvZmZzZXQgaXMgYSBwb2ludGVyIHRvIGEgc3Ry
dWN0IHdpdGggYSA2NCBiaXQgZmllbGQgc28NCj4gPiBpdCBAQCAtDQo+ID4gMjIzLDM3ICsyMjYs
NDUgQEAgc3RhdGljIGludCBjcmVhdGVfaW5fZm9ybWF0X2Jsb2Ioc3RydWN0IGRybV9kZXZpY2UN
Cj4gPiAqZGV2LCBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZQ0KPiA+DQo+ID4gIAlibG9iX2RhdGEg
PSBibG9iLT5kYXRhOw0KPiA+ICAJYmxvYl9kYXRhLT52ZXJzaW9uID0gRk9STUFUX0JMT0JfQ1VS
UkVOVDsNCj4gPiAtCWJsb2JfZGF0YS0+Y291bnRfZm9ybWF0cyA9IHBsYW5lLT5mb3JtYXRfY291
bnQ7DQo+ID4gKwlibG9iX2RhdGEtPmNvdW50X2Zvcm1hdHMgPSBmb3JtYXRfY291bnQ7DQo+ID4g
IAlibG9iX2RhdGEtPmZvcm1hdHNfb2Zmc2V0ID0gc2l6ZW9mKHN0cnVjdCBkcm1fZm9ybWF0X21v
ZGlmaWVyX2Jsb2IpOw0KPiA+IC0JYmxvYl9kYXRhLT5jb3VudF9tb2RpZmllcnMgPSBwbGFuZS0+
bW9kaWZpZXJfY291bnQ7DQo+ID4gKwlibG9iX2RhdGEtPmNvdW50X21vZGlmaWVycyA9IG1vZGlm
aWVyX2NvdW50Ow0KPiA+DQo+ID4gIAlibG9iX2RhdGEtPm1vZGlmaWVyc19vZmZzZXQgPQ0KPiA+
ICAJCUFMSUdOKGJsb2JfZGF0YS0+Zm9ybWF0c19vZmZzZXQgKyBmb3JtYXRzX3NpemUsIDgpOw0K
PiA+DQo+ID4gLQltZW1jcHkoZm9ybWF0c19wdHIoYmxvYl9kYXRhKSwgcGxhbmUtPmZvcm1hdF90
eXBlcywNCj4gPiBmb3JtYXRzX3NpemUpOw0KPiA+ICsJbWVtY3B5KGZvcm1hdHNfcHRyKGJsb2Jf
ZGF0YSksIGZvcm1hdHMsIGZvcm1hdHNfc2l6ZSk7DQo+ID4NCj4gPiAgCW1vZCA9IG1vZGlmaWVy
c19wdHIoYmxvYl9kYXRhKTsNCj4gPiAtCWZvciAoaSA9IDA7IGkgPCBwbGFuZS0+bW9kaWZpZXJf
Y291bnQ7IGkrKykgew0KPiA+IC0JCWZvciAoaiA9IDA7IGogPCBwbGFuZS0+Zm9ybWF0X2NvdW50
OyBqKyspIHsNCj4gPiAtCQkJaWYgKCFwbGFuZS0+ZnVuY3MtPmZvcm1hdF9tb2Rfc3VwcG9ydGVk
IHx8DQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwgbW9kaWZpZXJfY291bnQ7IGkrKykgew0KPiA+ICsJ
CWZvciAoaiA9IDA7IGogPCBmb3JtYXRfY291bnQ7IGorKykgew0KPiA+ICsJCQlpZiAoaXNfYXN5
bmMgfHwNCj4gDQo+IFRoaXMgcGF0Y2ggbG9va3MgaW5jb21wbGV0ZSBiZWNhdXNlIHRoZSBpbXBs
ZW1lbnRhdGlvbiBmb3IgYXN5bmMgaXMgc3BsaXQNCj4gYmV0d2VlbiB0aGlzIGFuZCBbMV0uIEl0
IG1pZ2h0IGJlIGEgZ29vZCBpZGVhIHRvIGhhdmUgYm90aCB0aGUgcGF0Y2ggc3F1YXNoZWQuDQo+
IA0KPiANCj4gWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC82MzEy
NjEvP3Nlcmllcz0xNDA5MzUmcmV2PTINCj4gDQpJbiB0aGUgMXN0IHBhdGNoIHByb3BlcnR5IGlz
IGNyZWF0ZWQgYW5kIHRoaXMgMm5kIHBhdGNoIHRyeWluZyB0byBmZXRjaCB0aGUgZGF0YSB0byBi
ZSBleHBvc2VkIGJ5IHRoZSBwcm9wZXJ0eSBjcmVhdGVkIGluIDFzdCBwYXRjaC4gSSBjYW4gc3F1
YXNoIGJvdGggdGhlIHBhdGNoIGluIG15IG5leHQgdmVyc2lvbiBpZiBpdCBtYWtlcyBzZW5zZSB0
byBoYXZlIGJvdGggb2YgdGhlc2UgaW4gYSBzaW5nbGUgcGF0Y2guDQoNClRoYW5rcyBhbmQgUmVn
YXJkcywNCkFydW4gUiBNdXJ0aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0tDQo=
