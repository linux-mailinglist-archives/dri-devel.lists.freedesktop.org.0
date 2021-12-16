Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48013476E27
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 10:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C26F89BE8;
	Thu, 16 Dec 2021 09:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F64C89BE8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 09:49:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNYoGnTK4kCfgZ1WMjxbWwAobCulat3x5yUvBZVU0SLr0lKm0DnFFHeMmhs8kJB28E/e3dIOCUeC0PfPldWBT1omgGxRsvbB4U+VDRZA1873GfLZbf+DvywoirQ7YShqFGfWers8wOo7Or+OlK6n40fAMvehfwa2yVw0NeQbVDxspidOx1XbpEFrrjNiopX2G3hBztpvERPN1cqJcy+Cjzs9KyU3l5lOGL3oYQF52F3K3RQ4vQuUJgB3wAbN1VVHqsdFhM8N0OKHnhPgJfvZplZEK0iAIH6ChTv+nBVHNn7tiuakWVwIj/CIBXT2IA6lm0vtIPKXOjURzOlNj2t7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7gdJdlyg6gkCsp8gMb6SKZZHUbSXha8FnrRmxNGEIE=;
 b=CRREIi0Q2c8gtIue/BtccQUO/AbOizFf/NaAiOhDaflbfvK5sDrTs7mh3NrbcM0k1rmMh3qpiTED8aaxvObdo8EgD2W1wbOLpKHXC7ErjEXGPgcVePmFmz0SNIOo6PU5CSn1ewdy3aRetoqzaA8tHZljPtX6rGjfE32RlgywbdG1KVU41wtF0uH3bqHjj4/SqDL/pVI3qJbS49TZDwoAetOSiWGkjtkSuckbkwQAZ3rj4kXrQVLA4nYYzDU7Bj+5yutFzWUIkhX08wYYe9tfX+IMj07m0M85klN3ZCgCjpmXps0L0ZcEpb+8arn/pwWXIGBMDfpisiUpcj7viRkT+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7gdJdlyg6gkCsp8gMb6SKZZHUbSXha8FnrRmxNGEIE=;
 b=A1WI9MBclMp5uMf9Zt8a6P+OXMNdwde+NOJiT7ye/q5XcacDfw9w4/Jk00FlkAXvnhVFEOgIdLiCMUym7rTs0uBtf87r2K/7mo1CgNV2dX66oYZKzKbPBeb8++/BbDX5WdkY2p4tiOkrF5jipu0VpIhbfOle5bOoExOoz5u7598=
