Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 688BE2DE134
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 11:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9016E087;
	Fri, 18 Dec 2020 10:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0C6E6E087
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 10:41:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+dJckr52uaYN1lpvdv0ZS3Yq6sUEseGXUK4gPTlwM/Axgu6AiJMqYerldwoBo35PQ4FpDbZl1vZUJKdnmdJ/QRlhdocRxhS2KOGIMa6C74sobN6Zv85c3F0jHTJkrRHD8Ef13AOHau8Q46PVFj9XN/CcM44vxsEjDWvgjLcnMA/p8eyjJTLIqPrS5vEJZDr24QaONV98/Dewi186iL7zPVCqCZN5yZVbeCyqQ9pmPhC2EWWUNzuFyJ7OwLHfaDPmj/ElziR4KpGTwfSW+9ZnSAUg0AlP8MBWRfBrDFEkqI06oxw78zl85mU2I/CrqCHNFA9kej6XtiqVXKoUd4+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnLOiHY0VPNKMutUGeh7lXkbXbg6W32KBAwIL+E/AK0=;
 b=MEFjOQMLNFuM534ovx8wJOdzXrPcETp1GLeZhJEW8dmeZI2F5OM2alIW59In3nXrDUzLRdlvv2tc56HlP9tkDyqVMVt3hDkZkvhfrQ6F1SAzSKTwqlroidlEaLKGTEBNYeWhxuZDKBRD214aW0Ynz5RjF+LqWDoPyCF5pP2CDbgDtUPYYkozQran9v7nMtsxP2PbILeTVRuAz6tYCAvLP0kh5dCAVh1aFjX9vhRaeoggLvF6jXKr3uJ7aruai5Yyvr3wdlWN037fr60VQ61Dd9VNQnXB5yEHV6g1riKFrKgchd91xokHOkNjK81UQUDsLahYuaKFmxun+/XUXkl2og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vnLOiHY0VPNKMutUGeh7lXkbXbg6W32KBAwIL+E/AK0=;
 b=i+cANSAqMj6+AZQDFy/kEIrQnVs19DRphipNUmWjR4OxqhS1bRzEKbbGj8HVQMgg5NaMn+8Tsp6Y/0x2kSqGJH1NH6+SCsi1BAqvi1S+x6nqf7D1+Pd6gMjLWMayGxVqWp55EbcmAVMY0o20dZHyn6V1ayYG/PI1sMCF5BBqI18=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.18; Fri, 18 Dec
 2020 10:41:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Fri, 18 Dec 2020
 10:41:52 +0000
Subject: Re: [PATCH] drm/[amdgpu|radeon]: fix memset on io mem
To: Chen Li <chenli@uniontech.com>
References: <877dpiz4sf.wl-chenli@uniontech.com>
 <4277816d-db00-7e81-a2fb-069aeee18e8b@amd.com>
 <875z51zwsq.wl-chenli@uniontech.com>
 <90b625e2-2409-d13b-2456-483ad4eef18f@amd.com>
 <873605z1du.wl-chenli@uniontech.com>
 <7920fd29-3f95-2109-07ee-15659e80dc40@amd.com>
 <877dpgimec.wl-chenli@uniontech.com>
 <b21a574d-ca11-c139-eaae-61a75cc4278b@amd.com>
 <87y2hvydox.wl-chenli@uniontech.com>
 <0a449ae3-c55b-e1da-836c-3192eea5cb92@amd.com>
 <87v9czxzr6.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c8edb5ab-a668-db01-b357-cda0be046c9e@amd.com>
