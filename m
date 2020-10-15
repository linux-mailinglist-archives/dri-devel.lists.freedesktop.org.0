Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C07928F420
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 15:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABF86ED1E;
	Thu, 15 Oct 2020 13:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2082.outbound.protection.outlook.com [40.107.102.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFDC6ED1B;
 Thu, 15 Oct 2020 13:59:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYcC60ctnJOCLR4Kn5YaGE7u7pJBkfsGXlPsN90cs/Oa9MBEMg3YzSN7nQxPaEUCkXmUe8Y5vIPDeUrG4CL6/ykIAHlgPiVhq60Gfi20mZXbGPSDELp/QTL6/F86FKZgMLyTxqv0mOmGpGxbOpn2azQVVglfr5lSAN64IiN+Ruc5xEBoJjp+snIjCoaF69HKq2qb1e/ktzFxiko66MrTUJ6y+h/wAJ8WXjgTPW5K54p0r3je80Mtwj3yWIndt+ak00JoK0O+e68P9Z2XKdT6kIUTcxn4+UhDiwOb7TAy6E/iylRhBIW3zGGdYCCdfAKAQDBN+T7NbSfPnycw5FHCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/X6P3sHVYi8SGMfQVN4l2Td6iDIe836nU3EJJf7YeA0=;
 b=f6TstBHqAub+NROJZeHieUccD6TZRt5UdLse/UhFw7mmjbzPdgdFd5mvCRsMJCvdFBkd8LZHE5V1kWi8pZNh28T91y3W/epbdaCId+GCmgZaPjvhuEQPUu8Fxo1ZGOTNHl3HYeYRR855puUtHiFV6KG8tTLn7yqf2UmlRyNrCQMKRFShc8s2Fjpdq1liexpmU/gDoo8IIpOZK3L19mc2jJtobCmEB4inL8N8ENapHYznL6hgxAjNLs6eWjYH3+g0YIeay07xifTi9anPIsFREu39dUKMF0PnZZyyX31xwUqaAPo/CvHm78e9XprdFWCRD7vE2kDkVv02ll3BMsquEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/X6P3sHVYi8SGMfQVN4l2Td6iDIe836nU3EJJf7YeA0=;
 b=NBFuDf98/dVaJgBpw1yN6XHEhfcVFfVpF/b0k+VWHHRoVLn14NCY3Uz8g8ILK1VHLMyDfm5TP4RwXRMYayv0mqSl7Xevbum6QwaBUz4Zzhy9A87ZjclBF0f8t13YCEewUqvYThza4lvu57nbDhTWrWRa3oIFIurAYbKBh5CUHQo=
Authentication-Results: lists.linaro.org; dkim=none (message not signed)
 header.d=none;lists.linaro.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4690.namprd12.prod.outlook.com (2603:10b6:208:8e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 15 Oct
 2020 13:59:04 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 13:59:04 +0000
Subject: Re: [PATCH v4 02/10] drm/cma-helper: Remove empty
 drm_gem_cma_prime_vunmap()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com,
 kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org,
 krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org,
 tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de,
 hdegoede@redhat.com, sean@poorly.run, eric@anholt.net,
 oleksandr_andrushchenko@epam.com, ray.huang@amd.com,
 sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com,
 apaneers@amd.com, linus.walleij@linaro.org, melissa.srw@gmail.com,
 chris@chris-wilson.co.uk, miaoqinglang@huawei.com
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3ff4a9ce-ff3a-392e-e67e-a7687b0826e9@amd.com>
Date: Thu, 15 Oct 2020 15:58:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201015123806.32416-3-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [80.187.123.114]
X-ClientProxiedBy: AM0P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::11) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.137.56] (80.187.123.114) by
 AM0P190CA0001.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.21 via Frontend Transport; Thu, 15 Oct 2020 13:58:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 36738f6f-d5b1-4021-227d-08d871127994
