Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBA34A56AC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 06:24:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B20D10E137;
	Tue,  1 Feb 2022 05:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1916310E137;
 Tue,  1 Feb 2022 05:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643693043; x=1675229043;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cmGE60WM8UpHWY7B34V6V7tkqQsIoxOaxMiPmRPW5JQ=;
 b=FADBT6NzlB395RU7o0FgS8rAeTO9w+x8LqeKy0dcPPYcfcxZ77OmsUM6
 egOLRnOtbgC3U7VmRIxMPb3mLXXpE9uThMWR4fdxVRk+PVUyMQcQD/7E/
 fpGQVTwXErXW06yheME/A64d9iGddHemZGwv+FufQJBVZK2zFvEOfRKCx
 XLviSIq/IbRZ68q9dGArP1rjUZ8kaZ1Oe7Z0usn1LCstEVebz6x+m7CzB
 burbfefyTuTocmwhMy7EuTxqL6IgUVxUKmpD+tISKDpkMtPFc4Tgm7sVq
 lMVswNmPvIa82Z5NXozTQFc4ErciXiEW5g8Vub7iqd9kRAaW1+BWG6YfS Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247575928"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="247575928"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 21:24:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; d="scan'208";a="599125753"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga004.fm.intel.com with ESMTP; 31 Jan 2022 21:24:00 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 31 Jan 2022 21:23:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 31 Jan 2022 21:23:59 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 31 Jan 2022 21:23:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRDSIZfDoLt3HtDzvzHKsIffj4estMrszGQu/SNg95LzCPolegSEXdVc8BzS8+fEVQGeVtwFv9MNXi8Ih4RAs/lZL1MPDcTq808tCbBmjOcfsvJKVOAe50GgeXsA3BqRh7mL8/uDR31fZI76LPK3COWArenbBlyP4tvDf5zAtGYYB/KRR8RPxzPQ8QxN+PpcBP3R4bM4ST3hIS6vWJhHg+8VQ0xz+AwEaHAMO9kZb9l6uSsbaHA5O2I2tqYHRuCQymfh+5zj0/LWT6LApKaOIJQYq9AYveh5fv4CsiIb4rGLTDOywoeJ74Q4n0p+HdBRVGEb1oMHWIql5K/XjaadZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmGE60WM8UpHWY7B34V6V7tkqQsIoxOaxMiPmRPW5JQ=;
 b=AYM3++GibXYoLgbvkqAqs7jhalkPjQU4mpXF856h8sTHSZpEIcFew09/rkEKn8lGEJAq8i3P3Jq3tyNUqm6tGXJoZzEZZ1hAJYS6XWj5o4CRhHI6e0Gn2KCcWzJ1mlnnrq40Rq+smiJqD1zAvUHFG7YJgCW21BWi39yaEfkL2AQ4dG650RAVf8/YSbusVIFiqDdrBF6zH41BKW8OERYdJwDOprj/H4mR1Pst3ILMNmH61kn1TrQ/o9JyP/+dpzNo+Ju/XhWzFO9tvl7g2ftbqdyx+wzqvq+N0dzfdY38Ta51zvqGbnNU/s8pBhovANJVxiRWppUgqEncmA/fqq5R/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CY4PR11MB1352.namprd11.prod.outlook.com (2603:10b6:903:2a::23)
 by SA2PR11MB4796.namprd11.prod.outlook.com (2603:10b6:806:117::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Tue, 1 Feb
 2022 05:23:56 +0000
Received: from CY4PR11MB1352.namprd11.prod.outlook.com
 ([fe80::fdaf:f5ea:bd3b:21ce]) by CY4PR11MB1352.namprd11.prod.outlook.com
 ([fe80::fdaf:f5ea:bd3b:21ce%4]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 05:23:56 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] drm: add writeback pointers to drm_connector
Thread-Topic: [PATCH 1/3] drm: add writeback pointers to drm_connector
Thread-Index: AQHYBtNdIb21OQQo5U+3y7l+Bb32AKxt2tOAgAjNZLCAAJ5PgIAGxc0AgAA6AyA=
Date: Tue, 1 Feb 2022 05:23:56 +0000
Message-ID: <CY4PR11MB1352A670344174CD847EDBA2E3269@CY4PR11MB1352.namprd11.prod.outlook.com>
References: <20220111101801.28310-1-suraj.kandpal@intel.com>
 <c797223b-47cb-3fcd-0a1a-b12fd2c2c0da@quicinc.com>
 <CY4PR11MB1352DAB3BD614093B5154C10E3219@CY4PR11MB1352.namprd11.prod.outlook.com>
 <da26d67f-3212-2434-1b23-c5f9209dce41@quicinc.com>
 <d944e4f2-9412-1908-6f13-a6e1a7730cfd@quicinc.com>
In-Reply-To: <d944e4f2-9412-1908-6f13-a6e1a7730cfd@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a93e32f-d3b6-4483-b65b-08d9e5430b4d
x-ms-traffictypediagnostic: SA2PR11MB4796:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <SA2PR11MB47966569D3AE62A5037E774EE3269@SA2PR11MB4796.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kMPrpkU1xdpz/HHlT6HBOqjZIrVV05Kdae1D/hV2To4fY5SPBFUIOl+mmI0JU1ekNHYesZ826Jfaa4UJiwPNwCWNMj86EtxXngg3Rw5asGjF09OYIYi4FANS6en9+T6qGj1kMEoVCuwV41PX7UUtfMaPj9/V2uqATboBmb94FzcMfUAWSoQpfp4ikaP+OIDjMaXiCPz2S+hvktuX43KfI65huSldn/veHS770GVVs00QcTxiVRr/S4Urv8YBW9wqjcqiJBXkFQozdrYuUJcX3UHNYeFJMMHX4OlvckK+pyF4Yv4NJ/z/lgZuEfbhsM+8yGngQEtFDw5HfoYR+Gr1jOSjbt56wd2SOG4r3NzmOvDUY5a2OIeyHx/xQ45WQZfu3QDYJNKg+Cfl/EHcxCE1JPx8IR1zzNT7MU45iPkBLXALCQ/MO6yNOR9S+Pf9qRp8PLgY0xOo3VkOX6B5Sb5vxHLZvmp8kKHnc+GoiyMmsTPeQ4RiXGAbadoLaWPUTkDlmkGhXxPV9zOgcFg5Kj0Nz5MDvB8Wd4csMIBUMGornLiahJHaCbDgAwfcFPBGN8bwS1+rZTDD/ypmZMDj9A91wUN2TNPnV8yMkZLqb26UkIb8Te5ArHGvGCiKz25iahfGLyoxSx51zVPJlQb7w7DFzHhQolGwOmYS5XpZGzv/x95tUdXJiU+ZE3MPu/rrjBevLFdeHzQ+vuFSxgYL73mX6w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB1352.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(316002)(55236004)(66946007)(7696005)(71200400001)(86362001)(76116006)(38100700002)(6506007)(8936002)(5660300002)(508600001)(54906003)(52536014)(66556008)(4326008)(8676002)(66476007)(64756008)(66446008)(9686003)(110136005)(26005)(82960400001)(33656002)(55016003)(186003)(2906002)(38070700005)(122000001)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlVuYlBJeVIvZkxRQ055bUhGdk1jZ1lyZzdFbldTRnNJa1RYYXU2OE10UDBU?=
 =?utf-8?B?Z2ZOeU1HUGlCUjVjYy9oNklOYkdDMnRFL2J4eXgvSkZkcXh5SGNxd1dySnhC?=
 =?utf-8?B?YjNub0pjRXFuWUE1bk5IbDBCRzVEUlp0QTNpT1dFejNIUWRhR1NKamU1NzNF?=
 =?utf-8?B?MDBUdENEd2s1M25xckFaTzBuNUZPbTlzQmVNVCtLamxpV0U1blhaQ0N4UTh2?=
 =?utf-8?B?V2RhOGlFUTJ3NXNwNG9SK2RZeTVyRGRBc3FReTBrUUF0d2l2Y2dYQWVSN25I?=
 =?utf-8?B?cDlOM1BObnJRcmtqbHlkOFlUKzlUT1BSd01DYlV4L1pjZFVVOEZZUW5Ua1F0?=
 =?utf-8?B?S2ZlS01hOXg1TGREcEpvZWkvK3ZURlRtbkRKMk9sVHVTeFkvdWZmZ1N6REsy?=
 =?utf-8?B?RmRnV0Q3N0IyUW1YRXphalZjaytuTUNRcjkydmk1YS90cmJKMmFCWnRRNzF3?=
 =?utf-8?B?am04UXdaQzZqZmY4WXhTS1MyUEljYlg5OWRDUzZyNGF4RTJjbHhjd3J2cGhr?=
 =?utf-8?B?S0lWd3pSbHFKWWpnYUljbndoeU9qUVNIZjJkV3BDdkxneXkxSlIxc3E3eXh6?=
 =?utf-8?B?aUZZd0QyNU5aTzFpNTMxYmp0WkJDQUJqSEJLQzZ2ekRONHh0b1ppQ21iTll6?=
 =?utf-8?B?OHNzekNuWjRSK3VHK1dEL3FqTFVSZ0MzQmpiUG1ZakRPV0kwQmp6bFcxVlZn?=
 =?utf-8?B?QmVjamNIUHNOa2xJUlJDdlBuOTZtSXlTLzhhQTAvT2laRlBBcmkxYktkTUdt?=
 =?utf-8?B?VmNzemk2V3FycVFyVlppS0tSaG9oa3k1L0xvaUdYTUp0dm5KeG1TTG1LWFRY?=
 =?utf-8?B?S2dBUVY4aFhNRjg3NEtRWEk5d0NzZ2ppb2JESTJIVWZmcEs4OHRSQUFJdkFG?=
 =?utf-8?B?aVRWOGZHdTBoQUhReTQ3MENBOHJFTDNSb0IybHdlbGlqVDgya2c4Rk1EZ0lk?=
 =?utf-8?B?WDFVUmlNM2ozY3l1NDV2UkZ6R1M4NUNFd2tOVlIrdmxEcFpXNm5YRDFwRUc5?=
 =?utf-8?B?UmVvUnF0YWJZUnF3N2tPMVB3ajdKUm45L1ZIRmN5K0d6aGE3Q2xrWXlLTHli?=
 =?utf-8?B?cys5UC94ck1LQ2phM20rQTBla05BY3RXL3hLdjZ3TGNCeitISndpL1p2MWMx?=
 =?utf-8?B?SlJicVhqR3RPRnd4Qi9RUjErL2hVeEJRcGw1dG1SS25IaDVCakdUM1RSS1VR?=
 =?utf-8?B?Q2s5S1ZVMnJvSDNHalZ2NXd0dTQ0Y0lTd1dsYjZlYUliZnl2SHlHeU9GdEpL?=
 =?utf-8?B?ZmhtaS81QkwvVUEzaVBicTV1Y1kvQk5ueGRjaDJyMUJnUElXc0JFTElncXhX?=
 =?utf-8?B?ejNYTGZzdytDRk5ZL3hXWWpHcnNIMDNKL3FOVm5vb29vaCtqZUhHS2RGUkZN?=
 =?utf-8?B?cHRQQUQrczVpVFp0SW9vYnREbnVtTXJYbWZKSU5KZjU4ZFJSTFp0anpuMTF1?=
 =?utf-8?B?N0pQV0dKRUVvRTgyT00rSUcxaDZxVlFXQzFNNlZSazRPaHRlekh3MWp3WVF5?=
 =?utf-8?B?TWs1QjJ3eUNyOC9zMjB1WjUvK3Q3TWRPUjJCb2l3cytXRzdZbnpUWUVlWDRt?=
 =?utf-8?B?RTNGOXU3bmhwSmRGV3RtVEtKeXFrMHVlKzFnWmZlL1MvNGhlaFRzR0FiMU1r?=
 =?utf-8?B?QnZJYlRyMEhDNWErS3VETkJPcmJLaDcwYXN2UkFSWFhINVBXb1h5Uk9ac3Rj?=
 =?utf-8?B?eVBiSDdRQzRjYTJRYWI4cXZXVG55QUlJYzBkU25lVERxN3grL1RVbGJ4UEtY?=
 =?utf-8?B?ZElNRHpuelprTTh5Q3ZvemNwZFNaeDJsaWYvaUg3K2EzQStDNE9JL0VKMWE2?=
 =?utf-8?B?djVFZ21adnFqSTNpQ2JwRjA3dWcwR05zWDNXaVlxUHl6aWordHdsOFBuUEg5?=
 =?utf-8?B?RVNpUllTaU9LeE9CSXQrdUczVlhNVXN2Z2JYMHU4TlBsN2FjamdhVHVRa1B0?=
 =?utf-8?B?L2t0d0ZZMk5ldHY3aCtFK1AxZWxYL1lZVzZ5TmtsNC96cFZiaU1tMGMzWWhG?=
 =?utf-8?B?Q2N2SmFEY3MzM2lwZHVqeC9HbHhZSlEvcHZ3dkQrYVpUaHA1akRqVWY1TVFZ?=
 =?utf-8?B?Rk9JK3VtWHdRUGV2WVpaTnlTMFZ6OTY0enVxdFV3R0dFNDNHM3dSWm1GVkg4?=
 =?utf-8?B?TTZrdS9IWC9GRmJMUUNoRitjaU9HbU1XMks0MVUvYisxRTJ0UUNiaG1kaE9k?=
 =?utf-8?Q?zDPWESOrjMzezbhCcdew6Xk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1352.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a93e32f-d3b6-4483-b65b-08d9e5430b4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 05:23:56.4066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lvn7oMUNQUf6gEKc6bGAIhUhq0AQJlBK/liTZmNlvx2MimB85jp4vTnaFJi7+OqON6UiuAU5h3Lb6+Ctt6M7rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4796
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "Kandpal@freedesktop.org" <Kandpal@freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5LA0KPiBJIHRoaW5rIHRoZXJlIGFyZSBtb3JlIHBsYWNlcyBhZmZlY3RlZCB3aXRoIHRoaXMg
Y2hhbmdlLiBJIGNhbiBnZXQgYmVsb3cNCj4gY29tcGlsYXRpb24gaXNzdWVzIHdoaWxlIHRyeWlu
ZyB0byBjb21waWxlIG15IGJyYW5jaDoNCj4gDQo+IGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3R4
cC5jOiBJbiBmdW5jdGlvbiDigJhlbmNvZGVyX3RvX3ZjNF90eHDigJk6DQo+IC4vaW5jbHVkZS9s
aW51eC9idWlsZF9idWcuaDo3ODo0MTogZXJyb3I6IHN0YXRpYyBhc3NlcnRpb24gZmFpbGVkOg0K
PiAicG9pbnRlciB0eXBlIG1pc21hdGNoIGluIGNvbnRhaW5lcl9vZigpIg0KPiAgICNkZWZpbmUg
X19zdGF0aWNfYXNzZXJ0KGV4cHIsIG1zZywgLi4uKSBfU3RhdGljX2Fzc2VydChleHByLCBtc2cp
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCj4gLi9pbmNs
dWRlL2xpbnV4L2J1aWxkX2J1Zy5oOjc3OjM0OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8N
Cj4g4oCYX19zdGF0aWNfYXNzZXJ04oCZDQo+ICAgI2RlZmluZSBzdGF0aWNfYXNzZXJ0KGV4cHIs
IC4uLikgX19zdGF0aWNfYXNzZXJ0KGV4cHIsICMjX19WQV9BUkdTX18sDQo+ICNleHByKQ0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCj4gLi9pbmNsdWRlL2xpbnV4L2Nv
bnRhaW5lcl9vZi5oOjE5OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybw0KPiDigJhzdGF0
aWNfYXNzZXJ04oCZDQo+ICAgIHN0YXRpY19hc3NlcnQoX19zYW1lX3R5cGUoKihwdHIpLCAoKHR5
cGUgKikwKS0+bWVtYmVyKSB8fCBcDQo+ICAgIF4NCj4gZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRf
dHhwLmM6MTYyOjk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybw0KPiDigJhjb250YWluZXJf
b2bigJkNCj4gICAgcmV0dXJuIGNvbnRhaW5lcl9vZihlbmNvZGVyLCBzdHJ1Y3QgdmM0X3R4cCwg
Y29ubmVjdG9yLmVuY29kZXIpOw0KPiAgICAgICAgICAgXg0KPiBkcml2ZXJzL2dwdS9kcm0vdmM0
L3ZjNF90eHAuYzogSW4gZnVuY3Rpb24g4oCYY29ubmVjdG9yX3RvX3ZjNF90eHDigJk6DQo+IC4v
aW5jbHVkZS9saW51eC9idWlsZF9idWcuaDo3ODo0MTogZXJyb3I6IHN0YXRpYyBhc3NlcnRpb24g
ZmFpbGVkOg0KPiAicG9pbnRlciB0eXBlIG1pc21hdGNoIGluIGNvbnRhaW5lcl9vZigpIg0KPiAg
ICNkZWZpbmUgX19zdGF0aWNfYXNzZXJ0KGV4cHIsIG1zZywgLi4uKSBfU3RhdGljX2Fzc2VydChl
eHByLCBtc2cpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4N
Cj4gLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5oOjc3OjM0OiBub3RlOiBpbiBleHBhbnNpb24g
b2YgbWFjcm8NCj4g4oCYX19zdGF0aWNfYXNzZXJ04oCZDQo+ICAgI2RlZmluZSBzdGF0aWNfYXNz
ZXJ0KGV4cHIsIC4uLikgX19zdGF0aWNfYXNzZXJ0KGV4cHIsICMjX19WQV9BUkdTX18sDQo+ICNl
eHByKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCj4gLi9pbmNsdWRl
L2xpbnV4L2NvbnRhaW5lcl9vZi5oOjE5OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybw0K
PiDigJhzdGF0aWNfYXNzZXJ04oCZDQo+ICAgIHN0YXRpY19hc3NlcnQoX19zYW1lX3R5cGUoKihw
dHIpLCAoKHR5cGUgKikwKS0+bWVtYmVyKSB8fCBcDQo+ICAgIF4NCj4gZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfdHhwLmM6MTY3Ojk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybw0KPiDigJhj
b250YWluZXJfb2bigJkNCj4gICAgcmV0dXJuIGNvbnRhaW5lcl9vZihjb25uLCBzdHJ1Y3QgdmM0
X3R4cCwgY29ubmVjdG9yLmJhc2UpOw0KPiAgICAgICAgICAgXg0KPiBkcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF90eHAuYzogSW4gZnVuY3Rpb24g4oCYdmM0X3R4cF9iaW5k4oCZOg0KPiBkcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF90eHAuYzo0OTU6Mjc6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDEg
b2YNCj4g4oCYZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRk4oCZIGZyb20gaW5jb21wYXRpYmxlIHBv
aW50ZXIgdHlwZSBbLQ0KPiBXZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdDQo+ICAg
IGRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmdHhwLT5jb25uZWN0b3IuYmFzZSwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4NCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVk
ZS9kcm0vZHJtX2F0b21pY19oZWxwZXIuaDozMjowLA0KPiAgICAgICAgICAgICAgICAgICBmcm9t
IGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3R4cC5jOjE3Og0KPiAuL2luY2x1ZGUvZHJtL2RybV9t
b2Rlc2V0X2hlbHBlcl92dGFibGVzLmg6MTE1MzoyMDogbm90ZTogZXhwZWN0ZWQNCj4g4oCYc3Ry
dWN0IGRybV9jb25uZWN0b3IgKuKAmSBidXQgYXJndW1lbnQgaXMgb2YgdHlwZSDigJhzdHJ1Y3Qg
ZHJtX2Nvbm5lY3RvciAqKuKAmQ0KPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBkcm1fY29ubmVjdG9y
X2hlbHBlcl9hZGQoc3RydWN0IGRybV9jb25uZWN0b3INCj4gKmNvbm5lY3RvciwNCj4gICAgICAg
ICAgICAgICAgICAgICAgXg0KPiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF90eHAuYzo1MDk6MTA6
IGVycm9yOiBhc3NpZ25tZW50IGZyb20gaW5jb21wYXRpYmxlDQo+IHBvaW50ZXIgdHlwZSBbLVdl
cnJvcj1pbmNvbXBhdGlibGUtcG9pbnRlci10eXBlc10NCj4gICAgZW5jb2RlciA9ICZ0eHAtPmNv
bm5lY3Rvci5lbmNvZGVyOw0KPiAgICAgICAgICAgIF4NCj4gZHJpdmVycy9ncHUvZHJtL3ZjNC92
YzRfdHhwLmM6IEluIGZ1bmN0aW9uIOKAmHZjNF90eHBfdW5iaW5k4oCZOg0KPiBkcml2ZXJzL2dw
dS9kcm0vdmM0L3ZjNF90eHAuYzo1MzI6Mjg6IGVycm9yOiBwYXNzaW5nIGFyZ3VtZW50IDEgb2YN
Cj4g4oCYdmM0X3R4cF9jb25uZWN0b3JfZGVzdHJveeKAmSBmcm9tIGluY29tcGF0aWJsZSBwb2lu
dGVyIHR5cGUgWy0NCj4gV2Vycm9yPWluY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQ0KPiAgICB2
YzRfdHhwX2Nvbm5lY3Rvcl9kZXN0cm95KCZ0eHAtPmNvbm5lY3Rvci5iYXNlKTsNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeDQo+IGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3R4cC5j
OjMzMzoxMzogbm90ZTogZXhwZWN0ZWQg4oCYc3RydWN0DQo+IGRybV9jb25uZWN0b3IgKuKAmSBi
dXQgYXJndW1lbnQgaXMgb2YgdHlwZSDigJhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqKuKAmQ0KPiAg
IHN0YXRpYyB2b2lkIHZjNF90eHBfY29ubmVjdG9yX2Rlc3Ryb3koc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvcikNCj4gDQpJIHdpbGwgaGF2ZSBhIGxvb2sgYXQgdGhpcyBhbmQgdHJ5IHRv
IHJlc29sdmUgaXQNCj4gDQo+IExvb2tzIGxpa2UgdmM0IGRvZXNudCBoYXZlIGl0cyBvd24gZW5j
b2RlciBzbyB3ZSBtaWdodCBoYXZlIHRvIG1vdmUgaXQgdG8NCj4gaGF2ZSBpdHMgb3duPw0KDQpS
aWdodCBzZWVtcyBsaWtlIHdlIHdpbGwgaGF2ZSB0byBhZGQgYSBkcm1fY29ubmVjdG9yIGFuZCBk
cm1fZW5jb2RlciBpbiB0aGUgDQpiZWxvdyBzdHJ1Y3R1cmUNCj4gDQo+IHN0cnVjdCB2YzRfdHhw
IHsNCj4gICAgICBzdHJ1Y3QgdmM0X2NydGMgYmFzZTsNCj4gDQo+ICAgICAgc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldjsNCj4gDQo+ICAgICAgc3RydWN0IGRybV93cml0ZWJhY2tfY29ubmVj
dG9yIGNvbm5lY3RvcjsNCj4gDQo+ICAgICAgdm9pZCBfX2lvbWVtICpyZWdzOw0KPiAgICAgIHN0
cnVjdCBkZWJ1Z2ZzX3JlZ3NldDMyIHJlZ3NldDsNCj4gfTsNCj4gDQo+IHN0YXRpYyBpbmxpbmUg
c3RydWN0IHZjNF90eHAgKmVuY29kZXJfdG9fdmM0X3R4cChzdHJ1Y3QgZHJtX2VuY29kZXINCj4g
KmVuY29kZXIpDQo+IHsNCj4gICAgICByZXR1cm4gY29udGFpbmVyX29mKGVuY29kZXIsIHN0cnVj
dCB2YzRfdHhwLCBjb25uZWN0b3IuZW5jb2Rlcik7IH0NCj4gDQo+IHN0YXRpYyBpbmxpbmUgc3Ry
dWN0IHZjNF90eHAgKmNvbm5lY3Rvcl90b192YzRfdHhwKHN0cnVjdCBkcm1fY29ubmVjdG9yDQo+
ICpjb25uKQ0KPiB7DQo+ICAgICAgcmV0dXJuIGNvbnRhaW5lcl9vZihjb25uLCBzdHJ1Y3QgdmM0
X3R4cCwgY29ubmVjdG9yLmJhc2UpOyB9DQo+IA0KDQpDaGFuZ2VzIHdpbGwgYmUgcmVxdWlyZWQg
aGVyZSBpbiBib3RoIGNvbm5lY3Rvcl9vZiBmdW5jdGlvbnMgdG8gcG9pbnQgdG8gDQpUaGUgbmV3
IGRybV9jb25uZWN0b3IgYW5kIGRybV9lbmNvZGVyIHdlIGFkZCBpbiB2YzRfdHhwIHN0cnVjdC4N
Cg0KPiANCj4gT25lIG1vcmUgdGhpbmcsIGl0IGxvb2tzIGxpa2UgdG8gbWUsIHdlIG5lZWQgdG8g
ZG8gb25lIG1vcmUgdGhpbmcuDQo+IA0KPiBMaWtlIGludGVsIGRvZXMgYW5kIHdoYXQgTVNNIHdp
bGwgZG8sIHRoZSBlbmNvZGVyIHBvaW50ZXIgb2YgdGhlIHdiDQo+IGNvbm5lY3RvciBoYXMgdG8g
cG9pbnQgdG8gdGhlIGVuY29kZXIgc3RydWN0IC4NCj4gDQo+ICA+PiB3Yl9jb25uID0gJmludGVs
X2Nvbm5lY3Rvci0+d2JfY29ubjsNCj4gID4+IHdiX2Nvbm4tPmJhc2UgPSAmaW50ZWxfY29ubmVj
dG9yLT5iYXNlOw0KPiAgPj4gd2JfY29ubi0+ZW5jb2RlciA9ICZpbnRlbF93ZC0+YmFzZS5iYXNl
Ow0KPiANClllcyB0aGlzIHdpbGwgbmVlZCB0byBiZSBkb25lIA0KDQpUaGFua3MgQWJoaW5hdiBm
b3IgcG9pbnRpbmcgSWxsIGltcGxlbWVudCB0aGlzIGFuZCBzZW5kIGl0IGluIHRoZSBuZXh0IHZl
cnNpb24NCm9mIHBhdGNoZXMgDQoNClJlZ2FyZHMsDQpTdXJhaiBLYW5kcGFsDQoNCg==