Received: from DM6PR05MB7099.namprd05.prod.outlook.com (2603:10b6:5:14e::10)
 by PH0PR05MB7608.namprd05.prod.outlook.com (2603:10b6:510:24::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.7; Thu, 16 Dec
 2021 09:49:37 +0000
Received: from DM6PR05MB7099.namprd05.prod.outlook.com
 ([fe80::c993:36d9:61ce:7331]) by DM6PR05MB7099.namprd05.prod.outlook.com
 ([fe80::c993:36d9:61ce:7331%6]) with mapi id 15.20.4823.008; Thu, 16 Dec 2021
 09:49:37 +0000
From: Martin Krastev <krastevm@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Zack
 Rusin <zackr@vmware.com>
Subject: Re: [PATCH] drm/vmwgfx: Fix possible usage of an uninitialized
 variable
Thread-Topic: [PATCH] drm/vmwgfx: Fix possible usage of an uninitialized
 variable
Thread-Index: AQHX8e63nlT9M1SWTE6OKixvxQj7Iaw04JmA
Date: Thu, 16 Dec 2021 09:49:37 +0000
Message-ID: <fce7dee3ad3daa16e1f528d41618a6273942aa2e.camel@vmware.com>
References: <20211215200224.3693345-1-zack@kde.org>
In-Reply-To: <20211215200224.3693345-1-zack@kde.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.42.1 (by Flathub.org) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 828dec25-cecb-4434-033c-08d9c0795f9e
x-ms-traffictypediagnostic: PH0PR05MB7608:EE_
x-microsoft-antispam-prvs: <PH0PR05MB7608860ED5E33A0B64E312F1AE779@PH0PR05MB7608.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IA/RrfDryNQK7T4nMW7dNpnBBILkx15kz2RoAf7tt+h5lNW3+NyDPRFcYpE7WSDE9hX8PdwMcYQ3OhUCXMHR15+7lQTHeTaXzHrx3nQqLSL5yvO9sgYmtU0KsIv7w8lgk+lIVRd9qG+M+7MiKkFmupD69eEl7KiAGCTnaGiX3cfOL4f791/4NGE8WIqhwXdok+0Mq+xaGPdVdVhGE4dAmjZyBA9IumFKauDPN7qOqgoTmNG2ZaZt0VK9uYy0p2Nqk4TD3z59jRxkNW423ifFLDJmi7PilUT5jlsebD/pUX2qCTc1QQ5F5jAl4jNX8d0HsxgK/N/12o0AKVDicfID9uzX2OJcfPZyECVgQohBOUF68l2Nwu3CbbngkMyhYhF+e7TAoqFnWsCaaem0ylK8nO+24numjKNF9c0GfAvplAGZqngMMWqK0HQsfWG4wBsEvk1kQNai5nPZw7Gx+ZvG3yAot9butxUxOUvpWvLp5hJZwTA2uA13xkfskyEsl2qVc5de3pBJAVX9K/CdMM6kWleOO0HNGNRZekwvnW1MO30oI+X75CyImCDoAFqAe+Dqt+bumW1KMW7jV1dsRzJQ8iPKed3lMozKXljpcxdc/ZpBgawflsxvWjckoTzcvwKYPFh8NrAL6dFyKPNFy8GONqypbry9vp1LQGjgypQGBK+7/6jiTWRPkbN9DNjDi96cyjb71x4G/HDp04BVqCqxGw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR05MB7099.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(83380400001)(122000001)(2906002)(36756003)(64756008)(66476007)(4326008)(66556008)(5660300002)(8676002)(66446008)(8936002)(71200400001)(4001150100001)(508600001)(6636002)(76116006)(66946007)(91956017)(26005)(6486002)(54906003)(110136005)(316002)(6512007)(6506007)(107886003)(2616005)(186003)(86362001)(38100700002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkpOSERMREl5OGo3dWN0RXZSSm80d2VKbzNUQ2JnY2xBa3RBV3ZxK0tpdU1h?=
 =?utf-8?B?cEVSaUh2Zy9Lc25UVitvWXZsb21YQ1RyYmd4SytwR1VxSzB5N0tJQjZjMC9s?=
 =?utf-8?B?OUNqd1VadTBNeGVSd0plUzdOb1NnV3o1VnFJOTAxbms4Q0xCS0pRd0ZEYnJx?=
 =?utf-8?B?VGNYTDdaNTZpR3V1c2FMYU9HN3VmczNuMDk4NHc4Y2lWa2dKRFRNOTRnODU3?=
 =?utf-8?B?S21DTnhkdnV0RGFFMUxTRWJXVTBhRERZUFNEQStMN1l0ZUJMa3NFdGpXdEFv?=
 =?utf-8?B?QUNOTE9wdzhYZE41d2pMOVRVV0RpaDNlTlNidzNKaC90SG5rSFdVT0dYNUxl?=
 =?utf-8?B?aWlrSzh3REowZTBQcGQ0ODBDNXptNkNPdTZqY2U1WnR0T1dIbm9PUkY3ZjRN?=
 =?utf-8?B?M3RHaG9BSFJ1SUVncjhGYWRVRmxyVGJ1NVkyeGhFWlp0eEhHVENNU3E0dklY?=
 =?utf-8?B?d05MRXlZbE9ZUnZZVSsyRmN4N0htZWFzVVNjVnhVNUNpRjFyTzU1UDUrS2JK?=
 =?utf-8?B?SFVVZmx1WURRcDZKb3VBUlpJMnZyVE5vNDdkQm9kMW1VVHFwSUgvMzdJZXNT?=
 =?utf-8?B?SVU1TFpqZC9xOVQxaWF3YTRFM0RqRG1tZTQyaWZCVmp3eFlYT004T0xzaDRs?=
 =?utf-8?B?d1o3SlZLaVhQY0daS1hMQk9yclpHSEtIcTF5NzIwTE8xbTJKanhuNUVBSEZJ?=
 =?utf-8?B?T21nTUIyUXR6OWk4bDV6emZuTmx4UC9kUU5aWExuYS9LM01RSmZYU0REclF0?=
 =?utf-8?B?SW5wd1FmdWpLZlZrVC9YVlI4UlhhbUJ0di9Eak15aFc0cVEwMGxjeWJrMWtH?=
 =?utf-8?B?cTJOZ1kyb09Yc082RkFYbFA1THNpVW5LZGtyOFpKaVdLWEpBYkxGUnhVRVdw?=
 =?utf-8?B?Vzc1eU9Fd2p0ZTNKWmp0eTFlUGFwRzhzT2pRRjR4cmMrOHB2dkVobDFGdEcr?=
 =?utf-8?B?NTN5LzIrYWN3a1hyeGdnbFExQUlZYzNKLzQ4M01KV2pkMVFOKzNKSHJBY21P?=
 =?utf-8?B?bUJiaUlsMkE4cEQwVmpTS2xvS1NIZjZvYnlZY1lPbUJpNDhiN1JPVFBRVHg2?=
 =?utf-8?B?VTNPQlFPU1hpOFd4OFBtc0tTTkNQaEVkenN6aWNBY2hOWEN5ZENWWU5ZMGQ1?=
 =?utf-8?B?d0xjQUNGbEJZNTk1TExDYXIzMnUwanRrOXQ3dmpKUUprcVBHM3AvMkNXYlZC?=
 =?utf-8?B?RThOOGs1K3VmQjgvMkpMVk5JL0VCS0RhenpodFNuUForcGJVUmVUQTM1TnN4?=
 =?utf-8?B?c3dJN3E2bVFQeDhSUVJlb0djMGQxSHpPeGJpM0FxSmxkNW9zL0NuVi9rajFp?=
 =?utf-8?B?R2Nhanp5S2tWaERhUGU5RFZmcnJOY25KZUFKQ042TlVLWUhvUUw3ckVUTGlk?=
 =?utf-8?B?bTN0WVR3S1RwZ2pqRHR4a3dBcmJMd3paSWRTbndsT3Z0V3RDcGFMTU9SRDFT?=
 =?utf-8?B?UzdJWGdQdTJnUFo2aDFiTG9FR1hQak9FSXF3bUYrQkQ3eXdzdVJDTGlBazdT?=
 =?utf-8?B?dXpZL0VEVEVQODFLVEJRcDR3NGMwL2pnL2hicTlDdTBNZE1BcUdXVlZCQTlW?=
 =?utf-8?B?dmhTd1F3anltbkxjeWFnQVpwOC9aTy9hdklxdDZEQXNqTnZRVEpFUEwrbVRO?=
 =?utf-8?B?ZWhRNmlDbnBCTWh2SzRDS0ZGRmlocjhoUHlHakwrb0YrL2FveERFaDcyaFIz?=
 =?utf-8?B?MWdUdHV4NzB3RitTU2VCRTNyd3ZMdlFzSDZFWDkxYWVIZHpnWVpRUzFseWVD?=
 =?utf-8?B?M2l4d0x5alJzNHVUbjM5emZxSjdsNklaQmdsa0x0TG05dXRJcTN3bmZhVzBW?=
 =?utf-8?B?T0ZyWEVwZnl4WUdsL0VLdzYrdlI3UnJLYWlYSFErdmFQd2hkZ1U5T3BMb29B?=
 =?utf-8?B?NDJRdDNsdVVZYWo0ZHdDdFE0ZCtOK2I4Z3ZuUGFlelVoeHhQU2ZEWGRuNEd6?=
 =?utf-8?B?Tmt5WjllbkRSeWF1NEJXU283VTliUHdhUGxUOVdVK2FYaThSdzZNcEpGa29y?=
 =?utf-8?B?Z0VWaXZ5T09YRkM4NjRORmhpQnd1L3NtNXJUM3RqUG10c1RJK1l4NStKdUxP?=
 =?utf-8?B?Y2NhZUM5LzRJM0JtWExqelhWcFpEbkxWLytEVlhDZ0paWmdlcmdYSUR5NzEv?=
 =?utf-8?B?TU1oSXdEME9QSDNNK0xSODROajY5aCs3Zmo5MFNJYncxNUFXc2MvV0hqOU9j?=
 =?utf-8?Q?WG22bFTn4icIC2KeFYNObsA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEF47252D0A2C040A0721A76C86A5A05@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR05MB7099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828dec25-cecb-4434-033c-08d9c0795f9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 09:49:37.6465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0pnXHwqsgibUW89Hk/6hrdy5WWP42DcirD5B/ogWC8z9afbRuF+GJB+ahLCIJrET1v9SatMiT75SCp1xK9m8jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR05MB7608
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
Cc: Maaz Mombasawala <mombasawalam@vmware.com>,
 "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTEyLTE1IGF0IDE1OjAyIC0wNTAwLCBaYWNrIFJ1c2luIHdyb3RlOg0KPiBG
cm9tOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPg0KPiANCj4gdm13X3VzZXJfYm9fbG9v
a3VwIGNhbiBmYWlsIHRvIGxvb2t1cCB1c2VyIGJ1ZmZlcnMsIGVzcGVjaWFsbHkgYmVjYXVzZQ0K
PiB0aGUgYnVmZmVyIGhhbmRsZXMgY29tZSBmcm9tIHRoZSB1c2Vyc3BhY2UuIFRoZSByZXR1cm4g
dmFsdWUgaGFzDQo+IHRvIGJlIGNoZWNrZWQgYmVmb3JlIHRoZSBidWZmZXJzIGFyZSBwdXQgYmFj
ay4NCj4gDQo+IFRoaXMgd2FzIHNwb3R0ZWQgYnkgRGFuJ3MgU21hdGNoIHN0YXRpY2sgY2hlY2tl
cjoNCj4gICAgIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmM6NTc0IHZtd191c2Vy
X2JvX3N5bmNjcHVfcmVsZWFzZSgpDQo+IAllcnJvcjogdW5pbml0aWFsaXplZCBzeW1ib2wgJ3Zt
d19ibycuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29t
Pg0KPiBSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29t
Pg0KPiBGaXhlczogOGFmYTEzYTA1ODNmICgiZHJtL3Ztd2dmeDogSW1wbGVtZW50IERSSVZFUl9H
RU0iKQ0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMgfCA4ICsr
KysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5jDQo+IGluZGV4IDE1ZmVhZDg1NDUw
Yy4uMzFhZWNjNDY2MjRiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9iby5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMNCj4g
QEAgLTU2OCwxMCArNTY4LDEyIEBAIHN0YXRpYyBpbnQgdm13X3VzZXJfYm9fc3luY2NwdV9yZWxl
YXNlKHN0cnVjdCBkcm1fZmlsZSAqZmlscCwNCj4gIAlzdHJ1Y3Qgdm13X2J1ZmZlcl9vYmplY3Qg
KnZtd19ibzsNCj4gIAlpbnQgcmV0ID0gdm13X3VzZXJfYm9fbG9va3VwKGZpbHAsIGhhbmRsZSwg
JnZtd19ibyk7DQo+ICANCj4gLQlpZiAoIShmbGFncyAmIGRybV92bXdfc3luY2NwdV9hbGxvd19j
cykpIHsNCj4gLQkJYXRvbWljX2RlYygmdm13X2JvLT5jcHVfd3JpdGVycyk7DQo+ICsJaWYgKCFy
ZXQpIHsNCj4gKwkJaWYgKCEoZmxhZ3MgJiBkcm1fdm13X3N5bmNjcHVfYWxsb3dfY3MpKSB7DQo+
ICsJCQlhdG9taWNfZGVjKCZ2bXdfYm8tPmNwdV93cml0ZXJzKTsNCj4gKwkJfQ0KPiArCQl0dG1f
Ym9fcHV0KCZ2bXdfYm8tPmJhc2UpOw0KPiAgCX0NCj4gLQl0dG1fYm9fcHV0KCZ2bXdfYm8tPmJh
c2UpOw0KPiAgDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCg0KUmV2aWV3ZWQtYnk6IE1hcnRpbiBL
cmFzdGV2IDxrcmFzdGV2bUB2bXdhcmUuY29tPg0KLS0gDQpSZWdhcmRzLA0KTWFydGluDQo=
