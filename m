Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA71B247D5
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 13:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D38D10E4F8;
	Wed, 13 Aug 2025 11:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XvNdBSdF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40C510E4F8;
 Wed, 13 Aug 2025 11:01:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yb8Kfl7/WFbDYrIL7qA5UnhuG9zNBU9qyc647qjKYh+65ohf+7tm2JEtHPceKCVaLLPyuPepWZjp6dLCbZRn/7g3bEpt24N+eQd/ST6y55FyMV7j/c4BxiegY/GTTdjSU9ITH5SRN8SRIXH9TDSoqtAn3gbY9bqrxek2VruHYGoTVJcrRfz9JThJTHmTy27fWH+WH2F91EcMegEihtJEvfWiXlvT8DutjCtoORo+e4HxyMECG4GKL5W2UbXmq+5tkRVdqmuifrfpRuwhOpgtO42HRBm1GHLoA8+L/IRxTX8OXItBevPWKhfCpdOFr5+5LLF156TQKYN2wESoVo6PhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2c7xq+jtjvC9ZkkDnUBnPPlK1u1D3/YoWO7LhuGEw0=;
 b=QdoWRhvIpOYo2TgPde/yeYLj+wQJvpI9AT2LYLy1m89bFSguWSjafVATdEhaK2XnX6vDNCcZQE7jH9YrVjTBFQeg7XjHZXq6PSfavWLEjM5O4iWqbTpkz1ogjHxprr25lzMKH22X3cp4lFUOSP/hQUlYCm0dqV/9F9WDp4c4rkahROcWjlvpia6wOEZg/xnaU5Lz5de2nB+HjtVmAjyLaqn5ZCHN/dI6gWBkTprOSgV/4ytn7cLyPd6OqA9g7UmeLqKULX/6iMYtoOeFAABYhhA/ewH6jItouitJdBNad3upPgno8XRytkeZjR9CcPGAgQq5sTA8x/XveysXhI/Vmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2c7xq+jtjvC9ZkkDnUBnPPlK1u1D3/YoWO7LhuGEw0=;
 b=XvNdBSdFrVReP+acu5BGq3T3lUU2hGdxS3kVSpB8eaKfCpjM1NDTRqp7F9eA7KTzMCEOXzP5p9KFcUVl7I5jvqVgfdad8xzyjj9X6egVluSfkJ0YjdXZLDj/5FXsIczz1osm1aBTJhJ/fvA4xMkPuhhAHhMdnM1SfGW3P0i9FcMcMtaFFh1q21N2NTMxm2KiEWkb3jmK0h3IjhIfL4BAaP5Cf/+qH5j789Tui7xR36j2w/64V4ziRXETwXz8QEye0UsrvNT7RpM3VX6MAQx5bEPdwqp/6F18/s+2C+OMf5UQV6qlChNldaQOahlLD+9JZwo1gA6deDYnG0oOmVQAQg==
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by PH7PR12MB6666.namprd12.prod.outlook.com (2603:10b6:510:1a8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Wed, 13 Aug
 2025 11:01:14 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.20.8989.011; Wed, 13 Aug 2025
 11:01:14 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>, "rongqianfeng@vivo.com"
 <rongqianfeng@vivo.com>, "airlied@redhat.com" <airlied@redhat.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "lyude@redhat.com" <lyude@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Thread-Topic: [PATCH] drm/nouveau/gsp: fix mismatched alloc/free for kvmalloc()
Thread-Index: AQHcCqELdc2s1zLXLUqrcVba5AZl1LRfojOAgADLtYA=
Date: Wed, 13 Aug 2025 11:01:14 +0000
Message-ID: <f9306eb1-2268-4a8d-9c7b-384fb89bae52@nvidia.com>
References: <20250811091910.404659-1-rongqianfeng@vivo.com>
 <4ca70a236502a2359b8ba332919b1fe4f9f09010.camel@nvidia.com>
In-Reply-To: <4ca70a236502a2359b8ba332919b1fe4f9f09010.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6858:EE_|PH7PR12MB6666:EE_
x-ms-office365-filtering-correlation-id: 35531ee3-ad2a-4405-49a5-08ddda58b859
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MUpKdHpoNm9RK0ZSTndJR25Ub1ZkWXNFak9vK2FwNG9LU084UElNd3FyQlVr?=
 =?utf-8?B?VVZVSW1QVk1Qd0pUQitma1F4ZGR2YmhrV2pnU3JFejJtbzhtQ3gzRHFBVFda?=
 =?utf-8?B?MC91YTdPVnpsVzFqalBnVy9kZEI5WThhOTRQTDlDTkRyVUhQVzFZcTNDcHpM?=
 =?utf-8?B?UzAxakhKMVNzSlZXMWhSdnZUaEk1MnBJVGxLL255OXhBM0tBWm9XaG8wL0h2?=
 =?utf-8?B?RGJoQnppSXFwOFJQOW9Hcm5hSC9qaThWa0FwakxFazhJSGNpK2RLTUljbVJs?=
 =?utf-8?B?cjJDUGlYK2wrYnBKakE1bFZGQ1laOWhKbTZ5bTYvR1psZEh5ekV5a3hXTEV5?=
 =?utf-8?B?OTFUbnUyd0dKK0tab0F0b1lCMUJxcEhOb3pUK0IvTWpmQ0tXbWU5K1lLT3JT?=
 =?utf-8?B?VUVQdzl6di9NNktORnZqcXhPSFR6VUxxN203SDZiOVBOSVRhb2ovY2hQaE1h?=
 =?utf-8?B?aEVtYmh6UVh5RnVUMVc4VjdVSVhoU2tPRk5Gak5KU0s1K3FhMFZzQSt3ZWFD?=
 =?utf-8?B?aWVVa3BDQWIyanJ5YVpaSlNyY1E2K2pSSnBlMFdhelRhVkl3SCtWd1E3NHA4?=
 =?utf-8?B?ei9uSk9Bb0pQWUc5SmNhVjYrb1BqSzVhWU9sY1ZLQmI5UkRPVHpPeHFQcWNP?=
 =?utf-8?B?cWRRSmZwZldwNUhFRHc1SnBad0Y2ZUUvaUF4OVJlSHhjMXJ6ZnNUOGlCekd2?=
 =?utf-8?B?ckg5OWVuS2NFVE1qb0RaKzdHTVErbVZxWWwvVFJ3QklTdXpvQ3VmYVpBOWhO?=
 =?utf-8?B?NE9mZWZiQmRvR2UxQ0xnVGlHR1BOcXJvcTEwMGZoc2xjekcwUXE3QTd6UXFI?=
 =?utf-8?B?WVJ5T2FKVHRTUTQ1UldlZldvM25BcmRxakNWamR0TEZzTjJIcnF4bGRuNVJE?=
 =?utf-8?B?YnRoYkhMQTJ3Nk1vbkZWaktPdXVMRGhIL2dSQ2JSdVY5ZENSaVF5dGRRTE9m?=
 =?utf-8?B?ZmdMWjJ6WjJMcUF0aXZabG5hdFVjdU9KYy9HckxOTEt4anUzWFFtUEhBSkZL?=
 =?utf-8?B?K0FQdjNEZ3ppZ0QzZml1MEcwTFl5SmtiMDEzdGFtRXdPYjFCeGpFKzEwRXAx?=
 =?utf-8?B?LzZKTFhXc2kvanNRTTNoUEZjdUFUMTBSUlNGMDJPbkNjN1JucDhtN1d2MnMz?=
 =?utf-8?B?NlZmTDVqTDBtOHBFWjVkZTZEdVY0TXRZTFV4SktuY0FvdEYzOFZsQ3JFMy9I?=
 =?utf-8?B?UXV4MUN4eFB2TTZHR1Q5SVZFOWhwOFhJY1hDYllhSE1kaGFSWE9VUXlEcGtm?=
 =?utf-8?B?WVJabVZsNFNZNVVidXVXMEVKUWNxb0RBVzNyMXJwc2plK3VVdUJDSEs0dGlH?=
 =?utf-8?B?YloxN3JqY2UvS3Y0a0hpaU9BL1JQd1UyVHczZlJIOGZkdktWT3hpMURwWm9Z?=
 =?utf-8?B?UUpOQitVbnVuWWR0WWdjQVczVmRzdDcyTzNBck10OVp4OWFYdHVKOHJscjNi?=
 =?utf-8?B?MjlDclkrbG1uWFB1cGovdzJQUk9WKzhvMDlMUllDcUQ4aXRlRmsyZE00dzdM?=
 =?utf-8?B?ZzFFVEc3VEg2YWordFRScjlQMDlCYUpNWGVzallmVTNPVUtxVWw2WEU5OFgx?=
 =?utf-8?B?TmcrZUlpMUY2QXJiMHVMR0U3d1BLTUt3UTUzYTV6dmkzOXlKZU1CRmJlcy9U?=
 =?utf-8?B?MUtVbHlOcENxV1NpeGFMZzgwNElSL3BocmI1bko3WjRxV085VXZQVlV1eVpm?=
 =?utf-8?B?WExkQlNkdCtiM3YyTnAzQThaNDVwNHNDM2ltQk9tcFNqVG5uTmpGMS9keUFR?=
 =?utf-8?B?aTRaSW9qak5iUnpDbUtjNEVQWlR6MFg5eHdaUHIxcHVudzZNTUdya21BNGpO?=
 =?utf-8?B?U21PMzcrazc4VFNwT3ppcUdzcTEzekZxOFRHWU1rV1FKUUUwMVFVa1ptU0Uz?=
 =?utf-8?B?UjZISTloYjBPb3NqamRzbUtwUlA2ZXdZMkdaRzNLbnBMY05OamorU0Y1bDg5?=
 =?utf-8?B?RlNLcGJsaGFQMG50S2VOcmxHNmwyOFlMOGhxeWZ0TXhmSi8wRHNsVmlmb3ha?=
 =?utf-8?Q?MLDrYXK81wui0nE62qD4+tlFQvxJCM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6858.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V0wxckp0cEl5eVJiTVdUWmpaSmpWOFRESVh3UzdwMm1hRGZIL1pTMHBHVzY3?=
 =?utf-8?B?TWlTQVNZd0pBL0wzbjF3UDZWQlAzZ25KQkttaVJyaDZmODU3L1B4UWNHTGVl?=
 =?utf-8?B?SEFTRVRQV1IzN3FaMHYyMFFWeDVSRTJDVEZ2NE1wdTdWWENicHErTndZRjd0?=
 =?utf-8?B?aWZwY1VuclRkNmVIOUQ5aVJ2SDkyNkYxWjQvNkp4a0w1c2ZmK2VxUy92R0lx?=
 =?utf-8?B?VzlveWxTSTg3MDhvdGdPaGwwU2owRW5YdVVrTmJpUGFadDBwU3RnR25lN3gr?=
 =?utf-8?B?T0tnbzcyOXdReDJydmI4TEM2cHFKV3JKOG41cUFOWGsxVldsWmhodVJLVzZn?=
 =?utf-8?B?QnNHYTVCTml0aTA5NVlrWUEzZWlZM2N0NHRtLzZ2VjZ4VkZCdTZaRVJaTzJD?=
 =?utf-8?B?SmkreGVXSFd5NnM1NytRNUFtRUR4d2tza1FRWC90UGlKQm1IbFo3Y3ExS2Y2?=
 =?utf-8?B?WFlXRU9PYVdrdFUrZm5na3RWT2xPNUw0dlIyNnBIcDFTWCtzd01qRUMrRkxi?=
 =?utf-8?B?blNQa3pDVkxZZ0tPYTJNY2poWjVsdU1icWMxSEtnV3R4bTVDc1pscTNyWU9P?=
 =?utf-8?B?azJOM0tTTFFyS1c0UDN3eE5ZSTRuZHYzV1RLTGNkbzNkMzZpcmJ0bWVZVEZl?=
 =?utf-8?B?cUI2MlMxQlZBN0wwdWhqKzZDbVBWT2pQWk16bnZ1eHYyMkZqbDhEOVFnd21r?=
 =?utf-8?B?amU5Q1JRWDZWbGRBVTVCOGRDakdvNDUxMlhKTjBJMUY5aHRLWHZZOFN1ODVK?=
 =?utf-8?B?M01zM3dnS2hjdk9QVjJVd0V4ckZpaDhKd2RqOXVoMGFzNXNiTk8wNGVkdlVX?=
 =?utf-8?B?V3UzTE02OGUyamdmb1pkUEZpMTd6UGxyTkllbWloSjZQaGRkdElhRnRpYzk5?=
 =?utf-8?B?NFdMUGVkWnpNNXlWQ3Y0SzVHai9aMHgyVU04WGJEaUhmcVdLanRyR3ZUZTdQ?=
 =?utf-8?B?TVErM2RJYzBsTWpHTDUrVXJTTmVOcS9xMGQvdmd5V3Zkc1Uwd0I0REhlMnlw?=
 =?utf-8?B?VzJjNFQwWlVoMGdKZW5lbGZWY1ZsMjN4QXY1cWhlaGIyc1U0dE1KZHArc2NY?=
 =?utf-8?B?emdsd0dWdjg4MUJScjN6bGR4M09UV1h4UTRsS3dpT3VrcStRQm5kRFBQT2JI?=
 =?utf-8?B?QW4yWmpySGxkb3FqN1FnRUF3L0FjS1dvYUVZbnlhZS9Bb1oya1piTjdkaHJW?=
 =?utf-8?B?YjVOZ0w2SGUwclBDaWdpR0dycGI3K2o5a3ZJa2czSWJEbklZaXdJZ2JEVVdU?=
 =?utf-8?B?ZG4rK2w0a09QdCtYdHJpRWRtckR3Y1Y4dktiQzY2V0lKY1J2dFl5VVBDNHJ4?=
 =?utf-8?B?NU85cjMzWkFYNThiY0dCUmtneEdldWlZMWJQajZFVXo0azhaUzl2T3lkSnRG?=
 =?utf-8?B?Z0tzNHBnc2xhTUhuazk0L0hOdGJrUVE0SExFakMrR1dTTzc1MHhyMk9VUXl2?=
 =?utf-8?B?MDRzbnM5aG4vcEdiL3RyVlhrRXpnN01GYnhyR2dQayt5bU5ldUNGT2l3dXd1?=
 =?utf-8?B?SWVMU0NGZmUwWm1ITnp6MWNmRVA0UTV6VzRybjdiSVFJOEpVeU50MHdjTkJW?=
 =?utf-8?B?MnVFMzh2TlBXQi9zREtkYnd1UkEyaGdUUkZOZGdMYkExaTNzdUVYSExuemZY?=
 =?utf-8?B?bGE4dHVWUmRuSXppc2V5WDRSV2pXVXd3d2xOTjBDZ3Z6QzdHR1FQbVlKTGZ1?=
 =?utf-8?B?eGRVekZCa2Vyb01Nc3RJSHVQSW5aMDdBenBHSngwSldzb3dSQ0l4ellwTU16?=
 =?utf-8?B?dmZ1WE1xR3lBM3pReFc4Y3VKb0UzcUFTRVJzWDVFQjVPK0c5WmF4Y2dDdkJB?=
 =?utf-8?B?WXpjZEE5WEJuVkRwbmdNOVBSZDR2ekFjUmFPd25oT2tlVEphUEtQM3ZsZ08w?=
 =?utf-8?B?Rm9rckcxRlNiY2ViT0doS3V0dlFRY3pxaVpZYldtYmxZOXllS2pJaHNmTURB?=
 =?utf-8?B?UzdwSFN0L2h2RTkzTERSMzJlTENBbGVaVVF1MTRTTmFPQ3FBYS9ualFSMnJx?=
 =?utf-8?B?NUFpcW11enJKU3hSTElCazFEWmx2eUpyaW51NlpJUUJPM3VqRkFYcTY1REp1?=
 =?utf-8?B?YkV0aTUrL2pSSWZpQmFtUGxaYTNTZHhpUytjTzg4azE3M2lTa3NVZzJzK1pq?=
 =?utf-8?Q?4wlA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25769D3169EFE4479B95B593D4774C31@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6858.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35531ee3-ad2a-4405-49a5-08ddda58b859
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2025 11:01:14.0810 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65jpe+ouZ7RQn9Pwqv0wlwUwwBDRGl0zkJIu3yO4Mzof0gF31bmpNQbK4M8vYuNQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6666
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTMvMDgvMjAyNSAxLjUyLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBPbiBNb24sIDIwMjUtMDgt
MTEgYXQgMTc6MTkgKzA4MDAsIFFpYW5mZW5nIFJvbmcgd3JvdGU6DQo+PiBSZXBsYWNlIGtmcmVl
KCkgd2l0aCBrdmZyZWUoKSBmb3IgbWVtb3J5IGFsbG9jYXRlZCBieSBrdm1hbGxvYygpLg0KPj4N
Cj4+IENvbXBpbGUtdGVzdGVkIG9ubHkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUWlhbmZlbmcg
Um9uZyA8cm9uZ3FpYW5mZW5nQHZpdm8uY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IFRpbXVyIFRh
YmkgPHR0YWJpQG52aWRpYS5jb20+DQo+IA0KPiBUaGlzIGRvZXMgZml4IGEgcmVhbCBidWcuDQo+
IA0KDQpBZ3JlZSB3aXRoIHRoZSBjb2RpbmcgZGV0YWlscy4NCg0KSSBmZWx0IHRoZSBjb3JlIGlz
c3VlIGlzIHRoYXQgR1NQIFJQQyBsaWZlY3ljbGUgbWFuYWdlbWVudCBpbiBOVktNIGlzIA0Kbm90
IGhhbmRsZWQgY2xlYW5seS4gRm9yIGV4YW1wbGUsIHRoZSBjYWxsZXLigJlzIFJQQyBidWZmZXIg
aXMgZnJlZWQgDQpzaWxlbnRseSBpbiB0aGUgcmVjZWl2ZSBwYXRoLCBhbmQgYSBuZXcgYnVmZmVy
IGlzIGFsbG9jYXRlZCBhbmQgcmV0dXJuZWQgDQp3aXRob3V0IGV4cGxpY2l0IGNvb3JkaW5hdGlv
bi4NCg0KSW50cm9kdWNpbmcgbGFyZ2UgR1NQIFJQQ3MgLSBzdWNoIGFzIGZhY3RvcmluZyBvdXQg
DQpyNTM1X2dzcF9tc2dxX3JlY3Zfb25lX2VsZW0oKSAtIG9ubHkgbWFrZXMgdGhpcyBmbGF3IG1v
cmUgYXBwYXJlbnQsIGFuZCANCmV2ZW4gdGhlIHJlZmFjdG9yaW5nIHByb2Nlc3MgaXMgY3VtYmVy
c29tZSBhbmQgdHJpY2t5Lg0KDQpJZGVhbGx5LCB0aGVyZSBzaG91bGQgYmUgYSBjbGVhciBvd25l
cnNoaXAgYW5kIGxpZmVjeWNsZSBmbG93IGJldHdlZW4gDQp0aGUgY2FsbGVyIGFuZCB0aGUgR1NQ
IFJQQyByb3V0aW5lczogdGhlIGNhbGxlciBhbGxvY2F0ZXMgYW5kIGZyZWVzIHRoZSANClJQQyBi
dWZmZXIsIHdoaWxlIHRoZSBsb3ctbGV2ZWwgcm91dGluZXMgZm9jdXMgc29sZWx5IG9uIHNlbmQv
cmVjZWl2ZSANCm9wZXJhdGlvbnMuIHI1MzVfZ3NwX21zZ3FfcmVjdl9vbmVfZWxlbSgpIGlzIGp1
c3Qgb24gaXRzIGhhbGYgd2F5Lg0KDQpaLg0KDQo+IEhvd2V2ZXIsIEkgdGhpbmsgdGhlIHJlYWwg
cHJvYmxlbSBpcyB0aGF0IGl0J3MgcmVhbGx5IGNvbmZ1c2luZyB0aGF0DQo+IHI1MzVfZ3NwX21z
Z3FfcmVjdl9vbmVfZWxlbShnc3AsICZpbmZvKSByZXR1cm5zIGluZm8uZ3NwX3JwY19idWYgaW5z
dGVhZCBvZiBqdXN0IHN1Y2Nlc3MvZmFpbHVyZS4NCj4gcjUzNV9nc3BfbXNncV9yZWN2KCkgZG9l
cyB0aGlzOg0KPiANCj4gCWJ1ZiA9IGt2bWFsbG9jKG1heF90KHUzMiwgcnBjLT5sZW5ndGgsIGV4
cGVjdGVkKSwgR0ZQX0tFUk5FTCk7DQo+IC4uLg0KPiAJaW5mby5nc3BfcnBjX2J1ZiA9IGJ1ZjsN
Cj4gLi4uDQo+IAlidWYgPSByNTM1X2dzcF9tc2dxX3JlY3Zfb25lX2VsZW0oZ3NwLCAmaW5mbyk7
DQo+IA0KPiBZb3Ugd291bGRuJ3Qga25vdyBpdCwgYnV0IHRoaXMgZG9lcyBub3QgY2hhbmdlIHRo
ZSB2YWx1ZSBvZiAnYnVmJyB1bmxlc3MNCj4gcjUzNV9nc3BfbXNncV9yZWN2X29uZV9lbGVtKCkg
ZmFpbHMuICBJZiBpdCBkb2VzIGZhaWwsIHRoZSBjb2RlIGRvZXMgdGhpczoNCj4gDQo+IAlpZiAo
SVNfRVJSKGJ1ZikpIHsNCj4gCQlrdmZyZWUoaW5mby5nc3BfcnBjX2J1Zik7DQo+IA0KPiBJdCB3
b3VsZCBiZSBhIGxvdCBjbGVhcmVyIGlmIHdlIGNvdWxkIGt2ZnJlZShidWYpIGhlcmUsIGJ1dCB3
ZSBjYW4ndCBiZWNhdXNlICdidWYnIG5vIGxvbmdlciBwb2ludHMNCj4gdG8gdGhlIGJ1ZmZlciwg
ZXZlbiB0aG91Z2ggdGhlIGJ1ZmZlciBzdGlsbCBleGlzdHMuDQo+IA0KPiANCg0K
