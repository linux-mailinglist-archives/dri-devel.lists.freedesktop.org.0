Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB1D340E96
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 20:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735996E14B;
	Thu, 18 Mar 2021 19:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E4876E14B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 19:46:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KWaMHn7FLegqGis7rgrsMagcJ6dHBYtFtZhWzPLW8rmHs4NmfUqYhRWnDzOlCBl8rs+XHdGdcc9gwPV7gQxImdi2ht0Vot2mmQLGlmVSxpA9/FcCdgDs7j/LwT+bjwETDiEYv6mVFGlkgQnfGM+a6N0NpqbFPz3Ro/n4irMVTFHfe8v24FLlUA+uSL/n+R8ugA4sMO29Xdjuna/8RMVPUAoRjtRHVdyq3+340ylsrU1N7FegjKIHbbESThXEjz/s5mS1Dfkb3I+Lk91YIIbTJGJ5GEXEHOZ+oahkWA4bG1PTVdVoDnLD3kXEObeGT1DwKm1JY70A3LF5sOCKhipmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPPA/QLweScYhJju+7dNy0KsgZmPuy6dUe1jzFv42sk=;
 b=EA2CqQTLB1o1g/3oOdo1tQe3NUVKLT0IZzqpWGDOPhF7CR+c7LDwGVFmVjN+1MBnq8vd9Yo0qIA6ePdbvFsETeKEG/T9yjFpz10dvKHhg2aqrxcsUdAwdjKDQLDTtuIRLzLus+GmOt7WBWKd0o4Jq5+1ZDI2hs2k+7rwpWf0IqgbHkB0EA+3DXRmAAqScrvN7LKktMHCFsy2E7wVpVrXKKIpE7cJBf+8LBGWzlm63xW/d607Q12PuHfS/5H+BkQYpUIAwe0p+o/eR8aaT7ruJqKwqh991AOaHMduODGja+P7RymXhefHQttPZfEnpUcCSG6xnfGyIkcokObDkk2xEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XPPA/QLweScYhJju+7dNy0KsgZmPuy6dUe1jzFv42sk=;
 b=N0ttfqogeqYHMLAx3sQOZvKbGsCLLZNbghhNwRwq8GnTuQXPuOjiMH8o6ru6pV9pGvhKe7XUscUbZ84AS9DonA/JWA/0CT9E2reLTuTDdmRQ6kl4Pffxb8QDUP7lg1BiYWG1TtKPSufLU6Z+RmIVEC7mbGZc7FJRPlLt9AnAtW0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR1201MB0056.namprd12.prod.outlook.com (2603:10b6:910:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 19:46:48 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::6504:7fc4:d02f:77f2%3]) with mapi id 15.20.3933.033; Thu, 18 Mar 2021
 19:46:48 +0000
Subject: Re: [PATCH 1/3] drm/ttm: move swapout logic around v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20210318124719.13656-1-christian.koenig@amd.com>
 <21b8c51d-a237-060d-438a-cd5709c28348@amd.com>
 <dcbdef7a-d18d-c729-0e8a-bfe562b64695@gmail.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <4ef57ca5-0865-043e-cb31-787a66c93b8d@amd.com>
