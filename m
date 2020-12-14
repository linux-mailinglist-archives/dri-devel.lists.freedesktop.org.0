Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492592D9639
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 11:21:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C057D6E145;
	Mon, 14 Dec 2020 10:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770041.outbound.protection.outlook.com [40.107.77.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7236E145
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 10:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fv/5yz6/j4pElsq4nV3jie3rpKWR/yJt1jX0br10mHYuD+dfidX7d0ifNf6yxEHYWYMBLbs8YsWLQ/1ALhXHkhLXg3+S0IXy6wV5cm3UXJqfD6TapqwLV2feXK97fr7ZQ/usXO4Otk0lKrpZBI1pkiSkqO/9anqLzjCI8J39FzjSDidTHElJTf25ksA/kSLUViI8ZY2kDDZoiId9VnaWUm0sqLIeFtb4lHCBgQhDgLVXIE8rBYRYiUMSvx9y5lX1Ohm40wNIWRKQkPtVSfPsDVclW3YFEvxMf8KgObI+BmFPNL4PG16i10x4kcLwD8OePWPIIsUJDpXbOhl5o7GRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG2KpU6VY6fUfHW9mR86rFIGqnX0Sir39Y/KI5p6QRg=;
 b=mGQw5/wCQpEbu/tGUZvNJds3Op5X3j/uuoEDOYO72E1LBpgEnoNaKsBUegYjGqAH7gcUQfp1eJAYxe2V9eOvl8fTcTgGMpJUBLQnVNZZBV3WTh967RU74CFQSAr7H0u9aexZGJqa6ShIuGUnFn6uzDopcaYWgBcbrbRbeb57X+c2WsHFr7sAYro9racAgHDeX9krezPmUI8nGm48oXpK1eMEkT3RXV760VJuGRJpzI7WFQg5E675o+o80e6sYHGI+BcoKGHWAEFfx8Sc/Xfaa3vO/Hf3dluhIhYbSc551G2pF8murFb9I5cpzi2D760LV6A+gi8Jc6CvDOPRlR997A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tG2KpU6VY6fUfHW9mR86rFIGqnX0Sir39Y/KI5p6QRg=;
 b=XuVHdyTb2TgqeQoZDwpNrqvISKJcfdE/EPQTyfKgKdAZnLl64ak/+C9GDL2TRGqcAMdIbtfeNqj3SC5flXrRl+HEN+AR7jFx1NngG0VdKprAi7cfL4Wj03LM9iya7iqt/KPNIj18APt60vrxvlYuvqxhl8xhxYnKcn+lgNweaIs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Mon, 14 Dec
 2020 10:21:13 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.024; Mon, 14 Dec 2020
 10:21:13 +0000
Subject: Re: Fence wait in mmu_interval_notifier_ops::invalidate
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <912c29f1-4e17-8b66-419b-1854d03845fd@shipmail.org>
 <20201209163731.GU552508@nvidia.com>
 <b4018af1-998f-dc79-c83a-8eac95cb1ceb@shipmail.org>
 <1b52322f-569e-f523-3baa-ffb822cb72c2@amd.com>
 <7be4d61e-c82f-6acf-a618-9db29d05094a@shipmail.org>
 <20201211124618.GC552508@nvidia.com>
 <ae0e1e69-6550-94fb-c2b2-1ea04a0ae936@shipmail.org>
 <20201214095237.GX401619@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <56b400b3-7432-8ae9-a674-1a644f61c26f@amd.com>
Date: Mon, 14 Dec 2020 11:21:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201214095237.GX401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0066.eurprd07.prod.outlook.com
 (2603:10a6:207:4::24) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0066.eurprd07.prod.outlook.com (2603:10a6:207:4::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.9 via Frontend Transport; Mon, 14 Dec 2020 10:21:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0358bb12-ae90-4e4a-2b2c-08d8a019fbb4
X-MS-TrafficTypeDiagnostic: BL0PR12MB2356:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2356A0AF42F1F26485D14B7983C70@BL0PR12MB2356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l1MyUANL/PKpJCHTOVHiXFf9qfKCkv9H7lFqGklHcZrKHg5cu45mbo7BgOagGDyq0zddeaxkdeoTq18NxmRQ+xYcDTgIMi8zXxqyN96kck7k/yR2v3EsnEVSFecksS38bszewYu+QiqtHXwDGoxRyX0hffv8oepyVeCAXl7XIRROe633bOx/hxQjxWZbaXcteNoPmPTGB0YpnTkRHjq9LzGfIjDLH2Cg84foFz/sUb5P2PBhV2elNuGvKYapozhKz+oYQawId9xBpuAEoqmHFRXrxNOfssRe1oSAl9dopmWHp7WFp2w++4vldg8H5H0QN4cULRjkkapAAWcNB29NhJ1tHD2CS2J9/gbZmiRzRrGrR/lzALvHaod/sjFC9hc45rDj6yv8waepbLQ7KxZI1woZRmOFRiT1BjRlGEahGAHUarXNtDrAKJAN4Dr4tNP3cU59CI07UA1D7w0e6M4WZ2ZRcMlb4hUTcisdXNHpSEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(346002)(16526019)(66476007)(54906003)(31686004)(2906002)(8936002)(2616005)(86362001)(4326008)(8676002)(508600001)(110136005)(66946007)(186003)(53546011)(66556008)(36756003)(31696002)(5660300002)(6666004)(6486002)(83380400001)(966005)(34490700003)(52116002)(45080400002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S3lXVnZUeUNFcVZhRTNTTVMxM1pyZE1rdUhTVCtrUFdKbytQdVF0Q1EwZGV3?=
 =?utf-8?B?OEhrSXBtQURPa0Zna2tkeVNGbTJ1QXdPcFJWVUpkcVlaSmxHOXVjbWhvOFRy?=
 =?utf-8?B?VmsyMEc0UldNSXFLd2phV1BvSGcxVTgxb0pTNUEzcytsUXhPc0R0NlhNd0Rz?=
 =?utf-8?B?a3R1Wk5wQTIzTGpick0xcFRSU2o0WlVwMkYxS09UTEVWVHhieks1VENSQXRZ?=
 =?utf-8?B?akw3SnhQWFdFNC9EbkxoMFFMNTg0MHpFQVlORTM5ZmxmNzkzRjVKRHh4MHI4?=
 =?utf-8?B?NU95YlI2bFlNT09IcjdBVWptSEFTekpZM3UxdXU0cTBIM3VLcUErZ24vRHFN?=
 =?utf-8?B?OWRxS0lJVXRueWdvaHVQemgrY1lrVE1qaG1ZUFNJQXBVUmgyc1pDRno1eGlw?=
 =?utf-8?B?bHRQUUE5NHgrWnZWbTZwS3o1K3ZUdWU4ZXF5Vm1jM0hUalVPS0s3YkszMjJ4?=
 =?utf-8?B?YW1NaW9ZZGw1N2c2c09yYzVhVVB4dy8vVXFHbWJRaTlKV0dCSEtBMVhpTUVj?=
 =?utf-8?B?TTRJci9CcDZDK3RBR1E0TDQxV0txc3ZnZDZ5THYxZ1RmUWs5b3hMRUdxdDEv?=
 =?utf-8?B?RWxXdVpVZWFuak5xRFBObVViRm1vZmpFNW1QYWFQUVpFNFdubTQ1YmhMSjZG?=
 =?utf-8?B?cFpoZnVPRzk4UUd5NWhFZGlPd0hHd1JHYjdWcERsWFRPRk4yMVA5M3FaVnpF?=
 =?utf-8?B?NXMzQVBNWjdsZHpPT3U3YnRFUDRxWEFpU2dFQlZTOGlHZ0FKM1FUenp2TGdI?=
 =?utf-8?B?TmxnUU12MHVScDBqSXZnS1dQU0c3L2lCVjgzTGN0VGw1VzVEdzdEeU5IdTNo?=
 =?utf-8?B?RkhtVmszb3crcFR2cTA5dzh1elIxTzIyLzN1K3VMS1d1UFVYeFVqaVdzYlB3?=
 =?utf-8?B?cElSakdJTU1NdTRXOTVtc201aVVnZytyNktqTlFIK0x6YUpVM3dzdmM2ZkV5?=
 =?utf-8?B?S1EzOGJQM09Vb3BFSU45Z2xDb2ZudElzQXN6M2tiTEVyLzJhdE1PMWhMd1lO?=
 =?utf-8?B?aUh0RzFvcXFpc3pwTDZsSVFtQ2JVdUZra2Z0bFprb1VPNU5lQUxvaGYzWWcz?=
 =?utf-8?B?T3EwdkIwd1hMNEFacTVoenp6b2N5VVJCcTlidTdJbk85ei9MaTNxWkxhZFJW?=
 =?utf-8?B?Tk1mRU9BajI1L1M3V3VHM3d4NStzekEwV1ZnbHRvMWVESEppaGMrNDFZT2cy?=
 =?utf-8?B?WlpBNFpzdm0wMk14d0hwcHVqaGF2cUQvR0VEbGJRQ2VoU3dqUEEva1ZoQjFp?=
 =?utf-8?B?TmprRXNDbnNQbVhRVU8yL0tsRmVsa1NWd3piZnp1akJoZ0ZpUzFhbTBsSFVn?=
 =?utf-8?B?aUFEZ3J4dmg2cWFBNHdJdGdMV0VuSGM0SmRxcGtjdGRtQVV2czRvTjdIYmRx?=
 =?utf-8?B?K1cxUU5VWW1EZHZid2RtcUxvakRDZ3ArQ3N3UzhkeUMvOHc4VmZKQndOSkdz?=
 =?utf-8?Q?A6NUNxOZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 10:21:12.9421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 0358bb12-ae90-4e4a-2b2c-08d8a019fbb4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gN03hyNxsEB4PTmwopj+syr9jLftaUSkQ9Se3mQkklgIK6HV4NjFRBJVhy32S8rI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@nvidia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMTIuMjAgdW0gMTA6NTIgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFN1biwgRGVj
IDEzLCAyMDIwIGF0IDA0OjA5OjI1UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
d3JvdGU6Cj4+IE9uIDEyLzExLzIwIDE6NDYgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+
IE9uIEZyaSwgRGVjIDExLCAyMDIwIGF0IDA4OjUwOjUzQU0gKzAxMDAsIFRob21hcyBIZWxsc3Ry
w7ZtIChJbnRlbCkgd3JvdGU6Cj4+Pgo+Pj4+IE15IHVuZGVyc3RhbmRpbmcgb2YgdGhpcyBwYXJ0
aWN1bGFyIGNhc2UgaXMgdGhhdCBoYXJkd2FyZSB3b3VsZCBjb250aW51ZSB0bwo+Pj4+IERNQSB0
byBvcnBoYW5lZCBwYWdlcyB0aGF0IGFyZSBwaW5uZWQgdW50aWwgdGhlIGRyaXZlciBpcyBkb25l
IHdpdGgKPj4+PiBETUEsCj4+PiBtbXUgbm90aWZpZXIgcmVwbGFjZXMgcGlubmluZyBhcyB0aGUg
bG9ja2luZyBtZWNoYW5pc20uIERyaXZlcnMgdXNpbmcKPj4+IG1tdSBub3RpZmllciBzaG91bGQg
bm90IGJlIHRha2luZyBwaW5zLgo+Pj4KPj4+IEtlZXAgaW4gbWluZCB0aGlzIHdhcyBhbGwgYnVp
bHQgZm9yIEhXIHdpdGggcmVhbCBzaGFkb3cgcGFnZSB0YWJsZXMKPj4+IHRoYXQgY2FuIGRvIGZp
bmUgZ3JhaW5lZCBtYW5pcHVsYXRpb24uCj4+IE9LIHllcywgdGhhdCBtYWtlcyBzZW5zZSBhbmQg
aW4gdGhhdCBjb250ZXh0IHRoZSBmZW5jZSB3YWl0IGlzIGVhc2llciB0bwo+PiB1bmRlcnN0YW5k
LiBMb29rcyBsaWtlIGZvciBleGFtcGxlIHRoZSByYWRlb24gZHJpdmVyIGlzIHVzaW5nIHRoZSBu
b3RpZmllciArCj4+IGdldF91c2VyX3BhZ2VzKCkgYnV0IHRoZXJlIGl0IGxvb2tzIGxpa2UgaXQn
cyB1c2VkIHRvIGF2b2lkIGhhdmluZwo+PiBnZXRfdXNlcl9wYWdlcygpIGNsYXNoIHdpdGggaW52
YWxpZGF0aW9uLgo+IEkgdGhpbmsgdGhlIHJhZGVvbiB1c2VycHRyIGltcGxlbWVudGF0aW9uIGlz
IGJhZCBlbm91Z2ggdGhhdCBDaHJpc3RpYW4KPiB3YW50cyB0byBvdXRyaWdodCByZW1vdmUgaXQu
IEF0IGxlYXN0IGhlIGtlZXBzIHRhbGtpbmcgYWJvdXQgZG9pbmcgdGhhdC4KCk9oLCB5ZXMgOikg
S2V5IHBvaW50IGlzIGhhdmluZyB0aW1lIGZvciB0aGF0LgoKQ2hyaXN0aWFuLgoKPgo+IFNvIG1h
eWJlIG5vdCBhIGdvb2QgZXhhbXBsZSB0byBsb29rIGF0IDotKQo+IC1EYW5pZWwKPgo+Pj4gVGhl
IEdQVSB2ZXJzaW9uIG9mIHRoaXMgdG8gaW5zdGVhZCBtYW5pcHVsYXRlIGEgY29tbWFuZCBxdWV1
ZSBpcyBhIGJpZwo+Pj4gYWJlcnJhdGlvbiBmcm9tIHdoYXQgd2FzIGludGVuZGVkLgo+Pj4KPj4+
IEphc29uCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91
cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGlu
Zm8lMkZkcmktZGV2ZWwmYW1wO2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQu
Y29tJTdDNGM3YjYyMmRlMmNmNGI3MWM0NGEwOGQ4YTAxNWZmYzMlN0MzZGQ4OTYxZmU0ODg0ZTYw
OGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDM1MzYzNjM3MDQ2NjYzJTdDVW5rbm93biU3
Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2
SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPXFKWFdYYk1Yb1VmRHFwQXNL
NzZUSUJEajhuT3U5eFo2NkdMWENqWmNOUU0lM0QmYW1wO3Jlc2VydmVkPTAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
