Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5688275950
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 16:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDD96E9B5;
	Wed, 23 Sep 2020 14:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979296E9B5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 14:03:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILh9b9a3dPt4rk9FtaJRCaPoyMq2ugHGrliE5X1akWwhpX0imjoNYoBBM+j570s/zBk4ebiV6Vw5RKQSe0eobKL0fsknG9iDf2aLHaa4vpG5LZ9LqXrutKZ80YvjdmjJas8HMhVO2qcKmUPLAir8sIG2ApM5/0NqULHsMgWCzi1eFCHTFePvTtmK/XRvA5Wz9soLlRNKZTtqMFfqEtNwOkLQF+frSxQELH6c/rE4o4i3Y9EeNCJ65JdV5OnSHDN2LfDe6JOeRXmav0PhVF2oxcc6x5c6lElj6u/4nxlaUxFBw5jf+YAMAAF2cnX0G1VkpNnQ8y9d8v/clnv/yWc6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy1mhc9T+RFHSZADLNTRHjFyNNXSxaGEcvd1jOBq84Y=;
 b=b8VYPPhfWg8MBXe1L2AgL8xCDgnXbIWtw0zYTaMSaDpPbOUpEdNaZT0aMf6NkplI5iw23hunTwEW6PR9WSjR17weoQk5/6Swr0zsSY8eXHdjkHqgDFdJ1yiyREWdA02Ncza62sWkYr65CeAykftvz3hHYEAOJBdSxs00O+OXCXEfwzYLHLtR6N8zBGLgEZ+GFE/BbHE4OGeR3hrxKpw2wub/SzqaB2fx00R+v2MzLmb71iCUiyUeJmIPa0VxNOV2O1DJoXObpVqtn80Z3FTfCiftFfOJDWkNsl/h/t06yRuMypnlgxEQtZ4LQbN8dhTTmy4U1R6ihnGx9hVjDsjoMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy1mhc9T+RFHSZADLNTRHjFyNNXSxaGEcvd1jOBq84Y=;
 b=ljr5F4F6xXOF5m5UYswVpi50vqONtkK8Lzb9wkhQcRLiB0Qjk0ixGpBYAUKcV+l1xROrPqOf/LGdHw5Fv7e6nvxkg5EZX85AUGiZvdduyGk6twTtscZecLKHTYNwnbgbt/VkBbWVLciJXRAaZaO/VPE4mv0lUsXNeun3qw5wF0o=
