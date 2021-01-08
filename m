Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC7F2EF3FB
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 15:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF786E157;
	Fri,  8 Jan 2021 14:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D5436E157;
 Fri,  8 Jan 2021 14:36:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTA/INsW8nLtvni3WKjEgqMjww69mL2+xMNqtjZOJDZfmK6H5xw04x1l67owy8v8Fafg5T9hbNwVaAdNoHJLb3K1D/e2vDaY2fh8kADpaLLU//eOhJagREjT8LelRgU3R4xnbIBcG+6O25QsPc+HpiCanM9ON1gkAxWuKb/Zskh3r8pyWC71HAg3B2nitk5MSinmBDnCU/hKCXVZHWFX5oL7DBcQF/j59/21Pdd4fJqncQqWIcsMOtNf10dS5Jcfw/RdrjBcbQEb2W7ULvD/I34Yf850UQUUxrFu47BOlifdCabfGjY9rfMweAEMSOTHejylnJDZza0iWw3mlQlljw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+ztxnPGRKEDxgTVYFGr/yd9Gq3toqcfrMKKyPCHONY=;
 b=crRukf43SmJYnOzUqM531DJfZ826rFo9kKgkWcASiDvZ2vXYrR41B8yB+UEAi15rIPrRCQd04h7AN8Nhv0QzsLurD8p0h+4rwbj4IxsGui6RLFbt6+YhjBPR7jssqXiXXYM9jkAl0ZtrCfNdm93ya1TbmoPHHUoOk5x8rePTOe/uCb3L9cvcAKyy3HKxBlDoRuXC6FkMINS3zMYyGr/MzZLJ9C5NhiRNhkZUEPKSFV1GJt4pQlNF4QAA+NFiIk416Fj7PSKNCACxbxYbv96+K+JJ7w9B0q8K8dpmjTEU1TKQPN41WriCaHHbn49VtSToGmwB9smqqO4L7EeQpnkEsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+ztxnPGRKEDxgTVYFGr/yd9Gq3toqcfrMKKyPCHONY=;
 b=HX+HZOGeTgz85qS+iiEisSx1c4MgPjzNeep4AFgDJ/sRVYN0r2Gqe8KQxju3kU31Wz6efhdY7fvBDRaFbz7DQGnEddAFVj4ykmQ0Ok4BsMY9GkH3HzfTGZsta7L//T/tVxfnUJuNLF1CLddq6N61Td/pzGXbR5A+zdZIzvrXq5U=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2482.namprd12.prod.outlook.com (2603:10b6:207:4a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 14:36:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 14:36:44 +0000
Subject: Re: [PATCH 1/2] drm/radeon: stop re-init the TTM page pool
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210105182309.1362-1-christian.koenig@amd.com>
 <X/dN/YFtnVAIllds@phenom.ffwll.local>
 <ffa9d7f2-fe68-fb6a-8422-82b8949dbe1e@gmail.com>
 <X/hs1Rvm57zGPU8y@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d066b08c-756c-bbef-0f30-d8c68ef92dbf@amd.com>
