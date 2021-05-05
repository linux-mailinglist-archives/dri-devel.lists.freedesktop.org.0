Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D59AC373CC7
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 15:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A5E6E4A2;
	Wed,  5 May 2021 13:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FCF6E165;
 Wed,  5 May 2021 13:57:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORM//lCXu8zyuHlbtTv7fEKVr5VFpzVka4nx0YnjdrJrwZ0eVqdJqEcN8mY2dBrKjFU/JaLLAfTDsLvzUMVdosRKXpeLjn+MUbWvDt/RlnvQr6Zw3lE2rrKYgGNgewQJQYGe6uVXPZtzYSO+emvaEqkZ5Ni0+zWuGkyiqYmwYWYt6VQwEExCbiVSk7ouJA1BorsXHcEMmvW6sn/crlFdVFZGRXxATXylGM3lkHrJoCQ5Ik2qC+ZGjlB4otNtT0VWNWzT3QEyU6NQdBU5heaTsyK+/LRNE/Yh15O+L4y+APidSAhy3FCPFArLA9kFv65QnnhiG9UI4UmXjfE1aLl0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7yOAoEW9384c/VQ5GzWY5AMZ/9mJiDk9JTnJQk5Ac4=;
 b=Dnfo1BIoHrafZKBLKZ6ZUffH/KZOPVKwte0zlTbFwcLHHd5/AXpOpdygmOmH3xE60e4UK74rsj9KAYeu+6RCDWi6UCRXm50059QVpd+Dqd8YnB8yTjsYJnwUijcYoH8OTOdPRrUV597lDFmmCXO1YszEQ2Ot75CPrlcKZG6Qd5N60JLbRd5C/fb7SnM90hvNHdHkK/NT9H6hwXMBnPTbASR0uzM6uTpXWQA0vRY5teQjdUwJYM8+klj7bBqaPsZuzJOF1h8F+itJVeHbL+1mxQV2/SkCaZqM16cZ+bcBhyNypA9EpJoToNtvLDtoryvkoETfyIFXFUs7kADC0RMikA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7yOAoEW9384c/VQ5GzWY5AMZ/9mJiDk9JTnJQk5Ac4=;
 b=2BGhe6rHXs/AAO3ZGklJ8cOX8cbRjIXIk2vM2s2OakLgilj+Na68Atrht2oW4DljRQ6AjyuzQb+kOIXQT4JnmDGMzUZFaEg07nhWxf59v9KCTPkbHiIOiSml9p1XbzTGYHos9lbZjFCIM8DREHcHFqDSj87ZavekcP4tRPU+Mxg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2656.namprd12.prod.outlook.com (2603:10b6:805:67::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.44; Wed, 5 May
 2021 13:57:06 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 13:57:06 +0000
Subject: Re: [PATCH v5 15/27] drm/scheduler: Fix hang when sched_entity
 released
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-16-andrey.grodzovsky@amd.com>
 <a8314d77-578f-e0df-5c49-77d5f10c76c7@amd.com>
 <9cb771f2-d52f-f14e-f3d4-b9488b353ae3@amd.com>
 <0c598888-d7d4-451a-3d4a-01c46ddda397@gmail.com>
 <a704880d-8e27-3cca-f42b-1320d39ac503@amd.com>
Message-ID: <aa42d956-7bcb-9c90-ba5f-12ab701548dd@amd.com>
Date: Wed, 5 May 2021 09:57:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <a704880d-8e27-3cca-f42b-1320d39ac503@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:7d63:ab2e:d405:e927]
X-ClientProxiedBy: YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::16) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:7d63:ab2e:d405:e927]
 (2607:fea8:3edf:49b0:7d63:ab2e:d405:e927) by
 YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.41 via Frontend Transport; Wed, 5 May 2021 13:57:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7472e6e3-3219-4d1b-65db-08d90fcdaaf1
