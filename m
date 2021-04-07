Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 559A8357500
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 21:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 411EE6E983;
	Wed,  7 Apr 2021 19:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2064.outbound.protection.outlook.com [40.107.101.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDDD6E97D;
 Wed,  7 Apr 2021 19:34:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C61jPzUZ2odVUM2MC7ASCWcsIwEkyacYfyh8RI8U5f3GIjAIVYpL7FQW6m4cqZf9pEJ5/V19H/kX/WsK2fe8QHFpGQxcVc4TQ8C1E/pgNrtsPSjzm7CqNIxjGk74tEvnB3nuo1nlTr48gydYEnK2i7VC/tLX6IwEPgMv/SKOrdzU1aK5JG6zZ0Y8ApBteHOP4yPFK7hC+7CSWEBs7JyjyVvppBlHvBIvtifuLyDYKEwgbgRTG0yZ/fSGznt2Isv4Xu0VKoNhy7Hf933c0uTOL029a4Jam6NHK/phUXUX5dhmM7A49m609RI5XMJ3flJNgSHujHo9n9zzUN2Jew6rnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC9TGH1cTP8MNzhDzhIvlQ2BL1mzAmycEMYHI4v0pf8=;
 b=VfnpGYClCo9IbWOLNleve5NqsoQ7vjTXznWFpqFP24zIoyV39LIQRpI8yYg/MbdCBWsqczApVqWMEfvByT3Pg4a2oPQtSFzmrOoWGxDmsGf8RjJ7ezjoIV2LdyfFo79Bict6SKYSF0VxKJ7KOG5MLf4cHj4q2fgh1nviABdIpXVrSqq1/6zwNsmVCU6Rm9uBgHzgng1ClBWQowjnIEJUMhu93LIIvxEVZfeNUaOLvdafffl3WF0rJe4wk+f/x69NUc98fWNXNJZOznnbzevF6JWvur8hURzZYYAmh8gbToNH5KAZ3QTvQcNxN2111QmCG5tVnuQAjUEBUwcs9E9nVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC9TGH1cTP8MNzhDzhIvlQ2BL1mzAmycEMYHI4v0pf8=;
 b=mdO3+xga0SJfxwLE8sjajtPBPgVE2H/LdAa0Ozi62sV1BEzqKJz6GAUbmHCn70kM77lClvedKvVC++GyRXgPnqqhG8gcMjpFo5QL1iyfdgENNXayWhF1auiF0MavbF7KPd0KW14Y+RpD1X9+Se2g8t7t4FMu+Qtk0CoXxvyECnI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 7 Apr
 2021 19:34:08 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Wed, 7 Apr 2021
 19:34:08 +0000
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
 <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
 <9db18654-770f-459b-a89a-c57dc8a21bac@amd.com>
 <573dca0f-d017-3614-5e4f-d8d0b6bc413f@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <780bb477-77c3-2f3c-2417-edeffccd63b9@amd.com>
Date: Wed, 7 Apr 2021 15:34:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <573dca0f-d017-3614-5e4f-d8d0b6bc413f@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27)
 To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.80] (165.204.55.251) by
 YT1PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Wed, 7 Apr 2021 19:34:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 683e5b31-f16b-46de-ecbd-08d8f9fc1c97
