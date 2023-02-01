Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A6D686D6D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 18:53:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9068110E187;
	Wed,  1 Feb 2023 17:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR02CU005-vft-obe.outbound.protection.outlook.com
 (mail-eastusazon11012009.outbound.protection.outlook.com [52.101.53.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326AB10E187
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 17:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0sujRfBtR9T8jQ2bPCDgz7H+9NvFn9WfqlmZihUW8AWZP5OTfkDGhYoaTqm7LJJJekEs0Zh8EQgxANQ2bqa6fhSb3aQ2Htx+I532wMh7wTw4ptKavVsiFNUuYguHrom8cK+SpRuF3TixbM2BwR8rwhhGkXfqBrG8KlbvsykZNSMYSZz75IsrIZVNt/ccmSgRXGVjRaP9gE5X8Mh2AY0BbypjOcOPBX0Rp3oG+AFp0jgeD0rUGVSSjIklDCTohmBua0QKi+7zGrpaMng6mRstoKW5Tx1q1ot76f8SVihXEGVAQo856HR9qcrADBUwOXuSrT8gJw5BMLPkWLfpVyjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yz38WwkwU0GRBo36sySQt5znDxaYeAZ/Wq5R2gb/oU=;
 b=izNbDxgvowPc9gRYTWss7bbvpm4a9+/Wx5WL3G4gSQ/uyR8CYSc4q89BuYObKalPLod8XmHjhrJu83C6hljeWpc9a9pt594E0ksFtefkr8Uyu4sw0JKSb8qFEO7b/i+PxprWiDUADkj/OTB68e5F/iD3r156L5ig2kz+BtY5pM2mXOHvBnSfCslYGPnSYv4tXIQNOF13jZLdKDiQY1xgDzTjulidSbogFyCGS/TNDqB9h/Id1siXOwHAI+eHHGCP1TvTYCakjBNecNYxRBxEyaYz/HimwSpD741xAOwedvHhQHxz82ajTXk1IPVnc17JM/QO4sfQmb9yrIn0N7Fj8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8yz38WwkwU0GRBo36sySQt5znDxaYeAZ/Wq5R2gb/oU=;
 b=WaMrXTsBkelxFwDeud2Ux3H4hhif8pz/klPkEYol9xk/0Fw9+r9SpHyutCb7eRVD2XGJr0bFIN3d8LFhTe0AXmupo9SY2neanYDF6TAGAEZ2dBBbJfU8Y+/Y3RlH4XckFMoFY8to77fFFXp8S810lc5kJo4iAaNgTUkAbTEjnhg=
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 (2603:10b6:610:155::10) by SN6PR05MB4448.namprd05.prod.outlook.com
 (2603:10b6:805:33::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Wed, 1 Feb
 2023 17:53:03 +0000
Received: from CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7]) by CH3PR05MB10206.namprd05.prod.outlook.com
 ([fe80::ad2d:cb08:253b:26e7%8]) with mapi id 15.20.6043.036; Wed, 1 Feb 2023
 17:53:03 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/8] drm/vmwgfx: Refactor the buffer object code
Thread-Topic: [PATCH v2 0/8] drm/vmwgfx: Refactor the buffer object code
Thread-Index: AQHZNSUeMbrcfRi4vkiiSm0WVRLgKa646foAgAF3y4A=
Date: Wed, 1 Feb 2023 17:53:03 +0000
Message-ID: <e0bf83382094ff9314a03afc30ae5f441f72d26f.camel@vmware.com>
References: <20230131033542.953249-1-zack@kde.org>
 <446db473-ddb2-623c-c0d0-4a1bbd501aa9@suse.de>
