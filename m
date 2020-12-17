Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410A52DD3CC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 16:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 329B46E3DA;
	Thu, 17 Dec 2020 15:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B756E3DA
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 15:10:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnWMhIZlRwFPLe6O3bF4x+i2JOmydryNEn4rdVMcMpLAuHCKRw5/26EF/mu8Ra1JNNAuCoa7/EAVcN7Nn746d2QwjxMV+ztmdTvR+cqZ2DKq7uWYXSEV+PfBs4yfxm/cWUpP7PUBcJ9Wpm1P2eK5sN7lw34WLdXFkRzhRiJF55YrsAQd2QBddfFNDyzMABaCxkEnxI+WUU62zg0hwRcwc0AEISzQuzl+EOBijld2I5YqOUSfuLEmJPA4NuRE/mIuA262gOzeVE8sDzeE163v9I5NylSOavOw2t2HWGnoSUjRY0INsbsM7/ao+Svmln7maEc88D0AYrLj7D3Peq/xpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqZ+DOEedcBvs6KuiCmHIvEN4xP0zQRLkOQyYuVyoh8=;
 b=UMCdP7Hg9PITXtzWb8iK7JTNCpSxxf526cEFOUmT4bQK8XY0MYVf1MACWYK8+g7MXa2kpZfXq8Rt111TAB1xysHyTdbHT3yiIuhKsfUWyaxjiF8zSObvjSdidM3P+basAgDDjauMw/XZNVzf/RQBI/AchAbNeXxu+UJK2NXoWRStBuCE7ErVq9DDLdNwD7LYf6mmwCSULmTyFhRS3tOe8IBgwqoFdVhjZThMqGtPFeOHO6IeLzruelWfIUL+LehSBlrDXoD9uzDvIqdsGx2JHqX+ZIDMs9NNYmqezIUns+86zS6P8Lu7tRQWW6Tk5ywbjXX8X+ZvUuIjpHDdGYB3lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqZ+DOEedcBvs6KuiCmHIvEN4xP0zQRLkOQyYuVyoh8=;
 b=Hbz54MCfYFwBzuWiNvgdJP09xuuBHOAACwHxazUEEtTSTIqIe6mjiOezhrPjvcL0HYtLQoZJhh26Y4uKNiIghHlJdC+kv2cujPxurNPP5a9Z7F+ptyqnmX55LGMsK4Coc7aqIDYo+nMHRUGW05LbrHbk44M9610Mke4jAG38tvY=
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2577.namprd12.prod.outlook.com (2603:10b6:207:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.25; Thu, 17 Dec
 2020 15:10:52 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 15:10:52 +0000
Subject: Re: [PATCH 1/2] drm/ttm: rework ttm_tt page limit v2
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201216140427.1253-1-christian.koenig@amd.com>
 <X9ojPDJv1ybEJT0k@phenom.ffwll.local>
 <2d702307-052c-f59d-a385-f373d1eae823@gmail.com>
 <CAKMK7uFsNY+yj1C_q+=-_0F6Mud-9_YjPTq6wDEBBZ+oeraQaw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <de05379f-87d7-e0f0-d661-b331ee03cea6@amd.com>
Date: Thu, 17 Dec 2020 16:10:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uFsNY+yj1C_q+=-_0F6Mud-9_YjPTq6wDEBBZ+oeraQaw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0101CA0050.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0050.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Thu, 17 Dec 2020 15:10:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 56de2494-54d1-42fc-b6f1-08d8a29df1f7
X-MS-TrafficTypeDiagnostic: BL0PR12MB2577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2577AE426BD20EE177FF862783C40@BL0PR12MB2577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+pSX3IKwr4v1y9gqAF6cbaKbnFGzTe8xVmbrsCqryNDaqpdKEM6EHIdUDMXmLZtGQUIh7f+pVoG8PFzcG3+zSQa0e1vZaIE4pqKY/jHPG7amtvlVEKnd8h0XAoNJBqC50KwAcrO7q1YlYQeM5+CHfIRv+D+70yUfMEwRPaa7spXuFUl2gKmU4bL2MwVzgWnCR9B/n2Jcr8tjn+cd0ics8sQCJDAG70QUUn4xYfIU2oDlj2Wi4et4D7BG0SsAhg341U4X7vu3dGQN/x1ce7A06/cTdKP29+Y6tMBh+ot74Zz7B72DHgMyDEXE0o1BVzL85I/JN42yFQRq+Mnj26kgUVZ7snCkEX8pZjkN3ov963uhfC2vzRArGgBc5HcAYJI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(52116002)(31696002)(6666004)(186003)(6486002)(4326008)(478600001)(66946007)(5660300002)(66476007)(31686004)(66556008)(316002)(8936002)(6916009)(16526019)(2616005)(2906002)(66574015)(83380400001)(36756003)(54906003)(86362001)(53546011)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eDREL1k2aUZ1VEEza1hBWE9jNkJGTmhFdzRrUEdEZmdEcU5WbHhyaVA3VXRT?=
 =?utf-8?B?N2pBcC9GSHJpSzNQL2R5QlNGdUdNbC9YdWNMQ01YVkRheVNxR2duaFljT1BQ?=
 =?utf-8?B?d3lPemlaNXJMOENFUHY0U0d4czJsM004eml4eGdGZnBLd0g5dXJtN1JIdW9Q?=
 =?utf-8?B?Ri9oYlZoV0RjR0NCaWFjQ2lsck5Hc21zNlFpK05ZMldzRFlaUUs4dkhmUjQ4?=
 =?utf-8?B?NCs1VklHYkFrQ0lySG1kMzFRNFdYVEd0cHpTbmtyaWxaNjRxbE9McnhVNmZB?=
 =?utf-8?B?TGVobjdVSnUvV0crY0lFNFIyQTFKNkV4QTZWQkZvVWwrVW5qdmh3aUNPbGZr?=
 =?utf-8?B?WEx5aDFyUTlvRkp6WEwzRWZZem5saGpIbGxJWWFSTGdxdjFhM2ZFa2ZCd2Ru?=
 =?utf-8?B?S2lMaDNrNXBuR291QU5sYmNadUUvQUJJVjdrWlBsUnBVRzM1TTR6ZmsrSnJU?=
 =?utf-8?B?YnZISGQzaVlJS3czSWZObkI1SGtFeEgvSmd3aEhwRnFaYkg4Qkx0czl2b2w0?=
 =?utf-8?B?MHhPc25Vb2RJZXhrWTg2bUJpSlBGWHc1UXhlMjBPSENTVDVEdXVZMkkrbUtu?=
 =?utf-8?B?ZnJVYlp1aDVjakM2cjhqMStZb2svcDdQZFdOWDhlZlpDRFk4dWo4S3pJTDlB?=
 =?utf-8?B?VWhBd3d2Y2pob2lMODMxNlF3SzduUWI3K0szekxERXo1R3pvMGpRaUp3TFhN?=
 =?utf-8?B?UThMaWk3bzJ4M1pGWmZHTmxGclJPakdkcmZONkxiSmdGamk2M1YyQkJSMmhi?=
 =?utf-8?B?c2VxTFNkYytWbFEvR3VIVmhybngwSXpOcGN1NTNlbmIyQmFrS28yZjFTRG1B?=
 =?utf-8?B?d1JXVWFHRldmbmFPTS9aVFoyZHBLUk9xcHhlSjdBbURJSWd3UENmOHJHTmhw?=
 =?utf-8?B?NFRSSDloUlcvR21NdjllWUpWOXNDaXRhUkMxNExaeTFMZXdHRnIxN0RQc0Q4?=
 =?utf-8?B?dG1DR2FCZk9TRExNZXZMcWZXdXF2cnNHYXVXVWFFVmVZbDh1TVlCd0cvZFVv?=
 =?utf-8?B?MVRRWTNaNHA1eW9yNjE0QlBqeEJDTzBuTnhTRkFiTTNvY0N1dERSSmU4YzRK?=
 =?utf-8?B?KzZlR2hJaXBKaFprYUdGSThxWGpyQkl4Vm43YzNMZ3dhMUhNL2h1ZWlvYVpm?=
 =?utf-8?B?UmdGRXhjVkhDZmxlaXRkMk1BVFI2MHFWcWxFVHNHVFltV2xHNUptSncyTnJq?=
 =?utf-8?B?b2ZhZy8xYnkwZWw1WkdJZVdMOVhkY1FKdDFXVTBRME41MXBKcTZWa3J4MWlQ?=
 =?utf-8?B?WlZGRFB1SUNhKy9hd0hLYWZDNERIN0ZLdUZLSk9CS2N3Y1pDaUp1MFl1ZFZy?=
 =?utf-8?B?T2lVT0J5cWZYZWtkUXhCVjQ5MnNTMkVIYjc3NGtONkpwaThmWEJCa0tIVWw4?=
 =?utf-8?B?b1AraCtWYXNLcEpFVFI3SnBqcUcvVmFaS081bWF6VkVIWlROa1p4cFVhWnpY?=
 =?utf-8?Q?CUU5gKtN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 15:10:52.4654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 56de2494-54d1-42fc-b6f1-08d8a29df1f7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6o08CNd6rFFXozRI3g2Aaf1D4YpSCahsU9d5p8YXhK1fyVr/ZCr2QJURlnuwBtlF
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
Cc: Dave Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMTIuMjAgdW0gMTU6MzYgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgRGVj
IDE3LCAyMDIwIGF0IDI6NDYgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1
bWVya2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEFtIDE2LjEyLjIwIHVtIDE2OjA5IHNjaHJpZWIg
RGFuaWVsIFZldHRlcjoKPj4+IE9uIFdlZCwgRGVjIDE2LCAyMDIwIGF0IDAzOjA0OjI2UE0gKzAx
MDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBbU05JUF0KPj4+PiArCj4+Pj4gKy8qIEFz
IGxvbmcgYXMgcGFnZXMgYXJlIGF2YWlsYWJsZSBtYWtlIHN1cmUgdG8gcmVsZWFzZSBhdCBsZWFz
dCBvbmUgKi8KPj4+PiArc3RhdGljIHVuc2lnbmVkIGxvbmcgdHRtX3R0X3Nocmlua2VyX3NjYW4o
c3RydWN0IHNocmlua2VyICpzaHJpbmssCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IHNocmlua19jb250cm9sICpzYykKPj4+PiArewo+Pj4+ICsgICAg
c3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsKPj4+PiArICAgICAgICAgICAgLm5vX3dh
aXRfZ3B1ID0gdHJ1ZQo+Pj4gSWlyYyB0aGVyZSdzIGFuIGV2ZW50dWFsIHNocmlua2VyIGxpbWl0
IHdoZXJlIGl0IGdldHMgZGVzcGVyYXRlLiBJIHRoaW5rCj4+PiBvbmNlIHdlIGhpdCB0aGF0LCB3
ZSBzaG91bGQgYWxsb3cgZ3B1IHdhaXRzLiBCdXQgaXQncyBub3QgcGFzc2VkIHRvCj4+PiBzaHJp
bmtlcnMgZm9yIHJlYXNvbnMsIHNvIG1heWJlIHdlIHNob3VsZCBoYXZlIGEgc2Vjb25kIHJvdW5k
IHRoYXQgdHJpZXMKPj4+IHRvIG1vcmUgYWN0aXZlbHkgc2hyaW5rIG9iamVjdHMgaWYgd2UgZmVs
bCBzdWJzdGFudGlhbGx5IHNob3J0IG9mIHdoYXQKPj4+IHJlY2xhaW0gZXhwZWN0ZWQgdXMgdG8g
ZG8/Cj4+IEkgdGhpbmsgd2Ugc2hvdWxkIHRyeSB0byBhdm9pZCB3YWl0aW5nIGZvciB0aGUgR1BV
IGluIHRoZSBzaHJpbmtlciBjYWxsYmFjay4KPj4KPj4gV2hlbiB3ZSBnZXQgSE1NIHdlIHdpbGwg
aGF2ZSBjYXNlcyB3aGVyZSB0aGUgc2hyaW5rZXIgaXMgY2FsbGVkIGZyb20KPj4gdGhlcmUgYW5k
IHdlIGNhbid0IHdhaXQgZm9yIHRoZSBHUFUgdGhlbiB3aXRob3V0IGNhdXNpbmcgZGVhZGxvY2tz
Lgo+IFVoIHRoYXQgZG9lc24ndCB3b3JrLiBBbHNvLCB0aGUgY3VycmVudCBydWxlcyBhcmUgdGhh
dCB5b3UgYXJlIGFsbG93ZWQKPiB0byBjYWxsIGRtYV9mZW5jZV93YWl0IGZyb20gc2hyaW5rZXIg
Y2FsbGJhY2tzLCBzbyB0aGF0IHNoaXBwZWQgc2FpbGVkCj4gYWxyZWFkeS4gVGhpcyBpcyBiZWNh
dXNlIHNocmlua2VycyBhcmUgYSBsZXNzIHJlc3RyaWN0aXZlIGNvbnRleHQgdGhhbgo+IG1tdSBu
b3RpZmllciBpbnZhbGlkYXRpb24sIGFuZCB3ZSB3YWl0IGluIHRoZXJlIHRvby4KPgo+IFNvIGlm
IHlvdSBjYW4ndCB3YWl0IGluIHNocmlua2VycywgeW91IGFsc28gY2FuJ3Qgd2FpdCBpbiBtbXUK
PiBub3RpZmllcnMgKGFuZCBhbHNvIG5vdCBpbiBITU0sIHfEpWljaCBpcyB0aGUgc2FtZSB0aGlu
ZykuIFdoeSBkbyB5b3UKPiBuZWVkIHRoaXM/CgpUaGUgY29yZSBjb25jZXB0IG9mIEhNTSBpcyB0
aGF0IHBhZ2VzIGFyZSBmYXVsdGVkIGluIG9uIGRlbWFuZCBhbmQgaXQgaXMgCnBlcmZlY3RseSB2
YWxpZCBmb3Igb25lIG9mIHRob3NlIHBhZ2VzIHRvIGJlIG9uIGRpc2suCgpTbyB3aGVuIGEgcGFn
ZSBmYXVsdCBoYXBwZW5zIHdlIG1pZ2h0IG5lZWQgdG8gYmUgYWJsZSB0byBhbGxvY2F0ZSBtZW1v
cnkgCmFuZCBmZXRjaCBzb21ldGhpbmcgZnJvbSBkaXNrIHRvIGhhbmRsZSB0aGF0LgoKV2hlbiB0
aGlzIG1lbW9yeSBhbGxvY2F0aW9uIHRoZW4gaW4gdHVybiB3YWl0cyBmb3IgdGhlIEdQVSB3aGlj
aCBpcyAKcnVubmluZyB0aGUgSE1NIHByb2Nlc3Mgd2UgYXJlIHByZXR0eSBtdWNoIGJ1c3RlZC4K
Cj4+PiBBbHNvIGRvbid0IHdlIGhhdmUgYSB0cnlsb2NrX29ubHkgZmxhZyBoZXJlIHRvIG1ha2Ug
c3VyZSBkcml2ZXJzIGRvbid0IGRvCj4+PiBzb21ldGhpbmcgc3R1cGlkPwo+PiBNaG0sIEknbSBw
cmV0dHkgc3VyZSBkcml2ZXJzIHNob3VsZCBvbmx5IGJlIG1pbmltYWwgaW52b2x2ZWQuCj4gSW4g
dGhlIG1vdmUgY2FsbGJhY2sgdGhleSBtaWdodCB0cnkgdG8gYWNxdWlyZSBvdGhlciBsb2Nrcy4g
T3IgaXMgdGhhdAo+IGEgZHJpdmVyIGJ1Zz8KClRoYXQgd291bGQgYmUgYSByYXRoZXIgc2VyaW91
cyBkcml2ZXIgYnVnIGF0IHRoZSBtb21lbnQuCgo+IEp1c3Qga2luZGEgZmVlbHMgd3JvbmcgaWYg
d2UgaGF2ZSB0aGlzIGFuZCBkb24ndCBzZXQgaXQuCj4KPj4+PiArICAgIH07Cj4+Pj4gKyAgICBp
bnQgcmV0Owo+Pj4+ICsKPj4+PiArICAgIGlmIChzYy0+Z2ZwX21hc2sgJiBHRlBfTk9GUykKPj4+
PiArICAgICAgICAgICAgcmV0dXJuIDA7Cj4+Pj4gKwo+Pj4+ICsgICAgcmV0ID0gdHRtX2JvX3N3
YXBvdXQoJmN0eCwgR0ZQX05PRlMpOwo+Pj4+ICsgICAgcmV0dXJuIHJldCA8IDAgPyBTSFJJTktf
RU1QVFkgOiByZXQ7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gKy8qIFJldHVybiB0aGUgbnVtYmVyIG9m
IHBhZ2VzIGF2YWlsYWJsZSBvciBTSFJJTktfRU1QVFkgaWYgd2UgaGF2ZSBub25lICovCj4+Pj4g
K3N0YXRpYyB1bnNpZ25lZCBsb25nIHR0bV90dF9zaHJpbmtlcl9jb3VudChzdHJ1Y3Qgc2hyaW5r
ZXIgKnNocmluaywKPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c3RydWN0IHNocmlua19jb250cm9sICpzYykKPj4+PiArewo+Pj4+ICsgICAgc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibzsKPj4+PiArICAgIHVuc2lnbmVkIGxvbmcgbnVtX3BhZ2VzID0gMDsK
Pj4+PiArICAgIHVuc2lnbmVkIGludCBpOwo+Pj4+ICsKPj4+PiArICAgIGlmIChzYy0+Z2ZwX21h
c2sgJiBHRlBfTk9GUykKPj4+PiArICAgICAgICAgICAgcmV0dXJuIDA7Cj4+PiBUaGUgY291bnQg
ZnVuY3Rpb24gc2hvdWxkIGFsd2F5cyBjb3VudCwgYW5kIEknbSBub3Qgc2VlaW5nIGEgcmVhc29u
IHdoeQo+Pj4geW91IGNvdWxkbid0IGRvIHRoYXQgaGVyZSAuLi4gQWxzbyBteSB1bmRlcnN0YW5k
aW5nIGlzIHRoYXQgR0ZQX05PRlMgbmV2ZXIKPj4+IGdvZXMgaW50byBzaHJpbmtlcnMgKHRoZSBO
T0ZTIGNvbWVzIGZyb20gc2hyaW5rZXJzIG9yaWdpbmFsbHkgb25seSBiZWluZwo+Pj4gdXNlZCBm
b3IgZmlsZXN5c3RlbSBvYmplY3RzKSwgc28gdGhpcyBpcyBkb3VibGUgcmVkdW5kYW50Lgo+Pj4K
Pj4+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBnZnBfbWFzayBpcyBqdXN0IHRvIGNvbnZleSB0
aGUgcmlnaHQgem9uZXMgYW5kCj4+PiBzdHVmZiwgc28gdGhhdCB5b3VyIHNocmlua2VyIGNhbiB0
cnkgdG8gc2hyaW5rIG9iamVjdHMgaW4gdGhlIHJpZ2h0IHpvbmVzLgo+Pj4gSGVuY2UgSSB0aGlu
ayB0aGUgY2hlY2sgaW4gdGhlIF9zY2FuKCkgZnVuY3Rpb24gc2hvdWxkIGFsc28gYmUgcmVtb3Zl
ZC4KPj4+Cj4+PiBBbHNvIHRoZSBub24gX18gcHJlZml4ZWQgZmxhZ3MgYXJlIHRoZSBjb21iaW5h
dGlvbnMgY2FsbGVycyBhcmUgc3VwcG9zZWQKPj4+IHRvIGxvb2sgYXQuIE1lbW9yeSByZWNsYWlt
IGNvZGUgbmVlZHMgdG8gbG9vayBhdCB0aGUgX19HRlAgZmxhZ3MsIHNlZSBlLmcuCj4+PiBnZnBm
bGFnc19hbGxvd19ibG9ja2luZygpIG9yIGZzX3JlY2xhaW1fYWNxdWlyZSgpLgo+PiBPayBnb3Qg
aXQuIEJ1dCBkb24ndCB3ZSBuZWVkIHRvIHNvbWVob3cgYXZvaWQgcmVjdXJzaW9uIGhlcmU/Cj4g
SG93IGNhbiB5b3UgcmVjdXJzZT8KPgo+IEdGUF9LRVJORUwgaW5jbHVkZXMgdGhlIF9fR0ZQX0ZT
IGZsYWcsIHdoaWNoIGFsbG93cyBjYWxsaW5nIGludG8KPiBzaHJpbmtlcnMuIEdGUF9OT0ZTICh3
aGljaCB3ZSdyZSB1c2luZyB3aGVuIHdlJ3JlIGluIHRoZSBzaHJpbmtlcikKPiBkb2VzIG5vdCBo
YXZlIHRoZSBfX0dGUF9GUyBmbGFnLCBhbmQgc28gY2FsbGluZyBpbnRvIHNocmlua2VycyBpc24n
dAo+IGFsbG93ZWQuIEl0J3Mgc3RpbGwgYWxsb3dlZCB0byBjbGVhbiBvdXQgcGFnZSBjYWNoZSBh
bmQgZG8gaW8gaW4KPiBnZW5lcmFsICh3aGljaCBpcyB0aGUgX19HRlBfSU8gZmxhZyksIGFuZCBp
dCdzIGFsc28gYWxsb3dlZCB0byBkbwo+IG1lbW9yeSByZWNsYWltIG9mIHVzZXJzcGFjZSBwdGVz
LCB3aGljaCBjYW4gaW52b2x2ZSBjYWxsaW5nIGludG8gbW11Cj4gbm90aWZpZXJzICh0aGUgX19H
RlBfUkVDTEFJTSBmbGFnIGlzIGZvciB0aGF0KS4gU28gcnVsZXMgYXJlOgo+IC0gR0ZQX0tFUk5F
TCBmb3IgZXZlcnlvbmUgd2hvJ3Mgbm90IHNwZWNpYWwKPiAtIEdGUF9OT0ZTIGZyb20gc2hyaW5r
ZXJzLgo+IC0gR0ZQX05PSU8gZnJvbSBibG9jayBpbyBoYW5kbGVycyAobm90IHJlbGV2YW50IGZv
ciBncHVzKQo+IC0gR0ZQX0FUT01JQyBvbmx5IGZyb20gbW11IG5vdGlmaWVyIGNhbGxiYWNrcy4g
VGhhdCB0aGlzIGlzICB0aGUKPiByZWFzb24gd2h5IG5vdGhpbmcgaW4gZG1hLWZlbmNlIHNpZ25h
bGxpbmcgY3JpdGljYWwgcGF0aCBpcyBhbGxvd2VkIHRvCj4gYWxsb2NhdGUgbWVtb3J5IHdpdGgg
YW55dGhpbmcgZWxzZSB0aGFuIEdGUF9BVE9NSUMuIEkgZ3Vlc3MgSSBuZWVkIHRvCj4gcmVzdXJy
ZWN0IG15IHBhdGNoZXMsIGJ1dCBJIHRob3VnaHQgd2hlbiB3ZSBkaXNjdXNzZWQgdGhpcyBpdCdz
IGNsZWFyCj4gdGhhdCBhdCBsZWFzdCBpbiB0aGVvcnkgYWxsIHRoZXNlIGFsbG9jYXRpb25zIGlu
IHNjaGVkdWxlciBjb2RlIGFyZQo+IGJ1Z3MgYW5kIG5lZWQgdG8gYmUgcmVwbGFjZWQgYnkgbWVt
cG9vbCBhbGxvY2F0aW9ucy4KPgo+IFNvIHdoZXJlIGRvIHlvdSB3YW50IHRvIHJlY3Vyc2UgaGVy
ZT8KCkkgd2Fzbid0IGF3YXJlIHRoYXQgd2l0aG91dCBfX0dGUF9GUyBzaHJpbmtlcnMgYXJlIG5v
dCBjYWxsZWQuCgpUaGFua3MgZm9yIGNsZWFyaW5nIHRoYXQgdXAsCkNocmlzdGlhbi4KCj4KPiBD
aGVlcnMsIERhbmllbAo+Cj4+PiBbU05JUF0KPj4+PiAraW50IHR0bV90dF9tZ3JfaW5pdCh2b2lk
KTsKPj4+PiArdm9pZCB0dG1fdHRfbWdyX2Zpbmkodm9pZCk7Cj4+Pj4gKwo+Pj4+ICAgICNpZiBJ
U19FTkFCTEVEKENPTkZJR19BR1ApCj4+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L2FncF9iYWNrZW5k
Lmg+Cj4+PiBGb3IgdGVzdGluZyBJIHN0cm9uZ2x5IHJlY29tbWVuZCBhIGRlYnVnZnMgZmlsZSB0
byB0cmlnZ2VyIHRoaXMgc2hyaW5rZXIKPj4+IGNvbXBsZXRlbHksIGZyb20gdGhlIHJpZ2h0IGxv
Y2tkZXAgY29udGV4dCAoaS5lLiB1c2luZwo+Pj4gZnNfcmVjbGFpbV9hY3F1aXJlL3JlbGVhc2Uo
KSkuIE11Y2ggZWFzaWVyIHRvIHRlc3QgdGhhdCB3YXkuIFNlZQo+Pj4gaTkxNV9kcm9wX2NhY2hl
c19zZXQoKSBpbiBpOTE1X2RlYnVnZnMuYy4KPj4+Cj4+PiBUaGF0IHdheSB5b3UgY2FuIGZ1bGx5
IHRlc3QgaXQgYWxsIHdpdGhvdXQgaGl0dGluZyBhbnl0aGluZyByZW1vdGVseQo+Pj4gcmVzZW1i
bGluZyBhY3R1YWwgT09NLCB3aGljaCB0ZW5kcyB0byBraWxsIGFsbCBraW5kcyBvZiB0aGluZ3Mu
Cj4+IFRoYXQncyBleGFjdGx5IHRoZSByZWFzb24gSSB3YXMgc3dpdGNoaW5nIGZyb20gc3lzZnMg
dG8gZGVidWdmcyBpbiB0aGUKPj4gb3RoZXIgcGF0Y2ggc2V0Lgo+Pgo+PiBPaywgaW4gdGhpcyBj
YXNlIEknbSBnb2luZyB0byByZW9yZGVyIGFsbCB0aGF0IHN0dWZmIGFuZCBzZW5kIG91dCB0aGUK
Pj4gZGVidWdmcyBwYXRjaGVzIGZpcnN0Lgo+Pgo+Pj4gQXNpZGUgZnJvbSB0aGUgZGV0YWlsIHdv
cmsgSSB0aGluayB0aGlzIGlzIGdvaW5nIGluIHRoZSByaWdodCBkaXJlY3Rpb24uCj4+PiAtRGFu
aWVsCj4+IFRoYW5rcywKPj4gQ2hyaXN0aWFuLgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
