Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5029349971
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 19:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 781E06EE0B;
	Thu, 25 Mar 2021 18:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2080.outbound.protection.outlook.com [40.107.243.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B7A36EE1F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 18:24:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScNHyoBsZoTNWfhjtb0YmD8QeeTtJZcnmtUuzyj1agyp/Jboonu62fE9UobVKdpRPQppmdoSnz4yB/xdJFR9Ak5mXqSzKLyrJxE2N42egGJD9L4kSAEOalWHTGIRzIF5AwdOLQwImllyhChAaJaaDuqPPw17KrVZj4FhB/3HOLNo6oyRZO9LegRU5aipMHh3ee5aAQ35op9R67eqUOmw0uFpSKL5aBaY2kc8SBbjkckDYrEOAT/+E177AOWqq6tHXTqXk3R44gq3kRZRRQpgo4gIdRW0X/7yk1ClOT9Eksjf3c0WgMM+vWUHDj05wqTNFCwvVBtav98jD2ngd2SR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SqROZLZCOOjBoKMVH+WjvAQ7Q0h2QgpzUijtUHTYMM=;
 b=S2g9JQnQgNbTIsEzJvNp/QPlDuKZcJhENHrGys/mM4F50v2Hp++XRdgiAjcm8qNKAxN5lpu4zA3tb31FxpslObFRnjXUDAqXnqOfvBARwkqJL08Dazvo/K48p1ytEN2tHy7KqL7CfmhSmTWgvOiLuMQpwt2jHy6V2MFeah6onuQBhRTE92fdR1Qgdx7TrPPUBvPeQdseyh0fd9jD73Xh0TrmyS9bta0uvX049ctjjUy01kBJMrJC2bkjjhvGAgs55htKF/9kdS51jXDxjVrArvdik0sV9ZZqXvbzEsbYbKm6tw85CGikPHs9bKVH2yet/KWyDCUwjSpoUkwCS93z2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SqROZLZCOOjBoKMVH+WjvAQ7Q0h2QgpzUijtUHTYMM=;
 b=F0l8XvZAJJO8/y5M1bbNLbZUZEl1mas9T/K689DSfyxzW1Gsu7ugw7BrgaEDKqVUtc+JENbf/MiRhxpuiqdEGfIJ8zhhPIWnluElM1FILtqNFX7ZWhbHlnwQdD8l0X696Cf1DDh6ARgPx+LAh3MI1aCwDo1s4FLMbZKOxYC9/34KmYsW4fyB9GQN5V2ITEYpCi6Er9wjxwSDBh6FXECYxzhbcZ8F9cD7mbpIKLMTXyr4mu6lkevGtiTkt48qpPYXnLWfezZaHWZ0kGUS6/ntnrMVJAkAQyscwNOkj7fzEu1hoh9+KesN/1kmsCZZ9XkBMlVpRAmM2e3sYhwdN4upVQ==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3514.namprd12.prod.outlook.com (2603:10b6:5:183::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24; Thu, 25 Mar
 2021 18:24:44 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 18:24:44 +0000
Date: Thu, 25 Mar 2021 15:24:42 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210325182442.GI2356281@nvidia.com>
References: <ec99146c7abc35d16b245816aba3e9d14862e624.camel@intel.com>
 <c2239da2-c514-2c88-c671-918909cdba6b@shipmail.org>
 <YFsNRIUYrwVQanVF@phenom.ffwll.local>
 <a1fa7fa2-914b-366d-9902-e5b784e8428c@shipmail.org>
 <75423f64-adef-a2c4-8e7d-2cb814127b18@intel.com>
 <e5199438-9a0d-2801-f9f6-ceb13d7a9c61@shipmail.org>
 <6b0de827-738d-b3c5-fc79-8ca9047bad35@intel.com>
 <9f789d64-940f-c728-8d5e-aab74d562fb6@shipmail.org>
 <20210325175504.GH2356281@nvidia.com>
 <1ed48d99-1cd9-d87b-41dd-4169afc77f70@shipmail.org>
Content-Disposition: inline
In-Reply-To: <1ed48d99-1cd9-d87b-41dd-4169afc77f70@shipmail.org>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: CH2PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:610:52::13) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH2PR04CA0003.namprd04.prod.outlook.com (2603:10b6:610:52::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Thu, 25 Mar 2021 18:24:44 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lPUew-002xTZ-P1; Thu, 25 Mar 2021 15:24:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87b372a8-7844-4409-9ba6-08d8efbb4359
X-MS-TrafficTypeDiagnostic: DM6PR12MB3514:
X-Microsoft-Antispam-PRVS: <DM6PR12MB351415345898F8D07145D8BEC2629@DM6PR12MB3514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GYdPxnX5s3a9G9N7ZgYZQH+Ez32r3RXm8u9k1vyQe1rmCkkZL2F0RKub8tApqXFuHWkw6h+Pgdx0Mz7139Qz45LiHlpEwbd3Xp8KHT3CQUyl5JXwRs7pnVRm9mxkdc2X2/fZcLYcvxGdvXvsZ85SGrM5MHp310rXxtzO0w02HNbY99Cg56Tfe++CIwZZCZZLSbraHwidtF+RaKRrJ5C5O8Jy4VfC6w401dqtFnl8tW5bYrv/bhFZkmde1z9vgzYQqyRwNImE/NmdJ1ulg+cAlo9wKqm/mWFgUe6szIBoDqUG5EQvHe6yXP6G65zN25KBKShK3ww5yKUtVsT3GqkF2XGnxrrdcVKUxZCQkGo/AtoAYAUA61ePwmC0/G/VRpJ+DqBULf+6MycJMyjOLvVoa0VCMno8yjSj94zkx6Vze5zh/up+LWF1LwgN+ilyRVVHyxP5FcbRkrgVyv7vRjNE49n5qwZdVzPgKr6HallaJondo/qkAA5gk8HT1zUgxVxdB1Iat7Kle4blCr1mBrqiHnFtLqVqbm4GJHDVhnh43U5vQdMKtTa8w7XQP+57rHho6KVv1U8F53ZO/nbvjp3xAwFmGzTsFQqvbmL3qdwQn/iq0y4Fh4A/KLzMR078Ud74fzchiopCa/1XgB5+ib0kqteSWMiNNsYE1xjWk2d9plmCi4HVNB9Ok58mIumKNOzm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(346002)(396003)(136003)(66946007)(8676002)(86362001)(36756003)(66556008)(66476007)(2906002)(33656002)(4326008)(54906003)(478600001)(316002)(8936002)(426003)(2616005)(9786002)(9746002)(83380400001)(186003)(1076003)(53546011)(5660300002)(38100700001)(6916009)(26005)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0c0djdQSS9QZXRuVnM2ODlySEExYlU0L2VpQ3VGbi91RjZOZWVHYm4xR1hS?=
 =?utf-8?B?SHVCc29hN0ZBMnIrUXI4YlM3REJXT0JHSmdsTlhLNnNmUlYrQWdGVlRpbHg1?=
 =?utf-8?B?WE9zUkt6ZmkwWGcxWjZ0VUZoekhick94RHd6WWwyOFVOc0pnd2UrNm1TM3pi?=
 =?utf-8?B?RVpvQXVNVmJ2bGZVdi9NdFc2NzJGWFV4RCtpYmF1NUoyNk9hRS9abFVjd0J1?=
 =?utf-8?B?bG5IOW91ZllMdDZBTUFjRkhhcG9ycmludDJodkJ6eEx0NTV3TUtFM2JVMFpn?=
 =?utf-8?B?dXZEMytRYUUxdDM0S3YwSFpOZ1hCQU4vY3R3b2d2Zy9kWURtN2VIMThnNmNv?=
 =?utf-8?B?SkE3OTNyeW11VWpIbFJKZkdVNExrYlRhWEpuT0dpTXFMSlZiVHh5UnF6aGc1?=
 =?utf-8?B?OEZNU3hqVENwekdFSmZKUDNOMk01eTAxS2daejl1UDZMTVlseGd0YVNMamhU?=
 =?utf-8?B?NW9nbk10Qng4ZlFpQklSSTNjOWhwL1U5ZFlpSVFHZDF0S3c0NjRjOVRqSVo3?=
 =?utf-8?B?N3gyanlRUTEzVXR1L1FpbjRpUGhkUkl3b0tOSG4reU9yS1R6blVXcnpRTnZu?=
 =?utf-8?B?bjJueWhqMFVaeGFHTXR6WWFMbXlUOWVHT1JPRUJUcC9GcDR2WlMzL3ZOS3Q1?=
 =?utf-8?B?cDFVM2dtdXVJZ1VCRmQ0aTRuWU5uZzkraUp3TE5wQS9DdTRKcHRkd3IrRk9j?=
 =?utf-8?B?ODgxUHo5Nm9KSHdFRGpFbEFDRFJXcDVSWmg4cGdmaXg0eDRxckNjY25waHNo?=
 =?utf-8?B?dXF4MTJBTmtxbnFJa1hCMHhVRzFkL1diYmoweVhObkxqNVFXNnNkS3V2N1F6?=
 =?utf-8?B?YzFWT2ZER2h5L1lXUENHVkxnTWFrRGtscnY0Y05iNEdZTU9MNDdYQUNYb2NS?=
 =?utf-8?B?aU5RNXVjN3cvb3pSY2UzRWdVVGxFTk13b1BFY0ZqcEZBbWRwOXYxMTRLQUlH?=
 =?utf-8?B?bVBvQVdWOENDeTBXeEc2cU4rRHRSeGhabGdwTThyQXRaNkxrOWdtdEFJOHB6?=
 =?utf-8?B?OEtCa0hiUVNLZWFTQnMzY1M0eE1JcW5QWnFMN3A2eE0zS0xiU0ZpS3FsY1ds?=
 =?utf-8?B?aU95ZEZGd1dwdEliL0NJQ091UTY3bTNUY3FadXBVUE5vSmZ1SEloMDY5b3Uw?=
 =?utf-8?B?cExCSlFBcGxoU3docVNndk5BSUlqM0xYdFY2WFkzNEJxN1dzTlNRWk9tTm5K?=
 =?utf-8?B?elpkbk12Z0dJbGFsdEFXRnZZd2xka3d5WEpIZ0NaVDN5NHhzdEdkeGJ0NG9h?=
 =?utf-8?B?UHNXeFUxRWhKWVIwREV1RDhQM2d4NU8rMnJXUkVsVk5NblZDQmd1bDF0TW1a?=
 =?utf-8?B?bmRHaWw4VnhZZEk1Y3BMUzZXZ3IxNVp6cUtJMXEvNEg5VWNRQWJnemxMSldG?=
 =?utf-8?B?dUlGQlJPRGJNck9qenh5QUFTV290bk9hVFBQY1ptODB2eE5aVENUZHViUy8y?=
 =?utf-8?B?VGgyamlzNnpzZnBsUHRqZmduNWJUQUVSTlBGeVQxbi9LOVU5UHk5Y1RrMlFp?=
 =?utf-8?B?VEtCTjlEQURaRTZOb1lsYjRHaS9UdC9FQ25OY2RVL21ZOGh6WTR1bjE3c1d2?=
 =?utf-8?B?RG1zcmpEcC9taEhTTXV4RlVvbUI5bGhqNUpPRG1qcmthQXdZWXdCcDZodDYy?=
 =?utf-8?B?Wmt1ZUg0OXRkdEsyM3NVbVhhM3UrYkVxYVV5cFNZRlZXV3dYclFEWHZPd1dS?=
 =?utf-8?B?eE1GMVRQNnJYU3hvNFhtUXluQ0VFcHJ2SUtXMFpZZnJQV0Q4QVBLcHJUTVRk?=
 =?utf-8?Q?yEr38YIpfxn4fmwtZNdR2GXWg4j+cE1NgRUbxM/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b372a8-7844-4409-9ba6-08d8efbb4359
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 18:24:44.4232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJ0SUKQ0zxs5emj9lVs3SfnFZaxGIeYa+ZNOPWJi015r2d9/D5XOgAlS6HGw9L5l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3514
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
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dave Hansen <dave.hansen@intel.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgMDc6MTM6MzNQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKPiAKPiBPbiAzLzI1LzIxIDY6NTUgUE0sIEphc29uIEd1bnRob3Jw
ZSB3cm90ZToKPiA+IE9uIFRodSwgTWFyIDI1LCAyMDIxIGF0IDA2OjUxOjI2UE0gKzAxMDAsIFRo
b21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4gPiA+IE9uIDMvMjQvMjEgOToyNSBQTSwg
RGF2ZSBIYW5zZW4gd3JvdGU6Cj4gPiA+ID4gT24gMy8yNC8yMSAxOjIyIFBNLCBUaG9tYXMgSGVs
bHN0csO2bSAoSW50ZWwpIHdyb3RlOgo+ID4gPiA+ID4gPiBXZSBhbHNvIGhhdmUgbm90IGJlZW4g
Y2FyZWZ1bCBhdCAqYWxsKiBhYm91dCBob3cgX1BBR0VfQklUX1NPRlRXKiBhcmUKPiA+ID4gPiA+
ID4gdXNlZC7CoCBJdCdzIHF1aXRlIHBvc3NpYmxlIHdlIGNhbiBlbmNvZGUgYW5vdGhlciB1c2Ug
ZXZlbiBpbiB0aGUKPiA+ID4gPiA+ID4gZXhpc3RpbmcgYml0cy4KPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+IFBlcnNvbmFsbHksIEknZCBqdXN0IHRyeToKPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+
ICNkZWZpbmUgX1BBR0VfQklUX1NPRlRXNcKgwqDCoMKgwqDCoMKgIDU3wqDCoMKgwqDCoCAvKiBh
dmFpbGFibGUgZm9yIHByb2dyYW1tZXIgKi8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiBPSywgSSds
bCBmb2xsb3cgeW91ciBhZHZpc2UgaGVyZS4gRldJVyBJIGdyZXBwZWQgZm9yIFNXMSBhbmQgaXQg
c2VlbXMKPiA+ID4gPiA+IHVzZWQgaW4gYSBzZWxmdGVzdCwgYnV0IG9ubHkgZm9yIFBURXMgQUZB
SUNULgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBPaCwgYW5kIHdlIGRvbid0IGNhcmUgYWJvdXQgMzIt
Yml0IG11Y2ggYW55bW9yZT8KPiA+ID4gPiBPbiB4ODYsIHdlIGhhdmUgNjQtYml0IFBURXMgd2hl
biBydW5uaW5nIDMyLWJpdCBrZXJuZWxzIGlmIFBBRSBpcwo+ID4gPiA+IGVuYWJsZWQuICBJT1cs
IHdlIGNhbiBoYW5kbGUgdGhlIG1ham9yaXR5IG9mIDMyLWJpdCBDUFVzIG91dCB0aGVyZS4KPiA+
ID4gPiAKPiA+ID4gPiBCdXQsIHllYWgsIHdlIGRvbid0IGNhcmUgYWJvdXQgMzItYml0LiA6KQo+
ID4gPiBIbW0sCj4gPiA+IAo+ID4gPiBBY3R1YWxseSBpdCBtYWtlcyBzb21lIHNlbnNlIHRvIHVz
ZSBTVzEsIHRvIG1ha2UgaXQgZW5kIHVwIGluIHRoZSBzYW1lIGR3b3JkCj4gPiA+IGFzIHRoZSBQ
U0UgYml0LCBhcyBmcm9tIHdoYXQgSSBjYW4gdGVsbCwgcmVhZGluZyBvZiBhIDY0LWJpdCBwbWRf
dCBvbiAzMi1iaXQKPiA+ID4gUEFFIGlzIG5vdCBhdG9taWMsIHNvIGluIHRoZW9yeSBhIGh1Z2Ug
cG1kIGNvdWxkIGJlIG1vZGlmaWVkIHdoaWxlIHJlYWRpbmcKPiA+ID4gdGhlIHBtZF90IG1ha2lu
ZyB0aGUgZHdvcmRzIGluY29uc2lzdGVudC4uLi4gSG93IGRvZXMgdGhhdCB3b3JrIHdpdGggZmFz
dAo+ID4gPiBndXAgYW55d2F5Pwo+ID4gSXQgbG9vcHMgdG8gZ2V0IGFuIGF0b21pYyA2NCBiaXQg
dmFsdWUgaWYgdGhlIGFyY2ggY2FuJ3QgcHJvdmlkZSBhbgo+ID4gYXRvbWljIDY0IGJpdCBsb2Fk
Cj4gCj4gSG1tLCBvaywgSSBzZWUgYSBSRUFEX09OQ0UoKSBpbiBndXBfcG1kX3JhbmdlKCksIGFu
ZCB0aGVuIHRoZSByZXN1bHRpbmcgcG1kCj4gaXMgZGVyZWZlcmVuY2VkIGVpdGhlciBpbiB0cnlf
Z3JhYl9jb21wb3VuZF9oZWFkKCkgb3IgX19ndXBfZGV2aWNlX2h1Z2UoKSwKPiBiZWZvcmUgdGhl
IHBtZCBpcyBjb21wYXJlZCB0byB0aGUgdmFsdWUgdGhlIHBvaW50ZXIgaXMgY3VycmVudGx5IHBv
aW50aW5nCj4gdG8uIENvdWxkbid0IHRob3NlIGRlcmVmZXJlbmNlcyBiZSBvbiBpbnZhbGlkIHBv
aW50ZXJzPwoKVWhoaGhoLi4gVGhhdCBkb2VzIGxvb2sgcXVlc3Rpb25hYmxlLCB5ZXMuIFVubGVz
cyB0aGVyZSBpcyBzb21lIHRyaWNreQpyZWFzb24gd2h5IGEgNjQgYml0IHBtZCBlbnRyeSBvbiBh
IDMyIGJpdCBhcmNoIGVpdGhlciBjYW4ndCBleGlzdCBvcgpoYXMgYSBzdGFibGUgdXBwZXIgMzIg
Yml0cy4uCgpUaGUgcHRlIGRvZXMgaXQgd2l0aCBwdGVwX2dldF9sb2NrbGVzcygpLCB3ZSBwcm9i
YWJseSBuZWVkIHRoZSBzYW1lCmZvciB0aGUgb3RoZXIgbGV2ZWxzIHRvbyBpbnN0ZWFkIG9mIG9w
ZW4gY29kaW5nIGEgUkVBRF9PTkNFPwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
