Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCA97FA6C7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 17:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F9B10E3AA;
	Mon, 27 Nov 2023 16:47:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2072.outbound.protection.outlook.com [40.107.212.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5D210E3A7;
 Mon, 27 Nov 2023 16:47:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmBxM697Y45pIeBkxGAbzRKilL7yqQ5lbhckys4yYn01MktqsvQbJaQBDa7KB1mjhrAAG/EE5cVTTfGqQP00kFmU0KOikonCcTbUudGzYZzct1TGB6RM8Y15IJMtiWXTSLgBiP3Fcl+0aCHIfsCh+rUtrRhr3CqtM2YVrzmLraEIdra/b6nw1nAMgZNdpTFn5mFTRALJjI2uvlTL2/CKciE+SO7sH1u3G5DgftYGLleoKK6CC3MGf2TpE3CU5fhLeE0JU72B2cihZn9nwhCz5RiR9lD81uXft5NRIkSR6fKWNsOlYzMGaM60t/dtyanxDtVrV+n3+d86HV+75pjwlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGemuuBY+hjH85EvOEn96A+fP5i7unOdhhML6xdQ35A=;
 b=UmY5TcGKiVBL/n/U/SktSTMV6wTKpZJQRlRs6yXhPDjfqVBianSqXdQZgBd01TfqoUgJ34FZFqiudt838NbMeHrQI9ypNH0B6ArC1uds9SteAOLaCzyy0/X03bmfbKh6h+d2TjG1XWgsKhCCOKa1kLxlj/S7Iy49Nal0F+fT1eWfy9/+HoUEz0MDOVNT3EtxdE8PnSER4H/L0tjLncBPof947ht3uw4rT9QVpQ1zbdkpThMivRipybOZ44OTe4J2f1vqMV7pHlPhLL9mzLlg2lCmo29/pzK7KFMYXcJDBy51g6B525YMXPg7Qln2J8ZQqk3mHITw2R19w02gCRnWfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGemuuBY+hjH85EvOEn96A+fP5i7unOdhhML6xdQ35A=;
 b=CJ+/EZVpnEAEQ7uQHKWxAi/Ns9NjvCuyFcApOxMu2dyGHaUCUYF5CuAXONRltEIW/4M0wqPoLYa3TMcHiDTuKBDZTQpWwTAJSRaBmku83Ghs0Urc0Tf/NOZ9XsFoty7FKITN0gckCF0OdAnTiwCKIGiHLxHt0I6T7Tc0xPGZJfw=
Received: from DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) by
 CH2PR12MB4937.namprd12.prod.outlook.com (2603:10b6:610:64::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.27; Mon, 27 Nov 2023 16:47:33 +0000
Received: from DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::dcad:56ce:1100:aae1]) by DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::dcad:56ce:1100:aae1%5]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 16:47:33 +0000
From: "Bhardwaj, Rajneesh" <Rajneesh.Bhardwaj@amd.com>
To: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "kherbst@redhat.com" <kherbst@redhat.com>, "dakr@redhat.com"
 <dakr@redhat.com>, "zackr@vmware.com" <zackr@vmware.com>, "Olsak, Marek"
 <Marek.Olsak@amd.com>, "linux-graphics-maintainer@vmware.com"
 <linux-graphics-maintainer@vmware.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>, "spice-devel@lists.freedesktop.org"
 <spice-devel@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/amdgpu: use GTT only as fallback for VRAM|GTT
Thread-Topic: [PATCH 2/2] drm/amdgpu: use GTT only as fallback for VRAM|GTT
Thread-Index: AQHaIUG0PC+yio85QE+57yM/Xo8AMLCOUSGAgAAOIWA=
Date: Mon, 27 Nov 2023 16:47:33 +0000
Message-ID: <DS7PR12MB59339B73B38A4EFDB2A67A9FFEBDA@DS7PR12MB5933.namprd12.prod.outlook.com>
References: <20231127145437.15060-1-christian.koenig@amd.com>
 <20231127145437.15060-3-christian.koenig@amd.com>
 <a6e10770-32de-4235-a86f-02a90e93a0f4@amd.com>
