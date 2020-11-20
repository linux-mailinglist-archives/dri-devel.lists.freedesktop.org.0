Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3633B2BA70E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 11:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A61D6E89C;
	Fri, 20 Nov 2020 10:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BB26E890;
 Fri, 20 Nov 2020 10:08:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hl9oWV23YZzq0nScfyr+YK6HRzrVONwocw9IMVYukN3eDaYeAkNVOffztgJxP3SvGEWUoPogp5P4+Gf3XNfFj9RQT5ql1saUum/YYKI7Qvaea95lEViGKSPqvzc2mTgoUcIPsouEmP1Sz8a96Sdml+OTVrMzgPCjaR33ZpyUWM80RX2UeP/dHMkCEOBVV2h8I/q/rHD22Z49OcHFoiPfXZ7UPkjs9zNj8GmFmQfuKXGt0hXTVjQbntRRWr6/30wkJtCv6/4zvpzVGb7qclV5KZjhfx+3yaUpZ03F0YOs+61RtqcUWVI3mznY9JQ+mMSe84s9EzVaECrPIGOEwhvy0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC8laELQqjClPE6UmIObdWjdsjVvLQDxQ//rZ3Ylwo8=;
 b=mPCLMqq4JUyzkRwrwljmxst0pTrXwPOTo4rP9+tuUad2n3zkyfDu58ixp5LnHCekd31IZmIdNi8kbL+7ivj4CNXkGQs5b0OWbR/7rN3eayab3dHa7u/oQUjv5dNd9x/H8WDXH9Ohral7AHX9D/NY06Hf0G33yWuGUQhY60HSl33cjF/0xcVg7IavO6rsKKBllQ74XKTshqwco2KSy/iBVj+8rt+LrPevf4W0JyvRjDC9Jb1fhp31ll51rvVQZJvSB+6GBDTNbJpG595hVoqvKjYQMkUYYX6fLabqOPZFtOf+sqyruvviS5fDyo9tuP/7f8CnsfPLJ3X8dcsRkcyIBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RC8laELQqjClPE6UmIObdWjdsjVvLQDxQ//rZ3Ylwo8=;
 b=HS6y8KdHRJTP0DY3nYHDicoMWD6QK2bw92Q2KXGdyvutuL5Y+s8WWj/yyv2rWeXxgtyCsE0W7GWSMXXDFtFPa36kAJlWt9U9wbZYFhheaC0zBQvaU8XPW2smzUfWRbSpphv4vxjmDIOaUBPRWT13K3B5NSA1nqN55ivoEc8NRq8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Fri, 20 Nov
 2020 10:08:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Fri, 20 Nov 2020
 10:08:39 +0000
Subject: Re: [PATCH] drm/ttm: don't set page->mapping
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20201120095445.1195585-1-daniel.vetter@ffwll.ch>
 <20201120095445.1195585-5-daniel.vetter@ffwll.ch>
 <26a62dfb-02e4-1707-c833-a3c8d5cbe828@amd.com>
 <CAKMK7uHnYGiBsBLeyGA8sZXmAiaHaym9jnLKN_xY4VAtKJjG5A@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0b853a0e-b737-e02c-b885-0b0249449cb3@amd.com>
