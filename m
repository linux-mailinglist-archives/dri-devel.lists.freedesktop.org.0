Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E33287E9A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 00:21:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BE76EB0F;
	Thu,  8 Oct 2020 22:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D256EB0F;
 Thu,  8 Oct 2020 22:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsSxXh5GqK3OTKgZcpIAkXCJg+tXZfvXrpkn47rfoL3Nc/lPKJwEPCGQBT8MCNX6csyZNvTD7v3jI6/O8LaUsTyf91AdkMUHQJXJ7mBjC73mBrW2nyLb/GERpvKm0cPuiRCvslxOEAu5g8sOVdAHnVadzKWdDowW4l0R9NIqDc/rX+jpQGY3bcxYlrhu3351UGTwh09dMziJf0mWPB5ZTZiovJtoe030f5JdKM1I4h+JFIC+T+XojfMH1a03L3kI7GOrHruSYaGnDEBmiJuAkJYD94GGFEySE72CJZLyeqhKPHPlrNqJR+BISXJihjQkINPjciqEoZiBbwCMsG76eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ph7WLt7xT6DDW0xLHJ3BfasZY9bURG2XT/KJYkVSYAg=;
 b=ZYZO32LUE/XUCeUQcfkrbKNanZVOE0Pzrh+jPkOE7UY968qrw7ASkdLgUeTloq2XCLEIWcPfWSIBEtfLpuISpOqHyHk3F3AHh/c5UoEvIbO1Pd5SlsmgWdq04obxc2g2tofJirMkCIfhBM2MciT8gZOLcG1lITPpFUvQTEq+37RHQ/IQoljIPg5gM7cjY7YQ8enxQSEkzpI6aTG2mhP5hhuiqN2iheNNMVKkKH5PujYiaYZqDksMQQk5OdK64l0OKmWSmKyvCuZtom+LWanzTH0IcBnMbLH4ZT4ZGRcngxPaqQLvBSm1DRk9NbylCDCbraS9g+KkQbfD0Ns8dKDskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ph7WLt7xT6DDW0xLHJ3BfasZY9bURG2XT/KJYkVSYAg=;
 b=2qU7xYBeZdzvDErhUvlSoIVN4yaoBP7cEjsn+fWLe1mpJivygyHT9yrAYXisTA+rJNaKdvZHKplm0Ytegfo0LOeGunFilF1lp99Fdw82npXx51Iuh/uvtLSS5ADs4vsadITyj2JW/otcDps/Qu78Q2+N5sxl1tBiIEJTcq0cu/E=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4707.namprd12.prod.outlook.com (2603:10b6:208:8a::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.24; Thu, 8 Oct
 2020 22:21:14 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::d850:b724:32ac:7bac]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::d850:b724:32ac:7bac%7]) with mapi id 15.20.3455.023; Thu, 8 Oct 2020
 22:21:14 +0000
Subject: Re: [RFC PATCH radeon-alex] drm/amdgpu: kfd_initialized can be static
References: <202009231033.xsCmjah5%lkp@intel.com>
 <20200923022828.GA49981@6c0fda7302fc>
To: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <7524deaa-65d2-a1bc-2de0-f47a34a654cb@amd.com>
Date: Thu, 8 Oct 2020 18:21:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923022828.GA49981@6c0fda7302fc>
Content-Language: en-US
X-Originating-IP: [142.116.113.11]
X-ClientProxiedBy: YT1PR01CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::32) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.113.11) by
 YT1PR01CA0063.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.21 via Frontend Transport; Thu, 8 Oct 2020 22:21:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d0e18d3-09b5-49b9-a89e-08d86bd877ec
