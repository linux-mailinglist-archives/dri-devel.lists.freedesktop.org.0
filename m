Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 807A432F251
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 19:20:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 852906E25A;
	Fri,  5 Mar 2021 18:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803676E239;
 Fri,  5 Mar 2021 18:20:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVpALopA+4ZFcpz4fYdlFP8KTN5TlgSlGbL7OtS7htnSOGBjxIBlMBtoMRM2w1r3R7+D/cEJ+YmZbMMQ+6wWTiEnKGaMKFIZjXMqyBAdF/CkFGSinLZQhIx//j2gS0jdR9feZgNPRg6zZAoRt13RNsIy3MvHBt0iZXn1ReOwKIDF85P9ol79HQBuI59wNHsQnY76lIBra0aGiEZlFAhEieLQSVirv4FC03KLPPeY82gNq2GinR1JMc9DII6Bg1DnKpgFIHgZ+SJnfQ9ZtQwi0NxuKlYKPSD+rpJoMIJNuZ+m+uJwoWRwt+dDpER1K5R8zAjrGJVXzk3WEoVXRtI5ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJug7gmKGA1eIlhvKUmZom1hpZ8pyYLCwHy2dpn0Waw=;
 b=jIbAwC2o3kbS/zwM5lx4UD/NSS4dwSeCF11E9h2dG4WzKqHmSlkyWeZIjmJYBBfFPvwddZV1N6o1G/uVsE3Azx+ecWNHrWhuE2iSzeAS87m6KKdjgVYIyzT32cHM79YxmKnq3qcf8JysLkGLt5Mv5xEIAW23nFOFlrjHECHwzEvRQsSSbYUPtgzVSiQzbOr/h8HbtTy8IbvfW4CqrwqvEJPyldNU862yhT7UU3ZCb8G30tBSvxKFUaAnxx4XdkWyBRah9m562M3FWbvZK4pFHAiizYakFi6JLfVHp3P3bRJrTVSYPKegZOJnMn00klFX9G6X/3cqpL9Eh7abznVy5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJug7gmKGA1eIlhvKUmZom1hpZ8pyYLCwHy2dpn0Waw=;
 b=pj3XAAxDV8LRzD6ytm/DV5tMPh4yyYSgTbRfr7GBeu2nbQTADNA4cX/QSdyrCdxsMRxD2Hye06ZzvAA+3eIwCrTjeNm1CLfXmz+75G8+cGhrIxycP0FpvuSxRqD7545dk2uhV679I6eYm7Mrd4jz4MLXUpSoecx3KYqomIM4lKA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4550.namprd12.prod.outlook.com (2603:10b6:208:24e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Fri, 5 Mar
 2021 18:20:10 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%9]) with mapi id 15.20.3784.030; Fri, 5 Mar 2021
 18:20:10 +0000
Subject: Re: [PATCH 1/1] drm/ttm: Ignore signaled move fences
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210227034524.21763-1-Felix.Kuehling@amd.com>
 <c66e10a6-b5e1-b096-3c59-c107e1e12312@gmail.com>
 <482d3b8f-27dc-6815-b6f6-4987fe5ed21c@amd.com>
 <db49503a-236e-b4a1-e90d-da8ee21d11b4@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <6626fc4e-3f4b-74bf-c56a-e0bb9b2bafd9@amd.com>