Date: Fri, 20 Nov 2020 11:08:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uHnYGiBsBLeyGA8sZXmAiaHaym9jnLKN_xY4VAtKJjG5A@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.11 via Frontend Transport; Fri, 20 Nov 2020 10:08:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: eab2e8ee-c70c-476c-6175-08d88d3c4039
X-MS-TrafficTypeDiagnostic: MN2PR12MB4110:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4110A8C4C6281630D371132C83FF0@MN2PR12MB4110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S8Th2MXkgVGZFs3rwha9R6nGyglcS58UgmLJl5Koq7EjMny7aLAJF8+g6y/kAa/JFmRWywtHtX7eo5/oqMC73k84AYSCEFNT/7bNhJuK88CPQgGnZ6NAI4etwgXEnwdxOqVLwEk7RrRsck5CnsRJXTOjtcwM5K+b6py/vSkZPCSrqWYlheyKscrKI5Nzujn9Zd30BaggWskQne6rrAyZ8bZ36TEd/J3xnJWnifT2UH1eawUvg94PsEkn1t9kp2TNbBPzxfvCxKvS8GHpGxq6YSmGeExoZ56SmxrYPpFUYt/kCHnz5Wx+2JoTEf+r0VgbSeKCCgQqSlAPwAgt2QI7at0rx/utrLDzuGHjZVblOOGLPs6eFPAzJpAVIksxR08v
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(6666004)(2906002)(83380400001)(66574015)(86362001)(31686004)(36756003)(54906003)(2616005)(7416002)(52116002)(4326008)(316002)(31696002)(186003)(16526019)(53546011)(478600001)(8936002)(5660300002)(6916009)(8676002)(66946007)(66476007)(66556008)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aS9TY2ZNYjltK0plUmVvWlFiS0hNSWpRdUgvVFdaR2E3dFYxVEhEbHJ1V2Va?=
 =?utf-8?B?cXJ5N2puM2Y1Q0RmaURaV1grNHJpSG16aWY0V05EQjZlQUVDcy9LT3RkWUNz?=
 =?utf-8?B?eCswemJ0aG9LTEVSUmFCM2l3TFBLTEZqa2U5NlBSc1lrZGlUZnpJNEFldFcw?=
 =?utf-8?B?RzBSNkpVQktqR0h4cUQzaHNVek5lQUs3TUo3Mk0xWUpMM2Z0UjZieHhoMEhJ?=
 =?utf-8?B?NFdnS0RzK2s3OVd2a0c1c2xLSks1a2VDQStlNHN4VHcxaWhiS0EvcDVRVUdl?=
 =?utf-8?B?b1kvNmNjUlF1Z09pa0VqZGk3WEQ1bTZpV3ZHa3NmSklGWHYzTE1HL09tQnpx?=
 =?utf-8?B?STVsZjNSbnBBU3A0dVNLSyt5ZTV3bWFxVisyYTIzNGRIeWJjTjIvMC9Ca3FZ?=
 =?utf-8?B?N1BWYnU5MEhwSEdCSlJ0a2VIQXd2akxpcnlsYzBwY0lOV2ozNnZ2bGtCRkho?=
 =?utf-8?B?b3ZhcWc4N05hVkNhWGtpVng0YUtPZWxkdFN6ZXdjVjhnZ1RXSnEraGc0dG5a?=
 =?utf-8?B?Wmo3cHlqenptYXhCZmNWd2JsMzJTbnhhcWFHNkxkNFZ2WjVYU29Qc2dpeXFL?=
 =?utf-8?B?eUZBTnBjY3J0ZHVDeHhRVVlSczYvQXU2VnRDbGdNWUJRSFpOTjhzYUdqa2Fh?=
 =?utf-8?B?b2o1TUZPZ1owdFEwTVlOVjFtbHU3MnBWN2FIYm1ZS3VrQUNUcTlMZ1hwNVdN?=
 =?utf-8?B?MjgvWFZoemdHbkk5VjROREZRZk1WZTNjVUdUMG9MRHdialBBUTFZV1R5Ump3?=
 =?utf-8?B?RnFuaDFad21JMWhKLzhmVjRVN1FaUmQyaXFKQ1BMSEdIRjlDR1kwTVNrUUcv?=
 =?utf-8?B?SVhnMVYzeVZpNm04VGhGSTFyRFpiMEoxYnpEN0VLSi9ncVZydWIxU0NyVHh2?=
 =?utf-8?B?bVFXekRhWTc5NTFuNTA0dHZNeDFNSDN2SlBjdGZrdjBQWE9wYWRQcDVDMjJ2?=
 =?utf-8?B?RWdUMTN2bm96SEkxVXNYSFVFMjRjQXRrajdqbTBQaWZQUVNKMThWM0k2SllM?=
 =?utf-8?B?SU8zNnQ0d3JaQ1QzQVRINU8xblB2NHVWQVIxS3hnclp6N3IxUmgrZjZodmRo?=
 =?utf-8?B?eHdFalhhQVhzUVlTbngwbDJwWGc2c3E4SWhCaVhDbVMxekhQdTFiQ2R2V0Ex?=
 =?utf-8?B?ajNGY3BVZzcvejdhMkNiRE5TSEgxU1hGQ1pUSkpaNHJSaVVNcDFCR3RuRmla?=
 =?utf-8?B?a1kzZDB4ZURseGdpZzV4aUQ0NUpFeGRxMFJsTXI3Y2ZCaU01REI4L29oVU5N?=
 =?utf-8?B?anY2QUlXbFdCSXRzK0NmK0sxbzVoZUprRTJteURkZTBhYUNmdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eab2e8ee-c70c-476c-6175-08d88d3c4039
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 10:08:38.9420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5H4BoTYl1PvSvuvMzCEoal0X2VFbE87l0aP1PloQOhF5fAUNcgN+/z3tcbu6khb+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-xfs@vger.kernel.org,
 Linux MM <linux-mm@kvack.org>, Huang Rui <ray.huang@amd.com>,
 Brian Paul <brianp@vmware.com>, linux-fsdevel@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMTEuMjAgdW0gMTE6MDUgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIEZyaSwgTm92
