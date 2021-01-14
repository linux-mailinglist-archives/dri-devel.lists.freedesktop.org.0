Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0903A2F5C56
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 09:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FEA89316;
	Thu, 14 Jan 2021 08:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C90889316
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 08:23:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OVMTjwDa8zgea2pKn3RRBNFAnpfWUEN1o84uzQlM3eiP2VEiSyVPRfTdvougIRrtBdfrSM1biJiN1aDouL6Pz8rpXqPctNCj5nyKRYA2VPmC3aGZH6EeZ1oBStLh3Ze1arA3P0csTKm7ktPXQHheK2YJRJl+YVte4t4RoJ67d+cSLMiihbUMvuUIEfkjMuefc3GDFdtac6GZXhPgGdVQdKjeGI6vn0+yhEIwiDd9ILKV1Dx1iCp6EsZKPPWF6Nvu7rmLLv7sW1ZanwBm6lmZD7VoWviaQtwGgKdr0b9ND8NA9z0w2Ew5iarw4LLuu7Z2VcTzdwl+ez42ruvJfIAS+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsiT/BhMdSrYF8V8kTkACwqJGDtizIIpW1uCroG6d+o=;
 b=T3PDSN4FykOO5gDybMMlzbNqUUJpgJi+dTHwMZbSVxiTDb2j04Qbw+mErvFSjqGOq8QLe5W/i8uDVL/oxeDPZjbEbKm54slvHOx1o0fa1SgN8WyRkNqOLpWFSMHtoYxV28qUFKR/2N4B22+I0oKvfPuPVOnbHaR62YsifDPrkuauSS+/Iho+0u9k1MwDs9+ZkdYJf77bF8alLv7gEWcDRkztUqthdrRGrqFbh2Tq70+1RwSmZyUPHyRSkAORjeKQXNsh7Mv2jJzbilM+4Iio32O7zP3+9mLhiN4Hdnuiem/H2E9Znq+6YAaSLqWspRk9OLnjs/zWGW5ceV24r7LAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsiT/BhMdSrYF8V8kTkACwqJGDtizIIpW1uCroG6d+o=;
 b=NZsP/Th2Ee35at9DGkts1COCXWVCB4LUWgBK77bYuIs3veZEZ8ALdM8x1d1OVEsYtCcWAMeKcKMbEthArFcx1eRQRnlQuy9D9RwwJYu9Vbu37702L8+QGzd87uNQ89/X5DFFS5n0GCR0vXQSE+S43cjz5Wnp6BOarkntOQouiZQ=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Thu, 14 Jan
 2021 08:23:40 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3763.011; Thu, 14 Jan 2021
 08:23:40 +0000
