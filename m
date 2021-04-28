Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9738336DD73
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 18:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E73B6E3F2;
	Wed, 28 Apr 2021 16:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700EC6E3F2;
 Wed, 28 Apr 2021 16:49:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JjOwI4u6noy6eAjs9y+K+1rKC/ObFHES0jS+W4JR436NGtG1+KBSpvppvanhZn9jKW4B8sYlNn2wsW+TlkJugNA0V6Oog8bdTdZxg5BgvQKtVfKSj9HbDir3j4GLZdCxn6glN6zAKVyel8IDbuV0+hrR3cf2cxKOGXT6Xjvx5RHrWdEs6JGm5RgKAncDkhPvnveoU5B8hQh8jMxdvw5TxdNmAgTlQd7N3SwXJjATINe5lO6e+rAsBeG389+vuJ0ZppxnyJ+S4LAIdk47ZyhCoRi2YgvCdyIqhaYUKU1S7D+Pd8yd69pvv0lYbdaN+p8Svrh0z0RNhQStG5uiQII+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fh1SkGsnPExvJFVbntaOtq3Ob3u+O0gGj11zGSL+11c=;
 b=fsLDbYP+j2e8h30IrpVq4H7Nj9+lHk4KB71WRmlHf1ZV6uXM13W4kG/OB7e3bFSVXCsScSsvXQhVYjbjxzMJsmj9+LQ4HcPlVxeNPo1vCpQNYBplcFIpnfJroOC8M826X7/+qoVfJT20iPSgXno/pf3RjtE8prEEmb3R+EzHp7t0nhV6mqDMGC88rpPK49DBhUo5q2Q2veWiqywWvNlY5cPFSmgAT47+m/Eo8jhLfc7Qsg7anAV7yq1vg7xzpK7k7vf2+iZqAISMuUjLs03yM0X0TWdGhn7TKqgUCILIFqJXzK/MR9SMfeEJJn6QJiG07xYBrE/dpo+5nxNculvL0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fh1SkGsnPExvJFVbntaOtq3Ob3u+O0gGj11zGSL+11c=;
 b=ZAXr34khSJ1qtM1WQ2RDSW00mXHdUBbGqh9tqVOruw3TljoyoOAObeHxbv7I+ZhR0tml2LIeKYtPA5kGBlxC4h5DFoj6ZvRvb2V8fzTFKT9YFjAHchCrP7jJcX94w++92zIJm2WEQJSts3eyZQQnPFhwiKpzzlmbz1MZ4xHf9Mg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB2355.namprd12.prod.outlook.com (2603:10b6:207:3f::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Wed, 28 Apr
 2021 16:49:05 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 28 Apr 2021
 16:49:05 +0000
Subject: Re: [PATCH 1/2] drm/ttm: Don't evict SG BOs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210428053338.11560-1-Felix.Kuehling@amd.com>
 <af825fa4-abb3-69a6-48cd-0a6252f72503@gmail.com>
 <83a52589-ce81-35b1-e85d-e9485f9bc233@amd.com>
 <daf8b801-a79c-6033-f782-11ec1951957b@gmail.com>
 <4df6e459-5d14-806d-05b4-95fa8d196b59@amd.com>
 <0fba1262-8fbf-37f0-4d51-c4d74476894b@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <aabcf10f-7c78-2374-bb3a-d25bf5914ee0@amd.com>
Date: Wed, 28 Apr 2021 12:49:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <0fba1262-8fbf-37f0-4d51-c4d74476894b@gmail.com>
Content-Language: en-US
X-Originating-IP: [142.182.183.69]
X-ClientProxiedBy: YT2PR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::33) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.183.69) by
 YT2PR01CA0028.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 16:49:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9bfc663-8e97-4be9-1a25-08d90a6588c4
