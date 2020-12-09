Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CD32D427E
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 13:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4736E04B;
	Wed,  9 Dec 2020 12:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EBF6E04B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Dec 2020 12:56:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSZ31P83uN9CQLnxg8T0wq5S65wQp4JteP8fgaHqNDjOnAmg6FVkMueZxqCKEPlHC9igEKM34ZDOBc2z0Jae78K4kB7az12HjCy98X8CMMvCp9pENP/86DS56yh4TcHvcfuxzik0qy7C0tTgg4Tw5ukxnEPTsf7XKmzEBdDydq4HptXuZU2013XVN6ZQhCVkJ5HJq8kYe4JfVKbmyzJqFfTb/e367BMMn1ZS/eb8lxtT8a2QQjxsqNgk19kuZ+KkkPfer5ivkNTX65TtbGEvkxdJseu8a8obM3rLXpXKCEv1zLuYI+HhcMpUwGJ9yRAGI++aRHz9uB6KZN7geP/L3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvqDlWvjItbUFtVul5vtlaLkreDE8e167S8y/PtMnQw=;
 b=Ur7KjN8w7rkLcFDjpHjZ6O1kHPI151dORQeidewAjESAy3NRlBeMFXj5GMc+XQyN/RHmCZLHTrHPXMeN9iu/vz9xZVMFZiO8nv81iR9g/oFaCvxFj46pNTSo5QSjP/dsRydohV7P/+/kli1skW1dkhoBwgVCA+gr2dY5WqdZweq41XZy9e/P56JlCeUGlwplwiioCBJxmHLTqU9HxO0Nl8raekYtKthqVb+p6b2CynM3GeI7nCSBca+wztizHJdHe0I8/aygTXUxwYnbLAt83pRjrfTYZZFmfXCuN3vUMXTaq4D/ZEi+TssvDjYcDvZO/EtkMgM51eNoe3emngQymA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvqDlWvjItbUFtVul5vtlaLkreDE8e167S8y/PtMnQw=;
 b=fw0nciHVhm79TICZII3cimN2c0IZ7PzJziQ3x/6GaFpwbK0bZd3FjPY4Vu/BgmDyBJ8ewb9piqb+EeZtMYFZ0rs23C1GLF2r4sLghKhXpQeMWeiZrJqtnNfpedP0+rQaezrWkwYXOqBr/9De7DmBovspT96+GkWnYO39r8APLbA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 12:56:15 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.012; Wed, 9 Dec 2020
 12:56:15 +0000
Subject: Re: [PATCH v2 1/1] drm/amdgpu: clean up bo in vce and vcn test
To: Nirmoy <nirmodas@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20201209115132.98188-1-nirmoy.das@amd.com>
 <b6989ff8-72b2-faf5-76f7-a9b97f9286f2@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <831f3957-2e58-281d-afae-0cc13879b528@amd.com>
