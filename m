Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F1A32391C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 09:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFA96EA67;
	Wed, 24 Feb 2021 08:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129AC6E8B8;
 Wed, 24 Feb 2021 08:57:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMXvXweuR+L5PqWI+kxp5gs5xWf8kjJ7D+QBxb2C7QoaahWa60Esqz0ynlyR+EWRim0HMRzCKV0WT+pIlY4Wjbblx3UA9iykHDvBxmBAqB9aB568ApMY/FTHz/D5na1pl76hqMXhNxoyHhwGkd3Q/5t5K91z7BdEXGv4zGVPuMz75yOq8UmSlu0U5TOu1FNDlyB62I5eO8s4IGldTmSSMINIMgRUi/E4bUSPW9L/qduP6T/s8VXjbsipZlN7EWtloZSAK+NRG/WWceJ3GSIpeawY3CMy2XfiwGKF9LfZpuB/SCFKuM6mTyUlzCzMWrDxnBMZtP7O1BmXj/Z0soUCHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCY+QMR7Q0oQfCI2h/ROV/vwem4KprRAAs9QFoQ2UlU=;
 b=Dk/i7QvfZouChF1mZ2k3xm5V+putNry/nqWFJ7FnKVtBwnxYZSndNoOq9Bk/TzgLzId4nI9COFGCDQYj3VeS9nlXe2NRNlkzfRvwqCHZNayXxHm6s32Q8cyZnbYjmIeL1DzSPejGR3r7qypyRYC1kYRcSpmRkwW0k0r72ZiGMIiy5Qlx6ryt1jAUSeL2yCkJRHepOeBZjG+wBRNvMCcsBtu3Ct2Ub27wVe3X+yyZ/ABBixTVlqSRs08Or6wYzJWgPZuwpysfzafI7h/3KAhCbHa5R7M6nNZnUVawKeitVvoiajCDpH2YDY0/j00Fc0C46P25zIXfZoZP34Znhq+l/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCY+QMR7Q0oQfCI2h/ROV/vwem4KprRAAs9QFoQ2UlU=;
 b=kcJB/2KUCDIuuXXtRPQJCzcLa+PZO+SPwZ0wEkoHzm3zFql4hH9E8qa3ppqzjlpre06LZt9XPJJNSc4YHrKuH8sOd0Fx0hKnDtxcNhV7L/N5S+GM2Sq37qwxn8yyirkwVpVoBZwWnsI66+giejV1aG7V/qmzhwks07ltwkawWOk=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 08:57:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 08:57:56 +0000
