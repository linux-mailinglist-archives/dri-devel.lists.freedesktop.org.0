Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3275F2F2106
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 21:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AA889A8C;
	Mon, 11 Jan 2021 20:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FD689A8C;
 Mon, 11 Jan 2021 20:45:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyvYrPDA7/k9eRt9AxldUXNfRUP/LnrAVlBaZ2VMlaxQUSesldbsgHlyw/pQYfNWFlZNpXTb/8Uf1f7kKURtnAflxuEsCWJEN7IEMNSlMCbuPDrgOoKjEVKiRrgn/Bz7UiBL4o+P204e3YBjDQthKQPQdMyjwL+RulFRxV6J07BZ+/t93wxe23Ugk1H1Go2LTRkDOx3UXilj9RNxja0NQb33KjyYGkwPm8m/GQNTxQYMVcNOWU4ZKEYXAB/s7BPBEBVd0nnFqyXpzWoDrm3sIpuXUEdtLXorun7q//Qf9CAUF5TOz2wWYIR/OWeMrnyOfPq5WofjBurIR2ceAmRQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ1dSmgC+uhjZGLSwH5NgIjzKZNy2lKEaEbMkN+NdNs=;
 b=VwtyhM5tWsTKj1PNRk/Vg4F5UTfmiWT35+MlhJmFDwMppIQeNm9XYSixACcdGfHegXBjslSfu3k8huU/BSdHYFdouujPQErPnVnNyaag7c/gXobzh4tyrzRkxqLTR0jNSs08qgSofgdJVIe3+6YmMZWNjNioqdlNB8XvzTGStjDHPFamzCNEBMCVVdVDl0qyQdoIa/PnSqTDVSen/1wuGqpJDJ8EcRI6L3yf6Jp1tkL2i1RLTL1kM8KNGdq6/52d4F+y/VMj1MXUDowBwB9JWHHZVB1WUWc/fgAtRcBNGU/Bp54ko3jpnFTj3JIZNDrXxoVF15u2pGXDwCtGJayRBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJ1dSmgC+uhjZGLSwH5NgIjzKZNy2lKEaEbMkN+NdNs=;
 b=Vu2/jKISoGRmg3RhQeR7k7euWHVKv+TiLHmVWu+6ru5Mz93tH921z1f1/0fji1MGIPEZo3RltOCDL6ZU3QvK8JCX9vsgAwhuxMJRXd8RcTJv0PipOmIfGWLQI4TsoySdNahlm4E3e1Znkkq4HnwP7wH170+0fgbv7eOzM90nl6k=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4400.namprd12.prod.outlook.com (2603:10b6:806:95::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 20:45:14 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 20:45:14 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: Daniel Vetter <daniel@ffwll.ch>
References: <X/c1IXX11chjHyl4@phenom.ffwll.local>
 <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
 <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
 <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
 <62645d03-704f-571e-bfe6-7d992b010a08@amd.com>
 <SN6PR12MB46235A1D04FDF4BBD9E60F94EAAE0@SN6PR12MB4623.namprd12.prod.outlook.com>
 <X/x5RD0xQxWUYvQ3@phenom.ffwll.local> <X/x5nXM7bZDl+MWR@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <db1e456d-8493-c94e-942e-ed19a2e1b931@amd.com>
Date: Mon, 11 Jan 2021 15:45:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <X/x5nXM7bZDl+MWR@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:b529:d7ba:9402:7ef6]
X-ClientProxiedBy: YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::11) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b529:d7ba:9402:7ef6]
 (2607:fea8:3edf:49b0:b529:d7ba:9402:7ef6) by
 YT1PR01CA0132.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 20:45:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ada244b3-d04c-4793-df5f-08d8b671cbec
