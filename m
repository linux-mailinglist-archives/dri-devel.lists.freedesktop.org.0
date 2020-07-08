Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA668218A01
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 16:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87F789C1A;
	Wed,  8 Jul 2020 14:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750058.outbound.protection.outlook.com [40.107.75.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4882E89C1A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 14:20:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qvj2PP0na+gTtbpYd/TrDvMhP+wlYlf/s9oiRPdeUsAjNmrTQbkuFUgtW/S9YNV8RVtuqBtqXia6oNLCj3u0FZIwqh/7EvbM4l3fsa9UecUAcBfldXsWKxDyZEfEIzbBJjAbpPx1cWiMXUvrwiYpwNeIFaosJ0sE89oDdcG+BjPrp8bWWx9p7u9Y52GnGgLKBHal4rGj7Xj6TkSD2k93QEybSBfLHH4Ay3VeVDb6y6znzdik0uYTXkgtlftjZxCgSMobXX9lfOfQLj9RWxYEalxwri2JdDYPD8jwGkABMWlLUjRDyP7izz8Q3T/ZfsbdjFYqjHVU6R9cni2VQWTtlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhWjMNohkgfFPxeJeztfbDhDPW33e2u/cK4cAtfQRlw=;
 b=DAA5QvapSpQB0Cmnk2tPk+uVxwUvwnqJFJ+MQeuuzoMj+/K34eHY7Dz1ZoJpk0VqROiVEUuQws0CeYqFV3mSmJru/XQI5y+Ylj+NGxJk9Jp0CdN01Eqsqxr0whSjh9tdn4+UxLaRAw9tltxOCvMU+efAZCMJyOxQoaG6WUORKWMSvcS1PcQzI1/XYLuX8HB1i606InjQVIyhwv1kVb8/zqZviYw1oSbBCEjzb0rUwb3OrsIv1G71J28htvefNT3hWkLTyannXrFvjyrhJb3axer0kcmvjnDgaX6MVQWIBZM1hlyVPXOC+gNNOk1T45kk7ibBGa1yTkFBXjozf+jvOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhWjMNohkgfFPxeJeztfbDhDPW33e2u/cK4cAtfQRlw=;
 b=cFSZhlr4tjBT5WROVW7EQykA7Gvj2ptCGx+peKuJu7tIZ0wCM57MenDq5veraDJv0KCBGb6pcpxbbjls9nWgf4CEsnh26RSU42Gv5xkILeW/kHwDKTUBvrULCtSxaaU84L2GR2o/s35arj0UPULzNlETt2lVzuE1INfgt7dCKao=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3966.namprd12.prod.outlook.com (2603:10b6:208:165::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.27; Wed, 8 Jul
 2020 14:20:25 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 14:20:25 +0000
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200702131000.GW3278063@phenom.ffwll.local>
 <20200702132953.GS25301@ziepe.ca>
 <11e93282-25da-841d-9be6-38b0c9703d42@amd.com>
 <20200702181540.GC3278063@phenom.ffwll.local>
 <20200703120335.GT25301@ziepe.ca>
 <CAKMK7uGqABchpPLTm=vmabkwK3JJSzWTFWhfU+ywbwjw-HgSzw@mail.gmail.com>
 <20200703131445.GU25301@ziepe.ca>
 <f2ec5c61-a553-39b5-29e1-568dae9ca2cd@amd.com>
 <MW3PR11MB45553DB31AD67C8B870A345FE5660@MW3PR11MB4555.namprd11.prod.outlook.com>
 <d28286c7-b1c1-a4a8-1d38-264ed1761cdd@amd.com>
 <20200708094934.GI3278063@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <14659513-8164-dcae-e4f9-f0a199aee542@amd.com>
Date: Wed, 8 Jul 2020 16:20:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200708094934.GI3278063@phenom.ffwll.local>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0059.eurprd03.prod.outlook.com (2603:10a6:208::36)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0059.eurprd03.prod.outlook.com (2603:10a6:208::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.22 via Frontend Transport; Wed, 8 Jul 2020 14:20:24 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 89d10fc7-9ecd-4b72-fe90-08d8234a0e96
X-MS-TrafficTypeDiagnostic: MN2PR12MB3966:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3966A1FA731E200EE2CB52E883670@MN2PR12MB3966.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04583CED1A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lI76Lgbx9PXOTijiwaCUBVeOxqGxQD065GKCugPl5kM4tF1ntWOh/KpF3H2M+3u7IXttFKL4DGYWR5f22CE9XRnAO9DjGEF8A6nNOybePDn6QicGnS/kzF8z8V4B7+eMS4trUdeoJx3nxPlbDcYEE/BOm7Vt+QdXP1j7Taozc36UyWcFud0IiBhrSEfs5764L3Td4Qfm2vnB94NuRmKKKlgwJ24wwDqPBdHj1Bhfkl7Thg8pdCOmOYMb+YEOXBH9XztikqfUa0hI9vWZg8ofd3F8/Xnnu6UTO6ETAnWB6Hn7hlcSvTpMn/FmPyMw052EsBn0yR9sFbEmQfjfMghiJd2gfjfTIapOB7cYiZCijraLxzzf+cXa6dVuHQhe4VquTmYDw0EoxQZZ7S6JyI+0aCyVj7XyUqofM37G3PdlpSSJ4Gi3EH4Pq+vy7cxyRyh8ZIqeObUzu+lPDhfpnA1Lcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(396003)(39850400004)(376002)(316002)(186003)(2616005)(66476007)(5660300002)(36756003)(16526019)(8676002)(66946007)(66556008)(86362001)(54906003)(478600001)(8936002)(6916009)(2906002)(31696002)(6486002)(66574015)(45080400002)(966005)(31686004)(83380400001)(4326008)(52116002)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: eiIFygPxTYSN4OoFj4uSdHa66R8pCZggTaqqrQLMTIErQCwxRCPUYOIAzt2O5QO2MUXiSukAdcaxKUf2LIpPh+gWJI8HkNYq4u/QYjSMVJGXwONR5VW00YF4QEs+Cv9ANTmcy4Bx85Lga3Gvs7SqQ43P3utNYXw24oRzv0dnR4GfeSOZyrdf6HANONBTkjydR5aw3v8U4vfjd52gnNhxuesBUMN0mYV/Eejjd3W65ykGDKHv2JCfJkfHLk1vbEgGjYzAciYCnAEq9t3oCJIBjkQbkKGVn2ibMJoA0+kNcGL7fkAFJM7jfm0b4tacBeoJP4kfDJguTXMfooKZSmf6MyP48vfjjZbJDYbq1i0bf0W8hKFdK+SjgaFTa7XF9XoiBu+hLyIucvIXis2EUuqu4hYY7F8SZUTY5klkknsexHlEIgDwU8nzbzIRT9QrmLuP6hUxsoN7RgZumFKMwz4Vd1HW5HxVbfGJpgWje9ZtT/zYN4tKbOXsjezamRqefBJXoRDTYp5QpiWN2fH1XKr9LXhqsaFWi/0hNmyYWr+GQuU8ijR1+MYZadIF+hMpESMS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d10fc7-9ecd-4b72-fe90-08d8234a0e96
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 14:20:25.3443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIlFG/T/59l8ibYtpseL6k+9lo+QGz3gqo2/2pNEixRGcaBJxC6rJkxpkLCgZHY5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3966
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, "Xiong, Jianxin" <jianxin.xiong@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDcuMjAgdW0gMTE6NDkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgSnVs
IDA4LCAyMDIwIGF0IDExOjM4OjMxQU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDA3LjA3LjIwIHVtIDIzOjU4IHNjaHJpZWIgWGlvbmcsIEppYW54aW46Cj4+Pj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Cj4+Pj4gQW0gMDMuMDcuMjAgdW0gMTU6MTQgc2NocmllYiBKYXNv
biBHdW50aG9ycGU6Cj4+Pj4+IE9uIEZyaSwgSnVsIDAzLCAyMDIwIGF0IDAyOjUyOjAzUE0gKzAy
MDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+Cj4+Pj4+PiBTbyBtYXliZSBJJ20ganVzdCB0
b3RhbGx5IGNvbmZ1c2VkIGFib3V0IHRoZSByZG1hIG1vZGVsLiBJIHRob3VnaHQ6Cj4+Pj4+PiAt
IHlvdSBiaW5kIGEgcGlsZSBvZiBtZW1vcnkgZm9yIHZhcmlvdXMgdHJhbnNhY3Rpb25zLCB0aGF0
IG1pZ2h0Cj4+Pj4+PiBoYXBwZW4gd2hlbmV2ZXIuIEtlcm5lbCBkcml2ZXIgZG9lc24ndCBoYXZl
IG11Y2ggaWYgYW55IGluc2lnaHQgaW50bwo+Pj4+Pj4gd2hlbiBtZW1vcnkgaXNuJ3QgbmVlZGVk
IGFueW1vcmUuIEkgdGhpbmsgaW4gdGhlIHJkbWEgd29ybGQgdGhhdCdzCj4+Pj4+PiBjYWxsZWQg
cmVnaXN0ZXJpbmcgbWVtb3J5LCBidXQgbm90IHN1cmUuCj4+Pj4+IFN1cmUsIGJ1dCBvbmNlIHJl
Z2lzdGVyZWQgdGhlIG1lbW9yeSBpcyBhYmxlIHRvIGJlIHVzZWQgYXQgYW55IG1vbWVudAo+Pj4+
PiB3aXRoIG5vIHZpc2liaWx0eSBmcm9tIHRoZSBrZXJuZWwuCj4+Pj4+Cj4+Pj4+IFVubGlrZSBH
UFUgdGhlIHRyYW5zYWN0aW9ucyB0aGF0IHRyaWdnZXIgbWVtb3J5IGFjY2VzcyBkbyBub3QgZ28K
Pj4+Pj4gdGhyb3VnaCB0aGUga2VybmVsIC0gc28gdGhlcmUgaXMgbm8gYWJpbGl0eSB0byBpbnRl
cnJ1cHQgYSBjb21tYW5kCj4+Pj4+IGZsb3cgYW5kIGZpZGRsZSB3aXRoIG1hcHBpbmdzLgo+Pj4+
IFRoaXMgaXMgdGhlIHNhbWUgZm9yIEdQVXMgd2l0aCB1c2VyIHNwYWNlIHF1ZXVlcyBhcyB3ZWxs
Lgo+Pj4+Cj4+Pj4gQnV0IHdlIGNhbiBzdGlsbCBzYXkgZm9yIGEgcHJvY2VzcyBpZiB0aGF0IHRo
aXMgcHJvY2VzcyBpcyB1c2luZyBhIERNQS1idWYgd2hpY2ggaXMgbW92ZWQgb3V0IGFuZCBzbyBj
YW4ndCBydW4gYW55IG1vcmUgdW5sZXNzIHRoZSBETUEtYnVmIGlzCj4+Pj4gYWNjZXNzaWJsZSBh
Z2Fpbi4KPj4+Pgo+Pj4+IEluIG90aGVyIHdvcmRzIHlvdSBzb21laG93IG5lZWQgdG8gbWFrZSBz
dXJlIHRoYXQgdGhlIGhhcmR3YXJlIGlzIG5vdCBhY2Nlc3NpbmcgYSBwaWVjZSBvZiBtZW1vcnkg
YW55IG1vcmUgd2hlbiB5b3Ugd2FudCB0byBtb3ZlIGl0Lgo+Pj4+Cj4+PiBXaGlsZSBhIHByb2Nl
c3MgY2FuIGJlIGVhc2lseSBzdXNwZW5kZWQsIHRoZXJlIGlzIG5vIHdheSB0byB0ZWxsIHRoZSBS
RE1BIE5JQyBub3QgdG8gcHJvY2VzcyBwb3N0ZWQgd29yayByZXF1ZXN0cyB0aGF0IHVzZSBzcGVj
aWZpYyBtZW1vcnkgcmVnaW9ucyAob3Igd2l0aCBhbnkgb3RoZXIgY29uZGl0aW9ucykuCj4+Pgo+
Pj4gU28gZmFyIGl0IGFwcGVhcnMgdG8gbWUgdGhhdCBETUEtYnVmIGR5bmFtaWMgbWFwcGluZyBm
b3IgUkRNQSBpcyBvbmx5IHZpYWJsZSB3aXRoIE9EUCBzdXBwb3J0LiBGb3IgTklDcyB3aXRob3V0
IE9EUCwgYSB3YXkgdG8gYWxsb3cgcGlubmluZyB0aGUgZGV2aWNlIG1lbW9yeSBpcyBzdGlsbCBu
ZWVkZWQuCj4+IEFuZCB0aGF0J3MgZXhhY3RseSB0aGUgcmVhc29uIHdoeSBJIGludHJvZHVjZWQg
ZXhwbGljaXQgcGluKCkvdW5waW4oKQo+PiBmdW5jdGlvbnMgaW50byB0aGUgRE1BLWJ1ZiBBUEk6
Cj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1o
dHRwcyUzQSUyRiUyRmVsaXhpci5ib290bGluLmNvbSUyRmxpbnV4JTJGbGF0ZXN0JTJGc291cmNl
JTJGZHJpdmVycyUyRmRtYS1idWYlMkZkbWEtYnVmLmMlMjNMODExJmFtcDtkYXRhPTAyJTdDMDEl
N0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzZkNzg1ODYxYWNjNTQyYTJmNTM2MDhkODIz
MjQzYTdjJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzI5
Nzk4NTc5MjEzNTMxMSZhbXA7c2RhdGE9YkJya0R5bmxBQ0U5REFJbEdudHhYaEUxdW5yJTJGQnh3
NUlSVG02QXRWNldRJTNEJmFtcDtyZXNlcnZlZD0wCj4+Cj4+IEl0J3MganVzdCB0aGF0IGF0IGxl
YXN0IG91ciBkZXZpY2VzIGRyaXZlcnMgY3VycmVudGx5IHByZXZlbnQgUDJQIHdpdGgKPj4gcGlu
bmVkIERNQS1idWYncyBmb3IgdHdvIG1haW4gcmVhc29uczoKPj4KPj4gYSkgVG8gcHJldmVudCBk
ZW55IG9mIHNlcnZpY2UgYXR0YWNrcyBiZWNhdXNlIFAyUCBCQVJzIGFyZSBhIHJhdGhlciByYXJl
Cj4+IHJlc291cmNlLgo+Pgo+PiBiKSBUbyBwcmV2ZW50IGZhaWx1cmVzIGluIGNvbmZpZ3VyYXRp
b24gd2hlcmUgUDJQIGlzIG5vdCBhbHdheXMgcG9zc2libGUKPj4gYmV0d2VlbiBhbGwgZGV2aWNl
cyB3aGljaCB3YW50IHRvIGFjY2VzcyBhIGJ1ZmZlci4KPiBTbyB0aGUgYWJvdmUgaXMgbW9yZSBv
ciBsZXNzIHRoZSBxdWVzdGlvbiBpbiB0aGUgY292ZXIgbGV0dGVyICh3aGljaAo+IGRpZG4ndCBt
YWtlIGl0IHRvIGRyaS1kZXZlbCkuIENhbiB3ZSBzb21laG93IHRocm93IHRoYXQgbGltaXRhdGlv
biBvdXQsIG9yCj4gaXMgdGhhdCBzaW1wbHkgbm90IGEgZ29vZCBpZGVhPwoKQXQgbGVhc3QgZm9y
IHRoZSBBTUQgZ3JhcGhpY3MgZHJpdmVycyB0aGF0J3MgbW9zdCBjZXJ0YWluIG5vdCBhIGdvb2Qg
aWRlYS4KCldlIGRvIGhhdmUgYW4gdXNlIGNhc2Ugd2hlcmUgYnVmZmVycyBuZWVkIHRvIGJlIGlu
IHN5c3RlbSBtZW1vcnkgYmVjYXVzZSAKUDJQIGRvZXNuJ3Qgd29yay4KCkFuZCBieSBwaW5uaW5n
IHRoZW0gdG8gVlJBTSB5b3UgY2FuIGNyZWF0ZSBhIHJlYWxseSBuaWNlIGRlbnkgb2Ygc2Vydmlj
ZSAKYXR0YWNrIGFnYWluc3QgdGhlIFggc3lzdGVtLgoKPiBTaW1wbHkgbW92aW5nIGJ1ZmZlcnMg
dG8gc3lzdGVtIG1lbW9yeSB3aGVuIHRoZXkncmUgcGlubmVkIGRvZXMgc2ltcGxpZnkgYQo+IGxv
dCBvZiBoZWFkYWNoZXMuIEZvciBhIHNwZWNpZmljIGN1c3RvbSBidWlsdCBzeXN0ZW0gd2UgY2Fu
IGF2b2lkIHRoYXQKPiBtYXliZSwgYnV0IEkgdGhpbmsgdXBzdHJlYW0gaXMga2luZGEgYSBkaWZm
ZXJlbnQgdGhpbmcuCgpZZXMsIGFncmVlIGNvbXBsZXRlbHkgb24gdGhhdC4gQ3VzdG9tZXJzIHdo
aWNoIGFyZSB3aWxsaW5nIHRvIHRha2UgdGhlIApyaXNrIGNhbiBlYXNpbHkgZG8gdGhpcyB0aGVt
c2VsdmVzLgoKQnV0IHRoYXQgaXMgbm90IHNvbWV0aGluZyB3ZSBzaG91bGQgcHJvYmFibHkgZG8g
Zm9yIHVwc3RyZWFtLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IENoZWVycywgRGFuaWVsCj4K
Pj4gUmVnYXJkcywKPj4gQ2hyaXN0aWFuLgo+Pgo+Pj4gSmlhbnhpbgo+Pj4KPj4+PiBDaHJpc3Rp
YW4uCj4+Pj4KPj4+Pj4gSmFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
