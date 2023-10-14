Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F657C9620
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 21:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E6C10E06D;
	Sat, 14 Oct 2023 19:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2108.outbound.protection.outlook.com [40.107.13.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E3210E06D
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 19:48:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuGArKBUVWuSJ4fIajntVAfQrOq3sFfrzsBjqZElsboclHJ+uV2PVKFwWRnm2jlZDJVgQN4XDVRR6X1NLNgbUavKzeuDSs69E2IcPNp6X1xnfwWDOnJd4o3zgtXUL/1b9OMqfhi9eXm1Ulys2BvF7SazcYicpZrjtPH/DbGtRzTx3TV0/5hhJUEQ4mdaATAYHWmEuBKp3CVgnjBuHNAWciQPHL1fwxO8oCrgUrKBL41yB9SW+32TFQI1yae8luqzjIjm+U4qOBG3XF8ZQRcDiE1xL1AfazP2BGTUfLRTIJPEhjase4c/xkGRY2JSrjk8PhCH2eKWRpFt0/6j1ChILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6laOVlqVYatfQGeyyKrE00YmW0thGkrTqj9DbWPycw=;
 b=acOLJfnctpnAO/ky0XP3R+jJbTTOEqsXTpeDt1kENDVY6nbiGU2CbfihuRgQ10MvocapvsoFpRqlodF4Do8+5iujStka3lq+zh4H17T4e8DA3T6iALJ2knwzn9BWzGRAuiiiW4CdaFWaDHZTa8vnOcZEl46IhoK26fjA1TATRc9N7DHroQlnbCBjv4ku4/RuPqsXeMAmOSn/U1XvvYS8dfr5UK/FcnxBlSS90vGpniYA1l86GIyujfkIyo4KJFRoPe0a/KUN9zLUR2OrE/ubzt0jhNgGpziMWDuZI8O9CuvgWlqipj2OGJLsyWMPOdLjxbTFQqLhAbWNPBZm99XGGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6laOVlqVYatfQGeyyKrE00YmW0thGkrTqj9DbWPycw=;
 b=evXKiRZmnJue6H88P07yetxEgBqOn1DQJN16W57FCr2SfwKPKY8id/61uQUX6uzYnfHg5Z+4f6MlflfZTRUhJeeIJhuQnK3uRGtcPptLqhpxF3bXZBUO7v+yjQbIVC8HOObHJAiKxn50iwDsVHf5pVPCsaWddXrOuans5z9xhpU=
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com (2603:10a6:20b:26::24)
 by PA4PR03MB6797.eurprd03.prod.outlook.com (2603:10a6:102:f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Sat, 14 Oct
 2023 19:48:19 +0000
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::fb3c:4931:e74e:c691]) by AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::fb3c:4931:e74e:c691%3]) with mapi id 15.20.6863.043; Sat, 14 Oct 2023
 19:48:19 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <alvin@pqrs.dk>
Subject: Re: [PATCH] drm: bridge: adv7511: get edid in hpd_work to update CEC
 phys address
Thread-Topic: [PATCH] drm: bridge: adv7511: get edid in hpd_work to update CEC
 phys address
