Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73915276FA3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 13:15:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955496E1ED;
	Thu, 24 Sep 2020 11:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B3956E1ED
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 11:15:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GA845dC2YMyC4pBwpZ+sULWtmgRVP6yuS1MMYCIPXiSwsgx6vEuXXOjoLZOOuXb40L/RU13Tvj1U204qVy+4zsGhJlWBfujP41mRuISjAyk52K3lcdcExc45odkOjVc2fYQDuu/UHDzUdMx6QlYOU4183C0RoRgk37RhjAo4stinEtrTDWDYESSRyY2tmf/WKWRX9xgOOkYGO6l2ZmEeBCu8LoEflDaAX/If58FaXJS571lBsdLExKyWjAJ5MDvAdECbDg2beGyMnsHfR54Uzf3kSjj7bq0g3UFTbmFslxDST8de4gSK9clJTBpDjfGGSNL6zZR6kXuIU4gBDejQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAIoAAdNILvPopzbzsPX5DqFJObF2YErQbSUcXJuhLI=;
 b=B7f5rqMrZ2WZMjaIJiErUVqgYupf6/h8p0KRI1IqHpCyyd1lyyOs3cYY9z3DaUk0j5BV+fTxx52YX8px6ro4t+Flo1KmfGqVvAwy2f0OF4eM8cA5d4ZTlkivm93UFwRJRRmWMhMiPNveQ5ExWP52J4bJ/IA+oUumZl3sAUaIkGafMLSHd67HONR2SKa7UoXCT3OJul2pHUo4yCYsXUwKpBCzSCkXiDVvxRwrq755TrdQcWKGiBx6Ji53ddJ54qqfgJBM57EojeWAibhSSuWgUB2JpepW2LAc72xFO1nMDs3kndWnEfAHKQ9pxrzX+UE+zFTykvDD4N4zw+f+nAIgzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAIoAAdNILvPopzbzsPX5DqFJObF2YErQbSUcXJuhLI=;
 b=s2hgshhggqkWPJ2I3TZD7BF6pXITCUJlzIm3e2M8QPnGbQTx5f21/4ThTTDn+IG10KCdI9Cz6te6P6+za6HfHg5z4QiaPl7DKS9cr6iaMIJ75Vk174dG62rRZo1JEqDORLJE2d0jIERcj8ein8iUzaRsTKevzoLzc5GS2+SJ2ZQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21; Thu, 24 Sep
 2020 11:15:26 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3412.022; Thu, 24 Sep 2020
 11:15:26 +0000
Subject: Re: [PATCH 09/45] drm/ttm: make move callback compulstory
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200924051845.397177-1-airlied@gmail.com>
 <20200924051845.397177-10-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4ddeb558-a556-a01f-1cba-eb5feb1b26e6@amd.com>
