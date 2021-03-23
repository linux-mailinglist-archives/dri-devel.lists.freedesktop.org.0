Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D544C34602A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 14:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3356E89E;
	Tue, 23 Mar 2021 13:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695F66E8ED
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 13:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6SzZ8JIQBFEJXWoH+V2Lr/fTbpwO74ja29HoqGOz0nTHRJvqiNiv2b03qqbRuLwgfCduwCrthTdeUKlHST07a1JiJH9E2dTY58cLZF43GcPpB6tUHCT7meT8CB9x5muQWrWcld2qM5MMNchsN6YJ1XKTLUPziNkSPi2eHilpoJaSNFZB7FGxUyKfpYkh7GXAFln8isadXJmZRqWoLbc/QLMwBO8J1yugiOTPXKq3y5svfsLVqb1BIA33l/cdsgXKDVrq1xVGlELnXVw242OmerN9LPJfhbpFjOpS5elTf8G3FqrPxcUt57+tPipi0Vx3zc512e1DRRcCLwdq8s9zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9loTaYlyrgzItrSRIpPBcbDiywraou2sdXLQZntOWI=;
 b=TiU+LwQE2iK+p8jxfYJtykfL7ZdPdswLG8/9AShBJVprVVPviPrc1SsBBxlnCPiT9ycdG1HYkD1fMP9CMYHlYr8NyES0Jt3PqvfepvIwOAQpcfuWd0dJBRvhyKSoSuobWIDOx0/G4fVZ1wUPDEGeRh6H6Q7jyJqf0oz0WDOlRL01h5pq43rQQh0q/Qr5fmmE1iRUuOQffKIYD/pi6b/MKho7Ibc9CoHf4TE5H/YyaTlfzyQN25pn+hXj44YkeoHFJ6o1Unh1BtRw2JBjVsSJooj7g5BbmGLzmI6TSHPvC8HruqLBGywgV8MHc+NYXw4hdBuXxNJKQEcQRK17qRB9cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9loTaYlyrgzItrSRIpPBcbDiywraou2sdXLQZntOWI=;
 b=fWB+euSc4sgxoGsnpsxxsZBlR72qzuKYXHTVH97UJJiQWtTZWUzl5RvpN5WAVsh1a1Vk2OH1kAsOtdXDa5zD3WEU+pBtaiYF+EcPRbBk2IXUBc6pIoeeW4NZ8OKYZfY5asrOt4+BT2bXivdrzFyUFMZENA4NvLAg/OUija1JEYiOya+nJGUQqqyljJu2Y8+hbBWp6hRE8pnC0DuzvGp+huE7fT5oHqT2nna1+zuWb7gnt2iJkQQTAnna0X/k06miYJ4Y7/AFfPJn8ThvpCzFhOWsHsaxN4MZBZ8QblNJc/blwfBeicv8EwxSJqSUt/ZKAW9jWetXLji/znVM830ovA==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4011.namprd12.prod.outlook.com (2603:10b6:5:1c5::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 13:52:19 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 13:52:19 +0000
Date: Tue, 23 Mar 2021 10:52:17 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210323135217.GD2356281@nvidia.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
Content-Disposition: inline
In-Reply-To: <20210321184529.59006-2-thomas_os@shipmail.org>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::13) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Tue, 23 Mar 2021 13:52:19 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lOhSD-001Wa0-On; Tue, 23 Mar 2021 10:52:17 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed7bdc52-6ba2-4c12-d777-08d8ee02e034
X-MS-TrafficTypeDiagnostic: DM6PR12MB4011:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4011A288E6A6F826F44CDCECC2649@DM6PR12MB4011.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wHCJef3Z/fTWxkYhYlK1F2mQCeehtyDlUbcYP2Sbq1yokywnczhaz+yGSgbf3tYL3xHZvGR5Bdm60F0Z7zErdH2DyUzvZYns4ckw72lFpSdo3CYyleUprB1Qxb7Yy2aOQqq6OxEeEKJbFbThScvUmEH0mbWCjHAq5zeiqLdrJrdWZ9c440gKMTs+GBPR/B0gWTGg6B0+3uWDmdm80x8FXd/5BbjY+TdsbVaJ4oiUYnuAQi64ItObLfouqbz5z+otSKyvdKRx3ZvlZ29+aaVtmUMu92+bYYJVfrkQ8WKK0cZUwXNWmqqe+v91fRO2M2KmGFykIxTovsgxBwdV3uTDgYHmQiaBWgOKFCen6HQCx7a7w6uWmqJBxLsSDH60+br02TBbhvlreRsvFdGjb4SY/kML7y7DBjwVd8Y1Yw+7GD1nmUA6ktxAKcfE0TDSeFm58XA5mdTjZBMPq3RqTSbeJikJm+GdaBmrtgFon0t7IE9LRE8bo4t/Dxr1rNO16K2k+8rnb6RHKOVNCNi1dHv3Gh3R1xGAgz4y7SUE2IvVYBRj8MzxP8/m0vmaVok/ha98szBMGeFKCJLB1uXhMo1sLKGY0xOp+gydCnvkvG9h/+j3rns5qWrvo42N39/4sf2olHZWGP4ouWnpLiuwSFW4ER4MMNQZBFH1gw4hA/UiAIckNAzbWKLIzrCDTlew2NmY9ury3ThompEJqmBTocg/5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(36756003)(6916009)(26005)(2616005)(54906003)(83380400001)(5660300002)(316002)(66946007)(33656002)(2906002)(8936002)(426003)(66556008)(4326008)(66476007)(478600001)(86362001)(9746002)(4744005)(186003)(8676002)(1076003)(38100700001)(9786002)(21314003)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZTR3RE96MmFocTBjcVR5c2pLN3VtVXhwZ2VTQ3lOQ2xwVUFuTDRCakdtNEFq?=
 =?utf-8?B?SlFTQjYwRDVhYmhKcEFxdlZvOXUvd1VtVEY0NlJsRG5OYXZSTG8rQURub1p0?=
 =?utf-8?B?NGJkcUgyL1o0eXVzV0JzTlBwWEdSdVFEV1NkVHA3eHpZUnltOFgvL2RzWksz?=
 =?utf-8?B?MUI3dkVzaHpLL1ZPUXg2b0c2L1Q4ejdYb2kyZWQ2Z0hpKytBN2xWNkN6U21V?=
 =?utf-8?B?ZUJaYUNNYm9BejdhakpwZ0J2TGI0eVMwblRZd0sxRmoyZlpOMFByY3VNbjhk?=
 =?utf-8?B?Y0RJeTZXc0tQQWdQcGhNQTN6NFNHSmlZeU9kRU5EVkNudzhQVEhOd0l3aUd5?=
 =?utf-8?B?a0EvYlIvWlpkSjRMSlBkV3VJNXVwZ3hremkyWE9HTFpOQldDenN6dmNnRCtJ?=
 =?utf-8?B?bi9XN2dua1Z2bGJaWTF0ZC9naVk2cmV1NXpSeHpSZEhSOWJDd2tDdXZ1bjRv?=
 =?utf-8?B?TVZOa1V4N1hlYkxmTXlLWE80NXZrMGlnajJ2WjNVZXdtbzJzZldqQ1FRdDFL?=
 =?utf-8?B?MmN1UGZkaExuYUZZTDhSL2xBa004blNGMzZNcktuV2wvUXNvc0NvMXVtQ1dU?=
 =?utf-8?B?dDY1Z1laMktaSm8yWEZpOTVHZTV3MW1jQXN3Z2dCeDNtOFRmelM5bDdLaVg3?=
 =?utf-8?B?Q2ZJSmhRZUoyeWhKeHFwUmR0c213Qm1NaTdMYm5CZjlCREwzMHc1TTVCUnE2?=
 =?utf-8?B?dGltczZBNzRtSzJPeW5meVVQSFM1VkwySWlYZlM0ZHM5azlxVDFzSU4zK3Zh?=
 =?utf-8?B?YnlIWnRnZ2lMT3Y1S0RXRHR1U0Z2RWpXRjBBdXQyWDJOaUMySm0yaTRxMFpB?=
 =?utf-8?B?bTVXcUJQSDV4NnJucTNwdkFMQmNMeDhqVWx6M3RnWWhyTmptVFIyTTZybUVm?=
 =?utf-8?B?NlM5aWtxdU44NFNHQ3ZwZndWWmxuUzI4UUNWTFA2VGpVd2hOL0xwMU5QeHpm?=
 =?utf-8?B?UU5OZjFCV25nbUpUcVNKMkVuQ0VUSVN5NXVMa2IvY3lxcFpwNG1NSW1Dc2pK?=
 =?utf-8?B?ZDRQMWJ2clJWcFgyQS9BTVl0YWY2Y0hPdFZWbXByaFBWUUpwVjlxbHhiV3RZ?=
 =?utf-8?B?YVFzRmpuRTJBLzZXT3pidmd1UVd4aTlidUZNTDMvWWxHVnVGNVYwZGxrZjVQ?=
 =?utf-8?B?VTR6QXRJdFVQSkgzcHdHWUd6cEp0ZzY4dTY5dmRUa1VqOTROSXJpbVdDRmF0?=
 =?utf-8?B?Y0tCZzg3UzNpVDZPTXk2MVdBU2dtUUxaU0trQnRCMk04bE5GcUxHTFFWb1RN?=
 =?utf-8?B?d1N5U3dmS2FhV3VXNHVXSW4rU01hWnpIOHBkMUhPVlYrSVNRVXRMcGdweTA1?=
 =?utf-8?B?aHpBd2Q4eElBWUIxRUVVUFl4dFAxSnY4Qlc0MGFLT3RITFd3clM3RjZXMWxx?=
 =?utf-8?B?WE13SVNDcFRTWVFqUE5TOWViajQ5UGxGUXBzV2tFSkE0RnlNWWpSL2NOSTFi?=
 =?utf-8?B?UDl3RUFWbWYwQUNUb29IdXJYTFBEbkZDaGJBdnE0Zk9qdlE3aEZ6Q3Y0UnU2?=
 =?utf-8?B?N3krWlRZbEtISXltaDlNN0VGNDZRQmZGZHdGMkpuNnJvcUx2REQwWXM4U29w?=
 =?utf-8?B?WWJMMzA2VkV3aFNmekdxai9LQVZueVZ3dFdGZ2tWOXFVMENhRGh2L3NwOE9q?=
 =?utf-8?B?YW1kYlhRS1l3UG9nUzBWeENFbXNvWktFbE9FczlmZlZjb1lSTU5VcVJPMlBw?=
 =?utf-8?B?ckhXY09ENWMvQUVrYVN0elZkKzhhbzZxY0Y2dGI3Uy84bThtZW9MWkt1YzVw?=
 =?utf-8?Q?M/MpkxTLgw9YlydE40DeXoUwtNFvg+GJAn+0NeQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed7bdc52-6ba2-4c12-d777-08d8ee02e034
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 13:52:19.4658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnsXDHh+Z/58XHtuAwqzYQkOwXLaB8tCx/8SbPkxFRoAIYhsaxgEZLxMu7+ZR66T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4011
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

