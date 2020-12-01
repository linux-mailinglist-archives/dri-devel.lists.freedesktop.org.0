Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D62C9B19
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 10:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686946E4F8;
	Tue,  1 Dec 2020 09:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A756E4EA
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 09:13:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByyCXcoLIQ8zS95MAEp78L6Jm+kCpcIBAGIblTQJyseTxA8osIis8X/aND4JM7HXb+awBCMKV8tI6dcLGWWGkUkg1WN54IbrD/dtLDODNGBRs6zwp0HY1q4hMkOVc5G9ZSlvzNnzoC8IMu6duifeCSSMTVGzul/S01kzKysCeTG3FHFfAVjVdmtl5skojmVr9YSJHQuIvIV93PulrdelTRq4s5ksu421UQ6ZUMXLopEearQOVKgx2QvNQtWYZ+vn0iAP5DoF44ojct5g+uw2EnFONDL5x2fmevWxzz+iuGlL5hzG5uqzIjxQdaF7FebYvoY2+vWoWwmW5D8+LClDBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/qpuNK6zDZVtEZ614IYkZnSVKz1rtW5fTujfMbcE3Y=;
 b=h2VajFVjjm4s8vQ7sKHJLWAhWiMEwd1xc3b5OcAbdCruXxQS8uFknnwJMxUScD+TJUwe35mFPqsv3BOR8q+QzywevcKW8/wM/nTWcvTNmCGh7oqdLsG1O6Zwv+LkyGec5ZeKSZVuXiFA2LDCTPDPrXnADGR8L6rRRsxervj8dxyiwz7L5/bMvAByv26msTeCD7g1VaAR0D1JmWvS+q4DQ/AvHf0gJsU/vO5VbD1l8aRZIkERXXDx9ihb2zp6/ZUt7IncsbVqugG4iapnONqg0qTJyfnbfqNQ/22RB/QJFty7flQkzW62Rq8xsLV5hx3wn9zCSw7jz0pI0kPUbee8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/qpuNK6zDZVtEZ614IYkZnSVKz1rtW5fTujfMbcE3Y=;
 b=KgFQXeQJG9sHaQLjG2GuwYWeLvMEtogaE7H2CEN5E451Y3bDEKnMyFwTHuPTmDHe9AZc1QxsBckyvvxOVwCCJ3kXf0cp4q5C+DlY9UpoxInYixK06npgu08QuuJkPjK7hq274xkyuMi3B/RjqC6RVg8x/0RIRpkrHV8B/qDKk5o=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4535.namprd12.prod.outlook.com (2603:10b6:208:267::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 09:13:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 09:13:56 +0000
Subject: Re: [PATCH 1/8] drm/gem: Write down some rules for vmap usage
To: Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>
References: <20201130120433.7205-1-tzimmermann@suse.de>
 <20201130120433.7205-2-tzimmermann@suse.de>
 <20201130153048.GS401619@phenom.ffwll.local>
 <092068b8-1f3d-4fc8-48fb-cc5dc33ae7c5@amd.com>
 <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <70e396bf-e8a3-4871-7ad1-4a90298d8461@amd.com>
Date: Tue, 1 Dec 2020 10:13:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <0237fafc-f57e-b60b-f92c-0b0a79e9448e@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR07CA0023.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::36) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0023.eurprd07.prod.outlook.com (2603:10a6:208:ac::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.6 via Frontend Transport; Tue, 1 Dec 2020 09:13:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ad65d5d6-63c7-4166-f646-08d895d96e49
X-MS-TrafficTypeDiagnostic: MN2PR12MB4535:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4535D51CD2C054C24E4AB6B583F40@MN2PR12MB4535.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zbus+28bRN7cxqNim+z5fOSgXSpGqsSjNLcit/Sf2X51d7gBfYHyhc9NCwuAGxxb3jg7JBZ3AlyBL1mMyKl2xr6tqKnikWfImOb3cfq139ThNM4XoJ5SV5loJ+82nvdKGDzyeI4/3WOXMIAiCh4qIXQjjWTbzSZrFkws/TdZ76g2jsdMlC/LqGwVZ5s3npW7eaMf1aGnsKOVXw3nm16GbJAE64zfgt3P9GJZH6zfo4o5YIVjpy/aFnPU3wmu4bGeKA/pklnFSG9rZgvX8FfpkfcRCYGP18d5HTL2SgWG+skqyqj/5S3D3YdHL/XYzyoa2KCdKLBu50FYnLloqVbT3+ZQ5SugdxsnYfro4gc6rU6M1UM27BFJevVdwUJJmwyd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(66574015)(86362001)(52116002)(6486002)(5660300002)(110136005)(66476007)(83380400001)(66946007)(6666004)(66556008)(316002)(31696002)(8676002)(4326008)(31686004)(2906002)(186003)(16526019)(8936002)(2616005)(478600001)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NE9yQmpzeXVlOE1tek9ldGdLckEzL1VLVDMzS3hCbklKcXd3REpXNmxOeDhs?=
 =?utf-8?B?ZGZ5R0phaXhLMnBZcFFYTk1pYUt4YkFGUklSYXk0MTRNVVlWTnZOVEJsWFJn?=
 =?utf-8?B?KzNpaWhiTkxVQ3NCQmxIWGVKV091c3NRNWhXMlBFVEJkRlhrSEdDRzBvQTZC?=
 =?utf-8?B?UmZ2cVE3Wmk3TXJKNTJJUnFhVWlKWDkvTXB1aWU0UlhzZFU0VVIxRDM1Tjc2?=
 =?utf-8?B?VU9zQU1JM1pTZ1JjWjBJZGMvbTVUbDVVYTNkOTJkUDBRLzFFb2VranhsbCth?=
 =?utf-8?B?azB3NUtVdGVsR01FbE4wZVdpQk1PZlBXKzdPUGpSaHV3N01NaFMwRG1ib09D?=
 =?utf-8?B?MXpLcStOUkRmQVRlbmp2Wk5XRWtIbVpNaWc2cjJkY1J3NnFPakl5SFVvVmNV?=
 =?utf-8?B?WG9od254S1JSTnprNG5nN04yQklhNzQ0cmthYU92b0YvN3VIcEZzZTRnWnA1?=
 =?utf-8?B?R0k3QzhxVlNLOXpDYmhOWGxvcUtNelU0MVFqZ0VWU1orKzNnLys1cmNna2s1?=
 =?utf-8?B?ZmhuYUxWOC9iUGYzT2RxSVgvU3oxRC9Sbks0d2dpdzc1WTdEUjdoVTNQZlJt?=
 =?utf-8?B?MXFGR01CenMrKyt2cGVXa3BINnFsaEtOdnY3NVVHYjFhZHJHTFNLcGptblp3?=
 =?utf-8?B?Zkh2c1JORmF3WSs4NWlUaEp4dHNpUjMrU2pwMkJNcDFiN256Z01xVmtaUHdB?=
 =?utf-8?B?Z0ZacEJsbVFubVRTcWZiWTdjWEVoZVZaUnpNVzE2Z1BJRFNLMWhXYXNxemhh?=
 =?utf-8?B?R1NVVWpJVmJDL3EvUE1kbzc4TEhGMURsVU53b2p4aHZZOHprTE8vNHppNlBC?=
 =?utf-8?B?NEdtN2lRZkZnUE90YjFGNjBIQ2FoOEdhVVhxMTkxNDJpNWh2ZmVKclpZNnpN?=
 =?utf-8?B?VFBKcmxOQVQ3SFFoTHRmS0NlQklEaDU5cDUxMFduQ3BWRi9pY0c4cG5KVm5n?=
 =?utf-8?B?NXpydmZKOHVXS0NvUDJiRE5uYkdTSUdSN3BKM1loWXhSWVhMemdjQU9MUmts?=
 =?utf-8?B?MUFqN0d2YmgrK0pWTVJwRHhTWGd3QzJkb2d6TUtCMFFVOTYyYVdzdzZuNHk1?=
 =?utf-8?B?cHRiWHRXTnFaRnVpMlNtVFRjd3RYU1FMSTVJdFlRbks1REFrYVYxeVdIdmtF?=
 =?utf-8?B?TnltT1hQTWVaTHpWQldNOVdxbm5tTFphYVFDdTNNVEZtOXJad3l5OGtHYWpQ?=
 =?utf-8?B?blVjWGFwckk5VXZ1Y1NiSzBTZGtheEkvOEU4RjdJU3U4WkxPZENrMmN1Q0d5?=
 =?utf-8?B?eDBoWjNHWkcrOURHdjNLWHN5UE5YbmNYVVM4STExejBiMWgyMXY2YVRCYmpU?=
 =?utf-8?B?RkU1ZlptWFFLZ0orNERHZWkrdE5QZW9Za2tWd3RGYVJUK09wclp5Z1hpeUhR?=
 =?utf-8?B?em9MaWVZMzdrL0RWeGIyZnJiUDFpQ01HYXFqcHVZUmhnNVVFZ1pFalRwN0p0?=
 =?utf-8?Q?dkfMx/3L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad65d5d6-63c7-4166-f646-08d895d96e49
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 09:13:56.6386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vFH3ZQN88dEQa+rXSUFCvuhgufkMbnOpVaYz4mJnoDIlsGoWpxgOfODXlBXyhrTH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4535
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org, hdegoede@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDEuMTIuMjAgdW0gMDk6MzIgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMzAuMTEuMjAgdW0gMTY6MzMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+PiBBbSAzMC4x
MS4yMCB1bSAxNjozMCBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+PiBPbiBNb24sIE5vdiAzMCwg
MjAyMCBhdCAwMTowNDoyNlBNICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPj4+PiBN
YXBwaW5nIGEgR0VNIG9iamVjdCdzIGJ1ZmZlciBpbnRvIGtlcm5lbCBhZGRyZXNzIHNwYWNlIHBy
ZXZlbnRzIHRoZQo+Pj4+IGJ1ZmZlciBmcm9tIGJlaW5nIGV2aWN0ZWQgZnJvbSBWUkFNLCB3aGlj
aCBpbiB0dXJuIG1heSByZXN1bHQgaW4KPj4+PiBvdXQtb2YtbWVtb3J5IGVycm9ycy4gSXQncyB0
aGVyZWZvcmUgcmVxdWlyZWQgdG8gb25seSB2bWFwIEdFTSBCT3MgZm9yCj4+Pj4gc2hvcnQgcGVy
aW9kcyBvZiB0aW1lOyB1bmxlc3MgdGhlIEdFTSBpbXBsZW1lbnRhdGlvbiBwcm92aWRlcyAKPj4+
PiBhZGRpdGlvbmFsCj4+Pj4gZ3VhcmFudGVlcy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+Pj4+IC0tLQo+Pj4+IMKgIGRy
aXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyB8wqAgNiArKysrKysKPj4+PiDCoCBpbmNsdWRlL2Ry
bS9kcm1fZ2VtLmjCoMKgwqDCoMKgwqAgfCAxNiArKysrKysrKysrKysrKysrCj4+Pj4gwqAgMiBm
aWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4+
Pj4gaW5kZXggN2RiNTVmY2UzNWQ4Li45YzllY2U5ODMzZTAgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9w
cmltZS5jCj4+Pj4gQEAgLTY2OSw2ICs2NjksMTIgQEAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX3Vu
bWFwX2RtYV9idWYpOwo+Pj4+IMKgwqAgKiBjYWxsYmFjay4gQ2FsbHMgaW50byAmZHJtX2dlbV9v
YmplY3RfZnVuY3Mudm1hcCBmb3IgZGV2aWNlIAo+Pj4+IHNwZWNpZmljIGhhbmRsaW5nLgo+Pj4+
IMKgwqAgKiBUaGUga2VybmVsIHZpcnR1YWwgYWRkcmVzcyBpcyByZXR1cm5lZCBpbiBtYXAuCj4+
Pj4gwqDCoCAqCj4+Pj4gKyAqIFRvIHByZXZlbnQgdGhlIEdFTSBvYmplY3QgZnJvbSBiZWluZyBy
ZWxvY2F0ZWQsIGNhbGxlcnMgbXVzdCAKPj4+PiBob2xkIHRoZSBHRU0KPj4+PiArICogb2JqZWN0
J3MgcmVzZXJ2YXRpb24gbG9jayBmcm9tIHdoZW4gY2FsbGluZyB0aGlzIGZ1bmN0aW9uIHVudGls
IAo+Pj4+IHJlbGVhc2luZyB0aGUKPj4+PiArICogbWFwcGluZy4gSG9sZGluZyBvbnRvIGEgbWFw
cGluZyBhbmQgdGhlIGFzc29jaWF0ZWQgcmVzZXJ2YXRpb24gCj4+Pj4gbG9jayBmb3IgYW4KPj4+
PiArICogdW5ib3VuZCB0aW1lIG1heSByZXN1bHQgaW4gb3V0LW9mLW1lbW9yeSBlcnJvcnMuIENh
bGxzIHRvIAo+Pj4+IGRybV9nZW1fZG1hYnVmX3ZtYXAoKQo+Pj4+ICsgKiBzaG91bGQgdGhlcmVm
b3JlIGJlIGFjY29tcGFuaWVkIGJ5IGEgY2FsbCB0byAKPj4+PiBkcm1fZ2VtX2RtYWJ1Zl92dW5t
YXAoKS4KPj4+PiArICoKPj4+PiDCoMKgICogUmV0dXJucyAwIG9uIHN1Y2Nlc3Mgb3IgYSBuZWdh
dGl2ZSBlcnJubyBjb2RlIG90aGVyd2lzZS4KPj4+IFRoaXMgaXMgYSBkbWEtYnVmIGhvb2ssIHdo
aWNoIG1lYW5zIGp1c3QgZG9jdW1lbnRpbmcgdGhlIHJ1bGVzIHlvdSdkIAo+Pj4gbGlrZQo+Pj4g
dG8gaGF2ZSBoZXJlIGlzbid0IGVub3VnaC4gV2UgbmVlZCB0byByb2xsIHRoaXMgb3V0IGF0IHRo
ZSBkbWEtYnVmIAo+Pj4gbGV2ZWwsCj4+PiBhbmQgZW5mb3JjZSBpdC4KPj4+Cj4+PiBFbmZvcmNl
IGl0ID0gYXNzZXJ0X2xvY2tfaGVsZAo+Pj4KPj4+IFJvbGwgb3V0ID0gcmV2aWV3IGV2ZXJ5b25l
LiBCZWNhdXNlIHRoaXMgZ29lcyB0aHJvdWdoIGRtYS1idWYgaXQnbGwgCj4+PiBjb21lCj4+PiBi
YWNrIHRocm91Z2ggc2htZW0gaGVscGVycyAoYW5kIG90aGVyIGhlbHBlcnMgYW5kIG90aGVyIHN1
YnN5c3RlbXMpIAo+Pj4gYmFjawo+Pj4gdG8gYW55IGRyaXZlciB1c2luZyB2bWFwIGZvciBncHUg
YnVmZmVycy4gVGhpcyBpbmNsdWRlcyB0aGUgbWVkaWEKPj4+IHN1YnN5c3RlbSwgYW5kIHRoZSBt
ZWRpYSBzdWJzeXN0ZW0gZGVmaW5pdGVseSBkb2Vzbid0IGNvcGUgd2l0aCBqdXN0Cj4+PiB0ZW1w
b3JhcmlseSBtYXBwaW5nIGJ1ZmZlcnMuIFNvIHRoZXJlIHdlIG5lZWQgdG8gcGluIHRoZW0sIHdo
aWNoIEkgCj4+PiB0aGluawo+Pj4gbWVhbnMgd2UnbGwgbmVlZCAyIHZlcnNpb24gb2YgZG1hX2J1
Zl92bWFwIC0gb25lIHRoYXQncyB0ZW1wb3JhcnkgYW5kCj4+PiByZXF1aXJlcyB3ZSBob2xkIGRt
YV9yZXN2IGxvY2ssIHRoZSBvdGhlciByZXF1aXJlcyB0aGF0IHRoZSBidWZmZXIgaXMKPj4+IHBp
bm5lZC4KPj4KPj4gT1Igc3RhcnQgdG8gcHJvcGVyIHVzZSB0aGUgZG1hX2J1Zl9waW4vZG1hX2J1
Zl91bnBpbiBmdW5jdGlvbnMgd2hpY2ggCj4+IEkgYWRkZWQgdG8gY292ZXIgdGhpcyB1c2UgY2Fz
ZSBhcyB3ZWxsLgo+Cj4gV2hpbGUgSSBnZW5lcmFsbHkgYWdyZWUsIGhlcmUgYXJlIHNvbWUgdGhv
dWdodHM6Cj4KPiBJIGZvdW5kIGFsbCBnZW5lcmljIHBpbiBmdW5jdGlvbnMgdXNlbGVzcywgYmVj
YXVzZSB0aGV5IGRvbid0IGFsbG93IAo+IGZvciBzcGVjaWZ5aW5nIHdoZXJlIHRvIHBpbi4gV2l0
aCBmYmRldiBlbXVsYXRpb24sIHRoaXMgbWVhbnMgdGhhdCAKPiBjb25zb2xlIGJ1ZmZlcnMgbWln
aHQgbmV2ZXIgbWFrZSBpdCB0byBWUkFNIGZvciBzY2Fub3V0LiBJZiBhbnl0aGluZywgCj4gdGhl
IHBvbGljeSBzaG91bGQgYmUgdGhhdCBwaW4gYWx3YXlzIHBpbnMgaW4gSFctYWNjZXNzaWJsZSBt
ZW1vcnkuCgpZZXMsIGNvbXBsZXRlbHkgYWdyZWUuIFRoZSBtYWpvciBtaXNzaW5nIHBhcnQgaGVy
ZSBhcmUgc29tZSBraW5kIG9mIAp1c2FnZSBmbGFncyB3aGF0IHdlIHdhbnQgdG8gZG8gd2l0aCB0
aGUgYnVmZmVyLgoKPgo+IFBpbiBoYXMgcXVpdGUgYSBiaXQgb2Ygb3ZlcmhlYWQgKG1vcmUgbG9j
a2luZywgYnVmZmVyIG1vdmVtZW50KSwgc28gaXQgCj4gc2hvdWxkIGJlIHRoZSBzZWNvbmQgY2hv
aWNlIGFmdGVyIHJlZ3VsYXIgdm1hcC4gVG8gbWFrZSBib3RoIHdvcmsgCj4gdG9nZXRoZXIsIHBp
biBwcm9iYWJseSByZWxpZXMgb24gaG9sZGluZyB0aGUgcmVzZXJ2YXRpb24gbG9jayBpbnRlcm5h
bGx5LgoKVGhlcmUgaXMgYSBkbWFfcmVzdl9hc3NlcnRfaGVsZCgpIGF0IHRoZSBiZWdpbm5pbmcg
b2YgdGhvc2UgdHdvIGZ1bmN0aW9ucy4KCj4KPiBUaGVyZWZvcmUgSSB0aGluayB3ZSBzdGlsbCB3
b3VsZCB3YW50IHNvbWUgYWRkaXRpb25hbCBoZWxwZXJzLCBzdWNoIGFzOgo+Cj4gwqAgcGluX3Vu
bG9ja2VkKCksIHdoaWNoIGFjcXVpcmVzIHRoZSByZXN2IGxvY2ssIGNhbGxzIHJlZ3VsYXIgcGlu
IGFuZCAKPiB0aGVuIGRyb3BzIHRoZSByZXN2IGxvY2suIFNhbWUgZm9yIHVucGluX3VubG9ja2Vk
KCkKPgo+IMKgIHZtYXBfcGlubmVkKCksIHdoaWNoIGVuZm9yY2VzIHRoYXQgdGhlIGJ1ZmZlciBo
YXMgYmVlbiBwaW5uZWQgYW5kIAo+IHRoZW4gY2FsbHMgcmVnYWxhciB2bWFwLiBTYW1lIGZvciB2
dW5tYXBfcGlubmVkKCkKCkkgd291bGQgcmF0aGVyIG9wZW4gY29kZSB0aGF0IGluIGVhY2ggZHJp
dmVyLCBoaWRpbmcgdGhlIGxvY2tpbmcgbG9naWMgCmluIHNvbWUgbWlkbGF5ZXIgaXMgdXN1YWxs
eSBub3QgYSBnb29kIGlkZWEuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gQSB0eXBpY2FsIHBh
dHRlcm4gd2l0aCB0aGVzZSBmdW5jdGlvbnMgd291bGQgbG9vayBsaWtlIHRoaXMuCj4KPiDCoMKg
wqDCoGRybV9nZW1fb2JqZWN0IGJvOwo+IMKgwqDCoMKgZG1hX2J1Zl9tYXAgbWFwOwo+Cj4gwqDC
oMKgwqBpbml0KCkgewo+IMKgwqDCoMKgwqDCoMKgIHBpbl91bmxvY2tlZChibyk7Cj4gwqDCoMKg
wqDCoMKgwqAgdm1hcF9waW5uZWQoYm8sIG1hcCk7Cj4gwqDCoMKgwqB9Cj4KPiDCoMKgwqDCoHdv
cmtlcigpIHsKPiDCoMKgwqDCoMKgwqDCoCBiZWdpbl9jcHVfYWNjZXNzKCkKPiDCoMKgwqDCoMKg
wqDCoCAvLyBhY2Nlc3MgYm8gdmlhIG1hcAo+IMKgwqDCoMKgwqDCoMKgIGVuZF9jcHVfYWNjZXNz
KCkKPiDCoMKgwqDCoH0KPgo+IMKgwqDCoMKgZmluaSgpIHsKPiDCoMKgwqDCoMKgwqDCoCB2dW5t
YXBfcGlubmVkKGJvLCBtYXApOwo+IMKgwqDCoMKgwqDCoMKgIHVucGluX3VubG9ja2VkKGJvKTsK
PiDCoMKgwqDCoH0KPgo+IMKgwqDCoMKgaW5pdCgpCj4gwqDCoMKgwqB3aGlsZSAoLi4uKSB7Cj4g
wqDCoMKgwqDCoMKgwqAgd29ya2VyKCkKPiDCoMKgwqDCoH0KPiDCoMKgwqDCoGZpbmkoKQo+Cj4g
SXMgdGhhdCByZWFzb25hYmxlIGZvciBtZWRpYSBkcml2ZXJzPwo+Cj4gQmVzdCByZWdhcmRzCj4g
VGhvbWFzCj4KPgo+Pgo+PiBDaGVlcnMsCj4+IENocmlzdGlhbi4KPj4KPj4+Cj4+PiBUaGF0J3Mg
d2hhdCBJIG1lYW50IHdpdGggdGhhdCB0aGlzIGFwcHJvYWNoIGhlcmUgaXMgdmVyeSBzcHJhd2xp
bmcgOi0vCj4+PiAtRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
