Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D6D362FB5
	for <lists+dri-devel@lfdr.de>; Sat, 17 Apr 2021 13:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBBD6E1FB;
	Sat, 17 Apr 2021 11:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8376B6E1FB
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Apr 2021 11:54:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpY05T5nEfeQB1K8MjrJkqLojQ6p8Cr6T1bbj+fIS8GXYdepJJjZJHoVa0LgQsit1sBVc/CLfJzstiNF1YFDfysjOY/SOSuzzuGwvhxC6WgbjEcez8a88B7zl3PrZeb6XKfqT+pMBt4qEESwBG2fSrZljvmtfGN8s2Rf8cSehNCJj0mrq26CmW/SsxnxYAwbThBS5KOjK19RODLJycvnnXY4p1J8bcVCo0bGIusJQfiQDcTCn/999FapaCmhyjCbEpWfCCE2Hqho+XF+5h/iOI20bsBxLEH4sRjt2Mb1ivvgD/f9T9/1jjvmMQt8HqI88w5Pb+kCoJIRP2I44/klSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQBjzIjLx0w0wr9I99EFQiTbt7XnI75XPu0IdHMizKo=;
 b=amOPy+y3LNCttir0+KU8RfC9gzREiIBWI5i+MSif0twD8+nkqtnd+E+zyU30xMmOdh94zSg3UoKMnCE5SBT/ca2Vk3Lpxg/HpRzf0f75tFuyCZtrv/GG+Jp1npqOgB5Y/ge587DvhdvzXslvXpP1DjqA4O5KZkMn12+wRNDVL4LXzBm0CZeFUTJ7eTZauFG1FTvZ0UVoz3Il8231ujqpg4QPTukUeHoJc57tdpr1UZK8+vJ/wQEJa+ZJpHq644vtYuPazRpSN8N9BaQ+nGhH5LFWYR+EPd9UrltiSUiuA3BeyypSMfnqnm6Q2JEtYmw+dtCrfRyZW4WdxS9NBpi9MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQBjzIjLx0w0wr9I99EFQiTbt7XnI75XPu0IdHMizKo=;
 b=bwYYGRRWXAEJbUbRuto2VIMyjZbOcB1+KTqEktFcAHXvHvfxMWkKtrsobQfktaMV7mky+eUDp2bA2rUtX6KUSqaMHc6a/ws8YX4/0zqCr0AC8HbTXTrplXEaTo4CUNswxEDPAHp/gFIuzwr8809N0IqBNfJVn0JgqxNvZIKXM5o=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.20; Sat, 17 Apr
 2021 11:54:23 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4042.020; Sat, 17 Apr 2021
 11:54:23 +0000
Subject: Re: [PATCH v4] dma-buf: Add DmaBufTotal counter in meminfo
To: Peter.Enderborg@sony.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, sumit.semwal@linaro.org, adobriyan@gmail.com,
 akpm@linux-foundation.org, songmuchun@bytedance.com, guro@fb.com,
 shakeelb@google.com, mhocko@suse.com, neilb@suse.de,
 samitolvanen@google.com, rppt@kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 willy@infradead.org
References: <20210417104032.5521-1-peter.enderborg@sony.com>
 <d983aef9-3dde-54cc-59a0-d9d42130b513@amd.com>
 <d822adcc-2a3c-1923-0d1d-4ecabd76a0e5@sony.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <2420ea7a-4746-b11a-3c0e-2f962059d071@amd.com>
