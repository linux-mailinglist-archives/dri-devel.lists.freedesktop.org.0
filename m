Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898FE210B5C
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 14:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950B96E064;
	Wed,  1 Jul 2020 12:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2864C6E064
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 12:56:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqQzBtLEJGdUmXlTagnG4JLM19jnnZ+a5seNnnqTBB+SKtuSTK5btyweiDaWrbnotvjM9F64Hxai9Whyk7N/tbEtccnB/xfSibFR1jWXSCRj75fKkNQkc++L5XvekhviMg2pbjjQDdMd9A8oPoyb9VydptLdl8V9PypD99KVrq0OBTm8AsosdsPJ8YeMIaFjyCm5hv3I25YJ6N8wjqJTqlG/umyFwa9FQm+erF7zDempGDyGdNe7TT63V13+CDSy8quYUcJjt5SAGg7tkrDsLZVyvtQwjhfFYVB1gAO980bki8LH9kv3oc5pK269PMt7X12CcthOPSvJNPuRoZtl1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8qATa1AhLI+m9DjSI+QccLrU3LB68gUYAfiEIF2aKE=;
 b=ml5y3ByUcViB2CJgNOzEfePgja1/Hdqb+mmC73j/kUwIRRsY/x9fuwqJVQkZI9MOtL9GMKtzm87+J1wRJcE1+njeOP5L00dmKp2CtuPealSRY5Up1MPpY2sWcrJ14xQi63pcG8mEd4L3aKqqSj8ufiKvOzHz/pUWF4y5eJ3FLStnA+mKAqnVeHZ0TsNO4MKS3LTEaQZt4yf3zCFOUfyJwt21EwjRt5y8ZZcopA4g3q58GKrQgwMoLZA8KpntegAihFNKiQ5ZXMQsCEeMKK+Z937cqPb5kqDeTxbYiFe0/pluXpPbmCtPul/3FhV9AJtlnVbHSZwcYmJvwC12yREmNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8qATa1AhLI+m9DjSI+QccLrU3LB68gUYAfiEIF2aKE=;
 b=ChXXrqpBedsWZjyB8SOubBG8WCh32KgCBb5UZEPa4QrbeWbCozqSz06OUHTf/aPWRIVzP4Z5qPezwOyqyCZ+rglNPDYx/oTI+wDc7tFlvSVJwOALEz4PrPyWdf0nSgHSKuNqPLFvs2d3l4KpDci+85EI/DWLs6FruxdkqcWUa9A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.24; Wed, 1 Jul
 2020 12:55:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3153.021; Wed, 1 Jul 2020
 12:55:55 +0000
Subject: Re: [RFC PATCH v2 0/3] RDMA: add dma-buf support
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <1593451903-30959-1-git-send-email-jianxin.xiong@intel.com>
 <20200629185152.GD25301@ziepe.ca>
 <MW3PR11MB4555A99038FA0CFC3ED80D3DE56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20200630173435.GK25301@ziepe.ca>
 <MW3PR11MB45553FA6D144BF1053571D98E56F0@MW3PR11MB4555.namprd11.prod.outlook.com>
 <9b4fa0c2-1661-6011-c552-e37b05f35938@amd.com>
 <20200701123904.GM25301@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <34077a9f-7924-fbb3-04d9-cd20243f815c@amd.com>
