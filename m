Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E38757A9243
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 09:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1851D10E57C;
	Thu, 21 Sep 2023 07:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98EDE10E542;
 Wed, 20 Sep 2023 19:30:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Of9BrFpEKYrcEReAvBMRYw/BcJfPPMuuPuDjwrzF4MoT0yrpqvKelVi9L4QKGFD/DBUD1Gkk0Dizr+kizYHueoXx3jY+loJko2EHE7dheat+6fnn/KNVhBbr1Q+YudoNhUbyCRUtLgJGDTU0Gz3SN0Sn7lBiJtUzaGqF+wc3ctI+RHh21RlRw3pTOHMIkY3xIDwoDZiDdnm0mSTNVJ4bor3iojjPCvvQWI+kE6vnSXgn34RoYMKahW9FaFdRbB0jtVnHXEMBjveW9CZ8htzxYaa52gpm9kw8Hy0rrxBlraBfyLdNVGdhAwhyeWJ3Cdz8LOvNlwnu6c4/Dj1kYQNMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OTGXgWcMVLRJhOMF4H8KpNJ2wrnUf9Pt4EB9CpU5vs=;
 b=mjxnG6nC/hAfvTOKokXLzQUWcqRj2iPXaQU/i91Kxdm/S2eABywFRYfg+P7siRZsweymIFpeY0QWfGzvtd8UbvwkilitBCsgYhY1WpjetzyYNAp1MhhK2O6NhwvH8B/xdvbmeisPnz+CKbK8602BR6wRsSfatZuvtc7yopY6mOcKdVnAsaRqDV9G14/JIv19uhmS1RyJ9BpVyAs4TUmYMLzck2ovkPWWRZ7016qx7yt5RnRsJzsgb1kvQkcPsouvK3PL9dCrYX1NiL43VqUX6aUE4aFHaRrjLpWKmPlnM3q0gm/UybfpxIOexu6ZblssiwRceRKcohErwklHB2IsGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OTGXgWcMVLRJhOMF4H8KpNJ2wrnUf9Pt4EB9CpU5vs=;
 b=VRvbPe6wGXPyesqn6zcNoj775Vz0VyJ+MqblKI0c1aBaVXIynlz0eUi2mTHw83wwqHRzvO9bxqBZnjpHvfrMlilPiG9TYFc8bUQeJ3E/50aKD1EoshNRCsOulwv2jMz+490Fj921UOkAGR9HEdNiVE+i0P3lJo6IPss296NH0p+aHSKyyKUaQ4Z+SzLD506RTEGf5hjg+issMtksFSAu4e+5aHQiDt4GCVsGxhs/92/0+cGeJkB58hJD02wtWgfT4ARugJlzD1VfXQxgnnkPgPEPqnq05xMNTaiaax9o3PHKd8UVGsMTueWnTFObWKLVFbPyHpQO10aptX81tTDKpQ==
