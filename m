Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 615AF2DC9E1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 01:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F62889AC0;
	Thu, 17 Dec 2020 00:20:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2086.outbound.protection.outlook.com [40.107.92.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056D489911;
 Thu, 17 Dec 2020 00:20:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6oPG6jdhyiVKf5QDa2N961CC26iLt46hxgehd9xxyMwONysoz7XJw9NNuqhl3GQEN4lajQk88GFeMm80EsHmYPwDDePjP2ox/ArAzjc4hWeq5xqMX8fRJ4gMV/Y5MjQjoaeD2qIk8PIbgkqO+cpCi4BgWTjRv8WFQjlznaYWrqEHK2kW/jGioiFAICP7ygd1ZiAN3PDLpfrRMt5mrvOTpB72foSO2FIhYjTGCDFcsqMOKQKf0zYMZEctiNUy48DFDGeeuBHQNjQ5oC+z65aX8hdF4XQ0ucrthabm/DRUlB1Ec97ufzUTrZYxtAGqnWeBjJWq4ILQ5nxT4GTwJrD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMaReU2xOrFusRjYW95orJ/H2YFnXjOYTnHqah99/hs=;
 b=LCcgN1XrPk9s7NhSbmEoWY61l9vp1HmKtQJFoY2BA1jb72SPRwwDR6FYJoVYi+82CZ+4WlaDTsw6R83yTsIuVPekPWQcwOce4Gld//TIALFkGWlwjvNNAYFfuU5GWhFSJlZaoocVG6GeYL5R+I9coce0o4RZYfcz+hZ5Gk9Hh7WDNs+gMIPkeQYkZoo8n0rEGN6f23nDBmDsOi7f4CedCmAD/RH48U+f1cI/NUDCkTl/TSkKmUxRoGG9xlKYNOwdEBY04/TO7UMYHKK3sSF8nFVPZI6kCcwFsfmc+NijAJocU6BA/DsdLkxjwIUubeBwgXzn2Pwx/s+PtVjEGId4lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMaReU2xOrFusRjYW95orJ/H2YFnXjOYTnHqah99/hs=;
 b=1WOTI54SWGas9Z2yTCeQ3xVxkKorioWWV/ubqMwqDZOKa3zhB/mDc3ZmNx8sZbDGC7JF6H78wdCZmeZimCXv/+BgLlu49ihVCohJkGdYguKKoxROutwJEv1d7WLpUnRYSP/AHqMy+qjwmlA844W7py3BuGDl3diSJ6FsKVxx38c=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1664.namprd12.prod.outlook.com (2603:10b6:301:b::15)
 by MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Thu, 17 Dec
 2020 00:20:06 +0000
Received: from MWHPR12MB1664.namprd12.prod.outlook.com
 ([fe80::1d8a:6f7b:1bb1:28bb]) by MWHPR12MB1664.namprd12.prod.outlook.com
 ([fe80::1d8a:6f7b:1bb1:28bb%4]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 00:20:05 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
 <a818be68-518c-754d-f63b-3754ce882fdc@gmail.com>
 <CAKMK7uEx631E1NB1=NYh7V2_+X=pK0WhA_sBwpxCGOhFaYw9wQ@mail.gmail.com>
 <e389b7d7-196c-ee03-ff94-ffd110c1013f@amd.com>
 <77cdb5bf-a418-bafd-2360-163e428c7394@amd.com>
 <CAKMK7uEgY4gYqowUZP0FZYHB7FNPCqApWojmSnuwhQ9WnY6hLA@mail.gmail.com>
 <8083b9f8-ee43-504f-0690-7add68472ca9@amd.com>
 <CAKMK7uGQtOgHxXQ_AK7f0unrwOnLQm3nb-VUJ_pW6vonRazu0Q@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <74140041-d838-87ce-5408-806d860cf9b3@amd.com>
Date: Wed, 16 Dec 2020 19:20:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <CAKMK7uGQtOgHxXQ_AK7f0unrwOnLQm3nb-VUJ_pW6vonRazu0Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:d8d8:8cb4:36f0:9435]
X-ClientProxiedBy: BN6PR1201CA0005.namprd12.prod.outlook.com
 (2603:10b6:405:4c::15) To MWHPR12MB1664.namprd12.prod.outlook.com
 (2603:10b6:301:b::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:d8d8:8cb4:36f0:9435]
 (2607:fea8:3edf:49b0:d8d8:8cb4:36f0:9435) by
 BN6PR1201CA0005.namprd12.prod.outlook.com (2603:10b6:405:4c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 17 Dec 2020 00:20:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 70d73099-d687-42b8-5109-08d8a2218147
X-MS-TrafficTypeDiagnostic: MWHPR12MB1663:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR12MB1663367B9DF7F479CEBAF65EEAC40@MWHPR12MB1663.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ierr9NRoEH573yTLsc5/bEJJ2QZqD1kiD/SgLanzJwstxF3AlLAUt+LYXpXOtBIaoEoxVA+XUhKrFjJbKdaqzUWMNTlASlQ1EDl0JYcl4ODDNpjw4lgs9wRaT/tG9Avmi7iRYHAtWphwAk6c2rbY5QBoc/qrxQxGOUBjua4tWypPQpwnL5e6zPQXlfdQwAdbIxzPMz+ShrnvBDB/k9iLIyUfw/rw3SSHKm/U9rgYezzDQU9wbdAlUjU+hOaz6lkqQsOg2kgDpEUJc9r1llaheVIfZlO5OKlH3G2OaklEn/5xdTisOzipUWeJUxPYrk/XKbUo2wBELSpCNGplHnY6uzgVCuI3Mk1WPlBM9CdF4WOKR1IFL8oejp9xsCxULAJmZWRg7khweXUz8dMReuQxMRAM+N9Bx4pcpTpTSGnlvWCpviBhDVkH3M8glzKg11S+T6HqesuI1oawEx9LwFQclvj1J+D//UFThXbz1ik51q4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1664.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(478600001)(966005)(4326008)(54906003)(36756003)(316002)(2616005)(45080400002)(52116002)(2906002)(66946007)(66556008)(8936002)(66574015)(8676002)(31696002)(66476007)(5660300002)(31686004)(6486002)(16526019)(6916009)(53546011)(186003)(86362001)(83380400001)(370214003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZjdMVmRaVTBCaWRLU2JxNk5BSkl3SWV2UnVQb1JOQndBamN2N3FZdWgrZ2V3?=
 =?utf-8?B?elkvTXdMSnhyZFJFRHF4bTlsaWdMMGd2MFM4QnFaVW13Z1JJL0xKblFKRCtk?=
 =?utf-8?B?ZVV2Q2ljM1JkREpBRnpWODlBeUhvV2wzQm5HTlBMUEYrMEttQXZrUGE4M1NE?=
 =?utf-8?B?S3VpbFZMZGhTdnVNZ25qTlhTVUxCQklMcmNMRDRkZTdvRHQ4ZXQyVHowN1R6?=
 =?utf-8?B?aitUODQwaXFkQ2hmL1NjZWVnZXVLUkZxRWNPMWlFSVh0dXFqYjZtYXBRd0E0?=
 =?utf-8?B?NHhCaFgyalhsSFRVcXNRMFpubGltQXRKM3pnajlnV0R3UVFDb2ZSY2N5LzBW?=
 =?utf-8?B?aDBMYmJVSmNTMG9TaTNtOTNPTVhKSWY0RWJXQVExVXJsOVZRN0xPdmg4aDAy?=
 =?utf-8?B?YU44UW1LKzlzR2gzTHJITVQyVlphSS8vTHdmYnlNaFlGNWVwcDJwcHJSQklo?=
 =?utf-8?B?UWx6dHhuVVBzUWlMS0dtbEVuZXZmdVJ3TVhzeVZDcGRUZzQxUWtIQmZxSGp3?=
 =?utf-8?B?TEpyM0kxVXBXcE1VYTRwa2lGbmxENnRGQWp3ejRDbFJGQTQ3aE9KZmlRcm5W?=
 =?utf-8?B?VFZyZGNpN1poN2Vra3p1TGJtc3JEOVU1eXE3Yk9hb0JtUENQc1d4Smh2MTkr?=
 =?utf-8?B?TU9mb25nNDdQOEdNNjIxbE1vOWN0ODlUWXU0UHZLNkJvU1BjVEhXVytJMHJL?=
 =?utf-8?B?V3NlYy9FNEZ1YlRwY0kycW90RmwyLzVWclFJelo5ZnZLU3VhNkd3QTdMZThU?=
 =?utf-8?B?QWFvcDNmb29HNW1HSjJqQzNPbmNzZTBWa2VMYUxlTWFGU2s1K1J4bGJreEZn?=
 =?utf-8?B?bnM2Tzd5WHhVWXRPNHkvZzV6ZTNGcy9VZ1ZVR29oSUtVTVVTMFFPQUc2cm04?=
 =?utf-8?B?cUNtcjBGbmQ5NDBORkp2ZW0zK2RUck5EUXZZOTVxQWN2TXBjZXdqcXJwSG5Q?=
 =?utf-8?B?MElwbjdZVDF3QnBlZFFiN1pUQWQzR1lxTElNSmVoOUdSY1QxTmkweG5vQ0cx?=
 =?utf-8?B?VVdtT0xtWHBKK1ViWlJpUDNHbDdGaVdWYkpEWDFsTWlTTU1jOXE2dUI1WVht?=
 =?utf-8?B?ano5dGdYdWdrdEU2ODJscno5VkVHUEREckpwT3huQTU2RGw5aEIxdmhsbzVk?=
 =?utf-8?B?NWgzTmZydy9ZWGJiQXVOd0RWVGNrVlJEdi92NFhzU0wrVnl5OW1IbHAvRU1W?=
 =?utf-8?B?V1NVaStIWUozSnVSb2MrU3IxejlvNGM1UDBhejRxMFlhVVExNkxSNm5MV2l1?=
 =?utf-8?B?aU96dlh0QXd4SEdOVldndkdVbC9IOHFEK01GL25QS2lJV3Y2QnBZRGJpSUVy?=
 =?utf-8?B?dkFtNnp4K0lrSFMrc0YvdGRmV2RwVW1FOExSZHFtd2JxZXVQOThoUkt6WlRj?=
 =?utf-8?B?aXBhdG5BbStDUEFmQnRmZHhrZTd3NjF3dkE2RnNwU2cxaFhONkErd0Z4Sk11?=
 =?utf-8?Q?C4G8afi9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1664.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 00:20:05.7551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 70d73099-d687-42b8-5109-08d8a2218147
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLrWYo/b8E4jdRZsjdV0RMP5+VS52RUfNZ42iZ5NO8zQrhXxFcpTTkQRDIEC10146UXQxo73Pf+UY1KI30A5vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1663
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzE2LzIwIDY6MTUgUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gV2VkLCBEZWMg
MTYsIDIwMjAgYXQgNzoyNiBQTSBBbmRyZXkgR3JvZHpvdnNreQo+IDxBbmRyZXkuR3JvZHpvdnNr
eUBhbWQuY29tPiB3cm90ZToKPj4KPj4gT24gMTIvMTYvMjAgMTI6MTIgUE0sIERhbmllbCBWZXR0
ZXIgd3JvdGU6Cj4+PiBPbiBXZWQsIERlYyAxNiwgMjAyMCBhdCA1OjE4IFBNIENocmlzdGlhbiBL
w7ZuaWcKPj4+IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Pj4+IEFtIDE2LjEy
LjIwIHVtIDE3OjEzIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+IE9uIDEyLzE2LzIw
IDk6MjEgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+PiBPbiBXZWQsIERlYyAxNiwgMjAy
MCBhdCA5OjA0IEFNIENocmlzdGlhbiBLw7ZuaWcKPj4+Pj4+IDxja29lbmlnLmxlaWNodHp1bWVy
a2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4gQW0gMTUuMTIuMjAgdW0gMjE6MTggc2Nocmll
YiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Pj4gW1NOSVBdCj4+Pj4+Pj4+Pj4gV2hpbGUgd2Ug
Y2FuJ3QgY29udHJvbCB1c2VyIGFwcGxpY2F0aW9uIGFjY2Vzc2VzIHRvIHRoZSBtYXBwZWQKPj4+
Pj4+Pj4+PiBidWZmZXJzIGV4cGxpY2l0bHkgYW5kIGhlbmNlIHdlIHVzZSBwYWdlIGZhdWx0IHJl
cm91dGluZwo+Pj4+Pj4+Pj4+IEkgYW0gdGhpbmtpbmcgdGhhdCBpbiB0aGlzICBjYXNlIHdlIG1h
eSBiZSBhYmxlIHRvIHNwcmlua2xlCj4+Pj4+Pj4+Pj4gZHJtX2Rldl9lbnRlci9leGl0IGluIGFu
eSBzdWNoIHNlbnNpdGl2ZSBwbGFjZSB3ZXJlIHdlIG1pZ2h0Cj4+Pj4+Pj4+Pj4gQ1BVIGFjY2Vz
cyBhIERNQSBidWZmZXIgZnJvbSB0aGUga2VybmVsID8KPj4+Pj4+Pj4+IFllcywgSSBmZWFyIHdl
IGFyZSBnb2luZyB0byBuZWVkIHRoYXQuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFRoaW5ncyBsaWtl
IENQVSBwYWdlIHRhYmxlIHVwZGF0ZXMsIHJpbmcgYnVmZmVyIGFjY2Vzc2VzIGFuZCBGVwo+Pj4+
Pj4+Pj4+IG1lbWNweSA/IElzIHRoZXJlIG90aGVyIHBsYWNlcyA/Cj4+Pj4+Pj4+PiBQdWgsIGdv
b2QgcXVlc3Rpb24uIEkgaGF2ZSBubyBpZGVhLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBBbm90aGVy
IHBvaW50IGlzIHRoYXQgYXQgdGhpcyBwb2ludCB0aGUgZHJpdmVyIHNob3VsZG4ndCBhY2Nlc3Mg
YW55Cj4+Pj4+Pj4+Pj4gc3VjaCBidWZmZXJzIGFzIHdlIGFyZSBhdCB0aGUgcHJvY2VzcyBmaW5p
c2hpbmcgdGhlIGRldmljZS4KPj4+Pj4+Pj4+PiBBRkFJSyB0aGVyZSBpcyBubyBwYWdlIGZhdWx0
IG1lY2hhbmlzbSBmb3Iga2VybmVsIG1hcHBpbmdzIHNvIEkKPj4+Pj4+Pj4+PiBkb24ndCB0aGlu
ayB0aGVyZSBpcyBhbnl0aGluZyBlbHNlIHRvIGRvID8KPj4+Pj4+Pj4+IFdlbGwgdGhlcmUgaXMg
YSBwYWdlIGZhdWx0IGhhbmRsZXIgZm9yIGtlcm5lbCBtYXBwaW5ncywgYnV0IHRoYXQgb25lCj4+
Pj4+Pj4+PiBqdXN0IHByaW50cyB0aGUgc3RhY2sgdHJhY2UgaW50byB0aGUgc3lzdGVtIGxvZyBh
bmQgY2FsbHMgQlVHKCk7IDopCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gTG9uZyBzdG9yeSBzaG9ydCB3
ZSBuZWVkIHRvIGF2b2lkIGFueSBhY2Nlc3MgdG8gcmVsZWFzZWQgcGFnZXMgYWZ0ZXIKPj4+Pj4+
Pj4+IHVucGx1Zy4gTm8gbWF0dGVyIGlmIGl0J3MgZnJvbSB0aGUga2VybmVsIG9yIHVzZXJzcGFj
ZS4KPj4+Pj4+Pj4gSSB3YXMganVzdCBhYm91dCB0byBzdGFydCBndWFyZGluZyB3aXRoIGRybV9k
ZXZfZW50ZXIvZXhpdCBDUFUKPj4+Pj4+Pj4gYWNjZXNzZXMgZnJvbSBrZXJuZWwgdG8gR1RUIG90
IFZSQU0gYnVmZmVycyBidXQgdGhlbiBpIGxvb2tlZCBtb3JlIGluCj4+Pj4+Pj4+IHRoZSBjb2Rl
Cj4+Pj4+Pj4+IGFuZCBzZWVtcyBsaWtlIHR0bV90dF91bnBvcHVsYXRlIGp1c3QgZGVsZXRlcyBE
TUEgbWFwcGluZ3MgKGZvciB0aGUKPj4+Pj4+Pj4gc2FrZSBvZiBkZXZpY2UgdG8gbWFpbiBtZW1v
cnkgYWNjZXNzKS4gS2VybmVsIHBhZ2UgdGFibGUgaXMgbm90Cj4+Pj4+Pj4+IHRvdWNoZWQKPj4+
Pj4+Pj4gdW50aWwgbGFzdCBibyByZWZjb3VudCBpcyBkcm9wcGVkIGFuZCB0aGUgYm8gaXMgcmVs
ZWFzZWQKPj4+Pj4+Pj4gKHR0bV9ib19yZWxlYXNlLT5kZXN0cm95LT5hbWRncHVfYm9fZGVzdHJv
eS0+YW1kZ3B1X2JvX2t1bm1hcCkuIFRoaXMKPj4+Pj4+Pj4gaXMgYm90aAo+Pj4+Pj4+PiBmb3Ig
R1RUIEJPcyBtYXBlZCB0byBrZXJuZWwgYnkga21hcCAob3Igdm1hcCkgYW5kIGZvciBWUkFNIEJP
cyBtYXBwZWQKPj4+Pj4+Pj4gYnkgaW9yZW1hcC4gU28gYXMgaSBzZWUgaXQsIG5vdGhpbmcgd2ls
bCBiYWQgd2lsbCBoYXBwZW4gYWZ0ZXIgd2UKPj4+Pj4+Pj4gdW5wb3B1bGF0ZSBhIEJPIHdoaWxl
IHdlIHN0aWxsIHRyeSB0byB1c2UgYSBrZXJuZWwgbWFwcGluZyBmb3IgaXQsCj4+Pj4+Pj4+IHN5
c3RlbSBtZW1vcnkgcGFnZXMgYmFja2luZyBHVFQgQk9zIGFyZSBzdGlsbCBtYXBwZWQgYW5kIG5v
dCBmcmVlZCBhbmQKPj4+Pj4+Pj4gZm9yCj4+Pj4+Pj4+IFZSQU0gQk9zIHNhbWUgaXMgZm9yIHRo
ZSBJTyBwaHlzaWNhbCByYW5nZXMgbWFwcGVkIGludG8gdGhlIGtlcm5lbAo+Pj4+Pj4+PiBwYWdl
IHRhYmxlIHNpbmNlIGlvdW5tYXAgd2Fzbid0IGNhbGxlZCB5ZXQuCj4+Pj4+Pj4gVGhlIHByb2Js
ZW0gaXMgdGhlIHN5c3RlbSBwYWdlcyB3b3VsZCBiZSBmcmVlZCBhbmQgaWYgd2Uga2VybmVsIGRy
aXZlcgo+Pj4+Pj4+IHN0aWxsIGhhcHBpbHkgd3JpdGUgdG8gdGhlbSB3ZSBhcmUgcHJldHR5IG11
Y2ggYnVzdGVkIGJlY2F1c2Ugd2Ugd3JpdGUKPj4+Pj4+PiB0byBmcmVlZCB1cCBtZW1vcnkuCj4+
Pj4+IE9LLCBpIHNlZSBpIG1pc3NlZCB0dG1fdHRfdW5wb3B1bGF0ZS0+Li4tPnR0bV9wb29sX2Zy
ZWUgd2hpY2ggd2lsbAo+Pj4+PiByZWxlYXNlCj4+Pj4+IHRoZSBHVFQgQk8gcGFnZXMuIEJ1dCB0
aGVuIGlzbid0IHRoZXJlIGEgcHJvYmxlbSBpbiB0dG1fYm9fcmVsZWFzZSBzaW5jZQo+Pj4+PiB0
dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZSB3aGljaCBhbHNvIGxlYWRzIHRvIHBhZ2VzIHJlbGVh
c2UgY29tZXMKPj4+Pj4gYmVmb3JlIGJvLT5kZXN0cm95IHdoaWNoIHVubWFwcyB0aGUgcGFnZXMg
ZnJvbSBrZXJuZWwgcGFnZSB0YWJsZSA/IFdvbid0Cj4+Pj4+IHdlIGhhdmUgZW5kIHVwIHdyaXRp
bmcgdG8gZnJlZWQgbWVtb3J5IGluIHRoaXMgdGltZSBpbnRlcnZhbCA/IERvbid0IHdlCj4+Pj4+
IG5lZWQgdG8gcG9zdHBvbmUgcGFnZXMgZnJlZWluZyB0byBhZnRlciBrZXJuZWwgcGFnZSB0YWJs
ZSB1bm1hcHBpbmcgPwo+Pj4+IEJPcyBhcmUgb25seSBkZXN0cm95ZWQgd2hlbiB0aGVyZSBpcyBh
IGd1YXJhbnRlZSB0aGF0IG5vYm9keSBpcwo+Pj4+IGFjY2Vzc2luZyB0aGVtIGFueSBtb3JlLgo+
Pj4+Cj4+Pj4gVGhlIHByb2JsZW0gaGVyZSBpcyB0aGF0IHRoZSBwYWdlcyBhcyB3ZWxsIGFzIHRo
ZSBWUkFNIGNhbiBiZQo+Pj4+IGltbWVkaWF0ZWx5IHJldXNlZCBhZnRlciB0aGUgaG90cGx1ZyBl
dmVudC4KPj4+Pgo+Pj4+Pj4gU2ltaWxhciBmb3IgdnJhbSwgaWYgdGhpcyBpcyBhY3R1YWwgaG90
dW5wbHVnIGFuZCB0aGVuIHJlcGx1ZywgdGhlcmUncwo+Pj4+Pj4gZ29pbmcgdG8gYmUgYSBkaWZm
ZXJlbnQgZGV2aWNlIGJlaGluZCB0aGUgc2FtZSBtbWlvIGJhciByYW5nZSBtb3N0Cj4+Pj4+PiBs
aWtlbHkgKHRoZSBoaWdoZXIgYnJpZGdlcyBhbGwgdGhpcyBoYXZlIHRoZSBzYW1lIHdpbmRvd3Mg
YXNzaWduZWQpLAo+Pj4+PiBObyBpZGVhIGhvdyB0aGlzIGFjdHVhbGx5IHdvcmtzIGJ1dCBpZiB3
ZSBoYXZlbid0IGNhbGxlZCBpb3VubWFwIHlldAo+Pj4+PiBkb2Vzbid0IGl0IG1lYW4gdGhhdCB0
aG9zZSBwaHlzaWNhbCByYW5nZXMgdGhhdCBhcmUgc3RpbGwgbWFwcGVkIGludG8KPj4+Pj4gcGFn
ZQo+Pj4+PiB0YWJsZSBzaG91bGQgYmUgcmVzZXJ2ZWQgYW5kIGNhbm5vdCBiZSByZXVzZWQgZm9y
IGFub3RoZXIKPj4+Pj4gZGV2aWNlID8gQXMgYSBndWVzcywgbWF5YmUgYW5vdGhlciBzdWJyYW5n
ZSBmcm9tIHRoZSBoaWdoZXIgYnJpZGdlJ3MKPj4+Pj4gdG90YWwKPj4+Pj4gcmFuZ2Ugd2lsbCBi
ZSBhbGxvY2F0ZWQuCj4+Pj4gTm9wZSwgdGhlIFBDSWUgc3Vic3lzdGVtIGRvZXNuJ3QgY2FyZSBh
Ym91dCBhbnkgaW9yZW1hcCBzdGlsbCBhY3RpdmUgZm9yCj4+Pj4gYSByYW5nZSB3aGVuIGl0IGlz
IGhvdHBsdWdnZWQuCj4+Pj4KPj4+Pj4+IGFuZCB0aGF0J3MgYmFkIG5ld3MgaWYgd2Uga2VlcCB1
c2luZyBpdCBmb3IgY3VycmVudCBkcml2ZXJzLiBTbyB3ZQo+Pj4+Pj4gcmVhbGx5IGhhdmUgdG8g
cG9pbnQgYWxsIHRoZXNlIGNwdSBwdGVzIHRvIHNvbWUgb3RoZXIgcGxhY2UuCj4+Pj4+IFdlIGNh
bid0IGp1c3QgdW5tYXAgaXQgd2l0aG91dCBzeW5jaW5nIGFnYWluc3QgYW55IGluIGtlcm5lbCBh
Y2Nlc3Nlcwo+Pj4+PiB0byB0aG9zZSBidWZmZXJzCj4+Pj4+IGFuZCBzaW5jZSBwYWdlIGZhdWx0
aW5nIHRlY2huaXF1ZSB3ZSB1c2UgZm9yIHVzZXIgbWFwcGVkIGJ1ZmZlcnMgc2VlbXMKPj4+Pj4g
dG8gbm90IGJlIHBvc3NpYmxlCj4+Pj4+IGZvciBrZXJuZWwgbWFwcGVkIGJ1ZmZlcnMgSSBhbSBu
b3Qgc3VyZSBob3cgdG8gZG8gaXQgZ3JhY2VmdWxseS4uLgo+Pj4+IFdlIGNvdWxkIHRyeSB0byBy
ZXBsYWNlIHRoZSBrbWFwIHdpdGggYSBkdW1teSBwYWdlIHVuZGVyIHRoZSBob29kLCBidXQKPj4+
PiB0aGF0IGlzIGV4dHJlbWVseSB0cmlja3kuCj4+Pj4KPj4+PiBFc3BlY2lhbGx5IHNpbmNlIEJP
cyB3aGljaCBhcmUganVzdCAxIHBhZ2UgaW4gc2l6ZSBjb3VsZCBwb2ludCB0byB0aGUKPj4+PiBs
aW5lYXIgbWFwcGluZyBkaXJlY3RseS4KPj4+IEkgdGhpbmsgaXQncyBqdXN0IG1vcmUgd29yay4g
RXNzZW50aWFsbHkKPj4+IC0gY29udmVydCBhcyBtdWNoIGFzIHBvc3NpYmxlIG9mIHRoZSBrZXJu
ZWwgbWFwcGluZ3MgdG8gdm1hcF9sb2NhbCwKPj4+IHdoaWNoIFRob21hcyBaaW1tZXJtYW5uIGlz
IHJvbGxpbmcgb3V0LiBUaGF0IHdheSBhIGRtYV9yZXN2X2xvY2sgd2lsbAo+Pj4gc2VydmUgYXMg
YSBiYXJyaWVyLCBhbmQgb2ZjIGFueSBuZXcgdm1hcCBuZWVkcyB0byBmYWlsIG9yIGhhbmQgb3V0
IGEKPj4+IGR1bW15IG1hcHBpbmcuCj4+IFJlYWQgdGhvc2UgcGF0Y2hlcy4gSSBhbSBub3Qgc3Vy
ZSBob3cgdGhpcyBoZWxwcyB3aXRoIHByb3RlY3RpbmcKPj4gYWdhaW5zdCBhY2Nlc3NlcyB0byBy
ZWxlYXNlZCBiYWNraW5nIHBhZ2VzIG9yIElPIHBoeXNpY2FsIHJhbmdlcyBvZiBCTwo+PiB3aGlj
aCBpcyBhbHJlYWR5IG1hcHBlZCBkdXJpbmcgdGhlIHVucGx1ZyBldmVudCA/Cj4gQnkgZWxpbWlu
YXRpbmcgc3VjaCB1c2VycywgYW5kIHJlcGxhY2luZyB0aGVtIHdpdGggbG9jYWwgbWFwcyB3aGlj
aAo+IGFyZSBzdHJpY3RseSBib3VuZCBpbiBob3cgbG9uZyB0aGV5IGNhbiBleGlzdCAoYW5kIGhl
bmNlIHdlIGNhbgo+IHNlcmlhbGl6ZSBhZ2FpbnN0IHRoZW0gZmluaXNoaW5nIGluIG91ciBob3R1
bnBsdWcgY29kZSkuCgpOb3Qgc3VyZSBJIHNlZSBob3cgc2VyaWFsaXppbmcgYWdhaW5zdCBCTyBt
YXAvdW5tYXAgaGVscHMgLcKgIG91ciBwcm9ibGVtIGFzIHlvdSAKZGVzY3JpYmVkIGlzIHRoYXQg
b25jZQpkZXZpY2UgaXMgZXh0cmFjdGVkIGFuZCB0aGVuIHNvbWV0aGluZyBlbHNlIHF1aWNrbHkg
dGFrZXMgaXQncyBwbGFjZSBpbiB0aGUgUENJIAp0b3BvbG9neQphbmQgZ2V0cyBhc3NpZ25lZCBz
YW1lIHBoeXNpY2FsIElPIHJhbmdlcywgdGhlbiBvdXIgZHJpdmVyIHdpbGwgc3RhcnQgYWNjZXNz
aW5nIHRoaXMKbmV3IGRldmljZSBiZWNhdXNlIG91ciAnem9tYmllJyBCT3MgYXJlIHN0aWxsIHBv
aW50aW5nIHRvIHRob3NlIHJhbmdlcy4KCkFub3RoZXIgcG9pbnQgcmVnYXJkaW5nIHNlcmlhbGl6
aW5nIC0gcHJvYmxlbcKgIGlzIHRoYXQgc29tZSBvZiB0aG9zZSBCT3MgYXJlIAp2ZXJ5IGxvbmcg
bGl2ZWQsIHRha2UgZm9yIGV4YW1wbGUgdGhlIEhXIGNvbW1hbmQKcmluZyBidWZmZXIgQ2hyaXN0
aWFuIG1lbnRpb25lZCBiZWZvcmUgLSAKKGFtZGdwdV9yaW5nX2luaXQtPmFtZGdwdV9ib19jcmVh
dGVfa2VybmVsKSwgaXQncyBsaWZlIHNwYW4KaXMgYmFzaWNhbGx5IGZvciB0aGUgZW50aXJlIHRp
bWUgdGhlIGRldmljZSBleGlzdHMsIGl0J3MgZGVzdHJveWVkIG9ubHkgaW4gdGhlIApTVyBmaW5p
IHN0YWdlICh3aGVuIGxhc3QgZHJtX2RldgpyZWZlcmVuY2UgaXMgZHJvcHBlZCkgYW5kIHNvIHNo
b3VsZCBJIGdyYWIgaXQncyBkbWFfcmVzdl9sb2NrIGZyb20gCmFtZGdwdV9wY2lfcmVtb3ZlIGNv
ZGUgYW5kIHdhaXQKZm9yIGl0IHRvIGJlIHVubWFwcGVkIGJlZm9yZSBwcm9jZWVkaW5nIHdpdGgg
dGhlIFBDSSByZW1vdmUgY29kZSA/IFRoaXMgY2FuIHRha2UgCnVuYm91bmQgdGltZSBhbmQgdGhh
dCB3aHkgSSBkb24ndCB1bmRlcnN0YW5kCmhvdyBzZXJpYWxpemluZyB3aWxsIGhlbHAuCgpBbmRy
ZXkKCgo+IEl0IGRvZXNuJ3QKPiBzb2x2ZSBhbGwgeW91ciBwcm9ibGVtcywgYnV0IGl0J3MgYSB0
b29sIHRvIGdldCB0aGVyZS4KPiAtRGFuaWVsCj4KPj4gQW5kcmV5Cj4+Cj4+Cj4+PiAtIGhhbmRs
ZSBmYmNvbiBzb21laG93LiBJIHRoaW5rIHNodXR0aW5nIGl0IGFsbCBkb3duIHNob3VsZCB3b3Jr
IG91dC4KPj4+IC0gd29yc3QgY2FzZSBrZWVwIHRoZSBzeXN0ZW0gYmFja2luZyBzdG9yYWdlIGFy
b3VuZCBmb3Igc2hhcmVkIGRtYS1idWYKPj4+IHVudGlsIHRoZSBvdGhlciBub24tZHluYW1pYyBk
cml2ZXIgcmVsZWFzZXMgaXQuIGZvciB2cmFtIHdlIHJlcXVpcmUKPj4+IGR5bmFtaWMgaW1wb3J0
ZXJzIChhbmQgbWF5YmUgaXQgd2Fzbid0IHN1Y2ggYSBicmlnaHQgaWRlYSB0byBhbGxvdwo+Pj4g
cGlubmluZyBvZiBpbXBvcnRlciBidWZmZXJzLCBtaWdodCBuZWVkIHRvIHJldmlzaXQgdGhhdCku
Cj4+Pgo+Pj4gQ2hlZXJzLCBEYW5pZWwKPj4+Cj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4+IEFu
ZHJleQo+Pj4+Pgo+Pj4+Pgo+Pj4+Pj4gLURhbmllbAo+Pj4+Pj4KPj4+Pj4+PiBDaHJpc3RpYW4u
Cj4+Pj4+Pj4KPj4+Pj4+Pj4gSSBsb2FkZWQgdGhlIGRyaXZlciB3aXRoIHZtX3VwZGF0ZV9tb2Rl
PTMKPj4+Pj4+Pj4gbWVhbmluZyBhbGwgVk0gdXBkYXRlcyBkb25lIHVzaW5nIENQVSBhbmQgaGFz
bid0IHNlZW4gYW55IE9PUHMgYWZ0ZXIKPj4+Pj4+Pj4gcmVtb3ZpbmcgdGhlIGRldmljZS4gSSBn
dWVzcyBpIGNhbiB0ZXN0IGl0IG1vcmUgYnkgYWxsb2NhdGluZyBHVFQgYW5kCj4+Pj4+Pj4+IFZS
QU0gQk9zCj4+Pj4+Pj4+IGFuZCB0cnlpbmcgdG8gcmVhZC93cml0ZSB0byB0aGVtIGFmdGVyIGRl
dmljZSBpcyByZW1vdmVkLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBBbmRyZXkKPj4+Pj4+Pj4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4+IFJlZ2FyZHMsCj4+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4+IEFuZHJleQo+Pj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+Pj4+Pj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+Pj4+Pj4+PiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+Pj4+PiBodHRwczovL25hbTExLnNhZmVsaW5r
cy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVz
a3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTA0JTdDMDEl
N0NBbmRyZXkuR3JvZHpvdnNreSU0MGFtZC5jb20lN0M1ODQ5ODI3Njk4ZDE0MjgwNjVkNDA4ZDhh
MjE4ODUxOCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0
Mzc1NzM0ODYxMjk1ODklN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01E
QWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZh
bXA7c2RhdGE9dWFoczNSZ1F4THBVSjloQ3pFOHB2SzlVV0ZDcHlJejFpNE1OS2lrbDB0WSUzRCZh
bXA7cmVzZXJ2ZWQ9MAo+Pj4+Pj4+Pgo+Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
