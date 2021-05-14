Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D213380416
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 09:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0416EE13;
	Fri, 14 May 2021 07:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C23256EE13;
 Fri, 14 May 2021 07:22:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZWEN2VMSfLNbk7mxi4NgRtUMjFRMamZr7drGqr3Lvpf/6EaSk535DZy7ThC14mZIjdOfAe1VO1iDSKnqtkMwh76q+E86dQLf80/ce7J2g+0SF92b8b7E23bXyIayuaWXWBTp/Hii8tLx0D5hAmPbP1KJDeZ0oBJb4yRLjEzvyJ5un/vv78pTyZGsj+2b6/fp3dCSjUXDmdkWCYicMZOWvmgKpeTNZ05tPGy4CihXwtIVDgfRk1Qp9wDUTM15uwiuu7vG5ngh+yBxjR7kUCBxouirlWYSrYlPcbE2uw33yyww/M2KV7W87CXZlc6T0MGL9pEG1uUCNgAQrt3phiP5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPGh/mmj9QARV6+O8145y5fpDhdgBKmYcybnNMkO8ec=;
 b=isEig1WhAg/gMK8UO+6qDwehnfbmcOFLa0+KIL8g1aTvQ0hihqHtC+WLOFCa+wzmdjIKygDArnTg46o++R37iCJCtg7dwn1iOi6vtJx6zIounv+SUe3cbzJubDo1vIBq7V5cuH1SZOTH4rhSUORTAYpxRrwjOjH04vI8pZB5y/YaAaScy+fWs79tuEXpfuOEfRenHDuQ55qluK4fm+pQM0vz8MAOzQFtgD70wc+WDm5sH3C9v4Rscgv1TGDD6x51j7cy1weZLY8IIwc7AQjb34WAeVJTJcscQvpyYhlfBY4TBtMadg0t0e0oBXtg/Yu4PzuH9tUkquTXmCXa3UXmDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPGh/mmj9QARV6+O8145y5fpDhdgBKmYcybnNMkO8ec=;
 b=zalASEiYAV6G3KIAP0pyNyoSOUBt2KxflKhNYZCwRa26P5skMy3eNrM5ERAEVsLLzAYjzm75FuLTu4p6M1lN0aScubUBJ+/WusXy+y/Mzmfz7Ta55dEOa3B7IqWx+sOa2FytoDGUjKTo8OZ4nd4wCQy9DnpSQOTDtMS5yz8mg5U=