X-MS-TrafficTypeDiagnostic: SN6PR12MB2656:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2656DA82529F2E7611FC93D4EA599@SN6PR12MB2656.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3hVa0Xqc/xV8bvw7gFSAnAOQng/+OdajNi2Rzxwp634Y3MWnbkEe63kycFHz2Q/Sd2QciOxuBK+3aR9treF4fINS9771c5Pg0Mq4myUThJr64uR5O8NioOidvq0S6HjuSX32689qZddcUFd7coRw+mL+se8mXj/J70shw2/qu4vQV5+L5eB+iLWoom4IfB9NEfq8PpxHodmYxFlswRJF16KdhzWVZ+fheSuPNeOllXgfCiN87OWH15ic4y4aUe5FAlmD+5Cp5Y7uXj/94/KXQK/VYwLl8WZdLtDb0WJVutW56U/ozWSJUfg8K+z8SYaXYnMNqOQXn4ZHYk3tw9R5tQzPym/9sJhJoYRDQsDtOwfjE9gpvi0g6uBozFt1naZ8g5pfQrk/dItkuHXBMk1jsWJPpo9qS8awbcFb+Jlx703eEl6Jgj99XEd0EMcEX938BY/rOQND5jAVH3cnXhKeQVgVnR2om6O3ppcdKu0Lin8nW9+av3T603FEwXhLWPOvdwaRZty7/5231vNXba/nZwixVhsHFN1XAcXX8jNc00DvbTQsycGyBxWOtAS5r6rD8r2/+Leg+Hmn8+xFZ1gfbzDGaXoG22WS7x0wXT4JjMgpKFbOdl3vvK3bPEVu/j2mNHPJJcxXaVhhQGylOjsawqjA5kwfq2n6QxAs8cqiyrTL6v6QB7RBBj6E2+XVlf9J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(110136005)(38100700002)(83380400001)(53546011)(31686004)(31696002)(36756003)(2906002)(16526019)(6636002)(86362001)(4326008)(66946007)(8676002)(44832011)(66574015)(186003)(6486002)(478600001)(316002)(66476007)(5660300002)(2616005)(8936002)(66556008)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QWQ3OFZQQnBGYllxZGNZMGdHa1ZFRmFzOW45SkppR3lsOEs3OTVsN1Y3SjJ1?=
 =?utf-8?B?UXFMUmROek1tNzY2R0FHYUZZcEw2WEdrVnFXZmt2VzQ0NktqTWhlc1R6UFBi?=
 =?utf-8?B?YWZDaEoxcjJ4MlVTU0djL01JczhhZThGdHgvM0FXTFloMVB6N0pXaUpQMUs0?=
 =?utf-8?B?QzJGWTNwMnBIRXFEY2JWV3RzMHRIUnB5STZ2YVczMWZmSFNQc3lGTDBsYXRk?=
 =?utf-8?B?UVV2SkFNT240VlNvQUNydUNXYjV5bGpRanVrSjd6ci9iVDhKMlNma1Zxb3hw?=
 =?utf-8?B?aTdYZkVDb3JZdkpNSitVekZnSWdrVDBnbWFGcTUwUHdadXlWY3Jzazlpb2ZC?=
 =?utf-8?B?UHBYSEx4Z3BsalJLWjAxcXVYSS9FYjNpWkRBYXNHQ0EwcE81WEcrdTRJSVhL?=
 =?utf-8?B?UzJGaU5nVUk3UlVWaFltdjkrd0RXUHlHRWdyaW5ISlpCTkMvTzIyTFdSWVk3?=
 =?utf-8?B?dGhmZEloRjZBbFVNanpGOUQvRXdVYlVqclRWZ2g2cllEaTVRLzZ5Z1haUGFL?=
 =?utf-8?B?dVl2SlVmT1JHdzB1dDZqcEg2aEpLVHhMZWYra0Nwa3lHSW9qUklGRGRXeXNm?=
 =?utf-8?B?N3ZlcllNc2VKNHhTUVJmNjlUeFN3bThYRVJmaHJVZlRMUVZJMWdNdHZxNzZH?=
 =?utf-8?B?T1FEL285NlNvcmpBeVZDZHNwL1l0Y1FxSmJMN3RuQmlnb0dVYVh1dG9vWjV2?=
 =?utf-8?B?NlROUjlDZmMvblE5T1luait2VGtJTHVQSHhnc2oxTkd6dFBqQkdKT1lQUzIz?=
 =?utf-8?B?SllsMUVHWUlWUkJJWVFPSndxd25QQTZnRWhWc2F5NlNkcVhjMkdJUkZMN1lp?=
 =?utf-8?B?Yyt1QUlkZ0pjQ201Q09vL3BjejZ0Unc1Ti85N1lyMWxsb0Q2alZKbExTcDZO?=
 =?utf-8?B?dEdXTldwTmwxTDNEZCt2c2RNQ3dXQmE4ZUtlcXFrU3VkcWNFQ2lHOURvTVRQ?=
 =?utf-8?B?Zlk3eFlZM3IrU2wxc25SWnRWVzVTbzd2NUNySHVKQ1cvTnEzMXFMcnFqTXhB?=
 =?utf-8?B?ZXY5dU1WenZuT01sUXcwSG1ia2ZhZTBETFFaQjBFZStsdkhraTdsQ2xlSGhq?=
 =?utf-8?B?em9MUEFvN1h0d204TmRzTm1xdWU0OG01SHBDRXRORWY5Vm5TWGtqeitUME5o?=
 =?utf-8?B?eDdTaWFTalJEZ2wycmErM0trWExFcU1kbFZmNkc3cWpoSEw0a0RZaFA1MWQ4?=
 =?utf-8?B?eW5SZWlGVXB5UTIxMTJyWUZDRU8rTTlMVm9oejZMOWdoQno3NWU2cWRvSk1m?=
 =?utf-8?B?STA3OG8xd1NFVmpBcHduZjI0WUxVM3pvcmRHdU96dTIxalNKQjZiOFplNFQ4?=
 =?utf-8?B?RSt0ajFaUlo1Z1docm9zVWNuaFVMcmVoZVlEaFBwejFTdHI0ais0T2IzbCs4?=
 =?utf-8?B?MHpiU0VKaFVHYzc1T2ZGRENPb1FVSDVJVUhWSjk4bEp5ZzFydFliOXE4S2Vs?=
 =?utf-8?B?WS81S2s0N3cxS2Q4b3BmcTA1azl4V1J5SFVUamIxNTk5M3NJUjM5eFJnM3RG?=
 =?utf-8?B?T3pQVnpkVHZTZmNpTGd3eEdPTUJ1NW8raU9qMWRXK0xsVXRMdlBRVjJvalIx?=
 =?utf-8?B?TVFncC9uSktCQ0F4ZU9qTjAvTFNXUWtVVGVnM2oyK29Mekg4ZkplSmJMYllN?=
 =?utf-8?B?a0pjWEk1V3d3S2syVTNsbTRIdHRUS2MxcTdxZWhJdFpxcGR3a2dJQnI1dnJn?=
 =?utf-8?B?cGZJbVVrYloyTTcvcWZDdzRWdjI1cjZ6QkR0OFBWT2pGdHdwUkpraktjVE9Q?=
 =?utf-8?B?SExGM0pZczRnM2ZWRVNvN3ZrdWlleWtOb2Jud281bFE0VzhiWHdhZWhZRk1T?=
 =?utf-8?B?RmVGWkxTTGY4ZXdwZ05Qc3ZUa2VvQjVwVVcxYVk4VjVJSE04YjY5UXgxZjJw?=
 =?utf-8?Q?Y7FXGRlp8Prvv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7472e6e3-3219-4d1b-65db-08d90fcdaaf1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 13:57:06.3043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqVwTy2Sw/aK+2gsKGzGywG0za2uq/IKTti2J6mVQxQZLyMgoAfWOE2pQVTGYBiw1m6kDz1pPx1cVqMVAXiIFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2656
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZwoKQW5kcmV5CgpPbiAyMDIxLTA0LTMwIDEyOjEwIHAubS4sIEFuZHJleSBHcm9kem92c2t5
IHdyb3RlOgo+IAo+IAo+IE9uIDIwMjEtMDQtMzAgMjo0NyBhLm0uLCBDaHJpc3RpYW4gS8O2bmln
IHdyb3RlOgo+Pgo+Pgo+PiBBbSAyOS4wNC4yMSB1bSAxOTowNiBzY2hyaWViIEFuZHJleSBHcm9k
em92c2t5Ogo+Pj4KPj4+Cj4+PiBPbiAyMDIxLTA0LTI5IDM6MTggYS5tLiwgQ2hyaXN0aWFuIEvD
tm5pZyB3cm90ZToKPj4+PiBJIG5lZWQgdG8gdGFrZSBhbm90aGVyIGxvb2sgYXQgdGhpcyBwYXJ0
IHdoZW4gSSBkb24ndCBoYXZlIGEgbWFzc2l2ZSAKPj4+PiBoZWFkYWNoZSBhbnkgbW9yZS4KPj4+
Pgo+Pj4+IE1heWJlIHNwbGl0IHRoZSBwYXRjaCBzZXQgdXAgaW50byBkaWZmZXJlbnQgcGFydHMs
IHNvbWV0aGluZyBsaWtlOgo+Pj4+IDEuIEFkZGluZyBnZW5lcmFsIGluZnJhc3RydWN0dXJlLgo+
Pj4+IDIuIE1ha2luZyBzdXJlIGFsbCBtZW1vcnkgaXMgdW5wb2xhdGVkLgo+Pj4+IDMuIEpvYiBh
bmQgZmVuY2UgaGFuZGxpbmcKPj4+Cj4+PiBJIGFtIG5vdCBzdXJlIHlvdSBtZWFuIHRoaXMgcGF0
Y2ggaGVyZSwgbWF5YmUgYW5vdGhlciBvbmUgPwo+Pj4gQWxzbyBub3RlIHlvdSBhbHJlYWR5IFJC
ZWQgaXQuCj4+Cj4+IE5vIHdoYXQgSSBtZWFudCB3YXMgdG8gc2VuZCBvdXQgdGhlIHBhdGNoZXMg
YmVmb3JlIHRoaXMgb25lIGFzICMxIGFuZCAjMi4KPj4KPj4gVGhhdCBpcyB0aGUgZWFzaWVyIHN0
dWZmIHdoaWNoIGNhbiBlYXNpbHkgZ28gaW50byB0aGUgZHJtLW1pc2MtbmV4dCBvciAKPj4gYW1k
LXN0YWdpbmctZHJtLW5leHQgYnJhbmNoLgo+Pgo+PiBUaGUgc2NoZWR1bGVyIHN0dWZmIGNlcnRh
aW5seSBuZWVkIHRvIGdvIGludG8gZHJtLW1pc2MtbmV4dC4KPj4KPj4gQ2hyaXN0aWFuLgo+IAo+
IEdvdCB5b3UuIEkgYW0gZmluZSB3aXRoIGl0LiBXaGF0IHdlIGhhdmUgaGVyZSBpcyBhIHdvcmtp
bmcgaG90LXVucGx1Zwo+IGNvZGUgYnV0LCBvbmUgd2l0aCBwb3RlbnRpYWwgdXNlIGFmdGVyIGZy
ZWUgTU1JTyByYW5nZXMgZnJwb20gdGhlIHpvbWJpZQo+IGRldmljZS4gVGhlIGZvbGxvd3VwIHBh
dGNoZXMgYWZ0ZXIgdGhpcyBwYXRjaCBhcmUgYWxsIGFib3V0IHByZXZlbnRpbmcKPiB0aGlzIGFu
ZCBzbyB0aGUgcGF0Y2gtc2V0IHVwIHVudGlsIHRoaXMgcGF0Y2ggaW5jbHVkaW5nLCBpcyBmdW5j
dGlvbmFsCj4gb24gaXQncyBvd24uIFdoaWxlIGl0J3MgbmVjZXNzYXJ5IHRvIHNvbHZlIHRoZSBh
Ym92ZSBpc3N1ZSwgaXQncyBoYXMKPiBjb21wbGljYXRpb25zIGFzIGNhbiBiZSBzZWVuIGZyb20g
dGhlIGRpc2N1c3Npb24gd2l0aCBEYW5pZWwgb24gbGF0ZXIKPiBwYXRjaCBpbiB0aGlzIHNlcmll
cy4gU3RpbGwsIGluIG15IG9waW5pb24gaXQncyBiZXR0ZXIgdG8gcm9sbG91dCBzb21lCj4gaW5p
dGlhbCBzdXBwb3J0IHRvIGhvdC11bnBsdWcgd2l0aG91dCB1c2UgYWZ0ZXIgZnJlZSBwcm90ZWN0
aW9uIHRoZW4KPiBoYXZpbmcgbm8gc3VwcG9ydCBmb3IgaG90LXVucGx1ZyBhdCBhbGwuIEl0IHdp
bGwgYWxzbyBtYWtlIHRoZSBtZXJnZQo+IHdvcmsgZWFzaWVyIGFzIEkgbmVlZCB0byBjb25zdGFu
dGx5IHJlYmFzZSB0aGUgcGF0Y2hlcyBvbiB0b3AgbGF0ZXN0Cj4ga2VybmVsIGFuZCBzb2x2ZSBu
ZXcgcmVncmVzc2lvbnMuCj4gCj4gRGFuaWVsIC0gZ2l2ZW4gdGhlIGFyZ3VtZW50cyBhYm92ZSBj
YW4geW91IHNvdW5kIHlvdXIgb3BpbmlvbiBvbiB0aGlzCj4gYXBwcm9hY2ggPwo+IAo+IEFuZHJl
eQo+Pgo+Pj4KPj4+IEFuZHJleQo+Pj4KPj4+Pgo+Pj4+IENocmlzdGlhbi4KPj4+Pgo+Pj4+IEFt
IDI4LjA0LjIxIHVtIDE3OjExIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+IFByb2Js
ZW06IElmIHNjaGVkdWxlciBpcyBhbHJlYWR5IHN0b3BwZWQgYnkgdGhlIHRpbWUgc2NoZWRfZW50
aXR5Cj4+Pj4+IGlzIHJlbGVhc2VkIGFuZCBlbnRpdHkncyBqb2JfcXVldWUgbm90IGVtcHR5IEkg
ZW5jb3VudHJlZAo+Pj4+PiBhIGhhbmcgaW4gZHJtX3NjaGVkX2VudGl0eV9mbHVzaC4gVGhpcyBp
cyBiZWNhdXNlIAo+Pj4+PiBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUKPj4+Pj4gbmV2ZXIgYmVj
b21lcyBmYWxzZS4KPj4+Pj4KPj4+Pj4gRml4OiBJbiBkcm1fc2NoZWRfZmluaSBkZXRhY2ggYWxs
IHNjaGVkX2VudGl0aWVzIGZyb20gdGhlCj4+Pj4+IHNjaGVkdWxlcidzIHJ1biBxdWV1ZXMuIFRo
aXMgd2lsbCBzYXRpc2Z5IGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZS4KPj4+Pj4gQWxzbyB3YWtl
dXAgYWxsIHRob3NlIHByb2Nlc3NlcyBzdHVjayBpbiBzY2hlZF9lbnRpdHkgZmx1c2hpbmcKPj4+
Pj4gYXMgdGhlIHNjaGVkdWxlciBtYWluIHRocmVhZCB3aGljaCB3YWtlcyB0aGVtIHVwIGlzIHN0
b3BwZWQgYnkgbm93Lgo+Pj4+Pgo+Pj4+PiB2MjoKPj4+Pj4gUmV2ZXJzZSBvcmRlciBvZiBkcm1f
c2NoZWRfcnFfcmVtb3ZlX2VudGl0eSBhbmQgbWFya2luZwo+Pj4+PiBzX2VudGl0eSBhcyBzdG9w
cGVkIHRvIHByZXZlbnQgcmVpbnNlcmlvbiBiYWNrIHRvIHJxIGR1ZQo+Pj4+PiB0byByYWNlLgo+
Pj4+Pgo+Pj4+PiB2MzoKPj4+Pj4gRHJvcCBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSwgb25s
eSBtb2RpZnkgZW50aXR5LT5zdG9wcGVkCj4+Pj4+IGFuZCBjaGVjayBmb3IgaXQgaW4gZHJtX3Nj
aGVkX2VudGl0eV9pc19pZGxlCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9k
em92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4+PiBSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4+PiAtLS0KPj4+Pj4g
wqAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYyB8wqAgMyArKy0KPj4+
Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmPCoMKgIHwgMjQgCj4+
Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDI2
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgCj4+Pj4+IGIvZHJpdmVycy9n
cHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwo+Pj4+PiBpbmRleCBmMDc5MGU5NDcxZDEu
LmNiNThmNjkyZGFkOSAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxl
ci9zY2hlZF9lbnRpdHkuYwo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX2VudGl0eS5jCj4+Pj4+IEBAIC0xMTYsNyArMTE2LDggQEAgc3RhdGljIGJvb2wgZHJtX3Nj
aGVkX2VudGl0eV9pc19pZGxlKHN0cnVjdCAKPj4+Pj4gZHJtX3NjaGVkX2VudGl0eSAqZW50aXR5
KQo+Pj4+PiDCoMKgwqDCoMKgIHJtYigpOyAvKiBmb3IgbGlzdF9lbXB0eSB0byB3b3JrIHdpdGhv
dXQgbG9jayAqLwo+Pj4+PiDCoMKgwqDCoMKgIGlmIChsaXN0X2VtcHR5KCZlbnRpdHktPmxpc3Qp
IHx8Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBzcHNjX3F1ZXVlX2NvdW50KCZlbnRpdHktPmpvYl9x
dWV1ZSkgPT0gMCkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHNwc2NfcXVldWVfY291bnQoJmVudGl0
eS0+am9iX3F1ZXVlKSA9PSAwIHx8Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBlbnRpdHktPnN0b3Bw
ZWQpCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+Pj4gwqDCoMKgwqDC
oCByZXR1cm4gZmFsc2U7Cj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uYyAKPj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVk
X21haW4uYwo+Pj4+PiBpbmRleCA5MDhiMGI1NjAzMmQuLmJhMDg3MzU0ZDBhOCAxMDA2NDQKPj4+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+Pj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4+Pj4gQEAgLTg5Nyw5
ICs4OTcsMzMgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfaW5pdCk7Cj4+Pj4+IMKgwqAgKi8K
Pj4+Pj4gwqAgdm9pZCBkcm1fc2NoZWRfZmluaShzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNj
aGVkKQo+Pj4+PiDCoCB7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHkgKnNf
ZW50aXR5Owo+Pj4+PiArwqDCoMKgIGludCBpOwo+Pj4+PiArCj4+Pj4+IMKgwqDCoMKgwqAgaWYg
KHNjaGVkLT50aHJlYWQpCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBrdGhyZWFkX3N0b3Aoc2No
ZWQtPnRocmVhZCk7Cj4+Pj4+ICvCoMKgwqAgZm9yIChpID0gRFJNX1NDSEVEX1BSSU9SSVRZX0NP
VU5UIC0gMTsgaSA+PSAKPj4+Pj4gRFJNX1NDSEVEX1BSSU9SSVRZX01JTjsgaS0tKSB7Cj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX3JxICpycSA9ICZzY2hlZC0+c2NoZWRf
cnFbaV07Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmICghcnEpCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBzcGluX2xvY2soJnJxLT5sb2NrKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGxpc3RfZm9yX2Vh
Y2hfZW50cnkoc19lbnRpdHksICZycS0+ZW50aXRpZXMsIGxpc3QpCj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC8qCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBQcmV2ZW50
cyByZWluc2VydGlvbiBhbmQgbWFya3Mgam9iX3F1ZXVlIGFzIGlkbGUsCj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKiBpdCB3aWxsIHJlbW92ZWQgZnJvbSBycSBpbiBkcm1fc2NoZWRf
ZW50aXR5X2ZpbmkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGV2ZW50dWFsbHkK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzX2VudGl0eS0+c3RvcHBlZCA9IHRydWU7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBz
cGluX3VubG9jaygmcnEtPmxvY2spOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgfQo+Pj4+PiArCj4+
Pj4+ICvCoMKgwqAgLyogV2FrZXVwIGV2ZXJ5b25lIHN0dWNrIGluIGRybV9zY2hlZF9lbnRpdHlf
Zmx1c2ggZm9yIHRoaXMgCj4+Pj4+IHNjaGVkdWxlciAqLwo+Pj4+PiArwqDCoMKgIHdha2VfdXBf
YWxsKCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7Cj4+Pj4+ICsKPj4+Pj4gwqDCoMKgwqDCoCAvKiBD
b25maXJtIG5vIHdvcmsgbGVmdCBiZWhpbmQgYWNjZXNzaW5nIGRldmljZSBzdHJ1Y3R1cmVzICov
Cj4+Pj4+IMKgwqDCoMKgwqAgY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZzY2hlZC0+d29ya190
ZHIpOwo+Pj4+Cj4+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
