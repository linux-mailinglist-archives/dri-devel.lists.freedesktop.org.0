Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975E585A49F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 14:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC08D10E3D5;
	Mon, 19 Feb 2024 13:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="If0Xl0Ho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBC610E22A;
 Mon, 19 Feb 2024 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708349312; x=1739885312;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=o7kDGUW+8cItgXZma76a31zHUhfFuqy/LAA7jOsA7R8=;
 b=If0Xl0HoYhl3U5Q1zDtbxbgUbXKml4kMqwfbpJJ+gcQlP6iayaZwUwkW
 yWBsmaijdqmSYgtva2EOFjhoBNtCPKELjXbm9NqGhks6+I2Z0OaYsDgit
 uocxRAt6EUceRbKKh8PRk/gFjp0qGmccLbAjiRDvpH+vb3X3ETFUtzGWB
 hIQVAYCwc1rDODxbmeSaNYF80jPGeLZY+zcarDgfS+epgz3BZjy7li+Hv
 ZyZe27qdQNqx4EMRlrkb6KgA/d2osq9OjBf6Yk8spEWCYUHSPjMosO7WB
 tW0ecraD3TLtYaTW6/Y0Cn3ZTNKu85xKKubhcKbs+nn1bt87m0FuBiMHQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="13537062"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; d="scan'208";a="13537062"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 05:28:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="4854009"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 05:28:32 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 05:28:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 05:28:31 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 05:28:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8ZAWAfm/r0Fw7i/EocX3iw+Joe89F0RSLZY8gMPvBbEjqQNS/mzxBqU/P02l3dg1PaPcCYxuHk+7Ysp1mt99DRbKDA86s+OX0tCR5810FqQrXKnn8egG+j5AikHXeVv0C9h2jfxG+WHVgK3QO/Jl+0w46UqHBuWwThwzzy1Hl4nYfd3dTb9pffxCB5K/hTHo+IIc2Q2p7rBUCNtWWetljvwxpjrT8rDIheF+xpTJRviVv7sLz5tuaVVnb9ecetaf6J6kXtwv+lt35WtoIhY7cDf+/dUbJ3cFi5rHndzYBWpZ98joGN19BTtuxy6HtgrCjgm0pxz01baH3lez4Nq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o7kDGUW+8cItgXZma76a31zHUhfFuqy/LAA7jOsA7R8=;
 b=dFx2NMXgmVb554dBmmOexpcs+IrQ9W0lhtddixliWFPPNq2YaCswiasYgs4aVTD+KpNTGjj2XLg5KkV08W+qVCDwIobHKJkxZPjmBe23Jn5wt3rwJcYPnULa9SEfilD27ExHm9VlKG4H1jvc/xwRe8Fmk8JbOmh0MYgACXV5HZVwjWqeixV5qVsmIAIQLIvpUEXd6J3LI0QCBAjEtET/33f3FhPDrHmS2L3k0XkCWJfcFE3iJ2l3q/u57SkRBrLm9vABuaYp7Qx0ZuLjelGWw8vs3wu172f3PC7+FqvdVGN2DB5AQ9gk0cik5iyMBR/e6YP//eEBZAKLRszEYAwXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by SN7PR11MB6653.namprd11.prod.outlook.com (2603:10b6:806:26f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Mon, 19 Feb
 2024 13:28:29 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::9333:bdda:e42a:a662]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::9333:bdda:e42a:a662%5]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 13:28:28 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>
CC: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "Ursulin, Tvrtko"
 <tvrtko.ursulin@intel.com>
