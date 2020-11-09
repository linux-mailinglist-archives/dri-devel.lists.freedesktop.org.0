Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB892AC604
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 21:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483CA8926B;
	Mon,  9 Nov 2020 20:35:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770077.outbound.protection.outlook.com [40.107.77.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218238926B;
 Mon,  9 Nov 2020 20:34:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPY0yv373pGRbQ02sy3dV89NNwyYjA2EcuBONoP7gJl2V4fgE5xD3osPGYXehX2fWlrCM3BjWHhsIlGZ8nWKjQAOWo6gUv9Vgbi9MSbDxa0DVEAVf/mWSYezlI4hLZ0XhZcWEP7l+5cMmlnmm2Yhgn2EDQDOnoPDoZh+ephyLoaSS0sluU1ZZ4s23Oj2OoiIvH8umQY5kQgmP+k+POw9ac26qPL/UGhnUnH18IxknlbuqwQrKdbBAgfMntahXf9/Ouvh9tqnhU/AE3rOEgkoVoW2vvp6IKB4LgP+6Hw3yGmMqqHzr5oyLnBZNR+5apPMsyKv9NJ14KZgryQ744POvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar6uPIOpW+0VRy/dcToE1Gi/8Hwmgx4Wvcjs4EjyYUQ=;
 b=Wz1TMhKs0a1c4g9xJyGU4LhN+f6yKYkxgDtINpgT2Y3ER5RSQeBGRXUeuL8c6cp/PWd05zmaXkTrQNuAqayA+WqXZDHWP8hyjAhNWTm+CxQLsLqjR2Aa8gvfIe1w8axbYibrkQrEruvPT0BcKuZ5OU/2e3gkfa7ogRuTcDauf1iHF/LIxfm4Ol2ROM4rLELSXEqpiTDViyVC25YTJ/xAEj+3nmsYPpGRZYcCK7hhKXPZOEXu6I70lC/Fg72MA0SlwmwJe/PfvcvZMM50ef6CLqRtVMxdtqH+ek4GxpiICuEvCuPVmAsMecn6Kw+nPFc9KMA9ZkbDEiKUqeRn2N0eNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ar6uPIOpW+0VRy/dcToE1Gi/8Hwmgx4Wvcjs4EjyYUQ=;
 b=ezdeWlrHtHlYNlyS9GsQ3tLWLEFblde9oT30ageChjAPxNnWH2/GxA98uhqana88JvGc0ugHaVr3E4yaDtIf2NZPcirLuZnxBSmzbvMB1Ib5eKje4Xkx3fugeO8LoivSwjcaA77Ayzp+s424hqq9PxiSLXTFdLcgiVrHIlI1FLw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM5PR12MB1147.namprd12.prod.outlook.com (2603:10b6:3:79::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.22; Mon, 9 Nov 2020 20:34:57 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::a881:155d:45db:b435%9]) with mapi id 15.20.3541.021; Mon, 9 Nov 2020
 20:34:57 +0000
Subject: Re: [PATCH v2 1/8] drm: Add dummy page per device or GEM object
To: Daniel Vetter <daniel@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-2-git-send-email-andrey.grodzovsky@amd.com>
 <20200622093501.GZ20149@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <7ef61f70-bb82-09ff-a041-6d34d0297385@amd.com>
Date: Mon, 9 Nov 2020 15:34:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200622093501.GZ20149@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:757a:f239:6b01:6396]
X-ClientProxiedBy: YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::45) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:757a:f239:6b01:6396]
 (2607:fea8:3edf:49b0:757a:f239:6b01:6396) by
 YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::45) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 20:34:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 762605f8-4c66-4626-ab4a-08d884eeebed
