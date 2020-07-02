Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4F5211EC4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 10:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBF26E581;
	Thu,  2 Jul 2020 08:28:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0F66E581;
 Thu,  2 Jul 2020 08:28:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKqhLsa6JefqH+Cil/U6oUyDJHbOk/KTGxP9O/SfQXtSGesZKuv8azQ5GF6bRTx7r128VIryO3dgSA0AQuCCxYYDZ1Nvv2cWXuUb4mC6oSDLl96a9un8VAaHCAVM51wNhdfZrmgNQ4RWRhY1qsDeVz/HUr1a8GiSHotTp/otOf2z/XeyVIDOBo4reXlFFyM96W6d+GN02eSr021m1t48Tvs57QgwCqEz21TrHmXRXjlz+30MrmWA3VB9iyetHDu1Regib8FQWchvrfOyWMSP5y2qRlMBkZdpLEO73mFMYdYZEfoH/SFirtGlBaDCcFx2gsP2m1KWIw51dfhyHsWWFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eEDOeDVdIygr4ASalFp+5cx/eHga5suDKqXa005MWQ=;
 b=Yxexa5PZ9I4KSi24zYnobhzBF2xuv3+ZjjJB23/HfYVclzp1udyOmWBUyIxvzoJs2X+Or3cVBOfMVuDzF+MXDwIa5GHIuC8HBoytuFwMZ5T1onctzDaLqRvg++iY9WzWKrSZ3UK/51sXBmLkCaEr7Wz8msL/gkJbPPJbyL8BuItl1SKW98/0Xi1a6DM0SjX/OXou7+Y3qeNsfrQffPnrTlcH2bLudkZLUTxHlR30qVb6DOAT381Q0F7NaTI28KonA+72a9/ZvTo6WuSlM15oE17JOU18Hn3+WbSvjFLqey6tKeVcrNzJv9AnRCoN9MyzVKioL+ItlZ9CvXUylNZ5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eEDOeDVdIygr4ASalFp+5cx/eHga5suDKqXa005MWQ=;
 b=D+zdARbZ5tHUrT0VOWPDPn6uy1jG+/AbBvGJWHdeVIL7BuGKlROJu9Xm0qWq4SwnYlUWM5uzj7oQAKGh0EXXoD3Ia0L3cFhoxna0AS8URDLcBgWOJzxsqR58hNcrXH/thuV2MaTMEwulukc2dbxUuBYvJ3AV6EH2llOkc3C4lAo=
Authentication-Results: chris-wilson.co.uk; dkim=none (message not signed)
 header.d=none; chris-wilson.co.uk; dmarc=none action=none header.from=amd.com; 
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Thu, 2 Jul
 2020 08:28:45 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3153.021; Thu, 2 Jul 2020
 08:28:45 +0000
Subject: Re: [PATCH 1/2] Revert "dma-buf: Report signaled links inside
 dma-fence-chain"
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
References: <20200625123443.19680-1-lionel.g.landwerlin@intel.com>
 <51e00eed-c8f1-aabf-ec2c-07be0453ab3b@amd.com>
 <eb6a07bc-a314-1a2b-c27a-84d2785867dc@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <14000d27-d631-dee2-9bc2-bb8da3f978de@amd.com>
