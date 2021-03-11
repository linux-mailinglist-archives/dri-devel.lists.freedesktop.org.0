Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320D336E33
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 09:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8946EB29;
	Thu, 11 Mar 2021 08:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770085.outbound.protection.outlook.com [40.107.77.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAACA6EB29;
 Thu, 11 Mar 2021 08:50:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEGMK4/5DizHRKIQpUSFx4yV29XbEFaxOfB7Rh0dMRFnixYFzPjcItIJD2kfq9/Snk+74HKuA9x4hGRtKT/Z0UpoIjvSUwrKMfjtqHbLtapoThYKZdwGbXriy2aiD/G1z7MOzLldms5N8FC45u0zEcW2ZAPM9QtiWgnyC1Yv8IxMLFRPtNVt6lg8qPBiN4yy/taYY5AfUlwiA6luwi4h2Mx+lK2k1zdr+I0PZo1E05HDnJap1dX6BiU6upExW0pa8OZFkbdCoIhYPCmpgi3sZIfNUDNO/6wb0lz24k1n0i+FD6mZL2VqyIZcPa8yW153e7PKTLJbsDph2h9HyP1IAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/XXndemTbsLL64WrW7GvUIaf6WgXrXg5O5lNJGtjdU=;
 b=MBvgtv44LMzpv7LRoJ6dL7CrqLTmeB8pljig++6Sg+amFEeN7wjp/WxmwzBaj0DSOdMyJrt7l1v5PK6ivLcJiamh6dlKaxJoRGbtK5/+YrXVYxIkrT+rWmzSU44itEVqja0//DhW1Xd9al5oSM8XsojDyjdgrUldGTBWEnz4AyKSUbJ8bbiZcArB7pv5xyXupEDRXi4UuMVcHWdFt8kzOEQUMbuuX3J//n9vQuKGYxtB1lGwTuiY/rWq+6iOIUXPd05htLgznKHDFZr5KV87w2neEJdKjRujei90SN+jYJHFW8nyJj9RRoBwQ+r98zQk2vddxuhHtl6uYl06xnJ3Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/XXndemTbsLL64WrW7GvUIaf6WgXrXg5O5lNJGtjdU=;
 b=OdeITTb0GkSO9jNGSSa5sPI7aRE3U9cwv++wL165TRveKQ3JI2cVLo3XFuE/X4ulcWf+gfxGo46Vcqc4YO4yursf/bA+1l6+aC6K6e0J5wUnrb8sOPq/lLLpCa1menGhhEKHzb3XxbsjdFw2GuBSfuokPvKfNRlgT1ENGlYA78k=
Authentication-Results: arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3837.namprd12.prod.outlook.com (2603:10b6:208:166::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.18; Thu, 11 Mar
 2021 08:50:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3933.031; Thu, 11 Mar 2021
 08:50:20 +0000
Subject: Re: [PATCH v2 1/1] drm/amdkfd: fix build error with AMD_IOMMU_V2=m
To: Felix Kuehling <felix.kuehling@amd.com>, arnd@kernel.org,
 alexander.deucher@amd.com
References: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
 <20210309165018.26213-1-Felix.Kuehling@amd.com>
 <67f7c50a-cc5d-073c-b91b-8c9641e2aa8f@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <bea068f5-dea9-db80-50aa-f65b6315a908@amd.com>
Date: Thu, 11 Mar 2021 09:50:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <67f7c50a-cc5d-073c-b91b-8c9641e2aa8f@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e21c:b1e1:cff0:2c70]
X-ClientProxiedBy: AM9P193CA0004.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::9) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e21c:b1e1:cff0:2c70]
 (2a02:908:1252:fb60:e21c:b1e1:cff0:2c70) by
 AM9P193CA0004.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 08:50:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7611fe70-f789-4a8f-f3e8-08d8e46ab2ea