Date: Wed, 9 Dec 2020 13:56:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <b6989ff8-72b2-faf5-76f7-a9b97f9286f2@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 12:56:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8090d449-e533-4bef-4e3f-08d89c41d03b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4333:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB43333E0B3A8A7CAEC39046EA83CC0@MN2PR12MB4333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BI15lelcjy3lfsL9eLPxJdU5SduHAMB8Tx9INdawjOaKz9AuZlKgXxqqVxU5Zghta6DqjsgJWNFTKuRh1wQGOIO/VXqT/DBmlC5SG5uv6l2QbW4b1FOhBY3sS6D0RrMZ0++gejh10x7NqLwIq7Z/WyUI+XZ+YcCYU5/VUbg20wcEYhbk3dPgRcUCH3ckhjiSu66uFmDMzIEHmaVf2OW2QsPuI9cwGpfahd41NMldYUI4TNQNN0s7lZl3bdxoONfarCDrOpC7trAm/1D5u9rhsudnotNmdkIM9v7z4YkkKSr2c5fLGeZe2Bpa7o/r5/yQFg0pkJ51POD7zdgv46Us7U1E2u96ZHcCjv9SE59ZJ2GtibcqQ1C3+Qxf/wPoxsA4L+KJ3QNKDY1ZyJSXNYZ25x8R2Nr6NMI+mJPNfHACbSphNrrnprO1fwaKOhjo4xaP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(8676002)(8936002)(36756003)(83380400001)(66946007)(16526019)(66556008)(52116002)(66476007)(53546011)(66574015)(5660300002)(2906002)(186003)(31696002)(2616005)(31686004)(86362001)(6486002)(508600001)(6666004)(34490700003)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?U0NTZHBhK0h5SkhRQXE3N1dJdytsbUhEekRaaXdIR0FuZzBNQnl0eU1pNVFW?=
 =?utf-8?B?NGp4d1RQVjBBVDlMOVVScmIzTFVxYUEzQ1lPSEc3Wnh3clJSUXlHZUp0YnV5?=
 =?utf-8?B?eWRUeHh2YjF2Y1lQWEh1cWIxVHdDL3VpNzRaY1Y4T3JYdFFPN3NLamxvZmp3?=
 =?utf-8?B?c250dmxxaUtzeHoyVmpXV2krVk9FQ3dHbVViejMwSjZkOGE3SUhjWXR5cjRi?=
 =?utf-8?B?bm00Vzhxa2h1aWtVeVZUYjlpc05WZkpXOHhKMkgzWGw4WHl1SkQ2TFU2Nk9K?=
 =?utf-8?B?eVE1emdxdWxCR2JJaWpPNklBRG51S2NZcXo4SENac1FFVUdlQUN0Znl5NktS?=
 =?utf-8?B?b0VKSkRsNlhZYVVHeVJwRXp4STRzWm9NYytMT05nSnF2RWUyeW5VUEtvTElU?=
 =?utf-8?B?b01Gb09ST1BPaCtWYmpLb01EQ1E4QWNqZWhkSWg1T3hmYUtZSCtBVlZodFQv?=
 =?utf-8?B?M1c4cGJjSHFISHFuWjJocXpweTdySzVBTlp1S0NVSXk4S1FtTUdtT2RqVlRJ?=
 =?utf-8?B?bWhUTVBPRE8rYkZVSkd5c0ZKbnVaZ1pSTXNlUG96QzladUtVamRucGRQQ1U1?=
 =?utf-8?B?Tlo5MDFURE5VdkEzZlFIVFpBeVNOdWUwYWNaTUsxVHk1UmJ2V2Q4ZkpVbVln?=
 =?utf-8?B?YWs4aUUzdmxGRlRIc3U2ZnZsSUF4dlI3UW5FUHlZUTJWMXlUVkxZRFYrT2pE?=
 =?utf-8?B?S292S05oRy9kUHd0TEhEN3F4TzdPVlhiUG5OeWgySUdzNDFMZGNHeERJVitH?=
 =?utf-8?B?SG5tSWZHQTk5UXcwSU9hcWNmeE8wMjlCQW5yeC9tMmxFTFpCN3E4OHBmeEVZ?=
 =?utf-8?B?elNDYXR1a0hZYjlpYlB3eDIxcHpDZDJ1LzhyaG9hOVcrOXY0ajhpMjlkTGVt?=
 =?utf-8?B?UFcrdHp6Wmd5TjN6KzJiQTdOWTZGQjRRbkx0SHltc05LaklQVTZzbyt0TU0x?=
 =?utf-8?B?TVVFT0xWaXUvN3AycFRkQWVyWEF5QUdRbnd2dy9WTDlYS29UTGxnZlcwbjhS?=
 =?utf-8?B?SXFqNk1UUkhnVkFiWTBobVJMR3F0a0JTVlpzODVubjgvQU03VUZZUzdSR3ZI?=
 =?utf-8?B?KzhlaHM4OS9jVnBKcnhvalh4WGVFdEh5TGNoSlB1QVRHWFhmYW9IcmFzejlC?=
 =?utf-8?B?amVBcGluV0ZRL3lDSXE3YWl4YnIzZSswQnJvdkxVdnQzMW5xdkNhV3ZaaVlo?=
 =?utf-8?B?dmdWdGptb3VpTkc1czZEb3pmVGFhMHY1SGYyRWZ3cE1OdlBWZmw3VG1BWmg4?=
 =?utf-8?B?UDhoL3F6M2swa3VNNVVNcnU3eVpJREVjT0VvWWFkNVV1VU9mUUQraGVNbEwz?=
 =?utf-8?B?Q3RYcnF4MVZNTGxTR0x5SkU0ZHhwZzR2WlVaOHhjMGcvVEFmTjlFdGQzUmpr?=
 =?utf-8?B?ejErUVpvSHVOeE93UGowNDIrVHZXOG51TkpGYWlLWU9EL1gzUkR3QXlMajly?=
 =?utf-8?Q?E7cbEjFv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 12:56:15.2280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 8090d449-e533-4bef-4e3f-08d89c41d03b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ghSBRmzIr/+5fcHfiM5QGXnbZzUqWkuZjBjDqJ/H85XBU1+yNzUSJ0dcgCOBrme+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmlybW95LAoKb2gsIG9rIHN1cmUuIEkgd2FzIHRoaW5raW5nIHRvIG1lcmdlIGl0IHRocm91
