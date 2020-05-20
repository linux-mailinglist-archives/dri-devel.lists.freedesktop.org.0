Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F371DAC71
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97C189A72;
	Wed, 20 May 2020 07:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CDC898C2;
 Wed, 20 May 2020 07:42:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/3u6wHgdm2hOt+vSVwrqY9bQrEXebl4It3YjtUShx5GNlKdbKJ1kWfuNzLgF/4PyA2/0bRJ3rpz2dJ1FYTyqvOD4NPQ1SDIXC4HJW6K0pUp0sv5rCT+9yuhWMo3ls9Hl6m2wZOo257D6fgiqXq0oU6hJvxTUUzmukiiw098uW+zpuPaVsr9P7CowrIDjDwyLeV36c4/eGcMpHVVXeK4JC53UKrPb6netbZNaY9Z+EuPs/H37zH/FQ38Nj+vSWPBWOXnPOE4lae8qpMlE1C2ZRHmoClf2BSfbU4EXGM1N4Y9yC7UbGLR/2FK09lA0N72vBpwV3FHWt2ZVkNkJXpa5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mlldXVpPvTEDJONXWZlvW6XXpbo3a3syELHWf8Y6vk=;
 b=helLhXwDXSAjCw+C/YyIj8uh6ayIa2Yvgs9s9bRodWjFckxW5/aNQaThL3IR1m0jdKAod8QV4uDw/oEXXJk698Q8s26HnyOBpvNxPpoqcWwfvt/fyaM5Hcl2eClkawmqBEaiTctA9a6GTwyuwBzGElA/3DD8tRpzkbZhMTy1LrM8ACCndHhqsLVMDOPGh1E6B+27tf2/vZPqFdm+JiP1jMiwmmS4VK501uA/RzAjG7oR3sXdJW5pxaXOADDS3o3Oop4EcsOWl4meQvzQB7/z1ojfd1Mc96sCIAlGlmzrzBDuUFFHhybrjoH8km3AxNKj8yCQYJPr4xoWfyUDnWY3Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mlldXVpPvTEDJONXWZlvW6XXpbo3a3syELHWf8Y6vk=;
 b=SkcrK5jSOsG1PgSnTqfISSFFzLDwVfe8aPT3jZ/Om2YQvZ4NtmizzYohRtOQdo83FeNKcepb7CUi5zMr6P6reYYAYOwEjHuUJWrjHxkjbUtKMV3+cwhqUNRBLzUfapK92Z/A3J/wxM/s8k2KjG0NZgnreJ4iKYlipw3zoGT5l1w=
