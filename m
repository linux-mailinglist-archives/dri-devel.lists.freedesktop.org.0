Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8396A2C4062
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 13:41:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70B56E8B9;
	Wed, 25 Nov 2020 12:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770081.outbound.protection.outlook.com [40.107.77.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23736E8B9;
 Wed, 25 Nov 2020 12:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SprSn8Q8Rr+qRZGaMkTwjsJAtLdvBBVdpq82kSQYdyoPVS1qRzHSWaYCbYSrohKV8HCYs9NjPyS7WIz35SXtUsy+xtikICYJyLKhQhOEnnT0NATE7n4DU33hnqmvXNimZJ7dOrFX7nQhEj86n0mKTT/zCzGdwLG0kmNCBY3hEw+RXAZABgQ59uZgGZHH0T4XM14GONIdqc8g01151HSEGbr/o7J8furc6yLQEdByhJwHwJHhTbdkoArNKnESL3XST3n0EgQnD/cHhIErndIK97xYCnAj8b27gzvQHLVnx+E4dnZdxij119gjUmVoF7xw1jdoZf+5R9gEuFL41IYgog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6taK16IQ1f+Ca3LgGnqH/gbqSE12T6Sb7QF3J4AUP4=;
 b=jXkWTNoOthtvgZMjs9P2oxcendRzvm9YKh8RLyNrmEE6sYADjLKwuPYMFfPqKYIH04JfnhkPFVV+hBZWD91Z/RkadWxf077O3gmOQbRJn/Q2rTbcGEzJvT9yEDmsLo6uq0bGbWLshhf6EgHBlc0QUi3fzs2meo08EgxH4QrtO4ufsIRyL+F8IlvLnLMkxpXPCY6CYA64mwksDqPWJ3rbRdaPtt3QTohTK22spQooi+oBvjnw49ZW1Jkw/ISVFQ/Fv5cAe3uEiX7w5Py4EG4N5fmf6DkWUcJGimA36DJWkB46KdTRJLJSm1J0eWaxxLnNBXWmfq3t23Y7V1A7u3t8+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6taK16IQ1f+Ca3LgGnqH/gbqSE12T6Sb7QF3J4AUP4=;
 b=QyJ2ri9urfvNvLRv5UkwvwSytSPXP57GokqV9wSFlnV/Et5pIdX80eWLoy8a1lbwVb1/OGXw0A3PJGTIyfsli6F4iwkDa8XwfXjLQTjIOzdZPWelCbHGSfnMqqO4juwuD2kbxpJGqP07dyCDzD7Eq5TYCR/lVaU0ZKhEqAhOHLU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3839.namprd12.prod.outlook.com (2603:10b6:208:168::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Wed, 25 Nov
 2020 12:41:18 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 12:41:18 +0000
Subject: Re: [PATCH 3/6] drm/scheduler: Job timeout handler returns status
To: Steven Price <steven.price@arm.com>, Luben Tuikov <luben.tuikov@amd.com>, 
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
 <20201125031708.6433-4-luben.tuikov@amd.com>
 <40741fd8-4496-2c12-7850-b68fe8dc8e2a@arm.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1e16add5-5740-0235-e181-68a6ea9211be@amd.com>
Date: Wed, 25 Nov 2020 13:41:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <40741fd8-4496-2c12-7850-b68fe8dc8e2a@arm.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0107.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::48) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0107.eurprd06.prod.outlook.com (2603:10a6:208:fa::48) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Wed, 25 Nov 2020 12:41:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 96ce52a0-0bc0-4a5a-91d9-08d8913f67b0
X-MS-TrafficTypeDiagnostic: MN2PR12MB3839:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3839221997F3489D67C0272C83FA0@MN2PR12MB3839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IEAe4GtYAJQFFPbdbLauXB85lQmkfnehXKx3hrcPLAptMr896nNvcTDZZnP8uGnOWGYftpkMEBG1QszV3o0ZPOxOPTEa8YdE3fI28aFKCPw8cEGkqrfTbk3cWsrZOAmC1cWJdDdr+Q7LyhDEx3Z79K/1LJHAI0oghh78e3pEY8mveUas1x2xTJnWeYIs8Krtz7QpWJzGfjpfUPI2W0apZ0Oor+JydESZfhweldIBz2fPenhP1Em1PIVykJkYsYBBYH1EhX0vaCKwf3XiAp3ML5FRoVILQYfBLjqHggJZu8A04W5KqtnRfDX7X4RjanJfAwZpEXwOyVziFZwh7nd8qrpl0vra/lieLiTDPHJKLiI3hPTY0kQZdS00bCAtP51e
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(2906002)(53546011)(8936002)(52116002)(36756003)(6666004)(110136005)(316002)(6486002)(31696002)(8676002)(478600001)(31686004)(16526019)(186003)(86362001)(83380400001)(6636002)(66946007)(66476007)(5660300002)(2616005)(66556008)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?K1pib2d5ZFhPeHA2eVJ6VmVicnRRaUhCRUFFald3eXU1NFM3enBGb2pQMWRI?=
 =?utf-8?B?NEovRGxhZUlzK3ltNkQzTEhla0xGVGU1WHRueEloc1BQTmNNbjVnM3MvcStV?=
 =?utf-8?B?OWgxRVJZYmQ0cFQ3VHI0b1pBcS9SNElHeVllaW1zSGZQc05hWExhT3BtTWVo?=
 =?utf-8?B?YzRiL2l1aGJCMGRSZlJaQldFTmszdlgzcDZ5R0dQdkNnRXkzOFI1WjBjRVEv?=
 =?utf-8?B?UEwwZXk2cUw0R09oelRua2p3SGVwL2VaeUM0YUVTakh0OG9Jck5pcGl0TG5M?=
 =?utf-8?B?L2dVNVFTTHc1czdTUUZ3eU5LQnZobVVmMGtvVUJOZHQ1QXJNV3hsRE5RZEcv?=
 =?utf-8?B?ZFNVTjVaNmhEY1dTcERCZHFjbW1TcTJ1Y2R4TTl2dndjV1ZhckZ6ZFJ6eWZX?=
 =?utf-8?B?Zkc3c0xsbFlkTkdQcGJLTHRocThkYVhyelZ3SjAwMkZCbG9pWnhheS9TVUg4?=
 =?utf-8?B?cE1uZE9mWFZkUzV3dGhYMnFtZlRkMUl3N3hqZjJIczB4dlpURzVKd0YzUExv?=
 =?utf-8?B?ZFFXT0tUZ05lMm15YlQvK1d6d3hyVW1Xa2NvK2dZSUh3akNyQ3ZlZXM1ZkxY?=
 =?utf-8?B?c2RiYjc3YUszeTF0a0FPYi9WVVgvNy85OVpKbGxhdlRvMzAyUTdxV056VzQv?=
 =?utf-8?B?ZnBGSzBOSkpDc2xOMUVvTnRoQklibjVqZ1o2QUluOTJ4QmI5dzFKUTJqdzhp?=
 =?utf-8?B?RGU3RGdTU0RUNHhieUFNck1scE56TSswUDloN2hHbFpwcDFGeElPN3QvUXk1?=
 =?utf-8?B?UnMySHBOSEpqczRrZExJYzFVSU03dzRpYS9zOUZJNkJJSEJ0Sktoenl6MW84?=
 =?utf-8?B?aGZ1dGZVT3ZWZWYrVmdRcDRXRXcvdkx5bnNiV3lqM0lSSDdnekszd2czQUN4?=
 =?utf-8?B?Q3FaWktUTDQwREVTcklLL0Rna3NocHN3d0lIQ05JNzZYU3FVVGxrdzF2bWhp?=
 =?utf-8?B?Sk9xMTNCbnpRSkJFbldpOEFkVzJGRWlCcUIvNGFCcGpDL1N1SFhYL3RweU52?=
 =?utf-8?B?NVNJQ3lQa0xDQ1lDS0p3RFhURkJrVU1ZZ1FvU0dzZW9tb0NwSWdsdm1FbEkr?=
 =?utf-8?B?RWZNUmg4ZXFFYjJRM1M2NXN6R0RGOVpoTzNEUjBKdm4xWTFkVnMwVlFZT0FW?=
 =?utf-8?B?cmQ1UVR6bU9QY0Q4UFhCeFB6Tm9kdjBobjU5K09PSzZJWHBQMkhUQURzZHpK?=
 =?utf-8?B?ZlZTckovWkxpQmVPam9LZHpLMWRudkNOOTFSMlF0QTVOQzVkZ0hIYnZPcmlH?=
 =?utf-8?B?Q0hLcTFhYnJkNURpa1JQU0p0NHp3Y2RGYTRuRll2MHh0bkd1K2g2TEJKM2xF?=
 =?utf-8?B?ZWlxcnluSllDNVdxb3E3bXdVdHNFUG5BVm1icXo0TS9LRzVIN3pEdHBNQkd4?=
 =?utf-8?B?enN0V293N3oyUzFwN2pJNEFaUVdoaHNCTTFDOTFpWDdPMmwxRWhPZERLczF0?=
 =?utf-8?Q?KdjbypDq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ce52a0-0bc0-4a5a-91d9-08d8913f67b0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 12:41:18.4115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpWqaNQBt7fXPywvGEo2DU+/cJIUTKdH4lpnmn6dETswu1DL6yoH+owvM4yxv2Gs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3839
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
Cc: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMTEuMjAgdW0gMTI6MDQgc2NocmllYiBTdGV2ZW4gUHJpY2U6Cj4gT24gMjUvMTEvMjAy
MCAwMzoxNywgTHViZW4gVHVpa292IHdyb3RlOgo+PiBUaGUgam9iIHRpbWVvdXQgaGFuZGxlciBu
b3cgcmV0dXJucyBzdGF0dXMKPj4gaW5kaWNhdGluZyBiYWNrIHRvIHRoZSBEUk0gbGF5ZXIgd2hl
dGhlciB0aGUgam9iCj4+IHdhcyBzdWNjZXNzZnVsbHkgY2FuY2VsbGVkIG9yIHdoZXRoZXIgbW9y
ZSB0aW1lCj4+IHNob3VsZCBiZSBnaXZlbiB0byB0aGUgam9iIHRvIGNvbXBsZXRlLgo+Cj4gSSdt
IG5vdCBzdXJlIEkgdW5kZXJzdGFuZCBpbiB3aGF0IGNpcmN1bXN0YW5jZXMgeW91IHdvdWxkIHdh
bnQgdG8gZ2l2ZSAKPiB0aGUgam9iIG1vcmUgdGltZSB0byBjb21wbGV0ZS4gQ291bGQgeW91IGV4
cGFuZCBvbiB0aGF0Pwo+Cj4gT25lIHRoaW5nIHdlJ3JlIG1pc3NpbmcgYXQgdGhlIG1vbWVudCBp
biBQYW5mcm9zdCBpcyB0aGUgYWJpbGl0eSB0byAKPiBzdXNwZW5kICgic29mdCBzdG9wIiBpcyB0
aGUgTWFsaSBqYXJnb24pIGEgam9iIGFuZCBwaWNrIHNvbWV0aGluZyBlbHNlIAo+IHRvIHJ1bi4g
VGhlIHByb3BpdGlhdG9yeSBkcml2ZXIgc3RhY2sgdXNlcyB0aGlzIHRvIGF2b2lkIHRpbWluZyBv
dXQgCj4gbG9uZyBydW5uaW5nIGpvYnMgd2hpbGUgc3RpbGwgYWxsb3dpbmcgb3RoZXIgcHJvY2Vz
c2VzIHRvIGhhdmUgdGltZSBvbiAKPiB0aGUgR1BVLiBCdXQgdGhpcyBpbnRlcmZhY2UgYXMgaXQg
c3RhbmRzIGRvZXNuJ3Qgc2VlbSB0byBwcm92aWRlIHRoYXQuCgpPbiBBTUQgaGFyZHdhcmUgd2Ug
Y2FsbCB0aGlzIElCIHByZWVtcHRpb24gYW5kIGl0IGlzIGluZGVlZCBub3QgaGFuZGxlZCAKdmVy
eSB3ZWxsIGJ5IHRoZSBzY2hlZHVsZXIgYXQgdGhlIG1vbWVudC4KClNlZSBob3cgdGhlIGFtZGdw
dSBjb2RlIG1lc3NlcyB3aXRoIHRoZSBwcmVlbXB0ZWQgSUJzIHRvIHJlc3RhcnQgdGhlbSAKZm9y
IGV4YW1wbGUuCgpDaHJpc3RpYW4uCgo+Cj4gQXMgdGhlIGtlcm5lbCB0ZXN0IHJvYm90IGhhcyBh
bHJlYWR5IHBvaW50ZWQgb3V0IC0geW91J2xsIG5lZWQgdG8gYXQgCj4gdGhlIHZlcnkgbGVhc3Qg
dXBkYXRlIHRoZSBvdGhlciB1c2VzIG9mIHRoaXMgaW50ZXJmYWNlLgo+Cj4gU3RldmUKPgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgo+PiAt
LS0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jIHzCoCA2ICsr
KystLQo+PiDCoCBpbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmjCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAxMyArKysrKysrKysrLS0tCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYyAKPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfam9iLmMKPj4gaW5kZXggZmY0ODEwMWJhYjU1Li44MWI3Mzc5MGVjYzYgMTAwNjQ0
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuYwo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMKPj4gQEAgLTI4LDcgKzI4
LDcgQEAKPj4gwqAgI2luY2x1ZGUgImFtZGdwdS5oIgo+PiDCoCAjaW5jbHVkZSAiYW1kZ3B1X3Ry
YWNlLmgiCj4+IMKgIC1zdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCBkcm1f
c2NoZWRfam9iICpzX2pvYikKPj4gK3N0YXRpYyBpbnQgYW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1
Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYW1k
Z3B1X3JpbmcgKnJpbmcgPSB0b19hbWRncHVfcmluZyhzX2pvYi0+c2NoZWQpOwo+PiDCoMKgwqDC
oMKgIHN0cnVjdCBhbWRncHVfam9iICpqb2IgPSB0b19hbWRncHVfam9iKHNfam9iKTsKPj4gQEAg
LTQxLDcgKzQxLDcgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2pvYl90aW1lZG91dChzdHJ1Y3QgCj4+
IGRybV9zY2hlZF9qb2IgKnNfam9iKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X3Jpbmdf
c29mdF9yZWNvdmVyeShyaW5nLCBqb2ItPnZtaWQsIAo+PiBzX2pvYi0+c19mZW5jZS0+cGFyZW50
KSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX0VSUk9SKCJyaW5nICVzIHRpbWVvdXQsIGJ1
dCBzb2Z0IHJlY292ZXJlZFxuIiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNf
am9iLT5zY2hlZC0+bmFtZSk7Cj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gMDsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgIMKgwqDCoMKgwqAgYW1kZ3B1
X3ZtX2dldF90YXNrX2luZm8ocmluZy0+YWRldiwgam9iLT5wYXNpZCwgJnRpKTsKPj4gQEAgLTUz
LDEwICs1MywxMiBAQCBzdGF0aWMgdm9pZCBhbWRncHVfam9iX3RpbWVkb3V0KHN0cnVjdCAKPj4g
ZHJtX3NjaGVkX2pvYiAqc19qb2IpCj4+IMKgIMKgwqDCoMKgwqAgaWYgKGFtZGdwdV9kZXZpY2Vf
c2hvdWxkX3JlY292ZXJfZ3B1KHJpbmctPmFkZXYpKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBh
bWRncHVfZGV2aWNlX2dwdV9yZWNvdmVyKHJpbmctPmFkZXYsIGpvYik7Cj4+ICvCoMKgwqDCoMKg
wqDCoCByZXR1cm4gMDsKPj4gwqDCoMKgwqDCoCB9IGVsc2Ugewo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgZHJtX3NjaGVkX3N1c3BlbmRfdGltZW91dCgmcmluZy0+c2NoZWQpOwo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGFtZGdwdV9zcmlvdl92ZihhZGV2KSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYWRldi0+dmlydC50ZHJfZGVidWcgPSB0cnVlOwo+PiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIDE7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoCB9Cj4+IMKgIGRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9ncHVfc2NoZWR1bGVyLmggYi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgKPj4g
aW5kZXggMmUwYzM2OGUxOWY2Li42MWY3MTIxZTFjMTkgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUv
ZHJtL2dwdV9zY2hlZHVsZXIuaAo+PiArKysgYi9pbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmgK
Pj4gQEAgLTIzMCwxMCArMjMwLDE3IEBAIHN0cnVjdCBkcm1fc2NoZWRfYmFja2VuZF9vcHMgewo+
PiDCoMKgwqDCoMKgIHN0cnVjdCBkbWFfZmVuY2UgKigqcnVuX2pvYikoc3RydWN0IGRybV9zY2hl
ZF9qb2IgKnNjaGVkX2pvYik7Cj4+IMKgIMKgwqDCoMKgwqAgLyoqCj4+IC3CoMKgwqDCoMKgwqDC
oMKgICogQHRpbWVkb3V0X2pvYjogQ2FsbGVkIHdoZW4gYSBqb2IgaGFzIHRha2VuIHRvbyBsb25n
IHRvIAo+PiBleGVjdXRlLAo+PiAtwqDCoMKgwqDCoMKgwqDCoCAqIHRvIHRyaWdnZXIgR1BVIHJl
Y292ZXJ5Lgo+PiArwqDCoMKgwqAgKiBAdGltZWRvdXRfam9iOiBDYWxsZWQgd2hlbiBhIGpvYiBo
YXMgdGFrZW4gdG9vIGxvbmcgdG8gZXhlY3V0ZSwKPj4gK8KgwqDCoMKgICogdG8gdHJpZ2dlciBH
UFUgcmVjb3ZlcnkuCj4+ICvCoMKgwqDCoCAqCj4+ICvCoMKgwqDCoCAqIFJldHVybiAwLCBpZiB0
aGUgam9iIGhhcyBiZWVuIGFib3J0ZWQgc3VjY2Vzc2Z1bGx5IGFuZCB3aWxsCj4+ICvCoMKgwqDC
oCAqIG5ldmVyIGJlIGhlYXJkIG9mIGZyb20gdGhlIGRldmljZS4gUmV0dXJuIG5vbi16ZXJvIGlm
IHRoZQo+PiArwqDCoMKgwqAgKiBqb2Igd2Fzbid0IGFibGUgdG8gYmUgYWJvcnRlZCwgaS5lLiBp
ZiBtb3JlIHRpbWUgc2hvdWxkIGJlCj4+ICvCoMKgwqDCoCAqIGdpdmVuIHRvIHRoaXMgam9iLiBU
aGUgcmVzdWx0IGlzIG5vdCAiYm9vbCIgYXMgdGhpcwo+PiArwqDCoMKgwqAgKiBmdW5jdGlvbiBp
cyBub3QgYSBwcmVkaWNhdGUsIGFsdGhvdWdoIGl0cyByZXN1bHQgbWF5IHNlZW0KPj4gK8KgwqDC
oMKgICogYXMgb25lLgo+PiDCoMKgwqDCoMKgwqAgKi8KPj4gLcKgwqDCoCB2b2lkICgqdGltZWRv
dXRfam9iKShzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iKTsKPj4gK8KgwqDCoCBpbnQg
KCp0aW1lZG91dF9qb2IpKHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9qb2IpOwo+PiDCoCDC
oMKgwqDCoMKgIC8qKgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIEBmcmVlX2pvYjogQ2FsbGVk
IG9uY2UgdGhlIGpvYidzIGZpbmlzaGVkIGZlbmNlIGhhcyBiZWVuIAo+PiBzaWduYWxlZAo+Pgo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
