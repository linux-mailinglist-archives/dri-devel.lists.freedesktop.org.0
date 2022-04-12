Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F004FCCE0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 05:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2497D10FC56;
	Tue, 12 Apr 2022 03:10:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52ED610FBBD;
 Tue, 12 Apr 2022 03:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649733050; x=1681269050;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6hoT28sfXNdPIxjkDfvZZ3Wm13IeZIL8qTtYtNs3l+4=;
 b=E1uFbGzK5RaW85OAHacJIlH7nJEupEppWSRq521ef8cR3JNvwTerrw23
 v+lQW+IgiKx6SGxRxP9LLBe+qvremPq4Ouap7C9hfQIzgzNakEmUxscEi
 v9UVZTSDbQc1d96vGWQQxgsrgxIbQ4W8YtGnuYyn1eP6EI3iGnYuh4/Gi
 ofXs0CwMQXRyTVc9eu5+kRHZEuzM6AmyLUqUDz/UT8rHbTC5waxna2HC0
 Hi3lAsteci+7BjfpH8OPS7mV/ghdPX9U3StNlfVWkHjoO5BGIKa2A8GIU
 hVSaxvQkj047z5LR/Cd/8Gyb7V+WgFzGEGaGfC2n4CMjgIAQLlExUz2en w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="325177214"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="325177214"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 20:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="559141885"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 11 Apr 2022 20:10:49 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Apr 2022 20:10:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Apr 2022 20:10:48 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Apr 2022 20:10:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F20kxH77HSL/AIgzAFg8vhoXDpHHFGwKMkhZluNkXWma1Er6w81wCaUi3p6P6f/b8wIBG21Y8fnnc5gJqOBiux5uUEaCYz2zgg/SrmZ14/nVf5Xsjwhc8dq6QlvBLVI7QuXKKq/xB7cA96413unOsucLdWSF+dfMP4ccdTPu1zLKE7nfhqgrcDQRp6pQ46TLtDwSf891xQQn3NKW09boqMIg2yTFEOjfkoAchmAfrDEy0pY43GlKVzhfEyjy7cVAOTXbCgeRhg3LmfBklqmQInjOA3mMRRx7pgtiNSZt82HIUILEoc8Hoccf1PmVihTJZbwqJy2OqeCsWJstFKgTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6hoT28sfXNdPIxjkDfvZZ3Wm13IeZIL8qTtYtNs3l+4=;
 b=T61ZUuEVzk1o+CjOzhjdHxKi725xxybhi2tuG7nGBDkWBRRp+PyRJNnX0vmitmrf0NhzBzcJ7u/z1tK7vjbyLgcG57HZWssllCmyMuXkMgzw4DGJ0sWDGiPVPj5OTjp8jJ+rPse4lp5j66rbIX5+XqtQP5CH4Fmh4iFLJwjfl2UyBvXh1jJN0Ns5bErPAzZuJsYkhu0TUntIqTUZ395bhPb/nCmmBo8jpuRA0/rsAbLQunQ8ucMMl2WKpammE9IfAablwbitZTM05g8yHarkGh4bBvHNpQ1YZ9FzuBae52KuDhUtpMeOgFwhc+DDW6dcvdDby/vYBOgZOKVlr+YPyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 SN6PR11MB3008.namprd11.prod.outlook.com (2603:10b6:805:cf::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Tue, 12 Apr 2022 03:10:46 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::b124:1092:57d7:516e]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::b124:1092:57d7:516e%3]) with mapi id 15.20.5144.030; Tue, 12 Apr 2022
 03:10:46 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [Intel-gfx] [V2 2/3] drm/i915/display/debug: Expose crtc current
 bpc via debugfs
Thread-Topic: [Intel-gfx] [V2 2/3] drm/i915/display/debug: Expose crtc current
 bpc via debugfs
