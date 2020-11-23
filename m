Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AB52C16A9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 21:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BAB36E0BE;
	Mon, 23 Nov 2020 20:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC306E0B8;
 Mon, 23 Nov 2020 20:41:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyIiecd8RGPrcrxG9x5N7PYdhIw4oyBGY6j+xFgR0Je8pqUTHn+Y25Ho7vAgmxmBASE3DY+zfbgmfiWlGNlzKvcJ0FFyFnRA7JKh0GNvrNH1u2VTBzevJSqktvlOTjT+QONzW9/jBPu1UIIzjqas6pxZ6/hds1+EYhM7H0bMrl2zeBIlckDf0tAlZOQBj6aVe9YncK9AJs4fVrlYuJY05zptmpWdJCX5mtna+em3WgMudZxLsD7KzOqnu6TeY2y+lV8WYVAwfnL7LRoW3GmMIJ4bTgz7AgkbDesYSvZRzZOMYAYKCS5mgZM1RcgxXQJ1wQrOweaKG3sIQQJxID8Dow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjZNyRQ3mTR/BIBAG3uIjknnyMlmhE4Yjko3doCjfT4=;
 b=VPybM+T5mBEJUqmn8AGGU47N8CZRb+f+5WiEYkyP7Br/JOxx2X6e6D5nUFzv2pw6BVcaLv+hWIbt8Wc/ajF02GpCFFebHxok+dnThKIk0hNbPvCfe1C1VQJoSTtPhchnpjbIX83/YSE+wHfOuJ3lHYgTE20CvUEtGs65EBW4czRg5FKJbTZsgbFavnRvM/XH6cOBPgAU2VEo8ZZeHc3FpCROsaWfuIPc0FP9vDpq79NzyLqNsOqdSVA8HDIVPYELbjL4gW/kzkzWb3NOEz51/wUYMHmN0fJAjkYLv7SuKFxYt4Q+L/TBryXJqu/z5Df11W4WX0+pzqmZbThCqnFq4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjZNyRQ3mTR/BIBAG3uIjknnyMlmhE4Yjko3doCjfT4=;
 b=TPp9K3why4ocQnQBDf9s49NoBVF2FjLIvQpo08+0ZkC+94qp4qCKNlDeVm42ysui9JmNl9BRLwIreqct81pAYFemPx4I76oFCa/I4ghZBRL5i3UmVwgz3xr1irdnS0xAUAVWJIbLrbPhAeQa8o3d+0W0Cf+4NcZ0+MYHyuux6yo=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:41:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Mon, 23 Nov 2020
 20:41:46 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
