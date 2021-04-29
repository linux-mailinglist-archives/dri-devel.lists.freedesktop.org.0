Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 764CC36EE20
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 18:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E440F6F3C6;
	Thu, 29 Apr 2021 16:29:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760057.outbound.protection.outlook.com [40.107.76.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797586F3C6;
 Thu, 29 Apr 2021 16:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5kg6xiVDAq3xsh+FZy5fAxuobiBT7r76iHn1eE12+CuU0advnI48GmicaBw24u5MW+TJWRQDPCSJVjjgbrrx6upwNvOWgGyU5nQqlI1J3fto6LgnKFcv0W4SFiiAGRFP7sc+euGYEjc4bO9Tp4GaTdW8k8sNrqVmKZoO3YwesBCJmw77XsKB36DGn6AFFyI7rdquy8a9LPeOrxjEq4itukhv71IlccEu5o5WKq7kFkVVgRY3Kq/hbR7hzthohMIFS3OuOWbcGl7n52t8+NBVtOlorDusEE5KKECgxCXDadf2qYKKMZjNSQqb7hOdxy7ZGfKwg4qXm7Gl00ZxI6jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BWtAvNoe1+dQgI0kWBcKinnCDcXWfo85W8x4jkrZFA=;
 b=oGguoV8njiVbBVFUjObHW5r+5/cjUD92OChhwyPCsY+wIQjX9qn+xY5SEVFKvKzTBrPutAVtCkxqSlrv6KqU/AOCnXKGyiiwhPMdxjED5C35acDStKFIVbydRfyTiCVzFPk6Gq4f2WCG+y/YURr3BbMCjLxWmWYatgY5GIeOlVvbOtahhKsnjF52r3h6VogA+nKPZf8a4a5lT3YRxRqfaUdfpZBlYaDzTF9Gs/AAe2bTb0IaVmPpplPfToRhZXp27VOGkfv53R7VthjalXtxUtBggzrWcrfed5oZSf7qoxML5hxbt2Hlv1vCdgLFLpEsNW9RQOWiQExv15IcL8P3MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BWtAvNoe1+dQgI0kWBcKinnCDcXWfo85W8x4jkrZFA=;
 b=TXWfuI4GoMv2Db7R7BTrQ7BgNmmb24O1FygYa09GQZq4bsUG9POfca8rNQ3XAmSEJFJrjREh2MKqWNNiWtFN5ClIyc4w5GaNbTkfnB4X26uSRBaCjwo0P5tODPyIwfneV50sQ+EX8wVMtvEr7DXWE6KebwJcibd+WqhKFdl5pbA=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 29 Apr
 2021 16:29:45 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Thu, 29 Apr 2021
 16:29:45 +0000
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs with drm_dev_enter/exit
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
 <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local> <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
 <95935e46-408b-4fee-a7b4-691e9db4f455@amd.com>
 <e760ada9-b4a7-c6ab-18f7-0bcc1b5442c2@amd.com>
 <a0cfd25b-f9fd-5788-d2d8-331b69102622@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <9c91bdae-d78c-202b-8b58-6977929f1273@amd.com>
Date: Thu, 29 Apr 2021 12:29:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <a0cfd25b-f9fd-5788-d2d8-331b69102622@amd.com>
Content-Language: en-US
X-Originating-IP: [142.182.183.69]
X-ClientProxiedBy: YTBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::18) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.183.69) by
 YTBPR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Thu, 29 Apr 2021 16:29:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b976961-053e-451d-6aee-08d90b2bffe3
