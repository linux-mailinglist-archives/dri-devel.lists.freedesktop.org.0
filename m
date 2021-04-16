Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCC6362175
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 15:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E386EA83;
	Fri, 16 Apr 2021 13:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2040.outbound.protection.outlook.com [40.107.95.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127BB6EA4F;
 Fri, 16 Apr 2021 13:51:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CnEZk0R13JJ9lUGGNYWBAYL25eQ6oi7w2aihDbg4R+jH/QA1BFPBjS4FSHMr9jSZNIuZDMBtW9LERnMM3L3MEvqCGlnWKGV05t1o8GyErIymN/NQKyZ7Wp9cyD9+MntQN0xN4rkctX/QbpXt+j7y5HajavNeVTFKw8Oi/6W9RaB4LvvG/PfpREcBqPpw4aKWPGPCGxK5DdsaPLY6euj/Pmf2g5cerDdxv+QF9/R/hXaZDCm0Ci4GY93bikz25CL3DTXH5uHQ97cA5Xa0nanUDjG6L7TH0Ll/buczXghOXPopKmVtgu9FqFcEtMQqh5WpcWMOS1r8Ka5q92MRuW7g3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygG2dcJwj+pm8/CFnmVx7XD5x9O+JM3kpYMNlBxGs/8=;
 b=hUEQMr2yMP68li06bxBamz04zKWextO9fN04+lZGQdSuijPGaNg/vxZPa1kFrKsFilY2RAkCWDi9JsSfuic9vb9P1WkQ+XfVd6weoFEmIAxJ7BDbvsQr72T2fluFLuVVmpZHk3i9kpsbOqdHCI4q4ZQMB7atC6uYb2qIMocsOfMQezYFPV/8GexeVB7VGESgtz/sgxLNApY8+SWA867p7w8cZZF94gWXSNFWNyKPviocly9DuNKFPweIhJUTrFS+Er6Ti3wGcWY8SmeBN7LMyANj8/OfgoITIOYXMbzBkF+q474nL+QhgdnIVhdcBmPDqekZMH+rVvA4eOFL4GeLyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygG2dcJwj+pm8/CFnmVx7XD5x9O+JM3kpYMNlBxGs/8=;
 b=HVPy1bLJSGGiYHtJy9Dft/xa5yb86Ddoz5UPkF4iERD6YT5ylBK1SCi5IX5wsH/EmxpFfCiit3HevdEXGJcG3BvBWgmwBQYCys2pThdK0Bv2ySRC/bMxc5TPoBFqlzoWYbGotzzQBTmgk+7NTERzPcWXZSKy5vGMKSMs7KTjrKw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 16 Apr
 2021 13:51:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.025; Fri, 16 Apr 2021
 13:51:32 +0000
Subject: Re: [PATCH v3 5/7] drm/vmwgfx: Inline ttm_bo_mmap() into vmwgfx driver
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
References: <20210416133146.24825-1-tzimmermann@suse.de>
 <20210416133146.24825-6-tzimmermann@suse.de>
 <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <80012c09-6975-f694-420f-72b2236dcf4e@amd.com>
Date: Fri, 16 Apr 2021 15:51:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <b7008944-fbe5-bd59-d2a9-ff62bea38237@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:6a8a:26d6:7403:5ada]
X-ClientProxiedBy: AM4PR0101CA0053.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::21) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:6a8a:26d6:7403:5ada]
 (2a02:908:1252:fb60:6a8a:26d6:7403:5ada) by
 AM4PR0101CA0053.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 13:51:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 759307d3-36bf-4934-ea10-08d900debe47
