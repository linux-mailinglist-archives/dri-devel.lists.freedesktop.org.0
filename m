Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF27A2C4877
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 20:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF3D6EA5E;
	Wed, 25 Nov 2020 19:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750052.outbound.protection.outlook.com [40.107.75.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80BCC6E901;
 Wed, 25 Nov 2020 19:34:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhw8Qf0Y+H4v3IHnG6SsJNYVXD359axSpPVMP66t1uKL76rZD3W0OB0T9kFMNplrLTI6JSe0BZD7h6Xw7ufSWL/YfhZTtKuA5COz7F+67Igho9d2oCmfI9XN3eCHNFMwE7KDdr+dNoaNHIwPuWjlTW7Wp4NHKMvrTbzxlKZJFKDhENy/cmphpvn9TSuISX4X3aNlaB84k7cYDlLlnHtAkdjoCS+Mnbbyuu+Fpf28LKvRIRnMuKxtvp+qW+W9W5QyHQ680WR0i0woQyQxfupQ1aTXTUNyHDiVpaX0RnB5nk+yg4RdNQvI0SAAlz9+IL3Qih/HPADgfrVslqRer9+0Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZN7yJHNZ6AUzLh2mD8ZpjsGlN4X20fJMvDqxe4xBz3g=;
 b=EKoFIsMayuCVKwIhW5qzuKpbcqwGdaltYormyzMkVW9rVQNnxm9T+y5yL8UzJeq+zdrSaiemsBrBRISM44mkhLL1PwIzvB3r35r+tmPL9oAfi9QLfHjTRTSjLkQNUkSP05NhX14/ObVMOLPx8SM3V46LkMhl6ZJOJ/Wl6z4n9TC4j1NQNobtLtAOvb6vPmTCaxrlyX/1GADxgXefNdlWJVG+JR3hLRLcs8KfVCiIEOG4Nluu7SV+Rru6TITCeBv4Gp0CgYf8kze7CaqiTsupMrCHWyUDZsl2w898DOnLAlMZm1b7WzUPgo4nctDmUMIV1fLWtdc9Oc9zgDhzXRZluQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZN7yJHNZ6AUzLh2mD8ZpjsGlN4X20fJMvDqxe4xBz3g=;
 b=krCSSa0nrVsUNSXzCijv9vY4U+ZRrE4vGhVJGQ6yxhTHDY9nBhIomELMf1G6yxdMi2cq4Klkdrqk2FPiEI3+pGzwCHOYZaWrGCFpv7DoU35vimH4qMaA2DzCJCKs0UFaY8hNeWkGWd+7vJI3EGPZyrgOaHKxfP8Wp3a1++rsetE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20; Wed, 25 Nov 2020 19:34:46 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3589.022; Wed, 25 Nov 2020
 19:34:46 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Daniel Vetter <daniel@ffwll.ch>, christian.koenig@amd.com
References: <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <20201125104021.GV401619@phenom.ffwll.local>
 <71683ae7-f443-c15a-7003-6ba4ad3d4b15@gmail.com>
 <20201125163621.GZ401619@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <bf6c0657-ac8f-545d-cf3f-e3f5e5d50a84@amd.com>
Date: Wed, 25 Nov 2020 14:34:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20201125163621.GZ401619@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:b441:3cca:9ab3:ff85]
X-ClientProxiedBy: YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::20) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b441:3cca:9ab3:ff85]
 (2607:fea8:3edf:49b0:b441:3cca:9ab3:ff85) by
 YTXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.20 via Frontend Transport; Wed, 25 Nov 2020 19:34:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 54d4a060-65a7-444f-37c0-08d891792a7d
