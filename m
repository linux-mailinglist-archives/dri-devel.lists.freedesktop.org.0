Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C32A2C3CE7
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 10:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4756E8D6;
	Wed, 25 Nov 2020 09:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B806F6E8D6;
 Wed, 25 Nov 2020 09:52:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bz6hKB99Wc9wqYzaO4U6Pe6grt7b0TkpokZVAQ+UA/hBe6qPd3Yl2AfsYzERtM/fdCg5zGQK2PPluRQ98m0zyzCDeWCqsSR+Js+zmPZn5LEe57B9VGN8ECCk3PQTTSKbJ9Iucm2HPI1p+60FqEmyqNOMidxrIRc5qX8qFVXykGOcpV2xlA9ObBqNP/n8g0zAlfUudXBUtI8Mpjdm9k//Qjg29IG2TJRmmfkYnxSm/Etb6f+QYE5LDK+/XkqgwYFV7yefM+bDP2CGzRazJLPPT9mlwqk1j2Zxj+LAYud2OT0SP6Q5R0lPRwSE0Zw4AnZ7gK46mzBH9g4pTrqrDWO4og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxPltZuu2VmbAjy8QxDI2Mekl/GBm395s7cuUoW49N4=;
 b=Z1w9Z5kpSaqe0SY5EbDPbu8Kbr2O0koEStpgjpbepyou3Eicryq6oij+K5OplYBGdbKa6am6dUv79rlStAWOJkPeZD7k4Uh6uRezkKEz1xDOJRDX0ItEDmWUmqav0ND8S4lLBf+/cIYbeRZdOf1UcomeQE2lP+kix2nSN5vV3mXhO0R8em143tFhzTWMVU/leLMx6s8UbrRmkV73352SGJqi22KKqpBvmnWscRC2elFjAQeoGA+CEFY6YS7Q2PgYWFWKiXSuwkqApl5vDbMy0UAI78QPMYgh1LBarr2Kkjyi09EJRx+LNqUuB/ErUq9BGLoJYoKBo4rgfW2h50Wc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dxPltZuu2VmbAjy8QxDI2Mekl/GBm395s7cuUoW49N4=;
 b=OsYYWms6s01vqSNZF/7KmRWrPPXtOszS2hAdBJpFjB7UBu5PcrRc+WlMkjw5BtxwkMBi+JCPIq6Mm7rVXDjoV+Yb22Q8yB+dWP8ZRBsYtQGIo8vgyIybNFzBDC7BIQvGHGP8xwFqjbtJ/MFEtQxCkDdA7wjKPhVbLh0cmssoCqE=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2386.namprd12.prod.outlook.com (2603:10b6:207:47::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 25 Nov
 2020 09:52:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 09:52:03 +0000
Subject: Re: [PATCH 4/6] drm/scheduler: Essentialize the job done callback
To: Luben Tuikov <luben.tuikov@amd.com>,
 Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Alexander Deucher <Alexander.Deucher@amd.com>
References: <769e72ee-b2d0-d75f-cc83-a85be08e231b@amd.com>
 <20201125031708.6433-1-luben.tuikov@amd.com>
 <20201125031708.6433-5-luben.tuikov@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ac9667db-0e78-9454-34ea-3e41ca6dbbd7@amd.com>
Date: Wed, 25 Nov 2020 10:51:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201125031708.6433-5-luben.tuikov@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0086.eurprd02.prod.outlook.com
 (2603:10a6:208:154::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0086.eurprd02.prod.outlook.com (2603:10a6:208:154::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 25 Nov 2020 09:52:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c1ddf27d-ed70-412b-07aa-08d89127c2ef
X-MS-TrafficTypeDiagnostic: BL0PR12MB2386:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2386F6C0ACA6EAE83B8F106383FA0@BL0PR12MB2386.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qLAuF6VHXSAEeEiq7INL9tlIQZyBQKlApNBMlBtx8Dpz03YEKO2jcAmWtttGEsyGyl+yiKaYjbFXmLV644R4ldW/GbcKT65pY0bfm4zVaN55E+S0l9LhBrgx5fl3XJmj7NH2nu5emTvmb0xYmzOrrFb93yxBzxRgQbx6MZg6MiorSccq18OdmqBKUPApLDqWFcPYv4AdzUogG7wABFsZX8U/iT8R84oJRZBnjmk7hLAqPAHUMYLxiC8HMIMz2+7BddZKPXUPtNiky2r1fsCr7nnN6kmUjCku0Y6VNz0oWzFZpDbRBXGCluAWwcLiD0ALgwupqVIDkbLL+gQmIU4DjWU7JITQHdj61E1HDhl5acOdJnwo5Ca/MRwut+PuBlRv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39860400002)(83380400001)(4326008)(186003)(110136005)(2616005)(66556008)(31696002)(8936002)(2906002)(66946007)(66574015)(66476007)(6636002)(6666004)(8676002)(316002)(5660300002)(31686004)(86362001)(52116002)(478600001)(16526019)(6486002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?akhzVG5kQW5scWNCdWZvbGE0UWlWdG9OdlNLNWgwaXBLUGpLbG5xRll6UjdP?=
 =?utf-8?B?SFFBVG9ZSVhQNE9hY3c4Q3dDT0h6N3lhZ2lQVmNrdFpTa2o3T1pTY3hUMVdQ?=
 =?utf-8?B?UzdDUFIrb0tQMFVBVSt0WEZwMk1BbW1ZQ3pOVklxOTMrRC9DV1NSOElodjhW?=
 =?utf-8?B?bTdxOXFCNzNqRjFkMEI0NWpobkRwbnozQ2hCOWJVK0F6MEl4Yjc1R3ZUQVNW?=
 =?utf-8?B?STFINklQSWE1K2pBM2RuVDlscXkyUGh6UlZxckY3OEwrcEFqaWNXOSs4V3NN?=
 =?utf-8?B?QXBVZTczbEVqbUZTTVFUSUZGTXpyOTNobTJSR2hLRGR4ZXY1VnZrMmpvT0JH?=
 =?utf-8?B?YXlEK3drRUt6dU5GZ2liZEhtZHB2YU5sNkFVMDdiVDNJRGFQL1RuV280MlFR?=
 =?utf-8?B?MlJqQ0ZDYmZlbzVTUXJ6RlY1TW1vQWlsS3lYREJLbXIvbDY5QkJCQnEwNXdo?=
 =?utf-8?B?d1VBK2R2UXdqTnBTSHhyREFGYXJDRk9oUzJRTGJ4S0VEZUR3QVZJMDJ4d3V2?=
 =?utf-8?B?UDUzbnk0enVBaXc2R0lzWm9ZRHBFV3U1THZzUTNCQlVyV3ZKNW5nSC9oR3VO?=
 =?utf-8?B?R3U3bkN6TEtmMXAzKzVPcEtyVEgrOVdGakV1WXhDeGgxU3NJcVJDWWtSK1Bl?=
 =?utf-8?B?THRhUGU4U2drSmkvK0hmV2hQNnBMRkdoNTQrQXVSNi9YcVV6YXlBanhLT2l2?=
 =?utf-8?B?RlpJZVRCRERhT2I5ZFU4WkhtYWdwcWQ3Ly9XV3oyNm50T1hUcXg5U3U4dVpo?=
 =?utf-8?B?eS9KNGMwditkM2lsZzZoR0R0TjFaL09DV3NFcmVKMjlFTEcyOWpIMHdWQzlL?=
 =?utf-8?B?c2NPQVpFN08zT0k2ajRRRjUvZFgrUkdRUGVLMjd1a0o0S2RDQTNlSjdXM0w3?=
 =?utf-8?B?aTY3Vnl3WXNzaDBHTTd5cDNQSHJEekhjdm94NVIvNllETWVhT3VIMTVickpS?=
 =?utf-8?B?cDJSdmR6Qm5WREJLOWdObk0rT3hyQ1grSnhsVjRmdkxTTmhIcmg3ci84VVh1?=
 =?utf-8?B?YjBjTDZjL1VqTG83SlhDV0tkbXJrb00wZ0NMMEg3SHJTcmw5Sk5SM0RPWHA1?=
 =?utf-8?B?cy9ITDhLaytJTTJBL3ErZXZxRHZnWmJaQ2d1cFc2aDZLSW5Ja2dtK0VCNlhK?=
 =?utf-8?B?KzU4MUJzd3BhVEs4Q05RcysrWTNCc3ZQYzBZc1NOU093WGZvZTZSdVdxdEZx?=
 =?utf-8?B?UXRlMmNwNkp2UkEzQVYrMUE0MW9jYTZBZENpLytmOFl2Nm1nMDd3UStKMXBi?=
 =?utf-8?B?R1FWZVBVVzBjTit1QUVNbjRDL0FILzVoRzZPclUvSkw3cGhOMzFhK0oybkFk?=
 =?utf-8?B?UGMxMy9ZWVVWeFhYaXJkb3hoZVhRMFU3bWFOQWl0VFpWVGlJdXhJNmdUWG40?=
 =?utf-8?B?dy9YcllRMEhZaUpMY0tzZWhpTG13eGdwV0hwSE5VNnptWVdXNFF5Y0ZrQi9r?=
 =?utf-8?Q?rUdFNwDH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ddf27d-ed70-412b-07aa-08d89127c2ef
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 09:52:03.7609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FVd6IAoPQ/moBCw8A5Qui2mzReby6MlAuHPQIV71wlCXWMUROS4Uh4n0Fc5bDVkC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2386
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
Cc: Emily Deng <Emily.Deng@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMTEuMjAgdW0gMDQ6MTcgc2NocmllYiBMdWJlbiBUdWlrb3Y6Cj4gVGhlIGpvYiBkb25l
IGNhbGxiYWNrIGlzIGNhbGxlZCBmcm9tIHZhcmlvdXMKPiBwbGFjZXMsIGluIHR3byB3YXlzOiBp
biBqb2IgZG9uZSByb2xlLCBhbmQKPiBhcyBhIGZlbmNlIGNhbGxiYWNrIHJvbGUuCj4KPiBFc3Nl
bnRpYWxpemUgdGhlIGNhbGxiYWNrIHRvIGFuIGF0b20KPiBmdW5jdGlvbiB0byBqdXN0IGNvbXBs
ZXRlIHRoZSBqb2IsCj4gYW5kIGludG8gYSBzZWNvbmQgZnVuY3Rpb24gYXMgYSBwcm90b3R5cGUK
PiBvZiBmZW5jZSBjYWxsYmFjayB3aGljaCBjYWxscyB0byBjb21wbGV0ZQo+IHRoZSBqb2IuCj4K
PiBUaGlzIGlzIHVzZWQgaW4gbGF0dGVyIHBhdGNoZXMgYnkgdGhlIGNvbXBsZXRpb24KPiBjb2Rl
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogTHViZW4gVHVpa292IDxsdWJlbi50dWlrb3ZAYW1kLmNvbT4K
ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCA3MyAr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQwIGluc2VydGlv
bnMoKyksIDMzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9z
Y2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9t
YWluLmMKPiBpbmRleCBiNjk0ZGYxMmFhYmEuLjNlYjc2MThhNjI3ZCAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4gQEAgLTYwLDggKzYwLDYgQEAKPiAgICNkZWZp
bmUgdG9fZHJtX3NjaGVkX2pvYihzY2hlZF9qb2IpCQlcCj4gICAJCWNvbnRhaW5lcl9vZigoc2No
ZWRfam9iKSwgc3RydWN0IGRybV9zY2hlZF9qb2IsIHF1ZXVlX25vZGUpCj4gICAKPiAtc3RhdGlj
IHZvaWQgZHJtX3NjaGVkX3Byb2Nlc3Nfam9iKHN0cnVjdCBkbWFfZmVuY2UgKmYsIHN0cnVjdCBk
bWFfZmVuY2VfY2IgKmNiKTsKPiAtCj4gICAvKioKPiAgICAqIGRybV9zY2hlZF9ycV9pbml0IC0g
aW5pdGlhbGl6ZSBhIGdpdmVuIHJ1biBxdWV1ZSBzdHJ1Y3QKPiAgICAqCj4gQEAgLTE2Miw2ICsx
NjAsNDAgQEAgZHJtX3NjaGVkX3JxX3NlbGVjdF9lbnRpdHkoc3RydWN0IGRybV9zY2hlZF9ycSAq
cnEpCj4gICAJcmV0dXJuIE5VTEw7Cj4gICB9Cj4gICAKPiArLyoqCj4gKyAqIGRybV9zY2hlZF9q
b2JfZG9uZSAtIGNvbXBsZXRlIGEgam9iCj4gKyAqIEBzX2pvYjogcG9pbnRlciB0byB0aGUgam9i
IHdoaWNoIGlzIGRvbmUKPiArICoKPiArICogRmluaXNoIHRoZSBqb2IncyBmZW5jZSBhbmQgd2Fr
ZSB1cCB0aGUgd29ya2VyIHRocmVhZC4KPiArICovCj4gK3N0YXRpYyB2b2lkIGRybV9zY2hlZF9q
b2JfZG9uZShzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2IpCj4gK3sKPiArCXN0cnVjdCBkcm1f
c2NoZWRfZmVuY2UgKnNfZmVuY2UgPSBzX2pvYi0+c19mZW5jZTsKPiArCXN0cnVjdCBkcm1fZ3B1
X3NjaGVkdWxlciAqc2NoZWQgPSBzX2ZlbmNlLT5zY2hlZDsKPiArCj4gKwlhdG9taWNfZGVjKCZz
Y2hlZC0+aHdfcnFfY291bnQpOwo+ICsJYXRvbWljX2RlYygmc2NoZWQtPnNjb3JlKTsKPiArCj4g
Kwl0cmFjZV9kcm1fc2NoZWRfcHJvY2Vzc19qb2Ioc19mZW5jZSk7Cj4gKwo+ICsJZG1hX2ZlbmNl
X2dldCgmc19mZW5jZS0+ZmluaXNoZWQpOwo+ICsJZHJtX3NjaGVkX2ZlbmNlX2ZpbmlzaGVkKHNf
ZmVuY2UpOwo+ICsJZG1hX2ZlbmNlX3B1dCgmc19mZW5jZS0+ZmluaXNoZWQpOwo+ICsJd2FrZV91
cF9pbnRlcnJ1cHRpYmxlKCZzY2hlZC0+d2FrZV91cF93b3JrZXIpOwo+ICt9Cj4gKwo+ICsvKioK
PiArICogZHJtX3NjaGVkX2pvYl9kb25lX2NiIC0gdGhlIGNhbGxiYWNrIGZvciBhIGRvbmUgam9i
Cj4gKyAqIEBmOiBmZW5jZQo+ICsgKiBAY2I6IGZlbmNlIGNhbGxiYWNrcwo+ICsgKi8KPiArc3Rh
dGljIHZvaWQgZHJtX3NjaGVkX2pvYl9kb25lX2NiKHN0cnVjdCBkbWFfZmVuY2UgKmYsIHN0cnVj
dCBkbWFfZmVuY2VfY2IgKmNiKQo+ICt7Cj4gKwlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc19qb2Ig
PSBjb250YWluZXJfb2YoY2IsIHN0cnVjdCBkcm1fc2NoZWRfam9iLCBjYik7Cj4gKwo+ICsJZHJt
X3NjaGVkX2pvYl9kb25lKHNfam9iKTsKPiArfQo+ICsKPiAgIC8qKgo+ICAgICogZHJtX3NjaGVk
X2RlcGVuZGVuY3lfb3B0aW1pemVkCj4gICAgKgo+IEBAIC00NzMsMTQgKzUwNSwxNCBAQCB2b2lk
IGRybV9zY2hlZF9zdGFydChzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkLCBib29sIGZ1
bGxfcmVjb3ZlcnkpCj4gICAKPiAgIAkJaWYgKGZlbmNlKSB7Cj4gICAJCQlyID0gZG1hX2ZlbmNl
X2FkZF9jYWxsYmFjayhmZW5jZSwgJnNfam9iLT5jYiwKPiAtCQkJCQkJICAgZHJtX3NjaGVkX3By
b2Nlc3Nfam9iKTsKPiArCQkJCQkJICAgZHJtX3NjaGVkX2pvYl9kb25lX2NiKTsKPiAgIAkJCWlm
IChyID09IC1FTk9FTlQpCj4gLQkJCQlkcm1fc2NoZWRfcHJvY2Vzc19qb2IoZmVuY2UsICZzX2pv
Yi0+Y2IpOwo+ICsJCQkJZHJtX3NjaGVkX2pvYl9kb25lKHNfam9iKTsKPiAgIAkJCWVsc2UgaWYg
KHIpCj4gICAJCQkJRFJNX0VSUk9SKCJmZW5jZSBhZGQgY2FsbGJhY2sgZmFpbGVkICglZClcbiIs
Cj4gICAJCQkJCSAgcik7Cj4gICAJCX0gZWxzZQo+IC0JCQlkcm1fc2NoZWRfcHJvY2Vzc19qb2Io
TlVMTCwgJnNfam9iLT5jYik7Cj4gKwkJCWRybV9zY2hlZF9qb2JfZG9uZShzX2pvYik7Cj4gICAJ
fQo+ICAgCj4gICAJaWYgKGZ1bGxfcmVjb3ZlcnkpIHsKPiBAQCAtNjM1LDMxICs2NjcsNiBAQCBk
cm1fc2NoZWRfc2VsZWN0X2VudGl0eShzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQo+
ICAgCXJldHVybiBlbnRpdHk7Cj4gICB9Cj4gICAKPiAtLyoqCj4gLSAqIGRybV9zY2hlZF9wcm9j
ZXNzX2pvYiAtIHByb2Nlc3MgYSBqb2IKPiAtICoKPiAtICogQGY6IGZlbmNlCj4gLSAqIEBjYjog
ZmVuY2UgY2FsbGJhY2tzCj4gLSAqCj4gLSAqIENhbGxlZCBhZnRlciBqb2IgaGFzIGZpbmlzaGVk
IGV4ZWN1dGlvbi4KPiAtICovCj4gLXN0YXRpYyB2b2lkIGRybV9zY2hlZF9wcm9jZXNzX2pvYihz
dHJ1Y3QgZG1hX2ZlbmNlICpmLCBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYikKPiAtewo+IC0Jc3Ry
dWN0IGRybV9zY2hlZF9qb2IgKnNfam9iID0gY29udGFpbmVyX29mKGNiLCBzdHJ1Y3QgZHJtX3Nj
aGVkX2pvYiwgY2IpOwo+IC0Jc3RydWN0IGRybV9zY2hlZF9mZW5jZSAqc19mZW5jZSA9IHNfam9i
LT5zX2ZlbmNlOwo+IC0Jc3RydWN0IGRybV9ncHVfc2NoZWR1bGVyICpzY2hlZCA9IHNfZmVuY2Ut
PnNjaGVkOwo+IC0KPiAtCWF0b21pY19kZWMoJnNjaGVkLT5od19ycV9jb3VudCk7Cj4gLQlhdG9t
aWNfZGVjKCZzY2hlZC0+c2NvcmUpOwo+IC0KPiAtCXRyYWNlX2RybV9zY2hlZF9wcm9jZXNzX2pv
YihzX2ZlbmNlKTsKPiAtCj4gLQlkbWFfZmVuY2VfZ2V0KCZzX2ZlbmNlLT5maW5pc2hlZCk7Cj4g
LQlkcm1fc2NoZWRfZmVuY2VfZmluaXNoZWQoc19mZW5jZSk7Cj4gLQlkbWFfZmVuY2VfcHV0KCZz
X2ZlbmNlLT5maW5pc2hlZCk7Cj4gLQl3YWtlX3VwX2ludGVycnVwdGlibGUoJnNjaGVkLT53YWtl
X3VwX3dvcmtlcik7Cj4gLX0KPiAtCj4gICAvKioKPiAgICAqIGRybV9zY2hlZF9nZXRfY2xlYW51
cF9qb2IgLSBmZXRjaCB0aGUgbmV4dCBmaW5pc2hlZCBqb2IgdG8gYmUgZGVzdHJveWVkCj4gICAg
Kgo+IEBAIC04MDksOSArODE2LDkgQEAgc3RhdGljIGludCBkcm1fc2NoZWRfbWFpbih2b2lkICpw
YXJhbSkKPiAgIAkJaWYgKCFJU19FUlJfT1JfTlVMTChmZW5jZSkpIHsKPiAgIAkJCXNfZmVuY2Ut
PnBhcmVudCA9IGRtYV9mZW5jZV9nZXQoZmVuY2UpOwo+ICAgCQkJciA9IGRtYV9mZW5jZV9hZGRf
Y2FsbGJhY2soZmVuY2UsICZzY2hlZF9qb2ItPmNiLAo+IC0JCQkJCQkgICBkcm1fc2NoZWRfcHJv
Y2Vzc19qb2IpOwo+ICsJCQkJCQkgICBkcm1fc2NoZWRfam9iX2RvbmVfY2IpOwo+ICAgCQkJaWYg
KHIgPT0gLUVOT0VOVCkKPiAtCQkJCWRybV9zY2hlZF9wcm9jZXNzX2pvYihmZW5jZSwgJnNjaGVk
X2pvYi0+Y2IpOwo+ICsJCQkJZHJtX3NjaGVkX2pvYl9kb25lKHNjaGVkX2pvYik7Cj4gICAJCQll
bHNlIGlmIChyKQo+ICAgCQkJCURSTV9FUlJPUigiZmVuY2UgYWRkIGNhbGxiYWNrIGZhaWxlZCAo
JWQpXG4iLAo+ICAgCQkJCQkgIHIpOwo+IEBAIC04MjAsNyArODI3LDcgQEAgc3RhdGljIGludCBk
cm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkKPiAgIAkJCWlmIChJU19FUlIoZmVuY2UpKQo+ICAg
CQkJCWRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVkLCBQVFJfRVJSKGZlbmNl
KSk7Cj4gICAKPiAtCQkJZHJtX3NjaGVkX3Byb2Nlc3Nfam9iKE5VTEwsICZzY2hlZF9qb2ItPmNi
KTsKPiArCQkJZHJtX3NjaGVkX2pvYl9kb25lKHNjaGVkX2pvYik7Cj4gICAJCX0KPiAgIAo+ICAg
CQl3YWtlX3VwKCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