Thread-Index: AQHYTYoR8R0RRpgCrEu2oVa+33GzAqzrmiTQ
Date: Tue, 12 Apr 2022 03:10:46 +0000
Message-ID: <DM6PR11MB31779A2700030C710CDAC877BAED9@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20220411095129.1652096-3-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e902674-99b3-47d3-50a2-08da1c320a04
x-ms-traffictypediagnostic: SN6PR11MB3008:EE_
x-microsoft-antispam-prvs: <SN6PR11MB30086C9883D5140391D1B492BAED9@SN6PR11MB3008.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +XMVcrQZQdCjMP0Q7xwS+ZHKlxrzGIGNKph2c24Zx9V/fJC2oaS/4PQg1Yy8bmxj3woqiB2Idl+JZ5uXbz2rmkLrHmXa7FXkWdNkGmphu3mT6G1kj+w0IUS9KxGEuRn7n+0cgCnXHcUBundVeUHu/BMCyUO7RQqC92xi+2jYb0u86l8IQywTKoQkG8pWy5huMKNEcokiRo9Ssc3SpCRkTJzkwAT1r+D/jGGxakjaXGnaChnZwSJm1AfYueiv0JKMgLpLnNJNolRuVFaPxGju2lGjWQJcTs6238KrCi6Nz+3mC8RWCU+eZAxMf/OkgwSeIGf2R37wsIdZ9G41o8XolZ5NL+lZqXztIQNpDnCYQJmElTszjWcgC4p+w+tbXJE5BLn0mGZwrrFAx8GV45Cp795XDbqOCWSpixCaMo2rAQsUwulJuXuBcYDCwLDINzKL014b4d01/cZas0iPDrZ2UbIqeRWo/rZmoU3e3jrfcVERgPWqMTiEw0djLy1oB0iWp1A3OhATw8drk04ZqUsi5N2wY37Gaes7h4xHGbznO6XTYDPBQ0BWIqxTW4KnmQfzmy5zgi15rH/IgSLwdJI953p8Rj2j9lB0y47UZX9qsUGSH0eTsQB8azYy2Ahx0D7zdqLxoMzNvGD3nPRBzI+rIoaFjuzNdETAOgVX4Aitj+TDj4gOYSBC7R3QyaUHNasB1E9ueozFWpSluLsDMV6FA/Zu55G3LAzTNPNXk2r5cvc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(5660300002)(71200400001)(8936002)(4744005)(122000001)(38070700005)(508600001)(55016003)(9686003)(76116006)(33656002)(55236004)(53546011)(186003)(26005)(6506007)(7696005)(66946007)(38100700002)(83380400001)(86362001)(66556008)(110136005)(2906002)(64756008)(66446008)(921005)(8676002)(82960400001)(52536014)(316002)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2VPRFFEL2YzbjMya1RnODFXSHVPMkY5c2ZPV3oyR04yRjBhVnIzdDd3Nllr?=
 =?utf-8?B?UmN6YndGWk1ab0lSVnJoZkRHbGd2YnZNWlcwcUQ2cU5ORkN2YXFlbFE4M0dG?=
 =?utf-8?B?SU9JUTZ1N09FbmtlOG0yQ00wOGRoZUxUSUJWbUpZWkQwak1mcjQwRWgxU3Zq?=
 =?utf-8?B?clVObHpjWXdWV3dIelRWSHN2eU9XOHZZakpmVmluanBDbXBwZ1FMSTJMcnVG?=
 =?utf-8?B?ZXFEYVFlZ2R0OUUxSTlGNmx3YXU2K09CWWVCQlZScnBqV0taVHJ4TTJDWUcx?=
 =?utf-8?B?d3pLV0xES25kN0djejBNNGNDSmFUbldEaEI4L3N0b3lxcVNDZ0RzMERaQ3ZJ?=
 =?utf-8?B?UTlIWTdmSFdZRFJtbzRGTjBva3lCdmRIK0hSdEFYSGRUd0ZSOVJmOXNmRlZJ?=
 =?utf-8?B?SUNRUEIyc1dlME5vbmt3NFdHMGhwMUxtS0k3eFEyeU1KSHNTTi9EbkQ3OU5n?=
 =?utf-8?B?V1dPTUhsbGVJb0dJMEI3UUNyMUNvMjdaNmphVFNKVXZFakdTaTdmT3ZleWY0?=
 =?utf-8?B?UDZtM3Z1eGJtZFpzTWVoTzRMOVRZaW0vMi93YVExemZjWWYybnlOQlU3eXJS?=
 =?utf-8?B?SE10Nkw5VnJyek1PN21veEMrOWtFY1FycDR6WEZpdWNnNy80YVRlbkZCNHJJ?=
 =?utf-8?B?QjYwWGFYMGZkU2JPaisvdFpUOUw5Nlh3UVRPeGRIN1FkeTJ0RHpYSzE1c3NT?=
 =?utf-8?B?eFgzMllVdjl3NkJoTGhHWFdRSVVjNmxjeGZ2eUZEL2lXVkdlTFpXZU5yN0VG?=
 =?utf-8?B?aGdCdWdCeUdHb1VzdjJEam5ZdnJPOWlBa3d4U2d5QzVpSlZqeWtkM3hFOGJQ?=
 =?utf-8?B?MVpMaVNUWEZESGtqNTRXcHdMbnB4bGpDOVFwS3E4YitZeGJVTy9Sd2FnWC9n?=
 =?utf-8?B?U09uSnQ1OTlKb1hUdHZuOUNaUmREcE90UzA2NzRRbjdXS0FFK3VtdmkzcHIr?=
 =?utf-8?B?OHlIMEdHMWVpNWlqclY3R1Y1akpFWTI5VVhMdHQ3WEFzMU1DTnhHZE5KdFZH?=
 =?utf-8?B?NUp5TndIdXBzZmZOVXBRd1Q1MjErV0p2Q0tYMnptRC91b09NdG8xa1ZUeDJH?=
 =?utf-8?B?SEpFSW0rNFlLdlJTRWcyeUxVeTVkK1RTNm5YM3pLM0ZTMVdzc3c0cllVTTM4?=
 =?utf-8?B?bHFTbkhMeUpZcUVsbEhBZHR2SnRqSWV4OUREWmJTMy9zcEZBYU45RC90aEh3?=
 =?utf-8?B?bUtYdjVDd0M5Vld5YjNOUnMwZ3U5OXBqcmU0d3ErRm9GWGFYTUY5Ny9FY25N?=
 =?utf-8?B?MzBYeElXZkdJNitiZ1hJOUcwVXYwbitVUXhCcXhkeTZ1eUF6aGo2ZXdnejBQ?=
 =?utf-8?B?NHE0V1VSQ3pwa3dWd3BZRzRPMEt0RzU0aUxNQ0xDT3VGdWtFdnh2TDRTZy9k?=
 =?utf-8?B?dzc5U2tlZzNqTCtGQm9SY1pobXhsemFjU094dXpWOFFlQU9TOWp6VWxvWkhL?=
 =?utf-8?B?MGpxdy81QWtkOGd5aFJvNVlBaFhNLy82U2U3d1BvVGZwRFFCaUVTOHBKZmN4?=
 =?utf-8?B?cXRleXFUMVE4eldxRHdMZ3lEODB4SnBKODBHTHRTRDlFakpuTjgvVUxzcW1y?=
 =?utf-8?B?dWFYN2Q5ZjZKN1lBM0Jkd0JVdnFXaU9vSTlDWVVxZEwwdWQ4elYxMzcxcjFW?=
 =?utf-8?B?VTBKNy83ejhLTU5LSmRLa0ZIQzllVmpDUVNUSHlBd2crdUtBdUVhSUZFQlgv?=
 =?utf-8?B?OGZtWFJaVFhHWXZVbkQ4ckt4dU84dnpBeGxjNEx4OGp0YW10Um9PdVN4OUxC?=
 =?utf-8?B?N3djOWdERW1VVFJsNExZZ2U5YWJUcFl2aHVibWR5Szg3RFZuM0w4bktlcWth?=
 =?utf-8?B?Q1hxcDNYYTRYT1NQMVJ5VGJPb2RnMW9zb0gxcEJKeVpaMTBkMUZ4ZWptbmlZ?=
 =?utf-8?B?Tk5ENmQ5cXZXWWJ0L3VHdEZ0YVRkQ0c0Q3czNVJmTjdwdmhlNStrbmo4Sm5p?=
 =?utf-8?B?QVdRMmhPR1YxZUtQT0I3YjR5NHpSeWRsWVB3dUVobnRxSDRFVzU0K1A5K2dx?=
 =?utf-8?B?S3E5ZU9pQkVwN2w3T0sxd3E1ODdheUZlWEJvcG9vZkhmK0tkYXZ1Um5jNGps?=
 =?utf-8?B?VE1JWmhzMTNlVldFMlBJMWVDaVZOQVlMVExjeVdzZUk4MUtzazJ5cnNtWDVO?=
 =?utf-8?B?QUNnMitjcXJoSDJESGNybW5QQ0pPYkJ2cC81aGx2K3R1QjV0Um9pTzJMbHF3?=
 =?utf-8?B?TkRscXJaY0NlZGpRNUtHcURuaFB3UjQyMHJIQW5aQzFtOUV5MEdGV3JKQnlV?=
 =?utf-8?B?dXN0aHVTNFNrWFRxT3Y4Nm9ZUFE4eHA2NmlrQk0xVDROZXd3VDlQT2FsUHNC?=
 =?utf-8?B?MmptcisyN3owR2EySXp2YjJRZU1BQnJOdFVrNCsreVoycjJzU0dCUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e902674-99b3-47d3-50a2-08da1c320a04
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 03:10:46.7250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5++QU8lbHrC2NnW61cZrkLK5E42kpsoPRzYg0oZ3j5U3v0jkzSZedMS2v2GrnxaGhUx7ur5AvtxFyNTd2ufJ4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3008
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IEJoYW51cHJh
a2FzaCBNb2RlbQ0KPiBTZW50OiBNb25kYXksIEFwcmlsIDExLCAyMDIyIDM6MjEgUE0NCj4gVG86
IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGFtZC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgamFuaS5uaWt1bGFA
bGludXguaW50ZWwuY29tOw0KPiB2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbTsgaGFycnku
d2VudGxhbmRAYW1kLmNvbTsgU2hhcm1hLCBTd2F0aTINCj4gPHN3YXRpMi5zaGFybWFAaW50ZWwu
Y29tPg0KPiBTdWJqZWN0OiBbSW50ZWwtZ2Z4XSBbVjIgMi8zXSBkcm0vaTkxNS9kaXNwbGF5L2Rl
YnVnOiBFeHBvc2UgY3J0YyBjdXJyZW50IGJwYw0KPiB2aWEgZGVidWdmcw0KPiANCj4gVGhpcyBu
ZXcgZGVidWdmcyB3aWxsIGV4cG9zZSB0aGUgY3VycmVudGx5IHVzaW5nIGJwYyBieSBjcnRjLg0K
PiBJdCBpcyB2ZXJ5IHVzZWZ1bCBmb3IgdmVyaWZ5aW5nIHdoZXRoZXIgd2UgZW50ZXIgdGhlIGNv
cnJlY3Qgb3V0cHV0IGNvbG9yIGRlcHRoDQo+IGZyb20gSUdULg0KPiANCj4gVGhpcyBwYXRjaCB3
aWxsIGFsc28gYWRkIHRoZSBjb25uZWN0b3IncyBtYXggc3VwcG9ydGVkIGJwYyB0bw0KPiAiaTkx
NV9kaXNwbGF5X2luZm8iIGRlYnVnZnMuDQo+IA0KPiBFeGFtcGxlOg0KPiBjYXQgL3N5cy9rZXJu
ZWwvZGVidWcvZHJpLzAvY3J0Yy0wL2k5MTVfY3VycmVudF9icGMNCj4gQ3VycmVudDogOA0KPiAN
Cj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBW
aWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPiBDYzogVW1h
IFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQmhhbnVw
cmFrYXNoIE1vZGVtIDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPg0KDQpSZXZpZXdlZC1i
eTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQoNClRoYW5rcyBhbmQg
UmVnYXJkcywNCkFydW4gUiBNdXJ0aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0NCg==
