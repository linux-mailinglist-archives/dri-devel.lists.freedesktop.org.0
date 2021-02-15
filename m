Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7C931B8A2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 13:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804CE6E1B7;
	Mon, 15 Feb 2021 12:04:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBB56E1B7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 12:04:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ITbkyHhIzObkx/Bi+tWJfLeaM/QvWN43Fz7EGDR36F0rZzeZvuB467BZ2XjxM/Fk8b6zJ0KSHGekjnT2uBFyfH/bM3WbPtj4bm45/FNbxUmSd4IdksTp25nh+E0UK9iV1ANjsPb6Yeq14buQ7k5YjVBCe3HR+Q8f+by3qoOjDuCYkC1xtJeoJLMbsv4Q0m+yZ4EHzr03ZQmk769yPvZeusTM5J7EW7FNIf/PBW3jPpQ0S3Liu2GYE3qk1x1EQwFvCg1YKzRIDte+ujJTUAgmWVfM5OuTe8X2WM0y28BVkdGNmGT8AW1I/DGxz617/fNdP8N8EI+B0ENM23XkOKNzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpz8EctCPkZPhLO4zbMPwOKN9Afn9IDqMtHwqnFZM98=;
 b=A7PD094s5jWZY2PiNZx7eWe+EPjyRuvMd3D0kl0A38oVfK1pYFOW6p+kksqJIDX0ZNHyHjYD/jn4gmOysTgVLEcHofuDI+Qq7VkmlHkq6BLuf9/YkvLZ8p0LG8zjZTOnYKMEbAiBT3PYkUc8bNKQB8NDQVUeSnHmq5/oNcl4PS/NuwDNOG6vd9tbZ9y0AbsgjWf7/xFxREhGwjUx7QamZ0dr9yzGjDvZaq1b7nsECdRD4uex3pCYI61AVOGv58HyDmxkJNLuc7ZLkW4yGCzbKfldDB6FCLei5YLd7oC9yWsPMYNtWg0wG1YJfGMbn6BbeB1vq1sMIDkDd4/mBm9j9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kpz8EctCPkZPhLO4zbMPwOKN9Afn9IDqMtHwqnFZM98=;
 b=MtzTVVz5EWwjzmeXXh3IOL1Y0E8KKhgyfjwHU6Pb+gu0SvE7tdCUZVIP3kjrVfQgoPRelhKm4wZBzwshZ5F/PC2XRyu5ZOOJ82EBB9mS60VE7pdvKvhQA6QjLUHGbjB1qsn/xLSRnZKmODYFcwkhBkuY8m4jXP4Aghl+lB7cpHE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Mon, 15 Feb
 2021 12:04:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3846.038; Mon, 15 Feb 2021
 12:04:39 +0000
Subject: Re: DMA-buf and uncached system memory
To: Lucas Stach <l.stach@pengutronix.de>, Simon Ser <contact@emersion.fr>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <GUuZYSQk2hxgykDhSxfB2GWo47lQlVrKBtWMwQUG7Ar2GAag5WQDxBI0zq6nDTooPBzTktyRpnu25Ju1UKE3FYD9yHbkNMAHcmSI96hoJhA=@emersion.fr>
 <da9edfa0-8a18-44a2-fa79-83b4177afd8e@amd.com>
 <8d23f1ca6fe76d8971365bf54ca71ba71698980d.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7ecf008d-a1f5-ddff-c8ac-8e7bfaf9c680@amd.com>
