Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD681F83D2
	for <lists+dri-devel@lfdr.de>; Sat, 13 Jun 2020 17:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B516E433;
	Sat, 13 Jun 2020 15:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680048.outbound.protection.outlook.com [40.107.68.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D79B6E433
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 15:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6Tm5GcNw2xyOcKWhTpwQHdTkxXv08I1Q6kKgKFP8X4GmivrzsToTa3FPDRPnAkCVG0efY+6uV6jdp/6WYAcNRBxgscIG63tYfbd3jl1vFpvfH9EERtnRjHq4324iFx0mguWaduZbjwhZntLi+A8ebvAa0Rh7LFapLpwA5kdnyWk94tbsZnUPcj0v/bvzm3rmLPFxj1eX3jqDhVrcPosvHndzDyOUTohRyAew/RBXo7yCVaxsSnPD8KhrJhWoNm0toLM9pYzjt4l2RnuFm5/5q2t4AnXB7VEnLD3v3r/GVMBoYo5J/4JydTsPA9sYL5NvAJzv8B088n3OAMQn2uYFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfhsecbtgRwDfMbrbkhsyF5egVVlNKY3adIDorowvUU=;
 b=NzgVDC8xxRtM1PIEFiRUu9f+QPPkxmlnDHqQnFY4jdOKdqWXO/AKLpl8KoEuROnKUGUWAnV1TJLdWXYOgC6PvjhxchfY6DLW72xuUmJFzoY0aUxW+1Ee0YOVfJR7JlyC4JdCZZ4NLbXd6xWxL7i51jAdLWnJkr1wu1qMvrsFiLKlv6epZuPtqwMkQpeirGUvFY/nLzsKof6oqMzpJYcSJt6EvrGeU0jsBplGZ8SXlZrowAqL+/Ce3IXnOYVVl/ul+rc43kt5pRCZ1CVUjHxE9U8X+rke8jOAPjSDoKiSihFcgo9hEklr7/R8QUvS3zYZPlJxGttMsOG2ExLLRYnzeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfhsecbtgRwDfMbrbkhsyF5egVVlNKY3adIDorowvUU=;
 b=v8JqO46kXCIsSfs2KP59Ubk6rD0XMRApyoPo0a5lQN2pYR3rZURajuAeBaXYYwOy4Uy8X6r6zuZ2fxGutPpRA1cVLUq2YmSLkXAm6eJ6ln88kBA1hF3VUkjt4SOhUJShaCGUUZuJjke0Z3MXj7/yM1ZzxmplmBlYQrgkEsEVZjI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15)
 by DM5PR12MB1722.namprd12.prod.outlook.com (2603:10b6:3:107::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Sat, 13 Jun
 2020 15:09:06 +0000
Received: from DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766]) by DM6PR12MB4401.namprd12.prod.outlook.com
 ([fe80::7949:b580:a2d5:f766%3]) with mapi id 15.20.3088.026; Sat, 13 Jun 2020
 15:09:06 +0000
Subject: Re: [PATCH] drm/ttm: Fix dma_fence refcnt leak in
 ttm_bo_vm_fault_reserved
