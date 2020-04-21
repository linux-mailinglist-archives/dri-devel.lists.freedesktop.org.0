Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F161B1D50
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 06:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBF56E873;
	Tue, 21 Apr 2020 04:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 970246E293;
 Tue, 21 Apr 2020 04:20:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UM2yvHfRyVPDbmulYww1T+WwG+xvyybRuryhE9Oh05jfGv2lY5bM55ByUqSscCwTJtvah34XszOW+sN6mAyE3+apZ/5CZVHSKoxTLg/kaHb+QK81gfNhJq1pcPsDm76i+y7jo7X7sNscO/pSec80COCFBuHmnH3lwIhjCOZpc0eoiuC1tkmOckmqPgDGrtUOkhPRyur3hbgSzPGKgC75oeRYQVJqneFyxCr8SN/1/wYkjYG696hrkoa1TUysHRA9MvqSedfGGhyQukXeQV39th1wHL3IOR6Yeue2LhtVoQbLay7KOb+Tf/LEzqeEPdsP3paWNfBlzJErNTAfuOTv8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtQt/OnHibnVXo60N7SHI8zhmoFaGicObq36jZ4RgDQ=;
 b=Zi3wLN82CF6r7ligWEoYIUSoaEkj9FEi+gTxhP84XQ8G/nQJVDtk0eX08gW2rRpCF48S/o4vhBZLoWrFCJa9f6kCA1dRMQ+xBRYNL8IEMQa3Ni7Y68sUlX0QUbYLgvKCeCZEokOD9ExczBJsnGDS/yqzZUDFN/kyiDI8xoKR2HTRbSPnKdzysafzh+wef8jlUMMdVGdjnTfkeVKoqQf3SKBW4cDCrnHOu2w5br3sTr691YaTssl42JurLHw4Wlpnni6ufUMj1JaJ19aa95tU+5ARGPR8I7bpWGe7TjnVk56DdZR9l/YnRM1uRSWDkE4W1/AWcIM3xpB94Deg3j77+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtQt/OnHibnVXo60N7SHI8zhmoFaGicObq36jZ4RgDQ=;
 b=Z22L8kU9QLb9kyglBig0GHvmHZ1n2EaNz7OgGPr6CGOWgZx4Bvypw7PGPuInYS0ql/yylfmleWFF9AubQ0blrrCqaW1PKP2PlwupM4+HFNNYw12zuD1mO1bRO5xFpWZPskLZkMUXqAMG0cdxSLHPOF9zQXp+i4IKSafRjWc3vo0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
