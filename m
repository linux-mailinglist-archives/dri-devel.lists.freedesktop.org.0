Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F29735F75B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF62B6E939;
	Wed, 14 Apr 2021 15:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3487B6E939;
 Wed, 14 Apr 2021 15:15:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJ32uAq2QahFYH5ipBVSLu+oW6BeVFU13ijj73xP5JmG3hKXd2yGJDkJo98mpyIHvcW0s0hMq6a6dM8WbCQt/tRnYd/F28091e3f04V9fkd8yGLXu1ZJLu+yhSF1suSVsHZ9n8KK1/F9M7hCowv7ZUfKQgbYXN52AF70OHmLacdR4qnUZfyKVrWC+dGer78miuIoK7ZsM204hsjqi39lfDJ3PQS0yD+OYo6hYzoHDbkrVTkhzovw/dasC9xBVJO03hhbXiNyyLq4FXgElsUB4gZ5G58wcEbrcnRQ1ZmcS4Q8GjqdO6+DFUylnNsuTKzcOA1JJgpergvegFG5EAxhqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1B4vuia7t2xfYKIjUxP2hkPdprQ6IDF730/fNKc3OHc=;
 b=eezRvIAQM5D3P9Co/cKExqrIgF5b9TPBks9btVpC7EBSe0KGbF4IlOJGtHugM3fiUW4QXp0sroftCvF7U99QYtZrwR1qCRXQ3BRqM6VtxZCfaEOad5BinpYLV2/urjwatQvilGreUBRRYX2r69u09KT/loGlTQjdrZmZmddO7uyTHhiGqkWWA7FMRwhlgJNZ5AylDiFoPSy8fHd+oXo9q2vDIENFylcvXOa0Tvx2QY+AU9a39wJV6NZRjYKwSAr1/vhT2QrvGNDDBSW7PkQcRTzTqaQvGYJuMcQhEUzdJv9G7+I4tzVmowBcLPjyh4U02NkT8SR6y+CnjGCO7oEAeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1B4vuia7t2xfYKIjUxP2hkPdprQ6IDF730/fNKc3OHc=;
 b=UFrRDCUnMVo0ADh7sQYOTvlPjrlNvD6v5mNDrvi3YHlUaQLQd6md6JsSl5ViN4Ql9zVjHu0rwcqLBz5wwz92v1KhSJklRzCLD7AAWHG2FLxzawgZAXqVAErtlroWroOhkFP9nuUXZX3tOCD+DGYFG5fwEyrYaCNZRYteIYZdTqY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB2386.namprd12.prod.outlook.com (2603:10b6:207:47::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 15:15:12 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 15:15:12 +0000
Subject: Re: [PATCH 9/9] drm/amdgpu: Lock the attached dmabuf in unpopulate
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
 <20210414064621.29273-10-Felix.Kuehling@amd.com>
 <517032d9-1a37-ed7b-1443-9f5148e2f457@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <bf7a332a-b696-dc49-efa8-2fec477e3bbd@amd.com>
Date: Wed, 14 Apr 2021 11:15:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <517032d9-1a37-ed7b-1443-9f5148e2f457@amd.com>
Content-Language: en-US
X-Originating-IP: [142.182.180.233]
X-ClientProxiedBy: YTOPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::38) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.180.233) by
 YTOPR0101CA0025.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Wed, 14 Apr 2021 15:15:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b579e5e-2000-485c-8a37-08d8ff58198b
