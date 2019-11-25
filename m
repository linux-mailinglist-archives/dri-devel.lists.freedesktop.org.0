Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4AB1099FE
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 09:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3127189B0D;
	Tue, 26 Nov 2019 08:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50088.outbound.protection.outlook.com [40.107.5.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6A76E144;
 Mon, 25 Nov 2019 13:24:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dbl47JhciBKyLcJh0aEZBv6QxRZhUxAh6CK1f7PLLF33tpsJngxmZg8BVJakSPtmHwcC84CcZ5HJc8Q3AcdGmGh5dS8wEQCJ3HRLsQqHNiFl5Faa9BNoNeWpywgWKUE/3jVwAwsqoqNBrV3iAz3yQh+Ylhfg2JHQ2EYZ20H3W5HqAC/VhLXZn4vwIkyX8czWkkGaLecYZmOgIVIiBYi0C8lt2kR9lzASQHoYT1/bmS1XpR3eGJhU/plIY4soseERw43rHutfNvlUgvTE/R14FHxKXsy56Qb+gXXHoEiXCEjIfhC9ImOnhcm7Rgrs2Dr4ZKrvlZ31ykMXLKLkYKCpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIEPpkEzmNU25FOxsiVWQMoeyUs86Tvbn11YzqN/x6Q=;
 b=KLKtOxzoWMA/M+wrnap5vG5RZHvGudJAu80bmG1Ez3myTFEfFZR6HCowKlkDOW4t0kU1lLWRmV9i8i2BNCIXNZiur2BKsiMTCv6SL0c3HIyPVQLiSq7SXI+mAWv2TNG2YBmAK2WFVvgIgPFRmXTzIh3BnEhzPDMSodZtCPMdSXfTf3wC36wsIvufvRtluykRYEjaEz0BcnNhYQVIf9egnYOT1To1YYjaoHdcNdeZbtLPqaj2SwWNJt8g78WqmpRAE9M20V6xIvFDqXciWgIpLiS4L/BcKes0Uhms7shtrZrYXETXLZXO6/CLcM9K9v4ub/tHVU8UhLbznpuTmwfTZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4894.eurprd05.prod.outlook.com (20.177.50.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Mon, 25 Nov 2019 13:24:19 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 13:24:18 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Topic: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Index: AQHVoXkU4+8qDaOXOUCsq1WAd1fqfqeX13IAgABW8ACAAUErAIABZViAgAEPawA=
Date: Mon, 25 Nov 2019 13:24:18 +0000
Message-ID: <20191125132414.GQ7481@mellanox.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
 <20191122233308.GA7481@mellanox.com>
 <20191123044417.GE14488@nvishwa1-DESK.sc.intel.com>
 <20191123235348.GD7481@mellanox.com>
 <20191124211247.GF14488@nvishwa1-DESK.sc.intel.com>
In-Reply-To: <20191124211247.GF14488@nvishwa1-DESK.sc.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN4PR12CA0002.namprd12.prod.outlook.com
 (2603:10b6:403:2::12) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 054550e6-a13f-4231-986f-08d771aac667
x-ms-traffictypediagnostic: VI1PR05MB4894:
x-microsoft-antispam-prvs: <VI1PR05MB48942FA8A53DC879DC587FADCF4A0@VI1PR05MB4894.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(189003)(199004)(446003)(11346002)(2616005)(36756003)(6246003)(6506007)(4326008)(386003)(14444005)(256004)(6486002)(54906003)(76176011)(6916009)(316002)(52116002)(66946007)(99286004)(71190400001)(6512007)(66446008)(64756008)(66556008)(25786009)(66476007)(305945005)(6116002)(478600001)(3846002)(229853002)(66066001)(5660300002)(71200400001)(86362001)(6436002)(14454004)(26005)(186003)(81156014)(81166006)(8676002)(102836004)(1076003)(7416002)(2906002)(33656002)(8936002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4894;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?us-ascii?Q?nEgMTDKFx2dmzAmm/SE7MAdVjaZeCdJc8lI6TK4Juf5B/2Xud4cRdK3W63Ws?=
 =?us-ascii?Q?8MuTx16s9GUiJuMT44+XOE1p/O/yCCdC6VuZKSZfUqN7S4QXn6OtotBbqJqs?=
 =?us-ascii?Q?aeG46ZaswOOvlyzqGOl8rML7+KfNtK+cVXIKbdO+GfOyc1xxpzVm73WfVYGF?=
 =?us-ascii?Q?XXHDBm6Hoh8RxJRwVFsDDV+b1sRJ8nTkjAUIKeNoKpRX04Fz6Ofn33Z+akO1?=
 =?us-ascii?Q?LVEKIrB3+A0c9l4hGkenrnAVfTlvRZpKshGtpXY8ypDYPotn8uV+uvH4fYbS?=
 =?us-ascii?Q?l/mq5BTxYRLYlWbL3H0tfziHEHjjRLeAcY17YuWR7fIA93JPDJFhSfxmordD?=
 =?us-ascii?Q?uz9YiARdu5RCGV0X3A0ZEv7lPR2ipVJ64BMovcxm0pSrpcY0LS59tTrwrDwi?=
 =?us-ascii?Q?o7FnALqd+IBN80g38U7afyY/yn6dYVPihXJlarcjkIOzodPSA8edvzT6t/Jp?=
 =?us-ascii?Q?jwSuyfDazLL3UH8O2JIX5NvkYvso0Nx/IDwmsPbNo/jChZ9kF064IIBljNNW?=
 =?us-ascii?Q?tiJZNwGVUJyMV46ThBAK6DM34pqrlvbkH/2FKcIr2l1k+m2OB4I47L18H5bp?=
 =?us-ascii?Q?oQCDS1DnMScnl19A3voKHM0jzf+OTy8+YpJOF+NtvIbbjQrv65EjdEQu6SfD?=
 =?us-ascii?Q?kzB+PubDa8n9K4Gz8uI35UiCTWsSQFPhXNTOthQ14ZOBK+xrw3zyey/n4QZY?=
 =?us-ascii?Q?VeZ+uwIvtVpJjJ4k4+B8KyZDHgb1TnmvK+h4j82z0dXj+N+ooRZkx4js4G5f?=
 =?us-ascii?Q?i3d3dRbuZ+I7WgjFlXEOweO5+hRmoSbruh5EUa5XBHNTvkd4ddtx1kyeGJQ1?=
 =?us-ascii?Q?yi1YB8bnWUBxTpyV20awTEx0odZXhlwE2wG6BPEYX5ksrknlvv5NtT8jJdyN?=
 =?us-ascii?Q?5MeLoRSTjY+Rmet+JN8TNVeb/vMM1OSF6/lwqKCpn6DWA9krL41bFk57PCCk?=
 =?us-ascii?Q?Ama4/R6saOclGEoRZ+zA6nyaclGTqKSFClJsbpdwOcN1Sy6U3/lqFU8KUTaN?=
 =?us-ascii?Q?l5bJcL6c0eoI5ouRO+gvpkjpjYlqows+Taenm3EgP5ZnE7cYYAVWN7rmUEeT?=
 =?us-ascii?Q?c0S3jAoKh1r2qH3nWC6x6Yb2VcTxjc6/Q/vxsIaV1LHYAOPx7QTFqp6hsGjM?=
 =?us-ascii?Q?URMuqnaVEKGPvP+oV5Mxq7+06dhO499i/CWsjz9SVo4T3zz/Ep5nZkdiG0Gs?=
 =?us-ascii?Q?QM2i0ZtDitMq6KYEq6Xow1/M+PxLTg033DHGTo3yWG7WeU9BTn5QMZhBAov0?=
 =?us-ascii?Q?rr5hP9X/mIVrThWZBEd4SV5lH8yk4nZqJKK8oDLmWgXBJQIXJxHqFKIEYpv+?=
 =?us-ascii?Q?fMCEYchZfCKS004U+URF/iLVrTmoi9kMBt6abdeqQIg2v+mOpZ5H/qskkvEX?=
 =?us-ascii?Q?2QOnIxVfckJHXP5AOQJfY6T0c2LSK/KWrrAMu1sm0xmrCcGhsEi3vUOoXDYv?=
 =?us-ascii?Q?gkzbNrVaFgLl5gbXNXdUDnKuhNksu2cYPONYsEScu3UoBR9YYDLPoTYvh/sI?=
 =?us-ascii?Q?OSuP5EuUMfcqZiP0Pwd/o98HPsTWfJpwyLe7GWJSX2Aw5HMWvS20qLtqxxB2?=
 =?us-ascii?Q?TxF1jPXvohIBey6MXRCwRMO64qNa8iVSA6eF3Olvwc/MRQe05ZbnnXkZZTDW?=
 =?us-ascii?Q?Lj7XNtrX3GDk6v4rumeTRbbTCkG4wkyvc8k62hjU0up3a78NQlXT+0mu1KtW?=
 =?us-ascii?Q?8O3G65tBL/5VhtaE9CZkOmzR8d2YebhSVlxS0QJ59A5MQyImZvTUXQ1cSifE?=
 =?us-ascii?Q?TrdqeP47S7vYIJONMFgEHGyck3MhK0k=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <E36F40334E076B4C9C7BCEAF860218FC@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 054550e6-a13f-4231-986f-08d771aac667
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 13:24:18.8548 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ak5CE6su5mRUpunkKDl+Cwrui1ufkpkR4z19DA4tu/59G386kd2k2crf+Iq4st8va7VNOpZekgzifbc3VQNJqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4894
X-Mailman-Approved-At: Tue, 26 Nov 2019 08:14:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIEPpkEzmNU25FOxsiVWQMoeyUs86Tvbn11YzqN/x6Q=;
 b=gxj5r4fM7+JPEkwJVEbV3rPvS9641ZicP335Kb4ReBeuX/pjGd2n9Gg0+3gDmFYxOXGjxLuapu1PcNBKzHt4+6VOHkxQRgqKNHAc7D+U5JzwL10psMeIm8lYVWQkTONs8MxJ/HOnllWLyflw/lADK6AziDquPxFy3UzlzOJWRNw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMjQsIDIwMTkgYXQgMDE6MTI6NDdQTSAtMDgwMCwgTmlyYW5qYW4gVmlzaHdh
bmF0aGFwdXJhIHdyb3RlOgoKPiA+ID4gPiBVc2luZyBhIHRlbXBvcmFyeSByYW5nZSBpcyB0aGUg
cGF0dGVybiBmcm9tIG5vdXZlYXUsIGlzIGl0IHJlYWxseQo+ID4gPiA+IG5lY2Vzc2FyeSBpbiB0
aGlzIGRyaXZlcj8KPiA+ID4gCj4gPiA+IFlhaCwgbm90IHJlcXVpcmVkLiBJbiBteSBsb2NhbCBi
dWlsZCBJIHRyaWVkIHdpdGggcHJvcGVyIGRlZmF1bHRfZmxhZ3MKPiA+ID4gYW5kIHNldCBwZm5f
ZmxhZ3NfbWFzayB0byAwIGFuZCBpdCBpcyB3b3JraW5nIGZpbmUuCj4gPiAKPiA+IFNvcnJ5LCBJ
IG1lbnQgY2FsbGluZyBobW1fcmFuZ2VfcmVnaXN0ZXIgZHVyaW5nIGZhdWx0IHByb2Nlc3Npbmcu
Cj4gPiAKPiA+IElmIHlvdXIgZHJpdmVyIHdvcmtzIGFyb3VuZCB1c2VyIHNwYWNlIG9iamVjdHMg
dGhhdCBjb3ZlciBhIFZBIHRoZW4KPiA+IHRoZSByYW5nZSBzaG91bGQgYmUgY3JlYXRlZCB3aGVu
IHRoZSBvYmplY3QgaXMgY3JlYXRlZC4KPiA+IAo+IAo+IE9oIG9rLiBObywgdGhlcmUgaXMgbm8g
dXNlciBzcGFjZSBvYmplY3QgaGVyZS4KPiBCaW5kaW5nIHRoZSB1c2VyIHNwYWNlIG9iamVjdCB0
byBkZXZpY2UgcGFnZSB0YWJsZSBpcyBoYW5kbGVkIGluCj4gcGF0Y2ggMDMgb2YgdGhpcyBzZXJp
ZXMgKG5vIEhNTSB0aGVyZSkuCj4gVGhpcyBpcyBmb3IgYmluZGluZyBhIHN5c3RlbSBhbGxvY2F0
ZWQgKG1hbGxvYykgbWVtb3J5LiBVc2VyIGNhbGxzCj4gdGhlIGJpbmQgaW9jdGwgd2l0aCB0aGUg
VkEgcmFuZ2UuCj4gCj4gPiA+ID4gPiArCS8qCj4gPiA+ID4gPiArCSAqIE5vIG5lZWRkIHRvIGRt
YSBtYXAgdGhlIGhvc3QgcGFnZXMgYW5kIGxhdGVyIHVubWFwIGl0LCBhcwo+ID4gPiA+ID4gKwkg
KiBHUFUgaXMgbm90IGFsbG93ZWQgdG8gYWNjZXNzIGl0IHdpdGggU1ZNLiBIZW5jZSwgbm8gbmVl
ZAo+ID4gPiA+ID4gKwkgKiBvZiBhbnkgaW50ZXJtZWRpYXRlIGRhdGEgc3RydWN1dHJlIHRvIGhv
bGQgdGhlIG1hcHBpbmdzLgo+ID4gPiA+ID4gKwkgKi8KPiA+ID4gPiA+ICsJZm9yIChpID0gMDsg
aSA8IG5wYWdlczsgaSsrKSB7Cj4gPiA+ID4gPiArCQl1NjQgYWRkciA9IHJhbmdlLT5wZm5zW2ld
ICYgfigoMVVMIDw8IHJhbmdlLT5wZm5fc2hpZnQpIC0gMSk7Cj4gPiA+ID4gPiArCj4gPiA+ID4g
PiArCQlpZiAoc2cgJiYgKGFkZHIgPT0gKHNnX2RtYV9hZGRyZXNzKHNnKSArIHNnLT5sZW5ndGgp
KSkgewo+ID4gPiA+ID4gKwkJCXNnLT5sZW5ndGggKz0gUEFHRV9TSVpFOwo+ID4gPiA+ID4gKwkJ
CXNnX2RtYV9sZW4oc2cpICs9IFBBR0VfU0laRTsKPiA+ID4gPiA+ICsJCQljb250aW51ZTsKPiA+
ID4gPiA+ICsJCX0KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsJCWlmIChzZykKPiA+ID4gPiA+ICsJ
CQlzZ19wYWdlX3NpemVzIHw9IHNnLT5sZW5ndGg7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArCQlz
ZyA9ICBzZyA/IF9fc2dfbmV4dChzZykgOiBzdC0+c2dsOwo+ID4gPiA+ID4gKwkJc2dfZG1hX2Fk
ZHJlc3Moc2cpID0gYWRkcjsKPiA+ID4gPiA+ICsJCXNnX2RtYV9sZW4oc2cpID0gUEFHRV9TSVpF
Owo+ID4gPiA+ID4gKwkJc2ctPmxlbmd0aCA9IFBBR0VfU0laRTsKPiA+ID4gPiA+ICsJCXN0LT5u
ZW50cysrOwo+ID4gPiA+Cj4gPiA+ID4gSXQgaXMgb2RkIHRvIGJ1aWxkIHRoZSByYW5nZSBpbnRv
IGEgc2dsLgo+ID4gPiA+Cj4gPiA+ID4gSU1ITyBpdCBpcyBub3QgYSBnb29kIGlkZWEgdG8gdXNl
IHRoZSBzZ19kbWFfYWRkcmVzcyBsaWtlIHRoaXMsIHRoYXQKPiA+ID4gPiBzaG91bGQgb25seSBi
ZSBmaWxsZWQgaW4gYnkgYSBkbWEgbWFwLiBXaGVyZSBkb2VzIGl0IGVuZCB1cCBiZWluZwo+ID4g
PiA+IHVzZWQ/Cj4gPiA+IAo+ID4gPiBUaGUgc2dsIGlzIHVzZWQgdG8gcGx1ZyBpbnRvIHRoZSBw
YWdlIHRhYmxlIHVwZGF0ZSBmdW5jdGlvbiBpbiBpOTE1Lgo+ID4gPiAKPiA+ID4gRm9yIHRoZSBk
ZXZpY2UgbWVtb3J5IGluIGRpc2NyZXRlIGNhcmQsIHdlIGRvbid0IG5lZWQgZG1hIG1hcCB3aGlj
aAo+ID4gPiBpcyB0aGUgY2FzZSBoZXJlLgo+ID4gCj4gPiBIb3cgZGlkIHdlIGdldCB0byBkZXZp
Y2UgbWVtb3J5IG9uIGEgY2FyZD8gSXNuJ3QgcmFuZ2UtPnBmbnMgYSBDUFUgUEZOCj4gPiBhdCB0
aGlzIHBvaW50Pwo+ID4gCj4gPiBJJ20gY29uZnVzZWQuCj4gCj4gRGV2aWNlIG1lbW9yeSBwbHVn
aW4gaXMgZG9uZSB0aHJvdWdoIGRldm1fbWVtcmVtYXBfcGFnZXMoKSBpbiBwYXRjaCAwNyBvZgo+
IHRoaXMgc2VyaWVzLiBJbiB0aGF0IHBhdGNoLCB3ZSBjb252ZXJ0IHRoZSBDUFUgUEZOIHRvIGRl
dmljZSBQRk4gYmVmb3JlCj4gYnVpbGRpbmcgdGhlIHNnbCAodGhpcyBpcyBzaW1pbGFyIHRvIHRo
ZSBub3V2ZWF1IGRyaXZlcikuCgpCdXQgZWFybGllciBqdXN0IGNhbGxlZCBobW1fcmFuZ2VfZmF1
bHQoKSwgaXQgY2FuIHJldHVybiBhbGwga2luZHMgb2YKcGFnZXMuIElmIHRoZXNlIGFyZSBvbmx5
IGFsbG93ZWQgdG8gYmUgZGV2aWNlIHBhZ2VzIGhlcmUgdGhlbiB0aGF0Cm11c3QgYmUgY2hlY2tl
ZCAodW5kZXIgbG9jaykKCkFuZCBwdXR0aW5nIHRoZSBjcHUgUEZOIG9mIGEgWk9ORV9ERVZJQ0Ug
ZGV2aWNlIHBhZ2UgaW50bwpzZ19kbWFfYWRkcmVzcyBzdGlsbCBsb29rcyB2ZXJ5IHdyb25nIHRv
IG1lCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