Received: from DM5PR12MB2407.namprd12.prod.outlook.com (2603:10b6:4:b4::24) by
 DM5PR12MB1882.namprd12.prod.outlook.com (2603:10b6:3:112::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.29; Tue, 21 Apr 2020 04:20:31 +0000
Received: from DM5PR12MB2407.namprd12.prod.outlook.com
 ([fe80::7d36:4eac:2088:637f]) by DM5PR12MB2407.namprd12.prod.outlook.com
 ([fe80::7d36:4eac:2088:637f%3]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 04:20:31 +0000
Subject: Re: [PATCH V2] amdgpu: optimization-- reduce noneed mutex_lock area
To: 1587181464-114215-1-git-send-email-bernard@vivo.com,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200421022528.126437-1-bernard@vivo.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <16175fa0-4d9b-2de8-e708-22b373a6f7a4@amd.com>
Date: Tue, 21 Apr 2020 00:20:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200421022528.126437-1-bernard@vivo.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To DM5PR12MB2407.namprd12.prod.outlook.com
 (2603:10b6:4:b4::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.63.128) by
 YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Tue, 21 Apr 2020 04:20:30 +0000
X-Originating-IP: [142.116.63.128]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e26bbd3d-5747-42af-e9b9-08d7e5ab540c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1882:|DM5PR12MB1882:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1882FFE8CCF6B4BB85518AFA92D50@DM5PR12MB1882.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2407.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(110136005)(86362001)(26005)(31696002)(4326008)(8676002)(36756003)(81156014)(8936002)(66946007)(2906002)(16526019)(186003)(16576012)(956004)(5660300002)(478600001)(44832011)(2616005)(31686004)(52116002)(6486002)(316002)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1R6NTpLPxKqwZeDtBAirtAuTJ1/hsV5IEX2ENiD7aG9SicleGyClcdzBMs2iIJaKIZHuq70jxfm77/k3mAlsMf6bVazp4OfCdQ2yL8IiO/4rOpT6yYsk2yioziopF4boEQROrsM0U1DNt0PfUocU2mFwlfsBW8TkmhzQBO0w9dTg9WPRuKXxAqjsd6jKTjDCNIMYuYY7Z1qufrBZkqDUJgcrGudT269Gp0EhoD3XsBBURAbGGIRKh5n0wWzqytIjhLmlrYeCevOcs+Z7Qd46wIjQ/4cljZHamW658Wp+fChtuK4iQq2iHYnMpRaJ1ekW97Y537YKfR9uGb1NVC6uG1/XO7EWBSB4pOkjCCO+n+tHEVRBNVi1GzT62hgJcqZySpNA0CnR8lqbdVTaRLz/jtyxZ9vHvlnDRWFYiJb1iPiPTXk+FvlRhWWUhncC/Wk3VLT57i9Wd1+UQvlSDMd1wRNHDmYLRPrQBpKMQmX4tMTiTc0oV5urADtd5HJ0Vy3W90nbbIUK+HdpAzSX2AzqBA==
X-MS-Exchange-AntiSpam-MessageData: /V86TuOj5LgXhP6XsnSsmxthsT3qsLt70gz0CV5TW7FMOslqIzphB35XdBDmQP2yXbrYxnl5VS/86SKOrzGliR3v4v/zf0a3Zl0L9pug5WWWffCBbNBedT53d7djK7IGYxRreUsCRWbOHANWBbMYHw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e26bbd3d-5747-42af-e9b9-08d7e5ab540c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 04:20:31.0684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsKFkbjvLl2wJ6a07aOYbqusT2eJ20DJ4BRbMOGgl+6l8Z8n++OhmIJDQ2c8EW49GCStx27GRSTS0Q9yUpBTsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1882
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
Cc: opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQmVybmFyZCwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLiBQbGVhc2Ugc2VlIHNvbWUgY29t
bWVudHMgaW5saW5lLgoKQW0gMjAyMC0wNC0yMCB1bSAxMDoyNSBwLm0uIHNjaHJpZWIgQmVybmFy
ZCBaaGFvOgo+IE1heWJlIHdlIGNvdWxkIHJlZHVjZSB0aGUgbXV0ZXhfbG9jaygmbWVtLT5sb2Nr
KWBzIHByb3RlY3RlZCBjb2RlIGFyZWEsCj4gYW5kIG5vbmVlZCB0byBwcm90ZWN0IHByX2RlYnVn
LgoKVHlwbzogbm9uZWVkIC0+IG5vIG5lZWQKCgo+Cj4gU2lnbmVkLW9mZi1ieTogQmVybmFyZCBa
aGFvIDxiZXJuYXJkQHZpdm8uY29tPgo+Cj4gQ2hhbmdlcyBzaW5jZSBWMToKPiAqY29tbWl0IG1l
c3NhZ2UgaW1wcm92ZQo+Cj4gTGluayBmb3IgVjE6Cj4gKmh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3BhdGNod29yay9wYXRjaC8xMjI2NTg4Lwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgfCA3ICsrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPiBpbmRleCAzMjczMTdjNTRmN2Mu
LjNjMzc2OWU1NzE3NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2dwdXZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2dwdXZtLmMKPiBAQCAtMTI4NSwxNyArMTI4NSwxOCBAQCBpbnQgYW1kZ3B1
X2FtZGtmZF9ncHV2bV9mcmVlX21lbW9yeV9vZl9ncHUoCj4gIAlzdHJ1Y3QgYm9fdm1fcmVzZXJ2
YXRpb25fY29udGV4dCBjdHg7Cj4gIAlzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlciAqYm9fbGlz
dF9lbnRyeTsKPiAgCWludCByZXQ7Cj4gKwl1bnNpZ25lZCBpbnQgbWFwcGVkX3RvX2dwdV9tZW1v
cnk7Cj4gIAo+ICAJbXV0ZXhfbG9jaygmbWVtLT5sb2NrKTsKPiArCW1hcHBlZF90b19ncHVfbWVt
b3J5ID0gbWVtLT5tYXBwZWRfdG9fZ3B1X21lbW9yeTsKPiArCW11dGV4X3VubG9jaygmbWVtLT5s
b2NrKTsKPiAgCj4gLQlpZiAobWVtLT5tYXBwZWRfdG9fZ3B1X21lbW9yeSA+IDApIHsKPiArCWlm
IChtYXBwZWRfdG9fZ3B1X21lbW9yeSA+IDApIHsKPiAgCQlwcl9kZWJ1ZygiQk8gVkEgMHglbGx4
IHNpemUgMHglbHggaXMgc3RpbGwgbWFwcGVkLlxuIiwKPiAgCQkJCW1lbS0+dmEsIGJvX3NpemUp
Owo+IC0JCW11dGV4X3VubG9jaygmbWVtLT5sb2NrKTsKPiAgCQlyZXR1cm4gLUVCVVNZOwo+ICAJ
fQo+ICAKPiAtCW11dGV4X3VubG9jaygmbWVtLT5sb2NrKTsKPiAgCS8qIGxvY2sgaXMgbm90IG5l
ZWRlZCBhZnRlciB0aGlzLCBzaW5jZSBtZW0gaXMgdW51c2VkIGFuZCB3aWxsCj4gIAkgKiBiZSBm
cmVlZCBhbnl3YXkKPiAgCSAqLwoKUGxlYXNlIG1vdmUgdGhpcyBjb21tZW50IGFsb25nIHdpdGgg
dGhlIG11dGV4X3VubG9jay4KClJlZ2FyZHMsCsKgIEZlbGl4CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
