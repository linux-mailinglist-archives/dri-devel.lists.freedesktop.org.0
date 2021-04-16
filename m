Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7047636225C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F406EB9E;
	Fri, 16 Apr 2021 14:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E986EB83;
 Fri, 16 Apr 2021 14:35:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJXGvXEKkmPfJCy4Tj/sA87LrYjNRZ4Dd6F0rtgh5IuiTfkXGdj6itVs7q7irXPpfDFJGXw1vWXQ9SKZHWj9QjfrAyoWu8Cn4yb93/hxzzems+90JxMnKWXI4mv11lqxcjD9S7KfrMyZHLZu3qUy5GDSEuaYSntkxl2fZNf2EPf4KyN39brK4EA/kQVzsdWqWaFH/2FhSwijac+wr9OGZyqQ3Ooi0UAyIdTupFXlneeAHYdfQ7CypSLe8LOROOSBMYIrZThYopPw4OVFHQvPg73JWziWQEQdR9Onunc5QVEuNcV7RcIMpWbrXqGlEnyCEk/WbL88ettP/8Q6vHe7yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=suH8ntunYvBfkBR2/vj2bDjaDxRTa+Im9uKDwOfEZbg=;
 b=l1iD3T19GiHq+OLHKVw9Y4jMFha+cJ7jHP0z3lRVNjtIhuLJFB5wdRHEi9VxPevtW+faRdWYcriKhpG8u6a2eTOGtJY1uMa8TBDWb7kuNL/mWzpue7ab7/Hhd4XoJN/9irbN2NS06m21giQ7q1VR5Nbd2BACwmXhwwDppOfNYugMS32pt3RodOWTZaRgmqXSf6xa3znX5HVLhf2utwfQZRVtmruQCdsCzk0Geo1D96/dlKv+FuAcPcL0Qiu/+eaOZH1fWAL3k1c+CTbJSAuLzlnP53RRRLuqz2sDW2DkN13dl6V9eGZDxtWqbqHb2p74R4h1/AXqWkQT7if8eaBckg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=suH8ntunYvBfkBR2/vj2bDjaDxRTa+Im9uKDwOfEZbg=;
 b=v7OEGEGg8mdhl3ejBS37qw5X3TB4nBli3vLn92E0Wtq7nbOTr0l7ov4cg3U5PzSFo3+WtViODtnTGuXb+KStY6RGXRvIgcPpa6Zrxuo1QzjuBuID5Wr8THp6G+GhoMfu93XN6V5dezKo4cG9h1vU6nd6d8+wxOz7x6Ajh8DojK0=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1787.namprd12.prod.outlook.com (2603:10b6:3:113::12)
 by DM5PR1201MB0172.namprd12.prod.outlook.com (2603:10b6:4:51::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Fri, 16 Apr
 2021 14:35:48 +0000
Received: from DM5PR12MB1787.namprd12.prod.outlook.com
 ([fe80::576:3b2d:76db:55ab]) by DM5PR12MB1787.namprd12.prod.outlook.com
 ([fe80::576:3b2d:76db:55ab%3]) with mapi id 15.20.4042.019; Fri, 16 Apr 2021
 14:35:48 +0000
Subject: Re: [PATCH 1/3] drm/amdgpu: make sure we unpin the UVD BO
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210415084730.2057-1-christian.koenig@amd.com>
 <a15d4af8-98af-1036-c6f4-7738f08678e1@gmail.com>
From: Leo Liu <leo.liu@amd.com>
Message-ID: <a1e3b28d-c1e7-398b-dee6-1afa2bdf1220@amd.com>
Date: Fri, 16 Apr 2021 10:35:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a15d4af8-98af-1036-c6f4-7738f08678e1@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:9880:2088:19:24f:2eff:8826:f130]
X-ClientProxiedBy: YT2PR01CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::21) To DM5PR12MB1787.namprd12.prod.outlook.com
 (2603:10b6:3:113::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:9880:2088:19:24f:2eff:8826:f130]
 (2607:9880:2088:19:24f:2eff:8826:f130) by
 YT2PR01CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Fri, 16 Apr 2021 14:35:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6236d7e7-4caa-4bbd-dbbc-08d900e4ed3d
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0172:
X-Microsoft-Antispam-PRVS: <DM5PR1201MB01721BAE0768A7A64F9CB60BE54C9@DM5PR1201MB0172.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yg2q7S63C9xOjgDNCwf86b2xgOlUdK9kpZLVKHyfD9dCTM9naDv3YnmbYrC8kUMIEt2ZhFNXx9COd+NMlUuf85HetBxO/Tv24izSTWgsY4GyhMjyaGmgUOw51ca63qMnyQk9HEXIqU7YpIeAoTkeLBDapMt158YPsuUo1sEtfJKbuLusd87bGt22e9FlRyF7EFhJf2qInPthQyoEGkozsbUztPF3EXr3jeHxfHZCRZ2bGPetoesvCJ3D3DSaWMEKicb7Elc7LZm4PfNL8l0ahA+afCLLRzaYQkO5MdPX1l306m+5JsKS/4Ef7br17bMPHBfGyhPknTsqm3aW6Mi45LYzpRTdcVbr6oXPzIrTXrNOZin5lkJk9XkBHDZRTrdTnIQA14YlKwoN8svhv7lCSfN+nh3x9HKTZYGpc+fJPYI0rgT+mSNqBejsbHnvAs7jhVx5qk1x4J12bT51CKO9GPTqB+K9y9f/tVgkAoJh1Nf3e7BJpke0TIttyVml7HVWOR57gBHrQFWIabARl9HQ0GlbSpRumIc8cdBppDSikf2fqnAaN9CC9iXh8CH3c1Iws4n9gWss1SApkP2u/lWx2RqOVATdzjgIRlEfU9W27LPDR3HvlowHURGX+qt8/ZMRm4YqBDfJZsPhosJ+yHjs/t0MBjsZ1BFrs6/19QcmVGbZlSEk0DOkqc4ENb/lG247xqykt4RCwtXZoMw0B5BChL+Bod+i3czcidkmAU7GB/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1787.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(44832011)(2616005)(966005)(8936002)(52116002)(66476007)(86362001)(45080400002)(66946007)(6486002)(53546011)(38100700002)(36756003)(4326008)(8676002)(2906002)(31696002)(498600001)(31686004)(16526019)(5660300002)(186003)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QmNya0pKSXYzZXA5VFgwL3NNUmVSRVpvU1RNNlVTTm10UEZxMk5TbGhNdW1I?=
 =?utf-8?B?Umo1QWIvcC9TS20zZ2RxLzVGeVpHSlJreTR3bkZkZzAyZTYxc3BNUjhkRlFR?=
 =?utf-8?B?ajRNdkEwVkh4NFpjVU9mZGYxWVRYTkxPbHlWU2drODcxZllxY1Z1NHJYaXpU?=
 =?utf-8?B?ZE1CY1JQUU4ydW5obUUrbE5lYm4rbDQvamhUYUdSQ1NCVkNZWTNQY0NVSFJ6?=
 =?utf-8?B?cDFCWEhDUnRXWVpTeW5zZEpSWWFFQ2wwZTkzRTVFdnNkc3V6NFJwdGswd0NV?=
 =?utf-8?B?RE1lbjNjbWVoYlRJK0FHVnZZamthZHNhdWZtZVRqV1hkS2VRQ0x1K2tGbVVr?=
 =?utf-8?B?NEx5ZWtCTEowV3Q2Z2p3ZkVNRHVFS2NheHB1Z2RYSENhelZieDFxb2g1eEwz?=
 =?utf-8?B?ZVZ3MndrSU14NlEwQ05TM1pnUlRPMUFlYlgrK0dYUUhQb1FMcEhoWFNham4w?=
 =?utf-8?B?S2FlSUdOQ1VzOWFZODIvNmJwTGcwbmxpZnZLZTlFQXhTTWpJYWZzSzM5MW1q?=
 =?utf-8?B?VHlNM1IrZWhUZVR1emxoOFlZZDJPK2ZtdkNXd3FXNm5SQ0Z1NGd3TzR4aThG?=
 =?utf-8?B?djQ2cmIreDhqSEUxZmc1UzdoVXowdU9SWW9hd3FhaHdEUjN5d2ZDWmRTTm01?=
 =?utf-8?B?aVR5dS9LM3o1Y2VHU2ZSb0w4cVVuVzJ5bkV1UzlWM0VOMWorcHIrTlpnVGpI?=
 =?utf-8?B?Vkt2dTVvVVNKbGdTcEg5aTlZMTJaNVoyaHd6OXlxbjZ6dWVENjlBNzZsS2x5?=
 =?utf-8?B?YUM3YU8zRnBnbGZxNU5mOUdmSlE0cklsSllNSEltUjdIWEQ2Zm1aTmdnd2xY?=
 =?utf-8?B?UnZTdndqTTRLNjM1R20yT2NBeFZZQmU1Yi9yWnlRYzRXcnpFekdoNHNET2lw?=
 =?utf-8?B?UitRZFNZOG02YTdENkRVKzBPbGVsVjdZbzRPSWFTcjdwVlUrUkMvSTBHWGgz?=
 =?utf-8?B?SzVLMGRUdDJMWjRkV21EMFFPR0tNQjQrZ2ZzZy9ya05vS1BodzBPU1FIeXpq?=
 =?utf-8?B?WEFHN2xlZnFJV1ozWVJtNFRqMEVxcDVwQVUvTHFPVWtlVkRPWS9VdGNNSW1m?=
 =?utf-8?B?amRNQ2JTMm81bTdMTVlsOHFFS2o3NDcwbko5aTRyOGtHWUhHZHVSdzFTeEpQ?=
 =?utf-8?B?QytYN203NjNrUm1EeHlyWHJ1OSs3dzRJd0x0M1NSUm8vVmU1dEFZSldCYzkv?=
 =?utf-8?B?cm56KzhGQ21qdC9taDNwOTdMeDdnZ2Q1K21qSERIQ1pqZHo3TE9KL29HcXJJ?=
 =?utf-8?B?b1dVTXQvOU5ETGlXckYzN0ljeWtieFprM0M3Z0tPZzdBNThYVU5zbTBkd09i?=
 =?utf-8?B?R2RxdlZZTFpHOGJNQzB6ZDZuU1NPU0J5ZmpOeUlrYlhlMGRya0dQd0pCN041?=
 =?utf-8?B?WkRseVQyVUo0SENDL3NSZzdpYUdNMVgrcDNsYkhDbWZRK1FVUVliVkxidlR3?=
 =?utf-8?B?RFlIVjUvTkMrM29qNDNDY0NxdENrMEI5ZGhZVWQ5VkZBUkVsVEVibHlPYmlu?=
 =?utf-8?B?Yi9lS2x2MXFZMWdpbWJLOThkd3dnSVNycEIxMDlwajRYai9yZnJkb2ZVUXB2?=
 =?utf-8?B?Vmp0OXBrbzBUeVZEMHVTMUFxUFJyUFRXR09PekRoOGdVOEFEZTQvK2FFUDVs?=
 =?utf-8?B?ZFBOZHo3UUc0Mnp4UnUzaHBCQi8ySWRUd2k5b2xkVjhFQmF0bkVNOWNoZnRh?=
 =?utf-8?B?dDI1Y1lZcmd4M1NQMVJpZWM3ZDk1YlhqdWlBZG82OXEwbzJVMjJpNFVSSmpD?=
 =?utf-8?B?Umk1cWl0QUVFRGZWM0c3VlpMRWxobEJwOVJPaklNZFdIdzZ0Y1haT0E3Tkpp?=
 =?utf-8?B?L3lTZHFJOTdsUjJ6RTczZ2JoU0pManZnVjVuZW5mUVdHYnRBTi8rTWJwaG51?=
 =?utf-8?Q?HM6PPPMMwxt5P?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6236d7e7-4caa-4bbd-dbbc-08d900e4ed3d
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1787.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 14:35:48.5602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DqHUzeMU6Cs6RuBngTjQ1MMY9o4/CoxXjxAcK28+u6zoclINqJDALGDkqxd5r+3e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0172
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