Date: Fri, 5 Mar 2021 13:20:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <db49503a-236e-b4a1-e90d-da8ee21d11b4@gmail.com>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::39) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YTBPR01CA0026.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.25 via Frontend Transport; Fri, 5 Mar 2021 18:20:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 502ddf88-500b-43b0-05ba-08d8e0035007
X-MS-TrafficTypeDiagnostic: MN2PR12MB4550:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4550CA39E58D76909ABCF76F92969@MN2PR12MB4550.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /y5GheW77b9D1aK1hUsAhPXRJx2b0UI21PrM70qNeSl6eYNpM4PvA0iNUjB1ujxxGjKb0qgOY52puU7c8nwHnNSlSjGc2wVnGWhpPfcZe2doM/DUWI5m7L5eT/iflyJAc6z5PVTWJwjKnh1ztMW7RPKCMegYzHQysuEYNBR0MjnRNiANPT8T72Ib8vN4DTDfO/1ix4xQURGudbMH13XPuhEfPkI5fTKp813kQnhtcfYEFfLmHyli0HdS8Xmw2nvuCFaYhIhnUq9xf7WnzGDpUf8soFjKubmfW9IeJI2uIdebNZp1/6vRBTETJe2kEtCQHMW8zL4/0uNMgrfSMkdjll/fAEJl18Mln1QYqXON0jgtgKTkYqzCRr7YO7K35oYPIf4HcGA6H1c2pvUMuJrUifblQ19cqH4QEUDDMwcQ+teZJeBOTZ/hjVd4s83eUgNqgQaDGKlapwaUUdJmnPV/+wlDeubNcSmj4r7zZu26hvdXPt7FaQN4kfMNI2TWWgIbOPU7rYP7NrlrF+qXxgBcUTP5D3/FwfjvirINsARn+9mfqPEv+WShKaixkeqyt+BIEuFdjjumuZ2I9RmLkhKtKW31op0ajvErBbaS4nMqPCk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(44832011)(956004)(316002)(16576012)(16526019)(66556008)(186003)(66946007)(8676002)(26005)(2616005)(31686004)(8936002)(66574015)(52116002)(6486002)(36756003)(31696002)(66476007)(83380400001)(86362001)(2906002)(5660300002)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M3dEQmlLeWk5UExqZU9iUmpoLzBQSlFJV3JZZktjT3FWbnFpVDdxVThDUFBM?=
 =?utf-8?B?TG5iSUYybC8vMzRwSFdiTEx5RHJweUc0NGQ1MDVpZ01qYTZkQi8wYkN5TTVh?=
 =?utf-8?B?bFpMemVLL3QwcjdMSHlZcnFaNWVHc29tSVpDcHp5ditFelNuZzBWaEpkekxx?=
 =?utf-8?B?VW1INE5CQjJNejBPdHVhRXU2eXBUNTlXTkdTcTkwVklJNlZveFhqY1JKZGVt?=
 =?utf-8?B?QVluYlRRdTRZZitZeVhzcExoVGJsM1FLVHFMTXZhSEM5VWJHNjNjUlVzZ20v?=
 =?utf-8?B?c0l1SnVSd0hRVlBNbUtucnpFTnU5MVVxQ1c4SnRYVVBxVVFzZ056R2hjTHJ3?=
 =?utf-8?B?c1NtTHVPNEx3dTRpSFl6WkxwOXRPQmNDb2o1eXUvY20yZ3lOSnhVeHduOStX?=
 =?utf-8?B?bVRoQWpLWnlOWWVSei9zSWl1S0ZpNWdLdnRadWRPUnBIaTZKaVdaQTNtdnd4?=
 =?utf-8?B?ZlQyZzBNYjdzaFYxcnV0Q0YzN2JBZFNvMEYxRUl6L1RNVkd4V2FBS3Z4T2Rr?=
 =?utf-8?B?TVhYalZKV0xrVlBzcTM5UkloTUYwdW5ZNGNFcEdtZHRUaUdLSFpOOHN2bXds?=
 =?utf-8?B?RC9GbEFUQTJuRUhhdUxFKzJzeTR1ZlU3RCtJOGxPb29SWng3SmhFcDNaczhk?=
 =?utf-8?B?ODZ5T0xpUUZYaFI4bXpmQTJhVTRuUE9BRVp2VmZiOFVBTWZUWk1ueG9rcld4?=
 =?utf-8?B?c0ZwenpkN3lhYlJGSFZiQ0dyN0J4aTZqS0xhTFZFVklCZzVncGx6eUgvWXly?=
 =?utf-8?B?MkRVRGVFSFpTdVgxRjRpaTRLUjlMdmRlU2QxVGZOUjh1enRmbkZKNDM0VFJu?=
 =?utf-8?B?NDJuMVFQUGxNSWRGT3dxbjBTT1dwb3pxWkdiTElocE1uVlhIcG9TSStqSk1Z?=
 =?utf-8?B?aVVTWGoyeGRCSkFIdWRxMjk4d2d5eGVySU1hcWUyQ0huelFhN1YxV2ZUSkNp?=
 =?utf-8?B?dUJXV3Z4NVd3VVJaMDBDN09iVUdIM2EzVWcyUTJ5R2xLSEYvUllBV0lGTkxN?=
 =?utf-8?B?dk1DdHIzdGovelZVUkt2NHVmdGFUZGpuVVZuOUl0UlNHcnprTWIxeCs2a3h0?=
 =?utf-8?B?bWErU0JpNXRLdTI0U0pEMDFreitxcUpybi9nS2gxdWl5SUZDRG82bm8vM1Fo?=
 =?utf-8?B?RFZmUHZTb1FGazJLbGROajd1N3gwTDczbkVFeVU3RGNIQkREczhpdGtQT1Yw?=
 =?utf-8?B?Q1J1VklGa3B3bkMwKzJ2Wmc4a1RNN0hVenMxUzRvWnhjQlhEWDhFVnE0ZFRl?=
 =?utf-8?B?ZWpwZi9neHI5MFFqbTVXZzIrQlhDMVZsOVQ2a09SODExWElkSFdJbWNWR3pa?=
 =?utf-8?B?WHNlcGd0d3RKVTU3YVZkQVBGdnNvdzVTQXJGQjRPUDB0N0RiV1dFUUE5N0dI?=
 =?utf-8?B?SFhtVGhsNHRaczV5R2E4cCtnVnJlcmZMT05vU0RoNWVqNFhiN1YyZHVkcmxx?=
 =?utf-8?B?cWhzbjlmdm5CNEdheUcxcXVHdGRkWmMyMnRhdVRIS1Zyc1FvcnFCeG1sMmRl?=
 =?utf-8?B?bU9mN0Evdm9KQ2NWbVFvemFhV0w1eHIyZS90WnlEREpNZnU1YmYwRWo5SnVG?=
 =?utf-8?B?TWZYc0VpL0JRMk9rN0lGVHppeTg0ZzNjcHJTMGtsdTNoR2tyN3JLTUxIVUtn?=
 =?utf-8?B?QUFWSFB0WVJVZWZ3TjN0YUJsTC8zOGpTREVuOTZNU25uMFNxNnVpZjNzQ250?=
 =?utf-8?B?LzhKOWN2bklQN3N1Q2lzS2pndzQ5N1FPS1BPMVU0Q3VpRFA2ZkRpenNza3Nw?=
 =?utf-8?B?TmlQSnBjZk02Yi9ZZ2t3cHdxeWhlbXZWM1BuVWZ6QVgrVnhvVVEvbFZjM1Y2?=
 =?utf-8?B?Tkt4Vk5JSW5KbUxTcnMrQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 502ddf88-500b-43b0-05ba-08d8e0035007
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 18:20:10.6380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J09up1gVJguAUi5AeK85N9YCbXVu5etvEChnIz9E5UrrwF/if5/cXlGa9fenOpdYJsNgiKFKWQ39U9nE/DTQnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4550
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

