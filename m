Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C787A32D91B
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 18:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E156EA58;
	Thu,  4 Mar 2021 17:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C7589115;
 Thu,  4 Mar 2021 17:58:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0SCLhycZV5L6JyjdI1h3e3tFySK+gQiSTSn0xzN0tNA0/BSSGXoci9cgQmso++cMYxMz7/4gekl9BI5cw2WHuLXnP7ohbLmOUsoOK+yMnJlyU/xAaJeSAe0BhLDY0meekjUFonQ7F4qFqOsBjk3L96fJ6cfK9YZR9P7JzC2JbULWJ0O6G8Nq4G7k5gToW5HFMZrfzgrMP4DBBcu99ad13ug/fHnybL5RGt8tLjQnrfKPNZ1vxjAz6S+MhmyQQtgtHW/ByL1ghINsIPEd+UWMh1WmNm20fFBu/eIsyeySoiSyaWOROt6mFa8I3YaIlSN8bhQfN11R/L5sM463Zomdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cKemECwIozbf+8JWC69oyC2SPQfbNClCxiRl7q83cM=;
 b=OqurPL4lvSOSzfioK71xjwftosRGSJQMBkjmkxLJA5+0zOxpgXT/Q2icUtntHGLyrc1zB0xXQqwj0at3GJl/SZn3AzWa4v0MCew/+5wV0g8XYopMfyuSwUVXVJ4HVpk01BMpYaFKpe2FiykKXDhlkasHZXzV3d9R1WgcfNbNSXPWPGErP87NdQSuRu2O2FSUUeltbASKjp6TxdTHewSVoXDHWwKOSSSIjxU3XIlt9fbjZKXhERRYsRG42/YPPtZQb+jMmDXkgVs9/CCIUF3vBMp53fe6/YhF5TJHpJnER61zLkpxPWHQFgLQ0p779BUwYvn6hNJTKv6iHYz2MlNijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cKemECwIozbf+8JWC69oyC2SPQfbNClCxiRl7q83cM=;
 b=cT1cy8k7+nIgymroTeOfftO0hYsTlxZt3tjHbOHeCPqn8aWUJHZRhGBqbPkvuu9V8OAJEy0qCWatlCbEgRUUTBLKJutbO2xbBKzEDCqt6k4KpRm5T0GeTB5DoBmbWVAsj6Qb8af2SvYaE5jzgZMFBaEfX/xRj/m7Lwn6IfCSh6g=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4206.namprd12.prod.outlook.com (2603:10b6:208:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 17:58:02 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%9]) with mapi id 15.20.3784.030; Thu, 4 Mar 2021
 17:58:02 +0000
Subject: Re: [PATCH 17/35] drm/amdkfd: register HMM device private zone
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <20210107030127.20393-18-Felix.Kuehling@amd.com>
 <CAKMK7uEd9KZAmeNd9Z9GF9p0yUButHc+8_PERRuNR79+uqAhbQ@mail.gmail.com>
 <7f837938-3ad8-6ecf-d2b7-952b177cffb8@shipmail.org>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <db2d652b-8a6e-d38f-8c08-2ac3a070f4be@amd.com>
