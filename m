Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE6231F59D
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 09:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546176EABF;
	Fri, 19 Feb 2021 08:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2693C6EABD;
 Fri, 19 Feb 2021 08:05:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNks0onQVLSClno6D2d8V3+hbwCZugNBPiv1S+QqtrXIHrMo9KB4rro3/licDLYyPu4yJg97mU5vrqYWO2o0bmOSsFuHZuktZjhIsTDmZJGRClyFBvgoXgi2LfMpwWlO9zVnQ0Vwbjf38t5znOZY5F6YBY+e4zeLeDCyCjhnii58HIXriOdX3sh4Q4hxN+5kFCPRFOfKvLUzsSK6IO38MNhMSzBzFpAem0hQyTSa6fAOzviea5yro50tfNk9Ob6Z9gkaiSZll7J464GCIJCs824LBHpiNVM6SrePBgNIYfYmYtQjSh6VBrby0nzyeip+XB2J3liM1jQ6L5kpCZkkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbxc6SzlmWS2xRjFR3R0KA6SJDSe4R4edJV+XBPObbQ=;
 b=iyHKeGjBVDxTi9FHObWd9jmcS2ml+Ofzv2IGRndbZiJ6uGGKE/KKSenRHpmZGYl4ZqLK4jYhvRZFhx3K8uvPRfVwKqtQIMp4dwuPa47vkZEnCE5lq7oWISRyvSCtxTjB2upUolTi2t+0dWszykCiaCrVpDJ+I7/hqyCTcaDyPh50YUNTwq2ZW8YUgcVJuytakt1L6jKF6QSEduuTAMyzMShmdg4QxZn++pxH5iMRPnaA8OuztWpji5sMDRaQnxxyH/U2jPl+CpFNvldEedBR3e6LXpAj/Rb4etss9OfVp57jElO56kenAyyxb6axbhibzqrSClLY2e6sTdK8QhYzfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbxc6SzlmWS2xRjFR3R0KA6SJDSe4R4edJV+XBPObbQ=;
 b=clzN7rq7YlHzc9pgPjHNlEM6qY1HpQsUCfSD5RYrjkHUw+nErS8o+vkUYyQSBMwo1WHSKPMPCDyJvFqvgvXz53k0FLHLO+9THbuXJtAl9shpHqakxj5OgUNrZ2+csQgrRVt+nkunnh3ukwP23jS6NkzS8Yd9j8FFEZfhedg6zPQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2577.namprd12.prod.outlook.com (2603:10b6:207:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Fri, 19 Feb
 2021 08:05:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.038; Fri, 19 Feb 2021
 08:05:11 +0000
Subject: Re: [PATCH] drm/ttm: Fix a memory leak
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
References: <20210219042547.44855-1-xinhui.pan@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9391c170-c345-add6-12e4-735755cfe70a@amd.com>
Date: Fri, 19 Feb 2021 09:05:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210219042547.44855-1-xinhui.pan@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:cf49:9fdd:8d2e:b941]
X-ClientProxiedBy: AM3PR05CA0109.eurprd05.prod.outlook.com
 (2603:10a6:207:2::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:cf49:9fdd:8d2e:b941]
 (2a02:908:1252:fb60:cf49:9fdd:8d2e:b941) by
 AM3PR05CA0109.eurprd05.prod.outlook.com (2603:10a6:207:2::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.28 via Frontend Transport; Fri, 19 Feb 2021 08:05:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ab4c28e5-34ee-407a-30ec-08d8d4ad1470
X-MS-TrafficTypeDiagnostic: BL0PR12MB2577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2577B613E3619107C2BADF9D83849@BL0PR12MB2577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1on7dvbPjdBJCSkmRQ8ksXOWu4toljcmAjGYgj+qGQHnEm/uj+7cGTYZoHx8laRZs2J6i4tKjKnc5FGi4X+3vkeQ6hVhkI5WgpJ3UzScF0GWEpAbuCNZrxpZ36JsHqWaCeUSAJCjEcJy8FoY3Q6TvySRuj8vT34SYywNQPbdLuZXrC5YaXVUwAWzvroiCUjg3sbJ+Hfdviwas2LWE4qhKe27EILjfVLwwuo+ox8TKkUsn3ygtDfmS85G771Ztt4T6a+d44vVrLA0vK+om7tzSYxZBG9RF9M7wkxA6ZRKi8zexaWWrmfUxEiJwd3maIGSa9rfPpcZIuXeuAvNrqrS9yZjbLSBI0q6NjuMO2xX+445PzenC6PRaRNdeHElVw6cLiQPZybO3qROxAXeoWN3O7T0Y9V9j4uGw7EFSinxLUbaox/EbY1//THspKc337SFgcRBZv2715hsfCR1QSLLgi43jK59aHFgALRzYFYLMY0tAIwosVPB3ItCBR+hnhglZEcAFgTVRsn9eo+sWO2pHJr2QNoHZL8ih4lGI9IksD+6sBf5blX0CUzFyMTGYpSi2ui3eG3AmU/SMnAt0TamJbqczC3czRikGd7M457mxgg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(366004)(31686004)(31696002)(316002)(66946007)(52116002)(66574015)(110136005)(2906002)(83380400001)(86362001)(36756003)(478600001)(66476007)(6666004)(186003)(4326008)(66556008)(16526019)(6486002)(2616005)(8676002)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UWFRcnVseDRlbTkxcUNXWnhDMHlJcWFxQW1ISkRieDhNK0hUTmQ1bEw0bDdF?=
 =?utf-8?B?Z2wvaTN4VGZsTXAwOS9ESGk4MG5TYjJibTlHNm9vZHlKb1FZZk84Zlp4VXc4?=
 =?utf-8?B?b1pkaE0xNnhWSzd2TzdaSFF5cFBOSTdSUHhnd3VpNDFURklJUXJrL3pJUytF?=
 =?utf-8?B?S2VaYzNOWStqMW1ZRzhjOTZ4V3pwSUQ2UGw3VkRwemU1dCtHOWc1UWlvNDd2?=
 =?utf-8?B?R1hMa0Ivak0xbUlTWHNiazE4TjQ4dWl4REh6UTh6T3lTUUI1N0RtVFdKVjB2?=
 =?utf-8?B?eHpkbG92U1AzSG5EZ2JMcW1zWENrcFVTUk1qTkp1dk9QbFU0Q1R4VTJGNE9x?=
 =?utf-8?B?WmdlYnlxOUJ2aXdoank5aXlSN2tvbXdSZTFsMXRZbFp5L2JlUVhpZHFHUDZR?=
 =?utf-8?B?bExnREh3WTdrcytmVVhvY1ViMGc3aEFEaU5kTDdIakt3NnRvS09UOWxsSXFL?=
 =?utf-8?B?VHIwYms4akR2Vk1TVnk4UjZPcVVHOEpsR0hvTnRTaHJiTm5oemJhQngrUHlK?=
 =?utf-8?B?OWVCZFRNSDJ5czZYK1V5RXh5YlRIWTRub09BR0Y1WEkvNy83MnVpMjl6aTJq?=
 =?utf-8?B?bGIyMkFuQmVJdnViclF2MnVxRkZSUGlDSFFBNTY0eXhmS3p4WEFCKzVTUFBG?=
 =?utf-8?B?L3k2ZnVsdEY1K05lMjNaUlYvcHh1WGJHZUNsR2JxM2xUMFBPaXUzb2ZoMFdU?=
 =?utf-8?B?ajZjejkvbXFMUXB0V3lRVTdRSGdoT1JaMldWdVRKbjdCSGZhbUxEMkM4QUhj?=
 =?utf-8?B?Q1h6VlZOUWRHRUFodkhzVkhMamNheURCc1c0aFR2SlpNVFJ3SGFwSnQwSnNK?=
 =?utf-8?B?RjQ2ZHVJblI3UENYREViMmZxQW5PbE9MSkJLYzZGNDR5cDFnNWtMNTZyMGJH?=
 =?utf-8?B?NGNMM2YvLy9WMkowM0NyMERhOEJLN2JwMkhYaTQ1eDErV2NmRXhEeWR1U08v?=
 =?utf-8?B?QmwxRCt2c2JYb0Y4S0RFaVZ4blk3bUVDWG16SldwN0o1RHdoQ1RPZHhXcitC?=
 =?utf-8?B?OENXczdrckVnWHV2d01KNldiYkRiRHRrZEhUeTA1RHkyWndOZHNjZjhHSyth?=
 =?utf-8?B?ZGo4bDFUVk1yUW94b2p3KzA4OEp4ek5JRGVjOEwzbDJCT1doTUdHYmhmd3Yx?=
 =?utf-8?B?STNBeEFXbkduV0R3VVN6NG5SdjVqcE1KdzhzTUdJeHJsVzVMVWVrTWxTM21l?=
 =?utf-8?B?M0VoTFVmS1VFUGlGZG5veGg5c2VtYitJR1ZqZEhmYk9rWkZGN0p6SzZFanFm?=
 =?utf-8?B?T3ZhaFNOWDB3ODdiVm5JeC92OGZpcjVxazZJVU1KR1htS0g4NHFvcXVCRTJP?=
 =?utf-8?B?alBaMVRUcGZIQ0JIeGtpR0dlNzhCNmxqSGxPQkQ5RjNxa0lHZmcrWityMjBI?=
 =?utf-8?B?Vi9HTmRXYmdsR0ZwUlNocjJrQU5xYXlnQWxXSm9JbFhWbUpBS0ZIbHdvRkx1?=
 =?utf-8?B?SlRMd2VpZExreFV1Q1dGUUZmVU1KTEZIZWdJMFFOVmQ2NWlJR1ZEaTVFSzY5?=
 =?utf-8?B?RjBqNUJ5d1JYak5kWG5YbWRicWRYVmVETHBjMlE1TnZHZHlBVlBsYjhCV3ht?=
 =?utf-8?B?eDNNQUdTVFhLdUxpb0hBT0p6Q1lOU1pQWXVJYTZVaGNRb2xyVTlOUzRPdmxr?=
 =?utf-8?B?WGlWNzFYaHJSc3VLZ0lUaTIyWFZ5TElVSkRtQURNOFEzd2lFQVJ1cTBNdTBz?=
 =?utf-8?B?Q3cvM1A3YU9xcFlTTmttOXBQMVI3Vng4bVIyaVorMjhRY3pLUGFWcEZtR2JX?=
 =?utf-8?B?WWtpUDQyeFJRRy80djZnU2FsR0ppN3M2WVVldEN0ZmhBSnRqVnl4TkM3TEs5?=
 =?utf-8?B?LzBYSE5HTW9BMkRSdlhVZXphazZsVTJ6Y2J4cEcwNlBteWJseUdlNjJwTUMz?=
 =?utf-8?Q?KBimN9ZjovQGD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4c28e5-34ee-407a-30ec-08d8d4ad1470
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2021 08:05:11.2101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTBQhpcHWr/efGMNi3cbigLJHKQE0vGed2krQv5feWfUoQE5YTFU6fH/vBoiVTod
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2577
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
Cc: alexander.deucher@amd.com, Felix.Kuehling@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWGluaHVpLAoKeW91IGFsc28gbmVlZCB0byBDQyBkcmktZGV2ZWwgZm9yIFRUTSBwYXRjaGVz
LCBidXQgYXBhcnQgZnJvbSB0aGF0IGl0IGlzIAphIHJlYWxseSBnb29kIGNhdGNoLgoKQW0gMTku
MDIuMjEgdW0gMDU6MjUgc2NocmllYiB4aW5odWkgcGFuOgo+IEZyZWUgdGhlIG1lbW9yeSBvbiBm
YWlsdXJlLgo+IEFsc28gbm8gbmVlZCB0byByZS1hbGxvYyBtZW1vcnkgb24gcmV0cnkuCj4KPiBT
aWduZWQtb2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFuQGFtZC5jb20+CgpSZXZpZXdlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDQzogc3RhYmxl
QHZnZXIua2VybmVsLm9yZyAjIDUuMTEKCkdvaW5nIHRvIHB1c2ggdGhhdCB0byBkcm0tbWlzYy1m
aXhlcyBpbiBhIE1pbnV0ZSBzaW5jZSB0aGF0IGlzIGEgcmVhbGx5IAppbXBvcnRhbnQgb25lLgoK
VGhhbmtzLApDaHJpc3RpYW4uCgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
YyB8IDkgKysrKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggZTM4MTAyMjgyZmQ1Li5hOTdk
NDFmNGNlM2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBAQCAtOTA2LDggKzkwNiwxMCBAQCBz
dGF0aWMgaW50IHR0bV9ib19ib3VuY2VfdGVtcF9idWZmZXIoc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibywKPiAgIAkJcmV0dXJuIHJldDsKPiAgIAkvKiBtb3ZlIHRvIHRoZSBib3VuY2UgZG9t
YWluICovCj4gICAJcmV0ID0gdHRtX2JvX2hhbmRsZV9tb3ZlX21lbShibywgJmhvcF9tZW0sIGZh
bHNlLCBjdHgsIE5VTEwpOwo+IC0JaWYgKHJldCkKPiArCWlmIChyZXQpIHsKPiArCQl0dG1fcmVz
b3VyY2VfZnJlZShibywgJmhvcF9tZW0pOwo+ICAgCQlyZXR1cm4gcmV0Owo+ICsJfQo+ICAgCXJl
dHVybiAwOwo+ICAgfQo+ICAgCj4gQEAgLTkzOCwxOCArOTQwLDE5IEBAIHN0YXRpYyBpbnQgdHRt
X2JvX21vdmVfYnVmZmVyKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJICogc3Rv
cCBhbmQgdGhlIGRyaXZlciB3aWxsIGJlIGNhbGxlZCB0byBtYWtlCj4gICAJICogdGhlIHNlY29u
ZCBob3AuCj4gICAJICovCj4gLWJvdW5jZToKPiAgIAlyZXQgPSB0dG1fYm9fbWVtX3NwYWNlKGJv
LCBwbGFjZW1lbnQsICZtZW0sIGN0eCk7Cj4gICAJaWYgKHJldCkKPiAgIAkJcmV0dXJuIHJldDsK
PiArYm91bmNlOgo+ICAgCXJldCA9IHR0bV9ib19oYW5kbGVfbW92ZV9tZW0oYm8sICZtZW0sIGZh
bHNlLCBjdHgsICZob3ApOwo+ICAgCWlmIChyZXQgPT0gLUVNVUxUSUhPUCkgewo+ICAgCQlyZXQg
PSB0dG1fYm9fYm91bmNlX3RlbXBfYnVmZmVyKGJvLCAmbWVtLCBjdHgsICZob3ApOwo+ICAgCQlp
ZiAocmV0KQo+IC0JCQlyZXR1cm4gcmV0Owo+ICsJCQlnb3RvIG91dDsKPiAgIAkJLyogdHJ5IGFu
ZCBtb3ZlIHRvIGZpbmFsIHBsYWNlIG5vdy4gKi8KPiAgIAkJZ290byBib3VuY2U7Cj4gICAJfQo+
ICtvdXQ6Cj4gICAJaWYgKHJldCkKPiAgIAkJdHRtX3Jlc291cmNlX2ZyZWUoYm8sICZtZW0pOwo+
ICAgCXJldHVybiByZXQ7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
