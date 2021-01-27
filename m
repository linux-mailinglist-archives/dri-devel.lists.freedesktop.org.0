Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4820E305E46
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 15:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABF86E47E;
	Wed, 27 Jan 2021 14:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E066E47E;
 Wed, 27 Jan 2021 14:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqKPAwNxZ/hd/EhO629BhMx4QT+cC/olUZrx2FTcCgxKImNts3UOMC7fCZuVdmyubUIrNAKbaLMyfeVCsm1kBL0oxGAikngPG6AWLq01hhquUR1dnFvL6gxgoOF51J4wIfKKD+ShNy10BtSGJwaPzkcMOAqghUyn+IDW951HkO16G0EkjtmOp7zVbFcsOc8NJ4M5p7Gi6rgM9It5HrZBkLN5Cm/8I4J4v7ZNP8PVvlOb27lB319MOKpwSN0jztwo9iRlswpt2I5thjXDiyFmqW3+/sM2Ew0tN1hlrxcF8EKFo7gkIk2LOaq2TIEoXC9HTugfGR9VpGqTpO5kYnvECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uU0x7S3IAy9H9OEFNflYJAjabPvy/4VS/1QQ/a/PH50=;
 b=ofnKW4qMpZmeZq6ZhpGTDIDpxrgl7FhR2FkAngXJhvYsdu+iAdXgPiiene6Gg0wcVL6q4Io0gHKgihSC5lehQmR3Abw6QsyBfq8C24pCnYHnOVWyul6coBWfdCe4cmqSwa//MH94O5tboZPJnS3MvwPVJe3pv4PIdmh5M3Rj/Vhp8ddCKqe/veHoRib9NSmvGQmP2XIsbgFnzBpyvOoTmY+qCdnXdqpCy4GDtXsyhnbieecl6jx7guW+QXHtd7ZL+wn/0SfkbortFtsQvoBYSB20oH9dK8BYAiE4ZaQwHq9DMV9PM84oDJHAaxGdjKn5mCkA/2BvTJ+rjMjdq9dRFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uU0x7S3IAy9H9OEFNflYJAjabPvy/4VS/1QQ/a/PH50=;
 b=dzkwYRWwETxrH6UzQxGPbq54K/b295EujqjvixmG9m3fu9YdzArs5eQVjSE8RfBeJy3OSS6objygSA8jWiLQaFfqg0QD64ctZnktVIm+2mHQniqNKz+U2inAyKP1V3YQNjJbYiVXbh07boOqe83O5xREuigplY8m9zx1EBzBHYA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2352.namprd12.prod.outlook.com (2603:10b6:802:25::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 27 Jan
 2021 14:29:44 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3784.017; Wed, 27 Jan 2021
 14:29:44 +0000
Subject: Re: [PATCH v4 01/14] drm/ttm: Remap all page faults to per process
 dummy page.
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-2-git-send-email-andrey.grodzovsky@amd.com>
 <YAblHNmVZVlTI6ny@phenom.ffwll.local>
 <e6597fdd-5800-d6c4-95e8-7e736948e110@amd.com>
Message-ID: <8da0eabf-1c9e-d9a0-0987-c15c1ddfdf54@amd.com>
Date: Wed, 27 Jan 2021 09:29:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e6597fdd-5800-d6c4-95e8-7e736948e110@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:b469:12f6:c56f:32fc]
X-ClientProxiedBy: YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::29) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:b469:12f6:c56f:32fc]
 (2607:fea8:3edf:49b0:b469:12f6:c56f:32fc) by
 YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend
 Transport; Wed, 27 Jan 2021 14:29:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cba1662e-ba2a-41f4-9da2-08d8c2cffd87