Date: Thu, 2 Jul 2020 10:28:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <eb6a07bc-a314-1a2b-c27a-84d2785867dc@intel.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0104.eurprd04.prod.outlook.com
 (2603:10a6:208:be::45) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0104.eurprd04.prod.outlook.com (2603:10a6:208:be::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.21 via Frontend Transport; Thu, 2 Jul 2020 08:28:44 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1e179df-7919-4876-d8fd-08d81e61ef88
X-MS-TrafficTypeDiagnostic: MN2PR12MB4110:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41108E33EFB8B5A104386C9A836D0@MN2PR12MB4110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 0452022BE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ul0dh+XBcQPAmK18PS/NY1NowVJ3lkDSDZCksNR2XFpqWIObUGWJxdG6k4Ls+4diGUOkidOgQattTPxdXrugUK0AoSL8YM09JNPMmJtIINWzpySe3DkL+uT5NET2TxTECy6o4by6Ri0N5RHkwehTqRepUSKzO0Jmt40RNQGR78GqvSq5xciXP2vL7cx8w5Ah8ovjQpfiXA/dinqmDsNo6ne9ObwBlgmlsVi7ZepSZb26PvgsuIR/O8sVppQ5neWCS0OeDYSzxNsjKTI6TEl8Wpn9aA8aeJktAblLWb205ewh9wTJpuFxq21y/1w8KuO6vKYQJdt82Qivv/tAOVQ7pgVKf2pDMi2JyZaQs3MyZHLfx9LJyJfPOjLwZB4qWC8C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(2616005)(36756003)(53546011)(86362001)(6486002)(6666004)(31696002)(4326008)(316002)(16526019)(186003)(52116002)(31686004)(66574015)(2906002)(478600001)(5660300002)(8676002)(8936002)(66946007)(66556008)(83380400001)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 5Uzo68xgFfWhfl7cUhkqNOn8VfRtwQjTuPr1L4r1ggEUXWYEOtCKj55RgMw4pOFYuEk9hlbKEbHxMxcpjH09NCLXYfoRnCtkFA8vmM9KgLBs3FedcIydCd5w5pQBMbXYtkI7sa75Y780kJ5ybKvRdDurF1Dx6NjI+9iXY957KvX+3etbtZbgOFWMv5fNUL3qZfyUZsOa7OqE2aFuVObzVVjrfdT0U8jq3IvIcluchtTV9c8mRMuxeK73fbYDX7oxmw26kWMepNGVD8oydBNEC89pj+SsoJ6kz5MSfzrVZ0+D8B9KxwM7n8JIyHH+qAs2PGPKFNlEKnie4O8I1u1EI/FH6QSo7mxCXvdEsAnnGN/5/Tws3JRHJqg7UqLsnJVbMqy78RIVyjLY4DYI/8uEgjmEa01h3hOsNxngVwf6/s0uymn6YRcITIxQwcZSUydGT/+qjWQdb9Mo2unm8H49r2QGGYhTbCn3szBVS+UB4dK/fo0OFQrEzaDO9lTMIMvQJw+hU5he5VlllG4SsZD8oVQQka87KNUMIPH1t5eVU1JtO1ZM4JYY1hEJa8RI0q7b
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e179df-7919-4876-d8fd-08d81e61ef88
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2020 08:28:45.5697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pnWxg9ts/0xLNbi54ByV7PU02UlUpwSGHj8KhwpR6OcdjYzqOMwoL5zE2QpURuC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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
Cc: intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDIuMDcuMjAgdW0gMTA6MjYgc2NocmllYiBMaW9uZWwgTGFuZHdlcmxpbjoKPiBPbiAyNS8w
Ni8yMDIwIDE1OjQzLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBBbSAyNS4wNi4yMCB1bSAx
NDozNCBzY2hyaWViIExpb25lbCBMYW5kd2VybGluOgo+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCA1
ZGUzNzZiYjQzNGY4MGExMzEzOGYwZWJlZGM4MzUxYWI3M2Q4YjBkLgo+Pj4KPj4+IFRoaXMgY2hh
bmdlIGJyZWFrcyBzeW5jaHJvbml6YXRpb24gb2YgYSB0aW1lbGluZS4KPj4+IGRtYV9mZW5jZV9j
aGFpbl9maW5kX3NlcW5vKCkgbWlnaHQgYmUgYSBiaXQgb2YgYSBjb25mdXNpbmcgbmFtZSBidXQK
Pj4+IHRoaXMgZnVuY3Rpb24gaXMgbm90IHRyeWluZyB0byBmaW5kIGEgcGFydGljdWxhciBzZXFu
bywgaXMgc3VwcG9zZWQgdG8KPj4+IGdpdmUgYSBmZW5jZSB0byB3YWl0IG9uIGZvciBhIHBhcnRp
Y3VsYXIgcG9pbnQgaW4gdGhlIHRpbWVsaW5lLgo+Pj4KPj4+IEluIGEgdGltZWxpbmUsIGEgcGFy
dGljdWxhciB2YWx1ZSBpcyByZWFjaGVkIHdoZW4gYWxsIHRoZSBwb2ludHMgdXAgdG8KPj4+IGFu
ZCBpbmNsdWRpbmcgdGhhdCB2YWx1ZSBoYXZlIHNpZ25hbGVkLgo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT4KPj4K
Pj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KPgo+Cj4gTm93IHRoYXQgeW91IGFyZSBhIG1haW50YWluZXIsIGZlZWwgZnJlZSB0byBtZXJn
ZSB0aGlzIGFuZCB0aGUgdGVzdCAKPiBjaGFuZ2VzLgoKU3VyZSwgSSB3aWxsIHBpY2sgdGhhdCB1
cCBsYXRlciB0b2RheSA6KQoKQ2hyaXN0aWFuLgoKPgo+Cj4gVGhhbmtzLAo+Cj4KPiAtTGlvbmVs
Cj4KPgo+Pgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMg
fCA3IC0tLS0tLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMgCj4+PiBiL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYwo+Pj4gaW5kZXggYzQzNWJiYmE4NTFjLi4z
ZDEyMzUwMmZmMTIgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNo
YWluLmMKPj4+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYwo+Pj4gQEAg
LTk5LDEyICs5OSw2IEBAIGludCBkbWFfZmVuY2VfY2hhaW5fZmluZF9zZXFubyhzdHJ1Y3QgZG1h
X2ZlbmNlIAo+Pj4gKipwZmVuY2UsIHVpbnQ2NF90IHNlcW5vKQo+Pj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRUlOVkFMOwo+Pj4gwqAgwqDCoMKgwqDCoCBkbWFfZmVuY2VfY2hhaW5fZm9y
X2VhY2goKnBmZW5jZSwgJmNoYWluLT5iYXNlKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCgq
cGZlbmNlKS0+c2Vxbm8gPCBzZXFubykgeyAvKiBhbHJlYWR5IHNpZ25hbGVkICovCj4+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KCpwZmVuY2UpOwo+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKnBmZW5jZSA9IE5VTEw7Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBicmVhazsKPj4+IC3CoMKgwqDCoMKgwqDCoCB9Cj4+PiAtCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKCgqcGZlbmNlKS0+Y29udGV4dCAhPSBjaGFpbi0+YmFzZS5jb250ZXh0IHx8Cj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0b19kbWFfZmVuY2VfY2hhaW4oKnBmZW5jZSktPnBy
ZXZfc2Vxbm8gPCBzZXFubykKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+
Pj4gQEAgLTIyOCw3ICsyMjIsNiBAQCBFWFBPUlRfU1lNQk9MKGRtYV9mZW5jZV9jaGFpbl9vcHMp
Owo+Pj4gwqDCoCAqIEBjaGFpbjogdGhlIGNoYWluIG5vZGUgdG8gaW5pdGlhbGl6ZQo+Pj4gwqDC
oCAqIEBwcmV2OiB0aGUgcHJldmlvdXMgZmVuY2UKPj4+IMKgwqAgKiBAZmVuY2U6IHRoZSBjdXJy
ZW50IGZlbmNlCj4+PiAtICogQHNlcW5vOiB0aGUgc2VxdWVuY2UgbnVtYmVyIChzeW5jcHQpIG9m
IHRoZSBmZW5jZSB3aXRoaW4gdGhlIGNoYWluCj4+PiDCoMKgICoKPj4+IMKgwqAgKiBJbml0aWFs
aXplIGEgbmV3IGNoYWluIG5vZGUgYW5kIGVpdGhlciBzdGFydCBhIG5ldyBjaGFpbiBvciBhZGQg
Cj4+PiB0aGUgbm9kZSB0bwo+Pj4gwqDCoCAqIHRoZSBleGlzdGluZyBjaGFpbiBvZiB0aGUgcHJl
dmlvdXMgZmVuY2UuCj4+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
