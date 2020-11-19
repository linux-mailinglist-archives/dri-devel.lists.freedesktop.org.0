Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50C92B8CA2
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 08:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B35189FE3;
	Thu, 19 Nov 2020 07:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E156E4F1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 07:57:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4VHC9NhzPCYXcEj8CuzBg2/t1uzhnkmnmZHMsF/A0+G9nz9MWlbqJCzAOFGEgF5GZGKSwdGOLZ+//elbStxY7AgiN/lyekldLoGdAorJgCnvj+aA7+iCMbrZKvIYCKmJtXo7mL0d0CsSYHYDZ7604xcP2fbtXvfmPlwd6Uqw0h0P1t+k9/LXgq257+uZl9evoyeHrVh2ctz3NkpTuRhpuBFM2GTVBDZ7ZOWQbjKNJKSEw9vKSqn5xpWOfSkMRwpSsGKQzCucxEhsfPNO024Y+fWA0g0NJC1KfyQFOG1pcY1FEZeqUeO6ddXxZ6JZZLrX+fPqMfq7osOLqUR0rEt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJa9PK5CjXOMIBU6VxYvXN9fVF75suA5+XKdy/EO4T4=;
 b=R7816KOAL+AeyyH9vNhzwcZx0Y1Q1k3fGARQB2Otc0HQyXyKi9Fg0g1OcTl3M16LYSjA8Tez76D/VYA3Qi3D9dRcgcvrLfJ14/tmWA1+Ww6KUkn2DrYR0+sVIl/rvMzI9czg4iFS4GV9RQUOZusYUCWqYl484Xhubxd2XZA9TAYWjP5B+UvrS89TLoyBGK1v1UKX/Xi/sCGz2KdPIx/tW/WujooSXFpKMbrYsfW9xc5Lnbo7KYt2P9ubrM4f0JDXWsB6UsWg7uLJ6k/KU7DdFFZ202cpkOyswU+UKdnjaGu3kV1S2ej3luHd1xF6g8tOMshwZ0ZO3DhOqg1gddIZJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJa9PK5CjXOMIBU6VxYvXN9fVF75suA5+XKdy/EO4T4=;
 b=oyyHMzm+VZVnh4IOOxOvYUcoAGMCzBlme2OuOsnrvw0AwrYeJwtgDAC0xqXRhLWhQ0PXfCZCo+iw5E/UXMl3DmPdLOr8KG2n/Z2QdhtRIUj4kLXOBp8akSwAmrl00XWcqyMKpo+3AfrA8ogv1GtR3YqAcTJCz6fn3FnRXl8QWi0=
Authentication-Results: aculab.com; dkim=none (message not signed)
 header.d=none;aculab.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 07:52:45 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Thu, 19 Nov 2020
 07:52:45 +0000
