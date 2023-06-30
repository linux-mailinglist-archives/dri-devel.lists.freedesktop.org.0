Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93524743606
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 09:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805FF10E0DE;
	Fri, 30 Jun 2023 07:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4AD10E0DE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 07:43:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLsl1gBfRsD/5YtfE4EmlKB7GzsjTooqE7TqVD7kSDwaVJA3B16WJZsj5FkBjvHBnWDERfbpNyvjjJwjrXF5uUcUj7TeGGl7Wipt476UGGJvbQJrpHCghmw/na+4UllbdcjV6H3X/xuqeqOI2Iwrb2reAObvYlVQZ/T3+D6Nh+rI6uyOmOafrfNEA+rJfxI2taCjkdLIV7LBLSB7WexZkkGjZyHggA2bF9jGloLiIrPNoffifuHiBIHiBIyilYKfVq98wgd2tXuUsRyir0gGVOdJWZiSXXZpn9ZcJ8bbKP+/ncx5SUgcZcMLaEjNn8PjWGE3/q3eqLFNxDrVZ/1CxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwekAohhQ/d149vmOGBSxkHtg/kQ2EDgO2zuwStEuQ0=;
 b=GzGPcuWFK83eI+jo8F+m4XldsX14tW+97C4qIXRKKRkH3p28CJM7fIu3zIeY+nSRCBWDQMLQJRfGhd/3C/f9MzZRkH3+gDlZIR/tKpyzYe6BylqjEvN0Aw3NJHL0Qzb+Fz21zQiCHRjfC9W/anmxfHjta8alSgANeiyitGrEjIW3PWQ2MrHktMApEkGlPuAwxOp1kGVf4CcPP/syOdkvfOz7/zjomWqajNYFtmjrfFQByH7gMjES4kn3BaIFZiTn9tuaCzSssylxYXkJ/3UYjcbT5cZDRp75nUW7ozy1cXMg3ERiqxE/KOX9TcjCL+DtEqzkIrPXdJt1ZWaYdtM08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwekAohhQ/d149vmOGBSxkHtg/kQ2EDgO2zuwStEuQ0=;
 b=q7aVGLF6AFxulJ2Hiij7N0OcPC0edIIskGFr4BYfQELASK0D7vV36ihnStNYDSM/C9wJGW91nmdl9UQu5JV7GXC4RjHlqFYPHWBkSwRLz9dgL/SmaFt1Y3q8D/0gWFhXwYbCxLiaV+ITNQVzOvzHvz+nzcqKMlimqyp/3cOgZq0=
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by IA1PR12MB6233.namprd12.prod.outlook.com (2603:10b6:208:3e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Fri, 30 Jun
 2023 07:43:38 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::4ef5:2244:743b:9989]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::4ef5:2244:743b:9989%4]) with mapi id 15.20.6521.023; Fri, 30 Jun 2023
 07:43:38 +0000
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>, Gurchetan
 Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, Juergen
 Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
 <roger.pau@citrix.com>, Robert Beckett <bob.beckett@collabora.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [LINUX KERNEL PATCH v2 0/1] add S3 support for virtgpu
Thread-Topic: [LINUX KERNEL PATCH v2 0/1] add S3 support for virtgpu
Thread-Index: AQHZqyVzGB+OORTmhkSScAPReBq7D6+jfGOA
Date: Fri, 30 Jun 2023 07:43:38 +0000
Message-ID: <BL1PR12MB5849C88BE41A4AB34522FE86E72AA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20230630073448.842767-1-Jiqian.Chen@amd.com>
In-Reply-To: <20230630073448.842767-1-Jiqian.Chen@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-imapappendstamp: MN2PR12MB3037.namprd12.prod.outlook.com
 (15.20.6544.003)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|IA1PR12MB6233:EE_
