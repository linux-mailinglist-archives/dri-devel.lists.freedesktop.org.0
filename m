Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9977FD2D4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 10:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C9B10E17B;
	Wed, 29 Nov 2023 09:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2080.outbound.protection.outlook.com [40.107.15.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53B010E18D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 09:06:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Agfbb1LlPn5F+YqM3E1ueRmh5rW0cPmVzi6EwHRFtdOQt931mbVneWdoRwLrYlpHYQlt623aJ0LWD4AV1cv7D/lJ8E31ixHLoDvbTtF3YPtRWBOJJE3C+ShkA+tYiHIPaGodR4uv4A9oAG3N4pdThwmlkGqOjrhfabnuk/zKUEPCbqy3R8jOutT12++X9BimIJ7RdRClWDa0DS7Q+FVYcXyCvTC0fKqwkzmfpO4dadDMuQZHR5mOP0OxECOxDadDNxSDfacSevg8DxBAjQtJFLA0B+MAEPxWJ6vnw0MX3c1h+vwqwC2Q//36b3j2QUN9mHHAIm1f8JqZYla+wSPyUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ECHacksU4uwfPdHUUFkXBu9q1//7i/fZfECt6m/xtY=;
 b=dw+qVCowCOtPAyd+LG3LFe1qRstqwivT9nlvJLD/EsCyyyyji7/y3a5XJGCMw8wwVLV603+KWWRlc8g9Lh1BLADw+9KH42bWoA2jlZjNnzLFPQFzpas0kPJg7Yy8TAqeLCDntxAOdkyp7uNbB+u7Z54O6qH7E/UyzanNF4gE442pdGIyot2rDj9CPKgVyqT//8WlJUhJcVONK6ZAAboht1ggQkzvMQfZ94PbAXLjkMcKi1odwB04KyoveFCZhVji2dWTqbnx6EL1KLloxMLvPyvPh6XXTVi4Tlz93RUE7h+AAZ+9OtBmYDVZHQEa8nT4M4lLfX3ayP3C3fF20vg57A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ECHacksU4uwfPdHUUFkXBu9q1//7i/fZfECt6m/xtY=;
 b=vG0sX/Ih1OvybDTWL2/AwBAL2fX6GNkgQRXtVAfYAC8839kqPBGmPyXoTUvIzrUWTXBKcicFHsXOuEAi7ol9K37EhWkdXMAy6gkvjnKQhjAxmCBXMxt6/z4ColhbVHjbSDwRgRToZuUuayHFyvMYEgb4eFgPQgmx9uUs4bMesDHl5JcJ8SakdzP1dr3o2+kOFfyq1H6SGYCaQw4cBeNW7vPIM0d4v0bUuV0f8rZTvH7SWpMc52RQDuUIsXjctv0XOOebtlW7POpq0fAvLr6lcQy89YesPhwXT6DFlUj7JwVhq7cLQbgid78IKXDgTzSxaXhr5e/pEODGFMMhcbf0Wg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS4PR10MB6111.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:583::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 09:06:54 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f1e6:2701:4840:b64f%5]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 09:06:54 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ltuikov89@gmail.com" <ltuikov89@gmail.com>
Subject: Re: [PATCH] drm/sched: Fix compilation issues with DRM priority rename
Thread-Topic: [PATCH] drm/sched: Fix compilation issues with DRM priority
 rename
