Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FA67A9241
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A063E10E578;
	Thu, 21 Sep 2023 07:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61B810E559;
 Wed, 20 Sep 2023 21:42:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDaJE9vIxL7hss9+B7H6kOqfGM/pTA2XsBA31hd1SLYOMOYavlkDvLLeFSlc83dmEHY40Hft+GsT/Ss97OhPfKv+EICXW5IcQ9Dz098T1mxnSwF5dmx1K7Tj0qMqccKJG2PZ8LkayNAvYQrwjH8Kfaj6OK/j4IiyFRXJlvfNcyu+csDsoZFvV9FC1noJ0jFf0lfiwlYT02U4zOJ+zm7p6smifizD/YFyFHAtAz5JhgC4c6TKvul7Ikfb+Ake7dlspJ/IBk296/jtM3tMy5e5o4Nrpw+7oNg4FREgKXIa8+x89RByI4nG/6khwCrBwkWsMRcKJP74lyPkt4of1wANXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74uzmKCx2Fno390unOWIzsOt0EGAmMgH5es8IYg0j+Q=;
 b=U5Amm6QxAlvv1zhxr4Z9oKfhx46pInZblE/QUBCUl5T03shxkQ7jqt6AIFyNFSfa96NHBHZSC97GAjsRIekVNSv+vB4eKtHBIqxg0Go2hOB/VLRhY5V57omW03y16ybgu9CgCWIjFYmTeuCe63Q2/fozj/AFahBXuZOM9QZaKAFpVr6Wexw/spOObKGyOWhao0FThpGvebE9U+3JeWxp+I8qUZMa07aEbNrnyvuXz1vcWMpeLZI6npJFji+ui+RaFVvSh1/8aRuD2QfE4NaZLALpRgGYTLkgZqK62VVaMuV+joBgaQNyNakqbHyONYa9CTb2lw/Ern43xNx+LLDugA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74uzmKCx2Fno390unOWIzsOt0EGAmMgH5es8IYg0j+Q=;
 b=CGhH4O1nNSf5oc8k4X0nJOGNq6YNzwg7vpGg/RSlMNqJE5ZADNFZx/HibvIISyGVvmLjXNUv2X9lJCsOSj8LjvXQTGg0XUd3KHAYYOr5WQrUZHOyWXs/HxD5gIRkf4FC9Buj2VUkp5qncqJMxpVj7iN34F3VrX+OVuxQXwq+LNy+gRkOAH9c+g2XAHpGmgxlYj4mybS/0Z+d+czfh0H1VtdymCWRuLVgB8kUP8gj5Ojz0XYygktMXnqgy9xE1wKYMFbO5CjmMEoi+udYTxGENEQIBxXDsfoqY1J4wfiYWUuiNmtK6G+8rjBbozSGocn0M6dMu2JbJNrBCTLkPWM7lg==