Subject: Re: [PATCH] drm/vram: fix incorrect flag variable usage.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201119011423.14224-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3f8060f6-f739-9c26-4129-309902d6f1b7@amd.com>
Date: Thu, 19 Nov 2020 08:52:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201119011423.14224-1-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0014.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.15 via Frontend Transport; Thu, 19 Nov 2020 07:52:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a59ec12d-f162-42f0-c2fe-08d88c6019c9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4112:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4112697C9668E2976CDDE45883E00@MN2PR12MB4112.namprd12.prod.outlook.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:18;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gyfx6060YgO8ZRO8xZzl5aOe7eBvq4A6Du8+NvvtNtJUPqxrr3vSCq1zlg9mOCCjVvq2jxx4k7rB8gvpG3/xB9inibXxdbM2dbMNk/Iv2Nt1bKjro1bDkLsv1Oe4cBkhC7cp45LwE+3Zv/P1fYeDTtgoM8dzP2/SsIEQskqcHZlRymXe2IpwgPj6A8xh19XrhTqNE55cGsQHeTeeEiWmxMz49I67+x0JGX0zNbDR3GZBOJHdRFpe7MIuCn9SxVlOqLTooFabRzCLKZCLtdWbEpJWGlgxT35lkSb8rCYR5uf64A1Mwcj0P/IDTBrqSsoUDSjH72RkMoEp9py42v7lRwrhP5G/oIX6e7gjsuV+EyKJUo5H8qG5vM90IF2XMqDT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(83380400001)(52116002)(4326008)(86362001)(186003)(16526019)(2616005)(54906003)(66574015)(8936002)(8676002)(316002)(478600001)(6486002)(31686004)(36756003)(6666004)(2906002)(5660300002)(66946007)(31696002)(66476007)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bGhVV1dlK1JzTEVOSCtwUDBVbmhibjh4MXQzNkVDdkZOUFk4QkRLTVlBbncr?=
 =?utf-8?B?cHdtMCs1ejVZN2JiR3RLZEtzMG9uQ3NBU1RMcldlNFZwc09pN211ZFBFRlZL?=
 =?utf-8?B?OXJDWkt6cTdBRExIRVAzTGdUWXlJbFAvSDZ4S0NPSVdUS0FmbVZ6QUhMMkI4?=
 =?utf-8?B?RGhDN3EyUDNQN2VVWThiTGE2SEtxa1ZkYVN2ZXduaXMzVUFYNUd6SmlwQ0VY?=
 =?utf-8?B?ZWU3ZC9SWmMxaU9lckorbGdva0owQkFhWmQvcnhXWmd3VWxmYlQraFh2dWs5?=
 =?utf-8?B?SDY4dXhXRVRhZlZCSnFMeUpYR0JOQ1c2QSs4VjBGamVENU1LU2lMc0hFd01J?=
 =?utf-8?B?ZkpydVRLaWxRMEg3RWVWRGU1TlJsYmRDWURjaUNwMHhLVkZPZExoYW5Ta1Bx?=
 =?utf-8?B?dE9PTUF1ZlpIc1pCRFBaOGRhTlJPdjkzOHFoeXJ4UVdRSjNOejcwbmo2VWNo?=
 =?utf-8?B?dE9QSXlwQmMzTmFzNU1GZ2ZNb3F0cFBTT05tRVk2bHdvRHRkRWFJTkVyd0JL?=
 =?utf-8?B?TWVLTWRodTBtSSswN3NQNEJvaVVxd2g0WjBUQmxoZzZyRE9jMlFHVGxUUXB0?=
 =?utf-8?B?dUduQkdRbVc1QnFUY0haSUcwNmxnZXhOSytoUHdWNFR6VlFlNkVpTDJCbWUv?=
 =?utf-8?B?VzErOEZwZSt3NGtZeGdOVGNXVVI3Y2FJRHNENGR1QWRudk9YUStqRnJ4Z2hv?=
 =?utf-8?B?ZDlCZnRsczNvV1VMcW9HQ1kxSG1DRXUrVWRIQmoya2lGcWhYQnBTSElqZXVw?=
 =?utf-8?B?SzlMTXJkQml4N0hvMC9sWUpLOFBNUlk1UDZiNUlQa1RMS3VMbFFWY2ZMWHNs?=
 =?utf-8?B?YlQ4OUxXcUVRSkJjWFJaZGdmb2FiUkZWb0hGS0dHNFRCb0NkaXJKV1pTL242?=
 =?utf-8?B?RjUzMmpPQUkxcDhBcjJudWhrQXFNTnVYeHlmODFxVjJKVmk2ZHlZUkdEbUhY?=
 =?utf-8?B?NkxOckhERjJseGNCRDJBbEx4K0VRbjBVYlFRNXJtcTgwOEZTLy9LRkZvQW5y?=
 =?utf-8?B?VlhmUWp1ZTVnN3EwNEpIYlE1TFJpUVdlZ3pwUGtDcm8xQUx6SXBRUDQyQ2JY?=
 =?utf-8?B?N3BZS28vQ2pocEU0SytVMzY1QkFVckJIRmpzOHkwK2Y1S09xd2NIcWJFK1hG?=
 =?utf-8?B?V3pGVnBtdkJ5VGcyb1Z3VDNJRjRHd2FRYjlqVS9DckpHQjZaYStjMFpRNHNj?=
 =?utf-8?B?N3QvdVpxNHBqOGZ6MTg4OHBUUVpQVXBKcUJIS056eDY5VmwzamEwWm5XUXRo?=
 =?utf-8?B?TjcyWHlIcTVqRVdxcVBKNkdnU3VpYUwrMy9zODZ0a1QraUVzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59ec12d-f162-42f0-c2fe-08d88c6019c9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 07:52:45.2785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTKJxHhJkCkIKXc1laZqgw5rG/xgTIRdcExYwgkeAPcPx2DtmGoWMdJPNR8DNnLB
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
Cc: Dave Airlie <airlied@redhat.com>, David Laight <David.Laight@aculab.com>,
 Wen Pu <puwen@hygon.cn>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTkuMTEuMjAgdW0gMDI6MTQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gSW4gNzA1M2UwZWFiNDczMTE5NTAzZjY1NjVi
