Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4043479E4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 14:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2326E9DD;
	Wed, 24 Mar 2021 13:48:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E7D6E9DD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 13:48:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heV4dp/QvFuGTbOUwmfTgs66DIPHGrvn6ckNR/GgT23JCOmti4MljBhiDSinfgG8/LfaFuqy7OV1UTnqFjb4qvGPU6idw5Uaebi6hcMQ4kV/3+kOum0Bu7Wbaqz3BcvHg9o0ABTavfw45lRb6Vm1TnYt1oQa184MxoYSa6hOKKoTOlOTFVycvBs9Pt1eorZmYVAg+NDLM6XzhrASx9GFdiHmLijECArzFqly8C9cz217NGXOHstrYQou30fhGJsNKbo31hxUAhCzrzt1Rv9h/IvDREi24vQdw5KYTQ/EY/pGajc5wLJfNMmqQlLqCKGRvH8U9kI+G4XwcNyLjslpTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qiv1Un4zGtiSdXes1h4Zse2yVhagHfuPw3wA/HE2Vf4=;
 b=nj9zz1NccS8c02CXlVthUqejeR6+wqn3ujVA5sNIn3k5D/S1Joe0ojZ1VYQ++YgNsFg1k+yUCOBpIuo+eK61OKqz6w4kkp3PhsUpO2wz9hD3ht9R0P8FI4niR+U1kjWMGPVbzeJDXfjGq6XE6K+CtHBvob/A1LDfDuJ9Bs/0q/D1IEbdD3f11DnAeziJ8tM8WnnCxVh6fbdJ3y9mgEkcO4j4WsDFhGflWkZ9LPXXZy2R8q25TXANCOlluEE5iKkOVT+03rI+JsiAnXdsjDdv9cy8MBEoKtsps0sBtRmLJf+c4ob2izSVBhAOS7+oO6l7tEujtixfmVNhN4MZaIggAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qiv1Un4zGtiSdXes1h4Zse2yVhagHfuPw3wA/HE2Vf4=;
 b=nvkhTA4r3x6XLL/lbOExmCSykzPaAvTTHavDXGsRwlhqYo6DDfCf/4V0x/Xzgh9wo7S9XwWW3BQ1ZGSLm6NAbMh6nSCWzte8zgm1KnVmtNGyaSZwEzFxNTJmKUWD1X3urh8ZAf9d9daj8ZODrjrv0Rk2cwYH5bVHikPwaXwmDvBo4XaA03d8AlPE3VP7wSoSWNkku4pXszEJKOHu/1jk259PCLcTiOqUnzTwRlcIwQHQ2qDCx/CAPgzYwNWYZjR77coKSb4x+oN8WVI5EkOqzJ/DSKJJJ3gzGLSxcsSjsoyQYv+I/F2dhj72CMmLC9zbwxjexANaSLeooY967tKPzg==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 13:48:35 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 13:48:35 +0000
Date: Wed, 24 Mar 2021 10:48:33 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210324134833.GE2356281@nvidia.com>
References: <20210321184529.59006-2-thomas_os@shipmail.org>
 <YFnST5VLcEgv9q+s@phenom.ffwll.local>
 <314fc020-d243-dbf0-acb3-ecfcc9c2443c@shipmail.org>
 <20210323163715.GJ2356281@nvidia.com>
 <5824b731-ca6a-92fd-e314-d986b6a7b101@shipmail.org>
 <YFsM23t2niJwhpM/@phenom.ffwll.local>
 <20210324122430.GW2356281@nvidia.com>
 <e12e2c49-afaf-dbac-b18c-272c93c83e06@shipmail.org>
 <20210324124127.GY2356281@nvidia.com>
 <6c9acb90-8e91-d8af-7abd-e762d9a901aa@shipmail.org>
