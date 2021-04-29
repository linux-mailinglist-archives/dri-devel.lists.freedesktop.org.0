Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C00C436EE3C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 18:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE6E6F3D6;
	Thu, 29 Apr 2021 16:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417066F3CE;
 Thu, 29 Apr 2021 16:33:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6CsbRA5/clka/7dlPv6H3L/gaLUw1k9whs1ZOV9iNGKUueuZoiuz+rYxPgBUr7/0/D6YPzRcM2NwFKFP8PZuPat4HVsUnVoVFlSTnEnnCYgNix4zsVuva6E8BlwiLXrzC8KckVJmLlZ+shMeDRcrpcswgDBNi36YYwWpV03Zn8Vkz8whn0slhDS604U5XMK7x8G9MQDJQus8ELBZQvdG8ZXHbfqXEUUrnc+rqhljzgjSLSj1KjrTOz4foiTGZ7dadVnLFQHsL3B4ClKDXiX+X6aqhx7h1hX9P7J7pJJHpKW3JjR0jFtht85uqz32bsdR6msD1MHQL/xR6pzg77T0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8La800WhmAt5/yTgCs0eFMzs558yxsQAn8FaEOsRkY=;
 b=ewGtU7Foao2SoGoDC62OuHwuGMIYohEHrVWUQbeSNbyqbMSAUCK6AeIHFsw0V4nLGHVrcVWNj1tqSPzUknUmmebw/bT1C/PGYmIWPnOeSMbey4jXXge38DeBgKY5tfKBK+am/bjWTxGC/VFUuvgdMicKDhC6ZYcEahnv6e3WoTN39MSy2OSIAnhqhRUpwz/EXew8NlX7ssYuhaWB71L3gYmlZPne7BpCdX9mxynKfGjVBC6mZGDE6IqEfW4sYQipFaxJEiNE//Z9XpiYqNplFA5ALzk51uRomoQfG6emavwT7pJ6dSgxQ2mWdZBqKTeZsWWbyOohDXq0UkN71eySIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8La800WhmAt5/yTgCs0eFMzs558yxsQAn8FaEOsRkY=;
 b=GjKtPo+Gx5ChEbzWMSAuGpRWNe1cpH0FkNhPQk/JOQiE3hmjzUJSf719MKs1DQOTXTDwFhMMuUV3h3qbVOoscx0Br5Ll8VirK81RzPwx6tr1VhIaYWGDwR8mzB28zw1VLB7mnIFUXERCRzmgTlTWfFomYaZX52ryMKQnvFKcaiE=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 29 Apr
 2021 16:33:31 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 16:33:31 +0000
Subject: Re: [PATCH v5 20/27] drm: Scope all DRM IOCTLs with drm_dev_enter/exit
To: Felix Kuehling <felix.kuehling@amd.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-21-andrey.grodzovsky@amd.com>
 <YIqXJ5LA6wKl/yzZ@phenom.ffwll.local> <YIqZZW9iFyGCyOmU@phenom.ffwll.local>
 <95935e46-408b-4fee-a7b4-691e9db4f455@amd.com>
 <e760ada9-b4a7-c6ab-18f7-0bcc1b5442c2@amd.com>
 <a0cfd25b-f9fd-5788-d2d8-331b69102622@amd.com>
 <9c91bdae-d78c-202b-8b58-6977929f1273@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <6d56684c-1964-f023-7d23-f0e5042941c5@amd.com>
Date: Thu, 29 Apr 2021 12:33:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <9c91bdae-d78c-202b-8b58-6977929f1273@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:497:888:9bb9:54f1]
X-ClientProxiedBy: YT2PR01CA0019.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::24) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:497:888:9bb9:54f1]
 (2607:fea8:3edf:49b0:497:888:9bb9:54f1) by
 YT2PR01CA0019.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.24 via Frontend Transport; Thu, 29 Apr 2021 16:33:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26535897-138e-4bf4-906a-08d90b2c869f
