Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDAA50AA83
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 23:13:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6964E10E0F1;
	Thu, 21 Apr 2022 21:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3F510E0F1;
 Thu, 21 Apr 2022 21:13:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLMu7LTmdkLJjWrvyihTL2qaYZtSibOs/b0B00O+pdbPqH6JfPCNUdXFrWgd2ZbbIOz2s2liZcJmDYVj4tDZG9vZCDAj95EGpRjfjBIAjkOHUKS3IEXNyzjvVZvEFdi9gxVJUesap/VlZ1v/BxsMlU9RwhV5/JPK4LkWwLjOXYbxjwOS1/YA8E4YDh64XyOEMOfgkGE59WoVhjOOhN8jf3wlGxewv6VbvXGYeDBLsZTILXndLBTWOwoOrLrSCQimfGDFwDoGDavX21GHFEUCxDuGIw2Xj4l8uuIjjY9T5HSmwvIM5Nwj97QUdE1fpE/JD+WBzZAEcZl3IGmrwkTvIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kU8tVms34tQ7UadDJqgHH6GyH51maHdnd55WC9PIWbg=;
 b=fhoRsSGpur+RmZpsZZTzkY0eEo41CO2u8ypNM01GdQBDkJWmYwCB0CJVd2X0RtA1g7kSi+ftSyjBq+wGxm4ZwfBnmykFQgyk8wtQrTRdSmMBLBing850ARENDHbia4ENr4nAcF/RCG6liXMrMO4gAyUonW7ZZDT6pWdUg7vxkbsuJy7Voe3iaRoJD3eUwGe/JJsJNVOskxYj5b9LO/sWP1sWMifrkPNiN4jbQWfTSb5DHyV3AiR1qJfu8vqdKqOZGrRvw1teavKzX9R237lUWPDQamndbnRCorGGBFGzVzOU/fcM2l9m2DTpzgQnx9+uR1UZUsa2FdMu4GyB2TNdyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU8tVms34tQ7UadDJqgHH6GyH51maHdnd55WC9PIWbg=;
 b=bxb4Y1JcH3eJ6rge3a9Czf6EpDZjXY0geLZLWPX46Aw3mZK16lxRkiC3KLtsKE3OF/EMg+6t90rYUF5EhO07DkDQnlOpMJSMWsPClLTkprVt1k3lPlRXWDs7JX2/xbz+hGSwOwxe0YV74NYPjCkQ0gB7BJD+tQC2XbCmXrNlE5U=
