Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A86032B7EAF
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 14:56:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D46AC6E33F;
	Wed, 18 Nov 2020 13:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82C56E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 13:56:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7nlz1Ged1cIQK7PXC+NxiDgKGmOgMlmmBh10v0761+CNO1Ur6kxvnhMzCrUExnT8Mg7d+QlhnTxaME/USHT5SVgnIgXAq/QQXa77t812qmnTVkUt6RC/A+pWNQbHNQ5bQtMEB1yPOEDbG7FmuUUA78mcPUAUfPcpR7rngc0DWAyWSNoYZV9Bf0HLL7CDQzkCvvbZ1/4Ghd+cvjcwlUGieyQKp/CUGE8rFFNylHOOvq3VNFlOIc9RzbwomsEePgfgYeuAtWuLoru9J4YnMeIDyNxFSsMNyCSO6ww9zYttIw7v+WxrgTR7rVi6AuuUaLwT8jzYgn3FvsWA0SsAig7VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW0ZGLIb0gpGeZiSAr5RKtN/giIxg+iZDZIYd9s0Qdo=;
 b=lSiIzaHGE33Z3WVcXVDm3YCaP/y8hEhdOLVh+s9yiEGVwPZM/Rsb3Dp3riBLNprL5jFBjvYuUti9rimUA8etMoMn5AAStpfojQJKrZVKFsq1ozlVcixLg5hK6KHqSio/JzinQQ0dNFiHj4WLzvEobrS3dazeyDkAEkcGBdSmOaDALbTyRsxS/b4NvtnVyomCUIMf7uDAUrJIY/fzkYuptcY1zqnbv92t7740qa2hv21e41ruKncUE1xfZBH3CFuVoW9Yc0f3BRPAbGshCgonTbMxDA1hGgcrQdFXE1UOQcNnqB0wP1wlLwC6QblqcJquHMm+SHGe8jMvyWIohtAWdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jW0ZGLIb0gpGeZiSAr5RKtN/giIxg+iZDZIYd9s0Qdo=;
 b=ViWdvLE5MinW+7C+8iXK/9vptt7amWq1bCsxomP8Mu/uH5qAVJ5sarOC1UvCf7Xxu07XCqcFPtGCnrdahkDarSeS4X5GePE75RRXScwvgRvZ97plFCjAXMhBvP785jHPxy/7N1Wn37cISDtwto4vZna8K0zqXje7KfoamHOhtuA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4334.namprd12.prod.outlook.com (2603:10b6:208:1d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Wed, 18 Nov
 2020 13:56:47 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Wed, 18 Nov 2020
 13:56:47 +0000
Subject: Re: [PATCH 1/4] drm/ttm: add multihop infrastrucutre (v2)
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20201109005432.861936-2-airlied@gmail.com>
 <9fdcf880-be1a-5803-3e54-14a9910a91b7@amd.com>
 <20201109151650.GE6112@intel.com>
 <bec6848c-3ad5-41ca-d424-669a6797b972@amd.com>
 <20201109161825.GG6112@intel.com>
 <dfd0e641-392b-cab2-05d1-ae466ae08ba8@amd.com>
 <20201109164301.GI6112@intel.com>
 <a0179f84-8890-e694-b94c-dbe93605ace5@amd.com>
 <20201109212731.GQ6112@intel.com>
 <CAPM=9tyHOoQwhpfAtjREK6mg6zbmNkBuPGYVUpuv8MpP9UDXgA@mail.gmail.com>
 <20201110154759.GR6112@intel.com>
 <CAKMK7uFXC3S3ZcciUr4Fo82_fTRAruo9OiNQEXxXBeiU4LTwjA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <de0dced3-c4be-bdc3-fe04-6732ef45c99b@amd.com>
Date: Wed, 18 Nov 2020 14:56:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uFXC3S3ZcciUr4Fo82_fTRAruo9OiNQEXxXBeiU4LTwjA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::10) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 13:56:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 512245f3-2f07-4cf8-3de8-08d88bc9ca96
X-MS-TrafficTypeDiagnostic: MN2PR12MB4334:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43349D7E45D612E90319132783E10@MN2PR12MB4334.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pKG1mitzog8pHLc9KgwBPM6ogOw1/hAxvKgdTTg2Ltj8xhnS/mLxJRoJcuYjycQ+UCdPqX5pREkJ7saxomogfXaLaCmMRsR1dELbxMzPEjXYXSXUUsMDecKS+BhzqX6HwaKyhmNtkDeTQdgcMkqVmXvjqUFNo0HmmjPKoRJkf3kXsGuEUuSAvPfdrXClhUbfTMmj/wyHkJfBcXCeiON1Dn5PDDBjUlF1C885Aebt3rwJkXjmaeD7RcXahPpz3bk/9Ll+HjazFMpnusVVcDfSp+RWsUVk7WB3Y0rU5nzkQxUkRfDH+8kgevsm4zsQgt3nI0adr/RfjS8NXfTMi0kKa0iwuIcur0raydS7ukfLtgyJPNA5xDtsx1ya/X8he6HWQri/UONlFKhcVjAGqzWP2Q/gNJ+tOuVE1jCIMVzVdJ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(966005)(2616005)(8936002)(45080400002)(31686004)(2906002)(31696002)(478600001)(83380400001)(36756003)(316002)(4326008)(86362001)(53546011)(54906003)(110136005)(186003)(16526019)(6486002)(8676002)(66556008)(52116002)(66476007)(66946007)(5660300002)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cGVqVmJmUDlVcXdrd1hHNEZpaDVBdERPZS9JVFl5VU9EN1gzais4ZmJsY3Y1?=
 =?utf-8?B?a1Jmc1cwK0pVd2d6WlV6a2xGd0g2cTVUVEhXWHl4bmYvSVYvQzNXc3lMVGNn?=
 =?utf-8?B?Y3FDNGtzSjZFcDJqbkdZbGhGMFMvbDZlUnlJSGl6QmI5RWxsbWpjZnd0REJ3?=
 =?utf-8?B?QTR1MklhcXZBdU9zdkFrNlU4OVRiUXRvdmIwenhuUnJHaHBGTWR6cGUxVHZY?=
 =?utf-8?B?bHZiNWJpRlBvZEFiR3hrWGU4R3FONFQyV0FvM1kzWE9iSUtCbEJHeThyaUhq?=
 =?utf-8?B?cmlUakhTaUhtdkVzQ3psZlFHMW50cjlXQlNtaU5DcGFvYWUxb3RJdzh4MFdp?=
 =?utf-8?B?RVMzQUFPc0ZNZEwvRUhuTlArUDErUmRrck9aWHdTOGxEMlFnVEVQclJsQm42?=
 =?utf-8?B?YXpzaU1sS1kyTmhxY1ZWVTBobVZHb091ekx6eS91SmZNcDdOUkJ6dkZVZ1pu?=
 =?utf-8?B?OVpQejJ5Slphd3BQOHNjS2NRME56UzQ1S1JybUR0b3pBUHZidEV5MDVMdnBo?=
 =?utf-8?B?cnd1OU1GL3NHNm5EVlRVSnNXYUhGTC9OQlN5NzRVUDM4dU5BcUE3N0kvaUE5?=
 =?utf-8?B?YWcyWndob2VRTmpGdHNVcHhxVy9CbEF1V1RLQXFXNWVicG9Vd1AzZFY4VFp5?=
 =?utf-8?B?RVBRd0xsZHVDRTdveC9yWWFOZG9Ga1AxVTdETUkxeXFXQy83VnQ2Tk91bE9l?=
 =?utf-8?B?cU5qVzRsRDMyODJRVzhuYmpyMGQxaFRlVE5ncmpBZHZENWJ6RlB4UjhGWDFD?=
 =?utf-8?B?RldhUnBxdHlVYUN3UjZiQURSMjlMZjFCSDloeTd4VmYwS280bDdldHlISWkw?=
 =?utf-8?B?d09zdHNuVWt4TWNMUnlkL3dQL3R4bHV6bVhwTjJvUDVKcEZ3ajY4aFE3RTRl?=
 =?utf-8?B?TUJOZThEeFVINVJXRTNXdEVYbVRWdS9LSmtuZmVzZXJYRXllYmh2RzV5RGdR?=
 =?utf-8?B?ZUxMZGh3UmRFemdHWWFRVGZwREpjZXIwY0VEUmUvZ0lSZWlmM0JkOUxLbVdL?=
 =?utf-8?B?b3ZNOGg3b1hLTHdVYW1ETmxiVUp0ZUlpWk5wekdJVmNDNlh5WlJuckxaeFZJ?=
 =?utf-8?B?dTN0YnpqN3ZnV3ZiSFV0bTYyeDk3RmJZYWxjdGROdlNDL0syMFRCdFFxd0hn?=
 =?utf-8?B?azQ5U2Joa3JKUzNqNml3RzltTCt6RzJYdVM4Q3k0U3QxZkJlN0RBQU9vUndi?=
 =?utf-8?B?ckMzYUV4MytFOEQybHRidjl3U29oazEyR09NMGFueEFpZ0x0VVVBZENoOHE2?=
 =?utf-8?B?V0c1Z0YyUGlJY09oUG5oeDNXODIwZFlULzcwdURSeFUvVDVxQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 512245f3-2f07-4cf8-3de8-08d88bc9ca96
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 13:56:47.7785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aDmvxmMHYJpogMLPcM51fuBbP1SYiqBx6s5T/UNj5BcqWLCJlllSiraRgQvyRtI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4334
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTAuMTEuMjAgdW0gMTg6MTEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgTm92
IDEwLCAyMDIwIGF0IDQ6NDggUE0gVmlsbGUgU3lyasOkbMOkCj4gPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPiB3cm90ZToKPj4gT24gVHVlLCBOb3YgMTAsIDIwMjAgYXQgMDM6MjQ6MzJQ
TSArMTAwMCwgRGF2ZSBBaXJsaWUgd3JvdGU6Cj4+PiBPbiBUdWUsIDEwIE5vdiAyMDIwIGF0IDA3
OjI3LCBWaWxsZSBTeXJqw6Rsw6QKPj4+IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4g
d3JvdGU6Cj4+Pj4gT24gTW9uLCBOb3YgMDksIDIwMjAgYXQgMDk6NDg6MDRQTSArMDEwMCwgQ2hy
aXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gQW0gMDkuMTEuMjAgdW0gMTc6NDMgc2NocmllYiBW
aWxsZSBTeXJqw6Rsw6Q6Cj4+Pj4+PiBPbiBNb24sIE5vdiAwOSwgMjAyMCBhdCAwNToyMDoxN1BN
ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+IEFtIDA5LjExLjIwIHVtIDE3
OjE4IHNjaHJpZWIgVmlsbGUgU3lyasOkbMOkOgo+Pj4+Pj4+PiBPbiBNb24sIE5vdiAwOSwgMjAy
MCBhdCAwNDo1NzoyOVBNICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+Pj4g
QW0gMDkuMTEuMjAgdW0gMTY6MTYgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6Cj4+Pj4+Pj4+Pj4g
T24gV2VkLCBOb3YgMTEsIDIwMjAgYXQgMDY6MTM6MDJQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPj4+Pj4+Pj4+Pj4gQW0gMDkuMTEuMjAgdW0gMDE6NTQgc2NocmllYiBEYXZlIEFp
cmxpZToKPj4+Pj4+Pj4+Pj4+IEBAIC0xNDMyLDE1ICsxNDc5LDE4IEBAIGludCB0dG1fYm9fc3dh
cG91dChzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCkKPj4+Pj4+Pj4+Pj4+ICAgICAgICBp
ZiAoYm8tPm1lbS5tZW1fdHlwZSAhPSBUVE1fUExfU1lTVEVNKSB7Cj4+Pj4+Pj4+Pj4+PiAgICAg
ICAgICAgICAgICBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggY3R4ID0geyBmYWxzZSwgZmFsc2Ug
fTsKPj4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgZXZpY3Rf
bWVtOwo+Pj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICBzdHJ1Y3QgdHRtX3BsYWNlIGhvcCA9IHt9
Owo+Pj4+Pj4+Pj4+PiBQbGVhc2UgYWx3YXlzIHVzZSBtZW1zZXQoKSBpZiB5b3Ugd2FudCB0byB6
ZXJvIGluaXRpYWxpemUgc29tZXRoaW5nIGluCj4+Pj4+Pj4+Pj4+IHRoZSBrZXJuZWwsIHdlIGhh
ZCBlbm91Z2ggdHJvdWJsZSB3aXRoIHRoYXQuCj4+Pj4+Pj4+Pj4gV2hhdCB0cm91YmxlIGlzIHRo
YXQ/IEkndmUgbm90IGhlYXJkIG9mIGFueXRoaW5nLCBhbmQgd2UgdXNlCj4+Pj4+Pj4+Pj4gPXt9
IHF1aXRlIGV4dGVuc2l2ZWx5IGluIGRybSBsYW5kLgo+Pj4+Pj4+Pj4gPXt9IGluaXRpYWxpemVz
IG9ubHkgbmFtZWQgZmllbGRzLCBub3QgcGFkZGluZy4KPj4+Pj4+Pj4gSGFzIHRoYXQgYWN0dWFs
bHkgaGFwcGVuZWQ/Cj4+Pj4+Pj4gWUVTISBOdW1lcm91cyB0aW1lcyEKPj4+Pj4+IFlvdSB3b3Vs
ZG4ndCBoYXBwZW4gdG8gaGF2ZSBsaW5rcy9ldGMuIHRvIHRoZSBkaXNjdXNzaW9uPwo+Pj4+Pj4g
SSdkIGxpa2UgdG8gY2hlY2sgdGhlbSBvdXQuCj4+Pj4+IFVmZiwgdGhhdCB3YXMgeWVhcnMgYWdv
LiBKdXN0IGdvb2dsZSBmb3Igc29tZXRoaW5nIGxpa2UgIm1lc2EgbWVtc2V0Cj4+Pj4+IGhhc2gi
LCB0aGVyZSB3YXMgcmVjZW50bHkgKH4gdGhlIGxhc3QgeWVhcikgYW5vdGhlciBkaXNjdXNzaW9u
IGJlY2F1c2UKPj4+Pj4gc29tZWJvZHkgcmFuIGludG8gZXhhY3RseSB0aGF0IHByb2JsZW0gb25j
ZSBtb3JlLgo+Pj4+IEZvdW5kIHRoaXM6Cj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZyUyRm1lc2ElMkZtZXNhJTJGLSUyRmlzc3VlcyUyRjIwNzEmYW1wO2RhdGE9MDQlN0MwMSU3
Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDNjZiZTNkMzY3ZjJiNDAxYjJlMjgwOGQ4ODU5
YmE0ZWUlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDA2
MjUwODM4MDg1MjMyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFp
TENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1w
O3NkYXRhPVgyejV6eHNCdmhYUXZtZDJvSnp1TjJZekRNR1puWVVmZjZxeHVKTCUyQmpMRSUzRCZh
bXA7cmVzZXJ2ZWQ9MAo+Pj4+IHdoaWNoIGRvZXMgc3VwcmlzZSBtZSBhIGJpdC4gVGhvdWdoIEkg
c3VzcGVjdCA9e30gbWlnaHQKPj4+PiBiZWhhdmUgZGlmZmVyZW50bHkgc2luY2UgdGhlIGNvbXBp
bGVyIG1pZ2h0IHRyZWF0IGl0Cj4+Pj4gbW9yZSBsaWtlIGEgbWVtc2V0KCkuCj4+PiBJdCBkb2Vz
bid0IHRoZXJlJ3MgYSBiaXQgb2YgaW5mbyBvdXQgdGhlcmUgb24gd2hhdCBoYXBwZW5zLCBpdCBy
ZWFsbHkKPj4+IG9ubHkgbWF0dGVycyBmb3Igc3RydWN0cyB3ZSBhcmUgcGFzc2luZyB0byB1c2Vy
c3BhY2UsIGJ1dCBpdCdzCj4+PiB1bmxpa2VseSB0byBtYXR0ZXIgaGVyZSwKPj4+IGJ1dCBJJ3Zl
IGNoYW5nZWQgdGhpcyB0byBtZW1zZXQgaW4gbXkgbG9jYWwgdHJlZSwgYmVjYXVzZSB3aHkgbm90
Lgo+PiBTdHJ1Y3RzIHBhc3NlZCB0byB1c2Vyc3BhY2Ugc2hvdWxkIHJlYWxseSBoYXZlIG5vIGlt
cGxpY2l0IHBhZGRpbmcuCj4+IE9uZSBvZiB0aG9zZSBob3cgdG8gYm90Y2ggeW91ciBpb2N0bCB0
aGluZ3MuLi4KPj4KPj4gVGhlIG1haW4gcHJvYmxlbXMgd2l0aCBtZW1zZXQoKSBhcmU6Cj4+IC0g
aXQncyB1Z2x5Cj4+IC0gcGVvcGxlIG9mdGVuIGdldCB0aGUgc2l6ZW9mIHdyb25nCj4+Cj4+IEkg
Z3Vlc3MgdGhlIGxhdHRlciBjb3VsZCBiZSBhbGxldmlhdGVkIHdpdGggYSBjcHAgbWFjcm8gdGhh
dAo+PiBkb2VzIHRoZSBzaXplb2YgY29ycmVjdGx5IGZvciB5b3UuCj4gWWVhaCBpbW8gbm90IHVz
aW5nID0ge30gYW5kIGluc3RlYWQgaW5zaXN0aW5nIG9uIG1lbXNldCBpcyByZWFsbHkgYmFkCj4g
dy9hIGZvciBub3QgcGFkZGluZyB5b3VyIGFwaSBzdHJ1Y3RzIHByb3Blcmx5LiBtZW1zZXQgaXMg
b25seSBvbmUKPiBwbGFjZSB3aGVyZSB0aGlzIGdvZXMgaG9ycmlibHkgd3JvbmcuCgpJJ20gbm90
IGEgZmFuIG9mIG1lbXNldCBlaXRoZXIsIGJ1dCB0aGVyZSBhcmUgbW9yZSBwcm9ibGVtcyB0aGFu
IGp1c3QgCnRoZSBwYWRkaW5nIGluIHRoZSBVQVBJLgoKSSd2ZSBzZWVuIGF0IGxlYXN0IHRoZSBm
b2xsb3dpbmcgaW4gdGhlIHdpbGQ6CjEuIFVBUEkgaW5mb3JtYXRpb24gbGVhay4KMi4gSGFzaCBh
bmQgZmluZ2VycHJpbnRpbmcgZnVuY3Rpb25zIHJldHVybmluZyB1bnN0YWJsZSByZXN1bHRzIGV2
ZW4gCndoZW4gYWxsIG1lYW5pbmdmdWwgbWVtYmVycyBvZiBhIHN0cnVjdHVyZSBhcmUgaW5pdGlh
bGl6ZWQuCjMuIFZhbGdyaW5kL0tBU0FOL0NvdmVyaXR5IHJhbmRvbWx5IHBvaW50aW5nIHRoaXMg
b3V0IGFzIHByb2JsZW0uCjQuIFRoZXJlIGlzIHRoZSBkaXNjdXNzaW9uIGlmID17fSAobm90IElT
TyBDIGNvbmZvcm0pIG9yID17MF0gb3IgZXZlbiAKPXt7MH19IHNob3VsZCBiZSB1c2VkLgoKTXkg
cHJlZmVyZW5jZSB3b3VsZCBiZSB0byBqdXN0IHRlYWNoIGNvbXBpbGVycyB0aGF0IG5vdCBpbml0
aWFsaXppbmcgCnBhZGRpbmcgaW4gdGhlIGtlcm5lbCBpcyBhIHVuZGVzaXJlZCBiZWhhdmlvciB3
aGljaCBzaG91bGQgYmUgYXZvaWRlZC4KClJlZ2FyZHMKQ2hyaXN0aWFuLgoKPgo+IEkgdGhpbmsg
Zm9yIHRoZSBnYWxsaXVtIHN0YXRlIHRyYWNrZXIgaGFzaW5nIGlzc3VlIG1lbXNldCBpcyBwcm9i
YWJseQo+IG9rIG90IHVzZSBmb3IgdGhlc2Ugc3BlY2lmaWNhbGx5LCB3aXRoIGEgYmlnIGNvbW1l
bnQgZXhwbGFpbmluZyB3aHkuCj4gQW5kIHNvbWUgY29kZSBhc3N1cmFuY2UgdGhhdCB0aGUgbWVt
c2V0IGlzIHRoZSBzYW1lIGxlbmd0aCB5b3UncmUKPiBwYXNzaW5nIHRvIHRoZSBjcmMgZnVuY3Rp
b24gYW5kIGFsbCB0aGF0LiBCdXQgYW55d2hlcmUgd2VyZSBpdCdzIG1vcmUKPiAobGlrZSBhbnl0
aGluZyByZWxhdGVkIHRvIGFwaSwgd2hpY2ggdGhlIGdhbGxpdW0gQ1NPIGhhc2hpbmcgaXNudCkg
eW91Cj4gcmVhbGx5IHdhbnQgdG8gaGF2ZSBubyBpbXBsaWNpdCBob2xlcyBhdCBhbGwuCj4gLURh
bmllbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