Authentication-Results: daenzer.net; dkim=none (message not signed)
 header.d=none;daenzer.net; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4360.namprd12.prod.outlook.com (2603:10b6:208:266::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Wed, 23 Sep
 2020 14:03:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Wed, 23 Sep 2020
 14:03:47 +0000
Subject: Re: Why can't ttm_tt_swapout() handle uncached or WC BOs?
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>
References: <fabf5079-6c39-7c8f-2973-5b32494f852a@gmail.com>
 <5fb55684-c797-a104-253f-bf43634f0cec@daenzer.net>
 <9181f6be-0da1-2f43-2014-7c3195147194@amd.com>
 <CAPM=9tzWw3x345AHeODiQ9noDNN6XuTd6J2GsADhu4bQns1_XA@mail.gmail.com>
 <3c75bf5b45f3a345407dc099de8b1a96ee9b4b81.camel@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8cc30de5-210d-e509-bd85-cbbe4ff17724@amd.com>
Date: Wed, 23 Sep 2020 16:03:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <3c75bf5b45f3a345407dc099de8b1a96ee9b4b81.camel@intel.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR03CA0083.eurprd03.prod.outlook.com
 (2603:10a6:208:69::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0083.eurprd03.prod.outlook.com (2603:10a6:208:69::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.20 via Frontend Transport; Wed, 23 Sep 2020 14:03:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 55a764eb-55c2-41ed-d558-08d85fc97da9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4360:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43604D35247477DDAA0106DF83380@MN2PR12MB4360.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a/8c7MLa5Gz6zjubXTswF8XzFibTafl7i5f5IBtaaaWrz4ItUIyob+/sICRz+YQJR9teVILihMYnJJA63VziKczxrOhew5n5VO/7RRcIDyjxjOyzaFVRXOJiN/tzKP/9dwpN9xp+RiHZZcsfrKQ1sBUNMga5v51onX/1237elwk0lV+4+cGMLXqq3yP1MPAA/RJmXtWLbJnzeOSgEAat5sVElDoPkpWdB5BFsIQH0ZJPvpyGz1lbUp5dl4reTTda3oW/+uipz8C9saqSPmKyNY/k3xOUuQWwcnIDJ5hC8bm/h/RGQ/JnmHeunxzS+qT/PiJR0XLQlqpdXWBqdXV4fVqvk9Pgx69FsxriyHUZT9m042e7YMPJbkXsZ7gRgoav
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(8936002)(86362001)(478600001)(8676002)(316002)(52116002)(54906003)(31686004)(36756003)(66556008)(66476007)(66946007)(66574015)(83380400001)(110136005)(53546011)(16526019)(31696002)(186003)(5660300002)(2616005)(6486002)(4326008)(2906002)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 60WH4frXoob8fwRvWO4DmX3CDi8khb4XSIPKa3xZOEvVqokYQRQwvcUmGv/e7MeuZN+a0uv8aFSJYaOD2V1azED0KSkeMsmmsLqgS09Qahd5XIwl9+rRqGSYGfttd+zxvJyxm8kcSgTIetBtHemzEx9yyvjbd+Ml44z+3Gn1+jK1HIS+yzT3LYcka8EM0ywuUgxEwgQlwgW6Ki7wXCtDbrHaDhH2Xj91k0+VYMm1lFq2KRPpL1rhYSxrwiddfYGLhWI1qbUtjiPo3OcFg2sCm2YZBtZrdZnz2iJosScfZIqVL1sElCgBbVP35XdKEeAp5Om32J6aaVqZf5m7kqKqw4cyeY+VtZc5tYGgN04oz9Xy7EfaqmEExpse1nXuVQjGQTMnnVzKJNo82OiogMOsJqeyKcrXl7AhNyynPrP9bd/KhTvNf4YYhcSGYoDDv4pDvKve9KeRPvb7QCUA++Zbc6dE731AisONNZJjQwkCbUq49QJRbhTFTiZOGdrn3Vl7iIkJAVs7kdFZgIHhbtbsImR0aRh7VOpZdCjWh2ymEEziQlNOuD4VwezCBitmKN2HABn3XMVsd3h0YDd6KrT4XTlHYMomll+3ZS69PhonZAsq+g+DVuD8ZXZxwWiErnXpG5LmV3mBnbwwK5CWJaW7mV8v7MuEPoJPKOFAqcynRFPoqPy6OIZ3Fqitud9dGHl2OSHJg6Vp/m1DhKmYVUSAIA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a764eb-55c2-41ed-d558-08d85fc97da9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 14:03:47.5751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+NmthSAZXwGnkvGf/677P7rnA5Odv6UynfOXRvlrn8Syfg7/CypwspX7VRPOhOy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4360
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
Cc: "michel@daenzer.net" <michel@daenzer.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMDkuMjAgdW0gMTE6MjQgc2NocmllYiBIZWxsc3Ryb20sIFRob21hczoKPiBPbiBXZWQs
IDIwMjAtMDktMjMgYXQgMTM6MTcgKzEwMDAsIERhdmUgQWlybGllIHdyb3RlOgo+PiBPbiBGcmks
IDE4IFNlcCAyMDIwIGF0IDAwOjQ5LCBDaHJpc3RpYW4gS8O2bmlnIDwKPj4gY2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4+IEFtIDE3LjA5LjIwIHVtIDE2OjQ0IHNjaHJpZWIgTWlj
aGVsIETDpG56ZXI6Cj4+Pj4gT24gMjAyMC0wOS0xNyAyOjIwIHAubS4sIENocmlzdGlhbiBLw7Zu
aWcgd3JvdGU6Cj4+Pj4+IEhpIGd1eXMsCj4+Pj4+Cj4+Pj4+IE1pY2hlbCBvbmNlIHN1Ym1pdHRl
ZCBhIHBhdGNoIHRvIGZpeCB0cmlnZ2VyaW5nIHRoaXMgQlVHX09OIGluCj4+Pj4+IHR0bV90dF9z
d2Fwb3V0KCk6Cj4+Pj4+Cj4+Pj4+PiBCVUdfT04odHRtLT5jYWNoaW5nX3N0YXRlICE9IHR0X2Nh
Y2hlZCk7Cj4+Pj4+IE5vdyBteSBxdWVzdGlvbiBpcyBkb2VzIGFueWJvZHkga25vdyB3aHkgd2Ug
aGF2ZSB0aGF0IGluIHRoZQo+Pj4+PiBmaXJzdAo+Pj4+PiBwbGFjZT8KPj4+Pj4KPj4+Pj4gVGhl
IG9ubHkgcHJvYmxlbWF0aWMgdGhpbmcgSSBjYW4gc2VlIGlzIGNhbGxpbmcgY29weV9oaWdocGFn
ZSgpCj4+Pj4+IGFuZAo+Pj4+PiB0aGF0IG9uZSBpcyBqdXN0IGRvaW5nIGEga21hcF9hdG9taWMo
KS9rdW5tYXBfYXRvbWljKCkgb24gdGhlCj4+Pj4+IHNvdXJjZQo+Pj4+PiBhbmQgZGVzdGluYXRp
b24uCj4+Pj4+Cj4+Pj4+IEkgY2FuJ3Qgc2VlIHdoeSBpdCBzaG91bGQgYmUgcHJvYmxlbWF0aWMg
Zm9yIHRoaXMgdGVtcG9yYXJ5Cj4+Pj4+IG1hcHBpbmcKPj4+Pj4gdG8gYmUgY2FjaGVkIGluc3Rl
YWQgb2YgdW5jYWNoZWQgb3IgV0M/Cj4+Pj4+Cj4+Pj4+IERvZXMgYW55Ym9keSBoYXMgYW55IGlk
ZWE/Cj4+Pj4gT25lIHRoaW5nIGlzIHRoYXQgQUZBSUsgc29tZSAoQVJNPykgQ1BVcyBjYW4gZ2V0
IHZlcnkgdXBzZXQgd2hlbgo+Pj4+IHRoZXJlJ3MgYm90aCBhIGNhY2hlZCBhbmQgdW5jYWNoZWFi
bGUgbWFwcGluZyBmb3IgdGhlIHNhbWUKPj4+PiBwaHlzaWNhbCBwYWdlLgo+Pj4gR29vZCBwb2lu
dCwgYnV0IEkgYWxyZWFkeSBjb25zaWRlcmVkIHRoaXMuCj4+Pgo+Pj4gSWYgdGhlcmUgaXMgYW5v
dGhlciBtYXBwaW5nIGZvciB0aGF0IHBhZ2UgbGVmdCB3ZSBhcmUgY29tcGxldGVseQo+Pj4gYnVz
dGVkCj4+PiBhbnl3YXkgc2luY2Ugd2UgYXJlIGN1cnJlbnRseSBjaGFuZ2luZyB0aGUgdW5kZXJs
eWluZyBzdG9yYWdlLgo+Pj4KPj4gSXQncyBub3QganVzdCBBUk0gb2YgY291cnNlLCB4ODYgUEFU
IGFsc28gaGFzIG1hbnkgaXNzdWVzIGFib3V0Cj4+IG11bHRpcGxlIG1hcHBpbmdzIG9mIHRoZSBz
YW1lIGJhY2tpbmcgcGFnZSB3aXRoIGRpZmZlcmVudCBhdHRyaWJ1dGVzLgo+Pgo+PiBUaGUgb25s
eSBtYXBwaW5ncyBtaWdodCBiZSBpbiB0aGUgbGluZWFyIG1hcHBpbmcsIHNpbmNlIG5vdCBhbGwg
cGFnZXMKPj4gd2UgZ2V0IGhlcmUgd2lsbCBuZWNlc3NhcmlseSBiZSBoaWdoIHBhZ2VzIEkgYXNz
dW1lIGFuZCB0aGVyZWZvcmUKPj4gY291bGQgaGF2ZSBhIGxpbmVhciBtYXBwaW5nLiBJZiB3ZSd2
ZSBjaGFuZ2VkIHRoZSBsaW5lYXIgbWFwcGluZyB0bwo+PiBub24tY2FjaGVkLCB0aGVuIGNyZWF0
ZSBhIGNhY2hlZCBrbWFwIEknbSBub3QgMTAwJSB0aGF0IHdvbid0IGNhdXNlCj4+IGlzc3Vlcy4K
Pj4KPj4gYnV0IHRoaXMgaXMgYSBkZWZpbml0ZSBtYXplIG9mIHR3aXN0eSBwYXNzYWdlcyBhbmQg
SSdkIHByb2JhYmx5IG5lZWQKPj4gdG8gc2l0IGRvd24gYW5kIGJyZWFrIGl0IGEgYml0IG1vcmUu
Cj4+Cj4+IERhdmUuCj4gVGhpcyBpcyBhIHByb2JsZW0gdGhhdCBnb2VzIGJhY2sgd2F5IGZhciAo
MTIrKSB5ZWFycyB0aGF0IHRoZSB4ODYKPiBhcmNoaXRlY3R1cmUgaXMgbm90IGFsbG93ZWQgdG8g
ZG8gYWxpYXNlZCBtYXBwaW5ncyBvZiBwYWdlcywgZXZlbgo+IHRocm91Z2ggbWFwcGFibGUgR1RU
czogVGhlcmUgYXJlIHR3byBhc3BlY3RzOgo+Cj4gMSkgQ3JlYXRlIGEgV0MgbWFwcGluZyBvZiBh
IHBhZ2Ugd2l0aCBkYXRhIGluIHRoZSBjYWNoZS4gV2hlbiB0aGUgY2FjaGUKPiBkb2VzIGEgd3Jp
dGViYWNrLCBhbnl0aGluZyB3cml0dGVuIHRocm91Z2ggdGhlIFdDIG1hcHBpbmcgd2lsbCBnZXQK
PiBvdmVyd3JpdHRlbi4KPgo+IDIpIEZsdXNoaW5nIHRoZSBXQiBtYXBwaW5ncyBmaXJzdCBtaWdo
dCBub3QgaGVscCwgc2luY2UgYXQgdGhhdCB0aW1lCj4gdGhlcmUgd2VyZSBzb21lIEFNRCBwcm9j
ZXNzb3JzIChBdGhsb25zPykgdGhhdCB3ZXJlIHNwZWN1bGF0aXZlbHkKPiBwcmVmZXRjaGluZyBk
YXRhIG9uIHRoZSBXQiBtYXBwaW5nIGludG8gdGhlIGNhY2hlIGF0IGFueSB0aW1lLCBhbmQgZXZl
bgo+IHRob3VnaCBpdCB3YXNuJ3QgY2hhbmdlZCBpdCBkaWQgYSB3cml0ZWJhY2suIEFueXRoaW5n
IHdyaXR0ZW4gdGhyb3VnaAo+IFdDIGluLWJldHdlZW4gdGhlIHByZWZldGNoIGFuZCB0aGUgd3Jp
dGViYWNrIGdvdCBvdmVyd3JpdHRlbi4gVGhhdCB3YXMKPiBhIHJlYWwgYW5kIG9jY3VyaW5nIHBy
b2JsZW0gYXQgdGhhdCB0aW1lLiBBTUQgY2xhaW1lZCBpdCB3YXMgbm90Cj4gdmlvbGF0aW5nIHNw
ZWNzLgo+Cj4gU28gYWxpYXNlZCBtYXBwaW5ncyBpcyBwcm9iYWJseSBhdCBiZXN0IHZlcnkgZnJh
Z2lsZS4KCkFsbCBvZiB0aGlzIGlzIGNvcnJlY3QsIGJ1dCBJIHN0aWxsIGNhbid0IHNlZSB3aHkg
dHRtX2JvX3N3YXBvdXQoKSB0cmllcyAKdG8gY2hhbmdlIHRoZSBjYWNoaW5nPwoKU2VlIGNvcHlf
aGlnaHBhZ2UoKSB3aWxsIG9ubHkgY3JlYXRlIGEgdGVtcG9yYXJ5IHdiIG1hcHBpbmcgZm9yIGhp
Z2htZW0gCnBhZ2VzIHdoaWNoIGlzIGRlc3Ryb3llZCBpbW1lZGlhdGVseSBhZ2Fpbi4gT3RoZXJ3
aXNlIGl0IHdpbGwgdXNlIHRoZSAKbGluZWFyIG1hcHBpbmcgd2hpY2ggc2hvdWxkIGFscmVhZHkg
aGF2ZSB0aGUgY29ycmVjdCBjYWNoaW5nIGF0dHJpYnV0ZXMuCgpPbiB0aGUgb3RoZXIgaGFuZCBv
biBhcmNoaXRlY3R1cmVzIHdoaWNoIHVzZXMgTVRSUiBvciBzaW1pbGFyIGFwcHJvYWNoIAp3aGVy
ZSB5b3UgY2FuJ3QgY2hhbmdlIG1hcHBpbmcgb24gdGhlIGZseSB0aGlzIHdpbGwgdG90YWxseSBi
bG93IHVwIGludG8gCnlvdXIgZmFjZS4KCkNocmlzdGlhbi4KCj4KPiAvVGhvbWFzCj4KPgo+Cj4K
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gSW50ZWwgU3dlZGVuIEFCCj4gUmVnaXN0ZXJlZCBPZmZpY2U6IElz
YWZqb3Jkc2dhdGFuIDMwQiwgMTY0IDQwIEtpc3RhLCBTdG9ja2hvbG0sIFN3ZWRlbgo+IFJlZ2lz
dHJhdGlvbiBOdW1iZXI6IDU1NjE4OS02MDI3Cj4KPiBUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFj
aG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBtYXRlcmlhbCBmb3IKPiB0aGUgc29sZSB1
c2Ugb2YgdGhlIGludGVuZGVkIHJlY2lwaWVudChzKS4gQW55IHJldmlldyBvciBkaXN0cmlidXRp
b24KPiBieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGFyZSBub3QgdGhl
IGludGVuZGVkCj4gcmVjaXBpZW50LCBwbGVhc2UgY29udGFjdCB0aGUgc2VuZGVyIGFuZCBkZWxl
dGUgYWxsIGNvcGllcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
