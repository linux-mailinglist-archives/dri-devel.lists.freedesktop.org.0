Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E43630CA
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 17:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9676E6E055;
	Sat, 17 Apr 2021 15:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580E96E055
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 15:03:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaUx2pR6rjvJwjKXy+Sl2xh1kJ9MgTVm7tiYUlENY2NII9F/3G3hrVWL49VX/3OLhevuEYb/L8ZYk9/SxHZUGIJff/641S1LI92ZA26wxJPEr6Xbf4P8Jruc3lMIHpuDbac549H5Rj5bmO0ZWzbJqUeY5H7AuuItbnKp1AwCoYnmTvtsZKxpRwZhtkYjD1p+BhcNGdCDOW4M4fNCw4d2JdgF44DdmEQqgzHHbNWGMsJuzxdAyN4eMquUeuHszhpeAWY6v5cLqg1ajauxrxndMyrfeom7qSAqBmdcB1GDDg/Saciv7Fl4ieDy804KeZ2OK50GaA7CALzNK4k9FJrWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kp4ztWM7lXzkfWHj61qnw2P6A+AJFFVv9ngHnb0SVE=;
 b=BaAfJ/LjyLXkrfE9w//wDPuuv/xnYISb4NYA9MRhgG+XK1c6/A18B/Lr43vQv4629/1RvHHzgVyH38o/cZPinF3eNNQmBGq6oEnKUwqRXJYGMwmJNUAv6HHgLQSJfuWyIP2tShvJyfQ7HDeJrUFDbKaWs4MudyJmAwq9lHKx4Dl1DPrqgpKuyu64sIsb6weXpnV9BnAKt6uDTjOeHdro3y48hYxgyvv1SNI9NWQTMDM/KLlxNk8FizWWr2s/7vzsOY0TMHN4HM43USmTy36ngNx78oANBN+fM3pFWQ0Q3UPDfEmX7MzCu4M+G59zQPJGtybPX7VPT6/lysZuHs2HnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kp4ztWM7lXzkfWHj61qnw2P6A+AJFFVv9ngHnb0SVE=;
 b=bbZj7TFjiJg0fh1hBYU8FHlpk1KRxx2bI7kaDUhOE9DgRbfE/B8yAcqWYUKg5R2aHFo3LJE9K5U2rAFFcA2BrpN0a0S2akNnVYFctFUCqMNKNiGEl2hW/pujl4r+drn9WW9pb4IhzvbmTaswukiH9bk0tqbpCY+nLJlJSAmWkQ4=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Sat, 17 Apr
 2021 15:03:37 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4042.020; Sat, 17 Apr 2021
 15:03:37 +0000
Subject: Re: [External] [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
To: Muchun Song <songmuchun@bytedance.com>,
 Peter Enderborg <Peter.Enderborg@sony.com>
References: <20210417104032.5521-1-peter.enderborg@sony.com>
 <CAMZfGtWZwXemox5peP738v2awsHxABcpYeqccPunLCZzRXynBQ@mail.gmail.com>
 <ac32baa5-94a5-bf7b-661e-aca66c0850bc@sony.com>
 <CAMZfGtVGvOp4NuAHcVjXB08gfkus+r=iE_oSiWThAXV6zdWBzg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4ae4e646-7e28-e389-50d1-681723d022e1@amd.com>
Date: Sat, 17 Apr 2021 17:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAMZfGtVGvOp4NuAHcVjXB08gfkus+r=iE_oSiWThAXV6zdWBzg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:9c98:eafc:2b67:a7e2]
X-ClientProxiedBy: FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:9c98:eafc:2b67:a7e2]
 (2a02:908:1252:fb60:9c98:eafc:2b67:a7e2) by
 FR0P281CA0065.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.7 via Frontend Transport; Sat, 17 Apr 2021 15:03:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9804c3e5-bfcb-424e-eba7-08d901b1fa75