X-MS-TrafficTypeDiagnostic: MN2PR12MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4470ACA450E8C186666632E9925F9@MN2PR12MB4470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w46Wrv3Oo2jKNhp3AcO+6RSczJ1DQEAJC64H4+YLs9zBhQJ7R4KqX7Rl85ajqTxY986ZHPDT8GLe6fCw/Xiv7tpPjJ/1Mh77TJRcm3onPQyN/1BIKAXNWvymqrq9qnp3i1rhJ7nlkXWkTFxJv8ScUunvmppigCMZB0xDVKkNgvlUkwoWrrVF7plicyUEkDwgfABDcx9AZjCGFRjHCrYgdbYweo7rRFr8xvcNpXG5JT7bWKS/3O97l1FyB5Y6nIs9KLUkRylwuWSbLQf/Ls7Aor4ZPWjf/ZLg3m7fJET0nzJkxnPyBiFCUJXYWJoPOgb6J4omGgwKAe0szlwnzq8YnvdfLh1zRx3WOYvyXtH+4XLbd2Hie+e5WrPGvEKxJhz45Rr239YSAGJd0Dz71tGV17biRy8YGIZAjAxOQHqpzcsKyE63wD8xHvKUOw9iyqasR4rc+4tHOgn+n3PtRDLhtCCRXoed015LDYuolBl1UpQdu0YscH507UuVCIW9lr1BZOR4L8m0yvrh1F48AGbnTRR+fe/C8yL73tKqSCY5au30Db5gE2w6EASxhtQsxHA8NRy0/nrV3i1x3E58A382nJJ9Udu8qDgin9bbMce5nN4Ta4hmu1kezB8NST7oTvbCj3Xn5hFL5Kn0O51XZsS71I4aLUGBiM1HzU/dEMvn8ZrY/LzunX9Q4F9A27CCGumaPgC5jz/0r4UVptu/kjDjiEfr7J1bc1tr8tiBeqJmQto=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39840400004)(8936002)(16526019)(86362001)(110136005)(38100700002)(478600001)(36756003)(66556008)(66476007)(53546011)(186003)(6486002)(956004)(4326008)(2616005)(8676002)(966005)(16576012)(66946007)(44832011)(2906002)(26005)(31696002)(5660300002)(316002)(83380400001)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MmM1b3dNTGphMkxIRTk3ejFWMXUvaVlsMGRaU0ZpTmNaU044enpRN0QwWVJ0?=
 =?utf-8?B?QWVpT3U5ejNqeXBZengwVW9QTEc5Znc3QkM5ZDBKSmRncmo5UzIxWXM4YW1z?=
 =?utf-8?B?NnhNcXNrTndCbWVNM1hPZGYxV1VDNmIyVnFKaGJlR0pzbE05dGNPMENRLzZx?=
 =?utf-8?B?cEhKQWpPUmJsdUlCc1hlaFU2bVg3d2ZtUHFOT0tqeElpdVFqVWc2Z2UySGUr?=
 =?utf-8?B?Tkx2bHdPdy8xU3o5UFJ1NkozOUZwOXFEc1pFc2F0NXdNVVFYQzkwUWVlQzB0?=
 =?utf-8?B?aFJjNmpmY0JsZk1VeXgxeFB5ZG5UZ1l1UmFXektJTStmanJiZmRSSC9ndXVh?=
 =?utf-8?B?L3RjaDFUMUQ2SkFXOHJwWEF0RmV1dWgrR2cvRGhtakdBL0l3Qi9nRk1Kclgz?=
 =?utf-8?B?TC9GSUxJTjkvYmVXRmxmdG15WDZDd0M2aXhndmVkcmJvekROeUdaOWREdVY2?=
 =?utf-8?B?L0hrT3BFd2FKQXptT0JPT1p0MnE1aFdpY1N3bWdNVHh2QzdoMFplYzFGQ2M3?=
 =?utf-8?B?ajI2czVVZGozK3hVeXI5T0NKKzJnWE1QZlJFekpwODdPT1RPMzZwU1hUYmdB?=
 =?utf-8?B?QllzWUhXbkI2Mnk0RHA5OEs4eDRvZGRGekZPek5kcm5QM1NaWU1wbDk1ZXBN?=
 =?utf-8?B?REFNQU1hT3g2VDByMjZmL1AxN1YyMUEzSU9DRE0rekpKbVlyV0h3N3o4N2xn?=
 =?utf-8?B?ako1T0Vnd1JPVUp2SjJFcURCK0k1cUNWUFBXRXh0TWR6d3pmZ09jbzZaQnZO?=
 =?utf-8?B?ZENGQ2gyNVRyVHN3RnluMXBFdmYzMWtmNFh1eHkrUVBPQXE1Z0ZRZUFnOFph?=
 =?utf-8?B?SEJpOUtEdjVzeFN2UGc2bkxqYkI5Y2NaeE9vam90dUNIU1NDY0ZveXNrS1V5?=
 =?utf-8?B?OENBc1B3ZVpNaTFmeGQ3WTJQd1RxdXJnVnZJTmFFMFZsc0VDWFQzV3FKOWhw?=
 =?utf-8?B?OS9nL3hGZWNnVDJXWVpmT0JWZDcrRnpTSnUyZUp5R0FYcmEwUkljK01JZ25Y?=
 =?utf-8?B?SHQ3bExoeWR3aEhtb29RRzB1d1k2U3RJeml2N3krL010NW9oUEdOVGVHSWtL?=
 =?utf-8?B?SE94ZG1Gdk0xRTIyakIrbmdzS0xIcEtMTFVPNHBYWTlnbkZDV3B2Rk5oWEs4?=
 =?utf-8?B?Q3RFWkYrYkdaMzAyMWo4SC9OdXBSYkFLRUt0SXUyZWpsekZjMkV4MXZLd0xX?=
 =?utf-8?B?S3BIcmNSOGxRU21qcGl2OGZNbk84VzB3bnF5MzhqMzN5SGpqalIwR0xaRUtj?=
 =?utf-8?B?clpzc0VNV01vSkJ2dDM5ZlZKalEzMUxrTm1ha04zdUdqNmtiZ0VQcG01RVls?=
 =?utf-8?B?U3ExQU00WjNaRmRmUU1MSllkQ3BJNzlBbkUySnMxdkdmSzZNQzJ4SWxrcGdN?=
 =?utf-8?B?ZkRuNStsbnVCRFRxTDFwMmIvdnAxTC9YUEl2eW5aWEZMWU50dm14bTgrZlVm?=
 =?utf-8?B?U0pjdDlsTmovcnZBd2VmekVvMmJVRmJTTEpqeHNDU3ZicVkvZkFNay96VzAx?=
 =?utf-8?B?dEVhZUswWUxXdkVZRU5sdlNJcW5yZlFhcnFaUE5Dc2YyaGViNlk0SU9ESi9V?=
 =?utf-8?B?WHM2ZEJ4by9HNEdlckpSNW9YTXpSNW5pUGRzSFVtQzd4T0JXM1YzSEVJRGZU?=
 =?utf-8?B?NjR5UEMwREdhTXBIMDVQdzFueFNxenNUQTJKMDQrN0sxRUtUOUxhNUUxL085?=
 =?utf-8?B?bjZ2QTJOSVV1RHpOVkdsSWIxaXdHQzdHK1g0RDFjUXhaTW5Ud1Z6c3UwRGNZ?=
 =?utf-8?Q?ffnDLFhY4dsLVOmKs2Sjus4DQ6vAkKNsyVMgKQx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b976961-053e-451d-6aee-08d90b2bffe3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 16:29:45.6091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KccR35TQOZHGdMAmde5s/ykCPqGqvU9XXHs88ezcHHH1sSCxACFYjqdRDZIgoU6zA4E1qR6EY4EritpKi1iIdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org, helgaas@kernel.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0yOSB1bSAxMjoyMSBwLm0uIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4K
