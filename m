Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C787A9240
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC9F10E577;
	Thu, 21 Sep 2023 07:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2089.outbound.protection.outlook.com [40.107.102.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C06E10E566;
 Wed, 20 Sep 2023 21:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vxak7XBaoRRJgED17PY5Zfo8eVm1FxUBeyJ27M1o+G3KuXu3PKtcGj7520Z1mtc+Gdjnj/dN9MfQJ3EjmsYWwTw7obu6NXiT6Z5TYPe/f2TePtyzhlUwhOWDKwbrgh5gB27HGrz0dZ4EvVsr+Dt8tn33F2mtKfZIzboxjPKFKWVWeUqUW+icJCDCs2d+Shrd7o6mqbJ2Hwk6b7CVIzdsDvnvbCRFdZsuB9iJ/VQUMmJj6ZSrTQ9cEWpGmI7frulgHq4JBBkVmKrnJiyPK75ozE2XMj2M5KD/VaYV96u7Fr+ejNS8bJ+XZDo2JtZpGVXtFZSTJ1HAT9JKmHI+kCEIOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ur9S6RR+YAy1XTgV46iPAD7vrW5GSvYn7lcg9oAPNp0=;
 b=D89BgKe41LTMR/t/t5xFQ6Q8Z/8MSWotCA69X8FUptO2x6wdmGh7uZj45pwxsx2Bwk6R/ZMTgXQew7VBV1wCVxnRgi1YsCqMh6670ZckgE/A/Jd92kx+QGGBgneRL++Xy03lmtokAfAlTFYZ1yKJWDdPSlNNH16W8Gt4jo0T/cU7YHTWFAcPeiB2ysgNSQeJIK6kRDYXdS8CUbKskX+a7DER4Wj7jfWLlh1jUb8kBMJlcUp32eIqdDKmtJqSfE9FLfGokFaHk3xK2p0cjJgPEPqqBrbqJ0hJvVIYKAX5l5EPgCAkZwQNRvDA2ShrEjIOyjRcExOkBwodj3ZJrX2Epg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur9S6RR+YAy1XTgV46iPAD7vrW5GSvYn7lcg9oAPNp0=;
 b=QWKGhURjL2ug/vcnOdx6nHHboOMTmJwzCvheX3uvWbj6lgvwi2ObKzgyXhMVJviZDDWH3r4nis68gm48BirXMgvViMdE9Ncw3i9+DpKTMw++JF8pQQXRjluRR4TqvhvO9Vrie7k/a30sOQn7fGnNgbhVJWXDgrlkFwemk1zQtEFvYWP9fcR9zQHWOhpVUxCpxBurGthEYRO7CUgoFDiVAGwdJ8vOfRORXds5cqauaf24isBSyNFHnmhYTHbPUQFy12pUlFYZ7eNRyAZw5kUJnLsEWAkhIIqi1O5Va5Ec6+RbFYFBpcDTDjK/sHfGe3dCB0FCcepKgNbv0zgQfz5cPg==
Received: from DS0PR12MB6391.namprd12.prod.outlook.com (2603:10b6:8:cd::16) by
 BL3PR12MB6595.namprd12.prod.outlook.com (2603:10b6:208:38e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.23; Wed, 20 Sep
 2023 21:33:23 +0000
Received: from DS0PR12MB6391.namprd12.prod.outlook.com
 ([fe80::76bc:2a16:6e0f:72b6]) by DS0PR12MB6391.namprd12.prod.outlook.com
 ([fe80::76bc:2a16:6e0f:72b6%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 21:33:23 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [Nouveau] [PATCH v3 42/44] drm/nouveau/kms/nv50-: create
 connectors based on nvkm info
Thread-Topic: [Nouveau] [PATCH v3 42/44] drm/nouveau/kms/nv50-: create
 connectors based on nvkm info
Thread-Index: AQHZ60W8NkUooQcCRkGdrL5uORvQJLAkPZ0A
Date: Wed, 20 Sep 2023 21:33:23 +0000
Message-ID: <cf9b3cd8654c25c13d5f5130c0753d5480144a43.camel@nvidia.com>
References: <20230919220442.202488-1-lyude@redhat.com>
 <20230919220442.202488-43-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-43-lyude@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6391:EE_|BL3PR12MB6595:EE_
x-ms-office365-filtering-correlation-id: 88b3f7ed-5e3f-4e56-82ea-08dbba2137bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v+BHmQ4Ew7yx+zFUbNUnVDcRcBxqUKuzcb539GyLv9MrpPE+MeqEzDTArwm7fcmctYm0J1CA/aWeKfIESYuvdU74/mOiMrN8QhVdTtDH9T8DoPMdjnKgexQYL73banwDQtDb20U/oLJPUFlIu51zOL3KSkHObU/E6l5RQ0HwGlcenbQk05o0dvLq3furotbXExcp2gkl/peDlFzgiH0v9y+fnhKnc3DvX95BNDyNXAnvZFEZbK4o0H12YY0M9fbVGuaRJEDE3looDaziGA/5wWOFfGLkFfx2I4IsQ3X/OnE9x+WaobGpKEBE3VCYdjqQW/Rtpy0ewVXIcobQwI59JIeCyg51r+/0AY/02YIXkFiL215jwWo/7LgADBaK2PGVrNp6SpxglUFwdwM0tfsK1UV8T4eAYoIWNtktrTiDvCU9IjFW6h8dIjtHhQ9bOE7EeCuzpiZeoAu9iHSaljXAD7VP0jSux0uOhurENmPDx+81wZa3XobU2HFUoWowHDJ+Xxk5twRlzN21f8Wh81tz6qPnLQHEbNt/B4StqFEsCEyRU2oTqBacZYLhBuPCEfm/BHEB11VZM8jR2Nb9fPRfJVQpDuebrMMFuhHEqp50tE4OB+qP51MdpFivpDYpskN+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6391.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(396003)(39860400002)(186009)(451199024)(1800799009)(4326008)(71200400001)(478600001)(8936002)(26005)(6506007)(6486002)(316002)(2906002)(36756003)(2616005)(41300700001)(6512007)(91956017)(110136005)(86362001)(122000001)(8676002)(38100700002)(64756008)(5660300002)(76116006)(66946007)(66476007)(66446008)(38070700005)(66556008)(54906003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFRianNvZnBlblNMRDR2ajA0M1NWWkpVRGFrUkFickQrYWdHT0ZKVmptbTJR?=
 =?utf-8?B?TzFUVHJtVG10Z2prRFhIOGM1MlhXWVdWOVEwTnU3cW5ZdE04dmdYUnZvS3ZZ?=
 =?utf-8?B?N3g1d1duU0g4bER2MTMxZHZON1JydzQyUFhUck5VMjNyL3NVOWFESzBKTnov?=
 =?utf-8?B?U1ZZYlBJdExsZFB2TU1lc3JWVCtTbGRDNlFwZno3SzNWcDcvajRsdmFQU3JM?=
 =?utf-8?B?VFVWdnE0VWZuMTF0amM4Y3dGMmhPMFhnOGxhTyttL3VHL0VRSzA5K3lBcDlh?=
 =?utf-8?B?YW45WUg0aTdLVVdBbU11SVNKWUt3b1NPcjdpRk5acVVwZ3JCVXhKRzN5c1dk?=
 =?utf-8?B?a25PVzdKUnd5Rml2d0w0N2FpcE1KbGp3aHZQYXRsOWgwa1RxL3IvTi9YcUhp?=
 =?utf-8?B?M3NDRjNneDd1ZWo2T0pUQnZoQTlwbTN5blBGdkV6NzJML1JJOVBxSjh0bzNG?=
 =?utf-8?B?RUx1eUNWOXlENWhWVDB3S3NLdzNRU0MrYXVoSDhSN245ME9LTndCZzZselll?=
 =?utf-8?B?cHQzdkhIUDNKY2o5NllNamhlZlBQcmdmOCtaVGxMZkF0MWNZTjBaNXp2TW5L?=
 =?utf-8?B?SVcvRHlJb3d3SUpnbVIwaTkyNWhzQjJiVHNIams3S2pRRlRVNnVsWUMvSGxj?=
 =?utf-8?B?cjZqa3RMM0RualhEZUU3dmJsSzh3Yk9Bd0JKOCtVTS90RFRJWEhiaGZTejd0?=
 =?utf-8?B?bm96bXNnMVRhSi9NTHRORlcxL3phbHJPQ3NTMlBXRUorT2JkV2w2eUk4ZHBK?=
 =?utf-8?B?SXhRZWVIKy9XN3RNRGNUcmZHODAveGJjdEtTRitSdm5lQU1SeUVMckE3Q0Rq?=
 =?utf-8?B?cW9Tamw1WXIzTXVYcUNCeUdkSnpqcDlhWVJUTVd2UFEwM2Z5c0xTV05UR1Bh?=
 =?utf-8?B?b2ptQ0dlSHFTWncwOGFBc3ZSWWJoeDdUdjNzSEJhN0pQa0JlR3RYWThUK09w?=
 =?utf-8?B?MHpuM04xdjl4S0FmVU50ZWh4N1RkZ0hJNU92QUsyQTRQZlZ3b2NkeUJkUWZR?=
 =?utf-8?B?VEhGT3YzNVIra2VIU25BNHVkTENxOUx6dVFpd1VXd2o3WmtqUDNrYy9BdGVt?=
 =?utf-8?B?em1ZZXFTVU9wL1BMc0xIRVFjNnFEdVY5bUxCMXlraUZZeWE2Nlh2a1ZranAr?=
 =?utf-8?B?bS9QUjliNFFDYTJ0RDVxc3h3T3RFWW9HcjN4bGg2NndrSVRFTk85TFkxWmN5?=
 =?utf-8?B?QnVtQmZBeEYxVDVQbGJxRU5QN0tzZENTdE43TWoxRVhTZVFaeXZEQkhjSnlK?=
 =?utf-8?B?QjhUK3l3czNLaEx4dWlER2VXZ1g5bGJZMzg5RlNjaHpqZ1dIdUR3a0VGQzg2?=
 =?utf-8?B?U3hDYU1RcExUUjV4ZWZ5Nm5hVHk5Z09Ha05xdEllcWdwdWlZNDJUelJEdWtB?=
 =?utf-8?B?U1IvRzNVc3BvNW52K0tURmRwc0dNVW82cklaZGdLc3d5OHZyeTVtdjd1ZWh6?=
 =?utf-8?B?d1hjVmtHalpwS1JpNEVpLzVGRGJmaDczbFU3OVcvTUdPeFArS010ODZOazh6?=
 =?utf-8?B?YkljQ1hHRHJ0dEtRQkNmclJBRFRJZEpiNFBMU3RrZGl5eGJScjBpZDlRcElD?=
 =?utf-8?B?ZGNGc0FDV0hRRTNzSCtHcE9ubnRWTXZtVVRjajB3ZE5qczlRdDI3cFV6dHpK?=
 =?utf-8?B?aUtUK0JrWUVYbEczNnJQelQ3eFc4YlBmUmpKWFBVYXV2OXk3c1h4WGtKNzFt?=
 =?utf-8?B?dEE0ZTFTSGQrTE5PRDhCdFFpSURSZmozdXcycDlzdUlNUnpZd1Y5SlRMNXRh?=
 =?utf-8?B?djNlaWlPTzJueFNLeThIbzNudjlMT1VRYlFFQ1RWajdSQ2YzdExzRktRbGM0?=
 =?utf-8?B?SHdVemtaazRkYW9DaUlCNlZXbTBScTlFa0I5akQ0S0ZuczVKbG9icU5FSzdD?=
 =?utf-8?B?VlkrZlBRMytqV0FnTXVuM0M5MWhEK09SNHlMam5xaXUweXBwb0pHaDExVVNQ?=
 =?utf-8?B?UFNPS09LRXVvMWpVZFhlZ3l3U28xL0ZFRm9DK1BGUGRGeDFUNlFFMTAybG5S?=
 =?utf-8?B?VG1XMzZwUERmQVBqcDUvdjkvbnhqSGFBemJVV0FaK3BNcWFYcnRRbmowdlJ4?=
 =?utf-8?B?Z2JGZEt4LzN5cGowVThJUnI5ZEtJZFNmMmo0UG9rZGkxZGZmTVBOWlhvSW1K?=
 =?utf-8?Q?lfxrFyLttWKixj/TEnIeySBSR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <79EC1A8BB4F4634681FC25E64A73C7E1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6391.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b3f7ed-5e3f-4e56-82ea-08dbba2137bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 21:33:23.4795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/PBgCbENxFoR/ADbovKcGDRyVhP/JA7h1zQb2WZkL73iDhQRhcTvbtFEbr8dSROYeTLk/Os/Erq4tiO6GEcQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6595
X-Mailman-Approved-At: Thu, 21 Sep 2023 07:45:12 +0000
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Wayne.Lin@amd.com" <Wayne.Lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTE5IGF0IDE3OjU2IC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTlZJRl9DT05OX1ZH
QSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE5WSUZf
Q09OTl9UViwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oE5WSUZfQ09OTl9EVklfSSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoE5WSUZfQ09OTl9EVklfRCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoE5WSUZfQ09OTl9MVkRTLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTlZJRl9DT05OX0xWRFNfU1BXRywKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoE5WSUZfQ09OTl9IRE1JLAo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTlZJRl9DT05O
X0RQLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgTlZJ
Rl9DT05OX0VEUCwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfSB0eXBlOwo+ICvC
oMKgwqDCoMKgwqDCoH0gaW5mbzsKPiDCoH07Cj4gwqAKPiDCoGludCBudmlmX2Nvbm5fY3Rvcihz
dHJ1Y3QgbnZpZl9kaXNwICosIGNvbnN0IGNoYXIgKm5hbWUsIGludCBpZCwgc3RydWN0Cj4gbnZp
Zl9jb25uICopOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9pbmNsdWRl
L252aWYvaWYwMDExLmgKPiBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZpZi9p
ZjAwMTEuaAo+IGluZGV4IDBjMjUyODhhNWE3ODkuLjNlZDBkZGQ3NWJkOGYgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvaW5jbHVkZS9udmlmL2lmMDAxMS5oCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvaW5jbHVkZS9udmlmL2lmMDAxMS5oCj4gQEAgLTcsNiAr
NywxNiBAQCB1bmlvbiBudmlmX2Nvbm5fYXJncyB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBfX3U4IHZlcnNpb247Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBf
X3U4IGlkO8KgwqDCoMKgwqDCoMKgwqAvKiBEQ0IgY29ubmVjdG9yIHRhYmxlIGluZGV4LiAqLwo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX191OCBwYWQwMls2XTsKPiArI2RlZmlu
ZSBOVklGX0NPTk5fVjBfVkdBwqDCoMKgwqDCoMKgIDB4MDAKPiArI2RlZmluZSBOVklGX0NPTk5f
VjBfVFbCoMKgwqDCoMKgwqDCoCAweDAxCj4gKyNkZWZpbmUgTlZJRl9DT05OX1YwX0RWSV9JwqDC
oMKgwqAgMHgwMgo+ICsjZGVmaW5lIE5WSUZfQ09OTl9WMF9EVklfRMKgwqDCoMKgIDB4MDMKPiAr
I2RlZmluZSBOVklGX0NPTk5fVjBfTFZEU8KgwqDCoMKgwqAgMHgwNAo+ICsjZGVmaW5lIE5WSUZf
Q09OTl9WMF9MVkRTX1NQV0cgMHgwNQo+ICsjZGVmaW5lIE5WSUZfQ09OTl9WMF9IRE1JwqDCoMKg
wqDCoCAweDA2Cj4gKyNkZWZpbmUgTlZJRl9DT05OX1YwX0RQwqDCoMKgwqDCoMKgwqAgMHgwNwo+
ICsjZGVmaW5lIE5WSUZfQ09OTl9WMF9FRFDCoMKgwqDCoMKgwqAgMHgwOAoKV291bGRuJ3QgaXQg
YmUgc2ltcGxlciB0byBqdXN0IGVuc3VyZSB0aGF0IHRoZSBlbnVtcyBoYXZlIHRoZSBzYW1lIHZh
bHVlcyBhcwp0aGUgbWFjcm9zLCBzbyB0aGF0IHdlIGRvbid0IG5lZWQgdGhlIHN3aXRjaCBzdGF0
ZW1lbnQgaW4gbnZpZl9jb25uX2N0b3IoKT8K
