Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EFA315553
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 18:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B881D6E10A;
	Tue,  9 Feb 2021 17:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16236E107;
 Tue,  9 Feb 2021 17:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqyRJZdC+P3X/R7qlZgSoWSS+g2OaNC8E7ZMFgrgji7GpYGcXvjwZxLPHawsIC1TSyANSXXyQm82UOzxS95uL6Nvnq68wni/+e1OovfM90UvIK39+p1jqFakR53PknyS4ncgrVqF/3u5EL5ibeOXQDvdepa6MFqKrHvlD8B5Stjs5QFkCOU9lGrDj0RToOi+y2+vqPQ0WDaZmyIE2u/4tkwzo8IRAtIhA7zh1fA+FsZW/XqmsCf+6tcUpTXDJ2jmFo1jNj+mQSJBZP4PrTMb8SmJpBQgfsgyPNBBZ/ss1Gen+Sj+p/z94vg0n2fR2lBlcfbJ0C4zWbIUua3i9Wg6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY6jtUCdphUUqc+kboiKkGvTug6oxK03mSezgXFTqMA=;
 b=LF/N+V5Kp7oBl1I3RuZDKCMThrR98XTqWZ1GrpSgiWMVmxNjZj17tyLam0oEzT6/HLVYHpViCgSXSOzV1lkcHZEKQWyLCL4Xry635OkoxarukeQq5VAdwjNsyasQ1DhaB5CZtQD8mEKXLzQM8p6taHD2ESOoulC5bgqmZlhVdUqryrQRLKizgPrEbcG2E29XhI8UmshTtJbV3GC1PwRvU4JeJk/EKdOXaX/GLSIRnFyh2McDz/ZK7uIUWbKMeKEYxB3dsgSados5X4o66Ox1fuMtMOQ9NdOZnNWJYYciPkL7zoQjFVQvI0mDoRC6z4ghCc5m+06XvoUJWeo3X+zxRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY6jtUCdphUUqc+kboiKkGvTug6oxK03mSezgXFTqMA=;
 b=QiKiqgow/21yOAMzuAAWlNa66v38HEhbt/vkDgrRiRzxvXI3j5K62e34dnYqoPf/s0CTd4D9VY1Kh9x77yfGzM1NKw4PCagblBGCC9edDY3DjYghO1/a1JFQSFnFxJ+X5eXpl7nayzFCKLPmWGdQMbDVY5AvTKJzdE/3lpF6Cas=
Authentication-Results: linutronix.de; dkim=none (message not signed)
 header.d=none;linutronix.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Tue, 9 Feb
 2021 17:44:01 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 17:44:01 +0000
Subject: Re: [PATCH v2 0/3] drm/amdgpu: Remove in_interrupt() usage.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20210209124439.408140-1-bigeasy@linutronix.de>
 <41d0f7db-c2b4-f618-42a7-da9f7cdb76b4@amd.com>
 <20210209165312.bq2yn73fqidt7hgl@linutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <02371b80-667b-81a0-b8d7-7fd085442b1b@amd.com>
