Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7AC4E7A6F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 20:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE2D10E46D;
	Fri, 25 Mar 2022 19:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2052.outbound.protection.outlook.com [40.107.96.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952C810E46D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 19:28:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KsHHtk1fXPs+IjDB5srs/AH4sbyW+6JVSz/QIlHkU0gBOs3kExTvVqbIn7y753E3wkskPyMLYofCx26o1eeTXI9BBlYjtjbkkbU0ZpWAa/keIuPIAgdljgIolWXISiQxchea/fdPoktvFCrZwZtYAq3yn7YNsnlGatI67uHtMWwbbepQW18/dm9D1JlsFY3HrJHSntnDgcRV5RemWhQf0LIGa8Olm5ct+ZxtmtWC6FxUor5T93XmnAxQ/j3j05A2i7cmqB8tpwaWHu0uxlPW9KftBMPCqAtwotnc1e7zQNKXktsQI2KgBigBj2QHy4SD5fLzOp9ZJ3nwtiSnwFNc0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ir0BK8hPWYGYvhQ+PVmCrmF9FECDU6f1F8HK/MI38A=;
 b=YYccTHR+LjMAGbwvDaMue0TdRVn07DIviTHURyXcjeKwoj2Rqdn4AcNA3xYQq/O/AqpnF7z7xz99pOnqgu8HzUZb73jIFh+OppphUNcp0KdxmipRy8zPN1yYko4K280f7cLlntgx4TM0X0LnUi6S5Bppblwv/FWXwDrwWOrwebup/iOci+rOLyyKwn+n/NdcNipfOihws8bJhNwZGW6ckBm34HKhT/63YeGZ9Z46rpAPyj+OEbWMTteCShQ6UeFPxi9bETx0dqAgaaAV8bbXi46ikmJ9BeK2Tx+e/kM7lFnc7F2sVJoEaTfK6KqxshV1jP3w2Q2a1CYn3Jvyf7aJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ir0BK8hPWYGYvhQ+PVmCrmF9FECDU6f1F8HK/MI38A=;
 b=Cq7QOXjX+FPSSDOQ/R8gSVs+GQ/uennJ+MtdriNG00gLDVqLgdQ4hMeokpr3t6FlVIeEYv2NdBzqp3wO4sexmLmcQ0R2u/t7BqkdKJ4MGnFlL9BYlJ7fz6qGXzboqonSHKMYJrMGH2izZbrufBfU314GTdth6i/sIvVLjonSsHQ=
Received: from BN8PR05MB6611.namprd05.prod.outlook.com (2603:10b6:408:57::15)
 by SN6PR05MB5213.namprd05.prod.outlook.com (2603:10b6:805:df::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.10; Fri, 25 Mar
 2022 19:28:12 +0000
Received: from BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::75e6:5363:7553:cf40]) by BN8PR05MB6611.namprd05.prod.outlook.com
 ([fe80::75e6:5363:7553:cf40%7]) with mapi id 15.20.5123.008; Fri, 25 Mar 2022
 19:28:12 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "psi@informatik.uni-kiel.de" <psi@informatik.uni-kiel.de>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Subject: Re: [PATCH] drm/vmwgfx: Propagate error on failed ioctl