Date: Mon, 15 Feb 2021 13:04:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <8d23f1ca6fe76d8971365bf54ca71ba71698980d.camel@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3e90:5494:cc4a:73e5]
X-ClientProxiedBy: AM8P189CA0008.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::13) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3e90:5494:cc4a:73e5]
 (2a02:908:1252:fb60:3e90:5494:cc4a:73e5) by
 AM8P189CA0008.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Mon, 15 Feb 2021 12:04:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: afeea6be-3805-4bae-058a-08d8d1a9def9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4551:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB45515D53ADED924BE96103AD83889@MN2PR12MB4551.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dClTd0xUhNQjRRs+G4mNpjaikB3QMcN4y3+7nLDEWseCLmDgxvzMto7/NeahQUmDy3pJ0xT/w+VDSKyKFhIZRBoLtU+QwSfe0C22QjCuthHY7lWm5+dmK+71DoUeF/VE8V1VWH5dFiCcG/cPYvBNZYrWR2mNDINamH2qcYqMGeJ7u3gvTbPx/0qQSkYlgE5zX42aSYSb46b3P6rGYC4XkVNlhxFyJFEOCrF2XPalgnSVgxgLc5nMoiVfgccPYvrC7H/FKtPQa1c7X//O1Q061h1/Z5Rfvv4q2tnHb5yuNRbqnXiFYoO+l7wOM0Jy9pMrBaEJz/GJkbbVeo+2SBcmg/zBt7OlIFmtWX+jlD2uBNs1dKNEG32bIwnOQQ4oWOefIoGgcCOqjyERVapQzDA4SQOH0i170JTLjNtg5GgAjSkzMzc4qtbgUy4b8sePnSy85o/eyVHBWNN/E4LeoS0aENFfMoZDj30PxQZp8TU9GfFpIejcEoBcqYvXOlluTf6/DQFFDXKMAyiJem6lrmjQeqUJ61WUsAvaWHnpis1z+10gFGIi7xPjglKjJjNSAKwGTKka6W+kWvbBrBEwyyDeliF+quSFdEDoxmgzAGSOb5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(66556008)(2906002)(31686004)(110136005)(6486002)(8936002)(66476007)(6666004)(8676002)(66946007)(52116002)(4326008)(36756003)(5660300002)(83380400001)(316002)(86362001)(2616005)(16526019)(31696002)(478600001)(66574015)(186003)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZnhUZG81akhYK1phdVVWRDE4L1BEQlBubXp3bmRxcWFmSHJuRHE4NEhRK3h5?=
 =?utf-8?B?Y01SejNramR1M1A5VUNOOWxaZHBzelFab3h0dy9HTkhHOERxUlFyYy9hdXl5?=
 =?utf-8?B?Z3BPSTV5ZklNeTRhNTNTeGNVNjMvTGhsL2hvWFRSWkVjblZKM0NPNWxvVkt0?=
 =?utf-8?B?eFR2Rm02MWY2MmZMSEFHd0NnNnNMM1FHcTF5TVdZaVlsV2tlNmdFMFRqb3BX?=
 =?utf-8?B?NkMyOGI2ZDZ4cGZ3N3J0cU96TFFZNnhMZ0VMVHNkTXkyWTVlT0pURVdQQktJ?=
 =?utf-8?B?b05CakRIZDBYcU44VllhWVNaN29WeUw2ZDdJQ1hmMHNOOXBSOGxPY05oTWNO?=
 =?utf-8?B?UlNxT05xWENrck1GcElmVCsyb2dvTjg3SXRCUzkzWTJTV1ZSVDQ0MW5hNlkr?=
 =?utf-8?B?RW9VMGFsUHE2aGdqOGE0WmJJRy9hKzZteCtnVGNVYlBML1J6aDEzRDZwd25U?=
 =?utf-8?B?VnNJeEhGY1cwdUNWTWVnNlNqK2J0eXlzTUd2L21uRDhmODU5Q00yaUJWMmJD?=
 =?utf-8?B?Z1loSUZQSDd1SDk3MnFmWlBDOTJ4UE5vbU81emt5U1UwbUwzYnFTUndublJX?=
 =?utf-8?B?Q0hqSXhqRS9FemMrcThtQjlaUVZEUEdTazUyblMzTXMrVDQ2L2dtdHFPNVJC?=
 =?utf-8?B?SDNJdmlRWmRYR0EyUm5QbGdTSVlVdVNNYWZrdE9MWVhSNTdyV1krVzBaRjdF?=
 =?utf-8?B?VHBWeFdHa0pSNXU2S3dhci90emFJYXlVT0wvbTNGd21UQ1E3dFEwbnNKSEVV?=
 =?utf-8?B?L0grcndlL0QwRzA2OTd0RUs2RDZOdy92bGpjeGhzd0U1Q0djbjRGOWVwWUhM?=
 =?utf-8?B?WWlkd3JhZzc2SFF5bTZzMnAwMElWYWE4WWlpYXluZEM3RjJCKzJhNENiQ2Ft?=
 =?utf-8?B?Qm16aHEvL1N3UGVNSjVEMVVXSVMvN2phTG55WWN2N3A3N0NiM2NBanRIWElu?=
 =?utf-8?B?eUNXQkpkbk5pUW1hN1plN3ZPRUprYkF6UGJUd05Ua2I2RUEvOTJWTlpUQjlW?=
 =?utf-8?B?TmRyRzF4UXQ5T3JweThVS3dTSHp0cEt0NWFlM2JhckZPM0dVb3YwczNuOTNh?=
 =?utf-8?B?UVc0RjNyc0VMQjNjRWNNUDBSd2pqUHZDMk9PTmd1QkduRVBkbk5NRWlsbU1N?=
 =?utf-8?B?aU82eG42SE1JeDEyY1JaWFBtcEJGQ2RncElxd1RFc3dnMy9vNjNiNEl1dHJC?=
 =?utf-8?B?aXlNNzZkYU9SVlQwaE9UVmZWUENFYTZqTC9mL3Jtd1hFRVpkU29yLzRPL2NN?=
 =?utf-8?B?bDA0MVVNaUYrU0pDWVFJQktxQWRwMDRGUnNhN1BhR1MxeTViRDgxZmpld2dR?=
 =?utf-8?B?enpUR1RQSmhRdk5RbXEvVlFZTXpwaGJrWkNacUZIQXdmVGpwdE5QZkxvbTlQ?=
 =?utf-8?B?THNNaG9zeUh5dTg3a1NtVzRpY3BRY2hIRGNqalMxNTlQNWxZekYzYWo3SExk?=
 =?utf-8?B?TWJIOUdOcmJRUmVJdXlTU0xLbnpoRGFTNFBCeEJtcmtqNGhJS3NrVG9TV1Y3?=
 =?utf-8?B?NjR1eWZ2MjgwYWdpcjVPbVg5Uk1oemJZL3BENEdNbkJkdmJ4VEFEOFJ3Ymh1?=
 =?utf-8?B?ZmxCckw5S2w5WDBKVVFRRkg3ZTk4T25aMjJXVVBHRHFBWndZMnVYT1plSkM0?=
 =?utf-8?B?QVdtaDdhNVVRME45MTYvbnM4RERzZDdyTml2T0ZlUXJZcjZoT1p6Z1c1TTNB?=
 =?utf-8?B?ZGhuWVVtU2FaNEVqQ3pjUDN0OHFIZ3RVeUhLdUw2WDdlWFVQNUJTZzFJelhT?=
 =?utf-8?B?N0JuVEpxS1FLWmg1NDc2Zlc0SS9UeHhBSWc0NFQ4ekN4ZU5NVFR4MFUrMTBK?=
 =?utf-8?B?azhIR3pMWVdGNGhkN25sVFJXVjArNVBnN3lLanBycUE5RDFweVpXOUdHQVZz?=
 =?utf-8?Q?axPYSqXsXGxLm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afeea6be-3805-4bae-058a-08d8d1a9def9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2021 12:04:39.4734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtKS31DBpn5i8URs0cZjcmWrQxjJNQ6h5n9C4qT8ixf8abvpI4wkYLY/DGi3Ksol
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media <linux-media@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDIuMjEgdW0gMTI6NTMgc2NocmllYiBMdWNhcyBTdGFjaDoKPiBBbSBNb250YWcsIGRl
bSAxNS4wMi4yMDIxIHVtIDEwOjM0ICswMTAwIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPj4g
QW0gMTUuMDIuMjEgdW0gMTA6MDYgc2NocmllYiBTaW1vbiBTZXI6Cj4+PiBPbiBNb25kYXksIEZl
YnJ1YXJ5IDE1dGgsIDIwMjEgYXQgOTo1OCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4+Cj4+Pj4gd2UgYXJlIGN1cnJlbnRseSB3b3JraW5n
IGFuIEZyZWVzeW5jIGFuZCBkaXJlY3Qgc2NhbiBvdXQgZnJvbSBzeXN0ZW0KPj4+PiBtZW1vcnkg
b24gQU1EIEFQVXMgaW4gQStBIGxhcHRvcHMuCj4+Pj4KPj4+PiBPbiBwcm9ibGVtIHdlIHN0dW1i
bGVkIG92ZXIgaXMgdGhhdCBvdXIgZGlzcGxheSBoYXJkd2FyZSBuZWVkcyB0byBzY2FuCj4+Pj4g
b3V0IGZyb20gdW5jYWNoZWQgc3lzdGVtIG1lbW9yeSBhbmQgd2UgY3VycmVudGx5IGRvbid0IGhh
dmUgYSB3YXkgdG8KPj4+PiBjb21tdW5pY2F0ZSB0aGF0IHRocm91Z2ggRE1BLWJ1Zi4KPj4+Pgo+
Pj4+IEZvciBvdXIgc3BlY2lmaWMgdXNlIGNhc2UgYXQgaGFuZCB3ZSBhcmUgZ29pbmcgdG8gaW1w
bGVtZW50IHNvbWV0aGluZwo+Pj4+IGRyaXZlciBzcGVjaWZpYywgYnV0IHRoZSBxdWVzdGlvbiBp
cyBzaG91bGQgd2UgaGF2ZSBzb21ldGhpbmcgbW9yZQo+Pj4+IGdlbmVyaWMgZm9yIHRoaXM/Cj4+
Pj4KPj4+PiBBZnRlciBhbGwgdGhlIHN5c3RlbSBtZW1vcnkgYWNjZXNzIHBhdHRlcm4gaXMgYSBQ
Q0llIGV4dGVuc2lvbiBhbmQgYXMKPj4+PiBzdWNoIHNvbWV0aGluZyBnZW5lcmljLgo+Pj4gSW50
ZWwgYWxzbyBuZWVkcyB1bmNhY2hlZCBzeXN0ZW0gbWVtb3J5IGlmIEknbSBub3QgbWlzdGFrZW4/
Cj4+IE5vIGlkZWEsIHRoYXQncyB3aHkgSSdtIGFza2luZy4gQ291bGQgYmUgdGhhdCB0aGlzIGlz
IGFsc28gaW50ZXJlc3RpbmcKPj4gZm9yIEkrQSBzeXN0ZW1zLgo+Pgo+Pj4gV2hlcmUgYXJlIHRo
ZSBidWZmZXJzIGFsbG9jYXRlZD8gSWYgR0JNLCB0aGVuIGl0IG5lZWRzIHRvIGFsbG9jYXRlIG1l
bW9yeSB0aGF0Cj4+PiBjYW4gYmUgc2Nhbm5lZCBvdXQgaWYgdGhlIFVTRV9TQ0FOT1VUIGZsYWcg
aXMgc2V0IG9yIGlmIGEgc2Nhbm91dC1jYXBhYmxlCj4+PiBtb2RpZmllciBpcyBwaWNrZWQuCj4+
Pgo+Pj4gSWYgdGhpcyBpcyBhYm91dCBjb21tdW5pY2F0aW5nIGJ1ZmZlciBjb25zdHJhaW50cyBi
ZXR3ZWVuIGRpZmZlcmVudCBjb21wb25lbnRzCj4+PiBvZiB0aGUgc3RhY2ssIHRoZXJlIHdlcmUg
YSBmZXcgcHJvcG9zYWxzIGFib3V0IGl0LiBUaGUgbW9zdCByZWNlbnQgb25lIGlzIFsxXS4KPj4g
V2VsbCB0aGUgcHJvYmxlbSBoZXJlIGlzIG9uIGEgZGlmZmVyZW50IGxldmVsIG9mIHRoZSBzdGFj
ay4KPj4KPj4gU2VlIHJlc29sdXRpb24sIHBpdGNoIGV0YzouLiBjYW4gZWFzaWx5IGNvbW11bmlj
YXRlZCBpbiB1c2Vyc3BhY2UKPj4gd2l0aG91dCBpbnZvbHZlbWVudCBvZiB0aGUga2VybmVsLiBU
aGUgd29yc3QgdGhpbmcgd2hpY2ggY2FuIGhhcHBlbiBpcwo+PiB0aGF0IHlvdSBkcmF3IGdhcmJh
Z2UgaW50byB5b3VyIG93biBhcHBsaWNhdGlvbiB3aW5kb3cuCj4+Cj4+IEJ1dCBpZiB5b3UgZ2V0
IHRoZSBjYWNoaW5nIGF0dHJpYnV0ZXMgaW4gdGhlIHBhZ2UgdGFibGVzIChib3RoIENQVSBhcwo+
PiB3ZWxsIGFzIElPTU1VLCBkZXZpY2UgZXRjLi4uKSB3cm9uZyB0aGVuIEFSTSBmb3IgZXhhbXBs
ZSBoYXMgdGhlCj4+IHRlbmRlbmN5IHRvIGp1c3Qgc3BvbnRhbmVvdXNseSByZWJvb3QKPj4KPj4g
WDg2IGlzIGZvcnR1bmF0ZWx5IGEgYml0IG1vcmUgZ3JhY2VmdWxseSBhbmQgeW91IG9ubHkgZW5k
IHVwIHdpdGggcmFuZG9tCj4+IGRhdGEgY29ycnVwdGlvbiwgYnV0IHRoYXQgaXMgb25seSBtYXJn
aW5hbGx5IGJldHRlci4KPj4KPj4gU28gdG8gc3VtIGl0IHVwIHRoYXQgaXMgbm90IHNvbWV0aGlu
ZyB3aGljaCB3ZSBjYW4gbGVhdmUgaW4gdGhlIGhhbmRzIG9mCj4+IHVzZXJzcGFjZS4KPj4KPj4g
SSB0aGluayB0aGF0IGV4cG9ydGVycyBpbiB0aGUgRE1BLWJ1ZiBmcmFtZXdvcmsgc2hvdWxkIGhh
dmUgdGhlIGFiaWxpdHkKPj4gdG8gdGVsbCBpbXBvcnRlcnMgaWYgdGhlIHN5c3RlbSBtZW1vcnkg
c25vb3BpbmcgaXMgbmVjZXNzYXJ5IG9yIG5vdC4KPiBUaGVyZSBpcyBhbHJlYWR5IGEgY29hcnNl
LWdyYWluZWQgd2F5IHRvIGRvIHNvOiB0aGUgZG1hX2NvaGVyZW50Cj4gcHJvcGVydHkgaW4gc3Ry
dWN0IGRldmljZSwgd2hpY2ggeW91IGNhbiBjaGVjayBhdCBkbWFidWYgYXR0YWNoIHRpbWUuCj4K
PiBIb3dldmVyIGl0IG1heSBub3QgYmUgZW5vdWdoIGZvciB0aGUgcmVxdWlyZW1lbnRzIG9mIGEg
R1BVIHdoZXJlIHRoZQo+IGVuZ2luZXMgY291bGQgZGlmZmVyIGluIHRoZWlyIGRtYSBjb2hlcmVu
Y3kgcmVxdWlyZW1lbnRzLiBGb3IgdGhhdCB5b3UKPiBuZWVkIHRvIGVpdGhlciBoYXZlIGZha2Ug
c3RydWN0IGRldmljZXMgZm9yIHRoZSBpbmRpdmlkdWFsIGVuZ2luZXMgb3IKPiBjb21lIHVwIHdp
dGggYSBtb3JlIGZpbmUtZ3JhaW5lZCB3YXkgdG8gY29tbXVuaWNhdGUgdGhvc2UgcmVxdWlyZW1l
bnRzLgoKWWVhaCwgdGhhdCB3b24ndCB3b3JrLiBXZSBuZWVkIHRoaXMgb24gYSBwZXIgYnVmZmVy
IGxldmVsLgoKPj4gVXNlcnNwYWNlIGNvbXBvbmVudHMgY2FuIHRoZW4gb2YgY291cnNlIHRlbGwg
dGhlIGV4cG9ydGVyIHdoYXQgdGhlCj4+IGltcG9ydGVyIG5lZWRzLCBidXQgdmFsaWRhdGlvbiBp
ZiB0aGF0IHN0dWZmIGlzIGNvcnJlY3QgYW5kIGRvZXNuJ3QKPj4gY3Jhc2ggdGhlIHN5c3RlbSBt
dXN0IGhhcHBlbiBpbiB0aGUga2VybmVsLgo+IFdoYXQgZXhhY3RseSBkbyB5b3UgbWVhbiBieSAi
c2Nhbm91dCByZXF1aXJlcyBub24tY29oZXJlbnQgbWVtb3J5Ij8KPiBEb2VzIHRoZSBzY2Fub3V0
IHJlcXVlc3RvciBhbHdheXMgc2V0IHRoZSBuby1zbm9vcCBQQ0kgZmxhZywgc28geW91IGdldAo+
IGdhcmJhZ2UgaWYgc29tZSB3cml0ZXMgdG8gbWVtb3J5IGFyZSBzdGlsbCBzdHVjayBpbiB0aGUg
Y2FjaGVzLCBvciBpcwo+IGl0IHNvbWUgb3RoZXIgcmVxdWlyZW1lbnQ/CgpTbm9vcGluZyB0aGUg
Q1BVIGNhY2hlcyBpbnRyb2R1Y2VzIHNvbWUgZXh0cmEgbGF0ZW5jeSwgc28gd2hhdCBjYW4gCmhh
cHBlbiBpcyB0aGF0IHRoZSByZXNwb25zZSB0byB0aGUgUENJZSByZWFkIGNvbWVzIHRvIGxhdGUg
Zm9yIHRoZSAKc2Nhbm91dC4gVGhlIHJlc3VsdCBpcyBhbiB1bmRlcmZsb3cgYW5kIGZsaWNrZXJp
bmcgd2hlbmV2ZXIgc29tZXRoaW5nIGlzIAppbiB0aGUgY2FjaGUgd2hpY2ggbmVlZHMgdG8gYmUg
Zmx1c2hlZCBmaXJzdC4KCk9uIHRoZSBvdGhlciBoYW5kIHdoZW4gdGhlIGRvbid0IHNub29wIHRo
ZSBDUFUgY2FjaGVzIHdlIGF0IGxlYXN0IGdldCAKZ2FyYmFnZS9zdGFsZSBkYXRhIG9uIHRoZSBz
Y3JlZW4uIFRoYXQgd291bGRuJ3QgYmUgdGhhdCB3b3JzZSwgYnV0IHRoZSAKYmlnIHByb2JsZW0g
aXMgdGhhdCB3ZSBoYXZlIGFsc28gc2VlbiBtYWNoaW5lIGNoZWNrIGV4Y2VwdGlvbnMgd2hlbiAK
ZG9uJ3Qgc25vb3AgYW5kIHRoZSBjYWNoZSBpcyBkaXJ0eS4KClNvIHRoaXMgc2hvdWxkIGJldHRl
ciBiZSBjb2hlcmVudCBvciB5b3UgY2FuIGNyYXNoIHRoZSBib3guIEFSTSBzZWVtcyB0byAKYmUg
cmVhbGx5IHN1c2NlcHRpYmxlIGZvciB0aGlzLCB4ODYgaXMgZm9ydHVuYXRlbHkgbXVjaCBtb3Jl
IGdyYWNlZnVsIAphbmQgSSdtIG5vdCBzdXJlIGFib3V0IG90aGVyIGFyY2hpdGVjdHVyZXMuCgpS
ZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gUmVnYXJkcywKPiBMdWNhcwo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