Date: Wed, 1 Jul 2020 14:55:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200701123904.GM25301@ziepe.ca>
Content-Language: en-US
X-ClientProxiedBy: AM0PR10CA0082.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0082.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.21 via Frontend Transport; Wed, 1 Jul 2020 12:55:54 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 251afa5e-bd1e-473d-8526-08d81dbe17e0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42394842F4A566BEF4BF0327836C0@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 04519BA941
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /q13NElfkwUZ1qQUjw6js4b3uvaj+LeRI5vXrauzq2tBJzW1Dq7wvi3xADkiThNf0kc6COU88P0yglYYrUlIlX87WmziRUn2144e7IIUjKnyRfN9joEtmI3s/O6lJKf2CKo+2kuUcygM3zZ1sAKMqemc9hbPHobA6Wu1Ury95zWwwW0M2AU1gVTIa607ZnjOIRCIRXTpENiJU1L0rDLlkfD0daT8WHCOgtLB1NAlytPqgjYqdP3QlVrKKbASLV6gmG3xOvcAiCc9GVD0iCT4aDNBYG1+y0lH81EjAPKtRfcOIEBD752coWO6Z8bYTZwnRTKREhZD+VDjvp9/2cCBHtfOZjKfQu2fygb4r4n4D2o4OrUcIUZagITi6fPf4BxS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(8676002)(66574015)(4326008)(53546011)(36756003)(6916009)(52116002)(31686004)(2616005)(31696002)(8936002)(186003)(66556008)(16526019)(66476007)(6486002)(86362001)(66946007)(83380400001)(5660300002)(316002)(54906003)(478600001)(6666004)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QC97BGNz/KjHj2FL4BkwkSRZiAoFbt4oHynlgW+0/BxmjSNdjpKJAbl04R1cYhSsGsXwBFgPMzd/M/LcTpfC7/1cixVeTwAiEif3eSjgInHsuNKRklvcFId4VwNl/wXBXYzspicchGM8zJsh8b9hvCUn283FjhF89M7KNQgELIksjR/WoUGqxPndMxI+InfS9FbXowwuscsQEBMN6RdzCqFrh7m1s5/6WIddO1BoswlMf3hemUrYcfveT0uADxgCfkZ9eJ0YSrP3GerqvIcVJt2ZOPcZlidnGDCloYQpzR0gdodUN9Xs7JUeJuYYRY+Z3rMic+YUFwSD6ZJhOf9GvAiA78yZxu+mqQBIhs1sS11/zf7e3t1ykssbS1UKBH6h4nLTPHiIztZbQ4muI4BSgC01F8RIJcAgyOa8gFo4cLuaOBhtpEUgG7N0jgSNeqPDMuWE8p32bHWCdDSZ3Bn1TjmMNU9bvv+UgJOl2fOYGmGbMg7xbWAJDr6m9EibKt0NjugLqFvWo4UDamKjINYGahB3BIIeATEig7ZgZ++T170ZLpYjVX+TQlU0ZkrgyFQB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251afa5e-bd1e-473d-8526-08d81dbe17e0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2020 12:55:55.6935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FUnTIDz5VrbpYDYTweSfl0NLaNQKfkCttmfbwuHgFBAl+tHOdFfOJHE0fYwfAKk4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 "Xiong, Jianxin" <jianxin.xiong@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDEuMDcuMjAgdW0gMTQ6Mzkgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gV2VkLCBK
dWwgMDEsIDIwMjAgYXQgMTE6MDM6MDZBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMzAuMDYuMjAgdW0gMjA6NDYgc2NocmllYiBYaW9uZywgSmlhbnhpbjoKPj4+PiBGcm9t
OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KPj4+PiBTZW50OiBUdWVzZGF5LCBKdW5l
IDMwLCAyMDIwIDEwOjM1IEFNCj4+Pj4gVG86IFhpb25nLCBKaWFueGluIDxqaWFueGluLnhpb25n
QGludGVsLmNvbT4KPj4+PiBDYzogbGludXgtcmRtYUB2Z2VyLmtlcm5lbC5vcmc7IERvdWcgTGVk
Zm9yZCA8ZGxlZGZvcmRAcmVkaGF0LmNvbT47IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxp
bmFyby5vcmc+OyBMZW9uIFJvbWFub3Zza3kKPj4+PiA8bGVvbkBrZXJuZWwub3JnPjsgVmV0dGVy
LCBEYW5pZWwgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPjsgQ2hyaXN0aWFuIEtvZW5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+Pj4+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIHYyIDAv
M10gUkRNQTogYWRkIGRtYS1idWYgc3VwcG9ydAo+Pj4+Cj4+Pj4gT24gVHVlLCBKdW4gMzAsIDIw
MjAgYXQgMDU6MjE6MzNQTSArMDAwMCwgWGlvbmcsIEppYW54aW4gd3JvdGU6Cj4+Pj4+Pj4gSGV0
ZXJvZ2VuZW91cyBNZW1vcnkgTWFuYWdlbWVudCAoSE1NKSB1dGlsaXplcwo+Pj4+Pj4+IG1tdV9p
bnRlcnZhbF9ub3RpZmllciBhbmQgWk9ORV9ERVZJQ0UgdG8gc3VwcG9ydCBzaGFyZWQgdmlydHVh
bAo+Pj4+Pj4+IGFkZHJlc3Mgc3BhY2UgYW5kIHBhZ2UgbWlncmF0aW9uIGJldHdlZW4gc3lzdGVt
IG1lbW9yeSBhbmQgZGV2aWNlCj4+Pj4+Pj4gbWVtb3J5LiBITU0gZG9lc24ndCBzdXBwb3J0IHBp
bm5pbmcgZGV2aWNlIG1lbW9yeSBiZWNhdXNlIHBhZ2VzCj4+Pj4+Pj4gbG9jYXRlZCBvbiBkZXZp
Y2UgbXVzdCBiZSBhYmxlIHRvIG1pZ3JhdGUgdG8gc3lzdGVtIG1lbW9yeSB3aGVuCj4+Pj4+Pj4g
YWNjZXNzZWQgYnkgQ1BVLiBQZWVyLXRvLXBlZXIgYWNjZXNzIGlzIHBvc3NpYmxlIGlmIHRoZSBw
ZWVyIGNhbgo+Pj4+Pj4+IGhhbmRsZSBwYWdlIGZhdWx0LiBGb3IgUkRNQSwgdGhhdCBtZWFucyB0
aGUgTklDIG11c3Qgc3VwcG9ydCBvbi1kZW1hbmQgcGFnaW5nLgo+Pj4+Pj4gcGVlci1wZWVyIGFj
Y2VzcyBpcyBjdXJyZW50bHkgbm90IHBvc3NpYmxlIHdpdGggaG1tX3JhbmdlX2ZhdWx0KCkuCj4+
Pj4+IEN1cnJlbnRseSBobW1fcmFuZ2VfZmF1bHQoKSBhbHdheXMgc2V0cyB0aGUgY3B1IGFjY2Vz
cyBmbGFnIGFuZCBkZXZpY2UKPj4+Pj4gcHJpdmF0ZSBwYWdlcyBhcmUgbWlncmF0ZWQgdG8gdGhl
IHN5c3RlbSBSQU0gaW4gdGhlIGZhdWx0IGhhbmRsZXIuCj4+Pj4+IEhvd2V2ZXIsIGl0J3MgcG9z
c2libGUgdG8gaGF2ZSBhIG1vZGlmaWVkIGNvZGUgZmxvdyB0byBrZWVwIHRoZSBkZXZpY2UKPj4+
Pj4gcHJpdmF0ZSBwYWdlIGluZm8gZm9yIHVzZSB3aXRoIHBlZXIgdG8gcGVlciBhY2Nlc3MuCj4+
Pj4gU29ydCBvZiwgYnV0IG9ubHkgd2l0aGluIHRoZSBzYW1lIGRldmljZSwgUkRNQSBvciBhbnl0
aGluZyBlbHNlIGdlbmVyaWMgY2FuJ3QgcmVhY2ggaW5zaWRlIGEgREVWSUNFX1BSSVZBVEUgYW5k
IGV4dHJhY3QgYW55dGhpbmcgdXNlZnVsLgo+Pj4gQnV0IHBmbiBpcyBzdXBwb3NlZCB0byBiZSBh
bGwgdGhhdCBpcyBuZWVkZWQuCj4+Pgo+Pj4+Pj4gU28uLiB0aGlzIHBhdGNoIGRvZXNuJ3QgcmVh
bGx5IGRvIGFueXRoaW5nIG5ldz8gV2UgY291bGQganVzdCBtYWtlIGEgTVIgYWdhaW5zdCB0aGUg
RE1BIGJ1ZiBtbWFwIGFuZCBnZXQgdG8gdGhlIHNhbWUgcGxhY2U/Cj4+Pj4+IFRoYXQncyByaWdo
dCwgdGhlIHBhdGNoIGFsb25lIGlzIGp1c3QgaGFsZiBvZiB0aGUgc3RvcnkuIFRoZQo+Pj4+PiBm
dW5jdGlvbmFsaXR5IGRlcGVuZHMgb24gYXZhaWxhYmlsaXR5IG9mIGRtYS1idWYgZXhwb3J0ZXIg
dGhhdCBjYW4gcGluCj4+Pj4+IHRoZSBkZXZpY2UgbWVtb3J5Lgo+Pj4+IFdlbGwsIHdoYXQgZG8g
eW91IHdhbnQgdG8gaGFwcGVuIGhlcmU/IFRoZSBSRE1BIHBhcnRzIGFyZSByZWFzb25hYmxlLCBi
dXQgSSBkb24ndCB3YW50IHRvIGFkZCBuZXcgZnVuY3Rpb25hbGl0eSB3aXRob3V0IGEgcHVycG9z
ZSAtIHRoZQo+Pj4+IG90aGVyIHBhcnRzIG5lZWQgdG8gYmUgc2V0dGxlZCBvdXQgZmlyc3QuCj4+
PiBBdCB0aGUgUkRNQSBzaWRlLCB3ZSBtYWlubHkgd2FudCB0byBjaGVjayBpZiB0aGUgY2hhbmdl
cyBhcmUgYWNjZXB0YWJsZS4gRm9yIGV4YW1wbGUsCj4+PiB0aGUgcGFydCBhYm91dCBhZGRpbmcg
J2ZkJyB0byB0aGUgZGV2aWNlIG9wcyBhbmQgdGhlIGlvY3RsIGludGVyZmFjZS4gQWxsIHRoZSBw
cmV2aW91cwo+Pj4gY29tbWVudHMgYXJlIHZlcnkgaGVscGZ1bCBmb3IgdXMgdG8gcmVmaW5lIHRo
ZSBwYXRjaCBzbyB0aGF0IHdlIGNhbiBiZSByZWFkeSB3aGVuCj4+PiBHUFUgc2lkZSBzdXBwb3J0
IGJlY29tZXMgYXZhaWxhYmxlLgo+Pj4KPj4+PiBUaGUgbmVlZCBmb3IgdGhlIGR5bmFtaWMgbWFw
cGluZyBzdXBwb3J0IGZvciBldmVuIHRoZSBjdXJyZW50IERNQSBCdWYgaGFja3kgUDJQIHVzZXJz
IGlzIHJlYWxseSB0b28gYmFkLiBDYW4geW91IGdldCBhbnkgR1BVIGRyaXZlciB0bwo+Pj4+IHN1
cHBvcnQgbm9uLWR5bmFtaWMgbWFwcGluZz8KPj4+IFdlIGFyZSB3b3JraW5nIG9uIGRpcmVjdCBk
aXJlY3Rpb24uCj4+Pgo+Pj4+Pj4+IG1pZ3JhdGUgdG8gc3lzdGVtIFJBTS4gVGhpcyBpcyBkdWUg
dG8gdGhlIGxhY2sgb2Yga25vd2xlZGdlIGFib3V0Cj4+Pj4+Pj4gd2hldGhlciB0aGUgaW1wb3J0
ZXIgY2FuIHBlcmZvcm0gcGVlci10by1wZWVyIGFjY2VzcyBhbmQgdGhlIGxhY2sKPj4+Pj4+PiBv
ZiByZXNvdXJjZSBsaW1pdCBjb250cm9sIG1lYXN1cmUgZm9yIEdQVS4gRm9yIHRoZSBmaXJzdCBw
YXJ0LCB0aGUKPj4+Pj4+PiBsYXRlc3QgZG1hLWJ1ZiBkcml2ZXIgaGFzIGEgcGVlci10by1wZWVy
IGZsYWcgZm9yIHRoZSBpbXBvcnRlciwKPj4+Pj4+PiBidXQgdGhlIGZsYWcgaXMgY3VycmVudGx5
IHRpZWQgdG8gZHluYW1pYyBtYXBwaW5nIHN1cHBvcnQsIHdoaWNoCj4+Pj4+Pj4gcmVxdWlyZXMg
b24tZGVtYW5kIHBhZ2luZyBzdXBwb3J0IGZyb20gdGhlIE5JQyB0byB3b3JrLgo+Pj4+Pj4gT0RQ
IGZvciBETUEgYnVmPwo+Pj4+PiBSaWdodC4KPj4+PiBIdW0uIFRoaXMgaXMgbm90IGFjdHVhbGx5
IHNvIGhhcmQgdG8gZG8uIFRoZSB3aG9sZSBkbWEgYnVmIHByb3Bvc2FsIHdvdWxkIG1ha2UgYSBs
b3QgbW9yZSBzZW5zZSBpZiB0aGUgJ2RtYSBidWYgTVInIGhhZCB0byBiZSB0aGUKPj4+PiBkeW5h
bWljIGtpbmQgYW5kIHRoZSBkcml2ZXIgaGFkIHRvIHByb3ZpZGUgdGhlIGZhdWx0aW5nLiBJdCB3
b3VsZCBub3QgYmUgc28gaGFyZCB0byBjaGFuZ2UgbWx4NSB0byBiZSBhYmxlIHRvIHdvcmsgbGlr
ZSB0aGlzLCBwZXJoYXBzLiAodGhlCj4+Pj4gbG9ja2luZyBtaWdodCBiZSBhIGJpdCB0cmlja3kg
dGhvdWdoKQo+Pj4gVGhlIG1haW4gaXNzdWUgaXMgdGhhdCBub3QgYWxsIE5JQ3Mgc3VwcG9ydCBP
RFAuCj4+IFlvdSBkb24ndCBuZWVkIG9uLWRlbWFuZCBwYWdpbmcgc3VwcG9ydCBmcm9tIHRoZSBO
SUMgZm9yIGR5bmFtaWMgbWFwcGluZyB0bwo+PiB3b3JrLgo+Pgo+PiBBbGwgeW91IG5lZWQgaXMg
dGhlIGFiaWxpdHkgdG8gc3RvcCB3YWl0IGZvciBvbmdvaW5nIGFjY2Vzc2VzIHRvIGVuZCBhbmQK
Pj4gbWFrZSBzdXJlIHRoYXQgbmV3IG9uZXMgZ3JhYiBhIG5ldyBtYXBwaW5nLgo+IFN3YXAgYW5k
IGZsdXNoIGlzbid0IGEgZ2VuZXJhbCBIVyBhYmlsaXR5IGVpdGhlci4uCj4KPiBJJ20gdW5jbGVh
ciBob3cgdGhpcyBjb3VsZCBiZSB1c2VmdWwsIGl0IGlzIGd1YXJlbnRlZWQgdG8gY29ycnVwdAo+
IGluLXByb2dyZXNzIHdyaXRlcz8KPgo+IERpZCB5b3UgbWVhbiBwYXVzZSwgc3dhcCBhbmQgcmVz
dW1lPyBUaGF0J3MgT0RQLgoKWWVzLCBzb21ldGhpbmcgbGlrZSB0aGlzLiBBbmQgZ29vZCB0byBr
bm93LCBuZXZlciBoZWFyZCBvZiBPRFAuCgoKT24gdGhlIEdQVSBzaWRlIHdlIGNhbiBwaXBlbGlu
ZSB0aGluZ3MsIGUuZy4geW91IGNhbiBwcm9ncmFtIHRoZSAKaGFyZHdhcmUgdGhhdCBwYWdlIHRh
YmxlcyBhcmUgY2hhbmdlZCBhdCBhIGNlcnRhaW4gcG9pbnQgaW4gdGltZS4KClNvIHdoYXQgd2Ug
ZG8gaXMgd2hlbiB3ZSBnZXQgYSBub3RpZmljYXRpb24gdGhhdCBhIGJ1ZmZlciB3aWxsIG1vdmUg
CmFyb3VuZCBpcyB0byBtYXJrIHRoaXMgYnVmZmVyIGluIG91ciBzdHJ1Y3R1cmVzIGFzIGludmFs
aWQgYW5kIHJldHVybiBhIApmZW5jZSB0byBzbyB0aGF0IHRoZSBleHBvcnRlciBpcyBhYmxlIHRv
IHdhaXQgZm9yIG9uZ29pbmcgc3R1ZmYgdG8gZmluaXNoLgoKVGhlIGFjdHVhbCBtb3ZlIHRoZW4g
aGFwcGVucyBvbmx5IGFmdGVyIHRoZSBvbmdvaW5nIG9wZXJhdGlvbnMgb24gdGhlIApHUFUgYXJl
IGZpbmlzaGVkIGFuZCBvbiB0aGUgbmV4dCBvcGVyYXRpb24gd2UgZ3JhYiB0aGUgbmV3IGxvY2F0
aW9uIG9mIAp0aGUgYnVmZmVyIGFuZCByZS1wcm9ncmFtIHRoZSBwYWdlIHRhYmxlcyB0byBpdC4K
ClRoaXMgd2F5IGFsbCB0aGUgQ1BVIGRvZXMgaXMgcmVhbGx5IGp1c3QgcGxhbm5pbmcgYXN5bmNo
cm9ub3VzIHBhZ2UgCnRhYmxlIGNoYW5nZXMgd2hpY2ggYXJlIGV4ZWN1dGVkIG9uIHRoZSBHUFUg
bGF0ZXIgb24uCgpZb3UgY2FuIG9mIGNvdXJzZSBkbyBpdCBzeW5jaHJvbml6ZWQgYXMgd2VsbCwg
YnV0IHRoaXMgd291bGQgaHVydCBvdXIgCnBlcmZvcm1hbmNlIHByZXR0eSBiYWRseS4KClJlZ2Fy
ZHMsCkNocmlzdGlhbi4KCj4KPiBKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
