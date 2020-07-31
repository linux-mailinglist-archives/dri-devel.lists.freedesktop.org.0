Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91342234679
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D439B6EA90;
	Fri, 31 Jul 2020 13:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAE16EA90
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:04:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOhF4ZUggQnmfxQcwhnDaEaWMvgZpdhS3zc4b6RGfncR97N7jWEAYrzOH6a62UXbcfGW5e/RIjy0cOtzAWGsuOGm5JSwLHoLXIclmXpuxRRN2b/oWZgFafEQGITJeSL7H3NSlKxz3F63D1FERsjjZQHDRPCm7t2Gj0e0ZDIleeVUA5w7CZNwtwrdOakhk6up3rj5UtmWxXTvcR/kb6ZRP/+IMKW+xu+ho6IOefh7CSV/QK+SfvfFxdK77kLauynzYH1YA26nweSAKR3ZEBoMtLHUqJ7mFC8St3e7AWm1LqdmJxJOzp3EtUefDXOKnL50SUNeLCmmROePXQWpcTna1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq3PIAUTz0FyKM20HWe/O5uWrDDv8NPxkNciT6OtSBU=;
 b=RhEwnVJW9RMJ4NSIioduiu3DtXUEozsyMN0Ux/0qwpcpu5GT+JD7fpGHZX22CxRHYTHsq4O5HdGg7rBFcR4Qd5FlUXYUnKbQV8Mj3U0bvNEvvLQFIc/puVzsWbgAVZX8Ng7Va1l2VhITzmiW8qx+07dwTNepKlVlboZ2VA9eeBBGuG4bdqEwaegx+Q1l7L98cVdbusMYFcecrqZmHT4MpiQa6RtHlUVGmhR6pK4qGj2stEZFMD3R2x+UQsa/wOvsppgdtNhIfDf0ody2sYpTUsN9ql06Re+x+jtcNdp/7kFUE9sC74qLXlZWfZp6b230X+0o2n1swakOUoC/htT+Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq3PIAUTz0FyKM20HWe/O5uWrDDv8NPxkNciT6OtSBU=;
 b=yC8QL7YvS4mW89KSyNkTtgPQ7eol6+DxBw6IX92vGsojyt+HX6V7CZ5Kno2BKjpnt6o6VqC9z5rZcYOgOChusWOGQlgAgE04/m+KU4N5XrWV4K4xv35GdYFWFlQNNJ2DEm3aioXZPHhl4g4o33gKJpviGAl6OZ/R0Yae+BZ8Q10=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 13:04:39 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:04:39 +0000