X-MS-TrafficTypeDiagnostic: BL0PR12MB2386:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2386F4588C732802B7B62048924E9@BL0PR12MB2386.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rvRP/cHRrAFxFjOLnBU7kdcSAplhty1xc1oVS9eIgsOm3St7zAwlALks+PiRf5GF/iOV1blHYt1OfNQXgXN6ve1l7KhbxHjPAqW5lbgqiPuc3OnPjGLEdrkghJaTG1mOptoU+g9ZYmm4e09FojAfxw098wxBLOORXEcyDjXBdnKTqhJH6ejCSPXYrkh62ToAz+KSu6A2v5lB846p0AEQ0tZ4gnjidPbXVAXu9K0NSNt1gB7hRAYd0L0MSCwm5BP/3QOwIALC2uYBY9mB3etyNDLwQJNbuIyfNJFl5DXcPDcWUgIVYQtgw6nx1UPaSF0BH8GkUzW9FOpLwPNpRJ34BPLPCG4MVkM720fW88CRoNXNcgeFyN6lnAwHibcwop5xT5/nvsvjOx4DyRJM9tHotxMZIPhp4AGTkgJWR2XQFsc0uSrMLc0WmdMPD0RJc9v841KyU6oCvQb1sMPZILohJCi/OteQjk80P/N2Tmhp8SP1V0cwLK6TxYBi5pioHeDkV3oS4T62R8ZksNQ3t5ALqDJ5fFIQzEvylcp10jTtaMwWoJaYNWea8UzbkH0mYaGTQespYCA+GqyYBBBpTg09T31/nuWXa19J53ZNYfYXSYYXJNKn/rSFix+B+ODZtk8S4Ec0Wndh/hgU1LUgoiwidyfzYA0hGzcC+aKDlnY0dykIQW15T6s8/tNLw5Xvafxp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(31696002)(956004)(2616005)(86362001)(36756003)(38100700002)(66574015)(44832011)(8676002)(8936002)(83380400001)(5660300002)(31686004)(478600001)(66946007)(66476007)(66556008)(16576012)(316002)(16526019)(450100002)(6486002)(2906002)(186003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q1lkRlVsYXpTZTVzS29sZkF4OHNCZnlSRHZPZFFGc0xkS3FUb2x2ZkdmS1Bm?=
 =?utf-8?B?dzF0U1NSL3FlRjQyQ0dXeW1LNlJzK2FLSVY1THZKL05HWFFxVjZYTTFGSlRV?=
 =?utf-8?B?L3ppUXZsbzJRVHI2TC9ZeWJaa05EN3pHcTEwK0ZEMUtFN1BRYk9vcy9JWlkx?=
 =?utf-8?B?YWsvZWdiN0VKLzhHb2ZwRVZQZndDVGRSMjFQd2h3M29oaEU1aGkvUEpQUEo5?=
 =?utf-8?B?RjU5N3p4NXhJekt2ZWdyOWNJNklFMGJja0gzeWlRTWVXTG1oQy9na0M5QTd5?=
 =?utf-8?B?NXF0UTh0UHE0Mm91RUlNZ0M1SVkvdVYzdWxCK3pIenZvaytVVGJHVzhNSkFs?=
 =?utf-8?B?TjV0NFEzb1pEZkFaSnZ0Q0JKU2Z3eGIvc1BqQlV4bWI2Q3lwU3Fld2lEL3VT?=
 =?utf-8?B?Vnl2d0t1LzlUdDhCcEJ0VlljeTVBd2lrZDVTNE5tZFN1ZmFKRUkwSWF0RmNv?=
 =?utf-8?B?YWs4eStrSDgrNTFXTEZiNEIyRlgydTdVVVdUUHN3SVBSK2FRaTZmT2haTFBX?=
 =?utf-8?B?TFY0MzIzeHduLytpYStvOG9Cb002YWhQajBRU3BoaTJ4YVpxN2diQlRaZ0Ru?=
 =?utf-8?B?UkFHaEdDZTd5UEhrZ3RPL0JBTHhiMDNNT2EyZ3pxRlNoZk8vZWt1R3Y1OFJB?=
 =?utf-8?B?VmFMeE0ycnI3R2p2bHkzL3V4YUlaSVNyNzZOd0dIcEdtVy9UVGpWdFBZb0tC?=
 =?utf-8?B?ZWM4dHd0eXhwaEZGZ2F2L3JjVURrTEg1S3lWTHA2ZjhKNHJIWm5EZkpTSitu?=
 =?utf-8?B?MUU5d2lROVVCc3VxQmdVdGpxWE5Lay83cmJlY20wVW0xc0lKZUIrMG9aT3ho?=
 =?utf-8?B?Wk05M3pSeGlFMkVkU2crNVNFeWMrL3lxMEpvWkFjZUMzQnhwZVZVaTh4ZzJ3?=
 =?utf-8?B?TlIzTTRWcFlmSEhiS253THBRL0lGZXlYQVZzaktxTmpxbk9idHNSYU5KbllO?=
 =?utf-8?B?SDFxZE93Y2dCWDdBRmlsemtoNnNXOWJGS0RHWDMvQXRRWUx6TGYwcUJHTlNJ?=
 =?utf-8?B?Q0g0bXQreHAwME5sbnVYNWZFcjI0bXFnQkEzYi95U0VXelBLNUViODZ1Wm9w?=
 =?utf-8?B?c1IwUDFjZ3VrNDNtYkNMV29hVEdqYm5NNVlxVER2VHhYRldtTVpVY0p4YXdW?=
 =?utf-8?B?NDlpdHZjTjJ0MFViUnYzb1ErMzR5Lzh5SXVoOXhKelNjam0vVXFyOEY1M0Ns?=
 =?utf-8?B?cUVyZHhvVjRPTnVIYzZJbjZCVGUzejc1V3RHREdRbGpOdndBTEExRlZqUll2?=
 =?utf-8?B?djFCMVFUT1JnekJLR1JPMnpSQTNGbnc2Z2FGZWhDakdEMllrOG5VOWEyUitN?=
 =?utf-8?B?ODJNbm9oOEV2V1RKaXhIZS9kcTZhUDVtV0JZS0hRSTRRSm9RelNHamdxeTZl?=
 =?utf-8?B?QThuU3RZc3V1Rm5OeVN3RmxPRHZ4N3dUd3BVbEpkU090Ym5IbXVtY1E4bmpx?=
 =?utf-8?B?cW5uOUE1VUtxNHE3UmJiaHVDYkJuOE5QenNWNHlod1J1dVYwVVBFbXZRZ3lZ?=
 =?utf-8?B?c2tzbWpUa09Sc0RHWnc1NC8wOW5YaHkyTllFWElINW9oZUkwU2F4aXZDMHM0?=
 =?utf-8?B?NUxPNGk3VUo5VzhkNytDcEsvSVo0RWNwWEJTQ0RQZ2Z2SmhoRWVzTWF6WEZp?=
 =?utf-8?B?OERmQU9GUElnUTdTZEc2WGY0c3RlY1R4bTNoRkdQODhnMytuc1JIbWk1dVla?=
 =?utf-8?B?R3c1T2M0SzVUM0dSRTc0ZzVIQ3AyZE03SDVMU21CaW5vSzFDK2V1ZW1TYlFy?=
 =?utf-8?B?Njl5SVFuQmxPNVpwK3VkS0V1VE5oblVLci9GMWR5eDZjcUlWNm0wbllqRm8z?=
 =?utf-8?B?YStGcWJjUlFkdWgzSi9jUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b579e5e-2000-485c-8a37-08d8ff58198b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 15:15:12.5149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNdbBGn37gOcBtmMNP4b9fWN7dUIERkC13qPdV+pvIBwaUEVrsdqVZY7jB/8Oe/gI1pUalarPYJykhJBe7dcuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2386
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0xNCB1bSAzOjMzIGEubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFt
IDE0LjA0LjIxIHVtIDA4OjQ2IHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6Cj4+IGFtZGdwdV90dG1f
dHRfdW5wb3B1bGF0ZSBjYW4gYmUgY2FsbGVkIGR1cmluZyBib19kZXN0cm95LiBUaGUKPj4gZG1h
YnVmLT5yZXN2Cj4+IG11c3Qgbm90IGJlIGhlbGQgYnkgdGhlIGNhbGxlciBvciBkbWFfYnVmX2Rl
dGFjaCB3aWxsIGRlYWRsb2NrLiBUaGlzIGlzCj4+IHByb2JhYmx5IG5vdCB0aGUgcmlnaHQgZml4
LiBJIGdldCBhIHJlY3Vyc2l2ZSBsb2NrIHdhcm5pbmcgd2l0aCB0aGUKPj4gcmVzZXJ2YXRpb24g
aGVsZCBpbiB0dG1fYm9fcmVsZWFzZS4gU2hvdWxkIHVubWFwX2F0dGFjaG1lbnQgbW92ZSB0bwo+
PiBiYWNrZW5kX3VuYmluZCBpbnN0ZWFkPwo+Cj4gWWVzIHByb2JhYmx5LCBidXQgSSdtIHJlYWxs
eSB3b25kZXJpbmcgaWYgd2Ugc2hvdWxkIGNhbGwgdW5wb3B1bGF0ZQo+IHdpdGhvdXQgaG9sZGlu
ZyB0aGUgcmVzZXJ2YXRpb24gbG9jay4KClRoZXJlIGlzIGFuIGVycm9yIGhhbmRsaW5nIGNvZGUg
cGF0aCBpbiB0dG1fdHRfcG9wdWxhdGUgdGhhdCBjYWxscwp1bnBvcHVsYXRlLiBJIGJlbGlldmUg
dGhhdCBoYXMgdG8gYmUgaG9sZGluZyB0aGUgcmVzZXJ2YXRpb24gbG9jay4gVGhlCm90aGVyIGNh
c2VzIChkZXN0cm95IGFuZCBzd2Fwb3V0KSBkbyBub3QgaG9sZCB0aGUgbG9jaywgQUlVSS4KClJl
Z2FyZHMsCsKgIEZlbGl4CgoKPgo+IENocmlzdGlhbi4KPgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBG
ZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDEzICsrKysrKysrKysrKysKPj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+PiBpbmRleCA5MzZiM2NmZGRlNTUuLjI1Nzc1MDky
MWVlZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+PiBA
QCAtMTIxNiw5ICsxMjE2LDIyIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV90dG1fdHRfdW5wb3B1bGF0
ZShzdHJ1Y3QKPj4gdHRtX2RldmljZSAqYmRldiwKPj4gwqAgwqDCoMKgwqDCoCBpZiAodHRtLT5z
ZyAmJiBndHQtPmdvYmotPmltcG9ydF9hdHRhY2gpIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaDsKPj4gK8KgwqDCoMKgwqDCoMKgIGJvb2wg
bG9ja2VkOwo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgYXR0YWNoID0gZ3R0LT5nb2JqLT5pbXBv
cnRfYXR0YWNoOwo+PiArwqDCoMKgwqDCoMKgwqAgLyogRklYTUU6IHVucG9wdWxhdGUgY2FuIGJl
IGNhbGxlZCBkdXJpbmcgYm9fZGVzdHJveS4KPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBUaGUgZG1h
YnVmLT5yZXN2IG11c3Qgbm90IGJlIGhlbGQgYnkgdGhlIGNhbGxlciBvcgo+PiArwqDCoMKgwqDC
oMKgwqDCoCAqIGRtYV9idWZfZGV0YWNoIHdpbGwgZGVhZGxvY2suIFRoaXMgaXMgcHJvYmFibHkg
bm90Cj4+ICvCoMKgwqDCoMKgwqDCoMKgICogdGhlIHJpZ2h0IGZpeC4gSSBnZXQgYSByZWN1cnNp
dmUgbG9jayB3YXJuaW5nIHdpdGggdGhlCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogcmVzZXJ2YXRp
b24gaGVsZCBpbiB0dG1fYm9fcmVsZWFzLi4gU2hvdWxkCj4+ICvCoMKgwqDCoMKgwqDCoMKgICog
dW5tYXBfYXR0YWNobWVudCBtb3ZlIHRvIGJhY2tlbmRfdW5iaW5kIGluc3RlYWQ/Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgICovCj4+ICvCoMKgwqDCoMKgwqDCoCBsb2NrZWQgPSBkbWFfcmVzdl9pc19s
b2NrZWQoYXR0YWNoLT5kbWFidWYtPnJlc3YpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFsb2Nr
ZWQpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9yZXN2X2xvY2soYXR0YWNoLT5kbWFi
dWYtPnJlc3YsIE5VTEwpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2J1Zl91bm1hcF9hdHRh
Y2htZW50KGF0dGFjaCwgdHRtLT5zZywgRE1BX0JJRElSRUNUSU9OQUwpOwo+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKCFsb2NrZWQpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9yZXN2X3Vu
bG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVzdik7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB0dG0tPnNn
ID0gTlVMTDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gwqDCoMKgwqDCoCB9Cj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
