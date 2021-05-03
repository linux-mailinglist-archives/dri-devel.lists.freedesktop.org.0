Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E326371F5E
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 20:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078AE6E150;
	Mon,  3 May 2021 18:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A136E150
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 18:13:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3Mhu/Qs6rRnuk98LkwTwStT44joUgSCqbsfsP4e16a4lVj1plScyZGMcTgLC4+4gjjrbm0K25nUPfMZxS1U36m2s1M7oIg3ZF3dCCY0zvEqvirilT5GlWgDgr0iIM/ebuygqF30cYBvYG6c/p9O+4WJfnQnXmqGjWF6w+GVN/f29rNdV/YKmDViulKIAmk5MTBmv4/a9mXzZPVeICybJ2hm+YaBwOT5hkR1uuvljklNDH5NoIOykPQUY7W8guF9sC1d5xGXTyqqVORR+Wl+TZEqyHELGfA5FraN/sKZ7LQ8fW821lctOlrzjY/4XvWzNMs8e+YweLbHcnaTjHOK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtHoDE87uwDPg6nypXfiDYx22e7HFwmWGuYqoYQsst8=;
 b=oZ1ojvEOaA9CfKe46SPhOLZxkPsvcQRs4w1q6l71//1ojuXJNr/dnUdUewwB3jeY70WlP0eZ14zoLg04CRRLI9JQdl3hdvXr87SizFEnjP8kd2BxXEcUJXIii9/y3E5Y5zeiXhAGh9m+keYtRw/vJsDP8WTgfvuifrrLxTFDmDX1mrQi+PXM0ETREq2Iu50pr5bs3PVt61+Qc/k22E1IdjuDQyk1UUKay3n5ZlibrfAfFWGhCv+Zee7BpWS5T+/BpEVjjoCU2kGKRDMvTyVLSwcko7W+pm+n7LgJ3vqqqtpHCkBVzrtJiNPTySD3/xrZ1CM426Oh654Lcx8xOcXHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtHoDE87uwDPg6nypXfiDYx22e7HFwmWGuYqoYQsst8=;
 b=yjCqpY86vvdX+AuLBKV69aHCe39sDXFsGACARUBuzlqkv06BzEK7TPFyQqQ4xijVs27s5UL5dvS5CTRBNGTrf6Qi7ZSrLT+78iPDlWDU24qVzPTpndO4STII5DAf9zOnd+I4UPp1G+0Qbet2BiEIl242ROBIvJeba8mavCkNIWc=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR12MB1768.namprd12.prod.outlook.com (2603:10b6:903:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 3 May
 2021 18:13:43 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630%9]) with mapi id 15.20.4087.044; Mon, 3 May 2021
 18:13:43 +0000
Subject: Re: [PATCH 1/1] drm/vmwgfx: free ttm resource before assigning a new
 one
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
References: <20210503172641.58541-1-nirmoy.das@amd.com>
 <88e1b9af-9570-fdbc-346b-86b55f1f7575@amd.com>
