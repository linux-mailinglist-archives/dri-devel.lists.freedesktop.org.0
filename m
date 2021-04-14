Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61DB35ED9A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC95A6E8E7;
	Wed, 14 Apr 2021 06:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733536E8E7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 06:50:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aF94ne5t2XRmJ2wbdZYb1tn3k2aEO6I+cdA6ylTt+wlcSjtyvQORJY4BkztNKpLudyypzMNU8sAPAfN6kYu2zwTrOhkwPu9+CrlHAdUwyS9I7KB0SfeKmXD6A3FCsZOvAl5qaqOv6zfx3JH4kOGdGYz3+5l/g7Hq+a9F+H9r7E/WKsBQqiHgGmFKHUVs+RtVJZCt/sxalBNyoB+QnKe7kQRNMGXTGaQ7Wg3/OQRSE/SBsK68KaPibkL+ZmRsgL+2ld3DPR2Qb/El5E/hVqywMiaI7XFm7fn5YihsN6UvjTud3oeWsIF0HlvOYp3A3RJtpw/P+HaHVjyNELu+uPNV/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iZaR2YoKkt7tCLQguPviNCbWDCtfkrZEPSP8eK16yo=;
 b=NMPyQPUoNOjjpk6aqnG+1FF4wlucmC5nOc+GZFBcnl/mmsZiPpeh3B5UiiGTddFQfYMwiuEtzh4n2X6YvnRliPvKbP6JQAphUxhJ4uuStvNm1cQc8e7rvYJJ1RC8O4/Mq769CLHuZ3WUPTqfP6gNo3jjnv3JmBxpAlmxKi+osnNpi9Oj1F2WWKm4a+kaUCq5H1ViUxj5s9aGAQHWZUsDoHExai089uvJS/00qK5w+WVcOf5Af/OPl8CH/WxF9v9clguLF7jT9wNKnw0ulX8hFW6ShwJ1GecJa/5/Uc/s25Wnh8j9mNqc/3A9ad8KBqK5Jj/kyiNqghvVidfgrhtWlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iZaR2YoKkt7tCLQguPviNCbWDCtfkrZEPSP8eK16yo=;
 b=k45ncAddFG84oX6M0yVarToJlwAgns/xsY48556vI6y6wOy65kM19dZkIoAvPuADfxB0r6T4dJmEZmPgq1a6bYVojB9unmsIJX7eKvoOVp/bQWzS5dWYqLlo9/anCm3YWXQjHV+0doQc2yHDApOM3HA/DWMmoUkCUxh/E/CwO88=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3901.namprd12.prod.outlook.com (2603:10b6:208:16c::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 14 Apr
 2021 06:50:44 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:50:44 +0000
Subject: Re: [PATCH 0/9] Implement multi-GPU DMA mappings for KFD
To: dri-devel@lists.freedesktop.org
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <3d9a0cdd-1482-81a4-d3f4-d6a7481cac3a@amd.com>
Date: Wed, 14 Apr 2021 02:50:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210414064621.29273-1-Felix.Kuehling@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::23) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.80] (165.204.55.251) by
 YTOPR0101CA0010.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Wed, 14 Apr 2021 06:50:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5a018e0-7ac4-4211-f4de-08d8ff11a049
