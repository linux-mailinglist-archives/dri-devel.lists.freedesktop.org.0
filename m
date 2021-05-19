Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D623884D3
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 04:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F3E6E161;
	Wed, 19 May 2021 02:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E6B6E161;
 Wed, 19 May 2021 02:39:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dI1EeMl+MFhdpqRPwtVHiALem6N9Y7Dsb6lDSVEUrH/JjvHJNYhkhh6QoRMWppvOKyKZjXDh5A8RLID0bUdE0nhTiNemt2fyn4WUxBQxfHDH99UNwHvhtXb1UcbLnhGZ+oHMlCaghhIVqQxUicXts5fdUtmvDR3tyXTNc2s3Y+CWMzhfr1zDoVVYpCbe8xtHH1dAsKL45jjOf9M8IACRNwERMU1jqnWHtpWLFD8vwm8Qne2q/1a92qbeEY+gxfKeyErPLcdJUCGXwgXqAHPD7wjodBIHOCLT2BPfREOD87ZUr8+qfvr9dr+4C1GRRz5og52B3O1Oivf0jNLkgX8eAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGyXK9JJKQoteRRJpgWrIJbBd3CCVYnVVIgLpavLY+4=;
 b=kXW2lyV+AIDa3/WSYRkn87WIl78NKK/1it4QIDKEIA6cqGsx3hErdDO0DlHKXzqII2D/CGA/lIt9PdCShjBbMArKmon0tRQ0/gmdvV724Y/u1LbFWSfzPrJ76SWIc/Uwx3Yf31bxepSDXxuEn8t9UfOSpW+SIGVWWG4mL+nTW1UhlfBs19J1wlFbep58QCDSr9iMPTqJwxatY2vejSAQHiPddQ8PsActY57MFM4thWVnOE0yrz5odqTfvv8ZIIBnm+TtsTWV9YT237j4vh7v22oBgw6Dp56omY9vgGDPVBJJXQK3Ti6RpWyHf/IQ6pDeEIskHkyhYqG5kxfDqtGIQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGyXK9JJKQoteRRJpgWrIJbBd3CCVYnVVIgLpavLY+4=;
 b=1UXESbF/1mzVGmhWKo88MNxmRtcKiNFJhG+B/rN3U/aPfGnsU4dv9VJyM+ajjrIgyJ3Ux5gdO4LbBMJgT8s4gBlZmaTSLefwTE8QIGoMtqsfof/2XIo54eL1FyERFFj6RK3RrlLsHP9RwLe0E1nbkR2MSFmdGJvrmKPmqxPkdy0=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5102.namprd12.prod.outlook.com (2603:10b6:5:391::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25; Wed, 19 May 2021 02:39:33 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::4543:6802:6acc:c92d%5]) with mapi id 15.20.4129.031; Wed, 19 May 2021
 02:39:33 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: =?gb2312?B?u9i4tDogW1JGQyBQQVRDSCAxLzJdIGRybS9hbWRncHU6IEZpeCBtZW1vcnkg?=
 =?gb2312?Q?corruption_due_to_swapout_and_swapin?=
Thread-Topic: [RFC PATCH 1/2] drm/amdgpu: Fix memory corruption due to swapout
 and swapin
Thread-Index: AQHXTFbLtz1o1HqhjUSdnwL4CAK9UqrqFh5j
Date: Wed, 19 May 2021 02:39:33 +0000
Message-ID: <DM4PR12MB5165A2CF1E994C2D4FA35B0D872B9@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20210519022852.16766-1-xinhui.pan@amd.com>
In-Reply-To: <20210519022852.16766-1-xinhui.pan@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-05-19T02:39:32.190Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD-Official
 Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29ab75e5-f696-4143-3047-08d91a6f55ff
