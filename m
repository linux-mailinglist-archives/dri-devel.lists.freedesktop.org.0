Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD6B2ED420
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 17:16:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A236E4B0;
	Thu,  7 Jan 2021 16:16:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2046.outbound.protection.outlook.com [40.107.100.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486356E4B0;
 Thu,  7 Jan 2021 16:16:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5CBaimK5GZ7tD0DaDRQc+4UsHDEFN7PnK32xjTQOIklftp0pob/O9U19JWjpjnv7E9YkUtPIBTGcS+1bKwPWmn3onx0bVW/5cyrYXrn22oMcz6c2T5oCt1m5yKdt6NWpPt7EhZtCQhZq4lCDfskdxm5B3SRmQ1kLJyPAl9tyIviiRtLIEwr9cZSv/ZVVR8JMXZLuuVxXqtN19EzGYVrFlr1NBqIrRDWaeRf2/WppN1b68zKBK5U4hFuoj2IfrjmfEq7SVsApNiEfz3yXwgsZiwh6mhrWusCEZPgb0Dz/zVz0Ay4Ijc9nnCQpdcl5uoTpSTe9O5Ff+cmGnEU0gOt5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqLpIc5aJ/b8SkkIqLWnqMyxv28oaWT0hgtrl+lR/ww=;
 b=IG4Ysgm0jzRfqZys8aQjkEgzi1SGoCNxuz1VKzwDpwgUQCmoKmDVW8TYc8X5j0JI5eGJe22BU/4fEAUXj3UaUqJLvKYdcoacbC0tAbeiHzkoIVFvh/Gar9MF4dLc/abAhPaUgAAhoe7NBos+UW6GEYp6FxV5qNgaUVUHzONr30oKgTFb4KYYy1PCEibLe1vT88Odkd7ESvhIuh9D/6PKWDdf315ueufNsWUdxnKvEIuAG1GiSlJ/Bbq7F15gcobM3gKjXy8MW5dlhvyGwcCDg8L2I5zO2HWyqlgwleHIo312GidpSVocOLgmhF0ftJ9JZLjd5onqVbfhFDbcrq1zgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqLpIc5aJ/b8SkkIqLWnqMyxv28oaWT0hgtrl+lR/ww=;
 b=06XN8BsIRsjHtEAw7kGRFfhNi7TQtVpHZqpFotrj0czCuTBzzpiPA4CD8jX1o44D6E75qPUyoFiuMu/DZoswlPJrPMK/I+HEMc6zt5DXvZ7l/QPR2ogf10BdGQa9QkVdwqAJIg+tibazJHDPQ9xGqn+iWec3NCcUxXKNtapw1Fo=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB2417.namprd12.prod.outlook.com (2603:10b6:207:45::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 16:16:17 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 16:16:17 +0000
Subject: Re: [PATCH 29/35] drm/amdgpu: svm bo enable_signal call condition
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <20210107030127.20393-30-Felix.Kuehling@amd.com>
 <b16fcc27-fe4e-88a2-4f23-dcfa9ba69264@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <4875fe7b-737c-60ae-9494-4008d7f8b19f@amd.com>
Date: Thu, 7 Jan 2021 11:16:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <b16fcc27-fe4e-88a2-4f23-dcfa9ba69264@gmail.com>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::31) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YT1PR01CA0152.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 16:16:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e7f9a1cb-b6a2-433e-4aef-08d8b3279049
X-MS-TrafficTypeDiagnostic: BL0PR12MB2417:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB24178C4668E77ECF6E0E057592AF0@BL0PR12MB2417.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ojHGu+h2DpyVS4wLwgai+xrSait5mogH+PhlfTZ6dGHP5fCJ4Cckf0MvVazPjr3LoyowUHRBiUBi/19c4T9MLXRSYB1bwI6TfuM4s4ZKaR1C74BqC90/AAJPHITHpuh8DnueWRyGzLsD0mNujlLfzpEXadW5UjD8sH2eLJjKnBTgBFNbnh51v9tyPvybODrfBWjN7UxsifN4Ac3qBfnLfrFkfwVySbWaXQeTNDuzEuqXu99Sg4tfRegVM36Joubxz/m0dNUEseEQD6uDfJxASVgc84aY3F0NfsUCDrLjkYdfkL/QaCOkSnEX2E1Q3OAOr3EMcquvkok4xH9f+14Ft1+osxJFMe4FpAOatds8386kPmgcFzOjhHoDbQeUwURR2gKYUvGDsGjZgytdIrQmpaLgU8ZvnUdMJOOSSn9tM+eqAmGeHDFvRy3f+W/oXLZ/6g3B0IOBVnZJoxhejHX3P7ccyAh8rhDkzZ0f4zRRX9KMMYN5nTRLcqvUh5zRA8ldSfIb+L/2Er0FdQeXNifwdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(5660300002)(16576012)(66476007)(66946007)(8676002)(316002)(8936002)(2906002)(66556008)(52116002)(66574015)(31696002)(26005)(86362001)(83380400001)(4326008)(44832011)(6486002)(186003)(2616005)(478600001)(36756003)(956004)(31686004)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0xQUk1NTDhXMU9nR1VtQnBIT21XMkpkVzREYS9EaThKZXZRU2NaRDBOUCt5?=
 =?utf-8?B?OEFISngveDZpQU1FQllMTWwzaWhGKy9uQnVCVlVvQ0pjTmRsK1hEeXM4NHFt?=
 =?utf-8?B?Tk5PT0JoaWQyRENyUVl4MjdjSmdlNHZFZzFPbmlhRnpUbFpMUVBVYmFtaDd3?=
 =?utf-8?B?blk5VjRCRGpXMHdOVTVNR3BZc1dheVJkWHJid1B0Qlp3TkZaWG9yUXhkT09k?=
 =?utf-8?B?cmV5azVmbEt4ZVIrWHVsSE1MZlpCaDVpOEp4NnQ0dFo1RWh3cEJaM0FJaXVS?=
 =?utf-8?B?WWFCWE9IeFpRazl3TXlPaDJJbitoWlhvR0Vua1FRdldKb3pWS1UwQTRjRHRU?=
 =?utf-8?B?RzMrWEx3ZFNnOUc2SDBZem9oRVpjUzhOZDJ5MnZSN21OMGRtYW1rOHUwRTNJ?=
 =?utf-8?B?am13QTVKOEhwRklTRloxZWZ2OUZBNjFZTUwrcG0veXRYam1QMyt5elBKN2Ro?=
 =?utf-8?B?NGNnbmVLblgvcG9hMy96QXRVRFh3M2E3azBYNTNkRFNIRDg0Qmg0VytHNVpS?=
 =?utf-8?B?Rk9MQVNuWWw0UmRFdkpVS1M1TVRQWHZ5R1ZITmVjY2hacXRCNFl3S0g2eFRW?=
 =?utf-8?B?Mlp2S3RmWjBJQ0hxR283MFJCSm9VejNDMGw1NFg5TGh2eGJTQ01FdE9ab2kr?=
 =?utf-8?B?Yk9ZNWg4M1JDWHBPbVdTNURFZkJhcFhybUF0RE9FOHh4TDFSSGZyenhKck5S?=
 =?utf-8?B?ZFY1cy9UTHFkcmdXVHRBL0t6TTFJMDZzbENDYkdBWGJ0c0F2dnI5NGVMQnhl?=
 =?utf-8?B?VlBJNE9NQnR6bk00Y0lEeVlZMHhScWtwbVllbHo1S1JiaTNFTWdqS2QzNjhI?=
 =?utf-8?B?dHdmc0kwaythNTRMV2ptOWMwbmg0ZStkakg5RHFnMFJ1Q245cUlKdndXcytt?=
 =?utf-8?B?UWlJeThYaVlYR3JpWkZQc1YybWhjM0F4UVYwQnJqc1FKemIzNW1oZFV2RFBv?=
 =?utf-8?B?SEc1YkNGcGcrdUFHVWdnK2ZWaHhLZlRlWE5pTVVIOGV2b1d2TktRZG96Q25a?=
 =?utf-8?B?a0cvRDRTWStjdkFvNnVDcnBGTXg4OEE2OE9wcXcwL1pBMEw4RFQ2ay8wd3dE?=
 =?utf-8?B?UWtYbUljdXlIaHV6eFF1NnZQSEFlaElJNkZVR0FIaXZhV2VJZ2xFRnhzeHAr?=
 =?utf-8?B?cnFpdCtVeHMwcFlFRDdJd2lSR2VpRFMrMXdLNTNUL2piU2FrVTZKeDk5elZV?=
 =?utf-8?B?d3FKa2xFbC8vYVgxODAyWE1qQ2JpSWtlWVV6dHZJK3JNbWdKVk9lOHIvcFIr?=
 =?utf-8?B?SjhIR2Rsd0lPT2dYVWJtdFp2SmRackFla3h6SmFzS2JkU0NLbkxzMStJZGJE?=
 =?utf-8?Q?RBAy8niUcTA3E52V8n32/IbV4ICkEfl9UQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 16:16:17.7957 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f9a1cb-b6a2-433e-4aef-08d8b3279049
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FlKyf+Bby60Qdf/0sk3xI6Djh6bHKIL/DwigncTmC9ndb1sHK3fxhXEeYQPcB6xVnDsy4YJ60oIXvsegQS5nYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
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
Cc: alex.sierra@amd.com, philip.yang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFtIDIwMjEtMDEtMDcgdW0gNTo1NiBhLm0uIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKCj4g
QW0gMDcuMDEuMjEgdW0gMDQ6MDEgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPj4gRnJvbTogQWxl
eCBTaWVycmEgPGFsZXguc2llcnJhQGFtZC5jb20+Cj4+Cj4+IFt3aHldCj4+IFRvIHN1cHBvcnQg
c3ZtIGJvIGV2aWN0aW9uIG1lY2hhbmlzbS4KPj4KPj4gW2hvd10KPj4gSWYgdGhlIEJPIGNyYXRl
ZCBoYXMgQU1ER1BVX0FNREtGRF9DUkVBVEVfU1ZNX0JPIGZsYWcgc2V0LAo+PiBlbmFibGVfc2ln
bmFsIGNhbGxiYWNrIHdpbGwgYmUgY2FsbGVkIGluc2lkZSBhbWRncHVfZXZpY3RfZmxhZ3MuCj4+
IFRoaXMgYWxzbyBjYXVzZXMgZ3V0dGluZyBvZiB0aGUgQk8gYnkgcmVtb3ZpbmcgYWxsIHBsYWNl
bWVudHMsCj4+IHNvIHRoYXQgVFRNIHdvbid0IGFjdHVhbGx5IGRvIGFuIGV2aWN0aW9uLiBJbnN0
ZWFkIGl0IHdpbGwgZGlzY2FyZAo+PiB0aGUgbWVtb3J5IGhlbGQgYnkgdGhlIEJPLiBUaGlzIGlz
IG5lZWRlZCBmb3IgSE1NIG1pZ3JhdGlvbiB0byB1c2VyCj4+IG1vZGUgc3lzdGVtIG1lbW9yeSBw
YWdlcy4KPgo+IEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGlzIHdpbGwgd29yay4gV2hhdCBleGFjdGx5
IGFyZSB5b3UgZG9pbmcgaGVyZT8KV2UgZGlzY3Vzc2VkIHRoaXMgYSB3aGlsZSBhZ28gd2hlbiB3
ZSB0YWxrZWQgYWJvdXQgcGlwZWxpbmVkIGd1dHRpbmcuCkFuZCB5b3UgYWN0dWFsbHkgaGVscGVk
IHVzIG91dCB3aXRoIGEgZml4IGZvciB0aGF0CihodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvcGF0Y2gvMzc5MDM5LykuCgpTVk0gQk9zIGFyZSBCT3MgaW4gVlJBTSBjb250YWluaW5n
IGRhdGEgZm9yIEhNTSByYW5nZXMuIFdoZW4gc3VjaCBhIEJPCmlzIGV2aWN0ZWQgYnkgVFRNLCB3
ZSBkbyBhbiBITU0gbWlncmF0aW9uIG9mIHRoZSBkYXRhIHRvIHN5c3RlbSBtZW1vcnkKKHRyaWdn
ZXJlZCBieSBrZ2Qya2ZkX3NjaGVkdWxlX2V2aWN0X2FuZF9yZXN0b3JlX3Byb2Nlc3MgaW4gcGF0
Y2ggMzApLgpUaGF0IG1lYW5zIHdlIGRvbid0IG5lZWQgVFRNIHRvIGNvcHkgdGhlIEJPIGNvbnRl
bnRzIHRvIEdUVCBhbnkgbW9yZS4KSW5zdGVhZCB3ZSB3YW50IHRvIHVzZSBwaXBlbGluZWQgZ3V0
dGluZyB0byBhbGxvdyB0aGUgVlJBTSB0byBiZSBmcmVlZApvbmNlIHRoZSBmZW5jZSBzaWduYWxz
IHRoYXQgdGhlIEhNTSBtaWdyYXRpb24gaXMgZG9uZSAodGhlCmRtYV9mZW5jZV9zaWduYWwgY2Fs
bCBuZWFyIHRoZSBlbmQgb2Ygc3ZtX3JhbmdlX2V2aWN0X3N2bV9ib193b3JrZXIgaW4KcGF0Y2gg
MjgpLgoKUmVnYXJkcywKwqAgRmVsaXgKCgo+Cj4gQXMgRGFuaWVsIHBvaW50ZWQgb3V0IEhNTSBh
bmQgZG1hX2ZlbmNlcyBhcmUgZnVuZGFtZW50YWxseSBpbmNvbXBhdGlibGUuCj4KPiBDaHJpc3Rp
YW4uCj4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQWxleCBTaWVycmEgPGFsZXguc2llcnJhQGFtZC5j
b20+Cj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQu
Y29tPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5j
IHwgMTQgKysrKysrKysrKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwo+PiBpbmRl
eCBmNDIzZjQyY2I5YjUuLjYyZDRkYTk1ZDIyZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYwo+PiBAQCAtMTA3LDYgKzEwNywyMCBAQCBzdGF0aWMgdm9pZCBh
bWRncHVfZXZpY3RfZmxhZ3Moc3RydWN0Cj4+IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4gwqDC
oMKgwqDCoCB9Cj4+IMKgIMKgwqDCoMKgwqAgYWJvID0gdHRtX3RvX2FtZGdwdV9ibyhibyk7Cj4+
ICvCoMKgwqAgaWYgKGFiby0+ZmxhZ3MgJiBBTURHUFVfQU1ES0ZEX0NSRUFURV9TVk1fQk8pIHsK
Pj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOwo+PiArwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGRtYV9yZXN2ICpyZXN2ID0gJmJvLT5iYXNlLl9yZXN2Owo+PiArCj4+ICvC
oMKgwqDCoMKgwqDCoCByY3VfcmVhZF9sb2NrKCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBmZW5jZSA9
IHJjdV9kZXJlZmVyZW5jZShyZXN2LT5mZW5jZV9leGNsKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChmZW5jZSAmJiAhZmVuY2UtPm9wcy0+c2lnbmFsZWQpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGRtYV9mZW5jZV9lbmFibGVfc3dfc2lnbmFsaW5nKGZlbmNlKTsKPj4gKwo+PiArwqDCoMKg
wqDCoMKgwqAgcGxhY2VtZW50LT5udW1fcGxhY2VtZW50ID0gMDsKPj4gK8KgwqDCoMKgwqDCoMKg
IHBsYWNlbWVudC0+bnVtX2J1c3lfcGxhY2VtZW50ID0gMDsKPj4gK8KgwqDCoMKgwqDCoMKgIHJj
dV9yZWFkX3VubG9jaygpOwo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+PiArwqDCoMKgIH0K
Pj4gwqDCoMKgwqDCoCBzd2l0Y2ggKGJvLT5tZW0ubWVtX3R5cGUpIHsKPj4gwqDCoMKgwqDCoCBj
YXNlIEFNREdQVV9QTF9HRFM6Cj4+IMKgwqDCoMKgwqAgY2FzZSBBTURHUFVfUExfR1dTOgo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
