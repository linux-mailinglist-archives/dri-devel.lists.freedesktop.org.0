Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCBE3799B7
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 00:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C360D6E943;
	Mon, 10 May 2021 22:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500D76E942;
 Mon, 10 May 2021 22:09:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyqoF3Y6InRT1kIbAgp3wKb5Y95iHJrAkfrWSG2F/r2jayC2qu6KNEH97lIYQ6XPMN3FBnDaqg0J9RhG+xUTA81vBfSnaPi/eVZxbVfMRac7vSp1olm5H91RE3psXy5d+9kveOZE7v0oYa9YlsCyipzfzz4O37wu5yKHI7tnoFIUSUqpaeOQoWE3WTQF3z7GUZWmPz270mT7U/rx5K0Pf0/bB1vib88wI89bCVqrh0WXNuucZlP4IhSKltIkgwyx6Gbw7/Rs0fp1Y1Zivh9pjhZbGd68SXwjidNCbaZsyziqgcpMt+oAe1RkVLDh1i+8NBZ7OyPOc9KY3KParhipgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7z7E7IRfqZEWKPvVRnTcDztA3hMdNeO9Ic/vRC07zs=;
 b=ncRuMhGFvna5QatrfCOiwq4uvw6iK/Orad2glOV4qQzRh5TOZ0f7PsCP9dZbfWxANbBlmC22RIHkYrEQmeqyPyfoy8HE87bnLsQS918LEFhNbEoqY8ZMzeSF/WHzbH8A+aPQn8DWcnWuhlOPu1keD9yxd6rktPKG0cipiOzXyZA3jwQJi+rayLqHpJKse8QciwvtmhqwtgZzLgSSaQf3vZ6tyWHBL8Xt6QHHNSx8wxXQfRI/Tr9VlBRwnYXeRW6oHTCM9K+s/uxtI2UziJN07SaSCKpRbj/X9lr35RIN2atpqMNLZBknqNhcuIAQa1e8n0nXR9V4Ei6+1T88SeK6IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7z7E7IRfqZEWKPvVRnTcDztA3hMdNeO9Ic/vRC07zs=;
 b=V73wvEgPnflPAdhz54+NEhDGft4VePJ7e28Uc8FyVhL+yAUFq8d2oYOI1cQcsIM9auFPQ2JL55puzNd7e/3T7mYeQhON0/YWeZCxoTuJZz9YqqdpuymY9m3CXORQX5Q7Li2oCBo1hbq04PHw1XY3DC55luFYYaObB1rRF9Qlyyg=