x-ms-office365-filtering-correlation-id: bf35a828-f881-4940-9b0f-08db793db777
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FhCxXjPrny9CziiQ8wS9xscuZrD/n8HsH5ICIYdK+hrrDYay2vC1bbciSqr9b8ZhwTH7x/Mf3wtiVEJxm7XRViEvhFgRK7qs8TeSUX+ZE9AcLVdhPyBoILZFbYBDqmU5rGuhi2YYwzObtANE8eGjQfwArJJJEl3iOYsDK9/xUNcbIgB3OXHYj808ebtvgOoH7FYByYyo8W7F8hI2RDMZcQQyJtmUzok8vpDIZRcvarDLi6zyKL8eIzolUGKvbp1ZWWGrVmOtpW1zzKflpqyrNBgIID2FXrvhfBTSvQrzInhNdC4oB8yPmDnqXQykTAwdqhRZa9AsLR2T0f8mm7Wrn3MF5UujUOy3ENJWf2Rs2EBg9izzIitQzwSHSd6NTOW2vxIOzOv+B7oVIhd3n/LFEQtcg6LY8KYN2n9vf6f7R7LPAoRv77zZfD8IxTxhnQNmCk0XFSKVEN2LSEqWTOkKS3ZMIoly/5uXeN0kjKgHrNvUvDGB3srnyebqFm+VDUILx0iAwXMcybu1QETWXO0UioF7wbCz4EQ1mQ0TgpOoDv6XkwXOXebWtwipPKirX3hIbwHI/0DSdE/GbA//EedYagIXObD02TqLKKT4gmzE9rdgoasXq6duny/y1x8QpCjS8v7Q9VCnIwFM3T989t8wVrqo3H/8N0ZUALKEOkwnHaY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199021)(2906002)(186003)(54906003)(55016003)(38070700005)(966005)(4326008)(316002)(8676002)(33656002)(478600001)(110136005)(7416002)(7696005)(921005)(122000001)(38100700002)(71200400001)(8936002)(66476007)(9686003)(5660300002)(41300700001)(66946007)(66556008)(66446008)(83380400001)(76116006)(64756008)(52536014)(53546011)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TmEwaEllME95bml0T0JXVzZLeFM2UW1IRnBwSEVtUE1GTEl0VDNoUlpoL0Mz?=
 =?utf-8?B?aFFLME5DMEFYNDFqZ1pyd3pseUI5RGRhc3J4MUNMR0x5anNaOGZrK2NXRnFv?=
 =?utf-8?B?VHZaaGxRaHpDeW1NWUIzWEFSZjFHUDF5Y1VrVGFIV0MrZTFlcHV5djJ1MEVZ?=
 =?utf-8?B?V3hqTkxhYXcvYWk0Wk43bG05ajRnNzhSRGlmd3FVUXF0dWw4N2ZXRS94L3Jx?=
 =?utf-8?B?QXdQdjZRdkhyODN6S0ErQjlob1dnTmVVNVVNdlRqSXNScldnRFdUdHpFYW5q?=
 =?utf-8?B?Sk1iZUJYQTVmU0NYZUNIeURsdFNUOE1GbmRQUVo5c1N1K2czZzB3QlJmS3Y5?=
 =?utf-8?B?aEJWdUV1SzJ4cE0rMUkreVBBMlc2Q3NKRmZmdG1UZ2E1Y2NOZXM0L0hvc0Uz?=
 =?utf-8?B?ZENZbjNPQk1NQlRCeUR0UytLRjJjUS9yN1lFZWptQ0FCdEkyRHQ1elRxYldM?=
 =?utf-8?B?Qk5oTWtlQ3A0b3MwZWtDeWU4VnVZa1E1ek5teTZ5ckI1Z3NlS0U3alkxL2Nr?=
 =?utf-8?B?REdVV3V3aWduUzBGa3NZN3lEYTcrSC90WWpVRjlTbXZqZkVCWkRvMEhCVjdm?=
 =?utf-8?B?SmVJS2lHZUNxK1NISko1RE1Oekg1NFpkYzc3S01lQUdFdldnWTkydkVQQnF4?=
 =?utf-8?B?RVd3MXhCaTQ2ZHFnTmU0OVJoTjBvRTIyblUrMjZKMWxRNytMQ045Y1NvSkl3?=
 =?utf-8?B?aytrZGJJc2NBRUFiNnpnQWsvOW5BOTYrR3d6bHhrRTYvN2srVExsWFNPVG1G?=
 =?utf-8?B?SEw5T3REWGEybTZwa0pRMUJaSnp0YjlkM25CYWhHUTN0Sm9NZ0EvWk5oZmdu?=
 =?utf-8?B?WnVRUGZFQW5qenFnSC9ZU1VoZFJ2Z04xcGx1bFBrUmVHVXBtVE5JQzFVSlla?=
 =?utf-8?B?Y2hkVlVmYWtzU2JTM2pvMGMzZFdLQkg3akZYQkFZRVMyNTlXRmtJamdnd1Ry?=
 =?utf-8?B?OHlOUDFsQWdLa0xaeXdqVzI4WlM5Z1V0RmlIanUwT0xlY1NiQityM2tWS3pV?=
 =?utf-8?B?RVExcDMyNzQ1dHlUSGQ4clRVZFI0cFdBbTBvNW9IQUxYNThFeW45dG9pMitE?=
 =?utf-8?B?VFBmdEFjbWRIVDh1c3U3Tlc0UHh5YUlkTmhuWUxCdk1MYjQ0N1VtOGpVYTZr?=
 =?utf-8?B?U2x5VFJ3eFJBaVMyNUNWV0lpbkFKYUNOMFhkbzNybVA2dHcwZ0MwSXlOS1lh?=
 =?utf-8?B?YzZkS294U041cE53TklMS05KUjFkbVJBcGFQRnNBMjhXUlkxYTVlQnhubXRG?=
 =?utf-8?B?QVhWRjJIZTZVQnpRVHZMODNDQmo4NW53Rzk4ejJ0UGIwd2lYak1sbFM2d0dx?=
 =?utf-8?B?dTNSK29CUGJPL2NiMHhadUo1eXJycGpxeHoydXlFcnRXNVJhMzJNazQ1SnNx?=
 =?utf-8?B?WjRPbVBpT3VTNEVxeG1pQlNNa2NQUTIvTFZQMnh5Y3JkZWIxQWFKQmp2YjFy?=
 =?utf-8?B?azNWdUlQczZ4NG9mUk9sQ0JDNWRTajNYY3M5S01rTXVkV2x5dEQ3U1NML25h?=
 =?utf-8?B?dWdicXhKYzJxdWhUK2FjRlBNRnROQ1c0aTJ2QkcrL3FrSUIxVzAxaW9UOVlI?=
 =?utf-8?B?VHJYQThFQXNicFFqRDdIa1podVgyV1UyMFp0N1ZRRTlrTEh6VUNXTlh2VURj?=
 =?utf-8?B?SUI0d2RSZ2hnenBUSks3Nk45MEZkOGlpaUYycllLNU1BV044d0ZpenZRTHpZ?=
 =?utf-8?B?T0J5alRwQmU0ektEMjhrbGFLaW5BYjlydzdudnlGcGVRbDdLUWdodStFMUJU?=
 =?utf-8?B?YVEvcmxrSG1BT2g0amxRSjBlaHZXK2x4UzZ6bkJGVnpiOWxib01ta0RLdzc2?=
 =?utf-8?B?NFBKU2xnTGpONWtza3BNY1I1cjF0c2xRVEl2WTBWZzNZNDh3MnNRY2puS01W?=
 =?utf-8?B?WTR3aHY2Z0RMTWtBQWplKzBmNmpSc2FibC95OEh4SCsybGtNakx3RVoybFpY?=
 =?utf-8?B?UE4vRGU2Q1JRUjJSRjNVWkNVUk5jZjZiQ2t0VVJYU2JSUSswN0dsdVFGOU1a?=
 =?utf-8?B?Z0ZVUXBUMURNa2ExY2VhWkhmVVBQeEZNa1FjMys1U1MzM2dZSFB6RlRJMmZ4?=
 =?utf-8?B?ZkQ2VUhMR3Y3OEFlRzVvanloK1h4WDFjTy9rUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CCE5699A73DCA4585881E8F4245D2F5@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf35a828-f881-4940-9b0f-08db793db777
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2023 07:43:38.0216 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: APvwVzgqnYygo5u6Gs3zOqNk6IZ9nTFFMCRWp7ZsyUrA2VFmkBtgG/ZzrG3zeHGH6cdQyZm/v4CkZhq13NxkCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6233
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
Cc: "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Hildebrand,
 Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>, "Chen,
 Jiqian" <Jiqian.Chen@amd.com>, Xenia Ragiadakou <burzalodowa@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLA0KDQpWMiBwYXRjaCBvZiBrZXJuZWwgaXMgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDIzMDYzMDA3MzQ0OC44NDI3NjctMS1KaXFpYW4uQ2hlbkBhbWQuY29tL1QvI3QuDQoN
