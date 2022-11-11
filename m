Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D05A625B22
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 14:25:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0221610E169;
	Fri, 11 Nov 2022 13:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM6PR05CU003-vft-obe.outbound.protection.outlook.com
 (mail-centralusazon11013012.outbound.protection.outlook.com [52.101.64.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBE110E169
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 13:25:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBBMu1xn6Ypfr1IjPVfhKowl/1FMrYUzcQdU4wUE86F6vdSPZdOx42IB03r+JTiqV4jEeih+aH6DbTiDNQ+vt5yS8KlOOgb23gyf+Izzjd/rx3PmXnVtA6NkjUAW79KmDq1K5bay0bjFeGtEnzkPnmPwSum0CAjMOEP7Kl5H6/Ag/uOJTMQ++hc/L49+N5l6s0CXx3ryHR2HnTQ01cRPbclTk51Xu24LyouOrRCIk4H43dVE5pwbjaZP7Nuo7FKk7h/F344e6GxcBdiNHMBoHriJI2OcBq9zRSLxtqltksXCXOn9KEmTa9GhLLDf1Wne+gg+bv7gyDu8DVPUw66snw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSnk8VZ41vfRxkLzxHaqKQeIID0XSHCd71O5Q/rXtEk=;
 b=R10g50t5S0nchM+OpuyuqY3gqE8pbesMyKadGu1Zj01Ew3I5x/+UuquhoKh+EemG8GBFMUa0t0FeU1oUmYADDZzfv0hijrGT8fmkQNIFv7jrEyx8e5/+1i2RQduhb2qyelGWrNWjmRwMUbY2VyEyUiaMdjmZU7RF+CY1kgBHgYPMuVq52VQETCpMTBd5oj9C5lLmnqhTi4GlZPZKFH7rmY+GFilvzsycu+frxTB98Bfm383qoyxDVRPKmDlGb3Q2t9iifyEjHXzuky22wi1HmK/uJsTWgunOHNPc0zHOnmCAcwGU9Q2ineVI67jXglM2dor0KuoBud6d3ZRyCMX7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSnk8VZ41vfRxkLzxHaqKQeIID0XSHCd71O5Q/rXtEk=;
 b=J/53Jbmyt5cM+eD/Ypvor0iR4I4xfUUD85q4sGy/XvFt4GBA0h815mBSKCTlWOWcc13CyF8plnGmyRfviw/KnlJYGxvl+nQRoa+FKY4SgRfaBQEoM+Iw4juK7QmtpCE0Y9pj+3R64H/pL1iiFmEQO3v4q3Ww2yjhE+wCExLfG0g=
Received: from CY4PR05MB3047.namprd05.prod.outlook.com (2603:10b6:903:f4::7)
 by MN2PR05MB6975.namprd05.prod.outlook.com (2603:10b6:208:18d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.10; Fri, 11 Nov
 2022 13:25:32 +0000
Received: from CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::c9d2:432f:f12f:7e0f]) by CY4PR05MB3047.namprd05.prod.outlook.com
 ([fe80::c9d2:432f:f12f:7e0f%11]) with mapi id 15.20.5813.012; Fri, 11 Nov
 2022 13:25:32 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>
Subject: Re: [RFC 02/13] drm: Track clients by tgid and not tid
Thread-Topic: [RFC 02/13] drm: Track clients by tgid and not tid
Thread-Index: AQHY9bqu2uhS/kFq+Eu9FESBDL4soa45tqyA
Date: Fri, 11 Nov 2022 13:25:32 +0000
Message-ID: <9056c6f6f2932aca624008b514aaa184b2396400.camel@vmware.com>
References: <20221111104435.3152347-1-tvrtko.ursulin@linux.intel.com>
 <20221111104435.3152347-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20221111104435.3152347-3-tvrtko.ursulin@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.0-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY4PR05MB3047:EE_|MN2PR05MB6975:EE_
x-ms-office365-filtering-correlation-id: a079cb63-f8e7-4b23-47cd-08dac3e83599
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ueDVeF81W8DeUVtklChCj2h7lBMzmRRoJN7DAPv7SqkAooFEsaG8uN2qUW+o2zJIM/u7haKTMSW6xc27roIW41G10m8vNmnF88X/mtVFXkG/ha/dv+xA5GDry3vxafvuvkn5I4fklL7CV7lCNOFAd6EhIRVbQtg9ymJCmzWKsBuUxi6whOk1vLjBT7PtKRvZmus09RjNdIbvNlIxkwS/g/GLk+i2FWByAExBzjouaOgaSfzMcIk8Yq/hbDdK2dyBnBq1/Q9CS1cSCK0DoBsDXNoZf2akA26xqvpqYdnT+2p2sjj/eqw4WE4fgQTd3MFHLLZuYt/5jvPaL5X0KoT3MkMo1CrAk0tBS2zFz5g9g5QXoAM36HQ0bRumB3EpJoWZRFa4WqKYWjjLQXr+a+ys807mm9oltZU9dT+jKYnVp0Tb8Qh7x7y+9LDRS27JPr/3AY3Hguu+GEbvOGVeZC3SryJ4YpV/tBmlmUKzD05AI0BmhnlGeIgoPpYg1wNiiMLQPzXkjJy3x6Di8/rqUuU+P+9ziohK3QnkYP7zwhwn1GlFtgOKcOQiURrEjJ58qFseiQ4ch1pSXCV6EB3gg6oo4fgd7DZrE48slOvx3Pds2nOj2WcXmyKoEH+M1qOxxMTY0kNSi5k7s3PTTPKnNaJTFszmBBGj65Bn8leLMxNhydzYU6VUeZwReFI4rsZIWyISxQPRo16yO5+L+N16LY5ZHGq0ujRWVpV9f6aBvghVDAKLcx5NnDjrWp5peeW4oOndkCVchJBN+RW0ZGjFjaaf1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR05MB3047.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199015)(2616005)(83380400001)(316002)(66574015)(186003)(66476007)(54906003)(86362001)(122000001)(38070700005)(110136005)(66946007)(38100700002)(36756003)(6486002)(107886003)(6512007)(26005)(41300700001)(478600001)(71200400001)(91956017)(66556008)(66446008)(4001150100001)(5660300002)(76116006)(8676002)(8936002)(4326008)(64756008)(6506007)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmVab0VjcTU2Nzg1blIyeEc3TVFlejlsaXRudHZubS84OHY4Q2tGbFozUDNV?=
 =?utf-8?B?MGRQZ1lUdHNCcEYwQ0dYRWRwbGo2WUd2aVNDcmJIQlEzb2lNdDNMVmh4WDdX?=
 =?utf-8?B?c0RObU9sSGpMczVPWVE3MEJUKy9xQ0I0SUlZKzlCRWpuaTN2dGtUT1VubUc3?=
 =?utf-8?B?ODFDdWZwZ0pOWVBBNklIZEVaV0FJcU1DejYwYkZiK3dpOWZqOG45aStkUkd6?=
 =?utf-8?B?NzRKd3VBdVVrekRUTWVXTkYwaVRQYjJVcjFnZXNlWTBiZnJyM1c1THBKMHVV?=
 =?utf-8?B?N2JQU3R5MHJ3N2hLdGFBM0pCNjdaaU1ST053aW9hK3ZrYjVMdVptQjVqRlhR?=
 =?utf-8?B?d1RvUUs3NU5CaFIxRno5bzRaWGxPcGl3STNUSzh1WHJSZ1l2V05yUGxuMjBD?=
 =?utf-8?B?a29FcjZ2ODlicnA4djRPbzljVlgrMHU0ZWtwUkZHWFI4ZUptMW55MFpzN0k0?=
 =?utf-8?B?QysrT3FHM3hNQXZOcFpEdGdPc1JtMjYydmVBaGxYNnM3MC92RlFlNnpsUytM?=
 =?utf-8?B?S3R0eHZNRVRScGlUOGlDVEVtTmJUYUE2RnVwRWhzSmFseE1VakpHelBkTFdT?=
 =?utf-8?B?cG4zanNGQUZyYnpINjVpdURKUXMzV1B5aWUzQ2FSNDRJS3M0UTY3aU5yTDI4?=
 =?utf-8?B?Z2JZc0Z2Vk1acHd5V3VkWUNtU0ZWd3R2My93VVZWMWxXeTdUUXNRaWtSM0h2?=
 =?utf-8?B?S3kydno0Ym9oOGYwZ043d2pHS051bWhaNloza2xDZ25KK2NVaTJiY25jUzRN?=
 =?utf-8?B?QnVEU3ZhUjNDaisxSWRFUHlrbDdaTTNEQ3F4enNTb1h0b2d6bjNHM1RtWERF?=
 =?utf-8?B?TFlsZWh3L3JVTGlSK3VSZ0pKeGQvQnMxT3Jiam81bmJUQkZCY25pRGFIOFVi?=
 =?utf-8?B?bEQ4dDFxcUMvVlI4c1lzUkI5VG1OeDByNE5lbXVMMktyalhhSzZGNVNtU1Q5?=
 =?utf-8?B?REpsTjc4RXcyVjdzYUJudS85M1VQNWU5S2JWMmZLeTZjb0VEZXRINEJjVTdJ?=
 =?utf-8?B?UWpXZXJxb0pGYjZObmdBalprcVprSk1tS0NkaURTeUYreTFCOGFFaDhqOWFS?=
 =?utf-8?B?Vk5ZeDJsZXZBNnJaUTB0eUZUTTk5N29aQmhTYmJEbUt5ZFJOOWMxb1RmaEhx?=
 =?utf-8?B?d09STDdYdHhxM2ptUkRTVXJjazJLb1dONDZvZXJ0aHJoTWVvRmJBTFA5OW9v?=
 =?utf-8?B?L3dXU0MvaERDcmFHc0haN0ZsanlMa1ZZdlJzOXR2K1E2UGt5dUJRemNtN213?=
 =?utf-8?B?aUtxd0dGSHBQemg4ZDhiYTVob0JaZGVjdnQxSlAybDc5ZGlzRnJkV0Rwa3Z5?=
 =?utf-8?B?TlJ6dTNXdkRlbzB6Y0lRay9lTmZiKy9aZ1hjdWlvY0lDOWlmUnQxWjFHQmtZ?=
 =?utf-8?B?YmhFZllqSzNJYWNrb0tpbnJaditja21oZ3JPWDVOK1l1QytLQVo5WHg5SzJ6?=
 =?utf-8?B?NE5mMjdrY2Rhc2dzZ2Q1WkdOL1Z4ZU5SdnlmNnh1R25oUDlqRGx5bVp5VkVM?=
 =?utf-8?B?M1Qvbi9Ca2xnY0U5Y1Fsd1liODZsYlVIVncwYTJRRmNFUTkyRDFocms0V1Yx?=
 =?utf-8?B?MHh5MXluR01JTFNGa1N2VC9mM0ltbXB1U3oweVpINm5CeFRKOU5JWGpRSnI5?=
 =?utf-8?B?amxIUjRla1FHRDlGbUlwSUwwR2x3Z1haNXFPQkl5dHVERFNOZ3hoUGRUQktZ?=
 =?utf-8?B?cEJYU0tDdks4MGw4czdTWmVGQnlLaUh2MFM5dkdtZG1ILzVoLzRWSmIwWDQz?=
 =?utf-8?B?cUovamgvTU9YSndZRmhENVFuRXlVTHdJL0ZaalZvd29LTVgwNE5vQy9VelZH?=
 =?utf-8?B?Z2kwVktvUExCR2lPeE5UWmRuc0V5RlZzTW5GSy9HWVl5UjliSnJWMGc1enVj?=
 =?utf-8?B?MWtkMHBPQVBpSnVqa1drdUN4OTZmcXg5K0lxbndxc0FNTFd5UlgrNFcwejRY?=
 =?utf-8?B?dXBmbEY2YlFMSnBhZUdVWmZTL3pCTmI5ZWF6OVNUclhmUU9ZbmxKVWJtWDRs?=
 =?utf-8?B?MmpmQVYxS2xGd3cyR2RyWERIMGloMzZhbVI2MlBNK3NaTFJHV0NaTDM1a09R?=
 =?utf-8?B?QkR3SFdiSDE3bmxLc2lWRDdFYWc5dTVWRFNSQkJhZE1KK3o2TkNXdytmT2Zu?=
 =?utf-8?Q?YAK+7PUGkgnlugpShQ+px4Q57?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <806FEEF82CAF1F4AA9833973054BA325@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR05MB3047.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a079cb63-f8e7-4b23-47cd-08dac3e83599
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 13:25:32.5100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Smxek1mt2RQ6y41H725iGSIiTzfEXh3l+bys4rFibzKq8Q+JV081I2rYS+ghEpzBakMRaTwJN3QFTA8g+6eZdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6975
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
Cc: "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "tvrtko.ursulin@intel.com" <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTExLTExIGF0IDEwOjQ0ICswMDAwLCBUdnJ0a28gVXJzdWxpbiB3cm90ZToK
PiBGcm9tOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFRo
cmVhZCBncm91cCBpZCAoYWthIHBpZCBmcm9tIHVzZXJzcGFjZSBwb2ludCBvZiB2aWV3KSBpcyBh
IG1vcmUKPiBpbnRlcmVzdGluZyB0aGluZyB0byBzaG93IGFzIGFuIG93bmVyIG9mIGEgRFJNIGZk
LCBzbyB0cmFjayBhbmQgc2hvdyB0aGF0Cj4gaW5zdGVhZCBvZiB0aGUgdGhyZWFkIGlkLgo+IAo+
IEluIHRoZSBuZXh0IHBhdGNoIHdlIHdpbGwgbWFrZSB0aGUgb3duZXIgdXBkYXRlZCBwb3N0IGZp
bGUgZGVzY3JpcHRvcgo+IGhhbmRvdmVyLCB3aGljaCB3aWxsIGFsc28gYmUgdGdpZCBiYXNlZCB0
byBhdm9pZCBwaW5nLXBvbmcgd2hlbiBtdWx0aXBsZQo+IHRocmVhZHMgYWNjZXNzIHRoZSBmZC4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwu
Y29tPgo+IENjOiBaYWNrIFJ1c2luIDx6YWNrckB2bXdhcmUuY29tPgo+IENjOiBsaW51eC1ncmFw
aGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20KPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgo+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZW0uYyB8IDIgKy0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCA0ICsrLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAyICstCj4gwqBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dm
eF9nZW0uY8KgwqDCoMKgIHwgMiArLQo+IMKgNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nZW0uYwo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jCj4gaW5kZXggOGVmMzFkNjg3ZWYzLi40Yjk0MGY4YmQ3MmIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCj4gQEAgLTk2Nyw3ICs5NjcsNyBAQCBzdGF0
aWMgaW50IGFtZGdwdV9kZWJ1Z2ZzX2dlbV9pbmZvX3Nob3coc3RydWN0IHNlcV9maWxlICptLAo+
IHZvaWQgKnVudXNlZCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFRoZXJl
Zm9yZSwgd2UgbmVlZCB0byBwcm90ZWN0IHRoaXMgLT5jb21tIGFjY2VzcyB1c2luZyBSQ1UuCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJjdV9yZWFkX2xvY2soKTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgdGFzayA9IHBpZF90YXNrKGZpbGUtPnBpZCwgUElEVFlQRV9QSUQpOwo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0YXNrID0gcGlkX3Rhc2soZmlsZS0+cGlkLCBQSURUWVBF
X1RHSUQpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2VxX3ByaW50ZihtLCAi
cGlkICU4ZCBjb21tYW5kICVzOlxuIiwgcGlkX25yKGZpbGUtPnBpZCksCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0YXNrID8gdGFzay0+Y29t
bSA6ICI8dW5rbm93bj4iKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJjdV9y
ZWFkX3VubG9jaygpOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jCj4gaW5kZXggZWU0NDVmNDYwNWJhLi40
MmY2NTc3NzIwMjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYwo+IEBAIC04MCw3ICs4MCw3IEBA
IHN0YXRpYyBpbnQgZHJtX2NsaWVudHNfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRh
dGEpCj4gwqDCoMKgwqDCoMKgwqDCoHNlcV9wcmludGYobSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgIiUyMHMgJTVzICUzcyBtYXN0ZXIgYSAlNXMgJTEwc1xuIiwKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImNvbW1hbmQiLAo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJwaWQiLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJ0Z2lkIiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgImRldiIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ1aWQi
LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAibWFnaWMiKTsKPiBAQCAt
OTQsNyArOTQsNyBAQCBzdGF0aWMgaW50IGRybV9jbGllbnRzX2luZm8oc3RydWN0IHNlcV9maWxl
ICptLCB2b2lkICpkYXRhKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYm9vbCBp
c19jdXJyZW50X21hc3RlciA9IGRybV9pc19jdXJyZW50X21hc3Rlcihwcml2KTsKPiDCoAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmN1X3JlYWRfbG9jaygpOyAvKiBsb2NrcyBw
aWRfdGFzaygpLT5jb21tICovCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHRhc2sg
PSBwaWRfdGFzayhwcml2LT5waWQsIFBJRFRZUEVfUElEKTsKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgdGFzayA9IHBpZF90YXNrKHByaXYtPnBpZCwgUElEVFlQRV9UR0lEKTsKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVpZCA9IHRhc2sgPyBfX3Rhc2tfY3JlZCh0
YXNrKS0+ZXVpZCA6IEdMT0JBTF9ST09UX1VJRDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHNlcV9wcmludGYobSwgIiUyMHMgJTVkICUzZMKgwqAgJWPCoMKgwqAgJWMgJTVkICUx
MHVcbiIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB0YXNrID8gdGFzay0+Y29tbSA6ICI8dW5rbm93bj4iLAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCj4gaW5k
ZXggYmE1MDQxMTM3YjI5Li41Y2RlNTAxNGNlYTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9maWxlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYwo+IEBAIC0x
NTYsNyArMTU2LDcgQEAgc3RydWN0IGRybV9maWxlICpkcm1fZmlsZV9hbGxvYyhzdHJ1Y3QgZHJt
X21pbm9yICptaW5vcikKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKCFmaWxlKQo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7Cj4gwqAKPiAtwqDC
oMKgwqDCoMKgwqBmaWxlLT5waWQgPSBnZXRfcGlkKHRhc2tfcGlkKGN1cnJlbnQpKTsKPiArwqDC
oMKgwqDCoMKgwqBmaWxlLT5waWQgPSBnZXRfcGlkKHRhc2tfdGdpZChjdXJyZW50KSk7Cj4gwqDC
oMKgwqDCoMKgwqDCoGZpbGUtPm1pbm9yID0gbWlub3I7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKg
LyogZm9yIGNvbXBhdGliaWxpdHkgcm9vdCBpcyBhbHdheXMgYXV0aGVudGljYXRlZCAqLwo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9nZW0uYwo+IGIvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZ2VtLmMKPiBpbmRleCBjZTYwOWU3ZDc1OGYuLmYyOTg1
MzM3YWE1MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9nZW0u
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2dlbS5jCj4gQEAgLTI2MCw3
ICsyNjAsNyBAQCBzdGF0aWMgaW50IHZtd19kZWJ1Z2ZzX2dlbV9pbmZvX3Nob3coc3RydWN0IHNl
cV9maWxlICptLCB2b2lkCj4gKnVudXNlZCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAqIFRoZXJlZm9yZSwgd2UgbmVlZCB0byBwcm90ZWN0IHRoaXMgLT5jb21tIGFjY2VzcyB1
c2luZyBSQ1UuCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJjdV9yZWFkX2xvY2soKTsKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgdGFzayA9IHBpZF90YXNrKGZpbGUtPnBpZCwgUElEVFlQRV9QSUQp
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0YXNrID0gcGlkX3Rhc2soZmlsZS0+
cGlkLCBQSURUWVBFX1RHSUQpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2Vx
X3ByaW50ZihtLCAicGlkICU4ZCBjb21tYW5kICVzOlxuIiwgcGlkX25yKGZpbGUtPnBpZCksCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0YXNr
ID8gdGFzay0+Y29tbSA6ICI8dW5rbm93bj4iKTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHJjdV9yZWFkX3VubG9jaygpOwoKClllYSwgdGhhdCBwcm9iYWJseSBtYWtlcyBhIGxv
dCBtb3JlIHNlbnNlLiBMb29rcyBnb29kLgoKUmV2aWV3ZWQtYnk6IFphY2sgUnVzaW4gPHphY2ty
QHZtd2FyZS5jb20+Cg==