Subject: Re: [PATCH] drm/ttm: Do not add non-system domain BO into swap list
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210224032808.150465-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <6a5a48a8-ab8f-6846-c926-176fc3ea2c82@amd.com>
Date: Wed, 24 Feb 2021 09:57:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210224032808.150465-1-xinhui.pan@amd.com>
Content-Language: en-US
X-Originating-IP: [46.189.55.12]
X-ClientProxiedBy: AM0PR04CA0138.eurprd04.prod.outlook.com
 (2603:10a6:208:55::43) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.201.250.142] (46.189.55.12) by
 AM0PR04CA0138.eurprd04.prod.outlook.com (2603:10a6:208:55::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 08:57:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ea0b52e7-78bd-47bc-9e79-08d8d8a246e7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4389:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4389EC0F36D84470C7F2719D839F9@MN2PR12MB4389.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0hH9mrVkOvcwgqgLxFJibL96Jciav7lK7XFH7K5IoOtMbJD1qUaKn2iMR3GL86ojixyojvNXckcfjxrJoiPuzzAwhleVrflvF5LT7J3OssBIFkMawb4rUymzI+LQMx5LLA3UOLdJMgeYTkyWi5EdeVlGa2k14tcFAlZe6s1RYR5mMy1PVyLG4RBSB+vasqdVbGr/ukbKlqvy0HKb1k+MqxpKUmuby+N8WJUBjPb0MdciqBhVqoDq7C6ayhZAHVHMyiFKAR5KuzZ5ERNZFvsgEo74d1SqlJwdIMxQUEBd7BbAou6u6w+RbzX5v2b5yrS5OJ0+skus6eyyvZaECBDTsegkIkVOtxtpgAZ7lk5CBcT8Wmig+f53CVRh7UihHjPAMag/s2Mjzne0QQLmhvRQaIwigU4J5voLaxyhz0MrEXGFPF8BEZJYCtdSxeWp/qwlRgpAJ7IwMmcdb1m88MUmguDs5/m4Vf9BBbr8p0WNMdYFbugF/OhERLdTOvAqxH8KaCOV5OHNTP1j/UuMc6HikllWled+U+d5SmABVPkXtYCJlfuE0OA5eiLE08/PNHzRiuYhEAcLpzSGxkHa2BfS2NxVwDOpzg7qvbYwcBbaNZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(39860400002)(346002)(956004)(31696002)(16576012)(26005)(2616005)(316002)(66556008)(66946007)(5660300002)(66476007)(31686004)(6666004)(6486002)(16526019)(450100002)(4326008)(66574015)(86362001)(36756003)(478600001)(186003)(4744005)(52116002)(83380400001)(2906002)(8676002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RERRSkJWaHUrTGdBckpLeWhLUUhnYTM0TjBFdVFUdkp4M2RSbVJHUkpJQStY?=
 =?utf-8?B?dnVzbFlaQ0dMS3V1RUlML2FkSitzdGFveHM1eGFNT2Z5VFJCUmFXTTBPbWFq?=
 =?utf-8?B?THRWZGdISTZxTC94MmtCNC9maFhUb1lZZk9JSC9qL3l4VmxoMDNBOGNJMHFG?=
 =?utf-8?B?cVgwZjd6UGdWbHd0dVNNSjM4VzJndjJhemhNai9pY1JRMGQzVDJZY1VxRUdN?=
 =?utf-8?B?dE43MzJnSUhqcDFtdS9iWmNYTkhYRjVFQUZGL05JVzYzNFZ0U1hDYmFraUxi?=
 =?utf-8?B?VkRoRVVWeXM0SVlaQVNGQ1dLUFo2NVZBLzYzd0ZhZ2NFcllscDVNdFVkM0Fy?=
 =?utf-8?B?WVd0Rk5RSytKV0JtNDB6cGJyOWhGWjlzTFd5TGFmajVTYjZ0OHRkQlkvT2lu?=
 =?utf-8?B?Y2ZBcWR5Z1RaUmdiY3p2YmEwdkFJK0tPSkVwb3BEdk9kcFJmMDZBYmtGMVY4?=
 =?utf-8?B?L21Bbmt0RmJRQWNFK1RpeFR4R0RrY2R4QW8zdG1kNXJUVFJ2OENsbERQR3dZ?=
 =?utf-8?B?QlhTVUNxeU1Sa3VkOTNmaHEwTW1HcDNXMEpUTkZROHNMc1JUNTdIVW1reGxN?=
 =?utf-8?B?NEJvNDErTXdpbXVkNXphcFR6RmY2dXBoVldMeC9zdnVJNG9sM2hwd0dNbjhT?=
 =?utf-8?B?N1c5WXl5WjMzZisyR08vYVBaOFJVR0cxcS8xRFhRQ2h0VUpMVGRuNDlUMGxa?=
 =?utf-8?B?NXNlTm1tMjVDa0N3RnVsRFZ3dWtXSzZ6Y2pqVTBBNVhuLzAvM0FvRzJkbEps?=
 =?utf-8?B?MEwrc2pVdzdyYXF2cUdDZkdYb1hEV1drUlA3U0JPQ05EQTVzeUpPSW4xOTFF?=
 =?utf-8?B?MCt0b3hZbWJPSnk5Wkx5bU40WkhHV2J0S3V3WWFpUlRWZ1dnUGUyclN0UGVn?=
 =?utf-8?B?dm10SWZlTlhWNmxlek9aejRFWTNRbytMWld3M2x4QXBKRWk0WkZSemhrWkRs?=
 =?utf-8?B?ejA3QUZmZW1lNzRJeEpDYW82Z2RmTDZCbm9oRko0MGJkSDlqV3ZNN0tDZ1dZ?=
 =?utf-8?B?cnNZZDlXUEhTRFJVaTdKTmhTNGxINzlzV2phYXBoMjJvVmtaWmkrM3FVeUsr?=
 =?utf-8?B?bUpkS0U3TC9aQzV2QTVEd3dIYW8rbW5SUEh4OVFCSXlVUmFwdGNBRVFXT2hC?=
 =?utf-8?B?OGt0UnhrMXFkMDVadlpGeUZMbVZwNFAvc1NMZmlCVXJUY2FOM0s0amFrTkxE?=
 =?utf-8?B?SHRrd0QremY5Qy9BV21wZWNQSWxSRFo0L2xSeGJOZ21QZXZvam5CZlZFTE5w?=
 =?utf-8?B?cDlTTTZUV1YrZ3dnQ2xzcDN0NHNIeHZteUZzUjJMbHdWMjBYaDJ1clc5d3o3?=
 =?utf-8?B?Wmd4dXpxUkd1STEyeG5QRGoyZkhPUkxIN0pGa2VUalcvNWlnQzNKa0pMRHp0?=
 =?utf-8?B?ZXA2azVDSFVkZmwvQzhCM0hZM3hWMUVwWEdyRTdVaVMvWis2NDZYcGhMc1lE?=
 =?utf-8?B?cmVUUFBmWEs5eDkxc0tBaWRwTEwzYTBmaC9xVDd6eTN2MWVTQ0h1NmoxNnlO?=
 =?utf-8?B?QWQxTzJRY0taU0RIbGdiS2JVUEx1N242c1hzQjdyUHBtRW93MWliMFBzN1lO?=
 =?utf-8?B?bXh5VnFhM1R6Yk5VWXZLanZMUVZ0Zlg3cnVUTHlRUlNmMkVuNjNsUTkycjVI?=
 =?utf-8?B?REE2NldWbU9oRS82YXRCODlKVitycm5TdmJEa2NULzJtUW14ekFWcXpkcHR0?=
 =?utf-8?B?ZWZDRHZ1Q2hNMGN5RHV4WU04c2FhRTZDSFV1Smt4Vldad2YvOTkxWHJyU0g2?=
 =?utf-8?Q?VO4uFav5KekBjdY4saqXcOVf419eT7IVLi+1N6+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0b52e7-78bd-47bc-9e79-08d8d8a246e7
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 08:57:56.2679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pzvyh2+LjKDxMl+mAsVn1C+1uxYlKeBjBh1C3QZIWDozadf6RvBeHfnbmNX0KAfF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
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
Cc: alexander.deucher@amd.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDIuMjEgdW0gMDQ6Mjggc2NocmllYiB4aW5odWkgcGFuOgo+IEJPIHdvdWxkIGJlIGFk
ZGVkIGludG8gc3dhcCBsaXN0IGlmIGl0IGlzIHZhbGlkYXRlZCBpbnRvIHN5c3RlbSBkb21haW4u
Cj4gSWYgQk8gaXMgdmFsaWRhdGVkIGFnYWluIGludG8gbm9uLXN5c3RlbSBkb21haW4sIHNheSwg
VlJBTSBkb21haW4uIEl0Cj4gYWN0dWFsbHkgc2hvdWxkIG5vdCBiZSBpbiB0aGUgc3dhcCBsaXN0
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogeGluaHVpIHBhbiA8eGluaHVpLnBhbkBhbWQuY29tPgoKUmV2
aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCkdv
aW5nIHRvIHB1c2ggdGhhdCB0byBkcm0tbWlzYy1maXhlcyB0b21vcnJvdy4KClRoYW5rcywKQ2hy
aXN0aWFuLgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAyICsrCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBp
bmRleCBhOTdkNDFmNGNlM2MuLjNhMTBiZWJiNzVkNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+
IEBAIC0xMTEsNiArMTExLDggQEAgdm9pZCB0dG1fYm9fbW92ZV90b19scnVfdGFpbChzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCj4gICAJCXN3YXAgPSAmdHRtX2dsb2Iuc3dhcF9s
cnVbYm8tPnByaW9yaXR5XTsKPiAgIAkJbGlzdF9tb3ZlX3RhaWwoJmJvLT5zd2FwLCBzd2FwKTsK
PiArCX0gZWxzZSB7Cj4gKwkJbGlzdF9kZWxfaW5pdCgmYm8tPnN3YXApOwo+ICAgCX0KPiAgIAo+
ICAgCWlmIChiZGV2LT5mdW5jcy0+ZGVsX2Zyb21fbHJ1X25vdGlmeSkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
