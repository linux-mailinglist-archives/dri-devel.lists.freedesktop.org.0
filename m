Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B845A79222E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 13:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C998110E19E;
	Tue,  5 Sep 2023 11:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2914210E4C5
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Sep 2023 11:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQBG6yGpnluSvo3/EzvXtalrok5s3FI4gjNlwQoZpgvv6f5kLuzPVv95t/b159IEJs9d6MWqylVW1bYfa9uV/XSjzlRa/hV8IyXPdMFH56406RTJ9BTGQ3euMbCpLO7DcXDYB827wft3P1bc+VRrk8Pi0RHfNsTjkpfqhONi9Y4gejL3UrAWNOieEWUDDY/c+P1kL2oBuFf2TabZPbKn1RTUW/p9lVKoGMFAL4hxHbpSleLedX3tphxIWWEwglCDcaodPibert0dJysozVc6xLZuV1aTMCsqUImKf2/lSbx2SXwtgJ+B6HnINoMu5AB4g8sBVg34GfQRQokMaeF/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5EE4utq0UswnyrKwmY2YEdSXlTqt8lMdOVFl/9bMmRE=;
 b=RjyvO59ziskIPEzYPdjAgmp1hdzgRW5/YikjZkw333tJ6trF1P9o1MmDHImCmY22fZbKPvd2r9beKkorsKR9PYTRXEAWCeygHYc2n6zEY/6klqymKib/anYs7zy2LTPPNNFNiDCQQqhwbEnwsnXcZp8q9sqnBH3I3FZYB1hq7UDVsbZeBRQ2XDYl9qb9lkxNw1tAh8OrLKwiQFedBA/KCMdITUTHQjF1h8jysm9shEKEpTfrNyWh8ep1Gdmb2Jf9p3rAkyZamtaEyBYPfns8S6gX/5WVJ4vtYZcjYy4vfBIS4R5Ct8YX9FJ08mI1wKSOLUkBLKITS8mPHV0EV/XL5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EE4utq0UswnyrKwmY2YEdSXlTqt8lMdOVFl/9bMmRE=;
 b=YVixcqdfQmbKmprKkBIb6l0JEV4HpWcMHj2O5ky8rAW4ph1UdUKoPJ91lfDompTfIO2xH0PHWMmDWNgUBtQt7i36pVp8bZ8BDtJ3Bhpm0dtE2L+M20Lg5gNIULgO8MHfBYOflrR7FaJbuTZ8KqNDbFAYAu9tntwE2F7XKaffG3Q=
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB9024.namprd12.prod.outlook.com (2603:10b6:610:176::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22; Tue, 5 Sep
 2023 11:35:19 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::c838:299:8697:dd70]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::c838:299:8697:dd70%5]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 11:35:19 +0000
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?=
 <marcandre.lureau@gmail.com>, Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Juergen Gross <jgross@suse.com>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Robert Beckett <bob.beckett@collabora.com>,
 David Airlie <airlied@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [LINUX KERNEL PATCH v3 0/1] add S3 support for virtgpu
