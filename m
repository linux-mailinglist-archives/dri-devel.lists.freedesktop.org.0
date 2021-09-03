Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938F73FFA97
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 08:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD36F6E847;
	Fri,  3 Sep 2021 06:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299376E846;
 Fri,  3 Sep 2021 06:49:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gju8j/wqOTDlYXYxARtXpru2P4LbpgzRZlgaQ8W0YpnCpQy0eo2FiEI9Mi5K4mzfa1tGA/qMcM2nxnOMxS+8tOrrRc7XRufsE85VII7AWOyukHKlWFcokMqBCclU5SZoG7hNRyXlfy3PnPi9B+/MwnRSuwoZvlE91rw7CnesrI/UpZtZRdiQTbtG8RLyUl1+PAQMGB/AkE9V9PMDVqIVkc2y4AS25m0A2AVefBGjNFFcAYy7+/Omh6IXOw1aacJFNuomSBQbzP/w2QCrEMQDvpigxVEo9EeGozM9PZjrG/ByuvlqRduvYj7AF9E70dVGMJqFbPMDH8ttVgtCWB0EoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=BAE6Dsjd4KurK1AUaBh4q9/MK3J4QYUbaNaDGNNA76w=;
 b=Ck71ULIMX7f5iTv+Kwn2wtN8uR/HEZ+105rMnh6IvTU6YpIvHvelPgCmHofXKRvtfx1QyFvsxiGvEJQCyke/C+4YT7YO+FmWaasCokeHdJYti/Z/lleJ6bvQyZZEyohBsWxc8LxIVsXrufKSfRtXRjxAfXkWlmAHMamAlia8QDpZWPmPvJy4ky8EjOaS+XvbLVoxsegAn4MsP7XvdC6qA8EFmcxpC/0f2n0CAE1Cm4ecIqppA35Z8fBJvkDH6lEUpegNv26IZl8h1xIPpwno6W1vmy8KztXe1LxNIsQVFk46aNwsOzJrm3ez67RSpao0EM9byMNsGFZ8R9cExaCPfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAE6Dsjd4KurK1AUaBh4q9/MK3J4QYUbaNaDGNNA76w=;
 b=JzHNQmKy6Pes6jkIuQinQk9vnr3lDV9/jnJmmQfVr1DyjBee5YKgyDb0S+8hcTBRkPgViM6zu44jhX1P45GeVu5p3oX5OnEA0niL6Au/aINSlTMcPKmDLfMHCoz2bjfvfs7jkisU+axtOWZq07cZUK7Lp655WcHL/+S2qvcPYws=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5200.namprd12.prod.outlook.com (2603:10b6:5:397::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17; Fri, 3 Sep 2021 06:49:05 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca%9]) with mapi id 15.20.4478.022; Fri, 3 Sep 2021
 06:49:05 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: amd-gfx <amd-gfx-bounces@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: [PATCH 1/2] drm/ttm: Fix a deadlock if the target BO is not idle
 during swap 
Thread-Topic: [PATCH 1/2] drm/ttm: Fix a deadlock if the target BO is not idle
 during swap 
