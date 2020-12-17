Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D12B2DD2C4
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 15:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841CE893A4;
	Thu, 17 Dec 2020 14:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062.outbound.protection.outlook.com [40.107.220.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACE0890ED
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 14:17:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbIjE59QfrcQIT4SegHNiPiT9QqC7gkIiXzMGRZHRHTPmXW0AzM1lTr5jWQBK53YFYw6pfHyCI/7eJ3SFmEbE6ZDqzZLU2pyQwgwYnnb9ssf3vCbf3vgiz9T/iJ8dWMgISdMGluOMTg/U8xUG8qeRdnpAMx7vWLjxaHWbez9H9jPTWYyzP4CQoS6MTX0xGgur9bhb2lBuQt1xkzVVTuo12Dc++VLkWsZSs3K8clZ391VI2E1a0ddqj9mjN+DOEMDMbsfNW1E3KQHhIMXrUy31c5hDAzTfaFWZQzB1Mfs49CUkNQbIiFbo03VCUwzF644Zu/lo2jA6p3oLQPeXAkpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88oPQygaKlXZi+UzeFiuXxTnyL/EvVjaCNaxKy0+jmw=;
 b=V9E0heLl4M95JxrfM6Fb87bO3Mh+lygmQ+YH6p6vJl+/ynGhJM4BXqDlPextv+rFszloYCd6X2gbINnY7zyYtZ2FMPx+2BiRQT8IrX4YMvqIeGuD5CHIsIT8xZfE9bHFL3SEioLW9/pohVLx5BnCk3+ZQ/0OPVL1PsvMxHNuTzbjB/bPCGIqEY+p+LC811tuoRgYVX+lAfCnoXgWp8jX/pAb65p+aMObddAeobddhjRMauy1y96wjSixiCWiFR/iEWv1achnwoJu/3K14prETpbBXlWZbkeT9lOEtLLmRYWc9aLypARqhuZ5U7ToneRW9vTySI0jDSWr+VzTmKUqSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88oPQygaKlXZi+UzeFiuXxTnyL/EvVjaCNaxKy0+jmw=;
 b=kH0hl5VHlBo3PcqfOsbwO8YVKZbZ32d/B7JaIHwGJzcEaLva6guDYU7X195lze8+7JfKceDSriGNXPAkyfuH6FaZ/I8N7ohicoLK9iSVuj754zKX+aNY1+4ylbv42HJXku837TmQZUH4z2lMfEYR0g6YzKYVMT49cIe+gu0xbsE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2548.namprd12.prod.outlook.com (2603:10b6:207:41::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Thu, 17 Dec
 2020 14:17:03 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 14:17:03 +0000
Subject: Re: [PATCH] drm/[amdgpu|radeon]: fix memset on io mem
To: Chen Li <chenli@uniontech.com>
References: <877dpiz4sf.wl-chenli@uniontech.com>
 <4277816d-db00-7e81-a2fb-069aeee18e8b@amd.com>
 <875z51zwsq.wl-chenli@uniontech.com>
 <90b625e2-2409-d13b-2456-483ad4eef18f@amd.com>
 <873605z1du.wl-chenli@uniontech.com>
 <7920fd29-3f95-2109-07ee-15659e80dc40@amd.com>
 <877dpgimec.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b21a574d-ca11-c139-eaae-61a75cc4278b@amd.com>
Date: Thu, 17 Dec 2020 15:16:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <877dpgimec.wl-chenli@uniontech.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR08CA0025.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::38) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR08CA0025.eurprd08.prod.outlook.com (2603:10a6:208:d2::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Thu, 17 Dec 2020 14:17:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ba686f7c-f9c5-4aea-46cb-08d8a2966d1b
X-MS-TrafficTypeDiagnostic: BL0PR12MB2548:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB254840A364A3BE8977DCC43983C40@BL0PR12MB2548.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g7/vvTdmoPrtvcC58/o/TSTj62uv405Xf+z64qqryyTD/ouvIIuaHUgJKhZ3HwzeaM7JrouNPLmOWZzpFQr1ch0mQpdQmrSHVH/lghCvm2lzqO2+J+34fMV4UhHrNowRhFPts2aipbdwBQ/TPc60FQQnCmIJIgVfra5Ierdt0gj8kn8uooyzBq3HOtNXaE12UARdyTrJiwuwsDJaTCqpPHaSBV8nAx4/Ti/WHYdyHz5w+5fnxh+EjB/823zfKu7RWxtnNfjT2ZqMWlQdGgOprncl6++O+FVpDkKD2hm9+zUywKso+zLWOmsz8T0h5RviguSd52o89Z7o43+aOn3JyaEUnyKLmswRGbciccarpXqYnBUu69yF6BeAt/lw6ZLcQsGmhT3OPXZRB4+vkb9IkygVy/GkrWBcStZxclbou9G1acGINVW4Hy7KMaFKKxWwbXTF35EDDVJeJ3A+7SzuL+sLdmNFIMiDpXtSGZrHzJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(8676002)(6666004)(186003)(8936002)(6916009)(86362001)(316002)(31686004)(66476007)(83380400001)(45080400002)(478600001)(66574015)(36756003)(31696002)(16526019)(966005)(6486002)(52116002)(2906002)(5660300002)(66556008)(66946007)(4326008)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WlpJd2Y2NU05ZEVlbHRMRlhpazFGdVZ6TXZ0a3ZlK0ovNkJwaVlycFRicTJH?=
 =?utf-8?B?Tk9IYk5Nd09kM2ZHaytmeU52NVN6RVJyNm5BQUJjTGxKam5sTm5ZaHU0a01T?=
 =?utf-8?B?a1ZLeWJGN2VZS2ViQ2VUbDNscVMrWitFYW1hNEtYT2lnanYxbk8wYWlPSzVY?=
 =?utf-8?B?WEVXeHZkZlNRYitDQi9DNGhYeDhnSTJYM1Z5Y0pITFI5cnl5QnZZaUVGbVRW?=
 =?utf-8?B?WWVBR1lzMldZdnBHcHllMVJxdFpyME1ZbEsrQzdrTVYzRHB5MGNnamQ0QjFn?=
 =?utf-8?B?K2pucUp4MUIwWWVLV2wxaEhyN2VBMW9BSGdtU3RqN01yNEczd1liR3BERkZ4?=
 =?utf-8?B?b0IvTW45NkcwRWVCRTBvaTNVcDlKNUQzckdZbXlpNmhnZWFhM3lYTWdGaFhi?=
 =?utf-8?B?eUc4M0EwRzBLekhqQURGcENETUFPK3o3dFlzYlM3NkVEczJpQ1NQTXpNbnNk?=
 =?utf-8?B?MEc2ck1NN3hKTWZONTlrNFdUYnlqWEZCcVJ4LzNYbjNnRzdlRUVZejU0RS9K?=
 =?utf-8?B?STJpbi8yamFpblhHMzFCYklOMWZVQTk0UU9WT2FyYWZBSHpyQ3U4TTBlNnNB?=
 =?utf-8?B?MEh0MlI0Z1UxSG1sUG1adDJjeWxFMEE2M2pEaTRNeHUwTGdKcU1WSkhuc0xE?=
 =?utf-8?B?Q0VldHpjdWlhRjRoQ1grTHdQZjdQT3lNY3VmS0x0ckZjUlkzM1Z3cjdiV3Z2?=
 =?utf-8?B?dTVhalljRys0dzVTemRLTWJQVzBIL2cxa3VtUWRWRWNRdGhlQnI5RFVrdEp2?=
 =?utf-8?B?aU41NnM5OUI4bjJwaFFwYkxuLytZZlIrcmQvdEFkWXhwcmZOYktlSWxmV3dD?=
 =?utf-8?B?enZMWnh2NnlCeWhub3FkNERBWXZyUzRXS2tkNE1EMlc3YUhHSmtkZWpzanpI?=
 =?utf-8?B?YlhicmZsSnIwelhwUjVJanBjS0NkY1RoWUVJMk8ydGJrZWF1SHpoVVZUV0xE?=
 =?utf-8?B?djhmYmtucjlLYnRvTFZsU2t6VXpTdVQ1QWZ6anNaaTVMd2dsanlUbmMwN0t1?=
 =?utf-8?B?QkIxUFNHSG5pYWRyeGtaMnNRZ3ZxQ0Iyc2tjY1RENWlUUGNXQ2dwZG42VVhG?=
 =?utf-8?B?OCtEbjNRT3JkdE1jMjVNRkdJSmc0MVRhcWVLR0IxVFl0dkc4Z3V6OFVScEs4?=
 =?utf-8?B?eG9QZ2hwbGVqR3JtQ3QzSll6ZEY1QnpVU0pMVFUzaVdianJScjlwMGNHZ0Vl?=
 =?utf-8?B?L1ArYXpDTDdWMWdLL0V2WXJ4SllnT0ExWjJGTmoyMEptRzEvVENaRHhnbXdN?=
 =?utf-8?B?YWlZQU0rR0ZQUFlJQld3OERZT1dCMlVGQXh6K0pNR0dVUjdBdmpxRS9vYm91?=
 =?utf-8?B?Nld3QUNaR0h0bWFndkhvNXprbUdqb2daNlpSL1hvMzNXbEVGcmZIYUZ2MmU2?=
 =?utf-8?B?bE9xdUZYUFlpYXhralpmcVI0QTZTblh3Wk8rNDNBWEIycXJieHFlVmNpelBY?=
 =?utf-8?Q?NKtPOJGH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2020 14:17:03.1323 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: ba686f7c-f9c5-4aea-46cb-08d8a2966d1b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFN4bjN3lc8GcYwcwanrZ2+7G98wbZSkwzzV0GOhrv+Eh96J5XwWNyglrHjNnzZ7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2548
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

QW0gMTcuMTIuMjAgdW0gMTQ6Mzcgc2NocmllYiBDaGVuIExpOgo+IE9uIFRodSwgMTcgRGVjIDIw
MjAgMTg6MjU6MTEgKzA4MDAsCj4gQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMTcuMTIu
MjAgdW0gMDI6MDcgc2NocmllYiBDaGVuIExpOgo+Pj4gT24gV2VkLCAxNiBEZWMgMjAyMCAyMjox
OToxMSArMDgwMCwKPj4+IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4gQW0gMTYuMTIuMjAg
dW0gMTQ6NDggc2NocmllYiBDaGVuIExpOgo+Pj4+PiBPbiBXZWQsIDE2IERlYyAyMDIwIDE1OjU5
OjM3ICswODAwLAo+Pj4+PiBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4gW1NOSVBdCj4+
Pj4+IEhpLCBDaHJpc3RpYW4uIEknbSBub3Qgc3VyZSB3aHkgdGhpcyBjaGFuZ2UgaXMgYSBoYWNr
IGhlcmUuIEkgY2Fubm90IHNlZSB0aGUgcHJvYmxlbSBhbmQgd2xsIGJlIGdyYXRlZnVsIGlmIHlv
dSBnaXZlIG1vcmUgZXhwbGFpbmF0aW9ucy4KPj4+PiBfX21lbXNldCBpcyBzdXBwb3NlZCB0byB3
b3JrIG9uIHRob3NlIGFkZHJlc3Nlcywgb3RoZXJ3aXNlIHlvdSBjYW4ndCB1c2UgdGhlCj4+Pj4g
ZTg4NjAgb24geW91ciBhcm02NCBzeXN0ZW0uCj4+PiBJZiBfX21lbXNldCBpcyBzdXBwb3NlZCB0
byB3b3JrIG9uIHRob3NlIGFkcmVzc2VzLCB3aHkgdGhpcyBjb21taXQoaHR0cHM6Ly9uYW0xMS5z
YWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHVi
LmNvbSUyRnRvcnZhbGRzJTJGbGludXglMkZjb21taXQlMkZiYTBiMjI3NWE2NzgxYjJmMzkxOWQ5
MzFkNjMzMjliNTU0OGY2ZDVmJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQw
YW1kLmNvbSU3Q2ZkYjRjYTNlMDVhZDRlYTQ4ODI0MDhkOGEyOTE0ZmJjJTdDM2RkODk2MWZlNDg4
NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQzODA5MjI5NzY3ODM2MyU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pC
VGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT04OG9BVWxFaG5zVk5T
cVlJZlhrJTJCODExb1hZZDE4WFBTY1ZaNGNlQXVyTmslM0QmYW1wO3Jlc2VydmVkPTApIGlzIG5l
ZWRlZD8gKEkgYWxzbyBub3RpY2UgZHJtL3JhZGVvbiBkaWRuJ3QgdGFrZSB0aGlzIGNoYW5nZSB0
aG91Z2gpIGp1c3Qgb3V0IG9mIGN1cmlvc2l0eS4KPj4gV2UgZ2VuZXJhbGx5IGFjY2VwdCB0aG9z
ZSBwYXRjaGVzIGFzIGNsZWFudXAgaW4gdGhlIGtlcm5lbCB3aXRoIHRoZSBob3BlIHRoYXQgd2UK
Pj4gY2FuIGZpbmQgYSB3YXkgdG8gd29yayBhcm91bmQgdGhlIHVzZXJzcGFjZSByZXN0cmljdGlv
bnMuCj4gV2hhdCdzIHRoZSB1c2Vyc3BhY2UgcmVzdHJpY3Rpb24gaGVyZT8gbW1hcCBkZXZpY2Ug
bWVtb3J5PwoKWWVzLCBleGFjdGx5IHRoYXQuCgo+PiBCdXQgd2hlbiB5b3UgYWxzbyBoYXZlIHRo
aXMgaXNzdWUgaW4gdXNlcnNwYWNlIHRoZW4gdGhlcmUgaXNuJ3QgbXVjaCB3ZSBjYW4gZG8KPj4g
Zm9yIHlvdS4KPj4KPj4+PiBSZXBsYWNpbmcgdGhlIHRoZSBkaXJlY3Qgd3JpdGUgaW4gdGhlIGtl
cm5lbCB3aXRoIGNhbGxzIHRvIHdyaXRlbCgpIG9yCj4+Pj4gbWVtc2V0X2lvKCkgd2lsbCBmaXgg
dGhhdCB0ZW1wb3JhcnksIGJ1dCB5b3UgaGF2ZSBhIG1vcmUgZ2VuZXJhbCBwcm9ibGVtIGhlcmUu
Cj4+PiAgICBJIGNhbm5vdCBzZWUgd2hhdCdzIHRoZSBtb3JlIGdlbmVyYWwgcHJvYmxlbSBoZXJl
IDooIHUgbWVhbiBwZXJmb3JtYW5jZT8KPj4gTm8sIG5vdCBwZXJmb3JtYW5jZS4gU2VlIHN0YW5k
YXJkcyBsaWtlIE9wZW5HTCwgVnVsa2FuIGFzIHdlbGwgYXMgVkEtQVBJIGFuZAo+PiBWRFBBVSBy
ZXF1aXJlIHRoYXQgeW91IGNhbiBtbWFwKCkgZGV2aWNlIG1lbW9yeSBhbmQgZXhlY3V0ZSBtZW1z
ZXQvbWVtY3B5IG9uIHRoZQo+PiBtZW1vcnkgZnJvbSB1c2Vyc3BhY2UuCj4+Cj4+IElmIHlvdXIg
QVJNIGJhc2UgYm9hcmQgY2FuJ3QgZG8gdGhhdCBmb3Igc29tZSB0aGVuIHlvdSBjYW4ndCB1c2Ug
dGhlIGhhcmR3YXJlCj4+IHdpdGggdGhhdCBib2FyZC4KPiBHb29kIHRvIGtub3csIHRoYW5rcyEg
QlRXLCBoYXZlIHlvdSBldmVyIHNlZW4gb3IgaGVhcmQgYm9hcmRzIGxpa2UgbWluZSB3aGljaCBj
YW5ub3QgbW1hcCBkZXZpY2UgbWVtb3J5IGNvcnJlY3RseSBmcm9tIHVzZXJzcGFjZSBjb3JyZWN0
bHk/CgpVbmZvcnR1bmF0ZWx5IHllcy4gV2UgaGF2ZW4ndCBiZWVuIGFibGUgdG8gZmlndXJlIG91
dCB3aGF0IGV4YWN0bHkgZ29lcyAKd3JvbmcgaW4gdGhvc2UgY2FzZXMuCgo+Pj4+Pj4gRm9yIGFt
ZGdwdSBJIHN1Z2dlc3QgdGhhdCB3ZSBhbGxvY2F0ZSB0aGUgVVZEIG1lc3NhZ2UgaW4gR1RUIGlu
c3RlYWQgb2YgVlJBTQo+Pj4+Pj4gc2luY2Ugd2UgZG9uJ3QgaGF2ZSB0aGUgaGFyZHdhcmUgcmVz
dHJpY3Rpb24gZm9yIHRoYXQgb24gdGhlIG5ldyBnZW5lcmF0aW9ucy4KPj4+Pj4+Cj4+Pj4+IFRo
YW5rcywgSSB3aWxsIHRyeSB0byBkaWcgaW50byBkZWVwZXIuIEJ1dCB3aGF0J3MgdGhlICJoYXJk
d2FyZSByZXN0cmljdGlvbiIgbWVhbmluZyBoZXJlPyBJJ20gbm90IGZhbWlsaWFyIHdpdGggdmlk
ZW8gZHJpdmVyIHN0YWNrIGFuZCBhbWQgZ3B1LCBzb3JyeS4KPj4+PiBPbiBvbGRlciBoYXJkd2Fy
ZSAoQUdQIGRheXMpIHRoZSBidWZmZXIgaGFkIHRvIGJlIGluIFZSQU0gKE1NSU8pIG1lbW9yeSwg
YnV0IG9uCj4+Pj4gbW9kZXJuIHN5c3RlbSBHVFQgKHN5c3RlbSBtZW1vcnkpIHdvcmtzIGFzIHdl
bGwuCj4+PiBJSVVDLCBlODg2MCBjYW4gdXNlIGFtZGdwdShJIHVzZSByYWRlb24gbm93KSBiZWF1
c2UgaXRzIGRldmljZSBpZCA2ODIyIGlzIGluIGFtZGdwdSdzIHRhYmxlLiBCdXQgSSBjYW5ub3Qg
dGVsbCB3aGV0aGVyIGU4ODYwIGhhcyBpb21tdSwgYW5kIEkgY2Fubm90IGZpbmQgaW9tbXUgZnJv
bSBsc3BjaSwgc28gZ3JhcGhpY3MgdHJhbnNsYXRpb24gdGFibGUgbWF5IG5vdCB3b3JrIGhlcmU/
Cj4+IFRoYXQgaXMgbm90IHJlbGF0ZWQgdG8gSU9NTVUuIElPTU1VIGlzIGEgZmVhdHVyZSBvZiB0
aGUgQ1BVL21vdGhlcmJvYXJkLiBUaGlzIGlzCj4+IGltcGxlbWVudGVkIHVzaW5nIEdUVCwgZS5n
LiB0aGUgVk0gcGFnZSB0YWJsZXMgaW5zaWRlIHRoZSBHUFUuCj4+Cj4+IEFuZCB5ZXMgaXQgc2hv
dWxkIHdvcmsgSSB3aWxsIHByZXBhcmUgYSBwYXRjaCBmb3IgaXQuCj4gSSB0aGluayB5b3UgbWVh
biBtbXUgOikKCk5vLCBJIHJlYWxseSBtZWFudCBJT01NVS4KCj4gUmVmZXIgdG8gd2lraXBlZGlh
OiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0
cHM6JTJGJTJGZW4ud2lraXBlZGlhLm9yZyUyRndpa2klMkZJbnB1dCUyNUUyJTI1ODAlMjU5M291
dHB1dF9tZW1vcnlfbWFuYWdlbWVudF91bml0JTIzOn46dGV4dCUzREluJTI1MjBjb21wdXRpbmcl
MjUyQyUyNTIwYW4lMjUyMGlucHV0JTI1RTIlMjU4MCUyNTkzb3V0cHV0JTJDYnVzJTI1MjB0byUy
NTIwdGhlJTI1MjBtYWluJTI1MjBtZW1vcnkmYW1wO2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5r
b2VuaWclNDBhbWQuY29tJTdDZmRiNGNhM2UwNWFkNGVhNDg4MjQwOGQ4YTI5MTRmYmMlN0MzZGQ4
OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3NDM4MDkyMjk3Njc4MzYz
JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1
TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPXQ2TkRp
OGRpZFU3R0Z6YUNTTUZ2ZFNUS0ElMkZtUloxY2dQQ3BZN2xmN1VLbyUzRCZhbXA7cmVzZXJ2ZWQ9
MC4KPgo+ICAgICAgSW4gY29tcHV0aW5nLCBhbiBpbnB1dOKAk291dHB1dCBtZW1vcnkgbWFuYWdl
bWVudCB1bml0IChJT01NVSkgaXMgYSBtZW1vcnkgbWFuYWdlbWVudCB1bml0IChNTVUpIHRoYXQg
Y29ubmVjdHMgYSBkaXJlY3QtbWVtb3J5LWFjY2Vzc+KAk2NhcGFibGUgKERNQS1jYXBhYmxlKSBJ
L08gYnVzIHRvIHRoZSBtYWluIG1lbW9yeS4gTGlrZSBhIHRyYWRpdGlvbmFsIE1NVSwgd2hpY2gg
dHJhbnNsYXRlcyBDUFUtdmlzaWJsZSB2aXJ0dWFsIGFkZHJlc3NlcyB0byBwaHlzaWNhbCBhZGRy
ZXNzZXMsIHRoZSBJT01NVSBtYXBzIGRldmljZS12aXNpYmxlIHZpcnR1YWwgYWRkcmVzc2VzIChh
bHNvIGNhbGxlZCBkZXZpY2UgYWRkcmVzc2VzIG9yIEkvTyBhZGRyZXNzZXMgaW4gdGhpcyBjb250
ZXh0KSB0byBwaHlzaWNhbCBhZGRyZXNzZXMuIFNvbWUgdW5pdHMgYWxzbyBwcm92aWRlIG1lbW9y
eSBwcm90ZWN0aW9uIGZyb20gZmF1bHR5IG9yIG1hbGljaW91cyBkZXZpY2VzLgo+ICAgICAgQW4g
ZXhhbXBsZSBJT01NVSBpcyB0aGUgZ3JhcGhpY3MgYWRkcmVzcyByZW1hcHBpbmcgdGFibGUgKEdB
UlQpIHVzZWQgYnkgQUdQIGFuZCBQQ0kgRXhwcmVzcyBncmFwaGljcyBjYXJkcyBvbiBJbnRlbCBB
cmNoaXRlY3R1cmUgYW5kIEFNRCBjb21wdXRlcnMuCgpNYXliZSBzb21lYm9keSBzaG91bGQgY2xh
cmlmeSB0aGUgd2lraXBlZGlhIGFydGljbGUgYSBiaXQgc2luY2UgdGhpcyBpcyAKdG8gZ2VuZXJh
bCBhbmQgbWlzbGVhZGluZy4KClRoZSBrZXkgZGlmZmVyZW5jZSBpcyB0aGF0IHRvZGF5IElPTU1V
IHVzdWFsbHkgcmVmZXJzIHRvIHRoZSBNTVUgYmxvY2sgCmluIHRoZSBQQ0llIHJvb3QgY29tcGxl
eCBvZiB0aGUgQ1BVLgoKPiBHQVJUIHNob3VsZCBiZSBhbnRvaGVyIGFiYmVyIG9mIEdUVChodHRw
czovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0El
MkYlMkZlbi53aWtpcGVkaWEub3JnJTJGd2lraSUyRkdyYXBoaWNzX2FkZHJlc3NfcmVtYXBwaW5n
X3RhYmxlJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3Q2Zk
YjRjYTNlMDVhZDRlYTQ4ODI0MDhkOGEyOTE0ZmJjJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJk
OTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQzODA5MjI5NzY3ODM2MyU3Q1Vua25vd24lN0NUV0ZwYkda
c2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dp
TENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1iNThvb2Ryb1JFRDclMkZPb2NKUUlKNWw5
eDZSbzVwODk1RUljUiUyRjN2RXhCMCUzRCZhbXA7cmVzZXJ2ZWQ9MCk6Cj4KPiAgICAgIFRoZSBn
cmFwaGljcyBhZGRyZXNzIHJlbWFwcGluZyB0YWJsZSAoR0FSVCksWzFdIGFsc28ga25vd24gYXMg
dGhlIGdyYXBoaWNzIGFwZXJ0dXJlIHJlbWFwcGluZyB0YWJsZSxbMl0gb3IgZ3JhcGhpY3MgdHJh
bnNsYXRpb24gdGFibGUgKEdUVCksWzNdIGlzIGFuIEkvTyBtZW1vcnkgbWFuYWdlbWVudCB1bml0
IChJT01NVSkgdXNlZCBieSBBY2NlbGVyYXRlZCBHcmFwaGljcyBQb3J0IChBR1ApIGFuZCBQQ0kg
RXhwcmVzcyAoUENJZSkgZ3JhcGhpY3MgY2FyZHMuCgpHQVJUIG9yIEdUVCByZWZlcnMgdG8gdGhl
IHRyYW5zbGF0aW9uIHRhYmxlcyBncmFwaGljcyBoYXJkd2FyZSB1c2UgdG8gCmFjY2VzcyBzeXN0
ZW0gbWVtb3J5LgoKU29tZXRoaW5nIGxpa2UgMTUgeWVhcnMgYWdvIHdlIHVzZWQgdGhlIElPTU1V
IGZ1bmN0aW9uYWxpdHkgZnJvbSBBR1AgdG8gCmltcGxlbWVudCB0aGF0LiBCdXQgbW9kZXJuIGhh
cmR3YXJlIChQQ0llKSB1c2VzIHNvbWUgc3BlY2lhbGl6ZWQgCmhhcmR3YXJlIGluIHRoZSBHUFUg
Zm9yIHRoYXQuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