Received: from DS0PR12MB6391.namprd12.prod.outlook.com (2603:10b6:8:cd::16) by
 DS0PR12MB9446.namprd12.prod.outlook.com (2603:10b6:8:192::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.20; Wed, 20 Sep 2023 19:29:57 +0000
Received: from DS0PR12MB6391.namprd12.prod.outlook.com
 ([fe80::76bc:2a16:6e0f:72b6]) by DS0PR12MB6391.namprd12.prod.outlook.com
 ([fe80::76bc:2a16:6e0f:72b6%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 19:29:57 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [Nouveau] [PATCH v3 23/44] drm/nouveau/disp: add output backlight
 control methods
Thread-Topic: [Nouveau] [PATCH v3 23/44] drm/nouveau/disp: add output
 backlight control methods
Thread-Index: AQHZ60WVhNkCDmHJXkKprwZ0JCI6l7AkGyAA
Date: Wed, 20 Sep 2023 19:29:56 +0000
Message-ID: <855a4931c8a652f97e83d911b76ccf98a3655c17.camel@nvidia.com>
References: <20230919220442.202488-1-lyude@redhat.com>
 <20230919220442.202488-24-lyude@redhat.com>
In-Reply-To: <20230919220442.202488-24-lyude@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR12MB6391:EE_|DS0PR12MB9446:EE_
x-ms-office365-filtering-correlation-id: 8727c6d7-b954-47f1-7050-08dbba0ff92a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FpwUJivH2gqHizwlbzfYnpv5zzzX43F8wP/xDmu5OKOuLQCCcYM8k8s6MpP9pupUuQJl8a9EoekogQyQlRWshssF5xWycwZpNU9KJaBdacyMWFLqjH9T+p49eQ9HuGwg59oMxelm3IOJjbVj0sKd5j+H58DyNNSlqMxOS8bmwU1tBl5I0lfwgqXQUyBjqJ4P5anb4MnvlHMUUMSeHLsh76sZxthzWy2dHtt0y1MZ49MIoCmHZPStuBZTlFX7dESOFXGoN0846P0EvctPfbT6SrXeguI7JM+lX+HMIhmEJaruwvZ5kll2pQLXtncfcnNHqbZ/BUBfWvDBMDc+4uJ9ljjd67V3uoOez/mQ4IOXIwHBEtrDduGLUgme+P09PN/uByPh1B11BWRUwuDtMXFfAf8S5GWgEqUwit32wHRw8x+/BBNxn6Uxq79Qmq2VWaf3coiQmOFzAJn6iHYDAtGe6GEQzNQqMebtXTDVqzxfGyBkUGjhKgSpZumQrmIHSsB6wln9Xq9Ra8r/MHWh3OFk++B1GfamItUqNDhe3yF2OgjtkrlFcJMpWNN3oi5Mqc+JoaAj10gtT/6s6s4oIdjSNWqx82pdmcbwjGKTLVKlfTG3Vlak2K4vGaJ4fTOEr85B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6391.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(346002)(39860400002)(396003)(136003)(186009)(1800799009)(451199024)(83380400001)(26005)(71200400001)(2616005)(6486002)(6506007)(6512007)(38070700005)(478600001)(86362001)(36756003)(122000001)(38100700002)(41300700001)(316002)(54906003)(64756008)(66446008)(66946007)(91956017)(66556008)(66476007)(76116006)(110136005)(4744005)(2906002)(4326008)(8936002)(5660300002)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2NNRlExWWg3b2NTcllrTCtxL0VZVnVYYUFzZkFaSlB3ZHZnMG1IQ2hsQmV6?=
 =?utf-8?B?S3VCbml6Y1NQSnVOTTRCNlFMSUJtR1locld0cUpFZy94b20yaENRQUhqSGlF?=
 =?utf-8?B?ZmJNOEo2Um5MRzFvS3NQQWhjNzZlME1xOTNndjQ2Z0ZOZllzRFVrTEdueDMy?=
 =?utf-8?B?NElwTnVqZk9QRGxSRzZJUHRhbXVnUkI1ZnV0Nk10ZGFValowVDdEZjlianVR?=
 =?utf-8?B?eDEvNWNJa2wwb2tFSlZ2NnZCRTBndC85aUorN05iV3Y1RVdlaGZ0NEd2dW40?=
 =?utf-8?B?RTcyYSt2MEMrNW44MmpldWJOS0pWTnFXa0M3dXZpc2JYZVFtUFdHYWp1SjhU?=
 =?utf-8?B?UG8rS3Q4TVQvYTk4NDNTbG5pQnZ2YktHWmFYcnA0WHpWV1AxdC9MT1ZoTWhG?=
 =?utf-8?B?a3BRZk9kQmdqaVZVT1Q2Ynl1RFpudk1yL21BdDg5endqdSthbHNGZ1hqcGxQ?=
 =?utf-8?B?Sm9Gdi93UHUrdW84R2x6QzdDWFd4VlhUVTlOZnJVMHptUklaa0l0YW1IL3E1?=
 =?utf-8?B?eXM0RmIrRTFqUWl1Tm44bkMwblV4ZXh5cHNSL0pwOUFFU01UMlVUd2R2QnJO?=
 =?utf-8?B?WExaMktXSysyMmY2VjIwY015azNjcmtnRHRvVEMwUGFpb1pRVlZLTitUeVBD?=
 =?utf-8?B?aXAvazBYb1pYQzNxcTFsWjAxRmpHTVVuNHVmNVZ0VjRFcnBocUR0OUgxdjNz?=
 =?utf-8?B?YTFTZXVPcEpkOHNIRHRqaDBmaHdNeGFQaTdKUm5YYmUzbFlTbmNyUWx2OGV4?=
 =?utf-8?B?dmJ4cGdzSXJHT3QzOVJ0c3hYL0RaZDNWM2tIWHlYZy9NcC9tTGNEQzFsM1RP?=
 =?utf-8?B?SHpxUjE5RFF0R1l4aHBqZHg4RUVPZHY4NXNHZ29OUUhIUVdabHRIRGRrU2Jv?=
 =?utf-8?B?NTFMa1JSQnVPR1lyTGRnTVAwbi9LNVpSa0hLUXlOZlc3WGdac0NDbW1nMkNH?=
 =?utf-8?B?MFBxSHR6cjFpMVZlRC9tdC9OWW9tZ2JiTmNZbS8zQUd4SDVDVnRQN3ZLMXRv?=
 =?utf-8?B?Sk5GbzNZZUFBcGZibEkvOThMUDVCMXc2NzNOUnFRTmZ2RFVERTYxQjI2UHRH?=
 =?utf-8?B?a1MzQVNNakJHc3hrYzZCUUNTOG5yZjQvSkpML0kyMlNwL29TQ1RpbUczdjUr?=
 =?utf-8?B?WmQwZm83eDJTRkJYQU1hV3BNMnlxTktVcVVYSWdOY2tFbFpUWmpjLzVxc0lV?=
 =?utf-8?B?b3VtMzJsdHhGdVg0SUlrZ1FVYjE3NG82QTJmK3M5Y2oyTzRGNDhKdmdia1lL?=
 =?utf-8?B?dC9Ocjg2aEV6S3FIZ0VJdlR0NVFZbUs0WEdnTlBsbU5xZk1DSVBlZlBrUEtj?=
 =?utf-8?B?U3krSUlEVU9OQjE5UVY5eFFmMVZIK3N1RW9GZXhXcm9PUnJDN085WTFwWmM4?=
 =?utf-8?B?Zk1CTmN1cGhCQ2FENmttSmpNSmp2aDFlQVBOSlZCREVBZTdTTUxVdlpQMm1h?=
 =?utf-8?B?ZkpFYSs4Z29nV3pZcWpENDZ2d1NGOUpuSVBwNjRPWHNNeCttZkZvRjc0bnE1?=
 =?utf-8?B?WVR0YmZ3eEFEdW1UZlFsZ0ZDQmlKNnVQd3NLY1ozVmRnakp5aWRvYVpTdFZh?=
 =?utf-8?B?UGgwdm1PK1VUT1JVc2I3QmJuTlJWTmdqdHZBbXllVU5LTHE5Y3V5OFFhbk1H?=
 =?utf-8?B?RSs0VlRwVGxGbzJiL25vVHVUUlBFMTZyNDR6UG9uL29QQVpYbGhqdVJTOXpP?=
 =?utf-8?B?d0FpVjFTdU96MXQ5RW9YMUZTTEpwRWNJOUtBNGhyRUduQlVBUmR1NnZHQVR3?=
 =?utf-8?B?M1lPTHBXTStpWlUrdkN1WkxhT2pVaVJFWExSb2VxSnBYREpBL2VTZ05FcFlW?=
 =?utf-8?B?aTNMVnViMy9SNlBEbXBGbDN6NU5TS3cwSzVKc1d6UHBJMHMvVERubjc1R2JL?=
 =?utf-8?B?VXl4Vi9adWh3dFkrZUw3NnMvMXFHVG9sRjdyUUhnVnR4ZzBOblZwMm9LMHBC?=
 =?utf-8?B?NUVPcVJ3alc4R3Z0VmI5YUFzZkU5aEY5TzdJMm9sS3FTUklUVkpoR1Zqa3Rh?=
 =?utf-8?B?UmZnblIvcTBKdVpoNG53V3JVaU9BUGdFSjZuNklKUGpIdGRkYzdSMlVJTkFz?=
 =?utf-8?B?ZTR6RjNZaUtwMXJndWMwNzdkdXhrOVl3ZFBZUjl0aEZrelRVTDBKdVNJSlBW?=
 =?utf-8?Q?ry1IJRU73ezQUm2L9VK2jccyT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BEF0A74A7F6A84E9065D50577BCA5ED@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6391.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8727c6d7-b954-47f1-7050-08dbba0ff92a
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2023 19:29:57.0218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+pXFBbIoRE2PtoW/IP5btYrh0svNmEReiHWKGOmPh2j37+RXdaFIpqBlY9MVwyLRSgiz2E6vQQKWc/8QLz+Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9446
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
Cc: "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "ruanjinjie@huawei.com" <ruanjinjie@huawei.com>,
 "keescook@chromium.org" <keescook@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTA5LTE5IGF0IDE3OjU2IC0wNDAwLCBMeXVkZSBQYXVsIHdyb3RlOg0KPiAr
c3RhdGljIGludA0KPiArZ3QyMTVfc29yX2JsX3NldChzdHJ1Y3QgbnZrbV9pb3IgKmlvciwgaW50
IGx2bCkNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IG52a21fZGV2aWNlICpkZXZpY2Ug
PSBpb3ItPmRpc3AtPmVuZ2luZS5zdWJkZXYuZGV2aWNlOw0KPiArwqDCoMKgwqDCoMKgwqBjb25z
dCB1MzIgc29mZiA9IG52NTBfaW9yX2Jhc2UoaW9yKTsNCj4gK8KgwqDCoMKgwqDCoMKgdTMyIGRp
diwgdmFsOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoGRpdiA9IG52a21fcmQzMihkZXZpY2UsIDB4
NjFjMDgwICsgc29mZik7DQo+ICvCoMKgwqDCoMKgwqDCoHZhbCA9IChsdmwgKiBkaXYpIC8gMTAw
Ow0KDQpJbnRlZ2VyIHByb21vdGlvbiBydWxlcyBhbHdheXMgdGhyb3cgbWUgZm9yIGEgbG9vcCwg
YnV0IHNpbmNlICdsdmwnIGlzIGENCnNpZ25lZCBpbnRlZ2VyLCBhbmQgZGl2IGlzIGEgdTMyLCBh
cmUgd2Ugc3VyZSB0aGlzIHdvbid0IG92ZXJmbG93PyAgTWF5YmUNCmx2bCBzaG91bGQgYmUgdW5z
aWduZWQgYW5kIHZhbCBzaG91bGQgYmUgYSB1NjQ/DQoNCg0KPiArwqDCoMKgwqDCoMKgwqBpZiAo
ZGl2KQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbnZrbV93cjMyKGRldmljZSwg
MHg2MWMwODQgKyBzb2ZmLCAweGMwMDAwMDAwIHwgdmFsKTsNCg0KQWxzbywgbWF5YmUgY2FsY3Vs
YXRlICd2YWwnIGluIHRoaXMgaWYtYmxvY2s/DQoNCg==