X-MS-TrafficTypeDiagnostic: DM5PR12MB1147:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1147BBF2D57EFF216CAF5AE0EAEA0@DM5PR12MB1147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fi4elZqvwbEYOOnahDJ75cwdHfuxtdBCCWEhmlIlpRCvlSNURHHjdkFSNSMktleZ3Sqs8t1gjBpRKk8bjJbgTGMww81pu2h1FlHWI7inAy6IeTfxSrgp9OMSMjbJ1woDlOhOa2/ZKHj0J82c1GtPqBR6yBeM3O7SDIoDfLNfs4fnGfE3l4B1q1Zof248NSBNW6VEnsV73ifqMgkF+4A8xxve6yWOL9sajOPsAkJ+XeQfUsvhQFTuxAMy2ArHlSRnPxwnGIzChAyFqJfyRscBwkTV0wYCj6kFEuQ/URJkhRcjvB0YPG+MiWKrdaOHxmtkziTrA11LPBa2TQ3W7aKSwibxLiNzX/WiEhwohdSY7A2tVXpB2NR4p/zbIjfWwFQx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(66946007)(66556008)(66476007)(5660300002)(478600001)(8936002)(86362001)(83380400001)(6486002)(52116002)(6916009)(53546011)(8676002)(2616005)(316002)(4326008)(31686004)(36756003)(31696002)(2906002)(16526019)(186003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WC90cjdTMzFHVGlncjlzcWtWbU54eFNkMHl0RXZWdjh4c2tUeTc1ZWUwMVZY?=
 =?utf-8?B?eTdJd1lQUng3ZzdmZ3QrRS9oTnhBQ3RRQlBpNXJwaXVaWGVYTk9LSmJ2eGVh?=
 =?utf-8?B?YkJyTUJobzJLVHdpT3lqby9kN2I1dDFYUkJzOWk4U1hXeUdmb3hxc1dEUmsv?=
 =?utf-8?B?dmxhUmtGYlB2NWhaTml4VlVSVFdJYWdnd3Yzd25YVjlVUXRHWlc5TkdYeWpr?=
 =?utf-8?B?Z1kySEtsZU9TdlhqWjdIMWFMRU50N1JZUTlXRTdwM2g4Z3U0SUpVRGc5RmpS?=
 =?utf-8?B?NkVPRkxMVVhzVllQamJyWEZYNUV5YytiTlJQb2VMY1BlbC9ES1k0YURXN2Ny?=
 =?utf-8?B?V0dsYmhCQlU2NGx2SktqWHdMMUcxV2dubVJRQTRxbldrVk5EQytoTUZGMnJx?=
 =?utf-8?B?bElTVXR1a2xsQ0JFZXo2QWtDaklZN21welcwS3lpKzIwYldKSXltMzk2Yjhh?=
 =?utf-8?B?UTNjV1NKNGhJazc4bXp6NnBVdWlBcFduV1RoRGtBQmU4WUxlL1UvVlhkUWtv?=
 =?utf-8?B?OUJXOVgwN245WVM2K25CQy9nVzlWYk9zdGxvdGpoNStlTE9GMVNtOHo5d2hV?=
 =?utf-8?B?dWNWTzh3aFZ4TUVTREIrQ0o1OGZ4NlpHRmZpbzFSN09iWVRMVlprQTZpUUVE?=
 =?utf-8?B?ODkrVDkzdUxUK3ZkU0kvYjlkdkFCSnloOE4rV09UQWVjRTNzNmI1c29mZXhD?=
 =?utf-8?B?VnU1b2hSS001NnprV1JodjBUK2ZJZEt0VGpEa1grTXYxZDJhZGR5bUJpVjJ4?=
 =?utf-8?B?V3pxRDFnemV1Zmd1djUwb1o4WEFZbjcySFRoZmQ3SGZNOGZlVzBsY1VSS3dU?=
 =?utf-8?B?RlhOT0N5empWeUxKY09hMXdMZER2cE9hNnIrOTZ2OFpPWEtxUFFFdlM0ZUh5?=
 =?utf-8?B?ODhONlRYUmx4TmlNNGtuNzIzamQyVU01YnJMbFI5NnJIMDh3cWhFOXdYcDY0?=
 =?utf-8?B?OWNLQVhWc2lacmVhTExzTGI2MzZLeUNlR0hxdGNZWjVzaE8yQ0xZS3g1dmVm?=
 =?utf-8?B?Q3hmNXQza05JaGxoeDRvTklFODNYeC9XN1FuS3N6UnUxWjUzaW12K2tVNUZa?=
 =?utf-8?B?SjNXQ0F1dU1ZZGZGT09sYllJaFNacUZ5dHU1VlMxM2VyMWlKNHN6SWkyNEkv?=
 =?utf-8?B?ZHRuYzl4MEVLMGxzdjVPTWVjQkk2YzdQQ3VKZm55NXdJOGhzMVBvbFprNDAy?=
 =?utf-8?B?UTVuU2w1ZGkrMDFYNXY2R29nSmp2SkhIRTNTZTRmL0E5QU9VRENaNEpRWkZo?=
 =?utf-8?B?V2tnR0FTMGRJSGNHUjJmMFNQK0pSZ2RpMXFUU3VGcmErK2FXZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762605f8-4c66-4626-ab4a-08d884eeebed
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4340.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 20:34:56.9942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQyPfAQqiOp7pmDPkTODKP+nwtdQMTBVVncPDazV0s/HXHYM8X+Ei7dzCYbef5YDPM2o9mDt5nZUOpttRmXa6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1147
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDYvMjIvMjAgNTozNSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBTdW4sIEp1biAy
MSwgMjAyMCBhdCAwMjowMzowMUFNIC0wNDAwLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90ZToKPj4g
V2lsbCBiZSB1c2VkIHRvIHJlcm91dGUgQ1BVIG1hcHBlZCBCTydzIHBhZ2UgZmF1bHRzIG9uY2UK
Pj4gZGV2aWNlIGlzIHJlbW92ZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92
c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2ZpbGUuYyAgfCAgOCArKysrKysrKwo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJp
bWUuYyB8IDEwICsrKysrKysrKysKPj4gICBpbmNsdWRlL2RybS9kcm1fZmlsZS5oICAgICAgfCAg
MiArKwo+PiAgIGluY2x1ZGUvZHJtL2RybV9nZW0uaCAgICAgICB8ICAyICsrCj4+ICAgNCBmaWxl
cyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZpbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCj4+IGluZGV4IGM0
YzcwNGUuLjY3YzA3NzAgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5j
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jCj4+IEBAIC0xODgsNiArMTg4LDEy
IEBAIHN0cnVjdCBkcm1fZmlsZSAqZHJtX2ZpbGVfYWxsb2Moc3RydWN0IGRybV9taW5vciAqbWlu
b3IpCj4+ICAgCQkJZ290byBvdXRfcHJpbWVfZGVzdHJveTsKPj4gICAJfQo+PiAgIAo+PiArCWZp
bGUtPmR1bW15X3BhZ2UgPSBhbGxvY19wYWdlKEdGUF9LRVJORUwgfCBfX0dGUF9aRVJPKTsKPj4g
KwlpZiAoIWZpbGUtPmR1bW15X3BhZ2UpIHsKPj4gKwkJcmV0ID0gLUVOT01FTTsKPj4gKwkJZ290
byBvdXRfcHJpbWVfZGVzdHJveTsKPj4gKwl9Cj4+ICsKPj4gICAJcmV0dXJuIGZpbGU7Cj4+ICAg
Cj4+ICAgb3V0X3ByaW1lX2Rlc3Ryb3k6Cj4+IEBAIC0yODQsNiArMjkwLDggQEAgdm9pZCBkcm1f
ZmlsZV9mcmVlKHN0cnVjdCBkcm1fZmlsZSAqZmlsZSkKPj4gICAJaWYgKGRldi0+ZHJpdmVyLT5w
b3N0Y2xvc2UpCj4+ICAgCQlkZXYtPmRyaXZlci0+cG9zdGNsb3NlKGRldiwgZmlsZSk7Cj4+ICAg
Cj4+ICsJX19mcmVlX3BhZ2UoZmlsZS0+ZHVtbXlfcGFnZSk7Cj4+ICsKPj4gICAJZHJtX3ByaW1l
X2Rlc3Ryb3lfZmlsZV9wcml2YXRlKCZmaWxlLT5wcmltZSk7Cj4+ICAgCj4+ICAgCVdBUk5fT04o
IWxpc3RfZW1wdHkoJmZpbGUtPmV2ZW50X2xpc3QpKTsKPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fcHJpbWUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+PiBpbmRl
eCAxZGUyY2RlLi5jNDgyZTljIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3By
aW1lLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4+IEBAIC0zMzUsNiAr
MzM1LDEzIEBAIGludCBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZShzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2LAo+PiAgIAo+PiAgIAlyZXQgPSBkcm1fcHJpbWVfYWRkX2J1Zl9oYW5kbGUoJmZpbGVf
cHJpdi0+cHJpbWUsCj4+ICAgCQkJZG1hX2J1ZiwgKmhhbmRsZSk7Cj4+ICsKPj4gKwlpZiAoIXJl
dCkgewo+PiArCQlvYmotPmR1bW15X3BhZ2UgPSBhbGxvY19wYWdlKEdGUF9LRVJORUwgfCBfX0dG
UF9aRVJPKTsKPj4gKwkJaWYgKCFvYmotPmR1bW15X3BhZ2UpCj4+ICsJCQlyZXQgPSAtRU5PTUVN
Owo+PiArCX0KPj4gKwo+PiAgIAltdXRleF91bmxvY2soJmZpbGVfcHJpdi0+cHJpbWUubG9jayk7
Cj4+ICAgCWlmIChyZXQpCj4+ICAgCQlnb3RvIGZhaWw7Cj4+IEBAIC0xMDA2LDYgKzEwMTMsOSBA
QCB2b2lkIGRybV9wcmltZV9nZW1fZGVzdHJveShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwg
c3RydWN0IHNnX3RhYmxlICpzZykKPj4gICAJCWRtYV9idWZfdW5tYXBfYXR0YWNobWVudChhdHRh
Y2gsIHNnLCBETUFfQklESVJFQ1RJT05BTCk7Cj4+ICAgCWRtYV9idWYgPSBhdHRhY2gtPmRtYWJ1
ZjsKPj4gICAJZG1hX2J1Zl9kZXRhY2goYXR0YWNoLT5kbWFidWYsIGF0dGFjaCk7Cj4+ICsKPj4g
KwlfX2ZyZWVfcGFnZShvYmotPmR1bW15X3BhZ2UpOwo+PiArCj4+ICAgCS8qIHJlbW92ZSB0aGUg
cmVmZXJlbmNlICovCj4+ICAgCWRtYV9idWZfcHV0KGRtYV9idWYpOwo+PiAgIH0KPj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9maWxlLmggYi9pbmNsdWRlL2RybS9kcm1fZmlsZS5oCj4+
IGluZGV4IDE5ZGY4MDIuLjM0OWE2NTggMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9m
aWxlLmgKPj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaAo+PiBAQCAtMzM1LDYgKzMzNSw4
IEBAIHN0cnVjdCBkcm1fZmlsZSB7Cj4+ICAgCSAqLwo+PiAgIAlzdHJ1Y3QgZHJtX3ByaW1lX2Zp
bGVfcHJpdmF0ZSBwcmltZTsKPj4gICAKPiBLZXJuZWxkb2MgZm9yIHRoZXNlIHBsZWFzZSwgaW5j
bHVkaW5nIHdoeSB3ZSBuZWVkIHRoZW0gYW5kIHdoZW4uIEUuZy4gdGhlCj4gb25lIGluIGdlbV9i
byBzaG91bGQgc2F5IGl0J3Mgb25seSBmb3IgZXhwb3J0ZWQgYnVmZmVycywgc28gdGhhdCB3ZSdy
ZSBub3QKPiBjb2xsaWRpbmcgc2VjdXJpdHkgc3BhY2VzLgo+Cj4+ICsJc3RydWN0IHBhZ2UgKmR1
bW15X3BhZ2U7Cj4+ICsKPj4gICAJLyogcHJpdmF0ZTogKi8KPj4gICAjaWYgSVNfRU5BQkxFRChD
T05GSUdfRFJNX0xFR0FDWSkKPj4gICAJdW5zaWduZWQgbG9uZyBsb2NrX2NvdW50OyAvKiBEUkkx
IGxlZ2FjeSBsb2NrIGNvdW50ICovCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2Vt
LmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtLmgKPj4gaW5kZXggMGIzNzUwNi4uNDc0NjBkMSAxMDA2
NDQKPj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oCj4+ICsrKyBiL2luY2x1ZGUvZHJtL2Ry
bV9nZW0uaAo+PiBAQCAtMzEwLDYgKzMxMCw4IEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdCB7Cj4+
ICAgCSAqCj4+ICAgCSAqLwo+PiAgIAljb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3Mg
KmZ1bmNzOwo+PiArCj4+ICsJc3RydWN0IHBhZ2UgKmR1bW15X3BhZ2U7Cj4+ICAgfTsKPiBJIHRo
aW5rIGFtZGdwdSBkb2Vzbid0IGNhcmUsIGJ1dCBldmVyeW9uZSBlbHNlIHN0aWxsIG1pZ2h0IGNh
cmUgc29tZXdoYXQKPiBhYm91dCBmbGluay4gVGhhdCBhbHNvIHNoYXJlcyBidWZmZXJzLCBzbyBh
bHNvIG5lZWRzIHRvIGFsbG9jYXRlIHRoZQo+IHBlci1ibyBkdW1teSBwYWdlLgoKCkhpLCBiYWNr
IHRvIHRoaXMgdG9waWMgYWZ0ZXIgYSBsb25nIGNvbnRleHQgc3dpdGNoIGZvciBpbnRlcm5hbCBw
cm9qZWN0LgoKSSBkb24ndCBzZWUgd2h5IGZvciBGTElOSyB3ZSBjYW4ndCB1c2Ugc2FtZSBkdW1t
eSBwYWdlIGZyb20gc3RydWN0IApkcm1fZ2VtX29iamVjdCAtIGxvb2tpbmcKYXQgZHJtX2dlbV9m
bGlua19pb2N0bCBJIHNlZSB0aGF0IHRoZSB1bmRlcmx5aW5nIG9iamVjdCB3ZSBsb29rIHVwIGlz
IHN0aWxsIG9mIAp0eXBlIGRybV9nZW1fb2JqZWN0LgpXaHkgd2UgbmVlZCBwZXIgQk8gKFRUTSBC
T8KgIEkgYXNzdW1lPykgZHVtbXkgcGFnZSBmb3IgdGhpcyA/CgpBbmRyZXkKCgo+Cj4gSSBhbHNv
IHdvbmRlciB3aGV0aGVyIHdlIHNob3VsZG4ndCBoYXZlIGEgaGVscGVyIHRvIGxvb2sgdXAgdGhl
IGR1bW15Cj4gcGFnZSwganVzdCB0byBlbmNvZGUgaW4gY29yZSBjb2RlIGhvdyBpdCdzIHN1cHBv
c2VkbyB0byBjYXNjYWRlLgo+IC1EYW5pZWwKPgo+PiAgIAo+PiAgIC8qKgo+PiAtLSAKPj4gMi43
LjQKPj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