Content-Disposition: inline
In-Reply-To: <6c9acb90-8e91-d8af-7abd-e762d9a901aa@shipmail.org>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::24) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Wed, 24 Mar 2021 13:48:35 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lP3s9-002125-5r; Wed, 24 Mar 2021 10:48:33 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b77e31cc-ac60-4992-f5b8-08d8eecb8520
X-MS-TrafficTypeDiagnostic: DM6PR12MB4299:
X-Microsoft-Antispam-PRVS: <DM6PR12MB42993F63F5E284A5B470938CC2639@DM6PR12MB4299.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fkrmE1OcA+0wwqaCCOc0voeiF985lUHTn05MiSETfEJEaHAd1NRba1Pc94sOckl3DbtUAfBmsb/wqRH1RIhj5YZE0qivCTSO/pc95PPivoP4XHgR39g0ihBvIpHDaZ1NpPcMigx4L0NAHI5Nde2Nxu8AUm1KtHyGAq6hO5SxCW9yrNDiv4F/zZSWIPLDXss8GDDHHGuofpRqbCTg/kntTYtFEJQSGHb0jTY3cx57CIkhGly04UXDHrIOfwjHd9oxHuSlfmu+zrRh7OUkqcXjZqO4yMlli1BKERBfR+dvUWEGzW93X1sd/tsA2eY2FZd3UmaOkON4qR8oBtY8jSICeqtv48OMHwBE2hyXQTFDgx2d48yCaRdGNcdswfzO7AsSEUwtnVA+P7afbjijClPnzgDUsSDNV1ZRTb0o2kxWojZ+AS5MgcvdP4H07bCtMpHp+tn63NXa9zJjYNkx4cCCfw6GMHRWGPs5oA071+vlilR6yVWDXkarMCzwQYfU6hOV7HVOknS8jH2gvY9GZys1BSfT6OV8dYruZ8xTm+YsgCJrnf99nLbdIFFO0EF0V0iyIXtGhW8JqZFhJepR5FJI6d49CnvL0HfbehQhTdkn9QV/7ExqFTNqUchUIdmoYilDBBrvlYM9EpF7k7BfKfkGf13iwxQx8r7F0mdGj05Wl3I/xKw4wMQAkkO3TjbtYGJp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(2906002)(36756003)(33656002)(6916009)(8676002)(8936002)(38100700001)(9746002)(5660300002)(1076003)(9786002)(316002)(54906003)(4326008)(83380400001)(66946007)(86362001)(66556008)(2616005)(26005)(66476007)(426003)(186003)(478600001)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WDQ1UVBMSWRKMkl5SEwzWUNuWFdJd3lTbGVJTFFIWDZNTHpCVWpWZ0FJdDhv?=
 =?utf-8?B?ZHpzZVBUdlordko2Z1FsS1UycTBtVEdQSWlBK3JDRzcxWVlaQ2hIMFNZbHE3?=
 =?utf-8?B?ak1kVEdzcmh5Q3BLNWV2RTlmOEpPRlFzUnFIdWFpaWpQNWZ4VjdsOC9DQk5N?=
 =?utf-8?B?WWdCQkVwWUlOQlljMm5DQXZXdVZOZURMVkUxY21qK1h4NDlUUkZpaEd6c0p4?=
 =?utf-8?B?MnFhbTZiSWR0S3dsNllTMnNBdWhQS0R3bzU3NDNxZk5Gc0MrbGsraWQrNW9p?=
 =?utf-8?B?M1UwU3E2VysyNkd6VW4rTEFQVXNkZ1RoSGtsckgzYmJ6Ry9tMXpmeFVuMC9r?=
 =?utf-8?B?blJWSUlEY1hSN2RXeVdtTnZ4bmR3c2tmbG02cTVsZUwxRmJ4ZjlNcE5Zb01R?=
 =?utf-8?B?OVhLdnBzc0hOM2dLQUt2UVppZkRaUDdyT3dTSUcvY3VDMUlyazhPRTc2SmE3?=
 =?utf-8?B?amt5NVlIWStsK0NlN3lPaU1VTkh2dFg3YUhsV2MyalhLU1pETkZTQUFmSS96?=
 =?utf-8?B?cFpaYkhrd1R3RTNERTVqTURzemdRejZOeHlkNmNrRFQ4OCt4d3hSZWZJOVYv?=
 =?utf-8?B?V0Z5WHBSMHpBTUkvRXhZSHdFSXp6clVnNDVZVXRpUDdLSmNvSmpjTlA5ekE4?=
 =?utf-8?B?Tm1NSFI0TDJMV21ubWJDd241UDRqaFdmQko4SG41V0lRRkRFdTdhVGFqOWRX?=
 =?utf-8?B?Njg5cHI5ZjN5N1p2MDRIWCtFeWhOVUw5NGdzZHhkWTgwSVJST1FmVWRpSVhO?=
 =?utf-8?B?SmNYdlBIZWZVNGF3Vk1rM1JTcEp1TTlZd0lXS2FwSlFkclpwSUtQd0RoalFS?=
 =?utf-8?B?N05FZDJucC9wbE5rSEtHdm0wYS9nblduN0NZZXcyME5wSGhxcS92Q3lEbWtl?=
 =?utf-8?B?anJBS3IrUW9kSFBOcU5QTUYwQUhYcEo1dVZVRlNHa2g4YzhPejlrMm5Sa1Rw?=
 =?utf-8?B?blJQNzRlS25HSStadVJjZ3pCdHRIU3BYRzgrRXIrWm9EZkF1ck5XUFNoMGg3?=
 =?utf-8?B?cmh5TTdlZlV4ZXpqYW1hWVN6bk9iNm92d0xVaFAxYWhpdTlrRFU2ZEpDL0ZC?=
 =?utf-8?B?d2hOOVBwRGN5WG5LOUl6MHdoT1NvMmlNRHVLOGduNTJ3VXUvK0JkM0FnTzh0?=
 =?utf-8?B?SmQ3Znh3RFpLWGFmZW4yaFZqcFp1cFNEcnpRbGoxNUFyZTNUYUxvSjZPWlR0?=
 =?utf-8?B?QlRKL3QwaUtxM1FuYkVqdW01Mko0M2pVSTlUMHNMZllWYVFsbHBiTlU0NTVj?=
 =?utf-8?B?b3dMU3RjM3dhWWQ1WFR2YU9JQkdoSGFTL3VSS0N2bHp2WUhUUE8rVk15dGg5?=
 =?utf-8?B?Q1UyTnZSNEllWTV6T2NPY2tqSDY2ODBqVS90cWR4M0VkZG9Dczc0QWRQNlYx?=
 =?utf-8?B?aUlFSTNNN2VBZmV5NmJONm9vOHZPd0dSZHBwQ2I1VkFLVE9VYk1jeGQrQlpO?=
 =?utf-8?B?Ky9EUXlTZTcwWlN3ZDBKejJTS0tUSXFGdyt6MGIvd0RadlE4WCtlaVl4SUxM?=
 =?utf-8?B?R3FvY0JzOUlaOUZjN1REUTlLSHpGbytaZ29lMzJYU1A2dis5T3Q4Z2NKdUho?=
 =?utf-8?B?V0RZNWFVVkluVVFXT2o5czFmVG5XUTMzR2dLV3JjdXFDUFhkUlZZNUxDelFi?=
 =?utf-8?B?TDh4RHJydm40SkZKck91ZlNlL0Q1blh0Y2hjNDVNYVUxQ1doWmlzaFRXYlpV?=
 =?utf-8?B?YjRQZ0xVUXBieFB0MkdjRGpiVWRBNUE3cjN1bnU0NjNxclZNY3ZyRXd6NG5O?=
 =?utf-8?Q?WMH7BvK8UF+Y5Tm9EvcfpdFspj8Mo7ilkDe5xne?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b77e31cc-ac60-4992-f5b8-08d8eecb8520
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 13:48:35.3536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yMYrrBwsm7N3caJncL/tgMgeorWdfhnSv5tJcYlP1Sat7kiukKslvrtMqv7jCwwN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgMDI6MzU6MzhQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKCj4gPiBJbiBhbiBpZGVhbCB3b3JsZCB0aGUgY3JlYXRpb24vZGVz
dHJ1Y3Rpb24gb2YgcGFnZSB0YWJsZSBsZXZlbHMgd291bGQKPiA+IGJ5IGR5bmFtaWMgYXQgdGhp
cyBwb2ludCwgbGlrZSBUSFAuCj4gCj4gSG1tLCBidXQgSSdtIG5vdCBzdXJlIHdoYXQgcHJvYmxl
bSB3ZSdyZSB0cnlpbmcgdG8gc29sdmUgYnkgY2hhbmdpbmcgdGhlCj4gaW50ZXJmYWNlIGluIHRo
aXMgd2F5PwoKV2UgYXJlIHRyeWluZyB0byBtYWtlIGEgc2Vuc2libGUgZHJpdmVyIEFQSSB0byBk
ZWFsIHdpdGggaHVnZSBwYWdlcy4KIAo+IEN1cnJlbnRseSBpZiB0aGUgY29yZSB2bSByZXF1ZXN0
cyBhIGh1Z2UgcHVkLCB3ZSBnaXZlIGl0IG9uZSwgYW5kIGlmIHdlCj4gY2FuJ3Qgb3IgZG9uJ3Qg
d2FudCB0byAoYmVjYXVzZSBvZiBkaXJ0eS10cmFja2luZywgZm9yIGV4YW1wbGUsIHdoaWNoIGlz
Cj4gYWx3YXlzIGRvbmUgb24gNEsgcGFnZS1sZXZlbCkgd2UganVzdCByZXR1cm4gVk1fRkFVTFRf
RkFMTEJBQ0ssIGFuZCB0aGUKPiBmYXVsdCBpcyByZXRyaWVkIGF0IGEgbG93ZXIgbGV2ZWwuCgpX
ZWxsLCBteSB0aG91Z2h0IHdvdWxkIGJlIHRvIG1vdmUgdGhlIHB0ZSByZWxhdGVkIHN0dWZmIGlu
dG8Kdm1mX2luc2VydF9yYW5nZSBpbnN0ZWFkIG9mIHJlY3Vyc2luZyBiYWNrIHZpYSBWTV9GQVVM
VF9GQUxMQkFDSy4KCkkgZG9uJ3Qga25vdyBpZiB0aGUgbG9ja2luZyB3b3JrcyBvdXQsIGJ1dCBp
dCBmZWVscyBjbGVhbmVyIHRoYXQgdGhlCmRyaXZlciB0ZWxscyB0aGUgdm1mIGhvdyBiaWcgYSBw
YWdlIGl0IGNhbiBzdHVmZiBpbiwgbm90IHRoZSB2bQp0ZWxsaW5nIHRoZSBkcml2ZXIgdG8gc3R1
ZmYgaW4gYSBjZXJ0YWluIHNpemUgcGFnZSB3aGljaCBpdCBtaWdodCBub3QKd2FudCB0byBkby4K
ClNvbWUgZGV2aWNlcyB3YW50IHRvIHdvcmsgb24gYSBpbi1iZXR3ZWVuIHBhZ2Ugc2l6ZSBsaWtl
IDY0ayBzbyB0aGV5CmNhbid0IGZvcm0gMk0gcGFnZXMgYnV0IHRoZXkgY2FuIHN0dWZmIDY0ayBv
ZiA0SyBwYWdlcyBpbiBhIGJhdGNoIG9uCmV2ZXJ5IGZhdWx0LgoKVGhhdCBpZGVhIGRvZXNuJ3Qg
Zml0IG5hdHVyYWxseSBpZiB0aGUgVk0gaXMgZHJpdmluZyB0aGUgc2l6ZS4KCkphc29uCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