Received: from SN6PR12MB2672.namprd12.prod.outlook.com (2603:10b6:805:6f::25)
 by SN1PR12MB2430.namprd12.prod.outlook.com (2603:10b6:802:30::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 22:09:16 +0000
Received: from SN6PR12MB2672.namprd12.prod.outlook.com
 ([fe80::9c8a:73d6:9a07:d021]) by SN6PR12MB2672.namprd12.prod.outlook.com
 ([fe80::9c8a:73d6:9a07:d021%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 22:09:16 +0000
From: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 10/10] drm/amdgpu: Move dmabuf attach/detach to
 backend_(un)bind
Thread-Topic: [PATCH v2 10/10] drm/amdgpu: Move dmabuf attach/detach to
 backend_(un)bind
Thread-Index: AQHXPU8CYk1rv0MO3UCy7ALI/XNyiKrdV4ow
Date: Mon, 10 May 2021 22:09:16 +0000
Message-ID: <SN6PR12MB2672A853E71A1703F99686DCE3549@SN6PR12MB2672.namprd12.prod.outlook.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
 <20210422013058.6305-11-Felix.Kuehling@amd.com>
 <cbacb1f4-db64-be9b-ca53-5edc39a6a1e4@gmail.com>
In-Reply-To: <cbacb1f4-db64-be9b-ca53-5edc39a6a1e4@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-05-10T22:09:10Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=da634670-2744-4e5b-89a6-cc872be7164e;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: Review of amdgpu code  
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [70.114.142.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34f1cece-f139-4d41-4030-08d9140040c4
x-ms-traffictypediagnostic: SN1PR12MB2430:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB243034F22FC20DFB3E1707E1E3549@SN1PR12MB2430.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JDkxslgplGJH+QjyrjO+WUDQ6uzCIGx3t9rPNLv8DeUOIJ/2hzh1Ka4VPWAp81/U2XqL5KDEsSQwkUFnjIp2yd4eJ42FmWa5MtjY7kxyBANE7/SQ8hbQutnSuOJvuP8TwNacTNSitT8ae6MuFal46lQnkAbmG11x8xPOxzbd53AoFUSz6PHu+uHrcX2c8YxGi2JlgnCgasfi5FxnOI6jygBVgaTyswHUBGEV1k0g8n6d9jOsk1t0wwnS+/E1HFhPKfr96Ih6xsTMKOQb0CqwaVlqYRfGoGUdku3h4taKOLjo3GK8TKNb8lFGop99+OkIJv04GEFfPcbjxLBwRez8OZkc9ozK5xLiaIivMihBmQXQpJJmPRM92PikRzWtyMzGZ3eXn/1tdTJjnrIVP8TTzEB6cdq+FPJI2lOzLGMQ9ujfPVZULYrmra2Oj80ZDUMi1IbGebMwJyCPgamhFe4SVTGusIUJoTV3hW8QYS9eJu1AQ8MJAAKUDx9xK0DrPbMoG1+lie1yUFUbhiLVF9JeQjICOz6J9ZuQgtK2BBWOrlnpKtCeh+z9YgkD9vcSpSY6IpRhnZEbJL9yE9zNvshTJX99BamQ4j5Lvxnmg/weOl3EnuSrIO+lRrPn/ZqI7ej7voF4xiiOQk+8O/wGcMaEWQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2672.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(52536014)(966005)(9686003)(55016002)(122000001)(6506007)(5660300002)(53546011)(38100700002)(66574015)(71200400001)(2906002)(83380400001)(8936002)(7696005)(26005)(66476007)(66946007)(8676002)(186003)(64756008)(45080400002)(316002)(478600001)(66446008)(33656002)(66556008)(76116006)(110136005)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SmxvWjQzakFnaWtXRUlPUW8wMzJDQm93ZVZNL3ZWdXE0VnNKd0tObURrenpj?=
 =?utf-8?B?a2ovdlJVTnV0MmtJMlhFM0s0eGdKUXJuY1pDNDl0QWR0dGpudzFTYjNaOE5s?=
 =?utf-8?B?NVBEMVFYSmtBWmFhRTBsNGoyQ0xwUmhKZEVDaVNoTDkrdGZQclIxbDBxaTNQ?=
 =?utf-8?B?QVEycSt2TVFmM3NqOGk1NlpFL0FQQnZRRm42QkpvTmNZWjBFNlFOWVV5WlNk?=
 =?utf-8?B?OFc0L0srY0tGeVhUYWcyUjltSHp0KzhHNExBS1R4d0VyeHJQMWRCd1UxMzgz?=
 =?utf-8?B?cDZ2OUo0MHFCVzFTRk96R3NiL29kTXhPZlVkZkw3Tzl2dmljYWI1WWJYQlZF?=
 =?utf-8?B?Uzc0NzNIUmtMSCtVMkZYTjd0YTRLVzdoejlFdmF2NE5FcXoxTmlETlhnQ090?=
 =?utf-8?B?QmdwV2pyazdQQ2wyMG5BbjVsdWVwVWxyd2hRSEVHS3VNODd1aVRtdG51YnBE?=
 =?utf-8?B?RS9vRVFVMXdqdFJXYVZuMDhDQ0R6ek5ZUGhWS0JSUFZLcm1mVW1MRHNSYUlX?=
 =?utf-8?B?bklvZjAwZ2ZGb25XbEd4OUdHUjZ2RVJvckY2MVNGdkQ2bXhwdXZJSVBRVjUy?=
 =?utf-8?B?KzJTcWM4L0ZnVUFFM0FlTTROYnFic2VSTkVXMEZucDluTUpxY1FuZ0E4ZW9U?=
 =?utf-8?B?WjBoN3dweG1IblYzUnpLMmxaenpyanZ4SmVqODNqTVk3QThqOXM1K2piSmJM?=
 =?utf-8?B?S2RnSWFBUHZ0SjN3U3A5dTU0dUplQ3dEQjRVdGVQenZLYU1HakpEcEpyUFdn?=
 =?utf-8?B?VzcvNnNnRG5hd0dFTzB1akxHRlowdHBRb3I4N1dwRWQwYVBhUWY1WWNjbkhz?=
 =?utf-8?B?SjdsNDR1SzNQRm80UFNaSmJ0M3dHK09TajhwOGRDZ0NMbUpSUmJ4Y0ZzWUtq?=
 =?utf-8?B?VFptaWtQS2RRVytJVWxLNjMrd241blZtYkxmT0h4NTBrRkJQeURqWkJFU25Z?=
 =?utf-8?B?R3BaM3pNKzAvOFFmK1V2T3F3OFIrd2Q0bDVaVENIMXZRcTFiWUJ0elM5SjVG?=
 =?utf-8?B?K3VzR3JRZVFYcjNrakZpVGMwMmdYdVBzNHBYY0QwWUtlNXRGS0xqaEZva29O?=
 =?utf-8?B?aWRMdmRRcUtvL2FLMVhVQ0t0blpvMkd4aC8zR0l0Z0lDME93MWZPR0oraGFL?=
 =?utf-8?B?TFpBVzNDYW1OQ1BnRGRiby9yVk1mTEhYL08veDBLREluNDRDcFYrYTVkenFz?=
 =?utf-8?B?bW1uQ1NQOWJ4aUhLUDBBb1ZpK3VrVTlDTjYvNzZmOFhudFp2VEc0OEZ3czVN?=
 =?utf-8?B?WWNPS255UmlhcXZjVDAyc2RGQmpxY3FtV1ovbjdJUzBXS1EvZWQvL01vUit0?=
 =?utf-8?B?MjA4YUhBaVlhTktFTFdnTWJmWVcreGNSd3pETFJ4Y1VodlhxMzQ5aEpUeS9q?=
 =?utf-8?B?VXpFNi9iSWJ1L1c1OUNZVXgwa0ppZnFjZTdHM1lhdzFtSllxZllTRG9FYlQr?=
 =?utf-8?B?bW83dWljckUybGZJcktIaGJ1c0Z5VUtybzRTSGdIaVFwV2xUbjJRMnJKWTVt?=
 =?utf-8?B?SE9ZQXgwQXBDM3p5MjVCMC94djlycm5tL3c3QllsTGJCbjNpbjU3RkVaY3VP?=
 =?utf-8?B?d3pvU3c3eklsOGUvVCt3TXlBc0tIalBURVlqL3hkbXpXTlYvbkZFbG1qQWcr?=
 =?utf-8?B?NEVyOHJ5a2wrTTU3d3FscXVaVDBjZGlobUE2OFNVajJ1Q3VzUmZJK3BMVmFr?=
 =?utf-8?B?V3U2OEp2N2lvcC84OGN6OE4waElVYkovN3k5TWtlbHRpYnJjWndrVENGMlpI?=
 =?utf-8?Q?0HWr/TtRzkqqLWTg0CpEgafjm79QbPeMq0pKGZp?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2672.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f1cece-f139-4d41-4030-08d9140040c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 22:09:16.7725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Y8QPg5NW58CY7HMcPakzZGJRf1hzessF4ZjEOiO4Gcc3D78kG3ZkG5sCgFEKdNC1TUKYXxezc/cpsarOdoG1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2430
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpB
Y2tlZC1ieTogUmFtZXNoIEVycmFib2x1IDxyYW1lc2guZXJyYWJvbHVAYW1kLmNvbT4NCg0KLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFtZC1nZnggPGFtZC1nZngtYm91bmNlc0Bs
aXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBDaHJpc3RpYW4gS8O2bmlnDQpTZW50
OiBUaHVyc2RheSwgQXByaWwgMjIsIDIwMjEgNjoyMCBBTQ0KVG86IEt1ZWhsaW5nLCBGZWxpeCA8
RmVsaXguS3VlaGxpbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEw
LzEwXSBkcm0vYW1kZ3B1OiBNb3ZlIGRtYWJ1ZiBhdHRhY2gvZGV0YWNoIHRvIGJhY2tlbmRfKHVu
KWJpbmQNCg0KQW0gMjIuMDQuMjEgdW0gMDM6MzAgc2NocmllYiBGZWxpeCBLdWVobGluZzoNCj4g
VGhlIGRtYWJ1ZiBhdHRhY2htZW50IHNob3VsZCBiZSB1cGRhdGVkIGJ5IG1vdmluZyB0aGUgU0cg
Qk8gdG8gDQo+IERPTUFJTl9DUFUgYW5kIGJhY2sgdG8gRE9NQUlOX0dUVC4gVGhpcyBkb2VzIG5v
dCBuZWNlc3NhcmlseSBpbnZva2UgDQo+IHRoZSBwb3B1bGF0ZS91bnBvcHVsYXRlIGNhbGxiYWNr
cy4gRG8gdGhpcyBpbiBiYWNrZW5kX2JpbmQvdW5iaW5kIGluc3RlYWQuDQo+DQo+IFNpZ25lZC1v
ZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPg0KDQpSZXZpZXdl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQo+IC0t
LQ0KPiAgIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jICB8ICAz
IC0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jICAgICAgIHwg
NTEgKysrKysrKysrLS0tLS0tLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9u
cygrKSwgMjkgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgDQo+IGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jDQo+IGluZGV4IDE4YTFmOTIyMmE1OS4uNjhl
NmNlOGRjZjMzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfYW1ka2ZkX2dwdXZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZF9ncHV2bS5jDQo+IEBAIC01ODIsOSArNTgyLDYgQEAga2ZkX21lbV9kbWF1bm1h
cF9kbWFidWYoc3RydWN0IGtmZF9tZW1fYXR0YWNobWVudCANCj4gKmF0dGFjaG1lbnQpDQo+ICAg
DQo+ICAgCWFtZGdwdV9ib19wbGFjZW1lbnRfZnJvbV9kb21haW4oYm8sIEFNREdQVV9HRU1fRE9N
QUlOX0NQVSk7DQo+ICAgCXR0bV9ib192YWxpZGF0ZSgmYm8tPnRibywgJmJvLT5wbGFjZW1lbnQs
ICZjdHgpOw0KPiAtCS8qIEZJWE1FOiBUaGlzIGRvZXMgbm90IGd1YXJhbnRlZSB0aGF0IGFtZGdw
dV90dG1fdHRfdW5wb3B1bGF0ZSBpcw0KPiAtCSAqIGNhbGxlZA0KPiAtCSAqLw0KPiAgIH0NCj4g
ICANCj4gICBzdGF0aWMgdm9pZA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYw0KPiBpbmRleCA3ZTdkODMzMGQ2NGIuLmZjMmE4ZDY4MWRiYyAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPiBAQCAtOTEwLDcgKzkxMCwyMyBA
QCBzdGF0aWMgaW50IGFtZGdwdV90dG1fYmFja2VuZF9iaW5kKHN0cnVjdCB0dG1fZGV2aWNlICpi
ZGV2LA0KPiAgIAkJCURSTV9FUlJPUigiZmFpbGVkIHRvIHBpbiB1c2VycHRyXG4iKTsNCj4gICAJ
CQlyZXR1cm4gcjsNCj4gICAJCX0NCj4gKwl9IGVsc2UgaWYgKHR0bS0+cGFnZV9mbGFncyAmIFRU
TV9QQUdFX0ZMQUdfU0cpIHsNCj4gKwkJaWYgKCF0dG0tPnNnKSB7DQo+ICsJCQlzdHJ1Y3QgZG1h
X2J1Zl9hdHRhY2htZW50ICphdHRhY2g7DQo+ICsJCQlzdHJ1Y3Qgc2dfdGFibGUgKnNndDsNCj4g
Kw0KPiArCQkJYXR0YWNoID0gZ3R0LT5nb2JqLT5pbXBvcnRfYXR0YWNoOw0KPiArCQkJc2d0ID0g
ZG1hX2J1Zl9tYXBfYXR0YWNobWVudChhdHRhY2gsIERNQV9CSURJUkVDVElPTkFMKTsNCj4gKwkJ
CWlmIChJU19FUlIoc2d0KSkNCj4gKwkJCQlyZXR1cm4gUFRSX0VSUihzZ3QpOw0KPiArDQo+ICsJ
CQl0dG0tPnNnID0gc2d0Ow0KPiArCQl9DQo+ICsNCj4gKwkJZHJtX3ByaW1lX3NnX3RvX2RtYV9h
ZGRyX2FycmF5KHR0bS0+c2csIGd0dC0+dHRtLmRtYV9hZGRyZXNzLA0KPiArCQkJCQkgICAgICAg
dHRtLT5udW1fcGFnZXMpOw0KPiAgIAl9DQo+ICsNCj4gICAJaWYgKCF0dG0tPm51bV9wYWdlcykg
ew0KPiAgIAkJV0FSTigxLCAibm90aGluZyB0byBiaW5kICV1IHBhZ2VzIGZvciBtcmVnICVwIGJh
Y2sgJXAhXG4iLA0KPiAgIAkJICAgICB0dG0tPm51bV9wYWdlcywgYm9fbWVtLCB0dG0pOyBAQCAt
MTAzNyw4ICsxMDUzLDE1IEBAIHN0YXRpYyANCj4gdm9pZCBhbWRncHVfdHRtX2JhY2tlbmRfdW5i
aW5kKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LA0KPiAgIAlpbnQgcjsNCj4gICANCj4gICAJLyog
aWYgdGhlIHBhZ2VzIGhhdmUgdXNlcnB0ciBwaW5uaW5nIHRoZW4gY2xlYXIgdGhhdCBmaXJzdCAq
Lw0KPiAtCWlmIChndHQtPnVzZXJwdHIpDQo+ICsJaWYgKGd0dC0+dXNlcnB0cikgew0KPiAgIAkJ
YW1kZ3B1X3R0bV90dF91bnBpbl91c2VycHRyKGJkZXYsIHR0bSk7DQo+ICsJfSBlbHNlIGlmICh0
dG0tPnNnICYmIGd0dC0+Z29iai0+aW1wb3J0X2F0dGFjaCkgew0KPiArCQlzdHJ1Y3QgZG1hX2J1
Zl9hdHRhY2htZW50ICphdHRhY2g7DQo+ICsNCj4gKwkJYXR0YWNoID0gZ3R0LT5nb2JqLT5pbXBv
cnRfYXR0YWNoOw0KPiArCQlkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQoYXR0YWNoLCB0dG0tPnNn
LCBETUFfQklESVJFQ1RJT05BTCk7DQo+ICsJCXR0bS0+c2cgPSBOVUxMOw0KPiArCX0NCj4gICAN
Cj4gICAJaWYgKCFndHQtPmJvdW5kKQ0KPiAgIAkJcmV0dXJuOw0KPiBAQCAtMTEyNSwyMyArMTE0
OCw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2Rldmlj
ZSAqYmRldiwNCj4gICAJCXJldHVybiAwOw0KPiAgIAl9DQo+ICAgDQo+IC0JaWYgKHR0bS0+cGFn
ZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpIHsNCj4gLQkJaWYgKCF0dG0tPnNnKSB7DQo+IC0J
CQlzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2g7DQo+IC0JCQlzdHJ1Y3Qgc2dfdGFi
bGUgKnNndDsNCj4gLQ0KPiAtCQkJYXR0YWNoID0gZ3R0LT5nb2JqLT5pbXBvcnRfYXR0YWNoOw0K
PiAtCQkJc2d0ID0gZG1hX2J1Zl9tYXBfYXR0YWNobWVudChhdHRhY2gsIERNQV9CSURJUkVDVElP
TkFMKTsNCj4gLQkJCWlmIChJU19FUlIoc2d0KSkNCj4gLQkJCQlyZXR1cm4gUFRSX0VSUihzZ3Qp
Ow0KPiAtDQo+IC0JCQl0dG0tPnNnID0gc2d0Ow0KPiAtCQl9DQo+IC0NCj4gLQkJZHJtX3ByaW1l
X3NnX3RvX2RtYV9hZGRyX2FycmF5KHR0bS0+c2csIGd0dC0+dHRtLmRtYV9hZGRyZXNzLA0KPiAt
CQkJCQkgICAgICAgdHRtLT5udW1fcGFnZXMpOw0KPiArCWlmICh0dG0tPnBhZ2VfZmxhZ3MgJiBU
VE1fUEFHRV9GTEFHX1NHKQ0KPiAgIAkJcmV0dXJuIDA7DQo+IC0JfQ0KPiAgIA0KPiAgIAlyZXR1
cm4gdHRtX3Bvb2xfYWxsb2MoJmFkZXYtPm1tYW4uYmRldi5wb29sLCB0dG0sIGN0eCk7DQo+ICAg
fQ0KPiBAQCAtMTE2NSwxNSArMTE3Myw2IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV90dG1fdHRfdW5w
b3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwNCj4gICAJCXJldHVybjsNCj4gICAJfQ0K
PiAgIA0KPiAtCWlmICh0dG0tPnNnICYmIGd0dC0+Z29iai0+aW1wb3J0X2F0dGFjaCkgew0KPiAt
CQlzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2g7DQo+IC0NCj4gLQkJYXR0YWNoID0g
Z3R0LT5nb2JqLT5pbXBvcnRfYXR0YWNoOw0KPiAtCQlkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQo
YXR0YWNoLCB0dG0tPnNnLCBETUFfQklESVJFQ1RJT05BTCk7DQo+IC0JCXR0bS0+c2cgPSBOVUxM
Ow0KPiAtCQlyZXR1cm47DQo+IC0JfQ0KPiAtDQo+ICAgCWlmICh0dG0tPnBhZ2VfZmxhZ3MgJiBU
VE1fUEFHRV9GTEFHX1NHKQ0KPiAgIAkJcmV0dXJuOw0KPiAgIA0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90
ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5v
cmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTA0JTdDMDElN0NwaGls
aXAueWFuZyU0MGFtZC5jb20lN0NkOWYwZWUyY2JhNTg0NWE5MGQ2YjA4ZDkwNTgwOWRmMCU3QzNk
ZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc1NDY4NzIyMzY1NDIx
ODclN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYy
bHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9dkV2
JTJGbWVJRmNLWHRFd3dvcHc5QU04QVcyT1NGeExORnNkOGdvbSUyRkE2ZnMlM0QmYW1wO3Jlc2Vy
dmVkPTANCg==