Received: from BYAPR12MB2840.namprd12.prod.outlook.com (2603:10b6:a03:62::32)
 by BYAPR12MB2918.namprd12.prod.outlook.com (2603:10b6:a03:13c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Fri, 14 May
 2021 07:22:32 +0000
Received: from BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::7c65:7181:6d1d:8616]) by BYAPR12MB2840.namprd12.prod.outlook.com
 ([fe80::7c65:7181:6d1d:8616%7]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 07:22:32 +0000
From: "Nieto, David M" <David.Nieto@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH 0/7] Per client engine busyness
Thread-Topic: [PATCH 0/7] Per client engine busyness
Thread-Index: AQHXSIY0lKCbwi4zp0q1CiNO36lst6rikGdb
Date: Fri, 14 May 2021 07:22:31 +0000
Message-ID: <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
 <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
 <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>,
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
In-Reply-To: <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-05-14T07:22:31.267Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.53.104]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc1dcf19-9bf7-4c82-a4bf-08d916a909e8
x-ms-traffictypediagnostic: BYAPR12MB2918:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2918B9C23AD470858239ABFDF4509@BYAPR12MB2918.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:466;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: voDhTpFLZ2fOuok+LTPKvPtMXr6m2LD8oDTbJeQ5hjvxUdeegRUo3cs5zIrtbJct9AnHhOFB6xEHs0tuYFsdVJTtVaG3V8ROMOUSHBBITS5DfV8dp0XHrb46b4EQubbQdiZM8mjfXuY2sPGL2WIsPNX1usoADzvpEa/SmV9VeORsRiL0tQpdrelOK+Iq4uluwlClL/YMcSH1nwxlIwPP3JWPmaxm5s5FfW1bTmLKgn1PwJV4JkA0gMtDHShXGCyyyKB8ZQiCCSjjlBOfo67AdnR/50xdMC8nacQbUqBBXQbU1OC58L4VgX2QX84tR9rTyrlv02I2Hs6OX8zp3EsHMqEOwERda+QQr8PRsAvq4iS2RhSEHKn1D34aTNsmRUoFtIF/hUUhgVBzdAOC35O/3hTdusDtH9iCz9k4tkwh6Pxy5x7CRiqGhQ9DTuOwlwCOkUaprVQJS7qLs89igJcMrh5/nO0UOQjf8AhaUXp2mRUdXpsaYhl16FQiJ7f+oYub6XSQPInZsVyOyyNxPxN7Gkd2txB1fUfCaYAJ2xPwsMHBbyY64P+M0n6t4VrBlSf2EZD3GIdsZl7r7TNEX5OhOMJTDUv4d+DTFg8P8Kv4fYDwp6sHiwfyPeM6brbl91u91m7cK3dyXEJaHbujB0ML0Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2840.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(38100700002)(19627405001)(66556008)(83380400001)(64756008)(66946007)(166002)(66476007)(66446008)(71200400001)(7696005)(55016002)(86362001)(54906003)(76116006)(33656002)(9686003)(53546011)(6506007)(8676002)(45080400002)(4326008)(186003)(966005)(8936002)(478600001)(5660300002)(6636002)(2906002)(316002)(110136005)(26005)(52536014)(122000001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?big5?B?NjBkMXNZMkRkcW85VEx6WUx1R0Z6bGIyNGh3M1MwMUx6TzhFdFZqUHRhejlzUVNs?=
 =?big5?B?USs2WjJkckcxcnNITWNXN05DN2dNaWptTXpFNCtRZlUwNVg4RDBqZ0xtQkhhTXk2?=
 =?big5?B?MnpKaUFQYW9wWi9hcWhQNDBiTGZDeHd0b1VZMFViWlRETHY4OGVMOURzelNOMDRR?=
 =?big5?B?em1wYlcxOEcyTm0zUW01SXpsdUxCakdoRzZUdFI5MmFrRk02K3lJamV6dm4rNHFp?=
 =?big5?B?Z2ZVUmNyMWVBYTkvZjlyU3ZPV1JPM3IwODlIMGt6Ky9WdW9iYXgyTWJuRnBub3Iv?=
 =?big5?B?NW9HK2pIZk1mQloxSjBJMUIxVzludDdxcUVpc0ZhVHA4N0RyS2MvUm1razFvYzRB?=
 =?big5?B?MTJVWTBEWEhKd2VndkFKeGsyTFUrTmo4S3RLK3FpTWJvQlA4MnIwUGM0aWJXYklz?=
 =?big5?B?UFMyTWJnMm1tekF3ajNPblJteUZsVFJJWmFxcXlRMDE1Q3FCL2JMekVuRGJQTm9Z?=
 =?big5?B?S3JCenREM0lGOE9zOGkwcksvNEZPYUM5bld5MWxIWXNnYllueXJqWGQzOEV3OERr?=
 =?big5?B?QmY3VUxScmVTYm85UUV4QzJBMllnVHRLNzczbCtXa0Fnc205TmY3V3AwOWQ2Ully?=
 =?big5?B?eWd5RE55RXdHMjlmbVU1aEhyZGtLdTcyQ2JtVkcyU01kSWo0T1RSZWNFaW1BTCtJ?=
 =?big5?B?SmtoSlFlNkpHZDhQTDZBdkYxTEZGSk5EYyticXlxY21MMnN4aG00aFRmbUVPN1J6?=
 =?big5?B?UnVOTTRaTkxlMWxiclZPMUxtaXIweEFRVUI0WW1HTkl4MEpyY1l3d3B5NE4yYUxl?=
 =?big5?B?T3VJcmhMQnNxc3Y1LzVwMlhTQmhMbDhOc0YwRmQvYkhDcDhURlhLMy9YL0QzSCtu?=
 =?big5?B?K0k2NWJQQnZpZmNaOWdacE1CUG9qMzJ6blNmTVhsL3V1ZjcvVEZDQmVVZExFTzVK?=
 =?big5?B?KzJHbSs0M3hEWE5wL1NJZ1FIb3NIWHVuNzZQck5PL2dnYmdDY1V6TFFRWUVUdUdW?=
 =?big5?B?b01TaERPQWIyejFydkRyMnhJV0c5ZFhWOUdZZnFnYXl2NjRqcUtRQTFqTno3YVdF?=
 =?big5?B?dE9UYWpyeWYvVnI4c0xXU1JMUFpROGl4ZXFrS0JaS1VmN0crZ1hLVnBaRmlGeHFQ?=
 =?big5?B?aTNmWFAyYU1pMnZ3SnluU1lvVlNTdFYyaGx4UGJ1MSszZzd2bm1Hb3N2cDRrZ3Bi?=
 =?big5?B?SWFZQjEzNTZabXQ1T1FPd0VFOURNY0w4MHlzbVpjcUZNa3p3ODlLWG5IRjhFbkIx?=
 =?big5?B?SzVHR0dDQzhGbFVxWjlUVU81ejFGbDJ0VFB6a3RpRjJFUDlGNGoxckg4YU9SZUFW?=
 =?big5?B?V1FDVy8zVWJvU01hb0pJcFBhemxLMW1ZMUo5RFJIWWROZnFVV1NDWkt2cDgyMmxo?=
 =?big5?B?RzA4UVVDZ0xoWk1NNlNqaHNVamh6MWE0dHQ3T2ZsMDFrT1dheFpWcWlmV1lVN3RS?=
 =?big5?B?YXVBc3J6Zy85dmR5bjc1TmZFWmF3N1grZzliZDc5V2gzRVN4MVlMdlMreFNnR1RQ?=
 =?big5?B?Z0JXN3B0QmlZNWRHcTVwZDdKdDRBaFRLY3ZGaEZNaHVjZmphNFVqNVNReENoTkg1?=
 =?big5?B?WVJaYnhBM1VrRHdlTGZ6S0hJQmtEdS9HMmJwcCtSNGptVlBMai9VMHZ6QWoxTTVF?=
 =?big5?B?TDM4QkhVTGRVZFd6YkUrV25OdGZ3NjM3OEQzcTJxdkxad0c5K3gyOXNWQWdocVIw?=
 =?big5?Q?K1dA9BGiDvg9TjMBHz9Ie6hQBP+mmSOGNjfUxSHhmTU8oQoK?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB2840AA68BCAEBD9279C6184FF4509BYAPR12MB2840namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2840.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1dcf19-9bf7-4c82-a4bf-08d916a909e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2021 07:22:31.8712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ybtmnI/Q+xvvstW1RDYfWh0cREuqDkluFImhaLlDWECi01uDmnT/sUHdWEQ9GWjM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2918
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR12MB2840AA68BCAEBD9279C6184FF4509BYAPR12MB2840namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQ0KDQpX
ZSBoYWQgZW50ZXJ0YWluZWQgdGhlIGlkZWEgb2YgZXhwb3NpbmcgdGhlIHByb2Nlc3NlcyBhcyBz
eXNmcyBub2RlcyBhcyB5b3UgcHJvcG9zZWQsIGJ1dCB3ZSBoYWQgY29uY2VybnMgYWJvdXQgZXhw
b3NpbmcgcHJvY2VzcyBpbmZvIGluIHRoZXJlLCBlc3BlY2lhbGx5IHNpbmNlIC9wcm9jIGFscmVh
ZHkgZXhpc3RzIGZvciB0aGF0IHB1cnBvc2UuDQoNCkkgdGhpbmsgaWYgeW91IHdlcmUgdG8gZm9s
bG93IHRoYXQgYXBwcm9hY2gsIHdlIGNvdWxkIGhhdmUgdG9vbHMgbGlrZSB0b3AgdGhhdCBzdXBw
b3J0IGV4cG9zaW5nIEdQVSBlbmdpbmUgdXNhZ2UuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0KRnJvbTogQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+DQpTZW50
OiBUaHVyc2RheSwgTWF5IDEzLCAyMDIxIDEwOjU4IFBNDQpUbzogVHZydGtvIFVyc3VsaW4gPHR2
cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT47IE5pZXRvLCBEYXZpZCBNIDxEYXZpZC5OaWV0
b0BhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT4N
CkNjOiBJbnRlbCBHcmFwaGljcyBEZXZlbG9wbWVudCA8SW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz47IE1hbGluZyBsaXN0IC0gRFJJIGRldmVsb3BlcnMgPGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc+OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQpTdWJqZWN0
OiBSZTogW1BBVENIIDAvN10gUGVyIGNsaWVudCBlbmdpbmUgYnVzeW5lc3MNCg0KKyBEYXZpZCwg
Q2hyaXN0aWFuDQoNCk9uIFRodSwgTWF5IDEzLCAyMDIxIGF0IDEyOjQxIFBNIFR2cnRrbyBVcnN1
bGluDQo8dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4NCj4NCj4gSGks
DQo+DQo+IE9uIDEzLzA1LzIwMjEgMTY6NDgsIEFsZXggRGV1Y2hlciB3cm90ZToNCj4gPiBPbiBU
aHUsIE1heSAxMywgMjAyMSBhdCA3OjAwIEFNIFR2cnRrbyBVcnN1bGluDQo+ID4gPHR2cnRrby51
cnN1bGluQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+ID4+DQo+ID4+IEZyb206IFR2cnRrbyBV
cnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+DQo+ID4+DQo+ID4+IFJlc3VycmVjdCBv
ZiB0aGUgcHJldmlvc3VseSBtZXJnZWQgcGVyIGNsaWVudCBlbmdpbmUgYnVzeW5lc3MgcGF0Y2hl
cy4gSW4gYQ0KPiA+PiBudXRzaGVsbCBpdCBlbmFibGVzIGludGVsX2dwdV90b3AgdG8gYmUgbW9y
ZSB0b3AoMSkgbGlrZSB1c2VmdWwgYW5kIHNob3cgbm90DQo+ID4+IG9ubHkgcGh5c2ljYWwgR1BV
IGVuZ2luZSB1c2FnZSBidXQgcGVyIHByb2Nlc3MgdmlldyBhcyB3ZWxsLg0KPiA+Pg0KPiA+PiBF
eGFtcGxlIHNjcmVlbiBjYXB0dXJlOg0KPiA+PiB+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KPiA+
PiBpbnRlbC1ncHUtdG9wIC0gIDkwNi8gOTU1IE1IejsgICAgMCUgUkM2OyAgNS4zMCBXYXR0czsg
ICAgICA5MzMgaXJxcy9zDQo+ID4+DQo+ID4+ICAgICAgICBJTUMgcmVhZHM6ICAgICA0NDE0IE1p
Qi9zDQo+ID4+ICAgICAgIElNQyB3cml0ZXM6ICAgICAzODA1IE1pQi9zDQo+ID4+DQo+ID4+ICAg
ICAgICAgICAgRU5HSU5FICAgICAgQlVTWSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgTUlfU0VNQSBNSV9XQUlUDQo+ID4+ICAgICAgIFJlbmRlci8zRC8wICAgOTMuNDYlIHyi
aaJpommiaaJpommiaaJpommiaaJpommiaaJpommiaaJpommiaaJpommiaaJpommiaaJpommiaaJp
ommiaaJpom4gIHwgICAgICAwJSAgICAgIDAlDQo+ID4+ICAgICAgICAgQmxpdHRlci8wICAgIDAu
MDAlIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAwJSAgICAgIDAl
DQo+ID4+ICAgICAgICAgICBWaWRlby8wICAgIDAuMDAlIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAgICAwJSAgICAgIDAlDQo+ID4+ICAgIFZpZGVvRW5oYW5jZS8wICAg
IDAuMDAlIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAwJSAgICAg
IDAlDQo+ID4+DQo+ID4+ICAgIFBJRCAgICAgICAgICAgIE5BTUUgIFJlbmRlci8zRCAgICAgIEJs
aXR0ZXIgICAgICAgIFZpZGVvICAgICAgVmlkZW9FbmhhbmNlDQo+ID4+ICAgMjczMyAgICAgICBu
ZXZlcmJhbGwgfKJpommiaaJpommiaaJtICAgICB8fCAgICAgICAgICAgIHx8ICAgICAgICAgICAg
fHwgICAgICAgICAgICB8DQo+ID4+ICAgMjA0NyAgICAgICAgICAgIFhvcmcgfKJpommiaaJvICAg
ICAgICB8fCAgICAgICAgICAgIHx8ICAgICAgICAgICAgfHwgICAgICAgICAgICB8DQo+ID4+ICAg
MjczNyAgICAgICAgZ2x4Z2VhcnMgfKJpomwgICAgICAgICAgfHwgICAgICAgICAgICB8fCAgICAg
ICAgICAgIHx8ICAgICAgICAgICAgfA0KPiA+PiAgIDIxMjggICAgICAgICAgIHhmd200IHwgICAg
ICAgICAgICB8fCAgICAgICAgICAgIHx8ICAgICAgICAgICAgfHwgICAgICAgICAgICB8DQo+ID4+
ICAgMjA0NyAgICAgICAgICAgIFhvcmcgfCAgICAgICAgICAgIHx8ICAgICAgICAgICAgfHwgICAg
ICAgICAgICB8fCAgICAgICAgICAgIHwNCj4gPj4gfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4g
Pj4NCj4gPj4gSW50ZXJuYWxseSB3ZSB0cmFjayB0aW1lIHNwZW50IG9uIGVuZ2luZXMgZm9yIGVh
Y2ggc3RydWN0IGludGVsX2NvbnRleHQsIGJvdGgNCj4gPj4gZm9yIGN1cnJlbnQgYW5kIHBhc3Qg
Y29udGV4dHMgYmVsb25naW5nIHRvIGVhY2ggb3BlbiBEUk0gZmlsZS4NCj4gPj4NCj4gPj4gVGhp
cyBjYW4gc2VydmUgYXMgYSBidWlsZGluZyBibG9jayBmb3Igc2V2ZXJhbCBmZWF0dXJlcyBmcm9t
IHRoZSB3YW50ZWQgbGlzdDoNCj4gPj4gc21hcnRlciBzY2hlZHVsZXIgZGVjaXNpb25zLCBnZXRy
dXNhZ2UoMiktbGlrZSBwZXItR0VNLWNvbnRleHQgZnVuY3Rpb25hbGl0eQ0KPiA+PiB3YW50ZWQg
Ynkgc29tZSBjdXN0b21lcnMsIHNldHJsaW1pdCgyKSBsaWtlIGNvbnRyb2xzLCBjZ3JvdXBzIGNv
bnRyb2xsZXIsDQo+ID4+IGR5bmFtaWMgU1NFVSB0dW5pbmcsIC4uLg0KPiA+Pg0KPiA+PiBUbyBl
bmFibGUgdXNlcnNwYWNlIGFjY2VzcyB0byB0aGUgdHJhY2tlZCBkYXRhLCB3ZSBleHBvc2UgdGlt
ZSBzcGVudCBvbiBHUFUgcGVyDQo+ID4+IGNsaWVudCBhbmQgcGVyIGVuZ2luZSBjbGFzcyBpbiBz
eXNmcyB3aXRoIGEgaGllcmFyY2h5IGxpa2UgdGhlIGJlbG93Og0KPiA+Pg0KPiA+PiAgICAgICAg
ICAjIGNkIC9zeXMvY2xhc3MvZHJtL2NhcmQwL2NsaWVudHMvDQo+ID4+ICAgICAgICAgICMgdHJl
ZQ0KPiA+PiAgICAgICAgICAuDQo+ID4+ICAgICAgICAgIKJ1oneidyA3DQo+ID4+ICAgICAgICAg
IKJ4ICAgonWid6J3IGJ1c3kNCj4gPj4gICAgICAgICAgonggICCieCAgIKJ1oneidyAwDQo+ID4+
ICAgICAgICAgIKJ4ICAgonggICCidaJ3oncgMQ0KPiA+PiAgICAgICAgICCieCAgIKJ4ICAgonWi
d6J3IDINCj4gPj4gICAgICAgICAgonggICCieCAgIKJ8oneidyAzDQo+ID4+ICAgICAgICAgIKJ4
ICAgonWid6J3IG5hbWUNCj4gPj4gICAgICAgICAgonggICCifKJ3oncgcGlkDQo+ID4+ICAgICAg
ICAgIKJ1oneidyA4DQo+ID4+ICAgICAgICAgIKJ4ICAgonWid6J3IGJ1c3kNCj4gPj4gICAgICAg
ICAgonggICCieCAgIKJ1oneidyAwDQo+ID4+ICAgICAgICAgIKJ4ICAgonggICCidaJ3oncgMQ0K
PiA+PiAgICAgICAgICCieCAgIKJ4ICAgonWid6J3IDINCj4gPj4gICAgICAgICAgonggICCieCAg
IKJ8oneidyAzDQo+ID4+ICAgICAgICAgIKJ4ICAgonWid6J3IG5hbWUNCj4gPj4gICAgICAgICAg
onggICCifKJ3oncgcGlkDQo+ID4+ICAgICAgICAgIKJ8oneidyA5DQo+ID4+ICAgICAgICAgICAg
ICCidaJ3oncgYnVzeQ0KPiA+PiAgICAgICAgICAgICAgonggICCidaJ3oncgMA0KPiA+PiAgICAg
ICAgICAgICAgonggICCidaJ3oncgMQ0KPiA+PiAgICAgICAgICAgICAgonggICCidaJ3oncgMg0K
PiA+PiAgICAgICAgICAgICAgonggICCifKJ3oncgMw0KPiA+PiAgICAgICAgICAgICAgonWid6J3
IG5hbWUNCj4gPj4gICAgICAgICAgICAgIKJ8oneidyBwaWQNCj4gPj4NCj4gPj4gRmlsZXMgaW4g
J2J1c3knIGRpcmVjdG9yaWVzIGFyZSBudW1iZXJlZCB1c2luZyB0aGUgZW5naW5lIGNsYXNzIEFC
SSB2YWx1ZXMgYW5kDQo+ID4+IHRoZXkgY29udGFpbiBhY2N1bXVsYXRlZCBuYW5vc2Vjb25kcyBl
YWNoIGNsaWVudCBzcGVudCBvbiBlbmdpbmVzIG9mIGENCj4gPj4gcmVzcGVjdGl2ZSBjbGFzcy4N
Cj4gPg0KPiA+IFdlIGRpZCBzb21ldGhpbmcgc2ltaWxhciBpbiBhbWRncHUgdXNpbmcgdGhlIGdw
dSBzY2hlZHVsZXIuICBXZSB0aGVuDQo+ID4gZXhwb3NlIHRoZSBkYXRhIHZpYSBmZGluZm8uICBT
ZWUNCj4gPiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZjZ2l0LmZyZWVkZXNrdG9wLm9yZyUyRmRybSUyRmRybS1taXNjJTJG
Y29tbWl0JTJGJTNGaWQlM0QxNzc0YmFhNjRmOTM5NWZhODg0ZWE5ZWQ0OTRiY2IwNDNmM2I4M2Y1
JmFtcDtkYXRhPTA0JTdDMDElN0NEYXZpZC5OaWV0byU0MGFtZC5jb20lN0M1ZTNjMDU1NzhlZjE0
YmUzNjkyNTA4ZDkxNjlkNTViZiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdD
MCU3QzAlN0M2Mzc1NjU2ODcyNzMxNDQ2MTUlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4w
JTNEJTdDMTAwMCZhbXA7c2RhdGE9bXQxRUlMJTJGYzlwSENYUiUyRllTZCUyQlRyMWU2NFhIb2VZ
Y2RRMmNZdWZKJTJGY1lRJTNEJmFtcDtyZXNlcnZlZD0wDQo+ID4gaHR0cHM6Ly9uYW0xMS5zYWZl
bGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGY2dpdC5mcmVl
ZGVza3RvcC5vcmclMkZkcm0lMkZkcm0tbWlzYyUyRmNvbW1pdCUyRiUzRmlkJTNEODc0NDQyNTQx
MTMzZjc4Yzc4YjY4ODBiOGNjNDk1YmFiNWM2MTcwNCZhbXA7ZGF0YT0wNCU3QzAxJTdDRGF2aWQu
TmlldG8lNDBhbWQuY29tJTdDNWUzYzA1NTc4ZWYxNGJlMzY5MjUwOGQ5MTY5ZDU1YmYlN0MzZGQ4
OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NTY1Njg3MjczMTQ0NjE1
JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1
TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPSUyRjN6
TUd3MExQVEMxa0c0TmViVHdVUFR4N1FDdEV5dyUyQjRKVG9YREs1UVhJJTNEJmFtcDtyZXNlcnZl
ZD0wDQo+DQo+IEludGVyZXN0aW5nIQ0KPg0KPiBJcyB5b3VycyB3YWxsIHRpbWUgb3IgYWN0dWFs
IEdQVSB0aW1lIHRha2luZyBwcmVlbXB0aW9uIGFuZCBzdWNoIGludG8NCj4gYWNjb3VudD8gRG8g
eW91IGhhdmUgc29tZSB1c2Vyc3BhY2UgdG9vbHMgcGFyc2luZyB0aGlzIGRhdGEgYW5kIGhvdyB0
bw0KPiBkbyB5b3UgY2xpZW50IGRpc2NvdmVyeT8gUHJlc3VtYWJseSB0aGVyZSBoYXMgdG8gYmUg
YSBiZXR0ZXIgd2F5IHRoYXQNCj4gZ29pbmcgdGhyb3VnaCBhbGwgb3BlbiBmaWxlIGRlc2NyaXB0
b3JzPw0KDQpXYWxsIHRpbWUuICBJdCB1c2VzIHRoZSBmZW5jZXMgaW4gdGhlIHNjaGVkdWxlciB0
byBjYWxjdWxhdGUgZW5naW5lDQp0aW1lLiAgV2UgaGF2ZSBzb21lIHB5dGhvbiBzY3JpcHRzIHRv
IG1ha2UgaXQgbG9vayBwcmV0dHksIGJ1dCBtYWlubHkNCmp1c3QgcmVhZGluZyB0aGUgZmlsZXMg
ZGlyZWN0bHkuICBJZiB5b3Uga25vdyB0aGUgcHJvY2VzcywgeW91IGNhbg0KbG9vayBpdCB1cCBp
biBwcm9jZnMuDQoNCj4NCj4gT3VyIGltcGxlbWVudGF0aW9uIHdhcyBtZXJnZWQgaW4gSmFudWFy
eSBidXQgRGFuaWVsIHRvb2sgaXQgb3V0IHJlY2VudGx5DQo+IGJlY2F1c2UgaGUgd2FudGVkIHRv
IGhhdmUgZGlzY3Vzc2lvbiBhYm91dCBhIGNvbW1vbiB2ZW5kb3IgZnJhbWV3b3JrIGZvcg0KPiB0
aGlzIHdob2xlIHN0b3J5IG9uIGRyaS1kZXZlbC4gSSB0aGluay4gK0RhbmllbCB0byBjb21tZW50
Lg0KPg0KPiBJIGNvdWxkbid0IGZpbmQgdGhlIHBhdGNoIHlvdSBwYXN0ZWQgb24gdGhlIG1haWxp
bmcgbGlzdCB0byBzZWUgaWYgdGhlcmUNCj4gd2FzIGFueSBzdWNoIGRpc2N1c3Npb24gYXJvdW5k
IHlvdXIgdmVyc2lvbi4NCg0KSXQgd2FzIG9uIHRoZSBhbWQtZ2Z4IG1haWxpbmcgbGlzdC4NCg0K
QWxleA0KDQo+DQo+IFJlZ2FyZHMsDQo+DQo+IFR2cnRrbw0KPg0KPiA+DQo+ID4gQWxleA0KPiA+
DQo+ID4NCj4gPj4NCj4gPj4gVHZydGtvIFVyc3VsaW4gKDcpOg0KPiA+PiAgICBkcm0vaTkxNTog
RXhwb3NlIGxpc3Qgb2YgY2xpZW50cyBpbiBzeXNmcw0KPiA+PiAgICBkcm0vaTkxNTogVXBkYXRl
IGNsaWVudCBuYW1lIG9uIGNvbnRleHQgY3JlYXRlDQo+ID4+ICAgIGRybS9pOTE1OiBNYWtlIEdF
TSBjb250ZXh0cyB0cmFjayBEUk0gY2xpZW50cw0KPiA+PiAgICBkcm0vaTkxNTogVHJhY2sgcnVu
dGltZSBzcGVudCBpbiBjbG9zZWQgYW5kIHVucmVhY2hhYmxlIEdFTSBjb250ZXh0cw0KPiA+PiAg
ICBkcm0vaTkxNTogVHJhY2sgYWxsIHVzZXIgY29udGV4dHMgcGVyIGNsaWVudA0KPiA+PiAgICBk
cm0vaTkxNTogVHJhY2sgY29udGV4dCBjdXJyZW50IGFjdGl2ZSB0aW1lDQo+ID4+ICAgIGRybS9p
OTE1OiBFeHBvc2UgcGVyLWVuZ2luZSBjbGllbnQgYnVzeW5lc3MNCj4gPj4NCj4gPj4gICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDUgKy0NCj4gPj4g
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fY29udGV4dC5jICAgfCAgNjEgKyst
DQo+ID4+ICAgLi4uL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fY29udGV4dF90eXBlcy5oIHwg
IDE2ICstDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfY29udGV4dC5jICAg
ICAgIHwgIDI3ICstDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfY29udGV4
dC5oICAgICAgIHwgIDE1ICstDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxf
Y29udGV4dF90eXBlcy5oIHwgIDI0ICstDQo+ID4+ICAgLi4uL2RybS9pOTE1L2d0L2ludGVsX2V4
ZWNsaXN0c19zdWJtaXNzaW9uLmMgIHwgIDIzICstDQo+ID4+ICAgLi4uL2dwdS9kcm0vaTkxNS9n
dC9pbnRlbF9ndF9jbG9ja191dGlscy5jICAgIHwgICA0ICsNCj4gPj4gICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9ndC9pbnRlbF9scmMuYyAgICAgICAgICAgfCAgMjcgKy0NCj4gPj4gICBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9scmMuaCAgICAgICAgICAgfCAgMjQgKysNCj4gPj4gICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxmdGVzdF9scmMuYyAgICAgICAgfCAgMTAgKy0NCj4g
Pj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RybV9jbGllbnQuYyAgICAgICAgfCAzNjUg
KysrKysrKysrKysrKysrKysrDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcm1f
Y2xpZW50LmggICAgICAgIHwgMTIzICsrKysrKw0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2k5MTVfZHJ2LmMgICAgICAgICAgICAgICB8ICAgNiArDQo+ID4+ICAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kcnYuaCAgICAgICAgICAgICAgIHwgICA1ICsNCj4gPj4gICBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X2dlbS5jICAgICAgICAgICAgICAgfCAgMjEgKy0NCj4gPj4gICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dwdV9lcnJvci5jICAgICAgICAgfCAgMzEgKy0NCj4gPj4g
ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dwdV9lcnJvci5oICAgICAgICAgfCAgIDIgKy0N
Cj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3N5c2ZzLmMgICAgICAgICAgICAgfCAg
IDggKw0KPiA+PiAgIDE5IGZpbGVzIGNoYW5nZWQsIDcxNiBpbnNlcnRpb25zKCspLCA4MSBkZWxl
dGlvbnMoLSkNCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9kcm1fY2xpZW50LmMNCj4gPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9kcm1fY2xpZW50LmgNCj4gPj4NCj4gPj4gLS0NCj4gPj4gMi4zMC4yDQo+
ID4+DQo=

--_000_BYAPR12MB2840AA68BCAEBD9279C6184FF4509BYAPR12MB2840namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
We had entertained the idea of exposing the processes as sysfs nodes as you=
 proposed, but we had concerns about exposing process info in there, especi=
ally since /proc already exists for that purpose.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I think if you were to follow that approach, we could have tools like top t=
hat support exposing GPU engine usage.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Thursday, May 13, 2021 10:58 PM<br>
<b>To:</b> Tvrtko Ursulin &lt;tvrtko.ursulin@linux.intel.com&gt;; Nieto, Da=
vid M &lt;David.Nieto@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@a=
md.com&gt;<br>
<b>Cc:</b> Intel Graphics Development &lt;Intel-gfx@lists.freedesktop.org&g=
t;; Maling list - DRI developers &lt;dri-devel@lists.freedesktop.org&gt;; D=
aniel Vetter &lt;daniel@ffwll.ch&gt;<br>
<b>Subject:</b> Re: [PATCH 0/7] Per client engine busyness</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">+ David, Christian<br>
<br>
On Thu, May 13, 2021 at 12:41 PM Tvrtko Ursulin<br>
&lt;tvrtko.ursulin@linux.intel.com&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; On 13/05/2021 16:48, Alex Deucher wrote:<br>
&gt; &gt; On Thu, May 13, 2021 at 7:00 AM Tvrtko Ursulin<br>
&gt; &gt; &lt;tvrtko.ursulin@linux.intel.com&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; From: Tvrtko Ursulin &lt;tvrtko.ursulin@intel.com&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Resurrect of the previosuly merged per client engine busyness=
 patches. In a<br>
&gt; &gt;&gt; nutshell it enables intel_gpu_top to be more top(1) like usef=
ul and show not<br>
&gt; &gt;&gt; only physical GPU engine usage but per process view as well.<=
br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Example screen capture:<br>
&gt; &gt;&gt; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~<br>
&gt; &gt;&gt; intel-gpu-top -&nbsp; 906/ 955 MHz;&nbsp;&nbsp;&nbsp; 0% RC6;=
&nbsp; 5.30 Watts;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 933 irqs/s<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IMC reads:&nbsp;&nb=
sp;&nbsp;&nbsp; 4414 MiB/s<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IMC writes:&nbsp;&nbsp;&n=
bsp;&nbsp; 3805 MiB/s<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; ENGINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BUSY&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MI_SEMA MI_WAIT<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Render/3D/0&nbsp;&nbsp; 9=
3.46% |=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=
=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2i=A2n&nbsp; |&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; 0%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Blitter/0&nbs=
p;&nbsp;&nbsp; 0.00% |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; V=
ideo/0&nbsp;&nbsp;&nbsp; 0.00% |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; 0%<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; VideoEnhance/0&nbsp;&nbsp;&nbsp; 0.00% |&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; 0%&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0%<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; PID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; NAME&nbsp; Render/3D&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; Blitter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Video&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; VideoEnhance<br>
&gt; &gt;&gt;&nbsp;&nbsp; 2733&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; neverbal=
l |=A2i=A2i=A2i=A2i=A2i=A2i=A2m&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
&gt; &gt;&gt;&nbsp;&nbsp; 2047&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; Xorg |=A2i=A2i=A2i=A2o&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
&gt; &gt;&gt;&nbsp;&nbsp; 2737&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gl=
xgears |=A2i=A2l&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
&gt; &gt;&gt;&nbsp;&nbsp; 2128&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; xfwm4 |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<b=
r>
&gt; &gt;&gt;&nbsp;&nbsp; 2047&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; Xorg |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; ||&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |<br>
&gt; &gt;&gt; ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Internally we track time spent on engines for each struct int=
el_context, both<br>
&gt; &gt;&gt; for current and past contexts belonging to each open DRM file=
.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This can serve as a building block for several features from =
the wanted list:<br>
&gt; &gt;&gt; smarter scheduler decisions, getrusage(2)-like per-GEM-contex=
t functionality<br>
&gt; &gt;&gt; wanted by some customers, setrlimit(2) like controls, cgroups=
 controller,<br>
&gt; &gt;&gt; dynamic SSEU tuning, ...<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; To enable userspace access to the tracked data, we expose tim=
e spent on GPU per<br>
&gt; &gt;&gt; client and per engine class in sysfs with a hierarchy like th=
e below:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # cd /s=
ys/class/drm/card0/clients/<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # tree<=
br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2u=A2=
w=A2w 7<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2u=A2w=A2w busy<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2x&nbsp;&nbsp; =A2u=A2w=A2w 0<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2x&nbsp;&nbsp; =A2u=A2w=A2w 1<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2x&nbsp;&nbsp; =A2u=A2w=A2w 2<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2x&nbsp;&nbsp; =A2|=A2w=A2w 3<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2u=A2w=A2w name<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2|=A2w=A2w pid<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2u=A2=
w=A2w 8<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2u=A2w=A2w busy<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2x&nbsp;&nbsp; =A2u=A2w=A2w 0<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2x&nbsp;&nbsp; =A2u=A2w=A2w 1<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2x&nbsp;&nbsp; =A2u=A2w=A2w 2<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2x&nbsp;&nbsp; =A2|=A2w=A2w 3<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2u=A2w=A2w name<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2x&nb=
sp;&nbsp; =A2|=A2w=A2w pid<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =A2|=A2=
w=A2w 9<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =A2u=A2w=A2w busy<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =A2x&nbsp;&nbsp; =A2u=A2w=A2w 0<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =A2x&nbsp;&nbsp; =A2u=A2w=A2w 1<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =A2x&nbsp;&nbsp; =A2u=A2w=A2w 2<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =A2x&nbsp;&nbsp; =A2|=A2w=A2w 3<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =A2u=A2w=A2w name<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; =A2|=A2w=A2w pid<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Files in 'busy' directories are numbered using the engine cla=
ss ABI values and<br>
&gt; &gt;&gt; they contain accumulated nanoseconds each client spent on eng=
ines of a<br>
&gt; &gt;&gt; respective class.<br>
&gt; &gt;<br>
&gt; &gt; We did something similar in amdgpu using the gpu scheduler.&nbsp;=
 We then<br>
&gt; &gt; expose the data via fdinfo.&nbsp; See<br>
&gt; &gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D1774=
baa64f9395fa884ea9ed494bcb043f3b83f5&amp;amp;data=3D04%7C01%7CDavid.Nieto%4=
0amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e1=
83d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dmt1=
EIL%2Fc9pHCXR%2FYSd%2BTr1e64XHoeYcdQ2cYufJ%2FcYQ%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fcgit.fr=
eedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D1774baa64f9395fa884ea9ed4=
94bcb043f3b83f5&amp;amp;data=3D04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578e=
f14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6375656=
87273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dmt1EIL%2Fc9pHCXR%2FYSd%2=
BTr1e64XHoeYcdQ2cYufJ%2FcYQ%3D&amp;amp;reserved=3D0</a><br>
&gt; &gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D8744=
42541133f78c78b6880b8cc495bab5c61704&amp;amp;data=3D04%7C01%7CDavid.Nieto%4=
0amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e1=
83d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D%2F=
3zMGw0LPTC1kG4NebTwUPTx7QCtEyw%2B4JToXDK5QXI%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fcgit.fr=
eedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D874442541133f78c78b6880b8=
cc495bab5c61704&amp;amp;data=3D04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578e=
f14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6375656=
87273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D%2F3zMGw0LPTC1kG4NebTwUP=
Tx7QCtEyw%2B4JToXDK5QXI%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
&gt; Interesting!<br>
&gt;<br>
&gt; Is yours wall time or actual GPU time taking preemption and such into<=
br>
&gt; account? Do you have some userspace tools parsing this data and how to=
<br>
&gt; do you client discovery? Presumably there has to be a better way that<=
br>
&gt; going through all open file descriptors?<br>
<br>
Wall time.&nbsp; It uses the fences in the scheduler to calculate engine<br=
>
time.&nbsp; We have some python scripts to make it look pretty, but mainly<=
br>
just reading the files directly.&nbsp; If you know the process, you can<br>
look it up in procfs.<br>
<br>
&gt;<br>
&gt; Our implementation was merged in January but Daniel took it out recent=
ly<br>
&gt; because he wanted to have discussion about a common vendor framework f=
or<br>
&gt; this whole story on dri-devel. I think. +Daniel to comment.<br>
&gt;<br>
&gt; I couldn't find the patch you pasted on the mailing list to see if the=
re<br>
&gt; was any such discussion around your version.<br>
<br>
It was on the amd-gfx mailing list.<br>
<br>
Alex<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; Tvrtko<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Tvrtko Ursulin (7):<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Expose list of clients in sysfs<b=
r>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Update client name on context cre=
ate<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Make GEM contexts track DRM clien=
ts<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Track runtime spent in closed and=
 unreachable GEM contexts<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Track all user contexts per clien=
t<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Track context current active time=
<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp; drm/i915: Expose per-engine client busyness=
<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/Makefile&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 5 +-<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/gem/i915_gem_context.c&nbsp;=
&nbsp; |&nbsp; 61 ++-<br>
&gt; &gt;&gt;&nbsp;&nbsp; .../gpu/drm/i915/gem/i915_gem_context_types.h |&n=
bsp; 16 +-<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/gt/intel_context.c&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 27 +-<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/gt/intel_context.h&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 15 +-<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/gt/intel_context_types.h |&n=
bsp; 24 +-<br>
&gt; &gt;&gt;&nbsp;&nbsp; .../drm/i915/gt/intel_execlists_submission.c&nbsp=
; |&nbsp; 23 +-<br>
&gt; &gt;&gt;&nbsp;&nbsp; .../gpu/drm/i915/gt/intel_gt_clock_utils.c&nbsp;&=
nbsp;&nbsp; |&nbsp;&nbsp; 4 +<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/gt/intel_lrc.c&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 27 +-<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/gt/intel_lrc.h&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 24 ++<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/gt/selftest_lrc.c&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 10 +-<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/i915_drm_client.c&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 365 ++++++++++++++++++<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/i915_drm_client.h&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 123 ++++++<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/i915_drv.c&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 6 +<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/i915_drv.h&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 5 +<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/i915_gem.c&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; =
21 +-<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/i915_gpu_error.c&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 31 +-<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/i915_gpu_error.h&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
&gt; &gt;&gt;&nbsp;&nbsp; drivers/gpu/drm/i915/i915_sysfs.c&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 +<=
br>
&gt; &gt;&gt;&nbsp;&nbsp; 19 files changed, 716 insertions(+), 81 deletions=
(-)<br>
&gt; &gt;&gt;&nbsp;&nbsp; create mode 100644 drivers/gpu/drm/i915/i915_drm_=
client.c<br>
&gt; &gt;&gt;&nbsp;&nbsp; create mode 100644 drivers/gpu/drm/i915/i915_drm_=
client.h<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.30.2<br>
&gt; &gt;&gt;<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BYAPR12MB2840AA68BCAEBD9279C6184FF4509BYAPR12MB2840namp_--
