Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE611349FE9
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 03:46:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4213F6EEA5;
	Fri, 26 Mar 2021 02:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760055.outbound.protection.outlook.com [40.107.76.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428B46EEA5;
 Fri, 26 Mar 2021 02:46:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U+oMFDiRHKwAmyMhNyfzGn+MTSx4bLc9XaqF/VETmQ9wHXDSYvpp/BjiHK0gaQs5x5Jf8LVlcw8HDrS0FCjCHEeTFY5TW92NFrGiIp+UfUjbfSxgPwDutr4t1fOZJV29F6rdJ4ax26fk8/Kqgyjaz5D3RRmn7gRssagBXKHYkMfW339I70FPwyumbCTHJU/+fp9JGbyM9hw+ZCy1XNvut48aVYqJ41gL8UeZobAZp75HBTFlJzo4GLnZoi7jkRQtnQE0CSULxAjrKLhRXhxoBbzh4fT01QjRUdZ1yPXz+m8gNzmWlUK9QtDDHEnJ1n86wSTIggKzN53H+mBCARc29A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKTGorqW+40JWgBvXwRXkzl9zrlivHETLX+oJqX69uc=;
 b=oYBWrsSR43cWXIAljOwl3BhhAa+rrjULHjO3ckGaKRM3N7IVUAIyL3wjJ6nIRdtDyFANI8aV4c+AyiFmMArVtIEJ6pq39f1oWfU5robqxkQEEoyxEwcHeN8/VtwAhcdZNACFiMsAonYh5rH5Z5fwLJ9swNVxfBHNxlqqpujY5FHa69NtfdwL0AfsYTg6/8hFMEOXKg/zK5HbYDdsKEBQiIVYVsW+jcFz/zDanw+InAKhp2Sn79naxmfPcls77DAId/59XIR2ExoWKFmhpWKQJXHSvKDFLLWFDUWDBpHUA/fI1QeQkPdtPb310x9Z0Nu3q2eC9TNLrqhylEftJs+Mlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKTGorqW+40JWgBvXwRXkzl9zrlivHETLX+oJqX69uc=;
 b=dq10R4R0r28tP9duptitbHvckTNjdGF/PSitfAAp+w9GS4TD/TZDN57UIzNnLFiikrkLPecL9aM2HmT4Xo4ugR4zhTN//o4g2qyrqDLSMg720HBm4wAkfUFXtkcUg/oBqWVu74OPIM4Bv3MsT5uPVSDtsxYTUw0a70ODZJT6z60=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4955.namprd12.prod.outlook.com (2603:10b6:610:68::22)
 by CH2PR12MB3736.namprd12.prod.outlook.com (2603:10b6:610:2b::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 02:46:42 +0000
Received: from CH2PR12MB4955.namprd12.prod.outlook.com
 ([fe80::ecf3:66d6:98be:5d46]) by CH2PR12MB4955.namprd12.prod.outlook.com
 ([fe80::ecf3:66d6:98be:5d46%9]) with mapi id 15.20.3977.025; Fri, 26 Mar 2021
 02:46:41 +0000
Subject: Re: [PATCH] drm/amdkfd: Fix cat debugfs hang_hws file causes system
 crash bug
To: Alex Deucher <alexdeucher@gmail.com>, Qu Huang <jinsdb@126.com>
References: <1616315298-109091-1-git-send-email-jinsdb@126.com>
 <CADnq5_OLBjUbwxUptPk17XMHarThXj7GDYkgYZOPcd_GOJH1XQ@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <103dee67-79d8-991d-b9b3-e5ee0f098567@amd.com>
Date: Thu, 25 Mar 2021 22:46:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CADnq5_OLBjUbwxUptPk17XMHarThXj7GDYkgYZOPcd_GOJH1XQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [142.116.84.209]
X-ClientProxiedBy: YT1PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::15)
 To CH2PR12MB4955.namprd12.prod.outlook.com
 (2603:10b6:610:68::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.84.209) by
 YT1PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Fri, 26 Mar 2021 02:46:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 71b6a28d-dc00-4de2-cb28-08d8f00162d5
X-MS-TrafficTypeDiagnostic: CH2PR12MB3736:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB3736DE7C5CA298DD89CDE54C92619@CH2PR12MB3736.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T+L2H8IoewGSPLtcTFrf2sUdTGmDzWcnqJO7/KMmK45JTT7uwRuA61aQ7sS4fGUZfTq0zOItrHCX6s9QcTL89g/WFIYe5pN/q+quo8m7swLK9MbY11FMPL1ClSHTHevy+0hTyJI2SzlWmphyF7Sqx4+xI0ietoFZ6XkajrO+oEz0LrHGbJfhZFehPZFHuBBw6Zm4pslY4hrX6hlSUoA2nZ9Ge40Ag34nwSBquXmsJu3QDCi6fSPpArWeVtTQndv8z2bv4DmNhqTKMAsh5iIVslMRDYHBmn2QOYomVspOh8VPujse8x5iojfmH9xwVlRYj5DIB72NjfwuijtpJ2P6DR4ZHvk4uJx5ufSxi3FUT/9RTpaFKydMsK7jn+TYinijXYGxJivuYJMFS+xX7m8DcsTYcNwAqQ4baAOBueA3BG/hmAjKNkJNosYyNe8nTOoWtf7lxnNg4gzxKGe4kGVFT9DIa2Ag9BLggH7Coxe/Ynmgc/jZ3EWdLA7+lr9tFLKWiBQjw3k0c4t/Ch2k25u2AjZyWXybYTpqgK2T41pUrq5IUkVJZhBIiOilJ7prIiAEQ4KcQcAihk6zhPSn9QVJU+sX+RoBIFOOcfAdRBM2jLI7z92xIWREzYDpUFuOcs4hoFK0GP2+BgztGN/wNy3wcIqyH8obagrQsT7L6n+Cfg6mxz3Nuo8ziv0tNcIuOwIktp66bHN8bzWg+W6qhn/kfgHbAbxupFoAJLaRedooGhcOZllUNGGX7A9xRIcMyzxCteKT+mLGfsXRVqzw0SGGeEXkXThPvOV0NfCc2QfOqR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB4955.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(38100700001)(86362001)(16576012)(110136005)(956004)(966005)(53546011)(5660300002)(6486002)(2616005)(31686004)(316002)(2906002)(478600001)(44832011)(8676002)(31696002)(83380400001)(8936002)(26005)(16526019)(66556008)(54906003)(66476007)(36756003)(4326008)(186003)(66946007)(525324003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?LzZpL1pvK21ZWWlmZlY1eEVaZGlKdlk0cWFUREREMnFCNE5lWGNnaFljNXRY?=
 =?utf-8?B?dmpvdGpCQzVJV01VUG0vaGsxZzUyNmpVMjNGTnExSlZZVkhoYnh6ZTJIMDZq?=
 =?utf-8?B?Rys0QSsyaUROWGViT1pkWmZxZ0tROTZOYWRMM0wxZ1FMek1ZUVlqM25BVXhB?=
 =?utf-8?B?bjJpQ25BNzM2TEJHMS9zSU5MYkVuTWhZSlZDaEJkYWE4V0dTRFJRZzRFTkN5?=
 =?utf-8?B?eG0rZXlQL0FSUUhZZUUxVFJUUHVXUDFNczlyYnFIUkF3UXFqTWV2Myttcnhu?=
 =?utf-8?B?VmRiMDNFcEE2bE1PbFFSVlFtcUhkOWx5MzVlVE04LyszNkFtckdTclNzblZt?=
 =?utf-8?B?RlZDMmE5QjVaT2wxb3pNWldZV1JDL01mSnNpTkhxUmVEQVRiOEtUbzZIRFcx?=
 =?utf-8?B?L0M5RVdUbkt0U3p0d0tQNGxIV1Q2aWEvdmZqMDZHNFJQbVA1ZktaUHNaeHk2?=
 =?utf-8?B?aHlUVnBEdEFLaUVSa01USDJxRzJpR3VEMUo5dWcrUm5SU3hFRDhNU3VPdSs1?=
 =?utf-8?B?NDA3akkvNlgzaWNYMDQzQllWdTl2NGtvUW8wT2NxZkpTNVllMjMybjdpVkk1?=
 =?utf-8?B?V2J5eStJRHllQmFQSnFLYW1waHdzY216bmRCTkJVOFh0V01qeUwvOTd3Q1JS?=
 =?utf-8?B?MXlORnBnWFBMSVYzbUphbDJDMEhXa3UzNkFBOUNzNGVzdk5WbnVBT21oSnZK?=
 =?utf-8?B?M2F6aEtCT05lU1BEeWFVRHcvdURaOGMvQU11eURXKytwbXpteFpWUHFpUmMv?=
 =?utf-8?B?NUhlNERwNmk5a09LQ28vSUZXcVFQU0l2b29BalhpOW9kZ0ZXQzBTM2YvRWxo?=
 =?utf-8?B?TXlhZitjSFdMdlh3dzlXbDh0T1llZ0xEZlZPV3FFV2MxdHAzUU0xZEk0NHJV?=
 =?utf-8?B?NDR6U1JISUN5bW1QdkF2ZXVydFZhNWMyYXdmVHV4cUxqcjhncnkzamgrMEhv?=
 =?utf-8?B?TUgyTmVqRWhEdHpMcU9PZURYNENHMGlrSmd5YjJOanZNWWNDbDFJOTB3bFhk?=
 =?utf-8?B?VVhjTFU0Wm0xYW1zKzFpRTNZa1l0Z0hsTmNWNVFzVVhWRTBpNmF3bk81d2Vj?=
 =?utf-8?B?Qk9KdUpobitRWmxQMjdkMEJocXNyQjZGSUd2akVIQ2NCeGZUbGMvY1U5RXBs?=
 =?utf-8?B?ZkovVDBlR1NRWldITlM3YXY1eWZiMWRGN3pOZXVwR3VGcXVnbFhyYWl3bnJU?=
 =?utf-8?B?bmdWUEcvWkxPcytTOFdBNW9UWnRYazY5eHRVL0hCQjJreWhRNWlwVWhjOFNC?=
 =?utf-8?B?MWVDL2dmWlh4VHFucnBiU1d2bnhoZHd6MkJyMTBBdkdwTXdSZURFSks1Ykg3?=
 =?utf-8?B?cksycXA3UFoxektVQXREOXdWeEJjVW9NRmRCVkJIdnNKOVh5WWZmYkpmTkJC?=
 =?utf-8?B?YUJPYWtHaFhLZTVaNDVNRGxoQlpJbXp0UCszYUU2QnFFYklna3JFK0R3N05Z?=
 =?utf-8?B?dGQ5dWJTMFNrVHhVSGdBRmFDdktjZXk1eU52NXZidnVyT29rYVV1Y2dRemVJ?=
 =?utf-8?B?VjJuWFJLWTBPcjdzUDM3SzRUQUVuNzc3OHpZanlwOS9QTmZZcHRJVFMyeENE?=
 =?utf-8?B?eUdkM0pVNVBGUkpvZVJiTnVSWjV1TnhxcFZ0M0psYk9iaGRzRnZVNXNtRVpw?=
 =?utf-8?B?emJUTGw4cXYwNDRhS21aZGFiTzNmeXcyUGtBeFhOd0lmWVFrcW5JSW1Wbldx?=
 =?utf-8?B?QnZUNDQ1NUVtckdTZTY0NCs1Q1pLMjRNRmc0RmRvU09uRkNKdm5XRmNYZzhm?=
 =?utf-8?Q?KF7R5DXJEBD5uOCOrzoe0RCjoaS1yId46wKqMQc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b6a28d-dc00-4de2-cb28-08d8f00162d5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4955.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 02:46:41.8180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvWPxp6uJomVH1F5Hvc2bqz7/cKHH9Et+YUYoFX7MNx4trFXHsw3945lVClzGdwhrDpvX55fDHTrmzkNrGUfXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3736
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFtIDIwMjEtMDMtMjMgdW0gMTA6NTYgYS5tLiBzY2hyaWViIEFsZXggRGV1Y2hlcjoKPiBBcHBs
aWVkLiAgVGhhbmtzIQoKVGhhbmtzLiBJIHRob3VnaHQgd2UgZml4ZWQgdGhpcyBiZWZvcmUgYnkg
bWFraW5nIHRoZSBmaWxlIHdyaXRlLW9ubHkuCkJ1dCBJIGd1ZXNzIHRoYXQncyBub3Qgc3VmZmlj
aWVudCB0byBzdG9wIHJvb3QgZnJvbSByZWFkaW5nIGl0OgoKY29tbWl0IDJiZGFjMTc5ZTIxN2Ew
YzBiNTQ4YThjNjA1MjQ5Nzc1ODY2MjFiMTkKQXV0aG9yOiBGZWxpeCBLdWVobGluZyA8RmVsaXgu
S3VlaGxpbmdAYW1kLmNvbT4KRGF0ZTogICBUaHUgRGVjIDE5IDIyOjM2OjU1IDIwMTkgLTA1MDAK
CiAgICBkcm0vYW1ka2ZkOiBGaXggcGVybWlzc2lvbnMgb2YgaGFuZ19od3MKICAgIAogICAgUmVh
ZGluZyBmcm9tIC9zeXMva2VybmVsL2RlYnVnL2tmZC9oYW5nX2h3cyB3b3VsZCBjYXVzZSBhIGtl
cm5lbAogICAgb29wcyBiZWNhdXNlIHdlIGRpZG4ndCBpbXBsZW1lbnQgYSByZWFkIGNhbGxiYWNr
LiBTZXQgdGhlIHBlcm1pc3Npb24KICAgIHRvIHdyaXRlLW9ubHkgdG8gcHJldmVudCB0aGF0Lgog
ICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4KICAgIFJldmlld2VkLWJ5OiBzaGFveXVubCAgPHNoYW95dW4ubGl1QGFtZC5jb20+CiAg
ICBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
CgoKTm93IHRoYXQgd2UgaGF2ZSBhIHNlbnNpYmxlIG1lc3NhZ2UgaW4gdGhlIGZpbGUsIEkgZ3Vl
c3Mgd2Ugc2hvdWxkCm9mZmljaWFsbHkgbWFrZSBpdCByZWFkYWJsZSBhZ2Fpbi4KClJlZ2FyZHMs
CsKgIEZlbGl4Cgo+Cj4gQWxleAo+Cj4gT24gU3VuLCBNYXIgMjEsIDIwMjEgYXQgNTozMyBBTSBR
dSBIdWFuZyA8amluc2RiQDEyNi5jb20+IHdyb3RlOgo+PiBIZXJlIGlzIHRoZSBzeXN0ZW0gY3Jh
c2ggbG9nOgo+PiBbIDEyNzIuODg0NDM4XSBCVUc6IHVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5V
TEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdAo+PiAobnVsbCkKPj4gWyAxMjcyLjg4NDQ0NF0gSVA6
IFs8ICAgICAgICAgIChudWxsKT5dICAgICAgICAgICAobnVsbCkKPj4gWyAxMjcyLjg4NDQ0N10g
UEdEIDgyNWIwOTA2NyBQVUQgODI2N2M4MDY3IFBNRCAwCj4+IFsgMTI3Mi44ODQ0NTJdIE9vcHM6
IDAwMTAgWyMxXSBTTVAKPj4gWyAxMjcyLjg4NDUwOV0gQ1BVOiAxMyBQSUQ6IDM0ODUgQ29tbTog
Y2F0IEtkdW1wOiBsb2FkZWQgVGFpbnRlZDogRwo+PiBbIDEyNzIuODg0NTE1XSB0YXNrOiBmZmZm
OWEzOGRiZDRkMTQwIHRpOiBmZmZmOWEzN2NkM2I4MDAwIHRhc2sudGk6Cj4+IGZmZmY5YTM3Y2Qz
YjgwMDAKPj4gWyAxMjcyLjg4NDUxN10gUklQOiAwMDEwOls8MDAwMDAwMDAwMDAwMDAwMD5dICBb
PCAgICAgICAgICAobnVsbCk+XQo+PiAobnVsbCkKPj4gWyAxMjcyLjg4NDUyMF0gUlNQOiAwMDE4
OmZmZmY5YTM3Y2QzYmJlNjggIEVGTEFHUzogMDAwMTAyMDMKPj4gWyAxMjcyLjg4NDUyMl0gUkFY
OiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogMDAwMDAwMDAwMDAwMDAwMCBSQ1g6Cj4+IDAwMDAwMDAw
MDAwMTRkNWYKPj4gWyAxMjcyLjg4NDUyNF0gUkRYOiBmZmZmZmZmZmZmZmZmZmY0IFJTSTogMDAw
MDAwMDAwMDAwMDAwMSBSREk6Cj4+IGZmZmY5YTM4YWNhNGQyMDAKPj4gWyAxMjcyLjg4NDUyNl0g
UkJQOiBmZmZmOWEzN2NkM2JiZWQwIFIwODogZmZmZjlhMzhkY2Q1ZjFhMCBSMDk6Cj4+IGZmZmY5
YTMxZmZjMDczMDAKPj4gWyAxMjcyLjg4NDUyN10gUjEwOiBmZmZmOWEzMWZmYzA3MzAwIFIxMTog
ZmZmZmZmZmZhZGRkNWU5ZCBSMTI6Cj4+IGZmZmY5YTM4YjRlMGZiMDAKPj4gWyAxMjcyLjg4NDUy
OV0gUjEzOiAwMDAwMDAwMDAwMDAwMDAxIFIxNDogZmZmZjlhMzdjZDNiYmYxOCBSMTU6Cj4+IGZm
ZmY5YTM4YWNhNGQyMDAKPj4gWyAxMjcyLjg4NDUzMl0gRlM6ICAwMDAwN2ZlY2NhYTY3NzQwKDAw
MDApIEdTOmZmZmY5YTM4ZGNkNDAwMDAoMDAwMCkKPj4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMAo+
PiBbIDEyNzIuODg0NTM0XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAw
MDgwMDUwMDMzCj4+IFsgMTI3Mi44ODQ1MzZdIENSMjogMDAwMDAwMDAwMDAwMDAwMCBDUjM6IDAw
MDAwMDA4MjY3YzAwMDAgQ1I0Ogo+PiAwMDAwMDAwMDAwMzQwN2UwCj4+IFsgMTI3Mi44ODQ1Mzdd
IENhbGwgVHJhY2U6Cj4+IFsgMTI3Mi44ODQ1NDRdICBbPGZmZmZmZmZmYWRlNjg5NDA+XSA/IHNl
cV9yZWFkKzB4MTMwLzB4NDQwCj4+IFsgMTI3Mi44ODQ1NDhdICBbPGZmZmZmZmZmYWRlNDBmOGY+
XSB2ZnNfcmVhZCsweDlmLzB4MTcwCj4+IFsgMTI3Mi44ODQ1NTJdICBbPGZmZmZmZmZmYWRlNDFl
NGY+XSBTeVNfcmVhZCsweDdmLzB4ZjAKPj4gWyAxMjcyLjg4NDU1N10gIFs8ZmZmZmZmZmZhZTM3
NGRkYj5dIHN5c3RlbV9jYWxsX2Zhc3RwYXRoKzB4MjIvMHgyNwo+PiBbIDEyNzIuODg0NTU4XSBD
b2RlOiAgQmFkIFJJUCB2YWx1ZS4KPj4gWyAxMjcyLjg4NDU2Ml0gUklQICBbPCAgICAgICAgICAo
bnVsbCk+XSAgICAgICAgICAgKG51bGwpCj4+IFsgMTI3Mi44ODQ1NjRdICBSU1AgPGZmZmY5YTM3
Y2QzYmJlNjg+Cj4+IFsgMTI3Mi44ODQ1NjZdIENSMjogMDAwMDAwMDAwMDAwMDAwMAo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBRdSBIdWFuZyA8amluc2RiQDEyNi5jb20+Cj4+IC0tLQo+PiAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RlYnVnZnMuYyB8IDcgKysrKysrLQo+PiAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9kZWJ1Z2ZzLmMKPj4gaW5kZXggNTExNzEyYy4uNjczZDVlMyAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RlYnVnZnMuYwo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfZGVidWdmcy5jCj4+IEBAIC0z
Myw2ICszMywxMSBAQCBzdGF0aWMgaW50IGtmZF9kZWJ1Z2ZzX29wZW4oc3RydWN0IGlub2RlICpp
bm9kZSwgc3RydWN0IGZpbGUgKmZpbGUpCj4+Cj4+ICAgICAgICAgcmV0dXJuIHNpbmdsZV9vcGVu
KGZpbGUsIHNob3csIE5VTEwpOwo+PiAgfQo+PiArc3RhdGljIGludCBrZmRfZGVidWdmc19oYW5n
X2h3c19yZWFkKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkKPj4gK3sKPj4gKyAgICAg
ICBzZXFfcHJpbnRmKG0sICJlY2hvIGdwdV9pZCA+IGhhbmdfaHdzXG4iKTsKPj4gKyAgICAgICBy
ZXR1cm4gMDsKPj4gK30KPj4KPj4gIHN0YXRpYyBzc2l6ZV90IGtmZF9kZWJ1Z2ZzX2hhbmdfaHdz
X3dyaXRlKHN0cnVjdCBmaWxlICpmaWxlLAo+PiAgICAgICAgIGNvbnN0IGNoYXIgX191c2VyICp1
c2VyX2J1Ziwgc2l6ZV90IHNpemUsIGxvZmZfdCAqcHBvcykKPj4gQEAgLTk0LDcgKzk5LDcgQEAg
dm9pZCBrZmRfZGVidWdmc19pbml0KHZvaWQpCj4+ICAgICAgICAgZGVidWdmc19jcmVhdGVfZmls
ZSgicmxzIiwgU19JRlJFRyB8IDA0NDQsIGRlYnVnZnNfcm9vdCwKPj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGtmZF9kZWJ1Z2ZzX3Jsc19ieV9kZXZpY2UsICZrZmRfZGVidWdmc19mb3Bz
KTsKPj4gICAgICAgICBkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJoYW5nX2h3cyIsIFNfSUZSRUcgfCAw
MjAwLCBkZWJ1Z2ZzX3Jvb3QsCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICBOVUxMLCAm
a2ZkX2RlYnVnZnNfaGFuZ19od3NfZm9wcyk7Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICBrZmRfZGVidWdmc19oYW5nX2h3c19yZWFkLCAma2ZkX2RlYnVnZnNfaGFuZ19od3NfZm9wcyk7
Cj4+ICB9Cj4+Cj4+ICB2b2lkIGtmZF9kZWJ1Z2ZzX2Zpbmkodm9pZCkKPj4gLS0KPj4gMS44LjMu
MQo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