X-MS-TrafficTypeDiagnostic: SN1PR12MB2352:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2352237E976BEA88EE936FB9EABB9@SN1PR12MB2352.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KVn5xutnitbDXrteRn3Go7LN5CdqmyF9QRcyaBky5UTxVXf6iioPhKdtaSG6fx7ahUg5LfxIGufyRGAHDPiJm7F/nGA0kCVpxraK4tJt0/wGvMSamj45gVpg9Aivo4lxfvbZps5055mVDhwMeCPQ8OoCWhT7ojB83iQmhvhlqhQsjy2vc2MsbrlEPZMGjwUoGEus+23mQti6NABORBn1cij45AC6HqVp9oidosz+Ns1L/PN/b/Ot99HUtPwyCF3bOpyDkmR0TuE4KaYVbe2IebKzGxv+3T4FIeX0BJm7teoA5B8Ii4zfKEE4m6gk17XU51qqXl2VwgF9gDcPJrSqsfaNI1N/3j+4smQglD0X/OHLbKX1sUlbnvIAK+thslXFe8BspggEaXwqqTe/DecBwWemMVcwChAZWB8vd/ML8wpOdFkwIJisjLIXTSaM+roJEdRsxSe6PatqTv6a9uG70gk0WziPvPp/2bCumlZYj24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(396003)(376002)(39860400002)(52116002)(8676002)(66476007)(66556008)(478600001)(36756003)(5660300002)(316002)(6486002)(16526019)(8936002)(66946007)(31696002)(86362001)(6916009)(31686004)(7416002)(186003)(83380400001)(53546011)(4326008)(2616005)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZHJ5d3J0ekZYUzBQbmtWVUFVeFRmakZzWTlsZ01TQkpjUjF4L0NLSHlwT3Vu?=
 =?utf-8?B?bkJ1RVU3Yk1yUUg0aElqbG9EbjJydEpVV1BleFFNQlUxVU0wcHpTd3Z5Mysz?=
 =?utf-8?B?Q0QyaWJGenEySHBpcFJLQ1hMY2l6Rk9SNXdQanB3bnhtbmtPbHd6SFF3cU81?=
 =?utf-8?B?Mmx5a1BPSzFsTGVDdHArZEI0elRiaFdSZ290OEUrUWI2aFdEQkd6SDhFek5i?=
 =?utf-8?B?dHFaeS9VTm1wZTBVNlhHcVdmN1ZJTzV4TC81RDY4amJIVzdhb0UreUVCZVRs?=
 =?utf-8?B?ZjJZaCs0M2R0akVsZFdvN0w3d2l3Z2tHTm92Qlk1YzVrOThGTktCNk50QnA1?=
 =?utf-8?B?SUdiOUlhTDJTZ21jY3c0a3lucXZyTjJmNVBNSGZ4bk1ZWi91UnhJN0ZoMEh5?=
 =?utf-8?B?Q21hK21CbXdKalI3TjhCMk9nYWpLUit1UFViTnBIT1FSeTMrczBPTWtseDhW?=
 =?utf-8?B?SlRPQjJHVGJYcVhwWDdscjRsRjhOVDlQcFA2SEh3Y095TEFtcStFUjlKekc1?=
 =?utf-8?B?TzJUc3p0WmtQalB2MmlUVkpONnltTFlhanIyb3JsMlVmMi8rNzBmc0FOU2g4?=
 =?utf-8?B?bGh1MkNuTXVLR3FGRDErMkdETncxVU4yMTFVaVV2VGRnREFwb25TMjkraW5G?=
 =?utf-8?B?bXNzOUxkOWlFdG0zZnNLMTJ3VXM5eUI5di9CSHRDVm5uUkpkVkFTajV3MjRD?=
 =?utf-8?B?clVLSXlOc1dWR094enJqVEhieHNHUXZHWDc3MUdNemtKcFQwRS92bFFPaDBJ?=
 =?utf-8?B?S0xOeEp5WVdWSnUyRld0cVBmVEFvUHkvVmxqWCt4b1NKTGxiWDdzMHZxVEph?=
 =?utf-8?B?MVNTeGRFbWFLUTlYaEwvaVUySEgrOFdQdnF5dVk3alRtTzdFTTQzdlcvVmJq?=
 =?utf-8?B?MzczZkkyeStzZERqTk9TK1IxRkVBTGc4WlZadk5oQVF0VHNTNmZkQ2hzSmZI?=
 =?utf-8?B?aFVITy81SkQ3WDQ1djZiQzZmWXhFL2VTSU0vWVplb2FXOW9MbnZ3QmdtRm1Q?=
 =?utf-8?B?aTlIZmt0USt1eXh0cUt1S09KUXUvYlplMi9GOWFuSlB5Z2VpaDBRSkVxYncx?=
 =?utf-8?B?bVN1S2NGaFNPZWRyVzU3ei9OREYrUmpLNXRjL3BNZnF5RWNtNmNFSEVHTGV1?=
 =?utf-8?B?MU1JSTVwc1o2cVI4S0RUVWhheDJDc1AvaWVoSEZvelJPSHAxRkYzWWIxTWVM?=
 =?utf-8?B?MG9mb0pBb0NvWnRJVk9KYTBmTERYTFg1STVYNklmU0VVQjYrN1RtN1pIYSti?=
 =?utf-8?B?Zm9QandudStoWHFONVFkb2RWZXUzZnIydzB0Z3pjMFNnTEhYVjloVTVpbDRX?=
 =?utf-8?B?dlJjZ1F6MkNYejZTMlgrWjlrS21hNXRjaVhJMEd0Wm9hMkQ5M00ydGxEK05D?=
 =?utf-8?B?QW9zd0dHRG5wUWlicHQvV245elo4RTZwdEY1M3ZPbDdlMFEraGNYc3RKS0Vo?=
 =?utf-8?B?SFd1Q3pPaGd5TG1uSFZWMFVPY1B0QlIyZDZoT1VrMzBuR240OFF1RC9Pa0pX?=
 =?utf-8?B?TTdmbWtUSGJDcjZ2L3grMlFubkU1eXN1NkVva0NlM3VhSk5BRkFiSWZnN0Vy?=
 =?utf-8?B?YnIrQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cba1662e-ba2a-41f4-9da2-08d8c2cffd87
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 14:29:44.3605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qK3peQ81JtTrNjZP8dvGNgyZeeeRnaVaa/SyjTOHOvN93iDgx/Nq5fA/KZaDsp7LZ5X7QpiAWbHs4kT2+MRVog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2352
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
Cc: gregkh@linuxfoundation.org, ckoenig.leichtzumerken@gmail.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, Alexander.Deucher@amd.com, yuq825@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGV5IERhbmllbCwganVzdCBhIHBpbmcuCgpBbmRyZXkKCk9uIDEvMjUvMjEgMTA6MjggQU0sIEFu
ZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Cj4gT24gMS8xOS8yMSA4OjU2IEFNLCBEYW5pZWwgVmV0
dGVyIHdyb3RlOgo+PiBPbiBNb24sIEphbiAxOCwgMjAyMSBhdCAwNDowMToxMFBNIC0wNTAwLCBB
bmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4+IE9uIGRldmljZSByZW1vdmFsIHJlcm91dGUgYWxs
IENQVSBtYXBwaW5ncyB0byBkdW1teSBwYWdlLgo+Pj4KPj4+IHYzOgo+Pj4gUmVtb3ZlIGxvb3Ag
dG8gZmluZCBEUk0gZmlsZSBhbmQgaW5zdGVhZCBhY2Nlc3MgaXQKPj4+IGJ5IHZtYS0+dm1fZmls
ZS0+cHJpdmF0ZV9kYXRhLiBNb3ZlIGR1bW15IHBhZ2UgaW5zdGFsbGF0aW9uCj4+PiBpbnRvIGEg
c2VwYXJhdGUgZnVuY3Rpb24uCj4+Pgo+Pj4gdjQ6Cj4+PiBNYXAgdGhlIGVudGlyZSBCT3MgVkEg
c3BhY2UgaW50byBvbiBkZW1hbmQgYWxsb2NhdGVkIGR1bW15IHBhZ2UKPj4+IG9uIHRoZSBmaXJz
dCBmYXVsdCBmb3IgdGhhdCBCTy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpv
dnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDgyIAo+Pj4gKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0KPj4+IMKgIGluY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmjCoMKg
wqAgfMKgIDIgKwo+Pj4gwqAgMiBmaWxlcyBjaGFuZ2VkLCA4MyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jCj4+PiBpbmRleCA2ZGM5NmNm
Li5lZDg5ZGEzIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0u
Ywo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+Pj4gQEAgLTM0LDYg
KzM0LDggQEAKPj4+IMKgICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9ib19kcml2ZXIuaD4KPj4+IMKg
ICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9wbGFjZW1lbnQuaD4KPj4+IMKgICNpbmNsdWRlIDxkcm0v
ZHJtX3ZtYV9tYW5hZ2VyLmg+Cj4+PiArI2luY2x1ZGUgPGRybS9kcm1fZHJ2Lmg+Cj4+PiArI2lu
Y2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPgo+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4+
PiDCoCAjaW5jbHVkZSA8bGludXgvcGZuX3QuaD4KPj4+IMKgICNpbmNsdWRlIDxsaW51eC9yYnRy
ZWUuaD4KPj4+IEBAIC0zODAsMjUgKzM4MiwxMDMgQEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1
bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0IAo+Pj4gKnZtZiwKPj4+IMKgIH0KPj4+IMKgIEVY
UE9SVF9TWU1CT0wodHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKTsKPj4+IMKgICtzdGF0aWMgdm9p
ZCB0dG1fYm9fcmVsZWFzZV9kdW1teV9wYWdlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQg
KnJlcykKPj4+ICt7Cj4+PiArwqDCoMKgIHN0cnVjdCBwYWdlICpkdW1teV9wYWdlID0gKHN0cnVj
dCBwYWdlICopcmVzOwo+Pj4gKwo+Pj4gK8KgwqDCoCBfX2ZyZWVfcGFnZShkdW1teV9wYWdlKTsK
Pj4+ICt9Cj4+PiArCj4+PiArdm1fZmF1bHRfdCB0dG1fYm9fdm1fZHVtbXlfcGFnZShzdHJ1Y3Qg
dm1fZmF1bHQgKnZtZiwgcGdwcm90X3QgcHJvdCkKPj4+ICt7Cj4+PiArwqDCoMKgIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hID0gdm1mLT52bWE7Cj4+PiArwqDCoMKgIHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8gPSB2bWEtPnZtX3ByaXZhdGVfZGF0YTsKPj4+ICvCoMKgwqAgc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYgPSBiby0+YmRldjsKPj4+ICvCoMKgwqAgc3RydWN0IGRybV9k
ZXZpY2UgKmRkZXYgPSBiby0+YmFzZS5kZXY7Cj4+PiArwqDCoMKgIHZtX2ZhdWx0X3QgcmV0ID0g
Vk1fRkFVTFRfTk9QQUdFOwo+Pj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIGFkZHJlc3MgPSB2bWEt
PnZtX3N0YXJ0Owo+Pj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIG51bV9wcmVmYXVsdCA9ICh2bWEt
PnZtX2VuZCAtIHZtYS0+dm1fc3RhcnQpID4+IFBBR0VfU0hJRlQ7Cj4+PiArwqDCoMKgIHVuc2ln
bmVkIGxvbmcgcGZuOwo+Pj4gK8KgwqDCoCBzdHJ1Y3QgcGFnZSAqcGFnZTsKPj4+ICvCoMKgwqAg
aW50IGk7Cj4+PiArCj4+PiArwqDCoMKgIC8qCj4+PiArwqDCoMKgwqAgKiBXYWl0IGZvciBidWZm
ZXIgZGF0YSBpbiB0cmFuc2l0LCBkdWUgdG8gYSBwaXBlbGluZWQKPj4+ICvCoMKgwqDCoCAqIG1v
dmUuCj4+PiArwqDCoMKgwqAgKi8KPj4+ICvCoMKgwqAgcmV0ID0gdHRtX2JvX3ZtX2ZhdWx0X2lk
bGUoYm8sIHZtZik7Cj4+PiArwqDCoMKgIGlmICh1bmxpa2VseShyZXQgIT0gMCkpCj4+PiArwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+ICsKPj4+ICvCoMKgwqAgLyogQWxsb2NhdGUgbmV3
IGR1bW15IHBhZ2UgdG8gbWFwIGFsbCB0aGUgVkEgcmFuZ2UgaW4gdGhpcyBWTUEgdG8gaXQqLwo+
Pj4gK8KgwqDCoCBwYWdlID0gYWxsb2NfcGFnZShHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7Cj4+
PiArwqDCoMKgIGlmICghcGFnZSkKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gVk1fRkFVTFRf
T09NOwo+Pj4gKwo+Pj4gK8KgwqDCoCBwZm4gPSBwYWdlX3RvX3BmbihwYWdlKTsKPj4+ICsKPj4+
ICvCoMKgwqAgLyoKPj4+ICvCoMKgwqDCoCAqIFByZWZhdWx0IHRoZSBlbnRpcmUgVk1BIHJhbmdl
IHJpZ2h0IGF3YXkgdG8gYXZvaWQgZnVydGhlciBmYXVsdHMKPj4+ICvCoMKgwqDCoCAqLwo+Pj4g
K8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgbnVtX3ByZWZhdWx0OyArK2kpIHsKPj4+ICsKPj4+ICvC
oMKgwqDCoMKgwqDCoCBpZiAodW5saWtlbHkoYWRkcmVzcyA+PSB2bWEtPnZtX2VuZCkpCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCBp
ZiAodm1hLT52bV9mbGFncyAmIFZNX01JWEVETUFQKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0ID0gdm1mX2luc2VydF9taXhlZF9wcm90KHZtYSwgYWRkcmVzcywKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19wZm5fdG9f
cGZuX3QocGZuLCBQRk5fREVWKSwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJvdCk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZWxzZQo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gdm1mX2luc2VydF9wZm5fcHJvdCh2bWEs
IGFkZHJlc3MsIHBmbiwgcHJvdCk7Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAgLyogTmV2ZXIg
ZXJyb3Igb24gcHJlZmF1bHRlZCBQVEVzICovCj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHVubGlr
ZWx5KChyZXQgJiBWTV9GQVVMVF9FUlJPUikpKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoaSA9PSAwKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
Vk1fRkFVTFRfTk9QQUdFOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+ICvCoMKgwqDCoMKgwqDCoCB9
Cj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqAgYWRkcmVzcyArPSBQQUdFX1NJWkU7Cj4+PiArwqDC
oMKgIH0KPj4+ICsKPj4+ICvCoMKgwqAgLyogU2V0IHRoZSBwYWdlIHRvIGJlIGZyZWVkIHVzaW5n
IGRybW0gcmVsZWFzZSBhY3Rpb24gKi8KPj4+ICvCoMKgwqAgaWYgKGRybW1fYWRkX2FjdGlvbl9v
cl9yZXNldChkZGV2LCB0dG1fYm9fcmVsZWFzZV9kdW1teV9wYWdlLCBwYWdlKSkKPj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gVk1fRkFVTFRfT09NOwo+Pj4gKwo+Pj4gK8KgwqDCoCByZXR1cm4g
cmV0Owo+Pj4gK30KPj4+ICtFWFBPUlRfU1lNQk9MKHR0bV9ib192bV9kdW1teV9wYWdlKTsKPj4g
SSB0aGluayB3ZSBjYW4gbGlmdCB0aGlzIGVudGlyZSB0aGluZyAob25jZSB0aGUgdHRtX2JvX3Zt
X2ZhdWx0X2lkbGUgaXMKPj4gZ29uZSkgdG8gdGhlIGRybSBsZXZlbCwgc2luY2Ugbm90aGluZyB0
dG0gc3BlY2lmaWMgaW4gaGVyZS4gUHJvYmFibHkgc3R1ZmYKPj4gaXQgaW50byBkcm1fZ2VtLmMg
KGJ1dCByZWFsbHkgaXQncyBub3QgZXZlbiBnZW0gc3BlY2lmaWMsIGl0J3MgZnVsbHkKPj4gZ2Vu
ZXJpYyAicmVwbGFjZSB0aGlzIHZtYSB3aXRoIGR1bW15IHBhZ2VzIHBscyIgZnVuY3Rpb24uCj4K
Pgo+IE9uY2UgSSBzdGFydGVkIHdpdGggdGhpcyBJIG5vdGljZWQgdGhhdCBkcm1tX2FkZF9hY3Rp
b25fb3JfcmVzZXQgZGVwZW5kcwo+IG9uIHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gYm8tPmJh
c2UuZGV2wqAgYW5kIGJvIGlzIHRoZSBwcml2YXRlIGRhdGEKPiB3ZSBlbWJlZCBhdCB0aGUgVFRN
IGxldmVsIHdoZW4gc2V0dGluZyB1cCB0aGUgbWFwcGluZyBhbmQgc28gdGhpcyBmb3JjZXMKPiB0
byBtb3ZlIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldCBvdXQgb2YgdGhpcyBmdW5jdGlvbiB0byBl
dmVyeSBjbGllbnQgd2hvIHVzZXMKPiB0aGlzIGZ1bmN0aW9uLCBhbmQgdGhlbiB5b3Ugc2VwYXJh
dGUgdGhlIGxvZ2ljIG9mIHBhZ2UgYWxsb2NhdGlvbiBmcm9tIGl0J3MgCj4gcmVsZWFzZS4KPiBT
byBJIHN1Z2dlc3Qgd2Uga2VlcCBpdCBhcyBpcy4KPgo+IEFuZHJleQo+Cj4KPj4KPj4gQXNpZGUg
ZnJvbSB0aGlzIG5pdCBJIHRoaW5rIHRoZSBvdmVyYWxsIGFwcHJvYWNoIHlvdSBoYXZlIGhlcmUg
aXMgc3RhcnRpbmcKPj4gdG8gbG9vayBnb29kLiBMb3RzIG9mIHdvcmsmcG9saXNoLCBidXQgaW1v
IHdlJ3JlIGdldHRpbmcgdGhlcmUgYW5kIGNhbgo+PiBzdGFydCBsYW5kaW5nIHN0dWZmIHNvb24u
Cj4+IC1EYW5pZWwKPj4KPj4+ICsKPj4+IMKgIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0KHN0
cnVjdCB2bV9mYXVsdCAqdm1mKQo+Pj4gwqAgewo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSA9IHZtZi0+dm1hOwo+Pj4gwqDCoMKgwqDCoCBwZ3Byb3RfdCBwcm90Owo+
Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gdm1hLT52bV9wcml2
YXRlX2RhdGE7Cj4+PiArwqDCoMKgIHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gYm8tPmJhc2Uu
ZGV2Owo+Pj4gwqDCoMKgwqDCoCB2bV9mYXVsdF90IHJldDsKPj4+ICvCoMKgwqAgaW50IGlkeDsK
Pj4+IMKgIMKgwqDCoMKgwqAgcmV0ID0gdHRtX2JvX3ZtX3Jlc2VydmUoYm8sIHZtZik7Cj4+PiDC
oMKgwqDCoMKgIGlmIChyZXQpCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+
IMKgIMKgwqDCoMKgwqAgcHJvdCA9IHZtYS0+dm1fcGFnZV9wcm90Owo+Pj4gLcKgwqDCoCByZXQg
PSB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQodm1mLCBwcm90LCBUVE1fQk9fVk1fTlVNX1BSRUZB
VUxULCAxKTsKPj4+ICvCoMKgwqAgaWYgKGRybV9kZXZfZW50ZXIoZGRldiwgJmlkeCkpIHsKPj4+
ICvCoMKgwqDCoMKgwqDCoCByZXQgPSB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQodm1mLCBwcm90
LCBUVE1fQk9fVk1fTlVNX1BSRUZBVUxULCAxKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBkcm1fZGV2
X2V4aXQoaWR4KTsKPj4+ICvCoMKgwqAgfSBlbHNlIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXQg
PSB0dG1fYm9fdm1fZHVtbXlfcGFnZSh2bWYsIHByb3QpOwo+Pj4gK8KgwqDCoCB9Cj4+PiDCoMKg
wqDCoMKgIGlmIChyZXQgPT0gVk1fRkFVTFRfUkVUUlkgJiYgISh2bWYtPmZsYWdzICYgRkFVTFRf
RkxBR19SRVRSWV9OT1dBSVQpKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+
PiDCoCDCoMKgwqDCoMKgIGRtYV9yZXN2X3VubG9jayhiby0+YmFzZS5yZXN2KTsKPj4+IMKgIMKg
wqDCoMKgwqAgcmV0dXJuIHJldDsKPj4+ICsKPj4+ICvCoMKgwqAgcmV0dXJuIHJldDsKPj4+IMKg
IH0KPj4+IMKgIEVYUE9SVF9TWU1CT0wodHRtX2JvX3ZtX2ZhdWx0KTsKPj4+IMKgIGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9i
b19hcGkuaAo+Pj4gaW5kZXggZTE3YmUzMi4uMTJmYjI0MCAxMDA2NDQKPj4+IC0tLSBhL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKPj4+ICsrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9f
YXBpLmgKPj4+IEBAIC02NDMsNCArNjQzLDYgQEAgdm9pZCB0dG1fYm9fdm1fY2xvc2Uoc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEpOwo+Pj4gwqAgaW50IHR0bV9ib192bV9hY2Nlc3Moc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgdm9pZCAqYnVmLCBpbnQgbGVuLCBpbnQgd3JpdGUpOwo+Pj4gwqAg
K3ZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2R1bW15X3BhZ2Uoc3RydWN0IHZtX2ZhdWx0ICp2bWYsIHBn
cHJvdF90IHByb3QpOwo+Pj4gKwo+Pj4gwqAgI2VuZGlmCj4+PiAtLSAKPj4+IDIuNy40Cj4+Pgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
