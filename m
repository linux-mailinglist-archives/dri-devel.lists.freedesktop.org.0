Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 742F82DD292
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 15:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A536E3EB;
	Thu, 17 Dec 2020 14:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC176E3EB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 14:02:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkWukzZf3l/8IhG8u0eBOLlrt30Y1X4CKl92Wu2jDjt3IsAOpUzcYVogGPYTHH7MTJqllCw2ieJXdJIvP5UQVw+iq0++nEjdudKFEyhdgLyS3+JBm82e7RIQU0IaE66TbZ5QWYK5338e1FlPj4ns6BonnceZ4c+8tpG0EDMBYDwT2c8asn0ZMso5gENfel1DK/dlib6Bf6cErlvbf2zVwpbvQdmgaCRer5W8mwGQjPM8kUmM/b/yClTpsY+LF6dsWk4VSkQed0+/890GZGvPsEG3u0ONzhh4cfDmV+z1MZfoOp62GT4kf5JDSf2jFKqOZjphhSRv97ZjB4qEXzD9EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94VDhPZTJqRxvAaea9Usrs6J3M4QWz1C2lG6/kvsZi8=;
 b=FwIAsv5O1HET7/hX4Gzd013jXZwoXCsbJ5QXLtOlBhGIku5e1JvKtxJvh/41UBw/+KL6RMsaHQFqq3DceC1p+QWd6MeRdV/oQSNu9z5CnFHapGGT/VSpMq/OT6prRY9PfPH2sNGGqLmNmkkXwBifV6CTOVUXZRa6dM7CmFI7ZE8MDjSsk0+s9AehdyH2LgiwtU/Pi5F3R8V8flpWblyXr0SzAaZtji25zya6yptxiHGwe+H5ou4pVNqNsZyryYoGz8k+Wb0a5adU7pUDP/U/6fqKmJAP3t2Juj9p0tUuFhYg94Y0H9IExymYSb5hVFIbMg2gAjrF3vcE0Ne6QyPA9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94VDhPZTJqRxvAaea9Usrs6J3M4QWz1C2lG6/kvsZi8=;
 b=3yuM7330SDM9yytq93+eOHURTxz0y2ixAc3JspeemdE8v8gIi8Rmws/kAQTweRZcMPwyWaTHyLPJxt1ABYB4lfiUbOmkD4S/IDeX9TFqvb0AyMgybuw+us9jK4L1cl6Yvpt2nf6GFBx6nKhHt+nltisYu1cUxVyb2V6OwoWnnyI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Thu, 17 Dec
 2020 14:02:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 14:02:20 +0000
Subject: Re: [PATCH] drm/[amdgpu|radeon]: fix memset on io mem
To: Robin Murphy <robin.murphy@arm.com>, Chen Li <chenli@uniontech.com>
References: <877dpiz4sf.wl-chenli@uniontech.com>
 <4277816d-db00-7e81-a2fb-069aeee18e8b@amd.com>
 <875z51zwsq.wl-chenli@uniontech.com>
 <90b625e2-2409-d13b-2456-483ad4eef18f@amd.com>
 <873605z1du.wl-chenli@uniontech.com>
 <7920fd29-3f95-2109-07ee-15659e80dc40@amd.com>
 <159c72db-1316-6155-2209-8e0e9a7f5224@arm.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <8a2245b8-3a57-a35b-924f-e2a6c084e60f@amd.com>
