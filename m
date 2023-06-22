Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D4773A2B4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 16:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E2010E566;
	Thu, 22 Jun 2023 14:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D9310E566
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 14:11:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTcnNnSRPvEuIBtvogIhBmg7ssX33hJypVIdIlQXIFb4u2+DU1mtQfGUtZS4iUIpTZPl47i1PAh+PQnqMzJRkGIPef5rYu7O6J13i/n7UCtPTcgp7J+3w+5uCpqBWOn//M/j8ld7q9pNb4mJ5F1qCU/WzQeAcCHT+373D/6s0uUy/1Okmzhbf5/p4nR49X8JHQqtfaW3VMBvCrHHhMf/t8MHhoyjMm0gVFwkjl2xGwXLPntw8Ffe3KqPLwCbQf0v8WMNYKAEQzWbsgCYSwj8IUQFyVN4iJ4sK4cd/VYEc5TRmgbOaOl+Nhy1WyBF7+UB24nLwltffVRSGxwtS5BvMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFZ7dJ7GOWfiN1ovKpcUWGHKhKnHfiRupc3jPHYVEBg=;
 b=STW4q46tBIR70jZaR0z1y9xFqVYcklmXvkSb1JdEvYL+Jln/J7Zbe9pVY7bmSbAvHcdvUoW0wyN3NyY5nzfvP5eHofxzAjW3whjJfalWshVtmuAgAlYl7Vswf1in4RldKl7SOe4KIVNBs3RIzFk4KvigkcxSftbt7aABDn0FBv9QI8e/V8V0qDw2EXaR+4aWJcEY3oks1UWz3Fch8YTOZtjsxDVpmfW8uVsTIskTDY1y7nVNOthxJHRAUzN/dE9MhDDuBtc4h/r28WidbP2Y17ZKmYUqV+ZS8BX4vWytYOro1jyw5XgrDtYuUQbSulK0mS8fwNqgaWqc8CyrfZkwAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFZ7dJ7GOWfiN1ovKpcUWGHKhKnHfiRupc3jPHYVEBg=;
 b=QTyTkn418Eph85ipHVLWbuxP9eKOwBAi1epK2Mg6b2H6JzU/rA0xShGk34jdsGg/th2NfOj5vntb6w+j9lcXY9NeY8iYYHyfiYRSM/6mjhg4GdYGcCF3n69HCSpOHeSPZvodhFlCfAX8Pr/wgODGsD2+gq8VzaMNZbJs+hvwYtg=
