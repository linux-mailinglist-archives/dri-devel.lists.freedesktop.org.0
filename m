Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F218E475297
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 07:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C901B10E616;
	Wed, 15 Dec 2021 06:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 081BA10E606;
 Wed, 15 Dec 2021 06:15:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQNsXqUtDuZNFmRokS/x3DR7TNWcliAMoI2gJ2AAh7AO6zMsszkaiM50N4qNAlV6SGIJgDqvJ7X8Jm9hQRyhRAIUIgk/HgCJ0HM4MZegEOuOaY6gP1C6RTfeAHwJEA6PCpkHcEqepJMDrRBEfHJq7kLITFT7Gx+8GYV3lWdTlsWmssQ90PnRRGlWhWAY1piz5TkyshIb8BBlN/ls2wkZwEQsfDLer7XovzV2qbY8Azrs+uN9eDptS6Jkkcu2U9c+wQkEY2iIxL+T2q+b7/lYu10yLdxcX0h5hqVX5RaUklJXtYqbKRWHzgA/56DouJ3/mY1XgsULeXMTUrx/bTDI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65Uw+Sqr7yanhSqAx0kdDsz4rKdmg1MMGcekA7vNxtI=;
 b=n3+byGJx+x3diOcrf7IJZcNLXyfg9opT8fX7Afyz/CM9dRZf7lXCZuiSELFUWUwGQ+WQZTinm5EJe9TJDOJ0JvifUIN7YHf3z8z37/PmPVSm7Xt37SubSrmo6QQY7w81tNzHtLVUc0CfGd2Nbu8BfjFcOQ6ZnRfVFnlnlfLWKPj+atuhS/U+6rLkS6ZOQ5OxnWCqMJBzkRH4QB6ezaJenZ3XIr1YoAhMuJtBAspV/m/GPf8Bx42AKVUOAJ/l7bIeivmwGart9Y3RS52AjWrsYux3qkqCF8TA2WWlbkd6TmwAj2FT4D5xANLY+TNgTjY7KA0o4Yy1kSBTH7WioLlJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65Uw+Sqr7yanhSqAx0kdDsz4rKdmg1MMGcekA7vNxtI=;
 b=GnkwrQVsmK8dsomabg62l142P7Ne7RPloJAsccLAWC9SgmR7DYI0u4zlQjsq4x3AN/J31Pfa8Lxh1hmhDXQfm1M6GMuBLPukYH6XXgU0M4TBqsaL1jR5jwrKzp/69VoGJfrbDOpSpdYR5+XFka2jqhO9iTAhAetCV1QFAGVdTgI=
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 DM5PR12MB2502.namprd12.prod.outlook.com (2603:10b6:4:af::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.21; Wed, 15 Dec 2021 06:15:07 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::5d07:e475:316c:d187]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::5d07:e475:316c:d187%5]) with mapi id 15.20.4755.027; Wed, 15 Dec 2021
 06:15:07 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Subject: RE: [PATCH v2] drm/amdgpu: introduce new amdgpu_fence object to
 indicate the job embedded fence
Thread-Topic: [PATCH v2] drm/amdgpu: introduce new amdgpu_fence object to
 indicate the job embedded fence
Thread-Index: AQHX8NwJBs8elJ0/CEGBZ7GYj2xD3KwyN2qAgAABTwCAANqH0A==
Date: Wed, 15 Dec 2021 06:15:07 +0000
Message-ID: <DM5PR12MB25043F80E7154432951C01EFEC769@DM5PR12MB2504.namprd12.prod.outlook.com>
References: <20211214111554.2672812-1-ray.huang@amd.com>
 <20f336a4-0bfd-9988-ee3b-a8206f045f7e@amd.com>
 <50871a0c-bdf7-dc78-3a1b-2d9b6515273d@amd.com>
