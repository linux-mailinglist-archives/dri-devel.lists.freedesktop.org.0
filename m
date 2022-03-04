Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE0D4CD2B6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 11:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76F310E531;
	Fri,  4 Mar 2022 10:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3054510E477;
 Fri,  4 Mar 2022 10:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646390864; x=1677926864;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KqPHtslHiifGP0NYcMOIRwjRBXkWZ+WfF+7vBC0VYps=;
 b=L/FK/VdhL4trVmnd65WEHvOqteYCtLnVMzzT1ITgNgD4JINHBS8fpdGB
 3xLSz+Ypq0mS6KvTHCNZVqzafJvyb4bvOK/JYE4LXrUATZX+2rls6TyX4
 ef+RTrqgLBHnajUivTq94afglApOTNmJfMCJ4UfAZwqFpaBSJee6kyIwt
 VBcs7TQBfAblUZ7d1Z3/PkT5jjz39L2gSt+IWWIXhlW+vbn/Up0zlil1d
 fMc+ovWBHbhKbd6QYsSPMdg77/zdQbSM0cZ7f/CbETI5rMn7JgVe0Fxzj
 X6+7BdBY+5d1yJ/6yUT4Fkzc6bEtdP/2kVWkYSSAIlbzLCFBezyfG7plU g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="241373570"
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; d="scan'208";a="241373570"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 02:47:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; d="scan'208";a="640545206"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by fmsmga002.fm.intel.com with ESMTP; 04 Mar 2022 02:47:43 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 4 Mar 2022 02:47:42 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21 via Frontend Transport; Fri, 4 Mar 2022 02:47:42 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.21; Fri, 4 Mar 2022 02:47:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dy2rjhSPxD3kHEBfohD5iXNMtW8K9P76s73gJcmVNi7RVO6jyXBina3VXgEmrlmQFvX8dT/e141bzxosR8F2rkm5wkuEYa6rnXqNswyK1ya7Fs4Sv1TR4wfagSwnO6inQIogPz4BwBtfUPc6d3JYxCTrIO1LB26w66e8T8R2BMaJJSrtmGFiNhixqyXywUjsdwus3sPNSCDeAy4z618GEXYrr5cYoGaVY5ZnlRfu5TKi3ikIjnQd/wob/QX+Z8df/ejSipAWUYNrsfjsL32Eeu94nAZx9DzwtwDi9qLpc0yEbtN4oj6qPn5dG6FUriiwcHj7pEHKt9VSgJGzbzl3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KqPHtslHiifGP0NYcMOIRwjRBXkWZ+WfF+7vBC0VYps=;
 b=fA9WUlJlbdi9IXuKIGeMqgI9Ndgs/BYJkkEWNVBxT/Bji4BxqmzA7H0nWP6EVM3GV3fqiUcor4o2HMX5CbEYJOHmlvSuHTEaLlwl6y+8NIJWK5hs5UfCN7EN8cRJQe/pXkG/xBZKLfNbIxaf2UOuc2dnp/5yp0bD0724S5JKlRT+FNQCJmBHN2Av9RFfoK/yWUu3c/yLbzSy7xiuTMviuHXPdzf1+TZP8HG6ccHq1KtR1gil2WILZHGICVDUGXPWf2Jfqs9ZXHtBAZ1F7/MwbD2h12ZMnDUMtMANFRc7wrUbGDijx98NLaHGUDklXFxibowEgIloPeAOjq2n34D/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB1741.namprd11.prod.outlook.com (2603:10b6:300:10d::20)
 by DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 4 Mar
 2022 10:47:38 +0000
Received: from MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::216d:6bf4:d46c:f133]) by MWHPR11MB1741.namprd11.prod.outlook.com
 ([fe80::216d:6bf4:d46c:f133%6]) with mapi id 15.20.5038.016; Fri, 4 Mar 2022
 10:47:37 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting from
 drm_writeback_connector structure changes
Thread-Topic: [PATCH 5/6] drm/rcar_du: changes to rcar-du driver resulting
 from drm_writeback_connector structure changes
