Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7FC2F4748
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 10:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1E26E2DE;
	Wed, 13 Jan 2021 09:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750049.outbound.protection.outlook.com [40.107.75.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73776E2D7;
 Wed, 13 Jan 2021 09:14:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgKfgegzc9Ay6fsknekb4wTNGrwJTZ3iHcIVOqiUmbaaUGTJ1ObTqxj0eCR+QbkJUb0uEFI09Qm1fpWztUTKIO2/wdyiY/vHaMGgFtGQM5/fg8ksXRmp++i6T+pUA4UZqecy1dmGsKjd/070dYIKd63jghY8vbNPB+J61yeyuqz9m6MbIfmq2L+tJP1F/fJ1z+uF0//rTxgp7Zdp2PiVasXcuX4m7r24J6+x4dpeE3nn8+vTkm9qIXGsuU/axQMehUvOoOjvrdM8v9lUUQriWT2+QLXEf1UvqTWBQFzeGhp8Qm0yjJa85OAK0GO73dwCjBcA92BPtrghAenQWkuYbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00rfGIcZoZ5HLUL0usi1Gn9DzzQotWikAuTQgsajAB4=;
 b=PVB+YdQvtc5wc47PB/CYx+fiT6fccMJ4Vn0rJYdCcKSF9dY4jUTMR5RUKm56GyrcrmCD2hR3uIS93my19/12CAGld/ZlGmyuM++4lm+oj7r5suksIBDSVvNQhirC/AfGx0LcLpmtwAjtWXaGv33HR+3oUcKIZ5bHDh67GCCMvewggnT85vam22+ZtCYws+NgKoD1M3TwTNfMKRchBE7fgbu/944f5wYVnZVM1oF1elT0x1Mx3ZoJBmdMBiEH3NZf1qKT2BX+vzejx1vkgrCo+Fm2wOw90gDdMl5lwkVSS4dF1iR0h8QM6QaYNQQkCkkyFHKeTPaFSwElvFHSUeXzvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00rfGIcZoZ5HLUL0usi1Gn9DzzQotWikAuTQgsajAB4=;
 b=0/XImXIZnRYmpUWFVloNDHPZlit/aCZC2fp9aKeKizIMS5WXHaE+FwlWvDSWmkyeQzKr+RjE4KyS37uCeF6Jspo3LTe6psHp/uyh+v7z0J/Gj0guBHfYGrmanYmW8Za8jdG489Gm1BClPYTUlXTVtEMU2ppMUMmItcsDvRxLDzg=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 09:14:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 09:14:35 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
 <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
 <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
 <SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0@SN6PR12MB4623.namprd12.prod.outlook.com>
 <X/x5RD0xQxWUYvQ3@phenom.ffwll.local> <X/x5nXM7bZDl+MWR@phenom.ffwll.local>
 <db1e456d-8493-c94e-942e-ed19a2e1b931@amd.com>
 <X/1niT8MNvcEwDFS@phenom.ffwll.local>
 <a0435d29-dabb-89ad-cdd0-1b5f1e32b7c9@amd.com>
 <f869b0dc-2678-07e4-511f-739c025579d0@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <20669765-8656-0933-ff86-15fc722f9bd8@amd.com>
Date: Wed, 13 Jan 2021 10:14:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <f869b0dc-2678-07e4-511f-739c025579d0@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR04CA0074.eurprd04.prod.outlook.com
 (2603:10a6:208:be::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:208:be::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Wed, 13 Jan 2021 09:14:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fcb6faa0-0e13-4736-db76-08d8b7a3a59e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4317:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB431789BB06D4850CBC807F9B83A90@MN2PR12MB4317.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3nKb/ZKpcijCm8spkZ/PmaHfMfjoHX8p+H6FPXVv2bTri73wwhaBV5gq4tA2neC/cq5Ic4PjwohNo7W1MsXzpKWiSWxmrYyvcwd8aT0fxitBwa6nXaNha807oEHS0KYNYSpEG2hdLL+cbkwrylhCoCVJrpzmmI2QFfyYCOkzEW3DQGrWwzHZx+0nclPqJPlt2dHFXQQpOAHtCRZaw4ADMOloH/wH1wFIBjEEoSRHxp/tSDBPDI0ff3V66FMrC0W+ZMMdquaitn6n1LrF/xTabhqHNXkPK1jmtBuIMNFr6i0hLQ5NavlqdoAjmjUmbTogc8Ts4XTwB28Vn1XqMgrv6qa8R30E/Di1sr/KRSRDeq+cfk1VkSZGgo4q3Jidox4czTviOpZfzqwzBg1uHM9mEPTMHVYVHrlDhIpPPVni98kmVwr//q3gbwXq7XjwGvJH8ZRibyxQuZvspdN/+b0PKYhV4Odb5adkFIoPpc2y3K0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(4326008)(8936002)(66556008)(86362001)(316002)(66574015)(8676002)(52116002)(53546011)(54906003)(6486002)(2616005)(478600001)(66946007)(31696002)(66476007)(16526019)(31686004)(36756003)(5660300002)(2906002)(110136005)(7416002)(6666004)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WnlvdHdROHorNDh1WFRlODFXd1B5b1FQYlE4VmtqdWtyc0hvV0VHaW4xeEdZ?=
 =?utf-8?B?MnFHSHRDZ0Y0RlVCc0xHMFRRK0dML2d4LzI0dUZmdldOMVpyTUJTQzVDeWg3?=
 =?utf-8?B?SzlrSHZDQ3M0c2NNTjdzTjVOYVRRM1NTWmprODloL2NuSnBDSTRtT3Bxblor?=
 =?utf-8?B?VzR5aUJxNW4weXdKNWVwSUYwd1VVN1dESC9Kc1M2aEZXbG9lTDI2Q2RKMGV4?=
 =?utf-8?B?dlVFMktsVkxqUGx2TXBqcXFJWDNMK3FyRWh1MmxpNzZ6LzV4WlRudEhOMUVv?=
 =?utf-8?B?UmthanRaR0crVmVDWXY4Q0J3VkU3OU9VemkwZ0NXS2MvU2JUSlM5eFhXNFBp?=
 =?utf-8?B?Zzl3aHdWMGFZbEh1QVhweFBzeHFOMGs0TE83b2xxeThUOFc0dGtkZHRESnQ1?=
 =?utf-8?B?OVBaUlFqMUhKTG14cWR3SlNGQkZFTGR3em5HL3VZYzdla05iVkNYOVNybmhY?=
 =?utf-8?B?TUV0aElLUGR2NElxSk1CUmk5ckFRUW1qR2tmNXNVd1hRUXBlMUdjS2tnTVRL?=
 =?utf-8?B?UFdVd3I2QU9qQnJ2WmcvM241ZHdkUlcrV1p4U2dOUlNXZm5OQnZRbTgzTmJr?=
 =?utf-8?B?WDRKQVZlRTIxS1NFanJqajNoOU01MVJxcThpVTdlQlZ0Y1JJUUVZeFJFMkFD?=
 =?utf-8?B?cGcrajR1K2dTSVJXbStOOW1adlRIdkF5U3I3WUEvcE55QURFWW12N3ErM1dS?=
 =?utf-8?B?S0FGRVNkeXlLQTBBUUZ0Q2lPRXZ1RGgzWnppN3pETDk5dERWdS90ZC9TaXRn?=
 =?utf-8?B?LzRiOGkvSkZzNlVqU0l3WW9zdGtpM1QrbWh0N2NFQnVsTUd6cnA1Vy9GQVQr?=
 =?utf-8?B?MHhtU1NiTGlBTnYweUJIZ2VzRXFpbGUvdWJEL3E2WVRuR2lTRWd2RzVIVVZk?=
 =?utf-8?B?TE1mY3R2anBaeHkzVUtmT1gyTzBTSG1YdGV5RklEd05GeTBYZFR1WWNBODJa?=
 =?utf-8?B?R2VqNStZK3RMSDNONjQzSVRJdk1yRXM2WFRMaWZzNy9YSzRwN2M4ZlAreUNI?=
 =?utf-8?B?U0phVkQzUjJ1VldMSGZCNk9rYXlYNjI3WlBkeU1ualFaTjZ4UUh0d1dRaEY0?=
 =?utf-8?B?ZEgrcllrbDlaeFFWcEV1TE9pcnJoZ0pwWnVJUkJNWjd3QnhFUlhzRU0zc0xi?=
 =?utf-8?B?dDl0NzNwNE1KSFQ3cjRhMm9BTHNuRE9ONTVua01oQmRoeE02ZTRWTEMvZ21Z?=
 =?utf-8?B?TkpQdXhJZm9MYmRCTmYxamhYdysvRGtjNVVQNGMxZ25YWm1nZHlnRjNNcitU?=
 =?utf-8?B?MFlDRXl3V2l5Z2ZXMmFLNS9KS3ZCQ0x3R09BcUlqcFM5NjlxSGF1WVFjaFh0?=
 =?utf-8?B?ekFkU1BSWmtxaWJlR1N5NFdRd2F3M0wvTm5uL2p3NnhSZHBVeXVlSHFncnhR?=
 =?utf-8?B?b090VVZYbVIzZ3RmWjRLU1k2Rml6VnNzNEdCMU1Makt5VjI5WnBFcEVONFpi?=
 =?utf-8?Q?TGRXqp6A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 09:14:35.7200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb6faa0-0e13-4736-db76-08d8b7a3a59e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hai7nKVvZPNIEkKdcwtxWB504UezA4P91KVaKuHiSTHoWEmt3EbzONyG/Y9lzYou
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "yuq825@gmail.com" <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDEuMjEgdW0gMTY6NTkgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDEv
MTIvMjEgNzozMiBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTIuMDEuMjEgdW0g
MTA6MTAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4gT24gTW9uLCBKYW4gMTEsIDIwMjEgYXQg
MDM6NDU6MTBQTSAtMDUwMCwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pj4gT24gMS8xMS8y
MSAxMToxNSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+Pj4gT24gTW9uLCBKYW4gMTEsIDIw
MjEgYXQgMDU6MTM6NTZQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+Pj4+IE9uIEZy
aSwgSmFuIDA4LCAyMDIxIGF0IDA0OjQ5OjU1UE0gKzAwMDAsIEdyb2R6b3Zza3ksIEFuZHJleSB3
cm90ZToKPj4+Pj4+PiBPayB0aGVuLCBJIGd1ZXNzIEkgd2lsbCBwcm9jZWVkIHdpdGggdGhlIGR1
bW15IHBhZ2VzIGxpc3QgCj4+Pj4+Pj4gaW1wbGVtZW50YXRpb24gdGhlbi4KPj4+Pj4+Pgo+Pj4+
Pj4+IEFuZHJleQo+Pj4+Pj4+Cj4+Pj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4+Pj4+PiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQu
Y29tPgo+Pj4+Pj4+IFNlbnQ6IDA4IEphbnVhcnkgMjAyMSAwOTo1Mgo+Pj4+Pj4+IFRvOiBHcm9k
em92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+OyBEYW5pZWwgCj4+Pj4+
Pj4gVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4+Pj4+Pj4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnIAo+Pj4+Pj4+IDxhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgCj4+Pj4+Pj4gPGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc+OyBkYW5pZWwudmV0dGVyQGZmd2xsLmNoIAo+Pj4+Pj4+IDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPjsgcm9iaEBrZXJuZWwub3JnIDxyb2JoQGtlcm5lbC5vcmc+OyAKPj4+
Pj4+PiBsLnN0YWNoQHBlbmd1dHJvbml4LmRlIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPjsgCj4+
Pj4+Pj4geXVxODI1QGdtYWlsLmNvbSA8eXVxODI1QGdtYWlsLmNvbT47IGVyaWNAYW5ob2x0Lm5l
dCAKPj4+Pj4+PiA8ZXJpY0BhbmhvbHQubmV0PjsgRGV1Y2hlciwgQWxleGFuZGVyIAo+Pj4+Pj4+
IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmcg
Cj4+Pj4+Pj4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPjsgcHBhYWxhbmVuQGdtYWlsLmNv
bSAKPj4+Pj4+PiA8cHBhYWxhbmVuQGdtYWlsLmNvbT47IFdlbnRsYW5kLCBIYXJyeSA8SGFycnku
V2VudGxhbmRAYW1kLmNvbT4KPj4+Pj4+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDAxLzEyXSBk
cm06IEFkZCBkdW1teSBwYWdlIHBlciBkZXZpY2Ugb3IgCj4+Pj4+Pj4gR0VNIG9iamVjdAo+Pj4+
Pj4+Cj4+Pj4+Pj4gTWhtLCBJJ20gbm90IGF3YXJlIG9mIGFueSBsZXQgb3ZlciBwb2ludGVyIGJl
dHdlZW4gVFRNIGFuZCBHRU0gCj4+Pj4+Pj4gYW5kIHdlCj4+Pj4+Pj4gd29ya2VkIHF1aXRlIGhh
cmQgb24gcmVkdWNpbmcgdGhlIHNpemUgb2YgdGhlIGFtZGdwdV9ibywgc28gYW5vdGhlcgo+Pj4+
Pj4+IGV4dHJhIHBvaW50ZXIganVzdCBmb3IgdGhhdCBjb3JuZXIgY2FzZSB3b3VsZCBzdWNrIHF1
aXRlIGEgYml0Lgo+Pj4+Pj4gV2UgaGF2ZSBhIHRvbiBvZiBvdGhlciBwb2ludGVycyBpbiBzdHJ1
Y3QgYW1kZ3B1X2JvIChvciBhbnkgb2YgCj4+Pj4+PiBpdCdzIGxvd2VyCj4+Pj4+PiB0aGluZ3Mp
IHdoaWNoIGFyZSBmYWlybHkgc2luZ2xlLXVzZSwgc28gSSdtIHJlYWxseSBub3QgbXVjaCAKPj4+
Pj4+IHNlZWluZyB0aGUKPj4+Pj4+IHBvaW50IGluIG1ha2luZyB0aGlzIGEgc3BlY2lhbCBjYXNl
LiBJdCBhbHNvIG1lYW5zIHRoZSBsaWZldGltZSAKPj4+Pj4+IG1hbmFnZW1lbnQKPj4+Pj4+IGJl
Y29tZXMgYSBiaXQgaWZmeSwgc2luY2Ugd2UgY2FuJ3QgdGhyb3cgYXdheSB0aGUgZHVtbXkgcGFn
ZSB0aGVuIAo+Pj4+Pj4gdGhlIGxhc3QKPj4+Pj4+IHJlZmVyZW5jZSB0byB0aGUgYm8gaXMgcmVs
ZWFzZWQgKHNpbmNlIHdlIGRvbid0IHRyYWNrIGl0IHRoZXJlKSwgCj4+Pj4+PiBidXQgb25seQo+
Pj4+Pj4gd2hlbiB0aGUgbGFzdCBwb2ludGVyIHRvIHRoZSBkZXZpY2UgaXMgcmVsZWFzZWQuIFBv
dGVudGlhbGx5IHRoaXMgCj4+Pj4+PiBtZWFucyBhCj4+Pj4+PiBwaWxlIG9mIGRhbmdsaW5nIHBh
Z2VzIGhhbmdpbmcgYXJvdW5kIGZvciB0b28gbG9uZy4KPj4+Pj4gQWxzbyBpZiB5b3UgcmVhbGx5
LCByZWFsbHksIHJlYWxseSB3YW50IHRvIGhhdmUgdGhpcyBsaXN0LCBwbGVhc2UgCj4+Pj4+IGRv
bid0Cj4+Pj4+IHJlaW52ZW50IGl0IHNpbmNlIHdlIGhhdmUgaXQgYWxyZWFkeS4gZHJtbV8gaXMg
ZXhhY3RseSBtZWFudCBmb3IgCj4+Pj4+IHJlc291cmNlcwo+Pj4+PiB0aGF0IHNob3VsZCBiZSBm
cmVlZCB3aGVuIHRoZSBmaW5hbCBkcm1fZGV2aWNlIHJlZmVyZW5jZSBkaXNhcHBlYXJzLgo+Pj4+
PiAtRGFuaWVsCj4+Pj4KPj4+PiBJIG1heWJlIHdhcyBlYWdlciB0byBlYXJseSwgc2VlIGkgbmVl
ZCB0byBleHBsaWNpdGx5IGFsbG9jYXRlIHRoZSAKPj4+PiBkdW1teSBwYWdlCj4+Pj4gdXNpbmcg
cGFnZV9hbGxvYyBzbwo+Pj4+IGkgY2Fubm90IHVzZSBkcm1tX2ttYWxsb2MgZm9yIHRoaXMsIHNv
IG9uY2UgYWdhaW4gbGlrZSB3aXRoIHRoZSAKPj4+PiBsaXN0IGkgbmVlZAo+Pj4+IHRvIHdyYXAg
aXQgd2l0aCBhIGNvbnRhaW5lciBzdHJ1Y3QKPj4+PiB3aGljaCBpIGNhbiB0aGVuIGFsbG9jYXRl
IHVzaW5nIGRybW1fa21hbGxvYyBhbmQgaW5zaWRlIHRoZXJlIHdpbGwgCj4+Pj4gYmUgcGFnZQo+
Pj4+IHBvaW50ZXIuIEJ1dCB0aGVuCj4+Pj4gb24gcmVsZWFzZSBpdCBuZWVkcyB0byBmcmVlIHRo
ZSBwYWdlIGFuZCBzbyBpIHN1cHBvc2VkbHkgbmVlZCB0byAKPj4+PiB1c2UgZHJtbV9hZGRfYWN0
aW9uCj4+Pj4gdG8gZnJlZSB0aGUgcGFnZSBiZWZvcmUgdGhlIGNvbnRhaW5lciBzdHJ1Y3QgaXMg
cmVsZWFzZWQgYnV0IAo+Pj4+IGRybW1fa21hbGxvYwo+Pj4+IGRvZXNuJ3QgYWxsb3cgdG8gc2V0
Cj4+Pj4gcmVsZWFzZSBhY3Rpb24gb24gc3RydWN0IGFsbG9jYXRpb24uIFNvIEkgY3JlYXRlZCBh
IG5ldwo+Pj4+IGRybW1fa21hbGxvY193aXRoX2FjdGlvbiBBUEkgZnVuY3Rpb24KPj4+PiBidXQg
dGhlbiB5b3UgYWxzbyBuZWVkIHRvIHN1cHBseSB0aGUgb3B0aW9uYWwgZGF0YSBwb2ludGVyIGZv
ciB0aGUgCj4+Pj4gcmVsZWFzZQo+Pj4+IGFjdGlvbiAodGhlIHN0cnVjdCBwYWdlIGluIHRoaXMg
Y2FzZSkKPj4+PiBhbmQgc28gdGhpcyBhbGwgYmVjb21lcyBhIGJpdCBvdmVyY29tcGxpY2F0ZWQg
KGJ1dCBkb2FibGUpLiBJcyB0aGlzIAo+Pj4+IGV4dHJhCj4+Pj4gQVBJIHdvcnRoIGFkZGluZyA/
IE1heWJlIGl0IGNhbgo+Pj4+IGJlIHVzZWZ1bCBpbiBnZW5lcmFsLgo+Pj4gZHJtX2FkZF9hY3Rp
b25fb3JfcmVzZXQgKGZvciBiZXR0ZXIgY29udHJvbCBmbG93KSBoYXMgYm90aCBhIHZvaWQgKiAK
Pj4+IGRhdGEKPj4+IGFuZCBhIGNsZWFudXAgZnVuY3Rpb24gKGFuZCBpdCBpbnRlcm5hbGx5IGFs
bG9jYXRlcyB0aGUgdHJhY2tpbmcgCj4+PiBzdHJ1Y3R1cmUKPj4+IGZvciB0aGF0IGZvciB5b3Up
LiBTbyBzaG91bGQgd29yayBhcy1pcz8gQWxsb2NhdGluZyBhIHRyYWNraW5nIAo+Pj4gc3RydWN0
dXJlCj4+PiBmb3Igb3VyIHRyYWNraW5nIHN0cnVjdHVyZSBmb3IgYSBwYWdlIHdvdWxkIGRlZmlu
aXRlbHkgYmUgYSBiaXQgdG9vIAo+Pj4gbXVjaC4KPj4+Cj4+PiBFc3NlbnRpYWxsIGRybW1fYWRk
X2FjdGlvbiBpcyB5b3VyIGtjYWxsb2Nfd2l0aF9hY3Rpb24gZnVuY3Rpb24geW91IAo+Pj4gd2Fu
dCwKPj4+IGFzIGxvbmcgYXMgYWxsIHlvdSBuZWVkIGlzIGEgc2luZ2xlIHZvaWQgKiBwb2ludGVy
ICh3ZSBjb3VsZCBkbyB0aGUKPj4+IGt6YWxsb2Nfd2l0aF9hY3Rpb24gdGhvdWdoLCB0aGVyZSdz
IGVub3VnaCBzcGFjZSwganVzdCBubyBuZWVkIHlldCAKPj4+IGZvciBhbnkKPj4+IG9mIHRoZSBj
dXJyZW50IHVzZXJzKS4KPj4KPj4gWWVhaCwgYnV0IG15IHRoaW5raW5nIHdhcyB0aGF0IHdlIHNo
b3VsZCB1c2UgdGhlIHBhZ2UgTFJVIGZvciB0aGlzIAo+PiBhbmQgbm90IGFub3RoZXIgY29udGFp
bmVyIHN0cnVjdHVyZS4KPj4KPj4gQ2hyaXN0aWFuLgo+Cj4KPiBXaGljaCBzcGVjaWZpYyBsaXN0
IGRpZCB5b3UgbWVhbiA/CgpUaGUgc3RydWN0IHBhZ2UgKiB5b3UgZ2V0IGZyb20gZ2V0X2ZyZWVf
cGFnZSgpIGFscmVhZHkgaGFzIGFuIGxydSBtZW1iZXIgCm9mIHR5cGUgbGlzdF9oZWFkLgoKVGhp
cyB3YXkgeW91IGNhbiBsaW5rIHBhZ2VzIHRvZ2V0aGVyIGZvciBsYXRlciBkZXN0cnVjdGlvbiB3
aXRob3V0IHRoZSAKbmVlZCBvZiBhIGNvbnRhaW5lciBvYmplY3QuCgpDaHJpc3RpYW4uCgo+Cj4g
QW5kcmV5Cj4KPgo+Pgo+Pj4gLURhbmllbAo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
