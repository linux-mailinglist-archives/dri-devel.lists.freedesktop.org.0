Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A16B2FB605
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 13:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6D26E23D;
	Tue, 19 Jan 2021 12:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2083.outbound.protection.outlook.com [40.107.244.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DFD6E23D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 12:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtFDrhjw3quQ8LVCW22IXti7Be+zKBb3uPPHtcad/bXJJfs6K4PwveyK7B1dQNrCfvGGztveKGc74R9Haa0t/beKqnalWx9KXtOzgweXw9bFAiMTh+NftcQQYRad3R4UftjSSvnmBhJBDUUvZyK+fFbrP1sys8ImMW1Okf+O5dz1NdKa8AQvJ3p7IKku87nUF0bssWJMk4A2o2h55oD+I39C5SxfukhuA0Mg15LBBpjf9hNZK9NyAwEhlcaSGTtc8JRw78H9x2lHG1rkxoR+bWM2FUvwXj5VpEwFrEdIgc9kZYzfAzVQmaZBb51VGwpDrQG3SkqeVWGL/ANBDyWFPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rq7hDuvv64SDxUWv3wFEZJH64uRaO+2aoQYT7dxEUw0=;
 b=RKpJz72bGTLJ8DpJZM0Z3xvsANGhxLCJvvg3fXqKWMqUiEqXMdUyNU40F6hsmWKH8hASTXGK1wA8kZHLhylcY+Mi2ByRecJp8YmjxOlZ5oQjv34B+SlThV0UHiNjCGdZzpamADnaFfWAWibKcT4/8IJpnvmifyFWgjKGQltMTYuAXFKRi24gUh+tIfKDvT4kh/EBZD2KIQ5FcncJehdyNy8uwCUFI5w3PJdGA84YSvqzh890aaYTzXj3avUMC1LW1KR3ZrXdsOnN5L1rfMjeGJoGS6atTE89qPBMw9C5hQJYg4bv0wUIa3j/wCJuMslh4GlIgpT3oscVMMq8gDLmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rq7hDuvv64SDxUWv3wFEZJH64uRaO+2aoQYT7dxEUw0=;
 b=CfzJyGpE81wytf/nZvXrkhW3uqgIzgZck58tXuNBAiiOny5GslG1SKe5x10s1+vZWNtgG56XTGVDesKygbLiphvu8VcGDQK7INoxqHOGoUqTtMZ30BO5iju2xfFGvyU8DUwty0whmQtOr31246+8Uf+uiEOKTYCn/v2NWmoeDDo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB3111.namprd12.prod.outlook.com (2603:10b6:a03:dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Tue, 19 Jan
 2021 12:11:44 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::5927:a80d:11c4:529a]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::5927:a80d:11c4:529a%7]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 12:11:44 +0000
Subject: Re: [PATCH 4/4] drm/ttm: optimize ttm pool shrinker a bit
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201218175538.1364-1-christian.koenig@amd.com>
 <20201218175538.1364-4-christian.koenig@amd.com>
 <X+H5+OuETFR7ePdp@phenom.ffwll.local>
 <9d9a41f7-20cd-c0e3-6438-e72bce57a5a4@gmail.com>
 <X/c5HblJMRcHoQ64@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8a0c9123-aaf1-fda1-d039-abe23e26d3f5@amd.com>