QWNrZWQtYnk6IExlbyBMaXUgPGxlby5saXVAYW1kLmNvbT4KCk9uIDIwMjEtMDQtMTYgODo1NCBh
Lm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IFBpbmc/Cj4KPiBBbSAxNS4wNC4yMSB1bSAx
MDo0NyBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4+IFJlbGVhc2luZyBwaW5uZWQgQk9zIGlz
IGlsbGVnYWwgbm93Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS91dmRfdjdfMC5jIHwgMSArCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAu
YyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jCj4+IGluZGV4IDdj
ZDY3Y2IyYWM1Zi4uMWEyYmYyY2ExYmU1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS91dmRfdjdfMC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L3V2ZF92N18wLmMKPj4gQEAgLTM2Myw2ICszNjMsNyBAQCBzdGF0aWMgaW50IHV2ZF92N18wX2Vu
Y19yaW5nX3Rlc3RfaWIoc3RydWN0IAo+PiBhbWRncHVfcmluZyAqcmluZywgbG9uZyB0aW1lb3V0
KQo+PiDCoCDCoCBlcnJvcjoKPj4gwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPj4g
K8KgwqDCoCBhbWRncHVfYm9fdW5waW4oYm8pOwo+PiDCoMKgwqDCoMKgIGFtZGdwdV9ib191bnJl
c2VydmUoYm8pOwo+PiDCoMKgwqDCoMKgIGFtZGdwdV9ib191bnJlZigmYm8pOwo+PiDCoMKgwqDC
oMKgIHJldHVybiByOwo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3Rp
bmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wNCU3QzAxJTdDbGVvLmxpdSU0MGFtZC5jb20lN0M1ODIz
ZDI3OGZhZTg0OGUyMjkyMDA4ZDkwMGQ2YmQ3NiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5
NGUxODNkJTdDMCU3QzAlN0M2Mzc1NDE3NDQ2MTgxMDk0NTMlN0NVbmtub3duJTdDVFdGcGJHWnNi
M2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxD
SlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9VEluNXU1JTJGUFM1MHdjS0NkNiUyRndUbnBQ
bSUyQmdDUGE4S09UMWN6NnI3WGdsMCUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
