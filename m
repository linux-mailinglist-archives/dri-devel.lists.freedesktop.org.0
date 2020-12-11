Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DDF2D7742
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 15:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F9D6EE1B;
	Fri, 11 Dec 2020 14:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB8D96EE17;
 Fri, 11 Dec 2020 14:01:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNMAARnigTEdumIioBnTcmLNfAlJj/xfdCVBEAjdEBOUdXYDrRc0BxMV/bdjRKopnzncyaQxvjjaSeBjW+tJC1aMww3AXQkeGyrPLIP5Mszq1rYU9oMQduoWKTUJkjv+JmiGjZjuvp0yR409fOJkqtgRfnnvYRF/O34ltAqY5N1Mf8VdY/3/r3n2kSwcEMVtdjPGB3y8ahGvaqcUNHPgeZfxBJUIssVzIOYPIjAktDIvzsrKD89lX/oHNwPhMd0nOD8HDFbqQlPe3y07qyNZvDDCYB7Bk61w+qZro0kusNctP90mF1NjeeJHGLXcnqMribTN4HX70ESnQ8GRb1t0Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJDKDeX8KwVBVmSSchM6xJZY/8Ccsj26E0ahjFHcDt8=;
 b=fg8KKcf54JpBSNu2NX8EM0phmkrEylORs9cXLZmDkB1uOD1Mw5NPWsJF5l0veMsNQnGfBwemlcu2NzjxD6BrO2eI8DL0IgAZyyZXx4QFhKo1ouk0BKm8luGKtDzf/oKKZVD31fjEcc/28KtIa7UKjhRLo0gIMNnVWNG5b/5OOLeYFjXEyCfGKDU9gZDL6vMHUDRc13acKvO6BrAcFB5NzxpJen2Joa/92B2FzXQnw1FhKEpd8dNXaoUFalx7sypSkIz0G2VSGPLFAZtDchQ4J9IZvYrdkQUZQ9K5dj13BKs+RdppRv2Sm36R7XD02WnksLFmicWdB/0q1/iMtA/NzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJDKDeX8KwVBVmSSchM6xJZY/8Ccsj26E0ahjFHcDt8=;
 b=Mkcffm95bmS8AdgydQt8bowpuARdTaiH7g1AgcLZEO5PqV81F0VMnfCBc/73xXVyUynXSaTaKF05eFBUwUBJxH0ArCaXDCpHqTjoJ/9dlqh6Z1M85FeAxx/e7HOhczh79zJD1RPgl4naeggLTQfKlQEXRAFuXxo9NTclfc/S/yA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 11 Dec
 2020 14:01:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 14:01:40 +0000
Subject: Re: [PATCH v2 0/3] Experimental freesync video mode optimization
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20201210184823.285415-1-aurabindo.pillai@amd.com>
 <MC46k2jDYAeDTZaSlv6T5iIq5ibkh2yYwW3KZ-XLXLwoRByjkWsEr6-6eQM4iZqmkiLoleyh84S290ytAub0bK-esJje1OGKIEilcz_iikY=@emersion.fr>
 <0b7132b8-a890-b4f0-0a0c-260015fa0bbb@amd.com>
 <20201211115549.32ade81b@eldfell>
 <53f5b48c-c2b5-ed66-0c0e-bba0b22dba03@gmail.com>
 <20201211142019.19dae2aa@eldfell>
 <c262b694-fb5d-accd-2582-4adb967ea890@amd.com>
 <14768d9f-0813-75c7-458d-2ced46ded4cd@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ab6078a7-0839-fab9-69a3-02a25a2baeca@amd.com>