Date: Mon, 23 Nov 2020 21:41:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0135.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::40) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0135.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21 via Frontend
 Transport; Mon, 23 Nov 2020 20:41:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d2ae7197-fd4e-4c0d-82d5-08d88ff031a0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4239:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42392A2936DB4E682A1A550783FC0@MN2PR12MB4239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GGkkLJPCgPdgORisLUb76REpW+yjhG5OuIH597X44MOo/8g8QOfkvSRt83av6sovBOSDqn+xriZ3y/bMZJ1wxAUGWr5pTUJ/SheMcQsxU6haLwvoVxHpbSCDmKHXeWCDWTUfX3sLfp0lT8zpISF0gGRYMst7O+axLjEpXkc4Pn3BVUASyhhqUrgGiMs3OVZP6ySvFT7rSQww4tB7MewVWKO3aqhbeiLXLe+abAHHoUlGyX6DOhtH7Kew/aygfUbM4SY/Z36u13y/vBcHa077EsiM4c+tunsw+ND0Z7bn4NVP7ijifD80xw2/T1mRfHHYkU+IejLZPwnwD0+xcS1atgqHsxHGx/K+z9nn0PLyyxJz7Xx4fK6QrrZxrASPGGIOYJVdyErslwSKpxNLzmatdL9MgKNWsabpQvrKlchPgDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(478600001)(52116002)(31686004)(45080400002)(316002)(8936002)(966005)(4326008)(8676002)(5660300002)(86362001)(16526019)(186003)(2616005)(2906002)(31696002)(36756003)(6666004)(66946007)(53546011)(6486002)(66476007)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WC9xMUFvU09NTStSdUp4RzZJdTlEVlFNS1VTUGFhVVhSb01ocDhwY3FPZER2?=
 =?utf-8?B?VG5ObVpHQlhqNkpWbDV3OHErQW5sZWpaNkVxN0xOZmQzTnVjdUpPZnp4N3JQ?=
 =?utf-8?B?Tk9Hb1ByRDJFWDloVHBhMEZTWi9Kd2VndlFKODZBSk9ZV0duci9RYll1cldP?=
 =?utf-8?B?T1VjM3pldFhwM3dnYUxYV0xpUnFLRFJBY3RtL3BuSEU2bVFUVGRJZ2FtZDVn?=
 =?utf-8?B?R081Zis2djRjWjM3QTlnY3V1OHNmMXNxdk8vTTB1aVduR1h2cTVtVHEzVnhR?=
 =?utf-8?B?VjdDdFZ3RFZpVVFNakdudE9BcHcyd2plQVpHYzkxNnpPTlpFbTFjNnRvbnM1?=
 =?utf-8?B?ZkIyOUFTZndxblErck8wMkpNaEY1RlFYS3JkVFhNS1RaR3Vsb0pqR2Ztc2VQ?=
 =?utf-8?B?NitDb2pNUzJtMFd4SENwLzJRakdBR0ZGc0RHMEd6aGxNa05LM0doV21PTXB5?=
 =?utf-8?B?c3lad0c0OFJ1MjByL2NscnB3STlKbXNEZTMwTVNFak4rMzd5YnZTSWxjZjVR?=
 =?utf-8?B?RGFOc0tlVHl2Umc3ZFVRN1VXWmxOODBpeE8rQ0lKeUZuSk9jNEtTYzRlZGJ3?=
 =?utf-8?B?TitEeGIrMG83N1dva05mOHAxejRwT2xSK002T3dTbFJuMGlPaHl3YzZ0ZkVy?=
 =?utf-8?B?aVo5OTdUMEkxRG8yUmFoR0piNlVDZ2NsUk9vUFJESDhkcU1mZGpIaXc4OGVD?=
 =?utf-8?B?VlJXejEyeUk5RGlBaTBZcWcvMVRRTHc5SS9CcDM3eHZMSVZQMWc1SHN2ZHFO?=
 =?utf-8?B?MTVZb3duVHZoTzBlUDRrY2VRZ0dpd2hGMlp5bk5vSzFOOWJQZFM3bjNKQ0dM?=
 =?utf-8?B?TWpaMlQxYXhvZzdBLzNQQjl0czJNSnBTb1ZYa0szWGtGTEhpWnFORXRWS0t3?=
 =?utf-8?B?YW5KQlA4S1NmTUtrektDVzdlOEF2MUlKZ2doZEpBR0l2QURTaWVWY0V0YjRI?=
 =?utf-8?B?b1h1Y2lWdWlJQ041YU10azdOUS8wcE5KLzMvdVluYnRsVWsrWis3OS9CYmdj?=
 =?utf-8?B?MmNhdDRieXhaWlVqYzNYUUpBYnUxdUduYlpRYTFwcWRiOW9kbnArb0xvWUVC?=
 =?utf-8?B?VUVBZFEwUkhpVzRoRmRLMHpRbVZnWnhIdXdnTDNqU0U5b2tjZk5tRmcvQjZC?=
 =?utf-8?B?bTFnWDJaK2ZzNytQMzVvWlZKM2s2ejlBRVdoS0pHdGpQSk0wK1FybEtMNHVs?=
 =?utf-8?B?dDlPc3krTjFZc1RLc3F0YUZPTWtTdXVUaTdxZ21UVXVrUDNDWTZCY2NYQ0tE?=
 =?utf-8?B?VlFYcHBuQThEUTZXd0xtOUNlTHgzc0pTWFRsR202ZittVForcFFMczFzeGt6?=
 =?utf-8?B?SkNkems0THFCUW1YTDVtVytEMWFWU2RVUHdNR3lzYjBOZ3NWZVJyWjhnWTdN?=
 =?utf-8?B?a1I2TE1iT2FXMUdtaFBWSmhKdU13TStWdktsRmdiVHRWOFRGZmVjWUJIUnRK?=
 =?utf-8?Q?JNUak5+a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ae7197-fd4e-4c0d-82d5-08d88ff031a0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:41:46.1480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Qn6m1zhWGCF0nG9J1zhOad2iF6Ip9MO7i/MWrIjoVyRxyrfNb7pRywkmmsk1dP2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjMuMTEuMjAgdW0gMjE6Mzggc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDEx
