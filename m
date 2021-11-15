Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4766450A66
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 18:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E08A6EE6F;
	Mon, 15 Nov 2021 17:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C756EE6F
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 17:00:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fv66fy7dirtGY96kdoc98D35Rr3AaJco7sVgO49SBj37MwGLSMPwwmWr9W4ihUtnseyOKv8N0luh3ClzJwv6RpkMrXSr8mnIBoKT4DO1+ZVFOuwU2LzCObCoyx2uptMElcjmNdU7MORvTY3cjs6/xrpZ0bXaj861h3eMH0Xc/XjTfc7cmAYYnljFzHelmMALCUlBePp4eFEMPhr2tifWHBb4nRG9lMZMs35i3HpWF+y7idli154p73XNV13gbE/ZjulMJyTtSdXsXz3pJd0QBkL7tvfP705NL+x5PJuLnlcCEpFH41Uu0y9ROMtWrbgsccRmRpYidMg4U5xoE/om1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbykPfisPFA/RQQ/6wnbYefwl1pwCR4u7p7E+oxCor4=;
 b=BjUJb0qz5lIUPGwigZOb7LF72YRpdDM33fb86KFCDZCK3Cs70HdrvNvaEr6WkbUMf32EEcDJcQbsDBYVNU32QxR1tiL9MBAoddVPNuXmOXFu1bL6HeIlJD7+oXND+6fLBdyTlsTOoJIPcp6wK/AUifhuzj1dhn0YaZJLLKPsZJpbHBjfd05g0EHm9O6N7RbpJF9BlExt3t2z5qJ6e3dzSN+x7M1B7ktQYwxt3I27IqflSANeSmm2T1AqRI2A8a6GvJy8WCpxLJ33Phl/lKARAx8ze2Cwym4b4fj8ko5RFb1ya5uY6aFWHhcgi6iPQAmu81iTt3gt4Amp50FpiQiPTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbykPfisPFA/RQQ/6wnbYefwl1pwCR4u7p7E+oxCor4=;
 b=Sfl6mS7F3ioF8eLAf7uc3XmstAa/9IB0QI/AXMka5wmRkZofU2oiat274n+9ftF88LDPkLFTXdtwMoRKVLv4+X4sCxZ66EmX7jw+X32QRwMWC0fNfsV7WJvBJ1LbP0V9UASar2sW8ehYgsMopD7mkOmAaxMH4XsKEjitbOd/bk8=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6368.namprd05.prod.outlook.com (2603:10b6:208:e2::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.17; Mon, 15 Nov
 2021 17:00:44 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::4975:27e1:d774:269c]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::4975:27e1:d774:269c%3]) with mapi id 15.20.4713.019; Mon, 15 Nov 2021
 17:00:44 +0000
From: Zack Rusin <zackr@vmware.com>
To: "airlied@linux.ie" <airlied@linux.ie>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "christian.koenig@amd.com" <christian.koenig@amd.com>, 
 "ray.huang@amd.com" <ray.huang@amd.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, Linux-graphics-maintainer
 <Linux-graphics-maintainer@vmware.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "mripard@kernel.org" <mripard@kernel.org>
Subject: Re: [PATCH 2/3] drm/vmwgfx: Copy DRM hash-table code into driver
Thread-Topic: [PATCH 2/3] drm/vmwgfx: Copy DRM hash-table code into driver
Thread-Index: AQHX2iAdeqTHPr7ok0GUbH6lNct0v6wE0GaA
Date: Mon, 15 Nov 2021 17:00:44 +0000
Message-ID: <d945d7699b79be95c21e5c3674fe270a95336543.camel@vmware.com>
References: <20211115125539.1730-1-tzimmermann@suse.de>
 <20211115125539.1730-3-tzimmermann@suse.de>