In-Reply-To: <446db473-ddb2-623c-c0d0-4a1bbd501aa9@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.2-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR05MB10206:EE_|SN6PR05MB4448:EE_
x-ms-office365-filtering-correlation-id: 9351a87a-09cd-4d59-8161-08db047d2ac9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1AKfXSftChy/Ffb7c6agSC644dw6KNGpe88lfz/8pYq9pgAGdbB1vCGE3D/x2gP3mt9tiNw1V/QcTRwXVs3zQTW+VAvVvez58ljyy5pn3YnXwEjAzFsEOgK61kXlfS+mwRBfacJ9bDVupTKMk+i6Sjoc3sSjrv7yRsBOqzWk67DIKEuzyrJtQczno64A3PIl9FiC6RE7zYi4riAgrvT4UOdb95UlRW30JWGrVFRZWHXntA5dcSnZjzk2CP1wNYfO1ItUOPL3AwWjUKHLuDdYdUc76pwCXkJ/5MVWGV1lbVS2MARo+Ta+WPuHKYHkTgo1GAAd9H7r/sHfvA+nX02Yk77E+JinpgXxZmlOm7oWxAoPtTZUosqliQ3VKXiAAPIabsQdRwUofYh7mF3/UmqakYckYI0CKB1Y3u2I+u6fELNhnzA4gHmvGnS/RRAxB62XtgyDG3VHyFk1v18JxgaccABgdz1dOaCI+bYgXBn0HWncOFlPtYPF7pMZA4ZJNrFXKtPCnEpLfjNECV1Z2SOIwZf9kdyiYJMok8DF2WYUy58ludFELdgzrUwx7f4QWT3c5ZiTeBCMN0avaVOCHVXfKnm9j+cRLcc9gLbjawj78+fFZVrL3WfBbnICM0xx/7mLeuYxuBiC6Ufv4Lbz0RDcKCzt1qk0FcRo+xPSvymvpAIy04+nt1aTx1IzMQKkVL4dMhUZpIjb3hTTHkq183XwPw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR05MB10206.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199018)(5660300002)(54906003)(110136005)(64756008)(41300700001)(316002)(91956017)(2906002)(71200400001)(8936002)(76116006)(6486002)(66476007)(66946007)(6506007)(186003)(66446008)(26005)(4326008)(478600001)(6512007)(2616005)(66556008)(107886003)(8676002)(38100700002)(122000001)(4744005)(36756003)(86362001)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzRCc3FvYVhpbjNWRGtJNHIxQzdFN0hGYkliUXQ2NW5xY2w5WE82QU5BZndZ?=
 =?utf-8?B?NWx0ZGlYOTM2OWQ5cEhCUTN2QzFlNWptajdlbHVyT3dBZ1hjU0NPbVo1MVFU?=
 =?utf-8?B?aU5VR1d3R2gwNmtlK3FFWWExcXJtbkZmdzhGVkVYSER4UUtxSWRRZGlGRGVj?=
 =?utf-8?B?VlRRaXh2N3FXc0NqNnRoajdEd05iOTlXMk1LbUVzKzJQUm1rNE1iUnFZeXFT?=
 =?utf-8?B?ODFTSWYwdCtmeC83VUV4VGtzc3pwTFRoV1RhOXl3RTZQNVR6R0RLTWkvSVc4?=
 =?utf-8?B?dmlRR0lXd2xxVWUzQ01QMU9sRWcwM0dvYmNVVSs4SXlaOFdlZ2hSeTU2aEdk?=
 =?utf-8?B?ZTRGRm55eTdJVHoyLzNWV0hBS0ZqdmVQQkVpai9jclJGa2VSdnRsQjY2NG9i?=
 =?utf-8?B?bGU0MGN5OWVSQVRnWnJpSE9FdmVZTVIySmZ4Y0JUd3ZUZE1HWkQ1bkxuT1lq?=
 =?utf-8?B?VVd0SW4zeHNWQWh1T01waHc2NjVXb2RCUVJCbEpDb2dPWW04eFVZZUNXNms2?=
 =?utf-8?B?MVRsazkzdTVQTzRIM0dVa3c3SWpEM2RvQW1vVFFlWjltVXpRa3djVDVIMk5D?=
 =?utf-8?B?SVF4dGtna3FtaVROblBlaXRNbDFuTkE5MEtaWnNGNy9WUEhPaVZuYlZTbTVJ?=
 =?utf-8?B?UW9yNWZiR0FnN2x4RnZlMEp0aERqOHR6WS9sL0dHbTZhM3lwd05xSXR4bEZh?=
 =?utf-8?B?My9xYTZhekVRMU9uQnltQy9OdEduc05RNXZoWXhLYTlScjZjc2J2M3hIdEJ3?=
 =?utf-8?B?R0o5Q2Q2RnYrN243VEFaRlozbGV2RGpTY3dyT3A1bXN2WmtkbGF3eWVlc0c2?=
 =?utf-8?B?a2QwRGZEYTcvU2VCUlZaaHNYaVFWb01xcFlSR1FrQnlIT2RVVWZEazNWb3Nn?=
 =?utf-8?B?UGhHaTBINUoyVzBJUFdGY0laSXNLNTF6a21sdXRVZWtydkVVVDY2dGluQmVT?=
 =?utf-8?B?emhEYWxINEd4R3F0S3Jnalp3L2RGVmJvZkZUYjA0OXRyV3B2RndtTGphODVM?=
 =?utf-8?B?di8rQXJqaDladUhYQXA3ZHdBQys0K01uUEdleUp6Q3JOc2FMeElaTEdNUVRI?=
 =?utf-8?B?U0tjWmU5RFhVMHErU1oxcWtvZzB2M2FkTUlKdEVrbk9hUThGREo1UHRuaXox?=
 =?utf-8?B?YW5wZ0tSRVkxei9FYVg4V1dTOVl3UXlCM3hKNFJSYXhkY3A5Vks3RlhHQ0VY?=
 =?utf-8?B?ZmJDZFd0Qk5wdER2MWpydk1TNnNkVEM0QW9Oak95TmxqT3lIUXB2UTd5andh?=
 =?utf-8?B?K1E2UWQ4bnlsQkkrZ2lBWVRTbm9nNHluYnAvRU1kaGdUSWZMUVAyTkcvTE9I?=
 =?utf-8?B?dDJsZ2pVZ1pkZ1l0YlU3eEJwam1wTzJUUUdLazFoWjZoSWhvcHpTelZBdkhW?=
 =?utf-8?B?QllZcWF1U0ViVHVTTGRjQ3pXWXJXMDB1RTBQZHRLajEyL3IwOUR4SUwwZHdU?=
 =?utf-8?B?NHFXNmJibFEvd25ORFVYS1U1N3hYeXY2eGxxTnZybGlBbUhrcWRBSUpaME1h?=
 =?utf-8?B?WEpxUmJPWkN3Mm81SFNUOTJXMThNcVNockJwemQ2d2Z2a3J1L3BYWVBBZGQr?=
 =?utf-8?B?ZzVYWWdRQUk5NlNSbkQ1ZkpRcU56eVJLODR3OEU2RmxsdnY4VzlDdDRRTWFL?=
 =?utf-8?B?WVZCMHFYRTJFa1lOVkEzaTB1UHhjRG5CRTg5RHpaNThvT0tCTEZWc3F2enpW?=
 =?utf-8?B?cCtzWnJaak5Ba1p2MzlzZ0pvSGtuYmNHeFVjOTg2a1lRS2kyUFNJeFQ1TkJw?=
 =?utf-8?B?MkNKbVZaL28vWkQ4Q3ByV05Mc1BHWGpYN096emtLNUpYenV0S1VpOHFvdmd5?=
 =?utf-8?B?Snprc2paeW95YkhPaWpoRVBwZ3lhRmFscmROQVE4TG1BUEJ2YWE0N0N4c3RV?=
 =?utf-8?B?cFlIcG56bE9yQW9keVR3NUF6RDlaRGFmL1U0ZFMydnJHZTYyL3ZsZnpWS2Fj?=
 =?utf-8?B?dENDU05yb3dIVFBsZ3dENk9wanc0MytpMzFPNis1ZkxaOHlFSlRIWXArcmNh?=
 =?utf-8?B?clM4aStidFo3ZG1uWWtBYzh5NDkwRmVqaFp4OFBLbEFNRjVVSGlDTk13Tm1s?=
 =?utf-8?B?QWJpVzlYZHJOY002NmFBZkdNcXNQV1BaTDh0K0Q2WlBYY1Qxb1NISFM1czd1?=
 =?utf-8?Q?t8qAaC2H1EzC1CJKXurrVrn5Y?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E7B28831FC97AC46A13F97F5A148BA8C@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR05MB10206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9351a87a-09cd-4d59-8161-08db047d2ac9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 17:53:03.7704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x08q0KRwObQ1O+eNxKGP+lV9Rbe9BS/7hYf8iLuhLaZstMTP/5Y2jM1lm100br9VCk/nQXRaIx6askbM5p8icA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB4448
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
Cc: Martin Krastev <krastevm@vmware.com>, Michael Banack <banackm@vmware.com>,
 Maaz Mombasawala <mombasawalam@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTAxLTMxIGF0IDIwOjI4ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gSGksDQo+IA0KPiBJIGNhbm5vdCBjb21tZW50IG11Y2ggb24gdGhlIGludGVybmFsIHdv
cmtpbmdzIG9mIHRoZSB2bXdnZnggZHJpdmVyLCBidXQgDQo+IGZlZWwgZnJlZSB0byBhZGQNCj4g
DQo+IEFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4g
DQo+IHRvIHRoZSBwYXRjaGVzIHRoYXQgZG9uJ3QgYWxyZWFkeSBoYXZlIG15IHItYi4NCg0KVGhh
bmtzIHNvIG11Y2ggZm9yIHRha2luZyBhIGxvb2sgYXQgdGhpcyBzZXJpZXMuIEkgcmVhbGx5IGFw
cHJlY2lhdGUgaXQhDQoNCnoNCg==