SXQgZml4ZWQgYW4gaW50ZXJtaXR0ZW50IGZhaWx1cmUgdG8gYWxsb2NhdGUgcGFnZSB0YWJsZXMg
aW4gdGhlIHBhZ2UKZmF1bHQgaGFuZGxlciAodHVybmluZyByZXRyeSBmYXVsdHMgaW50byBuby1y
ZXRyeSBmYXVsdHMpLiBJJ20gbm90IHN1cmUKaWYgdGhpcyBjYXVzZWQgcmVhbCBwcm9ibGVtcy4g
SSB0aGluayBpdCBjb3VsZCBwb3RlbnRpYWxseSByZXN1bHQgaW4KZmF1bHQgc3Rvcm1zIGFuZCBh
IGZhaWx1cmUgdG8gcmVwb3J0IHBhZ2UgZmF1bHRzIHByb3Blcmx5LiBJJ20gbm90IHN1cmUKaWYg
aXQncyBhIHJlZ3Jlc3Npb24gb3Igd2FzIGFsd2F5cyBwcmVzZW50LiBTbyBJJ20gbm90IHN1cmUg
aWYgaXQncyBhbgp1cmdlbnQgZml4LgoKUmVnYXJkcywKwqAgRmVsaXgKCkFtIDIwMjEtMDMtMDUg
dW0gMjo1NiBhLm0uIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPgo+Cj4gQW0gMDUuMDMuMjEg
dW0gMDI6MjEgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPj4gQW0gMjAyMS0wMy0wMSB1bSAxMDow
OSBhLm0uIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPj4+IEFtIDI3LjAyLjIxIHVtIDA0OjQ1
IHNjaHJpZWIgRmVsaXggS3VlaGxpbmc6Cj4+Pj4gTW92ZSBmZW5jZXMgdGhhdCBoYXZlIGFscmVh
ZHkgc2lnbmFsZWQgc2hvdWxkIG5vdCBwcmV2ZW50IG1lbW9yeQo+Pj4+IGFsbG9jYXRpb25zIHdp
dGggbm9fd2FpdF9ncHUuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8
RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IEkgd29yayBvbiB0aGlzIG9uIEFsZXgncyBy
ZWJhc2VkIGFtZC1zdGFnaW5nLWRybS1uZXh0LiBTaG91bGQgdGhpcyBnbwo+PiBpbnRvIGFueSBv
dGhlciBicmFuY2hlcz8KPgo+IEkgaGF2ZSBhIGJyYW5jaCB3aXRoIHN0dWZmIGZvciA1LjEzIHdo
aWNoIEkgd2FudCB0byBwdXNoIHRvCj4gZHJtLW1pc2MtbmV4dCBhcyBzb29uIGFzIDUuMTItcmMx
IGlzIG91dC4KPgo+IEdvaW5nIHRvIGFkZCB0aGlzIG9uZSBoZXJlIHRvIHRoYXQgY29sbGVjdGlv
biBhcyB3ZWxsIHVubGVzcyB5b3Ugc2F5Cj4gdGhhdCB0aGlzIGlzIHJlYWxseSBhIGJ1ZyBmaXgg
YW5kIHdlIG5lZWQgaXQgZWFybGllci4KPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+Cj4+Cj4+
IFRoYW5rcywKPj4gwqDCoCBGZWxpeAo+Pgo+Pgo+Pj4+IC0tLQo+Pj4+IMKgwqAgZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYyB8IDMgKystCj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
Ywo+Pj4+IGluZGV4IDNhMTBiZWJiNzVkNi4uZGUxZWM4MzhjZjhiIDEwMDY0NAo+Pj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jCj4+Pj4gQEAgLTczMCw4ICs3MzAsOSBAQCBzdGF0aWMgaW50IHR0bV9ib19h
ZGRfbW92ZV9mZW5jZShzdHJ1Y3QKPj4+PiB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+Pj4gwqDCoCDCoMKgwqDCoMKgIGlmIChub193
YWl0X2dwdSkgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSBkbWFfZmVuY2VfaXNfc2lnbmFs
ZWQoZmVuY2UpID8gMCA6IC1FQlVTWTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVu
Y2VfcHV0KGZlbmNlKTsKPj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FQlVTWTsKPj4+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+PiDCoMKgwqDCoMKgwqAgfQo+Pj4+IMKgwqAg
wqDCoMKgwqDCoCBkbWFfcmVzdl9hZGRfc2hhcmVkX2ZlbmNlKGJvLT5iYXNlLnJlc3YsIGZlbmNl
KTsKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