X-MS-TrafficTypeDiagnostic: MN2PR12MB4061:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40615AA8001C92A12E6433C5834C9@MN2PR12MB4061.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lw2nPRegWEmUMeiMczX1b193b5nAGFF8wia8T+dxvUtnrnYPtm8Vfbhd6suZTM53RYQ5AWIIdHTO+bZKlor0PW+hSrrlCJjldAXfXQoua6ttSYrgVORmyBd6vAi+96CUO9Ed/9aCtVJusKYqxKmSJuF7ExshnH9RGFixKgWu0ZSvuvcde3ulMzm2+CQhpGyuuCHq6XQk7sr6WVMVz2p752g5Q6C8w7amcfX6ltbNPGIMbp/g35EYPeUHvqN2Bpp1efUFzDkqTwbwo3tSn4IXjr07LDBjPC33A5ShqyKCR/lf8U73Vfj/yLdCVyrfzFOrpkrVfodPw1XJRiyejd/lvUcxtec0DXryj7whx1GY21ETX6hvesg+zNlTk04mXopMuS/WtPOdfPcGTUAEUXU5bMsLJTZgUjsNflj8EgXZpF+L0jmKel7poWXOGTPhvk0F4pLx/6DolFjwn8emku5nK1QVln+oSZ8yHLqqAUkZYaEHite325Xsaab50LFoL/fBMcmKFQEN//gMh/TTwfjYt2ugLdcChtv0c4JsQj7LwaASBCMqGpXKwb+pZfAmk7RsLvux6c/RMDIOKSmym7GHflXMbkGZtgx+OeEOnK0MzH9VEsFlNk3eZ4NCoBTqJnsoU1XU/o4f1R3QSYWXYRXraMQZ04wgQJvCP0ofKkAUvCxtqSjRGVj6UiFoybga3PTDkjuKb2MgyxR/Uf7GKEEAJA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(6486002)(2616005)(4326008)(8936002)(8676002)(66556008)(31686004)(16526019)(110136005)(66574015)(66946007)(478600001)(66476007)(6666004)(2906002)(83380400001)(31696002)(5660300002)(36756003)(6636002)(52116002)(7416002)(86362001)(921005)(186003)(316002)(38100700002)(40753002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bXN5RHgwcVdYY2wvdjRaNVRqaXpQNWxaa25MYW5HV091UlZEUUNyT2UvVUtJ?=
 =?utf-8?B?bzRuQ2F6MlFZN3UvQVkyTjBHTW0vYnVudVNWeEF6Y2hmTGc1YnFmWVhVQ1pu?=
 =?utf-8?B?VU9YUm5RcnpMcU1nWVdMdVIraTR1N0lqUzV4QW1QdUdsRGF3cG9zQTk2NTF1?=
 =?utf-8?B?eHY2czdSblY1ckxNUW1JSzU1amJEbE5HTFZCMFdLTDlVMXM4QkUzN21OSktG?=
 =?utf-8?B?bVl3TDBnZmx5UmlHM09RZjlhNU9NeHN4VDBMVlREZy85RVlYT1owWUhkOE16?=
 =?utf-8?B?VTNQMHA0THc4bmJkNFVsbzBBLzlBYkhQZFhxRGRhODJ1Qzk2YlJmYnozYWZo?=
 =?utf-8?B?ay9Fb1VlL0JWaUN4Y0Fmd0NBSDRDcWhrSG00djBtYmxueXd1Rm9mN042cnVy?=
 =?utf-8?B?RHlNZmhsOWRjN3hnL2JkSWJVVXhlV1JNTEhsQU9ac2tlWHV2aFNhbldnbXoz?=
 =?utf-8?B?ZU5taXhYdWtNL3V5WGFQUGVLVGVSRzcxd0xSb1dSemg0SWtBZjlhQ0trS0dT?=
 =?utf-8?B?QU1ZY2ZzMWlwc09wb0tFQTVzWjJycjlNRGxsUkdUQmFRL0o1ZVNZdHZ0ZGZM?=
 =?utf-8?B?T1NSWm12RG5URWJoT2dYc1dRaGZrR1NQRUtKeW1EMmUzdVJPWGR3RVlta1cz?=
 =?utf-8?B?YnlnY3EzOEhUelR5WVZlRWlnUExXZVljVnAzZTZkSHFBZVFDdHhwNm11ZUVq?=
 =?utf-8?B?TzQ2TlhhZjYvdFVrV3k0cEd3TkhMajNZYjllR3pxbTFIOFNxZ2toNlIxdFlV?=
 =?utf-8?B?cUtVOFl5cXdJNlVURjFQSUdsL3lMSXAzczkrdzM2UGhyWG1QMVZNRGIzQWR5?=
 =?utf-8?B?SGpLQnprU3lTMW12bjlRL0g4MjZrUnI4WGhrT3NKYm03cjYzTVBOUlVsOStS?=
 =?utf-8?B?TDE0S2JXZyttbFRtNExUdDJFNFI0Z1ZoQlJOdXJURU9sR0ZSTVd6L1BoOHNY?=
 =?utf-8?B?aTdNcUZrS2dyYkNLZGl2KzFuQ1Q4cmJ1MjQxUlliRWN4ekVVYTduc0xvajhS?=
 =?utf-8?B?WWw1bGtENFpyNHVaOEZoYTMwRHZXZ2U5WUprcng3MXVGQlQ2c2ppNG5oTEY3?=
 =?utf-8?B?cGxPcldBRkF6elZlN3I3ZFRMTngreklTSllBZXJaVjVjVjgwV2FURWxKcEFt?=
 =?utf-8?B?SnNVUERzdndyUmhUYmFQSFEvKzJHemZYK1BJUkZEQktGWTdSdG9QMlBVeHov?=
 =?utf-8?B?N0RqMi90Y1ZEcFFtY2lkRXpHdmFZbjBWczJjMEUzQ3l5empVZVRsSjNIOHRI?=
 =?utf-8?B?ZW1OVkVLMk5aNUlYaldJK1dpVGNWYXRHeERPSjQwblM5c3VPcGF6M0l0WXhM?=
 =?utf-8?B?UTQwemxsekxnMlhKVE9tb0dEOS9Qc3VQeTl6L21IeDRFUU5JZEZoZTNjdjU1?=
 =?utf-8?B?aWNZWTRxbGJnQjVSdTg0SkxqUE95SFNBS1YvemZvNVRTSFZqb2NyMnMwOGht?=
 =?utf-8?B?eGdteXUvRG1vd1dCaUJpbkdYYURhdFpsR2pJUzBIZkFBeWgzZ2VlMGRMVU0v?=
 =?utf-8?B?VVdvRHR3R21UcjFoMmx3eHhnNVZwbncwMWxMdEpHTy94OGxIS2hkeW1tTk5x?=
 =?utf-8?B?RXBhZWlvS2MwT2ZCNG5KVHJlVjNUbGZGMFR5NVBMM0NETjZmWUREMzRNUm4r?=
 =?utf-8?B?aWxqZ3lnTWhZcWNrQzRxMURtWnZUT1JzM1lWL0Ivd05wTmNacG54UmtORFN5?=
 =?utf-8?B?NnlycXljRXZxNTNyUmZNWWtpTXg0OWo2d3dRNFRaUmpOeWR6Tm9KZ1NISFJZ?=
 =?utf-8?B?a3p4blJQQzdKQ0lMRjEzYTQxb3dQQTk0Y3JrbHVaSXI4RmI3MElRS1RzV1pR?=
 =?utf-8?B?dkdYcVAwdER0SzcxazFyUU5ldUhDNUkwM3Y3dlVraVlRYXBKUlUzZ3Zxem5Z?=
 =?utf-8?Q?YB0zUy4Eu5jyG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 759307d3-36bf-4934-ea10-08d900debe47
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 13:51:32.7378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FCkbCj6PPUIh5G1se5QOnpMAu70dbYze5oiYPhb12lEUzzcR2ttOewWIpmCrcrV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDQuMjEgdW0gMTU6NDYgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDE2LjA0
LjIxIHVtIDE1OjMxIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46Cj4+IFRoZSB2bXdnZnggZHJp
dmVyIGlzIHRoZSBvbmx5IHJlbWFpbmluZyB1c2VyIG9mIHR0bV9ib19tbWFwKCkuIElubGluZQo+
PiB0aGUgY29kZS4gVGhlIGludGVybmFsIGhlbHBlciB0dG1fYm9fdm1fbG9va3VwKCkgaXMgbm93
IGFsc28gcGFydCBvZgo+PiB2bXdnZnggYXMgdm13X2JvX3ZtX2xvb2t1cCgpLgo+Pgo+PiB2MjoK
Pj4gwqDCoMKgwqAqIHJlcGxhY2UgcHJfZXJyKCkgd2l0aCBkcm1fZXJyKCkgKFphY2spCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+
PiBSZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4KPj4gLS0tCj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9nbHVlLmMgfCA1NiArKysrKysrKysr
KysrKysrKysrKysrLS0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF90dG1fZ2x1ZS5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9n
bHVlLmMKPj4gaW5kZXggY2I5OTc1ODg5ZTJmLi5jOGI2NTQzYjRlMzkgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9nbHVlLmMKPj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2dsdWUuYwo+PiBAQCAtMjcsNiArMjcsMzIgQEAK
Pj4gwqAgwqAgI2luY2x1ZGUgInZtd2dmeF9kcnYuaCIKPj4gwqAgK3N0YXRpYyBzdHJ1Y3QgdHRt
X2J1ZmZlcl9vYmplY3QgKnZtd19ib192bV9sb29rdXAoc3RydWN0IAo+PiB0dG1fZGV2aWNlICpi
ZGV2LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdW5zaWduZWQgbG9uZyBvZmZzZXQsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHBhZ2VzKQo+PiArewo+PiArwqDC
oMKgIHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYgPSBjb250YWluZXJfb2YoYmRldiwgc3Ry
dWN0IAo+PiB2bXdfcHJpdmF0ZSwgYmRldik7Cj4+ICvCoMKgwqAgc3RydWN0IGRybV9kZXZpY2Ug
KmRybSA9ICZkZXZfcHJpdi0+ZHJtOwo+PiArwqDCoMKgIHN0cnVjdCBkcm1fdm1hX29mZnNldF9u
b2RlICpub2RlOwo+PiArwqDCoMKgIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSBOVUxM
Owo+PiArCj4+ICvCoMKgwqAgZHJtX3ZtYV9vZmZzZXRfbG9ja19sb29rdXAoYmRldi0+dm1hX21h
bmFnZXIpOwo+PiArCj4+ICvCoMKgwqAgbm9kZSA9IGRybV92bWFfb2Zmc2V0X2xvb2t1cF9sb2Nr
ZWQoYmRldi0+dm1hX21hbmFnZXIsIG9mZnNldCwgCj4+IHBhZ2VzKTsKPj4gK8KgwqDCoCBpZiAo
bGlrZWx5KG5vZGUpKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBibyA9IGNvbnRhaW5lcl9vZihub2Rl
LCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJhc2Uudm1hX25vZGUpOwo+PiArwqDCoMKgwqDCoMKgwqAgYm8gPSB0dG1fYm9f
Z2V0X3VubGVzc196ZXJvKGJvKTsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDCoCBkcm1fdm1h
X29mZnNldF91bmxvY2tfbG9va3VwKGJkZXYtPnZtYV9tYW5hZ2VyKTsKPj4gKwo+PiArwqDCoMKg
IGlmICghYm8pCj4+ICvCoMKgwqDCoMKgwqDCoCBkcm1fZXJyKGRybSwgIkNvdWxkIG5vdCBmaW5k
IGJ1ZmZlciBvYmplY3QgdG8gbWFwXG4iKTsKPj4gKwo+PiArwqDCoMKgIHJldHVybiBibzsKPj4g
K30KPj4gKwo+PiDCoCBpbnQgdm13X21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKQo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgc3RhdGljIGNvbnN0IHN0cnVj
dCB2bV9vcGVyYXRpb25zX3N0cnVjdCB2bXdfdm1fb3BzID0gewo+PiBAQCAtNDEsMTAgKzY3LDI4
IEBAIGludCB2bXdfbW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IAo+PiB2bV9hcmVhX3N0
cnVjdCAqdm1hKQo+PiDCoMKgwqDCoMKgIH07Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGRybV9maWxl
ICpmaWxlX3ByaXYgPSBmaWxwLT5wcml2YXRlX2RhdGE7Cj4+IMKgwqDCoMKgwqAgc3RydWN0IHZt
d19wcml2YXRlICpkZXZfcHJpdiA9IHZtd19wcml2KGZpbGVfcHJpdi0+bWlub3ItPmRldik7Cj4+
IC3CoMKgwqAgaW50IHJldCA9IHR0bV9ib19tbWFwKGZpbHAsIHZtYSwgJmRldl9wcml2LT5iZGV2
KTsKPj4gK8KgwqDCoCBzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiA9ICZkZXZfcHJpdi0+YmRldjsK
Pj4gK8KgwqDCoCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvOwo+PiArwqDCoMKgIGludCBy
ZXQ7Cj4+ICsKPj4gK8KgwqDCoCBpZiAodW5saWtlbHkodm1hLT52bV9wZ29mZiA8IERSTV9GSUxF
X1BBR0VfT0ZGU0VUX1NUQVJUKSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+
PiArCj4+ICvCoMKgwqAgYm8gPSB2bXdfYm9fdm1fbG9va3VwKGJkZXYsIHZtYS0+dm1fcGdvZmYs
IHZtYV9wYWdlcyh2bWEpKTsKPj4gK8KgwqDCoCBpZiAodW5saWtlbHkoIWJvKSkKPj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+PiDCoCAtwqDCoMKgIGlmIChyZXQpCj4+IC3CoMKg
wqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+PiArwqDCoMKgIGlmICh1bmxpa2VseSghYm8tPmJkZXYt
PmZ1bmNzLT52ZXJpZnlfYWNjZXNzKSkgewo+PiArwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVQRVJN
Owo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfdW5yZWY7Cj4+ICvCoMKgwqAgfQo+PiArwqDC
oMKgIHJldCA9IGJvLT5iZGV2LT5mdW5jcy0+dmVyaWZ5X2FjY2VzcyhibywgZmlscCk7Cj4KPiBJ
cyB0aGVyZSBhbnkgcmVhc29uIHdlIGNhbid0IGNhbGwgdm13X3ZlcmlmeV9hY2Nlc3MoKSBkaXJl
Y3RseSBoZXJlPwo+Cj4gV291bGQgYWxsb3cgdXMgdG8gY29tcGxldGVseSBudWtlIHRoZSB2ZXJp
ZnlfYWNjZXNzIGNhbGxiYWNrIGFzIHdlbGwgCj4gYXMgZmFyIGFzIEkgY2FuIHNlZS4KCkZvcmdl
dCB3aGF0IEkgc2FpZCwgY291bGRuJ3Qgc2VlIHRoZSBuZXh0IHBhdGNoIGluIG15IG1haWxib3gg
YXQgdGltZSBvZiAKd3JpdGluZy4KCldob2xlIHNlcmllcyBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKVGhhbmtzIGZvciB0aGUgbmlj
ZSBjbGVhbnVwLApDaHJpc3RpYW4uCgo+Cj4gUmVnYXJkcywKPiBDaHJpc3RpYW4uCj4KPj4gK8Kg
wqDCoCBpZiAodW5saWtlbHkocmV0ICE9IDApKQo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBvdXRf
dW5yZWY7Cj4+ICsKPj4gK8KgwqDCoCByZXQgPSB0dG1fYm9fbW1hcF9vYmoodm1hLCBibyk7Cj4+
ICvCoMKgwqAgaWYgKHVubGlrZWx5KHJldCAhPSAwKSkKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8g
b3V0X3VucmVmOwo+PiDCoCDCoMKgwqDCoMKgIHZtYS0+dm1fb3BzID0gJnZtd192bV9vcHM7Cj4+
IMKgIEBAIC01Miw3ICs5NiwxMyBAQCBpbnQgdm13X21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0
cnVjdCAKPj4gdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKPj4gwqDCoMKgwqDCoCBpZiAoIWlzX2Nvd19t
YXBwaW5nKHZtYS0+dm1fZmxhZ3MpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgdm1hLT52bV9mbGFn
cyA9ICh2bWEtPnZtX2ZsYWdzICYgflZNX01JWEVETUFQKSB8IFZNX1BGTk1BUDsKPj4gwqAgK8Kg
wqDCoCB0dG1fYm9fcHV0KGJvKTsgLyogcmVsZWFzZSBleHRyYSByZWYgdGFrZW4gYnkgCj4+IHR0
bV9ib19tbWFwX29iaigpICovCj4+ICsKPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4gKwo+PiAr
b3V0X3VucmVmOgo+PiArwqDCoMKgIHR0bV9ib19wdXQoYm8pOwo+PiArwqDCoMKgIHJldHVybiBy
ZXQ7Cj4+IMKgIH0KPj4gwqAgwqAgLyogc3RydWN0IHZtd192YWxpZGF0aW9uX21lbSBjYWxsYmFj
ayAqLwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
