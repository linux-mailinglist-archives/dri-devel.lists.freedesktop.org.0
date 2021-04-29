Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2B036EE98
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 19:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D583B6F3F0;
	Thu, 29 Apr 2021 17:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B439B6F3F0;
 Thu, 29 Apr 2021 17:06:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjmkWF97hL0g8ZI7jxZ61+fbvGjV28sj3eNPqgn5UYrpey/EMVuc5HhxjASTwPwGyO2SucxKBg/QCp7ZCVljS8mnJ0xxs3+4piuGcjmJ5b3Pkks9LhDng5rqzzF2EogyW9B0zKR/wYqSKQSsx/Ddu+vZLWKVTW6yjn02quxCu8akHVNiSMtcP8LRKKbIEkS/11MDLInYDaOgXfTyavJhBaOpwBWqetbdTQK7jCLtZhpD8Q3B4fpe7pM1gM8yMBvw3bjZBDJi1HPNpqve6Wg4Y+FT3BdBBl2KttlojX0meijFMmGx9pdN9LuBgnDsuN7G4qVwRltFGGJPRGSGLecy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRj3WmsVXXrvqXG6I7H+X3ayRp/ED9PSWuIlwtZ587k=;
 b=f15ig5fRnBE+Qxix9xoBNIuhaGYamz8RC3iGvO0gEwu5Rv4nPKlcURYpmJb+aBLzW5L93C2yBt0E4AUFbvPbfe1vx/tRT9FW6NVmHUTI02MsFSZjfO7jvcsTl3R4Af1jEiKl/2axYEW0OCzLVa4FmrH/SX3h41P6m1iIyusHrWATINxjYWdUwuAvqRIy15v6jT6EUZ8jRdzm+6bpabGxpXaZx8Q/6koC3/KI21mdsMfCTEFn48CtSURmwWfEbpkDTCzzBje1OdH0xxWa905pe8jh/vvOrZ/nMjjtZgJKJGIuGg5xvral7CpNeilRBCWfXQ9st6kRqvxVEKY+OWU52Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRj3WmsVXXrvqXG6I7H+X3ayRp/ED9PSWuIlwtZ587k=;
 b=PMsEFgJ6UUp+fGP0lR7M9PXQ23zkOAduFM0IqMhC/v5UqIAwgIbTV5kUI9ORkbfILOXt1g+PFnTvkH/k7DvPZ8dVcoUVS8UFLszccKwm9dPUzJS0IbgPIEWz/1NSEwIxRHnQemHnK2ZZM98nkFyUDibPhdYYl6Io1RvenZRGf94=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2655.namprd12.prod.outlook.com (2603:10b6:805:72::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Thu, 29 Apr
 2021 17:06:17 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 17:06:17 +0000
Subject: Re: [PATCH v5 15/27] drm/scheduler: Fix hang when sched_entity
 released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-16-andrey.grodzovsky@amd.com>
 <a8314d77-578f-e0df-5c49-77d5f10c76c7@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <9cb771f2-d52f-f14e-f3d4-b9488b353ae3@amd.com>
Date: Thu, 29 Apr 2021 13:06:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <a8314d77-578f-e0df-5c49-77d5f10c76c7@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:497:888:9bb9:54f1]
X-ClientProxiedBy: YTOPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::23) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:497:888:9bb9:54f1]
 (2607:fea8:3edf:49b0:497:888:9bb9:54f1) by
 YTOPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24 via Frontend
 Transport; Thu, 29 Apr 2021 17:06:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50081f5e-82f7-4f76-2d11-08d90b311a28