Received: from BYAPR05MB6614.namprd05.prod.outlook.com (2603:10b6:a03:e9::22)
 by BYAPR05MB6439.namprd05.prod.outlook.com (2603:10b6:a03:f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.6; Thu, 21 Apr
 2022 21:13:33 +0000
Received: from BYAPR05MB6614.namprd05.prod.outlook.com
 ([fe80::4852:7aea:3e23:ee65]) by BYAPR05MB6614.namprd05.prod.outlook.com
 ([fe80::4852:7aea:3e23:ee65%6]) with mapi id 15.20.5206.006; Thu, 21 Apr 2022
 21:13:33 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Thread-Topic: [PATCH 03/15] dma-buf & drm/amdgpu: remove dma_resv workaround
Thread-Index: AQHYSl3exfVYH/xFlEu2kvqVBiXOdKz4QIGAgAA93oCAAKfqAIAAAGQAgAARGQCAAAJVgIAAAeMAgAAI/wCAAPhSAIAAt0QA
Date: Thu, 21 Apr 2022 21:13:33 +0000
Message-ID: <3da8b3f4240a2f8bbc442abf57982bb321aca789.camel@vmware.com>
References: <20220407085946.744568-1-christian.koenig@amd.com>
 <20220407085946.744568-4-christian.koenig@amd.com>
 <60ab53ce1ce1333f5e6a15fc83c3c05cd9bd1084.camel@vmware.com>
 <4c2e9414-3926-c9d7-8482-0d6d9191c2ac@amd.com>
 <fe8916b53b0f0101e6616d23eb6896399b092d58.camel@vmware.com>
 <54d00af9-9384-5794-490c-7d4cafe086b6@gmail.com>
 <e1c60e2a1478c406f515d51608a751fdc9feff3a.camel@vmware.com>
 <baa19a2d-6ad9-63ea-20f4-284a794f8998@amd.com>
 <ac12f900-fb47-37d6-9a1c-ac44bc711069@gmail.com>
 <5d699ffa903b5e54e8660367c3b46f07c86f4c55.camel@vmware.com>
 <6cd3571c-099b-df43-a7e0-243aba11726b@gmail.com>
In-Reply-To: <6cd3571c-099b-df43-a7e0-243aba11726b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ca9abb6-1bf0-4636-ec94-08da23dbcac2
x-ms-traffictypediagnostic: BYAPR05MB6439:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <BYAPR05MB6439A3379DBE08C9D68D3C76CEF49@BYAPR05MB6439.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M4lOaukuXCWz4QPs7nw3tcJmh0aMyfQNkck0pMPuUZC5G1hx2jRuOMmim7cuDcDVuuSqKgsmuKbUGHJ+56GFjgOQ04Ni3DMOyxa2HIYyTvwnEh4R5gO4sGtn8i802MfgVBsi6Z0rvME02GG1cNekePmPv6AJGAmgsQyZlI0l2F19BpGSBG32ddjaBpriLYQZSrqZ8mCT6gQkU2SGCgcS/gTI41HImS0+mccajaxciqqEGFVmhsLBNc4pYHahkjL3F4h6voOqF6c9rMuufKYFznvUw1JznP0qYGE+a1LD8xyJxk9u40NY8NCWfNcl4Gg2MvyltpdZ4+wvV6zY6SmRKYi89lFDcCU6Czi/DNIrXAYYzySnV//s7EV7d02l2O56QWZgfThHkO/09FHE7ZiQLPxUK+083AMW7/mW4m6PIXe4M2fZ0ohBOHDDQo5XBHIw7o1QgmwqyTbmXNnZUe1IKXzq0q8dQ9Ggk0rW/93P048o9dwUH8KLbw5ZFj8o+CNk2JDFOqr99utBCPRUUtt9AQUYeHqiNVUQzXq0xwEGbGjT3vtlxTxwLR5Z5W//CT5YrzptgDZ9ZX+5Q5Yj5zWtm/aXnmEo0/KuXEK9JQ1b98TrkVsyI6fwWcxEUYHTEoJp7NDhGZyg6U3jVAhk0VahcGcrgnLGHxd1hYDAavR3plhXRSqipZfYQ6wiV145UnFMCUgzamq+4OMTcZM5TtJkbRZGa/6ef6bWs11VBAksAk0sn7rcyP7jS0cOeGIwcHWc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR05MB6614.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66574015)(186003)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(76116006)(66946007)(2616005)(6512007)(26005)(36756003)(110136005)(83380400001)(6506007)(122000001)(38100700002)(38070700005)(86362001)(2906002)(8936002)(71200400001)(316002)(5660300002)(508600001)(6486002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OGpEb0RoVXdkTzk3WEhrai9LMXp5YUdDREZqMW96eWczTGtOQWhhOWNzays4?=
 =?utf-8?B?SG9wbERMZ2JwVHRRdDdvMHA4SGhpZVZucHlkRkpDS2dEZWU2bWFEOXpndGtM?=
 =?utf-8?B?eXByQmNNeUpZVzg1aGJCUHZIM3JzanliM2EyNlJlNFRCb013VW11aU96V3h4?=
 =?utf-8?B?b1NFdkd4WlBwdGEwRDBWZHBvZU0xejhISnEraGRkTGEzenNwYnhDUmYxZjhC?=
 =?utf-8?B?d0tNTVlOOWNkZ0c3QWd4T0hKa0pJQUZrNHJNYUdFSnNzN1ZkcnI4VUtNNmEx?=
 =?utf-8?B?T29Yb3dSM1F5cXhodUtQRXZqQVZCSlBnbmZGdnp1Vm5YYndUanpXTHRIRjk4?=
 =?utf-8?B?VmNMVU41Ty85WHo5bVFBRE5pRFJNYnRNdzdaS2k0elBVQVU3ZzhEQVdIV29K?=
 =?utf-8?B?NlFpR0RkQkptcVlTVkNSRDFVMGhmNk5wOUI2bk12REFJZW9zZ0p0eFoxZnRV?=
 =?utf-8?B?c05rV243Nm5HRUkzaEVMMHpFdExvekNFL2pIMTVXWThrL1NuaEVaMC9BMUY3?=
 =?utf-8?B?NTQrdXBNelhDZWdrTlZVcnB5VXgxcCs3SGI3REhkV2ZIZTJBWTcraUxmSnVZ?=
 =?utf-8?B?RkNIUXZQS2VaUzBXMmsyTTV0cEMzNE5EU2xWb3daSHd5UzR5bHFBSDU5MlNQ?=
 =?utf-8?B?eG9xU09sZm02cFdpaDhzMFE3TnRNckVrMnROUm1hODZUenRYdG8vYUozMGI0?=
 =?utf-8?B?QVUvOThSUldKeUZ4d01vMFk5MUNMbHo3YjREdURLT1ZLOTVxRWdQWm5FeEow?=
 =?utf-8?B?VnhDV2xTbUlJc2Z0RFNoRFBzV2FSLzdHZDNCQXhQT0t2MXIwVWZLd29UTDZR?=
 =?utf-8?B?ODlvbEl6V1ZPOE1ZMFdoYmhsaUFWcE1QZldYYmJ6ZjU0Q3Q5UnprdXpFcEFO?=
 =?utf-8?B?bmRqeFFaYXQ0cGNIOVJwQU1kMjNJSFg1R2FzSWF3RlBxOVFyZkUyaXFYVFE0?=
 =?utf-8?B?eHA1T2JnU2JwekUxdmcya0xhWWtXb2tBSkNXT1hvZzB1cVJsWEtNTWg4R05J?=
 =?utf-8?B?RW9xQVpnbVpWOGFwbzd1ZHpkL3dJTDZSK0MrOUVpYjdySjlKSGZCREhaVXZi?=
 =?utf-8?B?MGNNL1Z5TDRtcmRzazhhV2xDUkJoemI3N1M1aU8vSVp3eVNTRnU4Tmt6WE9F?=
 =?utf-8?B?bUd3Q05UZ25qYmFldUlFazVLSk9PaHBiaDcyWkh4OXR2Vmd1dXk3ejBGU1J3?=
 =?utf-8?B?Y1pPeUFBeUt5RkM0anhYNEN1T3dBa1J2cnI5Mk1WQm41Ky9sKzhJYUtBdFl3?=
 =?utf-8?B?Z3FKbGtKMmlvem93VFhuY0o5Q0dpYkNzeVJrbkVhNkhxSlM3bFYxa29GalNO?=
 =?utf-8?B?NWhyWkNYTE01SHJnczhPdWpTenRuYXYvNUs1ZlEycVo0NjBBNk5JZ3M0RkFJ?=
 =?utf-8?B?ckx5NFZReU5pQUVIdmFTdkE0eHo5MVFqTjhKYlZhZWs3cUUwUGxOU3IyMkZH?=
 =?utf-8?B?WVRwcnlGdlVVeEJFMXZmWkE3clRqQzVNRitaR3lPQ1NxWnVhazhJYm1RQ0xV?=
 =?utf-8?B?cVRCQWhFQjFnUlNoekNmdmhGRS9RcnYzSU1BeHJZSlJ3a2hla0JuNGpQZEJj?=
 =?utf-8?B?amZpd3Jld1RvU3k1MmN6L3NtVExBVGprQ0NqVFptWVQ4MC92V01DVCtzWVpl?=
 =?utf-8?B?clBFYU9MQXc5TnN3d2MyTU9BcGRuOTdEQ2ovNW9IYWF6SHlnS0FPSmVhK1Jv?=
 =?utf-8?B?VTBUcDNnd3hwcTVMUUdJaWFkZTFMSFE5OXpIU3dIamFaeEVqR08yVFlGTng2?=
 =?utf-8?B?SzNPU3Y3QWpSbVdFNFZHMFljWS9Pdm5jZzBET25mcE9TRTFBeVBSdkl0Ukc2?=
 =?utf-8?B?UE93OUsxVTRrTVdxdUJra3RPeit0LzdTMDdVdUx4Y3JvZ2o2SjArTVpPZ2Rh?=
 =?utf-8?B?MW5uRXlDR1NleS9IK25BV3RMWE5JM0grdnV0MU5FaHVxWkNkWUxvM0dSYUYw?=
 =?utf-8?B?a3pHYjRmMmR2M1hTR3lEeUN2bnNpNCttc3ppTTRNdUlDSTlmbFp4R2VYb1M0?=
 =?utf-8?B?OGJmNldEdCtqLzZ1cVVTRWNQTElmNWtMMmtmS0U3czN2M0piUGl5NGhjRWxB?=
 =?utf-8?B?eHIxVWZpUzZVeFlKUTlaQ096NjROSklyaHpOejdXS05ZK2V5dXhFdzczZ09y?=
 =?utf-8?B?dUdZM2VZQitQUGZ0ZGhJcWJWakttWk4xVnAzQVNodGFFWU92OFNDeGNoNDRE?=
 =?utf-8?B?K2hSY2w4eVlJUnlub3VYTmZLekVIQzZkdVg2dm85dVU4dUFoVlZPTVNiTEdM?=
 =?utf-8?B?eVkxYzAwdkFnbkMzWERYR0N3KzZ4c3hQOWdhaHhUZEY3b3VvVy9WVDg3UXBy?=
 =?utf-8?B?NTRrRE84VVpCSkg1VkpSbW9EK29JL2ZNOW8xdWV6b1I2UFZKS2VUUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C7975CB3C87C74BA9AE6267EE30824C@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR05MB6614.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca9abb6-1bf0-4636-ec94-08da23dbcac2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 21:13:33.2303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DIsAmQgBXYk5qxL/av1idQRQyszALgOuM0moPL903MVGSLBgY8mhpBk3FONp1b1wVSR6WgyGDjnjexgpHlKFtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR05MB6439
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIyLTA0LTIxIGF0IDEyOjE3ICswMjAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiDimqAgRXh0ZXJuYWwgRW1haWwNCj4gDQo+IEFtIDIwLjA0LjIyIHVtIDIxOjI4IHNjaHJp
ZWIgWmFjayBSdXNpbjoNCj4gPiBbU05JUF0NCj4gPiA+IFRvIGZpZ3VyZSBvdXQgd2hhdCBpdCBp
cyBjb3VsZCB5b3UgdHJ5IHRoZSBmb2xsb3dpbmcgY29kZQ0KPiA+ID4gZnJhZ21lbnQ6DQo+ID4g
PiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF92YWxp
ZGF0aW9uLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdmFsaWRhdGlv
bi5jDQo+ID4gPiBpbmRleCBmNDY4OTEwMTJiZTMuLmEzNmY4OWQzZjM2ZCAxMDA2NDQNCj4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3ZhbGlkYXRpb24uYw0KPiA+ID4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdmFsaWRhdGlvbi5jDQo+ID4gPiBA
QCAtMjg4LDcgKzI4OCw3IEBAIGludCB2bXdfdmFsaWRhdGlvbl9hZGRfYm8oc3RydWN0DQo+ID4g
PiB2bXdfdmFsaWRhdGlvbl9jb250ZXh0ICpjdHgsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHZhbF9idWYtPmJvID0gdHRtX2JvX2dldF91bmxlc3NfemVybygmdmJv
LQ0KPiA+ID4gPmJhc2UpOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoIXZhbF9idWYtPmJvKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FU1JDSDsNCj4gPiA+IC3CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHZhbF9idWYtPm51bV9zaGFyZWQgPSAwOw0KPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsX2J1Zi0+bnVtX3NoYXJlZCA9IDE2Ow0KPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0X2FkZF90YWlsKCZ2YWxfYnVmLT5o
ZWFkLCAmY3R4LT5ib19saXN0KTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYm9fbm9kZS0+YXNfbW9iID0gYXNfbW9iOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBib19ub2RlLT5jcHVfYmxpdCA9IGNwdV9ibGl0Ow0KPiA+IEZhaWxz
IHRoZSBzYW1lIEJVR19PTiB3aXRoIG51bV9mZW5jZXMgYW5kIG1heF9mZW5jZXMgPT0gMC4NCj4g
DQo+IFRoYW5rcyBmb3IgdGVzdGluZyB0aGlzLg0KPiANCj4gU28gdGhlIGJ1ZmZlciBvYmplY3Qg
aXMgbm90IHJlc2VydmVkIHRocm91Z2gNCj4gdm13X3ZhbGlkYXRpb25fYm9fcmVzZXJ2ZSgpLCBi
dXQgY29tZXMgZnJvbSBzb21ld2hlcmUgZWxzZS4NCj4gVW5mb3J0dW5hdGVseSBJIGFic29sdXRl
bHkgY2FuJ3QgZmluZCB3aGVyZSB0aGF0J3MgY29taW5nIGZyb20uDQo+IA0KPiBEbyB5b3UgaGF2
ZSBzb21lIGRvY3VtZW50YXRpb24gaG93dG8gc2V0dXAgdm13Z2Z4PyBFLmcuIHNhbXBsZSBWTQ0K
PiB3aGljaA0KPiBJIGNhbiBkb3dubG9hZCBzb21ld2hlcmUgZXRjLi4NCg0KSSBkb24ndCBoYXZl
IGFuIGV4dGVybmFsIG1hY2hpbmUgdG8gdXBsb2FkIGl0IHRvLiBHZXR0aW5nIGFuIGV4dGVybmFs
DQptYWNoaW5lIHRvIHJ1biBNZXNhIENJIG9uIGhhcyBiZWVuIG9uIG91ciB0b2RvIGZvciBhIHdo
aWxlLCBzbyBJJ2xsIHRyeQ0KdG8gc2V0dXAgc29tZXRoaW5nIG5leHQgd2Vlay4NCg0KVGhlIGlz
c3VlIGhlcmUgc2VlbXMgdG8gYmUgdGhhdCB2bXdnZnggYWx3YXlzIGhhZCBzb21lIGJ1ZmZlcnMg
dGhhdA0KZGlkbid0IGltbWVkaWF0ZWx5IGdvIHRocm91Z2ggdm13X3ZhbGlkYXRpb25fYm9fcmVz
ZXJ2ZS4gV2hhdCdzDQpoYXBwZW5pbmcgaXMgdGhhdCBpbiB2bXdnZnhfZXhlY2J1Zi5jIGluIHZt
d19leGVjYnVmX3Byb2Nlc3Mgd2UgY2FsbA0Kdm13X3ZhbGlkYXRpb25fYm9fcmVzZXJ2ZSBhbmQg
YWZ0ZXIgaXQgd2UgY2FsbA0Kdm13X3ZhbGlkYXRpb25fcmVzX3ZhbGlkYXRlLiBJbnNpZGUgdm13
X3ZhbGlkYXRpb25fcmVzX3ZhbGlkYXRlIChpbg0Kdm13Z2Z4X3ZhbGlkYXRpb24uYykgd2UgY2Fs
bCB2bXdfcmVzb3VyY2VfdmFsaWRhdGUsIHdoaWNoIGNhbGxzDQp2bXdfcmVzb3VyY2VfZG9fdmFs
aWRhdGUgLiB2bXdfcmVzb3VyY2VfZG9fdmFsaWRhdGUgaGFzIHRoaXMgY29kZSAicmV0DQo9IGZ1
bmMtPmNyZWF0ZShyZXMpOyIgd2hpY2ggaXMgYW4gaXNzdWUgZm9yIHZtd2dmeF9jb3RhYmxlLmMg
LiBUaGUNCmZ1bmMtPmNyZWF0ZSBmb3IgY290YWJsZSdzIGlzIHZtd19jb3RhYmxlX2NyZWF0ZSB3
aGljaCBjYWxscw0Kdm13X2NvdGFibGVfcmVzaXplIHdoaWNoIGNyZWF0ZXMsIHJlc2VydmVzIGFu
ZCB2YWxpZGF0ZXMgYSBuZXcgYm8uDQoNCkluIHNob3J0IGEgbmV3IGJvIGlzIGNyZWF0ZWQgaW4g
dm13X2NvdGFibGVfcmVzaXplIGJldHdlZW4NCnR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMgYW5kIHR0
bV9ldV9mZW5jZV9idWZmZXJfb2JqZWN0cyBjYWxscy4NCg0Keg0K
