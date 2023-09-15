Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5D7A254A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 20:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93EF10E664;
	Fri, 15 Sep 2023 18:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8166210E660;
 Fri, 15 Sep 2023 18:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694801088; x=1726337088;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=c4IRLEUusnhBuyLBuiTs9x8BRCgjIyMSbm1B+5lyL88=;
 b=R5u0Rj08fkx9Jpj7r3Es+KOND9yjamcvCFMEsV1a2jBEu2kMi421C0UX
 AdSJmDq5a7/JxZGQyWsbyB5t/4NNcEY3xMWZP7LHoM2xZhzTKTy/BEJiw
 nreLXMeZvn+lQl3JQ2ko0Tbn5xUBu9kuVHvj/7c5Cyg5leDMPy7YP5UsW
 2QxkWXqs8ENyLLe0ajRR3W1bF/2qS9goAiHJhX4rCvAi86sw97zKUmMVA
 RxIsnoy0ZrwPQJJfQo4VA7DS9MxEcn7YsDM6dYqH9Yb+nhTLwTbC92epM
 mCDV8V+/MrgQImxsJmLaHQHjLvMS/1nSeZbZx9BHADyigwJdnnwnJSy+h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="376644336"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="376644336"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:04:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="774396878"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="774396878"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 11:04:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 11:04:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 11:04:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 11:04:46 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 11:04:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P/ZWmLmpLCqWkh7BGXEhFviZP3hU2URUPTYYDk4X8iKYW1Yk5XdBvr+Tn3WqiDis7npnwU55XLrfAYPH++eE86kllZPCxKyh1lmTnLs7iraX4M4iBQdY8O1Ng3v+HdyZySeBzxgeC4XzqAfKplRql5CTYRPxu+UruQGWGQqfMkOG9e8k2xWmXq6KspJBVFZgS3zmP1FgXi3h0YkX7hay6yIcXtsf2il8w/dzjHH8rkAmLjOi4lXMj8HVEptuCJHpSq7TgEzHzYuZBIjGKNXRT4/puCNQFVgw3jlH6vjVQtIu6fBHYuW/qUFPtB2k8zS2dWHEnpV83mdkCHT4zFxwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4IRLEUusnhBuyLBuiTs9x8BRCgjIyMSbm1B+5lyL88=;
 b=YGv44XLsp58boRHdxNacZ/0cJsj+OLKlDw1ctb9Sv0U7VbwbLqaH/k2mcnuiJsaIvkrd/GdL5lfW6Cc9HwxJYdm1dVUCclSsAe1rnpdlR4qkbcuCnFoz2N69v7SyFhfXt16xNJ4LXTKt3rpG1SKWRV8xa6wHGg7dMWEN0g6fwaJqLSXGgJIGCYKEZNZ9QlixRgGPiuK268gDeNVT8sP+OueW31fDPdtf/j+NrYpdmJ9b3Fpo8Zk3Iscp0YwCYW72U8dSdzVEaAooTh7VfOMyllB6t0W8iqrvLRehKJmpicsmfB9F5e85CMCvxCiI1hszYUWVeB9Aqn7TJwBzEsNQYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CH0PR11MB5393.namprd11.prod.outlook.com (2603:10b6:610:b8::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.21; Fri, 15 Sep 2023 18:04:44 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::542d:f32a:14b:1531%3]) with mapi id 15.20.6792.021; Fri, 15 Sep 2023
 18:04:44 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v5 3/3] drm/i915/lrc: User PXP contexts requires runalone
 bit in lrc
Thread-Topic: [PATCH v5 3/3] drm/i915/lrc: User PXP contexts requires runalone
 bit in lrc
Thread-Index: AQHZ425qm4+EIbbbdkWOEqZ7YeXdUbAcN1YA
Date: Fri, 15 Sep 2023 18:04:44 +0000
Message-ID: <0c57ebe16cb77949cf4ec3d1b5640e5b478fe322.camel@intel.com>
References: <20230909223848.427849-1-alan.previn.teres.alexis@intel.com>
 <20230909223848.427849-4-alan.previn.teres.alexis@intel.com>