X-MS-TrafficTypeDiagnostic: BL0PR12MB4707:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4707456CC92686F0429A3FED920B0@BL0PR12MB4707.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Cc6DdhXo2uJcOl1XyNbaN0lONfI0GQhumuZtDcjqXHybTZrekHe1FlXePvOISg9ifXFoTd3UmBsUdzdE5eMHGUlVNRk+rUNRlPyCgdroqKGCbF3iisZGKj+5rn3Wrm8L/kWRomMCQ9fksig2x8ZH9POJvkxTkXhCYcmcGh3iPcERwANEKqs+5T3n/+F/KZKIEsA4Q1OoCi1mxOyZJMjlfoO4tNPvUHeNY4KHWQaBrfJVWORtJZeK0/lWpPcmUQO02eya+xAYc8TeRRcN0d82VuNCPFIWT80OcspLUoym0ICZxlL08XuvFQCMNiQMLQUoZbwMtmfJMbR98ks0/r3cxWxx9Rz46kHXH7YfOJ633tv0XfUPahWgniVXhjLC8Jk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(6636002)(8936002)(2616005)(52116002)(478600001)(4326008)(31686004)(66946007)(450100002)(66556008)(66476007)(956004)(16526019)(31696002)(8676002)(36756003)(186003)(83380400001)(86362001)(26005)(110136005)(316002)(5660300002)(16576012)(2906002)(4744005)(6486002)(44832011)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: WpG7de+N5CVHRKlY/OnrhOltbH3+X0ZipLWxphuF4vQe4uZ3F2TSmhO0FDtZuG9cGjEluc6VrKNSFh3gtgWSqSfSHnVE/HBX4FvHArBdGTu/t2Chkl6qxqhOlwHogKAx0oWkdR6bEuacy6SgIOWkmZ1CcRInI1pam2vDN5zUhneSUp2QmfqCiuBJPIBHV5V6QabBwTv1bhPD/Cb1cntkBDjRExmcZsGsrPOssD3wOpH9ftyutAKUP01XXvi0ZPUCV7zWaR17vIvSl4S+6SzUEegpRjRNGG16odXX9ykFDsiUqCZEmlmqOhZessQz08JA9kPghQj15MfTkhIT/i/NXwXGCkbg+BGpe/oE5YjTBOyedF/M5jhRuP5/JbvOpBSx1Gugm15662NW6mTbB6NAxsl8fSczIKzf+Ptpg+pdOLGRkvtPhpAAPxOu5+Gpox3TAHkrdHGlqdm+MT2tOpu7QV+ZJM/wwasBplS2emW8pmWXMQz2yyq1e7qtWqBSHx7F5ceGFtPkRvEq68jVWY15KU32hgTVkdr5jJG/9zlZ9dExTjFYe9hCAiGXUl8SgSQmuedvWtVRKC0FYHIDMM1/+s8XLlkDy8Qw/Zs/iudCmKxtfMoIPrQoxIf0v9rulPNUgD2EJipcelRddW5yNjqIJg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0e18d3-09b5-49b9-a89e-08d86bd877ec
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2020 22:21:14.4346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bBrJokx7u3qlfmrzFdRD8aZEDgv+Nq37JAfzYbvru3DE3kywdNgk+aaWH4rwRAdOTZKPzWzwUZhkQU+irLvuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4707
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
Cc: Kent Russell <kent.russell@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RllJLCBJIGFwcGxpZWQgdGhpcyBwYXRjaCB0byBhbWQtc3RhZ2luZy1kcm0tbmV4dC4gU29ycnkg
Zm9yIHRoZSBkZWxheSwKSSBmaW5hbGx5IGNhdWdodCB1cCB3aXRoIG15IHZhY2F0aW9uIGJhY2ts
b2cuCgpSZWdhcmRzLArCoCBGZWxpeAoKQW0gMjAyMC0wOS0yMiB1bSAxMDoyOCBwLm0uIHNjaHJp
ZWIga2VybmVsIHRlc3Qgcm9ib3Q6Cj4gRml4ZXM6IDBiNTRlMWUzMGU5ZiAoImRybS9hbWRncHU6
IEZpeCBoYW5kbGluZyBvZiBLRkQgaW5pdGlhbGl6YXRpb24gZmFpbHVyZXMiKQo+IFNpZ25lZC1v
ZmYtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+IC0tLQo+ICBhbWRncHVf
YW1ka2ZkLmMgfCAgICAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQu
Ywo+IGluZGV4IDdmMTQ0NjFmN2Y0MDIuLjAxNzgwYmI4NzI3ZjYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5jCj4gQEAgLTM2LDcgKzM2LDcgQEAKPiAg
ICovCj4gIHVpbnQ2NF90IGFtZGdwdV9hbWRrZmRfdG90YWxfbWVtX3NpemU7Cj4gIAo+IC1ib29s
IGtmZF9pbml0aWFsaXplZDsKPiArc3RhdGljIGJvb2wga2ZkX2luaXRpYWxpemVkOwo+ICAKPiAg
aW50IGFtZGdwdV9hbWRrZmRfaW5pdCh2b2lkKQo+ICB7Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