Date: Fri, 11 Dec 2020 15:01:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <14768d9f-0813-75c7-458d-2ced46ded4cd@daenzer.net>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P192CA0018.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P192CA0018.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 14:01:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e049d39e-8330-4144-0701-08d89ddd48bc
X-MS-TrafficTypeDiagnostic: MN2PR12MB4112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41126CDD36E1EA29F59DC33883CA0@MN2PR12MB4112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QNy1rw67X1G219n0CCXtJCkp3fC/UcfJo+/+FFJ/p8bynZI/mnbCpdh9k8o0FzBRvpX9RHrirp+Zf3o7bl9N3g4OEfkv4BftOOPvxWEGTm+sBOekGJWu88iK2uMdc7AcN2/2RFZZKYUSgvEjuuI862BYGLJAvBJT4bZHq7Fw/HpBlSSeLO26nkLj68EBzvenYLj9sWzwkz9JoQmruAdGrY9Hm4+EwzvpRCqVEtN0yKIStKu9YZ4lN+9BAFsTvLBGcSirMFhT8hxfmzMTSxH7tYH5cJaXBrtJGHPa1AuIqVYUoAK3O10trQFDiaO9S+WPsIvxdSdQcaTiwDMErTSShc97CXv5E9SA+94phSBB/4p3j4aKZbmthH5KtuLqyxcHnrjF6blMffAlUH8Iwm/g8ZyK91nHJJgV5+MkxFDSRAqGYgKcvovnTbPMQFzBB2XJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(8676002)(6666004)(508600001)(110136005)(31696002)(66574015)(54906003)(8936002)(66476007)(6486002)(36756003)(66556008)(4326008)(5660300002)(66946007)(86362001)(186003)(52116002)(16526019)(31686004)(2616005)(2906002)(53546011)(34490700003)(4001150100001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SGNYU3hoZHp2NlBXbnY4Y1ZtL1FOWmd5eHRlbnNlb3haT1dtT1JQUDBRa1Ra?=
 =?utf-8?B?QUo4djRFQzQzTVhCQmZUYXFCSkpmOC9VMjlLTFB2Vld5UzJQUHRJRGN2VTNP?=
 =?utf-8?B?Q2NyVnRodFFsenhvVTJrOTQrOVpwQURkZjBzeEoxZ2V1c1dLNkRFak1nVzhD?=
 =?utf-8?B?dEF0N2t6U3M3bG8xV2didmdqbDBscjhEZWE3ZUxRSXZ5UmoyeEk5V2l1bG9K?=
 =?utf-8?B?ak9FcEYyTUFuS2NEMFA0YUhiZkVpZ0VCTE9HbGVncFAxWm9hSjRjV0FyL09r?=
 =?utf-8?B?dXU3V2RzYVpTVFdBY1NWTHViSVdCcE5VdU1udlQ1cTg5ajIvYWVOK09JU1BQ?=
 =?utf-8?B?M3krU0FORUMyamtRemV1NXFhNjhlaVF4OFIydmNjVjRCc1NMMTlkN1VzbmJh?=
 =?utf-8?B?bnVuNCtjZk0vZUw2dGNQZTV2VnhJdXhXSFhwT0MxK1Z2U0sxZ0ZjUjNUeUdY?=
 =?utf-8?B?UGZQNGVNT3Z2ako3K2RCMnZXeS82a1dzVXhpYzVEUG1ua3UrbHNmR3FWcHVQ?=
 =?utf-8?B?OWl5VnQ2YWVrSUdvbVFVY2tvVjQrNlNxUVIwWVVJNWRHa2NSWWhKNm16RnBx?=
 =?utf-8?B?cTBoTG9jR09tS1JPdVVOR2dvUGo2eVMrVEdxMTlIeXViS21nd1lkYi9hM0tY?=
 =?utf-8?B?US9jUHV2eVp3UjgwU2JJL1pWZTVPZ256NkNHMitVbjgzNGtnZWcyYnZnRUMr?=
 =?utf-8?B?NE9sdXVGNGNrNWdCbmh3cjZyU1o4SElSVlVxdlE5NEFONUFHd29qbGM2ZGRJ?=
 =?utf-8?B?dkZxODh1Q0dCV0JDaFlzVmlEMUMrS1gvWFdkOFBlNzh3QzJqZUJGT0tVd0xK?=
 =?utf-8?B?TjdYUjJKYjJ5YmlaYWd4NEhlYkVZbUszWjZ0cG9Sd0d6aEdQbXpUYVRleVkv?=
 =?utf-8?B?K0hmVDg1cXhCeldVOEE2dElaZmw2bnlrZUJJdGhzTm4zN3RUaXBZZmRRWWZM?=
 =?utf-8?B?b3hBMytxZkhuWDQ2UzJDbXVnRUZqU1JTSkZWZ0QzQkVGOEhaSFpGZEVtWi9Q?=
 =?utf-8?B?cHdNRlc2cmhOUjZoYVBoYms5TnRlSnU3azZHREJtL3JWeEp6VnVFdjlpcHJp?=
 =?utf-8?B?bWtraHltdEx6ZC9KaEtmbUlCMWZwWWhMUXhoQzRDNmtiTXU3ak5yRDJGWnFn?=
 =?utf-8?B?d2ZFd1pKR2FpbjVtcFdpLzFNRkMrQTQvTk1NS0h1blIrT0xhdlExZzNIWXZi?=
 =?utf-8?B?ZGpGY0IxZ1g2anV1SmZXa2xYOGNiZVBxZ3VLK3lDR2s0MEN6azNIbUNvS3Az?=
 =?utf-8?B?bmhRNGQ5aVdUV3NFb2p6cVlpQ2xvTU8xNmJsQWR1WlhWaHgrMEEzQ0QvbjFX?=
 =?utf-8?B?Wk1ndlpHQnFNV0VtbE9LZXo0TFY5a2RnSDI2RE9OWFd1b0UrVFlCbTBqbGtB?=
 =?utf-8?B?VE55UmZhZkRZb250QU4yMlFJRDF5ZzZqQTcxNDdZSTBJMUZsdW81WWFEby9s?=
 =?utf-8?Q?7YLPvCp0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 14:01:40.5411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: e049d39e-8330-4144-0701-08d89ddd48bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1PvjVnAx77L9fUF7YQ4NoYVfDzz3VIRVOmCSKMFSJjbrqalMosezpnhqFc4t/g1g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4112
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
Cc: stylon.wang@amd.com, Shashank Sharma <shashank.sharma@amd.com>,
 thong.thai@amd.com, DRI Development <dri-devel@lists.freedesktop.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 wayne.lin@amd.com, alexander.deucher@amd.com, nicholas.kazlauskas@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMTIuMjAgdW0gMTQ6NTggc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDIwLTEy
LTE0IDk6NTcgcC5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTEuMTIuMjAgdW0g
MTM6MjAgc2NocmllYiBQZWtrYSBQYWFsYW5lbjoKPj4+IE9uIEZyaSwgMTEgRGVjIDIwMjAgMTE6
Mjg6MzYgKzAxMDAKPj4+IENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5A
Z21haWwuY29tPiB3cm90ZToKPj4+Cj4+Pj4gSSB0aGluayB0aGUgZ2VuZXJhbCBpZGVhIHdlIHNl
dHRsZWQgb24gaXMgdGhhdCB3ZSBzcGVjaWZ5IGFuIGVhcmxpZXN0Cj4+Pj4gZGlzcGxheSB0aW1l
IGZvciBlYWNoIGZyYW1lIGFuZCBnaXZlIGZlZWRiYWNrIHRvIHRoZSBhcHBsaWNhdGlvbiAKPj4+
PiB3aGVuIGEKPj4+PiBmcmFtZSB3YXMgYWN0dWFsbHkgZGlzcGxheWVkLgo+Pj4gVGhhdCBpcyBp
bmRlZWQgc29tZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50LCBhbmQgZmVlbHMgbGlrZSBpdCB3
b3VsZAo+Pj4gYmUgc2V2ZXJhbCB5ZWFycyBpbiB0aGUgZnV0dXJlLCB3aGlsZSB0aGUgcHJvcG9z
ZWQgc2NoZW1lIG9yIHRoZQo+Pj4gbWluL21heCBwcm9wZXJ0aWVzIGNvdWxkIGJlIGRvbmUgZmFp
cmx5IHF1aWNrbHkuIEJ1dCBJJ20gbm90IGluIGEgCj4+PiBodXJyeS4KPj4KPj4gWDExIGFscmVh
ZHkgc3VwcG9ydHMgdGhhdCB3aXRoIHRoZSBEUkkzIGV4dGVuc2lvbi4gQWxzbyBzZWUgVkRQQVUg
Cj4+IHByZXNlbnQgYW5kIHRoZSBWdWxrYW4gZXh0ZW5zaW9uIGZvciByZWZlcmVuY2UgYXBwbGlj
YXRpb24gQVBJIAo+PiBpbXBsZW1lbnRhdGlvbnMsIHNvIHRoYXQgc3R1ZmYgaXMgYWxyZWFkeSBw
cmVzZW50Lgo+Cj4gSSBzdXNwZWN0IHlvdSBtZWFuIHRoZSBQcmVzZW50IGV4dGVuc2lvbiwgc3Bl
Y2lmaWNhbGx5IAo+IFByZXNlbnRPcHRpb25VU1QuIFRoZXJlIGlzIG5vIHdvcmtpbmcgaW1wbGVt
ZW50YXRpb24gb2YgdGhpcyB5ZXQgKHRoZSAKPiB4c2VydmVyIHRyZWUgaGFzIG5ldmVyIGhhZCBh
bnkgY29kZSB3aGljaCB3b3VsZCBldmVuIGFkdmVydGlzZSAKPiBQcmVzZW50Q2FwYWJpbGl0eVVT
VCwgbGV0IGFsb25lIGRvIGFueXRoaW5nIHdpdGggYSB0aW1lc3RhbXAgcGFzc2VkIGluIAo+IGJ5
IHRoZSBjbGllbnQpLgoKR29vZCBwb2ludCwgd2hhdCBJIHdhbnRlZCB0byBzYXkgaXMgdGhhdCB0
aGlzIGlzIGFscmVhZHkgc3BlY2lmaWVkIGluIAp0aG9zZSBleHRlbnNpb25zLgoKV2hhdCB3ZSBh
cmUgbWlzc2luZyBpcyBzb21laG93IHdpcmluZyBpdCBhbGwgdG9nZXRoZXIgYW5kIHNlZSBob3cg
aXQgd29ya3MuCgpDaHJpc3RpYW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