X-MS-TrafficTypeDiagnostic: DM6PR12MB4268:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4268D2605A49A9E9ADE690DDEAFA0@DM6PR12MB4268.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i4+kzw/IidXnAkQ/KSeBw+WNU4Q2YJThPCM0PKZaBhxsxHEL0pWO0eIlP5J7ULjLxejrcIohQjS7swS2OpqfgEJZu/92T0ZHVcAC6vyFp9Z4uaBMau0NIim2zkeInNwh9Q7iYtUKuUOFyXd1IXPsP0x4lhIxQh2qH7sa730FfEBVhjyxystK7WlxuX6JFku8gIQHcWZzZAFManyXXMu3U9CNxm296bf3bW+pzEvZSAt5vhOvA/jjrNar2eMViJ9HGT7ng0LazomgWiKP2rSF5MnZt8JzxgQAsdb9GrzvAeJrqj5tFVjmvmNWv58ZA59csvBF8wVjpfdL6Y26Fmq5ye6TbitU/vDtqbj1w65fxUxbWgHZ+jWhBnah0OFS0mhS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(366004)(396003)(376002)(2906002)(316002)(4326008)(7416002)(16526019)(186003)(36756003)(8936002)(31696002)(31686004)(2616005)(8676002)(66574015)(6636002)(6486002)(83380400001)(478600001)(53546011)(66946007)(5660300002)(52116002)(86362001)(66476007)(66556008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SitPMVkwY3JWL0xuZ0NqMU4zekJYVWN5djN0eVdad1VJNkJpV0FYaGVWbkYr?=
 =?utf-8?B?M3J6QWhnaExoUlM1YzJ2RlJCdXBONC8xL2M5UlVVYWdoRDM4K1d5TUNrdUMx?=
 =?utf-8?B?VE0reU5nMVU3dDI4UXVlZjdoelVaWXdQdGFJRkMrbjlpaGpjUkVHcjRxUU5M?=
 =?utf-8?B?eXMyN0pKOGpQY2JIeXdWVDUxdjhJRGNFenUvTE9Sb2hmWXpSS0lZVHFFNXFu?=
 =?utf-8?B?cnc0aDRSRStwT0RtbU9GUVAzSXB1NGkwMnc2aFhadWxrR2NFNFBudEI0T3h5?=
 =?utf-8?B?N0QwVE1wdm9veUVma25yN2J0L2RJck5pS2Y1TXBCTE1NU1JsOGxkejlUQU5K?=
 =?utf-8?B?dVFpdWkzWkl5anVORk41d0xJeUI5VXpLaHNocnREaVJ1c3dUWlZZQVlpd21o?=
 =?utf-8?B?VXFoSE4rQVIzM2ZzSldrZXBnekZiSVhzcnBsbVdGMXo1V20xV0htY095Rkg5?=
 =?utf-8?B?UjljMXBiMzJrTlBYNXBCb29GU0JVQk90Nkw5VHJzeXRFZDFiVWtpNmdWTkpt?=
 =?utf-8?B?S2VsZXZBMk1ydVVGU3RiemZTWDNBT3FLL3BnVG5HM1dUcERHVmlKOTBINEd1?=
 =?utf-8?B?TDczUlpiSDdXWVVWSFplNGMyYjhwQUo1eEk5dlBjZDJic3lMeEpsY3VIOXp6?=
 =?utf-8?B?blpwZkVNTFNoQ0pwZlVUb1d0SU9iQXNESlhSOWQ2cXJNQ2ZGQ2plR1VTWFh1?=
 =?utf-8?B?cVRpZXVkenFCV1djakpLZE5XQnArOCtJeEEwcStyMXNic2UwaVdqWDFkNUl6?=
 =?utf-8?B?b0hGY0RNTmFqS0J1UkZTYUNGOXFyTW9TTXZYSGROL0V5d2VuT0lRRVBVTUFE?=
 =?utf-8?B?bVg1NzNGRWNLS1l4MEVGU1Nhc3F3amJyUm9Zd2NFRE9pODJsZUlDaU9yZDh2?=
 =?utf-8?B?UHk5TzluZCs2RVdQdllVd2tjdmkwMXRvQkNINjI4Wml3d3BlTktYT1NoVGRQ?=
 =?utf-8?B?dTJGOHlRNlhFNktLa2hYZlViLzJsRnVhaXNvaEpjSVJ1b3VlRi91S3NlSGVG?=
 =?utf-8?B?dVBiVTVjUVVCTy9LeTFLSWFBMDZESDdVUlgva1dqd3BGMDFuSVAxZ25TNmly?=
 =?utf-8?B?SngvaHk1aXBSWXh2UUJqOTRBZGo5clJCWGVwSnJ1eHVNVGdTdzBQdGp0aXRx?=
 =?utf-8?B?ODF3a0JwYS95R0p0ZU8vUnFQYlNrTnNhZDZSUVBYUU1SQmljZDdIVnNnUGpG?=
 =?utf-8?B?Zy8wdVVYY2IrSXFyT0Y4eGI3TlFSSEw2R2JkbWRRYUNPYjRGQ0JWQ25VZm82?=
 =?utf-8?B?ditMeGl4MWQwaDJ5SmlYQzlkUWE2RXVZMXdVRVZRU0VrMDFNQzJ1eXRsay83?=
 =?utf-8?B?TGRUTEdua28rZXh0UFZXWG84TkRVSzN2ajVwZTRxMjk0YUEvMFB6bTFZeXhV?=
 =?utf-8?B?MS9MaXlRelZ3bjVUbFFhWlZZc2tRS0ZkR283ZFY0VHN4anhWNy8rSFBpKzEz?=
 =?utf-8?Q?oLvm+tp1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d4a060-65a7-444f-37c0-08d891792a7d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 19:34:46.5423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AERO5jLLem8wtokkkl+gn84c/UHCzUR+1dIostZrQmj/dAplRorwkO9M5+bkabRpUf4l7Gcaub00hDEaC3xuSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 Alexander.Deucher@amd.com, yuq825@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzI1LzIwIDExOjM2IEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFdlZCwgTm92
IDI1LCAyMDIwIGF0IDAxOjU3OjQwUE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDI1LjExLjIwIHVtIDExOjQwIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IE9uIFR1ZSwg
Tm92IDI0LCAyMDIwIGF0IDA1OjQ0OjA3UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+Pj4gQW0gMjQuMTEuMjAgdW0gMTc6MjIgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+
Pj4gT24gMTEvMjQvMjAgMjo0MSBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+IEFt
IDIzLjExLjIwIHVtIDIyOjA4IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4gT24g
MTEvMjMvMjAgMzo0MSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+Pj4gQW0gMjMu
MTEuMjAgdW0gMjE6Mzggc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Pj4+IE9uIDEx
LzIzLzIwIDM6MjAgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4+Pj4gQW0gMjMu
MTEuMjAgdW0gMjE6MDUgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4+Pj4+Pj4+Pj4gT24g
MTEvMjUvMjAgNTo0MiBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4+Pj4+Pj4+IEFt
IDIxLjExLjIwIHVtIDA2OjIxIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+Pj4+
Pj4gSXQncyBuZWVkZWQgdG8gZHJvcCBpb21tdSBiYWNrZWQgcGFnZXMgb24gZGV2aWNlIHVucGx1
Zwo+Pj4+Pj4+Pj4+Pj4+IGJlZm9yZSBkZXZpY2UncyBJT01NVSBncm91cCBpcyByZWxlYXNlZC4K
Pj4+Pj4+Pj4+Pj4+IEl0IHdvdWxkIGJlIGNsZWFuZXIgaWYgd2UgY291bGQgZG8gdGhlIHdob2xl
Cj4+Pj4+Pj4+Pj4+PiBoYW5kbGluZyBpbiBUVE0uIEkgYWxzbyBuZWVkIHRvIGRvdWJsZSBjaGVj
awo+Pj4+Pj4+Pj4+Pj4gd2hhdCB5b3UgYXJlIGRvaW5nIHdpdGggdGhpcyBmdW5jdGlvbi4KPj4+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+Pj4+Pj4+IENoZWNrIHBhdGNo
ICJkcm0vYW1kZ3B1OiBSZWdpc3RlciBJT01NVSB0b3BvbG9neQo+Pj4+Pj4+Pj4+PiBub3RpZmll
ciBwZXIgZGV2aWNlLiIgdG8gc2VlCj4+Pj4+Pj4+Pj4+IGhvdyBpIHVzZSBpdC4gSSBkb24ndCBz
ZWUgd2h5IHRoaXMgc2hvdWxkIGdvCj4+Pj4+Pj4+Pj4+IGludG8gVFRNIG1pZC1sYXllciAtIHRo
ZSBzdHVmZiBJIGRvIGluc2lkZQo+Pj4+Pj4+Pj4+PiBpcyB2ZW5kb3Igc3BlY2lmaWMgYW5kIGFs
c28gSSBkb24ndCB0aGluayBUVE0gaXMKPj4+Pj4+Pj4+Pj4gZXhwbGljaXRseSBhd2FyZSBvZiBJ
T01NVSA/Cj4+Pj4+Pj4+Pj4+IERvIHlvdSBtZWFuIHlvdSBwcmVmZXIgdGhlIElPTU1VIG5vdGlm
aWVyIHRvIGJlCj4+Pj4+Pj4+Pj4+IHJlZ2lzdGVyZWQgZnJvbSB3aXRoaW4gVFRNCj4+Pj4+Pj4+
Pj4+IGFuZCB0aGVuIHVzZSBhIGhvb2sgdG8gY2FsbCBpbnRvIHZlbmRvciBzcGVjaWZpYyBoYW5k
bGVyID8KPj4+Pj4+Pj4+PiBObywgdGhhdCBpcyByZWFsbHkgdmVuZG9yIHNwZWNpZmljLgo+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gV2hhdCBJIG1lYW50IGlzIHRvIGhhdmUgYSBmdW5jdGlvbiBsaWtl
Cj4+Pj4+Pj4+Pj4gdHRtX3Jlc291cmNlX21hbmFnZXJfZXZpY3RfYWxsKCkgd2hpY2ggeW91IG9u
bHkgbmVlZAo+Pj4+Pj4+Pj4+IHRvIGNhbGwgYW5kIGFsbCB0dCBvYmplY3RzIGFyZSB1bnBvcHVs
YXRlZC4KPj4+Pj4+Pj4+IFNvIGluc3RlYWQgb2YgdGhpcyBCTyBsaXN0IGkgY3JlYXRlIGFuZCBs
YXRlciBpdGVyYXRlIGluCj4+Pj4+Pj4+PiBhbWRncHUgZnJvbSB0aGUgSU9NTVUgcGF0Y2ggeW91
IGp1c3Qgd2FudCB0byBkbyBpdAo+Pj4+Pj4+Pj4gd2l0aGluCj4+Pj4+Pj4+PiBUVE0gd2l0aCBh
IHNpbmdsZSBmdW5jdGlvbiA/IE1ha2VzIG11Y2ggbW9yZSBzZW5zZS4KPj4+Pj4+Pj4gWWVzLCBl
eGFjdGx5Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGUgbGlzdF9lbXB0eSgpIGNoZWNrcyB3ZSBoYXZl
IGluIFRUTSBmb3IgdGhlIExSVSBhcmUKPj4+Pj4+Pj4gYWN0dWFsbHkgbm90IHRoZSBiZXN0IGlk
ZWEsIHdlIHNob3VsZCBub3cgY2hlY2sgdGhlCj4+Pj4+Pj4+IHBpbl9jb3VudCBpbnN0ZWFkLiBU
aGlzIHdheSB3ZSBjb3VsZCBhbHNvIGhhdmUgYSBsaXN0IG9mIHRoZQo+Pj4+Pj4+PiBwaW5uZWQg
Qk9zIGluIFRUTS4KPj4+Pj4+PiBTbyBmcm9tIG15IElPTU1VIHRvcG9sb2d5IGhhbmRsZXIgSSB3
aWxsIGl0ZXJhdGUgdGhlIFRUTSBMUlUgZm9yCj4+Pj4+Pj4gdGhlIHVucGlubmVkIEJPcyBhbmQg
dGhpcyBuZXcgZnVuY3Rpb24gZm9yIHRoZSBwaW5uZWQgb25lc8KgID8KPj4+Pj4+PiBJdCdzIHBy
b2JhYmx5IGEgZ29vZCBpZGVhIHRvIGNvbWJpbmUgYm90aCBpdGVyYXRpb25zIGludG8gdGhpcwo+
Pj4+Pj4+IG5ldyBmdW5jdGlvbiB0byBjb3ZlciBhbGwgdGhlIEJPcyBhbGxvY2F0ZWQgb24gdGhl
IGRldmljZS4KPj4+Pj4+IFllcywgdGhhdCdzIHdoYXQgSSBoYWQgaW4gbXkgbWluZCBhcyB3ZWxs
Lgo+Pj4+Pj4KPj4+Pj4+Pj4gQlRXOiBIYXZlIHlvdSB0aG91Z2h0IGFib3V0IHdoYXQgaGFwcGVu
cyB3aGVuIHdlIHVucG9wdWxhdGUKPj4+Pj4+Pj4gYSBCTyB3aGlsZSB3ZSBzdGlsbCB0cnkgdG8g
dXNlIGEga2VybmVsIG1hcHBpbmcgZm9yIGl0PyBUaGF0Cj4+Pj4+Pj4+IGNvdWxkIGhhdmUgdW5m
b3Jlc2VlbiBjb25zZXF1ZW5jZXMuCj4+Pj4+Pj4gQXJlIHlvdSBhc2tpbmcgd2hhdCBoYXBwZW5z
IHRvIGttYXAgb3Igdm1hcCBzdHlsZSBtYXBwZWQgQ1BVCj4+Pj4+Pj4gYWNjZXNzZXMgb25jZSB3
ZSBkcm9wIGFsbCB0aGUgRE1BIGJhY2tpbmcgcGFnZXMgZm9yIGEgcGFydGljdWxhcgo+Pj4+Pj4+
IEJPID8gQmVjYXVzZSBmb3IgdXNlciBtYXBwaW5ncwo+Pj4+Pj4+IChtbWFwKSB3ZSB0b29rIGNh
cmUgb2YgdGhpcyB3aXRoIGR1bW15IHBhZ2UgcmVyb3V0ZSBidXQgaW5kZWVkCj4+Pj4+Pj4gbm90
aGluZyB3YXMgZG9uZSBmb3IgaW4ga2VybmVsIENQVSBtYXBwaW5ncy4KPj4+Pj4+IFllcyBleGFj
dGx5IHRoYXQuCj4+Pj4+Pgo+Pj4+Pj4gSW4gb3RoZXIgd29yZHMgd2hhdCBoYXBwZW5zIGlmIHdl
IGZyZWUgdGhlIHJpbmcgYnVmZmVyIHdoaWxlIHRoZQo+Pj4+Pj4ga2VybmVsIHN0aWxsIHdyaXRl
cyB0byBpdD8KPj4+Pj4+Cj4+Pj4+PiBDaHJpc3RpYW4uCj4+Pj4+IFdoaWxlIHdlIGNhbid0IGNv
bnRyb2wgdXNlciBhcHBsaWNhdGlvbiBhY2Nlc3NlcyB0byB0aGUgbWFwcGVkIGJ1ZmZlcnMKPj4+
Pj4gZXhwbGljaXRseSBhbmQgaGVuY2Ugd2UgdXNlIHBhZ2UgZmF1bHQgcmVyb3V0aW5nCj4+Pj4+
IEkgYW0gdGhpbmtpbmcgdGhhdCBpbiB0aGlzwqAgY2FzZSB3ZSBtYXkgYmUgYWJsZSB0byBzcHJp
bmtsZQo+Pj4+PiBkcm1fZGV2X2VudGVyL2V4aXQgaW4gYW55IHN1Y2ggc2Vuc2l0aXZlIHBsYWNl
IHdlcmUgd2UgbWlnaHQKPj4+Pj4gQ1BVIGFjY2VzcyBhIERNQSBidWZmZXIgZnJvbSB0aGUga2Vy
bmVsID8KPj4+PiBZZXMsIEkgZmVhciB3ZSBhcmUgZ29pbmcgdG8gbmVlZCB0aGF0Lgo+Pj4gVWgg
Li4uIHByb2JsZW0gaXMgdGhhdCBkbWFfYnVmX3ZtYXAgYXJlIHVzdWFsbHkgcGVybWFuZW50IHRo
aW5ncy4gTWF5YmUgd2UKPj4+IGNvdWxkIHN0dWZmIHRoaXMgaW50byBiZWdpbi9lbmRfY3B1X2Fj
Y2VzcwoKCkRvIHlvdSBtZWFuIGd1YXJkaW5nIHdpdGggZHJtX2Rldl9lbnRlci9leGl0IGluIGRt
YV9idWZfb3BzLmJlZ2luL2VuZF9jcHVfYWNjZXNzCmRyaXZlciBzcGVjaWZpYyBob29rID8KCgo+
Pj4gKGJ1dCBvbmx5IGZvciB0aGUga2VybmVsLCBzbyBhCj4+PiBiaXQgdHJpY2t5KT8KCgpXaHkg
b25seSBrZXJuZWwgPyBXaHkgaXMgaXQgYSBwcm9ibGVtIHRvIGRvIGl0IGlmIGl0IGNvbWVzIGZy
b20gZG1hX2J1Zl9pb2N0bCBieQpzb21lIHVzZXIgcHJvY2VzcyA/IEFuZMKgIGlmIHdlIGRvIG5l
ZWQgdGhpcyBkaXN0aW5jdGlvbiBJIHRoaW5rIHdlIHNob3VsZCBiZSBhYmxlIHRvCmRpZmZlcmVu
dGlhdGUgYnkgbG9va2luZyBhdCBjdXJyZW50LT5tbSAoaS5lLiBtbV9zdHJ1Y3QpIHBvaW50ZXIg
YmVpbmcgTlVMTCBmb3IgCmtlcm5lbCB0aHJlYWQuCgoKPj4gT2ggdmVyeSB2ZXJ5IGdvb2QgcG9p
bnQhIEkgaGF2ZW4ndCB0aG91Z2h0IGFib3V0IERNQS1idWYgbW1hcHMgaW4gdGhpcwo+PiBjb250
ZXh0IHlldC4KPj4KPj4KPj4+IGJ0dyB0aGUgb3RoZXIgaXNzdWUgd2l0aCBkbWEtYnVmIChhbmQg
ZXZlbiB3b3JzZSB3aXRoIGRtYV9mZW5jZSkgaXMKPj4+IHJlZmNvdW50aW5nIG9mIHRoZSB1bmRl
cmx5aW5nIGRybV9kZXZpY2UuIEknZCBleHBlY3QgdGhhdCBhbGwgeW91cgo+Pj4gY2FsbGJhY2tz
IGdvIGJvb20gaWYgdGhlIGRtYV9idWYgb3V0bGl2ZXMgeW91ciBkcm1fZGV2aWNlLiBUaGF0IHBh
cnQgaXNuJ3QKPj4+IHlldCBzb2x2ZWQgaW4geW91ciBzZXJpZXMgaGVyZS4KPj4gV2VsbCB0aGlu
a2luZyBtb3JlIGFib3V0IHRoaXMsIGl0IHNlZW1zIHRvIGJlIGEgYW5vdGhlciByZWFsbHkgZ29v
ZCBhcmd1bWVudAo+PiB3aHkgbWFwcGluZyBwYWdlcyBmcm9tIERNQS1idWZzIGludG8gYXBwbGlj
YXRpb24gYWRkcmVzcyBzcGFjZSBkaXJlY3RseSBpcyBhCj4+IHZlcnkgYmFkIGlkZWEgOikKPj4K
Pj4gQnV0IHllcywgd2UgZXNzZW50aWFsbHkgY2FuJ3QgcmVtb3ZlIHRoZSBkZXZpY2UgYXMgbG9u
ZyBhcyB0aGVyZSBpcyBhCj4+IERNQS1idWYgd2l0aCBtYXBwaW5ncy4gTm8gaWRlYSBob3cgdG8g
Y2xlYW4gdGhhdCBvbmUgdXAuCj4gZHJtX2Rldl9nZXQvcHV0IGluIGRybV9wcmltZSBoZWxwZXJz
IHNob3VsZCBnZXQgdXMgbGlrZSA5MCUgdGhlcmUgSSB0aGluay4KCgpXaGF0IGFyZSB0aGUgb3Ro
ZXIgMTAlID8KCgo+Cj4gVGhlIGV2ZW4gbW9yZSB3b3JyeWluZyB0aGluZyBpcyByYW5kb20gZG1h
X2ZlbmNlIGF0dGFjaGVkIHRvIHRoZSBkbWFfcmVzdgo+IG9iamVjdC4gV2UgY291bGQgdHJ5IHRv
IGNsZWFuIGFsbCBvZiBvdXJzIHVwLCBidXQgdGhleSBjb3VsZCBoYXZlIGVzY2FwZWQKPiBhbHJl
YWR5IGludG8gc29tZSBvdGhlciBkcml2ZXIuIEFuZCBzaW5jZSB3ZSdyZSB0YWxraW5nIGFib3V0
IGVncHUKPiBob3R1bnBsdWcsIGRtYV9mZW5jZSBlc2NhcGluZyB0byB0aGUgaWdwdSBpcyBhIHBy
ZXR0eSByZWFzb25hYmxlIHVzZS1jYXNlLgo+Cj4gSSBoYXZlIG5vIGhvdyB0byBmaXggdGhhdCBv
bmUgOi0vCj4gLURhbmllbAoKCkkgYXNzdW1lIHlvdSBhcmUgcmVmZXJyaW5nIHRvIHN5bmNfZmls
ZV9jcmVhdGUvc3luY19maWxlX2dldF9mZW5jZSBBUEnCoCBmb3IgCmRtYV9mZW5jZSBleHBvcnQv
aW1wb3J0ID8KU28gd2l0aCBETUEgYnVmcyB3ZSBoYXZlIHRoZSBkcm1fZ2VtX29iamVjdCBhcyBl
eHBvcnRlciBzcGVjaWZpYyBwcml2YXRlIGRhdGEKYW5kIHNvIHdlIGNhbiBkbyBkcm1fZGV2X2dl
dCBhbmQgcHV0IGF0IHRoZSBkcm1fZ2VtX29iamVjdCBsYXllciB0byBiaW5kIGRldmljZSAKbGlm
ZSBjeWNsZQp0byB0aGF0IG9mIGVhY2ggR0VNIG9iamVjdCBidXQsIHdlIGRvbid0IGhhdmUgc3Vj
aCBtaWQtbGF5ZXIgZm9yIGRtYV9mZW5jZSB3aGljaCAKY291bGQgYWxsb3cKdXMgdG8gaW5jcmVt
ZW50IGRldmljZSByZWZlcmVuY2UgZm9yIGVhY2ggZmVuY2Ugb3V0IHRoZXJlIHJlbGF0ZWQgdG8g
dGhhdCBkZXZpY2UgCi0gaXMgbXkgdW5kZXJzdGFuZGluZyBjb3JyZWN0ID8KCkFuZHJleQoKCkFu
ZHJleQoKCj4+IENocmlzdGlhbi4KPj4KPj4+IC1EYW5pZWwKPj4+Cj4+Pj4+IFRoaW5ncyBsaWtl
IENQVSBwYWdlIHRhYmxlIHVwZGF0ZXMsIHJpbmcgYnVmZmVyIGFjY2Vzc2VzIGFuZCBGVyBtZW1j
cHkgPwo+Pj4+PiBJcyB0aGVyZSBvdGhlciBwbGFjZXMgPwo+Pj4+IFB1aCwgZ29vZCBxdWVzdGlv
bi4gSSBoYXZlIG5vIGlkZWEuCj4+Pj4KPj4+Pj4gQW5vdGhlciBwb2ludCBpcyB0aGF0IGF0IHRo
aXMgcG9pbnQgdGhlIGRyaXZlciBzaG91bGRuJ3QgYWNjZXNzIGFueSBzdWNoCj4+Pj4+IGJ1ZmZl
cnMgYXMgd2UgYXJlIGF0IHRoZSBwcm9jZXNzIGZpbmlzaGluZyB0aGUgZGV2aWNlLgo+Pj4+PiBB
RkFJSyB0aGVyZSBpcyBubyBwYWdlIGZhdWx0IG1lY2hhbmlzbSBmb3Iga2VybmVsIG1hcHBpbmdz
IHNvIEkgZG9uJ3QKPj4+Pj4gdGhpbmsgdGhlcmUgaXMgYW55dGhpbmcgZWxzZSB0byBkbyA/Cj4+
Pj4gV2VsbCB0aGVyZSBpcyBhIHBhZ2UgZmF1bHQgaGFuZGxlciBmb3Iga2VybmVsIG1hcHBpbmdz
LCBidXQgdGhhdCBvbmUganVzdAo+Pj4+IHByaW50cyB0aGUgc3RhY2sgdHJhY2UgaW50byB0aGUg
c3lzdGVtIGxvZyBhbmQgY2FsbHMgQlVHKCk7IDopCj4+Pj4KPj4+PiBMb25nIHN0b3J5IHNob3J0
IHdlIG5lZWQgdG8gYXZvaWQgYW55IGFjY2VzcyB0byByZWxlYXNlZCBwYWdlcyBhZnRlciB1bnBs
dWcuCj4+Pj4gTm8gbWF0dGVyIGlmIGl0J3MgZnJvbSB0aGUga2VybmVsIG9yIHVzZXJzcGFjZS4K
Pj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4+IEFuZHJleQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