X-MS-TrafficTypeDiagnostic: MN2PR12MB4254:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4254A7143ED528A6C8318E8892759@MN2PR12MB4254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zVxAD2EG9ucgTX4eWYkvtHGEXtZSB6q96jsPbPaxooIhWJCWuSqoBGebyp2NrX0Rr0XB0SFYCFm9tAWR6gOCJZxFmtGM+Ne2oIOsap6eQt1emyhj7s9VcmMKZb3rHsDtfo4mrz6aTiQ1iwA8yPCWojAcWcJthUsMpkFTenrJF7uahsplnrXzvauKDnY+mEP08cQ8n/93XMXzmfYoErhGO1rRuYtVqrweZYMBqAMoC6Kbo7Ety7cuCltnN/1HXeVWgXevDM+B2PRO56s/EBTfWeonyPvKDZDhMNK9hvulHD9gW65UoO7q91cz2Uj6NcR9t5AT1JNwdrZlDhFgmxXFNJnQLLtWjJtUKpCTutS+5BdPCc1LtJlRw5/mV+LFz9smw0LIcZUvIHLI5JEdak8QbQTneLBUorW4g89AyWld1OrSPd6ykBhz0nH8celPcdhv5EjzmEyUJ/mvvyny5+OXBlJmWqx01egCQ0tA+oJdODARjaGYgDqGjTutyNffqotXqjP1pASAjJGKrR6Fyo9eNOxEBjvkU3qvBHrsBfWi4dtC8sDokmOasnV8I/7jDV4FjwhURanhyX5/5A5Ys++mggDBUo+oYt6HV1LLrnTSIxnmqmniS4Hqq08ewYAym3+V6p9I9R4IqlhpdL9QioB9EER3S1+W1Pt8QrHqF57haRVpVLqN5Pa+GR3RZcO5aG5zbkUE0zT8Z22XoGMljqN8uHhyMfHY+HK2R+ftDpq/C2qT6UD/lukAk5S5KlIwA2YScDyxYTmy7mDBo2oCrD4rrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(86362001)(31696002)(8676002)(921005)(2616005)(956004)(26005)(31686004)(38350700001)(38100700001)(316002)(6486002)(5660300002)(110136005)(16576012)(83380400001)(53546011)(186003)(66946007)(478600001)(16526019)(36756003)(66556008)(66476007)(8936002)(2906002)(4326008)(6636002)(7416002)(66574015)(36916002)(44832011)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VVVGa3loTy9JbVZVU1NhNzNndGNSSWhXMnRKY05xdEZLUkhpSEtmckYrTkEz?=
 =?utf-8?B?S3J1QVdsTWVGVjBMN0tPVllyc01nK2RvRnZzR1U0WUo4bVBhNUw5UWtJVGt5?=
 =?utf-8?B?dzlVcVdWMEQ1cDRtQXpucmo4b1pzQUZaeG9TS0RsbVB6aFRLT1FpTG1HRTNW?=
 =?utf-8?B?TEtReFlSL3BxOWJkMXZYbW9ueVo4TWFlOUthTW4rK2Rjc2VFaGlXbG45Smt6?=
 =?utf-8?B?SS9FdjhFK1JEOVZvNkpMT01SRm5QZmZoTW5IcjBnbHZQMnNoM0p1VlY2aS85?=
 =?utf-8?B?cCtpQjRScUFoVndMQm8wVHZZem4vYTN2OFZtRWJqWXNMbjA2dzVoTUlBWngy?=
 =?utf-8?B?MUovK0EweExMTTJ1VXI1R1M5L3FFbHJDNWE2UHlqdjFTMnN1VnJTQ3FUV1Bn?=
 =?utf-8?B?UzZPT050K1NpUFMvV0NaL3pqeHdSYWJnTkw5VGdTWUVNblRXb01jZy9uTG9Y?=
 =?utf-8?B?SU9BRklwUVIzdXEzbk1OVk85L1VIaFhiQ2I2YWtuMEREdVRuUGtTRVZ5V09a?=
 =?utf-8?B?aXlUVzlMWWZBM0pheFg1MWZyMlBjVTBuelhGbzBncWR4dXNkTzdEcCtkT3Fs?=
 =?utf-8?B?NmpqdTBzSmJLeUVudldxWW5SaXZFUzk2andJb3FpRDMwTFFhQ2szMWsvUDU3?=
 =?utf-8?B?d0F5akZFbi9rL1hZRklYSEd5RU5GMWx2a1gwOTFiNnpiSjNFeWVoMVUwYmJh?=
 =?utf-8?B?MG1kS29wazZYemNTQVVXRnNMTUl0UnJpcUQ5YnN1NTR4c0VQd0VCbnJ1REsx?=
 =?utf-8?B?cnlQbGl2SXRBYnphWG10SHNGT1NxZ1gyR092N0xzenZTbEpkQndLdkZ0Z1JQ?=
 =?utf-8?B?aHAzWXZ4aS8veHhsRUQ1bTFWcGxEelJWZXkxeVZlOEszSlBZdmgwMnNsdnB3?=
 =?utf-8?B?ZGFxWXpBY01xNENUZ3BLR2dNd2l0eENjQVNCUjlGS2JRRVh1S1VnWHNxQTFQ?=
 =?utf-8?B?VW9FNXdGaFhNY0hFdS96NWJ3UzE4dDNyQUZQZ2tHVVEvTW5mcTNKeVNrUGxl?=
 =?utf-8?B?S2JEQ0lBL2JPZm82NHc0OWg3cUpBNG1GdjRkRjhzei8zSUVCYTBTTHMzV1NM?=
 =?utf-8?B?endUaTBkUnlFOFFFWkZ5cXY4TlNNczIwWDdhelJSL1ExME9uUExPbWFpenUz?=
 =?utf-8?B?bTBCWi9QalpVYUxsWkpzRS9iQ1UwVkcyWjJzK0k3TXNpdGhKbzlBc080ZnRB?=
 =?utf-8?B?N2hCOWdlQVBoQ2VLWUpNOE0zSzlmTzU5RDkzRFFuMlJtQ3c2S3BFbU9uRS91?=
 =?utf-8?B?L2xZb0l6TVYzbis4dHpINWlRR1J0Z24wMSsxd2c3MTRuVHZhZ0JnbktJRXJU?=
 =?utf-8?B?Yy9mRE1WYk5md2l1d1hZZ2hlYWVuMFRPaGxZdFNrQVlWUVR0TW9EUkZGdWZN?=
 =?utf-8?B?Q2YvQWFrME1QME1oMEdLdTZUei94SXArU2RZWUREMCtKTmhEUElrVFB5TTJu?=
 =?utf-8?B?RlV3QmNKSThibmU0SEF6blF0ZWxBdnJTVVNDWklHSGJsMXpVcGg2WUIvV0Fi?=
 =?utf-8?B?T3ZQU3JUVWtwL1NIbmFIRW1MMzBlRGNib2hoWm1SSmFqZ2hXQm1TVHZ1YW45?=
 =?utf-8?B?TTRSZDE3bGNwSXhvUUFPb0Rvd2NLSUJRRkZHSTJ2MzNlcmJaOTVsWUJNZ1hq?=
 =?utf-8?B?Vm5DL0pIR2dVQkhlRmFKMDkyMXgwTXVDQWdnR1Rpckh0SjNwWjMwR3RjdDN2?=
 =?utf-8?B?WTRRbzlWQ200Wi81RFZDNXVac0E3STFIU1VLeFJxQWxUV3oveEpLR1pZQndB?=
 =?utf-8?Q?iIZ0weER/FxnT2BcXO1+gtubKR9aqPpe6b8u0Oo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683e5b31-f16b-46de-ecbd-08d8f9fc1c97
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 19:34:08.1361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f0TdnrkxnIxKqYgFD8/JLoQvoUBuxzQiwLQ2KL31ZEUWJnajsCZ7ZqIcatNzn2oHZ7sD6obcslTYUSzzylOVzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMS0wNC0wNyA3OjI1IGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+ICvC
oMKgwqAgLyoKPj4+Pj4gK8KgwqDCoMKgICogRG9uJ3QgdmVyaWZ5IGFjY2VzcyBmb3IgS0ZEIEJP
cy4gVGhleSBkb24ndCBoYXZlIGEgR0VNCj4+Pj4+ICvCoMKgwqDCoCAqIG9iamVjdCBhc3NvY2lh
dGVkIHdpdGggdGhlbS4KPj4+Pj4gK8KgwqDCoMKgICovCj4+Pj4+ICvCoMKgwqAgaWYgKGJvLT5r
ZmRfYm8pCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4+PiBXaG8gZG9lcyB0aGUg
YWNjZXNzIHZlcmlmaWNhdGlvbiBub3c/Cj4+PiBUaGlzIGlzIHNvbWV3aGF0IGNvbmZ1c2luZy4K
Pj4+Cj4+PiBJIHRvb2sgdGhpcyBjaGVjayBhcy1pcywgaW5jbHVkaW5nIHRoZSBjb21tZW50LCBm
cm9tIGFtZGdwdSdzCj4+PiB2ZXJpZnlfYWNjZXNzIGZ1bmN0aW9uLiBUaGUgdmVyaWZ5X2FjY2Vz
cyBmdW5jdGlvbiB3YXMgY2FsbGVkIGJ5Cj4+PiB0dG1fYm9fbW1hcC4gSXQgcmV0dXJuZWQgMCBh
bmQgdHRtX2JvX21tYXAgZGlkIHRoZSBtYXBwaW5nLgo+PiBUaGlzIGlzIHByb2JhYmx5IGEgbGVm
dC1vdmVyIGZyb20gd2hlbiB3ZSBtYXBwZWQgQk9zIHVzaW5nIC9kZXYva2ZkLiBXZQo+PiBjaGFu
Z2VkIHRoaXMgdG8gdXNlIC9kZXYvZHJpL3JlbmRlckQqIGEgbG9uZyB0aW1lIGFnbyB0byBmaXgg
Q1BVIG1hcHBpbmcKPj4gaW52YWxpZGF0aW9ucyBvbiBtZW1vcnkgZXZpY3Rpb25zLiBJIHRoaW5r
IHdlIGNhbiBsZXQgR0VNIGRvIHRoZSBhY2Nlc3MKPj4gY2hlY2suCj4KPiBPaywgZ29vZCB0byBr
bm93Lgo+Cj4gVGhvbWFzIGNhbiB5b3UgcmVtb3ZlIHRoZSBleHRyYSBoYW5kbGluZyBpbiBhIHNl
cGFyYXRlIHByZXJlcXVpc2l0ZSAKPiBwYXRjaD8KPgo+IElmIGFueWJvZHkgdGhlbiBiaXNlY3Rz
IHRvIHRoaXMgcGF0Y2ggd2UgYXQgbGVhc3Qga25vdyB3aGF0IHRvIGRvIHRvIAo+IGdldCBpdCB3
b3JraW5nIGFnYWluLgoKRldJVywgSSByYW4gS0ZEVGVzdCB0ZXN0IHdpdGggdGhpcyBzaG9ydGN1
dCByZW1vdmVkIG9uIGN1cnJlbnQgCmFtZC1zdGFnaW5nLWRybS1uZXh0ICsgbXkgSE1NIHBhdGNo
IHNlcmllcywgYW5kIGl0IGRpZG4ndCBzZWVtIHRvIGNhdXNlIAphbnkgaXNzdWVzLgoKUmVnYXJk
cywKIMKgIEZlbGl4CgoKPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLiAKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
