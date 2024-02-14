Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC8B85577A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 00:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A315110E1EA;
	Wed, 14 Feb 2024 23:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IbSW0wKo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CAF10E1EA;
 Wed, 14 Feb 2024 23:48:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5Mqv709ZFOQ+kMi6wDlvn985zK5LZeH6Hh9lKwgCO53Y+DLZYSJN4xQbNnFZPmFE8DlCpDAlKa//FW7wHq0MARwZzpU3v8bx183BwIMGhimHKDu43HU0lK12ihxH1o4dgZBrjC964kT713ZhiYzSZfIF/4uy26yVKcqnZO6zokS5IqBfgKclyvFbiPZqFjv8T/QX1ksIJGTvQMrU4MU5xSUDWVjO7jVfEZlcDbS8ovD8eqDTim25DsFoPP217zL505yOfFQJF7CU1MMnd5B0wnYjUMNuBQaZh1uIS+HC4MVcE3xaum/BWLYi/xmfzF+mq0Itu/EOZBp4SgXpQDeWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uk5naQ+u/tK+bRgg3S5TEBMglJICvuhjgvy37sjvKeA=;
 b=BZTkIEV69XV/dwicmewsyzc//Hb6SCwehjpKUyUdLMjxRRJ5278k/b6Srfs2fBWi+BzHW7hDEqWyteBL2hfYSjKPw1/YMdfSV4zQYkTHMuGfpM9nF33zj/1Twb/BwFwc8xHpww9WXnd1XdLRN/s5mJlXtA7VoGr+TDmrOKADo5Q4p3HosklJrGzaEko7YhUwq4rhsNDzCePV8hkLdZmh09N+x27ayjQquYr9JEgm/xCF2XEtoPfnAi5qalXG1+2GP0dt/34XQ56ll82V2CTEfDlpM0JV/OL9tqwPf10KVO943juygVUd4fs0vABb9jAZ5evIKJ7AxVcSDF44x6X7UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uk5naQ+u/tK+bRgg3S5TEBMglJICvuhjgvy37sjvKeA=;
 b=IbSW0wKo2Tanw5F4u2bCqunY2Q2+15R6vQ51JSP9H/0i6fkgCgWChjSMNIcmOj0mo1uVig9ch+2cwE0at2AnMWyEXJoo/LwRPO7diMWnIP5LfF0ZGqlt54PJJQOT9YMlS3xj1MZ3kHyRO5X8CIDHmvEPqUy++S0NSmcs22JAXpXHY4pWE1vsiDo11+7jCikGDmL/12P8QrqKO3ICo7EZcwqNFKIabxzSG0o/PnQzrL+/oIJVR1EX8TfBB7/xOKlWpUUEuGFuSpUIJ3kGGxfpF/owanlcpO5cE/SRn69oJUBslBITJEPVYt6vhNe/Zir5y3nim88/DvUvFr9wpyECZg==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by PH7PR12MB7329.namprd12.prod.outlook.com (2603:10b6:510:20c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.14; Wed, 14 Feb
 2024 23:48:43 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::a969:afd:ee0a:796b]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::a969:afd:ee0a:796b%7]) with mapi id 15.20.7292.018; Wed, 14 Feb 2024
 23:48:42 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kherbst@redhat.com" <kherbst@redhat.com>, "lyude@redhat.com"
 <lyude@redhat.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: don't fini scheduler if not initialized
Thread-Topic: [PATCH 1/2] drm/nouveau: don't fini scheduler if not initialized
Thread-Index: AQHaVWujZdZ67CmKRUWEtG0ranjbRrD3S7cAgBNKHoA=
Date: Wed, 14 Feb 2024 23:48:42 +0000
Message-ID: <0cabb3e4e1f00dd0b0b3328a4da9bc8fa3ba6929.camel@nvidia.com>
References: <20240202000606.3526-1-dakr@redhat.com>
 <eeecdd4b5daff8a831b6f11671a2205504e5173a.camel@nvidia.com>