X-MS-TrafficTypeDiagnostic: BL0PR12MB2355:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2355E7FB807CD6E2C324EC7F92409@BL0PR12MB2355.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iefK37NIuCe2gBrfxzsz+CH7K9ofxbBax/y8Fl/uUE3h7HrraRqTBhTyHkiLn9sWM90zH+h8f61VM0TiCVU9e5AgTAIgeflZYNPWBRUJheX+rTPm4NtTMHkv+hyeiJ/M8WtTB4iwRKsjNkBC4nERMRYnbpSDVw3juVv9MLf7ZVs9MVzgcMwbYEOA2fKh8MutgjUUfcfqJAIST3pvOLdm8elX10OMvV/LUWQQrZJDixkfwreaS8gAgF1r1MX5Hh/3ogNxMz14PCOrEHKMRz1HN+zcH5iBdf2lOOjzDUQbwz0MxHbYF3EJ/Mw30FyCsn9NONzjTorQcmgt+YaM5NiMUDO3VN0RNrQuwcGtS70tzBEhHRwilWFiB9kO5CaVyAjTglUbPwnTGpUxZQ8W2ZbSAK3sspRwqlomz0iiDXJDXYtNV0fAwrmkACW84vMrUxh/KLN3nv6NteJcwalI6T9rmoxgg8FVKG7/t9qjsLdUVefBvA2D4NkbtsHXRS2+Pqpo3NNjZMHzl8vo+HmBNwlQhR9DL41HQHu8vQOR2VpoQqaKL/LBFs3q9Bw4iTHDFa9p0ylRpvvqs0+4rIJwfBV2f9LRUw8jJ9GaC2DryQou25fhgxh5Q0SIOCStowTmeeeDOvUxF+x+4KKYeTAmmKHdGuBb6ndg2RFJZcecK94yjbf0uSfSOKEorSwXuKbYgTeH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(316002)(16526019)(186003)(16576012)(38100700002)(36756003)(956004)(26005)(2616005)(6486002)(5660300002)(8676002)(66946007)(2906002)(31696002)(478600001)(83380400001)(86362001)(66556008)(8936002)(66476007)(31686004)(44832011)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QzR5T1FjdVlPM25FbUczWUZOS1VPaFlFaHhvSDg4Yyt1YmVDekxzcHJ6aWZ6?=
 =?utf-8?B?dzZqSk1Bb3lBblp4RmVkdklHODhUc01xa0xiTTlGdXdvQ3dYZFR5WnR6UTdG?=
 =?utf-8?B?WlhSQmVKRGRKSWptVDVyMGR5YVZyVExtVnRySnJieE5pWFFGUk1VVll3cWt1?=
 =?utf-8?B?NHV1TFAxK0pmWi9DTndJQUgrMUZqQ0xBY2FHMW5tK0JreXFoV25wRVR1eEpE?=
 =?utf-8?B?MExjV1Y1anRyVUxlN1lkOStsK2ROOTBGNVFVQnpkNHpuVHp1bGlXRExYenox?=
 =?utf-8?B?SXpHQ2gwVFpXbkRlekNoRUwxRDRIeUpGZXFEQzZaUjJ1STV4SFh4a3NzcEhO?=
 =?utf-8?B?cWhhcEE3d3NZOUF5aU5Xb1puQjhtYTdRRFQ1Z3NhTWQrU0dQN1ZLWWFMWnky?=
 =?utf-8?B?VGZ5L3JjTE5BNjRYNENLaHRnNmEvbDRXQnNjaVNKcmhuVXpuT3NJVVRTRGt6?=
 =?utf-8?B?dTIxd2RrK1cvR0wvR0djMTdUdGRqUUo1S2NvMHNVQkVhQ3pMRG5GMGF0K0d1?=
 =?utf-8?B?YjBPRGptNTNTOXN6VkVKTDk3M25NOGFrdUIxdHNHbC92TTVGc21nSnZFWnZF?=
 =?utf-8?B?KzZqd0ZmeG95Y3JzZFFUSG5UY0EwZXhRcUUzQUZseUEwV0gwK1BMYXBkTzBv?=
 =?utf-8?B?bUJKaDc0Snl3SVZ1R2NadjA4UnJTdGhEU1F3aWVGRklDR29qRjAzckh1bnF5?=
 =?utf-8?B?bFpzNkJ2WVVGdm5KL3JzaXJMVEpCQk5VNnJtbGtqaU1OSkNyd0l0OW1RTnpv?=
 =?utf-8?B?dTZ3Z0krT1piV3hPckxSclhWOGNqS1V2bEo4VHUrb2F0ZXlXdEJsVXJNQmhF?=
 =?utf-8?B?WkNyUTVCV3FIMmEyaXJ5anZmMEdyTzRYbTU2ZGxoSFdzcnBvSThWcWZ6eTRW?=
 =?utf-8?B?SUFtL2RhdjdhOXV0NERONkx1TXNYUFNIQUkrdi8wQkJJa2FXNVJVdWFocmZ4?=
 =?utf-8?B?QWljZ1pocnZibXlTVjRjbG54RE9maVF6bUkvY0ZWY0orY3hScnlWRW4wU1BU?=
 =?utf-8?B?bGw4MHBFSmNmanRuSVVqY3NWakhqekswbFFjbHQwZHdjZ2dGNkQ1U1FoMnF0?=
 =?utf-8?B?RzZTVU1NSjJTS1ZvdzBaR2xETGlEU1JPcldQMG0rN1p0Ty9ZOXdOTW1ucU4v?=
 =?utf-8?B?VS9kYlhUOWt4UGlmYUQ2NTVSWG9xM2RQS1JGUmIyL21tMi9ZNFpvVkFjWCs2?=
 =?utf-8?B?QS9OWTRVOEQ4dWJJVUhxK2FDaG1hL3NqNDVBcEFOYWhtUHJOcUloY1pPRDdN?=
 =?utf-8?B?S3FWMFRQZUQxb2c0b0hYWlIxaFl3NGsrTStKVjZ3L3I0SnNCeWpVSGFCYWtj?=
 =?utf-8?B?aEJpUHk5bHl4dUdGeXN6cjJGUzdONVZJMVhJc21SWTJ2c1UrUjZKWXlSTWpD?=
 =?utf-8?B?WGgxcWgvMHNWK1VQM2pya1ZKRXBzRGlNKzRYU0xmeUlqVFFEeW01WU5iV0w4?=
 =?utf-8?B?OWZSZjhoaG5OOEIrNmJibTNqQzlHY1Z2NGtXSzFjQk5ZMEpmcUZDNkFpYnJI?=
 =?utf-8?B?blpZUFZLdE81UnF0VDQ1WVZhc3FVQlU1RzVHdWRrZFczVXBndFdheFlONytB?=
 =?utf-8?B?WVRoTzh6K0Y0SmxIK2crV2R3STExZnVJeENNVWNCaERuakYxeTZwM1JUbTlS?=
 =?utf-8?B?ZVVkeTBPbXVRRGFKZXdYQUhmR2VrNTA1dGpWSE1laEJ6TGNnNzBVQlN6Wm1x?=
 =?utf-8?B?RDFnR3lkeTJpUGpYT2VSK201WlVhZ2dONUpheHZjUzdiMEJQMjJJZWU0VWx6?=
 =?utf-8?Q?DwGWwaUlzPDMJDcm0Z/KR0251oG5dxEgd1haeNr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9bfc663-8e97-4be9-1a25-08d90a6588c4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 16:49:05.3995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1s6tyaLdJNqyif5bwQNHAoewNe02Vz/DQnrlhIUle6WHaaDo/v0jUOBCuF+d2+JyhO8HnSzqDVRVwg9bE4bR7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2355
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0yOCB1bSAxMjozMyBwLm0uIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiBB
bSAyOC4wNC4yMSB1bSAxNzoxOSBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+PiBBbSAyMDIxLTA0
LTI4IHVtIDU6MDUgYS5tLiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+IFtTTklQXQo+PiBI
bW0sIEkgd2FzIG1pc3Npbmcgc29tZXRoaW5nLiBUaGUgYW1kZ3B1X2d0dF9tZ3IgZG9lc24ndCBh
Y3R1YWxseQo+PiBhbGxvY2F0ZSBzcGFjZSBmb3IgbWFueSBCT3M6Cj4+Cj4+IMKgwqDCoMKgwqDC
oMKgwqAgaWYgKCFwbGFjZS0+bHBmbikgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBtZW0tPm1tX25vZGUgPSBOVUxMOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBtZW0tPnN0YXJ0ID0gQU1ER1BVX0JPX0lOVkFMSURfT0ZGU0VUOwo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gwqDCoMKgwqDCoMKgwqDCoCB9Cj4+
Cj4+IEkgdGhpbmsgb3VyIHVzZXJwdHIgQk9zIGRvbid0IGhhdmUgbW1fbm9kZXMgYW5kIGRvbid0
IHVzZSBHVFQgc3BhY2UuIFNvCj4+IEkgY291bGQgYWRkIGEgY2hlY2sgZm9yIHRoYXQgdG8gYW1k
Z3B1X3R0bV9ib19ldmljdGlvbl92YWx1YWJsZS4KPgo+IFRoYXQncyBmb3IgYWxsb2NhdGluZyBH
QVJUIHNwYWNlIGFuZCBjb21wbGV0ZWx5IHVucmVsYXRlZCBoZXJlLgoKQWgsIEkgc2VlLCB0aGUg
R1RUIHNwYWNlIGFsbG9jYXRpb24gZG9lc24ndCB1c2UgYW4gbW1fbm9kZSwgYnV0IGp1c3QgdGhl
Cm1nci0+YXZhaWxhYmxlIGF0b21pYyBjb3VudGVyLgoKCj4KPiBbU05JUF0KPj4+PiBGYWlsaW5n
IHRoYXQsIEknZCBwcm9iYWJseSBoYXZlIHRvIGFiYW5kb24gdXNlcnB0ciBCT3MgYWx0b2dldGhl
ciBhbmQKPj4+PiBzd2l0Y2ggc3lzdGVtIG1lbW9yeSBtYXBwaW5ncyBvdmVyIHRvIHVzaW5nIHRo
ZSBuZXcgU1ZNIEFQSSBvbiBzeXN0ZW1zCj4+Pj4gd2hlcmUgaXQgaXMgYXZhbGlhYmxlLgo+Pj4g
V2VsbCBhcyBsb25nIGFzIHRoYXQgcHJvdmlkZXMgdGhlIG5lY2Vzc2FyeSBmdW5jdGlvbmFsaXR5
IHRocm91Z2ggSE1NCj4+PiBpdCB3b3VsZCBiZSBhbiBvcHRpb24uCj4+IEp1c3QgYW5vdGhlciB3
YXkgb2YgY2lyY3VtdmVudGluZyAiSXQgc2hvdWxkIGxpbWl0IHRoZSBhbW91bnQgb2Ygc3lzdGVt
Cj4+IG1lbW9yeSB0aGUgR1BVIGNhbiBhY2Nlc3MgYXQgdGhlIHNhbWUgdGltZSwiIGEgcHJlbWlz
ZSBJIGRpc2FncmVlIHdpdGgKPj4gaW4gY2FzZSBvZiB1c2VycHRycyBhbmQgSE1NLiBCb3RoIHVz
ZSBwYWdlYWJsZSwgdW5waW5uZWQgbWVtb3J5Lgo+Cj4+IEJvdGggY2FuIGNhdXNlIHRoZSBHUFUg
dG8gYmUgcHJlZW1wdGVkIGluIGNhc2Ugb2YgTU1VIGludGVydmFsCj4+IG5vdGlmaWVycy4KPgo+
IFdlbGwgdGhhdCdzIHRoZSBrZXkgcG9pbnQuIEdGWCB1c2VycHRycyBhbmQgRE1BLWJ1ZiBpbXBv
cnRzIGNhbid0IGJlCj4gcHJlZW1wdGVkLgoKQnV0IHRoZXkgZG9uJ3QgbmVlZCB0byBiZS4gVGhl
eSBkb24ndCB1c2UgYW55IHJlc291cmNlcyBvbiB0aGUgaW1wb3J0aW5nCkdQVSBvciBzeXN0ZW0g
bWVtb3J5LCBzbyB3aHkgZG8gd2UgbGltaXQgdGhlbT8KCldpdGggZHluYW1pYyBhdHRhY2htZW50
LCB0aGUgZXhwb3J0ZWQgQk9zIGNhbiBiZSBldmljdGVkIGFuZCB0aGF0CmFmZmVjdHMgdGhlIGlt
cG9ydHMgYXMgd2VsbC4gSSBkb24ndCBzZWUgd2h5IHRoZSBpbXBvcnQgbmVlZHMgdG8gYmUKZXZp
Y3RlZCBhcyBpZiB0aGVyZSB3YXMgc29tZSByZXNvdXJjZSBsaW1pdGF0aW9uIG9uIHRoZSBpbXBv
cnRpbmcgR1BVLgoKCj4KPiBTbyB0aGV5IGJhc2ljYWxseSBsb2NrIHRoZSBiYWNraW5nIG1lbW9y
eSB1bnRpbCB0aGUgbGFzdCBzdWJtaXNzaW9uIGlzCj4gY29tcGxldGVkIGFuZCB0aGF0IGlzIGNh
dXNpbmcgcHJvYmxlbXMgaWYgaXQgaGFwcGVucyBmb3IgdG8gbXVjaAo+IG1lbW9yeSBhdCB0aGUg
c2FtZSB0aW1lLgo+Cj4gV2hhdCB3ZSBjb3VsZCBkbyBpcyB0byBmaWd1cmUgb3V0IGluIHRoZSB2
YWx1YWJsZSBjYWxsYmFjayBpZiB0aGUgQk8KPiBpcyBwcmVlbXB0LWFibGUgb3Igbm90LgoKVGhl
biB3ZSBzaG91bGQgYWxzbyBub3QgY291bnQgdGhlbSBpbiBtZ3ItPmF2YWlsYWJsZS4gT3RoZXJ3
aXNlIG5vdApldmljdGluZyB0aGVzZSBCT3MgY2FuIGJsb2NrIG90aGVyIEdUVCBhbGxvY2F0aW9u
cy4gQWdhaW4sIG1heWJlIGl0J3MKZWFzaWVyIHRvIHVzZSBhIGRpZmZlcmVudCBkb21haW4gZm9y
IHByZWVtcHRpYmxlIEJPcy4KClJlZ2FyZHMsCsKgIEZlbGl4CgoKPgo+IFJlZ2FyZHMsCj4gQ2hy
aXN0aWFuLgo+Cj4+IFN0YXRpY2FsbHkgbGltaXRpbmcgdGhlIGFtb3VudCBvZiBwYWdlYWJsZSBt
ZW1vcnkgYWNjZXNzaWJsZSB0byBHVFQgaXMKPj4gcmVkdW5kYW50IGFuZCBvdmVybHkgbGltaXRp
bmcuCj4+Cj4+IFJlZ2FyZHMsCj4+IMKgwqAgRmVsaXgKPj4KPj4KPj4+IFJlZ2FyZHMsCj4+PiBD
aHJpc3RpYW4uCj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4gwqDCoMKgIEZlbGl4Cj4+Pj4KPj4+Pgo+
Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGlu
ZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqDCoMKgIGRyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCA0ICsrKysKPj4+Pj4+IMKgwqDCoCAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKPj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
Ywo+Pj4+Pj4gaW5kZXggZGUxZWM4MzhjZjhiLi4wYjk1MzY1NGZkYmYgMTAwNjQ0Cj4+Pj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4+PiBAQCAtNjU1LDYgKzY1NSwxMCBAQCBpbnQgdHRtX21l
bV9ldmljdF9maXJzdChzdHJ1Y3QgdHRtX2RldmljZQo+Pj4+Pj4gKmJkZXYsCj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGxpc3RfZm9yX2VhY2hfZW50cnkoYm8sICZtYW4tPmxydVtpXSwg
bHJ1KSB7Cj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBidXN5Owo+
Pj4+Pj4gwqDCoMKgICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIERvbid0IGV2aWN0IFNHIEJP
cyAqLwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGJvLT50dG0gJiYgYm8tPnR0
bS0+c2cpCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+
Pj4+Pj4gKwo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghdHRtX2Jv
X2V2aWN0X3N3YXBvdXRfYWxsb3dhYmxlKGJvLCBjdHgsCj4+Pj4+PiAmbG9ja2VkLAo+Pj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAmYnVzeSkpIHsKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChidXN5ICYmICFidXN5X2JvICYmIHRpY2tldCAhPQo+Cl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
