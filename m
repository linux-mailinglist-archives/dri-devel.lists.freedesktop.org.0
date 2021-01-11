Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D712F1CAD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 18:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335FA89BFB;
	Mon, 11 Jan 2021 17:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF2189BFB;
 Mon, 11 Jan 2021 17:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddfV7SAMS/YuvYAsoXouIS+n/PHd54ydn35l1CqcqIJ8LQu6jqNd6djo1wpGZlSIHPtJI/L+DHKeO/J8Tcfd5NkQLu2U93hAbSQvxZYV2Pueizkju4PE/lNmv12MvEsSua8i+BpJ7u/fsP4Q3hKdIkq4pdOul74K0HK35nD4QzcQaHTC58Im6iZtTwHoejQ28zrnsZwuGpteJYSNRU29wPYpeWZr4/GOZsakOBwN9d1xcwY6hZ0bmtVycoTL2Lw14vpEVjUvcURUW4wJ0009jokrdQfzNe4WiIfHxtOgG123tcjPGY7YqjF3Wk9nDZWRAn0+Kn9Q03TV16BhBQMNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HQWclDvOMmHCvBIkTbTHH4e7dBiIi8okZ0vgxAXzCk=;
 b=ax32Z8Ec+90MQ3tCZTa4a49qimmoonwGQx0zmFKjPBGBcvsskO/1jyZE1W2udkdHPNZjtFTc6MAJD5Ecz91T/MTFm/tCb8aTT0CvfnqEvgkepbjFxL9RJT88Z6WWSdXN9zExlyZ2XKLKWqMDXTF7tFh2sUJRiPGuN6a0WQiJ7ogOKsU4biB5qxs59y5Dmopc3gSH1lbj7PNGyKw/NywD4VL6vkKQ24QNmfNpaDPI7Rz72o6krZ/kryZvurd4JR21PwTWB6hbazuvu9VlMaRemPDFFyRZyI4T/Ovwhr+r461E4ll3b+LrXQ44D5ZMIiM6c+/eKq+JlyoYRacbYNNFPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9HQWclDvOMmHCvBIkTbTHH4e7dBiIi8okZ0vgxAXzCk=;
 b=bJNvu840hCeNPQnddTd+9w+cJW3xElJoQ8NHWEVHiR0tZKnkF+2NOvGwkII2Y+3rdVFJEjXQob+6Olv7V3rs1H8wCXFoHJbq7xSqvRBRsjctvn61022bDbfTHYVuKNd9yfTpMpicjBy4rP57peXoK8SuPhlbAySp7msiPTxRtlA=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2701.namprd12.prod.outlook.com (2603:10b6:805:6f::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 17:41:33 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 17:41:33 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: Daniel Vetter <daniel@ffwll.ch>
References: <X/c1IXX11chjHyl4@phenom.ffwll.local>
 <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
 <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
 <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
 <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
 <SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0@SN6PR12MB4623.namprd12.prod.outlook.com>
 <X/x5RD0xQxWUYvQ3@phenom.ffwll.local> <X/x5nXM7bZDl+MWR@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <da936412-c40a-7e29-f1a4-f155c85d3836@amd.com>
Date: Mon, 11 Jan 2021 12:41:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <X/x5nXM7bZDl+MWR@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:b529:d7ba:9402:7ef6]
X-ClientProxiedBy: YT1PR01CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::9) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b529:d7ba:9402:7ef6]
 (2607:fea8:3edf:49b0:b529:d7ba:9402:7ef6) by
 YT1PR01CA0070.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 17:41:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 15bdcd31-a300-4cf4-7664-08d8b658231c