Authentication-Results: embeddedor.com; dkim=none (message not signed)
 header.d=none;embeddedor.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4468.namprd12.prod.outlook.com (2603:10b6:5:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 07:42:36 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3021.020; Wed, 20 May 2020
 07:42:36 +0000
Subject: Re: [PATCH] drm/amdgpu/smu10: Replace one-element array and use
 struct_size() helper
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20200519225545.GA2066@embeddedor>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <1065d63e-7959-e4b4-af4e-70607ba92296@amd.com>
Date: Wed, 20 May 2020 09:42:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200519225545.GA2066@embeddedor>
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::17) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.25 via Frontend Transport; Wed, 20 May 2020 07:42:34 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5a229a49-9264-44a6-bf49-08d7fc915d0e
X-MS-TrafficTypeDiagnostic: DM6PR12MB4468:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB44683637F7E6F9BB923E117483B60@DM6PR12MB4468.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2fOwndbdznGsA0HdcWuFiFzp2eL0xRUcR4XGZHk68y8/ibVkfWp8WQ1+SFywM1MhTxxlWg75IBn/M5ahnduy/VL6K43iWysbaY97ZNPqW3o8NBb8i/p7Bv+2EAUVXbZg+y9A6jcqx8DvrWDdiejj4fanal0RkI1nnAQeCMtQFBN+WVFRy6P1ZIdj7ObRrrv3q8fdqXBq6J9o9MHtlI34uUxGvwScuH6TYAwpkvw9yEkGd1kU6jsa54Sx6UHAlFSLxW+EGweeMO4zLs3QItrFF5dciiuYT9K4UWdrgEAniH0oWjIngIpRAitG2IDeFfrpSkkDKRVaiuwQ7zt3ejmm2VwkmCKeKeSE10JrMetjcHRzWzteys6+3iGIORZI+y8MZ5Cx3UrHTDqcIEJmLKo1bUVTjrG6rBQ/KRaKO5sWpkVZu1YGPFR/NYmtiJtxOCUfs8c3c2PaPO8g99mmJNNWrA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(376002)(396003)(45080400002)(66574014)(31696002)(5660300002)(966005)(6666004)(86362001)(52116002)(2616005)(16526019)(4326008)(478600001)(186003)(316002)(6486002)(110136005)(8936002)(36756003)(31686004)(66556008)(66946007)(66476007)(2906002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: m0+nkuzLpWnl+LzfovZ6tDpTX2EALH9JviZAS8TzrO7eUNeGoG18cO1xuGr9NVoCs/IEGdNau0PPX+huryinspoLL5C2Ptmeo73hM02BYU3zFq6sJd01pPsLCcBuDaHArOToJsNnNSbb5enGF+z1IzuK9+KAabkmkdsLL93lenB016voNgoB6o/tjkQV7Ae6/BdnV5xm6LfaVjIBeWu5RcEOCAbnPO4IQM5l0lshjrbasUBl6eDBwZ+c/IfSu1q53dS4I1u0izKFFi1rMz+7CYRQhJ/JRTmPwub/XcoigTLm9MDqhGoUtOzxUTe10587qLJ89O279+QjtLcUzuPD1lEi5hHLlvhCTGJjXYjL2O/tQUFjjdUT/FnqS1pkJ8dbELjRKSwkWCh9w/WKh1hbhKCa3vkLfUqZPQG/fl7HoMI5gI1sh+31YzsgvyB7eYuDInh9jTcoVpZZbPcHaa8X5VQobDX+hHlhm5uuEYQbBbVY5muvr+/uwvmz0rx7IlziiEpqs7rNVPrcJbDcy6rlPIuEaKxnYyV6YOuPCnOvFdjGAqCVYT+rOAVWHGBJfq6F
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a229a49-9264-44a6-bf49-08d7fc915d0e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 07:42:35.8964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zDK610TnFFTu7NSNqzpIWsxRameozes6TxDZD02bwt5mvEySj7UBsWiGQT1KT62
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4468
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDUuMjAgdW0gMDA6NTUgc2NocmllYiBHdXN0YXZvIEEuIFIuIFNpbHZhOgo+IFRoZSBj
dXJyZW50IGNvZGViYXNlIG1ha2VzIHVzZSBvZiBvbmUtZWxlbWVudCBhcnJheXMgaW4gdGhlIGZv
bGxvd2luZwo+IGZvcm06Cj4KPiBzdHJ1Y3Qgc29tZXRoaW5nIHsKPiAgICAgIGludCBsZW5ndGg7
Cj4gICAgICB1OCBkYXRhWzFdOwo+IH07Cj4KPiBzdHJ1Y3Qgc29tZXRoaW5nICppbnN0YW5jZTsK
Pgo+IGluc3RhbmNlID0ga21hbGxvYyhzaXplb2YoKmluc3RhbmNlKSArIHNpemUsIEdGUF9LRVJO
RUwpOwo+IGluc3RhbmNlLT5sZW5ndGggPSBzaXplOwo+IG1lbWNweShpbnN0YW5jZS0+ZGF0YSwg
c291cmNlLCBzaXplKTsKPgo+IGJ1dCB0aGUgcHJlZmVycmVkIG1lY2hhbmlzbSB0byBkZWNsYXJl
IHZhcmlhYmxlLWxlbmd0aCB0eXBlcyBzdWNoIGFzCj4gdGhlc2Ugb25lcyBpcyBhIGZsZXhpYmxl
IGFycmF5IG1lbWJlclsxXVsyXSwgaW50cm9kdWNlZCBpbiBDOTk6Cj4KPiBzdHJ1Y3QgZm9vIHsK
PiAgICAgICAgICBpbnQgc3R1ZmY7Cj4gICAgICAgICAgc3RydWN0IGJvbyBhcnJheVtdOwo+IH07
Cj4KPiBCeSBtYWtpbmcgdXNlIG9mIHRoZSBtZWNoYW5pc20gYWJvdmUsIHdlIHdpbGwgZ2V0IGEg
Y29tcGlsZXIgd2FybmluZwo+IGluIGNhc2UgdGhlIGZsZXhpYmxlIGFycmF5IGRvZXMgbm90IG9j
Y3VyIGxhc3QgaW4gdGhlIHN0cnVjdHVyZSwgd2hpY2gKPiB3aWxsIGhlbHAgdXMgcHJldmVudCBz
b21lIGtpbmQgb2YgdW5kZWZpbmVkIGJlaGF2aW9yIGJ1Z3MgZnJvbSBiZWluZwo+IGluYWR2ZXJ0
ZW50bHkgaW50cm9kdWNlZFszXSB0byB0aGUgY29kZWJhc2UgZnJvbSBub3cgb24uIFNvLCByZXBs
YWNlCj4gdGhlIG9uZS1lbGVtZW50IGFycmF5IHdpdGggYSBmbGV4aWJsZS1hcnJheSBtZW1iZXIu
Cj4KPiBBbHNvLCBtYWtlIHVzZSBvZiB0aGUgbmV3IHN0cnVjdF9zaXplKCkgaGVscGVyIHRvIHBy
b3Blcmx5IGNhbGN1bGF0ZSB0aGUKPiBzaXplIG9mIHN0cnVjdCBzbXUxMF92b2x0YWdlX2RlcGVu
ZGVuY3lfdGFibGUuCj4KPiBUaGlzIGlzc3VlIHdhcyBmb3VuZCB3aXRoIHRoZSBoZWxwIG9mIENv
Y2NpbmVsbGUgYW5kLCBhdWRpdGVkIGFuZCBmaXhlZAo+IF9tYW51YWxseV8uCj4KPiBbMV0gaHR0
cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNB
JTJGJTJGZ2NjLmdudS5vcmclMkZvbmxpbmVkb2NzJTJGZ2NjJTJGWmVyby1MZW5ndGguaHRtbCZh
bXA7ZGF0YT0wMiU3QzAxJTdDY2hyaXN0aWFuLmtvZW5pZyU0MGFtZC5jb20lN0M4YTQwMGJkYjg4
OTI0YTFkOTUxNTA4ZDdmYzQ3MTk2NiU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNk
JTdDMCU3QzAlN0M2MzcyNTUyNTQ2MjIwMzkyNjgmYW1wO3NkYXRhPUlMT1BQbjE3YyUyQjNveUxM
ZGglMkJnSDJiJTJCOFJkaFd1VEZHeHJ1UkQ3R1VIT28lM0QmYW1wO3Jlc2VydmVkPTAKPiBbMl0g
aHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGZ2l0aHViLmNvbSUyRktTUFAlMkZsaW51eCUyRmlzc3VlcyUyRjIxJmFtcDtkYXRh
PTAyJTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzhhNDAwYmRiODg5MjRhMWQ5
NTE1MDhkN2ZjNDcxOTY2JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdD
MCU3QzYzNzI1NTI1NDYyMjAzOTI2OCZhbXA7c2RhdGE9bENyNU90aWo1NVNucTI3QkRwNFJtdFc0
aE5oT1MlMkJtNHZTVU9PQXowN1hBJTNEJmFtcDtyZXNlcnZlZD0wCj4gWzNdIGNvbW1pdCA3NjQ5
NzczMjkzMmYgKCJjeGdiMy9sMnQ6IEZpeCB1bmRlZmluZWQgYmVoYXZpb3VyIikKPgo+IFNpZ25l
ZC1vZmYtYnk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KCkFj
a2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpNYXkg
SSBzdWdnZXN0IHRoYXQgd2UgYWRkIGEgc2VjdGlvbiBob3cgdG8gY29ycmVjdGx5IGRvIHRoaXMg
dG8gCkRvY3VtZW50YXRpb24vcHJvY2Vzcy9jb2Rpbmctc3R5bGUucnN0IG9yIHNpbWlsYXIgZG9j
dW1lbnQ/CgpJJ3ZlIHNlZW4gYSBidW5jaCBvZiBkaWZmZXJlbnQgYXBwcm9hY2hlcyBhbmQgc29t
ZSBldmVuIGRvZXNuJ3Qgd29yayAKd2l0aCBzb21lIGdjYyB2ZXJzaW9ucyBhbmQgcmVzdWx0IGlu
IGEgYnJva2VuIGJpbmFyeS4KClRoYW5rcywKQ2hyaXN0aWFuLgoKPiAtLS0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3bWdyLmMgfCA2ICsrLS0tLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3IuaCB8IDIgKy0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTEwX2h3
bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5j
Cj4gaW5kZXggMjQ2YmI5YWM1NTdkOC4uYzljZmU5MGEyOTQ3MSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3IuYwo+IEBAIC00MTAs
MTIgKzQxMCwxMCBAQCBzdGF0aWMgaW50IHNtdTEwX2dldF9jbG9ja192b2x0YWdlX2RlcGVuZGVu
Y3lfdGFibGUoc3RydWN0IHBwX2h3bWdyICpod21nciwKPiAgIAkJCXN0cnVjdCBzbXUxMF92b2x0
YWdlX2RlcGVuZGVuY3lfdGFibGUgKipwcHRhYmxlLAo+ICAgCQkJdWludDMyX3QgbnVtX2VudHJ5
LCBjb25zdCBEcG1DbG9ja190ICpwY2xrX2RlcGVuZGVuY3lfdGFibGUpCj4gICB7Cj4gLQl1aW50
MzJfdCB0YWJsZV9zaXplLCBpOwo+ICsJdWludDMyX3QgaTsKPiAgIAlzdHJ1Y3Qgc211MTBfdm9s
dGFnZV9kZXBlbmRlbmN5X3RhYmxlICpwdGFibGU7Cj4gICAKPiAtCXRhYmxlX3NpemUgPSBzaXpl
b2YodWludDMyX3QpICsgc2l6ZW9mKHN0cnVjdCBzbXUxMF92b2x0YWdlX2RlcGVuZGVuY3lfdGFi
bGUpICogbnVtX2VudHJ5Owo+IC0JcHRhYmxlID0ga3phbGxvYyh0YWJsZV9zaXplLCBHRlBfS0VS
TkVMKTsKPiAtCj4gKwlwdGFibGUgPSBremFsbG9jKHN0cnVjdF9zaXplKHB0YWJsZSwgZW50cmll
cywgbnVtX2VudHJ5KSwgR0ZQX0tFUk5FTCk7Cj4gICAJaWYgKE5VTEwgPT0gcHRhYmxlKQo+ICAg
CQlyZXR1cm4gLUVOT01FTTsKPiAgIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9od21nci9zbXUxMF9od21nci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dl
cnBsYXkvaHdtZ3Ivc211MTBfaHdtZ3IuaAo+IGluZGV4IDFmYjI5NmE5OTZmM2EuLjBmOTY5ZGUx
MGZhYmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
c211MTBfaHdtZ3IuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdy
L3NtdTEwX2h3bWdyLmgKPiBAQCAtMTkyLDcgKzE5Miw3IEBAIHN0cnVjdCBzbXUxMF9jbG9ja192
b2x0YWdlX2RlcGVuZGVuY3lfcmVjb3JkIHsKPiAgIAo+ICAgc3RydWN0IHNtdTEwX3ZvbHRhZ2Vf
ZGVwZW5kZW5jeV90YWJsZSB7Cj4gICAJdWludDMyX3QgY291bnQ7Cj4gLQlzdHJ1Y3Qgc211MTBf
Y2xvY2tfdm9sdGFnZV9kZXBlbmRlbmN5X3JlY29yZCBlbnRyaWVzWzFdOwo+ICsJc3RydWN0IHNt
dTEwX2Nsb2NrX3ZvbHRhZ2VfZGVwZW5kZW5jeV9yZWNvcmQgZW50cmllc1tdOwo+ICAgfTsKPiAg
IAo+ICAgc3RydWN0IHNtdTEwX2Nsb2NrX3ZvbHRhZ2VfaW5mb3JtYXRpb24gewoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