Date: Fri, 18 Dec 2020 11:41:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <87v9czxzr6.wl-chenli@uniontech.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0059.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::39) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0059.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 18 Dec 2020 10:41:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3a08aa67-2db0-4cf3-d674-08d8a3418823
X-MS-TrafficTypeDiagnostic: MN2PR12MB4112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41122A6579F3D5759269E23B83C30@MN2PR12MB4112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: miXsS7Ggwg/z5acATkd2P9VHBxWcTHrzoXmZez3bcFwymi+J9sLd5MNDCk4K1I3sMfL9k1v1ixsLapen8qRODCvi/R1x71m5Z57kkthuZ//jdksFKAJFULQqFoINeTKa2qxkBsK0E8P312n6/P/S+O8Qk2b4HarMgRv1r1YW6oZhDP0F5LuMFCM4fb93VTXojMyvr4JK0mHZeb6S5HuFH/XEMCkqOLFgZNlGvEl+4SP386HLsj6km3RycYvFd80+hlVQg7WyNVJodbQdT7ItewzvsjUttkc7DD8g3bfr0SFSBYLHk0ckzajOWyh0zGtkU9kLrHwgbLrmqBpV2uKYBExD1RCUpcvDGbG4SyrDmQ8IVGLdGQaAIpbYC0zL5uJ6/S43O429RtoItVa19ZYAMBMVMWPXoiimF8yWjvIpIXI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(4326008)(66476007)(2906002)(478600001)(86362001)(31696002)(5660300002)(8936002)(66556008)(52116002)(6666004)(66946007)(316002)(6916009)(16526019)(186003)(2616005)(36756003)(6486002)(31686004)(8676002)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bmM2eGxLU0pxYWxZbE1mbjhsalNVY1A1OVlvcnJucVh5cDRxeVdXOHNOWHRt?=
 =?utf-8?B?VVNIbithZjIvTTFPOExOMk9kZDB4eFhEczNFTTJzYzdCVG9GLzNmcWJjaFpm?=
 =?utf-8?B?b1ZNRVpuZWwyMVpvWWVSbDIyTVRMSGNtU1NKWEFmN3M3NERzdzdkOTd2OW9E?=
 =?utf-8?B?Q1lqM0RVY2lJeTllanpJTm1sWEYyQ2xEVHY2TlBTTlRnd1ZzUEJhTmRsUG1I?=
 =?utf-8?B?amtUcnhWYkVmTUhjZWVKam5nQVlGWFFXajROcTZPQzdEcis0TUVvYUh3S3NJ?=
 =?utf-8?B?VkZ5cHlEczAwUldrTml0S3JXNFFZNEdMZ2o3NGVMN3g1S2JPcFRQTEdqM1lW?=
 =?utf-8?B?NW04aUlDZEpwbWJZRXUzYk0yM202d2JOWDBmZlpZcmlhRmJWbTljTkphc3Mw?=
 =?utf-8?B?T3V0U3lrTEhGeENnVGJ6ckNRaDJMNVl2VXhzZmFPZDRXajZBK2V1RndJMzhI?=
 =?utf-8?B?NURveUFCNTNCTFA4dzdDZnk5K3dEdzJIV3hhMFhXWDFIZFZHajd6RzFMV1FC?=
 =?utf-8?B?YTFtWHZMTXpGUklPYXFMeFFxWWdGbFpJRVFvWVI3VjhJQ1gzTEdpa3BOR1kv?=
 =?utf-8?B?UEpnSzljTndXZWlSVVRmQW93SDBKallYZmRCZjhmY05nNlFKZTM5bU1GSlR1?=
 =?utf-8?B?UUZaU1FmSndNcEtuVElnckJNWUhrNVBRVHBqY0xIdXczSys2dlgvRUVqMGFk?=
 =?utf-8?B?YlRjRGx0eUdGbzRqcXczMFN0VDdqWFdPL0Q2UmtiQnVpYWFuemxCVC9KMUc0?=
 =?utf-8?B?K2dSdzVsd0VuZ1RFUHgxNWZNM3dOZkx1NVArc0JpbzNpSDZmZHljWFZyZzVT?=
 =?utf-8?B?cUcwazhKWHNTeUMwajNFYldMeDQ0K2RDWHBRUnM5cEhRdnhZQ05Zd1Z2OUNU?=
 =?utf-8?B?VzlWaWp3ckdCRFQwNFArcWJianljdkZHczlsZHMwTG1rbVF6QUJ4a0swYmtW?=
 =?utf-8?B?SWE3U2FWam82ZFpyc1VxYzJ2RFh5R29vZFdRMzVQSnAvN1dqNWsxcHJEQ1Iz?=
 =?utf-8?B?WEJMNVhkTmsxeFE2dEEzVkZLaHRSOXBSZ0czbFhaVWpIeElvSmZVcWp0NU5l?=
 =?utf-8?B?cTdFblNZSjhaQzdzcHFpSFpTNWxWZGxzblB3N2w3QThpWW5ucEt1OGZGd1po?=
 =?utf-8?B?ZVR3dGdWTjFoaFRSTXphVVBJSnFwMS9PWlMrT2RMOWFreWZXaG9BUXRLNnBp?=
 =?utf-8?B?dGVHa3NwVzl6RkFaWlZhcW9WTHptaW1yN1hHOEVKaEkvb0pjTERLbWJzcTdU?=
 =?utf-8?B?dVhNMHAxSmhSUmdnZTNxQkRoNEFmMDd2UWRqSExPcXF1bXNubDZWelMxSU5m?=
 =?utf-8?B?bi9CNlBqTnRlWkZVdisybFd4OFh3QUt0bG12QTJqNWh5UDNKWHZ4TUU3bDNm?=
 =?utf-8?B?aFZnMlJlYkNGdlp3YWFqSWRoLy9oQU4yZm5oZ2tpM251SnY0UXIwalpCWGpz?=
 =?utf-8?Q?mWP45EdV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 10:41:52.4117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a08aa67-2db0-4cf3-d674-08d8a3418823
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O6saqFFp1sZjf20Kcmv8ayx1sNzGGibnU/8mTyCkDCDTfatkpeWncMp7A5Xa9F83
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMTIuMjAgdW0gMDk6NTIgc2NocmllYiBDaGVuIExpOgo+IE9uIEZyaSwgMTggRGVjIDIw
MjAgMTY6MTA6MTIgKzA4MDAsCj4gQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTguMTIu
MjAgdW0gMDQ6NTEgc2NocmllYiBDaGVuIExpOgo+Pj4gW1NOSVBdCj4+Pj4+PiBJZiB5b3VyIEFS
TSBiYXNlIGJvYXJkIGNhbid0IGRvIHRoYXQgZm9yIHNvbWUgdGhlbiB5b3UgY2FuJ3QgdXNlIHRo
ZSBoYXJkd2FyZQo+Pj4+Pj4gd2l0aCB0aGF0IGJvYXJkLgo+Pj4+PiBHb29kIHRvIGtub3csIHRo
YW5rcyEgQlRXLCBoYXZlIHlvdSBldmVyIHNlZW4gb3IgaGVhcmQgYm9hcmRzIGxpa2UgbWluZSB3
aGljaCBjYW5ub3QgbW1hcCBkZXZpY2UgbWVtb3J5IGNvcnJlY3RseSBmcm9tIHVzZXJzcGFjZSBj
b3JyZWN0bHk/Cj4+Pj4gVW5mb3J0dW5hdGVseSB5ZXMuIFdlIGhhdmVuJ3QgYmVlbiBhYmxlIHRv
IGZpZ3VyZSBvdXQgd2hhdCBleGFjdGx5IGdvZXMgd3JvbmcgaW4KPj4+PiB0aG9zZSBjYXNlcy4K
Pj4+IE9rLiBvbmUgbW9yZSBxdWVzdGlvbjogb25seSBlODg2MCBvciBhbGwgcmFkZW9uIGNhcmRz
IGhhdmUgdGhpcyBpc3N1ZT8KPj4gVGhpcyBhcHBsaWVzIHRvIGFsbCBoYXJkd2FyZSB3aXRoIGRl
ZGljYXRlZCBtZW1vcnkgd2hpY2ggbmVlZHMgdG8gYmUgbWFwcGVkIHRvCj4+IHVzZXJzcGFjZS4K
Pj4KPj4gVGhhdCBpbmNsdWRlcyBhbGwgZ3JhcGhpY3MgaGFyZHdhcmUgZnJvbSBBTUQgYXMgd2Vs
bCBhcyBOVmlkaWEgYW5kIHByb2JhYmx5IGEKPj4gd2hvbGUgYnVuY2ggb2Ygb3RoZXIgUENJZSBk
ZXZpY2VzLgo+IENhbiBtbWlvIG9uIHRoZXNlIGRldmljZXMgd29yayBmaW5lIGluIGtlcm5lbCBz
cGFjZT8KClRoZSBrZXJuZWwgZHJpdmVycyBrbm93IHRoYXQgdGhpcyBpcyBNTUlPIGFuZCBjYW4g
dXNlIHNwZWNpYWwgCmluc3RydWN0aW9ucy9mdW5jdGlvbnMgbGlrZSAKd3JpdGVsKCkvd3JpdGVx
KCkvbWVtY3B5X2Zyb21pbygpL21lbWNweV90b2lvKCkgZXRjLi4uCgo+IEkgY2Fubm90IHNlZSB0
aGUgZGlmZmVyZW5jZSBoZXJlIGV4Y2VwdCB1c2VyIHNwYWNlIHNob3VsZCB1c2UgdW5jYWNoZWFi
bGUgbW1hcCB0byBtYXAgdmlydHVhbCBtZW1vcnkgdG8gZGV2aWNlIHNwYWNlKHRob3VnaCBJIGRv
bid0IGtub3cgaG93IHRvIHVzZSB1bmNhY2hlYWJsZSBtbWFwKSwgd2hpbGUga2VybmVsIHVzZSB1
bmNhY2hlIGlvcmVtYXAuCgpUaGUgcHJvYmxlbSB3aXRoIG1tYXAoKSBvZiBNTUlPIGludG8gdGhl
IHVzZXJzcGFjZSBpcyB0aGF0IHRoaXMgY2FuIAplYXNpbHkgY3Jhc2ggdGhlIHdob2xlIHN5c3Rl
bS4KCldoZW4gYW4gYXBwbGljYXRpb24gdXNlcyBtZW1zZXQoKS9tZW1jcHkoKSBvbiB0aGUgbWFw
cGVkIHJlZ2lvbiBhbmQgdGhlIApzeXN0ZW0gc3BvbnRhbmVvdXMgcmVib290cyB0aGFuIHRoYXQn
cyBhIHJhdGhlciBiaWcgaGFyZHdhcmUgcHJvYmxlbS4KClJlZ2FyZHMsCkNocmlzdGlhbi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
