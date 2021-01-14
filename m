Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4A72F6A7C
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 20:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5711A89F8E;
	Thu, 14 Jan 2021 19:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770049.outbound.protection.outlook.com [40.107.77.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926AA89F8E;
 Thu, 14 Jan 2021 19:08:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mDyfWu4TiLwB//CPNVXQWmv62ikGcYPDx1JqC+1DLaCsZXjJV39YsRHWZLoeyUAIWy9MoVhnBFRMUJJYKcf7DI9VKa9QNA2MhGahv1ISFp3jgoqmgaOIshGppnGXqIXOkndlLETKeIiJABl5joNNOSPMdhnXX5Np1gEe0G5OVMlmgML9gOkqq+RrRr1tZQ+ZxXTlUs728WmOe9TbhCKbX40mQJyLVBLoAKQZNMjkQ6JbVrfPSGhyha/0zFg+Mr2L+dq+qPpecIbBPDl3Vg51iUXUNXyOPpbNTsPZmUA+c2ADRfDdiHtzFwHYVTC9c3dIQ/VleqoDYGbArIcgIxGATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qa5ci6dvGWX1vIFpano6rS4ub6tfkOsuAgk/kU98NNQ=;
 b=TNutseaCPrawWWg4GhHVy0lgyga0PPaJt4qPYqcaT5YXIW+YUrYw2I4Fs5CF7VtKDnsD3sud3vduZeTz5oyLSMZsUvEtlmKsmD1H1gK5mAFrdi2DMDDRZeaOYKeVLze4ZogOS6hX22tAkOXFlLsiBIXnxsmKQ8B8yksbww/DlbqkSlbIO4DkRvupxh7vzT+vEFYES0e4S6dE2nkB+V8jVWB6PxDgLeocsWavvaukw9iUaofP3yHYIUSFuukktHV8cRrE5Dim+yh3t0Z1sjiXt9ND4Bh0D1pIRxHO5fYAlPQim6rxkXdFungk9pumpSpSCa/kPBZujZPlgQPbg6SxFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qa5ci6dvGWX1vIFpano6rS4ub6tfkOsuAgk/kU98NNQ=;
 b=Bn/S5uqoh2HygS/uGIzFt5Yg7KhDWtKvh4Vwq83Z8Al6nBel+FjbzXhNxSz2Pe1le4rTr0yl1G3cxsZGFYaI0zFBIPUzX4ubfatNUZIqdnmRrrkiO4x9HnpYyjrIV5/JP3rOgeTy94U/rlb+zjRwa/IwpJNIBMIf0/MZ/E1JYFQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4756.namprd12.prod.outlook.com (2603:10b6:208:8d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Thu, 14 Jan
 2021 19:08:12 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 19:08:12 +0000
Subject: Re: HMM fence (was Re: [PATCH 00/35] Add HMM-based SVM memory manager
 to KFD)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <X/bTFWL3HYVc8LEF@phenom.ffwll.local>
 <6daf9ebc-507e-6e83-04dd-d7c5fc6998d6@amd.com>
 <X/hux3eX8Ywf61h7@phenom.ffwll.local> <20210113165646.GB521755@redhat.com>
 <c1ecb381-20cc-850b-4491-99c6b413f7df@gmail.com>
 <CAKMK7uHXRwE7tgHM0K921pEyrpZWz7G5q_OcrS4tBPAN-f3k-g@mail.gmail.com>
 <5267b98d-05f4-9e8a-e424-b226f72ce066@amd.com>
 <CAKMK7uEWTGv69w4qDFtWZuX1OmcRi8hejQKuZnm8gpxmeRrCFw@mail.gmail.com>
 <0d400766-d000-aecc-747d-b5f2a2df2c2d@gmail.com>
 <CAKMK7uEgHpzGBKE5vTEpfvqgoK2DrQW4KGbvXMsAF_n85opbmg@mail.gmail.com>
 <55d283fc-10e1-d3de-0c2c-88e16c3af9c0@amd.com>
 <CAKMK7uGZbak7P-icLhPd=koExWmLHjnm0qJupd2toHuhGO7DZg@mail.gmail.com>
 <1591bedd-95b5-8a75-df40-f59cf8f35656@amd.com>
 <CAKMK7uHaOBzm3wNf7ZE7TMgZ4tNQKmmihQXQ-vD0TME6DMQs8Q@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <221c52f0-6fb2-b863-d00c-e60f0fa3c45b@amd.com>
Date: Thu, 14 Jan 2021 20:08:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uHaOBzm3wNf7ZE7TMgZ4tNQKmmihQXQ-vD0TME6DMQs8Q@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR07CA0016.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR07CA0016.eurprd07.prod.outlook.com (2603:10a6:208:ac::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.4 via Frontend Transport; Thu, 14 Jan 2021 19:08:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aa5f12fe-7e06-43b8-ef7e-08d8b8bfbd00
X-MS-TrafficTypeDiagnostic: BL0PR12MB4756:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4756D236D213A8EC6443004683A80@BL0PR12MB4756.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 84TaZQb9FYo9YYMac+yP5dvpVKU6gyelIn9n3h958Xl4zbDE5iETOexcqrfuRU80ulyTiUiXwPqrWNybwaJ7A/EeG33uTZHWRlDf5w3FE1rlhOxfX/LWF9boHTzpCjZ1UgfcRKe7PYJr/PqoivdHT4qFinbv807S9JfypGJ0w8aYWGPLJqXGQ1MhNDndPfsB7Dy6tV485TFWUjH7xiE1b+t6e/kWzUZArc3S87r1Xqjye0n2dmG7YtmcvgunDNYSAUbTJh5u7sTIlr8Z942bTR2OyZ92mr/XgPfVvEgaFPXj9fP41ztQjWC+YsqqCYx3HDgTxyq+J7P5ef3e4QthDQy+TvHXSbLj0aPIl87fbpSa5lFV1VckajP2wmQaTzyq2ErYtRzV+rAkhch2HO+lJpjeDg8rerU2y/mfPmDjXQhh54/0j0fxjsEX9QKGfTWoTEAVmRNsJ5o7zd3mmcFJgTFnBSZK2kK3Yw8rOlsd4N8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(8936002)(36756003)(31696002)(8676002)(6486002)(53546011)(478600001)(6916009)(6666004)(2616005)(83380400001)(52116002)(66556008)(31686004)(54906003)(4326008)(316002)(5660300002)(186003)(2906002)(16526019)(86362001)(66946007)(66574015)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SDdLM0FqNnEyc1dUWU9NeGlHcDl3Y0dEdEp5RURwMWp5ZDVHbnRwY3pzVkh1?=
 =?utf-8?B?RWFtbDgraC9PYmN5V2xsS0hhaSszSjU0WFdPOENFL2k0WUx2NmIxZFBYZGRu?=
 =?utf-8?B?NG1BODFOZlIvZnJSU3J2RTVJQTJReDdtQXZlUDIxUmdhSHBIRnp1Ny96aUVC?=
 =?utf-8?B?ZDVzaVFrTG1uZktNeFZRdE5xNEF6QW5zYjJ3VDM2bGFsSE1aSHVSRksrajhV?=
 =?utf-8?B?ckVwRlNVOFVmWkIrcWpXdWJHemNnMjNhVlZrdHN0d2FRUGFWSXpwNDd6M3ds?=
 =?utf-8?B?VWpxTnRIV0p1L253NXJiYmszN0JYcWJZTGJ4b0x1Q2xkeEk3QW0yMVBYQ01U?=
 =?utf-8?B?L3UySko2TlFPOUJYM2M1SG5vdFBRWFVXRDFvc2VkZmo0NElvUmloMGc3TTE5?=
 =?utf-8?B?cks1QUxWeFRjM0ZTak1PMDVKSUZBV0t6M29Wc28xOHQybGQ1R1Vzdll6L1dl?=
 =?utf-8?B?ZWlCYTNzUm9kdGJOTkZJNjRDUzlEYVBNUHNTSjJQTHBDREVESVU0by9NY0ww?=
 =?utf-8?B?Z1psUGZwbXBJTk54UktiRERTd25ic3pQcWNlbDBOUEhRWml3VUpCdGV0RFk0?=
 =?utf-8?B?b1BHSmFyazdHNUhJWkQvUTZCYUFDajNUZGJhUUZPd28xeTJFYlNvajRyM3lK?=
 =?utf-8?B?a0txUnBNMGVadmdsK1JBS3BvbEU3UWxJb1lKZHBqa2xlTkwySlZMYVRsNUpx?=
 =?utf-8?B?NDJRK0tPL2p5L2wxWitWcmx0TzZBcXdwZkdSNW51d3lPdkRTb1ptUVNHSTlL?=
 =?utf-8?B?K0lWc21TNy9NcWFwNSttcHh0eXAzUWpXWXBMUGpuUWN6NjlQTWtTS2w4cHAz?=
 =?utf-8?B?bzNCWmlrWFZ4dnplNzVKbTVSejREdEFtVzRTRDMyakpsdmxiQ2ZOVHBQRGFT?=
 =?utf-8?B?R2pSeHBhOXZpa1FDSnZRQ1VJc3phY05HTG1JQS9YNWRKeWlxYnhFSHZiUFRR?=
 =?utf-8?B?L2h1SWkvcnhoeXpnQlhPeDF3M0oxK2hOaHlRVFQrNHh4UUl0NVB2ZkRMK0Zz?=
 =?utf-8?B?QTFkRkYrVUZzbmpyTUN5SEtsU1FkVWs3L1pBaXEreEhFSnJNL002VURLYzdG?=
 =?utf-8?B?eTJYVCszU2lyOElTVk9XZ3FhQ0RLVVd6b2hHaElwN283TVlMbnBTMGtYVlQw?=
 =?utf-8?B?dU1NY2FrMVNxeGN1WTdHUlpJbWdzYndIZ09PV25QZlRJYjhvWDNOdzVDTWp1?=
 =?utf-8?B?M05nc3BPTzROeGNSeGVRTkNnb2VqdUtaMm5vVWRKY3oyb0RGbmtPR01vZUtI?=
 =?utf-8?B?WEhzb1RGQ21WTHdiRFBmM1cyUlVhRkpUREZCTFFUa0owR2Y0R1IzMy8yWExz?=
 =?utf-8?B?WUpTeG5ocEpwb0U5Z1JXWnpuUHdTSnpaQVVKM2w5NUorbkQ5MjZVM0pEMXhw?=
 =?utf-8?B?YmxocmlrejJqdUNGb3lMTm42K3doRlNaM01LeHJWdGZPMnc1b2FCVmJpemRw?=
 =?utf-8?Q?4UTTnBC9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 19:08:12.0735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5f12fe-7e06-43b8-ef7e-08d8b8bfbd00
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0NvU1v9cbSIJ/72mY9fm03UwQVl1CxWkMiyGh/baFv1fk8tZ7T6Pz67X0yWe5uX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4756
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
Cc: Alex Sierra <alex.sierra@amd.com>, "Yang, Philip" <philip.yang@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jerome Glisse <jglisse@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDEuMjEgdW0gMTc6MzYgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFRodSwgSmFu
IDE0LCAyMDIxIGF0IDU6MDEgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+PiBBbSAxNC4wMS4yMSB1bSAxNjo0MCBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4+PiBbU05JUF0KPj4+PiBTbyBJIHRoaW5rIHdlIGhhdmUgdG8gc29tZWhvdyBzb2x2
ZSB0aGlzIGluIHRoZSBrZXJuZWwgb3Igd2Ugd2lsbCBnbyBpbgo+Pj4+IGNpcmNsZXMgYWxsIHRo
ZSB0aW1lLgo+Pj4+Cj4+Pj4+IFNvIGZyb20gdGhhdCBwb3YgSSB0aGluayB0aGUga2VybmVsIHNo
b3VsZCBhdCBtb3N0IGRlYWwgd2l0aCBhbgo+Pj4+PiBobW1fZmVuY2UgZm9yIGNyb3NzLXByb2Nl
c3MgY29tbXVuaWNhdGlvbiBhbmQgbWF5YmUgc29tZSBzdGFuZGFyZCB3YWl0Cj4+Pj4+IHByaW1p
dGl2ZXMgKGZvciB1c2Vyc3BhY2UgdG8gdXNlLCBub3QgZm9yIHRoZSBrZXJuZWwpLgo+Pj4+Pgo+
Pj4+PiBUaGUgb25seSB1c2UgY2FzZSB0aGlzIHdvdWxkIGZvcmJpZCBpcyB1c2luZyBwYWdlIGZh
dWx0cyBmb3IgbGVnYWN5Cj4+Pj4+IGltcGxpY2l0L2V4cGxpY2l0IGRtYV9mZW5jZSBzeW5jZWQg
d29ya2xvYWRzLCBhbmQgSSB0aGluayB0aGF0J3MKPj4+Pj4gcGVyZmVjdGx5IG9rIHRvIG5vdCBh
bGxvdy4gRXNwZWNpYWxseSBzaW5jZSB0aGUgbW90aXZhdGlvbiBoZXJlIGZvcgo+Pj4+PiBhbGwg
dGhpcyBpcyBjb21wdXRlLCBhbmQgY29tcHV0ZSBkb2Vzbid0IHBhc3MgYXJvdW5kIGRtYV9mZW5j
ZXMKPj4+Pj4gYW55d2F5Lgo+Pj4+IEFzIEFsZXggc2FpZCB3ZSB3aWxsIHJhdGhlciBzb29uIHNl
ZSB0aGlzIGZvciBnZnggYXMgd2VsbCBhbmQgd2UgbW9zdAo+Pj4+IGxpa2VseSB3aWxsIHNlZSBj
b21iaW5hdGlvbnMgb2Ygb2xkIGRtYV9mZW5jZSBiYXNlZCBpbnRlZ3JhdGVkIGdyYXBoaWNzCj4+
Pj4gd2l0aCBuZXcgZGVkaWNhdGVkIEdQVXMuCj4+Pj4KPj4+PiBTbyBJIGRvbid0IHRoaW5rIHdl
IGNhbiBzYXkgd2UgcmVkdWNlIHRoZSBwcm9ibGVtIHRvIGNvbXB1dGUgYW5kIGRvbid0Cj4+Pj4g
c3VwcG9ydCBhbnl0aGluZyBlbHNlLgo+Pj4gSSdtIG5vdCBhZ2FpbnN0IHBhZ2VmYXVsdHMgZm9y
IGdmeCwganVzdCBpbiBwdXNoaW5nIHRoZSBtYWdpYyBpbnRvIHRoZQo+Pj4ga2VybmVsLiBJIGRv
bid0IHRoaW5rIHRoYXQgd29ya3MsIGJlY2F1c2UgaXQgbWVhbnMgd2UgYWRkIHN0YWxsIHBvaW50
cwo+Pj4gd2hlcmUgdXNlc3BhY2UsIGVzcGVjaWFsbHkgdmsgdXNlcnNwYWNlLCByZWFsbHkgZG9l
c24ndCB3YW50IGl0LiBTbwo+Pj4gc2FtZSB3YXkgbGlrZSB0aW1lbGluZSBzeW5jb2JqLCB3ZSBu
ZWVkIHRvIHB1c2ggdGhlIGNvbXBhdCB3b3JrIGludG8KPj4+IHVzZXJzcGFjZS4KPj4+Cj4+PiBU
aGVyZSdzIGdvaW5nIHRvIGJlIGEgZmV3IHN0YWxsIHBvaW50czoKPj4+IC0gZnVsbHkgbmV3IHN0
YWNrLCB3ZSB3YWl0IGZvciB0aGUgdXNlcnNwYWNlIGZlbmNlIGluIHRoZSBhdG9taWMKPj4+IGNv
bW1pdCBwYXRoICh3aGljaCB3ZSBjYW4sIGlmIHdlJ3JlIHJlYWxseSBjYXJlZnVsLCBzaW5jZSB3
ZSBwaW4gYWxsCj4+PiBidWZmZXJzIHVwZnJvbnQgYW5kIHNvIHRoZXJlJ3Mgbm8gcmlzaykKPj4+
IC0gdXNlcnNwYWNlIGZlbmNpbmcgZ3B1IGluIHRoZSBjbGllbnQsIGNvbXBvc2l0b3IgcHJvdG9j
b2wgY2FuIHBhc3MKPj4+IGFyb3VuZCB1c2Vyc3BhY2UgZmVuY2VzLCBidXQgdGhlIGNvbXBvc2l0
b3Igc3RpbGwgdXNlcyBkbWFfZmVuY2UgZm9yCj4+PiBpdHNlbGYuIFRoZXJlJ3Mgc29tZSBzdGFs
bGluZyBpbiB0aGUgY29tcG9zaXRvciwgd2hpY2ggaXQgZG9lcyBhbHJlYWR5Cj4+PiBhbnl3YXkg
d2hlbiBpdCdzIGNvbGxlY3RpbmcgbmV3IGZyYW1lcyBmcm9tIGNsaWVudHMKPj4+IC0gdXNlcnNw
YWNlIGZlbmNpbmcgZ3B1IGluIHRoZSBjbGllbnQsIGJ1dCBubyBjb21wb3NpdG9yIHByb3RvY29s
OiBXZQo+Pj4gd2FpdCBpbiB0aGUgc3dhcGNoYWluLCBidXQgaW4gYSBzZXBhcmF0ZSB0aHJlYWQg
c28gdGhhdCBub3RoaW5nIGJsb2Nrcwo+Pj4gdGhhdCBzaG91bGRuJ3QgYmxvY2sKPj4+Cj4+PiBJ
ZiB3ZSBpbnN0ZWFkIGdvIHdpdGggIm1hZ2ljIHdhaXRzIGluIHRoZSBrZXJuZWwgYmVoaW5kIHVz
ZXJzcGFjZSdzCj4+PiBiYWNrIiwgbGlrZSB3aGF0IHlvdXIgaXRlbSA2IHdvdWxkIGltcGx5LCB0
aGVuIHdlJ3JlIG5vdCByZWFsbHkKPj4+IHNvbHZpbmcgYW55dGhpbmcuCj4+Pgo+Pj4gRm9yIGFj
dHVhbCBpbXBsZW1lbnRhdGlvbiBJIHRoaW5rIHRoZSBiZXN0IHdvdWxkIGJlIGFuIGV4dGVuc2lv
biBvZgo+Pj4gZHJtX3N5bmNvYmouIFRob3NlIGFscmVhZHkgaGF2ZSBhdCBsZWFzdCBjb25jZXB0
dWFsbHkgZnV0dXJlL2luZmluaXRlCj4+PiBmZW5jZXMsIGFuZCB3ZSBhbHJlYWR5IGhhdmUgZmQg
cGFzc2luZywgc28gImp1c3QiIG5lZWQgc29tZSBwcm90b2NvbAo+Pj4gdG8gcGFzcyB0aGVtIGFy
b3VuZC4gUGx1cyB3ZSBjb3VsZCB1c2UgdGhlIHNhbWUgdWFwaSBmb3IgdGltZWxpbmUKPj4+IHN5
bmNvYmogdXNpbmcgZG1hX2ZlbmNlIGFzIGZvciBobW1fZmVuY2UsIHNvIGFsc28gZWFzaWVyIHRv
IHRyYW5zaXRpb24KPj4+IGZvciB1c2Vyc3BhY2UgdG8gdGhlIG5ldyB3b3JsZCBzaW5jZSBkb24n
dCBuZWVkIHRoZSBuZXcgaHcgY2FwYWJpbGl0eQo+Pj4gdG8gcm9sbCBvdXQgdGhlIG5ldyB1YXBp
IGFuZCBwcm90b2NvbHMuCj4+Pgo+Pj4gVGhhdCdzIG5vdCB0aGF0IGhhcmQgdG8gcm9sbCBvdXQs
IGFuZCB0ZWNobmljYWxseSBhIGxvdCBiZXR0ZXIgdGhhbgo+Pj4gaGFja2luZyB1cCBkbWFfcmVz
diBhbmQgaG9waW5nIHdlIGRvbid0IGVuZCB1cCBzdGFsbGluZyBpbiB3cm9uZwo+Pj4gcGxhY2Vz
LCB3aGljaCBzb3VuZHMgdmVyeSAiZWVlZWsiIHRvIG1lIDotKQo+PiBZZWFoLCB0aGF0J3Mgd2hh
dCBJIHRvdGFsbHkgYWdyZWUgdXBvbiA6KQo+Pgo+PiBNeSBpZGVhIHdhcyBqdXN0IHRoZSBsYXN0
IHJlc29ydCBzaW5jZSB3ZSBhcmUgbWl4aW5nIHVzZXJzcGFjZSBzeW5jIGFuZAo+PiBtZW1vcnkg
bWFuYWdlbWVudCBzbyBjcmVhdGl2ZSBoZXJlLgo+Pgo+PiBTdGFsbGluZyBpbiB1c2Vyc3BhY2Ug
d2lsbCBwcm9iYWJseSBnZXQgc29tZSBwdXNoIGJhY2sgYXMgd2VsbCwgYnV0Cj4+IG1heWJlIG5v
dCBhcyBtdWNoIGFzIHN0YWxsaW5nIGluIHRoZSBrZXJuZWwuCj4gSSBndWVzcyB3ZSBuZWVkIHRv
IGhhdmUgbGFzdC1yZXNvcnQgc3RhbGxpbmcgaW4gdGhlIGtlcm5lbCwgYnV0IG5vCj4gbW9yZSB0
aGFuIHdoYXQgd2UgZG8gd2l0aCBkcm1fc3luY29iaiBmdXR1cmUgZmVuY2VzIHJpZ2h0IG5vdy4g
TGlrZQo+IHdoZW4gYW55dGhpbmcgYXNrcyBmb3IgYSBkbWFfZmVuY2Ugb3V0IG9mIGFuIGhtbV9m
ZW5jZSBkcm1fc3luY29iLCB3ZQo+IGp1c3Qgc3RhbGwgdW50aWwgdGhlIGhtbV9mZW5jZSBpcyBz
aWduYWxsZWQsIGFuZCB0aGVuIGNyZWF0ZSBhCj4gZG1hX2ZlbmNlIHRoYXQncyBhbHJlYWR5IHNp
Z25hbGxlZCBhbmQgcmV0dXJuIHRoYXQgdG8gdGhlIGNhbGxlci4KCkdvb2QgaWRlYS4gQlRXOiBX
ZSBzaG91bGQgc29tZWhvdyB0ZWFjaCBsb2NrZGVwIHRoYXQgdGhpcyAKbWF0ZXJpYWxpemF0aW9u
IG9mIGFueSBmdXR1cmUgZmVuY2Ugc2hvdWxkIG5vdCBoYXBwZW4gd2hpbGUgaG9sZGluZyBhIApy
ZXNlcnZhdGlvbiBsb2NrPwoKPiBPYnZpb3VzbHkgdGhpcyBzaG91bGRuJ3QgaGFwcGVuLCBzaW5j
ZSBhbnlvbmUgd2hvJ3MgdGltZWxpbmUgYXdhcmUKPiB3aWxsIGNoZWNrIHdoZXRoZXIgdGhlIGZl
bmNlIGhhcyBhdCBsZWFzdCBtYXRlcmlhbGl6ZWQgZmlyc3QgYW5kIHN0YWxsCj4gc29tZXdoZXJl
IG1vcmUgdXNlZnVsIGZvciB0aGF0IGZpcnN0LgoKV2VsbCBpZiBJJ20gbm90IGNvbXBsZXRlbHkg
bWlzdGFrZW4gaXQgc2hvdWxkIGhlbHAgd2l0aCBleGlzdGluZyBzdHVmZiAKbGlrZSBhbiBpbXBs
aWNpdCBmZW5jZSBmb3IgYXRvbWljIG1vZGVzZXQgZXRjLi4uCgo+PiBPayBpZiB3ZSBjYW4gYXQg
bGVhc3QgcmVtb3ZlIGltcGxpY2l0IHN5bmMgZnJvbSB0aGUgcGljdHVyZSB0aGVuIHRoZQo+PiBx
dWVzdGlvbiByZW1haW5zIGhvdyBkbyB3ZSBpbnRlZ3JhdGUgSE1NIGludG8gZHJtX3N5bmNvYmog
dGhlbj8KPiAgRnJvbSBhbiB1YXBpIHBvdiBwcm9iYWJseSBqdXN0IGFuIGlvY3RsIHRvIGNyZWF0
ZSBhbiBobW0gZHJtX3N5bmNvYmosCj4gYW5kIGEgc3luY29iaiBpb2N0bCB0byBxdWVyeSB3aGV0
aGVyIGl0J3MgYSBobW1fZmVuY2Ugb3IgZG1hX2ZlbmNlCj4gc3luY29iaiwgc28gdGhhdCB1c2Vy
c3BhY2UgY2FuIGJlIGEgYml0IG1vcmUgY2xldmVyIHdpdGggd2hlcmUgaXQKPiBzaG91bGQgc3Rh
bGwgLSBmb3IgYW4gaG1tX2ZlbmNlIHRoZSBzdGFsbCB3aWxsIG1vc3QgbGlrZWx5IGJlIGRpcmVj
dGx5Cj4gb24gdGhlIGdwdSBpbiBtYW55IGNhc2VzIChzbyB0aGUgaW9jdGwgc2hvdWxkIGFsc28g
Z2l2ZSB1cyBhbGwgdGhlCj4gZGV0YWlscyBhYm91dCB0aGF0IGlmIGl0J3MgYW4gaG1tIGZlbmNl
KS4KPgo+IEkgdGhpbmsgdGhlIHJlYWwgd29yayBpcyBnb2luZyB0aHJvdWdoIGFsbCB0aGUgaGFy
ZHdhcmUgYW5kIHRyeWluZyB0bwo+IGZpZ3VyZSBvdXQgd2hhdCB0aGUgY29tbW9uIGdyb3VuZCBm
b3IgdXNlcnNwYWNlIGZlbmNlcyBhcmUuIFN0dWZmIGxpa2UKPiBjYW4gdGhleSBiZSBpbiBzeXN0
ZW0gbWVtb3J5LCBvciBuZWVkIHNvbWV0aGluZyBzcGVjaWFsICh3YyBtYXliZSwgYnV0Cj4gSSBo
b3BlIHN5c3RlbSBtZW1vcnkgc2hvdWxkIGJlIGZpbmUgZm9yIGV2ZXJ5b25lKSwgYW5kIGhvdyB5
b3UgY291bnQsCj4gd3JhcCBhbmQgY29tcGFyZS4gSSBhbHNvIGhhdmUgbm8gaWRlYSBob3cvaWYg
d2UgY2FuIG9wdGltaXplZCBjcHUKPiB3YWl0cyBhY3Jvc3MgZGlmZmVyZW50IGRyaXZlcnMuCgpJ
IHRoaW5rIHRoYXQgdGhpcyBpcyBhYnNvbHV0ZWx5IGhhcmR3YXJlIGRlcGVuZGVudC4gRS5nLiBm
b3IgZXhhbXBsZSBBTUQgCndpbGwgcHJvYmFibHkgaGF2ZSBoYW5kbGVzLCBzbyB0aGF0IHRoZSBo
YXJkd2FyZSBzY2hlZHVsZXIgY2FuIGNvdW50ZXIgCnByb2JsZW1zIGxpa2UgcHJpb3JpdHkgaW52
ZXJzaW9uLgoKV2hhdCB3ZSBzaG91bGQgcHJvYmFibHkgZG8gaXMgdG8gaGFuZGxlIHRoaXMgc2lt
aWxhciB0byBob3cgRE1BLWJ1ZiBpcyAKaGFuZGxlZCAtIGlmIGl0J3MgdGhlIHNhbWUgZHJpdmVy
IGFuZCBkZXZpY2UgdGhlIGRybV9zeW5jb2JqIHdlIGNhbiB1c2UgCnRoZSBzYW1lIGhhbmRsZSBm
b3IgYm90aCBzaWRlcy4KCklmIGl0J3MgZGlmZmVyZW50IGRyaXZlciBvciBkZXZpY2Ugd2UgZ28g
dGhyb3VnaCBzb21lIENQVSByb3VuZCB0cmlwIGZvciAKdGhlIHNpZ25hbGluZy4KCj4gUGx1cyBp
ZGVhbGx5IHdlIGdldCBzb21lIGFjdHVhbCB3YXlsYW5kIHByb3RvY29sIGdvaW5nIGZvciBwYXNz
aW5nCj4gZHJtX3N5bmNvYmogYXJvdW5kLCBzbyB3ZSBjYW4gdGVzdCBpdC4KCkFuZCBEUkkzIDop
CgpDaHJpc3RpYW4uCgo+IC1EYW5pZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