In-Reply-To: <50871a0c-bdf7-dc78-3a1b-2d9b6515273d@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-12-15T06:10:40Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=86c1e5c0-2c63-413d-b836-25fdcb082e58;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_enabled: true
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_setdate: 2021-12-15T06:15:05Z
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_method: Standard
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_name: AMD Official Use
 Only-AIP 2.0
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_actionid: 6ff3af41-982e-4b2b-be27-3810e0487a0e
msip_label_88914ebd-7e6c-4e12-a031-a9906be2db14_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe2f95c6-d666-40bd-ab16-08d9bf923de7
x-ms-traffictypediagnostic: DM5PR12MB2502:EE_
x-microsoft-antispam-prvs: <DM5PR12MB2502902E51B9F4F57CD5C6A1EC769@DM5PR12MB2502.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v0+/cgZ6WPgJneVOM/jdF5RnCMejBPkv4C0NMxcHzVgQOKpZlFHtg/uYu0bHy4rEqIaIWCIkS8l+J47yMTvqwwZEZI+R+32EnqVzySYBFpyBzkh+GPHKepVrHl2L8gGvuC8i/V/gAgAEBXSDLKilo6Sv5qMvxq3r0861qgwtbn+5eJ6m9k/3DTe6e6qH1w/JGzztcbq1tHDerThUnN1GmJahqyKG23upehjqEoz+qvLaMZW/l/fU8D8Hui4QZDHwLZ7adq7U90X9nENCTWbtoUSUJS5sBkqWb5Q48kCyisDKDujr7V6al84gWBmWxVv1hBkdZGA0f9jomsA5wJFNZVRli1x7GnBzirmHaPrJFagyocvtUIUMVEeejCs9rZbq7GevDhSVGP0pXZuYEnUeGrzcZsGdzbLuoCk9RdlaCMc0wr2pjmWFVxTg6vdAwz0PrE9ioXc+Eim1Wd9my9OIP9fKdvdmP330HHjWhUKstYfGMT+eNuKD5+szj+UiMJuF76Jb0Jg9k4+zmExWh7r8+8Mlk6pl9bLPN9uoCfXYoNSi1n4XGHCFcnTkEZB75yWKwNjllE5CfoEqKsl8LDvpSm8aK33v+KilBO/+ZZvMfl5zjuDKMe8Mo6pESmA4OjdjUOH0JtmiCDtw8uIlUAHAtvOCn8YNL3RsHAouLX+GXv2UiYafLpOueR7ahgmwPnxNbft6m+C3h9knS4p7370ejA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2504.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(71200400001)(110136005)(8676002)(508600001)(76116006)(52536014)(5660300002)(66446008)(66476007)(122000001)(4001150100001)(66946007)(54906003)(316002)(6506007)(64756008)(26005)(38070700005)(33656002)(83380400001)(38100700002)(7696005)(55016003)(9686003)(186003)(66556008)(2906002)(4326008)(86362001)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUxQNS9lRjNsaCtYZHdsa2lhTkNpd2ZUN1pMQmpDYWNVdFJyaWMxN2oySlgw?=
 =?utf-8?B?cE8vWkU0d0g3ZUhJYkkybzIzaHNvbmFnYTJ6bXFiYVd2eCt0c0laamplNVV2?=
 =?utf-8?B?Um1DdWpsZ2lVWk9hYjZnSmEzd0lQYlRvNk5iQ1hZQkg5UlN1VzBqejRNMGFV?=
 =?utf-8?B?RkU0aXgvcHZFb2ovQllZSnQxTm5tZ3ViV0p4NmdxSzRCYjJCV3lBaFZoT2Rz?=
 =?utf-8?B?aHlDLzdqVTJjc1JFaE83Si9kam1hcTV3NEtEWDB4WVQzKzhCaFNTWTJxU05R?=
 =?utf-8?B?b2pOcEd0WmFnUVVtcEF1TDJlbG9SVm9lTkhMSlhwaFcvcFBBdVp1VzZwNGcr?=
 =?utf-8?B?bFFqYVZLY3RKRCt3NEMzRStXcVhZUCtwZ2dyVmRmRGM4NzVKWmVVcmxubVl1?=
 =?utf-8?B?Uitvam50MGFySDVHQ3RBSGFHemQ0R1A4UWJwb0tCY0JRSUhId015bzF3dmpr?=
 =?utf-8?B?b2lVUkZrNk5UVjZnVnNNV3dhM3lhcXN3VzdBMVRhMExoYk9ZVDBZRnBMSVZD?=
 =?utf-8?B?SmxkZ1RiSmorTmZXRUZsYjBwdVR5MlRpTy9Pd0c1c1hwaFpEeXhnN2xXRFQx?=
 =?utf-8?B?dUJXaHpqcitMY25kanp5YnRMYWRWQm5ubW90aStxU1N2elFoZzU2dC9ESm84?=
 =?utf-8?B?Slo2MEJMT01OZWxNbjNKcDhobHpHK3FDcDNJTXlEZWlHbW1GZ242TmhEcUJP?=
 =?utf-8?B?ZXhrRkl6WVFCZlBpV2dpcjJMeFNPZm1yNHVmMnpYdFl3Ky9ZWUo2WWJBNHF0?=
 =?utf-8?B?a05kaXdJMENJcFlMWkM3cndqME5HM0VrSm95YkFNMmM1UXNzNkgxaVFidEV3?=
 =?utf-8?B?MTJDdWdWQ3d3SGN6UjZWb1Azbkg2Y0hDcUZYQWxhbjNDLzJQTmFNb1hEWWh0?=
 =?utf-8?B?U0xDbmltdGJBWWpyblBZdUQwL0piazVXSTYzZXVFN2pzWEY1WmRyTHJ5OFMr?=
 =?utf-8?B?VVJtcFo3RFMrUk51M05vSFZWQU9VbzRsRTlQeG4rTGRjY1IrV0N3Mk1ZUnBK?=
 =?utf-8?B?N1dQU2N1RnNBbHhqS1d5Z0xHM1FraVVCRzhLaUtjOXAyb2Z1OCtxSXRjVG1K?=
 =?utf-8?B?NzA1OVZ5eEViNFRpYnBlYTBFK25IQWRISk5aaXlYd0dhNHRwTUpDSXdXUmJT?=
 =?utf-8?B?ZXdZZXZ6dTJIR3ZHL0w0SkhJdUpmQUgxbVFjZ2o5dEs0WFBwMjNweFVIQnNK?=
 =?utf-8?B?b2x6bFREbmxuVzY3RExQekl4R1lIdWxxZE1HMmhML0NHSVdFREk3alRmc3lI?=
 =?utf-8?B?eDNvTEc2aUQzTUpXeDUxWnVMRk80c0l0aXJVMjhDOXVGK1FNWVpkaVlWL01u?=
 =?utf-8?B?a1NCOVhtTmhxTVVvalNKdWVRTjZTVWRXTVM1bXNmREJKc2ZCZiswOXd3ODFQ?=
 =?utf-8?B?WlE3ZGsrVWgvTUJHOFpKSkdST0N3TnJhMmd4dVp1dzg3K21BMlFBdlZiV1Bi?=
 =?utf-8?B?TU0vNEtYS2tuNXh3djJBZ0FwVUNMQUE4SVhhWCttMTlsZk42dkJWMklmRWZW?=
 =?utf-8?B?S2lCdHJ3T0d2c1Z1SlRIUGVZZGdGMXh1L0FBNVJjZ1I2MWNIdEdkWUFwNURJ?=
 =?utf-8?B?Wnd5WmtoUkdld1FjczlONUp5ajgzMGtrd2V0cWtpWUdIREJXVjdPNlVjclRF?=
 =?utf-8?B?TmF0dGY2Rk5JVEc1clVSRVNqY3dydStuUStVaEJNSHRsc0prbXdPM0dqVGpN?=
 =?utf-8?B?Wmp3VkZZYlRnd1QyeE5JemJGVzdreXdQVVE4dFVpL1pqaTZ0ZXJLN1VpMTJO?=
 =?utf-8?B?VVRDU0FxbU1aekN1THQ5aTZJUVpQWHhuVkNtejlVTG44ZzlXWCtqOVo2MThx?=
 =?utf-8?B?RS9yVHMvM21VZllJd01zZEowYWNWNHh5WEQwTTZRY0czZDZqVjlCN25LaWlH?=
 =?utf-8?B?bThKOXI0RHN2T0xDN1VteFF6VExkVWlOZEtoMEplQzhBdWJveVpETGtiR1hC?=
 =?utf-8?B?ek5OSi9Zb0liNUUyNmFnNU8rYU9PR0ZQZCtjcjFxeXRLOFRNZGdKdU5aMHcw?=
 =?utf-8?B?cnBuWkpBT01vR1RsdCtkdlAyRENjejBseFpVaEJBRWtPQmFuK1JXWkpKL1hL?=
 =?utf-8?B?NGoyMGJlNkFqU3I0OFhXanAwMVJqRUVPb1hsNkRzSHRDQUhRaDY4bWtVRU5x?=
 =?utf-8?B?WjV1ZmdLckxoWVlJQzhqc2hZS3NrdDE4ZlRWRXBnaTJkWExJNE0wY3YwZTRM?=
 =?utf-8?Q?6Q6m6TIFbI8mlbBmPs6ZEcs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2f95c6-d666-40bd-ab16-08d9bf923de7
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 06:15:07.2327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tzHE40k1CAbqnruKQhrjEeXz7XFwxnQIjplN3uGNTMeU7lTaR5JPbPft9sCuJoD0IpU36x9BAx3Gf+yQNpYeXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2502
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Liu,
 Monk" <Monk.Liu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KWWVzLCBleGFjdGx5Lg0KDQpBTURHUFVfRkVOQ0Vf