Date: Thu, 24 Sep 2020 13:15:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200924051845.397177-10-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR02CA0093.eurprd02.prod.outlook.com
 (2603:10a6:208:154::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0093.eurprd02.prod.outlook.com (2603:10a6:208:154::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend
 Transport; Thu, 24 Sep 2020 11:15:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 521c203a-9332-45ff-3f32-08d8607b2327
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2353DB54AAD5B2A6E1D518ED83390@BL0PR12MB2353.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gFiRzBNuFA+a3xKapiIIYg6klDiG6Mb+d9kR8OSe7VwwaFcfDx/rsKkXKRR6lVh+DyYkMJDXtzvd1eAqID8Pf5MvW1rVdpnCJKTuq9QAfzBNyyX+XBHcSmAkHSD7xtYhC2r5Akdu2WeH5yPCJiS1VxFzQz6YACCHwghvmGFvS4axZq3+fSOkhA/e0wCjxIA3sD9kpbUp1uIrXSAR/8QR/JD2cqbqmHCu/27N+AabH9iOcji4CeCir9MhdZgSqziSqgvPxATiN6PKeuHxqN0Jc/e58GVarEbw8aoYcJFMUeQxJx7DjqgBoBAUA7Q3kKhOSOoeIyK8tu164VE3MBQd51Xfth3lwVfhtPyRwSrlM3ZkOal+t9g9+k/EcksjFjY7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(366004)(66556008)(66476007)(66946007)(31696002)(186003)(36756003)(16526019)(2906002)(6666004)(83380400001)(86362001)(31686004)(8936002)(478600001)(4326008)(6486002)(5660300002)(316002)(2616005)(52116002)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: eC6sgQ1xeD9U4rC+uZULqF2L/gMYvvD9m7S6DjihCLg2k8D1nuKq6VdHfXkhyaJqtlgWruFIeVvfOb/Kkp0EOKB+pDzkdmQEyzhGfGH+43BuyADkcxyMvMw1rT50qmIQu0QTx23+6FkcSyKKGR4NcqONhsIFYWBLuV0BC/Cx3Jk7PKn4UYYHaFv3WjnmAtOoHHkWzM4Z4jcTnw+GgkW22poUCvgPv6a+nFChS+t6V73leKXUiCcKVVItNJBe/E1Ffe5sE05NvkE63LV0tgMBK6g0b13rtlsxYQj3fL8it/nwNMd93UHYJ5BnV1W5dfdstwlVcYZF1+LEfTWU33mhuEI2Ig5wclzsypOTZYd971R3adHq866DmMXA4FxWDpk05Q7zOQwdm40PCyS5maBsWMd4FSj/W/ngsc514aNjZCXkPcCEVSeBNaRsiNrdHEJSrj40KihRBQEofAlLDfAPnN9BefQRY2o67aetD7e8Ffq9ZR6ohxO/bbVpmvqZrACkAeTRS/60rEnaczViguyVAbtD0kGANWPt/P3u5PFUHJuG25zMVnHIp5sFtwVMpBX2dbS3pgZan+jHQHNXzMmpQfQupB6Fh2iSGlonWL9w42No9xQgh1g4AiHNM2AslcxhdQ7KPjrgZCEpNcaZmV8sJPRWCzb0o307oHgL8gBg+qyfntS8VlSoDjIKXsadkYz0g24y4Ane20PaEwSqx1BnmQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521c203a-9332-45ff-3f32-08d8607b2327
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 11:15:26.1183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vweA7orRlPRUrweA2Y7BH4Npr2ECToXPnBQALSBtFFz7xE7bw0I7H1PnB9DyRsOD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2353
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
Cc: bskeggs@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDkuMjAgdW0gMDc6MTggc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gQWxsIGRyaXZlcnMgc2hvdWxkIGhhdmUgYSBt
b3ZlIGNhbGxiYWNrIG5vdyBzbyBtYWtlIGl0IGNvbXB1bHNvcnkuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jIHwgMTMgKy0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGlu
ZGV4IDZkMTUyMDI1NWZjMS4uNmE3ZjRjMDI4ODAxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4g
QEAgLTI3MCwxOCArMjcwLDcgQEAgc3RhdGljIGludCB0dG1fYm9faGFuZGxlX21vdmVfbWVtKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJaWYgKGJkZXYtPmRyaXZlci0+bW92ZV9u
b3RpZnkpCj4gICAJCWJkZXYtPmRyaXZlci0+bW92ZV9ub3RpZnkoYm8sIGV2aWN0LCBtZW0pOwo+
ICAgCj4gLQlpZiAob2xkX21hbi0+dXNlX3R0ICYmIG5ld19tYW4tPnVzZV90dCkgewo+IC0JCWlm
IChiby0+bWVtLm1lbV90eXBlID09IFRUTV9QTF9TWVNURU0pIHsKPiAtCQkJdHRtX2JvX2Fzc2ln
bl9tZW0oYm8sIG1lbSk7Cj4gLQkJCXJldCA9IDA7Cj4gLQkJfSBlbHNlCj4gLQkJCXJldCA9IHR0
bV9ib19tb3ZlX3R0bShibywgY3R4LCBtZW0pOwo+IC0JfQo+IC0JZWxzZSBpZiAoYmRldi0+ZHJp
dmVyLT5tb3ZlKQo+IC0JCXJldCA9IGJkZXYtPmRyaXZlci0+bW92ZShibywgZXZpY3QsIGN0eCwg
bWVtKTsKPiAtCWVsc2UKPiAtCQlyZXQgPSB0dG1fYm9fbW92ZV9tZW1jcHkoYm8sIGN0eCwgbWVt
KTsKPiAtCj4gKwlyZXQgPSBiZGV2LT5kcml2ZXItPm1vdmUoYm8sIGV2aWN0LCBjdHgsIG1lbSk7
Cj4gICAJaWYgKHJldCkgewo+ICAgCQlpZiAoYmRldi0+ZHJpdmVyLT5tb3ZlX25vdGlmeSkgewo+
ICAgCQkJc3dhcCgqbWVtLCBiby0+bWVtKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