In-Reply-To: <eeecdd4b5daff8a831b6f11671a2205504e5173a.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|PH7PR12MB7329:EE_
x-ms-office365-filtering-correlation-id: 2b860a54-a0d9-4972-9295-08dc2db779b1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OMtzj3FH93KZebTbjEXm7+mkD+/7e3np/2mFanHfaKfByP58UKuqAF64u5ZlQf0taRTF7n6e4e9jG5oxI6fRb8E6y3UNgemqbq/DvJMopsP+LJq6IT03MYp+XPi6z55hkegwSdvZwmcdjUY7dHUjVfvviyzHeMBkOZANS4uOlgX48gMnpL+NHmQ+9Zov7sDpOE+/nV2XAFgWc3CXk3Q2XVmlfAREULlKrRvRyGkv0UeZ+hZ6mcllP6yaOh1c5w1TTLMrDFWNK4BxfyBJ+nMGS6uvBSvV0scJM5pj79pawu8upeqvLXjrRlOKbOFbUgjxpB0lC3iIAJgWwumX28GNUC9hddzyXKg/pxbhy+JQSM66lHsAgmEMduFpZbU06f0hvZEdn+4+r+s16oheBUwoAv3M3PUGwn5ivQAw15R+NX++NZ/eeapvE4Cdptpkyz0Yk6VaJwcJvK1QKgGGuul/uUpV/Mo7WdKfWzyEmE4q7unzSw/0DHkHVzqH8HC5lxW3SeU3ifi5jfRA/dCBWl1/eEevLGzHVZwzZ3CJfyx5+bWSiMRSYILbLdudsi9jgwngeH/+yT07dpTds0joh0JZtUOsgndPh03I6+hzY0widhYSQ5eCUekHle6f732QJWXS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(41300700001)(36756003)(2616005)(38070700009)(66446008)(54906003)(6486002)(26005)(83380400001)(6506007)(110136005)(8676002)(66476007)(8936002)(71200400001)(66556008)(64756008)(66946007)(76116006)(4744005)(4326008)(316002)(5660300002)(6512007)(478600001)(122000001)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUdjMG8xREU1amIvc2NETnpwdnBYVmUwOUh6dXJ3WWhHNDR2Q0pFWlBJQ1Bp?=
 =?utf-8?B?clltT2JtcTI4bFU5MzNmZ0tmcldGUk4zRkFhbkRYM2tva2dkWUlrOFU0N3Vp?=
 =?utf-8?B?OTc2OUI4WG1kL3RsKzlrWTBpMnkwc2F3TWFUWGVoWElGaEdqdmJaZHc5MEtJ?=
 =?utf-8?B?eFE2UXg5RlR6L2pPQUZFSzZYRVlDam5lc1RGVnFnWmdnZ1FUaXlSVWRFMVpy?=
 =?utf-8?B?YldsTHZRdHBLdWJ0aEdndm5CS0ROYWVRWDFCRE1JL3VSbzNlT1U5ZXpJZVBJ?=
 =?utf-8?B?V0s4WVllMVU5YjNQam80VzVwVU5odEJvNnlRZGRHWm5vY0VLVHBSMHpNUzRE?=
 =?utf-8?B?YmF3M0IranNaVWV1YmF6V0F2RGl6M1VPTXJ3eVk4dnVNTW5rbXZKVVpsYlZ2?=
 =?utf-8?B?TjhXVlAxRFFTUXlpMmQ0aG1pOXNWbWtla0VpdW1kN1lWQ3Vza0ZTTlNKaEt5?=
 =?utf-8?B?NTlVRkJCT0RESVdtRTlJOXlIdTRsNHBwNHoydzRyUmpvZ0tHeEcxT3BXUWRw?=
 =?utf-8?B?NHdPeC9KV2N1ZE15ZmMydFVTZDdLTFhZNVkxMEora2NOZjM3d3E4TUhJc3RJ?=
 =?utf-8?B?V1VRZmoyRUJaK2pGUTlkUjJnc1NzNjdQeFQxOUkyMVlEV0tUNXJEY2ZRYkdq?=
 =?utf-8?B?TytHRncxODY0SlV0YUoxazVld2ZLbm9BSklIeC8weHBUN1ZOU0U1SUczQU1j?=
 =?utf-8?B?Y2txWFE4K1FuRE0xUDVYMExYTjg2V1F6L3ZVWmM5R3dYbHNyb2FvdU5POXl4?=
 =?utf-8?B?a2ZQUi90RzhSRDdwb1ROUlhGek5HbCttNnZsNFpWU1BvcW9sYjRydHM2VXNW?=
 =?utf-8?B?OUxFRGFGY3RKVnFKWHBidFB1dGl3MGNmTWVzWGtqeWFDaEpWdTZoQzN6K0RY?=
 =?utf-8?B?d3p6S3FELzNsU3JTaW9qSURIeUFEV0lmY1E2YmpjdkVWQkEwVTg4WWlSYlZp?=
 =?utf-8?B?NlNIbTdmSytNd25QQzBQbzBkSkhtdE9SeS9OMVVlQjJ6T2Vyc1NuMDFXNDc1?=
 =?utf-8?B?bUI2TElobmsxNnpyZmdhUmw0VTgzd0FCMU5WMVV0REdDTE1QUEVRVjRNaEJV?=
 =?utf-8?B?TWVBc2R2WGJnbjljUXpoMXI1VytOanBjYzEzNlpUbTNBaFh4L04yb3V1R21J?=
 =?utf-8?B?NmZPOUtSSk9jbEN4R1E2QmN0UjhSUmVuWUlmWkxXa2k4UXlHZ2JIOFhjbkJj?=
 =?utf-8?B?MnBBVExrcDZFUUVYdWtXZlhPTlIvUEJuYmN0RlU1WXUzTVpXVm8xc2o4S0dI?=
 =?utf-8?B?QXRqeXJFQUF6VHhCaUVOaVM4UG9sZnp1UFZXOTdNVnNoajZjRmlpSS9JQkxK?=
 =?utf-8?B?cXhoajNoVVJDUFdob2RVcFNtVlhGRVNzQ3NZS1NVb1hhT0lSbGdidkZPUE1j?=
 =?utf-8?B?eHQyYTZiZlA1bk12THhHa3Vxd0hBckV6K25XTGJPVFZZVjRrZk9yUHU0Ritl?=
 =?utf-8?B?Tk4yMmhBZWswZzBSMnVjeEFERHcyQUZJbWRmU1pIQmRuRTFCcVV6eHBEZXhx?=
 =?utf-8?B?Sms1bS9TN052YmI2ZDNjZkxDS21lemFkWWdjWUw3TXYwTGpDQ0pCcDllUGNG?=
 =?utf-8?B?S0VHK0Q1V3p2VFB1SXFqWmdmTVMxK3lNTHN1Z1ppSkRSSjRPQmhPUmRjZEFn?=
 =?utf-8?B?bFdTSFJHUWFuT2FuS01WRGhKZVRXR05oMm5KSXFFQldLRzBTSytzWWJydlhT?=
 =?utf-8?B?dlVtdmpnMkF6aVoxajJDNStKTEttNmkxdTV0aXhxM2NxejRYaGxuUW4vb3R5?=
 =?utf-8?B?TEZyc01PVlM3c28rRnNvZm91OXN3T1FpRFowdVoya1ZEa3pIajJ0L2pqczZW?=
 =?utf-8?B?V2NLNnhLckFWdDlIU1A0dXBMRlZreXI3VkV0Z0JFTG9taG9xTk9TUENwRTJZ?=
 =?utf-8?B?VkUvR1p5bXlROXYrVDJuSjk3d0YzNEtyaTc5WXJzN1hQV1NxWTBWVi8rem1s?=
 =?utf-8?B?Q3RENWtkMkY3REhNTlhiS3JlQy9kMDM1WW9ZQ2d3cVlKeHpTUGhhN3NhdXF2?=
 =?utf-8?B?aCttT2JEMnVBRVFnZ1NzTFVpZDhkYUxKTFdmZ01jSjdwTk5yMENCNTRWS201?=
 =?utf-8?B?NGtJUE9sZlEvbGp3TGpqN2lmSkhCbWlsc1l6aGJwOFQ1VEZvUmVmU2pjdDZY?=
 =?utf-8?Q?cbRkD39sOn4Q4O9ulHCtIFjnR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6F8026866AAA4B4D9EEB0FA4ED742776@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b860a54-a0d9-4972-9295-08dc2db779b1
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 23:48:42.3352 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mTBpHB3FKYNxjAbPcUHgU3krWCQ20MA2wcdcaf28o2Rkommy8qwZ8uBPbUFQjXIyQQ6wJM3U384+VLPVqzzvhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7329
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

