Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4256330228B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 08:47:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7816189CF4;
	Mon, 25 Jan 2021 07:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE81989805;
 Mon, 25 Jan 2021 07:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXzBxlC3DfNAgIx2xb5/AZbTehsrS9SW6Z9yRTEGrmPmA98YNxbiFzq26t38y4Z20C+sCOW5d/nPA+1KGsLh4OxuYrb6bs9jn2pFs7kVAiaIdTCQxHQZbWXKDsM26FWgYT0Cp1THhVgIgW12Cf/JukoAcT/KfpGGKgpPkT9Bu157x43B+juAyTayf0HvgHcHJemRz508vp4vIF94auLPECQeAzZQgwsAwAQvuR+qnkvA4LhKdRr4FiosP33rfoATEbVTEIdfDeMe5gmRcZ5bLFKAyqKslr3CSnre/jmO2fWbi5Abip0RU9SlNw1XNOTvsuF85xsDyA0qXyWThK+pRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9XMvy9XygWbyD7+FwB8yWyg+SfSO7WUHmoOf9sdD+s=;
 b=Q8WyuPPMy0+4IxewPZiglTUCxNIfBtQ+QMd7tVZ3SeGqRp4TT/wotB9cCYYWV+GjnCknv17wW0PDKyKqPmZEWDTuyedxaMlJCzMdE+2OYARxEYWcy3adGptQxzjsgRVuMpjX+WVB+AWIq0B74Gf7TB82kAy7jdh8UQ3YFPExK3RnvI52wF3vKbP29kvFOT9Ewg+P4Gr8RvMHdJxrWoX+vxph3ySLtF80um3GQ1X2WpiFzAGOfYV3v9YtEpoVWjX30gncAZOpwaBQ064SSffCTf3A4oyUL+sobdUbddtXDEqLRAT0A3qRQDiA/u0Inmfxc3uJdmC/G2hhtdqPQbyUnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9XMvy9XygWbyD7+FwB8yWyg+SfSO7WUHmoOf9sdD+s=;
 b=J/n3WLSwIj6mb5xzJqpB8Pe32GtFhjuzNtiee9H1F7/i5c7rZoJQaUS+AwUkHPxf+P86YtbaA3J3sGY9ZApz/zyOXTeqH2kEyXGJ+CPL6e2UkXMI6iDL+ik9DllGQdIb0IGjraMrPfnJtyzauIx156vbceNBx/a9Qcl4iCHDZWc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2385.namprd12.prod.outlook.com (2603:10b6:207:4d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Mon, 25 Jan
 2021 07:47:42 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 07:47:42 +0000
Subject: Re: [PATCH] drm/etnaviv: fix NULL check before some freeing functions
 is not needed
To: Tian Tao <tiantao6@hisilicon.com>, l.stach@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org
References: <1611545247-33487-1-git-send-email-tiantao6@hisilicon.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <155edc4a-5bfb-e47b-2067-7cbc23d1e2e1@amd.com>
Date: Mon, 25 Jan 2021 08:47:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1611545247-33487-1-git-send-email-tiantao6@hisilicon.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Mon, 25 Jan 2021 07:47:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7276c4fa-ecf9-4e37-cc9d-08d8c1057ecb
X-MS-TrafficTypeDiagnostic: BL0PR12MB2385:
X-Microsoft-Antispam-PRVS: <BL0PR12MB23851894BE388CA6613BF1B883BD9@BL0PR12MB2385.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y+cBlkAEZ+9NmuTUE41lCsT2sk28y6ZpfOfXjxRhsKAzs/a1jZA1YBHsSBb3rhV09zkhHvT/pQWWU79ZdDGNV5l8mP6EtwhncdsQVWxNLe0lhyr8hDopIjpiy0wsy7bp+BoNsBUdyoKGgc9RFlG9JbAMrQcj2bKjeNuI9AjzsrA6dys2OJCu1vEhJBk/hFMfQo15z96WTtHE/tcg0/qP2ak9WZmOCX/OyCUsipsS1S5SCFBplvWVy9TwLouBdWpOU11ofXH77TZVPHJStNP7A3Brbz+kqAc2nGbhMML5B/UH1bTlqOad928y9i26kAtcP01O90utko4arG+8JikYm72sG38nc8QTkCWyvlEAYWsnABZtumOK82kndvTpvm8nSDVWAQe1+kFU5L24feGPB1jWZZyIsnyDQX6eceTjgoQc+czvMxCTUG5OZV7R6bQO/Kz37JHJjQa3QHXuinhmS8L7qP1VbEHj01e115Y9pY8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(8676002)(6666004)(52116002)(36756003)(31696002)(4326008)(66556008)(316002)(66946007)(86362001)(5660300002)(66476007)(478600001)(83380400001)(2616005)(16526019)(66574015)(8936002)(6486002)(2906002)(31686004)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R3JxY0ZKZkF1Tml3aVdneU5xSHo4cXE1U28rUi9mejZqNDlZRDhhR0ZpK2tX?=
 =?utf-8?B?VW9sOW85aldUd2hQcy9NMUJtb0szSmlVZHZDQW9IeDRqWWdjQndpNlkwcEZy?=
 =?utf-8?B?aXE5Umgrbmw5bzBMcVdZOGxIWkM3N2R2M3VqL0pjSjRLbEJ0anh5K1JNM2hw?=
 =?utf-8?B?TlBkaFF0WE9MY1UzYi93UUlIYlB4Z2pzcGloQWVHb29FUzN1eUpqR0Z1aUIy?=
 =?utf-8?B?RW1jeGc2emw2cERuNnhUK3JCMW40UXA1SjBDSlRFV2RBQzJQL3g2U3plRGdZ?=
 =?utf-8?B?My9JWHRiVGRBN2ZMMHhldXMvRHprdmw5cDg1QmFNTFV0aThUWGNtaXpHbHd0?=
 =?utf-8?B?KytBQk1rQTdtdkptM0RCVXhvL0gvRi9wRTNSOW9Bcm11VXRxWGZPUXZqeXR6?=
 =?utf-8?B?VmJ0aWJ1b2ZGdlo4eU4zWjRGYVVsYnNMZVFiOTcvck1KWXdndExQN0hRSjl4?=
 =?utf-8?B?WWNISFQ4MWV1M0o1UGxmWkdHM0Zad2hkTnE5OGNGeERkUlRFTVlEaHRUVUVX?=
 =?utf-8?B?aE11OXRlOFQ1UHR6bWp5N05waTZQOWNGZi9GWXhUTlNzZjhnZWVkdGVYcVpr?=
 =?utf-8?B?OGxEQkdvLzZ1bW5WbUs3R1J3YVlwZnNMa1VGZVFLYUl5dXlTQ0haV0tUaUNS?=
 =?utf-8?B?a0NrQWRJd3NrTURkckh1ZWhYUUJQQjkrWVRyczdNSGZweEx2UnM4N3RzTk9S?=
 =?utf-8?B?WGNqRXdvR1duMXA4Q1crQ2dQWmoxbUhGUGtoNzdJZ2FVSWFuYTY1Z3N6ZzI1?=
 =?utf-8?B?YTJ4K0VGZ2FuOVBTejcyVDNWcXIwRzZCT1JuOGJRYm05WVg2OGNkdE00Qmov?=
 =?utf-8?B?bGU5RjhnSWxrTnFsWk95SG1OMit5aENEdFZSTWphaXlxa1F4Q3Y1STAwTktT?=
 =?utf-8?B?MXlVeGpvZXpZWk8vY1NzZkJZNTNrZjNrdU5NdDBNaUdVNXI5d0ZQS2lQTVhZ?=
 =?utf-8?B?VU5FcjI2QjVZTUhmbDJlb3pCbi9SdUtVTDd2T09xc25WaTA3YWlLYUlBMG5l?=
 =?utf-8?B?WnBCVmdFVHNzY0RZczZtVUVTYUQyNTNES2tDaWxIejhocG5iMEhLVUZGempz?=
 =?utf-8?B?dC95MGNLWUx6VTZyOTAwZ3dFN1kwQlJ4RWdhTjZOdDFHY3ZQcmwzQkNZRmtv?=
 =?utf-8?B?VVUxb3FZM0FYcTJzM1Q3TmNZYXFyZGNHN0dLZnNlcmZGMGkvclpvVWE4dmVk?=
 =?utf-8?B?TWhnNStvbGZHYzBRUmxDcm1ha3ExeHpvRmNUcVlWUzRmb0VIOG9DdFFRM3pK?=
 =?utf-8?B?SVpLNUp5YVdRRGY1OGlHSFhsOGFOWE53bmFtTjFzYnA4UW5HSHJFZXpHcFZN?=
 =?utf-8?B?QVdnWGJaSmNlT2dMaUFXcmdZTUJ4RjQ4eVo4ZjFya1BkNGdITmpqSHJkTTZB?=
 =?utf-8?B?ay9yQkhTeCtwbWZIOEFSVDhKR1pnb1ZBREZqS0xUKzlwRjY5VlpUTURJSmU4?=
 =?utf-8?B?NGMwVnpUL0hhc3dnNi9lOUZMU1dOYmZGVnRHUTIwdGlzc3FiSDZXLzlwZ1dw?=
 =?utf-8?Q?NDMR82W2SH9P6fhRKcmka74PPCo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7276c4fa-ecf9-4e37-cc9d-08d8c1057ecb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 07:47:42.2086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e4uM3XDRD51kpfAqVh4wwKrDw6PLPvGhAq3gUbpq3yrt78UvE7vUyMNZXfWjndqg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2385
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDEuMjEgdW0gMDQ6Mjcgc2NocmllYiBUaWFuIFRhbzoKPiBmaXhlZCB0aGUgYmVsb3cg
d2FybmluZzoKPiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2dlbV9wcmltZS5jOjg0
OjItODogV0FSTklORzogTlVMTCBjaGVjawo+IGJlZm9yZSBzb21lIGZyZWVpbmcgZnVuY3Rpb25z
IGlzIG5vdCBuZWVkZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaWFuIFRhbyA8dGlhbnRhbzZAaGlz
aWxpY29uLmNvbT4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1f
cHJpbWUuYyB8IDMgKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZp
dl9nZW1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ2VtX3ByaW1l
LmMKPiBpbmRleCBiMzkwZGQ0Li5kNzQxYjFkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ldG5hdml2L2V0bmF2aXZfZ2VtX3ByaW1lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRu
YXZpdi9ldG5hdml2X2dlbV9wcmltZS5jCj4gQEAgLTgwLDggKzgwLDcgQEAgc3RhdGljIHZvaWQg
ZXRuYXZpdl9nZW1fcHJpbWVfcmVsZWFzZShzdHJ1Y3QgZXRuYXZpdl9nZW1fb2JqZWN0ICpldG5h
dml2X29iaikKPiAgIAkvKiBEb24ndCBkcm9wIHRoZSBwYWdlcyBmb3IgaW1wb3J0ZWQgZG1hYnVm
LCBhcyB0aGV5IGFyZSBub3QKPiAgIAkgKiBvdXJzLCBqdXN0IGZyZWUgdGhlIGFycmF5IHdlIGFs
bG9jYXRlZDoKPiAgIAkgKi8KPiAtCWlmIChldG5hdml2X29iai0+cGFnZXMpCj4gLQkJa3ZmcmVl
KGV0bmF2aXZfb2JqLT5wYWdlcyk7Cj4gKwlrdmZyZWUoZXRuYXZpdl9vYmotPnBhZ2VzKTsKPiAg
IAo+ICAgCWRybV9wcmltZV9nZW1fZGVzdHJveSgmZXRuYXZpdl9vYmotPmJhc2UsIGV0bmF2aXZf
b2JqLT5zZ3QpOwo+ICAgfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
