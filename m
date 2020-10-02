Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BD6280D93
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 08:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 152106E0D6;
	Fri,  2 Oct 2020 06:41:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760059.outbound.protection.outlook.com [40.107.76.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A865D6E037;
 Fri,  2 Oct 2020 06:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CxgG9ABAyVaH0BorybXBcqWiQW4WKBHs+z/GnP9kLLMUhvStzDBhoReKwuKdyYj4hd9pS3hQt0n08IuJ7+uVEbBEGwSqfJEEJgIWfmJDu55aFt44Ml41i3ZExcP02EJKqNo1IuJ70oMcKuBqeMwIfPOq1/pDYRxxfXwSkGZwk2OVaPrdSgrIF3xd5fMQvJPkb0eGksfKORxFuEfSNfRW2p4CXMNJPiuyjZ5fEZDAFLNiDOWJryu2sT6YTGOOe5O0fBWtR5PhyGKMkwwsH2ezcf1VVgz472GusU6yViCk+voPqMRszv2FMNJw3UHozAC34z70oGKIVRg1uFbIW+26VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMIUvTNbAA85kJyF8p7k66fVrQGDnd2MDAB/zeyblAQ=;
 b=PFMYEL8rHEQxwJp/7bUOYa01g3A1jtekKE7bxH4ESmoUWvI4ygYBDBrPu6FClFkgYW7mv8Dp4AfCkXITERMyV0Ak7pl8/uMLto+dTwM26UtiyI4xHezppw+1drQhIDbAJ9k9KMfMKy4MYeuFHs98PtKrIQsOYnAfUGidAsrlgT5eUkbBzPMwe7YbduJBQBvggd/oRjAjohPTVut5TBmeblzh9reJrn1TFNoQfn8EQ0JUEpDx5FeDs5wdw2GDJh9eDugHrYCBzPDkctBdIXtrMZ49AoP6naAfUZn4tgxpmqxmvbzts+z/brDGxRXAJF+WfgPbj8/CP+sNszW4g3oQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMIUvTNbAA85kJyF8p7k66fVrQGDnd2MDAB/zeyblAQ=;
 b=dYcz01kKVEYDKJN6pnIUi56WbgTyKMBQDHfbXxMiSSWZ8lDV/8mrvv1oPGTlmWcEUJ2dTucGX+0LMRcars2rAqlj9nH19/eBF1tivMYpBd8eIFxY3QMLTGRHlrg7jLUxRuQ4WuNKP36WmN7fiDl/mkYsEPMR6QhJHFHFji8Xa/I=
Authentication-Results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4815.namprd12.prod.outlook.com (2603:10b6:208:1bf::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 06:41:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3433.032; Fri, 2 Oct 2020
 06:41:22 +0000
Subject: Re: [PATCH RFC 0/1] drm/ttm: Allocate transparent huge pages without
 clearing __GFP_COMP
To: Alex Goins <agoins@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20200930221821.13719-1-agoins@nvidia.com>
 <4566cf03-1c9e-1626-6c92-7b5fa29d6b75@amd.com>
 <alpine.DEB.2.20.2010011344360.18933@agoins-DiGiTS>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c50d91e4-3116-00fd-1b90-4091e2eb2db3@amd.com>
Date: Fri, 2 Oct 2020 08:41:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <alpine.DEB.2.20.2010011344360.18933@agoins-DiGiTS>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR05CA0094.eurprd05.prod.outlook.com
 (2603:10a6:207:1::20) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR05CA0094.eurprd05.prod.outlook.com (2603:10a6:207:1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3412.22 via Frontend Transport; Fri, 2 Oct 2020 06:41:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d17e1cb2-84b1-4487-e09e-08d8669e2cde
X-MS-TrafficTypeDiagnostic: MN2PR12MB4815:
X-Microsoft-Antispam-PRVS: <MN2PR12MB48154470CE05089B4D3E2C1883310@MN2PR12MB4815.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Of2TGoXawIQ2jhPCIK/01X99G0D9OIrAxsMwCjNZRIQcdZchGBBFmRBIuhnciia5Psp2rwsrBRoNr/NhICR1j3CZ2pj2D77Pdb9cTlnDRq7baqzbB3R/W+m0YYmCBoyFlE2AOWNjrM8i48XgEQ0sBairEiu724tW5H5Ie0aBDioztTV6D5p/5zvqzVm2Sl18GQQz3w3oKViIT1KyS61ukRWfuRfCmcGY9Lm+Q0MkE67FtGJPr2GMUXlAdiIsG917xqVrwzJ5n5u8Kn5IM/ajewuCjmOIKonoKtJSd3B8dOX8sCB5v1zAMcHn0J78+eeMbvdHv8DnmMO6NZglbzaIa9mcPvQxhMhuXY9bGrJdYimS+yuC1yaYU/to4HU8KQmRAG90BM3VOJspUjLFo24FeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(376002)(366004)(346002)(6486002)(66574015)(83380400001)(186003)(16526019)(478600001)(8936002)(36756003)(86362001)(31696002)(316002)(2616005)(8676002)(31686004)(110136005)(54906003)(52116002)(4326008)(2906002)(5660300002)(6666004)(66476007)(66946007)(66556008)(14583001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: lLAKk3XMv4/EumvcrWIFE89nR+eNOdZi73Q3cEVBUeX1v308ClMDcTAhad8R5gOsSfRoeLngs+D1qcId2yLUI7w7S+c8LhFXjkAHPoxnsrW59Zrt20VqfucYCKlQlYyEDU6m43qO48t3OQ+DwD6x8lBW0ToQ5AhS0b22jhsKo0bSykN0J7Pc/lLCMJ+TLe9DmDulyGIpthCtrM0ZpFVmg8L97IevxCjL1yktKrk70DHZTh5j7uThvK6aHnS1pH95pjtg5Xwtxz0kZSDYeUkqi26O1GywXUdrnBTe/cTNagL43aaaCu77hV/NeGzG2UlPBcaUdQpubEuI3X30GDS3ahvVL+M6gxOwztkE6ryST2K2YG6Z94YRtS+uTBAaKgb+bZddw3VBQNJQDi+w7PyJ/7nsQaVdkpuVIy0OmNHqCAyMYF2k45DY6QmcbpDINqM7DiX5YWqYia/b6oECQMFPXncBm4qukXL9PZxk2UcS9ug9j9igsgyBMpQ5ZhAnOAc+w39TmCHirQ3CDZ2PiOpL36AyrFICTZ1mTT4Nw/E/IZm8Y68wqsUGyGFDujJzGp3ARtQ8uebfaal2dulsSSjGDS0kPLoF1CPU2lDv6Ww7MeUM/LE45Mg3yoBfdAmt2EAdFw5eeyuPSHsdAKSJSxrpV83iuN2VocnOJ7slmevgnBEhXdrTtmkevF6DgnCj26xj6iCrOKdKLppOksbinsqRvA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17e1cb2-84b1-4487-e09e-08d8669e2cde
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 06:41:21.9313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fdDEPUHqOtZKnwKR4DNDhhcfkiZMh1pQpVQfi8UKYDrsvhPo0iJitFn2HYg+62J5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4815
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
Cc: linux-mm@kvack.org, Zi Yan <ziy@nvidia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 John Hubbard <jhubbard@nvidia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleCwKCmFkZGluZyBEYW5pZWwgYXMgd2VsbC4KCkFtIDAxLjEwLjIwIHVtIDIwOjQ1IHNj
aHJpZWIgQWxleCBHb2luczoKPiBIaSBDaHJpc3RpYW4sCj4KPiBPbiBUaHUsIDEgT2N0IDIwMjAs
IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4KPj4gSGkgQWxleCwKPj4KPj4gZmlyc3Qgb2YgYWxs
IGFjY2Vzc2luZyB0aGUgdW5kZXJseWluZyBwYWdlIG9mIGFuIGV4cG9ydGVkIERNQS1idWYgaXMK
Pj4gaWxsZWdhbCEgU28gSSdtIG5vdCAxMDAlIHN1cmUgd2hhdCB5b3UncmUgaW50ZW50aW9ucyBh
cmUgaGVyZSwgcGxlYXNlCj4+IGV4cGxhaW4gZnVydGhlci4KPiBXZSBoYXZlIHNvbWUgbWFwcGlu
ZyByZXF1aXJlbWVudHMgdGhhdCBJIHdhcyBob3BpbmcgSSBjb3VsZCBhZGRyZXNzIGJ5IG1hcHBp
bmcKPiB0aGVzZSBwYWdlcyBtYW51YWxseS4KPgo+IEFyZSB5b3Ugc3VyZSB0aGF0IGl0J3MgaWxs
ZWdhbCB0byBhY2Nlc3MgdGhlIHVuZGVybHlpbmcgcGFnZXMgb2YgYW4gZXhwb3J0ZWQKPiBETUEt
QlVGPwoKeWVzLCBJJ20gMTAwJSBzdXJlIG9mIHRoYXQuIFRoaXMgd2FzIGRpc2N1c3NlZCBtdWx0
aXBsZSB0aW1lcyBub3cgb24gdGhlIAptYWlsaW5nIGxpc3QuCgo+IFRoZXJlIGFwcGVhcnMgdG8g
YmUgcXVpdGUgYSBmZXcgdXNhZ2VzIG9mIHRoaXMgYWxyZWFkeS4gU2VlIHRoZSB1c2FnZQo+IG9m
IGRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKCkgaW4gdmdlbSwgdmttcywgbXNtLCB4
ZW4sIGFuZCBldG5hdml2Lgo+IGRybV9nZW1fcHJpbWVfaW1wb3J0X2RldigpIHVzZXMgZHJpdmVy
LT5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKCkgd2hlbgo+IGltcG9ydGluZyBhIERNQS1CVUYg
ZnJvbSBhbm90aGVyIGRyaXZlciwgYW5kIHRoZSBsaXN0ZWQgZHJpdmVycyB0aGVuIGV4dHJhY3Qg
dGhlCj4gcGFnZXMgZnJvbSB0aGUgZ2l2ZW4gU0dUIHVzaW5nIGRybV9wcmltZV9zZ190b19wYWdl
X2FkZHJfYXJyYXlzKCkuIFRoZXNlIHBhZ2VzCj4gY2FuIHRoZW4gYmUgbWFwcGVkIGFuZCBmYXVs
dGVkIGluLgoKTm8sIGV4YWN0bHkgdGhhdCBkb2Vzbid0IHdvcmsgY29ycmVjdGx5LgoKWW91IGFy
ZSBjb3JydXB0aW5nIGludGVybmFsIHN0YXRlIGluIHN0cnVjdCBwYWdlIHdoaWxlIGRvaW5nIHNv
IGFuZCByaXNrIAp0aGF0IHVzZXJzcGFjZSBpcyBhY2Nlc3NpbmcgZnJlZWQgdXAgbWVtb3J5LgoK
V2UgcmVhbGx5IG5lZWQgdG8gZmluZCBhIHdheSB0byBmaXggdGhlIGZldyBkcml2ZXJzIGFscmVh
ZHkgZG9pbmcgdGhpcy4KCj4gU2VlIGNvbW1pdCBhZjMzYTkxOTBkMDIgKCdkcm0vdmdlbTogRW5h
YmxlIGRtYWJ1ZiBpbXBvcnQgaW50ZXJmYWNlcycpLiBBZnRlcgo+IGltcG9ydGluZyB0aGUgcGFn
ZXMgZnJvbSB0aGUgU0dULCB2Z2VtIGNhbiBmYXVsdCB0aGVtIGluLCB0YWtpbmcgYSByZWZjb3Vu
dCB3aXRoCj4gZ2V0X3BhZ2UoKSBmaXJzdC4gZ2V0X3BhZ2UoKSB0aHJvd3MgYSBCVUcgaWYgdGhl
IHJlZmNvdW50IGlzIHplcm8sIHdoaWNoIGl0IHdpbGwKPiBoaXQgb24gZWFjaCBvZiB0aGUgJ3Rh
aWwnIHBhZ2VzIGZyb20gVFRNIFRIUCBhbGxvY2F0aW9ucy4KPgo+IEFsbCBvZiB0aGlzIGN1cnJl
bnRseSB3b3JrcyBmaW5lIHdpdGggVFRNIERNQS1CVUZzIHdoZW4gdGhlIGtlcm5lbCBpcyBidWls
dCB3aXRoCj4gIUNPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRS4gSG93ZXZlciwgJ2VjaG8gbmV2
ZXIgPgo+IC9zeXMva2VybmVsL21tL3RyYW5zcGFyZW50X2h1Z2VwYWdlL2VuYWJsZWQnIGRvZXNu
J3QgY2hhbmdlIGhvdyBUVE0gYWxsb2NhdGVzCj4gcGFnZXMuCgpZb3UgbmVlZCB0byByZWRpcmVj
dCB0aGUgbWFwcGluZyB0byBkbWFfYnVmX21tYXAoKSBpbnN0ZWFkLgoKUmVnYXJkcywKQ2hyaXN0
aWFuLgoKPgo+PiBUaGVuIHRoZSByZWFzb24gZm9yIFRUTSBub3QgdXNpbmcgY29tcG91bmQgcGFn
ZXMgaXMgdGhhdCB3ZSBjYW4ndAo+PiBndWFyYW50ZWUgdGhhdCB0aGV5IGFyZSBtYXBwZWQgYXMg
YSB3aG9sZSB0byB1c2Vyc3BhY2UuCj4+Cj4+IFRoZSByZXN1bHQgaXMgdGhhdCB0aGUga2VybmVs
IHNvbWV0aW1lcyB0cmllZCB0byBkZS1jb21wb3VuZCB0aGVtIHdoaWNoCj4+IGNyZWF0ZWQgYSBi
dW5jaCBvZiBwcm9ibGVtcy4KPj4KPj4gU28geWVzIHRoaXMgaXMgY29tcGxldGVseSBpbnRlbnRp
b25hbC4KPiBVbmRlcnN0b29kLCBJIGZpZ3VyZWQgc29tZXRoaW5nIGxpa2UgdGhhdCB3YXMgdGhl
IGNhc2UsIHNvIEkgd2FudGVkIHRvIGdldCB5b3VyCj4gaW5wdXQgZmlyc3QuIERvIHlvdSBrbm93
IHdoYXQgdGhlIHByb2JsZW1zIHdlcmUsIGV4YWN0bHk/IFByYWN0aWNhbCBpc3N1ZXMKPiBhc2lk
ZSwgaXQgc2VlbXMgc3RyYW5nZSB0byBjYWxsIHNvbWV0aGluZyBhIHRyYW5zcGFyZW50IGh1Z2Ug
cGFnZSBpZiBpdCdzCj4gbm9uLWNvbXBvdW5kLgo+Cj4gQmVzaWRlcyBtYWtpbmcgdGhlc2UgcGFn
ZXMgY29tcG91bmQsIHdvdWxkIGl0IGJlIHJlYXNvbmFibGUgdG8gc3BsaXQgdGhlbSBiZWZvcmUK
PiBzaGFyaW5nIHRoZW0sIGluIGUuZy4gYW1kZ3B1X2RtYV9idWZfbWFwIChhbmQgaW4gb3RoZXIg
ZHJpdmVycyB0aGF0IHVzZSBUVE0pPwo+IFRoYXQncyB3aGVyZSBpdCdzIHN1cHBvc2VkIHRvIG1h
a2Ugc3VyZSB0aGF0IHRoZSBzaGFyZWQgRE1BLUJVRiBpcyBhY2Nlc3NpYmxlIGJ5Cj4gdGhlIHRh
cmdldCBkZXZpY2UuCj4KPiBUaGFua3MsCj4gQWxleAo+Cj4+IFJlZ2FyZHMsCj4+IENocmlzdGlh
bi4KPj4KPj4gQW0gMDEuMTAuMjAgdW0gMDA6MTggc2NocmllYiBBbGV4IEdvaW5zOgo+Pj4gSGkg
Q2hyaXN0aWFuLAo+Pj4KPj4+IEkndmUgYmVlbiBsb29raW5nIGludG8gdGhlIERNQS1CVUZzIGV4
cG9ydGVkIGZyb20gQU1ER1BVIC8gVFRNLiBXb3VsZAo+Pj4geW91IG1pbmQgZ2l2aW5nIHNvbWUg
aW5wdXQgb24gdGhpcz8KPj4+Cj4+PiBJIG5vdGljZWQgdGhhdCB5b3VyIGNoYW5nZXMgaW1wbGVt
ZW50aW5nIHRyYW5zcGFyZW50IGh1Z2UgcGFnZSBzdXBwb3J0Cj4+PiBpbiBUVE0gYXJlIGFsbG9j
YXRpbmcgdGhlbSBhcyBub24tY29tcG91bmQuIEkgdW5kZXJzdGFuZCB0aGF0IHVzaW5nCj4+PiBt
dWx0aW9yZGVyIG5vbi1jb21wb3VuZCBwYWdlcyBpcyBjb21tb24gaW4gZGV2aWNlIGRyaXZlcnMs
IGJ1dCBJIHRoaW5rCj4+PiB0aGlzIGNhbiBjYXVzZSBhIHByb2JsZW0gd2hlbiB0aGVzZSBwYWdl
cyBhcmUgZXhwb3J0ZWQgdG8gb3RoZXIgZHJpdmVycy4KPj4+Cj4+PiBJdCdzIHBvc3NpYmxlIGZv
ciBvdGhlciBkcml2ZXJzIHRvIGFjY2VzcyB0aGUgRE1BLUJVRidzIHBhZ2VzIHZpYQo+Pj4gZ2Vt
X3ByaW1lX2ltcG9ydF9zZ190YWJsZSgpLCBidXQgd2l0aG91dCBjb250ZXh0IGZyb20gVFRNLCBp
dCdzCj4+PiBpbXBvc3NpYmxlIGZvciB0aGUgaW1wb3J0aW5nIGRyaXZlciB0byBtYWtlIHNlbnNl
IG9mIHRoZW07IHRoZXkgc2ltcGx5Cj4+PiBhcHBlYXIgYXMgaW5kaXZpZHVhbCBwYWdlcywgd2l0
aCBvbmx5IHRoZSBmaXJzdCBwYWdlIGhhdmluZyBhIG5vbi16ZXJvCj4+PiByZWZjb3VudC4gTWFr
aW5nIFRUTSdzIFRIUCBhbGxvY2F0aW9ucyBjb21wb3VuZCBwdXRzIHRoZW0gbW9yZSBpbiBsaW5l
Cj4+PiB3aXRoIHRoZSBzdGFuZGFyZCBkZWZpbml0aW9uIG9mIGEgVEhQLCBhbmQgYWxsb3dzIERN
QS1CVUYtaW1wb3J0aW5nCj4+PiBkcml2ZXJzIHRvIG1ha2Ugc2Vuc2Ugb2YgdGhlIHBhZ2VzIHdp
dGhpbi4KPj4+Cj4+PiBJIHdvdWxkIGxpa2UgdG8gcHJvcG9zZSBtYWtpbmcgdGhlc2UgYWxsb2Nh
dGlvbnMgY29tcG91bmQsIGJ1dCBiYXNlZCBvbgo+Pj4gcGF0Y2ggaGlzdG9yeSwgaXQgbG9va3Mg
bGlrZSB0aGUgZGVjaXNpb24gdG8gbWFrZSB0aGVtIG5vbi1jb21wb3VuZCB3YXMKPj4+IGludGVu
dGlvbmFsLCBhcyB0aGVyZSB3ZXJlIGRpZmZpY3VsdGllcyBmaWd1cmluZyBvdXQgaG93IHRvIG1h
cCB0aGVtCj4+PiBpbnRvIENQVSBwYWdlIHRhYmxlcy4gSSBkaWQgc29tZSBjdXJzb3J5IHRlc3Rp
bmcgd2l0aCBjb21wb3VuZCBUSFBzLCBhbmQKPj4+IG5vdGhpbmcgc2VlbXMgb2J2aW91c2x5IGJy
b2tlbi4gSSB3YXMgYWxzbyBhYmxlIHRvIG1hcCBjb21wb3VuZCBUSFAKPj4+IERNQS1CVUZzIGlu
dG8gdXNlcnNwYWNlIHdpdGhvdXQgaXNzdWUsIGFuZCBhY2Nlc3MgdGhlaXIgY29udGVudHMuIEFy
ZQo+Pj4geW91IGF3YXJlIG9mIGFueSBvdGhlciBwb3RlbnRpYWwgY29uc2VxdWVuY2VzPwo+Pj4K
Pj4+IENvbW1pdCA1YzQyYzY0ZjdkNTQgKCJkcm0vdHRtOiBmaXggdGhlIGZpeCBmb3IgaHVnZSBj
b21wb3VuZCBwYWdlcyIpIHNob3VsZAo+Pj4gcHJvYmFibHkgYWxzbyBiZSByZXZlcnRlZCBpZiB0
aGlzIGlzIGFwcGxpZWQuCj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gQWxleAo+Pj4KPj4+IEFsZXggR29p
bnMgKDEpOgo+Pj4gICAgIGRybS10dG06IEFsbG9jYXRlIGNvbXBvdW5kIHRyYW5zcGFyZW50IGh1
Z2UgcGFnZXMKPj4+Cj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmMg
fCA1ICsrLS0tCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+Pj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