Pgo+IE9uIDIwMjEtMDQtMjkgMTI6MTUgcC5tLiwgRmVsaXggS3VlaGxpbmcgd3JvdGU6Cj4+IEFt
IDIwMjEtMDQtMjkgdW0gMTI6MDQgcC5tLiBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4g
U28gYXMgSSB1bmRlcnN0YW5kIHlvdXIgcHJlZmVycmVkIGFwcHJvYWNoIGlzIHRoYXQgSSBzY29w
ZSBhbnkKPj4+IGJhY2tfZW5kLCBIVyBzcGVjaWZpYyBmdW5jdGlvbiB3aXRoIGRybV9kZXZfZW50
ZXIvZXhpdCBiZWNhdXNlIHRoYXQKPj4+IHdoZXJlIE1NSU8KPj4+IGFjY2VzcyB0YWtlcyBwbGFj
ZS4gQnV0IGJlc2lkZXMgZXhwbGljaXQgTU1JTyBhY2Nlc3MgdGhvcm91Z2gKPj4+IHJlZ2lzdGVy
IGFjY2Vzc29ycyBpbiB0aGUgSFcgYmFjay1lbmQgdGhlcmUgaXMgYWxzbyBpbmRpcmVjdCBNTUlP
Cj4+PiBhY2Nlc3MKPj4+IHRha2luZyBwbGFjZSB0aHJvdWdob3V0IHRoZSBjb2RlIGluIHRoZSBk
cml2ZXIgYmVjYXVzZSBvZiB2YXJpb3VzIFZSQU0KPj4+IEJPcyB3aGljaCBwcm92aWRlIENQVSBh
Y2Nlc3MgdG8gVlJBTSB0aHJvdWdoIHRoZSBWUkFNIEJBUi4gVGhpcyBraW5kIG9mCj4+PiBhY2Nl
c3MgaXMgc3ByZWFkIGFsbCBvdmVyIGluIHRoZSBkcml2ZXIgYW5kIGV2ZW4gaW4gbWlkLWxheWVy
cyBzdWNoIGFzCj4+PiBUVE0gYW5kIG5vdCBsaW1pdGVkIHRvIEhXIGJhY2stZW5kIGZ1bmN0aW9u
cy4gSXQgbWVhbnMgaXQncyBtdWNoIGhhcmRlcgo+Pj4gdG8gc3BvdCBzdWNoIHBsYWNlcyB0byBz
dXJnaWNhbGx5IHNjb3BlIHRoZW0gd2l0aCBkcm1fZGV2X2VudGVyL2V4aXQKPj4+IGFuZAo+Pj4g
YWxzbyB0aGF0IGFueSBuZXcgc3VjaCBjb2RlIGludHJvZHVjZWQgd2lsbCBpbW1lZGlhdGVseSBi
cmVhayBob3QKPj4+IHVucGx1Zwo+Pj4gYmVjYXVzZSB0aGUgZGV2ZWxvcGVycyBjYW4ndCBiZSBl
eHBlY3RlZCB0byByZW1lbWJlciBtYWtpbmcgdGhlaXIgY29kZQo+Pj4gcm9idXN0IHRvIHRoaXMg
c3BlY2lmaWMgdXNlIGNhc2UuIFRoYXQgd2h5IHdoZW4gd2UgZGlzY3Vzc2VkIGludGVybmFsbHkK
Pj4+IHdoYXQgYXBwcm9hY2ggdG8gdGFrZSB0byBwcm90ZWN0aW5nIGNvZGUgd2l0aCBkcm1fZGV2
X2VudGVyL2V4aXQgd2UKPj4+IG9wdGVkIGZvciB1c2luZyB0aGUgd2lkZXN0IGF2YWlsYWJsZSBz
Y29wZS4KPj4KPj4gVlJBTSBjYW4gYWxzbyBiZSBtYXBwZWQgaW4gdXNlciBtb2RlLiBJcyB0aGVy
ZSBhbnl0aGluZyBwcmV2ZW50aW5nIHVzZXIKPj4gbW9kZSBmcm9tIGFjY2Vzc2luZyB0aGUgbWVt
b3J5IGFmdGVyIHVucGx1Zz8gSSBndWVzcyB0aGUgYmVzdCB5b3UgY291bGQKPj4gZG8gaXMgdW5t
YXAgaXQgZnJvbSB0aGUgQ1BVIHBhZ2UgdGFibGUgYW5kIGxldCB0aGUgYXBwbGljYXRpb24gc2Vn
ZmF1bHQKPj4gb24gdGhlIG5leHQgYWNjZXNzLiBPciByZXBsYWNlIHRoZSBtYXBwaW5nIHdpdGgg
YSBkdW1teSBwYWdlIGluIHN5c3RlbQo+PiBtZW1vcnk/Cj4KPiBXZSBpbmRlZWQgdW5tYXAgYnV0
IGluc3RlYWQgb2YgbGV0dGluZyBpdCBzZWdmYXVsdCBpbnNlcnQgZHVtbXkgcGFnZSBvbgo+IHRo
ZSBuZXh0IHBhZ2UgZmF1bHQuIFNlZSBoZXJlCj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9y
Zy9+YWdyb2R6b3YvbGludXgvY29tbWl0Lz9oPWRybS1taXNjLW5leHQmaWQ9NmRkZTMzMzBmZmE0
NTBlMmU2ZGE0ZDE5ZTJmZDBiYjk0YjY2YjZjZQo+IEFuZCBJIGFtIGF3YXJlIHRoYXQgdGhpcyBk
b2Vzbid0IHRha2UgY2FyZSBvZiBLRkQgdXNlciBtYXBwaW5nLgo+IEFzIHlvdSBrbm93LCB3ZSBo
YWQgc29tZSBkaXNjdXNzaW9ucyB3aXRoIHlvdSBvbiB0aGlzIHRvcGljIGFuZCBpdCdzIG9uCj4g
bXkgVE9ETyBsaXN0IHRvIGZvbGxvdyB1cCBvbiB0aGlzIHRvIHNvbHZlIGl0IGZvciBLRkQgdG9v
LgoKUk9DbSB1c2VyIG1vZGUgbWFwcyBWUkFNIEJPcyB1c2luZyByZW5kZXIgbm9kZXMuIFNvIEkn
ZCBleHBlY3QKdHRtX2JvX3ZtX2R1bW15X3BhZ2UgdG8gd29yayBmb3IgS0ZEIGFzIHdlbGwuCgpJ
IGd1ZXNzIHdlJ2QgbmVlZCBzb21ldGhpbmcgc3BlY2lhbCBmb3IgS0ZEJ3MgZG9vcmJlbGwgYW5k
IE1NSU8gKEhEUApmbHVzaCkgbWFwcGluZ3MuIFdhcyB0aGF0IHRoZSBkaXNjdXNzaW9uIGFib3V0
IHRoZSBmaWxlIGFkZHJlc3Mgc3BhY2U/CgpSZWdhcmRzLArCoCBGZWxpeAoKCj4KPiBBbmRyZXkK
Pgo+Pgo+PiBSZWdhcmRzLAo+PiDCoMKgIEZlbGl4Cj4+Cj4+Cj4+Pgo+Pj4gQW5kcmV5Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