Thread-Index: AQHYGBFjkzht//tf006vXTl+IOhLcKyANJuAgAAJCYCAAAMWAIAAJNoAgCXncoCAAnYugIAARKuAgAAFXYCAABSgAIADdIKAgAABCACAAYHWAIABC+0ggAATFQCAAACv0A==
Date: Fri, 4 Mar 2022 10:47:37 +0000
Message-ID: <MWHPR11MB1741708DEFD56E02C1BBC7A3E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
References: <Yfp8Q6OFqTAvESOi@pendragon.ideasonboard.com>
 <87y22ts948.fsf@intel.com> <YfqGbqQQz5vrDaLI@pendragon.ideasonboard.com>
 <87v8xxs2hz.fsf@intel.com>
 <CAF6AEGtdnWWhGp7U7nAPD4r3Uoe5BJKVm2rQ2MS=q5GqF6MYDA@mail.gmail.com>
 <YhyB0WmJDWVFO1se@pendragon.ideasonboard.com> <871qzn6vmc.fsf@intel.com>
 <Yhy/6+z7QshG+qOo@pendragon.ideasonboard.com>
 <YhzROBOwTUkZw3Ez@pendragon.ideasonboard.com>
 <4d8daabe-10d9-a3cf-d305-68414cffe4ed@quicinc.com>
 <Yh+4EOKA5FgrlZrF@pendragon.ideasonboard.com>
 <0cfd36a2-26e4-309d-d8e9-e3bf8a5d2417@quicinc.com>
 <MWHPR11MB174187335183FC24BE0F1EA5E3059@MWHPR11MB1741.namprd11.prod.outlook.com>
 <CAA8EJppTVN1EnytD5mCmr4ZTi4M8u9ENOmJuweNyDRkB3LEHnw@mail.gmail.com>