Received: from BL0PR12MB2532.namprd12.prod.outlook.com (2603:10b6:207:4a::20)
 by SA1PR12MB7318.namprd12.prod.outlook.com (2603:10b6:806:2b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 14:11:49 +0000
Received: from BL0PR12MB2532.namprd12.prod.outlook.com
 ([fe80::81dd:ae36:d1e2:9a4]) by BL0PR12MB2532.namprd12.prod.outlook.com
 ([fe80::81dd:ae36:d1e2:9a4%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 14:11:48 +0000
From: "Li, Yunxiang (Teddy)" <Yunxiang.Li@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 1/2] drm/amdgpu: fix missing fence reserve in
 amdgpu_vm_sdma_commit
Thread-Topic: [PATCH 1/2] drm/amdgpu: fix missing fence reserve in
 amdgpu_vm_sdma_commit
Thread-Index: AQHZpF0/k5itoKtVsUu/oAnSec3mna+WcJiAgABsYBA=
Date: Thu, 22 Jun 2023 14:11:48 +0000
Message-ID: <BL0PR12MB2532A14726F4BF29714B3571ED22A@BL0PR12MB2532.namprd12.prod.outlook.com>
References: <20230621162652.10875-1-Yunxiang.Li@amd.com>
 <20230621162652.10875-2-Yunxiang.Li@amd.com>
 <1c71ea03-af46-18eb-0698-9a1c771671c6@amd.com>
In-Reply-To: <1c71ea03-af46-18eb-0698-9a1c771671c6@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=8517d1eb-d235-4f58-af79-1b4ac61ea131;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-06-22T14:07:31Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR12MB2532:EE_|SA1PR12MB7318:EE_
x-ms-office365-filtering-correlation-id: 4d77455b-49f1-4349-bebf-08db732a9e3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JzZc5d7CGjDiMHJH7jcrasM8e/++OgEa1tzsaRUrUk2NFS4FnYaLX7WSx6AK/rWSMlXLnjSWTrZQ/v53SmN+kMI2VYev6vnlJmziSDHJbbfW/XpZtDs+7rdT03NpCocesGsYdDrht7wllsLSMEzzkXb3KgwDWUFNmHLPidxFhsuVZY7kIuXI9Wpygv5n3tNrH9WAElfkMBdzC9H6fSkvTe6nBwKaf+bXKKm+On00e0SUsRQ6y7O51tywZ+xKG0OoH1OajBjrRM7y2MjxTWX5xrvIwfWJfHPC3eqMqdhBh4kPmOQ0l86lCyCu3G7BI5YydssEocrs0FX0a1evn/aJFH1+ZkYTbAt258ZgYU7id+wWWxD4U96hrnIRD7+4+js3njQr/INDM0WqGj+3I9+IaI2JLWqEDdZmc5ohDu4n6BLCF4j3buMlHYLvd/tWBic2iz5rIFgC0KmdS++XR4YFKNYNgQ4aIxJ+H1QulGuTf4Q9DCxjoNPBZBT6NTSM+lw/J2GQtDh/qExBW/z6RlLo3MKS4+juib21G54LNwiti/xhuCqfhX3Pikfv4CTPVvDjIDu3ZrFHHya6SEEIFxBZ7MjPCVX9EE6Xi2wjdXL50sayiDp5LkbdW75+xf6NE2q6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2532.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199021)(33656002)(122000001)(53546011)(6506007)(9686003)(71200400001)(186003)(7696005)(478600001)(86362001)(110136005)(64756008)(66446008)(66476007)(76116006)(66946007)(6636002)(66556008)(83380400001)(41300700001)(316002)(52536014)(5660300002)(2906002)(26005)(38100700002)(8936002)(8676002)(55016003)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3pwemFZTzhTa1VUUmE2ZlA2MDFZQi9PNlllWVhiUDZndVZJVjdBbFR5dFBl?=
 =?utf-8?B?cnZXSU5rSFc3M2VmendCWEJOYllaMXZHWEI3M0JNa2J4bE9Xbll2cUxQZjN4?=
 =?utf-8?B?Zkx5aC9WeU50ZndUL0pvTHF4OW42QU5STEFvMXNFeWRMM1lZaHpQMFRDREYv?=
 =?utf-8?B?ZGo3ME5YRUk0ZnVzR1dRRTBRRWdtdmhVaTdyMlZnTVlnbThhc25hTjZXSTZw?=
 =?utf-8?B?dTNOMkswbjhsSEp6S3p5RlFRbmtUOWdZSXR1THYwRnRwRkhFcVptQnkrZWo2?=
 =?utf-8?B?enpVOStqMytmZ1hDdTlaSW5JeGdHdDU5Zm5mVDdndmNhZjJmeTIxY2ZtSmNQ?=
 =?utf-8?B?a2Z0eE9sZ0FoZzdYT1Y0S0ZmbU1KejdCRHNUcGxnbGw1ZUsvdFVMeDdvSm9t?=
 =?utf-8?B?TEczYkM4TzRpaTd2NWtXanpNVHhHeG5OZ25hQmNsMjZoeXBDUEozK0RRblh3?=
 =?utf-8?B?RkZwSS9nWER2WUQ0NG5VeWVtc0ZZSUlzQnhqQ2RwbmJCcVF5ZXBOM2k3cHFj?=
 =?utf-8?B?SmltN21MQW9aUklYbEdTTWhTL0NDTjFCaE1SUG1VdlhHQy9YcjJwMG9mN3pV?=
 =?utf-8?B?NDhkVGdFaTFJUUZ2aW1BZE9aZElYOTB1NXRicHl3ejBaWTNuTVpYUi9UQ2Qv?=
 =?utf-8?B?Z3VCOFNuNEZoWm8xOHlISGsyV2dPTGVDSFVmV3dESCtFNURtZm9za3B6WDRW?=
 =?utf-8?B?b0g0WkRYbDEzcFBlRkk1aUNONndESjFSTUJCSlFLTmVzVm9aU0VGSUFxUnVO?=
 =?utf-8?B?VWJmZCtnRmNmVFA2VzFwV0Fjb05pNE5Gd05HTUxHM04wZ09MTlNMSmRjWUlk?=
 =?utf-8?B?cnBuM0t6aFVxZ05yN1h0K2tEdktnT1V0M3BiTTVpZURoREFEN01FSkp6aFE1?=
 =?utf-8?B?aGs5ZXhEV1Z1MmxKbVZmTkorcURVOU9NeE1zR0JyN0VTVUJoR2U4YUEzbGd6?=
 =?utf-8?B?WExNQXQyUzFXWm5sejltWTY0b0FIKzZtZ0pVMGZjayt4d2R1aXltWDU1RWRG?=
 =?utf-8?B?cUFHTE4yV3ZtRVhRQ3lFRVdHWG5CTS9KY0FZNXppVWpFMkh0MGQzOHdiUkZp?=
 =?utf-8?B?Y1ZwVEJlMHpFUXpnOXlkZkgveEs2TS96b1pXdTZVZkxRdFZrMm5UaGR1NWRD?=
 =?utf-8?B?T0Z4b1ZEV3VwM1crSUtCbERVQjdXYldZTWFBRWgvNXJNSHJHN0tIUzM4RUJJ?=
 =?utf-8?B?Q3dqZ3RtaExQN2ZyQ0QzdmVlSUxMczY5UzZWdFdQcHE1d3V0SWxiWldBb0cz?=
 =?utf-8?B?aWJ3NHZyaHI0b3BFQ25qdnhmVUtqaytHOEhtK20xY3F2NUVYL3FFaytaRStO?=
 =?utf-8?B?R056RHRjL3FMdEo1cmpvTXF2NjZqeWpweXI2alNUdDU0U1RLTnlvQzd5SmVu?=
 =?utf-8?B?ZmNCUUxwejVzRUVCV2xyMzc2cnNJcm8rNyt2NzdxeUI3QkhuSzJpNnN4T2s1?=
 =?utf-8?B?VnZrWmowTnd5SWxjbk9EbTJIeVJwVUQ3UHNsTXVFL1l3N1hjSGdIWjZvOUxE?=
 =?utf-8?B?TXFaLytXNjYxVmgwMUhUclRGbWREUlZrejladkZoSFpFYjBHKzV0VlJoaTE3?=
 =?utf-8?B?Zy8xZktRekdramc5L01ja2MwWnAvSVBJNk1sMFFSUDNWYmNuanRSY1VZQWg3?=
 =?utf-8?B?T2tETTEyeXpNSDRLTDZXMGhCLzF5OXlMSHROMGVKQUFDODYydnZCTGJPQ0kw?=
 =?utf-8?B?azlVRThWeUNaUDZUUkRnMWlYSHBjbEFrMDdMS3h0YlBISDIrbFVrY2NMUjAr?=
 =?utf-8?B?WjE4Y3dXMEJpNnlmWGVabzFJUDk5OVR6WkpDRUFDQlVOd3QwRFJ2RVBxeWdn?=
 =?utf-8?B?eGNLbWhzOW1SRmNrSG41MjMvYWNoNDJSYjg2YlFQdmFWMTl2RzBkTDczU0gx?=
 =?utf-8?B?UkJkd1R3eDRudDNqMldkTlNicmh2ZFByUFZUdGFITEhQejZ3bDVjbWUyY1pY?=
 =?utf-8?B?Vlo2UG80M1FTT05ZMUlNZUtKYlg1cjFhVTV0eGJnQTJlZGg1NnhzblBjV2Na?=
 =?utf-8?B?RHZ2RFFSOVZ0NG5mSFBlY05NblhSK0RMSzhoMWRVOTJQK0k4MG02MVJyaEVm?=
 =?utf-8?B?VzBBYlJ1UWZ3ckFaQThrR3dic2FFV2dhcGs3WFNTRStBQy9JQWl3bFlDNm1h?=
 =?utf-8?Q?cvDs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2532.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d77455b-49f1-4349-bebf-08db732a9e3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2023 14:11:48.3446 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ycpWjMstQQwMxsIZ1L6Z4qsoPXQGp5rZzemhq95MAdlvjmxo44vMkDxWul259cUtYeOfiU4BR1st3IDu2tWd4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7318
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

W1B1YmxpY10NCg0KSWYgSSB0YWtlIG91dCB0aGlzIHJlc2VydmUgYW5kIHRoZSBjaGFuZ2UgdGhh
dCBtYWtlcyBkbWFfcmVzdl9yZXNlcnZlX2ZlbmNlcyBuZXN0YWJsZSwgSSBnZXQgYSBCVUcgaW4g
dGhlIGFkZF9mZW5jZSwgc28gd2UgbWlnaHQgYmUgbWlzc2luZyBhIHJlc2VydmUgc29tZXdoZXJl
IGVsc2UgdGhlbi4NCg0KVGVkZHkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQpTZW50OiBUaHVy
c2RheSwgSnVuZSAyMiwgMjAyMyAzOjM5DQpUbzogTGksIFl1bnhpYW5nIChUZWRkeSkgPFl1bnhp
YW5nLkxpQGFtZC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEZXVjaGVy
LCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1BB
VENIIDEvMl0gZHJtL2FtZGdwdTogZml4IG1pc3NpbmcgZmVuY2UgcmVzZXJ2ZSBpbiBhbWRncHVf
dm1fc2RtYV9jb21taXQNCg0KQW0gMjEuMDYuMjMgdW0gMTg6MjMgc2NocmllYiBZdW54aWFuZyBM
aToNCj4gV2hlbiBhbWRncHVfYm9fZmVuY2UgaXMgY29udmVydGVkIHRvIGRtYV9yZXN2X2FkZF9m
ZW5jZSwgdGhlIHJlc2VydmUNCj4gd2FzIHJlbW92ZWQgaW4gdGhhdCBwcm9jZXNzLCBzbyBwdXR0
aW5nIGl0IGJhY2suDQoNClRoZSBzbG90cyBmb3IgdGhpcyBhcmUgcmVzZXJ2ZWQgaW4gYW1kZ3B1
X3ZtX2dldF9wZF9ibygpOg0KDQogICAgICAgICAvKiBUd28gZm9yIFZNIHVwZGF0ZXMsIG9uZSBm
b3IgVFRNIGFuZCBvbmUgZm9yIHRoZSBDUyBqb2IgKi8NCiAgICAgICAgIGVudHJ5LT50di5udW1f
c2hhcmVkID0gNDsNCg0KVGhlIHByb2JsZW0gaGVyZSBpcyByYXRoZXIgdGhhdCB3ZSBkaWRuJ3Qg
dG9vayB0aGUgZ2FuZyBzdWJtaXQgaW50byBhY2NvdW50LiBTZWUgbXkgcGF0Y2ggZWFybGllciB0
aGlzIHdlZWsgSSd2ZSBDQ2VkIHlvdSBvbi4NCi4NCj4NCj4gRml4ZXM6IDQyNDcwODQwNTdjZiAo
ImRybS9hbWRncHU6IHVzZSBETUFfUkVTVl9VU0FHRV9CT09LS0VFUCB2MiIpDQo+IFNpZ25lZC1v
ZmYtYnk6IFl1bnhpYW5nIExpIDxZdW54aWFuZy5MaUBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm1fc2RtYS5jIHwgNCArKysrDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3NkbWEuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92bV9zZG1hLmMNCj4gaW5kZXggMzQ5NDE2ZTE3NmExLi5mNTkwYjk3
ODUzZDkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92
bV9zZG1hLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtX3Nk
bWEuYw0KPiBAQCAtMTIwLDYgKzEyMCw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX3NkbWFfY29t
bWl0KHN0cnVjdCBhbWRncHVfdm1fdXBkYXRlX3BhcmFtcyAqcCwNCj4gICAgICAgc3RydWN0IGFt
ZGdwdV9pYiAqaWIgPSBwLT5qb2ItPmliczsNCj4gICAgICAgc3RydWN0IGFtZGdwdV9yaW5nICpy
aW5nOw0KPiAgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICpmOw0KPiArICAgICBpbnQgcjsNCj4NCj4g
ICAgICAgcmluZyA9IGNvbnRhaW5lcl9vZihwLT52bS0+ZGVsYXllZC5ycS0+c2NoZWQsIHN0cnVj
dCBhbWRncHVfcmluZywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICBzY2hlZCk7DQo+IEBA
IC0xMzUsNiArMTM2LDkgQEAgc3RhdGljIGludCBhbWRncHVfdm1fc2RtYV9jb21taXQoc3RydWN0
IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwLA0KPiAgICAgICAgICAgICAgIHN3YXAocC0+dm0t
Pmxhc3RfdW5sb2NrZWQsIHRtcCk7DQo+ICAgICAgICAgICAgICAgZG1hX2ZlbmNlX3B1dCh0bXAp
Ow0KPiAgICAgICB9IGVsc2Ugew0KPiArICAgICAgICAgICAgIHIgPSBkbWFfcmVzdl9yZXNlcnZl
X2ZlbmNlcyhwLT52bS0+cm9vdC5iby0+dGJvLmJhc2UucmVzdiwgMSk7DQo+ICsgICAgICAgICAg
ICAgaWYgKHIpDQo+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcjsNCg0KVGhhdCBpcyBz
aW1wbHkgaWxsZWdhbCBhbmQgd291bGQgcG90ZW50aWFsbHkgbGVhZCB0byBtZW1vcnkgY29ycnVw
dGlvbi4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPiAgICAgICAgICAgICAgIGRtYV9yZXN2
X2FkZF9mZW5jZShwLT52bS0+cm9vdC5iby0+dGJvLmJhc2UucmVzdiwgZiwNCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgRE1BX1JFU1ZfVVNBR0VfQk9PS0tFRVApOw0KPiAgICAg
ICB9DQoNCg==
