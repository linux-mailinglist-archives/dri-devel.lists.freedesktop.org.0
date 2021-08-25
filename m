Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115FE3F6DF2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 05:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A256E107;
	Wed, 25 Aug 2021 03:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2049.outbound.protection.outlook.com [40.107.96.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5856E105;
 Wed, 25 Aug 2021 03:56:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HNB/wPX858WDwcplBdt0cWT9qE9QHQ+Z7ywMU/IVlo/7TzGEfZ3KnublE8GdK2R1n0BPRkUzOF9b5K9nTD6F67U0jF5hnzCwMtkgN5ag0eetUcvTZQ1xzqNzByT650vVZjX4jFzrbV0IgWUgE8f107OLlI/dgyLvVpJwPlo+pNyT9sUWz5e5TMpTWf/PLR78ayHvZPeyIFTjcNSvAiCycR5/hoeVpzDJdBGRn2TBgTdJ1u0yxeBZYmr85gPi/ZPfDqn0Kln4bYnKF180e0pMXHS7ECKuyNkvu3kWl2kcGUE2K2sGRNZS9uQpd5MZ6iXFtmbn7DM0q79OfUQdlK6kVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeiKbTfnrosHtXdRoAFD6sXavSJT0WfCkF+SwWTJV64=;
 b=RsHf423GOaJQkhHeyrNdn7DhWjuH9HoEAFoc4awiMfFKrzuWqMmP2r71QG5S2FhKRunZC4/XJIT+gS42RyxgameuieQHvuUBN24bRxwHVdHUm/Fq1ZVvtHKVid5XGCYkb2XlHdjthXyT9sHzy4x9o2RfMM/vwvhMaLsVZnxN8FATtLDc4Agb0wyLlbe10uPryoGRMhcpRc9m1IJcQiFLFus1X47wBbWbI/ee73wwImufnU2LBE4nX1KBN9NHITuiDqA/rbSSUvC2fklUd7yHa8x13Cy1YKPxXSU4dpD+Cy0zxY3OfXDSzuYs1XEN5Btm/v3qMgp2rGf75iy92M8s9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeiKbTfnrosHtXdRoAFD6sXavSJT0WfCkF+SwWTJV64=;
 b=ghdLvjF8/w4Zp5gFYW5iok3+RtNchDuZYcJvSIlEn6OElktaqcbYsUXXGzqQx/KJEyOCNJua+qY5PW23zMIi26JBBczaF+3U4V7tLDICKo6mVk11OH8Oj7ac8lE5+BKYxqIAiUwIafivYdDGz7fKBCxJOKz/2HaQpNNKCdcVNAI=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR12MB1642.namprd12.prod.outlook.com (2603:10b6:4:7::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Wed, 25 Aug 2021 03:56:10 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6%7]) with mapi id 15.20.4415.024; Wed, 25 Aug 2021
 03:56:10 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
Subject: RE: [PATCH 1/4] drm/amdgpu: Move flush VCE idle_work during HW fini
Thread-Topic: [PATCH 1/4] drm/amdgpu: Move flush VCE idle_work during HW fini
Thread-Index: AQHXmStDsgLtkcU2N060TXN+bAqqMquDcU6AgAAclYCAAAm+MA==
Date: Wed, 25 Aug 2021 03:56:10 +0000
Message-ID: <DM6PR12MB261900A33D4AF2DA18378D1EE4C69@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
 <20210824210120.49812-2-andrey.grodzovsky@amd.com>
 <DM6PR12MB26194A97EA61197582FF4742E4C69@DM6PR12MB2619.namprd12.prod.outlook.com>
 <f7a27b4b-6388-0b3a-bc01-30772b9dfe15@amd.com>