X-MS-TrafficTypeDiagnostic: SA0PR12MB4416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44161B9095CAB7DF387D2ABEEA5F9@SA0PR12MB4416.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yMIXMsVwMC4W9vugMd2aXYIQZSkuF2lWAEBQOk4b+29ep8vSMCvfpJXyjr0f15UYq6GFDOrHMp6aVsEOX2nI5kV44zPqsuLsTyDDtoUKHB21RGU7aJAliIFWjgzOrn4TXcP1ROCyLdnN+Ramv0uEOJR7vEQa6nEtWqVfgKNwS3H4T/fwAC69L+/6gjgK1Y6RIPJ2kQdgtUNFZ+mh0DZ2+J+IWtTQamrFBowiyEvxx+NgFR8jq2rMPuzi6UqqCjFtWtdIpci/Nzo6isIkojQQLSV6V/4ZBwc4vwRx6BAGf5K7xg2L1QVDWQzCJwHQPSW/8VNM20Y3cQ1FnRX/9mAsze6XFc7RhjUCE4ZXuD0FujwgKNnOrVaGhxUtlAmprTbXbpmIrJ62O3a/PfEto8XYOhPdPGG+73dmuJgWfCPwf7MgSkJm64t2QXqikIdwdVoA/2i5u3WfZ36/3zO6Kynx3ljOMXHZJjLix27QPVKawoOCxSTBNhJBZATBwpkIJYgR5PlJdzCuvERho1VSX4D/mmOg22KGZbGNIPhtKV+zyb2VGFTBqIwoWIj3dtYoFfbsxGOltp6vVd5PrZ4HvDdHdpLNvLRMIyrW/K70Ms9fVrxrBnUW7gXOiWroYwpptdG74Eg5g1Cufq6edHTgoi0ltZhyi4AZ9DRL5TMM6aX3pQ1RvuTnvWYTHZBsdbP4XXuEmuNarH+AdJUNY0R7sYvEpwJmuseG2OHFgnVVWeBi/4w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39850400004)(376002)(346002)(136003)(2906002)(38100700002)(478600001)(36756003)(53546011)(966005)(5660300002)(2616005)(52116002)(44832011)(8936002)(66946007)(110136005)(4326008)(66556008)(86362001)(31686004)(31696002)(66476007)(316002)(8676002)(6486002)(186003)(83380400001)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cUpQc0J2NTZta0hQMzRkbHV3Skt5VGJxUXBvRkFVa1NKbHRMeDQvR3JraC85?=
 =?utf-8?B?RXc1R3VsZXJCYWhxdmt0QVIrTFhLYlRmUzBBZUc1V3FTbUdIeXMwY2dwNGJF?=
 =?utf-8?B?YmF5aGZ4aXhtd1V2T2t1aTlGVGRnMG5lNE5ZVjFIdHJwb2lJYUM0R2ZVUWFo?=
 =?utf-8?B?ZzRiNC9oWkJBdXBJQmVLNzI0Zjg3Z0dUMFQzcStZUHZmMVkrN0FPNXV0R2F4?=
 =?utf-8?B?dHVLUVdGaDFvcjdiNDF3VDlSbmFVaG9oU2xpNW9xeGhTWk5nNTNtYy9VVXh3?=
 =?utf-8?B?bmc1V242RTYvTEVVd3M2VE1RY3BKNlNTNHVSMUwwWHRmZlhkRkVMdTBGYmJR?=
 =?utf-8?B?cjFodFc4Rlg1eGc0QnNYdVRHMWN6MWdEVi8wNGVUVkFHZFFidXZXN3ViZkdn?=
 =?utf-8?B?anRVUzBia2x3cWZlMFM1cWQrL2t5L1F4elRnOHhYczREcEhaNlU2cVM4OC8w?=
 =?utf-8?B?d2UvdXZibWNMOW9sZUltVi9FNHdDa3BEYnVOQnNFbzAxSmVmbVE1QlNPdE5G?=
 =?utf-8?B?Rm5IQ2ZVSkdMWklnME9Ia0pDWEFQNWhUTW1jS0VkeUVHZnVsblhuM29wQThv?=
 =?utf-8?B?N0Fjcm5XQWZ4QUJKU05oVk0xMXNkVm9PVXZIQjd1TFQ4TFF3TGxBWkt0NTRy?=
 =?utf-8?B?bHJ4WmVnU2k5SXhkUzQ5enVuMHVIYVF4cGMyUkNNdzlCSnNRdXpKZldtdWxi?=
 =?utf-8?B?WnV4c0J0bXE4RVhqb25vOGdhcXBnRHVEZmx1aXNNSEEzS0JGSk9Ub3RxNnlm?=
 =?utf-8?B?WG9OdjlYUmtGNnBaMkNsUFcwcy9hcDhJSFdKQkJlUHV1WXo0eFBKRTRnUzNy?=
 =?utf-8?B?NkY4L1Z1NTE4eHM1aGh1RDhpT2pIYTRHaVRPNC9sMXNvRUtpZVMwb0lOTDV6?=
 =?utf-8?B?SHg2d0FtaXMxai9ObUU3V0ZaOWlWWXVoWk5adzFBV0o5Qkl5c2p2WEgyVkxr?=
 =?utf-8?B?V1dXZmdzeCt4VHUrVm5oVm9aL3paUDl1clVKdHdMOVhTdmRBT3hmcVA1Ujlw?=
 =?utf-8?B?VzdqRktlVXZrN2V3ZlZaN0NaVy82a2RYaXpKUGlrT0R6bUl4VkFzdmVhTHRx?=
 =?utf-8?B?Qm05eVZ5S1d2dXNwUjFRbmYwUmlnZExRQ09xeks1enFYVUhXVWYxbVp3ZzlP?=
 =?utf-8?B?TGlqVVV1TlVkR2JjcldQemFaTDNHYndhRlhwS2F2QzNPWVgwMU43bWdDK0p6?=
 =?utf-8?B?eTNzNElBU2tOSkVjQnkwQjdDQkswZmNFQkRwMlN6TXdwQjQ2T2k0QlVCdHVr?=
 =?utf-8?B?cHN0cFlYdzVoN1o3TFNQQ1VJaWoza2dTUm1GOUp6SEpaYkRTR3FoWERjcWtw?=
 =?utf-8?B?SUEzVDBnZ0p3SzZwK1BuOTJTWnliTEpMNmhJQUNkTHhteDhjYk95TUw2NWdG?=
 =?utf-8?B?SmFLSWFjUDhHUW5BM2phZ25GTWJPVmZEdHRsYlVuWUR1QWxtMFNmTzFleXhx?=
 =?utf-8?B?cXRLQ0lmRkVwb2NkSHZqUFRWaXUwTmRRQ0JEYkh0T2JoOWVDaXRQTVhQZUpK?=
 =?utf-8?B?OG92cFZINlI2TUdsME9YdXUxRGMxUDN2QWFGQnV6eU5XMzZkZ29aOXM3WE03?=
 =?utf-8?B?MEpaaWhhYnNnL1NjMVZvcDZHY1kwZE5hYXpIclRHSUUxWnNDaHRhU1dIM0lG?=
 =?utf-8?B?bXcva1lnS0grNDhXbWJWekpjYXN2Vy9FWGJGWjZvMmZYSldGSGpLL0pnRTZl?=
 =?utf-8?B?NDRoR29WaUJXaDJlQVlaaHZLcko1akVTeXl5NGlhWGRLSEZKUWwrVUVBNzRi?=
 =?utf-8?B?cHU3N1QxYnNZWC9qczFWOG52bTE2elRRRy9VRS9qVUFwNUF0UG9ITkJFWHZ1?=
 =?utf-8?B?aWhPSWJ3TGtlWUZUQlp5QSs1cjFrSFJMcytZZVFuVE1NU3YxZlo3MTRGSmsx?=
 =?utf-8?Q?PiAFoCHIl+lXN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26535897-138e-4bf4-906a-08d90b2c869f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 16:33:31.6455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAzxuMPN0Xv/dPnEBfGHo0zUwf4wCg1VAl2QerljTCgv3W9srJ/Wu1zdTz05pI5Q/xAuIstm6RRUUzJSWBKJLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDIxLTA0LTI5IDEyOjI5IHAubS4sIEZlbGl4IEt1ZWhsaW5nIHdyb3RlOgo+IEFtIDIw