X-MS-TrafficTypeDiagnostic: SN6PR12MB2701:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2701BC06F25F4AADC55B1C01EAAB0@SN6PR12MB2701.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ylBmE5VFrNoDdZxS/gUriQXbH/oMHDky4BsJvPtX07pAMI4SV3alUKMcVQGzL5w8xMydMbR5whtRmUK0s1D9BMGc6/rEkhCHzDQWUnCQ+a1Kw7wkoPTUOWLfdhFsW9h7nh4yip2q1ZV+g23JVWUf9LtE4VFSA6ae86KCHRMzuklUbDpBCHJrPYsiUYAaiJiax8Rjo/J4FwOmOU1OC47WrUHK/2r4HcX9mMTxZkuOWEVWpjCXXcd9idpiM6bLdDRUQo6aWBkMOxqbHMquqV3QyAk1vJo/Ut4Y5S4QWynmIdug3PbFxq4KAXtYEe4X75Pwn7sMnBdzFv9d0AZjS9sbLMBoCq9xcVXqn8gX5KdeSFE7nJ1V1oeMLnSBY7WA9viNzAYDb8lC7xCLULGGhOyHa1WOaA70h1V28K/G6Zwv05EyphMY27B45gMUH4ouFbq1RZmE3Bd3EoarEOBTeO2QCTM4TIO0BL5Cn2Ai84mb5o9JwUPrSy26p4NEIkQGkEjxU5x0jzMnkuSOVlUAiHIOC6zU+EN7jv8yNA15/FVJbRWapXtUCRjFKxhzJyAJX3GiP/ettxaKIk9tdjGZlKrDdA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(186003)(2616005)(966005)(31696002)(478600001)(66574015)(31686004)(7416002)(8936002)(86362001)(8676002)(16526019)(6486002)(66946007)(316002)(83380400001)(2906002)(54906003)(66476007)(83080400002)(6916009)(53546011)(4326008)(45080400002)(5660300002)(52116002)(66556008)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UUYwUG5KZDBNTVBTRmYrZXlTWExSdXBUa2xVUlFtNzJNdmNSVUZyVGhJcnR4?=
 =?utf-8?B?UU93ZGtBOFA0UWRlUU5YSXJCcDFnN09LT2FKMEg0Um9FUGVmQnA1YVUwWmd3?=
 =?utf-8?B?WUxUckxybGtqNlA3SmpDUUswT00zNzZ1V2c5SEVoVmRnU2ZsV0V1eUdnRzNK?=
 =?utf-8?B?dCtYeDNBRlM0K0MvbDVpcWk2dXk2WjJmM1krR0Z3K0FieUpMdkRKZStXU0ZJ?=
 =?utf-8?B?bXZTNm1mdnM4MWVaY1lkMkhvakloRTYxUmx1V0dZbUdFVWtDRzl4SFYyUUtm?=
 =?utf-8?B?WGVsZmxuV3Q2SDFOdk5pN09jMUdlT3oyRzhleGsrRlAydFFUa2t4NG1iN3RR?=
 =?utf-8?B?RlJJejlKMDBPMTBYdmhOQ3FZZ3pZblRwZTh0ZjRCdXhaNk41YnVsMEQwcStH?=
 =?utf-8?B?ZFNWN1Y3ZzMxSzk5emZPUktNeGxiUjNkT0RobVNIMDFFbHJVQkFYWld1bnAw?=
 =?utf-8?B?ZENHQlFXQzJldkZwSUNGTzc1anl6Z0p3RXo0OWhNb21qQ05weTluYnBZS2pv?=
 =?utf-8?B?OEowOFFUYUxXOFlMejZSL3Z0aDVrdFlYU0FKdnhkSmx1TFZoVy9wbVd1UjFx?=
 =?utf-8?B?WWJiYU80SUlMNDg1S3B3QStuM3I1SHdZVVJIdGFObDNNQW8vWGNCVWdpQmZx?=
 =?utf-8?B?RzdyekFPNEllZDBlRDJRUlpyOEc2Y1Fsc0N2NjFkZVhDYnNuRzE3N2RoUUY4?=
 =?utf-8?B?azFnVjhmbmZlR2l5dmtoMEluOElRdFp5eHlVamNyMDNsQXNONGJMRVdKSkxp?=
 =?utf-8?B?NmMvQXhMdndjOHJmV3J4dG1xdXpnb1BEQ1M3a0hscEM2YU84VEdENWI3SGpD?=
 =?utf-8?B?aEtqSmlkcEdZVjNCOVQ4Nk90ZUJ0MEh4ZnA4V2VCQW5wM2dtUE1LQklUV2tH?=
 =?utf-8?B?eWwrUVR2azQrdExhdk5nV09sNHFQWnBWUGNLNGk3NUVBUG5oSmtETkJIUE50?=
 =?utf-8?B?UEVwM2dJU05TemtRaUl0bERETEJFN0NIcWpROGRZaDkzb3N4Tzczd3ZKbGox?=
 =?utf-8?B?Mk5CTW1aRVM4Y2plUDRHc0g2dUVkMWhZd0h3cUsxeTVocDZQMk1MbDZpczEy?=
 =?utf-8?B?UERZYW5Ham1WWjhVc3g3c01TaDVQbTNXcGFvVW9ZYXk0VTlTRUtqTnBXejl2?=
 =?utf-8?B?S1EwaDRZaEk0dWl6cTZjZkFpaW5kcm0wVjlwdGxiUGtQWCtLMjJ0VUFCZDU5?=
 =?utf-8?B?M2NoL0FERmRVcmNjMDhmVkt0VGpEQXhJa3ord3lIQURONzBYdXA4a2pKSHRn?=
 =?utf-8?B?RHpBMyszVkdJRUc0QklXM3hoQ1Q3R2s4K2dPWStWQlV6SEhCTGltZkN4dEVO?=
 =?utf-8?B?N1I1eS9lWU42elNEUTNpeGpXWENNblk5enlzSUErR0xZL2Z5NkQwY0EvVmcz?=
 =?utf-8?B?KzlieXRQVnQxakhvSHlUU2pSWG1mOHNtbEE1SDlGcUxMa3JGMy9vVnV1Y1JU?=
 =?utf-8?Q?mZhUw2dT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 17:41:33.4091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 15bdcd31-a300-4cf4-7664-08d8b658231c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21YV8WjacPbI3Oh0wdFRyhiMZXAcbb45Haq+LPd4QdOxTIIlUYtJztXkGlnXTqR3DURatepx0mllkRhr0EyITQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2701
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
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "yuq825@gmail.com" <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEvMTEvMjEgMTE6MTUgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gTW9uLCBKYW4g
MTEsIDIwMjEgYXQgMDU6MTM6NTZQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4gT24g
RnJpLCBKYW4gMDgsIDIwMjEgYXQgMDQ6NDk6NTVQTSArMDAwMCwgR3JvZHpvdnNreSwgQW5kcmV5
IHdyb3RlOgo+Pj4gT2sgdGhlbiwgSSBndWVzcyBJIHdpbGwgcHJvY2VlZCB3aXRoIHRoZSBkdW1t
eSBwYWdlcyBsaXN0IGltcGxlbWVudGF0aW9uIHRoZW4uCj4+Pgo+Pj4gQW5kcmV5Cj4+Pgo+Pj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IEZyb206IEtvZW5pZywgQ2hyaXN0
aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+Cj4+PiBTZW50OiAwOCBKYW51YXJ5IDIwMjEg
MDk6NTIKPj4+IFRvOiBHcm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5j
b20+OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4+PiBDYzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz47IGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2ggPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+OyByb2Jo
QGtlcm5lbC5vcmcgPHJvYmhAa2VybmVsLm9yZz47IGwuc3RhY2hAcGVuZ3V0cm9uaXguZGUgPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+OyB5dXE4MjVAZ21haWwuY29tIDx5dXE4MjVAZ21haWwuY29t
PjsgZXJpY0BhbmhvbHQubmV0IDxlcmljQGFuaG9sdC5uZXQ+OyBEZXVjaGVyLCBBbGV4YW5kZXIg
PEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBwcGFhbGFuZW5AZ21haWwuY29tIDxwcGFhbGFu
ZW5AZ21haWwuY29tPjsgV2VudGxhbmQsIEhhcnJ5IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPgo+
Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwMS8xMl0gZHJtOiBBZGQgZHVtbXkgcGFnZSBwZXIg
ZGV2aWNlIG9yIEdFTSBvYmplY3QKPj4+Cj4+PiBNaG0sIEknbSBub3QgYXdhcmUgb2YgYW55IGxl
dCBvdmVyIHBvaW50ZXIgYmV0d2VlbiBUVE0gYW5kIEdFTSBhbmQgd2UKPj4+IHdvcmtlZCBxdWl0
ZSBoYXJkIG9uIHJlZHVjaW5nIHRoZSBzaXplIG9mIHRoZSBhbWRncHVfYm8sIHNvIGFub3RoZXIK
Pj4+IGV4dHJhIHBvaW50ZXIganVzdCBmb3IgdGhhdCBjb3JuZXIgY2FzZSB3b3VsZCBzdWNrIHF1
aXRlIGEgYml0Lgo+PiBXZSBoYXZlIGEgdG9uIG9mIG90aGVyIHBvaW50ZXJzIGluIHN0cnVjdCBh
bWRncHVfYm8gKG9yIGFueSBvZiBpdCdzIGxvd2VyCj4+IHRoaW5ncykgd2hpY2ggYXJlIGZhaXJs
eSBzaW5nbGUtdXNlLCBzbyBJJ20gcmVhbGx5IG5vdCBtdWNoIHNlZWluZyB0aGUKPj4gcG9pbnQg
aW4gbWFraW5nIHRoaXMgYSBzcGVjaWFsIGNhc2UuIEl0IGFsc28gbWVhbnMgdGhlIGxpZmV0aW1l
IG1hbmFnZW1lbnQKPj4gYmVjb21lcyBhIGJpdCBpZmZ5LCBzaW5jZSB3ZSBjYW4ndCB0aHJvdyBh
d2F5IHRoZSBkdW1teSBwYWdlIHRoZW4gdGhlIGxhc3QKPj4gcmVmZXJlbmNlIHRvIHRoZSBibyBp
cyByZWxlYXNlZCAoc2luY2Ugd2UgZG9uJ3QgdHJhY2sgaXQgdGhlcmUpLCBidXQgb25seQo+PiB3
aGVuIHRoZSBsYXN0IHBvaW50ZXIgdG8gdGhlIGRldmljZSBpcyByZWxlYXNlZC4gUG90ZW50aWFs
bHkgdGhpcyBtZWFucyBhCj4+IHBpbGUgb2YgZGFuZ2xpbmcgcGFnZXMgaGFuZ2luZyBhcm91bmQg
Zm9yIHRvbyBsb25nLgo+IEFsc28gaWYgeW91IHJlYWxseSwgcmVhbGx5LCByZWFsbHkgd2FudCB0
byBoYXZlIHRoaXMgbGlzdCwgcGxlYXNlIGRvbid0Cj4gcmVpbnZlbnQgaXQgc2luY2Ugd2UgaGF2
ZSBpdCBhbHJlYWR5LiBkcm1tXyBpcyBleGFjdGx5IG1lYW50IGZvciByZXNvdXJjZXMKPiB0aGF0
IHNob3VsZCBiZSBmcmVlZCB3aGVuIHRoZSBmaW5hbCBkcm1fZGV2aWNlIHJlZmVyZW5jZSBkaXNh
cHBlYXJzLgo+IC1EYW5pZWwKCgpDYW4geW91IGVsYWJvcmF0ZSA/IFdlIHN0aWxsIG5lZWQgdG8g
YWN0dWFsbHkgaW1wbGVtZW50IHRoZSBsaXN0IGJ1dCB5b3Ugd2FudCBtZSAKdG8gdXNlCmRybW1f
YWRkX2FjdGlvbiBmb3IgaXQncyBkZXN0cnVjdGlvbiBpbnN0ZWFkIG9mIGV4cGxpY2l0bHkgZG9p
bmcgaXQgKGxpa2UgSSdtIAphbHJlYWR5IGRvaW5nIGZyb23CoCB0dG1fYm9fZGV2aWNlX3JlbGVh
c2UpID8KCkFuZHJleQoKCj4gICAKPj4gSWYgeW91IG5lZWQgc29tZSBpZGVhcyBmb3IgcmVkdW5k
YW50IHBvaW50ZXJzOgo+PiAtIGRlc3Ryb3kgY2FsbGJhY2sgKGtpbmRhIG5vdCBjb29sIHRvIG5v
dCBoYXZlIHRoaXMgY29uc3QgYW55d2F5KSwgd2UKPj4gICAgY291bGQgcmVmY291bnQgaXQgYWxs
IHdpdGggdGhlIG92ZXJhbGwgZ2VtIGJvLiBRdWl0ZSBhIGJpdCBvZiB3b3JrLgo+PiAtIGJkZXYg
cG9pbnRlciwgaWYgd2UgbW92ZSB0aGUgZGV2aWNlIHR0bSBzdHVmZiBpbnRvIHN0cnVjdCBkcm1f
ZGV2aWNlLCBvcgo+PiAgICBjcmVhdGUgYSBjb21tb24gc3RydWN0IHR0bV9kZXZpY2UsIHdlIGNh
biBkaXRjaCB0aGF0Cj4+IC0gV2UgY291bGQgcHJvYmFibHkgbWVyZ2UgYSBmZXcgb2YgdGhlIGZp
ZWxkcyBhbmQgZmluZCA4IGJ5dGVzIHNvbWV3aGVyZQo+PiAtIHdlIHN0aWxsIGhhdmUgMiBrcmVm
cywgd291bGQgcHJvYmFibHkgbmVlZCB0byBmaXggdGhhdCBiZWZvcmUgd2UgY2FuCj4+ICAgIG1l
cmdlIHRoZSBkZXN0cm95IGNhbGxiYWNrcwo+Pgo+PiBTbyB0aGVyZSdzIHBsZW50eSBvZiByb29t
IHN0aWxsLCBpZiB0aGUgc2l6ZSBvZiBhIGJvIHN0cnVjdCBpcyByZWFsbHkgdGhhdAo+PiBjcml0
aWNhbC4gSW1vIGl0J3Mgbm90Lgo+Pgo+Pgo+Pj4gQ2hyaXN0aWFuLgo+Pj4KPj4+IEFtIDA4LjAx
LjIxIHVtIDE1OjQ2IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4gRGFuaWVsIGhhZCBz
b21lIG9iamVjdGlvbnMgdG8gdGhpcyAoc2VlIGJlbGxvdykgYW5kIHNvIEkgZ3Vlc3MgSSBuZWVk
Cj4+Pj4geW91IGJvdGggdG8gYWdyZWUgb24gdGhlIGFwcHJvYWNoIGJlZm9yZSBJIHByb2NlZWQu
Cj4+Pj4KPj4+PiBBbmRyZXkKPj4+Pgo+Pj4+IE9uIDEvOC8yMSA5OjMzIEFNLCBDaHJpc3RpYW4g
S8O2bmlnIHdyb3RlOgo+Pj4+PiBBbSAwOC4wMS4yMSB1bSAxNToyNiBzY2hyaWViIEFuZHJleSBH
cm9kem92c2t5Ogo+Pj4+Pj4gSGV5IENocmlzdGlhbiwganVzdCBhIHBpbmcuCj4+Pj4+IFdhcyB0
aGVyZSBhbnkgcXVlc3Rpb24gZm9yIG1lIGhlcmU/Cj4+Pj4+Cj4+Pj4+IEFzIGZhciBhcyBJIGNh
biBzZWUgdGhlIGJlc3QgYXBwcm9hY2ggd291bGQgc3RpbGwgYmUgdG8gZmlsbCB0aGUgVk1BCj4+
Pj4+IHdpdGggYSBzaW5nbGUgZHVtbXkgcGFnZSBhbmQgYXZvaWQgcG9pbnRlcnMgaW4gdGhlIEdF
TSBvYmplY3QuCj4+Pj4+Cj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4KPj4+Pj4+IEFuZHJleQo+Pj4+
Pj4KPj4+Pj4+IE9uIDEvNy8yMSAxMTozNyBBTSwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+
Pj4+Pj4gT24gMS83LzIxIDExOjMwIEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+Pj4+PiBP
biBUaHUsIEphbiAwNywgMjAyMSBhdCAxMToyNjo1MkFNIC0wNTAwLCBBbmRyZXkgR3JvZHpvdnNr
eSB3cm90ZToKPj4+Pj4+Pj4+IE9uIDEvNy8yMSAxMToyMSBBTSwgRGFuaWVsIFZldHRlciB3cm90
ZToKPj4+Pj4+Pj4+PiBPbiBUdWUsIEphbiAwNSwgMjAyMSBhdCAwNDowNDoxNlBNIC0wNTAwLCBB
bmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4+Pj4+Pj4+Pj4gT24gMTEvMjMvMjAgMzowMSBBTSwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+Pj4+Pj4+IEFtIDIzLjExLjIwIHVtIDA1OjU0
IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+Pj4+Pj4gT24gMTEvMjEvMjAgOTox
NSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+Pj4+Pj4+Pj4gQW0gMjEuMTEuMjAg
dW0gMDY6MjEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Pj4+Pj4+Pj4+IFdpbGwg
YmUgdXNlZCB0byByZXJvdXRlIENQVSBtYXBwZWQgQk8ncyBwYWdlIGZhdWx0cyBvbmNlCj4+Pj4+
Pj4+Pj4+Pj4+PiBkZXZpY2UgaXMgcmVtb3ZlZC4KPj4+Pj4+Pj4+Pj4+Pj4gVWZmLCBvbmUgcGFn
ZSBmb3IgZWFjaCBleHBvcnRlZCBETUEtYnVmPyBUaGF0J3Mgbm90Cj4+Pj4+Pj4+Pj4+Pj4+IHNv
bWV0aGluZyB3ZSBjYW4gZG8uCj4+Pj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4+IFdlIG5lZWQg
dG8gZmluZCBhIGRpZmZlcmVudCBhcHByb2FjaCBoZXJlLgo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4+Pj4+PiBDYW4ndCB3ZSBjYWxsIGFsbG9jX3BhZ2UoKSBvbiBlYWNoIGZhdWx0IGFuZCBsaW5r
IHRoZW0gdG9nZXRoZXIKPj4+Pj4+Pj4+Pj4+Pj4gc28gdGhleSBhcmUgZnJlZWQgd2hlbiB0aGUg
ZGV2aWNlIGlzIGZpbmFsbHkgcmVhcGVkPwo+Pj4+Pj4+Pj4+Pj4+IEZvciBzdXJlIGJldHRlciB0
byBvcHRpbWl6ZSBhbmQgYWxsb2NhdGUgb24gZGVtYW5kIHdoZW4gd2UgcmVhY2gKPj4+Pj4+Pj4+
Pj4+PiB0aGlzIGNvcm5lciBjYXNlLCBidXQgd2h5IHRoZSBsaW5raW5nID8KPj4+Pj4+Pj4+Pj4+
PiBTaG91bGRuJ3QgZHJtX3ByaW1lX2dlbV9kZXN0cm95IGJlIGdvb2QgZW5vdWdoIHBsYWNlIHRv
IGZyZWUgPwo+Pj4+Pj4+Pj4+Pj4gSSB3YW50IHRvIGF2b2lkIGtlZXBpbmcgdGhlIHBhZ2UgaW4g
dGhlIEdFTSBvYmplY3QuCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gV2hhdCB3ZSBjYW4gZG8g
aXMgdG8gYWxsb2NhdGUgYSBwYWdlIG9uIGRlbWFuZCBmb3IgZWFjaCBmYXVsdAo+Pj4+Pj4+Pj4+
Pj4gYW5kIGxpbmsKPj4+Pj4+Pj4+Pj4+IHRoZSB0b2dldGhlciBpbiB0aGUgYmRldiBpbnN0ZWFk
Lgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IEFuZCB3aGVuIHRoZSBiZGV2IGlzIHRoZW4gZmlu
YWxseSBkZXN0cm95ZWQgYWZ0ZXIgdGhlIGxhc3QKPj4+Pj4+Pj4+Pj4+IGFwcGxpY2F0aW9uCj4+
Pj4+Pj4+Pj4+PiBjbG9zZWQgd2UgY2FuIGZpbmFsbHkgcmVsZWFzZSBhbGwgb2YgdGhlbS4KPj4+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Pj4+IEhleSwgc3RhcnRl
ZCB0byBpbXBsZW1lbnQgdGhpcyBhbmQgdGhlbiByZWFsaXplZCB0aGF0IGJ5Cj4+Pj4+Pj4+Pj4+
IGFsbG9jYXRpbmcgYSBwYWdlCj4+Pj4+Pj4+Pj4+IGZvciBlYWNoIGZhdWx0IGluZGlzY3JpbWlu
YXRlbHkKPj4+Pj4+Pj4+Pj4gd2Ugd2lsbCBiZSBhbGxvY2F0aW5nIGEgbmV3IHBhZ2UgZm9yIGVh
Y2ggZmF1bHRpbmcgdmlydHVhbAo+Pj4+Pj4+Pj4+PiBhZGRyZXNzIHdpdGhpbiBhCj4+Pj4+Pj4+
Pj4+IFZBIHJhbmdlIGJlbG9uZ2luZyB0aGUgc2FtZSBCTwo+Pj4+Pj4+Pj4+PiBhbmQgdGhpcyBp
cyBvYnZpb3VzbHkgdG9vIG11Y2ggYW5kIG5vdCB0aGUgaW50ZW50aW9uLiBTaG91bGQgSQo+Pj4+
Pj4+Pj4+PiBpbnN0ZWFkIHVzZQo+Pj4+Pj4+Pj4+PiBsZXQncyBzYXkgYSBoYXNodGFibGUgd2l0
aCB0aGUgaGFzaAo+Pj4+Pj4+Pj4+PiBrZXkgYmVpbmcgZmF1bHRpbmcgQk8gYWRkcmVzcyB0byBh
Y3R1YWxseSBrZWVwIGFsbG9jYXRpbmcgYW5kCj4+Pj4+Pj4+Pj4+IHJldXNpbmcgc2FtZQo+Pj4+
Pj4+Pj4+PiBkdW1teSB6ZXJvIHBhZ2UgcGVyIEdFTSBCTwo+Pj4+Pj4+Pj4+PiAob3IgZm9yIHRo
YXQgbWF0dGVyIERSTSBmaWxlIG9iamVjdCBhZGRyZXNzIGZvciBub24gaW1wb3J0ZWQKPj4+Pj4+
Pj4+Pj4gQk9zKSA/Cj4+Pj4+Pj4+Pj4gV2h5IGRvIHdlIG5lZWQgYSBoYXNodGFibGU/IEFsbCB0
aGUgc3cgc3RydWN0dXJlcyB0byB0cmFjayB0aGlzCj4+Pj4+Pj4+Pj4gc2hvdWxkCj4+Pj4+Pj4+
Pj4gc3RpbGwgYmUgYXJvdW5kOgo+Pj4+Pj4+Pj4+IC0gaWYgZ2VtX2JvLT5kbWFfYnVmIGlzIHNl
dCB0aGUgYnVmZmVyIGlzIGN1cnJlbnRseSBleHBvcnRlZCBhcwo+Pj4+Pj4+Pj4+IGEgZG1hLWJ1
ZiwKPj4+Pj4+Pj4+PiAgICAgIHNvIGRlZmVuc2l2ZWx5IGFsbG9jYXRlIGEgcGVyLWJvIHBhZ2UK
Pj4+Pj4+Pj4+PiAtIG90aGVyd2lzZSBhbGxvY2F0ZSBhIHBlci1maWxlIHBhZ2UKPj4+Pj4+Pj4+
IFRoYXQgZXhhY3RseSB3aGF0IHdlIGhhdmUgaW4gY3VycmVudCBpbXBsZW1lbnRhdGlvbgo+Pj4+
Pj4+Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gT3IgaXMgdGhlIGlkZWEgdG8gc2F2ZSB0aGUgc3Ry
dWN0IHBhZ2UgKiBwb2ludGVyPyBUaGF0IGZlZWxzIGEKPj4+Pj4+Pj4+PiBiaXQgbGlrZQo+Pj4+
Pj4+Pj4+IG92ZXItb3B0aW1pemluZyBzdHVmZi4gQmV0dGVyIHRvIGhhdmUgYSBzaW1wbGUgaW1w
bGVtZW50YXRpb24KPj4+Pj4+Pj4+PiBmaXJzdCBhbmQKPj4+Pj4+Pj4+PiB0aGVuIHR1bmUgaXQg
aWYgKGFuZCBvbmx5IGlmKSBhbnkgcGFydCBvZiBpdCBiZWNvbWVzIGEgcHJvYmxlbQo+Pj4+Pj4+
Pj4+IGZvciBub3JtYWwKPj4+Pj4+Pj4+PiB1c2FnZS4KPj4+Pj4+Pj4+IEV4YWN0bHkgLSB0aGUg
aWRlYSBpcyB0byBhdm9pZCBhZGRpbmcgZXh0cmEgcG9pbnRlciB0bwo+Pj4+Pj4+Pj4gZHJtX2dl
bV9vYmplY3QsCj4+Pj4+Pj4+PiBDaHJpc3RpYW4gc3VnZ2VzdGVkIHRvIGluc3RlYWQga2VlcCBh
IGxpbmtlZCBsaXN0IG9mIGR1bW15IHBhZ2VzCj4+Pj4+Pj4+PiB0byBiZQo+Pj4+Pj4+Pj4gYWxs
b2NhdGVkIG9uIGRlbWFuZCBvbmNlIHdlIGhpdCBhIHZtX2ZhdWx0LiBJIHdpbGwgdGhlbiBhbHNv
Cj4+Pj4+Pj4+PiBwcmVmYXVsdCB0aGUgZW50aXJlCj4+Pj4+Pj4+PiBWQSByYW5nZSBmcm9tIHZt
YS0+dm1fZW5kIC0gdm1hLT52bV9zdGFydCB0byB2bWEtPnZtX2VuZCBhbmQgbWFwCj4+Pj4+Pj4+
PiB0aGVtCj4+Pj4+Pj4+PiB0byB0aGF0IHNpbmdsZSBkdW1teSBwYWdlLgo+Pj4+Pj4+PiBUaGlz
IHN0cm9uZ2x5IGZlZWxzIGxpa2UgcHJlbWF0dXJlIG9wdGltaXphdGlvbi4gSWYgeW91J3JlIHdv
cnJpZWQKPj4+Pj4+Pj4gYWJvdXQKPj4+Pj4+Pj4gdGhlIG92ZXJoZWFkIG9uIGFtZGdwdSwgcGF5
IGRvd24gdGhlIGRlYnQgYnkgcmVtb3Zpbmcgb25lIG9mIHRoZQo+Pj4+Pj4+PiByZWR1bmRhbnQK
Pj4+Pj4+Pj4gcG9pbnRlcnMgYmV0d2VlbiBnZW0gYW5kIHR0bSBibyBzdHJ1Y3RzIChJIHRoaW5r
IHdlIHN0aWxsIGhhdmUKPj4+Pj4+Pj4gc29tZSkgOi0pCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFVudGls
IHdlJ3ZlIG51a2VkIHRoZXNlIGVhc3kmb2J2aW91cyBvbmVzIHdlIHNob3VsZG4ndCBwbGF5ICJh
dm9pZCAxCj4+Pj4+Pj4+IHBvaW50ZXIganVzdCBiZWNhdXNlIiBnYW1lcyB3aXRoIGhhc2h0YWJs
ZXMuCj4+Pj4+Pj4+IC1EYW5pZWwKPj4+Pj4+Pgo+Pj4+Pj4+IFdlbGwsIGlmIHlvdSBhbmQgQ2hy
aXN0aWFuIGNhbiBhZ3JlZSBvbiB0aGlzIGFwcHJvYWNoIGFuZCBzdWdnZXN0Cj4+Pj4+Pj4gbWF5
YmUgd2hhdCBwb2ludGVyIGlzCj4+Pj4+Pj4gcmVkdW5kYW50IGFuZCBjYW4gYmUgcmVtb3ZlZCBm
cm9tIEdFTSBzdHJ1Y3Qgc28gd2UgY2FuIHVzZSB0aGUKPj4+Pj4+PiAnY3JlZGl0JyB0byBhZGQg
dGhlIGR1bW15IHBhZ2UKPj4+Pj4+PiB0byBHRU0gSSB3aWxsIGJlIGhhcHB5IHRvIGZvbGxvdyB0
aHJvdWdoLgo+Pj4+Pj4+Cj4+Pj4+Pj4gUC5TIEhhc2ggdGFibGUgaXMgb2ZmIHRoZSB0YWJsZSBh
bnl3YXkgYW5kIHdlIGFyZSB0YWxraW5nIG9ubHkKPj4+Pj4+PiBhYm91dCBsaW5rZWQgbGlzdCBo
ZXJlIHNpbmNlIGJ5IHByZWZhdWx0aW5nCj4+Pj4+Pj4gdGhlIGVudGlyZSBWQSByYW5nZSBmb3Ig
YSB2bWYtPnZtYSBpIHdpbGwgYmUgYXZvaWRpbmcgcmVkdW5kYW50Cj4+Pj4+Pj4gcGFnZSBmYXVs
dHMgdG8gc2FtZSBWTUEgVkEgcmFuZ2UgYW5kIHNvCj4+Pj4+Pj4gZG9uJ3QgbmVlZCB0byBzZWFy
Y2ggYW5kIHJldXNlIGFuIGV4aXN0aW5nIGR1bW15IHBhZ2UgYnV0IHNpbXBseQo+Pj4+Pj4+IGNy
ZWF0ZSBhIG5ldyBvbmUgZm9yIGVhY2ggbmV4dCBmYXVsdC4KPj4+Pj4+Pgo+Pj4+Pj4+IEFuZHJl
eQo+PiAtLSAKPj4gRGFuaWVsIFZldHRlcgo+PiBTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29y
cG9yYXRpb24KPj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNv
bS8/dXJsPWh0dHAlM0ElMkYlMkZibG9nLmZmd2xsLmNoJTJGJmFtcDtkYXRhPTA0JTdDMDElN0Nh
bmRyZXkuZ3JvZHpvdnNreSU0MGFtZC5jb20lN0M0YjU4MWM1NWRmMjA0Y2EzZDA3NDA4ZDhiNjRj
MWRiOCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0NTk3
ODUzMjE3OTgzOTMlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlM
Q0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7
c2RhdGE9RXZ2QWlwOHZzOWZ6VlJTMXJiMHI1T0RpQk1uZ3hQdUk5R0tSMiUyRiUyQjJMekUlM0Qm
YW1wO3Jlc2VydmVkPTAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