Date: Tue, 19 Jan 2021 13:11:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <X/c5HblJMRcHoQ64@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::45) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0128.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Tue, 19 Jan 2021 12:11:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c5f2805c-88a1-4091-6748-08d8bc736272
X-MS-TrafficTypeDiagnostic: BYAPR12MB3111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB3111B672A05A3F81324ED20A83A30@BYAPR12MB3111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2Kb9l6X+4LBEJKjAQ/znDDhtTFhygbXVN0NMrUu6FbnB/beSw1wGeUOJX8M/LywhSXeVuPTG57N+mxFZsVg4t06kfec49ZWEljZn07oHLBVCXR95NDt4dImrFybYZ/oRWkHJsPbbS9nYzOm26hAtFFXBeD6yiujQnVHYdwA61Y18MeFP5W8d/1dAgZ48fydjSWmdJxD8itYTcHuE7K2JkLS80E9pDuAsQCrTSJ3JBjpC8lMVXfp2Y1fYMhqEjp07AGqW0lQHc0hFKF49VIDBy1G2HIjyV6U76wvNnzR5kKHsRF7CIaLtdUBjIJgzkUq5gNDONgtdZAZ6yRXjy5pamYu70Yy5jVDifR4A0cTgKI813vRKHxIyo1qHzCELwbh+jhlAZgBIsfktVbT6sl+6QZt/+AYWmbupEJOZm0DiAzeBCUnjoohqdn8mKh3aEcwEjrlkUpCwXWRieddr82FXSzgMbJdx+zdvn3iJijtc5+I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(66574015)(316002)(4326008)(86362001)(6486002)(6666004)(31686004)(2906002)(31696002)(36756003)(6916009)(478600001)(5660300002)(66476007)(83380400001)(8676002)(186003)(66556008)(52116002)(66946007)(8936002)(2616005)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Mk5RcWI4YmtyTnppbWhybk92UXZ4TVUzZVA0alp5eUV3bGdBVjJmYmZVOWZX?=
 =?utf-8?B?RTNJc3ZJbTh2bTBSbmY3dUU2Q1o5Y3hIUStMZWtWbkkwQU5adkw2UVhnL1Fp?=
 =?utf-8?B?QnRhd0MxcW83Zm1DWll5QXgvR0lWck9heFk3dnNsMjA0TURzMUxtbHdKSGxC?=
 =?utf-8?B?ckZTSUQ5bllDZGszQXJudFlHcnpmY01HWXgwTXBsek9nb2VhbXJGSU5vUzAx?=
 =?utf-8?B?MFZOL2ZFMktOdlhnSS9hLzVQeGZKNWhtVU5FeGhuc3QrK2dsQ0l6WFBsR1dV?=
 =?utf-8?B?VlhFWWxzQWM2WGpjUzFtSk50RFNDY2JpQWRyWW5YRlJlRi83Um8wbVdjeXRx?=
 =?utf-8?B?akJsVXpOaHo5WWE2NXpzYUFta21GdlZXajZDWWV0RXFTY0FOblI2QmJuM3lm?=
 =?utf-8?B?RVdkT2dTTUo1bDlUbmRMNUJFaFpYTFlzd1U3L3JxSElkQXRyZTdTaGRhdUNl?=
 =?utf-8?B?WWpHWkJXcmxNRjB1Q3BreEJaK2lqYlFyb1Z2SnFWZms2M2Zwek9FSlBCVjJG?=
 =?utf-8?B?MXptZUZtdjk0TXpmNzFwT2YwZUNFL1NQMm93ZXN2WkFVb0hWZDNtRUphZjFE?=
 =?utf-8?B?QkphMkZCSjNKcTc5ME9YWUZHdHhwSmsvaWxNVjdPNWxTRG1MU0k0RzZCajdN?=
 =?utf-8?B?WHpvZjQwSmlzb1QrYjdDZk1wSVJXK25OTGRnUG1aeFVkci9jaXJXTXFtenJm?=
 =?utf-8?B?a2doWis3V2d6MVNlaUMxSEdnQThTSElmUFo0cWtQTnRveURKQ25GZ0t1RjI2?=
 =?utf-8?B?RW8wWEVHQ2M2OGxUQjI5ck5VcXA4dFl5TVVRbmlBNXdQN2pDZDZTZEpQRnp1?=
 =?utf-8?B?VGY0em5IYXJVZHZUMUkyNWxIL3hoanBJeGtUZ0RzNmg5aFJ4dnFzQVNPK29O?=
 =?utf-8?B?dXBEV1p6dEpWbUNPT2ZDbjBSWGxyVXY4WWREY3E4Ny9sMU5vTzJML2xxNENN?=
 =?utf-8?B?eENZOVFsUUI0bjF1bkgrWGprYVFubkVWVmhWaFF1bnFzT0w0Z3JGMEl0Q0J0?=
 =?utf-8?B?Q0o1RHZrQlNucXFmY05YbzY0RkFZSmEra1lnWk8xU2FCUmp1cWsvdWJpRW9X?=
 =?utf-8?B?QnJaL1lrZG9jVUhoTzdCLysvaGJMS0Zha1pqNjJ3U2dRWUVLR1I0VUlhVC8z?=
 =?utf-8?B?em40L2FhTmRteVFLZ3BDR0l6UlJSME00dWptbEp3NzRHWm9oQkdzVkJVN0d3?=
 =?utf-8?B?M0lqVTNjbEpJdjFEWld6bjdORkNHTmJkMWx6cWF3NjlCd1JveHpPQU9mSWZm?=
 =?utf-8?B?bng5aWRKQzRVTWpnenQ2Q3BKYlRZMEE2M0w4ZHdFSC9wVW8rczcxL1hrQm5p?=
 =?utf-8?B?cjlFREpyNDYyWlRpM0V3RFErNW5Ua3FIRVlJSlJnTkNaN3ZTVlRaSmZRU0xD?=
 =?utf-8?B?c0p3K2FSbms2aHdQMUcxZ3pENTR2QVBtbUcvK3MwVlE2eWJqNzFreTZXVTFO?=
 =?utf-8?Q?Fe5tOtAe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f2805c-88a1-4091-6748-08d8bc736272
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 12:11:43.9306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yOeOop4sDAyBmzNZIoBoLuQrAulJxzmFHxjjchcKD2O5NYT2N9Yu6R7G4cpXTCzD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3111
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
Cc: ray.huang@amd.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDEuMjEgdW0gMTc6Mzggc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgSmFu
IDA3LCAyMDIxIGF0IDAxOjQ5OjQ1UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDIyLjEyLjIwIHVtIDE0OjUxIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IE9uIEZyaSwg
RGVjIDE4LCAyMDIwIGF0IDA2OjU1OjM4UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+Pj4gT25seSBpbml0aWFsaXplIHRoZSBETUEgY29oZXJlbnQgcG9vbHMgaWYgdGhleSBhcmUg
dXNlZC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlh
bi5rb2VuaWdAYW1kLmNvbT4KPj4+IEFoLCBqdXN0IHJlYWxpemVkIHRoZSBhbnN3ZXIgdG8gbXkg
cXVlc3Rpb24gb24gcGF0Y2ggMjogVGhlIHBvb2xzIGFyZQo+Pj4gcGVyLWRldmljZSwgZHVlIHRv
IGRtYV9hbGxvY19jb2hlcmVudCBiZWluZyBwZXItZGV2aWNlIChidXQgcmVhbGx5IG1vc3RseQo+
Pj4gaXQgaXNuJ3QsIGJ1dCB0aGF0J3Mgd2hhdCB3ZSBoYXZlIHRvIGRlYWwgd2l0aCBmaWdodGlu
ZyB0aGUgZG1hLWFwaQo+Pj4gYWJzdHJhY3Rpb24pLgo+Pj4KPj4+IEkgdGhpbmsgdGhpcyB3b3Vs
ZCBtYWtlIGEgbG90IG1vcmUgc2Vuc2UgaWYgdGhlIHNocmlua2VycyBhcmUgcGVyLXBvb2wKPj4+
IChhbmQgYWxzbyBtb3N0IG9mIHRoZSBkZWJ1Z2ZzIGZpbGVzKSwgc2luY2UgYXMtaXMgaW4gYSBt
dWx0aS1ncHUgc3lzdGVtCj4+PiB0aGUgZmlyc3QgZ3B1J3MgcG9vbCBnZXRzIHByZWZlcnJlbnRp
YWxseSB0aHJhc2hlZC4gV2hpY2ggaXNuJ3QgYSBuaWNlCj4+PiBkZXNpZ24uIFNwbGl0dGluZyB0
aGF0IGludG8gcGVyIGdwdSBzaHJpbmtlcnMgbWVhbnMgd2UgZ2V0IGVxdWFsIHNocmlua2luZwo+
Pj4gd2l0aG91dCBoYXZpbmcgdG8gbWFpbnRhaW4gYSBnbG9iYWwgbHJ1LiBUaGlzIGlzIGhvdyB4
ZnMgc2VlbXMgdG8gc2V0IHVwCj4+PiB0aGVpciBzaHJpbmtlcnMsIGFuZCBpbiBnZW5lcmFsIHhm
cyBwZW9wbGUgaGF2ZSBhIHNvbGlkIHVuZGVyc3RhbmRpbmcgb2YKPj4+IHRoaXMgc3R1ZmYuCj4+
IFdlbGwgZmFpcm5lc3MgYW5kIG5vdCB0cmFzaGluZyB0aGUgZmlyc3QgR1BVcyBwb29sIGlzIHRo
ZSByZWFzb24gd2h5IEkKPj4gaW1wbGVtZW50ZWQganVzdCBvbmUgc2hyaW5rZXIgcGx1cyBhIGds
b2JhbCBMUlUuCj4gVGhhdCdzIGtpbmRhIGRlZmVhdGluZyB0aGUgcG9pbnQgb2YgaG93IHRoZSBj
b3JlIG1tIHdvcmtzLiBBdCBsZWFzdCBvZiBob3cKPiBJJ20gdW5kZXJzdGFuZGluZyBob3cgaXQg
d29ya3MuIEltbyB3ZSBzaG91bGRuJ3QgdHJ5IHRvIHJlLWltcGxlbWVudCB0aGlzCj4ga2luZCBv
ZiBiYWxhbmNpbmcgYWNyb3NzIGRpZmZlcmVudCBwb29scyBpbiBvdXIgY2FsbGJhY2ssIHNpbmNl
IGNvcmUgbW0KPiB0cmllcyBwcmV0dHkgaGFyZCB0byBlcXVhbGx5IHNocmluayBhbHJlYWR5IChp
dCBvbmx5IHNocmlua3MgZWFjaCBzaHJpbmtlcgo+IGEgbGl0dGxlIGJpdCBlYWNoIHJvdW5kLCBi
dXQgZG9lcyBhIGxvdCBvZiByb3VuZHMgdW5kZXIgbWVtb3J5IHByZXNzdXJlKS4KCkNvcnJlY3Qs
IHNlZSB0aGUgcHJvYmxlbSBpcyB0aGF0IHdlIGRvbid0IHdhbnQgdG8gc2hyaW5rIGZyb20gZWFj
aCBwb29sIApvbiBlYWNoIHJvdW5kLgoKRS5nLiB3ZSBoYXZlIHNvbWV0aGluZyBsaWtlIDQ4IGds
b2JhbCBwb29scyBhbmQgMzYgZm9yIGVhY2ggZGV2aWNlIHdoaWNoIApuZWVkcyBhIERNQSBjb2hl
cmVudCBwb29sLgoKT24gZWFjaCByb3VuZCB3ZSB3YW50IHRvIHNocmluayBvbmx5IG9uZSBjYWNo
ZWQgaXRlbSBmcm9tIG9uZSBwb29sIGFuZCAKbm90IDQ4LgoKPiBBbHNvIG1haW50YWluaW5nIHlv
dXIgb3duIGdsb2JhbCBscnUgbWVhbnMgZ2xvYmFsIGxvY2tpbmcgZm9yIHRoZSB1c3VhbAo+IGNh
c2Ugb2Ygbm9uZS10by1saXR0bGUgbWVtb3J5IGNvbnRlbnRpb24sIHVuZWNlc3NhcmlseSB3YXN0
aW5nIHRoZSBmYXN0Cj4gcGF0aC4KCk5vLCB0aGUgZmFzdCBwYXRoIGRvZXNuJ3QgbmVlZCB0byB0
YWtlIHRoZSBnbG9iYWwgTFJVIGxvY2suCgpJJ3ZlIG9wdGltaXplZCB0aGlzIHF1aXRlIGEgYml0
IGJ5IGxvb2tpbmcgaW50byB0aGUgcG9vbHMgb25seSBvbmNlIGZvciAKZWFjaCBwb3dlciBvZiB0
d28uCgo+PiBJbiBvdGhlciB3b3JkcyBzaHJpbmtfc2xhYigpIGp1c3QgdXNlcyBsaXN0X2Zvcl9l
YWNoX2VudHJ5KCkgb24gYWxsCj4+IHNocmlua2Vycy4KPj4KPj4gSW4gdGhlIHBvb2wgc2hyaW5r
ZXIgY2FsbGJhY2sgc2hyaW5rIG9uZSBwb29sIGFuZCBtb3ZlIGl0IHRvIHRoZSBlbmQgb2YgdGhl
Cj4+IHNocmlua2VyIGxpc3QuCj4+Cj4+PiBBc2lkZTogSSB0aGluayBpdCBhbHNvIHdvdWxkIG1h
a2UgdG9ucyBvZiBzZW5zZSB0byBzcGxpdCB1cCB5b3VyIG5ldyB0dG0KPj4+IGJvIHNocmlua2Vy
IHVwIGludG8gYSBwZXItZGV2aWNlIGxydSwgYW5kIHRocm93IHRoZSBnbG9iYWwgc3lzdGVtIG1l
bW9yeQo+Pj4gbHJ1IG91dCB0aGUgd2luZG93IGNvbXBsZXRlbHkgOi0pIEFzc3VtaW5nIHdlIGNh
biBpbmRlZWQgZ2V0IHJpZCBvZiBpdCwKPj4+IGFuZCB2bXdnZnggZG9lc24ndCBuZWVkIGl0IHNv
bWV3aGVyZSBzdGlsbC4KPj4gWWVhaCwgSSBhbHJlYWR5IGhhdmUgdGhhdCBhcyBhIHBhdGNoIHNl
dCBoZXJlLCBidXQgSSBoYXZlIHRoaXMgZGVwZW5kZW50IG9uCj4+IGEgbGFyZ2VyIHJlbmFtZSBv
ZiB0aGUgZGV2aWNlIHN0cnVjdHVyZXMuCj4gSG0gbWF5YmUgaW5jbHVkZSB0aGF0IGluIHRoZSBu
ZXh0IHJvdW5kLCBqdXN0IGZvciB0aGUgYmlnZ2VyIHBpY3R1cmU/Cj4gRG9uJ3QgaGF2ZSB0byBt
ZXJnZSBpdCBhbGwgaW4gb25lIGdvLCBqdXN0IHdhbnQgdG8gbWFrZSBzdXJlIHdlIGFncmVlIG9u
Cj4gd2hlcmUgd2UncmUgZ29pbmcuCgpJIG5lZWQgdG8gY2xlYW4gdGhpcyBzZXQgdXAgcXVpdGUg
YSBiaXQuIExldCdzIHB1c2ggdGhpcyBvbmUgaGVyZSAKdXBzdHJlYW0gZmlyc3QuCgo+Pj4gQXNp
ZGUgZnJvbSB0aGlzIGxndG0sIGJ1dCBJIGd1ZXNzIHdpbGwgY2hhbmdlIGEgYml0IHdpdGggdGhh
dCBzaHVmZmxpbmcuCj4+IFRoYW5rcyBmb3IgdGhlIHJldmlldywgZ29pbmcgdG8gc2VuZCBvdXQg
YSBuZXcgdmVyc2lvbiB3aXRoIHRoZQo+PiBmc19yZWNsYWltX2FjcXVpcmUvcmVsZWFzZSBhZGRl
ZCBpbiBhIG1pbnV0ZS4KPiBDb29sLgo+Cj4gQ2hlZXJzLCBEYW5pZWwKCkdvdCBkaXN0cmFjdGVk
IGJ5IGJ1ZyBmaXhlcyBpbiB0aGUgbGFzdCB0d28gd2Vla3MsIGJ1dCByZWFsbHkgZ29pbmcgdG8g
CnNlbmQgdGhhdCBvdXQgbm93IDopCgpDaHJpc3RpYW4uCgo+Cj4+IENocmlzdGlhbi4KPj4KPj4+
IC1EYW5pZWwKPj4+Cj4+Pj4gLS0tCj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9v
bC5jIHwgMjMgKysrKysrKysrKysrKysrKy0tLS0tLS0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9w
b29sLmMKPj4+PiBpbmRleCAxY2RhY2Q1ODc1M2EuLmYwOWUzNDYxNDIyNiAxMDA2NDQKPj4+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKPj4+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9wb29sLmMKPj4+PiBAQCAtNTA0LDEwICs1MDQsMTIgQEAgdm9pZCB0dG1f
cG9vbF9pbml0KHN0cnVjdCB0dG1fcG9vbCAqcG9vbCwgc3RydWN0IGRldmljZSAqZGV2LAo+Pj4+
ICAgIAlwb29sLT51c2VfZG1hX2FsbG9jID0gdXNlX2RtYV9hbGxvYzsKPj4+PiAgICAJcG9vbC0+
dXNlX2RtYTMyID0gdXNlX2RtYTMyOwo+Pj4+IC0JZm9yIChpID0gMDsgaSA8IFRUTV9OVU1fQ0FD
SElOR19UWVBFUzsgKytpKQo+Pj4+IC0JCWZvciAoaiA9IDA7IGogPCBNQVhfT1JERVI7ICsraikK
Pj4+PiAtCQkJdHRtX3Bvb2xfdHlwZV9pbml0KCZwb29sLT5jYWNoaW5nW2ldLm9yZGVyc1tqXSwK
Pj4+PiAtCQkJCQkgICBwb29sLCBpLCBqKTsKPj4+PiArCWlmICh1c2VfZG1hX2FsbG9jKSB7Cj4+
Pj4gKwkJZm9yIChpID0gMDsgaSA8IFRUTV9OVU1fQ0FDSElOR19UWVBFUzsgKytpKQo+Pj4+ICsJ
CQlmb3IgKGogPSAwOyBqIDwgTUFYX09SREVSOyArK2opCj4+Pj4gKwkJCQl0dG1fcG9vbF90eXBl
X2luaXQoJnBvb2wtPmNhY2hpbmdbaV0ub3JkZXJzW2pdLAo+Pj4+ICsJCQkJCQkgICBwb29sLCBp
LCBqKTsKPj4+PiArCX0KPj4+PiAgICB9Cj4+Pj4gICAgRVhQT1JUX1NZTUJPTCh0dG1fcG9vbF9p
bml0KTsKPj4+PiBAQCAtNTIzLDkgKzUyNSwxMSBAQCB2b2lkIHR0bV9wb29sX2Zpbmkoc3RydWN0
IHR0bV9wb29sICpwb29sKQo+Pj4+ICAgIHsKPj4+PiAgICAJdW5zaWduZWQgaW50IGksIGo7Cj4+
Pj4gLQlmb3IgKGkgPSAwOyBpIDwgVFRNX05VTV9DQUNISU5HX1RZUEVTOyArK2kpCj4+Pj4gLQkJ
Zm9yIChqID0gMDsgaiA8IE1BWF9PUkRFUjsgKytqKQo+Pj4+IC0JCQl0dG1fcG9vbF90eXBlX2Zp
bmkoJnBvb2wtPmNhY2hpbmdbaV0ub3JkZXJzW2pdKTsKPj4+PiArCWlmIChwb29sLT51c2VfZG1h
X2FsbG9jKSB7Cj4+Pj4gKwkJZm9yIChpID0gMDsgaSA8IFRUTV9OVU1fQ0FDSElOR19UWVBFUzsg
KytpKQo+Pj4+ICsJCQlmb3IgKGogPSAwOyBqIDwgTUFYX09SREVSOyArK2opCj4+Pj4gKwkJCQl0
dG1fcG9vbF90eXBlX2ZpbmkoJnBvb2wtPmNhY2hpbmdbaV0ub3JkZXJzW2pdKTsKPj4+PiArCX0K
Pj4+PiAgICB9Cj4+Pj4gICAgRVhQT1JUX1NZTUJPTCh0dG1fcG9vbF9maW5pKTsKPj4+PiBAQCAt
NjMwLDYgKzYzNCwxMSBAQCBpbnQgdHRtX3Bvb2xfZGVidWdmcyhzdHJ1Y3QgdHRtX3Bvb2wgKnBv
b2wsIHN0cnVjdCBzZXFfZmlsZSAqbSkKPj4+PiAgICB7Cj4+Pj4gICAgCXVuc2lnbmVkIGludCBp
Owo+Pj4+ICsJaWYgKCFwb29sLT51c2VfZG1hX2FsbG9jKSB7Cj4+Pj4gKwkJc2VxX3B1dHMobSwg
InVudXNlZFxuIik7Cj4+Pj4gKwkJcmV0dXJuIDA7Cj4+Pj4gKwl9Cj4+Pj4gKwo+Pj4+ICAgIAl0
dG1fcG9vbF9kZWJ1Z2ZzX2hlYWRlcihtKTsKPj4+PiAgICAJc3Bpbl9sb2NrKCZzaHJpbmtlcl9s
b2NrKTsKPj4+PiAtLSAKPj4+PiAyLjI1LjEKPj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
