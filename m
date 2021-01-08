Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3B62EF3E0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 15:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC1F6E170;
	Fri,  8 Jan 2021 14:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50C26E170;
 Fri,  8 Jan 2021 14:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EH49wzFpHS6nMW6XpoiMD4f3CS3tIk1RH9naF5L4blI6+F+2QKuWoBvCnOubXHogNkQGD7nn7+2HAHjPCxViRSJ8wfXCaJsAFKnnruo21SeSB1lKnONRbWv5iJD1/rBCX4TTkdlNzC06F/vlRB1EtT/5OcNmWIgeZhpKg3JZIL1Kh1Lnypi11R2oCm6Ey/ksujXWjxn2TuWf/st6ov8S+KEpOB2/+EK/iM2hnfRLZXMz1wxoOR47Z/fH45DC7eXCnss0G/wfh6PeVJcBC5nMQKmzD6zsB0zMQWqaAPoT7gp9imo3Jmoy8Hw7viE3KQvh0NmDyoBvVBOfK0ypIDVygg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjIUuzNOeCAC4rgVGkwf1LVv/KTD3QycHxaa3iembog=;
 b=INgW3o0g9xfYp+AJ5urgR03XnZ0/bLYBHbPqsGnCCJ6pyM5QNICiJwuxVFxxrk6wT2QYHqUWbkHfCbGe9/KhUdu9ssLIl3sjQyv/0k/5EIlGIEiekz7fxRnToUQoT9qw74ADHGsomZQqHbfsbe5+/mk3VEGSFFLPdl8pWLa97WADosHJamFZZTPrjiCpIfsN0j9LkTVUXzdH5SGZPHgHnXTGM5/nDF9KRAbhTiFdyo8eS1KPd4VY6HCDEcb7D4lAnMvHT2/YjpUyDX/zs0zUyGT3i65b/pZe9s244spX8InoWk/OFg3w5QyOVb5FuHqpZE26N5MpDBtjaP94EQg2gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjIUuzNOeCAC4rgVGkwf1LVv/KTD3QycHxaa3iembog=;
 b=aU0aVULZpANzukbKm1o+07VqKAmyi/urQvddiWi0L3T6kwfC/RlGyTssZ6oFRh94qE0DKOfIj0A4apTy5fG4SLZrTaoV7cg+q7+P7M4m5coBMVnBPgiIPgXhhmEEOMuuSi8usW2NzmzyDRCfu4366ZrH2qshnzLCz2k5vOAQFSM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 14:26:27 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d%4]) with mapi id 15.20.3721.024; Fri, 8 Jan 2021
 14:26:27 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
 <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
 <e6bbd5fa-29b7-c74a-ea70-3979b573901b@amd.com>
 <5a61f76a-0b40-941f-8028-37202f296e74@gmail.com>
 <f374aaa4-4a30-e60c-cd4b-d463443c1137@amd.com>
 <X/c1IXX11chjHyl4@phenom.ffwll.local>
 <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
 <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
Message-ID: <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
Date: Fri, 8 Jan 2021 09:26:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:3021:14a5:28d4:9466]
X-ClientProxiedBy: YTBPR01CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::47) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3021:14a5:28d4:9466]
 (2607:fea8:3edf:49b0:3021:14a5:28d4:9466) by
 YTBPR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 14:26:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 46b61314-6f83-4f51-3376-08d8b3e16275