Thread-Index: AQHZ/taq5D2UjK1S+kWjz8DqNvYQ77BJsRQA
Date: Sat, 14 Oct 2023 19:48:18 +0000
Message-ID: <suuq6vyosh6ddh7szjwuznmr326cpxjtugw3chbnogome7lmpp@fr2lblb6qudg>
References: <20231014-adv7511-cec-edid-v1-1-a58ceae0b57e@bang-olufsen.dk>
In-Reply-To: <20231014-adv7511-cec-edid-v1-1-a58ceae0b57e@bang-olufsen.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR03MB3943:EE_|PA4PR03MB6797:EE_
x-ms-office365-filtering-correlation-id: a87eb120-976a-40cd-23ed-08dbccee83d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G3zFLwfYbW7Z73DDeFvwrfviCYVaLNR8sZsFDQZjuRZx1u+7a7TFuloDoLqvhYFErwlnxxdovQlW3ACXy4dNIDXB3FVmUx3IeURDL6KkGg6K8spQ743pxL3AOsJjQRciZ0wW/HT9m//6r5VWupnaYxxOpqNUgXX9k8nhnW2kuOUtDirOz04PyNacYfl6ogPNawRiJtXVOPLJI/GRq283SS9DqdIIqZQ7105bA8Nn4B6koE9UZpYDo2t+L5hwU/zcxPet/4LiH9OpIOvTwxL156parLVK/4wqcI+NRR+DnQ7h+yz746Pkx6aYPM55U5lGXvp24Phhr4gmrh/WbkoT33rvVuG+AXWnO7L6D7EQH2egyhJBTmWrobvW+nD1xtnKCL+ELJEbs0qyiHKsfXwYWCxG6C/3v99F2lUYWA9XIBf2lAmrgSMOUnbIzNLkiBFam5gNN1+KCcEjRt8hM+OTewUq7NWb9P/j9RQizZJpOCjN3LLtCWOaNNwf2YY214pnUPXNhVm/6CqLA57DzDeXCnMqLsCNZ62sMa5HnVryRXqV3Vh2MDyFUKmEPDAhCk0UDBxGDGBoPJf9TmfV30b+qtxyRcxG+bZ1jPnwJKBnMEPJj2ZBPOdN2jylNvXnt0FO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB3943.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(346002)(136003)(376002)(39850400004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(6506007)(9686003)(6512007)(71200400001)(6486002)(478600001)(33716001)(86362001)(122000001)(85182001)(85202003)(38070700005)(38100700002)(2906002)(7416002)(83380400001)(316002)(66574015)(26005)(64756008)(4744005)(76116006)(66446008)(6916009)(91956017)(66946007)(66556008)(66476007)(54906003)(8936002)(5660300002)(4326008)(41300700001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGN3MnVVUGdJcXFBNnIwNWU0OEcwQlJENE5BSTNRdjhyTFI3eGJhcW0raHBj?=
 =?utf-8?B?TUNPZ2MwbCtVV0kyNTJTU2JzL2pORE8rWGpDbzlGd3FCTWFCa255T2dWTVV2?=
 =?utf-8?B?VGhmSW41VTRBUjFmNE42TWlMeWJQb2g1WTJGZXk2WmR2NDBiY2REZkJ3NSt0?=
 =?utf-8?B?dmlHUHB5eU0xSWRVNXkvRlJQTTNnTHA1UnB3eUVEMkUvRldDaWN2SytocnRR?=
 =?utf-8?B?SUFuNWtMalVveHoxZUhsdjFqc2NVWSt1NHlvR1JrUGtRVXBRdlhtUkhDc0I2?=
 =?utf-8?B?VnJyOWFsS0tjZWdOc3h5c29ML1ZodDIrVTVzaW9sQitaNUtxS3RJSEI1dytI?=
 =?utf-8?B?aXU1QjFKVVhlSGIxZFFyUDE5OGtiazg4ZVdpQzUxcmRUZWpZYnBvaGsyaHlz?=
 =?utf-8?B?V3hCRytzd0Nwc0dEWVJVK1padHpuVUlXOEVmYXNWNXp0aHZoV3VtUlVPQTNy?=
 =?utf-8?B?K2Rwa1ExaStUOTkveTVWNldoY0hETVIxbUFUdTZkbVlOaEt6WFprc0oxOVFl?=
 =?utf-8?B?K3lhN3V6ZnFjUk5OUU1oVS8yUi83dVlIMjNYay95ZjdVd2JRR3FBOHR5cDNI?=
 =?utf-8?B?cmovOGJPTVJFN1pOR3pPTWxINmpLZWQyeTBkcU9QWFQ3QnM1aFpYZkllSXhD?=
 =?utf-8?B?UitQSE9DWjhJbmpBVFhyaFRnazJwN0ZKejYwRGN1TzM5YzN1Z09zL04rUTFn?=
 =?utf-8?B?S2h5QXpCbGJwdzdud1IvRCtkUUZIQTM3RkNqTmkwdXg4QVNBVW9VYnE1Wjl1?=
 =?utf-8?B?UVdvWGV5SDdwVkpWU3pmT2RDVkNBN08rLy9HZkdDR1ljUktycFZOUDE2bWR1?=
 =?utf-8?B?S1lDTE5ZVDF5T2lRamZxSHplLzNwQWxvSFNYdWVZdmtRWHdlVGZMZ3hsdGtW?=
 =?utf-8?B?b1Z4dVFXc0MycjNMb0RhOHRtcFQ3K1ZVeHlOTXhDNkZ0UDQxRTNQc3Z2Rmcw?=
 =?utf-8?B?REF5RDdQMHJISXFKYXcrMFBkeWlha3gvS05SSFB4OU1mUEdTNW02S3JVZ3Vn?=
 =?utf-8?B?c1AwOFhxaWd5K051Z0FIL3ExWXpucnZLYkJiaDVJakFSUGt4SWJjdWRZTlMv?=
 =?utf-8?B?U1lJRGpTK01Fem4zcHF4L1JCK2tPQllnRUFyeU9WYUlsc3Z4NXhMaXJZZXVG?=
 =?utf-8?B?SnBVOW4wMElZV0JOcUNSWGxXNWpoNXZBeGRvYTZsS2xlelp0cHJjcStScGs2?=
 =?utf-8?B?WXZ0YVE1VUlxYkgwRHBOUEZhcysxRGFqVHBwM1FsWThFaEVHWGZZSVNNS2di?=
 =?utf-8?B?UVFUNlRnemw1elQ0UXVhSGJkRnNoYTdVY290TTVlTUtSeW9pMWxXY2JRZ1Fl?=
 =?utf-8?B?TVZzeVp4bWNZMFZqUm9zTk4yNThWOWdRQ0c3QkM2U2VEQ25reTM2QTFGeFYx?=
 =?utf-8?B?ejE2b1pxYTlDY1BwZmM0NGJNSExiVXFqbGpVYlcvdWpUNkNGbHpNcHhUWlJq?=
 =?utf-8?B?d1M3RVJxYWtLZ1QwRi9CdUJXL2RLT2hMZXhTQ2QreUNOWVVadGovT3RVN25H?=
 =?utf-8?B?aUpuVVk0RTBFZ2lEQnNFN0dSZmNGNGRPd1Z3MWp6cmdtMDBLU2ZEOWtMU1E5?=
 =?utf-8?B?bGNuZzZOYmt6RXZONmxkZVZxdXVRdjVaL1hWRTlPU1VYV2pXdFVVYnluTk9q?=
 =?utf-8?B?MXM0aFlWWU4vMVY3alVscUwrNm1pZWJ4Y0VOOVB0SVA0NnhWNTFTMjJvYWpW?=
 =?utf-8?B?LythR3kxb3BBSkZKVEFqWlNJak04UnJxT2d1ZDhIeVdLQm13SWtkLzdiekFC?=
 =?utf-8?B?QU1NeW9JM2dRSjlqTjJCSlhyeDl2VmpIL3Y4NWdOZEkrMnZZeTBNQk9QSjdC?=
 =?utf-8?B?dFVxNWZHcDAxU1QrdlZCVXh6MHdncnA2M3E1TUhWR3kzOG9jb3RDZU1rbE05?=
 =?utf-8?B?Sjh1ck1ya0ozZXBnZ3hMWFNBMEluTVVHbUFrU2NUVHZxdzNZc2RSSDN0dzFi?=
 =?utf-8?B?UVBWTi9DeEZ2aHV5NHM0NHh0SWRSVnlNMUFLK0ZUL1p0WHpycHZrTXB5RkY4?=
 =?utf-8?B?NzlwU1FuK2x5S0hhRFJiQ3JqNFlvRjN2NVNtVkJ4eFJyRkkrOURUcjFtaUlt?=
 =?utf-8?B?RWhoWmM2Z3p0SU9ydE03N2p1Zld5TTVOR2IwZXFMemdsNE04MjdDLzUyL05P?=
 =?utf-8?Q?+Sum6dwN0ynVA545jM8taCrdJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AEE2F442A810F14AA91C6A54B4680B7A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB3943.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87eb120-976a-40cd-23ed-08dbccee83d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2023 19:48:18.8409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I4uaRLpzPHc9y5HShDlF3KXpsTlZNLSCaT+NMDQ90nUifCm5M+Alo1SuZeZuaBTrKfjHvrLT6gkQ+ldvxkUEKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB6797
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBPY3QgMTQsIDIwMjMgYXQgMDk6NDM6MDFQTSArMDIwMCwgQWx2aW4gxaBpcHJhZ2Eg
d3JvdGU6DQo+IEZyb206IEFsdmluIMWgaXByYWdhIDxhbHNpQGJhbmctb2x1ZnNlbi5kaz4NCj4g
DQo+IFRoZSBhZHY3NTExIGRyaXZlciBpcyBzb2xlbHkgcmVzcG9uc2libGUgZm9yIHNldHRpbmcg
dGhlIHBoeXNpY2FsDQo+IGFkZHJlc3Mgb2YgaXRzIENFQyBhZGFwdGVyLiBUbyBkbyB0aGlzLCBp
dCBtdXN0IHJlYWQgdGhlIEVESUQuIEhvd2V2ZXIsDQo+IEVESUQgaXMgb25seSByZWFkIHdoZW4g
ZWl0aGVyIHRoZSBkcm1fYnJpZGdlX2Z1bmNzIDo6IGdldF9lZGlkIG9yDQo+IGRybV9jb25uZWN0
b3JfaGVscGVyX2Z1bmNzIDo6IGdldF9tb2RlcyBvcHMgYXJlIGNhbGxlZC4gV2l0aG91dCBsb3Nz
IG9mDQo+IGdlbmVyYWxpdHksIGl0IGNhbm5vdCBiZSBhc3N1bWVkIHRoYXQgdGhlc2Ugb3BzIGFy
ZSBjYWxsZWQgd2hlbiBhIHNpbmsNCj4gZ2V0cyBhdHRhY2hlZC4gVGhlcmVmb3JlIHRoZXJlIGV4
aXN0IHNjZW5hcmlvcyBpbiB3aGljaCB0aGUgQ0VDIHBoeXNpY2FsDQo+IGFkZHJlc3Mgd2lsbCBi
ZSBpbnZhbGlkIChmLmYuZi5mKSwgcmVuZGVyaW5nIHRoZSBDRUMgYWRhcHRlciBpbm9wZXJhYmxl
Lg0KPiANCj4gQWRkcmVzcyB0aGlzIHByb2JsZW0gYnkgYWx3YXlzIGZldGNoaW5nIHRoZSBFRElE
IGluIHRoZSBIUEQgd29yayB3aGVuIHdlDQo+IGRldGVjdCBhIGNvbm5lY3Rpb24uIFRoZSBDRUMg
cGh5c2ljYWwgYWRkcmVzcyBpcyBzZXQgaW4gdGhlIHByb2Nlc3MuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBBbHZpbiDFoGlwcmFnYSA8YWxzaUBiYW5nLW9sdWZzZW4uZGs+DQoNCg0KT29wcywgSSB0
aGluayB0aGF0IEkgZ290IHRoZSBzdWJqZWN0IHByZWZpeCB3cm9uZy4gSXQgc2hvdWxkIGJlDQoN
CiAgICBkcm0vYnJpZGdlOg0KDQphbmQgbm90DQoNCiAgICBkcm06IGJyaWRnZToNCg0KcmlnaHQ/
DQoNClRoYW5rcy4NCg0KS2luZCByZWdhcmRzLA0KQWx2aW4=