LzIzLzIwIDM6MjAgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDIzLjExLjIwIHVt
IDIxOjA1IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pgo+Pj4gT24gMTEvMjUvMjAgNTo0
MiBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBBbSAyMS4xMS4yMCB1bSAwNjoyMSBz
Y2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+PiBJdCdzIG5lZWRlZCB0byBkcm9wIGlvbW11
IGJhY2tlZCBwYWdlcyBvbiBkZXZpY2UgdW5wbHVnCj4+Pj4+IGJlZm9yZSBkZXZpY2UncyBJT01N
VSBncm91cCBpcyByZWxlYXNlZC4KPj4+Pgo+Pj4+IEl0IHdvdWxkIGJlIGNsZWFuZXIgaWYgd2Ug
Y291bGQgZG8gdGhlIHdob2xlIGhhbmRsaW5nIGluIFRUTS4gSSAKPj4+PiBhbHNvIG5lZWQgdG8g
ZG91YmxlIGNoZWNrIHdoYXQgeW91IGFyZSBkb2luZyB3aXRoIHRoaXMgZnVuY3Rpb24uCj4+Pj4K
Pj4+PiBDaHJpc3RpYW4uCj4+Pgo+Pj4KPj4+IENoZWNrIHBhdGNoICJkcm0vYW1kZ3B1OiBSZWdp
c3RlciBJT01NVSB0b3BvbG9neSBub3RpZmllciBwZXIgCj4+PiBkZXZpY2UuIiB0byBzZWUKPj4+
IGhvdyBpIHVzZSBpdC4gSSBkb24ndCBzZWUgd2h5IHRoaXMgc2hvdWxkIGdvIGludG8gVFRNIG1p
ZC1sYXllciAtIAo+Pj4gdGhlIHN0dWZmIEkgZG8gaW5zaWRlCj4+PiBpcyB2ZW5kb3Igc3BlY2lm
aWMgYW5kIGFsc28gSSBkb24ndCB0aGluayBUVE0gaXMgZXhwbGljaXRseSBhd2FyZSBvZiAKPj4+
IElPTU1VID8KPj4+IERvIHlvdSBtZWFuIHlvdSBwcmVmZXIgdGhlIElPTU1VIG5vdGlmaWVyIHRv
IGJlIHJlZ2lzdGVyZWQgZnJvbSAKPj4+IHdpdGhpbiBUVE0KPj4+IGFuZCB0aGVuIHVzZSBhIGhv
b2sgdG8gY2FsbCBpbnRvIHZlbmRvciBzcGVjaWZpYyBoYW5kbGVyID8KPj4KPj4gTm8sIHRoYXQg
aXMgcmVhbGx5IHZlbmRvciBzcGVjaWZpYy4KPj4KPj4gV2hhdCBJIG1lYW50IGlzIHRvIGhhdmUg
YSBmdW5jdGlvbiBsaWtlIAo+PiB0dG1fcmVzb3VyY2VfbWFuYWdlcl9ldmljdF9hbGwoKSB3aGlj
aCB5b3Ugb25seSBuZWVkIHRvIGNhbGwgYW5kIGFsbCAKPj4gdHQgb2JqZWN0cyBhcmUgdW5wb3B1
bGF0ZWQuCj4KPgo+IFNvIGluc3RlYWQgb2YgdGhpcyBCTyBsaXN0IGkgY3JlYXRlIGFuZCBsYXRl
ciBpdGVyYXRlIGluIGFtZGdwdSBmcm9tIAo+IHRoZSBJT01NVSBwYXRjaCB5b3UganVzdCB3YW50
IHRvIGRvIGl0IHdpdGhpbgo+IFRUTSB3aXRoIGEgc2luZ2xlIGZ1bmN0aW9uID8gTWFrZXMgbXVj
aCBtb3JlIHNlbnNlLgoKWWVzLCBleGFjdGx5LgoKVGhlIGxpc3RfZW1wdHkoKSBjaGVja3Mgd2Ug
aGF2ZSBpbiBUVE0gZm9yIHRoZSBMUlUgYXJlIGFjdHVhbGx5IG5vdCB0aGUgCmJlc3QgaWRlYSwg
d2Ugc2hvdWxkIG5vdyBjaGVjayB0aGUgcGluX2NvdW50IGluc3RlYWQuIFRoaXMgd2F5IHdlIGNv
dWxkIAphbHNvIGhhdmUgYSBsaXN0IG9mIHRoZSBwaW5uZWQgQk9zIGluIFRUTS4KCkJUVzogSGF2
ZSB5b3UgdGhvdWdodCBhYm91dCB3aGF0IGhhcHBlbnMgd2hlbiB3ZSB1bnBvcHVsYXRlIGEgQk8g
d2hpbGUgCndlIHN0aWxsIHRyeSB0byB1c2UgYSBrZXJuZWwgbWFwcGluZyBmb3IgaXQ/IFRoYXQg
Y291bGQgaGF2ZSB1bmZvcmVzZWVuIApjb25zZXF1ZW5jZXMuCgpDaHJpc3RpYW4uCgo+Cj4gQW5k
cmV5Cj4KPgo+Pgo+PiBHaXZlIG1lIGEgZGF5IG9yIHR3byB0byBsb29rIGludG8gdGhpcy4KPj4K
Pj4gQ2hyaXN0aWFuLgo+Pgo+Pj4KPj4+IEFuZHJleQo+Pj4KPj4+Cj4+Pj4KPj4+Pj4KPj4+Pj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5j
b20+Cj4+Pj4+IC0tLQo+Pj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jIHwgMSAr
Cj4+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4+Pgo+Pj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyAKPj4+Pj4gYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV90dC5jCj4+Pj4+IGluZGV4IDFjY2YxZWYuLjI5MjQ4YTUgMTAwNjQ0Cj4+
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPj4+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+Pj4+PiBAQCAtNDk1LDMgKzQ5NSw0IEBAIHZvaWQgdHRt
X3R0X3VucG9wdWxhdGUoc3RydWN0IHR0bV90dCAqdHRtKQo+Pj4+PiDCoMKgwqDCoMKgIGVsc2UK
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHR0bV9wb29sX3VucG9wdWxhdGUodHRtKTsKPj4+Pj4g
wqAgfQo+Pj4+PiArRVhQT1JUX1NZTUJPTCh0dG1fdHRfdW5wb3B1bGF0ZSk7Cj4+Pj4KPj4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBhbWQtZ2Z4
IG1haWxpbmcgbGlzdAo+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+IGh0dHBz
Oi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUy
RiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngm
YW1wO2RhdGE9MDQlN0MwMSU3Q0FuZHJleS5Hcm9kem92c2t5JTQwYW1kLmNvbSU3QzliZTAyOWYy
NmE0NzQ2MzQ3YTYxMDhkODhmZWQyOTliJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4
M2QlN0MwJTdDMCU3QzYzNzQxNzU5NjA2NTU1OTk1NSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhl
eUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZD
STZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT10WjNkbyUyRmVLekJ0UmxOYUZiQmpDdFJ2VUhLZHZ3
RFo3U29ZaEVCdTQlMkJUOCUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4+Cj4+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