To: Xiyu Yang <xiyuyang19@fudan.edu.cn>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <1592051318-93958-1-git-send-email-xiyuyang19@fudan.edu.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5f1e83d6-9d3b-f7dc-d3e7-4f8ca46e9855@amd.com>
Date: Sat, 13 Jun 2020 17:08:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <1592051318-93958-1-git-send-email-xiyuyang19@fudan.edu.cn>
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0079.eurprd05.prod.outlook.com
 (2603:10a6:208:136::19) To DM6PR12MB4401.namprd12.prod.outlook.com
 (2603:10b6:5:2a9::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR05CA0079.eurprd05.prod.outlook.com (2603:10a6:208:136::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend
 Transport; Sat, 13 Jun 2020 15:09:03 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8528fb35-8da2-40d4-ef4b-08d80fabb6fa
X-MS-TrafficTypeDiagnostic: DM5PR12MB1722:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB172292AE407BB220A29CDC76839E0@DM5PR12MB1722.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 0433DB2766
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aqKxlpNkos9fZauUbooL0+SIF8tGuA4FufO5jxiS/AQb/gwqPmIGNKgUHr3L3cA6TUGcG6NQY3TkByQdKclpYObpgdIe/umdC4cx2IlCdcvF5+aXSwoQnt5DhmF80rG8MefSAX9JVLXQfL2oidlUpH5M5M4JlIIMXmkv45MQFaXan+yQrdzS+uyJ0elS5EzUvupnrELjCMe3k5+EGMbWLYITLz6+KahZ+YLpBrXltuUTO2sIacYPN6lga+UC0C+XjKl2aU3PjjIgeIfkKO6cUKmQjssNOK+1BQEiX33te0F4TntHOpdRXcKwIouLgy2LcV0/ycQFjxXCIsbrTdzggdBevHqQtn3A/WFIt4vTnJsfrdToUCg/Fyh/LBB9ONmm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4401.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(66946007)(4326008)(66476007)(52116002)(186003)(6486002)(478600001)(31686004)(7416002)(8676002)(66556008)(16526019)(110136005)(6666004)(86362001)(5660300002)(316002)(2906002)(8936002)(31696002)(2616005)(36756003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +inmjCYr7PhxtkFbVfHqqLL3C3FlZA+djhY0SNIhjpij3ht30taEixFtDuHXYhjY43VANVxqTez5yBHyzrpXgoi4BBjytCvBRNUSJVlFQp86ipPeButdQ8zsRwmBmtpovTZ4djlKejCxSEGJe3eMSs5C+afvC0zc1sdEiZDGbirVAimlNIcviD5L5eJL2/yhdbzMh+oDcKoSVqCUv7Fu0QpymBjYSwns8jgogCzwPmNiZOI9XRpdmr3MDCxKWO1LvEsUW1hogSilMv7dtTLuqM68RTydEEOVwj2HQJRyqxcrKAOXcQK7VxrJK2t5b6Y4XdRyzVq3WSMbeiZlIaZvuWFebzjhK2ZZJQ1m5QzWVZLUf2ECbkaZR2Z9ACSqXJmLDMR/WfHBWpVSZpElmo6GuPGaP8smCXquxzBHcA1HjvjEGY0tasWG6O/E+vB0DolCZagyoG4cpydES00Z51Wx0Cvv58g8EQuf0A/vQQjDyg/F9kWDo/Va41sS6wApjAayyE/dlcqFXR2tGyMklTMbM5t6BJJxkflBH89m/mFF1+vi/Q7fOn1DejB/yBwrXYXW
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8528fb35-8da2-40d4-ef4b-08d80fabb6fa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2020 15:09:06.0491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6diPGeQjFVc6UBsTuchrUEi0LgG5NnXDTdUnmmOTP+N4MUA0FQeINWFXOKphR0ar
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1722
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn, kjlu@umn.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTMuMDYuMjAgdW0gMTQ6Mjggc2NocmllYiBYaXl1IFlhbmc6Cj4gdHRtX2JvX3ZtX2ZhdWx0
X3Jlc2VydmVkKCkgaW52b2tlcyBkbWFfZmVuY2VfZ2V0KCksIHdoaWNoIHJldHVybnMgYQo+IHJl
ZmVyZW5jZSBvZiB0aGUgc3BlY2lmaWVkIGRtYV9mZW5jZSBvYmplY3QgdG8gIm1vdmluZyIgd2l0
aCBpbmNyZWFzZWQKPiByZWZjbnQuCj4KPiBXaGVuIHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZCgp
IHJldHVybnMsIGxvY2FsIHZhcmlhYmxlICJtb3ZpbmciIGJlY29tZXMKPiBpbnZhbGlkLCBzbyB0
aGUgcmVmY291bnQgc2hvdWxkIGJlIGRlY3JlYXNlZCB0byBrZWVwIHJlZmNvdW50IGJhbGFuY2Vk
Lgo+Cj4gVGhlIHJlZmVyZW5jZSBjb3VudGluZyBpc3N1ZSBoYXBwZW5zIGluIHNldmVyYWwgZXhj
ZXB0aW9uIGhhbmRsaW5nIHBhdGhzCj4gb2YgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKCkuIFdo
ZW4gdGhvc2UgZXJyb3Igc2NlbmFyaW9zIG9jY3VyIHN1Y2ggYXMKPiAiZXJyIiBlcXVhbHMgdG8g
LUVCVVNZLCB0aGUgZnVuY3Rpb24gZm9yZ2V0cyB0byBkZWNyZWFzZSB0aGUgcmVmY250Cj4gaW5j
cmVhc2VkIGJ5IGRtYV9mZW5jZV9nZXQoKSwgY2F1c2luZyBhIHJlZmNudCBsZWFrLgo+Cj4gRml4
IHRoaXMgaXNzdWUgYnkgY2FsbGluZyBkbWFfZmVuY2VfcHV0KCkgd2hlbiBub193YWl0X2dwdSBm
bGFnIGlzCj4gZXF1YWxzIHRvIHRydWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaXl1IFlhbmcgPHhp
eXV5YW5nMTlAZnVkYW4uZWR1LmNuPgo+IFNpZ25lZC1vZmYtYnk6IFhpbiBUYW4gPHRhbnhpbi5j
dGZAZ21haWwuY29tPgoKR29vZCBjYXRjaCwgUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4uCgpHb2luZyB0byBwaWNrIHRoYXQgdXAgZm9yIGRy
bS1taXNjLWZpeGVzLgoKQ2hyaXN0aWFuLgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvX3ZtLmMgfCAyICsrCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPiBpbmRleCBhNDNhYTcyNzVmMTIuLmZhMDNmYWIwMjA3
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+IEBAIC0zMDAsOCArMzAwLDEwIEBAIHZt
X2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAo+
ICAgCQkJYnJlYWs7Cj4gICAJCWNhc2UgLUVCVVNZOgo+ICAgCQljYXNlIC1FUkVTVEFSVFNZUzoK
PiArCQkJZG1hX2ZlbmNlX3B1dChtb3ZpbmcpOwo+ICAgCQkJcmV0dXJuIFZNX0ZBVUxUX05PUEFH
RTsKPiAgIAkJZGVmYXVsdDoKPiArCQkJZG1hX2ZlbmNlX3B1dChtb3ZpbmcpOwo+ICAgCQkJcmV0
dXJuIFZNX0ZBVUxUX1NJR0JVUzsKPiAgIAkJfQo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
