Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9610735D974
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 09:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F796E222;
	Tue, 13 Apr 2021 07:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444A36E221;
 Tue, 13 Apr 2021 07:57:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYMv9dL01+dpzYbN5b0MlJRUEG0nIrdC6/iJwYhBeTRhYoPhrIIP0GI+IOIeT8UEQeTtTgzk0Kzta+0zeRalyUZPdUc0ZozE0AIru4b8vpl2l0CxeAJYOZVwjDZLYBi2bTkebCA1yXsea/4NJNp7u8KVk9QFn3GPry19iDLf1PqtxlKobLB68XnB4+D9PcqY3LK9JDq4drepq58pLNuCYRsoLKNxEJZE9lB1rGdTtTmKhqUEt59vhvMqA+TYoFnQuYhfJ7OPVFlhYOJ26p/7B75qM5k5dkScbOg8JEjBLILQxJp3DUTXRtUfsP8z4w4yR18z2+FRvkld0q7M4XJV7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksCaoZPZtmjacCBBeFbAfPgBUiuRl1cKj1b2BTNu+WA=;
 b=IJZy4xoS9Ci0YayfZhEuZUoiQivcA/X4k1f/+8qdGyfrhwAMGnvoNmrmdNu9835u5kOuQljQ4QDjyfkGqVETablUq0yJZg2+Flomw/RCIa0cIr1w1G/KXBHArFifcRZ1OiQSLEoDJ+dxO+8XEFLTFE81XAe5PzbadgOdpDu0n3TEPuWhthHlEYDGYILQUSRfCMzggIo5hHIWk3GkBrrL9B/FkbQh5JfHMCjX4glr1kP6lHprYPzLSsmgXXzazPw1x0Hjen53e/EwVJHczUmQ5PHp61JlB3lcZTrqqWfiX2/MbIcD6yQwGigiCZrCDCY9PZgB1WtDbz4wA4GQy8m2rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksCaoZPZtmjacCBBeFbAfPgBUiuRl1cKj1b2BTNu+WA=;
 b=lBIpumPZ7nAMHdTzyVNsGcNLeKpoiKGGDZ7BQCk7tVdQN6CmJHIIRFM7zppQNF2XW+vMQhc4EJHowOYhlFoLxGU+kyA2LZUVFat9xCmDyol0EFAuJbkY8xxf91jkSm9obg7r6hc4sgILuY5cGbz4hr+tFlKiZMlkgqk79vf/Qw0=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4868.namprd12.prod.outlook.com (2603:10b6:208:1c4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Tue, 13 Apr
 2021 07:57:13 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 07:57:13 +0000
Subject: Re: [RFC] Cross-driver ww transaction lock lists
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <62e5b25ce7e22633c09fb0242a69d268b3b45595.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d5ad41b9-0248-285b-8873-b8010e7c8c27@amd.com>
Date: Tue, 13 Apr 2021 09:57:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <62e5b25ce7e22633c09fb0242a69d268b3b45595.camel@linux.intel.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:acbc:5f44:93b6:4587]
X-ClientProxiedBy: PR3PR09CA0012.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::17) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:acbc:5f44:93b6:4587]
 (2a02:908:1252:fb60:acbc:5f44:93b6:4587) by
 PR3PR09CA0012.eurprd09.prod.outlook.com (2603:10a6:102:b7::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Tue, 13 Apr 2021 07:57:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 849cb354-e1e6-4bc3-21bc-08d8fe51bf64
X-MS-TrafficTypeDiagnostic: BL0PR12MB4868:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4868503BD12E07853D723018834F9@BL0PR12MB4868.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i9kiAwtGA0T/0UfFgp4LeGsrBhPdExNUxGLHjTMhpEbtmp7IPX8g2CCafvbwCeuU4NADVf1d4BDgiOkyePlbXXt8gFdjK3UMWiebXGIjQ6q42lKiD+RdT+e7yncl3OyeslXOksvaWhfX+GFzjPshFdCYpi112CWPV+66nt3Hq8TCGQLFRJ1TNbNK5QQTg3cunUuhyXpx4gWRiqPgVLi2x7qWdu4zdIsEL5z6b7nJsN4UG99ZBCK9J53llLLfrSlyvhgT2YVl6vJq6fPvCwaIxkO/1Xk4zANCVMCQImmQaQKGI6eqX7VRXgE6kMAGEGjp3UjA/Gclqr8aS0+pJmFdQ/guc5TGqK9EZ8SHnoLbaXgwPEcwKu0ciXJBhpcTNdQfgOw4hUhyt+WZ9xnkIUowXAkl0LnkffA8ThNHm3J9K9jnkdZj+UW7ZgYcLxaYSRBqnq9oXOyeWiP29+9gRx691t1/QNC0OgIE1m4n+JV8ATUJRY7T37kVMsVM6t4lWZaKoXsk5vjkg/vye8O49o3/J4cpE55vTeQRUDk8EvOhpjLBKazI/RYV3sWlpMU04gGGeSuuuYMtFqLCKb5UyvH3L+WAYZCTUVKq0R0qJwo5jHb7+rAD00+x7cgkEtkiBWAcnetQwCTqrW/MmX5xECDup+cjDIvgg57QELi3abz9hD3Uxa/EaTEjW1GSvqR+bVMH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(86362001)(6486002)(54906003)(6666004)(186003)(16526019)(66946007)(316002)(478600001)(2906002)(31686004)(8676002)(4326008)(66574015)(5660300002)(31696002)(83380400001)(66556008)(66476007)(2616005)(36756003)(38100700002)(52116002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QjQwRXdXUU9CUnU4cnlVNnVyKzNvVFpkT2RDdmt3Mm9SQi9wUXh0Sis3R25X?=
 =?utf-8?B?QjV6QWZuRkY3OHRxUWMwOVFZWTNNMVFBNnZseHo4MkxLdDI2VEFpd0RSMmo0?=
 =?utf-8?B?UHRmbDZoeUdoQUw1Qkh6S1V3K1lISnIwUFlUemtINVFnSzBDN3lZMkt6K2hQ?=
 =?utf-8?B?RG9rekVpL05oTVB3Smd2NG04ekphQXFkSC9HMi9zU01zUkVZa0srSjdXN3NB?=
 =?utf-8?B?YWNFOGsyNXAwSjdyOGtMWWNnZy9CWjhSaWovV0lZNmlWbFJtYnZSWUlweFVx?=
 =?utf-8?B?cVprSHp1MVV1Ry9ISll4aFVmRk4reDFQK3gyTkFRRzJuQ2ptaHdtSTJPaGtn?=
 =?utf-8?B?OUxCWDFKMXA3Rkl2b1k5V2QxYzVBemcybUhqWWFlRCtwTXphQTk2VUxsUnRT?=
 =?utf-8?B?MEhaZEx4VXl6R2UwTUVTcHRVakRrNmlDL3pudzlPSmVHTXZ3NjIvUlFWa1Uw?=
 =?utf-8?B?elRvQldwUkZBSkFVV0ZBMXdacWhDajdMbG5oa3hvZGtRUnNFVFM1NnNLQzYy?=
 =?utf-8?B?eGlIejZ0aXpYb1JLT3pGWnFkeHYxQ1A3TjVLRUZPRTZKcGNLek1DS2ZiWU5Z?=
 =?utf-8?B?MGhieklIcXE0Q2J6NVJpOURIdnZHVE5yVXFBZEFYckdPR2dHVkVoanViZjRN?=
 =?utf-8?B?dmhyblN4b0V6aEJXSU9uOEcvdDYySFBxc1RSRUJ4U0hGa1NSRC9oUjAvenJD?=
 =?utf-8?B?dmw2VU44RVhNVHhBMzQ1T2VZUm00RlZ1dE95ZFpFUHFTWHh4NHkzc3k1c3Jv?=
 =?utf-8?B?TmRVTEorUUs4SHB4TTdGWmRKaGRrRlhwVE9LVStVLytHU3BHcTNQRVBJNFBM?=
 =?utf-8?B?b25PbDJBVUxtRjdRWjJnT1pMYlAreFpGODlHUXdVeFNiN0FheWtwUGJwNVRx?=
 =?utf-8?B?ajZnaWZ3UEhqV2NJc3VzQlFLR29ESG1IazYvenlRd25qWDNnSGs0dVY0SXNM?=
 =?utf-8?B?QjVNUkViYWM0TzZ4bHU1bDNhdDE2U0VNQjIxT2FhSmhpTHBHQ1YwK0IwYWFr?=
 =?utf-8?B?NlZUMHJNZ1ZKbE82L0NRdkNXVVgzS1FaUGk0L3Iwc3lkQTFlWi9ibE5aRm9U?=
 =?utf-8?B?aGdJdERtZDdFQWdjMWhuSDh0MWdTQmNKb1h5cEpLc1F0RlJzTUVxTGkxMGU4?=
 =?utf-8?B?QkFIdUQxZ1R0aEdwWFV5OFZKYW04WGQ1dmtycUx2cHBWc0dJL04zZVF2cW1q?=
 =?utf-8?B?S0gzeCtOVG93V1ZVZllUMFZ1aDJveEorNkxvUTZZZnpYTnd2ampqbUgwbVBZ?=
 =?utf-8?B?RWpKMUVUeE9CdUlaVVNmZU5ob1JTcWVwdGVEZFhLVUFUZkJ2dDdIckQyMFls?=
 =?utf-8?B?TExpU29MdmI1OTJZMHZ3dmRRL2FvcmJVVmxwN0IzK1RsYmdzdmxVRWxkam4v?=
 =?utf-8?B?dVlpSEFRcFpuR2xacmo5UmIwTkh2cit4cVRPcFlhUG1IbGEvWGZ6b05IamdO?=
 =?utf-8?B?VVJXbHpzb2czUFdkalF4RXVzaW1rSU1tQ0ZPMjlBak9aRzVHcXJzWUR3c21R?=
 =?utf-8?B?YWxkaVpHbXF1VWptamdaTzdPeE5TcnBIOUt3MFljV01BSTRSUW1zV1NNTnd3?=
 =?utf-8?B?Y1hGVEhGMlFvVHVrdDZndklhRjd5R0ZoajkycDVtU25MeldqTXVVaU12TlI4?=
 =?utf-8?B?cXRwOExxWXNCNXZVL1pnbnVTSTRzVXFPTld1Wkd4Z3dLMmhXZ1BwbUZtVFZG?=
 =?utf-8?B?d3ZTVUVvNEJ6Vzg4RnlEMi9BQW9Rd3c3SXZSYlZmUmt1YkRwanlZSHB4SGVK?=
 =?utf-8?B?bkM3Z0VxNjZkOTBicHpGdTlpbnJIUW1ISThSNlZETFlKcVFNYVArZFBNUFgy?=
 =?utf-8?B?NkgzdEc2UHdVTnRVYy9tSzdGZzE0TVE0RmZKRndOZWJJbUlaa0hVRHhoeUNU?=
 =?utf-8?Q?3WylaJ7TZkovw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 849cb354-e1e6-4bc3-21bc-08d8fe51bf64
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2021 07:57:13.1820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhzB340TjIfeAcHcJUPwTEONyYk8mQvS+qUhxEnLLUuARLlewvEZc2YNkdjh18pu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4868
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
Cc: intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Matthew Auld <matthew.auld@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAxMy4wNC4yMSB1bSAwOTo1MCBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtOgo+IEhpIQo+
Cj4gRHVyaW5nIHRoZSBkbWFfcmVzdiBjb252ZXJzaW9uIG9mIHRoZSBpOTE1IGRyaXZlciwgd2Un
dmUgYmVlbiB1c2luZyB3dwo+IHRyYW5zYWN0aW9uIGxvY2sgbGlzdHMgdG8ga2VlcCB0cmFjayBv
ZiB3d19tdXRleGVzIHRoYXQgYXJlIGxvY2tlZAo+IGR1cmluZyB0aGUgdHJhbnNhY3Rpb24gc28g
dGhhdCB0aGV5IGNhbiBiZSBiYXRjaCB1bmxvY2tlZCBhdCBzdWl0YWJsZQo+IGxvY2F0aW9ucy4g
SW5jbHVkaW5nIGFsc28gdGhlIExNRU0vVlJBTSBldmljdGlvbiB3ZSd2ZSBlbmRlZCB1cCB3aXRo
Cj4gdHdvIHN0YXRpYyBsaXN0cyBwZXIgdHJhbnNhY3Rpb24gY29udGV4dDsgb25lIHR5cGljYWxs
eSB1bmxvY2tlZCBhdCB0aGUKPiBlbmQgb2YgdHJhbnNhY3Rpb24gYW5kIG9uZSBpbml0aWFsaXpl
ZCBiZWZvcmUgYW5kIHVubG9ja2VkIGFmdGVyIGVhY2gKPiBidWZmZXIgb2JqZWN0IHZhbGlkYXRl
LiBUaGlzIGVuYWJsZXMgdXMgdG8gZG8gc2xlZXBpbmcgbG9ja2luZyBhdAo+IGV2aWN0aW9uIGFu
ZCBrZWVwIG9iamVjdHMgbG9ja2VkIG9uIHRoZSBldmljdGlvbiBsaXN0IHVudGlsIHdlCj4gZXZl
bnR1YWxseSBzdWNjZWVkIGFsbG9jYXRpbmcgbWVtb3J5IChtb2R1bG8gbWlub3IgZmxhd3Mgb2Yg
Y291cnNlKS4KPgo+IEl0IHdvdWxkIGJlIGJlbmVmaWNpYWwgd2l0aCB0aGUgaTkxNSBUVE0gY29u
dmVyc2lvbiB0byBiZSBhYmxlIHRvCj4gaW50cm9kdWNlIGEgc2ltaWxhciBmdW5jdGlvbmFsaXR5
IHRoYXQgd291bGQgd29yayBpbiB0dG0gYnV0IGFsc28KPiBjcm9zcy1kcml2ZXIgaW4sIGZvciBl
eGFtcGxlIG1vdmVfbm90aWZ5LiBJdCB3b3VsZCBhbHNvIGJlIGJlbmVmaWNpYWwKPiB0byBiZSBh
YmxlIHRvIHB1dCBhbnkgZG1hX3Jlc3Ygd3cgbXV0ZXggb24gdGhlIGxpc3RzLCBhbmQgbm90IHJl
cXVpcmUKPiBpdCB0byBiZSBlbWJlZGRlZCBpbiBhIHBhcnRpY3VsYXIgb2JqZWN0IHR5cGUuCj4K
PiBJIHN0YXJ0ZWQgc2NldGNoaW5nIG9uIHNvbWUgdXRpbGl0aWVzIGZvciB0aGlzLiBGb3IgVFRN
LCBmb3IgZXhhbXBsZSwKPiB0aGUgaWRlYSB3b3VsZCBiZSB0byBwYXNzIGEgbGlzdCBoZWFkIGZv
ciB0aGUgd3cgdHJhbnNhY3Rpb24gbG9jayBsaXN0Cj4gaW4gdGhlIHR0bV9vcGVyYXRpb25fY3R4
LiBBIGZ1bmN0aW9uIHRha2luZyBhIHd3X211dGV4IGNvdWxkIHRoZW4KPiBlaXRoZXIgYXR0YWNo
IGEgZ3JhYmJlZCBsb2NrIHRvIHRoZSBsaXN0IGZvciBiYXRjaCB1bmxvY2tpbmcsIG9yIGJlCj4g
cmVzcG9uc2libGUgZm9yIHVubG9ja2luZyB3aGVuIHRoZSBsb2NrJ3Mgc2NvcGUgaXMgZXhpdGVk
LiBJdCdzIGFsc28KPiBwb3NzaWJsZSB0byBjcmVhdGUgc3VibGlzdHMgaWYgc28gZGVzaXJlZC4g
SSBiZWxpZXZlIHRoZSBiZWxvdyB3b3VsZCBiZQo+IHN1ZmZpY2llbnQgdG8gY292ZXIgdGhlIGk5
MTUgZnVuY3Rpb25hbGl0eS4KPgo+IEFueSBjb21tZW50cyBhbmQgc3VnZ2VzdGlvbnMgYXBwcmVj
aWF0ZWQhCgphaCB5ZXMgRGFuaWVsIGFuZCBJIGhhdmVuIGJlZW4gZGlzY3Vzc2luZyBzb21ldGhp
bmcgbGlrZSB0aGlzIGZvciB5ZWFycy4KCkkgYWxzbyBjYW1lIHVwIHdpdGggcm91Z2ggaW1wbGVt
ZW50YXRpb24sIGJ1dCB3ZSBhbHdheXMgcmFuIGludG8gCmxpZmV0aW1lIGlzc3Vlcy4KCkluIG90
aGVyIHdvcmRzIHRoZSB3d19tdXRleGVzIHdoaWNoIGFyZSBvbiB0aGUgbGlzdCB3b3VsZCBuZWVk
IHRvIGJlIAprZXB0IGFsaXZlIHVudGlsIHVubG9ja2VkLgoKQmVjYXVzZSBvZiB0aGlzIHdlIGtp
bmQgb2YgYmFja2VkIHVwIGFuZCBzYWlkIHdlIHdvdWxkIG5lZWQgdGhpcyBvbiB0aGUgCkdFTSBs
ZXZlbCBpbnN0ZWFkIG9mIHdvcmtpbmcgd2l0aCBkbWFfcmVzdiBvYmplY3RzLgoKUmVnYXJkcywK
Q2hyaXN0aWFuLgoKPgo+IDg8LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4KPiAjaWZuZGVmIF9UUkFOU0FDVElPTl9MT0NLTElTVF9IXwo+ICNk
ZWZpbmUgX1RSQU5TQUNUSU9OX0xPQ0tMSVNUX0hfCj4KPiBzdHJ1Y3QgdHJhbnNfbG9ja2l0ZW07
Cj4KPiAvKioKPiAgICogc3RydWN0IHRyYW5zX2xvY2tsaXN0X29wcyAtIE9wcyBzdHJ1Y3R1cmUg
Zm9yIHRoZSB3dyBsb2NrbGlzdAo+IGZ1bmN0aW9uYWxpdHkuCj4gICAqCj4gICAqIFR5cGljYWxs
eSBhIGNvbnN0IHN0cnVjdCB0cmFuc19sb2NrbGlzdF9vcHMgaXMgZGVmaW5lZCBmb3IgZWFjaCB0
eXBlCj4gdGhhdAo+ICAgKiBlbWJlZHMgYSBzdHJ1Y3QgdHJhbnNfbG9ja2l0ZW0sIG9yIGhhdiBh
IHN0cnVjdCB0cmFuc19sb2NraXRlbQo+IHBvaW50aW5nCj4gICAqIGF0IGl0IHVzaW5nIHRoZSBw
cml2YXRlIHBvaW50ZXIuIEl0IGNhbiBiZSBhIGJ1ZmZlciBvYmplY3QsCj4gcmVzZXJ2YXRpb24K
PiAgICogb2JqZWN0LCBhIHNpbmdsZSB3d19tdXRleCBvciBldmVuIGEgc3VibGlzdCBvZiB0cmFu
c19sb2NraXRlbXMuCj4gICAqLwo+IHN0cnVjdCB0cmFuc19sb2NrbGlzdF9vcHMgewo+IAkvKioK
PiAJICogc2xvd19sb2NrOiBTbG93IGxvY2sgdG8gcmVsYXggdGhlIHRyYW5zYWN0aW9uLiBPbmx5
IHVzZWQgYnkKPiAJICogYSBjb250ZW5kaW5nIGxvY2sgaXRlbS4KPiAJICogQGl0ZW06IFRoZSBz
dHJ1Y3QgdHJhbnNfbG9ja2l0ZW0gdG8gbG9jawo+IAkgKiBAaW50cjogV2hldGhlciB0byBsb2Nr
IGludGVycnVwdGlibGUKPiAJICoKPiAJICogUmV0dXJuOiAtRVJFU1RBUlRTWVM6IEhpdCBhIHNp
Z25hbCB3aGVuIHJlbGF4aW5nLAo+IAkgKiAtRUFHQUlOLCByZWxheGluZyBzdWNjZXNmdWwsIGJ1
dCB0aGUgY29udGVuZGluZyBsb2NrCj4gCSAqIHJlbWFpbnMgdW5sb2NrZWQuCj4gCSAqLwo+IAlp
bnQgKCpzbG93X2xvY2spIChzdHJ1Y3QgdHJhbnNfbG9ja2l0ZW0gKml0ZW0sIGJvb2wgaW50cik7
Cj4KPiAJLyoqCj4gCSAqIHVubG9jazogVW5sb2NrLgo+IAkgKiBAaXRlbTogVGhlIHN0cnVjdCB0
cmFuc19sb2NraXRlbSB0byB1bmxvY2suCj4gCSAqLwo+IAl2b2lkICgqdW5sb2NrKSAoc3RydWN0
IHRyYW5zX2xvY2tpdGVtICppdGVtKTsKPgo+IAkvKioKPiAJICogdW5sb2NrOiBVbmxvY2suCj4g
CSAqIEBpdGVtOiBUaGUgc3RydWN0IHRyYW5zX2xvY2tpdGVtIHRvIHB1dC4gVGhpcyBmdW5jdGlv
biBtYXkKPiBiZSBOVUxMLgo+IAkgKi8KPiAJdm9pZCAoKnB1dCkgKHN0cnVjdCB0cmFuc19sb2Nr
aXRlbSAqaXRlbSk7Cj4gfTsKPgo+IC8qKgo+ICAgKiBzdHJ1Y3QgdHJhbnNfbG9ja2l0ZW0KPiAg
ICogQG9wczogUG9pbnRlciB0byBhbiBPcHMgc3RydWN0dXJlIGZvciB0aGlzIGxvY2tpdGVtLgo+
ICAgKiBAbGluazogTGlzdCBsaW5rIGZvciB0aGUgdHJhbnNhY3Rpb24gbG9ja2xpc3QuCj4gICAq
IEBwcml2YXRlOiBQcml2YXRlIGluZm8uCj4gICAqIEByZWxheF91bmxvY2s6IFVubG9jayBjb250
ZW5kaW5nIGxvY2sgYWZ0ZXIgcmVsYXhhdGlvbiBzaW5jZSBpdCBpcwo+ICAgKiBsaWtlbHkgbm90
IG5lZWRlZCBhZnRlciBhIHRyYW5zYWN0aW9uIHJlc3RhcnQuCj4gICAqCj4gICAqIEEgc3RydWN0
IHRyYW5zX2xvY2tpdGVtIHR5cGljYWxseSByZXByZXNlbnRzIGEgc2luZ2xlIGxvY2ssIGJ1dCBp
cwo+ICAgKiBnZW5lcmljIGVub3VnaCB0byByZXByZXNlbnQgYSBzdWJsaXN0IG9mIGxvY2tzLiBJ
dCBjYW4gZWl0aGVyIGJlCj4gICAqIGVtYmVkZGVkLCBvciBhbGxvY2F0ZWQgb24gZGVtYW5kLiBB
IGttZW1fY2FjaGUgbWlnaHQgYmUgYmVuZWZpY2lhbC4KPiAgICovCj4gc3RydWN0IHRyYW5zX2xv
Y2tpdGVtIHsKPiAJY29uc3Qgc3RydWN0IHRyYW5zX2xvY2tsaXN0X29wcyAqb3BzOwo+IAlzdHJ1
Y3QgbGlzdF9oZWFkIGxpbms7Cj4gCXUzMiByZWxheF91bmxvY2s6MTsKPiAJdm9pZCAqcHJpdmF0
ZTsKPiB9Owo+Cj4gLyogdW5sb2NrIGV4YW1wbGUgKi8KPiBzdGF0aWMgaW5saW5lIHZvaWQgdHJh
bnNfdW5sb2NrX3B1dF9hbGwoc3RydWN0IGxpc3RfaGVhZCAqbGlzdCkKPiB7Cj4gCXN0cnVjdCB0
cmFuc19sb2NraXRlbSAqbG9jaywgKm5leHQ7Cj4KPiAJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZl
KGxvY2ssIG5leHQsIHR5cGVvZigqbG9jayksIGxpbmspIHsKPiAJCWxvY2stPm9wcy0+dW5sb2Nr
KGxvY2spOwo+IAkJbGlzdF9kZWxfaW5pdCgmbG9jay0+bGluayk7Cj4gCQlpZiAobG9jay0+b3Bz
X3B1dCkKPiAJCQlsb2NrLT5vcHMtPnB1dChsb2NrKTsKPiAJfQo+IH0KPgo+IC8qIEJhY2tvZmYg
ZXhhbXBsZSAqLwo+IHN0YXRpYyBpbmxpbmUgaW50IF9fbXVzdF9jaGVjayB0cmFuc19iYWNrb2Zm
KHN0cnVjdCBsaXN0X2hlYWQgKmxpc3QsCj4gYm9vbCBpbnRyLAo+IAkJCQkJICAgICBzdHJ1Y3Qg
dHJhbnNfbG9ja2l0ZW0KPiAqY29udGVuZGluZykKPiB7Cj4gCWludCByZXQgPSAwOwo+Cj4gCXRy
YW5zX3VubG9ja19wdXRfYWxsKGxpc3QpOwo+IAlpZiAoY29udGVuZGluZykgewo+IAkJcmV0ID0g
Y29udGVuZGluZy0+b3BzLT5zbG93X2xvY2soY29udGVuZGluZywgaW50cik7Cj4gCQlpZiAoIXJl
dCAmJiBjb250ZW5kaW5nLT5yZWxheF91bmxvY2spCj4gCQkJY29udGVuZGluZy0+dW5sb2NrKGNv
bnRlbmRpbmcpOwo+IAkJaWYgKHJldCA9PSAtRUFHQUlOKQo+IAkJCXJldCA9IDA7Cj4gCQljb250
ZW5kaW5nLT5vcHMtPnB1dChjb250ZW5kaW5nKTsKPiAJfQo+Cj4gCXJldHVybiByZXQ7Cj4gfQo+
IAkJCj4gCQkKPiAjZW5kaWYgX1RSQU5TQUNUSU9OX0xPQ0tMSVNUXwo+Cj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
