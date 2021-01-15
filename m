Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBC42F73D4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 08:48:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6566E165;
	Fri, 15 Jan 2021 07:47:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4388C6E15D;
 Fri, 15 Jan 2021 07:47:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNGF9rBqTW/6xekLkHvsei2n18I/QyPje3e6IEwFe+D3LXNIu5MuACqofdty1C5dVMmJHWpGejmnbAqqjQ47JSD4c79E5SjNU37e5tJaXDH3cJjgYSlNW3Hfw2StrEVs7xSg2jz830apUooGLpJYsS1NQa4IqQr8EYy9Zc7Du8TpMxd38J9ZJeWi+o93CyidpQJWjObOGnikWDNxFVp1Qqq2qKVgzFcyUFT6srn5M9HJcD5YxBSES5n+H9iIDDZ7d4/LcXkPsU43zxQrWAxoevEYvhDfBwpzXf4hFYZk1vMlvU85KCS76VZlqAHaS9BebwF4pnNa7U1NcIu0TDDgQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewu/6S3yGP+Sl2UbQ2oUcJN3OTEzwTPFN4iYcOqNzs0=;
 b=DgDUqt1MKw5ElO8ja6x90oF/VADSlrnOUvxavfastMrg96/kHTMaF4/5POANprXW6iB0jSa/u26ymg+RDoICtGOq9+jnm5TneV7fj5ZdeDEMfSsQrKz1U3TNVgT2pOCeg4izaVdWrDt1JNHPMeF0XBqAQ3MXo3EIpZ60M1jizAcB59yhYygB3SXoIjs4qf7hDxJZeUno0OiTVMgJuVbdR/zbSkGnJat6pelaWMk29oSvH1K8tbVr3hR6+etKF+ggtB+kTJiJ1KVhtxKoWJq1gOYuz+CkPgLsthv4P1gjlY1HMssZQfdb/MiDHsQInriRK/r5GJqfw3BwrGjZ2Pxxqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ewu/6S3yGP+Sl2UbQ2oUcJN3OTEzwTPFN4iYcOqNzs0=;
 b=LMIsWparvpKBMyd8JsgpuxG8wJxkPV8KY3qpHjNheWbWGEDPbgR7tfdcCJOEe5SFvNv6TvXsVNk1/HCl9zXJmiN0ktMPAumvi78guPOd/tZjiGWj3TkEE9hBRY2fr5jyhV+jE8PgWLaleHm/qWxnGrVBiAnVb8vSFAwRz2RJar8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3951.namprd12.prod.outlook.com (2603:10b6:208:16b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 15 Jan
 2021 07:47:55 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 07:47:54 +0000
Subject: Re: HMM fence (was Re: [PATCH 00/35] Add HMM-based SVM memory manager
 to KFD)
To: Felix Kuehling <felix.kuehling@amd.com>, Jerome Glisse <jglisse@redhat.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <X/bTFWL3HYVc8LEF@phenom.ffwll.local>
 <6daf9ebc-507e-6e83-04dd-d7c5fc6998d6@amd.com>
 <X/hux3eX8Ywf61h7@phenom.ffwll.local> <20210113165646.GB521755@redhat.com>
 <c1ecb381-20cc-850b-4491-99c6b413f7df@gmail.com>
 <CAKMK7uHXRwE7tgHM0K921pEyrpZWz7G5q_OcrS4tBPAN-f3k-g@mail.gmail.com>
 <5267b98d-05f4-9e8a-e424-b226f72ce066@amd.com>
 <20210114165128.GB10147@redhat.com>
 <db1f8cef-a60a-9860-c43b-f1ef6b9b6463@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <223d8a97-44b4-fe5c-4736-c5c3580edd10@amd.com>
Date: Fri, 15 Jan 2021 08:47:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <db1f8cef-a60a-9860-c43b-f1ef6b9b6463@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR05CA0082.eurprd05.prod.outlook.com
 (2603:10a6:208:136::22) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0082.eurprd05.prod.outlook.com (2603:10a6:208:136::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Fri, 15 Jan 2021 07:47:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ecb11a93-e4cd-4ca6-371b-08d8b929de03
X-MS-TrafficTypeDiagnostic: MN2PR12MB3951:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB39512663F2962EA341E50E7483A70@MN2PR12MB3951.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cR9AO5W4wi+FnAQuJiTsRX2XW6Bskr5Qzad+a2Ddik0SOQC1MQVZYBp21tG4eKEPETC3eCHeAS6ga8guH3JVWTE0w3NJWml0tUJXBc+7JzRBk770vIqoZAyLEHvu4t/qWi+t9QWGR3DFnhsJNsYVTRTG6sBPZvrFcd1hSkYFuuHjgA/x7Pi5BAjgNkTniqjZb4uHzM2ijpfudy2i61iBAtpdTsbJ+lDdhiNdQWzpEGYai8UhvnN5opi0Zus7M3f789r5Wh0dOLb1JfrZYZ3GqkHbL9XS1hWHYczrmbF08USnMXsmPIvOIvuFMNy6HWjih6YnxEk/MEdP1LUxs97ytzBSy9dj5TzPE/WIHPtQqyZt64ns19+FECqTZyivZaXlSqS6EjLn2UrEa0kVDvA397vaGDunZMolXicggvqoR8JVTX8LbY6oK8lsl/tR/KOBr42z8sUczJQ0eOhU2lzqS55DINA5yv3crf7lIzfV98yJda37eyZ53SWQe4zmciJl3m8pGn4mFVJz4Fg7WzH0FsFipDXOkL9iMLMoVGovkQauYXR2evE49cBZhc5ItsjOyWBffuJFnmiuxLnrpr3JOEPnXtO+C52AStQwhlAKut4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(5660300002)(31686004)(4326008)(66476007)(16526019)(2616005)(8676002)(6486002)(478600001)(54906003)(83380400001)(316002)(86362001)(6666004)(31696002)(2906002)(52116002)(110136005)(36756003)(66946007)(66556008)(8936002)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXBML0tVaHF3aS9mQVlGNllYYVJ6RWFENUg3anZWOXNTVmZoWjY0NzBwWm84?=
 =?utf-8?B?ZWhOUGwyemtZUmtuTGFPQ0lZSUpLLzRBUXlMY0VteG0xbUlRTXJvRVRycVZq?=
 =?utf-8?B?VzdwMU9CTlE5U0JDZTdIS3pqWmNEYUwrbXJSdTJaZHVERFlxT3B6UWIzRkhi?=
 =?utf-8?B?emR4QUxxVWNCNkhzVTR6cldIblFnOHlZdXRHb3hKd2xrZTg0YjErQmNZbmMv?=
 =?utf-8?B?b3AvbjBLcXFNWk9uOTA2WlIwaWhXUW5IbHVVOG1OR2RYWGtQclVmaHd3KzFY?=
 =?utf-8?B?amdpSGFRN0htTDhBZHNBVlVlbEhtc0RZdnBhQTZDNHI2ZjN1azhBTiszYXZK?=
 =?utf-8?B?WWhVajgybHM3VVJodEJRU0h2UnVJSjk0YUNucXNiQ1czQTN4cDJyc3NJWEJL?=
 =?utf-8?B?enN6K3RsZ1I3aHR0MGo2Tnc0YTlHMFd6UEdZS3d2UmZsTElvekxxcXJlQ0xk?=
 =?utf-8?B?YnlKMDVobkZKbWFXYnAzclRLVDhRc1oxSnJySVRLNlAwNVdJSis0eitwcDd3?=
 =?utf-8?B?Myt4TElxeGVYRC9YOVEvWmlwRC90VjU4ZmtwUzk4V2tBQmxiZDdLNHZCTGFQ?=
 =?utf-8?B?cFZhY3B4Rm1Uc0g3UUk2SER2VGpiYXlNQjFIRVI4SmV0UEd5YmdJWUIvUjN4?=
 =?utf-8?B?OFhqU1A4RjNBVTlkS0tQd2Vwb1prUGxRQ1ZjZmtRUHhBT0tJckgybFlJakxZ?=
 =?utf-8?B?TmJJOE5ha1RpREh1Zm1TeG1rNWpQa0RMa0xKVVpwbnovOUJvbGNFZ21HUkdT?=
 =?utf-8?B?STVOOVZYZmpvUGRtQ1BKdFJHekc5RlNCM2RGYXlJY0xHNnJnUjFjOFFFams1?=
 =?utf-8?B?eCtxeDNGSG41dWNkOGQwbDJkbytjZVBnTHlhNUtJZW9kVU04NVJpNVowTkxt?=
 =?utf-8?B?YW1pcGxYVWVsNmdnN210RWtWWDRHQlRJUWRiMWI0Q2dzaTkrOGNIUm9rdmp0?=
 =?utf-8?B?ZVRHU3FLNUJzdDNoTis0bnN2U0tCVmhKMUR3SDhKQ1BsYjFXOVNTU3RLWWI4?=
 =?utf-8?B?OXVieVV1MFhVUHB3bnVMNndxTG9LQTF6SXNueUN6NStmSFNZalhZclBuL2JH?=
 =?utf-8?B?QmpNQlA3eG9kQ2RzeDlMYVFmdUliUW42TlRpWVVvcnpEZlA4MndBcmxKalFh?=
 =?utf-8?B?YmlKL21JajhiK0RJemtQMU93WXBYaEJCcG85MFcweWFYV0ZVS3FETkRjRkN6?=
 =?utf-8?B?R29idSsxMFkwQlZHWXpmOHdjWGZPWUxkVXVrU2VQVGdQcHJ5N3Q1LzdGSE5q?=
 =?utf-8?B?N3FBYmZrZWtQVWc3Yk4xSW5HNHJBQld0UTB0RkJmRlZ5NG5pL1UxcHl0Vnda?=
 =?utf-8?B?aWw0MHVPVjM3WUVma2NqTUM3S2FCdVgwNlNZZTFoWGVocUZ3dTV5N3lPT3lR?=
 =?utf-8?B?MVlRa2xMUUtPS2g5bVVwbmNoYzNjVmRnaUhPMUpHYmNUU1BHaEdtU1ViNlJD?=
 =?utf-8?Q?CagFT+B8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb11a93-e4cd-4ca6-371b-08d8b929de03
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 07:47:54.5074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdFw7YvrHcVODttn0Os6UkpT6HYdpUmzbkq6TxsMr/W9frlzXx2o0QXFd3wkdIID
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3951
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDEuMjEgdW0gMjI6MTMgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPiBBbSAyMDIxLTAx
LTE0IHVtIDExOjUxIGEubS4gc2NocmllYiBKZXJvbWUgR2xpc3NlOgo+PiBPbiBUaHUsIEphbiAx
NCwgMjAyMSBhdCAwMjozNzozNlBNICswMTAwLCBDaHJpc3RpYW4gS8ODwrZuaWcgd3JvdGU6Cj4+
PiBBbSAxNC4wMS4yMSB1bSAxMjo1MiBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+Pj4gW1NOSVBd
Cj4+Pj4+PiBJIGhhZCBhIG5ldyBpZGVhLCBpIHdhbnRlZCB0byB0aGluayBtb3JlIGFib3V0IGl0
IGJ1dCBoYXZlIG5vdCB5ZXQsCj4+Pj4+PiBhbnl3YXkgaGVyZSBpdCBpcy4gQWRkaW5nIGEgbmV3
IGNhbGxiYWNrIHRvIGRtYSBmZW5jZSB3aGljaCBhc2sgdGhlCj4+Pj4+PiBxdWVzdGlvbiBjYW4g
aXQgZGVhZCBsb2NrID8gQW55IHRpbWUgYSBHUFUgZHJpdmVyIGhhcyBwZW5kaW5nIHBhZ2UKPj4+
Pj4+IGZhdWx0IChpZSBzb21ldGhpbmcgY2FsbGluZyBpbnRvIHRoZSBtbSkgaXQgYW5zd2VyIHll
cywgb3RoZXJ3aXNlCj4+Pj4+PiBuby4gVGhlIEdQVSBzaHJpbmtlciB3b3VsZCBhc2sgdGhlIHF1
ZXN0aW9uIGJlZm9yZSB3YWl0aW5nIG9uIGFueQo+Pj4+Pj4gZG1hLWZlbmNlIGFuZCBiYWNrIG9m
IGlmIGl0IGdldHMgeWVzLiBTaHJpbmtlciBjYW4gc3RpbGwgdHJ5IG1hbnkKPj4+Pj4+IGRtYSBi
dWYgb2JqZWN0IGZvciB3aGljaCBpdCBkb2VzIG5vdCBnZXQgYSB5ZXMgb24gYXNzb2NpYXRlZCBm
ZW5jZS4KPj4+Pj4+Cj4+Pj4+PiBUaGlzIGRvZXMgbm90IHNvbHZlIHRoZSBtbXUgbm90aWZpZXIg
Y2FzZSwgZm9yIHRoaXMgeW91IHdvdWxkIGp1c3QKPj4+Pj4+IGludmFsaWRhdGUgdGhlIGdlbSB1
c2VycHRyIG9iamVjdCAod2l0aCBhIGZsYWcgYnV0IG5vdCByZWxlYXNpbmcgdGhlCj4+Pj4+PiBw
YWdlIHJlZmNvdW50KSBidXQgeW91IHdvdWxkIG5vdCB3YWl0IGZvciB0aGUgR1BVIChpZSBubyBk
bWEgZmVuY2UKPj4+Pj4+IHdhaXQgaW4gdGhhdCBjb2RlIHBhdGggYW55bW9yZSkuIFRoZSB1c2Vy
cHRyIEFQSSBuZXZlciByZWFsbHkgbWFkZQo+Pj4+Pj4gdGhlIGNvbnRyYWN0IHRoYXQgaXQgd2ls
bCBhbHdheXMgYmUgaW4gc3luYyB3aXRoIHRoZSBtbSB2aWV3IG9mIHRoZQo+Pj4+Pj4gd29ybGQg
c28gaWYgZGlmZmVyZW50IHBhZ2UgZ2V0IHJlbWFwcGVkIHRvIHNhbWUgdmlydHVhbCBhZGRyZXNz
Cj4+Pj4+PiB3aGlsZSBHUFUgaXMgc3RpbGwgd29ya2luZyB3aXRoIHRoZSBvbGQgcGFnZXMgaXQg
c2hvdWxkIG5vdCBiZSBhbgo+Pj4+Pj4gaXNzdWUgKGl0IHdvdWxkIG5vdCBiZSBpbiBvdXIgdXNh
Z2Ugb2YgdXNlcnB0ciBmb3IgY29tcG9zaXRvciBhbmQKPj4+Pj4+IHdoYXQgbm90KS4KPj4+Pj4g
VGhlIGN1cnJlbnQgd29ya2luZyBpZGVhIGluIG15IG1pbmQgZ29lcyBpbnRvIGEgc2ltaWxhciBk
aXJlY3Rpb24uCj4+Pj4+Cj4+Pj4+IEJ1dCBpbnN0ZWFkIG9mIGEgY2FsbGJhY2sgSSdtIGFkZGlu
ZyBhIGNvbXBsZXRlIG5ldyBjbGFzcyBvZiBITU0gZmVuY2VzLgo+Pj4+Pgo+Pj4+PiBXYWl0aW5n
IGluIHRoZSBNTVUgbm90Zmllciwgc2NoZWR1bGVyLCBUVE0gZXRjIGV0YyBpcyBvbmx5IGFsbG93
ZWQgZm9yCj4+Pj4+IHRoZSBkbWFfZmVuY2VzIGFuZCBITU0gZmVuY2VzIGFyZSBpZ25vcmVkIGlu
IGNvbnRhaW5lciBvYmplY3RzLgo+Pj4+Pgo+Pj4+PiBXaGVuIHlvdSBoYW5kbGUgYW4gaW1wbGlj
aXQgb3IgZXhwbGljaXQgc3luY2hyb25pemF0aW9uIHJlcXVlc3QgZnJvbQo+Pj4+PiB1c2Vyc3Bh
Y2UgeW91IG5lZWQgdG8gYmxvY2sgZm9yIEhNTSBmZW5jZXMgdG8gY29tcGxldGUgYmVmb3JlIHRh
a2luZyBhbnkKPj4+Pj4gcmVzb3VyY2UgbG9ja3MuCj4+Pj4gSXNudCcgdGhhdCB3aGF0IEkgY2Fs
bCBnYW5nIHNjaGVkdWxpbmc/IEkuZS4geW91IGVpdGhlciBydW4gaW4gSE1NCj4+Pj4gbW9kZSwg
b3IgaW4gbGVnYWN5IGZlbmNpbmcgbW9kZSAod2hldGhlciBpbXBsaWNpdCBvciBleHBsaWNpdCBk
b2Vzbid0Cj4+Pj4gcmVhbGx5IG1hdHRlciBJIHRoaW5rKS4gQnkgZm9yY2luZyB0aGF0IHNwbGl0
IHdlIGF2b2lkIHRoZSBwcm9ibGVtLAo+Pj4+IGJ1dCBpdCBtZWFucyBvY2Nhc2lvbmFsbHkgZnVs
bCBzdGFsbHMgb24gbWl4ZWQgd29ya2xvYWRzLgo+Pj4+Cj4+Pj4gQnV0IHRoYXQncyBub3Qgd2hh
dCBKZXJvbWUgd2FudHMgKGFmYWl1aSBhdCBsZWFzdCksIEkgdGhpbmsgaGlzIGlkZWEKPj4+PiBp
cyB0byB0cmFjayB0aGUgcmV2ZXJzZSBkZXBlbmRlbmNpZXMgb2YgYWxsIHRoZSBmZW5jZXMgZmxv
YXRpbmcKPj4+PiBhcm91bmQsIGFuZCB0aGVuIHNraXAgZXZpY3RpbmcgYW4gb2JqZWN0IGlmIHlv
dSBoYXZlIHRvIHdhaXQgZm9yIGFueQo+Pj4+IGZlbmNlIHRoYXQgaXMgcHJvYmxlbWF0aWMgZm9y
IHRoZSBjdXJyZW50IGNhbGxpbmcgY29udGV4dC4gQW5kIEkgZG9uJ3QKPj4+PiB0aGluayB0aGF0
J3MgdmVyeSBmZWFzaWJsZSBpbiBwcmFjdGljZS4KPj4+Pgo+Pj4+IFNvIHdoYXQga2luZCBvZiBo
bW0gZmVuY2VzIGRvIHlvdSBoYXZlIGluIG1pbmQgaGVyZT8KPj4+IEl0J3MgYSBiaXQgbW9yZSBy
ZWxheGVkIHRoYW4geW91ciBnYW5nIHNjaGVkdWxlLgo+Pj4KPj4+IFNlZSB0aGUgcmVxdWlyZW1l
bnRzIGFyZSBhcyBmb2xsb3c6Cj4+Pgo+Pj4gMS4gZG1hX2ZlbmNlcyBuZXZlciBkZXBlbmQgb24g
aG1tX2ZlbmNlcy4KPj4+IDIuIGhtbV9mZW5jZXMgY2FuIG5ldmVyIHByZWVtcHQgZG1hX2ZlbmNl
cy4KPj4+IDMuIGRtYV9mZW5jZXMgbXVzdCBiZSBhYmxlIHRvIHByZWVtcHQgaG1tX2ZlbmNlcyBv
ciB3ZSBhbHdheXMgcmVzZXJ2ZSBlbm91Z2gKPj4+IGhhcmR3YXJlIHJlc291cmNlcyAoQ1VzKSB0
byBndWFyYW50ZWUgZm9yd2FyZCBwcm9ncmVzcyBvZiBkbWFfZmVuY2VzLgo+Pj4KPj4+IENyaXRp
Y2FsIHNlY3Rpb25zIGFyZSBNTVUgbm90aWZpZXJzLCBwYWdlIGZhdWx0cywgR1BVIHNjaGVkdWxl
cnMgYW5kCj4+PiBkbWFfcmVzZXJ2YXRpb24gb2JqZWN0IGxvY2tzLgo+Pj4KPj4+IDQuIEl0IGlz
IHZhbGlkIHRvIHdhaXQgZm9yIGEgZG1hX2ZlbmNlcyBpbiBjcml0aWNhbCBzZWN0aW9ucy4KPj4+
IDUuIEl0IGlzIG5vdCB2YWxpZCB0byB3YWl0IGZvciBobW1fZmVuY2VzIGluIGNyaXRpY2FsIHNl
Y3Rpb25zLgo+Pj4KPj4+IEZlbmNlIGNyZWF0aW9uIGVpdGhlciBoYXBwZW5zIGR1cmluZyBjb21t
YW5kIHN1Ym1pc3Npb24gb3IgYnkgYWRkaW5nCj4+PiBzb21ldGhpbmcgbGlrZSBhIGJhcnJpZXIg
b3Igc2lnbmFsIGNvbW1hbmQgdG8geW91ciB1c2Vyc3BhY2UgcXVldWUuCj4+Pgo+Pj4gNi4gSWYg
d2UgaGF2ZSBhbiBobW1fZmVuY2UgYXMgaW1wbGljaXQgb3IgZXhwbGljaXQgZGVwZW5kZW5jeSBm
b3IgY3JlYXRpbmcgYQo+Pj4gZG1hX2ZlbmNlIHdlIG11c3Qgd2FpdCBmb3IgdGhhdCBiZWZvcmUg
dGFraW5nIGFueSBsb2NrcyBvciByZXNlcnZpbmcKPj4+IHJlc291cmNlcy4KPj4+IDcuIElmIHdl
IGhhdmUgYSBkbWFfZmVuY2UgYXMgaW1wbGljaXQgb3IgZXhwbGljaXQgZGVwZW5kZW5jeSBmb3Ig
Y3JlYXRpbmcgYW4KPj4+IGhtbV9mZW5jZSB3ZSBjYW4gd2FpdCBsYXRlciBvbi4gU28gYnVzeSB3
YWl0aW5nIG9yIHNwZWNpYWwgV0FJVCBoYXJkd2FyZQo+Pj4gY29tbWFuZHMgYXJlIHZhbGlkLgo+
Pj4KPj4+IFRoaXMgcHJldmVudHMgaGFyZCBjdXRzLCBlLmcuIGNhbiBtaXggaG1tX2ZlbmNlcyBh
bmQgZG1hX2ZlbmNlcyBhdCB0aGUgc2FtZQo+Pj4gdGltZSBvbiB0aGUgaGFyZHdhcmUuCj4+Pgo+
Pj4gSW4gb3RoZXIgd29yZHMgd2UgY2FuIGhhdmUgYSBoaWdoIHByaW9yaXR5IGdmeCBxdWV1ZSBy
dW5uaW5nIGpvYnMgYmFzZWQgb24KPj4+IGRtYV9mZW5jZXMgYW5kIGEgbG93IHByaW9yaXR5IGNv
bXB1dGUgcXVldWUgcnVubmluZyBqb2JzIGJhc2VkIG9uCj4+PiBobW1fZmVuY2VzLgo+Pj4KPj4+
IE9ubHkgd2hlbiB3ZSBzd2l0Y2ggZnJvbSBobW1fZmVuY2UgdG8gZG1hX2ZlbmNlIHdlIG5lZWQg
dG8gYmxvY2sgdGhlCj4+PiBzdWJtaXNzaW9uIHVudGlsIGFsbCB0aGUgbmVjZXNzYXJ5IHJlc291
cmNlcyAoYm90aCBtZW1vcnkgYXMgd2VsbCBhcyBDVXMpCj4+PiBhcmUgYXZhaWxhYmxlLgo+Pj4K
Pj4+IFRoaXMgaXMgc29tZXdoYXQgYW4gZXh0ZW5zaW9uIHRvIHlvdXIgZ2FuZyBzdWJtaXQgaWRl
YS4KPj4gV2hhdCBpcyBobW1fZmVuY2UgPyBZb3Ugc2hvdWxkIG5vdCBoYXZlIGZlbmNlIHdpdGgg
aG1tIGF0IGFsbC4KPj4gU28gaSBhbSBraW5kIG9mIHNjYXJlIG5vdy4KPiBJIGtpbmQgb2YgaGFk
IHRoZSBzYW1lIHF1ZXN0aW9uIHRyeWluZyB0byBmb2xsb3cgQ2hyaXN0aWFuIGFuZCBEYW5pZWwn
cwo+IGRpc2N1c3Npb24uIEkgdGhpbmsgYW4gSE1NIGZlbmNlIHdvdWxkIGJlIGFueSBmZW5jZSBy
ZXN1bHRpbmcgZnJvbSB0aGUKPiBjb21wbGV0aW9uIG9mIGEgdXNlciBtb2RlIG9wZXJhdGlvbiBp
biBhIGNvbnRleHQgd2l0aCBITU0tYmFzZWQgbWVtb3J5Cj4gbWFuYWdlbWVudCB0aGF0IG1heSBz
dGFsbCBpbmRlZmluaXRlbHkgZHVlIHRvIHBhZ2UgZmF1bHRzLgoKSXQgd2FzIG1vcmUgb2YgYSBw
bGFjZWhvbGRlciBmb3Igc29tZXRoaW5nIHdoaWNoIGNhbiBiZSB1c2VkIGZvciBpbnRlciAKcHJv
Y2VzcyBzeW5jaHJvbml6YXRpb24uCgo+IEJ1dCBvbiBhIGhhcmR3YXJlIGVuZ2luZSB0aGF0IGNh
bm5vdCBwcmVlbXB0IHBhZ2UtZmF1bHRpbmcgd29yayBhbmQgaGFzCj4gbm90IHJlc2VydmVkIHJl
c291cmNlcyB0byBndWFyYW50ZWUgZm9yd2FyZCBwcm9ncmVzcyBmb3Iga2VybmVsIGpvYnMsIEkK
PiB0aGluayBhbGwgZmVuY2VzIHdpbGwgbmVlZCB0byBiZSBITU0gZmVuY2VzLCBiZWNhdXNlIGFu
eSB3b3JrIHN1Ym1pdHRlZAo+IHRvIHN1Y2ggYW4gZW5naW5lIGNhbiBzdGFsbCBieSBnZXR0aW5n
IHN0dWNrIGJlaGluZCBhIHN0YWxsZWQgdXNlciBtb2RlCj4gb3BlcmF0aW9uLgo+Cj4gU28gZm9y
IGV4YW1wbGUsIHlvdSBoYXZlIGEgRE1BIGVuZ2luZSB0aGF0IGNhbiBwcmVlbXB0IGR1cmluZyBw
YWdlCj4gZmF1bHRzLCBidXQgYSBncmFwaGljcyBlbmdpbmUgdGhhdCBjYW5ub3QuIFRoZW4gd29y
ayBzdWJtaXR0ZWQgdG8gdGhlCj4gRE1BIGVuZ2luZSBjYW4gdXNlIGRtYV9mZW5jZS4gQnV0IHdv
cmsgc3VibWl0dGVkIHRvIHRoZSBncmFwaGljcyBlbmdpbmUKPiBtdXN0IHVzZSBobW1fZmVuY2Uu
IFRvIGF2b2lkIGRlYWRsb2NrcywgZG1hX2ZlbmNlcyBtdXN0IG5ldmVyIGRlcGVuZCBvbgo+IGht
bV9mZW5jZXMgYW5kIHJlc29sdXRpb24gb2YgcGFnZSBmYXVsdHMgbXVzdCBuZXZlciBkZXBlbmQg
b24gaG1tX2ZlbmNlcy4KClllYWgsIGl0J3MgYSBiaXQgbW9yZSBjb21wbGljYXRlZCBidXQgaW4g
Z2VuZXJhbCB0aGF0IGZpdHMuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gUmVnYXJkcywKPiAg
wqAgRmVsaXgKPgo+Cj4+IENoZWVycywKPj4gSsODwqlyw4PCtG1lCj4+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
