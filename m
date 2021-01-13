Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDEB2F4D5B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD9A6EA10;
	Wed, 13 Jan 2021 14:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B0D6EA10;
 Wed, 13 Jan 2021 14:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5YwBbuxPXpZEFt9HXeIEv7egiKMHsMhiqtvRJPNa+X5QsDB3NH5MH+0IbEKloEpPNfShIst9v86wX2UnqiijBkKJgqc/fCH3Rc+jd7cVsunE8IDJjXh3lcMAyEGipFFoNzQTzuk6dyy7TgMX7KqItIvj+mcTGa35NDHkNv7Pg4W9swe4Bd9sqU5+NE4pZvCN81ZNVviImVc8Mu9oNGGE2mdsyDLJJZw1gUEH4hSjw++apNCnU+qAJZAXbMnVjjdT/BN6PIrP7D9/AIrvgkuaGG5H4N1rW+FCjvcmDRyWofKk/nojyr48kSQRLo6njVKCnwsjijYg991WawMR8Bxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiZ77z+cQiPii8ZLOexkq0GXrujeU7h/709NQpQGZk4=;
 b=lgcDqw1JtX5E/if5PtoVET0f7co1SsA011FQiI2+cxCIeie9K+NA4/Jd9SLt5Gtu8n+WHMHQJ/VrIKBVjqkHxN6cafA1xAtBTzL4KOpNHKSuyKgaY4yZTGYxE/tr8mf+5NEeDBVhE2Ji1KheLRlOhNzxB7rClv0AGYF9BOGurobNI64/cE2eT89Ibmmjh1EFiMceob4i1yivpuRO0jGlR63KTn6dXKCLX7NziF9dlFgZc6ex89fPukAxe5o6rlJ7CnQLx+oMLrfOfvaLzGCf+fQI8TLcX6df8CvJhb+Vps7pC4Trbd5ifi2rcbzQ2LoiG42UZQVAnQVUffXevrlNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiZ77z+cQiPii8ZLOexkq0GXrujeU7h/709NQpQGZk4=;
 b=WuTOGtauLm9pmXakT9FQ8XqjH3sbRelRIh98Z7DhDq1xTMpFWpfVqs1SrK5ivE3bsPHBQHVk/+4ypYd4Tp2Iow7rIlvfLrNRoHcvbrdTVtFfMBmzKva6LR+YYXJqKTtPo19ROqlMyiQHNERBpo0798OEYZIH0OXuZhuml/AiBPk=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4576.namprd12.prod.outlook.com (2603:10b6:806:93::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 13 Jan
 2021 14:40:23 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3742.012; Wed, 13 Jan 2021
 14:40:23 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
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
 <20669765-8656-0933-ff86-15fc722f9bd8@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <8604c3bb-7613-7b08-c76f-47b46603f46f@amd.com>
Date: Wed, 13 Jan 2021 09:40:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20669765-8656-0933-ff86-15fc722f9bd8@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0::799c]
X-ClientProxiedBy: YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::39) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0::799c] (2607:fea8:3edf:49b0::799c) by
 YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Wed, 13 Jan 2021 14:40:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 59989b56-58e9-4b8a-6526-08d8b7d128a9
