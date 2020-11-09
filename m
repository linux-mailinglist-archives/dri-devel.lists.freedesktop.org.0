Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF13F2AC0AB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 17:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64E289B00;
	Mon,  9 Nov 2020 16:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA89989AB9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 16:20:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6ag01FVASEEmzTL/iubbF2xcU9li9MY27/Qnm4wqJvIPXwaTxhTfzdPdIxups5rYKT0VRJ8cBwgB/koKa7axAs8iGQyeua42D/5wW/uTMfcOV84TwcWQ7hoMlPPpxAm8RvIlwOiVGcgHuLNzTKaw+RQS0wHOSEjVJeSLDRftFboPfeTTaf/c/sh8rkX8mbZLu/7VDfeNxkX587VL1fPjuEZXw6PNbLpICvdFB4Uag6Df38jKVbBtEriClIrHGjfpd/S3b2evsO+ab6CS8yk9YvQt6l+Ocf4zh8/fgVlmPYS9poBbUlafeGapONpYM3huqqBgZPGxsE9tODHf5cwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3papDP5qseM9Oj/3LjN5cM/WYGNiGcuyoH/hR9K9iFA=;
 b=JqWJeJ96jCEwNI+sZRb0H7pB0ySgGzDnOA/3OW/mdNth8WKP+kSRN5YxF99ohTmHzo7wbv47KWsAKa6XrgCxsLwXxh98axPad4stmiONzQnpUcx8wauB3BALl9Iue1SFuEF7c4HkZM3imousYJxvoI15qT8Ds2k6MEIlrAWhmCD54wRKx39d68SyJ+43CbBjd3iOujwonHdUULVyoKE6FhQk8biKkLmNV4ydxzDtkLOjI0v1gCj27Im7Hlwt2s1LiRvhHU+NzU4kfbmxNeguaV5jdVVugzrG73nUXtAPPkDA2kcMNgbBasCPH4Mf/tdctLJOG1/aC7O3L3qM9jORBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3papDP5qseM9Oj/3LjN5cM/WYGNiGcuyoH/hR9K9iFA=;
 b=zd2BD3ZFro1NpCeH0Y5ACmWjhV4tmhariRT5VxP5kqsfA5p328abvh7h62cIqetJxNoQJvqde0+l1Op31tZZyIiVujmUxdcUrjOZYOpLRy3YHtaOQi2XnCxBEztrPsAdDmhgYwu1qtnEPBO/XiavnUwXLdO/+mdZrSQOSjdmZRA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Mon, 9 Nov
 2020 16:20:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3541.025; Mon, 9 Nov 2020
 16:20:22 +0000
Subject: Re: [PATCH 1/4] drm/ttm: add multihop infrastrucutre (v2)
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20201109005432.861936-1-airlied@gmail.com>
 <20201109005432.861936-2-airlied@gmail.com>
 <9fdcf880-be1a-5803-3e54-14a9910a91b7@amd.com>
 <20201109151650.GE6112@intel.com>
 <bec6848c-3ad5-41ca-d424-669a6797b972@amd.com>
 <20201109161825.GG6112@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <dfd0e641-392b-cab2-05d1-ae466ae08ba8@amd.com>