Thread-Index: AQHaIqNm/V0OBMy3jUqqt26siLHUTQ==
Date: Wed, 29 Nov 2023 09:06:54 +0000
Message-ID: <502292edcc93827397189b4f36aec5a67a7c06c3.camel@siemens.com>
References: <20231125192246.87268-2-ltuikov89@gmail.com>
In-Reply-To: <20231125192246.87268-2-ltuikov89@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS4PR10MB6111:EE_
x-ms-office365-filtering-correlation-id: 952ec02b-8037-4e10-b86e-08dbf0ba8889
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7ZuboAWqlCZFBPVwrEv0qGPRKRrIr+fG4qKveewTAYXxf4IKkNTKrzeqHbmAI1SJ5f6VN/0ZxRC9rKeelKLgaJHCPP85sUYr9wMfhpd8inBsdq7uMbMOnaCWcSllIxJIfKRs0Qd9DAAl4U/OIoEE/B1pnDHC7tXkJwuSSWdd3yC8QJALU9AJrzqqtvdXEKI8F+TMPvSyiOr87+fb39XfyHi2tJPVp6FQx9Ck5LCPo0eJtUEs4FY+mJumQjhLVp96+tcCG5DHwcE/yj0vxj6l4XDcwYY8vgiByr7CBEmrWhS0n8+DlGoPbZxWLq6Lfdyg4ezPBw4FP2BRpvc9qiKq7AK8h3gHlhhKLzAPCWhuTBpv4rlhKkuwkn4gG5e3QkdAdcbzerGXn/LEAh0hzgZRf5bald1IJC1LDS470+M5x4h3etKwh23pYXpyibHqehgO34TH3dPgNONDZiSQULJnjrD7FIoHcpCPHJ8bdaHECphgrrJRyP9OZ6k+whR2JWFy4tdYQKz4dLNDtcoFP9KXbCqbgX/5KpE55WawqjhfpDA/xyu7iWu7O5vTwaHtNE3wXV/f4tAtFE5PqKcypSodsvqARZsqRlELbADj/xtSVFnmQexE5XVz7eYW15cybI0Q3eXI736W3zPdID/k0BhseQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(38100700002)(41300700001)(4001150100001)(38070700009)(36756003)(15974865002)(122000001)(83380400001)(82960400001)(5660300002)(26005)(86362001)(2616005)(2906002)(6512007)(6506007)(8676002)(8936002)(71200400001)(4326008)(478600001)(966005)(6486002)(91956017)(66946007)(110136005)(66446008)(54906003)(316002)(66476007)(66556008)(64756008)(76116006)(18886075002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDBrampraUZGcklCd2xHdndJSGJBd0VzblVzM0hxWHgzUGNub3Y4djNxdWIy?=
 =?utf-8?B?T3hiR3J3bkp1TEMrZmN4OWlCOUIzNzloR3VBM3hqSngyUlk4cVQ3S3JraUpk?=
 =?utf-8?B?ZlRVTzFBU1BEa21FL2U2QnBKNG1ETzF2cXVlbmRYUFJMaEVuTy9TMytUeE9p?=
 =?utf-8?B?QnNDdXg1ZUYxSVhNSHlqQ3lncWg4TlZ5NkZIUDN2SkJQcEx4UlV0K2U3VGF0?=
 =?utf-8?B?QUhHTVZnd1pkU01ic291SkxRVzVqaWxOek1UZGNnTXJRWkQyV3VGT0pEN2hP?=
 =?utf-8?B?cWtsTXpGU2dyOW1jbzZtUExGc0FabzdYNXg4UlVCZm9NUm5IelB6RENSRFE2?=
 =?utf-8?B?b1dDL3JZcFBaaEw1UEFwaDBEYU0ycFFUbTV4SFBwMUF2MW1WcW1qZEVkM3Nw?=
 =?utf-8?B?Rm9EaWZMT0xzNUttclJOcFY5S0VjZkppU0M3SFo4RkhCcUp5TXAyemt6bjRX?=
 =?utf-8?B?aGxKYnUzTDJBd2tGM0xTOEFwVW55b3BpMmdRYyt5MFBoWGxzRkRWSVRycWJh?=
 =?utf-8?B?UmE5OFpWajI3Z3RFMldYZnM4VmNpYnRzMm1aUjV6Q2lzVW1qRlcyQk5vZzBa?=
 =?utf-8?B?UFFlak0rZ2ZuUTNuUU5rUDFVVUpyNFN6QUFnblIycEgva2RCeWl3U1JKMk8z?=
 =?utf-8?B?RGwvT3VST2JjOW4xTG5HZ2tOemNjWjdLcWtqbWc2VGRuNmptTWJFeXl3MHhx?=
 =?utf-8?B?bW5rWmtmR24wallidjc1cFBFVDRsbzZqbDMvR3J1SURSYi9XUGxyVGNZSnBN?=
 =?utf-8?B?eXI5dEJCTlAxcWd1TWVIaFBXWll0dVk3VUdlQ1hZdk1RSVBIclZpd01udkJY?=
 =?utf-8?B?RHJXQkZWdzZlRDJzb25BVUY2TnNCWlV5WVdLK3M3RXBWRnErUW1lWHFTTXpD?=
 =?utf-8?B?VW5nWUYwamhhY3AwWDJyV0NsaGptcEhKdnZESW5iNW12L1dlaXVoQmE5Q0Rj?=
 =?utf-8?B?OTVKQ0tVaGI1T0k0UHFQTVZlWW1uLzUzUXZPQWlvT2tINWJMcjVxRWJvRGdH?=
 =?utf-8?B?bUVOdVYxVHczQWtzcHhIM28zaElqNGxDUVlhUlVHbGtZRnRYb0dEYUdGcG1r?=
 =?utf-8?B?T0RmMi96clRqVE5oNVRxZmgwaTlTb3dSNlpGWlNua2l1MTFIRHpvWGxlSlZ0?=
 =?utf-8?B?c3pianRhQTREa2czQmlQT25OT2xscDZmS1VibVp1M2x0QXJBSjZiV1hsVk1w?=
 =?utf-8?B?UFVRdk5JNkVCRHU5aFpJTEJlUklleGRJc2RBQmNINk9NOWJmQUVkSWJTK0lH?=
 =?utf-8?B?NGRCWjhCUTBpL0lNVTZ5bzg4VkdhZVFyTjh1RFVDcUV6VENWWkJyMnZzM1Q4?=
 =?utf-8?B?aWdYVDhXMzNYSloxaGlXdCs0b0d5RklLd3h5Yy96R0Y5SlFjWjVhakxQdXhm?=
 =?utf-8?B?cUZXWlhvNWpLc1UvK3BoejdwMUZiRkZBdWRkOXRIcE9mM0NpbmZCVGxXc3VR?=
 =?utf-8?B?dTJOampVdlQzWkxPL25Nb1dBRENZcjVvQW5McHVrODRBVWFpYWxrbmZab253?=
 =?utf-8?B?MWJsdHpCWnRNeThvZXZTWGpzSFZ1cVJyOVZLWUh6S0wxMUVyWEQ0aXNWUnVj?=
 =?utf-8?B?ajMvQ1Q3a2RyV0gvQWYvMXhHNW9HcWptMG80ck5JeXk5Y29OYUwrcEN4UnlV?=
 =?utf-8?B?alYrZUcvMHpvQ0RvRWZuUjZzTmZ6ck9Fa2FUMDlUazBtVHNjZjVPdWE5TDhK?=
 =?utf-8?B?d3pXdlFScVNHb01DbE1oSGUzYmlFN2dCUUd4MHl6RkVvbDdtbENPOXluTUFs?=
 =?utf-8?B?NXlrWGxoWnkwZm1aYVppSUV2d0dwKzQ0L1hwSUVVMVkzaGdjVHhlNFE4VWtI?=
 =?utf-8?B?YmFyR2haZ2h1WVlqNDg2NnRlMW1MMXU3NXlJR2Q3Y1RrUjZvT1VEREZOT2gw?=
 =?utf-8?B?RjFnNDArSFJMR2RJWVFKQVllTTRURDZDVUo4aysvZjJvOUdRNmZmQmloQnph?=
 =?utf-8?B?MTNoYkxkLzM5ZER3cHpuNUNNV0F4ckFBeDN3TjRnRDRkeGtMWlRsclB1ZzMx?=
 =?utf-8?B?RUQvcElnSnBsY3pNWWtuRU1oTXBQYXc3YVVwSnpsZEJyR1JZSjlMNXgrYlNI?=
 =?utf-8?B?STV0MzFiOWVXZDEydnROejdYMU45KzhwbHBsWmdleURPYjRYbHA5RmhkNjdm?=
 =?utf-8?B?ZS8xTXEranpRSzRsV3FGYUNyY2NCMW5KbTc2T296VlcrNzFtMytFMFlGVnNP?=
 =?utf-8?Q?IRjw49czby24Iu1TiSWK22E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F628AA9B08CEF742AD5D0DC7DED00275@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 952ec02b-8037-4e10-b86e-08dbf0ba8889
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 09:06:54.7911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CGIVXjLpLC/jKxxdG+vhtRlMPN0MJ8R2BYkbwl0gjDVTHYzWOaCwchqfEIl7zA1wJeAhfxEHM7O+I5rtbYHsw2L/QHzPNOg+N3yJHASecOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6111
X-Mailman-Approved-At: Wed, 29 Nov 2023 09:34:16 +0000
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
Cc: "matt.coster@imgtec.com" <matt.coster@imgtec.com>,
 "dakr@redhat.com" <dakr@redhat.com>,
 "donald.robson@imgtec.com" <donald.robson@imgtec.com>,
 "lkp@intel.com" <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTHViZW4sCgp0aGFua3MgZm9yIHRoZSBwYXRjaCEKCk9uIFNhdCwgMjAyMy0xMS0yNSBhdCAx
NDoyMiAtMDUwMCwgTHViZW4gVHVpa292IHdyb3RlOgo+IEZpeCBjb21waWxhdGlvbiBpc3N1ZXMg
d2l0aCBEUk0gc2NoZWR1bGVyIHByaW9yaXR5IHJlbmFtZSBNSU4gdG8gTE9XLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT4KPiBSZXBvcnRlZC1i
eToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMxMTI1MjEwOS5XZ2JKc1NrRy1sa3BAaW50
ZWwuY29tLwo+IENjOiBEYW5pbG8gS3J1bW1yaWNoIDxkYWtyQHJlZGhhdC5jb20+Cj4gQ2M6IEZy
YW5rIEJpbm5zIDxmcmFuay5iaW5uc0BpbWd0ZWMuY29tPgo+IENjOiBEb25hbGQgUm9ic29uIDxk
b25hbGQucm9ic29uQGltZ3RlYy5jb20+Cj4gQ2M6IE1hdHQgQ29zdGVyIDxtYXR0LmNvc3RlckBp
bWd0ZWMuY29tPgo+IENjOiBEaXJlY3QgUmVuZGVyaW5nIEluZnJhc3RydWN0dXJlIC0gRGV2ZWxv
cG1lbnQgPGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+Cj4gRml4ZXM6IGZlMzc1Yzc0
ODA2ZGJkICgiZHJtL3NjaGVkOiBSZW5hbWUgcHJpb3JpdHkgTUlOIHRvIExPVyIpCj4gRml4ZXM6
IDVmMDNhNTA3YjI5ZTQ0ICgiZHJtL25vdXZlYXU6IGltcGxlbWVudCAxOjEgc2NoZWR1bGVyIC0g
ZW50aXR5IHJlbGF0aW9uc2hpcCIpCj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRp
b24vcHZyX3F1ZXVlLmMgfCAyICstCj4gwqBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X3NjaGVkLmMgfCA2ICsrKy0tLQo+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5h
dGlvbi9wdnJfcXVldWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbWFnaW5hdGlvbi9wdnJfcXVldWUu
Ywo+IGluZGV4IGQ2NWMzZmJlZGY1YWM0Li41ZWQ5Yzk4ZmI1OTljOCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vaW1hZ2luYXRpb24vcHZyX3F1ZXVlLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaW1hZ2luYXRpb24vcHZyX3F1ZXVlLmMKPiBAQCAtMTI5Miw3ICsxMjkyLDcgQEAgc3Ry
dWN0IHB2cl9xdWV1ZSAqcHZyX3F1ZXVlX2NyZWF0ZShzdHJ1Y3QgcHZyX2NvbnRleHQgKmN0eCwK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX3JlbGVhc2VfdWZvOwo+
IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGVyciA9IGRybV9zY2hlZF9lbnRpdHlfaW5pdCgmcXVldWUt
PmVudGl0eSwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX1NDSEVEX1BSSU9SSVRZX01JTiwKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgRFJNX1NDSEVEX1BSSU9SSVRZX0tFUk5FTCwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZzY2hlZCwg
MSwgJmN0eC0+ZmF1bHR5KTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX3NjaGVkX2Zpbmk7CgpBdCBsZWFzdCBwdnJf
cXVldWUuYyBjYW4gYmUgYnVpbHQgYWdhaW4sCgpUZXN0ZWQtYnk6IEFsZXhhbmRlciBTdmVyZGxp
biA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29tPgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zY2hlZC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9zY2hlZC5jCj4gaW5kZXggMzM5MzY0N2JkOTQ0MjMuLmRkOThmNjkxMGY5Y2Fi
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc2NoZWQuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc2NoZWQuYwo+IEBAIC0xOCw3
ICsxOCw3IEBACj4gwqAgKiBpbmRleCB0byB0aGUgcnVuLXF1ZXVlIGFycmF5Lgo+IMKgICovCj4g
wqBlbnVtIG5vdXZlYXVfc2NoZWRfcHJpb3JpdHkgewo+IC3CoMKgwqDCoMKgwqDCoE5PVVZFQVVf
U0NIRURfUFJJT1JJVFlfU0lOR0xFID0gRFJNX1NDSEVEX1BSSU9SSVRZX01JTiwKPiArwqDCoMKg
wqDCoMKgwqBOT1VWRUFVX1NDSEVEX1BSSU9SSVRZX1NJTkdMRSA9IERSTV9TQ0hFRF9QUklPUklU
WV9LRVJORUwsCj4gwqDCoMKgwqDCoMKgwqDCoE5PVVZFQVVfU0NIRURfUFJJT1JJVFlfQ09VTlQs
Cj4gwqB9Owo+IMKgCj4gQEAgLTQyMyw3ICs0MjMsNyBAQCBub3V2ZWF1X3NjaGVkX2luaXQoc3Ry
dWN0IG5vdXZlYXVfc2NoZWQgKnNjaGVkLCBzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSwKPiDCoMKg
wqDCoMKgwqDCoMKgaWYgKHJldCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdv
dG8gZmFpbF93cTsKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoC8qIFVzaW5nIERSTV9TQ0hFRF9QUklP
UklUWV9NSU4sIHNpbmNlIHRoYXQncyB3aGF0IHdlJ3JlIHJlcXVpcmVkIHRvIHVzZQo+ICvCoMKg
wqDCoMKgwqDCoC8qIFVzaW5nIERSTV9TQ0hFRF9QUklPUklUWV9LRVJORUwsIHNpbmNlIHRoYXQn
cyB3aGF0IHdlJ3JlIHJlcXVpcmVkIHRvIHVzZQo+IMKgwqDCoMKgwqDCoMKgwqAgKiB3aGVuIHdl
IHdhbnQgdG8gaGF2ZSBhIHNpbmdsZSBydW4tcXVldWUgb25seS4KPiDCoMKgwqDCoMKgwqDCoMKg
ICoKPiDCoMKgwqDCoMKgwqDCoMKgICogSXQncyBub3QgZG9jdW1lbnRlZCwgYnV0IG9uZSB3aWxs
IGZpbmQgb3V0IHdoZW4gdHJ5aW5nIHRvIHVzZSBhbnkKPiBAQCAtNDMzLDcgKzQzMyw3IEBAIG5v
dXZlYXVfc2NoZWRfaW5pdChzdHJ1Y3Qgbm91dmVhdV9zY2hlZCAqc2NoZWQsIHN0cnVjdCBub3V2
ZWF1X2RybSAqZHJtLAo+IMKgwqDCoMKgwqDCoMKgwqAgKiBDYW4ndCB1c2UgTk9VVkVBVV9TQ0hF
RF9QUklPUklUWV9TSU5HTEUgZWl0aGVyLCBiZWNhdXNlIGl0J3Mgbm90Cj4gwqDCoMKgwqDCoMKg
wqDCoCAqIG1hdGNoaW5nIHRoZSBlbnVtIHR5cGUgdXNlZCBpbiBkcm1fc2NoZWRfZW50aXR5X2lu
aXQoKS4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gLcKgwqDCoMKgwqDCoMKgcmV0ID0gZHJtX3Nj
aGVkX2VudGl0eV9pbml0KGVudGl0eSwgRFJNX1NDSEVEX1BSSU9SSVRZX01JTiwKPiArwqDCoMKg
wqDCoMKgwqByZXQgPSBkcm1fc2NoZWRfZW50aXR5X2luaXQoZW50aXR5LCBEUk1fU0NIRURfUFJJ
T1JJVFlfS0VSTkVMLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmRybV9zY2hlZCwgMSwgTlVMTCk7Cj4gwqDC
oMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBn
b3RvIGZhaWxfc2NoZWQ7CgotLSAKQWxleGFuZGVyIFN2ZXJkbGluClNpZW1lbnMgQUcKd3d3LnNp
ZW1lbnMuY29tCg==
