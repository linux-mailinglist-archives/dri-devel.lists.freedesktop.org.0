Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8864D22C8AD
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 17:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0401F6E98B;
	Fri, 24 Jul 2020 15:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 182816E989
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 15:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnXTIfae6JcTxB6cEE96vpfW3HKn13pbM8z9v9v00Nd2NvSuXbIPT/ly+mVFpdt44YQIrB429g8kcA4dR73fMN7SPA7Xk+lEhNzxFCjHB9KC+EPipebzRqrtQ0blhitHkKMQtcRgrCVtqjO7Y1DbP/HKBNetAFaTxNxKAoEqZJi1nfl68dHLTHrVP3VGJcVj+WD5bv7FiwMi6M8S0mWEyrXq2+leOavM9hNC4nTz+6HySfoh8Zgqca6zvoZaphw0wYBHoRBB0YcoMccRwbMApoEiWzXD9BKRiffv3qdTPdCG5850hWeDO8ZTx1/EBh+yueslDHVolfqDvQeWIEzr9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4MFkSMCCgFa1UHzbTmr3sO69nW0sFCKx0pWLw7+45k=;
 b=WzE2r3RfmFIxIEtMyc0LB+0fJSylFRvUnzvlssMl/yoWsE25AlHy3FMmpFO9y+Niy2emEk3YUmtQKvocHl5EMcXkViqJdBVXdZOYDUsrlSAoSXQ2mx6J87tTUTtf15aKMEVWw+FzgABoxtUSwoVZ+z8gUx4uyVhi/tZnZmiKzHZqHCcpxSVpldPCrIqpK6atenFesb63U4hZMtCDnCkrEhtfQeQmiP8cur+RuQKxhcG9pJ+LRNvx1t7z4V4xFAQy68LaUOWsmX7svD3hd3vB5WrFNLzX+vcNTeXBWzAcWfsqZtXUQS7o9dth3tTdx0wQ9tPCX4lwurq1GSQkkMlfDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4MFkSMCCgFa1UHzbTmr3sO69nW0sFCKx0pWLw7+45k=;
 b=w4I2dYTu+XKGcqk/SWT6LKmL796J3gZi8bUrS5FkTKcCTYqtaM1DmOi6piitMRPXLacGQxVEXmIEYk6P68Z6Lv5FwXn8lW26EChSe39SS6nZCh0Il7rLqjIR7d88HJDutGAuNnVWnS62N5LgiA3HpCROHFCy+IPznKehPoYaX/Y=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SA0PR12MB4509.namprd12.prod.outlook.com (2603:10b6:806:9e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Fri, 24 Jul
 2020 15:01:34 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::5d1d:887c:3ba6:1d0d]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::5d1d:887c:3ba6:1d0d%7]) with mapi id 15.20.3216.020; Fri, 24 Jul 2020
 15:01:34 +0000
Subject: Re: [PATCH] drm/ttm: fix pipelined gutting for evictions v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20200724115611.15375-1-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <eed23689-279e-2ec9-ccab-143271b80466@amd.com>
Date: Fri, 24 Jul 2020 11:01:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200724115611.15375-1-christian.koenig@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::36) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.61.76) by
 YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Fri, 24 Jul 2020 15:01:34 +0000