NGUzOThmOWE3MzEyMjQ4MQo+IGRybS92cmFtLWhlbHBlcjogc3RvcCB1c2luZyBUVE0gcGxhY2Vt
ZW50IGZsYWdzCj4KPiBpdCBhcHBlYXJzIHRoZSBmbGFncyBnb3QgbWl4ZWQgdXAuCj4KPiBUaGlz
IHNob3VsZCBmaXggYSByZWdyZXNzaW9uIG9uIGFzdAo+IFsgICA2NC43ODIzNDBdIFdBUk5JTkc6
IENQVTogNTEgUElEOiAxOTY0IGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVy
LmM6Mjg0IGRybV9nZW1fdnJhbV9vZmZzZXQrMHgzNS8weDQwIFtkcm1fdnJhbV9oZWxwZXJdCj4g
WyAgIDY0Ljc4MjQxMV0gQ1BVOiA1MSBQSUQ6IDE5NjQgQ29tbTogWG9yZyBOb3QgdGFpbnRlZCA1
LjEwLjAtcmMzICMxMgo+IFsgICA2NC43ODI0MTNdIEhhcmR3YXJlIG5hbWU6IFRvIGJlIGZpbGxl
ZC4KPiBbICAgNjQuNzgyNDE5XSBSSVA6IDAwMTA6ZHJtX2dlbV92cmFtX29mZnNldCsweDM1LzB4
NDAgW2RybV92cmFtX2hlbHBlcl0KPiBbICAgNjQuNzgyNDI0XSBDb2RlOiAwMCA0OCA4OSBlNSA4
NSBjMCA3NCAxNyA0OCA4MyBiZiA3OCAwMSAwMCAwMCAwMCA3NCAxOCA0OCA4YiA4NyA4MCAwMSAw
MCAwMCA1ZCA0OCBjMSBlMCAwYyBjMyAwZiAwYiA0OCBjNyBjMCBlZCBmZiBmZiBmZiA1ZCBjMyA8
MGY+IDBiIDMxIGMwIDVkIGMzIDBmIDFmIDQ0IDAwIDAwIDBmIDFmIDQ0IDAwIDAwIDU1IDQ4IDhi
IDg3IDE4IDA2Cj4gWyAgIDY0Ljc4MjQyN10gUlNQOiAwMDE4OmZmZmZhOTEyODkwOWZhNjggRUZM
QUdTOiAwMDAxMDI0Ngo+IFsgICA2NC43ODI0MzFdIFJBWDogMDAwMDAwMDAwMDAwMDAwMiBSQlg6
IGZmZmY5NWE1YzI1ZTFlYzAgUkNYOiBmZmZmZmZmZmMwMmI2NjAwCj4gWyAgIDY0Ljc4MjQzM10g
UkRYOiBmZmZmOTU5ZTQ5ODI0MDAwIFJTSTogZmZmZjk1YTVjMjVlMGI0MCBSREk6IGZmZmY5NTll
NGIxYzJjMDAKPiBbICAgNjQuNzgyNDM0XSBSQlA6IGZmZmZhOTEyODkwOWZhNjggUjA4OiAwMDAw
MDAwMDAwMDAwMDQwIFIwOTogZmZmZjk1YTljNWRjYjY4OAo+IFsgICA2NC43ODI0MzZdIFIxMDog
MDAwMDAwMDAwMDAwMDAwMCBSMTE6IDAwMDAwMDAwMDAwMDAwMDEgUjEyOiBmZmZmOTU5ZTQ5ODI0
MDAwCj4gWyAgIDY0Ljc4MjQzN10gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogMDAwMDAwMDAw
MDAwMDAwMCBSMTU6IGZmZmY5NWE1YzVjNTZmMDAKPiBbICAgNjQuNzgyNDQwXSBGUzogIDAwMDA3
ZjQ4NWQ0NjZhODAoMDAwMCkgR1M6ZmZmZjk1YTlhZmNjMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAw
MDAwMDAwMDAwCj4gWyAgIDY0Ljc4MjQ0Ml0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENS
MDogMDAwMDAwMDA4MDA1MDAzMwo+IFsgICA2NC43ODI0NDRdIENSMjogMDAwMDdmNDg1ZTIwMjAw
MCBDUjM6IDAwMDAwMDBjODJhMGUwMDAgQ1I0OiAwMDAwMDAwMDAwMzUwNmUwCj4gWyAgIDY0Ljc4
MjQ0Nl0gQ2FsbCBUcmFjZToKPiBbICAgNjQuNzgyNDU1XSAgYXN0X2N1cnNvcl9wYWdlX2ZsaXAr
MHgyMi8weDEwMCBbYXN0XQo+IFsgICA2NC43ODI0NjBdICBhc3RfY3Vyc29yX3BsYW5lX2hlbHBl
cl9hdG9taWNfdXBkYXRlKzB4NDYvMHg3MCBbYXN0XQo+IFsgICA2NC43ODI0NzddICBkcm1fYXRv
bWljX2hlbHBlcl9jb21taXRfcGxhbmVzKzB4YmQvMHgyMjAgW2RybV9rbXNfaGVscGVyXQo+IFsg
ICA2NC43ODI0OTNdICBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9ycG0rMHgzYS8weDcw
IFtkcm1fa21zX2hlbHBlcl0KPiBbICAgNjQuNzgyNTA3XSAgY29tbWl0X3RhaWwrMHg5OS8weDEz
MCBbZHJtX2ttc19oZWxwZXJdCj4gWyAgIDY0Ljc4MjUyMV0gIGRybV9hdG9taWNfaGVscGVyX2Nv
bW1pdCsweDEyMy8weDE1MCBbZHJtX2ttc19oZWxwZXJdCj4gWyAgIDY0Ljc4MjU1MV0gIGRybV9h
dG9taWNfY29tbWl0KzB4NGEvMHg1MCBbZHJtXQo+IFsgICA2NC43ODI1NjVdICBkcm1fYXRvbWlj
X2hlbHBlcl91cGRhdGVfcGxhbmUrMHhlNy8weDE0MCBbZHJtX2ttc19oZWxwZXJdCj4gWyAgIDY0
Ljc4MjU5Ml0gIF9fc2V0cGxhbmVfYXRvbWljKzB4Y2MvMHgxMTAgW2RybV0KPiBbICAgNjQuNzgy
NjE5XSAgZHJtX21vZGVfY3Vyc29yX3VuaXZlcnNhbCsweDEzZS8weDI2MCBbZHJtXQo+IFsgICA2
NC43ODI2NDddICBkcm1fbW9kZV9jdXJzb3JfY29tbW9uKzB4ZWYvMHgyMjAgW2RybV0KPiBbICAg
NjQuNzgyNjU0XSAgPyB0b21veW9fcGF0aF9udW1iZXJfcGVybSsweDZmLzB4MjAwCj4gWyAgIDY0
Ljc4MjY4MF0gID8gZHJtX21vZGVfY3Vyc29yX2lvY3RsKzB4NjAvMHg2MCBbZHJtXQo+IFsgICA2
NC43ODI3MDZdICBkcm1fbW9kZV9jdXJzb3IyX2lvY3RsKzB4ZS8weDEwIFtkcm1dCj4gWyAgIDY0
Ljc4MjcyN10gIGRybV9pb2N0bF9rZXJuZWwrMHhhZS8weGYwIFtkcm1dCj4gWyAgIDY0Ljc4Mjc0
OV0gIGRybV9pb2N0bCsweDI0MS8weDNmMCBbZHJtXQo+IFsgICA2NC43ODI3NzRdICA/IGRybV9t
b2RlX2N1cnNvcl9pb2N0bCsweDYwLzB4NjAgW2RybV0KPiBbICAgNjQuNzgyNzgxXSAgPyB0b21v
eW9fZmlsZV9pb2N0bCsweDE5LzB4MjAKPiBbICAgNjQuNzgyNzg3XSAgX194NjRfc3lzX2lvY3Rs
KzB4OTEvMHhjMAo+IFsgICA2NC43ODI3OTJdICBkb19zeXNjYWxsXzY0KzB4MzgvMHg5MAo+IFsg
ICA2NC43ODI3OTddICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg0NC8weGE5Cj4K
PiBTaWduZWQtb2ZmLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+IENjOiBX
ZW4gUHUgPHB1d2VuQGh5Z29uLmNuPgo+IENjOiBEYXZpZCBMYWlnaHQgPERhdmlkLkxhaWdodEBh
Y3VsYWIuY29tPgo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+CgpHb29kIGNhdGNoIG9mIGEgc3R1cGlkIHR5cG8uCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFu
IEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuYwo+IGluZGV4IDUwY2FkMGU0YTkyZS4uMjg5NmEwNTdiNzcxIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCj4gQEAgLTE0MCw3ICsxNDAsNyBAQCBzdGF0aWMg
dm9pZCBkcm1fZ2VtX3ZyYW1fcGxhY2VtZW50KHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpn
Ym8sCj4gICAJdW5zaWduZWQgaW50IGMgPSAwOwo+ICAgCj4gICAJaWYgKHBsX2ZsYWcgJiBEUk1f
R0VNX1ZSQU1fUExfRkxBR19UT1BET1dOKQo+IC0JCXBsX2ZsYWcgPSBUVE1fUExfRkxBR19UT1BE
T1dOOwo+ICsJCWludmFyaWFudF9mbGFnID0gVFRNX1BMX0ZMQUdfVE9QRE9XTjsKPiAgIAo+ICAg
CWdiby0+cGxhY2VtZW50LnBsYWNlbWVudCA9IGdiby0+cGxhY2VtZW50czsKPiAgIAlnYm8tPnBs
YWNlbWVudC5idXN5X3BsYWNlbWVudCA9IGdiby0+cGxhY2VtZW50czsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
