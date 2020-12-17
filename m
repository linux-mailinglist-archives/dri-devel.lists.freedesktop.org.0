Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 051B72DD9A9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 21:10:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278AC89798;
	Thu, 17 Dec 2020 20:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C2289798;
 Thu, 17 Dec 2020 20:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kb0z1Pf6VGowpmv63tdhpNwhqrA6bCGM4eYdze2ow+icJR35FKUYSd0OdtyFDfAIJkYVEQkbdH0F6P2LjsMxNo9TYo5NCt+aO2PCQQfjzEtHk9ZGEt0sYnZzar8nnaWkXWHKgp8xpMlmZ34LDq4VA2x2X+/gvGR5eDsly9Ny3ia3kHUcK4b2LqTWTlSz5qHVsMs7zh0Ez6cS67PEoDxv5qXpLg8FZHVaZiNDALVeyQ8/lmVlk4hU5fNae/7apHurJ+XxRs9q6HevSQ/EqtkIMzICZlSxKqOrIbowAVrFs1SV9qQfDoex5U7+s31qRytpuSMcEEMn/pQQUwgY2HrHAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2JEsXnk/rYGvXB09rbHYvf9jlKx1LIcf6CuRUIWAXs=;
 b=d1r7vGTq14bo2mH5Li3nyfWn0oxlBNPeHR5A8bujeXNDMzEV4ePeanWEOXGRFJT/UeVsrHKG3cYJbIyUFavuFxWrTj2CnAqWtt88CU8G8KFHEWzK+HQL06XC8LizYfTkqCVG6NsabIh8H6qQ9gjPuHAgDsTmELAD/Bx1HtZQjFuxFsSJSa/qDO/9MgwQ2Mp9kFUmRsSUcCJGT0dDRBMlp/qsASHRpPUCVDzwcA25bo8xiefUKM6gIoI68xJvrLKsDQHdX9iLSVtqeY4O9VCHItD3bX08ZRfCG3szWeYpB6Fmu7y8IePL43p2MPyq3Nfw9qIwgDCOU3NPtnjvZPz5gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2JEsXnk/rYGvXB09rbHYvf9jlKx1LIcf6CuRUIWAXs=;
 b=hpYJPbPXEmqCyRergUlnphlELjuQ2swVngFuA1fOWaucxHKr+Ib38l5bMc47YTGGEBOo49wj1DEmsKD54wuYGRSVueSVXzmj7ExHXPX8cl28fpQV5GVNl/lheqXUvGS2pKF2F/GuMPU8HUZixcZwJyoMS6Jxe7GbnCAh/328XIY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2388.namprd12.prod.outlook.com (2603:10b6:207:4a::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Thu, 17 Dec
 2020 20:10:14 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 20:10:14 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
 <a818be68-518c-754d-f63b-3754ce882fdc@gmail.com>
 <CAKMK7uEx631E1NB1=NYh7V2_+X=pK0WhA_sBwpxCGOhFaYw9wQ@mail.gmail.com>
 <e389b7d7-196c-ee03-ff94-ffd110c1013f@amd.com>
 <77cdb5bf-a418-bafd-2360-163e428c7394@amd.com>
 <CAKMK7uEgY4gYqowUZP0FZYHB7FNPCqApWojmSnuwhQ9WnY6hLA@mail.gmail.com>
 <8083b9f8-ee43-504f-0690-7add68472ca9@amd.com>
 <CAKMK7uGQtOgHxXQ_AK7f0unrwOnLQm3nb-VUJ_pW6vonRazu0Q@mail.gmail.com>
 <74140041-d838-87ce-5408-806d860cf9b3@amd.com>
 <X9tIrE0Ak68HJ391@phenom.ffwll.local>
 <864df6cc-33f4-6624-6756-5a171ad7ed4f@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e1549b76-eed4-fa91-88c6-083e0dfe5595@amd.com>
Date: Thu, 17 Dec 2020 21:10:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <864df6cc-33f4-6624-6756-5a171ad7ed4f@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0114.eurprd07.prod.outlook.com
 (2603:10a6:207:7::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0114.eurprd07.prod.outlook.com (2603:10a6:207:7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.12 via Frontend Transport; Thu, 17 Dec 2020 20:10:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c063c416-394a-403a-fe78-08d8a2c7c418
X-MS-TrafficTypeDiagnostic: BL0PR12MB2388:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2388AFFB722F8E01ACC6F59C83C40@BL0PR12MB2388.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eh7ieg6AnruTDiMMHsHaUmIUsnSWY2HC36JjZaoxfT0mr03/liySjvewpRRdW20oOdMFcuGAIxjs12IkVNXHWDnogTVkUZhUq060AEH6U1gmywKA1b9mHLRWXpPNZEioVtRrzGUsEVjFVxNhdIBtjrR6V7M1KZ44tep8Fsv0Kg7vu5ciRNSmvNh1szbbQNbdX7MYGDjRuaq5ksfnaOvjEgykR8SVZdEawW5Q1Fe8PylG+tjHZiSdS/eVySpHV5KL8SLqkss/Ey9XFtNr8cJelm6e14hdrLa+IpJD/zwlEdpp/FLeWQuHL217/anZ+xz3OCkOT99tocFAiGbOz7P8oz5SFSuUDIqspyHGOD+JEZUKlvTRJN40oEUsUwQDU88hhThFpCPBKWgfYU1dsZHLp/BrhSCThwZjSbL14j6F+NKIhlGW6ReqyZmVabp64ot1mrI8U819CoEV8N4Nq8qQSQGYg+y9rsnoSIgudxUFuaw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(66556008)(2616005)(2906002)(31696002)(478600001)(36756003)(966005)(8676002)(16526019)(66946007)(110136005)(66476007)(31686004)(186003)(54906003)(6486002)(8936002)(45080400002)(52116002)(86362001)(5660300002)(6666004)(4326008)(7416002)(316002)(83380400001)(370214003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZEN4bTRaWGhTZjVYaXlMUlRXcWxqQkhZUjZEVngwYkRscXBrYVdveXdIOVhU?=
 =?utf-8?B?cTRMZkZZRmRIZWdrdmdUWU9NdXBFOWZmbm1aYzJXRlROTi9ZcS9VaGFHS3N6?=
 =?utf-8?B?VzBUdXNSYkkxUDZQeTh6aUZsQkJMRDNxUmJvNm5ybVozTVgwTjlXV2tVbE0z?=
 =?utf-8?B?WVJCb3NvbFQwV0xJSThidEJLa2xCczBWQU1IaFdpSWdER0wyZ0Rwbkw5TFlC?=
 =?utf-8?B?bWJ0RmdXdkhKbEQ2aW92YkNoaHNEc085bWkwU1JJSmkvVktZbFN4VTFFQzkw?=
 =?utf-8?B?MjFnRUp4cXRpaTlGRGlNREF4NEpQSnh5WTVKZllIN0pUdTNlT0hYTkNRNEtw?=
 =?utf-8?B?VWVMSVhRM3NoT1QwZC8yRGNIalJpS3psMTRxbnphWndSRFdRUlhxekt0R2tG?=
 =?utf-8?B?djBBNklrNVhLUmt5NnNhUnYzQ0VyMEFCbktSbzBrTkxta09kb0RYQStLOGIx?=
 =?utf-8?B?VUVHclZra2doT2RHMkNMSGIxM1dXL29TQkM3N2ZrZUZaSjk0S21XcjJUeWYy?=
 =?utf-8?B?bGFtWTNoUDlIQThFR0svaWtmQ1dFY2tNVEFkZWU5eDR1K3B6bDFnOTUzcDBY?=
 =?utf-8?B?WkxUajgrT0w0NmNPclhWMU9XWDMzQS92bkoyckpibjBjam5yWEZxSi83OWtQ?=
 =?utf-8?B?c3U1b3VJRW9RM0c0OVJwMmRFM0RNZTR0ZHJwY0EwbFB2bTloenBXM1pFK0dT?=
 =?utf-8?B?VmJwS0pKRHNGVGVtc2V4SlR4Q0ExSWxOMTYxaEdWUzBpNVFYZVJzTUVFZm8v?=
 =?utf-8?B?eFlYSEhMK2NxTklwRmtYVXpIN2d4NTZSSEtWbTQ3dXBDT3ZQSS9Qc2pHT2FQ?=
 =?utf-8?B?eFlxUVZ1c3o2VTZ4bFRvVHM2L3JNVmtxWXN3Qk5zZTVvditRZ2NqWTlLbnFF?=
 =?utf-8?B?UXhPU0pqaCtCYXhpaVJKaTZhU1NUWWtkL2ExSVVjenNBbmtXR2VLeVhQaU4v?=
 =?utf-8?B?cmdja3pnTUZhNlplS1MzTW5pR2pWay9rZjJhUHFCM00xQzNoNktSajNYWjlH?=
 =?utf-8?B?MGxmZ0NTcDkzUThkbkNCYWVQV0RUYXNpbWVUM2xHZXl0b3J6eFBKV05kRCtH?=
 =?utf-8?B?TlE0WnBrZGxIZENlaURCTk1ZdHlqQk1WOVQxZStHTUcrWGpKYkhOQ3FaMTYr?=
 =?utf-8?B?aTBCZmlFZ1dVSmtlcFFVRk44RTFNYWhRQ3dzSGpkUnhwdUhLbUg0VnF4YkJq?=
 =?utf-8?B?REpBckt1R1Bza0FZQmltN0FFR2o2QUZJbzlnSkVZTE5HYmwzWlFRK2ZBWWZX?=
 =?utf-8?B?MGdvVDk1MktYdHMvaVdLUURESm9hbG10cncxei9TdWVybVBZalZxbXJBejMw?=
 =?utf-8?B?MW5uRmFIcFF5eEg1ZjdHeGRwcVpwYWRHTEwySTNHYWVyWDhVQVVMZnZTaFZ3?=
 =?utf-8?B?d2xvVWdXbmpSaG1CSnVvVXlTSUt4aUFSZ3V6cVpUeEpYQ2NCME5rdHJ4dkx6?=
 =?utf-8?Q?mdPzVGcv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 20:10:14.3919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: c063c416-394a-403a-fe78-08d8a2c7c418
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fy0B3bLvnTbCHUYuDsD2H16kUPouiOoFDJORWdgW8N41DfMD2/yZT3dR5x/d1uly
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2388
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W1NOSVBdCj4+PiBCeSBlbGltaW5hdGluZyBzdWNoIHVzZXJzLCBhbmQgcmVwbGFjaW5nIHRoZW0g
d2l0aCBsb2NhbCBtYXBzIHdoaWNoCj4+Pj4gYXJlIHN0cmljdGx5IGJvdW5kIGluIGhvdyBsb25n
IHRoZXkgY2FuIGV4aXN0IChhbmQgaGVuY2Ugd2UgY2FuCj4+Pj4gc2VyaWFsaXplIGFnYWluc3Qg
dGhlbSBmaW5pc2hpbmcgaW4gb3VyIGhvdHVucGx1ZyBjb2RlKS4KPj4+IE5vdCBzdXJlIEkgc2Vl
IGhvdyBzZXJpYWxpemluZyBhZ2FpbnN0IEJPIG1hcC91bm1hcCBoZWxwcyAtIG91ciAKPj4+IHBy
b2JsZW0gYXMKPj4+IHlvdSBkZXNjcmliZWQgaXMgdGhhdCBvbmNlCj4+PiBkZXZpY2UgaXMgZXh0
cmFjdGVkIGFuZCB0aGVuIHNvbWV0aGluZyBlbHNlIHF1aWNrbHkgdGFrZXMgaXQncyBwbGFjZSAK
Pj4+IGluIHRoZQo+Pj4gUENJIHRvcG9sb2d5Cj4+PiBhbmQgZ2V0cyBhc3NpZ25lZCBzYW1lIHBo
eXNpY2FsIElPIHJhbmdlcywgdGhlbiBvdXIgZHJpdmVyIHdpbGwgCj4+PiBzdGFydCBhY2Nlc3Np
bmcgdGhpcwo+Pj4gbmV3IGRldmljZSBiZWNhdXNlIG91ciAnem9tYmllJyBCT3MgYXJlIHN0aWxs
IHBvaW50aW5nIHRvIHRob3NlIHJhbmdlcy4KPj4gVW50aWwgeW91ciBkcml2ZXIncyByZW1vdmUg
Y2FsbGJhY2sgaXMgZmluaXNoZWQgdGhlIHJhbmdlcyBzdGF5IAo+PiByZXNlcnZlZC4KPgo+Cj4g
VGhlIHJhbmdlcyBzdGF5IHJlc2VydmVkIHVudGlsIHVubWFwcGVkIHdoaWNoIGhhcHBlbnMgaW4g
Ym8tPmRlc3Ryb3kKCkknbSBub3Qgc3VyZSBvZiB0aGF0LiBXaHkgZG8geW91IHRoaW5rIHRoYXQ/
Cgo+IHdoaWNoIGZvciBtb3N0IGludGVybmFsbHkgYWxsb2NhdGVkwqAgYnVmZmVycyBpcyBkdXJp
bmcgc3dfZmluaSB3aGVuIAo+IGxhc3QgZHJtX3B1dAo+IGlzIGNhbGxlZC4KPgo+Cj4+IElmIHRo
YXQncyBub3QgdGhlIGNhc2UsIHRoZW4gaG90dW5wbHVnIHdvdWxkIGJlIGZ1bmRhbWVudGFsbHkg
aW1wb3NzaWJsZQo+PiBvdCBoYW5kbGUgY29ycmVjdGx5Lgo+Pgo+PiBPZiBjb3Vyc2UgYWxsIHRo
ZSBtbWlvIGFjdGlvbnMgd2lsbCB0aW1lIG91dCwgc28gaXQgbWlnaHQgdGFrZSBzb21lIHRpbWUK
Pj4gdG8gZ2V0IHRocm91Z2ggaXQgYWxsLgo+Cj4KPiBJIGZvdW5kIHRoYXQgUENJIGNvZGUgcHJv
dmlkZXMgcGNpX2RldmljZV9pc19wcmVzZW50IGZ1bmN0aW9uCj4gd2UgY2FuIHVzZSB0byBhdm9p
ZCB0aW1lb3V0cyAtIGl0IHJlYWRzIGRldmljZSB2ZW5kb3IgYW5kIGNoZWNrcyBpZiAKPiBhbGwg
MXMgaXMgcmV0dXJuZWQKPiBvciBub3QuIFdlIGNhbiBjYWxsIGl0IGZyb20gd2l0aGluIHJlZ2lz
dGVyIGFjY2Vzc29ycyBiZWZvcmUgdHJ5aW5nIAo+IHJlYWQvd3JpdGUKClRoYXQncyB3YXkgdG8g
bXVjaCBvdmVyaGVhZCEgV2UgbmVlZCB0byBrZWVwIHRoYXQgbXVjaCBsb3dlciBvciBpdCB3aWxs
IApyZXN1bHQgaW4gcXVpdGUgYSBwZXJmb3JtYW5jZSBkcm9wLgoKSSBzdWdnZXN0IHRvIHJhdGhl
ciB0aGluayBhYm91dCBhZGRpbmcgZHJtX2Rldl9lbnRlci9leGl0IGd1YXJkcy4KCkNocmlzdGlh
bi4KCj4KPj4+IEFub3RoZXIgcG9pbnQgcmVnYXJkaW5nIHNlcmlhbGl6aW5nIC0gcHJvYmxlbcKg
IGlzIHRoYXQgc29tZSBvZiB0aG9zZSAKPj4+IEJPcyBhcmUKPj4+IHZlcnkgbG9uZyBsaXZlZCwg
dGFrZSBmb3IgZXhhbXBsZSB0aGUgSFcgY29tbWFuZAo+Pj4gcmluZyBidWZmZXIgQ2hyaXN0aWFu
IG1lbnRpb25lZCBiZWZvcmUgLQo+Pj4gKGFtZGdwdV9yaW5nX2luaXQtPmFtZGdwdV9ib19jcmVh
dGVfa2VybmVsKSwgaXQncyBsaWZlIHNwYW4KPj4+IGlzIGJhc2ljYWxseSBmb3IgdGhlIGVudGly
ZSB0aW1lIHRoZSBkZXZpY2UgZXhpc3RzLCBpdCdzIGRlc3Ryb3llZCAKPj4+IG9ubHkgaW4KPj4+
IHRoZSBTVyBmaW5pIHN0YWdlICh3aGVuIGxhc3QgZHJtX2Rldgo+Pj4gcmVmZXJlbmNlIGlzIGRy
b3BwZWQpIGFuZCBzbyBzaG91bGQgSSBncmFiIGl0J3MgZG1hX3Jlc3ZfbG9jayBmcm9tCj4+PiBh
bWRncHVfcGNpX3JlbW92ZSBjb2RlIGFuZCB3YWl0Cj4+PiBmb3IgaXQgdG8gYmUgdW5tYXBwZWQg
YmVmb3JlIHByb2NlZWRpbmcgd2l0aCB0aGUgUENJIHJlbW92ZSBjb2RlID8gCj4+PiBUaGlzIGNh
bgo+Pj4gdGFrZSB1bmJvdW5kIHRpbWUgYW5kIHRoYXQgd2h5IEkgZG9uJ3QgdW5kZXJzdGFuZAo+
Pj4gaG93IHNlcmlhbGl6aW5nIHdpbGwgaGVscC4KPj4gVWggeW91IG5lZWQgdG8gdW50YW5nbGUg
dGhhdC4gQWZ0ZXIgaHcgY2xlYW51cCBpcyBkb25lIG5vIG9uZSBpcyBhbGxvd2VkCj4+IHRvIHRv
dWNoIHRoYXQgcmluZ2J1ZmZlciBibyBhbnltb3JlIGZyb20gdGhlIGtlcm5lbC4KPgo+Cj4gSSB3
b3VsZCBhc3N1bWUgd2UgYXJlIG5vdCBhbGxvd2VkIHRvIHRvdWNoIGl0IG9uY2Ugd2UgaWRlbnRp
ZmllZCB0aGUgCj4gZGV2aWNlIGlzCj4gZ29uZSBpbiBvcmRlciB0byBtaW5pbWl6ZSB0aGUgY2hh
bmNlIG9mIGFjY2lkZW50YWwgd3JpdGVzIHRvIHNvbWUgCj4gb3RoZXIgZGV2aWNlIHdoaWNoIG1p
Z2h0IG5vdwo+IG9jY3VweSB0aG9zZSBJTyByYW5nZXMgPwo+Cj4KPj4gwqAgVGhhdCdzIHdoYXQK
Pj4gZHJtX2Rldl9lbnRlci9leGl0IGd1YXJkcyBhcmUgZm9yLiBMaWtlIHlvdSBzYXkgd2UgY2Fu
dCB3YWl0IGZvciBhbGwgc3cKPj4gcmVmZXJlbmNlcyB0byBkaXNhcHBlYXIuCj4KPgo+IFllcywg
ZGlkbid0IG1ha2Ugc2Vuc2UgdG8gbWUgd2h5IHdvdWxkIHdlIHVzZSB2bWFwX2xvY2FsIGZvciBp
bnRlcm5hbGx5Cj4gYWxsb2NhdGVkIGJ1ZmZlcnMuIEkgdGhpbmsgd2Ugc2hvdWxkIGFsc28gZ3Vh
cmQgcmVnaXN0ZXJzIHJlYWQvd3JpdGVzIAo+IGZvciB0aGUKPiBzYW1lIHJlYXNvbiBhcyBhYm92
ZS4KPgo+Cj4+Cj4+IFRoZSB2bWFwX2xvY2FsIGlzIGZvciBtYXBwaW5ncyBkb25lIGJ5IG90aGVy
IGRyaXZlcnMsIHRocm91Z2ggdGhlIAo+PiBkbWEtYnVmCj4+IGludGVyZmFjZSAod2hlcmUgIm90
aGVyIGRyaXZlcnMiIGNhbiBpbmNsdWRlIGZiZGV2L2ZiY29uLCBpZiB5b3UgdXNlIHRoZQo+PiBn
ZW5lcmljIGhlbHBlcnMpLgo+PiAtRGFuaWVsCj4KPgo+IE9rLCBzbyBJIGFzc3VtZWQgdGhhdCB3
aXRoIHZtYXBfbG9jYWwgeW91IHdlcmUgdHJ5aW5nIHRvIHNvbHZlIHRoZSAKPiBwcm9ibGVtIG9m
IHF1aWNrIHJlaW5zZXJ0aW9uCj4gb2YgYW5vdGhlciBkZXZpY2UgaW50byBzYW1lIE1NSU8gcmFu
Z2UgdGhhdCBteSBkcml2ZXIgc3RpbGwgcG9pbnRzIHRvbyAKPiBidXQgYWN0dWFsbHkgYXJlIHlv
dSB0cnlpbmcgdG8gc29sdmUKPiB0aGUgaXNzdWUgb2YgZXhwb3J0ZWQgZG1hIGJ1ZmZlcnMgb3V0
bGl2aW5nIHRoZSBkZXZpY2UgPyBGb3IgdGhpcyB3ZSAKPiBoYXZlIGRybV9kZXZpY2UgcmVmY291
bnQgaW4gdGhlIEdFTSBsYXllcgo+IGkgdGhpbmsuCj4KPiBBbmRyZXkKPgo+Cj4+Cj4+PiBBbmRy
ZXkKPj4+Cj4+Pgo+Pj4+IEl0IGRvZXNuJ3QKPj4+PiBzb2x2ZSBhbGwgeW91ciBwcm9ibGVtcywg
YnV0IGl0J3MgYSB0b29sIHRvIGdldCB0aGVyZS4KPj4+PiAtRGFuaWVsCj4+Pj4KPj4+Pj4gQW5k
cmV5Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+PiAtIGhhbmRsZSBmYmNvbiBzb21laG93LiBJIHRoaW5rIHNo
dXR0aW5nIGl0IGFsbCBkb3duIHNob3VsZCB3b3JrIAo+Pj4+Pj4gb3V0Lgo+Pj4+Pj4gLSB3b3Jz
dCBjYXNlIGtlZXAgdGhlIHN5c3RlbSBiYWNraW5nIHN0b3JhZ2UgYXJvdW5kIGZvciBzaGFyZWQg
Cj4+Pj4+PiBkbWEtYnVmCj4+Pj4+PiB1bnRpbCB0aGUgb3RoZXIgbm9uLWR5bmFtaWMgZHJpdmVy
IHJlbGVhc2VzIGl0LiBmb3IgdnJhbSB3ZSByZXF1aXJlCj4+Pj4+PiBkeW5hbWljIGltcG9ydGVy
cyAoYW5kIG1heWJlIGl0IHdhc24ndCBzdWNoIGEgYnJpZ2h0IGlkZWEgdG8gYWxsb3cKPj4+Pj4+
IHBpbm5pbmcgb2YgaW1wb3J0ZXIgYnVmZmVycywgbWlnaHQgbmVlZCB0byByZXZpc2l0IHRoYXQp
Lgo+Pj4+Pj4KPj4+Pj4+IENoZWVycywgRGFuaWVsCj4+Pj4+Pgo+Pj4+Pj4+IENocmlzdGlhbi4K
Pj4+Pj4+Pgo+Pj4+Pj4+PiBBbmRyZXkKPj4+Pj4+Pj4KPj4+Pj4+Pj4KPj4+Pj4+Pj4+IC1EYW5p
ZWwKPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+
IEkgbG9hZGVkIHRoZSBkcml2ZXIgd2l0aCB2bV91cGRhdGVfbW9kZT0zCj4+Pj4+Pj4+Pj4+IG1l
YW5pbmcgYWxsIFZNIHVwZGF0ZXMgZG9uZSB1c2luZyBDUFUgYW5kIGhhc24ndCBzZWVuIGFueSAK
Pj4+Pj4+Pj4+Pj4gT09QcyBhZnRlcgo+Pj4+Pj4+Pj4+PiByZW1vdmluZyB0aGUgZGV2aWNlLiBJ
IGd1ZXNzIGkgY2FuIHRlc3QgaXQgbW9yZSBieSAKPj4+Pj4+Pj4+Pj4gYWxsb2NhdGluZyBHVFQg
YW5kCj4+Pj4+Pj4+Pj4+IFZSQU0gQk9zCj4+Pj4+Pj4+Pj4+IGFuZCB0cnlpbmcgdG8gcmVhZC93
cml0ZSB0byB0aGVtIGFmdGVyIGRldmljZSBpcyByZW1vdmVkLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4+PiBBbmRyZXkKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFJlZ2FyZHMs
Cj4+Pj4+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+IEFuZHJl
eQo+Pj4+Pj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+Pj4+Pj4+Pj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+Pj4+Pj4+Pj4+PiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+Pj4+Pj4+PiBodHRwczovL25hbTExLnNhZmVsaW5r
cy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVz
a3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTA0JTdDMDEl
N0NBbmRyZXkuR3JvZHpvdnNreSU0MGFtZC5jb20lN0M5MjY1NGYwNTM2Nzk0MTVkZTc0ODA4ZDhh
MjgzOGIzZSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0
MzgwMzMxODE4NDM1MTIlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01E
QWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZh
bXA7c2RhdGE9JTJCZVM3djVDckhSZmJsajJGRkNkNG5yREx4VXh6YW02RXlITTZwb1BrR2M0JTNE
JmFtcDtyZXNlcnZlZD0wIAo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pgo+Pj4+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
