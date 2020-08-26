Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A6D2532EB
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 17:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF1E6E14C;
	Wed, 26 Aug 2020 15:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3071D6E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 15:08:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvcIaSnW182+YZUo1pWrTrGoOBFqCbBsQV32wZjYbCmqzLZauL0kSj4LZi2Z/AcCMNiidU7VXBE8Zbda4a8zNWksZKqOj9HBQQvhhv002T1+gw+xGaKzCHCh1+7/MPvckvn2z0XMXGILPzeu7WGuM3IUG689N51KW0maOaU13cfw83FhXxZaVERGNCCJ4MVrCJVEbV+ksw6abbMVu7AXUVWtf4G6sk613WctLXj/c2OXfjlVQaPDIUltv8U/WO0BOjyeJJV4KNqwPr9lmlcgFOsTbi14oCJm5niR4o8kX9RmHIk9lSaHeIBLLV+tVu63YbyfVbKHb8dHXI2YLSKl+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drHFO8KIKuIF4cUAkRI/W2NE4KQ0EjRuMo01gkwBFUA=;
 b=d3Xhkn2wduCoa9W3QavLeGodPC6VPFyfuF2ktWWr53UB8o69XUeqxLy1D+a6Ev17KUNARjF77gyYZSHXW27BtwUgQosmP0NIYyatpfoBJ/x4gstIKPl9f9EFxPxQqTnXnsSVLTI7uHHYeHLok8xUjSBwoCF55ssYIDNmhrxDQ3ynt3EAcy02veyaUmOezjXdaM0UtgVxd3yjqomvNDsaat1dfvN0AT2hWQ6MZk8QReGvI4RWOcXHZ/ygOsrpa12QmNAZF1+Jaf0HPeZoSVzx/ToeMefOrk5XcvuQnppb6QaJHqptzt42ua1DxiDdHY7RjBvyYO5iD9Kb5DmUQAWnuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=drHFO8KIKuIF4cUAkRI/W2NE4KQ0EjRuMo01gkwBFUA=;
 b=ZfmheNC21olK/L5nB1sb8KzPR3fVDPfOsYTtXudkP5rdDSYfNVOs7bMrMTDmIr41fboEiQdYCpufZRfoz7q5zCC+eJPdVLPkSdkPqYrCyE4vYI4d7hG4nVTPSEjAfWvwd7j5yP7+WeK+iGgK10BeFL91wM8qCjMgOnxuDxsLYA8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2417.namprd12.prod.outlook.com (2603:10b6:207:45::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Wed, 26 Aug
 2020 15:08:12 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.030; Wed, 26 Aug 2020
 15:08:12 +0000
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
To: Joe Perches <joe@perches.com>, Jiri Kosina <trivial@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <cover.1598331148.git.joe@perches.com>
 <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d5ea3bc7-bff2-c702-51ed-cb85767824a7@amd.com>
Date: Wed, 26 Aug 2020 17:08:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR03CA0070.eurprd03.prod.outlook.com (2603:10a6:208::47)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR03CA0070.eurprd03.prod.outlook.com (2603:10a6:208::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Wed, 26 Aug 2020 15:08:10 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb70ce2f-c8d0-4f70-2cf2-08d849d1d97e
X-MS-TrafficTypeDiagnostic: BL0PR12MB2417:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2417123FB233B0DF5E23BCCD83540@BL0PR12MB2417.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8yXKfz3ZrYeIkNDxw1MQpi+yDmtX3xUt2+kQTdhF/yjlIpJSZ06M9Z/UbH4SV84kzMqyOeeLOUcOK3IQfaNpJJmDkVmsCjfvV+RsdZAXJxDvN7kocrxObbX6y4Zu2iVflj7X+3C4Pe7gSy8SDvBlV3JUxsl93nxO1mMzNP3TUX3WmMLy7czhfWkv2S/8cUO/tLayjbbevCZgra4rDnnfA8q1Egh7BWfcYV2uSq7Z1e0O1Vg81b9YjbEJ4GmH42AWJrA0Dwv57udZPv3TlFqu5MMxpKpGKtU+KxtG1GBO56ZmplEgXBrcgLqOgcEkSSJ6SLsEl9HHqN4RG586XcV2LJjYMHNvdmnVVqhGj9O76PoAEG1CbloIuWc9jP+nl+5H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(478600001)(66476007)(66946007)(31686004)(8936002)(36756003)(5660300002)(6486002)(8676002)(186003)(16526019)(66556008)(4326008)(110136005)(316002)(6666004)(4744005)(31696002)(52116002)(2906002)(86362001)(83380400001)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: vVdKUTxFLmQOZCwNLnoon6BfFHFYPYehM3fzMClPyzss8yd0WVaklMyiPMCIJOrtOlN8399FSOvkEj6RgnMLDfwD/05IcQ9WxucUC2MhZ92inUnzF4AI6bW4q4Cust0aW9i8MtoqxkkbnMYuw4uMIVsre2Oplw5xjajjcIB5A9jxe8MYUz6rksN2pdJA61xEcfHI39wJYTZDpsAOV2s8SPrECzJf4j8q3QE4RQu7cUlZv5vp8tUAWyaBUOg8UnHhSKkyeY6NyI8ivFap/9y6L6t+2PNnpRW/DlCgWjGWabiwNyHKJMSiryxh0V/saRgYaAAo6l235dCE8N4I3MkE2auFEDotidSXQkqIWhFnp+WApQtO8BUcx5lr8YeyyG//TbPS8GMHs2TV2cTtAmFBzIidt1zZuZvIYl2GKrGZoUc0uNoilTDCmwfiI7QjL3QrtFcCnkZ56mgeLED1RSR+vz4pEk8Teyjqde18iX3OIA868aKNgIKD1aVEiCp3cwFCryqVKpQfC1J3CyhfsGMi8zS4OKHLdvpSvhzufBem5Mx1tFsT9v62bmMAesdniLfuv8RHDsWyLFPVp2uZIKra4WKA84laivZ9g3K/H93vUOdWO5LBY5gdKkYvuSHeba3XqkhipUcZ6RaKSqLtzyWuTNjwAOn83Nm2wVF2SAFZTAqgjk6cBElUpiuHXmruDlG+PsUI+pV8YeDJxaa1Qdki2g==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb70ce2f-c8d0-4f70-2cf2-08d849d1d97e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2020 15:08:12.2260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kkmx3Hr+2JXf+Ct1/b1Sa3shHETXkAdTkoxAGE2F35ujeWLqCkU17r+/WLxZLn0+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2417
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDguMjAgdW0gMDY6NTYgc2NocmllYiBKb2UgUGVyY2hlczoKPiBVc2Ugc2VtaWNvbG9u
cyBhbmQgYnJhY2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSm9lIFBlcmNoZXMgPGpvZUBwZXJjaGVz
LmNvbT4KCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cgo+IC0tLQo+ICAgZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS5jIHwgNyArKysrKy0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9zdC1kbWEtZmVuY2UuYyBiL2RyaXZlcnMvZG1h
LWJ1Zi9zdC1kbWEtZmVuY2UuYwo+IGluZGV4IGU1OTMwNjQzNDFjOC4uYzhhMTJkN2FkNzFhIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9zdC1kbWEtZmVuY2UuYwo+ICsrKyBiL2RyaXZl
cnMvZG1hLWJ1Zi9zdC1kbWEtZmVuY2UuYwo+IEBAIC00NzEsOCArNDcxLDExIEBAIHN0YXRpYyBp
bnQgdGhyZWFkX3NpZ25hbF9jYWxsYmFjayh2b2lkICphcmcpCj4gICAJCQlkbWFfZmVuY2Vfc2ln
bmFsKGYxKTsKPiAgIAo+ICAgCQlzbXBfc3RvcmVfbWIoY2Iuc2VlbiwgZmFsc2UpOwo+IC0JCWlm
ICghZjIgfHwgZG1hX2ZlbmNlX2FkZF9jYWxsYmFjayhmMiwgJmNiLmNiLCBzaW1wbGVfY2FsbGJh
Y2spKQo+IC0JCQltaXNzKyssIGNiLnNlZW4gPSB0cnVlOwo+ICsJCWlmICghZjIgfHwKPiArCQkg
ICAgZG1hX2ZlbmNlX2FkZF9jYWxsYmFjayhmMiwgJmNiLmNiLCBzaW1wbGVfY2FsbGJhY2spKSB7
Cj4gKwkJCW1pc3MrKzsKPiArCQkJY2Iuc2VlbiA9IHRydWU7Cj4gKwkJfQo+ICAgCj4gICAJCWlm
ICghdC0+YmVmb3JlKQo+ICAgCQkJZG1hX2ZlbmNlX3NpZ25hbChmMSk7CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
