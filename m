Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C62B7BCC
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 11:52:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E72B16E3DB;
	Wed, 18 Nov 2020 10:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847F36E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 10:52:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5oMi4G8TpkwRpXppPwHnfLhAGWVK8+FZIamAM0S7OzzpHmSk2SeJyzoLKwmtr9hQsfLuGYmdiFgpII08BNE40FItSoR8PWwsbAMg+8RerFrYZvmHmG5+UFKGhlPMjB1w/LQH7CTuIwk0Gl9x9q7zfy2FgcdC2I2EKVzMDz6JqUA/3wgCg0ikadxklKTfWi/BcXHHz4Ti6NdsgvLoMoLfE+G0esDQVed61Df/2EWI/fYjufQijpx8/AsmrBM21dxBThh6rTaXE8FnitvVOAQGn/L3uDDZEYlH1jccK48VuEO1+WpNcVsfyDJUZqCqrGZ4vXx4rdR864VMMTmSdW1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/Lv9DASJVxUBFu8JfKmmPIx+FQYpIEy4tV5juOi3Hs=;
 b=WaPsAf+mh2fIxa48tArle6WzHF4P5ifYtIvCt0emwhTUmJg4wIBKxrx1QbL5RRcNzIpekDvkSJQsKueodbepGVtLSL20GMpV0BVV8eVQfjKvrNvCBnGePAxVJoIEg0CUmmR3pczyiiT1LjYCbALCsh/XEvj4qyV1+D+ahtNCFqlNAWL/T6gELZ60CIl3T7+4Y56LtKhq+MzNj/2/oeH/ErEwGpiCQjpvR13JHv7f69w3sowmTH9Kq34gyeuIsdk2iqVeHcCG3meurhNMsX6933aZD+Fn8ILDmft/l8zXdqtxJ+Y7sBwKnVYOmLuwY2sp2yBibVUX2YLlWiLwaNlKQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/Lv9DASJVxUBFu8JfKmmPIx+FQYpIEy4tV5juOi3Hs=;
 b=Ul5HYGAWsdl8AyRGM6M7XzxGT9gGoz3piAZJm4oW/REPqfJT5RjWD4ZTTFdtbb1My6psejeln+cZwz9eNJ2akEnDAJt/xtyk0lUpeFa1FvG6bP1IJEf5YSk47s9ASCll0nEFhw8v+8sFFWqAooX1j5nH0bAiB8/ehbpx1gqCJsI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3725.namprd12.prod.outlook.com (2603:10b6:208:162::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 10:52:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Wed, 18 Nov 2020
 10:52:06 +0000
Subject: Re: [PATCH] char/agp: Disable frontend without CONFIG_DRM_LEGACY
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20201117214029.591896-1-daniel.vetter@ffwll.ch>
 <f2fa78c0-047e-de26-579e-7c75110005a3@suse.de>
 <8526d6c3-5d35-d605-0bb6-44ce323740f7@amd.com>
 <CAKMK7uGk4JMGiXTuPDAvAMnRm-oiUhqQ9+4BKz0FEHBDJyXn-w@mail.gmail.com>
 <f9be6af7-1409-eae4-b895-9b630442185e@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <964b4d3e-1a91-f081-64d9-00f4176f2f4a@amd.com>
Date: Wed, 18 Nov 2020 11:51:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f9be6af7-1409-eae4-b895-9b630442185e@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0119.eurprd04.prod.outlook.com
 (2603:10a6:208:55::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0119.eurprd04.prod.outlook.com (2603:10a6:208:55::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 10:52:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9ed509f5-145e-4d3f-d331-08d88baffc78
X-MS-TrafficTypeDiagnostic: MN2PR12MB3725:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3725E0B2AF646491281AA2B783E10@MN2PR12MB3725.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLJYr63fpKj0vJP0f1hjiPOuVpKCx/A8uGGrYzFSMOH/fDUV37uc4yC4ZC9N2Y9bIn4Dad/8dY677yIa6Zj7OKgpJkkxzZJlDyIL3SLBFQ6L1V8QO+CqMBtxe72w/N4li74QTiOUTkRUmqWmQYPpRiXaw3ti3jo9J41ihix4qDlzP0KWroVJRYse3Vfi2tjldhJsNfJ1vJi6A00tmI9wylzHCeYzGzFzN1lb09KLVAQ55wX9uCP505SuJEy3F4Bkt82m3JWOIbpfBXPOS4f+pun9Q40sVL3Bcz9G/zstdA67641k3ZTbgqMeaHTOfYHN/1djLvu8y9Cjgl4aFkwuj9nd+pj7pcnGJTDKMDyQu/HKqnvWnS7F/mMgjq8pB3Wo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(31696002)(8676002)(31686004)(8936002)(478600001)(66574015)(83380400001)(4326008)(110136005)(54906003)(6486002)(316002)(2616005)(5660300002)(53546011)(52116002)(6666004)(66946007)(2906002)(36756003)(66556008)(86362001)(186003)(16526019)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dEtWclowQXFwNGVmcjdEVHFhVzhQZ0N1c3cxc1hqcjFveVI0bTZQV21uTnY5?=
 =?utf-8?B?YmR6ZFhJMUNtVytBb1VmT0JkTXFGWnQyeFIvbktSUEpiaGpOTDJHRVV1NGdy?=
 =?utf-8?B?L2RvRTBsY052WFBtdSt5WDZtZitVdTFoN1pNWkxIbFkxdzdycnVzUVZ1RWZt?=
 =?utf-8?B?TGhnSGVvUExYY3VrYVovRmdYYUtVWTl3Ymg5QnRJWU1CL1d0Vm43MzArdDQ5?=
 =?utf-8?B?QnVIZWY5QjIzSVZMUzVRc0dBYXFhUFMrTlAwdm9mR1I1emVGeUZjaEpnRE1L?=
 =?utf-8?B?MUxSVGgrU2V6UFpzZXpmWHRvVW9kRU1tSm1tSXJsbU1BTTIrcnhsbTNCcU0y?=
 =?utf-8?B?SXJsS0xIT1pkOHV6Szl5dVRhUTZ2bEtYNUJMNzUwUVF3bEVqcUpiQXRrVlpI?=
 =?utf-8?B?emdZajg2OWdhdFR0MGhOZHVFbXUzNGFSVElnMVNoUnk2VDdOY240QlZud0E3?=
 =?utf-8?B?eG9pK0gzTlpKTkpZZ0N5M09oS3l4L2F6a1ZRa0UwYUgvenRZUVM4OEROV0FJ?=
 =?utf-8?B?cS9EVjgvVUJLYnJCNWtEZmtVUHprRkl3WEFQTUg1NVdtYml0SzNEVng5R3p0?=
 =?utf-8?B?N0NjN1JHbVRLNWRjVUxmMWw0aVpIL3AyaHFHdzJEeWczMGJwbGdwNWlYOE96?=
 =?utf-8?B?WUZqY0h1bkNJd2FhVVlpRmZyTWZuRzlLRzVKUkhadmlDanVpeEVBK25oWUk2?=
 =?utf-8?B?OUdhSFp6STFSTVd6MFBnd1VqRm5vd0lKNHArMkFiNGxLMmd4UkhXaFdrRHpM?=
 =?utf-8?B?ZjQ3MzdxaUgreU11Y0dScWUrQjR6Z0QwOUdpRHVXUW1CdUZ0WDkwNzN2UnJP?=
 =?utf-8?B?L2tzTjlaZjV4NFFEcXFoM2FwZ0dwRUdJbExibU9aU1Z3Z3c3YWkrOVpRSVBo?=
 =?utf-8?B?VEpRQTVEUEt0Njg4L3M0djdnd1hrVzJ6REY2M0RXQ0syYmh4UjE2dm9xbTZx?=
 =?utf-8?B?eGhwUnc0bDREclAxUW5RcmNVZGQ5NDV1YSt3U01vTmtxUng2OUJMbU5uR1Zu?=
 =?utf-8?B?ZEErZy9GYzBZQ2FLbHg4a2ZrMDZkc2IwVEtpYU4vSnJ2b0w3Z2VmNkJGT0lD?=
 =?utf-8?B?dFAvQzdxMWNsWnNCZFZOYy8vQnpYbGxOQmVmZHRJRkgxbHBLL1hhdjJlMFVr?=
 =?utf-8?B?N0JMSGhBbkdRQzJpTkpZVi9RSGhjT1N4cm5nRUpOekJCdlRBc0E0T3lkdjAx?=
 =?utf-8?B?Q3BWWFlNRTA3QTJOWVRXYlozbWhrdVZQOXVSZjhVbGp4ZmRmNTZweWVUejA2?=
 =?utf-8?B?V3ZsQ1JYYVdwK1grUHFKcjRRTE9NU0JnbnJLR1BkRE8yQkRQdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed509f5-145e-4d3f-d331-08d88baffc78
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 10:52:05.9770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8zxn4Z+CeAPFcX683TwOa0nlMfZ8VldTp2gTo5QQhc4/SMQYX4bU4dF82dp0w9Qw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3725
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMTEuMjAgdW0gMTA6MDIgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMTguMTEuMjAgdW0gMDk6NTMgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+PiBPbiBXZWQsIE5v
diAxOCwgMjAyMCBhdCA5OjI0IEFNIENocmlzdGlhbiBLw7ZuaWcKPj4gPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4gQW0gMTguMTEuMjAgdW0gMDk6MDIgc2NocmllYiBU
aG9tYXMgWmltbWVybWFubjoKPj4+PiBIaQo+Pj4+Cj4+Pj4gQW0gMTcuMTEuMjAgdW0gMjI6NDAg
c2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4+PiBJdCdzIHByb2JhYmx5IGZ1bGwgb2YgYnVncyBy
ZWFkeSBmb3IgZXhwbG9pdGluZyBieSB1c2Vyc3BhY2UuIEFuZAo+Pj4+PiB0aGVyZSdzIG5vdCBn
b2luZyB0byBiZSBhbnkgdXNlcnNwYWNlIGZvciB0aGlzIHdpdGhvdXQgYW55IG9mIHRoZSBkcm0K
Pj4+Pj4gbGVnYWN5IGRyaXZlcnMgZW5hYmxlZCB0b28uIFNvIGp1c3QgY291cGxlIGl0IHRvZ2V0
aGVyLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGludGVsLmNvbT4KPj4+Pj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
Pj4+Pj4gQ2M6IEFkYW0gSmFja3NvbiA8YWpheEByZWRoYXQuY29tPgo+Pj4+PiAtLS0KPj4+Pj4g
wqDCoCBkcml2ZXJzL2NoYXIvYWdwL01ha2VmaWxlIHwgNiArKysrKy0KPj4+Pj4gwqDCoCBkcml2
ZXJzL2NoYXIvYWdwL2FncC5owqDCoMKgIHwgNSArKysrKwo+Pj4+PiDCoMKgIDIgZmlsZXMgY2hh
bmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jaGFyL2FncC9NYWtlZmlsZSBiL2RyaXZlcnMvY2hhci9hZ3AvTWFrZWZp
bGUKPj4+Pj4gaW5kZXggY2IyNDk3ZDE1N2Y2Li45MGVkOGM3ODllNDggMTAwNjQ0Cj4+Pj4+IC0t
LSBhL2RyaXZlcnMvY2hhci9hZ3AvTWFrZWZpbGUKPj4+Pj4gKysrIGIvZHJpdmVycy9jaGFyL2Fn
cC9NYWtlZmlsZQo+Pj4+PiBAQCAtMSw3ICsxLDExIEBACj4+Pj4+IMKgwqAgIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMAo+Pj4+PiAtYWdwZ2FydC15IDo9IGJhY2tlbmQubyBmcm9u
dGVuZC5vIGdlbmVyaWMubyBpc29jaC5vCj4+Pj4+ICthZ3BnYXJ0LXkgOj0gYmFja2VuZC5vIGdl
bmVyaWMubyBpc29jaC5vCj4+Pj4+Cj4+Pj4+ICtpZmVxICgkKENPTkZJR19EUk1fTEVHQUNZKSx5
KQo+Pj4+PiDCoMKgIGFncGdhcnQtJChDT05GSUdfQ09NUEFUKcKgwqAgKz0gY29tcGF0X2lvY3Rs
Lm8KPj4+Pj4gK2FncGdhcnQtecKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAr
PSBmcm9udGVuZC5vCj4+Pj4+ICtlbmRpZgo+Pj4+PiArCj4+Pj4+Cj4+Pj4+IMKgwqAgb2JqLSQo
Q09ORklHX0FHUCnCoMKgwqDCoMKgwqDCoMKgwqAgKz0gYWdwZ2FydC5vCj4+Pj4+IMKgwqAgb2Jq
LSQoQ09ORklHX0FHUF9BTEkpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKz0gYWxpLWFncC5v
Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2NoYXIvYWdwL2FncC5oIGIvZHJpdmVycy9jaGFy
L2FncC9hZ3AuaAo+Pj4+PiBpbmRleCA0ZWIxYzc3MmRlZDcuLmJiMDlkNjRjZDUxZSAxMDA2NDQK
Pj4+Pj4gLS0tIGEvZHJpdmVycy9jaGFyL2FncC9hZ3AuaAo+Pj4+PiArKysgYi9kcml2ZXJzL2No
YXIvYWdwL2FncC5oCj4+Pj4+IEBAIC0xODYsOCArMTg2LDEzIEBAIGludCBhZ3BfYWRkX2JyaWRn
ZShzdHJ1Y3QgYWdwX2JyaWRnZV9kYXRhIAo+Pj4+PiAqYnJpZGdlKTsKPj4+Pj4gwqDCoCB2b2lk
IGFncF9yZW1vdmVfYnJpZGdlKHN0cnVjdCBhZ3BfYnJpZGdlX2RhdGEgKmJyaWRnZSk7Cj4+Pj4+
Cj4+Pj4+IMKgwqAgLyogRnJvbnRlbmQgcm91dGluZXMuICovCj4+Pj4+ICsjaWYgSVNfRU5BQkxF
RChDT05GSUdfRFJNX0xFR0FDWSkKPj4+Pj4gwqDCoCBpbnQgYWdwX2Zyb250ZW5kX2luaXRpYWxp
emUodm9pZCk7Cj4+Pj4+IMKgwqAgdm9pZCBhZ3BfZnJvbnRlbmRfY2xlYW51cCh2b2lkKTsKPj4+
Pj4gKyNlbHNlCj4+Pj4+ICtzdGF0aWMgaW5saW5lIGludCBhZ3BfZnJvbnRlbmRfaW5pdGlhbGl6
ZSh2b2lkKSB7IHJldHVybiAwOyB9Cj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgYWdwX2Zyb250
ZW5kX2NsZWFudXAodm9pZCkge30KPj4+Pj4gKyNlbmRpZgo+Pj4+IFRoZXJlJ3Mgb25lIG5vbi1s
ZWdhY3kgZHJpdmVyIHRoYXQgdXNlcyB0aGVzZSBhZ3Agc3RydWN0dXJlcywgd2hpY2ggaXMKPj4+
PiByYWRlb24uIERvZXMgdGhpcyBjaGFuZ2UgYWZmZWN0IHJhZGVvbj8KPj4+Cj4+PiBOb3V2ZWF1
IHVzZXMgQUdQIGFzIHdlbGwsIGJ1dCBJJ20gbm90IHN1cmUgaWYgYm90aCBkcml2ZXJzIHVzZSBh
bnkgb2YKPj4+IHRoaXMgc3R1ZmYuCj4+Cj4+IGZyb250ZW5kID0gL2Rldi9hZ3AgY2hhcmRldiBp
bnRlcmZhY2UgZm9yIHVzZXJzcGFjZSBkcml2ZXJzLiBJZiB5b3UncmUKPj4gbG9va2luZyBhdCBr
ZXJuZWwgZHJpdmVycywgeW91J3JlIGxvb2tpbmcgYXQgdGhlIHdyb25nIHRoaW5nLCB0aGUKPj4g
a2VybmVsLWludGVybmFsIGludGVyZmFjZSBpcyBpbiBjaGFyL2FncC9iYWNrZW5kLmMgYW5kIHN0
aWxsIGVuYWJsZWQuCj4+IFNvIG5vIGltcGFjdCBhdCBhbGwgb24gYW55IGtlcm5lbCBjb2RlLgo+
Pgo+PiBOb3cgdGhlIGltcGFjdCB0aGlzIGRvZXMgaGF2ZSBvbiBrbXMgZHJpdmVycyB1c2luZyBh
Z3AgaXMgdGhhdCB0aGVyZSdzCj4+IG5vIGxvbmdlciBhIHVzZXJzcGFjZSBpb2N0bCBpbnRlcmZh
Y2UgdG8gY2hhbmdlIHRoZSBhZ3Agc2V0dXAgYW5kCj4+IG1hcHBpbmdzIGFuZCBmaWdodCB0aGUg
a21zIGRyaXZlciAod2hpY2ggYXNzdW1lcyBpdCdzIGZ1bGx5IGluIGNvbnRyb2wKPj4gb2YgYWdw
IGNvbmZpZ3VyYXRpb24pLgoKSSB3YXMgc3Ryb25nbHkgYXNzdW1pbmcgc29tZXRoaW5nIGxpa2Ug
dGhpcywgdGhhbmtzIGZvciBjbGFyaWZ5aW5nLgoKPgo+IFRoYW5rcyBmb3IgY2xhcmlmeWluZy4g
SSdtIGNlcnRhaW5seSBub3QgcXVhbGlmaWVkLCBidXQgc3RpbGwKPgo+IEFja2VkLWJ5OiBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KCkFja2VkLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IGFzIHdlbGwuCgpSZWdhcmRzLApDaHJp
c3RpYW4uCgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPj4gLURhbmllbAo+Pgo+Pj4KPj4+
IFJlZ2FyZHMsCj4+PiBDaHJpc3RpYW4uCj4+Pgo+Pj4+Cj4+Pj4gQmVzdCByZWdhcmRzCj4+Pj4g
VGhvbWFzCj4+Pj4KPj4+Pj4KPj4+Pj4gwqDCoCAvKiBHZW5lcmljIHJvdXRpbmVzLiAqLwo+Pj4+
PiDCoMKgIHZvaWQgYWdwX2dlbmVyaWNfZW5hYmxlKHN0cnVjdCBhZ3BfYnJpZGdlX2RhdGEgKmJy
aWRnZSwgdTMyIG1vZGUpOwo+Pj4+Pgo+Pj4KPj4KPj4KPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
