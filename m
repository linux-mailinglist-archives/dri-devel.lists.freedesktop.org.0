Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E4E7FEB82
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 10:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B9010E123;
	Thu, 30 Nov 2023 09:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B5A410E123
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 09:09:45 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AU7A2FA018574; Thu, 30 Nov 2023 09:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:references:in-reply-to
 :content-type:content-id:content-transfer-encoding:mime-version;
 s=dk201812; bh=rQM8guy+DWzVn3u3Dk87hQP5YUJLO/Zl0ER8DpMMiNg=; b=
 pkd3Jo4Qgor49yUwp1lBzV3FFtQlTF4GUyGFYF5iWGAkE7bqRHeUiss+uBQKtdLc
 TS6Zd+TX5erWgf2wn+lwdN4VCAdT5eM3FLJFSS3rwCG304j0gXMpt80a4d28jx08
 sy5LlXZOfUD6wGdy0onS3NYh+IGyxzMj83Gu8V6+WTBNug0cOxj/EzA4jCqk38/7
 n+gQPxrCnmbUIJqUqqJidJlQTOX0ZTg6BvcYbTUgFDook88bfBs+9QG1coldw0lx
 A+dRyyOGJa8fTrynQ2yE9JzGVRYMKTaTwV3nPU05HfHXW8ClkX7O2FUNszOc1+6Z
 H0Q8zP6vx+NETYd8da8AkA==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3upgv6r98s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Nov 2023 09:09:28 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 09:09:27 +0000
Received: from GBR01-LO4-obe.outbound.protection.outlook.com (104.47.85.105)
 by email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 30 Nov 2023 09:09:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ut68BGIiXCiHvp6iY8VYklRBFPZevQBdLIQmWnQbVs3xek8U0ZL5UnqahA3b/3ZJqe2lQuQDLM7M/zjWUGyq6HjvRfqKis36JGdw2YJ/TdC8SZZQ0JWB05t9nPVDJPsTtzkRp/9cAjKbwKIpDccwNqTHvESUce93RPxkGPU+B/W7226vqcF4V8f3LxPYXggCYItUKfydk/Wi6Cyi9Dy4nDySphxYk5a+GqzCAAKHya3UO2Xmo+3cG2cn43W6slXEtxUeDTczCxGXwvZlorR0yx3azCAO4+pd5sQoLZ4adt28XWsAoxuS1WgR71dT49PErbPdt2Bl5IY7Ot+zZuDGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQM8guy+DWzVn3u3Dk87hQP5YUJLO/Zl0ER8DpMMiNg=;
 b=HSM9lUMiMDj7UvITjf0Vrym/bRIs60+IsJw0bi2RyT59cEa9zChNXN3QEwHo0Gf+FjsHEdvlwtjW/U7l2o5pfk1DaySWvtJmPoKzDAreyI/oqZPoi+nyxn5EtN/PIX0pmr6JeXoCziSfiEFzlX8EZMByrENeIBy9hcBBdOS4SAyd8h2un6zCl5O4eSuNhWkrCNwoyf5IHjrinUNPwFGzhkEwcZ1tNyhVyzFKhMfGi7Ko9hWpDXG3v9nT9owQuICHD5/t8esFV1XZdbGPaY7g0n5jUEde2wd9IhkJKVjed7AKyLPR/W6H89CALtGwNow79jAuDG3SVO6191xHe+QaCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQM8guy+DWzVn3u3Dk87hQP5YUJLO/Zl0ER8DpMMiNg=;
 b=UjMZFqBsBlW53mx1awCjIgkgov30VScoPwGhpWMBJDaitjrBK3eo0gWEzDMqZvGTZb+Y6CmC57u0pUyS6aQe2ZAuXDLlI/k6k5JYdR8Yxfd5bvbFlpF5+8AwuObWiyXwBJ+5Av7bsQzhOdLd4EV1impfmbJ8aFTCGeL5KJ3fvDA=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LO0P265MB5925.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:290::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 09:09:26 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 09:09:26 +0000
From: Frank Binns <Frank.Binns@imgtec.com>
To: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>, Sarah Walker
 <Sarah.Walker@imgtec.com>
Subject: Re: [PATCH 1/2] drm/imagination: Fix error codes in
 pvr_device_clk_init()
