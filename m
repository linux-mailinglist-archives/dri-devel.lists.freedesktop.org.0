Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E492727DB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 16:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EB86E373;
	Mon, 21 Sep 2020 14:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B9F6E373
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 14:39:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OaUHdVljgnyniDYcHUu4LBXAMJBCImMKLFVjM4+dJ0q/50qXHjTghD1JforLe3W0tfzSx89Le4zmtobfEPJYfRWYGWLrEuvW7aXbo7jTf5U63SV4yezW8W7cxUKtLGcoDr13RY0NhtZNJOlYW60YtJH80PgNWu9Arow7C1dYtiy1OUOs9XE2VnN55Pe8EL5g+aPbtO76P92S2FfI3Ttp1SpXa9/kJgvHvOkm8JuY93LHFoyPqmKJf4N8KGo51LjnQ95QgD8y0Vow5Yi75s0LgTP9/XXODnxK2M97n9BGyUeVHegZKhn65Lynwz82K6quO2hN8d4rBdr7jGEMF4wBrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABC7JjtJ3N4vcdG9ByB2FFfoNtv7Z/Unh1Szk2r61HA=;
 b=bUrUf39TEb7d3JoANIni6sG7X1cz6GJaAn/8WYD1APmH3B/P/DFXMbbEPa7FzjkgNldgft/UCYGIkFDu6XufX7wzDcCOYtje47AMOjgVXm+2yn4dzxLIdDhcVwFB9C15zaxSYX+rc5K9/mxSU3KjCkYJHqNbENuG6B33KUiaHtZQ5pRA+doa5pEOggfejxPKVb51i9PnPN30HbsJazl6zveFhrVAE9rdiapqXivY5/0OG7ojwH8O4l8/2DQaOj8fI0JjC6dnYgikIG4q5rNYD1qyEMRSvHHRZtIq3pvjywk3tM/qq4m9KPdG73VVI6NHK69zz6o5/YsgFsdBjbQOqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ABC7JjtJ3N4vcdG9ByB2FFfoNtv7Z/Unh1Szk2r61HA=;
 b=az1GIT/7zC1TxPTPqJyTVgtf1wkcRiovWIK5y6+uWo3os/GxSaIkez73s7liXK/lITEpk86jLFISJ+FrAm2FjK4VNY3vj57eyfv6edYLQv7sVaNDDVCZpG30pUuTI38LZJ3x7iDwNXH3s8Dp5YPcNIodMDIMmFmRHjnk/KwfnGQ=
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3680.namprd12.prod.outlook.com (2603:10b6:208:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Mon, 21 Sep
 2020 14:39:14 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3391.026; Mon, 21 Sep 2020
 14:39:14 +0000
Subject: Re: [PATCH] drm/vram-helper: Fix use of top-down placement
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, nirmodas@amd.com
References: <20200921142536.4392-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b3944516-2446-896c-34e0-952b8ccc5706@amd.com>
Date: Mon, 21 Sep 2020 16:39:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200921142536.4392-1-tzimmermann@suse.de>
Content-Language: en-US
X-ClientProxiedBy: AM3PR03CA0068.eurprd03.prod.outlook.com
 (2603:10a6:207:5::26) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR03CA0068.eurprd03.prod.outlook.com (2603:10a6:207:5::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.13 via Frontend Transport; Mon, 21 Sep 2020 14:39:13 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 492c302c-df06-4a4a-4ab6-08d85e3c1cb8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3680:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB36803A6703EE67E63631AA08833A0@MN2PR12MB3680.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J4acV+zt8M9uw90uz7u/MMPtYrScK9KaII+C++mb1TTzGWBI2F9sltlLB6+QCcHiq9XdGiN8IioI4u8o3QVxKbG3YFNbaxa3I2B36Dh0GQV3Y2lcOSH//3s/FdhS95SqK4lLY8k5tN+tQvt099no6iW+hTm/3owmEpHabOodarIJg9FIaUdXkMvxRQTfRCfXNf8YLGZt7LjP745RIx4frEI0A1WWUydMU4KTOPO/J+yfjDpxDMUzWsfA0m/at/BeEopUJPUZ66nb4vrenTCE7DEmCFsfouggHINCVnnYPmoGUBFm0p0icGfDU4UDk2GdcGiy/uWdReQ/mhVswpxGiuWZHF0sZsEVEsOXZs2bPvEdfDgxg/2lcnKZIEiOAfJuy77N38Sb1jfwe/WRhzAz58jbWo6DnNHb5WWAThSuPO8Xzk58fV3o7ODXQmba9BVd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(86362001)(6486002)(2616005)(478600001)(2906002)(6666004)(8676002)(186003)(16526019)(52116002)(31696002)(31686004)(6636002)(66574015)(8936002)(66476007)(66556008)(66946007)(4326008)(5660300002)(54906003)(83380400001)(36756003)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: mYYn7j5gMOekWw98ojo7MTvhe1scrJcMcI1bcCg5pUHkolTIZL3bhP5TZCMwo1rDs692kuCn9ndW+gINtVMg+cnHBnRTCegLhSWKBWGjn1FsJO3LydWvhlMT9Z/cv73HmoDjiJqpGof1ROTePwhC5UGDOtyBq+G5K19JiaHS/0jsjE5eKyUE8PieGDUJolADsKXdp7oo9GijsYzSSaX8i+gPz719XPmo9bEKz8boiLqUA8s9PFVtdrd5YN2+Csx9iEX1PLo+f6Rmxg42stVhLAXXAcCgjqfHwbWEwdhTVEvyemJwCDWCr9kHdkAfzXx1tp252+npI1ECxZpI4y/H0zTrPkM/pgzlKgh0xud7dU3hv7CdnBZgEl++TXlv/7wjr9h3k+4DNG4G9zwdJzizkQkgknJs8nx+IbXHZ28p8cOOhgNFsaBMDhCHTrKQkDZzAFHjeaSTryD1eS8qtU8weBsNdDflHPILRfjLDj1CixivTMi24DFNJF90aD0KUbWS//r8QxBmfUwc0n/XlmE030QJzZaGLwiKfbDpypGlaNVCZPdCwhBzdU/TA2ZaIVpAOMVytjQW/d+RqfSTX6cjdWOoNP8xoD8SLcpgoLWNQImMJAcwPbGJiH9hdqOxCtAnQIg5qdWfasUIf1cAWIQzlbgBQs5TU8DhdnirUZxbOpNRrV1FH92s091D2qc6iivOUEK7ZT/wMZm1ZwQto+pyDQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492c302c-df06-4a4a-4ab6-08d85e3c1cb8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 14:39:14.8991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gI0ohKwmkmlwjnpEbgmsCqYUGmDGWTz3uBc3IGPNlILpBz2+gRaR+aO7jviilKCS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3680
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDkuMjAgdW0gMTY6MjUgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBDb21taXQg
NzA1M2UwZWFiNDczICgiZHJtL3ZyYW0taGVscGVyOiBzdG9wIHVzaW5nIFRUTSBwbGFjZW1lbnQg
ZmxhZ3MiKQo+IGNsZWFyZWQgdGhlIEJPIHBsYWNlbWVudCBmbGFncyBpZiB0b3AtZG93biBwbGFj
ZW1lbnQgaGFkIGJlZW4gc2VsZWN0ZWQuCj4gSGVuY2UsIEJPcyB0aGF0IHdlcmUgc3VwcG9zZWQg
dG8gZ28gaW50byBWUkFNIGFyZSBub3cgcGxhY2VkIGluIGEgZGVmYXVsdAo+IGxvY2F0aW9uIGlu
IHN5c3RlbSBtZW1vcnkuCj4KPiBUcnlpbmcgdG8gc2Nhbm91dCB0aGUgaW5jb3JyZWN0bHkgcGlu
bmVkIEJPIHJlc3VsdHMgaW4gZGlzcGxheWVkIGdhcmJhZ2UKPiBhbmQgYW4gZXJyb3IgbWVzc2Fn
ZS4KPgo+IFsgIDE0Ni4xMDgxMjddIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0t
LQo+IFsgIDE0Ni4xVjA4MTgwXSBXQVJOSU5HOiBDUFU6IDAgUElEOiAxNTIgYXQgZHJpdmVycy9n
cHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYzoyODQgZHJtX2dlbV92cmFtX29mZnNldCsweDU5
LzB4NjAgW2RybV92cmFtX2hlbHBlcl0KPiAuLi4KPiBbICAxNDYuMTA4NTkxXSAgYXN0X2N1cnNv
cl9wYWdlX2ZsaXArMHgzZS8weDE1MCBbYXN0XQo+IFsgIDE0Ni4xMDg2MjJdICBhc3RfY3Vyc29y
X3BsYW5lX2hlbHBlcl9hdG9taWNfdXBkYXRlKzB4OGEvMHhjMCBbYXN0XQo+IFsgIDE0Ni4xMDg2
NTRdICBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfcGxhbmVzKzB4MTk3LzB4NGMwCj4gWyAgMTQ2
LjEwODY5OV0gIGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsX3JwbSsweDU5LzB4YTAKPiBb
ICAxNDYuMTA4NzE4XSAgY29tbWl0X3RhaWwrMHgxMDMvMHgxYzAKPiAuLi4KPiBbICAxNDYuMTA5
MzAyXSAtLS1bIGVuZCB0cmFjZSBkOTAxYTFiYTFkOTQ5MDM2IF0tLS0KPgo+IEZpeCB0aGUgYnVn
IGJ5IGtlZXBpbmcgdGhlIHBsYWNlbWVudCBmbGFncy4gVGhlIHRvcC1kb3duIHBsYWNlbWVudCBm
bGFnCj4gaXMgc3RvcmVkIGluIGEgc2VwYXJhdGUgdmFyaWFibGUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBGaXhlczogNzA1M2Uw
ZWFiNDczICgiZHJtL3ZyYW0taGVscGVyOiBzdG9wIHVzaW5nIFRUTSBwbGFjZW1lbnQgZmxhZ3Mi
KQo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gQ2M6
IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQg
PG1yaXBhcmRAa2VybmVsLm9yZz4KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgoKSXQncyBhbHdheXMgdGhlIHN0dXBpZCB0eXBvcywgdGhhbmtzIGZvciBuYXJy
b3dpbmcgdGhpcyBkb3duLgoKQW5kIHBsZWFzZSBrZWVwIGFuIGV5ZSBvcGVuIEkgaGF2ZSBxdWl0
ZSBhIG51bWJlciBvZiBtb3JlIHBhdGNoZXMgaW4gdGhlIApwaXBlbGluZS4KClRoYW5rcywKQ2hy
aXN0aWFuLgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMg
fCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwo+IGluZGV4IDUwY2FkMGU0YTky
ZS4uMzc1Yzc5ZTIzY2E1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3Zy
YW1faGVscGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5j
Cj4gQEAgLTE0MCw3ICsxNDAsNyBAQCBzdGF0aWMgdm9pZCBkcm1fZ2VtX3ZyYW1fcGxhY2VtZW50
KHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0ICpnYm8sCj4gICAJdW5zaWduZWQgaW50IGMgPSAw
Owo+ICAgCj4gICAJaWYgKHBsX2ZsYWcgJiBEUk1fR0VNX1ZSQU1fUExfRkxBR19UT1BET1dOKQo+
IC0JCXBsX2ZsYWcgPSBUVE1fUExfRkxBR19UT1BET1dOOwo+ICsJCWludmFyaWFudF9mbGFncyA9
IFRUTV9QTF9GTEFHX1RPUERPV047Cj4gICAKPiAgIAlnYm8tPnBsYWNlbWVudC5wbGFjZW1lbnQg
PSBnYm8tPnBsYWNlbWVudHM7Cj4gICAJZ2JvLT5wbGFjZW1lbnQuYnVzeV9wbGFjZW1lbnQgPSBn
Ym8tPnBsYWNlbWVudHM7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
