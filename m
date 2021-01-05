Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74512EB494
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 22:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228BE6E086;
	Tue,  5 Jan 2021 21:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689E36E081;
 Tue,  5 Jan 2021 21:04:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cNvkPjAnf3AiJNwO4vy/5aH5XmHisMHArJ1epRbudcsTlpE2sp9PHuLoBgBwlxPbMsxbZxLxZhamfDcazAFT4qugXUyqodWOegR1salb8RXnXun8GP0RGe6RBZBHmxy+v2C3Ibymce+kXEjRf5Z1DT0+NQpfe5i3dg2Tp0l4D8Z79cFhz/AlX0fMdNVIrf5h5/rdyWoiWFI6wxxJybRd+SBbOiD6sRQ2nX0x33HApNEfarofPVCm7gR0nvC8QOUaJDQUsXuJ11ZvZL77FqCOcX2d0KbxCL6LSS3Psbnz25tuos8LulQOj5B948fZAgqdd153flkXqqh2S4OMxze5qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO8a3ZHIaJyZcKTsVOXRrV1JB+ELwGEaOmsNnZ5SOJE=;
 b=K4x9M4d/89jtZpQczxpgPliRLW7rj8h2Yj1VzUsM9RALfIoeoDnt9Flds4vW7u8rYYtpVAbZ/NdrjLob8XJgzu6XuqPPtPL8M+lp1LX3FrDH7kDxZNjLbmVLA4U0I/2x4wnUC0ZMmqZ/0hWF9miIDg1yUREnwe8sbDvL0MTwhiT+3K9RAD4PBHQEmdhLyLATO+lgRXIANaITD4P3F+IJ4p/GOtMgY9jYjDEDyDz0Lt5su/sxRGEzzp6kE+H9OXK0/dMQ/6eS+oLYtuyZ8uvQhuR+8Mw0EdrYINzt74hndA8mCibDvd7BFKYZXK7IFkP6EHfbWUj4k6bKRmfQrasLhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YO8a3ZHIaJyZcKTsVOXRrV1JB+ELwGEaOmsNnZ5SOJE=;
 b=EeFThGYe9NBlvYEaN16SE+PuwaJMdZ/6ylZ/jVhkNUSse4hxqbv3Z+cR6PPe0NjTXklTCdigCuW7QWEAiY15hXl6CSFOzkFuWNjvrbC8J6VEjIlrsUPvo4R3r4t6jvSfidAyYmFhB05bQfsmf7Ze4tpfgKBSxukqwB26b/BHMug=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2847.namprd12.prod.outlook.com (2603:10b6:805:76::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Tue, 5 Jan
 2021 21:04:19 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d%4]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 21:04:19 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
 <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
 <e6bbd5fa-29b7-c74a-ea70-3979b573901b@amd.com>
 <5a61f76a-0b40-941f-8028-37202f296e74@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <f374aaa4-4a30-e60c-cd4b-d463443c1137@amd.com>
Date: Tue, 5 Jan 2021 16:04:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <5a61f76a-0b40-941f-8028-37202f296e74@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0::799c]
X-ClientProxiedBy: YT1PR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::18) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0::799c] (2607:fea8:3edf:49b0::799c) by
 YT1PR01CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 5 Jan 2021 21:04:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2c52ba8a-93a5-402a-2261-08d8b1bd7805