Date: Fri, 8 Jan 2021 15:36:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <X/hs1Rvm57zGPU8y@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0302CA0027.eurprd03.prod.outlook.com
 (2603:10a6:205:2::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0302CA0027.eurprd03.prod.outlook.com (2603:10a6:205:2::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 14:36:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 92d5807b-6ef5-450a-e3c0-08d8b3e2d27d
X-MS-TrafficTypeDiagnostic: BL0PR12MB2482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2482AD8DB51F4D6495C88D0D83AE0@BL0PR12MB2482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 73u4TO2eVziYMrMsPoZFs3IvkYDs3RVvrQsDY36vyIoeHWGo+Ud5WetASKoPw/ebv61SPaHE2UK+iuPxRk8kYcd/kxG4FyCWLHIH91QLCksJhBjI60Brpn+1L/Vv/4AEbvu6pC42iC7R0j8IL/SWENgjwx00cjsylOLKrncVjLJ51j8hPk2cIFWx9DGggkOSwFiORTN9ao+JDesn6hR3+ptwfvCCG8nJ+ljxPFENoe/TpxA8VX2ZCgOEKZYNWh1I+YeNHeePfCuSezw0R2t7QARoX0F8wGfUw5isfxpEtOnPDLylbBhbvs6ydSWppdg+LKT8FshpCtjqxrYx6svYjEzEB0QKlZNkmNLIbywFdpT2BVBlvg700A/B4zoboSzW8V7L+MrwSN/UgedsUlo32SbadpkrmK0cvSbZNgVA+AWeUxtjBcWLC3ciP5Q8Jh/anCr2MGjp4jPhcVLN6rZiFbpDDFD0pDghr46tp81/6EdKBNUYh0WP4H6MbnxPR6+T79bgOP8CQHY1xt61M9g0rsTJJVRQ41Y50VBf2n84PfI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(86362001)(316002)(8676002)(6666004)(4326008)(45080400002)(16526019)(2616005)(31696002)(2906002)(478600001)(6916009)(8936002)(186003)(66946007)(66476007)(66556008)(6486002)(52116002)(5660300002)(966005)(31686004)(83380400001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QkNzeS8wWFdlcUNvMDViN0c4d0Q2bVdITDdQdCtDcGwwRFJ6K3NySXJUeVNO?=
 =?utf-8?B?NkRXdVFVd25tWDZBT2wxQUkveUV2SlVDbzZBanEvMCs0WUVOQVZLN1hNRlAw?=
 =?utf-8?B?aTZ2aHh1dUsrS1pZVWFleEozeWI3a0VpRlByQmY3WnBHWEdkNFFxYWdLZy9m?=
 =?utf-8?B?WUFLeXdQc2s1eGZabnltMzFwcHEzS085Z1lSajdaei9ndWdVS1lwcS8wamZm?=
 =?utf-8?B?ZzJuVzhZam5rOU5tNTF4WndIOHhrT2NsdjJlbkl4a3JEdXFheHY1SXJ3ZW1t?=
 =?utf-8?B?eVNWWGV3Y0dHWGYyNXhFZnN6VjVUd0JqdlA0a1hqeGdCRjBYbHM1TmdyZUxx?=
 =?utf-8?B?ajZYdC9POTEveExUT3VkSVdiR3A0aDM1Vm9JVnVYN0JPMThXTldJQ0F4ZHR1?=
 =?utf-8?B?NVJpdWZzNE1sK0o0MkhIT0Y0NHg3VjMreXRXRmFkeFd4eWtReGZlR21LeVk5?=
 =?utf-8?B?WHMrcUxUWkdsNTZsWFcvaHBoYUMxUDBWYk9XQk4zUlNPQU9sUlE0NmFzOWZT?=
 =?utf-8?B?eHhQM2hwK2k3MjU2WVVzWkFmU2YxK1NrQWY2ZkR4U2lTWWxyS01HMGRjaVVv?=
 =?utf-8?B?VlRzcUdzdU5tSEhpSjNhYnZHYmc4ZE12QW5mdzZaRkNvQW5ZY25yQWFmWDJx?=
 =?utf-8?B?Ky9nT3B3V0U3WVlDM253OVJiU0ZuSkVmVHZmMmlpR1Awd2RGWGZJcG1sdG1C?=
 =?utf-8?B?eFRPWE9YU25naTJTajJabWNOQzUxMXBvZForWmhRZFNiSEZxZUxzZi9ZWGNj?=
 =?utf-8?B?dmVWWGlLTC9PRXdldk1LOHNkaEVUNEdSVGg1VTZIT24wU3MxRjQyVy9vb3FH?=
 =?utf-8?B?T2VPOXQ2MVMxT0dNanY0c2pxM29RMFFGNDByZE1mM3IvWjlKMFRHaTBHN0xr?=
 =?utf-8?B?U1NSL3M1dDh6eFp6ZnY1U3dDSUI1NExvODNWaVIra0hYSDZ1cWJPYTFCTkZD?=
 =?utf-8?B?aTdqd28rYk1vQUNFQWhETWtkUURhZ1d1S0VScCtacktHWXhxVCt3bE5aUVZI?=
 =?utf-8?B?K1hXckFtdzZaV0hIVkh5T1lRbFdwWkhhdFlCZWFTZ0orUGM2M0tqNXd4UVlp?=
 =?utf-8?B?OUUrRlhEeDBLbURPcXVDWVRmNDBjZm0xY054WUxoa21MZWt0cnFTUmdzNlNB?=
 =?utf-8?B?WHA2K0dWdXBzdEFseGRWUm1BSWxURHRIVllJTElJM1A5RHdxZGNacEpILzlo?=
 =?utf-8?B?aTBDWDQxblJXVXVoUnczQ1htc3d0VDVpUCtIZ3N5YmRmOTA3WFZDb2NHU0Rv?=
 =?utf-8?B?SnJJZ20xQmtLMzEyK281RXZQQ0szK0ZlZ0x3TlQ0eTFiQmRMUm5FU0d3YXdq?=
 =?utf-8?B?TnN5Tk1ma283dXVaTkJzT29aaXY2RFJlcHlPR0thbjE4ZmJMNGZwcVk0Z2RO?=
 =?utf-8?B?TVJ4M1lEaElraW94MFFXbkZhalk3cHZ0cUFoZkh1ZnFwWW9GNHo5Qlcyb1cr?=
 =?utf-8?Q?j7Jxb7fT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 14:36:44.7751 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d5807b-6ef5-450a-e3c0-08d8b3e2d27d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgZjc9ETqil5OB6EkeMY21azx2XzPEzmucwAv921iTrSDi13fbYQlSBkgKIDy7y9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2482
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
Cc: ray.huang@amd.com, bp@alien8.de, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDEuMjEgdW0gMTU6MzEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgSmFu
IDA3LCAyMDIxIGF0IDA5OjA4OjI5UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDA3LjAxLjIxIHVtIDE5OjA3IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IE9uIFR1ZSwg
SmFuIDA1LCAyMDIxIGF0IDA3OjIzOjA4UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+Pj4gRHJpdmVycyBhcmUgbm90IHN1cHBvc2VkIHRvIGluaXQgdGhlIHBhZ2UgcG9vbCBkaXJl
Y3RseSBhbnkgbW9yZS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+IFBsZWFzZSBpbmNsdWRlIHJlcG9ydGVkLWJ5
IGNyZWRpdHMgYW5kIGxpbmsgdG8gdGhlIGJ1ZyByZXBvcnRzIG9uCj4+PiBsb3JlLmtlcm5lbC5v
cmcgd2hlbiBtZXJnaW5nIHRoaXMuIEFsc28gSSBndWVzcyB0aGlzIHNob3VsZCBoYXZlIGEgRml4
ZXM6Cj4+PiBsaW5lPwo+PiBJJ20gbm90IGF3YXJlIG9mIGEgYnVnIHJlcG9ydCwgYnV0IHRoZSBy
ZXBvcnRlZC1ieS9GaXhlcyBsaW5lcyBhcmUgaW5kZWVkCj4+IG1pc3NpbmcuCj4gVGhpcyBvbmUg
aGVyZToKPgo+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmxvcmUua2VybmVsLm9yZyUyRmRyaS1kZXZlbCUyRjIwMjAxMjMx
MTA0MDIwLkdBNDUwNCU0MHpuLnRuaWMlMkYmYW1wO2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5r
b2VuaWclNDBhbWQuY29tJTdDM2FlZGUyMDMzNDhiNGYzMmVhMzEwOGQ4YjNlMjI0ZWMlN0MzZGQ4
OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDU3MTMxMTc5MjU4NDg4
JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1
TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPWJIVnc0
bGoxZjhnNG9oVlRldUtOa2IwTEFiTHdZNk40S1dvcnRyM1Z0QW8lM0QmYW1wO3Jlc2VydmVkPTAK
Pgo+IE9yIGRpZCBJIGdldCBjb25mdXNlZCwgYW5kIHRoZSBhYm92ZSBpcyB5ZXQgYW5vdGhlciBi
dWc/CgpZZWFoLCBidXQgdGhhdCB3YXMganVzdCByZXBvcnRlZCBieSBtYWlsLiBUaGUgYnVnIHRy
YWNrZXIgSSd2ZSBzYXcgd2FzIApvcGVuZWQgYWZ0ZXIgdGhlIHBhdGNoIHdhcyBhbHJlYWR5IHB1
c2hlZC4KCj4KPj4gQlRXOiBBbnkgaWRlYSB3aHkgZGltIGFkZC1saW5rIGRvZXNuJ3Qgd29yaz8K
PiBIbSB3ZSBvY2Nhc2lvbmFsbHkgaGF2ZSBmdW4gd2l0aCBlbWFpbCBwYXJzaW5nIChpdCdzIGhh
cmQpIGFuZCBlc3BlY2lhbGx5Cj4gcHl0aG9uIGNoYW5nZXMgaW4gaG93IGVuY29kaW5ncyBhcmUg
aGFuZGxlZCBkaWZmZXJlbnRseSBiZXR3ZWVuIHB5dGhvbjIKPiBhbmQgcHl0aG9uMy4gSWYgeW91
IGhhdmUgYSBzcGVjaWZpYyBleGFtcGxlIEkgY2FuIHRyeSBhbmQgdGFrZSBhIGxvb2sgd2h5Cj4g
aXQgZG9lc24ndCB3b3JrLgoKSXQganVzdCBsb29rcyB1cCBhbmQgZG9lc24ndCBzZWVtIHRvIGRv
IGFueXRoaW5nLiBJJ20gbm90IGZhbWlsaWFyIHdpdGggCnB5dGhvbiBzbyBJIGNhbiBqdXN0IGRl
c2NyaWJlIHRoZSBzeW1wdG9tcy4KCkNocmlzdGlhbi4KCj4gLURhbmllbAo+Cj4+PiBBbmQgbWF5
YmUgc29tZSB3b3JkcyBvbiBob3cvd2h5IHN0dWZmIGJsb3dzIHVwLgo+PiBKdXN0IGEgdHlwby4g
SSd2ZSBmb3Jnb3QgdG8gcmVtb3ZlIHR3byBsaW5lcyBpbiByYWRlb24gd2hpbGUgcmViYXNpbmcg
YW5kCj4+IHN0aWxsIGhhZCB0aGUgc3ltYm9scyBleHBvcnRlZCBzbyBuZXZlciBub3RpY2VkIHRo
aXMuCj4+Cj4+IENocmlzdGlhbi4KPj4KPj4+IC1EYW5pZWwKPj4+Cj4+Pj4gLS0tCj4+Pj4gICAg
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMgfCAzIC0tLQo+Pj4+ICAgIDEgZmls
ZSBjaGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fdHRtLmMKPj4+PiBpbmRleCBkNDMyOGZmNTc3NTcuLjM1YjcxNWY4MmVkOCAxMDA2NDQKPj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+Pj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCj4+Pj4gQEAgLTcyOSw5ICs3MjksNiBA
QCBpbnQgcmFkZW9uX3R0bV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQo+Pj4+ICAg
IAl9Cj4+Pj4gICAgCXJkZXYtPm1tYW4uaW5pdGlhbGl6ZWQgPSB0cnVlOwo+Pj4+IC0JdHRtX3Bv
b2xfaW5pdCgmcmRldi0+bW1hbi5iZGV2LnBvb2wsIHJkZXYtPmRldiwgcmRldi0+bmVlZF9zd2lv
dGxiLAo+Pj4+IC0JCSAgICAgIGRtYV9hZGRyZXNzaW5nX2xpbWl0ZWQoJnJkZXYtPnBkZXYtPmRl
dikpOwo+Pj4+IC0KPj4+PiAgICAJciA9IHJhZGVvbl90dG1faW5pdF92cmFtKHJkZXYpOwo+Pj4+
ICAgIAlpZiAocikgewo+Pj4+ICAgIAkJRFJNX0VSUk9SKCJGYWlsZWQgaW5pdGlhbGl6aW5nIFZS
QU0gaGVhcC5cbiIpOwo+Pj4+IC0tIAo+Pj4+IDIuMjUuMQo+Pj4+Cj4+Pj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4+Pj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+IGh0dHBzOi8v
bmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUy
Rmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmRyaS1kZXZlbCZh
bXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0MzYWVkZTIwMzM0
OGI0ZjMyZWEzMTA4ZDhiM2UyMjRlYyU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNk
JTdDMCU3QzAlN0M2Mzc0NTcxMzExNzkyNTg0ODglN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlK
V0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2
TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9cEh6dUFzSmNYZjVIbEFmSjd3WVljJTJCc2l6WmhTTEJH
V1hCaEN5Vk5SQ2ZvJTNEJmFtcDtyZXNlcnZlZD0wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