Thread-Topic: [PATCH] drm/vmwgfx: Propagate error on failed ioctl
Thread-Index: AQHYNpBVOOJdX2k9dESiZmJW4EKsLqzQj8yA
Date: Fri, 25 Mar 2022 19:28:12 +0000
Message-ID: <b9922ee93a6561212c956ea4acb391183f71b75b.camel@vmware.com>
References: <20220313050655.52199-1-psi@informatik.uni-kiel.de>
In-Reply-To: <20220313050655.52199-1-psi@informatik.uni-kiel.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a69c83ce-7a3d-4404-8512-08da0e959a32
x-ms-traffictypediagnostic: SN6PR05MB5213:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <SN6PR05MB52133F09B12F4E24B888A2B7CE1A9@SN6PR05MB5213.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ayt3hvqnZHBSV5e9A6zJ6LpDc97FygO72RXArrmRrwYXX8zDpWnIx/M5SL5Z81grKP1S4tzKV+oWh+ofSWUmk6JL7uw3x+kde2bPcmsUBTb0XaFnuv+WAQaHPKIhbKwPg9HgKFYr6DtJhPkbpe5eph6ZonLWjLMiIUPQrA0CzNZkRQvOj98+YUAZiOZzDWkvPviLUqGm4wISNQjFpRLbMQbWNkppo08pI+kxSti4gXHuuUn5pPrCIr2znY5YGjuFffeFVFns4O35/NiHl9+usvv8I5eBJdDdyZup+wFcZCcke/ugiwzAqgvAZObX8IonKAPTE/P6t2uZv7cCh2IaA1l00uTqwAQCWhtSYY+5Oab6yfZiS5rYe+6oNCpm4W2Mi/SdHIu1dNbgaenQeqWu6r8Y3zFl/8xbCu2mqZBWlLdGG2MgPAhDnXnNCiIIBj1yDwmf3CQB74pILRybMz9hmOXXjDb8EReICl627t8nZVhtgQaMlIPo8ykI6T52q1R+4n5CPWCLst5hUvCCc+/qC/qXMRn2yAtaR6KsdovI1rGj8YRKWgGdtVig/disvqAl0JAcKsvw8mmAdtRAbuUft4xrMcWEa7Oa6LzfYiDr5fe2E16gonUm2gDjV7w+qBSKt5i22iCHyRLsxqMO9ciDmLGXEtxDUs+MHwsSAhd2eppHF2hqimBELY1YX954S3Y8voI2X0+8s8UE5cRCPOGWLg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR05MB6611.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(2616005)(6506007)(8936002)(5660300002)(38070700005)(86362001)(2906002)(6486002)(508600001)(6512007)(316002)(122000001)(91956017)(26005)(66476007)(76116006)(8676002)(66946007)(36756003)(66446008)(66556008)(64756008)(6636002)(110136005)(186003)(83380400001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QytRYzFtWXl3WmcvMlYxNCtzRXhsNUFveS92Q09Tckx3dU10dXVHRkVUS2tC?=
 =?utf-8?B?UlpsMmhxUU5kcHE1Sm9kTzdtQjBvU2RoVXFoc0Nibm9vNzdmTGRMTHhrTmRa?=
 =?utf-8?B?K1B3cWNtcWNTVm5CaDJqSndKc3RFOEU4d3FWNUN4Vmd1RDVxKzQ1MlMrNXlV?=
 =?utf-8?B?RTBON0JjU25Jb1JiSzhYTjFYbVBmcFlFdXdQTnczMld0NmhXWTE5aUZ5YS8v?=
 =?utf-8?B?Y2VtcEpSdllpNDBGN3JyVXhNN2lrb1doOFVLYzlXajdMLzZkeWFiTml2L01x?=
 =?utf-8?B?SWJUaWdpU200b25QNVZOcldYR1lJS2RZcXVBdHhRS01XNTVYZ3VZYmhTSjZT?=
 =?utf-8?B?TVBNWU1jTmNWZlIrejFrQjFwQW1mY1Y1Y01PYmFLaENFSncrSjZFd2U1ZmND?=
 =?utf-8?B?Wm9sQ1hOcmNFZnUwNXZvVGlKWHlvV2VROGZLNUcxQm5vT2pMakh0Q0ZvVzdH?=
 =?utf-8?B?Q2JUNWI5THZBblMvNGJPNC9aQWhxZ3RhbWV5N1VwanNqaGNvSHYwOU05K29l?=
 =?utf-8?B?WlZzWVRwdE43U2VKYjd6QlVyb3lxejN6NzJ4UTNVbGwycFp1enNlQ1lONTZj?=
 =?utf-8?B?R3V2QnVVSDYvSVpObngzeFNJVzJTekxMSEJkOFhibC90L1pwUlFKYmV1Sm5u?=
 =?utf-8?B?U2J2R21ROFlNeUJ2RGwvVC9PVTRPbmFSMjdLS0x3eXZyOVRFRzZYbXFFTFlI?=
 =?utf-8?B?bVlWdVBra2cxRkZ6Zk9MdG8yVm1ucWZNZWdVaVZVR2pmeDdsTzl5THF2RUlB?=
 =?utf-8?B?aFVmWEtHKzdhUHJNU3RiMnR4TkNrQmpBcDUzSEhEQ00rNFl6ZTQ5S1dXMURU?=
 =?utf-8?B?VHNDdU9abERzOVlKaE5kKy9XVGV0Um9QdkZqdE13Rkpib0NNQ01NZ2NSOVR3?=
 =?utf-8?B?dlZFbzM1S0tmODU3L0FWZFFCTklZNlc0YWFSM2lQc0VsaThMcyt1TWJnTmdS?=
 =?utf-8?B?MmlMQjQ5d2JkV3NFYXBCd3BNTlZHTnI2ZDdOR20ybUhPR2VtVmIrbWRDdUVG?=
 =?utf-8?B?azgrRDN0UkM5NTJadi9XUVF2QlZmSmg1aU9pSm0vWHNNRE9tVVNmWStrRXR1?=
 =?utf-8?B?YmdRb2pJNGhpSEY3Y1NpcVc3a05XZ2NRNlUrUE83TDcvYlBIVVY4alJtdGNR?=
 =?utf-8?B?cExFZVhmQUY0K0FIenZ1Uk1meUpER0ppV1FkRFpZb0RnODRNS1RLMW93VHBZ?=
 =?utf-8?B?N2F4UmgyV3l5L3RNTGVyazY2bVVsbGdtbS9ZbTdZZ202VDVpZkx2U0NnVS9M?=
 =?utf-8?B?dlVOaEpNYUM2TXNkUlM5QW5OTXNVUm90akxmM1EzOTJKaFY2NFhscm9GQkV1?=
 =?utf-8?B?ZmErWDFKSlZGUVo1dUZZVk96SjNsVzNtQnJKUEVZc2hQcG1GSjNYY3krc2tt?=
 =?utf-8?B?VnUzWFIvdXF3ZTJ4bE5idzJnRVFSQmV4blRrMEF3eFp5dkFyc2FOSHhtalVD?=
 =?utf-8?B?a1RVT3VrUHBoTjM2NjB3RUFHbFZVSFVDZW1LczRhenlMdWVXZDJ2R1ROZHJY?=
 =?utf-8?B?THFlR2Q0K3RjdzczQnNFZ1FxdlNlcVdqYy9taHIrWFluM3kweUdOaW40Q3lh?=
 =?utf-8?B?WVN4d0RmZ204MjM4b3JEL0xzNjZrdXBUTmhhZlNNUnIrbmhVb2s1RXJLdTZh?=
 =?utf-8?B?V1FmUGQ5MDVwSVF1c2RBYTZVM3NYZ25lRWNWZk5xejRSajhPRWFkUXkwVUty?=
 =?utf-8?B?aTQ5NnNTdjduME9CWVJ6dUdqanVJQVRuVHJRejd4VnhTQXIrVTk2N0xPaXZK?=
 =?utf-8?B?OUNGN2ovL1llNEd6Z2JzeFhVM1piVDJkd3VHQzJtT2pjRWFHeUZ0S3ZYd0Fu?=
 =?utf-8?B?T1VkVkU5VndqR0RqNWt5aVg1TEM2NFBlQjdjU2dxMXRMS2o4Slp6R09WaXh2?=
 =?utf-8?B?QTNZRHhLQWFEUFRXU1VYMFhSY1VEVDJmU2NyYVl1WC9Ncm8rKzJvb09SeElp?=
 =?utf-8?B?RzR5ZWx4d1pPZy8xTnh2Q2xuRVB3eW41dnNiL28xVzI5bEwrQUdMcTVad01U?=
 =?utf-8?B?UEgzbDk4c1d2QWNITFk1bzVvOTZBY1BENWhJVXBtdmZuSmQ4aElYMEZrTjd1?=
 =?utf-8?B?RVd3VU1zeHlGUEZlTkVnT3QyWi9oNzdwUnJKS0pJdmtZdTd5YXNnTEV0WnBR?=
 =?utf-8?B?ek9hK3JYZG1kWnV3OHJqdWQ4UFRTR2Z6N3pzd2dpYzMzNHR0WUlFTTNHUkxP?=
 =?utf-8?B?Z085bWYxSE1CL1RuQytscXFZZDlrZGhILzVZZW92U3NwWStyano4bW5tL0FI?=
 =?utf-8?B?Snp5Z0phVzJLUmdWY09LVWtkN3FzRTZ2YTRwN1B5RlVjT2UzamcvWVpTNDVk?=
 =?utf-8?B?TlRFcTVzd2Z1NGloRzE1M3N4Y1NkdEQrVW9jclE2WFg0c2psYzZ3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F208F4851B99374A99C5701C40B724BF@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR05MB6611.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a69c83ce-7a3d-4404-8512-08da0e959a32
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2022 19:28:12.5795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LLyo0mTlYetYorPr5x3WyyipT5rKKRl4+mMG2zbQpX1ipBE4JOyH6p1lhdq5jy73iCWKH9i8SRrBcBHAaE1LvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB5213
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

T24gU3VuLCAyMDIyLTAzLTEzIGF0IDA2OjA2ICswMTAwLCBQaGlsaXBwIFNpZXdlY2sgd3JvdGU6
Cj4gVGhlIGNhc2VzIG9mIHZtd191c2VyX2JvX3N5bmNjcHVfZ3JhYiBmYWlsaW5nIHdpdGggLUVS
RVNUQVJUU1lTIG9yIC0KPiBFQlVTWQo+IGFyZSBoYW5kbGVkIGluIHZtd191c2VyX2JvX3N5bmNj
cHVfaW9jdGwgYnkgbm90IHByaW50aW5nIGFuIGVycm9yCj4gbWVzc2FnZS4KPiBIb3dldmVyLCB0
aGUgZXJyb3IgdmFsdWUgZ2V0cyBkaXNjYXJkZWQsIGluZGljYXRpbmcgc3VjY2Vzcy4gVGhpcwo+
IGxlYWRzCj4gdG8gcmVuZGVyaW5nIGdsaXRjaGVzIGFuZCBhIHJlcG9ydGVkIGRybSBlcnJvciBv
biB0aGUgbmV4dCBpb2N0bCBjYWxsCj4gdG8KPiByZWxlYXNlIHRoZSBoYW5kbGUuCj4gCj4gVGhp
cyBwYXRjaCBwcm9wYWdhdGVzIHRoZSBlcnJvciB2YWx1ZSBmcm9tIHZtd191c2VyX3N5bmNjcHVf
Z3JhYi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFNpZXdlY2sgPHBzaUBpbmZvcm1hdGlr
LnVuaS1raWVsLmRlPgoKSGksIFBoaWxpcHAuCgpUaGFua3MgZm9yIHRoZSBwYXRjaC4gU29tZSBx
dWVzdGlvbnMgYmVsb3cuCgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
Ym8uYyB8IDIgKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYwo+IGIvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfYm8uYwo+IGluZGV4IDMxYWVjYzQ2NjI0Yi4uODFmZTRkYzVl
NmFiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5jCj4gQEAgLTYyMSw2ICs2MjEs
OCBAQCBpbnQgdm13X3VzZXJfYm9fc3luY2NwdV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZQo+ICpk
ZXYsIHZvaWQgKmRhdGEsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICh1bnNpZ25lZCBpbnQpIGFyZy0+aGFuZGxlKTsK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
cmV0Owo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgfQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBpZiAodW5saWtlbHkocmV0ICE9IDApKQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwoKSSdkIGp1c3QgYnJlYWsgYXBhcnQgdGhlIGNv
bmRpdGlvbiBhYm92ZSByYXRoZXIgdGhhbiBoYXZlIHR3byBpZiByZXQgIT0KMC4gV2hhdCBhcHBz
IGRvIHlvdSBzZWUgZ2xpdGNoZXMgaW4gYXMgYSByZXN1bHQgb2YgdGhpcz8gQ2FuIHlvdQpyZXBy
b2R1Y2UgaXQ/Cgp6Cg==