Thread-Topic: [LINUX KERNEL PATCH v3 0/1] add S3 support for virtgpu
Thread-Index: AQHZuwGAgZyRAq2jq0mtwDyHtWJn8bAM5DSA
Date: Tue, 5 Sep 2023 11:35:18 +0000
Message-ID: <BL1PR12MB584920409C08C72F8F2D3AF8E7E8A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20230720115805.8206-1-Jiqian.Chen@amd.com>
In-Reply-To: <20230720115805.8206-1-Jiqian.Chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.6745.026)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB9024:EE_
x-ms-office365-filtering-correlation-id: 91a14c4e-f335-41c5-5424-08dbae042e94
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3ow3wkpo0Vp/Ot04rTEO6oR3fysZpKfJcTfjvO8gcZXQjMMroVVbJY05cC8CheuSkYvBKqZqJN4xKXPv+ssC3YDDyHToowGo14wRyO7jgjhbTBfkcgzEmvYJzYJSKwxtYtkKRZO5qAZXh9/bfq6etEvsDgr0QIzWkF0wMFw4pUF3mv1xfW5TsDOzM7loFLXrTjuq1+qiern/C1XufYq9NVoLJ6DiH1oPqji07IW90lIz99+uwjzoyKPW6YBXqHb6OtSfpYPtU4etTRancj+62Fy+oRQfVX0cz3zYbUfhv9D137QbWbl4seo6ZIp7b7N2CE+vNfLmJPujoRhH1+bxGQTkXyQ5hWf5UttyamBeRrXA8Czu9rVKYI8wdRUfOGGcqyuNSEUoo0xAU5USSMHzTnzNu5eSC48Yg2M1tS+38yJd930Yj5Cmc3BdN3cikAfWjx7QtnwWQqur9pmDM3qZI3WYJj5D2/BQiZ/KkBYBQ/Y3SbzKGT0Ao0O8XEhfQzUE3Yhlvut8JO7PS2xzgK/LRQf+z0NmW1sN+yfkOejaBI6yHvg8DuNJfKt6FFT9Zll+gUE+d//SSdEK1lBjEhVHkOevOs1Gr6AVJ8C+qEzUyNqHPTG1tSWegexaYPz2FU/tzVb7y0ZX8Eb5xjkVdQzMNUr693hUlfh6HCf66hggXtw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(396003)(376002)(136003)(39860400002)(346002)(186009)(1800799009)(451199024)(55016003)(41300700001)(33656002)(26005)(38070700005)(38100700002)(966005)(64756008)(921005)(66476007)(110136005)(76116006)(66556008)(66446008)(66946007)(83380400001)(54906003)(316002)(71200400001)(478600001)(52536014)(122000001)(53546011)(5660300002)(2906002)(9686003)(8936002)(7416002)(6506007)(8676002)(7696005)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFpBUTV5NzdNKzQ0Tlo0VFVuS3l6aDVyOVV4V1dyeVhuOSs3MGFVek9IZ1FD?=
 =?utf-8?B?ekwrMU1tZWJuTTZXSHJSYXBsNDB0TmRyTCtCZjhleDQvZStuazFwVUdEdms0?=
 =?utf-8?B?bUhmaGxENUNSWDBYVjZIdkY0aE05ZzhBUEQ1TzlUOVFkM3c5dmNiOWhETWs3?=
 =?utf-8?B?cjdQcTFNOFg4cHNEZzZUNC9yY2tFb2svV0Z4QnpJSUk4SSswUTB3SWpabThy?=
 =?utf-8?B?SUU2ZUZEZXI5V2RjZ3BIVktnR0lJMHdFOFd0aThuSnJPRlpBZ0lIQS9MWURT?=
 =?utf-8?B?ZTZjWkNvTUJZT1JyNjZPY2dDWGc4N2ZzMjBiTDdjMHc0RjhpeE5pNVlaZSsv?=
 =?utf-8?B?d0c0dnZxODdnNmZIc3A3OU1VS0ZhRjZMVTQ4VjVkaEkwNUh0R2QyR0VjUlQx?=
 =?utf-8?B?WHhSK3EzNjRaYmNraGtPeTl5MlpxM0FIbjV3VVlXMi8zcmIvemVLNzdTa3lu?=
 =?utf-8?B?MjQ2c0FCWFVNVnBGZDdKVHNYZnJ0TVJucVUzSlVlVzd3T0l5NVRYd1BSbXU5?=
 =?utf-8?B?UE5WeHRPZVJoY0o1cDhvUFlyWHVRcjkrbUg4OThYanhNSTdDMW5DVXdwckh2?=
 =?utf-8?B?Y2pJTU1Oa0ZZUXl1QXNjMVN3UUljaWNXdW9lamRYUkc5dXdlNXZCL0srR2N2?=
 =?utf-8?B?dGdqa1lDUUtFd1pVeWFMN2NndGgwUExTZVdhUkZNWCt0TGdQb29DSTF6bzdO?=
 =?utf-8?B?Ym16V1FpbHZianhlWVppSG01TVc0NlM0TVdBV3B3dzVocENLcXhpU0xzdnZV?=
 =?utf-8?B?NCtmM0V3V1A3aTh4SWJ6Mk14S0ZPVlJUTlJ3bGZKVmdlK1NpYmJURjhCcmhV?=
 =?utf-8?B?Q3B3ZGU1eUdpc3diQnV1MWQxanF4emd3Y0xaQjNmNjl6eVlIY2hucFBXL2M5?=
 =?utf-8?B?c3c2NUhaS3BFY0hFalBUaEU3czBjRTAycnBiVHBJamdVampSM1JzOXhJS3Q3?=
 =?utf-8?B?K0Mzc29QTnBsRXlMNEJlYlhMcVo5REJZTkZuV0Rnb0VFR1VSNSt6VEUrSjZs?=
 =?utf-8?B?cEhEcklIRGpuVlZpNmhGWk9FWE9qZittZi9EQlQ2eDN5OEFCVmtUS1doWFE3?=
 =?utf-8?B?ZldIcUx1VngzZ1B3YitVYThROFQxYS9aOUZ3Z0thRVM5Wm1kMVAwdFpWaWZV?=
 =?utf-8?B?d0ViRE1RV1hjZWtyRGlNUS9yL2o5dzNTODNtczZEMVR3S0Z4K0VmbXhyQXlr?=
 =?utf-8?B?VDhaSzl1R2x6RksvamU5SnRZRFl4NDlUSm5SbTBMa2RBWjBLWXdDUWxNYWc0?=
 =?utf-8?B?QWZpQUhsYTg3MjZvVHpuaHJKVVZNOWY0bmpIYjI5NjBhR1libUhpZjcyeVNh?=
 =?utf-8?B?MVl1M2JpbnF5dDV0VEE0TUs5Z3RTc1FNOVdaSGFKdVFMbHpicE10SkhWcVhU?=
 =?utf-8?B?M3BrL1VqVkx2aUZhaU0wOUZsVEFZcUpINFB6UHROdnlyK1lDczBRWjRIYzJh?=
 =?utf-8?B?NGJqbW50azdNL3cwdXJlNnNtQm1qa0E5dnIxdFFqaWhBZG1DU0FNTytBcEQv?=
 =?utf-8?B?OUp3WERsSDJ6bHdNU2hsYWZhUXdSOWRFTys5VkNSb1EwN056b3pkWDNaWENh?=
 =?utf-8?B?MUNoVnpWYXg1VUpkVDFEKzg3clRCRlpKUEJtN043ZWpRTnQ2MTNBNjgyY09K?=
 =?utf-8?B?Qmc1eThla2FMdVBSQVg0U2QyY3lLN2cvZ0JvaVhvUGtMUXJNWS9KcDV3dmVu?=
 =?utf-8?B?aFdnUXVOK2tMNWZ4aVU0UCs3UHZ2ekswemEwZGlxaDJRd3VJMm1kVFZhYkl1?=
 =?utf-8?B?Rm1GbXltMFA5L3I1TWdvMXlINVJGY2VKMS9VMFFRbzhxYTFPdEE2TVd4R2pz?=
 =?utf-8?B?UHRFdndNcXJqeER6Y2xZK1d3UGVxcjlVKzlTMjNWWkpOMVdNbzRIYXFvaTA0?=
 =?utf-8?B?SnVDU3BEanNYejhhcXY0QXhaMFQ4YnM2UFN4bmN6RkVtZjNsemNTbnRBMVlF?=
 =?utf-8?B?T2NoZUhqaWFIcTVDUTM0SE4rRStEdTVCTUVtMU0xWEZGNWRTUjVaNzFrTmhE?=
 =?utf-8?B?TUJON1lWbHNsOTBCRmxYUCs3QWZxZHByTjlQTVJYRkVUVVRxRGpvL0doS3A2?=
 =?utf-8?B?YUM1U0NRNTZLMjVCR1B6UEY2Zzh3Ym5GMkVUeW9BK1JRa3NMVG90c2ltS0RG?=
 =?utf-8?Q?Xjc0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <05DE8599489D95488AECB5F2CC9D18BD@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a14c4e-f335-41c5-5424-08dbae042e94
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2023 11:35:18.7071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QjJAaAV4brKV4ueX0Mq8z6OzOA1BFkjJRpayWWp6dPdxkbPyHu5BwbT/kqa5LI6tnSqH66nMUez7rOETZGebkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9024
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
Cc: "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhang, 
 Julia" <Julia.Zhang@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLA0KU29ycnkgZm9yIHRoZSBsYXRlIHVwZGF0ZSBvZiB0aGUgdjQgcGF0Y2hlcyBvbiBR
