Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6D627AC9F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 13:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E3C89861;
	Mon, 28 Sep 2020 11:22:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3566894C1;
 Mon, 28 Sep 2020 11:22:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCjLUCAA8XVyDL2KBJHmEi1Zy/SgpeK1LtIXigePlKkqafb6qaZvlR2jMFaw8uElsDnOXJsGimsf8GbF+NfMjb0UYo4SPWGCGumYZ6GGkmBjjpdC2+ie4ANOXZkVCkPcFBnI0Q7/m0TMt4MvJ00o/88irizYYZF54nUx/2KJnPHfMYv38IsinC6ta6a/S49xKJldDOCjuBUMokVDi/4EogPr6XXgnFLFz7WJmIV74VjHYzKxpBYlwWHFBUwxjYRuwsG57xbPWRIGFZXbSDvC7RhFdE87YzkBZkLcFPcrINTCWAswea4m7B/3ngFSOQQCcfpEvEOyc/t2CRRXZqN4Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hD8W5ThzNGSBL01HXMBRedFUTKVe6ilyPQyyYKe2xKk=;
 b=fP6As9m0yb5e9Y30h+Zd9gR9v3SMlyoFx7Gk5RNTALfkb15TDlVMPWL6Yb+D4lkqs/tdEHBMPTMoKdWwvNTW+a6V9ppQo9P/TX0Mp5Vzo4cGY8EPShQNt0KtqT+WzbnCUifqzjcvN9JtQiqSAnab3hfTH0sj1wFbCCcyfkKpeWiszizRqIciCboig7c8ds6s2PkSqLqJ1epKPyYNJK442QAReyp4bzzDPED3uWN6MbmaFLm+I7SoN7V85CS6cdKxSRldknukFuGXlcAIobIL/a+uQbytoTYhHooFjKKgKHJZVm5FLK8YNkqcq2rQMmZbBFmBMXUPBPKZWipPxm1iOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hD8W5ThzNGSBL01HXMBRedFUTKVe6ilyPQyyYKe2xKk=;
 b=j7JdjJsgyMBQJ0WwPDQ81i5UNk45tcg+b9r1HedEwEOELVLowSBXy30CWi3gYiourig4qSCsCANM1D/n0cMTHA4ASZ5LhxuAMqp/Qkr7pLx1DhE66b3ZkmIPss3Nax5xMbkAfBlKKpQOO//TC2mnF5rA/Hvdzsc1DPZWyWKG4vo=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Mon, 28 Sep
 2020 11:22:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 11:22:22 +0000
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
 <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
 <20200927191605.GA237178@ravnborg.org>
 <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>
 <ef4400a7-397b-e550-7114-1d4238dd36f3@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <49c4dcec-cd69-510a-9781-e8fa5fb669f9@amd.com>