In-Reply-To: <20230909223848.427849-4-alan.previn.teres.alexis@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CH0PR11MB5393:EE_
x-ms-office365-filtering-correlation-id: 669126f0-d3d9-441e-0123-08dbb6163d80
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KDoZAuomFpZy+gcboFvoS18P8B+v7SrMZgSNJcc1LiCKiBeJsAAaSFO+axpItoh8oAuGwIhEuV5j9NhOVpxrU5Nbze6EQeoGMk+Hd96OoH47eRgyBJT7FQaliBaNnSMsl6syA7iwWsD6NcmCauXZuX1UBCmb+Tp7WI+OJTfLZza1dTwGe70PHW0jnoaws+klIuVa/TfDTdQ8J8rHJh3MnZP1A054bsWrn3CuEXG6+zoOkkISNkpb7AtGeiIE2voN2GMxOWflKEPPX5hN6EDFmyl3FpRfM9SKJ0I+SE3tsOIhZOmSTuhKOKFqh4U7N2SLleV+GhdDuG2Hk729F7VsBk9Mo6iYVXtb2AqZ65CXSA1kfQseNK06VoOBtXorm4nHuZdEIjdV1+GfMyK6lTBijNOw4HDW6Pmks1jP3B05BxcGrZ/rLAWDfinN1ZwFsYwj+dbVBp5achBSg6mEkd78JvTC24YMzfD25J30OqUBujZe6slM3MtHz/E9ODTPUM1HGqMagXD0gUMbqe2+8/NliUB2LqMI9XmPHxZTeGH9ZtyRp+dPmT5xBuXTNkGaj11iWZSYu4CCPzFRug03A+CFFOB/fhxy4sILpIfN9XablX0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(346002)(376002)(39860400002)(186009)(1800799009)(451199024)(2906002)(6512007)(86362001)(966005)(107886003)(2616005)(26005)(478600001)(36756003)(71200400001)(6486002)(6506007)(82960400001)(38070700005)(38100700002)(122000001)(450100002)(8676002)(4326008)(8936002)(41300700001)(66476007)(66556008)(54906003)(64756008)(66946007)(66446008)(91956017)(76116006)(5660300002)(316002)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlRtOUtic2RZcWk3YjBwdy9lUmtZVnZ5VjJLUVBFaVh3TCtwL0tlYWdBUEtY?=
 =?utf-8?B?cTNabkhLaWpKK2U5bVBMVG90dERJYXR6dE9FSEtZS3ZoVWtpTURZcC9RUEtN?=
 =?utf-8?B?ZmFUMHFvOXJMSEw1akVlb1B3djhaOFRRL2xtbkFVUWdTRFRlcFZIUTJWdzNP?=
 =?utf-8?B?M1grTmowRnZSRVNCTkswek1UM0VvSFNXWDJJRHh0ZlZKSERBYUYyRXRGMEJB?=
 =?utf-8?B?bzhzeVNrTTRncnBETmhxeWM2WThPaTJ6UEpYbi8zdFNQQkt3SkxHY1VIQzlV?=
 =?utf-8?B?RkxoTFhsMDdtdTNCS1FJblMvc2RnNE9nSVk2TnFnTUxLaUwrSGtxZktXSEJO?=
 =?utf-8?B?ZDV0bEZsNmJRaEUxVGhEcFFHSkxrQk5OSGtkY3ZOcWlSSzZOYVdtekxMSTJI?=
 =?utf-8?B?SnFOYnNTaU5lRDRNYUllbHR6YXY1b2o0STVQWXBhQWFuU2R5RzVOVEgvWk9M?=
 =?utf-8?B?a2UvRmpsWngwbWM0b3Q0dm9zNU04ZTREUVVnc3B4OVd5TWMxUkg0L044VkdE?=
 =?utf-8?B?THBGQmVKYVJoU2RJdDRTUEhaay9HOXBHamhkKy9DQ2dtbkRxbElJMDBUVTBC?=
 =?utf-8?B?ektWcDRuZjJHRGl6MHhtR1ZmZytBQU03clM0V05TSEU0YzBGU0Q4RE5DTENW?=
 =?utf-8?B?eDdsZnA3WTBxaDFuS3hDRnFkWkc3V3RNWndkL1Rpa01Rdi9wcEVQZVRrSXVu?=
 =?utf-8?B?Mm9vcWVvdmhDbVVWZnFCUXJoYTZRVkVpZjF4NmE1K3U2Y055V1lHMHZveFpZ?=
 =?utf-8?B?MnFBMHlHbExJNWcxb3Frc250YW4wazQ1WG9YNG1VbzNTaitnbStBaDFmbHNN?=
 =?utf-8?B?MHozWE5odVFKeFZ6S2NocGswc09EMVNaOHRIRjA3RGxNMUNBT01FbmlzTHgx?=
 =?utf-8?B?ZUNrUGJGN3RHQ2tRRHBqck04c0pCVWMxTSs0WUVML2hDblhobmRkOHQ3MG5J?=
 =?utf-8?B?RndaMGVKcmxOdHFuS0ZsYVZhZndFZXN1U3RuU3pPM3k0N1kwVzh5SWNCK1pJ?=
 =?utf-8?B?VkdERUZ6a3lKQm5QanI4RHNoOVVFcGRlbFpGOFIwTjg1Z0FlcGR6NW9qdExF?=
 =?utf-8?B?cWJKVmUxUEh6a3pQMkZFd0ZCZ2hzVUxNYWJ5aTlpS09HT1JCVWdUYW5iZGJj?=
 =?utf-8?B?a3lZc0JIUlgyOUJ5b2RWVkRjeWNiUDd2bG9pMHVGOG02MnA5aEhYVFlGSGRp?=
 =?utf-8?B?K0huL3Rka0lCZ2RYSGlheUxwWVRUTVVRUitNNVRqNTNRYWsrU0JhazcvRmpn?=
 =?utf-8?B?KytiSjQ2ZXhnRXZkalhHUzM1Y2U4LzBSVmdJdFdIMjlrNFFzNDVZTzRaM0Vp?=
 =?utf-8?B?RTZOanUxOFlvKzROblgyZXNEV3BnWkM0MllXRVdDUitaRTNTQnpFcVZraXQ5?=
 =?utf-8?B?QzBnWWIwSWNQK0daRXJZV1MwZ3ZGSjRkU2NjR2dFak53cHVZeHE1WFhwK3lG?=
 =?utf-8?B?UE85VlEzY1JsSWEyY1BCbTVNU3VXczZuNVB5bzhFbmZkaURJcEVZcUVGaENr?=
 =?utf-8?B?NEsrcUtDRTRzSG5BUGpBN0hmblhOd0ZJTFFMWHlEUTdtUFRLU3V6d3NvOVFu?=
 =?utf-8?B?cGFuMVYvalp4S3NBZDc2V2oyYklvZnNPSFJvd2dFUWFDMEJFekpBT2JVbnMr?=
 =?utf-8?B?Q3BWVWh1a3RPRDhwdkFBdGlPTkJCanpWcDhDM3NoTjhhaXNUNWhqcEl5YWR4?=
 =?utf-8?B?b1piZEJVNDZnOHd6amdNSTBFZks5WkJoVzRFeGdvMTE4cEpZUjhQdXpoVGhI?=
 =?utf-8?B?WXZ3eDBqSmRnM2lGMTVhWDUxeE9Tb1QvVnl6WkJCbFBUaWlFYVR6bVNjRURX?=
 =?utf-8?B?UGNBRUFKT2syN3psZFVycHl1b2JBSTd3cnUxMk9LZkliSnM2ZVVOMXNXWENv?=
 =?utf-8?B?dG9LaHdLbHA3WlhKR1NrejFSS3g1ZjVFRXIraDhsekVnZU1taFhwQ0JqdENN?=
 =?utf-8?B?TDdYTnI4N3NWTzM4Z2lobVNkTkZ2aUpVUjRFU1JSbitYVTl3bUpCdXR6QnZR?=
 =?utf-8?B?dkZVZlJsU2RmcXgzTVpuZEY1ZmRFYzBHZWo1SVBNK3B1V3d1elBlelVGTGtT?=
 =?utf-8?B?ZTRFTkR3TExXWTQzdUEraE04VTRZOGVCdXYwUGMxZGk1ZFFldkUyY0tmNEpR?=
 =?utf-8?B?WEw1Rjdxc0hFQkx4ZWpqMWNuZ3EzY213ZTlNWFo3NkJ0V0lHQ3J3MjJOemtK?=
 =?utf-8?Q?GZwtg8YdcyfwtvOx5ejICQI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <852062BEAB4FE04DBDD017738B62AB7C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669126f0-d3d9-441e-0123-08dbb6163d80
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2023 18:04:44.0294 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Mtn8ew1gqXqeNMJtiJuxp9guOOihrH6W+GSNK+F6Zf2mXtWhQxPUwKxWAwBmgl30fSMn9BsArz+77Vn4Zj3xYcejh6GDHspYtUMKu5HHRM3lm7/0IFFKyd+luncQ7/p
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5393
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIzLTA5LTA5IGF0IDE1OjM4IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiBPbiBNZXRlb3JsYWtlIG9ud2FyZHMsIEhXIHNwZWNzIHJlcXVpcmUgdGhh
dCBhbGwgdXNlciBjb250ZXh0cyB0aGF0DQo+IHJ1biBvbiByZW5kZXIgb3IgY29tcHV0ZSBlbmdp
bmVzIGFuZCByZXF1aXJlIFBYUCBtdXN0IGVuZm9yY2UNCj4gcnVuLWFsb25lIGJpdCBpbiBscmMu
IEFkZCB0aGlzIGVuZm9yY2VtZW50IGZvciBwcm90ZWN0ZWQgY29udGV4dHMuDQphbGFuOnNuaXAN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJlcy5hbGV4
aXNAaW50ZWwuY29tPg0KPiBAQCAtODYwLDYgKzg4MSw4IEBAIHN0YXRpYyB2b2lkIGluaXRfY29t
bW9uX3JlZ3ModTMyICogY29uc3QgcmVncywNCj4gIAlpZiAoR1JBUEhJQ1NfVkVSKGVuZ2luZS0+
aTkxNSkgPCAxMSkNCj4gIAkJY3RsIHw9IF9NQVNLRURfQklUX0RJU0FCTEUoQ1RYX0NUUkxfRU5H
SU5FX0NUWF9TQVZFX0lOSElCSVQgfA0KPiAgCQkJCQkgICBDVFhfQ1RSTF9SU19DVFhfRU5BQkxF
KTsNCj4gKwlpZiAoY3R4X25lZWRzX3J1bmFsb25lKGNlKSkNCj4gKwkJY3RsIHw9IF9NQVNLRURf
QklUX0VOQUJMRShCSVQoNykpOw0KPiAgCXJlZ3NbQ1RYX0NPTlRFWFRfQ09OVFJPTF0gPSBjdGw7
DQo+ICANCj4gIAlyZWdzW0NUWF9USU1FU1RBTVBdID0gY2UtPnN0YXRzLnJ1bnRpbWUubGFzdDsN
CmFsYW46IHRvIGFsaWduIGludGVsLWdmeCBtbCwgVml2YWlrIHJldmlld2VkIHRoaXMgb24gZHJp
LWRldmVsIGF0IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZl
bC8yMDIzLVNlcHRlbWJlci80MjI4NzUuaHRtbCAtIHNuaXBwZXQ6DQp0aHVzLCB3aWxsIHJlcmV2
IHRoaXMgKHdpdGggdGhlIG90aGVycyBmaXhlcyBpbiB0aGlzIHNlcmllcykuDQoNCj4+IENhbiB3
ZSBwbGVhc2UgZ2V0IHRoZSBiaXQgZGVmaW5lZCBpbiBpbnRlbF9lbmdpbmVfcmVncy5oIHdpdGgg
YSBkZWZpbmUgDQo+PiBpbnN0ZWFkIG9mIGEgbnVtYmVyIGlkZW50aWZpY2F0aW9uPw0KPj4gDQo+
PiBSZXZpZXcgY29tcGxldGVkIGNvbmRpdGlvbmFsIHRvIHRoZSBhYm92ZSBmaXguDQo+PiANCj4+
IFJldmlld2VkLWJ5OiBCYWxhc3VicmF3bWFuaWFuLCBWaXZhaWsgDQo+PiA8dml2YWlrLmJhbGFz
dWJyYXdtYW5pYW4gYXQgaW50ZWwuY29tPiANCj4+IDxtYWlsdG86dml2YWlrLmJhbGFzdWJyYXdt
YW5pYW4gYXQgaW50ZWwuY29tPg0KDQoNCg==
