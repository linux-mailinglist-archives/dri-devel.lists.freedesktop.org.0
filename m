Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0372297B3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 13:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FA56E12A;
	Wed, 22 Jul 2020 11:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680069.outbound.protection.outlook.com [40.107.68.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4556E12A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 11:50:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0DRD6d0ZXDzwxz7fvJ9WAE+phRptE+qgCGINocn4IUhvcEPdDED1ezllef51dw2A/VB+A1EX2V/ogtV2QrRVL5XryKjfso9IUVOrKTzAQvjwV9SEe7RY697sQD1ytI3fl2tJcWSRw5NuRi/uTeEnfbChdPGOtX6Yt2npjjxygD7X5wOnenmHZGCvi1VaGpypvmHtG+DFRaFtXQyxNn8alfyf/jPi++09AK+ZuzeV9Wcz1dBMEOLLM64sj8pVn0IA6TJ31lIzQuq6Fq0v+8wjux4TWHoYu/X36Iv/GRr390ml66/Nh+zGNVC68GhuIx0/SwRr/4uQ5aJwhYCyo9a+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWYcdIqVikaQGUHCRP/9IoT3wuL7+Gl0vwraObiLGmk=;
 b=Wje0hR9HnyR0GqTUmABStxSgumfBQk1HNhNPOeyQpzODhqnINNXHu7Oyp1axuIQ6LGy5QWYGCXDKQq5u6XKOdEMlkknqMHKPk0RgbafR14MctUXptMomeRznYj2KlPnxeLZtsBzcu4pmdA6YBC8bQGhMKubxbWdXFIGOaV5aiXsKcUoLkeSff+rnXjT5WfL6TJ6iOwIUv1P6ZMYcTcDao3FahOZSnxXWY+oHtv5NcBCaJmZz1jlvWg51BKDSmeX2dNMgbHvqLG4lheq5Ql0AFx6Oc83iqfcTrq0q3Rov/HprLOZFMCPD/k2fNymAG/5EDJmjVjePASZkRlIDuLOasA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CWYcdIqVikaQGUHCRP/9IoT3wuL7+Gl0vwraObiLGmk=;
 b=r0ar6hswlGEzaKV829f8TYLrYuSZwSE1y6L2oL1y6UmaDiylbqZRp+EyUXOaPCQRM+n40/r4Do1UNJocpruzKJLW6i9G7M1goge3EW588sfPTNq5hmTO+L8scxj8ISytAXt8nCYBbd+/xVHgIL3aVqZfRG/FH8TgVxdv89nhu0w=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3774.namprd12.prod.outlook.com (2603:10b6:208:16a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.20; Wed, 22 Jul
 2020 11:49:59 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.021; Wed, 22 Jul 2020
 11:49:59 +0000
Subject: Re: [PATCH 06/11] drm/radeon: stop using TTM_MEMTYPE_FLAG_MAPPABLE
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200721073245.2484-1-christian.koenig@amd.com>
 <20200721073245.2484-6-christian.koenig@amd.com>
 <20200721092448.GE6419@phenom.ffwll.local>
 <8a602078-3dad-4158-6057-07427ea69d74@gmail.com>
 <CAKMK7uE5M8LkuXQp07jveuVz8ybfKW4yoGC4fxJgbG1+9uX_Wg@mail.gmail.com>
 <64366e12-bdaa-a1e7-2fef-3c61d5142651@amd.com>
 <CAKMK7uF-MCP1RJ27HKws-T+QBhSOR2qjCwBDGeuqcS4f2LXgsQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a0e440e3-d5ff-c4d9-0a6d-595513a774fb@amd.com>
Date: Wed, 22 Jul 2020 13:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <CAKMK7uF-MCP1RJ27HKws-T+QBhSOR2qjCwBDGeuqcS4f2LXgsQ@mail.gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:205::34)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR05CA0021.eurprd05.prod.outlook.com (2603:10a6:205::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.21 via Frontend Transport; Wed, 22 Jul 2020 11:49:58 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 39c96e1a-9d4c-42bb-fbd9-08d82e355c90
X-MS-TrafficTypeDiagnostic: MN2PR12MB3774:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3774774410A087211382FE1883790@MN2PR12MB3774.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NSYN2YGpcvPkv4izngCT4DLi+4KdHtfmt3V1hT5BDZHfWRqgUqn8lB0NprJOIcClGJ/gJ8A3wh1U5GmuA0tRKOHtYW7cClsjl/rbRdi2HNpUZsuCKfCHSpKWYvBJHO85jlMAkzP0M+ZDhZkNPb6LfFb385lzwtCT9SqMICYh8I/YPacqlTNkutJZTEZtCLhu/hJP4gGovBEVyWEw5OEbuu6I/8G93bNyAf339ecJDe7rVFzWbRvjc58MR1n3fI262uEXzopYcg1H8FNxkK+Ae3AKJSfT53VvgYL18E9I7lKiYsLJD1JY9AVvUsOv4o/RMbu7owQfjvfCf5P+lAnWXRemFDp1AvharVFH5fCysnFcU2OiSYBMU28Zk6TQGOLy0ESY1IZIpHrVB+wrKwLl71R6MunhUCDxQqlRen7O9Ug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(4326008)(6666004)(2616005)(86362001)(31686004)(66946007)(66476007)(36756003)(31696002)(66556008)(8676002)(8936002)(53546011)(54906003)(52116002)(186003)(16526019)(83380400001)(966005)(6486002)(5660300002)(2906002)(478600001)(45080400002)(6916009)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: oS/H0d9rruOVJyP/iy4eRFxUe0IO3NnsizyEfUZvF2zeNgrac5v+ADJW9DLLbCX+KCnJBUh8qnEl1qHt90gHTS7rdY1ckFm+7sJYgIKQNxlrTbj7cFnn0kNJ3PlNU4ypVMeE51QFFxYzMWrIRwiEuIw9B38FAFHHdNBQ5rgApJrinlH+bJtkmi6LXpZg6FXn51K8RsIMB+ffSJFzlUI1Wv6BQ8MrNkmtzp6s2/PjNuFhfbvih7ei3h9xav3n33dqDw6BT/LnoyiOIgIQ80rvCQq/D5+hQYK+015lHxQ6NjcNwuOuAs5n9fdwE/lYFLfbB2VkMe2zw3iNs9a6HQD4eJ+1b1PsZO5k36pBjDAqH4hi76p+2lBt+76S8PzLcJ1axN/jl8y4HzfUZF2BaSRPD41571klsVTNSzIhjEHD+J7wVZv2ESvI4XMWmpcx/oVisnpr5JtAnBbpRa0j6R+3y7ZTSVLU6PzjwgG65qjleBZI0lYMenKVEPXTwsTFhobPluSiKHjCrCpulLlkVE4uPNjjdbytY/tP1kTLbmdE0w7qeOMIyPuAv8b9ckogCuWk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c96e1a-9d4c-42bb-fbd9-08d82e355c90
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 11:49:59.6593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rs3+PpLgSQAPdw1f5im806Wo+IFqwXSUjf2ZRklOqyb722EXdm1ekk/QTlkWlcei
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3774
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
Cc: Madhav.Chauhan@amd.com, "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDcuMjAgdW0gMTM6NDIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSnVs
IDIyLCAyMDIwIGF0IDE6MTMgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+PiBBbSAyMi4wNy4yMCB1bSAwNzozNCBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4+PiBPbiBUdWUsIEp1bCAyMSwgMjAyMCBhdCA0OjQ2IFBNIENocmlzdGlhbiBLw7Zu
aWcKPj4+IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Pj4gQW0g
MjEuMDcuMjAgdW0gMTE6MjQgc2NocmllYiBkYW5pZWxAZmZ3bGwuY2g6Cj4+Pj4+IE9uIFR1ZSwg
SnVsIDIxLCAyMDIwIGF0IDA5OjMyOjQwQU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+Pj4+PiBUaGUgZHJpdmVyIGRvZXNuJ3QgZXhwb3NlIGFueSBub3QtbWFwYWJsZSBtZW1vcnkg
cmVzb3VyY2VzLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gICAgIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIHwgMTMgKysrKy0tLS0tLS0tLQo+Pj4+Pj4gICAg
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+
Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPj4+Pj4+IGluZGV4IDU0YWYwNmRm
ODY1Yi4uYjQ3NDc4MWEwOTIwIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fdHRtLmMKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX3R0bS5jCj4+Pj4+PiBAQCAtNzYsNyArNzYsNyBAQCBzdGF0aWMgaW50IHJhZGVvbl9pbml0
X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAo+Pj4+
Pj4gICAgICAgIHN3aXRjaCAodHlwZSkgewo+Pj4+Pj4gICAgICAgIGNhc2UgVFRNX1BMX1NZU1RF
TToKPj4+Pj4+ICAgICAgICAgICAgICAgIC8qIFN5c3RlbSBtZW1vcnkgKi8KPj4+Pj4+IC0gICAg
ICAgICAgICBtYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKPj4+Pj4+ICsg
ICAgICAgICAgICBtYW4tPmZsYWdzID0gMDsKPj4+Pj4+ICAgICAgICAgICAgICAgIG1hbi0+YXZh
aWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5HOwo+Pj4+Pj4gICAgICAgICAgICAg
ICAgbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxBR19DQUNIRUQ7Cj4+Pj4+PiAgICAg
ICAgICAgICAgICBicmVhazsKPj4+Pj4+IEBAIC04NCw3ICs4NCw3IEBAIHN0YXRpYyBpbnQgcmFk
ZW9uX2luaXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVpbnQzMl90IHR5
cGUsCj4+Pj4+PiAgICAgICAgICAgICAgICBtYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVu
YzsKPj4+Pj4+ICAgICAgICAgICAgICAgIG1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExf
TUFTS19DQUNISU5HOwo+Pj4+Pj4gICAgICAgICAgICAgICAgbWFuLT5kZWZhdWx0X2NhY2hpbmcg
PSBUVE1fUExfRkxBR19DQUNIRUQ7Cj4+Pj4+PiAtICAgICAgICAgICAgbWFuLT5mbGFncyA9IFRU
TV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7Cj4+Pj4+PiArICAgICAgICAgICAgbWFuLT5mbGFncyA9
IDA7Cj4+Pj4+PiAgICAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0FHUCkKPj4+Pj4+ICAgICAgICAg
ICAgICAgIGlmIChyZGV2LT5mbGFncyAmIFJBREVPTl9JU19BR1ApIHsKPj4+Pj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgaWYgKCFyZGV2LT5kZGV2LT5hZ3ApIHsKPj4+Pj4+IEBAIC05Miw4ICs5
Miw2IEBAIHN0YXRpYyBpbnQgcmFkZW9uX2luaXRfbWVtX3R5cGUoc3RydWN0IHR0bV9ib19kZXZp
Y2UgKmJkZXYsIHVpbnQzMl90IHR5cGUsCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICh1bnNpZ25lZCl0eXBlKTsKPj4+Pj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgfQo+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgaWYgKCFyZGV2LT5kZGV2LT5hZ3AtPmNh
bnRfdXNlX2FwZXJ0dXJlKQo+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYW4t
PmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKPj4+Pj4gVGhlcmUgaXMgYSBidW5j
aCBvZiBhZ3AgZHJpdmVycyAoYWxwaGEsIHBwYywgdGhhdCBraW5kIG9mIHN0dWZmKSB3aXRoIHRo
aXMKPj4+Pj4gZmxhZyBzZXQuIEFuZCByYWRlb24ua28gZGlkIGF0IGxlYXN0IG9uY2Ugd29yayBv
biB0aGVzZS4gQW5kIHlvdXIgcGF0Y2ggdG8KPj4+Pj4gZGlzYWJsZSBhZ3Agb25seSBjaGFuZ2Vz
IHRoZSBkZWZhdWx0LCBpdCBkb2Vzbid0IHJpcCBvdXQgdGhlIGNvZGUuCj4+Pj4gVGhlIGtleSBw
aW50IGlzIHRoYXQgdGhlIGZsYWdzIGZvciBBR1AgYXJlIHRoZSBzYW1lIGFzIHRoZSBvbmUgZm9y
IHRoZQo+Pj4+IFBDSWUgcGF0aC4gU28gbm8gZnVuY3Rpb25hbCBjaGFuZ2UgYXQgYWxsIDopCj4+
PiBJIG1pc3JlYWQgdGhlIGNvZGUgc29tZWhvdywgSSBkaWRuJ3Qgc3BvdCB0aGUgdW5jb25kaXRp
b25hbCBzZXR0aW5nIG9mCj4+PiBGTEFHX01BUFBBQkxFIGZvciBhbGwgVFRNX1BMX1RULCBpcnJl
c3BlY3RpdmUgb2YgYWdwIG9yIG5vdCwgc29tZWhvdwo+Pj4gdGhvdWdodCB0aGF0J3MgYW5vdGhl
ciBjYXNlLgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPgo+PiBBbmQgZm9yIHRoZSBhbWRncHUgcGF0Y2g/IE90aGVyd2lzZSBJIGp1c3Qg
cGluZyBBbGV4IGZvciBhbiByYi4KPiBTZWUgbXkgcXVlc3Rpb24gb3ZlciB0aGVyZSwgSSdtIG5v
dCBzZWVpbmcgaG93IHRoZSBjb2RlIHByZXZlbnRzIG1tYXAKPiBmb3IgQU1ER1BVX1BMXyogZG9t
YWlucyBhZnRlciB5b3VyIHBhdGNoLiBPbmNlIHRoYXQncyBjbGVhcmVkIHVwIGhhcHB5Cj4gdG8g
ci1iIHRoYXQgb25lIGFuZCB0aGUgZmluYWwgb25lIHRvby4KCkkgYWxyZWFkeSByZXBsaWVkLCBz
b3VuZHMgbGlrZSB5b3UgbmV2ZXIgZ290IHRoYXQuCgpBbnl3YXkgc2VlIHRoZSBzd2l0Y2gganVz
dCBiZWxvdyB0aGUgdHdvIGxpbmVzIEkgcmVtb3ZlZDoKPiDCoMKgwqDCoMKgwqDCoCBzd2l0Y2gg
KG1lbS0+bWVtX3R5cGUpIHsKPiDCoMKgwqDCoMKgwqDCoCBjYXNlIFRUTV9QTF9TWVNURU06Ci4u
Li4KPiDCoMKgwqDCoMKgwqDCoCBjYXNlIFRUTV9QTF9UVDoKLi4uCj4gwqDCoMKgwqDCoMKgwqAg
Y2FzZSBUVE1fUExfVlJBTToKLi4uCj4gwqDCoMKgwqDCoMKgwqAgZGVmYXVsdDoKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gwqDCoMKgwqDCoMKgwqAg
fQoKU28gYWdhaW4sIG5vIGZ1bmN0aW9uYWwgY2hhbmdlIGF0IGFsbC4KCkNoZWVycywKQ2hyaXN0
aWFuLgoKPiAtRGFuaWVsCj4KPj4gVGhhbmtzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+Pj4gVGhlIHJl
YWwgaGFuZGxpbmcgb2YgY2FudF91c2VfYXBlcnR1cmUgaXMgaW4gcmFkZW9uX3R0bV9pb19tZW1f
cmVzZXJ2ZSgpLgo+Pj4+Cj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4+IFNvIG5vdCBzdXJlIHlv
dXIgYXNzdW1wdGlvbiBoZXJlIGlzIGNvcnJlY3QuCj4+Pj4+IC1EYW5pZWwKPj4+Pj4KPj4+Pj4+
ICAgICAgICAgICAgICAgICAgICAgICAgbWFuLT5hdmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9G
TEFHX1VOQ0FDSEVEIHwKPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFRUTV9QTF9GTEFHX1dDOwo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAg
ICBtYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX1dDOwo+Pj4+Pj4gQEAgLTEwMyw4
ICsxMDEsNyBAQCBzdGF0aWMgaW50IHJhZGVvbl9pbml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAo+Pj4+Pj4gICAgICAgIGNhc2UgVFRNX1BMX1ZS
QU06Cj4+Pj4+PiAgICAgICAgICAgICAgICAvKiAiT24tY2FyZCIgdmlkZW8gcmFtICovCj4+Pj4+
PiAgICAgICAgICAgICAgICBtYW4tPmZ1bmMgPSAmdHRtX2JvX21hbmFnZXJfZnVuYzsKPj4+Pj4+
IC0gICAgICAgICAgICBtYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRCB8Cj4+Pj4+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgIFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7Cj4+
Pj4+PiArICAgICAgICAgICAgbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQ7Cj4+
Pj4+PiAgICAgICAgICAgICAgICBtYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX0ZMQUdf
VU5DQUNIRUQgfCBUVE1fUExfRkxBR19XQzsKPj4+Pj4+ICAgICAgICAgICAgICAgIG1hbi0+ZGVm
YXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfV0M7Cj4+Pj4+PiAgICAgICAgICAgICAgICBicmVh
azsKPj4+Pj4+IEBAIC0zOTQsNyArMzkxLDYgQEAgc3RhdGljIGludCByYWRlb25fYm9fbW92ZShz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIGV2aWN0LAo+Pj4+Pj4KPj4+Pj4+ICAg
ICBzdGF0aWMgaW50IHJhZGVvbl90dG1faW9fbWVtX3Jlc2VydmUoc3RydWN0IHR0bV9ib19kZXZp
Y2UgKmJkZXYsIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQo+Pj4+Pj4gICAgIHsKPj4+Pj4+IC0g
ICAgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4gPSAmYmRldi0+bWFuW21lbS0+bWVt
X3R5cGVdOwo+Pj4+Pj4gICAgICAgIHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2ID0gcmFkZW9u
X2dldF9yZGV2KGJkZXYpOwo+Pj4+Pj4KPj4+Pj4+ICAgICAgICBtZW0tPmJ1cy5hZGRyID0gTlVM
TDsKPj4+Pj4+IEBAIC00MDIsOCArMzk4LDcgQEAgc3RhdGljIGludCByYWRlb25fdHRtX2lvX21l
bV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV8KPj4+
Pj4+ICAgICAgICBtZW0tPmJ1cy5zaXplID0gbWVtLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVDsK
Pj4+Pj4+ICAgICAgICBtZW0tPmJ1cy5iYXNlID0gMDsKPj4+Pj4+ICAgICAgICBtZW0tPmJ1cy5p
c19pb21lbSA9IGZhbHNlOwo+Pj4+Pj4gLSAgICBpZiAoIShtYW4tPmZsYWdzICYgVFRNX01FTVRZ
UEVfRkxBR19NQVBQQUJMRSkpCj4+Pj4+PiAtICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+
Pj4+PiArCj4+Pj4+PiAgICAgICAgc3dpdGNoIChtZW0tPm1lbV90eXBlKSB7Cj4+Pj4+PiAgICAg
ICAgY2FzZSBUVE1fUExfU1lTVEVNOgo+Pj4+Pj4gICAgICAgICAgICAgICAgLyogc3lzdGVtIG1l
bW9yeSAqLwo+Pj4+Pj4gLS0KPj4+Pj4+IDIuMTcuMQo+Pj4+Pj4KPj4+Pj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+PiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4+Pj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+Pj4+PiBo
dHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZkcmkt
ZGV2ZWwmYW1wO2RhdGE9MDIlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDYjEw
YjFiNjcxNjQ4NDkxNTk5MGQwOGQ4MmUzNDY1ZjQlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5
OTRlMTgzZCU3QzAlN0MwJTdDNjM3MzEwMTQ5ODc0ODc2NTM5JmFtcDtzZGF0YT1VYjglMkYwZDEz
S2tKZHU3WUF0RldwSnRvVlh1VDhSclRld0tTdUJVNlFuWW8lM0QmYW1wO3Jlc2VydmVkPTAKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