ZW11IHNpZGU6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2ZWwvMjAyMzA3MjAxMjA4
MTYuODc1MS0xLUppcWlhbi5DaGVuQGFtZC5jb20vIC4NCkFuZCBJIGhhdmUgY3JlYXRlZCBhbiAi
aXNzdWUiIGluIHRoZSBRZW11IGdpdGxhYiBmb3IgdHJhY2luZyB0aGlzIHByb2JsZW06IGh0dHBz
Oi8vZ2l0bGFiLmNvbS9xZW11LXByb2plY3QvcWVtdS8tL2lzc3Vlcy8xODYwLg0KRG8geW91IGhh
dmUgYW55IG90aGVyIGNvbW1lbnRzIGFib3V0IG15IHBhdGNoZXMgPyBPciBhbnkgZ3VpZGFuY2Ug
b24gd2hhdCBJIHNob3VsZCBkbyBuZXh0PyBJIGFtIGxvb2tpbmcgZm9yd2FyZCB0byBnZXR0aW5n
IHJlcGx5IGZyb20geW91Lg0KDQpPbiAyMDIzLzcvMjAgMTk6NTgsIEppcWlhbiBDaGVuIHdyb3Rl
Og0KPiB2MzoNCj4gSGkgYWxsLA0KPiBUaGFua3MgZm9yIEdlcmQgSG9mZm1hbm4ncyBhZHZpY2Uu
IFYzIG1ha2VzIGJlbG93IGNoYW5nZXM6DQo+ICogVXNlIGVudW0gZm9yIGZyZWV6ZSBtb2RlLCBz
byB0aGlzIGNhbiBiZSBleHRlbmRlZCB3aXRoIG1vcmUNCj4gICBtb2RlcyBpbiB0aGUgZnV0dXJl
Lg0KPiAqIFJlbmFtZSBmdW5jdGlvbnMgYW5kIHBhcmF0ZW1lcnMgd2l0aCAiX1MzIiBwb3N0Zml4
Lg0KPiBBbmQgbm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBK
aXFpYW4gQ2hlbi4NCj4gDQo+IA0KPiB2MjoNCj4gDQo+IEhpIGFsbCwNCj4gVGhhbmtzIHRvIE1h
cmMtQW5kcsOpIEx1cmVhdSwgUm9iZXJ0IEJlY2tldHQgYW5kIEdlcmQgSG9mZm1hbm4gZm9yDQo+
IHRoZWlyIGFkdmljZSBhbmQgZ3VpZGFuY2UuIFYyIG1ha2VzIGJlbG93IGNoYW5nZXM6DQo+ICog
Q2hhbmdlIFZJUlRJT19DUFVfQ01EX1NUQVRVU19GUkVFWklORyB0byAweDA0MDAgKDwweDEwMDAp
DQo+ICogQWRkIGEgbmV3IGZlYXR1cmUgZmxhZyBWSVJUSU9fR1BVX0ZfRlJFRVpJTkcsIHNvIHRo
YXQgZ3Vlc3QgYW5kDQo+ICAgaG9zdCBjYW4gbmVnb3RpYXRlIHdoZW5ldmVyIGZyZWV6aW5nIGlz
IHN1cHBvcnRlZCBvciBub3QuDQo+IA0KPiBWMiBvZiBRZW11IHBhdGNoOg0KPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9xZW11LWRldmVsLzIwMjMwNjMwMDcwMDE2Ljg0MTQ1OS0xLUppcWlhbi5D
aGVuQGFtZC5jb20vVC8jdA0KPiANCj4gDQo+IHYxOg0KPiANCj4gbGluaywNCj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDIzMDYwODA2Mzg1Ny4xNjc3OTczLTEtSmlxaWFuLkNoZW5A
YW1kLmNvbS8NCj4gDQo+IEhpIGFsbCwNCj4gSSBhbSB3b3JraW5nIHRvIGltcGxlbWVudCB2aXJ0
Z3B1IFMzIGZ1bmN0aW9uIG9uIFhlbi4NCj4gDQo+IEN1cnJlbnRseSBvbiBYZW4sIGlmIHdlIHN0
YXJ0IGEgZ3Vlc3Qgd2hvIGVuYWJsZXMgdmlydGdwdSwgYW5kIHRoZW4NCj4gcnVuICJlY2hvIG1l
bSA+IC9zeXMvcG93ZXIvc3RhdGUiIHRvIHN1c3BlbmQgZ3Vlc3QuIEFuZCBydW4NCj4gInN1ZG8g
eGwgdHJpZ2dlciA8Z3Vlc3QgaWQ+IHMzcmVzdW1lIiB0byByZXN1bWUgZ3Vlc3QuIFdlIGNhbiBm
aW5kIHRoYXQNCj4gdGhlIGd1ZXN0IGtlcm5lbCBjb21lcyBiYWNrLCBidXQgdGhlIGRpc3BsYXkg
ZG9lc24ndC4gSXQganVzdCBzaG93cyBhDQo+IGJsYWNrIHNjcmVlbi4NCj4gDQo+IEluIHJlc3Bv
bnNlIHRvIHRoZSBhYm92ZSBwaGVub21lbm9uLCBJIGhhdmUgZm91bmQgdHdvIHByb2JsZW1zLg0K
PiANCj4gRmlyc3QsIGlmIHdlIG1vdmUgbW91c2Ugb24gdGhlIGJsYWNrIHNjcmVlbiwgZ3Vlc3Qg
a2VybmVsIHN0aWxsIHNlbmRzIGENCj4gY3Vyc29yIHJlcXVlc3QgdG8gUWVtdSwgYnV0IFFlbXUg
ZG9lc24ndCByZXNwb25zZS4gQmVjYXVzZSB3aGVuIGd1ZXN0DQo+IGlzIHN1c3BlbmRpbmcsIGl0
IGNhbGxzIGRldmljZV9zdXNwZW5kLCBhbmQgdGhlbiBjYWxsIGludG8gUWVtdSB0byBjYWxsDQo+
IHZpcnRpb19yZXNldC0+X192aXJ0aW9fcXVldWVfcmVzZXQuIEluIF9fdmlydGlvX3F1ZXVlX3Jl
c2V0LCBpdCBjbGVhcnMNCj4gYWxsIHZpcnRxdWV1ZSBpbmZvcm1hdGlvbiBvbiBRZW11IGVuZC4g
U28sIGFmdGVyIGd1ZXN0IHJlc3VtZXMsIFFlbXUNCj4gY2FuJ3QgZ2V0IG1lc3NhZ2UgZnJvbSB2
aXJ0cXVldWUuDQo+IA0KPiBTZWNvbmQsIHRoZSByZWFzb24gd2h5IGRpc3BsYXkgY2FuJ3QgY29t
ZSBiYWNrIGlzIHRoYXQgd2hlbiBndWVzdCBpcw0KPiBzdXNwZW5kaW5nLCBpdCBjYWxscyBpbnRv
IFFlbXUgdG8gY2FsbCB2aXJ0aW9fcmVzZXQtPnZpcnRpb19ncHVfZ2xfcmVzZXQuDQo+IEluIHZp
cnRpb19ncHVfZ2xfcmVzZXQsIGl0IGRlc3Ryb3lzIGFsbCByZXNvdXJjZXMgYW5kIHJlc2V0cyBy
ZW5kZXJlciwNCj4gd2hpY2ggYXJlIHVzZWQgZm9yIGRpc3BsYXkuIFNvIGFmdGVyIGd1ZXN0IHJl
c3VtZXMsIHRoZSBkaXNwbGF5IGNhbid0DQo+IGNvbWUgYmFjayB0byB0aGUgc3RhdHVzIHdoZW4g
Z3Vlc3QgaXMgc3VzcGVuZGVkLg0KPiANCj4gVGhpcyBwYXRjaCBpbml0aWFsaXplcyB2aXJ0cXVl
dWUgd2hlbiBndWVzdCBpcyByZXN1bWluZyB0byBzb2x2ZSBmaXJzdA0KPiBwcm9ibGVtLiBBbmQg
aXQgbm90aWZpZXMgUWVtdSB0aGF0IGd1ZXN0IGlzIHN1c3BlbmRpbmcgdG8gcHJldmVudCBRZW11
DQo+IGRlc3Ryb3lpbmcgcmVzb3VyY2VzLCB0aGlzIGlzIHRvIHNvbHZlIHNlY29uZCBwcm9ibGVt
LiBBbmQgdGhlbiwgSSBjYW4NCj4gYnJpbmcgdGhlIGRpc3BsYXkgYmFjaywgYW5kIGV2ZXJ5dGhp
bmcgY29udGludWVzIHRoZWlyIGFjdGlvbnMgYWZ0ZXINCj4gZ3Vlc3QgcmVzdW1lcy4NCj4gDQo+
IE1vZGlmaWNhdGlvbnMgb24gUWVtdSBlbmQ6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Fl
bXUtZGV2ZWwvMjAyMzA2MDgwMjU2NTUuMTY3NDM1Ny0yLUppcWlhbi5DaGVuQGFtZC5jb20vDQo+
IA0KPiBKaXFpYW4gQ2hlbiAoMSk6DQo+ICAgdmlydGdwdTogaW5pdCB2cSBkdXJpbmcgcmVzdW1l
IGFuZCBub3RpZnkgcWVtdSBndWVzdCBzdGF0dXMNCj4gDQo+ICBkcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfZGVidWdmcy5jIHwgIDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2Rydi5jICAgICB8IDM5ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5oICAgICB8ICA1ICsrKw0KPiAgZHJpdmVycy9n
cHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2ttcy5jICAgICB8IDM2ICsrKysrKysrKysrKysrKystLS0t
LS0NCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jICAgICAgfCAxNiArKysr
KysrKysrDQo+ICBpbmNsdWRlL3VhcGkvbGludXgvdmlydGlvX2dwdS5oICAgICAgICAgIHwgMTkg
KysrKysrKysrKysrDQo+ICA2IGZpbGVzIGNoYW5nZWQsIDEwNyBpbnNlcnRpb25zKCspLCA5IGRl
bGV0aW9ucygtKQ0KPiANCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==
