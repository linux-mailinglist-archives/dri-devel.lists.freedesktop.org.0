Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0962AF69B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 17:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1A16E08C;
	Wed, 11 Nov 2020 16:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728676E090;
 Wed, 11 Nov 2020 16:34:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FwmJVG0P113n5IenVD1T0JdmTtIW8pOF7znd+DZzRR4xIORjT8D2cLDLsHvcTJtbUT/eHJ6/9jyKzT0SE8PjVuL0cPbocaH7bpjp7aL2CcPU/vHkz2qdwfN1mfAdhhpWp8C6tiK+jtmSOpro0BkXCW8XR8+JXqdEI7zwFDhkrDa33dh9JVrJezFy7CvKo3tcslPaYpKOQusO7j9bePhQbh6goKGjrXnuTRguyyef9A9yiC2ST7+QTAv02HnNUjvPl55NLxe9H7ZjiIQUgY0uoCXtttSo911thDZCg/2cky5C7fr3XMyNANqULvJhaP42dDChVdJXcxIT+83ZtluThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00uxdocURm+/b+qplt7ZAwvi/HHGf/7+8WPK2W1QEcw=;
 b=bVU3EbZBsxQbBu3R7yR4+SisSUcPe3M9EFlXWJbTJn5n/cONwa8PmI61nYzDyrmq7N9AnwD25si0HkcCnXvXcQbsRYna0GDGi1vdAHaT4qzKMoP6ykeYvsvQwBH8VvMuRn9p3ZTk/OSrK2Qe4qdcNaI/Qb1XZBtAUs80NWWLF7rYEdlPQOBimlDorwNYcjyl7yLSq5vgFcKpqsIgNywD+fwudLaOXJHKiq+mbEj3EHhnpzjjNydNOd7YAxRHkuazr02lwNWV9XDlbQWFMYAvqYlspl2q24EK5AL8m2H+9DykfW/dpZaNUEhVN2ntlpn/JbmlXdLUliHiruC8PzT7FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00uxdocURm+/b+qplt7ZAwvi/HHGf/7+8WPK2W1QEcw=;
 b=NyodDdvSpVz2ekqiIDA8xKHHNqQpTk29AmUyzx71ONkKhEMMLofCRYEpGppJaFMvnHZa58CeOi1dQP1TXJPVMvkSwDQ2Ym6O5z5Nm9mnv1VOpHX9U9CzWqlr6jP50/nBoqlko9PRHmWTQLypoHM0AMOP/kPx0+nUs+kqRsezc8c=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3836.namprd12.prod.outlook.com (2603:10b6:5:1c3::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.27; Wed, 11 Nov 2020 16:34:11 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3541.021; Wed, 11 Nov 2020
 16:34:11 +0000
Subject: Re: [PATCH v2 5/8] drm/amdgpu: Refactor sysfs removal
To: Greg KH <gregkh@linuxfoundation.org>
References: <20200622164551.GA112181@kroah.com>
 <4787b2a9-e7bf-ea3c-02e9-484a4fcb4742@amd.com>
 <20200623060532.GB3818201@kroah.com>
 <090c5a35-3088-d6d0-dcaf-5ce5542a4298@amd.com>
 <20200624061153.GA933050@kroah.com>
 <c864c559-71f4-08a5-f692-3f067a9a32f8@amd.com> <X6rU6lKDCyl6RN+V@kroah.com>
 <9db66134-0690-0972-2312-9d9155a0c5d8@amd.com> <X6wEbtSDm69gzFbR@kroah.com>
 <dc348560-907c-1b7e-a836-7dea4017d4e4@amd.com> <X6wMHxypQttDDW3F@kroah.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <a483eaf2-2bcc-6b67-fc91-7d67e573ade9@amd.com>
Date: Wed, 11 Nov 2020 11:34:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <X6wMHxypQttDDW3F@kroah.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:7416:506d:efb6:9c79]
X-ClientProxiedBy: BN3PR05CA0016.namprd05.prod.outlook.com (2603:10b6:400::26)
 To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:7416:506d:efb6:9c79]
 (2607:fea8:3edf:49b0:7416:506d:efb6:9c79) by
 BN3PR05CA0016.namprd05.prod.outlook.com (2603:10b6:400::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.21 via Frontend Transport; Wed, 11 Nov 2020 16:34:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b0347895-59c1-4a6e-6423-08d8865f9e99
X-MS-TrafficTypeDiagnostic: DM6PR12MB3836:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3836C320C61BD222A97BA3AFEAE80@DM6PR12MB3836.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 33sq2wwyStJQY/s8FUpzZiRGPjw5RMUZu9wnJVP2gJ9oiGIf2rN/NPVoEKici1pxVST4ETCakFZ5xOOK8Uvu6II3GrBXrDoFsmJ2XEGeSZxYR7NdgXm11lSdejc4ZLd33TS4JLpuJhV9Ft3hY59AzCI3liLLOgB8jAKt/EnNfU0/wd1qtjA5t3nVYq2Zb0hm2EE1227UwmK9W/Ce9KWWifBL2niTQioC311O+wIEQr7Fg0Xy1ezcZzwIygAKjPgkAy7+lr9WIsHwbruCzVN+sTBEuqMnT92D1SZpZkTcsolLO7/BX0W/PMQ9f1RtInrOIWFkt5wvunpch0JPPinO6HXwfsMLlh2kRtfjcG28CgpPovJLVdSBAnXjVJ3kvy+cSnZuy2B/vrX3DJPLkOyT6/DoFlHFoSjRqwZmpdDR0FqhRTfInh/vjjlThXV+78c6dC/GWyPZv1BCNk4+yuCGGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(8936002)(186003)(66556008)(2616005)(36756003)(66946007)(316002)(66476007)(6486002)(16526019)(86362001)(6916009)(31686004)(4326008)(8676002)(31696002)(45080400002)(53546011)(966005)(5660300002)(52116002)(2906002)(83380400001)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TDYvZ29sWmtkMVFlYkxkMjFzRTBCaHZmaVpmdGo1YlhldlVzVThjYkRUcDdC?=
 =?utf-8?B?OWN4SGtIdUp4WUpvdjFNeGI1S0V6NThiZS9WWUdLYjgzVDRtQ2NZRURTcG5W?=
 =?utf-8?B?d1AyWHJMUFgwSVpLQ2tNNWI2UHlES295ZSt6RVV0ZUNhNWQ5RmQ1a2tSdStU?=
 =?utf-8?B?ZEVrSUdmcDZyVHNaTDl4eUVVWHV2elBJdmNIeTg4YUlIeWVqakZhMjAzSm9L?=
 =?utf-8?B?VVNMWWJqVFZnU2FWWE81Mjc3TWhnT1FGZUExQ1RhUi84OTVoK1UycTEvMVla?=
 =?utf-8?B?c0w2TG42cFJYM29MM2ZFRXZhTG9BYUpGOHQyNHFDNWJzS0o5T28wVlNWSzE3?=
 =?utf-8?B?MlAvYXZhSCtTbkVmQWxhRGF5ZTRmMHJFajRpd000YVFEZDlDNll4bVp1ZW1Q?=
 =?utf-8?B?cVlKUU1sMnYvVk0vSVg4djE3VmNEZTQ1a1liVXREYzlVZ1ZKS051cUxtaHRB?=
 =?utf-8?B?OUhrOE5UTFp5UVpyc3JvUTA4Zno0dVRDT3h3YTc5aEw0RXhPQ2dYK0t1UkRp?=
 =?utf-8?B?dCtzSldUd0lYeUJZckV4ODc2dm1sOXd0K2NUbXF4ZVhKUC90b1h2dldVYXpn?=
 =?utf-8?B?NkFpWkpZcjJWRnRTaEEwamR6NVFrcGlQU3hHelovYnhrTlRyRUl4UnJiYmJz?=
 =?utf-8?B?K0FHZ3hOV0VRMWRVSTZsVWVKK1VKK3I2SDNrbGV4TjE1aG5pRjhJdm8yUmh3?=
 =?utf-8?B?VWh6dnhsaWRMbENXb2RlUVJXYm5IT251Yi9oU2Q5QkNKRmJQbVpmRmRmWjFt?=
 =?utf-8?B?N3JSeVczNkdIdVZ2L1VIbU50SkVKVmN0dDUvbG5SMmhqNmRYUW5NRUp4UDV6?=
 =?utf-8?B?cjM4WjNMSnVtOUU3eHkwZm9CUnNCdzFmOTZVSFM4ZHFTTXV3UC9WY3RqZWNN?=
 =?utf-8?B?eWxPaDZZTlRMZ01ualJWSytoOHd6cTRBYmF6SVcrakFvZ1dLUWFEcnB0dzJQ?=
 =?utf-8?B?SDhaNllEQUNEVGJ4YzhZK0p5a3QyUHA5VnRLWkNuMzdKRlpJSEMvVTBFb25u?=
 =?utf-8?B?dmJzYWptQmkvdSsyZW5XWVZ2L3pvdlZEa0hrdjNoc1FjRUVJbW93NDMyL3cr?=
 =?utf-8?B?QTJVY05UTHorcTZxUGFQQlhRNUFRYk9hVGFUZWN6dW9sOUhhL08vbXd1NkQ3?=
 =?utf-8?B?VTF0MXA1UkV3TGdreDhtbEh1MDBhUzlmOXkyc3pVc3NpQzFjc2wrb1pva0xw?=
 =?utf-8?B?bDFpTnFFb1BRbFpOQVA5dnlncEY3T2xLU3U3VnV0TGN3Z3hrL1ZVWnNoVFJH?=
 =?utf-8?B?Y3A2cGpsOTk0ejRNb1JVVlNXZ055b1hYeWl5ZmJLL2o4Q3hiZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0347895-59c1-4a6e-6423-08d8865f9e99
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2020 16:34:11.5057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1S5w6bI/Pzpeow9Q3l6OAKZcBk9zHQzVinWblR+gDbe2YKMHWRcdoPp5a7RY9MBRIJAXvIIQ6PAOdfcaOqBcyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3836
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzExLzIwIDExOjA2IEFNLCBHcmVnIEtIIHdyb3RlOgo+IE9uIFdlZCwgTm92IDExLCAy
MDIwIGF0IDEwOjQ1OjUzQU0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+PiBPbiAx
MS8xMS8yMCAxMDozNCBBTSwgR3JlZyBLSCB3cm90ZToKPj4+IE9uIFdlZCwgTm92IDExLCAyMDIw
IGF0IDEwOjEzOjEzQU0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+IE9uIDEx
LzEwLzIwIDEyOjU5IFBNLCBHcmVnIEtIIHdyb3RlOgo+Pj4+PiBPbiBUdWUsIE5vdiAxMCwgMjAy
MCBhdCAxMjo1NDoyMVBNIC0wNTAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4+Pj4+IEhp
LCBiYWNrIHRvIHRoaXMgYWZ0ZXIgYSBsb25nIGNvbnRleHQgc3dpdGNoIGZvciBzb21lIGhpZ2hl
ciBwcmlvcml0eSBzdHVmZi4KPj4+Pj4+Cj4+Pj4+PiBTbyBoZXJlIEkgd2FzIGFibGUgZXZlbnR1
YWxseSB0byBkcm9wIGFsbCB0aGlzIGNvZGUgYW5kIHRoaXMgY2hhbmdlIGhlcmUgaHR0cHM6Ly9u
YW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzOiUyRiUyRmNn
aXQuZnJlZWRlc2t0b3Aub3JnJTJGfmFncm9kem92JTJGbGludXglMkZjb21taXQlMkYlM0ZoJTNE
YW1kLXN0YWdpbmctZHJtLW5leHQtZGV2aWNlLXVucGx1ZyUyNmlkJTNENjE4NTJjOGE1OWI0ZGQ4
OWQ2Mzc2OTM1NTJjNzMxNzViOWYyY2NkNiZhbXA7ZGF0YT0wNCU3QzAxJTdDQW5kcmV5Lkdyb2R6
b3Zza3klNDBhbWQuY29tJTdDM2UwMTllMjc4MDExNGI2OTZiNGYwOGQ4ODY1YmFjMzYlN0MzZGQ4
OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDA3MDc1NTc5MjQyODIy
JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1
TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPUUlMkZJ
Wm1WZUpEdkhpWTJ4U2FhUGFheTRtWE40OUViaFNKYUo0emx0NldLayUzRCZhbXA7cmVzZXJ2ZWQ9
MAo+Pj4+Pj4gd2FzIGVub3VnaCBmb3IgbWUuIFNlZW1zIGxpa2Ugd2hpbGUgZGV2aWNlX3JlbW92
ZV9maWxlIGNhbiBoYW5kbGUgdGhlIHVzZQo+Pj4+Pj4gY2FzZSB3aGVyZSB0aGUgZmlsZSBhbmQg
dGhlIHBhcmVudCBkaXJlY3RvcnkgYWxyZWFkeSBnb25lLAo+Pj4+Pj4gc3lzZnNfcmVtb3ZlX2dy
b3VwIGdvZXMgZG93biBpbiBmbGFtZXMgaW4gdGhhdCBjYXNlCj4+Pj4+PiBkdWUgdG8ga29iai0+
c2QgYmVpbmcgdW5zZXQgb24gZGV2aWNlIHJlbW92YWwuCj4+Pj4+IEEgZHJpdmVyIHNob3VsZG4n
dCBldmVyIGhhdmUgdG8gcmVtb3ZlIGluZGl2aWR1YWwgc3lzZnMgZ3JvdXBzLCB0aGUKPj4+Pj4g
ZHJpdmVyIGNvcmUvYnVzIGxvZ2ljIHNob3VsZCBkbyBpdCBmb3IgdGhlbSBhdXRvbWF0aWNhbGx5
Lgo+Pj4+Pgo+Pj4+PiBBbmQgd2hlbmV2ZXIgYSBkcml2ZXIgY2FsbHMgYSBzeXNmc18qIGNhbGws
IHRoYXQncyBhIGhpbnQgdGhhdCBzb21ldGhpbmcKPj4+Pj4gaXMgbm90IHdvcmtpbmcgcHJvcGVy
bHkuCj4+Pj4KPj4+PiBEbyB5b3UgbWVhbiB0aGF0IHdoaWxlIHRoZSBkcml2ZXIgY3JlYXRlcyB0
aGUgZ3JvdXBzIGFuZCBmaWxlcyBleHBsaWNpdGx5Cj4+Pj4gZnJvbSBpdCdzIGRpZmZlcmVudCBz
dWJzeXN0ZW1zIGl0IHNob3VsZCBub3QgZXhwbGljaXRseSByZW1vdmUgZWFjaAo+Pj4+IG9uZSBv
ZiB0aGVtIGJlY2F1c2UgYWxsIG9mIHRoZW0gc2hvdWxkIGJlIHJlbW92ZWQgYXQgb25jZSAoYW5k
Cj4+Pj4gcmVjdXJzaXZlbHkpIHdoZW4gdGhlIGRldmljZSBpcyBiZWluZyByZW1vdmVkID8KPj4+
IEluZGl2aWR1YWwgZHJpdmVycyBzaG91bGQgbmV2ZXIgYWRkIGdyb3Vwcy9maWxlcyBpbiBzeXNm
cywgdGhlIGRyaXZlcgo+Pj4gY29yZSBzaG91bGQgZG8gaXQgcHJvcGVybHkgZm9yIHlvdSBpZiB5
b3UgaGF2ZSBldmVyeXRoaW5nIHNldCB1cAo+Pj4gcHJvcGVybHkuICBBbmQgeWVzLCB0aGUgZHJp
dmVyIGNvcmUgd2lsbCBhdXRvbWF0aWNhbGx5IHJlbW92ZSB0aGVtIGFzCj4+PiB3ZWxsLgo+Pj4K
Pj4+IFBsZWFzZSB1c2UgdGhlIGRlZmF1bHQgZ3JvdXBzIGF0dHJpYnV0ZSBmb3IgeW91ciBidXMv
c3Vic3lzdGVtIGFuZCB0aGlzCj4+PiB3aWxsIGhhcHBlbiBhdXRvbWFnaWNhbGx5Lgo+PiBHb29n
bGluZyBmb3IgZGVmYXVsdCBncm91cHMgYXR0cmlidXRlcyBpIGZvdW5kIHRoaXMgLSBodHRwczov
L25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYl
MkZ3d3cubGludXhmb3VuZGF0aW9uLm9yZyUyRmJsb2clMkYyMDEzJTJGMDYlMkZob3ctdG8tY3Jl
YXRlLWEtc3lzZnMtZmlsZS1jb3JyZWN0bHklMkYmYW1wO2RhdGE9MDQlN0MwMSU3Q0FuZHJleS5H
cm9kem92c2t5JTQwYW1kLmNvbSU3QzNlMDE5ZTI3ODAxMTRiNjk2YjRmMDhkODg2NWJhYzM2JTdD
M2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQwNzA3NTU3OTI1
MjgxOCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9p
VjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1B
VmhkaSUyQmNLZUZYTThDQnYlMkJoUk5UQ1lYMlhTUzhvbzBzbzZtQiUyQlB1RWZrJTNEJmFtcDty
ZXNlcnZlZD0wCj4gT2RkLCBtaXJyb3Igb2YgdGhlIG9yaWdpbmFsIGFydGljbGU6Cj4gCWh0dHBz
Oi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJG
JTJGa3JvYWguY29tJTJGbG9nJTJGYmxvZyUyRjIwMTMlMkYwNiUyRjI2JTJGaG93LXRvLWNyZWF0
ZS1hLXN5c2ZzLWZpbGUtY29ycmVjdGx5JTJGJmFtcDtkYXRhPTA0JTdDMDElN0NBbmRyZXkuR3Jv
ZHpvdnNreSU0MGFtZC5jb20lN0MzZTAxOWUyNzgwMTE0YjY5NmI0ZjA4ZDg4NjViYWMzNiU3QzNk
ZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MDcwNzU1NzkyNTI4
MTglN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYy
bHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9bEdN
ZDNQSk9XSWxLVXB2YlYzWnolMkZ2YkJJUnd6NiUyQmxKJTJCUyUyQmlWY1h4dXpNJTNEJmFtcDty
ZXNlcnZlZD0wCj4KPj4gV291bGQgdGhpcyBiZSB3aGF0IHlvdSBzdWdnZXN0IGZvciB1cyA/IFNw
ZWNpZmljYWxseSBmb3Igb3VyIGNhc2UgdGhlIHN0cnVjdAo+PiBkZXZpY2Unc8KgIGdyb3Vwc8Kg
IHNlZW1zIHRoZSByaWdodCBzb2x1dGlvbiBhcyBkaWZmZXJlbnQgZGV2aWNlcwo+PiBtaWdodCBo
YXZlIHNsaWdodGx5IGRpZmZyZWVudCBzeXNmcyBhdHRyaWJ1dGVzLgo+IFRoYXQncyB3aGF0IHRo
ZSBpc192aXNhYmxlKCkgY2FsbGJhY2sgaW4geW91ciBhdHRyaWJ1dGUgZ3JvdXAgaXMgZm9yLCB0
bwo+IHRlbGwgdGhlIGtlcm5lbCBpZiBhbiBpbmRpdmlkdWFsIHN5c2ZzIGF0dHJpYnV0ZSBzaG91
bGQgYmUgY3JlYXRlZCBvcgo+IG5vdC4KCkkgc2VlLCB0aGlzIGxvb2tzIGxpa2UgYSBnb29kIGlt
cHJvdmVtZW50IHRvIG91ciBjdXJyZW50IHdheSBvZiBtYW5hZ2luZyBzeXNmcy4gClNpbmNlIHRo
aXMKY2hhbmdlIGlzIHNvbWV3aGF0IGZ1bmRhbWVudGFsIGFuZCByZXF1aXJlcyBnb29kIHRlc3Rp
bmcgSSBwcmVmZXIgdG8gZGVhbCB3aXRoIAppdCBzZXBhcmF0ZWx5IGZyb20gbXkgY3VycmVudAp3
b3JrIG9uIGRldmljZSB1bnBsdWcgYW5kIHNvIEkgd2lsbCBwdXQgaXQgb24gVE9ETyByaWdodCBh
ZnRlciBmaW5pc2hpbmcgdGhpcyB3b3JrLgoKQW5kcmV5CgoKPgo+IHRoYW5rcywKPgo+IGdyZWcg
ay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
