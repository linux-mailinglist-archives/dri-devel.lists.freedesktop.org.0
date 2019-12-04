Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7848E112D95
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 15:40:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B55546E913;
	Wed,  4 Dec 2019 14:40:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720061.outbound.protection.outlook.com [40.107.72.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 042716E913
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 14:40:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lauH1XxRrRaKV0euBSVPIqwTAS65cFq9/CV8ZJiWGDoW8FHVSfDr4p9q5gSKYqDoK3SnUTnSB3FeK289Na/prfzlM5CsRWX9lfNcVI3SaTMEeQC6GVxkTogVXR39RE9AWxcaRu36mjWUnN5Ys/tf0FpJiwpGCXqXgToVopK9LCwSm+H23n/rftyY0C0Udg4O7/4jokke5y/scX31T5GpdckKFX0jbd6hOmQ2jJXo6pXZycq227xU8QY7tziEYHacBCrQUf8N/zJVoenMiUaxP0gBaOJtFT6sLfJMIvB9couNRRBAmH4+RuAHiamrB/jjsDZvM4uHo2YSOJcAYWAxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7maORSLxBa/fM9ZC3e6AtmZ747yE/Vw1umcD10aHEbc=;
 b=AbGpPnB8V9UwAkNkqWMGF6iylzNyo3bdw+3JvNEBgTORxqfgf8Ja2CNGflmb1qfrSBFtWAHvqnypPtQeae6csaDYP5ecACTKF+ZSmctGRL+7htzd7uZcHsdYoFyG114f+oAa4pPBqQDwdyUKagmsn3crPTn+bmSYNakjZp2K4gDs3azPZzHy34ujDb2oiVWdTjIjQf/l0/6bGKY1sxSu5g1QNk5huDzZVpGnf2vsnrwnIii1ztSV3tV/EoO+NI8QQl+CAYfYotySPazhOqvICozVqemmo9AcRAPqtjZXX2A5sErN9UW+Q1Y4QEva/gF6xlitTuP4GN4RVRIrIzyBaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1740.namprd12.prod.outlook.com (10.175.89.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Wed, 4 Dec 2019 14:40:16 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::80df:f8b:e547:df84%12]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 14:40:16 +0000
Subject: Re: [PATCH 6/8] drm: Add a drm_get_unmapped_area() helper
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20191203132239.5910-1-thomas_os@shipmail.org>
 <20191203132239.5910-7-thomas_os@shipmail.org>
 <e091063c-2c4a-866e-acdb-9efb1e20d737@amd.com>
 <98af5b11-1034-91fa-aa38-5730f116d1cd@shipmail.org>
 <3cc5b796-20c6-9f4c-3f62-d844f34d81b7@amd.com>
 <90a8d09a-b3ab-cd00-0cfb-1a4c72e91836@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <016a9187-1703-2d7d-0114-7fc0cbf1d121@amd.com>
Date: Wed, 4 Dec 2019 15:40:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <90a8d09a-b3ab-cd00-0cfb-1a4c72e91836@shipmail.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0077.eurprd02.prod.outlook.com
 (2603:10a6:208:154::18) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ccc1b038-24b9-47bf-de8a-08d778c7e09f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1740:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1740DF38F5A73FB310F22000835D0@DM5PR12MB1740.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0241D5F98C
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(189003)(199004)(6246003)(54906003)(4326008)(6512007)(76176011)(23676004)(52116002)(99286004)(66946007)(229853002)(6436002)(58126008)(6486002)(186003)(66574012)(2616005)(316002)(25786009)(5660300002)(31686004)(11346002)(66476007)(66556008)(53546011)(36756003)(6506007)(478600001)(14454004)(2870700001)(86362001)(31696002)(50466002)(6116002)(2906002)(7416002)(7736002)(6666004)(65956001)(8936002)(81166006)(81156014)(14444005)(8676002)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1740;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: to/4mVMmvC44r+2bDlsxB5yPlcelvjFMGhgPe05NhrTY14Q9nQ8Ft5AfHqf5ZKOSAwXN9aKt0D1SCCChzONLVfUQsM9WDfV9rAD9HNuCyA9izdmcAAVpg9siy38DwM/fSXejrgfKyjCcQAUL2snHBPo/lYSJCP+gI4bZX7YcTfK8LZ0uIbal/GSXzQU8lOvoG2CsBwk/r/anV4gV8emTBazDGxz4IA36w+9jWh76yCRIT7WQpkNlWF8s9NwMXDlGEnpaZXQyl6rxT1D78kOl7tC1iXBjcWa/NHEFm8SXhqPoH76I/Uot/tM74Ry/k7z1MgOVBZxq45/h7Rgt6AaOtopTHSj+JsxUX7zc0EYCLfJdluweXybdMAActOx37NgiYwnUpSOYtyiUf1BdWORRZScspCS61KIgJXdgBHmVftwx6KWbcAC+ONqeWijcUG1W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc1b038-24b9-47bf-de8a-08d778c7e09f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 14:40:16.2361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/bUay1ut2yBf9X0Mmym4izIdlpvuTAUW7XgGPHAlDVQdkoRxC2SM2vxeAP6zGnE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1740
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7maORSLxBa/fM9ZC3e6AtmZ747yE/Vw1umcD10aHEbc=;
 b=JResApjHxZXSzA3oYBHSoe5kTxHCUAyvzb9KuGQHdTIMozvUB+HJj6SCmIIuy0U9X1okHyO6wSUrWfQ2pzFg4WZV5nbzNO41N8pl/Jvnonrjs1G0Gutb4KD4lTF/cdKwEdJ56WvGJXcCY1CUwXugPNRVPRJ1u7hrIjR7k+SwD20=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMTIuMTkgdW0gMTM6MzIgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToK
PiBPbiAxMi80LzE5IDE6MDggUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDA0LjEy
LjE5IHVtIDEyOjM2IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6Cj4+PiBPbiAx
Mi80LzE5IDEyOjExIFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+IEFtIDAzLjEyLjE5
IHVtIDE0OjIyIHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6Cj4+Pj4+IEZyb206
IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4+Pj4KPj4+Pj4gVGhp
cyBoZWxwZXIgaXMgdXNlZCB0byBhbGlnbiB1c2VyLXNwYWNlIGJ1ZmZlciBvYmplY3QgYWRkcmVz
c2VzIHRvCj4+Pj4+IGh1Z2UgcGFnZSBib3VuZGFyaWVzLCBtaW5pbWl6aW5nIHRoZSBjaGFuY2Ug
b2YgYWxpZ25tZW50IG1pc21hdGNoCj4+Pj4+IGJldHdlZW4gdXNlci1zcGFjZSBhZGRyZXNzZXMg
YW5kIHBoeXNpY2FsIGFkZHJlc3Nlcy4KPj4+Pgo+Pj4+IE1obSwgSSdtIHdvbmRlcmluZyBpZiB0
aGF0IGlzIHJlYWxseSBzdWNoIGEgZ29vZCBpZGVhLgo+Pj4KPj4+IENvdWxkIHlvdSBlbGFib3Jh
dGU/IFdoYXQgZHJhd2JhY2tzIGRvIHlvdSBzZWU/Cj4+Cj4+IE1haW4gcHJvYmxlbSBmb3IgbWUg
c2VlbXMgdG8gYmUgdGhhdCBJIGRvbid0IGZ1bGx5IHVuZGVyc3RhbmQgd2hhdCAKPj4gdGhlIGdl
dF91bm1hcHBlZF9hcmVhIGNhbGxiYWNrIGlzIGRvaW5nLgo+Cj4gSXQgbWFrZXMgc3VyZSB0aGF0
LCBpZiB0aGVyZSBpcyBhIGNoYW5jZSB0aGF0IHdlIGNvdWxkIHVzZSBodWdlIAo+IHBhZ2UtdGFi
bGUgZW50cmllcywgdmlydHVhbCBhZGRyZXNzIGh1Z2UgcGFnZSBib3VuZGFyaWVzIGFyZSBwZXJm
ZWN0bHkgCj4gYWxpZ25lZCB0byBwaHlzaWNhbCBhZGRyZXNzIGh1Z2UgcGFnZSBib3VuZGFyaWVz
LCB3aGljaCBpcyBpZiBub3QgYSAKPiBDUFUgaGFyZHdhcmUgcmVxdWlyZW1lbnQsIGF0IGxlYXN0
IGEga2VybmVsIHJlcXVpcmVtZW50IGN1cnJlbnRseS4KPgo+Cj4+Cj4+IEZvciBleGFtcGxlIHdo
eSBkbyB3ZSBuZWVkIHRvIHVzZSBkcm1fdm1hX29mZnNldF9sb29rdXBfbG9ja2VkKCkgdG8gCj4+
IGFkanVzdCB0aGUgcGdvZmY/Cj4+Cj4+IFRoZSBtYXBwZWQgb2Zmc2V0IHNob3VsZCBiZSBjb21w
bGV0ZWx5IGlycmVsZXZhbnQgZm9yIGZpbmRpbmcgc29tZSAKPj4gcGllY2Ugb2YgdXNlcnNwYWNl
IGFkZHJlc3Mgc3BhY2Ugb3IgYW0gSSB0b3RhbGx5IG9mZiBoZXJlPwo+Cj4KPiBCZWNhdXNlIHRo
ZSB1bm1vZGlmaWVkIHBnb2ZmIGFzc3VtZXMgdGhhdCBwaHlzaWNhbCBhZGRyZXNzIGJvdW5kYXJp
ZXMgCj4gYXJlIHBlcmZlY3RseSBhbGlnbmVkIHdpdGggZmlsZSBvZmZzZXQgYm91bmRhcmllcywg
d2hpY2ggaXMgdHlwaWNhbCAKPiBmb3IgYWxsIG90aGVyIHN1YnN5c3RlbXMuCj4KPiBUaGF0J3Mg
bm90IHRydWUgZm9yIFRUTSwgaG93ZXZlciwgd2hlcmUgYSBidWZmZXIgb2JqZWN0IHN0YXJ0IHBo
eXNpY2FsIAo+IGFkZHJlc3MgbWF5IGJlIGh1Z2UgcGFnZSBhbGlnbmVkLCBidXQgdGhlIGZpbGUg
b2Zmc2V0IGlzIGFsd2F5cyBwYWdlIAo+IGFsaWduZWQuIFdlIGNvdWxkIG9mIGNvdXJzZSBjaGFu
Z2UgdGhhdCB0byBhbGlnbiBhbHNvIGZpbGUgb2Zmc2V0cyB0byAKPiBodWdlIHBhZ2Ugc2l6ZSBi
b3VuZGFyaWVzLCBidXQgd2l0aCB0aGUgYWJvdmUgYWRqdXN0bWVudCwgdGhhdCdzIG5vdCAKPiBu
ZWVkZWQuIEkgb3B0ZWQgZm9yIHRoZSBhZGp1c3RtZW50LgoKSSB3b3VsZCBvcHQgZm9yIGFsaWdu
aW5nIHRoZSBmaWxlIG9mZnNldHMgaW5zdGVhZC4KCk5vdyB0aGF0IHlvdSBleHBsYWluZWQgaXQg
dGhhdCB0aGUgcmVzdCBvZiB0aGUga2VybmVsIGVuZm9yY2VzIHRoaXMgCmFjdHVhbGx5IG1ha2Vz
IHNlbnNlLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IFRoYW5rcywKPgo+IFRob21hcwo+Cj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