IDIwLCAyMDIwIGF0IDExOjA0IEFNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPiB3cm90ZToKPj4gQW0gMjAuMTEuMjAgdW0gMTA6NTQgc2NocmllYiBEYW5pZWwg
VmV0dGVyOgo+Pj4gUmFuZG9tIG9ic2VydmF0aW9uIHdoaWxlIHRyeWluZyB0byByZXZpZXcgQ2hy
aXN0aWFuJ3MgcGF0Y2ggc2VyaWVzIHRvCj4+PiBzdG9wIGxvb2tpbmcgYXQgc3RydWN0IHBhZ2Ug
Zm9yIGRtYS1idWYgaW1wb3J0cy4KPj4+Cj4+PiBUaGlzIHdhcyBvcmlnaW5hbGx5IGFkZGVkIGlu
Cj4+Pgo+Pj4gY29tbWl0IDU4YWE2NjIyZDMyYWY3ZDJjMDhkNDUwODVmNDRjNTQ1NTRhMTZlZDcK
Pj4+IEF1dGhvcjogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+Pj4g
RGF0ZTogICBGcmkgSmFuIDMgMTE6NDc6MjMgMjAxNCArMDEwMAo+Pj4KPj4+ICAgICAgIGRybS90
dG06IENvcnJlY3RseSBzZXQgcGFnZSBtYXBwaW5nIGFuZCAtaW5kZXggbWVtYmVycwo+Pj4KPj4+
ICAgICAgIE5lZWRlZCBmb3Igc29tZSB2bSBvcGVyYXRpb25zOyBtb3N0IG5vdGFibHkgdW5tYXBf
bWFwcGluZ19yYW5nZSgpIHdpdGgKPj4+ICAgICAgIGV2ZW5fY293cyA9IDAuCj4+Pgo+Pj4gICAg
ICAgU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29t
Pgo+Pj4gICAgICAgUmV2aWV3ZWQtYnk6IEJyaWFuIFBhdWwgPGJyaWFucEB2bXdhcmUuY29tPgo+
Pj4KPj4+IGJ1dCB3ZSBkbyBub3QgaGF2ZSBhIHNpbmdsZSBjYWxsZXIgb2YgdW5tYXBfbWFwcGlu
Z19yYW5nZSB3aXRoCj4+PiBldmVuX2Nvd3MgPT0gMC4gQW5kIGFsbCB0aGUgZ2VtIGRyaXZlcnMg
ZG9uJ3QgZG8gdGhpcywgc28gYW5vdGhlcgo+Pj4gc21hbGwgdGhpbmcgd2UgY291bGQgc3RhbmRh
cmRpemUgYmV0d2VlbiBkcm0gYW5kIHR0bSBkcml2ZXJzLgo+Pj4KPj4+IFBsdXMgSSBkb24ndCBy
ZWFsbHkgc2VlIGEgbmVlZCBmb3IgdW5hbXBfbWFwcGluZ19yYW5nZSB3aGVyZSB3ZSBkb24ndAo+
Pj4gd2FudCB0byBpbmRpc2NyaW1pbmF0ZWx5IHNob290IGRvd24gYWxsIHB0ZXMuCj4+Pgo+Pj4g
Q2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4+IENjOiBCcmlh
biBQYXVsIDxicmlhbnBAdm13YXJlLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0
ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+Pj4gQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4+IENjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQu
Y29tPgo+PiBUaGlzIGlzIHN0aWxsIGEgTkFLIGFzIGxvbmcgYXMgd2UgY2FuJ3QgY29tZSB1cCB3
aXRoIGEgYmV0dGVyIHdheSB0bwo+PiB0cmFjayBUVE1zIHBhZ2UgYWxsb2NhdGlvbnMuCj4+Cj4+
IEFkZGl0aW9uYWwgdG8gdGhhdCBwYWdlX21hcHBpbmcoKSBpcyB1c2VkIHF1aXRlIGV4dGVuc2l2
ZWx5IGluIHRoZSBtbQo+PiBjb2RlIGFuZCBJJ20gbm90IHN1cmUgaWYgdGhhdCBpc24ndCBuZWVk
ZWQgZm9yIG90aGVyIHN0dWZmIGFzIHdlbGwuCj4gQXBvbG9naWVzLCBJJ20gaG9uZXN0bHkgbm90
IHF1aXRlIHN1cmUgaG93IHRoaXMgbG9uZSBwYXRjaCBoZXJlIGVuZGVkCj4gdXAgaW4gdGhpcyBz
dWJtaXNzaW9uLiBJIGRpZG4ndCB3YW50IHRvIHNlbmQgaXQgb3V0LgoKTm8gcHJvYmxlbS4KCkJ1
dCBsb29raW5nIGEgYml0IGRlZXBlciBpbnRvIHRoZSBtbSBjb2RlIHRoYXQgb3RoZXIgZHJtIGRy
aXZlcnMgZG9uJ3QgCnNldCB0aGlzIGNvcnJlY3RseSBhbmQgc3RpbGwgdXNlIHVubWFwX21hcHBp
bmdfcmFuZ2UoKSBzb3VuZHMgbGlrZSBxdWl0ZSAKYSBidWcgdG8gbWUuCgpHb2luZyB0byB0cmFj
ayBkb3duIHdoYXQgZXhhY3RseSB0aGF0IGlzIHVzZWQgZm9yLgoKQ2hyaXN0aWFuLgoKPiAtRGFu
aWVsCj4KPj4gUmVnYXJkcywKPj4gQ2hyaXN0aWFuLgo+Pgo+Pj4gLS0tCj4+PiAgICBkcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV90dC5jIHwgMTIgLS0tLS0tLS0tLS0tCj4+PiAgICAxIGZpbGUgY2hh
bmdlZCwgMTIgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX3R0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4+PiBpbmRleCBk
YTllZWZmZTBjNmQuLjViMmViNmQ1OGJiNyAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX3R0LmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPj4+
IEBAIC0yODQsMTcgKzI4NCw2IEBAIGludCB0dG1fdHRfc3dhcG91dChzdHJ1Y3QgdHRtX2JvX2Rl
dmljZSAqYmRldiwgc3RydWN0IHR0bV90dCAqdHRtKQo+Pj4gICAgICAgIHJldHVybiByZXQ7Cj4+
PiAgICB9Cj4+Pgo+Pj4gLXN0YXRpYyB2b2lkIHR0bV90dF9hZGRfbWFwcGluZyhzdHJ1Y3QgdHRt
X2JvX2RldmljZSAqYmRldiwgc3RydWN0IHR0bV90dCAqdHRtKQo+Pj4gLXsKPj4+IC0gICAgIHBn
b2ZmX3QgaTsKPj4+IC0KPj4+IC0gICAgIGlmICh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9G
TEFHX1NHKQo+Pj4gLSAgICAgICAgICAgICByZXR1cm47Cj4+PiAtCj4+PiAtICAgICBmb3IgKGkg
PSAwOyBpIDwgdHRtLT5udW1fcGFnZXM7ICsraSkKPj4+IC0gICAgICAgICAgICAgdHRtLT5wYWdl
c1tpXS0+bWFwcGluZyA9IGJkZXYtPmRldl9tYXBwaW5nOwo+Pj4gLX0KPj4+IC0KPj4+ICAgIGlu
dCB0dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4+PiAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHgg
KmN0eCkKPj4+ICAgIHsKPj4+IEBAIC0zMTMsNyArMzAyLDYgQEAgaW50IHR0bV90dF9wb3B1bGF0
ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPj4+ICAgICAgICBpZiAocmV0KQo+Pj4gICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4+Cj4+PiAtICAgICB0dG1fdHRfYWRkX21hcHBpbmco
YmRldiwgdHRtKTsKPj4+ICAgICAgICB0dG0tPnBhZ2VfZmxhZ3MgfD0gVFRNX1BBR0VfRkxBR19Q
UklWX1BPUFVMQVRFRDsKPj4+ICAgICAgICBpZiAodW5saWtlbHkodHRtLT5wYWdlX2ZsYWdzICYg
VFRNX1BBR0VfRkxBR19TV0FQUEVEKSkgewo+Pj4gICAgICAgICAgICAgICAgcmV0ID0gdHRtX3R0
X3N3YXBpbih0dG0pOwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
