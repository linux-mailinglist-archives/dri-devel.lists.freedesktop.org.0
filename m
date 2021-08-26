Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207413F876D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 14:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F7A6E82B;
	Thu, 26 Aug 2021 12:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1966 seconds by postgrey-1.36 at gabe;
 Thu, 26 Aug 2021 12:28:25 UTC
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F5796E82A;
 Thu, 26 Aug 2021 12:28:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ME1QpdehzLfQuBDq/3rBFNPE7y9UXW4sTxWgmWUuWkoJ/nhlmETu9q3d4cqqTj4Fln4HYR1uOH+4nJBEvwSra6t4MdWa8rHIzq9nTdHNVdHt04cL39ne4ztE5WmujvASo4dWIZKoTpKLO77GJxgjQmeHQA3cgWsUB4QnUdyK/NLRm+VDt6uVBjnxaN72xg2i8GA95942eH9CiET8UvN/31RZlbsaS73WQJ7kJkeYE6SUVk2WchaYliKx5wSqMgaLJoSWbFEUrbRiKTteMp7VLJ/ozK+tnXY0H9IO63tXcEaRDTXMEZyAI3ejrWdw+MYdx4TaF/wrEtL/KGXDF09DGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Yd+1truPepM8aPJd2wBBQz3Y72CpLG43mfdgLWxv84=;
 b=PqnoSVdJPE5l3jy619n2YeKbCqMH0WqpJrJRL+ocL4Zd/0y8GeblMDnINUW7kF5iTapGwko4fXrzPqtwJxnyO+IkSCVBFp1QJM5dxVBgbr2+dMFw6OLVh7u1bpq9GbPeYi2Qi4JBguk7rW77tDVXVlcSIGc0keSSIHb159jDOYGkeXoLy83sPBmja2w3yF6QKxAo4MP0sD0h0b+JY06ER3OhV4es4DrhQocZAaWWYIfn2kXkr9L/6Y0iCMSJbChjjOOhcTrXY+hmJgTrkYr5Zpf7O67xDn1geWHCVGJs4QT3Xi5iMjLmZGuk4Z5t/N3qHTXKBwzV0vYSFAZfw5XqHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Yd+1truPepM8aPJd2wBBQz3Y72CpLG43mfdgLWxv84=;
 b=ht1sGs91EDp+p7WE5tvSEDzJjY639EPYW8JqEKvnyFGvK6nt/nH+JYHCE0BQG4G5GxcS8zXKmWJyhZ1TRuWHTqySKjtwKeRxefw68apnQz1ysA086P1dPWY8t09LKCkPEADbVrAWcNP91q/uTBCK6o4wU6wAnBgU8y4loVwYktI=
