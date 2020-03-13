Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028131844AE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 11:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 176436EBAC;
	Fri, 13 Mar 2020 10:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690047.outbound.protection.outlook.com [40.107.69.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4FB6EBAC
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 10:18:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X931yrWCgpC6/lkZtB13uawcx2dyKEsq2CDJdS6BrIMkagAD8fr34yhQ+JHal6/zkmxW7c5VJQLuZsET+gXGQHomId8V/aW6eyPvNCiC5Pfna0jQzJG9zRJ+OBrNkMK6zjhayn1dRvAy0kp7ppNondGR2WeP+/NQ7l9hNOwMA5VWI6wSPetYXZmRXBrmfuf4uIxTDAJzQ6gf5J7UYRpZADBlZe1vc+rM25vO9TX3ElutR+ARKjQN5iGREmpb02w3suLHKCzxvnqCmgR+ORY0OCN3ndcppzw9momsUJrCFOzrquhVIyj4Zkd872DdmH/ArtJ54oM8R6EsLKX8UDCebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWMYL6iR4pxmsHx/pwNjIpMW2zLGV0QQIUqP6md0mJU=;
 b=myr/m5GEskmaeNgi6lFwTHxBHGgORmbraWcWRVe8OznKVIxEQ8pDUswnMwv2IozYTINFN4O1ine5+5Pj++VGBXhvNhvaTABEnYahDcsOJYIu45dMpc0R5OZSGbf3v3uOo0uI4u/i49MYuYcNo8crzrt1s3E57BoLnh39xnNCnojHbZIj7xQju8De43yMpHx7IU/ApsoLkSehFEOth5kEVeFmJhA9Xfb37KEL39oZdZvXTWzJxn4nPlQUzPbA//EUX9SqIGm9n7430ssC+944xmqU7ByQkXpWORhPefXVbQaa/Kr7nmKHztRMI11jTWYmPSD9YG6DdDP1FtrSBfwrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWMYL6iR4pxmsHx/pwNjIpMW2zLGV0QQIUqP6md0mJU=;
 b=0jS/0GU/BTsyDBxvWt8RQFuVF5VmMcnUFdHoHieDB92+YrTj8r6fgORZs6JebnBD4wX6XtU9mrdRRzXe8EVl9q2UCPqdlbZi8VA0o8p4QjzZ/LpRWBbIUSRQHgzrRV4n9cItttuviJgHHNeY06aa/QAVhxQCNVMrV26VTZ6Yhjw=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1578.namprd12.prod.outlook.com (2603:10b6:4:e::7) by
 DM5PR12MB1226.namprd12.prod.outlook.com (2603:10b6:3:75::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2814.14; Fri, 13 Mar 2020 10:17:58 +0000
Received: from DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::113e:3059:1470:c73c]) by DM5PR12MB1578.namprd12.prod.outlook.com
 ([fe80::113e:3059:1470:c73c%7]) with mapi id 15.20.2793.021; Fri, 13 Mar 2020
 10:17:58 +0000