Date: Mon, 28 Sep 2020 13:22:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <ef4400a7-397b-e550-7114-1d4238dd36f3@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.18 via Frontend Transport; Mon, 28 Sep 2020 11:22:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 344bcca5-18b3-4dda-ed79-08d863a0c45f
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:
X-Microsoft-Antispam-PRVS: <MN2PR12MB440857BCFC2C769A76568D5183350@MN2PR12MB4408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRUeFrkBXr0H/jOwBHqPHvishB50tqoIEUWeMVTO+hw02PbTm40K1M4nq7IWUIdSB5NWuAKDdulLk4b4Wm40EkIIpaQikrj99GeqTnCQAtumQPQ/pEGm7OEmdOo9vhMyqof7a2SRSr3nDRuX2xi+vdzI1OznvMKwLhjA925OTvJ0T5QfVDI/y+Ny0wQdOf+7zg3uvysQApS8zQ21Fl/0cjrcYJn/l43lUOuBzBi+W8HRpi8pFw+DaThqo08YgCKPJ+2Exnh+Bu2Fg4sOQEtFPZ8RXqepra2IK5fDdS07poduy/QUyHfaLV2xTA/axhcDbu52si9HTP8ra79pFRoxXPWhN352KsJI3LYeIit4w4p+gabNc1wgMGtc/HA+LhEtp6+nWrDQ/aM3uKBGKQobI+Mh5+ebBOOvoGxFaiCufSKeXAUacGx7783HFU0zhvZvXw4e6dqFWRD63pPObzgzCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(6486002)(36756003)(4326008)(86362001)(8936002)(52116002)(478600001)(6666004)(966005)(31696002)(8676002)(83380400001)(2616005)(316002)(66574015)(66946007)(31686004)(66476007)(66556008)(110136005)(16526019)(5660300002)(186003)(2906002)(7416002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qGSPofKGJ256FYvsiC1t6pMhAyaJsKnwicKR9y7MycQ38js9z/WvHfjtSoem1bR+lbYjhGZ54CFlDmmF+FZ2j14c2vF9jZaZguOBdM2Z/SsFcU8jm7ej0mTMTFEDQRvWbMQa3QfMRvVe7teKChGXsv37QdrP5V9S8PPV2HJUh8qDzrGn0rXV6y91S0HBVRnZsunU3nPVv72h5G3icpPGPPaW/VpQR3gxMryIj2mCLomPSpK3uq0Wg2pbHichri5uZbueqhq9aKWvS/G0eEdACyRhJDPd/sqvvmIflMxPNQ2naC6AAlrm429TR2f7lAggFZzpXKp+uTL3/FlE44emuNCl/sfJOLGwcQvL6FYi6XG3V49y7yJ+QTNzU1jSlNRpaw+cttjHGbazjsDcW5lYPj4qGPE0srzzh0wFvFqMqHO9HK0NonbSSPUrZys+4NXYfF/Io35ztwRUq3MNlawNDRvf+xEazNqNdn4QUyMHtnHuyc45AopcfXJhiw7T71OP8jpR3d3dk8Ub3wUedrr6c3kkOKMBLZ+zBPE9fOTAalkJ8CH33zCuDLiaAKQ2yfTFl/9w6Q/nTKI3ozWwdBgNoniuLdjS+dYwowxgxT3Ji49zNg5AoEEaOhms6nGJbc9DB/sULA7BR3jCQQgrTWmuLtbxvYg1rH7cAimeZwTpzZspP9PrdyuGI3mbJ9cY6jOHprMu3hifcdy+hKwv3Stw9A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344bcca5-18b3-4dda-ed79-08d863a0c45f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 11:22:21.8860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUI07lNO1T0FbvSXW9b82g9qM23oBRcHqu8hT0hOvTAzGUGVEsS+FFwqw2fhcD0B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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
Cc: linux-doc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, kraxel@redhat.com,
 tfiga@chromium.org, m.szyprowski@samsung.com, arnd@arndb.de, corbet@lwn.net,
 jonathanh@nvidia.com, matthew.auld@intel.com, linux+etnaviv@armlinux.org.uk,
 labbott@redhat.com, linux-media@vger.kernel.org, pawel@osciak.com,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, thomas.hellstrom@intel.com,
 rodrigo.vivi@intel.com, linux-tegra@vger.kernel.org, mchehab@kernel.org,
 gregkh@linuxfoundation.org, lmark@codeaurora.org, afd@ti.com,
 kyungmin.park@samsung.com, robin.murphy@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMDkuMjAgdW0gMDk6Mzcgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMjguMDkuMjAgdW0gMDg6NTAgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+PiBBbSAyNy4w
OS4yMCB1bSAyMToxNiBzY2hyaWViIFNhbSBSYXZuYm9yZzoKPj4+IEhpIFRob21hcy4KPj4+Cj4+
Pj4+IHN0cnVjdCBzaW1hcCB7Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCB1bmlvbiB7Cj4+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9pZCBfX2lvbWVtICp2YWRkcl9pb21lbTsK
Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lkICp2YWRkcjsKPj4+Pj4g
IMKgwqDCoMKgwqDCoMKgIH07Cj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBib29sIGlzX2lvbWVtOwo+
Pj4+PiB9Owo+Pj4+Pgo+Pj4+PiBXaGVyZSBzaW1hcCBpcyBhIHNob3J0aGFuZCBmb3Igc3lzdGVt
X2lvbWVtX21hcAo+Pj4+PiBBbmQgaXQgY291bGQgYWwgYmUgc3R1ZmZlZCBpbnRvIGEgaW5jbHVk
ZS9saW51eC9zaW1hcC5oIGZpbGUuCj4+Pj4+Cj4+Pj4+IE5vdCB0b3RhbGx5IHNvbGQgb24gdGhl
IHNpbWFwIG5hbWUgLSBidXQgd2FudGVkIHRvIGNvbWUgdXAgd2l0aAo+Pj4+PiBzb21ldGhpbmcu
Cj4+Pj4gWWVzLiBPdGhlcnMsIG15c2VsZiBpbmNsdWRlZCwgaGF2ZSBzdWdnZXN0ZWQgdG8gdXNl
IGEgbmFtZSB0aGF0IGRvZXMgbm90Cj4+Pj4gaW1wbHkgYSBjb25uZWN0aW9uIHRvIHRoZSBkbWEt
YnVmIGZyYW1ld29yaywgYnV0IG5vIG9uZSBoYXMgY29tZSB1cCB3aXRoCj4+Pj4gIMKgIGEgZ29v
ZCBuYW1lLgo+Pj4+Cj4+Pj4gSSBzdHJvbmdseSBkaXNsaWtlIHNpbWFwLCBhcyBpdCdzIGVudGly
ZWx5IG5vbi1vYnZpb3VzIHdoYXQgaXQgZG9lcy4KPj4+PiBkbWEtYnVmLW1hcCBpcyBub3QgYWN0
dWFsbHkgd3JvbmcuIFRoZSBzdHJ1Y3R1cmVzIHJlcHJlc2VudHMgdGhlIG1hcHBpbmcKPj4+PiBv
ZiBhIGRtYS1hYmxlIGJ1ZmZlciBpbiBtb3N0IGNhc2VzLgo+Pj4+Cj4+Pj4+IFdpdGggdGhpcyBh
cHByb2FjaCB1c2VycyBkbyBub3QgaGF2ZSB0byBwdWxsIGluIGRtYS1idWYgdG8gdXNlIGl0IGFu
ZAo+Pj4+PiB1c2VycyB3aWxsIG5vdCBjb25mdXNlIHRoYXQgdGhpcyBpcyBvbmx5IGZvciBkbWEt
YnVmIHVzYWdlLgo+Pj4+IFRoZXJlJ3Mgbm8gbmVlZCB0byBlbmFibGUgZG1hLWJ1Zi4gSXQncyBh
bGwgaW4gdGhlIGhlYWRlciBmaWxlIHdpdGhvdXQKPj4+PiBkZXBlbmRlbmNpZXMgb24gZG1hLWJ1
Zi4gSXQncyByZWFsbHkganVzdCB0aGUgbmFtZS4KPj4+Pgo+Pj4+IEJ1dCB0aGVyZSdzIHNvbWV0
aGluZyBlbHNlIHRvIHRha2UgaW50byBhY2NvdW50LiBUaGUgd2hvbGUgaXNzdWUgaGVyZSBpcwo+
Pj4+IHRoYXQgdGhlIGJ1ZmZlciBpcyBkaXNjb25uZWN0ZWQgZnJvbSBpdHMgb3JpZ2luYXRpbmcg
ZHJpdmVyLCBzbyB3ZSBkb24ndAo+Pj4+IGtub3cgd2hpY2gga2luZCBvZiBtZW1vcnkgb3BzIHdl
IGhhdmUgdG8gdXNlLiBUaGlua2luZyBhYm91dCBpdCwgSQo+Pj4+IHJlYWxpemVkIHRoYXQgbm8g
b25lIGVsc2Ugc2VlbWVkIHRvIGhhdmUgdGhpcyBwcm9ibGVtIHVudGlsIG5vdy4KPj4+PiBPdGhl
cndpc2UgdGhlcmUgd291bGQgYmUgYSBzb2x1dGlvbiBhbHJlYWR5LiBTbyBtYXliZSB0aGUgZG1h
LWJ1Zgo+Pj4+IGZyYW1ld29yayAqaXMqIHRoZSBuYXRpdmUgdXNlIGNhc2UgZm9yIHRoaXMgZGF0
YSBzdHJ1Y3R1cmUuCj4+PiBXZSBoYXZlIGF0IGxlYXN0Ogo+Pj4gbGludXgvZmIuaDoKPj4+ICDC
oMKgwqDCoHVuaW9uIHsKPj4+ICDCoMKgwqDCoMKgwqDCoCBjaGFyIF9faW9tZW0gKnNjcmVlbl9i
YXNlO8KgwqDCoMKgwqAgLyogVmlydHVhbCBhZGRyZXNzICovCj4+PiAgwqDCoMKgwqDCoMKgwqAg
Y2hhciAqc2NyZWVuX2J1ZmZlcjsKPj4+ICDCoMKgwqDCoH07Cj4+Pgo+Pj4gV2hpY2ggc29sdmUg
bW9yZSBvciBsZXNzIHRoZSBzYW1lIHByb2JsZW0uCj4gSSB0aG91Z2h0IHRoaXMgd2FzIGZvciBj
b252ZW5pZW5jZS4gVGhlIGltcG9ydGFudCBpc19pb21lbSBiaXQgaXMgbWlzc2luZy4KPgo+PiBJ
IGFsc28gYWxyZWFkeSBub3RlZCB0aGF0IGluIFRUTSB3ZSBoYXZlIGV4YWN0bHkgdGhlIHNhbWUg
cHJvYmxlbSBhbmQgYQo+PiB3aG9sZSBidW5jaCBvZiBoZWxwZXJzIHRvIGFsbG93IG9wZXJhdGlv
bnMgb24gdGhvc2UgcG9pbnRlcnMuCj4gSG93IGRvIHlvdSBjYWxsIHRoaXMgd2l0aGluIFRUTT8K
CnR0bV9idXNfcGxhY2VtZW50LCBidXQgSSByZWFsbHkgZG9uJ3QgbGlrZSB0aGF0IG5hbWUuCgo+
Cj4gVGhlIGRhdGEgc3RydWN0dXJlIHJlcHJlc2VudHMgYSBwb2ludGVyIHRvIGVpdGhlciBzeXN0
ZW0gb3IgSS9PIG1lbW9yeSwKPiBidXQgbm90IG5lY2Vzc2F0cmlseSBkZXZpY2UgbWVtb3J5LiBJ
dCBjb250YWlucyByYXcgZGF0YS4gVGhhdCB3b3VsZAo+IGdpdmUgc29tZXRoaW5nIGxpa2UKPgo+
ICAgIHN0cnVjdCBkYXRhYnVmX21hcAo+ICAgIHN0cnVjdCBkYXRhYnVmX3B0cgo+ICAgIHN0cnVj
dCBkYnVmX21hcAo+ICAgIHN0cnVjdCBkYnVmX3B0cgo+Cj4gTXkgZmF2b3JpdGUgd291bGQgYmUg
ZGJ1Zl9wdHIuIEl0J3Mgc2hvcnQgYW5kIHRoZSBBUEkgbmFtZXMgd291bGQgbWFrZQo+IHNlbnNl
OiBkYnVmX3B0cl9jbGVhcigpIGZvciBjbGVhcmluZywgZGJ1Zl9wdHJfc2V0X3ZhZGRyKCkgdG8g
c2V0IGFuCj4gYWRkcmVzcywgZGJ1Zl9wdHJfaW5jcigpIHRvIGluY3JlbWVudCwgZXRjLiBBbHNv
LCB0aGUgX3B0ciBpbmRpY2F0ZXMKPiB0aGF0IGl0J3MgYSBzaW5nbGUgYWRkcmVzczsgbm90IGFu
IG9mZnNldCB3aXRoIGxlbmd0aC4KClB1aCwgbm8gaWRlYS4gQWxsIG9mIHRoYXQgZG9lc24ndCBz
b3VuZCBsaWtlIGl0IDEwMCUgaGl0cyB0aGUgdW5kZXJseWluZyAKbWVhbmluZyBvZiB0aGUgc3Ry
dWN0dXJlLgoKQ2hyaXN0aWFuLgoKPgo+IEJlc3QgcmVnYXJkcwo+IFRob21hcwo+Cj4+IENocmlz
dGlhbi4KPj4KPj4+ICAgCj4+Pj4gQW55d2F5LCBpZiBhIGJldHRlciBuYW1lIHRoYW4gZG1hLWJ1
Zi1tYXAgY29tZXMgaW4sIEknbSB3aWxsaW5nIHRvCj4+Pj4gcmVuYW1lIHRoZSB0aGluZy4gT3Ro
ZXJ3aXNlIEkgaW50ZW5kIHRvIG1lcmdlIHRoZSBwYXRjaHNldCBieSB0aGUgZW5kIG9mCj4+Pj4g
dGhlIHdlZWsuCj4+PiBXZWxsLCB0aGUgbWFpbiB0aGluZyBpcyB0aGF0IEkgdGhpbmsgdGhpcyBz
aG91ZCBiZSBtb3ZlZCBhd2F5IGZyb20KPj4+IGRtYS1idWYuIEJ1dCBpZiBpbmRlZWQgZG1hLWJ1
ZiBpcyB0aGUgb25seSByZWxldmFudCB1c2VyIGluIGRybSB0aGVuCj4+PiBJIGFtIHRvdGFsbHkg
ZmluZSB3aXRoIHRoZSBjdXJyZW50IG5hbWluZy4KPj4+Cj4+PiBPbmUgYWx0ZXJuYXRpdmUgbmFt
ZWQgdGhhdCBwb3BwZWQgdXAgaW4gbXkgaGVhZDogc3RydWN0IHN5c19pb19tYXAge30KPj4+IEJ1
dCBhZ2FpbiwgaWYgdGhpcyBpcyBrZXB0IGluIGRtYS1idWYgdGhlbiBJIGFtIGZpbmUgd2l0aCB0
aGUgY3VycmVudAo+Pj4gbmFtaW5nLgo+Pj4KPj4+IEluIG90aGVyIHdvcmRzLCBpZiB5b3UgY29u
dGludWUgdG8gdGhpbmsgdGhpcyBpcyBtb3N0bHkgYSBkbWEtYnVmCj4+PiB0aGluZyBhbGwgdGhy
ZWUgcGF0Y2hlcyBhcmU6Cj4+PiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgo+Pj4KPj4+ICDCoMKgwqDCoFNhbQo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