X-MS-TrafficTypeDiagnostic: SN6PR12MB2655:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2655EA8E701CCB22AFF45F8FEA5F9@SN6PR12MB2655.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DUbloVCIvi7309wShhKl8znAY2n+PPheqJlptA59EdsxXhJE7zOGdVsM81/yhj53LiqjncJsZl9mBp8ODx8/msqEgs23Aj5mLmPqDDJML6C4uGuZcwlynoEoIwJRb8ZkFMIjcz1D6beQBIRIw3eaqU/TTyHsvT4JEpENkXt8jIUnPNMpYP+lX0NfZBLnXKjLv0vFxJrfUPCPwhMrxq3S8+5a/4t5ZpkzLiPLdeQMaOxAJYWRX5WBfd/QUbjGwBBuDP1AqUQAp7mA/U9jtpl2WK0dGAn1OoFjdJvxrEQPCKKFoNivqtv4pfo4IssHE3hvsp8oDKzQoZmEAgn4533JBkXp73N7+r5inl6JwoPIxkCEiTVMTxKbBMmG1PVp0fZdWzBPYOzw/esJB2iAgiYcWl25j7YkYN+GnxwvEHHSaWH7JcIZ1u1jwKZsWSFoi9bD0XzR4ESgxzej/sxEoPv7vbG5a5v+YwU0r4QXgZtXFWB7o5bfH01Rtn0L3CWKZItPTgFuBjC+xvA3W7bRKiALY3QMHm5huMb35gjlFivrzEdYoKCJn27t49rYdGtDMFAuh+K+T6eZctzQyI5QfeOV5Z7qwpDVGNsCiDaaBGcKVBUUShIkuKrrV/MeUvoItz6YDL28qoIB5kRNCOJz7YM8byXfhFj83tgZFe/tsg1+t5jTLSc/73GngP66oBNJQw9w
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(4326008)(6486002)(31696002)(66556008)(86362001)(316002)(31686004)(8936002)(66476007)(5660300002)(186003)(44832011)(16526019)(8676002)(2616005)(38100700002)(478600001)(66946007)(66574015)(36756003)(52116002)(2906002)(53546011)(6636002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bENjM3UyZHY1dXkwbERsUVduSHFzVVRPTGNJWHNmWDBtbDl2cWNRNm83REt3?=
 =?utf-8?B?N25xTDlEY2d3R3VPTFlLVU0vQ2xsNlV3QjYvblJHazVZeEYxVTlySXBUNkNr?=
 =?utf-8?B?cVpzai9jK3V1U0hnOEtOeG9kS2d1elRGYmVTbVpNbktvQnQxQVpOeGhDam1o?=
 =?utf-8?B?ZlFKdE0zSDJUdGFkTCttUEl1QjFQanNPbi9Fc1RWL2o3SUZtUmZWNGoxZklT?=
 =?utf-8?B?TWNVcXpQcEtWS1lLQUJTYnJkU2xMTXNrTHYwWHExN1UyVGdNbFhmUExXT3pS?=
 =?utf-8?B?SUNJcFBiendiaUhSamhtR0NkWGpnK1hMeGdjQzNpVjJtcTFmYUZxMWZXb2JZ?=
 =?utf-8?B?UGgySkJ1V1NKOU1VOGx4a01WTjdGNmh6QXdhU09WS2VXbXJ0YldOY2M4a2t6?=
 =?utf-8?B?UWpQRWdxVmQ5WWE0TXVsYUExb1d1SmhDcEs4am9jQm1FSCsyeTdVWnNObzF5?=
 =?utf-8?B?MHdZeVlxTFhQeExleURkUExya3prOVpIRFNwaStvVm00UzBhM2htczJpWGVD?=
 =?utf-8?B?M1B2RHNCTnJUOWJlZExsalNpUmZrOE9STml5OU00Z3NsVEZEUXhCWUplemVZ?=
 =?utf-8?B?VktwUTBxbWJOVFp4dmRJeXBkV05xb3JDMjE1MTZaTWpvS3huUjZyRGMxeUgy?=
 =?utf-8?B?KzlpVTN1aGRVSEdzSmc0VDU1NSszRWVsRUFVSjc1d1VtakNlUjJSejBPeFBz?=
 =?utf-8?B?WDVQTTBlQlRkNzJtSk5SWFFvYXJKVXZkL3BDeVZQSjhWWmF0LzgxTUt4ZFpm?=
 =?utf-8?B?QTJnK2dNWE9YZzhLcVFHT2Y0ZC9LRFVJV2NhcnoyS2lrWkNGTDBMTmxsbXA0?=
 =?utf-8?B?TmNVRzBRSk5hdk1wMWtOWEZmWW8yNjR5UUIzMFk1emtkY0NZUVhZNGpxbGx5?=
 =?utf-8?B?Q3U5TVY0N2dsMDdSSE5sa2Q5Ny9sQXhVWUJtbGcwUGtlSDlmb25adUlMbWEv?=
 =?utf-8?B?TWI4MVk5V3ZCWjdvK0s3WXgxRzA0U0tSS3ErZWZUR0R0RUs1b1dnTHR2YURl?=
 =?utf-8?B?dW9jY2FQMkJONGJFQlM2QnlKSmVraWFZbUlzeGoyUlRqOUhma2g1aFhraDNk?=
 =?utf-8?B?VEpFNmhBUHVXT0RsWkRSZFowL3JRL0g3NkUvNjduTjRoQTVoR0hLWUtxcDky?=
 =?utf-8?B?T2tMWHZzZFB1eGI1M0FjcVZqUS90Rmo1eU9DOFVSbDB4MHVCVkwvcHQwVTFy?=
 =?utf-8?B?WXB2RzB5V0dWUXNBNlk4S3dWUldNVjhLTVBLZ3hqaUdVSGZCeS9UZzE3K055?=
 =?utf-8?B?RktSa2VPcDZRMUV5SVlaY3hUeG1QU3B4QkQvd2hpYjBNNStIUXkrV1hDK0Rz?=
 =?utf-8?B?NmdzeTBGOHpTdXdnTlNkNTlLanpXQWpxSytqK0Y3cEh3UXVuZGhUcml0dDJk?=
 =?utf-8?B?akxSd0NkRlRzakw0V0FNb3FBamRHOVJIWEZoaFE3dUFhUDB3MVpDWE8xV3Zq?=
 =?utf-8?B?aHVydGFvakN1RXZUOG0wWkF6ZllFU1FoMGd4UmtIbmRBaWdOSSt4YmRUV3pS?=
 =?utf-8?B?b0ZGQkFlclArODkzTGs1anRTbk9SaklyUlFoWCtJQktESk00dWN3NVlBdVNT?=
 =?utf-8?B?amhycDM2eGQ0TzZRZ0xVcFNuV3FERWR3M25qUTI1WXBER04yd1Zrem12VlVu?=
 =?utf-8?B?WktrZW0zNzNRRDlla1BLSWdFcDdEU3RyNTBwKzVtMitKZmVzY3haTGRXditz?=
 =?utf-8?B?YVFSU0RlNGN2ZjJOem1KMDQzcHdHblJ0RnRoTWdvSHJLc0hidTVvMkhjWURP?=
 =?utf-8?B?MUFXSG9qbXZpQU1GNHc2S2VoT2I2TVBSM3BvbTRsTGRjeThudDFoelJpMmhC?=
 =?utf-8?B?MjhtNlc3cEY4UWZwUjh3YmdjY1o0QlAxNmtXVW4rWG9PWGdtWjBTNWhXbXRK?=
 =?utf-8?Q?k/CNKvMlqQqv8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50081f5e-82f7-4f76-2d11-08d90b311a28
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 17:06:17.1508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s72ri+qUlH/STJH7b4uLYHhOg8EPAWS8ERDooqnOFWXHkbWxnoNMi8wLZ6eTveW0lIP4nuomYRa1zsgFWgnI5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2655
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiAyMDIxLTA0LTI5IDM6MTggYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBJIG5l
ZWQgdG8gdGFrZSBhbm90aGVyIGxvb2sgYXQgdGhpcyBwYXJ0IHdoZW4gSSBkb24ndCBoYXZlIGEg
bWFzc2l2ZSAKPiBoZWFkYWNoZSBhbnkgbW9yZS4KPiAKPiBNYXliZSBzcGxpdCB0aGUgcGF0Y2gg
c2V0IHVwIGludG8gZGlmZmVyZW50IHBhcnRzLCBzb21ldGhpbmcgbGlrZToKPiAxLiBBZGRpbmcg
Z2VuZXJhbCBpbmZyYXN0cnVjdHVyZS4KPiAyLiBNYWtpbmcgc3VyZSBhbGwgbWVtb3J5IGlzIHVu
cG9sYXRlZC4KPiAzLiBKb2IgYW5kIGZlbmNlIGhhbmRsaW5nCgpJIGFtIG5vdCBzdXJlIHlvdSBt
ZWFuIHRoaXMgcGF0Y2ggaGVyZSwgbWF5YmUgYW5vdGhlciBvbmUgPwpBbHNvIG5vdGUgeW91IGFs
cmVhZHkgUkJlZCBpdC4KCkFuZHJleQoKPiAKPiBDaHJpc3RpYW4uCj4gCj4gQW0gMjguMDQuMjEg
dW0gMTc6MTEgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4gUHJvYmxlbTogSWYgc2NoZWR1
bGVyIGlzIGFscmVhZHkgc3RvcHBlZCBieSB0aGUgdGltZSBzY2hlZF9lbnRpdHkKPj4gaXMgcmVs
ZWFzZWQgYW5kIGVudGl0eSdzIGpvYl9xdWV1ZSBub3QgZW1wdHkgSSBlbmNvdW50cmVkCj4+IGEg
aGFuZyBpbiBkcm1fc2NoZWRfZW50aXR5X2ZsdXNoLiBUaGlzIGlzIGJlY2F1c2UgCj4+IGRybV9z
Y2hlZF9lbnRpdHlfaXNfaWRsZQo+PiBuZXZlciBiZWNvbWVzIGZhbHNlLgo+Pgo+PiBGaXg6IElu
IGRybV9zY2hlZF9maW5pIGRldGFjaCBhbGwgc2NoZWRfZW50aXRpZXMgZnJvbSB0aGUKPj4gc2No
ZWR1bGVyJ3MgcnVuIHF1ZXVlcy4gVGhpcyB3aWxsIHNhdGlzZnkgZHJtX3NjaGVkX2VudGl0eV9p
c19pZGxlLgo+PiBBbHNvIHdha2V1cCBhbGwgdGhvc2UgcHJvY2Vzc2VzIHN0dWNrIGluIHNjaGVk
X2VudGl0eSBmbHVzaGluZwo+PiBhcyB0aGUgc2NoZWR1bGVyIG1haW4gdGhyZWFkIHdoaWNoIHdh
a2VzIHRoZW0gdXAgaXMgc3RvcHBlZCBieSBub3cuCj4+Cj4+IHYyOgo+PiBSZXZlcnNlIG9yZGVy
IG9mIGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5IGFuZCBtYXJraW5nCj4+IHNfZW50aXR5IGFz
IHN0b3BwZWQgdG8gcHJldmVudCByZWluc2VyaW9uIGJhY2sgdG8gcnEgZHVlCj4+IHRvIHJhY2Uu
Cj4+Cj4+IHYzOgo+PiBEcm9wIGRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5LCBvbmx5IG1vZGlm
eSBlbnRpdHktPnN0b3BwZWQKPj4gYW5kIGNoZWNrIGZvciBpdCBpbiBkcm1fc2NoZWRfZW50aXR5
X2lzX2lkbGUKPj4KPj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5n
cm9kem92c2t5QGFtZC5jb20+Cj4+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX2VudGl0eS5jIHzCoCAzICsrLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vc2NoZWR1
bGVyL3NjaGVkX21haW4uY8KgwqAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPj4gwqAg
MiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIAo+PiBi
L2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMKPj4gaW5kZXggZjA3OTBl
OTQ3MWQxLi5jYjU4ZjY5MmRhZDkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hl
ZHVsZXIvc2NoZWRfZW50aXR5LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9z
Y2hlZF9lbnRpdHkuYwo+PiBAQCAtMTE2LDcgKzExNiw4IEBAIHN0YXRpYyBib29sIGRybV9zY2hl
ZF9lbnRpdHlfaXNfaWRsZShzdHJ1Y3QgCj4+IGRybV9zY2hlZF9lbnRpdHkgKmVudGl0eSkKPj4g
wqDCoMKgwqDCoCBybWIoKTsgLyogZm9yIGxpc3RfZW1wdHkgdG8gd29yayB3aXRob3V0IGxvY2sg
Ki8KPj4gwqDCoMKgwqDCoCBpZiAobGlzdF9lbXB0eSgmZW50aXR5LT5saXN0KSB8fAo+PiAtwqDC
oMKgwqDCoMKgwqAgc3BzY19xdWV1ZV9jb3VudCgmZW50aXR5LT5qb2JfcXVldWUpID09IDApCj4+
ICvCoMKgwqDCoMKgwqDCoCBzcHNjX3F1ZXVlX2NvdW50KCZlbnRpdHktPmpvYl9xdWV1ZSkgPT0g
MCB8fAo+PiArwqDCoMKgwqDCoMKgwqAgZW50aXR5LT5zdG9wcGVkKQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIHRydWU7Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIGZhbHNlOwo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgCj4+IGIvZHJpdmVy
cy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMKPj4gaW5kZXggOTA4YjBiNTYwMzJkLi5i
YTA4NzM1NGQwYTggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2No
ZWRfbWFpbi5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5j
Cj4+IEBAIC04OTcsOSArODk3LDMzIEBAIEVYUE9SVF9TWU1CT0woZHJtX3NjaGVkX2luaXQpOwo+
PiDCoMKgICovCj4+IMKgIHZvaWQgZHJtX3NjaGVkX2Zpbmkoc3RydWN0IGRybV9ncHVfc2NoZWR1
bGVyICpzY2hlZCkKPj4gwqAgewo+PiArwqDCoMKgIHN0cnVjdCBkcm1fc2NoZWRfZW50aXR5ICpz
X2VudGl0eTsKPj4gK8KgwqDCoCBpbnQgaTsKPj4gKwo+PiDCoMKgwqDCoMKgIGlmIChzY2hlZC0+
dGhyZWFkKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAga3RocmVhZF9zdG9wKHNjaGVkLT50aHJlYWQp
Owo+PiArwqDCoMKgIGZvciAoaSA9IERSTV9TQ0hFRF9QUklPUklUWV9DT1VOVCAtIDE7IGkgPj0g
Cj4+IERSTV9TQ0hFRF9QUklPUklUWV9NSU47IGktLSkgewo+PiArwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGRybV9zY2hlZF9ycSAqcnEgPSAmc2NoZWQtPnNjaGVkX3JxW2ldOwo+PiArCj4+ICvCoMKg
wqDCoMKgwqDCoCBpZiAoIXJxKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsK
Pj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZycS0+bG9jayk7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KHNfZW50aXR5LCAmcnEtPmVudGl0aWVzLCBsaXN0
KQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICogUHJldmVudHMgcmVpbnNlcnRpb24gYW5kIG1hcmtzIGpvYl9xdWV1ZSBhcyBpZGxlLAo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogaXQgd2lsbCByZW1vdmVkIGZyb20gcnEgaW4g
ZHJtX3NjaGVkX2VudGl0eV9maW5pCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBldmVu
dHVhbGx5Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc19lbnRpdHktPnN0b3BwZWQgPSB0cnVlOwo+PiArwqDCoMKgwqDCoMKgwqAgc3Bp
bl91bmxvY2soJnJxLT5sb2NrKTsKPj4gKwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIC8q
IFdha2V1cCBldmVyeW9uZSBzdHVjayBpbiBkcm1fc2NoZWRfZW50aXR5X2ZsdXNoIGZvciB0aGlz
IAo+PiBzY2hlZHVsZXIgKi8KPj4gK8KgwqDCoCB3YWtlX3VwX2FsbCgmc2NoZWQtPmpvYl9zY2hl
ZHVsZWQpOwo+PiArCj4+IMKgwqDCoMKgwqAgLyogQ29uZmlybSBubyB3b3JrIGxlZnQgYmVoaW5k
IGFjY2Vzc2luZyBkZXZpY2Ugc3RydWN0dXJlcyAqLwo+PiDCoMKgwqDCoMKgIGNhbmNlbF9kZWxh
eWVkX3dvcmtfc3luYygmc2NoZWQtPndvcmtfdGRyKTsKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