Subject: Re: [PATCH 14/49] drm/ttm: pass man around instead of mem_type in
 some places
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-15-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3b52ef85-de86-44ef-04f7-f9335271d0fd@amd.com>
Date: Fri, 31 Jul 2020 15:04:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-15-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0501CA0062.eurprd05.prod.outlook.com
 (2603:10a6:200:68::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0501CA0062.eurprd05.prod.outlook.com (2603:10a6:200:68::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Fri, 31 Jul 2020 13:04:37 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ccf3a630-632e-441b-5cbe-08d835524834
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4390CA98380A62715B808387834E0@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E4/EPyRiJXahpST3R3Nh1Ai47vhlFbrcgrC5upNGZOGiGp3KoPvKarMRICoYQUx+8gxTfL8EvsPixX5wA599QmlQ9j9eC420KP343wGcZj9ezmU6aE8qyelR5+mjyXl5hn+MH6LofgnPQJ6YAopkA0Wnwk2SWhOhP/Uue8DnN851LUOwderZT2CW5MpNpIV1+9gT9NYg7vparAv1tyw0pbeEP0CmaS3xlhCBl9KQJYYki9FLdxpX3XXY2VHxjZw4/wPmmCb3nGjMvF4zOVHQuaNF312XQYJTDUovuL10pcm1bXregtloL1jABR8hOMLP0JmOExlIp4A0SFiXEo85POX4BC8UnHHrT05mPI8Zmz/fZ/bAvwm/s7f4q5pA6z4z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(6486002)(52116002)(2616005)(66476007)(316002)(4326008)(478600001)(66946007)(36756003)(86362001)(66556008)(66574015)(16526019)(186003)(31696002)(5660300002)(83380400001)(8936002)(2906002)(8676002)(6666004)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 367ssUkAJP4gwLizGtLmzFvGUxwgz2+absEDCA1Uyay4Umm7GQb/twjn0K/2y9c8yGT4M4Gn2wdffNjD9MRFIhc1jOYrJ/e6DWVEjTqKuU9k1a86fdBGzGSqLltEX8PvVxE15ZEV1sceNjC2yPtIHchFHO3l+Rrxo+kvtL6XePeRWI+GH0+iqWUBpAi2mb0Lrfm2+hbhAqE5ZFREamjYWPdIqvGLPHw08894SmxUrxm9aVumb/Ge7FCeBVa0/f1agKAXgIi/DyULj2oXoaQ4S1BvhUQuVaX1IElSXT1obVUAPMmOcB1Dr2NMmG8DbhF6TvB0VY3rxjUZxUWiEHTH1DMTgm0M6iAgueR7hboXbUxluJ77UY5uBk54UIrhsqR3Fh7NRuqNw+KvymypY9QYxcsKMbNkjgkP65hCc9ybrZmEwxR9fClmykAIDbja2hwdXxPKDtNILZC0nbdwuJ0QoIKlnNk3YgQKtLYgIcvj5ltSnS31Z7f/yP0iocmffINQBtcBAwXPWbWvDTWtcnhxMrvFEQlbjn57AiMbplNUCHslW+NMdvWciXkCw1UPbbppVxSpDwdOW6CbdjH9QONrscTfUMrv4aXEijhO9Y8p+GSYNipHh482D4HtOfDIxuouiFjwyLZrvxQBPgZ50XIxlDayWnHgrgwUEYKIutjlAo0XikJDpDuOiewuKnAGsu13QtTfFR3Hk9jw3zrEiMS77Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf3a630-632e-441b-5cbe-08d835524834
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:04:39.4502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNhUVSmOW5FS8Z90Tb5L4597l38rct3qKxA8Er74nfR7JRXPLsL03yVXZ9ZBBTKJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMjAgdW0gMDY6MDQgc2NocmllYiBEYXZlIEFpcmxpZToKPiBGcm9tOiBEYXZlIEFp
cmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+Cj4gVGhpcyBtYWtlcyBpdCBlYXNpZXIgdG8gY2xl
YW51cCB0aGluZ3MKPgo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhh
dC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAxNCArKysr
KystLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IDEwMWE3OTEwZjlmNy4uODRlMzk5Mzk1
ZTRmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTc2MywxMyArNzYzLDEyIEBAIHN0YXRp
YyBpbnQgdHRtX21lbV9ldmljdF93YWl0X2J1c3koc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
dXN5X2JvLAo+ICAgfQo+ICAgCj4gICBzdGF0aWMgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4gLQkJCSAgICAgICB1aW50MzJfdCBtZW1fdHlwZSwK
PiArCQkJICAgICAgIHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLAo+ICAgCQkJICAg
ICAgIGNvbnN0IHN0cnVjdCB0dG1fcGxhY2UgKnBsYWNlLAo+ICAgCQkJICAgICAgIHN0cnVjdCB0
dG1fb3BlcmF0aW9uX2N0eCAqY3R4LAo+ICAgCQkJICAgICAgIHN0cnVjdCB3d19hY3F1aXJlX2N0
eCAqdGlja2V0KQo+ICAgewo+ICAgCXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSBOVUxM
LCAqYnVzeV9ibyA9IE5VTEw7Cj4gLQlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9
ICZiZGV2LT5tYW5bbWVtX3R5cGVdOwo+ICAgCWJvb2wgbG9ja2VkID0gZmFsc2U7Cj4gICAJdW5z
aWduZWQgaTsKPiAgIAlpbnQgcmV0Owo+IEBAIC05MTgsNyArOTE3LDcgQEAgc3RhdGljIGludCB0
dG1fYm9fbWVtX2ZvcmNlX3NwYWNlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJ
CQlicmVhazsKPiAgIAkJaWYgKHVubGlrZWx5KHJldCAhPSAtRU5PU1BDKSkKPiAgIAkJCXJldHVy
biByZXQ7Cj4gLQkJcmV0ID0gdHRtX21lbV9ldmljdF9maXJzdChiZGV2LCBtZW0tPm1lbV90eXBl
LCBwbGFjZSwgY3R4LAo+ICsJCXJldCA9IHR0bV9tZW1fZXZpY3RfZmlyc3QoYmRldiwgbWFuLCBw
bGFjZSwgY3R4LAo+ICAgCQkJCQkgIHRpY2tldCk7Cj4gICAJCWlmICh1bmxpa2VseShyZXQgIT0g
MCkpCj4gICAJCQlyZXR1cm4gcmV0Owo+IEBAIC0xNDAzLDE0ICsxNDAyLDEzIEBAIGludCB0dG1f
Ym9fY3JlYXRlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ICAgRVhQT1JUX1NZTUJPTCh0
dG1fYm9fY3JlYXRlKTsKPiAgIAo+ICAgc3RhdGljIGludCB0dG1fYm9fZm9yY2VfbGlzdF9jbGVh
bihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiAtCQkJCSAgIHVuc2lnbmVkIG1lbV90eXBl
KQo+ICsJCQkJICAgc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4pCj4gICB7Cj4gICAJ
c3RydWN0IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsKPiAgIAkJLmludGVycnVwdGlibGUgPSBm
YWxzZSwKPiAgIAkJLm5vX3dhaXRfZ3B1ID0gZmFsc2UsCj4gICAJCS5mbGFncyA9IFRUTV9PUFRf
RkxBR19GT1JDRV9BTExPQwo+ICAgCX07Cj4gLQlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIg
Km1hbiA9ICZiZGV2LT5tYW5bbWVtX3R5cGVdOwo+ICAgCXN0cnVjdCB0dG1fYm9fZ2xvYmFsICpn
bG9iID0gJnR0bV9ib19nbG9iOwo+ICAgCXN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlOwo+ICAgCWlu
dCByZXQ7Cj4gQEAgLTE0MjQsNyArMTQyMiw3IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2ZvcmNlX2xp
c3RfY2xlYW4oc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4gICAJZm9yIChpID0gMDsgaSA8
IFRUTV9NQVhfQk9fUFJJT1JJVFk7ICsraSkgewo+ICAgCQl3aGlsZSAoIWxpc3RfZW1wdHkoJm1h
bi0+bHJ1W2ldKSkgewo+ICAgCQkJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsKPiAtCQkJ
cmV0ID0gdHRtX21lbV9ldmljdF9maXJzdChiZGV2LCBtZW1fdHlwZSwgTlVMTCwgJmN0eCwKPiAr
CQkJcmV0ID0gdHRtX21lbV9ldmljdF9maXJzdChiZGV2LCBtYW4sIE5VTEwsICZjdHgsCj4gICAJ
CQkJCQkgIE5VTEwpOwo+ICAgCQkJaWYgKHJldCkKPiAgIAkJCQlyZXR1cm4gcmV0Owo+IEBAIC0x
NDY5LDcgKzE0NjcsNyBAQCBpbnQgdHRtX2JvX2NsZWFuX21tKHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LCB1bnNpZ25lZCBtZW1fdHlwZSkKPiAgIAo+ICAgCXJldCA9IDA7Cj4gICAJaWYgKG1l
bV90eXBlID4gMCkgewo+IC0JCXJldCA9IHR0bV9ib19mb3JjZV9saXN0X2NsZWFuKGJkZXYsIG1l
bV90eXBlKTsKPiArCQlyZXQgPSB0dG1fYm9fZm9yY2VfbGlzdF9jbGVhbihiZGV2LCBtYW4pOwo+
ICAgCQlpZiAocmV0KSB7Cj4gICAJCQlwcl9lcnIoIkNsZWFudXAgZXZpY3Rpb24gZmFpbGVkXG4i
KTsKPiAgIAkJCXJldHVybiByZXQ7Cj4gQEAgLTE0OTksNyArMTQ5Nyw3IEBAIGludCB0dG1fYm9f
ZXZpY3RfbW0oc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHVuc2lnbmVkIG1lbV90eXBlKQo+
ICAgCQlyZXR1cm4gMDsKPiAgIAl9Cj4gICAKPiAtCXJldHVybiB0dG1fYm9fZm9yY2VfbGlzdF9j
bGVhbihiZGV2LCBtZW1fdHlwZSk7Cj4gKwlyZXR1cm4gdHRtX2JvX2ZvcmNlX2xpc3RfY2xlYW4o
YmRldiwgbWFuKTsKPiAgIH0KPiAgIEVYUE9SVF9TWU1CT0wodHRtX2JvX2V2aWN0X21tKTsKPiAg
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