Date: Tue, 9 Feb 2021 18:43:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210209165312.bq2yn73fqidt7hgl@linutronix.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:fd71:881d:d213:f46a]
X-ClientProxiedBy: AM0PR01CA0121.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:fd71:881d:d213:f46a]
 (2a02:908:1252:fb60:fd71:881d:d213:f46a) by
 AM0PR01CA0121.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Tue, 9 Feb 2021 17:43:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4f3adb31-2242-4265-539b-08d8cd2248c3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB41126867C6C9C6D00DA7EC3C838E9@MN2PR12MB4112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: elWDQZxM3O3g1buO2Noh2nW4PEV/7Pf6dmLUNs5Fmx1RrBgxYAJz3JZ1j4ZiZDfyFMJz3ZE2ar/yUa9kR1HbHszuoxsbaQoy8BZbAurziISfASnBPFCGsBVe1QWDaibvle3l3KEnB6ngKDRWgO7FRkpc3MbDSF1agxuDbO/Cc6iYP6Pz5LOBTPt1Qj24IJqG+YDUz9Ivb3Osn9Pr4IomUJV89gMxkPT5it6URChU5eOSYyYYINbV76RDFpIITqCSu+HSTd8/QkqXmsvyGkx9a7ZqkwikP9SKYVZt60A4VAW4PL81HFXuB/o8o5zxczZSz60+8nqEoC1QbI6lmoSK1WlMbyisVLfBrwl3xoqNkmI+XRl3+4N7PUSRjK8VJEaes0/IBeBrmNkG+fZh6M1eXrSoJGnhbMipIcafyaj557Btd5aJxYzDw3o70AaDMyWiPbxLMY8q875xOm5O1iJCXUepCyI5xguo2HD/QYx9li35vkUgptwBNgn1FVboDtkvf/qgRcSgqFtJbmMMA3nT40ggY7Zi26rVjWie4giFrdMe3jTCk+rYLcatrlSi+FBnoxad5m1daylA43WT6DMBlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(66946007)(36756003)(6486002)(54906003)(86362001)(6916009)(66476007)(66556008)(66574015)(8936002)(6666004)(83380400001)(316002)(52116002)(2616005)(2906002)(31696002)(31686004)(478600001)(4326008)(53546011)(16526019)(186003)(8676002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?amNKd0VnK1lsYnVza25zR1VaQVpUMnprZVEvVVFQTy9Dc3Mva0d0eXE0YTJ1?=
 =?utf-8?B?MDJQMWlMbEVRU2lpdDZFa05Tc0NhcnQxTngyeTJ2a1k1cXVPY05tZEQ1blBU?=
 =?utf-8?B?TDJvS21CdXFRcXFMUHJkd1VMOWpPY25qWExtcXRCUlY3ZHdMSlc4MTg5TG91?=
 =?utf-8?B?SWRsUlo1cDRLSkdVZ01zK25kQzEyZ0xERURLMTRXYThYODlsMGFqYkdyYTRr?=
 =?utf-8?B?TjFHWlZCQk12ZGtxMWQwOWRORUNkK1ZkS2lvOTFOb1RocXh3L25WZUFFTnI3?=
 =?utf-8?B?QkxVQkdWanA1Qmg0MnhPR3BQQkVSKzhLbi9sbXRTZFUrQ0dnZFd0Wk1ETTdh?=
 =?utf-8?B?cEppcyt4aXQwTXRLQzZBL1pwQm5QN1VLU0VFSU1uTlRzeUlKSWVaVlRackl0?=
 =?utf-8?B?enFDVy9vS2RTanU5SnhDYXF3RDVZaFJSRUMybHptaXN2NHc2T2xHNkplcnJt?=
 =?utf-8?B?N3VFcmhaLzYyM1N0bURsUDFiUXhnUzc4QXlPQjI2Y0wva1l0ampwYVRWR2xq?=
 =?utf-8?B?MitaVzd2cndqT1FUMXNxUEg3WmdlK1N6T1JPdytuUTFsVkJUNEIvMkZpQ3NL?=
 =?utf-8?B?amtkbzQ3OXVucE1JMEFVMWpjQlhocHd4aUVPVjc0dGt6TXo5OUpUMVpnNGhO?=
 =?utf-8?B?cXdaSmZyaENXS25uYUxyVysxbEVhWnZjY0xYd1pKaGNPbVpuS2laR1IzYlZp?=
 =?utf-8?B?d0dOQXlGY2g3a09rbEpQQndHcXlUeHhzblBQOUVrV0FKcXd0MWR1OHJYZUk4?=
 =?utf-8?B?Y2VHYjZtQ1BiVUNtZk5jVFpSV24yeGN6REtXMWdUQnRjZk5WTWhiWkkwVnQ1?=
 =?utf-8?B?TzduRm1tMTlSaUJPOWdzNE1zdmE3U1BKSjVMTVhaRmZkRGgydlFlNXpQTG8w?=
 =?utf-8?B?YitqN2FQemw1ZFlXUW1kTUdwYlp5elQvVjVMeTZybUhCT3Q0WnpoZGhqbmRM?=
 =?utf-8?B?U1NUU0hhbWRDRW1lcEh2QUVBVVlHVWxEelpZUlptK3hUM0gva0g0ZTE2R3F6?=
 =?utf-8?B?MjZRWFkwM3VUNDh6R2VhNmRqYytaajdDS3F6MTc1UVFCZXBKQjZkRitNeVZO?=
 =?utf-8?B?aVVncXE1dVZtSlJtZks4TVI4NHZWRURsSWs3NkVhVXJWSTI1TFoycXJNZU15?=
 =?utf-8?B?QVYzZlk4K2x1K2pOUmNwQlNUaU81Sk1VRHY0UXlBUnFoNG82YW1jN01Sd3B6?=
 =?utf-8?B?VkgzNzZCVmNxRVVEaG1veFUxNGNPck5QTlVWb2NMNUVkaW02cmMrd1RYRUlU?=
 =?utf-8?B?ZHdkSWVXZzR3WVNoaG8xam8yaEpWd3h3cjUrZjRabWNISFN2NGxlL2RNQUo4?=
 =?utf-8?B?elg0K0x6SndydldZWU95ZndiSlh2MGl5cEFZMjJ0clRzMzcrV3g3bHpoL0Iw?=
 =?utf-8?B?RVUwaVJFbkNFQVN0YkFvcElRemxPNEdCb243WElzYWhMZnBOUzFGTS90VXk3?=
 =?utf-8?B?QmxqbC9VbkJSY1B1NG5LamRzcUY5endiY1kzVjBzNDNmeDczVUlHc2ZYYU1N?=
 =?utf-8?B?ZDhLRExaQmtrek4ycEVnd2xQQXpJRk9QTGJCdUxCL0sxY0xqUVZjUTNHTnVn?=
 =?utf-8?B?TlpzaEM4QnVnNS9xTFZsZmdrUy9jbU5FdWtqSVQ5MGc1azhWS1U1L1ZxMzNQ?=
 =?utf-8?B?SEZvblhYbmZ0dVAzS095a1FrUDd1c3kwVW5aZkhmbjRZdjBTcHA5ODExMUJu?=
 =?utf-8?B?U3dxbEFTRDNDUG9aRXRXSlZmKytDeDhvQlU1QlhESDE2VjcrdmJqZmVxbm1K?=
 =?utf-8?B?WWlGZnNncGw5clRTVStOY0o4a0t5NkxFYVB0b3dBbXVuaUhzQXY3ekU5S0dy?=
 =?utf-8?B?Ky9XVHJzYVZ3dXBFMksvQ084Nm0xeWtteEczK1QrUjRRZE1OWkFsQi9ObU9F?=
 =?utf-8?Q?lqaiRXVHAPBq0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3adb31-2242-4265-539b-08d8cd2248c3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 17:44:01.3843 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fbh/iRI/h1Dd2EDgFA+htQwLlmkdgu/Z+XNqzwJpe4ow8dfI/ovaPZU6Ke7vIcmr
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2ViYXN0aWFuLAoKdG8gYmUgaG9uZXN0IEknbSB0aGlua2luZyBhYm91dCB0aGF0IGZvciBx
dWl0ZSBzb21lIHRpbWUgbm93IGFuZCBJIGRvbid0IAp0aGluayB0aGF0IHRoaXMgaXMgcG9zc2li
bGUgd2l0aG91dCBhIHNldmVyZSByZXdyaXRlIG9mIHRoZSBkcml2ZXIuCgpUaGUgcHJvYmxlbSBp
cyBzaW1wbHkgdGhhdCB3ZSBoYXZlIGEgbG90IG9mIGZ1bmN0aW9ucyB3aGljaCBkZWFsIHdpdGgg
CmhhcmR3YXJlIGhhbmRsaW5nIGluZGVwZW5kZW50IG9mIHRoZSBjb250ZXh0LiBCdXQgaG93IHJl
Z2lzdGVycyBhcmUgCmFjY2Vzc2VkIG5lZWRzIHRvIGJlIGRpZmZlcmVudCBkZXBlbmRpbmcgaWYg
eW91ciBhcmUgaW4gdGhlIGludGVycnVwdCAKaGFuZGxlciBvciBub3QuCgpZb3Ugd291bGQgbmVl
ZCB0byBwdXNoIHRoZSBpbmZvcm1hdGlvbiBpZiB3ZSBhcmUgY29taW5nIGluIGZyb20gdGhlIApp
bnRlcnJ1cHQgaGFuZGxlciB0aHJvdWdoIGEgPiAxMCBmdW5jdGlvbiBjYWxscy4KCkkgZG9uJ3Qg
dGhpbmsgdGhhdCB0aGlzIGlzIGZlYXNpYmxlIG5vciBnb29kIGRlc2lnbi4KClJlZ2FyZHMsCkNo
cmlzdGlhbi4KCkFtIDA5LjAyLjIxIHVtIDE3OjUzIHNjaHJpZWIgU2ViYXN0aWFuIEFuZHJ6ZWog
U2lld2lvcjoKPiBPbiAyMDIxLTAyLTA5IDEzOjUwOjMxIFsrMDEwMF0sIENocmlzdGlhbiBLw7Zu
aWcgd3JvdGU6Cj4+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+IGZvciB0aGUgc2VyaWVzLgo+IFRoYW5rIHlvdS4KPiBBbnkgY2hhbmNlIHlv
dSBjb3VsZCBnaXZlIG1lIGEgaGFuZCB3aXRoIHRoZSByZW1haW5pbmcgdGhyZWUgdXNlcnMKPiB3
aXRoaW4gdGhlIGFtZGdwdSBkcml2ZXI/IEkgZG9uJ3Qga25vdyBpZiB0aGUgaW5faW50ZXJydXB0
KCkgY2hlY2sgY2FuCj4gYmUgbGltaXRlZCB0byBjZXJ0YWluIGNhbGxlcnMuCj4gV2hhdCBJIG5v
dGljZWQgd2hpbGUgdHJhY2luZyB2NS4xMCBpcyB0aGlzOgo+Cj4gfCAgICAgICAgICAgICBYb3Jn
LTIyNTcgICAgWzAwN10gZC4uLiA1NzI2MS42MjAwNDM6IGFtZGdwdV9kZXZpY2Vfd3JlZzogMHg2
OTlmLCAweDAwMDAxYmNmLCAweDAwMDAwMTAwCj4gfCAgPT4gdHJhY2VfZXZlbnRfcmF3X2V2ZW50
X2FtZGdwdV9kZXZpY2Vfd3JlZwo+IHwgID0+IGFtZGdwdV9kZXZpY2Vfd3JlZy5wYXJ0LjAKPiB8
ICA9PiBkY2UxMTBfYXJtX3ZlcnRfaW50cgo+IHwgID0+IGRjZTExMF92Ymxhbmtfc2V0Cj4gfCAg
PT4gZG1fZW5hYmxlX3ZibGFuawo+IHwgID0+IGRybV92YmxhbmtfZW5hYmxlCj4gfCAgPT4gZHJt
X3ZibGFua19nZXQKPiB8ICA9PiBkcm1fd2FpdF92YmxhbmtfaW9jdGwKPiB8ICA9PiBkcm1faW9j
dGxfa2VybmVsCj4gfCAgPT4gZHJtX2lvY3RsCj4gfCAgPT4gYW1kZ3B1X2RybV9pb2N0bAo+IHwg
ID0+IF9feDY0X3N5c19pb2N0bAo+IHwgID0+IGRvX3N5c2NhbGxfNjQKPiB8ICA9PiBlbnRyeV9T
WVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUKPgo+IEkgdGhpbmsgdGhhdCBhbWRncHVfZGV2aWNlX3dy
ZWcoKSAtPiBhbWRncHVfa2lxX3dyZWcoKSBjb3VsZCBiZSBpbnZva2VkLgo+IEl0IGRvZXNuJ3Qg
aGVyZSBiZWNhdXNlIGFtZGdwdV9zcmlvdl9ydW50aW1lKCkgaXMgZmFsc2UuCj4gVGhlIHRyYWNl
IHNheXMgYGQnIHdoaWNoIG1lYW5zIGludGVycnVwdHMgYXJlIGRpc2FibGVkIGJ1dAo+IGluX2lu
dGVycnVwdCgpIHdpbGwgcmV0dXJuIGZhbHNlIGluIHRoaXMgY2FzZSAobm8gSVJRL3NvZnRpcnEp
Lgo+Cj4gU2ViYXN0aWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