X-MS-TrafficTypeDiagnostic: SN6PR12MB2847:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB28478753F946EBAFD2B877C7EAD10@SN6PR12MB2847.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8IScKFsjgR7Psk7vRexjb9+cbN3J4CX+oBjYSEp8RYhASs09JkTWMMtI7RHOkOnPZplJeLLWqAwbprnahOQJYbxpOs+XStBX549cbSL8sr5C4EGX4EOKDEw+ubJLErlog6PDDzU3ad3u/O1YNvfHSOhNHfmN71smUhk1GPQlqX6Wu7GMBXKbrNL5dcJ+lLUH/I11s7z6NriWboWEtM8xKwdQeRT94pPYCIuqv/WTDGR9gTNG/QJmzg9VtEf1B6mz97ASZ+kvxw5aA5RSYz+RDFBgqmNhmuxIkjZMCi8j8fJpCffo2WdlreGci/X5Rqo9OMaGNt4dQuZ7CwFwkzkGKK2v23VaQ5fV4dEY9u1QsyNmo75ZSQKMQ7wjPR3sCp/q6c7p4eDv0Xbqd6E+HyerdXNRQUa1nEnOKzu4EClatHNH2tHa9FV4bETKWqmKBjervsUYGxZNg9HSzNCwTZLeeU6MTz+QWZqJjuF3cR8SufhLnM0S8SZS0ZOPqL0tAmVpBRNfmnYc3noCKRpCETwcSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(52116002)(4326008)(2906002)(36756003)(478600001)(66476007)(31686004)(66556008)(66946007)(31696002)(966005)(5660300002)(316002)(16526019)(8936002)(53546011)(45080400002)(186003)(83380400001)(6486002)(8676002)(66574015)(86362001)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NGZFZms5VVRXVmd6MGllV2hRd2QwL0Z0Y0R1bjFYYXlraCtkUHNXaG5BREpz?=
 =?utf-8?B?Qms3UmR6ZGwrcHhNbGtKdld4S1JwakR4Y0kyR0xlang2MFBUaDFmNGh6cmhK?=
 =?utf-8?B?U0VIMWtQa0JGaHV2V1pVTGFKbktzdzd0eU16SXA5bzl5enF3bXhmTmo0VXB3?=
 =?utf-8?B?T1g0L1JkZ2R4eWdIRkplVVlOSEFUa3ZTekM5a2dvYTZlQVYrYUdaKzdFd3ZP?=
 =?utf-8?B?aTNqR2J2aFUva2ZQMXBsaXBlOW0wWCtsZnhJY2tUTlhXcXZxS2hHb2hLaXdy?=
 =?utf-8?B?Ni9rL2d4aG84WERZcnI4TzJScW9pb2hodGxCQU9jU1JjREpWNmlCVTEyZTFF?=
 =?utf-8?B?K0FaUDdvNk5Zam1rd2d6ZERUdGJ5UkV6ZTlRYkJvd3dqZ2c2OGRacEFnVVBy?=
 =?utf-8?B?UXc3VHowOTVMZDVhM2VQTkgzKzkyZGZTSFVZbHJ1eUx6MW9SS0VoS2c2S3dF?=
 =?utf-8?B?M2pHS2NaWUJXQk0ybHFUejVzeWozUkZvMzNlckY4dXRWak0xOFZhMWlEWVNZ?=
 =?utf-8?B?bWpDVXg0NUx6YWdhRGRGNDNtdTJwWjBLUVNRZE92cXo1Sy9EQkNpNFhJemN2?=
 =?utf-8?B?eFlQTm4wb01Zd3d1b28vNG5PcUxKRGtCdXJlYWd6UVNMNzFoTFQwOVhLMXRU?=
 =?utf-8?B?bmhpMTYxRXRORzZMVHJDRGt3MjROdytZQ3pMVTliTTZYRW8yVEVsdzNBS1pl?=
 =?utf-8?B?YXlHMU81a1ptMjYxVVJUQm1lV3gxTWdjUEZyeU4wWFRiVnRISlJ2Z09UZ1lr?=
 =?utf-8?B?Ynh2bkdLQ1crNVh1Y0xkSk1tR3NCL1lPQjBUMWxxU2VzS2NrVVhPQTEvNVll?=
 =?utf-8?B?VVo5SzRGeHJRS1VOS0FvbkdBWkFFR2RGUExJNWRkQXB1MHRjME9SVlFvZ04r?=
 =?utf-8?B?TkJmeVp1UDEzUE51WTZFN1NHb3RRclhsK0dVemhMQytYdHJWemJjY0hJcUY1?=
 =?utf-8?B?bXVvUExldUgrb1BzdFdtVTNPQnVON0pvZVhac0lCdFRTdlBiUWJGVHVIL0N0?=
 =?utf-8?B?SHRwSTRyWGZXeVdzQXg4UTV1QVA1QXh1UVM3R3hXa3V2eE9HbVpobit6WFB6?=
 =?utf-8?B?ZU4wSWVTOHVjYUdZMjQ3RVRlSmVrR2RUc2JMYkp4USs0dzlDdUdBbFlhb1Ry?=
 =?utf-8?B?U2UrejB4dG9DV1hENVQ5eTdKWDJ5aGhOV1lmdHBNa3Y1RlcyTVFleno2NmQv?=
 =?utf-8?B?Q0RYdXA0a2hHQ2p4b1FPc3Zmc1JjU2tyZ0FFeGd2S2NDNUI5bHhXSGVmb1Bn?=
 =?utf-8?B?ZzQ1QWEwL09sRHZMYU1meHNjSWx6RFBrdmF0MU1rRG4wRDl3STNzNlFaamZl?=
 =?utf-8?B?bG11bWpKNDNRaTR2UTNLdGtabUZqYzR6eHlJdUlMNzJiUnVXK21KbnJJRmMz?=
 =?utf-8?B?c0RMeHFGbDc5VUE9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 21:04:19.1773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c52ba8a-93a5-402a-2261-08d8b1bd7805
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mbYyjfQ6ZXceocihOH96LT3nSsfxb+7qF0oVq9iBvWANiaIvCIks8cmqiff45KLld+aiY9K7LwE1SPfDlJchMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2847
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