MjEtMDQtMjkgdW0gMTI6MjEgcC5tLiBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pgo+Pgo+
PiBPbiAyMDIxLTA0LTI5IDEyOjE1IHAubS4sIEZlbGl4IEt1ZWhsaW5nIHdyb3RlOgo+Pj4gQW0g
MjAyMS0wNC0yOSB1bSAxMjowNCBwLm0uIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4g
U28gYXMgSSB1bmRlcnN0YW5kIHlvdXIgcHJlZmVycmVkIGFwcHJvYWNoIGlzIHRoYXQgSSBzY29w
ZSBhbnkKPj4+PiBiYWNrX2VuZCwgSFcgc3BlY2lmaWMgZnVuY3Rpb24gd2l0aCBkcm1fZGV2X2Vu
dGVyL2V4aXQgYmVjYXVzZSB0aGF0Cj4+Pj4gd2hlcmUgTU1JTwo+Pj4+IGFjY2VzcyB0YWtlcyBw
bGFjZS4gQnV0IGJlc2lkZXMgZXhwbGljaXQgTU1JTyBhY2Nlc3MgdGhvcm91Z2gKPj4+PiByZWdp
c3RlciBhY2Nlc3NvcnMgaW4gdGhlIEhXIGJhY2stZW5kIHRoZXJlIGlzIGFsc28gaW5kaXJlY3Qg
TU1JTwo+Pj4+IGFjY2Vzcwo+Pj4+IHRha2luZyBwbGFjZSB0aHJvdWdob3V0IHRoZSBjb2RlIGlu
IHRoZSBkcml2ZXIgYmVjYXVzZSBvZiB2YXJpb3VzIFZSQU0KPj4+PiBCT3Mgd2hpY2ggcHJvdmlk
ZSBDUFUgYWNjZXNzIHRvIFZSQU0gdGhyb3VnaCB0aGUgVlJBTSBCQVIuIFRoaXMga2luZCBvZgo+
Pj4+IGFjY2VzcyBpcyBzcHJlYWQgYWxsIG92ZXIgaW4gdGhlIGRyaXZlciBhbmQgZXZlbiBpbiBt
aWQtbGF5ZXJzIHN1Y2ggYXMKPj4+PiBUVE0gYW5kIG5vdCBsaW1pdGVkIHRvIEhXIGJhY2stZW5k
IGZ1bmN0aW9ucy4gSXQgbWVhbnMgaXQncyBtdWNoIGhhcmRlcgo+Pj4+IHRvIHNwb3Qgc3VjaCBw
bGFjZXMgdG8gc3VyZ2ljYWxseSBzY29wZSB0aGVtIHdpdGggZHJtX2Rldl9lbnRlci9leGl0Cj4+
Pj4gYW5kCj4+Pj4gYWxzbyB0aGF0IGFueSBuZXcgc3VjaCBjb2RlIGludHJvZHVjZWQgd2lsbCBp
bW1lZGlhdGVseSBicmVhayBob3QKPj4+PiB1bnBsdWcKPj4+PiBiZWNhdXNlIHRoZSBkZXZlbG9w
ZXJzIGNhbid0IGJlIGV4cGVjdGVkIHRvIHJlbWVtYmVyIG1ha2luZyB0aGVpciBjb2RlCj4+Pj4g
cm9idXN0IHRvIHRoaXMgc3BlY2lmaWMgdXNlIGNhc2UuIFRoYXQgd2h5IHdoZW4gd2UgZGlzY3Vz
c2VkIGludGVybmFsbHkKPj4+PiB3aGF0IGFwcHJvYWNoIHRvIHRha2UgdG8gcHJvdGVjdGluZyBj
b2RlIHdpdGggZHJtX2Rldl9lbnRlci9leGl0IHdlCj4+Pj4gb3B0ZWQgZm9yIHVzaW5nIHRoZSB3
aWRlc3QgYXZhaWxhYmxlIHNjb3BlLgo+Pj4KPj4+IFZSQU0gY2FuIGFsc28gYmUgbWFwcGVkIGlu
IHVzZXIgbW9kZS4gSXMgdGhlcmUgYW55dGhpbmcgcHJldmVudGluZyB1c2VyCj4+PiBtb2RlIGZy
b20gYWNjZXNzaW5nIHRoZSBtZW1vcnkgYWZ0ZXIgdW5wbHVnPyBJIGd1ZXNzIHRoZSBiZXN0IHlv
dSBjb3VsZAo+Pj4gZG8gaXMgdW5tYXAgaXQgZnJvbSB0aGUgQ1BVIHBhZ2UgdGFibGUgYW5kIGxl
dCB0aGUgYXBwbGljYXRpb24gc2VnZmF1bHQKPj4+IG9uIHRoZSBuZXh0IGFjY2Vzcy4gT3IgcmVw
bGFjZSB0aGUgbWFwcGluZyB3aXRoIGEgZHVtbXkgcGFnZSBpbiBzeXN0ZW0KPj4+IG1lbW9yeT8K
Pj4KPj4gV2UgaW5kZWVkIHVubWFwIGJ1dCBpbnN0ZWFkIG9mIGxldHRpbmcgaXQgc2VnZmF1bHQg
aW5zZXJ0IGR1bW15IHBhZ2Ugb24KPj4gdGhlIG5leHQgcGFnZSBmYXVsdC4gU2VlIGhlcmUKPj4g
aHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9+YWdyb2R6b3YvbGludXgvY29tbWl0Lz9oPWRy
bS1taXNjLW5leHQmaWQ9NmRkZTMzMzBmZmE0NTBlMmU2ZGE0ZDE5ZTJmZDBiYjk0YjY2YjZjZQo+
PiBBbmQgSSBhbSBhd2FyZSB0aGF0IHRoaXMgZG9lc24ndCB0YWtlIGNhcmUgb2YgS0ZEIHVzZXIg
bWFwcGluZy4KPj4gQXMgeW91IGtub3csIHdlIGhhZCBzb21lIGRpc2N1c3Npb25zIHdpdGggeW91
IG9uIHRoaXMgdG9waWMgYW5kIGl0J3Mgb24KPj4gbXkgVE9ETyBsaXN0IHRvIGZvbGxvdyB1cCBv
biB0aGlzIHRvIHNvbHZlIGl0IGZvciBLRkQgdG9vLgo+IAo+IFJPQ20gdXNlciBtb2RlIG1hcHMg
VlJBTSBCT3MgdXNpbmcgcmVuZGVyIG5vZGVzLiBTbyBJJ2QgZXhwZWN0Cj4gdHRtX2JvX3ZtX2R1
bW15X3BhZ2UgdG8gd29yayBmb3IgS0ZEIGFzIHdlbGwuCj4gCj4gSSBndWVzcyB3ZSdkIG5lZWQg
c29tZXRoaW5nIHNwZWNpYWwgZm9yIEtGRCdzIGRvb3JiZWxsIGFuZCBNTUlPIChIRFAKPiBmbHVz
aCkgbWFwcGluZ3MuIFdhcyB0aGF0IHRoZSBkaXNjdXNzaW9uIGFib3V0IHRoZSBmaWxlIGFkZHJl
c3Mgc3BhY2U/CgpZZXMKCkFuZHJleQoKPiAKPiBSZWdhcmRzLAo+ICDCoCBGZWxpeAo+IAo+IAo+
Pgo+PiBBbmRyZXkKPj4KPj4+Cj4+PiBSZWdhcmRzLAo+Pj4gIMKgwqAgRmVsaXgKPj4+Cj4+Pgo+
Pj4+Cj4+Pj4gQW5kcmV5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
