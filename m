Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C711A33F3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 14:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96F36E1E6;
	Thu,  9 Apr 2020 12:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20619.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::619])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC24E6E1E6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 12:20:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2cUfjX568L6G8hk1c8gGnCdIC0Iv0+L3t0gCpLRNLl6CyDmIZYJWT2fkjOwFUOphuKF+NRzszwgfjahLB1F+q96Nh6OOXlnMyTdKzCghFwMYAkwl64fEmqtpA4PDZJdZExlsyAWw9Qqg6TB+vATKIfzlCp9krX90JX9K2OdkCK4ZzV7EbMxn58I8pHiBrmj3QrPBycDigvEhef/IZCsugrAPcBTEKbtygQKKe9Qgte8MkNLvhr5NX3fjEf4pBd8YUMHRzV+B10Rzdw9G7FoZrfx0GLHRmH6OyOpu/E0EY/RA9FrfOysDxpU0HAAHqAlN5TdnKHyYDNRvJhgdHxg7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COtZRuyT7XJSb18ojSsONoxejaXkM1wNgeMLHxPRVqw=;
 b=OZdnE22Th2O+lRFE4dNLbzT0e0VmFvrzncsscty47rUwIt9rZchZxonabO21Xj79RaHd0mMSGetI/bFwTGbq2aTyNxK+AvbQc17CXxiFtACrKed04ZVB5DHchpQIASQiWpLqGHuMSjg/CGUynTXzHXhuYgogJXpn+ZbUMdRauTlMAvWE+WFKJT6kDcG10dUWt4FRoNsWkJnPJN2cxUKi/c3XvBb6NrIKsqnQJHc0GNiJ+yyyqJH3RGCCHepGYC7oyaer937YptA5mfSyP1CRZhRIFYywdydCT9JVjeLqgJ6oJp0EutlSM9PcrR14sjCAqWQ5ou3L2lWX2IUU2RE8SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COtZRuyT7XJSb18ojSsONoxejaXkM1wNgeMLHxPRVqw=;
 b=AdJhq9mhPDTo33w7SbuWK0A/pbCnefjP+z/FmzGsEvCs7mhAkWsujUttpXLzVfMSlb5bZaE3HhFSQHC5jt1fW3NBWA+wTXkXi/Vc8iw3KeipqtRfQsX3onCkqn9Bv9Z/esTdG72JEm7qjmmgyZJZWwmumctM5TEoB6mAchLks8E=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Thu, 9 Apr
 2020 12:20:15 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::f164:85c4:1b51:14d2%4]) with mapi id 15.20.2878.022; Thu, 9 Apr 2020
 12:20:15 +0000
