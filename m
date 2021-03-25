Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914343498C4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 18:55:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C1D6EDE1;
	Thu, 25 Mar 2021 17:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C676EDDE
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 17:55:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yi07RyDik0B5V6RM97LE1vrBQT4NgRGtEeZ0+HhpRC9lws+tSGBSmfv4qtH1KfX/LsJlU8KfVRQT3vUpXtsNT10aOKYBCdvZRimtV0FjHdyCaBWnMVLO0/t1Cjm3kNzvPbAsXT4Bo+Y9UwgLBlf/tlMQNt2JjZ+Ko1A90pavnzNxrAuFJ3lm8pvfrRIS2EY064IO07Q9/epfO9ylUmf71H38UfwK6PnXtHkuhzAZs3/egZMFikLSg53KjrqZR0q3kcKuL1kMV300a85OZRll3gfde3s9AAY0zsPLVQsgVKqK6qbMkTGmtI6iap1mL8TtSG3JveS4a2pQRAQ9WbjbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdFtt0EQcpoECw2jJpsAIBrtuUZaqxnwX0fV6qM4dsE=;
 b=X2kGdjA1wxEAIqDA78okh5kFVjWH8UoNgjib7BBTTV4ZM/aTN7du8MjLFFrlPsHcRI5gG1ND9a0usz2nXREGoR/WI5VomnaB3siX4YEaX25vHt7Jox58nTNk3Pn5VKzHKYuy42mIPZe0xvlNzfYDMTaUAwttrSP4S9Mqr4FLyjphw9zCsqHZqmmZ94LnTtIc3cTqT4UQuCJBvo0hI6sBVQLYoaSKVsqGdkLc+V/MODyi3n0KRi6y/VYngJNtpYm0tO00cI0mGwbbsCrUbCy0808XNEBGUoxv0J/1gHRCDQ9yFwBOm1QWjsJjMkogzaW/kFHsVTzj9JzJmrK1Cz1x7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zdFtt0EQcpoECw2jJpsAIBrtuUZaqxnwX0fV6qM4dsE=;
 b=PRkbOjGr/HPV1r5CnvgMT5+oQcs2FPx5Z+PXwXGnJ+oVcmd6230A0HEwfYpXj7/lHi4cAL51sZBB+mm5kekNpBjwhvyq8+U61VAtawgWv+4RNsNnPG1XciuIDyEB+MxBUreB2LbZgaoqHA5FujNnoFc86gDut35g055G34OgaxrCRIyXhMAGhk3hL4/DrDvMdVsDMOwVuE16zbW8+J/j5ceine2N85+jsWgV8s7l9E5xjQz18hyteXxUBU/qZBEw3nQ7J7hamKzx/JF4swPoJhwq2tiM7vkjDkNlFnBjLX61feQlDVx0b1gHKCpzwEQT903Z7+cvqaa9osyfBSgNMQ==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB2811.namprd12.prod.outlook.com (2603:10b6:5:45::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 17:55:06 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3977.029; Thu, 25 Mar 2021
 17:55:06 +0000
Date: Thu, 25 Mar 2021 14:55:04 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210325175504.GH2356281@nvidia.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <ec99146c7abc35d16b245816aba3e9d14862e624.camel@intel.com>
 <c2239da2-c514-2c88-c671-918909cdba6b@shipmail.org>
 <YFsNRIUYrwVQanVF@phenom.ffwll.local>
 <a1fa7fa2-914b-366d-9902-e5b784e8428c@shipmail.org>
 <75423f64-adef-a2c4-8e7d-2cb814127b18@intel.com>
 <e5199438-9a0d-2801-f9f6-ceb13d7a9c61@shipmail.org>
 <6b0de827-738d-b3c5-fc79-8ca9047bad35@intel.com>
 <9f789d64-940f-c728-8d5e-aab74d562fb6@shipmail.org>
Content-Disposition: inline
In-Reply-To: <9f789d64-940f-c728-8d5e-aab74d562fb6@shipmail.org>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: CH2PR18CA0014.namprd18.prod.outlook.com
 (2603:10b6:610:4f::24) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH2PR18CA0014.namprd18.prod.outlook.com (2603:10b6:610:4f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.26 via Frontend Transport; Thu, 25 Mar 2021 17:55:06 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lPUCG-002l1l-Nu; Thu, 25 Mar 2021 14:55:04 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98d2eb9c-d903-4edd-dff9-08d8efb71fa4
X-MS-TrafficTypeDiagnostic: DM6PR12MB2811:
X-Microsoft-Antispam-PRVS: <DM6PR12MB281103FF8C2AE2E6D307013CC2629@DM6PR12MB2811.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: reIwC5hkCOBeatCkj5TeEe09+ZY9INv6/7MS5iLiih2zT99+leHub/hCtcD/b0uO3bYMF/YI/xddke5Nm47UIYNunMC2NvZOR1MP1thCyzP50JntjsED3mV/BuvbOEq3jv9Ysl9enRIwnIgM+WSAX0k0Dv7MrQYBi0IjswHSyyDvt8uAITp5rFe2v+pqfQ9SCjdVovL2geukEGCYALT9HLlDzsB79JDXriqtMRxUyDxImX+9FwuFujmhTCLxrcm+iikUAtIGS8veM8si6022KEvCiY81dxMb64crvfk+CiP1p11KRa4mx4a3y7GA7ur5aXRGd2/fctfL95jAcvctWk9JJQFrN2QEjrlFR5e2bgVuXcude1460giB/scT23xa3/NTBYH1S/2Q1pXWolCvw5TLnWcWB8oR4gEgqww3bJf6NLcQAncTfvpWhPhenW3St3H84pQJF12RqwiqUwpwSozdOVQOJnZuq+Kr8TG2csxowAbU4z5kzaadUHrS/5V8AL993CqLqO/4zMo8xjh1VM1DnZhjrr7rvAysR3Jn1T61DWLjQLU4V3X8a3v7yo183Vs+VBwU9OTPY1+uHcha1KlwdM5S4LIEYtsl3fOhTFJ3BbLcSktS3JG2195Nyw9EWvoSrruTxbRWPMLD2VKNI5xjjk4G3+Y7XzYKP7/02Kd1q8sOHmuRNomSbcOc4VK0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(8936002)(4326008)(33656002)(26005)(9786002)(66476007)(478600001)(66556008)(86362001)(53546011)(5660300002)(1076003)(9746002)(186003)(54906003)(2616005)(426003)(316002)(8676002)(38100700001)(6916009)(36756003)(2906002)(66946007)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WmtRY081WEVsSmRNMFJXcDcyd1dYK3dmeEd2eDQ5ZTFYQ0g2TlBISFhtcThJ?=
 =?utf-8?B?TksvMGJ3aC9xc1hFQk0rZGFwV2FpaWp0andKWmVYWW1XSUY5OWR6eVRXajJt?=
 =?utf-8?B?YW1vNFQ0MlhMdm40YmplNE5xaUZQTU1VZWxyTXhmNUZpaytxOHdDVmRuVUEy?=
 =?utf-8?B?MFhleVdPNUZIM2dTVGh4VWpqRmtRMHBsV2U1ZTBiTDlpWFh2Q3RHRkZiTU1m?=
 =?utf-8?B?WDN1RUF4bU9pa01pcHBqeHpWRG9FMFY1QmJQdCs3dHBkOVM2UTVEQ2dMR1ls?=
 =?utf-8?B?eXRySGgyT094M1FERkFnZGdmQ3Q4Q3BlZWlGbUtGSlBoYlo0S1ZHZW50SHN2?=
 =?utf-8?B?aHJ5OGFDVzRrcEk3VHhpNkhWZ3FZZkpROFpTbFhFWm9kZ2NBQnNneFQ3Z2FQ?=
 =?utf-8?B?ZTY5dS8rdVh4YmtFQlNUeGtPNXlzYTBhMG1obDlSbndpY1JlMWRBc3BmNzhr?=
 =?utf-8?B?b1l1ZzdzOVJBNjFOK3JVbEVHdlJzMTdpV0ZzTmlpVlp0MEFMc1VtdSt4OFpy?=
 =?utf-8?B?WGNqM0U5d1Nkc0JnTzI2aTZreElSMVczNEJhQWNLM0tnWENDWE42b09XcjVF?=
 =?utf-8?B?NnE0a3VneGFMWWpXNHVXTEcramZYMCs0Y0pHN3liajRvT21zR0dYT2F3M0Jk?=
 =?utf-8?B?UTBQbVpHZ3lvM3BsekcxcUFVNUdRZGRtYkJsRFZmNXNVd1VHZXlSSVYrSnhr?=
 =?utf-8?B?OWlLTXlaclcrRjIraW5BQW5UcjJFS1ZUWjVpWEd2VlBtTGt6ajlKa0xXRlBG?=
 =?utf-8?B?Nnh0UDFneFlyaXBIYWdGZHdWVXl4RXp2QU1mR1FmSTBMMlQzVlg4U0h1MzFQ?=
 =?utf-8?B?bUZIa0tYeWxLVy9iTkNrck9zc2xKYkhCUGIzczFiM01mR0FveUN1dGtPbEcv?=
 =?utf-8?B?UzliRzQvSXFrRDlrMUZZc0ZSVE14UzgzRk5MVnBuVSs2QTduNU9KSWtpUm1r?=
 =?utf-8?B?RkI4czBXZlA4WEtBZGcxNHgraEhIOTJxcnBlVWFFLzFqb3AzVXBmTFc2bWpt?=
 =?utf-8?B?b1A3VkxSR01BaENKRWFPYm0rZDZkSE14UlRvYkRLV2VZN1Z0Nk5XOU1INFky?=
 =?utf-8?B?aUhWSFdvV2VJQ0JJVlZxWDdraGU3ODJZblF1NC9FRHordUI3U3ZZOHhZMlZQ?=
 =?utf-8?B?Q1RlVllITFZWNUJEU3hNRjZuN29xMEltZ09jeVNhV0NPY2VuaDYzSVd5d2VB?=
 =?utf-8?B?eXlBU1ZLcFcvVGhFYXp0bjJLdnQ2ZHBUUDlRZ3ZGM1A3Q3hXMEQ1eWVTYmlH?=
 =?utf-8?B?VGpvbHFsQ2pCUlBYY1h6V2dtSi90SmpZT3RkM212YUlCYjZpNWkyMVMwclE1?=
 =?utf-8?B?aW1DbjJKdmhJS0tFTDNKWFBReTBSS1VpNGVhZUV1bWRIdWJ5aXFjMGVDYWtJ?=
 =?utf-8?B?MnRpZXdhVWY0VXVuZXVBalZPTkRLYTFSTTczSUFQb1ZSc1FINE5QL1djVDJu?=
 =?utf-8?B?TUFQWmtuM29JdnAyVjRQNHZ6bWJBYW1pTjBRNE45dXEvc3Z3S2c0WGVtTEN4?=
 =?utf-8?B?Q3ZQSnU5cDJsRlBETllKWXgyRzl1VEhwZ0dkcmxZemE2Yjg0OUNxNWM5VERX?=
 =?utf-8?B?cjVNYk5sL3E5V3JmNExrQXlNRHZNU2pFaitmc09JcFg5enRkUWJlbXRySFpI?=
 =?utf-8?B?VUYwNjhVK01xNGI5TmFMM1owSHZVTlZ1clI5d2FmZ3ExNnphK1RPTVBleExJ?=
 =?utf-8?B?MWNhaXhJdW9wR1ZpalVzNmN5cGIzQk9PVmQycTEycUhSSC9oeWZocFhoTm1L?=
 =?utf-8?Q?dNWBxVOvYo0xarzKJ4jy9aVM5FqL7hAXQmi7eiI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d2eb9c-d903-4edd-dff9-08d8efb71fa4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 17:55:06.3196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqrKTe5f83nRFnPsED0nO9FNBw8DwuDdIVsdf5ibIOjUxl13os5xweV/2fEZd8J1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2811
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

T24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgMDY6NTE6MjZQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKPiAKPiBPbiAzLzI0LzIxIDk6MjUgUE0sIERhdmUgSGFuc2VuIHdy
b3RlOgo+ID4gT24gMy8yNC8yMSAxOjIyIFBNLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIHdy
b3RlOgo+ID4gPiA+IFdlIGFsc28gaGF2ZSBub3QgYmVlbiBjYXJlZnVsIGF0ICphbGwqIGFib3V0
IGhvdyBfUEFHRV9CSVRfU09GVFcqIGFyZQo+ID4gPiA+IHVzZWQuwqAgSXQncyBxdWl0ZSBwb3Nz
aWJsZSB3ZSBjYW4gZW5jb2RlIGFub3RoZXIgdXNlIGV2ZW4gaW4gdGhlCj4gPiA+ID4gZXhpc3Rp
bmcgYml0cy4KPiA+ID4gPiAKPiA+ID4gPiBQZXJzb25hbGx5LCBJJ2QganVzdCB0cnk6Cj4gPiA+
ID4gCj4gPiA+ID4gI2RlZmluZSBfUEFHRV9CSVRfU09GVFc1wqDCoMKgwqDCoMKgwqAgNTfCoMKg
wqDCoMKgIC8qIGF2YWlsYWJsZSBmb3IgcHJvZ3JhbW1lciAqLwo+ID4gPiA+IAo+ID4gPiBPSywg
SSdsbCBmb2xsb3cgeW91ciBhZHZpc2UgaGVyZS4gRldJVyBJIGdyZXBwZWQgZm9yIFNXMSBhbmQg
aXQgc2VlbXMKPiA+ID4gdXNlZCBpbiBhIHNlbGZ0ZXN0LCBidXQgb25seSBmb3IgUFRFcyBBRkFJ
Q1QuCj4gPiA+IAo+ID4gPiBPaCwgYW5kIHdlIGRvbid0IGNhcmUgYWJvdXQgMzItYml0IG11Y2gg
YW55bW9yZT8KPiA+IE9uIHg4Niwgd2UgaGF2ZSA2NC1iaXQgUFRFcyB3aGVuIHJ1bm5pbmcgMzIt
Yml0IGtlcm5lbHMgaWYgUEFFIGlzCj4gPiBlbmFibGVkLiAgSU9XLCB3ZSBjYW4gaGFuZGxlIHRo
ZSBtYWpvcml0eSBvZiAzMi1iaXQgQ1BVcyBvdXQgdGhlcmUuCj4gPiAKPiA+IEJ1dCwgeWVhaCwg
d2UgZG9uJ3QgY2FyZSBhYm91dCAzMi1iaXQuIDopCj4gCj4gSG1tLAo+IAo+IEFjdHVhbGx5IGl0
IG1ha2VzIHNvbWUgc2Vuc2UgdG8gdXNlIFNXMSwgdG8gbWFrZSBpdCBlbmQgdXAgaW4gdGhlIHNh
bWUgZHdvcmQKPiBhcyB0aGUgUFNFIGJpdCwgYXMgZnJvbSB3aGF0IEkgY2FuIHRlbGwsIHJlYWRp
bmcgb2YgYSA2NC1iaXQgcG1kX3Qgb24gMzItYml0Cj4gUEFFIGlzIG5vdCBhdG9taWMsIHNvIGlu
IHRoZW9yeSBhIGh1Z2UgcG1kIGNvdWxkIGJlIG1vZGlmaWVkIHdoaWxlIHJlYWRpbmcKPiB0aGUg
cG1kX3QgbWFraW5nIHRoZSBkd29yZHMgaW5jb25zaXN0ZW50Li4uLiBIb3cgZG9lcyB0aGF0IHdv
cmsgd2l0aCBmYXN0Cj4gZ3VwIGFueXdheT8KCkl0IGxvb3BzIHRvIGdldCBhbiBhdG9taWMgNjQg
Yml0IHZhbHVlIGlmIHRoZSBhcmNoIGNhbid0IHByb3ZpZGUgYW4KYXRvbWljIDY0IGJpdCBsb2Fk
CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
