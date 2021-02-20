Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B0A320532
	for <lists+dri-devel@lfdr.de>; Sat, 20 Feb 2021 13:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BFB96E10A;
	Sat, 20 Feb 2021 12:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2049.outbound.protection.outlook.com [40.107.101.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65006E0B8;
 Sat, 20 Feb 2021 12:12:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IU+DUL2WCsStdYiVD/nwV88iPwYpQUj3gyxHTk9wJ2l23JrW1sSUe4KePWTw89OnSqn0IELL0BmZ1KP3+/J7w/szTNlHzPLtM5NyrnLolr/ZY6xmrM+Rb5iLYxYcszUsKyGmREasAgaH/wfOiQEIkkTKyFIBkAXYlf9beCnsfsaSk59t2nI8p1swP8bFCFyertF/gFD+eZPeO7TIxNyuTTFXz7shF5Vn9CxhlojW6iR591uoHP+XHXt5NibE/rKVj8AdgrsmWNwiSAY3qT+jd5xAmqM/AGyFloPvD9Rf3XEH8OLBIKUXz7YmzUnQ93tspCj2+eI9jw0NHz5YZJdc9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faiZ+sLmKR67m6aecIYNXBK6og2ks+guwtSpXkvn4A8=;
 b=O3fUz/px2p3x3bQdzjofkvU60nyJlWq49tW43Gtfedh7him8fk4z7C7aymlWoWtMuecT3lZdlQIRCCZeVHruzQ8j4yo4LZR8dzyy+gaye3+OKY8kygFQwLUBCzv8LQt6zAmrhxMeINiP38uVpGCDidR40+G9WQ1T+Fp9VRCaY429BqUoB4rhcauQJn9rIKFpcXP4eV/SyCgmkvOUPY5kRCSLvWzq5wMUkV3UjHqgsCd5OYcmmqv8hNEq5L69Us0Nh8BMpNNcQ4QK8o+4pcZsn2pzhizrB9LBduXoiEZZcm5nEGZ0Zyvyb8uAPJ2rwLJ4HoBpdK+0SsVIzdqWfOVcIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faiZ+sLmKR67m6aecIYNXBK6og2ks+guwtSpXkvn4A8=;
 b=C8yJzS/RJkvcws/+Fds4/ZqwSL2vukK0kMECWGrGj0midDDC3cqL6QYuuewlfIvUWPttRMFGps7ybGN7nG4vuO760c6oZocK+M2GY+mWkPhBoTgbRR5jYLbcjXO1QAYyPw1YXHdmV19Uy1jN6919k6+II04VxBuT2yg+K35/m7Q=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2399.namprd12.prod.outlook.com (2603:10b6:802:2b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.29; Sat, 20 Feb
 2021 12:12:23 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3868.031; Sat, 20 Feb 2021
 12:12:23 +0000
Subject: Re: [PATCH v2] drm/scheduler: Fix hang when sched_entity released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613599181-9492-1-git-send-email-andrey.grodzovsky@amd.com>
 <bc2c5ce4-a641-8a5e-bd7b-11174c883e99@gmail.com>
 <6f8dac3e-99eb-1b84-60f9-ee9b24210fbc@amd.com>
 <abcb8ea9-fcb4-a781-bf87-d12f3910e484@gmail.com>
 <74c4a9e1-f1e0-03e5-3c99-755f3cf1b60f@amd.com>
 <bf874237-033c-8eb2-336c-ec79ae9ef941@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <5e52bd1b-107c-ffea-8d29-aae474047859@amd.com>
Date: Sat, 20 Feb 2021 07:12:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <bf874237-033c-8eb2-336c-ec79ae9ef941@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:ee71:e7c3:a44a:e39]
X-ClientProxiedBy: YTOPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::31) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:ee71:e7c3:a44a:e39]
 (2607:fea8:3edf:49b0:ee71:e7c3:a44a:e39) by
 YTOPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31 via Frontend
 Transport; Sat, 20 Feb 2021 12:12:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 42efa10e-87d3-45b0-bd9e-08d8d598c74f