Date: Thu, 18 Mar 2021 20:46:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <dcbdef7a-d18d-c729-0e8a-bfe562b64695@gmail.com>
Content-Language: en-US
X-Originating-IP: [93.229.52.167]
X-ClientProxiedBy: FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20)
 To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.87] (93.229.52.167) by
 FRYP281CA0010.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.10 via Frontend Transport; Thu, 18 Mar 2021 19:46:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1d9f5e06-dff1-4f23-7d3d-08d8ea469182
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0056:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB0056EA44468534B99BC2B3298B699@CY4PR1201MB0056.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x+ZZ+QMr3OqZEhkJ98uvYcrQZW8l3BVOeO70T/8kReWgpCAz2pDogy5iTBEvuN4gi1SzDY9RD1IhW+qab13GoHpaHptdfdGQPVG0IsBdz9cK+yj65iZ7KcCFFrQ85+1JJpv3TQ7aa5cjnFT9Ir1fcYHN7u/E5/PH8D1p9LHxoQ5+HmAD/nio7EtBdncg2AYoF078mdwjOALV33VFqr1zjLhnbl7xKrQUTrAR0L1SBI32zYwn5+KYLVQHUwu86P85vn1VSKxtqkd1hcUJdph0UJHY6DveuehX7vh/yrJd3dmrDec2zIgzrmzsZszfNK9HppPRPbwA13llLcByTWaokwL5dD6CFPfneME2LJ0QIz4olZ6pHTjqBA7LN05G5jBNNptr8vIHy6js3ecosmD7d+YUAzWtKiJ085/z2GoQEWS1lOffcw0eXIDgo0bdMPaxePrDAOvzcBdHtMvFVyoDsm1Lnjf0carZEXNsAhkNF1SdztmOL3WZN1WtneeodI2aG08XCoetBHcfMyAebUbaVM3ZDimfZ2p2uj9U0iEjnnxZhYy2PFgFmhs4REnnksxU1+IQpBCO1YETEZG2f9TnEKaMctTdktumk/71ERDLnjWhgbksXbh4lm/HwzWFz0k18+z8VQM/NnskPxYoEyHoVli/JiER36lfk8t0VG6Q6QImGZ7ClQpPXhJHxqwtsJeE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(6666004)(66476007)(186003)(8676002)(5660300002)(8936002)(2616005)(16526019)(31686004)(956004)(66556008)(38100700001)(6486002)(316002)(36756003)(52116002)(4326008)(478600001)(31696002)(26005)(2906002)(53546011)(16576012)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?a0RJU0tPbFhIVFRKY09OZHllZnVOV2dmamVWN2d5K21xT1d5Mi9tYUJTbkpq?=
 =?utf-8?B?c08yZ0NXZXFxUmhZUXI4NFlPaXFrWU5zZG5SUkxoYUYwME5vL1VXYkI5bnV1?=
 =?utf-8?B?SEs1aGwvYVN5N0NYL2MxODJ0U3duckFGT2IvT1Z5U3Z0VU1hWitUcUVtQXJv?=
 =?utf-8?B?cUFIK0Y0cCtSNFlETWMxellTZEk3L2lKOW4xT1hhZXA4Nkl5NU11VjZ2KzM4?=
 =?utf-8?B?RFZHcktyK0kwSUt6b3cveE1zb2lyTTl4ak94eFZ6R0Rab2hxRkhQYmZMOWY0?=
 =?utf-8?B?ci93eXRXa2NkaWtIWU1kWkVDM011MUxLZzVydlN3YzRwbkgzejJ1ckJJa2Vv?=
 =?utf-8?B?SnBFakpmQVdTQkdzYmZ0VXFSZXNDL3BueTcybHFySE1HU25XeS9SRHRoRWcv?=
 =?utf-8?B?S2trbUk0MVV1eUUxWVNySHJEMm5mUlZSZkxNck5WdlIxWERMRmdoa3hFQ1dR?=
 =?utf-8?B?bUxkamtKNFFZNTB6RmlEUDhDS1ZqNDJndnF1S3hEWkVvU0FqcVdwN3A2dS82?=
 =?utf-8?B?NGhvb1ZHQVdBR205dnBKdUw0UXZSdXkyOURSTW8xUVc0TkVPRnBvMStRRFQv?=
 =?utf-8?B?a1RtbjlXV2JCTUNkREZaNnkvZ0VjWVBoSTgvZFFuM1FQR3hiMDVZbXJxMW5N?=
 =?utf-8?B?K1hMdnBoQVhlOFVZUllQWTd3U2k3cjBOTHZtTjF2OTlqcEg2UmtJZzE4UWt5?=
 =?utf-8?B?MUdMSW1rMnFjL1NjRWpTV1lQdWxFTGxqWm4rdHRCVmQrY3JjZDA0ZFd3eTdn?=
 =?utf-8?B?eXQ2dVg0b2RkbSsyTlgxVzhkakZkeExucStwOHQwa3J1R05FRlJESEtGV2xU?=
 =?utf-8?B?ZGI5aWNBcEcwME5EQ0hnV0V5UmhjeVN0dktUVVY5L1ZCVVJtRklkVHJHODdo?=
 =?utf-8?B?ZjlCN2hCRFFNMmpXcWN4L293eUNLTHRGeGg1eERDKzNzeGIvR1ZjS2c5L2pX?=
 =?utf-8?B?QnBabUxFM2tmSU9ZN3BpeXNpYytSQ2xlcXpsUkN4RGMxS2JqMUpYaVhkVVdK?=
 =?utf-8?B?VXhva1FNV2RxYmNJMStyREhiYVBpVTZYczlkMEdSdllza2N2YlNsZnUra0NL?=
 =?utf-8?B?WGlpSHZDWXJpMHF3V3UyeEZoY1pGM0Z5U2diM2RqRnJhcllhZWZNbTRueHhs?=
 =?utf-8?B?Y2tMMUFwbmtuTmdoVzFBcVlkaUVVVlR5SFY1ckNqalRDZS94ZGVVV0ZCWTJu?=
 =?utf-8?B?ZnEycTBlUndmNkNubXBlUDd3bE5JQ2tJTGU4MTZvazNJb25PNFhsYXVsZGdQ?=
 =?utf-8?B?WFR2eG40cTBRb1VRaC9JZHU5RDhnanJjN1Q0Z3lqN00wSkl0NWtyVDBKUjR5?=
 =?utf-8?B?WEFZb1BkZytHMFNTRmN2Ulk1cUVTYldoS3ZtVXZRWlo1RmxMRGNCVTBHWmk2?=
 =?utf-8?B?UjZVSjVJRm5SQXVlSVR2ejNVTUxHR0Y1NHFtMzY1VlhtaElXMW9xMUVYQUJj?=
 =?utf-8?B?Q0RFR3dNTTZhMVQ1MnZkMFVSb2FRNWVSZHBGak1XaEVwRVRaTGIzTDlzTVdZ?=
 =?utf-8?B?RjBZMk5ZaDNReHNIdGNoa3RKTXo4Q2RVNjgvQjNhQjlMeldNMVZtTWNvY1hj?=
 =?utf-8?B?bXcxcmtBNWlpOUZEaHBHajhKMHp0Y3c0RG8yQVpOMEhPRTVlRm1Za2JwbnZN?=
 =?utf-8?B?Q3VrbGFhRTFiaWR4ellsRFllK3JjWktSV09aNHkySmxUb2ErKzZ0emZ2dXhn?=
 =?utf-8?B?MHpPWnZmRlRXVVZNbUVPTnQwbVZuRXBKUzB4L1VEbllrYVprS1oyazJIMUkw?=
 =?utf-8?Q?zwqQs/TKmTkOELpr77xTsfEfdN3o24gXKuwtcD9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9f5e06-dff1-4f23-7d3d-08d8ea469182
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 19:46:48.5782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7vv9cmaszW1Lyqh0r47r+FdtH5uZqSsshnYQbTGMMEYvLVRkzv2dF8WH2/1+a2WmRpbgTEnra/kSLxbHYQ0BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0056
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
Cc: ray.huang@amd.com, matthew.william.auld@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMTgvMjEgNDoyNiBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAxOC4wMy4y
MSB1bSAxNTo0MyBzY2hyaWViIE5pcm1veToKPj4gSGkgQ2hyaXN0aWFuLAo+Pgo+PiBPbiAzLzE4
LzIxIDE6NDcgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IDxzbmlwPgo+Pj4gwqAgLyoq
Cj4+PiDCoMKgICogdHRtX2JvX3VzZXNfZW1iZWRkZWRfZ2VtX29iamVjdCAtIGNoZWNrIGlmIHRo
ZSBnaXZlbiBibyB1c2VzIHRoZQo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1f
ZGV2aWNlLmggCj4+PiBiL2luY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmgKPj4+IGluZGV4IDAz
NWJiYzA0NGEzYi4uNmEwYjI2N2Q0ZmU2IDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vdHRt
L3R0bV9kZXZpY2UuaAo+Pj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9kZXZpY2UuaAo+Pj4g
QEAgLTI5Nyw2ICsyOTcsOCBAQCBzdHJ1Y3QgdHRtX2RldmljZSB7Cj4+PiDCoMKgwqDCoMKgIHN0
cnVjdCBkZWxheWVkX3dvcmsgd3E7Cj4+PiDCoCB9Owo+Pj4gwqAgK2xvbmcgdHRtX2dsb2JhbF9z
d2Fwb3V0KHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LCBnZnBfdCAKPj4+IGdmcF9mbGFn
cyk7Cj4+Cj4+Cj4+IFRoZXJlIGlzIGEgdHlwbyBoZXJlLCBsb25nIC0+IGludC4KPgo+IEFoLCB5
ZXMuIEkgbWlzc2VkIHRvIGFkZCB0aGUgY2hhbmdlIHRvIHRoZSBoZWFkZXIgZmlsZS4KCgpJIGhh
dmUgdGVzdGVkIHRoZSBwYXRjaCBzZXJpZXMgb24gcXhsIGFuZCB2bXdnZnguCgpXaXRoIHRoYXQg
dHlwbyBmaXhlZCwgdGhlIHNlcmllcyBpcyBUZXN0ZWQtYnk6IE5pcm1veSBEYXMgCjxuaXJtb3ku
ZGFzQGFtZC5jb20+CgoKPgo+IFRoYW5rcyBmb3IgcG9pbnRpbmcgdGhhdCBvdXQsCj4gQ2hyaXN0
aWFuLgo+Cj4+Cj4+Cj4+IFRoYW5rcywKPj4KPj4gTmlybW95Cj4+Cj4+Cj4+PiArCj4+PiDCoCBz
dGF0aWMgaW5saW5lIHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqCj4+PiDCoCB0dG1fbWFu
YWdlcl90eXBlKHN0cnVjdCB0dG1fZGV2aWNlICpiZGV2LCBpbnQgbWVtX3R5cGUpCj4+PiDCoCB7
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
