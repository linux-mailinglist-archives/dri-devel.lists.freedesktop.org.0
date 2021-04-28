Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6ECD36DDC2
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 19:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC8689F75;
	Wed, 28 Apr 2021 17:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770053.outbound.protection.outlook.com [40.107.77.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC9E89F08;
 Wed, 28 Apr 2021 17:02:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnX+GkG7I646V22fWmfH7XlKTN/j6nyN1P8IfXX0NlcAd7LHYQBo3SLFu3Di5a2zQ5e1y+iGXXDQz+divvycekU2r7JoI90tbpyytMk4OSlBE3JYal5YrpgoYUmVICtuIoFAM5hEqtXm6+SWExSPKmJIb42DWW7bXkI03DRGzoR25fAUCY2GpCMX7zsqSJQySz/HyuNTbiQNG4L86PTlPedYBpdsFiPDmp0iy/Ug/n3oIrEqc/2P6PhcO9o7dFa2T/h6K6VzNFrAC6/SXnAsBFruDUW3plA1YK+Bc21dl7WUyhUGu3t/l1CTgBn+2eK8/ELGO+uuRbSwcAYGuhOEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwxKxtPK8yPiUHjdu99g1rP6XTM6loAvmB/JSALbLnA=;
 b=JUJAp77mBg7wGzVksv8IfSs9yfNBp7UBwWhIsR1rhaUSHKQE6Fvdpz5ZAtHVlY4YbhR/QlAwBqRMU4k+B5a7lt3yCuYnpyeOt0YfpPMabFOmEwLOxrIw26Uss9q4+oOpH/GNqjgcIJf13srMpopTzIlbCpG53V4Xstksg0busvo0f5NaWNH4KUqjwtuoBFP65oEzCy2ClaVHzDt5lo5+mdymD9fMJb1EDp2xmpBIu6rWIAaLL3FAHbEBCHHebFiEshwvAplSkjGYncW0L8Ki+jgnHS0ex0VcYVD0YqjK8sjdHp9l4k9pd2xP22lqeIBC2dq+VCmr0pQzBcesBbrdnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwxKxtPK8yPiUHjdu99g1rP6XTM6loAvmB/JSALbLnA=;
 b=spFu0BUGeu5SV6zKhRnM7glbv6os5SW55PSFW+CcwuPcc92CbKMc1elPHcg96laBpczHNtg0LX9i5sAoqiCI7fZgsYFauK4bk2DewEuMZDAU5IDyIbW48Iyt6Hm/tW5Y9mR3Nem23LDkTumcamm8eGB0Zz7BdFdb1nQ9Yi2WDko=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4438.namprd12.prod.outlook.com (2603:10b6:208:267::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 17:02:33 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 28 Apr 2021
 17:02:33 +0000
Subject: Re: [PATCH 1/2] drm/ttm: Don't evict SG BOs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210428053338.11560-1-Felix.Kuehling@amd.com>
 <af825fa4-abb3-69a6-48cd-0a6252f72503@gmail.com>
 <83a52589-ce81-35b1-e85d-e9485f9bc233@amd.com>
 <daf8b801-a79c-6033-f782-11ec1951957b@gmail.com>
 <4df6e459-5d14-806d-05b4-95fa8d196b59@amd.com>
 <0fba1262-8fbf-37f0-4d51-c4d74476894b@gmail.com>
 <aabcf10f-7c78-2374-bb3a-d25bf5914ee0@amd.com>
 <6946e644-0a16-30fe-e987-861bec610762@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <55742179-98d9-d68a-30b7-331885fd91e0@amd.com>
Date: Wed, 28 Apr 2021 13:02:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <6946e644-0a16-30fe-e987-861bec610762@gmail.com>
Content-Language: en-US
X-Originating-IP: [142.182.183.69]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.183.69) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend
 Transport; Wed, 28 Apr 2021 17:02:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72f67126-ff3a-493c-d330-08d90a676a59
X-MS-TrafficTypeDiagnostic: MN2PR12MB4438:
X-Microsoft-Antispam-PRVS: <MN2PR12MB443896DEB28FBE6BBFBE7EF692409@MN2PR12MB4438.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DEFQYWBEqMyov08DGLCWjJFZzBipdTkHtyRTkHYA8gdSNb2K2SunmIuOblcNKS8p0GVFOnXQcOdiWAI4vhRsJfhew9tF1HFUKWlF6yrW8xiYl1fNymfTJhxynbNVrPVn6VbrnSEeeMXhuP81ZTsGGtodQDn+wXWx/uuMKeTEzF5nSFEbR4p88/2tqh5vCj8q95AAsDqkUhpDwmK7VHjc7Uj7LTbXDOvrgIeQLBRq2iTnBHlQ3H6thiYXuSaKXRtN5GXrKeq6GkV2k7954yM0wO7L/TGpOLHTcffFLOU4oYpE1hMFMtCEZwq/dJWe1NXi98ghjYnEkkuR026TAXIveVEkONTaZ3JSKHwNvwxYN3CIA7CORQzUme1hClqOMrqmwTYxj/vD6WmaO7lvR5iNCyw3YJD4QcmDKxrmFlAmktFJCvxwP1o2y1UoXxMvZeQL+hIed0+XIQto2cW7hFXsJCzBgSpxOYR+XWzpZMXT+Kfl6xL9G328GHh4bczfDwvKPCq73XQutZqcP3bUjFym1c0JfAHgF8+bxWvU2n/mHpWvlMWe5b9YGjnaLe6atJiDYu0lP0dS+gV7yRANxCOnFhGWwZ1fI/O3iUgjrKZCW01Ha7HtRz7RZgx35+5Nja4ol+RXq29cHwOR/qicbCvdNd781gmE+Fxl1vpedwPw8APHg5GuQfH2Z2F8qz+XdbBc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(66476007)(31686004)(16576012)(83380400001)(26005)(8676002)(86362001)(31696002)(66574015)(316002)(38100700002)(66946007)(8936002)(66556008)(2906002)(5660300002)(36756003)(956004)(2616005)(6486002)(186003)(16526019)(478600001)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N2dWVG9qMW10QU04NVRhVzNtbFJLQ05LV3ArenlzekxCbWU0dllPZFhHTVA2?=
 =?utf-8?B?aEx2UFptR1VsQTR5Z2tXRVA1V25SRUZFWGthKzQ3QTJybEdQU3QxYmttN2h2?=
 =?utf-8?B?VHdMcDhqa0RqeklTSDgvcWdEN2JSTEtMVHU0clJTenRXak85ZkVURXFuQWNj?=
 =?utf-8?B?RFZhWjVDN2x5ZzZ0V0FkNHF3NE1HVUxxSkNWNHVVVmVtYTBTVWZwMmRyQ1hJ?=
 =?utf-8?B?OVFzNG5YaS9wTHJZRzFqK0o3b00wK2ZJbGFUZExuZ0tkbHpFTTFmOGpRaXdW?=
 =?utf-8?B?TklWVDRGQzh5cEFxRkRWekxnL2FTa1Fjd1ZVWEFZMlVNaEJsNEd5UFdVbThm?=
 =?utf-8?B?RlhYUmFHcjdHd3JZdkFEdmoyMkxqc3FQRmp6SVN3dndqUUN0aGZBZVNOcnVW?=
 =?utf-8?B?Wm8vc2VMNGhkMEN6ckVJWnI4eTVUQzhqZnJqQkVKbDU0ZVN2bU9VTHlwTDRr?=
 =?utf-8?B?UEZ5Tzc3VXE3MTRJbHcwQWNFV0lVMmV6ZXBvcHR3VmJGUmtDVGpQTWttZ1c5?=
 =?utf-8?B?VWE2cFRnM1JBN1FMOG9YeXN4V2tabjhvbCtkS2tVRER1Ym1tOVpURjYrNUph?=
 =?utf-8?B?cDBkTVZITHRZUUdlREppVFp5d2tsNUd5cWtwdUtHUDQvb2wyR2h2WUtnSzgz?=
 =?utf-8?B?ZXhRN0VRb2IxSHZnTEhack05QkZSVzhxRmwyRVZ6WVAxcXRhU2lKUnlpbGFP?=
 =?utf-8?B?TmZRaE5DVUM0TmRFOUFnakhTTTRqR3lReDJFV1hqNU83VEk5bjc5Uld4WVFV?=
 =?utf-8?B?c3RKYm0yZy9aUHh6YXExeGsvK3Q1OWNnVDZqSS9lSEFKVzV0UEo0YTNMSDJU?=
 =?utf-8?B?SHF1VjMvQnNQZkxuL2ZTRjV1K01jU3V6RSs0N2VBZVYwRjZLbllzc0UrMHBz?=
 =?utf-8?B?aUlrcjdTbUVWR01iSStGQVN4UEJBUXNQSG0vM3pXaVB5YnBJUVM4R2VXN1lW?=
 =?utf-8?B?emNvSnFtdlU4VUNwWlExOFlLNWlNQVV5MkZBQzYwLzNFdXBNazIvVGE2Uy9m?=
 =?utf-8?B?QjBtZEQ2ZEY4OVQzVFZNZS9tY1ltdDBwRjFFOE9sb0kxZThyeldyamZjK1cx?=
 =?utf-8?B?NW85d3g2RFZUaEpvTWllS0g5QVdrWlN5ZEFxY1QrVWs0ODZzTlYyYVY0eGFu?=
 =?utf-8?B?Tm50d2N3VmdqVzFwRUppSTBENWpJWUNJR25OTEJ0MHR6SFpKTHlzdTVuM1Fn?=
 =?utf-8?B?S0JtbzQ4LzNkZExuTTY0c3UxZ2pXMVE2NWZGWWRmODlZTER6OTVpVHJOSmt4?=
 =?utf-8?B?NVV3OGh0ZjZjcUh0eFp2VE42ZVhhYjZyR3VrYi9kVGZhWEhKOGlYdDN1dis4?=
 =?utf-8?B?REhEdzR3bStXUnIvRVIzYlhhY09CZXIvRlRlRmxDdUE1elhRTkFVdlpOK3RK?=
 =?utf-8?B?OW9VdlVlSkJlbFZ0R2lZUkVkSVlzS21pNFFndlQ5cXJzVDZuOHBsTXN4UEJo?=
 =?utf-8?B?NFloSFE5c0cwazFqVzNjSnRRQVdPVkh4dDBndmpwMytVZU5YTXNtckhXSFdk?=
 =?utf-8?B?enk4d2N0SHdDcUZDRmt1bW45QlFwTmNuN1VtQlBZakpMR3hiMXJGQVNoVjZs?=
 =?utf-8?B?N3hMZU5SUmRIWTBFZHZFWUExZVRaNEVUd0wrcitRZ0t6aG9xbGhwVC9NTDdG?=
 =?utf-8?B?QUtRNHhSZ0dZdzRxdFE1cmdkSjQ2VHNxWFlCa3VqMUsrem9MVHczOHVQT3Qv?=
 =?utf-8?B?VmlVNS9ZSm1vWlVCSnloYWtwNG5FS3FYNWd4eVV5UGNJeW4rbzZoajgzZTlj?=
 =?utf-8?Q?5Sr0j/92cFQL2SpP6WTMsiVlREgKhochGZyOyMv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f67126-ff3a-493c-d330-08d90a676a59
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 17:02:33.3081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7/dtPzsKtBuER76hLy58hTwybAQdi6aNA53cwBfEgSG1IhFokv/gUWKFs28kx4xcYfZ+of0flVX7MG5z7Of6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4438
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0yOCB1bSAxMjo1OCBwLm0uIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiBB
bSAyOC4wNC4yMSB1bSAxODo0OSBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+PiBBbSAyMDIxLTA0
LTI4IHVtIDEyOjMzIHAubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4gQW0gMjguMDQu
MjEgdW0gMTc6MTkgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPj4+IFtTTklQXQo+Pj4+Pj4gRmFp
bGluZyB0aGF0LCBJJ2QgcHJvYmFibHkgaGF2ZSB0byBhYmFuZG9uIHVzZXJwdHIgQk9zIGFsdG9n
ZXRoZXIKPj4+Pj4+IGFuZAo+Pj4+Pj4gc3dpdGNoIHN5c3RlbSBtZW1vcnkgbWFwcGluZ3Mgb3Zl
ciB0byB1c2luZyB0aGUgbmV3IFNWTSBBUEkgb24KPj4+Pj4+IHN5c3RlbXMKPj4+Pj4+IHdoZXJl
IGl0IGlzIGF2YWxpYWJsZS4KPj4+Pj4gV2VsbCBhcyBsb25nIGFzIHRoYXQgcHJvdmlkZXMgdGhl
IG5lY2Vzc2FyeSBmdW5jdGlvbmFsaXR5IHRocm91Z2ggSE1NCj4+Pj4+IGl0IHdvdWxkIGJlIGFu
IG9wdGlvbi4KPj4+PiBKdXN0IGFub3RoZXIgd2F5IG9mIGNpcmN1bXZlbnRpbmcgIkl0IHNob3Vs
ZCBsaW1pdCB0aGUgYW1vdW50IG9mCj4+Pj4gc3lzdGVtCj4+Pj4gbWVtb3J5IHRoZSBHUFUgY2Fu
IGFjY2VzcyBhdCB0aGUgc2FtZSB0aW1lLCIgYSBwcmVtaXNlIEkgZGlzYWdyZWUgd2l0aAo+Pj4+
IGluIGNhc2Ugb2YgdXNlcnB0cnMgYW5kIEhNTS4gQm90aCB1c2UgcGFnZWFibGUsIHVucGlubmVk
IG1lbW9yeS4KPj4+PiBCb3RoIGNhbiBjYXVzZSB0aGUgR1BVIHRvIGJlIHByZWVtcHRlZCBpbiBj
YXNlIG9mIE1NVSBpbnRlcnZhbAo+Pj4+IG5vdGlmaWVycy4KPj4+IFdlbGwgdGhhdCdzIHRoZSBr
ZXkgcG9pbnQuIEdGWCB1c2VycHRycyBhbmQgRE1BLWJ1ZiBpbXBvcnRzIGNhbid0IGJlCj4+PiBw
cmVlbXB0ZWQuCj4+IEJ1dCB0aGV5IGRvbid0IG5lZWQgdG8gYmUuIFRoZXkgZG9uJ3QgdXNlIGFu
eSByZXNvdXJjZXMgb24gdGhlIGltcG9ydGluZwo+PiBHUFUgb3Igc3lzdGVtIG1lbW9yeSwgc28g
d2h5IGRvIHdlIGxpbWl0IHRoZW0/Cj4KPiBZZWFoLCBidXQgYXQgbGVhc3QgdXNlciBwb2ludGVy
IGVmZmVjdGl2ZWx5IHBpbiB0aGVpciBiYWNraW5nIHN0b3JlIGFzCj4gbG9uZyBhcyB0aGUgR1BV
IG9wZXJhdGlvbiBpcyBydW5uaW5nLgo+Cj4+IFdpdGggZHluYW1pYyBhdHRhY2htZW50LCB0aGUg
ZXhwb3J0ZWQgQk9zIGNhbiBiZSBldmljdGVkIGFuZCB0aGF0Cj4+IGFmZmVjdHMgdGhlIGltcG9y
dHMgYXMgd2VsbC4gSSBkb24ndCBzZWUgd2h5IHRoZSBpbXBvcnQgbmVlZHMgdG8gYmUKPj4gZXZp
Y3RlZCBhcyBpZiB0aGVyZSB3YXMgc29tZSByZXNvdXJjZSBsaW1pdGF0aW9uIG9uIHRoZSBpbXBv
cnRpbmcgR1BVLgo+Cj4gSXQgcHJldmVudHMgdGhhdCBtdWx0aXBsZSBETUEtYnVmIGltcG9ydHMg
YXJlIGFjdGl2ZSBhdCB0aGUgc2FtZSB0aW1lLgo+Cj4gU2VlIHRoZSBmb2xsb3dpbmcgZXhhbXBs
ZTogR1RUIHNwYWNlIGlzIDFHaUIgYW5kIHdlIGhhdmUgdHdvIERNQS1idWYKPiBpbXBvcnRzIG9m
IDYwME1pQiBlYWNoLgo+Cj4gV2hlbiB1c2Vyc3BhY2Ugd2FudHMgdG8gc3VibWl0IHdvcmsgdXNp
bmcgYm90aCBhdCB0aGUgc2FtZSB0aW1lIHdlCj4gcmV0dXJuIC1FTk9TUEMgKG9yIC1FTk9NRU0s
IG5vdCAxMDAlIHN1cmUpLgo+Cj4gV2hlbiBvbmUgaXMgaW4gdXNlIGFuZCBhIHN1Ym1pc3Npb24g
bWFkZSB3aXRoIHRoZSBvdGhlciB3ZSBibG9jayB1bnRpbAo+IHRoYXQgc3VibWlzc2lvbiBpcyBj
b21wbGV0ZWQuCj4KPiBUaGlzIHdheSB0aGVyZSBpcyBuZXZlciBtb3JlIHRoYW4gMSBHaUIgb2Yg
bWVtb3J5IGluIHVzZSBvciAicGlubmVkIgo+IGJ5IHRoZSBHUFUgdXNpbmcgaXQuCgpJcyB0aGlz
IHJlYXNvbmFibGUgZm9yIGltcG9ydHMgb2YgVlJBTSBpbiBhIG11bHRpIEdQVSBzeXN0ZW0/IEUu
Zy4geW91CmFsbG9jYXRlIDYwMCBNQiBvbiBHUFUgQSBhbmQgNjAwIE1CIG9uIEdQVSBCLiBZb3Ug
ZXhwb3J0IGJvdGggYW5kIGltcG9ydAp0aGVtIG9uIHRoZSBvdGhlciBHUFUgYmVjYXVzZSB5b3Ug
d2FudCBib3RoIEdQVXMgdG8gYWNjZXNzIGVhY2ggb3RoZXIncwptZW1vcnkuIFRoaXMgaXMgYSBj
b21tb24gdXNlIGNhc2UgZm9yIEtGRCwgYW5kIHNvbWV0aGluZyB3ZSB3YW50IHRvCmltcGxlbWVu
dCBmb3IgdXBzdHJlYW1hYmxlIFBDSWUgUDJQIHN1cHBvcnQuCgpXaXRoIHlvdXIgbGltaXRhdGlv
biwgSSB3aWxsIGxldmVyIGJlIGFibGUgdG8gdmFsaWRhdGUgYm90aCBCT3MgYW5kIHJ1bgpLRkQg
dXNlciBtb2RlIHF1ZXVlcyBpbiB0aGUgYWJvdmUgc2NlbmFyaW8uCgpSZWdhcmRzLArCoCBGZWxp
eAoKCj4KPj4+IFNvIHRoZXkgYmFzaWNhbGx5IGxvY2sgdGhlIGJhY2tpbmcgbWVtb3J5IHVudGls
IHRoZSBsYXN0IHN1Ym1pc3Npb24gaXMKPj4+IGNvbXBsZXRlZCBhbmQgdGhhdCBpcyBjYXVzaW5n
IHByb2JsZW1zIGlmIGl0IGhhcHBlbnMgZm9yIHRvIG11Y2gKPj4+IG1lbW9yeSBhdCB0aGUgc2Ft
ZSB0aW1lLgo+Pj4KPj4+IFdoYXQgd2UgY291bGQgZG8gaXMgdG8gZmlndXJlIG91dCBpbiB0aGUg
dmFsdWFibGUgY2FsbGJhY2sgaWYgdGhlIEJPCj4+PiBpcyBwcmVlbXB0LWFibGUgb3Igbm90Lgo+
PiBUaGVuIHdlIHNob3VsZCBhbHNvIG5vdCBjb3VudCB0aGVtIGluIG1nci0+YXZhaWxhYmxlLiBP
dGhlcndpc2Ugbm90Cj4+IGV2aWN0aW5nIHRoZXNlIEJPcyBjYW4gYmxvY2sgb3RoZXIgR1RUIGFs
bG9jYXRpb25zLiBBZ2FpbiwgbWF5YmUgaXQncwo+PiBlYXNpZXIgdG8gdXNlIGEgZGlmZmVyZW50
IGRvbWFpbiBmb3IgcHJlZW1wdGlibGUgQk9zLgo+Cj4gR29vZCBwb2ludC4gVGhhdCB3b3VsZCBh
bHNvIGJlIHZhbHVhYmxlIHdoZW4gd2UgZ2V0IHVzZXIgcXVldWVzIGF0Cj4gc29tZSBwb2ludC4K
Pgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+Cj4+Cj4+IFJlZ2FyZHMsCj4+IMKgwqAgRmVsaXgK
Pj4KPj4KPj4+IFJlZ2FyZHMsCj4+PiBDaHJpc3RpYW4uCj4+Pgo+Pj4+IFN0YXRpY2FsbHkgbGlt
aXRpbmcgdGhlIGFtb3VudCBvZiBwYWdlYWJsZSBtZW1vcnkgYWNjZXNzaWJsZSB0byBHVFQgaXMK
Pj4+PiByZWR1bmRhbnQgYW5kIG92ZXJseSBsaW1pdGluZy4KPj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+
Pj4gwqDCoMKgIEZlbGl4Cj4+Pj4KPj4+Pgo+Pj4+PiBSZWdhcmRzLAo+Pj4+PiBDaHJpc3RpYW4u
Cj4+Pj4+Cj4+Pj4+PiBSZWdhcmRzLAo+Pj4+Pj4gwqDCoMKgwqAgRmVsaXgKPj4+Pj4+Cj4+Pj4+
Pgo+Pj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBGZWxp
eCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+
IMKgwqDCoMKgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCA0ICsrKysKPj4+Pj4+Pj4g
wqDCoMKgwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4+Pgo+Pj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+Pj4+PiBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+Pj4+Pj4gaW5kZXggZGUxZWM4MzhjZjhiLi4w
Yjk1MzY1NGZkYmYgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMKPj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+Pj4+
PiBAQCAtNjU1LDYgKzY1NSwxMCBAQCBpbnQgdHRtX21lbV9ldmljdF9maXJzdChzdHJ1Y3QgdHRt
X2RldmljZQo+Pj4+Pj4+PiAqYmRldiwKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGxpc3RfZm9yX2VhY2hfZW50cnkoYm8sICZtYW4tPmxydVtpXSwgbHJ1KSB7Cj4+Pj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgYnVzeTsKPj4+Pj4+Pj4gwqDCoMKg
wqAgK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogRG9uJ3QgZXZpY3QgU0cgQk9zICovCj4+Pj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChiby0+dHRtICYmIGJvLT50dG0tPnNnKQo+
Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4+Pj4+
PiArCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghdHRtX2Jv
X2V2aWN0X3N3YXBvdXRfYWxsb3dhYmxlKGJvLCBjdHgsCj4+Pj4+Pj4+ICZsb2NrZWQsCj4+Pj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAmYnVzeSkpIHsKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoYnVzeSAmJiAhYnVzeV9ibyAmJiB0aWNrZXQgIT0K
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