X-MS-TrafficTypeDiagnostic: SA0PR12MB4576:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4576484A79EC73171E909B50EAA90@SA0PR12MB4576.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V6seWbVxH3Q09twy4TVyPbGXWBDVtVQ8RMFcbnCjsR/t/KUFnGgl2Jdgn+QMtr6huFGI9uNYSaBjEv2RayeJLLu8x2BE1fCwb4E4jX//tdlshDUkUsri1gQQI0roqGVBGxq70lCZfkc9PqaDZJUtbkp0lelB4NfuMLC+6AFvYk4BXkQYu2flUAJ45J/8KhfKo7OSxsrbnUlZrjWRz+qrqGoL4gAe/eDmQQjEcbUka+xDnkRsftlD5xU+0jjkmhftn7Ed4cnD9UsGO6tcSbCB2D1R47RqCAA3tm7Cz0ocmYvawp/plXqsNh7/w0gol38/D7om7p8fTb7BZ8FUGw0Nexbc3Ap8tXrCgfmqEuqwKRtE6C3O2R3zkkNYPKkQVGrNM9bYT9d27zwrh1lYOSH7xZzlkvjGZ7Xl+3pX0b72OjIO8P7KafK/bxOsv7SEwMOXZBasIMUMCfLF81rmwOuVLreZmVDX3xmQ9OjUKw6lzrs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(366004)(66574015)(53546011)(31696002)(7416002)(6486002)(5660300002)(8936002)(52116002)(36756003)(478600001)(2906002)(86362001)(54906003)(66946007)(66476007)(66556008)(110136005)(31686004)(2616005)(316002)(4326008)(8676002)(186003)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TENBOGtacS9ObnJ6S1Jsc2lnSEZ6WWJLWjIxd3NOeXF1ZUpuckMvbHk0Zy8r?=
 =?utf-8?B?OVhTcG1yTVZqRWRvaEpyb2xkYjFCU3NyNWt3clVidmRlWmgvanZEQUtON1J0?=
 =?utf-8?B?L1RrQy93OFMrcEFSV2ZQdUt5eWVQeUgzVFBYLy9nR0ZsWEhwUlp5TnJaNldt?=
 =?utf-8?B?WEJBQndVYkdRMUUzWFZ0cW1RZnFVeDBTdEt4RXlRV2t2Y0crbUZJRXIxU1M5?=
 =?utf-8?B?VjZ6cWdnSCtuaStKQ0ZtVG1xaExZRmhHeGN6UlJNbXVxSFg0cVcycjNrMjA1?=
 =?utf-8?B?SjlINUc1UDZUeDljTUFuaXF0aHlteXdSVllMdkVmVkI2SmJOY2Z5WmJrWWp5?=
 =?utf-8?B?SGl4NTNvVzZJd1UrSlpFMUFLMTA1MjRlWlUxbS9Seit6MUFxZmlBYXkvY0VI?=
 =?utf-8?B?U2FOWDlNNFptWUY1TlI4QVBQeE9nbVdJVnpPTmQyaTYzeGovSmUrM3Z1Vmpw?=
 =?utf-8?B?M0F0cG1namRLWXphTHVFa0dTcW9aZ0RjVXhGc2pLMnZ0dWptZVdkTzJTQXZY?=
 =?utf-8?B?Vzh0UHZZdkZUdnBiSndFb3V2SjdOb1NMOW04dVVpdEg2QXZ4WUc3dkMwRjBK?=
 =?utf-8?B?Q01qaU9LenJ4MkQ2YlNNdkF0N3FnbG1QUFdwN29RUFVSMGhSL0dvMy9UR3ZQ?=
 =?utf-8?B?T1hNUHlZdHRSaUhzNHJsblN6NXpZRHd1ZWlmUDdVc0VKSW5leGNsT09OZTlB?=
 =?utf-8?B?cHlZUWNhREJmL0x2S2IzNWV6cWlSRGR4bFdSOEFPQXVGMFVyRy9YemNIeExV?=
 =?utf-8?B?WGFKdWJSRDV5L1JwK3NXRUU5b1JVWmRid2pIcFFXbmlVY2w1YjBETDRFQ2Na?=
 =?utf-8?B?SE5ZN2twZEdRcUd1OUdDZUpFMTdSOTRTS252RGVLZW9aeFlxR3hGTGFhRGx5?=
 =?utf-8?B?Z3k0WG1NV1hwNUlQZ1hsbW5VOWJzaUc0bkljZ0RyQmZmY2hCNi8yWWpRVzVz?=
 =?utf-8?B?ZWI0U3Zra0tSY2c5bW1ZV2hoaVViL1lScEw3dUlFNGdNa1lDaXp2Y0FCd1Fk?=
 =?utf-8?B?SjNHQzdVbkNwT2NjTm9vckplMkFpOU5BSjg1SXRoU3JTMi9veDAwZXdyQjls?=
 =?utf-8?B?cVBpQXo1bWt6U2k5TUV3TVdvMlNQYkFWOEFZZ3NZWkxqdHNZS3gzRVpvUnRp?=
 =?utf-8?B?SVFaanZFeVZTd09SWmZ2MngrVkptb2RTQmgybElrd2NJQXR6bnJaV3BJSGE2?=
 =?utf-8?B?M2MxZmNEbUVpSDl2VUwwWnNjSWNqbnQxcEc1YjVQTXVBMUN2Y1pucGxHNVRG?=
 =?utf-8?B?UjBDWjV0Z0Y4YmZCbXZnTzF0RXVNSTdLc2VpcGlVaUVMNlNYd2JwZXJTVkdJ?=
 =?utf-8?B?Z25RUDFvdVo3dHNFQ0VSeFdiOUJiOTA2ZDZnWU5tUm9BZ3U0bVFZSVBTUTVG?=
 =?utf-8?B?N2tnNWFiWkVBMFE9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2021 14:40:22.9973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 59989b56-58e9-4b8a-6526-08d8b7d128a9
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyMVZIFWjHa7/y6rzgs/dMVa55EzfZxeYz3nRmMcwS37GFvtYhE/GA0TNTfAsUvA/gSqnwuQAqYsQJjtgVM19g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4576
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