Subject: Re: [PATCH] drm/ttm: Remove reference to the mem_glob member
To: Maya Rashish <coypu@sdf.org>, dri-devel@lists.freedesktop.org
References: <20200408221442.GA16848@SDF.ORG>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3d147884-3ce8-fcc4-72aa-334cd27f44d3@amd.com>
Date: Thu, 9 Apr 2020 14:20:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <20200408221442.GA16848@SDF.ORG>
Content-Language: en-US
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.17 via Frontend Transport; Thu, 9 Apr 2020 12:20:14 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 40ebe5b8-6118-471e-0f8c-08d7dc805bc6
X-MS-TrafficTypeDiagnostic: DM6PR12MB4404:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4404A2B393B2991CFFEF7C6183C10@DM6PR12MB4404.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:166;
X-Forefront-PRVS: 0368E78B5B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(66946007)(31686004)(66556008)(36756003)(66574012)(52116002)(81156014)(5660300002)(186003)(2616005)(86362001)(31696002)(16526019)(316002)(66476007)(6666004)(8676002)(81166007)(8936002)(6486002)(478600001)(2906002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lElujJ1awrW5viuHwvc+whFjbZtABlRfOk6qM0251WY5SUIUkUvhLKbzvKuUeFnty8QY7tufMiWWOoUM97nZSteBVZueDSA1QunO4AORGbjJtHtSyKHpgsRK5sU/TOzXBkAPxVAHlHyHKc9Vviz74liwGtV5zvP58wXZ0Nh6272PiViVtW/GF9/WJQyIzQxd49+nWtwttAWH6yXw0Hsov7WTGGBrVq+Vnz7Ng6ZnW0zkoYv8lkpNj6LDpVnrmVMf1DKEYSFo+Lp1NUD7P9lF996lPKkkjVfnyauERhuwmt7s3qsN4oWgb2CNmAm5EfT/zsGsntaMuI3XSUNNVM3LZkjXMEoaDS70yZaRPhnBvj1bL76k/uktguoSShvLekACKad20nHVFlp/YfET4oBH74V8i3ZiD2f9bDONSr9cqhcCVJqk4FA2qYh4X4JFL72U
X-MS-Exchange-AntiSpam-MessageData: bznCeeas2YHu7g2UTXcBCQTG1Auaps/7sffRtCOkuXp87/oqPSFYA9BL4GDuAQslbLFcwMt3rPr/Hj2zbhd1phbkno+gueU0V2YJNN/Jr7J1oIPl1d0XLRh45yc5/YIou1NmwGa+za6kY2+JBUM/QRG2jNT1VIOW1uHTRxjcpPKt9Y8jkqrnqtFHquh7nYiOnyIz92fI2TiOV6UwpFcHEg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ebe5b8-6118-471e-0f8c-08d7dc805bc6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2020 12:20:15.1528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYDZQ3GgZsqcT1plkBzZ2J7lh88NSMs2P3478AhnkMqJTvBekNjlwqFZFu3dDK++
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDkuMDQuMjAgdW0gMDA6MTQgc2NocmllYiBNYXlhIFJhc2hpc2g6Cj4gSXQgd2FzIHJlbW92
ZWQgaW46Cj4KPiBBdXRob3I6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KPiBEYXRlOiAgIFdlZCBTZXAgMjUgMTE6Mzg6NTAgMjAxOSArMDIwMAo+Cj4gICAgICBk
cm0vdHRtOiByZW1vdmUgcG9pbnRlcnMgdG8gZ2xvYmFscwo+Cj4gU2lnbmVkLW9mZi1ieTogTWF5
YSBSYXNoaXNoIDxjb3lwdUBzZGYub3JnPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCkkgYXNzdW1pbmcgeW91IGRvbid0IGhhdmUgY29t
bWl0IHJpZ2h0LCBzbyBJJ20gZ29pbmcgdG8gcHVzaCB0aGlzIHRvIApkcm0tbWlzYy1uZXh0IGFz
IHdlbGwuCgo+IC0tLQo+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaCB8IDEgLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS90dG0vdHRtX2JvX2RyaXZlci5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIu
aAo+IGluZGV4IGM5ZTBmZDA5ZjRiMi4uNTRhNTI3YWE3OWNjIDEwMDY0NAo+IC0tLSBhL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fZHJpdmVyLmgKPiArKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX2Jv
X2RyaXZlci5oCj4gQEAgLTM5MCw3ICszOTAsNiBAQCBzdHJ1Y3QgdHRtX2JvX2RyaXZlciB7Cj4g
ICAvKioKPiAgICAqIHN0cnVjdCB0dG1fYm9fZ2xvYmFsIC0gQnVmZmVyIG9iamVjdCBkcml2ZXIg
Z2xvYmFsIGRhdGEuCj4gICAgKgo+IC0gKiBAbWVtX2dsb2I6IFBvaW50ZXIgdG8gYSBzdHJ1Y3Qg
dHRtX21lbV9nbG9iYWwgb2JqZWN0IGZvciBhY2NvdW50aW5nLgo+ICAgICogQGR1bW15X3JlYWRf
cGFnZTogUG9pbnRlciB0byBhIGR1bW15IHBhZ2UgdXNlZCBmb3IgbWFwcGluZyByZXF1ZXN0cwo+
ICAgICogb2YgdW5wb3B1bGF0ZWQgcGFnZXMuCj4gICAgKiBAc2hyaW5rOiBBIHNocmluayBjYWxs
YmFjayBvYmplY3QgdXNlZCBmb3IgYnVmZmVyIG9iamVjdCBzd2FwLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
