Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8DA8A4C53
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 12:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D2011243B;
	Mon, 15 Apr 2024 10:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkZxdCY6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7133411242B;
 Mon, 15 Apr 2024 10:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713176067; x=1744712067;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zWL59ABeDkLNsEb9PnfEdhISXHm4W0YuL6MMKMxt7L0=;
 b=jkZxdCY6Vq/W2bADdI0fnbQgGCcJ7y/OtzIp2gIoXq4WrkqOkmbYyJgV
 JFfHDarcuF+soIL7jZd+6KEmK7QXlPMvfAWZJC/f89Bpc6BhL2hhbYs75
 MgrHI823jeTDG3Yp6tOsOJ8PEBGT9hcydnixUpZ14M6hdIbmYUS4HcUiY
 z1kSDTpDdxXclGtG8xZ2C3piLyOXM8K5bxy4ezW5VBpXI14Cz5k0FT51O
 vIzBnuyv85aRn/ngBcUUIehBXJtR6semJEoumZCzHQSOrSx3Bp2w3gWWD
 WgBI9OCyXm8bM6FyEfhxnrgs0njhzdN8o5j0cviFb/cwq+Zr4CyNPMLxd Q==;
X-CSE-ConnectionGUID: rKSAzLReQy2ccif05fw1Hg==
X-CSE-MsgGUID: NvKx2j4BRo2DjSsjwC6mJA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="19951845"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19951845"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 03:14:27 -0700
X-CSE-ConnectionGUID: YQL3XSyNQLiDfYY2anNXPw==
X-CSE-MsgGUID: X1IArSz+RKub2AMq6dCvLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="21970930"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 03:14:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 03:14:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 03:14:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 03:14:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 03:14:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elZMzvxWtnWuigUUlTudEO/ePSfZ/kJdqS4TuHN/q2v/mqk4Hb1hWzIpIkKjPBWqvW17rFz6Y0j1Kqx1PdhI3uiWOWOX17rFldYPiw02tjGBFMVAO9rOnvTo2yVDa6SoxUlcjkFdMkJboQFYDmewregeTSIdFZWrCn6hoaKxZWAJBeaFdImUwA/Y9JZDV2mpot9d01uakXOHmkALjAyjLDccllRKHUsbWVL8CZiXkOjVm/fAQZ9ubsaAfAtIUX+xCR5N3DSbSVWYGUxhppQ0VVRK1ql6k/jWx5Bl4jfGfTjcm6K1qfm5b+0clI4FoLYkG3/vZT9gO7DYPxE46z9GZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWL59ABeDkLNsEb9PnfEdhISXHm4W0YuL6MMKMxt7L0=;
 b=fYJDoxX5AtG7W919tYgXV0324YM4exQyWDx1/MKhvkMl/Zb2fFPWwcjCuUr1b/sb3uYtDRGACbSmlHQsV3+mf5uidM7WoTKhOTzNkrVdjhG+GjngqPQgWKReOEuvof4aBC0G+AN8qKk44I6IiQFXRAYS/pJ+KxYt2o0kNRG6t+gh9YW7RlqGAa9FFA7H/AKMtD5rX7MY2LvHoQVQRnWKc1Snzo3cUt1nYA/Q3WmAcwVj5Znaheey/hyqvzW2wxheFh8rjqHd/Qd/YQd+0I5hSqAvxP14HOEAUNyRIIxElH7fZa3DkuDqSW7Eldf5Vv8yuNbFUhbOcx8ZI0Qm1Fonig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 CY5PR11MB6510.namprd11.prod.outlook.com (2603:10b6:930:42::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7472.26; Mon, 15 Apr 2024 10:14:24 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::bccd:7928:80ae:179f%5]) with mapi id 15.20.7472.025; Mon, 15 Apr 2024
 10:14:24 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Manna, Animesh" <animesh.manna@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: Re: [PATCH v2 6/6] drm/i915/alpm: Add debugfs for LOBF
