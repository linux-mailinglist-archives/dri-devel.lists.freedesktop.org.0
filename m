Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C096B360394
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 09:41:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923BE6E9F6;
	Thu, 15 Apr 2021 07:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E106E9F1;
 Thu, 15 Apr 2021 07:41:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZdYukuxjScIkD3MR7sOiBGbPZVQnJAsGIKae7yfgJ3cpYCiQSR3tX5JgbX+CHWw9uNo1muiTOqaJiinXa4swSG90//n+dNTJpfCcxaQj3JkR1y0bqXUWypOYTHOmYancRVsxe+pKm4il5X6ZqOoglhCxAY6IBzVvLKZdpViEmwy/Yku7uFfdJN75Ns1F26cZnPCeMmDsL7htAYx2I1jNzFBBza1nCv3Ze8GCmfxxLm2YhNl+eNqHsAHWKuS6lww0ayw6lvCgHC/vTFS5a7h/Iw/dowTtjIbkJblm/p95DSW5HQdZfuaijE1R85ah6iPdYCmX+k9nKojBkvCX4uEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbHy9gjfvTtcIpzsUWIAH/a/rfmDAb17Qj6ApnAvkc0=;
 b=SgqKZarbg4339R5Ji50n8xdzNhfnRvN9W/8Y6rrvwwm0s2StRkY9PKblEp4HcoNN+2AHsBZb05fLNfuI4EBy55Nnawslt8OqWaZnXsJrkKUM7SgOz3AF9YfHD9kHvxbqXJHkuEWvxrjMQlhl+PhF3m9nXrGiRfsHIUIbkoNVb3fDmykoE7HDoN06EeuO8xjzAtnl0/tI+wet2COiyvfzAIp61pLyWEP+lIqtOulzd2eRdQv0PHDlZoa+5QYVbAFRWl5OmydNqQfefH+S1vxZH9hsVIHtuZGhNMTceNLPeTG/vEOvu6F7NG3XSDL8uKns6muJSE7WOdtg8gupNZ/6TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbHy9gjfvTtcIpzsUWIAH/a/rfmDAb17Qj6ApnAvkc0=;
 b=tbWnTQDUIo2SAek00UeJEcUL5JX7kNsDmXc0iAQ+n00G1uBi2jA3JVBPzHGQHEwxcyIptnGJt/jc0LMvXayA9wTiJlHabAK2N0YAllDSztTBr7sVQZZ+YaDnzKFU31AWYoNAp4kI5bMub2LosQ3eNJUwJL0s09YO0tr+9F19AbM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Thu, 15 Apr
 2021 07:41:49 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.022; Thu, 15 Apr 2021
 07:41:49 +0000
Subject: Re: [PATCH 9/9] drm/amdgpu: Lock the attached dmabuf in unpopulate
To: Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210414064621.29273-1-Felix.Kuehling@amd.com>
 <20210414064621.29273-10-Felix.Kuehling@amd.com>
 <517032d9-1a37-ed7b-1443-9f5148e2f457@amd.com>
 <bf7a332a-b696-dc49-efa8-2fec477e3bbd@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <01c6a6ab-1301-dac5-70d4-74d5dbbcb67a@amd.com>
