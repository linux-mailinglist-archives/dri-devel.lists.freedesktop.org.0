Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43F36F4F2A
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 05:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345FB10E199;
	Wed,  3 May 2023 03:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11011001.outbound.protection.outlook.com [52.101.47.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FBD10E199;
 Wed,  3 May 2023 03:35:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+OmWmHMKB/HdFOkjDNOuLUA7ZLTOwHn3ytKQPpk4AqSle9wc4K+0YI6egcnRgnXKjWQ7yGQDcKjivlSW4p13GiRccFN+2EtbJGNh+vMwQJr74GMgkpRcKkNRK9WcUAHj2eDIuGFp0pzJOILcVuFSCHXPUBE6t6p9YeYIwrqf6HwXvydmVLWhIwruJHamI2kHhx0ACDGLS+q3Oz9M99pp0KOngbLtdalDNdVn9iRsQLj+IbtronHLqXdW4adUd5/sulO2xvmH6yo1BzvAy29R8WoI6w56iY46N3vuahGR1uDj8OiUsj32MkCGQIUW0J6aOjzdjoCxRRV/LAIUCMgwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpFKd8rBr8SJWYlfIJ5AsPE3exQ83AMZmml6fcM4jrQ=;
 b=W1TEYVk8zR9FbGDlGNhpVC8n2h7Eg62dIN/mQXPVBOFODxbX3yS4XTy6PAt//5WQgL54uCVFYV/imI5P64SZGMxoWmM1LnHGcC5WoaiZoPelfTWA9CzWET1y+HxW9F8be4oai+TaIyRBjQn8KUP3PgadFRpQNz9Jqm+3prQGjhUGdHBVCz/idMVO60yPTT/DFhe7h/ipLO4D92VrseCg/Gx+ETFbq5L8Wn4a5XGJ1Dl+Xor6WAi6ECbgG13dUZj+QKFfRWOswaRSlg90ghqC3F7+Ua99hDpK+XtVBgds/u/CmyB+Iw+I9bNmD1dk6I2bkZ4+QlRyDoufv1VnjXWgJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpFKd8rBr8SJWYlfIJ5AsPE3exQ83AMZmml6fcM4jrQ=;
 b=Gqxoysl9Lso41oghMJ4szKlO/JF9Sz+4SBUB/vwadtUbagam53rZBUyRQILQwbC5oEWhvTg7tqTt/9MAbzxi4RQ22sKu3mB+JlxhxkKQPfVqL0pduY5iHkgEMx2TIVJijXSZMPNkfjPXB7XEoVpLx18FZJxgKld0CWCpNHn4Fik=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by BN6PR05MB2980.namprd05.prod.outlook.com
 (2603:10b6:404:2f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 03:35:30 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::b4c3:9441:f0:efb8]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::b4c3:9441:f0:efb8%7]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 03:35:29 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "javierm@redhat.com"
 <javierm@redhat.com>
Subject: Re: [PATCH v2 1/8] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
Thread-Topic: [PATCH v2 1/8] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
Thread-Index: AQHYlaAcTLxMgQIkC0KZLn5/g6usj62ohIeAgaACNYCAAS6fAA==
Date: Wed, 3 May 2023 03:35:29 +0000
Message-ID: <0dd2fa763aa0e659c8cbae94f283d8101450082a.camel@vmware.com>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-2-zack@kde.org>
 <YvPfedG/uLQNFG7e@phenom.ffwll.local>
 <87lei7xemy.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87lei7xemy.fsf@minerva.mail-host-address-is-not-set>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|BN6PR05MB2980:EE_