X-MS-TrafficTypeDiagnostic: MN2PR12MB4389:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4389E74815E4BF610239348B834B9@MN2PR12MB4389.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gpNIOUWEjEjk3YE8JeQI+oNvAiuQxG3LKLokq1jmGo0OjRCtpdgQJ6vewiXKiRbuYwBlgPZU4nP3qllAAw3PvUU0muHB5+CeHFTORMxdQDU7CC0b/EDxM0UnCP8N79btsOmdnlZjLBWzJGG2frsFBg1llkTihj8j7+USH6+OcXkLuO7RoBRkGrWmIBY4V1NVksxwxJO3z7nQtgb976Xj7qIVyLx3GTblIiUry4Y1ysQ3cuWJJ1Ba/zIvTaLrZMIW/nDkZyr38X1XlWqFxwynw/rYMNSjdRWEaA3LpWmYpEl0WMw13y1+lFw5qegDi6vz0lrDxWh+CYwNT5Tfyq8fhc09f8ELQq0G/hSdaNblCQ4agZDL5JdDTVc3B2Y6XzVS6lBAgxKiJIgk4/JBqYwGYyqeMa+6yjYFXj+7iV6bmtaxjIr2NKitW5GxPE3G3ZAdz+Wx0WziZrHXEUOh8r4oIi4PiJGOYh4ZlyloDLeACS83dsXq2vTTNKF9kbGkCRdqVqKcrbSB5PUmGaAeGwpuesz7EbA7KGlS+LpEVochMzPHHLq6yUoYRxtA9azWY1D0SiWOSy4w7ReDCR7eIEIg3LywtH/5F2Hfyg+uAXU9E30kshckG8Ye5Ij5Hkd6Tlg+AhjLcNjewA3wYVdVoxJB3LYZj1oJ1eDNe7NywcVmj80tslSXVVDfZ8RWKiE1dts6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(83380400001)(36756003)(478600001)(31696002)(8936002)(2616005)(316002)(6486002)(6666004)(110136005)(52116002)(8676002)(53546011)(7416002)(186003)(66476007)(66556008)(86362001)(66946007)(16526019)(31686004)(2906002)(38100700002)(5660300002)(54906003)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bU9FTE45c09FYnpIbkpEYmlXTkZaZjhqMklucnhibzRhVEZhL0UwOFdkY1NU?=
 =?utf-8?B?R1pkTmN2MUl6NjlxMTd3TEtoNmU5NkRTcktOcmdYN3Q0cDJoUEVCUmR6OWJk?=
 =?utf-8?B?MHZTZ2VraDF3S2t6L1c3a085T1RXWTZuMEsvQjZVTFZ5U0loUUR5YzY3b3hR?=
 =?utf-8?B?NXJVK1kwMEhWbTJqdkJ0ejdzS2JmZlREak8wUEtFcXhnUHZaTXMyTk04YVQ3?=
 =?utf-8?B?ME9uZnFKNUlKb0VYWERSNG03QUhtN1VLQzkxZWtqSmRkamFGMERkZ293YVVw?=
 =?utf-8?B?Ry9HdGg0dmk2c2hDT2poR0R3c3JwWm5RM2EySHd0YWVvaW1oSGZwalpTeDN4?=
 =?utf-8?B?YVJ0ZURZWlpjWnpodTZMelYwQUw2UFhZNG5BU1lHcUVSK04valhVSU5xOHZ0?=
 =?utf-8?B?Qk9SZGlZQ3RBM0drWkFUaUkydEhlaHo3NER6cVd0TDhqcU5qWklOdFBkOVN5?=
 =?utf-8?B?Nm1IczEwb3c5L3FOZ0tjdHErQjAyWkc3T2Ftek4wM0xmbmhCeXBQc0pyaG9O?=
 =?utf-8?B?dmpZd0lZTGVKVWh5TTVGNUJpU1pvNXAwbWgzeVA2NXF5Q0UyVEVkcDRIOEY3?=
 =?utf-8?B?VzVGalczOUZIRG85MnhKeU9XRHdyRHB2ZmNSakdVaXBDNFRucFBvUFliSTZt?=
 =?utf-8?B?U1U1MEZrd3c3alVMaWNQK1NaU2VML3ZGbUtqNzNJdHZwVEYyME52cVdZcHp1?=
 =?utf-8?B?ZXpIZitRRXNEVHFPMGtzMER6ZklzUnM2cmVjeVlkbUZWTXVNcGNIc29JY1k1?=
 =?utf-8?B?Z3dtcjU3YTZCeTFsb2p3Z1dsN1BWdk9jM0ZVazQ0QW1PaU45UlNLNmMyZmlN?=
 =?utf-8?B?alB0dHMzOWFzenFSaUxHZHhOaS8yK2Z5YjAyRHhZd0NkQnVVemk1dTdQYnpW?=
 =?utf-8?B?UzI2eVJkblpNYWI4RFZ1NEFrOGRNakg2bWhsbmFOMkdGRVg0eWErU1ZkUENV?=
 =?utf-8?B?Q3RsZkl4cCs4UnpmcjNrQmUyZVpVcGwvUVE5UzFlNTRYYkIvTGI0dGdyeTRl?=
 =?utf-8?B?K0NLUllEWlk5NkUyU0xJdWJNTStqTW5zdUVoOTdWc1lwNFRlTkFFNHpqeHYr?=
 =?utf-8?B?SzU1YlUxaVUxRU5hZVkzNG5vamlEVFpPZzhFTndUdjJJVFZnanRsUEF5OXFp?=
 =?utf-8?B?bGdIOEZjc1BjNHRiUGJNVExDWExSdFFLeHFHNkZSblJNaFRnV3JhUTdtRTQ2?=
 =?utf-8?B?MVNOM05NU1E0TFNUOFJUZUlNS2wzemJqVWc4MEFSR0hkRGtncDU3T0d3aURI?=
 =?utf-8?B?bnpKUFV1Vi9RUkQ1YW9Ha1lsMUk2b1FiTXJ0bkFtc3NXd3lvS2VCL3phRHFw?=
 =?utf-8?B?eHgwQ3BFMWlZVTUxTmpmMTJDZlppWkNTMFlJeWZRUmhSWjJEYzBQYWM0cEli?=
 =?utf-8?B?V3NSMEZ1bHVEVlo3TFZYN1ZFcUxEaGYrSFhkektQb21VWU9tcWVmbWZtNHk3?=
 =?utf-8?B?Y2IyRTlWN0JzV0JZYjE0SW5Jd1k3RVpSRjZLWGNHLzJ1dUR2UE9rUWhtYlRm?=
 =?utf-8?B?Y05UZDJncUhRL3RkZlBBZGJRcW50MGtibTBjZWxUSG55N3RuV0Z2dDlETEZQ?=
 =?utf-8?B?RitUMXFDOXYxMEoyYUN4SXBpMkJWWWdMV1Z5OURZVUZvWVZOQzM5d1pla2lC?=
 =?utf-8?B?WmdDQk9YbzFaWFZTcjFnVkxXSnVVTkpkbTlkZE16UnlDTDNhU3RNUzFPRWUv?=
 =?utf-8?B?YUZVZDY3aVFtL1dGVjFmVDVCbGlhcjlFUVluSndhbFZpTXE0VVJZSFo3a2Zq?=
 =?utf-8?B?Z3Y4NjZvYUNUbytTRkFPaWZZMFd4b1d4c3RzVldnVEpUaHlsNlhCbnZvWXV4?=
 =?utf-8?B?NkhvVHRIRGdGaG5WTGxlSkxjM2p0aitqeXdYNlFRZ2NLM0R4aFhXNUt6ZXJx?=
 =?utf-8?Q?zLyS9WAIbjm3n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9804c3e5-bfcb-424e-eba7-08d901b1fa75
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2021 15:03:37.6334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOwDU0rmpTpH3+7DL7IpHVFEFhVKGjEt96WJWphEOSOtIvp1b50pNSi7ETph0NcJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
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
Cc: Michal Hocko <mhocko@suse.com>, Neil Brown <neilb@suse.de>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Roman Gushchin <guro@fb.com>, linaro-mm-sig@lists.linaro.org,
 Shakeel Butt <shakeelb@google.com>, Matthew Wilcox <willy@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDQuMjEgdW0gMTY6MjEgc2NocmllYiBNdWNodW4gU29uZzoKPiBPbiBTYXQsIEFwciAx