Subject: Re: [PATCH] drm: Include <linux/mem_encrypt.h> in drm_cache.c
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20210114080535.17132-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <52cbf649-8c19-d4e8-152b-cd0946e1aba8@amd.com>
Date: Thu, 14 Jan 2021 09:23:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210114080535.17132-1-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR05CA0076.eurprd05.prod.outlook.com
 (2603:10a6:208:136::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0076.eurprd05.prod.outlook.com (2603:10a6:208:136::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Thu, 14 Jan 2021 08:23:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3d10a49e-e7df-4279-627d-08d8b865b2f6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4224:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4224411C9DE7481B58CAF45283A80@MN2PR12MB4224.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tTobefUAfulgAjlqcRxQDWxczDTBO4syiDz5dGftXtr+9caEwIi1D6PN3OOPYwv5Mrn0tt1dr6UvMpvp4UUOldDh6XdT3RAKELlzphYulgfUqo9kAEg2/iqBqVE7Rnj9e/Rq+tUZTUmA1tdmc/23updNppqyHTbVZetlVGLljX4N2bGvL0ZsoALO20nrcB9cmrKmZ6Tlcbgsuwd1bryW3xdOJcq8F96HXdYzpQSG0QnJc0vTsEydXSr7d32YFdxR6P47Xwyc6iPwnozNUv4o8hCo32zNnGvjR3MYdVPzIB0iCyl8oVHKVPVfmJa+mK+KUA1W6QJyen0FF+j7LV1qyDFInprJZ7bbqjv77J0LCUAZgu+ywckVgwG8amuXAnMdNPjtgASCrE3KcGrNTri79hGlxNEhdSb+Tio/tCdoTjFyTolsYHNHxZ/r2Fygpqv2h3T4tJLcKurR605dzIFeiWswwcIlLtgGl2etXSAshMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(2616005)(86362001)(5660300002)(36756003)(31686004)(6486002)(478600001)(54906003)(83380400001)(316002)(52116002)(186003)(66946007)(66476007)(66556008)(2906002)(4326008)(8936002)(16526019)(8676002)(31696002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZXlmL3d6YU83d2Q5R2ZaeE51eTlEUzYyNzlDV1VEYkM4NW9nR2JjMHMyTk1B?=
 =?utf-8?B?ckZneUtuUm56WFRHRERmY0gzVlFIMWJLR3J1RlNYWUY1QUlwYk04MDhuOUxj?=
 =?utf-8?B?ckJtV2U3ZWlZUnAwTmJieEZIQVlRWm84aEhVN3hxd1ArVEM1RE5aT2djYkFr?=
 =?utf-8?B?Q2JPSWtTb1dKYnVLNEFnR3RmYzJnWUMwWDZ0UmJ0Y3pRbWZiYzFmbDVGWWpG?=
 =?utf-8?B?dzZPV2RweWpzTytVMDJMTDMycDA0SUthKzZJNENBLzF4QkZZSFdXU29kQmtZ?=
 =?utf-8?B?S0tZd1d1STlkaUpTdHJKV3laOFdLY2grcm5LWndhMWNzR1kydVhNa3RlOGN5?=
 =?utf-8?B?UkxlYm9VRkIvMlR3eGcrbUdRVXZDVkhDOUNuNzZwMFhxREdOa2kzR2VLeXo1?=
 =?utf-8?B?OW5OTEc2bGRCMGVKaDFxRElKK09HVTYwc092R1FOS1k5bDErOVNRNG1SQkp4?=
 =?utf-8?B?aFl0R00raTc2eTd2Wkp4TFJtTnQ0NFdaaFBmb2ZzZ2pwNlo2Y2VIczlnVkJy?=
 =?utf-8?B?a0lnOTZKU3ZUZUd0VkxpVXJIeFp0UlM3UzNmMXBCdlQ5U0xVdHlBMFllcEpG?=
 =?utf-8?B?MFRxbG9ZMFp2dVZVSXlqbU1DcDJ2UE45MFVWc0pkZHFQYXp2MTE1SWU3N29X?=
 =?utf-8?B?OUZYVHRob2RlWlF0MElWb01DSzdhd2x0ZVQ4TU9GakNwc0owaVUrYldmZEV0?=
 =?utf-8?B?MmdLTWh2aUVOV3BJc3BvQ1ExcnF5bXk2UmZCQytXeWJrR2tiSnZrWlIvaXpG?=
 =?utf-8?B?R2xleHFYYk91a1VKV2F4cDF1RE15UjVrZ2M0cWkzaWQxNWVmZWY3VXFUY3lZ?=
 =?utf-8?B?blZVTDZoLzFKZkg3enpia3NBWDIyT1JMNFRCUE0wbmdDRE45VDdJdVMrUith?=
 =?utf-8?B?UWFOZUd3a3RzaU85ZlF0RlhyZzVEU2RFSzdheC8wbFRwWFJLQlNUQ095UFZG?=
 =?utf-8?B?NkZxWWdTT0lybjMyUWI0cWtka3N0WW9lSnZKMVFDclo5bWlDc2NJcVh0TDU5?=
 =?utf-8?B?OUtwTHFMMTJzUUV2dGd4Y0licW45S2pRUU9tWkpuZWlmN3FqS25lbzJHOEQ0?=
 =?utf-8?B?SlgwTXNTUGZEcXVFNnFncURtYXJ3c1ZCQzAwWXpISXpwUHFyQm1FbDlyV0VZ?=
 =?utf-8?B?Ulg0bmVEVkJFRXExaXN3TGd0Rm1qYndVNnd4S0pUTVBhWEtEcmg4b2FjeVor?=
 =?utf-8?B?RGRicTJZYXNFaUNhNTJkZ0V6SVNUN2QwM3dhSUd3eVA0cXB1bnYrSi9GcjR6?=
 =?utf-8?B?eFpJRllTbEJjbGdkNzUvUWgxTzFDYm1IQzJKV3RZMERYMUp4dDdqNko3eENT?=
 =?utf-8?B?TW9FUkdhUjczWW52c3A4V1NKaytSdnZYbVl5aTZXRXZVLy9LOVAzLzY0cjhQ?=
 =?utf-8?B?RHhNMmZvWkErT2srVkRqT1g2NGdDaHRVak1SZFlUOG5CT3R1OVN5L3ZmcnNJ?=
 =?utf-8?Q?ImaqjvIf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2021 08:23:40.5525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d10a49e-e7df-4279-627d-08d8b865b2f6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Im0W4BmzY0TQyb7IXoMMM+rDEERlngAyb7TH0zdUzzCNUy1uuchBM6GtILTwpwh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDEuMjEgdW0gMDk6MDUgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBUaGUgZnVu
Y3Rpb24gZHJtX25lZWRfc3dpb3RibCgpIG5lZWRzIG1lbV9lbmNyeXB0X2FjdGl2ZSgpIGZyb20K
PiA8bGludXgvbWVtX2VuY3J5cHQuaD4uIFRoZSBpbmNsdWRlIGdvdCBsb3N0IHdoZW4gcmVmYWN0
b3JpbmcgdGhlCj4gY29kZSByZWNlbnRseS4KPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IEZpeGVzOiAzYWJjNjY3MDYzODUgKCJkcm06
IEltcGxlbWVudCBkcm1fbmVlZF9zd2lvdGxiKCkgaW4gZHJtX2NhY2hlLmMiKQo+IFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBDYzogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+IENj
OiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwoKWW91
IGFyZSB0eXBpbmcgZmFzdGVyIHRoYW4gbWUgOikKClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJt
L2RybV9jYWNoZS5jIHwgMSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2NhY2hlLmMKPiBpbmRleCA0OTU1MWE3ZmEyMmYuLjc5YTUwZWYxMjUwZiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NhY2hlLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2NhY2hlLmMKPiBAQCAtMzAsNiArMzAsNyBAQAo+ICAgCj4gICAjaW5jbHVkZSA8bGlu
dXgvZXhwb3J0Lmg+Cj4gICAjaW5jbHVkZSA8bGludXgvaGlnaG1lbS5oPgo+ICsjaW5jbHVkZSA8
bGludXgvbWVtX2VuY3J5cHQuaD4KPiAgICNpbmNsdWRlIDx4ZW4veGVuLmg+Cj4gICAKPiAgICNp
bmNsdWRlIDxkcm0vZHJtX2NhY2hlLmg+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