Received: from DS0PR12MB6391.namprd12.prod.outlook.com (2603:10b6:8:cd::16) by
 DM8PR12MB5416.namprd12.prod.outlook.com (2603:10b6:8:28::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.19; Wed, 20 Sep 2023 21:42:54 +0000
Received: from DS0PR12MB6391.namprd12.prod.outlook.com
 ([fe80::76bc:2a16:6e0f:72b6]) by DS0PR12MB6391.namprd12.prod.outlook.com
 ([fe80::76bc:2a16:6e0f:72b6%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 21:42:54 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [Nouveau] [PATCH v3 00/44] drm/nouveau: initial support for
 GSP-RM 535.54.04 (and Ada GPUs)
Thread-Topic: [Nouveau] [PATCH v3 00/44] drm/nouveau: initial support for
 GSP-RM 535.54.04 (and Ada GPUs)
Thread-Index: AQHZ60Vagsa1PZbXS0aKv8Lujww2WrAkQEcA
Date: Wed, 20 Sep 2023 21:42:54 +0000
Message-ID: <a51bdba3d332bdb0511c7feb61b8ccd168573c5e.camel@nvidia.com>
References: <20230919220442.202488-1-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-1-lyude@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6391:EE_|DM8PR12MB5416:EE_
x-ms-office365-filtering-correlation-id: 55a66a84-b85a-4ccf-925c-08dbba228c3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xP1kxFZ1ny3HieJIZzpjauaYFoRhR3ZBHG2BRtmJCdsXZ9kxipdeeH//dH0N12AMJE0/iQ0CLYc6QwjSTmFqN8V2LVrLjOHvPX18aU55JeDN7iQSYx2jhHLfiYxJOInxBmcVt+z5gpFKauZU9E2J1HVKYhd4Ug8wnfHUZtImX2x+IhZ4GllRSlODsjj9vM3rnN/0N1e99WSpIaQ4y6UwENVJy+y4TSx6G/2OJAAD0z9jRBS+YMltlrwdF8xvUoG2oUfi+SrW3W7Z+t2DrFxVD0FNs96H+CF+7gNBfAULn0tmGjFepXLOBgLN8rQssfN0Ac609EliYF3etAqSQzjWf+ilrd5Z4Hk1PisO5u4DLIoHfBYEgBdfflf7TyK85r+mN03OqdyRxP5oGwjYA4ynNHtJBRV1FxlkYeSMIJ3McQC0i5C9f1NHaq02rRpY3Qn3zcZKGK/gSCEoXkvx6UlRiKzgl7Cmkb20c+p2/m1oO0BiyP6EpsHhrUCG0cgpxVU/8u41yRLZCTXNxixhID7TkOFWyvkPU96Qmp3sT559TeqExJlwXimVlK1Ud9fwcg2/t4hpsEYyXx0MZrVXGjFGpRwG4t2MxXlNGf3mSAFZHjtGph97u+Qt+gO7JbJBAmrO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6391.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(186009)(1800799009)(6506007)(6486002)(71200400001)(6512007)(478600001)(2906002)(4744005)(26005)(66446008)(76116006)(66946007)(64756008)(66556008)(316002)(66476007)(91956017)(110136005)(5660300002)(8936002)(41300700001)(8676002)(2616005)(38100700002)(36756003)(38070700005)(86362001)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MllSZEg3bVEySkpacXNUVk9qNWpJdk9kVE50bkpBajFDV3NjNnE0YnFDYVBM?=
 =?utf-8?B?Q25SQk9DWnVKb3poWE9rV3JJZUZMbzhPQlhpeEJsWWxFakxBNEZoLzJSSnBL?=
 =?utf-8?B?V1lqM0hGUjMzblBxaVRyWXc4dHRsRUExVlNQdnZmSGFGS3ZhTTJodXFsRHcv?=
 =?utf-8?B?ZHNWVFByeFRQOGIwd0JTcEhFVEV4SFZseTRaTVNXZ3d6dFhxQTcvR2cwUk5W?=
 =?utf-8?B?bi9GMXM3dVh6L1pBcVpWV3MwaTVCNVNBZlBLRndleXBmbUR3RUFFakZWTFM1?=
 =?utf-8?B?emoweHFZWkV2eXN3QmdOd3hCZTV4eThuN2FMMndyL3pEbXRUWHVFTk9peTEy?=
 =?utf-8?B?NW1Gb0IxbU5Hdm5COGtXT2xRdng2b3Y0RlVjcXVGWDlUb0lneUV1bW50c0t5?=
 =?utf-8?B?T05PekluUDZvS0lJNjh5dXdWUzBmQXVmbzQ5TXVmYkdNV05Lc1p2OVdXM2FX?=
 =?utf-8?B?MmFSTVJDekhQa3EwbDdXZWovTndGWUZ2U2hNYnZXRjdlL3QwK3dNR1BhTGR4?=
 =?utf-8?B?N3ZOdldTSlJUbHJlZ3h5dk5Lazh0dHBTNE1kK0VhV2Jmalp2RnhWNU5hL09E?=
 =?utf-8?B?cm1NZDNUbDE3V0hrTnpOQnBwd29BOVRnWW5rVzUvd0c4NGxlS0dWaG45a215?=
 =?utf-8?B?cGx5VW1tcnI1WUlDelVSS3B3OEJnbUpSeXNMaU5vQVhRZFZEZnJIMkk0M1Rs?=
 =?utf-8?B?aVgwdjMzRFJKazRQRzNicS9hYTBFQnMvUTgvMmIzQzJTVlJtelhTU1g1bmpZ?=
 =?utf-8?B?MjJLanh2d1M2bjJTdkFvYWwvVll1Z1R6N1Bnb3o4cS9xRlF1bjJCWjA1dmds?=
 =?utf-8?B?NUR5T0FJUXArTU5GcUFUOEN5VWdzRlZxTXVLejVXSVMyTUVDNkoxT2FxVCsx?=
 =?utf-8?B?bUplZHNKT3dBa3dNeEpVQnUwdnlrb1lqbDZ4a0JHNENhTjlNeVBONVR3cEdu?=
 =?utf-8?B?Z0JuZW1FcDhRQWhaYThpMzBmbmMrd284UDBRWk5adWNRUENRcW93NVI0MytI?=
 =?utf-8?B?NFo1RGNSUkNsTHN0VUU3NHNmb3VTVHNSa1hUMmJ0Vkd3eXRoRDc5TzNIMGhw?=
 =?utf-8?B?QldUQkVPcU1SZDBDVFQxM0pSTGVjVXYyQ01jeFFoM2VtbkZoZGJpME52dzV4?=
 =?utf-8?B?K1NPbk43WkY2a1dKTnZCNGtyWjdCeEpNclFhUHZLWEhqZjdYNVRyRkhDZXV1?=
 =?utf-8?B?WmhRbjVzYXRzeVltc2FuZUNHdHg3bnRnZ3M3ZWpreW5wTW5ma1BMYUY3UHZ3?=
 =?utf-8?B?OSsyNktRdnZ3RjdHUlZUVDVuOGNZUyt5Ym8yc3dadEhzQWdQd3lJQm5EMFZB?=
 =?utf-8?B?eHpwRzNydEF5TElyTDlJRTh5QU95Q1ErOGJiQ0tQVEZjVnFhRnhROVlsNERO?=
 =?utf-8?B?SGZVcmRvTGk3T1VqSFZUbjNOUGFuWWtteXZrMlMvWVBRL3pnWXE3ZjN2YzlF?=
 =?utf-8?B?OW5uamtUVFhFV1orWVRuUnNhSldtRm00SXM4eUFiL0NoRnVqR2sveUNkK2w3?=
 =?utf-8?B?bVh2OEM1U3QxMCttelBBeDZ1UEtBMnY4eW5xOTJFS0p3eW9NNWFLUGJSLzFq?=
 =?utf-8?B?aStkMWh4VnM0Q2EyeSswUGZKOUw5SW5xRGVYSlF4REM4SHp1MjhTSmNPYTh4?=
 =?utf-8?B?WGVodlNINXlvemkydmR4ci9LSHJQK2hPZERLUDJGNHFlTHhuakcxdjRvTkgr?=
 =?utf-8?B?T1N2VElEaVc4NXI3WUNtUWYvaEFNcnE0ei9PcTFrN0hBUjk1MFd5SGNpbFFw?=
 =?utf-8?B?RjArUlVNZVNGaGdJNHNLc0Z3ZzJ2a2ZKTFZ6M0xTYS9kLzZQM1VpQXdxNm9t?=
 =?utf-8?B?V3J4US80cytiK2VlZXJtYU5oaGc5OENYamZkdVhLVXBXbWYyenJJeU5DcTN5?=
 =?utf-8?B?NDMwOWhGYWZaa2NReldRQnJnSHZjV2hsZnU2OENQb29iM0Q0MWtLZHA3TWFD?=
 =?utf-8?B?SlZEcjdRTElHT2lDOEZ5MVNNd2dVdXJPUWNtanFGWmZnVmdNMzZheW5TQ09H?=
 =?utf-8?B?N3lON0lLU1JkMHBTVXgwNnlWU3V4U3Y4OVZxN24xUmlTWDNpL05kTWlnU3Js?=
 =?utf-8?B?S2I0Z3pIUDlZYVB6OHFkdEVxdGFHSFRJVkNqYklRandPYmdPY2RWcE9wUUpu?=
 =?utf-8?Q?Lf0Vtf3kMcbDDym8OL/a9QzNT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1FFA1302038A5247B587266B59DDD8CB@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6391.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a66a84-b85a-4ccf-925c-08dbba228c3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 21:42:54.7229 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XAtygr36UxGEe2S2r7PhKhr8c/XiWWcc/DBaEtBdcWr9gp4hQuriTmwD73Co2V+we/3BXSALu5lExDW8lIgSUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5416
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTE5IGF0IDE3OjU1IC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOg0KPiBI
ZXkgZXZlcnlvbmUhIEknbSBqdXN0IGdvaW5nIHRocm91Z2ggYW5kIHJlYmFzaW5nIEJlbidzIGRp
c3BsYXkgcGF0Y2hlcw0KPiBzbyBJIGNhbiBwdXNoIHRoZW0gaW4ganVzdCBhIG1vbWVudCA6KS4N
Cj4gDQo+ICgqdGhlIHJlc3Qgb2YgdGhpcyBlbWFpbCBjYW4gYmUgcmVhZCBpbiBCZW4gU2tlZ2cn
cyB2b2ljZSopDQo+IA0KPiBUaGUgcHJpbWFyeSBpc3N1ZSBiZWluZyB0YWNrbGVkIGhlcmUgaXMg
dGhhdCwgZm9yIGhpc3RvcmljYWwgcmVhc29ucyAod2UNCj4gZGlkbid0IGtub3cgYW55IGJldHRl
ciAvIGNvdWxkbid0IG1ha2UgaXQgd29yayByZWxpYWJseSBvdGhlcndpc2UpLCBzb21lDQo+IG9w
ZXJhdGlvbnMgKFNPUiByb3V0aW5nLCBEUCBsaW5rIHRyYWluaW5nKSB3ZXJlIHBlcmZvcm1lZCBk
dXJpbmcgdGhlIDJuZA0KPiBIVyBzdXBlcnZpc29yIGludGVycnVwdC4NCg0KSSB1bmRlcnN0YW5k
IHZlcnkgbGl0dGxlIGFib3V0IE5vdXZlYXUgaW50ZXJuYWxzIChvciBEUk0gZHJpdmVycyksIHNv
IEkNCmNhbid0IGRvIGEgdGhvcm91Z2ggcmV2aWV3LCBidXQgSSBkaWQgbG9vayBvdmVyIHRoZSBw
YXRjaGVzIGFuZCBwcm92aWRlZA0Kc29tZSBmZWVkYmFjay4gIA0KDQpTbywgZm9yIHdoYXQgaXQn
cyB3b3J0aCwNCg0KUmV2aWV3ZWQtYnk6IFRpbXVyIFRhYmkgPHR0YWJpQG52aWRpYS5jb20+DQoN
Cg==