x-ms-office365-filtering-correlation-id: 9e4b4381-d522-4612-7846-08db4b877152
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dA5IWKkI/prySL0zwhwA/d53Jxvf2jrh4LZ5neBvsTawC8YftRfkeAQ6r6jDsGg8PzHtPD8YSJutFSMfokJlQbkbEhEDD62O/K/NerEtCfQNlNlGiQACE4UC9YFf6DWZuUoJRu83g5KTPAKPUgog7hXmQhAlDdeumTv3NdQ+LHq8C9wxmmyfDNDxUkkRuJZXbqBXKHseKOLruqsozqE0YxyEx/z7+5P3pH83G64US8Tg4fyg6aGQZA7kdZoND4l95xuVEVYRd80sOBZ5eBMl4d2dcDL4vwYFafBcYPOas5uiMI+79+NMvPUt30zg6PZP1xP0XURtnslT6z22uHSFWozH3+YM1nm/W8/C5ti49INRcRxQG9uCvuNq2euCLJxJ/8druidempib/xj9XjcLSo898hbHLAmwzbX6/xZOkJXy5htxfsISX/lX7a1FgDQTQ1ZFT806DUamjyxj6mifC+f/ktSweQopHNwGpZYjyFJrFCgEsnHOb9CG3baVhJcUreNoQ1jDDCEhn5w4shFD+f4rBiHS7F6hresGb4iktWyZpf+o6fo5fOHr+mI0SUZo8hzbvHC0pszedYzQnLkh7DNt0jotll3kUM7q7pIntGnle/DPp6b+t3CSJNrAMkEOrCRBpEPruYSOMSr79rGIxvBQaBtRaGdsNNo+62v6VO4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(451199021)(6506007)(26005)(6512007)(7416002)(107886003)(186003)(2616005)(2906002)(5660300002)(83380400001)(8936002)(8676002)(6486002)(71200400001)(41300700001)(36756003)(122000001)(478600001)(38100700002)(110136005)(54906003)(316002)(64756008)(66446008)(66476007)(66556008)(38070700005)(66946007)(86362001)(4326008)(76116006)(91956017);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWllRlRvREwveFMrWkJGQXc0eXMvMGUvc2ZSM3VrS3l0eFlRNy9mWDlmOWhn?=
 =?utf-8?B?dG5MdzlSa2NFS3FzTjJ1dnNvemlDNHhINVR4MVZaRG5TY3hPd1lFeUw4Rzg2?=
 =?utf-8?B?bVBKOGgwYVRsb1lCMXFKYUdnZG9ObVg1SmRNTGN6dUtZV1JLNHQvemJzb25i?=
 =?utf-8?B?bVgySkUrVTRVNHhJNktRY2pvUnQxNzl3aEROdWZkRlkreDVEK2Joc2hQcTBV?=
 =?utf-8?B?T0ovZUVrVnFHMUszY29RT2NQZEZHTm4vSElZa0JiMUduc0xUMWhhZS9TOEgz?=
 =?utf-8?B?R2ZHV3pQYWdsV01qL1FOUnhIWWEwVkRhUzEvSE9tdEdLWUpKQTlhTnUyMzcr?=
 =?utf-8?B?THArVVZsRmtvTnZLU2p6S0t5UU5qWDNBdk80Y3diNkx3UXY2N3VxeCtpdFFT?=
 =?utf-8?B?akhkVTYyd1dCRnFudjd5Z1RSVHpIRUQwSzExbkJNYUk3eUF0dGY1dHAvSWFv?=
 =?utf-8?B?eDZwZy9uZWEyRHdHMGk2UEx4SjAvbEZFVVVpY21xeERMTUZ0YlIvUzdTV2t3?=
 =?utf-8?B?RGZWcDhNWXQ0aXVObjgyeXJyeERtRFkvT1dtY1NVbDdOWUg2SWZIVFhudzJq?=
 =?utf-8?B?ZjMxdy9NYjBzT3Jtd01DeVpXMUg4TXhRL1NlOTJMU1NYd2o5MVI4djhhMHg4?=
 =?utf-8?B?c2t2QU9aTUUwTUZsWElGemc0b1hHYVkvQTgwQ21jUFRFNXBDSzVibnZIUnQ5?=
 =?utf-8?B?bmNhaFdyT1dsTXhJK0VyaG92emxVU2dXUkNFcDdjem1sTXV6Vmtzd1UrRUZp?=
 =?utf-8?B?Q3ExUWNBOGNTZWcyR1ZwUnFyb2lnOC9aU3FnT0NqU3BBaXZIcmJpdVJncFg1?=
 =?utf-8?B?QWVmQmZ0TytFcVo4eGpYU0VxUmNwdTJqd2pkcHNUempGM1JCd2Jka3ZicWNB?=
 =?utf-8?B?MHpHRy9TNTVvR2FMMExZekY1NFpWZ21xK2Z0MHlBRlNvNjhrTVNMQWJyNDU2?=
 =?utf-8?B?VSt0eVRQYnpsaWdaZUhoNXVQK1dmVitsaGl4SFYwaHVyVnFHVUZGdTJERHRp?=
 =?utf-8?B?U1pZZVpyNGhaKzlFU00vbk52WlVRQ2xESFQwNGlnTHIrWEhaQWtmUjRqa1lp?=
 =?utf-8?B?eFpVM0dqTVNMdHZJMElIS0hqSUFPbk1CTDJVYkwrbUNaeWlrZTc4UUdwOFZG?=
 =?utf-8?B?ZFNucFVud1hnRmIvNjBHVm1GS0l6Q29yd2JyVWJjV0NveDhWOTBuK3VlM2tl?=
 =?utf-8?B?eHV4YXlnbXFKWXJwN2NMNlZpWFFHQlJqRC9uOTU2Zjk1cUROMmxTR1B4V0cy?=
 =?utf-8?B?SnhrYmxVZXJQbWsxT1NQMDd5OWZrdXFIMlFVdHlYcW5lYzJYOWxicHpkV0lE?=
 =?utf-8?B?bVpVbWVHSDRoR2x1WHVnSm9VMVUvZU0vTGxUeEF6WDd6MU9JL0FxZHJ2alBH?=
 =?utf-8?B?dzNwY1c2UGtHelVWOTNUUjlWb2haSTJmKzJJbnpiS0ZickM5N3F0cE43dXBM?=
 =?utf-8?B?Tm5EUWR0L1QwOGhJWXZveEZ1OVMvajEyZ2pKSTQ4RlR4SGg2MHpnY05YWlN4?=
 =?utf-8?B?TXpxcU5xb21pSzlCVEJJZWJJVm9SZjBvbjFrWWZoN1NyM2dXcDBQUDN0ek1o?=
 =?utf-8?B?V0thUVNVZkZBRnZQU0ZtYVByZHF5d0tJRnI1VHd5cGorbVZDd1ZyN3RaZ2h0?=
 =?utf-8?B?emJkbzViU2FpWnVVbWZTSjU1aDYvQlhNY3NiUlFkSGNmd2hxN0dhU2VjTitM?=
 =?utf-8?B?eGJsdy9tbk9PV0lBaWFGQ0RaRGhodXpCKzdpZnRjV1FHMml0dG93dEQ3blhB?=
 =?utf-8?B?S3J1SjhZcjZiZUhMQjV0alJMMnVQYW5KS1ZBYlYwZDBEWVVvRTdoaUlWeWJC?=
 =?utf-8?B?Wm10WjNjZVNkcHlVbGZQUmVrQy90eGdaS3RvLzhhM1MyRVdCTm9zSUZXVlgv?=
 =?utf-8?B?ZzdtNDFhVFBxRndNUWltajBnYWV2aGV1dHg4dkY0c1BPSDBDQndVOXpXd3FF?=
 =?utf-8?B?TU92NmU4WkR3aXVrbEZiNFJlRVBhdkNlMFpQQ2wzNXRPVUV4a1NoZ0J0dXBj?=
 =?utf-8?B?MytCY2crMTE5eTN6M3NWY2QxZTBLWnBCQk9vZ0M3M1JWUDdPc3RwUWFZemdx?=
 =?utf-8?B?UXFxSGpCa3lHR3hGUEp0bkFqUVltQWIyVE5ybmtLZ1VlV0tJeXlOa09PeE5u?=
 =?utf-8?Q?df/3VzbajXEVLWOLrBmALsdb5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB5079B85FFEC346903A56C3B8459CE9@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4b4381-d522-4612-7846-08db4b877152
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 03:35:29.6594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mlEfLPJWmc9d6QYk4/lPb2+NOVXLQFE6qfLwkdBSo4BxLn6X52CiPYVZ6cr1aUgDGk2opy2n+A5SG//Gy4+ycQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR05MB2980
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
Cc: "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "belmouss@redhat.com" <belmouss@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA1LTAyIGF0IDExOjMyICswMjAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMgd3JvdGU6DQo+ICEhIEV4dGVybmFsIEVtYWlsDQo+IA0KPiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+IHdyaXRlczoNCj4gDQo+ID4gT24gTW9uLCBKdWwgMTEsIDIwMjIgYXQgMTE6
MzI6MzlQTSAtMDQwMCwgWmFjayBSdXNpbiB3cm90ZToNCj4gPiA+IEZyb206IFphY2sgUnVzaW4g
PHphY2tyQHZtd2FyZS5jb20+DQo+ID4gPiANCj4gPiA+IEN1cnNvciBwbGFuZXMgb24gdmlydHVh
bGl6ZWQgZHJpdmVycyBoYXZlIHNwZWNpYWwgbWVhbmluZyBhbmQgcmVxdWlyZQ0KPiA+ID4gdGhh
dCB0aGUgY2xpZW50cyBoYW5kbGUgdGhlbSBpbiBzcGVjaWZpYyB3YXlzLCBlLmcuIHRoZSBjdXJz
b3IgcGxhbmUNCj4gPiA+IHNob3VsZCByZWFjdCB0byB0aGUgbW91c2UgbW92ZW1lbnQgdGhlIHdh
eSBhIG1vdXNlIGN1cnNvciB3b3VsZCBiZQ0KPiA+ID4gZXhwZWN0ZWQgdG8gYW5kIHRoZSBjbGll
bnQgaXMgcmVxdWlyZWQgdG8gc2V0IGhvdHNwb3QgcHJvcGVydGllcyBvbiBpdA0KPiA+ID4gaW4g
b3JkZXIgZm9yIHRoZSBtb3VzZSBldmVudHMgdG8gYmUgcm91dGVkIGNvcnJlY3RseS4NCj4gPiA+
IA0KPiA+ID4gVGhpcyBicmVha3MgdGhlIGNvbnRyYWN0IGFzIHNwZWNpZmllZCBieSB0aGUgInVu
aXZlcnNhbCBwbGFuZXMiLiBGaXggaXQNCj4gPiA+IGJ5IGRpc2FibGluZyB0aGUgY3Vyc29yIHBs
YW5lcyBvbiB2aXJ0dWFsaXplZCBkcml2ZXJzIHdoaWxlIGFkZGluZw0KPiA+ID4gYSBmb3VuZGF0
aW9uIG9uIHRvcCBvZiB3aGljaCBpdCdzIHBvc3NpYmxlIHRvIHNwZWNpYWwgY2FzZSBtb3VzZSBj
dXJzb3INCj4gPiA+IHBsYW5lcyBmb3IgY2xpZW50cyB0aGF0IHdhbnQgaXQuDQo+ID4gPiANCj4g
PiA+IERpc2FibGluZyB0aGUgY3Vyc29yIHBsYW5lcyBtYWtlcyBzb21lIGttcyBjb21wb3NpdG9y
cyB3aGljaCB3ZXJlIGJyb2tlbiwNCj4gPiA+IGUuZy4gV2VzdG9uLCBmYWxsYmFjayB0byBzb2Z0
d2FyZSBjdXJzb3Igd2hpY2ggd29ya3MgZmluZSBvciBhdCBsZWFzdA0KPiA+ID4gYmV0dGVyIHRo
YW4gY3VycmVudGx5IHdoaWxlIGhhdmluZyBubyBlZmZlY3Qgb24gb3RoZXJzLCBlLmcuIGdub21l
LXNoZWxsDQo+ID4gPiBvciBrd2luLCB3aGljaCBwdXQgdmlydHVhbGl6ZWQgZHJpdmVycyBvbiBh
IGRlbnktbGlzdCB3aGVuIHJ1bm5pbmcgaW4NCj4gPiA+IGF0b21pYyBjb250ZXh0IHRvIG1ha2Ug
dGhlbSBmYWxsYmFjayB0byBsZWdhY3kga21zIGFuZCBhdm9pZCB0aGlzIGlzc3VlLg0KPiA+ID4g
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiA+
ID4gRml4ZXM6IDY4MWU3ZWM3MzA0NCAoImRybTogQWxsb3cgdXNlcnNwYWNlIHRvIGFzayBmb3Ig
dW5pdmVyc2FsIHBsYW5lIGxpc3QNCj4gPiA+ICh2MikiKQ0KPiANCj4gWy4uLl0NCj4gDQo+ID4g
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Rydi5oIGIvaW5jbHVkZS9kcm0vZHJtX2Ry
di5oDQo+ID4gPiBpbmRleCBmNjE1OWFjYjg4NTYuLmM0Y2Q3ZmMzNTBkOSAxMDA2NDQNCj4gPiA+
IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPiA+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJt
X2Rydi5oDQo+ID4gPiBAQCAtOTQsNiArOTQsMTYgQEAgZW51bSBkcm1fZHJpdmVyX2ZlYXR1cmUg
ew0KPiA+ID4gwqDCoMKgwqDCoCAqIHN5bmNocm9uaXphdGlvbiBvZiBjb21tYW5kIHN1Ym1pc3Np
b24uDQo+ID4gPiDCoMKgwqDCoMKgICovDQo+ID4gPiDCoMKgwqDCoCBEUklWRVJfU1lOQ09CSl9U
SU1FTElORcKgwqDCoMKgwqDCoMKgwqAgPSBCSVQoNiksDQo+ID4gPiArwqDCoMKgIC8qKg0KPiA+
ID4gK8KgwqDCoMKgICogQERSSVZFUl9WSVJUVUFMOg0KPiA+ID4gK8KgwqDCoMKgICoNCj4gPiA+
ICvCoMKgwqDCoCAqIERyaXZlciBpcyBydW5uaW5nIG9uIHRvcCBvZiB2aXJ0dWFsIGhhcmR3YXJl
LiBUaGUgbW9zdCBzaWduaWZpY2FudA0KPiA+ID4gK8KgwqDCoMKgICogaW1wbGljYXRpb24gb2Yg
dGhpcyBpcyBhIHJlcXVpcmVtZW50IG9mIHNwZWNpYWwgaGFuZGxpbmcgb2YgdGhlDQo+ID4gPiAr
wqDCoMKgwqAgKiBjdXJzb3IgcGxhbmUgKGUuZy4gY3Vyc29yIHBsYW5lIGhhcyB0byBhY3R1YWxs
eSB0cmFjayB0aGUgbW91c2UNCj4gPiA+ICvCoMKgwqDCoCAqIGN1cnNvciBhbmQgdGhlIGNsaWVu
dHMgYXJlIHJlcXVpcmVkIHRvIHNldCBob3RzcG90IGluIG9yZGVyIGZvcg0KPiA+ID4gK8KgwqDC
oMKgICogdGhlIGN1cnNvciBwbGFuZXMgdG8gd29yayBjb3JyZWN0bHkpLg0KPiA+ID4gK8KgwqDC
oMKgICovDQo+ID4gPiArwqDCoMKgIERSSVZFUl9WSVJUVUFMwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA9IEJJVCg3KSwNCj4gPiANCj4gPiBJIHRoaW5rIHRoZSBuYW1pbmcgaGVy
ZSBpcyB1bmZvcnR1bmF0ZSwgYmVjYXVzZSBwZW9wbGUgd2lsbCB2b25kZXIgd2h5DQo+ID4gZS5n
LiB2a21zIGRvZXNuJ3Qgc2V0IHRoaXMsIGFuZCB0aGVuIGFkZCBpdCwgYW5kIGNvbmZ1c2Ugc3R1
ZmYgY29tcGxldGVseS4NCj4gPiANCj4gPiBBbHNvIGl0IGZlZWxzIGEgYml0IHdyb25nIHRvIHB1
dCB0aGlzIG9udG8gdGhlIGRyaXZlciwgd2hlbiByZWFsbHkgaXQncyBhDQo+ID4gY3Vyc29yIGZs
YWcuIEkgZ3Vlc3MgeW91IGNhbiBtYWtlIGl0IHNvbWUga2luZCBvZiBmbGFnIGluIHRoZSBkcm1f
cGxhbmUNCj4gPiBzdHJ1Y3R1cmUsIG9yIGEgbmV3IHBsYW5lIHR5cGUsIGJ1dCBwdXR0aW5nIGl0
IHRoZXJlIGluc3RlYWQgb2YgaW50byB0aGUNCj4gPiAicmFuZG9tIHBpbGUgb2YgbWlkbGF5ZXIt
bWlzdGFrZSBkcml2ZXIgZmxhZ3MiIHdvdWxkIGJlIGEgbG90IGJldHRlci4NCj4gPiANCj4gPiBP
dGhlcndpc2UgSSB0aGluayB0aGUgc2VyaWVzIGxvb2tzIHJvdWdobHkgaG93IEknZCBleHBlY3Qg
aXQgdG8gbG9vay4NCj4gPiAtRGFuaWVsDQo+ID4gDQo+IA0KPiBBRkFJQ1QgdGhpcyBpcyB0aGUg
b25seSByZW1haW5pbmcgdGhpbmcgdG8gYmUgYWRkcmVzc2VkIGZvciB0aGlzIHNlcmllcyA/DQoN
Ck5vLCB0aGVyZSB3YXMgbW9yZS4gdGJoIEkgaGF2ZW4ndCBoYWQgdGhlIHRpbWUgdG8gdGhpbmsg
YWJvdXQgd2hldGhlciB0aGUgYWJvdmUNCm1ha2VzIHNlbnNlIHRvIG1lLCBlLmcuIEknbSBub3Qg
c3VyZSBpZiBoYXZpbmcgdmlydHVhbGl6ZWQgZHJpdmVycyBleHBvc2UgInN1cHBvcnQNCnVuaXZl
cnNhbCBwbGFuZXMiIGFuZCBhZGRpbmcgYW5vdGhlciBwbGFuZSB3aGljaCBpcyBub3QgdW5pdmVy
c2FsICh0aGUgb25seQ0KInVuaXZlcnNhbCIgcGxhbmUgb24gdGhlbSBiZWluZyB0aGUgZGVmYXVs
dCBvbmUpIG1ha2VzIG1vcmUgc2Vuc2UgdGhhbiBhIGZsYWcgdGhhdA0Kc2F5cyAidGhpcyBkcml2
ZXIgcmVxdWlyZXMgYSBjdXJzb3IgaW4gdGhlIGN1cnNvciBwbGFuZSIuIFRoZXJlJ3MgY2VydGFp
bmx5IGEgaHVnZQ0KZGlmZmVyZW5jZSBpbiBob3cgdXNlcnNwYWNlIHdvdWxkIGJlIHJlcXVpcmVk
IHRvIGhhbmRsZSBpdCBhbmQgaXQncyB3YXkgdWdsaWVyIHdpdGgNCnR3byBkaWZmZXJlbnQgY3Vy
c29yIHBsYW5lcy4gaS5lLiB0aGVyZSdzIGEgbG90IG9mIHdheXMgaW4gd2hpY2ggdGhpcyBjb3Vs
ZCBiZQ0KY2xlYW5lciBpbiB0aGUga2VybmVsIGJ1dCB0aGV5IGFsbCByZXF1aXJlIHNpZ25pZmlj
YW50IGNoYW5nZXMgdG8gdXNlcnNwYWNlLCB0aGF0IGdvDQp3YXkgYmV5b25kICJhdHRhY2ggaG90
c3BvdCBpbmZvIHRvIHRoaXMgcGxhbmUiLiBJJ2QgbGlrZSB0byBhdm9pZCBhcHByb2FjaGVzIHRo
YXQNCm1lYW4gcnVubmluZyB3aXRoIGF0b21pYyBrbXMgcmVxdWlyZXMgY29tcGxldGVseSBzZXBh
cmF0ZSBwYXRocyBmb3IgdmlydHVhbGl6ZWQNCmRyaXZlcnMgYmVjYXVzZSBubyBvbmUgd2lsbCBl
dmVyIHN1cHBvcnQgYW5kIG1haW50YWluIGl0Lg0KDQpJdCdzIG5vdCBhIHRyaXZpYWwgdGhpbmcg
YmVjYXVzZSBpdCdzIGZ1bmRhbWVudGFsbHkgaGFyZCB0byB1bnRhbmdsZSB0aGUgZmFjdCB0aGUN
CnZpcnR1YWxpemVkIGRyaXZlcnMgaGF2ZSBiZWVuIGFkdmVydGlzaW5nIHVuaXZlcnNhbCBwbGFu
ZSBzdXBwb3J0IHdpdGhvdXQgZXZlcg0Kc3VwcG9ydGluZyB1bml2ZXJzYWwgcGxhbmVzLiBFc3Bl
Y2lhbGx5IGJlY2F1c2UgbW9zdCBuZXcgdXNlcnNwYWNlIGluIGdlbmVyYWwgY2hlY2tzDQpmb3Ig
InVuaXZlcnNhbCBwbGFuZXMiIHRvIGV4cG9zZSBhdG9taWMga21zIHBhdGhzLg0KDQpUaGUgb3Ro
ZXIgdGhpbmcgYmxvY2tpbmcgdGhpcyBzZXJpZXMgd2FzIHRoZSB0ZXN0aW5nIG9mIGFsbCB0aGUg
ZWRnZSBjYXNlcywgSSB0aGluaw0KU2ltb24gYW5kIFBla2thIGhhZCBzb21lIGlkZWFzIGZvciB0
aGluZ3MgdG8gdGVzdCAoZS5nLiBydW4gbXV0dGVyIHdpdGggc3VwcG9ydCBmb3INCnRoaXMgYW5k
IHdheWxhbmQgd2l0aG91dCBzdXBwb3J0IGZvciB0aGlzIGluIGF0IHRoZSBzYW1lIHRpbWUgaW4g
ZGlmZmVyZW50IGNvbnNvbGVzDQphbmQgc2VlIHdoYXQgaGFwcGVucykuIEkgbmV2ZXIgaGFkIHRo
ZSB0aW1lIHRvIGRvIHRoYXQgZWl0aGVyLg0KDQo+IFphY2ssIGFyZSB5b3UgcGxhbm5pbmcgdG8g
cmUtc3BpbiBhIHYzIG9mIHRoaXMgcGF0Y2gtc2V0PyBBc2tpbmcgYmVjYXVzZQ0KPiB3ZSB3YW50
IHRvIHRha2UgdmlydGlvLWdwdSBvdXQgb2YgdGhlIGF0b21pYyBLTVMgZGVueSBsaXN0IGluIG11
dHRlciwgYnV0DQo+IGZpcnN0IG5lZWQgdGhpcyB0byBsYW5kLg0KPiANCj4gSWYgeW91IHRoaW5r
IHRoYXQgd29uJ3QgYmUgYWJsZSB0byBkbyBpdCBpbiB0aGUgc2hvcnQgdGVybSwgQmlsYWwgKENj
J2VkKQ0KPiBvciBtZSB3b3VsZCBiZSBnbGFkIHRvIGhlbHAgd2l0aCB0aGF0Lg0KDQpUaGlzIGhh
cyBiZWVuIG9uIG15IHRvZG8gZm9yIGEgd2hpbGUgSSBqdXN0IG5ldmVyIGhhZCB0aGUgdGltZSB0
byBnbyB0aHJvdWdoIGFsbCB0aGUNCnJlbWFpbmluZyBpc3N1ZXMuIEZ1bmRhbWVudGFsbHkgaXQn
cyBub3Qgc28gbXVjaCBhIHRlY2huaWNhbCBpc3N1ZSBhbnltb3JlLCBpdCdzDQphYm91dCBwaWNr
aW5nIHRoZSBsZWFzdCBicm9rZW4gc29sdXRpb24gYW5kIHRyeWluZyB0byBtYWtlIHRoZSBiZXN0
IG91dCBvZiBhIHByZXR0eQ0KYmFkIHNpdHVhdGlvbi4gSW4gZ2VuZXJhbCBpdCdzIGhhcmQgdG8g
cGFpbnQgYSBiaWtlc2hlZCBpZiBhbGwgeW91IGhhdmUgaXMgYSBtaWxsaW9uDQpzaGFkZXMgb2Yg
Z3JheSA7KQ0KDQp6DQoNCg==
