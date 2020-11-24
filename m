Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635D62C1F06
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 08:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDF56E20A;
	Tue, 24 Nov 2020 07:41:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690053.outbound.protection.outlook.com [40.107.69.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55F46E20E;
 Tue, 24 Nov 2020 07:41:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2IfKU2G2jmozuTIibErjRre2ZwW2t1gAbO5tLJJdrw6MOVApLsgLXbE6FwPRnvZh+xBdw5jLhJgI7m2vU8IFoGk2+TI6kQ+MRPEEaIB2qm/7JODccaANgHdWvupEHRb113zRc36rS9F9PKQTOrDRSBvrB4j8jOPOPR+WcsrOPPjluC1hETp7LKwZARDimVUUo1Nydr1Zju60QVYouZWhbRyK1HhZMQ8u6VTNu6Sq6I7yEoNwUNSpmUmftv/uLkkGggYS9kZE0Zhf+EAViR/DynT2XTpq32eaSxes7W6XnH+w7PMuJMLPDgy1VkgUCyMJoS9KK//q0h4VNNhmd536Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5el2/iGIAdPRsJYv63KW0EA/F+1AXDysvcpcv2eRZoo=;
 b=oPG9IuN3/mtWyKPyiod058XIcm/CcFc4T35BX+DoB6L+xsLE8P0I6Bmii5gX11k+6MK+MHvHNsPvaSTeoCNZioYR7klEPOcAcYog3ADJ7cukqwL4mWSWbfRwzE/rDvtB+1hz65ykuxFz+XwUNivcgUbu1gePPuPCz1teHHmL0DYDMO+KEk/eAq1jU/3oY3rbfE7YqugSlsbxryfvirYQhbo4RHCmdzdUyLEC2RT1uuHDK/Sk6TR2q9pNChqmukMITD0osbIw82Dn3hoZPWzJjEi4AKh8i5s31fkvKrxXuE39bpGGGHmk13c1R488iF8XHqhuarPGHn72hc4xCumdcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5el2/iGIAdPRsJYv63KW0EA/F+1AXDysvcpcv2eRZoo=;
 b=ufCarqE2P2jTLUNQXsMxaLXslVrZmwDjbtwP4gXF4urhucKfdnZUXzb0ZGyB40K8PK7jB6+CDsVdIYe5ZSnfb715kh33q/XINKdR5/w0q5+SCAb7djIOlpzZC5at2ZEz/e376VYsk0bIXl6kDcL+OWspPk6lRZpSiw3SZlOqXl0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4930.namprd12.prod.outlook.com (2603:10b6:208:1c8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.25; Tue, 24 Nov
 2020 07:41:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Tue, 24 Nov 2020
 07:41:49 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
Date: Tue, 24 Nov 2020 08:41:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0101CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0101CA0058.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21 via Frontend
 Transport; Tue, 24 Nov 2020 07:41:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7bbecb4d-305f-4eb4-3806-08d8904c66e5
X-MS-TrafficTypeDiagnostic: BL0PR12MB4930:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49308CF22C6170FCA24EC99883FB0@BL0PR12MB4930.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AqVDpKVQ4yShb6kJXULcb5+RJeL5QUlV2gDsxoNzX7LDR+jAajzWm61za/Pmdr/sFu5lu+eTSemhFRvJRCa9a3iPb23WhawjG5H+q8H4De8s+pfRWNU5Gg9CdB02xH1vB/I7htkt2n1hdMT8RqqAQCPn+nd4V9oJ4CAoYZFqZFUEEB6VTb/w6DRVm5AY3SbrAv5VGd43YOH7dxM1FCJjb/5cC8Bop0pbL9E/0Grn7x/FDi/pbHHC5J7oDdPYg2AUjZ5YGcKWbjVG2TIUQmhNvROkTZEvIRpXY3TlmguVw9HNAROtB/NjXut49IBqTsUjFtGSd1gUkdrHRZfESm2lIPU2OBJPj6f1v8/+knn8tmxYh1R0KKNWuGqq9+8KhUCpbhZIUB8aNxPtv5D++uXRlByy7fprRH1aJc4KB0Cjyq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(366004)(966005)(6666004)(31686004)(66574015)(4326008)(36756003)(31696002)(6486002)(2906002)(316002)(53546011)(66946007)(2616005)(66556008)(52116002)(83380400001)(478600001)(16526019)(186003)(45080400002)(86362001)(8936002)(66476007)(5660300002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WTE0Z2hJK2NoTnduZjdCR0w1YjhUa1N4NXc2K2RVVFU4NllIc0N3emJjL1Uv?=
 =?utf-8?B?c004b3poQ1VDMGxaQ0I3TzlXTlZmalVEVG80VXdSeTJNUFZySmNFMFQ1eTlt?=
 =?utf-8?B?dzZXVjFGQ2ZadDVrcStsckowc0ZKQ0pFQU0zK0F2eGJ1ZkdJeW92QzBrVHph?=
 =?utf-8?B?VjZnK3ErdCtUQ3pqOW0vbnQ0M3RHTWtab2o0ODJzVi9sSFE3N3g1KzZjRFZE?=
 =?utf-8?B?bWk2c3FGS3N5OERsaWk2UWhzS096L0tja2xjbml2MEhXSVVlRkNJV2oyNWcy?=
 =?utf-8?B?UkY1MGFnRFNmSEhqd0FrN3BvNS96OEFmRDU0QkovUmR3MW5JYzF0T1U0TUVl?=
 =?utf-8?B?TmNhSFdIdUdKTXorcmcvbmZ5V0ZzSWRUUHBlV3g5VU93MVlGT2dGdjhHQTFB?=
 =?utf-8?B?c29hbmJ4Q25QZlgweFB5NDk3c0NLWEtoZzhIY09zVjlpUzZiRlFpYzRzdDR1?=
 =?utf-8?B?VjlTendKalVQc2hwcUFXRFpPNDdBd0tuNklNWUx4SFl0d2dmMUNLeXlrY2Fu?=
 =?utf-8?B?cmlFdjhLRjFnNGNSZGZvZzNLSUJRcXJLRGFiRzYwaGRyajBxUnpZSUFBZUNx?=
 =?utf-8?B?bmdXQ2tBdlUwelBKdHVpTm53ZGc4SWpJN3ZTNkVQYzRKQWhJWGFlZDRqaGww?=
 =?utf-8?B?ZGp4MmNoUGpTQUZYWWJZZ1pCS2QranRhQWFoOW1QckNnWFBaVGs2YkEwVnRQ?=
 =?utf-8?B?VldKM2o0ZzN4TGpHU3k3QTVoY2d1bkVnTW9PTGJxSCtNRXl1ZUc4VUlRQlU3?=
 =?utf-8?B?TDdGNmNkVWFJTXFVaDA5VzRJamN5MTFHL1NDUXJLLzd0NVl2eDhIc0d2Q0hG?=
 =?utf-8?B?aHJxRWVEejhqTnUxZ09HM0kxZUZSbTd5VGQyNWptckpFbm8yQVpFNER2MU53?=
 =?utf-8?B?c0w3M1dSc0xWazlzeTRLUjRaNDNVUFhkenhsL09rYmhpMEFXaUk2NXdlbVBP?=
 =?utf-8?B?UzhudU0xZ2FyL242bzdsbG5UWGJ0MHBmbjlGZXIzQW8rQVhFTVhJNUVWeVVV?=
 =?utf-8?B?NHgzd3MzK2RCR1hFay96ZmJOQWcyTkcwaFliRHJUamNCU1ZHVnlJaHNLZXVY?=
 =?utf-8?B?alZEbFJPa2NYckpYeVZzVzNJYU0yZVJ5NnZCQ3RLaTZhRkllenVHZk1PWnJw?=
 =?utf-8?B?a0MyOGFnZVVnRnNrOVp4ZzFQVDFwR253V1k2MnRqTmduTTVnbWJ5UE1mVXdm?=
 =?utf-8?B?VFZjdFcvbUJYbWJNR0w0b3ZRRmgwNk5wMTRCVHJzeUZJUnBzMkMybXJ2MjFI?=
 =?utf-8?B?cVRsZVBDQk40dE12aXJ0NGxTMkI4RWEyVUFlWEdQUnhzVHhSVWEvaXZad3Zn?=
 =?utf-8?B?Z2hCdW9oQmtVYXJnZGhIMUlxdDRrWGFLb0tYSzJFMnV0M3V3cmtkZTFzT25Z?=
 =?utf-8?B?clhCK296MEJUbU5tNitaS0FXK1NibkhpK21ISGVkZ3JxR0FIMXBZb2lMdEt6?=
 =?utf-8?Q?upTq1vHv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbecb4d-305f-4eb4-3806-08d8904c66e5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 07:41:49.6444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rj55xJ+xTv/nXw167Dhu6Md8VBhJqVm5MQeddGKVDFgD5kOaibW0eaJcfLIqaSav
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4930
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMTEuMjAgdW0gMjI6MDggc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDEx
LzIzLzIwIDM6NDEgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDIzLjExLjIwIHVt
IDIxOjM4IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pgo+Pj4gT24gMTEvMjMvMjAgMzoy
MCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBBbSAyMy4xMS4yMCB1bSAyMTowNSBz
Y2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pgo+Pj4+PiBPbiAxMS8yNS8yMCA1OjQyIEFN
LCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4gQW0gMjEuMTEuMjAgdW0gMDY6MjEgc2No
cmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+PiBJdCdzIG5lZWRlZCB0byBkcm9wIGlvbW11
IGJhY2tlZCBwYWdlcyBvbiBkZXZpY2UgdW5wbHVnCj4+Pj4+Pj4gYmVmb3JlIGRldmljZSdzIElP
TU1VIGdyb3VwIGlzIHJlbGVhc2VkLgo+Pj4+Pj4KPj4+Pj4+IEl0IHdvdWxkIGJlIGNsZWFuZXIg
aWYgd2UgY291bGQgZG8gdGhlIHdob2xlIGhhbmRsaW5nIGluIFRUTS4gSSAKPj4+Pj4+IGFsc28g
bmVlZCB0byBkb3VibGUgY2hlY2sgd2hhdCB5b3UgYXJlIGRvaW5nIHdpdGggdGhpcyBmdW5jdGlv
bi4KPj4+Pj4+Cj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Cj4+Pj4+Cj4+Pj4+IENoZWNrIHBhdGNo
ICJkcm0vYW1kZ3B1OiBSZWdpc3RlciBJT01NVSB0b3BvbG9neSBub3RpZmllciBwZXIgCj4+Pj4+
IGRldmljZS4iIHRvIHNlZQo+Pj4+PiBob3cgaSB1c2UgaXQuIEkgZG9uJ3Qgc2VlIHdoeSB0aGlz
IHNob3VsZCBnbyBpbnRvIFRUTSBtaWQtbGF5ZXIgLSAKPj4+Pj4gdGhlIHN0dWZmIEkgZG8gaW5z
aWRlCj4+Pj4+IGlzIHZlbmRvciBzcGVjaWZpYyBhbmQgYWxzbyBJIGRvbid0IHRoaW5rIFRUTSBp
cyBleHBsaWNpdGx5IGF3YXJlIAo+Pj4+PiBvZiBJT01NVSA/Cj4+Pj4+IERvIHlvdSBtZWFuIHlv
dSBwcmVmZXIgdGhlIElPTU1VIG5vdGlmaWVyIHRvIGJlIHJlZ2lzdGVyZWQgZnJvbSAKPj4+Pj4g
d2l0aGluIFRUTQo+Pj4+PiBhbmQgdGhlbiB1c2UgYSBob29rIHRvIGNhbGwgaW50byB2ZW5kb3Ig
c3BlY2lmaWMgaGFuZGxlciA/Cj4+Pj4KPj4+PiBObywgdGhhdCBpcyByZWFsbHkgdmVuZG9yIHNw
ZWNpZmljLgo+Pj4+Cj4+Pj4gV2hhdCBJIG1lYW50IGlzIHRvIGhhdmUgYSBmdW5jdGlvbiBsaWtl
IAo+Pj4+IHR0bV9yZXNvdXJjZV9tYW5hZ2VyX2V2aWN0X2FsbCgpIHdoaWNoIHlvdSBvbmx5IG5l
ZWQgdG8gY2FsbCBhbmQgCj4+Pj4gYWxsIHR0IG9iamVjdHMgYXJlIHVucG9wdWxhdGVkLgo+Pj4K
Pj4+Cj4+PiBTbyBpbnN0ZWFkIG9mIHRoaXMgQk8gbGlzdCBpIGNyZWF0ZSBhbmQgbGF0ZXIgaXRl
cmF0ZSBpbiBhbWRncHUgZnJvbSAKPj4+IHRoZSBJT01NVSBwYXRjaCB5b3UganVzdCB3YW50IHRv
IGRvIGl0IHdpdGhpbgo+Pj4gVFRNIHdpdGggYSBzaW5nbGUgZnVuY3Rpb24gPyBNYWtlcyBtdWNo
IG1vcmUgc2Vuc2UuCj4+Cj4+IFllcywgZXhhY3RseS4KPj4KPj4gVGhlIGxpc3RfZW1wdHkoKSBj
aGVja3Mgd2UgaGF2ZSBpbiBUVE0gZm9yIHRoZSBMUlUgYXJlIGFjdHVhbGx5IG5vdCAKPj4gdGhl
IGJlc3QgaWRlYSwgd2Ugc2hvdWxkIG5vdyBjaGVjayB0aGUgcGluX2NvdW50IGluc3RlYWQuIFRo
aXMgd2F5IHdlIAo+PiBjb3VsZCBhbHNvIGhhdmUgYSBsaXN0IG9mIHRoZSBwaW5uZWQgQk9zIGlu
IFRUTS4KPgo+Cj4gU28gZnJvbSBteSBJT01NVSB0b3BvbG9neSBoYW5kbGVyIEkgd2lsbCBpdGVy
YXRlIHRoZSBUVE0gTFJVIGZvciB0aGUgCj4gdW5waW5uZWQgQk9zIGFuZCB0aGlzIG5ldyBmdW5j
dGlvbiBmb3IgdGhlIHBpbm5lZCBvbmVzwqAgPwo+IEl0J3MgcHJvYmFibHkgYSBnb29kIGlkZWEg
dG8gY29tYmluZSBib3RoIGl0ZXJhdGlvbnMgaW50byB0aGlzIG5ldyAKPiBmdW5jdGlvbiB0byBj
b3ZlciBhbGwgdGhlIEJPcyBhbGxvY2F0ZWQgb24gdGhlIGRldmljZS4KClllcywgdGhhdCdzIHdo
YXQgSSBoYWQgaW4gbXkgbWluZCBhcyB3ZWxsLgoKPgo+Cj4+Cj4+IEJUVzogSGF2ZSB5b3UgdGhv
dWdodCBhYm91dCB3aGF0IGhhcHBlbnMgd2hlbiB3ZSB1bnBvcHVsYXRlIGEgQk8gCj4+IHdoaWxl
IHdlIHN0aWxsIHRyeSB0byB1c2UgYSBrZXJuZWwgbWFwcGluZyBmb3IgaXQ/IFRoYXQgY291bGQg
aGF2ZSAKPj4gdW5mb3Jlc2VlbiBjb25zZXF1ZW5jZXMuCj4KPgo+IEFyZSB5b3UgYXNraW5nIHdo
YXQgaGFwcGVucyB0byBrbWFwIG9yIHZtYXAgc3R5bGUgbWFwcGVkIENQVSBhY2Nlc3NlcyAKPiBv
bmNlIHdlIGRyb3AgYWxsIHRoZSBETUEgYmFja2luZyBwYWdlcyBmb3IgYSBwYXJ0aWN1bGFyIEJP
ID8gQmVjYXVzZSAKPiBmb3IgdXNlciBtYXBwaW5ncwo+IChtbWFwKSB3ZSB0b29rIGNhcmUgb2Yg
dGhpcyB3aXRoIGR1bW15IHBhZ2UgcmVyb3V0ZSBidXQgaW5kZWVkIG5vdGhpbmcgCj4gd2FzIGRv
bmUgZm9yIGluIGtlcm5lbCBDUFUgbWFwcGluZ3MuCgpZZXMgZXhhY3RseSB0aGF0LgoKSW4gb3Ro
ZXIgd29yZHMgd2hhdCBoYXBwZW5zIGlmIHdlIGZyZWUgdGhlIHJpbmcgYnVmZmVyIHdoaWxlIHRo
ZSBrZXJuZWwgCnN0aWxsIHdyaXRlcyB0byBpdD8KCkNocmlzdGlhbi4KCj4KPiBBbmRyZXkKPgo+
Cj4+Cj4+IENocmlzdGlhbi4KPj4KPj4+Cj4+PiBBbmRyZXkKPj4+Cj4+Pgo+Pj4+Cj4+Pj4gR2l2
ZSBtZSBhIGRheSBvciB0d28gdG8gbG9vayBpbnRvIHRoaXMuCj4+Pj4KPj4+PiBDaHJpc3RpYW4u
Cj4+Pj4KPj4+Pj4KPj4+Pj4gQW5kcmV5Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFt
ZC5jb20+Cj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQu
YyB8IDEgKwo+Pj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4+Pj4+
Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgCj4+Pj4+
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4+Pj4+Pj4gaW5kZXggMWNjZjFlZi4u
MjkyNDhhNSAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5j
Cj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+Pj4+Pj4+IEBAIC00
OTUsMyArNDk1LDQgQEAgdm9pZCB0dG1fdHRfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX3R0ICp0dG0p
Cj4+Pj4+Pj4gwqDCoMKgwqDCoCBlbHNlCj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHR0bV9w
b29sX3VucG9wdWxhdGUodHRtKTsKPj4+Pj4+PiDCoCB9Cj4+Pj4+Pj4gK0VYUE9SVF9TWU1CT0wo
dHRtX3R0X3VucG9wdWxhdGUpOwo+Pj4+Pj4KPj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+Pj4g
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlu
a3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbGlzdHMuZnJlZWRl
c2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZhbXA7ZGF0YT0wNCU3QzAx
JTdDQW5kcmV5Lkdyb2R6b3Zza3klNDBhbWQuY29tJTdDOWJlMDI5ZjI2YTQ3NDYzNDdhNjEwOGQ4
OGZlZDI5OWIlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3
NDE3NTk2MDY1NTU5OTU1JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdN
REFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAm
YW1wO3NkYXRhPXRaM2RvJTJGZUt6QnRSbE5hRmJCakN0UnZVSEtkdndEWjdTb1loRUJ1NCUyQlQ4
JTNEJmFtcDtyZXNlcnZlZD0wIAo+Pj4+Pgo+Pj4+Cj4+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
