Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A92234A692
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 12:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A246F3C0;
	Fri, 26 Mar 2021 11:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769536F3C0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 11:47:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZviHwVr2+h3SANgHL5tnBkGxwplpyypJGZ0pppLOsY85W/DUyZAwxLxDJdoIqXcOqPDELPP5bOI+S4ooCGJNyf+vp0F/Epm+uM3Zmo28b3VrYJfM0uUW4Gv4nIavSsycTgJRtGLYbGvySJYXTSUcI2DMtEk0zZD9QmcgzSBg5mprNXhrSqElwWT+Yk5CwEBxx4Oquhp+PJmw13LPofn+bfHnxjWV8djHdA+2DoOuOPPlmw7RFowJytsMK04IRYuh2J6k9WgIDbYVDqc6KZMOFERKk26fYp7uvL+Mw83jvLnigUNI6Pp3vESIHiyMCR5AKMknKoL5P8LyEkR50u97Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIA9n5ndUr4ecicoNpOR1JXY9ze2KTAD5PLBGbY20Q4=;
 b=NhE4MPjL5CW70SvRjeCYCwA3v8dqFE1pviHbX2UucqrP8KZajYTs1UJRrC98J0kTH61r/SnyV6apig3O4+pWw75yQo9G70ryMDvBRSLCDCm7z54ltwpJErU6OwEe4dM8EYBHcu7IaHMxhm/RjNHoy8Kg+saOu76bxYZR6PcSaJhFU+Cf1zL4evjjv6t+fsqe6AkvGfR9+ggkYElmtdFCmelsGXUigWtYeO3jHMJ7biaO/1+c2JHMQV4rTljkqJPuzATaUV8gVa+l6Tzt0290HgjWQSmTbB5RZxxCXUpLKL+3aM+t+q0odtR056/c0gtAiDR6RcvkVRlYcni7uJYTtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIA9n5ndUr4ecicoNpOR1JXY9ze2KTAD5PLBGbY20Q4=;
 b=Oj+Hr9sBOEEFTEWSrhUn67Vp9GaEYxCmu2BESrdX4rSmm316V9u3YwyW0Ufc5nK32BfKWlE5ojfwO5wRmjm00UnwvdP2+Dvnj8drAdWOL4fB0Z3hzITh4BM044kAQ/IHv+Du9sE+LIA5syh2fDI1UEG4jJ0YQFAkojz3NqJARkZ7TTwvvR39YoIkL3P7iHgE72+b5uuBEhLp686X8GuEwr/tpI2HFkJMjhlf3ucAg0JXPsLa3Xgo9uXuHPT3gbUD/vRUXVuA4630RGtnOeHCIidG5lnUtwQuEcEfx/Df8D54vAaeNdEVt0vv3BlWNUmZC9FfrUxsrnPVSW/VRGhBvA==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4617.namprd12.prod.outlook.com (2603:10b6:5:35::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 11:46:57 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.029; Fri, 26 Mar 2021
 11:46:56 +0000
Date: Fri, 26 Mar 2021 08:46:54 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210326114654.GL2356281@nvidia.com>
References: <YFsNRIUYrwVQanVF@phenom.ffwll.local>
 <a1fa7fa2-914b-366d-9902-e5b784e8428c@shipmail.org>
 <75423f64-adef-a2c4-8e7d-2cb814127b18@intel.com>
 <e5199438-9a0d-2801-f9f6-ceb13d7a9c61@shipmail.org>
 <6b0de827-738d-b3c5-fc79-8ca9047bad35@intel.com>
 <9f789d64-940f-c728-8d5e-aab74d562fb6@shipmail.org>
 <20210325175504.GH2356281@nvidia.com>
 <1ed48d99-1cd9-d87b-41dd-4169afc77f70@shipmail.org>
 <20210325182442.GI2356281@nvidia.com>
 <1eda588b-ae51-9b69-4bd4-da37b2aa1e4b@shipmail.org>
Content-Disposition: inline
In-Reply-To: <1eda588b-ae51-9b69-4bd4-da37b2aa1e4b@shipmail.org>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::16) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0137.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Fri, 26 Mar 2021 11:46:55 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lPkvW-003Iyk-CP; Fri, 26 Mar 2021 08:46:54 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34355dca-f3fa-4b74-5c62-08d8f04cdb34
X-MS-TrafficTypeDiagnostic: DM6PR12MB4617:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4617F7C43BCDF9C0C1A1CCD0C2619@DM6PR12MB4617.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VLPwPNFF38NeYMV7HwGYtXmJuY97S77o9BngZymEJuX/zASMO/n9FW4noxGQV+cVhzj94X+p9yRNhr78z/5DidKAXzCaL1JO+g6c7EdaSeb1FMkKDclcKYO5riKUCdm2akp7OYjOMCTSMNFuaq2wkFGgr7DSTu6WufGFzQ/Rn7hGQQ8qcULkKryuxB/0aEpLCmP4E7j0D3PWRAmiaxyzc15aPmWJgj6fy2SY6RlCsZpCd9CnO+e9WyFaAoEzQ3bnQT4Vl2heBrOazPorDU9KFNlgCTKJHEsLHk+in8uaFJIMw+xWSmwBT32XmjopaqiJPTSG8sM40zvDp8W9PEDA5KcuQfmedlU4fpe9U9htqtg42F9XufydyxJYzs48yoD0oPJrZUOXepLLks2UMERyqohplwAZ9ym0ka3uqzIGybJ2RwK11xyr9BbHWETdMSzWNWpjen3Gkbuy/Tm+quk9grlifmn+RUylmBdA/cqctJzID/fv5Fxo/vO5eX4ENHPcMypMTmoJU5nY3iMSvUzqNuAtXcUoJnjDDUTMHSLoczwdrGsisf7l0f/cFgJOK3oBeKpYdkaskbk4K7Uj8Yv3qgbTFTrDUNf6QdEr2E5DWNgZuRWl+2m92s6m8kVQtzuOPPQnJUrO1ogjwtaR18xstLq3dFdCr1eXN0qnIuJdc6KJd2ryPwnWCOoFF9g5ctZd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(366004)(136003)(376002)(9746002)(83380400001)(33656002)(53546011)(186003)(66946007)(4326008)(426003)(6916009)(66556008)(2906002)(26005)(9786002)(5660300002)(8936002)(36756003)(66476007)(316002)(2616005)(54906003)(38100700001)(1076003)(86362001)(8676002)(478600001)(66574015)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Q25qaVZTYVZ3VnFTeExaeUpYU0R2b0RoUmpxS3FacHRZZStPR1gzN2U5VWNE?=
 =?utf-8?B?YS9sQi96VG9lMHpFTGdrUGlBSWdNY01HNHczTW4xSElKSXJWNGNoWENMcUhV?=
 =?utf-8?B?Z0I5U25uWVJnRVViWXFuN0xoL0ltZHZXRTdzZUxmZTFvdTZOQlZubHMxWUpo?=
 =?utf-8?B?OUNkd21RNmplME5DNVBnWS93bUV5NG9Db3NLc284VkxHR3FtYXhUU29RNW9n?=
 =?utf-8?B?MkdNR2tGMkFxZ1lHb0ZaNWEyVjI2M0hERHgxWDlsS0FCd2pmSmdWcUdDZmlK?=
 =?utf-8?B?RG5JQzI3TG8zSVp1MUh6c3Y2WG5wM2c1UDFvMEVjdmxlL1phUmprQnJKSDlr?=
 =?utf-8?B?UjlObDJpeEN6MG80V3VxTGlRc21QY0dvN1JLYkZkZjErK2NrdHdDQnY5S3R2?=
 =?utf-8?B?OTZ3SmVORjZHVVdCeVFxQ1dMYkhuRzJCaE5GZEdoKzUyMTZ6SFd3N1JFU3Vq?=
 =?utf-8?B?Q0lZZUMrRHdWU2FSZzZ3RDNNOExHUXdxMDZ1NGdlYmlBZlJ4M3pLcVdsU3BT?=
 =?utf-8?B?RVN4TTkwRld2b3loTWlBbzNrTEQ5bXhZYVdhcFZuNXROZUxkRmNFRFV6b2Zx?=
 =?utf-8?B?SUdMNE1RSTE2YUlHdlJzTi83RGtNQlhzN0lQQ09zbzllN2EzV2k3aG1acHFF?=
 =?utf-8?B?dmdsMGpOTTkyQU1oM2tzUFluRktwcHkrUjV4ejV0dkgxVWtzSjgyT05waWVm?=
 =?utf-8?B?NVU3WDNnaFRQTDZsQnl2UFJ5dEZpeDd0VFA1M0xIczJZd1Jpem5uZVl0Rk1K?=
 =?utf-8?B?c3J0OWFYRGQvZ2lNNFpYdHVydkJMK1JBT0hIeCtBY3dsRjZjS2xkNjVxeFJ3?=
 =?utf-8?B?TFBSMklqcnNhZStIVUE3cWpYR1p1ZDRwZlV6L0JDTzlOeVJBeWRqN3lQM0hN?=
 =?utf-8?B?Z3lqRXQyTGhBN1VxVUhjUGVYYVZMRTRGNXVvZ0ZkbFA4L2tjSC8yWExHZW1B?=
 =?utf-8?B?SWtQeFhvTkkwcUMrMjFJWUVxSXFRM09SQ3VSN2Y0OVpLdGE3OTRFUDIyenFu?=
 =?utf-8?B?RFhRcDRqTUlqMU9aREtoSUxTNHFtRGp1T2R1VHAzN2pnZHpJYmpGVjd3K0xY?=
 =?utf-8?B?UENFTnVCbkl5UVhwRDZNZ2ZPeGdISGlpSDNMTW55ckI5cVZTa25rWng4UVBE?=
 =?utf-8?B?MjFwT1dTL0FxanhnUFFmMm5FSkF4Z2NlZGE5TDRHRlN1Uy9uZzJQNnN4WExr?=
 =?utf-8?B?dzBOaEJUY2lRTDVxYzRzSWZxYUsvbFZlQkM2S05mUjF3SmloTWhFZVdzZnh5?=
 =?utf-8?B?cHdqMFkzK3VjQng5YnFuanZMM0pYelBZUXJ5WGlkWDdRa2RFZUFUSktXWGJF?=
 =?utf-8?B?WlNoN3Y3eFh3YjRUbElxMmZWZUR3djQwNVFhZ1hnVy9aR3F6Q2pqd1JweUR1?=
 =?utf-8?B?YkViNFBpVEhXMngyS3F2cmFJMHovUHF4RkFXRGhMRFppMmV4YWs4bGtSa3E0?=
 =?utf-8?B?cVA1YUJtYnZXbHZUcG8ydWV3VWR5OXZZaG9MYmpCdFpyNmpTM0RrUjhTQUNy?=
 =?utf-8?B?cnd6NGZMaVVXaFFuQkwyQ2UrRk43ekt6SXJYaHQrbW5lYXBBY0JJS0gzZWNl?=
 =?utf-8?B?cWovdzNaV3BzaUZxQ2phNXdWTXNXeEJCc0tnemxNdFdUSHQzbXJJV0dUY25i?=
 =?utf-8?B?U04zZW4weGZNR3FrcHYza1FzVUJ2cGZRNVcyeitRQkE1dDdUVlY1bDRzWlQ4?=
 =?utf-8?B?cmF4ZU0vMDFEa04wR1NKSE8ycjhkekxYaXVpWW5yVzBpNmpYM0ZVTVhmNzZr?=
 =?utf-8?Q?5LylTFKt49I7gfuepu8mJrbB/47JQ9ChPwoasgq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34355dca-f3fa-4b74-5c62-08d8f04cdb34
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 11:46:56.4254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNCfHu3Hulal1mi9BHWXpnmk2JoM/tW6HoCkQby9gAAE8m1RpON0pey+tDv6UJ7U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4617
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