X-Originating-IP: [142.117.61.76]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8a812b2b-6c76-4f0a-8262-08d82fe27509
X-MS-TrafficTypeDiagnostic: SA0PR12MB4509:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB45096B093850D8275B5C650492770@SA0PR12MB4509.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kg1PgUQt6P6kutYAhPHjT+VkWPiaEEOTrt5PXyQFyysFxtiFeSnVX4rQguAvBHRHKePbs+WFxQk3HoQUQUvLyH89gqUu1lbyEAoWwZBAcHyg3pCPhPe+yYl7sutFbiC5QA1x4PE6vhQ+m3PRn/LmocVHRIldzwbktYv3O9VhUSEoR6dczgzqpAL4pa4vSZnJZLR31iANm8ckVQzswqZBi3+BmHfi2UO2bamw1ExvT79qhlgfpN84sVOkeUI+WaxxlbkN8/CDNJLZVUr0l2eeyeERS9bFQnZcKEedwH9kuWlqiGmehx5nhR4RPiOEWvzaKkh7TsX2XC84J73sDdJbIZ4PfxxB0JyIIpJAkPRv+yeo/wYkHnzpi3Xk2CYD4SzW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(478600001)(44832011)(6486002)(186003)(66556008)(66476007)(26005)(956004)(4326008)(83380400001)(2906002)(31696002)(86362001)(52116002)(66946007)(2616005)(316002)(16576012)(8936002)(31686004)(5660300002)(16526019)(8676002)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: MuPudcLec6qnKyOAvni0L2AtF4s0Bw1/PfwFkcnpWCV1w06FlL4n6TRR1IpVYS74BompuaVJfbjbDWCAflOwHMFt4N/b3mH440wAxxAftxkEmXK56+sr1+fZUQPrVg43K0CBEvqcil7rqDFNFYtO6n4Yg4tw3ZlWpj83AFujMEqzh8h1VhK+u2QPfHLa2BQ4XcPgK+uDoQAuLnNg2va2Wmjv2YPls+WucJoF7dv9RC72DwLEJwhyLsQXR/YpCGUYUDal+utx91K63hZpXgUGm3KzxpAkc4Fpb6YfyiJtee6CSjq/IJOFEo6CuMtucO3LSR1vSg0sbBVUv93jLBi2UkFRupJkXRs4eS/eesp4h2hz/RS5xB2nkd1AMJtQXTlJlr3QiPxqEDI/itk2KLJyrJTOzYX2eZjXTYDMUWZK/9tGTNA0GSdAqELfrXSVjf341dj/AReAYUDGihr4GQcLPDFCtezUiCbKaKFdVngb6YmKwq8aJpgxjiuEiuV4olCL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a812b2b-6c76-4f0a-8262-08d82fe27509
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2414.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 15:01:34.7765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qh/Z8R6pxEZ/dClNGAlq85BbxmM+tK7risVZfYaGcXfBAS5FkK1nyGPRroZE2JSxQl+G+aOziZNwtb3Is5gRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4509
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
Cc: Alex.Sierra@amd.com, Philip.Yang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMC0wNy0yNCB1bSA3OjU2IGEubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IFdl
IGNhbid0IHBpcGVsaW5lIHRoYXQgZHVyaW5nIGV2aWN0aW9uIGJlY2F1c2UgdGhlIG1lbW9yeSBu
ZWVkcwo+IHRvIGJlIGF2YWlsYWJsZSBpbW1lZGlhdGVseS4KPgo+IHYyOiBmaXggaG93IHdlIGNs
ZWFudXAgdGhlIEJPcyByZXNvdXJjZXMKPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KClJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGlu
ZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KCkl0IHdvdWxkIGJlIGdvb2QgdG8gZ2V0IGEgVGVz
dGVkLWJ5IGZyb20gQWxleCBhcyB3ZWxsLgoKVGhhbmtzLArCoCBGZWxpeAoKCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCA4ICsrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiBp
bmRleCAwNzY4YTA1NGE5MTYuLjQ2OWFhOTNlYTMxNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+
IEBAIC02NTIsOCArNjUyLDEyIEBAIHN0YXRpYyBpbnQgdHRtX2JvX2V2aWN0KHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8sCj4gIAlwbGFjZW1lbnQubnVtX2J1c3lfcGxhY2VtZW50ID0gMDsK
PiAgCWJkZXYtPmRyaXZlci0+ZXZpY3RfZmxhZ3MoYm8sICZwbGFjZW1lbnQpOwo+ICAKPiAtCWlm
ICghcGxhY2VtZW50Lm51bV9wbGFjZW1lbnQgJiYgIXBsYWNlbWVudC5udW1fYnVzeV9wbGFjZW1l
bnQpCj4gLQkJcmV0dXJuIHR0bV9ib19waXBlbGluZV9ndXR0aW5nKGJvKTsKPiArCWlmICghcGxh
Y2VtZW50Lm51bV9wbGFjZW1lbnQgJiYgIXBsYWNlbWVudC5udW1fYnVzeV9wbGFjZW1lbnQpIHsK
PiArCQl0dG1fYm9fd2FpdChibywgZmFsc2UsIGZhbHNlKTsKPiArCj4gKwkJdHRtX2JvX2NsZWFu
dXBfbWVtdHlwZV91c2UoYm8pOwo+ICsJCXJldHVybiAwOwo+ICsJfQo+ICAKPiAgCWV2aWN0X21l
bSA9IGJvLT5tZW07Cj4gIAlldmljdF9tZW0ubW1fbm9kZSA9IE5VTEw7Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