Thread-Topic: [PATCH 1/2] drm/imagination: Fix error codes in
 pvr_device_clk_init()
Thread-Index: AQHaI2zqoImbWWFnPU+NZSsKn8hssw==
Date: Thu, 30 Nov 2023 09:09:26 +0000
Message-ID: <f5a1e07ee366a547b389650bc7bb21ec81e00219.camel@imgtec.com>
References: <1649c66b-3eea-40d2-9687-592124f968cf@moroto.mountain>
In-Reply-To: <1649c66b-3eea-40d2-9687-592124f968cf@moroto.mountain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LO6P265MB6032:EE_|LO0P265MB5925:EE_
x-ms-office365-filtering-correlation-id: ff48d030-a6c2-4d7e-4d5f-08dbf1840d1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w6rCnCEnRf0WP4IiQ97q/q8YfQWEY4XKFoG8vaBN1+H8+/FYFzDf0Bml6PLYSpQYwALfZ54jPNkdhEIn+9W3IknqsIIKHh+ImkyenDK/xCStYkm5wsBsCKL6bmzpR+aBhO8y6qrAR6B6yq4neYyyzZbWw0dN+SBqHX1S/8YPTOOq+IQ8xLtTWlHrTuYBJF+Whlf0kwkURAS6iuDTP12kKqJTTOUVlVLxeE8xHEoMGI/hJLTwG/DDLBNJy3DpaXsRVvpgbaJqDmi2iOgNHMT/0SCYEW+cEs5Y4Ev5mk2RZz9n6epoyYFUHScm5yiCAKepPXw9ux3n+qaLy5VULtV7iyqV8BFQljaGiiBw/pzBzx4AU2sVRbjPK627Lb11xqbpGmQ6ERU/yMoc+eGf5k/TfGVWQHOYAapqxmIhjHco7tT/uPy+WEyCYW+70CEbH8YOn6a2LrECfCkgYmPpcy4+1NrKty+QmmcK+9jfdItyUIeZaTJEmWc352+ZPMyWBlVFmVsahpq/jTWJqwkzKjkMbfQA/Sfv19gyI7qQyABioK0QwYMspJnySc6owH0Ts5ryCsLPTJg4u31YyfbbYjzR0WtfR3yn0kcvAW6Ln1yWfNkinslV2VyDCNVYglSsez0AaJR0dIlx21ND2JowODVj3g1m+8dtZnBGq7+31f9oOIs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39850400004)(376002)(136003)(346002)(366004)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(38070700009)(36756003)(86362001)(122000001)(202311291699003)(41300700001)(66446008)(316002)(54906003)(66476007)(6512007)(6636002)(110136005)(8936002)(76116006)(66946007)(6486002)(64756008)(71200400001)(6506007)(8676002)(478600001)(5660300002)(2906002)(4001150100001)(4326008)(66556008)(2616005)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTJxU2dnSEtNL1ZiVHRYWUxYYWtPaFFVc1Y1dDUvNG5MMEtyL0lQa1ZORWww?=
 =?utf-8?B?Mktxcnh5cnNBVEdIR1B4Nml4enVsMFhVRk56KzFWZ0Z6WWtGeGFsbW1XcjFo?=
 =?utf-8?B?bEF4TGZ1SHpLajh6c09NTStrTG1WSkFDMVVtN2NnTGY5RDJSRnBxRzlHQjFB?=
 =?utf-8?B?Q1QySmNjSGZ4M0V2VFNmc0tVSURPWmRCSWw1eWR1SFpNWk1RV3VQN1FOZFJQ?=
 =?utf-8?B?WkVzNWtndDR1MjJ4R3lQWEo4Zi8wS3FDZ3hNRUQrbFlsZkc3Qzdja2pjNm9V?=
 =?utf-8?B?ZXl3TTFiWmVFeVAwb0dHR01sbWxMTE5HUHJaTWcrY3kxQkZuUk1LQ2YyWHBi?=
 =?utf-8?B?QW1yUndFbGU2V2J1MnFYNTEzNURWbDZJRkxDNUpXOFoxNXJFQTdQdERqOGRE?=
 =?utf-8?B?MVB6MmQ5TG5pWEZiMGZDYmJCV1FvbzBrRTU1RjdkclJEVEtxN0dtbzlwOHBJ?=
 =?utf-8?B?aDQ1cEV1cXJaVnhoTUU3M08vcnh3Ny9yWGFLcksrbWUrZGM2OFRMZ0FWZ2p2?=
 =?utf-8?B?cDI0Vk9oRitsV2NPRmtUQ3NiVTluNS91SkZWWGtHQTJjYWdaem05SDlHMzND?=
 =?utf-8?B?akpickVCNGNJTVhNU3NQSWhPSmN6STRUWk9Gd0pQd1Fpc3lNQUp2WUZhMmRw?=
 =?utf-8?B?ZUdiWkxiWWNDVUd6enYxKzRidFJOKzdXazk2Wm8yNEQ5MVFUdzIydTlwdTR5?=
 =?utf-8?B?RkpQbWZRRmJDaWZIbE1KVTZJTUNDdFd0ZjFKV3FhWTJHMjZhZktQNUEwRmRv?=
 =?utf-8?B?dnRsZkFXTDZvNHBXYjdOVXd5MFkvWC9pdkRYQURqTFZiVjR3aUw2eEZsVmNQ?=
 =?utf-8?B?SDloL1RKRXRTZzQzNlp1RmJ0OUVYRGRwMjB5Ky8yTnUvSkVDQzZXUUYrVXlz?=
 =?utf-8?B?U1pqZDJId3FaNTVNc3hwUjFOSkhscWk3L05VckU5a3p1WWk5bGhaR0RMV3Fq?=
 =?utf-8?B?MWU0dDIyZ2VkbDBRWGVUOEFpbE9TL2pERzd1dGRyeVpidU9qSXg0TC9JR3Fa?=
 =?utf-8?B?WERSK09OWlpyNmN2dW5HSlB5eWNHSDJ4UWRmUGdUOEd2a09aQmJ5ZkdxS3Bu?=
 =?utf-8?B?bmxpcWFNZTJMY1RYeW5oSm42QTRGOWdrcWZDUGhaNFZubjM1WVdsWkdXTWRi?=
 =?utf-8?B?dWRZWm1KUHJOTmxjaVBRUnRYd3pPOWdpci9ZUWZ2SVhGMEZsRkNvQmRteStv?=
 =?utf-8?B?enFhMGgwL2l1R2pSbXR3WjBzbjEvWC8rRWFGaVpqWEtlUTNrakQ4T2plRW1o?=
 =?utf-8?B?ZGhMUUZycVhncnNaRDZoMnNucTdEbXJ2SCtrenZTdTRqdFF3d0JpZEpyTVl2?=
 =?utf-8?B?Wi9KaEY2TEg2aU1md0daTWJMdFEyT0tKSFVWRGovSEpwcXRRajJGaXdnZ3dX?=
 =?utf-8?B?L1VLY3ZISDFnTXdkcFBxbFNSUW1Bbk42M3QxOFh4TXRDWlYraEVEUGRvVjlO?=
 =?utf-8?B?OTJzcHhZdUZkZFNnT1JBMGdDaEJDelBKL0V2dEpCSSs2OGtwYWhrZDZ5anh3?=
 =?utf-8?B?T0xZOXoxK3BUR3NMM05Gclg4aWVSWkdCNmoxSE1mUGpsTVJ5TGZDU2RycVdz?=
 =?utf-8?B?b0IvYndxaW9sSUVLbkVMWWR3YkhHMzJZb3orSjhTMitjbU42VkNlV0V5a2NO?=
 =?utf-8?B?MVFRVjRBejMwSlozbGJZU2wya0lGRTV1cm9UN3Eva0lhUnZqMjlhSVVkTDc4?=
 =?utf-8?B?b3FkWDQrb1JxZnM2aFVaRjBsVWxMQ2EzK29xNG10NVlmOUwvbUg2S0RjUEt4?=
 =?utf-8?B?WTFLNktXbmFsbjhMTW1rWTRhNXRKV0c4dHltcVBESUl4Vm1yYmtOV2s5aWZa?=
 =?utf-8?B?cU1aYnByODAzMzE0eXVFK2RxZElHNmt3aUEvTlhPeW16K2JNaktLSE5scmlU?=
 =?utf-8?B?TERXY1J6OWZZUjZISEZ5ZjZ6K0ZtL0pOd3orVzZ0bVlDREsvbTFkNS9USzhZ?=
 =?utf-8?B?SFdiRWpWMHc0U2JjeTRpU0FoQjhrMUphNHp3SmxpQWFwVnBIb2tRd3lBUFRP?=
 =?utf-8?B?aWwxUkltT0hkMlhDcnYxbjI1UDQwZ0lFVmlqSzZkaUFKK2IwcS9EVTBuczIw?=
 =?utf-8?B?U2tMSmxYQzEvMGFYTkhQMFhZN1hQMVFReU5VVHRJWm9yVzRXN3JNWk5hTHRE?=
 =?utf-8?B?VUdYNzVKc0ZJSkl5d1Z1TjFXYlpVc2grZzZ1UVVxNkhRZ29jRzNoMVMzUGRo?=
 =?utf-8?B?ZkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E0A2C60EEFD474F9D1591EA61ECFC82@GBRP265.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ff48d030-a6c2-4d7e-4d5f-08dbf1840d1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 09:09:26.0914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k/4PQlt2EfeCQgtMkYVKgQcTliSo0DBs71mux9byZmet2iqvDBd6sPm6XYBMs7a81RPV9nzrMY4HdZc2g6dgTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5925
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: 7dpARdFr756rdv1wvBvw-SYLsLGgi9pW
X-Proofpoint-ORIG-GUID: 7dpARdFr756rdv1wvBvw-SYLsLGgi9pW
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
Cc: "mripard@kernel.org" <mripard@kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Matt Coster <Matt.Coster@imgtec.com>, Donald Robson <Donald.Robson@imgtec.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoZXMuDQoNCk9uIFRodSwgMjAyMy0xMS0zMCBh
dCAxMDoyNiArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90ZToNCj4gVGhlcmUgaXMgYSBjdXQgYW5k
IHBhc3RlIGVycm9yIHNvIHRoaXMgY29kZSByZXR1cm5zIHRoZSB3cm9uZyB2YXJpYWJsZS4NCj4g
DQo+IEZpeGVzOiAxZjg4ZjAxN2U2NDkgKCJkcm0vaW1hZ2luYXRpb246IEdldCBHUFUgcmVzb3Vy
Y2VzIikNCj4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5h
cm8ub3JnPg0KDQpSZXZpZXdlZC1ieTogRnJhbmsgQmlubnMgPGZyYW5rLmJpbm5zQGltZ3RlYy5j
b20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2RldmljZS5j
IHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJf
ZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX2RldmljZS5jDQo+IGlu
ZGV4IDg0OTliZWNmNGZiYi4uZTFkY2M0ZTQyMDg3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaW1hZ2luYXRpb24vcHZyX2RldmljZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
bWFnaW5hdGlvbi9wdnJfZGV2aWNlLmMNCj4gQEAgLTEwNSwxMiArMTA1LDEyIEBAIHN0YXRpYyBp
bnQgcHZyX2RldmljZV9jbGtfaW5pdChzdHJ1Y3QgcHZyX2RldmljZSAqcHZyX2RldikNCj4gIA0K
PiAgCXN5c19jbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoZHJtX2Rldi0+ZGV2LCAic3lzIik7
DQo+ICAJaWYgKElTX0VSUihzeXNfY2xrKSkNCj4gLQkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZHJt
X2Rldi0+ZGV2LCBQVFJfRVJSKGNvcmVfY2xrKSwNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUo
ZHJtX2Rldi0+ZGV2LCBQVFJfRVJSKHN5c19jbGspLA0KPiAgCQkJCSAgICAgImZhaWxlZCB0byBn
ZXQgc3lzIGNsb2NrXG4iKTsNCj4gIA0KPiAgCW1lbV9jbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9u
YWwoZHJtX2Rldi0+ZGV2LCAibWVtIik7DQo+ICAJaWYgKElTX0VSUihtZW1fY2xrKSkNCj4gLQkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUoZHJtX2Rldi0+ZGV2LCBQVFJfRVJSKGNvcmVfY2xrKSwNCj4g
KwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZHJtX2Rldi0+ZGV2LCBQVFJfRVJSKG1lbV9jbGspLA0K
PiAgCQkJCSAgICAgImZhaWxlZCB0byBnZXQgbWVtIGNsb2NrXG4iKTsNCj4gIA0KPiAgCXB2cl9k
ZXYtPmNvcmVfY2xrID0gY29yZV9jbGs7DQo=
