Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E73309E02
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 18:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A926E0DF;
	Sun, 31 Jan 2021 17:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2047.outbound.protection.outlook.com [40.107.244.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989BA6E0DF
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 17:26:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+GEO2qBbLIkfN9paQHw/yJl8k7//UJa00StBF4+JfeMXgm3svu7Bi3zXD70TsddqdXJ1e7l5DNFcfo3bJfm4R5hBOCRwU5gVaW1z7/UHO7PdLFv9htzG2/hzJbxsZxq/ExDjeyIaqMc1kuAlQpLeGixcDYJPY9NMG9BxkMRsfqNkUKM/Gn37bUHoUx1SZ/XGSt4YNSgr8JaZbYMsafuxSAj2rUhj8MG5/yRpbGaHyLIC2VyQE6xGN1STqx9agrU12iH4ut8qOSdW9rDMnOQcUmkOxZI8toY08EsRoqLjYrJVIqPCcIFcxt9HZ0Vh0Gr4Qdyjps1b+1vEtpPEZ645Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENUc2BdwW1rpS7QtjDWGs8xU7yDydB8pyrZf5xECnOk=;
 b=lDJvlvPMBYioD+1QujvzrI8KxxsSQNwvS2dg48DCTh0v0DclA6hLujyszkJtUxI2wZ+zyCD7pWZfOPkESf+DV+5kG3erECJEVrDaAg3gNV7faam+QOu3DbfENSehZmtDw6cixNp/SHS4sJoba2BAk/0MlSYWQRKW4XXcObwTuh4pjKMaqP1Fr0vvWlOs4XeJXhINaxUhYZ5Du3JPNcXE2dbXyQjZOXwO7EDar75edMHTA5ATuBMgJDUqOfMtVmdU3tj/AhAslFXmQMc/SsbI6ggdbUzhDy4bX1Hb9qCwYu0wmdsdOXACIll2ugCixGjkxhWkTUtfUVtJkbrbe8SJBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENUc2BdwW1rpS7QtjDWGs8xU7yDydB8pyrZf5xECnOk=;
 b=pUepJs58r0g3pitTA967AiP/6jeEzjpP07hypk4ilIzHQJZOBu5Tyu+zRxIog5x3KlsBrS4ca+dx4dBA08NkRASdxqWVJypqPJQ/YXF44ZhAFII39Sr8Q5NOKo0LKcq3YuIbH1nNEuy6b375kkXuJn9xMOVICVrSKYmqyWRCQtM=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Sun, 31 Jan
 2021 17:26:25 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3805.024; Sun, 31 Jan 2021
 17:26:25 +0000
Subject: Re: [PATCH 08/29] dma-buf: Avoid comma separated statements
To: Joe Perches <joe@perches.com>, Jiri Kosina <trivial@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>
References: <cover.1598331148.git.joe@perches.com>
 <990bf6f33ccaf73ad56eb4bea8bd2c0db5e90a31.1598331148.git.joe@perches.com>
 <a87b95d11c22d997ebc423bba71cabef15ca0bac.camel@perches.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4d5891b7-ea87-974e-d260-f78c3af326bc@amd.com>
Date: Wed, 3 Feb 2021 14:26:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a87b95d11c22d997ebc423bba71cabef15ca0bac.camel@perches.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P191CA0028.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.17 via Frontend Transport; Sun, 31 Jan 2021 17:26:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 359c3818-7be5-42cc-5776-08d8c60d5589
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4208489FE1D0F94C09AF44EE83B79@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:95;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kUD2gJD5O4YJyp3jb1xuj3xvP2LAGpHJ2bs8KPZgDfEHlDgVGXgs4qFbANS8+3LCzvUGlNrMkUo794jBcQd7kQ29KunSKE29f50M2D500kqROW78dpsHWLBWRSPCRvCkIXd2ID2mgwyptXxWPveo+Lm4su9rbw+iL7DJYK3qVwpKQwgCq5+DG+Y/BUl7kXFIV6vHFsrYBHqd1Y4lk+lvalScJSzzIKyOvty2nRRyh9n05bsJMfrdoGb6IxMCjzjWtXhVDIVQVIFAnRkKzmrT59iX8VQWGV5cPvm5GpUP9RvewzeajK1sRwBowuAipusRrO38+OTVWF+Cpr9Q0yIWGxJHQnz/fwLDUy/C8XZ6HjfdSWlg5yx5pLtzUmSJoLdNtPoN9YXyi8rqmKiDmgJcMrOHrNb53SfFHRFqetL0cWedAAJvry/8f/gfWXfqkmiWpEKCApyJuRvt8/H2/LNWDnhgcpAc5UYE0YZ6Oyhx4hllhqhVzs7DF6fahGNVQXzyKon7xxW5hoskn8Vo+dq6K++msnS38Eass7ydtRTeO0RBCxzPcHa89YItXYjJpvMc/fggRDg2VqYHXfDEiJs2k5Hj4YEA5jy9Ro3s2Y9V/8Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(316002)(36756003)(6666004)(6486002)(31686004)(110136005)(52116002)(83380400001)(31696002)(8936002)(2616005)(4326008)(478600001)(5660300002)(2906002)(86362001)(4744005)(66556008)(16526019)(8676002)(66476007)(66946007)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?amQ4aGVNS2hJcWc5dWErQmtkQ1JzOHBMaHl3SWdCMDIxQytURnkrNkdwT2h3?=
 =?utf-8?B?djZXUnNyY1p0aGhqK3hMK0poRlhKbjBHbFhvL3NLdlFENVlrUmwrSVlYMVFR?=
 =?utf-8?B?TFhPMUdWdkJKRDNFNU9HUlM0YTZhckpNaGpWektRbXNXdUw2UXJNR0RHMk0x?=
 =?utf-8?B?YmpBTFYwMnV4Tjh6WldZamwwNG5vbllibU9DcTQzMHV6NzBCaTNQT09IcWNi?=
 =?utf-8?B?QTBXVnFmOEZiK0luUGViK3FzV2JMV2FmdGNPazdMTWlqK3lXYzdQbVNkNWxa?=
 =?utf-8?B?UU84ZDAza2MzbENkOXBCVU10NkJENklRVmloTkpzSHFQNFdoUDdxTU9oM3Z0?=
 =?utf-8?B?Z1daVzFKMFdmZzk4ZCtCc2NKRTRmYnVtckp6U3F1Y1dsUWxrUW1Ib1h6a0VD?=
 =?utf-8?B?WUY5d0I1WTRhQllBUi9XSkxMY3NINHZRQkJrOGducFZrcEFvUWgyZXRzbzFt?=
 =?utf-8?B?blUrbW1oRWFudElSa3pkcTh0NDdGVnc1UTExc0FVSnZockttY2xCNlNkY2gy?=
 =?utf-8?B?MVk5VTJkWnFsS2lEMWJZMFNLZk1FalA0WWVyR2htSkJPUEkrYnFIeW9nMlRo?=
 =?utf-8?B?V2oxd0dWMzlnTG4wWTdOOXUra1E3MjRybUg5c3BSUXZxNVJEWjlrTXVuSmJT?=
 =?utf-8?B?WUYrcWw2T0QyWlJZaENaRWpIam9DbTVLVmJMRjAvM0crWXZJeXZlN25DTlM4?=
 =?utf-8?B?dmFFNmd5ZmlWWlpnTzJCK3ZyalZQVVgyZFBCVmx4M05aMnhuREdSa2M4d1dE?=
 =?utf-8?B?V1JGZHpCNzNHZ0txTmd1cHVVbEpUMi9yOTU2elZ1YWNvaUZOOEM0c1A2WlVN?=
 =?utf-8?B?VmVzd2NuOHA2REVYTFpHdkxRaFJxQ0JpWHprRXdlVHJaUlRndkl0VXd4TFVz?=
 =?utf-8?B?cStZVUh6RGhYRC9PMW1OUDJ2enA3ZUpPOXpmeHpLMzBzOFZSaVl4N2lzT0Fa?=
 =?utf-8?B?MmUrUWVaUWJDeXlHT0xBQXFSYmdtNGdPeTcrbUxLWVZPWk5OU0pRRHgrdGZU?=
 =?utf-8?B?cXVuK2xoTGxqb1YrbkhLaXN0UitjdVE1VU1FVkpLWTlZbVRVUzNBeEJyYy9R?=
 =?utf-8?B?MCtPVkpiQk1qMGNINkl0SVVBQnQwaW5lcVNuYnBIYlI0ZEFIbzkydDRDSDhi?=
 =?utf-8?B?K05hWjIvTjdMYmVaUDQ5ajJ4emR5a1ZNQnJ2VGdrdGJGaVVISVBlOFg4VWdU?=
 =?utf-8?B?QkJGMHVEVmFlOWJ6VTA3b2dhc255bWNyaUxLdDZrZlRWdVNjVUtaZUtzcHBk?=
 =?utf-8?B?WEhRam5OcVUrbTYxd0EyQlVRVENpWjJNZGtZUEJWOTVZMm5oWGU5L1NuTTU1?=
 =?utf-8?B?VmlSTGNiay9LWjZieC8yajNUVENONGQ4Q202Q0pCYm0wOTlPL1dkRjdlUTg5?=
 =?utf-8?B?NzRiVFRCa1BIbVBQQ1ZYajY4cS9tK1BEZk5MR3p4UlZsVmpJQkJsbXRCVUlM?=
 =?utf-8?B?N1dhMGNVNnBNRDJuVk9xaEJ0NnR5aHpUN1BIK0ZDT29ZV1pZY2pBeVVsSXI0?=
 =?utf-8?Q?T3EqRBA/Yvddyi5VQf6yu+pm+Sp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359c3818-7be5-42cc-5776-08d8c60d5589
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2021 17:26:24.7992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gu0vD4JPx0OHCILe54wEUXuGdYskcdPnJnXcM5yRwJEs8jbAr2gGupULsROa8/J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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

QW0gMzAuMDEuMjEgdW0gMTk6NDcgc2NocmllYiBKb2UgUGVyY2hlczoKPiBPbiBNb24sIDIwMjAt
MDgtMjQgYXQgMjE6NTYgLTA3MDAsIEpvZSBQZXJjaGVzIHdyb3RlOgo+PiBVc2Ugc2VtaWNvbG9u
cyBhbmQgYnJhY2VzLgo+IFBpbmc/Cj4gICAKPj4gU2lnbmVkLW9mZi1ieTogSm9lIFBlcmNoZXMg
PGpvZUBwZXJjaGVzLmNvbT4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+CgpEbyB5b3UgaGF2ZSBjb21taXQgcmlnaHRzIHRvIGRybS1taXNj
LW5leHQ/Cgo+PiAtLS0KPj4gIMKgZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS5jIHwgNyAr
KysrKy0tCj4+ICDCoDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMgYi9k
cml2ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMKPj4gaW5kZXggZTU5MzA2NDM0MWM4Li5jOGEx
MmQ3YWQ3MWEgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9zdC1kbWEtZmVuY2UuYwo+
PiArKysgYi9kcml2ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMKPj4gQEAgLTQ3MSw4ICs0NzEs
MTEgQEAgc3RhdGljIGludCB0aHJlYWRfc2lnbmFsX2NhbGxiYWNrKHZvaWQgKmFyZykKPj4gIMKg
CQkJZG1hX2ZlbmNlX3NpZ25hbChmMSk7Cj4+ICAgCj4+Cj4+ICDCoAkJc21wX3N0b3JlX21iKGNi
LnNlZW4sIGZhbHNlKTsKPj4gLQkJaWYgKCFmMiB8fCBkbWFfZmVuY2VfYWRkX2NhbGxiYWNrKGYy
LCAmY2IuY2IsIHNpbXBsZV9jYWxsYmFjaykpCj4+IC0JCQltaXNzKyssIGNiLnNlZW4gPSB0cnVl
Owo+PiArCQlpZiAoIWYyIHx8Cj4+ICsJCSAgICBkbWFfZmVuY2VfYWRkX2NhbGxiYWNrKGYyLCAm
Y2IuY2IsIHNpbXBsZV9jYWxsYmFjaykpIHsKPj4gKwkJCW1pc3MrKzsKPj4gKwkJCWNiLnNlZW4g
PSB0cnVlOwo+PiArCQl9Cj4+ICAgCj4+Cj4+ICDCoAkJaWYgKCF0LT5iZWZvcmUpCj4+ICDCoAkJ
CWRtYV9mZW5jZV9zaWduYWwoZjEpOwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