Z2ggYW1kLXN0YWdpbmctZHJtLW5leHQgCmluc3RlYWQsIGJ1dCBnb2luZyB0aHJvdWdoIGRybS1t
aXNjLW5leHQgaXMgZXZlbiBiZXR0ZXIuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgpBbSAwOS4xMi4y
MCB1bSAxMjo1NyBzY2hyaWViIE5pcm1veToKPiBIaSBDaHJpc3RpYW4sCj4KPgo+IENhbiB5b3Ug
cGxlYXNlIHBpY2sgdGhpcyB1cCBmb3IgZHJtLW1pc2MtbmV4dD8KPgo+Cj4gVGhhbmtzLAo+Cj4g
TmlybW95Cj4KPiBPbiAxMi85LzIwIDEyOjUxIFBNLCBOaXJtb3kgRGFzIHdyb3RlOgo+PiBCTyBj
cmVhdGVkIHdpdGggYW1kZ3B1X2JvX2NyZWF0ZV9yZXNlcnZlZCgpIHdhc24ndCBjbGVhbgo+PiBw
cm9wZXJseSBiZWZvcmUsIHdoaWNoIGNhdXNlczoKPj4KPj4gW8KgwqAgMjEuMDU2MjE4XSBXQVJO
SU5HOiBDUFU6IDAgUElEOiA3IGF0IAo+PiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jOjUx
OCB0dG1fYm9fcmVsZWFzZSsweDJiZi8weDMxMCBbdHRtXQo+PiA8c25pcD4KPj4gW8KgwqAgMjEu
MDU2NDMwXSBDYWxsIFRyYWNlOgo+PiBbwqDCoCAyMS4wNTY1MjVdwqAgYW1kZ3B1X2JvX3VucmVm
KzB4MWEvMHgzMCBbYW1kZ3B1XQo+PiBbwqDCoCAyMS4wNTY2MzVdwqAgYW1kZ3B1X3Zjbl9kZWNf
c2VuZF9tc2crMHgxYjIvMHgyNzAgW2FtZGdwdV0KPj4gW8KgwqAgMjEuMDU2NzQwXSBhbWRncHVf
dmNuX2RlY19nZXRfY3JlYXRlX21zZy5jb25zdHByb3AuMCsweGQ4LzB4MTAwIAo+PiBbYW1kZ3B1
XQo+PiBbwqDCoCAyMS4wNTY4NDNdwqAgYW1kZ3B1X3Zjbl9kZWNfcmluZ190ZXN0X2liKzB4Mjcv
MHgxODAgW2FtZGdwdV0KPj4gW8KgwqAgMjEuMDU2OTM2XcKgIGFtZGdwdV9pYl9yaW5nX3Rlc3Rz
KzB4ZjEvMHgxNTAgW2FtZGdwdV0KPj4gW8KgwqAgMjEuMDU3MDI0XSBhbWRncHVfZGV2aWNlX2Rl
bGF5ZWRfaW5pdF93b3JrX2hhbmRsZXIrMHgxMS8weDMwIAo+PiBbYW1kZ3B1XQo+PiBbwqDCoCAy
MS4wNTcwMzBdwqAgcHJvY2Vzc19vbmVfd29yaysweDFkZi8weDM3MAo+PiBbwqDCoCAyMS4wNTcw
MzNdwqAgd29ya2VyX3RocmVhZCsweDQ2LzB4MzQwCj4+IFvCoMKgIDIxLjA1NzAzNF3CoCA/IHBy
b2Nlc3Nfb25lX3dvcmsrMHgzNzAvMHgzNzAKPj4gW8KgwqAgMjEuMDU3MDM3XcKgIGt0aHJlYWQr
MHgxMWIvMHgxNDAKPj4gW8KgwqAgMjEuMDU3MDM5XcKgID8gX19rdGhyZWFkX2JpbmRfbWFzaysw
eDYwLzB4NjAKPj4gW8KgwqAgMjEuMDU3MDQzXcKgIHJldF9mcm9tX2ZvcmsrMHgyMi8weDMwCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IE5pcm1veSBEYXMgPG5pcm1veS5kYXNAYW1kLmNvbT4KPj4gUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4g
LS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y2UuYyB8IDIgKy0K
Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIHwgOSArKysrKyst
LS0KPj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNl
LmMgCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZjZS5jCj4+IGluZGV4
IGVjYWEyZDc0ODNiMi4uNzhhNGRkOWJmMTFmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdmNlLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3ZjZS5jCj4+IEBAIC0xMTUxLDYgKzExNTEsNiBAQCBpbnQgYW1kZ3B1X3Zj
ZV9yaW5nX3Rlc3RfaWIoc3RydWN0IGFtZGdwdV9yaW5nIAo+PiAqcmluZywgbG9uZyB0aW1lb3V0
KQo+PiDCoCBlcnJvcjoKPj4gwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPj4gwqDC
oMKgwqDCoCBhbWRncHVfYm9fdW5yZXNlcnZlKGJvKTsKPj4gLcKgwqDCoCBhbWRncHVfYm9fdW5y
ZWYoJmJvKTsKPj4gK8KgwqDCoCBhbWRncHVfYm9fZnJlZV9rZXJuZWwoJmJvLCBOVUxMLCBOVUxM
KTsKPj4gwqDCoMKgwqDCoCByZXR1cm4gcjsKPj4gwqAgfQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92Y24uYwo+PiBpbmRleCA3ZTE5YTY2NTY3MTUuLjkyMWI4MTA1NGMx
YiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5j
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwo+PiBAQCAt
NDY1LDYgKzQ2NSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Zjbl9kZWNfc2VuZF9tc2coc3RydWN0
IAo+PiBhbWRncHVfcmluZyAqcmluZywKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYW1kZ3B1X2pvYiAq
am9iOwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhbWRncHVfaWIgKmliOwo+PiDCoMKgwqDCoMKgIHVp
bnQ2NF90IGFkZHI7Cj4+ICvCoMKgwqAgdm9pZCAqbXNnID0gTlVMTDsKPj4gwqDCoMKgwqDCoCBp
bnQgaSwgcjsKPj4KPj4gwqDCoMKgwqDCoCByID0gYW1kZ3B1X2pvYl9hbGxvY193aXRoX2liKGFk
ZXYsIDY0LAo+PiBAQCAtNDc0LDYgKzQ3NSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3Zjbl9kZWNf
c2VuZF9tc2coc3RydWN0IAo+PiBhbWRncHVfcmluZyAqcmluZywKPj4KPj4gwqDCoMKgwqDCoCBp
YiA9ICZqb2ItPmlic1swXTsKPj4gwqDCoMKgwqDCoCBhZGRyID0gYW1kZ3B1X2JvX2dwdV9vZmZz
ZXQoYm8pOwo+PiArwqDCoMKgIG1zZyA9IGFtZGdwdV9ib19rcHRyKGJvKTsKPj4gwqDCoMKgwqDC
oCBpYi0+cHRyWzBdID0gUEFDS0VUMChhZGV2LT52Y24uaW50ZXJuYWwuZGF0YTAsIDApOwo+PiDC
oMKgwqDCoMKgIGliLT5wdHJbMV0gPSBhZGRyOwo+PiDCoMKgwqDCoMKgIGliLT5wdHJbMl0gPSBQ
QUNLRVQwKGFkZXYtPnZjbi5pbnRlcm5hbC5kYXRhMSwgMCk7Cj4+IEBAIC00OTIsNyArNDk0LDcg
QEAgc3RhdGljIGludCBhbWRncHVfdmNuX2RlY19zZW5kX21zZyhzdHJ1Y3QgCj4+IGFtZGdwdV9y
aW5nICpyaW5nLAo+Pgo+PiDCoMKgwqDCoMKgIGFtZGdwdV9ib19mZW5jZShibywgZiwgZmFsc2Up
Owo+PiDCoMKgwqDCoMKgIGFtZGdwdV9ib191bnJlc2VydmUoYm8pOwo+PiAtwqDCoMKgIGFtZGdw
dV9ib191bnJlZigmYm8pOwo+PiArwqDCoMKgIGFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYm8sIE5V
TEwsICh2b2lkICoqKSZtc2cpOwo+Pgo+PiDCoMKgwqDCoMKgIGlmIChmZW5jZSkKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgICpmZW5jZSA9IGRtYV9mZW5jZV9nZXQoZik7Cj4+IEBAIC01MDUsNyArNTA3
LDcgQEAgc3RhdGljIGludCBhbWRncHVfdmNuX2RlY19zZW5kX21zZyhzdHJ1Y3QgCj4+IGFtZGdw
dV9yaW5nICpyaW5nLAo+Pgo+PiDCoCBlcnI6Cj4+IMKgwqDCoMKgwqAgYW1kZ3B1X2JvX3VucmVz
ZXJ2ZShibyk7Cj4+IC3CoMKgwqAgYW1kZ3B1X2JvX3VucmVmKCZibyk7Cj4+ICvCoMKgwqAgYW1k
Z3B1X2JvX2ZyZWVfa2VybmVsKCZibywgTlVMTCwgKHZvaWQgKiopJm1zZyk7Cj4+IMKgwqDCoMKg
wqAgcmV0dXJuIHI7Cj4+IMKgIH0KPj4KPj4gQEAgLTc2MSw2ICs3NjMsNyBAQCBpbnQgYW1kZ3B1
X3Zjbl9lbmNfcmluZ190ZXN0X2liKHN0cnVjdCAKPj4gYW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcg
dGltZW91dCkKPj4gwqAgZXJyb3I6Cj4+IMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dChmZW5jZSk7
Cj4+IMKgwqDCoMKgwqAgYW1kZ3B1X2JvX3VucmVzZXJ2ZShibyk7Cj4+IC3CoMKgwqAgYW1kZ3B1
X2JvX3VucmVmKCZibyk7Cj4+ICvCoMKgwqAgYW1kZ3B1X2JvX2ZyZWVfa2VybmVsKCZibywgTlVM
TCwgTlVMTCk7Cj4+ICsKPj4gwqDCoMKgwqDCoCByZXR1cm4gcjsKPj4gwqAgfQo+PiAtLSAKPj4g
Mi4yOS4yCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