Thread-Topic: [PATCH v2 6/6] drm/i915/alpm: Add debugfs for LOBF
Thread-Index: AQHajPO3b7Ps4N0EbkSnMW03J+S+OrFpIXiA
Date: Mon, 15 Apr 2024 10:14:24 +0000
Message-ID: <a0e3f4acec56e84dcfca5e5a08275e9fd5862c63.camel@intel.com>
References: <20240412155243.2891996-1-animesh.manna@intel.com>
 <20240412155243.2891996-7-animesh.manna@intel.com>
In-Reply-To: <20240412155243.2891996-7-animesh.manna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|CY5PR11MB6510:EE_
x-ms-office365-filtering-correlation-id: c3b4bbd7-b0b8-49ea-f03a-08dc5d34d34c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NmJ7Y/rh3Xr48QSOyfZq6LD1PbKx9yxRlZx00aIHFTp3UG9P28da5HyMpB4prgPJlMgsKITsOkiUI4NEOxnVUQxpMTlm1UdKYNE19TzjXWlAjae6Yqjr2lK//F36q0YRH3w2X+nTgx9QOUwD5Kz0DW5NT9MILdGL9jwbmdB9GcmIUunM78AhG/eSMGM1UGwXtEyOAGR41t4+NolkRh+UEhvk9zVSwG+ZqsqHmMb9T1tSUAuWqfJnD35qIRb2kPSyPGYd4UihsG8cv8sKvNlu2t68qZlDS4lutrEL7Ws5tv1bi603QXuIgfF9jqJmZNwbUSqLAAns9jy1FvBOLEgGUPzRj+uX1lAgZTImROHiwSIpr4zSSdr1vHs9LQfRjvZvWSSKjey09UO21yeeDQRqnwmdrBqMxxJ56JQ7TbFwtVuEpMp8NpebeZCgFuHOwIKTJ7qtU1igS5ZDc4nYqAX582RT3WYySvN06oVcw9JmylXMHLodAQWzL6Zb+9u4dXNjVbvtbPA1xyCCq1/To81XTRHO72XoB7EcoObEXiphuLL7bfMFu/akFcKHeag0N9GFOZQkdD8Q99j8pgRvZ9FlIY+vXGrxseZDeS/dzYNARB5/Ix4E37pCNhqkFCCUVItGvJB96CF9huZWSXjWDRwg+jpyt6zDgcRLiVQfh53R4utY3/85jGCmoishl+44+rmVJ7yZYi/KCgCoH8KkxysAIZX5Dz2sD9zl8QBuG2UCiVY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXp1OGRINzh1dVQwaXZJTnpWMGUzUEFGY0dnNEJGeGZDVm03c25uaGYzYk5m?=
 =?utf-8?B?RzBNVHRBYTZFR04vTmloVkpBcnFTSUVvWk9veUUveG5vaVZOemdvYzBhNitw?=
 =?utf-8?B?RVpZSHYwa296ZEZCb0l2akRuN2kweVhDRWZEeDJxeHpuTXNheWw2WmxhWHNT?=
 =?utf-8?B?Q0hKOWlzQk1wMHZ2WHpSeS80VnlCTVhHcnV1Q0Qxamx6b2gzUGxBdzR0U3g4?=
 =?utf-8?B?Z252c0F5eXhTM3h5R0Mxb2szVldrOHFhZHhocHJKc0Y3NXVsS3V6OHU3MERt?=
 =?utf-8?B?Y1htVTlRczZMWUovMlArZ09jL2JjNjVqZURTblF3MW9nV21CK0NUcys0K0Zz?=
 =?utf-8?B?ZFVZQUEwbVNwV0tJVHp5aitDRXpXYldSbWZxb3d0Z2dmd2lNbGgvUDBlMm04?=
 =?utf-8?B?bWZLdkttZnlNNGEvSzZQLzBuVXVuN2NyZVZMdXlBODBvZC96TzBJUU1wTTZO?=
 =?utf-8?B?bExVb0ZZMVlUN2NpNnpodlcyQlpUL2pEVjVpN0pEb1Rma1FVYVBWdnhYOTRk?=
 =?utf-8?B?SElMNHpXMUl5cVlBNXhuYXdIblh5UERSYWx3T2JsRG13bzJIVmtaZ3VhTDFL?=
 =?utf-8?B?YktNZ0FJNlp1SjRGK01yL2lzRHZRazZ4bkQ3eUx3VHYwTzhYMGdaRkFwaURn?=
 =?utf-8?B?NnJVNXc0WHdPaE1mbWhsbXBnZGNoeEFSMEFUdlROeHd0d3pTOVNnTjF2MmtW?=
 =?utf-8?B?RXNFdi92dzhvNU1TSlZGUEJSTnBjSERxN01oL1Azb0htQ2h5SzVISnA0aUNk?=
 =?utf-8?B?bDk0bi93U05lSXdnZ1krc2hSaWUyVW14VzBzdm9mUldIRVRiUkRCVXNRZTVW?=
 =?utf-8?B?VlQ3M3dDTFg1UmxZbTY2ZWQ2OWxmYld5bEl3N2NpSWgxTkphOXZoKy83dlpp?=
 =?utf-8?B?NlRJbkVRbGg2bzZsRGZNZ2xFZzlnNk93Y2p4am9Rb0ZkVTdjcUtjU2UrdEUx?=
 =?utf-8?B?bUxXTTJORUQvOUE2ajFSdEcra20rMi95OTBaY2ZpaVA1OVphNjloaEpyNXFu?=
 =?utf-8?B?MlNrbUpWSVQxNUhGcy93M1g4WDJ2V0JDTW5kVWFYYmhkTmFWZGo1aWdNSE5U?=
 =?utf-8?B?WHc2TWhVM2ZHNEp2MlN3QnhkSGdwV01ISHhlQVhSWm04b0pyZzB2OXRmT2Qv?=
 =?utf-8?B?UU5rS0gxaW9aR0h5UlpwcnRrVU9jdm90bGNVWFI2NEd5ajJtQTZNTCtYWVBv?=
 =?utf-8?B?YVhpc0FGR2lnQTVUcU4vWTQvRSs4VjRCQWRlcUx3M3VpYk5RTTBYbTNsYWU5?=
 =?utf-8?B?UTFoUWNrTHhPUHM5TUtCd1htenZ5LzhlRnoxSTY2ekVHUXA0T0VJenFEWUp3?=
 =?utf-8?B?dUY1dFV5WnJncjZLUDhmczY1b0FYVE5FMnpxaksrbjlzZk9qcC92OS83RC8y?=
 =?utf-8?B?WVJQMmdXbXhWekh2RGo0dnhxUUpQZG9YNjJ6ZFZJdm5WeTJBM1cvTGkvUE9r?=
 =?utf-8?B?VzZTaGV1Wk5oSTJaMml6cWhuUUdRcE1lS0NPV0NubEFGcGx2UmloNDlnRDFS?=
 =?utf-8?B?TEg4TlJDMWxWUlYxdDR0cUtkemZ5ejhESXVNeWNFUitsbHJrUEIrVjcxNW13?=
 =?utf-8?B?d3pNUWVxOXY2REI5VC9xbVRQc1FsUDJqMkZzcjZzZG1tbmdoYWFRS3RyZG9u?=
 =?utf-8?B?VkNPMkl6TUcvT0FRZ1p4UFpBUVdWaVhBWWFBYmhkdHg4bVoxbEhQZ1hwdFZ2?=
 =?utf-8?B?RUdLTDhCQVl3VElvSnIzNjVBd2NqNi9WUFNXTzFKTzJOd0xPdU5QbGNMcVUx?=
 =?utf-8?B?TmdIY1hZVHpMeXpWaEcyS0djNnlHaExFNlhlKzF5NW1OakliMG1JYlNCVUwy?=
 =?utf-8?B?eVAzV2EvVnVTODNOV3RyVWZhREVXS0RkWmI1TzlyRjI3cFdJNFk2c0YwbnAw?=
 =?utf-8?B?cmJQWDVyY0RxenA3dS9ySFY0WE1vVTdMcWxDZkRSOWh3a2NJZlpmTGZRK0xR?=
 =?utf-8?B?dVdLM3BrZ2dOK3B0a05FMXRqajJRaVhRdm5kUEljUjFFRUNNb1VWZ0JPcVBR?=
 =?utf-8?B?VXVTOGowd0s3a0M3SEQzeFJIWXRjWW56cG5ZOGI2QzJVVXJlb0F0alhmMU5R?=
 =?utf-8?B?NXJESVBaUWNiYU5ERlh6bDJsSnJOc284KzhuS3FiWXM5SmVkdDE1R0gxV1lE?=
 =?utf-8?B?Mjl3cnJvQzM1bXpFMkxBTHg3cG42Y25XczBIZ2ZuR2t5MnpodDIxUTg2Q28y?=
 =?utf-8?B?Nnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <502F60C2AB989642AAAFEC7A59456404@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3b4bbd7-b0b8-49ea-f03a-08dc5d34d34c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 10:14:24.4364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ymzMTeT6/JdQlCULmQ0T6XhI7ZLrVd9GAimu6V0o/oEPPT0yOhM0QO3nviARrIzAWG1OzND2UKB8jD6J/Usl16Kt4x9d7syGv8pUAW/HPkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6510
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