Ck9uIDEvMTMvMjEgNDoxNCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAxMi4wMS4y
MSB1bSAxNjo1OSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pgo+PiBPbiAxLzEyLzIxIDc6
MzIgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAxMi4wMS4yMSB1bSAxMDoxMCBz
Y2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+Pj4gT24gTW9uLCBKYW4gMTEsIDIwMjEgYXQgMDM6NDU6
MTBQTSAtMDUwMCwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pj4+IE9uIDEvMTEvMjEgMTE6
MTUgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+PiBPbiBNb24sIEphbiAxMSwgMjAyMSBh
dCAwNToxMzo1NlBNICswMTAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+Pj4+Pj4+IE9uIEZyaSwg
SmFuIDA4LCAyMDIxIGF0IDA0OjQ5OjU1UE0gKzAwMDAsIEdyb2R6b3Zza3ksIEFuZHJleSB3cm90
ZToKPj4+Pj4+Pj4gT2sgdGhlbiwgSSBndWVzcyBJIHdpbGwgcHJvY2VlZCB3aXRoIHRoZSBkdW1t
eSBwYWdlcyBsaXN0IAo+Pj4+Pj4+PiBpbXBsZW1lbnRhdGlvbiB0aGVuLgo+Pj4+Pj4+Pgo+Pj4+
Pj4+PiBBbmRyZXkKPj4+Pj4+Pj4KPj4+Pj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4+Pj4+Pj4gRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdA
YW1kLmNvbT4KPj4+Pj4+Pj4gU2VudDogMDggSmFudWFyeSAyMDIxIDA5OjUyCj4+Pj4+Pj4+IFRv
OiBHcm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+OyBEYW5pZWwg
VmV0dGVyIAo+Pj4+Pj4+PiA8ZGFuaWVsQGZmd2xsLmNoPgo+Pj4+Pj4+PiBDYzogYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgCj4+
Pj4+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc+OyAKPj4+Pj4+Pj4gZGFuaWVsLnZldHRlckBmZndsbC5jaCA8ZGFuaWVs
LnZldHRlckBmZndsbC5jaD47IHJvYmhAa2VybmVsLm9yZyAKPj4+Pj4+Pj4gPHJvYmhAa2VybmVs
Lm9yZz47IGwuc3RhY2hAcGVuZ3V0cm9uaXguZGUgPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+OyAK
Pj4+Pj4+Pj4geXVxODI1QGdtYWlsLmNvbSA8eXVxODI1QGdtYWlsLmNvbT47IGVyaWNAYW5ob2x0
Lm5ldCA8ZXJpY0BhbmhvbHQubmV0PjsgCj4+Pj4+Pj4+IERldWNoZXIsIEFsZXhhbmRlciA8QWxl
eGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IAo+Pj4+Pj4+PiBncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZyA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyAKPj4+Pj4+Pj4gcHBhYWxhbmVuQGdt
YWlsLmNvbSA8cHBhYWxhbmVuQGdtYWlsLmNvbT47IFdlbnRsYW5kLCBIYXJyeSAKPj4+Pj4+Pj4g
PEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+Cj4+Pj4+Pj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMg
MDEvMTJdIGRybTogQWRkIGR1bW15IHBhZ2UgcGVyIGRldmljZSBvciBHRU0gb2JqZWN0Cj4+Pj4+
Pj4+Cj4+Pj4+Pj4+IE1obSwgSSdtIG5vdCBhd2FyZSBvZiBhbnkgbGV0IG92ZXIgcG9pbnRlciBi
ZXR3ZWVuIFRUTSBhbmQgR0VNIGFuZCB3ZQo+Pj4+Pj4+PiB3b3JrZWQgcXVpdGUgaGFyZCBvbiBy
ZWR1Y2luZyB0aGUgc2l6ZSBvZiB0aGUgYW1kZ3B1X2JvLCBzbyBhbm90aGVyCj4+Pj4+Pj4+IGV4
dHJhIHBvaW50ZXIganVzdCBmb3IgdGhhdCBjb3JuZXIgY2FzZSB3b3VsZCBzdWNrIHF1aXRlIGEg
Yml0Lgo+Pj4+Pj4+IFdlIGhhdmUgYSB0b24gb2Ygb3RoZXIgcG9pbnRlcnMgaW4gc3RydWN0IGFt
ZGdwdV9ibyAob3IgYW55IG9mIGl0J3MgbG93ZXIKPj4+Pj4+PiB0aGluZ3MpIHdoaWNoIGFyZSBm
YWlybHkgc2luZ2xlLXVzZSwgc28gSSdtIHJlYWxseSBub3QgbXVjaCBzZWVpbmcgdGhlCj4+Pj4+
Pj4gcG9pbnQgaW4gbWFraW5nIHRoaXMgYSBzcGVjaWFsIGNhc2UuIEl0IGFsc28gbWVhbnMgdGhl
IGxpZmV0aW1lIG1hbmFnZW1lbnQKPj4+Pj4+PiBiZWNvbWVzIGEgYml0IGlmZnksIHNpbmNlIHdl
IGNhbid0IHRocm93IGF3YXkgdGhlIGR1bW15IHBhZ2UgdGhlbiB0aGUgbGFzdAo+Pj4+Pj4+IHJl
ZmVyZW5jZSB0byB0aGUgYm8gaXMgcmVsZWFzZWQgKHNpbmNlIHdlIGRvbid0IHRyYWNrIGl0IHRo
ZXJlKSwgYnV0IG9ubHkKPj4+Pj4+PiB3aGVuIHRoZSBsYXN0IHBvaW50ZXIgdG8gdGhlIGRldmlj
ZSBpcyByZWxlYXNlZC4gUG90ZW50aWFsbHkgdGhpcyBtZWFucyBhCj4+Pj4+Pj4gcGlsZSBvZiBk
YW5nbGluZyBwYWdlcyBoYW5naW5nIGFyb3VuZCBmb3IgdG9vIGxvbmcuCj4+Pj4+PiBBbHNvIGlm
IHlvdSByZWFsbHksIHJlYWxseSwgcmVhbGx5IHdhbnQgdG8gaGF2ZSB0aGlzIGxpc3QsIHBsZWFz
ZSBkb24ndAo+Pj4+Pj4gcmVpbnZlbnQgaXQgc2luY2Ugd2UgaGF2ZSBpdCBhbHJlYWR5LiBkcm1t
XyBpcyBleGFjdGx5IG1lYW50IGZvciByZXNvdXJjZXMKPj4+Pj4+IHRoYXQgc2hvdWxkIGJlIGZy
ZWVkIHdoZW4gdGhlIGZpbmFsIGRybV9kZXZpY2UgcmVmZXJlbmNlIGRpc2FwcGVhcnMuCj4+Pj4+
PiAtRGFuaWVsCj4+Pj4+Cj4+Pj4+IEkgbWF5YmUgd2FzIGVhZ2VyIHRvIGVhcmx5LCBzZWUgaSBu
ZWVkIHRvIGV4cGxpY2l0bHkgYWxsb2NhdGUgdGhlIGR1bW15IHBhZ2UKPj4+Pj4gdXNpbmcgcGFn
ZV9hbGxvYyBzbwo+Pj4+PiBpIGNhbm5vdCB1c2UgZHJtbV9rbWFsbG9jIGZvciB0aGlzLCBzbyBv
bmNlIGFnYWluIGxpa2Ugd2l0aCB0aGUgbGlzdCBpIG5lZWQKPj4+Pj4gdG8gd3JhcCBpdCB3aXRo
IGEgY29udGFpbmVyIHN0cnVjdAo+Pj4+PiB3aGljaCBpIGNhbiB0aGVuIGFsbG9jYXRlIHVzaW5n
IGRybW1fa21hbGxvYyBhbmQgaW5zaWRlIHRoZXJlIHdpbGwgYmUgcGFnZQo+Pj4+PiBwb2ludGVy
LiBCdXQgdGhlbgo+Pj4+PiBvbiByZWxlYXNlIGl0IG5lZWRzIHRvIGZyZWUgdGhlIHBhZ2UgYW5k
IHNvIGkgc3VwcG9zZWRseSBuZWVkIHRvIHVzZSAKPj4+Pj4gZHJtbV9hZGRfYWN0aW9uCj4+Pj4+
IHRvIGZyZWUgdGhlIHBhZ2UgYmVmb3JlIHRoZSBjb250YWluZXIgc3RydWN0IGlzIHJlbGVhc2Vk
IGJ1dCBkcm1tX2ttYWxsb2MKPj4+Pj4gZG9lc24ndCBhbGxvdyB0byBzZXQKPj4+Pj4gcmVsZWFz
ZSBhY3Rpb24gb24gc3RydWN0IGFsbG9jYXRpb24uIFNvIEkgY3JlYXRlZCBhIG5ldwo+Pj4+PiBk
cm1tX2ttYWxsb2Nfd2l0aF9hY3Rpb24gQVBJIGZ1bmN0aW9uCj4+Pj4+IGJ1dCB0aGVuIHlvdSBh
bHNvIG5lZWQgdG8gc3VwcGx5IHRoZSBvcHRpb25hbCBkYXRhIHBvaW50ZXIgZm9yIHRoZSByZWxl
YXNlCj4+Pj4+IGFjdGlvbiAodGhlIHN0cnVjdCBwYWdlIGluIHRoaXMgY2FzZSkKPj4+Pj4gYW5k
IHNvIHRoaXMgYWxsIGJlY29tZXMgYSBiaXQgb3ZlcmNvbXBsaWNhdGVkIChidXQgZG9hYmxlKS4g
SXMgdGhpcyBleHRyYQo+Pj4+PiBBUEkgd29ydGggYWRkaW5nID8gTWF5YmUgaXQgY2FuCj4+Pj4+
IGJlIHVzZWZ1bCBpbiBnZW5lcmFsLgo+Pj4+IGRybV9hZGRfYWN0aW9uX29yX3Jlc2V0IChmb3Ig
YmV0dGVyIGNvbnRyb2wgZmxvdykgaGFzIGJvdGggYSB2b2lkICogZGF0YQo+Pj4+IGFuZCBhIGNs
ZWFudXAgZnVuY3Rpb24gKGFuZCBpdCBpbnRlcm5hbGx5IGFsbG9jYXRlcyB0aGUgdHJhY2tpbmcg
c3RydWN0dXJlCj4+Pj4gZm9yIHRoYXQgZm9yIHlvdSkuIFNvIHNob3VsZCB3b3JrIGFzLWlzPyBB
bGxvY2F0aW5nIGEgdHJhY2tpbmcgc3RydWN0dXJlCj4+Pj4gZm9yIG91ciB0cmFja2luZyBzdHJ1
Y3R1cmUgZm9yIGEgcGFnZSB3b3VsZCBkZWZpbml0ZWx5IGJlIGEgYml0IHRvbyBtdWNoLgo+Pj4+
Cj4+Pj4gRXNzZW50aWFsbCBkcm1tX2FkZF9hY3Rpb24gaXMgeW91ciBrY2FsbG9jX3dpdGhfYWN0
aW9uIGZ1bmN0aW9uIHlvdSB3YW50LAo+Pj4+IGFzIGxvbmcgYXMgYWxsIHlvdSBuZWVkIGlzIGEg
c2luZ2xlIHZvaWQgKiBwb2ludGVyICh3ZSBjb3VsZCBkbyB0aGUKPj4+PiBremFsbG9jX3dpdGhf
YWN0aW9uIHRob3VnaCwgdGhlcmUncyBlbm91Z2ggc3BhY2UsIGp1c3Qgbm8gbmVlZCB5ZXQgZm9y
IGFueQo+Pj4+IG9mIHRoZSBjdXJyZW50IHVzZXJzKS4KPj4+Cj4+PiBZZWFoLCBidXQgbXkgdGhp
bmtpbmcgd2FzIHRoYXQgd2Ugc2hvdWxkIHVzZSB0aGUgcGFnZSBMUlUgZm9yIHRoaXMgYW5kIG5v
dCAKPj4+IGFub3RoZXIgY29udGFpbmVyIHN0cnVjdHVyZS4KPj4+Cj4+PiBDaHJpc3RpYW4uCj4+
Cj4+Cj4+IFdoaWNoIHNwZWNpZmljIGxpc3QgZGlkIHlvdSBtZWFuID8KPgo+IFRoZSBzdHJ1Y3Qg
cGFnZSAqIHlvdSBnZXQgZnJvbSBnZXRfZnJlZV9wYWdlKCkgYWxyZWFkeSBoYXMgYW4gbHJ1IG1l
bWJlciBvZiAKPiB0eXBlIGxpc3RfaGVhZC4KPgo+IFRoaXMgd2F5IHlvdSBjYW4gbGluayBwYWdl
cyB0b2dldGhlciBmb3IgbGF0ZXIgZGVzdHJ1Y3Rpb24gd2l0aG91dCB0aGUgbmVlZCBvZiAKPiBh
IGNvbnRhaW5lciBvYmplY3QuCj4KPiBDaHJpc3RpYW4uCgoKSSBnZXQgaXQgbm93LCB0aGlzIGlz
IGEgZ29vZCBhZHZpc2UsIGFuZCBpbmRlZWQgbWFrZXMgdGhlIGNvbnRhaW5lciBzdHJ1Y3QgaSAK
Y3JlYXRlZCBvYnNvbGV0ZSBidXQsIGN1cnJlbnRseSBJIGFtIGdvaW5nCndpdGggRGFuaWVsJ3Mg
c3VnZ2VzdGlvbiB0byB1c2UgZHJtX2FkZF9hY3Rpb25fb3JfcmVzZXQgd2hpY2ggbWFrZXMgdGhl
IGxpc3QgCml0c2VsZiBhbHNvIHVubmVlZGVkLgoKQW5kcmV5CgoKPgo+Pgo+PiBBbmRyZXkKPj4K
Pj4KPj4+Cj4+Pj4gLURhbmllbAo+Pj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
