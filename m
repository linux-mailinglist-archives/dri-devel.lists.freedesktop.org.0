Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 753A11E7264
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 04:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EE016E855;
	Fri, 29 May 2020 02:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C31D6E854;
 Fri, 29 May 2020 02:06:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCOwS60GmzbFQqccOYw7SgwAjr/rvWwMu3tBNewgUv0PfBZkeMPqbMoNn60RVMOP6XtPmk0pSN3YCqnrHqvOcpWOHMFbg7/PTyKNByRMfTCokpp49cbnY5YHq8ieLsCtO00/shV2gIOYcZOEZSlbXJAeRBI689KV6OXVIu05i27F/VWjVzKwFvO7HSb2P19YOGw/fBSYDynbO79h9FFcSfn16X3/RWWFUFTOUX6mxHdAgsHPH4vE4x/u3N+A0qPJ6eK3TSpw59HOiWFRampw+eX5FZ86aCDsA87d2bkm1a/Vpu9KKg8cndvysYrTAcTk/1cw4eAjv+4PQ23GyNtFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f15cFJguZyj/vi3mBdvW33G30Pql4r56hquaySHucJo=;
 b=J7yKKHTbbJ5Jo1eXLYpq4dL0Dp3zXI0RdS3w8prJCOhMgn591WJoQyjIeRNWSqppR0z3mEPyCHAuVtgtKKI3gkWjLGwMhhsq3rZ68oCRnXw7uBg3z5k+hocqT5sD6TMyA+qdxkPR0Zx5/cxiU73+dh4w66pQhRMtVOIB2uRLpyioJOaj6Oc3AkFWeC/HSjIACGGfnFexLXJP8JX7t3/VcGY00rkdhnhvygQw9Bn0vKikDT8S8fP/UVFp/hfbvJk5EU1exIQLA0NprvMRwnXu3jRmvW7lm8ddLYhgNaSieXBL2Cqpd2xUzp8dLImFi1OF29AhPQfNxlJ7wInEOmVE6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f15cFJguZyj/vi3mBdvW33G30Pql4r56hquaySHucJo=;
 b=iGv47NeWDWkNLYBRWiZH8xWrte1HLjpKyq0w9xlypj5B4jt4Kj/bwxdDjgpg3PLdA+7lZCxt15dOEYUx+R2Y0i/3LOykqyyhajm/PFNAoKqGgYWDyiChH5tB+VCBWqJDyGoN7VNMeA0fxPVKAYMllj8hrVu3vO8AaX/8bWDlODE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SN1PR12MB2382.namprd12.prod.outlook.com (2603:10b6:802:2e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24; Fri, 29 May
 2020 02:06:27 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::18d:97b:661f:9314%7]) with mapi id 15.20.3021.030; Fri, 29 May 2020
 02:06:27 +0000
Subject: Re: [PATCH][next] drm/amdkfd: fix a dereference of pdd before it is
 null checked