T24gRnJpLCAyMDI0LTA0LTEyIGF0IDIxOjIyICswNTMwLCBBbmltZXNoIE1hbm5hIHdyb3RlOg0K
PiBGb3IgdmFsaWRhdGlvbiBwdXJwb3NlIGFkZCBkZWJ1Z2ZzIGZvciBMT0JGLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+DQo+IC0t
LQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jwqDCoMKgwqAg
fCA0Nw0KPiArKysrKysrKysrKysrKysrKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9hbHBtLmjCoMKgwqDCoCB8wqAgMiArDQo+IMKgLi4uL2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheV9kZWJ1Z2ZzLmPCoCB8wqAgMiArDQo+IMKgMyBmaWxlcyBjaGFuZ2Vk
LCA1MSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5
L2ludGVsX2FscG0uYw0KPiBpbmRleCBhZTg5NGM4NTIzM2MuLjIxZGZjMDY5NTJkNyAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gQEAgLTMzOSwz
ICszMzksNTAgQEAgdm9pZCBpbnRlbF9hbHBtX2NvbmZpZ3VyZShzdHJ1Y3QgaW50ZWxfZHANCj4g
KmludGVsX2RwKQ0KPiDCoHsNCj4gwqDCoMKgwqDCoMKgwqDCoGxubF9hbHBtX2NvbmZpZ3VyZShp
bnRlbF9kcCk7DQo+IMKgfQ0KPiArDQo+ICtzdGF0aWMgaW50IGk5MTVfZWRwX2xvYmZfc3VwcG9y
dF9zaG93KHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZA0KPiAqZGF0YSkNCj4gK3sNCj4gK8KgwqDC
oMKgwqDCoMKgc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yID0gbS0+cHJpdmF0ZTsN
Cj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGludGVsX2RwICppbnRlbF9kcCA9IGludGVsX2F0dGFj
aGVkX2RwKGNvbm5lY3Rvcik7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgc2VxX3ByaW50ZihtLCAi
TE9CRiBzdXBwb3J0OiA9ICVzIiwNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RyX3llc19ubyhpbnRlbF9kcC0+bG9iZl9zdXBwb3J0ZWQpKTsNCj4gKw0KPiArwqDCoMKg
wqDCoMKgwqByZXR1cm4gMDsNCg0KV2hhdCB0aGlzIGRlYnVnZnMgaXMgdGVsbGluZz8gTG9iZiBt
YXkgYmUgc3VwcG9ydGVkIGJ5IHBsYXRmb3JtLCBidXQNCm5vdCBlbmFibGVkIGJlY2F1c2UgUFNS
IGlzIGVuYWJsZWQuIFNheWluZyBMT0JGIHN1cHBvcnQgPSBubyBpcw0KbWlzbGVhZGluZy4NCiAN
Cj4gK30NCj4gKw0KPiArREVGSU5FX1NIT1dfQVRUUklCVVRFKGk5MTVfZWRwX2xvYmZfc3VwcG9y
dCk7DQo+ICsNCj4gK3N0YXRpYyBpbnQgaTkxNV9lZHBfbG9iZl9zdGF0dXNfc2hvdyhzdHJ1Y3Qg
c2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpDQo+ICt7DQo+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBp
bnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvciA9IG0tPnByaXZhdGU7DQo+ICvCoMKgwqDCoMKgwqDC
oHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAgPSBpbnRlbF9hdHRhY2hlZF9kcChjb25uZWN0b3Ip
Ow0KPiArwqDCoMKgwqDCoMKgwqBjb25zdCBjaGFyICpzdGF0dXM7DQo+ICsNCj4gK8KgwqDCoMKg
wqDCoMKgaWYgKGludGVsX2RwLT5sb2JmX2VuYWJsZWQpDQoNCkkgdGhpbmsgYmV0dGVyIG9wdGlv
biBpcyB0byByZWFkIGl0IGZyb20gdGhlIHJlZ2lzdGVycy4NCg0KQlIsDQoNCkpvdW5pIEjDtmdh
bmRlcg0KDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdGF0dXMgPSAiZW5hYmxl
ZCI7DQo+ICvCoMKgwqDCoMKgwqDCoGVsc2UNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgc2VxX3ByaW50
ZihtLCAiTE9CRjogJXNcbiIsIHN0YXR1cyk7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJu
IDA7DQo+ICt9DQo+ICsNCj4gK0RFRklORV9TSE9XX0FUVFJJQlVURShpOTE1X2VkcF9sb2JmX3N0
YXR1cyk7DQo+ICsNCj4gK3ZvaWQgaW50ZWxfYWxwbV9sb2JmX2RlYnVnZnNfYWRkKHN0cnVjdCBp
bnRlbF9jb25uZWN0b3IgKmNvbm5lY3RvcikNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0
IGRybV9pOTE1X3ByaXZhdGUgKmk5MTUgPSB0b19pOTE1KGNvbm5lY3Rvci0+YmFzZS5kZXYpOw0K
PiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZGVudHJ5ICpyb290ID0gY29ubmVjdG9yLT5iYXNlLmRl
YnVnZnNfZW50cnk7DQo+ICsNCj4gK8KgwqDCoMKgwqDCoMKgaWYgKERJU1BMQVlfVkVSKGk5MTUp
ID49IDIwICYmDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25uZWN0b3ItPmJhc2UuY29ubmVj
dG9yX3R5cGUgIT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCkNCj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybjsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqBkZWJ1Z2ZzX2NyZWF0
ZV9maWxlKCJpOTE1X2VkcF9sb2JmX3N1cHBvcnRlZCIsIDA0NDQsIHJvb3QsDQo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbm5lY3Rvciwg
Jmk5MTVfZWRwX2xvYmZfc3VwcG9ydF9mb3BzKTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqBkZWJ1
Z2ZzX2NyZWF0ZV9maWxlKCJpOTE1X2VkcF9sb2JmX3N0YXR1cyIsIDA0NDQsIHJvb3QsDQo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbm5l
Y3RvciwgJmk5MTVfZWRwX2xvYmZfc3RhdHVzX2ZvcHMpOw0KPiArfQ0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmgNCj4gYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uaA0KPiBpbmRleCBjMzQxZDJjMmI3ZjcuLjY2
ZTgxZWQ4YjJmYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9hbHBtLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9h
bHBtLmgNCj4gQEAgLTExLDYgKzExLDcgQEANCj4gwqBzdHJ1Y3QgaW50ZWxfZHA7DQo+IMKgc3Ry
dWN0IGludGVsX2NydGNfc3RhdGU7DQo+IMKgc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGU7DQo+
ICtzdHJ1Y3QgaW50ZWxfY29ubmVjdG9yOw0KPiDCoA0KPiDCoGJvb2wgaW50ZWxfZHBfZ2V0X2F1
eF9sZXNzX2FscG1fc3RhdHVzKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApOw0KPiDCoGJvb2wg
aW50ZWxfYWxwbV9jb21wdXRlX3BhcmFtcyhzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLA0KPiBA
QCAtMTksNSArMjAsNiBAQCB2b2lkIGludGVsX2FscG1fY29tcHV0ZV9sb2JmX2NvbmZpZyhzdHJ1
Y3QgaW50ZWxfZHANCj4gKmludGVsX2RwLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpbnRlbF9j
cnRjX3N0YXRlDQo+ICpjcnRjX3N0YXRlLA0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fY29u
bmVjdG9yX3N0YXRlDQo+ICpjb25uX3N0YXRlKTsNCj4gwqB2b2lkIGludGVsX2FscG1fY29uZmln
dXJlKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHApOw0KPiArdm9pZCBpbnRlbF9hbHBtX2xvYmZf
ZGVidWdmc19hZGQoc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9yKTsNCj4gwqANCj4g
wqAjZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZGlzcGxheV9kZWJ1Z2ZzLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXlfZGVidWdmcy5jDQo+IGluZGV4IDBmZWZmZThkNGU0NS4uYmExNTMwMTQ5ODM2
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXlfZGVidWdmcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
ZGlzcGxheV9kZWJ1Z2ZzLmMNCj4gQEAgLTEzLDYgKzEzLDcgQEANCj4gwqAjaW5jbHVkZSAiaTkx
NV9kZWJ1Z2ZzLmgiDQo+IMKgI2luY2x1ZGUgImk5MTVfaXJxLmgiDQo+IMKgI2luY2x1ZGUgImk5
MTVfcmVnLmgiDQo+ICsjaW5jbHVkZSAiaW50ZWxfYWxwbS5oIg0KPiDCoCNpbmNsdWRlICJpbnRl
bF9jcnRjLmgiDQo+IMKgI2luY2x1ZGUgImludGVsX2RlLmgiDQo+IMKgI2luY2x1ZGUgImludGVs
X2NydGNfc3RhdGVfZHVtcC5oIg0KPiBAQCAtMTU0Miw2ICsxNTQzLDcgQEAgdm9pZCBpbnRlbF9j
b25uZWN0b3JfZGVidWdmc19hZGQoc3RydWN0DQo+IGludGVsX2Nvbm5lY3RvciAqY29ubmVjdG9y
KQ0KPiDCoMKgwqDCoMKgwqDCoMKgaW50ZWxfZHJyc19jb25uZWN0b3JfZGVidWdmc19hZGQoY29u
bmVjdG9yKTsNCj4gwqDCoMKgwqDCoMKgwqDCoGludGVsX3Bwc19jb25uZWN0b3JfZGVidWdmc19h
ZGQoY29ubmVjdG9yKTsNCj4gwqDCoMKgwqDCoMKgwqDCoGludGVsX3Bzcl9jb25uZWN0b3JfZGVi
dWdmc19hZGQoY29ubmVjdG9yKTsNCj4gK8KgwqDCoMKgwqDCoMKgaW50ZWxfYWxwbV9sb2JmX2Rl
YnVnZnNfYWRkKGNvbm5lY3Rvcik7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoY29ubmVj
dG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0IHx8DQo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlB
IHx8DQoNCg==
