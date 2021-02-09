Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8375314F7B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2C56EB1C;
	Tue,  9 Feb 2021 12:50:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750057.outbound.protection.outlook.com [40.107.75.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547456E97C;
 Tue,  9 Feb 2021 12:50:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/1iJw/xMkBambXhUobKKIzrQ2peiVaemhWzmZ/2aMPD3NHtHH/bEIosNTRZ4g7T5UxAwcl528GS1XS7EnOSpID7OgskDU5flrQD8z/2O+/6Fj3sEvepdP5RTf4nelqudOAwKQ7zPGlGylR/ypuV5P62fBZWLJqKLSaOB8vL+V2vRfTNq4RSFh20EPspnwgbXniRlog/PxQuENVQl8ANIQCz4/insmTazzWdnenvpkWrrrOhHE0DwMbIMOpUSbUllfC5d6dwmkwJuX039+GRCfEA/j7Qdyemtvcwsy/VscmFrO9n+MTWOUgk1skDxzJwiHFgC6vciMW37RDJb32JZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poi5RFVzcRIlY4SdI5Ywc6xpus5ppta43BrJFxxR6P8=;
 b=fb9dB3FBKmmTwvfb25rpwDPsXll863aCd99iAvFze1XVipmZVFFLQqMoWyHPE9AdlWCOf2ngePX1yNGS4bCEtdWIyxHMs2yLbpash26nOG5a4f4o47Sy5U7dU5LvVQDn13AMUtjdEs7R8Vy20r01wr10QE4W926/yjNhs2yWf3hJucXPWBxJTy2bMvEyHTeHBGKP8G1WPZ3NjdHsxAiSPjT3bZ9YfeFiy+xfAr06/dxWF5tWrbLVzDXxspWUESzLMv0eb04GyVzFn3KhLgKzLoXQQm6AbJfMDbi1CswwgFnGTdX7U2lpPQGxrjtOnUsjsdalEeUeJZQauSTKlpNE2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poi5RFVzcRIlY4SdI5Ywc6xpus5ppta43BrJFxxR6P8=;
 b=3VgJz3244d9JIxVOGxI8JJIitt0HJnyM3RhNXqymtkofN56cGxiI09ti33chJxp7HEyCqPU5q+QcU7wEhgIchQ6TB9Zp43IsiFhdYoOdtvZzMTs2/8+C9zfisbXqBLgrNuZSGmbBejDAS/nOVjW5UYcYYadP5iKK/tkqvFJXmS8=
Authentication-Results: linutronix.de; dkim=none (message not signed)
 header.d=none;linutronix.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Tue, 9 Feb
 2021 12:50:36 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 12:50:36 +0000
Subject: Re: [PATCH v2 0/3] drm/amdgpu: Remove in_interrupt() usage.
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 amd-gfx@lists.freedesktop.org
References: <20210209124439.408140-1-bigeasy@linutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <41d0f7db-c2b4-f618-42a7-da9f7cdb76b4@amd.com>
Date: Tue, 9 Feb 2021 13:50:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210209124439.408140-1-bigeasy@linutronix.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:444c:9a67:948b:2493]
X-ClientProxiedBy: AM0PR07CA0030.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::43) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:444c:9a67:948b:2493]
 (2a02:908:1252:fb60:444c:9a67:948b:2493) by
 AM0PR07CA0030.eurprd07.prod.outlook.com (2603:10a6:208:ac::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.11 via Frontend Transport; Tue, 9 Feb 2021 12:50:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f44312fc-a543-4b04-b0f6-08d8ccf94bb6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4112A708E20E06E38D892AAE838E9@MN2PR12MB4112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F8xfTky+FdVEJQhlkNGse+/eg2rVVPHKR/a7QuQV6r7JAAxh6RQ+m0npbvSUzAUzuWpaXs+chlW6Il1oIe55/zMCvK9+Qxc32BAIRQgMmYfwfiCb2u4RpLQ0fcMwQEktkAc25KVBbxbEMRW+aMQRORslP8u+OS8a7rg2Z5ZbHWVsSDZYU5t/oSN5QeNUu7G8h0BXwjYPwmeBMtavYSo+3eZy4Q8KejPnunf8O1w41ak7lUIH0IJUX+u36XXuwu+eMSK6zCnvg0qP3vAd2l3waLc3IU5X/HcdtbIMGrDWtSxgKSaiZdfrw+9lwNfS0irS47Avtv1lUl1DWx286zxStDgD8JQJkWQfp/MYGB4oHCh4YzPJOpzYkNpI+U/uggpjpcVWBU3xnkEGCR54Ob2FFj/NwRDP7U+naDQhd1cZy8i/kstoGuXWntm5K9LrHIcEkv3lWxKnVi7mRJqoADOb6CWre2hAdryf388pcr4x3wmR14KGsFA317nAPeVRUVd7wHUv9xXKiWWMgjSbrh84Xs/VD0JG9NToYaNiScqV7xutO+DdkEW6q3kLFuSYd6imAVRWmJHPe1t/sWOAJP1ftIAMAes2s8yM4ZPY5Uv8Tbx/L60yJXNruNgRC/YKvjSbHgOF939PYAe1TbHrf7Oduc41A41aXnsknKM08BgWsuWbLdwFj+5M4uxyXP+8uHcF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(31696002)(31686004)(478600001)(45080400002)(966005)(2906002)(52116002)(2616005)(4326008)(8676002)(5660300002)(16526019)(186003)(316002)(36756003)(66946007)(8936002)(66476007)(66556008)(66574015)(83380400001)(6666004)(54906003)(86362001)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VmFLelhPWFkwNHlxK3Q1ZkdFdHZ0c2V6VnNwNUo4VitJMUxlazZYTVZnNmJq?=
 =?utf-8?B?UzRITE1DSFhsNlQ1TkpkRDNBM3BFZHh6djExNmlCKytSVEErNm5RaTNReUtF?=
 =?utf-8?B?VlE2a1lhRkpoL1czQzh6cE1vK2VjczAvOTRWSU1lbE1NUTRvbjRjZUo1VUFh?=
 =?utf-8?B?L0RtZ01mQ3NEZ01xRkQ1V2lPS1BlY1VQVEpWUGUybmRZZmdsa3pRM3NrQzJt?=
 =?utf-8?B?RHZLSDlMa2RhVFRleWVhUDR2WmVQT3VOMVRMQUpESjlGZlV1dlpnUDArdHQz?=
 =?utf-8?B?Wk9kdjF3RTk4b25IUktUOU1HUkpqa2l2cnFaVExlVy9FK2NwaUthRktVYVcy?=
 =?utf-8?B?NWl2eXBjalVEVHdBaElITk9ISUsvSkFzVlVYWmNzVEZGQTh5cWYyK3RHV1JK?=
 =?utf-8?B?RHZ1eFhQS3ZXMjN6bEVMVkJaMk96ZjErcDdxOSt0dzd4T2JuMnYyOWlEUGJS?=
 =?utf-8?B?VHVCV2RUV1ZjNnRPSHFMWXlyMEJzd3JhK2ZaT3ZER2VRdFp3d1dSWVhpOFNE?=
 =?utf-8?B?Rkx3RUJzLzNGNW9NREN1VzNwT0pNSXBLZ3l0VDlVRlBMRyt6TWNsdVJDVDI3?=
 =?utf-8?B?L25sTUJDeVFBY0gwazNDVHIzR1FjK2w4ZXBWamRlU0xiMnBIQmh6WGp6QVlq?=
 =?utf-8?B?anNvYWlQaDFhYzErSTNrVE9pZWNwd0JmL0NkMWxveG1VdmY5MHJqWHVJT01R?=
 =?utf-8?B?V3lZaUE1U3YvNTB5VVJGK1RMbE8xR2k5QzJIdStiNnhPR29sb0ZnT1gvdkFF?=
 =?utf-8?B?M0wvWjI1YjNmNjNjbTI3aUFnYm5BcWM4Q0djWXQvVUw2ak5NR2M1UDFFcExC?=
 =?utf-8?B?VFNWLzhrZjBqY2hRemE0OFNFZ1JCYU5MODZIVHVtVGxKWUdzN2N5VW1QQUZp?=
 =?utf-8?B?K3ZodTBmcWlwQ3Nob3pHVVBuSVkreW1nRXNqWWxKTHlERHp3NHBvZ2IvYzJW?=
 =?utf-8?B?QUY3ZkQvVFBYbTJHOHkxdHlYbFFiYmRmUG9kT3dZa3FNVldzV1RCUkdmcnBG?=
 =?utf-8?B?Tkk5R2NzNW9mU01tZzJOdmJVV1c1Q2hQS05iUkY5NUhkNmptd0VjdEkyMURC?=
 =?utf-8?B?Z284ZmorMWczUlBLM1BHVHp6SDlWU1Arb2JkRWFrMURjYm5oSjI4YXZ2NXdC?=
 =?utf-8?B?NXYvU284TUpoZzUxc0NheDk2RWRyTHhOVENFR0Y5MTBFWWp2Tmg2YUVlOGtU?=
 =?utf-8?B?S0F4WHpydk1IZ1RWVEs2U1NZTGdld1p0SlRBTUhyeUZzZDdkT3VaR1pwK1Yw?=
 =?utf-8?B?VUVMZER1SEdTbnBsZGxzVXFwd0dYZUsxK09EbHByOHVIYi9YalY3YWFad0di?=
 =?utf-8?B?cVBiSUI3ZHdnRXcyKzNzZ3A3ZlJadnFoY1lNbWNKWW1TT095M3dKak4yMitH?=
 =?utf-8?B?SjQrYlV3Ym11ZDNsRUlzSjlUcVVwdzdjMjUrNDRFRTFJMlIzeEt6cEVxREl5?=
 =?utf-8?B?TGRwSzZWY1gxZnpQSDM4TE1wOUpLSlMyS2kyVUo5a3pmakFBdytBK0pwQlMv?=
 =?utf-8?B?VytEeGJWUktBYllFSi95RGJ6dXlROHNCbkllTWkzalluSkVQTFFBQzFIaDNs?=
 =?utf-8?B?YWdrU3FWekdOSlZ0YXlRaTdkM1RGYm11YnpXMHlkYVlSeEt5MDV5bzh0aFN5?=
 =?utf-8?B?QWk3Wlk3U1lIOFdiaHh0bGM3MmZGbnJFeG10MU9oWU8yNUNHcmNVNTVVNXVz?=
 =?utf-8?B?ZkZraHExU3B5NWtOcWhTL3o1YlU1Rml4TFR4TWx4dTZCTHlTM1Bta2FXb0dx?=
 =?utf-8?B?NHJPSXVSZEtqdGRGclF0RnA2YjZDdVh6UnJIdnAvdDZlbXhldlBHRHc3MHBX?=
 =?utf-8?B?VHUzVVU1cENjcG1aVUtqQmNSTE1qVm5zRGJpSEFzbFc4R2RkVk9paTNNRDUr?=
 =?utf-8?Q?APvCrOZeH78+B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f44312fc-a543-4b04-b0f6-08d8ccf94bb6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 12:50:36.4520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHOedH0ZYejgqG1weaP2UZ0UYiumWJJRIeK7iDiS0mYRRDMzPtW4j0CCAhmTKwkd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4112
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
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>,
 Thomas Gleixner <tglx@linutronix.de>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4g
Zm9yIHRoZSBzZXJpZXMuCgpBbSAwOS4wMi4yMSB1bSAxMzo0NCBzY2hyaWViIFNlYmFzdGlhbiBB
bmRyemVqIFNpZXdpb3I6Cj4gRm9sa3MsCj4KPiBpbiB0aGUgZGlzY3Vzc2lvbiBhYm91dCBwcmVl
bXB0IGNvdW50IGNvbnNpc3RlbmN5IGFjcm9zcyBrZXJuZWwKPiBjb25maWd1cmF0aW9uczoKPgo+
ICAgaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0
dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGciUyRjIwMjAwOTE0MjA0MjA5LjI1NjI2NjA5
MyU0MGxpbnV0cm9uaXguZGUlMkYmYW1wO2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWcl
NDBhbWQuY29tJTdDNjZjZmI0NDlmMGJhNDc1ZGQ3NmIwOGQ4Y2NmODdhODUlN0MzZGQ4OTYxZmU0
ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDg0NzE0ODc2ODYyMjgzJTdDVW5r
bm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxD
SkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPWcwNHNRb3F2Zmt1
SHpwbGlnJTJGJTJCT3J1cXpteXlwSWhhcXJrS1UweGVJSjgwJTNEJmFtcDtyZXNlcnZlZD0wCj4K
PiBpdCB3YXMgY29uY2x1ZGVkIHRoYXQgdGhlIHVzYWdlIG9mIGluX2ludGVycnVwdCgpIGFuZCBy
ZWxhdGVkIGNvbnRleHQKPiBjaGVja3Mgc2hvdWxkIGJlIHJlbW92ZWQgZnJvbSBub24tY29yZSBj
b2RlLgo+Cj4gSW4gdGhlIGxvbmcgcnVuLCB1c2FnZSBvZiAncHJlZW1wdGlibGUsIGluXyppcnEg
ZXRjLicgc2hvdWxkIGJlIGJhbm5lZCBmcm9tCj4gZHJpdmVyIGNvZGUgY29tcGxldGVseS4KPgo+
IFRoaXMgc2VyaWVzIGFkZHJlc3NlcyBwYXJ0cyBvZiB0aGUgYW1kZ3B1IGRyaXZlci4gIFRoZXJl
IGFyZSBzdGlsbCBjYWxsIHNpdGVzCj4gbGVmdCBpbiBpbiB0aGUgYW1kZ3B1IGRyaXZlci4KPgo+
IHYx4oCmdjI6Cj4gICAgIC0gTGltaXQgdG8gYWRtZ3B1IG9ubHkKPiAgICAgLSB1c2UgImJvb2wi
IGluc3RlYWQgb2YgImJvb2wgPT0gdHJ1ZSIKPgo+IFNlYmFzdGlhbgo+Cj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