Date: Thu, 17 Dec 2020 15:02:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <159c72db-1316-6155-2209-8e0e9a7f5224@arm.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM9P191CA0011.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM9P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 14:02:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1d9d9b83-295c-40eb-f467-08d8a2945f0f
X-MS-TrafficTypeDiagnostic: BL0PR12MB4948:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB494804ABEEE1FBCCF1C02CFA83C40@BL0PR12MB4948.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QBNw5fJ5NCJ+pqnBm7fgGw+Xk5lIAPJmTIE0WsLj+6+rMp3pWiGlhmBrs2fQXhoPqJHJdSmW56gQDwlz6puXWGv4qXWUSw8GNS3edNK9frc3J8wg/gPjYwFoj8rCm9v8ja4XytJ9LeO2WYg6ZtcnccBiqLeqDgV1dFd0fee1TGp80ttgL7Tlk0nopQpG+I8OivXY9LoOdoebi8vb1+9cGrEjsfOHYSOHIAv1aLbq2qKOl/O2y5oGkk1euMx/qY1nzXG7MbisO3GYAcUlNRNOKjckWewGQxhEMklCBpswIJPVsWv42T64QjG87RAH3re9dRY/fQwe3lSf6DnxdaaIpmDDiD5LQ1b2vZZqeD0dklOSvxoNHqE/UFCOkF0XpbBLpOz0Jlma4zJWOiJRSmPQLgq3Kht6000X66MckT0N4jlrmhObeHEo1ybZEjxjqbU7RZIszBirYDem36YmT/CzpmmjjpwxJDXfYaVKW/RL1Iks0R3MEN2rxlsdypZVA8l1+Wj/y+5VtjCj1N2LoYD5+w665eWz5Bf1ctYA5QS3dTI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(110136005)(316002)(6666004)(2616005)(31686004)(53546011)(45080400002)(2906002)(8676002)(52116002)(66574015)(4001150100001)(86362001)(8936002)(66556008)(4326008)(66476007)(66946007)(83380400001)(478600001)(36756003)(5660300002)(31696002)(186003)(6486002)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RThCU29SeXdrTWJlbmtXNE5YUkN6Nzc5d0VJWnJJSWVDOUhOTzlSWVF6cUVq?=
 =?utf-8?B?ZERCR3JKQWJJaklTQXNJLzhyNlJ2VGJZWE14RUZWd1AySFlwSXVXV3pYRCt5?=
 =?utf-8?B?UUc0d2NaN0hYTXNnWm8xN0dWSHo3MlVuNkNrcGdqbjlFNWM1TVhNYnc3ajYr?=
 =?utf-8?B?Unl5ODJ0SHlmczRSTUl2bFc2S2ZSZW01cGFSSTVTMk44RHpGWGVrb1FZRS9P?=
 =?utf-8?B?SmliQ2NRM3BsQjhPaFNNSEtzVzY1ZGJsY2d5ZXkrVEt0eGJycmhhVTZwTjMr?=
 =?utf-8?B?bFU2ZDJpNUdRSmJFS2pFSUMxNFBweFlzM3NVZS9PTFBDb3hqYkJMTnJkemsw?=
 =?utf-8?B?R3ExWEZwbWZSY2Q2Z1Fsc1hVOHJGN2k3N2RNT2tRVW9paXM4MENRS0RiTTQ0?=
 =?utf-8?B?OXVWeVgvb0RUQUJZaXVyZ1hCK2IyQVVXSEJCOXozeElPZks4QmtBMWE0bUcx?=
 =?utf-8?B?ZTVCSzFCaktwM01iS0xuZHBBVDNmNjdzN2FaZm1nWXRYSzhDNlNVaVJDcEl3?=
 =?utf-8?B?STFtWEE3a1RxT1hkMmhHNmFiZUZNLzM1d2pFR1F4WG01eHhhTVF6SUNvVVNC?=
 =?utf-8?B?Vk5oQUZjNStUdkxqcGNvREdxaUIvYTM4eUJRZTVFZ2pNemdKTE90dHRSSjNR?=
 =?utf-8?B?cCtNM3dWQ2ZQRWo0Z0pwMUo3bncyYjJOYm00bUttNU16eGczd2tobDVFR1h3?=
 =?utf-8?B?MVRhRmZ4bDBKWm54OERuVmM1SDErMWpZRzVMKzdwQ3JJcHFIUkpGUWVsRHB3?=
 =?utf-8?B?WmxSQXAwaXloS1hsY1pobndXbnBEZGR1UDJuS3JvVnkzTEhyZk14djhwVWYx?=
 =?utf-8?B?VlFiWmI3RFMrdEZUbG1IMk1TWG9DeHV2S3pGNHpaZk9xeUVTM3l4bHF6UUk1?=
 =?utf-8?B?WmpYSzhqTGFWMmUzZVhrV2QwRzJBdDJiT0tyanYwT0lHdEJ1UnlPc0MwU0FM?=
 =?utf-8?B?U2ZPUjZ5NUM0TDNsTkxsWUtycUdYdDFjRC9RL05oeFdIUVV3WXA5ekFNVmVI?=
 =?utf-8?B?b1kxTUtjYW1UbDI5T2gzUkJ6aXpESTZjbUxnZVVVRm5Sa01vUk5jS3YxRVNZ?=
 =?utf-8?B?NzFuVzlVWlFWYUcveGxOYjlVMDBCRlJVcUx6YkhGY2RDRlp5cXJWaEg3aXdK?=
 =?utf-8?B?KzVYdHJ0R01iWFJGQlBoR0g4VG5rRUtxU2NCR0NlOGJKTkhORnRzV2xxQU16?=
 =?utf-8?B?VDVjbnlaNVF3OUUvSkt0YWVYM09FWVB6eG4zSkhPdzRiNWcrK3lMaTAycHdV?=
 =?utf-8?B?Z3NUTHhtMDlUZWV2WnJBdXBqYUFicUJXS2Rvd3dOWGtDbTBKMEh5TTI1UlV1?=
 =?utf-8?B?cmt1c1JiTzBxYjEzcktKYzE2dEhSMXVOUlV4NlN3V1p5REZpNGs3MCtsNUl3?=
 =?utf-8?B?ZFJOZi9ock10UnBEcGxpSHk0TEl0K0ZJR1FnR3hlSjF4SUYyWmdzeWdnL3ZD?=
 =?utf-8?Q?SrbGLP8f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 14:02:20.5586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d9d9b83-295c-40eb-f467-08d8a2945f0f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1DIPpGm4Xu2mNRAt5MMMghiM5m14fPmM8kLOs+oz39//UoJpxNV6aCKyFF5LvFV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4948
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
Cc: Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMTIuMjAgdW0gMTQ6NDUgc2NocmllYiBSb2JpbiBNdXJwaHk6Cj4gT24gMjAyMC0xMi0x
NyAxMDoyNSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTcuMTIuMjAgdW0gMDI6MDcg
c2NocmllYiBDaGVuIExpOgo+Pj4gT24gV2VkLCAxNiBEZWMgMjAyMCAyMjoxOToxMSArMDgwMCwK
Pj4+IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4gQW0gMTYuMTIuMjAgdW0gMTQ6NDggc2No
cmllYiBDaGVuIExpOgo+Pj4+PiBPbiBXZWQsIDE2IERlYyAyMDIwIDE1OjU5OjM3ICswODAwLAo+
Pj4+PiBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4gW1NOSVBdCj4+Pj4+IEhpLCBDaHJp
c3RpYW4uIEknbSBub3Qgc3VyZSB3aHkgdGhpcyBjaGFuZ2UgaXMgYSBoYWNrIGhlcmUuIEkgCj4+
Pj4+IGNhbm5vdCBzZWUgdGhlIHByb2JsZW0gYW5kIHdsbCBiZSBncmF0ZWZ1bCBpZiB5b3UgZ2l2
ZSBtb3JlIAo+Pj4+PiBleHBsYWluYXRpb25zLgo+Pj4+IF9fbWVtc2V0IGlzIHN1cHBvc2VkIHRv
IHdvcmsgb24gdGhvc2UgYWRkcmVzc2VzLCBvdGhlcndpc2UgeW91IAo+Pj4+IGNhbid0IHVzZSB0
aGUKPj4+PiBlODg2MCBvbiB5b3VyIGFybTY0IHN5c3RlbS4KPj4+IElmIF9fbWVtc2V0IGlzIHN1
cHBvc2VkIHRvIHdvcmsgb24gdGhvc2UgYWRyZXNzZXMsIHdoeSB0aGlzIAo+Pj4gY29tbWl0KGh0
dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUz
QSUyRiUyRmdpdGh1Yi5jb20lMkZ0b3J2YWxkcyUyRmxpbnV4JTJGY29tbWl0JTJGYmEwYjIyNzVh
Njc4MWIyZjM5MTlkOTMxZDYzMzI5YjU1NDhmNmQ1ZiZhbXA7ZGF0YT0wNCU3QzAxJTdDY2hyaXN0
aWFuLmtvZW5pZyU0MGFtZC5jb20lN0MzNTUxYWU0OTcyYjA0NGJiODMxNjA4ZDhhMjkxZjgxYyU3
QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MzgwOTUxMTQy
OTIzOTQlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpv
aVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9
eG5zODF1Q0dmTjF0anNWbjVMQlU4UWhtVWluWlJKUWxYejh3JTJGSjclMkZHVE0lM0QmYW1wO3Jl
c2VydmVkPTApIAo+Pj4gaXMgbmVlZGVkPyAoSSBhbHNvIG5vdGljZSBkcm0vcmFkZW9uIGRpZG4n
dCB0YWtlIHRoaXMgY2hhbmdlIHRob3VnaCkgCj4+PiBqdXN0IG91dCBvZiBjdXJpb3NpdHkuCj4+
Cj4+IFdlIGdlbmVyYWxseSBhY2NlcHQgdGhvc2UgcGF0Y2hlcyBhcyBjbGVhbnVwIGluIHRoZSBr
ZXJuZWwgd2l0aCB0aGUgCj4+IGhvcGUgdGhhdCB3ZSBjYW4gZmluZCBhIHdheSB0byB3b3JrIGFy
b3VuZCB0aGUgdXNlcnNwYWNlIHJlc3RyaWN0aW9ucy4KPj4KPj4gQnV0IHdoZW4geW91IGFsc28g
aGF2ZSB0aGlzIGlzc3VlIGluIHVzZXJzcGFjZSB0aGVuIHRoZXJlIGlzbid0IG11Y2ggCj4+IHdl
IGNhbiBkbyBmb3IgeW91Lgo+Pgo+Pj4+IFJlcGxhY2luZyB0aGUgdGhlIGRpcmVjdCB3cml0ZSBp
biB0aGUga2VybmVsIHdpdGggY2FsbHMgdG8gd3JpdGVsKCkgb3IKPj4+PiBtZW1zZXRfaW8oKSB3
aWxsIGZpeCB0aGF0IHRlbXBvcmFyeSwgYnV0IHlvdSBoYXZlIGEgbW9yZSBnZW5lcmFsIAo+Pj4+
IHByb2JsZW0gaGVyZS4KPj4+IEkgY2Fubm90IHNlZSB3aGF0J3MgdGhlIG1vcmUgZ2VuZXJhbCBw
cm9ibGVtIGhlcmUgOiggdSBtZWFuIAo+Pj4gcGVyZm9ybWFuY2U/Cj4+Cj4+IE5vLCBub3QgcGVy
Zm9ybWFuY2UuIFNlZSBzdGFuZGFyZHMgbGlrZSBPcGVuR0wsIFZ1bGthbiBhcyB3ZWxsIGFzIAo+
PiBWQS1BUEkgYW5kIFZEUEFVIHJlcXVpcmUgdGhhdCB5b3UgY2FuIG1tYXAoKSBkZXZpY2UgbWVt
b3J5IGFuZCAKPj4gZXhlY3V0ZSBtZW1zZXQvbWVtY3B5IG9uIHRoZSBtZW1vcnkgZnJvbSB1c2Vy
c3BhY2UuCj4+Cj4+IElmIHlvdXIgQVJNIGJhc2UgYm9hcmQgY2FuJ3QgZG8gdGhhdCBmb3Igc29t
ZSB0aGVuIHlvdSBjYW4ndCB1c2UgdGhlIAo+PiBoYXJkd2FyZSB3aXRoIHRoYXQgYm9hcmQuCj4K
PiBJZiB0aGUgVlJBTSBsaXZlcyBpbiBhIHByZWZldGNoYWJsZSBQQ0kgYmFyIHRoZW4gb24gbW9z
dCBzYW5lIAo+IEFybS1iYXNlZCBzeXN0ZW1zIEkgYmVsaWV2ZSBpdCBzaG91bGQgYmUgYWJsZSB0
byBtbWFwKCkgdG8gdXNlcnNwYWNlIAo+IHdpdGggdGhlIE5vcm1hbCBtZW1vcnkgdHlwZSwgd2hl
cmUgdW5hbGlnbmVkIGFjY2Vzc2VzIGFuZCBzdWNoIGFyZSAKPiBhbGxvd2VkLCBhcyBvcHBvc2Vk
IHRvIHRoZSBEZXZpY2UgbWVtb3J5IHR5cGUgaW50ZW5kZWQgZm9yIE1NSU8gCj4gbWFwcGluZ3Ms
IHdoaWNoIGhhcyBtb3JlIHJlc3RyaWN0aW9ucyBidXQgc3RyaWN0ZXIgb3JkZXJpbmcgZ3VhcmFu
dGVlcy4KCkRvIHlvdSBoYXZlIHNvbWUgYmFja2dyb3VuZCB3aHkgc29tZSBBUk0gYm9hcmRzIGZh
aWwgd2l0aCB0aGF0PwoKV2UgaGFkIGEgY291cGxlIG9mIHJlcG9ydHMgdGhhdCBtZW1zZXQvbWVt
Y3B5IGZhaWwgaW4gdXNlcnNwYWNlICh1c3VhbGx5IApzeXN0ZW0ganVzdCBzcG9udGFuZW91c2x5
IHJlYm9vdHMgb3IgYmVjb21lcyB1bnJlc3BvbnNpdmUpLCBidXQgc28gZmFyIApub2JvZHkgY291
bGQgdGVsbCB1cyB3aHkgdGhhdCBoYXBwZW5zPwoKPgo+IFJlZ2FyZGxlc3Mgb2Ygd2hhdCBoYXBw
ZW5zIGVsc2V3aGVyZSB0aG91Z2gsIGlmIHNvbWV0aGluZyBpcyBtYXBwZWQgCj4gKmludG8gdGhl
IGtlcm5lbCogd2l0aCBpb3JlbWFwKCksIHRoZW4gaXQgaXMgZnVuZGFtZW50YWxseSB3cm9uZyBw
ZXIgCj4gdGhlIGtlcm5lbCBtZW1vcnkgbW9kZWwgdG8gcmVmZXJlbmNlIHRoYXQgbWFwcGluZyBk
aXJlY3RseSB3aXRob3V0IAo+IHVzaW5nIEkvTyBhY2Nlc3NvcnMuIFRoYXQgaXMgbm90IHNwZWNp
ZmljIHRvIGFueSBpbmRpdmlkdWFsIAo+IGFyY2hpdGVjdHVyZSwgYW5kIFNwYXJzZSBzaG91bGQg
YmUgc2NyZWFtaW5nIGFib3V0IGl0IGFscmVhZHkuIEkgZ3Vlc3MgCj4gaW4gdGhpcyBjYXNlIHRo
ZSBVVkQgY29kZSBuZWVkcyB0byBwYXkgbW9yZSBhdHRlbnRpb24gdG8gd2hldGhlciAKPiByYWRl
b25fYm9fa21hcCgpIGVuZHMgdXAgZ29pbmcgdmlhIHR0bV9ib19pb3JlbWFwKCkgb3Igbm90LgoK
WWVzLCBleGFjdGx5LiBUaGF0J3Mgd2h5IHdlIGFscmVhZHkgaGF2ZSBtZW1jcHlfZnJvbWlvKCkv
bWVtY3B5X3RvaW8oKSAKdG8gdXBsb2FkIHRoZSBmaXJtd2FyZSBhbmQgc2F2ZSB0aGUgc3RhdGUg
b24gc3VzcGVuZC9yZXN1bWUuCgpJdCdzIGp1c3QgdGhhdCBpbiB0aGlzIGNhc2UgaGVyZSB3ZSBh
bHNvIGhhdmUgSU8gbWVtb3J5IGJlY2F1c2Ugc29tZSAxNSsgCnllYXJzIG9sZCBBR1AgYmFzZWQg
aGFyZHdhcmUgZG9lc24ndCB3b3JrIHdoZW4geW91IGJ1dCBpdCBpbiBzeXN0ZW0gCm1lbW9yeSA6
KQoKU28gcG9pbnRpbmcgdGhhdCBvdXQgaXMgY29ycmVjdCBhbmQgSSdtIGdvaW5nIHRvIGNsZWFu
IHRoYXQgdXAgbm93LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IChJJ20gYXNzdW1pbmcgdGhl
IGluaXRpYWwgZmF1bHQgd2FzIG1lbXNldCgpIHdpdGggMCB0cnlpbmcgdG8gcGVyZm9ybSAKPiAi
REMgWlZBIiBvbiBhIERldmljZS10eXBlIG1hcHBpbmcgZnJvbSBpb3JlbWFwKCkgLSBGWUkgYSBz
dGFja3RyYWNlIG9uIAo+IGl0cyBvd24gd2l0aG91dCB0aGUgcmVzdCBvZiB0aGUgZXJyb3IgZHVt
cCBzaG93aW5nIHdoYXQgYWN0dWFsbHkgCj4gdHJpZ2dlcmVkIGl0IGlzbid0IG92ZXJseSB1c2Vm
dWwpCj4KPiBSb2Jpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