X-MS-TrafficTypeDiagnostic: BL0PR12MB4690:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB46909E3095D926AA8D9F1A5383020@BL0PR12MB4690.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oFCzxu+oWIOFBXgbS3E40StWNNOeCeNWPlLvXZA+5gbsrbC2xkNWwcvRemVacRRDuVzuUdyL7WxKSE0WPdFD0PZdgyeezO+LSXbPHf4SEjMnkwrmKl7shDYUbD7OKC3rPyokPgIX8VSDCDCsabLArRfDSByNB2BlwsMF4hCQIrePHQ8MX22w5V5+MEPgfa4P8il1+GxxeOs1athAJEDJOmj2bc3YrtCMVlzbr953BQD1t7CiENrdbJkAORIg3f33nfiKHJUY6O3+NS+uHsal0f9N3WnWm/mFzGef5POsN7RPXpoALYHLqqwCQ4MWOdjTqa3EA+GQJZ6bb5GmW784W34oAkvv2/UxDRhAjz3Shm8dEqaO8HwEsrxRSEu0iqo2/mNAQ40vXmUiryKWwXkENSfgBMnq/NKN7HQW8vGbn6ljjUPef4GjHBNku3ZeVfLs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(366004)(346002)(376002)(956004)(478600001)(31686004)(8676002)(7416002)(4326008)(8936002)(7406005)(52116002)(186003)(2906002)(16526019)(26005)(6486002)(34490700002)(31696002)(83380400001)(16576012)(2616005)(86362001)(6666004)(316002)(66946007)(66556008)(5660300002)(66476007)(66574015)(36756003)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 7iZTwAHhsdsOS5e7MZL4vxRacbuYzr8FU2IF5UhejhJjF/7EGTcSEc8HlZG4Pkwwngal1jOgTkSGvE8a5eUM5qd/6P7hv7/H6EgR9bAAbS5LKQthkFYR74FcX48KVEin9gFHDbSsG7dYgSKtani2Gh4TeTW0YyrhF72Zz+GOwZB6wG4rC/4Uc4aAPxAkdFDR/ykHYqQjDuq4rizHcy9ISqwF6MBeKo1tDItQ4hbGgbbEfmf2SIynuEQ/PaAgxmSFrbxO/1dwA2SMacW20lPA+D8B1jz6aVvspg5N3rSa6Yh/2bWPjAmmdTInrwEn7lkYHY5CGdtvDwRRrXi79AyC/7du+MmAL9jI0DUDlSeGIGeuVrpVZIYbOgHM7QSYPTi1MmBnyiNohLFQ+/NdSXqkqHTCbYdspkfKOUhESFRRTT0RsgW4Y5wNHNPkhydA2ugdWTB+SRRKctwDw2vB1RFLAZ/maad0a04CFvBuH/upzc6MKPlNKA80Tu0cvdEjpqRu6PadBmfhsonSjwj12oY/TnlDEQpBLd6piWHXlDohjR+wTIE+U8dnlhEi82n9YkltFBMCrBwmQSljGakUAhZqQY5CjInXWQQeFDM5AfnsIx3t8FUQQZS8BxSe0/Eu3un/mYtf/1ckN57XyDPWu8+4fg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36738f6f-d5b1-4021-227d-08d871127994
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2020 13:59:04.3772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYqzf6UaB495/1Q4rARdAUUDW8dyETsymTnQ8NutDz2IxispLaDQL4625w+jbCBN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4690
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMTAuMjAgdW0gMTQ6Mzcgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBUaGUgZnVu
Y3Rpb24gZHJtX2dlbV9jbWFfcHJpbWVfdnVubWFwKCkgaXMgZW1wdHkuIFJlbW92ZSBpdCBiZWZv
cmUKPiBjaGFuZ2luZyB0aGUgaW50ZXJmYWNlIHRvIHVzZSBzdHJ1Y3QgZHJtX2J1Zl9tYXAuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4K
ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
Cgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jIHwgMTcgLS0t
LS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2JvLmMgICAgICAgICB8
ICAxIC0KPiAgIGluY2x1ZGUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5oICAgICB8ICAxIC0KPiAg
IDMgZmlsZXMgY2hhbmdlZCwgMTkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
Y21hX2hlbHBlci5jCj4gaW5kZXggMjE2NTYzM2M5YjllLi5kNTI3NDg1ZWEwYjcgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jCj4gQEAgLTUzNywyMyArNTM3LDYgQEAgdm9p
ZCAqZHJtX2dlbV9jbWFfcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKPiAg
IH0KPiAgIEVYUE9SVF9TWU1CT0xfR1BMKGRybV9nZW1fY21hX3ByaW1lX3ZtYXApOwo+ICAgCj4g
LS8qKgo+IC0gKiBkcm1fZ2VtX2NtYV9wcmltZV92dW5tYXAgLSB1bm1hcCBhIENNQSBHRU0gb2Jq
ZWN0IGZyb20gdGhlIGtlcm5lbCdzIHZpcnR1YWwKPiAtICogICAgIGFkZHJlc3Mgc3BhY2UKPiAt
ICogQG9iajogR0VNIG9iamVjdAo+IC0gKiBAdmFkZHI6IGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3Mg
d2hlcmUgdGhlIENNQSBHRU0gb2JqZWN0IHdhcyBtYXBwZWQKPiAtICoKPiAtICogVGhpcyBmdW5j
dGlvbiByZW1vdmVzIGEgYnVmZmVyIGV4cG9ydGVkIHZpYSBEUk0gUFJJTUUgZnJvbSB0aGUga2Vy
bmVsJ3MKPiAtICogdmlydHVhbCBhZGRyZXNzIHNwYWNlLiBUaGlzIGlzIGEgbm8tb3AgYmVjYXVz
ZSBDTUEgYnVmZmVycyBjYW5ub3QgYmUKPiAtICogdW5tYXBwZWQgZnJvbSBrZXJuZWwgc3BhY2Uu
IERyaXZlcnMgdXNpbmcgdGhlIENNQSBoZWxwZXJzIHNob3VsZCBzZXQgdGhpcwo+IC0gKiBhcyB0
aGVpciAmZHJtX2dlbV9vYmplY3RfZnVuY3MudnVubWFwIGNhbGxiYWNrLgo+IC0gKi8KPiAtdm9p
ZCBkcm1fZ2VtX2NtYV9wcmltZV92dW5tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHZv
aWQgKnZhZGRyKQo+IC17Cj4gLQkvKiBOb3RoaW5nIHRvIGRvICovCj4gLX0KPiAtRVhQT1JUX1NZ
TUJPTF9HUEwoZHJtX2dlbV9jbWFfcHJpbWVfdnVubWFwKTsKPiAtCj4gICBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGRybV9nZW1fY21hX2RlZmF1bHRfZnVuY3MgPSB7
Cj4gICAJLmZyZWUgPSBkcm1fZ2VtX2NtYV9mcmVlX29iamVjdCwKPiAgIAkucHJpbnRfaW5mbyA9
IGRybV9nZW1fY21hX3ByaW50X2luZm8sCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
YzQvdmM0X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9iby5jCj4gaW5kZXggZjQzMjI3
ODE3M2NkLi41NTdmMGQxZTY0MzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92
YzRfYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2JvLmMKPiBAQCAtMzg3LDcg
KzM4Nyw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgdmM0X2dl
bV9vYmplY3RfZnVuY3MgPSB7Cj4gICAJLmV4cG9ydCA9IHZjNF9wcmltZV9leHBvcnQsCj4gICAJ
LmdldF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZSwKPiAgIAkudm1h
cCA9IHZjNF9wcmltZV92bWFwLAo+IC0JLnZ1bm1hcCA9IGRybV9nZW1fY21hX3ByaW1lX3Z1bm1h
cCwKPiAgIAkudm1fb3BzID0gJnZjNF92bV9vcHMsCj4gICB9Owo+ICAgCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2dlbV9j
bWFfaGVscGVyLmgKPiBpbmRleCAyYmZhMjUwMjYwN2EuLmEwNjRiMGQxYzQ4MCAxMDA2NDQKPiAt
LS0gYS9pbmNsdWRlL2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaAo+ICsrKyBiL2luY2x1ZGUvZHJt
L2RybV9nZW1fY21hX2hlbHBlci5oCj4gQEAgLTEwNCw3ICsxMDQsNiBAQCBkcm1fZ2VtX2NtYV9w
cmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgIGludCBkcm1f
Z2VtX2NtYV9wcmltZV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLAo+ICAgCQkJICAg
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOwo+ICAgdm9pZCAqZHJtX2dlbV9jbWFfcHJpbWVf
dm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7Cj4gLXZvaWQgZHJtX2dlbV9jbWFfcHJp
bWVfdnVubWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCB2b2lkICp2YWRkcik7Cj4gICAK
PiAgIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqCj4gICBkcm1fZ2VtX2NtYV9jcmVhdGVfb2JqZWN0
X2RlZmF1bHRfZnVuY3Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc2l6ZV90IHNpemUpOwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