Subject: Re: [PATCH] drm/sched: add run job trace
To: Lucas Stach <l.stach@pengutronix.de>, dri-devel@lists.freedesktop.org
References: <20200313095640.17967-1-l.stach@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8a3cd453-4351-af4a-93df-9b290fa1e582@amd.com>
Date: Fri, 13 Mar 2020 11:17:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200313095640.17967-1-l.stach@pengutronix.de>
Content-Language: en-US
X-ClientProxiedBy: AM3PR05CA0097.eurprd05.prod.outlook.com
 (2603:10a6:207:1::23) To DM5PR12MB1578.namprd12.prod.outlook.com
 (2603:10b6:4:e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0097.eurprd05.prod.outlook.com (2603:10a6:207:1::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.15 via Frontend Transport; Fri, 13 Mar 2020 10:17:57 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b7a3c9fd-5472-4cb9-bc98-08d7c737cd99
X-MS-TrafficTypeDiagnostic: DM5PR12MB1226:|DM5PR12MB1226:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB12262049B40420E2A4CE007683FA0@DM5PR12MB1226.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:669;
X-Forefront-PRVS: 034119E4F6
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(199004)(2906002)(478600001)(81166006)(81156014)(316002)(8936002)(52116002)(5660300002)(54906003)(6666004)(8676002)(31696002)(86362001)(36756003)(6486002)(66946007)(4326008)(31686004)(16526019)(186003)(66476007)(66556008)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1226;
 H:DM5PR12MB1578.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2LesmjJZbIUkP0B13JPfjkLZTuzbBBMNnircYBoRhScAlv+66TAJawIx8mw6OHgYc/hVllJSPl6ta8wfydL/monGud+UiWRfjMn6jKB5TrkpjZB/BcXjybJDGMuZPxTQgZaghHWPsCPmoQq6UHmJFA2Xueo8ique7QRcd2SBIX7CT9GYLhw3kBtpnvf9tLqsfy1r3xe+8T4JAvSHqMEKu+gyE7edZk0Enj8X98nzIRFlVEVWo9bzc48/Uirf83P4TVbcVaH1ovDI40br0eTJOoOEnVSixqbMHMFjn/HdxcNwX2/H/pc6mN5p78tLz48Q5MD4HVL9vRDtpPlB8+3jbnd7AaHjpolaWxpq3ZoebRGtTAql3EPu1djLj+8gek1thqpQP4Zo27TW45ejPvSmz7ELRUr9P7wShtWaNkqXvO4zL4foleBRMFEpzVtx7E13
X-MS-Exchange-AntiSpam-MessageData: hPIbKsvvjsjo9+ajbXdCnxC+ZnvhG14nlbH/Z+QfG9ljj6RF1VQruAW8Qg/i84BIA8mqRgWCMjnSCUY1svGAk/Z3UrZ4O8+BlUnwMPvrnJo/OFb4143BwiqIHzexTe4PY+3KMDbQ7V7OzBSvm7E/wIJodkQIg/ho8AYt0pUVB0YGndtcHnRxIjyC0SMpMa/BbTPNZydKLv6q0pA4HVFZ6g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a3c9fd-5472-4cb9-bc98-08d7c737cd99
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2020 10:17:58.4616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/shrWXiFIti7svouVfMPPLwujA6OySzlm3HzJe/Se2i0UqBs1aA4WOVNc9ClNLn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1226
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
Cc: Robert Beckett <bob.beckett@collabora.com>, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTMuMDMuMjAgdW0gMTA6NTYgc2NocmllYiBMdWNhcyBTdGFjaDoKPiBGcm9tOiBSb2JlcnQg
QmVja2V0dCA8Ym9iLmJlY2tldHRAY29sbGFib3JhLmNvbT4KPgo+IEFkZCBhIG5ldyB0cmFjZSBl
dmVudCB0byBzaG93IHdoZW4gam9icyBhcmUgcnVuIG9uIHRoZSBIVy4KPgo+IFNpZ25lZC1vZmYt
Ynk6IFJvYmVydCBCZWNrZXR0IDxib2IuYmVja2V0dEBjb2xsYWJvcmEuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgoKVGhlcmUgaXMgYWxz
byB0aGUgc2NoZWR1bGVkIGZlbmNlIHdlIGNvdWxkIHVzZWQgZm9yIHRoaXMsIGJ1dCB0aGlzIHRy
YWNlIApwb2ludCBhZGRzIGEgZmV3IGV4dHJhIGZpZWxkcyB3aGljaCBtaWdodCBiZSB1c2VmdWwu
CgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoK
PiAtLS0KPiAgIC4uLi9ncHUvZHJtL3NjaGVkdWxlci9ncHVfc2NoZWR1bGVyX3RyYWNlLmggICB8
IDI3ICsrKysrKysrKysrKysrKysrKysKPiAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jICAgICAgICB8ICAxICsKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvZ3B1X3NjaGVk
dWxlcl90cmFjZS5oIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9ncHVfc2NoZWR1bGVyX3Ry
YWNlLmgKPiBpbmRleCBkNzkwODY0OThhZmYuLjg3N2NlOWIxMjdmMSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL2dwdV9zY2hlZHVsZXJfdHJhY2UuaAo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvZ3B1X3NjaGVkdWxlcl90cmFjZS5oCj4gQEAgLTU5LDYg
KzU5LDMzIEBAIFRSQUNFX0VWRU5UKGRybV9zY2hlZF9qb2IsCj4gICAJCSAgICAgIF9fZW50cnkt
PmpvYl9jb3VudCwgX19lbnRyeS0+aHdfam9iX2NvdW50KQo+ICAgKTsKPiAgIAo+ICtUUkFDRV9F
VkVOVChkcm1fcnVuX2pvYiwKPiArCSAgICBUUF9QUk9UTyhzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAq
c2NoZWRfam9iLCBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5KSwKPiArCSAgICBUUF9B
UkdTKHNjaGVkX2pvYiwgZW50aXR5KSwKPiArCSAgICBUUF9TVFJVQ1RfX2VudHJ5KAo+ICsJCQkg
ICAgIF9fZmllbGQoc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKiwgZW50aXR5KQo+ICsJCQkgICAg
IF9fZmllbGQoc3RydWN0IGRtYV9mZW5jZSAqLCBmZW5jZSkKPiArCQkJICAgICBfX2ZpZWxkKGNv
bnN0IGNoYXIgKiwgbmFtZSkKPiArCQkJICAgICBfX2ZpZWxkKHVpbnQ2NF90LCBpZCkKPiArCQkJ
ICAgICBfX2ZpZWxkKHUzMiwgam9iX2NvdW50KQo+ICsJCQkgICAgIF9fZmllbGQoaW50LCBod19q
b2JfY291bnQpCj4gKwkJCSAgICAgKSwKPiArCj4gKwkgICAgVFBfZmFzdF9hc3NpZ24oCj4gKwkJ
CSAgIF9fZW50cnktPmVudGl0eSA9IGVudGl0eTsKPiArCQkJICAgX19lbnRyeS0+aWQgPSBzY2hl
ZF9qb2ItPmlkOwo+ICsJCQkgICBfX2VudHJ5LT5mZW5jZSA9ICZzY2hlZF9qb2ItPnNfZmVuY2Ut
PmZpbmlzaGVkOwo+ICsJCQkgICBfX2VudHJ5LT5uYW1lID0gc2NoZWRfam9iLT5zY2hlZC0+bmFt
ZTsKPiArCQkJICAgX19lbnRyeS0+am9iX2NvdW50ID0gc3BzY19xdWV1ZV9jb3VudCgmZW50aXR5
LT5qb2JfcXVldWUpOwo+ICsJCQkgICBfX2VudHJ5LT5od19qb2JfY291bnQgPSBhdG9taWNfcmVh
ZCgKPiArCQkJCSAgICZzY2hlZF9qb2ItPnNjaGVkLT5od19ycV9jb3VudCk7Cj4gKwkJCSAgICks
Cj4gKwkgICAgVFBfcHJpbnRrKCJlbnRpdHk9JXAsIGlkPSVsbHUsIGZlbmNlPSVwLCByaW5nPSVz
LCBqb2IgY291bnQ6JXUsIGh3IGpvYiBjb3VudDolZCIsCj4gKwkJICAgICAgX19lbnRyeS0+ZW50
aXR5LCBfX2VudHJ5LT5pZCwKPiArCQkgICAgICBfX2VudHJ5LT5mZW5jZSwgX19lbnRyeS0+bmFt
ZSwKPiArCQkgICAgICBfX2VudHJ5LT5qb2JfY291bnQsIF9fZW50cnktPmh3X2pvYl9jb3VudCkK
PiArKTsKPiArCj4gICBUUkFDRV9FVkVOVChkcm1fc2NoZWRfcHJvY2Vzc19qb2IsCj4gICAJICAg
IFRQX1BST1RPKHN0cnVjdCBkcm1fc2NoZWRfZmVuY2UgKmZlbmNlKSwKPiAgIAkgICAgVFBfQVJH
UyhmZW5jZSksCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
bWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPiBpbmRleCA3
MWNlNjIxNTk1NmYuLjM0MjMxYjcxNjNjYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfbWFpbi5jCj4gQEAgLTc3Myw2ICs3NzMsNyBAQCBzdGF0aWMgaW50IGRybV9zY2hlZF9t
YWluKHZvaWQgKnBhcmFtKQo+ICAgCQlhdG9taWNfaW5jKCZzY2hlZC0+aHdfcnFfY291bnQpOwo+
ICAgCQlkcm1fc2NoZWRfam9iX2JlZ2luKHNjaGVkX2pvYik7Cj4gICAKPiArCQl0cmFjZV9kcm1f
cnVuX2pvYihzY2hlZF9qb2IsIGVudGl0eSk7Cj4gICAJCWZlbmNlID0gc2NoZWQtPm9wcy0+cnVu
X2pvYihzY2hlZF9qb2IpOwo+ICAgCQlkcm1fc2NoZWRfZmVuY2Vfc2NoZWR1bGVkKHNfZmVuY2Up
Owo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