Date: Mon, 9 Nov 2020 17:20:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201109161825.GG6112@intel.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR07CA0116.eurprd07.prod.outlook.com
 (2603:10a6:207:7::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR07CA0116.eurprd07.prod.outlook.com (2603:10a6:207:7::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.13 via Frontend Transport; Mon, 9 Nov 2020 16:20:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 18dd530a-ce13-445e-afba-08d884cb5b85
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4111639E609540DE9A76623F83EA0@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ePq49dF9i61LIziXGGUgNMLpy+YsbZmhPuey7UFWS89zKUyvLFQO3Bm1ExFEdw+Y69d6h/dhndGUXZ4PjygPHlOKiMtnjdT7UDnqGCqrycP2k9SoXZQY+bw+EBgIPGap9CB1N/9H/uT08InQPAjE8GQFtSq5e5eM1XAtITIQ1X+W9xZJ8iMAdhXpuS5MFrUEDVuMUjXwIqSVXYv1g90GUp5g1Og+KoSLmXaLqQ8bHUE9ItCsG7UQGKjKwrlf2gVpvJQgZTqaa+wGasBch1hUa0DX8bnFB0IKspA3x3CrDmV1mnaPsbqcTopES31fzcK0dCnTkRbR/oqRxXDtnKs459M1PPdA0+lpbg/Xeb/igAIlSJh10566tWWUJI+rtYNL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(2616005)(52116002)(4326008)(2906002)(6666004)(6916009)(16526019)(186003)(5660300002)(6486002)(8936002)(31696002)(316002)(86362001)(478600001)(36756003)(31686004)(66476007)(8676002)(66556008)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Zmo3amxBbVo4WjFzMkpVNC84VU9GUDBaNjVCTTJWTmxNUHFHbDI2UWJBbjdM?=
 =?utf-8?B?QU50cDMxbXZscTdlNDh1ajBxNDNONnVrQ2ZSOW1zRlFMajZDaTdnZENMNUVu?=
 =?utf-8?B?NFV5Sm9EeVhlZldtbkFRWTczaDc3WUIwekZoMDdkK3lNK3BPSXpPK2o2eWVS?=
 =?utf-8?B?dnRyQlVqOFBQL1FBUFVCemVDVmdRbC9QeGRFOE9DZkVpM2VwdS9VRUpBK0t5?=
 =?utf-8?B?TVpBQ0grb0ZndmppdFNaNUJCUEw1eEx2dThoNzVQVC9GUkNFUHRSSFE1R05m?=
 =?utf-8?B?R1VkWG1uYXJ0T29wNXJmNmF3VzRTQ011RTlKcDh1NWwvUStyRmFBY2ovZW1N?=
 =?utf-8?B?NFVpK2piTFpJdE02SGRpbGs0akF2U1diMHEyVkxUSmczSTNISVIwQXU1NjVl?=
 =?utf-8?B?UUJHU3J0Ui9sam5qbExJZVNVNDdCaFZ6UHArbmdCNk1ycTFPWkVrOGVYeFd4?=
 =?utf-8?B?WkJab1FSNkdiWlUyVlB0YXZqWkRjazhqOXM2V04vVEZzT0k0cEl0aVRscXBP?=
 =?utf-8?B?ajJEMjRnZnJUQ0NrTEZJSFB5bmtSdWQ4SzZ5WTAyaFlsaTRrT21LUnlMWktY?=
 =?utf-8?B?TFlWNnp2VDdrblpYQnVlSXFmejVIWWRNM3B0M0g5YUh6SnRKS3lIbHd2NU9F?=
 =?utf-8?B?OGdTUXI2WWMrNHMxTmRqbmRqR1QyeHIyUEYyWTVWakwxc2xMTmQ0SXpBSStr?=
 =?utf-8?B?T3FvQTlKY1Y0eEV5R3dhMk05bmdGUXNiVFRUREEzKzRWdERCcEU0SHc3SWx2?=
 =?utf-8?B?U2dXYmtGSVgwczZjSDMvU1RndWFJN0xQc0VLaXArc0FMSDVFRHdIdlhTTnJx?=
 =?utf-8?B?Wk14VnloYW5TUThZWUVLcjA0aUw1UGdPSm9PSnRrWDNTYlp6VFQwcVdwZjUr?=
 =?utf-8?B?MHRRM21rd3hOM21udFpZWE9FZU1HZ1hrVmRNSmtrNlBTT3JpZEVQK1ZmYzhQ?=
 =?utf-8?B?WlFjU0IrMERGUlR1QXZkV2M5dlFpN3NkRUwvakl5VVZKV0srK2lQMUpwajRY?=
 =?utf-8?B?OVlCZ0xsTjJ0RW01d3plZmZtWjNyMkFaeDJRTWU3M3B5NjAvWWdwMjlvS3Bl?=
 =?utf-8?B?Ujhzcy92bEg5UWJ6UUtHUnh3SGYvU0xpSXpaWDlVZXRZbTFRMkEwbWhDS3ho?=
 =?utf-8?B?cVFsYnlpTm9wVGpSSHVIR0tBbngrQkUxNG10VElmVEJXTkJpdmpRVVBURnNz?=
 =?utf-8?B?Nm5vdmY4djZYelYwSC83TVlaZC9vZ0JCaU4rRlRSNW9oL2JQTjV4aUNQNlpU?=
 =?utf-8?B?cnFOOGRhWlptVVdHQnRTSTdiOFlBaG5SNlNldHhXM05oSGxydz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18dd530a-ce13-445e-afba-08d884cb5b85
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 16:20:22.3539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4D2Y1bzmURzgCUm0RoN6mfN3tYTsxpWRsCkU8BD2eIm7wbLgcvkahfL9I1E0eI9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMTEuMjAgdW0gMTc6MTggc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6Cj4gT24gTW9uLCBO
b3YgMDksIDIwMjAgYXQgMDQ6NTc6MjlQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQW0gMDkuMTEuMjAgdW0gMTY6MTYgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6Cj4+PiBPbiBX
ZWQsIE5vdiAxMSwgMjAyMCBhdCAwNjoxMzowMlBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+Pj4+IEFtIDA5LjExLjIwIHVtIDAxOjU0IHNjaHJpZWIgRGF2ZSBBaXJsaWU6Cj4+Pj4+
IEBAIC0xNDMyLDE1ICsxNDc5LDE4IEBAIGludCB0dG1fYm9fc3dhcG91dChzdHJ1Y3QgdHRtX29w
ZXJhdGlvbl9jdHggKmN0eCkKPj4+Pj4gICAgIAlpZiAoYm8tPm1lbS5tZW1fdHlwZSAhPSBUVE1f
UExfU1lTVEVNKSB7Cj4+Pj4+ICAgICAJCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7
IGZhbHNlLCBmYWxzZSB9Owo+Pj4+PiAgICAgCQlzdHJ1Y3QgdHRtX3Jlc291cmNlIGV2aWN0X21l
bTsKPj4+Pj4gKwkJc3RydWN0IHR0bV9wbGFjZSBob3AgPSB7fTsKPj4+PiBQbGVhc2UgYWx3YXlz
IHVzZSBtZW1zZXQoKSBpZiB5b3Ugd2FudCB0byB6ZXJvIGluaXRpYWxpemUgc29tZXRoaW5nIGlu
Cj4+Pj4gdGhlIGtlcm5lbCwgd2UgaGFkIGVub3VnaCB0cm91YmxlIHdpdGggdGhhdC4KPj4+IFdo
YXQgdHJvdWJsZSBpcyB0aGF0PyBJJ3ZlIG5vdCBoZWFyZCBvZiBhbnl0aGluZywgYW5kIHdlIHVz
ZQo+Pj4gPXt9IHF1aXRlIGV4dGVuc2l2ZWx5IGluIGRybSBsYW5kLgo+PiA9e30gaW5pdGlhbGl6
ZXMgb25seSBuYW1lZCBmaWVsZHMsIG5vdCBwYWRkaW5nLgo+IEhhcyB0aGF0IGFjdHVhbGx5IGhh
cHBlbmVkPwoKWUVTISBOdW1lcm91cyB0aW1lcyEKCkFuZCB0aGUgZmlyc3QgZmV3IHRpbWVzIGl0
IHRvb2sgdXMgd2Vla3MgdG8gZmlndXJlIG91dCB3aGF0IHdhcyBhY3R1YWxseSAKaGFwcGVuaW5n
LgoKQ2hyaXN0aWFuLgoKPgo+PiBUaGUgcmVzdWx0IGlzIHRoYXQgZm9yIGV4YW1wbGUgd2hlbiBk
b2luZyBhIGhhc2ggb3IgQ1JDIG9mIGEgc3RydWN0dXJlCj4+IHlvdSBjYW4gY29tZSB1cCB3aXRo
IGRpZmZlcmVudCByZXN1bHRzIGRlcGVuZGluZyBvbiB0aGUgYXJjaGl0ZWN0dXJlCj4+IGFuZC9v
ciBzdHJ1Y3R1cmUgbGF5b3V0Lgo+Pgo+PiBBbm90aGVyIHByb2JsZW0gYXJlIGluZm9ybWF0aW9u
IGxlYWtzIGZyb20gdGhlIGtlcm5lbCB0byB1c2Vyc3BhY2UKPj4gYmVjYXVzZSBvZiB0aGlzLgo+
Pgo+PiBCZWNhdXNlIG9mIHRoaXMgTWVzYSBmb3IgZXhhbXBsZSBzdHJvbmdseSBkaXNjb3VyYWdl
cyB1c2luZyA9e30gZm9yCj4+IHplcm9pbmcgYSBzdHJ1Y3R1cmUuCj4+Cj4+IFJlZ2FyZHMsCj4+
IENocmlzdGlhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