Ck9uIDExLzIzLzIwIDM6MDEgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gQW0gMjMuMTEu
MjAgdW0gMDU6NTQgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4KPj4gT24gMTEvMjEvMjAg
OToxNSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDIxLjExLjIwIHVtIDA2OjIx
IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4gV2lsbCBiZSB1c2VkIHRvIHJlcm91dGUg
Q1BVIG1hcHBlZCBCTydzIHBhZ2UgZmF1bHRzIG9uY2UKPj4+PiBkZXZpY2UgaXMgcmVtb3ZlZC4K
Pj4+Cj4+PiBVZmYsIG9uZSBwYWdlIGZvciBlYWNoIGV4cG9ydGVkIERNQS1idWY/IFRoYXQncyBu
b3Qgc29tZXRoaW5nIHdlIGNhbiBkby4KPj4+Cj4+PiBXZSBuZWVkIHRvIGZpbmQgYSBkaWZmZXJl
bnQgYXBwcm9hY2ggaGVyZS4KPj4+Cj4+PiBDYW4ndCB3ZSBjYWxsIGFsbG9jX3BhZ2UoKSBvbiBl
YWNoIGZhdWx0IGFuZCBsaW5rIHRoZW0gdG9nZXRoZXIgc28gdGhleSBhcmUgCj4+PiBmcmVlZCB3
aGVuIHRoZSBkZXZpY2UgaXMgZmluYWxseSByZWFwZWQ/Cj4+Cj4+Cj4+IEZvciBzdXJlIGJldHRl
ciB0byBvcHRpbWl6ZSBhbmQgYWxsb2NhdGUgb24gZGVtYW5kIHdoZW4gd2UgcmVhY2ggdGhpcyBj
b3JuZXIgCj4+IGNhc2UsIGJ1dCB3aHkgdGhlIGxpbmtpbmcgPwo+PiBTaG91bGRuJ3QgZHJtX3By
aW1lX2dlbV9kZXN0cm95IGJlIGdvb2QgZW5vdWdoIHBsYWNlIHRvIGZyZWUgPwo+Cj4gSSB3YW50
IHRvIGF2b2lkIGtlZXBpbmcgdGhlIHBhZ2UgaW4gdGhlIEdFTSBvYmplY3QuCj4KPiBXaGF0IHdl
IGNhbiBkbyBpcyB0byBhbGxvY2F0ZSBhIHBhZ2Ugb24gZGVtYW5kIGZvciBlYWNoIGZhdWx0IGFu
ZCBsaW5rIHRoZSAKPiB0b2dldGhlciBpbiB0aGUgYmRldiBpbnN0ZWFkLgo+Cj4gQW5kIHdoZW4g
dGhlIGJkZXYgaXMgdGhlbiBmaW5hbGx5IGRlc3Ryb3llZCBhZnRlciB0aGUgbGFzdCBhcHBsaWNh
dGlvbiBjbG9zZWQgCj4gd2UgY2FuIGZpbmFsbHkgcmVsZWFzZSBhbGwgb2YgdGhlbS4KPgo+IENo
cmlzdGlhbi4KCgpIZXksIHN0YXJ0ZWQgdG8gaW1wbGVtZW50IHRoaXMgYW5kIHRoZW4gcmVhbGl6
ZWQgdGhhdCBieSBhbGxvY2F0aW5nIGEgcGFnZSBmb3IgCmVhY2ggZmF1bHQgaW5kaXNjcmltaW5h
dGVseQp3ZSB3aWxsIGJlIGFsbG9jYXRpbmcgYSBuZXcgcGFnZSBmb3IgZWFjaCBmYXVsdGluZyB2
aXJ0dWFsIGFkZHJlc3Mgd2l0aGluIGEgVkEgCnJhbmdlIGJlbG9uZ2luZyB0aGUgc2FtZSBCTwph
bmQgdGhpcyBpcyBvYnZpb3VzbHkgdG9vIG11Y2ggYW5kIG5vdCB0aGUgaW50ZW50aW9uLiBTaG91
bGQgSSBpbnN0ZWFkIHVzZSBsZXQncyAKc2F5IGEgaGFzaHRhYmxlIHdpdGggdGhlIGhhc2gKa2V5
IGJlaW5nIGZhdWx0aW5nIEJPIGFkZHJlc3MgdG8gYWN0dWFsbHkga2VlcCBhbGxvY2F0aW5nIGFu
ZCByZXVzaW5nIHNhbWUgZHVtbXkgCnplcm8gcGFnZSBwZXIgR0VNIEJPCihvciBmb3IgdGhhdCBt
YXR0ZXIgRFJNIGZpbGUgb2JqZWN0IGFkZHJlc3MgZm9yIG5vbiBpbXBvcnRlZCBCT3MpID8KCkFu
ZHJleQoKCj4KPj4KPj4gQW5kcmV5Cj4+Cj4+Cj4+Pgo+Pj4gUmVnYXJkcywKPj4+IENocmlzdGlh
bi4KPj4+Cj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+PiAtLS0KPj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vZHJt
X2ZpbGUuY8KgIHzCoCA4ICsrKysrKysrCj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmlt
ZS5jIHwgMTAgKysrKysrKysrKwo+Pj4+IMKgIGluY2x1ZGUvZHJtL2RybV9maWxlLmjCoMKgwqDC
oMKgIHzCoCAyICsrCj4+Pj4gwqAgaW5jbHVkZS9kcm0vZHJtX2dlbS5owqDCoMKgwqDCoMKgIHzC
oCAyICsrCj4+Pj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4+Pj4KPj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZpbGUuYwo+Pj4+IGluZGV4IDBhYzQ1NjYuLmZmM2QzOWYgMTAwNjQ0Cj4+Pj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZpbGUuYwo+Pj4+IEBAIC0xOTMsNiArMTkzLDEyIEBAIHN0cnVjdCBkcm1fZmlsZSAqZHJt
X2ZpbGVfYWxsb2Moc3RydWN0IGRybV9taW5vciAqbWlub3IpCj4+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byBvdXRfcHJpbWVfZGVzdHJveTsKPj4+PiDCoMKgwqDCoMKgIH0KPj4+
PiDCoCArwqDCoMKgIGZpbGUtPmR1bW15X3BhZ2UgPSBhbGxvY19wYWdlKEdGUF9LRVJORUwgfCBf
X0dGUF9aRVJPKTsKPj4+PiArwqDCoMKgIGlmICghZmlsZS0+ZHVtbXlfcGFnZSkgewo+Pj4+ICvC
oMKgwqDCoMKgwqDCoCByZXQgPSAtRU5PTUVNOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIG91
dF9wcmltZV9kZXN0cm95Owo+Pj4+ICvCoMKgwqAgfQo+Pj4+ICsKPj4+PiDCoMKgwqDCoMKgIHJl
dHVybiBmaWxlOwo+Pj4+IMKgIMKgIG91dF9wcmltZV9kZXN0cm95Ogo+Pj4+IEBAIC0yODksNiAr
Mjk1LDggQEAgdm9pZCBkcm1fZmlsZV9mcmVlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKPj4+PiDC
oMKgwqDCoMKgIGlmIChkZXYtPmRyaXZlci0+cG9zdGNsb3NlKQo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBkZXYtPmRyaXZlci0+cG9zdGNsb3NlKGRldiwgZmlsZSk7Cj4+Pj4gwqAgK8KgwqDCoCBf
X2ZyZWVfcGFnZShmaWxlLT5kdW1teV9wYWdlKTsKPj4+PiArCj4+Pj4gwqDCoMKgwqDCoCBkcm1f
cHJpbWVfZGVzdHJveV9maWxlX3ByaXZhdGUoJmZpbGUtPnByaW1lKTsKPj4+PiDCoCDCoMKgwqDC
oMKgIFdBUk5fT04oIWxpc3RfZW1wdHkoJmZpbGUtPmV2ZW50X2xpc3QpKTsKPj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9w
cmltZS5jCj4+Pj4gaW5kZXggMTY5M2FhNy4uOTg3YjQ1YyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3By
aW1lLmMKPj4+PiBAQCAtMzM1LDYgKzMzNSwxMyBAQCBpbnQgZHJtX2dlbV9wcmltZV9mZF90b19o
YW5kbGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPj4+PiDCoCDCoMKgwqDCoMKgIHJldCA9IGRy
bV9wcmltZV9hZGRfYnVmX2hhbmRsZSgmZmlsZV9wcml2LT5wcmltZSwKPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBkbWFfYnVmLCAqaGFuZGxlKTsKPj4+PiArCj4+Pj4gK8KgwqDCoCBp
ZiAoIXJldCkgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBvYmotPmR1bW15X3BhZ2UgPSBhbGxvY19w
YWdlKEdGUF9LRVJORUwgfCBfX0dGUF9aRVJPKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFv
YmotPmR1bW15X3BhZ2UpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVOT01F
TTsKPj4+PiArwqDCoMKgIH0KPj4+PiArCj4+Pj4gwqDCoMKgwqDCoCBtdXRleF91bmxvY2soJmZp
bGVfcHJpdi0+cHJpbWUubG9jayk7Cj4+Pj4gwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBnb3RvIGZhaWw7Cj4+Pj4gQEAgLTEwMjAsNiArMTAyNyw5IEBAIHZvaWQg
ZHJtX3ByaW1lX2dlbV9kZXN0cm95KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAKPj4+PiAqb2JqLCBz
dHJ1Y3Qgc2dfdGFibGUgKnNnKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfYnVmX3VubWFw
X2F0dGFjaG1lbnQoYXR0YWNoLCBzZywgRE1BX0JJRElSRUNUSU9OQUwpOwo+Pj4+IMKgwqDCoMKg
wqAgZG1hX2J1ZiA9IGF0dGFjaC0+ZG1hYnVmOwo+Pj4+IMKgwqDCoMKgwqAgZG1hX2J1Zl9kZXRh
Y2goYXR0YWNoLT5kbWFidWYsIGF0dGFjaCk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgX19mcmVlX3Bh
Z2Uob2JqLT5kdW1teV9wYWdlKTsKPj4+PiArCj4+Pj4gwqDCoMKgwqDCoCAvKiByZW1vdmUgdGhl
IHJlZmVyZW5jZSAqLwo+Pj4+IMKgwqDCoMKgwqAgZG1hX2J1Zl9wdXQoZG1hX2J1Zik7Cj4+Pj4g
wqAgfQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZmlsZS5oIGIvaW5jbHVkZS9k
cm0vZHJtX2ZpbGUuaAo+Pj4+IGluZGV4IDcxNjk5MGIuLjJhMDExZmMgMTAwNjQ0Cj4+Pj4gLS0t
IGEvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaAo+Pj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9maWxl
LmgKPj4+PiBAQCAtMzQ2LDYgKzM0Niw4IEBAIHN0cnVjdCBkcm1fZmlsZSB7Cj4+Pj4gwqDCoMKg
wqDCoMKgICovCj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3ByaW1lX2ZpbGVfcHJpdmF0ZSBw
cmltZTsKPj4+PiDCoCArwqDCoMKgIHN0cnVjdCBwYWdlICpkdW1teV9wYWdlOwo+Pj4+ICsKPj4+
PiDCoMKgwqDCoMKgIC8qIHByaXZhdGU6ICovCj4+Pj4gwqAgI2lmIElTX0VOQUJMRUQoQ09ORklH
X0RSTV9MRUdBQ1kpCj4+Pj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGxvY2tfY291bnQ7IC8q
IERSSTEgbGVnYWN5IGxvY2sgY291bnQgKi8KPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX2dlbS5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4+Pj4gaW5kZXggMzM3YTQ4My4uNzZh
OTdhMyAxMDA2NDQKPj4+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKPj4+PiArKysgYi9p
bmNsdWRlL2RybS9kcm1fZ2VtLmgKPj4+PiBAQCAtMzExLDYgKzMxMSw4IEBAIHN0cnVjdCBkcm1f
Z2VtX29iamVjdCB7Cj4+Pj4gwqDCoMKgwqDCoMKgICoKPj4+PiDCoMKgwqDCoMKgwqAgKi8KPj4+
PiDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVjdF9mdW5jcyAqZnVuY3M7Cj4+
Pj4gKwo+Pj4+ICvCoMKgwqAgc3RydWN0IHBhZ2UgKmR1bW15X3BhZ2U7Cj4+Pj4gwqAgfTsKPj4+
PiDCoCDCoCAvKioKPj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZs
aXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDQlN0MwMSU3Q2FuZHJleS5ncm9kem92c2t5JTQw
YW1kLmNvbSU3Q2UwODUzNmViNWQ1MTQwNTlhMjAxMDhkODhmODVmN2YxJTdDM2RkODk2MWZlNDg4
NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQxNzE1Mjg1NjM2OTY3OCU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pC
VGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT01WHB4aXZsZ2dxa251
JTJGZ1Z0cG1ycFlIVDlnJTJCJTJCdWo1SkNQeUp5b2glMkI3VjQlM0QmYW1wO3Jlc2VydmVkPTAg
Cj4+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMl
M0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQt
Z2Z4JmFtcDtkYXRhPTA0JTdDMDElN0NhbmRyZXkuZ3JvZHpvdnNreSU0MGFtZC5jb20lN0NlMDg1
MzZlYjVkNTE0MDU5YTIwMTA4ZDg4Zjg1ZjdmMSU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5
NGUxODNkJTdDMCU3QzAlN0M2Mzc0MTcxNTI4NTYzNjk2NzglN0NVbmtub3duJTdDVFdGcGJHWnNi
M2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxD
SlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9NVhweGl2bGdncWtudSUyRmdWdHBtcnBZSFQ5
ZyUyQiUyQnVqNUpDUHlKeW9oJTJCN1Y0JTNEJmFtcDtyZXNlcnZlZD0wIAo+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