X-MS-TrafficTypeDiagnostic: MN2PR12MB3901:
X-Microsoft-Antispam-PRVS: <MN2PR12MB39014589E093C2E109E01F42924E9@MN2PR12MB3901.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BHEBsM4Ptq4c6uupUamLLfYlCOElQq2ri7L243rmu2ksxZiMja1tsj0SldGwTblF95LQXbdCtWYEXzYFf4OuWZoiR1/rRUNGtfkN0r69wQJpX+REzOlqDFDHiPgNDW9V9HL1Pp9/SNEOd7xJS0a6R31KnD0lTsCQPKMrLj54+PhCjkq4bLT9M3jHHuFbfk+O3ohkMuqy/etRTvNFhBHG4mvm3F1VrWnsugj3aNnWMq/6+sSqq3sEcIhDAcW7vU5hRgGZJ0blzIsNRlliNYIW0e0blHdsp92eFmKh/CV9Lma/qATglHzoqEfjgE1T76S467Wq8b3FkfA17+h69WPYVmVtyhTPSuuuDo9zJ05npLzClD1q2OdZtGpwuemBHjBPT4tFlpNdVVL+5xXk7DrpxGzVA0uZMPwfrU8uNe73BUFmA0XhEuy7hY4T23kAfS2tHaAK67x4Fi8CdxAckSBjPhKg0xkA+FCNH6HBHo8WeHhBPxYnmtcnhbqswVke8Ay3U6x3XW2q+5aniX2WuBM5OcIF6WU1tYLcqu+Zc2K7RQN/rEr0VBZ0mJqJCsHAKva8jegVMr/mSTkWF/wPEWu5w6BvALR8oNpSwnX7FcXHdZJ798MGOlvn2VVyaPmYZILnkBRkNYE5RZcMZRc5nxxVydbU7s+aFxkA4OllNs0G+O1rzhiIDabbxwz0hF4022TAUuXIo2J+XLDQU7U+eNQR/60WY2Edbrk7VnMkqILsf6c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(956004)(2616005)(478600001)(6916009)(44832011)(86362001)(186003)(53546011)(16526019)(31696002)(2906002)(83380400001)(26005)(6486002)(36756003)(38100700002)(38350700002)(66946007)(16576012)(36916002)(8676002)(316002)(52116002)(66556008)(5660300002)(31686004)(8936002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bUVTVmZzaVZ3Zis4ZXFIUmlidEl0RWlBRjNoUnFQMUQvbEFGVEtmNnZGZEFU?=
 =?utf-8?B?MWNWM2NnMVdWZFk5QzJad0FNZkFUWmlwbDEzc2pDTE9PelJDb1VoMUtHL28v?=
 =?utf-8?B?UVpYQ0pmd3BSUm5QcjROSHgxUytJU3JWZjNkMCtTbXpLWDgvR3dxNXpxdnFs?=
 =?utf-8?B?Y1JtbzJTSmEvU3l0NjNYL1hXRUlEN2NKYWsvbDJCYjZKVTdrYmhFVnN5OGZW?=
 =?utf-8?B?TzQ5N2FkV0VONyttY3RidHVMTDIyV09waGVDV1drZHB0d0xuQTFUYzd6TTVN?=
 =?utf-8?B?cUpabElxNHlOZnFoek1TRnRVNThIajlRQy9PbjhxOVdZYjBSRDhxbmFQaExF?=
 =?utf-8?B?TWVGYkhEa21mdzdsQ2ZJd0xoSHhPa0daZTdFRXBTTHdKcHZXMXdpRVVhZ1gy?=
 =?utf-8?B?bkR0MUlmSDZYbE5DaytFditoRmJvcjMwSEJlWUVjRStjN3BKQ0ozVjdrQy8z?=
 =?utf-8?B?M0lrQndRYVV6enlmdlIzdE9XSk9EZzVYbTNralpnczhDQVA5Z1NRTitKU3pL?=
 =?utf-8?B?a3p1cTg4cjExemtsTFhGRmNKNjk2SXJCbERCTFF3L29YRXhMdldyTExmbUVV?=
 =?utf-8?B?NTZSWmlhUit1M3dpSlFKYWt1ZWZSenVoVXZzSk1majRxa2pzUWtlZ0JwajhL?=
 =?utf-8?B?RDlpcjFTN3d3SkYxdHVmSVlENExWRk9EMmFUWDJicGEyUm1iL1VGTzIvelBz?=
 =?utf-8?B?eCtleGtwOXVxM3c5Ny9xMWsxVWN2eTN1Y3Y4WUlVaEJuS2tvK013a3B5eTdQ?=
 =?utf-8?B?a2NFbzFiajBlWjducTRHOWRzcVNud2JaYXBRdjRuOU45ejRSL1M0ckk5eGJS?=
 =?utf-8?B?aFl1dW9zVFduR3lXbzF1RmlHbnR6Um92QXo5L0I0TE9TVFNaUFpaQldCVERj?=
 =?utf-8?B?NnMzTmtxbmM4NVYxblo1YUVyUGpSOTE5M01ZTHIyallRc2NsY0FqcUhOcFha?=
 =?utf-8?B?Tm0rdjcyS0VoN1hPWkFuWjhLaHpwSjA1Z1hMYVlicmhkWk5oM1ZCajVuYkN2?=
 =?utf-8?B?NkMrWXFPeDBwWU9TVDkzQUFEZjkxTTR1aTFCK0pRV3A0eHhNQVV5Z0xjeTFL?=
 =?utf-8?B?TDNRb3oxMEdlRGpsVzhMdDBIeEpBOWc3VG9WdWdIOS80N0syWE1JU1dlbzND?=
 =?utf-8?B?MGxuLzdtRnJXNy82RVpSMUlVUkZUUldEOXVIL3Y3RXcrbHkwd1VweHJNTHU0?=
 =?utf-8?B?QnBTZ293Mk1sQUtORytPTjZ2MzlkODE5aW9Cd1ZNb1Uwd2tFWWh3czNvQURR?=
 =?utf-8?B?ODRRc0VqMHpaT2l4MTVjYkdYTU1zanlGeXkrb2FzT0I2UkR1VytyNDhwZXE5?=
 =?utf-8?B?VktpY09TUGR0b290dUQ0WmExNG8wRmRoUm96bFFMYnJPMVZKVURkcDJPdUY2?=
 =?utf-8?B?RnJvRXBWdHQ5aEtlaUJMdWk0UktFaFhKTVlIbkZtN1I0bDdrcG5uSG51NS9r?=
 =?utf-8?B?RHQ0M1o4c3pRQU9FRWkwSmgzRWJXUXhhcnA5alU1am4yNlNtU1BWdjZqSHVw?=
 =?utf-8?B?eVByZnlDNWVmdGMyRlBMWXk2V2ZsWUpiY0xuYkt1TkJsbnF4OTBMeTNuWGJt?=
 =?utf-8?B?eGhqcmoxLzR3dmdGSFhVbmpYVzYvVXdTU2R6K1JvOTZhVForR2VOSDMwMy95?=
 =?utf-8?B?RTFFNTlJWUFtSzRNbmxYYzRNZGEyaUNudnZvSGN4VWw0VmM0aUNyUElqeVho?=
 =?utf-8?B?bUU2V3lLTm4xRDlCT2FTNlBuaWN6dithR3JDZDZYdTdqUTkyaHRycXRZcEdw?=
 =?utf-8?Q?Q5Pp5Z600Lifz2I40P2Wpsd3+Dc8S4M5sDcZdHh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a018e0-7ac4-4211-f4de-08d8ff11a049
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:50:44.2569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HixhnbdnH+Cs3kDdo9daFd49OslXs9X2ouH65X7jrpI1K3AcjlobBs9FAFs2LFjQl70AyGmzpK9x5yxLSeM65w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3901
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29ycnkgZm9yIHRoZSBzcGFtLiBJIG1pcy1zcGVsbGVkIHRoZSBhbWQtZ2Z4IGxpc3Qgb24gdGhl
IFRvOiBsaW5lIG9mIAp0aGlzIHBhdGNoIHNlcmllcy4gUGxlYXNlIGlnbm9yZSB0aGlzIGFuZCBz
ZWUgdGhlIHBhdGNoIHNlcmllcyBJIHNlbnQgYSAKbWludXRlIGxhdGVyLgoKUmVnYXJkcywKIMKg
IEZlbGl4CgpPbiAyMDIxLTA0LTE0IDI6NDYgYS5tLiwgRmVsaXggS3VlaGxpbmcgd3JvdGU6Cj4g
VGhpcyBwYXRjaCBzZXJpZXMgZml4ZXMgRE1BLW1hcHBpbmdzIG9mIHN5c3RlbSBtZW1vcnkgKEdU
VCBhbmQgdXNlcnB0cikKPiBmb3IgS0ZEIHJ1bm5pbmcgb24gbXVsdGktR1BVIHN5c3RlbXMgd2l0
aCBJT01NVSBlbmFibGVkLiBPbmUgU0ctQk8gcGVyCj4gR1BVIGlzIG5lZWRlZCB0byBtYWludGFp
biB0aGUgRE1BIG1hcHBpbmdzIG9mIGVhY2ggQk8uCj4KPiBJIHJhbiBpbnRvIHNvbWUgcmVzZXJ2
YXRpb24gaXNzdWVzIHdoZW4gdW5tYXBwaW5nIG9yIGZyZWVpbmcgRE1BLWJ1Zgo+IGltcG9ydHMu
IFRoZXJlIGFyZSBhIGZldyBGSVhNRSBjb21tZW50cyBpbiB0aGlzIHBhdGNoIHNlcmllcyB3aGVy
ZSBJJ20KPiBob3BpbmcgZm9yIHNvbWUgZXhwZXJ0IGFkdmljZS4gUGF0Y2hlcyA4IGFuZCA5IGFy
ZSBzb21lIHJlbGF0ZWQgZml4ZXMKPiBpbiBUVE0gYW5kIGFtZGdwdV90dG0uIEknbSBwcmV0dHkg
c3VyZSBwYXRjaCA5IGlzIG5vdCB0aGUgcmlnaHQgd2F5IHRvCj4gZG8gdGhpcy4KPgo+IEZlbGl4
IEt1ZWhsaW5nICg5KToKPiAgICBkcm0vYW1kZ3B1OiBSZW5hbWUga2ZkX2JvX3ZhX2xpc3QgdG8g
a2ZkX21lbV9hdHRhY2htZW50Cj4gICAgZHJtL2FtZGdwdTogS2VlcCBhIGJvLXJlZmVyZW5jZSBw
ZXItYXR0YWNobWVudAo+ICAgIGRybS9hbWRncHU6IFNpbXBsaWZ5IEFRTCBxdWV1ZSBtYXBwaW5n
Cj4gICAgZHJtL2FtZGdwdTogQWRkIG11bHRpLUdQVSBETUEgbWFwcGluZyBoZWxwZXJzCj4gICAg
ZHJtL2FtZGdwdTogRE1BIG1hcC91bm1hcCB3aGVuIHVwZGF0aW5nIEdQVSBtYXBwaW5ncwo+ICAg
IGRybS9hbWRncHU6IE1vdmUga2ZkX21lbV9hdHRhY2ggb3V0c2lkZSByZXNlcnZhdGlvbgo+ICAg
IGRybS9hbWRncHU6IEFkZCBETUEgbWFwcGluZyBvZiBHVFQgQk9zCj4gICAgZHJtL3R0bTogRG9u
J3QgY291bnQgcGFnZXMgaW4gU0cgQk9zIGFnYWluc3QgcGFnZXNfbGltaXQKPiAgICBkcm0vYW1k
Z3B1OiBMb2NrIHRoZSBhdHRhY2hlZCBkbWFidWYgaW4gdW5wb3B1bGF0ZQo+Cj4gICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmggICAgfCAgMTggKy0KPiAgIC4uLi9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jICB8IDUzNSArKysrKysrKysr
KystLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICAg
ICB8ICAxMyArCj4gICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jICAgICAgICAgICAgICAg
ICAgfCAgMjcgKy0KPiAgIDQgZmlsZXMgY2hhbmdlZCwgNDIwIGluc2VydGlvbnMoKyksIDE3MyBk
ZWxldGlvbnMoLSkKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
