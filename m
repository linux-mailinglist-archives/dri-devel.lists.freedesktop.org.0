Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB092F293B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82C689F5B;
	Tue, 12 Jan 2021 07:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C7388E4D;
 Tue, 12 Jan 2021 07:53:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNJOSKZpwQH7R6+8K/lnny++GLjIQMCmg7DNYyiEMh3JTB/YtYkyA5akb3WoO2U2Qh6ColjvxbGBboRt6FhZFE/1valsSdyoCVscgyL0el2RAGWf6gxSwUmmMZSsmvs2nKt6++1S4pssK+hR4V+tV2NIdjNa7zpvpWIJWTa7V7vxMzSOiFaeP7jd64zVIOXA4CIR6g/wZBCKmsYispDW1oIZIwv9ytLNCGzob2D3EIC+eqXjWKtdcfuYSufPJeL7NzMFw8yEQ4yjauAmHLfhQqncSEJq/7XVnRNAc2Itwt/z7xp4dFra5usSb1g82xkZSIXHh51oI2GxjA69BBN+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exSd/tLlkQ5wyADeq0gUTrOphkum8D9ayyaRrg2E1kw=;
 b=QZsGJ4JeqUq2TL4vpMlxNN+hG48AiLNINlr9GBGzQzcmFWsPFgkqjC8Rtqmc8SdFPPGlwWh/LziCaUWGsI6tdJwPw+HDRFjr8QwED1kzO28I4eh/jqRt8FapcthGQ1Et80q3Kn7d74HX6oKaiP6QkiLFWJJKD0/c1L9SFcBnstrVj9fLofUx5cSoT6S4mVDHLsutHj0HbLboXqTwStVkIX7nxA2tS9rCdgCrpp6SANq69+eH+Ld1dwYCQTWfGJzbGOQn1yiPoXZcAa/gYmNdJG/9ikSqUenxiv2Ujdd4EgZrjSc2Ab1BWWf4zbP9mBDX9PEsZdUoX7f05dLGvv4MiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exSd/tLlkQ5wyADeq0gUTrOphkum8D9ayyaRrg2E1kw=;
 b=JN4G9Dvj66RcdVvDqynwf1rQohb1UhH52KrUtxjdORlr2VFuRnyRHeDywePDQ4awDdZSjy07Lw4iVrCYhf66NFMFc4YACQNUzj6qB0WGY+ecT56IcgBZ0xblkcV08aU9zDbMeBljgura31UmyqeITZ7zlDTE74TRTamkH1WiGmg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2577.namprd12.prod.outlook.com (2603:10b6:207:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 07:53:09 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 07:53:09 +0000
Subject: Re: [PATCH 1/2] drm/radeon: stop re-init the TTM page pool
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210105182309.1362-1-christian.koenig@amd.com>
 <X/dN/YFtnVAIllds@phenom.ffwll.local>
 <ffa9d7f2-fe68-fb6a-8422-82b8949dbe1e@gmail.com>
 <X/hs1Rvm57zGPU8y@phenom.ffwll.local>
 <d066b08c-756c-bbef-0f30-d8c68ef92dbf@amd.com>
 <CAKMK7uGcRM8E0hYZeJCUuON7+uZnyEVtwU0HrNwhoWcw9V2uNA@mail.gmail.com>
 <42d82248-0bec-ea1c-8d6e-d032a2e53c43@gmail.com>
 <X/x6EP1HE/sjQla0@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0da70aa5-d943-687c-6d54-c825f229bf40@amd.com>
Date: Tue, 12 Jan 2021 08:53:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <X/x6EP1HE/sjQla0@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P192CA0016.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P192CA0016.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 07:53:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 38ab62c2-e3e7-49bd-a9a4-08d8b6cf1aa8
X-MS-TrafficTypeDiagnostic: BL0PR12MB2577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2577028AACBF1B83A856ABAA83AA0@BL0PR12MB2577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QdtFan3G1ZlFshHkF1/v1tckmKf9MnRNU3jNx5Wo5MLDRHMVX2DPhPCffeSgc+X24eazcIdi5EycXqhzEKq9hOIy7ke9qqruPyWsBKdk4oYJK7EEEvlyh0Rp27IDzi2KG2BR2EaHHV9GOidhP+vDKVuXu9se/ouEEPzHIObz6Hg4cwp9CKzjAmmZfSfI7TO3nINj6J4y4XkTpU73CUfycfy6xUc0MeqoBYXKURVb/BxVmiAn17/yOrvQYXO6x4RWoBDN3VbtldurmTHtkalfT2G0SOBWqzUpmXxBTidgRJ+9h5V667EZQRmYKbIi5LDoFGPyPtv2kazSjW7q5BivfQ06/C/R3BI4mNsShveF4J8fAgOQTjCWG5eNxUm6yp7e0Cuh5O0hV2TdQm8O22aEIwpEHfYqYgs31sF9Ub1WLeWbqryRvH2WZP+bWsHgS79jCA30D65sQzn9grmyqZdx09peJarjMRg8fUkApCDzPY4lt1oSwe8hlE6jDkMJwJB0eYu39cioox33XcedIUWiLJSmX6d1Lk2vbKuluHZMOf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(45080400002)(31696002)(6916009)(966005)(31686004)(5660300002)(4326008)(8676002)(66946007)(8936002)(83380400001)(16526019)(186003)(52116002)(54906003)(36756003)(53546011)(66556008)(478600001)(66476007)(316002)(6486002)(86362001)(2616005)(2906002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QjJRWHFwMFNVSjBvZmtoc1FqeE1MaStMSEJnSTQ4WnhqVmZ1NE53V2FuRWpz?=
 =?utf-8?B?eHExb0k1TGNLbGozeExhZnBmQU16SXVEMW9RczNGbEdtdkRxdGx3eFg3blFq?=
 =?utf-8?B?QW9QZllJK0dXTWwwalN0NUpjUS9mWmdUZnliNk5mTDdTenZkaTNNMlBHUGJS?=
 =?utf-8?B?YnV6ai95ZDhncFFrbTQrdDNMcEEwUnp1bi9DY0ZCU0lSQ1Z0NE1GUzZBcU5Z?=
 =?utf-8?B?OHZpRmhIOWJMUFpSYVZIZU0zeFgyK0NOOHcyRTZMQmI2bDU2UTNnRzM1N3Na?=
 =?utf-8?B?UTRLbm1yMGtydlRaZVJjR3orZWVtYktpc1dtY3kzRStZT2N5M1FOS1hPTFgz?=
 =?utf-8?B?SmIyZHdTZ2swQzJ1NWFqam4yYk9PT1htYXZRTVpNMVYwT1pwTEtCVndSaGcy?=
 =?utf-8?B?YkJJRGkxeFhBVFlURmpmN0RndDB1cGpmYTNEdzNlNlFsY0NJc1AreU1pa2FO?=
 =?utf-8?B?ZjZYOUNhaUszWGswcUd4cklQNllzRTMyNzVFbTRYczhydkFVV1BwdyszUGlH?=
 =?utf-8?B?S1A3aGVnbmpRbGR3NGxoN1p3RkY2Ykdwd1V2K05WSHpaeXdzZ29zSEg0QXRS?=
 =?utf-8?B?d2M2YVRySS9DOG1pM2lhWkpWYndqZjZra1NmNFJ1T1U2NW9pN29EMzBlSmdI?=
 =?utf-8?B?Wjc3ZFlzUEtkZTlmbWY5K2YraWpEdEVBSXZheFBXOVdiUGplUXhydEpISG9j?=
 =?utf-8?B?WUtScFJ5ZnJKcXNxVHloTHJIWERzcnJkdkh3dFBBNHQ0QUFpNjFkVnJqdGh1?=
 =?utf-8?B?SE5UU1FEUzFhUVkyN0FsclVwRndLVE1LWGFFUUNuZnRGMlRpZHFGK0d4dzlh?=
 =?utf-8?B?MW9RZnR5d2hUL1luQXMwZnFBVE45Q1p5YmtnU0o1N0hodmorRHl5eVQwQjRE?=
 =?utf-8?B?cndWZE05MGhGMWFRZmFJKzIrYnE1UHNjWjFRTGZhc1RRSTNVZGV5U1dCTytM?=
 =?utf-8?B?MU1aOEVuaHJoaG5lQ2RNUVBXaHZsOXhaMzczVmFFeXF1NjFYWTZLWXU0cFdp?=
 =?utf-8?B?eG9neWhzRkwzWFRPK1owSXI0a0M0ejhtanFJVmU2UU1ZaTdweTNnUEprQVJJ?=
 =?utf-8?B?MDQ2NTI3SDNDUkRqYTV3TXpsR3FKVDFpaldRR213bVJVY1BmQXY1djMvOFNo?=
 =?utf-8?B?bjJ2M2FRK2N3cmZSR2hlbXg0bmVqTU5UOGxZNmVTbWROalU5SVdnYlcxMXZ3?=
 =?utf-8?B?ellBZWpDc2cvUHMwK3ZLQ0REM1BzNCtaTFQ5ZWxxclBVbnhuL1BKaDNPcXJX?=
 =?utf-8?B?YlFGN1I4VEY1N0wvUXQrek82STBidi9xYk5iOGFMbFZJTVVKUk43KzVqaG4r?=
 =?utf-8?B?RkxyM1gzcVlFU1R1MGxJWEZJd3hqVGxwZXNIN1dMOUYxRWo2bTN3TWRyaHpy?=
 =?utf-8?B?TnYwa0t3dWZrZWV0QmVUbWp0dkloZXlPUjJ6ZEVJK2lOSGpHMDV3OFJHWmRU?=
 =?utf-8?Q?QXRgz3mK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 07:53:09.4082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ab62c2-e3e7-49bd-a9a4-08d8b6cf1aa8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8s6iVoEOhI18fYSG8IZjkR+4UY+54LzcNgxQ3ce7dk2hK9RhPtOpKLTkhBYn1yOg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2577
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
Cc: Huang Rui <ray.huang@amd.com>, Borislav Petkov <bp@alien8.de>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDEuMjEgdW0gMTc6MTcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgSmFu
IDExLCAyMDIxIGF0IDExOjE2OjEzQU0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDA4LjAxLjIxIHVtIDE2OjUzIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IE9uIEZyaSwg
SmFuIDgsIDIwMjEgYXQgMzozNiBQTSBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+Pj4+IEFtIDA4LjAxLjIxIHVtIDE1OjMxIHNjaHJpZWIgRGFuaWVs
IFZldHRlcjoKPj4+Pj4gT24gVGh1LCBKYW4gMDcsIDIwMjEgYXQgMDk6MDg6MjlQTSArMDEwMCwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+IEFtIDA3LjAxLjIxIHVtIDE5OjA3IHNjaHJp
ZWIgRGFuaWVsIFZldHRlcjoKPj4+Pj4+PiBPbiBUdWUsIEphbiAwNSwgMjAyMSBhdCAwNzoyMzow
OFBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+PiBEcml2ZXJzIGFyZSBu
b3Qgc3VwcG9zZWQgdG8gaW5pdCB0aGUgcGFnZSBwb29sIGRpcmVjdGx5IGFueSBtb3JlLgo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cj4+Pj4+Pj4gUGxlYXNlIGluY2x1ZGUgcmVwb3J0ZWQtYnkgY3JlZGl0
cyBhbmQgbGluayB0byB0aGUgYnVnIHJlcG9ydHMgb24KPj4+Pj4+PiBsb3JlLmtlcm5lbC5vcmcg
d2hlbiBtZXJnaW5nIHRoaXMuIEFsc28gSSBndWVzcyB0aGlzIHNob3VsZCBoYXZlIGEgRml4ZXM6
Cj4+Pj4+Pj4gbGluZT8KPj4+Pj4+IEknbSBub3QgYXdhcmUgb2YgYSBidWcgcmVwb3J0LCBidXQg
dGhlIHJlcG9ydGVkLWJ5L0ZpeGVzIGxpbmVzIGFyZSBpbmRlZWQKPj4+Pj4+IG1pc3NpbmcuCj4+
Pj4+IFRoaXMgb25lIGhlcmU6Cj4+Pj4+Cj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnBy
b3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxvcmUua2VybmVsLm9yZyUy
RmRyaS1kZXZlbCUyRjIwMjAxMjMxMTA0MDIwLkdBNDUwNCU0MHpuLnRuaWMlMkYmYW1wO2RhdGE9
MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDZmY3NzI0OTA0MDYzNGNmMjc1
MDMwOGQ4YjY0YzYxNmQlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0Mw
JTdDNjM3NDU5Nzg2NDU5NTU2MjA0JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0
d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3
QzEwMDAmYW1wO3NkYXRhPW04dGpEWEZ0c0V3dGN2OWJ5cTVyMXNiVXVxYjhxJTJCQW42M3I0YUtN
cGNhTSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Pj4+Pgo+Pj4+PiBPciBkaWQgSSBnZXQgY29uZnVzZWQs
IGFuZCB0aGUgYWJvdmUgaXMgeWV0IGFub3RoZXIgYnVnPwo+Pj4+IFllYWgsIGJ1dCB0aGF0IHdh
cyBqdXN0IHJlcG9ydGVkIGJ5IG1haWwuIFRoZSBidWcgdHJhY2tlciBJJ3ZlIHNhdyB3YXMKPj4+
PiBvcGVuZWQgYWZ0ZXIgdGhlIHBhdGNoIHdhcyBhbHJlYWR5IHB1c2hlZC4KPj4+IFN0aWxsIGdv
b2QgdG8gZ2l2ZSByZXBvcnRlZC1ieSBjcmVkaXRzIGZvciBtYWlsaW5nIGxpc3QgcmVwb3J0cyBh
bmQKPj4+IGxpbmsgdG8gbG9yZS5rZXJuZWwub3JnIGZvciB0aGUgcmVwb3J0LCB0aGF0J3Mgbm90
IGp1c3QgdXNlZnVsIGZvcgo+Pj4gYnVnemlsbGEgcmVwb3J0cy4KPj4gVGhhdCdzIGluZGVlZCB0
cnVlLCBidXQgSSB3YXMgZGlzdHJhY3RlZCBieSB0aGUgZmFjdCB0aGF0IGRybS1taXNjLWZpeGVz
Cj4+IHdhc24ndCB1cCB0byBkYXRlIDopCj4+Cj4+IEdvaW5nIHRvIGFkZCB0aGF0IGVhcmxpZXIg
bmV4dCB0aW1lLgo+Pgo+Pj4+Pj4gQlRXOiBBbnkgaWRlYSB3aHkgZGltIGFkZC1saW5rIGRvZXNu
J3Qgd29yaz8KPj4+Pj4gSG0gd2Ugb2NjYXNpb25hbGx5IGhhdmUgZnVuIHdpdGggZW1haWwgcGFy
c2luZyAoaXQncyBoYXJkKSBhbmQgZXNwZWNpYWxseQo+Pj4+PiBweXRob24gY2hhbmdlcyBpbiBo
b3cgZW5jb2RpbmdzIGFyZSBoYW5kbGVkIGRpZmZlcmVudGx5IGJldHdlZW4gcHl0aG9uMgo+Pj4+
PiBhbmQgcHl0aG9uMy4gSWYgeW91IGhhdmUgYSBzcGVjaWZpYyBleGFtcGxlIEkgY2FuIHRyeSBh
bmQgdGFrZSBhIGxvb2sgd2h5Cj4+Pj4+IGl0IGRvZXNuJ3Qgd29yay4KPj4+PiBJdCBqdXN0IGxv
b2tzIHVwIGFuZCBkb2Vzbid0IHNlZW0gdG8gZG8gYW55dGhpbmcuIEknbSBub3QgZmFtaWxpYXIg
d2l0aAo+Pj4+IHB5dGhvbiBzbyBJIGNhbiBqdXN0IGRlc2NyaWJlIHRoZSBzeW1wdG9tcy4KPj4+
IEkgbWVhbnQgdGVsbCBtZSB3aGljaCBtYWlsIChwYXRjaHdvcmsgb3IgbG9yZSkgYW5kIEknbGwg
dHJ5IHRvCj4+PiByZXByb2R1Y2UgYW5kIHNlZSB3aGF0J3MgbWF5YmUgdXAuCj4+IEl0IGRvZXNu
J3Qgc2VlbSB0byB3b3JrIGluIGdlbmVyYWwuIEUuZy4gYW55IHBhdGNoIEkgdHJ5IEkganVzdCBk
b24ndCBnZXQKPj4gYW55IHByb2dyZXNzIGluIG92ZXIgMTAgTWludXRlcy4KPj4KPj4gTWF5YmUg
c29tZSBzZXJ2ZXIgaXMgbm90IHJlc3BvbmRpbmc/Cj4gVWggZGltIGFkZC1saW5rIHByZXR0eSBz
aW1pbGFyIHRvIGRpbSBhcHBseS1wYXRjaCwgaXQgdGFrZXMgdGhlIG1ib3ggb24KPiBzdGRpbiBh
bmQgZG9lcyBvbmx5IGxvY2FsIGdpdCBzdHVmZiB3aXRoIGl0LgoKQUghIFNpbmNlIGl0IHdhcyBn
ZXR0aW5nIGEgYnJhbmNoIHBhcmFtZXRlciBJIHdhcyBhc3N1bWluZyB0aGF0IGl0IGxvb2tzIAph
dCBwYXRjaGVzIG9uIHRoYXQgYnJhbmNoIQoKVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24sCkNo
cmlzdGlhbi4KCj4gLURhbmllbAo+Cj4+IENocmlzdGlhbi4KPj4KPj4+IC1EYW5pZWwKPj4+Cj4+
Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4+IC1EYW5pZWwKPj4+Pj4KPj4+Pj4+PiBBbmQgbWF5YmUg
c29tZSB3b3JkcyBvbiBob3cvd2h5IHN0dWZmIGJsb3dzIHVwLgo+Pj4+Pj4gSnVzdCBhIHR5cG8u
IEkndmUgZm9yZ290IHRvIHJlbW92ZSB0d28gbGluZXMgaW4gcmFkZW9uIHdoaWxlIHJlYmFzaW5n
IGFuZAo+Pj4+Pj4gc3RpbGwgaGFkIHRoZSBzeW1ib2xzIGV4cG9ydGVkIHNvIG5ldmVyIG5vdGlj
ZWQgdGhpcy4KPj4+Pj4+Cj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pgo+Pj4+Pj4+IC1EYW5pZWwK
Pj4+Pj4+Pgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gICAgICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl90dG0uYyB8IDMgLS0tCj4+Pj4+Pj4+ICAgICAgMSBmaWxlIGNoYW5nZWQsIDMgZGVs
ZXRpb25zKC0pCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5j
Cj4+Pj4+Pj4+IGluZGV4IGQ0MzI4ZmY1Nzc1Ny4uMzViNzE1ZjgyZWQ4IDEwMDY0NAo+Pj4+Pj4+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+Pj4+Pj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+Pj4+Pj4+PiBAQCAtNzI5LDkg
KzcyOSw2IEBAIGludCByYWRlb25fdHRtX2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYp
Cj4+Pj4+Pj4+ICAgICAgICAgICAgICB9Cj4+Pj4+Pj4+ICAgICAgICAgICAgICByZGV2LT5tbWFu
LmluaXRpYWxpemVkID0gdHJ1ZTsKPj4+Pj4+Pj4gLSAgdHRtX3Bvb2xfaW5pdCgmcmRldi0+bW1h
bi5iZGV2LnBvb2wsIHJkZXYtPmRldiwgcmRldi0+bmVlZF9zd2lvdGxiLAo+Pj4+Pj4+PiAtICAg
ICAgICAgICAgICAgIGRtYV9hZGRyZXNzaW5nX2xpbWl0ZWQoJnJkZXYtPnBkZXYtPmRldikpOwo+
Pj4+Pj4+PiAtCj4+Pj4+Pj4+ICAgICAgICAgICAgICByID0gcmFkZW9uX3R0bV9pbml0X3ZyYW0o
cmRldik7Cj4+Pj4+Pj4+ICAgICAgICAgICAgICBpZiAocikgewo+Pj4+Pj4+PiAgICAgICAgICAg
ICAgICAgICAgICBEUk1fRVJST1IoIkZhaWxlZCBpbml0aWFsaXppbmcgVlJBTSBoZWFwLlxuIik7
Cj4+Pj4+Pj4+IC0tCj4+Pj4+Pj4+IDIuMjUuMQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+Pj4+PiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4+Pj4+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+
Pj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJs
PWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZv
JTJGZHJpLWRldmVsJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNv
bSU3Q2ZmNzcyNDkwNDA2MzRjZjI3NTAzMDhkOGI2NGM2MTZkJTdDM2RkODk2MWZlNDg4NGU2MDhl
MTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ1OTc4NjQ1OTU1NjIwNCU3Q1Vua25vd24lN0NU
V0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklr
MWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1uQmw0Q1JvU29BM3QlMkJkNHNa
NE15NEwyN0dpQ2lKd1Jlbm9JTEdVOUxiTzQlM0QmYW1wO3Jlc2VydmVkPTAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