Thread-Index: AQHXoI/JwHjULHp1EE+WUl2cADH7PQ==
Date: Fri, 3 Sep 2021 06:49:05 +0000
Message-ID: <88E16111-86C0-41BC-90F9-A0A517894B5B@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.1f.0.191110
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e58017f4-60b6-4c59-896f-08d96ea6ec13
x-ms-traffictypediagnostic: DM4PR12MB5200:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB52000637543352A4352576CF87CF9@DM4PR12MB5200.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hjxl1Ug+8p8Gbq8vg/eKcIZvNIuA2Nm8WwfcuBSxTwL6r/t2aVoZZeR7T3qAtNAeNxshLiUK49CHaWFpqUvJVOQImsGmlbxGw6yrLxQeMzWWrWBwCPNRPlZ1PBSK9H89t0OsluHW4CywXjO3S2UwrJEIWW0+HtnU3/fddIkKPWnU1KpE3z+Ok1afKLi95ZpFg5k/U96V4eU8kJNi4EtPN57MWUa5rKwBTQuudvaWKUL9gPu4ZLreXKqJ+SQMU4H/nZbCcwxHua33FDf7drIaL9Ra4QJIUW79udytGlPEkHgFRWFjHM9XGtBG7xBono7Bf2t/olJV743EKwjXzM4WHE90ZbTFf0SstacKn27wFCLh7/uX6otriU2qgeGRUwqn//sWWLnA/q7UjhbnUjoiuT9sr2WnkAVo1rVFCupNNLHkxMljxkWRteCcRES3TTjNwQU+ZIpnECAlsoYlczcJd91uQnRkagZyFTBHAR2ZlhsEhZkq+Xm5FB637BttoK58+TEfPDGq7h/3mOW0CEx3kLmiWRTUwB7HJQv55Ubh3vjCjzb+z4ymXqpvKVFXus0WKuc9mIXB0Yszrge3DjBlpBJf0s6q9/uplVvUHxHnAJSqDLsoH+c4VtHged1KKiZrdWp2nzYA4rRm45t2t7bco82vINCZYZcYNpkoMDvADt+dMWNBAe3wZ2OLTzuIIAGxTC4gPsY0SeeFOQVjJFQCaSqr6pybqGAnJQ/yeOdvX4k=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(4326008)(8936002)(122000001)(71200400001)(8676002)(54906003)(91956017)(76116006)(64756008)(66476007)(66556008)(66946007)(2616005)(478600001)(83380400001)(5660300002)(66446008)(26005)(36756003)(86362001)(186003)(316002)(38070700005)(4743002)(6486002)(110136005)(6506007)(2906002)(38100700002)(6512007)(33656002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmM0SjROa0pyT2YvN3k4WU8vck43bXdMSmRFVnRGOTdPVlVDZ1F2OC9NRkZQ?=
 =?utf-8?B?My9QQ0R4UVd2Vm5RME14TWwyNXNkazNTMDFJNCtIQzRFY1F6aW9pWkxSbXp5?=
 =?utf-8?B?WC9KRHhWdDdaZkJaQjVMVXJwbE5menFHeTdvT2xUQkN5cTJsZVg4YWFsWVR1?=
 =?utf-8?B?Q2RIOHFvSTF1QzdXQ1p2cC9QUm1idlJOaWZYOVV3YklQRlhWK3FDZkhQdGdq?=
 =?utf-8?B?MmQwTkxhL3NyMGdwdFdHOHY4aHl4aUdiSE4rOVkyUCtYbWtwU0lYZTZvM3J3?=
 =?utf-8?B?VFBaVS9lb3RCTDNZMENRTW9rT2Ntais1K3JDR204YUcwRnlxUEljcGdiQkJI?=
 =?utf-8?B?aTFaQXMwR1BNMVdLV3NWOXd2TXVSWkpEUU5RaDI2d1RMUFhuU1lna0FzVHpr?=
 =?utf-8?B?UkNuMUkrakdkTmlzcGR0MjBVdXpoRTRZa00wVE9QSUQ4cGFERUNpZjhJNWU4?=
 =?utf-8?B?T3VMamRIQitIZWQxRk01c0hlZ3IrUWxyV1A2ZG5Kck1YQnJQdy9vUU5KN3N2?=
 =?utf-8?B?L3FlVWwraUZ3Q096ZUNVcXdQenVsTm9IK0l5dXdXVlVkbW5tOThlb0NtZzM3?=
 =?utf-8?B?aXBTbnE1TnJxUnU0VmRUQk1ueDMzQitDbFZSOFgyTUlwM01XemdBWXdLNXNI?=
 =?utf-8?B?QjRWZHhsa1prdmxtTS9EREtWUkh0d1R1VUhqTFhiQnFJRnFJRkJqL0dSb25J?=
 =?utf-8?B?RlU5Yis2NGs1bnZ2R1JIM0FXbnFJbm1UTmNqMG5sNktZc0R0UU90bEhXc2sv?=
 =?utf-8?B?aWl0VWRrdTVNTUxTWVB2a0ZZMmpUZ1B3dDdBUzJtMnhURi9lVzl2TlYwYnQy?=
 =?utf-8?B?bnV4djJCOVhDUEtRZm04K3RGVVlUaWh4WE9JcGREYnRGNThrT01HNURvaTBH?=
 =?utf-8?B?S0Y3VEM3enZFV1AwYlgzVHlDdDlLZnVuOGVod2FUYnFmR2JoOWFhRzRFNXVm?=
 =?utf-8?B?dlZOWDNCeG15QUhyTGYxS3FZNHhOUE5kY09MYzNqb3FNb1N0N3IwTWpaMkRF?=
 =?utf-8?B?d01IL0NkYjVYR1FyNFBOWGlZZ2hQMHhOZko0ZkxITzVlYjU4VU9Cemg3R1dX?=
 =?utf-8?B?L2tNcFdYU1dicklqSmJFbnlDSlQ4ekJTZHJxQzFpQXJCRGd2ZU1CNDJodGRZ?=
 =?utf-8?B?M1EvUkFnc1Y0SGgwa2JiY1k3aDFVSGt2clh3eWVNWDRrVm9FMVNqejFXVXRS?=
 =?utf-8?B?c2k3ZEpZaHhFNG5RZWc1dU5jYTRlMzNoUVhHd0Z3UXFzTTVtb3ZwS3NqWXV4?=
 =?utf-8?B?M1hMVERETC9iVkpVQkxKM0ZHNmtlc00vaTExUkNkdWdSdnpzLzlxNnl3a2ZL?=
 =?utf-8?B?SkZ2elZ4bFdwaCt3RHlGUDgwQkViTjFKUTd0b1laaE50eU9OQUxBRU04ZHhp?=
 =?utf-8?B?bWNLYWNyWmJDMDd0L0l1UjE4S3A0L2gyV0ZWSS93N1B2V09DWHdPanBaNHRs?=
 =?utf-8?B?K0xzcldzUmF4clc3UmdkRldWVU5sa3dKRm01dkx0eHFSSkNMbEEzQ3ZCOHNS?=
 =?utf-8?B?ZWlCY2lUbVVvWU41TzJGSDJTVlZmSFJsNjM4SkxKTjNSMTU4Vy9TamJWREpS?=
 =?utf-8?B?QmhHalNmR1F6eEZqUHBBU283czZ3ZmRUek1RcDVtU0dEeWxZN2tkNjB3Zkwx?=
 =?utf-8?B?Y2ZCMk1SZmhyV1dNb0ovTERBMEU5RFlISkx5Rnl3d0RzelNHRjN1NHZCOStK?=
 =?utf-8?B?V3lKdTl0NGcwZVpOT2I1SjhUT1BzL0c4ZTJNYTA0bTV0d2lzSEZmcHRFVnZ2?=
 =?utf-8?Q?dT1gsv1mRhjI9JY5eObqAm7TXPDRTr4J6LgFp5G?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E319F50FE6EAD445994BAF174EDEB899@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58017f4-60b6-4c59-896f-08d96ea6ec13
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2021 06:49:05.2193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jO+ICZV+UQSekd6AORSDXTu8g0CktPUdKBzdRNom+FYuII7CQMSsQeL/FsXnr3f5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5200
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHJldCB2YWx1ZSBtaWdodCBiZSAtRUJVU1ksIGNhbGxlciB3aWxsIHRoaW5rIGxydSBsb2Nr
IGlzIHN0aWxsDQpsb2NrZWQgYnV0IGFjdHVhbGx5IE5PVC4gU28gcmV0dXJuIC1FTk9TUEMgaW5z
dGVhZC4gT3RoZXJ3aXNlIHdlIGhpdA0KbGlzdCBjb3JydXB0aW9uLg0KDQp0dG1fYm9fY2xlYW51
cF9yZWZzIG1pZ2h0IGZhaWwgdG9vIGlmIEJPIGlzIG5vdCBpZGxlLiBJZiB3ZSByZXR1cm4gMCwN
CmNhbGxlcih0dG1fdHRfcG9wdWxhdGUgLT4gdHRtX2dsb2JhbF9zd2Fwb3V0IC0+dHRtX2Rldmlj
ZV9zd2Fwb3V0KSB3aWxsDQpiZSBzdHVjayBhcyB3ZSBhY3R1YWxseSBkaWQgbm90IGZyZWUgYW55
IEJPIG1lbW9yeS4gVGhpcyB1c3VhbGx5IGhhcHBlbnMNCndoZW4gdGhlIGZlbmNlIGlzIG5vdCBz
aWduYWxlZCBmb3IgYSBsb25nIHRpbWUuDQoNClNpZ25lZC1vZmYtYnk6IHhpbmh1aSBwYW4gPHhp
bmh1aS5wYW5AYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCA2
ICsrKy0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYw0KaW5kZXggMWZlZGQwZWI2N2JhLi5mMTM2NzEwNzkyNWIgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQorKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jDQpAQCAtMTE1OSw5ICsxMTU5LDkgQEAgaW50IHR0bV9ib19zd2Fw
b3V0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0
eCAqY3R4LA0KIAl9DQogDQogCWlmIChiby0+ZGVsZXRlZCkgew0KLQkJdHRtX2JvX2NsZWFudXBf
cmVmcyhibywgZmFsc2UsIGZhbHNlLCBsb2NrZWQpOw0KKwkJcmV0ID0gdHRtX2JvX2NsZWFudXBf
cmVmcyhibywgZmFsc2UsIGZhbHNlLCBsb2NrZWQpOw0KIAkJdHRtX2JvX3B1dChibyk7DQotCQly
ZXR1cm4gMDsNCisJCXJldHVybiByZXQgPT0gLUVCVVNZID8gLUVOT1NQQyA6IHJldDsNCiAJfQ0K
IA0KIAl0dG1fYm9fbW92ZV90b19waW5uZWQoYm8pOw0KQEAgLTEyMTUsNyArMTIxNSw3IEBAIGlu
dCB0dG1fYm9fc3dhcG91dChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBzdHJ1Y3QgdHRt
X29wZXJhdGlvbl9jdHggKmN0eCwNCiAJaWYgKGxvY2tlZCkNCiAJCWRtYV9yZXN2X3VubG9jayhi
by0+YmFzZS5yZXN2KTsNCiAJdHRtX2JvX3B1dChibyk7DQotCXJldHVybiByZXQ7DQorCXJldHVy
biByZXQgPT0gLUVCVVNZID8gLUVOT1NQQyA6IHJldDsNCiB9DQogDQogdm9pZCB0dG1fYm9fdHRf
ZGVzdHJveShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQ0KLS0gDQoyLjI1LjENCg0KDQo=