X-MS-TrafficTypeDiagnostic: SA0PR12MB4400:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB440075ABE4EC998A286FC4F5EAAB0@SA0PR12MB4400.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X4KE+hAcoeJ33kld29Jut5HSVoIIZvDmngWUxr6mxbcpYuGVEBUJI6T8lE+GjosGxVsnKKLKK6MFdsfFQ8A96fN+IyXhgB9468uV8/W3dm5aEOO5mJgplySERIdwK58JoP3ixmrpCqMuBD4aNSbc2dlkxCFmX8ET8msqMc5Tcrn9EOj62fmJdVMM9hEd7XagNA8jCZVMjVYhPuXrBouw30yTMYl4SdqjgqizqQPoi8v8xVGUt4/Elz7G2N/2xBGh83rvxAl29uzVkdbo1Te+HXfn6RYZj+KLLcPii5OyjON8lBY8TD85BWyRdPnu65dTGPPPXlJRmSCIAt4ROHQZoxmIJIUgSTtpw5mtlH+qiDpNCypx+pMzZU3ePzKEwVktzQo9S1Jm1XGRC+/BpxRrkQD51haas2/IRQajPmRAqRPPGv/7CTzOZg80S+f2lUUI3mMQN9Tb+NuvARYvpEz+oB1O2j3GJ+2vvpRgZTkKecBEFtl0ns9kbZW7Ehf7gf0zJ+Bm9COIu3epIZVwlW0EEp2VXrkVC0YuB/5H3KuNdLr9ZgW2dg5w71yRJiNC8k+LXK7hV2PK7KzgPhyWOnxfaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(66476007)(966005)(6916009)(5660300002)(66556008)(86362001)(53546011)(83380400001)(16526019)(8936002)(66574015)(186003)(2906002)(6486002)(7416002)(66946007)(36756003)(2616005)(52116002)(54906003)(478600001)(83080400002)(316002)(31696002)(31686004)(45080400002)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WUVEaWRoeFhZcFJGQ3JrZk9LcGI5NXc1UHBxdW9HUk1hMUgvaC9QV05jQlZL?=
 =?utf-8?B?RzNoRVR2QXpOejFzRWtEQlRlcnVsWG1YV0duNlJsTFhTUjd5TWZTN1dReTRl?=
 =?utf-8?B?T0ZJNmdIem0zTUIzS1N4ZVBod1FqNUdIMTk1UERteDZ3MmRkNGR4NjNhZXgy?=
 =?utf-8?B?ZXVJNXlvdVI5MFBuVS8rcmVWc2liV2lETFdNVVBTY1dqK2R4b1ZELzZRZmdU?=
 =?utf-8?B?bTdMc0VET2w0WEllWEJPNUtpZWtWN1ZiQmNzZTJjVDhlUDBia3JndkRwRjRZ?=
 =?utf-8?B?VVR4OFZxdVVFbDBnTXBXcjgvSGNxM21SbkIrR3lkTkZmSDlXWWhXd0hNZExh?=
 =?utf-8?B?MHVubFVqMTRVOVRzeVJtQUc5YjBqUndiM3lLVGtxTk9GcDh6cjVCZHlHWGxo?=
 =?utf-8?B?bGJJZHJZRUhQUmhtcENvYnFDTnFCMEJwc3N4bjcrdWovWkxKdXZ0eFZJNGZq?=
 =?utf-8?B?c0V3QzNreXdMeVAwclNEOEJEMHN0VmlVKzA1N09RWXE1SU1zSHNLSU9qV3Zr?=
 =?utf-8?B?RUtXZndhK01mdklHWHJIbi9nc212NC8ySWJXQ0k5MXgySmVqZWZHam1FLzZH?=
 =?utf-8?B?SDhZMG1VMllvOUhSaEZDd2EwRHk0RUhhSXE2UTUwVVI0N0pBT01ja2d1REg5?=
 =?utf-8?B?R3FoWE1rTW1Ba29uK2dwUEdTcnVDZlVCL1cyYnVFSEExTlpCTlFrY1pCWDhT?=
 =?utf-8?B?bjJwYTQrSTRFZW94MXNYSmdRWjFoOENXWFFRYVRaSzc0Z3pEMG4yczNyL0Jx?=
 =?utf-8?B?cDd1V3pNL2gvZ0p6ZklKVHBoNWdmNDJrenZDTVRZWXpQU3hXRkF0dGRlTTFE?=
 =?utf-8?B?NGF6aGx6aDFYY09JeDUvRjg2VURyK3hIbUlKemdHd24wYzJkWC9xRzkxb0FD?=
 =?utf-8?B?VmIzUFNHNVRUMXplelFRNGIxSGNFZVYxSjMyZVkyVXprdzBQSFJHTURiZkM2?=
 =?utf-8?B?aHhCcFBMNkEzZkdSd29GYnoyTnlGOHh5bCsrb3l1dlRoZW5GRklnQ2J3RERo?=
 =?utf-8?B?Y01oNU5MTGp1R0xnYmlGb0RiUm1qMmEyQUI3MmZFVVZNNFllc21HY0NFOTBX?=
 =?utf-8?B?a1p6b3JpRXpYSXVtd0N6TmIxUFdQK1h5Q28rbUJ2cVlyTy9UTis0MnFIaDha?=
 =?utf-8?B?NWZ6RXhxZVdFVjYrUHlkTFMzdUl0eXgwNDFtLzkvY1Q0VHNnUnlYV2Q2QVp2?=
 =?utf-8?B?RGdwY1I0TVdKclNNVGl5dFFHa052K2VvOG14NHdjenNsalh4Nm9PUitzUHc0?=
 =?utf-8?B?S3pWSWpRd1ZzWFdIV2FHMnB2aGlrVWZmcHZaWjRXVU1NMVN1OGRiejBZQWxN?=
 =?utf-8?B?c0l4Zlh6SjdDWm1aeTBOTm1UWHBhd0pVZjNDT0EyRHk4bkVySmdZU004NHhR?=
 =?utf-8?B?Zkk4OWVVYVRzUTFIL2Mzd3ZlVy92TWZ2OVNhMmJBKzN4ZTZCNFJ1cjhwN0Y0?=
 =?utf-8?Q?+1rtwsvS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 20:45:14.0324 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: ada244b3-d04c-4793-df5f-08d8b671cbec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7/U6tDqXzVFOgq5hp3RgpO5v7mnWfwDScSDBbwiQ/bLBewbnvbb3moKuJEF2d3HvWprSvpjiY4csNQ5vnAeeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4400
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "yuq825@gmail.com" <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEvMTEvMjEgMTE6MTUgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4gT24gTW9uLCBKYW4g
MTEsIDIwMjEgYXQgMDU6MTM6NTZQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4gT24g
RnJpLCBKYW4gMDgsIDIwMjEgYXQgMDQ6NDk6NTVQTSArMDAwMCwgR3JvZHpvdnNreSwgQW5kcmV5
IHdyb3RlOgo+Pj4gT2sgdGhlbiwgSSBndWVzcyBJIHdpbGwgcHJvY2VlZCB3aXRoIHRoZSBkdW1t
eSBwYWdlcyBsaXN0IGltcGxlbWVudGF0aW9uIHRoZW4uCj4+Pgo+Pj4gQW5kcmV5Cj4+Pgo+Pj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IEZyb206IEtvZW5pZywgQ2hyaXN0
aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+Cj4+PiBTZW50OiAwOCBKYW51YXJ5IDIwMjEg
MDk6NTIKPj4+IFRvOiBHcm9kem92c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5j
b20+OyBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4+PiBDYzogYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz47IGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2ggPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+OyByb2Jo
QGtlcm5lbC5vcmcgPHJvYmhAa2VybmVsLm9yZz47IGwuc3RhY2hAcGVuZ3V0cm9uaXguZGUgPGwu
c3RhY2hAcGVuZ3V0cm9uaXguZGU+OyB5dXE4MjVAZ21haWwuY29tIDx5dXE4MjVAZ21haWwuY29t
PjsgZXJpY0BhbmhvbHQubmV0IDxlcmljQGFuaG9sdC5uZXQ+OyBEZXVjaGVyLCBBbGV4YW5kZXIg
PEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZyA8
Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBwcGFhbGFuZW5AZ21haWwuY29tIDxwcGFhbGFu
ZW5AZ21haWwuY29tPjsgV2VudGxhbmQsIEhhcnJ5IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPgo+
Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwMS8xMl0gZHJtOiBBZGQgZHVtbXkgcGFnZSBwZXIg
ZGV2aWNlIG9yIEdFTSBvYmplY3QKPj4+Cj4+PiBNaG0sIEknbSBub3QgYXdhcmUgb2YgYW55IGxl
dCBvdmVyIHBvaW50ZXIgYmV0d2VlbiBUVE0gYW5kIEdFTSBhbmQgd2UKPj4+IHdvcmtlZCBxdWl0
ZSBoYXJkIG9uIHJlZHVjaW5nIHRoZSBzaXplIG9mIHRoZSBhbWRncHVfYm8sIHNvIGFub3RoZXIK
Pj4+IGV4dHJhIHBvaW50ZXIganVzdCBmb3IgdGhhdCBjb3JuZXIgY2FzZSB3b3VsZCBzdWNrIHF1
aXRlIGEgYml0Lgo+PiBXZSBoYXZlIGEgdG9uIG9mIG90aGVyIHBvaW50ZXJzIGluIHN0cnVjdCBh
bWRncHVfYm8gKG9yIGFueSBvZiBpdCdzIGxvd2VyCj4+IHRoaW5ncykgd2hpY2ggYXJlIGZhaXJs
eSBzaW5nbGUtdXNlLCBzbyBJJ20gcmVhbGx5IG5vdCBtdWNoIHNlZWluZyB0aGUKPj4gcG9pbnQg
aW4gbWFraW5nIHRoaXMgYSBzcGVjaWFsIGNhc2UuIEl0IGFsc28gbWVhbnMgdGhlIGxpZmV0aW1l
IG1hbmFnZW1lbnQKPj4gYmVjb21lcyBhIGJpdCBpZmZ5LCBzaW5jZSB3ZSBjYW4ndCB0aHJvdyBh
d2F5IHRoZSBkdW1teSBwYWdlIHRoZW4gdGhlIGxhc3QKPj4gcmVmZXJlbmNlIHRvIHRoZSBibyBp
cyByZWxlYXNlZCAoc2luY2Ugd2UgZG9uJ3QgdHJhY2sgaXQgdGhlcmUpLCBidXQgb25seQo+PiB3
aGVuIHRoZSBsYXN0IHBvaW50ZXIgdG8gdGhlIGRldmljZSBpcyByZWxlYXNlZC4gUG90ZW50aWFs
bHkgdGhpcyBtZWFucyBhCj4+IHBpbGUgb2YgZGFuZ2xpbmcgcGFnZXMgaGFuZ2luZyBhcm91bmQg
Zm9yIHRvbyBsb25nLgo+IEFsc28gaWYgeW91IHJlYWxseSwgcmVhbGx5LCByZWFsbHkgd2FudCB0
byBoYXZlIHRoaXMgbGlzdCwgcGxlYXNlIGRvbid0Cj4gcmVpbnZlbnQgaXQgc2luY2Ugd2UgaGF2
ZSBpdCBhbHJlYWR5LiBkcm1tXyBpcyBleGFjdGx5IG1lYW50IGZvciByZXNvdXJjZXMKPiB0aGF0
IHNob3VsZCBiZSBmcmVlZCB3aGVuIHRoZSBmaW5hbCBkcm1fZGV2aWNlIHJlZmVyZW5jZSBkaXNh
cHBlYXJzLgo+IC1EYW5pZWwKCgpJIG1heWJlIHdhcyBlYWdlciB0byBlYXJseSwgc2VlIGkgbmVl
ZCB0byBleHBsaWNpdGx5IGFsbG9jYXRlIHRoZSBkdW1teSBwYWdlIAp1c2luZyBwYWdlX2FsbG9j
IHNvCmkgY2Fubm90IHVzZSBkcm1tX2ttYWxsb2MgZm9yIHRoaXMsIHNvIG9uY2UgYWdhaW4gbGlr
ZSB3aXRoIHRoZSBsaXN0IGkgbmVlZCB0byAKd3JhcCBpdCB3aXRoIGEgY29udGFpbmVyIHN0cnVj
dAp3aGljaCBpIGNhbiB0aGVuIGFsbG9jYXRlIHVzaW5nIGRybW1fa21hbGxvYyBhbmQgaW5zaWRl
IHRoZXJlIHdpbGwgYmUgcGFnZSAKcG9pbnRlci4gQnV0IHRoZW4Kb24gcmVsZWFzZSBpdCBuZWVk
cyB0byBmcmVlIHRoZSBwYWdlIGFuZCBzbyBpIHN1cHBvc2VkbHkgbmVlZCB0byB1c2UgZHJtbV9h
ZGRfYWN0aW9uCnRvIGZyZWUgdGhlIHBhZ2UgYmVmb3JlIHRoZSBjb250YWluZXIgc3RydWN0IGlz
IHJlbGVhc2VkIGJ1dCBkcm1tX2ttYWxsb2MgCmRvZXNuJ3QgYWxsb3cgdG8gc2V0CnJlbGVhc2Ug
YWN0aW9uIG9uIHN0cnVjdCBhbGxvY2F0aW9uLiBTbyBJIGNyZWF0ZWQgYSBuZXcgZHJtbV9rbWFs
bG9jX3dpdGhfYWN0aW9uIApBUEkgZnVuY3Rpb24KYnV0IHRoZW4geW91IGFsc28gbmVlZCB0byBz
dXBwbHkgdGhlIG9wdGlvbmFsIGRhdGEgcG9pbnRlciBmb3IgdGhlIHJlbGVhc2UgCmFjdGlvbiAo
dGhlIHN0cnVjdCBwYWdlIGluIHRoaXMgY2FzZSkKYW5kIHNvIHRoaXMgYWxsIGJlY29tZXMgYSBi
aXQgb3ZlcmNvbXBsaWNhdGVkIChidXQgZG9hYmxlKS4gSXMgdGhpcyBleHRyYSBBUEkgCndvcnRo
IGFkZGluZyA/IE1heWJlIGl0IGNhbgpiZSB1c2VmdWwgaW4gZ2VuZXJhbC4KCkFuZHJleQoKCgo+
ICAgCj4+IElmIHlvdSBuZWVkIHNvbWUgaWRlYXMgZm9yIHJlZHVuZGFudCBwb2ludGVyczoKPj4g
LSBkZXN0cm95IGNhbGxiYWNrIChraW5kYSBub3QgY29vbCB0byBub3QgaGF2ZSB0aGlzIGNvbnN0
IGFueXdheSksIHdlCj4+ICAgIGNvdWxkIHJlZmNvdW50IGl0IGFsbCB3aXRoIHRoZSBvdmVyYWxs
IGdlbSBiby4gUXVpdGUgYSBiaXQgb2Ygd29yay4KPj4gLSBiZGV2IHBvaW50ZXIsIGlmIHdlIG1v
dmUgdGhlIGRldmljZSB0dG0gc3R1ZmYgaW50byBzdHJ1Y3QgZHJtX2RldmljZSwgb3IKPj4gICAg
Y3JlYXRlIGEgY29tbW9uIHN0cnVjdCB0dG1fZGV2aWNlLCB3ZSBjYW4gZGl0Y2ggdGhhdAo+PiAt
IFdlIGNvdWxkIHByb2JhYmx5IG1lcmdlIGEgZmV3IG9mIHRoZSBmaWVsZHMgYW5kIGZpbmQgOCBi
eXRlcyBzb21ld2hlcmUKPj4gLSB3ZSBzdGlsbCBoYXZlIDIga3JlZnMsIHdvdWxkIHByb2JhYmx5
IG5lZWQgdG8gZml4IHRoYXQgYmVmb3JlIHdlIGNhbgo+PiAgICBtZXJnZSB0aGUgZGVzdHJveSBj
YWxsYmFja3MKPj4KPj4gU28gdGhlcmUncyBwbGVudHkgb2Ygcm9vbSBzdGlsbCwgaWYgdGhlIHNp
emUgb2YgYSBibyBzdHJ1Y3QgaXMgcmVhbGx5IHRoYXQKPj4gY3JpdGljYWwuIEltbyBpdCdzIG5v
dC4KPj4KPj4KPj4+IENocmlzdGlhbi4KPj4+Cj4+PiBBbSAwOC4wMS4yMSB1bSAxNTo0NiBzY2hy
aWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+IERhbmllbCBoYWQgc29tZSBvYmplY3Rpb25zIHRv
IHRoaXMgKHNlZSBiZWxsb3cpIGFuZCBzbyBJIGd1ZXNzIEkgbmVlZAo+Pj4+IHlvdSBib3RoIHRv
IGFncmVlIG9uIHRoZSBhcHByb2FjaCBiZWZvcmUgSSBwcm9jZWVkLgo+Pj4+Cj4+Pj4gQW5kcmV5
Cj4+Pj4KPj4+PiBPbiAxLzgvMjEgOTozMyBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+
Pj4gQW0gMDguMDEuMjEgdW0gMTU6MjYgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+
IEhleSBDaHJpc3RpYW4sIGp1c3QgYSBwaW5nLgo+Pj4+PiBXYXMgdGhlcmUgYW55IHF1ZXN0aW9u
IGZvciBtZSBoZXJlPwo+Pj4+Pgo+Pj4+PiBBcyBmYXIgYXMgSSBjYW4gc2VlIHRoZSBiZXN0IGFw
cHJvYWNoIHdvdWxkIHN0aWxsIGJlIHRvIGZpbGwgdGhlIFZNQQo+Pj4+PiB3aXRoIGEgc2luZ2xl
IGR1bW15IHBhZ2UgYW5kIGF2b2lkIHBvaW50ZXJzIGluIHRoZSBHRU0gb2JqZWN0Lgo+Pj4+Pgo+
Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Cj4+Pj4+PiBBbmRyZXkKPj4+Pj4+Cj4+Pj4+PiBPbiAxLzcv
MjEgMTE6MzcgQU0sIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+Pj4+IE9uIDEvNy8yMSAx
MTozMCBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+Pj4+Pj4gT24gVGh1LCBKYW4gMDcsIDIw
MjEgYXQgMTE6MjY6NTJBTSAtMDUwMCwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pj4+Pj4+
PiBPbiAxLzcvMjEgMTE6MjEgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+Pj4+Pj4gT24g
VHVlLCBKYW4gMDUsIDIwMjEgYXQgMDQ6MDQ6MTZQTSAtMDUwMCwgQW5kcmV5IEdyb2R6b3Zza3kg
d3JvdGU6Cj4+Pj4+Pj4+Pj4+IE9uIDExLzIzLzIwIDM6MDEgQU0sIENocmlzdGlhbiBLw7ZuaWcg
d3JvdGU6Cj4+Pj4+Pj4+Pj4+PiBBbSAyMy4xMS4yMCB1bSAwNTo1NCBzY2hyaWViIEFuZHJleSBH
cm9kem92c2t5Ogo+Pj4+Pj4+Pj4+Pj4+IE9uIDExLzIxLzIwIDk6MTUgQU0sIENocmlzdGlhbiBL
w7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pj4+IEFtIDIxLjExLjIwIHVtIDA2OjIxIHNjaHJpZWIg
QW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+Pj4+Pj4+PiBXaWxsIGJlIHVzZWQgdG8gcmVyb3V0
ZSBDUFUgbWFwcGVkIEJPJ3MgcGFnZSBmYXVsdHMgb25jZQo+Pj4+Pj4+Pj4+Pj4+Pj4gZGV2aWNl
IGlzIHJlbW92ZWQuCj4+Pj4+Pj4+Pj4+Pj4+IFVmZiwgb25lIHBhZ2UgZm9yIGVhY2ggZXhwb3J0
ZWQgRE1BLWJ1Zj8gVGhhdCdzIG5vdAo+Pj4+Pj4+Pj4+Pj4+PiBzb21ldGhpbmcgd2UgY2FuIGRv
Lgo+Pj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4+PiBXZSBuZWVkIHRvIGZpbmQgYSBkaWZmZXJl
bnQgYXBwcm9hY2ggaGVyZS4KPj4+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+Pj4gQ2FuJ3Qgd2Ug
Y2FsbCBhbGxvY19wYWdlKCkgb24gZWFjaCBmYXVsdCBhbmQgbGluayB0aGVtIHRvZ2V0aGVyCj4+
Pj4+Pj4+Pj4+Pj4+IHNvIHRoZXkgYXJlIGZyZWVkIHdoZW4gdGhlIGRldmljZSBpcyBmaW5hbGx5
IHJlYXBlZD8KPj4+Pj4+Pj4+Pj4+PiBGb3Igc3VyZSBiZXR0ZXIgdG8gb3B0aW1pemUgYW5kIGFs
bG9jYXRlIG9uIGRlbWFuZCB3aGVuIHdlIHJlYWNoCj4+Pj4+Pj4+Pj4+Pj4gdGhpcyBjb3JuZXIg
Y2FzZSwgYnV0IHdoeSB0aGUgbGlua2luZyA/Cj4+Pj4+Pj4+Pj4+Pj4gU2hvdWxkbid0IGRybV9w
cmltZV9nZW1fZGVzdHJveSBiZSBnb29kIGVub3VnaCBwbGFjZSB0byBmcmVlID8KPj4+Pj4+Pj4+
Pj4+IEkgd2FudCB0byBhdm9pZCBrZWVwaW5nIHRoZSBwYWdlIGluIHRoZSBHRU0gb2JqZWN0Lgo+
Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFdoYXQgd2UgY2FuIGRvIGlzIHRvIGFsbG9jYXRlIGEg
cGFnZSBvbiBkZW1hbmQgZm9yIGVhY2ggZmF1bHQKPj4+Pj4+Pj4+Pj4+IGFuZCBsaW5rCj4+Pj4+
Pj4+Pj4+PiB0aGUgdG9nZXRoZXIgaW4gdGhlIGJkZXYgaW5zdGVhZC4KPj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+PiBBbmQgd2hlbiB0aGUgYmRldiBpcyB0aGVuIGZpbmFsbHkgZGVzdHJveWVkIGFm
dGVyIHRoZSBsYXN0Cj4+Pj4+Pj4+Pj4+PiBhcHBsaWNhdGlvbgo+Pj4+Pj4+Pj4+Pj4gY2xvc2Vk
IHdlIGNhbiBmaW5hbGx5IHJlbGVhc2UgYWxsIG9mIHRoZW0uCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4+Pj4+PiBIZXksIHN0YXJ0ZWQgdG8gaW1wbGVtZW50IHRo
aXMgYW5kIHRoZW4gcmVhbGl6ZWQgdGhhdCBieQo+Pj4+Pj4+Pj4+PiBhbGxvY2F0aW5nIGEgcGFn
ZQo+Pj4+Pj4+Pj4+PiBmb3IgZWFjaCBmYXVsdCBpbmRpc2NyaW1pbmF0ZWx5Cj4+Pj4+Pj4+Pj4+
IHdlIHdpbGwgYmUgYWxsb2NhdGluZyBhIG5ldyBwYWdlIGZvciBlYWNoIGZhdWx0aW5nIHZpcnR1
YWwKPj4+Pj4+Pj4+Pj4gYWRkcmVzcyB3aXRoaW4gYQo+Pj4+Pj4+Pj4+PiBWQSByYW5nZSBiZWxv
bmdpbmcgdGhlIHNhbWUgQk8KPj4+Pj4+Pj4+Pj4gYW5kIHRoaXMgaXMgb2J2aW91c2x5IHRvbyBt
dWNoIGFuZCBub3QgdGhlIGludGVudGlvbi4gU2hvdWxkIEkKPj4+Pj4+Pj4+Pj4gaW5zdGVhZCB1
c2UKPj4+Pj4+Pj4+Pj4gbGV0J3Mgc2F5IGEgaGFzaHRhYmxlIHdpdGggdGhlIGhhc2gKPj4+Pj4+
Pj4+Pj4ga2V5IGJlaW5nIGZhdWx0aW5nIEJPIGFkZHJlc3MgdG8gYWN0dWFsbHkga2VlcCBhbGxv
Y2F0aW5nIGFuZAo+Pj4+Pj4+Pj4+PiByZXVzaW5nIHNhbWUKPj4+Pj4+Pj4+Pj4gZHVtbXkgemVy
byBwYWdlIHBlciBHRU0gQk8KPj4+Pj4+Pj4+Pj4gKG9yIGZvciB0aGF0IG1hdHRlciBEUk0gZmls
ZSBvYmplY3QgYWRkcmVzcyBmb3Igbm9uIGltcG9ydGVkCj4+Pj4+Pj4+Pj4+IEJPcykgPwo+Pj4+
Pj4+Pj4+IFdoeSBkbyB3ZSBuZWVkIGEgaGFzaHRhYmxlPyBBbGwgdGhlIHN3IHN0cnVjdHVyZXMg
dG8gdHJhY2sgdGhpcwo+Pj4+Pj4+Pj4+IHNob3VsZAo+Pj4+Pj4+Pj4+IHN0aWxsIGJlIGFyb3Vu
ZDoKPj4+Pj4+Pj4+PiAtIGlmIGdlbV9iby0+ZG1hX2J1ZiBpcyBzZXQgdGhlIGJ1ZmZlciBpcyBj
dXJyZW50bHkgZXhwb3J0ZWQgYXMKPj4+Pj4+Pj4+PiBhIGRtYS1idWYsCj4+Pj4+Pj4+Pj4gICAg
ICBzbyBkZWZlbnNpdmVseSBhbGxvY2F0ZSBhIHBlci1ibyBwYWdlCj4+Pj4+Pj4+Pj4gLSBvdGhl
cndpc2UgYWxsb2NhdGUgYSBwZXItZmlsZSBwYWdlCj4+Pj4+Pj4+PiBUaGF0IGV4YWN0bHkgd2hh
dCB3ZSBoYXZlIGluIGN1cnJlbnQgaW1wbGVtZW50YXRpb24KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+IE9yIGlzIHRoZSBpZGVhIHRvIHNhdmUgdGhlIHN0cnVjdCBwYWdlICogcG9pbnRl
cj8gVGhhdCBmZWVscyBhCj4+Pj4+Pj4+Pj4gYml0IGxpa2UKPj4+Pj4+Pj4+PiBvdmVyLW9wdGlt
aXppbmcgc3R1ZmYuIEJldHRlciB0byBoYXZlIGEgc2ltcGxlIGltcGxlbWVudGF0aW9uCj4+Pj4+
Pj4+Pj4gZmlyc3QgYW5kCj4+Pj4+Pj4+Pj4gdGhlbiB0dW5lIGl0IGlmIChhbmQgb25seSBpZikg
YW55IHBhcnQgb2YgaXQgYmVjb21lcyBhIHByb2JsZW0KPj4+Pj4+Pj4+PiBmb3Igbm9ybWFsCj4+
Pj4+Pj4+Pj4gdXNhZ2UuCj4+Pj4+Pj4+PiBFeGFjdGx5IC0gdGhlIGlkZWEgaXMgdG8gYXZvaWQg
YWRkaW5nIGV4dHJhIHBvaW50ZXIgdG8KPj4+Pj4+Pj4+IGRybV9nZW1fb2JqZWN0LAo+Pj4+Pj4+
Pj4gQ2hyaXN0aWFuIHN1Z2dlc3RlZCB0byBpbnN0ZWFkIGtlZXAgYSBsaW5rZWQgbGlzdCBvZiBk
dW1teSBwYWdlcwo+Pj4+Pj4+Pj4gdG8gYmUKPj4+Pj4+Pj4+IGFsbG9jYXRlZCBvbiBkZW1hbmQg
b25jZSB3ZSBoaXQgYSB2bV9mYXVsdC4gSSB3aWxsIHRoZW4gYWxzbwo+Pj4+Pj4+Pj4gcHJlZmF1
bHQgdGhlIGVudGlyZQo+Pj4+Pj4+Pj4gVkEgcmFuZ2UgZnJvbSB2bWEtPnZtX2VuZCAtIHZtYS0+
dm1fc3RhcnQgdG8gdm1hLT52bV9lbmQgYW5kIG1hcAo+Pj4+Pj4+Pj4gdGhlbQo+Pj4+Pj4+Pj4g
dG8gdGhhdCBzaW5nbGUgZHVtbXkgcGFnZS4KPj4+Pj4+Pj4gVGhpcyBzdHJvbmdseSBmZWVscyBs
aWtlIHByZW1hdHVyZSBvcHRpbWl6YXRpb24uIElmIHlvdSdyZSB3b3JyaWVkCj4+Pj4+Pj4+IGFi
b3V0Cj4+Pj4+Pj4+IHRoZSBvdmVyaGVhZCBvbiBhbWRncHUsIHBheSBkb3duIHRoZSBkZWJ0IGJ5
IHJlbW92aW5nIG9uZSBvZiB0aGUKPj4+Pj4+Pj4gcmVkdW5kYW50Cj4+Pj4+Pj4+IHBvaW50ZXJz
IGJldHdlZW4gZ2VtIGFuZCB0dG0gYm8gc3RydWN0cyAoSSB0aGluayB3ZSBzdGlsbCBoYXZlCj4+
Pj4+Pj4+IHNvbWUpIDotKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBVbnRpbCB3ZSd2ZSBudWtlZCB0aGVz
ZSBlYXN5Jm9idmlvdXMgb25lcyB3ZSBzaG91bGRuJ3QgcGxheSAiYXZvaWQgMQo+Pj4+Pj4+PiBw
b2ludGVyIGp1c3QgYmVjYXVzZSIgZ2FtZXMgd2l0aCBoYXNodGFibGVzLgo+Pj4+Pj4+PiAtRGFu
aWVsCj4+Pj4+Pj4KPj4+Pj4+PiBXZWxsLCBpZiB5b3UgYW5kIENocmlzdGlhbiBjYW4gYWdyZWUg
b24gdGhpcyBhcHByb2FjaCBhbmQgc3VnZ2VzdAo+Pj4+Pj4+IG1heWJlIHdoYXQgcG9pbnRlciBp
cwo+Pj4+Pj4+IHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92ZWQgZnJvbSBHRU0gc3RydWN0IHNv
IHdlIGNhbiB1c2UgdGhlCj4+Pj4+Pj4gJ2NyZWRpdCcgdG8gYWRkIHRoZSBkdW1teSBwYWdlCj4+
Pj4+Pj4gdG8gR0VNIEkgd2lsbCBiZSBoYXBweSB0byBmb2xsb3cgdGhyb3VnaC4KPj4+Pj4+Pgo+
Pj4+Pj4+IFAuUyBIYXNoIHRhYmxlIGlzIG9mZiB0aGUgdGFibGUgYW55d2F5IGFuZCB3ZSBhcmUg
dGFsa2luZyBvbmx5Cj4+Pj4+Pj4gYWJvdXQgbGlua2VkIGxpc3QgaGVyZSBzaW5jZSBieSBwcmVm
YXVsdGluZwo+Pj4+Pj4+IHRoZSBlbnRpcmUgVkEgcmFuZ2UgZm9yIGEgdm1mLT52bWEgaSB3aWxs
IGJlIGF2b2lkaW5nIHJlZHVuZGFudAo+Pj4+Pj4+IHBhZ2UgZmF1bHRzIHRvIHNhbWUgVk1BIFZB
IHJhbmdlIGFuZCBzbwo+Pj4+Pj4+IGRvbid0IG5lZWQgdG8gc2VhcmNoIGFuZCByZXVzZSBhbiBl
eGlzdGluZyBkdW1teSBwYWdlIGJ1dCBzaW1wbHkKPj4+Pj4+PiBjcmVhdGUgYSBuZXcgb25lIGZv
ciBlYWNoIG5leHQgZmF1bHQuCj4+Pj4+Pj4KPj4+Pj4+PiBBbmRyZXkKPj4gLS0gCj4+IERhbmll
bCBWZXR0ZXIKPj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCj4+IGh0dHBz
Oi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJG
JTJGYmxvZy5mZndsbC5jaCUyRiZhbXA7ZGF0YT0wNCU3QzAxJTdDYW5kcmV5Lmdyb2R6b3Zza3kl
NDBhbWQuY29tJTdDNGI1ODFjNTVkZjIwNGNhM2QwNzQwOGQ4YjY0YzFkYjglN0MzZGQ4OTYxZmU0
ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDU5Nzg1MzIxNzk4MzkzJTdDVW5r
bm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxD
SkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPUV2dkFpcDh2czlm
elZSUzFyYjByNU9EaUJNbmd4UHVJOUdLUjIlMkYlMkIyTHpFJTNEJmFtcDtyZXNlcnZlZD0wCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