X-MS-TrafficTypeDiagnostic: SN1PR12MB2399:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2399905461183B8CFEE6AEC7EA839@SN1PR12MB2399.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OT7fJOHZ92ID1l+YEx2/xLFcmMHGZE4MXeGpKVws50Kv8CiKjrMApTfNNlL95Wg4JMbBmPP7pFRoykcH9RDRZZ+JJv82qbnUSaM5kNLsSGRIDIRZ8HcbfJZGNTXM1+Y0lmBNAz0saxHAUpXEHeu0eRwcO3hdzpW4y2ZuK3Znl+trst0S77ZMHjFaMqPqAcY9lMCoNFFUnGDes7nWN2AgzMIV0o/Li3anpxHQgxU17wO9uiFz6QYMByoiopalU/uiXciE7eUynUkyd0pNnQzzubiSLoz63g9Idh5HzTQFzinNjsb1yjpbLLRNYvs9JkSBWoKsKUN1TKJocRi0JkamSIUQL2KIvSxkK55P+lnPsT7la17b/rMUrk5j6z7DMmHc8vTm+h3VKsJX/GCueZ57Dh9LsgH/Td5dEgUh1MKZB7W1JPPvf5EsjavoPHCjR446q8TkSMtFhK9trptVpH9mmWhYYYat7i4GxIoMN7l6JQYd5cAwTznMef+MiMNcEvYJ076CJytCUas1+NB+BTC5DSFzLVvbtdH6RgBndIdTJbV1IWRIGnvSlxmY48SJ2k0B3X3JVumfjK3LzEY2JlmuynZUdGmsHnqalnAzR+nuCsM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39840400004)(8676002)(83380400001)(66556008)(66476007)(36756003)(66946007)(2906002)(31696002)(31686004)(66574015)(52116002)(8936002)(53546011)(86362001)(16526019)(316002)(5660300002)(6486002)(186003)(2616005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFVkaUVnSkYrTkpYSUFURHFoMCtVVWd5ZW5rRCt5SjJHdU1sVlZaekxUQ09H?=
 =?utf-8?B?U05uSjFKUEVwR0NCeTh3NTBseGNadEtXYjNvQTFpSDlCRjJEL243SHlWWmJx?=
 =?utf-8?B?cEl2L2FGUUwzK1p6NTE4Z1RiM0VoVEp1ZDRxcncwZ3I5c3JGWFlQNFBuZnpZ?=
 =?utf-8?B?Q3NOc2dldUpNQTdENC9HY0F1UUlkTzVZMVh3NVp2NzE3bmxiRmRFcmtNcnpn?=
 =?utf-8?B?b2ZEUUdDSWxWZXpYY0trU0wzMEpFMHplUnJyOVJWSFdBdEpZcU96UGlmRUVX?=
 =?utf-8?B?WHFHdVRvR3V3dGM3QUl4dXhqcWxXa3N6L3FmNzI2RCsrdEdkam93RUl3ZFJv?=
 =?utf-8?B?SDU4SzFMT3RtdzV2Szl5Q1RtQU1SOWxmVHZaaVZuSlNLcUI0cjhHM3pzUGs2?=
 =?utf-8?B?Vlk1czR6ZGxab3lKM1F3cWZzajFhRWlXSExoenJGY0Roc08xKzRFemdVSE4x?=
 =?utf-8?B?clh5UnZoYmVya1E4YTFnTStRN2xJdDI0a3ROSUFnbnFPMXpGMkI0QnBVU21a?=
 =?utf-8?B?UjhQNWpBcEZkUkJCZkwvN2xCSi9CdXk1TUZXRU5KRkRGTmxVSk1JNDcxdHV5?=
 =?utf-8?B?Slc1bjRneXBGWDdXYWltNHVXOEZFVFE2anNGcVBLWXpjU0UrS1hUdzJZNm5v?=
 =?utf-8?B?cllKNWk2eE00Y3lnbTh5UXVZdkdBRTdMeUVEazR5RlY2aDBUektwZnRnTFdU?=
 =?utf-8?B?UjBKUE44eWJzcVcvams0aGVVV1FlbnVuZ2kzLzNPZ1lHalFHYzI0cDJLZzlz?=
 =?utf-8?B?SlQ0OUs5cWNEQ1pkQ3lhTnZBSjRpOUpYdTZqVWNTTHBCek5uMlJVZDVBb3oz?=
 =?utf-8?B?ZmNDN3B4T1pQdVpwS21rNUFiMmxiSjJUa0NuSXpjSEt2RUdVV0FUWFNlL2ox?=
 =?utf-8?B?VDlVbnNzZFFabHp4aDFldUxLS0Fjem1oalcveGNiSzlYQXBmT2ZsUTNCM2lR?=
 =?utf-8?B?eFFzRUdCeEhHTGIwTXpibm52QTZHYzNWTDF0a0REWk1qWVZBL2NmNXQxQjhJ?=
 =?utf-8?B?V2FvQkRrVVRaSm42eENLZzREVTRWZGVyeHZ3M2pMV283cUh4a3Z0d2hIVlM0?=
 =?utf-8?B?K0kwYzJ2THRFU3RXelluWi9JbE5ndmhOdG5SYi9FVVVTTXhCekpmTVVtY2po?=
 =?utf-8?B?RllHNnVEdm9neW9LRTc2M3hHaGIyWk1jWEpXTUlpVkFpOU5kSW5nZkNHQi9E?=
 =?utf-8?B?ZElIRWVMR2pvdE9rbWFCSUUyelVpL3BCbTliN0ZKcTFVbTF6MmEwY3hNNzFa?=
 =?utf-8?B?bGpqUUFseXcySHZBVDlHZmMrdHJwUm1pT1htcmx3SXFsVitvUERSakZmbitP?=
 =?utf-8?B?RzgrZ0ljeVVwMXNhaUVSaUw0RkxQbzdSYVJpSlRjWUNXT2cvL1FmN25hQWpv?=
 =?utf-8?B?U052SW8zSDNLMldlNG5PZDJ3OXpjeUpVbzk0ZzVHWUpCYWplcmVFTnRsbU1h?=
 =?utf-8?B?L3d0M3V1VDdpOGJWYmtuZGlWa1BoWVd2VlFGVlo2aDZxVk1KaGUwZ1I5dldP?=
 =?utf-8?B?b21jMEFEVytTVzJMeE1FRkpOVjVJL2l6U3hLTjY0YVBXQ29CcTdwYnl5Situ?=
 =?utf-8?B?dElYa1R5WHhiTXR6YU12OVdMMnBiUWlqejNYbzR0emxMdGZIQm5VOGthSnVI?=
 =?utf-8?B?M0FrNUVjaURqTGh3cEZMTk0zOG1STXJqa2lBTFlXK1JyWGhWU3lRMkVEckxj?=
 =?utf-8?B?Q3dJQitzN1pzRlpKRjRmcU16bU5WYlZUMzRNZDgzR1VKbDlSMUQvTWFPd1RT?=
 =?utf-8?B?RWRMbHRTRE1ORDJxM1JaMHFNdklhUUxsL2dkbFp3Nk84Q2NrQkh3aXZkZlcy?=
 =?utf-8?B?NEduYndCWlViMGhPUDlER3c5NXBJZUpMK1cwRVJmZWpadi9reWhpQzJIUFp4?=
 =?utf-8?Q?fLyl6R39EejVP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42efa10e-87d3-45b0-bd9e-08d8d598c74f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2021 12:12:23.3379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSM//Gq1bwkNk7ggzWxgVZWbmfOcPUg+yeQu6+GicxbOUG2HBXB29wqJX6RO6Ws2CSxxaCOvgSVK0pQJNqBaFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2399
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

Ck9uIDIvMjAvMjEgMzozOCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPgo+Cj4gQW0gMTgu
MDIuMjEgdW0gMTc6NDEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4KPj4gT24gMi8xOC8y
MSAxMDoxNSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDE4LjAyLjIxIHVtIDE2
OjA1IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4KPj4+PiBPbiAyLzE4LzIxIDM6MDcg
QU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IEFtIDE3LjAyLjIx
IHVtIDIyOjU5IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+PiBQcm9ibGVtOiBJZiBz
Y2hlZHVsZXIgaXMgYWxyZWFkeSBzdG9wcGVkIGJ5IHRoZSB0aW1lIHNjaGVkX2VudGl0eQo+Pj4+
Pj4gaXMgcmVsZWFzZWQgYW5kIGVudGl0eSdzIGpvYl9xdWV1ZSBub3QgZW1wdHkgSSBlbmNvdW50
cmVkCj4+Pj4+PiBhIGhhbmcgaW4gZHJtX3NjaGVkX2VudGl0eV9mbHVzaC4gVGhpcyBpcyBiZWNh
dXNlIGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZQo+Pj4+Pj4gbmV2ZXIgYmVjb21lcyBmYWxzZS4K
Pj4+Pj4+Cj4+Pj4+PiBGaXg6IEluIGRybV9zY2hlZF9maW5pIGRldGFjaCBhbGwgc2NoZWRfZW50
aXRpZXMgZnJvbSB0aGUKPj4+Pj4+IHNjaGVkdWxlcidzIHJ1biBxdWV1ZXMuIFRoaXMgd2lsbCBz
YXRpc2Z5IGRybV9zY2hlZF9lbnRpdHlfaXNfaWRsZS4KPj4+Pj4+IEFsc28gd2FrZXVwIGFsbCB0
aG9zZSBwcm9jZXNzZXMgc3R1Y2sgaW4gc2NoZWRfZW50aXR5IGZsdXNoaW5nCj4+Pj4+PiBhcyB0
aGUgc2NoZWR1bGVyIG1haW4gdGhyZWFkIHdoaWNoIHdha2VzIHRoZW0gdXAgaXMgc3RvcHBlZCBi
eSBub3cuCj4+Pj4+Pgo+Pj4+Pj4gdjI6Cj4+Pj4+PiBSZXZlcnNlIG9yZGVyIG9mIGRybV9zY2hl
ZF9ycV9yZW1vdmVfZW50aXR5IGFuZCBtYXJraW5nCj4+Pj4+PiBzX2VudGl0eSBhcyBzdG9wcGVk
IHRvIHByZXZlbnQgcmVpbnNlcmlvbiBiYWNrIHRvIHJxIGR1ZQo+Pj4+Pj4gdG8gcmFjZS4KPj4+
Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6
b3Zza3lAYW1kLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3NjaGVk
dWxlci9zY2hlZF9tYWluLmMgfCAzMSAKPj4+Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCj4+Pj4+Pgo+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
IAo+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+Pj4g
aW5kZXggOTA4YjBiNS4uYzZiNzk0NyAxMDA2NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc2No
ZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+Pj4gQEAgLTg5Nyw5ICs4OTcsNDAgQEAgRVhQT1JUX1NZ
TUJPTChkcm1fc2NoZWRfaW5pdCk7Cj4+Pj4+PiDCoMKgICovCj4+Pj4+PiDCoCB2b2lkIGRybV9z
Y2hlZF9maW5pKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpCj4+Pj4+PiDCoCB7Cj4+
Pj4+PiArwqDCoMKgIGludCBpOwo+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0
eSAqc19lbnRpdHk7Cj4+Pj4+Cj4+Pj4+IEJUVzogUGxlYXNlIG9yZGVyIHRoYXQgc28gdGhhdCBp
IGlzIGRlY2xhcmVkIGxhc3QuCj4+Pj4+Cj4+Pj4+PiDCoMKgwqDCoMKgIGlmIChzY2hlZC0+dGhy
ZWFkKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGt0aHJlYWRfc3RvcChzY2hlZC0+dGhyZWFk
KTsKPj4+Pj4+IMKgICvCoMKgwqAgLyogRGV0YWNoIGFsbCBzY2hlZF9lbnRpdGVzIGZyb20gdGhp
cyBzY2hlZHVsZXIgb25jZSBpdCdzIHN0b3BwZWQgKi8KPj4+Pj4+ICvCoMKgwqAgZm9yIChpID0g
RFJNX1NDSEVEX1BSSU9SSVRZX0NPVU5UIC0gMTsgaSA+PSBEUk1fU0NIRURfUFJJT1JJVFlfTUlO
OyAKPj4+Pj4+IGktLSkgewo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRf
cnEgKnJxID0gJnNjaGVkLT5zY2hlZF9ycVtpXTsKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBpZiAoIXJxKQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGludWU7Cj4+
Pj4+PiArCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgLyogTG9vcCB0aGlzIHdheSBiZWNhdXNlIHJx
LT5sb2NrIGlzIHRha2VuIGluIAo+Pj4+Pj4gZHJtX3NjaGVkX3JxX3JlbW92ZV9lbnRpdHkgKi8K
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJnJxLT5sb2NrKTsKPj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCB3aGlsZSAoKHNfZW50aXR5ID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZy
cS0+ZW50aXRpZXMsCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9lbnRpdHksCj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbGlzdCkpKSB7Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX3Vu
bG9jaygmcnEtPmxvY2spOwo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LyogUHJldmVudCByZWluc2VydGlvbiBhbmQgcmVtb3ZlICovCj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzcGluX2xvY2soJnNfZW50aXR5LT5ycV9sb2NrKTsKPj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNfZW50aXR5LT5zdG9wcGVkID0gdHJ1ZTsKPj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5KHJxLCBzX2VudGl0eSk7
Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmc19lbnRpdHktPnJx
X2xvY2spOwo+Pj4+Pgo+Pj4+PiBXZWxsIHRoaXMgc3Bpbl91bmxvY2svbG9jayBkYW5jZSBoZXJl
IGRvZXNuJ3QgbG9vayBjb3JyZWN0IGF0IGFsbCBub3cuCj4+Pj4+Cj4+Pj4+IENocmlzdGlhbi4K
Pj4+Pgo+Pj4+Cj4+Pj4gSW4gd2hhdCB3YXkgPyBJdCdzIGluIHRoZSBzYW1lIHNhbWUgb3JkZXIg
YXMgaW4gb3RoZXIgY2FsbCBzaXRlcyAoc2VlIAo+Pj4+IGRybV9zY2hlZF9lbnRpdHlfcHVzaF9q
b2IgYW5kIGRybV9zY2hlZF9lbnRpdHlfZmx1c2gpLgo+Pj4+IElmIGkganVzdCBsb2NrZWQgcnEt
PmxvY2sgYW5kIGRpZCBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUgd2hpbGUgbWFudWFsbHkgCj4+
Pj4gZGVsZXRpbmcgZW50aXR5LT5saXN0IGluc3RlYWQgb2YgY2FsbGluZwo+Pj4+IGRybV9zY2hl
ZF9ycV9yZW1vdmVfZW50aXR5IHRoaXMgc3RpbGwgd291bGQgbm90IGJlIHBvc3NpYmxlIGFzIHRo
ZSBvcmRlciBvZiAKPj4+PiBsb2NrIGFjcXVpc2l0aW9uIGJldHdlZW4gc19lbnRpdHktPnJxX2xv
Y2sKPj4+PiBhbmQgcnEtPmxvY2sgd291bGQgYmUgcmV2ZXJzZSBjb21wYXJlZCB0byB0aGUgY2Fs
bCBzaXRlcyBtZW50aW9uZWQgYWJvdmUuCj4+Pgo+Pj4gQWgsIG5vdyBJIHVuZGVyc3RhbmQuIFlv
dSBuZWVkIHRoaXMgYmVjYXVzZSBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSgpIAo+Pj4gd2ls
bCBncmFiIHRoZSBycSBsb2NrIGFnYWluIQo+Pj4KPj4+IFByb2JsZW0gaXMgbm93IHdoYXQgcHJl
dmVudHMgdGhlIGVudGl0eSBmcm9tIGJlaW5nIGRlc3Ryb3llZCB3aGlsZSB5b3UgCj4+PiByZW1v
dmUgaXQ/Cj4+Pgo+Pj4gQ2hyaXN0aWFuLgo+Pgo+PiBSaWdodCwgd2VsbCwgc2luY2UgKHVuZm9y
dHVuYXRlbHkpIHNjaGVkX2VudGl0eSBpcyBwYXJ0IG9mIGFtZGdwdV9jdHhfZW50aXR5IAo+PiBh
bmQgYW1kZ3B1X2N0eF9lbnRpdHkgaXMgcmVmY291bnRlZAo+PiB0aGVyZSBpcyBhIHByb2JsZW0g
aGVyZSB0aGF0IHdlIGRvbid0IGluY3JlbWVudCBhbWRncHVfY3R4LnJlZmNvdW50IHdoZW4gCj4+
IGFzc2lnbmluZ8KgIHNjaGVkX2VudGl0eQo+PiB0byBuZXcgcnEgKGUuZy4gYmVmb3JlIGRybV9z
Y2hlZF9ycV9hZGRfZW50aXR5KSBhbmQgbm90IGRlY3JlbWVudCBiZWZvcmUgCj4+IHJlbW92aW5n
LiBXZSBkbyBpdCBmb3IKPj4gYW1kZ3B1X2NzX3BhcnNlci5lbnRpdHkgZm9yIGV4YW1wbGUgKGlu
IGFtZGdwdV9jc19wYXJzZXJfaW5pdCBhbmQgCj4+IGFtZGdwdV9jc19wYXJzZXJfZmluaSBieQo+
PiBjYWxsaW5nIGFtZGdwdV9jdHhfZ2V0IGFuZCBhbWRncHVfY3R4X3B1dCkuIEJ1dCB0aGlzIHNl
ZW1zIGEgYml0IHRyaWNreSBkdWUgCj4+IHRvIGFsbCB0aGUgZHJtX3NjaGVkX2VudGl0eV9zZWxl
Y3RfcnEKPj4gbG9naWMuCj4+Cj4+IEFub3RoZXIsIGtpbmQgb2YgYSBiYW5kIGFpZCBmaXgsIHdv
dWxkIHByb2JhYmx5IGJlIGp1c3QgbG9ja2luZyAKPj4gYW1kZ3B1X2N0eF9tZ3IubG9jayBhcm91
bmQgZHJtX3NjaGVkX2ZpbmkKPj4gd2hlbiBmaW5hbGl6aW5nIHRoZSBmZW5jZSBkcml2ZXIgYW5k
IGFyb3VuZCBpZHIgaXRlcmF0aW9uIGluIAo+PiBhbWRncHVfY3R4X21ncl9maW5pICh3aGljaCBz
aG91bGQgYmUgbG9jayBwcm90ZWN0ZWQKPj4gYW55d2F5IGFzIEkgc2VlIGZyb20gb3RoZXIgaWRy
IHVzYWdlcyBpbiB0aGUgY29kZSkgLi4uIFRoaXMgc2hvdWxkIHByZXZlbnQgCj4+IHRoaXMgdXNl
IGFmdGVyIGZyZWUuCj4KPiBQdWgsIHRoYXQncyByYXRoZXIgY29tcGxpY2F0ZWQgYXMgd2VsbC4g
T2sgbGV0J3MgbG9vayBhdCBpdCBmcm9tIHRoZSBvdGhlciAKPiBzaWRlIGZvciBhIG1vbWVudC4K
Pgo+IFdoeSBkbyB3ZSBoYXZlIHRvIHJlbW92ZSB0aGUgZW50aXRpZXMgZnJvbSB0aGUgcnEgaW4g
dGhlIGZpcnN0IHBsYWNlPwo+Cj4gV291bGRuJ3QgaXQgYmUgc3VmZmljaWVudCB0byBqdXN0IHNl
dCBhbGwgb2YgdGhlbSB0byBzdG9wcGVkPwo+Cj4gQ2hyaXN0aWFuLgoKCkFuZCBhZGRpbmcgaXQg
YXMgYW5vdGhlcsKgIGNvbmRpdGlvbiBpbiBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUgPwoKQW5k
cmV5CgoKPgo+Pgo+PiBBbmRyZXkKPj4KPj4KPj4+Cj4+Pj4KPj4+PiBBbmRyZXkKPj4+Pgo+Pj4+
Cj4+Pj4KPj4+Pj4KPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwaW5f
bG9jaygmcnEtPmxvY2spOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBzcGluX3VubG9jaygmcnEtPmxvY2spOwo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoCB9
Cj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgIC8qIFdha2V1cCBldmVyeW9uZSBzdHVjayBpbiBkcm1f
c2NoZWRfZW50aXR5X2ZsdXNoIGZvciB0aGlzIAo+Pj4+Pj4gc2NoZWR1bGVyICovCj4+Pj4+PiAr
wqDCoMKgIHdha2VfdXBfYWxsKCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7Cj4+Pj4+PiArCj4+Pj4+
PiDCoMKgwqDCoMKgIC8qIENvbmZpcm0gbm8gd29yayBsZWZ0IGJlaGluZCBhY2Nlc3NpbmcgZGV2
aWNlIHN0cnVjdHVyZXMgKi8KPj4+Pj4+IMKgwqDCoMKgwqAgY2FuY2VsX2RlbGF5ZWRfd29ya19z
eW5jKCZzY2hlZC0+d29ya190ZHIpOwo+Pj4+Pgo+Pj4KPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