T24gRnJpLCAyMDI0LTAyLTAyIGF0IDE3OjE0ICswMDAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBP
biBGcmksIDIwMjQtMDItMDIgYXQgMDE6MDUgKzAxMDAsIERhbmlsbyBLcnVtbXJpY2ggd3JvdGU6
DQo+ID4gbm91dmVhdV9hYmkxNl9pb2N0bF9jaGFubmVsX2FsbG9jKCkgYW5kIG5vdXZlYXVfY2xp
X2luaXQoKSBzaW1wbHkgY2FsbA0KPiA+IHRoZWlyIGNvcnJlc3BvbmRpbmcgKl9maW5pKCkgY291
bnRlcnBhcnQuIFRoaXMgY2FuIGxlYWQgdG8NCj4gPiBub3V2ZWF1X3NjaGVkX2ZpbmkoKSBiZWlu
ZyBjYWxsZWQgd2l0aG91dCBzdHJ1Y3Qgbm91dmVhdV9zY2hlZCBldmVyDQo+ID4gYmVpbmcgaW5p
dGlhbGl6ZWQgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPiANCj4gVGhhbmtzLCBJJ3ZlIGNvbmZpcm1l
ZCB0aGF0IHRoZXNlIHBhdGNoZXMgZG8gZml4IHRoZSBwcm9ibGVtLiAgDQoNCkxvb2tzIGxpa2Ug
SSBzcG9rZSB0b28gc29vbiwgSSBqdXN0IGhpdCB0aGUgcHJvYmxlbSB3aXRoIHRoZSBkcm0tbmV4
dCB0cmVlLg0KDQpJJ20gYWJsZSB0byByZXBybyB0aGUgcHJvYmxlbSBieSBoYXZpbmcgcjUzNV9n
c3BfaW5pdCgpIHJldHVybiBhbiBlcnJvci4gDQoJcjUzNV9nc3BfcnBjX3BvbGwgcmV0dXJuIC1F
SU5WQUwgKEknbSB0ZXN0aW5nIG15IG93biBHU1AtUk0gYnVpbGQpIGFuZA0Kbm91dmVhdV9zY2hl
ZF9maW5pKCkgaXMgY2FsbGVkIGV2ZW4gdGhvdWdoIG5vdXZlYXVfc2NoZWRfaW5pdCgpIHdhcyBu
ZXZlcg0KY2FsbGVkLg0K