X-MS-TrafficTypeDiagnostic: SA0PR12MB4448:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4448DF213C98E7EEDAE1B079EAAE0@SA0PR12MB4448.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5zkuG39TSQHATw15vjtYljXFsjOAB5JpOqwSHtPZvBpJcqBZ/KlYFJURJ838cCvGCzObfj2I3JZ1lvnQlgPoKJl9G9djG4OzgSyaUJpQFoPylzPpIz45tgmE9BKPX46CbGjQGGstrXbjuescFCyGY2MBtQS6YfNF6dOPEsoRic77Z+n4ueuWiprocvkZKlEGUftehcIdpdv9vWTXTwoFe6vy4vFSWMZMYzn+vmzVCB5HdJ1EJYBbjyzMtJUDii3Qn7LjU6vAQYb9OFnkYd/u+RLJnbNPxB5Im/jOdII9pAYQc+agYTsnVbhY/z2xAobG1EGYWh/AZzidacV5PwSDT6iiNE4McVubntGHz4gavHkkFkGfSrVzuRO4evNCT8HW62cz7WTEkLyqIV5QPXeiD7UTL10EKFQUnDrk1yQwDirw7GE8l3Ft1dVTz6tB+6jdbZedE4w0sNdPl4dZCYve4i79c6QcQczgLGRMIv8noBkIM3andIJud23jxSsTr2LiHGeonKk6KUQoaYghVSXQPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(366004)(376002)(478600001)(6636002)(45080400002)(36756003)(53546011)(186003)(2616005)(16526019)(966005)(316002)(83380400001)(31686004)(5660300002)(66574015)(31696002)(66476007)(7416002)(6666004)(8676002)(66946007)(66556008)(86362001)(4326008)(6486002)(8936002)(2906002)(52116002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?czU5ZVZtQmFWNVA1UERSQWEycEUxZU0wM01vcm9weFhHYWZYb0RlT2JFNlh5?=
 =?utf-8?B?T050Z1lHV2VsTS9INUU5ZHdlbXp5MDBVRXFsT3NBNXNmNU9HMVE4S2xHT0Nz?=
 =?utf-8?B?OTg3WE13VUhQUUZlTXA4VmVjYWhKVGJaQk1TWjlKS25zY0lKb3NMamh5VlRJ?=
 =?utf-8?B?OVlWejEvWnI1S05FeE5IK2gvNG5oNmNNVE5YRzVIdHQ5aDVEQWQyQ3VzSGho?=
 =?utf-8?B?THYyc0Zsb0VDRlJNY3U0OXZtdFg2dVE1SnVveUUzZ3pKMDBMWDAzd1Y1QStr?=
 =?utf-8?B?KzFENytJWFFyVnFhRlIra0VBL0EzZ0UvaG1jVFRHK1E1RXFXSzMycnQ5YmhY?=
 =?utf-8?B?TFpZSjRwWVdlR0plOWFYZGNxbkJKUC9rVTRDN1piUExNOGE2MUxJY3phWGM1?=
 =?utf-8?B?L3d6V0g3OURJWDdWY01tRFpZZjZGZlMwcFMzdUtZclNqbjZwUXc3ZzJ0cW9t?=
 =?utf-8?B?UEQ5dmNaWVQxSXVxOWVuSHlkOTZRU2cyV0J4K0cwNmdoSkpzdG5tb0cyRkVG?=
 =?utf-8?B?TTBUNXNIOFZLMTRIWXZ0cWFnQzFBQTMvaCs3SEJZeUhXWVBlOXdKOHhnRjZR?=
 =?utf-8?B?S002d3NXK0pDWXZ3d2pIQlB6bWFhZmpwcTQ2V1Q0dFdoeVNlMHliTzlqVTBM?=
 =?utf-8?B?L21lb0FCRUJVWWc5VmFEZU13OXNNckIvMDU4b0ZqZUNoZE9HcHNKTCtwcW5E?=
 =?utf-8?B?QjI4WFcvekJWYWQ4TFBIa3YzR05JQjhtWnZQbFppbVVQUHFyRWhWcUZiZ054?=
 =?utf-8?B?c2FQcjFWSit5WjhhVlZ4Z3pjL2RpeExBZStSU0s0d0FMa0ZYUEZ6N3dETXhw?=
 =?utf-8?B?a2M5VFpFdVlnUWpNby85Mm10MitwUHRQQk0xdjdmdzd4WkFod0FoTGVoS0hh?=
 =?utf-8?B?K3lFU3BxYll4d0h2Q3pYaWNlTzBzbmFIWi9oU3pqalc2a1NtMGFWRlhISmhZ?=
 =?utf-8?B?ZUNxandnVldrVlpQSmdyTTN3VUtIQjdxdUYxM2oyNVpGbWIxUW55L05sdTJ4?=
 =?utf-8?B?WTk3bmxSOEppYTRzVXFoVEc1K2UwcW9FbGE2bk5aYTVQMSt0K0F1dmZpS3Yw?=
 =?utf-8?B?VWNFRmUrVHpUcHh0YjhsVk9mTS9qb0IzS2RVK0RzZ3A2bjBtVHY1VjUwUFdi?=
 =?utf-8?B?KzFXd0svRlpuTmhOR2pKVG5YeTcrdUV6SDRVSzlOb3l2bDkxRWFYQ2h3TGpu?=
 =?utf-8?B?NGdKa3lxZzJsUzdvUGgyN3pMa2k1ZlViU2s0OGJGbzFuaXJJclFPN2tEY0ZG?=
 =?utf-8?B?RkV1ZTVqcnFlcXV3V1MwdXNHY1hUUXBlSlpYTWpOY2NaL0wySmZTSlhRdGZp?=
 =?utf-8?B?dTBiUEZYQ1RrUTlPQndhV3lvYVp6aEFBN1EwMU5kT3pmSGlZbmZQQ1JVcXBU?=
 =?utf-8?B?V0drTFUzUzZUWlExYVNKcmFpbEdURVRoWnUzS2xVVFZqVExITnQ0QWdGRE1z?=
 =?utf-8?Q?DPgqXcY3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 14:26:27.2537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b61314-6f83-4f51-3376-08d8b3e16275
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fh/3Toh3Yu/EuT3Me0ciogBNAbrKEG53gFYuH9GoOMsEgl8FKsb+dieFAgx57zUI3CPYl+FfaqA/UG8kzT/bZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448
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
Cc: amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, yuq825@gmail.com, gregkh@linuxfoundation.org,
 Alexander.Deucher@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IENocmlzdGlhbiwganVzdCBhIHBpbmcuCgpBbmRyZXkKCk9uIDEvNy8yMSAxMTozNyBBTSwg
QW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4KPiBPbiAxLzcvMjEgMTE6MzAgQU0sIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4+IE9uIFRodSwgSmFuIDA3LCAyMDIxIGF0IDExOjI2OjUyQU0gLTA1MDAs
IEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4gT24gMS83LzIxIDExOjIxIEFNLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+Pj4+IE9uIFR1ZSwgSmFuIDA1LCAyMDIxIGF0IDA0OjA0OjE2UE0gLTA1
MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+PiBPbiAxMS8yMy8yMCAzOjAxIEFNLCBD
aHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4gQW0gMjMuMTEuMjAgdW0gMDU6NTQgc2Nocmll
YiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+PiBPbiAxMS8yMS8yMCA5OjE1IEFNLCBDaHJpc3Rp
YW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+PiBBbSAyMS4xMS4yMCB1bSAwNjoyMSBzY2hyaWViIEFu
ZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4+Pj4gV2lsbCBiZSB1c2VkIHRvIHJlcm91dGUgQ1BVIG1h
cHBlZCBCTydzIHBhZ2UgZmF1bHRzIG9uY2UKPj4+Pj4+Pj4+IGRldmljZSBpcyByZW1vdmVkLgo+
Pj4+Pj4+PiBVZmYsIG9uZSBwYWdlIGZvciBlYWNoIGV4cG9ydGVkIERNQS1idWY/IFRoYXQncyBu
b3Qgc29tZXRoaW5nIHdlIGNhbiBkby4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gV2UgbmVlZCB0byBmaW5k
IGEgZGlmZmVyZW50IGFwcHJvYWNoIGhlcmUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IENhbid0IHdlIGNh
bGwgYWxsb2NfcGFnZSgpIG9uIGVhY2ggZmF1bHQgYW5kIGxpbmsgdGhlbSB0b2dldGhlcgo+Pj4+
Pj4+PiBzbyB0aGV5IGFyZSBmcmVlZCB3aGVuIHRoZSBkZXZpY2UgaXMgZmluYWxseSByZWFwZWQ/
Cj4+Pj4+Pj4gRm9yIHN1cmUgYmV0dGVyIHRvIG9wdGltaXplIGFuZCBhbGxvY2F0ZSBvbiBkZW1h
bmQgd2hlbiB3ZSByZWFjaAo+Pj4+Pj4+IHRoaXMgY29ybmVyIGNhc2UsIGJ1dCB3aHkgdGhlIGxp
bmtpbmcgPwo+Pj4+Pj4+IFNob3VsZG4ndCBkcm1fcHJpbWVfZ2VtX2Rlc3Ryb3kgYmUgZ29vZCBl
bm91Z2ggcGxhY2UgdG8gZnJlZSA/Cj4+Pj4+PiBJIHdhbnQgdG8gYXZvaWQga2VlcGluZyB0aGUg
cGFnZSBpbiB0aGUgR0VNIG9iamVjdC4KPj4+Pj4+Cj4+Pj4+PiBXaGF0IHdlIGNhbiBkbyBpcyB0
byBhbGxvY2F0ZSBhIHBhZ2Ugb24gZGVtYW5kIGZvciBlYWNoIGZhdWx0IGFuZCBsaW5rCj4+Pj4+
PiB0aGUgdG9nZXRoZXIgaW4gdGhlIGJkZXYgaW5zdGVhZC4KPj4+Pj4+Cj4+Pj4+PiBBbmQgd2hl
biB0aGUgYmRldiBpcyB0aGVuIGZpbmFsbHkgZGVzdHJveWVkIGFmdGVyIHRoZSBsYXN0IGFwcGxp
Y2F0aW9uCj4+Pj4+PiBjbG9zZWQgd2UgY2FuIGZpbmFsbHkgcmVsZWFzZSBhbGwgb2YgdGhlbS4K
Pj4+Pj4+Cj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+IEhleSwgc3RhcnRlZCB0byBpbXBsZW1lbnQg
dGhpcyBhbmQgdGhlbiByZWFsaXplZCB0aGF0IGJ5IGFsbG9jYXRpbmcgYSBwYWdlCj4+Pj4+IGZv
ciBlYWNoIGZhdWx0IGluZGlzY3JpbWluYXRlbHkKPj4+Pj4gd2Ugd2lsbCBiZSBhbGxvY2F0aW5n
IGEgbmV3IHBhZ2UgZm9yIGVhY2ggZmF1bHRpbmcgdmlydHVhbCBhZGRyZXNzIHdpdGhpbiBhCj4+
Pj4+IFZBIHJhbmdlIGJlbG9uZ2luZyB0aGUgc2FtZSBCTwo+Pj4+PiBhbmQgdGhpcyBpcyBvYnZp
b3VzbHkgdG9vIG11Y2ggYW5kIG5vdCB0aGUgaW50ZW50aW9uLiBTaG91bGQgSSBpbnN0ZWFkIHVz
ZQo+Pj4+PiBsZXQncyBzYXkgYSBoYXNodGFibGUgd2l0aCB0aGUgaGFzaAo+Pj4+PiBrZXkgYmVp
bmcgZmF1bHRpbmcgQk8gYWRkcmVzcyB0byBhY3R1YWxseSBrZWVwIGFsbG9jYXRpbmcgYW5kIHJl
dXNpbmcgc2FtZQo+Pj4+PiBkdW1teSB6ZXJvIHBhZ2UgcGVyIEdFTSBCTwo+Pj4+PiAob3IgZm9y
IHRoYXQgbWF0dGVyIERSTSBmaWxlIG9iamVjdCBhZGRyZXNzIGZvciBub24gaW1wb3J0ZWQgQk9z
KSA/Cj4+Pj4gV2h5IGRvIHdlIG5lZWQgYSBoYXNodGFibGU/IEFsbCB0aGUgc3cgc3RydWN0dXJl
cyB0byB0cmFjayB0aGlzIHNob3VsZAo+Pj4+IHN0aWxsIGJlIGFyb3VuZDoKPj4+PiAtIGlmIGdl
bV9iby0+ZG1hX2J1ZiBpcyBzZXQgdGhlIGJ1ZmZlciBpcyBjdXJyZW50bHkgZXhwb3J0ZWQgYXMg
YSBkbWEtYnVmLAo+Pj4+IMKgwqDCoCBzbyBkZWZlbnNpdmVseSBhbGxvY2F0ZSBhIHBlci1ibyBw
YWdlCj4+Pj4gLSBvdGhlcndpc2UgYWxsb2NhdGUgYSBwZXItZmlsZSBwYWdlCj4+Pgo+Pj4gVGhh
dCBleGFjdGx5IHdoYXQgd2UgaGF2ZSBpbiBjdXJyZW50IGltcGxlbWVudGF0aW9uCj4+Pgo+Pj4K
Pj4+PiBPciBpcyB0aGUgaWRlYSB0byBzYXZlIHRoZSBzdHJ1Y3QgcGFnZSAqIHBvaW50ZXI/IFRo
YXQgZmVlbHMgYSBiaXQgbGlrZQo+Pj4+IG92ZXItb3B0aW1pemluZyBzdHVmZi4gQmV0dGVyIHRv
IGhhdmUgYSBzaW1wbGUgaW1wbGVtZW50YXRpb24gZmlyc3QgYW5kCj4+Pj4gdGhlbiB0dW5lIGl0
IGlmIChhbmQgb25seSBpZikgYW55IHBhcnQgb2YgaXQgYmVjb21lcyBhIHByb2JsZW0gZm9yIG5v
cm1hbAo+Pj4+IHVzYWdlLgo+Pj4KPj4+IEV4YWN0bHkgLSB0aGUgaWRlYSBpcyB0byBhdm9pZCBh
ZGRpbmcgZXh0cmEgcG9pbnRlciB0byBkcm1fZ2VtX29iamVjdCwKPj4+IENocmlzdGlhbiBzdWdn
ZXN0ZWQgdG8gaW5zdGVhZCBrZWVwIGEgbGlua2VkIGxpc3Qgb2YgZHVtbXkgcGFnZXMgdG8gYmUK
Pj4+IGFsbG9jYXRlZCBvbiBkZW1hbmQgb25jZSB3ZSBoaXQgYSB2bV9mYXVsdC4gSSB3aWxsIHRo
ZW4gYWxzbyBwcmVmYXVsdCB0aGUgCj4+PiBlbnRpcmUKPj4+IFZBIHJhbmdlIGZyb20gdm1hLT52
bV9lbmQgLSB2bWEtPnZtX3N0YXJ0IHRvIHZtYS0+dm1fZW5kIGFuZCBtYXAgdGhlbQo+Pj4gdG8g
dGhhdCBzaW5nbGUgZHVtbXkgcGFnZS4KPj4gVGhpcyBzdHJvbmdseSBmZWVscyBsaWtlIHByZW1h
dHVyZSBvcHRpbWl6YXRpb24uIElmIHlvdSdyZSB3b3JyaWVkIGFib3V0Cj4+IHRoZSBvdmVyaGVh
ZCBvbiBhbWRncHUsIHBheSBkb3duIHRoZSBkZWJ0IGJ5IHJlbW92aW5nIG9uZSBvZiB0aGUgcmVk
dW5kYW50Cj4+IHBvaW50ZXJzIGJldHdlZW4gZ2VtIGFuZCB0dG0gYm8gc3RydWN0cyAoSSB0aGlu
ayB3ZSBzdGlsbCBoYXZlIHNvbWUpIDotKQo+Pgo+PiBVbnRpbCB3ZSd2ZSBudWtlZCB0aGVzZSBl
YXN5Jm9idmlvdXMgb25lcyB3ZSBzaG91bGRuJ3QgcGxheSAiYXZvaWQgMQo+PiBwb2ludGVyIGp1
c3QgYmVjYXVzZSIgZ2FtZXMgd2l0aCBoYXNodGFibGVzLgo+PiAtRGFuaWVsCj4KPgo+IFdlbGws
IGlmIHlvdSBhbmQgQ2hyaXN0aWFuIGNhbiBhZ3JlZSBvbiB0aGlzIGFwcHJvYWNoIGFuZCBzdWdn
ZXN0IG1heWJlIHdoYXQgCj4gcG9pbnRlciBpcwo+IHJlZHVuZGFudCBhbmQgY2FuIGJlIHJlbW92
ZWQgZnJvbSBHRU0gc3RydWN0IHNvIHdlIGNhbiB1c2UgdGhlICdjcmVkaXQnIHRvIGFkZCAKPiB0
aGUgZHVtbXkgcGFnZQo+IHRvIEdFTSBJIHdpbGwgYmUgaGFwcHkgdG8gZm9sbG93IHRocm91Z2gu
Cj4KPiBQLlMgSGFzaCB0YWJsZSBpcyBvZmYgdGhlIHRhYmxlIGFueXdheSBhbmQgd2UgYXJlIHRh
bGtpbmcgb25seSBhYm91dCBsaW5rZWQgCj4gbGlzdCBoZXJlIHNpbmNlIGJ5IHByZWZhdWx0aW5n
Cj4gdGhlIGVudGlyZSBWQSByYW5nZSBmb3IgYSB2bWYtPnZtYSBpIHdpbGwgYmUgYXZvaWRpbmcg
cmVkdW5kYW50IHBhZ2UgZmF1bHRzIHRvIAo+IHNhbWUgVk1BIFZBIHJhbmdlIGFuZCBzbwo+IGRv
bid0IG5lZWQgdG8gc2VhcmNoIGFuZCByZXVzZSBhbiBleGlzdGluZyBkdW1teSBwYWdlIGJ1dCBz
aW1wbHkgY3JlYXRlIGEgbmV3IAo+IG9uZSBmb3IgZWFjaCBuZXh0IGZhdWx0Lgo+Cj4gQW5kcmV5
Cj4KPgo+Pgo+Pj4gQW5kcmV5Cj4+Pgo+Pj4KPj4+PiAtRGFuaWVsCj4+Pj4KPj4+Pj4gQW5kcmV5
Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Pj4gQW5kcmV5Cj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+PiBSZWdh
cmRzLAo+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+Pj4+Pj4+
IC0tLQo+Pj4+Pj4+Pj4gwqAgwqAgZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmPCoCB8wqAgOCAr
KysrKysrKwo+Pj4+Pj4+Pj4gwqAgwqAgZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jIHwgMTAg
KysrKysrKysrKwo+Pj4+Pj4+Pj4gwqAgwqAgaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaMKgwqDCoMKg
wqAgfMKgIDIgKysKPj4+Pj4+Pj4+IMKgIMKgIGluY2x1ZGUvZHJtL2RybV9nZW0uaMKgwqDCoMKg
wqDCoCB8wqAgMiArKwo+Pj4+Pj4+Pj4gwqAgwqAgNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZmlsZS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKPj4+Pj4+Pj4+IGluZGV4IDBh
YzQ1NjYuLmZmM2QzOWYgMTAwNjQ0Cj4+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZpbGUuYwo+Pj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKPj4+Pj4+
Pj4+IEBAIC0xOTMsNiArMTkzLDEyIEBAIHN0cnVjdCBkcm1fZmlsZSAqZHJtX2ZpbGVfYWxsb2Mo
c3RydWN0IGRybV9taW5vciAKPj4+Pj4+Pj4+ICptaW5vcikKPj4+Pj4+Pj4+IMKgIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X3ByaW1lX2Rlc3Ryb3k7Cj4+Pj4+Pj4+PiDCoCDC
oMKgwqDCoMKgIH0KPj4+Pj4+Pj4+IMKgIMKgICvCoMKgwqAgZmlsZS0+ZHVtbXlfcGFnZSA9IGFs
bG9jX3BhZ2UoR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOwo+Pj4+Pj4+Pj4gK8KgwqDCoCBpZiAo
IWZpbGUtPmR1bW15X3BhZ2UpIHsKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXQgPSAtRU5P
TUVNOwo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X3ByaW1lX2Rlc3Ryb3k7Cj4+
Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+IMKgIMKgwqDCoMKgwqAgcmV0
dXJuIGZpbGU7Cj4+Pj4+Pj4+PiDCoCDCoCDCoCBvdXRfcHJpbWVfZGVzdHJveToKPj4+Pj4+Pj4+
IEBAIC0yODksNiArMjk1LDggQEAgdm9pZCBkcm1fZmlsZV9mcmVlKHN0cnVjdCBkcm1fZmlsZSAq
ZmlsZSkKPj4+Pj4+Pj4+IMKgIMKgwqDCoMKgwqAgaWYgKGRldi0+ZHJpdmVyLT5wb3N0Y2xvc2Up
Cj4+Pj4+Pj4+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2LT5kcml2ZXItPnBvc3RjbG9zZShk
ZXYsIGZpbGUpOwo+Pj4+Pj4+Pj4gwqAgwqAgK8KgwqDCoCBfX2ZyZWVfcGFnZShmaWxlLT5kdW1t
eV9wYWdlKTsKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+IGRybV9wcmltZV9kZXN0cm95X2ZpbGVfcHJp
dmF0ZSgmZmlsZS0+cHJpbWUpOwo+Pj4+Pj4+Pj4gV0FSTl9PTighbGlzdF9lbXB0eSgmZmlsZS0+
ZXZlbnRfbGlzdCkpOwo+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+Pj4+Pj4+Pj4gaW5kZXggMTY5
M2FhNy4uOTg3YjQ1YyAxMDA2NDQKPj4+Pj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cHJpbWUuYwo+Pj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4+Pj4+
Pj4+PiBAQCAtMzM1LDYgKzMzNSwxMyBAQCBpbnQgZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUo
c3RydWN0IGRybV9kZXZpY2UgCj4+Pj4+Pj4+PiAqZGV2LAo+Pj4+Pj4+Pj4gwqAgwqAgwqDCoMKg
wqDCoCByZXQgPSBkcm1fcHJpbWVfYWRkX2J1Zl9oYW5kbGUoJmZpbGVfcHJpdi0+cHJpbWUsCj4+
Pj4+Pj4+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfYnVmLCAqaGFuZGxlKTsK
Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKCFyZXQpIHsKPj4+Pj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBvYmotPmR1bW15X3BhZ2UgPSBhbGxvY19wYWdlKEdGUF9LRVJORUwgfCBfX0dG
UF9aRVJPKTsKPj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIW9iai0+ZHVtbXlfcGFnZSkK
Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IC1FTk9NRU07Cj4+Pj4+Pj4+
PiArwqDCoMKgIH0KPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+IG11dGV4X3VubG9jaygmZmlsZV9wcml2
LT5wcmltZS5sb2NrKTsKPj4+Pj4+Pj4+IMKgIMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+Pj4+Pj4+
IMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGZhaWw7Cj4+Pj4+Pj4+PiBAQCAtMTAyMCw2ICsx
MDI3LDkgQEAgdm9pZCBkcm1fcHJpbWVfZ2VtX2Rlc3Ryb3koc3RydWN0Cj4+Pj4+Pj4+PiBkcm1f
Z2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qgc2dfdGFibGUgKnNnKQo+Pj4+Pj4+Pj4gwqAgwqDCoMKg
wqDCoMKgwqDCoMKgIGRtYV9idWZfdW5tYXBfYXR0YWNobWVudChhdHRhY2gsIHNnLCBETUFfQklE
SVJFQ1RJT05BTCk7Cj4+Pj4+Pj4+PiDCoCDCoMKgwqDCoMKgIGRtYV9idWYgPSBhdHRhY2gtPmRt
YWJ1ZjsKPj4+Pj4+Pj4+IMKgIMKgwqDCoMKgwqAgZG1hX2J1Zl9kZXRhY2goYXR0YWNoLT5kbWFi
dWYsIGF0dGFjaCk7Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiArwqDCoMKgIF9fZnJlZV9wYWdlKG9i
ai0+ZHVtbXlfcGFnZSk7Cj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+PiDCoCDCoMKgwqDCoMKgIC8qIHJl
bW92ZSB0aGUgcmVmZXJlbmNlICovCj4+Pj4+Pj4+PiDCoCDCoMKgwqDCoMKgIGRtYV9idWZfcHV0
KGRtYV9idWYpOwo+Pj4+Pj4+Pj4gwqAgwqAgfQo+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvZHJtL2RybV9maWxlLmggYi9pbmNsdWRlL2RybS9kcm1fZmlsZS5oCj4+Pj4+Pj4+PiBpbmRl
eCA3MTY5OTBiLi4yYTAxMWZjIDEwMDY0NAo+Pj4+Pj4+Pj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJt
X2ZpbGUuaAo+Pj4+Pj4+Pj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaAo+Pj4+Pj4+Pj4g
QEAgLTM0Niw2ICszNDYsOCBAQCBzdHJ1Y3QgZHJtX2ZpbGUgewo+Pj4+Pj4+Pj4gwqAgwqDCoMKg
wqDCoMKgICovCj4+Pj4+Pj4+PiDCoCDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fcHJpbWVfZmlsZV9w
cml2YXRlIHByaW1lOwo+Pj4+Pj4+Pj4gwqAgwqAgK8KgwqDCoCBzdHJ1Y3QgcGFnZSAqZHVtbXlf
cGFnZTsKPj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+IMKgIMKgwqDCoMKgwqAgLyogcHJpdmF0ZTogKi8K
Pj4+Pj4+Pj4+IMKgIMKgICNpZiBJU19FTkFCTEVEKENPTkZJR19EUk1fTEVHQUNZKQo+Pj4+Pj4+
Pj4gwqAgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGxvY2tfY291bnQ7IC8qIERSSTEgbGVnYWN5
IGxvY2sgY291bnQgKi8KPj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2Vt
LmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKPj4+Pj4+Pj4+IGluZGV4IDMzN2E0ODMuLjc2YTk3
YTMgMTAwNjQ0Cj4+Pj4+Pj4+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKPj4+Pj4+Pj4+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaAo+Pj4+Pj4+Pj4gQEAgLTMxMSw2ICszMTEsOCBA
QCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qgewo+Pj4+Pj4+Pj4gwqAgwqDCoMKgwqDCoMKgICoKPj4+
Pj4+Pj4+IMKgIMKgwqDCoMKgwqDCoCAqLwo+Pj4+Pj4+Pj4gwqAgwqDCoMKgwqDCoCBjb25zdCBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgKmZ1bmNzOwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4g
K8KgwqDCoCBzdHJ1Y3QgcGFnZSAqZHVtbXlfcGFnZTsKPj4+Pj4+Pj4+IMKgIMKgIH07Cj4+Pj4+
Pj4+PiDCoCDCoCDCoCAvKioKPj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+Pj4+Pj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+Pj4+Pj4gYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+Pj4+PiBodHRwczovL25hbTExLnNhZmVsaW5r
cy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVz
a3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRhPTA0JTdDMDEl
N0NBbmRyZXkuR3JvZHpvdnNreSU0MGFtZC5jb20lN0NjYWNjY2Y5ZDY4YzM0ZDhlODBlNzA4ZDhi
MzI5OWMwZCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0
NTYzMzg1OTQ4ODQzNjMlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01E
QWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZh
bXA7c2RhdGE9WjlhVHRCaEJNSjhydmVuUnlFSDd3MUtwUVVLSnhRR2FLR2dvV1BXcW9tbyUzRCZh
bXA7cmVzZXJ2ZWQ9MCAKPj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+PiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QK
Pj4+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+Pj4+PiBodHRwczovL25hbTEx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0
cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRh
PTA0JTdDMDElN0NBbmRyZXkuR3JvZHpvdnNreSU0MGFtZC5jb20lN0NjYWNjY2Y5ZDY4YzM0ZDhl
ODBlNzA4ZDhiMzI5OWMwZCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3
QzAlN0M2Mzc0NTYzMzg1OTQ4ODQzNjMlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lN
QzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNE
JTdDMTAwMCZhbXA7c2RhdGE9WjlhVHRCaEJNSjhydmVuUnlFSDd3MUtwUVVLSnhRR2FLR2dvV1BX
cW9tbyUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4+Pj4+Cj4+Pj4+PgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