In-Reply-To: <a6e10770-32de-4235-a86f-02a90e93a0f4@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=ff1a4cbe-ac87-4e54-b030-098c791f3c88;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-11-27T16:43:44Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5933:EE_|CH2PR12MB4937:EE_
x-ms-office365-filtering-correlation-id: 330643cd-6a6d-4bb6-26c9-08dbef688d84
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vezNGBn7C5w6uF+rEb7XpqhomygR6CaIvqvVT2pxN7+4T85AUI0qbCCdxpGjTJdkoXqdm0SAb7Wvq3/TxlelGxnFGhWroDPMyoaH2re2jpqrmU32AMLaTCIYJC34jzBbT8eFJ1WJKUbgZDj+uyYkumeRw7U7kLWg54i+js20UoJIuyj8nW1ERFrIpFUJf3LoZNSbO4/mcvbM/HDKuTqDO6hrVmeukeKHBbe4akoS0ngXg/mdMxhfZJSUhSel4FLUa1KLzzMvB69GnWzCjybjla0Bj0/u2Z+Ouh73cO+NeMTZfG5BGRDx7MV5IW/aPIDx6m0YEO2mPfqxoUS/rkZWURm9OBC7I6Htuh9Qv69kfcrJr2fovCB8VyDVPB2wae/HNDfl9nwujTXM0pnnRrjxRKJy28g4F1s8aP9o/rdA3Tw3NcNb1kCGVbgrtkXHUnWt2Elt3LSCnm/JvwFLT3n0CaBCmNKMPFYMNRAH1NmevgC4JynShTCtO1+SnQuhU6hOUdjQ76BmET7L/+8/8eI91dN8SiBryHTa2P5gHX3Xbah8TNj/5FIL2rcIyruZASFNXBecCI5DH6GXqtTjm+5KHu6fbens3mdSXyAViDpuJmiIC7ItxH9AYBeiF0/TmAjPb9dGfzx/ywYurEuF0k1/4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB5933.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(7416002)(52536014)(76116006)(41300700001)(66946007)(110136005)(55016003)(9686003)(53546011)(64756008)(8676002)(8936002)(316002)(66446008)(66476007)(66556008)(478600001)(71200400001)(966005)(6506007)(7696005)(5660300002)(66574015)(26005)(83380400001)(38100700002)(86362001)(122000001)(38070700009)(33656002)(921008)(83133001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmhNQklpZ2dTcEJUa1YrbDczdUJHR1BWRmluTG1xT0VYdit6bjI3K1BvUjJj?=
 =?utf-8?B?RlN0dGxZR1dPb2R1WWlHSDd0MDNjOEJTV3ZHcHN2dnFqVFNNczdzTWMrbHdB?=
 =?utf-8?B?U2RHVW1JVWRkSzAzNzdRZXUyczA1R2t4cisrQXZOQms4L1NLdWN2ajY0aG5r?=
 =?utf-8?B?MFdhM1pFZ1VMQnphUUpRaXB5UUYvVFdCbVQ2TmpFZjVsNkVKSjdwUDJ2NkRK?=
 =?utf-8?B?dzJibTY4WFdlUElKcTJrSzA5MzMyckRkbWl2NWdpdGkzRzJ0WUE1VVpQcHJR?=
 =?utf-8?B?VEVlbDk5TWJZbTBpWitpTFVpK1NNTUluMzZIdkpyYi9pQWpEZ0dYZGhzWmpB?=
 =?utf-8?B?MkxWemg4TW8rUnN5RkU0VFNPUE9GV3lXOGxxRk5mYkhzUDlVZC9DWVF6ZzJW?=
 =?utf-8?B?Qmp4b2d1NzFDSElSRXlsQWZTeTQ1UDduKzN4NUxtYzVIN0srNW5hYmVyKzZx?=
 =?utf-8?B?NWhQQzRaMkFFNXZiaS9ZZmVFWUVYNEl3NGEvQmtLTkRhRk1xUFlBdG1McEF4?=
 =?utf-8?B?TTd1elVTRVQ4MkVYMHB4TDVTY0l5Q0M2aEZIQkVYVjN0UjV5dWd5SVdPZnFn?=
 =?utf-8?B?T2YrK2JPUTFuTS9xUnFrOHN5OCtLWm01MFRoQ1JVOGNNcVY5Z3JCYUxmdWNP?=
 =?utf-8?B?QU9BYUROMzdrc2xjWjhkT1ZUT3FkTEJhSW9xNU1BRzk3NldrUHRtYWs0bG5o?=
 =?utf-8?B?TnN1amhoRTgrdFY5cGt2enREQ3ZmKzN3MlJ6cjBicHh3b1VZdXlYb1F5RW1Z?=
 =?utf-8?B?M2NwVnZ4OXNxUHZyR1M4V1U2SnVRTmYrckc4MDlZa0sxdnpnK1NlazZGeGo1?=
 =?utf-8?B?dHNBcHEyTjZZUDJ2REJSTEx2akswVFhBOUhwV1AwZSt0SHF3RWNIS2hwcmp4?=
 =?utf-8?B?UTRBbFdld1RHcnpKdGFGNi9LcEtEQmpFM0ppNFlsdVVrVWJMeUVuSnQza3hH?=
 =?utf-8?B?V1NXYlBJMzN1cGU2MTQ1dThLZEEzaDhRVmR6S25LcEc4WWtLMDhrajVUU3BE?=
 =?utf-8?B?T2ZLaG4rUWEzVzBxQSs0cU1vNHA3a3U4eWVpUjJVT2dLbm1pZWV3TlFwMFpL?=
 =?utf-8?B?U0Z1MGlXUzhDN1VCMndyRVN1dG9XR0d2cStZaE4vUUVZS3d2aEtqdU5XYlFX?=
 =?utf-8?B?V0VJQm4wYkdEOUdXWGJLa1RkQWRRWUFRYmJnZ1BQRU8wR1hwbjVKalo3a2Zv?=
 =?utf-8?B?VUVLZCtlaGQrMXNZREE2VHJDTmVwb0dmZGVyMGtNTFpPajFtWDRNUmE2RmNN?=
 =?utf-8?B?Ykl2aWx2blJqRmxFdExUV2ZNS09IZ1YrYUk4UlR2cDNFTllxeUFXMEF5WUd1?=
 =?utf-8?B?WDRMOHEwQ3I5VmtyMlhDVzNabjNGUmVLVkhsSVZzb3h5VUVSK2szNHhlUUZE?=
 =?utf-8?B?c0R3Y0xnVVJnN0ZNLzJFTE1Nb3lKenNLSjJISytpNjR2YnNobXdFN0JYSkN6?=
 =?utf-8?B?OWZ5RFB3YlREOTBSQnBwN284cEd5bERocGVOVXM5Y2pnNnA4NnpRdjVKVkdX?=
 =?utf-8?B?MXpOeS9iQkcrUnhzTkdWWkFYRTdtQm5sNmtZV0hVTUluVFI1UGw5L2lCMVFm?=
 =?utf-8?B?VUcyS292RmxZRHlTQnhYMllCMkxwYm96L3FyQjJObFZuNVNOWGovNE56bzV5?=
 =?utf-8?B?WG1jOXVnQVZqaWIzNThxMHRFRU9TclNyc3ljMS9Kc3pQYW1OTWp3Tjl2bWdm?=
 =?utf-8?B?TzJ3ZmlkVWNMcnJLdytNcGV6UXpkYkR5OHI2ekZSK0VWdnh3MDBpa2J3U2M5?=
 =?utf-8?B?bzNHUEZhK2h2djlmOTZWWDJGZHBlMXFzNWpTYnpaTVp2L0FQSDNQd2cyaGpa?=
 =?utf-8?B?cC9MdXFDZ3kxUCs4Qmxheldlc2RFMkVUTGpOMS91eHRNMU1hWHlYV2I3eFFE?=
 =?utf-8?B?VFljczgwaXNsTzY4NHRyU240N21lMlhOUWxNWm54c055alBZTXNobDk5WnNC?=
 =?utf-8?B?cmxwZjcxODdmNm5wYkJjUHZHVzA4N3Z6VkRwWUlKRjY5NDhUUVZ3QUdBOGJu?=
 =?utf-8?B?VmtESWJGbE9wVlBqWWhLeFlGSmdOYlloOUdtSXM2VGVYMjErNUpXYkk3NUtQ?=
 =?utf-8?B?UFVzTHVFSWkxS0dibEZaY3ptZ2J5YzEyNmlSOUp6WVc3WTBPLzFyV01RSWZ0?=
 =?utf-8?Q?m1wo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5933.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330643cd-6a6d-4bb6-26c9-08dbef688d84
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 16:47:33.2716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K/ryRYwaoKFYpKsOO7xL01r2egI53lJAEovgz+SgRM9x9GvXG3vMAak/hwHlr+PZCQ0wUBKltfYih5WIwqsbBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4937
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEdlbmVyYWxdDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YgSGFtemEgTWFoZm9veg0KU2VudDogTW9uZGF5LCBOb3ZlbWJlciAy
NywgMjAyMyAxMDo1MyBBTQ0KVG86IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVt
ZXJrZW5AZ21haWwuY29tPjsgamFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tOyBraGVyYnN0QHJl
ZGhhdC5jb207IGRha3JAcmVkaGF0LmNvbTsgemFja3JAdm13YXJlLmNvbTsgT2xzYWssIE1hcmVr
IDxNYXJlay5PbHNha0BhbWQuY29tPjsgbGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUu
Y29tOyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IHZpcnR1YWxpemF0aW9u
QGxpc3RzLmxpbnV4LmRldjsgc3BpY2UtZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZHJt
L2FtZGdwdTogdXNlIEdUVCBvbmx5IGFzIGZhbGxiYWNrIGZvciBWUkFNfEdUVA0KDQpPbiAxMS8y
Ny8yMyAwOTo1NCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4gVHJ5IHRvIGZpbGwgdXAgVlJB
TSBhcyB3ZWxsIGJ5IHNldHRpbmcgdGhlIGJ1c3kgZmxhZyBvbiBHVFQgYWxsb2NhdGlvbnMuDQo+
DQo+IFRoaXMgZml4ZXMgdGhlIGlzc3VlIHRoYXQgd2hlbiBWUkFNIHdhcyBldmFjdWF0ZWQgZm9y
IHN1c3BlbmQgaXQncw0KPiBuZXZlciBmaWxsZWQgdXAgYWdhaW4gdW5sZXNzIHRoZSBhcHBsaWNh
dGlvbiBpcyByZXN0YXJ0ZWQuDQoNCkkgZm91bmQgdGhlIHN1YmplY3QgZGVzY3JpcHRpb24gYSBi
aXQgbWlzbGVhZGluZy4gTWF5YmUgdXNlIGEgRml4ZXMgdGFnIGRlc2NyaWJpbmcgaXQgaXMgYSBm
aXggZm9yIHN1c3BlbmQgcmVzdW1lIHJlZ3Jlc3Npb24gb3RoZXIgdGhhbiB0aGF0LCBsb29rcyBn
b29kIHRvIG1lLg0KDQpBY2tlZC1ieTogUmFqbmVlc2ggQmhhcmR3YWogPHJham5lZXNoLmJoYXJk
d2FqQGFtZC5jb20+DQoNCj4NCg0KTGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3Jn
L2RybS9hbWQvLS9pc3N1ZXMvMjg5Mw0KDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIHwgNiArKysrKysNCj4gICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfb2JqZWN0LmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfb2JqZWN0LmMNCj4gaW5kZXggYWEwZGQ2ZGFkMDY4Li5kZGM4ZmI0ZGI2NzggMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYw0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMNCj4gQEAgLTE3
Myw2ICsxNzMsMTIgQEAgdm9pZCBhbWRncHVfYm9fcGxhY2VtZW50X2Zyb21fZG9tYWluKHN0cnVj
dCBhbWRncHVfYm8gKmFibywgdTMyIGRvbWFpbikNCj4gICAgICAgICAgICAgICAgICAgICAgIGFi
by0+ZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9QUkVFTVBUSUJMRSA/DQo+ICAgICAgICAgICAg
ICAgICAgICAgICBBTURHUFVfUExfUFJFRU1QVCA6IFRUTV9QTF9UVDsNCj4gICAgICAgICAgICAg
ICBwbGFjZXNbY10uZmxhZ3MgPSAwOw0KPiArICAgICAgICAgICAgIC8qDQo+ICsgICAgICAgICAg
ICAgICogV2hlbiBHVFQgaXMganVzdCBhbiBhbHRlcm5hdGl2ZSB0byBWUkFNIG1ha2Ugc3VyZSB0
aGF0IHdlDQo+ICsgICAgICAgICAgICAgICogb25seSB1c2UgaXQgYXMgZmFsbGJhY2sgYW5kIHN0
aWxsIHRyeSB0byBmaWxsIHVwIFZSQU0gZmlyc3QuDQo+ICsgICAgICAgICAgICAgICovDQo+ICsg
ICAgICAgICAgICAgaWYgKGRvbWFpbiAmIEFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pDQo+ICsgICAg
ICAgICAgICAgICAgICAgICBwbGFjZXNbY10uZmxhZ3MgfD0gVFRNX1BMX0ZMQUdfQlVTWTsNCj4g
ICAgICAgICAgICAgICBjKys7DQo+ICAgICAgIH0NCj4NCi0tDQpIYW16YQ0KDQo=