RkxBR19FTUJFRF9JTl9KT0JfQklUIGlzIHRoZSBwcml2YXRlIGZsYWcgb25seSBmb3IgYW1kZ3B1
LiBNYXliZSwgaXQncyBjbGVhbmVyIHRvIGRlZmluZSBhbm90aGVyIGFtZGdwdV9mZW5jZV9vcHMg
d2hpY2ggaXMgZGVkaWNhdGVkIGZvciBqb2ItZW1iZWRkZWQgZmVuY2UuDQoNClRoYW5rcywNClJh
eQ0KDQpGcm9tOiBHcm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+
IA0KU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAxNSwgMjAyMSAxOjA5IEFNDQpUbzogSHVhbmcs
IFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD47IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2Fs
QGxpbmFyby5vcmc+DQpDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBh
bWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IExpdSwgTW9uayA8TW9uay5M
aXVAYW1kLmNvbT47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IFtQ
QVRDSCB2Ml0gZHJtL2FtZGdwdTogaW50cm9kdWNlIG5ldyBhbWRncHVfZmVuY2Ugb2JqZWN0IHRv
IGluZGljYXRlIHRoZSBqb2IgZW1iZWRkZWQgZmVuY2UNCg0KDQpPbiAyMDIxLTEyLTE0IDEyOjAz
IHAubS4sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOg0KLSANCi3CoMKgwqAgaWYgKGpvYiAhPSBO
VUxMKSB7IA0KLcKgwqDCoMKgwqDCoMKgIC8qIG1hcmsgdGhpcyBmZW5jZSBoYXMgYSBwYXJlbnQg
am9iICovIA0KLcKgwqDCoMKgwqDCoMKgIHNldF9iaXQoQU1ER1BVX0ZFTkNFX0ZMQUdfRU1CRURf
SU5fSk9CX0JJVCwgJmZlbmNlLT5mbGFncyk7IA0KK8KgwqDCoMKgwqDCoMKgIGlmIChqb2IpIA0K
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX2luaXQoZmVuY2UsICZhbWRncHVfam9i
X2ZlbmNlX29wcywgDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJnJpbmctPmZlbmNlX2Rydi5sb2NrLCANCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBhZGV2LT5mZW5jZV9jb250ZXh0ICsgcmluZy0+aWR4LCBzZXEpOyAN
CivCoMKgwqDCoMKgwqDCoCBlbHNlIA0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNl
X2luaXQoZmVuY2UsICZhbWRncHVfZmVuY2Vfb3BzLCANCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmcmluZy0+ZmVuY2VfZHJ2LmxvY2ssIA0KK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFkZXYtPmZlbmNlX2NvbnRleHQg
KyByaW5nLT5pZHgsIHNlcSk7IA0KwqDCoMKgwqDCoCB9IA0KDQoNCkl0J3MgcHJvYmFibHkgbWUg
bWlzc2luZyBzb21ldGhpbmcgYnV0IHdoeSBjYW4ndCB3ZSBqdXN0IG1vdmUgc2V0dGluZyBvZiBB
TURHUFVfRkVOQ0VfRkxBR19FTUJFRF9JTl9KT0JfQklUIA0KdG8gYmVmb3JlIGRtYV9mZW5jZV9p
bml0IGhlcmUgb3IgZXZlbiBpbnRvIGFtZGdwdV9qb2JfYWxsb2MgaW5zdGVhZCBvZiBhbGwgdGhl
IHJlZmFjdG9yaW5nID8gDQoNCkFuZHJleSANCg0KTXkgYmFkLCBJIHNlZSBub3cgdGhhdCBkbWFf
ZmVuY2VfaW5pdCBqdXN0IG92ZXJyaWRlcyBmbGFncyB0byAwIGFuZCBpbW1lZGlhdGVseSBjYWxs
IHRoZSB0cmFjZSAuDQpCdXQgd2h5IHRoZW4gY2FuJ3Qgd2UgYWRkIGRtYV9mZW5jZV9pbml0X3dp
dGhfZmxhZ3Mgd3JhcHBlciB0byBkbWEtZmVuY2UgPw0KQW5kcmV5DQo=
