Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFD46F62C1
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 03:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E26B10E1CE;
	Thu,  4 May 2023 01:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR02CU006.outbound.protection.outlook.com
 (mail-eastusazon11013010.outbound.protection.outlook.com [52.101.54.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8354010E1A1;
 Thu,  4 May 2023 01:50:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUbo5s5HXA0oZBmPnolS3s3X50eaZ7zGLqwNyAmW9I3KPzdM5fAIQg/UiRxuQrI7kbmZshl4VGxda+FPqbCnZdBem4FadcyVHdH+2GbE/8HQ8P8ebTANNjjxDVXXla53/jQMKvtiEGOWu8/j0vKPsaFVXdhLC58TkAmnBpoE7Y5iObqJT0/1hR/ByDStsR70L/K/3uzYgkyyunSVjxfL9zJ2XWek+x0F4IFW1pw0lX32VDO2LbpREby7/F62bJ0yMNPXQHSPZJNuoHRKme0ZzIzipn7CNXuIcTY9NfU028t2edDS+BO81gcjTmA3w8HBNNcBBsS5/g5ZM1fv2s5aDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvLQyJNusryz7IMam8AXn06l0l7xkEJYm7HkAsEEA7Y=;
 b=F+7t0LSXzsa932wyAmW//Ya0O+cFCMADRD9NC/gbmZZM/AEO+BrQSTbg1MNvQO5i3Zp4+AFnXZ/8wPeQp1ocC86UATdoNM6F/ugmU5pvJsetsYFdCpskWKK0Ubgw1pCf69aNtTMSwDI1o5L06A9y42u+4Zta5ajPzszw47mryM+7dVGmGcJyBPhtnayxQp4ica3DHA23AsHAqjU3H3AeABn/SPsdpKLw4sxkD6GFuy+krM7SyhifIqVQfRBrV2d4EYPHHlyI8DLcn8Anq8cMfUT1KyaFzYpFoKpHtUl2UQ0Rronrnbm+VYnEesJf0cByOJJwEX/bFQF3FI3GamdwPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvLQyJNusryz7IMam8AXn06l0l7xkEJYm7HkAsEEA7Y=;
 b=eZnPoY+C+a9RM6Xcik8TZxujVLzAb+caOmwEaPollsz0Jo9RWJfYhROaUOoOiRWbOEjLiZyEWUghh1giuenx8PNsNu38DjkUt+q7LZAvwkuh7BJO+h4VwJrS1zF5WXCcas7pgNj60KmA2ZHEFT70GFWloA0ijNqwg2sxzgslqRQ=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by DS7PR05MB7350.namprd05.prod.outlook.com
 (2603:10b6:5:2d3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 01:50:25 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::b4c3:9441:f0:efb8]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::b4c3:9441:f0:efb8%7]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 01:50:25 +0000
From: Zack Rusin <zackr@vmware.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "javierm@redhat.com"
 <javierm@redhat.com>
Subject: Re: [PATCH v2 1/8] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
Thread-Topic: [PATCH v2 1/8] drm: Disable the cursor plane on atomic contexts
 with virtualized drivers
Thread-Index: AQHYlaAcTLxMgQIkC0KZLn5/g6usj62ohIeAgaACNYCAAS6fAIAARs8AgAEuKwA=
Date: Thu, 4 May 2023 01:50:25 +0000
Message-ID: <17cc969e9f13fab112827e154495eca28c4bd2b6.camel@vmware.com>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-2-zack@kde.org>
 <YvPfedG/uLQNFG7e@phenom.ffwll.local>
 <87lei7xemy.fsf@minerva.mail-host-address-is-not-set>
 <0dd2fa763aa0e659c8cbae94f283d8101450082a.camel@vmware.com>
 <87y1m5x3bt.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87y1m5x3bt.fsf@minerva.mail-host-address-is-not-set>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|DS7PR05MB7350:EE_
x-ms-office365-filtering-correlation-id: 836a6b66-72ce-4cbc-0c65-08db4c41ee4d
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aXCGvkP6dOOdMuXCxPm5lDW0YxdH0g0fuRKHWPNLFMhLGNDBM1HzJUjlAWFjYJlQgevQ3Zx+syeHX6Rl2zm9u9c8/amDFPFVr+b+1z4FAzJ94UhZkQJQa2PTP9RtFGIqBoqUiqCaMIZgCywkSyaahb636hDgpgXhjauMhZ9uNm8lO7zp9w7twqu3N3VV7Dhac5Jh38hthaGjEX/lV99UFoGJnjxLpa9mpIz+p87nN/+jWBMfD8VMH9are4rJ7zmOFzOIjUXErANHmbaMF4xZU3YfFZujaGxE9LiSS/3D8ZjtvVgDgEBsDsKQs6sLYTkZKMor8Ke+q8w2yywOSzl0/t0DSP8r0kl52+s2kRL3u8ajDtz7n+qXARKUcKr42qXzhJ3OqRRnJCqtnij0MSbkdqC9rAFj5I0y/AEsPJHhcl8s1ZuCYWQZrkKTdXU+D1GviuOUGQevnHKHmdoVaj1MDHrsTMVXiV17dDUJ+0nyewkdjsPN6/i4nsYA3fqxdeB5ICySRlx96FgK6AinCbJqQ5EVmsl7uxqMjrkEzHnkE3RJAx+kjarb8AW4GGAEaOaF2moZ3t0wA6+aoaDKr/J1mSEVwM+mdygA8X+hhxa/Fpy7JK8FQdLGepl5meFF0gEvcQz0/05rTHQ1pDi6//rxnQGAf+KTWx+ClyqLS/KvA3U=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(316002)(41300700001)(186003)(2906002)(71200400001)(6512007)(6506007)(26005)(36756003)(54906003)(2616005)(110136005)(4326008)(83380400001)(6486002)(76116006)(64756008)(66446008)(66476007)(86362001)(91956017)(66946007)(66556008)(38070700005)(478600001)(7416002)(8676002)(8936002)(5660300002)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGtjU2xPVkhnSHMya3ZTeVhja2V2cGlBSTE5enBrWUxKR3h6VVEvWDBNVUJE?=
 =?utf-8?B?N2lLeHZzTWxISEZTSU5oTDByNUJOajBTQ1RrV2txTFEwWEdLZVNOS1NrWXZM?=
 =?utf-8?B?bk1qc1JtRVZyWWtndFJ3Wjd6d0p3a0RyeFN5MHExWHI5eW1zdHJVajJSRXhO?=
 =?utf-8?B?QVJqQUpCUjJINDQwTkMyaTFKWit1Z09lZ1dNU3ZmUE0vNTBUQk4yNUlBTWJ4?=
 =?utf-8?B?b1RheDBNanRSL0pUVEtibEpEQW5mMTBqVEJOWE0vbWJGN3JyVnQ4MTlhZEZp?=
 =?utf-8?B?Q1Bta3NlcGdBaTE3d21aZDYxWHR0Nncra0RmcEYvc3l6eWxUbHhreERPQ2FT?=
 =?utf-8?B?UWNFQS9MYVpoYUFaQjRSTVpia2U0SzdHUUd1V2NrWmdyb0J6TmNoNXZuc3pH?=
 =?utf-8?B?MUptNWF3SWpuaGR2eHVOcWh3bGg0S25GR0t1TXJ2ZUpReDZXemMySXVoNlVy?=
 =?utf-8?B?QlY4SEYrckhOREQrd1lrck5KQ2loeGZ5cXNIRmJmM24rVWZsbHY3Znd3TkZs?=
 =?utf-8?B?bFRuNmxhaXF0TXVkTkhTZ3E3M2NIU1BnbFVaUDFBWXpOU3pacVdUMW9pVmdM?=
 =?utf-8?B?dzJpdERoRlZlNnFQV0ZPS3BhK0ZOVHBGT21tcmdSZU1mKy80S2pDQ1BKY2oy?=
 =?utf-8?B?cHdhZjg2WlZrTWsxTE1Fc0YvS3pHWlpKMnBGWVQwcExVOFBwelJUZUdwNTMv?=
 =?utf-8?B?dmhEQ0VPdlpka3Y2NVRwczNPYXJqOXh4RkJDOFRMNk9GVDJjeHQxb2cxaUVt?=
 =?utf-8?B?Rk50RHhjaFphbWZ3bHB4MzF1cEdGUER4TWgxT055MGNpbW5oV0Z5SEpoQkNF?=
 =?utf-8?B?STVVUkprTXRRQjRZMlZPTXhGVWM3aE1TNFloeDh4YWZDa21GZmsyTzVaQ1NN?=
 =?utf-8?B?OW9QZU5jWlRjWVVla3owQjBpdjFHV0VEMlN0VGNibmhQUXpCQXdQRWZKbWxq?=
 =?utf-8?B?d1JCTERnc2c3dkV1RVAwaStuaUsrdFhab2tHMXl2L3EwSXQ3MVFCMFVwMHU5?=
 =?utf-8?B?OTFkdGh3SDcyUStNd0hKUVBZNmFZeklNcGN6bjU4QU5wSWlUWEgzSWRLanZT?=
 =?utf-8?B?YjVGN3ZFTjdmRERFemZQenBUZWxQb3JxdXgxZ05vTDkrUzZpVTllSzhxd3Fu?=
 =?utf-8?B?cTBwR0t2enQ3aVpkRDFSams2dnNrZ3BkQkFDaEpDNkdDUjd0T2NmNHJBYWti?=
 =?utf-8?B?NXNBMUZmZmI0VkFGeEtuclhXSzN0aG1GaGMxenJTRTdGeUpKZkNSYUtoV0N0?=
 =?utf-8?B?WkhXQ3Zwb1NiU0ZCbnVTdDh0RElDdHVoeTNTY2x5Z1Nqall5S2E0R0hhRlRo?=
 =?utf-8?B?Slp2YzA2RFNJRklBMlBzbCtjNGxlTWdxc0xPaFQxcmp4UFBBZEdYL20xVy9o?=
 =?utf-8?B?dDhvbUFkMTRXdmF5UlFzZDF5VENweW5mbzhtMlFSR1lQSTVyaW5Xc040a0tt?=
 =?utf-8?B?YnpuODRPK1M1dEVmY3VIZTE4bklGNmhSckFhV09VaVJka3FsTzh3cTJ3Nk5x?=
 =?utf-8?B?WnRJeGZmY083TU4wVE00RFJNRXljRHlZeTliYWFVZmMyaTdjMmYxbCs5VTZQ?=
 =?utf-8?B?aVpocFlXbTh2QllPSmtWQi9JSDk2WVlLR0ozQ0tEMzJvYTR6Um1YZFBVRTRo?=
 =?utf-8?B?eVF3WFVCcVhXeC9JdXdrakRxOWxaQmF1VTk0bHpyTEtpa1NCRHNTcVV1MHlu?=
 =?utf-8?B?eWpQMzdndVE5a2RteG5oT3F2ckNhdWJNMXBjcTVScUN5eEh0dnZiU1V6R3J0?=
 =?utf-8?B?azdlSENsbGJSOTRsZFlDN3FyRmVSSWxLbHM0ODByc1JrOWNDNHhaU2c0YTJ1?=
 =?utf-8?B?V216Ymk1azZLZzZWK1pOdmZtRkNMVklzWUJ5R1FkNmNzbk0yd1VnSHA2Mm9a?=
 =?utf-8?B?TzM0T250d3RpK0FHRVdQTVR3TnVsZW9UZE5MbUU2c3JPa2JhdU81RVZLdHpa?=
 =?utf-8?B?WGxuQXhwOFdhWFMwN3Uvb0gvMXB2RFFHNUlya29hS21URlJ0MmpuM2lKREcw?=
 =?utf-8?B?Tk8valRydTZRRFlZVFl5SkJ3M2FUREhBYlBzV01leWdZUFJ2QVBydXAwaC9r?=
 =?utf-8?B?UHcvTmxHUmdmTEVTSjNBaExCNjl0M2dlZWc4TmNHRm9rNTNmNU50UkxlcldC?=
 =?utf-8?Q?94ZVAv4LPhFStN2z8QSKQl799?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2D5403C778170340B92BDB9A56B16359@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836a6b66-72ce-4cbc-0c65-08db4c41ee4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 01:50:25.7642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: grVf3huv5205OtAU3MQksZ5RSgdFmIWCT8duDmo3pSr+sPsHVrkhaMd0rAF4iz2HTP2RqwDA8jFAFThpWA5rLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR05MB7350
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
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 Martin Krastev <krastevm@vmware.com>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "airlied@redhat.com" <airlied@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTA1LTAzIGF0IDA5OjQ4ICswMjAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMgd3JvdGU6DQo+IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+IHdyaXRlczoNCj4gDQo+
ID4gT24gVHVlLCAyMDIzLTA1LTAyIGF0IDExOjMyICswMjAwLCBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXMgd3JvdGU6DQo+ID4gPiAhISBFeHRlcm5hbCBFbWFpbA0KPiA+ID4gDQo+ID4gPiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+IHdyaXRlczoNCj4gPiA+IA0KPiA+ID4gPiBPbiBN
b24sIEp1bCAxMSwgMjAyMiBhdCAxMTozMjozOVBNIC0wNDAwLCBaYWNrIFJ1c2luIHdyb3RlOg0K
PiA+ID4gPiA+IEZyb206IFphY2sgUnVzaW4gPHphY2tyQHZtd2FyZS5jb20+DQo+ID4gPiA+ID4g
DQo+ID4gPiA+ID4gQ3Vyc29yIHBsYW5lcyBvbiB2aXJ0dWFsaXplZCBkcml2ZXJzIGhhdmUgc3Bl
Y2lhbCBtZWFuaW5nIGFuZCByZXF1aXJlDQo+ID4gPiA+ID4gdGhhdCB0aGUgY2xpZW50cyBoYW5k
bGUgdGhlbSBpbiBzcGVjaWZpYyB3YXlzLCBlLmcuIHRoZSBjdXJzb3IgcGxhbmUNCj4gPiA+ID4g
PiBzaG91bGQgcmVhY3QgdG8gdGhlIG1vdXNlIG1vdmVtZW50IHRoZSB3YXkgYSBtb3VzZSBjdXJz
b3Igd291bGQgYmUNCj4gPiA+ID4gPiBleHBlY3RlZCB0byBhbmQgdGhlIGNsaWVudCBpcyByZXF1
aXJlZCB0byBzZXQgaG90c3BvdCBwcm9wZXJ0aWVzIG9uIGl0DQo+ID4gPiA+ID4gaW4gb3JkZXIg
Zm9yIHRoZSBtb3VzZSBldmVudHMgdG8gYmUgcm91dGVkIGNvcnJlY3RseS4NCj4gPiA+ID4gPiAN
Cj4gPiA+ID4gPiBUaGlzIGJyZWFrcyB0aGUgY29udHJhY3QgYXMgc3BlY2lmaWVkIGJ5IHRoZSAi
dW5pdmVyc2FsIHBsYW5lcyIuIEZpeCBpdA0KPiA+ID4gPiA+IGJ5IGRpc2FibGluZyB0aGUgY3Vy
c29yIHBsYW5lcyBvbiB2aXJ0dWFsaXplZCBkcml2ZXJzIHdoaWxlIGFkZGluZw0KPiA+ID4gPiA+
IGEgZm91bmRhdGlvbiBvbiB0b3Agb2Ygd2hpY2ggaXQncyBwb3NzaWJsZSB0byBzcGVjaWFsIGNh
c2UgbW91c2UgY3Vyc29yDQo+ID4gPiA+ID4gcGxhbmVzIGZvciBjbGllbnRzIHRoYXQgd2FudCBp
dC4NCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBEaXNhYmxpbmcgdGhlIGN1cnNvciBwbGFuZXMgbWFr
ZXMgc29tZSBrbXMgY29tcG9zaXRvcnMgd2hpY2ggd2VyZSBicm9rZW4sDQo+ID4gPiA+ID4gZS5n
LiBXZXN0b24sIGZhbGxiYWNrIHRvIHNvZnR3YXJlIGN1cnNvciB3aGljaCB3b3JrcyBmaW5lIG9y
IGF0IGxlYXN0DQo+ID4gPiA+ID4gYmV0dGVyIHRoYW4gY3VycmVudGx5IHdoaWxlIGhhdmluZyBu
byBlZmZlY3Qgb24gb3RoZXJzLCBlLmcuIGdub21lLXNoZWxsDQo+ID4gPiA+ID4gb3Iga3dpbiwg
d2hpY2ggcHV0IHZpcnR1YWxpemVkIGRyaXZlcnMgb24gYSBkZW55LWxpc3Qgd2hlbiBydW5uaW5n
IGluDQo+ID4gPiA+ID4gYXRvbWljIGNvbnRleHQgdG8gbWFrZSB0aGVtIGZhbGxiYWNrIHRvIGxl
Z2FjeSBrbXMgYW5kIGF2b2lkIHRoaXMgaXNzdWUuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4NCj4gPiA+ID4gPiBGaXhl
czogNjgxZTdlYzczMDQ0ICgiZHJtOiBBbGxvdyB1c2Vyc3BhY2UgdG8gYXNrIGZvciB1bml2ZXJz
YWwgcGxhbmUgbGlzdA0KPiA+ID4gPiA+ICh2MikiKQ0KPiA+ID4gDQo+ID4gPiBbLi4uXQ0KPiA+
ID4gDQo+ID4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaCBiL2luY2x1
ZGUvZHJtL2RybV9kcnYuaA0KPiA+ID4gPiA+IGluZGV4IGY2MTU5YWNiODg1Ni4uYzRjZDdmYzM1
MGQ5IDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPiA+ID4g
PiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9kcnYuaA0KPiA+ID4gPiA+IEBAIC05NCw2ICs5NCwx
NiBAQCBlbnVtIGRybV9kcml2ZXJfZmVhdHVyZSB7DQo+ID4gPiA+ID4gwqDCoMKgwqDCoCAqIHN5
bmNocm9uaXphdGlvbiBvZiBjb21tYW5kIHN1Ym1pc3Npb24uDQo+ID4gPiA+ID4gwqDCoMKgwqDC
oCAqLw0KPiA+ID4gPiA+IMKgwqDCoMKgIERSSVZFUl9TWU5DT0JKX1RJTUVMSU5FwqDCoMKgwqDC
oMKgwqDCoCA9IEJJVCg2KSwNCj4gPiA+ID4gPiArwqDCoMKgIC8qKg0KPiA+ID4gPiA+ICvCoMKg
wqDCoCAqIEBEUklWRVJfVklSVFVBTDoNCj4gPiA+ID4gPiArwqDCoMKgwqAgKg0KPiA+ID4gPiA+
ICvCoMKgwqDCoCAqIERyaXZlciBpcyBydW5uaW5nIG9uIHRvcCBvZiB2aXJ0dWFsIGhhcmR3YXJl
LiBUaGUgbW9zdCBzaWduaWZpY2FudA0KPiA+ID4gPiA+ICvCoMKgwqDCoCAqIGltcGxpY2F0aW9u
IG9mIHRoaXMgaXMgYSByZXF1aXJlbWVudCBvZiBzcGVjaWFsIGhhbmRsaW5nIG9mIHRoZQ0KPiA+
ID4gPiA+ICvCoMKgwqDCoCAqIGN1cnNvciBwbGFuZSAoZS5nLiBjdXJzb3IgcGxhbmUgaGFzIHRv
IGFjdHVhbGx5IHRyYWNrIHRoZSBtb3VzZQ0KPiA+ID4gPiA+ICvCoMKgwqDCoCAqIGN1cnNvciBh
bmQgdGhlIGNsaWVudHMgYXJlIHJlcXVpcmVkIHRvIHNldCBob3RzcG90IGluIG9yZGVyIGZvcg0K
PiA+ID4gPiA+ICvCoMKgwqDCoCAqIHRoZSBjdXJzb3IgcGxhbmVzIHRvIHdvcmsgY29ycmVjdGx5
KS4NCj4gPiA+ID4gPiArwqDCoMKgwqAgKi8NCj4gPiA+ID4gPiArwqDCoMKgIERSSVZFUl9WSVJU
VUFMwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9IEJJVCg3KSwNCj4gPiA+ID4g
DQo+ID4gPiA+IEkgdGhpbmsgdGhlIG5hbWluZyBoZXJlIGlzIHVuZm9ydHVuYXRlLCBiZWNhdXNl
IHBlb3BsZSB3aWxsIHZvbmRlciB3aHkNCj4gPiA+ID4gZS5nLiB2a21zIGRvZXNuJ3Qgc2V0IHRo
aXMsIGFuZCB0aGVuIGFkZCBpdCwgYW5kIGNvbmZ1c2Ugc3R1ZmYgY29tcGxldGVseS4NCj4gPiA+
ID4gDQo+ID4gPiA+IEFsc28gaXQgZmVlbHMgYSBiaXQgd3JvbmcgdG8gcHV0IHRoaXMgb250byB0
aGUgZHJpdmVyLCB3aGVuIHJlYWxseSBpdCdzIGENCj4gPiA+ID4gY3Vyc29yIGZsYWcuIEkgZ3Vl
c3MgeW91IGNhbiBtYWtlIGl0IHNvbWUga2luZCBvZiBmbGFnIGluIHRoZSBkcm1fcGxhbmUNCj4g
PiA+ID4gc3RydWN0dXJlLCBvciBhIG5ldyBwbGFuZSB0eXBlLCBidXQgcHV0dGluZyBpdCB0aGVy
ZSBpbnN0ZWFkIG9mIGludG8gdGhlDQo+ID4gPiA+ICJyYW5kb20gcGlsZSBvZiBtaWRsYXllci1t
aXN0YWtlIGRyaXZlciBmbGFncyIgd291bGQgYmUgYSBsb3QgYmV0dGVyLg0KPiA+ID4gPiANCj4g
PiA+ID4gT3RoZXJ3aXNlIEkgdGhpbmsgdGhlIHNlcmllcyBsb29rcyByb3VnaGx5IGhvdyBJJ2Qg
ZXhwZWN0IGl0IHRvIGxvb2suDQo+ID4gPiA+IC1EYW5pZWwNCj4gPiA+ID4gDQo+ID4gPiANCj4g
PiA+IEFGQUlDVCB0aGlzIGlzIHRoZSBvbmx5IHJlbWFpbmluZyB0aGluZyB0byBiZSBhZGRyZXNz
ZWQgZm9yIHRoaXMgc2VyaWVzID8NCj4gPiANCj4gPiBObywgdGhlcmUgd2FzIG1vcmUuIHRiaCBJ
IGhhdmVuJ3QgaGFkIHRoZSB0aW1lIHRvIHRoaW5rIGFib3V0IHdoZXRoZXIgdGhlIGFib3ZlDQo+
ID4gbWFrZXMgc2Vuc2UgdG8gbWUsIGUuZy4gSSdtIG5vdCBzdXJlIGlmIGhhdmluZyB2aXJ0dWFs
aXplZCBkcml2ZXJzIGV4cG9zZQ0KPiA+ICJzdXBwb3J0DQo+ID4gdW5pdmVyc2FsIHBsYW5lcyIg
YW5kIGFkZGluZyBhbm90aGVyIHBsYW5lIHdoaWNoIGlzIG5vdCB1bml2ZXJzYWwgKHRoZSBvbmx5
DQo+ID4gInVuaXZlcnNhbCIgcGxhbmUgb24gdGhlbSBiZWluZyB0aGUgZGVmYXVsdCBvbmUpIG1h
a2VzIG1vcmUgc2Vuc2UgdGhhbiBhIGZsYWcNCj4gPiB0aGF0DQo+ID4gc2F5cyAidGhpcyBkcml2
ZXIgcmVxdWlyZXMgYSBjdXJzb3IgaW4gdGhlIGN1cnNvciBwbGFuZSIuIFRoZXJlJ3MgY2VydGFp
bmx5IGENCj4gPiBodWdlDQo+ID4gZGlmZmVyZW5jZSBpbiBob3cgdXNlcnNwYWNlIHdvdWxkIGJl
IHJlcXVpcmVkIHRvIGhhbmRsZSBpdCBhbmQgaXQncyB3YXkgdWdsaWVyDQo+ID4gd2l0aA0KPiA+
IHR3byBkaWZmZXJlbnQgY3Vyc29yIHBsYW5lcy4gaS5lLiB0aGVyZSdzIGEgbG90IG9mIHdheXMg
aW4gd2hpY2ggdGhpcyBjb3VsZCBiZQ0KPiA+IGNsZWFuZXIgaW4gdGhlIGtlcm5lbCBidXQgdGhl
eSBhbGwgcmVxdWlyZSBzaWduaWZpY2FudCBjaGFuZ2VzIHRvIHVzZXJzcGFjZSwNCj4gPiB0aGF0
IGdvDQo+ID4gd2F5IGJleW9uZCAiYXR0YWNoIGhvdHNwb3QgaW5mbyB0byB0aGlzIHBsYW5lIi4g
SSdkIGxpa2UgdG8gYXZvaWQgYXBwcm9hY2hlcw0KPiA+IHRoYXQNCj4gPiBtZWFuIHJ1bm5pbmcg
d2l0aCBhdG9taWMga21zIHJlcXVpcmVzIGNvbXBsZXRlbHkgc2VwYXJhdGUgcGF0aHMgZm9yIHZp
cnR1YWxpemVkDQo+ID4gZHJpdmVycyBiZWNhdXNlIG5vIG9uZSB3aWxsIGV2ZXIgc3VwcG9ydCBh
bmQgbWFpbnRhaW4gaXQuDQo+ID4gDQo+ID4gSXQncyBub3QgYSB0cml2aWFsIHRoaW5nIGJlY2F1
c2UgaXQncyBmdW5kYW1lbnRhbGx5IGhhcmQgdG8gdW50YW5nbGUgdGhlIGZhY3QNCj4gPiB0aGUN
Cj4gPiB2aXJ0dWFsaXplZCBkcml2ZXJzIGhhdmUgYmVlbiBhZHZlcnRpc2luZyB1bml2ZXJzYWwg
cGxhbmUgc3VwcG9ydCB3aXRob3V0IGV2ZXINCj4gPiBzdXBwb3J0aW5nIHVuaXZlcnNhbCBwbGFu
ZXMuIEVzcGVjaWFsbHkgYmVjYXVzZSBtb3N0IG5ldyB1c2Vyc3BhY2UgaW4gZ2VuZXJhbA0KPiA+
IGNoZWNrcw0KPiA+IGZvciAidW5pdmVyc2FsIHBsYW5lcyIgdG8gZXhwb3NlIGF0b21pYyBrbXMg
cGF0aHMuDQo+ID4gDQo+IA0KPiBBZnRlciBzb21lIGRpc2N1c3Npb24gb24gdGhlICNkcmktZGV2
ZWwsIHlvdXIgYXBwcm9hY2ggbWFrZXMgc2Vuc2UgYW5kIHRoZQ0KPiBvbmx5IGNvbnRlbnRpb24g
cG9pbnQgaXMgdGhlIG5hbWUgb2YgdGhlIGRyaXZlciBmZWF0dXJlIGZsYWcgbmFtZS4gVGhlIG9u
ZQ0KPiB5b3UgYXJlIHVzaW5nIChEUklWRVJfVklSVFVBTCkgc2VlbXMgdG8gYmUgdG9vIGJyb2Fk
IGFuZCBnZW5lcmljICh0aGUgZmFjdA0KPiB0aGF0IHZrbXMgd29uJ3Qgc2V0IGFuZCBpcyBhIHZp
cnR1YWwgZHJpdmVyIGFzIHdlbGwsIGlzIGEgZ29vZCBleGFtcGxlKS4NCj4gDQo+IE1heWJlIHNv
bWV0aGluZyBsaWtlIERSSVZFUl9DVVJTT1JfSE9UU1BPVCBvciBEUklWRVJfQ1VSU09SX0NPTU1B
TkRFRVJJTkcNCj4gd291bGQgYmUgbW9yZSBhY2N1cmF0ZSBhbmQgc2VsZiBleHBsYW5hdG9yeSA/
DQoNClN1cmUsIG9yIGV2ZW4gbW9yZSB2ZXJib3NlIERSSVZFUl9ORUVEU19DVVJTT1JfUExBTkVf
SE9UU1BPVCwgYnV0IGl0IHNvdW5kcyBsaWtlDQpQZWtrYSBkb2Vzbid0IGFncmVlIHdpdGggdGhp
cyBhcHByb2FjaC4gQXMgSSBtZW50aW9uZWQgaW4gbXkgcmVzcG9uc2UgdG8gaGltLCBJJ2QgYmUN
CmhhcHB5IHdpdGggYW55IGFwcHJvYWNoIHRoYXQgZ2V0cyBwYXJhdmlydHVhbGl6ZWQgZHJpdmVy
cyB3b3JraW5nIHdpdGggYXRvbWljIGttcywNCmJ1dCBhdG0gSSBkb24ndCBoYXZlIGVub3VnaCB0
aW1lIHRvIGJlIGNyZWF0aW5nIGEgbmV3IGtlcm5lbCBzdWJzeXN0ZW0gb3IgYSBuZXcgc2V0DQpv
ZiB1YXBpJ3MgZm9yIHBhcmF2aXJ0dWFsaXplZCBkcml2ZXJzIGFuZCB0aGVuIHBvcnRpbmcgbXV0
dGVyL2t3aW4gdG8gdGhvc2UuDQoNCnoNCg0K