In-Reply-To: <f7a27b4b-6388-0b3a-bc01-30772b9dfe15@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-25T03:56:08Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=e6314561-789b-49ee-8365-8bc933febe15;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 345eecbe-7f83-4065-2596-08d9677c4669
x-ms-traffictypediagnostic: DM5PR12MB1642:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB16423F6BFF4E2B9A2A8E4AE3E4C69@DM5PR12MB1642.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:206;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mGSVJdsUN9EChwmIMi3euZ3rA5Csgz0Ti7NOb3ngmg+Q7Ajrn9RzsvydeCc5P6oe3doBUdOOVGLfQicwv3VasY6iVk0ZcQujc3jSElMzeh9D6vsflVYHc4qPjp81RgX58DT+CIhYuOFGmibeX21w0pcVScGGDr41P2bxxxUFJpxr1tA1tmI6dG07Lw6N6Fm9QwPeCkiONgtlwjb7BVDCsd5Rsq4GX0oSgjjNiCIOj5B3SUGIaoZ2ZSlxLiokjrCJPGU73ZWlYFh1kS8U5XH4iroiY2y0pp/F/OnxkBLhLeXhiwApQhKbwSh3z98aqXkZLogCdk7lYdfmy5aTjU3ypbX32yKB+mwaVSTWCDJLE/VN/3l7lkA/THd7HPc2vSBKS1FHV5V5pm2QKokFo7xW2HxnSDAIVuGLfDatcPTEEtUCXWHYHCaBvPzh2piBLIY4qfPQ7YC23etdxvYp1IpneV0GH9LdsOxhfYgtXvUwHgmfsmaeJXR1/iriKiuHaQkx4lIdtabjufRjPnsVMwJXZ/L7F8dvyMlU92bx/kdaeiGe2JD3N9GQuRAa9VNSHvWGG8WAU8KJmoFhqKJo1RfOXETZ/9lzgJvSWd0GzZVV3tAIQRephapexbBl1eTQt3tMzgvFDwUa9KTFwBC55yuWwlKjXblsS04sE1FCrktjtNomy0LxdSbNCceMxA29UcKK+i5bz8ouHl8wOfuq9HVTqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(76116006)(26005)(122000001)(66476007)(66946007)(8676002)(186003)(966005)(66446008)(52536014)(508600001)(53546011)(6506007)(7696005)(5660300002)(66556008)(86362001)(64756008)(316002)(4326008)(55016002)(38070700005)(83380400001)(71200400001)(33656002)(9686003)(110136005)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmhoK29DSENXcXFodzJlaUo2aDAxd3BUajZUYUZtbXlGNTNxSWdtZDVBWXhu?=
 =?utf-8?B?S0lYZTBmdHF1TVdmdTRRenVoZzZ1RHdYOHc2aTB6VUNJWDdieENndEFBL3NL?=
 =?utf-8?B?NXN6VTBXKzV3L245QkwzMXczeENibThFOC9MbHhjQ2dSeWc3TCttdlRGOTZ4?=
 =?utf-8?B?VXcwNlB2TGtOa2FIVk9ka3dLOFg3d1Z2cW4vY2hWUE94cDlnczFHWkxJc2NS?=
 =?utf-8?B?WVdoQU55RVBMMExWeElFVXVIcVJLL0pLS1hnMklDM0RCNjJ4UEdUQWQ4Y3pr?=
 =?utf-8?B?UDczdXZURFJxMTBnM0dsRDZTc2FKNmJlcG00bjZsck1zUGoydFlXZnlFS2Ji?=
 =?utf-8?B?SFVjUTNXT2pPTXZsR25qZlR2TzNqb0s0L2IxU1g5SjNxOXY4SGt5ZzYza0xW?=
 =?utf-8?B?QUh2TEwwcFZZZmlRUGFMdHdqY2M3M0pKYk5peFl2ays0WGs1NjQ2WlErclQ2?=
 =?utf-8?B?WXF4WVI0aTZrTGRlaEVkVlp6aTJaYlJQTE84UDV1Tkh2cC9zN0ovUnhhUHcw?=
 =?utf-8?B?MjNoQ2xKOVJJTXhHbWpyK2xZSnpRekNFSFJOYll5VUVzRGt2dUJpSFFqYjZQ?=
 =?utf-8?B?NG5lTzUySlJFWC93N2YydWF0NURXdWdHNnFOQUNnOGNmaHlXMWpYYVZiQm9V?=
 =?utf-8?B?ZVRKYWx5TnRsWmxPSUtuNHlkQkwwR0tWRndRMVJzWE11TUhvY05YNHorVXNF?=
 =?utf-8?B?Tm14NWxheHdqVlRzbkZEemYrYUx5YldqWHNZZDVpUlJOd1luVkx6b3VISDlZ?=
 =?utf-8?B?SWRGVkROOTdIYTlnNURJVXVOTDZrb3I1TENXOFkyT2pTTWgydDMxTkZ0UER5?=
 =?utf-8?B?OVBheHpWRlg4bE1kbVVMSEdCTjdtb0FYUU1yZi9qQmdQZUczMVhCcW9qMHVD?=
 =?utf-8?B?aHRIUktETVZUMGZ5Wk0vOVN2blpPOFFtTkh4Z0JUVDhQKzkrOU1mWHZLR1E1?=
 =?utf-8?B?SC9pQ1lTb1FHaG81d1MzUDM2ZEhjcWl2RHk2Sk9Hbm9ENVd1bVZIKzltVDdV?=
 =?utf-8?B?Y0ljZ1FzUVh6OC92UHFFbmZyZjNFSmc2dVAyTW1LSHl4MDJHaGpuNHZwdkVU?=
 =?utf-8?B?WWZrYjFETzMxYW5qMHNBWitReXIxQWtzMDhubmdNREhrUUJMMC9Yd2FpSW43?=
 =?utf-8?B?Wm4zelU4R1Y5NHJRQUNvd20vUmIyREJHSllmMnVoSEJ3YVV2OUoyZklQYXB6?=
 =?utf-8?B?WEpSQWdXaEEvMEFHMUZyQmhLVU9DWjVvdTh1U3Z3OTVDVnNBOXlqc0ttdmJt?=
 =?utf-8?B?Q3J2OHZNUkZ3OUNEYnNheUZJOERUcE8vbElFSzZtb0kxSUpydVRscVEvRXhi?=
 =?utf-8?B?RHB3dW5ZSXAyWWU1UFY5ak9GNzZzOXlYZ0tCUEN4WHpQMkJQSXJsd21CVE12?=
 =?utf-8?B?N2pubm9vcElnNnAvZE1SKzZLUGFRemdzT1VVTDZyV0k4R1lPa3pBVGNLT01C?=
 =?utf-8?B?QVBFVjNxeEtTYVZ4cmF1WlZ4UHNITHM2NnNSTzBYOXJBMmI5YUM2enNESzlS?=
 =?utf-8?B?YmhyTDkvZEFBc0U0YmxsZE4wc1piYllEMEJLMENDT3gyMHhRSjFkRCtHb0dj?=
 =?utf-8?B?bmp6Qkt6NTVta2w5QmZWR2JnS21vcTZlVm5ZcVNIVHBqNEduVENndkxqVGpE?=
 =?utf-8?B?TWlMMFNGZkV0ODRHZzgyajBGNnVNbkE4bmU5TDV0WFBVc3JaOUd1UzMxQS9i?=
 =?utf-8?B?Q1YxdWwvZEZ3YjJycVdiUXFTWUlaTnRuWEFlNXIramxhM3diTmxvQ0UwdWQ3?=
 =?utf-8?Q?Vlo9vVfAHtR/yr8FI/eI6X+jXAnlncTyYSCDfPd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 345eecbe-7f83-4065-2596-08d9677c4669
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2021 03:56:10.3188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +pXeffqdjL1qF1p2Eum0i1fldxF3ngdO7dnAm2X+KgE89j1RXcQEV0rymbyNESSU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1642
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KSnVzdCBsYW5kZWQuDQoNClRoYW5rcywNCkV2YW4N
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3JvZHpvdnNreSwgQW5kcmV5
IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEF1Z3VzdCAy
NSwgMjAyMSAxMToyMCBBTQ0KPiBUbzogUXVhbiwgRXZhbiA8RXZhbi5RdWFuQGFtZC5jb20+OyBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBDYzogY2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCAxLzRdIGRybS9hbWRncHU6IE1vdmUgZmx1c2ggVkNFIGlkbGVfd29yayBk
dXJpbmcgSFcNCj4gZmluaQ0KPiANCj4gUmlnaHQsIHRoZXkgd2lsbCBjb3ZlciBteSB1c2UgY2Fz
ZSwgd2hlbiBhcmUgdGhleSBsYW5kaW5nID8gSSByZWJhc2VkIHRvZGF5DQo+IGFuZCBoYXZlbid0
IHNlZW4gdGhlbS4NCj4gDQo+IEFuZHJleQ0KPiANCj4gT24gMjAyMS0wOC0yNCA5OjQxIHAubS4s
IFF1YW4sIEV2YW4gd3JvdGU6DQo+ID4gW0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCj4gPg0KPiA+
IEhpIEFuZHJleSwNCj4gPg0KPiA+IEkgc2VudCBvdXQgYSBzaW1pbGFyIHBhdGNoIHNldCB0byBh
ZGRyZXNzIFMzIGlzc3VlLiBBbmQgSSBiZWxpZXZlIGl0IHNob3VsZCBiZQ0KPiBhYmxlIHRvIGFk
ZHJlc3MgdGhlIGlzc3VlIGhlcmUgdG9vLg0KPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL2FyY2hpdmVzL2FtZC1nZngvMjAyMS1BdWd1c3QvMDY3OTcyLmh0bWwNCj4gPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9hbWQtZ2Z4LzIwMjEtQXVndXN0LzA2Nzk2
Ny5odG1sDQo+ID4NCj4gPiBCUg0KPiA+IEV2YW4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gPj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+ID4+IEFuZHJleSBHcm9kem92c2t5DQo+ID4+IFNlbnQ6
IFdlZG5lc2RheSwgQXVndXN0IDI1LCAyMDIxIDU6MDEgQU0NCj4gPj4gVG86IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4+
IENjOiBja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbTsgR3JvZHpvdnNreSwgQW5kcmV5
DQo+ID4+IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQuY29tPg0KPiA+PiBTdWJqZWN0OiBbUEFUQ0gg
MS80XSBkcm0vYW1kZ3B1OiBNb3ZlIGZsdXNoIFZDRSBpZGxlX3dvcmsgZHVyaW5nIEhXDQo+ID4+
IGZpbmkNCj4gPj4NCj4gPj4gQXR0ZXBtdHMgdG8gcG93ZXJnYXRlIGFmdGVyIGRldmljZSBpcyBy
ZW1vdmVkIGxlYWQgdG8gY3Jhc2guDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBH
cm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPiA+PiAtLS0NCj4gPj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMgfCAxIC0NCj4gPj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjJfMC5jICAgfCA0ICsrKysNCj4gPj4gICBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjNfMC5jICAgfCA1ICsrKystDQo+ID4+ICAgZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYyAgIHwgMiArKw0KPiA+PiAgIDQgZmls
ZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYw0KPiA+
PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYw0KPiA+PiBpbmRleCAx
YWU3ZjgyNGFkYzcuLjhlOGRlZTlmYWM5ZiAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92Y2UuYw0KPiA+PiBAQCAtMjE4LDcgKzIxOCw2IEBAIGludCBhbWRn
cHVfdmNlX3N3X2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UNCj4gPj4gKmFkZXYpDQo+ID4+ICAg
CWlmIChhZGV2LT52Y2UudmNwdV9ibyA9PSBOVUxMKQ0KPiA+PiAgIAkJcmV0dXJuIDA7DQo+ID4+
DQo+ID4+IC0JY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZhZGV2LT52Y2UuaWRsZV93b3JrKTsN
Cj4gPj4gICAJZHJtX3NjaGVkX2VudGl0eV9kZXN0cm95KCZhZGV2LT52Y2UuZW50aXR5KTsNCj4g
Pj4NCj4gPj4gICAJYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT52Y2UudmNwdV9ibywgJmFk
ZXYtDQo+ID4+PiB2Y2UuZ3B1X2FkZHIsDQo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92Y2VfdjJfMC5jDQo+ID4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNlX3YyXzAuYw0KPiA+PiBpbmRleCBjN2QyOGMxNjliZTUuLjcxNmRmZGQwMjBiNCAxMDA2
NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3YyXzAuYw0KPiA+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjJfMC5jDQo+ID4+IEBAIC00
NzcsNiArNDc3LDEwIEBAIHN0YXRpYyBpbnQgdmNlX3YyXzBfaHdfaW5pdCh2b2lkICpoYW5kbGUp
DQo+ID4+DQo+ID4+ICAgc3RhdGljIGludCB2Y2VfdjJfMF9od19maW5pKHZvaWQgKmhhbmRsZSkN
Cj4gPj4gICB7DQo+ID4+ICsJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKiloYW5kbGU7DQo+ID4+ICsNCj4gPj4gKwljYW5jZWxfZGVsYXllZF93b3Jr
X3N5bmMoJmFkZXYtPnZjZS5pZGxlX3dvcmspOw0KPiA+PiArDQo+ID4+ICAgCXJldHVybiAwOw0K
PiA+PiAgIH0NCj4gPj4NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3ZjZV92M18wLmMNCj4gPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjNf
MC5jDQo+ID4+IGluZGV4IDNiODJmYjI4OWVmNi4uNDk1ODFjNmUwY2VhIDEwMDY0NA0KPiA+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjNfMC5jDQo+ID4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3ZjZV92M18wLmMNCj4gPj4gQEAgLTQ5NSw3ICs0OTUs
MTAgQEAgc3RhdGljIGludCB2Y2VfdjNfMF9od19maW5pKHZvaWQgKmhhbmRsZSkNCj4gPj4gICAJ
CXJldHVybiByOw0KPiA+Pg0KPiA+PiAgIAl2Y2VfdjNfMF9zdG9wKGFkZXYpOw0KPiA+PiAtCXJl
dHVybiB2Y2VfdjNfMF9zZXRfY2xvY2tnYXRpbmdfc3RhdGUoYWRldiwNCj4gPj4gQU1EX0NHX1NU
QVRFX0dBVEUpOw0KPiA+PiArCXIgPSAgdmNlX3YzXzBfc2V0X2Nsb2NrZ2F0aW5nX3N0YXRlKGFk
ZXYsIEFNRF9DR19TVEFURV9HQVRFKTsNCj4gPj4gKwljYW5jZWxfZGVsYXllZF93b3JrX3N5bmMo
JmFkZXYtPnZjZS5pZGxlX3dvcmspOw0KPiA+PiArDQo+ID4+ICsJcmV0dXJuIHI7DQo+ID4+ICAg
fQ0KPiA+Pg0KPiA+PiAgIHN0YXRpYyBpbnQgdmNlX3YzXzBfc3VzcGVuZCh2b2lkICpoYW5kbGUp
IGRpZmYgLS1naXQNCj4gPj4gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y2VfdjRfMC5j
DQo+ID4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYw0KPiA+PiBpbmRl
eCA5MDkxMGQxOWRiMTIuLjMyOTc0MDVmZDMyZCAxMDA2NDQNCj4gPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdmNlX3Y0XzAuYw0KPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS92Y2VfdjRfMC5jDQo+ID4+IEBAIC01NTAsNiArNTUwLDggQEAgc3RhdGljIGlu
dCB2Y2VfdjRfMF9od19maW5pKHZvaWQgKmhhbmRsZSkNCj4gPj4gICAJCURSTV9ERUJVRygiRm9y
IFNSSU9WIGNsaWVudCwgc2hvdWxkbid0IGRvIGFueXRoaW5nLlxuIik7DQo+ID4+ICAgCX0NCj4g
Pj4NCj4gPj4gKwljYW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJmFkZXYtPnZjZS5pZGxlX3dvcmsp
Ow0KPiA+PiArDQo+ID4+ICAgCXJldHVybiAwOw0KPiA+PiAgIH0NCj4gPj4NCj4gPj4gLS0NCj4g
Pj4gMi4yNS4xDQo=