Date: Thu, 4 Mar 2021 12:58:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <7f837938-3ad8-6ecf-d2b7-952b177cffb8@shipmail.org>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::25) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YT1PR01CA0056.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.24 via Frontend Transport; Thu, 4 Mar 2021 17:58:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e7647a3d-382d-49fd-db68-08d8df370da7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB420689ED108886C97A2951D492979@MN2PR12MB4206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4PpTcvwF2lDig55pVPwcOpwe7hltZ3M8hfdMYLRB+P56W1MtN8tSgp380rxSOvlmvOGiGk/hiXB4te3nI1Zkvab9GE+ksiUjsniaRY7xto7G7TZp/auzpWlvphVr/Xyx63oSkKHin9kOZ7aEd4A64SaUm4VBRoZGuGja5cFvUmYEP1uDkcPFd6np1PMDcmGmsAnT046gub4Ei/ayHAsm1o/uVqtELgdTNvTVA1JqaJuLHZLnVoUUHBW1L5iTaTN5aEziKMrH86eyZYFEiHTt/M+z4Tzy5WK/mQWbovxE58PQW3f9BtHMSea2KX1BZU1yJClAZL4VojAUnIViW7GBmk7cfrca2FlEty4dz3+u5lVmVt57oShGr0SxpjJoh8k/9wTvPSGDraG6mmLRH5yCSHjrnayegib0/DkzMw8a5XszrJIDSKXY3MYHINA6ON01tmQAkYlWgQJ71n1svasTEqvDivDW/MtUo1TRo8SKgouQauc4/NzwpvhjigC5AxGgTwHLWeBPktOw/3U7corDIP72c1sOb8jQhhXc0EPULfTu+RHsOGYrM/qCDFaQBkyazkrrBRH+L78buQmoVVlIQp+twwQvotJ64LkWjGQiO5g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(26005)(4326008)(8936002)(110136005)(8676002)(52116002)(86362001)(186003)(956004)(44832011)(16576012)(316002)(83380400001)(6486002)(16526019)(2616005)(54906003)(53546011)(31696002)(66946007)(36756003)(31686004)(2906002)(66476007)(6636002)(5660300002)(478600001)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1ZhektZT0E1RmprVDJXVnlac2lmQmVhUFMyYW1wQzU2SXNMTm5Wb3B1TGVX?=
 =?utf-8?B?UEp0aUtLZndTWW50YUlNTVdpNWhJQnc4a0dOT2ZoTElDSXN0WkYvWTJZaENz?=
 =?utf-8?B?cVBiM28xcjcyOHdETDAybmNnOEU5OGVwbkNNOWlRTzZFKy9YNzBEdE4vOXlB?=
 =?utf-8?B?M0V5YnN2TVpQcXNQNTIzNmo5RmxGU1ZmeC85R2RITERoZGU2YmpydjFMM2g0?=
 =?utf-8?B?WTM0UzUvZGxzbEZDdkpyL0F5S2RoelN6czFwQlJsK3NydDdEdlpQZCs1Z3Rt?=
 =?utf-8?B?U1JJdTE0UjVMQmJySllPa0Njb0pCT3VobHhzc1hJWHIreU82UzJoa3hBUTA0?=
 =?utf-8?B?TTVXRlVWa3NuQTRUTzFVRWVVUDBEUERkdTBYemFVYXJRRGF6Vk5kOW9aZTFz?=
 =?utf-8?B?L2V5eEFHWlc3aXF0QTlyZlVrNG1jdyttV0NrYk55ak9vdVQ1ZkZ6QU43UDMz?=
 =?utf-8?B?RXZrQldRTGpYVkI0bWxIcituRjI2SXF1cXhtUCs3TE00Vk1TdTJCK2NjeVFw?=
 =?utf-8?B?blp4Y3pReEIvS3dQcHZUN1diYzBseU05ZlFURU5GWnNnaUE2bXFlaytvZEZW?=
 =?utf-8?B?bExuSDlMN28yTUp2Y1RoUld4Ym0rZ0RhdkorNzUwRVZvYVlCbkI4a01CcS9a?=
 =?utf-8?B?bndoakdycnIrSG1DNVU3LzRnNlR6UjR4T3kwVG1SUWE3MnVLR3Y5K2FoUjVx?=
 =?utf-8?B?d0xhRUVDNUtzL3FqS3lSVGx2VGRSeHNrYlJvcjZYVFZ5M2lxUDZOQXNwTjNz?=
 =?utf-8?B?dkE0S2pVZlZUMUx5a2dKalVYMUUyMjg4VWw2dzJINDU3QWpWRCtEK0VxOGdQ?=
 =?utf-8?B?NWlDblcxUE9nSll3M29HNkRJWDlyRHY1TWNpOU9YcTAvWTh2bFJsa3pHR2dN?=
 =?utf-8?B?MXVuNUdoOE9hVFFZSGNqS3pxOGVVZExlNjJTc1hCQUkwYjBRdHRxbzhIWFlt?=
 =?utf-8?B?QnZLQlhoZk9UYndUdkFLclFiQTlZVkc4SWdZeTR4cnQyNnJOR1kvN2s1MWdH?=
 =?utf-8?B?Rk1rSlZ6dHd2blpJQkYxL0JMVVVhb0RKdVFscmhwUHR2NVY3QjErSnd1RXF4?=
 =?utf-8?B?K0xKL01oZitnaG8vRkxpNVRZaEFYLzVEN1Q4S2hwcWtLOVlOaWZHRW5BSU1n?=
 =?utf-8?B?MzJqOW5IaDdHRlFndk5RSmtFWmVMU3dpNXVFbGY1SmloWE93ZklubUxrRVZn?=
 =?utf-8?B?OGxrUXl4cDNDa1pFa1RxT0VBeVdRTys2NWg0aUYxTzlMV1UwNVRuWTlDTW5a?=
 =?utf-8?B?SCt1YW9sd1ZsYnE0SXIxRWJZTUhndVNCL2x0dFZhQThGbWNWWk5BWjZzVTBP?=
 =?utf-8?B?ajIzTkc5U3FCRGp4Slc1aEtwdXA4ODYwdmdBdjBhMzBXQk5wWk40UHZrNkRB?=
 =?utf-8?B?NlFNZnJ6alY1QkRLZDl0NG44bU9FTHQvL01PaWdWdFU1TEhzZnpHMTVaYzk2?=
 =?utf-8?B?aVYxa0V1RGVnR3dOOU92a0FEYmx1YXhkMFFabXlDWlduVW9jY1ZhSTV0cjNI?=
 =?utf-8?B?TnZmeGJ6TjlHWnhHUDM4RTR4VkJaaS9NczVoQzl0QlRjRG95VkU5eXR3a0l4?=
 =?utf-8?B?Tzh4bkRQanhNTlJZeElQUXBJNllSV2RJUlNRdkZ3RTVMZFFkRjFndXlRU3Zx?=
 =?utf-8?B?VEFIOURXNlFPMkhDMGJsb1FEMVRYQ0Z3U1VhaEptaUhYTlZKSEFPN3RiT3l1?=
 =?utf-8?B?WFFnWFQrNDVhOHZlRGt5ei9SQ0E3Uml6YXlOcTVSdWNmVzQxVllOcmZpa3Bn?=
 =?utf-8?Q?eNonOi0jCibXkMCbakAf646GS3tCLBky2L20A87?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7647a3d-382d-49fd-db68-08d8df370da7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 17:58:01.9788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4y5si54VZw2lAZKkwTmwQ3o6uAAxzP0Tq4bfJT2QMzxaTMhG9rKdOb2a3o6OpKDg0ooolze5D/CQJrmQf7bmlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4206
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFtIDIwMjEtMDMtMDEgdW0gMzo0NiBhLm0uIHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKElu
dGVsKToKPgo+IE9uIDMvMS8yMSA5OjMyIEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+PiBPbiBX
ZWQsIEphbiAwNiwgMjAyMSBhdCAxMDowMTowOVBNIC0wNTAwLCBGZWxpeCBLdWVobGluZyB3cm90
ZToKPj4+IEZyb206IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgo+Pj4KPj4+IFJl
Z2lzdGVyIHZyYW0gbWVtb3J5IGFzIE1FTU9SWV9ERVZJQ0VfUFJJVkFURSB0eXBlIHJlc291cmNl
LCB0bwo+Pj4gYWxsb2NhdGUgdnJhbSBiYWNraW5nIHBhZ2VzIGZvciBwYWdlIG1pZ3JhdGlvbi4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4K
Pj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29t
Pgo+PiBTbyBtYXliZSBJJ20gZ2V0dGluZyB0aGlzIGFsbCB3cm9uZywgYnV0IEkgdGhpbmsgdGhh
dCB0aGUgY3VycmVudCB0dG0KPj4gZmF1bHQgY29kZSByZWxpZXMgb24gZGV2bWFwIHB0ZSBlbnRy
aWVzIChlc3BlY2lhbGx5IGZvciBodWdlcHRlIGVudHJpZXMpCj4+IHRvIHN0b3AgZ2V0X3VzZXJf
cGFnZXMuIEJ1dCB0aGlzIG9ubHkgd29ya3MgaWYgdGhlIHB0ZSBoYXBwZW5zIHRvIG5vdAo+PiBw
b2ludCBhdCBhIHJhbmdlIHdpdGggZGV2bWFwIHBhZ2VzLgo+Cj4gSSBkb24ndCB0aGluayB0aGF0
J3MgaW4gVFRNIHlldCwgYnV0IHRoZSBwcm9wb3NlZCBmaXgsIHllcyAoc2VlIGVtYWlsCj4gSSBq
dXN0IHNlbnQgaW4gYW5vdGhlciB0aHJlYWQpLAo+IGJ1dCBvbmx5IGZvciBodWdlIHB0ZXMuCj4K
Pj4KPj4gVGhpcyBwYXRjaCBoZXJlIGNoYW5nZXMgdGhhdCwgYW5kIHNvIHByb2JhYmx5IGJyZWFr
cyB0aGlzIGRldm1hcCBwdGUKPj4gaGFjawo+PiB0dG0gaXMgdXNpbmc/Cj4+Cj4+IElmIEknbSBu
b3Qgd3JvbmcgaGVyZSB0aGVuIEkgdGhpbmsgd2UgbmVlZCB0byBmaXJzdCBmaXggdXAgdGhlIHR0
bQo+PiBjb2RlIHRvCj4+IG5vdCB1c2UgdGhlIGRldm1hcCBoYWNrIGFueW1vcmUsIGJlZm9yZSBh
IHR0bSBiYXNlZCBkcml2ZXIgY2FuCj4+IHJlZ2lzdGVyIGEKPj4gZGV2X3BhZ2VtYXAuIEFsc28g
YWRkaW5nIFRob21hcyBzaW5jZSB0aGF0IGp1c3QgY2FtZSB1cCBpbiBhbm90aGVyCj4+IGRpc2N1
c3Npb24uCj4KPiBJdCBkb2Vzbid0IGJyZWFrIHRoZSB0dG0gZGV2bWFwIGhhY2sgcGVyIHNlLCBi
dXQgaXQgaW5kZWVkIGFsbG93cyBndXAKPiB0byB0aGUgcmFuZ2UgcmVnaXN0ZXJlZCwgYnV0IGhl
cmUncyB3aGVyZSBteSBsYWNrIG9mIHVuZGVyc3RhbmRpbmcgd2h5Cj4gd2UgY2FuJ3QgYWxsb3cg
Z3VwLWluZyBUVE0gcHRlcyBpZiB0aGVyZSBpbmRlZWQgaXMgYSBiYWNraW5nCj4gc3RydWN0LXBh
Z2U/IEJlY2F1c2UgcmVnaXN0ZXJpbmcgTUVNT1JZX0RFVklDRV9QUklWQVRFIGltcGxpZXMgdGhh
dCwKPiByaWdodD8KCkkgd2Fzbid0IGF3YXJlIHRoYXQgVFRNIHVzZWQgZGV2bWFwIGF0IGFsbC4g
SWYgaXQgZG9lcywgd2hhdCB0eXBlIG9mCm1lbW9yeSBkb2VzIGl0IHVzZT8KCk1FTU9SWV9ERVZJ
Q0VfUFJJVkFURSBpcyBsaWtlIHN3YXBwZWQgb3V0IG1lbW9yeS4gSXQgY2Fubm90IGJlIG1hcHBl
ZCBpbgp0aGUgQ1BVIHBhZ2UgdGFibGUuIEdVUCB3b3VsZCBjYXVzZSBhIHBhZ2UgZmF1bHQgdG8g
c3dhcCBpdCBiYWNrIGludG8Kc3lzdGVtIG1lbW9yeS4gV2UgYXJlIGxvb2tpbmcgaW50byB1c2Ug
TUVNT1JZX0RFVklDRV9HRU5FUklDIGZvciBhCmZ1dHVyZSBjb2hlcmVudCBtZW1vcnkgYXJjaGl0
ZWN0dXJlLCB3aGVyZSBkZXZpY2UgbWVtb3J5IGNhbiBiZQpjb2hlcmVudGx5IGFjY2Vzc2VkIGJ5
IHRoZSBDUFUgYW5kIEdQVS4KCkFzIEkgdW5kZXJzdGFuZCBpdCwgb3VyIERFVklDRV9QUklWQVRF
IHJlZ2lzdHJhdGlvbiBpcyBub3QgdGllZCB0byBhbgphY3R1YWwgcGh5c2ljYWwgYWRkcmVzcy4g
VGh1cyB5b3VyIGRldm1hcCByZWdpc3RyYXRpb24gYW5kIG91ciBkZXZtYXAKcmVnaXN0cmF0aW9u
IGNvdWxkIHByb2JhYmx5IGNvZXhpc3Qgd2l0aG91dCBhbnkgY29uZmxpY3QuIFlvdSdsbCBqdXN0
CmhhdmUgdGhlIG92ZXJoZWFkIG9mIHR3byBzZXRzIG9mIHN0cnVjdCBwYWdlcyBmb3IgdGhlIHNh
bWUgbWVtb3J5LgoKUmVnYXJkcywKwqAgRmVsaXgKCgo+Cj4gL1Rob21hcwo+Cj4+IC1EYW5pZWwK
Pj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