In-Reply-To: <20211115125539.1730-3-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ac0d3c3-faa0-4690-ba02-08d9a859769d
x-ms-traffictypediagnostic: MN2PR05MB6368:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB6368BF350BD0878D72ED988DCE989@MN2PR05MB6368.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l33YuRXAECbyh2v7PyWJlzLdmXG3KunQSnTdQBOcv0U4MaovjrLYcKOaX5IyCCfTb2Ay8tR/FCKYmHSclc+Skj9bjmxndX52tq8cbS0ijREeD7atv6kYvEtOEF0fjZ8nc4nEwf1mTyMbjhxnMrF57/LBwQ/WSzKNBRgbh7GJ1z5r19dtKO5sN7+DaYLNZWF6mBfHIVt+4Jk4hIJbz8Rn4aMqpU+VVgfuOIwhkVE93UD5fUS1rP9NKnhyY9qq8ZxMXHGVLbRN0v0lCWw7GCTVcauVRkfE/QgaA+isTQX+C7vxG1W0CUALlTdpqknqJnvGmwb3P2n7rJpmpkYu5krBwEwz+dRQLCyJUdXUwOIltZVZQol3onsZ/eQO4Gwv+Ue48mFoy0dOVb6kydSlrpIRj7TKVw1/E7JYEyvs6nOaBXo6tAf4Ys8FymB449jKMDmyHIvBDR1TsLEJ/fU2Ln9fLXSJL5Xn1ML/sS+XLdJI7E+9S7o3b9Pf/Y9cgFVr/UPLC3+CjaY/k+Vljeb3jeuUTpaPHe/HgDXixUPkeOMRFVSo5tflFPb13lNclxcUQtSkNA7AlV7TimI5O0S6oTbd9JBqsp+QCdCxNBo1r64BiksgZluJwqxMIsLbHHn0fJdKrbkm337HbDoAmnCzeml6+oRwDVifOj02+orj8GigO9GQYM9isZMqaM6v3FXZEASuCjUxiLAEron6U2zHEsHhDg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(4744005)(38070700005)(76116006)(71200400001)(186003)(316002)(6486002)(66476007)(5660300002)(2616005)(66556008)(8936002)(86362001)(110136005)(66446008)(4326008)(66946007)(8676002)(26005)(64756008)(2906002)(36756003)(6512007)(4001150100001)(6506007)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clZjSzNTbWpadU5GOW9HVXFBMFNERFV4MUhZMk9qcm53bU5VK0hUTmYyQ3oz?=
 =?utf-8?B?RkcwTThMVWdia0x5ajNmTjlicjdENlRnYlQ2dDVLaFZHVnIwK0JmMG4rbGFv?=
 =?utf-8?B?QXhzUlFmdGV2bzFqSGVVaVdWVVdCcC9iQXZTWFNkMnhZM3hXdG5tTnByZzBN?=
 =?utf-8?B?YURnaVIrS0xYMzc2S3FpU2t3T1ZLZEdLZFpYTHhhMUhOdTZpK0JoNVlYcURn?=
 =?utf-8?B?TkxFL0x5a2VEaFdGM01iTDlLQldzbXIwdlY3bGNrckVwdFRjZ2RmWVZlODBm?=
 =?utf-8?B?R2IzWHlKMTVTdXYzZ3AzTUFmTTB3Q3VvNng2cmwzVnQ4V0swc1lFRlVPTERH?=
 =?utf-8?B?bmI0eUd1WEZMVE9UQys2Q1pZRncySWpBdlZJZWVFSmszR3NZL1o2UkJQaFJG?=
 =?utf-8?B?ZW56ZUVYbmFrek1KN0F2RjdhSUJXNkJtaG02d1Q5ckdlTGVESnBmb3QwMUVq?=
 =?utf-8?B?dnplYVo3YXZBMFdCemVodVZDb04xZ21WVk56a1ZTcEdzd1RIYWwzbkJNbUcr?=
 =?utf-8?B?U1Jjei9EQ1hXRUVLeEFneU1XaDB5VkdLOWpKK2JSOEpzMWJnMW1EbVVHcjE2?=
 =?utf-8?B?dXVFbmNyaHVxMHJMcE1DSi82Q2VnVlJRUFdPeUszbG1TKzBjWG1Ya0QwQkxS?=
 =?utf-8?B?eGpSOHNZZmpnWVlPeDQvRDRTM1crS3NIK0lRRUpuZzRNemdISzdZK1RjMlUx?=
 =?utf-8?B?dWhublNhbTd3RlZ3bDFTMGgveVptVTB4TmpDQ0xFenZqT1J5eis4cHh4Z2Nq?=
 =?utf-8?B?MmtHOE5iVEg0eXFJR2UzRDVDeTlJcXBlbVVob3pXd0JIamFiSjZ1ZUZJUmU5?=
 =?utf-8?B?Z2RVQUZtR2VBK0ROSEZ1dUFzWERsRkV4MjU4WHhoMURmUktEaHRpaVVuQTRW?=
 =?utf-8?B?bXpObHV0OWZUMnZ3dzJlSjR3MjNMOFNwa0d6NUM2NGRwUHRCVTlYMG9NR2Na?=
 =?utf-8?B?WGI2bXcvbXdGN3o0YU1OVlkzRHhmekEzRHI0VzdWZDUvY3FnY2JzMnN5ZFZJ?=
 =?utf-8?B?QWhteWNITG1GbjYxdFZHbGJwa0xaTjJpQWpLSVczbkV6cGFsMjBibjRMQWxS?=
 =?utf-8?B?M1AzRUNjandhMjVEZ2Q3UCtyai9jUUdDNm1iRDRzUFBHN3hkL0RXSnBvcWVv?=
 =?utf-8?B?MGloSmJRdXF6Mm9WNFVTZFR1cW4vRnlpWnBUMlZOdm80QUZ3Q2k3elB6RmJs?=
 =?utf-8?B?SGhSNE0rbUlGTHdRUHQyUHlaelF6WkhlR3FJYVJqWDM5ZFlFQ044K0VCMDQ5?=
 =?utf-8?B?OHlvUlVBV29oSElZajRxNXI1TU5xZmpESlVCTGxnSDBxd3U4d0lvS3NoTk84?=
 =?utf-8?B?aDNSSHV4bitSWWRaaGNwT2xxZUZNZzBLWmZlVno2SmswSkt1VXJna3JxeUNx?=
 =?utf-8?B?VEdBZ0VoNGhCRWtwVk56K0lRbTF5T2hwa01nRDdMOS9BYlNFT0gwSlFvT3Nq?=
 =?utf-8?B?OGNpZ2pFZ3B1MFB3cE8za2ZaTytrdlVadlNYTHFudi82d0pzUnhma3RSYmFw?=
 =?utf-8?B?L3NoVFUraHVOWWx3bjNYQ2U5d2l2aUxxSUQrampDTVB3eDZVMitVMGRraEZU?=
 =?utf-8?B?QXNudDF0V1VCcDM4dEMwZW1LaG5QeE5JTGtQcmhHWnpVK2NoVGJyWFJDaHM3?=
 =?utf-8?B?ZzRZSWpnUmYwNUxwazN2SzFLaVRNWVBMRXl6WTVtUVpZTjJUa1l6R2Y5azEv?=
 =?utf-8?B?RlFHMWptT0NRWDgyRkxSQmdPVzNXT1lFVnpKZnVkT0M1VEVoQmF3cjRiaUph?=
 =?utf-8?B?a0hoMFZldlhlbEg0TW1SZ1lDNW05bWJucHB2OEVtd250bzN3QXk0UFJIUmlk?=
 =?utf-8?B?S3RtMlN6TUFPK1NIaDFJZzJ5dHdaM0pRVUtHTzJST2wwbnB2Nnd2VmhHNmMy?=
 =?utf-8?B?dDdMY2hwdHZ5am1Gc2JOTlpnMUNpZ05kVTJUcVlZZTRicFZzblhjVjdJYmxF?=
 =?utf-8?B?eDlpb3k1OGh3OW1YWElhOERkSE42b0ptQW9Xd1JtOVZGOUVnZ1BuYW9YbkJp?=
 =?utf-8?B?Unh4aUtodWl3L0U1ZU1MMk8xNlpKb0I3NDA3Y2QxZWFXNHg1OUZ6dnU2eUFJ?=
 =?utf-8?B?NVZrZ1g4S3IrcW1QblV6VFM3MTR5bGxFRWZvc3NJOGJFVWJjUTBEbnM1WDc1?=
 =?utf-8?B?K0JLdTFQc2NYb0k4ZDhFelM3bHhwbjN6dWx5R1JyaDRTQWdTYTU5amtJbjU1?=
 =?utf-8?Q?Jqy4saW4zG4pLIDOZOg5Bg4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D42D98BAF8383C4EB65B018B09B733E6@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac0d3c3-faa0-4690-ba02-08d9a859769d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2021 17:00:44.4790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jaert9b0WYgLuTOS4V0c7ogYhzzN7+KQ8ZjZrYqdKqFoS2yYI5gF7SLF84REz4hW6sgaN99rm3LrU3DSNuzWzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6368
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIxLTExLTE1IGF0IDEzOjU1ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gQmVzaWRlcyBzb21lIGxlZ2FjeSBjb2RlLCB2bXdnZnggaXMgdGhlIG9ubHkgdXNlciBv
ZiBEUk0ncyBoYXNoLQ0KPiB0YWJsZSBpbXBsZW1lbnRhdGlvbi4gQ29weSB0aGUgY29kZSBpbnRv
IHRoZSBkcml2ZXIsIHNvIHRoYXQgdGhlDQo+IGNvcmUgY29kZSBjYW4gYmUgcmV0aXJlZC4NCj4g
DQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4gSG93ZXZlciwgdGhlIHJlYWwgc29sdXRpb24gZm9y
IHZtd2dmeCBpcyB0bw0KPiB1c2UgTGludXgnIGdlbmVyaWMgaGFzaC10YWJsZSBmdW5jdGlvbnMu
DQoNClRoZSBjaGFuZ2UgbG9va3MgZ29vZC4gZndpdyBJJ2QgYXBwcmVjaWF0ZSBhIGhlYWRzIHVw
IGZvciBjaGFuZ2VzIGxpa2UNCnRoYXQgYmVjYXVzZSBWTXdhcmUgaXMgYnVpbGRpbmcgdXAgYSBr
ZXJuZWwgdGVhbSBhbmQgcmVwbGFjaW5nDQpkcm1fb3Blbl9oYXNoIHdpdGggdGhlIGhhc3R0YWJs
ZS5oIHdvdWxkIGJlIGEgZ3JlYXQgdGFzayBmb3Igb3VyIG5ldw0KdGVhbS4gSSBtZWFuIGl0IHN0
aWxsIGlzIGJ1dCB3ZSBjb3VsZCBoYXZlIGRvbmUgaXQgaW4gc3luYyAocmVwbGFjZQ0KZHJtX29w
ZW5faGFzaCB3aXRoIGhhc2h0YWJsZSBpbiB2bXdnZnggYW5kIHJlbW92ZSBkcm1fb3Blbl9oYXNo
KSByYXRoZXINCnRoYW4gaGF2aW5nIGEgdHJhbnNpdGlvbmFsIHJlbGVhc2UuDQoNCnoNCg==