Date: Thu, 15 Apr 2021 09:41:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <bf7a332a-b696-dc49-efa8-2fec477e3bbd@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:4ce1:cb0:6e15:a3ac]
X-ClientProxiedBy: AM3PR05CA0129.eurprd05.prod.outlook.com
 (2603:10a6:207:2::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:4ce1:cb0:6e15:a3ac]
 (2a02:908:1252:fb60:4ce1:cb0:6e15:a3ac) by
 AM3PR05CA0129.eurprd05.prod.outlook.com (2603:10a6:207:2::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 07:41:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 419b8b0e-3cfd-4a0b-4fcb-08d8ffe1ed74
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4142E93A3754300F4852E1CA834D9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3DoedX41lTMSHSl9TWXioJv5oKN+/lCvIgEK3f2RS37oVV0kVY++UmzmDGw60Zu+aFvXO/uBTvny7iAcQKjQEsfT5TzLGN0O6LvqrQmQPcjKaget5IKOtvpBZuoAP4LEThzVlVX2QUAyVQzrmpFhfQHOfkAOZpc9ifM4fgU+DGBRizzJVo39N51jNMf7zPqAKya7yHQSDS0nLufHj3aClZXiF0gnohmOrMWwL/Qe5MqueSB1gQFANwrN+MmAnntxJDniafExGsBf6uw992TWxrKGb34QuPzoHM5iAJG5F+X6dwwWOS2nlurOtKUYzxM7vS2zFD5vHnEVpH8fjXUNtLxIbmC4tGBQUjWDvOBnAVDFYP6wYK8SvbWY7azs3d7ah3sIjyaSAxS/oIK76WnEyNFOCLuBIQ+7c51oBMTrUtquEjiB29XwLi7CAWGVGNt5U8Yu4jVRprzDZzuX259rVuKJoEGqwkadLr5215gDclpFohoIpX6v7xCeiqbwP8rmoikH9Q9uXZO3zxp7LE+hq/KU/umnDKIlk4UQfkGPXwDtSLUJuhnG99ggjgo9eK3x8EIoYnIvAxbw+5kh16JBg1md/5e/KLPnzcbtNkiJ6B4JPxxUoj98duMUwMjyENDMjyj2vHcFBPKe8p0IOcIAZxgehXStYJeEnDvqHDhY0oMUh96MhuhwZVtsYF9vPoo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(66574015)(6666004)(66946007)(66556008)(66476007)(2906002)(38100700002)(5660300002)(6486002)(316002)(2616005)(478600001)(8676002)(83380400001)(450100002)(86362001)(36756003)(31686004)(52116002)(31696002)(8936002)(186003)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZnBWR1B0UHNEZnFyNkNycFdHWEFidHZoMGNxWmM1dkV1YWNWT1haRElZSEhz?=
 =?utf-8?B?MXdrdmU2VHowNnNqR1V2b1E3VFA0RElnUXVDd1FLVHU5dFY5d3V2d3ZTOGNk?=
 =?utf-8?B?SFV1cHNUOVlvNkw4WWlCZU0ySTkybmpNWXl6K0JZRlNLNm9oTFg3dy9IQXJQ?=
 =?utf-8?B?cEJ6dlJKU1J5Znltb21SNkJHSzlhdG1RS1g4a1E0NXFJT0RucnFLWks5aERa?=
 =?utf-8?B?TjJWOVdQT2tjRk8reEFDcUthWGhrQmJlTXdlLzY2cHZQbWpLZk42end3TEIz?=
 =?utf-8?B?L1dnOWtXOFA0TXF0UzhuYlVEOUwvTnlyT3JGQUtTOEdURVBpRGMxdjEzZm53?=
 =?utf-8?B?RTRLdUI1TXV0MjZvTG1OWGcrVTVseEVvcVdXdVc5c3RGWlRQNTNmYXVKRC9O?=
 =?utf-8?B?T3k4Q1I3c1R5WlE3QU1RVW9OM2tZRTVZK0RDd3QyRFFoNmFXNU14U1U1UElu?=
 =?utf-8?B?NThnaklNdXFiZ3pHOHhHZVlOTFFZVXJzOXZXMldKbFJKeVhGc2Q4VGhFdHBJ?=
 =?utf-8?B?TmMxMXNSNVQ0REJPVHI1eXJ3cWluWUc5dWltOU1sMnpEcVYzVGdEaWtrZFNJ?=
 =?utf-8?B?Zld3V0gwanlqYWxxL0RubmhCL0l5T0M1RVdiUFljSGxBMVRnVy9EVUpXT3BP?=
 =?utf-8?B?ZExvTW8ydGtZZXp6YmtVTndiRWNOYXlEN3lob0FCa2hTMy9ncEtPWUxrWGRZ?=
 =?utf-8?B?TndGYmkvNnk4YklrelZzM3J5NEYrMHE5NTJuYk0xR1cwNDZGTnF6Q2tMMDlF?=
 =?utf-8?B?R01xVXphWlAvT0REZGVOdXpNQ2tNUnBXTGM1em8zMXpmU2pudytZaUxtclJ1?=
 =?utf-8?B?TXZ6b0ZmSUJSbGUwUWd0N1NPWkdpTi9IR0liMnlseTB5a2Q4QWNBZHlLcXZK?=
 =?utf-8?B?Wm1EaHJ0MjZPL2lNUzhrNk5xQXdWNUZ1bE1oOE5oczArWXJYTTU4blhQZXBR?=
 =?utf-8?B?NVljSEhTWmhJTG1oUUVyaHBSM242cThBWlMxV3RCRzR2Tk4rZkpYZHNrWVJn?=
 =?utf-8?B?MzJ2Z1lYV2k4VW00M2s5NTVqcTFKSnRPQXM3UVAxOHQxaGUxWk0zbjNlNG1H?=
 =?utf-8?B?QXFkMzk2bHY3T3QzVkNTcGVyaEt2WmJPSExyL3BQTGdDN3UxRER3ODl2Snow?=
 =?utf-8?B?RWwrZmdibU5QL0xOakNZSFhuR2pSWDJ2VXlpNVpGMCtsdzZqUlJpNHFpT041?=
 =?utf-8?B?NXc5S2pwRGEyQkZJUVlXalo1c3lpRWt3NGpMYU5jd0xGeld3MS9rSTBVa1oz?=
 =?utf-8?B?UjllbEY5TFRTeG5XT0RQNmk0Z0tjMWo1OGJlS05STEJ1eUZld3dzZ2drTHcv?=
 =?utf-8?B?UDhydXhITUp4MUxiUS84YWN5d2JjYmVFcUtXZzYxN1YxamFwVmtkeVo1TzdM?=
 =?utf-8?B?NUp3K055bTFHaHdtT0RSeFZzRmRMZFB5WWVVUWlydWFtYWdaOFE4eW9Sb0U5?=
 =?utf-8?B?UjQ4MWVRdlhXdGVhQitzaHpPamtpWEUwZ2prdlMxeTFnVjJiQlhYek9CRG1r?=
 =?utf-8?B?WVM0aks5YmhRSzJQZkRuRVBmSDhzU0F2MlZMUkhZSnhiU2RCcDBDQ3E1b1FT?=
 =?utf-8?B?Tkd5bGp0Y1J4Z1NGa0VZR3lmQmtwWmVrckQ3Z0hqNnREdzJjRlc4MXVkbEFY?=
 =?utf-8?B?amJuSXJ1MHEwcVNVMzRtRjdnL3FtQ2J2dXdYZFpHM3U3R0xWMUJ3MlR3cVFK?=
 =?utf-8?B?Q1BhMmNqMEdCWU4yYkpDSEtEeUZpejNSc1JsTkY5SjNBeEpGa21wUS9kOUxn?=
 =?utf-8?B?YWQ0Tkx4b1hSczR1RzhZdlFKbkNUYlp1ZHpnTFVKcW54dEUwb2R0YStFTi9T?=
 =?utf-8?B?eHp5TlJWemVxTHZVb2RYSjBYb2lmaEhyMkh4L0lXRndMM2FxU0RLL3g2OFA0?=
 =?utf-8?Q?UgjlSsNOFSL6Y?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419b8b0e-3cfd-4a0b-4fcb-08d8ffe1ed74
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 07:41:49.1551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFwrDysr4Nm+HMhxlr8q2fbpKpcmhcCcXlnI2OJMIcYhHcHGX14kK03Do9O+n76F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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

CgpBbSAxNC4wNC4yMSB1bSAxNzoxNSBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+IEFtIDIwMjEt
MDQtMTQgdW0gMzozMyBhLm0uIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPj4gQW0gMTQuMDQu
MjEgdW0gMDg6NDYgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPj4+IGFtZGdwdV90dG1fdHRfdW5w
b3B1bGF0ZSBjYW4gYmUgY2FsbGVkIGR1cmluZyBib19kZXN0cm95LiBUaGUKPj4+IGRtYWJ1Zi0+
cmVzdgo+Pj4gbXVzdCBub3QgYmUgaGVsZCBieSB0aGUgY2FsbGVyIG9yIGRtYV9idWZfZGV0YWNo
IHdpbGwgZGVhZGxvY2suIFRoaXMgaXMKPj4+IHByb2JhYmx5IG5vdCB0aGUgcmlnaHQgZml4LiBJ
IGdldCBhIHJlY3Vyc2l2ZSBsb2NrIHdhcm5pbmcgd2l0aCB0aGUKPj4+IHJlc2VydmF0aW9uIGhl
bGQgaW4gdHRtX2JvX3JlbGVhc2UuIFNob3VsZCB1bm1hcF9hdHRhY2htZW50IG1vdmUgdG8KPj4+
IGJhY2tlbmRfdW5iaW5kIGluc3RlYWQ/Cj4+IFllcyBwcm9iYWJseSwgYnV0IEknbSByZWFsbHkg
d29uZGVyaW5nIGlmIHdlIHNob3VsZCBjYWxsIHVucG9wdWxhdGUKPj4gd2l0aG91dCBob2xkaW5n
IHRoZSByZXNlcnZhdGlvbiBsb2NrLgo+IFRoZXJlIGlzIGFuIGVycm9yIGhhbmRsaW5nIGNvZGUg
cGF0aCBpbiB0dG1fdHRfcG9wdWxhdGUgdGhhdCBjYWxscwo+IHVucG9wdWxhdGUuCgpUaGF0IHNo
b3VsZCBiZSBoYXJtbGVzcy4gRm9yIHBvcHVsYXRpbmcgdGhlIHBhZ2UgYXJyYXkgd2UgbmVlZCB0
aGUgc2FtZSAKbG9jayBhcyBmb3IgdW5wb3B1bGF0aW5nIGl0LgoKPiBJIGJlbGlldmUgdGhhdCBo
YXMgdG8gYmUgaG9sZGluZyB0aGUgcmVzZXJ2YXRpb24gbG9jay4KCkNvcnJlY3QsIHllcy4KCj4g
VGhlIG90aGVyIGNhc2VzIChkZXN0cm95IGFuZCBzd2Fwb3V0KSBkbyBub3QgaG9sZCB0aGUgbG9j
aywgQUlVSS4KClRoYXQncyBub3QgY29ycmVjdC4gU2VlIHR0bV9ib19yZWxlYXNlKCkgZm9yIGV4
YW1wbGU6CgouLi4KIMKgwqDCoMKgwqDCoMKgIGlmICghZG1hX3Jlc3ZfdGVzdF9zaWduYWxlZF9y
Y3UoYm8tPmJhc2UucmVzdiwgdHJ1ZSkgfHwKIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIWRtYV9y
ZXN2X3RyeWxvY2soYm8tPmJhc2UucmVzdikpIHsKLi4uCgpXZSBpbnRlbnRpb25hbGx5IGxvY2sg
dGhlIHJlc2VydmF0aW9uIG9iamVjdCBoZXJlIG9yIHB1dCBpdCBvbiB0aGUgCmRlbGF5ZWQgZGVs
ZXRlIGxpc3QgYmVjYXVzZSBkcm9wcGluZyB0aGUgdHQgb2JqZWN0IHdpdGhvdXQgaG9sZGluZyB0
aGUgCmxvY2sgaXMgaWxsZWdhbCBmb3IgbXVsdGlwbGUgcmVhc29ucy4KCklmIHlvdSBydW4gaW50
byBhbiB1bnBvcHVsYXRlIHdoaWNoIGRvZXNuJ3QgaG9sZCB0aGUgbG9jayB0aGVuIEkgcmVhbGx5
IApuZWVkIHRoYXQgYmFja3RyYWNlIGJlY2F1c2Ugd2UgYXJlIHJ1bm5pbmcgaW50byBhIG11Y2gg
bGFyZ2VyIGJ1ZyBoZXJlLgoKVGhhbmtzLApDaHJpc3RpYW4uCgoKPgo+IFJlZ2FyZHMsCj4gIMKg
IEZlbGl4Cj4KPgo+PiBDaHJpc3RpYW4uCj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVo
bGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPj4+IC0tLQo+Pj4gIMKgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDEzICsrKysrKysrKysrKysKPj4+ICDCoCAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKPj4+IGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4+PiBpbmRleCA5MzZiM2NmZGRlNTUuLjI1Nzc1MDky
MWVlZCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCj4+
PiBAQCAtMTIxNiw5ICsxMjE2LDIyIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV90dG1fdHRfdW5wb3B1
bGF0ZShzdHJ1Y3QKPj4+IHR0bV9kZXZpY2UgKmJkZXYsCj4+PiAgwqAgwqDCoMKgwqDCoCBpZiAo
dHRtLT5zZyAmJiBndHQtPmdvYmotPmltcG9ydF9hdHRhY2gpIHsKPj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoOwo+Pj4gK8KgwqDCoMKgwqDC
oMKgIGJvb2wgbG9ja2VkOwo+Pj4gIMKgIMKgwqDCoMKgwqDCoMKgwqDCoCBhdHRhY2ggPSBndHQt
PmdvYmotPmltcG9ydF9hdHRhY2g7Cj4+PiArwqDCoMKgwqDCoMKgwqAgLyogRklYTUU6IHVucG9w
dWxhdGUgY2FuIGJlIGNhbGxlZCBkdXJpbmcgYm9fZGVzdHJveS4KPj4+ICvCoMKgwqDCoMKgwqDC
oMKgICogVGhlIGRtYWJ1Zi0+cmVzdiBtdXN0IG5vdCBiZSBoZWxkIGJ5IHRoZSBjYWxsZXIgb3IK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogZG1hX2J1Zl9kZXRhY2ggd2lsbCBkZWFkbG9jay4gVGhp
cyBpcyBwcm9iYWJseSBub3QKPj4+ICvCoMKgwqDCoMKgwqDCoMKgICogdGhlIHJpZ2h0IGZpeC4g
SSBnZXQgYSByZWN1cnNpdmUgbG9jayB3YXJuaW5nIHdpdGggdGhlCj4+PiArwqDCoMKgwqDCoMKg
wqDCoCAqIHJlc2VydmF0aW9uIGhlbGQgaW4gdHRtX2JvX3JlbGVhcy4uIFNob3VsZAo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqAgKiB1bm1hcF9hdHRhY2htZW50IG1vdmUgdG8gYmFja2VuZF91bmJpbmQg
aW5zdGVhZD8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgICovCj4+PiArwqDCoMKgwqDCoMKgwqAgbG9j
a2VkID0gZG1hX3Jlc3ZfaXNfbG9ja2VkKGF0dGFjaC0+ZG1hYnVmLT5yZXN2KTsKPj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAoIWxvY2tlZCkKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9y
ZXN2X2xvY2soYXR0YWNoLT5kbWFidWYtPnJlc3YsIE5VTEwpOwo+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoCBkbWFfYnVmX3VubWFwX2F0dGFjaG1lbnQoYXR0YWNoLCB0dG0tPnNnLCBETUFfQklESVJF
Q1RJT05BTCk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFsb2NrZWQpCj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkbWFfcmVzdl91bmxvY2soYXR0YWNoLT5kbWFidWYtPnJlc3YpOwo+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoCB0dG0tPnNnID0gTlVMTDsKPj4+ICDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuOwo+Pj4gIMKgwqDCoMKgwqAgfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