X-MS-TrafficTypeDiagnostic: MN2PR12MB3837:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3837880E21C85F9747DB32DC83909@MN2PR12MB3837.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yvbGtCS4ZcK+Pv8TIYj6eBTlmVa2/K4qQy2LKyDWO6Cxk8kIqlZHGTuiaWhCwYLUToauj77CMSQOCwtFI8i7HvATbiRnLPtr/aUdkEHCuet49V3d1D6cTIS09fUMPhbHLW+eiSUCIVEkZ/vFgEiiJE+4Xmn7bdbpozdve3ARgbcIk8JbhKReRtgAlOThLiv8WesTTiuzJYG1lSs/K61WuJGkzB6B1clOpFGZreI2jt+UHcM5V0QFQMLKY61c3dZsdNsS01AqXYb+QW1OOj+xKsqGvyQ0Kbf2JTyPu6KHQrM5NXEFTxMLaBw7rGvfOYxMivAP4ZASGjnLU2zCrYS8SIoj/sj1bR9j48eZIs78Oxcn+U/wH68bpiN7VCOMepPPjznoP9eq7WdlX0AkNNODXDIi/nkPM8iQcp6zS2rPiDrQyiR5r5msd6EAO1fNDeMlqG7L8n1PJ/OfBmGiMhZ6o8Y6f95CffJhamgCmuhasZe17qq+ZUP3SnAR2kENjTP/+lXfdpbDU3GJuRkSC/E6llzfMwPiPtWEhUHfc6Ysv0IPVWFHZU5HfI/5CiZaZEsH2bvDPRaRmyv39JocflocckBzBBF4IyR3zm8Yflkki2w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(4326008)(31686004)(2616005)(83380400001)(8936002)(6636002)(66574015)(66556008)(66476007)(316002)(16526019)(86362001)(8676002)(36756003)(52116002)(5660300002)(2906002)(31696002)(53546011)(186003)(478600001)(66946007)(6666004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NWs5RTFOZXBhNDJqTGcwZ0Nad0N2NlZLZE1OaERLZkErYy94M0E1ZGFkNFhR?=
 =?utf-8?B?a3VGYXZHSGFnS01qN2U0aWdxTTRLb2JTRkcvOEQwK3cyajRXSVdtRGNHbjZw?=
 =?utf-8?B?eUxGc0hGTzlwK05iWmhzeDN5WC8wRlZyM0pzZ1lKMWRuMkxFbHY4UVFFVjFm?=
 =?utf-8?B?UU5vQTRxUU1LNnlveHYvUVhURWgyTUhpb1BCSHN5eVNZenFGZ1FRL2pUaHAy?=
 =?utf-8?B?YVRDc1g5RnkxMnZ2M1dqK0NueHFrd3ZqSkNvTUJJRVJUcDlESVpiRFFjb051?=
 =?utf-8?B?a2NNdVJEQmxLSGhNaWhkditFNTBiRW9IenFKTDFoMEM4bTRhbEo5cTNnZUVS?=
 =?utf-8?B?bTlLRGdIdkJ0ei9UWktQbXkwaWlEUWRXdjVOTmI5OW0rSjdrODhOUXVMRlJi?=
 =?utf-8?B?enFBVEszNEQ2RDVMUHB6WStReE1OVyt6Y0ZxckpjOHZmbkM1SW9zeGxBMWZJ?=
 =?utf-8?B?eUdiam5zVlMvYmR2akI1ZGw2Mkc2SEtmMjhwcjlDM0RxbWFXeURCOTc4QU4v?=
 =?utf-8?B?bjZzU3dwbkN5QWJBQnJpZENrQ1pwNHRCL0VYdUZBTWhPUmtHK2FIUko0S0o1?=
 =?utf-8?B?bTFQOVFzRnZBT3VWbURIUk1FdkZRd3RlRzc0eHQwZkNQTXVaeUxvczd6QnR6?=
 =?utf-8?B?azdLWWhpNlhuWWp5SGV1S3JmM2J1bFBVZmVUZi8veWF6ZzdJRWh6N3NWOVBX?=
 =?utf-8?B?Yi9vY2ltcGczeW5EdVdKODhBd0V0VWkyQ3V0eXRVcnh4Y0ZLdjQ3Mk83MG1h?=
 =?utf-8?B?SVBlWkdyZytkbXMyZEduNTRPWWJ6UXJsY2JwMGxCNmd5YUYxdnRQWEJFWGVW?=
 =?utf-8?B?dXZnaThnaTBQa0tabmhDK3U1TTVWRXNYeHY2SWdQNU9TVFZNMkpDeDNzUlNj?=
 =?utf-8?B?TEJvNzdqQ01nRks1b3hKZnZOeVFZUmdKSTBSN2FtdDVwTURsTlp1TTJDRHhk?=
 =?utf-8?B?UEpWZitGamZiSEsyM3Q2dTJZSmQ3RERRNjYzcTUxUlVyRWpDVU9CUTFNbFgz?=
 =?utf-8?B?R1pGVE5VQzAyMGJ6b25CUlVqTzZONjdIZnZGSTI2LzNaK014bXhKcU16UmFh?=
 =?utf-8?B?YTdqYm1WVUM3WnVudzB4cGRUVUNmMXp5eU9YSStJTXlscnVtR0pxRDg5TDVq?=
 =?utf-8?B?cEZXNXpOUHRGdmt4VkxrZlRsZVpPenJQRFJOZ0t6dlNvOTRXOWt2ZmV5T1JZ?=
 =?utf-8?B?MFJNbENFLzRrNEhaUStNWUxJWE1FQkpxekxCaTRoNHFOSG1vb0UxdHZkbzhm?=
 =?utf-8?B?bUg5N2srdlZrbS8zMDNQNDNVRzJLOWFLQ3BYMGtWWVByUVpiNnhtREZOb0V5?=
 =?utf-8?B?cm9rSTc3WmptZDRBd1JvdnpMdEU0WG9GdWk4Tm1md2J0SEpKQ3d4bk8yc2NG?=
 =?utf-8?B?bWdXYTZmZWViRW12UTl6UTIrOGxXcjYvd3FCUUd3c2ZkNUxUTGhKRmphNWZD?=
 =?utf-8?B?ejRrTjZTUGVSQmNrclN3c1FUd2RxMnNsL1ZqZFFnYWNPM0FFa2RRYjNIN3J1?=
 =?utf-8?B?NUVoWlQxUGpjTmJtU1ovbFFwNDIwN0xFWHVTdHRIeGRzeG0xVEduZDRPSzRu?=
 =?utf-8?B?eGh1Y0NsR0Zya3dhK3lheUdtNDBPTlBjWCs2YVA0VFhrdjBXZ29KTHpWZCtV?=
 =?utf-8?B?a2ljOUVEQWNOR2xCczk2SnhJZXBHZHp5SXlEbVNMYmU2bi9NTXd5MGZiYjhK?=
 =?utf-8?B?d1g5RTNEdXpFTElNWlh1SEtJQzY5REtZUzg0Ly9OeXl1aEM2a3htK1JCN2dq?=
 =?utf-8?B?UEhoTDBQUlU3UENHSmZGZnQrRFk4MGVqMGxPT0pQK3NtaGxnYmVXZVpnRjY1?=
 =?utf-8?B?c3dJb0MvVU0xN2IwMHlyK29NaW1Ud1lrSSthMDBqcEViUjFvTUYvbnhRNjhn?=
 =?utf-8?Q?LWnkt+q+Tt9CW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7611fe70-f789-4a8f-f3e8-08d8e46ab2ea
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 08:50:20.2787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBQBk1EDC5jk63lMZfmh2Av1Rk7Xn0iyKSJvw7kkzDBq7OTzq5Aub/s5yV1UyiF9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3837
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
Cc: airlied@linux.ie, arnd@arndb.de, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMDMuMjEgdW0gMjM6MTMgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPiBPbiAyMDIxLTAz
LTA5IDExOjUwIGEubS4sIEZlbGl4IEt1ZWhsaW5nIHdyb3RlOgo+PiBVc2luZyAnaW1wbHkgQU1E
X0lPTU1VX1YyJyBkb2VzIG5vdCBndWFyYW50ZWUgdGhhdCB0aGUgZHJpdmVyIGNhbiBsaW5rCj4+
IGFnYWluc3QgdGhlIGV4cG9ydGVkIGZ1bmN0aW9ucy4gSWYgdGhlIEdQVSBkcml2ZXIgaXMgYnVp
bHQtaW4gYnV0IHRoZQo+PiBJT01NVSBkcml2ZXIgaXMgYSBsb2FkYWJsZSBtb2R1bGUsIHRoZSBr
ZmRfaW9tbXUuYyBmaWxlIGlzIGluZGVlZAo+PiBidWlsdCBidXQgZG9lcyBub3Qgd29yazoKPj4K
Pj4geDg2XzY0LWxpbnV4LWxkOiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW9tbXUu
bzogaW4gZnVuY3Rpb24gCj4+IGBrZmRfaW9tbXVfYmluZF9wcm9jZXNzX3RvX2RldmljZSc6Cj4+
IGtmZF9pb21tdS5jOigudGV4dCsweDUxNik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFtZF9p
b21tdV9iaW5kX3Bhc2lkJwo+PiB4ODZfNjQtbGludXgtbGQ6IGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9pb21tdS5vOiBpbiBmdW5jdGlvbiAKPj4gYGtmZF9pb21tdV91bmJpbmRfcHJv
Y2Vzcyc6Cj4+IGtmZF9pb21tdS5jOigudGV4dCsweDY5MSk6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gCj4+IGBhbWRfaW9tbXVfdW5iaW5kX3Bhc2lkJwo+PiB4ODZfNjQtbGludXgtbGQ6IGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pb21tdS5vOiBpbiBmdW5jdGlvbiAKPj4gYGtmZF9p
b21tdV9zdXNwZW5kJzoKPj4ga2ZkX2lvbW11LmM6KC50ZXh0KzB4OTY2KTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byAKPj4gYGFtZF9pb21tdV9zZXRfaW52YWxpZGF0ZV9jdHhfY2InCj4+IHg4Nl82
NC1saW51eC1sZDoga2ZkX2lvbW11LmM6KC50ZXh0KzB4OTdmKTogdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byAKPj4gYGFtZF9pb21tdV9zZXRfaW52YWxpZF9wcHJfY2InCj4+IHg4Nl82NC1saW51eC1s
ZDoga2ZkX2lvbW11LmM6KC50ZXh0KzB4OWE0KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byAKPj4g
YGFtZF9pb21tdV9mcmVlX2RldmljZScKPj4geDg2XzY0LWxpbnV4LWxkOiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfaW9tbXUubzogaW4gZnVuY3Rpb24gCj4+IGBrZmRfaW9tbXVfcmVz
dW1lJzoKPj4ga2ZkX2lvbW11LmM6KC50ZXh0KzB4YTlhKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0
byAKPj4gYGFtZF9pb21tdV9pbml0X2RldmljZScKPj4geDg2XzY0LWxpbnV4LWxkOiBrZmRfaW9t
bXUuYzooLnRleHQrMHhhZGMpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIAo+PiBgYW1kX2lvbW11
X3NldF9pbnZhbGlkYXRlX2N0eF9jYicKPj4geDg2XzY0LWxpbnV4LWxkOiBrZmRfaW9tbXUuYzoo
LnRleHQrMHhhZmYpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIAo+PiBgYW1kX2lvbW11X3NldF9p
bnZhbGlkX3Bwcl9jYicKPj4geDg2XzY0LWxpbnV4LWxkOiBrZmRfaW9tbXUuYzooLnRleHQrMHhj
NzIpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIAo+PiBgYW1kX2lvbW11X2JpbmRfcGFzaWQnCj4+
IHg4Nl82NC1saW51eC1sZDoga2ZkX2lvbW11LmM6KC50ZXh0KzB4ZTA4KTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byAKPj4gYGFtZF9pb21tdV9zZXRfaW52YWxpZGF0ZV9jdHhfY2InCj4+IHg4Nl82
NC1saW51eC1sZDoga2ZkX2lvbW11LmM6KC50ZXh0KzB4ZTI2KTogdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byAKPj4gYGFtZF9pb21tdV9zZXRfaW52YWxpZF9wcHJfY2InCj4+IHg4Nl82NC1saW51eC1s
ZDoga2ZkX2lvbW11LmM6KC50ZXh0KzB4ZTQyKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byAKPj4g
YGFtZF9pb21tdV9mcmVlX2RldmljZScKPj4KPj4gVXNlIElTX1JFQUNIQUJMRSB0byBvbmx5IGJ1
aWxkIElPTU1VLVYyIHN1cHBvcnQgaWYgdGhlIGFtZF9pb21tdSBzeW1ib2xzCj4+IGFyZSByZWFj
aGFibGUgYnkgdGhlIGFtZGtmZCBkcml2ZXIuIE91dHB1dCBhIHdhcm5pbmcgaWYgdGhleSBhcmUg
bm90LAo+PiBiZWNhdXNlIHRoYXQgbWF5IG5vdCBiZSB3aGF0IHRoZSB1c2VyIHdhcyBleHBlY3Rp
bmcuCj4+Cj4+IEZpeGVzOiA2NGQxYzNhNDNhNmYgKCJkcm0vYW1ka2ZkOiBDZW50cmFsaXplIElP
TU1VdjIgY29kZSBhbmQgbWFrZSBpdCAKPj4gY29uZGl0aW9uYWwiKQo+PiBSZXBvcnRlZC1ieTog
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KPj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3Vl
aGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4gUGluZy4gQ2FuIEkgZ2V0IGFuIFItYiBm
b3IgdGhpcyBwYXRjaC4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Cgo+Cj4gVGhhbmtzLAo+IMKgIEZlbGl4Cj4KPgo+PiAtLS0KPj4gwqAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmMgfCA2ICsrKysrKwo+PiDCoCBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW9tbXUuaCB8IDkgKysrKysrKy0tCj4+IMKg
IDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pb21tdS5jIAo+PiBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pb21tdS5jCj4+IGluZGV4IDY2YmJjYTYx
ZTNlZi4uOTMxODkzNmFhODA1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfaW9tbXUuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRf
aW9tbXUuYwo+PiBAQCAtMjAsNiArMjAsMTAgQEAKPj4gwqDCoCAqIE9USEVSIERFQUxJTkdTIElO
IFRIRSBTT0ZUV0FSRS4KPj4gwqDCoCAqLwo+PiDCoCArI2luY2x1ZGUgPGxpbnV4L2tjb25maWcu
aD4KPj4gKwo+PiArI2lmIElTX1JFQUNIQUJMRShDT05GSUdfQU1EX0lPTU1VX1YyKQo+PiArCj4+
IMKgICNpbmNsdWRlIDxsaW51eC9wcmludGsuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L2Rldmlj
ZS5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+PiBAQCAtMzU1LDMgKzM1OSw1IEBA
IGludCBrZmRfaW9tbXVfYWRkX3BlcmZfY291bnRlcnMoc3RydWN0IAo+PiBrZmRfdG9wb2xvZ3lf
ZGV2aWNlICprZGV2KQo+PiDCoCDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCB9Cj4+ICsKPj4g
KyNlbmRpZgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lv
bW11LmggCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11LmgKPj4gaW5k
ZXggZGQyM2Q5ZmRmNmE4Li5hZmQ0MjBiMDFhMGMgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1ka2ZkL2tmZF9pb21tdS5oCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9pb21tdS5oCj4+IEBAIC0yMyw3ICsyMyw5IEBACj4+IMKgICNpZm5kZWYgX19L
RkRfSU9NTVVfSF9fCj4+IMKgICNkZWZpbmUgX19LRkRfSU9NTVVfSF9fCj4+IMKgIC0jaWYgZGVm
aW5lZChDT05GSUdfQU1EX0lPTU1VX1YyX01PRFVMRSkgfHwgCj4+IGRlZmluZWQoQ09ORklHX0FN
RF9JT01NVV9WMikKPj4gKyNpbmNsdWRlIDxsaW51eC9rY29uZmlnLmg+Cj4+ICsKPj4gKyNpZiBJ
U19SRUFDSEFCTEUoQ09ORklHX0FNRF9JT01NVV9WMikKPj4gwqAgwqAgI2RlZmluZSBLRkRfU1VQ
UE9SVF9JT01NVV9WMgo+PiDCoCBAQCAtNDYsNiArNDgsOSBAQCBzdGF0aWMgaW5saW5lIGludCBr
ZmRfaW9tbXVfY2hlY2tfZGV2aWNlKHN0cnVjdCAKPj4ga2ZkX2RldiAqa2ZkKQo+PiDCoCB9Cj4+
IMKgIHN0YXRpYyBpbmxpbmUgaW50IGtmZF9pb21tdV9kZXZpY2VfaW5pdChzdHJ1Y3Qga2ZkX2Rl
diAqa2ZkKQo+PiDCoCB7Cj4+ICsjaWYgSVNfTU9EVUxFKENPTkZJR19BTURfSU9NTVVfVjIpCj4+
ICvCoMKgwqAgV0FSTl9PTkNFKDEsICJpb21tdV92MiBtb2R1bGUgaXMgbm90IHVzYWJsZSBieSBi
dWlsdC1pbiBLRkQiKTsKPj4gKyNlbmRpZgo+PiDCoMKgwqDCoMKgIHJldHVybiAwOwo+PiDCoCB9
Cj4+IMKgIEBAIC03Myw2ICs3OCw2IEBAIHN0YXRpYyBpbmxpbmUgaW50IAo+PiBrZmRfaW9tbXVf
YWRkX3BlcmZfY291bnRlcnMoc3RydWN0IGtmZF90b3BvbG9neV9kZXZpY2UgKmtkZXYpCj4+IMKg
wqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gwqAgLSNlbmRpZiAvKiBkZWZpbmVkKENPTkZJ
R19BTURfSU9NTVVfVjIpICovCj4+ICsjZW5kaWYgLyogSVNfUkVBQ0hBQkxFKENPTkZJR19BTURf
SU9NTVVfVjIpICovCj4+IMKgIMKgICNlbmRpZiAvKiBfX0tGRF9JT01NVV9IX18gKi8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