T24gU3VuLCBNYXIgMjEsIDIwMjEgYXQgMDc6NDU6MjhQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKPiBkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwo+IGlu
ZGV4IGU0MDU3OTYyNGYxMC4uMWI2YTEyN2YwYmRkIDEwMDY0NAo+ICsrKyBiL21tL2d1cC5jCj4g
QEAgLTE5OTMsNiArMTk5MywxNyBAQCBzdGF0aWMgdm9pZCBfX21heWJlX3VudXNlZCB1bmRvX2Rl
dl9wYWdlbWFwKGludCAqbnIsIGludCBucl9zdGFydCwKPiAgfQo+ICAKPiAgI2lmZGVmIENPTkZJ
R19BUkNIX0hBU19QVEVfU1BFQ0lBTAo+ICsvKgo+ICsgKiBJZiB3ZSBjYW4ndCBkZXRlcm1pbmUg
d2hldGhlciBvciBub3QgYSBwdGUgaXMgc3BlY2lhbCwgdGhlbiBmYWlsIGltbWVkaWF0ZWx5Cj4g
KyAqIGZvciBwdGVzLiBOb3RlLCB3ZSBjYW4gc3RpbGwgcGluIEh1Z2VUTEIgYXMgaXQgaXMgZ3Vh
cmFudGVlZCBub3QgdG8gYmUKPiArICogc3BlY2lhbC4gRm9yIFRIUCwgc3BlY2lhbCBodWdlIGVu
dHJpZXMgYXJlIGluZGljYXRlZCBieSB4eHhfZGV2bWFwKCkKPiArICogcmV0dXJuaW5nIHRydWUs
IGJ1dCBhIGNvcnJlc3BvbmRpbmcgY2FsbCB0byBnZXRfZGV2X3BhZ2VtYXAoKSB3aWxsCj4gKyAq
IHJldHVybiBOVUxMLgo+ICsgKgo+ICsgKiBGb3IgYSBmdXRleCB0byBiZSBwbGFjZWQgb24gYSBU
SFAgdGFpbCBwYWdlLCBnZXRfZnV0ZXhfa2V5IHJlcXVpcmVzIGEKPiArICogZ2V0X3VzZXJfcGFn
ZXNfZmFzdF9vbmx5IGltcGxlbWVudGF0aW9uIHRoYXQgY2FuIHBpbiBwYWdlcy4gVGh1cyBpdCdz
IHN0aWxsCj4gKyAqIHVzZWZ1bCB0byBoYXZlIGd1cF9odWdlX3BtZCBldmVuIGlmIHdlIGNhbid0
IG9wZXJhdGUgb24gcHRlcy4KPiArICovCgpXaHkgbW92ZSB0aGlzIGNvbW1lbnQ/IEkgdGhpbmsg
aXQgd2FzIGNvcnJlY3Qgd2hlcmUgaXQgd2FzCgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