Received: from BL1PR12MB5269.namprd12.prod.outlook.com (2603:10b6:208:30b::20)
 by BL1PR12MB5095.namprd12.prod.outlook.com (2603:10b6:208:31b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Thu, 26 Aug
 2021 11:55:36 +0000
Received: from BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a]) by BL1PR12MB5269.namprd12.prod.outlook.com
 ([fe80::acc6:c407:1353:6a%5]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 11:55:36 +0000
From: "Liu, Monk" <Monk.Liu@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/sched: fix the bug of time out calculation(v3)
Thread-Topic: [PATCH] drm/sched: fix the bug of time out calculation(v3)
Thread-Index: AQHXmjadxsIrIGn2Y02EiNcylnR376uFkGeAgAAdfWA=
Date: Thu, 26 Aug 2021 11:55:36 +0000
Message-ID: <BL1PR12MB5269107A0A927EC3D7A7B6E784C79@BL1PR12MB5269.namprd12.prod.outlook.com>
References: <1629953731-14629-1-git-send-email-Monk.Liu@amd.com>
 <e000dc1a-8fe8-ea69-e16b-bf0b64d773f2@gmail.com>
In-Reply-To: <e000dc1a-8fe8-ea69-e16b-bf0b64d773f2@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-26T11:55:34Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=e311bcd9-918b-4045-bef1-e03312816cc3;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a72a1881-8d89-4e44-f523-08d968886af2
x-ms-traffictypediagnostic: BL1PR12MB5095:
x-microsoft-antispam-prvs: <BL1PR12MB50956AD776990B2830D8AA6584C79@BL1PR12MB5095.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: clGTJd84nlCRVXK8kcdVZ4cPHTDjUQSFcZNDmHhOEC7GdoPiiAkCJciStpbprVznrwIRnUGt/DNaYWgJnqEdups/JrGlpGgtAMjZjoQ9/9j/HyMu3mEgk55NnitEQgYTeCeFDRexCYGT+c2mw6/s0/QmYkTtYH2wJFCKl1ea6/xw+klw+jAs30vF1q30rWcM8jFsF1sMpGPpH4zJGn6u6hQd0Pe8DhfVjOVVwrN6UXY78rQSuxVB1QU+zhEpBHP1joKUtzHjavryw5DtnmSilwAVWhRUzC71DwKu0F7PCpheliO28pf3oMgQcKcJ16bl3WM/UkOSHSFsuuEaSmCoicAu2QxMPJUdbLlC/aFW9Rxfh1FMw6/CpGiEjTbU8pmtP3T2WLfMIAY7hY+kKpSPwCylPnaqt+lWVDRQC8UFuYeMOQM32O1CGzefCAVhpkG2PEQmN3IlTAhRZBzttYGjrMqU5M1jfG/Tz4X8LND+tukC/vTiAZukyaijf0bW7R8ypauPugZ0DzawUv+O2e8S3ay+yiCkADoe2hKZ9IMgMamV2IuoOibwvh+mB234uxi3pyS4KplHG8YOHHEqeoXfAIgjxQaTFVXPKnbG4ayUHpOzrxHh9kuNo0M6eIVbdnzfaXyAgsAHjoJ07JB2MMSusWosU4NRBeyQxFHLaXrzDbPVzHHYLmx6/v5McB1X+Firk51XjsdJ8IOFbRID4uJI6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5269.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(38100700002)(122000001)(6506007)(26005)(186003)(8936002)(33656002)(66556008)(64756008)(8676002)(66476007)(71200400001)(9686003)(66446008)(55016002)(66946007)(76116006)(5660300002)(110136005)(52536014)(316002)(4326008)(66574015)(2906002)(7696005)(83380400001)(86362001)(38070700005)(478600001)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFZES25udllNbWZhZmhVYmw1cko3dEJ3RFJzc3p2ZDkyV3BLRGJ1WUw1SXBP?=
 =?utf-8?B?ZHV6bG0xSnNRYTNSTXZPZTR3QnZSU2c1VGhzL0QyOG9aSjVEckxxMVk0Vm1O?=
 =?utf-8?B?amdqc2JJRXhCNWhWRlBOWkY1ZWRrZGtzOC84VjN0dEtxRjNzVTBLcURUdkZz?=
 =?utf-8?B?VTd5YVRJb09uNzcxMlZPTFl1WERDUkRGRE5rRTVteFM1UnpKTmtpM1JZc2ZN?=
 =?utf-8?B?ZUpFd0kwZmw1YW1mNnZlZCthZkp0WWgvY3hwMzNOenAvUFNhMWw1SVZPSTBi?=
 =?utf-8?B?MzMrYVAzZ2lSZG1VbER5V2ZyTnpneWwyZDNMcnRWemJhSDNnTGthazJrYlZq?=
 =?utf-8?B?TUQxdDE2aVE0NjRpZEhuNFk4Sjcwc3dXR3lMRFNReWZGQjAzS2ZKU1VBd1V2?=
 =?utf-8?B?ZjR6c0ZaSzZ3NEttOXNkUHNlSVIvdFZadEV6UGFFRFdZVUZtYlJZVnRvbVdq?=
 =?utf-8?B?TDJoME1JTWxvekRJdXk2RGRjeUMydjk3bWhiUFFYNlh6MTRXZVZxWml5WEZ1?=
 =?utf-8?B?azUwaDQ2TDQvRkxlVjVlcWF1YmxqdFZYNEk3aC8rUmw5eVZvaVI4WldpSGQ3?=
 =?utf-8?B?SGxySjlqdzFPL1ZsMjlqTEJ5Wm5sL0thalJSTzBJMk90RU4wVjdwdzJEb1Iy?=
 =?utf-8?B?SjJiTFVuZ1R0aW5UNThRSXR2NmhjQVZqN1Y4Vk9lRVB2MzY2ZVN0RDRlQ2RP?=
 =?utf-8?B?M3d3MVJJY0lEUC9DWVZiSHlTREJUUXVOVlZxKzlGRWNMWWxVRUdFaWZCdDhm?=
 =?utf-8?B?SWsrdVJzSkpMWTNWVjVxYTVVQzM2aWVzQ0ZOY0EwMktXZTBROUxoRFhJcFhD?=
 =?utf-8?B?VUh3Y0NPOEdyUWtoeXhsUnZjcFdxanUxLzZqaXNPdVZId0xya3JKWm1MQjNE?=
 =?utf-8?B?RHJGNHhlWDAwWGNZMWtKNUI2bHYvTW5aY1JWUG4xeXJVVXlyUFVaZ0FmajNs?=
 =?utf-8?B?ZkZBSC9lb3h2NkRuREF3NmFBZzM1R3RaTU5zaU5zQlZReW9wY21GWi9hN0dz?=
 =?utf-8?B?aFRCYm4xc0FYbzlod3dNMDFPYmZMbzhva3dTenZYN2JQNEJqMEVoMmwrdU1N?=
 =?utf-8?B?amlzSEYxVGRkRXA1SlVkSjllUXVVQXNmUldsbDdiSk5NNXFmSmQ5RzlyRVVK?=
 =?utf-8?B?ek4wT3ZxTTdzQUMxdEMwVTVnNHI5bVhtM0JKMmNaL25kL1JvSEZmSjRmT1dt?=
 =?utf-8?B?aFN1Y1VuMWRaNVVaUzh3eklyMzBPSzhwUHZSQU1TRUlPTm12UmQwTVpoN3hX?=
 =?utf-8?B?bXJTVE40REJRS3F5ZkFzZ21zRnVMZ2FNMEJFUytobGc0aEZGb2hkeHZSb1N4?=
 =?utf-8?B?UFhJL3hiTHNDcGFhS0sxNkRWTGpxSnJOUWZ4dCt1RTRSQkorc2dEOXA1d1Jm?=
 =?utf-8?B?OXUyc2FwbG50U2NiVzU2QUQvQzc4Rm9mVzJIMFA0V3BubmpsSXRRRWFYMjcv?=
 =?utf-8?B?emY1NlpHVFQwdUZuZGZUNWl4OFVuTmVMQ2tTRnRPZUZZYWgwQ0cwaXVSOElq?=
 =?utf-8?B?R3I5cWY2Kytham1MVE50dm5DUUNBVTBmRytMQmRIbGRvQkhpV2tlUld2R2xT?=
 =?utf-8?B?VWk5aHRVM2NVMERSeHBmb0drTnhnVmtuR2pnaFNKMlhJZ1hmRTVienl1aEZS?=
 =?utf-8?B?TVVkUXo2bnBHeUNENGZ3eFlOMHIzVG0zZXV4WXh6TmtmU05Mam5kTTJGT0Zj?=
 =?utf-8?B?SGd1L1h1Lyt4ZkJVUStEc3AxWEZ3V3VGS0tobDJjUnMrMUhSZXpsd2xvbkRr?=
 =?utf-8?Q?SYndgzZzayaXoZgbbc2CNRPhzX80Wd0ml/p/OCO?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5269.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72a1881-8d89-4e44-f523-08d968886af2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2021 11:55:36.8236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o5UCfL9LlsqE7c2B5wO1Toub1h6jzqvOpC8lTIdvILRmaVPuE+5x/iDbOkayrxEC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5095
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KPj5JJ20gbm90IHN1cmUgaWYgdGhlIHdvcmtfdGRy
IGlzIGluaXRpYWxpemVkIHdoZW4gYSBtYXhpbXVtIHRpbWVvdXQgaXMgc3BlY2lmaWVkLiBQbGVh
c2UgZG91YmxlIGNoZWNrLg0KDQpPaywgd2lsbCBkbw0KDQo+PkJUVzogQ2FuIHdlIHBsZWFzZSBk
cm9wIHRoZSAidGRyIiBuYW1pbmcgZnJvbSB0aGUgc2NoZWR1bGVyPyBUaGF0IGlzIGp1c3QgYSB0
aW1lb3V0IGZ1bmN0aW9uYWxpdHkgYW5kIG5vdCByZWxhdGVkIHRvIHJlY292ZXJ5IGluIGFueSB3
YXkuDQpXZSBldmVuIGRvIG5vdCBzdGFydCBoYXJkd2FyZSByZWNvdmVyeSBpbiBhIGxvdCBvZiBj
YXNlcyBub3cgKHdoZW4gd2F2ZSBraWxsIGlzIHN1Y2Nlc3NmdWxseSkuDQoNClVtbSwgc291bmRz
IHJlYXNvbmFibGUsIEkgY2FuIHJlbmFtZSBpdCB0byAidG8iIHdpdGggYW5vdGhlciBwYXRjaCAN
Cg0KVGhhbmtzIA0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Ck1vbmsgTGl1IHwgQ2xvdWQtR1BVIENvcmUgdGVhbQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBD
aHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gDQpTZW50
OiBUaHVyc2RheSwgQXVndXN0IDI2LCAyMDIxIDY6MDkgUE0NClRvOiBMaXUsIE1vbmsgPE1vbmsu
TGl1QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9zY2hlZDog
Zml4IHRoZSBidWcgb2YgdGltZSBvdXQgY2FsY3VsYXRpb24odjMpDQoNCkFtIDI2LjA4LjIxIHVt
IDA2OjU1IHNjaHJpZWIgTW9uayBMaXU6DQo+IGlzc3VlOg0KPiBpbiBjbGVhbnVwX2pvYiB0aGUg
Y2FuY2xlX2RlbGF5ZWRfd29yayB3aWxsIGNhbmNlbCBhIFRPIHRpbWVyIGV2ZW4gdGhlIA0KPiBp
dHMgY29ycmVzcG9uZGluZyBqb2IgaXMgc3RpbGwgcnVubmluZy4NCg0KWWVhaCwgdGhhdCBtYWtl
cyBhIGxvdCBtb3JlIHNlbnNlLg0KDQo+DQo+IGZpeDoNCj4gZG8gbm90IGNhbmNlbCB0aGUgdGlt
ZXIgaW4gY2xlYW51cF9qb2IsIGluc3RlYWQgZG8gdGhlIGNhbmNlbGxpbmcgb25seSANCj4gd2hl
biB0aGUgaGVhZGluZyBqb2IgaXMgc2lnbmFsZWQsIGFuZCBpZiB0aGVyZSBpcyBhICJuZXh0IiBq
b2Igd2UgDQo+IHN0YXJ0X3RpbWVvdXQgYWdhaW4uDQo+DQo+IHYyOg0KPiBmdXJ0aGVyIGNsZWFu
dXAgdGhlIGxvZ2ljLCBhbmQgZG8gdGhlIFREUiB0aW1lciBjYW5jZWxsaW5nIGlmIHRoZSANCj4g
c2lnbmFsZWQgam9iIGlzIHRoZSBsYXN0IG9uZSBpbiBpdHMgc2NoZWR1bGVyLg0KPg0KPiB2MzoN
Cj4gY2hhbmdlIHRoZSBpc3N1ZSBkZXNjcmlwdGlvbg0KPiByZW1vdmUgdGhlIGNhbmNlbF9kZWxh
eWVkX3dvcmsgaW4gdGhlIGJlZ2luaW5nIG9mIHRoZSBjbGVhbnVwX2pvYiANCj4gcmVjb3ZlciB0
aGUgaW1wbGVtZW50IG9mIGRybV9zY2hlZF9qb2JfYmVnaW4uDQo+DQo+IFRPRE86DQo+IDEpaW50
cm9kdWNlIHBhdXNlL3Jlc3VtZSBzY2hlZHVsZXIgaW4gam9iX3RpbWVvdXQgdG8gc2VyaWFsIHRo
ZSANCj4gaGFuZGxpbmcgb2Ygc2NoZWR1bGVyIGFuZCBqb2JfdGltZW91dC4NCj4gMilkcm9wIHRo
ZSBiYWQgam9iJ3MgZGVsIGFuZCBpbnNlcnQgaW4gc2NoZWR1bGVyIGR1ZSB0byBhYm92ZSANCj4g
c2VyaWFsaXphdGlvbiAobm8gcmFjZSBpc3N1ZSBhbnltb3JlIHdpdGggdGhlIHNlcmlhbGl6YXRp
b24pDQo+DQo+IFNpZ25lZC1vZmYtYnk6IE1vbmsgTGl1IDxNb25rLkxpdUBhbWQuY29tPg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyB8IDI1ICsrKysr
KysrKystLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMTUgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYyANCj4gYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X21haW4uYw0KPiBpbmRleCBhMmE5NTM2Li5lY2Y4MTQwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPiBAQCAtNjc2LDEzICs2NzYsNyBAQCBkcm1fc2NoZWRf
Z2V0X2NsZWFudXBfam9iKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+ICAgew0K
PiAgIAlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iLCAqbmV4dDsNCj4gICANCj4gLQkvKg0KPiAt
CSAqIERvbid0IGRlc3Ryb3kgam9icyB3aGlsZSB0aGUgdGltZW91dCB3b3JrZXIgaXMgcnVubmlu
ZyAgT1IgdGhyZWFkDQo+IC0JICogaXMgYmVpbmcgcGFya2VkIGFuZCBoZW5jZSBhc3N1bWVkIHRv
IG5vdCB0b3VjaCBwZW5kaW5nX2xpc3QNCj4gLQkgKi8NCj4gLQlpZiAoKHNjaGVkLT50aW1lb3V0
ICE9IE1BWF9TQ0hFRFVMRV9USU1FT1VUICYmDQo+IC0JICAgICFjYW5jZWxfZGVsYXllZF93b3Jr
KCZzY2hlZC0+d29ya190ZHIpKSB8fA0KPiAtCSAgICBrdGhyZWFkX3Nob3VsZF9wYXJrKCkpDQo+
ICsJaWYgKGt0aHJlYWRfc2hvdWxkX3BhcmsoKSkNCj4gICAJCXJldHVybiBOVUxMOw0KPiAgIA0K
PiAgIAlzcGluX2xvY2soJnNjaGVkLT5qb2JfbGlzdF9sb2NrKTsNCj4gQEAgLTY5MywxNyArNjg3
LDIxIEBAIGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2Ioc3RydWN0IGRybV9ncHVfc2NoZWR1bGVy
ICpzY2hlZCkNCj4gICAJaWYgKGpvYiAmJiBkbWFfZmVuY2VfaXNfc2lnbmFsZWQoJmpvYi0+c19m
ZW5jZS0+ZmluaXNoZWQpKSB7DQo+ICAgCQkvKiByZW1vdmUgam9iIGZyb20gcGVuZGluZ19saXN0
ICovDQo+ICAgCQlsaXN0X2RlbF9pbml0KCZqb2ItPmxpc3QpOw0KPiArDQo+ICsJCS8qIGNhbmNl
bCB0aGlzIGpvYidzIFRPIHRpbWVyICovDQo+ICsJCWNhbmNlbF9kZWxheWVkX3dvcmsoJnNjaGVk
LT53b3JrX3Rkcik7DQoNCkknbSBub3Qgc3VyZSBpZiB0aGUgd29ya190ZHIgaXMgaW5pdGlhbGl6
ZWQgd2hlbiBhIG1heGltdW0gdGltZW91dCBpcyBzcGVjaWZpZWQuIFBsZWFzZSBkb3VibGUgY2hl
Y2suDQoNCkJUVzogQ2FuIHdlIHBsZWFzZSBkcm9wIHRoZSAidGRyIiBuYW1pbmcgZnJvbSB0aGUg
c2NoZWR1bGVyPyBUaGF0IGlzIGp1c3QgYSB0aW1lb3V0IGZ1bmN0aW9uYWxpdHkgYW5kIG5vdCBy
ZWxhdGVkIHRvIHJlY292ZXJ5IGluIGFueSB3YXkuDQoNCldlIGV2ZW4gZG8gbm90IHN0YXJ0IGhh
cmR3YXJlIHJlY292ZXJ5IGluIGEgbG90IG9mIGNhc2VzIG5vdyAod2hlbiB3YXZlIGtpbGwgaXMg
c3VjY2Vzc2Z1bGx5KS4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4NCg0KPiAgIAkJLyogbWFrZSB0
aGUgc2NoZWR1bGVkIHRpbWVzdGFtcCBtb3JlIGFjY3VyYXRlICovDQo+ICAgCQluZXh0ID0gbGlz
dF9maXJzdF9lbnRyeV9vcl9udWxsKCZzY2hlZC0+cGVuZGluZ19saXN0LA0KPiAgIAkJCQkJCXR5
cGVvZigqbmV4dCksIGxpc3QpOw0KPiAtCQlpZiAobmV4dCkNCj4gKw0KPiArCQlpZiAobmV4dCkg
ew0KPiAgIAkJCW5leHQtPnNfZmVuY2UtPnNjaGVkdWxlZC50aW1lc3RhbXAgPQ0KPiAgIAkJCQlq
b2ItPnNfZmVuY2UtPmZpbmlzaGVkLnRpbWVzdGFtcDsNCj4gLQ0KPiArCQkJLyogc3RhcnQgVE8g
dGltZXIgZm9yIG5leHQgam9iICovDQo+ICsJCQlkcm1fc2NoZWRfc3RhcnRfdGltZW91dChzY2hl
ZCk7DQo+ICsJCX0NCj4gICAJfSBlbHNlIHsNCj4gICAJCWpvYiA9IE5VTEw7DQo+IC0JCS8qIHF1
ZXVlIHRpbWVvdXQgZm9yIG5leHQgam9iICovDQo+IC0JCWRybV9zY2hlZF9zdGFydF90aW1lb3V0
KHNjaGVkKTsNCj4gICAJfQ0KPiAgIA0KPiAgIAlzcGluX3VubG9jaygmc2NoZWQtPmpvYl9saXN0
X2xvY2spOw0KPiBAQCAtNzkxLDExICs3ODksOCBAQCBzdGF0aWMgaW50IGRybV9zY2hlZF9tYWlu
KHZvaWQgKnBhcmFtKQ0KPiAgIAkJCQkJICAoZW50aXR5ID0gZHJtX3NjaGVkX3NlbGVjdF9lbnRp
dHkoc2NoZWQpKSkgfHwNCj4gICAJCQkJCSBrdGhyZWFkX3Nob3VsZF9zdG9wKCkpOw0KPiAgIA0K
PiAtCQlpZiAoY2xlYW51cF9qb2IpIHsNCj4gKwkJaWYgKGNsZWFudXBfam9iKQ0KPiAgIAkJCXNj
aGVkLT5vcHMtPmZyZWVfam9iKGNsZWFudXBfam9iKTsNCj4gLQkJCS8qIHF1ZXVlIHRpbWVvdXQg
Zm9yIG5leHQgam9iICovDQo+IC0JCQlkcm1fc2NoZWRfc3RhcnRfdGltZW91dChzY2hlZCk7DQo+
IC0JCX0NCj4gICANCj4gICAJCWlmICghZW50aXR5KQ0KPiAgIAkJCWNvbnRpbnVlOw0K