Subject: Re: [PATCH] drm/i915: Add some boring kerneldoc
Thread-Topic: [PATCH] drm/i915: Add some boring kerneldoc
Thread-Index: AQHaYzch4NpFbAqTwkmzKBFzhoPQQrERqJoA
Date: Mon, 19 Feb 2024 13:28:28 +0000
Message-ID: <259e811076e14e3270ccb87f1081900e706a2f2e.camel@intel.com>
References: <20240219132517.1868604-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20240219132517.1868604-1-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|SN7PR11MB6653:EE_
x-ms-office365-filtering-correlation-id: 755fec14-9a0b-422d-6d13-08dc314ea8cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SahAOAvRNgh8PPD5zXbdXwRtkF4tIupGBWIccgBBXqkmI20kQUMOkJySO8Ii/PkDcFY1nMo4Jo7ercpiaxe84fmqJQzUCCurmQ2tusP56UOSCepyRBQRgOJj7exqwILzZ3ml5otx15qqTIFsSzpzTEf+sOWCnDRcVyO9lVHzJ/zy7P6oX78OON3S0qSeA2+Y8d1YuShsQayKgHLPE+D+Z/pmMcaHThZlv+4hp9sCeDxAX8XBnpW+tVNssMAFytqaSCJyQlQQ8FlwShaEmhPeCgY+Vp3CO1PdpyjUwYu/ryAyuTg5SwDEcik1FItOGKb6c8JFtRa0GbgR+H1kcoviaYAZOBdw0HDZsLKI2xhAnewBzw6r6YE7qqOJQPNWP7696E41quxY1kRpCJuKjuLmv92sQlDx4ZYuHSJ99A3xU5XJvddsGec4ZUUfF0igMXztBXiW7B+YkInMyTBZYqcF6qW94gojGTIyMRbdAC3GaItV3hpiqd3yR+6jMvR3OwYDeuynKP9FLaotk2zdEISMZVrsNOz10EVuROaRGeW4i9mCQztt007FVETftBOHiY1IgHrx+tgBQE7Pzy8QG7WnOWg6wDxM5ExNa49MHD35zMUbdO8/1qHVaLUT0xx9mpC0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clVLYi9JSWs5MjVzREpNQVJBOWszSzMrSjcxQlAxTExYQzM4RFlKRnJxdXJy?=
 =?utf-8?B?azJ2ODMwQ0xqL0pMWXpHUTdNeVhNbU1EWWdCR1FBd2RGdFZWelo3RmtZZXVk?=
 =?utf-8?B?TERJV2pqdWZJQlJEbG4zWmEvRW9HcjVHN0t2RHQ4VVhjZkRGQlRYNGxnYjNS?=
 =?utf-8?B?R0NlZE1TSGE5YTB5ZVUwMDRCcFhFZjlIaUNsRzRvQjVNVG9sYndTZ2NJV0tB?=
 =?utf-8?B?U0Q5dThzOUlvM0JEUnYrU3lPWG82dERrQ2dnL2d2KzErUTVQUHRWTGc3LzU2?=
 =?utf-8?B?TGx6eC9rNURMcFBxb1pDa1BPUy9WWU9meElxM3IycVRvK0JWZ1AzRFNka3d6?=
 =?utf-8?B?TlpOS1BhcmdBS0h0U0JnU3pJR0o2UjVWV0UwSGxvc01DSDJJT04wM1piVzRI?=
 =?utf-8?B?WGl3K2N3Rks3YVJ6cWx0Y1dVMDlUZzk2bGNJNmpZdWxtVHJXL09qVDBjdnlR?=
 =?utf-8?B?ZHU5V3NramJtbmdIYktTc01JZ0NrQytTd3Baay9UaVY4VGt1M05yVDI4Smo3?=
 =?utf-8?B?WU9sSmpTNTYxS3VKbHJNRTBtcXdVNUNRSUVTbEV3MkUrMzNFT1NpalRIQWxv?=
 =?utf-8?B?Vy9HamttVmRoNEhLZnV4YWk5bzZUb1NtcVBXMU9ab2p3aVhzS2cxZGRiOVQ1?=
 =?utf-8?B?b0UzczZYMURaNVpOZ20rd3dsYXBxMTZpOTJwVGMxVUJ6YzJwbEMxTjNLRHUz?=
 =?utf-8?B?RnVEazRuNTZWMzVHNVdNMzZtTmlCNWxGak5WY0JJZnUyU25rNkczZkE1Nklj?=
 =?utf-8?B?cEpSZGJNcmlOZ3FBam1CYXB3U240Y2RFRjkrajJtSjJNV21sNGIvSlZHYkhJ?=
 =?utf-8?B?OTlBcGVxV3lyZEFWR0ZudGZxUTQweDRTanhwdXo4S1o5SXNiTG1kKzQ0M2lK?=
 =?utf-8?B?NGFYeVN4eDQ0bU9CYjlzcnE0RDFrZUtVR2FTR1pmbEpJU3pHVmxiaVhZNjJr?=
 =?utf-8?B?S1NIQ2czcXlJelkvMlVhTWtGNisvQktMY1l1Nks1R0hFaEZZK0x6NGtXSzJz?=
 =?utf-8?B?SnFLMFpZTXhScTJsQkRJc1YzS3hGYk5oL0NOVEhMRXVVc2hMODFieHpmWHNB?=
 =?utf-8?B?NjkybGNVTzY1cS9IV3hRUHpaWFJmVTdMLzh6NWgrSHhOQjQwZnEwUlQzY0hw?=
 =?utf-8?B?Njc2NTVVRTVVNWMxWjF0N3FVUXl1UlRFK1ZsNk1OWDVCUG82ZnpsVWJDYWg3?=
 =?utf-8?B?di9ZYndxNk1sTlhyS0JzUDh6a1lSbnNURXJnbElpOXc2N1ZUcjFYbHF4UWs4?=
 =?utf-8?B?ZFRvQnJwbG5FQ1lRLzRvRTFBM3ZKWCtidjdLd2czLzFKQVdYVjEwV2p0bnZx?=
 =?utf-8?B?WmJqTXpyYTNHbmxpTTVWUlRwNlREMEF5RUZoZkIySWpJZGVzdUp0aDI5T2RL?=
 =?utf-8?B?WUhYUFpQUDhyek9DT1YxekR6aW5CeitJZWI3dmJhTG90bUFGMDhzcWJET0kz?=
 =?utf-8?B?VDF1WlVzSVJ5MUdxOGkrT0tOS21JNDZOamRxWFFwRGVhZFpndzBTZmYwcjZz?=
 =?utf-8?B?dkpUbEZDMlIxRUNYdjNmRzJ1R3FMQVZNS1MycXpZclVxUEpadGN2VlpGYjgv?=
 =?utf-8?B?UVZCcE9zODFzRjBBb3FOMFU2dmRKWU5oU0NRMXdCdjhZblJXd3hpQUxKWkFC?=
 =?utf-8?B?RHNFMHRueTI5VFdlbWNmUmpVMlRHSlZUUWVNSkdlZzRScS9jdW9FUkE0L3du?=
 =?utf-8?B?RFRYOE5EVk1CWTJaVEIraTBhV3hlWWZhdkcrdkNGV05TODJIa3VTY1JUM1Uy?=
 =?utf-8?B?V1lSWGdOWVNmckx2ZmtCSFJJZ3MvTkowK3U0REUraGdvNlRLQWUwQnl4Ymlr?=
 =?utf-8?B?b0Rsa0twNDRPQzBFT1JSa1JqL085L3FPdnVZNSs2OG1WbDBNYVBIZGZKVVZo?=
 =?utf-8?B?V3JDaUZmYWQ2ZFlueWRqNiszRy9aZzdhMklxeU11ZFk4UFRxUXJJbHlDcmtW?=
 =?utf-8?B?SlVxMWZ1V2VFYXRoNEtVVHEzUUMrVUoxOEplUHNWcGlwVzRReXRHeEdBeTM0?=
 =?utf-8?B?OFgxSVhJZjE4T1dmL0tlWU0vTXpiODZSU1oydGFxL3FqdVJHeUZqbGFsdHE3?=
 =?utf-8?B?eHFFaVFPbmlSZ2xMR3RkS1d1Vnd4VC9GWWEveG5XRTdXSUQ1NittRnlxNlBD?=
 =?utf-8?B?WktCVEVvUzlSckVSb2Z1NnNRQ1JQV0k0djZRd3pBdkFsZ0k2aU1SakZXaHhX?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBC7604506FB1B4C92A654D5650F6E9E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 755fec14-9a0b-422d-6d13-08dc314ea8cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 13:28:28.8718 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vrTbK3FffvWz0FoMwdV2qbnt9nsbiipQ7+CVUrmnUwi2K0B+GZZ64eb6id8J8/sd7pMGTTf03QhmLLlGne5/Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6653
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