Date: Sat, 17 Apr 2021 13:54:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <d822adcc-2a3c-1923-0d1d-4ecabd76a0e5@sony.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:748d:44e6:d01a:aa0f]
X-ClientProxiedBy: AM3PR07CA0119.eurprd07.prod.outlook.com
 (2603:10a6:207:7::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:748d:44e6:d01a:aa0f]
 (2a02:908:1252:fb60:748d:44e6:d01a:aa0f) by
 AM3PR07CA0119.eurprd07.prod.outlook.com (2603:10a6:207:7::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.7 via Frontend Transport; Sat, 17 Apr 2021 11:54:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bd11ce3-5783-403d-d131-08d901978ab1
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3935A61DA168554734A7F478834B9@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Xw93LRvz1h7FL7aGpgxtvrpHTi7TS6DAY3TFgfzaPlAnMVofLaSPRzGXyp4ks0+8UqUI6yQFpc8ZAvlwpgrUWplj79MhDnzMBHrO+IN+UcC2dLea27eRJgBrFbql1/RANF5L9e7inKX9enCGiOXuLQdDW9RQd2plR7XIDixQNH6g5d2YIrdjQN46Zmxk9dZEDxbLSan+OOvD9JwMDfbKOWkoutpE0pq0MvVA6A9fbqgT1Ak2qou7mRBiHJCYdKuEE33hzRo/+yXMWDlqSzzV3aDVqBN+Mx8WF7sKcwLJ5L0xfcd60GFKE/vl2aR4BzMLiak8FaY6NRwx5REmYKFb6BGnzFAYFHyh6XMa56AG+07pkDwLxHQ4P62OhciPiNaqZd6942wmSBvdu+uKjtIOUc4LiosTVLGtv+nO/GnA2jNzoMlXYzHX+57oD2nPtqJAw4FNw4uFjbEi/HSxE3Q6Z4A+02EpukmPeKp8t6roDigHtbXCtLOuBLXQ4tEseT60duYK+sgP/w+D4KKYb7AfjuIQ3MWjioTj+lbz0ZU9Md6DiOBneWVng+KdfUtNSWvFRLGQT6UwAGUMSdbRp1vYhY7OMoQvs/iMkYIycjTVtLxdqK4vfAqRPbiDQaOQ6+Cvfswo1LcRyZ803GFQXFo1pGQGPd+qebEnxa0Hqt6z3RJz3+yuY6Toas5pHxCK4PS+5DjG9HGc4C26N4MQ9JWTw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(136003)(366004)(6666004)(8936002)(8676002)(478600001)(2616005)(36756003)(16526019)(2906002)(52116002)(31696002)(7416002)(5660300002)(186003)(31686004)(6486002)(316002)(921005)(86362001)(38100700002)(83380400001)(66946007)(66556008)(53546011)(66574015)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eHR2b2ROT0JFVmFMMmliNTBWZkd4bjZwcVhBemVFQ1ByM2ErZXVQakRNbjBj?=
 =?utf-8?B?YjhqVHFOdHhBQ09kZTgwR01STExzUWRWWDBRbkYxb0IrbUsyKzBjRldXVVMv?=
 =?utf-8?B?b1VVcGtIWkFVVzV1UEc5THQxZ0xMdkxmdkZtQW5BVUhuNkNTZjhXNStOYXB6?=
 =?utf-8?B?K28vcEtqV0JNekIzWHNzd1FJUXBKSHppY2VCUE9tVDdXcVlCQW1oQktPUThz?=
 =?utf-8?B?blJPSlRNM1hIOUY0SGI1YlJpRHdHck5mUURwZEVIeCtHdFBiTGNRdVBNTDJp?=
 =?utf-8?B?VnZ1SFpKcjh5KzRmMlZDSFFUZEtCYmo3LzdwcWxCMnViRFd5OU9qYmxmM3gw?=
 =?utf-8?B?bnhrbnNzY1dBYlMyQTJlQXNaUWtoVk5ZQUpGQlc1TFNPZWRaK3lqVTM3Rms0?=
 =?utf-8?B?RzFUbVR2YXNHRDRyR1ZPdDJ4bUlQaXlLai9UTCt2cUladGJ3M2JjTWwvQmFp?=
 =?utf-8?B?VHRTbW82OHg3aVJjTk03SlNsWDdhd2x5WDFnUXdha1h1S2EyOXZiaStzcGZR?=
 =?utf-8?B?YXhJU01WZmNhNkdTQjBCWUxoTFVlNkFhZWpPMDM3UWpTcnJXdVJPa3FwT1k4?=
 =?utf-8?B?ZjlKV1l3Tm1JY0tCT3R3K0I5V0pNODRvVTl5TmVMWmllblRxdnNQWm85eDQr?=
 =?utf-8?B?ZjlXZUVPRGJaNklqT2NpWHpSeUNCVXlqUDdUSU9oeDd2L21pMDJFM2hFWmZG?=
 =?utf-8?B?cEhXVmVoaENpY3dlV0ltNFg1Q3VlUlFIclZDMXYzaDBvRVIyeEppTFBSTS9j?=
 =?utf-8?B?SE1HbkRqTmQ3N0xtYTZFcXA2UkdTQ2ZnQ0c3dlczTEtTZC8yQmRTUmJRNzlP?=
 =?utf-8?B?eWE0Y3JmV0FqT2VVeU1BbFhlbGo4MHRybHRVb01ORDg2K3VmUmVVd0g0dklJ?=
 =?utf-8?B?cm93MTRsTnBoRThHRDMycFN5VTA2OEEvdzA2eEFiNWJNTUZEbndmSUNNeDZh?=
 =?utf-8?B?MWhmb2d3VFlZVHRnSzNnZjNvQUZmZWdzWXVFdkF2ZlVXWlk3VXIxRlhGcEtw?=
 =?utf-8?B?WFZsank5OWw0TkdCQVp5eE1obEUraHlYVTMrdkFYOTEyRjFOa1Y0OFJjcHJQ?=
 =?utf-8?B?T1VGSzB2ZER5S3FrWDdCL2tnVVdTKzI2dk1YUlNneHc1aGxtNUF6OUJ2encx?=
 =?utf-8?B?Zk1BWjJwOVAzMlhnNXc3S3hTM2RURitFcnNtMzFrVUVRWHBNdnQ1bUNNTEgv?=
 =?utf-8?B?bVJkWGZLWUdLSmthUCtsM2FIUXd5N3FmUXI4ODVOa3ZIcXQ5MlRXWTZGbUZ5?=
 =?utf-8?B?SHVSUFNCdTBsemxJbzRrTDlmcVN6TlZJaWdKQjJFaFRQQkZXbE9SUHl0enRs?=
 =?utf-8?B?b3Voelo0ejh4cE5lWWFtL0xWcXh5OW1XWGhsa3llNzZDSkRYdTRXeHBtYmVK?=
 =?utf-8?B?L2t5V3BEY3lHa0JQcWhIOHlPb2xoakVjSlpQZ0VWRmp0SXZFekpybVBOVTFV?=
 =?utf-8?B?bzZ3MEJqTnkvMEhVclBLZmd1OXEvZGpneDZpYzFkVlpTR25QSy9zb21hSTky?=
 =?utf-8?B?YXBBWTVtaUp1K0Y5eEwyaUFZa21DVlBGdkErTDVTN3NmbHRuRnNWTXJMMTli?=
 =?utf-8?B?cGlvR1ZiUzBhOTFoSFpDM3dtQjNkYkNzcGRmREVoWXZ3YXdWcXpEYWlITTZa?=
 =?utf-8?B?WnZqZkxQVjRIeUxFR1plZkE0OE41N256WGVuTUEwTnREMVkwb1FuaHU1S20w?=
 =?utf-8?B?bTNSOE1waENTcTdGMVk1bmI1blE1bkM0a3FEMVZJdy96TWpqeWlmaUFxOThU?=
 =?utf-8?B?dEJhWWhkUFlZdmU5eFBvMkxaSVdCTjdPTEQ5UmZUVDVVKythVkZDVXg2N3VM?=
 =?utf-8?B?TWdXdHZXNEhQdFZWejJVV2IxdjU5RG1ienFQOUJZVlZVMlBMQi82KzlnQzYr?=
 =?utf-8?Q?9+Q3gPqrrK/sQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd11ce3-5783-403d-d131-08d901978ab1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2021 11:54:22.9863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXSOarw+qQbHr4VfSHULaNDK4O+eUHWfsrG+97QAj0BFj4QMGWhNveVF2HOxm23Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDQuMjEgdW0gMTM6MjAgc2NocmllYiBQZXRlci5FbmRlcmJvcmdAc29ueS5jb206Cj4g
T24gNC8xNy8yMSAxMjo1OSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTcuMDQu
MjEgdW0gMTI6NDAgc2NocmllYiBQZXRlciBFbmRlcmJvcmc6Cj4+PiBUaGlzIGFkZHMgYSB0b3Rh
bCB1c2VkIGRtYS1idWYgbWVtb3J5LiBEZXRhaWxzCj4+PiBjYW4gYmUgZm91bmQgaW4gZGVidWdm
cywgaG93ZXZlciBpdCBpcyBub3QgZm9yIGV2ZXJ5b25lCj4+PiBhbmQgbm90IGFsd2F5cyBhdmFp
bGFibGUuIGRtYS1idWYgYXJlIGluZGlyZWN0IGFsbG9jYXRlZCBieQo+Pj4gdXNlcnNwYWNlLiBT
byB3aXRoIHRoaXMgdmFsdWUgd2UgY2FuIG1vbml0b3IgYW5kIGRldGVjdAo+Pj4gdXNlcnNwYWNl
IGFwcGxpY2F0aW9ucyB0aGF0IGhhdmUgcHJvYmxlbXMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
UGV0ZXIgRW5kZXJib3JnIDxwZXRlci5lbmRlcmJvcmdAc29ueS5jb20+Cj4+IFJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+Cj4+IEhvdyBk
byB5b3Ugd2FudCB0byB1cHN0cmVhbSB0aGlzPwo+IEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGF0IHF1
ZXN0aW9uLiBUaGUgcGF0Y2ggYXBwbGllcyBvbiBUb3J2YWxkcyA1LjEyLXJjNywKPiBidXQgSSBn
dWVzcyA1LjEzIGlzIHdoYXQgd2Ugd29yayBvbiByaWdodCBub3cuCgpZZWFoLCBidXQgaG93IGRv
IHlvdSB3YW50IHRvIGdldCBpdCBpbnRvIExpbnVzIHRyZWU/CgpJIGNhbiBwdXNoIGl0IHRvZ2V0
aGVyIHdpdGggb3RoZXIgRE1BLWJ1ZiBwYXRjaGVzIHRocm91Z2ggZHJtLW1pc2MtbmV4dCAKYW5k
IHRoZW4gRGF2ZSB3aWxsIHNlbmQgaXQgdG8gTGludXMgZm9yIGluY2x1c2lvbiBpbiA1LjEzLgoK
QnV0IGNvdWxkIGJlIHRoYXQgeW91IGFyZSBwdXNoaW5nIG11bHRpcGxlIGNoYW5nZXMgdG93YXJk
cyBMaW51cyB0aHJvdWdoIApzb21lIG90aGVyIGJyYW5jaC4gSW4gdGhpcyBjYXNlIEknbSBmaW5l
IGlmIHlvdSBwaWNrIHRoYXQgd2F5IGluc3RlYWQgaWYgCnlvdSB3YW50IHRvIGtlZXAgeW91ciBw
YXRjaGVzIHRvZ2V0aGVyIGZvciBzb21lIHJlYXNvbi4KCkNocmlzdGlhbi4KCj4KPj4+IC0tLQo+
Pj4gIMKgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCAxMyArKysrKysrKysrKysrCj4+PiAg
wqAgZnMvcHJvYy9tZW1pbmZvLmPCoMKgwqDCoMKgwqDCoMKgIHzCoCA1ICsrKystCj4+PiAgwqAg
aW5jbHVkZS9saW51eC9kbWEtYnVmLmjCoMKgIHzCoCAxICsKPj4+ICDCoCAzIGZpbGVzIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPj4+
IGluZGV4IGYyNjRiNzBjMzgzZS4uMTk3ZTVjNDVkZDI2IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVy
cy9kbWEtYnVmL2RtYS1idWYuYwo+Pj4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYwo+
Pj4gQEAgLTM3LDYgKzM3LDcgQEAgc3RydWN0IGRtYV9idWZfbGlzdCB7Cj4+PiAgwqAgfTsKPj4+
ICDCoCDCoCBzdGF0aWMgc3RydWN0IGRtYV9idWZfbGlzdCBkYl9saXN0Owo+Pj4gK3N0YXRpYyBh
dG9taWNfbG9uZ190IGRtYV9idWZfZ2xvYmFsX2FsbG9jYXRlZDsKPj4+ICDCoCDCoCBzdGF0aWMg
Y2hhciAqZG1hYnVmZnNfZG5hbWUoc3RydWN0IGRlbnRyeSAqZGVudHJ5LCBjaGFyICpidWZmZXIs
IGludCBidWZsZW4pCj4+PiAgwqAgewo+Pj4gQEAgLTc5LDYgKzgwLDcgQEAgc3RhdGljIHZvaWQg
ZG1hX2J1Zl9yZWxlYXNlKHN0cnVjdCBkZW50cnkgKmRlbnRyeSkKPj4+ICDCoMKgwqDCoMKgIGlm
IChkbWFidWYtPnJlc3YgPT0gKHN0cnVjdCBkbWFfcmVzdiAqKSZkbWFidWZbMV0pCj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgIGRtYV9yZXN2X2ZpbmkoZG1hYnVmLT5yZXN2KTsKPj4+ICDCoCArwqDC
oMKgIGF0b21pY19sb25nX3N1YihkbWFidWYtPnNpemUsICZkbWFfYnVmX2dsb2JhbF9hbGxvY2F0
ZWQpOwo+Pj4gIMKgwqDCoMKgwqAgbW9kdWxlX3B1dChkbWFidWYtPm93bmVyKTsKPj4+ICDCoMKg
wqDCoMKgIGtmcmVlKGRtYWJ1Zi0+bmFtZSk7Cj4+PiAgwqDCoMKgwqDCoCBrZnJlZShkbWFidWYp
Owo+Pj4gQEAgLTU4Niw2ICs1ODgsNyBAQCBzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1Zl9leHBvcnQo
Y29uc3Qgc3RydWN0IGRtYV9idWZfZXhwb3J0X2luZm8gKmV4cF9pbmZvKQo+Pj4gIMKgwqDCoMKg
wqAgbXV0ZXhfbG9jaygmZGJfbGlzdC5sb2NrKTsKPj4+ICDCoMKgwqDCoMKgIGxpc3RfYWRkKCZk
bWFidWYtPmxpc3Rfbm9kZSwgJmRiX2xpc3QuaGVhZCk7Cj4+PiAgwqDCoMKgwqDCoCBtdXRleF91
bmxvY2soJmRiX2xpc3QubG9jayk7Cj4+PiArwqDCoMKgIGF0b21pY19sb25nX2FkZChkbWFidWYt
PnNpemUsICZkbWFfYnVmX2dsb2JhbF9hbGxvY2F0ZWQpOwo+Pj4gIMKgIMKgwqDCoMKgwqAgcmV0
dXJuIGRtYWJ1ZjsKPj4+ICDCoCBAQCAtMTM0Niw2ICsxMzQ5LDE2IEBAIHZvaWQgZG1hX2J1Zl92
dW5tYXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRtYV9idWZfbWFwICptYXApCj4+
PiAgwqAgfQo+Pj4gIMKgIEVYUE9SVF9TWU1CT0xfR1BMKGRtYV9idWZfdnVubWFwKTsKPj4+ICDC
oCArLyoqCj4+PiArICogZG1hX2J1Zl9hbGxvY2F0ZWRfcGFnZXMgLSBSZXR1cm4gdGhlIHVzZWQg
bnIgb2YgcGFnZXMKPj4+ICsgKiBhbGxvY2F0ZWQgZm9yIGRtYS1idWYKPj4+ICsgKi8KPj4+ICts
b25nIGRtYV9idWZfYWxsb2NhdGVkX3BhZ2VzKHZvaWQpCj4+PiArewo+Pj4gK8KgwqDCoCByZXR1
cm4gYXRvbWljX2xvbmdfcmVhZCgmZG1hX2J1Zl9nbG9iYWxfYWxsb2NhdGVkKSA+PiBQQUdFX1NI
SUZUOwo+Pj4gK30KPj4+ICtFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVmX2FsbG9jYXRlZF9wYWdl
cyk7Cj4+PiArCj4+PiAgwqAgI2lmZGVmIENPTkZJR19ERUJVR19GUwo+Pj4gIMKgIHN0YXRpYyBp
bnQgZG1hX2J1Zl9kZWJ1Z19zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqdW51c2VkKQo+
Pj4gIMKgIHsKPj4+IGRpZmYgLS1naXQgYS9mcy9wcm9jL21lbWluZm8uYyBiL2ZzL3Byb2MvbWVt
aW5mby5jCj4+PiBpbmRleCA2ZmE3NjFjOWNjNzguLmNjYzdjNDBjOGRiNyAxMDA2NDQKPj4+IC0t
LSBhL2ZzL3Byb2MvbWVtaW5mby5jCj4+PiArKysgYi9mcy9wcm9jL21lbWluZm8uYwo+Pj4gQEAg
LTE2LDYgKzE2LDcgQEAKPj4+ICDCoCAjaWZkZWYgQ09ORklHX0NNQQo+Pj4gIMKgICNpbmNsdWRl
IDxsaW51eC9jbWEuaD4KPj4+ICDCoCAjZW5kaWYKPj4+ICsjaW5jbHVkZSA8bGludXgvZG1hLWJ1
Zi5oPgo+Pj4gIMKgICNpbmNsdWRlIDxhc20vcGFnZS5oPgo+Pj4gIMKgICNpbmNsdWRlICJpbnRl
cm5hbC5oIgo+Pj4gIMKgIEBAIC0xNDUsNyArMTQ2LDkgQEAgc3RhdGljIGludCBtZW1pbmZvX3By
b2Nfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKnYpCj4+PiAgwqDCoMKgwqDCoCBzaG93
X3ZhbF9rYihtLCAiQ21hRnJlZTrCoMKgwqDCoMKgwqDCoCAiLAo+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGdsb2JhbF96b25lX3BhZ2Vfc3RhdGUoTlJfRlJFRV9DTUFfUEFHRVMpKTsK
Pj4+ICDCoCAjZW5kaWYKPj4+IC0KPj4+ICsjaWZkZWYgQ09ORklHX0RNQV9TSEFSRURfQlVGRkVS
Cj4+PiArwqDCoMKgIHNob3dfdmFsX2tiKG0sICJEbWFCdWZUb3RhbDrCoMKgwqAgIiwgZG1hX2J1
Zl9hbGxvY2F0ZWRfcGFnZXMoKSk7Cj4+PiArI2VuZGlmCj4+PiAgwqDCoMKgwqDCoCBodWdldGxi
X3JlcG9ydF9tZW1pbmZvKG0pOwo+Pj4gIMKgIMKgwqDCoMKgwqAgYXJjaF9yZXBvcnRfbWVtaW5m
byhtKTsKPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaCBiL2luY2x1ZGUv
bGludXgvZG1hLWJ1Zi5oCj4+PiBpbmRleCBlZmRjNTZiOWQ5NWYuLjViMDU4MTZiZDJjZCAxMDA2
NDQKPj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oCj4+PiArKysgYi9pbmNsdWRlL2xp
bnV4L2RtYS1idWYuaAo+Pj4gQEAgLTUwNyw0ICs1MDcsNSBAQCBpbnQgZG1hX2J1Zl9tbWFwKHN0
cnVjdCBkbWFfYnVmICosIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqLAo+Pj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcpOwo+Pj4gIMKgIGludCBkbWFfYnVmX3ZtYXAoc3RydWN0
IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRtYV9idWZfbWFwICptYXApOwo+Pj4gIMKgIHZvaWQg
ZG1hX2J1Zl92dW5tYXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRtYV9idWZfbWFw
ICptYXApOwo+Pj4gK2xvbmcgZG1hX2J1Zl9hbGxvY2F0ZWRfcGFnZXModm9pZCk7Cj4+PiAgwqAg
I2VuZGlmIC8qIF9fRE1BX0JVRl9IX18gKi8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
