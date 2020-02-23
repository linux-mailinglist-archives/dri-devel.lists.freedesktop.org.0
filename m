Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDF8169820
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2020 15:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE2C6E039;
	Sun, 23 Feb 2020 14:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C0C6E039
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 14:40:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzAl4u56BICAMWBF61uoSeAu7S+3N10Z1LUPgW3fsKsfF87JOE0BpsV/aV0+PCpls15XvWWC4br4qeYEhLUrOh2lCTFJcnIIFPa8OVJ3LbkF8ldgvw0hWzudDFxxk0+8vrEUroUJpsxp1UwIQ7T2utH+HmQPdLC+CsNoTnKQEVNcur8s8MK4/vJqcivYIKPIjyeOssO99/FIjSOMpgnFH2seoxfEakgKSufToSUv9jspDviAPOpuO86RZvxKWRMT23oMRdTx99w5a+zHbvxKkS2sd0xMaiAs4iskXEgqDFhOCFnnttcq6b+5vXLJEk+VYbCa8wRBlXBply/+SgUIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tt4zeUvrpoLx007urafcQRBjk1ILsOstr0hH//Q/6IQ=;
 b=UiLSVkfHPePrKB5Nwuc8mgC7Afx/nGzkuY5gIkwWW6KO77bPL/hg9RlIU58MBEzIrkq7/9hmb7YljHh2CvJ8PPd/UWU4tkxp44aRvFzziFDJI5ZIKxcXC56PTjQWNVi6N8gAXYGvwD1I7poC3n/huJyKNssk52UFquKG5M3ksQcL3ksIqDcCa3ZC+tyvFzqLfvhiljOFrLDWHhWbsW/hyG7zwKONBgkSIHVGzLmPHhq2Np4R5NRVuDo9D4SXN1qmDlOPjaeBh56UaWNR/B2doKu+UDGVNbp5XxB0P9UgOPK+SMFARFIQ6LceReRXhjYYjSAjxJcDU3iX8HpHAwPSsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tt4zeUvrpoLx007urafcQRBjk1ILsOstr0hH//Q/6IQ=;
 b=SYCoLMnM07wA4d3dmUdq6nIeZRfAhL3QUIyFL9XYf9Nh5XSHkQlkotAdjFf+H7hreD8ma03LBLVBAoKitKrfTvY6EEKt6ksQU/ylXRf83AEUuCF3PLkkBIh8fJNsQXWV4nCj7fblAyKhEKJ+P7eSSTiMfl2TFxZEOIZ1r/TdfN8=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (2603:10b6:3:10c::22)
 by DM5PR12MB1849.namprd12.prod.outlook.com (2603:10b6:3:107::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Sun, 23 Feb
 2020 14:40:20 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2750.021; Sun, 23 Feb
 2020 14:40:20 +0000
Subject: Re: [PATCH] dma-buf: Fix missing excl fence waiting
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <B737F1D5-292E-4FE2-89A5-6EF72CB3EED1@amd.com>
 <7a2eb42a-2dd9-4303-3947-6bbb4de7a888@amd.com>
 <3B6ADD37-8287-4180-B99B-C747DBACC6F4@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <60825044-261f-f5e9-bc86-285cd486b398@amd.com>
Date: Sun, 23 Feb 2020 13:12:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <3B6ADD37-8287-4180-B99B-C747DBACC6F4@amd.com>
Content-Language: en-US
X-ClientProxiedBy: ZRAP278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 ZRAP278CA0010.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Sun, 23 Feb 2020 14:40:16 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f5beddf8-29e4-441b-7aa5-08d7b86e4ea6
X-MS-TrafficTypeDiagnostic: DM5PR12MB1849:|DM5PR12MB1849:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB18497701A0368523FC9058EE83EF0@DM5PR12MB1849.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0322B4EDE1
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(189003)(199004)(5660300002)(36756003)(2906002)(52116002)(31696002)(8676002)(81166006)(81156014)(6486002)(86362001)(8936002)(4326008)(66946007)(54906003)(6636002)(6862004)(37006003)(478600001)(16526019)(66556008)(316002)(2616005)(186003)(31686004)(6666004)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1849;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7ZKleIF67ErvCmqm/ACUVQBV76QHFV06IU4tQ3bC72Ye4QXMgyJlw8RTIZWgZMFzoJ3z/0onOek51SA1CLxwTGqa0NShjOR1vXLHm1UBlNbIjepJbsgekuHFPpr+/87DyQnXP1qq7nRRzsftjvHzUuK4qrxhenWKzcupofnL6Z3Yu267RTQGlQL+e2IBdYt6f0vFL/zQ3Hq7TH6FANHdvXuWBq+Ajsv2k1qifAyrju4nzt1QSZlUM6hPbt8UdrodZNQ/ynbP4ojZLUbr5Ll5gMAFXmZSQ7lwl6xNLs83gae7FH4f3qq7VJ/avEvKFl0sAkUtxfZQFMZ8+qdd6+Ig0436RQunqRfCEcfGQOD3f+/XvHAOX1jN3vzEsRkk+U6RdBQk8rz0Z+l4q58n45k0I+f/6zdpcvaIh/CrmzKPqftgv1wlxO3KNwj4MTczG1x/
X-MS-Exchange-AntiSpam-MessageData: 7mNT5poByy3lGdWn37TJ0u5pu0XOlVn863P7GHaNgoEhASJmAT5cnTv1YMpHsq41+zXq52r0UjPj+S4IeQAJhYjukzjqv45LfimP+snmz1KdSwOwUl6vkV9FVrYSfXsagnAB2ZhJgLUlbBDdXPgBumxXsPA0MRdvxkypO6BfCTCtvgAOfTTKWAJ586VKnX/SJZRU2G1vkWlGzHyHtGh52w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5beddf8-29e4-441b-7aa5-08d7b86e4ea6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2020 14:40:20.4070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4R7/pcFJOEmsPlA+3XezrB5Be/CWhtTO9NRL9k0lQCdCmxDRY1KKtRcT7hsEXEk2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1849
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDIuMjAgdW0gMTM6MjEgc2NocmllYiBQYW4sIFhpbmh1aToKPgo+PiAyMDIw5bm0Muac
iDIz5pelIDIwOjA077yMS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNv
bT4g5YaZ6YGT77yaCj4+Cj4+IEFtIDIzLjAyLjIwIHVtIDEyOjU2IHNjaHJpZWIgUGFuLCBYaW5o
dWk6Cj4+PiBJZiBzaGFyZWQgZmVuY2UgbGlzdCBpcyBub3QgZW1wdHksIGV2ZW4gd2Ugd2FudCB0
byB0ZXN0IGFsbCBmZW5jZXMsIGV4Y2wgZmVuY2UgaXMgaWdub3JlZC4KPj4+IFRoYXQgaXMgYWJ2
aW91c2x5IHdyb25nLCBzbyBmaXggaXQuCj4+IFllYWggdGhhdCBpcyBhIGtub3duIGlzc3VlIGFu
ZCBJIGNvbXBsZXRlbHkgYWdyZWUgd2l0aCB5b3UsIGJ1dCBvdGhlciBkaXNhZ3JlZS4KPj4KPj4g
U2VlIHRoZSBzaGFyZWQgZmVuY2VzIGFyZSBtZWFudCB0byBkZXBlbmQgb24gdGhlIGV4Y2x1c2l2
ZSBmZW5jZS4gU28gYWxsIHNoYXJlZCBmZW5jZXMgbXVzdCBmaW5pc2ggb25seSBhZnRlciB0aGUg
ZXhjbHVzaXZlIG9uZSBoYXMgZmluaXNoZWQgYXMgd2VsbC4KPiBmYWlyIGVub3VnaC4KPgo+PiBU
aGUgcHJvYmxlbSBub3cgaXMgdGhhdCBmb3IgZXJyb3IgaGFuZGxpbmcgdGhpcyBpc24ndCBuZWNl
c3NhcnkgdHJ1ZS4gSW4gb3RoZXIgd29yZHMgd2hlbiBhIHNoYXJlZCBmZW5jZSBjb21wbGV0ZXMg
d2l0aCBhbiBlcnJvciBpdCBpcyBwZXJmZWN0bHkgcG9zc2libGUgdGhhdCBoZSBkb2VzIHRoaXMg
YmVmb3JlIHRoZSBleGNsdXNpdmUgZmVuY2UgaXMgZmluaXNoZWQuCj4+Cj4+IEknbSB0cnlpbmcg
dG8gY29udmluY2UgRGFuaWVsIHRoYXQgdGhpcyBpcyBhIHByb2JsZW0gZm9yIHllYXJzIDopCj4+
Cj4gSSBoYXZlIG1ldCBwcm9ibGVtcywgZXZpY3Rpb24gaGFzIHJhY2Ugd2l0aCBibyByZWxhc2Uu
ICBzeXN0ZW0gbWVtb3J5IGlzIG92ZXJ3cmllZCBieSBzRE1BLiB0aGUga2VybmVsIGlzIDQuMTks
IHN0YWJsZSBvbmUsIExPTC4KCk9rIHNvdW5kcyBsaWtlIHdlIGFkZCBzb21lIHNoYXJlZCBmZW5j
ZSB3aGljaCBkb2Vzbid0IGRlcGVuZCBvbiB0aGUgCmV4Y2x1c2l2ZSBvbmUgdG8gZmluaXNoLiBU
aGF0IGlzIG9mIGNvdXJzZSBoaWdobHkgcHJvYmxlbWF0aWMgZm9yIHRoZSAKY3VycmVudCBoYW5k
bGluZy4KCkl0IG1pZ2h0IGJlIHRoYXQgdGhpcyBoYXBwZW5zIHdpdGggdGhlIFRUTSBtb3ZlIGZl
bmNlLCBidXQgSSBkb24ndCBvZiAKaGFuZCBrbm93IGVpdGhlciBob3cgdG8gcHJldmVudCB0aGF0
LgoKUXVlc3Rpb24gYXQgRGFuaWVsIGFuZCBvdGhlcnM6IENhbiB3ZSBmaW5hbGx5IGRyb3AgdGhp
cyBhc3N1bXB0aW9uIHRoYXQgCmFsbCBzaGFyZWQgZmVuY2VzIG11c3QgZmluaXNoIGFmdGVyIHRo
ZSBleGNsdXNpdmUgb25lPwoKVGhhbmtzIGZvciBwb2ludGluZyB0aGlzIG91dCBYaW5odWksCkNo
cmlzdGlhbi4KCj4KPiBhbWRncHUgYWRkIGV4Y2wgZmVuY2UgdG8gYm8gdG8gbW92ZSBzeXN0ZW0g
bWVtb3J5IHdoaWNoIGlzIGRvbmUgYnkgdGhlIGRybSBzY2hlZHVsZXIuCj4gYWZ0ZXIgc0RNQSBm
aW5pc2ggdGhlIG1vdmluZyBqb2IsICB0aGUgbWVtb3J5IG1pZ2h0IGhhdmUgYWxyZWFkeSBiZWVu
IHJlbGVhc2VkIGFzIGRtYV9yZXN2X3Rlc3Rfc2lnbmFsZWRfcmN1IGRpZCBub3QgY2hlY2sgZXhj
bCBmZW5jZS4KPgo+IE91ciBsb2NhbCBjdXN0b21lciByZXBvcnQgdGhpcyBpc3N1ZS4gSSB0b29r
IDQgZGF5cyBpbnRvIGl0LiBzaWdoCj4KPiB0aGFua3MKPiB4aW5odWkKPgo+PiBSZWdhcmRzLAo+
PiBDaHJpc3RpYW4uCj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFu
QGFtZC5jb20+Cj4+PiAtLS0KPj4+ICAgZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgfCA5ICsr
KysrLS0tLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYyBiL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4+PiBpbmRleCA0MjY0ZTY0Nzg4YzQuLjQ0ZGM2NGM1
NDdjNiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jCj4+PiArKysg
Yi9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYwo+Pj4gQEAgLTYzMiwxNCArNjMyLDE0IEBAIHN0
YXRpYyBpbmxpbmUgaW50IGRtYV9yZXN2X3Rlc3Rfc2lnbmFsZWRfc2luZ2xlKHN0cnVjdCBkbWFf
ZmVuY2UgKnBhc3NlZF9mZW5jZSkKPj4+ICAgICovCj4+PiAgIGJvb2wgZG1hX3Jlc3ZfdGVzdF9z
aWduYWxlZF9yY3Uoc3RydWN0IGRtYV9yZXN2ICpvYmosIGJvb2wgdGVzdF9hbGwpCj4+PiAgIHsK
Pj4+IC0JdW5zaWduZWQgc2VxLCBzaGFyZWRfY291bnQ7Cj4+PiArCXVuc2lnbmVkIGludCBzZXEs
IHNoYXJlZF9jb3VudCwgbGVmdDsKPj4+ICAgCWludCByZXQ7Cj4+PiAgICAgCXJjdV9yZWFkX2xv
Y2soKTsKPj4+ICAgcmV0cnk6Cj4+PiAgIAlyZXQgPSB0cnVlOwo+Pj4gICAJc2hhcmVkX2NvdW50
ID0gMDsKPj4+IC0Jc2VxID0gcmVhZF9zZXFjb3VudF9iZWdpbigmb2JqLT5zZXEpOwo+Pj4gKwls
ZWZ0ID0gc2VxID0gcmVhZF9zZXFjb3VudF9iZWdpbigmb2JqLT5zZXEpOwo+Pj4gICAgIAlpZiAo
dGVzdF9hbGwpIHsKPj4+ICAgCQl1bnNpZ25lZCBpOwo+Pj4gQEAgLTY0Nyw3ICs2NDcsNyBAQCBi
b29sIGRtYV9yZXN2X3Rlc3Rfc2lnbmFsZWRfcmN1KHN0cnVjdCBkbWFfcmVzdiAqb2JqLCBib29s
IHRlc3RfYWxsKQo+Pj4gICAJCXN0cnVjdCBkbWFfcmVzdl9saXN0ICpmb2JqID0gcmN1X2RlcmVm
ZXJlbmNlKG9iai0+ZmVuY2UpOwo+Pj4gICAgIAkJaWYgKGZvYmopCj4+PiAtCQkJc2hhcmVkX2Nv
dW50ID0gZm9iai0+c2hhcmVkX2NvdW50Owo+Pj4gKwkJCWxlZnQgPSBzaGFyZWRfY291bnQgPSBm
b2JqLT5zaGFyZWRfY291bnQ7Cj4+PiAgICAgCQlmb3IgKGkgPSAwOyBpIDwgc2hhcmVkX2NvdW50
OyArK2kpIHsKPj4+ICAgCQkJc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UgPSByY3VfZGVyZWZlcmVu
Y2UoZm9iai0+c2hhcmVkW2ldKTsKPj4+IEBAIC02NTcsMTMgKzY1NywxNCBAQCBib29sIGRtYV9y
ZXN2X3Rlc3Rfc2lnbmFsZWRfcmN1KHN0cnVjdCBkbWFfcmVzdiAqb2JqLCBib29sIHRlc3RfYWxs
KQo+Pj4gICAJCQkJZ290byByZXRyeTsKPj4+ICAgCQkJZWxzZSBpZiAoIXJldCkKPj4+ICAgCQkJ
CWJyZWFrOwo+Pj4gKwkJCWxlZnQtLTsKPj4+ICAgCQl9Cj4+PiAgICAgCQlpZiAocmVhZF9zZXFj
b3VudF9yZXRyeSgmb2JqLT5zZXEsIHNlcSkpCj4+PiAgIAkJCWdvdG8gcmV0cnk7Cj4+PiAgIAl9
Cj4+PiAgIC0JaWYgKCFzaGFyZWRfY291bnQpIHsKPj4+ICsJaWYgKCFsZWZ0KSB7Cj4+PiAgIAkJ
c3RydWN0IGRtYV9mZW5jZSAqZmVuY2VfZXhjbCA9IHJjdV9kZXJlZmVyZW5jZShvYmotPmZlbmNl
X2V4Y2wpOwo+Pj4gICAgIAkJaWYgKGZlbmNlX2V4Y2wpIHsKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