To: Colin King <colin.king@canonical.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Mukul Joshi <mukul.joshi@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200528222453.536137-1-colin.king@canonical.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <dc37cf9d-ddaf-94c7-8fc1-460c8da59d7b@amd.com>
Date: Thu, 28 May 2020 22:06:14 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200528222453.536137-1-colin.king@canonical.com>
Content-Language: en-US
X-ClientProxiedBy: BN6PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:404:23::26) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.252.0.178] (165.204.84.11) by
 BN6PR03CA0016.namprd03.prod.outlook.com (2603:10b6:404:23::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3045.19 via Frontend Transport; Fri, 29 May 2020 02:06:19 +0000
X-Originating-IP: [165.204.84.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 34c71310-dd95-4301-03da-08d80374e4ff
X-MS-TrafficTypeDiagnostic: SN1PR12MB2382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23825E9A06128F3B4F87579E928F0@SN1PR12MB2382.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gwUTGxNA4W6LYh4sHypTUjqcQIiVsBd52NEvm8h/yUegNTIxnpwp/Z+Kx2kBuWG+mW3QurXS5tYdsii1npN7jLDkVCMV14vrqF1rHucMbIQ+4XU98DioUlnvHxTU4yp5Q5NnG6DPaU3I0vfvDgzMAj8EKxAa0P7128BB0wry4t4XMV1yl7n48JT5N1KG2qHK0mgJBgEvbohgvANaiQHIYzuFQWnviAjCK8xAvRRXpDNfSPyeirc0ScicTqEEHWophnHKtuYDPJT+iWk1b4IGRvRmKxEdwlIEmWp6JA+t5vshbAb+yoL8fUK1TeNgVmS+fwFRJXCzZsklL5Qevc+CGdlf5VYT1fYS17yPqe8IaBVzeDxFHGWJM1MHL2MYO71f
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(44832011)(110136005)(8676002)(66556008)(66476007)(8936002)(66946007)(6666004)(16576012)(86362001)(31696002)(956004)(316002)(2616005)(2906002)(36756003)(4326008)(5660300002)(6486002)(52116002)(186003)(16526019)(53546011)(478600001)(83380400001)(31686004)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Thy+b6u0b15/E0GayQZ/CpXwlswPJB56yZsu2ncfgnq8PaWwMxEFr74kCq2clrFOuj6DMO+35l55P5I4LjXqm937Ry20kIkE7Chpo4ugkwYBD48pLcpUEMkTswOwG10uakkla7k5Gke2RLPRNjYL6s+A06nXiV5ip7DifS3Vbk1WthWE9hhYTPtrlDrSyF3C9fEFlhsyC3IrJcgykCfrR7xR3QKg2yY+pAPNBAzQ+XOHyIkgbMrvX9l30N5U/o4ERvBwjkpQAStVriIaeno9dZPOE7kf0XWesdOF5OWsRQ0QdcMeDRM2ftXVyWL+pW79STQ3JqZ+Up7XTq8Zx1IHfs+bj0DMUyi6FEh2BZUMXBwTwzV+IFhKl5A5E3Okq1PhYM5ZtD4eQwXxydWOmAM5PqXe9hyHhD8Z+sS8ozpizdko2A5sTgsCFazG7ewBugUBMLAizGfABdzV0oc+sQkcIauyFA31Hr7e/RQfKg3/Nj9CYrdly8xLUpipa2ppYQ5/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c71310-dd95-4301-03da-08d80374e4ff
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 02:06:26.8801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZJLwpF/belaR7HMp3FQImEPNZbw3eh4p2VaO5Shtq0e3w9WtzXmmZAke0+PduBnvmhU+zLwrjhlRNbPnck75w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2382
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0yOCAxODoyNCwgQ29saW4gS2luZyB3cm90ZToKPiBGcm9tOiBDb2xpbiBJYW4g
S2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgo+Cj4gQ3VycmVudGx5IHBvaW50ZXIgcGRk
IGlzIGJlaW5nIGRlcmVmZXJlbmNlZCB3aGVuIGFzc2lnbmluZyBwb2ludGVyCj4gZHBtIGFuZCB0
aGVuIHBkZCBpcyBiZWluZyBudWxsIGNoZWNrZWQuICBGaXggdGhpcyBieSBjaGVja2luZyBpZgo+
IHBkZCBpcyBudWxsIGJlZm9yZSB0aGUgZGVyZWZlcmVuY2Ugb2YgcGRkIG9jY3Vycy4KPgo+IEFk
ZHJlc3Nlcy1Db3Zlcml0eTogKCJEZXJlZmVyZW5jZSBiZWZvcmUgbnVsbCBjaGVjayIpCj4gRml4
ZXM6IDUyMmI4OWM2MzM3MCAoImRybS9hbWRrZmQ6IFRyYWNrIFNETUEgdXRpbGl6YXRpb24gcGVy
IHByb2Nlc3MiKQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNh
bm9uaWNhbC5jb20+CgpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5n
QGFtZC5jb20+CgpJIGFwcGxpZWQgdGhlIHBhdGNoIHRvIG91ciBpbnRlcm5hbCBhbWQtc3RhZ2lu
Zy1kcm0tbmV4dC4KClJlZ2FyZHMsCiDCoCBGZWxpeAoKCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jIHwgNSArKystLQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRrZmQva2ZkX3Byb2Nlc3MuYwo+IGluZGV4IDI1NjM2Nzg5ZjNkMy4uYmRjNTg3NDFiMzJlIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jCj4gQEAgLTEwMywx
MCArMTAzLDExIEBAIHN0YXRpYyB2b2lkIGtmZF9zZG1hX2FjdGl2aXR5X3dvcmtlcihzdHJ1Y3Qg
d29ya19zdHJ1Y3QgKndvcmspCj4gICAJCXJldHVybjsKPiAgIAo+ICAgCXBkZCA9IHdvcmthcmVh
LT5wZGQ7Cj4gKwlpZiAoIXBkZCkKPiArCQlyZXR1cm47Cj4gICAJZHFtID0gcGRkLT5kZXYtPmRx
bTsKPiAgIAlxcGQgPSAmcGRkLT5xcGQ7Cj4gLQo+IC0JaWYgKCFwZGQgfHwgIWRxbSB8fCAhcXBk
KQo+ICsJaWYgKCFkcW0gfHwgIXFwZCkKPiAgIAkJcmV0dXJuOwo+ICAgCj4gICAJbW0gPSBnZXRf
dGFza19tbShwZGQtPnByb2Nlc3MtPmxlYWRfdGhyZWFkKTsKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