x-ms-traffictypediagnostic: DM4PR12MB5102:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR12MB5102CF57337B4267360A5791872B9@DM4PR12MB5102.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h1ksYK1QOVyQPYuBKA116L7ctDrkbOTWs9bTZl6p/nvJzBhAusGEotJVTp8hk/cnLCYPVllkVGzQ5fdwNwyXf4+EStwpum/JtgHVupH4CxfdY2ZOKxhy2ajUqLvncF9kkjO1zoJ8UdEq5O2p5sPahUzbr26p5vIUQtgkz2aJC6QJ1Vim1FcDaIOtLEZpHdFSFG6Dp2nsgutMS7MHKZwMcP0nfb45eVLIEuxwjc/bcyWP4usCGoWgH/fN5hpu30sLSbi5socnFeEh2oqJ/6366o+IxAhw0YuAcCX8BIu6ReIwDi+Is3CBeysiv5g5w5I3usFLyJjQyIqw571aIdaN71tQw4JnOiOsdIbA7OcJfM1NaiB2uL2k/XzSG2ep4QBbInLHyoRma5D9myHqcHBysUy5OpCo82mdoHoEGdKBnlbmFnWE9FWgmTHLVD2ugfkkWEqV8t/Cim0dGqN9/OEPTQ3wFRh+et9sSSS7TQ5nIfJgjnb0LGWf/mCyGM7p7whw22l9GIPg8ifU2Mgrre89yl8e3foM/QMfas9/KpsgHd/aCsOh4suqtWYZfnbPbXQEVaLG+hPWJr2HkU1sLa+B+XlShS3xjkRXuRKJ991ADZo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(66946007)(54906003)(66446008)(64756008)(52536014)(66556008)(66476007)(76116006)(91956017)(478600001)(83380400001)(2906002)(186003)(71200400001)(33656002)(86362001)(55016002)(6916009)(122000001)(224303003)(26005)(8936002)(5660300002)(38100700002)(7696005)(6506007)(316002)(9686003)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?gb2312?B?M3lPUWpjQklxNEdLM2M4dzV3VXlOdmhnU3dkQVhEeHh4Y2tDN2pVcndkQUJk?=
 =?gb2312?B?dVM5RUF5b2M3ci9xc0VQYjI0TkpWMGErOUljdHpWTFlXempnVVNadUdRU2JB?=
 =?gb2312?B?eUl1dzZDdFlHOXBMYk85ZWJySEJyTVFpOXVjSFZkMFVTWFBNSjdCNEZXSGtC?=
 =?gb2312?B?eXpoUmVlcFJtWjRjUkxiZUFjOVprU2JiTEpEN3ZJci9TaDcyWFhybWE0dnVU?=
 =?gb2312?B?VWVHWXRWdk0zREhFT2RBMkJnWFM3bi91cFNZc3VEYitwa2dKaWR1b1hpcTEw?=
 =?gb2312?B?K293ZHd3dXp4UUsrTzFwdi95cEw4YjNyYTBuMDI5cmIwUDhoQllxbTY0MSth?=
 =?gb2312?B?UmFqTThEdWtXRjd1c3dNZFIrVlNxYVl1MDhhSFdVMGdTcFB0dkU5eFF3TFFq?=
 =?gb2312?B?Tml3SGlweDFsU21qUW9ZOVpsdXhxZGoyc0pZU0tqV0dzUWlEYmM4Z0VtU3Uz?=
 =?gb2312?B?aXpJalJWU2xTWTIvWEd3NkZwdmFrQUQyNUFoZWdoQ29idEJRQlpVNXB1cG1R?=
 =?gb2312?B?U3lQVzIzMGIwWnArMHB5WG1LV01FeUNQSTl0MWJ5bUVCYXgyOFRURUpxRWJm?=
 =?gb2312?B?TWdRKzYraFlpcUtCck5WdjBuTEszbnhVQlltZ3JYc21IVWhOOEhkdDkxY3Nl?=
 =?gb2312?B?RkgwZW52Zm9qTE1qSmJUWnhnZ1VHdll5S0FXT1BxQXM5U3RzdjdmbWd5a2s5?=
 =?gb2312?B?VHQ4d2R6WlpWMDRlakMwSkM2UWVlZEZOaVpid00yZzlrSGxpd2lzYU82S2p0?=
 =?gb2312?B?T1pCakNFd0xIZk5TZTcwZzRDZDJWUHZlQkYyMzFVRnhFaEEvQzJVbUZmellU?=
 =?gb2312?B?RFRpNlp2R0ZVVlRwcFFicHAxQ3ZNMndpa0Zpa25jOWRkcC9TQ0VMTUtnV2s1?=
 =?gb2312?B?VXY3d3FSYVhNc0N5UUVPOXRiYkRCOTRaWmlqNjZuUEh6M3FMQ055QlpPd1JQ?=
 =?gb2312?B?UEN5eU95bG8waW1WbDBoT25IK1N0RHF5NUpsY2RudzBxTFlCZVFmRUF6ei9X?=
 =?gb2312?B?RjUzQzNJUEJ4M1dqVEdqN0tkdnlEYjZMWWVrN2xMNGdBQUxCbWU3dDVYRDdt?=
 =?gb2312?B?RE95Mk1XY0NhblhyRk96MVgwTXp0L1drYzM3THVRZitmOUgwNkN0QXc1dW5z?=
 =?gb2312?B?dGx6VXcvRHVyVU5HZ3RabFJDbHZ1M2VOWHhBdEc5VGVRdjVQUlBzREVibUNV?=
 =?gb2312?B?cTM1TjhGR1dxSVN6ZWNhdGhGeFhVV1ZSTnd4SFZQeWQ1L2pLak1OcnpZaEJX?=
 =?gb2312?B?QUNzc2FTVVV4U1BqL3hMUjR3SjhFS3VMTlJ5Q2VGSDVJa1J6RitsNi9pa0ZS?=
 =?gb2312?B?b2xUTFZmSFdVTUtFcTdRMlZIQ1RiTzZpUDByaVlGSFl4enVtR2NQSzlLTStq?=
 =?gb2312?B?NXVqTmppenpOdDg4V1p3OHkvdkhIaXRRVmxUd1YvZlEyKy8wT29zNHZZZnpC?=
 =?gb2312?B?NVhsSjVQTHVHZGxCc2doN3JrcFJxd2VXZERHYk5PdjZmc1UwS2R6K2ZzRVFl?=
 =?gb2312?B?SzNNbjdrNWNoYUpzR09vMEh4SUw1TDNKaGFCT2pudzRLeE5oQU0xOWYvbmNl?=
 =?gb2312?B?LzJvUHU4TUd2a1hvMUpOUktPa1ArbGtIallTYzJoWFVLZGxyTDI5TGs1V1BG?=
 =?gb2312?B?aUZaZWJ4Qmk5anBQVFBrSnZxSEhnQ2toMW8xMThXUnJpR1BvZERuUTlydkc2?=
 =?gb2312?B?S1hWeUZNN3doaTZCclR1dXYySFNxOGVIdU1YYnVsalFTK3BKSUtGMnZoUURE?=
 =?gb2312?Q?kNQahR2ytue/UBxXhOjKbT/IxLz1M6WmtqVyjr7?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ab75e5-f696-4143-3047-08d91a6f55ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2021 02:39:33.5478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZIekRqi+jWUf4x4bDDeJna/IT7DTMLb3Z1cRgAjIjsGR33OcPn6q72ZnFrPA+pVi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5102
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBPZmZpY2lhbCBVc2UgT25seV0NCg0KVG8gb2JzZXJ2ZSB0aGUgaXNzdWUuIEkgbWFkZSBv
bmUga2ZkdGVzdCBjYXNlIGZvciBkZWJ1Zy4NCkl0IGp1c3QgYWxsb2MgYSB1c2VycHRyIG1lbW9y
eSBhbmQgZGV0ZWN0IGlmIG1lbW9yeSBpcyBjb3JydXB0ZWQuDQpJIGNhbiBoaXQgdGhpcyBmYWls
dXJlIGluIDIgbWludXRlcy4gOigNCg0KZGlmZiAtLWdpdCBhL3Rlc3RzL2tmZHRlc3Qvc3JjL0tG
RE1lbW9yeVRlc3QuY3BwIGIvdGVzdHMva2ZkdGVzdC9zcmMvS0ZETWVtb3J5VGVzdC5jcHANCmlu
ZGV4IDcwYzgwMzMuLmE3MmY1M2YgMTAwNjQ0DQotLS0gYS90ZXN0cy9rZmR0ZXN0L3NyYy9LRkRN
ZW1vcnlUZXN0LmNwcA0KKysrIGIvdGVzdHMva2ZkdGVzdC9zcmMvS0ZETWVtb3J5VGVzdC5jcHAN
CkBAIC01ODQsNiArNTg0LDMyIEBAIFRFU1RfRihLRkRNZW1vcnlUZXN0LCBaZXJvTWVtb3J5U2l6
ZUFsbG9jKSB7DQogICAgIFRFU1RfRU5EDQogfQ0KDQorVEVTVF9GKEtGRE1lbW9yeVRlc3QsIHN3
YXApIHsNCisgICAgVEVTVF9TVEFSVChURVNUUFJPRklMRV9SVU5BTEwpDQorDQorICAgIHVuc2ln
bmVkIGludCBzaXplID0gMTI4PDwyMDsNCisgICAgdW5zaWduZWQgaW50KnRtcCA9ICh1bnNpZ25l
ZCBpbnQgKiltbWFwKDAsDQorICAgICAgICAgICAgICAgICAgIHNpemUsDQorICAgICAgICAgICAg
ICAgICAgIFBST1RfUkVBRCB8IFBST1RfV1JJVEUsDQorICAgICAgICAgICAgICAgICAgIE1BUF9B
Tk9OWU1PVVMgfCBNQVBfUFJJVkFURSwNCisgICAgICAgICAgICAgICAgICAgLTEsDQorICAgICAg
ICAgICAgICAgICAgIDApOw0KKyAgICBFWFBFQ1RfTkUodG1wLCBNQVBfRkFJTEVEKTsNCisNCisg
ICAgTE9HKCkgPDwgInBscyBydW4gdGhpcyB3aXRoIEtGRE1lbW9yeVRlc3QuTGFyZ2VzdFN5c0J1
ZmZlclRlc3QiIDw8IHN0ZDo6ZW5kbDsNCisgICAgZG8gew0KKyAgICAgICAgICAgbWVtc2V0KHRt
cCwgMHhjYywgc2l6ZSk7DQorDQorICAgICAgICAgICBIc2FNZW1vcnlCdWZmZXIgYnVmKHRtcCwg
c2l6ZSk7DQorICAgICAgICAgICBzbGVlcCgxKTsNCisgICAgICAgICAgIEVYUEVDVF9FUSh0bXBb
MF0sIDB4Y2NjY2NjY2MpOw0KKyAgICB9IHdoaWxlICh0cnVlKTsNCisNCisgICAgbXVubWFwKHRt
cCwgc2l6ZSk7DQorDQorICAgIFRFU1RfRU5EDQorfQ0KKw0KIC8vIEJhc2ljIHRlc3QgZm9yIGhz
YUttdEFsbG9jTWVtb3J5DQogVEVTVF9GKEtGRE1lbW9yeVRlc3QsIE1lbW9yeUFsbG9jKSB7DQog
ICAgIFRFU1RfU1RBUlQoVEVTVFBST0ZJTEVfUlVOQUxMKQ0KLS0NCjIuMjUuMQ0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQq3orz+yMs6IFBhbiwgWGluaHVpIDxY
aW5odWkuUGFuQGFtZC5jb20+DQq3osvNyrG85DogMjAyMcTqNdTCMTnI1SAxMDoyOA0KytW8/sjL
OiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0Ks63LzTogS3VlaGxpbmcsIEZlbGl4OyBE
ZXVjaGVyLCBBbGV4YW5kZXI7IEtvZW5pZywgQ2hyaXN0aWFuOyBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnOyBkYW5pZWxAZmZ3bGwuY2g7IFBhbiwgWGluaHVpDQrW98ziOiBbUkZDIFBB
VENIIDEvMl0gZHJtL2FtZGdwdTogRml4IG1lbW9yeSBjb3JydXB0aW9uIGR1ZSB0byBzd2Fwb3V0
IGFuZCBzd2FwaW4NCg0KY3B1IDEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY3B1IDINCmtmZCBhbGxvYyBCTyBBKHVzZXJwdHIpICAgICAgICAgICAgICAgICAgICAg
ICAgIGFsbG9jIEJPIEIoR1RUKQ0KICAgIC0+aW5pdCAtPiB2YWxpZGF0ZSAgICAgICAgICAgICAg
ICAgICAgICAgICAgLT4gaW5pdCAtPiB2YWxpZGF0ZSAtPiBwb3B1bGF0ZQ0KICAgIGluaXRfdXNl
cl9wYWdlcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtPiBzd2Fwb3V0IEJPIEEgLy9o
aXQgdHRtIHBhZ2VzIGxpbWl0DQogICAgICAgIC0+IGdldF91c2VyX3BhZ2VzIChmaWxsIHVwIHR0
bS0+cGFnZXMpDQogICAgICAgICAtPiB2YWxpZGF0ZSAtPiBwb3B1bGF0ZQ0KICAgICAgICAgIC0+
IHN3YXBpbiBCTyBBIC8vIE5vdyBoaXQgdGhlIEJVRw0KDQpXZSBrbm93IHRoYXQgZ2V0X3VzZXJf
cGFnZXMgbWF5IHJhY2Ugd2l0aCBzd2Fwb3V0IG9uIHNhbWUgQk8uDQpUaHJlcmUgYXJlIHNvbWUg
aXNzdWVzIEkgaGF2ZSBtZXQuDQoxKSBtZW1vcnkgY29ycnVwdGlvbi4NClRoaXMgaXMgYmVjYXVz
ZSB3ZSBkbyBhIHN3YXAgYmVmb3JlIG1lbW9yeSBpcyBzZXR1cC4gdHRtX3R0X3N3YXBvdXQoKQ0K
anVzdCBjcmVhdGUgYSBzd2FwX3N0b3JhZ2Ugd2l0aCBpdHMgY29udGVudCBiZWluZyAweDAuIFNv
IHdoZW4gd2Ugc2V0dXANCm1lbW9yeSBhZnRlciB0aGUgc3dhcG91dC4gVGhlIGZvbGxvd2luZyBz
d2FwaW4gbWFrZXMgdGhlIG1lbW9yeQ0KY29ycnVwdGVkLg0KDQoyKSBwYW5pYw0KV2hlbiBzd2Fw
b3V0IGhhcHBlcyB3aXRoIGdldF91c2VyX3BhZ2VzLCB0aGV5IHRvdWNoIHR0bS0+cGFnZXMgd2l0
aG91dA0KYW55bG9jay4gSXQgY2F1c2VzIG1lbW9yeSBjb3JydXB0aW9uIHRvby4gQnV0IEkgaGl0
IHBhZ2UgZmF1bHQgbW9zdGx5Lg0KDQpTaWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5odWku
cGFuQGFtZC5jb20+DQotLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMgfCAxNiArKysrKysrKysrKysrKystDQogMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYw0KaW5kZXggOTI4ZThkNTdjZDA4Li40MjQ2MGU0
NDgwZjggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1k
a2ZkX2dwdXZtLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRr
ZmRfZ3B1dm0uYw0KQEAgLTgzNSw2ICs4MzUsNyBAQCBzdGF0aWMgaW50IGluaXRfdXNlcl9wYWdl
cyhzdHJ1Y3Qga2dkX21lbSAqbWVtLCB1aW50NjRfdCB1c2VyX2FkZHIpDQogICAgICAgIHN0cnVj
dCBhbWRrZmRfcHJvY2Vzc19pbmZvICpwcm9jZXNzX2luZm8gPSBtZW0tPnByb2Nlc3NfaW5mbzsN
CiAgICAgICAgc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBtZW0tPmJvOw0KICAgICAgICBzdHJ1Y3Qg
dHRtX29wZXJhdGlvbl9jdHggY3R4ID0geyB0cnVlLCBmYWxzZSB9Ow0KKyAgICAgICBzdHJ1Y3Qg
cGFnZSAqKnBhZ2VzOw0KICAgICAgICBpbnQgcmV0ID0gMDsNCg0KICAgICAgICBtdXRleF9sb2Nr
KCZwcm9jZXNzX2luZm8tPmxvY2spOw0KQEAgLTg1Miw3ICs4NTMsMTMgQEAgc3RhdGljIGludCBp
bml0X3VzZXJfcGFnZXMoc3RydWN0IGtnZF9tZW0gKm1lbSwgdWludDY0X3QgdXNlcl9hZGRyKQ0K
ICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KICAgICAgICB9DQoNCi0gICAgICAgcmV0ID0gYW1k
Z3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhibywgYm8tPnRiby50dG0tPnBhZ2VzKTsNCisgICAg
ICAgcGFnZXMgPSBrdm1hbGxvY19hcnJheShiby0+dGJvLnR0bS0+bnVtX3BhZ2VzLA0KKyAgICAg
ICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBwYWdlICopLA0KKyAgICAgICAgICAgICAg
ICAgICAgICAgR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOw0KKyAgICAgICBpZiAoIXBhZ2VzKQ0K
KyAgICAgICAgICAgICAgIGdvdG8gdW5yZWdpc3Rlcl9vdXQ7DQorDQorICAgICAgIHJldCA9IGFt
ZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoYm8sIHBhZ2VzKTsNCiAgICAgICAgaWYgKHJldCkg
ew0KICAgICAgICAgICAgICAgIHByX2VycigiJXM6IEZhaWxlZCB0byBnZXQgdXNlciBwYWdlczog
JWRcbiIsIF9fZnVuY19fLCByZXQpOw0KICAgICAgICAgICAgICAgIGdvdG8gdW5yZWdpc3Rlcl9v
dXQ7DQpAQCAtODYzLDYgKzg3MCwxMiBAQCBzdGF0aWMgaW50IGluaXRfdXNlcl9wYWdlcyhzdHJ1
Y3Qga2dkX21lbSAqbWVtLCB1aW50NjRfdCB1c2VyX2FkZHIpDQogICAgICAgICAgICAgICAgcHJf
ZXJyKCIlczogRmFpbGVkIHRvIHJlc2VydmUgQk9cbiIsIF9fZnVuY19fKTsNCiAgICAgICAgICAg
ICAgICBnb3RvIHJlbGVhc2Vfb3V0Ow0KICAgICAgICB9DQorDQorICAgICAgIFdBUk5fT05fT05D
RShiby0+dGJvLnR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU1dBUFBFRCk7DQorDQor
ICAgICAgIG1lbWNweShiby0+dGJvLnR0bS0+cGFnZXMsDQorICAgICAgICAgICAgICAgICAgICAg
ICBwYWdlcywNCisgICAgICAgICAgICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3QgcGFnZSopICog
Ym8tPnRiby50dG0tPm51bV9wYWdlcyk7DQogICAgICAgIGFtZGdwdV9ib19wbGFjZW1lbnRfZnJv
bV9kb21haW4oYm8sIG1lbS0+ZG9tYWluKTsNCiAgICAgICAgcmV0ID0gdHRtX2JvX3ZhbGlkYXRl
KCZiby0+dGJvLCAmYm8tPnBsYWNlbWVudCwgJmN0eCk7DQogICAgICAgIGlmIChyZXQpDQpAQCAt
ODcyLDYgKzg4NSw3IEBAIHN0YXRpYyBpbnQgaW5pdF91c2VyX3BhZ2VzKHN0cnVjdCBrZ2RfbWVt
ICptZW0sIHVpbnQ2NF90IHVzZXJfYWRkcikNCiByZWxlYXNlX291dDoNCiAgICAgICAgYW1kZ3B1
X3R0bV90dF9nZXRfdXNlcl9wYWdlc19kb25lKGJvLT50Ym8udHRtKTsNCiB1bnJlZ2lzdGVyX291
dDoNCisgICAgICAga3ZmcmVlKHBhZ2VzKTsNCiAgICAgICAgaWYgKHJldCkNCiAgICAgICAgICAg
ICAgICBhbWRncHVfbW5fdW5yZWdpc3Rlcihibyk7DQogb3V0Og0KLS0NCjIuMjUuMQ0KDQo=
