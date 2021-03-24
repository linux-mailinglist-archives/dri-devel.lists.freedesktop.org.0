Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0843478B2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 13:41:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9BD6E9F8;
	Wed, 24 Mar 2021 12:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2066.outbound.protection.outlook.com [40.107.93.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4EF6E9F7
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 12:41:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htdhG4uATKHDDW/jtIeXMvlmEZAXAwJ2tKsaGyLmAJ5Xv+gBER0OipqUephIhHTE3YM4d5BZoZMhVJBc/aqh2qzFOmL290x3/8K1khFNBJxYqjjfEbd47pwPwHXWlfbrmfhvU9bbqKD3+fXM0jzEG+zvpIieaIZzXCieG88EIllYanT1TKs7ct50Ud9j2OAQBioxduShOzCM+wr94e9cY97GX58UhD4M+Q5wVegJdL7gdZfph4ePyA1K2m2I3y9Vl3h4rX5LV6kOgP1Bichhz8qsBeeJpKT57tVRLUVceJOTRUek2o7snItbGs7dSbe4tTicZSdTL1n4v57pduvRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5INHl2RJYxVIGDP3kvmCBFXXvWJQ2G6Z/KAhlVpFQ/c=;
 b=Gj/tWMq3/heYCeYLgbJRp+2cFdIN+5e4rnWYymaMEGaWsUU5HO5b1TCwQKAD/3v0dGmeAtaRHYbq6NGw6sqElRzKkt3yLokwj7Lp/A3gjFoRi/d9PpM1giXI+Ql4ueaizD52BZH4vg9VuSxrYA4r97SoWFxlgjABiYpEE8vH8LHyCavSfVAHJzCZSLjvzS/MWy+EPtnc0FJkbb7Gq/HLTZe34ZB3pF9Cra5BD8zjBXg2vRjZywJS1/Tx0ybsUWAt9NATu1hpTeLmOdiSiKKUXkuIruZABqJTfTvY8aS0xETbvyCTGnOoWzp2fubJex36c0yXwYVyOBc06R2YMT/vzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5INHl2RJYxVIGDP3kvmCBFXXvWJQ2G6Z/KAhlVpFQ/c=;
 b=oGLs4lzL2HDrOZ+7Hums+x2hp9xpSsmmoRKTHqs6TtXrEhZViO6apg9t9B7+vZcDpodt0LBMLi521s7qdUG8N34apMVJDAg6nAjilQ2CBmtZDpkHbqmgbQFdf8eQN/hNFfB8pgkHpZy56rpfExym+WwKyw7/hqoWPyRyqmyBQblqZldObXFBrn2yDs39/yBdnGeKry0AOJtYsECHFoCwVvWHkgP0TdnDn4vOOD58rUa+tB2xbx4aUx9Po3l00VNmwRx9cfQJxE/JLp9Fy1621hZ+32a/PYkO2NXF8i4iFFHtftroAxjs0fo/oZgFSKrBQ5bqCP0dmNvVpVxbcaVvPA==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4267.namprd12.prod.outlook.com (2603:10b6:5:21e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 12:41:29 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 12:41:29 +0000
Date: Wed, 24 Mar 2021 09:41:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210324124127.GY2356281@nvidia.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <YFnST5VLcEgv9q+s@phenom.ffwll.local>
 <314fc020-d243-dbf0-acb3-ecfcc9c2443c@shipmail.org>
 <20210323163715.GJ2356281@nvidia.com>
 <5824b731-ca6a-92fd-e314-d986b6a7b101@shipmail.org>
 <YFsM23t2niJwhpM/@phenom.ffwll.local>
 <20210324122430.GW2356281@nvidia.com>
 <e12e2c49-afaf-dbac-b18c-272c93c83e06@shipmail.org>
Content-Disposition: inline
In-Reply-To: <e12e2c49-afaf-dbac-b18c-272c93c83e06@shipmail.org>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::36) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Wed, 24 Mar 2021 12:41:28 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lP2pD-001zGl-9p; Wed, 24 Mar 2021 09:41:27 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e55da04-7835-4537-1711-08d8eec2253c
X-MS-TrafficTypeDiagnostic: DM6PR12MB4267:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4267A03B54DA313A7BBCF89BC2639@DM6PR12MB4267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XogPg7Lu2VSrsZt0HMgpcqv189oMgpOW0BPXTSG9nZYnJiae0MS6cE7aLvNm1gxU5S4+1+IrZnjDvg1UUBlNXkwGFJtdHZ8cdOS4+EZVMzKkdpd8sWxbvun0T/0TTN3mcZjA+UFW/dBp3wnVC7WKNm2lD2jep+S99rC4o2MhZHvm7uBLjc/yf4qIRj/3+WH72eAYPpAgUQGhY1ifIQOmIA0Tm2xK1ByTkQmMdddN8ksBNqX4P8Wu8sfBVvb1vD7cd2avg7RZKOxsxYBTV9PXK5dTjD8t45IYknewJsHz/dURS2Xa3Xhig/4vGY1xagWYlgUldX4R3k4U31QNSqffvVb14k7UmvPzAcoX83AzbmVTdZCpj1ODL+5M/fMaNXia49+cfFA/Dew9vTd7lamN+YYxO/flo3jvbe8/+jznCix+PHRvtDCcbGyq5vMcy6+WxWRC3T/JhEmJfMUxQwaG03jYvhHbop6ysulf65Hkf0Gv35CibF1/Q8z9m1yGHv78KdlNw5taCesf6OGhl2XZdghLExV6zN8cdqt7b+pXmyOp93in0YRTHg0wYbjzslXw61dZadNYeBNSCc31aQ2DpzQ8eLMst+lRAkxuQVDyzkM88BTQ9YBD/kxTuvJxTh9biKkWlBMqjrWvmnMSQLvB9U3ropL4J47j3KCHdW8YL+dfAYInYjEeFas24ggWCs8f2FVEjVLGflJgK/6INm5+iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(66946007)(1076003)(6916009)(5660300002)(186003)(66476007)(66556008)(2906002)(2616005)(83380400001)(86362001)(426003)(316002)(53546011)(9786002)(8936002)(8676002)(478600001)(33656002)(4326008)(26005)(9746002)(66574015)(54906003)(36756003)(38100700001)(14583001)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SVFSdHVIc0tHWFJqZ3FSbjdIQyt0QWtiQTkwRkFYdTlWRE5IM2JLdUlUSlg2?=
 =?utf-8?B?V3NpTzhtQXE1cTBhNUJIdUxaUU5RSTZVY1lTZ3U1YUN4eU94M2RETVJZME1O?=
 =?utf-8?B?eksvQmVUTWNHZWx2bldOQzVtbHFKVWJQb1k1UUhJdTFMYkYyM1k4SlJrVGJ2?=
 =?utf-8?B?WlU5QlJkNlpzTE9WNzB2Wlk2bjBUdzRiWEt2RktiZkxLWlNrb3hxa1NKWVU1?=
 =?utf-8?B?Y0xhNHFTOXYrM0JSV3FJbHRDQkk5RDB6amEzQ0N4a1Y2ZkZhNlhGV2JXYjda?=
 =?utf-8?B?YTRkUjl6R2ZYSW1TbDhyMFAvSTFOZXRicU5iWmRwQ0Vvc2VGWFFZNm1nQTRK?=
 =?utf-8?B?VEFLZzNBZW9RZ2hXMmZ5aHYzZkZHMlRBT2dFOXhmc1NjQXB6UUFCdzZlSU5t?=
 =?utf-8?B?aFRveS8va3I3U2h0SnAweEo1Zmx3NitadXo2YUV1aVkwTlBuZGg3eUc2ZjRo?=
 =?utf-8?B?UGRvdzEySDI2c0FrcmhlZGtLMzlNMFR3dWgzazh6QnhaS1h6c3phR0daOHpM?=
 =?utf-8?B?WjJjM1g3cTIxTVFaaHhZbitwL253VllvUkQyV0dVQlhvRnRFaDJiZU9zVlJx?=
 =?utf-8?B?MGk4bTlvUDRxWFZxTzBCSmNhZWdDUFkxY2dPWFpCVDdiMEY3MFBJYVFTNEl4?=
 =?utf-8?B?MHdHMU4wNEprdDBBMXMybTl3WlFONjdTS0RmK05yRHNkZ1U2NklyQm8wbDB3?=
 =?utf-8?B?Ni9oaDZlNzRvN0F4UGRNaDRUNHNxU29KSmlieFhaZmtzWE1VZ0VQeFRVZ3JO?=
 =?utf-8?B?b1VEeWRJY1dDdG5zUlBiYnUvb3lDUWpvaFI0UWVoZ0ppMncyei9pYTI2eC8z?=
 =?utf-8?B?dUw3cGtROUpLNzhieTNiQktycDBMNDdGb2FtTTBlMVRtVHFpNDlTekpKUVYv?=
 =?utf-8?B?dVJXcUN3RXlqTnNYZDlDQUZ0RitZSDlaRElXaFh6R3k0SmZmaXdJR2dadmxx?=
 =?utf-8?B?T1pJWktwVUZERXV5cWF4eWlldzJwL0NrQmxSd2xhYVJZQm94TVNIU2FzL1dr?=
 =?utf-8?B?a1NkTWk5ZEtJQ1RLTm9OS1pOTmh2T3ZUUlhmZTRkRWdGTDVpSjQzOFluOS9u?=
 =?utf-8?B?a3ZDVFlxZHNrMHZBclNZUDFFWk5QenhDZlBVbEVFaGo1a2lpL0VVdEk5UWsy?=
 =?utf-8?B?dGVtL2dDbzliVkdvSDZ2cjBId3lmMU5na2Qyc0RMMnlxRUpMVXMzWXhTR2N6?=
 =?utf-8?B?VHdySVRPWTlTZHo3WlBjZm9ZQ3lsalBnL015b045cVpmWlBLRE5VUXVSbXFV?=
 =?utf-8?B?c2VrSVhOVklXUlA1L1ptNmcvR0xFMlpCOUczZTNqSGJFa2REYzNiZVdhQzR5?=
 =?utf-8?B?TTJ5azVxRFpoQ2gxN2EwS045b0lqZDNWQWlueThOWXlpMzdLSWNDZTZPSy9j?=
 =?utf-8?B?ckltWndWNG40U0ViWnk4UjNncGUvN2NyZDEyalRkRFlUai85cFVpUmNsYU8w?=
 =?utf-8?B?cDRjcEl5cjJWSisvY3A4b1VBQktvVHoxaHYzWGdhR1RFMy82QWFOWlpIL3Iv?=
 =?utf-8?B?bCt5Mk5WQnNtSnIyUU1HRis4NVZ5VEsxd1hNbnRMT2RSRVNsQXFMT3JDUkc0?=
 =?utf-8?B?TDVCclpSZDZ4ZnVaVWpyWUtxdGhWMFpnZEJXOUd6SWRDWUc5ZVVFQitGYjdt?=
 =?utf-8?B?YWI3dnF5QlV0clAvTEh6T3NNM21xVEpySk1vbG5ENjE0TU5RamM1cGdhVldy?=
 =?utf-8?B?Q3pLV2d4UzVlKzBzSitpcm5qc3pUbllRdnkwaVJsamZLd2lxTmFjelhzQ2dq?=
 =?utf-8?Q?bS0YEGgKpxLZ0zqUuAFhGTJAvgugnPe8z5nOw1z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e55da04-7835-4537-1711-08d8eec2253c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:41:28.9975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f4Ar3aV7kUsLC25Af5jw2GdJoi5HYzjnShwzQ/jNNHms5+UgWKYSrhZNP5+R/agg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4267
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

T24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgMDE6MzU6MTdQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKPiAKPiBPbiAzLzI0LzIxIDE6MjQgUE0sIEphc29uIEd1bnRob3Jw
ZSB3cm90ZToKPiA+IE9uIFdlZCwgTWFyIDI0LCAyMDIxIGF0IDEwOjU2OjQzQU0gKzAxMDAsIERh
bmllbCBWZXR0ZXIgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgTWFyIDIzLCAyMDIxIGF0IDA2OjA2OjUz
UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4gPiA+ID4gT24gMy8y
My8yMSA1OjM3IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gPiA+ID4gPiBPbiBUdWUsIE1h
ciAyMywgMjAyMSBhdCAwNTozNDo1MVBNICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwp
IHdyb3RlOgo+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiBAQCAtMjEwLDYgKzIxMSwyMCBAQCBz
dGF0aWMgdm1fZmF1bHRfdCB0dG1fYm9fdm1faW5zZXJ0X2h1Z2Uoc3RydWN0IHZtX2ZhdWx0ICp2
bWYsCj4gPiA+ID4gPiA+ID4gPiAgICAgCWlmICgocGZuICYgKGZhdWx0X3BhZ2Vfc2l6ZSAtIDEp
KSAhPSAwKQo+ID4gPiA+ID4gPiA+ID4gICAgIAkJZ290byBvdXRfZmFsbGJhY2s7Cj4gPiA+ID4g
PiA+ID4gPiArCS8qCj4gPiA+ID4gPiA+ID4gPiArCSAqIEh1Z2UgZW50cmllcyBtdXN0IGJlIHNw
ZWNpYWwsIHRoYXQgaXMgbWFya2luZyB0aGVtIGFzIGRldm1hcAo+ID4gPiA+ID4gPiA+ID4gKwkg
KiB3aXRoIG5vIGJhY2tpbmcgZGV2aWNlIG1hcCByYW5nZS4gSWYgdGhlcmUgaXMgYSBiYWNraW5n
Cj4gPiA+ID4gPiA+ID4gPiArCSAqIHJhbmdlLCBEb24ndCBpbnNlcnQgYSBodWdlIGVudHJ5Lgo+
ID4gPiA+ID4gPiA+ID4gKwkgKiBJZiB0aGlzIGNoZWNrIHR1cm5zIG91dCB0byBiZSB0b28gbXVj
aCBvZiBhIHBlcmZvcm1hbmNlIGhpdCwKPiA+ID4gPiA+ID4gPiA+ICsJICogd2UgY2FuIGluc3Rl
YWQgaGF2ZSBkcml2ZXJzIGluZGljYXRlIHdoZXRoZXIgdGhleSBtYXkgaGF2ZQo+ID4gPiA+ID4g
PiA+ID4gKwkgKiBiYWNraW5nIGRldmljZSBtYXAgcmFuZ2VzIGFuZCBpZiBub3QsIHNraXAgdGhp
cyBsb29rdXAuCj4gPiA+ID4gPiA+ID4gPiArCSAqLwo+ID4gPiA+ID4gPiA+IEkgdGhpbmsgd2Ug
Y2FuIGRvIHRoaXMgc3RhdGljYWxseToKPiA+ID4gPiA+ID4gPiAtIGlmIGl0J3Mgc3lzdGVtIG1l
bW9yeSB3ZSBrbm93IHRoZXJlJ3Mgbm8gZGV2bWFwIGZvciBpdCwgYW5kIHdlIGRvIHRoZQo+ID4g
PiA+ID4gPiA+ICAgICAgdHJpY2sgdG8gYmxvY2sgZ3VwX2Zhc3QKPiA+ID4gPiA+ID4gWWVzLCB0
aGF0IHNob3VsZCB3b3JrLgo+ID4gPiA+ID4gPiA+IC0gaWYgaXQncyBpb21lbSwgd2Uga25vdyBn
dXBfZmFzdCB3b250IHdvcmsgYW55d2F5IGlmIGRvbid0IHNldCBQRk5fREVWLAo+ID4gPiA+ID4g
PiA+ICAgICAgc28gbWlnaHQgYXMgd2VsbCBub3QgZG8gdGhhdAo+ID4gPiA+ID4gPiBJIHRoaW5r
IGd1cF9mYXN0IHdpbGwgdW5mb3J0dW5hdGVseSBtaXN0YWtlIGEgaHVnZSBpb21lbSBwYWdlIGZv
ciBhbgo+ID4gPiA+ID4gPiBvcmRpbmFyeSBwYWdlIGFuZCB0cnkgdG8gYWNjZXNzIGEgbm9uLWV4
aXN0YW50IHN0cnVjdCBwYWdlIGZvciBpdCwgdW5sZXNzIHdlCj4gPiA+ID4gPiA+IGRvIHRoZSBk
ZXZtYXAgdHJpY2suCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBBbmQgdGhlIGxvb2t1cCB3b3Vs
ZCB0aGVuIGJlIGZvciB0aGUgcmFyZSBjYXNlIHdoZXJlIGEgZHJpdmVyIHdvdWxkIGhhdmUKPiA+
ID4gPiA+ID4gYWxyZWFkeSByZWdpc3RlcmVkIGEgZGV2X3BhZ2VtYXAgZm9yIGFuIGlvbWVtIGFy
ZWEgd2hpY2ggbWF5IGFsc28gYmUgbWFwcGVkCj4gPiA+ID4gPiA+IHRocm91Z2ggVFRNIChsaWtl
IHRoZSBwYXRjaCBmcm9tIEZlbGl4IGEgY291cGxlIG9mIHdlZWtzIGFnbykuIElmIGEgZHJpdmVy
Cj4gPiA+ID4gPiA+IGNhbiBwcm9taXNlIG5vdCB0byBkbyB0aGF0LCB0aGVuIHdlIGNhbiBzYWZl
bHkgcmVtb3ZlIHRoZSBsb29rdXAuCj4gPiA+ID4gPiBJc24ndCB0aGUgZGV2bWFwIFBURSBmbGFn
IGFyY2ggb3B0aW9uYWw/IERvZXMgdGhpcyBmYWxsIGJhY2sgdG8gbm90Cj4gPiA+ID4gPiB1c2lu
ZyBodWdlIHBhZ2VzIG9uIGFyY2hlcyB0aGF0IGRvbid0IHN1cHBvcnQgaXQ/Cj4gPiA+ID4gR29v
ZCBwb2ludC4gTm8sIGN1cnJlbnRseSBpdCdzIG9ubHkgY29uZGl0aW9uZWQgb24gdHJhbnNodWdl
IHBhZ2Ugc3VwcG9ydC4KPiA+ID4gPiBOZWVkIHRvIGNvbmRpdGlvbiBpdCBvbiBhbHNvIGRldm1h
cCBzdXBwb3J0Lgo+ID4gPiA+IAo+ID4gPiA+ID4gQWxzbywgSSBmZWVsIGxpa2UgdGhpcyBjb2Rl
IHRvIGluc3RhbGwgInB0ZV9zcGVjaWFsIiBodWdlIHBhZ2VzIGRvZXMKPiA+ID4gPiA+IG5vdCBi
ZWxvbmcgaW4gdGhlIGRybSBzdWJzeXN0ZW0uLgo+ID4gPiA+IEkgY291bGQgYWRkIGhlbHBlcnMg
aW4gaHVnZV9tZW1vcnkuYzoKPiA+ID4gPiAKPiA+ID4gPiB2bWZfaW5zZXJ0X3Bmbl9wbWRfcHJv
dF9zcGVjaWFsKCkgYW5kCj4gPiA+ID4gdm1mX2luc2VydF9wZm5fcHVkX3Byb3Rfc3BlY2lhbCgp
Cj4gPiA+IFRoZSBzb21ld2hhdCBhbm5veWluZyB0aGluZyBpcyB0aGF0IHdlJ2QgbmVlZCBhbiBl
cnJvciBjb2RlIHNvIHdlIGZhbGwKPiA+ID4gYmFjayB0byBwdGUgZmF1bHQgaGFuZGxpbmcuIFRo
YXQncyBhdCBsZWFzdCBteSB1bmRlcnN0YW5kaW5nIG9mIGhvdwo+ID4gPiBwdWQvcG1kIGZhdWx0
IGhhbmRsaW5nIHdvcmtzLiBOb3Qgc3VyZSBob3cgYXdrd2FyZCB0aGF0IGlzIGdvaW5nIHRvIGJl
Cj4gPiA+IHdpdGggdGhlIG92ZXJhbGwgZmF1bHQgaGFuZGxpbmcgZmxvdy4KPiA+ID4gCj4gPiA+
IEJ1dCBhc2lkZSBmcm9tIHRoYXQgSSB0aGluayB0aGlzIG1ha2VzIHRvbnMgb2Ygc2Vuc2UuCj4g
PiBXaHkgc2hvdWxkIHRoZSBkcml2ZXIgYmUgc28gc3BlY2lmaWM/Cj4gPiAKPiA+IHZtZl9pbnNl
cnRfcGZuX3JhbmdlX1hYWCgpCj4gPiAKPiA+IEFuZCBpdCB3aWxsIGZpZ3VyZSBvdXQgdGhlIG9w
dGltYWwgd2F5IHRvIGJ1aWxkIHRoZSBwYWdlIHRhYmxlcy4KPiA+IAo+ID4gRHJpdmVyIHNob3Vs
ZCBwcm92aWRlIHRoZSBsYXJnZXN0IHBoeXNpY2FsbHkgY29udGlndW91cyByYW5nZSBpdCBjYW4K
PiAKPiBJIGZpZ3VyZSB0aGF0IHdvdWxkIHByb2JhYmx5IHdvcmssIGJ1dCBzaW5jZSB0aGUgaHVn
ZV9mYXVsdCgpIGludGVyZmFjZSBpcwo+IGFscmVhZHkgcHJvdmlkaW5nIHRoZSBzaXplIG9mIHRo
ZSBmYXVsdCBiYXNlZCBvbiBob3cgdGhlIHBhZ2V0YWJsZSBpcwo+IGN1cnJlbnRseSBwb3B1bGF0
ZWQgSSBmaWd1cmUgdGhhdCB3b3VsZCBoYXZlIHRvIG1vdmUgYSBsb3Qgb2YgdGhhdCBsb2dpYwo+
IGludG8gdGhhdCBoZWxwZXIuLi4KCkJ1dCB3ZSBkb24ndCByZWFsbHkgY2FyZSBhYm91dCB0aGUg
c2l6ZSBvZiB0aGUgZmF1bHQgd2hlbiB3ZSBzdHVmZiB0aGUKcGZucy4KClRoZSBkZXZpY2UgbWln
aHQgdXNlIGl0IHdoZW4gaGFuZGxpbmcgdGhlIGZhdWx0LCBidXQgb25jZSB0aGUgZmF1bHQgaXMK
aGFuZGxlZCB0aGUgZGV2aWNlIGtub3dzIHdoYXQgdGhlIGNvbnRpZ3VvdXMgcGZuIHJhbmdlIGlz
IHRoYXQgaXQgaGFzCmF2YWlsYWJsZSB0byBzdHVmZiBpbnRvIHRoZSBwYWdlIHRhYmxlcywgaXQg
anVzdCB0ZWxscyB0aGUgdm1mX2luc2VydAp3aGF0IGl0IHdhcyBhYmxlIHRvIGNyZWF0ZSwgYW5k
IGl0IGNyZWF0ZXMgdGhlIG5lY2Vzc2FyeSBwYWdlIHRhYmxlCnN0cnVjdHVyZS4KClRoZSBzaXpl
IG9mIHRoZSBob2xlIGluIHRoZSBwYWdlIHRhYmxlIGlzIHJlYWxseSBvbmx5IGFkdmlzb3J5LCB0
aGUKZGV2aWNlIG1heSBub3Qgd2FudCB0byBtYWtlIGEgMk0gb3IgMUcgcGFnZSBlbnRyeSBhbmQg
bWF5IHByZWZlciB0bwpvbmx5IGNyZWF0ZSA0ay4KCkluIGFuIGlkZWFsIHdvcmxkIHRoZSBjcmVh
dGlvbi9kZXN0cnVjdGlvbiBvZiBwYWdlIHRhYmxlIGxldmVscyB3b3VsZApieSBkeW5hbWljIGF0
IHRoaXMgcG9pbnQsIGxpa2UgVEhQLgoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