NywgMjAyMSBhdCA5OjQ0IFBNIDxQZXRlci5FbmRlcmJvcmdAc29ueS5jb20+IHdyb3RlOgo+PiBP
biA0LzE3LzIxIDM6MDcgUE0sIE11Y2h1biBTb25nIHdyb3RlOgo+Pj4gT24gU2F0LCBBcHIgMTcs
IDIwMjEgYXQgNjo0MSBQTSBQZXRlciBFbmRlcmJvcmcKPj4+IDxwZXRlci5lbmRlcmJvcmdAc29u
eS5jb20+IHdyb3RlOgo+Pj4+IFRoaXMgYWRkcyBhIHRvdGFsIHVzZWQgZG1hLWJ1ZiBtZW1vcnku
IERldGFpbHMKPj4+PiBjYW4gYmUgZm91bmQgaW4gZGVidWdmcywgaG93ZXZlciBpdCBpcyBub3Qg
Zm9yIGV2ZXJ5b25lCj4+Pj4gYW5kIG5vdCBhbHdheXMgYXZhaWxhYmxlLiBkbWEtYnVmIGFyZSBp
bmRpcmVjdCBhbGxvY2F0ZWQgYnkKPj4+PiB1c2Vyc3BhY2UuIFNvIHdpdGggdGhpcyB2YWx1ZSB3
ZSBjYW4gbW9uaXRvciBhbmQgZGV0ZWN0Cj4+Pj4gdXNlcnNwYWNlIGFwcGxpY2F0aW9ucyB0aGF0
IGhhdmUgcHJvYmxlbXMuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBFbmRlcmJvcmcg
PHBldGVyLmVuZGVyYm9yZ0Bzb255LmNvbT4KPj4+PiAtLS0KPj4+PiAgIGRyaXZlcnMvZG1hLWJ1
Zi9kbWEtYnVmLmMgfCAxMyArKysrKysrKysrKysrCj4+Pj4gICBmcy9wcm9jL21lbWluZm8uYyAg
ICAgICAgIHwgIDUgKysrKy0KPj4+PiAgIGluY2x1ZGUvbGludXgvZG1hLWJ1Zi5oICAgfCAgMSAr
Cj4+Pj4gICAzIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVy
cy9kbWEtYnVmL2RtYS1idWYuYwo+Pj4+IGluZGV4IGYyNjRiNzBjMzgzZS4uMTk3ZTVjNDVkZDI2
IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPj4+PiArKysgYi9k
cml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4+Pj4gQEAgLTM3LDYgKzM3LDcgQEAgc3RydWN0IGRt
YV9idWZfbGlzdCB7Cj4+Pj4gICB9Owo+Pj4+Cj4+Pj4gICBzdGF0aWMgc3RydWN0IGRtYV9idWZf
bGlzdCBkYl9saXN0Owo+Pj4+ICtzdGF0aWMgYXRvbWljX2xvbmdfdCBkbWFfYnVmX2dsb2JhbF9h
bGxvY2F0ZWQ7Cj4+Pj4KPj4+PiAgIHN0YXRpYyBjaGFyICpkbWFidWZmc19kbmFtZShzdHJ1Y3Qg
ZGVudHJ5ICpkZW50cnksIGNoYXIgKmJ1ZmZlciwgaW50IGJ1ZmxlbikKPj4+PiAgIHsKPj4+PiBA
QCAtNzksNiArODAsNyBAQCBzdGF0aWMgdm9pZCBkbWFfYnVmX3JlbGVhc2Uoc3RydWN0IGRlbnRy
eSAqZGVudHJ5KQo+Pj4+ICAgICAgICAgIGlmIChkbWFidWYtPnJlc3YgPT0gKHN0cnVjdCBkbWFf
cmVzdiAqKSZkbWFidWZbMV0pCj4+Pj4gICAgICAgICAgICAgICAgICBkbWFfcmVzdl9maW5pKGRt
YWJ1Zi0+cmVzdik7Cj4+Pj4KPj4+PiArICAgICAgIGF0b21pY19sb25nX3N1YihkbWFidWYtPnNp
emUsICZkbWFfYnVmX2dsb2JhbF9hbGxvY2F0ZWQpOwo+Pj4+ICAgICAgICAgIG1vZHVsZV9wdXQo
ZG1hYnVmLT5vd25lcik7Cj4+Pj4gICAgICAgICAga2ZyZWUoZG1hYnVmLT5uYW1lKTsKPj4+PiAg
ICAgICAgICBrZnJlZShkbWFidWYpOwo+Pj4+IEBAIC01ODYsNiArNTg4LDcgQEAgc3RydWN0IGRt
YV9idWYgKmRtYV9idWZfZXhwb3J0KGNvbnN0IHN0cnVjdCBkbWFfYnVmX2V4cG9ydF9pbmZvICpl
eHBfaW5mbykKPj4+PiAgICAgICAgICBtdXRleF9sb2NrKCZkYl9saXN0LmxvY2spOwo+Pj4+ICAg
ICAgICAgIGxpc3RfYWRkKCZkbWFidWYtPmxpc3Rfbm9kZSwgJmRiX2xpc3QuaGVhZCk7Cj4+Pj4g
ICAgICAgICAgbXV0ZXhfdW5sb2NrKCZkYl9saXN0LmxvY2spOwo+Pj4+ICsgICAgICAgYXRvbWlj
X2xvbmdfYWRkKGRtYWJ1Zi0+c2l6ZSwgJmRtYV9idWZfZ2xvYmFsX2FsbG9jYXRlZCk7Cj4+Pj4K
Pj4+PiAgICAgICAgICByZXR1cm4gZG1hYnVmOwo+Pj4+Cj4+Pj4gQEAgLTEzNDYsNiArMTM0OSwx
NiBAQCB2b2lkIGRtYV9idWZfdnVubWFwKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCBk
bWFfYnVmX21hcCAqbWFwKQo+Pj4+ICAgfQo+Pj4+ICAgRVhQT1JUX1NZTUJPTF9HUEwoZG1hX2J1
Zl92dW5tYXApOwo+Pj4+Cj4+Pj4gKy8qKgo+Pj4+ICsgKiBkbWFfYnVmX2FsbG9jYXRlZF9wYWdl
cyAtIFJldHVybiB0aGUgdXNlZCBuciBvZiBwYWdlcwo+Pj4+ICsgKiBhbGxvY2F0ZWQgZm9yIGRt
YS1idWYKPj4+PiArICovCj4+Pj4gK2xvbmcgZG1hX2J1Zl9hbGxvY2F0ZWRfcGFnZXModm9pZCkK
Pj4+PiArewo+Pj4+ICsgICAgICAgcmV0dXJuIGF0b21pY19sb25nX3JlYWQoJmRtYV9idWZfZ2xv
YmFsX2FsbG9jYXRlZCkgPj4gUEFHRV9TSElGVDsKPj4+PiArfQo+Pj4+ICtFWFBPUlRfU1lNQk9M
X0dQTChkbWFfYnVmX2FsbG9jYXRlZF9wYWdlcyk7Cj4+PiBkbWFfYnVmX2FsbG9jYXRlZF9wYWdl
cyBpcyBvbmx5IGNhbGxlZCBmcm9tIGZzL3Byb2MvbWVtaW5mby5jLgo+Pj4gSSBhbSBjb25mdXNl
ZCB3aHkgaXQgc2hvdWxkIGJlIGV4cG9ydGVkLiBJZiBpdCB3b24ndCBiZSBjYWxsZWQKPj4+IGZy
b20gdGhlIGRyaXZlciBtb2R1bGUsIHdlIHNob3VsZCBub3QgZXhwb3J0IGl0Lgo+PiBBaC4gSSB0
aG91Z2h0IHlvdSBkaWQgbm90IHdhbnQgdGhlIEdQTCByZXN0cmljdGlvbi4gSSBkb24ndCBoYXZl
IHJlYWwKPj4gb3BpbmlvbiBhYm91dCBpdC4gSXQncyB3cml0dGVuIHRvIGJlIGZvbGxvd2luZyB0
aGUgcmVzdCBvZiB0aGUgbW9kdWxlLgo+PiBJdCBpcyBub3QgbmVlZGVkIGZvciB0aGUgdXNhZ2Ug
b2YgZG1hLWJ1ZiBpbiBrZXJuZWwgbW9kdWxlLiBCdXQgSQo+PiBkb24ndCBzZWUgYW55IHJlYXNv
biBmb3IgaGlkaW5nIGl0IGVpdGhlci4KPiBUaGUgbW9kdWxlcyBkbyBub3QgbmVlZCBkbWFfYnVm
X2FsbG9jYXRlZF9wYWdlcywgaGlkaW5nIGl0Cj4gY2FuIHByZXZlbnQgdGhlIG1vZHVsZSBmcm9t
IGNhbGxpbmcgaXQuIFNvIEkgdGhpbmsgdGhhdAo+IEVYUE9SVF9TWU1CT0xfR1BMIGlzIHVubmVj
ZXNzYXJ5LiBJZiBvbmUgZGF5IHNvbWVvbmUKPiB3YW50IHRvIGNhbGwgaXQgZnJvbSB0aGUgbW9k
dWxlLCBtYXliZSBpdOKAmXMgbm90IHRvbyBsYXRlIHRvIGV4cG9ydAo+IGl0IGF0IHRoYXQgdGlt
ZS4KClllYWgsIHRoYXQgaXMgYSByYXRoZXIgZ29vZCBwb2ludC4gT25seSBzeW1ib2xzIHdoaWNo
IHNob3VsZCBiZSB1c2VkIGJ5IAptb2R1bGVzL2RyaXZlcnMgc2hvdWxkIGJlIGV4cG9ydGVkLgoK
Q2hyaXN0aWFuLgoKPgo+Pgo+Pj4gVGhhbmtzLgo+Pj4KPj4+PiArCj4+Pj4gICAjaWZkZWYgQ09O
RklHX0RFQlVHX0ZTCj4+Pj4gICBzdGF0aWMgaW50IGRtYV9idWZfZGVidWdfc2hvdyhzdHJ1Y3Qg
c2VxX2ZpbGUgKnMsIHZvaWQgKnVudXNlZCkKPj4+PiAgIHsKPj4+PiBkaWZmIC0tZ2l0IGEvZnMv
cHJvYy9tZW1pbmZvLmMgYi9mcy9wcm9jL21lbWluZm8uYwo+Pj4+IGluZGV4IDZmYTc2MWM5Y2M3
OC4uY2NjN2M0MGM4ZGI3IDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL3Byb2MvbWVtaW5mby5jCj4+Pj4g
KysrIGIvZnMvcHJvYy9tZW1pbmZvLmMKPj4+PiBAQCAtMTYsNiArMTYsNyBAQAo+Pj4+ICAgI2lm
ZGVmIENPTkZJR19DTUEKPj4+PiAgICNpbmNsdWRlIDxsaW51eC9jbWEuaD4KPj4+PiAgICNlbmRp
Zgo+Pj4+ICsjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi5oPgo+Pj4+ICAgI2luY2x1ZGUgPGFzbS9w
YWdlLmg+Cj4+Pj4gICAjaW5jbHVkZSAiaW50ZXJuYWwuaCIKPj4+Pgo+Pj4+IEBAIC0xNDUsNyAr
MTQ2LDkgQEAgc3RhdGljIGludCBtZW1pbmZvX3Byb2Nfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0s
IHZvaWQgKnYpCj4+Pj4gICAgICAgICAgc2hvd192YWxfa2IobSwgIkNtYUZyZWU6ICAgICAgICAi
LAo+Pj4+ICAgICAgICAgICAgICAgICAgICAgIGdsb2JhbF96b25lX3BhZ2Vfc3RhdGUoTlJfRlJF
RV9DTUFfUEFHRVMpKTsKPj4+PiAgICNlbmRpZgo+Pj4+IC0KPj4+PiArI2lmZGVmIENPTkZJR19E
TUFfU0hBUkVEX0JVRkZFUgo+Pj4+ICsgICAgICAgc2hvd192YWxfa2IobSwgIkRtYUJ1ZlRvdGFs
OiAgICAiLCBkbWFfYnVmX2FsbG9jYXRlZF9wYWdlcygpKTsKPj4+PiArI2VuZGlmCj4+Pj4gICAg
ICAgICAgaHVnZXRsYl9yZXBvcnRfbWVtaW5mbyhtKTsKPj4+Pgo+Pj4+ICAgICAgICAgIGFyY2hf
cmVwb3J0X21lbWluZm8obSk7Cj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWJ1
Zi5oIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgKPj4+PiBpbmRleCBlZmRjNTZiOWQ5NWYuLjVi
MDU4MTZiZDJjZCAxMDA2NDQKPj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaAo+Pj4+
ICsrKyBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oCj4+Pj4gQEAgLTUwNyw0ICs1MDcsNSBAQCBp
bnQgZG1hX2J1Zl9tbWFwKHN0cnVjdCBkbWFfYnVmICosIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
LAo+Pj4+ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcpOwo+Pj4+ICAgaW50IGRtYV9i
dWZfdm1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCk7
Cj4+Pj4gICB2b2lkIGRtYV9idWZfdnVubWFwKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVj
dCBkbWFfYnVmX21hcCAqbWFwKTsKPj4+PiArbG9uZyBkbWFfYnVmX2FsbG9jYXRlZF9wYWdlcyh2
b2lkKTsKPj4+PiAgICNlbmRpZiAvKiBfX0RNQV9CVUZfSF9fICovCj4+Pj4gLS0KPj4+PiAyLjE3
LjEKPj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