Ck9uIDIwMjMvNi8zMCAxNTozNCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+IHYyOg0KPiANCj4gSGkg
YWxsLA0KPiANCj4gVGhhbmtzIHRvIE1hcmMtQW5kcsOpIEx1cmVhdSwgUm9iZXJ0IEJlY2tldHQg
YW5kIEdlcmQgSG9mZm1hbm4gZm9yDQo+IHRoZWlyIGFkdmljZSBhbmQgZ3VpZGFuY2UuIFYyIG1h
a2VzIGJlbG93IGNoYW5nZXM6DQo+IA0KPiAqIENoYW5nZSBWSVJUSU9fQ1BVX0NNRF9TVEFUVVNf
RlJFRVpJTkcgdG8gMHgwNDAwICg8MHgxMDAwKQ0KPiAqIEFkZCBhIG5ldyBmZWF0dXJlIGZsYWcg
VklSVElPX0dQVV9GX0ZSRUVaSU5HLCBzbyB0aGF0IGd1ZXN0IGFuZA0KPiAgIGhvc3QgY2FuIG5l
Z290aWF0ZSB3aGVuZXZlciBmcmVlemluZyBpcyBzdXBwb3J0ZWQgb3Igbm90Lg0KPiANCj4gVjIg
b2YgUWVtdSBwYXRjaCBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsLzIwMjMwNjMw
MDcwMDE2Ljg0MTQ1OS0xLUppcWlhbi5DaGVuQGFtZC5jb20vVC8jdA0KPiANCj4gQmVzdCByZWdh
cmRzLA0KPiBKaXFpYW4gQ2hlbi4NCj4gDQo+IHYxOg0KPiANCj4gbGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGttbC8yMDIzMDYwODA2Mzg1Ny4xNjc3OTczLTEtSmlxaWFuLkNoZW5AYW1k
LmNvbS8NCj4gDQo+IEhpIGFsbCwNCj4gDQo+IEkgYW0gd29ya2luZyB0byBpbXBsZW1lbnQgdmly
dGdwdSBTMyBmdW5jdGlvbiBvbiBYZW4uDQo+IA0KPiBDdXJyZW50bHkgb24gWGVuLCBpZiB3ZSBz
dGFydCBhIGd1ZXN0IHdobyBlbmFibGVzIHZpcnRncHUsIGFuZCB0aGVuDQo+IHJ1biAiZWNobyBt
ZW0gPiAvc3lzL3Bvd2VyL3N0YXRlIiB0byBzdXNwZW5kIGd1ZXN0LiBBbmQgcnVuDQo+ICJzdWRv
IHhsIHRyaWdnZXIgPGd1ZXN0IGlkPiBzM3Jlc3VtZSIgdG8gcmVzdW1lIGd1ZXN0LiBXZSBjYW4g
ZmluZCB0aGF0DQo+IHRoZSBndWVzdCBrZXJuZWwgY29tZXMgYmFjaywgYnV0IHRoZSBkaXNwbGF5
IGRvZXNuJ3QuIEl0IGp1c3Qgc2hvd3MgYQ0KPiBibGFjayBzY3JlZW4uDQo+IA0KPiBJbiByZXNw
b25zZSB0byB0aGUgYWJvdmUgcGhlbm9tZW5vbiwgSSBoYXZlIGZvdW5kIHR3byBwcm9ibGVtcy4N
Cj4gDQo+IEZpcnN0LCBpZiB3ZSBtb3ZlIG1vdXNlIG9uIHRoZSBibGFjayBzY3JlZW4sIGd1ZXN0
IGtlcm5lbCBzdGlsbCBzZW5kcyBhDQo+IGN1cnNvciByZXF1ZXN0IHRvIFFlbXUsIGJ1dCBRZW11
IGRvZXNuJ3QgcmVzcG9uc2UuIEJlY2F1c2Ugd2hlbiBndWVzdA0KPiBpcyBzdXNwZW5kaW5nLCBp
dCBjYWxscyBkZXZpY2Vfc3VzcGVuZCwgYW5kIHRoZW4gY2FsbCBpbnRvIFFlbXUgdG8gY2FsbA0K
PiB2aXJ0aW9fcmVzZXQtPl9fdmlydGlvX3F1ZXVlX3Jlc2V0LiBJbiBfX3ZpcnRpb19xdWV1ZV9y
ZXNldCwgaXQgY2xlYXJzDQo+IGFsbCB2aXJ0cXVldWUgaW5mb3JtYXRpb24gb24gUWVtdSBlbmQu
IFNvLCBhZnRlciBndWVzdCByZXN1bWVzLCBRZW11DQo+IGNhbid0IGdldCBtZXNzYWdlIGZyb20g
dmlydHF1ZXVlLg0KPiANCj4gU2Vjb25kLCB0aGUgcmVhc29uIHdoeSBkaXNwbGF5IGNhbid0IGNv
bWUgYmFjayBpcyB0aGF0IHdoZW4gZ3Vlc3QgaXMNCj4gc3VzcGVuZGluZywgaXQgY2FsbHMgaW50
byBRZW11IHRvIGNhbGwgdmlydGlvX3Jlc2V0LT52aXJ0aW9fZ3B1X2dsX3Jlc2V0Lg0KPiBJbiB2
aXJ0aW9fZ3B1X2dsX3Jlc2V0LCBpdCBkZXN0cm95cyBhbGwgcmVzb3VyY2VzIGFuZCByZXNldHMg
cmVuZGVyZXIsDQo+IHdoaWNoIGFyZSB1c2VkIGZvciBkaXNwbGF5LiBTbyBhZnRlciBndWVzdCBy
ZXN1bWVzLCB0aGUgZGlzcGxheSBjYW4ndA0KPiBjb21lIGJhY2sgdG8gdGhlIHN0YXR1cyB3aGVu
IGd1ZXN0IGlzIHN1c3BlbmRlZC4NCj4gDQo+IFRoaXMgcGF0Y2ggaW5pdGlhbGl6ZXMgdmlydHF1
ZXVlIHdoZW4gZ3Vlc3QgaXMgcmVzdW1pbmcgdG8gc29sdmUgZmlyc3QNCj4gcHJvYmxlbS4gQW5k
IGl0IG5vdGlmaWVzIFFlbXUgdGhhdCBndWVzdCBpcyBzdXNwZW5kaW5nIHRvIHByZXZlbnQgUWVt
dQ0KPiBkZXN0cm95aW5nIHJlc291cmNlcywgdGhpcyBpcyB0byBzb2x2ZSBzZWNvbmQgcHJvYmxl
bS4gQW5kIHRoZW4sIEkgY2FuDQo+IGJyaW5nIHRoZSBkaXNwbGF5IGJhY2ssIGFuZCBldmVyeXRo
aW5nIGNvbnRpbnVlcyB0aGVpciBhY3Rpb25zIGFmdGVyDQo+IGd1ZXN0IHJlc3VtZXMuDQo+IA0K
PiBNb2RpZmljYXRpb25zIG9uIFFlbXUgZW5kIGlzOg0KPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9xZW11LWRldmVsLzIwMjMwNjA4MDI1NjU1LjE2NzQzNTctMi1KaXFpYW4uQ2hlbkBhbWQuY29t
Lw0KPiANCj4gSmlxaWFuIENoZW4gKDEpOg0KPiAgIHZpcnRncHU6IGluaXQgdnEgZHVyaW5nIHJl
c3VtZSBhbmQgbm90aWZ5IHFlbXUgZ3Vlc3Qgc3RhdHVzDQo+IA0KPiAgZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X2RlYnVnZnMuYyB8ICAxICsNCj4gIGRyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9kcnYuYyAgICAgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysNCj4gIGRy
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaCAgICAgfCAgNCArKysNCj4gIGRyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYyAgICAgfCAzNiArKysrKysrKysrKysrKysr
Ky0tLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgICAgICB8IDE1
ICsrKysrKysrKysNCj4gIGluY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fZ3B1LmggICAgICAgICAg
fCAxNSArKysrKysrKysrDQo+ICA2IGZpbGVzIGNoYW5nZWQsIDk5IGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pDQo+IA0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K
