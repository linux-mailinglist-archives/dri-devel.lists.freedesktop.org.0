Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3173039C667
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 08:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22FF46F48E;
	Sat,  5 Jun 2021 06:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2132.outbound.protection.outlook.com [40.107.220.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D25F6F893
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 18:16:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayB1TFVUzG616st0/Ow8CL/UHC7HMzCLPqMtY369XKIBnd2A7AnWZgjg4JwLlG6Cyr5tSZk02iGjJkBQFfRt4IAqpKp5eXmhsbhiFe72BmxxzhoC3tmAlS+oMl/s37OdG1IyPn/tabLuwqSy00t7/MHdT+WTBVu2peXIh0KkWHBkyb/GhPPAErQTmO5dinGPHXQ7w1m6SoA55iPSeN6xJPk/N3PnUO91DsyORLfrdy1cjHKJEJlk+cKhaH32yGM9c0T+vKgudJsGTXAY/p2c/62DV+ZNbLKyS9p2WD1l1D9QUzzAsFscLaNCXJiBXUCLH4dbDay1gosUAj1uCbJzIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlQZjzzr5vQjmvXhqVeUG3BDnHM62qYYjRHeVq6IDtg=;
 b=klG9TKPYRA5KXt6k8IabpAHPols6m0mSEKcq9a8LQYANOCk02keqZDnkn8Je2pMBPHzUhct6A8vaPr0C32V6kPOaEoYG9D1TgMe/5Go2ieWiovkZ75nnYITTbR3N87OnunR9TLeyI1kg3/JIv1/8XsubkxWWKr7RJwuNLhD7X2H2hpgGFqZ1NHI6kzZc3Xuoz1SCBnK4oMlgbGK4qAxPOLw6foaLrMGyn+2EbGN+qLQcMftCn9sG8j17LMzLxDZDjOEYklRdsYE2jmHG3WnaB+EpODUwi4X5V5zFsiP+oCRDORoL7izYK4S1F4vEUVx6aoEBAiA8KGi3uBSnyNXFyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlQZjzzr5vQjmvXhqVeUG3BDnHM62qYYjRHeVq6IDtg=;
 b=Avk9Y+kDlwidqDLsj61sx9Nl8OE+Dix4If1s9NjdPP3C4O4mTmx1/wBhuoLVf97BqiaWws9qyFpTYKB6uF/P7WPt9ylQmXp3yDl18C1GyN4h4OQrL011jE3Q4B+zZHmZhVCv+Iq9kA9F6GJ87dfTMfAXhsOo4u2Qh+87czGkXaI=
Received: from MW2PR2101MB0892.namprd21.prod.outlook.com
 (2603:10b6:302:10::24) by MWHPR21MB0141.namprd21.prod.outlook.com
 (2603:10b6:300:78::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.3; Fri, 4 Jun
 2021 18:16:55 +0000
Received: from MW2PR2101MB0892.namprd21.prod.outlook.com
 ([fe80::7d51:65ac:f054:59c4]) by MW2PR2101MB0892.namprd21.prod.outlook.com
 ([fe80::7d51:65ac:f054:59c4%7]) with mapi id 15.20.4219.014; Fri, 4 Jun 2021
 18:16:54 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Vineeth Pillai <viremana@linux.microsoft.com>, Wei Liu
 <wei.liu@kernel.org>, vkuznets <vkuznets@redhat.com>
Subject: RE: [bug report] Commit ccf953d8f3d6 ("fb_defio: Remove custom
 address_space_operations") breaks Hyper-V FB driver
Thread-Topic: [bug report] Commit ccf953d8f3d6 ("fb_defio: Remove custom
 address_space_operations") breaks Hyper-V FB driver
Thread-Index: AQHXWW3L3fJJ2e+zW0y7P8+sYVIpAg==
Date: Fri, 4 Jun 2021 18:16:54 +0000
Message-ID: <MW2PR2101MB0892518BB763E7D8137E2590BF3B9@MW2PR2101MB0892.namprd21.prod.outlook.com>
References: <87v96tzujm.fsf@vitty.brq.redhat.com>
 <20210604130014.tkeozyn4wxdsr6o2@liuwe-devbox-debian-v2>
 <e5c90203-df8c-1e72-f77d-41db4ff5413f@linux.microsoft.com>
In-Reply-To: <e5c90203-df8c-1e72-f77d-41db4ff5413f@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=e3e14d2c-76e6-49f6-9a7e-5e8853c34ff5;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-06-04T18:11:36Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: linux.microsoft.com; dkim=none (message not signed)
 header.d=none;linux.microsoft.com; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [2601:600:8b00:6b90:7151:7539:d190:d1d5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ffbe855-d0cb-4e95-e57e-08d92784ef14
x-ms-traffictypediagnostic: MWHPR21MB0141:
x-ms-exchange-transport-forked: True
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <MWHPR21MB014174C51448A324ADA544E8BF3B9@MWHPR21MB0141.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bQtXbB0Hu7M/hewSWUliCm8kZn9Ee4K6JYfc/75q5W1BFeB3eopUWWIedGA3RnVB9VJUUj5ahO1VnjeDhxC8VdVXmIJgamyAU62bWDxeyommduALIvb8Sjn3PREPwP3ZBkk48a+1PTmYo13r2UyNxD/T9LS5vGu2InjzT5XppLLVafRMEzdw/cR23xo4uLT9Cmsi8JMSj5TPzKSmw8PZvxprTq3LfmsyuT/NaZthHDvq+vr8ZLVxbSTnfUU/b76RbrPLZ1TPy6GjwHDm34tSfCjuDSTkyPKTpdaStdd3z7qXimCnBFVlnf2FHkiGAF6gpJV+yc3vDNfHxRddviRXGK5JKOCEUKBp4po1/5wD7DE7iGbW2vVUnCOqY5tRruAi49jaUfKFpZHCgPRjK+0XW02cJEYYmkQZxI/rGT989RWMaHgHiuTZ7U325+8yL9dVTcqBd35vmSZ4VnIQ2uW/ifV8IrECnnevtv0ePSlHfR7bTsKymo0Mz8CofMktG1exY3YAuwhW2mjgfa+BOZJflcEE/bUKj0PbO+b4h/kZzJAo9oznI6g5fcwUjc8Q3txSRDaTNfPTXu5MOqfmx2rKP2Zvs4EcsFvjmBVrk7AYDDSjk5AqG1lQAtYQ5waUyptrXf4j+XSnVFIwEuLLwuj8grIMMxyuX6FFj1qIoKYlaDT77dDw+uyjvRCeieVlZzZdX/V47qqoA5hHY8GZV8nWCAVaa2MLPVM02LsVuaJA8hLDTcnJAK3zcR6zs1Tuj1ZS54UoXoVrinKsghiXi2cRBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR2101MB0892.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(478600001)(5660300002)(966005)(52536014)(55016002)(71200400001)(110136005)(76116006)(66476007)(54906003)(66946007)(66556008)(10290500003)(6506007)(53546011)(64756008)(107886003)(9686003)(8990500004)(7696005)(186003)(38100700002)(86362001)(83380400001)(8936002)(2906002)(4326008)(82950400001)(122000001)(82960400001)(66446008)(33656002)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c1B6UkR4ZmdNYUpOZ0JwK29aTytlblNYdExGYTcraUpSbUpDRUtkM01kSGp6?=
 =?utf-8?B?NVlKYUVObjRXaWptOVVyQUdLVWtyVDVSQnBQcmdxakxFOWZUcVFKbnRjRlVv?=
 =?utf-8?B?UjdYUGErY0NZanZSRVYwemdVcEFUOThYZGtEbjlsZXY0YnNZRU82LzA4aTZ4?=
 =?utf-8?B?UW9RZFdUYzNnR3BHb2FPYjcyaU52NXJkei84bytBaCtYKzdLWVlEaWtHS2c2?=
 =?utf-8?B?ZklGRDN1cXhnWDQrU2EyT1NMU0p6SUpEQitHTjhxblB5QXJncEVGcHNOb1lp?=
 =?utf-8?B?eFhUcXc2T0dXdTFuRkJuT0lZU3hqSjZYY1g1V0lpcC9Vb0crcWNpeElnclZa?=
 =?utf-8?B?S2JUaGFxSE41QWZWWFJRVU81aVFKWkNGWXFyWU5kazFJbk50NUVicTZacjBl?=
 =?utf-8?B?K2UyNExuRk9ubDk3cVM0UzJ3aDlrb0VLRzZLZkFRWDRMMnc4Y0hqYitoNStx?=
 =?utf-8?B?VnZpTTVFaFRPNEhqdTFaNktjeG4rMzVrMVRCa2hiQng2SDV6Tmhsam51NE1M?=
 =?utf-8?B?bVZWK0Rhcm9qeEMrSkZkSWhuYmdiZFg1NlZTOWVwb3pvU0ZSY3Y3VVRDTVIv?=
 =?utf-8?B?Y0l1SEZHY0VYSU9FS1QzMkN0NGFyajhrT3BKb05yaElpcnJ5dS94TmJVYmFV?=
 =?utf-8?B?Y1BZL1NMbHF4aXhjZnJQZWFiK1ovMC83MXRrYWF4VkNEU0hvMVd6WVRwcW9N?=
 =?utf-8?B?REVPZk9HQ0ppSVMzdE9kZVhtanIwaDFhQ29kU0NDQk5NTlgvYzFQazFlakRG?=
 =?utf-8?B?eEhNeFpaek9XcWwwSENIenlYSVJETU5lWURvT2h5RUNtUTNIZUZhd2FKNDNt?=
 =?utf-8?B?NGswMFZjY3FsOWI4QVk2NGo1eTNVdFlVV2tPam02ZXJJeTFNRGo0bDgvakdZ?=
 =?utf-8?B?TGUzdVdtMitCY2gwTEt5c2NpR29HYVE2RzNmblJCazJIbDJsTUVxeGRGV1Za?=
 =?utf-8?B?ZFY0VWZRYlRZMHBKeHNGTUs5ZWo1a2k3UkxkTHJZS0RJZnV0UStBajBHUTZi?=
 =?utf-8?B?YWNTQWpFMnBUNUtLOFhYWllPSWJvcTRiSEVrekUwOVB2alAwNU9iRzJYUUZm?=
 =?utf-8?B?ZlNvZjI4OTNOUDhTQnVIZmdKQTNpU281aGNiQTZmckZYdTNkaHp3UHdNb3NW?=
 =?utf-8?B?c25mNjV6VzBwWWlIdDNYellRRjVaVjEwR0xpRzRYQk1ISTJvdGdQZmVoR2g5?=
 =?utf-8?B?K0JybHlQN0U5L0tQTDBJRXVpb25xSzBuY0tRWVBjekxkaXFuWDM3OFU0OTAv?=
 =?utf-8?B?cWVOcHJmNHU0VjZqek5neVFvZ0JOMk1DbXBxQjZ1OGNWQklnMVVxZTFxTnZO?=
 =?utf-8?B?Q1plYzFucFFEREI4bVhBYUlKaGI1U1hhNGNmVU0xQytGbC9NaEZZdkt1VS84?=
 =?utf-8?B?dG1GV0FRT1ExV082QUNEaXBmQ25WTm9abExiS1gveGJ5dHJnOUNoU09OVFd4?=
 =?utf-8?B?VDJnOXJBT3o3UU1Ecm40RVFCQndQVDlRR05GeGhKTVBJcTFWMUhQTXVFNUNI?=
 =?utf-8?B?NFdZV3ZySS9VM3JJMlZ3dk4xTHpTeEtVNzBTSnhXQXZnVlJKeUJWZ0FFWjBv?=
 =?utf-8?B?QXJpTE9lRnRyd1h2QXY4UDZoVnl0R0hXNGU3UUN4ZUVhT3NvNGN6ZEhNb3R2?=
 =?utf-8?B?VEZ6UENMZzh1eXVEN0hqK2ZubUdMZlZvd3M4MXAxOEF4dkdESndGc1hOaXU0?=
 =?utf-8?B?MDNGZzdmQ3VHMFcyYzFKd1U4ejJXTldFeGlUMlAvc3dzUk9RbmVwc0MwR1hO?=
 =?utf-8?B?UnFISnhtd056MlZId3dackVTMlN1OXJBVEk2SUozUG56S1RZelBIWGdPb2Fj?=
 =?utf-8?B?VXdSczhjazJILzF5VmJqNHNUckwyUWFJUU53NVVTVHNyNXpHL3JDWVdiUlJE?=
 =?utf-8?Q?w9j3u/thDqU+/?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR2101MB0892.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffbe855-d0cb-4e95-e57e-08d92784ef14
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 18:16:54.8946 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hzrQQkQzr782xJr52c3rS+iV5Es1dLISSUTUR9nSX5hFBJQdO4Up9kxVyDPdDET4Ud+E90Dydygsm3FKCiFrNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0141
X-Mailman-Approved-At: Sat, 05 Jun 2021 06:48:03 +0000
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michael Kelley <mikelley@microsoft.com>, Matthew Wilcox <willy@infradead.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBWaW5lZXRoIFBpbGxhaSA8dmlyZW1hbmFAbGludXgubWljcm9zb2Z0LmNvbT4NCj4g
U2VudDogRnJpZGF5LCBKdW5lIDQsIDIwMjEgODo0NyBBTQ0KPiBUbzogV2VpIExpdSA8d2VpLmxp
dUBrZXJuZWwub3JnPjsgdmt1em5ldHMgPHZrdXpuZXRzQHJlZGhhdC5jb20+DQo+IENjOiBNYXR0
aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7DQo+IGxpbnV4LWh5cGVydkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWZiZGV2QHZn
ZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgTWljaGFlbCBL
ZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+Ow0KPiBEZXh1YW4gQ3VpIDxkZWN1aUBtaWNy
b3NvZnQuY29tPg0KPiBTdWJqZWN0OiBSZTogW2J1ZyByZXBvcnRdIENvbW1pdCBjY2Y5NTNkOGYz
ZDYgKCJmYl9kZWZpbzogUmVtb3ZlIGN1c3RvbQ0KPiBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMi
KSBicmVha3MgSHlwZXItViBGQiBkcml2ZXINCj4gDQo+IA0KPiBPbiA2LzQvMjAyMSA5OjAwIEFN
LCBXZWkgTGl1IHdyb3RlOg0KPiA+IE9uIEZyaSwgSnVuIDA0LCAyMDIxIGF0IDAyOjI1OjAxUE0g
KzAyMDAsIFZpdGFseSBLdXpuZXRzb3Ygd3JvdGU6DQo+ID4+IEhpLA0KPiA+Pg0KPiA+PiBDb21t
aXQgY2NmOTUzZDhmM2Q2ICgiZmJfZGVmaW86IFJlbW92ZSBjdXN0b20NCj4gYWRkcmVzc19zcGFj
ZV9vcGVyYXRpb25zIikNCj4gPj4gc2VlbXMgdG8gYmUgYnJlYWtpbmcgSHlwZXItViBmcmFtZWJ1
ZmZlcg0KPiA+PiAoZHJpdmVycy92aWRlby9mYmRldi9oeXBlcnZfZmIuYykgZHJpdmVyIGZvciBt
ZTogSHlwZXItViBndWVzdCBib290cw0KPiA+PiB3ZWxsIGFuZCBwbHltb3V0aCBldmVuIHdvcmtz
IGJ1dCB3aGVuIEkgdHJ5IHN0YXJ0aW5nIEdub21lLCB2aXJ0dWFsDQo+ID4+IHNjcmVlbiBqdXN0
IGdvZXMgYmxhY2suIFJldmVydGluZyB0aGUgYWJvdmUgbWVudGlvbmVkIGNvbW1pdCBvbiB0b3Ag
b2YNCj4gPj4gNS4xMy1yYzQgc2F2ZXMgdGhlIGRheS4gVGhlIGJlaGF2aW9yIGlzIDEwMCUgcmVw
cm9kdWNpYmxlLiBJJ20gdXNpbmcNCj4gPj4gR2VuMiBndWVzdCBydW5pbmcgb24gSHlwZXItViAy
MDE5LiBJdCB3YXMgYWxzbyByZXBvcnRlZCB0aGF0IEdlbjEgZ3Vlc3RzDQo+ID4+IGFyZSBlcXVh
bGx5IGJyb2tlbi4NCj4gPj4NCj4gPj4gSXMgdGhpcyBzb21ldGhpbmcga25vd24/DQo+ID4+DQo+
ID4gSSd2ZSBoZWFyZCBhIHNpbWlsYXIgcmVwb3J0IGZyb20gVmluZWV0aCBidXQgd2UgZGlkbid0
IGdldCB0byB0aGUgYm90dG9tDQo+ID4gb2YgdGhpcy4NCj4gSSBoYXZlIGp1c3QgdHJpZWQgcmV2
ZXJ0aW5nIHRoZSBjb21taXQgbWVudGlvbmVkIGFib3ZlIGFuZCBpdCBzb2x2ZXMgdGhlDQo+IEdV
SSBmcmVlemUNCj4gSSB3YXMgYWxzbyBzZWVpbmcuIFByZXZpb3VzbHksIGxvZ2luIHNjcmVlbiB3
YXMganVzdCBmcmVlemluZywgYnV0IFZNDQo+IHdhcyBhY2Nlc3NpYmxlDQo+IHRocm91Z2ggc3No
LiBXaXRoIHRoZSBhYm92ZSBjb21taXQgcmV2ZXJ0ZWQsIEkgY2FuIGxvZ2luIHRvIEdub21lLg0K
PiANCj4gTG9va3MgbGlrZSBJIGFtIGFsc28gZXhwZXJpZW5jaW5nIHRoZSBzYW1lIGJ1ZyBtZW50
aW9uZWQgaGVyZS4NCj4gDQo+IFRoYW5rcywNCj4gVmluZWV0aA0KDQpBcyBNYXR0aGV3IG1lbnRp
b25lZCwgdGhpcyBpcyBhIGtub3duIGlzc3VlOg0KaHR0cHM6Ly9sd24ubmV0L21sL2xpbnV4LWtl
cm5lbC9ZTFpFaHYwY3BacDh1VkUzQGNhc3Blci5pbmZyYWRlYWQub3JnLw0KDQpNYXR0aGV3IGhh
cyByZXZlcnRlZCBjY2Y5NTNkOGYzZDY6DQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD0wYjc4ZjhiY2Y0
OTUxYWYzMGIwYWU4M2VhNGZhZDI3ZDY0MWFiNjE3DQpzbyB0aGUgbGF0ZXN0IG1haW5saW5lIHNo
b3VsZCB3b3JrIG5vdy4NCg0KVGhhbmtzLA0KRGV4dWFuDQoNCg==