From: Nirmoy <nirmodas@amd.com>
Message-ID: <5efb01ab-d1d4-defe-eec7-466ce48e6aa3@amd.com>
Date: Mon, 3 May 2021 20:13:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <88e1b9af-9570-fdbc-346b-86b55f1f7575@amd.com>
Content-Language: en-US
X-Originating-IP: [165.204.84.11]
X-ClientProxiedBy: BL0PR02CA0052.namprd02.prod.outlook.com
 (2603:10b6:207:3d::29) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.6.116] (165.204.84.11) by
 BL0PR02CA0052.namprd02.prod.outlook.com (2603:10b6:207:3d::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.25 via Frontend Transport; Mon, 3 May 2021 18:13:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0c39fef-0066-42aa-e26b-08d90e5f2f6c
X-MS-TrafficTypeDiagnostic: CY4PR12MB1768:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR12MB1768DAF0C41EE8FDE6CAFA888B5B9@CY4PR12MB1768.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PjpLlWOETOjIn0CeNGB3pgcFzKNe/NmJDOwBslLbAeNdEfQf2eYs4cpfn9xmMzcxj2yJ1Bla/uElmBRcSkmQZLA0Q54apFUxU1iHp4OrAsVOfPwKIBb061QVPktaB8YwnOZl20hwH4NRj1WyJ7D/JkgCloKNmTk6KUBlAkctTqCBremsYEu1fi/uEuv9T79g26bTxafFvrAPywuRAm3wjd6kY+QgPut65GLrNZttDn4N/6t1/uSePU2F19Sblfp8ecmsJMaop1QBfsnbXJjHiX+quJA7iv9qyAwDNuPKyH0RxDIUOBqzK5AsFuG7Or/RQyqFqYDVhjejT403UqF1MPhNdmiDheLBZZ10phMIqC9NOvY7oiF6J3Bfm+QG2yp2hXgYb49zw5apbbfNvmNg9IchaLWbYP9WCbtmAwRZqdh8hmWUAVwmjBZZSK6HpKf8oShPDxahuf3AM9b4FSordQSiHixlilJ3L1FNOG8vdNx/NlISpnFe3U93PXZFW3E5t9DRUP25Z3HCp+zCpHZhEPr4cMtfSL8c7PHxwlp+VLl1GbFkctvAnhG8NtBdyQ7vwPMw8ZwIZf2RC0I1eCZZ3F2LuN3zza3shwTuS/M3sO/kGbBvjCpQdMSCW4TxJaDyLMO2/vWtPZS8Hv0yheMuohlRfjR9tmeXo7bLMUDOzZuzFRYthNgODlLt3hhBJ0YfhY4GfsfkWKq5lyznSB0Ft9EkS8fNeqJqX9xQgQk8OQI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(396003)(39850400004)(16576012)(4326008)(36756003)(8676002)(66476007)(186003)(110136005)(956004)(5660300002)(83380400001)(16526019)(66946007)(478600001)(316002)(6486002)(8936002)(26005)(4744005)(31696002)(2616005)(53546011)(66556008)(6666004)(2906002)(66574015)(38350700002)(52116002)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?blRKRkNvNGp0dEdVSnJlenFudDlUSm1pS0RRY1lwUnkzWU1UZjcyVUpzUlFw?=
 =?utf-8?B?bFdtcWIxcG1GMzF4RjhDU3dvYVoxYVNhVFNCckhOcE1XU0VITGtUbkN2dlZN?=
 =?utf-8?B?dFVyeEo4Q2xOL3dwOFBMZG8yY01ZTmNxdzJIVXVLWmRKVzh5ZEZXVER6Qk53?=
 =?utf-8?B?SXZFYmJENG9Ycm4xUk5uMFNmeU1HRGhLWnFnK0x3T2o4Y1lvTmwyYmh5TjI3?=
 =?utf-8?B?blhtSlhmZ2JWNlBMTitlN3hHTmRHZmhCcTJrTFhnN2dWdGxNQkhpbGwxVFQr?=
 =?utf-8?B?eFdTdGZPSWQ3S0U2aytDSlJEM1ZuUjBGNWlOZEZ0SVZHYXRhVFVkc1huQVdx?=
 =?utf-8?B?RUVXbENKUGRsOUtlT2xYbjB3Unh6TGhxSDFXT0tCY1ZyUWdzQlBZWXV6YTJx?=
 =?utf-8?B?RS9QWlRQRENpc0lGb2pYbTI2My9yZnhERnZaV3l5N2pBUnBoZlNHUmxXNEd6?=
 =?utf-8?B?c0gzWGgzQ0s1enI5MFNLdm5GL1IxUnMxbjhVWSsxSFZUcTVJYmhMWWhoT0hk?=
 =?utf-8?B?ckZLU1lrSHdXN2V0V2ZWeTladUpDc2JkdVVybERpeG9Mb1BEamxKVGt0bXcv?=
 =?utf-8?B?TWdaTTFPOS81bDVqZEpJM05MQTNmVHVOMXVuTndHcHpGOEYwVkYvbFBKWFpV?=
 =?utf-8?B?TkYvcU9pOC8wUGNpeEtuN2pPTGRzSWZVRUFHY05wNHdGVDl4cUhVNTVlL1Bj?=
 =?utf-8?B?SG12NE05TVpVQnVzUnFYdm9oK2NWRUdINEVMSnRCRG91ZnVZZWtDL2VYQUV6?=
 =?utf-8?B?MTZtUExZQ1RUb3Fuc3ZkU2R5TUpSNDBLQ09ibjZLR3M0TWwya29NTlh0Y3RS?=
 =?utf-8?B?dExQbkxZVHJWV1ZhckQyKzMwWkg5OEsrU3JIWldCK0JBUjhYd3l5dm9uc1Uz?=
 =?utf-8?B?S3J1ZU9saXhSOHVDZ1k2RWNraGN2STBlMVo4enR2NVY0YzZ1WWlHYU5nemNF?=
 =?utf-8?B?QmNVUklrbmJHN2pDeFNGczkvWjk4cWRqcTNkWE8rbG1RNXFOTmJKc3RrQWM3?=
 =?utf-8?B?VE9VZW53TEc3engzSzJObjFHQURhcUhObkV4Uk9scTI3TjlMRkRHclFwNWlV?=
 =?utf-8?B?T2ZnK1pOaDhTbWQxVk1ieEZKSklSekYxRjVSZFY1QmcwcGtFNGpmQkh6VEFZ?=
 =?utf-8?B?MEk0U3Eza0REQkhYem80bi9wMGVLdldxSFM1Q0JUSllHWUZMeUxPWmVEaHQz?=
 =?utf-8?B?VDBsdkUzUGNzSkw1T01SUkxYeGp1Y0tzSWI0dUc5THNCVFlnQnJQSDdqMzRD?=
 =?utf-8?B?Sk9CMU9CVHJyamh1OFU3bUNzU0RDQ05iRnIwSmJRbUNHZmx2UHIxRm1kRVVT?=
 =?utf-8?B?ZXhqODVkR3ZkN0RYQzRJUFYvQWNZMk1ZQ3ZXSGhoUDBMTzEvOUdQZ1NLV0Zt?=
 =?utf-8?B?KzJtdlpVNU1SYWhTZ2R6YnFQaXdycWc3OHFrNzFuY05PQm9SMHpVTHFJM0Zr?=
 =?utf-8?B?YXloSEhxMUNKdnJXR1czTVFNMDhMd2RQWkRVa2tXV0N1Tk9OcVYrVzYvVDRa?=
 =?utf-8?B?cVdwUDRRdWJZS1F0d0dhOXcvWHpVUzB5dUU4VFNrVW9FenVHMDcxS09KVXRB?=
 =?utf-8?B?eGRLWU53eCs2U3Z6SEpwUkltakoxVHgrbFVYVFdsejdCaXV3c1lIK1VnWHIv?=
 =?utf-8?B?MUJSdG85NVI0ZTRYc2M2S3NZQzhqcFlsUGJyK2ZDU3htS0xrRDY2OGVFM2hq?=
 =?utf-8?B?REwrRkxYVFp1dURLN2ZJankrOHQxMHh4NUN3MWNURW1nV09ONWJDMEVkV3oz?=
 =?utf-8?Q?It5+pyK3K+R12JJYNuCRg6xn5v0LeeYwREclfed?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c39fef-0066-42aa-e26b-08d90e5f2f6c
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 18:13:43.1752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzDm0ZqFzeoP3AB0MOnSlr+F4vTzy6/jbvINq6yTU+wsFxLBnQGblmV3Hh4ZFhHUUqHyaHTYzH3bHkAmbroozg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1768
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
Cc: daniel.vetter@ffwll.ch, sroland@vmware.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDUvMy8yMSA3OjM5IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDAzLjA1LjIx
IHVtIDE5OjI2IHNjaHJpZWIgTmlybW95IERhczoKPj4gVFRNIEJPIHJlc291cmNlIG5lZWQgdG8g
YmUgZnJlZWQgYmVmb3JlIGNhbGxpbmcgdHRtX2JvX2Fzc2lnbl9tZW0oKS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogTmlybW95IERhcyA8bmlybW95LmRhc0BhbWQuY29tPgo+PiAtLS0KPj4gwqAgZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIHwgMSArCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZlci5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X3R0bV9idWZmZXIuYwo+PiBpbmRleCAyZGMwMzFmZTRhOTAuLjkzZTRjZjM0YTNh
MyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfdHRtX2J1ZmZl
ci5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZmZXIuYwo+
PiBAQCAtNzM4LDYgKzczOCw3IEBAIHN0YXRpYyBpbnQgdm13X21vdmUoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibywKPj4gwqAgwqDCoMKgwqDCoCBpZiAob2xkX21hbi0+dXNlX3R0ICYmIG5l
d19tYW4tPnVzZV90dCkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGJvLT5tZW0ubWVtX3R5
cGUgPT0gVFRNX1BMX1NZU1RFTSkgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0dG1fcmVz
b3VyY2VfZnJlZShibywgJmJvLT5tZW0pOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0
dG1fYm9fYXNzaWduX21lbShibywgbmV3X21lbSk7Cj4KPiBNaG0sIHdlIHNob3VsZCBwcm9iYWJs
eSByYXRoZXIgY2FsbCB0dG1fYm9fbW92ZV9udWxsIGhlcmUgbGlrZSBvdGhlciAKPiBkcml2ZXJz
IGRvLgo+ClRoYW5rcyBDaHJpc3RpYW4sIEkgd2lsbCBzZW5kIGEgdXBkYXRlZCBwYXRjaC4KCgpO
aXJtb3kKCgo+IENocmlzdGlhbi4KPgo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gMDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