T24gTW9uLCAyMDI0LTAyLTE5IGF0IDEzOjI1ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToN
Cj4gRnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4NCj4gDQo+
IFRvb2xpbmcgYXBwZWFycyB2ZXJ5IHN0cmljdCBzbyBsZXRzIHBhY2lmeSBpdCBieSBhZGRpbmcg
c29tZSBjb21tZW50cywNCj4gZXZlbiBpZiBmaWVsZHMgYXJlIGNvbXBsZXRlbHkgc2VsZi1leHBs
YW5hdG9yeS4NCj4gDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3Nl
LnNvdXphQGludGVsLmNvbT4NCg0KPiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZy
dGtvLnVyc3VsaW5AaW50ZWwuY29tPg0KPiBGaXhlczogYjExMjM2NDg2NzQ5ICgiZHJtL2k5MTU6
IEFkZCBHdUMgc3VibWlzc2lvbiBpbnRlcmZhY2UgdmVyc2lvbiBxdWVyeSIpDQo+IFJlcG9ydGVk
LWJ5OiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4NCj4gQ2M6IEpvc2Ug
U291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGluY2x1ZGUvdWFwaS9kcm0v
aTkxNV9kcm0uaCB8IDQgKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vaTkxNV9kcm0uaCBiL2luY2x1ZGUv
dWFwaS9kcm0vaTkxNV9kcm0uaA0KPiBpbmRleCBiZDg3Mzg2YTgyNDMuLjJlZTMzODg2MGI3ZSAx
MDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oDQo+ICsrKyBiL2luY2x1
ZGUvdWFwaS9kcm0vaTkxNV9kcm0uaA0KPiBAQCAtMzU3Miw5ICszNTcyLDEzIEBAIHN0cnVjdCBk
cm1faTkxNV9xdWVyeV9tZW1vcnlfcmVnaW9ucyB7DQo+ICAgKiBzdHJ1Y3QgZHJtX2k5MTVfcXVl
cnlfZ3VjX3N1Ym1pc3Npb25fdmVyc2lvbiAtIHF1ZXJ5IEd1QyBzdWJtaXNzaW9uIGludGVyZmFj
ZSB2ZXJzaW9uDQo+ICAgKi8NCj4gIHN0cnVjdCBkcm1faTkxNV9xdWVyeV9ndWNfc3VibWlzc2lv
bl92ZXJzaW9uIHsNCj4gKwkvKiogQGJyYW5jaDogRmlybXdhcmUgYnJhbmNoIHZlcnNpb24uICov
DQo+ICAJX191MzIgYnJhbmNoOw0KPiArCS8qKiBAbWFqb3I6IEZpcm13YXJlIG1ham9yIHZlcnNp
b24uICovDQo+ICAJX191MzIgbWFqb3I7DQo+ICsJLyoqIEBtaW5vcjogRmlybXdhcmUgbWlub3Ig
dmVyc2lvbi4gKi8NCj4gIAlfX3UzMiBtaW5vcjsNCj4gKwkvKiogQHBhdGNoOiBGaXJtd2FyZSBw
YXRjaCB2ZXJzaW9uLiAqLw0KPiAgCV9fdTMyIHBhdGNoOw0KPiAgfTsNCj4gIA0KDQo=