In-Reply-To: <CAA8EJppTVN1EnytD5mCmr4ZTi4M8u9ENOmJuweNyDRkB3LEHnw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.401.20
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfbf6269-6b91-4fb6-a82d-08d9fdcc6637
x-ms-traffictypediagnostic: DM4PR11MB5549:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM4PR11MB554970FBE2380C1682966A93E3059@DM4PR11MB5549.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NG5Nl6N9y0Eej2mqLTEXO0Is1rrfttHRY06spQbyx0bfyZkGmatTJpRyMZR0qXI+eN0YS1XL6sMtW5+0w9bTdSZCob2hFF28gNaekgO1ZSvSl3KA0MqifqP0qk0rt3vxV/HJdip9ELAWaqPyNckXNfFCmpmoyjoqlIKiI1LhJqX63HTTJAJDlXMjGUBxZJq7P2jLbdnhuuw8KSEXvhcleoyAiJD1JNDyExStIJRpPGA+B5ppR6PDy5lT79IXZu21VAEgSS+wtj9X95hNI3sy4Uj2ZSyKlzZvZIJWhLKTNn2GrcgY9yFV4VdN/+CNLFu+xWZYqKSHAneOCOZ+RvbzOudKlMYkJUaXJPg+swTlruvLMV8Q/r3Wy4UOi8SD4AVdigsivkT9LignSyhSn6fwTznpo/WOGa0WyTcPSvHw4qylQB6H/B6DONYxslvdsWE1q2WOWb7nwxyhvTE7lEnnbieN601jX+FXJLXjHFTm64+JpgWiGc9VZ6QDyXx6lg8DItJb+Y9TAb8vsBQ3/3fvBRd1kQfwjxQVLTPGigOVuiuG6wN0bdKdtiDO4zpXGZ9fcGuSYzAf72YVuFYQ8o9YallJruhuz1sN20HeEoj9RHVSg4ZfcKNNcnKSlWKmxo6YM7hRry40wS9z/yt40Je33VE5QGSsfm5SB4WZYhl1E9GcYs6MHR3VJRJLGE+k2gWTCtIj3lO0K32DGoO7YM+N9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1741.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(4326008)(7696005)(66446008)(76116006)(66476007)(6506007)(52536014)(5660300002)(71200400001)(508600001)(33656002)(66556008)(64756008)(66946007)(55016003)(122000001)(38100700002)(316002)(38070700005)(8936002)(54906003)(186003)(26005)(9686003)(82960400001)(2906002)(6916009)(86362001)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkZDWEFkVlBKT0pIRFN6ZjYxQkhsREE3aFRtcVl3dDNiNG1GNTNFWGZrZkVY?=
 =?utf-8?B?QjJONUVickRMUmp1Z1JsbDZoSXJZZVlZZHgreE41SmM5cTJyTmhWRS9GcHVm?=
 =?utf-8?B?dWhPZnRaWEM0bmEwVVNxNGV1NEhndklYVmRyYmFRUkFQd3VOQ24vRXQzUTBl?=
 =?utf-8?B?ek00aXh5ZkhNU2dxeGljc3BCVzBZcU1xdTlUaWUxNHdqbVFqUHZOYTNXVGxm?=
 =?utf-8?B?ZjJGMTh1YThJUlY2K2djR1lyMjFvMU5vM1NiaWZYRnBuTndmMDFUMm9IYmVL?=
 =?utf-8?B?NmdyMDdUY1NBMUFVRkROTmJGbGxRY2MwRDRaZTA1RU1PVUdFd1ZmaHQ5aUJG?=
 =?utf-8?B?UDgzVkp4ZXRsL1dySzFnSk9nVFJubXM0VFdxMVV3VTd5ZkJmQ2MwdnBaczVh?=
 =?utf-8?B?K00wNGZPcnlKZlhhYnpDQ0VlN1VMdXlwOGdDeCtLaHg1aVdseVFWRXk3UVl4?=
 =?utf-8?B?YVdVY3NQL1dqcmpPWTNhMTM5RUQ5UUYrbmJyckRJOXRoMFd3NnNlcURzQ1Jh?=
 =?utf-8?B?Ynlodkthakx1MFBacXV0MlhieGRuL3ZVdjc5dnBXWTdCdjhWVjdqYklZbTFO?=
 =?utf-8?B?M2djREF0M3pQc3Z0djQ1YU9nZU0xU3U2ZEJRVEh5NDhlaXFieHNhNVgrVDZU?=
 =?utf-8?B?VWM1aUZVOWF4Rm5YV01WRGVmV3A5T2VpVzdZaHRUYkJIa3gvQUVTcU9JY0tB?=
 =?utf-8?B?YlFtZ3FBMmZTcmNvL2R4RW1xS21yU1pBc1B3N0NXeUUvZHlLREtOVnFPeklL?=
 =?utf-8?B?VE5Cc0pPd3BueHB6cTBPVTdrdmJtdmtnQnhNSVVOblVGVnFtUzV2YXREcUdr?=
 =?utf-8?B?NG5qMWRlZlYwTXdnOVFSKy9EVmV5bWhqaEp4K3Vod0xXV1FtaGNwV3UrQjhO?=
 =?utf-8?B?ZmF0Ui9hQXh5UFNUSGZTZ3BZZFBEK1NqbnZ3RUJiQ1AvL3pNOERMS1VrNGFG?=
 =?utf-8?B?QmlGQ0dtQ0xRaW50Q1ZNM0ExVnFNTkJIS3B5VEt2dktuV3o2cC9IcElKMjlB?=
 =?utf-8?B?RnJlZlZ3cVhYWnd0OW0zWHlwczBYWWV3VTBBNXkrYVJGSjhzSTMrRkhwM0RW?=
 =?utf-8?B?YStIT1h6dzhtbjRlNExOanlQUUdOWXFJSW5iZDRxSXFwck5DRkFVbzlBNmZU?=
 =?utf-8?B?eW45aFV3TTBhNDgyV2UzbTBjU1VYd2x5RUtTVlpzV2VvTmNjalQ5RHpnRmww?=
 =?utf-8?B?NDhGODNkRlNtWDViUnJWKzA3YXU2NUdmaVZMa3QzOTl0ays2U0UxNHErbzgy?=
 =?utf-8?B?MDBJRERraWRyZjQvVFhoRHRwKzNWRDhVK3Q4YUxab05SRTI5U0o1c04xcGpj?=
 =?utf-8?B?ZzdWUzdhWVYra3Z0ajhYYitNWEtVVVgvanROT2FOZVpyNUZlSUZIYlJQS3Yz?=
 =?utf-8?B?eDB5NklvNVVFV1cyenM5OEN2M0Mzc1hLcGVZVzh3a0QvYmdyZkxuKzU1aVYy?=
 =?utf-8?B?RC9JaDI2d1NDbEl2M2w4d1J6aHYzZ2I4VjRXdWsyOW8zTkc1UEt6WVVEdmMy?=
 =?utf-8?B?UXV1Q3JKVFFFR3BYNzEzZ0JDS0dZeG9FRTQvWlVYQzhabWdaTVk4SHBVK21t?=
 =?utf-8?B?NWhaU2RJOVJTbGdrRTNadzJubjZtc3ZJS0toNnplcjNCQ094YlAzQ0RjbGRL?=
 =?utf-8?B?QThKUXU3QnpnQnVIUjlSV0MrVFcyQkVaRkV3TjN6SzhxeXlJZ2hnZUwyMUF0?=
 =?utf-8?B?ZG1DazQwVlRTbC9hVDZPU2VqWDBWNGJzNVY3Y0ZuVDN1R1JNQk5MM3MzZTRt?=
 =?utf-8?B?Uk5ENERJME15cnVNTlY1T2xuS2JVckltUlNkSHliVFNEWWcxbWo3dU1hcmRO?=
 =?utf-8?B?aU9qaGFUbGRxYkg1THRzeExiQVRQUDF0TnFxazY1emFoK3JodTBmdHBudDRT?=
 =?utf-8?B?YjdCM0lLb1kxbHR2UXdxYWdmM2h4OTJLZytZc1pTNzJtc0Y3cVNnbG90S2pY?=
 =?utf-8?B?V3J0R0lxU0Y0VTZrTStvM3RBc0FWWkFMem4xOTJORWpmbjVFckxnRitUNTIv?=
 =?utf-8?B?UjRnRW5YT2JMeER0NWliaXJERkV0RmF1RXRTcnlKSWVRQ3ppZmZFMW90VWdZ?=
 =?utf-8?B?alVCcDRGMlBSQklRZjZKMHp6L0tyZEFWWlYrRmhBWlBmUFVPMW1YY0lGVUhS?=
 =?utf-8?B?dG1JY2lBSkp3MTlwWDc1ck5YeUVZU09uVndkZmExTFY5dnQ1a1BDdU44WnM5?=
 =?utf-8?Q?MX+UyprvsGuw/xw+u3wsho4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1741.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfbf6269-6b91-4fb6-a82d-08d9fdcc6637
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2022 10:47:37.8933 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRGhmsv+AbP7qn1hY6JNrchYzpqjRzFU9dTyxS9He965xEzmvnjbIikFQCjCQo4GUlcAEK5VMkjFavadFnzhkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5549
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
Cc: Carsten Haitzler <carsten.haitzler@arm.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQo+ID4gSGkgQWJoaW5hdiwNCj4gPiA+IEhpIExhdXJlbnQNCj4gPiA+DQo+ID4gPiBPayBz
dXJlLCBJIGNhbiB0YWtlIHRoaXMgdXAgYnV0IEkgbmVlZCB0byB1bmRlcnN0YW5kIHRoZSBwcm9w
b3NhbCBhDQo+ID4gPiBsaXR0bGUgYml0IG1vcmUgYmVmb3JlIHByb2NlZWRpbmcgb24gdGhpcy4g
U28gd2Ugd2lsbCBkaXNjdXNzIHRoaXMNCj4gPiA+IGluIGFub3RoZXIgZW1haWwgd2hlcmUgd2Ug
c3BlY2lmaWNhbGx5IHRhbGsgYWJvdXQgdGhlIGNvbm5lY3RvciBjaGFuZ2VzLg0KPiA+ID4NCj4g
PiA+IEFsc28sIEkgYW0gd2lsbGluZyB0byB0YWtlIHRoaXMgdXAgb25jZSB0aGUgZW5jb2RlciBw
YXJ0IGlzIGRvbmUgYW5kDQo+ID4gPiBtZXJnZWQgc28gdGhhdCBhdGxlYXN0IHdlIGtlZXAgbW92
aW5nIG9uIHRoYXQgYXMgTVNNIFdCDQo+ID4gPiBpbXBsZW1lbnRhdGlvbiBjYW4gcHJvY2VlZCB3
aXRoIHRoYXQgZmlyc3QuDQo+ID4gPg0KPiA+ID4gSGkgSmFuaSBhbmQgU3VyYWoNCj4gPiA+DQo+
ID4gPiBBbnkgY29uY2VybnMgd2l0aCBzcGxpdHRpbmcgdXAgdGhlIHNlcmllcyBpbnRvIGVuY29k
ZXIgYW5kIGNvbm5lY3Rvcg0KPiA+ID4gT1IgcmUtIGFycmFuZ2luZyB0aGVtPw0KPiA+ID4NCj4g
PiA+IExldCBtZSBrbm93IGlmIHlvdSBjYW4gZG8gdGhpcyBPUiBJIGNhbiBhbHNvIHNwbGl0IHRo
aXMgdXAga2VlcGluZw0KPiA+ID4gU3VyYWoncyBuYW1lIGluIHRoZSBDby1kZXZlbG9wZWQgYnkg
dGFnLg0KPiA+IEkgd2FzIGFjdHVhbGx5IHRoaW5raW5nIG9mIGZsb2F0aW5nIGEgbmV3IHBhdGNo
IHNlcmllcyB3aXRoIGJvdGgNCj4gPiBlbmNvZGVyIGFuZCBjb25uZWN0b3IgcG9pbnRlciBjaGFu
Z2VzIGJ1dCB3aXRoIGEgY2hhbmdlIGluDQo+ID4gaW5pdGlhbGl6YXRpb24gZnVuY3Rpb25zIHdo
ZXJlaW4gd2UgYWxsb2NhdGUgYSBjb25uZWN0b3IgYW5kIGVuY29kZXINCj4gPiBpbmNhc2UgdGhl
IGRyaXZlciBkb2VzbuKAmXQgaGF2ZSBpdHMgb3duIHRoaXMgc2hvdWxkIG1pbmltaXplIHRoZSBl
ZmZlY3QNCj4gPiBvbiBvdGhlciBkcml2ZXJzIGFscmVhZHkgdXNpbmcgY3VycmVudCBkcm0gd3Jp
dGViYWNrIGZyYW1ld29yayBhbmQgYWxzbw0KPiBhbGxvdyBpOTE1IHRvIGNyZWF0ZSBpdHMgb3du
IGNvbm5lY3Rvci4NCj4gDQo+IEkgdGhvdWdodCB0aGF0IExhdXJlbnQgd2FzIHF1aXRlIHN0cmlj
dCBhYm91dCB0aGUgY29ubmVjdG9yLiBTbyBJJ2Qgc3VnZ2VzdA0KPiB0YXJnZXRpbmcgZHJtX3dy
aXRlYmFja19jb25uZWN0b3Igd2l0aCBhbiBvcHRpb25hbGx5IGNyZWF0ZWQgZW5jb2RlciBhbmQN
Cj4gdGhlIGJ1aWx0aW4gY29ubmVjdG9yDQpJbiB0aGF0IGNhc2UgZXZlbiBpZiB3ZSB0YXJnZXQg
dGhhdCBpOTE1IHdpbGwgbm90IGJlIGFibGUgdG8gbW92ZSBmb3J3YXJkIHdpdGggaXRzDQppbXBs
ZW1lbnRhdGlvbiBvZiB3cml0ZWJhY2sgYXMgYnVpbHRpbiBjb25uZWN0b3IgZG9lcyBub3Qgd29y
ayBmb3IgdXMgcmlnaHQgbm93DQphcyBleHBsYWluZWQgZWFybGllciwgb3B0aW9uYWxseSBjcmVh
dGluZyBlbmNvZGVyIGFuZCBjb25uZWN0b3Igd2lsbCBoZWxwIGV2ZXJ5b25lDQptb3ZlIGZvcndh
cmQgYW5kIG9uY2UgZG9uZSB3ZSBjYW4gYWN0dWFsbHkgc2l0IGFuZCB3b3JrIG9uIGhvdyB0byBz
aWRlIHN0ZXAgdGhpcyANCmlzc3VlIHVzaW5nIExhdXJlbnQncyBzdWdnZXN0aW9uDQo+IA0KPiA+
IFdlIGNhbiB3b3JrIG9uIExhdXJlbnQncyBzdWdnZXN0aW9uIGJ1dCB0aGF0IHdvdWxkIGZpcnN0
IHJlcXVpcmUgdGhlDQo+ID4gaW5pdGlhbCBSRkMgcGF0Y2hlcyBhbmQgdGhlbiBhIHJld29yayBm
cm9tIGJvdGggb2Ygb3VyIGRyaXZlcnMgc2lkZSB0bw0KPiA+IHNlZSBpZiB0aGV5IGdlbCB3ZWxs
IHdpdGggb3VyIGN1cnJlbnQgY29kZSB3aGljaCB3aWxsIHRha2UgYQ0KPiA+IGNvbnNpZGVyYWJs
ZSBhbW91bnQgb2YgdGltZS4gV2UgY2FuIGZvciBub3cgaG93ZXZlciBmbG9hdCB0aGUgcGF0Y2gN
Cj4gPiBzZXJpZXMgdXAgd2hpY2ggbWluaW1hbGx5IGFmZmVjdHMgdGhlIGN1cnJlbnQgZHJpdmVy
cyBhbmQgYWxzbyBhbGxvd3MNCj4gPiBpOTE1IGFuZCBtc20gdG8gbW92ZSBmb3J3YXJkIHdpdGgg
aXRzIHdyaXRlYmFjayBpbXBsZW1lbnRhdGlvbiBvZmYNCj4gPiBjb3Vyc2Ugd2l0aCBhIHByb3Bl
ciBkb2N1bWVudGF0aW9uIHN0YXRpbmcgbmV3IGRyaXZlcnMgc2hvdWxkbid0IHRyeSB0bw0KPiBt
YWtlIHRoZWlyIG93biBjb25uZWN0b3JzIGFuZCBlbmNvZGVycyBhbmQgdGhhdCBkcm1fd3JpdGVi
YWNrIHdpbGwgZG8NCj4gdGhhdCBmb3IgdGhlbS4NCj4gPiBPbmNlIHRoYXQncyBkb25lIGFuZCBt
ZXJnZWQgd2UgY2FuIHdvcmsgd2l0aCBMYXVyZW50IG9uIGhpcyBwcm9wb3NhbA0KPiA+IHRvIGlt
cHJvdmUgdGhlIGRybSB3cml0ZWJhY2sgZnJhbWV3b3JrIHNvIHRoYXQgdGhpcyBpc3N1ZSBjYW4g
YmUgc2lkZQ0KPiBzdGVwcGVkIGVudGlyZWx5IGluIGZ1dHVyZS4NCj4gPiBGb3Igbm93IEkgd291
bGQgbGlrZSB0byBrZWVwIHRoZSBlbmNvZGVyIGFuZCBjb25uZWN0b3IgcG9pbnRlciBjaGFuZ2Vz
DQo+IHRvZ2V0aGVyLg0KDQpCZXN0IFJlZ2FyZHMsDQpTdXJhaiBLYW5kcGFsDQo=
