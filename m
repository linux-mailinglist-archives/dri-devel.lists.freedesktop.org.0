Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4AE67FE03E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 20:22:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CEB10E37B;
	Wed, 29 Nov 2023 19:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADE710E571;
 Wed, 29 Nov 2023 19:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701285724; x=1732821724;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cDWfixFxgwzWAQICjgNjGEhQkI4fCG+gPL/lfQmBsZs=;
 b=hllgO/60BqUQokm30kQoMHkllMJSXiiYneQwrEWQZQp2XiLL/Jax/4+m
 CN8qeKM72Bbt+UFzab/diqp5HqNTzYY1q6jGgYTA0cW3p3lJexJUM7OUR
 8w9zVSLGyE6QjOd1UVbbwpP5i3c+DEHY6c/ehbjitSiTrY0ciCkcpk+sb
 b3QaezI0yuB5F5uOtCWHYIz3Qhr8TeDb10rltqaokzPmLjlzdnlQzIHJq
 q5r2iouNYTNcbuPBB4mkW5P/KK/hS999qBiO81PV16k120QPQFD1bpHq5
 NYMZBW9vzfWeU3TakoSXgQrVr4RqoRhdUQHYnhgUn+Qdel/ZTMtbWDNAy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="373397977"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="373397977"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 11:22:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="762424533"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; d="scan'208";a="762424533"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 11:22:03 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 11:22:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 11:22:03 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 11:22:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M2huBO6Evi/3t6a3zXKNCl4S94ALxD6K76Z0jGANXBEcS8yexBRLPRI0sfHenu32ig4cRUDz0dLHxLTNeqnZwL6WnL3fCuqutTtbl12dTBFugVpiNUxNh27k2Fuw9nc4MXU507qBG5W8ao2/Lg60Rhs4unK1nGite1Q2JbC8mErGjE3VOn4osViF4jEYKZnEID8mzvN9FWEsvkyp/Sa3m2E46+pz+FfirB2BC5/0WgE2TeyIAjYgnmokTJ6k14kDrHheS/uX3T1tnO1MixLrA3pWl4zHUZxzFXMEn1WWBIcBuVjqtdUYdAk9ZbbK1Hv2jftmI9SRxt4fuBlo0iuCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDWfixFxgwzWAQICjgNjGEhQkI4fCG+gPL/lfQmBsZs=;
 b=ZMuVBnYjwxA7Yv4lrVlWgX69UzaIMz0K6fcRGODSTSNTKQDfFmtwCED/R+xnonF/L54XNgkPXSb2Rsx/87jyQRl7tcbuS4fvUdX7y4/uCKDfMSft4Vj4JUjvOsJfKpmuc9GWFuK6n7YwkNaYZ+4MWdFqO2nQamTl3osmkbxINoPJQpsAye/1GRWbApwcj1VI2inK8WrRazmNeAbAr8qUsjJVfxJH1DeuWdxi7PTaxtARzfZNDJ0YRHK409r7t2eeJ+XT35r2SyjF4ejcn2wGtBvDL5IDxea+wGvrmil7R6EectedyTzrW+0WxL1IZ5KdticOOM8mI5oCpxx3KF/0vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 BN0PR11MB5712.namprd11.prod.outlook.com (2603:10b6:408:160::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 19:22:01 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::d070:1879:5b04:5f57%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 19:22:00 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915/pxp: Add drm_dbgs for critical
 PXP events.
Thread-Topic: [Intel-gfx] [PATCH v5] drm/i915/pxp: Add drm_dbgs for critical
 PXP events.
Thread-Index: AQHaHXhOoDM9QwFyi0OU3Pb2W/DGIbCJJgyAgAiRpwA=
Date: Wed, 29 Nov 2023 19:22:00 +0000
Message-ID: <32a56d7b35070c583c51697bfa3c962d00dbe85c.camel@intel.com>
References: <20231122191523.58379-1-alan.previn.teres.alexis@intel.com>
 <1f275bf3-079c-44c1-80d9-3fff76274ae6@linux.intel.com>
In-Reply-To: <1f275bf3-079c-44c1-80d9-3fff76274ae6@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|BN0PR11MB5712:EE_
x-ms-office365-filtering-correlation-id: 5ac44091-5a10-413f-e210-08dbf1107641
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xJJZsPMUJrcRtLQ79TVk9UHafkbLvtB/k2V+kTv8J5coHOmuTiirfzmQ6wv9Nvw7jsE+l0M51infhZvb57c2q+e5ZAwDbrK9JjzzqJUGPUZU7e446apVLxyUsvWKp4seScE5p9e143GZNKfi+1RXuXrjM75EDX5VRP5fimwsVIYRk558yHSevjCilQzI/lLjMN1O79r94PsI50g8pwQvFw192V26T87Vrd2/0QhcsYhXzZwuQ4fL6fUM1Y+X4V1lp3QE95WGFqD6mT8X1XmmIjiYr2NaSW/ep4HCtE3YOpk5sgS1CvQ/MFecGQz2u0nZn2r2eIP+Kc6JiPIuaNMJ5wqJjc8YZ0dttyncZXjNDc0RENrxjNJgADldUNKKrjMB+kYjs/A/wvkHkGmNnloRSjMsEJHzZ+IfoEzFeOJEDP8up27NGZH98drBkSm37rywwzEh2iSxIv/T0b15ucqJhWPFo/L3M70XoyosyYZ7sUUfkhyzJvphqwONBHFFQK8OYGitIiLaB83xzYEjEC5n9WMIfjuF4MMaiDr8MaEq1AhMWRGEE9h68DOkX0HdMEiFk/UX94JgdrYGYhZf3qz5aBeeiedoOvi7WnEbIz0L3FdquEyX9oDEOSCo7uF8/gFwRg5BI4+AKsahOCSaGRwArT/LHThB/z7XaMyivCimO5c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(39860400002)(346002)(396003)(366004)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(6512007)(83380400001)(122000001)(26005)(2616005)(38070700009)(316002)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(4001150100001)(91956017)(110136005)(2906002)(4326008)(8676002)(8936002)(5660300002)(86362001)(6506007)(53546011)(71200400001)(478600001)(41300700001)(6486002)(202311291699002)(82960400001)(36756003)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QnYvZWVCekptMHVhUWo5ZnZ3MmhHYVpMZkJGWGNYMk00M0ZSRFNXN2d5TDY3?=
 =?utf-8?B?RENSa1hINnVyQk9iN1BwaGNiRG1hR0h1SXdlNlRORVBnWDFZYkFZOVFjS2xv?=
 =?utf-8?B?ZG1xYXNWcEszcjVzWmF1c0ZWODJTT0hUMVdwTVNZUThLQ2R0Zy9zS1ZDdDVM?=
 =?utf-8?B?bnBVNWNjOVdZMjlPSzRqV1dJaGhseVF4czA3NGR5TG1rbzh5aHRWVjdzWEhh?=
 =?utf-8?B?dDgrTnVuc0lrM0lDTnREaVYwR0lERTBpTGpiMnhoVURBTGVrVmpFWWNEdjJW?=
 =?utf-8?B?ZUtaTUFndW9raDZHVDB4RTZQZVhUdGNYVHJ5MnJjYkl4NjVVYnZ0dHVvTEFa?=
 =?utf-8?B?ZmFnNy92UFNheEMzTUdwTTBodDJLZzdFRXdzSlRBOXZEb01wWVNRT0dmQmx5?=
 =?utf-8?B?cmtMTGpNZ2ZHTUJxNUcwL3c2bVM4UUJsN1dyTDhoZXVWN2d6dkxLSHY4Vm01?=
 =?utf-8?B?M1Q2dG5GQXA5aFkzWFZGUGhxaVNud0RCRjlSVms1emJMY1NlblgrR3oyZFpR?=
 =?utf-8?B?QmhJZ0RKdTlNRDd2OS8vWERUNFZLbU1SVUFHWEZGRHBhdWZOcmIyL2ZNYTh3?=
 =?utf-8?B?eEY4NEtkUVpSakFhMHdwMkZ3Q3ZRUGZFR05TT0JPVWNhLzd2Snp1VklrSjha?=
 =?utf-8?B?NnNwYk9GSDUxVU9INUh1NitwVzd1cVBCZk5kdjJVTmQ4KzUvb3BEcXlCNmZ1?=
 =?utf-8?B?aU9jT2lPMnJ1VkVycmEvZnhFdWVkK3V2QnlVS0czZkwrUkNReVpqU0RnVWoy?=
 =?utf-8?B?dW5hZXNqQ0FRYk5zcFVHZFBuQUxBc2ZYVXdZMDRCeEh3UTdHQ1cxYnBhcytO?=
 =?utf-8?B?WkFBTUJZV3kzMU43YlFLQnFYODJyZDdxMEovdkRBalhHV0dCaENBclJxQW9U?=
 =?utf-8?B?T2dLczNzNkhkTTZLNmZLNHJQS2t6NDh1VXNubHR6dVhHaG1WSndvMDJPWWdn?=
 =?utf-8?B?UWRYY2drT0FyMG41RW43UW5yM2ZQZXhzUnlMWC9KcjlJM0kyV2RidmdrN2Y4?=
 =?utf-8?B?UG9WS1NGbStmWHF5V0lnVVJWWmZ5VDBoa0pHd1FTaW1raEJnNzN2cXBOQyt4?=
 =?utf-8?B?ZUIxblpCcnk1c0diSjI1SUZuYm1nZ0Z3WGVhenJqMGFxckdXNllTQnBVeVNI?=
 =?utf-8?B?a0prcHVIYXZOQ09XTWpaZWpsUkNTbGJVUDVtUHZCNXlKNHVlRjlRYnk3dmE5?=
 =?utf-8?B?NFhCWTdtMVplWnFNY3g1V1VvVGx6Wk9lZ3U2aFB6b0x4Um5SYXhVclRqUzhR?=
 =?utf-8?B?S2VEekJRZ0dYZUZlL3g4bk15QjduVXZxNzgrQUJwWTlFZ3VsZ25LVW5FS0Jm?=
 =?utf-8?B?WkxyVGpNemtGRVMwaUtZU1ZHK21udGllMmVIM3drVzJtY2VqdzB4M0RRNWZ6?=
 =?utf-8?B?Rlc0Vm9hMzBLWjFPK3p1OWpPOUZkelV6Mm5zQ016czFDWGJRcTNCblR6VlRl?=
 =?utf-8?B?bnMrYVpBUFd3Nk5SSXlBTmpaOUU1ZDFlVDZoTG1SclB0WXBUeHdlWWdwWmJN?=
 =?utf-8?B?MDNSbUVBNEtYZ1JQdEZLMWhZUWRVYVh4K1lZa2tNbUtiSlcvay9WdHR5RGM1?=
 =?utf-8?B?aEVRTzl4OE5IUHEvZ1drYmVIRlBaTXRuVHFxNkNrZ1J6NktSZjR1YVFFdVhO?=
 =?utf-8?B?bmJBbXJVSGFTVXRpZHByRG1EVFAwV2grSnpLSHJXd0lrcENtaEhUd3V3ZVNT?=
 =?utf-8?B?QXpDNEpPcWdTYVZnZUhXK1dwemVmZ083NG4zbzdBTmlxZXJ5TWREeldqVXRQ?=
 =?utf-8?B?bVRNeG42Y1d6azBJV0xaMUZhQnZ1eWZHWTFlN3lNaHJYZVFueWNRZHdXalVm?=
 =?utf-8?B?NG1HbzdKZDNzVldrK3NHMmUxN3gzZjdEQ0ZNdXJpcjhaVHJ0bWVSSThhMUNQ?=
 =?utf-8?B?U0k5UUdmRWFKU0tzUy9hVFZqcXlIM0E1TlRkL1hXTkFnaEFQNDlnbmhaVW9Z?=
 =?utf-8?B?cUo4ek5NRm9ISC8wT0lFSVhFYVlhVnUvazN4am0veWpuKzdaS1JJbnJXUFps?=
 =?utf-8?B?bk50WHdEVG9mUW80d3BmK1N2SEM2c1dqZnlPaVBSL2RHUGxkK1BwYU12Q0gx?=
 =?utf-8?B?NEVCK3NUWHBnd1VyZUNXTDZjOWdRbUdCalJkc3VaRzRVVXJBbUhGb0FtVmtW?=
 =?utf-8?B?Y2tYS0oxMVRiN3FpNjc4RXFmVWZ2cHdEN25rQU84Z3JNb0g4Q1JyUG1Rd0lM?=
 =?utf-8?Q?BmNdsSs49MgIGo6Jtqp3qDU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DD0107363087E41B245291D61DD1922@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac44091-5a10-413f-e210-08dbf1107641
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 19:22:00.8316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yonh3SI4AKR779N5ZazmO1pWF8a/TJFsVRqmQ1PwhPwI4n/im5/aNtSJgtmk9ugUuT5NqLj81VWGQKu8uBKp1PJva+oV41dlWLJf5y7aRrBcSto9zFb8s2JYWrp96Z3U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5712
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTExLTI0IGF0IDA4OjMwICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gT24gMjIvMTEvMjAyMyAxOToxNSwgQWxhbiBQcmV2aW4gd3JvdGU6DQphbGFuOnNuaXANCmFs
YW46IHRoYW5rcyBmb3IgcmV2aWV3aW5nLg0KPiA+ICAgCWlmIChpaXIgJiBHRU4xMl9ESVNQTEFZ
X1NUQVRFX1JFU0VUX0NPTVBMRVRFX0lOVEVSUlVQVCkNCj4gPiAtCQlweHAtPnNlc3Npb25fZXZl
bnRzIHw9IFBYUF9URVJNSU5BVElPTl9DT01QTEVURTsNCj4gPiArCQlweHAtPnNlc3Npb25fZXZl
bnRzIHw9IFBYUF9URVJNSU5BVElPTl9DT01QTEVURSB8IFBYUF9FVkVOVF9UWVBFX0lSUTsNCj4g
DQo+IFRoaXMgbG9va2VkIHRvIGJlIGRvaW5nIG1vcmUgdGhhbiBhZGRpbmcgZGVidWcgbG9ncywg
YnV0IHRoZW4gbm8gb25lIGlzIA0KPiBhY3R1YWxseSBjb25zdW1pbmcgdGhpcyBuZXcgZmxhZz8h
DQphbGFuOiBzZWUgYmVsb3cgaHVuaywgaW5zaWRlIHB4cF9zZXNzaW9uX3dvcmsgdGhlIGRybV9k
YmcgdGhhdCB3YXMgcHJpbnRzDQp0aGUgImV2ZW50cyIgdGhhdCBjYW1lIGZyb20gYWJvdmUuIHdl
IG5lZWQgdGhpcyBkZWJ1ZyBtZXNzYWdlIHRvIHVuaXF1ZWx5DQpyZWNvZ25pemUgdGhhdCBjb250
ZXh0cyBweHAga2V5cyB3b3VsZCBnZXQgaW52YWxpZGF0ZWQgaW4gcmVzcG9uc2UgdG8NCmEgS0NS
IElSUSAoYXMgb3Bwb3NlZCB0byBvdGhlciBrbm93biBmbG93cyB0aGF0IGFyZSBiZWluZyByZXBv
cnRlZCBieSBvdGhlcg0KbWVhbnMgbGlrZSBiYW5uaW5nIGhhbmdpbmcgY29udGV4dHMsIG9yIGFz
IHBhcnQgb2Ygc3VzcGVuZCBldGMpLg0KTk9URTogcHhwLT5zZXNzaW9uX2V2ZW50cyBkb2VzIGdl
dCBzZXQgaW4gYXQgbGVhc2Ugb25lIG90aGVyIHBhdGgNCm91dHNpZGUgdGhlIElSUSAod2hpY2gg
dHJpZ2dlcnMgdGVhcmRvd24gYnV0IG5vdCBjb21pbmcgZnJvbSBLQ1ItaHcpDQpUaGlzIGZsYWcg
aXMgc29sZWx5IGZvciB0aGUgZGVidWcgbWVzc2FnZS4gSG9wZSB0aGlzIHdvcmtzLg0KDQo+IA0K
PiBSZWdhcmRzLA0KPiANCj4gVHZydGtvDQo+IA0KPiA+ICAgDQo+ID4gICAJaWYgKHB4cC0+c2Vz
c2lvbl9ldmVudHMpDQo+ID4gICAJCXF1ZXVlX3dvcmsoc3lzdGVtX3VuYm91bmRfd3EsICZweHAt
PnNlc3Npb25fd29yayk7DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4
cC9pbnRlbF9weHBfc2Vzc2lvbi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvcHhwL2ludGVsX3B4
cF9zZXNzaW9uLmMNCj4gPiBpbmRleCAwYTNlNjZiMDI2NWUuLjA5MWM4NmUwM2QxYSAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX3Nlc3Npb24uYw0K
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L3B4cC9pbnRlbF9weHBfc2Vzc2lvbi5jDQo+
ID4gQEAgLTEzNyw4ICsxMzcsMTAgQEAgdm9pZCBpbnRlbF9weHBfdGVybWluYXRlKHN0cnVjdCBp
bnRlbF9weHAgKnB4cCwgYm9vbCBwb3N0X2ludmFsaWRhdGlvbl9uZWVkc19yZXMNCj4gPiAgIHN0
YXRpYyB2b2lkIHB4cF90ZXJtaW5hdGVfY29tcGxldGUoc3RydWN0IGludGVsX3B4cCAqcHhwKQ0K
PiA+ICAgew0KPiA+ICAgCS8qIFJlLWNyZWF0ZSB0aGUgYXJiIHNlc3Npb24gYWZ0ZXIgdGVhcmRv
d24gaGFuZGxlIGNvbXBsZXRlICovDQo+ID4gLQlpZiAoZmV0Y2hfYW5kX3plcm8oJnB4cC0+aHdf
c3RhdGVfaW52YWxpZGF0ZWQpKQ0KPiA+ICsJaWYgKGZldGNoX2FuZF96ZXJvKCZweHAtPmh3X3N0
YXRlX2ludmFsaWRhdGVkKSkgew0KPiA+ICsJCWRybV9kYmcoJnB4cC0+Y3RybF9ndC0+aTkxNS0+
ZHJtLCAiUFhQOiBjcmVhdGluZyBhcmJfc2Vzc2lvbiBhZnRlciBpbnZhbGlkYXRpb24iKTsNCj4g
PiAgIAkJcHhwX2NyZWF0ZV9hcmJfc2Vzc2lvbihweHApOw0KPiA+ICsJfQ0KPiA+ICAgDQo+ID4g
ICAJY29tcGxldGVfYWxsKCZweHAtPnRlcm1pbmF0aW9uKTsNCj4gPiAgIH0NCj4gPiBAQCAtMTU3
LDYgKzE1OSw4IEBAIHN0YXRpYyB2b2lkIHB4cF9zZXNzaW9uX3dvcmsoc3RydWN0IHdvcmtfc3Ry
dWN0ICp3b3JrKQ0KPiA+ICAgCWlmICghZXZlbnRzKQ0KPiA+ICAgCQlyZXR1cm47DQo+ID4gICAN
Cj4gPiArCWRybV9kYmcoJmd0LT5pOTE1LT5kcm0sICJQWFA6IHByb2Nlc3NpbmcgZXZlbnQtZmxh
Z3MgMHglMDh4IiwgZXZlbnRzKTsNCj4gPiArDQo+ID4gICAJaWYgKGV2ZW50cyAmIFBYUF9JTlZB
TF9SRVFVSVJFRCkNCj4gPiAgIAkJaW50ZWxfcHhwX2ludmFsaWRhdGUocHhwKTsNCj4gPiAgIA0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX3R5cGVz
LmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX3R5cGVzLmgNCj4gPiBpbmRl
eCA3ZTExZmE4MDM0YjIuLjA3ODY0YjU4NGNmNCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9weHAvaW50ZWxfcHhwX3R5cGVzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9weHAvaW50ZWxfcHhwX3R5cGVzLmgNCj4gPiBAQCAtMTI0LDYgKzEyNCw3IEBAIHN0
cnVjdCBpbnRlbF9weHAgew0KPiA+ICAgI2RlZmluZSBQWFBfVEVSTUlOQVRJT05fUkVRVUVTVCAg
QklUKDApDQo+ID4gICAjZGVmaW5lIFBYUF9URVJNSU5BVElPTl9DT01QTEVURSBCSVQoMSkNCj4g
PiAgICNkZWZpbmUgUFhQX0lOVkFMX1JFUVVJUkVEICAgICAgIEJJVCgyKQ0KPiA+ICsjZGVmaW5l
IFBYUF9FVkVOVF9UWVBFX0lSUSAgICAgICBCSVQoMykNCj4gPiAgIH07DQo+ID4gICANCj4gPiAg
ICNlbmRpZiAvKiBfX0lOVEVMX1BYUF9UWVBFU19IX18gKi8NCj4gPiANCj4gPiBiYXNlLWNvbW1p
dDogNTQyOWQ1NWRlNzIzNTQ0ZGZjMDYzMGNmMzlkOTYzOTIwNTJiMjdhMQ0KDQo=