T24gRnJpLCBNYXIgMjYsIDIwMjEgYXQgMTA6MDg6MDlBTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKPiAKPiBPbiAzLzI1LzIxIDc6MjQgUE0sIEphc29uIEd1bnRob3Jw
ZSB3cm90ZToKPiA+IE9uIFRodSwgTWFyIDI1LCAyMDIxIGF0IDA3OjEzOjMzUE0gKzAxMDAsIFRo
b21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4gPiA+IE9uIDMvMjUvMjEgNjo1NSBQTSwg
SmFzb24gR3VudGhvcnBlIHdyb3RlOgo+ID4gPiA+IE9uIFRodSwgTWFyIDI1LCAyMDIxIGF0IDA2
OjUxOjI2UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4gPiA+ID4g
PiBPbiAzLzI0LzIxIDk6MjUgUE0sIERhdmUgSGFuc2VuIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiAz
LzI0LzIxIDE6MjIgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4gPiA+ID4g
PiA+ID4gPiBXZSBhbHNvIGhhdmUgbm90IGJlZW4gY2FyZWZ1bCBhdCAqYWxsKiBhYm91dCBob3cg
X1BBR0VfQklUX1NPRlRXKiBhcmUKPiA+ID4gPiA+ID4gPiA+IHVzZWQuwqAgSXQncyBxdWl0ZSBw
b3NzaWJsZSB3ZSBjYW4gZW5jb2RlIGFub3RoZXIgdXNlIGV2ZW4gaW4gdGhlCj4gPiA+ID4gPiA+
ID4gPiBleGlzdGluZyBiaXRzLgo+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBQZXJz
b25hbGx5LCBJJ2QganVzdCB0cnk6Cj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+ICNk
ZWZpbmUgX1BBR0VfQklUX1NPRlRXNcKgwqDCoMKgwqDCoMKgIDU3wqDCoMKgwqDCoCAvKiBhdmFp
bGFibGUgZm9yIHByb2dyYW1tZXIgKi8KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IE9L
LCBJJ2xsIGZvbGxvdyB5b3VyIGFkdmlzZSBoZXJlLiBGV0lXIEkgZ3JlcHBlZCBmb3IgU1cxIGFu
ZCBpdCBzZWVtcwo+ID4gPiA+ID4gPiA+IHVzZWQgaW4gYSBzZWxmdGVzdCwgYnV0IG9ubHkgZm9y
IFBURXMgQUZBSUNULgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IE9oLCBhbmQgd2UgZG9u
J3QgY2FyZSBhYm91dCAzMi1iaXQgbXVjaCBhbnltb3JlPwo+ID4gPiA+ID4gPiBPbiB4ODYsIHdl
IGhhdmUgNjQtYml0IFBURXMgd2hlbiBydW5uaW5nIDMyLWJpdCBrZXJuZWxzIGlmIFBBRSBpcwo+
ID4gPiA+ID4gPiBlbmFibGVkLiAgSU9XLCB3ZSBjYW4gaGFuZGxlIHRoZSBtYWpvcml0eSBvZiAz
Mi1iaXQgQ1BVcyBvdXQgdGhlcmUuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBCdXQsIHllYWgs
IHdlIGRvbid0IGNhcmUgYWJvdXQgMzItYml0LiA6KQo+ID4gPiA+ID4gSG1tLAo+ID4gPiA+ID4g
Cj4gPiA+ID4gPiBBY3R1YWxseSBpdCBtYWtlcyBzb21lIHNlbnNlIHRvIHVzZSBTVzEsIHRvIG1h
a2UgaXQgZW5kIHVwIGluIHRoZSBzYW1lIGR3b3JkCj4gPiA+ID4gPiBhcyB0aGUgUFNFIGJpdCwg
YXMgZnJvbSB3aGF0IEkgY2FuIHRlbGwsIHJlYWRpbmcgb2YgYSA2NC1iaXQgcG1kX3Qgb24gMzIt
Yml0Cj4gPiA+ID4gPiBQQUUgaXMgbm90IGF0b21pYywgc28gaW4gdGhlb3J5IGEgaHVnZSBwbWQg
Y291bGQgYmUgbW9kaWZpZWQgd2hpbGUgcmVhZGluZwo+ID4gPiA+ID4gdGhlIHBtZF90IG1ha2lu
ZyB0aGUgZHdvcmRzIGluY29uc2lzdGVudC4uLi4gSG93IGRvZXMgdGhhdCB3b3JrIHdpdGggZmFz
dAo+ID4gPiA+ID4gZ3VwIGFueXdheT8KPiA+ID4gPiBJdCBsb29wcyB0byBnZXQgYW4gYXRvbWlj
IDY0IGJpdCB2YWx1ZSBpZiB0aGUgYXJjaCBjYW4ndCBwcm92aWRlIGFuCj4gPiA+ID4gYXRvbWlj
IDY0IGJpdCBsb2FkCj4gPiA+IEhtbSwgb2ssIEkgc2VlIGEgUkVBRF9PTkNFKCkgaW4gZ3VwX3Bt
ZF9yYW5nZSgpLCBhbmQgdGhlbiB0aGUgcmVzdWx0aW5nIHBtZAo+ID4gPiBpcyBkZXJlZmVyZW5j
ZWQgZWl0aGVyIGluIHRyeV9ncmFiX2NvbXBvdW5kX2hlYWQoKSBvciBfX2d1cF9kZXZpY2VfaHVn
ZSgpLAo+ID4gPiBiZWZvcmUgdGhlIHBtZCBpcyBjb21wYXJlZCB0byB0aGUgdmFsdWUgdGhlIHBv
aW50ZXIgaXMgY3VycmVudGx5IHBvaW50aW5nCj4gPiA+IHRvLiBDb3VsZG4ndCB0aG9zZSBkZXJl
ZmVyZW5jZXMgYmUgb24gaW52YWxpZCBwb2ludGVycz8KPiA+IFVoaGhoaC4uIFRoYXQgZG9lcyBs
b29rIHF1ZXN0aW9uYWJsZSwgeWVzLiBVbmxlc3MgdGhlcmUgaXMgc29tZSB0cmlja3kKPiA+IHJl
YXNvbiB3aHkgYSA2NCBiaXQgcG1kIGVudHJ5IG9uIGEgMzIgYml0IGFyY2ggZWl0aGVyIGNhbid0
IGV4aXN0IG9yCj4gPiBoYXMgYSBzdGFibGUgdXBwZXIgMzIgYml0cy4uCj4gPiAKPiA+IFRoZSBw
dGUgZG9lcyBpdCB3aXRoIHB0ZXBfZ2V0X2xvY2tsZXNzKCksIHdlIHByb2JhYmx5IG5lZWQgdGhl
IHNhbWUKPiA+IGZvciB0aGUgb3RoZXIgbGV2ZWxzIHRvbyBpbnN0ZWFkIG9mIG9wZW4gY29kaW5n
IGEgUkVBRF9PTkNFPwo+ID4gCj4gPiBKYXNvbgo+IAo+IFRCSCwgcHRlcF9nZXRfbG9ja2xlc3Mo
KSBhbHNvIGxvb2tzIGEgYml0IGZpc2h5LiBpdCBzYXlzCj4gIml0IHdpbGwgbm90IHN3aXRjaCB0
byBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IHByZXNlbnQgcGFnZSB3aXRob3V0IGEgVExCCj4gZmx1
c2ggaW4gYmV0d2VlbiIuCj4gCj4gV2hhdCBpZiB0aGUgZm9sbG93aW5nIGhhcHBlbnM6Cj4gCj4g
cHJvY2Vzc29yIDE6IFJlYWRzIGxvd2VyIGR3b3JkIG9mIFBURS4KPiBwcm9jZXNzb3IgMjogWmFw
cyBQVEUuIEdldHMgc3R1Y2sgd2FpdGluZyB0byBkbyBUTEIgZmx1c2gKPiBwcm9jZXNzb3IgMTog
UmVhZHMgdXBwZXIgZHdvcmQgb2YgUFRFLCB3aGljaCBpcyBub3cgemVyby4KPiBwcm9jZXNzb3Ig
MzogSGl0cyBhIFRMQiBtaXNzLCByZWFkcyBhbiB1bnBvcHVsYXRlZCBQVEUgYW5kIGZhdWx0cyBp
biBhIG5ldwo+IFBURSB2YWx1ZSB3aGljaCBoYXBwZW5zIHRvIGJlIHRoZSBzYW1lIGFzIHRoZSBv
cmlnaW5hbCBvbmUgYmVmb3JlIHRoZSB6YXAuCj4gcHJvY2Vzc29yIDE6IFJlYWRzIHRoZSBuZXds
eSBmYXVsdGVkIGluIGxvd2VyIGR3b3JkLCBjb21wYXJlcyB0byB0aGUgb2xkCj4gb25lLCBnaXZl
cyBhbiBPSyBhbmQgcmV0dXJucyBhIGJvZ3VzIFBURS4KClNvIHlvdSBhcmUgc2F5aW5nIHRoYXQg
d2hpbGUgdGhlIHphcCB3aWxsIHdhaXQgZm9yIHRoZSBUTEIgZmx1c2ggdG8KZ2xvYmFsbHkgZmlu
aXNoIG9uY2UgaXQgZ2V0cyBzdGFydGVkIGFueSBvdGhlciBwcm9jZXNzb3IgY2FuIHN0aWxsCndy
aXRlIHRvIHRoZSBwdGU/CgpJIGNhbid0IHRoaW5rIG9mIGFueSBzZXJpYWxpemF0aW9uIHRoYXQg
d291bGQgY2F1c2UgZmF1bHQgdG8gd2FpdCBmb3IKdGhlIHphcC9UTEIgZmx1c2gsIGVzcGVjaWFs
bHkgaWYgdGhlIHphcCBjb21lcyBmcm9tIHRoZSBhZGRyZXNzX3NwYWNlCmFuZCBkb2Vzbid0IGhv
bGQgdGhlIG1tYXAgbG9jay4KClNlZW1zIHdvcnRoIGJyaW5naW5nIHVwIGluIGEgYmlnZ2VyIHRo
cmVhZCwgbWF5YmUgc29tZW9uZSBlbHNlIGtub3dzPwoKSmFzb24KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
